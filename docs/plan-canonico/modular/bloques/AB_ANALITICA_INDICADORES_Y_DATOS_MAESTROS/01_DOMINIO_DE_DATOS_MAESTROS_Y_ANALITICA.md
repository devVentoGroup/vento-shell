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


### [ ] DATA-DOM-002 — Definir catálogo de datos maestros, datos de referencia y dimensiones compartidas
### [ ] DATA-DOM-003 — Definir identidad, claves, códigos, jerarquías, ciclo de vida, fusión y separación de datos maestros
### [ ] DATA-DOM-004 — Definir capa semántica y registro canónico de métricas e indicadores
### [ ] DATA-DOM-005 — Definir hechos, eventos, granularidad, dimensiones, calendarios, snapshots y comparabilidad histórica
### [ ] DATA-DOM-006 — Definir contratos de recopilación, ingestión, transformación, backfill y reconciliación
### [ ] DATA-DOM-007 — Definir calidad, certificación, frescura, completitud, unicidad, validez e integridad
### [ ] DATA-DOM-008 — Definir reportes, tableros, exportaciones, suscripciones, alertas y snapshots oficiales
### [ ] DATA-DOM-009 — Definir analítica de ventas, demanda, precios, promociones y canales
### [ ] DATA-DOM-010 — Definir analítica de inventario, abastecimiento, proveedores y logística
### [ ] DATA-DOM-011 — Definir analítica de producción, rendimiento, capacidad, merma y calidad
### [ ] DATA-DOM-012 — Definir analítica de servicio, clientes, fidelización, reputación y experiencia
### [ ] DATA-DOM-013 — Definir analítica de costos, rentabilidad, liquidez, presupuesto y escenarios
### [ ] DATA-DOM-014 — Definir diagnóstico transversal, anomalías, causas, oportunidades y nivel de confianza
### [ ] DATA-DOM-015 — Definir objetivos, líneas base, metas, drivers, guardrails y planes de medición
### [ ] DATA-DOM-016 — Definir acciones de mejora, experimentos, responsables, seguimiento y comprobación de resultados
### [ ] DATA-DOM-017 — Definir versionado de métricas, restatements, correcciones históricas y reproducibilidad
