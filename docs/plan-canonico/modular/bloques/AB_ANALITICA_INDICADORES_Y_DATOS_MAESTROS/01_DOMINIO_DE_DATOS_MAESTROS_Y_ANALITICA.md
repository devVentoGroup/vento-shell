### MINI-BLOQUE — DOMINIO DE DATOS MAESTROS Y ANALITICA

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **dominio de datos maestros y analitica** dentro de **AB ANALITICA INDICADORES Y DATOS MAESTROS**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `DATA-DOM-001` a `DATA-DOM-017` — 17 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Límites funcionales:** comienza con “Definir gobierno federado de datos, propietarios, stewards y fuentes de verdad” y concluye con “Definir versionado de métricas, restatements, correcciones históricas y reproducibilidad”.
<!-- PLAN-SECTION-META:END -->

### ✅ DATA-DOM-001 — Definir gobierno federado de datos, propietarios, stewards y fuentes de verdad

**Estado:** APROBADA
**Tarea anterior:** `INFO-INT-003 — Definir contratos con encargados, asesores, autoridades, proveedores y destinatarios externos` — APROBADA
**Tarea siguiente:** `DATA-DOM-002 — Definir catálogo de datos maestros, datos de referencia y dimensiones compartidas` — RESERVADA
**Tipo de tarea:** documental; definición normativa y materialización del modelo federado de gobierno de datos
**Bloque:** AB — Analítica, indicadores y datos maestros
**Fase:** exclusivamente documental
**Implementación técnica:** no autorizada
**Código, DDL, DML, migraciones, backfills o cambios en Supabase:** no autorizados

---

#### 1. Propósito

Definir el gobierno federado de datos de Vento OS de forma que cada dato compartido pueda responder, sin ambigüedad:

```text
qué dominio empresarial lo gobierna
qué aplicación conserva la autoridad funcional
qué función ejerce stewardship
cuál es su fuente de verdad lógica
quién puede proponer o ejecutar correcciones
qué consumidores pueden leerlo o derivarlo
qué copia es solo sincronizada, analítica, histórica o externa
qué ocurre cuando dos fuentes discrepan
```

El resultado deberá permitir construir en `DATA-DOM-002` el catálogo materializado de datos maestros, datos de referencia y dimensiones compartidas sin crear una tabla maestra universal, sin transferir propiedad por ubicación física y sin convertir reportes, copias o integraciones en nuevas fuentes de verdad.

---

#### 2. Decisión principal

Vento OS adopta un modelo de **gobierno federado de datos**.

```text
DOMINIO EMPRESARIAL
→ conserva la autoridad funcional sobre sus datos

APLICACIÓN PROPIETARIA
→ materializa la fuente de verdad lógica del proceso o maestro que gobierna

STEWARD FUNCIONAL
→ mantiene definición, calidad, vigencia, metadatos y resolución operativa de incidencias

CONSUMIDORES
→ leen, proyectan, agregan o solicitan cambios mediante contratos
→ no adquieren propiedad por tener una copia

BLOQUE AB
→ gobierna reglas comunes, catálogo, calidad, métricas y certificación

SUPABASE
→ plataforma de persistencia y ejecución
→ no es propietario empresarial por sí mismo

REPORTES, DASHBOARDS, EXPORTACIONES Y SNAPSHOTS
→ representaciones derivadas o históricas
→ no sustituyen la fuente de verdad
```

Queda prohibido construir un maestro universal que absorba todos los dominios o declarar una única aplicación transversal como propietaria de todos los datos empresariales.

---

#### 3. Conceptos y fronteras obligatorias

##### 3.1. Propietario funcional del dato

Es la función empresarial responsable de la semántica, reglas, ciclo de vida y decisión final sobre el dato dentro de su ámbito aprobado.

El propietario funcional:

- define qué significa el dato;
- decide qué atributos forman parte del contrato empresarial;
- aprueba cambios de definición, alcance o autoridad;
- decide sobre conflictos que exceden la capacidad delegada del steward;
- conserva responsabilidad aunque la persistencia física sea compartida;
- no transfiere propiedad a TI, Supabase, un proveedor o una aplicación consumidora por motivos técnicos.

##### 3.2. Aplicación propietaria

Es la aplicación que, conforme al catálogo canónico de procesos, conserva el expediente operativo principal y la autoridad funcional sobre los hechos y maestros de su proceso.

Una aplicación propietaria puede consumir datos de otros dominios, pero no deberá duplicar su autoridad.

##### 3.3. Steward funcional

Es la función responsable de mantener el dato gobernado dentro de las reglas aprobadas.

El steward:

- mantiene definición y metadatos operativos;
- vigila calidad, completitud, consistencia y vigencia;
- identifica duplicados, conflictos y anomalías;
- coordina correcciones dentro del alcance delegado;
- conserva evidencia de la decisión o escalamiento;
- verifica que consumidores y copias respeten el contrato vigente;
- no puede redefinir unilateralmente identidad, propiedad, alcance o política de autorización;
- no adquiere permisos por el solo hecho de figurar como steward.

La autorización efectiva para definir, certificar, publicar, anotar, exportar o administrar datos y métricas se resolverá en `DATA-AUTH-001` a `DATA-AUTH-003`.

##### 3.4. Custodio técnico

Es quien opera infraestructura, almacenamiento, respaldos, disponibilidad, secretos, despliegues o soporte técnico.

```text
custodio técnico ≠ propietario funcional
```

TI, SHELL, Supabase o un proveedor podrán custodiar técnicamente datos sin adquirir autoridad empresarial sobre ellos.

##### 3.5. Fuente de verdad lógica

Es el origen empresarial autorizado para producir o modificar el estado canónico de un dato dentro de una coordenada de gobierno determinada.

La fuente de verdad se define lógicamente antes de decidir tabla, esquema, vista, función, bucket, evento o tecnología física.

##### 3.6. Consumidor

Es una aplicación, servicio, reporte, integración o proceso autorizado para leer o utilizar datos gobernados por otro dominio.

El consumidor:

- recibe únicamente el contrato necesario;
- no escribe directamente el estado privado del propietario;
- no redefine semántica, claves o reglas locales;
- no convierte una copia en autoridad;
- solicita cambios mediante el contrato del dominio propietario.

---

#### 4. Coordenada mínima de gobierno

La autoridad sobre un dato no se resolverá únicamente por nombre de tabla, columna, aplicación o pantalla.

Toda decisión de propiedad deberá poder ubicarse, como mínimo, mediante:

| Dimensión                        | Regla                                                                                                      |
| -------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| Dominio empresarial              | identifica el ámbito funcional responsable                                                                 |
| Objeto o entidad                 | identifica el maestro, referencia, dimensión, hecho o registro gobernado                                   |
| Atributo o conjunto de atributos | permite separar autoridad cuando un objeto compartido tiene atributos administrados por dominios distintos |
| Alcance                          | territorio, organización, sede, proceso, canal u otra frontera canónica cuando aplique                     |
| Vigencia                         | permite conocer qué autoridad era válida en un momento histórico                                           |
| Fuente lógica                    | identifica el origen autorizado para crear o modificar el valor canónico                                   |
| Propietario funcional            | responde por la definición y la decisión final                                                             |
| Steward funcional                | mantiene calidad y operación del dato dentro de la delegación aprobada                                     |

Dos registros físicamente iguales o dos valores textualmente equivalentes no se considerarán la misma autoridad si pertenecen a coordenadas de gobierno distintas.

---

#### 5. Principios obligatorios de propiedad

1. **Una coordenada de dato tendrá una sola autoridad funcional vigente.** Podrá tener múltiples consumidores, réplicas y representaciones.
2. **La propiedad se deriva del resultado empresarial y del proceso propietario**, no de la aplicación que actualmente muestra más información.
3. **La persistencia compartida no transfiere propiedad.** Dos dominios podrán residir en la misma plataforma o esquema físico y conservar autoridades distintas.
4. **Una aplicación consumidora no podrá adquirir autoridad por escribir una copia local.**
5. **Un dashboard no es fuente de verdad.**
6. **Una exportación no es fuente de verdad.**
7. **Un snapshot histórico no es una fuente editable.**
8. **Una hoja de cálculo solo podrá actuar como captura temporal controlada** cuando exista propietario, contrato, validación y reconciliación; no será fuente permanente por defecto.
9. **Una integración externa no se convierte en propietaria interna.** Podrá ser autoridad sobre la afirmación que origina, pero el estado empresarial interno se resolverá mediante el dominio propietario y su reconciliación.
10. **La plataforma Supabase no es un dominio empresarial ni una aplicación propietaria.**
11. **SHELL no se convierte en propietario de procesos por concentrar navegación, identidad técnica, catálogo de aplicaciones o política de acceso.**
12. **La ausencia de steward nominal no autoriza escritura libre ni permite asumir propiedad por defecto.**

---

#### 6. Distribución federada heredada de propiedad por aplicación

Se conserva sin modificación la propiedad funcional aprobada de los **69 procesos canónicos**.

| Aplicación propietaria | Procesos propietarios | Ámbito de autoridad funcional sobre datos                                                                                                                                   | Stewardship funcional de referencia                                                                                                                                                                                                  | Estado de la fuente lógica                                                                        |
| ---------------------- | --------------------: | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------- |
| `anima`                |                     1 | asistencia, marcación y hechos laborales producidos por la experiencia del trabajador dentro del proceso propietario                                                        | `RESPONSABLE_DE_PERSONAS`, con control de `RESPONSABLE_DE_PROGRAMACION_LABORAL` cuando afecte programación                                                                                                                           | vigente para su proceso propietario                                                               |
| `viso`                 |                    20 | organización, personas administradas, gobierno, SST, soporte, cumplimiento, información, continuidad, riesgo y supervisión transversal en los procesos que posee            | función responsable del dominio correspondiente: `RESPONSABLE_DE_PERSONAS`, `RESPONSABLE_SST`, `RESPONSABLE_DE_TECNOLOGIA`, `CUSTODIO_DOCUMENTAL`, `RESPONSABLE_DE_CONTINUIDAD`, `RESPONSABLE_DE_RIESGO` o `RESPONSABLE_DEL_PROCESO` | vigente para sus procesos propietarios                                                            |
| `nexo`                 |                    16 | productos maestros, ubicaciones, inventario, movimientos, activos, instalaciones, custodia y logística interna                                                              | `RESPONSABLE_DE_CATALOGO`, `BODEGA_Y_ABASTECIMIENTO`, `RESPONSABLE_DE_INSTALACIONES` o `LOGISTICA_Y_TRANSPORTE`, según la familia                                                                                                    | vigente para sus procesos propietarios                                                            |
| `fogo`                 |                     6 | recetas, planeación de producción, órdenes, lotes, consumos, ejecución, calidad y cierre productivo                                                                         | `RESPONSABLE_PRODUCTIVO` y, cuando corresponda, `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`                                                                                                                                                 | vigente para sus procesos propietarios                                                            |
| `origo`                |                     4 | necesidad de compra, proveedores, evaluación, orden de compra y aceptación comercial de recepción                                                                           | `RESPONSABLE_DE_COMPRAS`                                                                                                                                                                                                             | vigente para sus procesos propietarios                                                            |
| `pulso`                |                    12 | oferta vendible, pedido, servicio, venta, pago, caja, devolución y entrega al cliente dentro de los procesos que posee                                                      | `RESPONSABLE_COMERCIAL` y `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`, según la familia                                                                                                                                                      | vigente para sus procesos propietarios                                                            |
| `numera`               |                     7 | obligaciones, presupuesto, registros económicos, conciliación, costos, rentabilidad y análisis financiero                                                                   | `RESPONSABLE_FINANCIERO` y `RESPONSABLE_ANALITICO`, según la familia                                                                                                                                                                 | vigente para sus procesos propietarios                                                            |
| `aura`                 |                     2 | campañas, contenido, audiencias, oportunidades, reputación y análisis de marketing dentro de los procesos objetivo aprobados                                                | `RESPONSABLE_DE_MARCA` y `RESPONSABLE_COMERCIAL`                                                                                                                                                                                     | objetivo diferido; no constituye fuente operativa mientras AURA no esté implementada y habilitada |
| `pass`                 |                     1 | identidad de cliente, fidelización y autoservicio dentro de su proceso propietario                                                                                          | `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`                                                                                                                                                                                                  | vigente para su proceso propietario                                                               |
| `shell`                |                     0 | no posee procesos empresariales del catálogo de 69; conserva únicamente sus responsabilidades transversales propias de identidad técnica, catálogo de aplicaciones y acceso | funciones propietarias de SHELL según sus contratos canónicos                                                                                                                                                                        | no es fuente de verdad de los dominios empresariales anteriores                                   |

**Reconciliación:** `1 + 20 + 16 + 6 + 4 + 12 + 7 + 2 + 1 = 69` procesos propietarios. `shell = 0` procesos propietarios.

La distribución anterior define el nivel de dominio y aplicación. `DATA-DOM-002` deberá materializar la asignación por cada dato maestro, dato de referencia y dimensión compartida.

---

#### 7. Fuentes de verdad por familia empresarial

La autoridad lógica mínima queda definida así:

| Familia                                                               | Fuente de verdad lógica                                                      | Regla de frontera                                                                                                                    |
| --------------------------------------------------------------------- | ---------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| Organización, trabajadores administrados y gobierno                   | `VISO` en los procesos propietarios correspondientes                         | ANIMA y otras aplicaciones consumen el contexto necesario; no duplican el maestro organizacional                                     |
| Asistencia y marcaciones                                              | `ANIMA` para el hecho producido por su proceso propietario                   | VISO puede supervisar y reportar sin reescribir el hecho de origen                                                                   |
| Producto maestro e inventario                                         | `NEXO`                                                                       | FOGO, ORIGO, PULSO y PASS consumen referencias; la visualización o uso no transfiere propiedad                                       |
| Recetas, lotes y producción                                           | `FOGO`                                                                       | NEXO conserva inventario y movimientos; PULSO conserva venta; ningún dominio reconstruye al otro                                     |
| Proveedores, necesidad y orden de compra                              | `ORIGO`                                                                      | NEXO registra recepción e inventario según sus procesos sin convertirse en propietario de la relación comercial de compra            |
| Oferta vendible, pedidos, ventas, pagos y caja                        | `PULSO`                                                                      | PASS puede iniciar o mostrar autoservicio; NUMERA consume efectos económicos; ninguno sustituye la transacción comercial propietaria |
| Cliente, fidelización y autoservicio                                  | `PASS`                                                                       | PULSO conserva venta y servicio transaccional; una vista cliente 360 será proyección y no nueva fuente                               |
| Obligaciones, costos, presupuesto, conciliación y análisis financiero | `NUMERA`                                                                     | NUMERA no reconstruirá hechos operativos que pertenecen a NEXO, FOGO, ORIGO o PULSO                                                  |
| Marketing, campañas y reputación                                      | `AURA` como fuente lógica objetivo de sus procesos aprobados                 | mientras AURA permanezca diferida, no se declarará una fuente operativa inexistente ni se migrará autoridad por inferencia           |
| Evidencia documental y metadatos de custodia                          | dominio y aplicación propietaria del expediente, bajo gobierno del BLOQUE AA | el documento puede evidenciar un hecho sin convertirse automáticamente en autoridad sobre el hecho empresarial subyacente            |
| Autenticación técnica                                                 | infraestructura de autenticación y contratos SHELL aplicables                | identidad autenticada, identidad empresarial y autorización efectiva permanecen separadas                                            |
| Métricas, reportes y dashboards                                       | derivados de las fuentes empresariales anteriores                            | nunca serán autoridad sobre los hechos o maestros que agregan                                                                        |

---

#### 8. Gobierno por atributo

Un objeto compartido podrá contener atributos cuya autoridad pertenezca a dominios diferentes. La existencia de un propietario principal del objeto no autoriza a editar todos sus atributos.

La resolución seguirá este orden:

1. autoridad explícita del atributo definida en el catálogo gobernado;
2. autoridad del maestro o entidad cuando el atributo no tenga una excepción aprobada;
3. autoridad externa únicamente sobre el dato original emitido por esa fuente y dentro de su contrato;
4. si ninguna autoridad es resoluble o existen dos autoridades incompatibles, el cambio queda bloqueado y debe resolverse mediante stewardship y autorización.

Queda prohibido resolver conflictos por:

- último valor escrito;
- aplicación que tenga la copia más reciente;
- usuario con mayor privilegio técnico;
- frecuencia de uso;
- cantidad de consumidores;
- coincidencia de nombre o texto normalizado;
- ubicación física de la tabla.

La separación de definición, certificación, publicación y administración se materializará en `DATA-AUTH-003`.

---

#### 9. Matriz de responsabilidades

| Responsabilidad                  | Propietario funcional                     | Steward                       | Custodio técnico                               | Consumidor                     |
| -------------------------------- | ----------------------------------------- | ----------------------------- | ---------------------------------------------- | ------------------------------ |
| Definir significado empresarial  | decide                                    | participa y mantiene          | no decide                                      | no decide                      |
| Mantener metadatos operativos    | aprueba reglas                            | ejecuta                       | soporta                                        | consume                        |
| Vigilar calidad                  | responde                                  | ejecuta control y triage      | aporta observabilidad                          | reporta anomalías              |
| Crear o corregir valor canónico  | autoriza según contrato                   | ejecuta solo si está delegado | no decide por defecto                          | solicita mediante contrato     |
| Cambiar identidad o autoridad    | decide con gobierno aplicable             | propone y documenta           | evalúa impacto técnico                         | no decide                      |
| Certificar dato para uso oficial | responde junto con autorización aplicable | prepara evidencia             | aporta evidencia técnica                       | consume estado certificado     |
| Resolver conflicto entre fuentes | decide                                    | investiga y recomienda        | aporta trazas                                  | no aplica cambios unilaterales |
| Definir persistencia física      | aporta requisitos empresariales           | aporta reglas de calidad      | se resuelve en arquitectura Supabase aplicable | no decide                      |
| Mantener copias derivadas        | no pierde autoridad                       | controla coherencia           | opera sincronización cuando corresponda        | usa dentro del contrato        |

Ninguna celda de esta matriz concede por sí misma permisos técnicos. La autorización efectiva permanece separada del gobierno funcional.

---

#### 10. Tipos de fuente y efecto sobre autoridad

| Tipo de fuente o representación     | Puede originar estado empresarial canónico                                                    | Puede corregir al propietario por sí sola | Tratamiento                                            |
| ----------------------------------- | --------------------------------------------------------------------------------------------- | ----------------------------------------- | ------------------------------------------------------ |
| Fuente empresarial propietaria      | sí, dentro de su coordenada                                                                   | no aplica                                 | autoridad primaria                                     |
| Fuente externa autorizada           | solo para la afirmación externa que origina y conforme a contrato                             | no                                        | conservar original, validar y reconciliar              |
| Copia sincronizada                  | no                                                                                            | no                                        | mantener trazabilidad con origen y versión             |
| Vista o proyección                  | no                                                                                            | no                                        | derivar sin retroalimentación implícita                |
| Dashboard o reporte                 | no                                                                                            | no                                        | lectura y decisión; no edición de hechos fuente        |
| Snapshot                            | no para estado vigente                                                                        | no                                        | preservar corte e historia                             |
| Exportación                         | no                                                                                            | no                                        | salida controlada; no reingreso implícito              |
| Hoja de cálculo de captura temporal | no por defecto                                                                                | no                                        | validar, reconciliar y someter al contrato propietario |
| Evidencia documental                | solo respecto de la existencia o contenido de la evidencia cuando ese sea su objeto gobernado | no sobre el hecho empresarial subyacente  | vincular al recurso y proceso propietario              |

---

#### 11. Regla de conflicto y reconciliación

Cuando dos fuentes presenten valores distintos para la misma coordenada:

```text
detectar diferencia
→ identificar autoridad vigente
→ preservar valores y procedencia
→ impedir sobrescritura por precedencia técnica
→ clasificar impacto
→ asignar al steward funcional
→ obtener decisión del propietario cuando exceda la delegación
→ corregir mediante el contrato propietario
→ propagar la resolución a consumidores autorizados
→ conservar historia y evidencia
```

La reconciliación no utilizará `last write wins` como regla empresarial general.

Una fuente externa, una copia local o una importación podrá iniciar una solicitud de reconciliación, pero no sustituirá automáticamente el valor canónico.

Los contratos de ingestión, backfill y reconciliación se definirán en `DATA-DOM-006`. Los crosswalks y claves externas se definirán en `DATA-INT-003`.

---

#### 12. Regla de cambio de propietario, steward o fuente

Todo cambio de autoridad deberá ser explícito, versionado y con vigencia definida.

Antes de cambiar propietario, steward o fuente lógica deberá existir:

- motivo del cambio;
- objeto y atributos afectados;
- autoridad anterior y autoridad nueva;
- fecha o condición de vigencia;
- consumidores afectados;
- compatibilidad requerida;
- tratamiento de copias y proyecciones;
- tratamiento de historia y snapshots;
- impacto de autorización;
- impacto de calidad;
- evidencia de aceptación del nuevo propietario;
- plan de transición cuando exista cambio físico posterior;
- mecanismo de reversión o corrección cuando el cambio afecte datos materializados.

Cambiar la aplicación propietaria no reescribe la historia anterior ni autoriza borrar identificadores, hechos o procedencia.

---

#### 13. Regla de stewardship

El stewardship será **funcional y trazable**, no un privilegio administrativo genérico.

Cada maestro que se materialice en `DATA-DOM-002` deberá declarar al menos:

- aplicación propietaria;
- función propietaria;
- función steward principal;
- funciones steward de apoyo, si existen;
- fuente de verdad lógica;
- alcance de edición del steward;
- atributos que requieren aprobación del propietario;
- consumidores principales;
- mecanismo de escalamiento;
- estado de vigencia.

Si un objeto no puede resolver propietario o steward, quedará **BLOQUEADO** para cambios maestros, fusión, separación, desactivación, migración o publicación como dato certificado hasta que la asignación sea materializada.

---

#### 14. Regla para maestros compartidos

Todo dato maestro o de referencia compartido deberá cumplir simultáneamente:

- identificador estable;
- propietario funcional único por coordenada;
- steward identificable;
- fuente de verdad lógica;
- claves empresariales y técnicas diferenciadas;
- estados y vigencia;
- relaciones y jerarquías cuando apliquen;
- autoridad por atributo cuando exista administración distribuida;
- consumidores conocidos;
- historia efectiva;
- reglas de corrección;
- controles de calidad;
- prohibición de fusión por coincidencia textual simple.

`DATA-DOM-002` materializará el inventario completo de maestros, referencias y dimensiones compartidas. `DATA-DOM-003` definirá identidad, claves, códigos, jerarquías, ciclo de vida, fusión y separación.

---

#### 15. Fronteras con analítica

El gobierno de datos base y el gobierno de métricas permanecerán separados.

```text
dato maestro ≠ hecho transaccional ≠ dimensión analítica ≠ métrica ≠ KPI ≠ dashboard
```

Una métrica podrá depender de múltiples fuentes propietarias sin convertirse en dueña de sus datos.

`DATA-DOM-004` definirá la capa semántica y el registro canónico de métricas e indicadores. `DATA-DOM-005` definirá hechos, eventos, granularidad, dimensiones, calendarios, snapshots y comparabilidad histórica.

---

#### 16. Fronteras con calidad, integración y autorización

| Decisión                                                                  | Tarea propietaria |
| ------------------------------------------------------------------------- | ----------------- |
| Catálogo completo por maestro, referencia y dimensión                     | `DATA-DOM-002`    |
| Identidad, claves, códigos, jerarquías, fusión y separación               | `DATA-DOM-003`    |
| Fórmulas y registro canónico de métricas                                  | `DATA-DOM-004`    |
| Hechos, granularidad, dimensiones y comparabilidad histórica              | `DATA-DOM-005`    |
| Ingestión, transformación, backfill y reconciliación                      | `DATA-DOM-006`    |
| Calidad, frescura, cobertura, cuarentena y certificación de datos         | `DATA-DOM-007`    |
| Protección de datos maestros por dominio, entidad, territorio y finalidad | `DATA-AUTH-001`   |
| Separación de definición, certificación, publicación y administración     | `DATA-AUTH-003`   |
| Contratos de eventos y lectura                                            | `DATA-INT-001`    |
| Crosswalks, claves externas, identidad y reconciliación de maestros       | `DATA-INT-003`    |

Estas asignaciones no difieren el resultado principal de `DATA-DOM-001`: el modelo federado, las autoridades por dominio, el stewardship y las reglas de fuente de verdad quedan definidos en esta tarea.

---

#### 17. Decisiones explícitas de no propiedad

Queda establecido que:

- Supabase no es propietario empresarial por ser la base física;
- una tabla `public` no adquiere autoridad por su ubicación;
- SHELL no es propietario de los 69 procesos empresariales;
- VISO no se convierte en propietario de hechos operativos solo por presentarlos en una vista administrativa;
- NUMERA no se convierte en propietario de ventas, compras, inventario o producción por analizarlos económicamente;
- PASS no se convierte en propietario de la venta por permitir autoservicio;
- AURA no podrá considerarse fuente operativa mientras permanezca diferida;
- un proveedor no se convierte en propietario interno por ejecutar un servicio externo;
- una integración no se convierte en fuente empresarial por transportar datos;
- una hoja de cálculo no se convierte en maestro por ser utilizada temporalmente;
- una corrección de presentación o normalización textual no crea identidad ni autoridad.

---

#### 18. Estados de materialización

| Elemento                        | Estado en esta tarea                           | Destino siguiente cuando aplique                                                      |
| ------------------------------- | ---------------------------------------------- | ------------------------------------------------------------------------------------- |
| Modelo federado                 | ESPECIFICADO                                   | consumido por todo BLOQUE AB                                                          |
| Propiedad por aplicación        | ESPECIFICADO y reconciliado contra 69 procesos | `DATA-DOM-002` para detalle por maestro                                               |
| Stewardship funcional           | ESPECIFICADO por dominio y función             | `DATA-DOM-002` para detalle por maestro; `DATA-AUTH-003` para segregación de acciones |
| Fuente de verdad lógica         | ESPECIFICADO por familia empresarial           | `DATA-DOM-002` para inventario por objeto                                             |
| Autoridad por atributo          | ESPECIFICADO como regla de precedencia         | `DATA-DOM-002` para materialización; `DATA-AUTH-003` para autorización                |
| Identidad, claves y crosswalks  | FUERA_DE_ALCANCE de detalle                    | `DATA-DOM-003` y `DATA-INT-003`                                                       |
| Calidad y frescura cuantificada | FUERA_DE_ALCANCE de umbrales                   | `DATA-DOM-007`                                                                        |
| Métricas y KPI                  | FUERA_DE_ALCANCE de definición                 | `DATA-DOM-004`                                                                        |

No queda una decisión sustantiva de gobierno federado sin propietario documental dentro del BLOQUE AB.

---

#### 19. Cobertura de prueba canónica preexistente

El registro canónico vigente ya contiene `TREQ-DATA-001`, cuyo alcance protege la existencia de identificador estable, propietario funcional, steward, fuente de verdad, claves, jerarquías, atributos por dominio, estados, vigencia, ciclo de vida, historia efectiva y prohibición de fusión automática por coincidencia superficial.

`DATA-DOM-001` materializa la definición documental que ese requisito ya referencia. No cambia su regla protegida, prioridad, modalidad, relaciones, estado ni destino de implementación.

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea materializa el gobierno documental ya exigido por un requisito DATA vigente del registro canónico. No introduce comportamiento ejecutable nuevo, no modifica la regla protegida existente y no cambia código, datos, contratos físicos, migraciones ni autorización técnica.

---

#### 20. Criterios de aceptación

`DATA-DOM-001` se considera documentalmente completa cuando se compruebe que:

1. existe una definición inequívoca de propietario funcional, aplicación propietaria, steward, custodio técnico, fuente de verdad y consumidor;
2. el modelo es federado y prohíbe una tabla maestra universal como sustituto de todos los dominios;
3. la propiedad se conserva por resultado empresarial y no por persistencia, pantalla, reporte, integración o privilegio técnico;
4. la distribución heredada reconcilia exactamente **69 procesos propietarios**: `anima 1`, `viso 20`, `nexo 16`, `fogo 6`, `origo 4`, `pulso 12`, `numera 7`, `aura 2`, `pass 1`, con `shell 0`;
5. cada aplicación propietaria tiene ámbito de autoridad y stewardship funcional de referencia definidos;
6. AURA queda distinguida como fuente lógica objetivo diferida y no como fuente operativa vigente;
7. las fuentes de verdad lógicas quedan definidas por familia empresarial sin inventar tablas, esquemas o migraciones;
8. un dato compartido puede resolver autoridad por atributo sin aceptar múltiples editores sin precedencia;
9. copias sincronizadas, dashboards, reportes, snapshots, exportaciones y hojas de cálculo no adquieren autoridad por defecto;
10. fuentes externas conservan autoridad sobre su afirmación original, pero no sustituyen el estado interno sin reconciliación;
11. los conflictos de fuente preservan procedencia y se resuelven por autoridad funcional, no por `last write wins`;
12. la asignación por cada maestro queda vinculada expresamente a `DATA-DOM-002` y las decisiones de identidad, calidad, autorización e integración quedan vinculadas a sus tareas existentes;
13. no se crea código, DDL, DML, migración, backfill, configuración o cambio de Supabase;
14. no se crean ni modifican requisitos de prueba;
15. la continuidad permanece exclusivamente en `DATA-DOM-002` como siguiente tarea reservada.

---

#### 21. Continuidad

```text
ÚLTIMA TAREA APROBADA
INFO-INT-003 — Definir contratos con encargados, asesores, autoridades, proveedores y destinatarios externos

TAREA ACTUAL APROBADA
DATA-DOM-001 — Definir gobierno federado de datos, propietarios, stewards y fuentes de verdad

SIGUIENTE TAREA RESERVADA
DATA-DOM-002 — Definir catálogo de datos maestros, datos de referencia y dimensiones compartidas
```


### ✅ DATA-DOM-002 — Definir catálogo de datos maestros, datos de referencia y dimensiones compartidas

**Estado:** APROBADA
**Tarea anterior:** `DATA-DOM-001 — Definir gobierno federado de datos, propietarios, stewards y fuentes de verdad` — APROBADA
**Tarea siguiente:** `DATA-DOM-003 — Definir identidad, claves, códigos, jerarquías, ciclo de vida, fusión y separación de datos maestros` — RESERVADA
**Tipo de tarea:** documental; catálogo materializado de maestros, referencias y roles dimensionales compartidos bajo el gobierno federado aprobado
**Bloque:** AB — Analítica, indicadores y datos maestros
**Fase:** exclusivamente documental
**Implementación técnica:** no autorizada
**Código, DDL, DML, migraciones, backfills o cambios en Supabase:** no autorizados

---

#### 1. Propósito

Materializar el inventario canónico de datos maestros, datos de referencia y dimensiones compartidas que Vento OS deberá gobernar de forma federada, asignando a cada objeto su clasificación, fuente lógica, propietario funcional, stewardship, consumidores, estado y frontera analítica sin crear una base maestra universal ni una fuente paralela.

La tarea resuelve de forma explícita los hallazgos que exigían un registro canónico de maestros compartidos y una separación inequívoca entre maestro, referencia y transacción. No define todavía claves, códigos, jerarquías, fusiones, separaciones ni crosswalks; esas decisiones permanecen en `DATA-DOM-003` y `DATA-INT-003`.

---

#### 2. Decisión principal

Se adopta un catálogo federado de **62 objetos gobernados**. Cada objeto existe una sola vez en este inventario y puede desempeñar simultáneamente un rol de dimensión compartida sin crear otra identidad ni otra fuente de verdad.

```text
DATO_MAESTRO
→ entidad o configuración empresarial relativamente estable y reutilizada entre procesos

DATO_REFERENCIA
→ lista, código, taxonomía o clasificación controlada y gobernada

DIMENSIÓN_COMPARTIDA
→ rol analítico de un maestro o referencia existente
→ nunca crea una nueva autoridad ni una copia editable

HECHO / EVENTO / CASO / MOVIMIENTO / SNAPSHOT / MÉTRICA
→ queda fuera del catálogo maestro aunque pueda referenciar sus objetos
```

No se crean identificadores técnicos nuevos para estos objetos. La estrategia de identidad, claves, códigos, jerarquías y ciclo de vida pertenece expresamente a `DATA-DOM-003`.

---

#### 3. Contrato lógico mínimo del catálogo

Cada entrada del catálogo deberá conservar conceptualmente, como mínimo:

- objeto canónico y dominio empresarial;
- clase base: maestro o referencia;
- indicación de si puede actuar como dimensión compartida;
- fuente de verdad lógica o contrato transversal propietario;
- propietario funcional único por coordenada;
- steward funcional;
- consumidores principales;
- estado de materialización documental;
- frontera o bloqueo aplicable;
- autoridad por atributo cuando un dato combinado reciba atributos de más de un dominio.

Una dimensión analítica consume el identificador y la versión aplicables del objeto gobernado. No duplica el maestro, no corrige la fuente y no convierte una tabla dimensional, vista, caché o snapshot en autoridad empresarial.

---

#### 4. Catálogo materializado

**Cobertura:** 62 objetos; 43 maestros; 19 referencias; 58 objetos habilitados como dimensiones compartidas; 3 objetos bloqueados por fuente operativa diferida.

|    # | Objeto canónico               | Clase base        | Dimensión compartida | Fuente lógica / contrato propietario                         | Propietario funcional                   | Steward                                                          | Consumidores principales                                           | Estado         | Frontera                                                                                                                  |
| ---: | ----------------------------- | ----------------- | -------------------- | ------------------------------------------------------------ | --------------------------------------- | ---------------------------------------------------------------- | ------------------------------------------------------------------ | -------------- | ------------------------------------------------------------------------------------------------------------------------- |
|    1 | `ORGANIZATION_SCOPE`          | `DATO_MAESTRO`    | `SI`                 | VISO                                                         | Dirección / gobierno organizacional     | `RESPONSABLE_DEL_PROCESO`                                        | SHELL, VISO, NEXO, FOGO, ORIGO, PULSO, NUMERA, PASS, AURA objetivo | `ESPECIFICADO` | Paraguas interno; no equivale a persona jurídica.                                                                         |
|    2 | `LEGAL_SUBJECT`               | `DATO_MAESTRO`    | `SI`                 | VISO                                                         | Dirección / Contabilidad según atributo | `RESPONSABLE_DEL_PROCESO`                                        | NUMERA, ORIGO, PULSO, documentos, analítica                        | `ESPECIFICADO` | La condición jurídica exige evidencia externa; la fuente interna conserva el estado empresarial reconciliado.             |
|    3 | `BRAND`                       | `DATO_MAESTRO`    | `SI`                 | VISO                                                         | Dirección / responsable de marca        | `RESPONSABLE_DE_MARCA`                                           | PULSO, PASS, AURA, NUMERA, analítica                               | `ESPECIFICADO` | Marca no equivale a titular, establecimiento ni sede.                                                                     |
|    4 | `COMMERCIAL_ESTABLISHMENT`    | `DATO_MAESTRO`    | `SI`                 | VISO                                                         | Dirección / Contabilidad                | `RESPONSABLE_DEL_PROCESO`                                        | PULSO, NUMERA, documentos, analítica                               | `ESPECIFICADO` | Solo se marca verificado con evidencia externa aplicable.                                                                 |
|    5 | `BUSINESS_LINE`               | `DATO_MAESTRO`    | `SI`                 | VISO                                                         | Dirección / Gerencia General            | `RESPONSABLE_DEL_PROCESO`                                        | PULSO, NUMERA, AURA, analítica                                     | `ESPECIFICADO` | Una línea de negocio no crea automáticamente sede ni titular.                                                             |
|    6 | `PHYSICAL_FACILITY`           | `DATO_MAESTRO`    | `SI`                 | VISO con operación NEXO                                      | Gerencia General / Operaciones          | `RESPONSABLE_DE_INSTALACIONES`                                   | NEXO, continuidad, SST, analítica                                  | `ESPECIFICADO` | Instalación física y sede operativa permanecen separadas.                                                                 |
|    7 | `OPERATIONAL_SITE`            | `DATO_MAESTRO`    | `SI`                 | VISO                                                         | Gerencia General / Operaciones          | `RESPONSABLE_DEL_PROCESO`                                        | Todas las aplicaciones operativas, autorización, analítica         | `ESPECIFICADO` | Unidad territorial primaria; capacidades se declaran por contrato, no por nombre.                                         |
|    8 | `ORGANIZATIONAL_AREA`         | `DATO_MAESTRO`    | `SI`                 | VISO                                                         | Gerencia / Operaciones                  | `RESPONSABLE_DEL_PROCESO`                                        | Aplicaciones operativas, autorización, analítica                   | `ESPECIFICADO` | Área funcional; no equivale a zona física ni estación.                                                                    |
|    9 | `PHYSICAL_ZONE`               | `DATO_MAESTRO`    | `SI`                 | NEXO con referencia VISO                                     | Operaciones / Instalaciones             | `RESPONSABLE_DE_INSTALACIONES`                                   | NEXO, FOGO, SST, continuidad                                       | `ESPECIFICADO` | Subdivisión espacial sin autoridad funcional implícita.                                                                   |
|   10 | `WORKSTATION`                 | `DATO_MAESTRO`    | `SI`                 | NEXO con contratos SHELL/AUTH-DEV cuando aplique             | Operaciones                             | `RESPONSABLE_DEL_PROCESO`                                        | PULSO, FOGO, NEXO, SHELL, TI                                       | `ESPECIFICADO` | Punto de ejecución; no equivale a área, dispositivo o actor.                                                              |
|   11 | `EXTERNAL_OPERATIONAL_POINT`  | `DATO_MAESTRO`    | `SI`                 | VISO con custodia NEXO                                       | Operaciones                             | `RESPONSABLE_DEL_PROCESO`                                        | NEXO, logística, documentos, analítica                             | `ESPECIFICADO` | Punto externo temporal o privado con finalidad y vigencia; no se promueve a sede por inferencia.                          |
|   12 | `PERSON_IDENTITY`             | `DATO_MAESTRO`    | `SI`                 | VISO para identidad empresarial de persona administrada      | Administración de personas              | `RESPONSABLE_DE_PERSONAS`                                        | ANIMA, SHELL, NUMERA y procesos laborales autorizados              | `ESPECIFICADO` | No se duplica por nueva vinculación; la relación con CUSTOMER_PERSON se resuelve en DATA-DOM-003 sin fusión automática.   |
|   13 | `WORKER_PROFILE`              | `DATO_MAESTRO`    | `SI`                 | VISO                                                         | Administración laboral                  | `RESPONSABLE_DE_PERSONAS`                                        | ANIMA, programación, autorización contextual, analítica            | `ESPECIFICADO` | Proyección laboral del vínculo vigente; no sustituye identidad ni relación histórica.                                     |
|   14 | `EMPLOYMENT_RELATIONSHIP`     | `DATO_MAESTRO`    | `SI`                 | VISO                                                         | Administración laboral                  | `RESPONSABLE_DE_PERSONAS`                                        | ANIMA, NUMERA, SHELL, analítica                                    | `ESPECIFICADO` | Vínculo versionado con vigencia; acceso técnico permanece separado.                                                       |
|   15 | `CONTRACTUAL_POSITION`        | `DATO_REFERENCIA` | `SI`                 | VISO                                                         | Administración laboral                  | `RESPONSABLE_DE_PERSONAS`                                        | ANIMA, NUMERA, analítica                                           | `ESPECIFICADO` | Denominación contractual/administrativa; no concede permisos.                                                             |
|   16 | `BASE_ROLE`                   | `DATO_REFERENCIA` | `NO`                 | SHELL / modelo canónico de autorización                      | Gobierno de autorización                | `RESPONSABLE_DEL_PROCESO`                                        | SHELL y aplicaciones autorizadas                                   | `ESPECIFICADO` | Rol base de autorización; no se confunde con cargo ni función operativa.                                                  |
|   17 | `OPERATIONAL_ROLE`            | `DATO_REFERENCIA` | `SI`                 | VISO con consumo del modelo de autorización                  | Operaciones / propietario del proceso   | `RESPONSABLE_DEL_PROCESO`                                        | ANIMA, PULSO, FOGO, NEXO, analítica                                | `ESPECIFICADO` | Función efectiva; su activación contextual no crea una identidad nueva.                                                   |
|   18 | `WORK_ASSIGNMENT`             | `DATO_MAESTRO`    | `SI`                 | VISO                                                         | Administración laboral / Gerencia       | `RESPONSABLE_DE_PERSONAS`                                        | ANIMA, autorización contextual, programación, analítica            | `ESPECIFICADO` | Asignación vigente o histórica a sede, área, función o cobertura.                                                         |
|   19 | `CUSTOMER_PERSON`             | `DATO_MAESTRO`    | `SI`                 | PASS                                                         | Relación con clientes                   | `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`                              | PULSO, VISO, NUMERA, AURA bajo autorización                        | `ESPECIFICADO` | Persona cliente independiente de cuenta autenticada; coincidencia de contacto no prueba identidad.                        |
|   20 | `CUSTOMER_CONTACT`            | `DATO_MAESTRO`    | `NO`                 | PASS                                                         | Relación con clientes                   | `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`                              | PASS, servicio y comunicaciones autorizadas                        | `ESPECIFICADO` | Correo/teléfono con tipo, verificación, fuente y vigencia; no es identidad suficiente.                                    |
|   21 | `CUSTOMER_RELATIONSHIP`       | `DATO_MAESTRO`    | `SI`                 | PASS                                                         | Relación con clientes                   | `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`                              | PASS, PULSO, VISO, AURA autorizado                                 | `ESPECIFICADO` | Relación por marca/alcance; no equivale a consentimiento.                                                                 |
|   22 | `CUSTOMER_PROFILE`            | `DATO_MAESTRO`    | `SI`                 | PASS                                                         | Relación con clientes                   | `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`                              | PASS, PULSO mínimo, VISO mínimo, analítica                         | `ESPECIFICADO` | Perfil de autoservicio; no contiene decisiones internas no autoadministrables.                                            |
|   23 | `CUSTOMER_PREFERENCE`         | `DATO_MAESTRO`    | `SI`                 | PASS                                                         | Relación con clientes                   | `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`                              | PASS, PULSO y comunicaciones autorizadas                           | `ESPECIFICADO` | Preferencia no equivale a autorización o consentimiento.                                                                  |
|   24 | `LOYALTY_ACCOUNT`             | `DATO_MAESTRO`    | `SI`                 | PASS                                                         | Relación con clientes                   | `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`                              | PASS, PULSO, NUMERA, analítica                                     | `ESPECIFICADO` | La cuenta de fidelización es distinta del saldo y de los movimientos del ledger.                                          |
|   25 | `LOYALTY_PROGRAM_RULE`        | `DATO_REFERENCIA` | `SI`                 | PASS                                                         | Relación con clientes                   | `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`                              | PASS, PULSO, NUMERA, analítica                                     | `ESPECIFICADO` | Reglas versionadas de beneficio; los movimientos y redenciones son hechos, no referencias.                                |
|   26 | `PRODUCTO_MAESTRO`            | `DATO_MAESTRO`    | `SI`                 | NEXO                                                         | Catálogo empresarial                    | `RESPONSABLE_DE_CATALOGO`                                        | FOGO, ORIGO, PULSO, PASS, NUMERA, analítica                        | `ESPECIFICADO` | Identidad estable del elemento; admite roles múltiples sin duplicación.                                                   |
|   27 | `VARIANTE`                    | `DATO_MAESTRO`    | `SI`                 | NEXO                                                         | Catálogo empresarial                    | `RESPONSABLE_DE_CATALOGO`                                        | FOGO, ORIGO, PULSO, PASS, analítica                                | `ESPECIFICADO` | Configuración diferenciada del producto; no equivale a presentación.                                                      |
|   28 | `PRESENTACION`                | `DATO_MAESTRO`    | `SI`                 | NEXO                                                         | Catálogo empresarial                    | `RESPONSABLE_DE_CATALOGO`                                        | ORIGO, FOGO, PULSO, logística, analítica                           | `ESPECIFICADO` | Representa empaque/forma física de compra, recepción, stock, remisión o venta; no es unidad.                              |
|   29 | `UNIDAD_DE_MEDIDA`            | `DATO_REFERENCIA` | `SI`                 | NEXO                                                         | Catálogo empresarial                    | `RESPONSABLE_DE_CATALOGO`                                        | FOGO, ORIGO, PULSO, NUMERA, analítica                              | `ESPECIFICADO` | Código y dimensión controlados; no se inventan unidades para servicios o empaques.                                        |
|   30 | `TAXONOMIA_TIPO_MAESTRO`      | `DATO_REFERENCIA` | `SI`                 | NEXO                                                         | Catálogo empresarial                    | `RESPONSABLE_DE_CATALOGO`                                        | NEXO, FOGO, ORIGO, PULSO, analítica                                | `ESPECIFICADO` | Distingue producto, servicio, ingrediente, preparación y empaque.                                                         |
|   31 | `TAXONOMIA_INVENTARIO`        | `DATO_REFERENCIA` | `SI`                 | NEXO                                                         | Inventario / Bodega                     | `BODEGA_Y_ABASTECIMIENTO`                                        | NEXO, FOGO, ORIGO, NUMERA, analítica                               | `ESPECIFICADO` | Clasifica comportamiento de stock, medición, lote y vencimiento; no sustituye identidad.                                  |
|   32 | `TAXONOMIA_OPERACIONAL`       | `DATO_REFERENCIA` | `SI`                 | NEXO                                                         | Operaciones de catálogo e inventario    | `RESPONSABLE_DE_CATALOGO`                                        | NEXO, logística, analítica                                         | `ESPECIFICADO` | Agrupa búsqueda, almacenamiento, remisión y operación; no controla menú.                                                  |
|   33 | `LOC`                         | `DATO_MAESTRO`    | `SI`                 | NEXO                                                         | Inventario / Instalaciones según objeto | `BODEGA_Y_ABASTECIMIENTO`                                        | NEXO, FOGO, ORIGO, logística, analítica                            | `ESPECIFICADO` | Ubicación lógica/física de inventario; no equivale a sede, área o instalación completa.                                   |
|   34 | `ACTIVO_FISICO`               | `DATO_MAESTRO`    | `SI`                 | NEXO                                                         | Activos / Instalaciones                 | `RESPONSABLE_DE_INSTALACIONES`                                   | TI, logística, NUMERA, continuidad, analítica                      | `ESPECIFICADO` | NEXO conserva identidad física, ubicación, condición, custodia, mantenimiento y retiro.                                   |
|   35 | `CLASE_DE_ACTIVO`             | `DATO_REFERENCIA` | `SI`                 | NEXO                                                         | Activos                                 | `RESPONSABLE_DE_INSTALACIONES`                                   | NEXO, TI, NUMERA, analítica                                        | `ESPECIFICADO` | Clasificación controlada; no crea por sí sola identidad ni política de mantenimiento.                                     |
|   36 | `ESPECIFICACION_PRODUCTO`     | `DATO_MAESTRO`    | `NO`                 | NEXO; FOGO para especificación productiva cuando corresponda | Catálogo / Calidad                      | `RESPONSABLE_DE_CATALOGO con RESPONSABLE_DE_CALIDAD_E_INOCUIDAD` | ORIGO, FOGO, NEXO, calidad, documentos                             | `ESPECIFICADO` | Objeto versionado y vigente; no reescribe recepciones o lotes históricos.                                                 |
|   37 | `PROVEEDOR`                   | `DATO_MAESTRO`    | `SI`                 | ORIGO                                                        | Compras / Gerencia según sensibilidad   | `RESPONSABLE_DE_COMPRAS`                                         | NEXO, NUMERA, VISO, TI cuando aplique                              | `ESPECIFICADO` | Proveedor y contacto son conceptos distintos; datos sensibles se minimizan.                                               |
|   38 | `CONTACTO_PROVEEDOR`          | `DATO_MAESTRO`    | `NO`                 | ORIGO                                                        | Compras                                 | `RESPONSABLE_DE_COMPRAS`                                         | ORIGO y procesos autorizados                                       | `ESPECIFICADO` | Persona o canal de relación; no sustituye identidad del proveedor.                                                        |
|   39 | `RELACION_PRODUCTO_PROVEEDOR` | `DATO_MAESTRO`    | `SI`                 | ORIGO                                                        | Compras                                 | `RESPONSABLE_DE_COMPRAS`                                         | NEXO, ORIGO, NUMERA, analítica                                     | `ESPECIFICADO` | Declara capacidad de suministro; no equivale a oferta, contrato o precio vigente.                                         |
|   40 | `CONDICION_COMERCIAL`         | `DATO_MAESTRO`    | `SI`                 | ORIGO                                                        | Compras / Gerencia según sensibilidad   | `RESPONSABLE_DE_COMPRAS`                                         | ORIGO, NUMERA, NEXO, analítica                                     | `ESPECIFICADO` | Condición versionada con vigencia y contexto; órdenes conservan snapshot de lo aprobado.                                  |
|   41 | `TAXONOMIA_COMPRA`            | `DATO_REFERENCIA` | `SI`                 | ORIGO                                                        | Compras                                 | `RESPONSABLE_DE_COMPRAS`                                         | ORIGO, NUMERA, analítica                                           | `ESPECIFICADO` | Agrupación de abastecimiento; no sustituye taxonomías de inventario, producto o costo.                                    |
|   42 | `RECETA`                      | `DATO_MAESTRO`    | `SI`                 | FOGO                                                         | Producción                              | `RESPONSABLE_PRODUCTIVO`                                         | NEXO, NUMERA, PULSO según contrato, analítica                      | `ESPECIFICADO` | Identidad estable del conocimiento; versiones publicadas y ejecuciones permanecen separadas.                              |
|   43 | `FAMILIA_PRODUCTIVA`          | `DATO_REFERENCIA` | `SI`                 | FOGO                                                         | Producción                              | `RESPONSABLE_PRODUCTIVO`                                         | FOGO, NEXO, NUMERA, analítica                                      | `ESPECIFICADO` | Taxonomía productiva; no sustituye categoría de producto, compra o menú.                                                  |
|   44 | `RUTA_PRODUCTIVA`             | `DATO_MAESTRO`    | `SI`                 | FOGO                                                         | Producción                              | `RESPONSABLE_PRODUCTIVO`                                         | FOGO, NEXO, planificación, analítica                               | `ESPECIFICADO` | Ruta/proceso productivo reutilizable; ejecución y lote siguen siendo hechos.                                              |
|   45 | `RECURSO_PRODUCTIVO`          | `DATO_MAESTRO`    | `SI`                 | FOGO con referencia a activos NEXO cuando corresponda        | Producción                              | `RESPONSABLE_PRODUCTIVO`                                         | FOGO, NEXO, mantenimiento, analítica                               | `ESPECIFICADO` | Recurso funcional productivo; el activo físico relacionado mantiene identidad NEXO.                                       |
|   46 | `COMMERCIAL_CHANNEL`          | `DATO_REFERENCIA` | `SI`                 | PULSO                                                        | Comercial                               | `RESPONSABLE_COMERCIAL`                                          | PASS, AURA, NUMERA, logística, analítica                           | `ESPECIFICADO` | Canal comercial; no equivale a sede, marca, pedido ni cuenta externa.                                                     |
|   47 | `CATEGORIA_COMERCIAL`         | `DATO_REFERENCIA` | `SI`                 | PULSO                                                        | Comercial                               | `RESPONSABLE_COMERCIAL`                                          | PULSO, PASS, AURA, analítica                                       | `ESPECIFICADO` | Taxonomía de navegación/oferta; no controla stock ni clasificación operativa.                                             |
|   48 | `OFERTA_COMERCIAL`            | `DATO_MAESTRO`    | `SI`                 | PULSO                                                        | Comercial                               | `RESPONSABLE_COMERCIAL`                                          | PASS, AURA, NUMERA, analítica                                      | `ESPECIFICADO` | Configuración vendible versionada por contexto; precio, disponibilidad y venta permanecen objetos distintos.              |
|   49 | `CENTRO_DE_COSTO`             | `DATO_MAESTRO`    | `SI`                 | NUMERA                                                       | Finanzas                                | `RESPONSABLE_FINANCIERO`                                         | ORIGO, NEXO, PULSO, FOGO, VISO, analítica                          | `ESPECIFICADO` | Centro económico; no equivale a sede, área, marca o canal.                                                                |
|   50 | `MONEDA`                      | `DATO_REFERENCIA` | `SI`                 | NUMERA                                                       | Finanzas                                | `RESPONSABLE_FINANCIERO`                                         | ORIGO, PULSO, NUMERA, analítica                                    | `ESPECIFICADO` | Código/unidad monetaria controlada; conversiones y tasas son objetos/valores con vigencia separados.                      |
|   51 | `PERIODO_ECONOMICO`           | `DATO_REFERENCIA` | `SI`                 | NUMERA                                                       | Finanzas                                | `RESPONSABLE_FINANCIERO`                                         | NUMERA, analítica                                                  | `ESPECIFICADO` | Periodo económico separado de operación, contabilidad y fiscalidad.                                                       |
|   52 | `PERIODO_CONTABLE`            | `DATO_REFERENCIA` | `SI`                 | NUMERA o sistema contable autorizado según alcance vigente   | Finanzas / Contabilidad                 | `RESPONSABLE_FINANCIERO`                                         | NUMERA, contabilidad, analítica                                    | `ESPECIFICADO` | No se confunde con periodo económico ni operativo.                                                                        |
|   53 | `PERIODO_FISCAL`              | `DATO_REFERENCIA` | `SI`                 | NUMERA con autoridad externa aplicable                       | Finanzas / Contabilidad                 | `RESPONSABLE_FINANCIERO`                                         | NUMERA, proveedor fiscal, analítica                                | `ESPECIFICADO` | La autoridad oficial externa se conserva cuando aplique.                                                                  |
|   54 | `CLASIFICACION_ECONOMICA`     | `DATO_REFERENCIA` | `SI`                 | NUMERA                                                       | Finanzas                                | `RESPONSABLE_FINANCIERO`                                         | NUMERA, ORIGO, PULSO, analítica                                    | `ESPECIFICADO` | Clasificación de gasto/costo/ingreso u otras categorías económicas; no redefine hechos operativos.                        |
|   55 | `PERFIL_DE_MARCA`             | `DATO_MAESTRO`    | `SI`                 | AURA objetivo                                                | Marca / Comercial                       | `RESPONSABLE_DE_MARCA`                                           | AURA, PULSO, PASS, analítica                                       | `BLOQUEADO`    | Fuente lógica objetivo; no se declara fuente operativa mientras AURA permanezca diferida.                                 |
|   56 | `AUDIENCIA`                   | `DATO_MAESTRO`    | `SI`                 | AURA objetivo                                                | Marca / Comercial                       | `RESPONSABLE_DE_MARCA`                                           | AURA, analítica y canales autorizados                              | `BLOQUEADO`    | Debe respetar finalidad, consentimiento y exclusiones; activación depende de AURA habilitada.                             |
|   57 | `ACTIVO_DE_MARCA`             | `DATO_MAESTRO`    | `SI`                 | AURA objetivo bajo gobierno documental                       | Marca                                   | `RESPONSABLE_DE_MARCA`                                           | AURA, PULSO, PASS, publicaciones                                   | `BLOQUEADO`    | Originales y derivados conservan derechos, uso, vigencia y relación; AURA no operativa impide declarar autoridad vigente. |
|   58 | `ENDPOINT`                    | `DATO_MAESTRO`    | `SI`                 | BLOQUE Z / contrato TI-DOM-002                               | Tecnología                              | `RESPONSABLE_TECNOLOGICO`                                        | SHELL, VISO, NEXO, soporte, continuidad                            | `ESPECIFICADO` | Instalación técnica administrada; distinta de activo físico y dispositivo compartido.                                     |
|   59 | `SHARED_DEVICE`               | `DATO_MAESTRO`    | `SI`                 | SHELL / contratos AUTH-DEV consumidos por BLOQUE Z           | Gobierno de dispositivo compartido      | `RESPONSABLE_TECNOLOGICO`                                        | SHELL, aplicaciones permitidas, soporte                            | `ESPECIFICADO` | Dispositivo lógico empresarial; no equivale a actor, endpoint, activo o estación.                                         |
|   60 | `NETWORK_RESOURCE`            | `DATO_MAESTRO`    | `SI`                 | BLOQUE Z                                                     | Tecnología                              | `RESPONSABLE_TECNOLOGICO`                                        | TI, continuidad, NEXO por activos asociados                        | `ESPECIFICADO` | Clase técnica de conectividad; IP/MAC/SSID aislados no crean identidad.                                                   |
|   61 | `APPLICATION`                 | `DATO_MAESTRO`    | `SI`                 | SHELL                                                        | Gobierno transversal de aplicaciones    | `funciones propietarias de SHELL según contrato`                 | TI, autorización, todas las aplicaciones consumidoras              | `ESPECIFICADO` | Aplicación no equivale a repositorio, URL, ambiente, despliegue o servicio.                                               |
|   62 | `TECH_SERVICE`                | `DATO_REFERENCIA` | `SI`                 | BLOQUE Z / TI-DOM-001                                        | Tecnología                              | `RESPONSABLE_TECNOLOGICO`                                        | VISO, SHELL, NEXO, continuidad, analítica de TI                    | `ESPECIFICADO` | Familia estable de servicio; conserva las once identidades TI-SERVICE-001 a 011.                                          |

---

#### 5. Reconciliación del catálogo

| Control                                               | Resultado |
| ----------------------------------------------------- | --------: |
| Objetos esperados según este inventario materializado |    **62** |
| Objetos materializados                                |    **62** |
| Objetos faltantes dentro del inventario declarado     |     **0** |
| Objetos duplicados por nombre canónico                |     **0** |
| Datos maestros                                        |    **43** |
| Datos de referencia                                   |    **19** |
| Objetos con rol de dimensión compartida               |    **58** |
| Objetos bloqueados por fuente operativa diferida      |     **3** |

Los tres objetos bloqueados corresponden al dominio objetivo de AURA. Se conservan en el catálogo porque su propiedad lógica ya fue aprobada, pero no pueden presentarse como fuente operativa vigente ni recibir migración de autoridad mientras AURA permanezca diferida.

---

#### 6. Instancias de referencia tecnológica heredadas

`TECH_SERVICE` conserva exactamente las once identidades aprobadas en el catálogo tecnológico. No se crean aliases ni servicios adicionales.

| Identidad        | Servicio                                                                | Clase en este catálogo           | Fuente lógica           | Estado         |
| ---------------- | ----------------------------------------------------------------------- | -------------------------------- | ----------------------- | -------------- |
| `TI-SERVICE-001` | Cuentas, identidad y acceso tecnológico                                 | `DATO_REFERENCIA / TECH_SERVICE` | BLOQUE Z / `TI-DOM-001` | `ESPECIFICADO` |
| `TI-SERVICE-002` | Endpoints, computadores, celulares, tabletas y dispositivos compartidos | `DATO_REFERENCIA / TECH_SERVICE` | BLOQUE Z / `TI-DOM-001` | `ESPECIFICADO` |
| `TI-SERVICE-003` | Redes y conectividad                                                    | `DATO_REFERENCIA / TECH_SERVICE` | BLOQUE Z / `TI-DOM-001` | `ESPECIFICADO` |
| `TI-SERVICE-004` | Impresoras y periféricos                                                | `DATO_REFERENCIA / TECH_SERVICE` | BLOQUE Z / `TI-DOM-001` | `ESPECIFICADO` |
| `TI-SERVICE-005` | Aplicaciones, ambientes y proveedores tecnológicos                      | `DATO_REFERENCIA / TECH_SERVICE` | BLOQUE Z / `TI-DOM-001` | `ESPECIFICADO` |
| `TI-SERVICE-006` | Solicitudes de soporte tecnológico                                      | `DATO_REFERENCIA / TECH_SERVICE` | BLOQUE Z / `TI-DOM-001` | `ESPECIFICADO` |
| `TI-SERVICE-007` | Incidentes y restauración tecnológica                                   | `DATO_REFERENCIA / TECH_SERVICE` | BLOQUE Z / `TI-DOM-001` | `ESPECIFICADO` |
| `TI-SERVICE-008` | Cambios, configuración y versiones tecnológicas                         | `DATO_REFERENCIA / TECH_SERVICE` | BLOQUE Z / `TI-DOM-001` | `ESPECIFICADO` |
| `TI-SERVICE-009` | Pruebas y aceptación técnica de soluciones                              | `DATO_REFERENCIA / TECH_SERVICE` | BLOQUE Z / `TI-DOM-001` | `ESPECIFICADO` |
| `TI-SERVICE-010` | Licencias, garantías, contratos y costos tecnológicos                   | `DATO_REFERENCIA / TECH_SERVICE` | BLOQUE Z / `TI-DOM-001` | `ESPECIFICADO` |
| `TI-SERVICE-011` | Conocimiento, capacitación y adopción tecnológica                       | `DATO_REFERENCIA / TECH_SERVICE` | BLOQUE Z / `TI-DOM-001` | `ESPECIFICADO` |

**Reconciliación:** 11 esperados; 11 materializados; 0 faltantes; 0 duplicados.

---

#### 7. Objetos expresamente fuera del catálogo maestro

La siguiente matriz evita que hechos, casos, decisiones o representaciones se conviertan en maestros por conveniencia técnica.

| Familia u objeto                                                         | Clasificación correcta                    | Fuente propietaria                             | Razón de exclusión                                                                                        | Tarea que profundiza cuando aplica         |
| ------------------------------------------------------------------------ | ----------------------------------------- | ---------------------------------------------- | --------------------------------------------------------------------------------------------------------- | ------------------------------------------ |
| SHIFT, ATTENDANCE_EVENT, ATTENDANCE_CORRECTION                           | HECHO / EVENTO LABORAL                    | VISO / ANIMA según proceso                     | Representan planificación o hechos con tiempo; no son maestros.                                           | DATA-DOM-005                               |
| CONSENT_RECORD, CONTACT_VERIFICATION                                     | EVENTO / EVIDENCIA DE AUTORIZACIÓN        | PASS y gobierno de privacidad                  | Consentimiento y verificación tienen versión, tiempo y evidencia; no son preferencia ni identidad.        | DATA-AUTH-001 a DATA-AUTH-004              |
| LOYALTY_LEDGER_ENTRY, redención, ajuste de puntos                        | HECHO TRANSACCIONAL                       | PASS / PULSO según proceso                     | El saldo es proyección de movimientos; el movimiento no es maestro.                                       | DATA-DOM-005                               |
| solicitud, caso, cotización, orden, recepción, devolución de compra      | CASO / TRANSACCIÓN                        | ORIGO                                          | Cambian por evento y conservan historia operativa; referencian proveedor, producto y condiciones.         | DATA-DOM-005 y DATA-DOM-006                |
| lote, LPN, existencia, movimiento, conteo, ajuste                        | HECHO / ENTIDAD OPERATIVA DE TRAZABILIDAD | NEXO / FOGO según proceso                      | Representan estado o trazabilidad operacional; no redefinen producto, LOC o activo.                       | DATA-DOM-005                               |
| orden, lote, ejecución, consumo, merma y resultado productivo            | HECHO PRODUCTIVO                          | FOGO                                           | La receta y recursos son maestros; la ejecución es hecho.                                                 | DATA-DOM-005 y DATA-DOM-011                |
| pedido, comanda, venta, pago, caja, devolución, entrega                  | HECHO COMERCIAL                           | PULSO                                          | La operación comercial usa producto, canal, cliente, sede y oferta; no se convierte en maestro.           | DATA-DOM-005 y DATA-DOM-009                |
| precio de venta, descuento, promoción vigente                            | REGLA / CONFIGURACIÓN VERSIONADA          | PULSO; AURA solo propone intención promocional | Precio o promoción cambia por contexto y vigencia; no es identidad del producto ni dimensión autónoma.    | DATA-DOM-009 y DATA-DOM-017                |
| SERVICE_CASE, reclamo, reserva, compensación, satisfacción, comunicación | CASO / EVENTO DE SERVICIO                 | VISO, PASS o PULSO según frontera              | Son expedientes o hechos de relación; referencian cliente y dimensiones gobernadas.                       | DATA-DOM-012                               |
| hecho económico, obligación, pago, aplicación, conciliación              | HECHO / REGISTRO ECONÓMICO                | NUMERA                                         | Los hechos económicos se analizan por dimensiones maestras, no son dimensiones por sí mismos.             | DATA-DOM-005 y DATA-DOM-013                |
| presupuesto, forecast, escenario                                         | ARTEFACTO ECONÓMICO VERSIONADO            | NUMERA                                         | Son versiones y escenarios de decisión; no se confunden con periodo, centro de costo o moneda.            | DATA-DOM-013 y DATA-DOM-017                |
| campaña, pieza publicada, oportunidad, interacción, publicación          | CASO / ACTIVIDAD / EVENTO DE MARKETING    | AURA objetivo                                  | AURA está diferida y estas entidades son actividad; perfiles, audiencias y activos sí quedan catalogados. | DATA-DOM-014 y DATA-DOM-016 cuando aplique |
| ticket, incidente, problema, cambio tecnológico                          | CASO / EVENTO TI                          | VISO / BLOQUE Z                                | Referencian servicios, aplicaciones, endpoints y recursos; no son maestros tecnológicos.                  | TI-DOM-007 a TI-DOM-009                    |
| PRINTER como clase de configuración, ASSET como clase de configuración   | PROYECCIÓN REFERENCIAL                    | PRINT-ARC / NEXO                               | Las clases tecnológicas referencian identidades propietarias existentes; no crean maestros paralelos.     | TI-DOM-002                                 |
| métrica, KPI, dashboard, reporte, exportación, snapshot                  | DERIVADO ANALÍTICO / REPRESENTACIÓN       | BLOQUE AB sobre fuentes propietarias           | Nunca son fuente de verdad de los maestros o hechos que agregan.                                          | DATA-DOM-004, DATA-DOM-005, DATA-DOM-008   |

---

#### 8. Reglas de dimensión compartida

1. `DIMENSIÓN_COMPARTIDA` es un rol de lectura y análisis, no una tercera fuente de verdad.
2. La dimensión usa el objeto maestro o referencia vigente y conserva su procedencia.
3. Empresa, marca, sede, área, canal y centro de costo permanecen dimensiones distintas; ninguna se sustituye por otra por conveniencia de reporte.
4. Producto, variante, presentación y unidad permanecen separados; una etiqueta visible no autoriza joins de identidad.
5. Persona administrada, trabajador, cliente y cuenta técnica permanecen separados; su vínculo se resolverá mediante contratos de identidad, no por nombre, correo o teléfono.
6. Proveedor y contacto permanecen separados; la relación producto–proveedor tampoco se convierte en identidad del proveedor.
7. Receta, familia productiva, ruta y recurso productivo pueden segmentar hechos de FOGO sin reescribirlos.
8. Moneda y periodos son referencias analíticas; tasas, saldos, cierres y movimientos permanecen hechos o reglas versionadas.
9. Una dimensión histórica debe poder reproducir el contexto aplicable al hecho; el modelado temporal detallado corresponde a `DATA-DOM-005`.
10. La capa física o semántica que materialice una dimensión se decidirá en E3 y `DATA-INT-002`; esta tarea no prescribe tablas, vistas o modelos BI.

---

#### 9. Autoridad por atributo y cambios

El propietario principal de un objeto no recibe autoridad universal sobre todos sus atributos. Cuando un atributo venga de otro dominio o de una autoridad externa, el catálogo conserva esa frontera.

Ejemplos obligatorios:

- `LEGAL_SUBJECT`: la administración interna se gobierna en VISO, pero una afirmación registral o tributaria conserva su evidencia externa autorizada;
- `PRODUCTO_MAESTRO`: NEXO conserva identidad y clasificación maestra; FOGO no puede alterar esa identidad por usarlo en receta y PULSO no puede alterarla por venderlo;
- `CUSTOMER_PERSON`: PASS conserva la relación cliente; PULSO puede asociar hechos de venta sin reescribir el perfil maestro;
- `ACTIVO_FISICO`: NEXO conserva identidad física; BLOQUE Z puede añadir relación técnica de configuración sin apropiarse del activo;
- `APPLICATION`: SHELL conserva identidad canónica de aplicación; BLOQUE Z conserva relaciones y operación técnica sin renombrar `app_code` ni asumir propiedad del proceso empresarial.

Si dos fuentes pretenden autoridad sobre el mismo atributo y no existe precedencia aprobada, la modificación queda `BLOQUEADO` hasta resolución por steward y propietario. No se usa `last write wins`.

---

#### 10. Pendientes con propietario documental

| Decisión no perteneciente a esta tarea                                                                           | Propietario documental                           | Condición de salida                                                                         |
| ---------------------------------------------------------------------------------------------------------------- | ------------------------------------------------ | ------------------------------------------------------------------------------------------- |
| identificadores, claves empresariales/técnicas, códigos, aliases, jerarquías, ciclo de vida, fusión y separación | `DATA-DOM-003`                                   | antes de crosswalks, deduplicación, migraciones o constraints                               |
| granularidad de hechos, dimensión efectiva, calendarios, snapshots y comparabilidad histórica                    | `DATA-DOM-005`                                   | antes de publicar modelos analíticos oficiales                                              |
| contratos de ingestión, backfill y reconciliación                                                                | `DATA-DOM-006`                                   | antes de mover o reconstruir datos                                                          |
| umbrales de calidad, frescura y certificación                                                                    | `DATA-DOM-007`                                   | antes de certificar un uso de datos                                                         |
| protección por dominio, entidad, territorio y finalidad                                                          | `DATA-AUTH-001`                                  | antes de exponer administración o detalle sensible                                          |
| segregación de definición, certificación, publicación y administración                                           | `DATA-AUTH-003`                                  | antes de habilitar acciones administrativas                                                 |
| crosswalks y claves externas                                                                                     | `DATA-INT-003`                                   | antes de integraciones y migraciones                                                        |
| materialización física del catálogo y de dimensiones                                                             | arquitectura E3 y `DATA-INT-002`                 | antes de crear tablas, vistas, modelos semánticos o BI                                      |
| activación operativa de `PERFIL_DE_MARCA`, `AUDIENCIA` y `ACTIVO_DE_MARCA`                                       | AURA / paquete de implementación correspondiente | AURA implementada y habilitada como fuente operativa; hasta entonces permanecen `BLOQUEADO` |

No queda una decisión de clasificación, propiedad o estado de los 62 objetos sin destino documental.

---

#### 11. Cobertura de prueba canónica preexistente

El requisito vigente `TREQ-DATA-001` ya exige para maestros y referencias compartidos identificador estable, propietario funcional, steward, fuente de verdad, claves, jerarquías, atributos por dominio, estados, vigencia, ciclo de vida, historia efectiva y prohibición de fusión automática por coincidencia superficial.

Esta tarea materializa el catálogo documental que ese requisito ya protege. No modifica su regla, prioridad, modalidad, estado, relaciones ni destino de implementación.

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** el catálogo materializa decisiones documentales ya cubiertas por requisitos canónicos vigentes sobre gobierno de maestros, referencias, integridad semántica, fuentes y trazabilidad. No introduce comportamiento ejecutable nuevo, no cambia la regla protegida existente y no autoriza código, datos, migraciones, autorización técnica ni integración física.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 12. Criterios de aceptación

1. se materializan exactamente 62 objetos canónicos sin duplicados por nombre;
2. cada objeto queda clasificado como dato maestro o dato de referencia;
3. cada objeto declara si puede actuar como dimensión compartida sin crear una autoridad paralela;
4. cada objeto declara fuente lógica o contrato transversal propietario, propietario funcional, steward, consumidores y estado;
5. se conservan las fronteras de DATA-DOM-001 y la distribución federada por aplicación;
6. empresa, marca, sede, área, canal y centro de costo permanecen conceptos distintos;
7. persona administrada, trabajador, cliente, contacto, perfil, preferencia, cuenta y consentimiento no se colapsan;
8. producto, variante, presentación, unidad y taxonomías permanecen separados;
9. proveedor, contacto, relación producto–proveedor y condición comercial permanecen separados;
10. receta y sus taxonomías/recursos se separan de ejecución, lote, consumo y merma;
11. pedido, venta, pago, caja, recepción, movimiento, lote, caso, consentimiento-evento y hecho económico quedan fuera del catálogo maestro;
12. métricas, KPI, dashboards, reportes, exportaciones y snapshots no adquieren autoridad;
13. las once identidades TI-SERVICE-001 a TI-SERVICE-011 se preservan exactamente una vez bajo TECH_SERVICE;
14. AURA conserva su autoridad lógica objetivo, pero sus tres objetos permanecen BLOQUEADO mientras no exista fuente operativa vigente;
15. las decisiones de identidad, claves, jerarquías, ciclo de vida, fusión y separación no se adelantan y permanecen en DATA-DOM-003;
16. no se crea ni modifica ningún requisito de prueba;
17. no se modifica código, Supabase, datos, migraciones, dashboards ni integraciones;
18. la continuidad queda exclusivamente en DATA-DOM-003 como siguiente tarea reservada.

---

#### 13. Continuidad

```text
ÚLTIMA TAREA APROBADA
DATA-DOM-001 — Definir gobierno federado de datos, propietarios, stewards y fuentes de verdad

TAREA ACTUAL APROBADA
DATA-DOM-002 — Definir catálogo de datos maestros, datos de referencia y dimensiones compartidas

SIGUIENTE TAREA RESERVADA
DATA-DOM-003 — Definir identidad, claves, códigos, jerarquías, ciclo de vida, fusión y separación de datos maestros
```


### ✅ DATA-DOM-003 — Definir identidad, claves, códigos, jerarquías, ciclo de vida, fusión y separación de datos maestros

**Estado:** APROBADA
**Tarea anterior:** `DATA-DOM-002 — Definir catálogo de datos maestros, datos de referencia y dimensiones compartidas` — APROBADA
**Tarea siguiente:** `DATA-DOM-004 — Definir capa semántica y registro canónico de métricas e indicadores` — RESERVADA
**Tipo de tarea:** documental; contrato canónico de identidad, claves, códigos, jerarquías, ciclo de vida y resolución no destructiva de duplicados para los datos maestros y de referencia del BLOQUE AB
**Bloque:** AB — Analítica, indicadores y datos maestros
**Fase:** exclusivamente documental
**Implementación técnica:** no autorizada
**Código, DDL, DML, migraciones, backfills o cambios en Supabase:** no autorizados
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir el contrato común mediante el cual los **62 objetos** materializados en `DATA-DOM-002` conservarán una identidad estable y podrán usar claves empresariales, códigos, aliases, jerarquías, vigencias y decisiones de fusión o separación sin perder historia, romper consumidores ni convertir coincidencias textuales en identidad.

La tarea responde, para cada objeto, a estas preguntas:

```text
qué permanece estable aunque cambie el nombre o la presentación
qué datos pueden actuar como claves de negocio o conciliación
qué función cumple un código y en qué alcance es único
qué valores son aliases o claves externas y no autoridad de identidad
qué relaciones forman jerarquía y cómo se conserva su vigencia
qué ocurre cuando un maestro se activa, cambia, se inactiva o se retira
cuándo dos registros pueden considerarse la misma identidad
cómo se revierte una fusión incorrecta o se separa un registro conflado
cómo se evita reescribir hechos y dimensiones históricas
```

El resultado no define nombres de columnas, tipos SQL, secuencias, UUID, constraints, índices, tablas, schemas, procedimientos de migración ni crosswalks físicos.

---

#### 2. Resultado sustantivo

Queda definido un contrato único de identidad maestra con las siguientes decisiones:

- los **62 de 62** objetos del catálogo reciben una decisión explícita de identidad y claves;
- los **43 datos maestros** y **19 datos de referencia** conservan identidad estable independiente de nombre visible o normalización textual;
- los **3 objetos AURA** mantienen su estado `BLOQUEADO` y no adquieren una fuente operativa por esta tarea;
- las **11 identidades `TI-SERVICE-001` a `TI-SERVICE-011`** se conservan sin renumeración ni alias alterno;
- `ENDPOINT` conserva `endpoint_id`;
- `SHARED_DEVICE` conserva `device_id` y `device_code`;
- `APPLICATION` conserva su identidad canónica y `app_code`;
- ningún correo, teléfono, nombre, dirección, serial, IP, MAC, SSID, URL, código de barras, código externo o valor normalizado puede producir por sí solo una fusión;
- ninguna relación padre-hijo se deriva de coincidencia de nombre o de un código que codifique el camino;
- toda fusión y separación es no destructiva y conserva procedencia, vigencia e historia;
- se crean **0** requisitos de prueba y se modifican **0**, porque `TREQ-DATA-001` ya protege expresamente estas reglas y asigna `DATA-DOM-003` entre sus tareas responsables.

---

#### 3. Contrato común de identidad

##### 3.1. Identificador canónico estable

Cada objeto maestro o de referencia tendrá una identidad canónica que no cambia por:

- renombrado;
- corrección ortográfica;
- normalización de texto;
- cambio de etiqueta o descripción;
- cambio de sede, área, padre o clasificación;
- cambio de proveedor, URL, IP, serial observado o dato de contacto;
- nueva versión de una configuración cuando la identidad raíz continúa siendo la misma;
- cambio de consumidor o aplicación que presenta el dato.

La representación física de ese identificador se decidirá en la arquitectura de datos aplicable. Esta tarea define la semántica, no el tipo técnico.

##### 3.2. Identidad no reutilizable

Una identidad retirada no se reasigna a otro objeto. Si un registro deja de existir para usos nuevos, sus referencias históricas continúan resolviendo el objeto que representaba durante su vigencia.

##### 3.3. Clave empresarial

Una clave empresarial sirve para detectar, buscar, conciliar o imponer una regla de unicidad dentro de un alcance explícito. Puede componerse de varios atributos.

La clave empresarial:

- no sustituye el identificador canónico;
- declara su alcance de unicidad;
- conserva vigencia cuando puede cambiar;
- no se deduce únicamente de una etiqueta visible;
- puede iniciar una revisión de duplicado, pero no autoriza una fusión automática.

##### 3.4. Clave técnica

Una clave técnica pertenece a un contrato técnico concreto y conserva su propia autoridad. `endpoint_id`, `device_id`, `device_code` y `app_code` se mantienen conforme a sus contratos vigentes y no se reinterpretan para identificar objetos distintos.

##### 3.5. Clave externa y alias

Un identificador de proveedor, autoridad, canal, sistema externo, archivo importado o plataforma conectada se considera clave externa o alias de conciliación.

Toda clave externa deberá conservar conceptualmente:

- sistema o autoridad de origen;
- valor original;
- objeto canónico relacionado;
- alcance cuando aplique;
- vigencia;
- estado de conciliación;
- evidencia o procedencia suficiente.

El modelo físico de crosswalks pertenece a `DATA-INT-003`. Esta tarea establece que una clave externa nunca desplaza por sí sola la identidad interna.

##### 3.6. Nombre y valor normalizado

Nombre, descripción, texto normalizado, transliteración, mayúsculas/minúsculas, espacios, signos y corrección ortográfica son representaciones.

```text
REPRESENTACIÓN NORMALIZADA
≠
IDENTIDAD CANÓNICA
```

Una coincidencia normalizada puede producir una alerta de calidad o un candidato de revisión. No puede fusionar registros ni cambiar relaciones por sí sola.

---

#### 4. Política de códigos

1. un código identifica de forma legible un objeto dentro del alcance definido por su propietario;
2. el código permanece separado del identificador canónico salvo cuando un contrato aprobado ya haya establecido la misma identidad, como `TI-SERVICE-*`;
3. un código deberá tener unicidad explícita dentro de su alcance;
4. un código no incorporará obligatoriamente el camino completo de una jerarquía, porque un cambio de padre no debe obligar a cambiar identidad;
5. un código retirado no se reutilizará para otro significado dentro de su alcance histórico;
6. un cambio de código conserva el código anterior como alias o referencia histórica cuando existan consumidores;
7. códigos externos conservan su fuente y no se elevan a código canónico sin decisión del propietario;
8. documentos, teléfonos, correos y otros datos personales no se usarán como códigos empresariales por conveniencia;
9. serial, MAC, IP, SSID, URL, barcode, SKU externo o identificador de proveedor no sustituyen el identificador interno salvo que un contrato canónico específico ya lo haya decidido;
10. el formato físico, longitud y constraint de cada código se resolverán en la arquitectura propietaria sin alterar estas reglas.

---

#### 5. Jerarquías y relaciones

##### 5.1. Jerarquía explícita

Una relación jerárquica solo existe cuando el propietario del dominio declara explícitamente:

- objeto padre;
- objeto hijo;
- tipo de relación;
- alcance;
- vigencia;
- fuente;
- autoridad para modificarla.

Compartir nombre, código, dirección, categoría o ubicación no crea jerarquía.

##### 5.2. Acyclicidad y profundidad

Cuando una relación sea una jerarquía estricta, no podrá contener ciclos. No se fija una profundidad universal: cada dominio puede conservar la profundidad que su modelo empresarial requiera.

##### 5.3. Reparenting

Mover un objeto a otro padre no cambia su identidad. La relación anterior conserva vigencia y la nueva comienza en su fecha efectiva.

##### 5.4. Historia efectiva

Los hechos históricos deberán poder resolver la jerarquía que era válida en su momento. `DATA-DOM-005` definirá el uso analítico de estas vigencias y snapshots sin modificar las identidades aquí aprobadas.

##### 5.5. Relación no equivale a jerarquía

Muchos vínculos son relaciones tipadas y no árboles: persona–vínculo, producto–proveedor, producto–presentación, servicio–aplicación, activo–endpoint, cliente–marca o recurso–activo. No se forzarán dentro de una jerarquía universal.

---

#### 6. Ciclo de vida común

No se crea un enum universal que reemplace los estados propios de cada dominio. Se fijan semánticas transversales que cada propietario deberá poder representar:

1. **alta o registro:** nace una identidad nueva cuando existe un objeto empresarial distinto;
2. **vigencia:** la identidad puede utilizarse para nuevas relaciones y operaciones dentro de su contrato;
3. **suspensión o inactividad:** cuando el dominio lo permita, se bloquean usos nuevos sin perder identidad ni historia;
4. **corrección:** se modifica un atributo sin cambiar identidad cuando el objeto sigue siendo el mismo;
5. **sucesión:** un objeto puede quedar sucedido por otro sin borrar el anterior;
6. **retiro:** deja de admitirse para usos nuevos, pero continúa resolviendo referencias históricas;
7. **fusión:** dos registros que realmente representaban una misma identidad se consolidan mediante decisión explícita y no destructiva;
8. **separación:** se revierte una fusión o se divide un registro conflado, restaurando identidades y relaciones con evidencia.

Reglas:

- cambiar un nombre no crea una identidad nueva;
- cambiar de padre jerárquico no crea una identidad nueva;
- cambiar un atributo que redefine materialmente qué objeto es puede exigir una identidad nueva según el propietario;
- un objeto ya referenciado por hechos no se elimina destructivamente para resolver un problema de catálogo;
- reactivar un objeto utiliza la misma identidad solo cuando se demuestra que sigue siendo el mismo objeto y el dominio permite la reactivación;
- una versión nueva de una regla o configuración no reutiliza la versión anterior como si nada hubiera cambiado.

---

#### 7. Fusión de identidades

Una fusión de maestros o referencias solo podrá ejecutarse cuando se demuestre que los registros candidatos representan la misma identidad dentro de la misma clase canónica.

Secuencia documental obligatoria:

```text
DETECTAR CANDIDATO
→ PRESERVAR AMBOS REGISTROS Y SU PROCEDENCIA
→ COMPARAR CLAVES, RELACIONES, VIGENCIAS Y EVIDENCIA
→ REVISIÓN DEL STEWARD
→ DECISIÓN DEL PROPIETARIO CUANDO EXCEDA SU DELEGACIÓN
→ DESIGNAR IDENTIDAD SUPERVIVIENTE O RESOLVER LA EQUIVALENCIA
→ CONSERVAR IDENTIFICADORES, CÓDIGOS Y ALIASES ANTERIORES
→ CERRAR USOS NUEVOS DE LA IDENTIDAD DUPLICADA
→ PROPAGAR LA DECISIÓN MEDIANTE LOS CONTRATOS PROPIETARIOS
→ CONSERVAR TRAZA PARA POSIBLE SEPARACIÓN
```

Queda prohibido fusionar automáticamente por:

- mismo nombre;
- mismo nombre normalizado;
- mismo correo;
- mismo teléfono;
- mismo código visible;
- mismo serial;
- misma IP o MAC;
- mismo código de barras;
- mismo proveedor;
- mismo padre jerárquico;
- misma dirección;
- similitud estadística o recomendación de IA sin decisión de stewardship.

Una fusión solo ocurre dentro de la misma clase canónica. `PERSON_IDENTITY` y `CUSTOMER_PERSON`, `PRODUCTO_MAESTRO` y `VARIANTE`, `OPERATIONAL_SITE` y `PHYSICAL_FACILITY`, `ACTIVO_FISICO` y `ENDPOINT`, o cualquier par de clases distintas no se fusionan entre sí; se relacionan mediante contratos explícitos.

---

#### 8. Separación y reversibilidad

La separación se utiliza cuando:

- una fusión anterior fue incorrecta;
- un registro contenía dos identidades empresariales distintas;
- una fuente externa confló sujetos u objetos;
- una clave o alias fue atribuido al maestro equivocado.

La separación deberá:

1. conservar el registro y la decisión que originaron la fusión;
2. restaurar identificadores anteriores cuando continúen siendo válidos o crear identidades nuevas únicamente para objetos realmente nuevos;
3. redistribuir aliases y claves externas según evidencia;
4. reconstruir relaciones actuales con propietario y steward;
5. no mover hechos históricos por aproximación;
6. reatribuir un hecho histórico solo cuando exista evidencia de que estaba vinculado a la identidad equivocada y el contrato propietario permita esa corrección;
7. conservar la relación entre identidad anterior, identidades resultantes y vigencias;
8. permitir que modelos analíticos posteriores expliquen restatements sin ocultar el contexto original.

`DATA-DOM-017` gobierna la reproducibilidad y los restatements analíticos derivados de correcciones históricas. `DATA-DOM-006` gobierna los procesos de transformación y reconciliación. `DATA-INT-003` gobierna crosswalks y claves externas.

---

#### 9. Matriz materializada por objeto

La siguiente matriz decide identidad, claves/códigos, jerarquía y tratamiento de fusión/separación para los **62 objetos** heredados de `DATA-DOM-002`.

|    # | Objeto canónico               | Clase             | Identidad y clave                                                                                                                                                                   | Código / alias                                                                                                                                  | Jerarquía                                                                                                                                               | Fusión y separación                                                                                                                                                                                             | Estado         |
| ---: | ----------------------------- | ----------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- |
|    1 | `ORGANIZATION_SCOPE`          | `DATO_MAESTRO`    | Identidad interna estable del alcance organizacional; nombre visible y denominaciones administrativas no son identidad.                                                             | Código empresarial separado cuando exista; los nombres anteriores permanecen como alias históricos y no se reutilizan como clave.               | No se infiere una jerarquía por nombre; cualquier agrupación entre alcances debe ser explícita, tipada y vigente.                                       | Fusión solo entre duplicados de la misma clase con evidencia; una reorganización empresarial se representa mediante relaciones y vigencia. La separación crea o restituye identidades sin borrar historia.      | `ESPECIFICADO` |
|    2 | `LEGAL_SUBJECT`               | `DATO_MAESTRO`    | Identidad interna estable de la persona jurídica o natural obligada; identificadores registrales o tributarios son claves externas con fuente y vigencia.                           | Código interno separado si el dominio lo usa; razón social, nombre legal e identificadores externos nunca sustituyen la identidad canónica.     | Sin jerarquía implícita; propiedad, control o pertenencia se expresan como relaciones tipadas, no como parentesco por nombre.                           | Fusión únicamente si evidencia autorizada demuestra que dos registros representan el mismo sujeto. Una fusión, escisión o cambio societario real no se convierte automáticamente en fusión de registros.        | `ESPECIFICADO` |
|    3 | `BRAND`                       | `DATO_MAESTRO`    | Identidad estable de marca independiente de nombre visible, titular, sede, establecimiento y piezas publicadas.                                                                     | Código empresarial separado; nombres comerciales anteriores o alternos son alias con vigencia.                                                  | Sin jerarquía implícita; portafolios o agrupaciones requieren relación explícita.                                                                       | Cambio de nombre conserva identidad. Fusión solo para duplicados de la misma marca con evidencia; separación crea identidades distintas y conserva relaciones históricas con titulares y activos.               | `ESPECIFICADO` |
|    4 | `COMMERCIAL_ESTABLISHMENT`    | `DATO_MAESTRO`    | Identidad estable del establecimiento; registro o matrícula externa actúa como clave externa, no como identidad interna.                                                            | Código interno separado si aplica; denominación pública y códigos externos conservan fuente y vigencia.                                         | Se relaciona de forma tipada con LEGAL_SUBJECT, BRAND y OPERATIONAL_SITE; no se deriva una jerarquía por coincidencia de nombres.                       | Fusión solo ante duplicado probado del mismo establecimiento. Cierre o cambio registral retira o versiona la relación sin borrar historia.                                                                      | `ESPECIFICADO` |
|    5 | `BUSINESS_LINE`               | `DATO_MAESTRO`    | Identidad estable de la línea de negocio, separada de marca, sede y canal.                                                                                                          | Código empresarial separado cuando exista; el nombre comercial no es clave.                                                                     | Agrupación organizacional solo mediante relación explícita; no se infiere árbol por nomenclatura.                                                       | Consolidación o división empresarial no reescribe hechos: la fusión exige decisión de propietario y la separación crea nuevas identidades con vigencia y sucesión.                                              | `ESPECIFICADO` |
|    6 | `PHYSICAL_FACILITY`           | `DATO_MAESTRO`    | Identidad estable del inmueble o espacio físico; dirección y coordenadas son atributos, no identidad.                                                                               | Código interno separado cuando se administre; referencias catastrales, contractuales o de proveedor son claves externas con procedencia.        | Relaciones de ocupación con OPERATIONAL_SITE y contención de zonas se versionan; no existe jerarquía por texto de dirección.                            | Fusión solo si dos registros representan el mismo espacio físico. Una mudanza a otro inmueble crea otra identidad física aunque el OPERATIONAL_SITE pueda continuar.                                            | `ESPECIFICADO` |
|    7 | `OPERATIONAL_SITE`            | `DATO_MAESTRO`    | Identidad estable de la sede operativa; instalación, marca, dirección y tipo no sustituyen el identificador.                                                                        | Código canónico separado del nombre visible y de códigos externos; el código retirado no se reutiliza dentro de su alcance histórico.           | Pertenece mediante relaciones tipadas a organización e instalación; áreas se relacionan con la sede con vigencia.                                       | Fusión solo para duplicado comprobado de la misma sede. Traslado físico modifica la relación con PHYSICAL_FACILITY sin cambiar identidad cuando la sede empresarial continúa siendo la misma.                   | `ESPECIFICADO` |
|    8 | `ORGANIZATIONAL_AREA`         | `DATO_MAESTRO`    | Identidad estable del área funcional; su nombre puede repetirse en sedes distintas.                                                                                                 | Código empresarial con unicidad en el alcance que defina el propietario; nunca se usa el nombre como clave global.                              | Puede depender de OPERATIONAL_SITE y, si el dominio lo define, de otra área; toda relación padre-hijo es explícita, acíclica y con vigencia.            | Fusión solo de áreas duplicadas equivalentes en el mismo alcance. Reorganizar o mover un área conserva historia; una división crea nuevas identidades.                                                          | `ESPECIFICADO` |
|    9 | `PHYSICAL_ZONE`               | `DATO_MAESTRO`    | Identidad estable de la zona física; etiqueta, piso o ubicación textual no bastan como identidad.                                                                                   | Código o etiqueta de operación queda separado y scoped a la instalación o sede que corresponda.                                                 | Contención explícita bajo PHYSICAL_FACILITY, OPERATIONAL_SITE u ORGANIZATIONAL_AREA según el contrato propietario; cambios de padre conservan vigencia. | Fusión solo si se demuestra que dos registros representan la misma zona. Una remodelación que cambia materialmente el espacio puede retirar la identidad anterior y crear otra.                                 | `ESPECIFICADO` |
|   10 | `WORKSTATION`                 | `DATO_MAESTRO`    | Identidad estable del punto de ejecución; no equivale a equipo, endpoint, dispositivo compartido, actor ni área.                                                                    | Código operativo separado y scoped al contexto correspondiente; nombre o número visible no es identidad.                                        | Se vincula de forma explícita con área o zona; el dispositivo asignado es relación independiente.                                                       | Fusión solo para duplicados del mismo punto operativo. Reubicación o cambio de dispositivo actualiza relaciones con vigencia sin fusión automática.                                                             | `ESPECIFICADO` |
|   11 | `EXTERNAL_OPERATIONAL_POINT`  | `DATO_MAESTRO`    | Identidad estable del punto externo controlado; dirección privada, custodio o tercero no son identidad.                                                                             | Código interno solo cuando sea necesario; referencias externas tienen fuente, vigencia y finalidad.                                             | Se relaciona con línea, operación, custodia y territorio de forma tipada; no se promueve a sede mediante jerarquía implícita.                           | Fusión solo ante coincidencia probada del mismo punto. Al expirar la finalidad se retira para usos nuevos sin eliminar operaciones históricas.                                                                  | `ESPECIFICADO` |
|   12 | `PERSON_IDENTITY`             | `DATO_MAESTRO`    | Identidad empresarial estable de la persona. Documento, correo, teléfono, nombre y usuario autenticado son evidencias o claves candidatas, nunca identidad suficiente por sí solas. | No se exige código humano basado en PII. Identificadores documentales y de autenticación se mantienen separados, con fuente y vigencia.         | No aplica jerarquía de identidad; relaciones laborales, de cliente y de acceso permanecen separadas.                                                    | Fusión solo tras revisión de steward y evidencia múltiple. Debe ser reversible: una separación restituye identidades y relaciones sin borrar trazas ni hechos históricos.                                       | `ESPECIFICADO` |
|   13 | `WORKER_PROFILE`              | `DATO_MAESTRO`    | Identidad estable del perfil laboral operativo, enlazada con PERSON_IDENTITY y el vínculo vigente sin sustituirlos.                                                                 | No usa nombre, correo, cargo o número de turno como código de identidad.                                                                        | No forma jerarquía; asignaciones, cargos y roles son relaciones o referencias independientes.                                                           | No se fusionan perfiles para resolver cambios de vínculo. Un duplicado se corrige contra la misma PERSON_IDENTITY conservando la historia; separación sigue la evidencia del vínculo.                           | `ESPECIFICADO` |
|   14 | `EMPLOYMENT_RELATIONSHIP`     | `DATO_MAESTRO`    | Identidad estable de cada vínculo laboral o contractual; persona, empleador y vigencia forman clave empresarial de control, no la identidad canónica.                               | No requiere código reutilizable; números contractuales externos, cuando existan, son referencias con procedencia.                               | No aplica jerarquía; relaciona persona, sujeto jurídico, posición y vigencia.                                                                           | No se fusionan vínculos distintos. Prórrogas o cambios se versionan según el dominio; reingreso que constituye un vínculo nuevo recibe identidad nueva.                                                         | `ESPECIFICADO` |
|   15 | `CONTRACTUAL_POSITION`        | `DATO_REFERENCIA` | Identidad estable de la denominación contractual o administrativa del cargo.                                                                                                        | Código de referencia separado del nombre; códigos retirados no se reasignan a otro significado.                                                 | Jerarquía solo si VISO define una clasificación explícita de posiciones; nunca se deriva autorización o rango por el nombre.                            | Duplicados pueden consolidarse con steward y mapeo de historia; una posición obsoleta se retira o sucede, no se elimina de relaciones históricas.                                                               | `ESPECIFICADO` |
|   16 | `BASE_ROLE`                   | `DATO_REFERENCIA` | Conserva la identidad y clave vigentes del catálogo canónico de autorización; cargo y persona no sustituyen esa identidad.                                                          | La clave de rol existente es estable; etiquetas o traducciones son presentación.                                                                | No se introduce herencia de roles por esta tarea; cualquier relación entre roles debe provenir del modelo de autorización aprobado.                     | No se fusionan roles por similitud de nombre o permisos. Renumerar o reutilizar una clave existente queda prohibido; retiro conserva asignaciones históricas.                                                   | `ESPECIFICADO` |
|   17 | `OPERATIONAL_ROLE`            | `DATO_REFERENCIA` | Identidad estable de la función operativa, separada de BASE_ROLE, cargo, persona y asignación.                                                                                      | Código canónico del catálogo operativo cuando exista; nombre visible no es clave.                                                               | No se infiere jerarquía ni herencia de permisos. Relaciones con procesos, áreas o funciones deben ser explícitas.                                       | Fusión solo ante duplicado semántico probado y con impacto revisado; asignaciones históricas conservan el identificador que era vigente.                                                                        | `ESPECIFICADO` |
|   18 | `WORK_ASSIGNMENT`             | `DATO_MAESTRO`    | Identidad estable de la asignación; persona, sede, área, función, tipo y vigencia forman una clave empresarial de control.                                                          | No requiere código humano; cualquier referencia externa se conserva separada.                                                                   | No forma jerarquía; vincula identidades ya gobernadas y puede coexistir con otras asignaciones cuando la regla del dominio lo permita.                  | No se fusionan asignaciones distintas. Solapamientos o duplicados se corrigen con vigencia y evidencia, sin reescribir turnos o hechos históricos.                                                              | `ESPECIFICADO` |
|   19 | `CUSTOMER_PERSON`             | `DATO_MAESTRO`    | Identidad estable de persona cliente. Nombre, documento, teléfono, correo, QR o cuenta autenticada no son identidad suficiente.                                                     | No se construye código desde PII; identificadores de cuenta y contactos son referencias separadas.                                              | No aplica jerarquía; relaciones por marca, perfil, contactos, fidelización y consentimientos permanecen separadas.                                      | Fusión manual y reversible solo con evidencia suficiente. La separación debe preservar pedidos, movimientos de fidelización, casos y autorizaciones con su procedencia original.                                | `ESPECIFICADO` |
|   20 | `CUSTOMER_CONTACT`            | `DATO_MAESTRO`    | Identidad estable del dato de contacto vinculado a CUSTOMER_PERSON; el valor normalizado es clave de búsqueda y conciliación, no identidad absoluta.                                | Correo o teléfono se conserva con tipo, fuente, verificación y vigencia; no se convierte en código empresarial global.                          | No aplica jerarquía.                                                                                                                                    | Consolidación solo si se prueba que dos registros representan el mismo contacto de la misma persona y alcance. Mover un contacto entre personas exige evidencia y no provoca fusión de personas.                | `ESPECIFICADO` |
|   21 | `CUSTOMER_RELATIONSHIP`       | `DATO_MAESTRO`    | Identidad estable de la relación entre CUSTOMER_PERSON y una marca, alcance o contexto, con vigencia propia.                                                                        | La combinación de extremos, tipo y vigencia sirve como clave empresarial de control; no sustituye el identificador.                             | No aplica jerarquía; múltiples relaciones pueden coexistir sin convertirse en una sola.                                                                 | No se fusionan relaciones materialmente distintas. Duplicados exactos pueden consolidarse con evidencia; cierre y reapertura conservan historia.                                                                | `ESPECIFICADO` |
|   22 | `CUSTOMER_PROFILE`            | `DATO_MAESTRO`    | Identidad estable del perfil de autoservicio ligado a la persona y relación permitida; no sustituye CUSTOMER_PERSON.                                                                | No usa nombre, correo ni cuenta de autenticación como código.                                                                                   | No aplica jerarquía.                                                                                                                                    | No se fusiona con la identidad de persona ni con perfiles administrativos. Duplicados se corrigen conservando la procedencia de atributos y cambios.                                                            | `ESPECIFICADO` |
|   23 | `CUSTOMER_PREFERENCE`         | `DATO_MAESTRO`    | Identidad estable de la preferencia gobernada; persona, tipo, alcance y vigencia son coordenadas de negocio.                                                                        | No requiere código humano; el tipo de preferencia proviene del contrato propietario y no de texto libre cuando exista catálogo.                 | No aplica jerarquía salvo una taxonomía explícita propietaria; una preferencia no hereda otra por nombre.                                               | No se fusionan versiones o alcances distintos. Un cambio conserva vigencia y sucede al valor anterior sin convertirlo en consentimiento.                                                                        | `ESPECIFICADO` |
|   24 | `LOYALTY_ACCOUNT`             | `DATO_MAESTRO`    | Identidad estable de la cuenta de fidelización, separada de CUSTOMER_PERSON, cuenta autenticada, saldo y movimientos.                                                               | Número visible, QR u otro token son referencias rotables o de presentación, no identidad canónica.                                              | No aplica jerarquía.                                                                                                                                    | Una fusión solo puede seguir una decisión aprobada sobre identidad del cliente y debe conservar el ledger original. Una separación no redistribuye movimientos sin evidencia.                                   | `ESPECIFICADO` |
|   25 | `LOYALTY_PROGRAM_RULE`        | `DATO_REFERENCIA` | Identidad estable de la regla de programa y versiones diferenciadas por vigencia.                                                                                                   | Código de regla separado de su versión y descripción; códigos retirados no se reutilizan con otro significado.                                  | No aplica jerarquía por defecto; agrupaciones funcionales son metadatos, no herencia.                                                                   | Las versiones no se fusionan. Una regla cambia mediante nueva versión o retiro; duplicados semánticos requieren revisión antes de consolidación.                                                                | `ESPECIFICADO` |
|   26 | `PRODUCTO_MAESTRO`            | `DATO_MAESTRO`    | Identidad estable del elemento empresarial; nombre, marca, código de barras, proveedor, presentación y receta no son identidad.                                                     | Código empresarial separado de etiquetas y códigos externos; códigos de proveedor o canal quedan como aliases/crosswalks con fuente y vigencia. | Se clasifica mediante taxonomías y relaciones; variante y presentación son identidades subordinadas, no niveles que cambien la identidad del producto.  | Fusión solo de duplicados comprobados con revisión de impacto en inventario, recetas, compras, ventas y finanzas. La separación conserva todas las referencias históricas y exige evidencia para reatribuirlas. | `ESPECIFICADO` |
|   27 | `VARIANTE`                    | `DATO_MAESTRO`    | Identidad estable de una configuración diferenciada vinculada a PRODUCTO_MAESTRO.                                                                                                   | Código scoped al producto cuando exista; atributos diferenciadores no se convierten por sí solos en identificador.                              | Pertenece explícitamente a PRODUCTO_MAESTRO; no se infiere por nombre o presentación.                                                                   | Fusión solo cuando las configuraciones son realmente equivalentes. Una separación crea identidades distintas y conserva hechos referidos a la variante original.                                                | `ESPECIFICADO` |
|   28 | `PRESENTACION`                | `DATO_MAESTRO`    | Identidad estable de la forma física de compra, recepción, almacenamiento, remisión o venta.                                                                                        | Código o etiqueta separado de cantidad, unidad, multiplicador y empaque; códigos externos se gestionan con procedencia.                         | Pertenece a producto o variante mediante relación explícita; no se confunde con UNIDAD_DE_MEDIDA.                                                       | Solo pueden fusionarse presentaciones si cantidad, unidad, multiplicador, empaque y contexto equivalen de forma demostrada. Separación corrige perfiles conflados sin alterar factores históricos.              | `ESPECIFICADO` |
|   29 | `UNIDAD_DE_MEDIDA`            | `DATO_REFERENCIA` | Identidad estable de la unidad y su dimensión semántica.                                                                                                                            | Código canónico independiente de etiqueta visible; códigos alternos son aliases con fuente.                                                     | No usa jerarquía de identidad; conversiones o compatibilidades son relaciones controladas y no parentesco.                                              | No se fusionan unidades por abreviatura o texto parecido. Corrección o retiro conserva conversiones e historia utilizadas por hechos anteriores.                                                                | `ESPECIFICADO` |
|   30 | `TAXONOMIA_TIPO_MAESTRO`      | `DATO_REFERENCIA` | Identidad estable de cada valor del tipo maestro.                                                                                                                                   | Código canónico separado de etiqueta; nunca se reutiliza para otro significado.                                                                 | Plana salvo que el propietario apruebe explícitamente una relación padre-hijo; cualquier jerarquía será acíclica y efectiva.                            | Duplicados pueden consolidarse solo con steward y mapeo histórico. Un valor retirado sigue resolviendo hechos anteriores.                                                                                       | `ESPECIFICADO` |
|   31 | `TAXONOMIA_INVENTARIO`        | `DATO_REFERENCIA` | Identidad estable de cada clasificación de inventario.                                                                                                                              | Código canónico separado del nombre y de reglas operativas.                                                                                     | Jerarquía solo si NEXO la declara explícitamente; no se infiere desde comportamiento de stock.                                                          | Fusión de duplicados requiere equivalencia semántica y revisión de consumidores; retiro conserva clasificación histórica.                                                                                       | `ESPECIFICADO` |
|   32 | `TAXONOMIA_OPERACIONAL`       | `DATO_REFERENCIA` | Identidad estable de la clasificación operacional.                                                                                                                                  | Código canónico separado de etiquetas y nombres de pantalla.                                                                                    | Jerarquía explícita y acíclica solo cuando sea necesaria; no controla por sí sola menú ni permisos.                                                     | Consolidación únicamente de duplicados semánticos; reparenting o retiro conserva vigencia histórica.                                                                                                            | `ESPECIFICADO` |
|   33 | `LOC`                         | `DATO_MAESTRO`    | Identidad estable de ubicación lógica o física de inventario; nombre, código visible, sede o área no son identidad suficiente.                                                      | Código scoped al contexto locativo; no codifica el camino completo de la jerarquía para evitar cambio de identidad al reubicar.                 | Jerarquía de contención explícita, acíclica y con vigencia; cada cambio de padre conserva el contexto histórico.                                        | Fusión solo ante duplicado real de la misma ubicación. Reubicación o cierre no borra movimientos ni hechos que referenciaron la LOC anterior.                                                                   | `ESPECIFICADO` |
|   34 | `ACTIVO_FISICO`               | `DATO_MAESTRO`    | Conserva la identidad física estable gobernada por NEXO; serial, placa, marca, modelo o etiqueta son claves auxiliares, no identidad absoluta.                                      | Código patrimonial o etiqueta se mantiene separado; identificadores de fabricante son externos con procedencia.                                 | Clase, ubicación, custodia y componentes se expresan mediante relaciones; no se infiere jerarquía desde seriales o categorías.                          | Fusión solo si se demuestra que dos registros representan el mismo objeto físico. Sustitución de un activo crea otra identidad y enlaza la sucesión sin reutilizar el ID.                                       | `ESPECIFICADO` |
|   35 | `CLASE_DE_ACTIVO`             | `DATO_REFERENCIA` | Identidad estable de la clasificación de activo.                                                                                                                                    | Código canónico separado de nombre y reglas de mantenimiento.                                                                                   | Puede tener jerarquía explícita y acíclica si NEXO la requiere; no se deriva de atributos físicos.                                                      | Duplicados semánticos pueden consolidarse con historia; retiro no cambia la clase que aplicaba a activos históricos.                                                                                            | `ESPECIFICADO` |
|   36 | `ESPECIFICACION_PRODUCTO`     | `DATO_MAESTRO`    | Identidad raíz estable de la especificación; cada cambio material se conserva como versión con vigencia.                                                                            | Clave empresarial de control por objeto, alcance y versión; no usa el texto completo de la especificación como identidad.                       | No forma jerarquía; puede aplicar a producto, presentación, proveedor, receta u otro objeto mediante relaciones tipadas.                                | Las versiones no se fusionan ni sobrescriben. Duplicados de identidad raíz se consolidan solo con evidencia; una separación conserva versiones y objetos afectados.                                             | `ESPECIFICADO` |
|   37 | `PROVEEDOR`                   | `DATO_MAESTRO`    | Identidad estable del proveedor. Razón social, documento tributario, cuenta bancaria, correo o contacto son atributos o claves externas, no identidad por sí solos.                 | Código interno separado cuando exista; identificadores legales y de plataformas externas conservan fuente y vigencia.                           | No existe jerarquía implícita; grupos empresariales, sedes o contactos se relacionan explícitamente.                                                    | Fusión solo si evidencia suficiente confirma el mismo proveedor. Una fusión societaria real se modela con sucesión y vigencia, no como deduplicación automática.                                                | `ESPECIFICADO` |
|   38 | `CONTACTO_PROVEEDOR`          | `DATO_MAESTRO`    | Identidad estable del contacto o canal relacionado con PROVEEDOR; correo y teléfono no son identidad universal.                                                                     | No requiere código empresarial; valores de contacto conservan tipo, verificación, fuente y vigencia.                                            | No aplica jerarquía.                                                                                                                                    | Consolidación solo del mismo contacto con evidencia. Un cambio de proveedor o función modifica la relación y vigencia sin fusionar proveedores.                                                                 | `ESPECIFICADO` |
|   39 | `RELACION_PRODUCTO_PROVEEDOR` | `DATO_MAESTRO`    | Identidad estable de la relación de suministro; producto, proveedor, presentación, alcance y vigencia forman clave empresarial de control.                                          | No requiere código independiente salvo contrato propietario; identificadores externos se mantienen como crosswalks.                             | No aplica jerarquía; relaciona identidades gobernadas.                                                                                                  | No se fusionan relaciones materialmente distintas. Duplicados exactos pueden consolidarse, pero precio, oferta, contrato y condición permanecen objetos separados.                                              | `ESPECIFICADO` |
|   40 | `CONDICION_COMERCIAL`         | `DATO_MAESTRO`    | Identidad raíz estable de la condición comercial con versiones por vigencia y contexto.                                                                                             | Clave empresarial de control por proveedor/relación, tipo de condición, alcance y vigencia; el valor monetario no es identidad.                 | No aplica jerarquía; escalas y dependencias se representan como reglas versionadas.                                                                     | Versiones no se fusionan. Una nueva condición sucede a la anterior; consolidar duplicados exige igualdad de alcance, fuente y vigencia.                                                                         | `ESPECIFICADO` |
|   41 | `TAXONOMIA_COMPRA`            | `DATO_REFERENCIA` | Identidad estable de la clasificación de abastecimiento.                                                                                                                            | Código canónico separado de etiquetas y condiciones de proveedor.                                                                               | Jerarquía explícita y acíclica solo si ORIGO la define; no se hereda desde taxonomías de producto o inventario.                                         | Fusión de duplicados requiere equivalencia semántica y conservación de compras históricas; retiro conserva vigencia.                                                                                            | `ESPECIFICADO` |
|   42 | `RECETA`                      | `DATO_MAESTRO`    | Identidad raíz estable del conocimiento de receta; la versión publicada y la ejecución son identidades/artefactos distintos.                                                        | Código de receta separado de nombre, producto de salida y versión cuando exista; no se deriva de ingredientes.                                  | Se relaciona con FAMILIA_PRODUCTIVA, productos de salida e ingredientes; esas relaciones no crean una jerarquía de identidad implícita.                 | Fusión solo de duplicados comprobados de la misma receta raíz. Las versiones nunca se fusionan; separación crea recetas distintas sin cambiar lotes o ejecuciones históricas.                                   | `ESPECIFICADO` |
|   43 | `FAMILIA_PRODUCTIVA`          | `DATO_REFERENCIA` | Identidad estable de la taxonomía productiva.                                                                                                                                       | Código canónico separado del nombre.                                                                                                            | Jerarquía explícita y acíclica solo si FOGO la necesita; no se confunde con categoría de producto o compra.                                             | Duplicados semánticos pueden consolidarse con trazabilidad; reparenting y retiro conservan vigencia.                                                                                                            | `ESPECIFICADO` |
|   44 | `RUTA_PRODUCTIVA`             | `DATO_MAESTRO`    | Identidad estable de la ruta productiva reutilizable; ejecución concreta no comparte esa identidad.                                                                                 | Código empresarial separado cuando exista; secuencia o nombre de pasos no constituyen clave de identidad.                                       | No se modela como jerarquía por secuencia; relaciones con recursos, familias y productos son tipadas y versionadas.                                     | Fusión solo de rutas realmente duplicadas. Un cambio material de definición conserva historia mediante versión o sucesión según contrato FOGO; no reescribe ejecuciones previas.                                | `ESPECIFICADO` |
|   45 | `RECURSO_PRODUCTIVO`          | `DATO_MAESTRO`    | Identidad estable del recurso funcional productivo; cuando exista ACTIVO_FISICO relacionado, ambas identidades permanecen separadas.                                                | Código operativo separado de placa, serial o nombre del activo relacionado.                                                                     | Puede agruparse de forma explícita por área o familia; no se deriva una jerarquía desde el activo físico.                                               | Fusión solo ante duplicado del mismo recurso funcional. Sustitución del activo relacionado cambia la relación, no obliga a reutilizar ni fusionar identidades.                                                  | `ESPECIFICADO` |
|   46 | `COMMERCIAL_CHANNEL`          | `DATO_REFERENCIA` | Identidad estable del canal comercial, separada de cuenta externa, sede, marca y pedido.                                                                                            | Código canónico interno; identificadores de Rappi, web, mensajería u otros proveedores son claves externas con fuente.                          | Plana por defecto; agrupaciones de canales son relaciones o clasificación explícitas.                                                                   | No se fusionan canales por usar el mismo proveedor o nombre. Duplicados semánticos requieren revisión; retiro conserva ventas históricas.                                                                       | `ESPECIFICADO` |
|   47 | `CATEGORIA_COMERCIAL`         | `DATO_REFERENCIA` | Identidad estable de la categoría de navegación u oferta.                                                                                                                           | Código canónico separado de etiqueta visible y orden de presentación.                                                                           | Jerarquía explícita, acíclica y efectiva cuando PULSO la use; reparenting conserva historia.                                                            | Fusión solo de categorías duplicadas semánticamente y con revisión de publicaciones; retiro no cambia la categoría histórica de una oferta o venta.                                                             | `ESPECIFICADO` |
|   48 | `OFERTA_COMERCIAL`            | `DATO_MAESTRO`    | Identidad raíz estable de la configuración vendible; producto/variante, sede, canal y vigencia son coordenadas de negocio, no identidad única por sí solas.                         | Código de oferta separado cuando exista; precio, disponibilidad y nombre comercial no son código de identidad.                                  | Se relaciona con CATEGORIA_COMERCIAL y dimensiones de contexto; no forma jerarquía propia.                                                              | Ofertas vigentes distintas no se fusionan. Cambios materiales se versionan o suceden; duplicados exactos requieren revisión antes de consolidar.                                                                | `ESPECIFICADO` |
|   49 | `CENTRO_DE_COSTO`             | `DATO_MAESTRO`    | Identidad estable del centro económico, independiente de sede, área, marca y canal.                                                                                                 | Código financiero separado del nombre; no se reutiliza para otro centro dentro del alcance histórico.                                           | Jerarquía financiera explícita, acíclica y con vigencia; el código no codifica el camino jerárquico.                                                    | Consolidación administrativa conserva identidades históricas y relación de sucesión; una división crea nuevos centros y no reescribe hechos económicos anteriores.                                              | `ESPECIFICADO` |
|   50 | `MONEDA`                      | `DATO_REFERENCIA` | Identidad estable de la unidad monetaria reconocida por la fuente financiera autorizada.                                                                                            | Código monetario gobernado por la fuente aplicable; etiquetas y símbolos son presentación.                                                      | No aplica jerarquía.                                                                                                                                    | No se fusionan monedas por símbolo o nombre parecido. Cambio de código o retiro conserva vigencia y referencias históricas.                                                                                     | `ESPECIFICADO` |
|   51 | `PERIODO_ECONOMICO`           | `DATO_REFERENCIA` | Identidad estable del periodo económico; calendario, inicio, fin y alcance forman clave empresarial de control.                                                                     | Código de periodo separado si NUMERA lo usa; fechas visibles no son identidad canónica.                                                         | No aplica jerarquía de identidad; pertenencia a año u otro calendario se modela como relación temporal.                                                 | Periodos distintos no se fusionan. Correcciones conservan versión o sucesión y no cambian hechos ya registrados sin proceso de restatement.                                                                     | `ESPECIFICADO` |
|   52 | `PERIODO_CONTABLE`            | `DATO_REFERENCIA` | Identidad estable del periodo contable gobernado por NUMERA o sistema contable autorizado.                                                                                          | Código o referencia externa conserva fuente y vigencia; no se confunde con PERIODO_ECONOMICO.                                                   | No aplica jerarquía de identidad.                                                                                                                       | No se fusionan periodos por compartir fechas. Correcciones o cierres se gestionan por vigencia/estado del dominio y preservan historia.                                                                         | `ESPECIFICADO` |
|   53 | `PERIODO_FISCAL`              | `DATO_REFERENCIA` | Identidad estable del periodo fiscal dentro del marco y autoridad aplicables.                                                                                                       | Código o referencia de la autoridad externa se conserva como clave externa con procedencia.                                                     | No aplica jerarquía de identidad.                                                                                                                       | No se fusionan periodos fiscales por equivalencia de fechas. Cambios oficiales conservan la versión y fuente que eran aplicables.                                                                               | `ESPECIFICADO` |
|   54 | `CLASIFICACION_ECONOMICA`     | `DATO_REFERENCIA` | Identidad estable de la clasificación económica.                                                                                                                                    | Código financiero canónico separado de nombre, importe y hecho económico.                                                                       | Jerarquía explícita y acíclica solo si NUMERA la define; reparenting conserva vigencia.                                                                 | Fusión de duplicados requiere equivalencia semántica y análisis de reportes; retiro no reclasifica hechos históricos por defecto.                                                                               | `ESPECIFICADO` |
|   55 | `PERFIL_DE_MARCA`             | `DATO_MAESTRO`    | Identidad raíz estable del perfil de marca y versiones de contenido/reglas; conserva el bloqueo operativo heredado mientras AURA no esté habilitada.                                | Código o vínculo con BRAND separado de la versión; nombres y prompts no son identidad.                                                          | Se relaciona con BRAND; no crea jerarquía adicional por texto o plantilla.                                                                              | No se ejecutan fusiones operativas mientras la fuente permanezca BLOQUEADO. Cuando se habilite, las versiones se suceden sin sobrescritura y duplicados requieren revisión de propietario.                      | `BLOQUEADO`    |
|   56 | `AUDIENCIA`                   | `DATO_MAESTRO`    | Identidad estable de la definición de audiencia; la membresía calculada no forma parte de la identidad y la fuente operativa continúa bloqueada.                                    | Código de audiencia separado de nombre, consulta, segmento externo o lista exportada.                                                           | No se asume jerarquía porque audiencias pueden solaparse; cualquier relación de inclusión debe ser explícita y versionada.                              | No se fusionan audiencias por superposición de miembros. Cambios de definición se versionan o suceden; no hay fusión operativa mientras AURA permanezca BLOQUEADO.                                              | `BLOQUEADO`    |
|   57 | `ACTIVO_DE_MARCA`             | `DATO_MAESTRO`    | Identidad estable del activo de marca; archivo físico, hash, URL, tamaño y derivado no sustituyen la identidad gobernada. La fuente operativa continúa bloqueada.                   | Código interno separado cuando exista; identificadores de Storage o proveedor son referencias técnicas.                                         | Original, versión y derivados se relacionan explícitamente; no forman una jerarquía de autoridad por carpeta o nombre.                                  | No se fusionan activos por archivo parecido. Duplicados solo con evidencia de contenido, derechos y procedencia; no hay fusión operativa mientras AURA permanezca BLOQUEADO.                                    | `BLOQUEADO`    |
|   58 | `ENDPOINT`                    | `DATO_MAESTRO`    | Conserva `endpoint_id` como identidad técnica estable de la instalación administrada; hostname, IP, MAC, serial, user agent y fingerprint no son identidad.                         | No se introduce código alternativo. Etiquetas técnicas son atributos observables con vigencia.                                                  | Relaciones con ACTIVO_FISICO, SHARED_DEVICE, red y aplicaciones provienen del contrato TI; no constituyen jerarquía de identidad.                       | No se fusionan generaciones de endpoint. Una reinstalación que crea nueva generación conserva identidad distinta conforme a TI-DOM-002; duplicados técnicos requieren reconciliación, no unión por huella.      | `ESPECIFICADO` |
|   59 | `SHARED_DEVICE`               | `DATO_MAESTRO`    | Conserva `device_id` como identidad y `device_code` como código empresarial del dispositivo compartido; actor, endpoint y activo permanecen separados.                              | `device_code` es estable en su contrato; etiquetas de sede, área o estación no sustituyen el código.                                            | Relaciones con endpoint, sede, área y aplicaciones son explícitas; no crean herencia de permisos.                                                       | Fusión solo ante registro duplicado del mismo dispositivo lógico con evidencia. Cambio de endpoint puede conservar el mismo dispositivo lógico y se registra como cambio de relación.                           | `ESPECIFICADO` |
|   60 | `NETWORK_RESOURCE`            | `DATO_MAESTRO`    | Identidad interna estable del recurso de red; IP, MAC, SSID, hostname, puerto o proveedor no constituyen identidad por sí solos.                                                    | Código técnico separado cuando el dominio lo requiera; direcciones y nombres operativos conservan vigencia.                                     | Topología y dependencia se expresan mediante relaciones tipadas y versionadas; no se infiere jerarquía por prefijo de red o nombre.                     | Fusión solo si dos registros representan el mismo recurso técnico. Cambio de dirección o configuración conserva identidad; sustitución física o lógica material puede crear sucesor.                            | `ESPECIFICADO` |
|   61 | `APPLICATION`                 | `DATO_MAESTRO`    | Conserva la identidad canónica de aplicación gobernada por SHELL y su `app_code`; repositorio, URL, ambiente, despliegue y proveedor no son identidad.                              | `app_code` permanece estable y no se renumera por cambios técnicos o de branding.                                                               | Sin jerarquía implícita; dependencias, ambientes y servicios se modelan por relaciones específicas.                                                     | No se fusionan aplicaciones por compartir repositorio, dominio o proveedor. Renombrar interfaz conserva identidad; una aplicación distinta requiere identidad distinta.                                         | `ESPECIFICADO` |
|   62 | `TECH_SERVICE`                | `DATO_REFERENCIA` | Conserva exactamente las once identidades `TI-SERVICE-001` a `TI-SERVICE-011`; servicio, aplicación, proveedor y componente permanecen separados.                                   | Los códigos `TI-SERVICE-*` son estables; no se crean aliases numéricos ni se reutiliza una identidad retirada.                                  | Las dependencias de servicios no se tratan como jerarquía de identidad; permanecen relaciones tipadas del BLOQUE Z.                                     | No se fusionan ni renumeran familias por similitud operativa. Cualquier retiro conserva código e historia; una nueva familia requiere decisión canónica separada.                                               | `ESPECIFICADO` |

---

#### 10. Instancias `TECH_SERVICE` heredadas

Las once identidades aprobadas en `TI-DOM-001` y preservadas por `DATA-DOM-002` mantienen decisión individual. Ninguna se renumera, se fusiona o cambia de significado en esta tarea.

| Identidad        | Servicio                                                                | Decisión de identidad                                                                      | Jerarquía                                                               | Ciclo de vida y fusión                                                                                            | Estado         |
| ---------------- | ----------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- | -------------- |
| `TI-SERVICE-001` | Cuentas, identidad y acceso tecnológico                                 | El identificador existente es la identidad canónica de la familia; no se crea otro código. | Sus dependencias son relaciones tipadas, no una jerarquía de identidad. | Puede retirarse para usos nuevos conservando historia; no se fusiona ni renumera por similitud con otro servicio. | `ESPECIFICADO` |
| `TI-SERVICE-002` | Endpoints, computadores, celulares, tabletas y dispositivos compartidos | El identificador existente es la identidad canónica de la familia; no se crea otro código. | Sus dependencias son relaciones tipadas, no una jerarquía de identidad. | Puede retirarse para usos nuevos conservando historia; no se fusiona ni renumera por similitud con otro servicio. | `ESPECIFICADO` |
| `TI-SERVICE-003` | Redes y conectividad                                                    | El identificador existente es la identidad canónica de la familia; no se crea otro código. | Sus dependencias son relaciones tipadas, no una jerarquía de identidad. | Puede retirarse para usos nuevos conservando historia; no se fusiona ni renumera por similitud con otro servicio. | `ESPECIFICADO` |
| `TI-SERVICE-004` | Impresoras y periféricos                                                | El identificador existente es la identidad canónica de la familia; no se crea otro código. | Sus dependencias son relaciones tipadas, no una jerarquía de identidad. | Puede retirarse para usos nuevos conservando historia; no se fusiona ni renumera por similitud con otro servicio. | `ESPECIFICADO` |
| `TI-SERVICE-005` | Aplicaciones, ambientes y proveedores tecnológicos                      | El identificador existente es la identidad canónica de la familia; no se crea otro código. | Sus dependencias son relaciones tipadas, no una jerarquía de identidad. | Puede retirarse para usos nuevos conservando historia; no se fusiona ni renumera por similitud con otro servicio. | `ESPECIFICADO` |
| `TI-SERVICE-006` | Solicitudes de soporte tecnológico                                      | El identificador existente es la identidad canónica de la familia; no se crea otro código. | Sus dependencias son relaciones tipadas, no una jerarquía de identidad. | Puede retirarse para usos nuevos conservando historia; no se fusiona ni renumera por similitud con otro servicio. | `ESPECIFICADO` |
| `TI-SERVICE-007` | Incidentes y restauración tecnológica                                   | El identificador existente es la identidad canónica de la familia; no se crea otro código. | Sus dependencias son relaciones tipadas, no una jerarquía de identidad. | Puede retirarse para usos nuevos conservando historia; no se fusiona ni renumera por similitud con otro servicio. | `ESPECIFICADO` |
| `TI-SERVICE-008` | Cambios, configuración y versiones tecnológicas                         | El identificador existente es la identidad canónica de la familia; no se crea otro código. | Sus dependencias son relaciones tipadas, no una jerarquía de identidad. | Puede retirarse para usos nuevos conservando historia; no se fusiona ni renumera por similitud con otro servicio. | `ESPECIFICADO` |
| `TI-SERVICE-009` | Pruebas y aceptación técnica de soluciones                              | El identificador existente es la identidad canónica de la familia; no se crea otro código. | Sus dependencias son relaciones tipadas, no una jerarquía de identidad. | Puede retirarse para usos nuevos conservando historia; no se fusiona ni renumera por similitud con otro servicio. | `ESPECIFICADO` |
| `TI-SERVICE-010` | Licencias, garantías, contratos y costos tecnológicos                   | El identificador existente es la identidad canónica de la familia; no se crea otro código. | Sus dependencias son relaciones tipadas, no una jerarquía de identidad. | Puede retirarse para usos nuevos conservando historia; no se fusiona ni renumera por similitud con otro servicio. | `ESPECIFICADO` |
| `TI-SERVICE-011` | Conocimiento, capacitación y adopción tecnológica                       | El identificador existente es la identidad canónica de la familia; no se crea otro código. | Sus dependencias son relaciones tipadas, no una jerarquía de identidad. | Puede retirarse para usos nuevos conservando historia; no se fusiona ni renumera por similitud con otro servicio. | `ESPECIFICADO` |

**Reconciliación:** 11 esperadas; 11 materializadas; 0 faltantes; 0 duplicadas; 0 renumeradas.

---

#### 11. Reconciliación de cobertura

| Control                                               | Resultado |
| ----------------------------------------------------- | --------: |
| Objetos heredados de `DATA-DOM-002`                   |    **62** |
| Objetos con decisión materializada en esta tarea      |    **62** |
| Objetos faltantes                                     |     **0** |
| Objetos duplicados por nombre canónico                |     **0** |
| Datos maestros                                        |    **43** |
| Datos de referencia                                   |    **19** |
| Objetos `ESPECIFICADO`                                |    **59** |
| Objetos `BLOQUEADO` heredados de AURA                 |     **3** |
| Familias `TI-SERVICE-*` esperadas                     |    **11** |
| Familias `TI-SERVICE-*` preservadas                   |    **11** |
| Fusiones automáticas autorizadas                      |     **0** |
| Fusiones entre clases canónicas distintas autorizadas |     **0** |

Los tres objetos AURA conservan exactamente el bloqueo aprobado en `DATA-DOM-002`. Esta tarea define su política futura de identidad, pero no cambia su fuente lógica ni declara materialización operativa.

---

#### 12. Fronteras y handoffs

| Decisión                                                                   | Tarea propietaria |
| -------------------------------------------------------------------------- | ----------------- |
| Gobierno federado, propietario, steward y fuente de verdad                 | `DATA-DOM-001`    |
| Catálogo de 62 maestros y referencias                                      | `DATA-DOM-002`    |
| Granularidad de hechos, vigencia dimensional y comparabilidad histórica    | `DATA-DOM-005`    |
| Ingestión, backfill, transformación y reconciliación física                | `DATA-DOM-006`    |
| Calidad, detección de duplicados y certificación                           | `DATA-DOM-007`    |
| Protección y acceso a maestros por dominio, entidad y finalidad            | `DATA-AUTH-001`   |
| Separación de definición, certificación, publicación y administración      | `DATA-AUTH-003`   |
| Crosswalks, claves externas y reconciliación de identidades entre sistemas | `DATA-INT-003`    |
| Restatements, correcciones históricas y reproducibilidad analítica         | `DATA-DOM-017`    |

Estas fronteras no difieren el resultado principal: la identidad, las claves, los códigos, la semántica jerárquica, el ciclo de vida y las reglas no destructivas de fusión/separación quedan cerradas documentalmente aquí.

---

#### 13. Cobertura de prueba canónica preexistente

`TREQ-DATA-001` ya exige que todo dato maestro o de referencia compartido tenga identificador estable, propietario funcional, steward, fuente de verdad, claves empresariales y externas, jerarquías, atributos por dominio, estados, vigencia y reglas de alta, corrección, fusión, separación, desactivación y retiro. También prohíbe la fusión automática por coincidencia superficial y exige conservar historia efectiva y crosswalks sin alterar hechos pasados.

La tarea actual especializa documentalmente esas reglas para los 62 objetos ya catalogados. No cambia el contenido, prioridad, modalidad, estado, relaciones ni destino del requisito vigente.

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** el requisito DATA vigente ya cubre directamente el comportamiento que esta tarea materializa y asigna esta tarea entre sus responsables. Las decisiones aquí establecidas no introducen una familia de comportamiento independiente del requisito existente y no autorizan implementación técnica, migración, backfill o cambio de datos.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 14. Criterios de aceptación

1. los 62 objetos de `DATA-DOM-002` tienen una decisión explícita de identidad, claves/códigos, jerarquía y fusión/separación;
2. se conservan exactamente 43 datos maestros y 19 datos de referencia;
3. ningún nombre, valor normalizado, correo, teléfono, documento, dirección, serial, IP, MAC, SSID, URL, código de barras o código externo se trata como identidad suficiente por sí solo;
4. identificador canónico, clave empresarial, clave técnica, código, alias y clave externa quedan semánticamente separados;
5. los códigos declaran alcance de unicidad y no se reutilizan para otro significado histórico;
6. un cambio de nombre, etiqueta, padre jerárquico o consumidor no modifica por sí mismo la identidad;
7. una jerarquía estricta es explícita, acíclica y conserva vigencia;
8. reparenting conserva la identidad del hijo y la historia de la relación anterior;
9. no se fuerza dentro de una jerarquía universal ninguna relación que sea naturalmente muchos-a-muchos o entre clases distintas;
10. alta, vigencia, inactividad, corrección, sucesión, retiro, fusión y separación quedan definidos como semánticas comunes sin crear un enum universal que reemplace estados de dominio;
11. una identidad retirada no se reutiliza y continúa resolviendo referencias históricas;
12. una fusión solo puede ocurrir dentro de la misma clase y exige evidencia, stewardship y autoridad correspondiente;
13. se autorizan cero fusiones automáticas por coincidencia superficial;
14. una separación es reversible, conserva procedencia y no redistribuye hechos históricos por aproximación;
15. `PERSON_IDENTITY` y `CUSTOMER_PERSON` permanecen separadas y solo pueden relacionarse mediante contratos explícitos;
16. `PRODUCTO_MAESTRO`, `VARIANTE`, `PRESENTACION` y `UNIDAD_DE_MEDIDA` permanecen identidades distintas;
17. `OPERATIONAL_SITE`, `PHYSICAL_FACILITY`, `ORGANIZATIONAL_AREA`, `PHYSICAL_ZONE` y `WORKSTATION` permanecen conceptos distintos con relaciones efectivas;
18. `ACTIVO_FISICO`, `ENDPOINT` y `SHARED_DEVICE` permanecen separados y se conservan `endpoint_id`, `device_id` y `device_code`;
19. `APPLICATION` conserva `app_code` y no se identifica por repositorio, URL, ambiente o proveedor;
20. `TECH_SERVICE` conserva exactamente `TI-SERVICE-001` a `TI-SERVICE-011` sin renumeración;
21. los tres objetos AURA continúan `BLOQUEADO` y no se presenta una fuente operativa inexistente;
22. crosswalks físicos permanecen en `DATA-INT-003` y no se adelanta su implementación;
23. la reconstrucción física, deduplicación, backfill o migración de datos no se ejecuta en esta tarea;
24. no se crea ni modifica ningún requisito de prueba;
25. la continuidad queda exclusivamente en `DATA-DOM-004` como siguiente tarea reservada.

---

#### 15. Continuidad

ÚLTIMA TAREA APROBADA
`DATA-DOM-002 — Definir catálogo de datos maestros, datos de referencia y dimensiones compartidas`

TAREA ACTUAL APROBADA
`DATA-DOM-003 — Definir identidad, claves, códigos, jerarquías, ciclo de vida, fusión y separación de datos maestros`

SIGUIENTE TAREA RESERVADA
`DATA-DOM-004 — Definir capa semántica y registro canónico de métricas e indicadores`


### ✅ DATA-DOM-004 — Definir capa semántica y registro canónico de métricas e indicadores

**Estado:** APROBADA
**Tarea anterior:** `DATA-DOM-003 — Definir identidad, claves, códigos, jerarquías, ciclo de vida, fusión y separación de datos maestros` — APROBADA
**Tarea siguiente:** `DATA-DOM-005 — Definir hechos, eventos, granularidad, dimensiones, calendarios, snapshots y comparabilidad histórica` — RESERVADA
**Tipo de tarea:** documental; contrato canónico de capa semántica, identidad y versionado de métricas e indicadores, con registro inicial materializado sobre métricas de asistencia ya implementadas
**Bloque:** AB — Analítica, indicadores y datos maestros
**Fase:** exclusivamente documental
**Implementación técnica:** no autorizada
**Código, DDL, DML, migraciones, backfills, publicación de indicadores o cambios en Supabase:** no autorizados
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir una capa semántica común para Vento OS y materializar el registro canónico inicial de métricas e indicadores de forma que una cifra conserve el mismo significado con independencia de la pantalla, aplicación, consulta o implementación técnica que la presente.

La tarea fija el contrato que deberá permitir responder de forma determinista:

```text
QUÉ MÉTRICA ES
→ QUÉ DECISIÓN APOYA
→ QUÉ VERSIÓN DE DEFINICIÓN UTILIZA
→ QUÉ HECHOS Y FUENTES CONSUME
→ QUÉ INCLUYE Y QUÉ EXCLUYE
→ CUÁL ES SU FÓRMULA
→ QUÉ UNIDAD, PRECISIÓN, CALENDARIO Y ZONA HORARIA APLICA
→ QUÉ DIMENSIONES ADMITE
→ QUÉ CORTE Y CONTEXTO PRODUJERON EL RESULTADO
→ QUÉ CALIDAD Y CERTIFICACIÓN TIENE
→ CÓMO SE LLEGA AL DETALLE QUE LO EXPLICA
```

Regla cardinal:

```text
MISMA MÉTRICA
+ MISMA VERSIÓN
+ MISMO CONTEXTO
+ MISMO CORTE
=
MISMO RESULTADO
```

Una pantalla, reporte, exportación, modelo analítico o integración no podrá redefinir localmente la fórmula de una métrica registrada.

---

#### 2. Resultado sustantivo

Queda definido el contrato semántico `DATA-DOM-004` con los siguientes resultados:

- una única definición lógica de métrica, separada de su implementación SQL, RPC, vista, función, modelo BI o código de interfaz;
- identidad estable de métrica mediante `metric_key` y versión de definición;
- regla explícita de versionado, vigencia, deprecación y compatibilidad;
- contrato mínimo obligatorio con propósito, fórmula, numerador, denominador, granularidad declarada, dimensiones, filtros, inclusiones, exclusiones, unidad, moneda, precisión, calendario, zona horaria, fuente, calidad, certificación y drill-down;
- separación entre métrica, KPI, driver, guardrail, meta, umbral, alerta y visualización;
- prohibición de fórmulas locales competidoras;
- tratamiento explícito de cero, ausencia de denominador y dato no disponible sin convertirlos automáticamente en el mismo valor;
- registro inicial de **14 métricas reales de asistencia** observadas en la implementación vigente de `attendance-report`;
- reconciliación del registro inicial: **14 esperadas; 14 materializadas; 0 faltantes; 0 duplicadas**;
- **9 conteos**, **2 sumas de minutos**, **2 tasas** y **1 conteo compuesto de turnos con incidencia**;
- **3 divergencias semánticas actuales** entre la implementación observada y el contrato canónico que bloquean certificación oficial hasta su resolución;
- cero fórmulas nuevas de ventas, inventario, producción, servicio o finanzas adelantadas a las tareas `DATA-DOM-009` a `DATA-DOM-013`;
- cero cambios físicos y cero cambios de requisitos de prueba.

No se crea una familia artificial `METRIC-*` ni otro namespace numérico nuevo. El registro inicial adopta como `metric_key` las claves ya existentes y verificables en la implementación observada para evitar inventar identificadores paralelos.

---

#### 3. Fronteras conceptuales obligatorias

```text
DATO MAESTRO
≠
HECHO O EVENTO
≠
MÉTRICA
≠
KPI
≠
META
≠
UMBRAL
≠
ALERTA
≠
REPORTE O DASHBOARD
```

```text
DEFINICIÓN SEMÁNTICA
≠
IMPLEMENTACIÓN DE CÁLCULO
≠
RESULTADO MATERIALIZADO
≠
VISUALIZACIÓN
```

```text
NUMERADOR
≠
DENOMINADOR
≠
TASA
≠
PORCENTAJE MOSTRADO
≠
PUNTOS PORCENTUALES
```

```text
CERO MEDIDO
≠
SIN DENOMINADOR
≠
SIN DATO
≠
NO APLICA
≠
DATO PENDIENTE
```

```text
MÉTRICA DEFINIDA
≠
MÉTRICA CERTIFICADA
≠
MÉTRICA PUBLICADA
```

Una visualización podrá cambiar formato, orden, etiqueta o tipo de gráfico sin crear otra métrica mientras preserve la misma definición, versión, contexto y corte.

---

#### 4. Identidad canónica de una métrica

##### 4.1. `metric_key`

Toda métrica deberá tener una clave estable que identifique su significado empresarial.

Reglas:

1. `metric_key` no depende de la ruta, pantalla, archivo, consulta SQL o componente que la muestra;
2. una traducción o cambio de etiqueta visible no cambia `metric_key`;
3. una refactorización técnica que conserva significado no cambia `metric_key` ni la versión semántica;
4. un cambio de significado conserva `metric_key` únicamente si representa evolución de la misma medida y crea una nueva versión de definición;
5. dos métricas con significados distintos no podrán compartir `metric_key` aunque actualmente produzcan el mismo número;
6. una métrica local existente solo se incorpora al registro cuando su definición puede reconstruirse con evidencia suficiente;
7. una clave de campo, alias de BI o nombre histórico puede conservarse como alias técnico, pero no puede competir con la definición canónica.

##### 4.2. Registro inicial sin identificadores inventados

Para las métricas de asistencia materializadas en esta tarea se adoptan las claves ya existentes en el contrato `ReportSummary`, `EmployeeSummary` y `SiteSummary` de la implementación observada:

```text
scheduledShifts
attendedShifts
restDayCount
lateCount
noShowCount
openCount
missingCloseCount
autoCloseCount
departureCount
scheduledMinutes
netMinutes
incidentCount
attendanceRate
punctualityRate
```

Estas claves pasan a ser identidades semánticas estables del registro inicial. Una implementación futura podrá renombrar variables internas, pero deberá seguir resolviendo estas identidades o publicar una transición explícita compatible.

##### 4.3. Versión de definición

Cada entrada del registro conserva una versión semántica independiente de la versión del código.

La materialización inicial queda en **versión 1**.

Una nueva versión de definición será obligatoria cuando cambie cualquiera de estos elementos con efecto sobre el resultado:

- fórmula;
- numerador o denominador;
- inclusiones o exclusiones;
- granularidad de cálculo;
- dimensiones admitidas cuando alteren agregabilidad o interpretación;
- calendario, fecha empresarial o zona horaria;
- unidad, moneda o precisión semántica;
- tratamiento de anulaciones, correcciones, devoluciones o datos tardíos;
- fuente lógica cuando el cambio altera el significado o cobertura;
- regla de comparación;
- interpretación de estados de dato.

No exige nueva versión semántica:

- optimizar una consulta;
- mover el cálculo entre vista, función, servicio o modelo;
- cambiar un índice;
- cambiar formato visual;
- cambiar el orden de columnas;
- agregar observabilidad técnica;

si el resultado para el mismo contexto y corte permanece idéntico.

---

#### 5. Contrato mínimo del registro de métricas

Toda entrada canónica deberá conservar como mínimo:

| Campo semántico             | Regla                                                                       |
| --------------------------- | --------------------------------------------------------------------------- |
| `metric_key`                | identidad estable de la definición                                          |
| nombre empresarial          | etiqueta comprensible y no técnica                                          |
| descripción                 | significado y lectura correcta                                              |
| decisión apoyada            | decisión empresarial para la cual existe la métrica                         |
| propietario empresarial     | función que responde por el significado                                     |
| steward                     | función que mantiene definición, metadatos y coherencia                     |
| custodio técnico            | función responsable de operación técnica sin adquirir propiedad empresarial |
| versión                     | versión inmutable de la definición                                          |
| vigencia                    | inicio y fin de aplicabilidad de la versión                                 |
| tipo                        | conteo, suma, tasa, promedio u otra operación declarada                     |
| fórmula                     | expresión empresarial reproducible                                          |
| numerador                   | componente explícito cuando corresponda                                     |
| denominador                 | componente explícito cuando corresponda                                     |
| granularidad                | nivel al que se calcula antes de agregar; se completa con `DATA-DOM-005`    |
| dimensiones permitidas      | dimensiones gobernadas que pueden segmentar sin cambiar el significado      |
| filtros                     | restricciones de contexto aplicadas                                         |
| inclusiones                 | población o hechos que entran                                               |
| exclusiones                 | población o hechos que no entran                                            |
| unidad                      | unidad de medida del resultado                                              |
| moneda                      | moneda cuando aplique; nunca implícita en una métrica monetaria             |
| precisión                   | precisión semántica y regla de redondeo                                     |
| calendario                  | calendario aplicable                                                        |
| zona horaria                | zona usada para fechas empresariales y cortes                               |
| fecha empresarial           | regla que asigna el hecho al periodo                                        |
| fuente lógica               | dominios propietarios de los hechos y maestros consumidos                   |
| implementación observada    | artefacto técnico actual cuando exista evidencia                            |
| tratamiento de correcciones | cómo afecta una corrección o restatement                                    |
| datos tardíos               | regla de periodo abierto/cerrado y actualización                            |
| frecuencia                  | cadencia de actualización observada o aprobada                              |
| calidad                     | estado de calidad de las dependencias                                       |
| certificación               | estado de certificación de la definición/resultado                          |
| drill-down                  | ruta lógica desde agregado hasta evidencia fuente                           |
| privacidad                  | restricciones para detalle, personas o poblaciones pequeñas                 |
| comparación                 | condiciones para comparar periodos o segmentos                              |
| KPI / driver / guardrail    | rol contextual; no crea una fórmula alternativa                             |

La representación física de este registro pertenece a la arquitectura aplicable y a `DATA-INT-002`. Esta tarea no prescribe tabla, schema, vista, RPC, archivo JSON, herramienta BI ni tecnología de catálogo.

---

#### 6. Capa semántica federada

La capa semántica se organiza así:

```text
FUENTES PROPIETARIAS
→ hechos y maestros gobernados por sus dominios

CONTRATOS DE DATOS
→ identidad, tiempo, calidad y relaciones

REGISTRO CANÓNICO DE MÉTRICAS
→ definición, versión, fórmula, contexto y propiedad

IMPLEMENTACIÓN DE CÁLCULO
→ SQL, RPC, función, modelo, vista o motor analítico

ARTEFACTOS DE CONSUMO
→ pantalla, reporte, dashboard, exportación, alerta o modelo
```

Reglas:

1. el registro semántico no copia ni corrige hechos fuente;
2. una implementación técnica referencia una versión de métrica;
3. una pantalla no redefine fórmula ni población;
4. una exportación conserva la versión, corte y contexto de las métricas incluidas;
5. una métrica calculada por dos aplicaciones debe reconciliarse al mismo resultado bajo el mismo contexto;
6. la capa semántica puede combinar fuentes propietarias sin adquirir autoridad sobre ellas;
7. los maestros y dimensiones consumidos conservan las identidades definidas en `DATA-DOM-002` y `DATA-DOM-003`;
8. granularidad, tiempo efectivo, snapshots y comparabilidad histórica se completan en `DATA-DOM-005` sin reabrir la identidad de la métrica;
9. calidad, frescura y certificación se completan en `DATA-DOM-007` sin permitir fórmulas locales;
10. `DATA-INT-002` definirá la materialización técnica de la capa semántica y sus modelos de consulta.

---

#### 7. Propiedad, stewardship y segregación

Para el registro inicial de asistencia:

- **propietario empresarial de la definición:** `RESPONSABLE_DE_PERSONAS`;
- **steward:** `RESPONSABLE_DE_PERSONAS`, con participación de `RESPONSABLE_DE_PROGRAMACION_LABORAL` cuando la definición depende del turno programado;
- **fuente lógica de programación:** VISO;
- **fuente lógica de marcaciones y hechos de asistencia:** ANIMA;
- **custodia técnica:** `RESPONSABLE_TECNOLOGICO`;
- **implementación observada:** `vento-shell`, función Supabase `attendance-report`;
- **certificación:** no se concede por esta tarea; su segregación pertenece a `DATA-AUTH-003` y sus criterios de calidad a `DATA-DOM-007`.

Reglas transversales:

```text
PROPIETARIO DE LA DEFINICIÓN
≠
IMPLEMENTADOR TÉCNICO
≠
CERTIFICADOR
≠
CONSUMIDOR
```

Ninguna celda documental de esta tarea concede permisos técnicos.

---

#### 8. Contexto determinista de cálculo

Para cumplir la regla de mismo resultado, el contexto de ejecución deberá conservar como mínimo:

- `metric_key`;
- versión de definición;
- periodo solicitado;
- fecha y hora de corte;
- zona horaria;
- filtros;
- dimensiones o agrupaciones solicitadas;
- alcance territorial u organizacional autorizado;
- versión o vigencia de maestros relevantes;
- estado de calidad de dependencias;
- tratamiento de registros tardíos y correcciones;
- versión de implementación cuando se requiera reproducibilidad técnica.

Dos resultados no se consideran comparables automáticamente si difieren en cualquiera de estas coordenadas materiales.

---

#### 9. Registro canónico inicial — asistencia

La implementación vigente de `attendance-report` materializa un conjunto verificable de métricas de resumen global, por trabajador y por sede. Esta tarea adopta sus claves existentes y define su significado empresarial versión 1.

**Fuentes lógicas:** programación laboral de VISO + hechos de asistencia de ANIMA.
**Zona horaria de la implementación observada:** `America/Bogota` como valor predeterminado cuando no se suministra una zona válida.
**Dimensiones actualmente demostradas:** sede y trabajador; el eje temporal se resuelve por el periodo del reporte.
**Dimensiones adicionales:** no se declaran habilitadas por esta tarea hasta que `DATA-DOM-005` cierre granularidad y tiempo y exista evidencia de su implementación.
**Estado de definición de las 14 entradas:** `ESPECIFICADO`.

| `metric_key`        | Nombre empresarial                                 | Tipo             | Fórmula canónica v1                                                                                                                                        | Numerador / denominador                         | Unidad                                       | Dimensiones permitidas en esta versión | Certificación |
| ------------------- | -------------------------------------------------- | ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------- | -------------------------------------------- | -------------------------------------- | ------------- |
| `scheduledShifts`   | Turnos programados computables                     | conteo           | contar turnos programados del contexto que no sean descanso                                                                                                | no aplica                                       | turnos                                       | sede; trabajador autorizado; periodo   | `NO EVALUADO` |
| `attendedShifts`    | Turnos con asistencia registrada                   | conteo           | contar turnos programados computables con `check-in` asociado                                                                                              | no aplica                                       | turnos                                       | sede; trabajador autorizado; periodo   | `NO EVALUADO` |
| `restDayCount`      | Turnos clasificados como descanso                  | conteo           | contar turnos cuya clasificación vigente corresponda a descanso                                                                                            | no aplica                                       | turnos                                       | sede; trabajador autorizado; periodo   | `NO EVALUADO` |
| `lateCount`         | Turnos con llegada tardía                          | conteo           | contar turnos computables con `check-in` posterior al inicio programado más la gracia de tardanza aplicable                                                | no aplica                                       | turnos                                       | sede; trabajador autorizado; periodo   | `NO EVALUADO` |
| `noShowCount`       | Turnos finalizados sin asistencia                  | conteo           | contar turnos computables cuyo fin programado ya ocurrió al corte y que no tienen sesión de asistencia asociada                                            | no aplica                                       | turnos                                       | sede; trabajador autorizado; periodo   | `NO EVALUADO` |
| `openCount`         | Turnos con sesión de asistencia abierta            | conteo           | contar turnos computables con sesión de asistencia aún abierta al corte                                                                                    | no aplica                                       | turnos                                       | sede; trabajador autorizado; periodo   | `NO EVALUADO` |
| `missingCloseCount` | Turnos vencidos sin cierre                         | conteo           | contar turnos computables cuyo fin programado ya ocurrió al corte y cuya sesión de asistencia continúa abierta                                             | no aplica                                       | turnos                                       | sede; trabajador autorizado; periodo   | `BLOQUEADO`   |
| `autoCloseCount`    | Turnos cerrados automáticamente                    | conteo           | contar turnos computables cuya sesión asociada fue cerrada mediante el mecanismo de autocierre                                                             | no aplica                                       | turnos                                       | sede; trabajador autorizado; periodo   | `NO EVALUADO` |
| `departureCount`    | Turnos con salida de sede detectada durante sesión | conteo           | contar turnos computables con evento de salida de sede correlacionado a la sesión                                                                          | no aplica                                       | turnos                                       | sede; trabajador autorizado; periodo   | `NO EVALUADO` |
| `scheduledMinutes`  | Minutos netos programados                          | suma             | sumar los minutos netos programados de los turnos computables, descontando descanso programado conforme al turno                                           | no aplica                                       | minutos                                      | sede; trabajador autorizado; periodo   | `NO EVALUADO` |
| `netMinutes`        | Minutos netos registrados                          | suma             | sumar minutos de sesión registrados menos minutos de descanso superpuestos válidos, limitados a valores no negativos                                       | no aplica                                       | minutos                                      | sede; trabajador autorizado; periodo   | `NO EVALUADO` |
| `incidentCount`     | Turnos con señal de incidencia de asistencia       | conteo compuesto | contar una vez cada turno computable que presente al menos una de estas señales: tardanza, ausencia, sesión abierta, autocierre o salida de sede detectada | no aplica                                       | turnos                                       | sede; trabajador autorizado; periodo   | `NO EVALUADO` |
| `attendanceRate`    | Tasa de asistencia                                 | tasa             | `attendedShifts / scheduledShifts` cuando existe denominador positivo; con denominador cero no se emite un valor numérico de tasa                          | `attendedShifts` / `scheduledShifts`            | proporción; presentación porcentual derivada | sede; trabajador autorizado; periodo   | `BLOQUEADO`   |
| `punctualityRate`   | Tasa de puntualidad entre turnos asistidos         | tasa             | `(attendedShifts - lateCount) / attendedShifts` cuando existe denominador positivo; con denominador cero no se emite un valor numérico de tasa             | `attendedShifts - lateCount` / `attendedShifts` | proporción; presentación porcentual derivada | sede; trabajador autorizado; periodo   | `BLOQUEADO`   |

**Reconciliación:** 14 claves esperadas; 14 materializadas; 14 claves únicas; 0 faltantes; 0 duplicadas.

---

#### 10. Reglas de cálculo del registro inicial

##### 10.1. Población computable

Los turnos clasificados como descanso no forman parte del denominador de asistencia ni de los conteos operativos de asistencia. `restDayCount` los registra por separado.

##### 10.2. Asistencia

Un turno se considera asistido cuando existe `check-in` asociado al turno mediante el contrato de correspondencia vigente. Esta definición no afirma por sí sola puntualidad, cierre correcto ni cumplimiento completo del turno.

##### 10.3. Tardanza

La tardanza se determina comparando el instante de `check-in` con el inicio programado más la gracia aplicable. La gracia es contexto de cálculo y deberá conservarse para reproducir el resultado.

##### 10.4. Ausencia

Un turno solo cuenta como ausencia cuando ya terminó al corte y no existe asistencia asociada. Un turno futuro o todavía en curso sin `check-in` no es automáticamente una ausencia cerrada.

##### 10.5. Sesión abierta y falta de cierre

`openCount` expresa existencia de una sesión abierta al corte. `missingCloseCount` exige además que el fin programado del turno ya haya ocurrido. Por tanto:

```text
SESIÓN ABIERTA
NO IMPLICA AUTOMÁTICAMENTE
FALTA DE CIERRE
```

##### 10.6. Minutos

`scheduledMinutes` y `netMinutes` se registran en minutos enteros no negativos conforme a la implementación observada. La presentación en horas es una representación derivada y no modifica la unidad canónica.

##### 10.7. Tasas sin denominador

Cuando el denominador sea cero:

- no se registra la tasa como `0`;
- se conserva la condición de ausencia de denominador de manera separada;
- la interfaz podrá explicar que no existe población elegible;
- una exportación o snapshot deberá preservar esta distinción.

Esta regla evita confundir ausencia de población con desempeño igual a cero.

---

#### 11. Comparación y agregabilidad

1. las métricas de conteo y suma solo se agregan cuando los conjuntos son disjuntos o la operación declara la deduplicación aplicable;
2. las tasas no se promedian entre sedes, trabajadores o periodos sin recomputar numerador y denominador sobre la población combinada;
3. `attendanceRate` se agrega mediante suma de `attendedShifts` y suma de `scheduledShifts`, no mediante promedio simple de porcentajes;
4. `punctualityRate` se agrega mediante suma del numerador elegible y suma de `attendedShifts`, no mediante promedio simple de porcentajes;
5. una comparación requiere la misma versión de definición o una regla explícita de compatibilidad;
6. cambios de calendario, zona horaria, gracia de tardanza, cobertura de sedes o reglas de correspondencia deben quedar visibles en el contexto;
7. `DATA-DOM-005` definirá el modelo temporal y de granularidad que permita reproducir comparaciones históricas sin cambiar estas fórmulas.

---

#### 12. KPI, drivers y guardrails

Una métrica registrada no se convierte automáticamente en KPI.

```text
MÉTRICA
→ definición cuantitativa estable

KPI
→ uso priorizado de una métrica para una decisión y objetivo

DRIVER
→ métrica relacionada que ayuda a explicar o mover un KPI

GUARDRAIL
→ métrica que limita daño no deseado

META
→ valor objetivo contextual de una métrica
```

Reglas:

- la misma `metric_key` y versión puede desempeñar roles distintos en contextos distintos sin duplicar fórmula;
- la designación de KPI, drivers, guardrails, líneas base, metas y cadencias pertenece a `DATA-DOM-015`;
- esta tarea no fija metas definitivas;
- un dashboard no puede declarar una métrica KPI por conveniencia visual si la decisión y el objetivo no están gobernados;
- ningún driver o guardrail cambia la propiedad de la métrica fuente.

---

#### 13. Drill-down y trazabilidad

Para las métricas iniciales de asistencia, la ruta lógica mínima de drill-down es:

```text
RESULTADO AGREGADO
→ RESUMEN POR SEDE O TRABAJADOR AUTORIZADO
→ TURNO CONSOLIDADO
→ TURNO PROGRAMADO
+ SESIÓN DE ASISTENCIA
+ DESCANSOS RELACIONADOS
+ EVENTOS DE SALIDA CUANDO EXISTAN
→ HECHOS Y FUENTES PROPIETARIAS
```

Reglas:

1. la vista agregada no concede autorización al detalle;
2. el detalle de trabajador requiere el alcance definido en `DATA-AUTH-001` y `DATA-AUTH-002` antes de exposición productiva;
3. el drill-down conserva la versión de métrica, periodo, filtros y corte que originaron el agregado;
4. una corrección del hecho fuente no reescribe silenciosamente un snapshot publicado;
5. `DATA-DOM-017` gobierna restatements y reproducibilidad histórica.

---

#### 14. Divergencias actuales observadas

La tarea distingue definición canónica de implementación actual y no declara certificada una fórmula únicamente porque exista código.

| Elemento                                   | Implementación observada                                                                               | Definición canónica v1                                    | Estado                         | Propietario documental de salida               |
| ------------------------------------------ | ------------------------------------------------------------------------------------------------------ | --------------------------------------------------------- | ------------------------------ | ---------------------------------------------- |
| `attendanceRate` con `scheduledShifts = 0` | devuelve numéricamente `0`                                                                             | no debe emitir un valor numérico de tasa sin denominador  | `BLOQUEADO` para certificación | `DATA-DOM-005`, `DATA-DOM-007`, `DATA-INT-002` |
| `punctualityRate` con `attendedShifts = 0` | devuelve numéricamente `0`                                                                             | no debe emitir un valor numérico de tasa sin denominador  | `BLOQUEADO` para certificación | `DATA-DOM-005`, `DATA-DOM-007`, `DATA-INT-002` |
| `missingCloseCount`                        | el resumen incrementa por sesión abierta aunque el cálculo intermedio ya distingue si el turno terminó | solo cuenta turno vencido al corte con sesión aún abierta | `BLOQUEADO` para certificación | `DATA-DOM-005`, `DATA-DOM-007`, `DATA-INT-002` |

Condición de salida común:

- semántica temporal y de corte cerrada en `DATA-DOM-005`;
- tratamiento de calidad y certificación cerrado en `DATA-DOM-007`;
- materialización técnica de la capa semántica definida en `DATA-INT-002`;
- implementación futura alineada y verificada antes de declarar cualquiera de estas tres métricas `CERTIFICADO` o publicarla como cifra oficial.

Estas divergencias no autorizan modificar ahora `attendance-report`, Supabase ni una aplicación consumidora.

---

#### 15. Familias analíticas reservadas sin adelantar fórmulas

El registro crecerá mediante las tareas ya existentes. No se inventan fórmulas ni identificadores antes de que la tarea propietaria materialice su dominio.

| Familia                     | Contenido ya reservado por el alcance aprobado                                                                                          | Tarea propietaria de materialización |
| --------------------------- | --------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------ |
| ventas y demanda            | ventas, pedidos, conversión, ticket, mezcla, demanda, disponibilidad, devoluciones, promociones, recurrencia y margen relacionado       | `DATA-DOM-009`                       |
| inventario y abastecimiento | disponibilidad, cobertura, rotación, faltantes, vencimientos, diferencias, cumplimiento de remisiones/proveedores y costo de inventario | `DATA-DOM-010`                       |
| producción y rendimiento    | plan vs producción, capacidad, adherencia, rendimiento, consumos, merma, calidad, ciclo, liberación, costo y variación                  | `DATA-DOM-011`                       |
| servicio y clientes         | promesa, tiempos, pedidos completos, reclamos, resolución, compensaciones, satisfacción, recurrencia, fidelización y reputación         | `DATA-DOM-012`                       |
| costos y rentabilidad       | costos, variaciones, margen, gastos, presupuesto, liquidez, cartera, obligaciones, rentabilidad y escenarios                            | `DATA-DOM-013`                       |
| diagnóstico                 | variaciones, anomalías, factores, impacto y confianza                                                                                   | `DATA-DOM-014`                       |
| objetivos y medición        | líneas base, metas, KPI priorizados, drivers, guardrails y cadencias                                                                    | `DATA-DOM-015`                       |
| mejora                      | acciones, experimentos, seguimiento y comprobación                                                                                      | `DATA-DOM-016`                       |
| reproducibilidad            | versiones históricas, correcciones y restatements                                                                                       | `DATA-DOM-017`                       |

Las familias anteriores no son entradas incompletas del registro actual. Son alcance explícitamente reservado a tareas posteriores y permanecen fuera de la materialización de `DATA-DOM-004` hasta que su definición empresarial sea aprobada.

---

#### 16. Fronteras con las tareas siguientes y transversales

| Decisión                                                                                       | Tarea propietaria |
| ---------------------------------------------------------------------------------------------- | ----------------- |
| hechos, eventos, granularidad, dimensiones temporales, calendarios, snapshots y comparabilidad | `DATA-DOM-005`    |
| ingestión, transformaciones, backfill, reconciliación y linaje                                 | `DATA-DOM-006`    |
| calidad, frescura, cobertura, cuarentena y certificación                                       | `DATA-DOM-007`    |
| reportes, dashboards, exportaciones, suscripciones, alertas y snapshots oficiales              | `DATA-DOM-008`    |
| protección por dominio, entidad, territorio y finalidad                                        | `DATA-AUTH-001`   |
| protección de detalle sensible y poblaciones pequeñas                                          | `DATA-AUTH-002`   |
| separación entre definición, certificación, publicación, metas y administración                | `DATA-AUTH-003`   |
| catálogo y experiencia de definición                                                           | `DATA-UX-002`     |
| tableros, filtros, comparación y drill-down                                                    | `DATA-UX-003`     |
| eventos y contratos de lectura                                                                 | `DATA-INT-001`    |
| materialización técnica de capa semántica, modelos, snapshots, caché y consultas               | `DATA-INT-002`    |
| BI, hojas de cálculo, modelos externos e IA                                                    | `DATA-INT-004`    |

No queda una decisión material de `DATA-DOM-004` sin propietario documental.

---

#### 17. Cobertura de prueba canónica preexistente

El registro de pruebas vigente ya contiene `TREQ-DATA-002`, que exige que toda métrica o indicador exista en un registro canónico versionado con propósito, propietario, fórmula, numerador, denominador, granularidad, dimensiones, filtros, inclusiones, exclusiones, unidad, moneda, zona horaria, calendario, fuente, frescura, calidad, versión, certificación, drill-down y reglas de comparación, y asigna expresamente `DATA-DOM-004` entre sus tareas responsables.

También permanece vigente `TREQ-DATA-003` para proteger la distinción entre cero, nulo, no aplica, desconocido, no recibido y dato pendiente, así como calidad, frescura, datos tardíos, backfills y reconciliación. Las divergencias observadas en tasas sin denominador no requieren una fila nueva: quedan dentro de reglas ya protegidas y con tareas responsables existentes.

Esta tarea materializa el contrato documental y el registro inicial que esas reglas ya exigen. No cambia prioridad, modalidad, estado, relaciones ni destino de implementación de los requisitos vigentes.

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea materializa definiciones documentales y un registro inicial sobre comportamientos ya protegidos por requisitos canónicos vigentes. No introduce una familia de comportamiento independiente, no modifica el alcance protegido y no autoriza implementación técnica ni cambios de datos.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 18. Criterios de aceptación

1. existe una definición inequívoca de métrica, KPI, driver, guardrail, meta, umbral, alerta y visualización;
2. la capa semántica permanece federada y no se convierte en fuente propietaria de hechos o maestros;
3. `metric_key`, versión, contexto y corte determinan de manera suficiente la identidad semántica de un resultado;
4. se conserva la regla `misma métrica + misma versión + mismo contexto + mismo corte = mismo resultado`;
5. toda entrada exige propósito, propietario, fórmula, numerador, denominador cuando aplique, dimensiones, filtros, inclusiones, exclusiones, unidad, tiempo, fuente, calidad, certificación y drill-down;
6. una refactorización técnica que no cambia significado no crea una nueva versión semántica;
7. un cambio de significado sí exige una versión nueva;
8. ninguna pantalla, reporte, dashboard, exportación o modelo puede redefinir localmente una fórmula registrada;
9. se materializan exactamente **14 métricas iniciales de asistencia** con las claves técnicas existentes y sin inventar un namespace paralelo;
10. las 14 claves son únicas y no existen faltantes ni duplicados dentro del inventario inicial declarado;
11. el registro inicial contiene exactamente **9 conteos**, **2 sumas de minutos**, **2 tasas** y **1 conteo compuesto de turnos con incidencia**;
12. `scheduledShifts` excluye descansos y `restDayCount` los registra por separado;
13. `attendedShifts` exige `check-in` asociado y no implica puntualidad ni cierre completo;
14. `lateCount` conserva la gracia de tardanza como contexto reproducible;
15. `noShowCount` exige que el turno haya terminado al corte;
16. `openCount` y `missingCloseCount` permanecen semánticamente separados;
17. `scheduledMinutes` y `netMinutes` usan minutos como unidad canónica y la presentación en horas es derivada;
18. `attendanceRate` y `punctualityRate` conservan numerador y denominador explícitos;
19. una tasa sin denominador no se registra como cero;
20. tasas agregadas se recomputan desde numeradores y denominadores, no mediante promedio simple de porcentajes;
21. las fuentes lógicas de programación y asistencia permanecen VISO y ANIMA respectivamente;
22. propietario empresarial, steward, custodio técnico y certificador permanecen funciones separadas;
23. ninguna de las 14 métricas queda certificada por la mera existencia de código;
24. las tres divergencias observadas tienen definición canónica, estado, tareas propietarias y condición de salida explícitos;
25. las familias de ventas, inventario, producción, servicio y finanzas no reciben fórmulas inventadas y conservan sus tareas propietarias `DATA-DOM-009` a `DATA-DOM-013`;
26. granularidad, tiempo, calidad, reportes, autorización, integración y restatements conservan sus tareas propietarias existentes;
27. no se modifica código, SQL, Supabase, datos, métricas productivas, metas ni dashboards;
28. no se crea ni modifica ningún requisito de prueba;
29. la continuidad queda exclusivamente en `DATA-DOM-005` como siguiente tarea reservada.

---

#### 19. Continuidad

ÚLTIMA TAREA APROBADA
`DATA-DOM-003 — Definir identidad, claves, códigos, jerarquías, ciclo de vida, fusión y separación de datos maestros`

TAREA ACTUAL APROBADA
`DATA-DOM-004 — Definir capa semántica y registro canónico de métricas e indicadores`

SIGUIENTE TAREA RESERVADA
`DATA-DOM-005 — Definir hechos, eventos, granularidad, dimensiones, calendarios, snapshots y comparabilidad histórica`


### ✅ DATA-DOM-005 — Definir hechos, eventos, granularidad, dimensiones, calendarios, snapshots y comparabilidad histórica

**Estado:** APROBADA
**Tarea anterior:** `DATA-DOM-004 — Definir capa semántica y registro canónico de métricas e indicadores` — APROBADA
**Tarea siguiente:** `DATA-DOM-006 — Definir contratos de recopilación, ingestión, transformación, backfill y reconciliación` — RESERVADA
**Tipo de tarea:** documental; contrato canónico de hechos, eventos, granularidad, dimensión histórica, tiempo empresarial, snapshots y comparabilidad para la capa analítica del BLOQUE AB
**Bloque:** AB — Analítica, indicadores y datos maestros
**Fase:** exclusivamente documental
**Implementación técnica:** no autorizada
**Código, DDL, DML, migraciones, backfills, cambios de datos, publicación de snapshots o cambios en Supabase:** no autorizados
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir el contrato temporal y dimensional que permite convertir hechos y eventos de los dominios propietarios en resultados analíticos reproducibles sin cambiar la fuente, mezclar granos incompatibles, aplicar dimensiones actuales a hechos pasados ni sustituir historia mediante snapshots o agregados.

La tarea fija de forma explícita:

- qué clases de hechos, eventos, casos, intervalos, estados observados y artefactos versionados quedan reconocidas;
- cuál es el grano natural que debe conservarse antes de agregar;
- qué instantes y fechas participan en la interpretación temporal;
- cómo se resuelve una dimensión compartida conforme a la vigencia aplicable al hecho;
- cómo se usan los periodos operativo, económico, contable y fiscal sin tratarlos como equivalentes;
- qué representa un snapshot y por qué no puede reemplazar silenciosamente un resultado ya publicado;
- bajo qué condiciones dos periodos, segmentos o resultados pueden compararse;
- cómo se completa el grano y la semántica temporal de las 14 métricas de asistencia aprobadas en `DATA-DOM-004`.

Esta tarea no define contratos de ingestión o backfill, no certifica calidad, no crea dashboards, no fija nuevas fórmulas de dominio y no materializa modelos físicos.

---

#### 2. Resultado sustantivo

Queda materializado el contrato `DATA-DOM-005` con estos resultados:

- **15 de 15 familias** heredadas de la matriz de exclusión de `DATA-DOM-002` reciben clasificación temporal y decisión explícita de grano;
- los **62 de 62 objetos** del catálogo de maestros/referencias reciben una decisión explícita de uso como dimensión histórica;
- se preservan **58 objetos habilitados** como dimensión compartida, **4 no habilitados** y **3 objetos AURA bloqueados** que forman parte de los 58 habilitados conceptualmente;
- los **14 de 14 `metric_key`** de asistencia reciben grano base, semántica temporal, dimensiones admitidas y estado;
- se distinguen ocurrencia, fecha empresarial, recepción, procesamiento, última corrección y corte analítico;
- se establece resolución temporal de jerarquías y atributos mediante la vigencia aplicable al hecho, nunca mediante el estado actual por defecto;
- se separan periodo operativo, económico, contable y fiscal;
- se define snapshot como resultado derivado e inmutable para un corte y contexto concretos, sin autoridad para corregir la fuente;
- se definen reglas de comparabilidad para versión de métrica, grano, calendario, zona horaria, población, dimensiones, unidad/moneda, cobertura y restatements;
- las tres divergencias de asistencia ya detectadas permanecen bloqueantes para certificación; esta tarea precisa su semántica temporal sin modificar la implementación;
- se crean **0** requisitos de prueba y se modifican **0**, porque la conducta queda cubierta por requisitos DATA vigentes ya asignados a esta tarea.

---

#### 3. Taxonomía temporal y analítica

| Categoría            | Definición canónica                                                                                              | Regla de autoridad                                                                                          |
| -------------------- | ---------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| HECHO / TRANSACCIÓN  | Registro empresarial de algo ocurrido o reconocido con identidad, contexto y cantidades/valores cuando apliquen. | La fuente propietaria conserva el hecho original; la analítica solo lo consume.                             |
| EVENTO               | Ocurrencia puntual o transición observada con instante y procedencia.                                            | El evento original no se sobrescribe para corregir historia.                                                |
| INTERVALO            | Periodo con inicio y fin, real o programado, como turno, sesión, vigencia o ejecución.                           | Sus límites y zona horaria pertenecen al contrato propietario.                                              |
| CASO / EXPEDIENTE    | Identidad que agrupa interacciones, decisiones y estados sin convertirlos en un único evento.                    | Las interacciones internas conservan sus propios tiempos y evidencia.                                       |
| ESTADO OBSERVADO     | Condición derivada de hechos válidos en un instante de corte.                                                    | No es un hecho autónomo ni autoriza modificar la fuente.                                                    |
| SNAPSHOT             | Captura inmutable de un estado o resultado analítico para un corte, contexto y versión definidos.                | Es derivado; una corrección posterior produce una nueva publicación/restatement según su tarea propietaria. |
| ARTEFACTO VERSIONADO | Regla, presupuesto, forecast, escenario, precio u otra definición con versión y vigencia.                        | Se identifica la versión realmente aplicada; la versión actual no reemplaza la histórica.                   |
| MÉTRICA / KPI        | Definición semántica y resultado derivado sobre hechos/dimensiones.                                              | Nunca es fuente de verdad del hecho ni de los maestros consumidos.                                          |

No se crea un enum técnico universal. Estas categorías establecen semántica documental y fronteras de modelado.

---

#### 4. Contrato canónico de tiempo

| Coordenada temporal | Semántica obligatoria                                                            | Regla                                                                                                         |
| ------------------- | -------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| ocurrencia          | Instante o intervalo en que el hecho sucedió en el dominio propietario.          | No se sustituye por hora de carga o procesamiento.                                                            |
| fecha empresarial   | Fecha asignada por el proceso propietario para operación y agrupación.           | Debe conservar regla y zona horaria; no se recalcula automáticamente desde UTC ni desde la fecha de consulta. |
| recepción           | Momento en que el sistema receptor obtuvo el hecho o evento.                     | Permite distinguir atraso de origen frente a atraso de procesamiento.                                         |
| procesamiento       | Momento en que una transformación o modelo incorporó el registro.                | No cambia la ocurrencia ni la fecha empresarial.                                                              |
| última corrección   | Momento de la corrección válida más reciente del hecho o de su relación.         | La corrección debe ser trazable; no elimina el estado previo.                                                 |
| corte analítico     | Instante hasta el cual un resultado observa hechos, correcciones y dimensiones.  | Todo estado derivado o snapshot debe declarar este corte.                                                     |
| zona horaria        | Zona utilizada para interpretar instantes locales, fecha empresarial y ventanas. | Debe formar parte del contexto de cálculo cuando pueda cambiar el resultado.                                  |

Reglas obligatorias:

1. `fecha del hecho ≠ fecha empresarial ≠ fecha de recepción ≠ fecha de procesamiento ≠ fecha de corrección`;
2. un hecho tardío conserva su ocurrencia original aunque sea recibido o procesado después;
3. un periodo cerrado no autoriza mover silenciosamente un hecho a otro periodo; el tratamiento corresponde al contrato de dominio y, cuando aplique, a restatement o reapertura;
4. un evento sin instante confiable no adquiere uno inventado para hacerlo comparable; su tratamiento de calidad pertenece a `DATA-DOM-007`;
5. la analítica nunca corrige el hecho fuente para hacer coincidir un reporte; la corrección vuelve al propietario o se representa como restatement según `DATA-DOM-017`.

---

#### 5. Contrato de granularidad

Cada hecho o modelo analítico deberá declarar una unidad mínima antes de cualquier agregación. El grano responde a “qué representa exactamente una fila lógica o una observación”.

Reglas:

1. cabecera y línea se mantienen separadas cuando cantidades, productos, impuestos, precios, movimientos o resultados pertenecen a la línea;
2. una sesión, un evento puntual, un caso y un snapshot no comparten grano aunque se relacionen;
3. un agregado no se une directamente con otro grano si esa unión multiplica o pierde hechos;
4. toda combinación entre granos distintos exige una agregación, relación o puente declarado por el modelo propietario;
5. las tasas se agregan recomputando numerador y denominador sobre el nuevo conjunto comparable; no se promedian porcentajes salvo que exista una definición distinta aprobada;
6. una dimensión puede segmentar un hecho solo cuando existe una relación válida para el tiempo del hecho;
7. una fila de snapshot no se usa como si fuera el hecho atómico que la produjo;
8. la materialización física de estos granos pertenece a E3 y `DATA-INT-002`.

---

#### 6. Matriz materializada de hechos, eventos y representaciones heredadas

| Familia heredada                                                         | Clasificación                             | Grano natural / regla de separación                                                                                                                                                                       | Tiempo principal                                                                                                             | Fuente propietaria                             | Estado       |
| ------------------------------------------------------------------------ | ----------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------- | ------------ |
| SHIFT, ATTENDANCE_EVENT, ATTENDANCE_CORRECTION                           | HECHO / EVENTO LABORAL                    | SHIFT: un periodo de trabajo programado por trabajador y contexto; ATTENDANCE_EVENT: un evento original inmutable; ATTENDANCE_CORRECTION: una decisión auditada vinculada al original.                    | Inicio/fin programado para SHIFT; instante de ocurrencia para evento; instante de decisión para corrección.                  | VISO / ANIMA según proceso                     | ESPECIFICADO |
| CONSENT_RECORD, CONTACT_VERIFICATION                                     | EVENTO / EVIDENCIA DE AUTORIZACIÓN        | Una declaración o retiro de autorización por persona/finalidad/versión/alcance; una verificación por contacto o evidencia verificada.                                                                     | Instante de captura/verificación/retiro y vigencia del texto o evidencia.                                                    | PASS y gobierno de privacidad                  | ESPECIFICADO |
| LOYALTY_LEDGER_ENTRY, redención, ajuste de puntos                        | HECHO TRANSACCIONAL                       | Un movimiento del ledger por cuenta, regla/versión y evento origen; redención y ajuste permanecen movimientos o decisiones distinguibles.                                                                 | Timestamp del movimiento y vigencia/expiración cuando aplique.                                                               | PASS / PULSO según proceso                     | ESPECIFICADO |
| solicitud, caso, cotización, orden, recepción, devolución de compra      | CASO / TRANSACCIÓN                        | Cada objeto conserva su propia identidad natural; cabecera y líneas no se mezclan cuando existen cantidades, precios o productos por línea.                                                               | Instante de creación/decisión/recepción/devolución según el hecho; vigencia de oferta o condición aplicada.                  | ORIGO                                          | ESPECIFICADO |
| lote, LPN, existencia, movimiento, conteo, ajuste                        | HECHO / ENTIDAD OPERATIVA DE TRAZABILIDAD | Lote y LPN conservan identidad propia; movimiento y ajuste son eventos; conteo es observación; existencia es estado derivado para un producto/presentación/lote/LOC en un corte.                          | Instante del movimiento/conteo/ajuste; corte explícito para existencia; fechas propias del lote.                             | NEXO / FOGO según proceso                      | ESPECIFICADO |
| orden, lote, ejecución, consumo, merma y resultado productivo            | HECHO PRODUCTIVO                          | Orden, lote y ejecución permanecen instancias distintas; consumos, salidas, mermas y resultados se registran al nivel de la cantidad/objeto efectivamente medido.                                         | Inicio/fin de ejecución y timestamp del consumo, salida, merma o resultado; versión de receta realmente usada.               | FOGO                                           | ESPECIFICADO |
| pedido, comanda, venta, pago, caja, devolución, entrega                  | HECHO COMERCIAL                           | Pedido, comanda, venta, pago, movimiento/sesión de caja, devolución y entrega son granos distintos; líneas y partes monetarias se conservan cuando el hecho se descompone.                                | Creación/confirmación/ejecución de cada objeto; venta y pago conservan su propio momento; el corte comercial no los colapsa. | PULSO                                          | ESPECIFICADO |
| precio de venta, descuento, promoción vigente                            | REGLA / CONFIGURACIÓN VERSIONADA          | Una versión por oferta, contexto y vigencia; el valor aplicado se conserva como snapshot de la línea o transacción que lo consumió.                                                                       | Inicio/fin de vigencia de la regla y momento de aplicación al hecho.                                                         | PULSO; AURA solo propone intención promocional | ESPECIFICADO |
| SERVICE_CASE, reclamo, reserva, compensación, satisfacción, comunicación | CASO / EVENTO DE SERVICIO                 | Caso, interacción, investigación, respuesta, reserva, decisión de compensación y comunicación conservan identidades/granos separados.                                                                     | Instante del contacto, decisión, respuesta o comunicación y vigencia del caso/reserva cuando aplique.                        | VISO, PASS o PULSO según frontera              | ESPECIFICADO |
| hecho económico, obligación, pago, aplicación, conciliación              | HECHO / REGISTRO ECONÓMICO                | Hecho económico, obligación, pago y aplicación no son equivalentes; cada uno conserva identidad y una conciliación relaciona registros sin fusionarlos.                                                   | Fecha de ocurrencia y, cuando aplique, fecha de reconocimiento, vencimiento, aplicación o conciliación.                      | NUMERA                                         | ESPECIFICADO |
| presupuesto, forecast, escenario                                         | ARTEFACTO ECONÓMICO VERSIONADO            | Una versión por periodo, escenario y alcance; sus líneas o coordenadas dimensionales no se confunden con hechos reales.                                                                                   | Vigencia/periodo de la versión y fecha de aprobación o generación según contrato.                                            | NUMERA                                         | ESPECIFICADO |
| campaña, pieza publicada, oportunidad, interacción, publicación          | CASO / ACTIVIDAD / EVENTO DE MARKETING    | Cada actividad conserva identidad y grano propio; interacción, conversión y venta no se colapsan. No se materializa operación analítica actual mientras AURA siga diferida.                               | Timestamp y vigencia del evento/actividad cuando exista una fuente AURA habilitada.                                          | AURA objetivo                                  | BLOQUEADO    |
| ticket, incidente, problema, cambio tecnológico                          | CASO / EVENTO TI                          | Ticket, incidente, problema y cambio son expedientes/eventos distintos y se relacionan con servicio, aplicación, endpoint o recurso sin crear maestros nuevos.                                            | Instante de reporte, afectación, cambio, restauración y cierre según cada objeto.                                            | VISO / BLOQUE Z                                | ESPECIFICADO |
| PRINTER como clase de configuración, ASSET como clase de configuración   | PROYECCIÓN REFERENCIAL                    | No constituye hecho ni grano analítico autónomo; referencia identidades propietarias de PRINT-ARC/NEXO.                                                                                                   | NO APLICA como hecho; cualquier evento pertenece al activo, impresión o servicio correspondiente.                            | PRINT-ARC / NEXO                               | NO_APLICA    |
| métrica, KPI, dashboard, reporte, exportación, snapshot                  | DERIVADO ANALÍTICO / REPRESENTACIÓN       | La definición de métrica conserva identidad/versionado; el resultado se materializa por contexto y corte; dashboard/reporte/exportación son superficies; snapshot es una observación inmutable por corte. | Corte analítico explícito, versión de métrica y contexto; publicación/restatement se gobiernan por tareas propietarias.      | BLOQUE AB sobre fuentes propietarias           | ESPECIFICADO |

**Reconciliación:** 15 familias esperadas; 15 materializadas; 0 faltantes; 0 duplicadas por familia heredada.

---

#### 7. Dimensiones históricas compartidas

Una dimensión compartida conserva la identidad gobernada por `DATA-DOM-002` y `DATA-DOM-003`. Para análisis histórico se resuelve con la versión, relación, jerarquía o vigencia aplicable al hecho o a su fecha empresarial; el valor actual no reemplaza silenciosamente el contexto anterior.

Principios:

- identidad canónica y atributos descriptivos son conceptos distintos;
- reparenting conserva la identidad del hijo y la vigencia de la relación anterior;
- una identidad retirada continúa resolviendo hechos históricos;
- una fusión o separación no redistribuye hechos pasados por aproximación;
- una dimensión derivada no adquiere autoridad sobre el maestro;
- cuando la relación histórica no puede demostrarse, el modelo no la reconstruye por semejanza textual; el caso se remite a calidad/reconciliación;
- los objetos con `Dimensión compartida = NO` no se promueven a ejes analíticos transversales;
- los objetos AURA mantienen su rol conceptual, pero continúan bloqueados mientras no exista fuente operativa vigente.

|    # | Objeto canónico               | Rol de dimensión | Resolución histórica aprobada                                                                                                                             | Estado         |
| ---: | ----------------------------- | ---------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- |
|    1 | `ORGANIZATION_SCOPE`          | `SI`             | Resolver el alcance organizacional vigente para la fecha empresarial del hecho; una reorganización posterior no recodifica hechos anteriores.             | `ESPECIFICADO` |
|    2 | `LEGAL_SUBJECT`               | `SI`             | Resolver el sujeto jurídico vigente del hecho o documento; cambios registrales posteriores no sustituyen la atribución histórica.                         | `ESPECIFICADO` |
|    3 | `BRAND`                       | `SI`             | Resolver la marca vigente asociada al hecho; cambios de nombre o titularidad conservan la identidad y vigencia aplicables.                                | `ESPECIFICADO` |
|    4 | `COMMERCIAL_ESTABLISHMENT`    | `SI`             | Resolver el establecimiento vigente cuando el hecho lo requiera; cierres o cambios registrales posteriores no reescriben historia.                        | `ESPECIFICADO` |
|    5 | `BUSINESS_LINE`               | `SI`             | Resolver la línea de negocio vigente en el contexto del hecho; reorganizaciones posteriores se tratan por vigencia.                                       | `ESPECIFICADO` |
|    6 | `PHYSICAL_FACILITY`           | `SI`             | Resolver la instalación física vinculada durante la ocurrencia; un traslado posterior no cambia la instalación histórica.                                 | `ESPECIFICADO` |
|    7 | `OPERATIONAL_SITE`            | `SI`             | Resolver la sede operativa vigente al hecho; aperturas, cierres o traslados posteriores no alteran la sede histórica.                                     | `ESPECIFICADO` |
|    8 | `ORGANIZATIONAL_AREA`         | `SI`             | Resolver el área vigente y su relación efectiva en la fecha empresarial; reparenting posterior conserva la relación anterior.                             | `ESPECIFICADO` |
|    9 | `PHYSICAL_ZONE`               | `SI`             | Resolver la zona física y contención vigentes durante el hecho; remodelaciones posteriores no sustituyen el contexto histórico.                           | `ESPECIFICADO` |
|   10 | `WORKSTATION`                 | `SI`             | Resolver el punto de ejecución vigente al hecho; reasignar dispositivo o área después no cambia el punto histórico.                                       | `ESPECIFICADO` |
|   11 | `EXTERNAL_OPERATIONAL_POINT`  | `SI`             | Resolver el punto externo vigente durante la operación; expiración posterior no elimina hechos ya vinculados.                                             | `ESPECIFICADO` |
|   12 | `PERSON_IDENTITY`             | `SI`             | Usar la identidad empresarial canónica vinculada al hecho; nunca reconstruirla por nombre, correo o teléfono actuales.                                    | `ESPECIFICADO` |
|   13 | `WORKER_PROFILE`              | `SI`             | Resolver el perfil laboral vigente durante el hecho; cambios posteriores de vínculo o perfil no recodifican asistencia u operación pasada.                | `ESPECIFICADO` |
|   14 | `EMPLOYMENT_RELATIONSHIP`     | `SI`             | Resolver el vínculo cuya vigencia cubre el hecho; reingresos o vínculos posteriores permanecen identidades separadas.                                     | `ESPECIFICADO` |
|   15 | `CONTRACTUAL_POSITION`        | `SI`             | Resolver la posición contractual vigente al hecho cuando sea una dimensión autorizada; denominaciones posteriores no sustituyen la histórica.             | `ESPECIFICADO` |
|   16 | `BASE_ROLE`                   | `NO`             | NO_DIMENSION_COMPARTIDA: no usar como eje analítico compartido; conservarlo únicamente dentro de contratos de autorización cuando corresponda.            | `ESPECIFICADO` |
|   17 | `OPERATIONAL_ROLE`            | `SI`             | Resolver la función operativa vigente en el contexto del hecho; no inferirla desde cargo o permisos actuales.                                             | `ESPECIFICADO` |
|   18 | `WORK_ASSIGNMENT`             | `SI`             | Resolver la asignación con vigencia aplicable al hecho; cambios de sede, área o función posteriores no reatribuyen el pasado.                             | `ESPECIFICADO` |
|   19 | `CUSTOMER_PERSON`             | `SI`             | Usar la identidad cliente canónica vinculada al hecho; fusiones o correcciones posteriores requieren trazabilidad y no reasignación silenciosa.           | `ESPECIFICADO` |
|   20 | `CUSTOMER_CONTACT`            | `NO`             | NO_DIMENSION_COMPARTIDA: correo o teléfono no segmentan transversalmente como identidad; solo pueden intervenir bajo finalidad y autorización explícitas. | `ESPECIFICADO` |
|   21 | `CUSTOMER_RELATIONSHIP`       | `SI`             | Resolver la relación cliente-marca/alcance vigente al hecho; no asumir que una relación actual existía históricamente.                                    | `ESPECIFICADO` |
|   22 | `CUSTOMER_PROFILE`            | `SI`             | Resolver únicamente el perfil vigente y autorizado para el hecho; no reconstruir datos sensibles desde el perfil actual.                                  | `ESPECIFICADO` |
|   23 | `CUSTOMER_PREFERENCE`         | `SI`             | Resolver la preferencia vigente cuando el análisis la requiera y esté autorizado; nunca convertir preferencia actual en hecho histórico.                  | `ESPECIFICADO` |
|   24 | `LOYALTY_ACCOUNT`             | `SI`             | Resolver la cuenta de fidelización vinculada al movimiento; el saldo actual no sustituye el ledger histórico.                                             | `ESPECIFICADO` |
|   25 | `LOYALTY_PROGRAM_RULE`        | `SI`             | Resolver la versión de regla vigente aplicada al movimiento; reglas posteriores no recalculan movimientos históricos sin restatement.                     | `ESPECIFICADO` |
|   26 | `PRODUCTO_MAESTRO`            | `SI`             | Usar la identidad de producto referenciada por el hecho; renombres o reclasificaciones posteriores no reemplazan su identidad histórica.                  | `ESPECIFICADO` |
|   27 | `VARIANTE`                    | `SI`             | Resolver la variante referenciada por la línea o ejecución; cambios posteriores de configuración no colapsan variantes históricas.                        | `ESPECIFICADO` |
|   28 | `PRESENTACION`                | `SI`             | Resolver la presentación realmente aplicada en compra, stock, remisión, producción o venta; una etiqueta actual no sustituye la histórica.                | `ESPECIFICADO` |
|   29 | `UNIDAD_DE_MEDIDA`            | `SI`             | Resolver la unidad efectiva del hecho y su versión/convención aplicable; no convertir cantidades históricas por inferencia.                               | `ESPECIFICADO` |
|   30 | `TAXONOMIA_TIPO_MAESTRO`      | `SI`             | Resolver la clasificación vigente del maestro al corte histórico cuando sea necesaria; cambios posteriores deben quedar distinguibles.                    | `ESPECIFICADO` |
|   31 | `TAXONOMIA_INVENTARIO`        | `SI`             | Resolver la clasificación de inventario vigente en el hecho o corte; cambios posteriores no reetiquetan movimientos pasados silenciosamente.              | `ESPECIFICADO` |
|   32 | `TAXONOMIA_OPERACIONAL`       | `SI`             | Resolver la taxonomía operacional vigente cuando segmenta un hecho; no usar la clasificación actual como sustituto automático.                            | `ESPECIFICADO` |
|   33 | `LOC`                         | `SI`             | Resolver el LOC origen/destino/observado del hecho con su identidad histórica; reubicaciones posteriores no cambian movimientos anteriores.               | `ESPECIFICADO` |
|   34 | `ACTIVO_FISICO`               | `SI`             | Resolver el activo canónico y su relación vigente durante el hecho; cambios posteriores de custodia o ubicación no reatribuyen eventos previos.           | `ESPECIFICADO` |
|   35 | `CLASE_DE_ACTIVO`             | `SI`             | Resolver la clase vigente cuando sea necesaria para análisis histórico; reclasificaciones posteriores deben conservar vigencia.                           | `ESPECIFICADO` |
|   36 | `ESPECIFICACION_PRODUCTO`     | `NO`             | NO_DIMENSION_COMPARTIDA: conservar la versión de especificación como contexto/evidencia del hecho cuando aplique, sin promoverla a eje compartido.        | `ESPECIFICADO` |
|   37 | `PROVEEDOR`                   | `SI`             | Resolver el proveedor canónico del hecho contractual o transaccional; cambios posteriores de nombre o condición no alteran compras pasadas.               | `ESPECIFICADO` |
|   38 | `CONTACTO_PROVEEDOR`          | `NO`             | NO_DIMENSION_COMPARTIDA: el contacto permanece relación operativa y no identidad analítica del proveedor.                                                 | `ESPECIFICADO` |
|   39 | `RELACION_PRODUCTO_PROVEEDOR` | `SI`             | Resolver la relación vigente al hecho de abastecimiento cuando sea necesaria; no inferir disponibilidad histórica desde la relación actual.               | `ESPECIFICADO` |
|   40 | `CONDICION_COMERCIAL`         | `SI`             | Resolver la versión de condición comercial aplicada al hecho; la condición vigente hoy no modifica órdenes o recepciones anteriores.                      | `ESPECIFICADO` |
|   41 | `TAXONOMIA_COMPRA`            | `SI`             | Resolver la clasificación de compra vigente cuando segmenta el hecho; cambios posteriores se manejan por vigencia.                                        | `ESPECIFICADO` |
|   42 | `RECETA`                      | `SI`             | Resolver la identidad de receta y la versión realmente usada por la ejecución; una versión actual no recalcula lotes históricos.                          | `ESPECIFICADO` |
|   43 | `FAMILIA_PRODUCTIVA`          | `SI`             | Resolver la familia productiva vigente para el contexto histórico cuando sea usada como dimensión.                                                        | `ESPECIFICADO` |
|   44 | `RUTA_PRODUCTIVA`             | `SI`             | Resolver la ruta productiva y versión aplicables a la ejecución; cambios posteriores no sustituyen la ruta histórica.                                     | `ESPECIFICADO` |
|   45 | `RECURSO_PRODUCTIVO`          | `SI`             | Resolver el recurso funcional utilizado en la ejecución; cambios posteriores de activo asociado no reatribuyen el hecho.                                  | `ESPECIFICADO` |
|   46 | `COMMERCIAL_CHANNEL`          | `SI`             | Resolver el canal comercial registrado en el hecho; cambios posteriores de catálogo no recodifican ventas pasadas.                                        | `ESPECIFICADO` |
|   47 | `CATEGORIA_COMERCIAL`         | `SI`             | Resolver la categoría comercial vigente cuando se requiera comparación histórica; no sustituirla por la clasificación actual sin vigencia.                | `ESPECIFICADO` |
|   48 | `OFERTA_COMERCIAL`            | `SI`             | Resolver la oferta/versionado aplicado al pedido o venta; precio y disponibilidad actuales no sustituyen el snapshot aplicado.                            | `ESPECIFICADO` |
|   49 | `CENTRO_DE_COSTO`             | `SI`             | Resolver el centro de costo atribuido al hecho económico y su vigencia; reorganizaciones posteriores no redistribuyen automáticamente historia.           | `ESPECIFICADO` |
|   50 | `MONEDA`                      | `SI`             | Resolver la moneda registrada por el hecho; conversiones requieren regla/tasa explícita y no sustituyen el monto original.                                | `ESPECIFICADO` |
|   51 | `PERIODO_ECONOMICO`           | `SI`             | Resolver el periodo económico al que pertenece el hecho según su regla de reconocimiento; no inferirlo solo desde fecha de carga.                         | `ESPECIFICADO` |
|   52 | `PERIODO_CONTABLE`            | `SI`             | Resolver el periodo contable aplicable cuando corresponda; cierres o reaperturas posteriores conservan su historia.                                       | `ESPECIFICADO` |
|   53 | `PERIODO_FISCAL`              | `SI`             | Resolver el periodo fiscal aplicable según autoridad vigente; no equipararlo al periodo económico o contable.                                             | `ESPECIFICADO` |
|   54 | `CLASIFICACION_ECONOMICA`     | `SI`             | Resolver la clasificación económica vigente del hecho; reclasificaciones posteriores requieren trazabilidad explícita.                                    | `ESPECIFICADO` |
|   55 | `PERFIL_DE_MARCA`             | `SI`             | BLOQUEADO_AURA: rol de dimensión permitido por catálogo, pero sin materialización analítica operativa mientras AURA no sea fuente vigente.                | `BLOQUEADO`    |
|   56 | `AUDIENCIA`                   | `SI`             | BLOQUEADO_AURA: rol analítico permitido conceptualmente, sujeto a finalidad/consentimiento; no materializar mientras AURA permanezca bloqueada.           | `BLOQUEADO`    |
|   57 | `ACTIVO_DE_MARCA`             | `SI`             | BLOQUEADO_AURA: puede segmentar actividad futura por identidad/vigencia, pero no se declara fuente operativa vigente.                                     | `BLOQUEADO`    |
|   58 | `ENDPOINT`                    | `SI`             | Resolver el endpoint técnico vigente durante el evento TI; cambios posteriores de activo, custodio o configuración no sustituyen el contexto histórico.   | `ESPECIFICADO` |
|   59 | `SHARED_DEVICE`               | `SI`             | Resolver el dispositivo compartido vigente en el evento autorizado; cambio de actor o asignación posterior no reescribe hechos.                           | `ESPECIFICADO` |
|   60 | `NETWORK_RESOURCE`            | `SI`             | Resolver el recurso de red canónico relacionado al evento; IP, MAC o SSID actuales no sustituyen identidad histórica.                                     | `ESPECIFICADO` |
|   61 | `APPLICATION`                 | `SI`             | Resolver la aplicación canónica y contexto vigente del evento; repositorio, URL o despliegue posterior no cambian la identidad analítica.                 | `ESPECIFICADO` |
|   62 | `TECH_SERVICE`                | `SI`             | Resolver la identidad TI-SERVICE vigente asociada al evento; cambios de implementación no renumeran ni reatribuyen hechos históricos.                     | `ESPECIFICADO` |

**Reconciliación del inventario dimensional:**

| Control                                                              | Resultado |
| -------------------------------------------------------------------- | --------: |
| Objetos esperados                                                    |    **62** |
| Objetos materializados                                               |    **62** |
| Identificadores canónicos únicos                                     |    **62** |
| Faltantes                                                            |     **0** |
| Duplicados                                                           |     **0** |
| Dimensión compartida = SI                                            |    **58** |
| Dimensión compartida = NO                                            |     **4** |
| Objetos AURA bloqueados dentro de los 58 habilitados conceptualmente |     **3** |

---

#### 8. Calendarios y periodos

El modelo no usa un calendario universal para todos los hechos. Cada hecho declara la regla temporal que le corresponde y conserva las referencias de periodo necesarias.

| Coordenada                      | Tratamiento                                                                                                                                                 |
| ------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| periodo operativo               | Coordenada del proceso que agrupa trabajo o servicio según su propia fecha empresarial, ventana o jornada. No crea un nuevo maestro en esta tarea.          |
| `PERIODO_ECONOMICO`             | Referencia NUMERA para reconocimiento y análisis económico. No equivale a jornada operativa.                                                                |
| `PERIODO_CONTABLE`              | Referencia contable aplicable cuando exista autoridad y alcance; puede tener cierre/reapertura propios.                                                     |
| `PERIODO_FISCAL`                | Referencia fiscal bajo autoridad aplicable; no se deduce del periodo económico.                                                                             |
| calendario de turno             | La fecha empresarial del turno y su zona horaria gobiernan la asignación laboral; un turno que cruza medianoche no se parte por inferencia analítica.       |
| calendario comercial            | Pedido, venta, pago y caja conservan sus propios instantes y pueden compartir una jornada sin convertirse en el mismo hecho.                                |
| calendario logístico/productivo | Producción, viaje, parada, recepción y movimiento conservan sus instantes e intervalos naturales; el cierre de una operación no refecha eventos anteriores. |

Una comparación que use periodos diferentes deberá declarar el mapeo de periodo y justificar por qué son comparables.

---

#### 9. Snapshots y estados observados

Se separan obligatoriamente:

```text
VISTA EN VIVO
≠ ESTADO OBSERVADO A UN CORTE
≠ SNAPSHOT ANALÍTICO
≠ SNAPSHOT PUBLICADO / REPORTE OFICIAL
≠ RESTATEMENT
```

Reglas:

1. un snapshot declara corte, contexto, versión de métricas, dimensiones, filtros, unidad/moneda y estado de calidad disponible;
2. el snapshot es inmutable respecto de lo que fue publicado u observado en ese corte;
3. una corrección posterior de la fuente no modifica silenciosamente un snapshot anterior;
4. `DATA-DOM-008` gobierna publicación, reporte oficial, exportación, suscripción y snapshot oficial;
5. `DATA-DOM-017` gobierna restatements, correcciones históricas y reproducibilidad;
6. `DATA-DOM-006` gobierna llegada tardía, backfill y reconciliación de datos que pueden producir una nueva versión/reconstrucción;
7. un snapshot de existencia, saldo o estado no reemplaza el ledger, movimiento o evento fuente;
8. un dashboard o exportación conserva referencia al corte y a la versión semántica, pero no se convierte en fuente de verdad.

---

#### 10. Contrato de comparabilidad histórica

Dos resultados solo son comparables directamente cuando las coordenadas materiales siguientes son iguales o existe una transformación explícita, trazable y aprobada para hacerlas equivalentes.

| Coordenada                     | Condición mínima de comparabilidad                                                     | Tratamiento cuando difiere                                                                      |
| ------------------------------ | -------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| definición de métrica          | misma `metric_key` y misma versión semántica                                           | usar versiones separadas o regla de puente aprobada; nunca ocultar cambio de significado        |
| grano                          | misma unidad analítica antes de agregar                                                | agregar a un grano común declarado; no unir detalle con agregado multiplicando filas            |
| población                      | mismas inclusiones, exclusiones y estados computables                                  | declarar cambio de cobertura o recalcular población comparable                                  |
| corte                          | cortes equivalentes para el objetivo de comparación                                    | señalar parcialidad o usar un corte comparable                                                  |
| calendario y fecha empresarial | misma regla de asignación temporal                                                     | mapear periodos de forma explícita; no desplazar eventos por fecha de carga                     |
| zona horaria                   | misma zona o conversión inequívoca                                                     | convertir instantes preservando la zona original y documentar el cambio                         |
| dimensiones                    | mismas identidades y relaciones históricas aplicables                                  | resolver dimensiones AS OF hecho; no usar jerarquía actual para periodos anteriores por defecto |
| catálogo y jerarquía           | vigencias comparables o reexpresión explícita                                          | mantener clasificación histórica o declarar una vista reexpresada separada                      |
| unidad                         | misma unidad o conversión gobernada                                                    | conservar unidad original y conversión explícita                                                |
| moneda                         | misma moneda o tasa/regla explícita                                                    | conservar monto/moneda original y declarar tasa, fecha y método de conversión                   |
| completitud del periodo        | ambos completos o ambos comparables en avance                                          | marcar periodo parcial y no equipararlo a cierre completo                                       |
| sedes/alcances activos         | población territorial comparable                                                       | declarar aperturas/cierres/cambios de alcance y, si procede, usar conjunto comparable           |
| datos tardíos/correcciones     | mismo estado de incorporación/restatement                                              | señalar versión o restatement; no sustituir el resultado previo en silencio                     |
| modo económico                 | real, presupuestado, pronosticado, simulado, propuesto o publicado claramente separado | no comparar como si fueran hechos del mismo tipo sin declarar el modo                           |

Comparar no significa forzar equivalencia. Cuando una diferencia material no puede resolverse sin alterar el significado, los resultados se presentan como no directamente comparables y se conserva la causa.

---

#### 11. Materialización temporal de las 14 métricas de asistencia

El grano atómico de la versión 1 del registro inicial se fija en **trabajador × turno programado** para la consolidación principal. Sesiones, marcaciones, descansos y eventos de salida conservan granos propios y se correlacionan con el turno; no se convierten en filas de turno por simple coincidencia de nombre o fecha.

La implementación observada primero vincula una sesión por `shift_id` y, cuando no existe vínculo explícito, utiliza una ventana temporal controlada. Esta tarea define la semántica analítica y no cambia ese mecanismo técnico.

| `metric_key`        | Grano de cálculo v1                                     | Semántica temporal / corte                                                                                                | Dimensiones permitidas v1            | Estado         |
| ------------------- | ------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- | ------------------------------------ | -------------- |
| `scheduledShifts`   | trabajador × turno programado                           | fecha empresarial del turno; intervalo programado; corte del reporte                                                      | sede; trabajador autorizado; periodo | `ESPECIFICADO` |
| `attendedShifts`    | trabajador × turno programado                           | mismo turno base; presencia determinada por check-in asociado antes/dentro del corte                                      | sede; trabajador autorizado; periodo | `ESPECIFICADO` |
| `restDayCount`      | trabajador × turno programado clasificado como descanso | fecha empresarial y clasificación vigente del turno                                                                       | sede; trabajador autorizado; periodo | `ESPECIFICADO` |
| `lateCount`         | trabajador × turno programado                           | check-in comparado con inicio programado + gracia aplicable en la zona horaria del contexto                               | sede; trabajador autorizado; periodo | `ESPECIFICADO` |
| `noShowCount`       | trabajador × turno programado                           | estado evaluado al corte: solo computa cuando el fin programado ya ocurrió y no existe sesión asociada                    | sede; trabajador autorizado; periodo | `ESPECIFICADO` |
| `openCount`         | trabajador × turno programado                           | estado de sesión AS OF corte; una sesión abierta hoy no se proyecta retrospectivamente a otro corte                       | sede; trabajador autorizado; periodo | `ESPECIFICADO` |
| `missingCloseCount` | trabajador × turno programado                           | estado AS OF corte + condición de fin programado vencido; esta semántica permanece bloqueada hasta alinear implementación | sede; trabajador autorizado; periodo | `BLOQUEADO`    |
| `autoCloseCount`    | trabajador × turno programado                           | cierre de sesión asociado al turno y mecanismo de autocierre observado en el intervalo/corte                              | sede; trabajador autorizado; periodo | `ESPECIFICADO` |
| `departureCount`    | trabajador × turno programado                           | evento de salida correlacionado dentro de la sesión temporal asociada al turno                                            | sede; trabajador autorizado; periodo | `ESPECIFICADO` |
| `scheduledMinutes`  | trabajador × turno programado                           | duración programada neta del turno en zona horaria aplicable, descontando descanso programado                             | sede; trabajador autorizado; periodo | `ESPECIFICADO` |
| `netMinutes`        | trabajador × turno programado                           | intervalo de sesión observado menos descansos superpuestos válidos; no se reconstruye con estados actuales                | sede; trabajador autorizado; periodo | `ESPECIFICADO` |
| `incidentCount`     | trabajador × turno programado                           | evaluación al corte de las señales tardanza/ausencia/abierto/autocierre/salida; máximo una incidencia agregada por turno  | sede; trabajador autorizado; periodo | `ESPECIFICADO` |
| `attendanceRate`    | agregado de turnos programados computables              | AS OF corte; recomputar numerador y denominador sobre la población comparable; no promediar tasas                         | sede; trabajador autorizado; periodo | `BLOQUEADO`    |
| `punctualityRate`   | agregado de turnos asistidos                            | AS OF corte; recomputar numerador y denominador sobre la población comparable; no promediar tasas                         | sede; trabajador autorizado; periodo | `BLOQUEADO`    |

**Reconciliación del registro inicial:** 14 esperadas; 14 materializadas; 14 claves únicas; 0 faltantes; 0 duplicadas.

Reglas específicas:

- `attendanceRate` y `punctualityRate` se recalculan a partir de sus numeradores y denominadores sobre la población del nuevo contexto; no se promedian tasas de trabajador o sede;
- `noShowCount`, `openCount` y `missingCloseCount` son estados dependientes del corte; consultar otro corte puede producir un estado distinto sin que el hecho original haya sido reescrito;
- `lateCount` conserva la gracia aplicable al turno/contexto para reproducibilidad;
- `netMinutes` usa el intervalo observado de sesión y los descansos superpuestos válidos, no el estado actual del trabajador;
- la zona horaria predeterminada observada en la implementación es `America/Bogota`, pero el contexto debe conservar la zona efectiva usada;
- `missingCloseCount`, `attendanceRate` y `punctualityRate` permanecen `BLOQUEADO` para certificación por divergencias ya identificadas en `DATA-DOM-004`; esta tarea no altera el código ni cambia ese estado.

---

#### 12. Fronteras con tareas posteriores y responsables exactos

| Decisión o implementación fuera de esta tarea                                                  | Tarea propietaria               | Condición de salida                                                  |
| ---------------------------------------------------------------------------------------------- | ------------------------------- | -------------------------------------------------------------------- |
| contratos de recopilación, ingestión, transformación, datos tardíos, backfill y reconciliación | `DATA-DOM-006`                  | antes de mover o reconstruir datos analíticos                        |
| calidad, completitud, unicidad, frescura, validez, integridad y certificación                  | `DATA-DOM-007`                  | antes de declarar un resultado certificado                           |
| publicación de reportes, tableros, exportaciones, alertas, suscripciones y snapshots oficiales | `DATA-DOM-008`                  | antes de publicar artefactos oficiales                               |
| fórmulas y familias analíticas de ventas/demanda/precios/promociones/canales                   | `DATA-DOM-009`                  | antes de certificar analítica comercial                              |
| fórmulas y familias analíticas de inventario/abastecimiento/proveedores/logística              | `DATA-DOM-010`                  | antes de certificar analítica de abastecimiento                      |
| fórmulas y familias analíticas de producción/rendimiento/capacidad/merma/calidad               | `DATA-DOM-011`                  | antes de certificar analítica productiva                             |
| fórmulas y familias analíticas de servicio/clientes/fidelización/reputación/experiencia        | `DATA-DOM-012`                  | antes de certificar analítica de servicio                            |
| fórmulas y familias analíticas de costos/rentabilidad/liquidez/presupuesto/escenarios          | `DATA-DOM-013`                  | antes de certificar analítica económico-financiera                   |
| objetivos, líneas base, metas, drivers y guardrails                                            | `DATA-DOM-015`                  | antes de activar seguimiento de objetivos                            |
| restatements, correcciones históricas y reproducibilidad                                       | `DATA-DOM-017`                  | antes de reexpresar resultados publicados                            |
| protección de datos/analítica por dominio, entidad, territorio y finalidad                     | `DATA-AUTH-001`                 | antes de exponer detalle sensible                                    |
| protección de poblaciones pequeñas, comparaciones, exportaciones y drill-down                  | `DATA-AUTH-002`                 | antes de habilitar detalle o comparación sensible                    |
| segregación entre definición, certificación, publicación y administración                      | `DATA-AUTH-003`                 | antes de certificar/publicar métricas                                |
| materialización técnica de capa semántica, modelos, consultas, caché y snapshots               | `DATA-INT-002`                  | antes de crear modelos físicos o integraciones BI                    |
| crosswalks y reconciliación de identidades externas                                            | `DATA-INT-003`                  | antes de reconciliar claves externas con dimensiones históricas      |
| activación de hechos/dimensiones AURA                                                          | `AURA-AUD-010` y `AURA-AUD-011` | solo si la continuidad/reemplazo de AURA queda aprobada y registrada |

No queda una decisión temporal o dimensional diferida sin tarea propietaria exacta.

---

#### 13. Cobertura de prueba canónica preexistente

El requisito vigente `TREQ-DATA-002` ya protege el registro de métricas con granularidad, dimensiones, unidad, moneda, zona horaria, calendario, versión, reglas de comparación y determinismo de resultado. El requisito vigente `TREQ-DATA-003` ya protege tiempo del hecho, tiempo de carga, granularidad, datos tardíos, backfills, correcciones, reconciliación y linaje, y asigna `DATA-DOM-005` entre sus tareas responsables.

La presente tarea materializa la semántica documental prevista por esos requisitos sin cambiar su regla, prioridad, modalidad, estado, relaciones ni destino de implementación.

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** las reglas de granularidad, tiempo, dimensiones históricas, snapshots y comparabilidad materializadas aquí ya están cubiertas por requisitos canónicos DATA vigentes que asignan esta tarea entre sus responsables. La tarea no introduce comportamiento ejecutable nuevo ni modifica fórmula, ingestión, calidad, autorización, migración, publicación o integración física.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 14. Criterios de aceptación

1. las 15 familias heredadas de hechos/eventos/representaciones reciben clasificación, grano natural, tiempo principal, fuente y estado;
2. se materializan 15 de 15 familias, con 0 faltantes y 0 duplicadas;
3. los 62 objetos del catálogo maestro tienen decisión explícita de uso histórico como dimensión;
4. se preservan exactamente 58 objetos habilitados como dimensión compartida y 4 no habilitados;
5. los tres objetos AURA permanecen `BLOQUEADO` y no adquieren fuente operativa;
6. identidad actual, etiqueta actual o jerarquía actual no sustituyen automáticamente la identidad/relación vigente cuando ocurrió el hecho;
7. reparenting, retiro, fusión y separación conservan historia y no redistribuyen hechos por aproximación;
8. ocurrencia, fecha empresarial, recepción, procesamiento, última corrección y corte analítico quedan separados;
9. periodo operativo, `PERIODO_ECONOMICO`, `PERIODO_CONTABLE` y `PERIODO_FISCAL` no se tratan como equivalentes;
10. un hecho tardío conserva su ocurrencia original y no se mueve de periodo silenciosamente;
11. cada snapshot queda definido como derivado inmutable por corte/contexto y no como fuente de verdad;
12. una corrección posterior no reemplaza silenciosamente un snapshot publicado;
13. la comparabilidad exige coherencia de versión, grano, población, corte, calendario, zona horaria, dimensiones, unidad/moneda, cobertura y estado de restatement;
14. los 14 `metric_key` de asistencia conservan identidad v1 y reciben grano/semántica temporal explícitos;
15. el grano base de consolidación de asistencia queda definido como trabajador × turno programado, manteniendo sesiones/eventos como granos relacionados separados;
16. `noShowCount`, `openCount` y `missingCloseCount` quedan explícitamente definidos AS OF corte;
17. `attendanceRate` y `punctualityRate` se agregan recomputando numerador y denominador, no promediando tasas;
18. las tres métricas bloqueadas en `DATA-DOM-004` permanecen bloqueadas y no se declara certificación;
19. no se crean fórmulas nuevas de ventas, inventario, producción, servicio o finanzas;
20. no se modifica código, Supabase, datos, migraciones, backfills, dashboards, reportes ni snapshots oficiales;
21. se crean 0 requisitos de prueba y se modifican 0;
22. la continuidad queda exclusivamente en `DATA-DOM-006` como siguiente tarea reservada.

---

#### 15. Continuidad

ÚLTIMA TAREA APROBADA
`DATA-DOM-004 — Definir capa semántica y registro canónico de métricas e indicadores`

TAREA ACTUAL APROBADA
`DATA-DOM-005 — Definir hechos, eventos, granularidad, dimensiones, calendarios, snapshots y comparabilidad histórica`

SIGUIENTE TAREA RESERVADA
`DATA-DOM-006 — Definir contratos de recopilación, ingestión, transformación, backfill y reconciliación`


### ✅ DATA-DOM-006 — Definir contratos de recopilación, ingestión, transformación, backfill y reconciliación

**Estado:** APROBADA
**Tarea anterior:** `DATA-DOM-005 — Definir hechos, eventos, granularidad, dimensiones, calendarios, snapshots y comparabilidad histórica` — APROBADA
**Tarea siguiente:** `DATA-DOM-007 — Definir calidad, certificación, frescura, completitud, unicidad, validez e integridad` — RESERVADA
**Tipo de tarea:** documental; contrato canónico de recopilación, ingestión, transformación, backfill, reconciliación y linaje para fuentes internas, externas y derivados analíticos
**Bloque:** AB — Analítica, indicadores y datos maestros
**Fase:** exclusivamente documental
**Implementación técnica:** no autorizada
**Código, DDL, DML, migraciones, backfills, replays, despliegues o cambios en Supabase:** no autorizados
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir el contrato común mediante el cual Vento OS recopilará, recibirá, validará, transformará, reconstruirá y reconciliará datos sin convertir una copia, un archivo, una vista, una importación, un snapshot o un modelo analítico en una nueva fuente de verdad.

La tarea cierra documentalmente la cadena:

```text
FUENTE PROPIETARIA
→ EVENTO / API / VISTA / EXPORTACIÓN CONTROLADA
→ RECOPILACIÓN
→ INGESTIÓN
→ VALIDACIÓN CONTRACTUAL
→ TRANSFORMACIÓN DETERMINISTA
→ CAPA HISTÓRICA O SNAPSHOT APROBADO
→ RECONCILIACIÓN
→ MODELO / MÉTRICA / REPORTE
```

El contrato debe permitir reconstruir qué dato entró, desde qué autoridad, con qué identidad y versión, qué transformaciones recibió, qué quedó rechazado o en cuarentena, qué corrección o backfill ocurrió y cómo se demostró que el resultado concilia con su fuente.

Regla cardinal:

```text
MISMA FUENTE EVIDENCIADA
+ MISMO CORTE
+ MISMAS VERSIONES DE CONTRATO Y TRANSFORMACIÓN
+ MISMO CONTEXTO
=
MISMO RESULTADO DE INGESTIÓN Y TRANSFORMACIÓN
```

Una carga repetida no podrá crear nuevos hechos por el solo hecho de ejecutarse nuevamente.

---

#### 2. Resultado sustantivo

Queda definido el contrato `DATA-DOM-006` con los siguientes resultados:

- cuatro mecanismos de entrada canónicos heredados del flujo aprobado: evento, API, vista y exportación controlada;
- separación obligatoria entre fuente propietaria, evidencia original, copia técnica, staging, transformación, proyección, snapshot y resultado analítico;
- contrato mínimo de recopilación e ingestión con identidad de fuente, claves, versión de esquema, cobertura, corte, tiempos, procedencia, idempotencia y evidencia;
- reglas de evolución de esquema y compatibilidad sin reinterpretación silenciosa;
- transformación determinista, versionada, no destructiva y reproducible;
- tratamiento explícito de duplicados, integridad referencial, valores ausentes, cuarentena y rechazos;
- reglas no destructivas para datos tardíos, replay, backfill, corrección y reconstrucción;
- conciliación obligatoria entre fuente, aceptados, rechazados, duplicados, cuarentena y resultado materializado;
- linaje hasta la evidencia de origen y la versión de transformación;
- materialización de las 15 de 15 familias de hechos, eventos y representaciones heredadas de `DATA-DOM-005`;
- materialización de decisiones de ingestión y reconciliación para los 62 de 62 objetos maestros y de referencia heredados de `DATA-DOM-002` y `DATA-DOM-003`;
- preservación de los tres objetos AURA en estado `BLOQUEADO` sin fingir una fuente operativa;
- materialización del contrato observado de asistencia sobre cuatro fuentes internas y sus 14 métricas registradas;
- materialización del contrato de importación externa controlada para la convivencia con Makos/POS externo, sin declarar una integración automática inexistente;
- cero cambios físicos y cero cambios de requisitos de prueba.

---

#### 3. Fronteras conceptuales obligatorias

```text
FUENTE DE VERDAD
≠
MECANISMO DE EXTRACCIÓN
≠
COPIA DE INGESTIÓN
≠
STAGING
≠
MODELO TRANSFORMADO
≠
SNAPSHOT
≠
REPORTE
```

```text
FECHA DEL HECHO
≠
FECHA EMPRESARIAL
≠
FECHA DE RECEPCIÓN
≠
FECHA DE PROCESAMIENTO
≠
FECHA DE CORRECCIÓN
≠
FECHA DE CORTE
```

```text
REINTENTO
≠
REPLAY
≠
BACKFILL
≠
CORRECCIÓN
≠
RESTATEMENT
```

```text
DUPLICADO
≠
NUEVA VERSIÓN
≠
NUEVO HECHO
≠
CORRECCIÓN DEL HECHO
```

```text
CERO
≠
NULO
≠
NO APLICA
≠
DESCONOCIDO
≠
NO RECIBIDO
≠
DATO PENDIENTE
```

Una transformación puede derivar una nueva representación, pero no adquiere autoridad para corregir silenciosamente la fuente.

---

#### 4. Mecanismos canónicos de entrada

El flujo aprobado admite exactamente cuatro mecanismos lógicos de entrada. Son mecanismos de transporte o lectura, no nuevas autoridades empresariales.

|    # | Mecanismo              | Uso permitido                                                  | Evidencia mínima                                                                                                                                              | Regla de autoridad                                                                                   | Estado         |
| ---: | ---------------------- | -------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- | -------------- |
|    1 | Evento                 | recibir un hecho o cambio producido por una fuente propietaria | identidad del evento o registro, fuente, tiempo de ocurrencia, tiempo de recepción, versión y correlación                                                     | el productor propietario conserva autoridad sobre el hecho; la cola o consumidor no se vuelve fuente | `ESPECIFICADO` |
|    2 | API                    | consultar o recibir datos mediante contrato de servicio        | sistema/proveedor, operación, versión, parámetros materiales, respuesta o referencia verificable, timestamps y estado                                         | la API transporta la representación autorizada; no redefine el significado del objeto                | `ESPECIFICADO` |
|    3 | Vista                  | leer una proyección gobernada de datos existentes              | fuente lógica, definición/versionado aplicable, corte, filtros y dependencias                                                                                 | una vista es proyección; no se corrige como maestro ni sustituye los hechos que agrega               | `ESPECIFICADO` |
|    4 | Exportación controlada | ingresar archivo o exportación obtenida de una fuente aprobada | archivo/payload original cuando corresponda, fuente, periodo, versión/formato, hash o evidencia equivalente, actor/proceso de recepción y cobertura declarada | el archivo es evidencia transportada; no adquiere autoridad por haber sido importado                 | `ESPECIFICADO` |

**Reconciliación:** 4 mecanismos esperados; 4 materializados; 0 faltantes; 0 duplicados.

Un webhook se trata como entrega de evento o API según su contrato. Un archivo plano se trata como exportación controlada. Un backfill no constituye un quinto mecanismo: reutiliza una fuente y un mecanismo aprobados con un periodo histórico y una finalidad explícitos.

---

#### 5. Contrato mínimo de recopilación e ingestión

Toda recopilación deberá fijar, cuando aplique al mecanismo y al dominio:

- sistema, dominio y propietario de la fuente;
- objeto, hecho o familia de datos transportada;
- rol de la fuente: autoridad, evidencia externa, proyección o derivado;
- identidad del registro fuente o claves que permitan correlacionarlo sin inventar identidad;
- claves externas y crosswalk aplicable cuando exista un sistema externo;
- versión del contrato y del esquema de entrada;
- periodo o ventana solicitada;
- fecha y hora de corte de la extracción;
- fecha de ocurrencia del hecho;
- fecha empresarial derivada conforme a `DATA-DOM-005`;
- fecha de recepción;
- fecha de procesamiento;
- zona horaria y calendario cuando afecten el significado;
- cobertura esperada y cobertura observada;
- unidad, moneda o escala cuando correspondan;
- estado de la fuente y evidencia de procedencia;
- identidad de lote, corrida o solicitud cuando el mecanismo la provea o el proceso la necesite para idempotencia;
- regla de deduplicación y correlación;
- política de valores ausentes y estados no equivalentes;
- política de cuarentena y rechazo;
- versión de transformación aplicada;
- resultado de conciliación;
- linaje hacia el original y hacia los derivados autorizados.

Ningún campo de la lista obliga a crear una columna física con ese nombre. La representación técnica se decide en la arquitectura e implementación posteriores.

---

#### 6. Autoridad, copia original y staging

Reglas:

1. la fuente propietaria conserva el dato empresarial o hecho que le corresponde;
2. una copia de ingestión no se convierte en fuente por estar más disponible o ser más fácil de consultar;
3. cuando la trazabilidad lo requiera, el valor externo original, archivo o payload se conserva separado de la forma canónica o derivada;
4. una normalización, parser o mapeo nunca sobrescribe la evidencia externa necesaria para conciliación;
5. staging puede contener datos inválidos o incompletos y por ello no es una superficie certificada;
6. una vista, caché o modelo analítico se reconstruye desde fuentes gobernadas y no se edita para corregir el origen;
7. una fuente no autorizada, hoja paralela o archivo informal no se promueve a autoridad por conveniencia;
8. cuando dos fuentes reclamen autoridad sobre el mismo atributo, se aplica la frontera de propiedad aprobada; no se usa precedencia por última escritura;
9. los crosswalks físicos y claves externas pertenecen a `DATA-INT-003` y no se inventan en esta tarea.

---

#### 7. Identidad, idempotencia y duplicados

La ingestión deberá distinguir:

- identidad empresarial o canónica del objeto;
- clave técnica de la fuente;
- clave externa cuando exista;
- identidad del evento o movimiento cuando el dominio la defina;
- identidad de la operación de ingestión o lote cuando sea necesaria para reintentos;
- versión del contenido cuando el mismo registro admite revisiones legítimas.

Reglas:

1. repetir el mismo evento, archivo, página, lote o payload con la misma identidad y contenido no crea otro hecho;
2. la misma identidad con contenido materialmente distinto genera conflicto, nueva versión o corrección según el contrato propietario; nunca se resuelve por sobrescritura silenciosa;
3. igualdad de nombre, monto, timestamp aproximado o texto normalizado no prueba duplicidad;
4. deduplicación no autoriza fusión de maestros; la identidad y fusión permanecen gobernadas por `DATA-DOM-003`;
5. una clave de reintento no reemplaza la identidad empresarial;
6. los duplicados detectados se cuentan y conservan como resultado de la corrida, no se ocultan para hacer cuadrar totales;
7. un replay de una fuente ya procesada debe producir el mismo conjunto aceptado para las mismas versiones y contexto, salvo correcciones explícitas.

---

#### 8. Evolución y versión de esquema

Cada fuente deberá declarar una versión o evidencia suficiente para reconocer la forma de los datos que entrega.

Se distinguen:

- cambio compatible que agrega información sin alterar el significado existente;
- cambio de representación que requiere adaptador o mapeo versionado;
- cambio incompatible que modifica tipos, claves, granularidad, semántica o población;
- dato desconocido para la versión del consumidor.

Reglas:

1. un cambio incompatible no se consume usando el parser anterior por aproximación;
2. un campo nuevo no se interpreta como equivalente a otro campo histórico por nombre parecido;
3. los campos eliminados o renombrados requieren mapeo explícito cuando afecten continuidad histórica;
4. el contrato preserva qué versión produjo cada carga;
5. una transformación dependiente de un esquema no disponible queda bloqueada o en cuarentena;
6. la compatibilidad física y despliegue se materializan en tareas de integración/arquitectura, no en esta tarea documental.

---

#### 9. Transformación determinista y no destructiva

Toda transformación aprobada deberá ser reproducible con:

```text
ENTRADA EVIDENCIADA
+ VERSIÓN DE ESQUEMA
+ VERSIÓN DE REGLAS
+ CONTEXTO
+ CORTE
=
SALIDA DETERMINISTA
```

Reglas:

1. la transformación no altera el valor original cuando este deba preservarse;
2. las conversiones de unidad o moneda declaran factor, fuente, vigencia y precisión aplicables;
3. los joins usan identidades y relaciones aprobadas, no etiquetas visibles;
4. una dimensión histórica se resuelve con la vigencia aplicable al hecho conforme a `DATA-DOM-005`;
5. una relación ausente no se completa con el maestro actual por defecto;
6. una corrección de mapeo produce una nueva ejecución o reconstrucción trazable; no edita un resultado histórico publicado;
7. las normalizaciones textuales consumen los contratos de normalización vigentes y preservan originales cuando aplique;
8. la misma transformación aplicada dos veces a la misma entrada y versión debe ser idempotente;
9. la transformación no convierte una compensación, reversión o corrección en una nueva operación económica o física;
10. el propietario técnico de la transformación no adquiere propiedad funcional sobre los datos fuente.

---

#### 10. Integridad referencial, faltantes y cuarentena

Una entrada puede ser recibida técnicamente y aun no ser apta para materialización.

Debe quedar explícito si un registro:

- fue aceptado;
- fue rechazado;
- quedó en cuarentena;
- fue detectado como duplicado;
- quedó pendiente de una referencia;
- quedó pendiente de una versión de esquema o mapping;
- no aplica al contrato;
- fue procesado con advertencia permitida.

Reglas:

1. una clave externa sin crosswalk válido no se fuerza contra un maestro por similitud;
2. una referencia inexistente no se sustituye por un registro genérico para evitar el error;
3. un importe o cantidad inválidos no se convierten automáticamente a cero;
4. dato no recibido, dato desconocido y dato pendiente permanecen separados;
5. la cuarentena conserva la evidencia original y la razón de bloqueo;
6. corregir una fila en cuarentena genera una decisión trazable y vuelve a ejecutar la validación aplicable;
7. `DATA-DOM-007` definirá umbrales, severidad, certificación y resolución de excepciones sin cambiar estas semánticas.

---

#### 11. Datos tardíos

Un dato tardío conserva el tiempo del hecho original.

Reglas:

1. la recepción posterior no mueve silenciosamente el hecho al periodo de recepción;
2. la fecha empresarial se determina con el contrato temporal de `DATA-DOM-005`;
3. si el periodo está abierto, la fuente o modelo puede incorporar el hecho conforme al contrato y actualizar el corte correspondiente;
4. si el periodo o snapshot fue publicado/cerrado, la llegada tardía no reescribe la publicación anterior;
5. la necesidad de reexpresar un resultado publicado pertenece a `DATA-DOM-017`;
6. la corrida registra cuánto llegó tarde y qué objetos/resultados fueron afectados;
7. un timestamp ausente no se inventa para hacer entrar el registro en una ventana.

---

#### 12. Replay, backfill, corrección y reconstrucción

##### 12.1. Reintento

Repite una solicitud que puede no haber confirmado resultado. Debe conservar la misma identidad idempotente cuando el contrato lo permita.

##### 12.2. Replay

Vuelve a procesar evidencia ya recibida con el mismo contrato o con una versión declarada para comprobar o reconstruir un resultado.

##### 12.3. Backfill

Carga o reconstruye un periodo histórico que no estaba materializado o estaba incompleto, usando una fuente aprobada y evidencia suficiente.

Todo backfill deberá declarar:

- fuente y autoridad;
- periodo exacto;
- motivo;
- cobertura esperada y límites conocidos;
- esquema/formato de origen;
- mappings y crosswalks aplicables;
- reglas de duplicidad;
- tratamiento de datos faltantes;
- versión de transformación;
- criterio de conciliación;
- objetos y consumidores potencialmente afectados;
- mecanismo de reversión o reconstrucción lógica cuando se implemente;
- relación con snapshots o publicaciones previas.

##### 12.4. Corrección

Corrige un dato o relación cuya fuente propietaria reconoce como incorrecta. Conserva procedencia, original y decisión según el dominio.

##### 12.5. Reconstrucción

Recalcula una proyección, modelo o snapshot a partir de fuentes gobernadas. No crea hechos que la fuente no contenga.

##### 12.6. Restatement

Cuando una corrección, dato tardío o backfill obliga a reexpresar un resultado publicado, el gobierno de versiones y reproducibilidad corresponde a `DATA-DOM-017`.

Queda prohibido usar un backfill para inventar historia, completar huecos por promedio, mover hechos entre identidades por similitud o borrar la evidencia de que el dato llegó después.

---

#### 13. Conciliación

Toda ingestión material deberá poder explicar:

```text
REGISTROS / UNIDADES ESPERADAS
=
ACEPTADOS
+ RECHAZADOS
+ CUARENTENA
+ DUPLICADOS RECONOCIDOS
+ EXCLUSIONES JUSTIFICADAS
```

La igualdad anterior aplica solo cuando la fuente permite conocer una población esperada. Si no la permite, el contrato declara expresamente que la cobertura total no es comprobable y no inventa un denominador.

La conciliación podrá incluir, según el dominio:

- conteo de registros, líneas, eventos o archivos;
- suma de cantidades;
- suma de importes por moneda;
- documentos o folios;
- identidades externas;
- ventanas temporales;
- saldos inicial/final y movimientos cuando el dominio lo permita;
- referencias sin resolver;
- duplicados;
- rechazos y cuarentena;
- registros tardíos;
- diferencias entre origen y resultado.

Reglas:

1. una diferencia no se cierra cambiando el dato para que cuadre;
2. cada diferencia conserva causa, responsable, estado y resolución cuando se implemente el workflow;
3. conciliación técnica no sustituye conciliación empresarial, fiscal o financiera cuando estas sean distintas;
4. una corrida puede terminar con diferencias visibles; no se declara certificada por completar el procesamiento;
5. los criterios de certificación pertenecen a `DATA-DOM-007`.

---

#### 14. Linaje y trazabilidad

Todo resultado materializado deberá poder recorrer, según corresponda:

```text
RESULTADO
→ VERSIÓN DE TRANSFORMACIÓN
→ REGISTRO O CONJUNTO DE ENTRADA
→ LOTE / SOLICITUD / CORTE
→ MECANISMO DE ENTRADA
→ FUENTE PROPIETARIA O EVIDENCIA EXTERNA
```

Para métricas y reportes, el linaje se extiende además hasta:

- versión de métrica;
- dimensiones y filtros;
- fecha de corte;
- snapshot o modelo consultado;
- hechos y maestros de los que proviene.

El linaje no concede acceso automático al detalle. La autorización se evalúa en cada nivel conforme a `DATA-AUTH-001` y `DATA-AUTH-002`.

---

#### 15. Matriz materializada de las 15 familias heredadas

|    # | Familia heredada                                                         | Fuente propietaria                             | Contrato de ingestión                                                                                                                  | Backfill / corrección                                                                                             | Conciliación mínima                                                                                 | Estado         |
| ---: | ------------------------------------------------------------------------ | ---------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | -------------- |
|    1 | SHIFT, ATTENDANCE_EVENT, ATTENDANCE_CORRECTION                           | VISO / ANIMA según proceso                     | registros internos por identidad propia, tiempo del hecho y vigencia; programación y asistencia permanecen separadas                   | replay/backfill solo desde programación y hechos evidenciados; corrección laboral no sustituye el evento original | turnos por ventana, sesiones/eventos correlacionados, descansos, correcciones y diferencias         | `ESPECIFICADO` |
|    2 | CONSENT_RECORD, CONTACT_VERIFICATION                                     | PASS y gobierno de privacidad                  | eventos/evidencias versionados por persona, finalidad/contacto, fuente y vigencia                                                      | backfill solo con evidencia de captura/verificación; retiro o corrección preserva historia                        | eventos recibidos, evidencias válidas, referencias de persona/contacto y registros no resolubles    | `ESPECIFICADO` |
|    3 | LOYALTY_LEDGER_ENTRY, redención, ajuste de puntos                        | PASS / PULSO según proceso                     | movimientos idempotentes vinculados a cuenta, regla/versión y evento origen                                                            | replay no duplica movimientos; ajustes y reversión son movimientos explícitos                                     | movimientos, puntos/unidades cuando aplique, duplicados y saldo derivado reconciliable              | `ESPECIFICADO` |
|    4 | solicitud, caso, cotización, orden, recepción, devolución de compra      | ORIGO                                          | cada objeto y línea conserva identidad, fuente, versión, timestamps y claves de proveedor/producto                                     | historia externa o manual solo se incorpora con documento/archivo fuente y mapping aprobado                       | cabeceras/líneas, cantidades/importes, estados, recepciones/devoluciones y referencias sin resolver | `ESPECIFICADO` |
|    5 | lote, LPN, existencia, movimiento, conteo, ajuste                        | NEXO / FOGO según proceso                      | movimientos, conteos y ajustes son eventos; lote/LPN conservan identidad; existencia es derivado por corte                             | backfill reconstruye desde hechos disponibles; no inventa movimientos para cuadrar existencia                     | movimientos por producto/lote/LOC, conteos, ajustes, existencia derivada y diferencias              | `ESPECIFICADO` |
|    6 | orden, lote, ejecución, consumo, merma y resultado productivo            | FOGO                                           | eventos productivos por ejecución real, versión de receta, recurso y cantidades medidas                                                | replay/backfill conserva ejecución y versión aplicable; corrección no recrea lote como nuevo                      | órdenes/lotes, consumos, salidas, mermas, resultados y balance permitido por el dominio             | `ESPECIFICADO` |
|    7 | pedido, comanda, venta, pago, caja, devolución, entrega                  | PULSO                                          | objetos comerciales separados, líneas/partes conservadas e identidad de origen/canal                                                   | importaciones históricas y correcciones preservan fuente, estado y efectos; no colapsan venta/pago/entrega        | pedidos, líneas, ventas, pagos, caja, devoluciones, entregas, importes y estados por fuente         | `ESPECIFICADO` |
|    8 | precio de venta, descuento, promoción vigente                            | PULSO; AURA solo propone intención promocional | reglas/versiones por oferta, contexto y vigencia; valor aplicado se conserva con el hecho                                              | reconstrucción usa la versión vigente en el momento histórico; no aplica precio actual retroactivamente           | reglas/versiones, vigencias y snapshots aplicados a líneas/transacciones                            | `ESPECIFICADO` |
|    9 | SERVICE_CASE, reclamo, reserva, compensación, satisfacción, comunicación | VISO, PASS o PULSO según frontera              | casos/eventos independientes con actor, tiempo, relación y estado                                                                      | backfill solo desde expedientes/evidencias; corrección no reescribe declaración original                          | casos, interacciones, decisiones, comunicaciones, compensaciones y relaciones de origen             | `ESPECIFICADO` |
|   10 | hecho económico, obligación, pago, aplicación, conciliación              | NUMERA                                         | hechos económicos separados de obligación, pago, aplicación y conciliación; moneda y entidad explícitas                                | replay idempotente; corrección/compensación no se presenta como nuevo hecho operativo                             | importes por moneda, documentos, pagos, aplicaciones, saldos y diferencias                          | `ESPECIFICADO` |
|   11 | presupuesto, forecast, escenario                                         | NUMERA                                         | artefactos versionados por periodo, escenario y alcance; no se ingieren como hechos reales                                             | backfill conserva versión aprobada disponible; una nueva versión no sobrescribe la anterior                       | versiones, líneas/coordenadas, periodos, totales y estado de aprobación                             | `ESPECIFICADO` |
|   12 | campaña, pieza publicada, oportunidad, interacción, publicación          | AURA objetivo                                  | no se habilita ingestión operativa mientras AURA continúe diferida                                                                     | no se autoriza backfill ni migración de autoridad desde fuentes no confirmadas                                    | no aplica hasta habilitación de la fuente; la futura cobertura deberá evidenciarse                  | `BLOQUEADO`    |
|   13 | ticket, incidente, problema, cambio tecnológico                          | VISO / BLOQUE Z                                | expedientes/eventos TI separados y vinculados a servicio/aplicación/endpoint/recurso                                                   | replay de eventos no duplica expediente; correcciones conservan secuencia y evidencia                             | tickets/eventos/cambios por servicio, estado, tiempos y relaciones                                  | `ESPECIFICADO` |
|   14 | PRINTER como clase de configuración, ASSET como clase de configuración   | PRINT-ARC / NEXO                               | no se ingiere como hecho analítico autónomo; se consumen las identidades y eventos de sus dominios propietarios                        | no aplica backfill de la proyección como si fuera hecho                                                           | no aplica como familia de hechos; se concilian eventos/objetos propietarios                         | `NO_APLICA`    |
|   15 | métrica, KPI, dashboard, reporte, exportación, snapshot                  | BLOQUE AB sobre fuentes propietarias           | derivados y representaciones se reconstruyen desde hechos/maestros gobernados; nunca se ingieren como autoridad de sus propias fuentes | backfill/reconstrucción mantiene corte y versiones; restatement se gobierna en `DATA-DOM-017`                     | resultado contra hechos, versión de métrica, dimensiones, filtros, corte y calidad                  | `ESPECIFICADO` |

**Reconciliación:** 15 familias esperadas; 15 materializadas; 0 faltantes; 0 duplicadas; 13 `ESPECIFICADO`; 1 `BLOQUEADO`; 1 `NO_APLICA`.

---

#### 16. Matriz de ingestión y reconciliación de los 62 objetos maestros y de referencia

Regla común: una capa analítica ingiere o proyecta el identificador canónico, la vigencia y los atributos autorizados desde la fuente lógica aprobada. No crea una copia editable, no fusiona por texto y no reemplaza la autoridad del dominio.

|    # | Objeto                        | Fuente lógica aprobada                                       | Decisión de ingestión / reconciliación                                                                                         | Estado         |
| ---: | ----------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------ | -------------- |
|    1 | `ORGANIZATION_SCOPE`          | VISO                                                         | consumir identidad y vigencia desde VISO; reconciliar referencias por identificador canónico y contexto organizacional         | `ESPECIFICADO` |
|    2 | `LEGAL_SUBJECT`               | VISO con evidencia externa aplicable                         | conservar autoridad interna y evidencia externa por atributo; una evidencia nueva no reemplaza historia sin decisión gobernada | `ESPECIFICADO` |
|    3 | `BRAND`                       | VISO                                                         | consumir identidad/vigencia; nombres o etiquetas externas solo se mapean, no crean otra marca                                  | `ESPECIFICADO` |
|    4 | `COMMERCIAL_ESTABLISHMENT`    | VISO con evidencia externa aplicable                         | ingerir estado empresarial y reconciliar evidencia autorizada sin convertir registro externo en autoridad total                | `ESPECIFICADO` |
|    5 | `BUSINESS_LINE`               | VISO                                                         | consumir identidad/vigencia; no inferir sede o titular desde etiqueta                                                          | `ESPECIFICADO` |
|    6 | `PHYSICAL_FACILITY`           | VISO con operación NEXO                                      | preservar identidad VISO y atributos físicos NEXO conforme a autoridad por atributo; reconciliar sin fusionar con sede         | `ESPECIFICADO` |
|    7 | `OPERATIONAL_SITE`            | VISO                                                         | consumir identidad y vigencia territorial; relaciones históricas se resuelven al tiempo del hecho                              | `ESPECIFICADO` |
|    8 | `ORGANIZATIONAL_AREA`         | VISO                                                         | consumir identidad y vigencia funcional; no sustituir zona física o estación                                                   | `ESPECIFICADO` |
|    9 | `PHYSICAL_ZONE`               | NEXO con referencia VISO                                     | consumir identidad NEXO y relaciones con instalación/sede vigentes; no inferir autoridad funcional                             | `ESPECIFICADO` |
|   10 | `WORKSTATION`                 | NEXO con contratos SHELL/AUTH-DEV cuando aplique             | consumir estación y relaciones técnicas autorizadas sin fusionarla con dispositivo o actor                                     | `ESPECIFICADO` |
|   11 | `EXTERNAL_OPERATIONAL_POINT`  | VISO con custodia NEXO                                       | preservar fuente, finalidad y vigencia; un punto externo no se promueve a sede por repetición histórica                        | `ESPECIFICADO` |
|   12 | `PERSON_IDENTITY`             | VISO                                                         | consumir identidad empresarial; datos de otras fuentes se correlacionan sin fusión automática                                  | `ESPECIFICADO` |
|   13 | `WORKER_PROFILE`              | VISO                                                         | consumir perfil y vigencia laboral; no sustituye identidad de persona                                                          | `ESPECIFICADO` |
|   14 | `EMPLOYMENT_RELATIONSHIP`     | VISO                                                         | conservar cada vínculo y vigencia; backfill no mueve hechos a otra relación por estado actual                                  | `ESPECIFICADO` |
|   15 | `CONTRACTUAL_POSITION`        | VISO                                                         | consumir referencia versionada/vigente; no derivar permisos                                                                    | `ESPECIFICADO` |
|   16 | `BASE_ROLE`                   | SHELL                                                        | consumir referencia autorizativa desde SHELL; no derivar cargo o función operativa                                             | `ESPECIFICADO` |
|   17 | `OPERATIONAL_ROLE`            | VISO con consumo del modelo de autorización                  | consumir función operativa y vigencia; correlacionar con autorización sin fusionar conceptos                                   | `ESPECIFICADO` |
|   18 | `WORK_ASSIGNMENT`             | VISO                                                         | consumir asignación y vigencia histórica por sede/área/función; no usar solo asignación actual                                 | `ESPECIFICADO` |
|   19 | `CUSTOMER_PERSON`             | PASS                                                         | consumir identidad cliente autorizada; contactos coincidentes no prueban identidad ni deduplicación                            | `ESPECIFICADO` |
|   20 | `CUSTOMER_CONTACT`            | PASS                                                         | consumir contacto con tipo, verificación, fuente y vigencia; proteger detalle y no usarlo como identidad suficiente            | `ESPECIFICADO` |
|   21 | `CUSTOMER_RELATIONSHIP`       | PASS                                                         | conservar relación por marca/alcance y vigencia; no equiparar con consentimiento                                               | `ESPECIFICADO` |
|   22 | `CUSTOMER_PROFILE`            | PASS                                                         | consumir proyección autorizada del perfil; no convertir copias analíticas en superficie de edición                             | `ESPECIFICADO` |
|   23 | `CUSTOMER_PREFERENCE`         | PASS                                                         | consumir preferencia y vigencia; no inferir autorización de marketing                                                          | `ESPECIFICADO` |
|   24 | `LOYALTY_ACCOUNT`             | PASS                                                         | consumir identidad de cuenta; saldo se deriva del ledger y no reemplaza movimientos                                            | `ESPECIFICADO` |
|   25 | `LOYALTY_PROGRAM_RULE`        | PASS                                                         | consumir regla y versión aplicable; movimientos históricos conservan la versión usada                                          | `ESPECIFICADO` |
|   26 | `PRODUCTO_MAESTRO`            | NEXO                                                         | consumir identidad maestra; importaciones externas mapean mediante crosswalk sin renombrar o fusionar por texto                | `ESPECIFICADO` |
|   27 | `VARIANTE`                    | NEXO                                                         | consumir identidad diferenciada; no colapsar con producto o presentación                                                       | `ESPECIFICADO` |
|   28 | `PRESENTACION`                | NEXO                                                         | preservar producto, cantidad, unidad, multiplicador y contexto; etiqueta externa no determina identidad                        | `ESPECIFICADO` |
|   29 | `UNIDAD_DE_MEDIDA`            | NEXO                                                         | consumir código/dimensión controlados; conversiones requieren contrato explícito y vigente                                     | `ESPECIFICADO` |
|   30 | `TAXONOMIA_TIPO_MAESTRO`      | NEXO                                                         | consumir referencia gobernada; no reclasificar hechos históricos con la etiqueta actual por defecto                            | `ESPECIFICADO` |
|   31 | `TAXONOMIA_INVENTARIO`        | NEXO                                                         | consumir referencia y vigencia; no sustituye identidad de producto o política física                                           | `ESPECIFICADO` |
|   32 | `TAXONOMIA_OPERACIONAL`       | NEXO                                                         | consumir referencia para segmentación; no alterar clasificación comercial                                                      | `ESPECIFICADO` |
|   33 | `LOC`                         | NEXO                                                         | consumir identidad de ubicación y vigencia; movimientos históricos resuelven el LOC aplicable al hecho                         | `ESPECIFICADO` |
|   34 | `ACTIVO_FISICO`               | NEXO                                                         | consumir identidad física, ubicación/condición autorizadas y vigencia; relaciones técnicas no cambian identidad                | `ESPECIFICADO` |
|   35 | `CLASE_DE_ACTIVO`             | NEXO                                                         | consumir referencia gobernada; no inferir mantenimiento o identidad por clase                                                  | `ESPECIFICADO` |
|   36 | `ESPECIFICACION_PRODUCTO`     | NEXO; FOGO para especificación productiva cuando corresponda | preservar versión/vigencia y autoridad por atributo; no reescribir recepciones/lotes pasados                                   | `ESPECIFICADO` |
|   37 | `PROVEEDOR`                   | ORIGO                                                        | consumir identidad de proveedor; datos externos originales se conservan cuando soportan conciliación                           | `ESPECIFICADO` |
|   38 | `CONTACTO_PROVEEDOR`          | ORIGO                                                        | consumir contacto separado del proveedor; coincidencia de persona/canal no fusiona proveedores                                 | `ESPECIFICADO` |
|   39 | `RELACION_PRODUCTO_PROVEEDOR` | ORIGO                                                        | consumir relación vigente; no equiparar con contrato, precio u oferta actual                                                   | `ESPECIFICADO` |
|   40 | `CONDICION_COMERCIAL`         | ORIGO                                                        | consumir versión y vigencia; órdenes/recepciones conservan snapshot de la condición aplicada                                   | `ESPECIFICADO` |
|   41 | `TAXONOMIA_COMPRA`            | ORIGO                                                        | consumir referencia gobernada; no sustituir taxonomías de producto, inventario o costo                                         | `ESPECIFICADO` |
|   42 | `RECETA`                      | FOGO                                                         | consumir identidad y versión publicada aplicable; ejecución histórica conserva la versión usada                                | `ESPECIFICADO` |
|   43 | `FAMILIA_PRODUCTIVA`          | FOGO                                                         | consumir referencia y vigencia; no sustituir categoría comercial o de inventario                                               | `ESPECIFICADO` |
|   44 | `RUTA_PRODUCTIVA`             | FOGO                                                         | consumir ruta/versionado reusable; ejecución permanece hecho separado                                                          | `ESPECIFICADO` |
|   45 | `RECURSO_PRODUCTIVO`          | FOGO con referencia NEXO cuando corresponda                  | consumir recurso funcional y correlacionar activo físico sin fusionar identidades                                              | `ESPECIFICADO` |
|   46 | `COMMERCIAL_CHANNEL`          | PULSO                                                        | consumir referencia de canal; identificadores externos se mapean sin convertir cuenta externa en canal nuevo                   | `ESPECIFICADO` |
|   47 | `CATEGORIA_COMERCIAL`         | PULSO                                                        | consumir taxonomía vigente; no cambiar stock o clasificación operativa                                                         | `ESPECIFICADO` |
|   48 | `OFERTA_COMERCIAL`            | PULSO                                                        | consumir configuración vendible versionada; hechos conservan precio/condición aplicados por contexto                           | `ESPECIFICADO` |
|   49 | `CENTRO_DE_COSTO`             | NUMERA                                                       | consumir identidad y vigencia económica; no inferir equivalencia con sede, área, marca o canal                                 | `ESPECIFICADO` |
|   50 | `MONEDA`                      | NUMERA                                                       | consumir referencia monetaria; importes siempre preservan moneda y conversiones separadas                                      | `ESPECIFICADO` |
|   51 | `PERIODO_ECONOMICO`           | NUMERA                                                       | consumir referencia y estado; no mezclar con periodos contable, fiscal u operativo                                             | `ESPECIFICADO` |
|   52 | `PERIODO_CONTABLE`            | NUMERA o sistema contable autorizado según alcance vigente   | consumir referencia desde la autoridad vigente y conservar fuente; no asumir equivalencia con periodo económico                | `ESPECIFICADO` |
|   53 | `PERIODO_FISCAL`              | NUMERA con autoridad externa aplicable                       | consumir referencia interna reconciliada con autoridad externa cuando aplique; conservar procedencia                           | `ESPECIFICADO` |
|   54 | `CLASIFICACION_ECONOMICA`     | NUMERA                                                       | consumir referencia vigente; no redefinir el hecho operativo que clasifica                                                     | `ESPECIFICADO` |
|   55 | `PERFIL_DE_MARCA`             | AURA objetivo                                                | no habilitar ingestión, backfill ni migración de autoridad hasta que AURA sea fuente operativa autorizada                      | `BLOQUEADO`    |
|   56 | `AUDIENCIA`                   | AURA objetivo                                                | no materializar audiencia desde listas paralelas; requiere fuente AURA habilitada, finalidad y consentimiento                  | `BLOQUEADO`    |
|   57 | `ACTIVO_DE_MARCA`             | AURA objetivo bajo gobierno documental                       | no migrar autoridad desde carpetas/copias sin la fuente objetivo habilitada y evidencia de derechos/vigencia                   | `BLOQUEADO`    |
|   58 | `ENDPOINT`                    | BLOQUE Z / contrato TI-DOM-002                               | consumir identidad técnica administrada; no fusionar con activo físico o dispositivo compartido                                | `ESPECIFICADO` |
|   59 | `SHARED_DEVICE`               | SHELL / contratos AUTH-DEV consumidos por BLOQUE Z           | consumir identidad lógica empresarial y vigencia; no inferir actor o endpoint                                                  | `ESPECIFICADO` |
|   60 | `NETWORK_RESOURCE`            | BLOQUE Z                                                     | consumir identidad del recurso; IP/MAC/SSID aislados no determinan identidad ni fusión                                         | `ESPECIFICADO` |
|   61 | `APPLICATION`                 | SHELL                                                        | consumir `app_code` e identidad canónica; repositorio, URL, ambiente o proveedor no sustituyen la aplicación                   | `ESPECIFICADO` |
|   62 | `TECH_SERVICE`                | BLOQUE Z / TI-DOM-001                                        | consumir referencia estable y sus identidades de servicio aprobadas; no renumerar por cambios técnicos                         | `ESPECIFICADO` |

**Reconciliación:** 62 objetos esperados; 62 materializados; 62 nombres canónicos únicos; 0 faltantes; 0 duplicados; 59 `ESPECIFICADO`; 3 `BLOQUEADO`.

La distribución base de `DATA-DOM-002` permanece intacta: 43 datos maestros y 19 datos de referencia. Esta tarea no reclasifica objetos ni modifica la decisión de dimensión compartida.

---

#### 17. Contrato observado de asistencia

La implementación vigente de `attendance-report` constituye una instancia observable de recopilación interna y proyección analítica. La función consulta mediante paginación ordenada las siguientes cuatro fuentes:

```text
scheduled_shifts
attendance_sessions
attendance_breaks
attendance_geofence_events
```

Decisiones:

1. VISO conserva la programación laboral y ANIMA los hechos de asistencia conforme a sus fronteras aprobadas;
2. `attendance-report` es consumidor/proyector y no nueva fuente de verdad;
3. cada consulta conserva el periodo solicitado, zona horaria, filtros autorizados y corte de ejecución;
4. la paginación no altera el significado y debe producir el mismo conjunto para un mismo corte estable;
5. sesiones, descansos y eventos geográficos no se fusionan con el turno programado;
6. una corrección de asistencia se resuelve en la fuente propietaria y luego se refleja en una nueva consulta o reconstrucción;
7. no se declara implementado un mecanismo histórico de backfill específico por la sola existencia del reporte;
8. la certificación de frescura, completitud y reglas DQ pertenece a `DATA-DOM-007`.

##### 17.1. Dependencias de las 14 métricas registradas

| `metric_key`        | Entradas mínimas del contrato de asistencia                               | Tratamiento                                                                       |
| ------------------- | ------------------------------------------------------------------------- | --------------------------------------------------------------------------------- |
| `scheduledShifts`   | `scheduled_shifts`                                                        | derivado; no se ingiere como fuente                                               |
| `attendedShifts`    | `scheduled_shifts` + `attendance_sessions`                                | derivado; no se ingiere como fuente                                               |
| `restDayCount`      | `scheduled_shifts`                                                        | derivado; no se ingiere como fuente                                               |
| `lateCount`         | `scheduled_shifts` + `attendance_sessions`                                | derivado; no se ingiere como fuente                                               |
| `noShowCount`       | `scheduled_shifts` + `attendance_sessions`                                | derivado; no se ingiere como fuente                                               |
| `openCount`         | `scheduled_shifts` + `attendance_sessions`                                | derivado; no se ingiere como fuente                                               |
| `missingCloseCount` | `scheduled_shifts` + `attendance_sessions`                                | derivado; certificación permanece bloqueada según `DATA-DOM-004`                  |
| `autoCloseCount`    | `attendance_sessions`                                                     | derivado; no se ingiere como fuente                                               |
| `departureCount`    | `scheduled_shifts` + `attendance_sessions` + `attendance_geofence_events` | derivado; no se ingiere como fuente                                               |
| `scheduledMinutes`  | `scheduled_shifts`                                                        | derivado; no se ingiere como fuente                                               |
| `netMinutes`        | `attendance_sessions` + `attendance_breaks`                               | derivado; no se ingiere como fuente                                               |
| `incidentCount`     | `scheduled_shifts` + `attendance_sessions` + `attendance_geofence_events` | derivado compuesto; no se ingiere como fuente                                     |
| `attendanceRate`    | `scheduledShifts` + `attendedShifts`                                      | derivado de métricas base; certificación permanece bloqueada según `DATA-DOM-004` |
| `punctualityRate`   | `attendedShifts` + `lateCount`                                            | derivado de métricas base; certificación permanece bloqueada según `DATA-DOM-004` |

**Reconciliación:** 14 claves esperadas; 14 materializadas; 14 únicas; 0 faltantes; 0 duplicadas.

---

#### 18. Contrato de importación externa controlada — Makos/POS externo

La evidencia canónica vigente describe la convivencia actual con Makos/POS externo mediante importación manual de Excel y mapeo de ítems. No existe conexión automática confirmada y esta tarea no la presume.

El contrato documental aplicable queda así:

```text
POS EXTERNO
→ EXPORTACIÓN CONTROLADA
→ EVIDENCIA / ARCHIVO ORIGINAL
→ INGESTIÓN O STAGING
→ VALIDACIÓN DE FORMATO Y COBERTURA
→ MAPEO CONTRA IDENTIDADES CANÓNICAS
→ CUARENTENA DE NO RESUELTOS
→ TRANSFORMACIÓN AL CONTRATO DE VENTA APLICABLE
→ RECONCILIACIÓN
→ CONSUMIDORES AUTORIZADOS
```

Reglas:

1. se conserva la procedencia y el archivo/payload original cuando sea necesario para auditoría y conciliación;
2. producto externo y producto canónico se relacionan mediante mapping/crosswalk aprobado; coincidencia textual no autoriza identidad;
3. una línea sin mapping válido queda en cuarentena y no genera silenciosamente inventario, fidelización o efecto financiero;
4. cantidades, subtotal, impuestos, descuentos y devoluciones conservan su semántica de origen antes de cualquier transformación;
5. un reintento del mismo archivo/lote no duplica ventas ni efectos;
6. el periodo recuperable no se inventa: `DAT-01`, `DAT-02` y `DAT-03` conservan las preguntas ya existentes sobre exportación, fecha más antigua y detalle por producto;
7. la definición técnica del adaptador, staging, backfill y corte pertenece a las tareas `INT-POS-*` aplicables;
8. la transición futura a PULSO deberá emitir el mismo contrato canónico de venta sin crear doble fuente activa para una misma venta;
9. esta tarea no ejecuta importaciones, backfills, mappings ni efectos reales.

---

#### 19. Backfill histórico por clase de fuente

| Fuente disponible                               | ¿Permite backfill?                | Condición documental                                                        | Resultado si falta evidencia                            |
| ----------------------------------------------- | --------------------------------- | --------------------------------------------------------------------------- | ------------------------------------------------------- |
| hechos internos con historia persistida         | sí                                | periodo, identidad, esquema, corte, transformación y conciliación definidos | `PENDIENTE_DE_EVIDENCIA` para la porción no demostrable |
| eventos internos con log/replay verificable     | sí                                | identidad de evento, orden/correlación y deduplicación preservados          | no se recrea el evento por inferencia                   |
| API externa con consulta histórica              | sí, si el proveedor lo permite    | versión, límites, ventana, paginación, evidencia y reconciliación           | se declara cobertura parcial o bloqueada                |
| exportación controlada                          | sí                                | archivo original, fuente, periodo, formato, mapping y cobertura             | lo no exportado no se inventa                           |
| vista/proyección actual sin historia subyacente | no por sí sola                    | requiere fuente histórica propietaria adicional                             | `BLOQUEADO` para reconstrucción histórica               |
| snapshot publicado                              | no como fuente primaria de hechos | puede servir como evidencia del resultado publicado y para comparación      | no se desagrega para inventar hechos                    |
| fuente AURA objetivo aún no operativa           | no                                | requiere habilitación canónica de AURA                                      | `BLOQUEADO`                                             |

El backfill no se considera validado hasta que la implementación posterior demuestre conteos, cobertura, idempotencia, diferencias y rollback/reconstrucción aplicables.

---

#### 20. Reglas de snapshots, modelos y reconstrucción

1. un snapshot conserva corte, contexto, dimensiones, filtros, versión de métricas y estado de calidad;
2. la ingestión de nueva información no modifica silenciosamente snapshots históricos publicados;
3. un modelo puede reconstruirse desde fuentes gobernadas sin promover el modelo a autoridad;
4. una reconstrucción conserva qué versión de transformación y qué corte fueron usados;
5. un snapshot de existencia, saldo o estado no reemplaza movimientos o ledger;
6. un dashboard no puede ser usado como fuente para completar la misma métrica que muestra;
7. `DATA-DOM-008` gobierna publicación y artefactos oficiales;
8. `DATA-DOM-017` gobierna restatements, versiones históricas y reproducibilidad de resultados reexpresados;
9. `DATA-INT-002` gobierna materialización técnica de modelos, consultas, caché y snapshots.

---

#### 21. Seguridad, privacidad y minimización

El contrato de ingestión no amplía acceso.

Reglas:

- solo se recopilan atributos necesarios para la finalidad y consumidor autorizados;
- datos personales, financieros, laborales y técnicos sensibles conservan clasificación y alcance;
- archivos externos no se convierten en exportaciones internas de acceso amplio;
- secretos, tokens o credenciales no se conservan como payload analítico por conveniencia;
- la cuarentena mantiene el mismo o mayor nivel de protección que la fuente;
- el drill-down y la evidencia requieren autorización independiente del agregado;
- la identidad del actor o proceso técnico se registra cuando corresponda, pero no sustituye al propietario funcional;
- las reglas de autorización detalladas pertenecen a `DATA-AUTH-001` a `DATA-AUTH-004`.

---

#### 22. Propiedad y segregación

```text
PROPIETARIO DEL DATO
≠
PROPIETARIO DEL CONTRATO DE INGESTIÓN
≠
IMPLEMENTADOR
≠
OPERADOR DE LA CARGA
≠
RESOLUTOR DE CUARENTENA
≠
CERTIFICADOR
≠
CONSUMIDOR
```

Esta tarea define semántica y obligaciones, no permisos técnicos.

La segregación final entre definición, administración, certificación y publicación pertenece a `DATA-AUTH-003`. La calidad y aceptación de una corrida pertenecen a `DATA-DOM-007`. La materialización técnica de ingestión e integraciones pertenece a las tareas `DATA-INT-*` y de arquitectura aplicables.

---

#### 23. Estados mínimos de una ejecución de ingestión

Sin imponer un enum físico universal, toda implementación deberá distinguir semánticamente, cuando aplique:

```text
RECIBIDA
VALIDANDO
ACEPTADA
ACEPTADA_CON_ADVERTENCIAS
CUARENTENA
RECHAZADA
PROCESADA
RECONCILIADA
FALLIDA
SUPERSEDIDA O RECONSTRUIDA
```

Una ejecución `PROCESADA` no implica `RECONCILIADA`. Una ejecución `RECONCILIADA` tampoco implica automáticamente `CERTIFICADA`.

Los nombres técnicos finales podrán variar por dominio siempre que conserven estas diferencias y no colapsen estados materiales.

---

#### 24. Manejo de fallos y reintentos

- una falla de red no se interpreta automáticamente como ausencia del dato;
- una respuesta ambigua se consulta o reconcilia antes de repetir un efecto no idempotente;
- una página repetida no duplica registros;
- una página faltante deja cobertura incompleta visible;
- una carga parcial no se publica como completa por haber terminado sin error técnico;
- una transformación fallida conserva la entrada suficiente para reejecución controlada;
- una fuente temporalmente indisponible conserva el último corte conocido con su frescura visible; no se presenta como actualización nueva;
- la recuperación técnica y continuidad de servicios se coordinan con `CAP-SCOPE-018` y las tareas posteriores correspondientes.

---

#### 25. Pendientes y handoffs con propietario documental

| Decisión fuera del alcance de esta tarea                                                        | Propietario documental                                               | Condición de salida                                                   |
| ----------------------------------------------------------------------------------------------- | -------------------------------------------------------------------- | --------------------------------------------------------------------- |
| umbrales, dimensiones críticas, reglas DQ, severidades, certificación y workflow de excepciones | `DATA-DOM-007`                                                       | antes de certificar fuentes o modelos                                 |
| restatements, versionado histórico y reproducibilidad de resultados publicados                  | `DATA-DOM-017`                                                       | antes de reexpresar resultados oficiales                              |
| materialización técnica de capa semántica, modelos, consultas, caché y snapshots                | `DATA-INT-002`                                                       | antes de crear modelos físicos compartidos                            |
| crosswalks y claves externas                                                                    | `DATA-INT-003`                                                       | antes de reconciliar identidades externas físicamente                 |
| controles de ingestión e integración física                                                     | `DATA-INT-001` a `DATA-INT-003` y tareas de integración propietarias | antes de habilitar pipelines productivos                              |
| protección por dominio, entidad, territorio y finalidad                                         | `DATA-AUTH-001`                                                      | antes de exponer o administrar detalle sensible                       |
| protección de poblaciones pequeñas, comparaciones, exportaciones y drill-down                   | `DATA-AUTH-002`                                                      | antes de habilitar consumidores sensibles                             |
| segregación entre definición, certificación, publicación y administración                       | `DATA-AUTH-003`                                                      | antes de certificar o publicar datos                                  |
| disponibilidad histórica de Makos/POS externo                                                   | `DAT-01`, `DAT-02`, `DAT-03` y tareas `INT-POS-*` aplicables         | antes de ejecutar backfill histórico de ventas                        |
| activación operativa de objetos AURA                                                            | AURA y su puerta canónica vigente                                    | antes de ingestión, backfill o migración de autoridad de esos objetos |

No queda una decisión diferida de ingestión, backfill, reconciliación o certificación sin propietario documental explícito.

---

#### 26. Cobertura de prueba canónica preexistente

El requisito DATA vigente ya protege directamente esta tarea: exige conservar contratos de origen, tiempo del hecho, tiempo de carga, granularidad, claves, versión de esquema, cobertura, duplicados, integridad referencial, datos tardíos, backfills, correcciones, cuarentena, reconciliación y linaje, y prohíbe presentar como certificado un reporte cuya fuente esté vencida, incompleta, degradada o sin reconciliar.

También permanecen vigentes los requisitos sobre identidad de maestros y preservación de valores externos originales. La tarea materializa el contrato documental que esos requisitos ya exigen y no altera su regla, prioridad, modalidad, estado, relaciones ni destino de implementación.

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** los requisitos DATA vigentes ya cubren de forma directa recopilación, contratos de origen, esquema, tiempos, cobertura, duplicados, datos tardíos, backfills, correcciones, cuarentena, reconciliación, linaje y preservación del original externo. Esta tarea materializa y especializa esas obligaciones sin introducir una familia de comportamiento independiente ni autorizar implementación física.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 27. Criterios de aceptación

1. los cuatro mecanismos de entrada aprobados —evento, API, vista y exportación controlada— tienen contrato explícito y reconciliado;
2. fuente propietaria, evidencia original, staging, transformación, proyección, snapshot y reporte permanecen conceptos distintos;
3. toda entrada declara identidad/claves, versión, cobertura, tiempos, procedencia, idempotencia y evidencia cuando apliquen;
4. cero, nulo, no aplica, desconocido, no recibido y dato pendiente no se colapsan;
5. un duplicado no se determina por similitud superficial ni autoriza fusión de maestros;
6. un reintento idempotente no crea hechos adicionales;
7. los cambios de esquema incompatibles requieren versión/mapping explícitos y no se interpretan por aproximación;
8. las transformaciones son deterministas, versionadas, reproducibles y preservan el original cuando corresponda;
9. los joins históricos usan identidad y vigencia aplicables al hecho;
10. una referencia ausente no se completa usando el maestro actual por conveniencia;
11. cuarentena y rechazo conservan razón, procedencia y evidencia;
12. un dato tardío mantiene el tiempo de ocurrencia original;
13. un backfill declara fuente, periodo, cobertura, mappings, transformación y conciliación;
14. un backfill no inventa historia ni completa huecos por aproximación;
15. replay, backfill, corrección, reconstrucción y restatement están semánticamente separados;
16. la conciliación explica aceptados, rechazados, cuarentena, duplicados, exclusiones y diferencias cuando la población esperada sea comprobable;
17. cuando la cobertura total no sea comprobable, se declara esa limitación en vez de inventar un denominador;
18. todo resultado materializado conserva linaje hasta fuente/evidencia y versiones aplicadas;
19. las 15 familias heredadas están materializadas: 15 esperadas, 15 presentes, 0 faltantes y 0 duplicadas;
20. la distribución de las 15 familias conserva 13 `ESPECIFICADO`, 1 `BLOQUEADO` y 1 `NO_APLICA`;
21. los 62 objetos maestros/referencia reciben decisión explícita de ingestión/reconciliación: 62 esperados, 62 presentes, 0 faltantes y 0 duplicados;
22. se preservan exactamente 43 datos maestros, 19 referencias y tres objetos AURA `BLOQUEADO`;
23. la ingestión de maestros no crea copias editables ni cambia la fuente lógica aprobada;
24. el contrato de asistencia conserva exactamente cuatro fuentes observadas y no convierte `attendance-report` en fuente de verdad;
25. las 14 métricas registradas quedan vinculadas a sus entradas sin ser tratadas como datos fuente;
26. no se declara implementado un backfill de asistencia no observado;
27. Makos/POS externo se trata como exportación controlada/manual conforme a la evidencia vigente y no como integración automática certificada;
28. líneas externas sin mapping válido quedan bloqueadas para efectos posteriores hasta resolución;
29. `DAT-01`, `DAT-02` y `DAT-03` continúan siendo la puerta de evidencia para cobertura histórica de Makos;
30. snapshots y modelos se reconstruyen desde fuentes gobernadas y no se editan como autoridad;
31. la certificación y umbrales DQ permanecen exclusivamente en `DATA-DOM-007`;
32. los restatements y la reproducibilidad de publicaciones permanecen en `DATA-DOM-017`;
33. la materialización física y los crosswalks permanecen en las tareas `DATA-INT-*` aplicables;
34. no se ejecuta código, DDL, DML, migración, backfill, replay, importación ni cambio de datos;
35. no se crea ni modifica ningún requisito de prueba;
36. la continuidad queda exclusivamente en `DATA-DOM-007` como siguiente tarea reservada.

---

#### 28. Continuidad

ÚLTIMA TAREA APROBADA
`DATA-DOM-005 — Definir hechos, eventos, granularidad, dimensiones, calendarios, snapshots y comparabilidad histórica`

TAREA ACTUAL APROBADA
`DATA-DOM-006 — Definir contratos de recopilación, ingestión, transformación, backfill y reconciliación`

SIGUIENTE TAREA RESERVADA
`DATA-DOM-007 — Definir calidad, certificación, frescura, completitud, unicidad, validez e integridad`


### ✅ DATA-DOM-007 — Definir calidad, certificación, frescura, completitud, unicidad, validez e integridad

**Estado:** APROBADA
**Tarea anterior:** `DATA-DOM-006 — Definir contratos de recopilación, ingestión, transformación, backfill y reconciliación` — APROBADA
**Tarea siguiente:** `DATA-DOM-008 — Definir reportes, tableros, exportaciones, suscripciones, alertas y snapshots oficiales` — RESERVADA
**Tipo de tarea:** documental; contrato canónico de calidad, certificación, frescura, completitud, unicidad, validez, consistencia, integridad, cobertura y reconciliación para datos y resultados analíticos
**Bloque:** AB — Analítica, indicadores y datos maestros
**Fase:** exclusivamente documental
**Implementación técnica:** no autorizada
**Código, DDL, DML, migraciones, backfills, replays, cambios de datos, despliegues o publicación de resultados oficiales:** no autorizados
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir el contrato común mediante el cual Vento OS determina si un dato, una fuente, una carga, un modelo o un resultado analítico es apto para un uso empresarial concreto, sin convertir una comprobación técnica exitosa en certificación y sin ocultar ausencia, degradación, atraso, cobertura parcial o diferencias de reconciliación.

La tarea cierra documentalmente la cadena de calidad que `DATA-DOM-006` dejó preparada:

```text
FUENTE / EVIDENCIA
→ INGESTIÓN Y RECONCILIACIÓN
→ EVALUACIÓN DE CALIDAD
→ ESTADO DE FRESCURA Y COBERTURA
→ DECISIÓN DE CERTIFICACIÓN POR USO + PERIODO + VERSIÓN + CORTE
→ CONSUMO O BLOQUEO CONTROLADO
```

Regla cardinal:

```text
PROCESADO
≠ RECONCILIADO
≠ EVALUADO
≠ CERTIFICADO
≠ PUBLICADO
```

La certificación es una decisión gobernada y contextual; no es una propiedad permanente de una tabla, archivo, API, vista, fuente o métrica.

---

#### 2. Resultado sustantivo

Queda materializado el contrato `DATA-DOM-007` con los siguientes resultados:

- diez dimensiones mínimas de calidad: completitud, unicidad, validez, consistencia, integridad referencial, frescura, cobertura, volumen y forma, reconciliación y estabilidad histórica;
- cinco estados canónicos de certificación: `NO EVALUADO`, `EN OBSERVACIÓN`, `CERTIFICADO`, `DEGRADADO` y `BLOQUEADO`;
- certificación acotada obligatoriamente por uso, periodo, versión, corte, fuentes/dependencias y evidencia;
- reglas de propagación que impiden certificar un resultado cuando una dependencia requerida está vencida, incompleta, degradada, bloqueada o sin reconciliar;
- separación explícita entre señal de calidad, incidencia, corrección, reconciliación, certificación y publicación;
- contrato de frescura sin inventar un SLA universal: cada fuente se evalúa contra la cadencia, ventana, vigencia o corte exigidos por su uso;
- distinción obligatoria entre cero, nulo, no aplica, desconocido, no recibido y dato pendiente;
- matriz de calidad para los cuatro mecanismos de entrada definidos en `DATA-DOM-006`;
- matriz de calidad y certificación para las 15 de 15 familias heredadas;
- matriz de calidad y certificación para los 62 de 62 objetos maestros y de referencia, preservando 43 maestros, 19 referencias y tres objetos AURA bloqueados;
- evaluación documental de las cuatro fuentes observadas del contrato de asistencia;
- evaluación de las 14 de 14 métricas de asistencia: 11 quedan `NO EVALUADO` y tres permanecen `BLOQUEADO`;
- preservación de las tres divergencias técnicas ya demostradas para `missingCloseCount`, `attendanceRate` y `punctualityRate`;
- workflow documental de excepción, degradación, bloqueo, corrección, reejecución, reconciliación y recertificación;
- cero cambios físicos y cero cambios de requisitos de prueba.

---

#### 3. Fronteras conceptuales obligatorias

```text
REGLA DE CALIDAD
≠ UMBRAL
≠ RESULTADO DE CONTROL
≠ INCIDENCIA DE CALIDAD
≠ ESTADO DE CERTIFICACIÓN
```

```text
FRESCO
≠ COMPLETO
≠ VÁLIDO
≠ RECONCILIADO
≠ CERTIFICADO
```

```text
DUPLICADO TÉCNICO
≠ DUPLICADO EMPRESARIAL
≠ FUSIÓN DE IDENTIDADES
```

```text
CERO MEDIDO
≠ NULO
≠ NO APLICA
≠ DESCONOCIDO
≠ NO RECIBIDO
≠ DATO PENDIENTE
```

```text
CERTIFICAR DEFINICIÓN
≠ CERTIFICAR FUENTE
≠ CERTIFICAR CORRIDA
≠ CERTIFICAR RESULTADO
≠ AUTORIZAR PUBLICACIÓN
```

La calidad se evalúa sobre una coordenada concreta. Una fuente puede ser apta para un uso y periodo, y no serlo para otro que requiera mayor cobertura, menor latencia, más detalle o una relación que la fuente no puede demostrar.

---

#### 4. Coordenada mínima de evaluación y certificación

Toda evaluación material deberá poder reconstruirse con, como mínimo, los componentes aplicables siguientes:

| Componente                                  | Regla canónica                                                                                  |
| ------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| objeto, fuente, corrida, modelo o resultado | identifica qué unidad se está evaluando sin convertir el nombre físico en semántica empresarial |
| uso empresarial                             | declara qué decisión, cálculo o consumo pretende soportar                                       |
| periodo o ventana                           | limita la población temporal evaluada                                                           |
| fecha y hora de corte                       | fija hasta qué información debía estar incorporada                                              |
| versión semántica                           | identifica la definición de dato o métrica aplicable                                            |
| versión de esquema/contrato                 | identifica la forma de entrada utilizada                                                        |
| versión de transformación                   | identifica las reglas que produjeron el derivado cuando aplica                                  |
| población esperada                          | permite medir cobertura cuando puede conocerse sin inventar denominadores                       |
| dimensiones críticas                        | identifica qué controles deben cumplirse para ese uso                                           |
| fuentes y dependencias                      | permite propagar degradaciones y bloqueos                                                       |
| resultado de reconciliación                 | demuestra diferencias frente al origen cuando corresponde                                       |
| evidencia                                   | conserva conteos, controles, incidencias y decisión que sustentan el estado                     |
| propietario y steward                       | conservan responsabilidad funcional y resolución                                                |
| certificador autorizado                     | emite la decisión de certificación bajo la segregación aplicable                                |

La ausencia de cualquiera de estos componentes solo es aceptable cuando el componente no aplica al contrato. No se sustituye un componente desconocido por un valor supuesto.

---

#### 5. Dimensiones mínimas de calidad

| Dimensión              | Pregunta que debe responder                                                                               | Regla de evaluación                                                                              | Consecuencia si falla                                                                           |
| ---------------------- | --------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------- |
| completitud            | ¿están presentes los campos, relaciones o unidades exigidos por el uso?                                   | separar completitud de atributos, relaciones y población; no confundir ausencia con cero         | degradar o bloquear según criticidad del elemento faltante                                      |
| unicidad               | ¿una identidad o coordenada que debe ser única aparece una sola vez?                                      | aplicar la clave y el alcance aprobados; similitud textual no prueba duplicidad                  | bloquear cuando comprometa identidad o doble conteo; observar/degradar en otros casos según uso |
| validez                | ¿el valor cumple dominio, formato, estado, rango o regla empresarial aplicable?                           | validar contra contrato y versión vigentes; no corregir silenciosamente para aprobar             | degradar, bloquear o cuarentenar según impacto                                                  |
| consistencia           | ¿valores relacionados pueden coexistir sin contradicción material?                                        | comparar reglas entre atributos, fuentes y representaciones sin convertir una copia en autoridad | degradar o bloquear cuando la contradicción afecte el uso                                       |
| integridad referencial | ¿las referencias resuelven identidades válidas en el tiempo y contexto correctos?                         | no crear referencias genéricas ni resolver por parecido para ocultar faltantes                   | bloquear el uso dependiente o mantener el registro fuera de materialización                     |
| frescura               | ¿el dato está actualizado hasta el corte exigido por el uso?                                              | medir contra cadencia, ventana, vigencia o expectativa del contrato concreto                     | no certificar como actual cuando el corte requerido no esté cubierto                            |
| cobertura              | ¿la población incluida representa el universo declarado para el uso?                                      | usar denominador real solo cuando sea demostrable; declarar cobertura parcial cuando no lo sea   | degradar o bloquear comparaciones/decisiones que exijan población completa                      |
| volumen y forma        | ¿conteos, distribución estructural y forma del lote/modelo son compatibles con lo esperado?               | detectar cambios materiales sin asumir que una variación estadística implica error por sí sola   | observar, degradar o bloquear según evidencia y contrato                                        |
| reconciliación         | ¿origen, aceptados, rechazados, cuarentena, duplicados, exclusiones y resultado explican las diferencias? | conservar diferencias visibles; no modificar datos para forzar igualdad                          | impedir certificación cuando una diferencia material permanezca sin resolver                    |
| estabilidad histórica  | ¿la misma versión y corte puede reproducirse sin reescritura silenciosa?                                  | preservar hechos, vigencias, versiones, correcciones y restatements                              | bloquear certificación histórica cuando no pueda explicarse la variación                        |

Los invariantes exactos pueden ser de tolerancia cero cuando el contrato los exige, por ejemplo una identidad canónica duplicada dentro de su alcance. Los umbrales variables de frescura, volumen o tolerancia no se fijan universalmente sin evidencia histórica y una necesidad de uso concreta.

---

#### 6. Estados canónicos de certificación

| Estado           | Semántica                                                                                                                               | Uso permitido                                                                                      |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- |
| `NO EVALUADO`    | no existe evidencia suficiente de evaluación para la coordenada solicitada                                                              | no presentar como certificado; puede existir uso operativo sujeto a sus reglas propietarias        |
| `EN OBSERVACIÓN` | existen señales o controles bajo seguimiento que todavía no justifican degradación o bloqueo                                            | uso condicionado a la finalidad y con estado visible; no equivale a certificado                    |
| `CERTIFICADO`    | los controles críticos aplicables están satisfechos para el uso, periodo, versión y corte declarados y existe evidencia reproducible    | puede consumirse como certificado dentro de esa coordenada; no extiende certificación a otros usos |
| `DEGRADADO`      | existe una limitación conocida que reduce calidad, cobertura o frescura, pero el uso concreto puede continuar con advertencia explícita | uso solo si el contrato de decisión admite la degradación; no puede presentarse como certificado   |
| `BLOQUEADO`      | una falla crítica, dependencia bloqueada o ausencia de evidencia esencial impide el uso certificado                                     | no publicar ni consumir como resultado certificado para el uso afectado                            |

`NO_APLICA` permanece como decisión de alcance de objetos o familias heredadas y no se incorpora como sexto estado de certificación.

Reglas:

1. `CERTIFICADO` se otorga únicamente para un uso, periodo, versión y corte concretos;
2. una certificación anterior no certifica automáticamente una corrida, periodo o versión posterior;
3. una fuente degradada puede permanecer visible con advertencia únicamente cuando la decisión y la finalidad lo permiten;
4. una dependencia requerida `BLOQUEADO` impide certificar el resultado dependiente;
5. una dependencia requerida vencida, incompleta, degradada o sin reconciliar impide que el resultado sea `CERTIFICADO`;
6. un reporte oficial no puede usar una etiqueta de certificación que contradiga el peor estado material de sus dependencias críticas;
7. la autorización para certificar y publicar se gobierna separadamente en `DATA-AUTH-003`;
8. la publicación de reportes, tableros, exportaciones, alertas, suscripciones y snapshots oficiales pertenece a `DATA-DOM-008`.

---

#### 7. Puerta canónica para `CERTIFICADO`

Un resultado solo puede adoptar `CERTIFICADO` cuando existe evidencia suficiente para demostrar, en la coordenada evaluada:

1. definición y versión identificadas;
2. fuente o fuentes propietarias identificadas;
3. corte y periodo explícitos;
4. controles críticos de calidad definidos y ejecutables;
5. frescura compatible con el uso;
6. completitud y cobertura suficientes para la población declarada;
7. unicidad, validez, consistencia e integridad referencial satisfechas en los controles críticos;
8. reconciliación cerrada o diferencias materialmente explicadas y aceptadas bajo el contrato;
9. linaje hacia fuente/evidencia y versiones aplicadas;
10. ausencia de una incidencia bloqueante abierta para el uso;
11. decisión emitida por la función autorizada para certificar;
12. evidencia retenida de la evaluación y de cualquier excepción aceptada.

Completar técnicamente una consulta, carga o job no satisface por sí mismo esta puerta.

---

#### 8. Frescura, vigencia y atraso

La frescura se determina contra el contrato del uso, no contra un número universal de minutos u horas.

| Clase de origen                 | Referencia mínima de frescura                                                                   | Regla                                                                         |
| ------------------------------- | ----------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| evento                          | ocurrencia, recepción y último evento esperado dentro de la ventana                             | distinguir atraso de origen, transporte y procesamiento                       |
| API                             | instante de consulta/corte, ventana solicitada y última información confirmada por el proveedor | una respuesta exitosa no demuestra que la fuente esté actualizada             |
| vista                           | corte de las fuentes subyacentes y versión de la definición                                     | la vista hereda la frescura de sus dependencias; no crea frescura propia      |
| exportación controlada          | fecha/corte cubierto por el archivo, momento de recepción y cobertura declarada                 | importar hoy un archivo antiguo no lo convierte en dato fresco                |
| maestro o referencia versionada | vigencia efectiva y última decisión válida requerida por el uso                                 | no exigir actualización por reloj cuando no ha ocurrido un cambio empresarial |
| snapshot                        | corte explícito de publicación                                                                  | un snapshot histórico puede ser íntegro y válido sin ser “actual”             |

Se conservan por separado ocurrencia, fecha empresarial, recepción, procesamiento, corrección, reconciliación y corte. Un dato tardío no se vuelve fresco cambiando su fecha de ocurrencia.

Cuando una fuente está temporalmente indisponible, el último corte conocido puede mostrarse únicamente con su antigüedad y estado real; no se presenta como actualización nueva.

---

#### 9. Completitud, cobertura y estados de ausencia

La completitud tiene tres planos que no se sustituyen entre sí:

- **atributos requeridos:** presencia de valores obligatorios para el uso;
- **relaciones requeridas:** referencias necesarias para interpretar o unir correctamente el dato;
- **población esperada:** unidades, registros, eventos o periodos que debían estar cubiertos.

Reglas:

1. no se calcula un porcentaje de cobertura cuando no existe un denominador demostrable;
2. una población parcialmente observable se declara parcial en vez de asumir 100 %;
3. `0` es un valor medido y no sustituye `NO RECIBIDO`;
4. `NULO` conserva su semántica contractual y no se convierte automáticamente en `0`, cadena vacía o “no aplica”;
5. `DESCONOCIDO` significa que el valor no puede determinarse con la evidencia disponible;
6. `DATO PENDIENTE` indica que el proceso espera una resolución, referencia o llegada todavía abierta;
7. `NO APLICA` excluye el dato por semántica del caso y no constituye un faltante;
8. la calidad de un agregado no puede ocultar que parte de la población quedó fuera del cálculo.

---

#### 10. Unicidad, validez, consistencia e integridad referencial

##### 10.1. Unicidad

- se evalúa con la identidad, clave y alcance definidos por `DATA-DOM-003`;
- dos valores visibles iguales no son automáticamente un duplicado;
- una misma identidad recibida dos veces con el mismo contenido se trata mediante idempotencia de `DATA-DOM-006`;
- una identidad con contenidos materialmente incompatibles abre conflicto; no se resuelve con sobrescritura silenciosa;
- la detección de posible duplicidad no autoriza fusión de maestros.

##### 10.2. Validez

- se evalúan tipo, dominio, formato, estado, rango, combinación y versión conforme al contrato;
- un valor inválido no se corrige únicamente para superar el control;
- una transformación correctiva exige la autoridad y trazabilidad definidas por el dominio.

##### 10.3. Consistencia

- relaciones entre atributos, estados, tiempos y representaciones deben poder coexistir sin contradicción material;
- una copia analítica no prevalece sobre la fuente por ser más reciente;
- divergencias entre fuentes se resuelven según la autoridad por atributo definida en `DATA-DOM-001`.

##### 10.4. Integridad referencial

- toda referencia crítica debe resolver una identidad canónica válida para el tiempo y contexto del hecho;
- una clave externa no resuelta no se fuerza por similitud textual;
- una relación histórica no se completa usando el maestro actual por defecto;
- las referencias pendientes pueden permanecer en cuarentena o impedir materialización según el contrato de `DATA-DOM-006`.

---

#### 11. Severidad material y consecuencia de uso

La tarea no crea un enum técnico universal de severidad. Toda incidencia debe declarar el impacto real sobre la decisión y terminar en una consecuencia explícita:

| Consecuencia | Criterio                                                                                                                        | Estado de certificación compatible                                                |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- |
| observación  | señal sin evidencia de que el uso declarado quede materialmente comprometido                                                    | `EN OBSERVACIÓN` o conservar `NO EVALUADO` mientras no exista evaluación completa |
| degradación  | limitación conocida de frescura, cobertura, completitud u otra dimensión que permite un uso restringido y advertido             | `DEGRADADO`                                                                       |
| bloqueo      | falla que compromete identidad, referencia crítica, población requerida, reconciliación, semántica, fuente o evidencia esencial | `BLOQUEADO`                                                                       |

La misma incidencia puede ser bloqueante para un reporte oficial y degradante para una exploración interna si el contrato de uso lo declara y la autorización lo permite. La decisión debe conservar el uso afectado; no se asigna severidad global por comodidad.

---

#### 12. Propagación de calidad hacia derivados

1. una métrica hereda las limitaciones materiales de sus fuentes obligatorias;
2. una vista hereda la frescura y calidad de las fuentes subyacentes;
3. un agregado no puede mejorar por sí solo el estado de un hecho defectuoso;
4. excluir registros defectuosos solo es válido cuando la definición lo permite y la exclusión queda visible en cobertura;
5. una fuente `BLOQUEADO` requerida produce un resultado no certificable;
6. una fuente `DEGRADADO` requerida impide `CERTIFICADO` salvo que el dato degradado esté fuera de la población necesaria por definición demostrable;
7. un resultado con reconciliación abierta no es `CERTIFICADO`;
8. una corrección o backfill obliga a reevaluar los resultados afectados; no hereda automáticamente una certificación anterior;
9. un restatement conserva la relación con la publicación anterior bajo `DATA-DOM-017`;
10. `DATA-DOM-008` deberá exponer el estado real de calidad/frescura/corte en los artefactos oficiales que materialice.

---

#### 13. Matriz de calidad por mecanismo de entrada

| Mecanismo              | Controles críticos                                                                                           | Frescura / cobertura                                                      | Estado documental                                                                         |
| ---------------------- | ------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| Evento                 | identidad/correlación; versión; orden o relación temporal cuando aplique; idempotencia; referencias críticas | ventana de ocurrencia y recepción; eventos esperados o límites conocidos  | `ESPECIFICADO`; certificación de cada corrida/uso permanece `NO EVALUADO` hasta evidencia |
| API                    | contrato/versión; parámetros; respuesta; paginación; claves; integridad; errores parciales                   | corte solicitado, cobertura del proveedor y última información confirmada | `ESPECIFICADO`; certificación contextual permanece `NO EVALUADO` hasta evidencia          |
| Vista                  | definición/versionado; dependencias; filtros; grano; joins; integridad y reconciliación                      | hereda corte y cobertura de dependencias                                  | `ESPECIFICADO`; no puede certificarse por separado de sus fuentes                         |
| Exportación controlada | archivo/payload original; formato; versión; hash o evidencia equivalente; mappings; duplicados; cuarentena   | periodo/corte cubierto por el archivo y población exportada               | `ESPECIFICADO`; importación no implica certificación                                      |

**Reconciliación:** 4 mecanismos esperados; 4 materializados; 0 faltantes; 0 duplicados.

---

#### 14. Matriz de calidad y certificación de las 15 familias heredadas

|    # | Familia heredada                                                         | Fuente propietaria                             | Controles DQ críticos                                                                                                | Referencia de frescura                                      | Estado heredado `DATA-DOM-006` | Resultado DQ / certificación base |
| ---: | ------------------------------------------------------------------------ | ---------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------- | ------------------------------ | --------------------------------- |
|    1 | SHIFT, ATTENDANCE_EVENT, ATTENDANCE_CORRECTION                           | VISO / ANIMA según proceso                     | completitud de turnos/eventos; unicidad de identidad; correspondencia turno-sesión; tiempos y correcciones trazables | corte del periodo laboral y llegada de hechos de asistencia | `ESPECIFICADO`                 | `NO EVALUADO`                     |
|    2 | CONSENT_RECORD, CONTACT_VERIFICATION                                     | PASS y gobierno de privacidad                  | evidencia/versión/finalidad; referencia a persona/contacto; vigencia y retiro                                        | vigencia de consentimiento/verificación y corte del uso     | `ESPECIFICADO`                 | `NO EVALUADO`                     |
|    3 | LOYALTY_LEDGER_ENTRY, redención, ajuste de puntos                        | PASS / PULSO según proceso                     | unicidad/idempotencia del movimiento; cuenta y regla válidas; saldo reconciliable                                    | corte del ledger y vigencia/expiración aplicable            | `ESPECIFICADO`                 | `NO EVALUADO`                     |
|    4 | solicitud, caso, cotización, orden, recepción, devolución de compra      | ORIGO                                          | identidad de cabecera/línea; referencias proveedor/producto; cantidades/importes/estados válidos; reconciliación     | corte del proceso de compra y vigencias comerciales         | `ESPECIFICADO`                 | `NO EVALUADO`                     |
|    5 | lote, LPN, existencia, movimiento, conteo, ajuste                        | NEXO / FOGO según proceso                      | identidades de lote/LPN; integridad producto-LOC; movimientos/conteos/ajustes reconciliables; existencia derivable   | corte de inventario y tiempos de movimiento/conteo          | `ESPECIFICADO`                 | `NO EVALUADO`                     |
|    6 | orden, lote, ejecución, consumo, merma y resultado productivo            | FOGO                                           | referencias a receta/versión/recursos; cantidades válidas; balance/reconciliación según contrato                     | corte de ejecución y versión realmente usada                | `ESPECIFICADO`                 | `NO EVALUADO`                     |
|    7 | pedido, comanda, venta, pago, caja, devolución, entrega                  | PULSO                                          | identidades separadas; líneas/partes monetarias; referencias; totales y estados reconciliables                       | corte comercial propio de cada hecho                        | `ESPECIFICADO`                 | `NO EVALUADO`                     |
|    8 | precio de venta, descuento, promoción vigente                            | PULSO; AURA solo propone intención promocional | versión/vigencia; contexto/oferta; valor aplicado consistente con el hecho                                           | vigencia de la regla y momento de aplicación                | `ESPECIFICADO`                 | `NO EVALUADO`                     |
|    9 | SERVICE_CASE, reclamo, reserva, compensación, satisfacción, comunicación | VISO, PASS o PULSO según frontera              | identidad de caso/evento; actor/relación; tiempos/estados; evidencia de decisiones/comunicaciones                    | corte y vigencia del caso/reserva                           | `ESPECIFICADO`                 | `NO EVALUADO`                     |
|   10 | hecho económico, obligación, pago, aplicación, conciliación              | NUMERA                                         | identidades y monedas; referencias; importes; aplicaciones y saldos reconciliables                                   | corte económico/contable aplicable                          | `ESPECIFICADO`                 | `NO EVALUADO`                     |
|   11 | presupuesto, forecast, escenario                                         | NUMERA                                         | versión/periodo/escenario; coordenadas dimensionales; totales y estado de aprobación                                 | vigencia y fecha de aprobación/generación                   | `ESPECIFICADO`                 | `NO EVALUADO`                     |
|   12 | campaña, pieza publicada, oportunidad, interacción, publicación          | AURA objetivo                                  | no existe fuente operativa AURA habilitada; no certificar desde fuentes paralelas                                    | sin fuente operativa vigente                                | `BLOQUEADO`                    | `BLOQUEADO`                       |
|   13 | ticket, incidente, problema, cambio tecnológico                          | VISO / BLOQUE Z                                | identidades separadas; servicio/recurso válido; secuencia de estado y tiempos; evidencia de cierre                   | corte del expediente/evento TI                              | `ESPECIFICADO`                 | `NO EVALUADO`                     |
|   14 | PRINTER como clase de configuración, ASSET como clase de configuración   | PRINT-ARC / NEXO                               | no constituye familia de hecho autónoma; evaluar los objetos/eventos propietarios                                    | vigencia de los objetos propietarios                        | `NO_APLICA`                    | `NO_APLICA`                       |
|   15 | métrica, KPI, dashboard, reporte, exportación, snapshot                  | BLOQUE AB sobre fuentes propietarias           | versión de métrica; fuentes; corte; dimensiones/filtros; calidad de dependencias; reconciliación y linaje            | corte analítico y versiones consumidas                      | `ESPECIFICADO`                 | `NO EVALUADO`                     |

**Reconciliación:** 15 familias esperadas; 15 materializadas; 0 faltantes; 0 duplicadas. Se preserva la distribución heredada de `DATA-DOM-006`: 13 `ESPECIFICADO`, 1 `BLOQUEADO` y 1 `NO_APLICA`. En la coordenada DQ/certificación, las 13 familias especificadas quedan `NO EVALUADO`, la familia AURA permanece `BLOQUEADO` y la proyección PRINTER/ASSET conserva `NO_APLICA` porque no es una familia de hecho autónoma.

---

#### 15. Matriz materializada de calidad para los 62 objetos maestros y de referencia

La certificación base es una coordenada distinta del estado documental `ESPECIFICADO` de las tareas anteriores. Un objeto puede estar completamente definido documentalmente y seguir `NO EVALUADO` respecto de evidencia de calidad operativa.

|    # | Objeto canónico               | Clase heredada    | Controles DQ críticos                                                                       | Frescura / vigencia                               | Estado heredado `DATA-DOM-006` | Certificación base |
| ---: | ----------------------------- | ----------------- | ------------------------------------------------------------------------------------------- | ------------------------------------------------- | ------------------------------ | ------------------ |
|    1 | `ORGANIZATION_SCOPE`          | `DATO_MAESTRO`    | identidad única; vigencia; alcance y relaciones organizacionales válidas                    | vigencia aplicable al uso y al corte              | `ESPECIFICADO`                 | `NO EVALUADO`      |
|    2 | `LEGAL_SUBJECT`               | `DATO_MAESTRO`    | identidad única; forma oficial y procedencia; relaciones juridicas válidas                  | vigencia registral/empresarial aplicable al corte | `ESPECIFICADO`                 | `NO EVALUADO`      |
|    3 | `BRAND`                       | `DATO_MAESTRO`    | identidad única; nombre/alias gobernados; relaciones vigentes                               | vigencia de la identidad y relaciones de marca    | `ESPECIFICADO`                 | `NO EVALUADO`      |
|    4 | `COMMERCIAL_ESTABLISHMENT`    | `DATO_MAESTRO`    | identidad única; relación con sujeto/sede; estado y evidencia autorizada                    | vigencia operativa y registral aplicable          | `ESPECIFICADO`                 | `NO EVALUADO`      |
|    5 | `BUSINESS_LINE`               | `DATO_MAESTRO`    | identidad única; pertenencia organizacional; jerarquía vigente                              | vigencia empresarial aplicable al corte           | `ESPECIFICADO`                 | `NO EVALUADO`      |
|    6 | `PHYSICAL_FACILITY`           | `DATO_MAESTRO`    | identidad única; relación física con sede/zonas; referencias válidas                        | vigencia de la instalacion y sus relaciones       | `ESPECIFICADO`                 | `NO EVALUADO`      |
|    7 | `OPERATIONAL_SITE`            | `DATO_MAESTRO`    | identidad única; alcance territorial; relaciones organizacionales válidas                   | vigencia operativa de la sede                     | `ESPECIFICADO`                 | `NO EVALUADO`      |
|    8 | `ORGANIZATIONAL_AREA`         | `DATO_MAESTRO`    | identidad única; jerarquía válida; relaciones sin ambigüedad temporal                       | vigencia de área y parentaje                      | `ESPECIFICADO`                 | `NO EVALUADO`      |
|    9 | `PHYSICAL_ZONE`               | `DATO_MAESTRO`    | identidad única; contención física válida; relación con instalacion/sede                    | vigencia de zona y contención                     | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   10 | `WORKSTATION`                 | `DATO_MAESTRO`    | identidad única; ubicacion y relaciones técnicas válidas; no fusion con dispositivo         | vigencia de estacion y asignaciones               | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   11 | `EXTERNAL_OPERATIONAL_POINT`  | `DATO_MAESTRO`    | identidad única; fuente/finalidad; relación territorial y vigencia                          | vigencia del punto externo autorizado             | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   12 | `PERSON_IDENTITY`             | `DATO_MAESTRO`    | identidad canónica única; referencias consistentes; no deduplicar por nombre/contacto       | vigencia de identidad y relaciones empresariales  | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   13 | `WORKER_PROFILE`              | `DATO_MAESTRO`    | referencia válida a persona; atributos laborales coherentes; vigencia                       | vigencia del perfil laboral                       | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   14 | `EMPLOYMENT_RELATIONSHIP`     | `DATO_MAESTRO`    | identidad de vinculo; persona válida; intervalos/vigencias coherentes                       | vigencia exacta del vinculo                       | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   15 | `CONTRACTUAL_POSITION`        | `DATO_REFERENCIA` | código/identidad únicos en su alcance; definición y vigencia                                | vigencia de la referencia contractual             | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   16 | `BASE_ROLE`                   | `DATO_REFERENCIA` | identidad de rol estable; código único; relaciones autorizativas consistentes               | vigencia de la referencia de rol                  | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   17 | `OPERATIONAL_ROLE`            | `DATO_REFERENCIA` | identidad estable; definición operacional; vigencia y relaciones válidas                    | vigencia de la función operativa                  | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   18 | `WORK_ASSIGNMENT`             | `DATO_MAESTRO`    | referencias válidas a trabajador/sede/área/función; intervalos coherentes                   | vigencia exacta de la asignacion                  | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   19 | `CUSTOMER_PERSON`             | `DATO_MAESTRO`    | identidad cliente única; referencias consistentes; contacto no prueba identidad             | vigencia de identidad/relaciones cliente          | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   20 | `CUSTOMER_CONTACT`            | `DATO_MAESTRO`    | tipo/formato/fuente/verificación coherentes; referencia válida a cliente                    | vigencia y última verificación aplicable          | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   21 | `CUSTOMER_RELATIONSHIP`       | `DATO_MAESTRO`    | referencias válidas; alcance/marca; vigencia sin inferir consentimiento                     | vigencia de la relación                           | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   22 | `CUSTOMER_PROFILE`            | `DATO_MAESTRO`    | referencia válida a cliente; atributos autorizados; consistencia con versión/fuente         | vigencia de la proyección autorizada              | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   23 | `CUSTOMER_PREFERENCE`         | `DATO_MAESTRO`    | referencia válida; finalidad/fuente; valor y vigencia interpretables                        | vigencia de la preferencia                        | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   24 | `LOYALTY_ACCOUNT`             | `DATO_MAESTRO`    | identidad única; cliente/programa válidos; saldo reconciliable con ledger                   | vigencia de cuenta; corte del saldo derivado      | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   25 | `LOYALTY_PROGRAM_RULE`        | `DATO_REFERENCIA` | identidad/versión única; reglas válidas; vigencias no ambiguas                              | vigencia de la versión de regla                   | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   26 | `PRODUCTO_MAESTRO`            | `DATO_MAESTRO`    | identidad única; códigos gobernados; taxonomias y relaciones válidas                        | vigencia del producto y atributos maestros        | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   27 | `VARIANTE`                    | `DATO_MAESTRO`    | identidad única; referencia válida a producto; atributos diferenciadores consistentes       | vigencia de variante y configuración              | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   28 | `PRESENTACION`                | `DATO_MAESTRO`    | identidad única; producto, cantidad, unidad, multiplicador y contexto válidos               | vigencia de presentacion y equivalencias          | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   29 | `UNIDAD_DE_MEDIDA`            | `DATO_REFERENCIA` | código único; dimensión/semántica válidas; conversiones gobernadas                          | vigencia de código y conversion aplicable         | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   30 | `TAXONOMIA_TIPO_MAESTRO`      | `DATO_REFERENCIA` | código único; jerarquía/relaciones válidas; vigencia                                        | vigencia de clasificación                         | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   31 | `TAXONOMIA_INVENTARIO`        | `DATO_REFERENCIA` | código único; jerarquía/relaciones válidas; vigencia                                        | vigencia de clasificación de inventario           | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   32 | `TAXONOMIA_OPERACIONAL`       | `DATO_REFERENCIA` | código único; jerarquía/relaciones válidas; vigencia                                        | vigencia de clasificación operacional             | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   33 | `LOC`                         | `DATO_MAESTRO`    | identidad única; tipo/relaciones de ubicacion válidas; jerarquía consistente                | vigencia de LOC y relaciones físicas              | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   34 | `ACTIVO_FISICO`               | `DATO_MAESTRO`    | identidad única; clase/ubicacion/custodia válidas; serie no sustituye identidad             | vigencia del activo y relaciones                  | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   35 | `CLASE_DE_ACTIVO`             | `DATO_REFERENCIA` | código/identidad únicos; definición válida; vigencia                                        | vigencia de clase de activo                       | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   36 | `ESPECIFICACION_PRODUCTO`     | `DATO_MAESTRO`    | identidad/versión; producto válido; atributos y autoridad por atributo coherentes           | vigencia de especificacion/versión                | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   37 | `PROVEEDOR`                   | `DATO_MAESTRO`    | identidad única; forma oficial/procedencia; referencias comerciales válidas                 | vigencia del proveedor y estado comercial         | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   38 | `CONTACTO_PROVEEDOR`          | `DATO_MAESTRO`    | referencia válida a proveedor; canal/formato/fuente; vigencia                               | vigencia del contacto                             | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   39 | `RELACION_PRODUCTO_PROVEEDOR` | `DATO_MAESTRO`    | proveedor/producto válidos; contexto y vigencia; duplicidad por coordenada                  | vigencia de la relación comercial                 | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   40 | `CONDICION_COMERCIAL`         | `DATO_MAESTRO`    | identidad/versión; proveedor/contexto válidos; valores y vigencia coherentes                | vigencia de la condicion aplicada                 | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   41 | `TAXONOMIA_COMPRA`            | `DATO_REFERENCIA` | código único; jerarquía/relación válida; vigencia                                           | vigencia de clasificación de compra               | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   42 | `RECETA`                      | `DATO_MAESTRO`    | identidad/versión; referencias a insumos/recursos válidas; consistencia de vigencia         | vigencia de versión de receta                     | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   43 | `FAMILIA_PRODUCTIVA`          | `DATO_REFERENCIA` | código/identidad únicos; definición y relaciones válidas                                    | vigencia de familia productiva                    | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   44 | `RUTA_PRODUCTIVA`             | `DATO_MAESTRO`    | identidad/versión; secuencia/recursos referenciados válidos                                 | vigencia de versión de ruta                       | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   45 | `RECURSO_PRODUCTIVO`          | `DATO_MAESTRO`    | identidad única; relación funcional/física válida; estado/vigencia coherentes               | vigencia del recurso productivo                   | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   46 | `COMMERCIAL_CHANNEL`          | `DATO_REFERENCIA` | código/identidad únicos; definición y alcance válidos                                       | vigencia del canal                                | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   47 | `CATEGORIA_COMERCIAL`         | `DATO_REFERENCIA` | código único; jerarquía/relaciones válidas; vigencia                                        | vigencia de categoria comercial                   | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   48 | `OFERTA_COMERCIAL`            | `DATO_MAESTRO`    | identidad/versión; producto/canal/contexto válidos; vigencia                                | vigencia de oferta/versión                        | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   49 | `CENTRO_DE_COSTO`             | `DATO_MAESTRO`    | identidad/código únicos; relaciones económicas válidas; vigencia                            | vigencia del centro de costo                      | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   50 | `MONEDA`                      | `DATO_REFERENCIA` | código único; definición monetaria válida; no mezclar conversion con identidad              | vigencia de referencia monetaria                  | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   51 | `PERIODO_ECONOMICO`           | `DATO_REFERENCIA` | identidad única; limites temporales válidos; estado coherente                               | vigencia y estado del periodo económico           | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   52 | `PERIODO_CONTABLE`            | `DATO_REFERENCIA` | identidad única; limites/cierre/reapertura coherentes; autoridad válida                     | vigencia y estado del periodo contable            | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   53 | `PERIODO_FISCAL`              | `DATO_REFERENCIA` | identidad única; limites y autoridad fiscal coherentes                                      | vigencia y estado del periodo fiscal              | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   54 | `CLASIFICACION_ECONOMICA`     | `DATO_REFERENCIA` | código único; jerarquía/relaciones válidas; vigencia                                        | vigencia de clasificación económica               | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   55 | `PERFIL_DE_MARCA`             | `DATO_MAESTRO`    | fuente operativa AURA no habilitada; no certificar desde copias paralelas                   | sin fuente operativa vigente                      | `BLOQUEADO`                    | `BLOQUEADO`        |
|   56 | `AUDIENCIA`                   | `DATO_MAESTRO`    | fuente AURA, finalidad y consentimiento requeridos; no materializar listas paralelas        | sin fuente operativa vigente                      | `BLOQUEADO`                    | `BLOQUEADO`        |
|   57 | `ACTIVO_DE_MARCA`             | `DATO_MAESTRO`    | fuente AURA y evidencia de derechos/vigencia requeridas                                     | sin fuente operativa vigente                      | `BLOQUEADO`                    | `BLOQUEADO`        |
|   58 | `ENDPOINT`                    | `DATO_MAESTRO`    | identidad técnica estable; activo/estado/relaciones válidas; IP/MAC no sustituyen identidad | vigencia técnica del endpoint                     | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   59 | `SHARED_DEVICE`               | `DATO_MAESTRO`    | identidad lógica estable; relaciones de sede/estacion/uso válidas                           | vigencia de dispositivo y asignaciones            | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   60 | `NETWORK_RESOURCE`            | `DATO_MAESTRO`    | identidad estable; tipo/relaciones válidas; IP/MAC/SSID no prueban identidad                | vigencia de recurso y configuración               | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   61 | `APPLICATION`                 | `DATO_MAESTRO`    | identidad canónica y app_code coherentes; ambiente/repositorio no sustituyen identidad      | vigencia de aplicación/contrato                   | `ESPECIFICADO`                 | `NO EVALUADO`      |
|   62 | `TECH_SERVICE`                | `DATO_REFERENCIA` | identidad TI-SERVICE estable; relaciones a aplicaciones/recursos válidas                    | vigencia del servicio tecnológico                 | `ESPECIFICADO`                 | `NO EVALUADO`      |

**Reconciliación del inventario:**

| Control                                 | Resultado |
| --------------------------------------- | --------: |
| Objetos esperados                       |    **62** |
| Objetos materializados                  |    **62** |
| Identificadores canónicos únicos        |    **62** |
| Faltantes                               |     **0** |
| Duplicados                              |     **0** |
| Datos maestros preservados              |    **43** |
| Datos de referencia preservados         |    **19** |
| Estado heredado `ESPECIFICADO`          |    **59** |
| Estado heredado `BLOQUEADO`             |     **3** |
| Certificación base `NO EVALUADO`        |    **59** |
| Certificación base `BLOQUEADO` por AURA |     **3** |

Los tres objetos AURA no pueden pasar a `CERTIFICADO` mientras no exista una fuente AURA operativa, autorizada y verificable. Esta tarea no crea una fuente sustituta ni permite certificar listas, carpetas, hojas o copias paralelas.

---

#### 16. Calidad de las cuatro fuentes observadas de asistencia

| Fuente                       | Autoridad lógica              | Controles DQ críticos                                                                                       | Referencia de frescura                                                 | Certificación base |
| ---------------------------- | ----------------------------- | ----------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------- | ------------------ |
| `scheduled_shifts`           | programacion laboral de VISO  | identidad de turno; trabajador/sede; intervalo; estado/clasificación; cobertura del periodo                 | corte del periodo solicitado; publicación/vigencia aplicable           | `NO EVALUADO`      |
| `attendance_sessions`        | hechos de asistencia de ANIMA | identidad/correlacion de sesion; trabajador/sede; check-in/check-out; estado; duplicados                    | hasta el corte del reporte; distinguir sesion abierta de dato faltante | `NO EVALUADO`      |
| `attendance_breaks`          | hechos de asistencia de ANIMA | trabajador/sede; inicio/fin; relación temporal con sesion; superposicion tratada deterministamente          | hasta el corte del reporte y dentro de la sesion aplicable             | `NO EVALUADO`      |
| `attendance_geofence_events` | hechos de asistencia de ANIMA | trabajador/sede; tipo de evento; ocurrencia; correlacion con sesion/turno; valores requeridos por el evento | hasta el corte del reporte; conservar ocurrencia original              | `NO EVALUADO`      |

**Reconciliación:** 4 fuentes esperadas; 4 materializadas; 4 únicas; 0 faltantes; 0 duplicadas.

La función observada `attendance-report` consume estas fuentes y produce una proyección. Su existencia y ejecución no certifican automáticamente ni las fuentes ni las métricas resultantes.

---

#### 17. Matriz de calidad y certificación de las 14 métricas de asistencia

| `metric_key`        | Entradas mínimas                                                    | Gate DQ específico                                                                                                                       | Certificación base |
| ------------------- | ------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- | ------------------ |
| `scheduledShifts`   | scheduled_shifts                                                    | identidad de turno única; trabajador/sede válidos; intervalo y clasificación interpretables; cobertura del periodo                       | `NO EVALUADO`      |
| `attendedShifts`    | scheduled_shifts + attendance_sessions                              | correspondencia turno-sesion válida; check-in evidenciado; sin doble efecto por duplicados                                               | `NO EVALUADO`      |
| `restDayCount`      | scheduled_shifts                                                    | clasificación de descanso válida y separada de la poblacion computable                                                                   | `NO EVALUADO`      |
| `lateCount`         | scheduled_shifts + attendance_sessions                              | check-in, inicio programado, gracia/versión y zona horaria disponibles y coherentes                                                      | `NO EVALUADO`      |
| `noShowCount`       | scheduled_shifts + attendance_sessions                              | fin programado ocurrido al corte y ausencia de sesion válida; no convertir turnos futuros en ausencia                                    | `NO EVALUADO`      |
| `openCount`         | scheduled_shifts + attendance_sessions                              | sesion abierta evaluada AS OF corte; referencias y estado interpretables                                                                 | `NO EVALUADO`      |
| `missingCloseCount` | scheduled_shifts + attendance_sessions                              | sesion abierta y fin programado vencido al corte; implementacion actual no respeta completamente esta condicion en el resumen            | `BLOQUEADO`        |
| `autoCloseCount`    | attendance_sessions                                                 | evidencia de autocierre y sesion válida; no confundir cierre automático con cierre normal                                                | `NO EVALUADO`      |
| `departureCount`    | scheduled_shifts + attendance_sessions + attendance_geofence_events | evento de salida correlacionado a la sesion/turno; identidad, tiempo y contexto válidos                                                  | `NO EVALUADO`      |
| `scheduledMinutes`  | scheduled_shifts                                                    | intervalo programado y descanso programado interpretables; resultado no negativo                                                         | `NO EVALUADO`      |
| `netMinutes`        | attendance_sessions + attendance_breaks                             | intervalo de sesion y descansos superpuestos válidos; resultado no negativo y sin doble conteo                                           | `NO EVALUADO`      |
| `incidentCount`     | scheduled_shifts + attendance_sessions + attendance_geofence_events | maximo una incidencia agregada por turno elegible para el conjunto de senales definido                                                   | `NO EVALUADO`      |
| `attendanceRate`    | scheduledShifts + attendedShifts                                    | numerador/denominador reconciliados; denominador positivo o ausencia de valor numerico; implementacion actual devuelve 0 sin denominador | `BLOQUEADO`        |
| `punctualityRate`   | attendedShifts + lateCount                                          | numerador/denominador reconciliados; denominador positivo o ausencia de valor numerico; implementacion actual devuelve 0 sin denominador | `BLOQUEADO`        |

**Reconciliación:** 14 métricas esperadas; 14 materializadas; 14 claves únicas; 0 faltantes; 0 duplicadas; 11 `NO EVALUADO`; 3 `BLOQUEADO`.

Reglas específicas:

- ninguna de las 11 métricas `NO EVALUADO` se eleva a `CERTIFICADO` por la sola existencia de la implementación;
- `missingCloseCount` permanece bloqueada hasta que la implementación aplique también la condición de fin programado vencido al corte en el resumen;
- `attendanceRate` permanece bloqueada hasta que la ausencia de denominador deje de representarse como un cero numérico;
- `punctualityRate` permanece bloqueada hasta que la ausencia de denominador deje de representarse como un cero numérico;
- la frescura de cada métrica se deriva de las fuentes requeridas y del corte solicitado; no existe un SLA universal de asistencia definido por esta tarea;
- las tasas se certifican únicamente si numerador, denominador, población, corte y fuentes pueden reconciliarse bajo la misma versión.

---

#### 18. Importación externa controlada — calidad de Makos/POS externo

La importación manual desde Makos/POS externo permanece una exportación controlada y no se considera una fuente automática certificada.

Para que un lote o periodo pueda evaluarse para uso analítico deberá conservar, como mínimo:

- archivo o evidencia original suficiente;
- fuente y periodo cubierto;
- versión/formato del archivo;
- cobertura declarada y, cuando sea demostrable, población esperada;
- mapping/crosswalk aplicable a identidades canónicas;
- líneas aceptadas, rechazadas, en cuarentena, duplicadas y excluidas;
- totales conciliables de cantidades e importes según el contrato;
- diferencias y no resueltos visibles;
- corte de la importación y transformaciones aplicadas.

La cobertura histórica continúa condicionada por `DAT-01`, `DAT-02`, `DAT-03` y las tareas `INT-POS-*` aplicables ya identificadas en `DATA-DOM-006`. Sin esa evidencia, la porción histórica no demostrable permanece fuera de certificación; no se inventa cobertura ni se deduce desde archivos incompletos.

---

#### 19. Workflow documental de incidencias de calidad

Una incidencia de calidad sigue esta secuencia lógica:

```text
DETECCIÓN
→ IDENTIFICAR DIMENSIÓN Y COORDENADA AFECTADA
→ DETERMINAR IMPACTO SOBRE EL USO
→ ASIGNAR PROPIETARIO / STEWARD
→ OBSERVAR, DEGRADAR O BLOQUEAR
→ CORREGIR EN LA FUENTE, RELACIÓN O CONTRATO PROPIETARIO
→ REPROCESAR O RECONSTRUIR CUANDO APLIQUE
→ RECONCILIAR
→ REEVALUAR CALIDAD
→ RECERTIFICAR SOLO CON EVIDENCIA
```

Reglas de responsabilidad:

- el steward mantiene metadatos, vigila calidad, completitud, consistencia y vigencia, e identifica duplicados, conflictos y anomalías;
- el propietario funcional decide semántica, aceptación material y conflictos que exceden la delegación del steward;
- el custodio o implementador técnico ejecuta controles y correcciones autorizadas sin adquirir autoridad empresarial;
- el certificador se mantiene separado conforme a `DATA-AUTH-003`;
- una incidencia no se cierra porque desaparezca de un dashboard; debe existir evidencia de corrección/reconciliación o una decisión explícita de aceptación/degradación;
- una corrección que afecte historia publicada se coordina con `DATA-DOM-017`;
- una incidencia de fuente no se resuelve editando el agregado para que coincida con la expectativa.

---

#### 20. Evidencia técnica vigente y estado de las divergencias de asistencia

La implementación actual inspeccionada de `attendance-report` conserva las tres divergencias ya registradas:

1. `attendanceRate` devuelve `0` cuando `scheduledShifts = 0`, mientras el contrato canónico exige ausencia de valor numérico cuando no existe denominador;
2. `punctualityRate` devuelve `0` cuando `attendedShifts = 0`, mientras el contrato canónico exige ausencia de valor numérico cuando no existe denominador;
3. el cálculo intermedio identifica correctamente cuándo una sesión abierta corresponde a un turno ya vencido, pero el resumen incrementa `missingCloseCount` para toda fila abierta, sin conservar esa condición temporal en el agregado.

Por tanto, las tres métricas permanecen `BLOQUEADO`. Esta tarea no modifica la función, Supabase ni consumidores.

La función inspeccionada tampoco materializa dentro de su contrato visible un estado explícito de certificación o frescura. La instrumentación física y su exposición pertenecen a `DATA-INT-001`, `DATA-INT-002`, `DATA-UX-003` y `DATA-UX-004` según su responsabilidad; la ausencia de esos campos no autoriza inventar un estado operativo.

---

#### 21. Handoffs con propietario documental exacto

| Decisión o materialización fuera del alcance                                                                       | Propietario documental | Condición de salida                                                    |
| ------------------------------------------------------------------------------------------------------------------ | ---------------------- | ---------------------------------------------------------------------- |
| publicación de reportes, tableros, exportaciones, alertas, suscripciones y snapshots oficiales con calidad visible | `DATA-DOM-008`         | antes de presentar un artefacto oficial                                |
| restatements y reproducibilidad después de correcciones/backfills                                                  | `DATA-DOM-017`         | antes de reexpresar una publicación previa                             |
| segregación entre definición, certificación, publicación y administración                                          | `DATA-AUTH-003`        | antes de conceder capacidades de certificación o publicación           |
| visualización de frescura/corte y contexto en tableros                                                             | `DATA-UX-003`          | antes de exponer dashboards con estados de actualidad                  |
| experiencia de estados de calidad, certificación, degradación y bloqueo                                            | `DATA-UX-004`          | antes de exponer workflow/estado de calidad a usuarios                 |
| contratos físicos de lectura, eventos y controles de ingestión                                                     | `DATA-INT-001`         | antes de automatizar controles en flujos productivos                   |
| materialización de capa semántica, modelos, consultas, caché y snapshots                                           | `DATA-INT-002`         | antes de persistir o servir estados de calidad derivados               |
| crosswalks y reconciliación física de identidades externas                                                         | `DATA-INT-003`         | antes de certificar integridad de referencias externas                 |
| fórmulas y controles de calidad específicos de analítica comercial                                                 | `DATA-DOM-009`         | al materializar métricas de ventas/demanda/precios/promociones/canales |
| fórmulas y controles de calidad específicos de abastecimiento e inventario                                         | `DATA-DOM-010`         | al materializar métricas de inventario/proveedores/logística           |
| fórmulas y controles de calidad específicos de producción                                                          | `DATA-DOM-011`         | al materializar métricas productivas                                   |
| fórmulas y controles de calidad específicos de servicio/clientes                                                   | `DATA-DOM-012`         | al materializar métricas de servicio y experiencia                     |
| fórmulas y controles de calidad específicos económico-financieros                                                  | `DATA-DOM-013`         | al materializar métricas económicas y financieras                      |

No queda una decisión material de calidad, certificación o frescura diferida sin tarea propietaria exacta.

---

#### 22. Cobertura de prueba canónica preexistente

El requisito vigente `TREQ-DATA-003` ya protege de forma directa recopilación, tiempos, granularidad, claves, versión de esquema, cobertura, duplicados, integridad referencial, datos tardíos, backfills, correcciones, cuarentena, reconciliación y linaje, distingue los estados de ausencia y prohíbe presentar como certificado un reporte cuya fuente esté vencida, incompleta, degradada o sin reconciliar. Además asigna expresamente `DATA-DOM-007` entre sus tareas responsables.

`TREQ-DATA-001` mantiene la protección de identidad, duplicidad y calidad de maestros; `TREQ-DATA-002` mantiene la obligación de que las métricas conserven frescura, calidad y estado de certificación dentro de su definición versionada.

La presente tarea materializa el contrato documental y los gates que esas reglas ya exigen. No modifica su regla protegida, prioridad, modalidad, estado, relaciones ni destino de implementación.

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** las obligaciones de calidad, frescura, cobertura, duplicidad, integridad, reconciliación y certificación materializadas en esta tarea ya están protegidas por requisitos canónicos vigentes y asignadas a esta responsabilidad documental. La tarea no introduce una familia de comportamiento ejecutable independiente ni autoriza implementación técnica, publicación o cambios de datos.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 23. Criterios de aceptación

1. existen exactamente diez dimensiones mínimas de calidad y cada una conserva semántica distinta;
2. se preservan exactamente cinco estados de certificación: `NO EVALUADO`, `EN OBSERVACIÓN`, `CERTIFICADO`, `DEGRADADO` y `BLOQUEADO`;
3. `NO_APLICA` permanece una decisión de alcance y no se convierte en estado de certificación;
4. la certificación queda acotada por uso, periodo, versión, corte, dependencias y evidencia;
5. completar una carga o consulta no equivale a certificar el resultado;
6. cero, nulo, no aplica, desconocido, no recibido y dato pendiente permanecen estados distintos;
7. no existe un umbral universal inventado de frescura, volumen o tolerancia;
8. la frescura se evalúa contra la cadencia, vigencia, ventana o corte del contrato concreto;
9. una fuente requerida vencida, incompleta, degradada, bloqueada o sin reconciliar impide certificar el resultado dependiente;
10. la cobertura no utiliza denominadores inventados cuando el universo esperado no puede demostrarse;
11. unicidad se evalúa con identidad y alcance aprobados, no por similitud textual;
12. una detección de duplicado no autoriza fusión de maestros;
13. la integridad referencial histórica usa identidades y vigencias aplicables al hecho;
14. una relación ausente no se completa con un maestro actual por conveniencia;
15. los cuatro mecanismos de entrada están materializados: 4 esperados, 4 presentes, 0 faltantes y 0 duplicados;
16. las 15 familias heredadas están materializadas: 15 esperadas, 15 presentes, 0 faltantes y 0 duplicadas;
17. la familia AURA permanece bloqueada y la proyección PRINTER/ASSET conserva su no aplicabilidad como familia de hecho autónoma;
18. los 62 objetos maestros/referencia reciben control DQ y estado base explícito: 62 esperados, 62 presentes, 0 faltantes y 0 duplicados;
19. se preservan exactamente 43 datos maestros y 19 datos de referencia;
20. los tres objetos AURA permanecen `BLOQUEADO` y los otros 59 quedan `NO EVALUADO` hasta evidencia operativa;
21. las cuatro fuentes observadas de asistencia reciben controles críticos y referencia de frescura sin ser certificadas por inferencia;
22. las 14 métricas de asistencia reciben gate DQ y estado explícito: 11 `NO EVALUADO` y 3 `BLOQUEADO`;
23. `missingCloseCount`, `attendanceRate` y `punctualityRate` permanecen bloqueadas mientras las divergencias actuales sigan presentes;
24. ninguna métrica se eleva a `CERTIFICADO` por la mera existencia de código;
25. la importación Makos/POS externo no se presenta como integración automática ni como fuente certificada;
26. cada incidencia conserva coordenada, dimensión, impacto, propietario/steward, consecuencia y evidencia de resolución;
27. la segregación de certificación permanece en `DATA-AUTH-003` y no se conceden permisos en esta tarea;
28. la publicación oficial permanece en `DATA-DOM-008` y no se adelanta;
29. los restatements permanecen en `DATA-DOM-017`;
30. no se modifica código, SQL, Supabase, datos, migraciones, backfills, dashboards, reportes ni snapshots oficiales;
31. no se crea ni modifica ningún requisito de prueba;
32. la continuidad queda exclusivamente en `DATA-DOM-008` como siguiente tarea reservada.

---

#### 24. Continuidad

ÚLTIMA TAREA APROBADA
`DATA-DOM-006 — Definir contratos de recopilación, ingestión, transformación, backfill y reconciliación`

TAREA ACTUAL APROBADA
`DATA-DOM-007 — Definir calidad, certificación, frescura, completitud, unicidad, validez e integridad`

SIGUIENTE TAREA RESERVADA
`DATA-DOM-008 — Definir reportes, tableros, exportaciones, suscripciones, alertas y snapshots oficiales`


### ✅ DATA-DOM-008 — Definir reportes, tableros, exportaciones, suscripciones, alertas y snapshots oficiales

**Estado:** APROBADA
**Tarea anterior:** `DATA-DOM-007 — Definir calidad, certificación, frescura, completitud, unicidad, validez e integridad` — APROBADA
**Tarea siguiente:** `DATA-DOM-009 — Definir analítica de ventas, demanda, precios, promociones y canales` — RESERVADA
**Tipo de tarea:** documental; contrato canónico de presentación, publicación, distribución, exportación, suscripción, alerta y snapshot oficial de resultados analíticos
**Bloque:** AB — Analítica, indicadores y datos maestros
**Fase:** exclusivamente documental
**Implementación técnica:** no autorizada
**Código, DDL, DML, migraciones, backfills, cambios de datos, despliegues o publicación productiva de artefactos:** no autorizados
**Requisitos de prueba creados o modificados:** 0

#### 1. Propósito

Definir el contrato común mediante el cual Vento OS presenta, publica, distribuye y conserva resultados analíticos sin convertir un tablero, reporte, exportación, suscripción, alerta o snapshot en fuente de verdad y sin ocultar la versión semántica, el corte, la frescura, la cobertura o el estado de calidad que sustentan la cifra.

La tarea cierra documentalmente la cadena iniciada por las tareas anteriores:

```text
FUENTES GOBERNADAS
→ INGESTIÓN Y RECONCILIACIÓN
→ MÉTRICAS VERSIONADAS
→ CALIDAD Y CERTIFICACIÓN
→ ARTEFACTO ANALÍTICO
→ PRESENTACIÓN / PUBLICACIÓN / DISTRIBUCIÓN
→ DRILL-DOWN AUTORIZADO
```

Regla cardinal:

```text
MÉTRICA DEFINIDA
≠ MÉTRICA CERTIFICADA
≠ RESULTADO CALCULADO
≠ ARTEFACTO PUBLICADO
```

La existencia técnica de una pantalla, respuesta JSON, archivo XLSX, consulta, vista o modelo no concede por sí sola carácter oficial ni certificación.

#### 2. Resultado sustantivo

Queda materializado el contrato `DATA-DOM-008` con los siguientes resultados:

- seis familias principales de artefacto definidas y reconciliadas: tablero, reporte, exportación, suscripción, alerta y snapshot oficial;
- separación explícita entre vista viva, tablero, reporte oficial, exportación, suscripción, alerta, snapshot publicado, resultado provisional y simulación;
- contrato mínimo común con pregunta empresarial, periodo, corte, zona horaria, filtros, dimensiones, versión de métricas, frescura, cobertura, calidad/certificación, unidad o moneda, fuente, última actualización, responsable y trazabilidad al detalle;
- reglas de publicación que mantienen certificación y publicación como decisiones independientes;
- prohibición de presentar como certificado un artefacto cuya dependencia necesaria esté vencida, incompleta, degradada, bloqueada o sin reconciliar;
- prohibición de publicar como oficial un artefacto que dependa de una entrada `BLOQUEADO`;
- reglas de exportación que conservan el mismo contexto y alcance autorizado del resultado que originó el artefacto;
- reglas de suscripción que convierten una entrega recurrente en mecanismo de distribución y no en nueva definición analítica;
- reglas de alerta que separan señal, diagnóstico, decisión y acción;
- snapshots oficiales definidos como publicaciones inmutables por corte, contexto y versión;
- tratamiento explícito de correcciones posteriores mediante reconstrucción o restatement gobernado, nunca alteración silenciosa de una publicación previa;
- clasificación documental de la implementación observada de `attendance-report` como proyección JSON y exportación XLSX técnicamente implementadas, pero no certificadas ni oficiales por inferencia;
- materialización de la decisión de publicación para las 14 de 14 métricas de asistencia ya registradas;
- cero cambios físicos y cero cambios de requisitos de prueba.

#### 3. Fronteras conceptuales obligatorias

```text
VISTA VIVA
≠ TABLERO
≠ REPORTE OFICIAL
≠ EXPORTACIÓN
≠ SUSCRIPCIÓN
≠ ALERTA
≠ SNAPSHOT OFICIAL
≠ SIMULACIÓN
```

```text
PUBLICADO
≠ CERTIFICADO
```

```text
EXPORTACIÓN
≠ FUENTE DE VERDAD
```

```text
SUSCRIPCIÓN
≠ AMPLIACIÓN DE AUTORIZACIÓN
```

```text
ALERTA
≠ DIAGNÓSTICO
≠ DECISIÓN
≠ ACCIÓN
```

```text
SNAPSHOT OFICIAL
≠ RESPALDO TÉCNICO
≠ ESTADO VIVO
≠ RESTATEMENT
```

```text
CERO MEDIDO
≠ SIN DATO
≠ SIN DENOMINADOR
≠ NO APLICA
≠ DATO PENDIENTE
```

Un artefacto puede ser técnicamente válido y seguir siendo provisional, no certificado o no apto para publicación oficial según su uso y dependencias.

#### 4. Matriz canónica de las seis familias principales

|    # | Familia          | Finalidad canónica                                                                              | Mutabilidad                                                                  | Condición mínima antes de uso oficial                                                                     | Autoridad sobre hechos o maestros | Estado documental |
| ---: | ---------------- | ----------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------------- | ----------------- |
|    1 | tablero          | presentar señales y métricas para una decisión recurrente, con contexto y drill-down progresivo | puede actualizarse con nuevos cortes; cada resultado conserva su contexto    | definición semántica vigente, calidad visible, dependencias admisibles y autorización efectiva            | ninguna                           | `ESPECIFICADO`    |
|    2 | reporte          | comunicar un conjunto delimitado de resultados para un periodo, corte, propósito y audiencia    | una edición oficial emitida no cambia silenciosamente                        | periodo/corte, versiones, fuentes, calidad, responsable y estado de publicación explícitos                | ninguna                           | `ESPECIFICADO`    |
|    3 | exportación      | entregar una representación portable del resultado autorizado                                   | artefacto derivado; una nueva generación es otra ejecución                   | mismo alcance, filtros, dimensiones, corte, versiones y restricciones del resultado origen                | ninguna                           | `ESPECIFICADO`    |
|    4 | suscripción      | programar o solicitar entregas de un artefacto o resultado definido                             | la regla de entrega puede evolucionar; cada entrega conserva su propio corte | artefacto fuente gobernado, contexto de entrega, autorización vigente y política ante degradación/bloqueo | ninguna                           | `ESPECIFICADO`    |
|    5 | alerta           | señalar una condición definida que requiere atención o evaluación                               | cada ocurrencia conserva regla, versión, contexto y tiempo de evaluación     | regla/umbral o condición versionada, dato interpretable, calidad suficiente y destinatario autorizado     | ninguna                           | `ESPECIFICADO`    |
|    6 | snapshot oficial | conservar una publicación inmutable de un resultado para un corte y contexto concretos          | inmutable; cambios posteriores producen nueva publicación o restatement      | versiones, corte, fuentes, calidad/certificación, responsable y evidencia de publicación completos        | ninguna                           | `ESPECIFICADO`    |

**Reconciliación:** 6 familias esperadas; 6 materializadas; 0 faltantes; 0 duplicadas.

#### 5. Contrato mínimo común de un artefacto analítico

Todo artefacto deberá poder declarar, cuando aplique a su clase y uso:

| Componente                        | Regla canónica                                                                                             |
| --------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| pregunta empresarial              | identifica qué decisión o necesidad informativa resuelve                                                   |
| propósito y audiencia             | delimita por qué existe y para quién fue generado o publicado                                              |
| clase de artefacto                | distingue tablero, reporte, exportación, suscripción, alerta, snapshot, vista viva, provisional o simulada |
| periodo                           | identifica la ventana empresarial observada                                                                |
| fecha y hora de corte             | fija hasta qué información pudo participar en el resultado                                                 |
| zona horaria                      | conserva la interpretación temporal efectiva                                                               |
| filtros                           | registra restricciones materiales aplicadas                                                                |
| dimensiones                       | registra agrupaciones y segmentos utilizados                                                               |
| métricas y versiones              | referencia las definiciones semánticas exactas consumidas                                                  |
| unidad y moneda                   | evita cantidades o importes implícitos o ambiguos                                                          |
| frescura                          | declara actualidad respecto del uso y corte exigidos                                                       |
| cobertura                         | declara población cubierta, parcialidad conocida o imposibilidad de comprobar el universo                  |
| calidad/certificación             | conserva el estado aplicable definido en `DATA-DOM-007`                                                    |
| fuentes y dependencias            | permite explicar qué datos y resultados sustentan el artefacto                                             |
| última actualización o generación | distingue actualización del artefacto frente al corte de los datos                                         |
| responsable                       | identifica propiedad empresarial de la publicación o consumo                                               |
| trazabilidad al detalle           | permite llegar, bajo autorización, desde el agregado a evidencia o hechos explicativos                     |
| estado de publicación             | distingue material vivo, provisional, oficial, degradado o simulado sin confundirlo con certificación      |
| relación con publicación anterior | conserva vínculo cuando exista corrección, reconstrucción o restatement                                    |

La representación técnica de estos componentes puede variar. La implementación física pertenece a las tareas de integración, autorización y experiencia ya reservadas.

#### 6. Autoridad y propiedad del artefacto

```text
PROPIETARIO DEL DATO
≠ PROPIETARIO DE LA MÉTRICA
≠ CERTIFICADOR
≠ PUBLICADOR
≠ CONSUMIDOR
```

Reglas:

1. publicar un artefacto no transfiere propiedad de los datos fuente;
2. un tablero o reporte no puede corregir hechos, maestros o relaciones para lograr una cifra esperada;
3. un exportador o generador técnico no adquiere autoridad empresarial por producir el archivo;
4. el responsable de publicación no redefine fórmulas ya registradas;
5. la segregación de capacidades entre definición, certificación, publicación, exportación y administración permanece en `DATA-AUTH-003`;
6. el acceso a agregado no concede acceso automático al detalle;
7. la protección de detalle sensible, poblaciones pequeñas, comparaciones y exportaciones permanece en `DATA-AUTH-002`;
8. la auditoría de consultas, exportaciones, suscripciones y alertas permanece en `DATA-AUTH-004`.

#### 7. Gate documental de publicación

Antes de presentar un artefacto como oficial se evalúan, cuando apliquen, estas condiciones:

1. la definición semántica de las métricas está identificada y versionada;
2. periodo, corte y zona horaria están definidos;
3. filtros, dimensiones, unidad y moneda están explícitos cuando pueden cambiar el significado;
4. las fuentes y dependencias pueden identificarse;
5. la frescura y cobertura son conocidas para el uso;
6. la reconciliación requerida está completa o la diferencia ha sido tratada conforme al contrato vigente;
7. ninguna dependencia obligatoria se encuentra `BLOQUEADO`;
8. un artefacto presentado como `CERTIFICADO` depende únicamente de resultados y fuentes cuya certificación permita ese uso;
9. la autorización del actor o destinatario se evalúa separadamente;
10. existe información suficiente para reproducir o explicar el resultado sin usar el artefacto como fuente primaria.

Reglas de consecuencia:

- una dependencia `BLOQUEADO` impide publicación oficial del artefacto dependiente;
- una dependencia `NO EVALUADO` no puede presentarse como `CERTIFICADO`;
- una dependencia `DEGRADADO` puede sostener una vista o entrega explícitamente degradada cuando el uso lo permita, pero no se rotula como certificada;
- una ausencia de datos no se convierte en valor cero para superar el gate;
- una carga técnicamente exitosa no sustituye reconciliación, evaluación de calidad o certificación.

#### 8. Tableros

Un tablero es una superficie de decisión recurrente. No es un repositorio paralelo ni una colección indiscriminada de cifras.

Contrato:

- responde una decisión principal o un conjunto estrechamente relacionado de decisiones;
- muestra primero señal, cambio y contexto, dejando fórmula, linaje y excepciones bajo divulgación progresiva;
- conserva periodo, corte, filtros, versión, frescura, cobertura y calidad disponibles para consulta;
- utiliza únicamente métricas registradas y no redefine fórmulas localmente;
- la comparación entre periodos o segmentos conserva las condiciones de comparabilidad definidas en `DATA-DOM-005`;
- el drill-down mantiene el mismo contexto del agregado y reevalúa autorización en el nivel de detalle;
- los estados vacíos distinguen ausencia real de actividad, falta de datos, cobertura incompleta y población no aplicable;
- la selección de KPI, drivers, guardrails, líneas base y metas permanece en `DATA-DOM-015`;
- la experiencia concreta del tablero permanece en `DATA-UX-001` y `DATA-UX-003`.

#### 9. Reportes oficiales

Un reporte oficial representa una publicación gobernada para un periodo, corte, propósito y audiencia determinados.

Debe conservar:

- nombre y propósito empresarial;
- responsable;
- periodo y corte;
- fecha de generación y, cuando corresponda, de publicación;
- zona horaria;
- métricas y versiones;
- filtros y dimensiones;
- unidad y moneda;
- estado de frescura, cobertura y calidad;
- fuentes o dependencias materiales;
- condición oficial, provisional o degradada;
- relación con una publicación anterior cuando exista restatement.

Reglas:

1. emitir nuevamente el mismo periodo con datos o versiones distintas no altera la edición anterior;
2. un reporte oficial no se usa como entrada para reconstruir los mismos hechos que presenta;
3. una corrección posterior se refleja mediante una nueva publicación relacionada cuando corresponda;
4. un reporte que contiene una dependencia `BLOQUEADO` no puede publicarse como oficial;
5. un reporte no puede presentarse como certificado si sus dependencias requeridas no satisfacen la certificación del uso;
6. el formato visual puede cambiar sin cambiar la métrica si se preservan definición, contexto y corte.

#### 10. Exportaciones

Una exportación es una representación portable de datos o resultados ya autorizados. No es una fuente empresarial nueva.

Contrato:

- conserva el alcance efectivo del actor y no amplía población, detalle o territorio;
- mantiene el periodo, corte, filtros y dimensiones materiales;
- conserva versión de métricas y definición de columnas o campos cuando aplique;
- conserva unidad, moneda y zona horaria cuando cambien la interpretación;
- declara fecha de generación;
- conserva o acompaña el estado de frescura, cobertura y calidad aplicable;
- distingue una exportación ad hoc de una exportación vinculada a una publicación oficial;
- el detalle sensible sigue sujeto a las reglas de `DATA-AUTH-001` y `DATA-AUTH-002`;
- la auditoría y trazabilidad de la acción permanecen en `DATA-AUTH-004`.

Una exportación generada desde un tablero vivo no se vuelve snapshot oficial por el solo hecho de quedar almacenada fuera de la aplicación.

#### 11. Suscripciones

Una suscripción define la entrega repetida o condicionada de un artefacto o resultado gobernado. No define una fórmula alternativa ni congela permanentemente la autorización del destinatario.

Toda suscripción deberá poder declarar:

- artefacto o conjunto de métricas al que se refiere;
- versión o política de versión aplicable;
- periodo o ventana entregada;
- filtros y dimensiones materiales;
- cadencia o condición de entrega;
- zona horaria de evaluación y entrega cuando aplique;
- formato de salida;
- destinatario o audiencia bajo autorización efectiva;
- estado mínimo de calidad requerido para emitir una entrega oficial;
- tratamiento cuando la fuente esté degradada, bloqueada o incompleta;
- última ejecución y resultado cuando exista implementación;
- vínculo con el artefacto publicado cuando la entrega representa un snapshot o reporte oficial.

Reglas:

1. cada entrega conserva su propio corte y contexto;
2. una suscripción no mantiene acceso cuando el contexto efectivo ya no lo autoriza;
3. si una dependencia necesaria está `BLOQUEADO`, no se emite silenciosamente una entrega oficial como si estuviera completa;
4. si el contrato permite una entrega degradada, esa condición queda visible;
5. cambiar cadencia o canal no cambia por sí solo la definición de la métrica;
6. el diseño de experiencia de suscripciones permanece en `DATA-UX-007` y su auditoría en `DATA-AUTH-004`.

#### 12. Alertas

Una alerta expresa que una condición gobernada fue evaluada y produjo una señal. No constituye por sí sola diagnóstico, causa, decisión o acción.

Toda alerta deberá poder declarar:

- métrica, dato o condición observada;
- versión de la regla o definición aplicable;
- periodo, instante o corte de evaluación;
- dimensiones y alcance;
- umbral, comparación o condición que produjo la señal cuando aplique;
- valor observado y unidad;
- frescura y calidad de los datos usados;
- severidad o prioridad cuando exista contrato de dominio;
- destinatario o audiencia autorizada;
- vínculo con el tablero, reporte o detalle que explica la señal;
- estado de reconocimiento o tratamiento cuando la implementación futura lo contemple.

Reglas:

1. una ausencia de dato no dispara una alerta de desempeño como si fuese un valor cero, salvo que la regla definida sea precisamente ausencia o incumplimiento de llegada;
2. una alerta generada con datos degradados debe mostrar esa condición;
3. un umbral no se inventa en esta tarea; pertenece a la definición empresarial que lo gobierne;
4. una alerta no ejecuta automáticamente una acción empresarial;
5. diagnóstico y recomendación permanecen en `DATA-DOM-014`; objetivos, metas y guardrails en `DATA-DOM-015`; acciones de mejora en `DATA-DOM-016`.

#### 13. Snapshots oficiales

Un snapshot oficial es una publicación inmutable que conserva un resultado para una coordenada concreta de periodo, corte, contexto y versiones.

Debe conservar, como mínimo:

- corte y periodo;
- contexto territorial u organizacional aplicable;
- filtros y dimensiones;
- métricas y versiones;
- unidad y moneda;
- fuentes y dependencias;
- estado de calidad/certificación al momento de publicación;
- fecha de generación/publicación;
- responsable de la publicación;
- relación con una publicación previa o posterior cuando exista restatement.

Reglas:

1. incorporar datos tardíos no modifica silenciosamente el snapshot ya publicado;
2. corregir una fuente no cambia retrospectivamente el contenido de la publicación anterior;
3. una nueva reconstrucción produce un resultado distinguible y trazable;
4. un snapshot no sustituye los hechos, movimientos o maestros que lo originan;
5. un snapshot no se usa para inventar detalle que sus fuentes no contienen;
6. la política de restatement, versiones históricas y reproducibilidad de reexpresiones permanece en `DATA-DOM-017`;
7. la materialización física de modelos, cachés y snapshots permanece en `DATA-INT-002`.

#### 14. Vista viva, provisional y simulación

Estas clasificaciones se mantienen separadas de un artefacto oficial:

| Clasificación | Semántica                                                                     | Regla principal                                                             |
| ------------- | ----------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| vista viva    | proyección del estado disponible al momento de consulta                       | debe mostrar corte/frescura efectiva y no promete inmutabilidad             |
| provisional   | resultado todavía sujeto a cierre, reconciliación, evaluación o certificación | no se rotula como oficial/certificado y hace visible la condición pendiente |
| simulación    | resultado construido bajo supuestos o escenario                               | no se mezcla con hechos reales ni se publica como resultado observado       |

El modo de presentación no altera la propiedad de las fuentes ni la versión semántica de la métrica.

#### 15. Correcciones, reconstrucciones y restatements

```text
CORRECCIÓN DE FUENTE
→ REPROCESAMIENTO O RECONSTRUCCIÓN
→ NUEVA EVALUACIÓN DE CALIDAD
→ NUEVA DECISIÓN DE CERTIFICACIÓN
→ NUEVA PUBLICACIÓN, SI CORRESPONDE
```

Reglas:

- una publicación previa permanece identificable;
- una nueva ejecución con distinto corte o distinta versión no se presenta como la misma edición inmutable;
- la relación entre versión anterior y reexpresión debe ser trazable;
- una publicación no se edita para ocultar que existió una cifra anterior;
- `DATA-DOM-017` define el gobierno completo de restatements, correcciones históricas y reproducibilidad sin reabrir en esta tarea la semántica de métricas.

#### 16. Materialización sobre las 14 métricas de asistencia

Las 14 claves de asistencia heredadas reciben una decisión explícita de presentación/publicación conforme al estado de calidad aprobado en `DATA-DOM-007`.

|    # | `metric_key`        | Estado DQ heredado | Decisión de presentación actual                                                             | Decisión de publicación certificada                              |
| ---: | ------------------- | ------------------ | ------------------------------------------------------------------------------------------- | ---------------------------------------------------------------- |
|    1 | `scheduledShifts`   | `NO EVALUADO`      | puede aparecer en superficie provisional con estado visible                                 | no elegible como `CERTIFICADO` hasta evaluación satisfactoria    |
|    2 | `attendedShifts`    | `NO EVALUADO`      | puede aparecer en superficie provisional con estado visible                                 | no elegible como `CERTIFICADO` hasta evaluación satisfactoria    |
|    3 | `restDayCount`      | `NO EVALUADO`      | puede aparecer en superficie provisional con estado visible                                 | no elegible como `CERTIFICADO` hasta evaluación satisfactoria    |
|    4 | `lateCount`         | `NO EVALUADO`      | puede aparecer en superficie provisional con estado visible                                 | no elegible como `CERTIFICADO` hasta evaluación satisfactoria    |
|    5 | `noShowCount`       | `NO EVALUADO`      | puede aparecer en superficie provisional con estado visible                                 | no elegible como `CERTIFICADO` hasta evaluación satisfactoria    |
|    6 | `openCount`         | `NO EVALUADO`      | puede aparecer en superficie provisional con estado visible                                 | no elegible como `CERTIFICADO` hasta evaluación satisfactoria    |
|    7 | `missingCloseCount` | `BLOQUEADO`        | solo puede mostrarse como resultado no oficial con bloqueo visible cuando el uso lo permita | bloqueada hasta alinear implementación, reevaluar y certificar   |
|    8 | `autoCloseCount`    | `NO EVALUADO`      | puede aparecer en superficie provisional con estado visible                                 | no elegible como `CERTIFICADO` hasta evaluación satisfactoria    |
|    9 | `departureCount`    | `NO EVALUADO`      | puede aparecer en superficie provisional con estado visible                                 | no elegible como `CERTIFICADO` hasta evaluación satisfactoria    |
|   10 | `scheduledMinutes`  | `NO EVALUADO`      | puede aparecer en superficie provisional con estado visible                                 | no elegible como `CERTIFICADO` hasta evaluación satisfactoria    |
|   11 | `netMinutes`        | `NO EVALUADO`      | puede aparecer en superficie provisional con estado visible                                 | no elegible como `CERTIFICADO` hasta evaluación satisfactoria    |
|   12 | `incidentCount`     | `NO EVALUADO`      | puede aparecer en superficie provisional con estado visible                                 | no elegible como `CERTIFICADO` hasta evaluación satisfactoria    |
|   13 | `attendanceRate`    | `BLOQUEADO`        | solo puede mostrarse como resultado no oficial con bloqueo visible cuando el uso lo permita | bloqueada hasta alinear denominador cero, reevaluar y certificar |
|   14 | `punctualityRate`   | `BLOQUEADO`        | solo puede mostrarse como resultado no oficial con bloqueo visible cuando el uso lo permita | bloqueada hasta alinear denominador cero, reevaluar y certificar |

**Reconciliación:** 14 métricas esperadas; 14 materializadas; 14 claves únicas; 0 faltantes; 0 duplicadas; 11 `NO EVALUADO`; 3 `BLOQUEADO`.

Ninguna de las 14 métricas se eleva a `CERTIFICADO` por esta tarea.

#### 17. Evaluación documental de `attendance-report`

La implementación vigente inspeccionada materializa dos superficies de salida sobre el mismo cálculo:

| Superficie observada    | Evidencia técnica                                                                                                                                                  | Clasificación D008                       | Estado técnico | Estado para publicación oficial                                                                                   |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------- | -------------- | ----------------------------------------------------------------------------------------------------------------- |
| respuesta `format=json` | entrega periodo, zona horaria, parámetros de política, fecha de generación, resumen, principales trabajadores/sedes e incidencias                                  | vista/proyección analítica viva o ad hoc | `IMPLEMENTADO` | `BLOQUEADO` como artefacto oficial mientras incluya dependencias bloqueadas o carezca de certificación suficiente |
| libro XLSX              | genera `REPORTE OPERATIVO DE TURNOS Y ASISTENCIA`, periodo, alcance, fecha de generación, resumen ejecutivo, detalle por turno, incidencias y hojas por trabajador | reporte/exportación operativa            | `IMPLEMENTADO` | `BLOQUEADO` como reporte oficial en su forma actual                                                               |

Razones documentales del bloqueo oficial actual:

1. el resumen incluye `missingCloseCount`, `attendanceRate` y `punctualityRate`, que permanecen `BLOQUEADO` en `DATA-DOM-007`;
2. las otras métricas permanecen `NO EVALUADO`, por lo que el artefacto no puede presentarse como certificado por inferencia;
3. el contrato visible de salida no materializa de forma explícita el estado DQ/certificación requerido por el contrato común;
4. la existencia de periodo, alcance y fecha de generación es evidencia útil, pero no sustituye versión semántica, frescura, cobertura y certificación;
5. la función genera un artefacto derivado y no se convierte en fuente de verdad.

La tarea no modifica `attendance-report`. La alineación técnica de la capa de lectura/publicación corresponde a `DATA-INT-001` y `DATA-INT-002`, y la experiencia de reportes/exportaciones a `DATA-UX-007`.

#### 18. Binding físico y nombres de fuentes

La publicación se gobierna por autoridades y contratos lógicos. Los nombres físicos actuales que una implementación consulta no cambian la identidad empresarial de fuente, métrica o artefacto.

La función `attendance-report` inspeccionada consulta actualmente conjuntos físicos de programación, marcación, descansos y eventos de turno, además de la política de turno. La definición y compatibilidad del binding físico entre esos objetos y los contratos lógicos permanecen en `DATA-INT-001` y `DATA-INT-002`.

Esta tarea no renombra tablas, vistas, funciones, eventos ni fuentes documentales y no convierte una diferencia de nombre físico en una nueva autoridad.

#### 19. Privacidad, alcance y poblaciones pequeñas

El contrato de publicación no amplía acceso.

Reglas:

- una vista agregada no concede acceso al detalle personal o sensible;
- el artefacto conserva el alcance territorial, organizacional y de finalidad permitido;
- una exportación no habilita más atributos que la consulta autorizada de origen;
- poblaciones pequeñas pueden requerir ocultamiento, agregación o enmascaramiento conforme a `DATA-AUTH-002`;
- un destinatario de suscripción se evalúa bajo autorización efectiva;
- la publicación de información laboral, de cliente, financiera, técnica o personal conserva sus restricciones de sensibilidad;
- cualquier uso por proveedores, modelos externos o IA permanece bajo `DATA-AUTH-004` y `DATA-INT-004`.

#### 20. Rendimiento, materialización y degradación

Esta tarea no prescribe una tecnología BI, motor de caché o tipo de almacenamiento. Sí fija estas obligaciones documentales:

- un artefacto no debe requerir releer indiscriminadamente tablas operativas desde el cliente para cada render;
- un caché o materialización conserva versión y corte suficientes para evitar servir un resultado ambiguo;
- una exportación masiva requiere control de alcance y límites conforme a autorización e implementación aplicables;
- una degradación de fuente o modelo queda visible y no se oculta manteniendo una etiqueta de actualización nueva;
- una reconstrucción conserva la versión de cálculo y el corte usados;
- modelos, consultas, cachés y snapshots físicos pertenecen a `DATA-INT-002`.

#### 21. Observabilidad y auditoría

Cuando exista implementación, deberán quedar distinguibles al menos:

- solicitud o generación del artefacto;
- actor o proceso que la solicita;
- clase de artefacto;
- alcance y contexto material;
- periodo y corte;
- resultado de la generación;
- estado de calidad/certificación aplicable;
- publicación, exportación o entrega cuando corresponda;
- fallo, degradación o bloqueo;
- relación con una versión o restatement cuando aplique.

La materialización de auditoría y permisos corresponde a `DATA-AUTH-003`, `DATA-AUTH-004` y a las tareas técnicas aplicables. Esta sección no concede capacidades ni define una tabla universal de auditoría.

#### 22. Handoffs con propietario documental exacto

| Decisión o materialización fuera del alcance                                        | Propietario documental | Condición de salida                                                  |
| ----------------------------------------------------------------------------------- | ---------------------- | -------------------------------------------------------------------- |
| fórmulas y familias de analítica de ventas, demanda, precios, promociones y canales | `DATA-DOM-009`         | antes de crear artefactos oficiales de analítica comercial           |
| selección de KPI, drivers, guardrails, líneas base, metas y cadencias               | `DATA-DOM-015`         | antes de configurar seguimiento de objetivos                         |
| restatements, correcciones históricas y reproducibilidad de publicaciones           | `DATA-DOM-017`         | antes de reexpresar una publicación oficial previa                   |
| protección por dominio, entidad, territorio y finalidad                             | `DATA-AUTH-001`        | antes de exponer datos o resultados restringidos                     |
| detalle sensible, poblaciones pequeñas, comparaciones y exportaciones               | `DATA-AUTH-002`        | antes de exponer detalle o exportaciones sensibles                   |
| segregación entre definición, certificación, publicación y administración           | `DATA-AUTH-003`        | antes de conceder capacidades de publicación o certificación         |
| auditoría de consultas, exportaciones, suscripciones, alertas y uso externo         | `DATA-AUTH-004`        | antes de habilitar esas acciones productivas                         |
| inicio ejecutivo y jerarquía de información                                         | `DATA-UX-001`          | antes de materializar la experiencia ejecutiva                       |
| tableros, filtros, comparación y drill-down                                         | `DATA-UX-003`          | antes de materializar tableros productivos                           |
| reportes, exportaciones, suscripciones y snapshots versionados                      | `DATA-UX-007`          | antes de materializar la experiencia final de estos artefactos       |
| contratos físicos de lectura y binding con fuentes                                  | `DATA-INT-001`         | antes de publicar consumidores productivos sobre fuentes compartidas |
| capa semántica física, modelos, consultas, caché y snapshots                        | `DATA-INT-002`         | antes de materializar persistencia o servicio analítico compartido   |
| BI, hojas de cálculo, modelos externos e IA                                         | `DATA-INT-004`         | antes de integrar herramientas o proveedores analíticos externos     |

No queda una decisión material de publicación, exportación, suscripción, alerta o snapshot diferida sin propietario documental exacto.

#### 23. Cobertura de prueba canónica preexistente

El requisito DATA vigente para artefactos analíticos ya exige que todo tablero, reporte, alerta, exportación o suscripción declare versión de métricas, periodo, zona horaria, filtros, dimensiones, moneda o unidad, fecha de corte, frescura, cobertura y estado de calidad; también exige simplicidad accionable, divulgación progresiva, drill-down autorizado, separación entre vista viva, snapshot publicado, reporte oficial, simulación y exportación, y preservación de publicaciones anteriores ante correcciones o restatements.

Los requisitos DATA vigentes también protegen el registro versionado de métricas y prohíben presentar como certificado un reporte dependiente de fuentes vencidas, incompletas, degradadas o sin reconciliar.

La presente tarea materializa estas obligaciones sin cambiar su regla protegida, prioridad, modalidad, estado, relaciones ni destino de implementación.

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** las reglas de reportes, tableros, exportaciones, suscripciones, alertas, snapshots, calidad visible, corte, versión, drill-down y preservación de publicaciones ya están cubiertas por requisitos canónicos DATA vigentes asignados a esta tarea y a sus responsables transversales. La tarea no introduce una familia ejecutable independiente ni autoriza implementación técnica o publicación productiva.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

#### 24. Criterios de aceptación

1. las seis familias principales están materializadas: 6 esperadas, 6 presentes, 0 faltantes y 0 duplicadas;
2. tablero, reporte, exportación, suscripción, alerta y snapshot oficial conservan finalidades y reglas distintas;
3. vista viva, resultado provisional y simulación permanecen separados de publicación oficial;
4. publicación y certificación no se tratan como el mismo estado;
5. todo artefacto puede declarar pregunta, periodo, corte, zona horaria, filtros, dimensiones, versiones, frescura, cobertura, calidad, unidad/moneda, fuentes, actualización, responsable y trazabilidad al detalle cuando apliquen;
6. un tablero no redefine localmente una fórmula registrada;
7. una exportación no se convierte en fuente de verdad;
8. una exportación conserva el alcance efectivo del actor y el contexto material del resultado;
9. una suscripción no amplía autorización ni crea otra definición de métrica;
10. cada entrega de suscripción conserva corte y contexto propios;
11. una alerta conserva regla/versión, corte, contexto, calidad y valor observado cuando apliquen;
12. una alerta no equivale a diagnóstico, decisión ni acción;
13. ausencia de dato y cero medido permanecen separados en alertas y artefactos;
14. un snapshot oficial es inmutable respecto de lo publicado en su corte;
15. una corrección posterior no altera silenciosamente una publicación previa;
16. restatements permanecen en `DATA-DOM-017`;
17. una dependencia `BLOQUEADO` impide publicación oficial del artefacto dependiente;
18. una dependencia `NO EVALUADO` no se presenta como `CERTIFICADO`;
19. una dependencia `DEGRADADO` solo sostiene una presentación degradada cuando el uso lo permita y nunca se rotula como certificada;
20. las 14 métricas de asistencia reciben decisión explícita de publicación: 14 esperadas, 14 presentes, 0 faltantes y 0 duplicadas;
21. se preservan 11 métricas `NO EVALUADO` y 3 métricas `BLOQUEADO` conforme a `DATA-DOM-007`;
22. `missingCloseCount`, `attendanceRate` y `punctualityRate` permanecen bloqueadas para publicación certificada;
23. ninguna de las 14 métricas se eleva a `CERTIFICADO` por inferencia;
24. la respuesta JSON observada de `attendance-report` queda reconocida como proyección analítica técnicamente implementada, no como artefacto oficial certificado;
25. el XLSX observado queda reconocido como reporte/exportación técnicamente implementado, no como reporte oficial certificado en su forma actual;
26. los metadatos actuales de periodo, alcance y generación no sustituyen versión semántica, frescura, cobertura y certificación;
27. la tarea no cambia nombres físicos, código, SQL, Supabase, datos, migraciones, dashboards, reportes o snapshots productivos;
28. no se crea ni modifica ningún requisito de prueba;
29. la continuidad queda exclusivamente en `DATA-DOM-009` como siguiente tarea reservada.

#### 25. Continuidad

ÚLTIMA TAREA APROBADA
`DATA-DOM-007 — Definir calidad, certificación, frescura, completitud, unicidad, validez e integridad`

TAREA ACTUAL APROBADA
`DATA-DOM-008 — Definir reportes, tableros, exportaciones, suscripciones, alertas y snapshots oficiales`

SIGUIENTE TAREA RESERVADA
`DATA-DOM-009 — Definir analítica de ventas, demanda, precios, promociones y canales`


### ✅ DATA-DOM-009 — Definir analítica de ventas, demanda, precios, promociones y canales

**Estado:** APROBADA
**Tarea anterior:** `DATA-DOM-008 — Definir reportes, tableros, exportaciones, suscripciones, alertas y snapshots oficiales` — APROBADA
**Tarea siguiente:** `DATA-DOM-010 — Definir analítica de inventario, abastecimiento, proveedores y logística` — RESERVADA
**Tipo de tarea:** documental; definición y materialización del contrato analítico comercial para ventas, pedidos, demanda, precios, promociones y canales, con decisión explícita por familia y evidencia vigente
**Bloque:** AB — Analítica, indicadores y datos maestros
**Fase:** exclusivamente documental
**Implementación técnica:** no autorizada
**Código, DDL, DML, migraciones, backfills, cambios de datos, despliegues, publicación productiva o activación de modelos analíticos:** no autorizados
**Requisitos de prueba creados o modificados:** 0

#### 1. Propósito

Definir la analítica comercial común de Vento OS para que ventas, pedidos, demanda, precios, descuentos, promociones y canales puedan analizarse con una semántica reproducible, sin convertir una pantalla operativa, una importación, un catálogo vigente o una agregación local en una nueva fuente de verdad.

La tarea materializa las once familias comerciales reservadas por `CAP-SCOPE-017` y fija qué puede calcularse con la evidencia actual, qué permanece pendiente de evidencia y qué queda bloqueado hasta disponer de una fuente o denominador gobernado.

La cadena documental queda así:

```text
HECHO COMERCIAL / REGLA DE OFERTA
→ FUENTE Y CONTEXTO GOBERNADOS
→ CALIDAD Y RECONCILIACIÓN
→ DEFINICIÓN ANALÍTICA COMERCIAL
→ RESULTADO VERSIONADO
→ PUBLICACIÓN BAJO DATA-DOM-008
```

Regla cardinal:

```text
VENTA OBSERVADA
≠ DEMANDA TOTAL
≠ DEMANDA PERDIDA
≠ EFECTO DE PROMOCIÓN
≠ MARGEN
≠ CAPACIDAD COMERCIAL
```

#### 2. Resultado sustantivo

Queda materializado el contrato `DATA-DOM-009` con los siguientes resultados:

- las **11 de 11 familias** comerciales reservadas por `CAP-SCOPE-017` reciben definición, evidencia, estado y condición de salida explícitos;
- se preservan como familias comerciales de origen `pedido, comanda, venta, pago, caja, devolución, entrega` y `precio de venta, descuento, promoción vigente`;
- se consumen como dimensiones gobernadas `COMMERCIAL_CHANNEL`, `CATEGORIA_COMERCIAL`, `OFERTA_COMERCIAL`, producto, sede, cliente autorizado, moneda y tiempo;
- se separan pedido, venta, pago, entrega, devolución, descuento y promoción;
- se separan `source`, modalidad de cumplimiento y `COMMERCIAL_CHANNEL`; ninguna de las dos primeras sustituye al canal canónico;
- se define la semántica de ventas observadas con impuestos, descuentos y devoluciones explícitos;
- se define el tratamiento de pedidos, cancelaciones, unidades, ticket, mezcla, demanda observada, recurrencia y frecuencia;
- se bloquea la conversión oficial mientras no exista un denominador gobernado de oportunidades o intenciones elegibles;
- se bloquea la demanda perdida mientras no exista evidencia temporal de intención de compra y disponibilidad aplicable;
- se bloquea el efecto incremental de promociones mientras no exista exposición/versionado de promoción y contrafactual o comparable válido;
- se bloquea el margen comercial local hasta consumir una definición económica gobernada por `DATA-DOM-013`;
- se bloquea la capacidad comercial no utilizada mientras no exista un denominador de capacidad compatible con la unidad analizada;
- se reconoce la importación diaria Makos/POS como evidencia comercial controlada, no como cobertura histórica completa ni integración automática certificada;
- se reconoce la operación de pedidos PULSO como evidencia actual de pedidos, líneas, importes, estados, origen y modalidad, no como registro analítico certificado;
- no se crea por inferencia una nueva familia de identificadores de métricas; las claves técnicas observadas se conservan únicamente como evidencia y alias de implementación hasta su binding físico en `DATA-INT-002`;
- cero cambios físicos y cero cambios de requisitos de prueba.

#### 3. Fronteras conceptuales obligatorias

```text
PEDIDO
≠ COMANDA
≠ VENTA
≠ PAGO
≠ ENTREGA
≠ DEVOLUCIÓN
```

```text
ORIGEN TÉCNICO DEL PEDIDO
≠ MODALIDAD DE CUMPLIMIENTO
≠ COMMERCIAL_CHANNEL
```

```text
PRECIO DE CATÁLOGO ACTUAL
≠ PRECIO APLICADO A LA TRANSACCIÓN
≠ DESCUENTO
≠ PROMOCIÓN
```

```text
DESCUENTO OBSERVADO
≠ EXPOSICIÓN A PROMOCIÓN
≠ EFECTO INCREMENTAL DE PROMOCIÓN
```

```text
VENTAS REALIZADAS
≠ DEMANDA OBSERVADA COMPLETA
≠ DEMANDA LATENTE
≠ DEMANDA PERDIDA
```

```text
CERO VENTAS
≠ CERO DEMANDA
≠ PRODUCTO NO DISPONIBLE
≠ CANAL CERRADO
≠ DATO FALTANTE
```

```text
TICKET
≠ PRECIO UNITARIO
≠ INGRESO POR CLIENTE
≠ MARGEN
```

```text
VENTA
≠ INGRESO ECONÓMICO RECONOCIDO
≠ MARGEN
≠ RENTABILIDAD
```

```text
VARIACIÓN DESCRIPTIVA
≠ EFECTO CAUSAL
```

Una cifra solo puede compararse con otra cuando comparten definición, población, periodo, corte, moneda/unidad, tratamiento fiscal, dimensiones, cobertura y versión o existe un puente explícito y trazable.

#### 4. Autoridad y fuentes consumidas

La analítica comercial conserva el gobierno federado aprobado.

| Elemento                                                 | Autoridad funcional                            | Uso en esta tarea                        | Regla de frontera                                                            |
| -------------------------------------------------------- | ---------------------------------------------- | ---------------------------------------- | ---------------------------------------------------------------------------- |
| pedido, comanda, venta, pago, caja, devolución y entrega | PULSO                                          | hechos comerciales                       | cada hecho conserva identidad, estado, tiempo y grano propios                |
| precio de venta, descuento y promoción vigente           | PULSO; AURA solo propone intención promocional | reglas y valores aplicados               | la regla vigente no reescribe el valor histórico aplicado                    |
| `COMMERCIAL_CHANNEL`                                     | PULSO                                          | dimensión canónica de canal              | no equivale a sede, `source`, proveedor externo ni modalidad de cumplimiento |
| `CATEGORIA_COMERCIAL`                                    | PULSO                                          | dimensión comercial                      | no sustituye taxonomía de inventario o producto                              |
| `OFERTA_COMERCIAL`                                       | PULSO                                          | configuración vendible versionada        | producto, precio, disponibilidad y oferta permanecen conceptos distintos     |
| producto maestro                                         | NEXO                                           | identidad de producto                    | PULSO consume la identidad; no la redefine desde nombres externos            |
| cliente e identidad autorizada                           | PASS                                           | recurrencia y frecuencia cuando aplique  | no fusionar invitados por similitud ni ampliar finalidad                     |
| moneda y resultado económico                             | NUMERA                                         | moneda, margen y conciliación económica  | PULSO no redefine margen ni reconocimiento económico                         |
| campañas e intención promocional AURA                    | AURA objetivo                                  | insumo futuro para exposición/atribución | permanece bloqueado mientras no exista fuente operativa habilitada           |

#### 5. Evidencia técnica actual observada

La evidencia técnica actual demuestra superficies comerciales reales, pero no certifica por sí misma las familias analíticas.

| Superficie observada                  | Evidencia material                                                                                                                                                   | Qué sí demuestra                                                                    | Qué no demuestra                                                                                                              |
| ------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| importación diaria Makos/POS en PULSO | lote por sede/fecha, archivo y hash; filas por artículo; cantidad; subtotal; impuestos; descuentos; devoluciones; importes neto y bruto; mapping a catálogo/producto | existencia de una captura comercial controlada y auditable para ventas por artículo | cobertura histórica completa, transacción individual, canal canónico, ticket completo, causalidad promocional o certificación |
| publicación del lote diario PULSO     | solo lotes `validated` pueden pasar a `posted`; posting conserva efectos de inventario y evidencia                                                                   | control operativo previo al efecto posterior del lote                               | que `posted` equivalga a `CERTIFICADO` o a reporte oficial                                                                    |
| pedidos PULSO                         | `orders` con fecha, estado, pago, subtotal, total, sede, `source`, modalidad y despacho                                                                              | existencia de pedidos y estados operativos segmentables                             | denominador de conversión, canal canónico o demanda no atendida                                                               |
| líneas de pedido                      | producto, cantidad, precio unitario y total de línea                                                                                                                 | unidades y precio aplicado al pedido observado                                      | precio histórico completo de todas las ventas/canales                                                                         |
| catálogo comercial                    | `price_amount`, `compare_at_amount`, categoría y modalidades vigentes                                                                                                | precio/configuración actualmente visible en el catálogo                             | historia de precios, promoción aplicada, exposición o efecto incremental                                                      |
| NUMERA                                | resumen mensual por centro de costo con ingreso esperado, gasto real, presupuesto y variación                                                                        | existencia de una superficie económica separada                                     | margen por producto, canal o promoción requerido por esta tarea                                                               |

La ausencia de una evidencia en esta tabla no se interpreta como inexistencia global. Solo significa que no se usa como hecho demostrado para cerrar una definición oficial en `DATA-DOM-009`.

#### 6. Coordenada mínima del análisis comercial

Todo resultado comercial deberá conservar, cuando aplique:

| Coordenada                | Regla canónica                                                                      |
| ------------------------- | ----------------------------------------------------------------------------------- |
| definición analítica      | significado, fórmula o regla de agregación y versión                                |
| hecho base                | pedido, venta, pago, devolución, entrega u otro hecho explícito                     |
| periodo                   | ventana empresarial analizada                                                       |
| corte                     | instante hasta el cual se incorporan hechos y correcciones                          |
| sede                      | identidad canónica aplicable al hecho                                               |
| producto/oferta           | identidad y versión históricamente aplicables                                       |
| categoría comercial       | categoría vigente para el hecho o regla de reexpresión explícita                    |
| canal                     | `COMMERCIAL_CHANNEL` resuelto; nunca inferido silenciosamente desde `source`        |
| modalidad                 | delivery, pickup, on-premise u otra modalidad gobernada, separada del canal         |
| moneda                    | moneda original; conversiones quedan separadas y versionadas                        |
| tratamiento fiscal        | declara si la medida incluye o excluye impuestos                                    |
| descuentos y devoluciones | se muestran como componentes, no se absorben silenciosamente                        |
| estado del pedido/venta   | define población incluida y excluida                                                |
| estado del pago           | impide tratar un intento o rechazo como cobro confirmado                            |
| cliente                   | solo cuando exista identidad autorizada y finalidad compatible                      |
| cobertura                 | declara qué fuentes/canales están incluidos y qué queda fuera                       |
| calidad/certificación     | consume el estado definido por `DATA-DOM-007`                                       |
| versión de publicación    | consume `DATA-DOM-008` y `DATA-DOM-017` cuando el resultado se publique o reexprese |

#### 7. Matriz de las 11 familias comerciales

|    # | Familia canónica                             | Definición materializada                                                                                                                                          | Evidencia actual                                                                                                        | Estado para certificación                                                                  | Condición de salida / propietario exacto                                                                                                                                                                       |
| ---: | -------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|    1 | ventas netas y brutas                        | separar subtotal/base comercial, impuesto, descuento, devolución, venta neta y monto bruto reportado; declarar siempre base fiscal                                | Makos/POS conserva todos esos componentes; pedidos PULSO conservan subtotal y total                                     | `NO EVALUADO`                                                                              | modelo semántico y reconciliación en `DATA-INT-002`; calidad bajo `DATA-DOM-007`                                                                                                                               |
|    2 | pedidos y conversión                         | contar pedidos por población/estado; conversión requiere numerador y denominador de oportunidades elegibles en el mismo contexto                                  | pedidos PULSO observados; no se observó denominador gobernado de intención/oportunidad                                  | `BLOQUEADO` para conversión; `NO EVALUADO` para conteos de pedidos                         | captura/contrato del denominador en `DATA-INT-001`; materialización en `DATA-INT-002`                                                                                                                          |
|    3 | ticket y unidades                            | unidades = suma de cantidades compatibles; ticket = importe comercial definido dividido por transacciones elegibles, nunca por filas de producto                  | cantidades en Makos y líneas PULSO; pedidos PULSO permiten conteo parcial de transacciones                              | `NO EVALUADO`                                                                              | `DATA-INT-002` debe materializar población y base monetaria; cobertura externa sigue `DAT-01`, `DAT-02`, `DAT-03` y `INT-POS-001`, `INT-POS-002`, `INT-POS-005` a `INT-POS-009`, `INT-POS-020` y `INT-POS-023` |
|    4 | mezcla por producto, categoría, canal y sede | distribuir ventas/unidades sobre dimensiones gobernadas y reconciliar al total antes de comparar participaciones                                                  | producto, categoría y sede parciales; `source` y modalidad existen en pedidos                                           | `BLOQUEADO` para mezcla oficial por canal; `NO EVALUADO` para ejes con identidad resuelta  | mapping físico hacia `COMMERCIAL_CHANNEL` en `DATA-INT-003`; modelo en `DATA-INT-002`                                                                                                                          |
|    5 | demanda por franja, día y temporada          | distinguir demanda observada/satisfecha de demanda total; usar tiempo del hecho y calendario comparable                                                           | `sales_date` Makos y `created_at` de pedidos permiten serie observada                                                   | `NO EVALUADO` para demanda observada; `PENDIENTE_DE_EVIDENCIA` para estacionalidad robusta | cobertura histórica en `DAT-01`, `DAT-02`, `DAT-03` e `INT-POS-001`, `INT-POS-002`, `INT-POS-005` a `INT-POS-009`, `INT-POS-020` y `INT-POS-023`; calendario/modelo en `DATA-INT-002`                          |
|    6 | disponibilidad perdida                       | solo existe cuando una intención u oportunidad de compra coincide con indisponibilidad demostrada en el mismo producto/oferta, sede, canal y ventana              | no existe evidencia suficiente de intención perdida + disponibilidad histórica reconciliada                             | `BLOQUEADO`                                                                                | disponibilidad e inventario en `DATA-DOM-010`; unión semántica en `DATA-INT-002`                                                                                                                               |
|    7 | cancelaciones, devoluciones y descuentos     | separar cancelación de pedido, devolución monetaria/unidades y descuento; cada uno usa su propio denominador y corte                                              | estado `cancelled` en pedidos; `return_amount` y `discount_amount` en Makos; pagos admiten `refunded`                   | `NO EVALUADO`                                                                              | reconciliación de hechos en `DATA-INT-001`/`DATA-INT-002`; reexpresión histórica en `DATA-DOM-017` cuando aplique                                                                                              |
|    8 | promociones y efecto incremental             | descuento no prueba promoción; una promoción requiere versión/exposición; efecto incremental exige comparable o contrafactual gobernado y nivel de confianza      | no se observó una fuente operativa AURA habilitada; catálogo actual no prueba exposición promocional                    | `BLOQUEADO`                                                                                | exposición/promoción materializada en `DATA-INT-002`; causalidad/confianza en `DATA-DOM-014`; experimento cuando aplique en `DATA-DOM-016`                                                                     |
|    9 | recurrencia y frecuencia                     | medir repetición únicamente sobre identidad de cliente válida, finalidad autorizada y población explícita; invitados no se fusionan por similitud                 | pedidos soportan identidad de cliente en su contrato; cobertura de invitados/canales no está demostrada como completa   | `NO EVALUADO`                                                                              | protección de detalle en `DATA-AUTH-002`; modelo de población en `DATA-INT-002`                                                                                                                                |
|   10 | margen relacionado                           | consumir una métrica económica gobernada y asociarla a ventas/dimensiones sin recalcular costo o margen localmente                                                | NUMERA tiene superficie económica por centro de costo, pero no se demostró margen canónico por producto/canal/promoción | `BLOQUEADO`                                                                                | fórmula económica en `DATA-DOM-013`; binding semántico en `DATA-INT-002`                                                                                                                                       |
|   11 | capacidad comercial no utilizada             | comparar demanda/ventas contra una capacidad disponible definida en la misma unidad, sede, canal y ventana; ventas bajas por sí solas no prueban capacidad ociosa | no se observó denominador comercial gobernado y reconciliado                                                            | `BLOQUEADO`                                                                                | insumos de disponibilidad/capacidad en `DATA-DOM-010` y `DATA-DOM-011`; combinación en `DATA-INT-002`                                                                                                          |

**Reconciliación:** 11 familias esperadas; 11 materializadas; 0 faltantes; 0 duplicadas.

#### 8. Componentes monetarios observados en la importación Makos/POS

La implementación actual conserva los siguientes nombres técnicos como evidencia. Esta tarea no los transforma automáticamente en nuevas identidades de métrica.

| Campo técnico observado       | Semántica de la implementación actual                                      | Regla canónica de uso                                                                                          |
| ----------------------------- | -------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `subtotal_amount`             | subtotal recibido del archivo fuente                                       | conservar semántica de origen; no asumir inclusión de impuestos o descuentos distinta de la fuente             |
| `tax_amount`                  | impuestos recibidos del archivo fuente                                     | reportar por separado o declarar inclusión explícita                                                           |
| `discount_amount`             | descuentos recibidos del archivo fuente                                    | no atribuir a promoción sin regla/exposición identificada                                                      |
| `return_amount`               | devoluciones recibidas del archivo fuente                                  | no confundir devolución con cancelación de pedido                                                              |
| `net_sales_amount`            | implementación actual: `subtotal_amount - discount_amount - return_amount` | puede consumirse solo bajo la misma base y fuente reconciliada                                                 |
| `gross_sales_amount`          | implementación actual por fila: `subtotal_amount + tax_amount`             | se considera monto bruto con impuesto de esa implementación; no es intercambiable silenciosamente con subtotal |
| `total_quantity` / `quantity` | cantidad reportada en lote o línea                                         | su unidad comercial debe permanecer explícita; no equivale automáticamente a unidad de stock                   |

Regla de reconciliación para la fuente actual:

```text
NETO TÉCNICO MAKOS
=
SUBTOTAL
- DESCUENTOS
- DEVOLUCIONES
```

```text
BRUTO TÉCNICO MAKOS
=
SUBTOTAL
+ IMPUESTOS
```

Por tanto, `gross_sales_amount - net_sales_amount` no se interpretará como una única categoría de ajuste: mezcla impuestos, descuentos y devoluciones. Los reportes oficiales mostrarán la base fiscal o los componentes necesarios para evitar una lectura falsa.

#### 9. Contrato de ventas netas y brutas

La analítica de ventas deberá presentar los componentes y no una cifra ambigua denominada únicamente “ventas”.

Reglas:

1. el resultado declara si incluye o excluye impuestos;
2. descuentos y devoluciones se conservan como componentes separados;
3. una devolución tardía puede afectar un periodo ya publicado y deberá seguir `DATA-DOM-017`;
4. un pedido no se convierte automáticamente en venta por haber sido creado;
5. un pago aprobado no prueba por sí solo entrega o cierre de servicio;
6. una importación `draft` o con filas no resueltas no se presentará como una población comercial certificada;
7. un lote `posted` indica efecto operativo de publicación del lote, no certificación analítica;
8. ventas de fuentes distintas solo se suman cuando no representan el mismo hecho y comparten contrato de moneda, impuestos, ajustes y corte;
9. una venta externa conservará fuente y evidencia original suficiente para evitar doble conteo al migrar a PULSO nativo.

#### 10. Pedidos y conversión

Los conteos de pedidos se definen sobre identidades de pedido distintas y estados explícitos.

Poblaciones mínimas distinguibles:

```text
PEDIDOS CREADOS
PEDIDOS CONFIRMADOS
PEDIDOS ENTREGADOS
PEDIDOS CANCELADOS
PEDIDOS CON PAGO APROBADO
PEDIDOS REEMBOLSADOS
```

Estas poblaciones no son equivalentes y no se sustituyen entre sí por conveniencia de interfaz.

La conversión se define estructuralmente como:

```text
CONVERSIÓN
=
RESULTADOS ELEGIBLES COMPLETADOS
/
OPORTUNIDADES O INTENCIONES ELEGIBLES
```

Condiciones:

- numerador y denominador pertenecen al mismo canal, sede, periodo, población y corte;
- el denominador no se sustituye por pedidos creados si la pregunta es conversión desde visita, intención, sesión, oportunidad o carrito;
- si el denominador no existe o no está reconciliado, no se devuelve un porcentaje numérico;
- el contrato actual de pedidos demuestra hechos de pedido, pero no demuestra por sí mismo la población previa elegible; por eso la conversión oficial permanece `BLOQUEADO`.

#### 11. Ticket y unidades

Las unidades se agregan únicamente cuando la unidad comercial es compatible. Cantidad de líneas, cantidad de artículos y unidad de inventario son conceptos distintos.

El ticket se define mediante una base explícita:

```text
TICKET
=
IMPORTE COMERCIAL ELEGIBLE
/
TRANSACCIONES ELEGIBLES DISTINTAS
```

El artefacto que lo muestre deberá declarar:

- qué importe usa: subtotal, neto, total cobrado u otra base gobernada;
- si incluye impuestos;
- si incluye tarifa de entrega;
- si incorpora descuentos y devoluciones;
- qué estado convierte un pedido en transacción elegible;
- cómo trata devoluciones posteriores al corte.

Las filas de la importación Makos son filas por artículo y no constituyen evidencia de cantidad de tickets. Por tanto, no se calculará ticket total de esa fuente dividiendo ventas por `row_count`.

#### 12. Mezcla comercial

La mezcla puede expresarse en importe, unidades o transacciones, pero el denominador debe corresponder a la misma medida.

Dimensiones aprobadas para el contrato comercial:

- producto canónico;
- `CATEGORIA_COMERCIAL`;
- `COMMERCIAL_CHANNEL`;
- sede;
- `OFERTA_COMERCIAL` y versión cuando aplique;
- periodo y franja temporal;
- modalidad de cumplimiento como eje independiente cuando sea útil.

Reglas:

1. `orders.source` es procedencia técnica/operativa y no sustituye `COMMERCIAL_CHANNEL`;
2. `fulfillment_type` describe modalidad de cumplimiento y no sustituye `COMMERCIAL_CHANNEL`;
3. identificadores de Rappi, web, mensajería u otros proveedores se resuelven como claves externas o mappings del canal gobernado;
4. una categoría externa Makos no se convierte automáticamente en `CATEGORIA_COMERCIAL`;
5. toda mezcla debe reconciliar al total de su misma población antes de publicarse;
6. cambios posteriores de categoría, canal u oferta no recodifican historia sin restatement explícito.

#### 13. Demanda por franja, día y temporada

Se distinguen tres conceptos:

```text
DEMANDA OBSERVADA / SATISFECHA
→ pedidos o unidades efectivamente registradas bajo una fuente y cobertura conocidas

DEMANDA NO ATENDIDA DEMOSTRADA
→ intención elegible que no pudo convertirse por una restricción identificada y trazable

DEMANDA TOTAL O ESTIMADA
→ combinación o estimación que requiere metodología, cobertura y confianza explícitas
```

Reglas:

- una serie de ventas puede describir demanda observada, no demostrar demanda total;
- cero ventas durante una franja no demuestra cero demanda;
- producto fuera de catálogo, canal cerrado, falta de inventario, límite productivo, fallo técnico y dato faltante son causas distintas;
- franja, día, semana y temporada usan calendario y zona horaria gobernados;
- comparar temporadas exige cobertura comparable, días completos, sedes/canales equivalentes, catálogo y definición compatibles;
- la disponibilidad histórica de Makos/POS permanece condicionada por `DAT-01`, `DAT-02`, `DAT-03` y las tareas `INT-POS-001`, `INT-POS-002`, `INT-POS-005` a `INT-POS-009`, `INT-POS-020` y `INT-POS-023` aplicables.

#### 14. Disponibilidad perdida

La disponibilidad perdida no se calcula como “venta esperada menos venta real” sin evidencia.

Para declarar una oportunidad perdida deberán existir, en la misma coordenada:

- producto u oferta;
- sede;
- canal o contexto comercial;
- ventana temporal;
- evidencia de intención/oportunidad elegible o un método de estimación aprobado;
- evidencia de indisponibilidad o restricción;
- causa diferenciada cuando sea posible;
- cobertura y nivel de confianza.

No se inferirá falta de disponibilidad únicamente porque una referencia tenga cero ventas. Los datos de inventario y abastecimiento requeridos se definen en `DATA-DOM-010`; la unión analítica corresponde a `DATA-INT-002`.

#### 15. Precios y precio aplicado

La analítica de precios usa el valor efectivamente aplicado al hecho y preserva la configuración vigente como una referencia distinta.

Evidencia actual:

- el catálogo comercial conserva `price_amount` y `compare_at_amount` actuales;
- las líneas de pedido conservan `unit_price` y `total_amount`;
- la importación Makos conserva importes por artículo y cantidad.

Reglas:

1. `price_amount` actual no reescribe el precio histórico de una línea;
2. `compare_at_amount` no prueba por sí solo una promoción ni el descuento efectivamente aplicado;
3. un precio histórico se reconstruye desde la línea/hecho o desde una versión de `OFERTA_COMERCIAL` válida en ese instante;
4. comparar precios exige producto/oferta, sede, canal, moneda, unidad y vigencia compatibles;
5. un precio derivado como importe/cantidad se etiqueta como precio realizado de la fuente y no como tarifa oficial si no existe evidencia de la regla aplicada;
6. cambios materiales de definición, precio o tratamiento histórico se coordinan con `DATA-DOM-017`.

#### 16. Cancelaciones, devoluciones y descuentos

Las tres familias permanecen separadas:

```text
CANCELACIÓN
→ estado o transición del pedido/venta

DEVOLUCIÓN
→ reversión total o parcial de unidades o importe

DESCUENTO
→ reducción de precio o importe bajo una regla o condición
```

Reglas:

- una cancelación no se convierte automáticamente en devolución;
- un reembolso de pago no se trata como descuento;
- una devolución puede ocurrir en un periodo posterior a la venta original;
- una tasa de cancelación usa una cohorte de pedidos elegibles y un corte que permita observar el resultado;
- una tasa de devolución usa una base de ventas/unidades compatible;
- una tasa de descuento usa una base predescuento compatible;
- sin denominador positivo y reconciliado no se devuelve porcentaje numérico;
- los importes Makos observados pueden describir descuentos/devoluciones de esa fuente, pero no demuestran cobertura completa de todos los canales.

#### 17. Promociones y efecto incremental

Una promoción requiere, como mínimo:

- identidad o versión de la regla/promoción;
- oferta/productos elegibles;
- sede/canal/población;
- inicio y fin de vigencia;
- condición de elegibilidad;
- beneficio o mecánica;
- evidencia de exposición o aplicación;
- resultado observado;
- comparable, baseline o contrafactual cuando se pretenda medir incremento.

Reglas:

1. `discount_amount` no prueba qué promoción causó el descuento;
2. `compare_at_amount` no prueba exposición ni aplicación;
3. una diferencia antes/después puede ser un **lift descriptivo**, pero no se presenta como causal sin controlar cambios materiales;
4. un **efecto incremental causal** exige diseño y nivel de confianza suficientes;
5. estacionalidad, disponibilidad, precio, canal, catálogo y mezcla pueden explicar variaciones y deben controlarse según la metodología;
6. AURA permanece como fuente objetivo de campaña/intención promocional y no se sustituye con hojas, etiquetas o descuentos aislados mientras su fuente operativa siga bloqueada;
7. `DATA-DOM-014` gobierna causalidad/confianza del diagnóstico y `DATA-DOM-016` gobierna experimentos y comprobación cuando corresponda.

#### 18. Recurrencia y frecuencia

La recurrencia y frecuencia comercial se calculan únicamente sobre una identidad autorizada y una población definida.

Reglas:

- una persona identificada conserva identidad PASS; PULSO no crea una identidad analítica paralela;
- pedidos invitados no se fusionan por nombre, teléfono, dirección o similitud sin contrato de identidad y autorización;
- frecuencia cuenta transacciones elegibles por cliente y ventana;
- recurrencia declara la condición de retorno y la ventana de observación;
- la población excluye o separa clientes sin historial suficiente cuando el indicador lo requiera;
- una compra en una fuente no vinculable no se adjudica silenciosamente a un cliente existente;
- el detalle de cliente, cohortes pequeñas y comparaciones aplica `DATA-AUTH-002`.

La cobertura actual permite definir la semántica, pero no certificar que toda venta histórica esté vinculada a una identidad cliente.

#### 19. Margen relacionado

`DATA-DOM-009` no crea una fórmula financiera competidora.

El análisis comercial podrá consumir margen únicamente cuando `DATA-DOM-013` defina y gobierne la medida económica aplicable, incluyendo costo, moneda, reconocimiento, devoluciones y periodo.

Reglas:

- venta neta no equivale a margen;
- descuento no equivale a costo;
- ingreso esperado de un centro de costo no equivale a margen por producto o canal;
- una pantalla PULSO no recalcula margen localmente;
- cualquier desglose por producto, categoría, canal, sede o promoción debe reconciliar con la métrica económica fuente y conservar sus restricciones de granularidad.

Hasta esa dependencia, la familia permanece `BLOQUEADO` para publicación como margen oficial.

#### 20. Capacidad comercial no utilizada

La capacidad no utilizada requiere un denominador real y compatible.

Ejemplos de capacidades que no pueden mezclarse sin contrato:

- capacidad de inventario disponible para venta;
- capacidad productiva;
- capacidad de atención/servicio;
- capacidad logística de entrega;
- disponibilidad temporal del canal u oferta.

Reglas:

- ventas menores que un periodo previo no prueban capacidad ociosa;
- capacidad física y capacidad comercial se relacionan, pero no son la misma métrica;
- numerador y denominador deben compartir unidad, ventana, sede y alcance;
- restricciones múltiples deben conservar causa para evitar atribuir toda pérdida a una sola;
- `DATA-DOM-010` y `DATA-DOM-011` proveerán las definiciones de disponibilidad/capacidad de sus dominios cuando apliquen; `DATA-INT-002` materializará la combinación analítica.

La familia permanece `BLOQUEADO` hasta disponer del denominador gobernado.

#### 21. Tratamiento de canales

`COMMERCIAL_CHANNEL` es la única dimensión canónica de canal comercial definida para esta capa.

Los valores técnicos observados en pedidos como `vento_pass`, `pulso`, `pos` o `web` son procedencias registradas por la implementación y no se elevan automáticamente a identidades de canal.

La modalidad `delivery`, `pickup` u `on_premise` también permanece separada.

Todo binding físico de fuente/cuenta/proveedor/modalidad hacia `COMMERCIAL_CHANNEL` deberá:

- usar un código canónico del canal;
- preservar la clave externa y su fuente;
- conservar vigencia;
- evitar fusionar canales por nombre o proveedor compartido;
- mantener historia cuando el canal se retire o reconfigure;
- materializarse mediante `DATA-INT-003` antes de una mezcla oficial por canal.

#### 22. Tratamiento de cobertura Makos/POS externo

La fuente Makos/POS conserva el tratamiento de exportación controlada aprobado en `DATA-DOM-006` y `DATA-DOM-007`.

Reglas para análisis comercial:

- el archivo y hash permiten identificar el lote y evitar asumir que dos cargas son distintas por nombre;
- sede y fecha del lote no sustituyen la fecha propia del hecho cuando el archivo contenga más granularidad;
- filas sin mapping válido no se mezclan con producto canónico por similitud textual;
- `row_count` es cantidad de filas importadas, no cantidad de ventas o tickets;
- `matched_row_count` y `warning_count` son controles de ingestión, no KPI comerciales;
- un lote `validated` permite el siguiente paso operativo, pero no recibe por ello estado `CERTIFICADO`;
- la cobertura histórica no se extrapola más allá de la evidencia de `DAT-01`, `DAT-02` y `DAT-03`;
- una transición futura desde Makos a una fuente PULSO nativa deberá evitar doble conteo por fuente y vigencia.

#### 23. Tratamiento de pedidos PULSO

La superficie actual de pedidos permite observar, entre otros, estado, pago, importe, sede, fuente, modalidad, despacho y líneas de producto.

Para análisis:

- `created_at` es tiempo de creación del pedido, no necesariamente tiempo de venta, pago o entrega;
- `status = delivered` identifica un estado operativo de entrega, no sustituye el estado de pago;
- `payment_status` se analiza separadamente;
- `subtotal_amount`, `delivery_fee_amount` y `total_amount` no se colapsan;
- `order_items.unit_price` es evidencia del precio aplicado a esa línea observada;
- `source` conserva procedencia, no canal canónico;
- `fulfillment_type` conserva modalidad, no canal;
- cancelaciones tardías y reembolsos pueden cambiar la lectura de una cohorte y requieren corte reproducible.

#### 24. Calidad, certificación y publicación

Toda familia de esta tarea consume las reglas de `DATA-DOM-007` y `DATA-DOM-008`.

Reglas:

1. una definición `ESPECIFICADO` no equivale a resultado `CERTIFICADO`;
2. una fuente `NO EVALUADO` no se eleva por existir código o datos;
3. una dependencia `BLOQUEADO` impide publicar como certificado el resultado dependiente;
4. un resultado comercial declara versión, periodo, zona horaria, filtros, dimensiones, moneda/unidad, corte, frescura, cobertura y calidad;
5. una vista operativa en vivo no es un snapshot ni reporte oficial;
6. una exportación no amplía alcance de autorización;
7. las correcciones y restatements preservan versiones anteriores bajo `DATA-DOM-017`;
8. una cifra parcial puede mostrarse solo si su cobertura y limitación son explícitas y la política de publicación lo permite.

#### 25. Handoffs con propietario documental exacto

| Decisión o materialización fuera del alcance                                      | Propietario documental                                                                                                               | Condición de salida                                                            |
| --------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------ |
| disponibilidad, faltantes y cobertura de inventario que alimenten demanda perdida | `DATA-DOM-010`                                                                                                                       | antes de calcular pérdida atribuida a inventario                               |
| capacidad productiva que limite venta                                             | `DATA-DOM-011`                                                                                                                       | antes de atribuir capacidad comercial ociosa a producción                      |
| margen, costo y rentabilidad económica                                            | `DATA-DOM-013`                                                                                                                       | antes de publicar margen por producto/canal/promoción                          |
| causalidad, anomalías y nivel de confianza                                        | `DATA-DOM-014`                                                                                                                       | antes de presentar asociación como explicación causal                          |
| experimentos y comprobación de efecto                                             | `DATA-DOM-016`                                                                                                                       | antes de declarar efecto experimental comprobado                               |
| restatements, correcciones históricas y reproducibilidad                          | `DATA-DOM-017`                                                                                                                       | antes de reexpresar una publicación comercial previa                           |
| captura/contrato de fuentes comerciales y denominadores de conversión             | `DATA-INT-001`                                                                                                                       | antes de calcular conversión oficial con nueva fuente                          |
| capa semántica, agregaciones, joins, caché y snapshots                            | `DATA-INT-002`                                                                                                                       | antes de servir resultados comerciales compartidos                             |
| mapping físico de canales, productos y claves externas                            | `DATA-INT-003`                                                                                                                       | antes de segmentar oficialmente por `COMMERCIAL_CHANNEL` o consolidar externos |
| protección de detalle sensible, cliente y grupos pequeños                         | `DATA-AUTH-002`                                                                                                                      | antes de habilitar drill-down o cohortes sensibles                             |
| segregación de definición, certificación, publicación y administración            | `DATA-AUTH-003`                                                                                                                      | antes de conceder capacidades administrativas sobre métricas comerciales       |
| experiencia de tableros comerciales                                               | `DATA-UX-003`                                                                                                                        | antes de exponer filtros, comparación y drill-down de dominio                  |
| cobertura histórica de Makos/POS                                                  | `DAT-01`, `DAT-02`, `DAT-03` y `INT-POS-001`, `INT-POS-002`, `INT-POS-005` a `INT-POS-009`, `INT-POS-020` y `INT-POS-023` aplicables | antes de afirmar cobertura histórica más amplia o ejecutar backfill            |

No queda un bloqueo analítico material identificado por esta tarea sin propietario documental y condición de salida explícitos.

#### 26. Cobertura de prueba canónica preexistente

La protección requerida por esta tarea ya está contenida en requisitos DATA vigentes:

- `TREQ-DATA-002` exige que toda métrica o indicador tenga definición canónica versionada, fórmula, numerador/denominador, granularidad, dimensiones, filtros, unidad/moneda, tiempo, fuente, frescura, calidad, certificación, drill-down y comparabilidad; además asigna expresamente `DATA-DOM-009` dentro de sus tareas responsables;
- `TREQ-DATA-003` protege contratos de origen, cobertura, duplicados, integridad, datos tardíos, backfills, correcciones, reconciliación, linaje y prohíbe certificar reportes sobre fuentes vencidas, incompletas, degradadas o sin reconciliar;
- `TREQ-DATA-004` protege tableros/reportes/alertas/exportaciones/suscripciones, sus coordenadas de publicación y la separación entre vista viva, snapshot, reporte oficial, simulación y exportación; también asigna `DATA-DOM-009` dentro de sus responsables.

Las reglas comerciales materializadas aquí especializan esas obligaciones para ventas, demanda, precio, promociones y canal. No alteran la regla protegida, prioridad, modalidad, estado, relaciones ni destino de implementación de esos requisitos.

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** los requisitos DATA vigentes ya protegen de forma directa la definición reproducible de métricas comerciales, sus fuentes, denominadores, granularidad, calidad, reconciliación, publicación, cobertura y comparabilidad, y asignan esta familia de tareas como responsabilidad documental. `DATA-DOM-009` materializa la especialización comercial sin introducir comportamiento ejecutable, integración física, migración, cálculo productivo o publicación nueva.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

#### 27. Criterios de aceptación

1. las 11 familias reservadas por `CAP-SCOPE-017` están materializadas exactamente una vez;
2. no se confunden pedido, venta, pago, entrega, devolución, descuento y promoción;
3. `source`, modalidad de cumplimiento y `COMMERCIAL_CHANNEL` permanecen dimensiones distintas;
4. `COMMERCIAL_CHANNEL` conserva su identidad gobernada por PULSO y no se infiere desde etiquetas técnicas;
5. `CATEGORIA_COMERCIAL` y `OFERTA_COMERCIAL` se usan con vigencia histórica y no desde el estado actual por defecto;
6. producto, oferta, precio y disponibilidad permanecen conceptos distintos;
7. la semántica actual de `subtotal_amount`, `tax_amount`, `discount_amount`, `return_amount`, `net_sales_amount` y `gross_sales_amount` queda explícita;
8. el importe bruto con impuesto no se compara silenciosamente con un neto que excluye impuesto;
9. una importación Makos `validated` o `posted` no se presenta automáticamente como certificada;
10. `row_count` no se usa como número de tickets o ventas;
11. filas sin mapping válido no se mezclan con productos canónicos por similitud;
12. pedidos creados, confirmados, entregados, cancelados, pagados y reembolsados permanecen poblaciones distintas;
13. conversión no se calcula sin denominador elegible gobernado;
14. ausencia de denominador no se convierte en cero porcentual;
15. ticket declara base monetaria, tratamiento fiscal, tarifa de entrega, ajustes y población;
16. unidades no mezclan cantidad comercial, líneas e inventario sin contrato;
17. una mezcla por canal requiere mapping hacia `COMMERCIAL_CHANNEL`;
18. toda mezcla reconcilia al total de la misma población;
19. ventas observadas no se presentan como demanda total;
20. cero ventas no se interpreta como cero demanda;
21. demanda perdida requiere intención/oportunidad y evidencia de indisponibilidad en la misma coordenada;
22. disponibilidad histórica e inventario para demanda perdida permanecen en `DATA-DOM-010`;
23. `price_amount` actual no reescribe `order_items.unit_price` histórico;
24. `compare_at_amount` no prueba promoción aplicada;
25. un descuento no se atribuye a promoción sin identidad/exposición;
26. lift descriptivo y efecto causal permanecen separados;
27. efecto incremental causal consume causalidad/confianza de `DATA-DOM-014` y experimentación de `DATA-DOM-016` cuando aplique;
28. clientes invitados no se fusionan por similitud para fabricar recurrencia;
29. recurrencia y frecuencia aplican identidad/finalidad autorizadas y protección de `DATA-AUTH-002`;
30. venta neta no se presenta como margen;
31. margen comercial consume la definición económica de `DATA-DOM-013`;
32. capacidad comercial no utilizada no se calcula sin denominador compatible;
33. restricciones de inventario y capacidad se conservan por causa y propietario;
34. la cobertura histórica Makos no excede evidencia de `DAT-01`, `DAT-02`, `DAT-03` e `INT-POS-001`, `INT-POS-002`, `INT-POS-005` a `INT-POS-009`, `INT-POS-020` y `INT-POS-023`;
35. toda publicación conserva versión, periodo, corte, filtros, dimensiones, unidad/moneda, frescura, cobertura y calidad;
36. ninguna fuente o familia `BLOQUEADO` produce un resultado oficial certificado;
37. las correcciones históricas quedan gobernadas por `DATA-DOM-017`;
38. no se modifica código, SQL, Supabase, datos, migraciones, backfills, catálogos, pedidos ni importaciones;
39. no se crea ni modifica ningún requisito de prueba;
40. la continuidad queda exclusivamente en `DATA-DOM-010` como siguiente tarea reservada.

#### 28. Continuidad

ÚLTIMA TAREA APROBADA
`DATA-DOM-008 — Definir reportes, tableros, exportaciones, suscripciones, alertas y snapshots oficiales`

TAREA ACTUAL APROBADA
`DATA-DOM-009 — Definir analítica de ventas, demanda, precios, promociones y canales`

SIGUIENTE TAREA RESERVADA
`DATA-DOM-010 — Definir analítica de inventario, abastecimiento, proveedores y logística`


### [ ] DATA-DOM-010 — Definir analítica de inventario, abastecimiento, proveedores y logística
### [ ] DATA-DOM-011 — Definir analítica de producción, rendimiento, capacidad, merma y calidad
### [ ] DATA-DOM-012 — Definir analítica de servicio, clientes, fidelización, reputación y experiencia
### [ ] DATA-DOM-013 — Definir analítica de costos, rentabilidad, liquidez, presupuesto y escenarios
### [ ] DATA-DOM-014 — Definir diagnóstico transversal, anomalías, causas, oportunidades y nivel de confianza
### [ ] DATA-DOM-015 — Definir objetivos, líneas base, metas, drivers, guardrails y planes de medición
### [ ] DATA-DOM-016 — Definir acciones de mejora, experimentos, responsables, seguimiento y comprobación de resultados
### [ ] DATA-DOM-017 — Definir versionado de métricas, restatements, correcciones históricas y reproducibilidad
