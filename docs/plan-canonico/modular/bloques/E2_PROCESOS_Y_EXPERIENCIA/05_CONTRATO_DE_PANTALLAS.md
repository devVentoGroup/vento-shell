CONTRATO DE PANTALLAS

### ✅ PROC-SCREEN-001 — Crear identificador estable para cada pantalla

**Estado:** APROBADA

**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal

**Marcador exacto que reemplaza:** `### [ ] PROC-SCREEN-001 — Crear identificador estable para cada pantalla`

**Tarea anterior:** `UX-ADMIN-005 — Prototipar y aprobar flujos administrativos con usuarios reales` — APROBADA

**Siguiente tarea reservada:** `PROC-SCREEN-002 — Vincular cada pantalla con una aplicación` — NO INICIADA

**Artefactos lógicos contenidos en esta tarea:**

- `SCREEN-IDENTITY-CONTRACT-001`;
- `SCREEN-ID-FORMAT-001`;
- `SCREEN-ID-ALLOCATION-POLICY-001`;
- `SCREEN-CATALOG-MINIMUM-RECORD-001`;
- `SCREEN-IDENTITY-LIFECYCLE-001`;
- `SCREEN-IDENTITY-CHANGE-DECISION-MATRIX-001`;
- `SCREEN-ALIAS-LEGACY-REGISTER-CONTRACT-001`;
- `SCREEN-IDENTITY-GOVERNANCE-001`;
- `SCREEN-IDENTITY-CARRYOVER-REGISTER-001`.

**Naturaleza:** contrato documental de identidad estable, asignación, versionado, conservación histórica y gobierno del catálogo de pantallas. No inventa límites de pantalla todavía no aprobados y no implementa rutas, componentes ni código.

**Cambios en aplicaciones, rutas, componentes, permisos, Supabase, tablas, migraciones, RLS, RPC, integraciones, analítica o producción:** no autorizados por esta tarea.

---

#### 1. Propósito

Definir una identidad canónica, opaca, única, durable y auditable para toda pantalla lógica de Vento OS, de modo que procesos, aplicaciones, pasos, actores, dispositivos, acciones, permisos, integraciones, métricas, pruebas, rutas legacy y reemplazos posteriores puedan referirse al mismo objeto sin depender de nombres humanos, URLs o componentes mutables.

```text
PANTALLA LOGICA RECONOCIDA
        +
IDENTIFICADOR CANONICO INMUTABLE
        +
REGISTRO DE CICLO DE VIDA Y VERSION
        =
REFERENCIA ESTABLE PARA TODO EL ROADMAP
```

La tarea crea el contrato del identificador y su registro de asignación. No transforma automáticamente un proceso, paso, arquetipo, ruta, componente, modal o prototipo en una pantalla.

---

#### 2. Normalización de la continuidad documental

El archivo propietario `05_CONTRATO_DE_PANTALLAS.md` y la secuencia activa establecen como título canónico:

```text
PROC-SCREEN-001 — Crear identificador estable para cada pantalla
```

El cierre de `UX-ADMIN-005` utilizó la descripción «Inventariar pantallas necesarias por proceso y aplicación». Esa frase se conserva únicamente como explicación del handoff funcional producido por el subbloque administrativo; **no renombra la tarea, no crea una tarea alternativa y no modifica la secuencia**.

Desde esta aprobación, toda referencia documental deberá utilizar el título exacto del archivo propietario. La discrepancia queda resuelta dentro de `PROC-SCREEN-001` y no permanece como pendiente narrativo.

---

#### 3. Dependencias consumidas

La tarea consume, sin reemplazar:

- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-010`;
- `UX-BASE-001` a `UX-BASE-015`;
- `NFR-REQ-001` a `NFR-REQ-011`;
- `UX-STATION-001` a `UX-STATION-012`;
- `UX-ADMIN-001` a `UX-ADMIN-005`;
- los procesos `VPROC-0001` a `VPROC-0069`;
- los cinco arquetipos operativos aprobados;
- las 98 familias administrativas `ADM-TASK-*`;
- los flujos representativos `APF-01` a `APF-12`;
- los contratos de modo guiado, modo experto, ayuda, validación, impacto, confirmación, receipt y recuperación;
- el catálogo canónico de aplicaciones, roles, permisos, contextos y dispositivos.

Estas fuentes aportan intenciones, tareas, pasos, actores y patrones. Ninguna de ellas autoriza asumir que cada proceso, flujo o arquetipo equivale a una única pantalla.

---

#### 4. Alcance

Esta tarea define:

1. qué entidad recibe un identificador de pantalla;
2. el formato canónico del identificador;
3. la secuencia y política de asignación;
4. la prohibición de reutilización o renumeración;
5. el registro mínimo de identidad;
6. el ciclo de vida de una pantalla;
7. el versionado de su contrato;
8. cuándo un cambio conserva el identificador;
9. cuándo exige un identificador nuevo;
10. cómo se documentan divisiones, fusiones y sustituciones;
11. cómo se administran nombres, slugs, rutas y alias;
12. cómo se enlazarán pantallas legacy sin convertir sus rutas en identidad;
13. qué validaciones estructurales deberán existir;
14. qué decisiones permanecen reservadas a `PROC-SCREEN-002` a `PROC-SCREEN-028`.

---

#### 5. Exclusiones

Esta tarea no:

- inventaría ni aprueba todavía el catálogo final de pantallas;
- decide la aplicación propietaria;
- vincula procesos o pasos;
- clasifica pantallas como operativas, administrativas, de supervisión, configuración, auditoría, personales o de cliente;
- define actores objetivo;
- selecciona dispositivos;
- define acciones principales o secundarias;
- diseña condiciones de entrada o salida;
- diseña estados vacíos, carga, bloqueo o recuperación;
- decide información sensible visible;
- asigna permisos;
- vincula Server Actions, APIs o RPC;
- decide rutas, layouts, componentes o navegación final;
- determina todavía qué pantalla legacy será reemplazada;
- define métricas o criterios operativos finales;
- crea registros ficticios para aparentar que existen pantallas cuyas fronteras aún no han sido aprobadas.

Asignar identificadores prematuramente a arquetipos, procesos o flujos completos produciría identidades falsas y posteriores renumeraciones. Esa práctica queda prohibida.

---

#### 6. Distinciones canónicas

| Concepto         | Definición                                                                                      | Relación con `screen_id`                                                     |
| ---------------- | ----------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| pantalla lógica  | superficie coherente con intención principal, contexto, entrada, salida y ciclo de vida propios | recibe un `screen_id`                                                        |
| ruta o URL       | dirección técnica mediante la cual puede abrirse una superficie                                 | alias mutable; no es identidad                                               |
| componente       | unidad reutilizable de implementación                                                           | no recibe `screen_id` por existir                                            |
| layout           | estructura visual compartida                                                                    | no es una pantalla por sí solo                                               |
| panel o pestaña  | región subordinada de una pantalla                                                              | solo recibe ID si posee contrato y ciclo de vida independientes              |
| modal o diálogo  | interacción superpuesta                                                                         | solo recibe ID si constituye una superficie lógica independiente y auditable |
| estado visual    | vacío, carga, bloqueo, error, éxito o recuperación                                              | pertenece al contrato de una pantalla                                        |
| paso de proceso  | actividad empresarial                                                                           | puede vincularse a una o varias pantallas en `PROC-SCREEN-004`               |
| flujo o workflow | secuencia de etapas                                                                             | puede atravesar varias pantallas o ejecutarse dentro de una                  |
| estación         | combinación física y lógica de contexto, dispositivo y periféricos                              | puede presentar varias pantallas                                             |
| aplicación       | frontera funcional y de autorización                                                            | se vincula en `PROC-SCREEN-002`; no forma parte del ID                       |
| vista legacy     | superficie existente pendiente de clasificación                                                 | se mapeará mediante alias o reemplazo en `PROC-SCREEN-026`                   |

Regla:

```text
UNA URL NO ES UNA PANTALLA
UN COMPONENTE NO ES UNA PANTALLA
UN PROCESO NO ES UNA PANTALLA
UN ARQUETIPO NO ES UNA PANTALLA

UNA PANTALLA PUEDE CAMBIAR DE URL, COMPONENTE O APLICACION
SIN PERDER SU IDENTIDAD
```

---

#### 7. Definición canónica de pantalla lógica

Una entidad podrá ingresar al catálogo como pantalla cuando cumpla conjuntamente:

1. tiene una intención principal reconocible para la persona usuaria;
2. presenta un contexto de trabajo o consulta coherente;
3. posee condiciones de entrada y salida que pueden especificarse;
4. puede referenciarse de forma independiente desde navegación, handoff, auditoría, analítica o pruebas;
5. puede evolucionar, sustituirse o retirarse sin depender exclusivamente de la existencia de un componente;
6. no es únicamente un estado visual o una variación cosmética;
7. su frontera evita mezclar intenciones materiales incompatibles.

El cumplimiento definitivo de estas condiciones se comprobará progresivamente en `PROC-SCREEN-002` a `PROC-SCREEN-028`.

---

#### 8. Formato canónico del identificador

Se aprueba el formato:

```text
VSCREEN-0001
VSCREEN-0002
VSCREEN-0003
...
VSCREEN-9999
VSCREEN-10000
```

Expresión contractual:

```text
^VSCREEN-[0-9]{4,}$
```

Reglas:

- prefijo fijo `VSCREEN`;
- letras ASCII mayúsculas;
- guion medio único entre prefijo y secuencia;
- secuencia decimal con mínimo cuatro dígitos;
- crecimiento sin truncamiento al superar `9999`;
- sin espacios, tildes, nombres de aplicación, rol, sede, área, dispositivo, proceso, tipo o versión;
- comparación exacta y sensible al formato;
- representación textual estable en documentación, contratos, telemetría y pruebas.

---

#### 9. Identificador opaco y sin semántica mutable

El identificador no codificará:

- aplicación;
- módulo;
- dominio;
- proceso;
- paso;
- rol;
- sede;
- área;
- dispositivo;
- clasificación UX;
- ruta;
- nombre humano;
- versión;
- ambiente;
- estado de ciclo de vida.

Ejemplos prohibidos:

```text
VISO-EMPLOYEES-SCREEN
NEXO-RECEPCION-01
SCREEN-GERENTE-VENTO-CAFE
PROC-0042-PANTALLA-01
/PULSO/CAJA
```

La opacidad evita que un cambio de propiedad, ruta, clasificación o territorio obligue a renumerar la pantalla.

---

#### 10. Política de asignación

`SCREEN-ID-ALLOCATION-POLICY-001` establece:

1. la secuencia comienza en `VSCREEN-0001`;
2. la asignación es global para todo Vento OS;
3. un único registro canónico controla el siguiente número disponible;
4. la asignación es monotónica;
5. un número asignado nunca se reutiliza;
6. una pantalla retirada conserva su identificador histórico;
7. una reserva no se considera pantalla hasta que exista registro completo;
8. dos aplicaciones o equipos no podrán mantener secuencias locales;
9. una importación o generación masiva deberá detectar colisiones antes de comprometerse;
10. una asignación concurrente deberá ser atómica o reconciliable;
11. no se permiten identificadores escritos manualmente fuera del registro;
12. la eliminación de una fila no libera el número.

Estado inicial del asignador:

```text
namespace: VSCREEN
minimum_width: 4
last_allocated_sequence: 0
next_available_identifier: VSCREEN-0001
canonical_screen_records: 0
```

El valor cero es deliberado: al inicio de esta tarea aún no existe un catálogo de fronteras de pantalla aprobado. No se fabrican registros a partir de nombres de procesos, arquetipos o prototipos.

---

#### 11. Registro mínimo de identidad

Toda pantalla asignada deberá crear una fila en `SCREEN-CATALOG-MINIMUM-RECORD-001` con:

| Campo                         | Obligación                                                                   |
| ----------------------------- | ---------------------------------------------------------------------------- |
| `screen_id`                   | identificador canónico `VSCREEN-*`                                           |
| `screen_contract_version`     | versión del contrato de la pantalla                                          |
| `working_name`                | nombre humano vigente y mutable                                              |
| `identity_statement`          | intención principal y frontera que justifican que sea una pantalla           |
| `origin_refs[]`               | tareas, procesos, flujos, hallazgos o superficies que originaron el registro |
| `lifecycle_status`            | estado vigente del ciclo de vida                                             |
| `created_by_task`             | tarea canónica que admitió la pantalla                                       |
| `created_at_document_version` | versión documental de alta                                                   |
| `supersedes[]`                | identificadores anteriores sustituidos, si aplica                            |
| `replaced_by[]`               | identificadores posteriores, si aplica                                       |
| `aliases[]`                   | rutas, slugs, nombres o claves legacy conocidas                              |
| `decision_record`             | justificación de continuidad, división, fusión o retiro                      |
| `notes`                       | restricciones sin convertirlas en autoridad                                  |

Los campos de aplicación, proceso, paso, clasificación, actores, dispositivos, acciones, permisos e integración se incorporarán en sus tareas propietarias posteriores y no deberán anticiparse dentro del identificador.

---

#### 12. Estados de ciclo de vida

| Estado          | Significado                                                              |
| --------------- | ------------------------------------------------------------------------ |
| `PROPOSED`      | frontera candidata en revisión; todavía no consumible por implementación |
| `CANONICAL`     | pantalla admitida como identidad vigente                                 |
| `SUPERSEDED`    | sustituida por una o varias pantallas nuevas                             |
| `MERGED`        | integrada en otra identidad, conservando historial                       |
| `SPLIT`         | dividida en dos o más identidades nuevas                                 |
| `RETIRED`       | retirada sin reutilizar su identificador                                 |
| `LEGACY_MAPPED` | superficie histórica mapeada mientras se determina reemplazo o retiro    |

Una pantalla no regresará de `RETIRED`, `MERGED` o `SPLIT` a `CANONICAL` reutilizando el mismo contrato. Una recuperación funcional deberá decidir si restaura la identidad histórica o crea una nueva, con ADR o decisión equivalente cuando el impacto sea material.

---

#### 13. Versionado del contrato de pantalla

La referencia completa podrá expresarse como:

```text
VSCREEN-0001@1.0.0
```

`screen_id` identifica la pantalla; `screen_contract_version` identifica una versión de su contrato.

Reglas:

- `MAJOR`: cambia materialmente el contrato pero se conserva la intención e identidad fundamentales;
- `MINOR`: agrega capacidad compatible, variante o dato sin romper consumidores;
- `PATCH`: corrige redacción, evidencia o metadatos sin cambiar comportamiento;
- un cambio que destruya la identidad fundamental exige un `screen_id` nuevo, no solo versión mayor;
- referencias sin versión significan la versión vigente únicamente cuando el consumidor lo declare de forma explícita;
- pruebas, eventos y receipts críticos deberán conservar la versión observada.

---

#### 14. Matriz para conservar o cambiar identidad

| Cambio                                                      | Resultado ordinario                   | Condición                                         |
| ----------------------------------------------------------- | ------------------------------------- | ------------------------------------------------- |
| cambio de nombre humano                                     | mismo ID                              | se actualiza alias e historial                    |
| cambio de ruta o slug                                       | mismo ID                              | se conserva redirección o mapa cuando aplique     |
| rediseño visual                                             | mismo ID                              | intención y contrato material permanecen          |
| refactor de componentes                                     | mismo ID                              | no cambia la superficie lógica                    |
| adaptación responsive                                       | mismo ID                              | conserva intención y resultado                    |
| cambio de dispositivo soportado                             | mismo ID                              | se versiona el contrato y se valida después       |
| traslado entre aplicaciones                                 | mismo ID posible                      | misma identidad, migración y propiedad explícitas |
| cambio de aplicación propietaria con duplicación temporal   | mismo ID solo para la fuente canónica | la proyección no adquiere identidad duplicada     |
| nuevo estado vacío, carga o error                           | mismo ID                              | pertenece al contrato de estados                  |
| incorporación de acción secundaria compatible               | mismo ID                              | no cambia intención principal                     |
| cambio de intención principal                               | nuevo ID                              | identidad materialmente distinta                  |
| cambio de objeto empresarial central                        | nuevo ID normalmente                  | requiere decisión documentada                     |
| separación de dos intenciones que competían                 | nuevos IDs                            | pantalla anterior queda `SPLIT`                   |
| unión de pantallas equivalentes                             | nuevo o ID superviviente              | decisión explícita y trazabilidad completa        |
| conversión de panel subordinado en superficie independiente | nuevo ID                              | adquiere entrada, salida y ciclo propios          |
| reutilización visual para otro proceso sin misma intención  | nuevo ID                              | compartir componentes no comparte identidad       |

Ningún equipo podrá decidir continuidad únicamente porque el archivo, componente o URL conserva el mismo nombre.

---

#### 15. División, fusión y sustitución

##### 15.1 División

Cuando una pantalla se divida:

```text
VSCREEN-0010
    → VSCREEN-0041
    → VSCREEN-0042
