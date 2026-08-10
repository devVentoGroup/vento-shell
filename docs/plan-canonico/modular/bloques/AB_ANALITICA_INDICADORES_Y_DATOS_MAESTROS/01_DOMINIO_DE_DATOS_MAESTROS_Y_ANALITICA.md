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
