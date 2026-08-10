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