```

- `VSCREEN-0010` pasa a `SPLIT`;
- los nuevos registros declaran `supersedes`;
- eventos históricos continúan apuntando a `VSCREEN-0010`;
- no se reescribe la historia;
- navegación y métricas posteriores distinguen los nuevos IDs.

##### 15.2 Fusión

Cuando varias pantallas se fusionen:

- se decidirá si una identidad sobrevive o se crea una nueva;
- la decisión deberá justificar por qué la intención principal permanece o cambia;
- todos los IDs retirados conservan `replaced_by`;
- no se eliminan métricas, receipts ni pruebas históricas.

##### 15.3 Sustitución

Una sustitución tecnológica no implica automáticamente un ID nuevo. Una sustitución funcional sí puede exigirlo. `PROC-SCREEN-026` decidirá cada caso legacy con este contrato.

---

#### 16. Nombres, rutas, slugs y alias

Los siguientes valores son alias mutables:

- nombre mostrado;
- nombre interno;
- título de página;
- ruta web;
- deep link;
- slug;
- clave de navegación;
- nombre de archivo;
- nombre de componente;
- identificador legacy;
- etiqueta analítica antigua.

Cada alias deberá apuntar a un único `screen_id` vigente dentro de su ámbito. Si un alias fue reutilizado históricamente, el registro deberá conservar vigencia temporal o contexto suficiente para resolverlo sin ambigüedad.

El `screen_id` no se mostrará obligatoriamente a usuarios finales. Podrá exponerse en soporte, auditoría o diagnóstico cuando resulte útil y esté autorizado.

---

#### 17. Variantes y reutilización

Una misma identidad podrá admitir variantes de:

- dispositivo;
- tamaño de pantalla;
- sede;
- área;
- rol;
- idioma;
- densidad;
- modo guiado o experto;
- estado de conectividad;
- periféricos;
- accesibilidad.

Solo permanecerán bajo el mismo ID cuando conserven la misma intención principal, objeto central y contrato de entrada y salida. Una variante no podrá utilizarse para ocultar una pantalla materialmente distinta.

Los componentes compartidos, design system y plantillas podrán reutilizarse en múltiples `screen_id` sin confundir identidad con implementación.

---

#### 18. Fuente de verdad y consumidores

El catálogo canónico de pantallas será la única fuente autorizada para:

- documentación de procesos y experiencia;
- navegación y enlaces contextuales;
- contratos de pantalla;
- analítica de uso;
- auditoría de exposición y acciones;
- pruebas E2E y de regresión;
- inventario de rutas;
- mapas de reemplazo legacy;
- generación futura de tipos o constantes;
- cobertura de aplicaciones y procesos.

Las aplicaciones podrán mantener proyecciones o constantes generadas, pero no catálogos locales divergentes.

Un `screen_id` no concede permiso, no prueba visibilidad y no sustituye validaciones de servidor. La autorización seguirá resolviéndose por permiso, actor, contexto, recurso, territorio y estado.

---

#### 19. Identificador canónico e identificador técnico interno

Una implementación podrá utilizar UUID, clave primaria numérica u otro identificador técnico interno, siempre que exista una relación uno a uno, estable y verificable con `screen_id`.

```text
IDENTIFICADOR TECNICO INTERNO
≠ IDENTIDAD CANONICA DE PANTALLA
```

No se permitirá:

- mapear varios registros activos al mismo `screen_id` sin una proyección declarada;
- cambiar el `screen_id` porque cambió una clave primaria;
- usar una ruta como llave de auditoría cuando el `screen_id` esté disponible;
- confiar en un nombre de componente para correlacionar eventos históricos.

---

#### 20. Validaciones estructurales obligatorias

La automatización posterior deberá comprobar:

1. formato `^VSCREEN-[0-9]{4,}$`;
2. unicidad global;
3. secuencia monotónica;
4. ausencia de reutilización;
5. registro mínimo completo;
6. estado de ciclo de vida permitido;
7. versión válida;
8. relaciones `supersedes` y `replaced_by` resolubles;
9. ausencia de autorreferencias;
10. cadenas de reemplazo sin ciclos;
11. alias no ambiguos dentro del ámbito declarado;
12. toda referencia desde procesos, acciones, métricas o pruebas apunta a una pantalla existente;
13. una pantalla retirada no aparece como vigente;
14. no existen catálogos locales no reconciliados;
15. no se deriva autorización del identificador.

La tarea que implemente el catálogo y sus consumidores deberá incorporar estas validaciones a CI antes de depender del identificador en producción.

---

#### 21. Seguridad, privacidad y minimización

El identificador será opaco y no incluirá:

- nombre de persona;
- documento;
- correo;
- teléfono;
- rol individual;
- sede sensible;
- área restringida;
- estado disciplinario, médico o financiero;
- nombre de cliente o proveedor;
- secreto, token o ambiente.

Conocer un `screen_id` no deberá revelar si la persona puede acceder a la pantalla ni permitir construir una ruta sin autorización.

---

#### 22. Admisión futura de pantallas

Una pantalla podrá recibir un ID cuando una tarea `PROC-SCREEN-*` o una tarea funcional posterior:

1. demuestre que existe una frontera lógica de pantalla;
2. redacte `identity_statement`;
3. declare fuentes de origen;
4. compruebe que no duplica una identidad existente;
5. asigne atómicamente el siguiente número;
6. cree el registro mínimo;
7. conserve el vínculo con decisiones de división, fusión o sustitución.

`PROC-SCREEN-002` deberá comenzar materializando el primer lote de pantallas candidatas a partir de los handoffs operativos y administrativos, asignando `VSCREEN-*` mediante este contrato antes de vincular cada registro con una aplicación.

Esto no modifica el título ni el alcance de `PROC-SCREEN-002`: la asignación es un prerrequisito mecánico para poder ejecutar su vínculo.

---

#### 23. Decisiones reservadas y carryovers

| Pendiente                                                                      | Propietario exacto                                           |
| ------------------------------------------------------------------------------ | ------------------------------------------------------------ |
| materializar el primer catálogo de pantallas y vincular aplicación propietaria | `PROC-SCREEN-002`                                            |
| vincular procesos                                                              | `PROC-SCREEN-003`                                            |
| vincular pasos                                                                 | `PROC-SCREEN-004`                                            |
| clasificar carriles y tipos de pantalla                                        | `PROC-SCREEN-005` a `PROC-SCREEN-011`                        |
| definir actores                                                                | `PROC-SCREEN-012`                                            |
| definir dispositivos                                                           | `PROC-SCREEN-013`                                            |
| definir acciones                                                               | `PROC-SCREEN-014` y `PROC-SCREEN-015`                        |
| definir entrada, salida y estados                                              | `PROC-SCREEN-016` a `PROC-SCREEN-021`                        |
| definir información sensible y permisos                                        | `PROC-SCREEN-022` a `PROC-SCREEN-024`                        |
| vincular operaciones técnicas                                                  | `PROC-SCREEN-025`                                            |
| resolver rutas y pantallas legacy                                              | `PROC-SCREEN-026`                                            |
| definir métricas y aceptación                                                  | `PROC-SCREEN-027` y `PROC-SCREEN-028`                        |
| generar tipos, constantes y validadores técnicos                               | paquetes de implementación E5 y tareas técnicas propietarias |
| validar pantallas con usuarios y operación real                                | `UX-QA-020`, tareas `UX-QA-*` por aplicación y pilotos E5    |

No queda pendiente narrativo sin tarea y momento de resolución.

---

#### 24. Requisitos de prueba derivados

**Resultado:** GENERA 28 REQUISITOS DE PRUEBA.

Se incorporan `TREQ-UX-481` a `TREQ-UX-508` al Registro Canónico completo. Permanecen en estado `IDENTIFICADO`; la materialización del catálogo corresponde a `PROC-SCREEN-002` y tareas posteriores, mientras la automatización y certificación corresponden a paquetes E5, BLOQUE U y pilotos.

---

#### 25. Criterios de aceptación

- [x] Se confirma el título exacto del archivo propietario.
- [x] Se normaliza la descripción divergente del cierre de `UX-ADMIN-005` sin cambiar el identificador de tarea.
- [x] Se diferencia pantalla, ruta, componente, layout, panel, modal, estado, paso, flujo, estación y aplicación.
- [x] Se define qué entidad puede recibir identidad de pantalla.
- [x] Se aprueba el formato `VSCREEN-0001` y su expresión contractual.
- [x] El identificador es opaco y no contiene semántica mutable.
- [x] Se define asignación global, monotónica, concurrente y sin reutilización.
- [x] Se define el registro mínimo de identidad.
- [x] Se define ciclo de vida y versionado.
- [x] Se define cuándo conservar el ID y cuándo crear uno nuevo.
- [x] Se cubren división, fusión, sustitución, alias y legacy.
- [x] Se permite separar identidad canónica y clave técnica interna.
- [x] Se prohíbe derivar autorización desde `screen_id`.
- [x] Se definen validaciones estructurales y consumidores.
- [x] No se fabrican pantallas antes de aprobar sus fronteras.
- [x] Cada decisión posterior tiene tarea propietaria.
- [x] Se generan `TREQ-UX-481` a `TREQ-UX-508`.
- [x] No se implementa código ni se avanza a `PROC-SCREEN-002`.

---

#### 26. Resultado y continuidad

```text
UX-ADMIN-005 APROBADA
PROC-SCREEN-001 APROBADA
PROC-SCREEN-002 NO INICIADA
```

La continuidad documental pasa exclusivamente a:

```text
PROC-SCREEN-002 — Vincular cada pantalla con una aplicación
```


### ✅ PROC-SCREEN-002 — Vincular cada pantalla con una aplicación

**Estado:** APROBADA

**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal

**Marcador exacto que reemplaza:** `### [ ] PROC-SCREEN-002 — Vincular cada pantalla con una aplicación`

**Tarea anterior:** `PROC-SCREEN-001 — Crear identificador estable para cada pantalla` — APROBADA

**Siguiente tarea reservada:** `PROC-SCREEN-003 — Vincular cada pantalla con un proceso` — NO INICIADA

**Artefactos lógicos contenidos en esta tarea:**

- `SCREEN-APPLICATION-BINDING-CONTRACT-001`;
- `SCREEN-CANONICAL-CATALOG-001`;
- `SCREEN-APPLICATION-OWNERSHIP-MATRIX-001`;
- `SCREEN-CROSS-APP-COMPOSITION-RULES-001`;
- `SCREEN-APPLICATION-TRANSFER-POLICY-001`;
- `SCREEN-APPLICATION-BOUNDARY-EXCEPTION-REGISTER-001`;
- `SCREEN-APPLICATION-CARRYOVER-REGISTER-001`;
- `SCREEN-COVERAGE-ADMISSION-REGISTER-001`.

**Corrección integral de consistencia:** `2026-07-27.2` — reconcilia BLOQUE C, capacidades E1, `VPROC-0001` a `VPROC-0069`, superficies verificadas en repositorios y excepciones deliberadas de AURA, TALENTO y canales externos.

**Resultado cuantitativo corregido:** **175 pantallas canónicas** vinculadas a **9 aplicaciones habilitadas**; el catálogo de BLOQUE C conserva **10 aplicaciones canónicas**, pero `aura` mantiene **0** pantallas por su estado funcional diferido.

**Naturaleza:** materialización documental inicial del catálogo canónico de pantallas y asignación de una aplicación primaria a cada identidad. No define todavía procesos, pasos, clasificaciones UX, actores, dispositivos, acciones, estados, permisos ni operaciones técnicas.

**Cambios en código, repositorios, rutas, componentes, Supabase, tablas, migraciones, RLS, RPC, integraciones, analítica o producción:** no autorizados por esta tarea.

---

#### 1. Propósito

Materializar el primer catálogo de pantallas reconocido por Vento OS, asignar a cada pantalla un `VSCREEN-*` conforme a `PROC-SCREEN-001` y vincularla con exactamente una aplicación primaria responsable de presentar y gobernar esa superficie.

```text
IDENTIDAD DE PANTALLA
        +
APLICACION PRIMARIA CANONICA
        +
FRONTERA FUNCIONAL EXPLICITA
        =
PANTALLA UBICABLE SIN DUPLICAR PROPIEDAD
```

La vinculación indica dónde vive funcionalmente la pantalla. No convierte la aplicación en propietaria universal de todos los datos visibles y no concede acceso a ninguna persona.

---

#### 2. Dependencias consumidas

La tarea consume, sin reemplazar:

