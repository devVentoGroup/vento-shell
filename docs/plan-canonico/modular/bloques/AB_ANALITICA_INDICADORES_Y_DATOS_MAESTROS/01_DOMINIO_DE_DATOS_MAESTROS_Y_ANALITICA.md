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


### ✅ DATA-DOM-010 — Definir analítica de inventario, abastecimiento, proveedores y logística

**Estado:** APROBADA
**Tarea anterior:** `DATA-DOM-009 — Definir analítica de ventas, demanda, precios, promociones y canales` — APROBADA
**Tarea siguiente:** `DATA-DOM-011 — Definir analítica de producción, rendimiento, capacidad, merma y calidad` — RESERVADA
**Tipo de tarea:** documental; contrato canónico de analítica de inventario, abastecimiento, proveedores y logística
**Bloque:** AB — Analítica, indicadores y datos maestros
**Fase:** exclusivamente documental
**Implementación técnica:** no autorizada
**Código, DDL, DML, migraciones, backfills, cambios de datos, despliegues o publicación productiva de artefactos:** no autorizados

#### 1. Propósito

Definir la semántica analítica de inventario, abastecimiento, proveedores y logística de Vento OS sin convertir saldos, reportes, proyecciones o agregados en nuevas fuentes de verdad y sin adelantar la implementación física de modelos analíticos.

La tarea debe permitir responder de forma reproducible:

```text
qué existe físicamente
qué parte puede considerarse disponible
qué parte está comprometida, bloqueada, en tránsito o en cuarentena
cuánto tiempo cubre el inventario una demanda o consumo gobernados
qué rota y qué permanece
qué faltantes y quiebres están demostrados
qué cantidades vencen, se dañan o se pierden
qué diferencias detectan los conteos
qué tan completamente se preparan, despachan y reciben remisiones
qué tan completamente y a tiempo cumplen los proveedores
qué compras urgentes ocurrieron con evidencia suficiente
cómo se compara consumo real contra un plan compatible
qué costo de inventario puede publicarse sin redefinir NUMERA
qué capacidad de almacenamiento existe y cuánto se utiliza
```

Ningún resultado de esta tarea modifica stock, compras, órdenes, recepciones, proveedores, remisiones, lotes, ubicaciones, costos o datos operativos.

#### 2. Resultado sustantivo

Queda materializado el contrato `DATA-DOM-010` con los siguientes resultados:

- se cubren exactamente las **12 familias analíticas** heredadas de `CAP-SCOPE-017`;
- se separan existencia física, disponible, comprometida, bloqueada, cuarentena y tránsito;
- se define que disponibilidad es un derivado para un corte y contexto, no una fuente editable;
- se define cobertura en días únicamente contra un denominador de consumo o demanda gobernado y compatible;
- se separan rotación de permanencia y antigüedad;
- se separan faltante, quiebre, stock cero, indisponibilidad y dato no actualizado;
- se separan vencimiento, daño, pérdida, cuarentena y disposición;
- se materializa la semántica de diferencia de conteo a partir de cantidad contada y existencia del sistema en el corte del conteo;
- se separan solicitud, preparación, despacho, recepción, faltante y cierre de remisiones;
- se define el cumplimiento de proveedores sobre orden y recepción, sin inferir un `lead time` oficial desde timestamps insuficientes;
- se reconoce la recepción directa de emergencia de ORIGO como evidencia operativa de urgencia, sin convertirla en un carril canónico de compra urgente ya cerrado;
- se separa consumo real de plan, requisición, compra, remisión y forecast;
- se separa memoria operativa de costo de compra de valoración económica oficial de inventario;
- se bloquea la utilización de capacidad de almacenamiento hasta existir una capacidad física gobernada y una unidad compatible de ocupación;
- se preserva la regla de que una existencia negativa, nula o no actualizada se trata según su causa y no se oculta mediante agregación;
- no se crean claves nuevas de métricas por inferencia; los campos técnicos observados son evidencia de implementación, no identidades semánticas nuevas;
- cero cambios físicos y cero cambios de requisitos de prueba.

#### 3. Fronteras conceptuales obligatorias

```text
EXISTENCIA FÍSICA
≠ EXISTENCIA DISPONIBLE
≠ EXISTENCIA COMPROMETIDA
≠ EXISTENCIA BLOQUEADA
≠ EXISTENCIA EN CUARENTENA
≠ EXISTENCIA EN TRÁNSITO
```

```text
STOCK CERO
≠ FALTANTE DEMOSTRADO
≠ QUIEBRE DEMOSTRADO
≠ PRODUCTO NO INVENTARIABLE
≠ DATO NO RECIBIDO
```

```text
RESERVA
≠ PICK DE REMISIÓN
≠ DESPACHO
≠ SALIDA DE INVENTARIO
```

```text
VENCIDO
≠ DAÑADO
≠ PERDIDO
≠ CUARENTENA
≠ DISPUESTO
```

```text
SOLICITADO
≠ PREPARADO
≠ DESPACHADO
≠ RECIBIDO
≠ FALTANTE
≠ CERRADO
```

```text
ORDEN DE COMPRA
≠ RECEPCIÓN
≠ FACTURA
≠ MOVIMIENTO DE INVENTARIO
≠ HECHO ECONÓMICO
```

```text
COSTO DE COMPRA OBSERVADO
≠ COSTO UNITARIO DE INVENTARIO APROBADO
≠ VALORACIÓN CONTABLE
≠ GASTO
≠ MARGEN
```

```text
CAPACIDAD NOMINAL
≠ CAPACIDAD UTILIZABLE
≠ OCUPACIÓN
≠ EXISTENCIA
```

Una comparación solo es válida cuando conserva producto o familia comparable, unidad, presentación cuando aplique, sede, ubicación, periodo, corte, población, fuente, tratamiento de estados y versión semántica equivalentes o una transformación explícita y trazable.

#### 4. Autoridad y fuentes consumidas

La analítica de esta tarea conserva el gobierno federado aprobado.

| Elemento                                                                    | Autoridad funcional | Uso en esta tarea                           | Frontera                                                                        |
| --------------------------------------------------------------------------- | ------------------- | ------------------------------------------- | ------------------------------------------------------------------------------- |
| producto maestro, presentación, unidad y clasificación de inventario        | NEXO                | dimensiones físicas                         | no se reconstruyen por nombre ni por etiqueta externa                           |
| LOC, posición, lote, LPN, existencia, movimiento, conteo, ajuste y remisión | NEXO                | hechos y estados de inventario/logística    | existencia es derivada por corte; movimiento y conteo conservan su propio grano |
| proveedor, relación producto-proveedor y condición comercial                | ORIGO               | dimensiones de abastecimiento               | proveedor no se fusiona con contacto, cuenta o código externo                   |
| orden de compra y recepción empresarial                                     | ORIGO               | hechos de compra y cumplimiento             | una recepción no reescribe la orden ni sustituye el movimiento físico           |
| ejecución y consumo productivo                                              | FOGO                | consumo real cuando el análisis lo requiera | permanece separado del plan y de la compra                                      |
| venta y devolución comercial                                                | PULSO               | salidas comerciales cuando correspondan     | no redefinen inventario ni costo                                                |
| costo, valoración y efecto económico aprobado                               | NUMERA              | costo oficial y valoración                  | NEXO y ORIGO no redefinen la fórmula económica oficial                          |
| reglas comunes de métricas, calidad y publicación                           | BLOQUE AB           | semántica, certificación y artefactos       | no adquiere autoridad sobre hechos fuente                                       |

#### 5. Evidencia técnica actual observada

La implementación actual demuestra superficies materiales útiles, pero no convierte automáticamente sus agregados en métricas certificadas.

| Superficie observada                             | Evidencia material                                                                                                      | Qué sí demuestra                                                  | Qué no demuestra                                                                           |
| ------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| stock NEXO por sede y LOC                        | `current_qty`, `updated_at`, producto, sede, LOC y posición en las proyecciones vigentes                                | existencia física derivada actual y frescura técnica observable   | disponibilidad empresarial completa, reservas, cuarentena o historia certificada           |
| movimientos de inventario                        | entradas, salidas, transferencias, ajustes y efectos relacionados con procesos                                          | existencia de hechos de cambio de stock                           | que toda causa empresarial esté completa o reconciliada                                    |
| conteos NEXO                                     | cantidad contada, cantidad del sistema al abrir/cerrar, diferencia y aprobación antes de ajuste                         | diferencia de conteo explícita y auditable                        | conservación histórica completa de todos los conteos heredados                             |
| remisiones NEXO                                  | cantidad solicitada, preparada, despachada, recibida y faltante; estados y tiempos; picks por LOC/posición/presentación | seguimiento material de cumplimiento interno y parcialidad        | un contrato universal de reserva o inventario comprometido                                 |
| orden de compra ORIGO                            | proveedor, sede, estado, creación, fecha esperada, recepción, cantidades ordenadas/recibidas y costo de línea           | hechos actuales de orden y recepción comparables                  | que `created_at` sea inicio contractual de `lead time` o que toda parcialidad esté cerrada |
| recepción ORIGO                                  | proveedor, OC opcional, fecha, cantidades, costos, lote, vencimiento, ubicación y modo normal/emergencia                | recepción empresarial e inventariable con evidencia de emergencia | un carril de compra urgente integral ya regularizado                                       |
| memoria de costo proveedor-producto-presentación | último costo, promedios ponderados, cantidades, moneda y última recepción                                               | memoria operativa de costos reales de recepción                   | valoración económica oficial gobernada por NUMERA                                          |
| maestro de proveedores ORIGO                     | identidad, contacto, condición de pago, días de crédito y estado                                                        | catálogo operativo actual de proveedores                          | evaluación canónica de desempeño del proveedor                                             |

La ausencia de una evidencia en esta tabla significa únicamente que no se utiliza como hecho demostrado para certificar el resultado correspondiente.

#### 6. Coordenada mínima del análisis

Todo resultado de inventario, abastecimiento, proveedor o logística deberá conservar, cuando aplique:

| Coordenada            | Regla canónica                                                                     |
| --------------------- | ---------------------------------------------------------------------------------- |
| definición analítica  | significado, fórmula o regla de agregación y versión                               |
| hecho o estado base   | movimiento, conteo, existencia, remisión, orden, recepción u otro objeto explícito |
| producto              | identidad canónica; no nombre libre                                                |
| presentación y unidad | presentación aplicada y unidad de stock o unidad analítica compatible              |
| sede                  | sede del hecho o estado                                                            |
| LOC/posición          | ubicación física cuando el resultado dependa de ella                               |
| lote/LPN              | solo cuando exista identidad trazable aplicable                                    |
| proveedor             | identidad ORIGO cuando el análisis sea de abastecimiento                           |
| periodo               | ventana empresarial analizada                                                      |
| corte                 | instante hasta el cual se incorporan hechos, estados y correcciones                |
| moneda                | moneda original cuando exista valor monetario                                      |
| estado operativo      | población incluida/excluida y tratamiento de parciales, cancelados o cerrados      |
| cobertura             | fuentes, sedes, productos y periodos efectivamente observados                      |
| calidad/certificación | estado consumido de `DATA-DOM-007`                                                 |
| publicación           | contrato consumido de `DATA-DOM-008` y restatement cuando corresponda              |

#### 7. Matriz materializada de las 12 familias

|    # | Familia canónica                        | Definición materializada                                                                                                                                                                       | Evidencia actual                                                                                                                           | Certificación                                                                                     | Condición de salida / propietario exacto                                                                                                                                                                                     |
| ---: | --------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|    1 | existencia disponible y comprometida    | separar existencia física, comprometida, bloqueada/cuarentena, tránsito y disponible para un mismo corte; la disponible solo se calcula si todas las poblaciones requeridas están gobernadas   | stock por sede/LOC/posición; picks de remisión como compromiso parcial de un proceso                                                       | `NO EVALUADO` para existencia física; `BLOQUEADO` para disponible/comprometida global             | contrato integral de reservas/estados en `PROC-CAT-002`, `PROC-CAT-009` a `PROC-CAT-018`, `NEXO-UX-001`, `SUPA-AUD-019`, `SUPA-AUD-022`; binding en `DATA-INT-001` y `DATA-INT-002`                                          |
|    2 | cobertura y días de inventario          | dividir una existencia elegible por una tasa diaria compatible de demanda o consumo, conservando unidad, población, ventana y corte; sin denominador válido no existe valor numérico           | existencia actual; movimientos de consumo/salida parciales                                                                                 | `BLOQUEADO`                                                                                       | población de consumo/demanda en `DATA-DOM-009`, `DATA-DOM-011` y contratos fuente en `DATA-INT-001`; cálculo material en `DATA-INT-002`                                                                                      |
|    3 | rotación y permanencia                  | rotación compara flujo elegible con inventario medio compatible; permanencia/antigüedad se calcula sobre lote/cohorte o recepción demostrable y no desde el último movimiento por aproximación | movimientos e inventario actuales; lotes/vencimientos parciales                                                                            | `BLOQUEADO`                                                                                       | cierre de lote/vencimiento en `NEXO-DOM-023`, `PROC-CAT-002`, `CAP-SCOPE-013`; historia/modelo en `DATA-INT-001` y `DATA-INT-002`                                                                                            |
|    4 | faltantes y quiebres                    | un faltante exige requerimiento conocido no satisfecho; un quiebre exige indisponibilidad demostrada para una necesidad elegible; stock cero por sí solo no prueba ninguno                     | `shortage_quantity` y parcialidad en remisiones; validaciones de stock en preparación                                                      | `NO EVALUADO` para faltante explícito de remisión; `BLOQUEADO` para quiebre transversal           | disponibilidad integral conforme a la fila 1; consumo/demanda y unión con comercial en `DATA-DOM-009`, `DATA-INT-001` y `DATA-INT-002`                                                                                       |
|    5 | vencimiento, daño y pérdida             | vencimiento se deriva de existencia por lote y fecha; daño y pérdida son hechos explícitos con causa; cuarentena y disposición permanecen separados                                            | expiración parcial en recepción/lotes; ciclo integral de daño/pérdida no demostrado                                                        | `BLOQUEADO`                                                                                       | `NEXO-DOM-010`, `NEXO-DOM-017`, `PROC-CAT-009` a `PROC-CAT-018`; materialización analítica en `DATA-INT-001` y `DATA-INT-002`                                                                                                |
|    6 | diferencias de conteo                   | diferencia firmada = cantidad contada menos cantidad del sistema para el mismo producto/ubicación/corte; diferencia absoluta conserva magnitud sin ocultar signo                               | conteos guardan cantidad del sistema, cantidad contada y `quantity_delta` antes del ajuste                                                 | `NO EVALUADO`                                                                                     | historia de conteos en `DAT-11` y `NEXO-UX-018`; modelo/certificación en `DATA-INT-002` y `DATA-DOM-007`                                                                                                                     |
|    7 | cumplimiento de remisiones              | medir por separado preparación, despacho, recepción, faltante y cierre; los porcentajes se recomputan sobre cantidades compatibles y no se promedian por línea                                 | cantidades solicitadas/preparadas/despachadas/recibidas/faltantes y estados `partial`/`received`                                           | `NO EVALUADO`                                                                                     | reconciliación y modelo en `DATA-INT-001` y `DATA-INT-002`; calidad en `DATA-DOM-007`                                                                                                                                        |
|    8 | lead time y cumplimiento de proveedores | `lead time` inicia en el evento contractual de orden enviada/aceptada y termina en recepción aceptada; cumplimiento separa cantidad, fecha prometida, rechazo y parcialidad                    | OC con `created_at`, `expected_at`, `received_at`, cantidades ordenadas/recibidas; no se demuestra timestamp contractual de envío completo | `BLOQUEADO`                                                                                       | cierre de estados/parcialidad en `ORIGO-UX-007` a `ORIGO-UX-015`, `PROC-CAT-009` a `PROC-CAT-014`, `INT-PROC-001` a `INT-PROC-005`; evaluación derivada en `ORIGO-UX-001` y `PROC-CAT-019`                                   |
|    9 | compras urgentes                        | contar solo hechos explícitamente clasificados como urgentes/emergencia bajo un carril gobernado; una recepción directa no equivale por sí sola a compra urgente aprobada                      | ORIGO usa `entry_mode = emergency` sin OC y exige `emergency_reason`                                                                       | `NO EVALUADO` para recepciones de emergencia observadas; `BLOQUEADO` para compra urgente canónica | carril y regularización en `ORIGO-AUTH-005` a `ORIGO-AUTH-010` y `CAP-SCOPE-018`; modelo en `DATA-INT-002`                                                                                                                   |
|   10 | consumo versus plan                     | comparar consumo real con un plan explícito de la misma población, producto, unidad, sede y ventana; requisición, OC, remisión y forecast no sustituyen automáticamente el plan                | movimientos reales y distintas señales de necesidad; plan transversal no demostrado                                                        | `BLOQUEADO`                                                                                       | plan productivo en `DATA-DOM-011` y fuentes propietarias aplicables; contratos en `DATA-INT-001` y modelo en `DATA-INT-002`                                                                                                  |
|   11 | costo de inventario                     | valorar cantidad elegible mediante una base de costo aprobada y vigente; memoria de costo de compra es insumo operativo, no fórmula financiera oficial                                         | ORIGO conserva último/promedio ponderado por proveedor-producto-presentación y costos netos/brutos                                         | `NO EVALUADO` para costo de compra observado; `BLOQUEADO` para valoración oficial                 | definición económica en `DATA-DOM-013`; conciliación con NUMERA en `INT-PROC-004`; binding en `DATA-INT-002`                                                                                                                 |
|   12 | capacidad de almacenamiento             | ocupación/capacidad solo se calcula cuando existe capacidad utilizable gobernada y una unidad física compatible; volumen, peso, posiciones, pallets y unidades no se mezclan                   | LOC y posiciones existen; no se observó capacidad física gobernada en la implementación consultada                                         | `BLOQUEADO`                                                                                       | capacidad física, peso, volumen y compatibilidad en `NEXO-DOM-024`; parámetro de abastecimiento preservado por `OPS-LOG-001`; contrato de lectura en `DATA-INT-001` y modelo en `DATA-INT-002` antes de publicar utilización |

**Reconciliación:** 12 familias esperadas; 12 materializadas; 0 faltantes; 0 duplicadas.

#### 8. Existencia física, comprometida y disponible

##### 8.1. Existencia física

La existencia física para una coordenada válida representa la cantidad derivada de hechos de inventario aceptados hasta un corte.

La proyección técnica actual `current_qty` puede utilizarse como evidencia del estado vigente, pero no se presenta automáticamente como snapshot histórico ni como resultado certificado.

Cuando se reconstruya historia:

```text
existencia física al corte =
existencia inicial demostrable
+ entradas elegibles
+ transferencias recibidas
+ ajustes positivos válidos
- salidas elegibles
- transferencias despachadas
- ajustes negativos válidos
```

La fórmula física exacta debe consumir el catálogo de movimientos vigente; no se inventan tipos ni signos por nombre de interfaz.

##### 8.2. Existencia comprometida

Una cantidad solo se considera comprometida cuando existe un contrato de compromiso que declare:

- hecho que crea el compromiso;
- cantidad y unidad;
- producto/presentación/lote cuando aplique;
- sede/LOC cuando aplique;
- vigencia;
- prioridad cuando corresponda;
- evento de consumo, liberación, cancelación o expiración;
- idempotencia y reconciliación.

Los picks de remisión son evidencia actual de un compromiso físico dentro del proceso de remisiones. No prueban que exista una población universal de reservas para todos los procesos.

##### 8.3. Existencia disponible

Cuando todas las poblaciones sean completas y compatibles:

```text
existencia disponible =
existencia física elegible
- compromisos activos elegibles
- cantidad bloqueada o en cuarentena elegible
```

El tránsito se informa por separado salvo que el contrato del consumidor declare expresamente otra semántica.

No se aplica `max(0, ...)` en la capa analítica para ocultar una inconsistencia. Un resultado negativo conserva el valor observado y se clasifica como anomalía de calidad/reconciliación.

#### 9. Cobertura y días de inventario

La cobertura exige un numerador de existencia elegible y un denominador de consumo o demanda con la misma unidad y población.

Forma canónica:

```text
cobertura_días =
existencia elegible al corte
/
tasa diaria elegible
```

Reglas:

1. la tasa debe declarar fuente, ventana de estimación, días incluidos y exclusiones;
2. no se mezclan ventas, consumo productivo, merma, traslados o ajustes dentro del denominador sin definición explícita;
3. una tasa nula, ausente o no comparable no produce automáticamente infinito ni cero días;
4. cantidades de productos con unidades incompatibles no se suman antes de calcular cobertura;
5. un periodo de baja actividad no autoriza extender cobertura de forma engañosa;
6. metas o umbrales de cobertura no se fijan en esta tarea.

#### 10. Rotación y permanencia

Rotación y permanencia responden preguntas distintas.

```text
rotación
→ intensidad con la que una población de inventario se consume o sale respecto de una base media comparable

permanencia
→ tiempo que una unidad, lote o cohorte permanece bajo control de inventario
```

La rotación puede calcularse en cantidad o valor únicamente cuando numerador y denominador comparten la misma base. No se suman kilogramos, litros y unidades como si fueran una sola magnitud.

La permanencia requiere una fecha de entrada/cohorte/lote demostrable. El último movimiento del producto no se utiliza como fecha de adquisición de todas las unidades restantes.

#### 11. Faltantes y quiebres

Se distinguen:

| Concepto         | Regla                                                                                 |
| ---------------- | ------------------------------------------------------------------------------------- |
| stock cero       | estado de una proyección para una coordenada/corte                                    |
| faltante         | cantidad conocida que no pudo satisfacerse total o parcialmente                       |
| quiebre          | interrupción de disponibilidad para una necesidad elegible y demostrada               |
| indisponibilidad | estado empresarial que puede tener causa de stock, calidad, capacidad, horario u otra |
| no recibido      | ausencia de datos esperados                                                           |
| dato vencido     | dato cuya frescura no permite afirmar el estado actual                                |

La `shortage_quantity` de remisiones es evidencia de faltante dentro de ese proceso. No se extrapola a ventas perdidas ni a demanda no atendida sin la relación temporal y semántica exigida por `DATA-DOM-009`.

#### 12. Vencimiento, daño y pérdida

La analítica debe conservar los siguientes estados separados:

```text
próximo a vencer
vencido
bloqueado por calidad
cuarentena
dañado
perdido
dispuesto
ajustado
```

Reglas:

- un lote próximo a vencer exige fecha de vencimiento, cantidad positiva y corte; el horizonte de aviso es una regla/umbral gobernado, no se inventa aquí;
- un producto vencido no se convierte automáticamente en pérdida económica;
- daño exige evidencia de condición o evento;
- pérdida exige una causa y cantidad reconocidas;
- disposición exige su propio hecho y no borra el evento que originó el estado;
- un ajuste de inventario sin causa explícita no se reclasifica analíticamente como daño o pérdida;
- la cobertura global permanece bloqueada mientras el ciclo integral de daño, pérdida, vencimiento, cuarentena y disposición no esté cerrado.

#### 13. Diferencias de conteo

El conteo observado ya permite una semántica determinista:

```text
diferencia firmada =
cantidad contada
-
cantidad del sistema al cierre del conteo
```

También pueden derivarse, bajo definición versionada:

```text
diferencia absoluta = abs(diferencia firmada)
```

Una tasa relativa solo se calcula si existe un denominador válido. Cuando la cantidad del sistema es cero y la cantidad contada es positiva, la diferencia absoluta existe, pero una división porcentual por cero no se sustituye por `0%`.

El ajuste posterior es un hecho distinto del conteo y conserva su trazabilidad.

#### 14. Cumplimiento de remisiones

La remisión se analiza como secuencia, no como un único porcentaje.

```text
solicitado
→ preparado
→ despachado
→ recibido
→ faltante o diferencia, cuando exista
→ cierre
```

Se podrán materializar, sin promediar porcentajes de líneas:

- proporción preparada respecto de solicitado;
- proporción despachada respecto de solicitado;
- proporción recibida respecto de despachado;
- proporción recibida respecto de solicitado;
- cantidad faltante explícita;
- líneas parciales;
- tiempos entre hitos cuando sus timestamps sean válidos.

Para cualquier tasa:

```text
SUMA(numerador elegible)
/
SUMA(denominador elegible)
```

Un estado `partial` permanece parcial hasta el cierre correspondiente. `received + shortage` no autoriza presentar la remisión como recibida completamente cuando lo recibido no alcanza lo despachado.

#### 15. Lead time y cumplimiento de proveedores

El desempeño de proveedor no se almacena como opinión libre ni como atributo permanente del maestro sin base de hechos.

##### 15.1. Lead time

La semántica objetivo es:

```text
lead time de proveedor =
recepción aceptada
-
evento contractual de orden enviada/aceptada por el proveedor
```

`created_at` de una orden no se utiliza automáticamente como sustituto del evento contractual de inicio.

##### 15.2. Cumplimiento de cantidad

El cumplimiento cuantitativo compara cantidades recibidas aceptadas contra cantidades ordenadas de órdenes elegibles y cerradas. Recepciones parciales abiertas se mantienen separadas.

##### 15.3. Cumplimiento de fecha

Una fecha esperada solo se usa como promesa del proveedor si el contrato de ORIGO confirma esa semántica y su vigencia. La ausencia de una fecha prometida no se convierte en entrega tardía ni puntual.

##### 15.4. Evaluación de proveedor

Cualquier evaluación futura deberá derivarse de hechos gobernados, como cantidad, tiempo, rechazo, diferencia, reclamación o regularización, y conservar población, periodo, pesos y versión. No se crea una calificación compuesta arbitraria en esta tarea.

#### 16. Compras urgentes

La implementación observada distingue una recepción sin orden de compra mediante `entry_mode = emergency` y exige `emergency_reason`.

Esa evidencia permite contar y describir recepciones directas de emergencia, pero no autoriza afirmar que existe un carril empresarial completo de compra urgente.

La analítica de compra urgente deberá, cuando el carril esté cerrado, distinguir:

- necesidad urgente;
- autorización;
- proveedor;
- compra/recepción;
- motivo;
- regularización posterior;
- impacto en precio, tiempo y abastecimiento;
- excepciones o incumplimientos.

Hasta entonces:

```text
recepción de emergencia observada
≠ compra urgente canónica completamente regularizada
```

#### 17. Consumo versus plan

El análisis exige dos poblaciones distintas:

```text
PLAN
→ cantidad esperada/aprobada para una finalidad, sede, producto y ventana

CONSUMO REAL
→ hechos de salida/uso elegibles realmente registrados
```

No se trata como plan, por defecto:

- una orden de compra;
- una solicitud de remisión;
- una venta;
- un forecast financiero;
- un nivel mínimo;
- la existencia actual.

La comparación solo se materializa cuando el plan propietario y el consumo real usan una identidad de producto, unidad y ventana reconciliables. El plan productivo se especializa en `DATA-DOM-011`.

#### 18. Costo de inventario

La tarea distingue tres capas:

| Capa                         | Regla                                                                        |
| ---------------------------- | ---------------------------------------------------------------------------- |
| costo de compra observado    | costo real recibido por proveedor/producto/presentación conservado por ORIGO |
| base de costo de inventario  | criterio aprobado para valorar una cantidad física en un corte               |
| valoración económica oficial | resultado gobernado por NUMERA y especializado en `DATA-DOM-013`             |

La evidencia actual de ORIGO conserva costos netos, brutos, impuesto, costo por unidad de stock, último costo y promedios ponderados por cantidades recibidas. Esa memoria puede ser una fuente operacional de costo, pero no se convierte por esta tarea en la fórmula financiera oficial.

Forma conceptual futura, solo cuando exista base aprobada:

```text
valor de inventario al corte =
SUMA(cantidad elegible × costo unitario aprobado aplicable)
```

Reglas:

- moneda original explícita;
- conversiones de moneda separadas y versionadas;
- impuesto recuperable/no recuperable según definición financiera, no por inferencia analítica;
- cantidades negativas o inconsistentes no se corrigen mediante valor absoluto;
- costo de reposición, costo histórico, promedio, estándar y valor contable no se tratan como equivalentes.

#### 19. Capacidad de almacenamiento

La capacidad debe declararse para un recurso físico y una unidad definida.

Ejemplos de unidades que no son intercambiables sin conversión física aprobada:

```text
m3
kg
pallet positions
bins
unidades físicas
metros lineales
```

La utilización, cuando exista contrato completo, tendrá forma:

```text
utilización de capacidad =
ocupación elegible
/
capacidad utilizable elegible
```

No se infiere capacidad desde cantidad histórica máxima, cantidad actual, número de LOC ni número de posiciones. La capacidad utilizable puede ser menor que la nominal por seguridad, frío, incompatibilidades, acceso o configuración.

La implementación observada permite conocer LOC y posiciones, pero no demostró un atributo gobernado de capacidad física. Por ello la familia permanece bloqueada para publicación oficial.

#### 20. Tratamiento de existencia negativa, nula o no actualizada

Se preserva la regla canónica heredada:

> Una existencia negativa, nula o no actualizada se trata según su causa y no se oculta mediante agregación.

Aplicación analítica:

| Estado observado             | Tratamiento                                                                                       |
| ---------------------------- | ------------------------------------------------------------------------------------------------- |
| cantidad negativa            | anomalía o estado a reconciliar; conservar signo y contexto                                       |
| cantidad cero                | existencia cero para la coordenada si la fuente/corte son válidos; no implica quiebre por sí sola |
| fila ausente                 | no asumir cero sin contrato de población completa                                                 |
| `updated_at` vencido         | estado de frescura degradado; no afirmar disponibilidad actual                                    |
| ubicación sin stock          | no inventar stock en otra ubicación                                                               |
| diferencia sede/LOC/posición | incidente de reconciliación; no elegir silenciosamente una proyección                             |

#### 21. Unidades, presentaciones y agregación

Todo análisis cuantitativo preserva:

- unidad de stock;
- presentación física cuando sea relevante;
- factor de conversión vigente;
- cantidad original y cantidad convertida cuando el contrato lo requiera;
- procedencia del factor;
- lote/LOC cuando la unidad dependa de ellos.

Queda prohibido:

- sumar cantidades incompatibles;
- usar etiqueta de presentación como unidad;
- aplicar el factor actual retroactivamente si la transacción conservó otro factor;
- reemplazar cantidad original por cantidad normalizada sin trazabilidad;
- comparar cobertura o rotación entre productos solo porque sus valores numéricos son similares.

#### 22. Proveedor, orden y recepción

La cadena analítica conserva identidades separadas:

```text
PROVEEDOR
→ RELACIÓN PRODUCTO-PROVEEDOR
→ CONDICIÓN COMERCIAL / PRESENTACIÓN DE COMPRA
→ ORDEN DE COMPRA
→ LÍNEA DE ORDEN
→ RECEPCIÓN
→ LÍNEA RECIBIDA
→ MOVIMIENTO FÍSICO
→ EFECTO ECONÓMICO, cuando corresponda
```

Una recepción directa sin OC conserva su naturaleza y motivo. Una recepción contra OC conserva la relación con la orden y la línea. Una diferencia recibida no reescribe silenciosamente la cantidad ordenada.

#### 23. Relación con demanda perdida y capacidad comercial

`DATA-DOM-009` dejó bloqueadas disponibilidad perdida y capacidad comercial no utilizada hasta consumir una disponibilidad/capacidad demostrable.

Esta tarea aporta únicamente la dimensión de inventario:

```text
intención de compra demostrada
+
indisponibilidad de inventario demostrada
+
misma oferta/producto, sede, canal y ventana
→
puede alimentar una señal de disponibilidad perdida
```

No establece causalidad por sí sola. Una venta no realizada puede deberse a precio, horario, capacidad productiva, canal, pago, servicio u otra causa.

La unión material pertenece a `DATA-INT-002`; la capacidad productiva se especializa en `DATA-DOM-011`.

#### 24. Calidad, frescura y certificación

Toda familia consume las reglas de `DATA-DOM-007`.

Un resultado no podrá presentarse como certificado cuando:

- el stock o las recepciones estén fuera de frescura aplicable;
- falten poblaciones obligatorias;
- existan diferencias de reconciliación no resueltas;
- la unidad o conversión sea ambigua;
- la cobertura histórica sea desconocida;
- el estado de una remisión u OC no permita cerrar la población;
- la disponibilidad se haya calculado sin compromisos/bloqueos completos;
- el costo provenga de una base no aprobada;
- la capacidad física sea inferida y no gobernada.

No se fija un SLA universal de frescura ni un umbral universal de diferencia, cobertura, rotación, vencimiento, cumplimiento o capacidad.

#### 25. Publicación y drill-down

Todo tablero, reporte, exportación, alerta o snapshot que consuma estas familias deberá heredar `DATA-DOM-008` y declarar como mínimo:

- versión de definición;
- periodo y corte;
- zona horaria;
- sede y ubicaciones;
- productos/población;
- unidad y moneda cuando aplique;
- filtros;
- frescura;
- cobertura;
- calidad/certificación;
- fuente y drill-down autorizado.

El drill-down conserva la secuencia de hechos y no permite editar agregados para corregir la fuente.

#### 26. Handoffs documentales exactos

| Brecha o dependencia                                                                 | Tarea propietaria                                                                              | Condición de salida                                                        |
| ------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------- |
| contrato completo de existencia física, reservada, disponible, tránsito y cuarentena | `PROC-CAT-002`, `PROC-CAT-009` a `PROC-CAT-018`, `NEXO-UX-001`, `SUPA-AUD-019`, `SUPA-AUD-022` | antes de certificar disponibilidad/compromiso global                       |
| lotes y vencimientos de extremo a extremo                                            | `NEXO-DOM-023`, `PROC-CAT-002`, `CAP-SCOPE-013`                                                | antes de certificar permanencia y vencimiento global                       |
| ciclo de daño, pérdida, cuarentena y disposición                                     | `NEXO-DOM-010`, `NEXO-DOM-017`, `PROC-CAT-009` a `PROC-CAT-018`                                | antes de certificar pérdida física                                         |
| historia de conteos                                                                  | `DAT-11`, `NEXO-UX-018`                                                                        | antes de certificar series históricas de diferencias                       |
| cierre de OC, parcialidad y recepción                                                | `ORIGO-UX-007` a `ORIGO-UX-015`, `INT-PROC-001` a `INT-PROC-005`                               | antes de certificar cumplimiento de proveedores                            |
| evaluación de proveedor basada en hechos                                             | `ORIGO-UX-001`, `PROC-CAT-019`                                                                 | antes de publicar score o clasificación derivada                           |
| carril canónico de compra urgente                                                    | `ORIGO-AUTH-005` a `ORIGO-AUTH-010`, `CAP-SCOPE-018`                                           | antes de equiparar recepción de emergencia con compra urgente regularizada |
| historia operativa de compras y cantidades recibidas                                 | `DAT-06`, `DAT-07`, `ORIGO-UX-001`                                                             | antes de certificar comparaciones históricas de abastecimiento             |
| definición de consumo/plan productivo                                                | `DATA-DOM-011`                                                                                 | antes de certificar consumo versus plan productivo                         |
| definición económica de costo y valoración                                           | `DATA-DOM-013`, `INT-PROC-004`                                                                 | antes de publicar costo oficial de inventario                              |
| capacidad física utilizable de almacenamiento                                        | `NEXO-DOM-024`, `OPS-LOG-001`, `DATA-INT-001`                                                  | antes de materializar denominador de utilización                           |
| contratos analíticos de lectura/eventos                                              | `DATA-INT-001`                                                                                 | antes de ingestión productiva de las fuentes especializadas                |
| modelos, snapshots, cálculos y consultas                                             | `DATA-INT-002`                                                                                 | antes de materializar las familias como modelos analíticos productivos     |
| claves externas y reconciliación de maestros                                         | `DATA-INT-003`                                                                                 | antes de combinar proveedores/productos/ubicaciones desde fuentes externas |

No queda una brecha detectada por esta tarea sin propietario y condición de salida explícitos.

#### 27. Cobertura de requisitos de prueba vigente

La conducta documental de esta tarea ya queda protegida por los requisitos DATA vigentes que cubren:

- registro canónico versionado de métricas e indicadores;
- fuentes, granularidad, calidad, reconciliación, datos tardíos y linaje;
- publicación de reportes, dashboards, exportaciones y snapshots con contexto completo;
- integridad de datos maestros, presentaciones, unidades y relaciones históricas.

La especialización de estas reglas para las 12 familias no introduce un comportamiento ejecutable nuevo ni modifica una regla de prueba existente.

#### 28. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea especializa documentalmente familias analíticas ya cubiertas por requisitos DATA vigentes; no crea ni modifica comportamiento ejecutable, contratos físicos, autorizaciones, cálculos implementados, migraciones o efectos productivos.

#### 29. Criterios de aceptación

1. las 12 familias heredadas de analítica de inventario, abastecimiento, proveedores y logística están materializadas exactamente una vez;
2. existen 12 filas esperadas, 12 materializadas, 0 faltantes y 0 duplicadas;
3. existencia física, disponible, comprometida, bloqueada, cuarentena y tránsito permanecen conceptos distintos;
4. disponibilidad global queda bloqueada mientras no exista población completa de compromisos y bloqueos;
5. cobertura en días exige denominador compatible y no convierte ausencia o cero de denominador en un valor numérico arbitrario;
6. rotación y permanencia se definen por poblaciones y bases compatibles;
7. stock cero no se presenta automáticamente como faltante, quiebre o demanda perdida;
8. vencimiento, daño, pérdida, cuarentena y disposición no se colapsan;
9. diferencia de conteo conserva cantidad del sistema, cantidad contada, signo, corte y ajuste posterior separado;
10. remisiones conservan solicitado, preparado, despachado, recibido, faltante, parcialidad y cierre;
11. el cumplimiento de proveedor no usa `created_at` como `lead time` contractual sin evidencia;
12. recepción de emergencia no equivale automáticamente a compra urgente canónica regularizada;
13. consumo versus plan exige plan propietario y consumo real compatibles;
14. costo de compra observado no se presenta como valoración económica oficial;
15. capacidad de almacenamiento no se infiere desde máximos históricos ni conteos de ubicaciones;
16. cantidades y unidades incompatibles no se agregan;
17. existencia negativa, nula o no actualizada no se oculta mediante agregación;
18. los campos técnicos observados no se convierten por inferencia en nuevas identidades de métrica;
19. calidad y certificación consumen `DATA-DOM-007`;
20. publicación y snapshots consumen `DATA-DOM-008`;
21. los bloqueos y brechas tienen tareas propietarias y condiciones de salida exactas;
22. no se crea, modifica, difiere, descarta ni vuelve obsoleto ningún requisito de prueba;
23. no se ejecutan cambios físicos de código, datos, migraciones o Supabase;
24. `DATA-DOM-011` permanece únicamente reservada.

#### 30. Continuidad

```text
ÚLTIMA TAREA APROBADA
DATA-DOM-009 — Definir analítica de ventas, demanda, precios, promociones y canales

TAREA ACTUAL APROBADA
DATA-DOM-010 — Definir analítica de inventario, abastecimiento, proveedores y logística

SIGUIENTE TAREA RESERVADA
DATA-DOM-011 — Definir analítica de producción, rendimiento, capacidad, merma y calidad
```


### ✅ DATA-DOM-011 — Definir analítica de producción, rendimiento, capacidad, merma y calidad

**Estado:** APROBADA
**Tarea anterior:** `DATA-DOM-010 — Definir analítica de inventario, abastecimiento, proveedores y logística` — APROBADA
**Tarea siguiente:** `DATA-DOM-012 — Definir analítica de servicio, clientes, fidelización, reputación y experiencia` — RESERVADA
**Tipo de tarea:** documental; contrato canónico de analítica de producción, rendimiento, capacidad, merma y calidad
**Bloque:** AB — Analítica, indicadores y datos maestros
**Fase:** exclusivamente documental
**Implementación técnica:** no autorizada
**Código, DDL, DML, migraciones, backfills, cambios de datos, despliegues o publicación productiva de artefactos:** no autorizados

#### 1. Propósito

Definir la semántica analítica canónica para observar, comparar y explicar el desempeño productivo de Vento OS sin convertir una pantalla, un lote, un costo técnico, una existencia o una señal de demanda en una métrica oficial por inferencia.

La tarea materializa las diez familias productivas reservadas por el alcance aprobado:

1. demanda planificada versus producción;
2. capacidad disponible y utilizada;
3. adherencia al programa;
4. rendimiento teórico y real;
5. consumo estándar y real;
6. merma, reproceso y aprovechamiento;
7. calidad, retención y rechazo;
8. tiempo de ciclo;
9. cumplimiento de liberación;
10. costo y variación por lote, producto y sede.

Cada resultado deberá conservar la receta y versión aplicables, lote o ejecución, producto, unidad, sede, área, ventana temporal, corte, población, calidad y procedencia suficientes para reproducir el cálculo histórico.

La analítica no sustituye al expediente productivo. FOGO conserva la autoridad sobre planificación, orden, receta, ejecución, lote, consumos, rendimiento, merma, calidad, liberación y cierre productivo; NEXO conserva existencia y movimientos físicos; NUMERA conserva la definición económica oficial.

#### 2. Resultado material

Queda definido un contrato analítico productivo completo con:

- diez familias canónicas materializadas una sola vez;
- fórmulas y reglas de denominador cuando la fuente autoritativa existe;
- bloqueos explícitos cuando el denominador, evento o expediente aún no está cerrado canónicamente;
- separación entre señal, necesidad aceptada, plan, programa, orden, lote, ejecución, salida y liberación;
- separación entre capacidad nominal, disponible, comprometida, utilizada y perdida;
- comparación reproducible entre rendimiento teórico y real;
- comparación por ingrediente entre consumo estándar y real;
- taxonomía obligatoria para merma, reproceso, aprovechamiento, coproducto, subproducto y descarte;
- contrato de calidad que separa resultado de control, retención, disposición y liberación;
- semántica de tiempo de ciclo por hitos y no por una única fecha genérica;
- frontera entre costo técnico observado en FOGO y costo económico oficial gobernado por NUMERA;
- reglas para producción con múltiples salidas y asignación de costo sin doble conteo;
- handoffs exactos hacia tareas propietarias de las brechas todavía abiertas;
- cero cambios físicos y cero cambios al Registro Canónico de Requisitos de Prueba.

**Reconciliación del alcance:** 10 familias esperadas; 10 materializadas; 0 faltantes; 0 duplicadas.

#### 3. Fronteras conceptuales obligatorias

```text
SEÑAL DE DEMANDA
≠ NECESIDAD PRODUCTIVA ACEPTADA
≠ PLAN PRODUCTIVO
≠ PROGRAMA PUBLICADO
≠ ORDEN DE PRODUCCIÓN
≠ LOTE
≠ EJECUCIÓN
≠ SALIDA PRODUCTIVA
```

```text
PLANIFICADO
≠ TEÓRICO DE RECETA
≠ PRODUCIDO REAL
≠ EMPACADO
≠ LIBERADO
≠ INGRESADO A INVENTARIO
```

```text
CAPACIDAD NOMINAL
≠ CAPACIDAD DISPONIBLE
≠ CAPACIDAD COMPROMETIDA
≠ CAPACIDAD UTILIZADA
≠ CAPACIDAD COMERCIAL
```

```text
ADHERENCIA AL PROGRAMA
≠ CUMPLIMIENTO DE CANTIDAD
≠ RENDIMIENTO
≠ CALIDAD
```

```text
CONSUMO ESTÁNDAR
≠ CONSUMO REAL
≠ MERMA
≠ DESPERDICIO
≠ REPROCESO
```

```text
MERMA
≠ REPROCESO
≠ APROVECHAMIENTO
≠ COPRODUCTO
≠ SUBPRODUCTO
≠ DESCARTE
```

```text
PRODUCCIÓN TERMINADA
≠ CALIDAD CONFORME
≠ LOTE LIBERADO
≠ INVENTARIO DISPONIBLE
```

```text
COSTO TÉCNICO OBSERVADO
≠ COSTO ESTÁNDAR
≠ COSTO ECONÓMICO RECONOCIDO
≠ MARGEN
≠ RENTABILIDAD
```

Una cifra productiva solo será comparable cuando comparta definición, receta o puente explícito entre versiones, unidad, producto/salida, sede, área, ventana, corte, población, estado de calidad y cobertura.

#### 4. Autoridad y fuentes consumidas

| Elemento                                                      | Autoridad funcional      | Uso analítico                                 | Regla de frontera                                                            |
| ------------------------------------------------------------- | ------------------------ | --------------------------------------------- | ---------------------------------------------------------------------------- |
| señal de demanda comercial                                    | PULSO / PASS según hecho | insumo potencial de planificación             | no crea producción aprobada                                                  |
| necesidad, plan, programa, orden, lote y ejecución productiva | FOGO                     | hechos y artefactos productivos               | cada identidad y revisión permanece separada                                 |
| receta, versión, estándar de consumo y rendimiento esperado   | FOGO                     | base teórica                                  | la versión actual no sustituye la usada históricamente                       |
| producto, unidad, existencia, lote físico, LOC y movimientos  | NEXO                     | dimensiones y efectos físicos                 | el saldo no redefine producción ni calidad                                   |
| faltantes y lead times de compra                              | ORIGO                    | restricción potencial de capacidad/materiales | no modifica el plan FOGO por sí solo                                         |
| disponibilidad laboral                                        | VISO                     | restricción potencial de capacidad            | una asignación laboral no crea una orden productiva                          |
| disponibilidad y condición de equipos                         | NEXO                     | restricción potencial de capacidad            | activo disponible no equivale a capacidad productiva completa                |
| costo y resultado económico oficial                           | NUMERA                   | costo, variación y rentabilidad oficiales     | FOGO aporta hechos técnicos y consumos; no redefine reconocimiento económico |
| capa analítica                                                | BLOQUE AB                | cálculo, certificación y publicación          | nunca modifica el hecho fuente para cuadrar un indicador                     |

#### 5. Evidencia técnica actual observada

La implementación vigente demuestra capacidades productivas reales, pero no certifica automáticamente las diez familias analíticas.

| Superficie observada                | Evidencia material                                                                                                                                                | Qué sí demuestra                                                    | Qué no demuestra                                                                    |
| ----------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| lotes FOGO                          | `production_batches` conserva producto, sede, ruta, modo de salida, cantidad producida, cantidad esperada, empaque, costo, estado y fecha                         | existencia de lotes productivos reales con salida y resumen técnico | plan productivo canónico, programa, capacidad o calidad liberada                    |
| consumo real                        | `production_batch_consumptions` y captura de ingredientes conservan consumo real; el formulario distingue cantidad requerida y real                               | existencia de consumo efectivo por ejecución                        | que toda historia tenga estándar versionado y reconciliado                          |
| rendimiento                         | la superficie compara `produced_qty` y `expected_qty` y calcula diferencia y porcentaje                                                                           | existencia de comparación técnica esperada/real                     | que `expected_qty` sea por sí solo el estándar canónico escalado para toda historia |
| receta                              | `recipe_cards` conserva producto, sede, área, rendimiento y unidad; la creación de lote exige receta publicada                                                    | existencia de base de receta aplicable a ejecución actual           | cierre integral del contrato de versión histórica de receta                         |
| empaques                            | el lote conserva cantidad empacada y paquetes; cada paquete conserva esperado y real                                                                              | evidencia de salida física medida                                   | liberación de calidad o disponibilidad comercial                                    |
| múltiples salidas                   | `production_batch_outputs` distingue salida primaria, coproducto y subproducto, cantidades, unidades, destino y asignación porcentual de costo                    | existencia de producción multi-salida y asignación técnica          | equivalencia económica oficial o aprovechamiento/reproceso por inferencia           |
| efectos de inventario               | la creación productiva genera movimientos y actualiza existencia según modo de salida                                                                             | correlación técnica entre producción e inventario                   | cierre integral exactamente una vez de todos los contratos FOGO↔NEXO                |
| costo técnico                       | lote y salidas conservan costo total/unitario y eventos de costo derivados de consumos y asignación                                                               | existencia de una base técnica de costo de producción               | costo estándar/económico oficial, variación financiera o rentabilidad               |
| firma operativa                     | la creación de lote soporta firma de actor en dispositivo compartido                                                                                              | evidencia de actor técnico en el flujo actual cuando aplica         | validación integral de todas las autoridades de liberación y cierre                 |
| planificación, calidad y liberación | no se observó en las superficies técnicas consultadas un expediente completo de plan/programa/capacidad ni ciclo integral de control-retención-rechazo-liberación | evidencia insuficiente para certificación                           | no autoriza concluir inexistencia global; mantiene bloqueos documentales vigentes   |

Los nombres técnicos anteriores son evidencia de implementación. No crean nuevas identidades `metric_key` por sí solos y no sustituyen el registro semántico gobernado por `DATA-DOM-004`.

#### 6. Coordenada mínima del análisis productivo

Todo resultado productivo deberá conservar, cuando aplique:

| Coordenada             | Regla canónica                                                                                              |
| ---------------------- | ----------------------------------------------------------------------------------------------------------- |
| definición analítica   | fórmula, numerador, denominador, versión y estado                                                           |
| hecho o artefacto base | señal, necesidad, plan, programa, orden, lote, ejecución, consumo, salida, control o disposición explícitos |
| producto/salida        | identidad canónica del producto y rol de salida cuando haya múltiples salidas                               |
| receta y versión       | versión realmente aplicable al plan o ejecución                                                             |
| lote/ejecución         | identidad estable del hecho productivo                                                                      |
| sede y área            | contexto operativo aplicable al hecho                                                                       |
| ruta productiva        | ruta vigente cuando la comparación depende de proceso o recursos                                            |
| unidad                 | unidad canónica o conversión gobernada y reproducible                                                       |
| tiempo                 | ocurrencia y hitos específicos, no solo fecha de carga                                                      |
| ventana                | horizonte de plan, programa, turno, día, lote u otra población explícita                                    |
| corte                  | instante hasta el cual se incorporan hechos y correcciones                                                  |
| estado                 | estado productivo, calidad y liberación conservados por separado                                            |
| cobertura              | fuentes, sedes, productos, rutas y periodos incluidos/excluidos                                             |
| calidad/certificación  | consume el estado definido por `DATA-DOM-007`                                                               |
| versión de publicación | consume `DATA-DOM-008` y `DATA-DOM-017` cuando corresponda                                                  |

#### 7. Matriz materializada de las 10 familias productivas

|    # | Familia canónica                            | Definición materializada                                                                                                                                                                                                                          | Evidencia actual                                                                                                                                                   | Certificación                                                                             | Condición de salida / propietario exacto                                                                                                                                                                     |
| ---: | ------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
|    1 | demanda planificada versus producción       | compara una necesidad o cantidad planificada **aceptada por FOGO** contra producción elegible del mismo producto, versión/unidad, sede, ventana y revisión; señal, pedido, remisión o mínimo no sustituyen el plan                                | existen señales de demanda y lotes reales; `OPS-PLAN-001` a `OPS-PLAN-004` gobiernan levantamiento de evidencia, no un plan productivo definitivo                  | `BLOQUEADO`                                                                               | plan/revisión/horizonte y restricciones en `FOGO-UX-001`, `FOGO-UX-003`, `FOGO-UX-004`, `FOGO-UX-014`; contratos `INT-PROD-001` a `INT-PROD-005`; lectura/modelo en `DATA-INT-001` y `DATA-INT-002`          |
|    2 | capacidad disponible y utilizada            | capacidad disponible es el máximo ejecutable bajo recursos y restricciones válidas para una ventana; utilizada es el recurso realmente consumido bajo la misma unidad; no se mezclan horas, kg, lotes, estaciones o personas sin puente explícito | hay lotes, áreas, rutas, inventario y activos parciales; no se observó denominador integral de capacidad                                                           | `BLOQUEADO`                                                                               | capacidad y restricciones en `FOGO-UX-004`, `FOGO-UX-014`, `OPS-PRD-001`; equipos `NEXO-DOM-012`, `NEXO-DOM-026`; compras `ORIGO-UX-014`; integración `INT-PROD-001` a `INT-PROD-005`; modelo `DATA-INT-002` |
|    3 | adherencia al programa                      | mide cumplimiento de hitos de un programa publicado y versionado; inicio, finalización y cantidad se calculan por separado antes de cualquier indicador compuesto                                                                                 | no se observó programa productivo completo con hitos publicados y revisiones                                                                                       | `BLOQUEADO`                                                                               | programa/plan en `FOGO-UX-001`, `FOGO-UX-003`, `FOGO-UX-004`, `FOGO-UX-005` a `FOGO-UX-007`, `FOGO-UX-014`; eventos en `DATA-INT-001`; cálculo en `DATA-INT-002`                                             |
|    4 | rendimiento teórico y real                  | rendimiento teórico se deriva de la receta/version, escala y unidad aplicables; rendimiento real es la salida elegible medida; diferencia y cumplimiento se calculan únicamente tras reconciliar ambas bases                                      | FOGO conserva `yield_qty`, `expected_qty`, `produced_qty`, unidades y diferencia visual; el contrato histórico de versión/escala aún no está cerrado integralmente | `NO EVALUADO` para evidencia actual; `BLOQUEADO` para certificación histórica transversal | contrato de receta/versionado en `OPS-REC-001`, `FOGO-UX-008`, `FOGO-UX-009`, `FOGO-UX-010`, `FOGO-AUTH-013`; modelo histórico en `DATA-INT-002`                                                             |
|    5 | consumo estándar y real                     | estándar = cantidad aprobada por ingrediente desde receta/versión y escala; real = cantidad efectivamente consumida; la variación se calcula por ingrediente y unidad compatible, preservando sustituciones                                       | formulario FOGO distingue `required_qty` y `actual_qty`; existen consumos reales por lote                                                                          | `NO EVALUADO` para evidencia actual; `BLOQUEADO` para certificación histórica transversal | estándar/versionado en `OPS-REC-001` y `FOGO-UX-010`; cierre de consumo `INT-PROD-002`; lectura/modelo `DATA-INT-001` y `DATA-INT-002`                                                                       |
|    6 | merma, reproceso y aprovechamiento          | registra hechos explícitos y genealogía; cada categoría usa denominador declarado y no se deriva automáticamente de una diferencia de rendimiento                                                                                                 | no se observó ciclo integral ejecutable de merma/reproceso/aprovechamiento; multi-salida demuestra coproductos/subproductos, no reproceso                          | `BLOQUEADO`                                                                               | fuente/formato de merma `DAT-27`, `OPS-PLAN-004`, `FOGO-UX-010`; genealogía `FOGO-UX-011`, `OPS-TRZ-001`, `CAP-SCOPE-006`; modelo `DATA-INT-002`                                                             |
|    7 | calidad, retención y rechazo                | separa control realizado, resultado, conformidad, retención, rechazo, reproceso y liberación; tasas usan únicamente población inspeccionada o elegible declarada                                                                                  | no se observó un ciclo integral de controles de calidad y disposición en las superficies técnicas consultadas                                                      | `BLOQUEADO`                                                                               | planes/controles en `FOGO-UX-001`, `FOGO-UX-014`, `CAP-SCOPE-003`, `CAP-SCOPE-013`; disposición en `FOGO-UX-007`, `FOGO-AUTH-011`, `CAP-SCOPE-006`; modelo `DATA-INT-002`                                    |
|    8 | tiempo de ciclo                             | calcula duraciones entre hitos productivos explícitos; tiempo de espera, preparación, ejecución, pausa, retención y liberación permanecen separables                                                                                              | lotes actuales conservan `created_at`, pero una sola fecha no demuestra inicio/pausa/reanudación/fin/retención/liberación                                          | `BLOQUEADO`                                                                               | eventos de ejecución en `FOGO-UX-005` a `FOGO-UX-011`; captura en `DATA-INT-001`; modelo en `DATA-INT-002`                                                                                                   |
|    9 | cumplimiento de liberación                  | mide si lotes elegibles cumplen controles requeridos y son liberados por autoridad válida dentro de la ventana comprometida; producción terminada no cuenta como liberada                                                                         | no se observó expediente integral de liberación independiente de cierre productivo/inventario                                                                      | `BLOQUEADO`                                                                               | liberación/disposición en `FOGO-UX-007`, `FOGO-UX-014`, `FOGO-AUTH-011`; contrato de lote `OPS-TRZ-001`; lectura/modelo `DATA-INT-001` y `DATA-INT-002`                                                      |
|   10 | costo y variación por lote, producto y sede | conserva costo técnico observado por lote/salida como insumo; costo estándar, costo económico oficial y variación financiera consumen la definición económica gobernada, sin recalcularla localmente                                              | FOGO conserva `total_cost`, `unit_cost`, consumos y asignación porcentual en salidas; existen eventos técnicos de costo                                            | `NO EVALUADO` para costo técnico; `BLOQUEADO` para costo/variación económica oficial      | definición económica `DATA-DOM-013`; materialización semántica `DATA-INT-002`; conciliación con hechos productivos mediante contratos propietarios aplicables                                                |

**Reconciliación:** 10 familias esperadas; 10 materializadas; 0 faltantes; 0 duplicadas.

#### 8. Demanda planificada versus producción

La familia responde cuánto de una necesidad productiva formalmente aceptada y planificada fue producida dentro de una población comparable.

Forma mínima cuando exista plan gobernado:

```text
VARIACIÓN_DE_PRODUCCIÓN
:= PRODUCCIÓN_REAL_ELEGIBLE - PRODUCCIÓN_PLANIFICADA_ELEGIBLE

CUMPLIMIENTO_DE_PRODUCCIÓN
:= PRODUCCIÓN_REAL_ELEGIBLE / PRODUCCIÓN_PLANIFICADA_ELEGIBLE
```

El porcentaje solo existe cuando el denominador es positivo y ambas cantidades comparten producto, unidad, sede, ventana, revisión y reglas de inclusión.

No podrán actuar como denominador por sustitución:

- venta observada;
- pedido recibido;
- remisión solicitada;
- faltante de inventario;
- forecast financiero;
- mínimo de inventario;
- recomendación de un algoritmo;
- rendimiento teórico de receta.

Una señal puede originar o justificar una necesidad. Solo la decisión productiva propietaria puede convertirla en plan o revisión de plan.

Cuando una revisión cambie cantidad, fecha o prioridad, las comparaciones deberán identificar qué versión era vigente para la ventana observada y no reescribir el plan original.

#### 9. Capacidad disponible y utilizada

La capacidad se modela como una restricción multidimensional, no como una cifra universal.

Una capacidad productiva podrá depender de:

- personal disponible y competente;
- área y estación;
- equipos disponibles y en condición apta;
- materiales y lotes utilizables;
- receta y ruta productiva;
- tiempos de preparación y ejecución;
- almacenamiento o staging disponible;
- logística y ventana de salida;
- calidad, saneamiento y restricciones de contaminación cruzada;
- mantenimiento, pausas y bloqueos conocidos.

Forma general:

```text
UTILIZACIÓN_DE_CAPACIDAD
:= CAPACIDAD_UTILIZADA_COMPATIBLE / CAPACIDAD_DISPONIBLE_COMPATIBLE
```

Reglas:

1. numerador y denominador comparten unidad y ventana;
2. una hora-persona no se suma con una hora-equipo como si fueran la misma capacidad;
3. una capacidad nominal del fabricante no es automáticamente capacidad disponible;
4. una persona asignada no prueba competencia, presencia ni disponibilidad efectiva;
5. un equipo existente no prueba disponibilidad si está averiado, en mantenimiento o reservado;
6. material en inventario no prueba disponibilidad si está comprometido, retenido, vencido o fuera de la ventana;
7. cuando varias restricciones limitan una salida, la causa y el recurso limitante se conservan en vez de atribuir toda pérdida a un único factor;
8. capacidad productiva y capacidad comercial permanecen métricas distintas; `DATA-DOM-009` solo podrá consumir una proyección productiva compatible cuando esta familia salga de bloqueo.

#### 10. Adherencia al programa

La adherencia requiere un programa publicado, versionado y con hitos medibles.

Como mínimo se separarán:

- adherencia de inicio;
- adherencia de finalización;
- cumplimiento de cantidad programada;
- cumplimiento de secuencia o prioridad cuando exista regla explícita;
- producción adelantada;
- producción tardía;
- producción no programada;
- reprogramación aprobada.

Ejemplos de cálculos permitidos una vez exista el programa:

```text
ADHERENCIA_DE_INICIO
:= EJECUCIONES_INICIADAS_DENTRO_DE_TOLERANCIA / EJECUCIONES_PROGRAMADAS_ELEGIBLES

ADHERENCIA_DE_FINALIZACIÓN
:= EJECUCIONES_FINALIZADAS_DENTRO_DE_TOLERANCIA / EJECUCIONES_PROGRAMADAS_ELEGIBLES
```

La tolerancia deberá ser una regla versionada del indicador o del proceso. No se inventará localmente por dashboard.

No se promediarán porcentajes de lotes heterogéneos para obtener adherencia agregada cuando deba recomputarse el numerador y denominador sobre la población total.

#### 11. Rendimiento teórico y real

El rendimiento teórico pertenece al conocimiento productivo aplicable a la ejecución.

```text
RENDIMIENTO_TEÓRICO
:= SALIDA_ESPERADA_SEGÚN_RECETA_Y_VERSIÓN × ESCALA_APROBADA

RENDIMIENTO_REAL
:= SALIDA_REAL_ELEGIBLE_MEDIDA

VARIACIÓN_DE_RENDIMIENTO
:= RENDIMIENTO_REAL - RENDIMIENTO_TEÓRICO

VARIACIÓN_PORCENTUAL_DE_RENDIMIENTO
:= VARIACIÓN_DE_RENDIMIENTO / RENDIMIENTO_TEÓRICO

CUMPLIMIENTO_DE_RENDIMIENTO
:= RENDIMIENTO_REAL / RENDIMIENTO_TEÓRICO
```

Los porcentajes requieren rendimiento teórico positivo.

Reglas obligatorias:

1. receta raíz y versión son coordenadas distintas;
2. escala de ejecución debe reproducirse;
3. unidad teórica y real debe ser igual o convertible mediante regla aprobada;
4. si existe producción multi-salida, se conserva el rol de cada salida y no se suman cantidades incompatibles;
5. un coproducto o subproducto no se interpreta automáticamente como sobre-rendimiento de la salida principal;
6. el campo técnico `expected_qty` observado es evidencia de implementación, no autorización para omitir receta, versión, escala y unidad del cálculo canónico;
7. una desviación no modifica retroactivamente el rendimiento esperado de la receta;
8. las causas de desviación se conservan como hechos o clasificaciones evidenciadas y no se inventan desde el signo de la variación.

#### 12. Consumo estándar y real

La comparación se realiza por ingrediente o componente gobernado.

```text
CONSUMO_ESTÁNDAR_INGREDIENTE
:= CANTIDAD_ESTÁNDAR_DE_RECETA_Y_VERSIÓN × ESCALA_APROBADA

VARIACIÓN_DE_CONSUMO
:= CONSUMO_REAL - CONSUMO_ESTÁNDAR

VARIACIÓN_PORCENTUAL_DE_CONSUMO
:= VARIACIÓN_DE_CONSUMO / CONSUMO_ESTÁNDAR
```

Reglas:

- el porcentaje requiere estándar positivo;
- cada ingrediente conserva producto, unidad y conversión aplicable;
- sustituciones autorizadas se registran como sustituciones y no se fusionan con el ingrediente original por nombre;
- devoluciones o reversos se conservan como hechos posteriores y no reescriben silenciosamente el consumo original;
- cantidades de unidades incompatibles no se suman;
- consumo real no se deriva de diferencia de stock cuando existe un hecho de consumo autoritativo;
- la suma de consumo real por lote debe reconciliarse con los efectos físicos del dominio correspondiente antes de certificación;
- el resultado alimenta `DATA-DOM-010` para consumo versus plan de inventario únicamente mediante una población y unidad compatibles.

#### 13. Merma, reproceso y aprovechamiento

La analítica exige hechos clasificados explícitamente.

##### 13.1. Merma

Merma representa pérdida o reducción productiva identificada conforme a una taxonomía propietaria. No se deriva automáticamente de:

- menor rendimiento;
- consumo mayor al estándar;
- diferencia de inventario;
- producto retenido;
- subproducto;
- empaque incompleto.

Cuando exista una métrica de merma, deberá declarar el denominador. Por ejemplo, una tasa sobre insumo no es comparable con una tasa sobre salida esperada.

##### 13.2. Reproceso

Reproceso exige vínculo genealógico entre el material o lote origen, la decisión que autoriza reprocesar, la nueva ejecución y su resultado.

Un lote nuevo sin referencia al origen no puede contarse como reproceso por semejanza de producto, fecha o cantidad.

##### 13.3. Aprovechamiento

Aprovechamiento exige un resultado reutilizable o recuperado cuya identidad, cantidad, destino y autorización sean verificables.

Un coproducto o subproducto configurado como salida normal de receta no se reclasifica automáticamente como aprovechamiento.

##### 13.4. Descarte

Descarte es una disposición explícita. No es sinónimo de merma teórica ni de rechazo de calidad hasta que exista la decisión correspondiente.

La fuente histórica de merma permanece condicionada por `DAT-27`; su ausencia bloquea cualquier backfill presentado como completo.

#### 14. Calidad, retención y rechazo

Cada ejecución podrá producir múltiples controles y resultados. La analítica deberá conservar:

- plan o especificación de control y versión;
- producto, lote y etapa;
- característica controlada;
- método;
- instrumento cuando aplique;
- unidad;
- valor o resultado;
- límite o criterio aplicable;
- actor;
- tiempo;
- evidencia;
- resultado de conformidad;
- disposición posterior.

Se separan los siguientes conceptos:

```text
CONTROL_REALIZADO
≠ RESULTADO_CONFORME
≠ LOTE_RETENIDO
≠ LOTE_RECHAZADO
≠ REPROCESO_AUTORIZADO
≠ LOTE_LIBERADO
```

Una tasa de rechazo deberá declarar si su denominador son lotes, unidades, masa, volumen u otra población inspeccionada.

Un lote sin control requerido no se clasifica como conforme por ausencia de resultados negativos.

Una retención no equivale a rechazo. Una liberación posterior conserva el periodo retenido y la decisión que la produjo.

#### 15. Tiempo de ciclo

No existe un único tiempo de ciclo universal. Cada indicador debe declarar sus hitos.

Posibles hitos gobernados incluyen:

- necesidad aceptada;
- plan publicado;
- orden liberada;
- preparación iniciada;
- ejecución iniciada;
- pausa;
- reanudación;
- ejecución finalizada;
- control iniciado/finalizado;
- retención iniciada/finalizada;
- liberación;
- ingreso físico de salida;
- cierre productivo.

Ejemplos:

```text
TIEMPO_ACTIVO_DE_EJECUCIÓN
:= SUMA_DE_INTERVALOS_ACTIVOS

TIEMPO_FIN_A_FIN_PRODUCTIVO
:= HITO_FINAL_DEFINIDO - HITO_INICIAL_DEFINIDO

TIEMPO_DE_RETENCIÓN
:= LIBERACIÓN_O_DISPOSICIÓN - INICIO_DE_RETENCIÓN
```

Una sola marca `created_at` del lote no se interpreta como inicio y final simultáneamente.

Las pausas y esperas solo se excluyen del tiempo activo cuando existen eventos suficientes para reconstruir los intervalos.

#### 16. Cumplimiento de liberación

La liberación es una decisión productiva/calidad independiente de finalizar la producción.

Un lote cumple liberación cuando, para la población y versión aplicables:

1. todos los controles obligatorios están resueltos;
2. no existe retención activa incompatible;
3. la decisión fue emitida por autoridad válida;
4. el lote y versión inspeccionados corresponden al recurso liberado;
5. la decisión ocurrió dentro de la ventana o compromiso definido cuando el indicador mida puntualidad;
6. la evidencia mínima requerida está correlacionada;
7. cualquier reproceso o corrección aplicable se encuentra reconciliado.

Forma posible de puntualidad:

```text
LIBERACIONES_A_TIEMPO
:= LOTES_ELEGIBLES_LIBERADOS_DENTRO_DE_VENTANA

CUMPLIMIENTO_DE_LIBERACIÓN
:= LIBERACIONES_A_TIEMPO / LOTES_ELEGIBLES_CON_LIBERACIÓN_REQUERIDA
```

Un lote terminado pero no liberado permanece fuera del numerador.

Un lote rechazado no se presenta como liberación tardía; pertenece a una disposición distinta.

#### 17. Costo y variación por lote, producto y sede

La evidencia técnica actual conserva consumos reales, costo total/unitario de lote y asignación de costo para múltiples salidas. Esa base se clasifica como **costo técnico observado**, no como definición económica final.

Se distinguen:

| Capa                                 | Autoridad                                 | Uso permitido en DATA-DOM-011                                                            |
| ------------------------------------ | ----------------------------------------- | ---------------------------------------------------------------------------------------- |
| costo de insumo aplicado a ejecución | hecho técnico consumido por FOGO          | explicar la base observada del lote con procedencia                                      |
| costo técnico total del lote         | FOGO                                      | analizar consistencia y distribución técnica sin declararlo resultado financiero oficial |
| costo técnico asignado a salida      | FOGO                                      | observar asignación por salida y evitar doble conteo                                     |
| costo estándar                       | definición económica/productiva gobernada | consumir únicamente cuando `DATA-DOM-013` la materialice                                 |
| costo económico oficial              | NUMERA                                    | consumir; no recalcular localmente                                                       |
| variación económica                  | NUMERA + capa semántica                   | calcular según definición aprobada en `DATA-DOM-013`                                     |

En producción multi-salida:

- la suma de asignaciones técnicas no podrá exceder ni duplicar el costo total elegible;
- el método y versión de asignación deben conservarse;
- coproducto y subproducto conservan identidad y cantidad propias;
- valor cero o asignación cero no convierte una salida en merma;
- una reasignación económica posterior no reescribe la cantidad física producida.

Hasta `DATA-DOM-013`, no se publica como oficial una variación costo-real versus estándar por producto, lote o sede.

#### 18. Comparabilidad histórica de receta, versión y lote

Toda comparación histórica productiva conservará:

- receta raíz;
- versión exacta aplicable;
- producto de salida;
- roles de salida múltiples cuando existan;
- escala;
- ingredientes y sustituciones aplicables;
- rendimiento teórico;
- unidades y factores de conversión;
- ruta productiva cuando cambie el proceso;
- sede y área;
- vigencia de especificaciones y controles de calidad;
- corte analítico.

Reglas:

1. una receta publicada posteriormente no reemplaza la versión usada por un lote anterior;
2. comparar dos versiones diferentes requiere declarar el cambio o una reexpresión explícita;
3. una mejora de rendimiento por cambio de formulación no se presenta automáticamente como mejora operativa de ejecución;
4. un cambio de unidad no altera cantidades históricas; se aplica una conversión versionada y trazable;
5. una corrección posterior sigue `DATA-DOM-017`; no sobrescribe silenciosamente una publicación previa.

#### 19. Unidades, conversiones y agregación

Las métricas físicas solo se agregan cuando la magnitud y la conversión son compatibles.

Reglas obligatorias:

- masa con masa mediante conversión aprobada;
- volumen con volumen mediante conversión aprobada;
- unidades discretas con unidades discretas cuando representan la misma identidad o población;
- conversiones entre masa y volumen requieren una regla física/contextual explícita; no se asumen;
- presentaciones no se tratan como unidades de medida;
- factor de conversión vigente se conserva con el hecho o con una referencia reproducible;
- cantidades de salidas distintas no se suman para producir un “rendimiento total” si su unidad o rol no es comparable;
- porcentajes agregados se recomputan desde numeradores y denominadores compatibles.

#### 20. Producción con múltiples salidas

El modelo actual permite salida primaria, coproducto y subproducto. La analítica preservará esa semántica.

Para cada salida se conserva:

- identidad de producto;
- rol de salida;
- cantidad real;
- unidad;
- ubicación destino cuando aplique;
- porcentaje/método de asignación de costo observado;
- movimiento correlacionado cuando exista;
- relación con receta y lote.

Prohibiciones:

- sumar coproductos y producto principal como una sola cantidad si no existe unidad común y propósito definido;
- interpretar subproducto como desperdicio por su etiqueta;
- interpretar coproducto como aprovechamiento por defecto;
- duplicar costo total al sumar costos de lote y costos de cada salida;
- inferir calidad o liberación desde el hecho de que la salida ingresó técnicamente a inventario.

#### 21. Tiempo, ventanas y cortes

Para analítica productiva se distinguen:

```text
FECHA_DE_NECESIDAD
≠ FECHA_DE_PLAN
≠ FECHA_PROGRAMADA
≠ INICIO_REAL
≠ FIN_REAL
≠ FECHA_DE_CONTROL
≠ FECHA_DE_LIBERACIÓN
≠ FECHA_DE_INGRESO_A_INVENTARIO
≠ FECHA_DE_CIERRE
≠ FECHA_DE_PROCESAMIENTO_ANALÍTICO
```

Una observación tardía conserva su tiempo de ocurrencia original.

Un corte analítico declara hasta qué correcciones, resultados de calidad y liberaciones fueron incorporados.

Un lote que cambia de estado después del corte no modifica silenciosamente un snapshot ya publicado.

#### 22. Calidad y certificación analítica

La certificación de una familia productiva consume `DATA-DOM-007`.

Como mínimo deberá evaluar:

- completitud de plan/orden/lote según la familia;
- unicidad e identidad del lote y ejecución;
- receta y versión resolubles;
- unidades válidas y conversiones deterministas;
- integridad entre consumos, salidas y movimientos cuando correspondan;
- cobertura de sedes, productos y periodos;
- datos tardíos y correcciones;
- disponibilidad de hitos temporales;
- consistencia de estado productivo, calidad y liberación;
- reconciliación con NEXO cuando existan efectos físicos;
- frescura del modelo y corte de consulta.

El estado operativo `posted`, `completed` o equivalente de una implementación no se traduce a `CERTIFICADO` analítico.

Las familias bloqueadas en esta tarea no podrán publicarse como KPI oficial con un valor numérico fabricado desde proxies locales.

#### 23. Publicación, dashboards y snapshots

Toda publicación productiva consume `DATA-DOM-008`.

El artefacto deberá declarar, como mínimo:

- versión de la métrica;
- periodo y zona horaria;
- sede/área y producto o familia;
- receta/versión cuando afecte el resultado;
- filtros y estados incluidos;
- unidad;
- corte;
- frescura;
- cobertura;
- estado de calidad/certificación;
- tratamiento de lotes retenidos, rechazados, cancelados, reprocesados o corregidos;
- fuente y ruta de drill-down autorizada.

Vista en vivo, snapshot oficial, simulación, exportación y análisis exploratorio permanecen artefactos distintos.

#### 24. Handoffs entre analítica comercial, inventario y producción

`DATA-DOM-011` entrega dos fronteras que otras familias ya reservaron:

1. **Capacidad productiva para analítica comercial.** `DATA-DOM-009` podrá combinar una capacidad productiva certificada con demanda/venta únicamente cuando compartan producto/oferta resoluble, sede, canal cuando aplique, ventana y unidad. Una capacidad bloqueada aquí no puede convertirse en “capacidad comercial ociosa”.
2. **Consumo productivo para inventario.** `DATA-DOM-010` podrá utilizar consumo estándar/real como denominador o comparación únicamente cuando receta/version, unidad, población y corte sean compatibles. Diferencia de stock no sustituye consumo productivo cuando existe hecho autoritativo.

La combinación física y semántica pertenece a `DATA-INT-002` y no se implementa en esta tarea.

#### 25. Dependencias y bloqueos con propietario exacto

| Brecha o dependencia                                                  | Propietario documental                                                                       | Condición de salida                                                  |
| --------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- | -------------------------------------------------------------------- |
| plan productivo, revisión, horizonte, prioridad y overrides           | `FOGO-UX-001`, `FOGO-UX-003`, `FOGO-UX-004`, `FOGO-UX-014`, `FOGO-AUTH-008`, `FOGO-AUTH-012` | antes de certificar demanda planificada, capacidad o adherencia      |
| contrato canónico de receta y versión                                 | `OPS-REC-001`, `FOGO-UX-008`, `FOGO-UX-009`, `FOGO-AUTH-013`                                 | antes de certificar estándar histórico de rendimiento y consumo      |
| ejecución completa con inicio, pausa, parcialidad, excepción y cierre | `FOGO-UX-005` a `FOGO-UX-011`, `UX-QA-025`                                                   | antes de certificar ciclo de ejecución y cierre                      |
| cierre exactamente una vez de consumos/salidas con inventario         | `FOGO-UX-012`, `FOGO-UX-013`, `INT-PROD-001` a `INT-PROD-005`                                | antes de certificar reconciliación física productiva                 |
| capacidad de personal                                                 | `FOGO-UX-004`, `CAP-SCOPE-002`, `INT-PROD-001` a `INT-PROD-005`                              | antes de usar disponibilidad laboral como capacidad disponible       |
| capacidad/condición de equipos                                        | `NEXO-DOM-012`, `NEXO-DOM-026`, `FOGO-UX-014`                                                | antes de usar equipos como denominador de capacidad                  |
| disponibilidad de materiales/lotes                                    | `CAP-SCOPE-006`, `FOGO-UX-012`, `INT-PROD-001` a `INT-PROD-005`                              | antes de declarar capacidad ejecutable por materiales                |
| faltantes y lead times de compra                                      | `CAP-SCOPE-005`, `ORIGO-UX-014`, `INT-PROD-001` a `INT-PROD-005`                             | antes de incorporar abastecimiento externo a capacidad/promesa       |
| pesaje, premezclas, porcionamiento, kits y staging                    | `OPS-PRD-001`, `FOGO-UX-012`, `CAP-SCOPE-006`                                                | antes de incluir esos recursos en capacidad o tiempos estándar       |
| fuente histórica y formato de merma                                   | `DAT-27`, `OPS-PLAN-004`, `FOGO-UX-010`                                                      | antes de backfill o serie histórica certificada de merma             |
| genealogía de reproceso/aprovechamiento/subproducto/descarte          | `FOGO-UX-010`, `FOGO-UX-011`, `OPS-TRZ-001`, `CAP-SCOPE-006`                                 | antes de métricas certificadas de reproceso/aprovechamiento          |
| plan versionado de controles de calidad                               | `FOGO-UX-001`, `FOGO-UX-014`, `CAP-SCOPE-003`, `CAP-SCOPE-013`                               | antes de medir conformidad contra controles obligatorios             |
| retención, rechazo, reproceso y liberación independientes             | `FOGO-UX-007`, `FOGO-UX-014`, `FOGO-AUTH-011`, `CAP-SCOPE-006`                               | antes de métricas oficiales de calidad/liberación                    |
| identidad, genealogía y corrección de lote                            | `OPS-TRZ-001`, `FOGO-UX-011`, `FOGO-AUTH-012`                                                | antes de reexpresión histórica de lotes corregidos                   |
| costo estándar y costo económico oficial                              | `DATA-DOM-013`                                                                               | antes de publicar variación económica oficial por lote/producto/sede |
| contratos analíticos de lectura/eventos                               | `DATA-INT-001`                                                                               | antes de ingestión productiva automatizada de estas familias         |
| modelos semánticos, cálculos, snapshots y consultas                   | `DATA-INT-002`                                                                               | antes de materializar estas familias como modelos productivos        |

No queda brecha narrativa sin propietario documental exacto.

#### 26. Tratamiento de prioridades, restricciones y causas

Una desviación de producción no se atribuye automáticamente a una causa.

Los factores posibles pueden incluir, únicamente cuando exista evidencia:

- demanda o prioridad modificada;
- indisponibilidad laboral;
- indisponibilidad de equipo;
- material faltante o retenido;
- cambio de receta o ruta;
- espera de calidad;
- reproceso;
- avería;
- bloqueo logístico;
- cambio aprobado de programa;
- evento de continuidad.

Reglas:

1. una correlación temporal no demuestra causalidad;
2. una clasificación de causa debe provenir del expediente o de una regla diagnóstica gobernada;
3. el análisis causal transversal pertenece a `DATA-DOM-014`;
4. un dashboard puede mostrar “sin causa resuelta” sin inventar una causa dominante;
5. restricciones simultáneas pueden coexistir y deben conservar su evidencia.

#### 27. Cobertura de requisitos de prueba vigente

La especialización analítica definida aquí ya queda protegida por requisitos actuales y no introduce una obligación de prueba nueva independiente.

Cobertura principal:

- `TREQ-DATA-002` protege fórmula, numerador, denominador, granularidad, dimensiones, filtros, unidad, fuente, calidad, versión y reproducibilidad de toda métrica; su responsabilidad ya incluye `DATA-DOM-011`.
- `TREQ-DATA-003` protege contratos de origen, tiempos, granularidad, cobertura, datos tardíos, backfill, correcciones, reconciliación y linaje.
- `TREQ-DATA-004` protege publicación, corte, frescura, cobertura, calidad, snapshots y restatements de los resultados.
- `TREQ-FOGO-001` protege el ciclo del lote productivo, consumo, desperdicio, resultado, cierre, corrección y efectos de inventario.
- `TREQ-FOGO-002` protege receta/version, rendimiento esperado/real, merma, sustituciones y desviaciones sin sobrescribir conocimiento histórico.
- `TREQ-FOGO-003` protege planificación, revisión, capacidad, restricciones, prioridades, overrides y vínculo de órdenes con la versión del plan.
- `TREQ-FOGO-004` protege ejecución, calidad, liberación, rechazo, reproceso, genealogía y conciliación del cierre.

La tarea no modifica el alcance, prioridad, estado, relación ni destino de esos requisitos; únicamente especializa la semántica analítica que ya tenían asignada.

#### 28. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea especializa documentalmente fórmulas, poblaciones, denominadores y fronteras analíticas productivas ya protegidas por requisitos vigentes de métricas, calidad de datos, publicación, planificación, ejecución, receta/versionado, rendimiento, merma, calidad, liberación y reconciliación. No introduce un comportamiento ejecutable nuevo ni modifica el comportamiento protegido existente.

#### 29. Criterios de aceptación

`DATA-DOM-011` queda materializada cuando se cumplen simultáneamente los siguientes criterios:

1. las diez familias de analítica productiva aparecen exactamente una vez;
2. demanda planificada se separa de señal, pedido, remisión, mínimo y forecast;
3. producción planificada se separa de rendimiento teórico de receta;
4. plan, programa, orden, lote, ejecución y salida conservan identidades distintas;
5. ninguna familia usa un denominador inexistente para producir un porcentaje aparente;
6. capacidad nominal, disponible, comprometida, utilizada y comercial permanecen separadas;
7. capacidad solo agrega recursos bajo unidades y ventanas compatibles;
8. personal, equipos, materiales, almacenamiento y logística no se presumen disponibles por existir;
9. adherencia de inicio, finalización y cantidad pueden distinguirse;
10. una reprogramación aprobada conserva revisión e historia;
11. rendimiento teórico conserva receta/version, escala y unidad;
12. rendimiento real conserva salida, cantidad y unidad efectivamente medidas;
13. el campo técnico esperado no sustituye la definición semántica canónica;
14. múltiples salidas conservan rol y no inflan el rendimiento principal;
15. consumo estándar se deriva de receta/version y escala gobernadas;
16. consumo real consume hechos productivos y no diferencias de stock por aproximación;
17. variaciones de consumo se calculan por ingrediente y unidad compatible;
18. sustituciones permanecen explícitas;
19. merma no se infiere automáticamente desde menor rendimiento;
20. merma, reproceso, aprovechamiento, coproducto, subproducto y descarte permanecen separados;
21. reproceso exige genealogía verificable;
22. calidad separa control, resultado, conformidad, retención, rechazo, reproceso y liberación;
23. ausencia de un resultado negativo no equivale a conformidad;
24. finalización productiva no equivale a liberación;
25. liberación exige controles, autoridad, identidad del lote y evidencia aplicables;
26. tiempo de ciclo usa hitos declarados y no una fecha genérica;
27. pausas, esperas y retenciones solo se excluyen si existen eventos para reconstruirlas;
28. costo técnico observado no se presenta como costo económico oficial;
29. costo estándar y variación económica quedan bajo `DATA-DOM-013`;
30. producción multi-salida evita doble conteo de cantidades y costo;
31. comparación histórica conserva receta/version, unidad, sede, área, ruta y corte aplicables;
32. unidades incompatibles no se suman;
33. porcentajes agregados se recomputan desde poblaciones compatibles;
34. estado operativo de lote no equivale a certificación analítica;
35. publicación consume calidad, corte, cobertura y versión conforme a contratos vigentes;
36. capacidad productiva solo alimenta capacidad comercial mediante binding compatible en `DATA-INT-002`;
37. consumo productivo solo alimenta cobertura/plan de inventario mediante binding compatible;
38. cada bloqueo conserva tarea propietaria y condición de salida exactas;
39. no se crea ni modifica ningún requisito de prueba;
40. no se ejecuta ningún cambio físico de código, datos, migraciones o Supabase;
41. `DATA-DOM-012` permanece únicamente reservada.

#### 30. Continuidad

```text
ÚLTIMA TAREA APROBADA
DATA-DOM-010 — Definir analítica de inventario, abastecimiento, proveedores y logística

TAREA ACTUAL APROBADA
DATA-DOM-011 — Definir analítica de producción, rendimiento, capacidad, merma y calidad

SIGUIENTE TAREA RESERVADA
DATA-DOM-012 — Definir analítica de servicio, clientes, fidelización, reputación y experiencia
```


### ✅ DATA-DOM-012 — Definir analítica de servicio, clientes, fidelización, reputación y experiencia

**Estado:** APROBADA
**Tarea anterior:** `DATA-DOM-011 — Definir analítica de producción, rendimiento, capacidad, merma y calidad` — APROBADA
**Tarea siguiente:** `DATA-DOM-013 — Definir analítica de costos, rentabilidad, liquidez, presupuesto y escenarios` — RESERVADA
**Tipo de tarea:** documental; contrato canónico de analítica de servicio, clientes, fidelización, reputación y experiencia
**Bloque:** AB — Analítica, indicadores y datos maestros
**Fase:** exclusivamente documental
**Implementación técnica:** no autorizada
**Código, DDL, DML, migraciones, backfills, cambios de datos, despliegues o publicación productiva de artefactos:** no autorizados

#### 1. Propósito

Definir la semántica analítica de servicio y relación con clientes para que Vento OS pueda medir experiencia, cumplimiento, fidelización y reputación sin confundir hechos comerciales, identidad, casos de servicio, feedback, puntos, reservas, reputación pública ni efectos económicos.

La tarea materializa las doce familias reservadas por `CAP-SCOPE-017` y conserva las fronteras aprobadas por `CAP-SCOPE-009`, `CAP-SCOPE-010`, `CAP-SCOPE-011` y `CAP-SCOPE-014`.

El resultado deberá permitir responder de manera reproducible:

```text
qué se prometió al cliente
qué ocurrió realmente
cuánto tardó cada etapa
si el pedido se cumplió íntegramente
qué reclamo o solicitud existió
cómo y cuándo se resolvió
qué compensación fue decidida
qué feedback fue recibido
qué clientes regresan o dejan de hacerlo
cómo se adquieren y activan relaciones identificadas
cómo se comporta la fidelización
qué reputación pública existe
qué ocurre con reservas y no-show
qué valor económico puede atribuirse de forma autorizada
```

Ninguna de esas respuestas podrá fabricarse a partir de un único estado, un nombre, un teléfono, una calificación aislada, un saldo agregado o una ausencia de eventos.

#### 2. Resultado sustantivo

Queda definido el contrato `DATA-DOM-012` con los siguientes resultados:

- **12 de 12 familias canónicas** de analítica de servicio y clientes reciben definición explícita;
- **12 de 12 familias** reciben fuente propietaria, semántica, fórmula o regla de cálculo, estado de evidencia y condición de salida;
- **0 familias faltantes**;
- **0 familias duplicadas**;
- se separan promesa solicitada, compromiso aceptado y resultado real;
- se separan preparación, espera de despacho, tránsito y ciclo total;
- se impide interpretar `delivered` como prueba automática de pedido completo;
- se separan feedback, reclamo, conversación, devolución, compensación, reserva y reputación pública;
- se conserva identidad PASS y queda prohibida la fusión analítica de invitados por similitud;
- se define abandono como una condición de cohorte con ventana de observación y no como una etiqueta inferida por ausencia simple;
- se separan adquisición, registro de cuenta, activación, recurrencia y fidelización;
- se separan puntos ganados, gastados, ajustados y redenciones por estado;
- se impide tratar una redirección a Google Reviews como evidencia de reseña pública efectivamente publicada;
- se bloquea cualquier índice sintético de reputación sin fuentes, población, ponderación y método gobernados;
- se separan reserva, cancelación, asistencia, no-show y utilización de capacidad;
- se impide recalcular margen o rentabilidad de cliente dentro de este dominio;
- se aplican minimización, finalidad, consentimiento, segregación y protección de poblaciones pequeñas;
- no se crea un namespace nuevo de métricas ni se fabrican `metric_key` sin evidencia;
- se mantienen como no certificadas las familias cuya evidencia actual es parcial o cuyo contrato operativo todavía no existe.

#### 3. Alcance y entradas canónicas

Esta tarea consume sin reabrir:

- `DATA-DOM-001` a `DATA-DOM-008` para gobierno, maestros, hechos, ingestión, calidad y publicación;
- `DATA-DOM-009` para ventas, pedidos, demanda, recurrencia y frecuencia comercial;
- `DATA-DOM-010` para disponibilidad, abastecimiento y cumplimiento logístico interno;
- `DATA-DOM-011` para capacidad productiva cuando limite el servicio comercial;
- `CAP-SCOPE-009` para pedido, preparación, entrega, venta y pago;
- `CAP-SCOPE-010` para identidad de cliente, fidelización, reclamos, compensaciones, reservas y comunicaciones;
- `CAP-SCOPE-011` para entrega de pedido, promesa, intento, novedad y resultado;
- `CAP-SCOPE-014` para adquisición, oportunidades, reputación pública y atribución de Marketing;
- el contrato PASS de identidad, fidelización y servicio;
- el contrato PULSO de operación comercial y cumplimiento;
- la futura autoridad AURA para reputación pública y adquisición atribuida;
- NUMERA y `DATA-DOM-013` para cualquier interpretación económica de margen, rentabilidad o valor monetario protegido.

Esta tarea no implementa modelos analíticos, vistas, caché, snapshots, pipelines, eventos, tablas, RPC ni dashboards.

#### 4. Autoridad funcional y fronteras de dato

| Dominio / aplicación | Autoridad consumida por D012                                                                                                 | Frontera obligatoria                                                                    |
| -------------------- | ---------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- |
| `PULSO`              | pedido, preparación comercial, cumplimiento, despacho, entrega, intento, novedad, devolución y resultado transaccional       | PASS puede mostrar o iniciar flujos, pero no se vuelve autoridad de estados operativos  |
| `PASS`               | identidad de cliente, relación autenticada, fidelización, ledger, redenciones, experiencia de autoservicio y feedback propio | cuenta PASS no equivale a persona ni a toda relación comercial                          |
| `VISO`               | expediente administrativo de servicio cuando el proceso propietario corresponda a VISO                                       | no convierte feedback o chat de pedido en caso administrativo por inferencia            |
| `AURA` objetivo      | adquisición atribuida, oportunidades, reputación pública, comentarios externos y aprendizaje de Marketing                    | permanece fuente objetivo mientras AURA siga diferida y sin fuente operativa habilitada |
| `NEXO`               | hechos de inventario y logística que expliquen faltantes o incumplimiento físico                                             | no redefine pedido, cliente ni servicio                                                 |
| `FOGO`               | capacidad y hechos productivos que expliquen restricciones de preparación                                                    | no redefine promesa comercial ni cierre de servicio                                     |
| `NUMERA`             | costo, margen, rentabilidad y verdad económica                                                                               | D012 no recalcula localmente margen, contribución o rentabilidad                        |
| `BLOQUE AB`          | semántica, calidad, certificación, publicación y protección analítica                                                        | no adquiere propiedad sobre hechos operativos                                           |

Reglas raíz:

```text
IDENTIDAD DE CLIENTE ≠ CUENTA AUTENTICADA ≠ CONTACTO ≠ INVITADO
PEDIDO ≠ SERVICIO ≠ CASO ≠ RECLAMO ≠ FEEDBACK
PROMESA SOLICITADA ≠ PROMESA ACEPTADA ≠ RESULTADO REAL
DEVOLUCIÓN ≠ REEMBOLSO ≠ COMPENSACIÓN ≠ CORTESÍA ≠ AJUSTE DE PUNTOS
RATING INTERNO ≠ RESEÑA PÚBLICA
PUNTOS ≠ DINERO ≠ MARGEN
RESERVA ≠ PEDIDO ≠ ASISTENCIA ≠ NO-SHOW
REPETICIÓN ≠ FIDELIZACIÓN ≠ RETENCIÓN ≠ AUSENCIA
```

#### 5. Evidencia técnica actual observada

La evidencia actual demuestra superficies parciales suficientes para definir la analítica, pero no para certificar todas las familias.

##### 5.1. PULSO

La implementación observada expone pedidos con:

- `created_at`;
- `status`;
- `payment_status`;
- `fulfillment_type`;
- `dispatch_status`;
- `site_id`;
- `source`;
- importes de pedido;
- líneas con producto, cantidad, precio y total;
- eventos `order_status_events` con transición de estado, actor, operación y `created_at`;
- conversaciones y mensajes relacionados con pedido.

Los estados observados incluyen `pending`, `confirmed`, `preparing`, `ready_for_dispatch`, `in_transit` / `on_the_way`, `delivered` y `cancelled`.

La existencia de estos estados no prueba por sí sola:

- promesa aceptada;
- pedido completo;
- tiempo de preparación exacto;
- reclamo formal;
- resolución de caso;
- compensación;
- satisfacción;
- reserva;
- reputación.

##### 5.2. PASS

El contrato de presentación de pedidos observado incluye:

- `requested_for`;
- `schedule_mode`;
- `delivery_window_start`;
- `delivery_window_end`;
- `prepare_by`;
- `confirmed_at`;
- `ready_for_dispatch_at`;
- `on_the_way_at`;
- `delivered_at`;
- `cancelled_at`.

La línea de tiempo distingue pedido realizado, confirmado, listo, en camino, entregado y cancelado, y representa explícitamente la ausencia de una hora cuando no existe timestamp.

PASS también conserva evidencia actual de:

- `pass.loyalty_transactions` con movimientos `earn`, `spend` y `adjust`;
- `pass.loyalty_redemptions` con estados `pending`, `validated` y `cancelled`;
- `user_feedback` con `rating`, texto, categoría, sede, usuario y estado;
- flujo de rating que puede redirigir a una página externa de Google Reviews;
- chats y seguimiento de pedido.

La redirección hacia una plataforma externa no constituye evidencia de que una reseña haya sido publicada allí.

##### 5.3. Servicio integral y reservas

`CAP-SCOPE-010` mantiene como brechas actuales:

- ausencia de expediente omnicanal único;
- falta de categorías, severidad, propietario, SLA, escalamiento y cierre integral de casos;
- ausencia de expediente común para devolución, reembolso, compensación, cortesía y puntos;
- ciclo integral de reservas no confirmado;
- reglas de capacidad, depósito, cancelación, no-show y conversión de reserva aún no cerradas.

Por tanto, esas familias se definen documentalmente pero permanecen bloqueadas para certificación donde corresponda.

##### 5.4. Reputación y adquisición

`CAP-SCOPE-014` asigna a AURA la reputación pública, comentarios externos, oportunidades y atribución. La fuente operativa AURA permanece diferida; no se considera habilitada por la existencia de feedback interno ni por una URL de reseñas.

#### 6. Reglas semánticas transversales

1. Toda tasa declara numerador, denominador, población, ventana, corte y estados elegibles.
2. Todo tiempo exige dos eventos reales y ordenables; un estado sin timestamp no inventa duración.
3. Una ausencia de evento no se transforma automáticamente en cero.
4. Un evento tardío conserva su tiempo de ocurrencia y su tiempo de carga.
5. Cancelación, devolución, rechazo, compensación y no-show no se colapsan en un único estado negativo.
6. Un pedido terminal no demuestra integridad de líneas.
7. Una persona sin identidad autorizada no se fusiona con otra para fabricar recurrencia.
8. La identidad analítica se resuelve mediante contratos de identidad y finalidad, no por similitud de nombre, teléfono, correo o dirección.
9. Un agregado de puntos no sustituye el ledger.
10. Una calificación no crea automáticamente un caso.
11. Una respuesta pública no cierra un reclamo formal.
12. Una métrica de cliente no puede exponer detalle personal fuera de la finalidad autorizada.
13. Cohortes pequeñas o sensibles deberán aplicar las restricciones de `DATA-AUTH-002`.
14. Una correlación entre servicio y recurrencia no se presentará como causa sin `DATA-DOM-014`.
15. Metas, umbrales objetivo y guardrails pertenecerán a `DATA-DOM-015`.
16. Experimentos de mejora pertenecerán a `DATA-DOM-016`.
17. Correcciones históricas y restatements pertenecerán a `DATA-DOM-017`.

#### 7. Matriz materializada de las 12 familias

|    # | Familia canónica                                        | Definición materializada                                                                                                                                                    | Evidencia actual                                                                                     | Certificación                                                                                    | Condición de salida / propietario exacto                                                                                                                          |
| ---: | ------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|    1 | cumplimiento de promesa                                 | comparar un compromiso aceptado y versionado contra el evento terminal aplicable; solicitud o ventana pedida no equivale a promesa aceptada                                 | existen `requested_for`, ventanas, `prepare_by` y estados de cumplimiento                            | `BLOQUEADO` para promesa oficial                                                                 | contrato de promesa y cumplimiento en `PULSO-UX-004`, `PULSO-UX-007`, `PULSO-UX-019`, `PROC-CAT-009` a `PROC-CAT-018`; binding en `DATA-INT-001` y `DATA-INT-002` |
|    2 | tiempos de preparación, despacho y entrega              | medir cada fase entre eventos reales y compatibles; no usar un tiempo total como sustituto de todas las fases                                                               | existen varios timestamps de ciclo y eventos de estado                                               | `NO EVALUADO` para fases observables; `BLOQUEADO` donde falten hitos                             | contrato de eventos en `PULSO-UX-007`, `PULSO-UX-018`, `PULSO-UX-019`; lectura/modelo en `DATA-INT-001` y `DATA-INT-002`                                          |
|    3 | pedidos completos                                       | un pedido es completo solo cuando todas las líneas y cantidades elegibles quedan cumplidas o sustituidas de forma aceptada; `delivered` no basta                            | pedido y líneas existen, pero no se demostró cumplimiento línea a línea integral                     | `BLOQUEADO`                                                                                      | ciclo comercial y modificaciones en `PULSO-UX-007`, `PULSO-UX-009`, `PULSO-UX-013`, `PROC-CAT-013`, `PROC-CAT-014`; modelo en `DATA-INT-002`                      |
|    4 | reclamos y tiempo de resolución                         | reclamo es un expediente explícito; tiempo de resolución usa recepción y resolución reales, y SLA exige versión aplicable                                                   | chat y feedback existen, pero no expediente omnicanal integral                                       | `BLOQUEADO`                                                                                      | `PROC-CAT-009` a `PROC-CAT-019`, `PROC-ACTOR-001` a `PROC-ACTOR-010`, `VISO-UX-013` a `VISO-UX-020`, `PASS-UX-010`                                                |
|    5 | compensaciones                                          | contar y valorar únicamente decisiones explícitas de compensación; devolución, reembolso, descuento, cortesía, cupón y puntos permanecen resultados distintos               | existen devoluciones, refunds, descuentos y puntos en dominios separados                             | `BLOQUEADO`                                                                                      | expediente y autoridad en `PULSO-UX-009`, `PULSO-AUTH-008`, `PASS-INT-002`, `CAP-SCOPE-012`; binding en `DATA-INT-002`                                            |
|    6 | satisfacción y feedback                                 | medir distribución y estadísticos sobre feedback válido; respuesta a invitación requiere evento de invitación entregada; rating interno no equivale a review externo        | `user_feedback` registra rating, texto y categoría; existe prompt de rating                          | `NO EVALUADO` para feedback interno; `BLOQUEADO` para tasa de respuesta si no existe denominador | sesgo y experiencia en `PASS-UX-006`, `UX-QA-029`; modelo en `DATA-INT-002`; protección en `DATA-AUTH-002`                                                        |
|    7 | recurrencia, frecuencia y abandono                      | reutilizar identidad y recurrencia de D009; abandono exige población elegible, ventana de inactividad y observación completa, no simple ausencia                            | pedidos identificados y ledger PASS permiten señales parciales                                       | `NO EVALUADO`                                                                                    | identidad/finalidad en `PASS-INT-004`, `PASS-INT-005`, `DATA-AUTH-002`; población/modelo en `DATA-INT-002`                                                        |
|    8 | adquisición y activación                                | adquisición exige primer evento de relación con origen gobernado; activación exige evento objetivo versionado dentro de una ventana; crear cuenta o iniciar sesión no basta | no se demostró fuente canónica de adquisición ni evento de activación transversal                    | `BLOQUEADO`                                                                                      | oportunidades y origen en `AURA-DOM-007`, `AURA-INT-001`, `AURA-INT-002`; identidad en `PASS-INT-005`; modelo en `DATA-INT-002`                                   |
|    9 | fidelización, puntos y redenciones                      | movimientos `earn`, `spend`, `adjust` y redenciones por estado se analizan separados; saldo es proyección reconciliable del ledger                                          | existen `loyalty_transactions` y `loyalty_redemptions`                                               | `NO EVALUADO`                                                                                    | contrato de ledger/redención en `PASS-INT-001`, `PASS-INT-002`, `PASS-QA-001`, `PASS-QA-002`; modelo en `DATA-INT-002`                                            |
|   10 | reputación y temas recurrentes                          | reputación pública usa fuentes externas gobernadas; feedback interno permanece fuente distinta; temas requieren clasificación versionada y trazable                         | feedback interno existe; no se demuestra inbox canónico de reseñas, comentarios y menciones públicas | `BLOQUEADO` para reputación pública; `NO EVALUADO` para categorías internas                      | `AURA-DOM-009`, `AURA-UX-007`, `AURA-INT-001`; causalidad/diagnóstico en `DATA-DOM-014` cuando se interpreten drivers                                             |
|   11 | reservas, no-show y utilización                         | reserva, cancelación, asistencia y no-show son estados distintos; utilización requiere capacidad gobernada en la misma unidad y ventana                                     | ciclo integral de reservas no confirmado                                                             | `BLOQUEADO`                                                                                      | `OPS-CAN-001`, `OPS-B2B-001`, `PULSO-UX-001`, `PROC-CAT-009` a `PROC-CAT-018`, `CAP-SCOPE-012`; modelo en `DATA-INT-002`                                          |
|   12 | valor y rentabilidad del cliente cuando esté autorizado | valor descriptivo puede asociar ventas elegibles a identidad autorizada; margen/rentabilidad consume definición económica de D013 y nunca se recalcula localmente           | ventas identificables existen parcialmente; no se demostró rentabilidad canónica por cliente         | `NO EVALUADO` para ingreso asociado; `BLOQUEADO` para rentabilidad                               | definición económica en `DATA-DOM-013`; protección en `DATA-AUTH-001`, `DATA-AUTH-002`; binding en `DATA-INT-002`                                                 |

**Reconciliación:** 12 familias esperadas; 12 materializadas; 0 faltantes; 0 duplicadas.

#### 8. Cumplimiento de promesa

Una promesa analítica requiere un **compromiso aceptado**, no únicamente una preferencia del cliente.

Coordenadas mínimas:

- pedido o servicio;
- tipo de promesa;
- versión de política;
- inicio y fin de ventana o instante comprometido;
- sede y modalidad;
- zona horaria;
- momento de aceptación;
- evento terminal que satisface la promesa;
- cancelaciones o exclusiones autorizadas.

La tasa se define como:

```text
cumplimiento de promesa
= compromisos elegibles cumplidos dentro de la promesa
  / compromisos elegibles cuyo vencimiento pertenece al corte
```

Reglas:

- `requested_for` no se interpreta automáticamente como compromiso aceptado;
- `delivery_window_start` y `delivery_window_end` son evidencia técnica de ventana, no prueba suficiente de semántica contractual;
- `prepare_by` no equivale a hora de entrega;
- un pedido cancelado conserva la cancelación y no se convierte silenciosamente en incumplimiento;
- una promesa renegociada conserva versión anterior, aceptación y motivo;
- promesas de recogida, domicilio y servicio en sitio no comparten necesariamente el mismo evento terminal.

La familia permanece `BLOQUEADO` para publicación oficial hasta que el contrato operativo identifique qué campo o evento representa la promesa aceptada.

#### 9. Tiempos de preparación, despacho y entrega

D012 prohíbe derivar todos los tiempos desde un único par de timestamps.

Las fases deberán materializarse solo cuando existan sus hitos reales:

```text
confirmación → inicio de preparación
inicio de preparación → listo
listo → salida o recogida
salida → entrega
confirmación → cumplimiento terminal
```

Cuando la implementación solo disponga de `confirmed_at` y `ready_for_dispatch_at`, podrá existir una medida descriptiva **confirmación a listo**, pero no se renombrará como tiempo de preparación exacto si falta el inicio de preparación.

Para entrega:

- `ready_for_dispatch_at → on_the_way_at` representa espera de salida cuando ambos eventos son válidos;
- `on_the_way_at → delivered_at` representa tránsito de entrega cuando ambos eventos son válidos;
- `confirmed_at → delivered_at` representa ciclo confirmado a entrega;
- `created_at → delivered_at` representa ciclo solicitud/pedido a entrega únicamente si el grano de `created_at` es el acordado para esa métrica.

Valores negativos, endpoints invertidos o timestamps faltantes quedan fuera del cálculo certificado y entran al control de calidad.

#### 10. Pedidos completos

`delivered` significa resultado terminal del pedido, pero no demuestra automáticamente que cada línea solicitada haya sido cumplida íntegramente.

Un pedido completo exige, para todas sus líneas elegibles:

```text
cantidad solicitada original
+ revisiones aprobadas
+ sustituciones aceptadas
- cancelaciones explícitas de línea
= cantidad final exigible

cantidad final exigible
= cantidad efectivamente cumplida y aceptada
```

Reglas:

- una línea parcial hace que el pedido no sea completo salvo que exista revisión aceptada que reduzca la obligación;
- una sustitución no cuenta como cumplimiento del producto original sin aceptación trazable;
- una devolución posterior no reescribe la completitud histórica del momento de entrega; genera una dimensión o evento posterior;
- un pago completo no prueba pedido completo;
- el total monetario no sustituye cantidades de línea.

La familia permanece `BLOQUEADO` porque la evidencia observada no demuestra un contrato integral de cumplimiento por línea en todos los canales.

#### 11. Reclamos y tiempo de resolución

Un reclamo analítico requiere expediente explícito con declaración original y no se infiere desde:

- rating bajo;
- chat de pedido;
- comentario libre;
- cancelación;
- devolución;
- mensaje negativo;
- reseña pública.

El expediente deberá conservar como mínimo:

- `case_id`;
- tipo de caso;
- canal;
- cliente o actor ocasional;
- marca y sede;
- pedido/venta relacionados cuando existan;
- categoría y severidad;
- recibido en;
- primera respuesta en;
- responsable;
- estado;
- resolución en;
- reapertura;
- decisión;
- evidencia;
- SLA y versión cuando aplique.

Métricas permitidas cuando exista el contrato:

```text
tiempo a primera respuesta = first_response_at - received_at
tiempo a resolución = resolved_at - received_at
tasa de reapertura = casos reabiertos / casos resueltos elegibles
cumplimiento SLA = casos resueltos dentro del SLA / casos elegibles con SLA
```

No se calcula SLA si falta política vigente o timestamp terminal verificable.

#### 12. Compensaciones

Compensación es una **decisión de servicio**, no cualquier efecto económico favorable al cliente.

Se preservan por separado:

- devolución de producto;
- reembolso;
- descuento;
- cortesía;
- producto de reemplazo;
- cupón;
- puntos;
- ajuste de puntos;
- crédito o saldo;
- compensación explícita.

Toda analítica de compensación debe poder vincular:

```text
caso o decisión origen
→ tipo de compensación
→ autoridad
→ motivo
→ valor o cantidad
→ moneda/unidad cuando aplique
→ estado
→ efecto realizado
→ reversión o anulación
```

La tasa de compensación utiliza como denominador la población explícitamente definida de casos o decisiones elegibles. No se divide por todos los clientes ni por todas las ventas por conveniencia.

#### 13. Satisfacción y feedback

El feedback interno de PASS constituye una fuente diferenciada.

Sobre feedback válido podrán definirse:

- distribución de ratings;
- rating medio, mediana o percentiles cuando la escala sea compatible;
- proporción por categoría;
- volumen de comentarios;
- evolución por sede y periodo;
- recurrencia de temas una vez exista clasificación gobernada.

Reglas de sesgo y cobertura:

- una invitación selectiva altera la población;
- premiar una reseña o invitar después de un evento específico puede alterar representatividad;
- el promedio no se presenta como “satisfacción de todos los clientes” si solo responde una subpoblación;
- una tasa de respuesta requiere contar invitaciones efectivamente elegibles y entregadas;
- `last_review_prompt_date` no sustituye un ledger de invitaciones;
- un registro interno con categoría `google_review` no demuestra que exista una reseña pública externa.

El detalle textual y cualquier atributo personal asociado requieren finalidad y autorización.

#### 14. Recurrencia, frecuencia y abandono

D012 reutiliza la identidad y las reglas de recurrencia de `DATA-DOM-009`; no crea una segunda definición comercial.

Recurrencia:

```text
cliente recurrente
= identidad autorizada con al menos dos eventos elegibles
  dentro de la población y ventana definidas
```

Frecuencia:

```text
frecuencia por cliente
= eventos elegibles de servicio/compra
  / identidades autorizadas elegibles
```

También podrá calcularse una frecuencia individual cuando la finalidad y autorización lo permitan.

Abandono no es un hecho instantáneo. Requiere:

- una identidad elegible;
- un evento previo que la incluya en la cohorte;
- una ventana de inactividad registrada en la versión de la métrica;
- un periodo de observación suficiente para completar esa ventana;
- reglas de censura para relaciones todavía no observables hasta el final.

Una persona invitada no se fusiona por nombre, teléfono, correo o dirección para fabricar recurrencia o abandono.

#### 15. Adquisición y activación

Se separan cinco hechos:

```text
primer contacto identificable
≠ creación de cuenta
≠ adquisición gobernada
≠ activación
≠ primera compra
```

La adquisición requiere un evento de entrada con:

- identidad o relación resoluble;
- fuente;
- canal;
- campaña/oportunidad cuando aplique;
- fecha;
- finalidad;
- evidencia;
- regla de deduplicación.

La activación requiere un **evento objetivo versionado** y una ventana desde la adquisición.

Fórmula:

```text
tasa de activación
= relaciones adquiridas que alcanzan el evento de activación dentro de la ventana
  / relaciones adquiridas elegibles con ventana observable completa
```

No se fija por esta tarea un evento de activación artificial. La familia permanece `BLOQUEADO` hasta que el proceso propietario materialice el evento y su origen. AURA conservará atribución cuando corresponda; PASS conservará identidad y relación.

#### 16. Fidelización, puntos y redenciones

La analítica de fidelización se deriva de movimientos y estados, no de un saldo editable.

Movimientos:

- `earn` = acumulación;
- `spend` = gasto;
- `adjust` = ajuste;
- reversión o compensación debe conservar relación con el evento origen cuando el contrato la materialice.

Redenciones:

- `pending`;
- `validated`;
- `cancelled`.

Métricas permitidas:

```text
puntos ganados = suma de movimientos elegibles de acumulación
puntos gastados = magnitud de movimientos elegibles de gasto
ajustes = suma y conteo separados por signo y motivo
redenciones validadas = conteo de redenciones con estado validated
puntos redimidos = suma de points_spent de redenciones validadas
```

Una tasa de conversión de redención deberá declarar qué constituye intento, qué estados son terminales y qué ventana permite madurar el resultado.

Reglas:

- el saldo es proyección reconciliable del ledger;
- `points_spent` no se interpreta como venta;
- puntos otorgados por feedback se clasifican por su evento origen;
- una redención pendiente no cuenta como beneficio consumido;
- una cancelación no se borra del historial;
- redención, promoción, cupón y compensación permanecen conceptos distintos.

#### 17. Reputación y temas recurrentes

Reputación pública y feedback interno permanecen separados.

Fuentes externas elegibles podrán incluir, cuando existan adaptadores gobernados:

- reseñas;
- comentarios públicos;
- menciones;
- respuestas públicas;
- estado de moderación;
- fuente/canal;
- fecha;
- marca/sede;
- vínculo con caso de servicio cuando corresponda.

No se crea un “score reputacional” único por conveniencia.

Cualquier índice compuesto deberá declarar:

- fuentes;
- escala;
- cobertura;
- ponderaciones;
- tratamiento de duplicados;
- idioma;
- periodo;
- sesgos;
- método;
- versión;
- nivel de confianza.

Temas recurrentes se calcularán sobre una clasificación versionada. El cambio de taxonomía no reetiqueta silenciosamente historia publicada.

Una respuesta pública no convierte un reclamo formal en resuelto.

#### 18. Reservas, no-show y utilización

La familia exige un ciclo explícito de reservas.

Estados mínimos conceptuales:

```text
solicitada
→ aceptada o rechazada
→ confirmada
→ modificada o cancelada
→ asistida o no-show
→ cerrada
```

El contrato operativo podrá usar otra nomenclatura, pero deberá conservar equivalencia y transición verificable.

Métricas:

```text
tasa de no-show
= reservas no-show
  / reservas elegibles cuyo momento de servicio ya ocurrió

tasa de asistencia
= reservas asistidas
  / reservas elegibles cuyo momento de servicio ya ocurrió
```

La cancelación se reporta aparte y no entra automáticamente al numerador de no-show.

Utilización exige un denominador físico u operativo gobernado:

```text
utilización
= capacidad ocupada o consumida
  / capacidad utilizable elegible
```

La unidad de capacidad puede ser mesa-tiempo, cupo-tiempo u otra unidad aprobada; no se mezclan unidades incompatibles.

La familia permanece `BLOQUEADO` hasta que el ciclo integral, la capacidad y los estados estén materializados.

#### 19. Valor y rentabilidad del cliente

D012 permite asociar resultados económicos ya gobernados a una identidad de cliente autorizada, pero no crea una fórmula financiera paralela.

Valor descriptivo permitido:

```text
ingreso asociado a cliente
= suma de ventas elegibles gobernadas por D009
  vinculadas de forma autorizada a la identidad PASS
```

Reglas:

- solo se incluyen ventas donde el vínculo de identidad sea válido;
- ventas a consumidor final no identificado permanecen fuera del nivel individual y pueden seguir formando parte de agregados comerciales;
- no se imputan ventas anónimas a una persona por similitud;
- devolución, descuento e impuestos siguen la semántica de D009;
- “valor” no equivale automáticamente a margen;
- costo de adquisición, margen, contribución, rentabilidad y escenarios consumen `DATA-DOM-013`;
- un modelo predictivo de lifetime value no se considera aprobado por esta tarea;
- cualquier uso individual o segmentación sensible requiere autorización y finalidad.

#### 20. Privacidad, minimización y poblaciones pequeñas

La analítica de cliente deberá operar bajo minimización.

Queda prohibido usar por defecto en agregados:

- nombre;
- correo;
- teléfono;
- documento;
- dirección;
- texto libre;
- fecha de nacimiento;
- coordenadas;
- identificadores externos de plataforma;

cuando la métrica no los requiera.

Reglas:

1. el detalle individual solo se expone para una finalidad autorizada;
2. cohortes pequeñas o sensibles deberán aplicar umbrales y protección definidos en `DATA-AUTH-002`;
3. exportación y drill-down no heredan automáticamente el permiso del agregado;
4. feedback textual puede contener datos personales y requiere tratamiento separado;
5. segmentación no habilita contacto;
6. consentimiento para una finalidad no habilita otra;
7. reputación pública no elimina las obligaciones de tratamiento interno;
8. datos de invitados no se convierten en perfiles permanentes sin contrato aplicable.

#### 21. Identidad, cohortes y deduplicación

La unidad cliente se resuelve desde PASS y sus contratos de identidad.

Una cohorte deberá declarar:

- criterio de entrada;
- fecha de entrada;
- marca/sede cuando aplique;
- estado de identificación;
- finalidad;
- ventana de observación;
- exclusiones;
- tratamiento de pérdida de elegibilidad;
- versión de definición.

No se permiten cohortes construidas mediante:

```text
same(name)
OR same(phone-like)
OR same(address-like)
→ same(customer)
```

Una vinculación posterior de un cliente ocasional a una identidad deberá conservar trazabilidad de la decisión y no alterar hechos históricos sin regla de restatement.

#### 22. Tiempo, corte y comparabilidad

Cada métrica deberá declarar el tiempo que gobierna su población.

Ejemplos:

- cumplimiento de promesa: vencimiento de la promesa;
- tiempo de entrega: eventos de fase;
- reclamo: recepción y resolución;
- feedback: momento de captura;
- recurrencia: momento del evento elegible;
- adquisición: evento de entrada;
- activación: evento objetivo;
- fidelización: timestamp del movimiento;
- redención: creación y validación/cancelación;
- reputación: publicación/captura externa;
- reserva: fecha de servicio y estado terminal;
- valor: tiempo del hecho económico/comercial correspondiente.

Dos periodos no son comparables si cambian:

- definición;
- población;
- cobertura de canal;
- identidad;
- versión de métrica;
- zona horaria;
- calendario;
- fuente;
- política de promesa;
- escala de rating;
- taxonomía de temas.

#### 23. Denominadores, cero y ausencia

D012 conserva las distinciones:

```text
0
≠ NULL
≠ NO_APLICA
≠ DESCONOCIDO
≠ NO_RECIBIDO
≠ PENDIENTE
≠ DENOMINADOR_NO_DISPONIBLE
```

Reglas:

- una tasa sin denominador válido no devuelve cero;
- una fase sin timestamp terminal no devuelve duración cero;
- un cliente sin segundo evento todavía observable no es automáticamente abandono;
- una reserva futura no es no-show;
- una ausencia de feedback no significa satisfacción neutra;
- cero reclamos no demuestra servicio perfecto si la cobertura de captura es desconocida;
- cero reseñas públicas no demuestra reputación neutra;
- cero redenciones no prueba falta de fidelización sin población elegible.

#### 24. Calidad y certificación

Toda familia consume `DATA-DOM-007`.

Como mínimo deberán verificarse:

- completitud de eventos;
- unicidad de identidad;
- integridad de relaciones;
- estados válidos;
- orden temporal;
- cobertura por canal/sede;
- frescura;
- población elegible;
- datos tardíos;
- duplicados;
- correcciones;
- reconciliación;
- linaje;
- versión de fuente;
- sesgo de captura cuando aplique.

Un resultado podrá quedar `NO EVALUADO` aunque exista código o datos.

Un resultado permanecerá `BLOQUEADO` cuando falte un contrato necesario para construir su numerador, denominador, identidad o tiempo.

#### 25. Publicación, drill-down y snapshots

Toda publicación consume `DATA-DOM-008`.

Una vista oficial deberá declarar:

- versión de métrica;
- periodo;
- zona horaria;
- corte;
- cobertura;
- filtros;
- población;
- dimensiones;
- fuente;
- frescura;
- calidad;
- certificación.

Drill-down permitido:

```text
métrica agregada
→ cohorte o dimensión autorizada
→ caso/pedido/evento permitido
→ evidencia fuente autorizada
```

El drill-down no podrá revelar automáticamente:

- texto de feedback;
- datos de contacto;
- direcciones;
- conversaciones;
- identidad individual;
- compensaciones sensibles;

solo porque el usuario pueda ver un agregado.

#### 26. Identidad de métricas y aliases técnicos

Esta tarea no fabrica un namespace `METRIC-*` ni claves semánticas sin evidencia.

Los nombres técnicos actuales, entre ellos:

- `created_at`;
- `confirmed_at`;
- `ready_for_dispatch_at`;
- `on_the_way_at`;
- `delivered_at`;
- `delivery_window_start`;
- `delivery_window_end`;
- `points_delta`;
- `points_spent`;
- `rating`;

son evidencia o aliases de fuente y no se convierten automáticamente en `metric_key`.

La materialización física en `DATA-INT-002` deberá registrar claves estables conforme a `DATA-DOM-004`, con fórmula, versión, dimensiones, filtros, unidad, propietario, calidad, certificación y drill-down.

#### 27. Handoffs con propietario documental exacto

| Decisión o materialización fuera del alcance           | Propietario documental                                                                                             | Condición de salida                                    |
| ------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------ |
| promesa, estados de cumplimiento y pedido para llevar  | `PULSO-UX-004`, `PULSO-UX-007`, `PULSO-UX-019`                                                                     | antes de certificar cumplimiento de promesa            |
| cumplimiento línea a línea, sustituciones y revisiones | `PULSO-UX-007`, `PULSO-UX-009`, `PULSO-UX-013`, `PROC-CAT-013`, `PROC-CAT-014`                                     | antes de certificar pedidos completos                  |
| expediente omnicanal, responsable, SLA y cierre        | `PROC-CAT-009` a `PROC-CAT-019`, `PROC-ACTOR-001` a `PROC-ACTOR-010`, `VISO-UX-013` a `VISO-UX-020`, `PASS-UX-010` | antes de certificar reclamos y resolución              |
| decisión común de devolución/reembolso/compensación    | `PULSO-UX-009`, `PULSO-AUTH-008`, `PASS-INT-002`, `CAP-SCOPE-012`                                                  | antes de certificar compensaciones                     |
| identidad, consentimiento y vínculo de cliente         | `PASS-UX-008`, `PASS-INT-004`, `PASS-INT-005`, `CAP-SCOPE-016`                                                     | antes de ampliar detalle o unir historias              |
| ledger y redenciones de fidelización                   | `PASS-INT-001`, `PASS-INT-002`, `PASS-QA-001`, `PASS-QA-002`                                                       | antes de certificar puntos y redenciones               |
| adquisición, oportunidad y origen atribuible           | `AURA-DOM-007`, `AURA-INT-001`, `AURA-INT-002`                                                                     | antes de publicar adquisición atribuida                |
| reputación pública, clasificación y escalamiento       | `AURA-DOM-009`, `AURA-UX-007`, `AURA-INT-001`                                                                      | antes de publicar reputación externa                   |
| reservas, capacidad, cancelación y no-show             | `OPS-CAN-001`, `OPS-B2B-001`, `PULSO-UX-001`, `PROC-CAT-009` a `PROC-CAT-018`, `CAP-SCOPE-012`                     | antes de certificar reservas/no-show/utilización       |
| costo, margen y rentabilidad de cliente                | `DATA-DOM-013`                                                                                                     | antes de publicar rentabilidad por cliente/cohorte     |
| diagnóstico causal o explicación de drivers            | `DATA-DOM-014`                                                                                                     | antes de presentar asociación como causa               |
| metas, umbrales objetivo y guardrails                  | `DATA-DOM-015`                                                                                                     | antes de gobernar objetivos de servicio                |
| experimentos y comprobación de mejora                  | `DATA-DOM-016`                                                                                                     | antes de declarar efecto experimental                  |
| restatements y correcciones históricas                 | `DATA-DOM-017`                                                                                                     | antes de reexpresar resultados publicados              |
| contratos de lectura y eventos                         | `DATA-INT-001`                                                                                                     | antes de ingestión analítica productiva                |
| modelos, cálculos, snapshots y consultas               | `DATA-INT-002`                                                                                                     | antes de materializar métricas en productos analíticos |
| reconciliación de identidades y claves externas        | `DATA-INT-003`                                                                                                     | antes de combinar fuentes de clientes o canales        |
| protección de detalle, cohortes pequeñas y drill-down  | `DATA-AUTH-001`, `DATA-AUTH-002`                                                                                   | antes de exponer analítica sensible                    |

No queda un bloqueo de D012 sin propietario documental y condición de salida.

#### 28. Cobertura de requisitos de prueba vigente

Las reglas de esta tarea ya están protegidas por requisitos vigentes:

- `TREQ-DATA-002` protege identidad, fórmula, numerador, denominador, granularidad, dimensiones, filtros, unidad, tiempo, fuente, calidad, versión y certificación de cada métrica;
- `TREQ-DATA-003` protege ingestión, cobertura, duplicados, integridad, datos tardíos, reconciliación, estados de ausencia y linaje;
- `TREQ-DATA-004` protege publicación, filtros, corte, frescura, snapshots, drill-down y restatements;
- `TREQ-PASS-010` protege identidad de cliente, consentimiento, ledger, acumulación, redención, ajuste, reversión y conciliación de fidelización;
- `TREQ-PASS-011` protege separación de preguntas, reclamos, feedback, devoluciones, compensaciones, reservas y comunicaciones, incluyendo SLA y no-show;
- `TREQ-AURA-003` protege reputación, atribución, resultados y la frontera entre respuesta pública y reclamo formal.

D012 especializa las fórmulas y fronteras analíticas dentro de esas reglas ya identificadas. No introduce un comportamiento ejecutable adicional que requiera una nueva fila del registro.

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea materializa documentalmente las familias y fórmulas de servicio y clientes ya protegidas por requisitos vigentes de métricas, calidad, publicación, identidad, fidelización, servicio y reputación. No modifica comportamiento ejecutable, contratos físicos, autorización, estados operativos, datos ni integración.

#### 29. Criterios de aceptación

1. las 12 familias de `CAP-SCOPE-017` están presentes exactamente una vez;
2. el total esperado es 12 y el total materializado es 12;
3. existen 0 faltantes y 0 duplicados;
4. promesa solicitada, aceptada y resultado real permanecen separados;
5. cumplimiento de promesa no se calcula desde una preferencia sin aceptación;
6. tiempos de preparación, despacho, tránsito y total no se colapsan;
7. ninguna duración se fabrica cuando falta un endpoint real;
8. `delivered` no prueba por sí solo pedido completo;
9. completitud se resuelve por líneas, cantidades, revisiones y sustituciones aceptadas;
10. feedback, reclamo, chat, devolución y reputación permanecen objetos distintos;
11. resolución usa expediente y timestamps reales;
12. SLA solo se calcula con política y versión aplicables;
13. devolución, reembolso, compensación, cortesía, cupón y puntos permanecen separados;
14. satisfacción declara población y sesgo de captura;
15. rating interno no se presenta como review externo;
16. la redirección a Google Reviews no se cuenta como reseña publicada;
17. recurrencia reutiliza la identidad y semántica aprobadas en D009;
18. invitados no se fusionan por similitud para crear recurrencia;
19. abandono exige ventana y observación completa;
20. adquisición, cuenta, activación y primera compra permanecen separadas;
21. activación exige evento objetivo versionado;
22. fidelización se deriva del ledger y no de un saldo editable;
23. movimientos `earn`, `spend` y `adjust` permanecen separados;
24. redenciones `pending`, `validated` y `cancelled` permanecen separadas;
25. reputación pública requiere fuente externa gobernada;
26. no se crea un score reputacional compuesto sin metodología;
27. temas recurrentes requieren taxonomía/versionado;
28. reserva, cancelación, asistencia y no-show permanecen separados;
29. utilización requiere denominador de capacidad compatible;
30. ventas anónimas no se imputan a una identidad;
31. ingreso asociado no se presenta como margen;
32. rentabilidad consume `DATA-DOM-013`;
33. no se aprueba un modelo predictivo de lifetime value por inferencia;
34. se aplican minimización y finalidad;
35. poblaciones pequeñas quedan protegidas por `DATA-AUTH-002`;
36. exportación y drill-down no heredan automáticamente permiso del agregado;
37. cero, nulo, no aplica, desconocido y denominador ausente permanecen diferenciados;
38. calidad y certificación consumen `DATA-DOM-007`;
39. publicación y snapshots consumen `DATA-DOM-008`;
40. la materialización analítica consume `DATA-INT-001` y `DATA-INT-002`;
41. las identidades externas consumen `DATA-INT-003`;
42. cada bloqueo tiene propietario exacto y condición de salida;
43. no se crea, modifica, difiere, descarta ni vuelve obsoleto ningún requisito de prueba;
44. no se ejecuta código, DDL, DML, migración, backfill ni cambio de Supabase;
45. `DATA-DOM-013` permanece únicamente reservada.

#### 30. Continuidad

```text
ÚLTIMA TAREA APROBADA
DATA-DOM-011 — Definir analítica de producción, rendimiento, capacidad, merma y calidad

TAREA ACTUAL APROBADA
DATA-DOM-012 — Definir analítica de servicio, clientes, fidelización, reputación y experiencia

SIGUIENTE TAREA RESERVADA
DATA-DOM-013 — Definir analítica de costos, rentabilidad, liquidez, presupuesto y escenarios
```


### ✅ DATA-DOM-013 — Definir analítica de costos, rentabilidad, liquidez, presupuesto y escenarios

**Estado:** APROBADA
**Tarea anterior:** `DATA-DOM-012 — Definir analítica de servicio, clientes, fidelización, reputación y experiencia` — APROBADA
**Tarea siguiente:** `DATA-DOM-014 — Definir diagnóstico transversal, anomalías, causas, oportunidades y nivel de confianza` — RESERVADA
**Tipo de tarea:** documental; contrato canónico de analítica económico-financiera, costos, rentabilidad, liquidez, presupuesto y escenarios
**Bloque:** AB — Analítica, indicadores y datos maestros
**Fase:** exclusivamente documental
**Implementación técnica:** no autorizada
**Código, DDL, DML, migraciones, backfills, cambios de datos, despliegues, cierres, pagos o publicación productiva de artefactos:** no autorizados

#### 1. Propósito

Definir la semántica analítica económico-financiera de Vento OS para que NUMERA pueda medir costos, variaciones, margen, contribución, gastos, presupuesto, liquidez, cartera, obligaciones, rentabilidad y escenarios sin reconstruir hechos operativos, sin convertir estimaciones en realidad, sin duplicar contabilidad y sin mantener fórmulas locales competidoras.

La tarea materializa las diez familias reservadas por `CAP-SCOPE-017` y consume las fronteras financieras aprobadas por `CAP-SCOPE-012`.

El resultado deberá permitir responder de forma reproducible:

```text
qué costo se está midiendo
qué método y versión lo gobiernan
qué componentes entran y cuáles quedan fuera
qué cantidad o hecho soporta el costo
qué variación existe frente a estándar, presupuesto o forecast
qué ingreso económico es elegible
qué margen o contribución resulta
qué gasto pertenece al periodo y al centro analizado
qué caja y bancos están realmente disponibles
qué cartera y obligaciones permanecen abiertas
qué rentabilidad es atribuible sin forzar asignaciones
qué cambia bajo un escenario sin alterar datos reales
```

NUMERA continuará como capa económico-operativa y analítica. Esta tarea no declara a Vento OS como sistema contable formal completo ni transfiere a NUMERA la autoridad operativa de PULSO, ORIGO, FOGO, NEXO, PASS o VISO.

#### 2. Resultado sustantivo

Queda definido el contrato `DATA-DOM-013` con los siguientes resultados:

- **10 de 10 familias canónicas** de analítica económico-financiera reciben definición explícita;
- **10 de 10 familias** reciben fuente, fórmula o regla de cálculo, evidencia actual, estado de certificación y condición de salida;
- **0 familias faltantes**;
- **0 familias duplicadas**;
- se separan costo de adquisición, landed, estándar, último, promedio, real, productivo, logístico, de merma e interno;
- se separan costo técnico observado y costo económico oficial;
- se impide convertir el promedio ponderado de compra de ORIGO en método de valoración financiera por inferencia;
- se impide convertir `total_cost` o `unit_cost` de FOGO en costo económico oficial sin reconciliación;
- se separan variación de costo, desviación presupuestal, saldo presupuestal y error de forecast;
- se separan margen bruto, contribución, resultado atribuible y rentabilidad;
- se impide usar ingreso esperado como ingreso realizado;
- se define punto de equilibrio únicamente sobre una razón de contribución compatible o, cuando se use un margen objetivo, como simulación/planeación explícita;
- se separan gasto capturado, gasto reconocido, costo, pago y salida de caja;
- se preserva `CENTRO_DE_COSTO` como dimensión económica independiente de sede, marca, área y canal;
- se exige asignación versionada y reconciliable para costos compartidos;
- se separan presupuesto aprobado, revisión, forecast, escenario y dato real;
- se separan caja, banco, saldo conciliado, movimiento pendiente, cartera y obligación;
- se define liquidez real y liquidez proyectada sin convertir cartera en efectivo;
- se define cartera abierta y obligaciones abiertas sobre aplicaciones reales, no por coincidencia de montos;
- se define rentabilidad multidimensional con costo trazable y residuo no asignado visible;
- se impide sumar monedas incompatibles sin conversión gobernada;
- se preservan monto y moneda originales aunque exista una conversión de presentación;
- se identifican cuatro divergencias semánticas actuales de NUMERA que impiden certificar sus agregados como métricas financieras oficiales;
- no se crea un namespace nuevo de métricas ni se fabrican `metric_key` sin evidencia;
- no se modifica ningún comportamiento físico ni requisito de prueba.

#### 3. Alcance y entradas canónicas

Esta tarea consume sin reabrir:

- `DATA-DOM-001` a `DATA-DOM-008` para gobierno, maestros, hechos, ingestión, calidad y publicación;
- `DATA-DOM-009` para venta bruta/neta, devoluciones, descuentos, pedidos, canal y demanda comercial;
- `DATA-DOM-010` para existencias, compras, recepción, proveedor, remisión y costo operacional de abastecimiento;
- `DATA-DOM-011` para producción, consumos, rendimiento, merma y costo técnico por lote/salida;
- `DATA-DOM-012` para identidad de cliente autorizada y vínculo de valor/rentabilidad cuando corresponda;
- `CAP-SCOPE-012` para hechos económicos, caja, bancos, cartera, obligaciones, costos, presupuestos, tesorería, impuestos, cierres y rentabilidad;
- `CAP-SCOPE-017` para el registro canónico de métricas y sus diez familias económico-financieras;
- `TREQ-NUMERA-001` a `TREQ-NUMERA-004` como protección vigente de conciliación, hechos económicos, tesorería, cartera, costos, presupuestos y rentabilidad;
- `TREQ-DATA-002` a `TREQ-DATA-004` como protección transversal de semántica, calidad y publicación analítica.

Esta tarea no implementa ledger, cuentas bancarias, cartera, cuentas por pagar, vistas, modelos semánticos, snapshots, escenarios, pipelines, tablas, RPC, dashboards ni integraciones.

#### 4. Autoridad funcional y fronteras de dato

| Dominio / aplicación          | Autoridad consumida por D013                                                                                                                           | Frontera obligatoria                                                                      |
| ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------- |
| `NUMERA`                      | hecho económico, costo económico, centro de costo, moneda, periodo económico, presupuesto, conciliación, tesorería, rentabilidad y análisis financiero | no reconstruye hechos operativos ni se declara contabilidad formal por esta tarea         |
| `PULSO`                       | pedido, venta, descuento, devolución, pago, caja y cumplimiento comercial                                                                              | venta, pago y depósito permanecen hechos distintos; PULSO no calcula rentabilidad oficial |
| `ORIGO`                       | proveedor, orden, recepción comercial y memoria de costo de compra                                                                                     | último/promedio de compra es evidencia operacional; no define valoración oficial          |
| `NEXO`                        | existencia, movimiento, recepción física, remisión, activo y logística interna                                                                         | cantidad física y remisión valorizada no crean por sí solas ingreso o gasto legal         |
| `FOGO`                        | receta, consumo, lote, salida, merma y costo técnico de ejecución                                                                                      | costo técnico no sustituye costo económico reconciliado                                   |
| `PASS`                        | identidad autorizada de cliente                                                                                                                        | rentabilidad por cliente consume vínculo autorizado; NUMERA no crea identidad paralela    |
| sistemas/proveedores externos | extractos, pagos, documentos fiscales o contables dentro de su autoridad                                                                               | la autoridad externa se preserva; NUMERA conserva referencia y conciliación               |
| `BLOQUE AB`                   | semántica, calidad, certificación, publicación y protección analítica                                                                                  | no adquiere propiedad sobre hechos financieros u operativos                               |

Fronteras raíz:

```text
VENTA ≠ INGRESO ECONÓMICO ≠ COBRO ≠ DEPÓSITO
COMPRA ≠ RECEPCIÓN ≠ FACTURA ≠ OBLIGACIÓN ≠ PAGO
COSTO DE COMPRA ≠ COSTO DE INVENTARIO ≠ COSTO PRODUCTIVO ≠ COSTO ECONÓMICO OFICIAL
GASTO ≠ COSTO ≠ PAGO ≠ SALIDA DE CAJA
PRESUPUESTO ≠ FORECAST ≠ ESCENARIO ≠ REAL
INGRESO ESPERADO ≠ INGRESO REALIZADO
MARGEN BRUTO ≠ CONTRIBUCIÓN ≠ RESULTADO ≠ RENTABILIDAD
CAJA ≠ BANCO ≠ CARTERA ≠ LIQUIDEZ
CENTRO DE COSTO ≠ SEDE ≠ ÁREA ≠ MARCA ≠ CANAL
TRANSFERENCIA INTERNA ≠ INGRESO FISCAL ≠ GASTO LEGAL
```

#### 5. Evidencia técnica actual observada

La evidencia vigente demuestra una fundación económico-operativa parcial y suficiente para definir el contrato analítico, pero no para certificar la mayoría de resultados como verdad financiera completa.

##### 5.1. NUMERA actual

El `main` vigente de `vento-numera` contiene superficies para:

- panel económico inicial;
- centros de costo;
- gastos;
- punto de equilibrio;
- una pantalla denominada rentabilidad;
- autenticación y control de acceso.

El panel consume `numera_current_period_summary()` y expone:

- `budget_amount`;
- `expected_revenue`;
- `actual_expenses`;
- `fixed_expenses`;
- `variable_expenses`;
- `one_time_expenses`;
- `break_even_revenue`.

La existencia de esos campos no demuestra por sí sola costo real, ingreso realizado, margen, rentabilidad, liquidez, cartera, obligaciones o escenarios certificados.

##### 5.2. Fundación económica vigente en `vento-shell`

La migración `numera_economic_foundation` declara expresamente que la fundación **no es contabilidad formal**.

Materializa actualmente:

- `numera_periods` con estados `open`, `closed`, `locked`;
- `numera_expense_categories` con clases `fixed`, `variable`, `one_time`;
- `numera_expenses`;
- `numera_cost_center_budgets`;
- `numera_cost_center_monthly_summary`;
- `numera_current_period_summary()`.

La vista mensual calcula actualmente:

```text
actual_expenses
= suma de numera_expenses.amount

budget_variance
= budget_amount - actual_expenses

break_even_revenue
= fixed_expenses / (target_gross_margin_pct / 100)
  cuando target_gross_margin_pct > 0
```

Estas expresiones se conservan como **evidencia técnica actual**, no como definición financiera certificada automática.

##### 5.3. Gastos actuales

La superficie de gastos permite captura manual de:

- periodo;
- categoría;
- centro de costo;
- fecha;
- descripción;
- monto;
- moneda con valor de captura actual `COP` desde la interfaz;
- `source_app = numera` para el alta realizada por esa pantalla.

La captura observada no exige en la misma operación un documento fuente, aprobación, estado de reconocimiento, anulación compensatoria o clave de deduplicación completa. Por tanto, `actual_expenses` describe gastos capturados por la fundación vigente y no se certifica automáticamente como totalidad del gasto económico reconocido.

##### 5.4. Presupuesto actual

`numera_cost_center_budgets` conserva por periodo y centro:

- `budget_amount`;
- `expected_revenue`;
- `target_gross_margin_pct`;
- notas.

Existe una única fila vigente por combinación `period_id + cost_center_id`, actualizada mediante `upsert`. No existe en esa tabla un historial materializado de versiones de presupuesto, revisiones, forecast y escenarios.

Por tanto:

```text
fila vigente editable ≠ presupuesto aprobado histórico versionado
expected_revenue ≠ ingreso realizado
target_gross_margin_pct ≠ margen real
```

##### 5.5. Superficie denominada rentabilidad

La pantalla actual denominada `Rentabilidad` lee:

- ingreso esperado;
- gasto real capturado;
- presupuesto;
- `budget_variance`.

No consume en esa superficie ingreso realizado ni costo trazable de producto/servicio. Por ello es una lectura económica inicial por centro y **no constituye rentabilidad real certificada**.

##### 5.6. Punto de equilibrio actual

La vista vigente utiliza gastos fijos y `target_gross_margin_pct`.

Ese cálculo es válido únicamente como una **simulación de ingreso requerido bajo un margen objetivo** cuando la definición de ese porcentaje y su base sean gobernadas.

No se declara punto de equilibrio económico realizado mientras no exista una razón de contribución compatible y trazable.

##### 5.7. Costo operacional de compra en ORIGO

La evidencia actual conserva por proveedor, producto y presentación:

- último costo neto;
- último costo bruto;
- último costo por unidad de stock;
- costo promedio neto;
- costo promedio bruto;
- costo promedio por unidad de stock;
- cantidades acumuladas;
- costos acumulados;
- número de muestras;
- última recepción;
- moneda.

El promedio se actualiza ponderado por cantidades recibidas y se conservan componentes neto, bruto e impuesto.

Esta memoria sirve como evidencia de costo de compra recibido. No autoriza por sí sola a elegir promedio ponderado como método oficial de valoración económica o contable de inventario.

##### 5.8. Costo técnico productivo en FOGO

FOGO expone actualmente por lote:

- `produced_qty`;
- `expected_qty`;
- consumos reales;
- `total_cost`;
- `unit_cost`;
- producto;
- sede;
- ruta/salida;
- estado.

Es evidencia técnica de costo de ejecución productiva. La oficialización económica exige conciliación con método, componentes, moneda, periodo, asignaciones y tratamiento de coproductos/subproductos aplicables.

##### 5.9. Moneda actual

El maestro `MONEDA` pertenece a NUMERA y las conversiones requieren tasa y vigencia separadas.

Sin embargo, la UI observada de NUMERA formatea importes en `COP`, mientras `numera_expenses.currency` es un campo textual y los presupuestos actuales no contienen una coordenada de moneda propia.

La vista mensual suma montos sin una conversión monetaria explícita visible en su contrato.

Por tanto, una agregación multimoneda oficial permanece `BLOQUEADO` hasta que se pruebe una única moneda gobernada para la población o exista conversión versionada.

#### 6. Cuatro divergencias semánticas actuales

|    # | Evidencia actual                                                              | Lectura correcta en D013                                                                                                                   | Estado                                                          |
| ---: | ----------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------- |
|    1 | `budget_variance = budget_amount - actual_expenses`                           | el signo representa saldo/remanente respecto del presupuesto para gasto; no se publicará como desviación genérica sin convención explícita | `NO EVALUADO`                                                   |
|    2 | `break_even_revenue = fixed_expenses / target_gross_margin_pct`               | es ingreso requerido bajo un margen objetivo; el punto de equilibrio económico exige razón de contribución compatible                      | `NO EVALUADO` como simulación; `BLOQUEADO` como equilibrio real |
|    3 | pantalla `Rentabilidad` usa `expected_revenue` y `actual_expenses`            | es lectura plan versus gasto; no demuestra ingreso realizado, costo de venta ni rentabilidad real                                          | `BLOQUEADO` para rentabilidad oficial                           |
|    4 | UI y agregados actuales presentan/suman importes sin contrato de FX explícito | solo es válido si toda la población comparte una moneda gobernada; multimoneda exige conversión versionada                                 | `BLOQUEADO` para agregación multimoneda                         |

Ninguna divergencia autoriza corrección física en esta tarea documental. Sus cierres permanecen en las tareas NUMERA y de integración indicadas en los handoffs.

#### 7. Matriz materializada de las 10 familias

|    # | Familia canónica              | Definición materializada                                                                                                                                                 | Evidencia actual                                                                                               | Certificación                                                                                   | Condición de salida / propietario exacto                                                                   |
| ---: | ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
|    1 | costos estándar y reales      | separar bases de costo; estándar usa método/versión vigente y real usa componentes efectivamente reconocidos y trazables para el mismo objeto, unidad, moneda y periodo  | ORIGO conserva costos de compra; FOGO costo técnico; NUMERA no demuestra método económico integral             | `NO EVALUADO` para evidencias parciales; `BLOQUEADO` para costo económico oficial               | `NUMERA-DOM-002` a `NUMERA-DOM-007`, `NUMERA-DOM-014`, `OPS-CST-001`, `DATA-INT-001`, `DATA-INT-002`       |
|    2 | variaciones                   | diferencia entre actual y base comparable; costo, presupuesto, forecast, precio y cantidad permanecen variaciones distintas                                              | existe `budget_amount - actual_expenses`; no existe descomposición económica integral                          | `NO EVALUADO` para saldo presupuestal actual; `BLOQUEADO` para variaciones económicas completas | `NUMERA-DOM-007`, `NUMERA-DOM-011`, `NUMERA-DOM-014`, `NUMERA-DOM-018`, `DATA-INT-002`                     |
|    3 | margen y contribución         | margen usa ingreso realizado elegible menos costo trazable; contribución usa ingreso realizado menos costos variables elegibles; cada porcentaje conserva su denominador | existe margen objetivo, no margen realizado certificado                                                        | `BLOQUEADO`                                                                                     | `NUMERA-DOM-007`, `NUMERA-DOM-008`, `NUMERA-UX-022`, `DATA-INT-002`                                        |
|    4 | gastos                        | distinguir gasto capturado, reconocido, aprobado, pagado, anulado y conciliado; agregación solo sobre estados elegibles                                                  | `numera_expenses` y categorías fixed/variable/one_time existen                                                 | `NO EVALUADO` para captura; `BLOQUEADO` para gasto reconocido integral                          | `NUMERA-DOM-005`, `NUMERA-AUTH-004`, `NUMERA-AUTH-005`, `NUMERA-UX-009`, `NUMERA-UX-010`, `NUMERA-DOM-014` |
|    5 | centros de costo              | dimensión económica con identidad/vigencia propia; asignación directa y distribución compartida deben reconciliarse sin equiparar centro con sede/canal/marca            | centros y resumen mensual existen                                                                              | `NO EVALUADO`                                                                                   | `NUMERA-DOM-006`, `NUMERA-DOM-007`, `OPS-CST-001`, `DATA-INT-003`                                          |
|    6 | presupuesto y forecast        | presupuesto aprobado, revisión, forecast y escenario son artefactos versionados distintos; real nunca se sobrescribe                                                     | existe presupuesto editable por periodo/centro, ingreso esperado y margen objetivo; no hay versionado integral | `NO EVALUADO` para fila actual; `BLOQUEADO` para forecast/versiones oficiales                   | `NUMERA-DOM-006`, `NUMERA-DOM-011`, `NUMERA-DOM-018`, `NUMERA-AUTH-015`, `NUMERA-UX-023`, `NUMERA-UX-028`  |
|    7 | caja, bancos y tesorería      | posición real usa saldos reconciliados y disponibilidad; flujo realizado usa movimientos liquidados; proyección separa compromisos/forecast de efectivo real             | no se demuestra modelo integral vigente de cuentas, extractos, aplicaciones y liquidez                         | `BLOQUEADO`                                                                                     | `NUMERA-DOM-009`, `NUMERA-DOM-014`, `NUMERA-AUTH-014`, `NUMERA-UX-017`, `NUMERA-UX-021`, `DATA-INT-001`    |
|    8 | cartera y obligaciones        | saldo abierto deriva de obligación/derecho reconocido menos aplicaciones válidas; pago o cobro sin aplicación no cierra saldo                                            | no existe evidencia de modelo canónico integral vigente de cartera/AP                                          | `BLOQUEADO`                                                                                     | `NUMERA-DOM-003`, `NUMERA-DOM-010`, `NUMERA-DOM-016`, `NUMERA-UX-018`, `NUMERA-UX-020`, `NUMERA-UX-026`    |
|    9 | rentabilidad multidimensional | ingreso realizado menos costos trazables y asignaciones aprobadas para el mismo grano; residuo no atribuible permanece visible                                           | pantalla actual usa ingreso esperado y gasto agregado                                                          | `BLOQUEADO`                                                                                     | `NUMERA-DOM-008`, `NUMERA-DOM-014`, `NUMERA-UX-022`, `DATA-AUTH-001`, `DATA-AUTH-002`, `DATA-INT-002`      |
|   10 | escenarios y simulaciones     | conjunto versionado de supuestos y overrides sobre una línea base inmutable; resultado simulado nunca altera real, presupuesto ni forecast publicados                    | existe margen objetivo y punto de equilibrio simple; no existe motor de escenarios integral demostrado         | `BLOQUEADO`                                                                                     | `NUMERA-DOM-018`, `NUMERA-AUTH-015`, `NUMERA-UX-028`, `DATA-INT-002`                                       |

**Reconciliación:** 10 familias esperadas; 10 materializadas; 0 faltantes; 0 duplicadas.

#### 8. Taxonomía de costo obligatoria

D013 conserva como conceptos separados:

| Tipo de costo        | Semántica mínima                                                                           | Autoridad / insumo                                            |
| -------------------- | ------------------------------------------------------------------------------------------ | ------------------------------------------------------------- |
| costo de adquisición | importe atribuible a la adquisición según componentes y tratamiento tributario aprobados   | ORIGO + NUMERA                                                |
| costo landed         | adquisición más componentes directamente atribuibles definidos por una política versionada | NUMERA consumiendo hechos autorizados                         |
| último costo         | último costo elegible observado bajo la coordenada declarada                               | ORIGO como evidencia operacional                              |
| costo promedio       | promedio calculado bajo método, población y ponderación declarados                         | ORIGO como evidencia operacional; NUMERA decide uso económico |
| costo estándar       | costo objetivo/aprobado para objeto, unidad, vigencia y versión                            | NUMERA + fuentes técnicas aplicables                          |
| costo real           | costo efectivamente reconocido y trazable bajo método aprobado                             | NUMERA reconciliando fuentes                                  |
| costo productivo     | costo atribuible a ejecución productiva bajo regla declarada                               | FOGO como hecho técnico + NUMERA                              |
| costo logístico      | costo atribuible a traslado/cumplimiento bajo regla declarada                              | fuentes logísticas + NUMERA                                   |
| costo de merma       | efecto económico de merma explícita según causa, cantidad y base de costo aprobadas        | D011/FOGO/NEXO + NUMERA                                       |
| costo interno        | valoración gerencial de transferencias/servicios internos bajo política aprobada           | NUMERA + `OPS-CST-001`                                        |

Reglas:

1. dos tipos no se vuelven equivalentes porque hoy tengan el mismo importe;
2. último costo no sustituye costo real histórico;
3. promedio de compras no implica valoración contable promedio;
4. precio de transferencia interno no crea automáticamente ingreso o gasto legal;
5. impuesto recuperable, no recuperable, neto y bruto no se mezclan silenciosamente;
6. cada valor conserva moneda, unidad, fecha de vigencia, fuente y método;
7. un cambio de método exige nueva versión y no reescribe historia sin `DATA-DOM-017`.

#### 9. Costo estándar

Un estándar económico deberá declarar como mínimo:

- objeto de costo;
- versión;
- vigencia desde/hasta;
- unidad base;
- moneda;
- cantidades estándar cuando aplique;
- costos unitarios estándar;
- componentes incluidos/excluidos;
- reglas de asignación;
- tratamiento de merma y coproductos cuando corresponda;
- fuente de cada componente;
- autoridad que aprueba.

Forma conceptual permitida cuando todas las entradas estén gobernadas:

```text
costo_estándar_total
= suma(componentes_directos_estándar)
+ suma(asignaciones_estándar_aprobadas)
```

Para un producto o salida homogénea:

```text
costo_estándar_unitario
= costo_estándar_total / cantidad_estándar_elegible
```

Si la cantidad elegible es cero o no existe, el costo unitario queda sin denominador; no se devuelve cero.

Un costo estándar puede ser usado para planificación o comparación. No se presenta como costo real.

#### 10. Costo real trazable

El costo real económico deberá derivarse de hechos reconocidos y reconciliados.

Forma conceptual:

```text
costo_real_total
= suma(costos_directos_reconocidos)
+ suma(costos_compartidos_asignados_por_regla_aprobada)
```

Condiciones:

- mismo objeto de costo;
- misma población;
- mismo periodo de reconocimiento;
- misma moneda o conversión gobernada;
- componentes con evidencia y fuente;
- reversos/correcciones aplicados sin borrar el original;
- sin doble conteo entre compra, inventario, consumo y gasto;
- sin doble conteo entre transferencias internas y consolidado.

El costo técnico de FOGO o la memoria de compra de ORIGO podrán alimentar la reconstrucción, pero no sustituyen el hecho económico reconciliado de NUMERA.

#### 11. Costo unitario y producción multi-salida

Un costo unitario solo se calcula cuando existe cantidad elegible compatible:

```text
costo_real_unitario
= costo_real_total_atribuido / cantidad_buena_elegible
```

Para producción con múltiples salidas:

- cada salida conserva identidad y cantidad;
- el costo compartido del lote requiere método de asignación versionado;
- la suma de costos asignados más residuo explícito deberá reconciliar con el costo total elegible;
- un subproducto de valor cero no se convierte automáticamente en merma;
- una reasignación económica no reescribe cantidades físicas de FOGO/NEXO.

El método específico permanece bajo `NUMERA-DOM-007` y `OPS-CST-001`; D013 no selecciona FIFO, promedio, estándar u otro método contable por inferencia.

#### 12. Variación de costo

La variación económica general se define sobre bases comparables:

```text
variación_de_costo
= costo_real_elegible - costo_estándar_elegible
```

Lectura para costo:

- valor positivo: costo real superior al estándar;
- valor negativo: costo real inferior al estándar;
- cero: igualdad bajo la misma base, no ausencia de datos.

Porcentaje, solo si el estándar es distinto de cero:

```text
variación_de_costo_pct
= variación_de_costo / costo_estándar_elegible
```

Descomposiciones por precio, cantidad, mezcla, rendimiento, merma o asignación solo podrán publicarse cuando sus entradas permitan separar cada efecto sin residuo oculto. La suma de componentes deberá reconciliar con la variación total o mostrar explícitamente el residuo.

#### 13. Gasto

D013 distingue:

```text
gasto capturado
≠ gasto aprobado
≠ gasto reconocido
≠ gasto pagado
≠ gasto conciliado
≠ gasto anulado/revertido
```

Un agregado oficial de gasto exige población de estados elegibles.

La clasificación `fixed`, `variable`, `one_time` observada actualmente es una clasificación de la fundación NUMERA y no sustituye:

- naturaleza económica;
- centro de costo;
- moneda;
- tratamiento fiscal;
- vigencia;
- soporte;
- aprobación;
- reconocimiento.

Una salida de banco puede pagar un gasto reconocido, una obligación, un anticipo u otro hecho. Por tanto, salida de caja no equivale automáticamente a gasto.

#### 14. Centros de costo

`CENTRO_DE_COSTO` es una dimensión maestra NUMERA.

Reglas:

- no se infiere desde sede;
- no se infiere desde marca;
- no se infiere desde canal;
- no se infiere desde área;
- una reorganización no recodifica historia;
- asignaciones usan la identidad/vigencia aplicable al hecho;
- vistas consolidadas deben conservar la jerarquía financiera aplicable al corte.

Un hecho puede traer sede, canal, producto y centro de costo simultáneamente. Ninguna dimensión sustituye a otra.

#### 15. Costos compartidos y drivers

Todo pool compartido deberá conservar:

- identidad del pool;
- importe y moneda;
- periodo;
- componentes fuente;
- driver;
- versión del driver;
- base total elegible;
- destinos;
- base por destino;
- aprobación;
- vigencia;
- residuo no asignado;
- reversión o nueva versión.

Cuando exista una base válida:

```text
costo_asignado_destino
= pool_elegible
  × base_driver_destino
  / base_driver_total_elegible
```

Si el denominador es cero o incompleto, la asignación no se fabrica. El costo permanece sin asignar o bloqueado según el contrato.

La suma debe reconciliar:

```text
pool_elegible
= suma(costos_asignados)
+ residuo_explícito
```

#### 16. Margen bruto

El margen bruto económico requiere ingreso realizado elegible y costo trazable bajo la misma base.

```text
margen_bruto
= ingreso_realizado_elegible
- costo_de_venta_elegible
```

Porcentaje:

```text
margen_bruto_pct
= margen_bruto / ingreso_realizado_elegible
```

Solo se calcula el porcentaje si el denominador es válido y distinto de cero.

Reglas:

- ingreso esperado no entra como ingreso realizado;
- cobro no sustituye ingreso;
- impuesto, devolución y descuento siguen la semántica económica/comercial aplicable;
- costo técnico no reconciliado no entra como costo oficial;
- dimensiones de producto, canal, sede o cliente deben reconciliar con el total económico.

#### 17. Contribución

La contribución separa costos variables elegibles de costos fijos y compartidos.

```text
margen_de_contribución
= ingreso_realizado_elegible
- costos_variables_elegibles
```

```text
razón_de_contribución
= margen_de_contribución / ingreso_realizado_elegible
```

La clasificación variable debe pertenecer a una política económica vigente. La etiqueta `expense_kind = variable` observada no demuestra por sí sola que todos los costos variables de una venta, producto o canal estén capturados.

#### 18. Punto de equilibrio

El punto de equilibrio económico usa una razón de contribución compatible:

```text
ingreso_de_equilibrio
= costos_fijos_elegibles / razón_de_contribución
```

Condiciones:

- razón de contribución mayor que cero;
- costos fijos y variables bajo la misma población y periodo;
- misma moneda;
- misma definición de ingreso;
- sin costos omitidos materialmente;
- sin mezclar real con presupuesto o escenario sin etiqueta.

El cálculo actual de NUMERA que usa `target_gross_margin_pct` se clasifica como **ingreso requerido bajo margen objetivo** hasta demostrar que esa tasa es equivalente a una razón de contribución aprobada para el contexto.

No se renombra automáticamente ese valor ni se certifica como punto de equilibrio real.

#### 19. Presupuesto

Se separan:

```text
presupuesto original aprobado
revisión presupuestal aprobada
presupuesto vigente publicado
forecast
escenario
real
```

Cada versión deberá conservar:

- identidad;
- versión;
- estado;
- periodo;
- empresa/alcance;
- centro de costo cuando aplique;
- moneda;
- valores;
- supuestos;
- autor;
- aprobador;
- fecha de publicación;
- relación con versión previa.

Un `upsert` sobre una única fila no satisface por sí solo el requisito histórico de versiones.

#### 20. Variación presupuestal

Para gasto, D013 adopta como diferencia analítica firmada:

```text
desviación_gasto
= gasto_real_elegible - presupuesto_gasto_elegible
```

Lectura:

- positivo: gasto por encima del presupuesto;
- negativo: gasto por debajo;
- cero: igualdad bajo base comparable.

El saldo disponible se mantiene como métrica distinta:

```text
saldo_presupuestal
= presupuesto_gasto_elegible - gasto_real_elegible
```

Por tanto, el campo técnico actual `budget_variance` coincide matemáticamente con **saldo presupuestal** para gastos bajo sus entradas actuales y no deberá reutilizarse silenciosamente como desviación con signo opuesto.

Para ingreso:

```text
desviación_ingreso
= ingreso_realizado_elegible - presupuesto_ingreso_elegible
```

Los estados favorable/desfavorable dependen del tipo de medida y deben declararse; no se deducen únicamente del signo para cualquier métrica.

#### 21. Forecast

Forecast es una mejor estimación vigente del resultado futuro y permanece separado del presupuesto aprobado.

Cada forecast deberá conservar:

- fecha de corte;
- horizonte;
- versión;
- fuentes reales incorporadas;
- supuestos para periodos no realizados;
- moneda;
- dimensiones;
- responsable;
- publicación.

Una vez madure el periodo:

```text
error_de_forecast
= real_elegible - forecast_publicado_comparable
```

No se compara contra una versión de forecast creada después de conocer el resultado sin declararlo expresamente.

#### 22. Caja, bancos y tesorería

La analítica deberá distinguir:

```text
efectivo físico
saldo bancario
movimiento bancario
pago iniciado
pago liquidado
recaudo recibido
recaudo aplicado
transferencia
saldo restringido
saldo disponible
```

La posición real de liquidez solo usa fondos disponibles y reconciliados bajo el corte definido.

Forma conceptual:

```text
liquidez_disponible
= efectivo_elegible_disponible
+ saldos_bancarios_elegibles_disponibles
- restricciones_explícitas_aplicables
```

Cartera, ventas esperadas, líneas de crédito no utilizadas o ingresos pronosticados no se suman como efectivo real.

El modelo operativo de bancos y tesorería permanece `BLOQUEADO` hasta `NUMERA-DOM-009` y sus integraciones.

#### 23. Flujo de caja

Flujo realizado:

```text
flujo_neto_realizado
= entradas_de_caja_liquidadas
- salidas_de_caja_liquidadas
```

Flujo proyectado:

```text
saldo_proyectado_fin
= saldo_disponible_inicio
+ entradas_proyectadas_elegibles
- salidas_proyectadas_elegibles
```

Reglas:

- real y proyectado nunca se agregan como si fueran el mismo estado;
- compromisos y oportunidades conservan probabilidad/estado si el modelo los usa;
- una obligación no pagada afecta proyección, no flujo realizado;
- una cuenta por cobrar no recaudada afecta proyección, no efectivo real;
- movimientos pendientes o no conciliados se muestran por separado.

#### 24. Cartera y cuentas por cobrar

Se separan:

```text
deudor
cuenta por cobrar
documento
cuota
vencimiento
saldo abierto
recaudo
aplicación
anticipo
saldo a favor
acuerdo
disputa
castigo autorizado
```

Saldo abierto conceptual:

```text
saldo_cartera_abierto
= importe_reconocido
- recaudos_aplicados
- créditos_aplicados
- castigos_o_ajustes_autorizados
```

Un recaudo sin aplicación no cierra una cuenta por simple igualdad de monto.

Aging usa saldo abierto y fecha de vencimiento al corte. Las partidas no vencidas permanecen separadas de las vencidas.

La familia permanece `BLOQUEADO` hasta la materialización de `NUMERA-DOM-016`.

#### 25. Cuentas por pagar y obligaciones

Se separan:

```text
orden de compra
recepción
factura o soporte
obligación
vencimiento
aprobación
pago programado
pago ejecutado
aplicación
disputa
```

Saldo abierto conceptual:

```text
saldo_obligaciones_abierto
= obligación_reconocida
- pagos_aplicados
- créditos_o_ajustes_autorizados
```

Orden emitida o recepción física no crean automáticamente una obligación financiera con el mismo tratamiento; la regla de reconocimiento pertenece a NUMERA y a la autoridad contable/fiscal aplicable.

La familia permanece `BLOQUEADO` hasta `NUMERA-DOM-003`, `NUMERA-DOM-010` y la conciliación correspondiente.

#### 26. Rentabilidad multidimensional

La rentabilidad solo podrá publicarse sobre ingreso realizado y costo trazable.

Forma base:

```text
resultado_atribuible
= ingreso_realizado_atribuible
- costos_directos_atribuibles
- costos_compartidos_asignados_aprobados
- gastos_atribuibles_elegibles
```

La publicación deberá mostrar además:

- costos sin asignar;
- ingresos no atribuibles a la dimensión solicitada;
- cobertura;
- periodo;
- moneda;
- versión del método de asignación.

D013 admite análisis por las dimensiones gobernadas que realmente puedan reconciliarse, incluyendo cuando corresponda:

- entidad legal;
- marca;
- sede;
- centro de costo;
- canal;
- producto;
- pedido;
- cliente autorizado;
- periodo.

Reglas:

1. una sede no sustituye centro de costo;
2. una marca no sustituye entidad legal;
3. un canal requiere `COMMERCIAL_CHANNEL`, no `source` por conveniencia;
4. una venta anónima no se imputa a un cliente;
5. costo no atribuible no se reparte por conveniencia para fabricar rentabilidad granular;
6. todo desglose debe reconciliar con el total de su población o mostrar el residuo;
7. un ratio de rentabilidad debe declarar su denominador; no todo resultado dividido por un importe se denomina ROI.

#### 27. Rentabilidad por cliente

`DATA-DOM-012` permite asociar venta elegible a identidad autorizada. D013 añade la capa económica.

Solo podrá calcularse cuando:

- la identidad esté autorizada;
- el ingreso esté realmente vinculado;
- el costo sea atribuible o la asignación tenga método aprobado;
- se apliquen minimización y restricciones de `DATA-AUTH-001`/`DATA-AUTH-002`;
- ventas anónimas permanezcan fuera del nivel individual.

No se crea ni aprueba por esta tarea un modelo predictivo de lifetime value.

#### 28. Escenarios y simulaciones

Un escenario es un artefacto analítico versionado y no un hecho económico.

Deberá conservar como mínimo:

- identidad;
- versión;
- creador/responsable;
- fecha de corte de la línea base;
- alcance;
- moneda;
- métricas y versiones consumidas;
- supuestos;
- valores sustituidos;
- fuentes de los valores base;
- restricciones;
- resultado;
- relación con escenario base;
- estado de aprobación/publicación cuando corresponda.

Se preservan como contextos distintos:

```text
REAL
PRESUPUESTADO
PRONOSTICADO
SIMULADO
PROPUESTO
PUBLICADO
```

Reglas:

- cambiar un supuesto no cambia un hecho real;
- publicar un escenario no lo convierte en presupuesto aprobado;
- un escenario no crea una venta, costo, pago, obligación o asiento;
- comparaciones usan la misma versión de métrica y dimensión o una regla de puente explícita;
- escenarios caducados conservan historia;
- escenarios compartidos requieren `NUMERA-AUTH-015`;
- el motor se materializa en `NUMERA-DOM-018` y su visor en `NUMERA-UX-028`.

#### 29. Moneda y conversión

Todo importe conserva:

- monto original;
- moneda original;
- fuente;
- fecha/hora o fecha económica;
- método de reconocimiento;
- conversión, si existe, como valor derivado separado.

Una conversión deberá declarar:

- moneda origen;
- moneda destino;
- tasa;
- fuente de tasa;
- fecha/hora o vigencia;
- método de selección;
- precisión/redondeo;
- versión.

Reglas:

1. no se suman monedas distintas por compartir símbolo o unidad visual;
2. un `formatMoney` de interfaz no constituye conversión;
3. si la población está gobernada como una sola moneda, esa condición deberá probarse y publicarse;
4. presupuesto y real deben compararse en moneda compatible;
5. conversión para presentación no reescribe el monto original.

#### 30. Periodos, fechas y reconocimiento

D013 conserva separados:

- fecha del hecho operativo;
- fecha económica;
- fecha de reconocimiento;
- fecha de pago/cobro;
- periodo económico;
- periodo contable;
- periodo fiscal;
- fecha de carga;
- fecha de corrección.

`numera_periods` actual es evidencia de periodo económico-operativo, pero sus estados `open`, `closed`, `locked` no demuestran por sí solos un cierre financiero integral.

Eventos tardíos se conservan y se tratan mediante la política de cierre/restatement aplicable. No se insertan silenciosamente en un periodo cerrado para preservar un resultado publicado.

#### 31. Conciliación y doble conteo

Toda métrica económica oficial deberá poder descender hasta hechos reconciliados.

Controles mínimos:

- venta ↔ pago ↔ caja ↔ documento ↔ entrega ↔ devolución/reembolso;
- compra ↔ recepción ↔ documento ↔ obligación ↔ devolución ↔ pago;
- inventario ↔ consumo ↔ producción ↔ merma ↔ costo;
- gasto ↔ soporte ↔ aprobación ↔ pago;
- banco ↔ movimiento ↔ aplicación ↔ hecho económico;
- transferencia interna ↔ emisor ↔ receptor ↔ tratamiento de consolidación.

Un lado ausente no se fabrica para cerrar la conciliación. La diferencia se conserva como diferencia con estado, responsable y resolución en `NUMERA-DOM-014`.

#### 32. Cero, nulo, negativos y denominadores

D013 conserva:

```text
0
≠ NULL
≠ NO_APLICA
≠ DESCONOCIDO
≠ NO_RECIBIDO
≠ PENDIENTE
≠ DENOMINADOR_NO_DISPONIBLE
≠ NO_CONCILIADO
```

Reglas:

- costo cero requiere evidencia de gratuidad, subsidio, asignación cero aprobada u otra causa explícita;
- un costo faltante no es cero;
- ingreso cero no implica automáticamente pérdida si faltan costos o población;
- margen porcentual no se calcula con ingreso cero;
- variación porcentual no se calcula con estándar cero;
- punto de equilibrio no se calcula con razón de contribución nula o negativa como un valor financiero ordinario;
- saldo negativo se conserva con su signo y causa; no se recorta a cero para ocultar inconsistencia;
- un presupuesto ausente no se interpreta como presupuesto cero.

#### 33. Calidad y certificación

Toda familia consume `DATA-DOM-007`.

Como mínimo deberán verificarse:

- completitud de hechos económicos;
- unicidad e idempotencia;
- integridad de correlaciones;
- moneda;
- periodo;
- clasificación económica;
- centro de costo;
- vigencia del método;
- estados elegibles;
- reconciliación;
- cobertura de fuentes;
- datos tardíos;
- reversos/correcciones;
- duplicados;
- linaje;
- calidad de denominadores;
- residuo de asignaciones;
- consistencia entre detalle y agregado.

La mera existencia de una vista, RPC o pantalla no concede estado `VALIDADO` o `VERIFICADO`.

Un resultado permanece `BLOQUEADO` si falta ingreso realizado, costo trazable, moneda compatible, periodo, denominador o reconciliación esencial.

#### 34. Publicación, visor y snapshots

Toda publicación consume `DATA-DOM-008`.

NUMERA deberá presentar explícitamente:

- versión de métrica;
- periodo;
- fecha de corte;
- moneda;
- filtros;
- dimensiones;
- estado real/presupuestado/forecast/simulado;
- fuente;
- frescura;
- cobertura;
- calidad;
- certificación.

El visor económico objetivo de `NUMERA-UX-028` deberá permitir comparar precio, costo, margen, equilibrio, presupuesto y escenarios sin ocultar el estado de cada dato.

La vista principal no debe mantener explicaciones técnicas permanentes como sustituto de una semántica clara. Fórmula, componentes, fuentes, método y linaje se exponen mediante divulgación progresiva y drill-down autorizado.

#### 35. Identidad de métricas y aliases técnicos

Esta tarea no crea una familia `METRIC-*` ni asigna claves nuevas por inferencia.

Nombres actuales como:

- `budget_amount`;
- `expected_revenue`;
- `actual_expenses`;
- `budget_variance`;
- `target_gross_margin_pct`;
- `break_even_revenue`;
- `total_cost`;
- `unit_cost`;
- `last_net_unit_cost`;
- `avg_stock_unit_cost`;

son evidencia o aliases técnicos de fuente.

No se convierten automáticamente en `metric_key` hasta que `DATA-INT-002` materialice el registro semántico conforme a `DATA-DOM-004`.

#### 36. Handoffs con propietario documental exacto

| Decisión o materialización fuera del alcance         | Propietario documental                                                                                       | Condición de salida                                                |
| ---------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------ |
| alcance económico versus contabilidad formal         | `NUMERA-DOM-001`, `NUMERA-DOM-013`, `NUMERA-DOM-015`, `NUMERA-DOM-017`                                       | antes de presentar NUMERA como contabilidad o libro oficial        |
| hechos económicos de venta                           | `NUMERA-DOM-002`                                                                                             | antes de certificar ingreso realizado y margen comercial           |
| hechos económicos de compra/recepción                | `NUMERA-DOM-003`                                                                                             | antes de certificar obligaciones y costo de adquisición completo   |
| hechos económicos de producción/inventario           | `NUMERA-DOM-004`, `NUMERA-UX-019`                                                                            | antes de certificar costo productivo y variaciones                 |
| gasto, soporte, aprobación, corrección y anulación   | `NUMERA-DOM-005`, `NUMERA-UX-009`, `NUMERA-UX-010`                                                           | antes de certificar gasto reconocido integral                      |
| identidad/vigencia de centros de costo               | `NUMERA-DOM-006`, `DATA-INT-003`                                                                             | antes de publicar análisis oficial por centro                      |
| método de costo estándar, real, landed y variaciones | `NUMERA-DOM-007`, `OPS-CST-001`                                                                              | antes de publicar costo económico oficial                          |
| rentabilidad multidimensional                        | `NUMERA-DOM-008`, `NUMERA-UX-022`                                                                            | antes de publicar margen/rentabilidad por dimensión                |
| caja, bancos, extractos y tesorería                  | `NUMERA-DOM-009`, `NUMERA-UX-017`, `NUMERA-UX-021`                                                           | antes de publicar liquidez real                                    |
| obligaciones y cuentas por pagar                     | `NUMERA-DOM-010`, `NUMERA-UX-020`                                                                            | antes de publicar saldos AP y vencimientos                         |
| periodos, cierres y reapertura                       | `NUMERA-DOM-011`, `NUMERA-UX-011`, `NUMERA-UX-023`                                                           | antes de certificar periodos cerrados y comparaciones históricas   |
| conciliación y diferencias                           | `NUMERA-DOM-014`, `NUMERA-UX-024`                                                                            | antes de certificar agregados provenientes de varias fuentes       |
| cartera y cuentas por cobrar                         | `NUMERA-DOM-016`, `NUMERA-UX-026`                                                                            | antes de publicar cartera, aging o exposición                      |
| extensión contable futura                            | `NUMERA-DOM-017`, `NUMERA-UX-027`                                                                            | antes de mapear hechos a plan de cuentas/comprobantes internos     |
| escenarios, supuestos y publicación                  | `NUMERA-DOM-018`, `NUMERA-AUTH-015`, `NUMERA-UX-028`                                                         | antes de publicar escenarios o simulaciones compartidas            |
| datos financieros sensibles, exportación y detalle   | `NUMERA-AUTH-002`, `NUMERA-AUTH-007`, `NUMERA-AUTH-008`, `NUMERA-AUTH-014`, `DATA-AUTH-001`, `DATA-AUTH-002` | antes de exponer detalle, banco, cartera o comparaciones sensibles |
| contratos analíticos de eventos/lectura              | `DATA-INT-001`                                                                                               | antes de ingestión analítica productiva                            |
| modelos semánticos, cálculos, snapshots y consultas  | `DATA-INT-002`                                                                                               | antes de servir métricas económico-financieras compartidas         |
| diagnóstico causal y anomalías                       | `DATA-DOM-014`                                                                                               | antes de explicar una variación como causa                         |
| metas, objetivos y guardrails                        | `DATA-DOM-015`                                                                                               | antes de gobernar objetivos financieros                            |
| experimentos y acciones de mejora                    | `DATA-DOM-016`                                                                                               | antes de declarar efecto de una intervención                       |
| restatements y reproducibilidad                      | `DATA-DOM-017`                                                                                               | antes de reexpresar resultados publicados                          |

No queda un bloqueo de D013 sin propietario documental y condición de salida.

#### 37. Cobertura de requisitos de prueba vigente

Las reglas de esta tarea ya están protegidas por requisitos vigentes:

- `TREQ-NUMERA-001` protege conciliación, trazabilidad de costos, márgenes, gastos, cierres, saldos y reportes;
- `TREQ-NUMERA-002` protege identidad del hecho económico, periodos, correcciones compensatorias y frontera con contabilidad formal;
- `TREQ-NUMERA-003` protege cartera, obligaciones, caja, bancos, tesorería, aplicación, conciliación y segregación;
- `TREQ-NUMERA-004` protege métodos de costo, distribuciones, presupuesto, forecast, punto de equilibrio, rentabilidad, escenarios y visor económico;
- `TREQ-DATA-002` protege identidad, fórmula, numerador, denominador, granularidad, dimensiones, moneda, calendario, fuente, calidad, versión y certificación de métricas;
- `TREQ-DATA-003` protege contratos de origen, cobertura, duplicados, integridad, datos tardíos, reconciliación y linaje;
- `TREQ-DATA-004` protege publicación, corte, moneda, filtros, calidad, snapshot, simulación, exportación, drill-down y restatements.

D013 especializa semántica y fórmulas dentro de esas reglas ya identificadas. No introduce un comportamiento ejecutable adicional ni cambia el alcance de esos requisitos.

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea materializa documentalmente las diez familias económico-financieras dentro de requisitos vigentes que ya protegen hechos económicos, costos, presupuesto, cartera, tesorería, rentabilidad, escenarios, moneda, calidad, conciliación y publicación. No modifica comportamiento ejecutable, contratos físicos, autorización, datos ni integración.

#### 38. Criterios de aceptación

1. las 10 familias de analítica económico-financiera están presentes exactamente una vez;
2. el total esperado es 10 y el total materializado es 10;
3. existen 0 faltantes y 0 duplicados;
4. NUMERA permanece capa económico-operativa y no se declara contabilidad formal;
5. venta, ingreso, cobro y depósito permanecen separados;
6. compra, recepción, obligación y pago permanecen separados;
7. costo de compra, costo productivo y costo económico oficial permanecen separados;
8. último costo y promedio de ORIGO no se convierten por inferencia en método de valoración oficial;
9. `total_cost` y `unit_cost` de FOGO permanecen evidencia técnica hasta reconciliación;
10. costo estándar declara método, versión, vigencia, unidad, moneda y componentes;
11. costo real exige hechos reconocidos y trazables;
12. costo unitario no se calcula con denominador ausente o cero;
13. producción multi-salida exige asignación versionada y reconciliación;
14. variación de costo conserva signo y base comparable;
15. saldo presupuestal y desviación presupuestal permanecen métricas distintas;
16. el campo técnico actual `budget_variance` no cambia silenciosamente de signo o significado;
17. gasto capturado no equivale automáticamente a gasto reconocido;
18. pago o salida de caja no equivale automáticamente a gasto;
19. centro de costo no equivale a sede, área, marca o canal;
20. costos compartidos usan pool, driver, versión, base, destinos y residuo explícito;
21. asignación con denominador inválido no se fabrica;
22. ingreso esperado no se usa como ingreso realizado;
23. margen bruto usa ingreso realizado y costo trazable;
24. contribución usa costos variables elegibles bajo política vigente;
25. margen porcentual no se calcula con denominador inválido;
26. punto de equilibrio real usa razón de contribución compatible;
27. el cálculo actual con margen objetivo se trata como simulación hasta certificación;
28. presupuesto original, revisión, forecast, escenario y real permanecen separados;
29. una actualización de la fila presupuestal no satisface por sí sola versionado histórico;
30. forecast conserva corte, horizonte, supuestos y versión;
31. error de forecast se compara contra una versión publicada anterior al resultado;
32. liquidez real usa efectivo y bancos disponibles/reconciliados;
33. cartera no se suma como efectivo real;
34. obligación no pagada afecta proyección, no flujo realizado;
35. flujo realizado y proyectado permanecen separados;
36. recaudo sin aplicación no cierra cartera por coincidencia de monto;
37. pago sin aplicación no cierra obligación por coincidencia de monto;
38. aging usa saldo abierto y vencimiento al corte;
39. rentabilidad usa ingreso realizado, costo trazable y asignaciones aprobadas;
40. residuo no atribuible permanece visible;
41. ventas anónimas no se imputan a clientes;
42. no se define ROI sin denominador explícito;
43. escenarios no alteran datos reales;
44. publicado, simulado, forecast y presupuesto no se colapsan;
45. monedas incompatibles no se suman sin conversión gobernada;
46. toda conversión conserva monto/moneda originales y tasa con fuente/vigencia;
47. un formateador COP no constituye conversión;
48. periodos económico, contable, fiscal y operativo permanecen separados;
49. eventos tardíos no reescriben silenciosamente periodos publicados;
50. conciliaciones no fabrican el lado faltante;
51. costo faltante no se transforma en cero;
52. presupuesto ausente no se transforma en cero;
53. saldo negativo conserva signo y causa;
54. calidad y certificación consumen `DATA-DOM-007`;
55. publicación consume `DATA-DOM-008`;
56. materialización consume `DATA-INT-001` y `DATA-INT-002`;
57. reconciliación de dimensiones/maestros externos consume `DATA-INT-003`;
58. no se crea un namespace de métricas ni `metric_key` inventadas;
59. cada bloqueo tiene propietario documental exacto y condición de salida;
60. se identifican y gobiernan las cuatro divergencias semánticas actuales;
61. no se crea, modifica, difiere, descarta ni vuelve obsoleto ningún requisito de prueba;
62. no se ejecuta código, DDL, DML, migración, backfill, pago, cierre ni cambio de Supabase;
63. `DATA-DOM-014` permanece únicamente reservada.

#### 39. Continuidad

```text
ÚLTIMA TAREA APROBADA
DATA-DOM-012 — Definir analítica de servicio, clientes, fidelización, reputación y experiencia

TAREA ACTUAL APROBADA
DATA-DOM-013 — Definir analítica de costos, rentabilidad, liquidez, presupuesto y escenarios

SIGUIENTE TAREA RESERVADA
DATA-DOM-014 — Definir diagnóstico transversal, anomalías, causas, oportunidades y nivel de confianza
```


### ✅ DATA-DOM-014 — Definir diagnóstico transversal, anomalías, causas, oportunidades y nivel de confianza

**Estado:** APROBADA
**Tarea anterior:** `DATA-DOM-013 — Definir analítica de costos, rentabilidad, liquidez, presupuesto y escenarios` — APROBADA
**Tarea siguiente:** `DATA-DOM-015 — Definir objetivos, líneas base, metas, drivers, guardrails y planes de medición` — RESERVADA
**Tipo de tarea:** documental; contrato canónico de diagnóstico transversal, investigación de variaciones y anomalías, causalidad, oportunidades y confianza
**Bloque:** AB — Analítica, indicadores y datos maestros
**Fase:** exclusivamente documental
**Implementación técnica:** no autorizada
**Código, DDL, DML, migraciones, backfills, cambios de datos, modelos productivos, automatizaciones, experimentos, despliegues o acciones empresariales:** no autorizados

#### 1. Propósito

Definir cómo Vento OS convierte una señal analítica en una investigación explicable sin confundir variación con anomalía, correlación con causa, hipótesis con conclusión, oportunidad con acción ni confianza metodológica con certificación de datos.

La tarea cierra documentalmente `CAP-17.10 — Identificar problemas y oportunidades` y deberá permitir que cualquier diagnóstico transversal responda, como mínimo:

```text
qué cambió
respecto de qué referencia cambió
cuánto cambió
qué población, periodo y dimensiones están afectadas
qué estado de calidad tienen las fuentes
qué factores candidatos se investigaron
qué evidencia apoya y contradice cada hipótesis
qué explicaciones alternativas siguen abiertas
qué relación temporal existe entre factor y resultado
qué impacto observado o potencial puede sostenerse
qué nivel de confianza tiene cada afirmación
qué lenguaje causal está autorizado
qué oportunidades quedan identificadas
quién es propietario de la interpretación empresarial
qué debe ocurrir antes de convertir la oportunidad en meta, acción o experimento
```

D014 no crea un motor físico de anomalías, un modelo predictivo, una recomendación automática ni una plataforma de BI. Define el contrato empresarial que esos componentes deberán respetar cuando sean materializados por sus tareas propietarias.

#### 2. Resultado sustantivo

Queda materializado el contrato diagnóstico transversal con los siguientes resultados:

- las **55 familias analíticas** heredadas de `DATA-DOM-009` a `DATA-DOM-013` quedan preservadas como entradas posibles de investigación: 11 comerciales, 12 de inventario y abastecimiento, 10 productivas, 12 de servicio y clientes y 10 económico-financieras;
- reconciliación del inventario heredado: **55 esperadas; 55 materializadas; 0 faltantes; 0 duplicadas**;
- separación canónica entre métrica, señal, variación, anomalía, incidente de calidad, diferencia de reconciliación, hipótesis, diagnóstico, causa, oportunidad, objetivo, acción, experimento y resultado;
- ruta canónica de investigación desde señal hasta oportunidad sin ejecución automática;
- ocho patrones diagnósticos permitidos para describir desviaciones sin inventar causalidad;
- seis niveles canónicos de confianza diagnóstica, desde `NO_EVALUABLE` hasta `EFECTO_COMPROBADO`;
- ocho dimensiones mínimas de evidencia que condicionan el nivel de confianza;
- reglas de tope que impiden elevar confianza cuando faltan calidad, comparabilidad, precedencia temporal, evidencia o control de explicaciones alternativas;
- separación entre calidad/certificación de datos de `DATA-DOM-007` y confianza diagnóstica de esta tarea;
- reglas explícitas para impacto, oportunidades, priorización, lenguaje causal, modelos estadísticos, BI e inteligencia artificial;
- cinco rutas de investigación transversal que conectan comercial, inventario, producción, servicio y finanzas sin transferir propiedad de los hechos;
- handoffs exactos hacia `DATA-DOM-015`, `DATA-DOM-016`, `DATA-DOM-017`, `DATA-UX-005`, `DATA-AUTH-003`, `DATA-AUTH-004` y `DATA-INT-001` a `DATA-INT-004`;
- cero cambios físicos y cero cambios de requisitos de prueba.

#### 3. Decisión principal

Vento OS adopta un modelo de **diagnóstico trazable por afirmaciones**.

```text
FUENTE PROPIETARIA
→ conserva hechos, maestros, eventos y expedientes

CAPA SEMÁNTICA
→ conserva definición, población, granularidad, dimensiones y versión de métricas

CALIDAD / CERTIFICACIÓN
→ determina si las entradas son utilizables para la coordenada solicitada

SEÑAL
→ indica que existe algo que merece observarse o investigar

INVESTIGACIÓN
→ localiza, compara, segmenta, contrasta y reúne evidencia

HIPÓTESIS
→ propone una explicación comprobable

DIAGNÓSTICO
→ registra qué explicación está respaldada, qué alternativas permanecen y con qué confianza

OPORTUNIDAD
→ expresa un espacio de mejora, protección o captura de valor
→ no ejecuta una acción

DATA-DOM-015
→ define objetivos, líneas base, metas, drivers, guardrails y plan de medición

DATA-DOM-016
→ define acciones, experimentos, responsables, seguimiento y comprobación

DATA-DOM-017
→ gobierna correcciones históricas, restatements y reproducibilidad
```

Ningún dashboard, modelo, algoritmo, herramienta BI, hoja de cálculo o sistema de inteligencia artificial adquiere autoridad empresarial por detectar una anomalía o proponer una explicación.

#### 4. Fuentes y decisiones heredadas

D014 consume sin redefinir:

- `DATA-DOM-001` a `DATA-DOM-003` para propiedad, identidad, dimensiones, jerarquías, aliases, vigencias y fuentes de verdad;
- `DATA-DOM-004` para registro, semántica, fórmula, denominadores, unidad, moneda, calendario, propietario y versión de métricas;
- `DATA-DOM-005` para granularidad, tiempo, dimensiones, comparabilidad y snapshots analíticos;
- `DATA-DOM-006` para ingestión, transformación, reconciliación, datos tardíos, backfills y linaje;
- `DATA-DOM-007` para calidad, frescura, cobertura, integridad, reconciliación y los estados `NO EVALUADO`, `EN OBSERVACIÓN`, `CERTIFICADO`, `DEGRADADO` y `BLOQUEADO`;
- `DATA-DOM-008` para reportes, tableros, alertas, exportaciones, suscripciones y snapshots;
- `DATA-DOM-009` para las once familias comerciales;
- `DATA-DOM-010` para las doce familias de inventario, abastecimiento, proveedores y logística;
- `DATA-DOM-011` para las diez familias productivas;
- `DATA-DOM-012` para las doce familias de servicio, clientes, fidelización, reputación y experiencia;
- `DATA-DOM-013` para las diez familias económico-financieras;
- `CAP-SCOPE-017` para la obligación de construir diagnóstico transversal, variaciones, anomalías, oportunidades explicables, impacto, confianza, restricciones y ruta de investigación;
- `TREQ-DATA-005` como protección preexistente de la separación entre señal, diagnóstico, hipótesis, acción, experimento, confianza, aprendizaje y decisión;
- `DATA-UX-005` como superficie futura de investigación de variaciones, anomalías y causas;
- `DATA-INT-004` como frontera futura para BI, hojas de cálculo, modelos analíticos e inteligencia artificial.

Las fuentes anteriores conservan sus estados y bloqueos. D014 no convierte una entrada `NO EVALUADO`, `DEGRADADO` o `BLOQUEADO` en información certificada.

#### 5. Fronteras conceptuales obligatorias

```text
métrica ≠ señal ≠ variación ≠ anomalía
```

```text
anomalía de negocio ≠ incidente de calidad de datos
```

```text
diferencia de reconciliación ≠ caída de desempeño
```

```text
alerta ≠ diagnóstico ≠ recomendación ≠ acción
```

```text
correlación ≠ causalidad ≠ hipótesis respaldada ≠ efecto comprobado
```

```text
factor candidato ≠ causa principal ≠ causa raíz
```

```text
impacto observado ≠ impacto potencial ≠ beneficio realizado
```

```text
oportunidad ≠ objetivo ≠ meta ≠ plan ≠ experimento
```

```text
confianza diagnóstica ≠ certificación de datos ≠ probabilidad estadística
```

```text
explicación generada por modelo ≠ evidencia fuente
```

```text
escenario simulado ≠ contrafactual observado ≠ resultado real
```

```text
incumplimiento de meta ≠ anomalía estadística
```

Un mismo hecho puede participar en varias métricas, pero no se tratará como evidencia independiente varias veces por aparecer en distintos agregados derivados.

#### 6. Autoridad funcional y segregación

| Responsabilidad                                | Autoridad o propietario lógico                             | Regla                                                                                    |
| ---------------------------------------------- | ---------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| hechos operativos y maestros                   | aplicación propietaria de cada dominio                     | conserva la fuente de verdad; el diagnóstico no reescribe el hecho                       |
| definición de métrica                          | propietario de la definición + gobierno de BLOQUE AB       | ninguna investigación redefine fórmulas localmente                                       |
| calidad y certificación de entradas            | steward/certificador conforme a D007 y autorización futura | estado de calidad se consume, no se inventa en el diagnóstico                            |
| semántica diagnóstica y confianza              | BLOQUE AB                                                  | define contrato común, niveles y lenguaje permitido                                      |
| interpretación empresarial de una causa        | propietario funcional del dominio afectado                 | valida que la interpretación tenga sentido empresarial y preserve fronteras de propiedad |
| investigación transversal                      | BLOQUE AB + VISO + propietarios                            | VISO puede alojar el expediente futuro sin adquirir propiedad de hechos                  |
| publicación de conclusión                      | rol autorizado por `DATA-AUTH-003`                         | investigar no concede permiso para certificar o publicar                                 |
| auditoría de consultas/modelos/recomendaciones | `DATA-AUTH-004`                                            | toda automatización o consulta sensible conserva trazabilidad                            |
| objetivo y meta                                | `DATA-DOM-015`                                             | no se fijan por inferencia desde una anomalía                                            |
| acción o experimento                           | `DATA-DOM-016`                                             | una oportunidad no ejecuta cambios por sí sola                                           |

Un analista, modelo o sistema puede formular una hipótesis. La aprobación de una interpretación empresarial permanece separada de la capacidad técnica para calcularla.

#### 7. Coordenada mínima de todo diagnóstico

Cada conclusión diagnóstica deberá declarar, como mínimo:

| Coordenada            | Contenido obligatorio                                                               |
| --------------------- | ----------------------------------------------------------------------------------- |
| objeto investigado    | métrica, hecho, proceso o familia analítica afectada                                |
| versión semántica     | versión de métrica, fórmula, población e inclusiones/exclusiones                    |
| periodo y corte       | ventana observada y fecha/hora de corte                                             |
| granularidad          | unidad de observación y agregación                                                  |
| dimensiones           | empresa, sede, área, canal, producto, cliente, centro, proveedor u otras aplicables |
| referencia            | periodo, plan, presupuesto, peer, distribución o modelo contra el que se compara    |
| fuentes               | hechos y maestros propietarios utilizados                                           |
| calidad               | estado D007 de cada dependencia crítica                                             |
| cobertura             | qué población está incluida y qué queda fuera                                       |
| evidencia             | elementos que apoyan, contradicen o limitan la conclusión                           |
| factores candidatos   | explicaciones investigadas y relación propuesta                                     |
| alternativas          | explicaciones plausibles todavía abiertas o descartadas con evidencia               |
| impacto               | magnitud observada o potencial, unidad y método                                     |
| confianza             | nivel D014 con justificación y límites                                              |
| propietario           | función responsable de la interpretación empresarial                                |
| estado de publicación | exploratorio, interno controlado u oficial según autorización futura                |

Dos diagnósticos no se consideran comparables si difieren materialmente en versión, población, periodo, granularidad, dimensiones, moneda, unidad, referencia o cobertura sin una reconciliación explícita.

#### 8. Inventario heredado: 55 familias disponibles para investigación

Las familias se conservan exactamente con los nombres aprobados en D009 a D013. La columna **Rol diagnóstico** no cambia su semántica; únicamente define cómo puede participar en una investigación.

##### 8.1. Comercial — 11 familias de DATA-DOM-009

|    # | Familia canónica                             | Rol diagnóstico autorizado                      | Límite obligatorio                                                           |
| ---: | -------------------------------------------- | ----------------------------------------------- | ---------------------------------------------------------------------------- |
|    1 | ventas netas y brutas                        | señal, resultado e impacto comercial            | ingreso o venta no prueba margen ni causa                                    |
|    2 | pedidos y conversión                         | señal de volumen/funnel y segmentación          | conversión requiere denominador gobernado antes de cuantificar causa         |
|    3 | ticket y unidades                            | señal de intensidad y mezcla                    | ticket y unidades comparten población solo cuando la definición lo demuestra |
|    4 | mezcla por producto, categoría, canal y sede | localización de cambio composicional            | cambio de mezcla puede explicar agregados, pero no es causa por sí mismo     |
|    5 | demanda por franja, día y temporada          | patrón temporal y referencia comparable         | estacionalidad robusta exige cobertura suficiente                            |
|    6 | disponibilidad perdida                       | factor candidato de demanda no satisfecha       | permanece bloqueada sin intención y disponibilidad reconciliadas             |
|    7 | cancelaciones, devoluciones y descuentos     | factor, resultado o impacto según el expediente | no colapsar cancelación, devolución y descuento                              |
|    8 | promociones y efecto incremental             | hipótesis de intervención comercial             | descuento o before/after no prueba promoción ni efecto causal                |
|    9 | recurrencia y frecuencia                     | comportamiento longitudinal                     | identidad y finalidad autorizadas son requisito previo                       |
|   10 | margen relacionado                           | impacto económico consumido                     | no recalcular margen fuera de D013                                           |
|   11 | capacidad comercial no utilizada             | restricción o capacidad candidata               | venta baja no prueba capacidad ociosa                                        |

##### 8.2. Inventario, abastecimiento, proveedores y logística — 12 familias de DATA-DOM-010

|    # | Familia canónica                        | Rol diagnóstico autorizado                                | Límite obligatorio                                                                |
| ---: | --------------------------------------- | --------------------------------------------------------- | --------------------------------------------------------------------------------- |
|    1 | existencia disponible y comprometida    | contexto de disponibilidad y restricción                  | disponible/comprometida global hereda sus bloqueos de fuente                      |
|    2 | cobertura y días de inventario          | señal de exposición y restricción                         | no existe cobertura sin consumo/demanda compatible                                |
|    3 | rotación y permanencia                  | señal de movimiento, obsolescencia o capital inmovilizado | requiere historia y cohorte/lote comparables                                      |
|    4 | faltantes y quiebres                    | evento o factor candidato                                 | stock cero no prueba faltante o quiebre sin necesidad elegible                    |
|    5 | vencimiento, daño y pérdida             | hecho de pérdida/calidad e impacto                        | causa debe provenir de evidencia explícita, no de diferencia residual             |
|    6 | diferencias de conteo                   | señal de integridad física/reconciliación                 | diferencia de conteo puede ser causa operativa o síntoma; debe investigarse       |
|    7 | cumplimiento de remisiones              | señal de cumplimiento interno                             | preparación, despacho, recepción y faltante permanecen separados                  |
|    8 | lead time y cumplimiento de proveedores | factor temporal y de abastecimiento                       | lead time requiere evento contractual de inicio y recepción aceptada              |
|    9 | compras urgentes                        | señal de excepción                                        | recepción de emergencia no equivale automáticamente a compra urgente regularizada |
|   10 | consumo versus plan                     | relación entre consumo real y base planificada            | bloqueado si no existe plan compatible                                            |
|   11 | costo de inventario                     | impacto económico                                         | valoración oficial consume D013; memoria de costo no es fórmula financiera        |
|   12 | capacidad de almacenamiento             | restricción física candidata                              | exige denominador físico utilizable y unidad compatible                           |

##### 8.3. Producción, rendimiento, capacidad, merma y calidad — 10 familias de DATA-DOM-011

|    # | Familia canónica                            | Rol diagnóstico autorizado                       | Límite obligatorio                                                         |
| ---: | ------------------------------------------- | ------------------------------------------------ | -------------------------------------------------------------------------- |
|    1 | demanda planificada versus producción       | señal plan-real y localización de brecha         | señal, pedido o remisión no sustituyen el plan aceptado                    |
|    2 | capacidad disponible y utilizada            | restricción o factor candidato                   | no mezclar unidades de capacidad sin puente explícito                      |
|    3 | adherencia al programa                      | señal temporal de ejecución                      | exige programa publicado y versionado                                      |
|    4 | rendimiento teórico y real                  | señal de rendimiento y posible factor productivo | versión de receta, escala y unidad deben ser comparables                   |
|    5 | consumo estándar y real                     | variación de consumo por ingrediente             | sustituciones y unidades deben preservarse                                 |
|    6 | merma, reproceso y aprovechamiento          | pérdida, retrabajo o recuperación observada      | no derivar merma automáticamente de una diferencia de rendimiento          |
|    7 | calidad, retención y rechazo                | señal/resultado de calidad                       | control, conformidad, retención, rechazo y liberación permanecen separados |
|    8 | tiempo de ciclo                             | señal temporal y cuello de botella candidato     | requiere hitos reales; una fecha genérica no prueba duración de fases      |
|    9 | cumplimiento de liberación                  | resultado de calidad/cumplimiento                | producción terminada no equivale a liberada                                |
|   10 | costo y variación por lote, producto y sede | impacto económico/productivo                     | costo técnico FOGO no se eleva a costo económico oficial                   |

##### 8.4. Servicio, clientes, fidelización, reputación y experiencia — 12 familias de DATA-DOM-012

|    # | Familia canónica                                        | Rol diagnóstico autorizado                    | Límite obligatorio                                                          |
| ---: | ------------------------------------------------------- | --------------------------------------------- | --------------------------------------------------------------------------- |
|    1 | cumplimiento de promesa                                 | señal de servicio y resultado de cumplimiento | promesa solicitada no equivale a promesa aceptada                           |
|    2 | tiempos de preparación, despacho y entrega              | localización temporal del deterioro           | no fabricar fase cuando falta un hito real                                  |
|    3 | pedidos completos                                       | resultado de cumplimiento                     | estado terminal no prueba completitud línea a línea                         |
|    4 | reclamos y tiempo de resolución                         | señal de problema y expediente de impacto     | reclamo requiere expediente; contacto o chat no lo sustituyen               |
|    5 | compensaciones                                          | impacto y respuesta de servicio               | devolución, refund, descuento, cortesía, cupón y puntos no son equivalentes |
|    6 | satisfacción y feedback                                 | señal perceptual                              | sesgo de respuesta y denominador de invitaciones deben permanecer visibles  |
|    7 | recurrencia, frecuencia y abandono                      | comportamiento longitudinal                   | ausencia no prueba abandono sin población y ventana elegibles               |
|    8 | adquisición y activación                                | señal de entrada y progresión                 | cuenta creada o login no equivalen a activación                             |
|    9 | fidelización, puntos y redenciones                      | señal de comportamiento de fidelización       | saldo no sustituye el ledger de movimientos                                 |
|   10 | reputación y temas recurrentes                          | señal temática o reputacional                 | feedback interno no equivale a reputación pública; drivers requieren D014   |
|   11 | reservas, no-show y utilización                         | señal de capacidad/servicio                   | utilización requiere capacidad compatible                                   |
|   12 | valor y rentabilidad del cliente cuando esté autorizado | impacto económico por población autorizada    | rentabilidad consume D013 y detalle sensible consume DATA-AUTH              |

##### 8.5. Costos, rentabilidad, liquidez, presupuesto y escenarios — 10 familias de DATA-DOM-013

|    # | Familia canónica              | Rol diagnóstico autorizado                 | Límite obligatorio                                                                |
| ---: | ----------------------------- | ------------------------------------------ | --------------------------------------------------------------------------------- |
|    1 | costos estándar y reales      | señal base-real e impacto                  | costo económico oficial permanece bloqueado hasta método y reconciliación         |
|    2 | variaciones                   | señal diagnóstica primaria                 | cada variación conserva su base; no mezclar costo, presupuesto, precio y cantidad |
|    3 | margen y contribución         | impacto y resultado económico              | exige ingreso realizado y costo/costo variable trazables                          |
|    4 | gastos                        | señal e impacto económico                  | gasto capturado no equivale automáticamente a reconocido o pagado                 |
|    5 | centros de costo              | dimensión de localización                  | centro no equivale a sede, área, marca o canal                                    |
|    6 | presupuesto y forecast        | comparador planificado o pronosticado      | presupuesto, forecast, revisión, escenario y real permanecen separados            |
|    7 | caja, bancos y tesorería      | señal de liquidez y restricción financiera | posición real exige saldos reconciliados y disponibilidad                         |
|    8 | cartera y obligaciones        | señal de exposición y flujo futuro         | pago/cobro sin aplicación no cierra saldo                                         |
|    9 | rentabilidad multidimensional | impacto económico transversal              | exige ingreso realizado, costo trazable y asignaciones aprobadas                  |
|   10 | escenarios y simulaciones     | comparador hipotético y exploración        | un escenario no constituye evidencia observada ni prueba causal                   |

**Reconciliación:** `11 + 12 + 10 + 12 + 10 = 55` familias. **55 esperadas; 55 materializadas; 0 faltantes; 0 duplicadas.**

#### 9. Regla de herencia de estado

D014 nunca mejora el estado de certificación de una entrada por utilizarla en una investigación.

Reglas:

1. una familia `BLOQUEADO` puede aparecer como brecha, restricción o tema de investigación, pero no producir una cifra oficial que dependa del dato bloqueado;
2. una familia `NO EVALUADO` puede soportar exploración con estado visible, pero no se presenta como evidencia certificada;
3. una fuente `DEGRADADO` conserva la degradación en toda conclusión dependiente;
4. una fuente `EN OBSERVACIÓN` no se transforma en `CERTIFICADO` por triangulación informal;
5. solo una entrada `CERTIFICADO` puede presentarse como certificada para el uso, periodo, versión y corte concretos que cubre;
6. combinar varias fuentes débiles no produce automáticamente una fuente fuerte;
7. un diagnóstico oficial hereda el peor estado material de sus dependencias críticas conforme a D007.

#### 10. Unidad diagnóstica

La unidad mínima de investigación es una **afirmación diagnóstica trazable**, no un dashboard completo ni una narrativa libre.

Cada afirmación deberá vincular:

```text
SEÑAL
→ REFERENCIA
→ POBLACIÓN
→ EVIDENCIA
→ FACTOR O HIPÓTESIS
→ ALTERNATIVAS
→ IMPACTO
→ CONFIANZA
→ PROPIETARIO
→ CONCLUSIÓN
```

Un mismo expediente puede contener múltiples afirmaciones con niveles de confianza distintos. No se asignará un único porcentaje de confianza a toda una investigación para ocultar diferencias entre conclusiones.

#### 11. Señal

Una señal es un hecho analítico que merece atención, por ejemplo:

- una variación material observada;
- un patrón fuera de la referencia esperada;
- una ruptura de relación histórica;
- una diferencia de reconciliación;
- una concentración o dispersión inusual;
- una recurrencia de excepción;
- un deterioro de cobertura o calidad;
- una restricción demostrada;
- una oportunidad cuantificable bajo una definición aprobada.

Una señal no requiere haber identificado causa.

Una señal deberá declarar:

- métrica o hecho fuente;
- versión;
- valor observado;
- referencia;
- magnitud absoluta y relativa cuando ambas sean válidas;
- población;
- dimensiones;
- periodo y corte;
- calidad/certificación;
- método que produjo la señal;
- si fue detectada manualmente, por regla, por estadística o por modelo.

#### 12. Variación

Una variación es una diferencia entre un valor observado y una base comparable.

Formas permitidas incluyen:

```text
observado - referencia
```

```text
(observado - referencia) / |referencia|
```

solo cuando el denominador sea válido y la métrica permita comparación relativa.

La referencia puede ser:

- periodo anterior comparable;
- mismo periodo de una temporada anterior;
- plan o programa aprobado;
- presupuesto publicado;
- forecast publicado antes del resultado;
- segmento comparable;
- distribución histórica compatible;
- rango técnico gobernado;
- modelo esperado versionado y autorizado.

No se inventa una referencia universal. La referencia debe ser declarada y defendible para la métrica investigada.

Una diferencia respecto de una meta futura pertenece al seguimiento de `DATA-DOM-015`; no se denomina automáticamente anomalía.

#### 13. Ocho patrones diagnósticos de anomalía

D014 reconoce ocho patrones descriptivos. Ninguno implica causalidad por sí mismo.

|    # | Patrón                                     | Definición                                                             | Ejemplo de uso                                                  |
| ---: | ------------------------------------------ | ---------------------------------------------------------------------- | --------------------------------------------------------------- |
|    1 | desviación de nivel                        | el valor difiere materialmente de una referencia compatible            | venta, costo, tiempo o merma por encima/debajo del comparador   |
|    2 | cambio de tendencia                        | cambia dirección o pendiente respecto de una trayectoria comparable    | caída sostenida de recurrencia o crecimiento de gasto           |
|    3 | cambio de volatilidad                      | aumenta o disminuye dispersión/variabilidad                            | variabilidad de rendimiento, tiempos o demanda                  |
|    4 | cambio de distribución o mezcla            | cambia la composición entre categorías o segmentos                     | mezcla de canal, producto, proveedor o tipo de gasto            |
|    5 | ruptura temporal o estacional              | el patrón esperado por hora, día, semana o temporada deja de repetirse | demanda o cumplimiento fuera de estacionalidad comparable       |
|    6 | divergencia entre segmentos                | poblaciones comparables evolucionan de forma diferente                 | sedes, canales, productos o cohortes con trayectoria divergente |
|    7 | ruptura de relación o reconciliación       | una relación que debería conciliar deja residuo o pierde consistencia  | venta-pago, orden-recepción, plan-producción, stock-conteo      |
|    8 | recurrencia o concentración de excepciones | excepciones se concentran en una dimensión o se repiten con patrón     | faltantes, rechazos, reclamos, urgencias o reprocesos           |

El método de detección deberá declarar su versión, población, mínimo de observaciones aplicable, tratamiento de faltantes, estacionalidad, outliers y sensibilidad. D014 no fija un umbral estadístico universal.

#### 14. Anomalía de negocio, calidad y reconciliación

Antes de investigar desempeño deberá clasificarse la señal:

| Clase                     | Pregunta                                                                               | Tratamiento                                                                      |
| ------------------------- | -------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| comportamiento de negocio | ¿el hecho cambió realmente en la operación?                                            | investigar factores empresariales                                                |
| calidad de datos          | ¿la señal puede provenir de fuente vencida, faltante, duplicada, inválida o degradada? | priorizar D007/flujo de remediación antes de causalidad                          |
| reconciliación            | ¿dos representaciones del mismo proceso no concilian?                                  | conservar diferencia y resolver fuentes/contratos antes de interpretar desempeño |
| cambio semántico          | ¿cambió fórmula, población, dimensión o versión?                                       | no comparar como continuidad hasta reconciliar versiones                         |
| cambio de cobertura       | ¿entró o salió una fuente, sede, canal o población?                                    | explicar cobertura antes de atribuir cambio a la operación                       |

Una anomalía aparente producida por una ruptura de datos no se presenta como problema empresarial.

#### 15. Ruta canónica de investigación

Toda investigación seguirá el orden lógico mínimo:

1. **confirmar la señal**: reproducir el resultado con la versión, corte y población declarados;
2. **verificar calidad**: revisar D007, cobertura, frescura, integridad y reconciliación;
3. **clasificar la señal**: negocio, calidad, reconciliación, semántica o cobertura;
4. **localizar la variación**: segmentar únicamente por dimensiones autorizadas y compatibles;
5. **establecer temporalidad**: identificar qué ocurrió antes, durante y después del cambio;
6. **enumerar factores candidatos**: incluir factores internos, externos y restricciones conocidas;
7. **enumerar alternativas**: registrar explicaciones plausibles que compiten con la hipótesis principal;
8. **reunir evidencia**: conservar evidencia favorable, contradictoria y faltante;
9. **comprobar dependencia entre evidencias**: no contar dos derivados del mismo hecho como confirmaciones independientes;
10. **asignar confianza**: aplicar la escala y sus topes;
11. **estimar impacto**: solo con métricas y unidades gobernadas;
12. **formular oportunidades**: describir espacio de mejora sin ejecutar solución;
13. **transferir**: a D015 cuando requiera objetivo/medición o a D016 cuando exista acción/experimento candidato.

La investigación puede concluir legítimamente en `SIN_CAUSA_RESUELTA`. La presión por producir una explicación no justifica inventar una causa dominante.

#### 16. Factores candidatos y causalidad

Un **factor candidato** es una variable, evento, condición o restricción que podría contribuir al resultado observado.

Cada factor deberá declarar:

- mecanismo empresarial propuesto;
- relación temporal con el resultado;
- población donde debería observarse el efecto;
- evidencia favorable;
- evidencia contradictoria;
- explicaciones alternativas;
- condiciones bajo las cuales no aplicaría;
- nivel de confianza alcanzado;
- propietario funcional capaz de validar la interpretación.

Tipos de relación admitidos en una investigación:

```text
coincidencia temporal
asociación descriptiva
factor contribuyente plausible
hipótesis respaldada
relación con evidencia causal
intervención con efecto comprobado
```

El tipo de relación se comunica expresamente; no se sustituye por una etiqueta genérica de “causa”.

#### 17. Causa explícita de expediente

Cuando un proceso propietario registra una causa mediante un expediente gobernado —por ejemplo un motivo aprobado, investigación de incidente, rechazo, devolución, diferencia o problema— D014 puede consumir esa afirmación como **evidencia de causa declarada por el proceso**.

Eso no significa que:

- la causa declarada explique todos los efectos posteriores;
- el código de motivo sea verdadero por definición;
- una categoría de cierre sustituya evidencia;
- la misma causa se generalice a otras sedes, productos, periodos o poblaciones.

La fuente, actor, fecha, versión y evidencia del expediente deberán permanecer trazables.

#### 18. Regla de precedencia temporal

Una causa propuesta debe preceder al efecto en el mecanismo analizado.

Reglas:

1. una variable registrada después del resultado no se presenta como causa del resultado por mera correlación;
2. un estado de cierre puede describir el resultado de una investigación, pero no prueba cuándo se originó la condición causal;
3. variables agregadas en el mismo periodo requieren suficiente resolución temporal para establecer orden cuando la causalidad dependa de él;
4. un patrón simultáneo solo permite asociación salvo que exista diseño adicional que identifique dirección;
5. cambios de precio, promoción, disponibilidad, capacidad, receta, proveedor, proceso o política deberán usar la vigencia realmente aplicable al hecho.

#### 19. Explicaciones alternativas y confusión

Ninguna hipótesis alcanzará un nivel causal alto si ignora explicaciones alternativas materiales conocidas.

Como mínimo, según el caso deberán evaluarse:

- cambio de cobertura o fuente;
- cambio de fórmula o definición;
- estacionalidad/calendario;
- precio o promoción;
- mezcla de producto/canal/sede/cliente;
- disponibilidad de inventario;
- capacidad productiva o logística;
- cambio de proveedor o lead time;
- calidad, rechazo o liberación;
- cambio de servicio o promesa;
- presupuesto, forecast o escenario usado como referencia;
- eventos extraordinarios externos documentados;
- datos tardíos, backfills o restatements;
- sesgo de selección, identidad o población;
- otra intervención simultánea.

Descartar una alternativa exige evidencia, no ausencia de una etiqueta.

#### 20. Seis niveles canónicos de confianza diagnóstica

La confianza diagnóstica es ordinal y explicable. No representa una probabilidad universal.

| Nivel                  | Semántica                                                                                                       | Condiciones mínimas                                                                                                               | Lenguaje permitido                                                                |
| ---------------------- | --------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- |
| `NO_EVALUABLE`         | no existe base suficiente para interpretar la señal                                                             | falta una dependencia crítica, comparador, calidad mínima o evidencia esencial                                                    | “no evaluable”, “información insuficiente”, “causa no resuelta”                   |
| `SEÑAL_DESCRIPTIVA`    | el cambio observado es reproducible, pero no se atribuye a un factor                                            | señal reproducida, población/corte declarados y limitaciones visibles                                                             | “se observó”, “aumentó/disminuyó”, “se concentra en”                              |
| `ASOCIACION`           | existe relación reproducible entre resultado y factor, sin identificación causal                                | comparabilidad razonable, relación consistente y dependencia de evidencias reconocida                                             | “está asociado con”, “coincide con”, “es compatible con”                          |
| `HIPOTESIS_RESPALDADA` | múltiples evidencias apoyan un mecanismo y las alternativas materiales fueron investigadas                      | precedencia temporal, mecanismo plausible, triangulación no redundante, evidencia contradictoria tratada                          | “la evidencia respalda la hipótesis de que”, sin declarar causa demostrada        |
| `EVIDENCIA_CAUSAL`     | existe una estrategia de identificación capaz de separar razonablemente el factor de explicaciones alternativas | datos aptos, temporalidad, comparador/control o diseño cuasi-experimental/causal gobernado, supuestos y sensibilidad explícitos   | “la evidencia apoya un efecto causal bajo estos supuestos y contexto”             |
| `EFECTO_COMPROBADO`    | una intervención o experimento gobernado observó el efecto bajo un diseño previamente definido                  | evidencia producida conforme a `DATA-DOM-016`, población y guardrails definidos, resultado reproducible y limitaciones declaradas | “el efecto fue comprobado en la población, ventana y condiciones del experimento” |

`EFECTO_COMPROBADO` no significa verdad universal ni autoriza generalización automática a otra sede, población, canal, producto o periodo.

#### 21. Confianza diagnóstica no equivale a calidad de datos

Los estados de D007 y los niveles de D014 son ejes distintos:

| Eje                        | Pregunta                                                                      |
| -------------------------- | ----------------------------------------------------------------------------- |
| calidad/certificación D007 | ¿los datos y resultados son suficientemente confiables para el uso declarado? |
| confianza diagnóstica D014 | ¿qué tan respaldada está la afirmación sobre relación, mecanismo o efecto?    |

Un dato puede ser `CERTIFICADO` y solo permitir `SEÑAL_DESCRIPTIVA` si no existe evidencia causal. Una relación metodológicamente sofisticada no puede compensar una dependencia crítica `BLOQUEADO`.

#### 22. Ocho dimensiones mínimas de evidencia para confianza

Cada afirmación diagnóstica deberá evaluarse al menos en estas ocho dimensiones:

| Dimensión                   | Pregunta obligatoria                                                                          |
| --------------------------- | --------------------------------------------------------------------------------------------- |
| calidad de fuente           | ¿las dependencias críticas tienen estado D007 compatible con el uso?                          |
| cobertura                   | ¿la población observada representa el alcance de la conclusión?                               |
| comparabilidad              | ¿resultado y referencia comparten definición, unidad, granularidad, calendario y dimensiones? |
| precedencia temporal        | ¿el factor ocurre antes del efecto cuando el mecanismo lo exige?                              |
| mecanismo                   | ¿existe una explicación empresarial coherente y verificable del vínculo?                      |
| alternativas                | ¿se investigaron explicaciones materiales competidoras?                                       |
| estabilidad/replicación     | ¿la relación persiste en ventanas, segmentos o repeticiones compatibles cuando corresponde?   |
| intervención/identificación | ¿existe diseño que permita separar efecto de correlación cuando se usa lenguaje causal?       |

La evidencia no se promedia mecánicamente. Una falla crítica puede limitar el nivel completo.

#### 23. Topes obligatorios de confianza

1. una dependencia crítica `BLOQUEADO` fuerza `NO_EVALUABLE` para la conclusión que dependa de ella;
2. una diferencia no reproducible fuerza `NO_EVALUABLE`;
3. sin referencia comparable, el máximo es `SEÑAL_DESCRIPTIVA`;
4. sin precedencia temporal demostrable, el máximo es `ASOCIACION` para afirmaciones causales;
5. sin investigación de alternativas materiales, el máximo es `ASOCIACION`;
6. evidencia redundante derivada del mismo hecho no eleva el nivel por multiplicidad;
7. un output de IA o de un modelo predictivo por sí solo no eleva por encima de `ASOCIACION`;
8. un p-value, score, feature importance, SHAP value, correlación o precisión predictiva por sí solos no demuestran causalidad;
9. `EVIDENCIA_CAUSAL` exige fuentes aptas para el uso, estrategia de identificación y supuestos explícitos;
10. `EFECTO_COMPROBADO` solo puede consumir evidencia de intervención/experimento gobernada por `DATA-DOM-016`;
11. un diagnóstico no puede tener mayor alcance territorial, temporal o poblacional que la evidencia que lo sustenta;
12. si la fórmula o definición de la métrica cambió dentro de la ventana, la comparabilidad debe resolverse antes de elevar confianza.

#### 24. Prohibición de score universal de confianza

D014 no crea un porcentaje universal de confianza ni una fórmula fija ponderada.

Una implementación futura podrá calcular scores auxiliares si:

- la fórmula está versionada;
- sus componentes y pesos son explicables;
- el score no sustituye el nivel ordinal ni sus puertas obligatorias;
- un componente crítico ausente no puede compensarse con otros valores altos;
- la precisión del modelo no se presenta como probabilidad de causalidad;
- la versión del modelo y del dataset quedan trazables.

#### 25. Dependencia entre métricas y evidencia no independiente

La investigación deberá usar linaje para evitar falsa triangulación.

Ejemplos:

- ventas netas, ticket y margen pueden compartir las mismas ventas de origen;
- cobertura, quiebre y disponibilidad pueden depender del mismo snapshot de inventario;
- rendimiento, merma y costo técnico pueden compartir el mismo lote;
- satisfacción, recurrencia y valor de cliente pueden compartir la misma población identificada;
- margen, rentabilidad y punto de equilibrio pueden compartir los mismos componentes económicos.

Tres métricas derivadas del mismo hecho no equivalen a tres fuentes independientes.

#### 26. Impacto observado

El impacto observado cuantifica una diferencia ya ocurrida.

Deberá declarar:

- resultado afectado;
- población;
- periodo y corte;
- magnitud absoluta;
- magnitud relativa cuando el denominador sea válido;
- unidad o moneda;
- método de atribución, si existe;
- incertidumbre o rango cuando el método lo produzca;
- parte no atribuible o residual;
- calidad y confianza aplicables.

Reglas:

1. el impacto comercial no se monetiza sin una base económica gobernada cuando sea necesaria;
2. margen, costo y rentabilidad consumen D013;
3. merma física no se convierte automáticamente en costo financiero;
4. reclamo o rating no se convierte automáticamente en pérdida de cliente;
5. falta de inventario no se convierte automáticamente en venta perdida;
6. una correlación no autoriza atribuir el 100 % de una variación a un factor;
7. el residuo no explicado permanece visible.

#### 27. Impacto potencial

El impacto potencial es una estimación de lo que podría evitarse, recuperarse o capturarse. No es un beneficio realizado.

Se permite cuando declara:

- línea de referencia;
- supuesto o escenario;
- horizonte;
- población;
- mecanismo;
- límites;
- sensibilidad;
- confianza;
- dependencia de D013 cuando sea monetario.

Un escenario D013 puede apoyar una estimación potencial, pero no se presenta como evidencia de que el efecto ocurrirá.

#### 28. Oportunidad

Una oportunidad es un espacio de mejora, protección o captura de valor suficientemente descrito para evaluar una intervención futura.

La oportunidad deberá contener:

- señal o diagnóstico que la origina;
- población y contexto;
- resultado empresarial afectado;
- impacto observado o potencial;
- factor o mecanismo relevante;
- nivel de confianza;
- restricciones y dependencias;
- propietario funcional;
- riesgos de actuar y de no actuar;
- información faltante;
- ruta siguiente: medición/objetivos en D015 o acción/experimento en D016.

Una oportunidad se redacta en términos de resultado, por ejemplo:

```text
reducir exposición a faltantes en la población X
```

no como una orden de ejecución como:

```text
subir automáticamente el stock mínimo
```

La elección de la acción pertenece a D016.

#### 29. Priorización de oportunidades

D014 no crea una fórmula universal de prioridad.

Toda priorización futura deberá mostrar por separado:

- impacto potencial;
- urgencia o ventana de decisión;
- confianza;
- riesgo;
- reversibilidad;
- esfuerzo o dependencia conocida;
- disponibilidad de medición;
- restricciones legales, de seguridad, calidad o capacidad.

Una oportunidad de alto impacto y baja confianza no se oculta detrás de un score único. Puede priorizarse para **investigación**, no necesariamente para ejecución.

#### 30. Cinco rutas transversales de investigación

Estas rutas son guías de exploración y no cadenas causales predefinidas.

##### 30.1. Comercial y demanda

```text
ventas / pedidos / ticket / demanda
→ revisar cobertura y mezcla
→ revisar disponibilidad y quiebres
→ revisar capacidad productiva cuando aplique
→ revisar promesa, tiempos y servicio
→ revisar precio, descuento, promoción y margen
→ separar asociación, restricción y causa
```

##### 30.2. Inventario y abastecimiento

```text
existencia / cobertura / faltante / vencimiento
→ revisar demanda y consumo
→ revisar remisiones y proveedores
→ revisar plan productivo y capacidad
→ revisar costos de inventario y liquidez
→ identificar restricción, excepción o problema de datos
```

##### 30.3. Producción y calidad

```text
plan / capacidad / rendimiento / consumo / merma / calidad
→ revisar disponibilidad de insumos
→ revisar receta, versión, ruta y programa
→ revisar liberación y ciclo
→ revisar efecto en servicio y venta
→ revisar costo y variación económica
```

##### 30.4. Servicio y cliente

```text
promesa / tiempos / completitud / reclamos / satisfacción
→ revisar pedido y canal
→ revisar inventario y producción
→ revisar logística y cumplimiento
→ revisar compensaciones, recurrencia y reputación
→ revisar impacto económico solo con D013
```

##### 30.5. Económica y financiera

```text
costo / variación / margen / gasto / liquidez / rentabilidad
→ descender hasta ventas, compras, inventario, producción y servicio
→ separar real, presupuesto, forecast y escenario
→ revisar asignaciones y reconciliaciones
→ conservar residuo no explicado
→ no convertir diferencia económica en causa operacional sin evidencia
```

#### 31. Diagnóstico de promociones y cambios deliberados

Para promociones, precios, procesos, políticas u otras intervenciones deliberadas:

1. debe existir identidad y versión de la intervención;
2. debe conocerse población expuesta y periodo;
3. un descuento observado no prueba exposición a promoción;
4. before/after simple produce, como máximo, evidencia descriptiva o asociativa si no controla cambios concurrentes;
5. estacionalidad, disponibilidad, canal, mezcla, capacidad y otras intervenciones simultáneas son alternativas materiales;
6. un contrafactual o grupo comparable debe estar gobernado antes de usar lenguaje causal;
7. la comprobación experimental pertenece a `DATA-DOM-016`.

#### 32. Diagnóstico de restricciones

Una restricción puede explicar que un resultado no alcance un valor esperado, pero deberá probarse en la misma población y ventana.

Ejemplos de restricciones posibles:

- inventario disponible;
- capacidad productiva;
- capacidad de almacenamiento;
- capacidad comercial gobernada;
- lead time;
- liberación de calidad;
- disponibilidad logística;
- liquidez o obligación financiera;
- autorización o cumplimiento cuando afecte ejecución.

Una restricción nominal no es evidencia de que haya sido vinculante en el caso investigado.

#### 33. Diagnóstico de eventos raros y poblaciones pequeñas

Un hallazgo sobre pocas observaciones puede ser operacionalmente importante y estadísticamente inestable al mismo tiempo.

Reglas:

- declarar tamaño de población y cobertura;
- no ocultar inestabilidad por usar porcentajes;
- no inferir rasgos individuales desde agregados;
- aplicar `DATA-AUTH-002` antes de exponer grupos pequeños o sensibles;
- conservar la posibilidad de revisión cualitativa mediante expediente cuando la estadística no sea suficiente;
- no aumentar confianza por severidad del impacto.

#### 34. Modelos estadísticos y predictivos

Un modelo puede:

- detectar patrones;
- estimar una expectativa;
- segmentar;
- clasificar;
- pronosticar;
- sugerir factores para investigar.

Un modelo predictivo no adquiere por ello autoridad causal.

Todo uso deberá conservar:

- objetivo del modelo;
- versión;
- dataset y corte;
- variables de entrada;
- exclusiones;
- población de entrenamiento y evaluación;
- métricas de desempeño;
- sesgos/limitaciones conocidas;
- fecha de entrenamiento o actualización;
- responsable;
- linaje hacia fuentes gobernadas.

La integración física y gobierno de modelos corresponde a `DATA-INT-004`.

#### 35. Inteligencia artificial y recomendaciones

Una herramienta de inteligencia artificial puede asistir en:

- resumir evidencia;
- proponer preguntas;
- sugerir segmentaciones;
- identificar inconsistencias para revisión;
- generar hipótesis candidatas;
- explicar una consulta o visualización.

No puede por sí sola:

- certificar datos;
- declarar una causa;
- aprobar una oportunidad;
- fijar una meta;
- ejecutar una acción empresarial;
- modificar una fuente de verdad;
- ocultar evidencia contradictoria;
- reemplazar al propietario funcional.

Toda recomendación asistida debe poder mostrar fuentes, contexto y limitaciones. `DATA-INT-004` gobierna su integración y `DATA-AUTH-004` su auditoría.

#### 36. Lenguaje causal autorizado

La redacción deberá corresponder al nivel de confianza.

| Situación            | Lenguaje recomendado                                            | Lenguaje prohibido sin evidencia adicional                 |
| -------------------- | --------------------------------------------------------------- | ---------------------------------------------------------- |
| señal descriptiva    | “se observó una caída de…”                                      | “X causó la caída”                                         |
| asociación           | “la caída está asociada con…”                                   | “la caída se debe a…”                                      |
| hipótesis respaldada | “la evidencia respalda la hipótesis de…”                        | “la causa confirmada es…”                                  |
| evidencia causal     | “la evidencia apoya un efecto causal bajo…”                     | “X siempre causa Y”                                        |
| efecto comprobado    | “el efecto fue observado bajo las condiciones del experimento…” | generalizar fuera de población/ventana sin nueva evidencia |

La incertidumbre no se oculta mediante lenguaje categórico.

#### 37. Evidencia favorable, contradictoria y faltante

Cada conclusión deberá conservar tres conjuntos separados:

```text
EVIDENCIA FAVORABLE
EVIDENCIA CONTRADICTORIA
EVIDENCIA FALTANTE O NO DISPONIBLE
```

Reglas:

- evidencia contradictoria no se elimina para elevar confianza;
- falta de evidencia no se registra como evidencia en contra;
- ausencia de una causa alternativa observada no demuestra que no exista;
- una evidencia posterior puede reducir la confianza de una conclusión anterior;
- si una conclusión oficial cambia, D017 deberá gobernar la corrección o restatement aplicable.

#### 38. Auditoría y reproducibilidad del diagnóstico

Todo expediente deberá conservar:

- actor o proceso que inició la investigación;
- fecha/hora;
- señal original;
- consultas o modelos utilizados;
- versiones de métricas;
- fuentes y cortes;
- filtros y dimensiones;
- evidencia incorporada;
- hipótesis creadas, descartadas o revisadas;
- cambios de nivel de confianza y motivo;
- propietario funcional que revisó la interpretación;
- oportunidad resultante, si existe;
- relación con acciones o experimentos posteriores.

La materialización técnica de logs, modelos, consultas y recomendaciones pertenece a `DATA-AUTH-004`, `DATA-INT-002` y `DATA-INT-004`.

#### 39. Publicación y drill-down

Un diagnóstico publicado deberá mostrar, como mínimo:

- conclusión;
- nivel de confianza;
- estado de calidad de entradas críticas;
- periodo y corte;
- población y dimensiones;
- impacto;
- principales evidencias favorables;
- alternativas materiales no resueltas;
- límites de generalización;
- propietario;
- ruta de drill-down autorizada.

La publicación consume `DATA-DOM-008`. El detalle sensible o de poblaciones pequeñas consume `DATA-AUTH-001` y `DATA-AUTH-002`.

Un resultado exploratorio no se estiliza como conclusión oficial.

#### 40. Handoffs con propietario documental exacto

| Decisión o materialización fuera del alcance                             | Propietario documental     | Condición de salida                                                    |
| ------------------------------------------------------------------------ | -------------------------- | ---------------------------------------------------------------------- |
| objetivos, líneas base, metas, drivers y guardrails                      | `DATA-DOM-015`             | antes de convertir oportunidad en objetivo medible                     |
| acciones, experimentos, responsables y comprobación                      | `DATA-DOM-016`             | antes de ejecutar o declarar efecto de una intervención                |
| correcciones históricas, restatements y reproducibilidad publicada       | `DATA-DOM-017`             | antes de reexpresar una conclusión oficial histórica                   |
| experiencia de investigación de variaciones, anomalías y causas          | `DATA-UX-005`              | antes de implementar la superficie de investigación                    |
| experiencia de objetivos y acciones de mejora                            | `DATA-UX-006`              | antes de implementar seguimiento de mejora                             |
| segregación de definición, certificación, publicación, metas y anotación | `DATA-AUTH-003`            | antes de conceder capacidades sobre diagnósticos y conclusiones        |
| auditoría de consultas, modelos y recomendaciones                        | `DATA-AUTH-004`            | antes de automatizar o registrar investigación productiva              |
| contratos de eventos y lectura                                           | `DATA-INT-001`             | antes de ingestión productiva de evidencia especializada               |
| capa semántica, consultas, modelos, snapshots y rendimiento              | `DATA-INT-002`             | antes de materializar cálculo y navegación diagnóstica                 |
| crosswalks e identidades externas                                        | `DATA-INT-003`             | antes de atribuir diferencias entre fuentes a una misma entidad        |
| BI, hojas, modelos analíticos e inteligencia artificial                  | `DATA-INT-004`             | antes de conectar herramientas externas o modelos a diagnósticos       |
| causas explícitas de incidentes/problemas tecnológicos                   | `TI-DOM-007`, `TI-DOM-008` | antes de reutilizar una causa TI como evidencia transversal            |
| causas y diferencias económico-financieras                               | `NUMERA-DOM-014`           | antes de certificar conciliaciones o causas financieras de diferencias |

No queda una decisión material de D014 diferida sin propietario documental exacto y condición de salida.

#### 41. Cobertura de requisitos de prueba vigente

La semántica de esta tarea ya está protegida por requisitos vigentes:

- `TREQ-DATA-005` exige separar señal, diagnóstico, hipótesis, acción, experimento, responsable, línea base, meta, indicador, drivers, guardrails, ventana, segmentos, resultado, confianza, aprendizaje y decisión; además prohíbe presentar correlación como causa demostrada y prohíbe que una recomendación ejecute cambios por sí sola;
- `TREQ-DATA-002` protege definición, fórmula, población, granularidad, dimensiones, unidad, moneda, fuente, calidad, versión y comparación de métricas;
- `TREQ-DATA-003` protege cobertura, duplicados, integridad, datos tardíos, reconciliación, linaje y separación entre ausencia y cero;
- `TREQ-DATA-004` protege alertas, publicación, corte, calidad, snapshots, drill-down y separación entre artefactos analíticos;
- los requisitos propietarios de cada dominio continúan protegiendo sus hechos y comportamientos operativos.

D014 especializa el contrato diagnóstico dentro de estas reglas ya identificadas. No cambia su alcance, estado, prioridad, modalidad, relaciones ni destino de implementación.

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea materializa documentalmente el diagnóstico transversal, la escala de confianza, las reglas de causalidad, impacto y oportunidades dentro de requisitos vigentes que ya protegen la separación entre señal, diagnóstico, hipótesis, acción, experimento, confianza, calidad, publicación y causalidad. No introduce comportamiento ejecutable, contrato físico, autorización, dato, integración ni modelo productivo nuevo.

#### 42. Criterios de aceptación

1. las 55 familias heredadas de D009 a D013 están presentes exactamente una vez;
2. la reconciliación es 55 esperadas, 55 materializadas, 0 faltantes y 0 duplicadas;
3. se preservan exactamente los nombres de las 11 familias comerciales;
4. se preservan exactamente los nombres de las 12 familias de inventario/abastecimiento;
5. se preservan exactamente los nombres de las 10 familias productivas;
6. se preservan exactamente los nombres de las 12 familias de servicio/clientes;
7. se preservan exactamente los nombres de las 10 familias económico-financieras;
8. D014 no mejora ni sobrescribe el estado de certificación heredado de ninguna familia;
9. métrica, señal, variación y anomalía permanecen conceptos distintos;
10. anomalía de negocio, calidad de datos, reconciliación, cambio semántico y cambio de cobertura se clasifican antes de causalidad;
11. alerta, diagnóstico, recomendación y acción permanecen separados;
12. correlación no se presenta como causa;
13. hipótesis respaldada no equivale a efecto comprobado;
14. causa explícita de expediente conserva fuente, actor, fecha y alcance;
15. una causa declarada no se generaliza por inferencia;
16. precedencia temporal es obligatoria cuando el mecanismo causal la exige;
17. una variable posterior no se usa como causa por mera correlación;
18. explicaciones alternativas materiales se registran y evalúan;
19. ausencia de evidencia no se convierte en evidencia en contra;
20. evidencia contradictoria permanece visible;
21. se definen exactamente ocho patrones diagnósticos descriptivos;
22. los patrones de anomalía no implican causalidad;
23. no existe un umbral estadístico universal inventado;
24. todo método de detección declara versión, población y tratamiento de faltantes;
25. se definen exactamente seis niveles de confianza diagnóstica;
26. `NO_EVALUABLE` es el nivel mínimo cuando falta evidencia esencial;
27. `SEÑAL_DESCRIPTIVA` no atribuye factores;
28. `ASOCIACION` no autoriza lenguaje causal;
29. `HIPOTESIS_RESPALDADA` exige temporalidad, mecanismo y alternativas investigadas;
30. `EVIDENCIA_CAUSAL` exige estrategia de identificación y supuestos explícitos;
31. `EFECTO_COMPROBADO` exige evidencia gobernada por D016;
32. confianza diagnóstica permanece separada de certificación D007;
33. una fuente `CERTIFICADO` no crea por sí sola evidencia causal;
34. una fuente crítica `BLOQUEADO` impide evaluar la conclusión dependiente;
35. sin referencia comparable, el máximo es `SEÑAL_DESCRIPTIVA`;
36. sin precedencia temporal, el máximo causal es `ASOCIACION`;
37. sin evaluar alternativas materiales, el máximo es `ASOCIACION`;
38. outputs derivados del mismo hecho no se cuentan como evidencias independientes;
39. un output de IA no eleva por sí solo confianza causal;
40. correlación, p-value, feature importance, SHAP o precisión predictiva no prueban causa por sí solos;
41. no se crea un porcentaje universal de confianza;
42. impacto observado y potencial permanecen separados;
43. impacto económico consume las definiciones de D013;
44. falta de inventario no se convierte automáticamente en venta perdida;
45. merma física no se convierte automáticamente en pérdida monetaria;
46. reclamo o rating no se convierte automáticamente en abandono;
47. el residuo no atribuido permanece visible;
48. escenario simulado no se presenta como evidencia observada;
49. oportunidad no equivale a acción;
50. una oportunidad declara impacto, confianza, restricciones, propietario y ruta siguiente;
51. priorización no oculta impacto, confianza, riesgo y esfuerzo dentro de un score opaco;
52. las cinco rutas transversales son guías de investigación, no cadenas causales predefinidas;
53. promoción exige identidad/exposición antes de atribución;
54. before/after simple no demuestra efecto causal;
55. una restricción debe probarse como vinculante en la misma población y ventana;
56. grupos pequeños conservan tamaño, inestabilidad y protección de DATA-AUTH-002;
57. un modelo predictivo no adquiere autoridad causal;
58. IA puede asistir pero no certificar datos, declarar causa, fijar meta ni ejecutar acción;
59. lenguaje causal se ajusta al nivel de confianza;
60. toda conclusión conserva evidencia favorable, contradictoria y faltante;
61. todo expediente conserva fuentes, cortes, consultas/modelos, versiones y cambios de confianza;
62. la publicación muestra confianza, calidad, periodo, población, impacto, alternativas y límites;
63. cada handoff tiene tarea propietaria exacta y condición de salida;
64. no se crea, modifica, difiere, descarta ni vuelve obsoleto ningún requisito de prueba;
65. no se ejecuta código, DDL, DML, migración, backfill, modelo, experimento, acción empresarial ni cambio de Supabase;
66. `DATA-DOM-015` permanece únicamente reservada.

#### 43. Continuidad

```text
ÚLTIMA TAREA APROBADA
DATA-DOM-013 — Definir analítica de costos, rentabilidad, liquidez, presupuesto y escenarios

TAREA ACTUAL APROBADA
DATA-DOM-014 — Definir diagnóstico transversal, anomalías, causas, oportunidades y nivel de confianza

SIGUIENTE TAREA RESERVADA
DATA-DOM-015 — Definir objetivos, líneas base, metas, drivers, guardrails y planes de medición
```


### ✅ DATA-DOM-015 — Definir objetivos, líneas base, metas, drivers, guardrails y planes de medición

**Estado:** APROBADA
**Tarea anterior:** `DATA-DOM-014 — Definir diagnóstico transversal, anomalías, causas, oportunidades y nivel de confianza` — APROBADA
**Tarea siguiente:** `DATA-DOM-016 — Definir acciones de mejora, experimentos, responsables, seguimiento y comprobación de resultados` — RESERVADA
**Tipo de tarea:** documental; contrato canónico de objetivos medibles, líneas base, metas, KPI priorizados, drivers, guardrails y planes de medición
**Bloque:** AB — Analítica, indicadores y datos maestros
**Fase:** exclusivamente documental
**Implementación técnica:** no autorizada
**Código, DDL, DML, migraciones, backfills, cambios de datos, automatizaciones, experimentos, despliegues, acciones empresariales o cambios en Supabase:** no autorizados
**Requisitos de prueba creados o modificados:** 0

#### 1. Propósito

Definir cómo Vento OS convierte una oportunidad, obligación o prioridad empresarial en un objetivo medible sin confundir intención con meta, línea base con referencia futura, KPI con cualquier métrica visible, driver con causa demostrada ni guardrail con un indicador decorativo.

La tarea materializa el contrato documental necesario para que todo objetivo pueda responder, sin ambigüedad:

```text
qué resultado empresarial se quiere cambiar, proteger o mantener
por qué existe el objetivo
quién responde por el resultado
qué métrica registrada será el indicador principal
cuál es la línea base reproducible
qué meta se pretende alcanzar y en qué horizonte
qué drivers se observarán
qué guardrails limitarán daño o desplazamiento no deseado
qué población, segmentos y dimensiones aplican
qué calidad mínima necesitan los datos
qué cadencia y cortes se usarán
qué regla determina si el resultado puede evaluarse
qué cambios semánticos impiden una comparación directa
qué evidencia deberá conservarse
qué debe quedar listo antes de pasar a acciones o experimentos
```

D015 no crea metas numéricas arbitrarias, no configura alertas, no ejecuta acciones, no inicia experimentos y no declara resultados obtenidos. Las fuentes canónicas actuales no contienen valores objetivo empresariales universales para las familias analíticas de D009 a D013; inventarlos violaría el gobierno de datos y de decisiones. La tarea completa el contrato que permite registrar valores concretos cuando exista una decisión empresarial autorizada.

#### 2. Resultado sustantivo

Queda materializado el contrato canónico de objetivos y medición con los siguientes resultados:

- una cadena obligatoria que separa oportunidad, objetivo, indicador principal, línea base, meta, drivers, guardrails, plan de medición, acción y resultado;
- una coordenada mínima de objetivo con propósito de decisión, propietario, población, periodo, contexto, métrica y evidencia;
- una regla de **un indicador principal por objetivo**, sin impedir métricas secundarias explicativas;
- línea base obligatoria, reproducible y anterior a la evaluación del objetivo;
- cinco formas semánticas admitidas para expresar una meta sin inventar valores: punto, mínimo, máximo, rango y cambio respecto de línea base;
- drivers contextualizados que no adquieren causalidad por ser llamados drivers;
- guardrails obligatorios para todo riesgo material identificado, con decisión explícita cuando una dimensión no aplique;
- plan de medición completo con corte, cadencia, ventana, segmentos, calidad, comparabilidad, tratamiento de faltantes y regla de evaluación;
- reglas de activación que impiden tratar como objetivo medible oficial una especificación cuyo indicador, línea base o guardrail crítico esté `BLOQUEADO`;
- separación entre calidad/certificación de D007, confianza diagnóstica de D014 y evaluación de objetivo de D015;
- preservación de las **55 familias analíticas** de D009 a D013 como universo de medición contextual: 11 comerciales, 12 de inventario y abastecimiento, 10 productivas, 12 de servicio y clientes y 10 económico-financieras;
- reconciliación del inventario heredado: **55 esperadas; 55 decisiones de elegibilidad materializadas; 0 faltantes; 0 duplicadas**;
- ninguna familia es declarada KPI global por conveniencia de dashboard;
- cero valores meta inventados y cero nuevas `metric_key`;
- handoff cerrado hacia D016 para acciones y experimentos, hacia D017 para restatements y hacia las tareas DATA-AUTH, DATA-UX y DATA-INT correspondientes;
- cero cambios físicos y cero cambios de requisitos de prueba.

#### 3. Decisión principal

Vento OS adopta un modelo de **objetivo medible gobernado por contexto**.

```text
DIAGNÓSTICO U OPORTUNIDAD
→ describe qué merece atención y con qué confianza

OBJETIVO
→ declara el resultado empresarial que se quiere cambiar, proteger o mantener

INDICADOR PRINCIPAL
→ usa una métrica registrada y versionada para evaluar el resultado

LÍNEA BASE
→ fija el punto de comparación observado y reproducible

META
→ declara el resultado objetivo, el operador y el horizonte

DRIVERS
→ observan factores o mecanismos relevantes sin adquirir causalidad automática

GUARDRAILS
→ vigilan daño, desplazamiento o deterioro no deseado

PLAN DE MEDICIÓN
→ fija población, ventana, cortes, calidad, comparabilidad y regla de evaluación

DATA-DOM-016
→ define y gobierna acciones, experimentos, responsables y comprobación

DATA-DOM-017
→ gobierna correcciones históricas, restatements y reproducibilidad
```

Un objetivo no se vuelve medible por aparecer en un tablero. Una cifra no se vuelve KPI por ocupar una tarjeta destacada. Una meta no se vuelve válida por existir como número en una configuración.

#### 4. Fuentes y decisiones heredadas

D015 consume sin redefinir:

- `DATA-DOM-001` a `DATA-DOM-003` para propiedad, stewardship, identidad, dimensiones, jerarquías, vigencias y fuentes de verdad;
- `DATA-DOM-004` para identidad, versión, fórmula, numerador, denominador, granularidad, dimensiones, filtros, unidad, moneda, calendario, fuente, calidad y propósito de las métricas;
- `DATA-DOM-005` para granularidad, tiempo, calendario, snapshots y comparabilidad histórica;
- `DATA-DOM-006` para ingestión, transformación, backfill, reconciliación, linaje y datos tardíos;
- `DATA-DOM-007` para las diez dimensiones de calidad y los estados `NO EVALUADO`, `EN OBSERVACIÓN`, `CERTIFICADO`, `DEGRADADO` y `BLOQUEADO`;
- `DATA-DOM-008` para tableros, reportes, alertas, exportaciones, suscripciones y snapshots oficiales;
- `DATA-DOM-009` a `DATA-DOM-013` para las 55 familias analíticas disponibles como entradas de medición;
- `DATA-DOM-014` para diagnóstico, oportunidades, ocho patrones de anomalía, seis niveles de confianza y límites de causalidad;
- `CAP-SCOPE-017`, especialmente `CAP-17.11` y `CAP-17.12`, para el ciclo común con responsable, línea base, meta, drivers, guardrails, ventana, segmentos, evidencia y efectos no deseados;
- `TREQ-DATA-005` como protección preexistente del ciclo de mejora y de la separación entre señal, diagnóstico, hipótesis, acción, experimento, responsable, línea base, meta, indicador principal, drivers, guardrails, ventana, segmentos, resultado, confianza, aprendizaje y decisión;
- `DATA-UX-006` como superficie futura de objetivos, metas, drivers, guardrails y acciones de mejora;
- `DATA-AUTH-003` como frontera futura de segregación entre definición, certificación, publicación, fijación de metas, anotación y administración;
- `DATA-INT-002` como propietario futuro de la materialización técnica de modelos semánticos, cálculos y consultas;
- `DATA-INT-004` como frontera futura para BI, hojas de cálculo, modelos analíticos e inteligencia artificial.

D015 no eleva el estado de calidad de ninguna fuente ni el nivel de confianza de ningún diagnóstico.

#### 5. Fronteras conceptuales obligatorias

```text
prioridad empresarial ≠ objetivo ≠ meta
```

```text
métrica ≠ KPI ≠ driver ≠ guardrail
```

```text
línea base ≠ meta ≠ benchmark ≠ forecast ≠ escenario
```

```text
umbral objetivo ≠ umbral de alerta ≠ límite técnico
```

```text
driver ≠ causa demostrada
```

```text
guardrail ≠ KPI secundario decorativo
```

```text
cumplir KPI ≠ cumplir objetivo si existe daño material en guardrails
```

```text
calidad de datos ≠ confianza diagnóstica ≠ cumplimiento de meta
```

```text
resultado observado ≠ resultado atribuible a una acción
```

```text
objetivo medible ≠ acción aprobada ≠ experimento autorizado
```

```text
cambio de meta ≠ restatement de historia
```

```text
meta aprobada ≠ valor real observado
```

#### 6. Autoridad y segregación

| Responsabilidad           | Autoridad lógica                                                         | Regla                                                                |
| ------------------------- | ------------------------------------------------------------------------ | -------------------------------------------------------------------- |
| resultado empresarial     | propietario funcional del dominio afectado                               | responde por el propósito del objetivo y su prioridad                |
| definición de métrica     | propietario de la definición + BLOQUE AB                                 | el objetivo consume la métrica; no redefine fórmula                  |
| línea base                | BLOQUE AB + propietario funcional + estado D007                          | debe ser reproducible bajo la misma versión y contexto               |
| valor y horizonte de meta | propietario funcional con capacidad futura gobernada por `DATA-AUTH-003` | no se infiere desde una anomalía ni desde la interfaz                |
| driver                    | propietario funcional + BLOQUE AB                                        | declara relación y evidencia; no adquiere causalidad automática      |
| guardrail                 | propietario funcional del riesgo o resultado protegido                   | limita daño o deterioro no deseado                                   |
| calidad/certificación     | funciones gobernadas por D007 y autorización futura                      | un objetivo no certifica sus propias entradas                        |
| publicación               | rol futuro gobernado por `DATA-AUTH-003`                                 | definir o medir no concede capacidad de publicar                     |
| acción o experimento      | `DATA-DOM-016` + propietario funcional                                   | D015 no autoriza ejecución                                           |
| materialización técnica   | `DATA-INT-002` y paquetes posteriores                                    | el contrato documental no prescribe tabla, vista, RPC ni herramienta |

La persona o función que fija una meta no adquiere por ello propiedad sobre la métrica ni sobre los hechos fuente.

#### 7. Coordenada mínima de un objetivo

Todo objetivo deberá declarar como mínimo:

| Coordenada                | Contenido obligatorio                                                             |
| ------------------------- | --------------------------------------------------------------------------------- |
| resultado empresarial     | qué se quiere mejorar, reducir, proteger, sostener o recuperar                    |
| justificación             | decisión, oportunidad, obligación o prioridad que origina el objetivo             |
| propietario funcional     | función responsable del resultado y de la decisión                                |
| indicador principal       | métrica registrada, versión y propósito de decisión                               |
| línea base                | valor observado, periodo, corte, población, versión y calidad                     |
| meta                      | operador, valor o rango aprobado, unidad y horizonte                              |
| drivers                   | métricas o factores observables asociados al mecanismo de mejora                  |
| guardrails                | métricas que protegen resultados o riesgos materiales distintos del KPI principal |
| población                 | inclusiones, exclusiones y estados computables                                    |
| dimensiones               | sedes, áreas, canales, productos, clientes, centros u otras aplicables            |
| periodo                   | horizonte del objetivo y ventanas de evaluación                                   |
| calendario/zona horaria   | semántica temporal compatible con la métrica                                      |
| fuentes                   | hechos y maestros propietarios consumidos                                         |
| calidad                   | estado D007 requerido para cada dependencia crítica                               |
| confianza                 | nivel D014 cuando el objetivo deriva de una hipótesis o diagnóstico               |
| segmentos                 | cortes predefinidos para comprobar heterogeneidad y evitar promedios engañosos    |
| cadencia                  | frecuencia de observación y de revisión empresarial                               |
| regla de evaluación       | cómo se determina si la meta puede compararse y evaluarse                         |
| tratamiento de guardrails | qué significa un incumplimiento para la evaluación del objetivo                   |
| evidencia                 | snapshots, consultas, versiones y decisiones que deberán conservarse              |

Dos objetivos con el mismo nombre narrativo no son equivalentes si difieren materialmente en métrica, versión, población, línea base, meta, horizonte o guardrails.

#### 8. Cadena obligatoria de objetivo y medición

Toda iniciativa medible seguirá, como mínimo, esta secuencia lógica:

```text
ORIGEN EMPRESARIAL
→ OBJETIVO
→ INDICADOR PRINCIPAL
→ LÍNEA BASE
→ META
→ DRIVERS
→ GUARDRAILS
→ PLAN DE MEDICIÓN
→ ELEGIBILIDAD PARA ACCIÓN O EXPERIMENTO EN D016
```

Reglas:

1. no se fija una meta antes de identificar el indicador principal y su unidad;
2. no se activa seguimiento oficial sin línea base reproducible o una excepción empresarial explícita que deje el objetivo `PENDIENTE_DE_EVIDENCIA`;
3. un objetivo derivado de D014 conserva la confianza diagnóstica que lo originó;
4. un driver no puede elevar la confianza causal más allá de D014;
5. un guardrail no puede ser omitido cuando existe un riesgo material conocido;
6. la acción se define después de que el objetivo y el plan de medición sean suficientes para comprobar resultados;
7. D015 no exige que todo objetivo origine un experimento; la decisión corresponde a D016 según riesgo, reversibilidad y necesidad de identificación causal.

#### 9. Estado de preparación de un objetivo

D015 utiliza los estados transversales de trabajo únicamente para describir preparación documental y evidencia, sin crear un catálogo técnico nuevo.

| Estado                   | Aplicación en D015                                                                                                                                           |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `ESPECIFICADO`           | objetivo, indicador, línea base, meta, drivers, guardrails y plan de medición están definidos documentalmente                                                |
| `PENDIENTE_DE_EVIDENCIA` | falta evidencia suficiente para cerrar línea base, comparabilidad, driver o guardrail sin inventar valores                                                   |
| `BLOQUEADO`              | una dependencia crítica o métrica necesaria está bloqueada y no permite evaluación oficial                                                                   |
| `VALIDADO`               | existe evidencia reproducible de que el contrato de medición puede evaluarse en la coordenada declarada; D015 no asigna este estado por redacción documental |
| `IMPLEMENTADO`           | existe materialización técnica operativa; fuera de la fase documental actual                                                                                 |
| `NO_APLICA`              | una dimensión o guardrail concreto se excluye con justificación y propietario                                                                                |
| `FUERA_DE_ALCANCE`       | el elemento pertenece a acción, experimento, autorización, UX, integración o restatement de otra tarea                                                       |

Ningún objetivo de esta tarea se declara `IMPLEMENTADO` o `VALIDADO` por la sola existencia del documento.

#### 10. Objetivo

Un objetivo expresa un resultado empresarial deseado, no una actividad.

Debe formularse con:

- resultado afectado;
- población y contexto;
- dirección deseada;
- razón empresarial;
- propietario;
- horizonte;
- indicador principal;
- restricción o riesgo material que deba protegerse.

Un objetivo no deberá redactarse como una solución técnica, una consulta, una pantalla, una automatización ni una herramienta.

La oportunidad de D014 puede originar un objetivo, pero no todo objetivo depende de un diagnóstico causal. También puede existir por obligación contractual, cumplimiento, planificación aprobada o decisión estratégica, siempre que el origen quede trazable y el propietario funcional lo respalde.

#### 11. Indicador principal

Cada objetivo tendrá exactamente **un indicador principal** para resolver la pregunta primaria de éxito.

Reglas:

1. el indicador principal consume una métrica registrada conforme a D004;
2. no se crea una fórmula local para adaptar el KPI a un dashboard;
3. si la métrica requerida todavía no está materializada como `metric_key`, el objetivo puede quedar `ESPECIFICADO` a nivel empresarial, pero su medición permanece `PENDIENTE_DE_EVIDENCIA` o `BLOQUEADO` según la fuente;
4. métricas secundarias pueden explicar composición, restricciones o efectos, pero no sustituyen el indicador principal;
5. la misma métrica puede ser KPI en un objetivo, driver en otro y guardrail en un tercero sin duplicar su definición;
6. la designación de KPI siempre es contextual al objetivo, población y horizonte;
7. ninguna métrica se vuelve KPI global por aparecer con frecuencia o por ser fácil de medir.

#### 12. Línea base

La línea base es el estado observado contra el que se evaluará el cambio del objetivo.

Deberá conservar:

- métrica y versión;
- valor o distribución observada;
- población;
- periodo de observación;
- fecha/hora de corte;
- granularidad;
- dimensiones;
- unidad o moneda;
- fuentes;
- calidad D007;
- cobertura;
- regla de agregación;
- snapshot o evidencia reproducible cuando aplique.

Reglas:

1. una línea base usa datos observados; forecast, presupuesto o escenario pueden ser comparadores o fuentes para fijar una meta, pero no sustituyen el observado base;
2. la línea base debe preceder la ventana en la que se pretende evaluar un cambio;
3. una media, mediana, percentil, tasa, suma u otra estadística solo se usa cuando pertenece a la definición gobernada de la métrica o al método de baseline declarado;
4. no se elige una ventana posterior al observar el resultado para favorecer una conclusión;
5. datos faltantes no se convierten en cero;
6. una fuente `BLOQUEADO` no produce línea base oficial;
7. una fuente `NO EVALUADO` o `EN OBSERVACIÓN` puede soportar exploración visible, pero no se presenta como línea base certificada;
8. una fuente `DEGRADADO` solo puede usarse si el propósito admite esa degradación y queda explícita;
9. una corrección posterior no sobrescribe silenciosamente la línea base originalmente publicada;
10. D017 gobierna la relación entre baseline original, reconstrucción, corrección histórica y restatement.

#### 13. Métodos de línea base

D015 admite tres métodos documentales, seleccionados según la naturaleza de la métrica:

| Método                        | Uso                                                      | Condición                                                     |
| ----------------------------- | -------------------------------------------------------- | ------------------------------------------------------------- |
| periodo fijo observado        | ventana histórica cerrada y comparable                   | periodo, corte y cobertura definidos antes de evaluación      |
| referencia histórica agregada | varios periodos comparables resumidos de forma gobernada | regla de agregación, estacionalidad y exclusiones explícitas  |
| cohorte o segmento comparable | población emparejada o segmento de referencia            | dimensiones, elegibilidad y diferencias materiales declaradas |

No existe una ventana universal de baseline. La selección deberá ser defendible para el objetivo y permanecer versionada.

#### 14. Meta

La meta declara el resultado objetivo que se pretende evaluar para el indicador principal.

Toda meta deberá conservar:

- indicador principal y versión;
- operador de cumplimiento;
- valor, rango o cambio aprobado;
- unidad o moneda;
- población;
- horizonte;
- fecha de vigencia;
- fecha o condición de evaluación;
- fuente de la decisión;
- propietario que la aprueba;
- supuestos materiales;
- relación con línea base;
- tratamiento de cambios posteriores.

D015 no fija valores numéricos universales porque no existe respaldo canónico actual para hacerlo.

#### 15. Cinco formas semánticas de meta

| Forma                         | Semántica                                                    | Ejemplo abstracto de evaluación                                    |
| ----------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------------ |
| punto                         | alcanzar un valor concreto                                   | resultado = valor objetivo bajo tolerancia declarada               |
| mínimo                        | no quedar por debajo de un valor                             | resultado ≥ mínimo aprobado                                        |
| máximo                        | no superar un valor                                          | resultado ≤ máximo aprobado                                        |
| rango                         | permanecer dentro de límites inferior y superior             | inferior ≤ resultado ≤ superior                                    |
| cambio respecto de línea base | mover el resultado una magnitud absoluta o relativa definida | resultado comparado con baseline bajo la misma versión y población |

La tabla define semántica, no valores vigentes.

Reglas:

1. una dirección como “mejorar” o “reducir” no sustituye una meta evaluable cuando el objetivo se declare listo para medición;
2. un valor visible en presupuesto, forecast, escenario, SLA, contrato o benchmark no se convierte automáticamente en meta; debe existir decisión explícita de usarlo como tal;
3. la meta debe usar unidad y semántica compatibles con el indicador principal;
4. una meta porcentual no se evalúa si el denominador no es válido;
5. una meta monetaria conserva moneda y regla de conversión aplicable;
6. cambiar la meta durante la ventana no reescribe la meta anterior; la nueva decisión conserva vigencia y motivo;
7. D017 gobierna la reconstrucción histórica cuando cambian definiciones o publicaciones.

#### 16. Fuente de la meta

Todo valor objetivo concreto deberá declarar de dónde proviene la decisión.

Fuentes válidas solo cuando estén documentadas y autorizadas pueden incluir:

- obligación legal, contractual o de seguridad aplicable;
- compromiso de servicio aprobado;
- presupuesto o plan aprobado;
- benchmark aceptado para la población y contexto;
- capacidad técnica u operativa gobernada;
- decisión estratégica del propietario funcional;
- resultado de un aprendizaje previo reproducible;
- análisis económico o escenario D013 usado explícitamente para decidir, sin confundir escenario con resultado real.

La fuente de la meta explica la decisión; no sustituye la evidencia de línea base.

#### 17. Driver

Un driver es una métrica o factor observable relacionado con el mecanismo mediante el cual se espera mover el indicador principal.

Cada driver deberá declarar:

- métrica o factor;
- versión o definición aplicable;
- dirección esperada de relación;
- población y ventana;
- evidencia disponible;
- nivel D014 cuando exista afirmación explicativa;
- propietario funcional;
- frecuencia de observación;
- límite de interpretación.

Reglas:

1. llamar driver a una métrica no demuestra causalidad;
2. un driver con nivel `SEÑAL_DESCRIPTIVA` o `ASOCIACION` se comunica como relación observada, no como palanca causal demostrada;
3. un driver puede ser controlable, parcialmente controlable o externo; la condición deberá permanecer visible;
4. un driver no sustituye el KPI principal;
5. un driver no puede redefinir la fórmula de la métrica fuente;
6. si no existe driver suficientemente sustentado, el objetivo puede permanecer medible sobre su KPI, pero cualquier acción que asuma causalidad deberá esperar D014/D016;
7. D016 decide qué driver, mecanismo o intervención se convertirá en acción o experimento.

#### 18. Guardrail

Un guardrail es una métrica utilizada para limitar daño, desplazamiento o deterioro no deseado mientras se persigue un objetivo.

Cada guardrail deberá declarar:

- resultado o riesgo protegido;
- métrica y versión;
- población y dimensiones;
- límite, rango o regla de no deterioro;
- unidad;
- periodo y corte;
- calidad mínima;
- propietario funcional;
- tratamiento cuando el límite se incumple;
- relación con el indicador principal.

Reglas:

1. todo riesgo material identificado deberá tener al menos un guardrail o una decisión `NO_APLICA` con justificación y propietario;
2. un guardrail debe medir un resultado materialmente distinto o una restricción que el KPI principal podría empeorar;
3. el logro del indicador principal no se presenta como éxito pleno si un guardrail material se incumple y la regla del objetivo declara ese guardrail como bloqueante;
4. un guardrail de calidad de datos no sustituye la certificación D007;
5. un guardrail no ejecuta automáticamente una reversa, pausa o cambio; el tratamiento operativo pertenece a D016 y a las tareas propietarias;
6. el límite de guardrail no se inventa; conserva su fuente de decisión igual que una meta;
7. una métrica puede ser guardrail en un objetivo y KPI en otro sin cambiar su definición.

#### 19. KPI, driver y guardrail son roles contextuales

La misma `metric_key` y versión puede desempeñar roles diferentes según objetivo, población y horizonte.

| Rol                | Pregunta que responde                                            | Prohibición principal                                          |
| ------------------ | ---------------------------------------------------------------- | -------------------------------------------------------------- |
| KPI principal      | ¿se logró el resultado objetivo?                                 | no tener más de uno como resultado primario del mismo objetivo |
| driver             | ¿qué factor observable acompaña o podría mover el KPI?           | no presentar asociación como causa                             |
| guardrail          | ¿qué resultado no debe deteriorarse mientras se persigue el KPI? | no ignorarlo al declarar éxito                                 |
| métrica secundaria | ¿qué detalle ayuda a interpretar el resultado?                   | no convertirla en KPI por conveniencia visual                  |

D015 no crea copias de una métrica para cada rol.

#### 20. Plan de medición

Todo objetivo `ESPECIFICADO` deberá contar con un plan de medición completo.

El plan deberá declarar:

1. propósito de decisión;
2. propietario funcional;
3. indicador principal y versión;
4. línea base y su evidencia;
5. meta y fuente de decisión;
6. drivers y límites de interpretación;
7. guardrails y tratamiento documental de incumplimiento;
8. población e inclusiones/exclusiones;
9. segmentos predefinidos;
10. dimensiones de comparación;
11. unidad, moneda y precisión;
12. calendario y zona horaria;
13. ventana de observación;
14. fecha de corte;
15. cadencia de actualización;
16. cadencia de revisión empresarial;
17. calidad mínima de fuentes;
18. cobertura mínima o condición de suficiencia cuando aplique;
19. tratamiento de faltantes, nulos y denominadores inválidos;
20. regla de comparabilidad con baseline;
21. tratamiento de datos tardíos y backfills;
22. condición para revaluar tras cambio semántico;
23. regla de evaluación de meta;
24. regla de evaluación de guardrails;
25. evidencia que deberá conservarse;
26. restricción de detalle sensible y poblaciones pequeñas;
27. condición de handoff hacia D016;
28. tratamiento de correcciones y restatements mediante D017.

No existe una cadencia universal. La frecuencia debe responder a la velocidad real del proceso, la latencia de las fuentes y la decisión que se pretende tomar.

#### 21. Puerta de activación de medición oficial

Un objetivo solo puede considerarse listo para medición oficial cuando:

1. existe un propietario funcional;
2. el resultado empresarial está definido;
3. el indicador principal está identificado y versionado;
4. la línea base es reproducible;
5. la meta tiene fuente, operador, unidad y horizonte;
6. los riesgos materiales tienen guardrails o exclusión `NO_APLICA` justificada;
7. población, segmentos, periodo y corte están definidos;
8. existe plan de medición completo;
9. las fuentes críticas no están `BLOQUEADO`;
10. la comparabilidad con baseline está resuelta;
11. la calidad de entradas es compatible con el uso declarado;
12. cualquier dependencia causal se comunica al nivel D014 realmente alcanzado;
13. las restricciones de autorización y privacidad aplicables están identificadas;
14. existe evidencia suficiente para reproducir la evaluación.

Si una condición crítica falla, el objetivo permanece `PENDIENTE_DE_EVIDENCIA` o `BLOQUEADO`; no se rellena con supuestos.

#### 22. Calidad y certificación en objetivos

D015 consume D007 sin crear un sistema paralelo de calidad.

Reglas:

1. `CERTIFICADO` se conserva únicamente para el uso, periodo, versión y corte cubiertos por D007;
2. `NO EVALUADO` no se presenta como baseline certificado;
3. `EN OBSERVACIÓN` exige visibilidad de la condición;
4. `DEGRADADO` requiere que el propósito de decisión admita expresamente la limitación;
5. `BLOQUEADO` impide medición oficial del elemento dependiente;
6. una métrica certificada no hace que el objetivo sea automáticamente válido si faltan meta, guardrails o comparabilidad;
7. un objetivo bien definido no mejora la calidad de sus fuentes.

#### 23. Comparabilidad con la línea base

La evaluación deberá preservar las reglas de D005.

Como mínimo deberán coincidir o reconciliarse explícitamente:

- `metric_key` y versión semántica;
- grano;
- población;
- inclusiones y exclusiones;
- calendario y zona horaria;
- periodo y corte;
- dimensiones;
- unidad o moneda;
- cobertura;
- fuentes críticas;
- tratamiento de datos tardíos;
- cambios de definición o de maestro;
- restatements aplicables.

Un objetivo no se declara cumplido comparando valores no equivalentes.

#### 24. Segmentos y heterogeneidad

El plan de medición deberá declarar por adelantado los segmentos materialmente relevantes para interpretar el resultado.

Reglas:

1. no se seleccionan únicamente segmentos favorables después de observar el resultado;
2. el agregado puede ocultar deterioro de una sede, canal, producto, cohorte o población;
3. los segmentos deben usar dimensiones gobernadas;
4. la ausencia de tamaño suficiente se muestra como limitación;
5. detalle sensible y poblaciones pequeñas consumen `DATA-AUTH-002`;
6. un resultado agregado no se generaliza automáticamente a todos los segmentos;
7. diferencias entre segmentos pueden abrir diagnóstico D014 sin convertirse por sí solas en causa.

#### 25. Cadencia, corte y ventanas

D015 separa:

```text
cadencia de actualización de datos
≠ cadencia de cálculo
≠ cadencia de revisión empresarial
≠ ventana de evaluación del objetivo
```

Reglas:

- una fuente diaria no obliga a revisar el objetivo diariamente;
- una revisión frecuente no crea observaciones nuevas;
- una ventana incompleta se presenta como parcial;
- la fecha de corte debe acompañar toda evaluación;
- una meta terminal no se declara incumplida antes del cierre salvo que el contrato defina hitos intermedios;
- los hitos intermedios, cuando existan, conservan su propia fecha y regla de evaluación.

#### 26. Datos faltantes, cero y denominadores

D015 conserva las distinciones de D006 y D007.

```text
0
≠ NULL
≠ NO_APLICA
≠ DESCONOCIDO
≠ NO_RECIBIDO
≠ PENDIENTE
≠ DENOMINADOR_NO_DISPONIBLE
```

Reglas:

1. una meta no se evalúa con un denominador inexistente;
2. un dato faltante no se sustituye por cero para evitar estado pendiente;
3. una ausencia de observación no prueba cumplimiento;
4. una muestra parcial conserva cobertura visible;
5. una meta de cero exige semántica explícita de cero real, no ausencia de registros;
6. un objetivo puede permanecer sin evaluación hasta que la fuente sea suficiente.

#### 27. Umbral de meta, guardrail y alerta

D015 define meta y límites de guardrail. D008 gobierna alertas.

```text
META
→ valor objetivo empresarial

GUARDRAIL
→ límite de protección para otro resultado o riesgo

ALERTA
→ señal de que una condición configurada requiere atención
```

Una misma cifra puede coincidir por decisión empresarial, pero no se asume equivalencia conceptual.

Reglas:

- fijar una meta no crea automáticamente una alerta;
- fijar un guardrail no crea automáticamente una automatización;
- una alerta no modifica la meta;
- ausencia de dato no se interpreta como cumplimiento ni incumplimiento salvo que la regla mida precisamente disponibilidad de datos;
- D016 gobierna qué acción procede ante desviaciones o incumplimientos.

#### 28. Relación con D014

Cuando el objetivo nace de una oportunidad diagnóstica:

- conserva el diagnóstico de origen;
- conserva el nivel de confianza D014;
- conserva alternativas materiales abiertas;
- conserva población, periodo y límites de generalización;
- no transforma un driver asociado en causa demostrada;
- no convierte impacto potencial en beneficio comprometido;
- puede definir medición adicional para resolver incertidumbre antes de ejecutar una acción.

Un objetivo puede ser válido con confianza diagnóstica baja si su finalidad es aprender o proteger un riesgo, pero cualquier afirmación causal seguirá limitada por D014.

#### 29. Relación con D016

D015 termina cuando el objetivo está suficientemente especificado para que una acción o experimento pueda diseñarse y evaluarse.

El handoff hacia D016 deberá conservar:

- resultado empresarial;
- propietario funcional;
- indicador principal;
- baseline;
- meta;
- drivers;
- guardrails;
- población y segmentos;
- ventana y cadencia;
- calidad y limitaciones;
- diagnóstico de origen cuando exista;
- confianza D014;
- riesgos de actuar y de no actuar;
- regla de evaluación del resultado.

D016 decide acción, experimento, responsable de ejecución, seguimiento, reversa y comprobación. D015 no anticipa esas decisiones.

#### 30. Relación con D017

Cuando una corrección, backfill, cambio de definición o reexpresión afecte baseline, KPI, driver o guardrail:

1. no se sobrescribe silenciosamente el valor usado originalmente;
2. se conserva versión, corte y decisión original;
3. se identifica qué evaluaciones quedan potencialmente afectadas;
4. D017 decide si corresponde reconstrucción, corrección histórica o restatement;
5. una meta posterior no se aplica retroactivamente a una ventana anterior;
6. cambiar la definición de una métrica no se trata como mejora o deterioro del negocio sin reconciliación.

#### 31. Conflictos entre objetivos y optimización local

Un objetivo puede mejorar su KPI y deteriorar otro resultado empresarial.

D015 exige:

- guardrails para riesgos materiales previsibles;
- visibilidad de objetivos que comparten recursos, población o métricas;
- declaración de restricciones de capacidad, liquidez, inventario, calidad, servicio, cumplimiento o seguridad cuando sean relevantes;
- prohibición de ocultar desplazamiento de impacto entre sedes, periodos, canales, productos o centros;
- revisión del resultado conjunto antes de declarar éxito cuando exista conflicto material.

No se crea una función universal de optimización ni un score que combine objetivos heterogéneos.

#### 32. Métricas de vanidad y anti-gaming

Una métrica no puede ser KPI principal solo porque sea fácil de aumentar, frecuente o visible.

El KPI deberá:

- representar el resultado empresarial declarado;
- tener fórmula y población gobernadas;
- poder interpretarse en la dirección elegida;
- no premiar actividad sin resultado cuando el objetivo exige resultado;
- estar acompañado por guardrails cuando exista riesgo de optimización local;
- permitir drill-down hasta evidencia autorizada;
- conservar cambios de definición y cobertura.

Los proxies solo podrán usarse si su condición de proxy queda explícita y no se presentan como resultado final.

#### 33. Inventario heredado de 55 familias: decisión de elegibilidad para objetivos

Las 55 familias conservan exactamente los nombres aprobados. La decisión de esta tarea no asigna un KPI global; define qué roles pueden desempeñar contextualmente y qué condición debe satisfacerse antes de activar medición oficial.

##### 33.1. Comercial — 11 familias

|    # | Familia canónica                             | Roles contextuales admisibles               | Condición principal                                                                                    | Estado de la decisión |
| ---: | -------------------------------------------- | ------------------------------------------- | ------------------------------------------------------------------------------------------------------ | --------------------- |
|    1 | ventas netas y brutas                        | KPI, driver, guardrail o métrica secundaria | usar base comercial/fiscal y población gobernadas; no confundir venta con margen                       | `ESPECIFICADO`        |
|    2 | pedidos y conversión                         | KPI o driver                                | conversión requiere numerador y denominador gobernados; conteo de pedidos conserva su propia población | `ESPECIFICADO`        |
|    3 | ticket y unidades                            | KPI o driver                                | ticket usa transacciones elegibles y unidades compatibles; no dividir por filas de producto            | `ESPECIFICADO`        |
|    4 | mezcla por producto, categoría, canal y sede | KPI contextual, driver o guardrail          | dimensiones y denominadores de participación deben reconciliar al total                                | `ESPECIFICADO`        |
|    5 | demanda por franja, día y temporada          | KPI o driver                                | demanda observada no equivale a demanda total; estacionalidad exige historia suficiente                | `ESPECIFICADO`        |
|    6 | disponibilidad perdida                       | KPI, driver o guardrail                     | permanece bloqueada para medición oficial sin intención y disponibilidad histórica reconciliadas       | `ESPECIFICADO`        |
|    7 | cancelaciones, devoluciones y descuentos     | KPI, driver o guardrail                     | mantener cada fenómeno y denominador separados                                                         | `ESPECIFICADO`        |
|    8 | promociones y efecto incremental             | KPI o driver                                | exposición/versionado son previos; efecto causal respeta D014 y, cuando corresponda, D016              | `ESPECIFICADO`        |
|    9 | recurrencia y frecuencia                     | KPI o driver                                | identidad, finalidad, población y ventana deben estar gobernadas                                       | `ESPECIFICADO`        |
|   10 | margen relacionado                           | KPI o guardrail                             | consumir margen económico D013; no recalcular costo localmente                                         | `ESPECIFICADO`        |
|   11 | capacidad comercial no utilizada             | KPI contextual, driver o guardrail          | requiere denominador de capacidad compatible                                                           | `ESPECIFICADO`        |

##### 33.2. Inventario, abastecimiento, proveedores y logística — 12 familias

|    # | Familia canónica                        | Roles contextuales admisibles      | Condición principal                                                                 | Estado de la decisión |
| ---: | --------------------------------------- | ---------------------------------- | ----------------------------------------------------------------------------------- | --------------------- |
|    1 | existencia disponible y comprometida    | KPI, driver o guardrail            | separar física, comprometida, cuarentena, tránsito y disponible                     | `ESPECIFICADO`        |
|    2 | cobertura y días de inventario          | KPI, driver o guardrail            | requiere existencia elegible y tasa de demanda/consumo compatible                   | `ESPECIFICADO`        |
|    3 | rotación y permanencia                  | KPI, driver o guardrail            | requiere inventario medio e historia/cohorte compatibles                            | `ESPECIFICADO`        |
|    4 | faltantes y quiebres                    | KPI, driver o guardrail            | stock cero no prueba faltante o quiebre sin necesidad elegible                      | `ESPECIFICADO`        |
|    5 | vencimiento, daño y pérdida             | KPI o guardrail                    | hechos y causas deben ser explícitos; cuarentena y disposición permanecen separadas | `ESPECIFICADO`        |
|    6 | diferencias de conteo                   | KPI, driver o guardrail            | conservar signo, corte y relación antes/después del ajuste                          | `ESPECIFICADO`        |
|    7 | cumplimiento de remisiones              | KPI o driver                       | preparación, despacho, recepción, faltante y cierre se evalúan por separado         | `ESPECIFICADO`        |
|    8 | lead time y cumplimiento de proveedores | KPI o driver                       | requiere inicio contractual y recepción aceptada con promesa comparable             | `ESPECIFICADO`        |
|    9 | compras urgentes                        | KPI o guardrail                    | solo hechos clasificados explícitamente como urgentes/emergencia                    | `ESPECIFICADO`        |
|   10 | consumo versus plan                     | KPI o driver                       | requiere plan explícito de misma población, unidad, sede y ventana                  | `ESPECIFICADO`        |
|   11 | costo de inventario                     | KPI o guardrail                    | valoración oficial consume método económico aprobado D013                           | `ESPECIFICADO`        |
|   12 | capacidad de almacenamiento             | KPI contextual, driver o guardrail | requiere capacidad utilizable y unidad física compatible                            | `ESPECIFICADO`        |

##### 33.3. Producción, rendimiento, capacidad, merma y calidad — 10 familias

|    # | Familia canónica                            | Roles contextuales admisibles | Condición principal                                                                                 | Estado de la decisión |
| ---: | ------------------------------------------- | ----------------------------- | --------------------------------------------------------------------------------------------------- | --------------------- |
|    1 | demanda planificada versus producción       | KPI o driver                  | requiere necesidad/plan FOGO aceptado y producción elegible comparable                              | `ESPECIFICADO`        |
|    2 | capacidad disponible y utilizada            | KPI, driver o guardrail       | requiere denominador integral de capacidad en unidad compatible                                     | `ESPECIFICADO`        |
|    3 | adherencia al programa                      | KPI o driver                  | exige programa publicado/versionado con hitos y población                                           | `ESPECIFICADO`        |
|    4 | rendimiento teórico y real                  | KPI o driver                  | teoría y real deben reconciliar receta/versión, escala y unidad                                     | `ESPECIFICADO`        |
|    5 | consumo estándar y real                     | KPI, driver o guardrail       | estándar y real se comparan por ingrediente y unidad compatible                                     | `ESPECIFICADO`        |
|    6 | merma, reproceso y aprovechamiento          | KPI, driver o guardrail       | cada categoría requiere hecho explícito y denominador propio                                        | `ESPECIFICADO`        |
|    7 | calidad, retención y rechazo                | KPI o guardrail               | control, resultado, retención, rechazo, reproceso y liberación permanecen separados                 | `ESPECIFICADO`        |
|    8 | tiempo de ciclo                             | KPI o driver                  | requiere hitos reales; espera, preparación, ejecución, pausa, retención y liberación no se colapsan | `ESPECIFICADO`        |
|    9 | cumplimiento de liberación                  | KPI o guardrail               | producción terminada no equivale a lote liberado                                                    | `ESPECIFICADO`        |
|   10 | costo y variación por lote, producto y sede | KPI, driver o guardrail       | costo técnico no sustituye costo económico oficial D013                                             | `ESPECIFICADO`        |

##### 33.4. Servicio, clientes, fidelización, reputación y experiencia — 12 familias

|    # | Familia canónica                                        | Roles contextuales admisibles      | Condición principal                                                                            | Estado de la decisión |
| ---: | ------------------------------------------------------- | ---------------------------------- | ---------------------------------------------------------------------------------------------- | --------------------- |
|    1 | cumplimiento de promesa                                 | KPI o driver                       | promesa aceptada y versionada es requisito; solicitud no equivale a compromiso                 | `ESPECIFICADO`        |
|    2 | tiempos de preparación, despacho y entrega              | KPI o driver                       | cada fase requiere eventos reales compatibles                                                  | `ESPECIFICADO`        |
|    3 | pedidos completos                                       | KPI o driver                       | completitud se resuelve por líneas, cantidades, revisiones y sustituciones aceptadas           | `ESPECIFICADO`        |
|    4 | reclamos y tiempo de resolución                         | KPI, driver o guardrail            | reclamo exige expediente y SLA/version aplicable                                               | `ESPECIFICADO`        |
|    5 | compensaciones                                          | KPI contextual, driver o guardrail | devolución, reembolso, descuento, cortesía, cupón y puntos permanecen distintos                | `ESPECIFICADO`        |
|    6 | satisfacción y feedback                                 | KPI, driver o guardrail            | feedback interno, invitación y reputación externa permanecen separados                         | `ESPECIFICADO`        |
|    7 | recurrencia, frecuencia y abandono                      | KPI o driver                       | abandono exige población elegible, ventana y observación completa                              | `ESPECIFICADO`        |
|    8 | adquisición y activación                                | KPI o driver                       | adquisición y activación requieren eventos y origen gobernados                                 | `ESPECIFICADO`        |
|    9 | fidelización, puntos y redenciones                      | KPI, driver o guardrail            | movimientos y redenciones se analizan por estado; saldo no sustituye ledger                    | `ESPECIFICADO`        |
|   10 | reputación y temas recurrentes                          | KPI, driver o guardrail            | reputación pública requiere fuente externa gobernada; feedback interno permanece distinto      | `ESPECIFICADO`        |
|   11 | reservas, no-show y utilización                         | KPI, driver o guardrail            | utilización requiere capacidad gobernada; reserva, cancelación y no-show son estados distintos | `ESPECIFICADO`        |
|   12 | valor y rentabilidad del cliente cuando esté autorizado | KPI o guardrail                    | identidad/finalidad autorizadas y rentabilidad D013 son requisitos                             | `ESPECIFICADO`        |

##### 33.5. Costos, rentabilidad, liquidez, presupuesto y escenarios — 10 familias

|    # | Familia canónica              | Roles contextuales admisibles           | Condición principal                                                                             | Estado de la decisión |
| ---: | ----------------------------- | --------------------------------------- | ----------------------------------------------------------------------------------------------- | --------------------- |
|    1 | costos estándar y reales      | KPI, driver o guardrail                 | estándar y real usan método, versión, unidad, moneda y componentes comparables                  | `ESPECIFICADO`        |
|    2 | variaciones                   | KPI o driver                            | cada variación conserva su base; costo, presupuesto, forecast, precio y cantidad no se colapsan | `ESPECIFICADO`        |
|    3 | margen y contribución         | KPI o guardrail                         | exige ingreso realizado y costos trazables/variables elegibles                                  | `ESPECIFICADO`        |
|    4 | gastos                        | KPI, driver o guardrail                 | capturado, reconocido, aprobado, pagado, anulado y conciliado permanecen separados              | `ESPECIFICADO`        |
|    5 | centros de costo              | driver, dimensión o métrica secundaria  | un centro es dimensión económica; no es KPI por sí mismo sin métrica definida sobre él          | `ESPECIFICADO`        |
|    6 | presupuesto y forecast        | KPI contextual, driver o comparador     | presupuesto aprobado, revisión, forecast, escenario y real permanecen distintos                 | `ESPECIFICADO`        |
|    7 | caja, bancos y tesorería      | KPI o guardrail                         | posición real exige saldos reconciliados y disponibilidad                                       | `ESPECIFICADO`        |
|    8 | cartera y obligaciones        | KPI, driver o guardrail                 | saldo abierto deriva de reconocimiento menos aplicaciones válidas                               | `ESPECIFICADO`        |
|    9 | rentabilidad multidimensional | KPI o guardrail                         | exige ingreso realizado, costos trazables, asignaciones y residuo visibles                      | `ESPECIFICADO`        |
|   10 | escenarios y simulaciones     | driver, comparador o métrica secundaria | simulado no sustituye real, baseline ni efecto observado                                        | `ESPECIFICADO`        |

**Reconciliación:** `11 + 12 + 10 + 12 + 10 = 55` familias. **55 esperadas; 55 decisiones materializadas; 0 faltantes; 0 duplicadas.**

#### 34. Reglas globales de la matriz de elegibilidad

1. `ESPECIFICADO` en la tabla significa que D015 decide la elegibilidad semántica del rol; no certifica datos ni activa una meta.
2. los bloqueos y estados de D009 a D013 se heredan sin mejora silenciosa;
3. una familia con componentes `BLOQUEADO` no puede producir medición oficial de esos componentes;
4. una familia `NO EVALUADO` puede soportar análisis provisional con estado visible, no baseline certificado;
5. el rol KPI/driver/guardrail solo se materializa cuando se vincula a una métrica registrada y a un objetivo concreto;
6. ningún rol de esta tabla crea una fórmula alternativa;
7. una dimensión, comparador o escenario no se convierte en resultado real por participar en un objetivo;
8. cuando una familia combine submétricas con estados distintos, el plan de medición conserva el estado de cada dependencia material.

#### 35. Objetivos derivados de las 55 familias

D015 no crea 55 objetivos automáticos. Las familias son capacidades de medición, no una lista de metas obligatorias.

Un objetivo deberá seleccionarse por una decisión empresarial explícita y podrá combinar métricas de varias familias cuando:

- cada métrica conserve su propietario y definición;
- las poblaciones sean compatibles o su diferencia esté declarada;
- la comparación temporal sea válida;
- las monedas/unidades sean compatibles;
- el driver no se presente como causal sin nivel D014 suficiente;
- los guardrails protejan los riesgos materiales de la intervención futura.

No se exige un objetivo por familia ni una familia por objetivo.

#### 36. Portafolio y prioridad

D015 no define un score universal para priorizar objetivos.

La priorización deberá conservar visibles, como mínimo:

- resultado empresarial;
- impacto esperado o protegido;
- urgencia o fecha límite;
- confianza diagnóstica cuando aplique;
- calidad y disponibilidad de medición;
- riesgo;
- restricciones de capacidad, liquidez, seguridad o cumplimiento;
- dependencia de otros objetivos;
- propietario funcional.

Un objetivo fácil de medir no desplaza automáticamente uno de mayor importancia empresarial.

#### 37. Auditoría de decisiones de objetivo

Toda creación o cambio de objetivo deberá poder conservar:

- quién propuso el objetivo;
- propietario funcional;
- fecha de decisión;
- origen o justificación;
- versión de la métrica principal;
- baseline usado;
- meta y fuente;
- drivers y guardrails vigentes;
- plan de medición;
- cambio de población, horizonte o segmento;
- motivo de revisión;
- relación con diagnóstico D014;
- relación futura con acción/experimento D016;
- relación con restatement D017 cuando corresponda.

La materialización física de auditoría y permisos corresponde a `DATA-AUTH-003`, `DATA-AUTH-004` y a las tareas técnicas aplicables.

#### 38. Publicación y experiencia

Una presentación de objetivo deberá mostrar, como mínimo:

- objetivo;
- propietario;
- indicador principal;
- baseline y corte;
- meta y horizonte;
- valor actual cuando exista;
- distancia a meta con semántica válida;
- drivers principales;
- guardrails y su estado;
- calidad/certificación;
- fecha de corte;
- población y segmentos;
- estado de preparación o limitación;
- cambios de definición relevantes.

D008 gobierna publicación y snapshots; `DATA-UX-006` gobierna la experiencia concreta de objetivos, metas, drivers, guardrails y acciones. El detalle sensible consume `DATA-AUTH-001` y `DATA-AUTH-002`.

Un objetivo `PENDIENTE_DE_EVIDENCIA` o `BLOQUEADO` no se presenta visualmente como objetivo medido y saludable.

#### 39. Handoffs con propietario documental exacto

| Decisión o materialización fuera del alcance                                                        | Propietario documental | Condición de salida                                           |
| --------------------------------------------------------------------------------------------------- | ---------------------- | ------------------------------------------------------------- |
| acción, experimento, responsable de ejecución, seguimiento y comprobación                           | `DATA-DOM-016`         | antes de ejecutar una intervención o declarar efecto obtenido |
| corrección histórica, restatement y reproducibilidad de resultados                                  | `DATA-DOM-017`         | antes de reexpresar baseline o evaluación publicada           |
| protección por dominio, entidad, territorio y finalidad                                             | `DATA-AUTH-001`        | antes de exponer resultados restringidos                      |
| protección de poblaciones pequeñas, comparaciones, exportaciones y drill-down                       | `DATA-AUTH-002`        | antes de exponer detalle sensible                             |
| separación de definición, certificación, publicación, fijación de metas, anotación y administración | `DATA-AUTH-003`        | antes de conceder capacidades sobre objetivos y metas         |
| auditoría de consultas, descargas, modelos y recomendaciones                                        | `DATA-AUTH-004`        | antes de automatizar auditoría de uso analítico               |
| inicio ejecutivo priorizado por rol                                                                 | `DATA-UX-001`          | antes de diseñar la superficie ejecutiva de objetivos         |
| tableros por dominio y trazabilidad                                                                 | `DATA-UX-003`          | antes de implementar seguimiento visual por dominio           |
| espacio de investigación diagnóstica                                                                | `DATA-UX-005`          | antes de navegar de objetivo a diagnóstico                    |
| experiencia de objetivos, metas, drivers, guardrails y acciones                                     | `DATA-UX-006`          | antes de implementar la superficie de seguimiento             |
| capa semántica, modelos analíticos, snapshots, caché y consultas                                    | `DATA-INT-002`         | antes de servir cálculo de objetivos compartidos              |
| BI, hojas de cálculo, modelos analíticos e inteligencia artificial                                  | `DATA-INT-004`         | antes de conectar herramientas externas al seguimiento        |

No queda una decisión material de D015 diferida sin propietario documental exacto y condición de salida.

#### 40. Cobertura de requisitos de prueba vigente

Las reglas de D015 ya están protegidas por requisitos vigentes:

- `TREQ-DATA-005` exige separar señal, diagnóstico, hipótesis, acción, experimento, responsable, línea base, meta, indicador principal, drivers, guardrails, ventana de medición, segmentos, resultado, confianza, aprendizaje y decisión de cierre o iteración; además exige comparar resultados contra línea base y guardrails;
- `TREQ-DATA-002` protege identidad, propósito, fórmula, numerador, denominador, granularidad, dimensiones, filtros, unidad, moneda, calendario, fuente, calidad, versión y reglas de comparación de toda métrica;
- `TREQ-DATA-003` protege calidad de contratos de origen, cobertura, datos tardíos, backfills, reconciliación, linaje y separación entre cero y ausencia;
- `TREQ-DATA-004` protege presentación de periodo, corte, filtros, dimensiones, calidad, snapshots, drill-down y separación entre artefactos analíticos;
- los requisitos propietarios de cada dominio continúan protegiendo los hechos operativos que alimentan KPI, drivers y guardrails.

D015 especializa estas obligaciones sin cambiar su regla protegida, prioridad, modalidad, estado, relaciones ni destino de implementación.

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea materializa documentalmente objetivos, líneas base, metas, KPI priorizados, drivers, guardrails y planes de medición dentro de requisitos vigentes que ya protegen el ciclo de mejora, las definiciones de métricas, calidad, comparabilidad y publicación. No introduce comportamiento ejecutable, contrato físico, autorización, datos, integración, automatización ni experimento nuevo.

#### 41. Criterios de aceptación

1. objetivo, meta y prioridad empresarial permanecen conceptos distintos;
2. métrica, KPI, driver y guardrail permanecen roles distintos;
3. baseline, meta, benchmark, forecast y escenario permanecen separados;
4. cada objetivo tiene exactamente un indicador principal;
5. el KPI principal consume una métrica registrada y no redefine fórmula;
6. ninguna métrica se declara KPI global por conveniencia de dashboard;
7. la misma métrica puede asumir roles contextuales distintos sin duplicar definición;
8. todo objetivo declara resultado, propietario, población, horizonte e indicador principal;
9. la línea base conserva versión, periodo, corte, población, unidad y calidad;
10. una línea base usa datos observados y no se sustituye por forecast o escenario;
11. una línea base `BLOQUEADO` no produce medición oficial;
12. `NO EVALUADO`, `EN OBSERVACIÓN`, `DEGRADADO` y `BLOQUEADO` conservan semántica D007;
13. se definen tres métodos documentales de baseline sin imponer una ventana universal;
14. toda meta conserva operador, valor/rango, unidad, horizonte, fuente y propietario;
15. se definen cinco formas semánticas de meta;
16. una dirección narrativa no sustituye una meta evaluable al activar medición;
17. un valor de presupuesto, forecast, SLA, contrato o benchmark no se convierte automáticamente en meta;
18. no se inventa ningún valor numérico de meta;
19. driver no equivale a causa demostrada;
20. todo driver conserva evidencia y nivel D014 cuando exista afirmación explicativa;
21. guardrail protege un riesgo o resultado material distinto del KPI principal;
22. todo riesgo material identificado tiene guardrail o `NO_APLICA` justificado;
23. cumplir el KPI no oculta un incumplimiento de guardrail material;
24. guardrail no sustituye certificación D007;
25. se materializan 28 elementos mínimos del plan de medición;
26. no existe cadencia universal inventada;
27. la puerta de medición oficial exige indicador, baseline, meta, guardrails, población, plan, calidad y comparabilidad;
28. una dependencia crítica `BLOQUEADO` impide medición oficial;
29. calidad/certificación, confianza diagnóstica y cumplimiento de meta permanecen ejes distintos;
30. la comparabilidad conserva versión, grano, población, calendario, periodo, dimensiones, unidad/moneda, cobertura y fuentes;
31. segmentos se declaran antes de observar el resultado cuando sean materialmente relevantes;
32. poblaciones pequeñas y sensibles consumen `DATA-AUTH-002`;
33. cadencia de datos, cálculo, revisión y ventana de evaluación permanecen separadas;
34. cero, nulo, no aplica, desconocido, no recibido, pendiente y denominador no disponible permanecen distintos;
35. meta, guardrail y alerta permanecen conceptos distintos;
36. una meta o guardrail no crea automatización;
37. un objetivo derivado de D014 conserva confianza, alternativas y límites;
38. D015 no eleva causalidad de drivers;
39. D015 entrega a D016 un objetivo listo para diseñar acción o experimento cuando la puerta de medición se satisface;
40. D015 no ejecuta acción ni experimento;
41. D017 gobierna correcciones históricas y restatements que afecten baseline o evaluación;
42. cambios de meta no reescriben la meta anterior;
43. se gobiernan conflictos entre objetivos y optimización local sin score universal;
44. proxies y métricas de vanidad no sustituyen resultados empresariales;
45. las 55 familias heredadas están presentes exactamente una vez;
46. se conservan 11 familias comerciales;
47. se conservan 12 familias de inventario y abastecimiento;
48. se conservan 10 familias productivas;
49. se conservan 12 familias de servicio y clientes;
50. se conservan 10 familias económico-financieras;
51. existen 55 decisiones de elegibilidad, 0 faltantes y 0 duplicadas;
52. la elegibilidad no mejora estados heredados de D009 a D013;
53. ninguna familia genera una `metric_key` nueva;
54. no se crean 55 objetivos automáticos;
55. todo valor de meta concreto deberá provenir de una decisión empresarial autorizada y trazable;
56. toda creación o cambio de objetivo conserva evidencia de decisión;
57. publicación de objetivo muestra baseline, meta, KPI, guardrails, calidad, corte y población;
58. cada handoff tiene propietario documental exacto y condición de salida;
59. no se crea, modifica, difiere, descarta ni vuelve obsoleto ningún requisito de prueba;
60. no se ejecuta código, DDL, DML, migración, backfill, automatización, experimento, acción empresarial ni cambio de Supabase;
61. `DATA-DOM-016` permanece únicamente reservada.

#### 42. Continuidad

```text
ÚLTIMA TAREA APROBADA
DATA-DOM-014 — Definir diagnóstico transversal, anomalías, causas, oportunidades y nivel de confianza

TAREA ACTUAL APROBADA
DATA-DOM-015 — Definir objetivos, líneas base, metas, drivers, guardrails y planes de medición

SIGUIENTE TAREA RESERVADA
DATA-DOM-016 — Definir acciones de mejora, experimentos, responsables, seguimiento y comprobación de resultados
```


### ✅ DATA-DOM-016 — Definir acciones de mejora, experimentos, responsables, seguimiento y comprobación de resultados

**Estado:** APROBADA
**Tarea anterior:** `DATA-DOM-015 — Definir objetivos, líneas base, metas, drivers, guardrails y planes de medición` — APROBADA
**Tarea siguiente:** `DATA-DOM-017 — Definir versionado de métricas, restatements, correcciones históricas y reproducibilidad` — RESERVADA
**Tipo de tarea:** documental; contrato canónico de acciones de mejora, intervenciones, experimentos, responsabilidades, seguimiento, evaluación, aprendizaje y decisión de cierre
**Bloque:** AB — Analítica, indicadores y datos maestros
**Fase:** exclusivamente documental
**Implementación técnica:** no autorizada
**Código, DDL, DML, migraciones, backfills, cambios de datos, despliegues, automatizaciones, experimentos reales, cambios de proceso, cambios de configuración o acciones empresariales:** no autorizados
**Requisitos de prueba creados o modificados:** 0

#### 1. Propósito

Definir cómo Vento OS convierte un objetivo medible de D015 en una intervención controlada y evaluable, sin confundir una recomendación con una acción aprobada, una acción con un experimento, una ejecución con exposición efectiva, una mejora observada con efecto atribuible ni el cierre administrativo con la comprobación del resultado.

La tarea completa documentalmente el ciclo de `CAP-17.11 — Definir y seguir acciones de mejora` y `CAP-17.12 — Comprobar resultados` y deberá permitir responder, como mínimo:

```text
qué objetivo se pretende mover o proteger
qué hipótesis o mecanismo justifica intervenir
qué acción se propone
si la intervención requiere experimento y por qué
quién posee el resultado empresarial
quién autoriza la intervención
quién ejecuta
quién mide y revisa la evidencia
qué población será elegible
qué población quedó realmente expuesta
cuándo empieza y termina la intervención
qué baseline, meta, drivers y guardrails se conservan
qué diseño permite evaluar el resultado
qué cambios concurrentes pueden confundir la evaluación
qué ocurrió realmente durante la ejecución
qué efectos deseados y no deseados se observaron
qué nivel de confianza permite la evidencia
qué aprendizaje queda registrado
si corresponde adoptar, ampliar, iterar, pausar, revertir o cerrar
qué debe preservarse para reproducibilidad y restatement
```

D016 no ejecuta ninguna intervención real. Las fuentes vigentes no aportan una instancia concreta de objetivo con acción aprobada, población de exposición y autorización operativa que permita iniciar un cambio sin inventar decisiones. El resultado de esta tarea es el contrato empresarial completo que deberá gobernar esas instancias cuando existan.

#### 2. Resultado sustantivo

Queda materializado el contrato canónico de mejora y comprobación con los siguientes resultados:

- cadena obligatoria desde objetivo medible hasta decisión de cierre;
- separación entre acción, intervención, experimento, ejecución, exposición, seguimiento, resultado y decisión;
- puerta de elegibilidad previa que impide ejecutar intervenciones sin objetivo, medición, propietario, responsable, guardrails y evidencia suficientes;
- matriz de seis clases de intervención con decisión explícita sobre cuándo la identificación causal es necesaria;
- matriz de seis diseños de evaluación o experimento con el máximo lenguaje causal que cada diseño puede sostener por sí solo;
- responsabilidades separadas para resultado, aprobación, ejecución, medición, calidad, análisis, guardrails y decisión final;
- contrato de población elegible, asignación, exposición real, contaminación, interferencia y abandono de intervención;
- ventanas diferenciadas de baseline, preparación, exposición, estabilización, evaluación y seguimiento posterior;
- reglas de seguimiento de fidelidad de implementación y de cambios concurrentes;
- comprobación obligatoria del KPI principal, meta, drivers, guardrails, segmentos, calidad, efectos no deseados y confianza D014;
- siete decisiones de cierre materializadas y mutuamente distinguibles;
- reglas de pausa y reversa que no convierten una alerta en ejecución automática;
- aprendizaje estructurado y límites de generalización;
- integración explícita con `EFECTO_COMPROBADO` de D014 sin crear una escala causal paralela;
- preservación de los contratos de objetivo y medición definidos por D015;
- cero acciones empresariales ejecutadas;
- cero experimentos ejecutados;
- cero cambios físicos;
- cero cambios de requisitos de prueba.

#### 3. Decisión principal

Vento OS adopta un modelo de **intervención gobernada por expediente y evidencia**.

```text
DIAGNÓSTICO / OPORTUNIDAD D014
→ explica qué merece atención y con qué confianza

OBJETIVO Y PLAN DE MEDICIÓN D015
→ fija KPI, baseline, meta, drivers, guardrails, población y regla de evaluación

DECISIÓN DE INTERVENIR
→ selecciona una acción y declara su mecanismo esperado

DISEÑO DE EVALUACIÓN
→ decide si basta seguimiento descriptivo o si se requiere identificación causal

RESPONSABILIDAD
→ separa propietario del resultado, aprobador, ejecutor, medición y decisión final

EJECUCIÓN
→ registra qué cambio fue realmente aplicado

EXPOSICIÓN
→ registra quién o qué quedó realmente sujeto a la intervención

SEGUIMIENTO
→ conserva fidelidad, cambios concurrentes, calidad y guardrails

COMPROBACIÓN
→ compara resultado con baseline, meta, población y diseño predefinidos

CONFIANZA D014
→ limita el lenguaje sobre asociación, causalidad y efecto

DECISIÓN DE CIERRE
→ adoptar, ampliar, iterar, pausar, revertir, investigar o cerrar sin adopción

DATA-DOM-017
→ conserva versiones, correcciones históricas, restatements y reproducibilidad
```

Una recomendación, un modelo, una alerta, un dashboard o una herramienta de inteligencia artificial no ejecutan acciones empresariales por sí mismos.

#### 4. Fuentes y decisiones heredadas

D016 consume sin redefinir:

- `DATA-DOM-001` a `DATA-DOM-003` para autoridad funcional, stewardship, identidad, dimensiones, jerarquías, vigencias y fuentes de verdad;
- `DATA-DOM-004` para identidad, fórmula, propósito y versión de métricas;
- `DATA-DOM-005` para granularidad, tiempo, comparabilidad y snapshots;
- `DATA-DOM-006` para ingestión, datos tardíos, backfills, reconciliación y linaje;
- `DATA-DOM-007` para calidad y los estados `NO EVALUADO`, `EN OBSERVACIÓN`, `CERTIFICADO`, `DEGRADADO` y `BLOQUEADO`;
- `DATA-DOM-008` para publicación, alertas, reportes y snapshots;
- `DATA-DOM-009` a `DATA-DOM-013` para las familias analíticas que puedan actuar como KPI, drivers, guardrails o métricas secundarias conforme a su estado real;
- `DATA-DOM-014` para diagnóstico, oportunidades, causalidad, seis niveles de confianza y `EFECTO_COMPROBADO`;
- `DATA-DOM-015` para objetivo, indicador principal, baseline, meta, drivers, guardrails, población, segmentos, ventanas, calidad y plan de medición;
- `CAP-SCOPE-017`, especialmente `CAP-17.11` y `CAP-17.12`, para el ciclo de acción, seguimiento y comprobación;
- el requisito vigente que protege el ciclo completo de mejora basada en datos;
- `DATA-AUTH-003` para futura segregación entre definición, certificación, publicación, fijación de metas, anotación y administración;
- `DATA-AUTH-004` para futura auditoría de consultas, modelos y recomendaciones;
- `DATA-UX-006` para la futura experiencia de objetivos y acciones;
- `DATA-UX-008` para validación de comprensión, tiempos y decisiones con usuarios reales;
- `DATA-INT-002` para la futura materialización de modelos, cálculos, snapshots y consultas;
- `DATA-INT-004` para integración controlada con BI, hojas de cálculo, modelos analíticos e inteligencia artificial.

D016 no mejora el estado de una fuente, no modifica una meta, no reinterpreta un diagnóstico y no sustituye la autorización del proceso propietario.

#### 5. Fronteras conceptuales obligatorias

```text
recomendación ≠ decisión ≠ acción
```

```text
acción ≠ experimento
```

```text
intervención diseñada ≠ intervención ejecutada
```

```text
ejecución ≠ exposición efectiva
```

```text
asignación ≠ exposición ≠ cumplimiento de intervención
```

```text
seguimiento ≠ comprobación causal
```

```text
mejora observada ≠ efecto atribuible
```

```text
cumplimiento de meta ≠ efecto causado por la intervención
```

```text
KPI mejorado ≠ éxito si un guardrail material se deteriora
```

```text
before/after ≠ experimento controlado
```

```text
p-value ≠ causalidad ≠ importancia empresarial
```

```text
significancia estadística ≠ relevancia operativa
```

```text
pausa ≠ reversa ≠ fracaso definitivo
```

```text
acción completada ≠ objetivo comprobado
```

```text
cierre administrativo ≠ aprendizaje validado
```

```text
EFECTO_COMPROBADO ≠ verdad universal
```

#### 6. Autoridad y segregación de responsabilidades

| Responsabilidad          | Autoridad lógica                                                  | Regla                                                                                |
| ------------------------ | ----------------------------------------------------------------- | ------------------------------------------------------------------------------------ |
| resultado empresarial    | propietario funcional del objetivo D015                           | responde por el resultado, prioridad y aceptación empresarial                        |
| decisión de intervenir   | propietario funcional + autoridad aplicable                       | una oportunidad no autoriza la acción por sí sola                                    |
| aprobación de cambio     | función autorizada por el dominio y futuros contratos `DATA-AUTH` | la aprobación documental de D016 no concede permiso operativo                        |
| responsable de ejecución | función designada para la intervención concreta                   | ejecutar no concede propiedad sobre la métrica ni sobre el resultado                 |
| diseño de medición       | BLOQUE AB + propietario funcional                                 | consume D015; no redefine KPI, baseline ni meta                                      |
| diseño de experimento    | BLOQUE AB + propietario funcional + especialistas aplicables      | el diseño debe ser proporcional al riesgo y a la afirmación causal buscada           |
| calidad de datos         | steward/certificador conforme a D007                              | el equipo de intervención no certifica sus propios datos por conveniencia            |
| guardrail                | propietario del riesgo o resultado protegido                      | puede bloquear una declaración de éxito según la regla predefinida                   |
| análisis de resultados   | función analítica autorizada                                      | distingue observación, asociación y atribución causal                                |
| decisión final           | propietario funcional y autoridad aplicable                       | adopción, ampliación, iteración, pausa o reversa permanecen decisiones empresariales |
| publicación              | rol futuro gobernado por `DATA-AUTH-003`                          | cerrar una intervención no autoriza publicar resultados sensibles                    |
| auditoría técnica        | `DATA-AUTH-004` y tareas técnicas aplicables                      | consultas, modelos y recomendaciones deberán conservar trazabilidad                  |

Ninguna fila concede permisos técnicos o empresariales. La capacidad efectiva se resolverá mediante los contratos de autorización aplicables.

#### 7. Unidad mínima: expediente de intervención

La unidad mínima de D016 es un **expediente de intervención evaluable**.

Cada expediente deberá declarar como mínimo:

| Coordenada               | Contenido obligatorio                                                                      |
| ------------------------ | ------------------------------------------------------------------------------------------ |
| objetivo                 | referencia al objetivo D015 y su versión                                                   |
| origen                   | diagnóstico, oportunidad, obligación, riesgo o prioridad que justifica intervenir          |
| propietario funcional    | función responsable del resultado                                                          |
| hipótesis o mecanismo    | por qué la acción podría mover el KPI o proteger un guardrail                              |
| acción propuesta         | cambio empresarial concreto que se pretende aplicar                                        |
| tipo de intervención     | clasificación D016 aplicable                                                               |
| necesidad de experimento | sí, no o no evaluable, con justificación                                                   |
| diseño de evaluación     | diseño predefinido antes de observar resultados                                            |
| responsable de ejecución | función que materializa la acción                                                          |
| aprobador                | autoridad que permite iniciar dentro del alcance aplicable                                 |
| unidad de intervención   | objeto, sede, turno, canal, producto, cliente/cohorte u otra unidad gobernada              |
| población elegible       | universo que puede recibir la intervención                                                 |
| asignación               | regla por la cual unidades reciben o no reciben intervención                               |
| exposición prevista      | qué significa estar expuesto según el diseño                                               |
| indicador principal      | KPI D015 y versión                                                                         |
| baseline                 | valor/distribución y evidencia D015                                                        |
| meta                     | meta D015 y su vigencia                                                                    |
| drivers                  | drivers D015 relevantes al mecanismo                                                       |
| guardrails               | guardrails D015 y regla de tratamiento                                                     |
| segmentos                | grupos predefinidos para heterogeneidad                                                    |
| ventana                  | baseline, preparación, exposición, evaluación y seguimiento                                |
| calidad mínima           | condición D007 requerida                                                                   |
| confianza de origen      | nivel D014 de la hipótesis o diagnóstico inicial                                           |
| riesgos                  | riesgos de actuar, no actuar y ejecutar parcialmente                                       |
| cambios concurrentes     | eventos o intervenciones que podrían confundir el resultado                                |
| criterio de pausa        | condición predefinida que exige revisión                                                   |
| criterio de reversa      | condición y autoridad para deshacer una intervención reversible                            |
| evidencia de ejecución   | prueba de qué se hizo, cuándo, dónde y con qué versión                                     |
| evidencia de exposición  | prueba de quién o qué recibió realmente la intervención                                    |
| regla de análisis        | método para evaluar KPI, guardrails y atribución                                           |
| decisión de cierre       | catálogo de decisión D016 con justificación                                                |
| aprendizaje              | conclusión, límites y transferibilidad permitida                                           |
| reproducibilidad         | versiones, cortes, consultas, datos y artefactos necesarios para reconstruir la evaluación |

Dos expedientes con la misma acción narrativa no son equivalentes si difieren en objetivo, población, versión, exposición, ventana, guardrails o diseño de evaluación.

#### 8. Puerta previa a cualquier intervención

Una intervención solo podrá declararse documentalmente **lista para ejecución futura** cuando existan, como mínimo:

1. objetivo D015 identificado;
2. propietario funcional identificado;
3. indicador principal versionado;
4. baseline reproducible o limitación aceptada que impida declarar efecto;
5. meta vigente o propósito de aprendizaje explícito;
6. guardrails materiales definidos;
7. población elegible y unidad de intervención definidas;
8. acción concreta descrita;
9. mecanismo o hipótesis explicitado;
10. responsable de ejecución identificado;
11. autoridad de aprobación identificada;
12. riesgos de actuar y no actuar evaluados;
13. decisión sobre necesidad de experimento;
14. diseño de evaluación definido antes de la exposición;
15. criterios de pausa/reversa cuando apliquen;
16. ventana y cortes definidos;
17. calidad mínima compatible con el análisis;
18. restricciones de autorización, privacidad, seguridad, inocuidad, cumplimiento o capacidad identificadas;
19. evidencia que deberá demostrar ejecución y exposición;
20. regla de cierre y aprendizaje definida.

Si una condición crítica falta, el expediente permanece `PENDIENTE_DE_EVIDENCIA` o `BLOQUEADO`; no se completa con supuestos.

Esta puerta documental no equivale a autorización operativa, despliegue ni cambio físico.

#### 9. Seis clases de intervención

D016 materializa seis clases documentales. Una intervención concreta deberá seleccionar una y declarar si combina elementos de otra.

|    # | Clase                                                 | Propósito                                                                          | Necesidad típica de identificación causal                                                       | Restricción principal                                                                      |
| ---: | ----------------------------------------------------- | ---------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
|    1 | corrección obligatoria                                | eliminar incumplimiento, riesgo crítico o defecto cuya remediación es obligatoria  | puede no requerir experimento para decidir actuar; sí requiere comprobar resultado y guardrails | no usar experimento para aplazar una obligación de seguridad, legal o integridad           |
|    2 | ajuste operativo reversible                           | modificar una regla, secuencia, nivel, asignación o práctica que puede restaurarse | depende de incertidumbre causal y riesgo                                                        | reversibilidad debe ser real y documentada                                                 |
|    3 | cambio de proceso o política                          | modificar una forma gobernada de operar                                            | alta cuando se pretende atribuir impacto al cambio                                              | requiere versión, vigencia y control de cambios concurrentes                               |
|    4 | intervención de comunicación, capacitación o adopción | cambiar conocimiento, comportamiento o adopción                                    | depende de si se necesita demostrar efecto sobre resultado final                                | actividad realizada no equivale a adopción ni a resultado                                  |
|    5 | piloto controlado                                     | limitar alcance para comprobar operación, riesgo y señal de resultado              | puede usar comparación; no implica causalidad automáticamente                                   | piloto sin comparador no se presenta como experimento causal                               |
|    6 | experimento deliberado                                | crear variación controlada para estimar efecto de una intervención                 | sí; el diseño existe precisamente para identificación causal                                    | requiere ética, autorización, elegibilidad, asignación, exposición y guardrails gobernados |

La clasificación no asigna automáticamente una técnica estadística ni una herramienta.

#### 10. Decisión: acción directa o experimento

D016 no obliga a experimentar toda mejora.

La decisión deberá considerar por separado:

- obligación de actuar;
- incertidumbre sobre el mecanismo;
- necesidad de atribución causal;
- reversibilidad;
- severidad del riesgo;
- posibilidad de limitar exposición;
- interferencia entre unidades;
- tiempo hasta observar resultado;
- disponibilidad de comparador;
- suficiencia de población;
- costo y carga operativa;
- privacidad, equidad, seguridad, inocuidad o cumplimiento;
- posibilidad de medir ejecución y exposición;
- impacto potencial de una decisión equivocada.

Reglas:

1. una corrección obligatoria no se retrasa para construir un experimento si la obligación exige actuar;
2. si la decisión futura depende de saber **si la acción causó el efecto**, deberá usarse un diseño capaz de identificación causal o mantenerse un lenguaje no causal;
3. si no puede existir comparador válido, el resultado puede evaluarse descriptivamente sin inventar causalidad;
4. bajo riesgo elevado, un piloto puede reducir exposición sin convertirse automáticamente en experimento;
5. una intervención irreversible exige mayor evidencia y autoridad antes de ejecución;
6. una intervención en poblaciones sensibles exige controles de autorización y protección aplicables;
7. la ausencia de capacidad experimental no convierte un before/after en evidencia causal.

#### 11. Seis diseños de evaluación y su techo de interpretación

D016 reconoce seis diseños documentales. El nivel D014 final depende de la evidencia completa, no solo del nombre del diseño.

|    # | Diseño                                      | Estructura mínima                                                           | Techo de interpretación por diseño aislado                                                                    | Condición crítica                                                                    |
| ---: | ------------------------------------------- | --------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------ |
|    1 | seguimiento pre/post de una sola población  | baseline y periodo posterior bajo misma definición                          | `ASOCIACION` como máximo para atribución causal                                                               | cambios concurrentes y tendencia permanecen alternativas                             |
|    2 | comparación contemporánea no aleatoria      | intervención y comparador elegible en la misma ventana                      | hasta `HIPOTESIS_RESPALDADA` salvo estrategia de identificación adicional                                     | diferencias basales y selección deben medirse y tratarse                             |
|    3 | diseño cuasi-experimental gobernado         | comparador/contrafactual y supuestos explícitos                             | puede alcanzar `EVIDENCIA_CAUSAL`                                                                             | supuestos, sensibilidad y tendencias deben quedar documentados                       |
|    4 | despliegue escalonado controlado            | unidades reciben intervención en momentos predefinidos con comparabilidad   | puede alcanzar `EVIDENCIA_CAUSAL` o `EFECTO_COMPROBADO` si la asignación y el diseño experimental lo soportan | calendario, contaminación y cambios simultáneos deben controlarse                    |
|    5 | switchback o alternancia temporal gobernada | periodos de intervención/control predefinidos sobre unidades aptas          | puede alcanzar `EFECTO_COMPROBADO` cuando controla carryover, temporalidad y exposición                       | efectos persistentes o estacionalidad pueden invalidar la comparación                |
|    6 | experimento aleatorizado controlado         | asignación aleatoria gobernada, control, exposición y análisis predefinidos | puede alcanzar `EFECTO_COMPROBADO`                                                                            | aleatorización, cumplimiento, interferencia, pérdidas y guardrails deben verificarse |

Un diseño con fallas materiales puede quedar en un nivel inferior. Ningún diseño garantiza por nombre un nivel de confianza.

#### 12. Diseño preespecificado

Antes de iniciar una exposición deberán quedar definidos:

- pregunta de decisión;
- objetivo e hipótesis;
- intervención;
- unidad de asignación;
- unidad de análisis;
- población elegible;
- criterios de inclusión y exclusión;
- comparador/control cuando exista;
- método de asignación;
- KPI principal;
- meta o efecto de interés;
- guardrails;
- segmentos predefinidos;
- baseline;
- duración prevista;
- periodo de estabilización si aplica;
- tratamiento de faltantes;
- tratamiento de no adherencia/exposición parcial;
- tratamiento de contaminación e interferencia;
- cambios concurrentes prohibidos o registrados;
- regla analítica;
- criterio de suficiencia de evidencia;
- criterio de pausa;
- criterio de reversa;
- regla de cierre;
- versión del diseño.

Modificar el diseño después de observar resultados deberá quedar registrado como cambio de versión y no podrá presentarse como si hubiese sido preespecificado desde el inicio.

#### 13. Asignación, exposición y cumplimiento

D016 separa tres conceptos:

```text
ASIGNADO
→ la unidad fue seleccionada para una condición

EXPUESTO
→ la intervención realmente alcanzó a la unidad bajo la definición aprobada

CUMPLIÓ INTERVENCIÓN
→ la unidad recibió o siguió el tratamiento con la intensidad o condición definida
```

Reglas:

1. asignación sin exposición no se registra como exposición plena;
2. exposición sin evidencia suficiente queda `PENDIENTE_DE_EVIDENCIA`;
3. abandono, cruce de condición y exposición parcial permanecen visibles;
4. el análisis deberá declarar si usa asignación, exposición o cumplimiento como base y qué sesgo introduce;
5. una intervención técnica desplegada no prueba que el usuario, sede o proceso la haya utilizado;
6. una capacitación enviada no prueba asistencia, comprensión, adopción ni efecto;
7. un cambio de política comunicado no prueba que haya entrado en práctica en toda la población.

#### 14. Interferencia, contaminación y spillover

La evaluación deberá considerar si la intervención de una unidad puede afectar a otra.

Ejemplos:

- trabajadores que comparten turno o estación;
- sedes que comparten inventario o producción;
- clientes expuestos a múltiples canales;
- productos sustitutos;
- proveedores que atienden varias sedes;
- campañas que alcanzan controles;
- configuraciones compartidas entre dispositivos;
- cambios de proceso que afectan toda una cola o ruta.

Reglas:

1. un control contaminado no se trata como no expuesto;
2. el diseño deberá declarar la unidad en la que la interferencia es plausible;
3. cuando la interferencia impida separar condiciones, se reduce el lenguaje causal o se rediseña la unidad de intervención;
4. efectos indirectos pueden medirse, pero no se atribuyen sin diseño compatible.

#### 15. Ventanas de una intervención

D016 distingue como mínimo:

```text
BASELINE
→ periodo observado previo definido en D015

PREPARACIÓN
→ configuración, capacitación, asignación o readiness sin contabilizar efecto

EXPOSICIÓN
→ periodo en que la intervención puede afectar la población

ESTABILIZACIÓN
→ tiempo necesario antes de interpretar resultado cuando exista latencia o adaptación

EVALUACIÓN
→ ventana predefinida para medir KPI y guardrails

SEGUIMIENTO POSTERIOR
→ persistencia, reversión tardía o efectos no deseados posteriores cuando aplique
```

No existe una duración universal. Cada ventana deberá justificarse por la dinámica del proceso, la latencia de datos y el mecanismo esperado.

#### 16. Responsable de ejecución

Toda intervención concreta deberá tener un responsable de ejecución identificable.

El responsable de ejecución deberá poder responder por:

- preparación de la intervención;
- versión aplicada;
- alcance autorizado;
- fecha/hora de inicio;
- evidencia de ejecución;
- incidencias durante ejecución;
- desviaciones del diseño;
- pausa o reversa cuando esté autorizado;
- fecha/hora de finalización;
- entrega de evidencia al responsable de medición.

El responsable de ejecución no puede:

- redefinir la meta;
- cambiar el KPI por conveniencia;
- ocultar una desviación;
- certificar datos por el solo hecho de haber ejecutado;
- ampliar población sin nueva decisión aplicable;
- declarar efecto causal por observación operativa.

#### 17. Responsable de medición y análisis

La función responsable de medición deberá:

- fijar el corte de evaluación conforme al plan aprobado;
- verificar versiones de KPI, baseline, meta y guardrails;
- comprobar calidad y cobertura;
- reconstruir población elegible, asignada y expuesta;
- conservar cambios concurrentes;
- ejecutar o revisar el método analítico predefinido;
- reportar resultados favorables, desfavorables y no concluyentes;
- mostrar segmentos predefinidos;
- separar resultado observado de efecto atribuible;
- proponer el nivel D014 sustentable;
- conservar consultas, modelos, versiones y evidencia.

Medir no concede autoridad para adoptar o revertir la acción.

#### 18. Seguimiento de fidelidad de implementación

Antes de interpretar resultados se deberá responder si la intervención ocurrió como fue diseñada.

La fidelidad deberá considerar:

- porcentaje o conteo de unidades asignadas con exposición verificable cuando la métrica sea válida;
- intensidad o dosis definida cuando aplique;
- cumplimiento de secuencia;
- versión aplicada;
- retrasos;
- exclusiones no previstas;
- interrupciones;
- errores de configuración;
- cambios concurrentes;
- desviaciones aprobadas y no aprobadas;
- incidencias que alteren medición.

Una intervención mal ejecutada puede producir un resultado no concluyente. No se interpreta automáticamente como prueba de que el mecanismo empresarial no funciona.

#### 19. Seguimiento de guardrails

Los guardrails definidos en D015 deberán observarse durante la intervención con la cadencia compatible con el riesgo.

Reglas:

1. un guardrail material no se oculta porque el KPI mejore;
2. un límite de guardrail no crea por sí solo una pausa automática;
3. la acción ante un guardrail debe estar predefinida como revisar, pausar, reducir exposición, revertir o escalar, según autoridad y riesgo;
4. riesgos de seguridad, legalidad, privacidad, inocuidad o integridad pueden exigir tratamiento inmediato por sus contratos propietarios;
5. un guardrail con fuente `BLOQUEADO` impide declarar que el riesgo estuvo adecuadamente controlado;
6. si el guardrail se redefine durante la intervención, la evaluación conserva ambas versiones y remite a D017 cuando corresponda.

#### 20. Criterios de pausa

Una pausa es una suspensión controlada para revisar evidencia o riesgo.

Podrá activarse documentalmente cuando exista una condición predefinida como:

- deterioro de guardrail material;
- incidente de seguridad, privacidad, inocuidad o cumplimiento;
- calidad de datos insuficiente para continuar con seguridad;
- ejecución fuera del alcance autorizado;
- contaminación que invalida el diseño;
- exposición no controlada;
- falla técnica que cambia materialmente la intervención;
- evidencia nueva que altera el balance de riesgo.

La pausa conserva el expediente, exposición acumulada, decisiones y evidencia. No elimina resultados previos ni implica automáticamente reversa.

#### 21. Reversa

La reversa es una acción empresarial o técnica distinta de la evaluación estadística.

Toda intervención reversible deberá declarar, antes de ejecución cuando sea material:

- qué puede revertirse;
- quién está autorizado;
- condición de reversa;
- procedimiento propietario aplicable;
- efecto esperado de la reversa;
- datos o estado que no pueden retroceder;
- evidencia de reversa;
- impacto sobre la medición.

Una reversa no borra exposición ya ocurrida ni reescribe el resultado observado.

Intervenciones irreversibles deberán declarar expresamente esa condición en la evaluación de riesgo previa.

#### 22. Cambios concurrentes

Durante la intervención deberán registrarse cambios que puedan afectar KPI, drivers o guardrails.

Según el caso pueden incluir:

- precio o promoción;
- disponibilidad de inventario;
- proveedor o lead time;
- receta o proceso productivo;
- capacidad;
- dotación o programación;
- política de servicio;
- canal;
- cobertura de datos;
- definición de métrica;
- incidente operacional;
- cambio tecnológico;
- otra intervención simultánea;
- evento externo documentado.

Un cambio concurrente no invalida automáticamente la evaluación, pero deberá analizarse como explicación alternativa conforme a D014.

#### 23. Comprobación del resultado

La comprobación deberá evaluar en conjunto:

1. si la intervención se ejecutó como fue definida;
2. qué población fue realmente asignada y expuesta;
3. si KPI, baseline y meta siguen siendo comparables;
4. si la calidad de datos es suficiente;
5. resultado del KPI principal;
6. distancia o cumplimiento respecto de la meta cuando sea evaluable;
7. comportamiento de drivers;
8. comportamiento de guardrails;
9. segmentos predefinidos;
10. efectos no deseados;
11. cambios concurrentes;
12. pérdidas, contaminación o interferencia;
13. incertidumbre del método;
14. resultado observado frente a efecto atribuible;
15. nivel de confianza D014 sustentable;
16. límites de generalización;
17. persistencia cuando exista seguimiento posterior;
18. decisión empresarial de cierre.

Un único valor favorable del KPI no satisface por sí solo la comprobación.

#### 24. Resultado observado y efecto atribuible

D016 mantiene dos capas separadas:

```text
RESULTADO OBSERVADO
→ qué ocurrió en KPI, drivers y guardrails durante la ventana

EFECTO ATRIBUIBLE
→ cuánto del cambio puede atribuirse razonablemente a la intervención bajo el diseño y supuestos
```

Reglas:

1. el resultado observado puede existir sin efecto atribuible identificable;
2. cumplir la meta no demuestra que la intervención la causó;
3. no cumplir la meta no demuestra ausencia de efecto si la meta y el efecto esperado son conceptos distintos;
4. una acción puede producir efecto favorable sin alcanzar todavía la meta;
5. una mejora de KPI con daño material en guardrails no se presenta como éxito pleno;
6. un experimento puede concluir sin efecto detectable y aun así producir aprendizaje útil;
7. la atribución conserva residuo no explicado.

#### 25. EFECTO_COMPROBADO

El nivel `EFECTO_COMPROBADO` pertenece a D014 y D016 produce la evidencia que puede permitir alcanzarlo.

Para proponer ese nivel deberán cumplirse, como mínimo:

- intervención real y versionada;
- población y ventana definidas antes del análisis;
- asignación/exposición reconstruibles;
- indicador principal gobernado;
- baseline o comparador válido según diseño;
- guardrails medidos;
- calidad compatible con el uso;
- diseño capaz de identificar efecto;
- desviaciones e interferencias evaluadas;
- cambios concurrentes tratados;
- resultado reproducible;
- limitaciones declaradas;
- evidencia suficiente para el alcance de la afirmación.

`EFECTO_COMPROBADO` sigue limitado a la población, periodo, condiciones y versión observados. No autoriza generalización automática.

#### 26. Significancia, tamaño de efecto y relevancia empresarial

Cuando un diseño produzca inferencia estadística deberán conservarse por separado:

- estimación de efecto;
- unidad;
- intervalo o incertidumbre cuando aplique;
- criterio estadístico utilizado;
- tamaño de población;
- pérdidas y exclusiones;
- relevancia empresarial;
- resultado frente a meta;
- guardrails;
- supuestos del diseño.

Reglas:

1. significancia estadística no sustituye tamaño de efecto;
2. tamaño de efecto no sustituye relevancia empresarial;
3. p-value no es probabilidad de que la hipótesis causal sea verdadera;
4. ausencia de significancia no prueba efecto exactamente cero;
5. múltiples segmentos o comparaciones posteriores deben declararse y no presentarse como hipótesis preespecificadas;
6. la decisión empresarial considera efecto, riesgo, costo, guardrails, confianza y transferibilidad, no un único estadístico.

#### 27. Segmentos y heterogeneidad de efecto

Los segmentos principales deberán predefinirse cuando sean materiales para la decisión.

Reglas:

- una mejora agregada puede ocultar daño en una sede, canal, producto o población;
- un hallazgo de subgrupo exploratorio se presenta como exploratorio;
- grupos pequeños consumen las protecciones de `DATA-AUTH-002`;
- un efecto observado en un segmento no se generaliza a otro sin evidencia;
- segmentar después de observar resultados puede generar hipótesis para una iteración, no reescribir el diseño inicial;
- heterogeneidad material deberá influir en la decisión de adopción o ampliación.

#### 28. Efectos no deseados

D016 obliga a conservar efectos no deseados aunque no hayan sido definidos como guardrail si aparecen durante ejecución.

Pueden incluir:

- deterioro de calidad;
- aumento de merma;
- reducción de servicio;
- desplazamiento de demanda;
- aumento de gasto o riesgo financiero;
- inequidad entre poblaciones;
- carga operativa;
- incidentes de privacidad o seguridad;
- fallas de adopción;
- desplazamiento del problema a otra sede, canal, producto o periodo.

Un efecto no deseado material puede justificar pausa, reversa, rediseño o no adopción aunque el KPI principal mejore.

#### 29. Siete decisiones de cierre

D016 materializa siete decisiones empresariales de cierre. Solo una deberá representar la decisión vigente de una evaluación cerrada, sin borrar decisiones anteriores.

|    # | Decisión                | Semántica                                                      | Condición mínima                                                                                            |
| ---: | ----------------------- | -------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
|    1 | `ADOPTAR`               | mantener la intervención dentro del alcance comprobado         | beneficio/resultado suficiente, riesgos aceptables y guardrails compatibles                                 |
|    2 | `AMPLIAR`               | extender a una población o alcance adicional                   | resultado suficiente y justificación de transferibilidad; la ampliación crea nueva coordenada de exposición |
|    3 | `ITERAR`                | modificar hipótesis, acción o diseño y volver a evaluar        | aprendizaje concreto y nueva versión del expediente                                                         |
|    4 | `PAUSAR`                | suspender antes de una nueva decisión                          | riesgo, evidencia insuficiente o condición predefinida de pausa                                             |
|    5 | `REVERTIR`              | deshacer una intervención reversible                           | balance de riesgo/resultado o condición de reversa satisfecha y autoridad aplicable                         |
|    6 | `ESCALAR_INVESTIGACION` | regresar a diagnóstico/medición antes de intervenir nuevamente | resultado no concluyente, explicación alternativa o calidad insuficiente                                    |
|    7 | `CERRAR_SIN_ADOPCION`   | terminar la iniciativa sin mantener la intervención            | ausencia de beneficio suficiente, riesgo no aceptable, inviabilidad o decisión empresarial documentada      |

`AMPLIAR` no significa que el efecto esté demostrado en la nueva población. La ampliación requiere su propio seguimiento y evaluación.

#### 30. Adopción no equivale a causalidad universal

Una organización puede adoptar una acción por obligación, reducción de riesgo o balance empresarial aun cuando la evidencia causal sea limitada.

La decisión deberá declarar:

- resultado observado;
- efecto atribuible, si existe;
- nivel D014;
- cumplimiento de meta;
- guardrails;
- costo, esfuerzo o restricción material conocida cuando corresponda;
- riesgo de adoptar;
- riesgo de no adoptar;
- alcance exacto de adopción;
- limitaciones;
- razón empresarial final.

La decisión empresarial no cambia retrospectivamente el nivel de confianza de la evidencia.

#### 31. Iteración

Una iteración crea una nueva versión de la intervención o del diseño.

Deberá conservar:

- qué aprendizaje motivó el cambio;
- qué componente cambia;
- qué componentes permanecen;
- nueva hipótesis cuando aplique;
- nueva población o ventana cuando aplique;
- nueva versión de acción/diseño;
- baseline aplicable;
- meta y guardrails vigentes;
- impacto sobre comparabilidad;
- nueva decisión de aprobación antes de ejecución.

La iteración no sobrescribe resultados previos.

#### 32. Aprendizaje

Todo cierre deberá producir una síntesis de aprendizaje aun cuando el efecto sea nulo o no concluyente.

El aprendizaje deberá separar:

```text
QUÉ SE HIZO
QUÉ SE OBSERVÓ
QUÉ PUEDE ATRIBUIRSE
QUÉ NO PUDO DETERMINARSE
QUÉ GUARDRAILS O EFECTOS NO DESEADOS APARECIERON
QUÉ LIMITACIONES EXISTIERON
QUÉ DECISIÓN SE TOMÓ
DÓNDE PUEDE Y NO PUEDE GENERALIZARSE
```

Un resultado desfavorable no se elimina del registro. Un resultado nulo puede evitar una inversión futura y constituye aprendizaje válido.

#### 33. Calidad y datos durante la evaluación

D016 consume D007.

Reglas:

1. una fuente crítica `BLOQUEADO` impide una conclusión oficial dependiente de ella;
2. una fuente `DEGRADADO` conserva la limitación en el resultado;
3. un backfill o corrección posterior exige evaluar si cambia la conclusión;
4. un dato tardío no se descarta solo por llegar después de la primera lectura;
5. una pérdida diferencial entre condiciones puede sesgar el resultado y deberá analizarse;
6. un cambio de cobertura durante la intervención se registra como evento material;
7. calidad insuficiente puede producir `ESCALAR_INVESTIGACION` en vez de una conclusión artificial.

#### 34. Cambios de definición y D017

Si durante o después de una intervención cambia:

- fórmula del KPI;
- población;
- dimensión;
- calendario;
- moneda o unidad;
- definición de exposición;
- baseline;
- meta;
- guardrail;
- fuente crítica;
- regla de inclusión/exclusión;

no se reescribe silenciosamente la evaluación original.

D017 deberá gobernar versión, reconstrucción, corrección histórica, restatement y relación entre resultados originales y reexpresados.

#### 35. Privacidad, seguridad, equidad y cumplimiento

Una intervención o experimento no puede utilizar la analítica como autorización implícita para modificar personas, clientes, permisos, precios, condiciones laborales, seguridad, datos personales o decisiones reguladas.

Antes de ejecución futura deberán aplicarse los contratos propietarios de autorización y cumplimiento.

Reglas:

- minimizar datos personales en diseño y análisis;
- proteger poblaciones pequeñas;
- no asignar condiciones sensibles por inferencia no autorizada;
- registrar exclusiones obligatorias;
- no degradar controles de seguridad para facilitar un experimento;
- no retener una corrección obligatoria para conservar un grupo control;
- no ocultar efectos inequitativos bajo un promedio agregado;
- separar finalidad analítica de facultad para actuar sobre una persona.

#### 36. Automatización, BI e inteligencia artificial

Una herramienta puede asistir en:

- generar candidatos de acción;
- preparar asignaciones bajo reglas aprobadas;
- monitorear métricas;
- detectar desviaciones;
- ejecutar análisis reproducible;
- resumir evidencia;
- proponer hipótesis de iteración.

No puede por sí sola:

- aprobar una acción;
- fijar o cambiar meta;
- ampliar población;
- omitir guardrails;
- ejecutar un cambio empresarial sin contrato y autorización;
- declarar `EFECTO_COMPROBADO`;
- ocultar resultados negativos;
- decidir adopción o reversa;
- alterar fuentes de verdad.

La integración física corresponde a `DATA-INT-004`; la auditoría futura a `DATA-AUTH-004`.

#### 37. Publicación y comunicación de resultados

Una comunicación de cierre deberá mostrar, según la finalidad y autorización:

- objetivo;
- acción o intervención;
- población y alcance;
- diseño de evaluación;
- baseline y meta;
- resultado del KPI;
- guardrails;
- exposición real;
- calidad de datos;
- nivel D014;
- efecto atribuible cuando exista;
- efectos no deseados;
- segmentos relevantes;
- limitaciones;
- decisión de cierre;
- aprendizaje;
- corte y versión.

No se comunica un resultado no concluyente como éxito. No se omiten guardrails adversos. No se generaliza fuera del alcance de evidencia.

La publicación consume D008 y las autorizaciones aplicables.

#### 38. Auditoría y reproducibilidad del expediente

El expediente deberá conservar, como mínimo:

- quien creó la propuesta;
- quien aprobó;
- quien ejecutó;
- quien midió;
- quien tomó la decisión final;
- timestamps de decisiones y ejecución;
- versiones de objetivo, acción y diseño;
- población elegible y asignación;
- exposición real;
- consultas/modelos utilizados;
- versiones de métricas;
- fuentes y cortes;
- eventos de pausa/reversa;
- desviaciones del diseño;
- cambios concurrentes;
- resultados y guardrails;
- cambios de confianza;
- aprendizaje;
- decisiones anteriores y vigentes;
- relación con iteraciones posteriores.

Una evidencia generada después del cierre no se inserta retroactivamente como si hubiera estado disponible al momento de decidir.

#### 39. Handoffs con propietario documental exacto

| Decisión o materialización fuera del alcance                                  | Propietario documental | Condición de salida                                                        |
| ----------------------------------------------------------------------------- | ---------------------- | -------------------------------------------------------------------------- |
| correcciones históricas, reconstrucciones y restatements                      | `DATA-DOM-017`         | antes de reexpresar resultados, baseline o conclusiones publicadas         |
| protección por dominio, entidad, territorio y finalidad                       | `DATA-AUTH-001`        | antes de exponer o actuar sobre datos restringidos                         |
| protección de poblaciones pequeñas, comparaciones y drill-down                | `DATA-AUTH-002`        | antes de analizar o publicar detalle sensible                              |
| segregación de definición, certificación, publicación, metas y administración | `DATA-AUTH-003`        | antes de conceder capacidades sobre objetivos, intervenciones o resultados |
| auditoría de consultas, descargas, modelos y recomendaciones                  | `DATA-AUTH-004`        | antes de automatizar trazabilidad de uso analítico                         |
| experiencia de investigación diagnóstica                                      | `DATA-UX-005`          | antes de implementar navegación desde señal hacia intervención             |
| experiencia de objetivos, metas, guardrails y acciones                        | `DATA-UX-006`          | antes de implementar la superficie operativa de mejora                     |
| validación de comprensión, tiempos y decisiones                               | `DATA-UX-008`          | antes de declarar usable el flujo analítico completo                       |
| capa semántica, cálculos, snapshots, consultas y rendimiento                  | `DATA-INT-002`         | antes de servir evaluaciones compartidas productivas                       |
| BI, hojas, modelos analíticos e inteligencia artificial                       | `DATA-INT-004`         | antes de conectar herramientas externas o automatización analítica         |

No existe en D016 una acción operacional concreta que requiera asignar un paquete de implementación de dominio. Cuando exista una instancia de intervención, la modificación física deberá pertenecer a la tarea o paquete propietario del comportamiento que cambie y deberá satisfacer sus autorizaciones y pruebas antes de ejecución. D016 no crea una modificación física pendiente por sí sola.

#### 40. Cobertura de requisitos de prueba vigente

Las reglas de D016 ya quedan protegidas por requisitos vigentes:

- `TREQ-DATA-005` protege explícitamente la separación entre señal, diagnóstico, hipótesis, acción, experimento, responsable, línea base, meta, indicador principal, drivers, guardrails, ventana, segmentos, resultado, confianza, aprendizaje y decisión de cierre o iteración; exige comparar resultado contra baseline y guardrails y conservar efectos no deseados;
- `TREQ-DATA-002` protege identidad, propósito, fórmula, población, dimensiones, unidad, versión y comparación de métricas;
- `TREQ-DATA-003` protege calidad, cobertura, datos tardíos, backfills, reconciliación y linaje;
- `TREQ-DATA-004` protege publicación, corte, calidad, snapshots, drill-down y separación entre artefactos analíticos;
- los requisitos propietarios de cada dominio continúan protegiendo las reglas operativas que una intervención futura pueda modificar.

D016 especializa el ciclo de intervención, seguimiento y comprobación dentro del requisito existente de mejora basada en datos. No cambia su regla protegida, prioridad, modalidad, relaciones ni destino de implementación.

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea materializa documentalmente el ciclo de acción, experimento, responsabilidad, exposición, seguimiento, guardrails, comprobación, confianza, aprendizaje y cierre dentro de requisitos vigentes que ya protegen ese comportamiento. No introduce una implementación, transición operativa, integración física, automatización, autorización, dato o experimento ejecutable nuevo.

#### 41. Criterios de aceptación

1. recomendación, decisión y acción permanecen separadas;
2. acción y experimento permanecen separados;
3. intervención diseñada, ejecutada y efectivamente expuesta permanecen estados observables distintos;
4. asignación, exposición y cumplimiento de intervención permanecen separados;
5. seguimiento no se presenta como comprobación causal;
6. resultado observado y efecto atribuible permanecen separados;
7. cumplir meta no demuestra causalidad;
8. mejorar KPI no permite ignorar un guardrail material;
9. before/after simple no se presenta como experimento causal;
10. p-value no se presenta como probabilidad de causalidad;
11. significancia estadística y relevancia empresarial permanecen separadas;
12. pausa, reversa y fracaso definitivo permanecen decisiones distintas;
13. acción completada no equivale a objetivo comprobado;
14. `EFECTO_COMPROBADO` conserva límites de población, ventana, condiciones y versión;
15. existe un expediente mínimo con 33 coordenadas obligatorias;
16. la puerta previa contiene 20 condiciones explícitas;
17. una condición crítica ausente produce `PENDIENTE_DE_EVIDENCIA` o `BLOQUEADO` y no un supuesto;
18. la puerta documental no concede autorización operativa;
19. existen exactamente seis clases de intervención;
20. la corrección obligatoria no se retrasa para mantener un control experimental cuando la obligación exige actuar;
21. la necesidad de experimento depende de la afirmación causal, riesgo, reversibilidad y capacidad de identificación;
22. un piloto sin comparador no se declara experimento causal;
23. existen exactamente seis diseños de evaluación o experimento;
24. el diseño pre/post de una sola población tiene como máximo `ASOCIACION` para atribución causal por sí solo;
25. un diseño cuasi-experimental puede alcanzar `EVIDENCIA_CAUSAL` únicamente bajo supuestos y evidencia suficientes;
26. `EFECTO_COMPROBADO` requiere intervención o experimento gobernado y evidencia compatible;
27. el nombre del diseño no garantiza nivel de confianza;
28. el diseño se preespecifica antes de exposición;
29. cambios posteriores del diseño conservan nueva versión y no se presentan como preespecificados;
30. unidad de asignación y unidad de análisis permanecen separadas cuando corresponda;
31. población elegible se define antes de resultados;
32. contaminación, interferencia y spillover permanecen visibles;
33. baseline, preparación, exposición, estabilización, evaluación y seguimiento posterior permanecen ventanas distintas;
34. no existe duración universal inventada;
35. toda intervención concreta tiene propietario funcional, aprobador, responsable de ejecución y responsable de medición distinguibles;
36. ejecutar no concede autoridad para cambiar KPI o meta;
37. medir no concede autoridad para adoptar o revertir;
38. fidelidad de implementación se verifica antes de interpretar resultado;
39. una intervención mal ejecutada no se presenta automáticamente como refutación del mecanismo;
40. guardrails se monitorean durante la intervención con cadencia compatible con riesgo;
41. un guardrail no crea por sí solo una automatización;
42. criterios de pausa se definen antes de ejecución cuando sean materiales;
43. pausa conserva expediente y exposición previa;
44. reversa no borra exposición ni resultados históricos;
45. intervenciones irreversibles declaran esa condición antes de ejecución;
46. cambios concurrentes permanecen como explicaciones alternativas;
47. la comprobación evalúa conjuntamente ejecución, exposición, KPI, meta, drivers, guardrails, segmentos, calidad, incertidumbre y efectos no deseados;
48. un valor favorable del KPI no satisface por sí solo la comprobación;
49. resultado observado puede existir sin efecto atribuible;
50. no cumplir meta no demuestra por sí solo ausencia de efecto;
51. un experimento sin efecto concluyente puede generar aprendizaje válido;
52. el residuo no explicado permanece visible;
53. `EFECTO_COMPROBADO` exige diseño capaz de identificar efecto y resultado reproducible;
54. la confianza no se generaliza automáticamente a otras sedes, poblaciones, canales, productos o periodos;
55. tamaño de efecto, incertidumbre, significancia y relevancia empresarial se reportan por separado cuando apliquen;
56. análisis de segmentos posteriores al resultado se declaran exploratorios;
57. efectos no deseados se conservan aunque no estuvieran predefinidos como guardrail;
58. existen exactamente siete decisiones de cierre;
59. `ADOPTAR`, `AMPLIAR`, `ITERAR`, `PAUSAR`, `REVERTIR`, `ESCALAR_INVESTIGACION` y `CERRAR_SIN_ADOPCION` permanecen decisiones distintas;
60. ampliar no demuestra efecto en la nueva población;
61. una adopción empresarial no eleva retroactivamente la confianza causal;
62. iterar crea una nueva versión y no sobrescribe resultados previos;
63. todo cierre conserva aprendizaje, límites y decisión;
64. resultados desfavorables y nulos permanecen en el registro;
65. calidad D007 limita las conclusiones dependientes;
66. backfills y correcciones posteriores se evalúan por impacto y remiten a D017;
67. cambios de definición no reescriben silenciosamente evaluación original;
68. privacidad, seguridad, equidad y cumplimiento no se suspenden para facilitar experimentación;
69. no se retiene una corrección obligatoria para preservar un grupo control;
70. IA, BI o modelos no pueden aprobar acciones, declarar efecto comprobado ni ejecutar cambios por sí solos;
71. publicación conserva objetivo, acción, población, diseño, baseline, meta, KPI, guardrails, calidad, confianza, limitaciones y decisión;
72. auditoría conserva actores, timestamps, versiones, exposición, cambios concurrentes, resultados y aprendizaje;
73. cada handoff tiene propietario documental exacto y condición de salida;
74. D016 no crea un paquete operacional inexistente cuando no existe intervención concreta;
75. no se crea, modifica, difiere, descarta ni vuelve obsoleto ningún requisito de prueba;
76. no se ejecuta código, DDL, DML, migración, backfill, despliegue, automatización, experimento, acción empresarial ni cambio de Supabase;
77. `DATA-DOM-017` permanece únicamente reservada.

#### 42. Continuidad

```text
ÚLTIMA TAREA APROBADA
DATA-DOM-015 — Definir objetivos, líneas base, metas, drivers, guardrails y planes de medición

TAREA ACTUAL APROBADA
DATA-DOM-016 — Definir acciones de mejora, experimentos, responsables, seguimiento y comprobación de resultados

SIGUIENTE TAREA RESERVADA
DATA-DOM-017 — Definir versionado de métricas, restatements, correcciones históricas y reproducibilidad
```


### ✅ DATA-DOM-017 — Definir versionado de métricas, restatements, correcciones históricas y reproducibilidad

**Estado:** APROBADA
**Tarea anterior:** `DATA-DOM-016 — Definir acciones de mejora, experimentos, responsables, seguimiento y comprobación de resultados` — APROBADA
**Tarea siguiente:** `DATA-AUTH-001 — Proteger datos maestros, métricas, reportes y análisis por dominio, entidad, territorio y finalidad` — RESERVADA
**Tipo de tarea:** documental; contrato canónico de versionado semántico, correcciones históricas, reconstrucciones, restatements y reproducibilidad analítica
**Bloque:** AB — Analítica, indicadores y datos maestros
**Fase:** exclusivamente documental
**Implementación técnica:** no autorizada
**Código, DDL, DML, migraciones, backfills, replays, cambios de datos, reejecuciones productivas, publicación de restatements o cambios en Supabase:** no autorizados
**Requisitos de prueba creados o modificados:** 0

#### 1. Propósito

Definir cómo Vento OS conserva y reproduce el significado histórico de métricas, resultados, diagnósticos, objetivos, intervenciones y publicaciones cuando cambian datos, definiciones, dimensiones, transformaciones o evidencia, sin reescribir silenciosamente lo que una persona o proceso conocía y utilizó en un momento anterior.

La tarea deberá permitir responder de forma reproducible:

```text
qué definición de métrica estaba vigente
qué datos y versiones estaban disponibles al corte
qué transformación, consulta o modelo produjo el resultado
qué dimensiones, filtros, moneda, unidad y calendario aplicaron
qué publicación o decisión consumió ese resultado
qué cambió posteriormente
si el cambio fue de fuente, semántica, cobertura, transformación o publicación
qué periodos, métricas, artefactos y decisiones quedaron afectados
si corresponde reconstrucción, corrección histórica o restatement
qué valor se conocía entonces
qué valor se obtiene ahora con la evidencia corregida
qué diferencia existe entre ambos
qué calidad y certificación corresponde a cada versión
qué versión continúa vigente para nuevos usos
qué evidencia permite reproducir cada resultado
```

D017 no corrige datos productivos, no ejecuta backfills, no reabre periodos, no recalcula métricas productivas, no publica restatements y no modifica el código de las aplicaciones. Define el contrato documental que esas operaciones deberán respetar cuando sean autorizadas e implementadas por sus tareas propietarias.

#### 2. Resultado sustantivo

Queda materializado el contrato canónico de versionado, corrección histórica y reproducibilidad con los siguientes resultados:

- separación explícita entre identidad de métrica, versión semántica, versión de esquema, versión de transformación, versión técnica y edición de publicación;
- preservación de la regla `misma métrica + misma versión + mismo contexto + mismo corte = mismo resultado`;
- criterios exhaustivos para determinar cuándo un cambio exige una nueva versión semántica y cuándo solo exige una nueva versión técnica;
- preservación de las **14 de 14 métricas reales** del registro inicial de asistencia como versión semántica `1`, sin renombrarlas ni inventar nuevas claves;
- reconciliación del registro inicial: **14 esperadas; 14 materializadas; 14 claves únicas; 0 faltantes; 0 duplicadas**;
- preservación de los estados heredados de calidad: **11 `NO EVALUADO` y 3 `BLOQUEADO`**;
- materialización de una decisión explícita de versionado para las **55 familias analíticas** aprobadas en D009 a D013, sin convertir nombres de familia en `metric_key` ni asignar versiones ficticias;
- reconciliación del universo analítico: **55 esperadas; 55 decisiones materializadas; 0 faltantes; 0 duplicadas**;
- separación canónica entre reintento, replay, backfill, corrección de fuente, reconstrucción y restatement;
- una matriz de disparadores que determina cuándo una modificación puede afectar una publicación oficial y cuándo no constituye restatement;
- contrato mínimo de evaluación de impacto histórico antes de reexpresar cualquier resultado;
- preservación obligatoria de la publicación original y de la relación con cualquier reexpresión posterior;
- distinción entre **resultado conocido entonces** y **resultado reconstruido ahora**;
- reglas para cambios de métricas, maestros, dimensiones, transformaciones, datos tardíos, backfills, correcciones de fuente y cambios de calidad;
- reglas de propagación de impacto desde hechos y maestros hasta métricas, publicaciones, diagnósticos, líneas base, objetivos e intervenciones;
- regla de recertificación: una reconstrucción o restatement no hereda automáticamente la certificación de la versión anterior;
- contrato mínimo de reproducibilidad con fuente, esquema, transformación, semántica, contexto, corte, población, dimensiones, calidad y evidencia;
- tratamiento específico de las seis familias de artefacto de D008: tablero, reporte, exportación, suscripción, alerta y snapshot oficial;
- reglas para diagnósticos D014, objetivos D015 e intervenciones D016 cuando una corrección posterior altera la evidencia disponible;
- prohibición de usar una corrección histórica para ocultar el dato, publicación, diagnóstico, meta o decisión original;
- cero cambios físicos y cero cambios de requisitos de prueba.

#### 3. Decisión principal

Vento OS adopta un modelo de **historia analítica versionada y reproducible**.

```text
FUENTE PROPIETARIA
→ conserva el hecho, maestro, evento o corrección autorizada

VERSIÓN DE CONTRATO / ESQUEMA
→ identifica la representación recibida

VERSIÓN DE TRANSFORMACIÓN
→ identifica las reglas que construyen el derivado

VERSIÓN SEMÁNTICA DE MÉTRICA
→ identifica el significado empresarial utilizado

CONTEXTO + CORTE
→ fija población, dimensiones, filtros, tiempo y evidencia disponible

RESULTADO
→ valor reproducible para esa coordenada

PUBLICACIÓN O DECISIÓN
→ conserva exactamente el resultado y contexto conocidos entonces

CAMBIO POSTERIOR
→ se evalúa por impacto; nunca sobrescribe silenciosamente la historia

RECONSTRUCCIÓN
→ recalcula un derivado con fuentes y versiones declaradas

RESTATEMENT, CUANDO CORRESPONDA
→ publica una reexpresión vinculada con la edición anterior

HISTORIA
→ conserva original, reexpresión, motivo, diferencia y evidencia
```

Regla cardinal:

```text
LO CONOCIDO ENTONCES
≠
LO RECONSTRUIDO AHORA
```

Ambas vistas pueden ser válidas para preguntas distintas y deberán permanecer trazables.

#### 4. Fuentes y decisiones heredadas

D017 consume sin redefinir:

- `DATA-DOM-001` a `DATA-DOM-003` para propiedad, stewardship, identidad, claves, jerarquías, vigencias, fusión, separación y fuentes de verdad;
- `DATA-DOM-004` para `metric_key`, versión semántica, fórmula, numerador, denominador, granularidad, dimensiones, filtros, unidad, moneda, calendario, zona horaria, calidad y comparación;
- `DATA-DOM-005` para tiempo de ocurrencia, fecha empresarial, recepción, procesamiento, corrección, corte, granularidad, dimensión efectiva, snapshots y comparabilidad histórica;
- `DATA-DOM-006` para contratos de origen, esquema, ingestión, replay, backfill, corrección, reconstrucción, reconciliación y linaje;
- `DATA-DOM-007` para calidad, evidencia y estados `NO EVALUADO`, `EN OBSERVACIÓN`, `CERTIFICADO`, `DEGRADADO` y `BLOQUEADO`;
- `DATA-DOM-008` para tablero, reporte, exportación, suscripción, alerta, snapshot oficial, publicación y distribución;
- `DATA-DOM-009` a `DATA-DOM-013` para las 55 familias analíticas de dominio;
- `DATA-DOM-014` para diagnósticos, hipótesis, evidencia, confianza y conclusiones oficiales;
- `DATA-DOM-015` para objetivos, KPI, líneas base, metas, drivers, guardrails y planes de medición;
- `DATA-DOM-016` para acciones, experimentos, exposición, seguimiento, resultado, aprendizaje y decisión de cierre;
- `CAP-SCOPE-017` para versionado de métricas, conservación de historia, datos tardíos, backfills, snapshots inmutables, restatements y reproducibilidad;
- `TREQ-DATA-001`, `TREQ-DATA-002`, `TREQ-DATA-003` y `TREQ-DATA-004` como protección preexistente del significado histórico, versionado, correcciones, backfills, linaje, publicaciones inmutables y restatements;
- `DATA-AUTH-001` a `DATA-AUTH-004` como frontera inmediata de autorización, segregación y auditoría;
- `DATA-UX-002`, `DATA-UX-003` y `DATA-UX-007` como superficies futuras para definición, comparación y publicaciones versionadas;
- `DATA-INT-001` a `DATA-INT-004` como fronteras futuras de contratos, materialización, crosswalks y herramientas externas.

D017 no cambia el significado aprobado de ninguna métrica ni el estado de certificación de ninguna fuente o resultado.

#### 5. Fronteras conceptuales obligatorias

```text
metric_key
≠ versión semántica
≠ versión de esquema
≠ versión de transformación
≠ versión de código
≠ edición de publicación
```

```text
cambio técnico
≠ cambio de significado
```

```text
corrección de fuente
≠ replay
≠ backfill
≠ reconstrucción
≠ restatement
```

```text
dato tardío
≠ dato incorrecto
```

```text
reconstrucción
≠ modificación del hecho fuente
```

```text
restatement
≠ sobrescritura de la publicación anterior
```

```text
fecha del hecho
≠ fecha de corrección
≠ fecha de reconstrucción
≠ fecha de publicación
≠ fecha de restatement
```

```text
versión vigente para nuevos usos
≠ versión usada históricamente
```

```text
resultado original
≠ resultado reexpresado
≠ diferencia entre resultados
```

```text
reproducibilidad
≠ conservar únicamente el archivo final
```

```text
certificación anterior
≠ certificación automática del restatement
```

```text
cambio de baseline
≠ cambio real del negocio
```

```text
cambio de diagnóstico
≠ eliminación del diagnóstico anterior
```

#### 6. Ejes de versión obligatorios

D017 reconoce ejes de versión distintos. Ninguno sustituye a los demás.

| Eje                                          | Qué identifica                                                   | Cuándo cambia                                                                          | Qué no autoriza                                                                      |
| -------------------------------------------- | ---------------------------------------------------------------- | -------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------ |
| identidad empresarial                        | `metric_key`, maestro, hecho o artefacto lógico                  | solo cuando cambia la identidad del objeto, conforme a su contrato propietario         | reutilizar una identidad para otro significado                                       |
| versión semántica                            | significado de una métrica o definición analítica                | cuando cambia un elemento material que puede alterar resultado o interpretación        | reescribir resultados de versiones anteriores                                        |
| versión de esquema/contrato                  | forma en que una fuente entrega datos                            | cuando cambia el contrato físico o lógico de entrada                                   | asumir equivalencia semántica por nombre parecido                                    |
| versión de transformación                    | reglas, mappings, joins, derivaciones o cálculo técnico          | cuando cambia una regla capaz de modificar el derivado                                 | cambiar la definición empresarial sin versión semántica cuando el significado cambia |
| versión de maestros/dimensiones              | identidad, relación o vigencia efectiva aplicable al hecho       | cuando cambia la historia efectiva o la relación gobernada                             | aplicar el maestro actual a hechos pasados por conveniencia                          |
| versión técnica                              | código, consulta, modelo, vista, servicio o artefacto ejecutable | cuando cambia la implementación                                                        | crear por sí sola una nueva métrica                                                  |
| edición de publicación                       | instancia oficial emitida para periodo, corte y contexto         | cada emisión oficial distinguible                                                      | sustituir o borrar una edición anterior                                              |
| versión de diagnóstico/objetivo/intervención | estado documental de una conclusión o decisión empresarial       | cuando cambia evidencia, hipótesis, meta, diseño o conclusión conforme a sus contratos | fingir que la decisión histórica se tomó con evidencia posterior                     |

La representación física de estos ejes pertenece a las tareas `DATA-INT-*` y de implementación aplicables. D017 no prescribe una tabla, enum, schema ni formato de identificador físico.

#### 7. Identidad y coordenada mínima de una versión analítica

Toda versión de resultado que deba reproducirse deberá poder resolver, cuando aplique:

- identidad de métrica o resultado;
- versión semántica;
- fecha de inicio de vigencia;
- fecha de fin de vigencia cuando exista;
- relación con versión precedente y sucesora;
- motivo de creación;
- propietario empresarial;
- steward;
- custodio técnico;
- fórmula y componentes versionados;
- versión de contratos de fuente;
- versión de transformación;
- versión técnica o referencia reproducible del cálculo;
- población;
- granularidad;
- dimensiones y vigencias;
- filtros e inclusiones/exclusiones;
- unidad, moneda y precisión;
- calendario y zona horaria;
- periodo observado;
- fecha y hora de corte;
- tratamiento de datos tardíos;
- tratamiento de anulaciones, reversas, devoluciones y correcciones;
- fuentes y dependencias;
- cobertura;
- calidad/certificación;
- consulta, modelo o regla utilizada cuando aplique;
- evidencia de ejecución;
- publicación o decisión que consumió el resultado.

Una versión no se considera reproducible solo porque exista un número almacenado.

#### 8. Regla de versionado semántico de métricas

Se preserva la decisión de D004: `metric_key` identifica la medida y la versión identifica una definición inmutable de esa medida.

Una nueva versión semántica es obligatoria cuando cambia de forma material cualquiera de estos elementos:

1. fórmula;
2. numerador;
3. denominador;
4. inclusiones;
5. exclusiones;
6. granularidad de cálculo;
7. dimensiones cuando alteran agregabilidad o interpretación;
8. calendario;
9. fecha empresarial;
10. zona horaria;
11. unidad;
12. moneda;
13. precisión semántica o redondeo que cambia el resultado empresarial;
14. tratamiento de anulaciones;
15. tratamiento de devoluciones;
16. tratamiento de reversas;
17. tratamiento de correcciones;
18. tratamiento de datos tardíos;
19. fuente lógica cuando modifica significado o cobertura;
20. regla de comparación;
21. interpretación de cero, ausencia, no aplica, desconocido, no recibido o denominador no disponible;
22. cualquier regla que cambie qué hechos o entidades representan el resultado.

No exige una nueva versión semántica cuando, preservando exactamente significado y resultado para la misma coordenada, solo cambia:

- optimización de consulta;
- índice;
- caché;
- ubicación del cálculo entre vista, función, servicio o modelo;
- refactorización interna;
- lenguaje de implementación;
- formato visual;
- orden de columnas;
- texto de ayuda sin cambio semántico;
- observabilidad técnica;
- mecanismo de despliegue.

Si una corrección técnica revela que la implementación anterior no cumplía la definición semántica vigente, se corrige la implementación sin inventar una versión semántica nueva. Los resultados oficiales históricamente afectados deberán evaluarse para reconstrucción y posible restatement.

#### 9. Registro inicial: 14 métricas reales y decisión de versión

Las 14 claves aprobadas en D004 conservan exactamente su identidad y versión semántica inicial `1`.

|    # | `metric_key`        | Versión semántica aprobada | Estado DQ heredado | Decisión D017                                                                                              |
| ---: | ------------------- | -------------------------- | ------------------ | ---------------------------------------------------------------------------------------------------------- |
|    1 | `scheduledShifts`   | `1`                        | `NO EVALUADO`      | preservar v1; todo cambio material de significado crea versión posterior                                   |
|    2 | `attendedShifts`    | `1`                        | `NO EVALUADO`      | preservar v1; todo cambio material de significado crea versión posterior                                   |
|    3 | `restDayCount`      | `1`                        | `NO EVALUADO`      | preservar v1; todo cambio material de significado crea versión posterior                                   |
|    4 | `lateCount`         | `1`                        | `NO EVALUADO`      | preservar v1; todo cambio material de significado crea versión posterior                                   |
|    5 | `noShowCount`       | `1`                        | `NO EVALUADO`      | preservar v1; todo cambio material de significado crea versión posterior                                   |
|    6 | `openCount`         | `1`                        | `NO EVALUADO`      | preservar v1; todo cambio material de significado crea versión posterior                                   |
|    7 | `missingCloseCount` | `1`                        | `BLOQUEADO`        | preservar v1 canónica; corregir implementación futura no crea versión semántica si solo la alinea con v1   |
|    8 | `autoCloseCount`    | `1`                        | `NO EVALUADO`      | preservar v1; todo cambio material de significado crea versión posterior                                   |
|    9 | `departureCount`    | `1`                        | `NO EVALUADO`      | preservar v1; todo cambio material de significado crea versión posterior                                   |
|   10 | `scheduledMinutes`  | `1`                        | `NO EVALUADO`      | preservar v1; todo cambio material de significado crea versión posterior                                   |
|   11 | `netMinutes`        | `1`                        | `NO EVALUADO`      | preservar v1; todo cambio material de significado crea versión posterior                                   |
|   12 | `incidentCount`     | `1`                        | `NO EVALUADO`      | preservar v1; todo cambio material de significado crea versión posterior                                   |
|   13 | `attendanceRate`    | `1`                        | `BLOQUEADO`        | preservar v1 canónica; corregir denominador cero para cumplir v1 es corrección técnica, no nueva semántica |
|   14 | `punctualityRate`   | `1`                        | `BLOQUEADO`        | preservar v1 canónica; corregir denominador cero para cumplir v1 es corrección técnica, no nueva semántica |

**Reconciliación:** 14 métricas esperadas; 14 materializadas; 14 claves únicas; 0 faltantes; 0 duplicadas; 11 `NO EVALUADO`; 3 `BLOQUEADO`.

D017 no desbloquea, certifica ni recalcula ninguna de estas métricas.

#### 10. Corrección técnica frente a nueva versión semántica

La decisión se toma por significado, no por tamaño del diff de código.

| Situación                                                           | Tratamiento semántico                                              | Tratamiento histórico                                                           |
| ------------------------------------------------------------------- | ------------------------------------------------------------------ | ------------------------------------------------------------------------------- |
| optimización produce exactamente el mismo resultado                 | misma versión semántica                                            | no restatement por la optimización                                              |
| corrección de bug alinea código con la definición v1 ya aprobada    | misma versión semántica; nueva versión técnica                     | evaluar resultados oficiales previos afectados y restatement cuando corresponda |
| cambio deliberado de fórmula                                        | nueva versión semántica                                            | v1 permanece histórica; v2 rige desde su vigencia                               |
| cambio de población elegible                                        | nueva versión semántica                                            | no combinar series sin compatibilidad explícita                                 |
| cambio de zona horaria o calendario que altera asignación a periodo | nueva versión semántica o versión de regla temporal según contrato | evaluar comparabilidad y publicaciones afectadas                                |
| cambio visual, etiqueta o orden sin cambio de significado           | misma versión semántica                                            | no restatement del resultado                                                    |
| cambio de fuente física con equivalencia demostrada                 | misma versión semántica; nuevas versiones de contrato/técnicas     | reconciliar antes de declarar continuidad                                       |
| cambio de fuente que altera cobertura o significado                 | nueva versión semántica cuando afecta la medida                    | preservar resultados anteriores bajo su versión                                 |

Un cambio técnico no puede usarse para introducir de hecho una nueva semántica sin versionarla.

#### 11. Vigencia y convivencia de versiones

Una nueva versión semántica no elimina la anterior.

Reglas:

1. cada versión conserva su vigencia y motivo;
2. una versión histórica continúa resolviendo resultados, publicaciones y decisiones que la usaron;
3. la versión vigente para nuevos cálculos no se aplica retroactivamente por defecto;
4. una comparación entre versiones exige una regla explícita de compatibilidad o una reconstrucción declarada;
5. una versión deprecada puede seguir siendo necesaria para reproducir historia;
6. retirar una versión para nuevos usos no autoriza borrar su definición ni evidencia;
7. una aplicación consumidora deberá poder identificar qué versión utiliza antes de presentar un resultado oficial;
8. una transición técnica puede soportar varias versiones durante convivencia sin fusionar sus resultados;
9. el uso histórico resuelve la versión realmente aplicada al corte, no la versión actualmente vigente.

D017 no crea un enum técnico de ciclo de vida; fija las obligaciones documentales de vigencia, sucesión y preservación.

#### 12. Compatibilidad entre versiones y series históricas

Dos resultados de la misma `metric_key` solo son directamente comparables cuando:

- usan la misma versión semántica; o
- existe una regla de compatibilidad aprobada que demuestra que la diferencia de versión no altera la comparación solicitada.

Cuando no exista compatibilidad directa:

- se presentan series separadas; o
- se genera una reconstrucción histórica explícita bajo una versión seleccionada, conservando la serie original.

Queda prohibido unir en una misma serie sin señalización valores calculados con definiciones materialmente distintas.

Una reconstrucción histórica bajo una versión nueva no convierte esa versión en la definición que estuvo vigente en el pasado. Debe poder distinguirse:

```text
SERIE COMO FUE PUBLICADA

SERIE RECONSTRUIDA BAJO DEFINICIÓN POSTERIOR
```

#### 13. Versionado de maestros, dimensiones y relaciones históricas

Los hechos históricos consumen la identidad y vigencia que correspondían a su tiempo.

Reglas:

1. un cambio de nombre no cambia identidad;
2. un reparenting no aplica el padre actual a hechos anteriores si la relación histórica era otra;
3. una fusión no borra identificadores previos ni reasigna hechos por aproximación;
4. una separación no redistribuye historia sin evidencia y contrato explícito;
5. retirar una identidad no rompe referencias históricas;
6. una corrección de vigencia o jerarquía histórica puede afectar agregados y deberá recorrer la evaluación de impacto de D017;
7. los crosswalks externos deberán resolver la versión y vigencia aplicables conforme a `DATA-INT-003` antes de reconstruir historia;
8. una dimensión actual no se utiliza como sustituto de la dimensión efectiva al hecho.

#### 14. Taxonomía canónica de operaciones históricas

D017 conserva exactamente las fronteras establecidas por D006.

##### 14.1. Reintento

Repite una solicitud cuyo resultado no quedó confirmado. Conserva identidad idempotente cuando el contrato lo permita y no pretende cambiar historia.

##### 14.2. Replay

Vuelve a procesar evidencia ya recibida bajo versiones declaradas. Puede comprobar determinismo o reconstruir un derivado, pero no crea hechos inexistentes.

##### 14.3. Backfill

Carga o reconstruye un periodo histórico faltante o incompleto desde una fuente aprobada y con cobertura declarada. El backfill no implica automáticamente restatement; primero se evalúa qué publicaciones o decisiones quedaron afectadas.

##### 14.4. Corrección de fuente

La fuente propietaria reconoce y corrige un dato o relación incorrectos preservando procedencia, original, decisión y tiempo de corrección conforme a su dominio.

##### 14.5. Reconstrucción

Recalcula una proyección, modelo, métrica o snapshot desde fuentes gobernadas y versiones declaradas. No modifica por sí misma la publicación anterior.

##### 14.6. Restatement

Reexpresa formalmente un resultado o publicación previa porque la representación oficial debe reflejar evidencia o definición corregida. El restatement crea una edición relacionada y trazable; nunca sobrescribe la edición anterior.

Estas seis operaciones no se colapsan en un estado genérico de “actualizado”.

#### 15. Disparadores de evaluación de impacto histórico

Todo cambio de los siguientes tipos obliga a evaluar impacto antes de alterar una representación oficial:

1. corrección de hecho fuente;
2. corrección de identidad, clave, crosswalk o relación;
3. corrección de jerarquía o vigencia dimensional;
4. dato tardío incorporado después de un corte publicado;
5. backfill de un periodo ya reportado;
6. cambio de mapping;
7. cambio de transformación;
8. corrección de bug de cálculo;
9. cambio de versión semántica;
10. cambio de población o cobertura;
11. cambio de moneda, unidad, calendario o zona horaria con efecto material;
12. cambio de estado de calidad que invalida o habilita un resultado publicado;
13. cambio de reconciliación que modifica una cifra o su aptitud para uso oficial;
14. nueva evidencia que cambia una conclusión diagnóstica oficial;
15. corrección que modifica una línea base o evaluación de objetivo;
16. corrección que modifica el resultado atribuido a una intervención.

Evaluar impacto no significa que todo caso produzca restatement. Significa que la decisión debe quedar explícita y trazable.

#### 16. Matriz de decisión de restatement

| Cambio observado                                                      | ¿Modifica resultado oficial ya emitido?             | Decisión D017                                                                                                                  |
| --------------------------------------------------------------------- | --------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| dato tardío dentro de periodo abierto y sin publicación inmutable     | no existe edición oficial previa afectada           | actualizar el resultado vivo con nuevo corte; no denominarlo restatement                                                       |
| dato tardío afecta snapshot o reporte oficial previo                  | sí o puede hacerlo                                  | reconstruir, recertificar y decidir restatement según impacto y obligación de reexpresión                                      |
| corrección de fuente no cambia ninguna métrica publicada              | no                                                  | registrar impacto nulo; no crear restatement numérico                                                                          |
| corrección de fuente cambia una cifra oficial                         | sí                                                  | reconstruir y emitir restatement cuando la cifra oficial deba corregirse                                                       |
| bug técnico produjo cifra distinta de la definición semántica vigente | sí                                                  | mantener versión semántica; cambiar versión técnica; evaluar restatement de cada edición afectada                              |
| nueva versión semántica prospectiva                                   | no cambia por sí sola lo ya publicado               | preservar historia v1 y aplicar v2 desde su vigencia                                                                           |
| decisión expresa de reconstruir historia bajo nueva versión semántica | sí, como serie reexpresada                          | publicar reconstrucción/restatement distinguible, sin borrar serie original                                                    |
| cambio de formato, orden, color o etiqueta sin cambio semántico       | no                                                  | no restatement del resultado                                                                                                   |
| corrección de metadata material de una publicación                    | puede afectar interpretación aunque no cambie cifra | emitir corrección o nueva edición gobernada cuando la interpretación oficial deba cambiar                                      |
| cambio de calidad/certificación sin cambio numérico                   | puede afectar aptitud de uso                        | conservar edición original y emitir la actualización gobernada que corresponda; no fingir que el estado anterior nunca existió |
| backfill afecta periodo nunca publicado                               | no                                                  | reconstrucción inicial; no restatement de una publicación inexistente                                                          |
| backfill afecta periodo previamente publicado                         | sí o puede hacerlo                                  | evaluar y reexpresar solo el alcance materialmente afectado                                                                    |

D017 no fija un umbral universal de materialidad. La decisión de reexpresión debe declarar el impacto, la obligación empresarial y el propietario competente.

#### 17. Evaluación de impacto antes de reexpresar

Toda evaluación deberá identificar como mínimo:

- cambio origen;
- fuente propietaria;
- evidencia de la corrección o nueva información;
- periodo afectado;
- momento en que la nueva evidencia quedó disponible;
- versión de esquema anterior y nueva cuando aplique;
- versión de transformación anterior y nueva;
- versiones semánticas involucradas;
- identidades o dimensiones afectadas;
- métricas potencialmente afectadas;
- publicaciones potencialmente afectadas;
- diagnósticos potencialmente afectados;
- objetivos, líneas base o metas potencialmente afectadas;
- intervenciones o experimentos potencialmente afectados;
- calidad y certificación previa;
- impacto numérico o semántico observado;
- posibilidad de reconstrucción;
- consumidores conocidos de la publicación;
- decisión de restatement o no restatement;
- justificación;
- propietario de la decisión;
- evidencia de revisión.

No se expande el restatement a periodos, sedes, entidades o métricas no afectadas solo por comodidad técnica.

#### 18. Propagación de impacto por linaje

La propagación se determina por linaje, no por similitud de nombres.

```text
HECHO / MAESTRO / RELACIÓN CORREGIDA
→ CONTRATOS Y TRANSFORMACIONES QUE LO CONSUMEN
→ MÉTRICAS AFECTADAS
→ ARTEFACTOS AFECTADOS
→ DIAGNÓSTICOS AFECTADOS
→ OBJETIVOS / BASELINES AFECTADOS
→ EVALUACIONES DE INTERVENCIÓN AFECTADAS
```

Reglas:

1. una métrica no relacionada no se recalcula por inferencia;
2. dos métricas que comparten un hecho pueden requerir evaluaciones distintas;
3. una publicación puede quedar afectada por una corrección de metadata aunque su cifra no cambie;
4. un diagnóstico puede cambiar confianza aunque el valor principal permanezca;
5. una meta aprobada no cambia porque el baseline haya sido reexpresado; se conserva la decisión original y se evalúa el impacto;
6. una intervención no se declara exitosa o fallida de nuevo sin reconstruir su diseño, población, exposición y guardrails bajo la evidencia pertinente;
7. el linaje debe conservar fuentes y versiones suficientes para justificar inclusión o exclusión del impacto.

#### 19. Contrato mínimo de un restatement

Toda reexpresión oficial deberá poder declarar:

- publicación o resultado original relacionado;
- clase del artefacto original;
- periodo y corte originales;
- fecha de publicación original;
- métricas y versiones originales;
- fuentes, esquemas y transformaciones originales;
- valor o resultado original;
- razón de reexpresión;
- evento, corrección, backfill, cambio semántico o evidencia que la originó;
- periodo y población reexpresados;
- fecha y hora del nuevo corte;
- métricas y versiones usadas en la reexpresión;
- fuentes y transformaciones usadas en la reexpresión;
- valor o resultado reexpresado;
- diferencia absoluta y relativa cuando ambas sean válidas;
- componentes no comparables cuando existan;
- calidad y certificación de la reexpresión;
- responsable empresarial;
- certificador cuando aplique;
- publicador cuando aplique;
- consumidores o artefactos derivados afectados;
- relación con diagnósticos, objetivos o intervenciones afectados;
- decisión de comunicación o redistribución conforme a las tareas de autorización y experiencia;
- evidencia que permite reproducir original y reexpresión.

D017 no define un namespace físico para identificar restatements. La identidad técnica se materializará en `DATA-INT-002` sin perder estas coordenadas.

#### 20. Inmutabilidad de publicaciones anteriores

Una edición oficial emitida permanece identificable.

Reglas:

1. no se edita una publicación histórica para sustituir el número anterior;
2. no se cambia su corte para hacer que parezca una edición original distinta;
3. no se reemplaza su versión semántica en metadata;
4. no se elimina la relación con fuentes y certificación existentes al momento de publicación;
5. una reexpresión se vincula con la edición anterior;
6. un consumidor autorizado puede distinguir cuál fue el valor publicado originalmente y cuál es el valor vigente reexpresado;
7. retirar una publicación de uso corriente por razones válidas no equivale a borrar su existencia histórica y auditada;
8. la política de acceso y retención aplicable continúa gobernando qué actores pueden consultar cada evidencia.

#### 21. Resultado conocido entonces y resultado conocido ahora

D017 exige conservar dos preguntas distintas:

```text
¿QUÉ RESULTADO ESTABA DISPONIBLE Y AUTORIZADO AL MOMENTO DE LA DECISIÓN?
```

```text
¿QUÉ RESULTADO SE OBTIENE AHORA CON LA EVIDENCIA CORREGIDA Y LAS VERSIONES DECLARADAS?
```

La primera pregunta es necesaria para auditar decisiones históricas. La segunda es necesaria para conocer la mejor representación actual.

Reglas:

- una evidencia posterior no se inserta retroactivamente en el expediente como si hubiera estado disponible entonces;
- una corrección puede cambiar la lectura actual sin convertir en falsa la existencia de la decisión histórica;
- una evaluación de desempeño debe indicar si usa datos “como publicados” o “reexpresados”;
- un análisis de aprendizaje puede comparar ambas vistas sin fusionarlas.

#### 22. Reproducibilidad mínima de un resultado

Un resultado es reproducible cuando un proceso autorizado puede reconstruirlo a partir de evidencia y versiones suficientes sin depender de conocimiento implícito.

Como mínimo deberán quedar resolubles:

1. identidad de la métrica o resultado;
2. versión semántica;
3. periodo;
4. corte;
5. zona horaria;
6. calendario;
7. población;
8. granularidad;
9. dimensiones;
10. filtros;
11. inclusiones y exclusiones;
12. unidad;
13. moneda;
14. precisión;
15. fuentes lógicas;
16. versiones de esquema o contrato;
17. archivos/payloads originales cuando su preservación sea necesaria;
18. claves/crosswalks aplicables;
19. vigencias de maestros y dimensiones;
20. versión de transformación;
21. consulta, regla, modelo o artefacto técnico reproducible;
22. versión técnica o hash cuando corresponda;
23. datos tardíos conocidos al corte;
24. backfills aplicados antes del corte;
25. correcciones conocidas al corte;
26. reglas de deduplicación;
27. registros rechazados o en cuarentena que afecten cobertura;
28. reconciliación;
29. estado de calidad;
30. decisión de certificación;
31. fecha/hora de ejecución;
32. evidencia de entrada y salida suficiente para comprobar la reconstrucción.

No todos estos elementos requieren una columna física; todos deben poder resolverse cuando sean materiales para el resultado.

#### 23. Regla determinista de reconstrucción

Cuando la semántica y las fuentes sean deterministas:

```text
MISMAS ENTRADAS EVIDENCIADAS
+ MISMAS VERSIONES
+ MISMO CONTEXTO
+ MISMO CORTE
+ MISMAS REGLAS
=
MISMO RESULTADO
```

Si un resultado depende de una fuente externa mutable, un modelo no determinista, una API sin preservación de respuesta, una configuración no versionada o un artefacto no recuperable, esa limitación deberá quedar explícita y puede impedir declarar reproducibilidad completa.

No se inventa el insumo faltante para forzar una reconstrucción.

#### 24. Reproducibilidad de fuentes externas y archivos

Cuando un resultado dependa de una fuente externa o exportación controlada:

- se conserva procedencia;
- se conserva versión/formato;
- se conserva periodo y corte de extracción;
- se conserva el original cuando la trazabilidad lo requiera;
- se conserva hash o evidencia equivalente cuando corresponda;
- se conserva mapping y crosswalk aplicables;
- se conserva qué campos fueron rechazados o transformados;
- se conserva la evidencia de cobertura conocida;
- no se reemplaza el archivo histórico por una exportación nueva con el mismo nombre.

Si la fuente externa no permite reconstruir la evidencia histórica, el resultado deberá declarar la limitación en lugar de presentarse como completamente reproducible.

#### 25. Calidad y recertificación después de una corrección

Una corrección o reconstrucción no hereda automáticamente el estado D007 de la edición anterior.

Cadena obligatoria cuando la reexpresión pretenda uso oficial:

```text
CORRECCIÓN / NUEVA EVIDENCIA
→ RECONSTRUCCIÓN
→ NUEVA EVALUACIÓN DE CALIDAD
→ NUEVA RECONCILIACIÓN CUANDO APLIQUE
→ NUEVA DECISIÓN DE CERTIFICACIÓN
→ PUBLICACIÓN O RESTATEMENT AUTORIZADO
```

Reglas:

1. una fuente previamente `CERTIFICADO` puede quedar `DEGRADADO` o `BLOQUEADO` para el nuevo corte;
2. una fuente previamente `BLOQUEADO` no se vuelve certificada por haber sido reconstruida;
3. la certificación se acota al uso, periodo, versión, corte y dependencias de la reexpresión;
4. un restatement no oficial o exploratorio debe conservar ese carácter;
5. la comparación original/restated muestra la calidad aplicable a cada lado.

#### 26. Datos tardíos, periodos abiertos y periodos publicados

D017 preserva el tiempo original del hecho.

| Situación                                                              | Tratamiento                                                                                           |
| ---------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| dato tardío llega a periodo todavía abierto y sin snapshot oficial     | incorporar conforme al contrato de origen y producir un nuevo corte del resultado vivo                |
| dato tardío llega después de snapshot oficial                          | conservar snapshot; reconstruir y evaluar restatement                                                 |
| dato tardío llega después de cierre de dominio que requiere reapertura | no reabrir desde D017; consumir la decisión del dominio propietario y luego evaluar impacto analítico |
| timestamp de ocurrencia no es confiable                                | no inventarlo; aplicar calidad D007 y mantener el resultado afectado según su estado                  |
| dato tardío no afecta ninguna métrica/publicación                      | registrar impacto nulo cuando la evaluación lo requiera; no generar reexpresión ficticia              |

La fecha de recepción tardía no sustituye la fecha del hecho para “hacer caber” el dato en un periodo conveniente.

#### 27. Backfills y reconstrucción histórica

Un backfill no es equivalente a restatement.

Antes de usar un backfill para reconstruir historia deberá estar declarada, conforme a D006:

- fuente;
- periodo;
- motivo;
- cobertura;
- formato/esquema;
- mappings;
- crosswalks;
- deduplicación;
- faltantes;
- transformación;
- conciliación;
- consumidores potencialmente afectados;
- relación con publicaciones previas.

Después del backfill:

1. se reconstruyen únicamente los derivados afectados;
2. se compara original con reconstruido cuando exista original;
3. se evalúa calidad;
4. se decide si corresponde restatement;
5. se conserva que el dato no estaba disponible al corte original;
6. no se presenta el backfill como evidencia de que el histórico original estaba completo.

#### 28. Correcciones de fuente

La analítica no corrige el hecho operativo para hacer cuadrar un reporte.

Reglas:

1. la corrección nace en la fuente propietaria o mediante el contrato autorizado de ese dominio;
2. original, corrección, actor/proceso, momento y motivo permanecen trazables;
3. D017 consume la corrección para evaluar derivados;
4. una corrección de fuente puede tener impacto cero, parcial o múltiple sobre métricas;
5. una corrección no se propaga por coincidencia de valor o nombre;
6. una fuente corregida no autoriza reescribir un snapshot histórico;
7. si la corrección afecta una publicación oficial, se aplica el proceso de restatement.

#### 29. Correcciones de transformación y mappings

Cuando un mapping, parser, conversión, join o transformación se demuestre incorrecto:

- se conserva la versión defectuosa utilizada históricamente;
- se crea una versión técnica/transformacional corregida;
- se identifica el primer y último periodo potencialmente afectados;
- se reconstruye una muestra o población autorizada suficiente para medir impacto antes de una reexpresión masiva;
- se verifica que la corrección no cambie significado sin versionado semántico;
- se conservan diferencias de entrada/salida y reconciliación;
- las publicaciones afectadas se evalúan individualmente o por conjunto demostrablemente homogéneo;
- los periodos no afectados no se reexpresan por comodidad.

#### 30. Cambio de definición semántica

Una nueva definición de métrica se aplica prospectivamente desde su vigencia salvo que exista una decisión explícita de reconstrucción histórica.

Reglas:

1. la versión anterior conserva su historia;
2. la nueva versión no se etiqueta como si hubiera estado vigente antes;
3. una serie bajo v2 puede reconstruir periodos previos solo como serie reexpresada;
4. la serie v1 “como publicada” continúa disponible conforme a autorización y retención;
5. una comparación v1/v2 declara la diferencia de definición;
6. una mejora aparente producida exclusivamente por cambiar definición no se presenta como mejora del negocio;
7. diagnósticos, metas y evaluaciones que dependían de v1 conservan esa referencia histórica.

#### 31. Versionado y las seis familias de artefacto D008

|    # | Familia de artefacto | Tratamiento histórico D017                                                                                                | Regla de reexpresión                                                                                                                    |
| ---: | -------------------- | ------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
|    1 | tablero              | la vista viva puede avanzar con nuevos cortes, pero cada snapshot o valor histórico referenciado conserva versión y corte | no se llama restatement al simple avance del estado vivo; sí se relaciona una corrección de una publicación fija                        |
|    2 | reporte              | cada edición oficial conserva periodo, corte, versiones y fecha de publicación                                            | una corrección oficial genera edición relacionada; no sustituye el archivo o edición previa                                             |
|    3 | exportación          | cada generación conserva contexto, corte y alcance de autorización del momento                                            | una exportación corregida es una nueva generación vinculada; la entregada anteriormente no se altera retroactivamente                   |
|    4 | suscripción          | cada entrega conserva el corte y versión usados en esa ejecución                                                          | futuras entregas usan la versión vigente que corresponda; una corrección histórica se redistribuye solo conforme al contrato autorizado |
|    5 | alerta               | la ocurrencia original conserva regla, versión, datos y tiempo de evaluación                                              | una corrección puede producir una nueva señal o anotación; no se borra la alerta original para fingir que no ocurrió                    |
|    6 | snapshot oficial     | publicación inmutable por corte, contexto y versiones                                                                     | todo cambio material produce reconstrucción/restatement distinguible                                                                    |

**Reconciliación:** 6 familias esperadas; 6 decisiones materializadas; 0 faltantes; 0 duplicadas.

#### 32. Diagnósticos y conclusiones D014

Una conclusión diagnóstica oficial conserva la evidencia disponible cuando fue emitida.

Si evidencia nueva o corregida cambia una conclusión:

- la conclusión anterior permanece identificable;
- se conserva su nivel D014 y evidencia originales;
- se reconstruye la afirmación bajo la nueva evidencia;
- se registra qué evidencia cambió;
- se registra si cambia señal, factor, alternativas, impacto o confianza;
- se publica una corrección/restatement de la conclusión cuando corresponda;
- no se inserta evidencia posterior en la versión anterior como si hubiese estado disponible;
- una reducción de confianza se conserva con el mismo rigor que un aumento.

Un restatement analítico no convierte por sí mismo una asociación en causalidad.

#### 33. Objetivos, líneas base y metas D015

Cuando una corrección afecta un objetivo:

```text
BASELINE ORIGINAL USADO PARA DECIDIR
≠
BASELINE RECONSTRUIDO CON EVIDENCIA POSTERIOR
```

Reglas:

1. el baseline original permanece vinculado al objetivo aprobado;
2. el baseline reexpresado puede cambiar la interpretación actual;
3. la meta original no se reescribe automáticamente por cambiar el baseline;
4. si el propietario decide cambiar la meta, esa es una nueva decisión con vigencia propia;
5. una comparación de cumplimiento debe declarar si usa baseline original o reexpresado;
6. drivers y guardrails afectados deben reconstruirse bajo sus versiones pertinentes;
7. un cambio de definición del KPI no se interpreta como cambio de desempeño sin reconciliación;
8. si la corrección invalida comparabilidad, la evaluación queda `PENDIENTE_DE_EVIDENCIA` o `BLOQUEADO` según corresponda hasta resolverla.

#### 34. Acciones, experimentos y resultados D016

D017 conserva la evidencia de una intervención tal como existía durante su diseño y evaluación.

Si una corrección posterior afecta el resultado:

- se conserva versión del objetivo;
- se conserva acción/intervención definida;
- se conserva diseño de evaluación;
- se conserva población elegible y exposición observada originales;
- se conserva baseline y meta usados;
- se conservan guardrails;
- se conserva resultado originalmente evaluado;
- se conserva nivel de confianza D014 alcanzado;
- se reconstruyen únicamente elementos afectados;
- se determina si la conclusión de efecto cambia;
- se registra el aprendizaje revisado;
- la decisión histórica de adoptar, iterar, pausar, revertir o cerrar no se reescribe como si se hubiera tomado con la nueva evidencia.

Una reexpresión del resultado experimental puede modificar la confianza actual. No modifica retroactivamente qué evidencia estaba disponible en la decisión original.

#### 35. Métricas de asistencia bloqueadas y restatement futuro

Las tres divergencias actuales permanecen:

- `missingCloseCount`;
- `attendanceRate` cuando `scheduledShifts = 0`;
- `punctualityRate` cuando `attendedShifts = 0`.

D017 decide cómo deberá tratarse la historia si la implementación futura se alinea con la semántica v1:

1. la versión semántica sigue siendo `1` si el significado canónico no cambia;
2. la corrección técnica recibe su propia versión técnica/transformacional;
3. se identifica el periodo en que la implementación divergente produjo resultados;
4. se reconstruyen únicamente los cortes afectados;
5. se comparan resultados originales y corregidos;
6. se reevalúa calidad y certificación;
7. toda publicación oficial afectada se somete a decisión de restatement;
8. una publicación provisional o no oficial conserva su condición histórica y no se promociona retroactivamente a certificada;
9. la tarea técnica propietaria deberá implementar y verificar la corrección antes de cualquier certificación.

D017 no ejecuta esa corrección.

#### 36. Universo analítico heredado: 55 familias y decisión de versionado

Las familias aprobadas de D009 a D013 son categorías semánticas de análisis, no `metric_key`. D017 debe preservar sus identidades sin inventar una versión de métrica donde todavía no existe una métrica concreta registrada.

##### 36.1. Comercial — 11 familias

|    # | Familia canónica                             | Decisión de versionado                                                                                                    |
| ---: | -------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
|    1 | ventas netas y brutas                        | versionar cada métrica concreta materializada; no versionar el nombre de familia como métrica                             |
|    2 | pedidos y conversión                         | versionar cada métrica concreta materializada; numerador/denominador y población son parte de la versión                  |
|    3 | ticket y unidades                            | versionar cada métrica concreta materializada; unidad y denominador forman parte de la semántica                          |
|    4 | mezcla por producto, categoría, canal y sede | versionar la métrica y sus reglas de participación; cambios de jerarquía usan vigencia histórica                          |
|    5 | demanda por franja, día y temporada          | versionar métricas y calendarios; estacionalidad no se reescribe con calendario posterior                                 |
|    6 | disponibilidad perdida                       | no asignar versión ficticia mientras sus componentes permanezcan bloqueados; cada futura métrica concreta nace versionada |
|    7 | cancelaciones, devoluciones y descuentos     | cada fenómeno conserva métricas y versiones separadas                                                                     |
|    8 | promociones y efecto incremental             | versión de exposición, intervención y método causal permanece trazable                                                    |
|    9 | recurrencia y frecuencia                     | identidad, población y ventana forman parte de la versión aplicable                                                       |
|   10 | margen relacionado                           | consume versiones económico-financieras D013; no recalcula historia con costo actual                                      |
|   11 | capacidad comercial no utilizada             | denominador de capacidad y unidad forman parte de la definición versionada                                                |

##### 36.2. Inventario, abastecimiento, proveedores y logística — 12 familias

|    # | Familia canónica                        | Decisión de versionado                                                                 |
| ---: | --------------------------------------- | -------------------------------------------------------------------------------------- |
|    1 | existencia disponible y comprometida    | versionar reglas de disponibilidad; cada snapshot conserva corte y estados elegibles   |
|    2 | cobertura y días de inventario          | versionar existencia elegible, demanda/consumo y horizonte                             |
|    3 | rotación y permanencia                  | versionar población, inventario medio y ventana histórica                              |
|    4 | faltantes y quiebres                    | versionar definición de necesidad, disponibilidad y evento de quiebre                  |
|    5 | vencimiento, daño y pérdida             | conservar versiones de clasificación y causa; no reclasificar historia silenciosamente |
|    6 | diferencias de conteo                   | preservar corte, signo, antes/después de ajuste y regla de comparación                 |
|    7 | cumplimiento de remisiones              | versionar hitos, población y definición de cumplimiento                                |
|    8 | lead time y cumplimiento de proveedores | versionar eventos de inicio/recepción, promesa y población elegible                    |
|    9 | compras urgentes                        | versionar clasificación de urgencia y estados elegibles                                |
|   10 | consumo versus plan                     | versionar plan, población, unidad y ventana comparada                                  |
|   11 | costo de inventario                     | consumir método económico versionado; no usar costo actual para reescribir historia    |
|   12 | capacidad de almacenamiento             | versionar capacidad utilizable, unidad y vigencia física                               |

##### 36.3. Producción, rendimiento, capacidad, merma y calidad — 10 familias

|    # | Familia canónica                            | Decisión de versionado                                                                  |
| ---: | ------------------------------------------- | --------------------------------------------------------------------------------------- |
|    1 | demanda planificada versus producción       | versionar necesidad/plan y producción comparada                                         |
|    2 | capacidad disponible y utilizada            | versionar denominador de capacidad, unidad y ventana                                    |
|    3 | adherencia al programa                      | versionar programa publicado, hitos y población                                         |
|    4 | rendimiento teórico y real                  | versión de receta, escala, unidad y regla teórica forman parte del resultado            |
|    5 | consumo estándar y real                     | estándar, receta/versión y unidad quedan vinculados al corte histórico                  |
|    6 | merma, reproceso y aprovechamiento          | categorías y denominadores se versionan; no reclasificar hechos pasados sin restatement |
|    7 | calidad, retención y rechazo                | controles, criterios, liberación y estados elegibles conservan versión/vigencia         |
|    8 | tiempo de ciclo                             | versión de hitos y tratamiento de pausas/esperas forma parte de la definición           |
|    9 | cumplimiento de liberación                  | versionar criterio de liberación y población elegible                                   |
|   10 | costo y variación por lote, producto y sede | consumir costo económico versionado y preservar costo técnico original                  |

##### 36.4. Servicio, clientes, fidelización, reputación y experiencia — 12 familias

|    # | Familia canónica                                        | Decisión de versionado                                                          |
| ---: | ------------------------------------------------------- | ------------------------------------------------------------------------------- |
|    1 | cumplimiento de promesa                                 | versionar promesa aceptada, política y evento de cumplimiento                   |
|    2 | tiempos de preparación, despacho y entrega              | versionar hitos reales y reglas de fase                                         |
|    3 | pedidos completos                                       | versionar líneas elegibles, sustituciones y criterio de completitud             |
|    4 | reclamos y tiempo de resolución                         | versionar expediente, SLA y eventos terminales aplicables                       |
|    5 | compensaciones                                          | conservar clasificación, decisión y valor bajo su versión de política           |
|    6 | satisfacción y feedback                                 | escala, población, invitación y clasificación temática deben quedar versionadas |
|    7 | recurrencia, frecuencia y abandono                      | versionar identidad autorizada, cohorte y ventana de observación                |
|    8 | adquisición y activación                                | versionar evento de adquisición, origen, evento de activación y ventana         |
|    9 | fidelización, puntos y redenciones                      | ledger y reglas de programa conservan versión; saldo no reemplaza historia      |
|   10 | reputación y temas recurrentes                          | fuentes, taxonomía y método de clasificación conservan versión                  |
|   11 | reservas, no-show y utilización                         | versionar estados, capacidad y ventana de servicio                              |
|   12 | valor y rentabilidad del cliente cuando esté autorizado | consumir versiones D013 y preservar finalidad/identidad autorizada aplicable    |

##### 36.5. Costos, rentabilidad, liquidez, presupuesto y escenarios — 10 familias

|    # | Familia canónica              | Decisión de versionado                                                                  |
| ---: | ----------------------------- | --------------------------------------------------------------------------------------- |
|    1 | costos estándar y reales      | métodos, componentes, moneda y vigencia deben quedar versionados                        |
|    2 | variaciones                   | cada variación conserva base y versión de ambos lados de la comparación                 |
|    3 | margen y contribución         | ingreso, costo/costo variable y política aplicable se resuelven históricamente          |
|    4 | gastos                        | estados, reconocimiento, clasificación y moneda conservan versión/vigencia              |
|    5 | centros de costo              | identidad y jerarquía efectiva al hecho se preservan; reparenting no reescribe historia |
|    6 | presupuesto y forecast        | cada versión aprobada conserva corte, supuestos, horizonte y estado                     |
|    7 | caja, bancos y tesorería      | saldos y conciliaciones se reproducen al corte con fuentes y moneda aplicables          |
|    8 | cartera y obligaciones        | aging y saldo abierto conservan corte, vencimiento y aplicaciones conocidas entonces    |
|    9 | rentabilidad multidimensional | asignaciones, drivers y residuos conservan método y versión                             |
|   10 | escenarios y simulaciones     | cada escenario conserva supuestos y versión; nunca sustituye el real histórico          |

**Reconciliación:** `11 + 12 + 10 + 12 + 10 = 55` familias. **55 esperadas; 55 decisiones materializadas; 0 faltantes; 0 duplicadas.**

Regla global: una familia no recibe por esta tarea un `metric_key`, valor, fórmula o versión numérica nueva. El versionado se materializa en cada métrica concreta registrada conforme a D004.

#### 37. Cambios de calidad sin cambio numérico

La historia analítica incluye la aptitud de uso, no solo el valor.

Si un resultado publicado mantiene el mismo número pero cambia su estado de calidad o certificación:

- la condición anterior permanece identificable;
- la nueva evaluación conserva evidencia y corte propios;
- si el cambio altera la interpretación oficial, se emite una actualización gobernada y relacionada;
- no se cambia la metadata del artefacto original para fingir que siempre tuvo el nuevo estado;
- un cambio de calidad no se presenta como cambio de desempeño empresarial.

#### 38. Cambios de cobertura y fuentes

Una nueva sede, canal, proveedor, fuente o periodo de datos puede cambiar la cobertura sin cambiar fórmula.

Reglas:

1. la cobertura forma parte del contexto reproducible;
2. agregar una fuente no hace comparables automáticamente periodos anteriores;
3. una serie puede mantener la misma versión semántica y aun requerir señalización de cobertura distinta;
4. si la nueva cobertura cambia el significado práctico de la medida, se evalúa si corresponde nueva versión semántica;
5. una reconstrucción de periodos anteriores con la nueva fuente se presenta como reconstrucción, no como dato que siempre estuvo disponible;
6. la fuente retirada continúa identificable para historia mientras existan resultados que dependan de ella.

#### 39. Cambios de moneda, unidad y precisión

D017 conserva monto/unidad original y representación derivada.

Reglas:

- una conversión monetaria conserva moneda origen, moneda destino, tasa, fuente de tasa, vigencia y redondeo;
- cambiar la fuente o método de tasa puede requerir nueva versión de transformación y, si altera la semántica aprobada, nueva versión semántica;
- una unidad convertida no sobrescribe la cantidad original;
- un cambio de redondeo visual sin efecto empresarial no obliga nueva versión semántica;
- un cambio de precisión que altera clasificación, umbral, conciliación o decisión sí es material;
- monedas incompatibles no se comparan ocultando la conversión usada.

#### 40. Publicaciones distribuidas y consumidores

Cuando una publicación oficial haya sido entregada, exportada o distribuida y luego sea reexpresada:

- la edición original continúa identificable;
- la nueva edición declara relación con la anterior;
- la decisión sobre redistribución consume autorización y experiencia aplicables;
- la lista o evidencia de consumidores conocidos no se usa para ampliar permisos;
- una suscripción futura no sustituye retroactivamente entregas previas;
- un consumidor que conserve una exportación antigua debe poder reconocer su periodo, corte y versión;
- la publicación más reciente no se presenta como si hubiera sido la única publicación histórica.

#### 41. Restatement parcial y alcance mínimo

Una reexpresión debe ser tan amplia como el impacto demostrado y no más.

Ejemplos:

- una corrección de una sede no obliga a recalcular sedes no relacionadas si el agregado no las consume;
- una corrección de un producto puede afectar un total de categoría y empresa si el linaje demuestra agregación;
- una corrección de una dimensión puede afectar varias métricas aunque el hecho fuente no cambie;
- una corrección de una fórmula puede afectar todas las poblaciones que usaron esa versión técnica durante su vigencia;
- un cambio de metadata sin impacto de cifra no autoriza recalcular todas las métricas.

La evaluación debe explicar por qué cada alcance está incluido o excluido.

#### 42. Fallos de reproducibilidad

Una reconstrucción puede quedar `PENDIENTE_DE_EVIDENCIA` o `BLOQUEADO` cuando falte un insumo material.

Ejemplos de bloqueo:

- fuente histórica no disponible;
- payload o archivo original requerido pero no preservado;
- versión de esquema desconocida;
- versión de transformación irrecuperable;
- crosswalk histórico no disponible;
- dimensión efectiva indeterminable;
- configuración técnica no versionada que afecta resultado;
- modelo externo no recuperable;
- población original no reconstruible;
- corte original desconocido;
- fuente crítica `BLOQUEADO` conforme a D007.

D017 prohíbe completar estos huecos con valores aproximados y presentar la salida como reproducción exacta.

#### 43. Auditoría de versión, corrección y restatement

Toda operación material deberá conservar, cuando aplique:

- actor o proceso que propone el cambio;
- propietario que lo aprueba;
- fecha/hora;
- razón;
- objeto afectado;
- versión anterior;
- versión nueva;
- evidencia de cambio;
- alcance temporal;
- alcance territorial/organizacional;
- resultado de impacto;
- artefactos afectados;
- decisión de reconstrucción;
- decisión de restatement;
- nueva evaluación de calidad;
- certificación aplicable;
- publicación o redistribución;
- excepciones;
- relación con diagnósticos, objetivos e intervenciones;
- evidencia de cierre.

La materialización de permisos y auditoría pertenece a `DATA-AUTH-003`, `DATA-AUTH-004` y las tareas técnicas aplicables.

#### 44. Segregación de responsabilidades

| Responsabilidad                | Autoridad lógica                                | Regla                                                   |
| ------------------------------ | ----------------------------------------------- | ------------------------------------------------------- |
| corregir hecho o maestro       | dominio propietario                             | BLOQUE AB no modifica el origen para cuadrar resultados |
| definir significado de métrica | propietario empresarial + gobierno AB           | un restatement no redefine fórmula por sí solo          |
| implementar cálculo            | custodio técnico                                | implementación no adquiere autoridad semántica          |
| evaluar calidad                | steward/certificador D007                       | reconstrucción no certifica por sí misma                |
| decidir restatement            | propietario empresarial y funciones autorizadas | decisión separada de la capacidad técnica de recalcular |
| publicar reexpresión           | función autorizada                              | publicar no permite corregir fuente ni certificar       |
| auditar cambio                 | función segregada conforme a DATA-AUTH          | conserva evidencia y trazabilidad                       |
| administrar versiones físicas  | tareas DATA-INT aplicables                      | no altera significado sin contrato documental           |

La misma persona podrá ocupar más de una función solo cuando la autorización futura lo permita; D017 no concede esa acumulación.

#### 45. Compatibilidad con herramientas BI, hojas y modelos externos

Una herramienta externa puede consumir versiones, pero no convertirse en autoridad.

Reglas:

- una fórmula local de BI no reemplaza la definición canónica;
- una hoja descargada no se usa como fuente para reescribir la métrica que originó la exportación;
- un modelo externo conserva dataset, corte, variables, versión y evidencia suficientes;
- un cambio de modelo se registra como versión técnica/modelo y no como versión semántica salvo que cambie la medida empresarial;
- resultados externos corregidos siguen el mismo análisis de impacto antes de restatement;
- `DATA-INT-004` gobierna la integración física y `DATA-AUTH-004` su auditoría.

#### 46. Publicación de historia y experiencia

Una superficie futura que muestre resultados históricos deberá poder distinguir, cuando exista reexpresión:

- valor originalmente publicado;
- fecha de publicación original;
- valor reexpresado vigente;
- fecha de reexpresión;
- razón;
- magnitud de diferencia;
- versión de métrica original y nueva cuando difieran;
- estado de calidad de cada edición;
- alcance afectado;
- enlace o drill-down autorizado a evidencia suficiente.

No se exige mostrar toda esta información permanentemente en la vista principal. `DATA-UX-007` define la experiencia de divulgación progresiva sin ocultar la existencia del restatement.

#### 47. Handoffs con propietario documental exacto

| Decisión o materialización fuera del alcance                                            | Propietario documental | Condición de salida                                                            |
| --------------------------------------------------------------------------------------- | ---------------------- | ------------------------------------------------------------------------------ |
| protección de datos, métricas y resultados por dominio, entidad, territorio y finalidad | `DATA-AUTH-001`        | antes de exponer historia o reexpresiones a consumidores                       |
| protección de poblaciones pequeñas, comparaciones, exportaciones y drill-down           | `DATA-AUTH-002`        | antes de exponer diferencias históricas sensibles                              |
| segregación de definición, certificación, publicación, restatement y administración     | `DATA-AUTH-003`        | antes de conceder capacidades productivas sobre versiones o reexpresiones      |
| auditoría de consultas, descargas, suscripciones, modelos y recomendaciones             | `DATA-AUTH-004`        | antes de habilitar trazabilidad operativa de consumidores y herramientas       |
| experiencia de catálogo de métricas y versiones                                         | `DATA-UX-002`          | antes de implementar navegación y comparación de definiciones                  |
| comparación y drill-down en tableros                                                    | `DATA-UX-003`          | antes de presentar series versionadas en superficies de dominio                |
| reportes, exportaciones, suscripciones y snapshots versionados                          | `DATA-UX-007`          | antes de implementar experiencia de publicación/restatement                    |
| contratos físicos de eventos y lectura                                                  | `DATA-INT-001`         | antes de reproducir resultados desde fuentes productivas compartidas           |
| capa semántica, consultas, modelos, caché, snapshots y materialización de versiones     | `DATA-INT-002`         | antes de implementar cálculo, almacenamiento o servicio de restatements        |
| crosswalks e identidades externas versionadas                                           | `DATA-INT-003`         | antes de reconstruir historia que dependa de correspondencias entre fuentes    |
| BI, hojas, modelos analíticos e inteligencia artificial                                 | `DATA-INT-004`         | antes de integrar herramientas externas en reconstrucción o análisis histórico |

No queda una decisión material de D017 diferida sin propietario documental y condición de salida.

#### 48. Cobertura de requisitos de prueba vigente

Las reglas de D017 ya están protegidas por requisitos vigentes:

- `TREQ-DATA-001` exige identidad estable, historia efectiva, crosswalks y preservación de hechos pasados ante correcciones, fusiones y separaciones;
- `TREQ-DATA-002` exige registro canónico versionado de métricas, mismo resultado bajo misma versión/contexto, reglas de comparación y prohibición de fórmulas locales competidoras;
- `TREQ-DATA-003` exige conservar contratos de origen, tiempos, versión de esquema, datos tardíos, backfills, correcciones, reconciliación y linaje;
- `TREQ-DATA-004` exige que publicaciones y exportaciones conserven versiones, periodo, corte, calidad y que toda corrección o restatement preserve la versión anterior;
- `TREQ-DATA-005` continúa protegiendo que acciones y experimentos conserven resultados, confianza, aprendizaje, datos faltantes y cambios de definición, aunque su tarea responsable principal finalice en D016.

D017 especializa la semántica de versionado, impacto histórico, reconstrucción y restatement dentro de reglas ya identificadas. No cambia prioridad, modalidad, estado, relación ni destino de implementación de esos requisitos.

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** los requisitos DATA vigentes ya asignan explícitamente a esta tarea la preservación de identidad e historia, el versionado semántico, datos tardíos, backfills, correcciones, linaje, publicaciones inmutables y restatements. Esta tarea materializa documentalmente esas obligaciones sin introducir una familia de comportamiento ejecutable independiente, modificar contratos físicos, cambiar datos, ejecutar reconstrucciones o publicar reexpresiones.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

#### 49. Criterios de aceptación

1. `metric_key`, versión semántica, versión de esquema, versión de transformación, versión técnica y edición de publicación permanecen conceptos distintos;
2. se conserva la regla misma métrica + misma versión + mismo contexto + mismo corte = mismo resultado;
3. un cambio técnico que no cambia significado no crea versión semántica;
4. un cambio material de significado sí crea una nueva versión semántica;
5. se enumeran explícitamente los elementos que disparan nueva versión semántica;
6. se enumeran explícitamente los cambios técnicos que no la disparan por sí solos;
7. una corrección de bug que alinea implementación con la definición v1 conserva la versión semántica y cambia la versión técnica/transformacional;
8. los resultados históricos afectados por ese bug se evalúan para restatement;
9. una versión nueva no elimina la anterior;
10. una versión histórica continúa resolviendo las publicaciones y decisiones que la usaron;
11. la versión vigente para nuevos usos no se aplica retroactivamente por defecto;
12. comparar versiones incompatibles exige puente explícito o series separadas;
13. una reconstrucción bajo una versión nueva no se presenta como definición vigente en el pasado;
14. se preservan exactamente las 14 `metric_key` de asistencia aprobadas;
15. las 14 métricas permanecen en versión semántica `1`;
16. existen 14 claves únicas, 0 faltantes y 0 duplicadas;
17. se preservan 11 estados `NO EVALUADO` y 3 `BLOQUEADO`;
18. D017 no desbloquea ni certifica métricas de asistencia;
19. `missingCloseCount`, `attendanceRate` y `punctualityRate` conservan su divergencia actual hasta corrección técnica y reevaluación;
20. reintento, replay, backfill, corrección, reconstrucción y restatement permanecen separados;
21. un backfill no se denomina automáticamente restatement;
22. una reconstrucción no modifica por sí sola la publicación anterior;
23. un restatement nunca sobrescribe la edición original;
24. dato tardío y dato incorrecto permanecen separados;
25. un dato tardío conserva el tiempo del hecho original;
26. un dato tardío en un periodo abierto puede producir nuevo corte sin ser restatement de una publicación inexistente;
27. un dato tardío que afecta una publicación oficial dispara evaluación de impacto;
28. una corrección de fuente nace en el dominio propietario;
29. la analítica no corrige el hecho fuente para cuadrar un reporte;
30. original y corrección de fuente permanecen trazables;
31. un mapping o transformación corregidos conservan la versión histórica defectuosa usada;
32. una corrección de mapping identifica periodos y consumidores potencialmente afectados;
33. una nueva versión semántica se aplica prospectivamente salvo decisión explícita de reconstrucción histórica;
34. una serie reconstruida bajo versión posterior se distingue de la serie publicada originalmente;
35. se define evaluación de impacto antes de toda reexpresión oficial;
36. la evaluación identifica fuente, periodos, versiones, métricas, artefactos, decisiones y evidencia afectadas;
37. no existe un umbral universal inventado de materialidad;
38. el restatement se limita al alcance demostrado por linaje;
39. una corrección sin impacto en resultado oficial no genera un restatement numérico ficticio;
40. una corrección de metadata material conserva historia y puede requerir una edición relacionada;
41. la publicación original permanece identificable después del restatement;
42. original y reexpresión conservan valores, cortes, versiones, calidad y fechas separados;
43. se distingue lo conocido entonces de lo reconstruido ahora;
44. evidencia posterior no se inserta retroactivamente como si hubiese estado disponible;
45. una decisión histórica conserva la evidencia disponible cuando fue tomada;
46. toda reconstrucción declara las versiones de fuente, esquema, transformación y semántica necesarias;
47. la reproducibilidad exige contexto, corte, población, dimensiones, filtros, unidad, moneda y tiempo;
48. la reproducibilidad conserva datos tardíos, backfills y correcciones conocidos al corte;
49. cuando un insumo histórico material no existe, la reproducción no se fabrica;
50. una fuente externa mutable requiere preservación de evidencia o declaración de limitación;
51. una reconstrucción no hereda automáticamente certificación D007;
52. toda reexpresión oficial pasa por nueva evaluación de calidad y certificación aplicable;
53. una fuente crítica `BLOQUEADO` puede bloquear la reexpresión oficial dependiente;
54. las seis familias de D008 están materializadas exactamente una vez en la matriz D017;
55. existen 6 decisiones de artefacto, 0 faltantes y 0 duplicadas;
56. tablero vivo y snapshot oficial no se confunden;
57. reporte reexpresado es una nueva edición relacionada;
58. exportación corregida es nueva generación y no altera el archivo ya entregado;
59. suscripción futura no reescribe entregas históricas;
60. alerta histórica no se elimina porque después se corrija la evidencia;
61. snapshot oficial permanece inmutable;
62. una conclusión diagnóstica D014 corregida conserva la conclusión y confianza originales;
63. una nueva evidencia puede aumentar o reducir confianza sin borrar la versión anterior;
64. baseline original D015 y baseline reexpresado permanecen separados;
65. una meta no se reescribe automáticamente al corregir baseline;
66. una evaluación D016 conserva diseño, exposición y resultado conocidos en el momento original;
67. una corrección posterior puede reexpresar el resultado sin reescribir la decisión histórica;
68. se preservan las 55 familias de D009 a D013 exactamente una vez;
69. la reconciliación de familias es 11 + 12 + 10 + 12 + 10 = 55;
70. existen 55 decisiones de versionado, 0 faltantes y 0 duplicadas;
71. ninguna familia recibe un `metric_key` inventado;
72. ninguna familia recibe una versión numérica ficticia antes de existir una métrica concreta registrada;
73. costo actual, jerarquía actual, regla actual o dimensión actual no sustituyen automáticamente su versión histórica;
74. la historia de moneda y unidad conserva conversiones y originales;
75. una corrección no se expande a periodos o dimensiones no afectadas sin evidencia de linaje;
76. un fallo de reproducibilidad queda visible como falta de evidencia o bloqueo;
77. la auditoría conserva actor, razón, versiones, alcance, evidencia, decisiones y publicación;
78. corregir, certificar y publicar permanecen capacidades separadas;
79. BI, hojas, modelos externos e IA no adquieren autoridad sobre historia analítica;
80. cada handoff tiene propietario documental exacto y condición de salida;
81. no se crea, modifica, difiere, descarta ni vuelve obsoleto ningún requisito de prueba;
82. no se ejecuta código, DDL, DML, migración, backfill, replay, reconstrucción productiva, restatement ni cambio de Supabase;
83. `DATA-AUTH-001` permanece únicamente reservada.

#### 50. Continuidad

```text
ÚLTIMA TAREA APROBADA
DATA-DOM-016 — Definir acciones de mejora, experimentos, responsables, seguimiento y comprobación de resultados

TAREA ACTUAL APROBADA
DATA-DOM-017 — Definir versionado de métricas, restatements, correcciones históricas y reproducibilidad

SIGUIENTE TAREA RESERVADA
DATA-AUTH-001 — Proteger datos maestros, métricas, reportes y análisis por dominio, entidad, territorio y finalidad
```