- `PROC-SCREEN-001` y su contrato `VSCREEN-*`;
- el catálogo canónico de aplicaciones aprobado en BLOQUE C;
- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-010`;
- `UX-BASE-001` a `UX-BASE-015`;
- `UX-STATION-001` a `UX-STATION-012`;
- `UX-ADMIN-001` a `UX-ADMIN-005`;
- los procesos `VPROC-0001` a `VPROC-0069` como fuentes, sin vincularlos todavía;
- las 98 familias `ADM-TASK-*` y los flujos `APF-01` a `APF-12` como fuentes de frontera;
- las decisiones aprobadas de propiedad funcional, autorización, contexto y dispositivos.

La tarea no vuelve a diseñar procesos ni experiencias. Reconoce pantallas de alta confianza derivadas de esas fuentes y reserva las relaciones exactas con procesos y pasos para `PROC-SCREEN-003` y `PROC-SCREEN-004`.

---

#### 3. Alcance

Esta tarea:

1. amplía el registro mínimo de `PROC-SCREEN-001` con `primary_application_id`;
2. define qué significa aplicación primaria de una pantalla;
3. materializa `VSCREEN-0001` a `VSCREEN-0175`;
4. asigna exactamente una aplicación primaria a cada pantalla;
5. conserva identidad, aplicación y propiedad de datos como conceptos distintos;
6. define handoffs, proyecciones y composición entre aplicaciones;
7. establece cómo cambiar una pantalla de aplicación sin renumerarla automáticamente;
8. impide que VISO se convierta en administrador universal;
9. impide crear pantallas bajo aplicaciones o códigos no aprobados;
10. deja trazabilidad y validaciones para tareas posteriores.

---

#### 4. Exclusiones

Esta tarea no:

- vincula pantallas con procesos o pasos;
- clasifica pantallas como operativas, administrativas, de supervisión, configuración, auditoría, personales o de cliente;
- define actores objetivo o roles;
- define dispositivos, estaciones o periféricos;
- define acciones principales o secundarias;
- diseña condiciones de entrada, salida, vacío, carga, bloqueo o recuperación;
- decide información sensible visible;
- asigna permisos;
- vincula Server Actions, APIs, RPC o eventos;
- define rutas, componentes, layout o navegación física;
- declara que las pantallas listadas ya existen en código;
- crea una aplicación `talento`;
- asigna pantallas a `aura` sin alcance aprobado.

---

#### 5. Definición de aplicación primaria

`primary_application_id` identifica la frontera funcional que:

1. presenta la intención principal de la pantalla;
2. gobierna su navegación y contrato de experiencia;
3. coordina sus acciones y handoffs;
4. conserva la responsabilidad de que la pantalla no duplique fuentes de verdad;
5. responde por su evolución, retiro y trazabilidad.

La aplicación primaria no necesariamente almacena todos los datos mostrados. Una pantalla puede componer proyecciones autorizadas de otras aplicaciones sin apropiarse de sus hechos ni escribir directamente sobre sus tablas.

```text
APLICACION DE LA PANTALLA
≠ REPOSITORIO
≠ TABLA
≠ SERVICIO
≠ TITULAR DE TODOS LOS DATOS VISIBLES
≠ PERMISO DE ACCESO
```

---

#### 6. Campo canónico incorporado

Cada registro de `SCREEN-CATALOG-MINIMUM-RECORD-001` incorpora:

| Campo                         | Obligación                                                              |
| ----------------------------- | ----------------------------------------------------------------------- |
| `primary_application_id`      | código exacto de una aplicación canónica                                |
| `application_binding_version` | versión de la decisión de vínculo                                       |
| `application_binding_status`  | `CANONICAL`, `TRANSFER_PROPOSED`, `TRANSFERRED` o `RETIRED_WITH_SCREEN` |
| `application_binding_reason`  | explicación de por qué la intención vive en esa aplicación              |
| `cross_app_dependencies[]`    | aplicaciones consultadas o enlazadas sin transferir propiedad           |
| `application_binding_task`    | tarea que aprobó o modificó el vínculo                                  |

Valores comunes del primer lote:

```text
screen_contract_version: 1.0.0
application_binding_version: 1.0.0
application_binding_status: CANONICAL
created_by_task: PROC-SCREEN-002
created_at_document_version: 2026-07-27.1
supersedes: []
replaced_by: []
aliases: []
decision_record: INITIAL_CANONICAL_ADMISSION
```

---

#### 7. Catálogo de aplicaciones y admisión de pantallas

El catálogo de BLOQUE C reconoce diez aplicaciones canónicas. En este corte solo nueve están habilitadas para recibir pantallas:

```text
shell
viso
anima
nexo
fogo
origo
pulso
numera
pass
```

Tratamientos explícitos:

- `aura` es una aplicación canónica diferida, no un código histórico; conserva cero pantallas hasta que una tarea de continuidad funcional apruebe su alcance;
- `talento` posee repositorio, esquema y base técnica futura, pero no es un `app_code` del catálogo canónico; sus superficies candidatas se conservan en el registro de cobertura diferida sin asignarlas por inferencia;
- las superficies administrativas de reclutamiento, selección y vinculación se asignan a `viso`;
- las superficies personales del trabajador se asignan a `anima`;
- VITAL permanece fuera de Vento OS y no puede recibir `VSCREEN-*`.

Una futura aplicación deberá ingresar primero al gobierno canónico de aplicaciones antes de recibir pantallas.

---

#### 8. Criterios de asignación

La aplicación primaria se decide en este orden:

1. **intención principal:** qué trabajo reconoce la persona usuaria;
2. **orquestación:** qué aplicación gobierna el flujo y sus handoffs;
3. **propiedad de la mutación:** qué aplicación debe ejecutar o solicitar las escrituras principales;
4. **frontera de autorización:** dónde se resuelve la capacidad funcional correspondiente;
5. **fuente de verdad:** qué aplicación conserva los hechos propios o sus proyecciones autorizadas;
6. **continuidad:** qué aplicación responde por la evolución y retiro de la pantalla.

No se decide por:

- ubicación del componente actual;
- repositorio que ya contiene una ruta similar;
- preferencia del desarrollador;
- aplicación desde la que se enlaza;
- rol de la persona;
- sede o dispositivo;
- nombre histórico de una pantalla.

---

#### 9. Reglas de composición entre aplicaciones

##### 9.1 Handoff

Una pantalla puede conducir a otra aplicación conservando:

```text
source_screen_id
source_application_id
destination_screen_id
destination_application_id
business_object_ref
return_contract
```

El handoff no transfiere permisos ni contexto operativo obsoleto. La aplicación destino revalida acceso, alcance, versión y estado.

##### 9.2 Proyección

Una pantalla puede mostrar datos de otra aplicación cuando:

- la proyección es contractual y mínima;
- la fuente permanece identificable;
- no se crea un maestro paralelo;
- la escritura se ejecuta mediante la aplicación o servicio propietario;
- los errores y retrasos de sincronización son visibles.

##### 9.3 Componente compartido

Reutilizar un componente no cambia la aplicación de una pantalla. El componente puede vivir en un paquete compartido y ser usado por varios `VSCREEN-*`.

##### 9.4 Superficie transversal

Una superficie solo pertenece a `shell` cuando su intención es genuinamente transversal: entrada, contexto, activación compartida, notificaciones o diagnóstico. SHELL no absorbe formularios empresariales por servir como contenedor.

---

#### 10. Límites especiales por aplicación

| Aplicación | Límite aprobado                                                                                                         |
| ---------- | ----------------------------------------------------------------------------------------------------------------------- |
| `shell`    | compone entrada, cuenta y navegación transversal; no duplica administración ni operación empresarial                    |
| `viso`     | gobierna organización, personas, acceso, cumplimiento y casos transversales; no replica operaciones propietarias         |
| `anima`    | experiencia personal laboral, asistencia y autoservicio propio; no administra poblaciones de trabajadores               |
| `nexo`     | inventario, ubicaciones, logística, activos, flota, instalaciones y maestros físicos                                    |
| `fogo`     | producción, recetas, inocuidad, trazabilidad, calidad y resultados productivos                                           |
| `origo`    | proveedores, contratos, compras, aprobaciones y recepción de compra                                                      |
| `pulso`    | venta, salón, catering, reservas, caja, servicio y publicación comercial                                                 |
| `numera`   | hechos económicos, obligaciones, tesorería, fiscalidad, presupuesto, cierre y análisis financiero                       |
| `pass`     | experiencia personal, compras y servicio del cliente; no es backoffice comercial ni POS                                 |

Una aplicación operativa puede contener pantallas administrativas propias. Eso no modifica todavía su clasificación; `PROC-SCREEN-005` a `PROC-SCREEN-011` resolverán el carril de cada pantalla.

---

#### 11. Resumen de asignación

| Aplicación | Lote original                    | Ampliación correctiva               | Cantidad | Frontera principal                                                  |
| ---------- | -------------------------------- | ----------------------------------- | -------: | ------------------------------------------------------------------- |
| `shell`    | `VSCREEN-0001` a `VSCREEN-0006`  | `VSCREEN-0175`                      |        7 | entrada, contexto, cuenta y capacidades transversales               |
| `viso`     | `VSCREEN-0007` a `VSCREEN-0026`  | `VSCREEN-0113` a `VSCREEN-0123`     |       31 | gobierno, personas, acceso, cumplimiento y casos administrativos    |
| `anima`    | `VSCREEN-0027` a `VSCREEN-0032`  | `VSCREEN-0124` a `VSCREEN-0131`     |       14 | experiencia personal del trabajador                                 |
| `nexo`     | `VSCREEN-0033` a `VSCREEN-0054`  | `VSCREEN-0132` a `VSCREEN-0144`     |       35 | inventario, logística, activos, flota, instalaciones e impresión    |
| `fogo`     | `VSCREEN-0055` a `VSCREEN-0067`  | `VSCREEN-0173` a `VSCREEN-0174`     |       15 | producción, recetas, inocuidad, trazabilidad y cierre productivo    |
| `origo`    | `VSCREEN-0068` a `VSCREEN-0079`  | `VSCREEN-0145` a `VSCREEN-0146`     |       14 | necesidades, proveedores, contratos, compras y recepción            |
| `pulso`    | `VSCREEN-0080` a `VSCREEN-0093`  | `VSCREEN-0147` a `VSCREEN-0152`     |       20 | venta, catering, reservas, caja, servicio y oferta                  |
| `numera`   | `VSCREEN-0094` a `VSCREEN-0106`  | `VSCREEN-0153` a `VSCREEN-0159`     |       20 | hechos económicos, tesorería, fiscalidad, presupuesto y análisis    |
| `pass`     | `VSCREEN-0107` a `VSCREEN-0112`  | `VSCREEN-0160` a `VSCREEN-0172`     |       19 | experiencia personal, compras, pedidos y servicio del cliente       |
| `aura`     | —                                | —                                   |        0 | aplicación canónica diferida; admisión pendiente de alcance         |
| **Total**  | `VSCREEN-0001` a `VSCREEN-0112`  | `VSCREEN-0113` a `VSCREEN-0175`     |  **175** | catálogo inicial corregido y reconciliado con E1 y `VPROC-*`        |

Los rangos contiguos reflejan únicamente el orden del lote inicial. **No son rangos reservados por aplicación y no codifican semántica en el ID.** Las pantallas futuras utilizarán la siguiente secuencia global disponible, aunque intercalen aplicaciones.

Ningún conteo de pantallas implica relación uno a uno con permisos, procesos, roles o capacidades.

---

#### 12. SCREEN-CANONICAL-CATALOG-001

Todos los registros siguientes poseen versión `1.0.0`, estado `CANONICAL`, alta por `PROC-SCREEN-002` y decisión `INITIAL_CANONICAL_ADMISSION`.

| Screen ID      | Nombre vigente                                        | Aplicación primaria | Declaración de identidad                                                                                                                                        | Fuente de frontera                        | Estado      |
| -------------- | ----------------------------------------------------- | ------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------- | ----------- |
| `VSCREEN-0001` | Hub Vento OS                                          | `shell`             | Permitir que una persona autenticada vea y abra las aplicaciones de Vento OS disponibles para su contexto sin convertir el hub en propietario de sus funciones. | AUTH + UX-BASE + handoffs transversales   | `CANONICAL` |
| `VSCREEN-0002` | Inicio de sesión y recuperación                       | `shell`             | Autenticar o recuperar el acceso de una persona y conducirla a una sesión válida antes de entrar a cualquier aplicación.                                        | AUTH + UX-BASE + handoffs transversales   | `CANONICAL` |
| `VSCREEN-0003` | Resolución de contexto y acceso                       | `shell`             | Explicar y resolver el contexto efectivo, las capacidades disponibles y las razones de bloqueo antes de continuar hacia una aplicación.                         | AUTH + UX-BASE + handoffs transversales   | `CANONICAL` |
| `VSCREEN-0004` | Activación de dispositivo compartido                  | `shell`             | Activar, identificar y cerrar el uso de un dispositivo compartido conservando principal técnico, actor humano y vigencia separados.                             | AUTH + UX-BASE + handoffs transversales   | `CANONICAL` |
| `VSCREEN-0005` | Bandeja transversal de tareas y notificaciones        | `shell`             | Concentrar avisos y pendientes transversales y conducir a la aplicación propietaria sin ejecutar allí la mutación empresarial.                                  | AUTH + UX-BASE + handoffs transversales   | `CANONICAL` |
| `VSCREEN-0006` | Centro de soporte y diagnóstico                       | `shell`             | Presentar estado técnico, incidencias y acciones de recuperación autorizadas sin exponer secretos ni reemplazar las herramientas propietarias.                  | AUTH + UX-BASE + handoffs transversales   | `CANONICAL` |
| `VSCREEN-0007` | Inicio ejecutivo y gerencial                          | `viso`              | Presentar prioridades, excepciones, indicadores y decisiones pendientes de dirección o gerencia con alcance explícito.                                          | UX-ADMIN + AUTH + supervisión transversal | `CANONICAL` |
| `VSCREEN-0008` | Estructura organizativa                               | `viso`              | Mantener empresas, titulares, marcas, establecimientos, sedes, áreas, zonas y relaciones organizativas autorizadas.                                             | UX-ADMIN + AUTH + supervisión transversal | `CANONICAL` |
| `VSCREEN-0009` | Políticas, delegaciones y límites                     | `viso`              | Crear, versionar, revisar y publicar políticas, responsabilidades, suplencias y límites de decisión.                                                            | UX-ADMIN + AUTH + supervisión transversal | `CANONICAL` |
| `VSCREEN-0010` | Compromisos y transferencias internas                 | `viso`              | Gestionar compromisos, responsables, entregas, aceptaciones y pendientes entre áreas o sedes.                                                                   | UX-ADMIN + AUTH + supervisión transversal | `CANONICAL` |
| `VSCREEN-0011` | Embudo de candidatos                                  | `viso`              | Consultar y organizar candidatos, vacantes y etapas de selección como trabajo administrativo de talento.                                                        | UX-ADMIN + AUTH + supervisión transversal | `CANONICAL` |
| `VSCREEN-0012` | Caso de selección                                     | `viso`              | Evaluar un candidato, conservar evidencia y registrar una decisión de selección sin crear todavía un vínculo laboral indebido.                                  | UX-ADMIN + AUTH + supervisión transversal | `CANONICAL` |
| `VSCREEN-0013` | Vinculación e incorporación                           | `viso`              | Orquestar identidad, vínculo, documentos, asignaciones, accesos, inducción y pendientes de incorporación.                                                       | UX-ADMIN + AUTH + supervisión transversal | `CANONICAL` |
| `VSCREEN-0014` | Directorio y expediente laboral                       | `viso`              | Consultar y administrar el expediente laboral y organizativo de una persona con minimización y alcance territorial.                                             | UX-ADMIN + AUTH + supervisión transversal | `CANONICAL` |
| `VSCREEN-0015` | Programación laboral                                  | `viso`              | Planear, validar, publicar y revisar turnos, funciones, sedes, áreas y cobertura laboral.                                                                       | UX-ADMIN + AUTH + supervisión transversal | `CANONICAL` |
| `VSCREEN-0016` | Revisión de asistencia                                | `viso`              | Revisar marcaciones, diferencias y solicitudes de corrección sin alterar el hecho original de asistencia.                                                       | UX-ADMIN + AUTH + supervisión transversal | `CANONICAL` |
| `VSCREEN-0017` | Novedades, ausencias y reemplazos                     | `viso`              | Gestionar solicitudes, ausencias, permisos, incapacidades, reemplazos y decisiones asociadas.                                                                   | UX-ADMIN + AUTH + supervisión transversal | `CANONICAL` |
| `VSCREEN-0018` | Retiro y revocación coordinada                        | `viso`              | Coordinar finalización laboral, devolución de elementos, cierre de pendientes y revocación de accesos y sesiones.                                               | UX-ADMIN + AUTH + supervisión transversal | `CANONICAL` |
| `VSCREEN-0019` | Catálogo de roles y permisos                          | `viso`              | Mantener roles base, roles operativos, permisos y relaciones permitidas sin conceder acceso por el solo hecho de visualizar el catálogo.                        | UX-ADMIN + AUTH + supervisión transversal | `CANONICAL` |
| `VSCREEN-0020` | Perfil de acceso del trabajador                       | `viso`              | Administrar asignaciones, ámbitos, excepciones y vigencias de acceso de un trabajador concreto.                                                                 | UX-ADMIN + AUTH + supervisión transversal | `CANONICAL` |
| `VSCREEN-0021` | Simulación de permisos y conflictos                   | `viso`              | Simular capacidades efectivas y explicar conflictos, orígenes y denegaciones sin modificar la autorización real.                                                | UX-ADMIN + AUTH + supervisión transversal | `CANONICAL` |
| `VSCREEN-0022` | Gobierno de dispositivos compartidos                  | `viso`              | Registrar, activar, suspender, revocar y auditar dispositivos compartidos y sus capacidades admitidas.                                                          | UX-ADMIN + AUTH + supervisión transversal | `CANONICAL` |
| `VSCREEN-0023` | Riesgos de seguridad y salud                          | `viso`              | Registrar, evaluar, tratar y verificar riesgos SST con evidencia y responsables.                                                                                | UX-ADMIN + AUTH + supervisión transversal | `CANONICAL` |
| `VSCREEN-0024` | Incidentes y emergencias                              | `viso`              | Investigar incidentes, accidentes o emergencias, conservar cronología y gestionar acciones correctivas.                                                         | UX-ADMIN + AUTH + supervisión transversal | `CANONICAL` |
| `VSCREEN-0025` | Controles de higiene y cumplimiento                   | `viso`              | Planear, revisar y auditar controles de higiene, inocuidad y cumplimiento obligatorios.                                                                         | UX-ADMIN + AUTH + supervisión transversal | `CANONICAL` |
| `VSCREEN-0026` | Bandeja de casos administrativos transversales        | `viso`              | Recibir, clasificar y conducir casos administrativos hacia la superficie especializada sin sustituir instalaciones, tecnología u otra operación propietaria.     | UX-ADMIN + AUTH + supervisión transversal | `CANONICAL` |
| `VSCREEN-0027` | Inicio personal del trabajador                        | `anima`             | Mostrar al trabajador sus tareas, avisos, jornada y accesos personales relevantes para el momento actual.                                                       | experiencia personal laboral + asistencia | `CANONICAL` |
| `VSCREEN-0028` | Registro de entrada, pausa y salida                   | `anima`             | Permitir que el trabajador registre eventos de jornada propios con identidad, ubicación y confirmación válidas.                                                 | experiencia personal laboral + asistencia | `CANONICAL` |
| `VSCREEN-0029` | Mi programación                                       | `anima`             | Consultar la programación laboral propia vigente y los cambios confirmados.                                                                                     | experiencia personal laboral + asistencia | `CANONICAL` |
| `VSCREEN-0030` | Mi asistencia y solicitud de corrección               | `anima`             | Consultar asistencia propia y solicitar corrección o aclaración sin editar directamente los hechos registrados.                                                 | experiencia personal laboral + asistencia | `CANONICAL` |
| `VSCREEN-0031` | Mis novedades, permisos y ausencias                   | `anima`             | Crear y seguir solicitudes personales de novedad, permiso, ausencia o soporte documental.                                                                       | experiencia personal laboral + asistencia | `CANONICAL` |
| `VSCREEN-0032` | Mi perfil laboral                                     | `anima`             | Consultar y actualizar únicamente los datos personales y laborales autogestionables permitidos.                                                                  | experiencia personal laboral + asistencia | `CANONICAL` |
| `VSCREEN-0033` | Resumen de inventario y abastecimiento interno        | `nexo`              | Presentar existencias, alertas, movimientos y pendientes logísticos relevantes sin sustituir los flujos de ejecución.                                           | UX-STATION + inventario y logística       | `CANONICAL` |
| `VSCREEN-0034` | Catálogo de productos físicos                         | `nexo`              | Consultar el maestro de productos, unidades, presentaciones y relaciones físicas administradas por NEXO.                                                        | UX-STATION + inventario y logística       | `CANONICAL` |
| `VSCREEN-0035` | Editor de producto, unidad y presentación             | `nexo`              | Crear o versionar productos físicos, unidades, presentaciones, empaques y conversiones con validación de impacto.                                               | UX-STATION + inventario y logística       | `CANONICAL` |
| `VSCREEN-0036` | Especificaciones y criterios de calidad               | `nexo`              | Mantener especificaciones físicas, alérgenos, condiciones de aceptación y criterios de calidad vinculados al inventario.                                        | UX-STATION + inventario y logística       | `CANONICAL` |
| `VSCREEN-0037` | Catálogo de ubicaciones                               | `nexo`              | Consultar y mantener sedes, zonas, ubicaciones, estanterías, niveles y posiciones lógicas de almacenamiento.                                                    | UX-STATION + inventario y logística       | `CANONICAL` |
| `VSCREEN-0038` | Identificación y detalle de ubicación                 | `nexo`              | Identificar una ubicación física y consultar su capacidad, contenido, restricciones y acciones compatibles.                                                     | UX-STATION + inventario y logística       | `CANONICAL` |
| `VSCREEN-0039` | Consulta de existencias                               | `nexo`              | Buscar existencias por producto, presentación, ubicación, lote, estado o sede con trazabilidad al origen.                                                       | UX-STATION + inventario y logística       | `CANONICAL` |
| `VSCREEN-0040` | Conteo de inventario                                  | `nexo`              | Capturar cantidades físicas para un conteo asignado conservando unidad, ubicación, actor y evidencia.                                                           | UX-STATION + inventario y logística       | `CANONICAL` |
| `VSCREEN-0041` | Revisión de conteo y diferencias                      | `nexo`              | Comparar conteo contra existencia esperada y conducir a recuento, investigación o ajuste autorizado.                                                            | UX-STATION + inventario y logística       | `CANONICAL` |
| `VSCREEN-0042` | Caso de ajuste de inventario                          | `nexo`              | Preparar, revisar y resolver un ajuste con razón, evidencia, segregación e impacto visible.                                                                     | UX-STATION + inventario y logística       | `CANONICAL` |
| `VSCREEN-0043` | Confirmación de entrada a inventario                  | `nexo`              | Confirmar o revisar el efecto logístico de una entrada ya originada por recepción, producción, devolución u otra fuente autorizada.                             | UX-STATION + inventario y logística       | `CANONICAL` |
| `VSCREEN-0044` | Retiro y consumo de existencias                       | `nexo`              | Registrar retiro o consumo de una existencia desde una ubicación y presentación válidas.                                                                        | UX-STATION + inventario y logística       | `CANONICAL` |
| `VSCREEN-0045` | Traslado interno de existencias                       | `nexo`              | Mover existencias entre ubicaciones conservando origen, destino, cantidad, custodia y estado.                                                                   | UX-STATION + inventario y logística       | `CANONICAL` |
| `VSCREEN-0046` | Solicitud de remisión                                 | `nexo`              | Crear y seguir una solicitud de abastecimiento interno por sede, producto, presentación y necesidad.                                                            | UX-STATION + inventario y logística       | `CANONICAL` |
| `VSCREEN-0047` | Preparación de remisión                               | `nexo`              | Preparar cantidades solicitadas y registrar sustituciones, faltantes y unidades realmente separadas.                                                            | UX-STATION + inventario y logística       | `CANONICAL` |
| `VSCREEN-0048` | Carga y despacho de remisión                          | `nexo`              | Verificar, cargar y despachar una remisión transfiriendo custodia de forma explícita.                                                                           | UX-STATION + inventario y logística       | `CANONICAL` |
| `VSCREEN-0049` | Seguimiento de remisión en tránsito                   | `nexo`              | Consultar y gestionar una remisión durante transporte y sus novedades autorizadas.                                                                              | UX-STATION + inventario y logística       | `CANONICAL` |
| `VSCREEN-0050` | Recepción de remisión                                 | `nexo`              | Recibir una remisión, comparar cantidades y registrar diferencias, aceptación y ubicación inicial.                                                              | UX-STATION + inventario y logística       | `CANONICAL` |
| `VSCREEN-0051` | Vencimiento, cuarentena, daño y merma                 | `nexo`              | Gestionar existencias restringidas por vencimiento, daño, merma, pérdida, temperatura o cuarentena.                                                             | UX-STATION + inventario y logística       | `CANONICAL` |
| `VSCREEN-0052` | LPN, contenedores y reutilizables                     | `nexo`              | Identificar, llenar, vaciar, transferir y recuperar contenedores, LPN y elementos reutilizables.                                                                | UX-STATION + inventario y logística       | `CANONICAL` |
| `VSCREEN-0053` | Activos y custodia                                    | `nexo`              | Registrar activos, asignaciones, transferencias de custodia, devoluciones, mantenimiento y baja logística.                                                      | UX-STATION + inventario y logística       | `CANONICAL` |
| `VSCREEN-0054` | Etiquetas e impresión logística                       | `nexo`              | Preparar y emitir etiquetas autorizadas para productos, ubicaciones, LPN, paquetes y movimientos.                                                               | UX-STATION + inventario y logística       | `CANONICAL` |
| `VSCREEN-0055` | Inicio y cola de producción                           | `fogo`              | Presentar la producción pendiente, priorizada y disponible para el área y contexto efectivos.                                                                   | UX-STATION + producción y recetas         | `CANONICAL` |
| `VSCREEN-0056` | Planeación de producción                              | `fogo`              | Convertir demanda, stock, capacidad y restricciones en un plan productivo revisable.                                                                            | UX-STATION + producción y recetas         | `CANONICAL` |
| `VSCREEN-0057` | Preparación e inicio de lote                          | `fogo`              | Validar receta, insumos, equipo, área y condiciones antes de iniciar un lote.                                                                                   | UX-STATION + producción y recetas         | `CANONICAL` |
| `VSCREEN-0058` | Ejecución de lote                                     | `fogo`              | Guiar y registrar las operaciones principales de un lote en curso.                                                                                              | UX-STATION + producción y recetas         | `CANONICAL` |
| `VSCREEN-0059` | Registro parcial de producción                        | `fogo`              | Registrar avances, cantidades parciales, pausas, incidencias y consumos sin cerrar el lote.                                                                     | UX-STATION + producción y recetas         | `CANONICAL` |
| `VSCREEN-0060` | Finalización y cierre de lote                         | `fogo`              | Confirmar resultados, rendimientos, consumos, desperdicios y producto terminado al cerrar el lote.                                                              | UX-STATION + producción y recetas         | `CANONICAL` |
| `VSCREEN-0061` | Receta operativa                                      | `fogo`              | Mostrar la versión de receta aplicable al lote con instrucciones y controles mínimos de ejecución.                                                              | UX-STATION + producción y recetas         | `CANONICAL` |
| `VSCREEN-0062` | Catálogo y editor de recetas                          | `fogo`              | Crear y mantener borradores de recetas, ingredientes, cantidades, procesos, rendimientos y especificaciones.                                                    | UX-STATION + producción y recetas         | `CANONICAL` |
| `VSCREEN-0063` | Revisión, aprobación y publicación de receta          | `fogo`              | Comparar versiones, revisar impacto y aprobar o publicar una receta con vigencia controlada.                                                                    | UX-STATION + producción y recetas         | `CANONICAL` |
| `VSCREEN-0064` | Prueba de receta y rendimiento                        | `fogo`              | Ejecutar y documentar pruebas técnicas de receta, rendimiento, calidad y ajustes propuestos.                                                                    | UX-STATION + producción y recetas         | `CANONICAL` |
| `VSCREEN-0065` | Control de calidad y liberación                       | `fogo`              | Evaluar un lote o producto y decidir liberación, retención, rechazo o investigación.                                                                            | UX-STATION + producción y recetas         | `CANONICAL` |
| `VSCREEN-0066` | Empaque, etiquetado y almacenamiento de terminado     | `fogo`              | Registrar empaque, etiqueta, presentación, cantidad y transferencia del producto terminado.                                                                     | UX-STATION + producción y recetas         | `CANONICAL` |
| `VSCREEN-0067` | Reproceso, aprovechamiento, merma y cierre productivo | `fogo`              | Gestionar reproceso, aprovechamiento, desperdicio y análisis de cierre sin borrar el lote original.                                                             | UX-STATION + producción y recetas         | `CANONICAL` |
| `VSCREEN-0068` | Bandeja de necesidades de compra                      | `origo`             | Priorizar necesidades de compra recibidas desde áreas, inventario, producción o administración.                                                                 | UX-ADMIN + abastecimiento y recepción     | `CANONICAL` |
| `VSCREEN-0069` | Solicitud de compra                                   | `origo`             | Crear y seguir una solicitud de compra con necesidad, sede, centro de costo, fecha y justificación.                                                             | UX-ADMIN + abastecimiento y recepción     | `CANONICAL` |
| `VSCREEN-0070` | Catálogo de proveedores                               | `origo`             | Consultar proveedores, estados, categorías, condiciones y cobertura autorizada.                                                                                 | UX-ADMIN + abastecimiento y recepción     | `CANONICAL` |
| `VSCREEN-0071` | Alta y expediente de proveedor                        | `origo`             | Crear, validar y mantener identidad, documentos, condiciones y estado de un proveedor.                                                                          | UX-ADMIN + abastecimiento y recepción     | `CANONICAL` |
| `VSCREEN-0072` | Comparación de cotizaciones                           | `origo`             | Comparar ofertas, condiciones, presentaciones, tiempos y criterios de selección de proveedor.                                                                   | UX-ADMIN + abastecimiento y recepción     | `CANONICAL` |
| `VSCREEN-0073` | Editor de orden de compra                             | `origo`             | Preparar y versionar una orden de compra con líneas, precios, impuestos, sede y centro de costo.                                                                | UX-ADMIN + abastecimiento y recepción     | `CANONICAL` |
| `VSCREEN-0074` | Bandeja de aprobaciones de compra                     | `origo`             | Revisar evidencia e impacto y aprobar, rechazar o devolver compras según segregación.                                                                           | UX-ADMIN + abastecimiento y recepción     | `CANONICAL` |
| `VSCREEN-0075` | Detalle y seguimiento de orden                        | `origo`             | Consultar estado, entregas, cambios, documentos y pendientes de una orden de compra.                                                                            | UX-ADMIN + abastecimiento y recepción     | `CANONICAL` |
| `VSCREEN-0076` | Cola de recepciones                                   | `origo`             | Presentar órdenes y entregas pendientes de recepción por sede y responsabilidad.                                                                                | UX-ADMIN + abastecimiento y recepción     | `CANONICAL` |
| `VSCREEN-0077` | Recepción total o parcial                             | `origo`             | Registrar la recepción física y documental de una compra por línea y presentación.                                                                              | UX-ADMIN + abastecimiento y recepción     | `CANONICAL` |
| `VSCREEN-0078` | Resolución de diferencias de recepción                | `origo`             | Resolver diferencias de cantidad, calidad, precio, documento o presentación y sus efectos separados.                                                            | UX-ADMIN + abastecimiento y recepción     | `CANONICAL` |
| `VSCREEN-0079` | Historial y auditoría de abastecimiento               | `origo`             | Reconstruir solicitudes, cotizaciones, órdenes, aprobaciones, recepciones y diferencias.                                                                        | UX-ADMIN + abastecimiento y recepción     | `CANONICAL` |
| `VSCREEN-0080` | Inicio POS                                            | `pulso`             | Presentar las acciones y pendientes de venta, salón, mostrador o caja compatibles con la estación y el actor.                                                   | UX-STATION + venta, caja y cliente        | `CANONICAL` |
| `VSCREEN-0081` | Creación de venta o pedido                            | `pulso`             | Construir una venta o pedido con productos, cantidades, modificadores, canal y responsable.                                                                     | UX-STATION + venta, caja y cliente        | `CANONICAL` |
| `VSCREEN-0082` | Mapa de salón y mesas                                 | `pulso`             | Consultar y gestionar mesas, ocupación, pedidos y estado de servicio del salón.                                                                                 | UX-STATION + venta, caja y cliente        | `CANONICAL` |
| `VSCREEN-0083` | Detalle y modificación de pedido                      | `pulso`             | Consultar un pedido y ejecutar adiciones, sustituciones o correcciones permitidas antes del cierre.                                                             | UX-STATION + venta, caja y cliente        | `CANONICAL` |
| `VSCREEN-0084` | Cobro y medios de pago                                | `pulso`             | Calcular total, aplicar medios de pago, confirmar recaudo y emitir soporte autorizado.                                                                          | UX-STATION + venta, caja y cliente        | `CANONICAL` |
| `VSCREEN-0085` | Identificación de cliente y acumulación               | `pulso`             | Identificar al cliente con datos mínimos y registrar acumulación de puntos vinculada a una venta válida.                                                        | UX-STATION + venta, caja y cliente        | `CANONICAL` |
| `VSCREEN-0086` | Redención de puntos o beneficios                      | `pulso`             | Validar y consumir una redención autorizada sin duplicarla ni exponer información innecesaria.                                                                  | UX-STATION + venta, caja y cliente        | `CANONICAL` |
| `VSCREEN-0087` | Bandeja de pedidos de canales externos                | `pulso`             | Recibir, clasificar y conducir pedidos provenientes de canales externos hacia la operación interna.                                                             | UX-STATION + venta, caja y cliente        | `CANONICAL` |
| `VSCREEN-0088` | Seguimiento de preparación y entrega                  | `pulso`             | Consultar el avance del pedido y coordinar entrega, retiro o servicio sin sustituir la ejecución productiva.                                                    | UX-STATION + venta, caja y cliente        | `CANONICAL` |
| `VSCREEN-0089` | Apertura de caja                                      | `pulso`             | Abrir una caja o jornada con responsable, fondo, terminal, sede y controles requeridos.                                                                         | UX-STATION + venta, caja y cliente        | `CANONICAL` |
| `VSCREEN-0090` | Cierre de caja                                        | `pulso`             | Conciliar ventas, medios, soportes y diferencias antes de cerrar la jornada de caja.                                                                            | UX-STATION + venta, caja y cliente        | `CANONICAL` |
| `VSCREEN-0091` | Anulación, devolución y reembolso                     | `pulso`             | Gestionar anulaciones, devoluciones, compensaciones y reembolsos como acciones diferenciadas y auditables.                                                      | UX-STATION + venta, caja y cliente        | `CANONICAL` |
| `VSCREEN-0092` | Oferta, menú, precio comercial y disponibilidad       | `pulso`             | Versionar y publicar la oferta comercial visible por sede, canal y vigencia sin duplicar el maestro físico.                                                     | UX-STATION + venta, caja y cliente        | `CANONICAL` |
| `VSCREEN-0093` | Revisión de ventas, caja y terminales                 | `pulso`             | Consultar ventas, cierres, incidencias y estado de terminales con alcance y permisos explícitos.                                                                | UX-STATION + venta, caja y cliente        | `CANONICAL` |
| `VSCREEN-0094` | Inicio financiero y ejecutivo                         | `numera`            | Presentar indicadores, alertas, cierres y decisiones financieras relevantes para el alcance autorizado.                                                         | UX-ADMIN + finanzas y conciliación        | `CANONICAL` |
| `VSCREEN-0095` | Bandeja de hechos económicos                          | `numera`            | Recibir y revisar hechos económicos provenientes de aplicaciones fuente sin redigitarlos como nuevos hechos.                                                    | UX-ADMIN + finanzas y conciliación        | `CANONICAL` |
| `VSCREEN-0096` | Registro de gasto y soporte                           | `numera`            | Registrar un gasto, obligación o soporte con empresa, centro de costo, periodo y contraparte.                                                                   | UX-ADMIN + finanzas y conciliación        | `CANONICAL` |
| `VSCREEN-0097` | Bandeja de aprobaciones financieras                   | `numera`            | Revisar y decidir pagos, gastos, ajustes o cierres con evidencia y segregación.                                                                                 | UX-ADMIN + finanzas y conciliación        | `CANONICAL` |
| `VSCREEN-0098` | Cuentas por pagar y obligaciones                      | `numera`            | Gestionar obligaciones, vencimientos, programación de pago y estado frente a proveedores o terceros.                                                            | UX-ADMIN + finanzas y conciliación        | `CANONICAL` |
| `VSCREEN-0099` | Cuentas por cobrar y cartera                          | `numera`            | Gestionar saldos, vencimientos, recaudos, acuerdos y seguimiento de cartera.                                                                                    | UX-ADMIN + finanzas y conciliación        | `CANONICAL` |
| `VSCREEN-0100` | Caja, bancos y movimientos financieros                | `numera`            | Consultar y gestionar cuentas, movimientos, soportes y estados de caja o bancos dentro del alcance aprobado.                                                    | UX-ADMIN + finanzas y conciliación        | `CANONICAL` |
| `VSCREEN-0101` | Conciliación de ventas y pagos                        | `numera`            | Comparar ventas, pagos, soportes, liquidaciones y depósitos y resolver diferencias.                                                                             | UX-ADMIN + finanzas y conciliación        | `CANONICAL` |
| `VSCREEN-0102` | Conciliación de compras y recepciones                 | `numera`            | Comparar órdenes, recepciones, facturas, pagos y obligaciones y resolver diferencias.                                                                           | UX-ADMIN + finanzas y conciliación        | `CANONICAL` |
| `VSCREEN-0103` | Conciliación de inventario, producción y variaciones  | `numera`            | Relacionar movimientos físicos, consumos, producción, costos y variaciones sin crear hechos duplicados.                                                         | UX-ADMIN + finanzas y conciliación        | `CANONICAL` |
| `VSCREEN-0104` | Costos, rentabilidad y escenarios                     | `numera`            | Analizar costos, márgenes, rentabilidad y escenarios por empresa, sede, canal, producto y periodo.                                                              | UX-ADMIN + finanzas y conciliación        | `CANONICAL` |
| `VSCREEN-0105` | Cierre, reapertura y corrección de periodo            | `numera`            | Cerrar o reabrir un periodo y registrar correcciones posteriores sin borrar historia.                                                                           | UX-ADMIN + finanzas y conciliación        | `CANONICAL` |
| `VSCREEN-0106` | Reportes y exportaciones financieras                  | `numera`            | Preparar, revisar y exportar información financiera autorizada con filtros, versión y trazabilidad.                                                             | UX-ADMIN + finanzas y conciliación        | `CANONICAL` |
| `VSCREEN-0107` | Inicio del cliente y resumen de beneficios            | `pass`              | Mostrar al cliente su estado, puntos, beneficios y acciones personales relevantes.                                                                              | experiencia personal de cliente           | `CANONICAL` |
| `VSCREEN-0108` | QR personal de identificación                         | `pass`              | Presentar el identificador personal utilizado para reconocer al cliente en una interacción autorizada.                                                          | experiencia personal de cliente           | `CANONICAL` |
| `VSCREEN-0109` | Catálogo de beneficios y recompensas                  | `pass`              | Permitir al cliente consultar beneficios disponibles, condiciones, costo en puntos y vigencia.                                                                  | experiencia personal de cliente           | `CANONICAL` |
| `VSCREEN-0110` | Ticket o QR de redención                              | `pass`              | Crear y presentar una redención de un solo uso con estado y vigencia visibles.                                                                                  | experiencia personal de cliente           | `CANONICAL` |
| `VSCREEN-0111` | Historial de puntos y redenciones                     | `pass`              | Consultar movimientos propios de acumulación, ajuste y redención con referencia al hecho de origen.                                                             | experiencia personal de cliente           | `CANONICAL` |
| `VSCREEN-0112` | Perfil, privacidad y consentimientos                  | `pass`              | Administrar datos personales autogestionables, preferencias y consentimientos del cliente.                                                                      | experiencia personal de cliente           | `CANONICAL` |
| `VSCREEN-0113` | Registro y seguimiento de decisiones empresariales   | `viso`              | Crear, revisar, aprobar, versionar y seguir una decisión empresarial con autoridad, compromisos, evidencia y cierre explícitos.                                  | CAP-01 + `VPROC-0001`                     | `CANONICAL` |
| `VSCREEN-0114` | Solicitudes y certificaciones de acceso               | `viso`              | Gestionar solicitud, aprobación, vigencia, revisión periódica y revocación de accesos sin confundir catálogo con concesión.                                      | CAP-15 + `VPROC-0059`                     | `CANONICAL` |
| `VSCREEN-0115` | Gobierno de documentos y evidencia                    | `viso`              | Administrar metadatos, clasificación, custodia, retención, versión, acceso y disposición de documentos y evidencia.                                             | CAP-16 + `VPROC-0060`                     | `CANONICAL` |
| `VSCREEN-0116` | Registro de riesgos empresariales                     | `viso`              | Gestionar riesgos estratégicos, financieros, operativos, legales y tecnológicos con evaluación, tratamiento, responsable y seguimiento.                         | CAP-01.07 + `VPROC-0063`                  | `CANONICAL` |
| `VSCREEN-0117` | Requerimientos de asesores y autoridades              | `viso`              | Coordinar requerimientos, conceptos, entregables, vencimientos, comunicaciones y evidencia con asesores o autoridades.                                          | CAP-01.09 + `VPROC-0064`                  | `CANONICAL` |
| `VSCREEN-0118` | Gestión de desempeño y desarrollo                     | `viso`              | Administrar objetivos, retroalimentación, revisiones y decisiones sensibles de desarrollo con propósito y privacidad explícitos.                                | CAP-02.10 + `VPROC-0065`                  | `CANONICAL` |
| `VSCREEN-0119` | Asignación y control de elementos de protección       | `viso`              | Definir requisito, asignación, vigencia, entrega esperada, cambio y devolución de elementos de protección vinculados con inventario.                            | CAP-03.03 + `VPROC-0066`                  | `CANONICAL` |
| `VSCREEN-0120` | Mesa de servicio tecnológico                          | `viso`              | Priorizar, diagnosticar, asignar, resolver, validar y convertir en conocimiento solicitudes e incidentes tecnológicos.                                          | CAP-15 + `VPROC-0058`                     | `CANONICAL` |
| `VSCREEN-0121` | Continuidad, contingencia y recuperación              | `viso`              | Gestionar impacto, declaración, operación mínima, recuperación, reconciliación, ejercicio y aprendizaje de continuidad empresarial.                             | CAP-18 + `VPROC-0062`                     | `CANONICAL` |
| `VSCREEN-0122` | Privacidad, cumplimiento y conservación               | `viso`              | Gestionar solicitudes de titulares, obligaciones, retención, restricciones, revisiones y evidencia de cumplimiento.                                             | CAP-16 + gobierno de información          | `CANONICAL` |
| `VSCREEN-0123` | Gestión de comunicaciones internas                    | `viso`              | Preparar, segmentar, aprobar, publicar, retirar y auditar comunicaciones dirigidas a poblaciones laborales.                                                      | CAP-02 + comunicaciones laborales         | `CANONICAL` |
| `VSCREEN-0124` | Mis comunicados laborales                             | `anima`             | Consultar, confirmar lectura y actuar sobre comunicaciones laborales propias según vigencia y audiencia autorizada.                                             | CAP-02 + autoservicio laboral              | `CANONICAL` |
| `VSCREEN-0125` | Mi carnet laboral                                     | `anima`             | Presentar identificación laboral propia, vigencia y condiciones visibles sin convertirla en concesión de acceso.                                                | CAP-02 + identidad laboral                 | `CANONICAL` |
| `VSCREEN-0126` | Mis documentos laborales                              | `anima`             | Consultar, aportar y descargar únicamente documentos laborales propios autorizados con estado, vigencia y trazabilidad.                                         | CAP-02.11 + CAP-16                        | `CANONICAL` |
| `VSCREEN-0127` | Mi capacitación                                       | `anima`             | Consultar actividades asignadas, requisitos, avance, evidencia y vigencia de capacitación propia.                                                                | CAP-02.09 + experiencia personal laboral  | `CANONICAL` |
| `VSCREEN-0128` | Mis objetivos y retroalimentación                     | `anima`             | Consultar, aportar y aceptar objetivos o retroalimentación propios dentro del proceso sensible de desempeño aprobado.                                           | CAP-02.10 + `VPROC-0065`                  | `CANONICAL` |
| `VSCREEN-0129` | Mis solicitudes de soporte                            | `anima`             | Crear y seguir solicitudes tecnológicas propias, aportar evidencia y confirmar recuperación sin acceder a la mesa administrativa.                               | CAP-15 + `VPROC-0058`                     | `CANONICAL` |
| `VSCREEN-0130` | Mis reportes de seguridad y salud                     | `anima`             | Reportar una condición, incidente o emergencia laboral propia y consultar únicamente el seguimiento permitido.                                                  | CAP-03 + `VPROC-0013`                     | `CANONICAL` |
| `VSCREEN-0131` | Mis elementos de protección                           | `anima`             | Consultar requisitos y asignaciones propias y registrar entrega, aceptación, cambio o devolución autorizados.                                                   | CAP-03.03 + `VPROC-0066`                  | `CANONICAL` |
| `VSCREEN-0132` | Reservas de inventario                                | `nexo`              | Crear, priorizar, expirar, liberar o consumir reservas explícitas sin modificar la existencia física por el solo acto de reservar.                              | CAP-06.06 + inventario                    | `CANONICAL` |
| `VSCREEN-0133` | Planes y órdenes de mantenimiento de activos          | `nexo`              | Planear, asignar, ejecutar, probar y cerrar mantenimiento preventivo o correctivo con repuestos y retorno al servicio.                                           | CAP-07.07 + `VPROC-0030`                  | `CANONICAL` |
| `VSCREEN-0134` | Garantías, seguros y reclamaciones de activos         | `nexo`              | Gestionar cobertura, vigencia, documentos, reclamación, resultado y efecto sobre disponibilidad o disposición del activo.                                      | CAP-07 + `VPROC-0030`                     | `CANONICAL` |
| `VSCREEN-0135` | Kits y conjuntos                                      | `nexo`              | Definir kits e instancias, verificar componentes, completitud, préstamo, devolución y sustitución sin confundirlos con LPN.                                     | CAP-07.11 + `VPROC-0067`                  | `CANONICAL` |
| `VSCREEN-0136` | Flota y vehículos                                     | `nexo`              | Administrar identidad, condición, documentos, disponibilidad, custodio e incidencias de vehículos y equipos de transporte.                                     | CAP-07.12 + `VPROC-0031`                  | `CANONICAL` |
| `VSCREEN-0137` | Kilometraje y combustible                             | `nexo`              | Registrar lecturas, cargas, consumo, evidencia y alertas de rendimiento por vehículo sin confundir compra con consumo.                                          | CAP-07.12 + `VPROC-0031`                  | `CANONICAL` |
| `VSCREEN-0138` | Planeación de rutas y despachos                       | `nexo`              | Preparar ruta, vehículo, conductor, carga, secuencia, capacidad y restricciones antes de autorizar el despacho.                                                 | CAP-11 + `VPROC-0048`                     | `CANONICAL` |
| `VSCREEN-0139` | Ejecución de ruta y prueba de entrega                 | `nexo`              | Ejecutar paradas y registrar entrega, rechazo, novedad o retorno con ubicación, actor, tiempo y evidencia suficiente.                                           | CAP-11 + `VPROC-0049`                     | `CANONICAL` |
| `VSCREEN-0140` | Novedades, rechazos y retornos logísticos             | `nexo`              | Resolver excepciones de transporte y entrega conservando carga afectada, custodia, causa, decisión y reconciliación.                                             | CAP-11 + `VPROC-0049`                     | `CANONICAL` |
| `VSCREEN-0141` | Instalaciones, servicios y mantenimiento locativo     | `nexo`              | Gestionar limpieza, inspecciones, mantenimiento, plagas, servicios, calibración y cierre de novedades de instalaciones.                                         | CAP-13 + `VPROC-0055`                     | `CANONICAL` |
| `VSCREEN-0142` | Configuración de políticas y rutas logísticas         | `nexo`              | Versionar políticas de solicitud, abastecimiento, cumplimiento, rutas, sedes y productos habilitados para operación logística.                                  | CAP-06 + CAP-11                           | `CANONICAL` |
| `VSCREEN-0143` | Diseñador de etiquetas logísticas                     | `nexo`              | Diseñar, versionar, previsualizar y aprobar plantillas de etiqueta vinculadas con objetos logísticos autorizados.                                                | CAP-15 + impresión logística              | `CANONICAL` |
| `VSCREEN-0144` | Configuración y cola de impresión logística           | `nexo`              | Configurar impresoras y gestionar trabajos, reintentos, resultado y reimpresión sin convertir la cola en propietaria del documento.                              | CAP-15 + impresión logística              | `CANONICAL` |
| `VSCREEN-0145` | Contratos, precios y condiciones de proveedor         | `origo`             | Versionar contratos, listas de precio, impuestos, fletes, mínimos, vigencias y condiciones autorizadas por proveedor.                                           | CAP-05 + `VPROC-0020`                     | `CANONICAL` |
| `VSCREEN-0146` | Desempeño y reclamaciones de proveedor                | `origo`             | Analizar cumplimiento desde hechos y gestionar reclamaciones, respuestas, compromisos y resolución con evidencia.                                               | CAP-05 + abastecimiento                   | `CANONICAL` |
| `VSCREEN-0147` | Oportunidades y cotizaciones de catering o B2B        | `pulso`             | Calificar una oportunidad, preparar cotización y validar capacidad, condiciones, aprobaciones y vigencia antes del compromiso.                                  | CAP-09 + `VPROC-0041`                     | `CANONICAL` |
| `VSCREEN-0148` | Ejecución de catering o venta B2B                     | `pulso`             | Coordinar pedido, producción, entrega, facturación, cambios y cierre de un compromiso de catering o venta entre empresas.                                       | CAP-09 + `VPROC-0041`                     | `CANONICAL` |
| `VSCREEN-0149` | Operación de reservas y eventos                       | `pulso`             | Gestionar capacidad, confirmación, cambios, asistencia, servicio y comunicaciones de reservas o eventos.                                                        | CAP-10 + `VPROC-0047`                     | `CANONICAL` |
| `VSCREEN-0150` | Casos de reclamo y compensación                       | `pulso`             | Investigar reclamo, devolución o inconformidad, decidir compensación y verificar restitución y aprendizaje de causa.                                             | CAP-10 + `VPROC-0046`                     | `CANONICAL` |
| `VSCREEN-0151` | Coordinación de entrega mediante tercero              | `pulso`             | Gestionar asignación, seguimiento, prueba, novedad y conciliación de entregas ejecutadas por plataformas o transportadores externos.                             | CAP-11 + `VPROC-0050`                     | `CANONICAL` |
| `VSCREEN-0152` | Análisis de satisfacción y servicio                   | `pulso`             | Revisar mediciones, sesgos, causas y acciones de mejora sin confundir encuesta, reclamo, incentivo o compensación.                                               | CAP-10.06 + `VPROC-0068`                  | `CANONICAL` |
| `VSCREEN-0153` | Paquete laboral para pagos y beneficios               | `numera`            | Preparar, validar y reconciliar el paquete laboral autorizado que alimenta pagos y beneficios sin decidir novedades laborales.                                  | CAP-02 + `VPROC-0010`                     | `CANONICAL` |
| `VSCREEN-0154` | Facturas y documentos fiscales                        | `numera`            | Gestionar emisión o recepción, estado, referencia externa, notas y control de documentos fiscales sin confundirlos con obligación o pago.                       | CAP-12.06 + finanzas                      | `CANONICAL` |
| `VSCREEN-0155` | Tesorería y programación de pagos                     | `numera`            | Planear liquidez, vencimientos, lotes de pago, aprobaciones, ejecución externa y conciliación bancaria.                                                          | CAP-12.12 + `VPROC-0052`                  | `CANONICAL` |
| `VSCREEN-0156` | Presupuestos, escenarios y forecast                   | `numera`            | Crear, consolidar, revisar, aprobar, publicar y comparar versiones presupuestales, escenarios y proyecciones.                                                    | CAP-12.11 + `VPROC-0069`                  | `CANONICAL` |
| `VSCREEN-0157` | Impuestos y obligaciones de cumplimiento              | `numera`            | Gestionar calendario, bases, componentes, soportes, revisión y estado de obligaciones sin sustituir al emisor o presentador autorizado.                         | CAP-12.13 + finanzas                      | `CANONICAL` |
| `VSCREEN-0158` | Distribución y asignación de costos                   | `numera`            | Definir reglas versionadas y ejecutar distribuciones de costos compartidos con explicación y reversión controlada.                                              | CAP-12.10 + `VPROC-0054`                  | `CANONICAL` |
| `VSCREEN-0159` | Indicadores, análisis y planes de mejora              | `numera`            | Gestionar medición, análisis, decisión, acción de mejora y verificación del resultado con métricas y fuentes identificables.                                    | CAP-17 + `VPROC-0061`                     | `CANONICAL` |
| `VSCREEN-0160` | Inicio y selección del portal de compras              | `pass`              | Permitir al cliente escoger marca, sede o punto de atención y modalidad disponible antes de construir un pedido.                                                | CAP-09 + canal propio de cliente          | `CANONICAL` |
| `VSCREEN-0161` | Menú y catálogo comercial del cliente                 | `pass`              | Consultar oferta, disponibilidad, condiciones y detalle comercial publicados por PULSO para el contexto de compra elegido.                                     | CAP-09 + proyección de PULSO              | `CANONICAL` |
| `VSCREEN-0162` | Carrito y configuración del pedido                    | `pass`              | Construir la intención de compra con productos, cantidades, modificadores y observaciones antes de enviarla al proceso comercial.                               | CAP-09 + canal propio de cliente          | `CANONICAL` |
| `VSCREEN-0163` | Dirección, modalidad y programación de entrega        | `pass`              | Gestionar direcciones propias y seleccionar entrega, retiro o programación disponible sin gobernar rutas internas.                                              | CAP-09 + CAP-11                           | `CANONICAL` |
| `VSCREEN-0164` | Revisión, checkout e inicio de pago                   | `pass`              | Revisar pedido, cargos, datos requeridos y medio de pago e iniciar el comando hacia PULSO o proveedor autorizado.                                               | CAP-09 + `VPROC-0043`                     | `CANONICAL` |
| `VSCREEN-0165` | Confirmación de pedido y retorno de pago              | `pass`              | Mostrar aceptación, identificador, resultado confirmado o pendiente y próximos pasos sin declarar pago o venta no confirmados.                                  | CAP-09 + recibo de canal                  | `CANONICAL` |
| `VSCREEN-0166` | Mis pedidos y detalle                                 | `pass`              | Consultar pedidos propios, líneas, importes, modalidad, estados y soportes autorizados.                                                                          | CAP-09 + experiencia personal de cliente  | `CANONICAL` |
| `VSCREEN-0167` | Seguimiento de preparación y entrega del cliente      | `pass`              | Consultar una proyección del avance, entrega o retiro y las novedades visibles sin modificar directamente la operación interna.                                | CAP-09 + CAP-11                           | `CANONICAL` |
| `VSCREEN-0168` | Chat y comunicación asociada al pedido                | `pass`              | Intercambiar mensajes y evidencia vinculados con un pedido propio, conservando participantes, consentimiento y trazabilidad.                                    | CAP-10 + servicio al cliente              | `CANONICAL` |
| `VSCREEN-0169` | Mis reclamos y casos de servicio                      | `pass`              | Presentar reclamo, aportar evidencia y consultar decisión, compensación y cierre permitidos del caso propio.                                                    | CAP-10 + `VPROC-0046`                     | `CANONICAL` |
| `VSCREEN-0170` | Mis reservas y eventos                                | `pass`              | Solicitar, confirmar, modificar o cancelar reservas propias dentro de capacidad y condiciones publicadas.                                                       | CAP-10 + `VPROC-0047`                     | `CANONICAL` |
| `VSCREEN-0171` | Calificación y satisfacción                           | `pass`              | Registrar una medición de satisfacción propia con consentimiento y contexto, separada de reclamo, incentivo y compensación.                                    | CAP-10.06 + `VPROC-0068`                  | `CANONICAL` |
| `VSCREEN-0172` | Comunicaciones y notificaciones del cliente           | `pass`              | Consultar comunicaciones comerciales, operativas y de servicio propias con preferencia, consentimiento, vigencia y origen visibles.                            | CAP-10 + comunicaciones de cliente        | `CANONICAL` |
| `VSCREEN-0173` | Trazabilidad e investigación de lote                  | `fogo`              | Reconstruir materiales, receta, ejecución, calidad, destinos y evidencia de un lote para investigar una desviación o retiro.                                   | CAP-08 + producción                       | `CANONICAL` |
| `VSCREEN-0174` | Controles operativos de inocuidad                     | `fogo`              | Ejecutar listas, mediciones, verificaciones y acciones de inocuidad vinculadas con producción, producto, área y vigencia.                                       | CAP-08 + inocuidad                        | `CANONICAL` |
| `VSCREEN-0175` | Seguridad de cuenta y sesiones                        | `shell`             | Permitir gestionar recuperación, factores, sesiones, dispositivos personales y cierre de cuenta sin administrar permisos empresariales.                        | AUTH + privacidad transversal             | `CANONICAL` |

---

#### 13. SCREEN-COVERAGE-ADMISSION-REGISTER-001

Este registro demuestra que cada proceso aprobado fue considerado al admitir pantallas. **No sustituye** el vínculo canónico pantalla ↔ proceso de `PROC-SCREEN-003`: los grupos solo acreditan que existe una superficie candidata suficiente o una excepción deliberada, trazable y cerrada por defecto.

| Procesos fuente       | Disposición de admisión       | Aplicaciones con superficie candidata | Evidencia de cobertura de identidad                                                                                                   |
| --------------------- | ----------------------------- | ------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0001` a `0004` | `COVERED`                     | `viso`                                | decisiones, estructura, políticas, compromisos y seguimiento                                                                         |
| `VPROC-0005` a `0014` | `COVERED_WITH_DEFERRED_EDGE`  | `viso`, `anima`, `numera`             | selección administrativa, vinculación, trabajo, asistencia, novedades, pagos laborales, retiro, SST e higiene                        |
| `VPROC-0015` a `0018` | `COVERED`                     | `nexo`, `fogo`, `pulso`               | producto, especificaciones, recetas, producción y publicación comercial                                                              |
| `VPROC-0019` a `0022` | `COVERED`                     | `origo`                               | necesidad, proveedor, condiciones, orden, aprobación, recepción y diferencias                                                        |
| `VPROC-0023` a `0032` | `COVERED`                     | `nexo`                                | ubicación, movimientos, conteo, condición, remisión, activos, mantenimiento, flota y reutilizables                                   |
| `VPROC-0033` a `0037` | `COVERED`                     | `fogo`                                | planeación, lote, calidad, empaque, trazabilidad, reproceso y cierre productivo                                                      |
| `VPROC-0038` a `0044` | `COVERED`                     | `pulso`, `pass`                       | salón, mostrador, canal propio o externo, catering, cambios, pago y caja                                                             |
| `VPROC-0045` a `0047` | `COVERED`                     | `pulso`, `pass`                       | fidelización, reclamos, reservas, eventos y comunicaciones                                                                            |
| `VPROC-0048` a `0050` | `COVERED`                     | `nexo`, `pulso`, `pass`               | planeación y ejecución logística, prueba, retorno, tercero y seguimiento visible al cliente                                           |
| `VPROC-0051` a `0054` | `COVERED`                     | `numera`                              | hechos económicos, obligaciones, cartera, tesorería, conciliaciones, costos y cierre                                                 |
| `VPROC-0055`           | `COVERED`                     | `nexo`                                | instalaciones, limpieza, mantenimiento, plagas, servicios y calibración                                                              |
| `VPROC-0056` a `0057` | `DEFERRED_APP_SCOPE`          | `aura`                                | procesos preservados; AURA es canónica pero permanece funcionalmente diferida y sin pantallas admitidas                              |
| `VPROC-0058` a `0060` | `COVERED`                     | `viso`, `anima`                       | mesa y autoservicio de soporte, accesos, documentos y evidencia                                                                       |
| `VPROC-0061`           | `COVERED`                     | `numera`                              | indicadores, análisis, decisión, mejora y verificación                                                                                |
| `VPROC-0062` a `0066` | `COVERED`                     | `viso`, `anima`                       | continuidad, riesgos empresariales, autoridades, desempeño y elementos de protección                                                  |
| `VPROC-0067`           | `COVERED`                     | `nexo`                                | definición, instancia y completitud de kits                                                                                           |
| `VPROC-0068`           | `COVERED`                     | `pulso`, `pass`                       | captura personal y análisis operativo de satisfacción                                                                                 |
| `VPROC-0069`           | `COVERED`                     | `numera`                              | presupuesto, versión, aprobación, vigencia, consumo, escenario y forecast                                                             |

##### 13.1 Excepciones deliberadas de admisión

| Cobertura diferida                      | Estado cerrado por defecto     | Motivo no contradictorio                                                                                       | Puerta propietaria                                                                 |
| --------------------------------------- | ------------------------------ | -------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- |
| administración de contenido y campañas | `DEFERRED_APP_SCOPE`           | AURA pertenece al catálogo canónico, pero su alcance funcional continúa diferido                              | tareas `AURA-AUD-*`, `INT-MKT-*` y decisión de continuidad funcional de AURA       |
| oportunidades de canales digitales     | `DEFERRED_APP_SCOPE`           | `VPROC-0057` conserva propiedad en AURA sin autorizar interfaz, despliegue o datos productivos                 | tareas `AURA-AUD-*`, `INT-MKT-*` y posterior admisión mediante `PROC-SCREEN-*`     |
| experiencia personal del candidato     | `FUTURE_PRODUCT_NOT_APP_CODE`  | `vento-talento` y el esquema `talento` son base futura; no existe `app_code` canónico habilitado para asignar | `CAP-TAL-001` a `CAP-TAL-006` y gobierno del catálogo de aplicaciones              |
| superficies públicas de Vento Group    | `EXTERNAL_CHANNEL`             | el portal corporativo no se convierte por inferencia en aplicación interna ni en propietario del proceso     | arquitectura de canal externo y handoffs de E3/E4                                  |
| VITAL                                  | `OUTSIDE_VENTO_OS`             | producto separado, explícitamente fuera de Vento OS                                                           | gobierno propio de VITAL                                                           |

Una nueva capacidad o proceso no podrá declarar completa su cobertura de pantallas si no añade una identidad canónica o una excepción con estado, motivo y puerta propietaria. `NO_EVALUADO`, texto libre sin tarea y ausencia silenciosa quedan prohibidos.

---

#### 14. Decisiones de frontera relevantes

1. **Reclutamiento y vinculación:** se ubican en `viso`; `talento` no se crea como aplicación implícita.
2. **Experiencia propia del trabajador:** se ubica en `anima`; VISO conserva la administración de poblaciones.
3. **Recepción de compra:** pertenece a `origo`; el efecto posterior sobre inventario se consulta o confirma desde `nexo` sin repetir la recepción física.
4. **Producto físico y presentación:** pertenecen a `nexo`; la oferta comercial publicada pertenece a `pulso`; escenarios económicos pertenecen a `numera`.
5. **Recetas y producción:** pertenecen a `fogo`; NEXO consume productos, existencias y resultados logísticos sin crear un recetario paralelo.
6. **Fidelización y compra del cliente:** identificación, venta, pedido, pago y redención operativa pertenecen a `pulso`; PASS presenta autoservicio, catálogo publicado, intención de compra, seguimiento, puntos, beneficios y casos propios mediante comandos y proyecciones.
7. **Hechos financieros:** `numera` consume eventos de origen y concilia; no recrea ventas, recepciones, movimientos o lotes como hechos manuales nuevos.
8. **Hubs y notificaciones:** pertenecen a `shell` solo mientras no ejecuten la mutación empresarial de destino.
9. **AURA:** es aplicación canónica diferida; sus procesos no autorizan todavía pantallas, datos o despliegue.
10. **TALENTO:** su base técnica futura no crea un `app_code`; VISO conserva reclutamiento administrativo y la experiencia candidata queda diferida hasta una decisión de catálogo.

---

#### 15. Transferencia de una pantalla entre aplicaciones

Una pantalla puede conservar su `screen_id` al cambiar de aplicación únicamente cuando permanece estable su intención principal, objeto central, entrada, salida y efecto empresarial.

La transferencia exige:

1. propuesta documentada;
2. análisis de consumidores y enlaces;
3. compatibilidad de permisos y contexto;
4. plan de transición de rutas, telemetría y pruebas;
5. actualización de `primary_application_id` y versión del vínculo;
6. historial de aplicación anterior y fecha efectiva;
7. ausencia de dos pantallas canónicas activas con la misma identidad.

Cuando el cambio altera materialmente la identidad, se crea otro `VSCREEN-*` y se aplican `supersedes` y `replaced_by` conforme a `PROC-SCREEN-001`.

---

#### 16. Validaciones estructurales y semánticas obligatorias

La automatización posterior deberá comprobar:

1. existen exactamente 175 registros en este corte;
2. los identificadores son `VSCREEN-0001` a `VSCREEN-0175` sin duplicados ni saltos;
3. cada pantalla tiene exactamente una aplicación primaria;
4. toda aplicación primaria pertenece al catálogo permitido;
5. ningún registro usa `talento`, VITAL o un código inventado;
6. `aura` conserva cero pantallas mientras su alcance funcional permanezca diferido;
7. la distribución por aplicación coincide con el resumen;
8. ninguna aplicación se deriva del rango numérico;
9. no existen dos registros activos con la misma declaración de identidad;
10. handoffs y proyecciones no crean escrituras propietarias duplicadas;
11. `screen_id + primary_application_id` no se utiliza como autorización;
12. toda transferencia conserva historial y no reutiliza IDs;
13. las proyecciones técnicas o constantes se derivan del catálogo canónico;
14. los vínculos canónicos exactos con procesos, pasos, clasificaciones, actores y permisos continúan vacíos hasta sus tareas propietarias;
15. `SCREEN-COVERAGE-ADMISSION-REGISTER-001` cubre `VPROC-0001` a `VPROC-0069` sin saltos;
16. toda excepción de cobertura declara estado cerrado, motivo y puerta propietaria;
17. PASS conserva superficies separadas para compra, checkout, pedidos, seguimiento, chat, casos, reservas y satisfacción;
18. las superficies futuras de TALENTO no reciben aplicación primaria mientras no exista `app_code` canónico;
19. una capacidad interactiva nueva no puede quedar ausente sin pantalla o excepción deliberada;
20. las declaraciones cuantitativas, el resumen por aplicación y el catálogo físico coinciden.

---

#### 17. Seguridad y autorización

Vincular una pantalla con una aplicación no concede:

- visibilidad;
- permiso de lectura;
- permiso de acción;
- alcance territorial;
- acceso por rol;
- acceso desde dispositivo compartido;
- capacidad para construir una URL directa.

Toda apertura y acción continuará resolviendo identidad, actor, permiso, contexto, recurso, territorio, versión y estado. La aplicación primaria tampoco podrá confiar en que un handoff desde SHELL u otra aplicación ya autorizó la operación.

---

#### 18. Decisiones reservadas y carryovers

| Pendiente                                        | Propietario exacto                                    |
| ------------------------------------------------ | ----------------------------------------------------- |
| vincular cada pantalla con uno o varios procesos | `PROC-SCREEN-003`                                     |
| vincular cada pantalla con pasos exactos         | `PROC-SCREEN-004`                                     |
| clasificar carril y tipo                         | `PROC-SCREEN-005` a `PROC-SCREEN-011`                 |
| definir actores                                  | `PROC-SCREEN-012`                                     |
| definir dispositivos                             | `PROC-SCREEN-013`                                     |
| definir acciones                                 | `PROC-SCREEN-014` y `PROC-SCREEN-015`                 |
| definir entrada, salida y estados                | `PROC-SCREEN-016` a `PROC-SCREEN-021`                 |
| definir sensibilidad y permisos                  | `PROC-SCREEN-022` a `PROC-SCREEN-024`                 |
| vincular operaciones técnicas                    | `PROC-SCREEN-025`                                     |
| mapear rutas y pantallas legacy                  | `PROC-SCREEN-026`                                     |
| definir métricas y aceptación                    | `PROC-SCREEN-027` y `PROC-SCREEN-028`                 |
| decidir continuidad funcional de AURA            | tareas canónicas de AURA antes de admitir `VSCREEN-*` |
| crear tipos, constantes y validadores            | paquetes de implementación E5 y CI                    |
| validar fronteras con usuarios                   | `UX-QA-*` y pilotos E5                                |

No queda pendiente narrativo sin tarea o puerta de resolución.

---

#### 19. Requisitos de prueba derivados

**Resultado corregido:** GENERA 44 REQUISITOS DE PRUEBA.

Se incorporan `TREQ-UX-509` a `TREQ-UX-552` al Registro Canónico completo. Permanecen en estado `IDENTIFICADO`; la vinculación exacta con procesos continúa en `PROC-SCREEN-003`, mientras automatización, implementación y certificación corresponden a paquetes E5, BLOQUE U y pilotos.

---

#### 20. Criterios de aceptación

- [x] Se consume el formato y gobierno de `PROC-SCREEN-001`.
- [x] Se define aplicación primaria sin confundirla con repositorio, tabla, servicio o permiso.
- [x] Se materializan `VSCREEN-0001` a `VSCREEN-0175` sin duplicados ni saltos.
- [x] Cada pantalla tiene exactamente una aplicación primaria.
- [x] Se utilizan únicamente códigos canónicos aprobados.
- [x] Se asignan 175 pantallas a 9 aplicaciones habilitadas.
- [x] Se reconoce que el catálogo de BLOQUE C contiene 10 aplicaciones y que `aura` conserva cero pantallas por su estado funcional diferido.
- [x] No se crea una aplicación `talento` por inferencia.
- [x] Se preservan los límites entre VISO, ANIMA, NEXO, FOGO, ORIGO, PULSO, NUMERA, PASS y SHELL.
- [x] Se diferencian handoff, proyección, componente compartido y transferencia.
- [x] Se impide duplicar fuentes de verdad en pantallas transversales.
- [x] Los rangos iniciales no se convierten en reservas por aplicación.
- [x] Se definen validaciones estructurales y de seguridad.
- [x] Se reconcilian las capacidades interactivas y `VPROC-0001` a `VPROC-0069` mediante cobertura o excepción deliberada.
- [x] Se incorporan las superficies de compra, pedido, entrega, servicio, reserva y satisfacción de PASS sin transferirle propiedad comercial.
- [x] Se separan casos administrativos, soporte tecnológico e instalaciones.
- [x] TALENTO y los canales externos quedan trazados sin crear aplicaciones por inferencia.
- [x] No se anticipan procesos, pasos, clasificaciones, actores, dispositivos, acciones, permisos ni integraciones.
- [x] Se generan `TREQ-UX-509` a `TREQ-UX-552`.
- [x] No se implementa código ni se avanza a `PROC-SCREEN-003`.

---

#### 21. Resultado y continuidad

```text
PROC-SCREEN-001 APROBADA
PROC-SCREEN-002 APROBADA
PROC-SCREEN-003 NO INICIADA
```

La continuidad documental pasa exclusivamente a:

```text
PROC-SCREEN-003 — Vincular cada pantalla con un proceso
```


### ✅ PROC-SCREEN-003 — Vincular cada pantalla con un proceso

**Estado propuesto:** APROBADA

**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal

**Marcador exacto que reemplaza:** `### [ ] PROC-SCREEN-003 — Vincular cada pantalla con un proceso`

**Tarea anterior:** `PROC-SCREEN-002 — Vincular cada pantalla con una aplicación` — APROBADA

**Siguiente tarea reservada:** `PROC-SCREEN-004 — Vincular cada pantalla con un paso del proceso` — NO INICIADA

**Artefactos lógicos contenidos en esta propuesta:**

- `SCREEN-PROCESS-BINDING-CONTRACT-001`;
- `SCREEN-PROCESS-BINDING-REGISTER-001`;
- `SCREEN-PROCESS-COVERAGE-MATRIX-001`;
- `SCREEN-CROSS-OWNER-PROJECTION-RULES-001`;
- `SCREEN-PROCESS-CHANGE-POLICY-001`;
- `SCREEN-PROCESS-BINDING-VALIDATION-GATE-001`.

**Resultado cuantitativo propuesto:** **175 pantallas canónicas**, **175 vínculos primarios** y **268 vínculos relacionados**; **67 procesos activos** quedan cubiertos y `VPROC-0056` y `VPROC-0057` permanecen diferidos junto con AURA.

**Naturaleza:** contrato documental entre identidades `VSCREEN-*` y procesos `VPROC-*`. No vincula todavía pasos, carriles UX, actores, dispositivos, acciones, estados, sensibilidad, permisos, rutas ni operaciones técnicas.

**Cambios en código de producto, componentes, rutas, repositorios consumidores, Supabase, tablas, migraciones, RLS, RPC, eventos, analítica o producción:** no autorizados por esta tarea. Los validadores del compilador documental sí forman parte de la puerta de integridad.

---

#### 1. Propósito

Vincular cada pantalla canónica con el proceso empresarial cuyo resultado principal presenta, inicia, ejecuta, supervisa o proyecta, sin confundir:

```text
PANTALLA
≠
PROCESO
≠
APLICACION PROPIETARIA DEL PROCESO
≠
PASO
≠
PERMISO
```

La relación responde **qué proceso explica la existencia de la pantalla**. No concede autorización, no mueve la propiedad del proceso y no afirma que toda la ejecución ocurra dentro de esa pantalla.

---

#### 2. Dependencias consumidas

La propuesta consume, sin reabrir:

- `PROC-SCREEN-001` y la identidad estable `VSCREEN-*`;
- `PROC-SCREEN-002`, `SCREEN-CANONICAL-CATALOG-001` y la aplicación primaria de cada pantalla;
- `PROC-CAT-001` a `PROC-CAT-020`;
- `VPROC-0001` a `VPROC-0069`, sus propietarias y fronteras;
- `PROC-ACTOR-001` a `PROC-ACTOR-010`;
- `UX-BASE-001` a `UX-BASE-015`;
- `UX-STATION-001` a `UX-STATION-012`;
- `UX-ADMIN-001` a `UX-ADMIN-005`;
- las capacidades E1, contratos TALENTO–VISO–ANIMA y decisiones PASS–PULSO–NEXO.

---

#### 3. Alcance

Esta propuesta:

1. incorpora `primary_process_id` a cada `VSCREEN-*`;
2. permite `related_process_ids[]` solo cuando la pantalla compone, supervisa o proyecta otros procesos;
3. exige una modalidad de vínculo explícita;
4. materializa 175 vínculos primarios sin duplicados ni omisiones;
5. conserva la aplicación propietaria de cada proceso;
6. cubre los 67 procesos activos;
7. conserva `VPROC-0056` y `VPROC-0057` como excepciones diferidas de AURA;
8. define cómo versionar un cambio de proceso sin reutilizar silenciosamente la identidad de pantalla;
9. deja pasos y decisiones de interacción reservados a tareas posteriores;
10. integra una puerta automática de coherencia.

---

#### 4. Exclusiones

Esta tarea no:

- vincula pasos exactos de un proceso;
- convierte una pantalla en proceso;
- cambia la propietaria aprobada de un `VPROC-*`;
- concede lectura, acción o acceso;
- decide actores, dispositivos o estaciones;
- clasifica pantallas por carril UX;
- define acciones principales o secundarias;
- define estados de interfaz;
- vincula APIs, Server Actions, RPC, eventos o tablas;
- mapea rutas o componentes legacy;
- activa AURA;
- crea `talento` como aplicación;
- implementa las pantallas en repositorios.

---

#### 5. Contrato canónico de vínculo

Cada registro incorpora:

| Campo                              | Obligación                                                                                                  |
| ---------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| `screen_id`                        | `VSCREEN-*` canónico y único                                                                                |
| `primary_process_id`               | exactamente un `VPROC-*` existente que explica el resultado principal                                      |
| `related_process_ids[]`            | cero o más procesos existentes, distintos del primario y sin duplicados                                    |
| `process_binding_mode`             | modalidad canónica que explica la relación entre pantalla, aplicación y proceso                            |
| `process_binding_version`          | versión semántica del vínculo                                                                               |
| `process_binding_reason`           | fundamento funcional verificable                                                                           |
| `process_binding_task`             | tarea que propone, aprueba o modifica la relación                                                           |
| `process_owner_application_id`     | propietaria aprobada en `PROC-CAT-005`; se consulta, no se redefine                                         |
| `process_binding_status`           | `PROPOSED`, `CANONICAL`, `CHANGE_PROPOSED`, `SUPERSEDED` o `RETIRED_WITH_SCREEN`                            |

Valores de esta propuesta:

```text
process_binding_version: 1.0.0
process_binding_status: PROPOSED
process_binding_task: PROC-SCREEN-003
decision_record: INITIAL_SCREEN_PROCESS_BINDING
```

---

#### 6. Modalidades permitidas

| Modalidad                  | Uso                                                                                                                     |
| -------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| `OWNER_WORKSPACE`          | la pantalla vive en la aplicación propietaria del proceso y presenta trabajo propio                                    |
| `TRANSVERSAL_ENTRY`        | SHELL presenta entrada, contexto, notificación o recuperación y entrega el control a la propietaria                     |
| `SUPERVISION_SURFACE`      | una aplicación administrativa supervisa o corrige un proceso gobernado por otra aplicación sin duplicar el hecho        |
| `PERSONAL_CHANNEL`         | ANIMA presenta o inicia la experiencia propia del trabajador frente a un proceso laboral gobernado por otra aplicación |
| `CUSTOMER_CHANNEL`         | PASS presenta o inicia la experiencia propia del cliente frente a un proceso comercial gobernado por PULSO o NEXO       |

La modalidad no es un permiso ni reemplaza `primary_application_id`.

---

#### 7. Regla para escoger el proceso primario

Se escogerá, en orden:

1. el proceso cuyo resultado principal reconoce la persona;
2. el proceso que recibe la acción o intención principal;
3. el proceso que conserva el caso o compromiso empresarial;
4. el proceso que gobierna el cierre visible;
5. el proceso que seguiría existiendo aunque la pantalla cambiara de ruta o componente.

No se escogerá por:

- repositorio actual;
- tabla consultada;
- componente reutilizado;
- primer dato visible;
- aplicación desde la que se enlaza;
- rol de la persona;
- proceso técnicamente más cercano;
- conveniencia para reducir vínculos.

---

#### 8. Procesos relacionados

`related_process_ids[]` se utilizará únicamente cuando otro proceso:

- aporte una proyección necesaria;
- reciba un handoff explícito;
- sea supervisado desde la pantalla;
- produzca un efecto derivado visible;
- comparta un caso sin perder su propia propiedad.

Un proceso relacionado no convierte la pantalla en su espacio de trabajo primario. Los pasos exactos permanecen reservados a `PROC-SCREEN-004`.

---

#### 9. SCREEN-PROCESS-BINDING-REGISTER-001

| Screen ID | Pantalla | Aplicación | Proceso primario | Procesos relacionados | Modalidad | Fundamento |
| --- | --- | --- | --- | --- | --- | --- |
| `VSCREEN-0001` | Hub Vento OS | `shell` | `VPROC-0059` | `VPROC-0004`, `VPROC-0058`, `VPROC-0062` | `TRANSVERSAL_ENTRY` | Resuelve acceso y conduce a trabajo propietario sin ejecutarlo en SHELL. |
| `VSCREEN-0002` | Inicio de sesión y recuperación | `shell` | `VPROC-0059` | — | `TRANSVERSAL_ENTRY` | La autenticación habilita el ciclo de acceso, pero no concede autoridad empresarial. |
| `VSCREEN-0003` | Resolución de contexto y acceso | `shell` | `VPROC-0059` | `VPROC-0003` | `TRANSVERSAL_ENTRY` | Explica alcance efectivo y políticas aplicables antes del handoff. |
| `VSCREEN-0004` | Activación de dispositivo compartido | `shell` | `VPROC-0059` | `VPROC-0058` | `TRANSVERSAL_ENTRY` | Activa una sesión técnica controlada y deriva incidencias al proceso de soporte. |
| `VSCREEN-0005` | Bandeja transversal de tareas y notificaciones | `shell` | `VPROC-0004` | `VPROC-0058`, `VPROC-0062` | `TRANSVERSAL_ENTRY` | Presenta compromisos y alertas y entrega cada ejecución a su aplicación propietaria. |
| `VSCREEN-0006` | Centro de soporte y diagnóstico | `shell` | `VPROC-0058` | `VPROC-0062` | `TRANSVERSAL_ENTRY` | Inicia diagnóstico y recuperación sin absorber el caso tecnológico o de continuidad. |
| `VSCREEN-0007` | Inicio ejecutivo y gerencial | `viso` | `VPROC-0001` | `VPROC-0061`, `VPROC-0063` | `OWNER_WORKSPACE` | Consolida decisiones, indicadores y riesgos que requieren seguimiento directivo. |
| `VSCREEN-0008` | Estructura organizativa | `viso` | `VPROC-0002` | — | `OWNER_WORKSPACE` | Mantiene la estructura canónica sin derivar autorización de la jerarquía. |
| `VSCREEN-0009` | Políticas, delegaciones y límites | `viso` | `VPROC-0003` | `VPROC-0059` | `OWNER_WORKSPACE` | Gobierna políticas y delegaciones que luego condicionan accesos. |
| `VSCREEN-0010` | Compromisos y transferencias internas | `viso` | `VPROC-0004` | `VPROC-0001` | `OWNER_WORKSPACE` | Conserva responsable, entrega, aceptación y cierre transversal. |
| `VSCREEN-0011` | Embudo de candidatos | `viso` | `VPROC-0005` | — | `OWNER_WORKSPACE` | Organiza necesidad, vacante, candidatura y etapa sin crear vínculo laboral. |
| `VSCREEN-0012` | Caso de selección | `viso` | `VPROC-0005` | `VPROC-0060` | `OWNER_WORKSPACE` | Evalúa y decide con evidencia sin convertir al candidato en trabajador. |
| `VSCREEN-0013` | Vinculación e incorporación | `viso` | `VPROC-0006` | `VPROC-0059`, `VPROC-0060` | `OWNER_WORKSPACE` | Orquesta vínculo, documentos y habilitación inicial. |
| `VSCREEN-0014` | Directorio y expediente laboral | `viso` | `VPROC-0006` | `VPROC-0007`, `VPROC-0009`, `VPROC-0011`, `VPROC-0060` | `OWNER_WORKSPACE` | Conserva el expediente laboral y sus episodios sin mezclar solicitudes personales. |
| `VSCREEN-0015` | Programación laboral | `viso` | `VPROC-0007` | `VPROC-0009` | `OWNER_WORKSPACE` | Publica asignaciones y programación con historial. |
| `VSCREEN-0016` | Revisión de asistencia | `viso` | `VPROC-0008` | `VPROC-0007`, `VPROC-0009` | `SUPERVISION_SURFACE` | Supervisa y corrige hechos de ANIMA mediante decisión autorizada, sin reescribirlos. |
| `VSCREEN-0017` | Novedades, ausencias y reemplazos | `viso` | `VPROC-0009` | `VPROC-0007`, `VPROC-0008` | `OWNER_WORKSPACE` | Resuelve el caso laboral y sus efectos sobre programación y asistencia. |
| `VSCREEN-0018` | Retiro y revocación coordinada | `viso` | `VPROC-0011` | `VPROC-0029`, `VPROC-0059`, `VPROC-0060` | `OWNER_WORKSPACE` | Coordina cierre laboral, devolución, revocación y evidencia. |
| `VSCREEN-0019` | Catálogo de roles y permisos | `viso` | `VPROC-0059` | `VPROC-0003` | `OWNER_WORKSPACE` | Gobierna definición y vigencia de acceso tecnológico. |
| `VSCREEN-0020` | Perfil de acceso del trabajador | `viso` | `VPROC-0059` | `VPROC-0006`, `VPROC-0007` | `OWNER_WORKSPACE` | Vincula autoridad laboral vigente con solicitudes y revocaciones de acceso. |
| `VSCREEN-0021` | Simulación de permisos y conflictos | `viso` | `VPROC-0059` | `VPROC-0003` | `OWNER_WORKSPACE` | Evalúa alcance y conflictos sin conceder permisos por simulación. |
| `VSCREEN-0022` | Gobierno de dispositivos compartidos | `viso` | `VPROC-0059` | `VPROC-0058` | `OWNER_WORKSPACE` | Gobierna habilitación, vigencia y revocación de dispositivos compartidos. |
| `VSCREEN-0023` | Riesgos de seguridad y salud | `viso` | `VPROC-0012` | `VPROC-0063` | `OWNER_WORKSPACE` | Mantiene riesgos SST, controles y acciones correctivas. |
| `VSCREEN-0024` | Incidentes y emergencias | `viso` | `VPROC-0013` | `VPROC-0062` | `OWNER_WORKSPACE` | Conserva respuesta, expediente, investigación y seguimiento. |
| `VSCREEN-0025` | Controles de higiene y cumplimiento | `viso` | `VPROC-0014` | `VPROC-0012` | `OWNER_WORKSPACE` | Gobierna obligaciones y hallazgos sin sustituir el control operativo de dominio. |
| `VSCREEN-0026` | Bandeja de casos administrativos transversales | `viso` | `VPROC-0004` | `VPROC-0060`, `VPROC-0063`, `VPROC-0064` | `OWNER_WORKSPACE` | Coordina casos administrativos sin mezclarlos con soporte o instalaciones. |
| `VSCREEN-0027` | Inicio personal del trabajador | `anima` | `VPROC-0007` | `VPROC-0008`, `VPROC-0009` | `PERSONAL_CHANNEL` | Presenta al trabajador su programación, asistencia y solicitudes propias. |
| `VSCREEN-0028` | Registro de entrada, pausa y salida | `anima` | `VPROC-0008` | — | `OWNER_WORKSPACE` | Captura hechos personales e inmutables de asistencia. |
| `VSCREEN-0029` | Mi programación | `anima` | `VPROC-0007` | — | `PERSONAL_CHANNEL` | Proyecta la programación publicada por VISO sin mantener otra fuente. |
| `VSCREEN-0030` | Mi asistencia y solicitud de corrección | `anima` | `VPROC-0008` | `VPROC-0009` | `OWNER_WORKSPACE` | Presenta hechos propios e inicia correcciones trazables. |
| `VSCREEN-0031` | Mis novedades, permisos y ausencias | `anima` | `VPROC-0009` | `VPROC-0007` | `PERSONAL_CHANNEL` | Inicia y consulta el caso personal cuya decisión gobierna VISO. |
| `VSCREEN-0032` | Mi perfil laboral | `anima` | `VPROC-0006` | `VPROC-0011` | `PERSONAL_CHANNEL` | Proyecta vínculo vigente y datos personales permitidos. |
| `VSCREEN-0033` | Resumen de inventario y abastecimiento interno | `nexo` | `VPROC-0028` | `VPROC-0019`, `VPROC-0024`, `VPROC-0025` | `OWNER_WORKSPACE` | Resume necesidades, existencias y movimientos sin crear compras. |
| `VSCREEN-0034` | Catálogo de productos físicos | `nexo` | `VPROC-0015` | `VPROC-0018` | `OWNER_WORKSPACE` | Mantiene identidad física, presentación y relación con especificaciones. |
| `VSCREEN-0035` | Editor de producto, unidad y presentación | `nexo` | `VPROC-0015` | — | `OWNER_WORKSPACE` | Edita el maestro físico y sus equivalencias. |
| `VSCREEN-0036` | Especificaciones y criterios de calidad | `nexo` | `VPROC-0018` | `VPROC-0015`, `VPROC-0035` | `OWNER_WORKSPACE` | Mantiene especificación maestra y criterios consumidos por calidad. |
| `VSCREEN-0037` | Catálogo de ubicaciones | `nexo` | `VPROC-0023` | — | `OWNER_WORKSPACE` | Gobierna ubicaciones y condiciones sin confundirlas con existencia. |
| `VSCREEN-0038` | Identificación y detalle de ubicación | `nexo` | `VPROC-0023` | `VPROC-0024` | `OWNER_WORKSPACE` | Identifica la ubicación y muestra movimientos autorizados relacionados. |
| `VSCREEN-0039` | Consulta de existencias | `nexo` | `VPROC-0024` | `VPROC-0025`, `VPROC-0027` | `OWNER_WORKSPACE` | Proyecta saldo desde movimientos y condición física. |
| `VSCREEN-0040` | Conteo de inventario | `nexo` | `VPROC-0026` | — | `OWNER_WORKSPACE` | Registra observaciones de conteo sin ajustar automáticamente. |
| `VSCREEN-0041` | Revisión de conteo y diferencias | `nexo` | `VPROC-0026` | `VPROC-0060` | `OWNER_WORKSPACE` | Investiga diferencias y conserva evidencia. |
| `VSCREEN-0042` | Caso de ajuste de inventario | `nexo` | `VPROC-0026` | `VPROC-0051` | `OWNER_WORKSPACE` | Separa la decisión de ajuste de la observación y del efecto económico. |
| `VSCREEN-0043` | Confirmación de entrada a inventario | `nexo` | `VPROC-0024` | `VPROC-0022` | `OWNER_WORKSPACE` | Registra el efecto físico después de la aceptación de ORIGO. |
| `VSCREEN-0044` | Retiro y consumo de existencias | `nexo` | `VPROC-0025` | `VPROC-0034` | `OWNER_WORKSPACE` | Conserva origen, unidad, destino y motivo del retiro. |
| `VSCREEN-0045` | Traslado interno de existencias | `nexo` | `VPROC-0025` | `VPROC-0023` | `OWNER_WORKSPACE` | Ejecuta traslado correlacionado entre ubicaciones. |
| `VSCREEN-0046` | Solicitud de remisión | `nexo` | `VPROC-0028` | — | `OWNER_WORKSPACE` | Inicia abastecimiento interno con cantidades conciliables. |
| `VSCREEN-0047` | Preparación de remisión | `nexo` | `VPROC-0028` | `VPROC-0025` | `OWNER_WORKSPACE` | Reserva y prepara existencias sin anticipar despacho. |
| `VSCREEN-0048` | Carga y despacho de remisión | `nexo` | `VPROC-0028` | `VPROC-0048` | `OWNER_WORKSPACE` | Entrega custodia al tránsito y, cuando aplica, a la ruta planificada. |
| `VSCREEN-0049` | Seguimiento de remisión en tránsito | `nexo` | `VPROC-0028` | `VPROC-0049` | `OWNER_WORKSPACE` | Sigue custodia y novedades hasta la recepción interna. |
| `VSCREEN-0050` | Recepción de remisión | `nexo` | `VPROC-0028` | `VPROC-0024` | `OWNER_WORKSPACE` | Cierra cantidades por etapa y registra entrada física correlacionada. |
| `VSCREEN-0051` | Vencimiento, cuarentena, daño y merma | `nexo` | `VPROC-0027` | `VPROC-0014`, `VPROC-0035` | `OWNER_WORKSPACE` | Gobierna condición y disposición física con controles de cumplimiento. |
| `VSCREEN-0052` | LPN, contenedores y reutilizables | `nexo` | `VPROC-0032` | `VPROC-0029` | `OWNER_WORKSPACE` | Conserva identidad, tenencia, retorno y completitud de contenedores. |
| `VSCREEN-0053` | Activos y custodia | `nexo` | `VPROC-0029` | `VPROC-0030` | `OWNER_WORKSPACE` | Mantiene identidad, ubicación, custodio y condición del activo. |
| `VSCREEN-0054` | Etiquetas e impresión logística | `nexo` | `VPROC-0024` | `VPROC-0015`, `VPROC-0023`, `VPROC-0032` | `OWNER_WORKSPACE` | Materializa identificación logística sin alterar maestros ni movimientos. |
| `VSCREEN-0055` | Inicio y cola de producción | `fogo` | `VPROC-0033` | `VPROC-0034` | `OWNER_WORKSPACE` | Presenta planes liberados y lotes ejecutables. |
| `VSCREEN-0056` | Planeación de producción | `fogo` | `VPROC-0033` | `VPROC-0028` | `OWNER_WORKSPACE` | Convierte señales de demanda y capacidad en un plan aprobado. |
| `VSCREEN-0057` | Preparación e inicio de lote | `fogo` | `VPROC-0034` | `VPROC-0016`, `VPROC-0025` | `OWNER_WORKSPACE` | Fija receta, materiales y lote antes de ejecutar. |
| `VSCREEN-0058` | Ejecución de lote | `fogo` | `VPROC-0034` | `VPROC-0025`, `VPROC-0035` | `OWNER_WORKSPACE` | Registra consumo, producción y controles durante la ejecución. |
| `VSCREEN-0059` | Registro parcial de producción | `fogo` | `VPROC-0034` | `VPROC-0037` | `OWNER_WORKSPACE` | Conserva avances parciales sin cerrar prematuramente el resultado. |
| `VSCREEN-0060` | Finalización y cierre de lote | `fogo` | `VPROC-0037` | `VPROC-0034`, `VPROC-0035`, `VPROC-0036` | `OWNER_WORKSPACE` | Concilia rendimiento, merma, calidad, empaque y cierre. |
| `VSCREEN-0061` | Receta operativa | `fogo` | `VPROC-0016` | `VPROC-0034` | `OWNER_WORKSPACE` | Presenta la versión aprobada utilizada por el lote. |
| `VSCREEN-0062` | Catálogo y editor de recetas | `fogo` | `VPROC-0016` | `VPROC-0015`, `VPROC-0018` | `OWNER_WORKSPACE` | Mantiene receta y referencia maestros físicos sin duplicarlos. |
| `VSCREEN-0063` | Revisión, aprobación y publicación de receta | `fogo` | `VPROC-0016` | `VPROC-0060` | `OWNER_WORKSPACE` | Versiona la decisión y su evidencia. |
| `VSCREEN-0064` | Prueba de receta y rendimiento | `fogo` | `VPROC-0016` | `VPROC-0037` | `OWNER_WORKSPACE` | Conserva prueba, resultado y decisión antes de publicar. |
| `VSCREEN-0065` | Control de calidad y liberación | `fogo` | `VPROC-0035` | `VPROC-0018`, `VPROC-0027` | `OWNER_WORKSPACE` | Decide liberación, retención, rechazo o corrección. |
| `VSCREEN-0066` | Empaque, etiquetado y almacenamiento de terminado | `fogo` | `VPROC-0036` | `VPROC-0024`, `VPROC-0035` | `OWNER_WORKSPACE` | Conserva empaque y trazabilidad antes del ingreso a NEXO. |
| `VSCREEN-0067` | Reproceso, aprovechamiento, merma y cierre productivo | `fogo` | `VPROC-0037` | `VPROC-0027`, `VPROC-0054` | `OWNER_WORKSPACE` | Gobierna disposición productiva y proyecta el resultado económico. |
| `VSCREEN-0068` | Bandeja de necesidades de compra | `origo` | `VPROC-0019` | `VPROC-0028` | `OWNER_WORKSPACE` | Recibe y prioriza necesidades sin crear una orden. |
| `VSCREEN-0069` | Solicitud de compra | `origo` | `VPROC-0019` | `VPROC-0020` | `OWNER_WORKSPACE` | Formaliza necesidad, alcance y evidencia para decidir abastecimiento. |
| `VSCREEN-0070` | Catálogo de proveedores | `origo` | `VPROC-0020` | — | `OWNER_WORKSPACE` | Presenta proveedores y condiciones aptas para comparación. |
| `VSCREEN-0071` | Alta y expediente de proveedor | `origo` | `VPROC-0020` | `VPROC-0060` | `OWNER_WORKSPACE` | Conserva identidad, documentos y vigencias del proveedor. |
| `VSCREEN-0072` | Comparación de cotizaciones | `origo` | `VPROC-0020` | `VPROC-0019` | `OWNER_WORKSPACE` | Compara condiciones con evidencia sin emitir compra. |
| `VSCREEN-0073` | Editor de orden de compra | `origo` | `VPROC-0021` | `VPROC-0020` | `OWNER_WORKSPACE` | Prepara la orden bajo condiciones seleccionadas. |
| `VSCREEN-0074` | Bandeja de aprobaciones de compra | `origo` | `VPROC-0021` | `VPROC-0003` | `OWNER_WORKSPACE` | Aplica autoridad y límites sin aceptar físicamente la compra. |
| `VSCREEN-0075` | Detalle y seguimiento de orden | `origo` | `VPROC-0021` | `VPROC-0022` | `OWNER_WORKSPACE` | Sigue compromiso comercial hasta recepción y cierre. |
| `VSCREEN-0076` | Cola de recepciones | `origo` | `VPROC-0022` | `VPROC-0021` | `OWNER_WORKSPACE` | Presenta órdenes susceptibles de aceptación comercial y física. |
| `VSCREEN-0077` | Recepción total o parcial | `origo` | `VPROC-0022` | `VPROC-0024`, `VPROC-0051` | `OWNER_WORKSPACE` | Acepta o rechaza recepción y emite efectos posteriores correlacionados. |
| `VSCREEN-0078` | Resolución de diferencias de recepción | `origo` | `VPROC-0022` | `VPROC-0020`, `VPROC-0052` | `OWNER_WORKSPACE` | Resuelve faltantes, sobrantes, calidad y efecto económico sin doble recepción. |
| `VSCREEN-0079` | Historial y auditoría de abastecimiento | `origo` | `VPROC-0022` | `VPROC-0019`, `VPROC-0020`, `VPROC-0021`, `VPROC-0060` | `OWNER_WORKSPACE` | Reconstruye el ciclo de compra con evidencia y decisiones. |
| `VSCREEN-0080` | Inicio POS | `pulso` | `VPROC-0039` | `VPROC-0038`, `VPROC-0044` | `OWNER_WORKSPACE` | Presenta trabajo comercial abierto por canal y caja. |
| `VSCREEN-0081` | Creación de venta o pedido | `pulso` | `VPROC-0039` | `VPROC-0038`, `VPROC-0040`, `VPROC-0041` | `OWNER_WORKSPACE` | Crea el compromiso comercial bajo el canal seleccionado. |
| `VSCREEN-0082` | Mapa de salón y mesas | `pulso` | `VPROC-0038` | — | `OWNER_WORKSPACE` | Gobierna ocupación, mesa y servicio de apertura a cierre. |
| `VSCREEN-0083` | Detalle y modificación de pedido | `pulso` | `VPROC-0038` | `VPROC-0039`, `VPROC-0042` | `OWNER_WORKSPACE` | Mantiene el pedido y separa cambios materiales y compensaciones. |
| `VSCREEN-0084` | Cobro y medios de pago | `pulso` | `VPROC-0043` | `VPROC-0051` | `OWNER_WORKSPACE` | Cobra, confirma y emite soporte conciliable. |
| `VSCREEN-0085` | Identificación de cliente y acumulación | `pulso` | `VPROC-0045` | `VPROC-0038`, `VPROC-0039` | `SUPERVISION_SURFACE` | Ejecuta acumulación durante la venta sin mantener el ledger de PASS. |
| `VSCREEN-0086` | Redención de puntos o beneficios | `pulso` | `VPROC-0045` | `VPROC-0043` | `SUPERVISION_SURFACE` | Solicita redención y aplica su resultado a la venta. |
| `VSCREEN-0087` | Bandeja de pedidos de canales externos | `pulso` | `VPROC-0040` | `VPROC-0042`, `VPROC-0050` | `OWNER_WORKSPACE` | Normaliza, deduplica y admite pedidos externos. |
| `VSCREEN-0088` | Seguimiento de preparación y entrega | `pulso` | `VPROC-0039` | `VPROC-0038`, `VPROC-0040`, `VPROC-0050` | `OWNER_WORKSPACE` | Sigue el compromiso comercial desde preparación hasta entrega. |
| `VSCREEN-0089` | Apertura de caja | `pulso` | `VPROC-0044` | — | `OWNER_WORKSPACE` | Inicia responsabilidad y fondo de caja. |
| `VSCREEN-0090` | Cierre de caja | `pulso` | `VPROC-0044` | `VPROC-0051` | `OWNER_WORKSPACE` | Concilia ventas, pagos, efectivo y diferencias. |
| `VSCREEN-0091` | Anulación, devolución y reembolso | `pulso` | `VPROC-0042` | `VPROC-0043`, `VPROC-0046`, `VPROC-0051` | `OWNER_WORKSPACE` | Separa decisión comercial de devolución, pago y compensación. |
| `VSCREEN-0092` | Oferta, menú, precio comercial y disponibilidad | `pulso` | `VPROC-0017` | `VPROC-0015`, `VPROC-0016` | `OWNER_WORKSPACE` | Publica oferta vendible desde maestros y recetas gobernados. |
| `VSCREEN-0093` | Revisión de ventas, caja y terminales | `pulso` | `VPROC-0044` | `VPROC-0043`, `VPROC-0061` | `OWNER_WORKSPACE` | Supervisa cierres y diferencias y alimenta análisis. |
| `VSCREEN-0094` | Inicio financiero y ejecutivo | `numera` | `VPROC-0061` | `VPROC-0051`, `VPROC-0054`, `VPROC-0069` | `OWNER_WORKSPACE` | Presenta medición, cierre, presupuesto y decisiones financieras. |
| `VSCREEN-0095` | Bandeja de hechos económicos | `numera` | `VPROC-0051` | — | `OWNER_WORKSPACE` | Recibe y clasifica hechos correlacionados con su origen. |
| `VSCREEN-0096` | Registro de gasto y soporte | `numera` | `VPROC-0051` | `VPROC-0060` | `OWNER_WORKSPACE` | Registra el hecho económico y conserva soporte verificable. |
| `VSCREEN-0097` | Bandeja de aprobaciones financieras | `numera` | `VPROC-0052` | `VPROC-0054`, `VPROC-0069` | `OWNER_WORKSPACE` | Aplica decisión financiera sin recrear el compromiso operativo. |
| `VSCREEN-0098` | Cuentas por pagar y obligaciones | `numera` | `VPROC-0052` | `VPROC-0022` | `OWNER_WORKSPACE` | Gobierna obligación, aprobación, pago y conciliación. |
| `VSCREEN-0099` | Cuentas por cobrar y cartera | `numera` | `VPROC-0053` | `VPROC-0041`, `VPROC-0043` | `OWNER_WORKSPACE` | Conserva cartera, recaudo, aplicación y saldo. |
| `VSCREEN-0100` | Caja, bancos y movimientos financieros | `numera` | `VPROC-0052` | `VPROC-0053` | `OWNER_WORKSPACE` | Gestiona tesorería y movimientos que liquidan obligaciones o cartera. |
| `VSCREEN-0101` | Conciliación de ventas y pagos | `numera` | `VPROC-0051` | `VPROC-0043`, `VPROC-0044` | `OWNER_WORKSPACE` | Concilia hechos comerciales sin reescribir ventas ni cajas. |
| `VSCREEN-0102` | Conciliación de compras y recepciones | `numera` | `VPROC-0051` | `VPROC-0022`, `VPROC-0052` | `OWNER_WORKSPACE` | Concilia compra, recepción, obligación y pago. |
| `VSCREEN-0103` | Conciliación de inventario, producción y variaciones | `numera` | `VPROC-0054` | `VPROC-0024`, `VPROC-0025`, `VPROC-0037` | `OWNER_WORKSPACE` | Analiza efectos físicos y productivos sin duplicar sus ledgers. |
| `VSCREEN-0104` | Costos, rentabilidad y escenarios | `numera` | `VPROC-0054` | `VPROC-0069` | `OWNER_WORKSPACE` | Calcula costos, rentabilidad y escenarios con reglas versionadas. |
| `VSCREEN-0105` | Cierre, reapertura y corrección de periodo | `numera` | `VPROC-0054` | `VPROC-0051` | `OWNER_WORKSPACE` | Gobierna cierre y correcciones sin alterar historia. |
| `VSCREEN-0106` | Reportes y exportaciones financieras | `numera` | `VPROC-0061` | `VPROC-0054` | `OWNER_WORKSPACE` | Publica análisis y evidencia derivados de hechos conciliados. |
| `VSCREEN-0107` | Inicio del cliente y resumen de beneficios | `pass` | `VPROC-0045` | `VPROC-0068` | `OWNER_WORKSPACE` | Presenta relación, saldo, beneficios y experiencia personal. |
| `VSCREEN-0108` | QR personal de identificación | `pass` | `VPROC-0045` | — | `OWNER_WORKSPACE` | Presenta credencial personal sin ejecutar acumulación o redención. |
| `VSCREEN-0109` | Catálogo de beneficios y recompensas | `pass` | `VPROC-0045` | `VPROC-0017` | `OWNER_WORKSPACE` | Proyecta beneficios vigentes y condiciones comerciales. |
| `VSCREEN-0110` | Ticket o QR de redención | `pass` | `VPROC-0045` | `VPROC-0043` | `OWNER_WORKSPACE` | Prepara una intención de redención que PULSO aplica en la venta. |
| `VSCREEN-0111` | Historial de puntos y redenciones | `pass` | `VPROC-0045` | — | `OWNER_WORKSPACE` | Consulta el ledger personal y sus receipts. |
| `VSCREEN-0112` | Perfil, privacidad y consentimientos | `pass` | `VPROC-0045` | `VPROC-0060` | `OWNER_WORKSPACE` | Gobierna perfil de fidelización y consentimientos trazables. |
| `VSCREEN-0113` | Registro y seguimiento de decisiones empresariales | `viso` | `VPROC-0001` | `VPROC-0004` | `OWNER_WORKSPACE` | Conserva decisión, autoridad, compromisos y verificación. |
| `VSCREEN-0114` | Solicitudes y certificaciones de acceso | `viso` | `VPROC-0059` | `VPROC-0060` | `OWNER_WORKSPACE` | Gestiona solicitud, aprobación, vigencia, revocación y evidencia. |
| `VSCREEN-0115` | Gobierno de documentos y evidencia | `viso` | `VPROC-0060` | `VPROC-0003` | `OWNER_WORKSPACE` | Gobierna clasificación, custodia, retención y disposición. |
| `VSCREEN-0116` | Registro de riesgos empresariales | `viso` | `VPROC-0063` | `VPROC-0012` | `OWNER_WORKSPACE` | Mantiene riesgo, tratamiento, aceptación y seguimiento empresarial. |
| `VSCREEN-0117` | Requerimientos de asesores y autoridades | `viso` | `VPROC-0064` | `VPROC-0060` | `OWNER_WORKSPACE` | Conserva obligación, vencimiento, responsable, entrega y evidencia. |
| `VSCREEN-0118` | Gestión de desempeño y desarrollo | `viso` | `VPROC-0065` | `VPROC-0060` | `OWNER_WORKSPACE` | Gobierna objetivos, retroalimentación y decisiones sensibles. |
| `VSCREEN-0119` | Asignación y control de elementos de protección | `viso` | `VPROC-0066` | `VPROC-0025`, `VPROC-0029` | `OWNER_WORKSPACE` | Gobierna necesidad y asignación personal; NEXO conserva existencias. |
| `VSCREEN-0120` | Mesa de servicio tecnológico | `viso` | `VPROC-0058` | `VPROC-0059`, `VPROC-0060` | `OWNER_WORKSPACE` | Conserva solicitud, incidente, problema, cambio, SLA y cierre. |
| `VSCREEN-0121` | Continuidad, contingencia y recuperación | `viso` | `VPROC-0062` | `VPROC-0004`, `VPROC-0060` | `OWNER_WORKSPACE` | Gobierna plan, incidente empresarial, recuperación y aprendizaje. |
| `VSCREEN-0122` | Privacidad, cumplimiento y conservación | `viso` | `VPROC-0060` | `VPROC-0003`, `VPROC-0063`, `VPROC-0064` | `OWNER_WORKSPACE` | Articula políticas, riesgos, obligaciones, retención y evidencia. |
| `VSCREEN-0123` | Gestión de comunicaciones internas | `viso` | `VPROC-0004` | `VPROC-0060` | `OWNER_WORKSPACE` | Gobierna comunicación laboral, entrega, acuse y seguimiento. |
| `VSCREEN-0124` | Mis comunicados laborales | `anima` | `VPROC-0004` | `VPROC-0060` | `PERSONAL_CHANNEL` | Presenta al trabajador comunicaciones y acuses propios. |
| `VSCREEN-0125` | Mi carnet laboral | `anima` | `VPROC-0006` | `VPROC-0059` | `PERSONAL_CHANNEL` | Proyecta identidad laboral vigente sin convertirla en permiso universal. |
| `VSCREEN-0126` | Mis documentos laborales | `anima` | `VPROC-0060` | `VPROC-0006` | `PERSONAL_CHANNEL` | Permite consulta y entrega personal bajo custodia y retención gobernadas. |
| `VSCREEN-0127` | Mi capacitación | `anima` | `VPROC-0065` | `VPROC-0014` | `PERSONAL_CHANNEL` | Presenta aprendizaje y evidencia personal vinculados al desarrollo o cumplimiento. |
| `VSCREEN-0128` | Mis objetivos y retroalimentación | `anima` | `VPROC-0065` | — | `PERSONAL_CHANNEL` | Presenta la experiencia personal sin abrir información de terceros. |
| `VSCREEN-0129` | Mis solicitudes de soporte | `anima` | `VPROC-0058` | — | `PERSONAL_CHANNEL` | Inicia y consulta solicitudes propias; VISO gobierna resolución y SLA. |
| `VSCREEN-0130` | Mis reportes de seguridad y salud | `anima` | `VPROC-0013` | `VPROC-0012` | `PERSONAL_CHANNEL` | Permite reportar incidentes o riesgos propios y recibir seguimiento mínimo. |
| `VSCREEN-0131` | Mis elementos de protección | `anima` | `VPROC-0066` | `VPROC-0029` | `PERSONAL_CHANNEL` | Presenta asignación, aceptación, vigencia y devolución personal. |
| `VSCREEN-0132` | Reservas de inventario | `nexo` | `VPROC-0028` | `VPROC-0025`, `VPROC-0033` | `OWNER_WORKSPACE` | Reserva disponibilidad para una necesidad autorizada sin registrar consumo. |
| `VSCREEN-0133` | Planes y órdenes de mantenimiento de activos | `nexo` | `VPROC-0030` | `VPROC-0029`, `VPROC-0055` | `OWNER_WORKSPACE` | Gobierna mantenimiento del activo y su liberación. |
| `VSCREEN-0134` | Garantías, seguros y reclamaciones de activos | `nexo` | `VPROC-0030` | `VPROC-0020`, `VPROC-0060` | `OWNER_WORKSPACE` | Conserva caso, cobertura, proveedor, evidencia y resultado del activo. |
| `VSCREEN-0135` | Kits y conjuntos | `nexo` | `VPROC-0067` | `VPROC-0029`, `VPROC-0032` | `OWNER_WORKSPACE` | Gobierna definición, armado, custodia y completitud. |
| `VSCREEN-0136` | Flota y vehículos | `nexo` | `VPROC-0031` | `VPROC-0029`, `VPROC-0048` | `OWNER_WORKSPACE` | Conserva vehículo, disponibilidad, condición e incidencias. |
| `VSCREEN-0137` | Kilometraje y combustible | `nexo` | `VPROC-0031` | `VPROC-0054` | `OWNER_WORKSPACE` | Registra uso y consumo y proyecta su costo. |
| `VSCREEN-0138` | Planeación de rutas y despachos | `nexo` | `VPROC-0048` | `VPROC-0028`, `VPROC-0031` | `OWNER_WORKSPACE` | Planifica vehículo, carga, secuencia y restricciones. |
| `VSCREEN-0139` | Ejecución de ruta y prueba de entrega | `nexo` | `VPROC-0049` | `VPROC-0048` | `OWNER_WORKSPACE` | Conserva custodia, prueba, rechazo, novedad o retorno. |
| `VSCREEN-0140` | Novedades, rechazos y retornos logísticos | `nexo` | `VPROC-0049` | `VPROC-0027`, `VPROC-0032` | `OWNER_WORKSPACE` | Resuelve efectos físicos de la ejecución logística. |
| `VSCREEN-0141` | Instalaciones, servicios y mantenimiento locativo | `nexo` | `VPROC-0055` | `VPROC-0012`, `VPROC-0030` | `OWNER_WORKSPACE` | Gobierna condición y cierre de instalaciones sin mezclarse con soporte TI. |
| `VSCREEN-0142` | Configuración de políticas y rutas logísticas | `nexo` | `VPROC-0048` | `VPROC-0028`, `VPROC-0049` | `OWNER_WORKSPACE` | Versiona restricciones y reglas logísticas. |
| `VSCREEN-0143` | Diseñador de etiquetas logísticas | `nexo` | `VPROC-0015` | `VPROC-0023`, `VPROC-0032` | `OWNER_WORKSPACE` | Diseña identificación desde maestros físicos y contextos logísticos. |
| `VSCREEN-0144` | Configuración y cola de impresión logística | `nexo` | `VPROC-0024` | `VPROC-0015`, `VPROC-0023` | `OWNER_WORKSPACE` | Ejecuta impresión correlacionada con el objeto y movimiento autorizados. |
| `VSCREEN-0145` | Contratos, precios y condiciones de proveedor | `origo` | `VPROC-0020` | `VPROC-0021`, `VPROC-0060` | `OWNER_WORKSPACE` | Gobierna condiciones comparables y vigentes antes de comprar. |
| `VSCREEN-0146` | Desempeño y reclamaciones de proveedor | `origo` | `VPROC-0020` | `VPROC-0022`, `VPROC-0061` | `OWNER_WORKSPACE` | Evalúa proveedor desde evidencia de recepción y resultado. |
| `VSCREEN-0147` | Oportunidades y cotizaciones de catering o B2B | `pulso` | `VPROC-0041` | `VPROC-0017`, `VPROC-0047` | `OWNER_WORKSPACE` | Conserva propuesta, capacidad, condiciones y aprobación comercial. |
| `VSCREEN-0148` | Ejecución de catering o venta B2B | `pulso` | `VPROC-0041` | `VPROC-0033`, `VPROC-0043`, `VPROC-0048` | `OWNER_WORKSPACE` | Sigue producción, facturación y entrega sin transferir sus dominios. |
| `VSCREEN-0149` | Operación de reservas y eventos | `pulso` | `VPROC-0047` | `VPROC-0038`, `VPROC-0041` | `OWNER_WORKSPACE` | Gobierna capacidad comprometida, reserva y relación con el pedido. |
| `VSCREEN-0150` | Casos de reclamo y compensación | `pulso` | `VPROC-0046` | `VPROC-0042`, `VPROC-0051`, `VPROC-0061` | `OWNER_WORKSPACE` | Conserva reclamo, causa, resolución, compensación y aprendizaje. |
| `VSCREEN-0151` | Coordinación de entrega mediante tercero | `pulso` | `VPROC-0050` | `VPROC-0039`, `VPROC-0040` | `OWNER_WORKSPACE` | Conserva promesa, seguimiento, prueba y conciliación del tercero. |
| `VSCREEN-0152` | Análisis de satisfacción y servicio | `pulso` | `VPROC-0068` | `VPROC-0046`, `VPROC-0061` | `OWNER_WORKSPACE` | Separa medición, reclamo, compensación y mejora. |
| `VSCREEN-0153` | Paquete laboral para pagos y beneficios | `numera` | `VPROC-0010` | `VPROC-0007`, `VPROC-0008`, `VPROC-0009` | `OWNER_WORKSPACE` | Reconcilia vínculo, tiempo y novedades para pago laboral. |
| `VSCREEN-0154` | Facturas y documentos fiscales | `numera` | `VPROC-0051` | `VPROC-0043`, `VPROC-0052`, `VPROC-0060` | `OWNER_WORKSPACE` | Conserva documento fiscal y su hecho económico correlacionado. |
| `VSCREEN-0155` | Tesorería y programación de pagos | `numera` | `VPROC-0052` | `VPROC-0053`, `VPROC-0069` | `OWNER_WORKSPACE` | Programa liquidez y pagos sin convertir presupuesto en hecho. |
| `VSCREEN-0156` | Presupuestos, escenarios y forecast | `numera` | `VPROC-0069` | `VPROC-0054`, `VPROC-0061` | `OWNER_WORKSPACE` | Gobierna versión, supuestos, aprobación, consumo y desviación. |
| `VSCREEN-0157` | Impuestos y obligaciones de cumplimiento | `numera` | `VPROC-0052` | `VPROC-0051`, `VPROC-0060`, `VPROC-0064` | `OWNER_WORKSPACE` | Gestiona obligación, soporte, vencimiento, pago y evidencia. |
| `VSCREEN-0158` | Distribución y asignación de costos | `numera` | `VPROC-0054` | `VPROC-0051` | `OWNER_WORKSPACE` | Aplica reglas versionadas y conserva explicación y reversión. |
| `VSCREEN-0159` | Indicadores, análisis y planes de mejora | `numera` | `VPROC-0061` | `VPROC-0001`, `VPROC-0063` | `OWNER_WORKSPACE` | Vincula medición, análisis, decisión, acción y verificación. |
| `VSCREEN-0160` | Inicio y selección del portal de compras | `pass` | `VPROC-0039` | `VPROC-0017`, `VPROC-0045`, `VPROC-0050` | `CUSTOMER_CHANNEL` | Inicia intención de compra propia; PULSO conserva pedido y venta. |
| `VSCREEN-0161` | Menú y catálogo comercial del cliente | `pass` | `VPROC-0017` | `VPROC-0045` | `CUSTOMER_CHANNEL` | Proyecta oferta publicada sin mantener precio o disponibilidad paralelos. |
| `VSCREEN-0162` | Carrito y configuración del pedido | `pass` | `VPROC-0039` | `VPROC-0017`, `VPROC-0042` | `CUSTOMER_CHANNEL` | Conserva intención local y la entrega a PULSO para crear el pedido. |
| `VSCREEN-0163` | Dirección, modalidad y programación de entrega | `pass` | `VPROC-0050` | `VPROC-0048`, `VPROC-0049` | `CUSTOMER_CHANNEL` | Captura preferencia del cliente; propietarios logísticos validan capacidad y ejecución. |
| `VSCREEN-0164` | Revisión, checkout e inicio de pago | `pass` | `VPROC-0043` | `VPROC-0039`, `VPROC-0042` | `CUSTOMER_CHANNEL` | Presenta total y comienza pago; PULSO confirma el resultado comercial. |
| `VSCREEN-0165` | Confirmación de pedido y retorno de pago | `pass` | `VPROC-0043` | `VPROC-0039`, `VPROC-0051` | `CUSTOMER_CHANNEL` | Presenta receipt correlacionado sin declarar éxito antes de confirmación. |
| `VSCREEN-0166` | Mis pedidos y detalle | `pass` | `VPROC-0039` | `VPROC-0038`, `VPROC-0040`, `VPROC-0041`, `VPROC-0050` | `CUSTOMER_CHANNEL` | Proyecta pedidos propios de los canales comerciales aplicables. |
| `VSCREEN-0167` | Seguimiento de preparación y entrega del cliente | `pass` | `VPROC-0050` | `VPROC-0039`, `VPROC-0049` | `CUSTOMER_CHANNEL` | Presenta avance y prueba autorizada sin gobernar la ruta. |
| `VSCREEN-0168` | Chat y comunicación asociada al pedido | `pass` | `VPROC-0047` | `VPROC-0039`, `VPROC-0046`, `VPROC-0050` | `CUSTOMER_CHANNEL` | Vincula comunicación al pedido y deriva reclamos o entrega cuando corresponda. |
| `VSCREEN-0169` | Mis reclamos y casos de servicio | `pass` | `VPROC-0046` | `VPROC-0042`, `VPROC-0050` | `CUSTOMER_CHANNEL` | Inicia y consulta el caso propio; PULSO gobierna resolución y compensación. |
| `VSCREEN-0170` | Mis reservas y eventos | `pass` | `VPROC-0047` | `VPROC-0041` | `CUSTOMER_CHANNEL` | Presenta reservas propias y sus condiciones sin administrar capacidad global. |
| `VSCREEN-0171` | Calificación y satisfacción | `pass` | `VPROC-0068` | `VPROC-0046` | `CUSTOMER_CHANNEL` | Captura respuesta personal separada de reclamo e incentivo. |
| `VSCREEN-0172` | Comunicaciones y notificaciones del cliente | `pass` | `VPROC-0047` | `VPROC-0045`, `VPROC-0060` | `CUSTOMER_CHANNEL` | Presenta comunicaciones consentidas y receipts personales. |
| `VSCREEN-0173` | Trazabilidad e investigación de lote | `fogo` | `VPROC-0035` | `VPROC-0034`, `VPROC-0036`, `VPROC-0037`, `VPROC-0060` | `OWNER_WORKSPACE` | Reconstruye materiales, ejecución, calidad, empaque y disposición. |
| `VSCREEN-0174` | Controles operativos de inocuidad | `fogo` | `VPROC-0014` | `VPROC-0012`, `VPROC-0035` | `SUPERVISION_SURFACE` | Ejecuta controles operativos y entrega hallazgos al gobierno de cumplimiento. |
| `VSCREEN-0175` | Seguridad de cuenta y sesiones | `shell` | `VPROC-0059` | `VPROC-0058`, `VPROC-0060` | `TRANSVERSAL_ENTRY` | Presenta sesiones y recuperación personal sin gobernar autoridad laboral. |

---

#### 10. Cobertura de procesos

| Disposición | Procesos | Resultado |
| --- | --- | --- |
| vinculados con una o más pantallas | `VPROC-0001` a `VPROC-0055` y `VPROC-0058` a `VPROC-0069` | `COVERED` |
| aplicación canónica diferida | `VPROC-0056`, `VPROC-0057` | `DEFERRED_APP_SCOPE` |

Los procesos diferidos no se asignan artificialmente a PULSO, PASS, VISO o SHELL. Su primera pantalla exigirá continuidad funcional de AURA y una nueva admisión canónica.

---

#### 11. Fronteras que no podrán reinterpretarse

1. SHELL presenta entradas transversales; no se vuelve propietario de acceso laboral, soporte o continuidad.
2. VISO puede supervisar asistencia de ANIMA sin crear un ledger paralelo.
3. ANIMA presenta programación y casos personales; VISO conserva programación y decisiones laborales.
4. PASS conserva fidelización y experiencia personal; PULSO conserva pedido, venta, pago, reclamo, reserva y resultado comercial.
5. NEXO conserva planeación y ejecución logística propia; PULSO conserva entrega comercial mediante tercero.
6. ORIGO acepta la recepción de compra; NEXO registra el efecto físico posterior.
7. FOGO conserva receta, lote, calidad y cierre productivo; NEXO conserva maestros físicos y existencias.
8. NUMERA consume hechos económicos y operativos; no recrea ventas, recepciones, movimientos o lotes.
9. TALENTO continúa como canal futuro sin `app_code`; `VPROC-0005` y `VPROC-0006` permanecen gobernados por VISO.
10. AURA conserva `VPROC-0056` y `VPROC-0057` diferidos; no se les inventa una pantalla sustituta.

---

#### 12. Cambio de vínculo

Cambiar `primary_process_id` exige:

1. propuesta trazable;
2. comparación de intención, objeto, entrada, salida y efecto;
3. análisis de pasos, acciones, métricas, rutas y consumidores posteriores;
4. nueva versión del vínculo;
5. conservación del proceso anterior;
6. actualización coordinada de TREQ y validadores;
7. creación de otro `VSCREEN-*` cuando cambie materialmente la identidad.

Un cambio de propietaria de proceso no podrá ejecutarse desde este registro: deberá resolverse primero en el catálogo de procesos.

---

#### 13. Validaciones obligatorias

La compilación deberá fallar cuando:

1. falte una de las 175 pantallas;
2. una pantalla aparezca más de una vez;
3. una pantalla no tenga exactamente un proceso primario;
4. un proceso primario o relacionado no exista;
5. el proceso primario se repita entre relacionados;
6. existan procesos relacionados duplicados;
7. una modalidad no pertenezca al vocabulario permitido;
8. `OWNER_WORKSPACE` contradiga la aplicación propietaria del proceso;
9. una frontera entre aplicaciones se presente como propiedad;
10. falte cobertura de un proceso activo;
11. `VPROC-0056` o `VPROC-0057` se vinculen mientras AURA siga diferida;
12. se utilice `talento` como aplicación;
13. PASS aparezca como propietaria de pedido, venta, pago o entrega comercial;
14. se introduzcan pasos, permisos u operaciones técnicas antes de su tarea;
15. el conteo declarado no coincida con la matriz física.

---

#### 14. Seguridad y autorización

El vínculo pantalla–proceso no concede:

- acceso a la pantalla;
- lectura de objetos;
- ejecución de acciones;
- pertenencia a un rol;
- alcance por sede o territorio;
- autoridad para aprobar;
- acceso por URL directa;
- confianza en un handoff;
- acceso a procesos relacionados.

Cada aplicación continuará resolviendo identidad, actor, capacidad, contexto, recurso, versión, estado y alcance.

---

#### 15. Decisiones reservadas

| Pendiente | Tarea propietaria |
| --- | --- |
| vincular pasos exactos | `PROC-SCREEN-004` |
| clasificar carriles UX | `PROC-SCREEN-005` a `PROC-SCREEN-011` |
| definir actores | `PROC-SCREEN-012` |
| definir dispositivos | `PROC-SCREEN-013` |
| definir acciones | `PROC-SCREEN-014` y `PROC-SCREEN-015` |
| definir entradas, salidas y estados | `PROC-SCREEN-016` a `PROC-SCREEN-021` |
| sensibilidad y permisos | `PROC-SCREEN-022` a `PROC-SCREEN-024` |
| operaciones técnicas | `PROC-SCREEN-025` |
| rutas y legado | `PROC-SCREEN-026` |
| métricas y aceptación operativa | `PROC-SCREEN-027` y `PROC-SCREEN-028` |
| admisión funcional de AURA | tareas canónicas de AURA y nueva admisión `PROC-SCREEN-*` |

---

#### 16. Requisitos de prueba derivados

**Resultado propuesto:** GENERA 24 REQUISITOS DE PRUEBA.

Se proponen `TREQ-UX-553` a `TREQ-UX-576`. Permanecerán `IDENTIFICADO`; la implementación y evidencia corresponden a CI, paquetes E5, BLOQUE U, staging y pilotos.

---

#### 17. Criterios de aceptación

- [x] Se consumen 175 identidades de pantalla sin renumerarlas.
- [x] Cada pantalla recibe exactamente un proceso primario.
- [x] Los procesos relacionados son explícitos, válidos y no duplican el primario.
- [x] Se utilizan únicamente `VPROC-0001` a `VPROC-0069`.
- [x] Los 67 procesos activos quedan cubiertos.
- [x] `VPROC-0056` y `VPROC-0057` permanecen diferidos junto con AURA.
- [x] La aplicación de pantalla no se confunde con la propietaria del proceso.
- [x] Se distinguen espacio propietario, entrada transversal, supervisión, canal personal y canal de cliente.
- [x] PASS conserva el portal de compra completo sin apropiarse de pedido, pago o logística.
- [x] ANIMA conserva experiencia personal sin apropiarse de decisiones laborales.
- [x] SHELL conserva entrada transversal sin convertirse en aplicación empresarial universal.
- [x] Se preservan las fronteras ORIGO–NEXO, FOGO–NEXO, PULSO–PASS y VISO–ANIMA.
- [x] No se crean pantallas para AURA ni una aplicación TALENTO por inferencia.
- [x] Se reservan pasos, acciones, permisos, rutas y operaciones técnicas.
- [x] Se proponen `TREQ-UX-553` a `TREQ-UX-576`.
- [x] Se define una puerta automática de integridad.
- [x] No se implementa código de producto ni se avanza a `PROC-SCREEN-004`.

---

#### 18. Resultado y continuidad

**Estado propuesto:** PROPUESTA PARA APROBACIÓN

Al aprobarse:

- los vínculos pasarán de `PROPOSED` a `CANONICAL`;
- `PROC-SCREEN-003` será la última tarea aprobada;
- la continuidad documental pasará exclusivamente a:

```text
PROC-SCREEN-004 — Vincular cada pantalla con un paso del proceso
```

Hasta recibir `APROBADO`:

```text
PROC-SCREEN-002 APROBADA
PROC-SCREEN-003 APROBADO
PROC-SCREEN-004 NO INICIADA
```

### [ ] PROC-SCREEN-004 — Vincular cada pantalla con un paso del proceso
### [ ] PROC-SCREEN-005 — Clasificar pantalla operativa
### [ ] PROC-SCREEN-006 — Clasificar pantalla administrativa
### [ ] PROC-SCREEN-007 — Clasificar pantalla de supervisión
### [ ] PROC-SCREEN-008 — Clasificar pantalla de configuración
### [ ] PROC-SCREEN-009 — Clasificar pantalla de auditoría
### [ ] PROC-SCREEN-010 — Clasificar pantalla personal
### [ ] PROC-SCREEN-011 — Clasificar pantalla de cliente
### [ ] PROC-SCREEN-012 — Definir actores objetivo
### [ ] PROC-SCREEN-013 — Definir dispositivos soportados
### [ ] PROC-SCREEN-014 — Definir acción principal
### [ ] PROC-SCREEN-015 — Definir acciones secundarias
### [ ] PROC-SCREEN-016 — Definir condiciones de entrada
### [ ] PROC-SCREEN-017 — Definir condiciones de salida
### [ ] PROC-SCREEN-018 — Definir estados vacíos
### [ ] PROC-SCREEN-019 — Definir estados de carga
### [ ] PROC-SCREEN-020 — Definir estados de bloqueo
### [ ] PROC-SCREEN-021 — Definir recuperación ante errores
### [ ] PROC-SCREEN-022 — Definir información sensible visible
### [ ] PROC-SCREEN-023 — Definir permiso de lectura
### [ ] PROC-SCREEN-024 — Definir permisos de cada acción
### [ ] PROC-SCREEN-025 — Vincular cada acción con Server Action, API o RPC
### [ ] PROC-SCREEN-026 — Identificar pantalla reemplazada o legacy
### [ ] PROC-SCREEN-027 — Definir métrica de usabilidad
### [ ] PROC-SCREEN-028 — Definir criterio de aceptación operativo

