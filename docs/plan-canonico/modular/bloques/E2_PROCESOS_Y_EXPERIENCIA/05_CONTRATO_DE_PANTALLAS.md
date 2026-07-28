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

**Resultado cuantitativo corregido:** **177 pantallas canónicas** vinculadas a **9 aplicaciones habilitadas**; el catálogo de BLOQUE C conserva **10 aplicaciones canónicas**, pero `aura` mantiene **0** pantallas por su estado funcional diferido.

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
3. materializa `VSCREEN-0001` a `VSCREEN-0177`;
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

| Aplicación | Límite aprobado                                                                                                  |
| ---------- | ---------------------------------------------------------------------------------------------------------------- |
| `shell`    | compone entrada, cuenta y navegación transversal; no duplica administración ni operación empresarial             |
| `viso`     | gobierna organización, personas, acceso, cumplimiento y casos transversales; no replica operaciones propietarias |
| `anima`    | experiencia personal laboral, asistencia y autoservicio propio; no administra poblaciones de trabajadores        |
| `nexo`     | inventario, ubicaciones, logística, activos, flota, instalaciones y maestros físicos                             |
| `fogo`     | producción, recetas, inocuidad, trazabilidad, calidad y resultados productivos                                   |
| `origo`    | proveedores, contratos, compras, aprobaciones y recepción de compra                                              |
| `pulso`    | venta, salón, catering, reservas, caja, servicio y publicación comercial                                         |
| `numera`   | hechos económicos, obligaciones, tesorería, fiscalidad, presupuesto, cierre y análisis financiero                |
| `pass`     | experiencia personal, compras y servicio del cliente; no es backoffice comercial ni POS                          |

Una aplicación operativa puede contener pantallas administrativas propias. Eso no modifica todavía su clasificación; `PROC-SCREEN-005` a `PROC-SCREEN-011` resolverán el carril de cada pantalla.

---

#### 11. Resumen de asignación

| Aplicación | Lote original                   | Ampliación correctiva           | Cantidad | Frontera principal                                               |
| ---------- | ------------------------------- | ------------------------------- | -------: | ---------------------------------------------------------------- |
| `shell`    | `VSCREEN-0001` a `VSCREEN-0006` | `VSCREEN-0175`                  |        7 | entrada, contexto, cuenta y capacidades transversales            |
| `viso`     | `VSCREEN-0007` a `VSCREEN-0026` | `VSCREEN-0113` a `VSCREEN-0123` |       31 | gobierno, personas, acceso, cumplimiento y casos administrativos |
| `anima`    | `VSCREEN-0027` a `VSCREEN-0032` | `VSCREEN-0124` a `VSCREEN-0131` |       14 | experiencia personal del trabajador                              |
| `nexo`     | `VSCREEN-0033` a `VSCREEN-0054` | `VSCREEN-0132` a `VSCREEN-0144`, `VSCREEN-0176` a `VSCREEN-0177` |       37 | inventario, logística, activos, flota, instalaciones e impresión |
| `fogo`     | `VSCREEN-0055` a `VSCREEN-0067` | `VSCREEN-0173` a `VSCREEN-0174` |       15 | producción, recetas, inocuidad, trazabilidad y cierre productivo |
| `origo`    | `VSCREEN-0068` a `VSCREEN-0079` | `VSCREEN-0145` a `VSCREEN-0146` |       14 | necesidades, proveedores, contratos, compras y recepción         |
| `pulso`    | `VSCREEN-0080` a `VSCREEN-0093` | `VSCREEN-0147` a `VSCREEN-0152` |       20 | venta, catering, reservas, caja, servicio y oferta               |
| `numera`   | `VSCREEN-0094` a `VSCREEN-0106` | `VSCREEN-0153` a `VSCREEN-0159` |       20 | hechos económicos, tesorería, fiscalidad, presupuesto y análisis |
| `pass`     | `VSCREEN-0107` a `VSCREEN-0112` | `VSCREEN-0160` a `VSCREEN-0172` |       19 | experiencia personal, compras, pedidos y servicio del cliente    |
| `aura`     | —                               | —                               |        0 | aplicación canónica diferida; admisión pendiente de alcance      |
| **Total**  | `VSCREEN-0001` a `VSCREEN-0112` | `VSCREEN-0113` a `VSCREEN-0177` |  **177** | catálogo inicial corregido y reconciliado con E1 y `VPROC-*`     |

Los rangos contiguos reflejan únicamente el orden del lote inicial. **No son rangos reservados por aplicación y no codifican semántica en el ID.** Las pantallas futuras utilizarán la siguiente secuencia global disponible, aunque intercalen aplicaciones.

Ningún conteo de pantallas implica relación uno a uno con permisos, procesos, roles o capacidades.

---


#### 8.1 Corrección de identidades mixtas

La revisión integral separa dos identidades que mezclaban configuración reutilizable con operación de instancias:

| Identidad histórica | Alcance que conserva | Nueva identidad | Alcance separado |
| --- | --- | --- | --- |
| Identidad 0135 | instancias y operación de kits | Identidad 0176 | definición reutilizable de kits y conjuntos |
| Identidad 0144 | cola y trabajos de impresión | Identidad 0177 | configuración reutilizable de impresoras |

Los IDs históricos no se reasignan ni se eliminan. El cambio conserva trazabilidad, evita dos intenciones dominantes en una sola pantalla y obliga a que vínculos de proceso, paso y clasificación consuman las cuatro identidades exactas.

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
| `VSCREEN-0026` | Bandeja de casos administrativos transversales        | `viso`              | Recibir, clasificar y conducir casos administrativos hacia la superficie especializada sin sustituir instalaciones, tecnología u otra operación propietaria.    | UX-ADMIN + AUTH + supervisión transversal | `CANONICAL` |
| `VSCREEN-0027` | Inicio personal del trabajador                        | `anima`             | Mostrar al trabajador sus tareas, avisos, jornada y accesos personales relevantes para el momento actual.                                                       | experiencia personal laboral + asistencia | `CANONICAL` |
| `VSCREEN-0028` | Registro de entrada, pausa y salida                   | `anima`             | Permitir que el trabajador registre eventos de jornada propios con identidad, ubicación y confirmación válidas.                                                 | experiencia personal laboral + asistencia | `CANONICAL` |
| `VSCREEN-0029` | Mi programación                                       | `anima`             | Consultar la programación laboral propia vigente y los cambios confirmados.                                                                                     | experiencia personal laboral + asistencia | `CANONICAL` |
| `VSCREEN-0030` | Mi asistencia y solicitud de corrección               | `anima`             | Consultar asistencia propia y solicitar corrección o aclaración sin editar directamente los hechos registrados.                                                 | experiencia personal laboral + asistencia | `CANONICAL` |
| `VSCREEN-0031` | Mis novedades, permisos y ausencias                   | `anima`             | Crear y seguir solicitudes personales de novedad, permiso, ausencia o soporte documental.                                                                       | experiencia personal laboral + asistencia | `CANONICAL` |
| `VSCREEN-0032` | Mi perfil laboral                                     | `anima`             | Consultar y actualizar únicamente los datos personales y laborales autogestionables permitidos.                                                                 | experiencia personal laboral + asistencia | `CANONICAL` |
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
| `VSCREEN-0113` | Registro y seguimiento de decisiones empresariales    | `viso`              | Crear, revisar, aprobar, versionar y seguir una decisión empresarial con autoridad, compromisos, evidencia y cierre explícitos.                                 | CAP-01 + `VPROC-0001`                     | `CANONICAL` |
| `VSCREEN-0114` | Solicitudes y certificaciones de acceso               | `viso`              | Gestionar solicitud, aprobación, vigencia, revisión periódica y revocación de accesos sin confundir catálogo con concesión.                                     | CAP-15 + `VPROC-0059`                     | `CANONICAL` |
| `VSCREEN-0115` | Gobierno de documentos y evidencia                    | `viso`              | Administrar metadatos, clasificación, custodia, retención, versión, acceso y disposición de documentos y evidencia.                                             | CAP-16 + `VPROC-0060`                     | `CANONICAL` |
| `VSCREEN-0116` | Registro de riesgos empresariales                     | `viso`              | Gestionar riesgos estratégicos, financieros, operativos, legales y tecnológicos con evaluación, tratamiento, responsable y seguimiento.                         | CAP-01.07 + `VPROC-0063`                  | `CANONICAL` |
| `VSCREEN-0117` | Requerimientos de asesores y autoridades              | `viso`              | Coordinar requerimientos, conceptos, entregables, vencimientos, comunicaciones y evidencia con asesores o autoridades.                                          | CAP-01.09 + `VPROC-0064`                  | `CANONICAL` |
| `VSCREEN-0118` | Gestión de desempeño y desarrollo                     | `viso`              | Administrar objetivos, retroalimentación, revisiones y decisiones sensibles de desarrollo con propósito y privacidad explícitos.                                | CAP-02.10 + `VPROC-0065`                  | `CANONICAL` |
| `VSCREEN-0119` | Asignación y control de elementos de protección       | `viso`              | Definir requisito, asignación, vigencia, entrega esperada, cambio y devolución de elementos de protección vinculados con inventario.                            | CAP-03.03 + `VPROC-0066`                  | `CANONICAL` |
| `VSCREEN-0120` | Mesa de servicio tecnológico                          | `viso`              | Priorizar, diagnosticar, asignar, resolver, validar y convertir en conocimiento solicitudes e incidentes tecnológicos.                                          | CAP-15 + `VPROC-0058`                     | `CANONICAL` |
| `VSCREEN-0121` | Continuidad, contingencia y recuperación              | `viso`              | Gestionar impacto, declaración, operación mínima, recuperación, reconciliación, ejercicio y aprendizaje de continuidad empresarial.                             | CAP-18 + `VPROC-0062`                     | `CANONICAL` |
| `VSCREEN-0122` | Privacidad, cumplimiento y conservación               | `viso`              | Gestionar solicitudes de titulares, obligaciones, retención, restricciones, revisiones y evidencia de cumplimiento.                                             | CAP-16 + gobierno de información          | `CANONICAL` |
| `VSCREEN-0123` | Gestión de comunicaciones internas                    | `viso`              | Preparar, segmentar, aprobar, publicar, retirar y auditar comunicaciones dirigidas a poblaciones laborales.                                                     | CAP-02 + comunicaciones laborales         | `CANONICAL` |
| `VSCREEN-0124` | Mis comunicados laborales                             | `anima`             | Consultar, confirmar lectura y actuar sobre comunicaciones laborales propias según vigencia y audiencia autorizada.                                             | CAP-02 + autoservicio laboral             | `CANONICAL` |
| `VSCREEN-0125` | Mi carnet laboral                                     | `anima`             | Presentar identificación laboral propia, vigencia y condiciones visibles sin convertirla en concesión de acceso.                                                | CAP-02 + identidad laboral                | `CANONICAL` |
| `VSCREEN-0126` | Mis documentos laborales                              | `anima`             | Consultar, aportar y descargar únicamente documentos laborales propios autorizados con estado, vigencia y trazabilidad.                                         | CAP-02.11 + CAP-16                        | `CANONICAL` |
| `VSCREEN-0127` | Mi capacitación                                       | `anima`             | Consultar actividades asignadas, requisitos, avance, evidencia y vigencia de capacitación propia.                                                               | CAP-02.09 + experiencia personal laboral  | `CANONICAL` |
| `VSCREEN-0128` | Mis objetivos y retroalimentación                     | `anima`             | Consultar, aportar y aceptar objetivos o retroalimentación propios dentro del proceso sensible de desempeño aprobado.                                           | CAP-02.10 + `VPROC-0065`                  | `CANONICAL` |
| `VSCREEN-0129` | Mis solicitudes de soporte                            | `anima`             | Crear y seguir solicitudes tecnológicas propias, aportar evidencia y confirmar recuperación sin acceder a la mesa administrativa.                               | CAP-15 + `VPROC-0058`                     | `CANONICAL` |
| `VSCREEN-0130` | Mis reportes de seguridad y salud                     | `anima`             | Reportar una condición, incidente o emergencia laboral propia y consultar únicamente el seguimiento permitido.                                                  | CAP-03 + `VPROC-0013`                     | `CANONICAL` |
| `VSCREEN-0131` | Mis elementos de protección                           | `anima`             | Consultar requisitos y asignaciones propias y registrar entrega, aceptación, cambio o devolución autorizados.                                                   | CAP-03.03 + `VPROC-0066`                  | `CANONICAL` |
| `VSCREEN-0132` | Reservas de inventario                                | `nexo`              | Crear, priorizar, expirar, liberar o consumir reservas explícitas sin modificar la existencia física por el solo acto de reservar.                              | CAP-06.06 + inventario                    | `CANONICAL` |
| `VSCREEN-0133` | Planes y órdenes de mantenimiento de activos          | `nexo`              | Planear, asignar, ejecutar, probar y cerrar mantenimiento preventivo o correctivo con repuestos y retorno al servicio.                                          | CAP-07.07 + `VPROC-0030`                  | `CANONICAL` |
| `VSCREEN-0134` | Garantías, seguros y reclamaciones de activos         | `nexo`              | Gestionar cobertura, vigencia, documentos, reclamación, resultado y efecto sobre disponibilidad o disposición del activo.                                       | CAP-07 + `VPROC-0030`                     | `CANONICAL` |
| `VSCREEN-0135` | Instancias y operación de kits | `nexo` | Armar y controlar instancias de kit, verificar componentes, completitud, préstamo, devolución y sustitución sin confundirlas con LPN ni con la definición maestra. | CAP-07.11 + `VPROC-0067` | `CANONICAL` |
| `VSCREEN-0136` | Flota y vehículos                                     | `nexo`              | Administrar identidad, condición, documentos, disponibilidad, custodio e incidencias de vehículos y equipos de transporte.                                      | CAP-07.12 + `VPROC-0031`                  | `CANONICAL` |
| `VSCREEN-0137` | Kilometraje y combustible                             | `nexo`              | Registrar lecturas, cargas, consumo, evidencia y alertas de rendimiento por vehículo sin confundir compra con consumo.                                          | CAP-07.12 + `VPROC-0031`                  | `CANONICAL` |
| `VSCREEN-0138` | Planeación de rutas y despachos                       | `nexo`              | Preparar ruta, vehículo, conductor, carga, secuencia, capacidad y restricciones antes de autorizar el despacho.                                                 | CAP-11 + `VPROC-0048`                     | `CANONICAL` |
| `VSCREEN-0139` | Ejecución de ruta y prueba de entrega                 | `nexo`              | Ejecutar paradas y registrar entrega, rechazo, novedad o retorno con ubicación, actor, tiempo y evidencia suficiente.                                           | CAP-11 + `VPROC-0049`                     | `CANONICAL` |
| `VSCREEN-0140` | Novedades, rechazos y retornos logísticos             | `nexo`              | Resolver excepciones de transporte y entrega conservando carga afectada, custodia, causa, decisión y reconciliación.                                            | CAP-11 + `VPROC-0049`                     | `CANONICAL` |
| `VSCREEN-0141` | Instalaciones, servicios y mantenimiento locativo     | `nexo`              | Gestionar limpieza, inspecciones, mantenimiento, plagas, servicios, calibración y cierre de novedades de instalaciones.                                         | CAP-13 + `VPROC-0055`                     | `CANONICAL` |
| `VSCREEN-0142` | Configuración de políticas y rutas logísticas         | `nexo`              | Versionar políticas de solicitud, abastecimiento, cumplimiento, rutas, sedes y productos habilitados para operación logística.                                  | CAP-06 + CAP-11                           | `CANONICAL` |
| `VSCREEN-0143` | Diseñador de etiquetas logísticas                     | `nexo`              | Diseñar, versionar, previsualizar y aprobar plantillas de etiqueta vinculadas con objetos logísticos autorizados.                                               | CAP-15 + impresión logística              | `CANONICAL` |
| `VSCREEN-0144` | Cola y trabajos de impresión logística | `nexo` | Gestionar trabajos, reintentos, resultados y reimpresiones sin configurar impresoras ni convertir la cola en propietaria del documento. | CAP-15 + impresión logística | `CANONICAL` |
| `VSCREEN-0145` | Contratos, precios y condiciones de proveedor         | `origo`             | Versionar contratos, listas de precio, impuestos, fletes, mínimos, vigencias y condiciones autorizadas por proveedor.                                           | CAP-05 + `VPROC-0020`                     | `CANONICAL` |
| `VSCREEN-0146` | Desempeño y reclamaciones de proveedor                | `origo`             | Analizar cumplimiento desde hechos y gestionar reclamaciones, respuestas, compromisos y resolución con evidencia.                                               | CAP-05 + abastecimiento                   | `CANONICAL` |
| `VSCREEN-0147` | Oportunidades y cotizaciones de catering o B2B        | `pulso`             | Calificar una oportunidad, preparar cotización y validar capacidad, condiciones, aprobaciones y vigencia antes del compromiso.                                  | CAP-09 + `VPROC-0041`                     | `CANONICAL` |
| `VSCREEN-0148` | Ejecución de catering o venta B2B                     | `pulso`             | Coordinar pedido, producción, entrega, facturación, cambios y cierre de un compromiso de catering o venta entre empresas.                                       | CAP-09 + `VPROC-0041`                     | `CANONICAL` |
| `VSCREEN-0149` | Operación de reservas y eventos                       | `pulso`             | Gestionar capacidad, confirmación, cambios, asistencia, servicio y comunicaciones de reservas o eventos.                                                        | CAP-10 + `VPROC-0047`                     | `CANONICAL` |
| `VSCREEN-0150` | Casos de reclamo y compensación                       | `pulso`             | Investigar reclamo, devolución o inconformidad, decidir compensación y verificar restitución y aprendizaje de causa.                                            | CAP-10 + `VPROC-0046`                     | `CANONICAL` |
| `VSCREEN-0151` | Coordinación de entrega mediante tercero              | `pulso`             | Gestionar asignación, seguimiento, prueba, novedad y conciliación de entregas ejecutadas por plataformas o transportadores externos.                            | CAP-11 + `VPROC-0050`                     | `CANONICAL` |
| `VSCREEN-0152` | Análisis de satisfacción y servicio                   | `pulso`             | Revisar mediciones, sesgos, causas y acciones de mejora sin confundir encuesta, reclamo, incentivo o compensación.                                              | CAP-10.06 + `VPROC-0068`                  | `CANONICAL` |
| `VSCREEN-0153` | Paquete laboral para pagos y beneficios               | `numera`            | Preparar, validar y reconciliar el paquete laboral autorizado que alimenta pagos y beneficios sin decidir novedades laborales.                                  | CAP-02 + `VPROC-0010`                     | `CANONICAL` |
| `VSCREEN-0154` | Facturas y documentos fiscales                        | `numera`            | Gestionar emisión o recepción, estado, referencia externa, notas y control de documentos fiscales sin confundirlos con obligación o pago.                       | CAP-12.06 + finanzas                      | `CANONICAL` |
| `VSCREEN-0155` | Tesorería y programación de pagos                     | `numera`            | Planear liquidez, vencimientos, lotes de pago, aprobaciones, ejecución externa y conciliación bancaria.                                                         | CAP-12.12 + `VPROC-0052`                  | `CANONICAL` |
| `VSCREEN-0156` | Presupuestos, escenarios y forecast                   | `numera`            | Crear, consolidar, revisar, aprobar, publicar y comparar versiones presupuestales, escenarios y proyecciones.                                                   | CAP-12.11 + `VPROC-0069`                  | `CANONICAL` |
| `VSCREEN-0157` | Impuestos y obligaciones de cumplimiento              | `numera`            | Gestionar calendario, bases, componentes, soportes, revisión y estado de obligaciones sin sustituir al emisor o presentador autorizado.                         | CAP-12.13 + finanzas                      | `CANONICAL` |
| `VSCREEN-0158` | Distribución y asignación de costos                   | `numera`            | Definir reglas versionadas y ejecutar distribuciones de costos compartidos con explicación y reversión controlada.                                              | CAP-12.10 + `VPROC-0054`                  | `CANONICAL` |
| `VSCREEN-0159` | Indicadores, análisis y planes de mejora              | `numera`            | Gestionar medición, análisis, decisión, acción de mejora y verificación del resultado con métricas y fuentes identificables.                                    | CAP-17 + `VPROC-0061`                     | `CANONICAL` |
| `VSCREEN-0160` | Inicio y selección del portal de compras              | `pass`              | Permitir al cliente escoger marca, sede o punto de atención y modalidad disponible antes de construir un pedido.                                                | CAP-09 + canal propio de cliente          | `CANONICAL` |
| `VSCREEN-0161` | Menú y catálogo comercial del cliente                 | `pass`              | Consultar oferta, disponibilidad, condiciones y detalle comercial publicados por PULSO para el contexto de compra elegido.                                      | CAP-09 + proyección de PULSO              | `CANONICAL` |
| `VSCREEN-0162` | Carrito y configuración del pedido                    | `pass`              | Construir la intención de compra con productos, cantidades, modificadores y observaciones antes de enviarla al proceso comercial.                               | CAP-09 + canal propio de cliente          | `CANONICAL` |
| `VSCREEN-0163` | Dirección, modalidad y programación de entrega        | `pass`              | Gestionar direcciones propias y seleccionar entrega, retiro o programación disponible sin gobernar rutas internas.                                              | CAP-09 + CAP-11                           | `CANONICAL` |
| `VSCREEN-0164` | Revisión, checkout e inicio de pago                   | `pass`              | Revisar pedido, cargos, datos requeridos y medio de pago e iniciar el comando hacia PULSO o proveedor autorizado.                                               | CAP-09 + `VPROC-0043`                     | `CANONICAL` |
| `VSCREEN-0165` | Confirmación de pedido y retorno de pago              | `pass`              | Mostrar aceptación, identificador, resultado confirmado o pendiente y próximos pasos sin declarar pago o venta no confirmados.                                  | CAP-09 + recibo de canal                  | `CANONICAL` |
| `VSCREEN-0166` | Mis pedidos y detalle                                 | `pass`              | Consultar pedidos propios, líneas, importes, modalidad, estados y soportes autorizados.                                                                         | CAP-09 + experiencia personal de cliente  | `CANONICAL` |
| `VSCREEN-0167` | Seguimiento de preparación y entrega del cliente      | `pass`              | Consultar una proyección del avance, entrega o retiro y las novedades visibles sin modificar directamente la operación interna.                                 | CAP-09 + CAP-11                           | `CANONICAL` |
| `VSCREEN-0168` | Chat y comunicación asociada al pedido                | `pass`              | Intercambiar mensajes y evidencia vinculados con un pedido propio, conservando participantes, consentimiento y trazabilidad.                                    | CAP-10 + servicio al cliente              | `CANONICAL` |
| `VSCREEN-0169` | Mis reclamos y casos de servicio                      | `pass`              | Presentar reclamo, aportar evidencia y consultar decisión, compensación y cierre permitidos del caso propio.                                                    | CAP-10 + `VPROC-0046`                     | `CANONICAL` |
| `VSCREEN-0170` | Mis reservas y eventos                                | `pass`              | Solicitar, confirmar, modificar o cancelar reservas propias dentro de capacidad y condiciones publicadas.                                                       | CAP-10 + `VPROC-0047`                     | `CANONICAL` |
| `VSCREEN-0171` | Calificación y satisfacción                           | `pass`              | Registrar una medición de satisfacción propia con consentimiento y contexto, separada de reclamo, incentivo y compensación.                                     | CAP-10.06 + `VPROC-0068`                  | `CANONICAL` |
| `VSCREEN-0172` | Comunicaciones y notificaciones del cliente           | `pass`              | Consultar comunicaciones comerciales, operativas y de servicio propias con preferencia, consentimiento, vigencia y origen visibles.                             | CAP-10 + comunicaciones de cliente        | `CANONICAL` |
| `VSCREEN-0173` | Trazabilidad e investigación de lote                  | `fogo`              | Reconstruir materiales, receta, ejecución, calidad, destinos y evidencia de un lote para investigar una desviación o retiro.                                    | CAP-08 + producción                       | `CANONICAL` |
| `VSCREEN-0174` | Controles operativos de inocuidad                     | `fogo`              | Ejecutar listas, mediciones, verificaciones y acciones de inocuidad vinculadas con producción, producto, área y vigencia.                                       | CAP-08 + inocuidad                        | `CANONICAL` |
| `VSCREEN-0175` | Seguridad de cuenta y sesiones                        | `shell`             | Permitir gestionar recuperación, factores, sesiones, dispositivos personales y cierre de cuenta sin administrar permisos empresariales.                         | AUTH + privacidad transversal             | `CANONICAL` |
| `VSCREEN-0176` | Definición de kits y conjuntos | `nexo` | Definir versiones reutilizables de kit, componentes obligatorios u opcionales, sustituciones y reglas de completitud sin operar instancias concretas. | CAP-07.11 + `VPROC-0067` | `CANONICAL` |
| `VSCREEN-0177` | Configuración de impresoras logísticas | `nexo` | Mantener impresoras, capacidades, destinos, vigencia y políticas de impresión reutilizables sin operar trabajos concretos. | CAP-15 + impresión logística | `CANONICAL` |

---

#### 13. SCREEN-COVERAGE-ADMISSION-REGISTER-001

Este registro demuestra que cada proceso aprobado fue considerado al admitir pantallas. **No sustituye** el vínculo canónico pantalla ↔ proceso de `PROC-SCREEN-003`: los grupos solo acreditan que existe una superficie candidata suficiente o una excepción deliberada, trazable y cerrada por defecto.

| Procesos fuente       | Disposición de admisión      | Aplicaciones con superficie candidata | Evidencia de cobertura de identidad                                                                           |
| --------------------- | ---------------------------- | ------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| `VPROC-0001` a `0004` | `COVERED`                    | `viso`                                | decisiones, estructura, políticas, compromisos y seguimiento                                                  |
| `VPROC-0005` a `0014` | `COVERED_WITH_DEFERRED_EDGE` | `viso`, `anima`, `numera`             | selección administrativa, vinculación, trabajo, asistencia, novedades, pagos laborales, retiro, SST e higiene |
| `VPROC-0015` a `0018` | `COVERED`                    | `nexo`, `fogo`, `pulso`               | producto, especificaciones, recetas, producción y publicación comercial                                       |
| `VPROC-0019` a `0022` | `COVERED`                    | `origo`                               | necesidad, proveedor, condiciones, orden, aprobación, recepción y diferencias                                 |
| `VPROC-0023` a `0032` | `COVERED`                    | `nexo`                                | ubicación, movimientos, conteo, condición, remisión, activos, mantenimiento, flota y reutilizables            |
| `VPROC-0033` a `0037` | `COVERED`                    | `fogo`                                | planeación, lote, calidad, empaque, trazabilidad, reproceso y cierre productivo                               |
| `VPROC-0038` a `0044` | `COVERED`                    | `pulso`, `pass`                       | salón, mostrador, canal propio o externo, catering, cambios, pago y caja                                      |
| `VPROC-0045` a `0047` | `COVERED`                    | `pulso`, `pass`                       | fidelización, reclamos, reservas, eventos y comunicaciones                                                    |
| `VPROC-0048` a `0050` | `COVERED`                    | `nexo`, `pulso`, `pass`               | planeación y ejecución logística, prueba, retorno, tercero y seguimiento visible al cliente                   |
| `VPROC-0051` a `0054` | `COVERED`                    | `numera`                              | hechos económicos, obligaciones, cartera, tesorería, conciliaciones, costos y cierre                          |
| `VPROC-0055`          | `COVERED`                    | `nexo`                                | instalaciones, limpieza, mantenimiento, plagas, servicios y calibración                                       |
| `VPROC-0056` a `0057` | `DEFERRED_APP_SCOPE`         | `aura`                                | procesos preservados; AURA es canónica pero permanece funcionalmente diferida y sin pantallas admitidas       |
| `VPROC-0058` a `0060` | `COVERED`                    | `viso`, `anima`                       | mesa y autoservicio de soporte, accesos, documentos y evidencia                                               |
| `VPROC-0061`          | `COVERED`                    | `numera`                              | indicadores, análisis, decisión, mejora y verificación                                                        |
| `VPROC-0062` a `0066` | `COVERED`                    | `viso`, `anima`                       | continuidad, riesgos empresariales, autoridades, desempeño y elementos de protección                          |
| `VPROC-0067`          | `COVERED`                    | `nexo`                                | definición, instancia y completitud de kits                                                                   |
| `VPROC-0068`          | `COVERED`                    | `pulso`, `pass`                       | captura personal y análisis operativo de satisfacción                                                         |
| `VPROC-0069`          | `COVERED`                    | `numera`                              | presupuesto, versión, aprobación, vigencia, consumo, escenario y forecast                                     |

##### 13.1 Excepciones deliberadas de admisión

| Cobertura diferida                     | Estado cerrado por defecto    | Motivo no contradictorio                                                                                      | Puerta propietaria                                                             |
| -------------------------------------- | ----------------------------- | ------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------ |
| administración de contenido y campañas | `DEFERRED_APP_SCOPE`          | AURA pertenece al catálogo canónico, pero su alcance funcional continúa diferido                              | tareas `AURA-AUD-*`, `INT-MKT-*` y decisión de continuidad funcional de AURA   |
| oportunidades de canales digitales     | `DEFERRED_APP_SCOPE`          | `VPROC-0057` conserva propiedad en AURA sin autorizar interfaz, despliegue o datos productivos                | tareas `AURA-AUD-*`, `INT-MKT-*` y posterior admisión mediante `PROC-SCREEN-*` |
| experiencia personal del candidato     | `FUTURE_PRODUCT_NOT_APP_CODE` | `vento-talento` y el esquema `talento` son base futura; no existe `app_code` canónico habilitado para asignar | `CAP-TAL-001` a `CAP-TAL-006` y gobierno del catálogo de aplicaciones          |
| superficies públicas de Vento Group    | `EXTERNAL_CHANNEL`            | el portal corporativo no se convierte por inferencia en aplicación interna ni en propietario del proceso      | arquitectura de canal externo y handoffs de E3/E4                              |
| VITAL                                  | `OUTSIDE_VENTO_OS`            | producto separado, explícitamente fuera de Vento OS                                                           | gobierno propio de VITAL                                                       |

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

1. existen exactamente 177 registros en este corte;
2. los identificadores son `VSCREEN-0001` a `VSCREEN-0177` sin duplicados ni saltos;
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
- [x] Se materializan `VSCREEN-0001` a `VSCREEN-0177` sin duplicados ni saltos.
- [x] Cada pantalla tiene exactamente una aplicación primaria.
- [x] Se utilizan únicamente códigos canónicos aprobados.
- [x] Se asignan 177 pantallas a 9 aplicaciones habilitadas.
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

**Estado:** APROBADA

**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal

**Marcador exacto que reemplaza:** `### [ ] PROC-SCREEN-003 — Vincular cada pantalla con un proceso`

**Tarea anterior:** `PROC-SCREEN-002 — Vincular cada pantalla con una aplicación` — APROBADA

**Siguiente tarea reservada:** `PROC-SCREEN-004 — Vincular cada pantalla con un paso del proceso` — NO INICIADA

**Artefactos lógicos contenidos en esta tarea:**

- `SCREEN-PROCESS-BINDING-CONTRACT-001`;
- `SCREEN-PROCESS-BINDING-REGISTER-001`;
- `SCREEN-PROCESS-COVERAGE-MATRIX-001`;
- `SCREEN-CROSS-OWNER-PROJECTION-RULES-001`;
- `SCREEN-PROCESS-CHANGE-POLICY-001`;
- `SCREEN-PROCESS-BINDING-VALIDATION-GATE-001`.

**Resultado cuantitativo aprobado:** **177 pantallas canónicas**, **177 vínculos primarios** y **272 vínculos relacionados**; **67 procesos activos** quedan cubiertos y `VPROC-0056` y `VPROC-0057` permanecen diferidos junto con AURA.

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
4. materializa 177 vínculos primarios sin duplicados ni omisiones;
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

| Campo                          | Obligación                                                                       |
| ------------------------------ | -------------------------------------------------------------------------------- |
| `screen_id`                    | `VSCREEN-*` canónico y único                                                     |
| `primary_process_id`           | exactamente un `VPROC-*` existente que explica el resultado principal            |
| `related_process_ids[]`        | cero o más procesos existentes, distintos del primario y sin duplicados          |
| `process_binding_mode`         | modalidad canónica que explica la relación entre pantalla, aplicación y proceso  |
| `process_binding_version`      | versión semántica del vínculo                                                    |
| `process_binding_reason`       | fundamento funcional verificable                                                 |
| `process_binding_task`         | tarea que propone, aprueba o modifica la relación                                |
| `process_owner_application_id` | propietaria aprobada en `PROC-CAT-005`; se consulta, no se redefine              |
| `process_binding_status`       | `PROPOSED`, `CANONICAL`, `CHANGE_PROPOSED`, `SUPERSEDED` o `RETIRED_WITH_SCREEN` |

Valores de esta propuesta:

```text
process_binding_version: 1.0.0
process_binding_status: CANONICAL
process_binding_task: PROC-SCREEN-003
decision_record: INITIAL_SCREEN_PROCESS_BINDING
```

---

#### 6. Modalidades permitidas

| Modalidad             | Uso                                                                                                                    |
| --------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| `OWNER_WORKSPACE`     | la pantalla vive en la aplicación propietaria del proceso y presenta trabajo propio                                    |
| `TRANSVERSAL_ENTRY`   | SHELL presenta entrada, contexto, notificación o recuperación y entrega el control a la propietaria                    |
| `SUPERVISION_SURFACE` | una aplicación administrativa supervisa o corrige un proceso gobernado por otra aplicación sin duplicar el hecho       |
| `PERSONAL_CHANNEL`    | ANIMA presenta o inicia la experiencia propia del trabajador frente a un proceso laboral gobernado por otra aplicación |
| `CUSTOMER_CHANNEL`    | PASS presenta o inicia la experiencia propia del cliente frente a un proceso comercial gobernado por PULSO o NEXO      |

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

| Screen ID      | Pantalla                                              | Aplicación | Proceso primario | Procesos relacionados                                  | Modalidad             | Fundamento                                                                              |
| -------------- | ----------------------------------------------------- | ---------- | ---------------- | ------------------------------------------------------ | --------------------- | --------------------------------------------------------------------------------------- |
| `VSCREEN-0001` | Hub Vento OS                                          | `shell`    | `VPROC-0059`     | `VPROC-0004`, `VPROC-0058`, `VPROC-0062`               | `TRANSVERSAL_ENTRY`   | Resuelve acceso y conduce a trabajo propietario sin ejecutarlo en SHELL.                |
| `VSCREEN-0002` | Inicio de sesión y recuperación                       | `shell`    | `VPROC-0059`     | —                                                      | `TRANSVERSAL_ENTRY`   | La autenticación habilita el ciclo de acceso, pero no concede autoridad empresarial.    |
| `VSCREEN-0003` | Resolución de contexto y acceso                       | `shell`    | `VPROC-0059`     | `VPROC-0003`                                           | `TRANSVERSAL_ENTRY`   | Explica alcance efectivo y políticas aplicables antes del handoff.                      |
| `VSCREEN-0004` | Activación de dispositivo compartido                  | `shell`    | `VPROC-0059`     | `VPROC-0058`                                           | `TRANSVERSAL_ENTRY`   | Activa una sesión técnica controlada y deriva incidencias al proceso de soporte.        |
| `VSCREEN-0005` | Bandeja transversal de tareas y notificaciones        | `shell`    | `VPROC-0004`     | `VPROC-0058`, `VPROC-0062`                             | `TRANSVERSAL_ENTRY`   | Presenta compromisos y alertas y entrega cada ejecución a su aplicación propietaria.    |
| `VSCREEN-0006` | Centro de soporte y diagnóstico                       | `shell`    | `VPROC-0058`     | `VPROC-0062`                                           | `TRANSVERSAL_ENTRY`   | Inicia diagnóstico y recuperación sin absorber el caso tecnológico o de continuidad.    |
| `VSCREEN-0007` | Inicio ejecutivo y gerencial                          | `viso`     | `VPROC-0001`     | `VPROC-0061`, `VPROC-0063`                             | `OWNER_WORKSPACE`     | Consolida decisiones, indicadores y riesgos que requieren seguimiento directivo.        |
| `VSCREEN-0008` | Estructura organizativa                               | `viso`     | `VPROC-0002`     | —                                                      | `OWNER_WORKSPACE`     | Mantiene la estructura canónica sin derivar autorización de la jerarquía.               |
| `VSCREEN-0009` | Políticas, delegaciones y límites                     | `viso`     | `VPROC-0003`     | `VPROC-0059`                                           | `OWNER_WORKSPACE`     | Gobierna políticas y delegaciones que luego condicionan accesos.                        |
| `VSCREEN-0010` | Compromisos y transferencias internas                 | `viso`     | `VPROC-0004`     | `VPROC-0001`                                           | `OWNER_WORKSPACE`     | Conserva responsable, entrega, aceptación y cierre transversal.                         |
| `VSCREEN-0011` | Embudo de candidatos                                  | `viso`     | `VPROC-0005`     | —                                                      | `OWNER_WORKSPACE`     | Organiza necesidad, vacante, candidatura y etapa sin crear vínculo laboral.             |
| `VSCREEN-0012` | Caso de selección                                     | `viso`     | `VPROC-0005`     | `VPROC-0060`                                           | `OWNER_WORKSPACE`     | Evalúa y decide con evidencia sin convertir al candidato en trabajador.                 |
| `VSCREEN-0013` | Vinculación e incorporación                           | `viso`     | `VPROC-0006`     | `VPROC-0059`, `VPROC-0060`                             | `OWNER_WORKSPACE`     | Orquesta vínculo, documentos y habilitación inicial.                                    |
| `VSCREEN-0014` | Directorio y expediente laboral                       | `viso`     | `VPROC-0006`     | `VPROC-0007`, `VPROC-0009`, `VPROC-0011`, `VPROC-0060` | `OWNER_WORKSPACE`     | Conserva el expediente laboral y sus episodios sin mezclar solicitudes personales.      |
| `VSCREEN-0015` | Programación laboral                                  | `viso`     | `VPROC-0007`     | `VPROC-0009`                                           | `OWNER_WORKSPACE`     | Publica asignaciones y programación con historial.                                      |
| `VSCREEN-0016` | Revisión de asistencia                                | `viso`     | `VPROC-0008`     | `VPROC-0007`, `VPROC-0009`                             | `SUPERVISION_SURFACE` | Supervisa y corrige hechos de ANIMA mediante decisión autorizada, sin reescribirlos.    |
| `VSCREEN-0017` | Novedades, ausencias y reemplazos                     | `viso`     | `VPROC-0009`     | `VPROC-0007`, `VPROC-0008`                             | `OWNER_WORKSPACE`     | Resuelve el caso laboral y sus efectos sobre programación y asistencia.                 |
| `VSCREEN-0018` | Retiro y revocación coordinada                        | `viso`     | `VPROC-0011`     | `VPROC-0029`, `VPROC-0059`, `VPROC-0060`               | `OWNER_WORKSPACE`     | Coordina cierre laboral, devolución, revocación y evidencia.                            |
| `VSCREEN-0019` | Catálogo de roles y permisos                          | `viso`     | `VPROC-0059`     | `VPROC-0003`                                           | `OWNER_WORKSPACE`     | Gobierna definición y vigencia de acceso tecnológico.                                   |
| `VSCREEN-0020` | Perfil de acceso del trabajador                       | `viso`     | `VPROC-0059`     | `VPROC-0006`, `VPROC-0007`                             | `OWNER_WORKSPACE`     | Vincula autoridad laboral vigente con solicitudes y revocaciones de acceso.             |
| `VSCREEN-0021` | Simulación de permisos y conflictos                   | `viso`     | `VPROC-0059`     | `VPROC-0003`                                           | `OWNER_WORKSPACE`     | Evalúa alcance y conflictos sin conceder permisos por simulación.                       |
| `VSCREEN-0022` | Gobierno de dispositivos compartidos                  | `viso`     | `VPROC-0059`     | `VPROC-0058`                                           | `OWNER_WORKSPACE`     | Gobierna habilitación, vigencia y revocación de dispositivos compartidos.               |
| `VSCREEN-0023` | Riesgos de seguridad y salud                          | `viso`     | `VPROC-0012`     | `VPROC-0063`                                           | `OWNER_WORKSPACE`     | Mantiene riesgos SST, controles y acciones correctivas.                                 |
| `VSCREEN-0024` | Incidentes y emergencias                              | `viso`     | `VPROC-0013`     | `VPROC-0062`                                           | `OWNER_WORKSPACE`     | Conserva respuesta, expediente, investigación y seguimiento.                            |
| `VSCREEN-0025` | Controles de higiene y cumplimiento                   | `viso`     | `VPROC-0014`     | `VPROC-0012`                                           | `OWNER_WORKSPACE`     | Gobierna obligaciones y hallazgos sin sustituir el control operativo de dominio.        |
| `VSCREEN-0026` | Bandeja de casos administrativos transversales        | `viso`     | `VPROC-0004`     | `VPROC-0060`, `VPROC-0063`, `VPROC-0064`               | `OWNER_WORKSPACE`     | Coordina casos administrativos sin mezclarlos con soporte o instalaciones.              |
| `VSCREEN-0027` | Inicio personal del trabajador                        | `anima`    | `VPROC-0007`     | `VPROC-0008`, `VPROC-0009`                             | `PERSONAL_CHANNEL`    | Presenta al trabajador su programación, asistencia y solicitudes propias.               |
| `VSCREEN-0028` | Registro de entrada, pausa y salida                   | `anima`    | `VPROC-0008`     | —                                                      | `OWNER_WORKSPACE`     | Captura hechos personales e inmutables de asistencia.                                   |
| `VSCREEN-0029` | Mi programación                                       | `anima`    | `VPROC-0007`     | —                                                      | `PERSONAL_CHANNEL`    | Proyecta la programación publicada por VISO sin mantener otra fuente.                   |
| `VSCREEN-0030` | Mi asistencia y solicitud de corrección               | `anima`    | `VPROC-0008`     | `VPROC-0009`                                           | `OWNER_WORKSPACE`     | Presenta hechos propios e inicia correcciones trazables.                                |
| `VSCREEN-0031` | Mis novedades, permisos y ausencias                   | `anima`    | `VPROC-0009`     | `VPROC-0007`                                           | `PERSONAL_CHANNEL`    | Inicia y consulta el caso personal cuya decisión gobierna VISO.                         |
| `VSCREEN-0032` | Mi perfil laboral                                     | `anima`    | `VPROC-0006`     | `VPROC-0011`                                           | `PERSONAL_CHANNEL`    | Proyecta vínculo vigente y datos personales permitidos.                                 |
| `VSCREEN-0033` | Resumen de inventario y abastecimiento interno        | `nexo`     | `VPROC-0028`     | `VPROC-0019`, `VPROC-0024`, `VPROC-0025`               | `OWNER_WORKSPACE`     | Resume necesidades, existencias y movimientos sin crear compras.                        |
| `VSCREEN-0034` | Catálogo de productos físicos                         | `nexo`     | `VPROC-0015`     | `VPROC-0018`                                           | `OWNER_WORKSPACE`     | Mantiene identidad física, presentación y relación con especificaciones.                |
| `VSCREEN-0035` | Editor de producto, unidad y presentación             | `nexo`     | `VPROC-0015`     | —                                                      | `OWNER_WORKSPACE`     | Edita el maestro físico y sus equivalencias.                                            |
| `VSCREEN-0036` | Especificaciones y criterios de calidad               | `nexo`     | `VPROC-0018`     | `VPROC-0015`, `VPROC-0035`                             | `OWNER_WORKSPACE`     | Mantiene especificación maestra y criterios consumidos por calidad.                     |
| `VSCREEN-0037` | Catálogo de ubicaciones                               | `nexo`     | `VPROC-0023`     | —                                                      | `OWNER_WORKSPACE`     | Gobierna ubicaciones y condiciones sin confundirlas con existencia.                     |
| `VSCREEN-0038` | Identificación y detalle de ubicación                 | `nexo`     | `VPROC-0023`     | `VPROC-0024`                                           | `OWNER_WORKSPACE`     | Identifica la ubicación y muestra movimientos autorizados relacionados.                 |
| `VSCREEN-0039` | Consulta de existencias                               | `nexo`     | `VPROC-0024`     | `VPROC-0025`, `VPROC-0027`                             | `OWNER_WORKSPACE`     | Proyecta saldo desde movimientos y condición física.                                    |
| `VSCREEN-0040` | Conteo de inventario                                  | `nexo`     | `VPROC-0026`     | —                                                      | `OWNER_WORKSPACE`     | Registra observaciones de conteo sin ajustar automáticamente.                           |
| `VSCREEN-0041` | Revisión de conteo y diferencias                      | `nexo`     | `VPROC-0026`     | `VPROC-0060`                                           | `OWNER_WORKSPACE`     | Investiga diferencias y conserva evidencia.                                             |
| `VSCREEN-0042` | Caso de ajuste de inventario                          | `nexo`     | `VPROC-0026`     | `VPROC-0051`                                           | `OWNER_WORKSPACE`     | Separa la decisión de ajuste de la observación y del efecto económico.                  |
| `VSCREEN-0043` | Confirmación de entrada a inventario                  | `nexo`     | `VPROC-0024`     | `VPROC-0022`                                           | `OWNER_WORKSPACE`     | Registra el efecto físico después de la aceptación de ORIGO.                            |
| `VSCREEN-0044` | Retiro y consumo de existencias                       | `nexo`     | `VPROC-0025`     | `VPROC-0034`                                           | `OWNER_WORKSPACE`     | Conserva origen, unidad, destino y motivo del retiro.                                   |
| `VSCREEN-0045` | Traslado interno de existencias                       | `nexo`     | `VPROC-0025`     | `VPROC-0023`                                           | `OWNER_WORKSPACE`     | Ejecuta traslado correlacionado entre ubicaciones.                                      |
| `VSCREEN-0046` | Solicitud de remisión                                 | `nexo`     | `VPROC-0028`     | —                                                      | `OWNER_WORKSPACE`     | Inicia abastecimiento interno con cantidades conciliables.                              |
| `VSCREEN-0047` | Preparación de remisión                               | `nexo`     | `VPROC-0028`     | `VPROC-0025`                                           | `OWNER_WORKSPACE`     | Reserva y prepara existencias sin anticipar despacho.                                   |
| `VSCREEN-0048` | Carga y despacho de remisión                          | `nexo`     | `VPROC-0028`     | `VPROC-0048`                                           | `OWNER_WORKSPACE`     | Entrega custodia al tránsito y, cuando aplica, a la ruta planificada.                   |
| `VSCREEN-0049` | Seguimiento de remisión en tránsito                   | `nexo`     | `VPROC-0028`     | `VPROC-0049`                                           | `OWNER_WORKSPACE`     | Sigue custodia y novedades hasta la recepción interna.                                  |
| `VSCREEN-0050` | Recepción de remisión                                 | `nexo`     | `VPROC-0028`     | `VPROC-0024`                                           | `OWNER_WORKSPACE`     | Cierra cantidades por etapa y registra entrada física correlacionada.                   |
| `VSCREEN-0051` | Vencimiento, cuarentena, daño y merma                 | `nexo`     | `VPROC-0027`     | `VPROC-0014`, `VPROC-0035`                             | `OWNER_WORKSPACE`     | Gobierna condición y disposición física con controles de cumplimiento.                  |
| `VSCREEN-0052` | LPN, contenedores y reutilizables                     | `nexo`     | `VPROC-0032`     | `VPROC-0029`                                           | `OWNER_WORKSPACE`     | Conserva identidad, tenencia, retorno y completitud de contenedores.                    |
| `VSCREEN-0053` | Activos y custodia                                    | `nexo`     | `VPROC-0029`     | `VPROC-0030`                                           | `OWNER_WORKSPACE`     | Mantiene identidad, ubicación, custodio y condición del activo.                         |
| `VSCREEN-0054` | Etiquetas e impresión logística                       | `nexo`     | `VPROC-0024`     | `VPROC-0015`, `VPROC-0023`, `VPROC-0032`               | `OWNER_WORKSPACE`     | Materializa identificación logística sin alterar maestros ni movimientos.               |
| `VSCREEN-0055` | Inicio y cola de producción                           | `fogo`     | `VPROC-0033`     | `VPROC-0034`                                           | `OWNER_WORKSPACE`     | Presenta planes liberados y lotes ejecutables.                                          |
| `VSCREEN-0056` | Planeación de producción                              | `fogo`     | `VPROC-0033`     | `VPROC-0028`                                           | `OWNER_WORKSPACE`     | Convierte señales de demanda y capacidad en un plan aprobado.                           |
| `VSCREEN-0057` | Preparación e inicio de lote                          | `fogo`     | `VPROC-0034`     | `VPROC-0016`, `VPROC-0025`                             | `OWNER_WORKSPACE`     | Fija receta, materiales y lote antes de ejecutar.                                       |
| `VSCREEN-0058` | Ejecución de lote                                     | `fogo`     | `VPROC-0034`     | `VPROC-0025`, `VPROC-0035`                             | `OWNER_WORKSPACE`     | Registra consumo, producción y controles durante la ejecución.                          |
| `VSCREEN-0059` | Registro parcial de producción                        | `fogo`     | `VPROC-0034`     | `VPROC-0037`                                           | `OWNER_WORKSPACE`     | Conserva avances parciales sin cerrar prematuramente el resultado.                      |
| `VSCREEN-0060` | Finalización y cierre de lote                         | `fogo`     | `VPROC-0037`     | `VPROC-0034`, `VPROC-0035`, `VPROC-0036`               | `OWNER_WORKSPACE`     | Concilia rendimiento, merma, calidad, empaque y cierre.                                 |
| `VSCREEN-0061` | Receta operativa                                      | `fogo`     | `VPROC-0016`     | `VPROC-0034`                                           | `OWNER_WORKSPACE`     | Presenta la versión aprobada utilizada por el lote.                                     |
| `VSCREEN-0062` | Catálogo y editor de recetas                          | `fogo`     | `VPROC-0016`     | `VPROC-0015`, `VPROC-0018`                             | `OWNER_WORKSPACE`     | Mantiene receta y referencia maestros físicos sin duplicarlos.                          |
| `VSCREEN-0063` | Revisión, aprobación y publicación de receta          | `fogo`     | `VPROC-0016`     | `VPROC-0060`                                           | `OWNER_WORKSPACE`     | Versiona la decisión y su evidencia.                                                    |
| `VSCREEN-0064` | Prueba de receta y rendimiento                        | `fogo`     | `VPROC-0016`     | `VPROC-0037`                                           | `OWNER_WORKSPACE`     | Conserva prueba, resultado y decisión antes de publicar.                                |
| `VSCREEN-0065` | Control de calidad y liberación                       | `fogo`     | `VPROC-0035`     | `VPROC-0018`, `VPROC-0027`                             | `OWNER_WORKSPACE`     | Decide liberación, retención, rechazo o corrección.                                     |
| `VSCREEN-0066` | Empaque, etiquetado y almacenamiento de terminado     | `fogo`     | `VPROC-0036`     | `VPROC-0024`, `VPROC-0035`                             | `OWNER_WORKSPACE`     | Conserva empaque y trazabilidad antes del ingreso a NEXO.                               |
| `VSCREEN-0067` | Reproceso, aprovechamiento, merma y cierre productivo | `fogo`     | `VPROC-0037`     | `VPROC-0027`, `VPROC-0054`                             | `OWNER_WORKSPACE`     | Gobierna disposición productiva y proyecta el resultado económico.                      |
| `VSCREEN-0068` | Bandeja de necesidades de compra                      | `origo`    | `VPROC-0019`     | `VPROC-0028`                                           | `OWNER_WORKSPACE`     | Recibe y prioriza necesidades sin crear una orden.                                      |
| `VSCREEN-0069` | Solicitud de compra                                   | `origo`    | `VPROC-0019`     | `VPROC-0020`                                           | `OWNER_WORKSPACE`     | Formaliza necesidad, alcance y evidencia para decidir abastecimiento.                   |
| `VSCREEN-0070` | Catálogo de proveedores                               | `origo`    | `VPROC-0020`     | —                                                      | `OWNER_WORKSPACE`     | Presenta proveedores y condiciones aptas para comparación.                              |
| `VSCREEN-0071` | Alta y expediente de proveedor                        | `origo`    | `VPROC-0020`     | `VPROC-0060`                                           | `OWNER_WORKSPACE`     | Conserva identidad, documentos y vigencias del proveedor.                               |
| `VSCREEN-0072` | Comparación de cotizaciones                           | `origo`    | `VPROC-0020`     | `VPROC-0019`                                           | `OWNER_WORKSPACE`     | Compara condiciones con evidencia sin emitir compra.                                    |
| `VSCREEN-0073` | Editor de orden de compra                             | `origo`    | `VPROC-0021`     | `VPROC-0020`                                           | `OWNER_WORKSPACE`     | Prepara la orden bajo condiciones seleccionadas.                                        |
| `VSCREEN-0074` | Bandeja de aprobaciones de compra                     | `origo`    | `VPROC-0021`     | `VPROC-0003`                                           | `OWNER_WORKSPACE`     | Aplica autoridad y límites sin aceptar físicamente la compra.                           |
| `VSCREEN-0075` | Detalle y seguimiento de orden                        | `origo`    | `VPROC-0021`     | `VPROC-0022`                                           | `OWNER_WORKSPACE`     | Sigue compromiso comercial hasta recepción y cierre.                                    |
| `VSCREEN-0076` | Cola de recepciones                                   | `origo`    | `VPROC-0022`     | `VPROC-0021`                                           | `OWNER_WORKSPACE`     | Presenta órdenes susceptibles de aceptación comercial y física.                         |
| `VSCREEN-0077` | Recepción total o parcial                             | `origo`    | `VPROC-0022`     | `VPROC-0024`, `VPROC-0051`                             | `OWNER_WORKSPACE`     | Acepta o rechaza recepción y emite efectos posteriores correlacionados.                 |
| `VSCREEN-0078` | Resolución de diferencias de recepción                | `origo`    | `VPROC-0022`     | `VPROC-0020`, `VPROC-0052`                             | `OWNER_WORKSPACE`     | Resuelve faltantes, sobrantes, calidad y efecto económico sin doble recepción.          |
| `VSCREEN-0079` | Historial y auditoría de abastecimiento               | `origo`    | `VPROC-0022`     | `VPROC-0019`, `VPROC-0020`, `VPROC-0021`, `VPROC-0060` | `OWNER_WORKSPACE`     | Reconstruye el ciclo de compra con evidencia y decisiones.                              |
| `VSCREEN-0080` | Inicio POS                                            | `pulso`    | `VPROC-0039`     | `VPROC-0038`, `VPROC-0044`                             | `OWNER_WORKSPACE`     | Presenta trabajo comercial abierto por canal y caja.                                    |
| `VSCREEN-0081` | Creación de venta o pedido                            | `pulso`    | `VPROC-0039`     | `VPROC-0038`, `VPROC-0040`, `VPROC-0041`               | `OWNER_WORKSPACE`     | Crea el compromiso comercial bajo el canal seleccionado.                                |
| `VSCREEN-0082` | Mapa de salón y mesas                                 | `pulso`    | `VPROC-0038`     | —                                                      | `OWNER_WORKSPACE`     | Gobierna ocupación, mesa y servicio de apertura a cierre.                               |
| `VSCREEN-0083` | Detalle y modificación de pedido                      | `pulso`    | `VPROC-0038`     | `VPROC-0039`, `VPROC-0042`                             | `OWNER_WORKSPACE`     | Mantiene el pedido y separa cambios materiales y compensaciones.                        |
| `VSCREEN-0084` | Cobro y medios de pago                                | `pulso`    | `VPROC-0043`     | `VPROC-0051`                                           | `OWNER_WORKSPACE`     | Cobra, confirma y emite soporte conciliable.                                            |
| `VSCREEN-0085` | Identificación de cliente y acumulación               | `pulso`    | `VPROC-0045`     | `VPROC-0038`, `VPROC-0039`                             | `SUPERVISION_SURFACE` | Ejecuta acumulación durante la venta sin mantener el ledger de PASS.                    |
| `VSCREEN-0086` | Redención de puntos o beneficios                      | `pulso`    | `VPROC-0045`     | `VPROC-0043`                                           | `SUPERVISION_SURFACE` | Solicita redención y aplica su resultado a la venta.                                    |
| `VSCREEN-0087` | Bandeja de pedidos de canales externos                | `pulso`    | `VPROC-0040`     | `VPROC-0042`, `VPROC-0050`                             | `OWNER_WORKSPACE`     | Normaliza, deduplica y admite pedidos externos.                                         |
| `VSCREEN-0088` | Seguimiento de preparación y entrega                  | `pulso`    | `VPROC-0039`     | `VPROC-0038`, `VPROC-0040`, `VPROC-0050`               | `OWNER_WORKSPACE`     | Sigue el compromiso comercial desde preparación hasta entrega.                          |
| `VSCREEN-0089` | Apertura de caja                                      | `pulso`    | `VPROC-0044`     | —                                                      | `OWNER_WORKSPACE`     | Inicia responsabilidad y fondo de caja.                                                 |
| `VSCREEN-0090` | Cierre de caja                                        | `pulso`    | `VPROC-0044`     | `VPROC-0051`                                           | `OWNER_WORKSPACE`     | Concilia ventas, pagos, efectivo y diferencias.                                         |
| `VSCREEN-0091` | Anulación, devolución y reembolso                     | `pulso`    | `VPROC-0042`     | `VPROC-0043`, `VPROC-0046`, `VPROC-0051`               | `OWNER_WORKSPACE`     | Separa decisión comercial de devolución, pago y compensación.                           |
| `VSCREEN-0092` | Oferta, menú, precio comercial y disponibilidad       | `pulso`    | `VPROC-0017`     | `VPROC-0015`, `VPROC-0016`                             | `OWNER_WORKSPACE`     | Publica oferta vendible desde maestros y recetas gobernados.                            |
| `VSCREEN-0093` | Revisión de ventas, caja y terminales                 | `pulso`    | `VPROC-0044`     | `VPROC-0043`, `VPROC-0061`                             | `OWNER_WORKSPACE`     | Supervisa cierres y diferencias y alimenta análisis.                                    |
| `VSCREEN-0094` | Inicio financiero y ejecutivo                         | `numera`   | `VPROC-0061`     | `VPROC-0051`, `VPROC-0054`, `VPROC-0069`               | `OWNER_WORKSPACE`     | Presenta medición, cierre, presupuesto y decisiones financieras.                        |
| `VSCREEN-0095` | Bandeja de hechos económicos                          | `numera`   | `VPROC-0051`     | —                                                      | `OWNER_WORKSPACE`     | Recibe y clasifica hechos correlacionados con su origen.                                |
| `VSCREEN-0096` | Registro de gasto y soporte                           | `numera`   | `VPROC-0051`     | `VPROC-0060`                                           | `OWNER_WORKSPACE`     | Registra el hecho económico y conserva soporte verificable.                             |
| `VSCREEN-0097` | Bandeja de aprobaciones financieras                   | `numera`   | `VPROC-0052`     | `VPROC-0054`, `VPROC-0069`                             | `OWNER_WORKSPACE`     | Aplica decisión financiera sin recrear el compromiso operativo.                         |
| `VSCREEN-0098` | Cuentas por pagar y obligaciones                      | `numera`   | `VPROC-0052`     | `VPROC-0022`                                           | `OWNER_WORKSPACE`     | Gobierna obligación, aprobación, pago y conciliación.                                   |
| `VSCREEN-0099` | Cuentas por cobrar y cartera                          | `numera`   | `VPROC-0053`     | `VPROC-0041`, `VPROC-0043`                             | `OWNER_WORKSPACE`     | Conserva cartera, recaudo, aplicación y saldo.                                          |
| `VSCREEN-0100` | Caja, bancos y movimientos financieros                | `numera`   | `VPROC-0052`     | `VPROC-0053`                                           | `OWNER_WORKSPACE`     | Gestiona tesorería y movimientos que liquidan obligaciones o cartera.                   |
| `VSCREEN-0101` | Conciliación de ventas y pagos                        | `numera`   | `VPROC-0051`     | `VPROC-0043`, `VPROC-0044`                             | `OWNER_WORKSPACE`     | Concilia hechos comerciales sin reescribir ventas ni cajas.                             |
| `VSCREEN-0102` | Conciliación de compras y recepciones                 | `numera`   | `VPROC-0051`     | `VPROC-0022`, `VPROC-0052`                             | `OWNER_WORKSPACE`     | Concilia compra, recepción, obligación y pago.                                          |
| `VSCREEN-0103` | Conciliación de inventario, producción y variaciones  | `numera`   | `VPROC-0054`     | `VPROC-0024`, `VPROC-0025`, `VPROC-0037`               | `OWNER_WORKSPACE`     | Analiza efectos físicos y productivos sin duplicar sus ledgers.                         |
| `VSCREEN-0104` | Costos, rentabilidad y escenarios                     | `numera`   | `VPROC-0054`     | `VPROC-0069`                                           | `OWNER_WORKSPACE`     | Calcula costos, rentabilidad y escenarios con reglas versionadas.                       |
| `VSCREEN-0105` | Cierre, reapertura y corrección de periodo            | `numera`   | `VPROC-0054`     | `VPROC-0051`                                           | `OWNER_WORKSPACE`     | Gobierna cierre y correcciones sin alterar historia.                                    |
| `VSCREEN-0106` | Reportes y exportaciones financieras                  | `numera`   | `VPROC-0061`     | `VPROC-0054`                                           | `OWNER_WORKSPACE`     | Publica análisis y evidencia derivados de hechos conciliados.                           |
| `VSCREEN-0107` | Inicio del cliente y resumen de beneficios            | `pass`     | `VPROC-0045`     | `VPROC-0068`                                           | `OWNER_WORKSPACE`     | Presenta relación, saldo, beneficios y experiencia personal.                            |
| `VSCREEN-0108` | QR personal de identificación                         | `pass`     | `VPROC-0045`     | —                                                      | `OWNER_WORKSPACE`     | Presenta credencial personal sin ejecutar acumulación o redención.                      |
| `VSCREEN-0109` | Catálogo de beneficios y recompensas                  | `pass`     | `VPROC-0045`     | `VPROC-0017`                                           | `OWNER_WORKSPACE`     | Proyecta beneficios vigentes y condiciones comerciales.                                 |
| `VSCREEN-0110` | Ticket o QR de redención                              | `pass`     | `VPROC-0045`     | `VPROC-0043`                                           | `OWNER_WORKSPACE`     | Prepara una intención de redención que PULSO aplica en la venta.                        |
| `VSCREEN-0111` | Historial de puntos y redenciones                     | `pass`     | `VPROC-0045`     | —                                                      | `OWNER_WORKSPACE`     | Consulta el ledger personal y sus receipts.                                             |
| `VSCREEN-0112` | Perfil, privacidad y consentimientos                  | `pass`     | `VPROC-0045`     | `VPROC-0060`                                           | `OWNER_WORKSPACE`     | Gobierna perfil de fidelización y consentimientos trazables.                            |
| `VSCREEN-0113` | Registro y seguimiento de decisiones empresariales    | `viso`     | `VPROC-0001`     | `VPROC-0004`                                           | `OWNER_WORKSPACE`     | Conserva decisión, autoridad, compromisos y verificación.                               |
| `VSCREEN-0114` | Solicitudes y certificaciones de acceso               | `viso`     | `VPROC-0059`     | `VPROC-0060`                                           | `OWNER_WORKSPACE`     | Gestiona solicitud, aprobación, vigencia, revocación y evidencia.                       |
| `VSCREEN-0115` | Gobierno de documentos y evidencia                    | `viso`     | `VPROC-0060`     | `VPROC-0003`                                           | `OWNER_WORKSPACE`     | Gobierna clasificación, custodia, retención y disposición.                              |
| `VSCREEN-0116` | Registro de riesgos empresariales                     | `viso`     | `VPROC-0063`     | `VPROC-0012`                                           | `OWNER_WORKSPACE`     | Mantiene riesgo, tratamiento, aceptación y seguimiento empresarial.                     |
| `VSCREEN-0117` | Requerimientos de asesores y autoridades              | `viso`     | `VPROC-0064`     | `VPROC-0060`                                           | `OWNER_WORKSPACE`     | Conserva obligación, vencimiento, responsable, entrega y evidencia.                     |
| `VSCREEN-0118` | Gestión de desempeño y desarrollo                     | `viso`     | `VPROC-0065`     | `VPROC-0060`                                           | `OWNER_WORKSPACE`     | Gobierna objetivos, retroalimentación y decisiones sensibles.                           |
| `VSCREEN-0119` | Asignación y control de elementos de protección       | `viso`     | `VPROC-0066`     | `VPROC-0025`, `VPROC-0029`                             | `OWNER_WORKSPACE`     | Gobierna necesidad y asignación personal; NEXO conserva existencias.                    |
| `VSCREEN-0120` | Mesa de servicio tecnológico                          | `viso`     | `VPROC-0058`     | `VPROC-0059`, `VPROC-0060`                             | `OWNER_WORKSPACE`     | Conserva solicitud, incidente, problema, cambio, SLA y cierre.                          |
| `VSCREEN-0121` | Continuidad, contingencia y recuperación              | `viso`     | `VPROC-0062`     | `VPROC-0004`, `VPROC-0060`                             | `OWNER_WORKSPACE`     | Gobierna plan, incidente empresarial, recuperación y aprendizaje.                       |
| `VSCREEN-0122` | Privacidad, cumplimiento y conservación               | `viso`     | `VPROC-0060`     | `VPROC-0003`, `VPROC-0063`, `VPROC-0064`               | `OWNER_WORKSPACE`     | Articula políticas, riesgos, obligaciones, retención y evidencia.                       |
| `VSCREEN-0123` | Gestión de comunicaciones internas                    | `viso`     | `VPROC-0004`     | `VPROC-0060`                                           | `OWNER_WORKSPACE`     | Gobierna comunicación laboral, entrega, acuse y seguimiento.                            |
| `VSCREEN-0124` | Mis comunicados laborales                             | `anima`    | `VPROC-0004`     | `VPROC-0060`                                           | `PERSONAL_CHANNEL`    | Presenta al trabajador comunicaciones y acuses propios.                                 |
| `VSCREEN-0125` | Mi carnet laboral                                     | `anima`    | `VPROC-0006`     | `VPROC-0059`                                           | `PERSONAL_CHANNEL`    | Proyecta identidad laboral vigente sin convertirla en permiso universal.                |
| `VSCREEN-0126` | Mis documentos laborales                              | `anima`    | `VPROC-0060`     | `VPROC-0006`                                           | `PERSONAL_CHANNEL`    | Permite consulta y entrega personal bajo custodia y retención gobernadas.               |
| `VSCREEN-0127` | Mi capacitación                                       | `anima`    | `VPROC-0065`     | `VPROC-0014`                                           | `PERSONAL_CHANNEL`    | Presenta aprendizaje y evidencia personal vinculados al desarrollo o cumplimiento.      |
| `VSCREEN-0128` | Mis objetivos y retroalimentación                     | `anima`    | `VPROC-0065`     | —                                                      | `PERSONAL_CHANNEL`    | Presenta la experiencia personal sin abrir información de terceros.                     |
| `VSCREEN-0129` | Mis solicitudes de soporte                            | `anima`    | `VPROC-0058`     | —                                                      | `PERSONAL_CHANNEL`    | Inicia y consulta solicitudes propias; VISO gobierna resolución y SLA.                  |
| `VSCREEN-0130` | Mis reportes de seguridad y salud                     | `anima`    | `VPROC-0013`     | `VPROC-0012`                                           | `PERSONAL_CHANNEL`    | Permite reportar incidentes o riesgos propios y recibir seguimiento mínimo.             |
| `VSCREEN-0131` | Mis elementos de protección                           | `anima`    | `VPROC-0066`     | `VPROC-0029`                                           | `PERSONAL_CHANNEL`    | Presenta asignación, aceptación, vigencia y devolución personal.                        |
| `VSCREEN-0132` | Reservas de inventario                                | `nexo`     | `VPROC-0028`     | `VPROC-0025`, `VPROC-0033`                             | `OWNER_WORKSPACE`     | Reserva disponibilidad para una necesidad autorizada sin registrar consumo.             |
| `VSCREEN-0133` | Planes y órdenes de mantenimiento de activos          | `nexo`     | `VPROC-0030`     | `VPROC-0029`, `VPROC-0055`                             | `OWNER_WORKSPACE`     | Gobierna mantenimiento del activo y su liberación.                                      |
| `VSCREEN-0134` | Garantías, seguros y reclamaciones de activos         | `nexo`     | `VPROC-0030`     | `VPROC-0020`, `VPROC-0060`                             | `OWNER_WORKSPACE`     | Conserva caso, cobertura, proveedor, evidencia y resultado del activo.                  |
| `VSCREEN-0135` | Instancias y operación de kits | `nexo` | `VPROC-0067` | `VPROC-0029`, `VPROC-0032` | `OWNER_WORKSPACE` | Gobierna armado, custodia, completitud, préstamo, devolución y sustitución de instancias. |
| `VSCREEN-0136` | Flota y vehículos                                     | `nexo`     | `VPROC-0031`     | `VPROC-0029`, `VPROC-0048`                             | `OWNER_WORKSPACE`     | Conserva vehículo, disponibilidad, condición e incidencias.                             |
| `VSCREEN-0137` | Kilometraje y combustible                             | `nexo`     | `VPROC-0031`     | `VPROC-0054`                                           | `OWNER_WORKSPACE`     | Registra uso y consumo y proyecta su costo.                                             |
| `VSCREEN-0138` | Planeación de rutas y despachos                       | `nexo`     | `VPROC-0048`     | `VPROC-0028`, `VPROC-0031`                             | `OWNER_WORKSPACE`     | Planifica vehículo, carga, secuencia y restricciones.                                   |
| `VSCREEN-0139` | Ejecución de ruta y prueba de entrega                 | `nexo`     | `VPROC-0049`     | `VPROC-0048`                                           | `OWNER_WORKSPACE`     | Conserva custodia, prueba, rechazo, novedad o retorno.                                  |
| `VSCREEN-0140` | Novedades, rechazos y retornos logísticos             | `nexo`     | `VPROC-0049`     | `VPROC-0027`, `VPROC-0032`                             | `OWNER_WORKSPACE`     | Resuelve efectos físicos de la ejecución logística.                                     |
| `VSCREEN-0141` | Instalaciones, servicios y mantenimiento locativo     | `nexo`     | `VPROC-0055`     | `VPROC-0012`, `VPROC-0030`                             | `OWNER_WORKSPACE`     | Gobierna condición y cierre de instalaciones sin mezclarse con soporte TI.              |
| `VSCREEN-0142` | Configuración de políticas y rutas logísticas         | `nexo`     | `VPROC-0048`     | `VPROC-0028`, `VPROC-0049`                             | `OWNER_WORKSPACE`     | Versiona restricciones y reglas logísticas.                                             |
| `VSCREEN-0143` | Diseñador de etiquetas logísticas                     | `nexo`     | `VPROC-0015`     | `VPROC-0023`, `VPROC-0032`                             | `OWNER_WORKSPACE`     | Diseña identificación desde maestros físicos y contextos logísticos.                    |
| `VSCREEN-0144` | Cola y trabajos de impresión logística | `nexo` | `VPROC-0024` | `VPROC-0015`, `VPROC-0023` | `OWNER_WORKSPACE` | Opera la cola y los trabajos de impresión correlacionados con el objeto autorizado. |
| `VSCREEN-0145` | Contratos, precios y condiciones de proveedor         | `origo`    | `VPROC-0020`     | `VPROC-0021`, `VPROC-0060`                             | `OWNER_WORKSPACE`     | Gobierna condiciones comparables y vigentes antes de comprar.                           |
| `VSCREEN-0146` | Desempeño y reclamaciones de proveedor                | `origo`    | `VPROC-0020`     | `VPROC-0022`, `VPROC-0061`                             | `OWNER_WORKSPACE`     | Evalúa proveedor desde evidencia de recepción y resultado.                              |
| `VSCREEN-0147` | Oportunidades y cotizaciones de catering o B2B        | `pulso`    | `VPROC-0041`     | `VPROC-0017`, `VPROC-0047`                             | `OWNER_WORKSPACE`     | Conserva propuesta, capacidad, condiciones y aprobación comercial.                      |
| `VSCREEN-0148` | Ejecución de catering o venta B2B                     | `pulso`    | `VPROC-0041`     | `VPROC-0033`, `VPROC-0043`, `VPROC-0048`               | `OWNER_WORKSPACE`     | Sigue producción, facturación y entrega sin transferir sus dominios.                    |
| `VSCREEN-0149` | Operación de reservas y eventos                       | `pulso`    | `VPROC-0047`     | `VPROC-0038`, `VPROC-0041`                             | `OWNER_WORKSPACE`     | Gobierna capacidad comprometida, reserva y relación con el pedido.                      |
| `VSCREEN-0150` | Casos de reclamo y compensación                       | `pulso`    | `VPROC-0046`     | `VPROC-0042`, `VPROC-0051`, `VPROC-0061`               | `OWNER_WORKSPACE`     | Conserva reclamo, causa, resolución, compensación y aprendizaje.                        |
| `VSCREEN-0151` | Coordinación de entrega mediante tercero              | `pulso`    | `VPROC-0050`     | `VPROC-0039`, `VPROC-0040`                             | `OWNER_WORKSPACE`     | Conserva promesa, seguimiento, prueba y conciliación del tercero.                       |
| `VSCREEN-0152` | Análisis de satisfacción y servicio                   | `pulso`    | `VPROC-0068`     | `VPROC-0046`, `VPROC-0061`                             | `OWNER_WORKSPACE`     | Separa medición, reclamo, compensación y mejora.                                        |
| `VSCREEN-0153` | Paquete laboral para pagos y beneficios               | `numera`   | `VPROC-0010`     | `VPROC-0007`, `VPROC-0008`, `VPROC-0009`               | `OWNER_WORKSPACE`     | Reconcilia vínculo, tiempo y novedades para pago laboral.                               |
| `VSCREEN-0154` | Facturas y documentos fiscales                        | `numera`   | `VPROC-0051`     | `VPROC-0043`, `VPROC-0052`, `VPROC-0060`               | `OWNER_WORKSPACE`     | Conserva documento fiscal y su hecho económico correlacionado.                          |
| `VSCREEN-0155` | Tesorería y programación de pagos                     | `numera`   | `VPROC-0052`     | `VPROC-0053`, `VPROC-0069`                             | `OWNER_WORKSPACE`     | Programa liquidez y pagos sin convertir presupuesto en hecho.                           |
| `VSCREEN-0156` | Presupuestos, escenarios y forecast                   | `numera`   | `VPROC-0069`     | `VPROC-0054`, `VPROC-0061`                             | `OWNER_WORKSPACE`     | Gobierna versión, supuestos, aprobación, consumo y desviación.                          |
| `VSCREEN-0157` | Impuestos y obligaciones de cumplimiento              | `numera`   | `VPROC-0052`     | `VPROC-0051`, `VPROC-0060`, `VPROC-0064`               | `OWNER_WORKSPACE`     | Gestiona obligación, soporte, vencimiento, pago y evidencia.                            |
| `VSCREEN-0158` | Distribución y asignación de costos                   | `numera`   | `VPROC-0054`     | `VPROC-0051`                                           | `OWNER_WORKSPACE`     | Aplica reglas versionadas y conserva explicación y reversión.                           |
| `VSCREEN-0159` | Indicadores, análisis y planes de mejora              | `numera`   | `VPROC-0061`     | `VPROC-0001`, `VPROC-0063`                             | `OWNER_WORKSPACE`     | Vincula medición, análisis, decisión, acción y verificación.                            |
| `VSCREEN-0160` | Inicio y selección del portal de compras              | `pass`     | `VPROC-0039`     | `VPROC-0017`, `VPROC-0045`, `VPROC-0050`               | `CUSTOMER_CHANNEL`    | Inicia intención de compra propia; PULSO conserva pedido y venta.                       |
| `VSCREEN-0161` | Menú y catálogo comercial del cliente                 | `pass`     | `VPROC-0017`     | `VPROC-0045`                                           | `CUSTOMER_CHANNEL`    | Proyecta oferta publicada sin mantener precio o disponibilidad paralelos.               |
| `VSCREEN-0162` | Carrito y configuración del pedido                    | `pass`     | `VPROC-0039`     | `VPROC-0017`, `VPROC-0042`                             | `CUSTOMER_CHANNEL`    | Conserva intención local y la entrega a PULSO para crear el pedido.                     |
| `VSCREEN-0163` | Dirección, modalidad y programación de entrega        | `pass`     | `VPROC-0050`     | `VPROC-0048`, `VPROC-0049`                             | `CUSTOMER_CHANNEL`    | Captura preferencia del cliente; propietarios logísticos validan capacidad y ejecución. |
| `VSCREEN-0164` | Revisión, checkout e inicio de pago                   | `pass`     | `VPROC-0043`     | `VPROC-0039`, `VPROC-0042`                             | `CUSTOMER_CHANNEL`    | Presenta total y comienza pago; PULSO confirma el resultado comercial.                  |
| `VSCREEN-0165` | Confirmación de pedido y retorno de pago              | `pass`     | `VPROC-0043`     | `VPROC-0039`, `VPROC-0051`                             | `CUSTOMER_CHANNEL`    | Presenta receipt correlacionado sin declarar éxito antes de confirmación.               |
| `VSCREEN-0166` | Mis pedidos y detalle                                 | `pass`     | `VPROC-0039`     | `VPROC-0038`, `VPROC-0040`, `VPROC-0041`, `VPROC-0050` | `CUSTOMER_CHANNEL`    | Proyecta pedidos propios de los canales comerciales aplicables.                         |
| `VSCREEN-0167` | Seguimiento de preparación y entrega del cliente      | `pass`     | `VPROC-0050`     | `VPROC-0039`, `VPROC-0049`                             | `CUSTOMER_CHANNEL`    | Presenta avance y prueba autorizada sin gobernar la ruta.                               |
| `VSCREEN-0168` | Chat y comunicación asociada al pedido                | `pass`     | `VPROC-0047`     | `VPROC-0039`, `VPROC-0046`, `VPROC-0050`               | `CUSTOMER_CHANNEL`    | Vincula comunicación al pedido y deriva reclamos o entrega cuando corresponda.          |
| `VSCREEN-0169` | Mis reclamos y casos de servicio                      | `pass`     | `VPROC-0046`     | `VPROC-0042`, `VPROC-0050`                             | `CUSTOMER_CHANNEL`    | Inicia y consulta el caso propio; PULSO gobierna resolución y compensación.             |
| `VSCREEN-0170` | Mis reservas y eventos                                | `pass`     | `VPROC-0047`     | `VPROC-0041`                                           | `CUSTOMER_CHANNEL`    | Presenta reservas propias y sus condiciones sin administrar capacidad global.           |
| `VSCREEN-0171` | Calificación y satisfacción                           | `pass`     | `VPROC-0068`     | `VPROC-0046`                                           | `CUSTOMER_CHANNEL`    | Captura respuesta personal separada de reclamo e incentivo.                             |
| `VSCREEN-0172` | Comunicaciones y notificaciones del cliente           | `pass`     | `VPROC-0047`     | `VPROC-0045`, `VPROC-0060`                             | `CUSTOMER_CHANNEL`    | Presenta comunicaciones consentidas y receipts personales.                              |
| `VSCREEN-0173` | Trazabilidad e investigación de lote                  | `fogo`     | `VPROC-0035`     | `VPROC-0034`, `VPROC-0036`, `VPROC-0037`, `VPROC-0060` | `OWNER_WORKSPACE`     | Reconstruye materiales, ejecución, calidad, empaque y disposición.                      |
| `VSCREEN-0174` | Controles operativos de inocuidad                     | `fogo`     | `VPROC-0014`     | `VPROC-0012`, `VPROC-0035`                             | `SUPERVISION_SURFACE` | Ejecuta controles operativos y entrega hallazgos al gobierno de cumplimiento.           |
| `VSCREEN-0175` | Seguridad de cuenta y sesiones                        | `shell`    | `VPROC-0059`     | `VPROC-0058`, `VPROC-0060`                             | `TRANSVERSAL_ENTRY`   | Presenta sesiones y recuperación personal sin gobernar autoridad laboral.               |
| `VSCREEN-0176` | Definición de kits y conjuntos | `nexo` | `VPROC-0067` | `VPROC-0015`, `VPROC-0029` | `OWNER_WORKSPACE` | Mantiene la definición reutilizable consumida por armado, inventario y custodia de kits. |
| `VSCREEN-0177` | Configuración de impresoras logísticas | `nexo` | `VPROC-0024` | `VPROC-0023`, `VPROC-0058` | `OWNER_WORKSPACE` | Mantiene el recurso técnico y sus políticas; la ejecución de trabajos permanece separada. |

---

#### 10. Cobertura de procesos

| Disposición                        | Procesos                                                  | Resultado            |
| ---------------------------------- | --------------------------------------------------------- | -------------------- |
| vinculados con una o más pantallas | `VPROC-0001` a `VPROC-0055` y `VPROC-0058` a `VPROC-0069` | `COVERED`            |
| aplicación canónica diferida       | `VPROC-0056`, `VPROC-0057`                                | `DEFERRED_APP_SCOPE` |

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

1. falte una de las 177 pantallas;
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

| Pendiente                           | Tarea propietaria                                         |
| ----------------------------------- | --------------------------------------------------------- |
| vincular pasos exactos              | `PROC-SCREEN-004`                                         |
| clasificar carriles UX              | `PROC-SCREEN-005` a `PROC-SCREEN-011`                     |
| definir actores                     | `PROC-SCREEN-012`                                         |
| definir dispositivos                | `PROC-SCREEN-013`                                         |
| definir acciones                    | `PROC-SCREEN-014` y `PROC-SCREEN-015`                     |
| definir entradas, salidas y estados | `PROC-SCREEN-016` a `PROC-SCREEN-021`                     |
| sensibilidad y permisos             | `PROC-SCREEN-022` a `PROC-SCREEN-024`                     |
| operaciones técnicas                | `PROC-SCREEN-025`                                         |
| rutas y legado                      | `PROC-SCREEN-026`                                         |
| métricas y aceptación operativa     | `PROC-SCREEN-027` y `PROC-SCREEN-028`                     |
| admisión funcional de AURA          | tareas canónicas de AURA y nueva admisión `PROC-SCREEN-*` |

---

#### 16. Requisitos de prueba derivados

**Resultado:** GENERA 24 REQUISITOS DE PRUEBA.

Se incorporan `TREQ-UX-553` a `TREQ-UX-576`. Permanecerán `IDENTIFICADO`; la implementación y evidencia corresponden a CI, paquetes E5, BLOQUE U, staging y pilotos.

---

#### 17. Criterios de aceptación

- [x] Se consumen 177 identidades de pantalla sin renumerarlas.
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

**Estado:** APROBADA

```text
PROC-SCREEN-002 APROBADA
PROC-SCREEN-003 APROBADA
PROC-SCREEN-004 NO INICIADA
```

### ✅ PROC-SCREEN-004 — Vincular cada pantalla con un paso del proceso

**Estado:** APROBADA

**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal

**Marcador exacto que reemplaza:** `### [ ] PROC-SCREEN-004 — Vincular cada pantalla con un paso del proceso`

**Tarea anterior:** `PROC-SCREEN-003 — Vincular cada pantalla con un proceso` — APROBADA

**Siguiente tarea reservada:** `PROC-SCREEN-005 — Clasificar pantalla operativa` — NO INICIADA

**Artefactos lógicos contenidos en esta tarea:**

- `SCREEN-PROCESS-STEP-BINDING-CONTRACT-001`;
- `PROCESS-STEP-ANCHOR-VOCABULARY-001`;
- `SCREEN-PROCESS-STEP-BINDING-REGISTER-001`;
- `SCREEN-PROCESS-STEP-COVERAGE-MATRIX-001`;
- `SCREEN-PROCESS-STEP-CHANGE-POLICY-001`;
- `SCREEN-PROCESS-STEP-VALIDATION-GATE-001`;
- `SCREEN-PROCESS-STEP-CARRYOVER-REGISTER-001`;

**Resultado cuantitativo:** **177 pantallas**, **177 vínculos primarios de paso**, **177 anclas de paso**, **67 procesos activos cubiertos**, **23 roles de paso**, **6 posiciones de ciclo de vida** y **2 procesos AURA diferidos sin pantalla ni paso inventado**.

**Naturaleza:** contrato documental entre pantalla, proceso y paso de interacción empresarial. No define todavía carril UX, actores, dispositivos, acciones, estados de interfaz, permisos, rutas ni operaciones técnicas.

**Cambios en código de producto, componentes, rutas, repositorios consumidores, Supabase, tablas, migraciones, RLS, RPC, eventos, analítica o producción:** no autorizados por esta tarea.

---

#### 1. Propósito

Vincular cada identidad `VSCREEN-*` con el paso dominante del proceso primario `VPROC-*` que la pantalla presenta, inicia, ejecuta, revisa, decide, monitorea o cierra, de forma estable y auditable.

```text
PANTALLA CANONICA
        +
PROCESO PRIMARIO APROBADO
        +
ANCLA SEMANTICA DE PASO
        =
UBICACION FUNCIONAL EXACTA SIN CONFUNDIR UI, PROCESO Y AUTORIZACION
```

La tarea responde **en qué paso dominante del proceso existe la pantalla**. No afirma que toda la actividad del paso ocurra dentro de ella y no transforma el paso en ruta, componente, acción técnica o permiso.

---

#### 2. Dependencias consumidas

- `PROC-SCREEN-001` y la identidad estable `VSCREEN-*`;
- `PROC-SCREEN-002` y `SCREEN-CANONICAL-CATALOG-001`;
- `PROC-SCREEN-003` y `SCREEN-PROCESS-BINDING-REGISTER-001`;
- `PROC-CAT-001` a `PROC-CAT-020`, especialmente estados, transiciones, excepciones, cancelación, entradas, salidas, eventos y auditoría;
- los procesos `VPROC-0001` a `VPROC-0069` y sus fronteras propietarias;
- `PROC-ACTOR-001` a `PROC-ACTOR-010`;
- `UX-BASE-001` a `UX-BASE-015`;
- `UX-STATION-001` a `UX-STATION-012`;
- `UX-ADMIN-001` a `UX-ADMIN-005`;
- los contratos de handoff, proyección, canal personal y canal de cliente aprobados.

La tarea no reabre los procesos ni convierte los nombres de pantalla en pasos. Cada ancla se deriva de la intención empresarial ya aprobada y queda subordinada al proceso primario.

---

#### 3. Alcance

1. incorporar `primary_process_step_ref` a cada pantalla;
2. definir un formato estable y namespaced por proceso;
3. definir un vocabulario controlado de roles de paso;
4. definir la posición del paso dentro del ciclo de vida;
5. materializar 177 vínculos sin omisiones ni duplicados;
6. cubrir los 67 procesos activos;
7. conservar `VPROC-0056` y `VPROC-0057` sin pantalla ni paso mientras AURA permanezca diferida;
8. distinguir paso dominante, pasos vecinos, estado, transición, acción y operación técnica;
9. definir versionado y cambio de vínculo;
10. establecer validaciones automáticas y carryovers exactos.

---

#### 4. Exclusiones

- no clasificar pantallas como operativas, administrativas, de supervisión, configuración, auditoría, personales o de cliente;
- no definir actores objetivo;
- no definir dispositivos o estaciones;
- no definir la acción principal o acciones secundarias;
- no definir condiciones de entrada o salida;
- no diseñar estados vacíos, carga, bloqueo o recuperación de interfaz;
- no decidir información sensible visible;
- no asignar permisos de lectura o acción;
- no vincular Server Actions, APIs, RPC, eventos o tablas;
- no mapear rutas o componentes legacy;
- no rediseñar la secuencia de estados de `PROC-CAT-*`;
- no activar AURA o crear `talento` como aplicación.

---

#### 5. Distinciones canónicas

| Concepto           | Definición                                                               | Regla                                              |
| ------------------ | ------------------------------------------------------------------------ | -------------------------------------------------- |
| proceso            | ciclo empresarial completo con inicio, estados, transiciones y resultado | conserva `VPROC-*`                                 |
| paso del proceso   | tramo semántico dominante de trabajo dentro del proceso                  | recibe una referencia namespaced por `VPROC-*`     |
| estado del proceso | condición persistida del caso                                            | no se sustituye por el paso                        |
| transición         | cambio permitido entre estados                                           | puede ser producida por una acción dentro del paso |
| pantalla           | superficie lógica de interacción                                         | se vincula con un paso dominante                   |
| acción             | intención ejecutable del usuario o sistema                               | se define en `PROC-SCREEN-014` y `015`             |
| operación técnica  | Server Action, API o RPC                                                 | se vincula en `PROC-SCREEN-025`                    |
| ruta o componente  | implementación mutable                                                   | no determina el paso                               |

```text
PASO ≠ ESTADO ≠ TRANSICION ≠ ACCION ≠ API ≠ PANTALLA
```

---

#### 6. Contrato canónico de vínculo

| Campo                      | Obligación                                                           |
| -------------------------- | -------------------------------------------------------------------- |
| `screen_id`                | `VSCREEN-*` existente y único                                        |
| `primary_process_id`       | proceso primario aprobado en `PROC-SCREEN-003`                       |
| `primary_process_step_ref` | referencia exacta del paso dominante                                 |
| `process_step_role`        | valor del vocabulario aprobado                                       |
| `lifecycle_position`       | posición dentro del ciclo del proceso                                |
| `process_step_label`       | etiqueta humana mutable                                              |
| `step_binding_version`     | versión semántica del vínculo                                        |
| `step_binding_reason`      | explicación funcional verificable                                    |
| `step_binding_status`      | `CANONICAL`, `CHANGE_PROPOSED`, `SUPERSEDED` o `RETIRED_WITH_SCREEN` |
| `step_binding_task`        | tarea que aprobó o modificó el vínculo                               |

Valores iniciales:

```text
step_binding_version: 1.0.0
step_binding_status: CANONICAL
step_binding_task: PROC-SCREEN-004
decision_record: INITIAL_SCREEN_PROCESS_STEP_BINDING
```

---

#### 7. Formato de la referencia de paso

Formato:

```text
VPROC-0001::STEP-RECORD_AND_TRACK_DECISION
VPROC-0028::STEP-PREPARE_REPLENISHMENT
VPROC-0059::STEP-AUTHENTICATE_OR_RECOVER
```

Expresión contractual:

```text
^VPROC-[0-9]{4}::STEP-[A-Z0-9_]+$
```

- el prefijo `VPROC-*` debe coincidir con `primary_process_id`;
- la clave es ASCII, mayúscula y estable;
- no incluye aplicación, rol, sede, ruta, componente, permiso ni ambiente;
- el nombre humano puede cambiar sin cambiar la clave cuando la semántica permanece;
- una clave retirada no se reutiliza para otro paso;
- la referencia no concede autorización ni sirve para construir una URL.

---

#### 8. PROCESS-STEP-ANCHOR-VOCABULARY-001

| Rol            | Definición                                                                                                  |
| -------------- | ----------------------------------------------------------------------------------------------------------- |
| `ENTRY`        | Entrada o selección de contexto antes de iniciar trabajo material.                                          |
| `IDENTIFY`     | Reconocimiento de persona, objeto, ubicación o credencial sin ejecutar por sí solo la mutación empresarial. |
| `INITIATE`     | Creación formal de una intención, solicitud, caso, pedido, orden o sesión.                                  |
| `TRIAGE`       | Clasificación, priorización y enrutamiento de trabajo pendiente.                                            |
| `CAPTURE`      | Registro de hechos, cantidades, evidencia o preferencias.                                                   |
| `CONFIGURE`    | Definición o mantenimiento de maestros, reglas, políticas o parámetros.                                     |
| `PLAN`         | Preparación de capacidad, programación, presupuesto, ruta o secuencia antes de ejecutar.                    |
| `VALIDATE`     | Comprobación de prerrequisitos, consistencia, identidad, capacidad o resultado.                             |
| `REVIEW`       | Análisis humano o sistémico de información antes de una decisión.                                           |
| `SIMULATE`     | Evaluación hipotética sin modificar la realidad empresarial.                                                |
| `APPROVE`      | Decisión formal de autorización, publicación o aceptación.                                                  |
| `DECIDE`       | Resolución empresarial entre alternativas materialmente distintas.                                          |
| `EXECUTE`      | Realización del trabajo material del proceso.                                                               |
| `MONITOR`      | Seguimiento del avance o estado sin apropiarse de otra fuente de verdad.                                    |
| `RECONCILE`    | Comparación de fuentes y resolución controlada de diferencias.                                              |
| `CORRECT`      | Corrección, reversión, devolución o tratamiento de una excepción conservando historia.                      |
| `CLOSE`        | Finalización contractual de sesión, lote, periodo, vínculo o caso.                                          |
| `AUDIT`        | Reconstrucción histórica e investigación sin alterar los hechos originales.                                 |
| `ANALYZE`      | Interpretación de métricas, tendencias, causas o escenarios.                                                |
| `PUBLISH`      | Emisión o puesta en vigencia de información aprobada.                                                       |
| `RECEIPT`      | Presentación del resultado confirmado y de su comprobante correlacionable.                                  |
| `RECOVER`      | Restablecimiento controlado tras fallo, incidente, pérdida de acceso o contingencia.                        |
| `SELF_SERVICE` | Interacción personal limitada al propio caso, perfil, solicitud o evidencia.                                |

Los roles describen la relación dominante de la pantalla con el proceso. No sustituyen las clasificaciones UX de `PROC-SCREEN-005` a `011`.

---

#### 9. Posiciones del ciclo de vida

| Posición        | Significado                                                                 |
| --------------- | --------------------------------------------------------------------------- |
| `PRECONDITION`  | Antes del estado inicial material; selecciona contexto o habilita entrada.  |
| `INITIAL`       | Crea, admite o valida el caso al comienzo del proceso.                      |
| `IN_PROGRESS`   | Opera mientras el caso está activo.                                         |
| `DECISION`      | Revisa, aprueba, corrige o resuelve una bifurcación material.               |
| `TERMINAL`      | Produce cierre, recibo o resultado final.                                   |
| `CROSS_CUTTING` | Consulta, auditoría, configuración o análisis transversal a varios estados. |

Una posición no es un estado persistido. Sirve para comprobar que la pantalla está ubicada en un tramo coherente con los estados y transiciones aprobados del proceso.

---

#### 10. Regla para seleccionar el paso dominante

Se selecciona, en orden:

1. el trabajo que la persona reconoce como propósito principal de la pantalla;
2. el resultado o decisión material que la pantalla prepara o presenta;
3. el tramo que explica la mayoría de sus datos y controles;
4. el punto del proceso que permanecería aunque cambie la ruta o componente;
5. el paso que no invade la propiedad de otra aplicación o proceso.

No se selecciona por el primer botón, la primera tabla, el servicio consultado, la ubicación del código ni el estado visual mostrado.

---

#### 11. Pantallas que abarcan varios momentos

Una pantalla puede mostrar información de pasos vecinos, pero mantiene un único `primary_process_step_ref`. Los pasos vecinos se consideran contexto hasta que `PROC-SCREEN-014` y `015` definan acciones explícitas que justifiquen una relación adicional.

Se deberá dividir la pantalla o crear otra identidad cuando:

- existan dos intenciones materiales competidoras;
- cada tramo tenga entrada, salida y ciclo propios;
- la persona deba cambiar de contexto o autorización;
- la combinación impida explicar qué resultado produce la pantalla;
- la auditoría o métrica necesite separar trabajos materialmente distintos.

---

#### 12. Relación con estados y transiciones

- `PRECONDITION` e `INITIAL` deberán corresponder al estado inicial o a la transición de admisión;
- `IN_PROGRESS` deberá corresponder a uno o más estados intermedios;
- `DECISION` deberá corresponder a una bifurcación, aprobación, corrección o reconciliación permitida;
- `TERMINAL` deberá conducir a un estado final o receipt confirmado;
- `CROSS_CUTTING` podrá observar varios estados, pero no inventará una transición;
- una pantalla de auditoría no podrá reescribir el hecho auditado;
- una pantalla de monitoreo no podrá presentarse como ejecutora por el solo hecho de mostrar controles secundarios.

---

#### 13. SCREEN-PROCESS-STEP-BINDING-REGISTER-001

| Screen ID      | Pantalla                                              | Aplicación | Proceso      | Referencia de paso                                                                                        | Rol            | Posición        |
| -------------- | ----------------------------------------------------- | ---------- | ------------ | --------------------------------------------------------------------------------------------------------- | -------------- | --------------- |
| `VSCREEN-0001` | Hub Vento OS                                          | `shell`    | `VPROC-0059` | `VPROC-0059::STEP-ENTER_ECOSYSTEM` — Entrar al ecosistema y seleccionar trabajo disponible                | `ENTRY`        | `PRECONDITION`  |
| `VSCREEN-0002` | Inicio de sesión y recuperación                       | `shell`    | `VPROC-0059` | `VPROC-0059::STEP-AUTHENTICATE_OR_RECOVER` — Autenticar o recuperar la sesión                             | `VALIDATE`     | `INITIAL`       |
| `VSCREEN-0003` | Resolución de contexto y acceso                       | `shell`    | `VPROC-0059` | `VPROC-0059::STEP-RESOLVE_EFFECTIVE_CONTEXT` — Resolver contexto y capacidad efectiva                     | `VALIDATE`     | `INITIAL`       |
| `VSCREEN-0004` | Activación de dispositivo compartido                  | `shell`    | `VPROC-0059` | `VPROC-0059::STEP-ACTIVATE_SHARED_DEVICE` — Activar el dispositivo compartido                             | `EXECUTE`      | `INITIAL`       |
| `VSCREEN-0005` | Bandeja transversal de tareas y notificaciones        | `shell`    | `VPROC-0004` | `VPROC-0004::STEP-TRIAGE_TRANSVERSAL_WORK` — Clasificar avisos y derivar trabajo                          | `TRIAGE`       | `IN_PROGRESS`   |
| `VSCREEN-0006` | Centro de soporte y diagnóstico                       | `shell`    | `VPROC-0058` | `VPROC-0058::STEP-DIAGNOSE_AND_ROUTE_SUPPORT` — Diagnosticar y derivar soporte                            | `RECOVER`      | `IN_PROGRESS`   |
| `VSCREEN-0007` | Inicio ejecutivo y gerencial                          | `viso`     | `VPROC-0001` | `VPROC-0001::STEP-REVIEW_EXECUTIVE_WORK` — Revisar prioridades y decisiones ejecutivas                    | `MONITOR`      | `CROSS_CUTTING` |
| `VSCREEN-0008` | Estructura organizativa                               | `viso`     | `VPROC-0002` | `VPROC-0002::STEP-MAINTAIN_ORGANIZATIONAL_STRUCTURE` — Mantener estructura organizativa                   | `CONFIGURE`    | `IN_PROGRESS`   |
| `VSCREEN-0009` | Políticas, delegaciones y límites                     | `viso`     | `VPROC-0003` | `VPROC-0003::STEP-AUTHOR_POLICIES_AND_LIMITS` — Definir políticas, delegaciones y límites                 | `CONFIGURE`    | `IN_PROGRESS`   |
| `VSCREEN-0010` | Compromisos y transferencias internas                 | `viso`     | `VPROC-0004` | `VPROC-0004::STEP-TRACK_INTERNAL_COMMITMENTS` — Gestionar compromisos y transferencias                    | `MONITOR`      | `IN_PROGRESS`   |
| `VSCREEN-0011` | Embudo de candidatos                                  | `viso`     | `VPROC-0005` | `VPROC-0005::STEP-TRIAGE_CANDIDATES` — Clasificar candidaturas y etapas                                   | `TRIAGE`       | `IN_PROGRESS`   |
| `VSCREEN-0012` | Caso de selección                                     | `viso`     | `VPROC-0005` | `VPROC-0005::STEP-EVALUATE_AND_DECIDE_CANDIDATE` — Evaluar y decidir selección                            | `DECIDE`       | `DECISION`      |
| `VSCREEN-0013` | Vinculación e incorporación                           | `viso`     | `VPROC-0006` | `VPROC-0006::STEP-ORCHESTRATE_ONBOARDING` — Orquestar vinculación e incorporación                         | `EXECUTE`      | `IN_PROGRESS`   |
| `VSCREEN-0014` | Directorio y expediente laboral                       | `viso`     | `VPROC-0006` | `VPROC-0006::STEP-MAINTAIN_EMPLOYMENT_RECORD` — Mantener expediente laboral                               | `CONFIGURE`    | `IN_PROGRESS`   |
| `VSCREEN-0015` | Programación laboral                                  | `viso`     | `VPROC-0007` | `VPROC-0007::STEP-PLAN_AND_PUBLISH_SCHEDULE` — Planear y publicar programación laboral                    | `PLAN`         | `IN_PROGRESS`   |
| `VSCREEN-0016` | Revisión de asistencia                                | `viso`     | `VPROC-0008` | `VPROC-0008::STEP-REVIEW_ATTENDANCE_EXCEPTION` — Revisar asistencia y excepciones                         | `REVIEW`       | `DECISION`      |
| `VSCREEN-0017` | Novedades, ausencias y reemplazos                     | `viso`     | `VPROC-0009` | `VPROC-0009::STEP-RESOLVE_WORKFORCE_CASE` — Resolver novedades, ausencias y reemplazos                    | `DECIDE`       | `DECISION`      |
| `VSCREEN-0018` | Retiro y revocación coordinada                        | `viso`     | `VPROC-0011` | `VPROC-0011::STEP-CLOSE_EMPLOYMENT_AND_REVOKE` — Cerrar vínculo y coordinar revocaciones                  | `CLOSE`        | `TERMINAL`      |
| `VSCREEN-0019` | Catálogo de roles y permisos                          | `viso`     | `VPROC-0059` | `VPROC-0059::STEP-MAINTAIN_ACCESS_CATALOG` — Mantener catálogo de roles y permisos                        | `CONFIGURE`    | `IN_PROGRESS`   |
| `VSCREEN-0020` | Perfil de acceso del trabajador                       | `viso`     | `VPROC-0059` | `VPROC-0059::STEP-ASSIGN_EFFECTIVE_ACCESS` — Asignar acceso efectivo al trabajador                        | `CONFIGURE`    | `IN_PROGRESS`   |
| `VSCREEN-0021` | Simulación de permisos y conflictos                   | `viso`     | `VPROC-0059` | `VPROC-0059::STEP-SIMULATE_ACCESS_DECISION` — Simular permisos y conflictos                               | `SIMULATE`     | `DECISION`      |
| `VSCREEN-0022` | Gobierno de dispositivos compartidos                  | `viso`     | `VPROC-0059` | `VPROC-0059::STEP-GOVERN_SHARED_DEVICES` — Gobernar dispositivos compartidos                              | `CONFIGURE`    | `IN_PROGRESS`   |
| `VSCREEN-0023` | Riesgos de seguridad y salud                          | `viso`     | `VPROC-0012` | `VPROC-0012::STEP-ASSESS_SST_RISK` — Evaluar y tratar riesgo SST                                          | `REVIEW`       | `IN_PROGRESS`   |
| `VSCREEN-0024` | Incidentes y emergencias                              | `viso`     | `VPROC-0013` | `VPROC-0013::STEP-MANAGE_INCIDENT_RESPONSE` — Gestionar incidente o emergencia                            | `EXECUTE`      | `IN_PROGRESS`   |
| `VSCREEN-0025` | Controles de higiene y cumplimiento                   | `viso`     | `VPROC-0014` | `VPROC-0014::STEP-REVIEW_HYGIENE_COMPLIANCE` — Revisar controles de higiene y cumplimiento                | `REVIEW`       | `IN_PROGRESS`   |
| `VSCREEN-0026` | Bandeja de casos administrativos transversales        | `viso`     | `VPROC-0004` | `VPROC-0004::STEP-TRIAGE_ADMIN_CASES` — Clasificar casos administrativos                                  | `TRIAGE`       | `IN_PROGRESS`   |
| `VSCREEN-0027` | Inicio personal del trabajador                        | `anima`    | `VPROC-0007` | `VPROC-0007::STEP-ENTER_PERSONAL_WORKSPACE` — Entrar al espacio personal de trabajo                       | `ENTRY`        | `PRECONDITION`  |
| `VSCREEN-0028` | Registro de entrada, pausa y salida                   | `anima`    | `VPROC-0008` | `VPROC-0008::STEP-CAPTURE_ATTENDANCE_EVENT` — Registrar evento de asistencia                              | `CAPTURE`      | `IN_PROGRESS`   |
| `VSCREEN-0029` | Mi programación                                       | `anima`    | `VPROC-0007` | `VPROC-0007::STEP-CONSULT_PUBLISHED_SCHEDULE` — Consultar programación publicada                          | `MONITOR`      | `IN_PROGRESS`   |
| `VSCREEN-0030` | Mi asistencia y solicitud de corrección               | `anima`    | `VPROC-0008` | `VPROC-0008::STEP-CONSULT_OR_REQUEST_ATTENDANCE_CORRECTION` — Consultar asistencia o solicitar corrección | `SELF_SERVICE` | `IN_PROGRESS`   |
| `VSCREEN-0031` | Mis novedades, permisos y ausencias                   | `anima`    | `VPROC-0009` | `VPROC-0009::STEP-SUBMIT_PERSONAL_WORKFORCE_CASE` — Registrar y seguir una novedad personal               | `SELF_SERVICE` | `INITIAL`       |
| `VSCREEN-0032` | Mi perfil laboral                                     | `anima`    | `VPROC-0006` | `VPROC-0006::STEP-MAINTAIN_SELF_SERVICE_PROFILE` — Consultar o actualizar perfil laboral permitido        | `SELF_SERVICE` | `IN_PROGRESS`   |
| `VSCREEN-0033` | Resumen de inventario y abastecimiento interno        | `nexo`     | `VPROC-0028` | `VPROC-0028::STEP-MONITOR_INTERNAL_SUPPLY` — Monitorear inventario y abastecimiento interno               | `MONITOR`      | `CROSS_CUTTING` |
| `VSCREEN-0034` | Catálogo de productos físicos                         | `nexo`     | `VPROC-0015` | `VPROC-0015::STEP-CONSULT_PHYSICAL_PRODUCT_CATALOG` — Consultar catálogo físico                           | `MONITOR`      | `IN_PROGRESS`   |
| `VSCREEN-0035` | Editor de producto, unidad y presentación             | `nexo`     | `VPROC-0015` | `VPROC-0015::STEP-MAINTAIN_PRODUCT_PRESENTATION` — Mantener producto, unidad y presentación               | `CONFIGURE`    | `IN_PROGRESS`   |
| `VSCREEN-0036` | Especificaciones y criterios de calidad               | `nexo`     | `VPROC-0018` | `VPROC-0018::STEP-MAINTAIN_QUALITY_SPECIFICATION` — Mantener especificaciones y criterios de calidad      | `CONFIGURE`    | `IN_PROGRESS`   |
| `VSCREEN-0037` | Catálogo de ubicaciones                               | `nexo`     | `VPROC-0023` | `VPROC-0023::STEP-MAINTAIN_LOCATION_CATALOG` — Mantener catálogo de ubicaciones                           | `CONFIGURE`    | `IN_PROGRESS`   |
| `VSCREEN-0038` | Identificación y detalle de ubicación                 | `nexo`     | `VPROC-0023` | `VPROC-0023::STEP-IDENTIFY_LOCATION_AND_CONTENT` — Identificar ubicación y contenido                      | `IDENTIFY`     | `IN_PROGRESS`   |
| `VSCREEN-0039` | Consulta de existencias                               | `nexo`     | `VPROC-0024` | `VPROC-0024::STEP-CONSULT_STOCK_POSITION` — Consultar posición de existencias                             | `MONITOR`      | `CROSS_CUTTING` |
| `VSCREEN-0040` | Conteo de inventario                                  | `nexo`     | `VPROC-0026` | `VPROC-0026::STEP-CAPTURE_PHYSICAL_COUNT` — Capturar conteo físico                                        | `CAPTURE`      | `IN_PROGRESS`   |
| `VSCREEN-0041` | Revisión de conteo y diferencias                      | `nexo`     | `VPROC-0026` | `VPROC-0026::STEP-REVIEW_COUNT_VARIANCE` — Revisar diferencias de conteo                                  | `REVIEW`       | `DECISION`      |
| `VSCREEN-0042` | Caso de ajuste de inventario                          | `nexo`     | `VPROC-0026` | `VPROC-0026::STEP-DECIDE_INVENTORY_ADJUSTMENT` — Decidir ajuste de inventario                             | `DECIDE`       | `DECISION`      |
| `VSCREEN-0043` | Confirmación de entrada a inventario                  | `nexo`     | `VPROC-0024` | `VPROC-0024::STEP-CONFIRM_STOCK_ENTRY` — Confirmar entrada física                                         | `EXECUTE`      | `IN_PROGRESS`   |
| `VSCREEN-0044` | Retiro y consumo de existencias                       | `nexo`     | `VPROC-0025` | `VPROC-0025::STEP-EXECUTE_STOCK_WITHDRAWAL` — Ejecutar retiro o consumo                                   | `EXECUTE`      | `IN_PROGRESS`   |
| `VSCREEN-0045` | Traslado interno de existencias                       | `nexo`     | `VPROC-0025` | `VPROC-0025::STEP-EXECUTE_INTERNAL_TRANSFER` — Ejecutar traslado interno                                  | `EXECUTE`      | `IN_PROGRESS`   |
| `VSCREEN-0046` | Solicitud de remisión                                 | `nexo`     | `VPROC-0028` | `VPROC-0028::STEP-SUBMIT_REPLENISHMENT_REQUEST` — Solicitar remisión                                      | `INITIATE`     | `INITIAL`       |
| `VSCREEN-0047` | Preparación de remisión                               | `nexo`     | `VPROC-0028` | `VPROC-0028::STEP-PREPARE_REPLENISHMENT` — Preparar remisión                                              | `EXECUTE`      | `IN_PROGRESS`   |
| `VSCREEN-0048` | Carga y despacho de remisión                          | `nexo`     | `VPROC-0028` | `VPROC-0028::STEP-LOAD_AND_DISPATCH_REPLENISHMENT` — Cargar y despachar remisión                          | `EXECUTE`      | `IN_PROGRESS`   |
| `VSCREEN-0049` | Seguimiento de remisión en tránsito                   | `nexo`     | `VPROC-0028` | `VPROC-0028::STEP-MONITOR_REPLENISHMENT_TRANSIT` — Monitorear remisión en tránsito                        | `MONITOR`      | `IN_PROGRESS`   |
| `VSCREEN-0050` | Recepción de remisión                                 | `nexo`     | `VPROC-0028` | `VPROC-0028::STEP-RECEIVE_REPLENISHMENT` — Recibir y conciliar remisión                                   | `RECONCILE`    | `DECISION`      |
| `VSCREEN-0051` | Vencimiento, cuarentena, daño y merma                 | `nexo`     | `VPROC-0027` | `VPROC-0027::STEP-RESOLVE_STOCK_CONDITION` — Resolver vencimiento, cuarentena, daño o merma               | `DECIDE`       | `DECISION`      |
| `VSCREEN-0052` | LPN, contenedores y reutilizables                     | `nexo`     | `VPROC-0032` | `VPROC-0032::STEP-MANAGE_LPN_AND_REUSABLES` — Gestionar LPN, contenedores y reutilizables                 | `EXECUTE`      | `IN_PROGRESS`   |
| `VSCREEN-0053` | Activos y custodia                                    | `nexo`     | `VPROC-0029` | `VPROC-0029::STEP-MANAGE_ASSET_CUSTODY` — Gestionar activo y custodia                                     | `EXECUTE`      | `IN_PROGRESS`   |
| `VSCREEN-0054` | Etiquetas e impresión logística                       | `nexo`     | `VPROC-0024` | `VPROC-0024::STEP-ISSUE_LOGISTICS_LABEL` — Emitir etiqueta logística                                      | `EXECUTE`      | `IN_PROGRESS`   |
| `VSCREEN-0055` | Inicio y cola de producción                           | `fogo`     | `VPROC-0033` | `VPROC-0033::STEP-TRIAGE_PRODUCTION_QUEUE` — Priorizar cola de producción                                 | `TRIAGE`       | `INITIAL`       |
| `VSCREEN-0056` | Planeación de producción                              | `fogo`     | `VPROC-0033` | `VPROC-0033::STEP-PLAN_PRODUCTION` — Planear producción                                                   | `PLAN`         | `IN_PROGRESS`   |
| `VSCREEN-0057` | Preparación e inicio de lote                          | `fogo`     | `VPROC-0034` | `VPROC-0034::STEP-PREPARE_AND_START_BATCH` — Preparar e iniciar lote                                      | `EXECUTE`      | `INITIAL`       |
| `VSCREEN-0058` | Ejecución de lote                                     | `fogo`     | `VPROC-0034` | `VPROC-0034::STEP-EXECUTE_BATCH` — Ejecutar lote                                                          | `EXECUTE`      | `IN_PROGRESS`   |
| `VSCREEN-0059` | Registro parcial de producción                        | `fogo`     | `VPROC-0034` | `VPROC-0034::STEP-CAPTURE_BATCH_PROGRESS` — Registrar avance parcial                                      | `CAPTURE`      | `IN_PROGRESS`   |
| `VSCREEN-0060` | Finalización y cierre de lote                         | `fogo`     | `VPROC-0037` | `VPROC-0037::STEP-CLOSE_BATCH` — Finalizar y cerrar lote                                                  | `CLOSE`        | `TERMINAL`      |
| `VSCREEN-0061` | Receta operativa                                      | `fogo`     | `VPROC-0016` | `VPROC-0016::STEP-CONSULT_APPLICABLE_RECIPE` — Consultar receta aplicable                                 | `MONITOR`      | `IN_PROGRESS`   |
| `VSCREEN-0062` | Catálogo y editor de recetas                          | `fogo`     | `VPROC-0016` | `VPROC-0016::STEP-AUTHOR_RECIPE` — Crear o editar receta                                                  | `CONFIGURE`    | `IN_PROGRESS`   |
| `VSCREEN-0063` | Revisión, aprobación y publicación de receta          | `fogo`     | `VPROC-0016` | `VPROC-0016::STEP-APPROVE_AND_PUBLISH_RECIPE` — Aprobar y publicar receta                                 | `APPROVE`      | `DECISION`      |
| `VSCREEN-0064` | Prueba de receta y rendimiento                        | `fogo`     | `VPROC-0016` | `VPROC-0016::STEP-TEST_RECIPE_AND_YIELD` — Probar receta y rendimiento                                    | `VALIDATE`     | `IN_PROGRESS`   |
| `VSCREEN-0065` | Control de calidad y liberación                       | `fogo`     | `VPROC-0035` | `VPROC-0035::STEP-DECIDE_QUALITY_RELEASE` — Decidir liberación de calidad                                 | `DECIDE`       | `DECISION`      |
| `VSCREEN-0066` | Empaque, etiquetado y almacenamiento de terminado     | `fogo`     | `VPROC-0036` | `VPROC-0036::STEP-PACK_AND_TRANSFER_FINISHED_GOOD` — Empacar y transferir producto terminado              | `EXECUTE`      | `IN_PROGRESS`   |
| `VSCREEN-0067` | Reproceso, aprovechamiento, merma y cierre productivo | `fogo`     | `VPROC-0037` | `VPROC-0037::STEP-RESOLVE_PRODUCTION_DISPOSITION` — Resolver reproceso, aprovechamiento o merma           | `DECIDE`       | `DECISION`      |
| `VSCREEN-0068` | Bandeja de necesidades de compra                      | `origo`    | `VPROC-0019` | `VPROC-0019::STEP-TRIAGE_PURCHASE_NEEDS` — Priorizar necesidades de compra                                | `TRIAGE`       | `INITIAL`       |
| `VSCREEN-0069` | Solicitud de compra                                   | `origo`    | `VPROC-0019` | `VPROC-0019::STEP-SUBMIT_PURCHASE_REQUEST` — Crear solicitud de compra                                    | `INITIATE`     | `INITIAL`       |
| `VSCREEN-0070` | Catálogo de proveedores                               | `origo`    | `VPROC-0020` | `VPROC-0020::STEP-CONSULT_SUPPLIER_CATALOG` — Consultar proveedores                                       | `MONITOR`      | `IN_PROGRESS`   |
| `VSCREEN-0071` | Alta y expediente de proveedor                        | `origo`    | `VPROC-0020` | `VPROC-0020::STEP-ONBOARD_SUPPLIER` — Dar de alta y mantener proveedor                                    | `CONFIGURE`    | `IN_PROGRESS`   |
| `VSCREEN-0072` | Comparación de cotizaciones                           | `origo`    | `VPROC-0020` | `VPROC-0020::STEP-COMPARE_QUOTES` — Comparar cotizaciones                                                 | `REVIEW`       | `DECISION`      |
| `VSCREEN-0073` | Editor de orden de compra                             | `origo`    | `VPROC-0021` | `VPROC-0021::STEP-PREPARE_PURCHASE_ORDER` — Preparar orden de compra                                      | `CONFIGURE`    | `IN_PROGRESS`   |
| `VSCREEN-0074` | Bandeja de aprobaciones de compra                     | `origo`    | `VPROC-0021` | `VPROC-0021::STEP-APPROVE_PURCHASE` — Aprobar o rechazar compra                                           | `APPROVE`      | `DECISION`      |
| `VSCREEN-0075` | Detalle y seguimiento de orden                        | `origo`    | `VPROC-0021` | `VPROC-0021::STEP-MONITOR_PURCHASE_ORDER` — Monitorear orden de compra                                    | `MONITOR`      | `IN_PROGRESS`   |
| `VSCREEN-0076` | Cola de recepciones                                   | `origo`    | `VPROC-0022` | `VPROC-0022::STEP-TRIAGE_RECEIPT_QUEUE` — Priorizar recepciones pendientes                                | `TRIAGE`       | `INITIAL`       |
| `VSCREEN-0077` | Recepción total o parcial                             | `origo`    | `VPROC-0022` | `VPROC-0022::STEP-RECEIVE_PURCHASE` — Registrar recepción total o parcial                                 | `EXECUTE`      | `IN_PROGRESS`   |
| `VSCREEN-0078` | Resolución de diferencias de recepción                | `origo`    | `VPROC-0022` | `VPROC-0022::STEP-RESOLVE_RECEIPT_VARIANCE` — Resolver diferencias de recepción                           | `DECIDE`       | `DECISION`      |
| `VSCREEN-0079` | Historial y auditoría de abastecimiento               | `origo`    | `VPROC-0022` | `VPROC-0022::STEP-AUDIT_PROCUREMENT_CYCLE` — Auditar ciclo de abastecimiento                              | `AUDIT`        | `CROSS_CUTTING` |
| `VSCREEN-0080` | Inicio POS                                            | `pulso`    | `VPROC-0039` | `VPROC-0039::STEP-ENTER_POS_WORKSPACE` — Entrar al espacio POS                                            | `ENTRY`        | `PRECONDITION`  |
| `VSCREEN-0081` | Creación de venta o pedido                            | `pulso`    | `VPROC-0039` | `VPROC-0039::STEP-CREATE_SALE_OR_ORDER` — Crear venta o pedido                                            | `INITIATE`     | `INITIAL`       |
| `VSCREEN-0082` | Mapa de salón y mesas                                 | `pulso`    | `VPROC-0038` | `VPROC-0038::STEP-MANAGE_TABLE_SERVICE` — Gestionar mesa y servicio                                       | `EXECUTE`      | `IN_PROGRESS`   |
| `VSCREEN-0083` | Detalle y modificación de pedido                      | `pulso`    | `VPROC-0038` | `VPROC-0038::STEP-MODIFY_ACTIVE_ORDER` — Modificar pedido activo                                          | `CORRECT`      | `IN_PROGRESS`   |
| `VSCREEN-0084` | Cobro y medios de pago                                | `pulso`    | `VPROC-0043` | `VPROC-0043::STEP-COLLECT_PAYMENT` — Cobrar y confirmar pago                                              | `EXECUTE`      | `DECISION`      |
| `VSCREEN-0085` | Identificación de cliente y acumulación               | `pulso`    | `VPROC-0045` | `VPROC-0045::STEP-IDENTIFY_CUSTOMER_AND_ACCRUE` — Identificar cliente y acumular puntos                   | `EXECUTE`      | `IN_PROGRESS`   |
| `VSCREEN-0086` | Redención de puntos o beneficios                      | `pulso`    | `VPROC-0045` | `VPROC-0045::STEP-REDEEM_LOYALTY_VALUE` — Redimir puntos o beneficios                                     | `EXECUTE`      | `DECISION`      |
| `VSCREEN-0087` | Bandeja de pedidos de canales externos                | `pulso`    | `VPROC-0040` | `VPROC-0040::STEP-ADMIT_EXTERNAL_ORDER` — Admitir pedido de canal externo                                 | `VALIDATE`     | `INITIAL`       |
| `VSCREEN-0088` | Seguimiento de preparación y entrega                  | `pulso`    | `VPROC-0039` | `VPROC-0039::STEP-MONITOR_ORDER_FULFILLMENT` — Monitorear preparación y entrega                           | `MONITOR`      | `IN_PROGRESS`   |
| `VSCREEN-0089` | Apertura de caja                                      | `pulso`    | `VPROC-0044` | `VPROC-0044::STEP-OPEN_CASH_SESSION` — Abrir caja                                                         | `INITIATE`     | `INITIAL`       |
| `VSCREEN-0090` | Cierre de caja                                        | `pulso`    | `VPROC-0044` | `VPROC-0044::STEP-CLOSE_CASH_SESSION` — Cerrar y conciliar caja                                           | `CLOSE`        | `TERMINAL`      |
| `VSCREEN-0091` | Anulación, devolución y reembolso                     | `pulso`    | `VPROC-0042` | `VPROC-0042::STEP-RESOLVE_REVERSAL_OR_REFUND` — Resolver anulación, devolución o reembolso                | `CORRECT`      | `DECISION`      |
| `VSCREEN-0092` | Oferta, menú, precio comercial y disponibilidad       | `pulso`    | `VPROC-0017` | `VPROC-0017::STEP-PUBLISH_COMMERCIAL_OFFER` — Publicar oferta comercial                                   | `PUBLISH`      | `IN_PROGRESS`   |
| `VSCREEN-0093` | Revisión de ventas, caja y terminales                 | `pulso`    | `VPROC-0044` | `VPROC-0044::STEP-REVIEW_SALES_AND_TERMINALS` — Revisar ventas, caja y terminales                         | `REVIEW`       | `CROSS_CUTTING` |
| `VSCREEN-0094` | Inicio financiero y ejecutivo                         | `numera`   | `VPROC-0061` | `VPROC-0061::STEP-REVIEW_FINANCIAL_POSITION` — Revisar posición financiera                                | `MONITOR`      | `CROSS_CUTTING` |
| `VSCREEN-0095` | Bandeja de hechos económicos                          | `numera`   | `VPROC-0051` | `VPROC-0051::STEP-TRIAGE_ECONOMIC_FACTS` — Clasificar hechos económicos                                   | `TRIAGE`       | `INITIAL`       |
| `VSCREEN-0096` | Registro de gasto y soporte                           | `numera`   | `VPROC-0051` | `VPROC-0051::STEP-CAPTURE_EXPENSE_AND_EVIDENCE` — Registrar gasto y soporte                               | `CAPTURE`      | `IN_PROGRESS`   |
| `VSCREEN-0097` | Bandeja de aprobaciones financieras                   | `numera`   | `VPROC-0052` | `VPROC-0052::STEP-APPROVE_FINANCIAL_DECISION` — Aprobar decisión financiera                               | `APPROVE`      | `DECISION`      |
| `VSCREEN-0098` | Cuentas por pagar y obligaciones                      | `numera`   | `VPROC-0052` | `VPROC-0052::STEP-MANAGE_PAYABLE_OBLIGATION` — Gestionar obligación por pagar                             | `EXECUTE`      | `IN_PROGRESS`   |
| `VSCREEN-0099` | Cuentas por cobrar y cartera                          | `numera`   | `VPROC-0053` | `VPROC-0053::STEP-MANAGE_RECEIVABLE` — Gestionar cartera y recaudo                                        | `EXECUTE`      | `IN_PROGRESS`   |
| `VSCREEN-0100` | Caja, bancos y movimientos financieros                | `numera`   | `VPROC-0052` | `VPROC-0052::STEP-EXECUTE_TREASURY_MOVEMENT` — Gestionar movimiento de tesorería                          | `EXECUTE`      | `IN_PROGRESS`   |
| `VSCREEN-0101` | Conciliación de ventas y pagos                        | `numera`   | `VPROC-0051` | `VPROC-0051::STEP-RECONCILE_SALES_AND_PAYMENTS` — Conciliar ventas y pagos                                | `RECONCILE`    | `DECISION`      |
| `VSCREEN-0102` | Conciliación de compras y recepciones                 | `numera`   | `VPROC-0051` | `VPROC-0051::STEP-RECONCILE_PURCHASES_AND_RECEIPTS` — Conciliar compras y recepciones                     | `RECONCILE`    | `DECISION`      |
| `VSCREEN-0103` | Conciliación de inventario, producción y variaciones  | `numera`   | `VPROC-0054` | `VPROC-0054::STEP-RECONCILE_OPERATING_VARIANCES` — Conciliar inventario, producción y variaciones         | `RECONCILE`    | `DECISION`      |
| `VSCREEN-0104` | Costos, rentabilidad y escenarios                     | `numera`   | `VPROC-0054` | `VPROC-0054::STEP-ANALYZE_COST_AND_PROFITABILITY` — Analizar costo y rentabilidad                         | `ANALYZE`      | `CROSS_CUTTING` |
| `VSCREEN-0105` | Cierre, reapertura y corrección de periodo            | `numera`   | `VPROC-0054` | `VPROC-0054::STEP-CLOSE_OR_REOPEN_PERIOD` — Cerrar, reabrir o corregir periodo                            | `CLOSE`        | `TERMINAL`      |
| `VSCREEN-0106` | Reportes y exportaciones financieras                  | `numera`   | `VPROC-0061` | `VPROC-0061::STEP-PUBLISH_FINANCIAL_REPORT` — Publicar reporte financiero                                 | `PUBLISH`      | `TERMINAL`      |
| `VSCREEN-0107` | Inicio del cliente y resumen de beneficios            | `pass`     | `VPROC-0045` | `VPROC-0045::STEP-ENTER_LOYALTY_HOME` — Entrar a fidelización personal                                    | `ENTRY`        | `PRECONDITION`  |
| `VSCREEN-0108` | QR personal de identificación                         | `pass`     | `VPROC-0045` | `VPROC-0045::STEP-PRESENT_CUSTOMER_ID` — Presentar identificación personal                                | `IDENTIFY`     | `IN_PROGRESS`   |
| `VSCREEN-0109` | Catálogo de beneficios y recompensas                  | `pass`     | `VPROC-0045` | `VPROC-0045::STEP-CONSULT_REWARDS_CATALOG` — Consultar beneficios y recompensas                           | `MONITOR`      | `IN_PROGRESS`   |
| `VSCREEN-0110` | Ticket o QR de redención                              | `pass`     | `VPROC-0045` | `VPROC-0045::STEP-CREATE_REDEMPTION_INTENT` — Crear ticket de redención                                   | `INITIATE`     | `INITIAL`       |
| `VSCREEN-0111` | Historial de puntos y redenciones                     | `pass`     | `VPROC-0045` | `VPROC-0045::STEP-AUDIT_PERSONAL_LOYALTY_LEDGER` — Consultar historial de puntos y redenciones            | `AUDIT`        | `CROSS_CUTTING` |
| `VSCREEN-0112` | Perfil, privacidad y consentimientos                  | `pass`     | `VPROC-0045` | `VPROC-0045::STEP-MAINTAIN_CUSTOMER_PROFILE_AND_CONSENT` — Gestionar perfil, privacidad y consentimientos | `SELF_SERVICE` | `IN_PROGRESS`   |
| `VSCREEN-0113` | Registro y seguimiento de decisiones empresariales    | `viso`     | `VPROC-0001` | `VPROC-0001::STEP-RECORD_AND_TRACK_DECISION` — Registrar y seguir decisión empresarial                    | `DECIDE`       | `DECISION`      |
| `VSCREEN-0114` | Solicitudes y certificaciones de acceso               | `viso`     | `VPROC-0059` | `VPROC-0059::STEP-REVIEW_AND_CERTIFY_ACCESS` — Revisar y certificar acceso                                | `APPROVE`      | `DECISION`      |
| `VSCREEN-0115` | Gobierno de documentos y evidencia                    | `viso`     | `VPROC-0060` | `VPROC-0060::STEP-GOVERN_DOCUMENT_EVIDENCE` — Gobernar documentos y evidencia                             | `CONFIGURE`    | `CROSS_CUTTING` |
| `VSCREEN-0116` | Registro de riesgos empresariales                     | `viso`     | `VPROC-0063` | `VPROC-0063::STEP-ASSESS_ENTERPRISE_RISK` — Evaluar y tratar riesgo empresarial                           | `REVIEW`       | `IN_PROGRESS`   |
| `VSCREEN-0117` | Requerimientos de asesores y autoridades              | `viso`     | `VPROC-0064` | `VPROC-0064::STEP-MANAGE_EXTERNAL_REQUIREMENT` — Gestionar requerimiento de asesor o autoridad            | `EXECUTE`      | `IN_PROGRESS`   |
| `VSCREEN-0118` | Gestión de desempeño y desarrollo                     | `viso`     | `VPROC-0065` | `VPROC-0065::STEP-REVIEW_PERFORMANCE_AND_DEVELOPMENT` — Gestionar desempeño y desarrollo                  | `REVIEW`       | `DECISION`      |
| `VSCREEN-0119` | Asignación y control de elementos de protección       | `viso`     | `VPROC-0066` | `VPROC-0066::STEP-ASSIGN_PROTECTIVE_EQUIPMENT` — Asignar y controlar elemento de protección               | `EXECUTE`      | `IN_PROGRESS`   |
| `VSCREEN-0120` | Mesa de servicio tecnológico                          | `viso`     | `VPROC-0058` | `VPROC-0058::STEP-RESOLVE_TECH_SERVICE_CASE` — Resolver caso de servicio tecnológico                      | `RECOVER`      | `IN_PROGRESS`   |
| `VSCREEN-0121` | Continuidad, contingencia y recuperación              | `viso`     | `VPROC-0062` | `VPROC-0062::STEP-ACTIVATE_AND_RECOVER_CONTINUITY` — Activar contingencia y recuperar operación           | `RECOVER`      | `IN_PROGRESS`   |
| `VSCREEN-0122` | Privacidad, cumplimiento y conservación               | `viso`     | `VPROC-0060` | `VPROC-0060::STEP-GOVERN_PRIVACY_AND_RETENTION` — Gobernar privacidad, cumplimiento y conservación        | `CONFIGURE`    | `CROSS_CUTTING` |
| `VSCREEN-0123` | Gestión de comunicaciones internas                    | `viso`     | `VPROC-0004` | `VPROC-0004::STEP-PUBLISH_INTERNAL_COMMUNICATION` — Publicar comunicación interna                         | `PUBLISH`      | `IN_PROGRESS`   |
| `VSCREEN-0124` | Mis comunicados laborales                             | `anima`    | `VPROC-0004` | `VPROC-0004::STEP-CONSULT_AND_ACKNOWLEDGE_COMMUNICATION` — Consultar y acusar comunicado laboral          | `SELF_SERVICE` | `IN_PROGRESS`   |
| `VSCREEN-0125` | Mi carnet laboral                                     | `anima`    | `VPROC-0006` | `VPROC-0006::STEP-PRESENT_EMPLOYEE_CREDENTIAL` — Presentar carnet laboral                                 | `IDENTIFY`     | `IN_PROGRESS`   |
| `VSCREEN-0126` | Mis documentos laborales                              | `anima`    | `VPROC-0060` | `VPROC-0060::STEP-CONSULT_OR_SUBMIT_EMPLOYMENT_DOCUMENT` — Consultar o aportar documento laboral          | `SELF_SERVICE` | `IN_PROGRESS`   |
| `VSCREEN-0127` | Mi capacitación                                       | `anima`    | `VPROC-0065` | `VPROC-0065::STEP-COMPLETE_ASSIGNED_TRAINING` — Completar capacitación asignada                           | `SELF_SERVICE` | `IN_PROGRESS`   |
| `VSCREEN-0128` | Mis objetivos y retroalimentación                     | `anima`    | `VPROC-0065` | `VPROC-0065::STEP-REVIEW_PERSONAL_OBJECTIVES` — Revisar objetivos y retroalimentación propios             | `SELF_SERVICE` | `IN_PROGRESS`   |
| `VSCREEN-0129` | Mis solicitudes de soporte                            | `anima`    | `VPROC-0058` | `VPROC-0058::STEP-SUBMIT_AND_TRACK_SUPPORT_REQUEST` — Solicitar y seguir soporte                          | `SELF_SERVICE` | `INITIAL`       |
| `VSCREEN-0130` | Mis reportes de seguridad y salud                     | `anima`    | `VPROC-0013` | `VPROC-0013::STEP-REPORT_SST_EVENT` — Reportar condición o incidente SST                                  | `SELF_SERVICE` | `INITIAL`       |
| `VSCREEN-0131` | Mis elementos de protección                           | `anima`    | `VPROC-0066` | `VPROC-0066::STEP-ACKNOWLEDGE_PROTECTIVE_EQUIPMENT` — Consultar y aceptar elemento de protección          | `SELF_SERVICE` | `IN_PROGRESS`   |
| `VSCREEN-0132` | Reservas de inventario                                | `nexo`     | `VPROC-0028` | `VPROC-0028::STEP-RESERVE_STOCK` — Reservar inventario                                                    | `EXECUTE`      | `IN_PROGRESS`   |
| `VSCREEN-0133` | Planes y órdenes de mantenimiento de activos          | `nexo`     | `VPROC-0030` | `VPROC-0030::STEP-PLAN_AND_EXECUTE_ASSET_MAINTENANCE` — Planear y ejecutar mantenimiento de activo        | `PLAN`         | `IN_PROGRESS`   |
| `VSCREEN-0134` | Garantías, seguros y reclamaciones de activos         | `nexo`     | `VPROC-0030` | `VPROC-0030::STEP-MANAGE_ASSET_CLAIM` — Gestionar garantía, seguro o reclamación                          | `EXECUTE`      | `IN_PROGRESS`   |
| `VSCREEN-0135` | Instancias y operación de kits                                      | `nexo`     | `VPROC-0067` | `VPROC-0067::STEP-ASSEMBLE_AND_CONTROL_KIT` — Armar y controlar kit                                       | `EXECUTE`      | `IN_PROGRESS`   |
| `VSCREEN-0136` | Flota y vehículos                                     | `nexo`     | `VPROC-0031` | `VPROC-0031::STEP-MANAGE_FLEET_ASSET` — Gestionar flota y vehículos                                       | `CONFIGURE`    | `IN_PROGRESS`   |
| `VSCREEN-0137` | Kilometraje y combustible                             | `nexo`     | `VPROC-0031` | `VPROC-0031::STEP-CAPTURE_MILEAGE_AND_FUEL` — Registrar kilometraje y combustible                         | `CAPTURE`      | `IN_PROGRESS`   |
| `VSCREEN-0138` | Planeación de rutas y despachos                       | `nexo`     | `VPROC-0048` | `VPROC-0048::STEP-PLAN_ROUTE_AND_DISPATCH` — Planear ruta y despacho                                      | `PLAN`         | `IN_PROGRESS`   |
| `VSCREEN-0139` | Ejecución de ruta y prueba de entrega                 | `nexo`     | `VPROC-0049` | `VPROC-0049::STEP-EXECUTE_ROUTE_AND_PROVE_DELIVERY` — Ejecutar ruta y registrar prueba de entrega         | `EXECUTE`      | `IN_PROGRESS`   |
| `VSCREEN-0140` | Novedades, rechazos y retornos logísticos             | `nexo`     | `VPROC-0049` | `VPROC-0049::STEP-RESOLVE_LOGISTICS_EXCEPTION` — Resolver novedad, rechazo o retorno                      | `CORRECT`      | `DECISION`      |
| `VSCREEN-0141` | Instalaciones, servicios y mantenimiento locativo     | `nexo`     | `VPROC-0055` | `VPROC-0055::STEP-MANAGE_FACILITY_SERVICE` — Gestionar instalaciones y mantenimiento locativo             | `EXECUTE`      | `IN_PROGRESS`   |
| `VSCREEN-0142` | Configuración de políticas y rutas logísticas         | `nexo`     | `VPROC-0048` | `VPROC-0048::STEP-CONFIGURE_LOGISTICS_POLICY` — Configurar políticas y rutas logísticas                   | `CONFIGURE`    | `IN_PROGRESS`   |
| `VSCREEN-0143` | Diseñador de etiquetas logísticas                     | `nexo`     | `VPROC-0015` | `VPROC-0015::STEP-AUTHOR_LOGISTICS_LABEL_TEMPLATE` — Diseñar etiqueta logística                           | `CONFIGURE`    | `IN_PROGRESS`   |
| `VSCREEN-0144` | Cola y trabajos de impresión logística           | `nexo`     | `VPROC-0024` | `VPROC-0024::STEP-OPERATE_PRINT_QUEUE` — Operar cola y trabajos de impresión              | `EXECUTE`      | `IN_PROGRESS`   |
| `VSCREEN-0145` | Contratos, precios y condiciones de proveedor         | `origo`    | `VPROC-0020` | `VPROC-0020::STEP-GOVERN_SUPPLIER_TERMS` — Gestionar contratos, precios y condiciones                     | `CONFIGURE`    | `IN_PROGRESS`   |
| `VSCREEN-0146` | Desempeño y reclamaciones de proveedor                | `origo`    | `VPROC-0020` | `VPROC-0020::STEP-REVIEW_SUPPLIER_PERFORMANCE` — Evaluar desempeño y reclamaciones de proveedor           | `REVIEW`       | `DECISION`      |
| `VSCREEN-0147` | Oportunidades y cotizaciones de catering o B2B        | `pulso`    | `VPROC-0041` | `VPROC-0041::STEP-QUALIFY_B2B_OPPORTUNITY` — Calificar oportunidad y preparar cotización                  | `REVIEW`       | `INITIAL`       |
| `VSCREEN-0148` | Ejecución de catering o venta B2B                     | `pulso`    | `VPROC-0041` | `VPROC-0041::STEP-EXECUTE_B2B_COMMITMENT` — Ejecutar catering o venta B2B                                 | `EXECUTE`      | `IN_PROGRESS`   |
| `VSCREEN-0149` | Operación de reservas y eventos                       | `pulso`    | `VPROC-0047` | `VPROC-0047::STEP-MANAGE_RESERVATION_OR_EVENT` — Gestionar reserva o evento                               | `EXECUTE`      | `IN_PROGRESS`   |
| `VSCREEN-0150` | Casos de reclamo y compensación                       | `pulso`    | `VPROC-0046` | `VPROC-0046::STEP-RESOLVE_CUSTOMER_CLAIM` — Resolver reclamo y compensación                               | `DECIDE`       | `DECISION`      |
| `VSCREEN-0151` | Coordinación de entrega mediante tercero              | `pulso`    | `VPROC-0050` | `VPROC-0050::STEP-COORDINATE_THIRD_PARTY_DELIVERY` — Coordinar entrega mediante tercero                   | `MONITOR`      | `IN_PROGRESS`   |
| `VSCREEN-0152` | Análisis de satisfacción y servicio                   | `pulso`    | `VPROC-0068` | `VPROC-0068::STEP-ANALYZE_SERVICE_SATISFACTION` — Analizar satisfacción y servicio                        | `ANALYZE`      | `CROSS_CUTTING` |
| `VSCREEN-0153` | Paquete laboral para pagos y beneficios               | `numera`   | `VPROC-0010` | `VPROC-0010::STEP-PREPARE_LABOR_PAYMENT_PACKAGE` — Preparar paquete laboral para pago                     | `RECONCILE`    | `DECISION`      |
| `VSCREEN-0154` | Facturas y documentos fiscales                        | `numera`   | `VPROC-0051` | `VPROC-0051::STEP-MANAGE_FISCAL_DOCUMENT` — Gestionar factura o documento fiscal                          | `EXECUTE`      | `IN_PROGRESS`   |
| `VSCREEN-0155` | Tesorería y programación de pagos                     | `numera`   | `VPROC-0052` | `VPROC-0052::STEP-PLAN_AND_EXECUTE_PAYMENTS` — Programar y ejecutar pagos                                 | `PLAN`         | `IN_PROGRESS`   |
| `VSCREEN-0156` | Presupuestos, escenarios y forecast                   | `numera`   | `VPROC-0069` | `VPROC-0069::STEP-PLAN_BUDGET_AND_FORECAST` — Gestionar presupuesto, escenario y forecast                 | `PLAN`         | `IN_PROGRESS`   |
| `VSCREEN-0157` | Impuestos y obligaciones de cumplimiento              | `numera`   | `VPROC-0052` | `VPROC-0052::STEP-MANAGE_TAX_OBLIGATION` — Gestionar impuesto u obligación de cumplimiento                | `EXECUTE`      | `IN_PROGRESS`   |
| `VSCREEN-0158` | Distribución y asignación de costos                   | `numera`   | `VPROC-0054` | `VPROC-0054::STEP-ALLOCATE_COSTS` — Distribuir y asignar costos                                           | `EXECUTE`      | `IN_PROGRESS`   |
| `VSCREEN-0159` | Indicadores, análisis y planes de mejora              | `numera`   | `VPROC-0061` | `VPROC-0061::STEP-ANALYZE_AND_PLAN_IMPROVEMENT` — Analizar indicadores y gestionar mejora                 | `ANALYZE`      | `CROSS_CUTTING` |
| `VSCREEN-0160` | Inicio y selección del portal de compras              | `pass`     | `VPROC-0039` | `VPROC-0039::STEP-ENTER_CUSTOMER_COMMERCE` — Entrar y seleccionar contexto de compra                      | `ENTRY`        | `PRECONDITION`  |
| `VSCREEN-0161` | Menú y catálogo comercial del cliente                 | `pass`     | `VPROC-0017` | `VPROC-0017::STEP-BROWSE_COMMERCIAL_OFFER` — Consultar menú y catálogo comercial                          | `MONITOR`      | `IN_PROGRESS`   |
| `VSCREEN-0162` | Carrito y configuración del pedido                    | `pass`     | `VPROC-0039` | `VPROC-0039::STEP-CONFIGURE_CART` — Configurar carrito y pedido                                           | `CAPTURE`      | `INITIAL`       |
| `VSCREEN-0163` | Dirección, modalidad y programación de entrega        | `pass`     | `VPROC-0050` | `VPROC-0050::STEP-SELECT_FULFILLMENT` — Seleccionar dirección, modalidad y programación                   | `CAPTURE`      | `INITIAL`       |
| `VSCREEN-0164` | Revisión, checkout e inicio de pago                   | `pass`     | `VPROC-0043` | `VPROC-0043::STEP-REVIEW_AND_START_PAYMENT` — Revisar pedido e iniciar pago                               | `VALIDATE`     | `DECISION`      |
| `VSCREEN-0165` | Confirmación de pedido y retorno de pago              | `pass`     | `VPROC-0043` | `VPROC-0043::STEP-PRESENT_ORDER_RECEIPT` — Presentar confirmación y resultado de pago                     | `RECEIPT`      | `TERMINAL`      |
| `VSCREEN-0166` | Mis pedidos y detalle                                 | `pass`     | `VPROC-0039` | `VPROC-0039::STEP-CONSULT_PERSONAL_ORDERS` — Consultar pedidos propios                                    | `MONITOR`      | `IN_PROGRESS`   |
| `VSCREEN-0167` | Seguimiento de preparación y entrega del cliente      | `pass`     | `VPROC-0050` | `VPROC-0050::STEP-TRACK_PERSONAL_FULFILLMENT` — Seguir preparación y entrega propias                      | `MONITOR`      | `IN_PROGRESS`   |
| `VSCREEN-0168` | Chat y comunicación asociada al pedido                | `pass`     | `VPROC-0047` | `VPROC-0047::STEP-COMMUNICATE_ABOUT_ORDER` — Comunicarse sobre un pedido                                  | `SELF_SERVICE` | `IN_PROGRESS`   |
| `VSCREEN-0169` | Mis reclamos y casos de servicio                      | `pass`     | `VPROC-0046` | `VPROC-0046::STEP-SUBMIT_AND_TRACK_CLAIM` — Registrar y seguir reclamo propio                             | `SELF_SERVICE` | `INITIAL`       |
| `VSCREEN-0170` | Mis reservas y eventos                                | `pass`     | `VPROC-0047` | `VPROC-0047::STEP-MANAGE_PERSONAL_RESERVATION` — Gestionar reserva o evento propio                        | `SELF_SERVICE` | `IN_PROGRESS`   |
| `VSCREEN-0171` | Calificación y satisfacción                           | `pass`     | `VPROC-0068` | `VPROC-0068::STEP-SUBMIT_SATISFACTION_RATING` — Registrar calificación y satisfacción                     | `CAPTURE`      | `TERMINAL`      |
| `VSCREEN-0172` | Comunicaciones y notificaciones del cliente           | `pass`     | `VPROC-0047` | `VPROC-0047::STEP-CONSULT_CUSTOMER_COMMUNICATION` — Consultar comunicaciones y notificaciones             | `MONITOR`      | `CROSS_CUTTING` |
| `VSCREEN-0173` | Trazabilidad e investigación de lote                  | `fogo`     | `VPROC-0035` | `VPROC-0035::STEP-INVESTIGATE_BATCH_TRACEABILITY` — Investigar trazabilidad de lote                       | `AUDIT`        | `CROSS_CUTTING` |
| `VSCREEN-0174` | Controles operativos de inocuidad                     | `fogo`     | `VPROC-0014` | `VPROC-0014::STEP-EXECUTE_FOOD_SAFETY_CONTROL` — Ejecutar control operativo de inocuidad                  | `VALIDATE`     | `IN_PROGRESS`   |
| `VSCREEN-0175` | Seguridad de cuenta y sesiones                        | `shell`    | `VPROC-0059` | `VPROC-0059::STEP-MANAGE_ACCOUNT_SECURITY` — Gestionar seguridad de cuenta y sesiones                     | `RECOVER`      | `CROSS_CUTTING` |
| `VSCREEN-0176` | Definición de kits y conjuntos | `nexo` | `VPROC-0067` | `VPROC-0067::STEP-MAINTAIN_KIT_DEFINITION` — Mantener definición de kit | `CONFIGURE` | `IN_PROGRESS` |
| `VSCREEN-0177` | Configuración de impresoras logísticas | `nexo` | `VPROC-0024` | `VPROC-0024::STEP-CONFIGURE_LOGISTICS_PRINTERS` — Configurar impresoras logísticas | `CONFIGURE` | `IN_PROGRESS` |

---

#### 14. SCREEN-PROCESS-STEP-COVERAGE-MATRIX-001

| Proceso activo | Pantallas vinculadas | Anclas de paso | Resultado            |
| -------------- | -------------------: | -------------: | -------------------- |
| `VPROC-0001`   |                    2 |              2 | `COVERED`            |
| `VPROC-0002`   |                    1 |              1 | `COVERED`            |
| `VPROC-0003`   |                    1 |              1 | `COVERED`            |
| `VPROC-0004`   |                    5 |              5 | `COVERED`            |
| `VPROC-0005`   |                    2 |              2 | `COVERED`            |
| `VPROC-0006`   |                    4 |              4 | `COVERED`            |
| `VPROC-0007`   |                    3 |              3 | `COVERED`            |
| `VPROC-0008`   |                    3 |              3 | `COVERED`            |
| `VPROC-0009`   |                    2 |              2 | `COVERED`            |
| `VPROC-0010`   |                    1 |              1 | `COVERED`            |
| `VPROC-0011`   |                    1 |              1 | `COVERED`            |
| `VPROC-0012`   |                    1 |              1 | `COVERED`            |
| `VPROC-0013`   |                    2 |              2 | `COVERED`            |
| `VPROC-0014`   |                    2 |              2 | `COVERED`            |
| `VPROC-0015`   |                    3 |              3 | `COVERED`            |
| `VPROC-0016`   |                    4 |              4 | `COVERED`            |
| `VPROC-0017`   |                    2 |              2 | `COVERED`            |
| `VPROC-0018`   |                    1 |              1 | `COVERED`            |
| `VPROC-0019`   |                    2 |              2 | `COVERED`            |
| `VPROC-0020`   |                    5 |              5 | `COVERED`            |
| `VPROC-0021`   |                    3 |              3 | `COVERED`            |
| `VPROC-0022`   |                    4 |              4 | `COVERED`            |
| `VPROC-0023`   |                    2 |              2 | `COVERED`            |
| `VPROC-0024`   |                    5 |              5 | `COVERED`            |
| `VPROC-0025`   |                    2 |              2 | `COVERED`            |
| `VPROC-0026`   |                    3 |              3 | `COVERED`            |
| `VPROC-0027`   |                    1 |              1 | `COVERED`            |
| `VPROC-0028`   |                    7 |              7 | `COVERED`            |
| `VPROC-0029`   |                    1 |              1 | `COVERED`            |
| `VPROC-0030`   |                    2 |              2 | `COVERED`            |
| `VPROC-0031`   |                    2 |              2 | `COVERED`            |
| `VPROC-0032`   |                    1 |              1 | `COVERED`            |
| `VPROC-0033`   |                    2 |              2 | `COVERED`            |
| `VPROC-0034`   |                    3 |              3 | `COVERED`            |
| `VPROC-0035`   |                    2 |              2 | `COVERED`            |
| `VPROC-0036`   |                    1 |              1 | `COVERED`            |
| `VPROC-0037`   |                    2 |              2 | `COVERED`            |
| `VPROC-0038`   |                    2 |              2 | `COVERED`            |
| `VPROC-0039`   |                    6 |              6 | `COVERED`            |
| `VPROC-0040`   |                    1 |              1 | `COVERED`            |
| `VPROC-0041`   |                    2 |              2 | `COVERED`            |
| `VPROC-0042`   |                    1 |              1 | `COVERED`            |
| `VPROC-0043`   |                    3 |              3 | `COVERED`            |
| `VPROC-0044`   |                    3 |              3 | `COVERED`            |
| `VPROC-0045`   |                    8 |              8 | `COVERED`            |
| `VPROC-0046`   |                    2 |              2 | `COVERED`            |
| `VPROC-0047`   |                    4 |              4 | `COVERED`            |
| `VPROC-0048`   |                    2 |              2 | `COVERED`            |
| `VPROC-0049`   |                    2 |              2 | `COVERED`            |
| `VPROC-0050`   |                    3 |              3 | `COVERED`            |
| `VPROC-0051`   |                    5 |              5 | `COVERED`            |
| `VPROC-0052`   |                    5 |              5 | `COVERED`            |
| `VPROC-0053`   |                    1 |              1 | `COVERED`            |
| `VPROC-0054`   |                    4 |              4 | `COVERED`            |
| `VPROC-0055`   |                    1 |              1 | `COVERED`            |
| `VPROC-0058`   |                    3 |              3 | `COVERED`            |
| `VPROC-0059`   |                   10 |             10 | `COVERED`            |
| `VPROC-0060`   |                    3 |              3 | `COVERED`            |
| `VPROC-0061`   |                    3 |              3 | `COVERED`            |
| `VPROC-0062`   |                    1 |              1 | `COVERED`            |
| `VPROC-0063`   |                    1 |              1 | `COVERED`            |
| `VPROC-0064`   |                    1 |              1 | `COVERED`            |
| `VPROC-0065`   |                    3 |              3 | `COVERED`            |
| `VPROC-0066`   |                    2 |              2 | `COVERED`            |
| `VPROC-0067`   |                    2 |              2 | `COVERED`            |
| `VPROC-0068`   |                    2 |              2 | `COVERED`            |
| `VPROC-0069`   |                    1 |              1 | `COVERED`            |
| `VPROC-0056`   |                    0 |              0 | `DEFERRED_APP_SCOPE` |
| `VPROC-0057`   |                    0 |              0 | `DEFERRED_APP_SCOPE` |

La cobertura acredita que todo proceso activo tiene al menos una superficie ubicada en un paso. No afirma que todos sus pasos necesiten pantalla; pasos automáticos, externos o puramente sistémicos pueden no tener interacción humana.

---

#### 15. Resumen por rol y posición

##### 15.1 Roles

| Rol            | Pantallas |
| -------------- | --------: |
| `ENTRY`        |         5 |
| `IDENTIFY`     |         3 |
| `INITIATE`     |         5 |
| `TRIAGE`       |         7 |
| `CAPTURE`      |         8 |
| `CONFIGURE`    |        20 |
| `PLAN`         |         6 |
| `VALIDATE`     |         6 |
| `REVIEW`       |        10 |
| `SIMULATE`     |         1 |
| `APPROVE`      |         4 |
| `DECIDE`       |         9 |
| `EXECUTE`      |        35 |
| `MONITOR`      |        18 |
| `RECONCILE`    |         5 |
| `CORRECT`      |         3 |
| `CLOSE`        |         4 |
| `AUDIT`        |         3 |
| `ANALYZE`      |         3 |
| `PUBLISH`      |         3 |
| `RECEIPT`      |         1 |
| `RECOVER`      |         4 |
| `SELF_SERVICE` |        14 |
| **Total**      |   **177** |

##### 15.2 Posiciones

| Posición        | Pantallas |
| --------------- | --------: |
| `PRECONDITION`  |         5 |
| `INITIAL`       |        21 |
| `IN_PROGRESS`   |       100 |
| `DECISION`      |        29 |
| `TERMINAL`      |         7 |
| `CROSS_CUTTING` |        15 |
| **Total**       |   **177** |

---

#### 16. Reglas de frontera entre aplicaciones

- `TRANSVERSAL_ENTRY`: SHELL puede ubicar una pantalla en un paso de acceso, soporte o continuidad, pero la aplicación destino revalida y conserva propiedad;
- `PERSONAL_CHANNEL`: ANIMA puede iniciar o consultar el paso personal; VISO conserva decisiones administrativas cuando sea propietaria;
- `CUSTOMER_CHANNEL`: PASS puede capturar intención, mostrar seguimiento o receipt; PULSO/NEXO conservan pedido, pago y logística;
- `SUPERVISION_SURFACE`: la pantalla puede revisar o decidir sobre hechos de otra aplicación únicamente mediante contrato autorizado y sin reescribir el origen;
- ORIGO recibe compras y NEXO registra el efecto físico posterior;
- FOGO gobierna receta, lote y calidad; NEXO gobierna existencias y ubicaciones;
- NUMERA reconcilia efectos económicos sin recrear los hechos operativos.

---

#### 17. Cambio y versionado del vínculo

Cambiar `primary_process_step_ref` exige:

1. propuesta trazable y razón funcional;
2. comparación entre intención, objeto, entrada, salida, estado y resultado;
3. confirmación de que `primary_process_id` permanece válido;
4. nueva `step_binding_version`;
5. conservación de la referencia anterior;
6. actualización de acciones, permisos, métricas, pruebas y navegación consumidoras;
7. nuevo `VSCREEN-*` cuando el cambio destruya la identidad principal de la pantalla.

Un cambio de etiqueta humana o redacción no exige nueva referencia si el paso material permanece. Un paso materialmente distinto no podrá reutilizar una clave retirada.

---

#### 18. Validaciones obligatorias

La compilación deberá fallar cuando:

1. falte una de las 177 pantallas;
2. una pantalla aparezca más de una vez;
3. una pantalla no tenga exactamente una referencia primaria de paso;
4. el proceso embebido en la referencia no coincida con `primary_process_id`;
5. la referencia no cumpla el formato aprobado;
6. el rol o la posición no pertenezcan al vocabulario;
7. falte etiqueta humana o fundamento;
8. un proceso activo no tenga cobertura;
9. `VPROC-0056` o `VPROC-0057` reciban un paso mientras AURA siga diferida;
10. una pantalla de `MONITOR`, `AUDIT`, `ANALYZE` o `RECEIPT` sea tratada como autorización de escritura;
11. una posición `TERMINAL` no tenga relación con cierre o receipt;
12. una posición `PRECONDITION` se presente como resultado final;
13. un cambio de paso elimine la referencia anterior;
14. el conteo por roles, posiciones o procesos no coincida con la matriz física;
15. una tarea posterior utilice rutas, componentes o APIs como sustitutos del paso canónico.

---

#### 19. Seguridad y autorización

El vínculo pantalla–paso no concede:

- visibilidad de pantalla;
- lectura de datos;
- ejecución de acciones;
- capacidad de aprobar;
- alcance por sede, área o territorio;
- acceso por dispositivo compartido;
- confianza en un handoff;
- permiso para invocar una operación técnica.

La autorización continuará resolviéndose por identidad, actor, permiso atómico, contexto, recurso, territorio, versión, estado y segregación.

---

#### 20. SCREEN-PROCESS-STEP-CARRYOVER-REGISTER-001

| Pendiente                                             | Propietario exacto                                        |
| ----------------------------------------------------- | --------------------------------------------------------- |
| clasificar cada pantalla por carril UX                | `PROC-SCREEN-005` a `PROC-SCREEN-011`                     |
| definir actores objetivo                              | `PROC-SCREEN-012`                                         |
| definir dispositivos soportados                       | `PROC-SCREEN-013`                                         |
| definir acción principal y acciones secundarias       | `PROC-SCREEN-014` y `PROC-SCREEN-015`                     |
| definir condiciones de entrada y salida               | `PROC-SCREEN-016` y `PROC-SCREEN-017`                     |
| definir estados vacíos, carga, bloqueo y recuperación | `PROC-SCREEN-018` a `PROC-SCREEN-021`                     |
| definir sensibilidad y permisos                       | `PROC-SCREEN-022` a `PROC-SCREEN-024`                     |
| vincular operaciones técnicas                         | `PROC-SCREEN-025`                                         |
| mapear rutas y legado                                 | `PROC-SCREEN-026`                                         |
| definir métricas y aceptación operativa               | `PROC-SCREEN-027` y `PROC-SCREEN-028`                     |
| implementar tipos, constantes y validadores           | paquetes E5 y CI documental                               |
| validar con usuarios y operación real                 | `UX-QA-*` y pilotos E5                                    |
| admitir pasos de AURA                                 | tareas canónicas de AURA y nueva admisión `PROC-SCREEN-*` |

No queda pendiente narrativo sin tarea o puerta de resolución.

---

#### 21. Requisitos de prueba derivados

**Resultado:** GENERA 32 REQUISITOS DE PRUEBA.

Se incorporan `TREQ-UX-577` a `TREQ-UX-608` al Registro Canónico completo. Permanecen en estado `IDENTIFICADO`; automatización, implementación y evidencia corresponden a CI, paquetes E5, BLOQUE U, staging y pilotos.

---

#### 22. Criterios de aceptación

- [x] Se consumen las 177 pantallas sin renumerarlas.
- [x] Cada pantalla tiene exactamente un proceso y una referencia primaria de paso.
- [x] La referencia de paso está namespaced por el proceso correcto.
- [x] Los 67 procesos activos tienen cobertura.
- [x] `VPROC-0056` y `VPROC-0057` permanecen diferidos.
- [x] Los roles y posiciones usan vocabularios cerrados.
- [x] Se distinguen paso, estado, transición, acción, pantalla y operación técnica.
- [x] Las pantallas multietapa conservan un único paso dominante.
- [x] No se deriva autorización desde el vínculo.
- [x] Se preservan fronteras SHELL, VISO–ANIMA, PULSO–PASS, ORIGO–NEXO, FOGO–NEXO y NUMERA–orígenes.
- [x] Se definen cambio, versionado e historial.
- [x] Los conteos de 177 filas, 23 roles, 6 posiciones y 67 procesos coinciden.
- [x] Se generan `TREQ-UX-577` a `TREQ-UX-608`.
- [x] No se anticipan carriles, actores, dispositivos, acciones, permisos, rutas o APIs.
- [x] No se implementa código ni se avanza a `PROC-SCREEN-005`.

---

#### 23. Resultado y continuidad

```text
PROC-SCREEN-003 APROBADA
PROC-SCREEN-004 APROBADA
PROC-SCREEN-005 NO INICIADA
```

La continuidad documental pasa exclusivamente a:

```text
PROC-SCREEN-005 — Clasificar pantalla operativa
```


### ✅ PROC-SCREEN-005 — Clasificar pantalla operativa

**Estado:** APROBADA

**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal

**Marcador exacto que reemplaza:** `### [ ] PROC-SCREEN-005 — Clasificar pantalla operativa`

**Tarea anterior:** `PROC-SCREEN-004 — Vincular cada pantalla con un paso del proceso` — APROBADA

**Siguiente tarea reservada:** `PROC-SCREEN-006 — Clasificar pantalla administrativa` — NO INICIADA

**Artefactos lógicos contenidos en esta tarea:**

- `SCREEN-OPERATIONAL-CLASSIFICATION-CONTRACT-001`;
- `SCREEN-OPERATIONAL-PATTERN-VOCABULARY-001`;
- `SCREEN-OPERATIONAL-CLASSIFICATION-REGISTER-001`;
- `SCREEN-OPERATIONAL-COVERAGE-MATRIX-001`;
- `SCREEN-OPERATIONAL-CLASSIFICATION-CHANGE-POLICY-001`;
- `SCREEN-OPERATIONAL-CLASSIFICATION-VALIDATION-GATE-001`;
- `SCREEN-OPERATIONAL-CARRYOVER-REGISTER-001`.

**Resultado cuantitativo:** **177 pantallas clasificadas**, de las cuales **54** quedan como `PRIMARY_OPERATIONAL`, **30** como `SECONDARY_OPERATIONAL` y **93** como `OUTSIDE_OPERATIONAL_CLASS`; se utilizan **11 patrones operativos**, existen **84 pantallas con relevancia operativa** y no se crean pantallas para AURA.

**Naturaleza:** clasificación documental del grado de relación de cada pantalla con la ejecución operativa interna. No define todavía clasificación administrativa, de supervisión, configuración, auditoría, personal o de cliente; tampoco define actores, dispositivos, acciones, estados de interfaz, sensibilidad, permisos, rutas u operaciones técnicas.

**Cambios en código de producto, componentes, rutas, repositorios consumidores, Supabase, tablas, migraciones, RLS, RPC, eventos, analítica o producción:** no autorizados por esta tarea.

---

#### 1. Propósito

Determinar cuáles pantallas constituyen el espacio principal de ejecución operativa interna de Vento Group, cuáles solo prestan soporte inmediato a esa ejecución y cuáles quedan fuera de la clase operativa.

```text
PANTALLA
    +
PROCESO Y PASO DOMINANTES
    +
EFECTO SOBRE TRABAJO VIVO
    +
URGENCIA Y CONTINUIDAD OPERATIVA
    =
CLASIFICACION OPERATIVA TRAZABLE
```

La clasificación responde **qué grado de relación tiene la pantalla con la operación viva**. No concede acceso, no asigna actores, no exige por sí sola turno, check-in, sede, área, estación o dispositivo compartido y no sustituye los permisos atómicos.

---

#### 2. Dependencias consumidas

- `PROC-SCREEN-001` y la identidad estable `VSCREEN-*`;
- `PROC-SCREEN-002` y las aplicaciones primarias;
- `PROC-SCREEN-003` y los procesos primarios;
- `PROC-SCREEN-004` y los pasos dominantes;
- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-010`;
- `UX-BASE-001` a `UX-BASE-015`;
- `UX-STATION-001` a `UX-STATION-012`;
- `UX-ADMIN-001` a `UX-ADMIN-005`;
- los contratos aprobados de contexto operativo, estaciones compartidas, handoff, canal personal y canal de cliente.

La tarea consume estas fuentes sin reabrirlas. Una pantalla no se clasifica como operativa por pertenecer a NEXO, FOGO o PULSO, ni deja de serlo por vivir en SHELL, VISO, ANIMA u ORIGO.

---

#### 3. Alcance

1. incorporar `operational_fit` a las 177 pantallas;
2. distinguir operación primaria, soporte operativo secundario y ausencia de clase operativa;
3. definir once patrones operativos reutilizables;
4. clasificar cada pantalla mediante proceso, paso, objeto, efecto y urgencia;
5. evitar que configuración, auditoría, análisis, canal personal o canal de cliente sean tratados automáticamente como operación interna;
6. conservar las fronteras entre aplicaciones;
7. impedir que la clasificación otorgue permisos o contexto;
8. establecer versionado, validaciones y carryovers exactos;
9. dejar preparada la continuidad hacia `PROC-SCREEN-006` a `PROC-SCREEN-011`;
10. exigir que la última tarea de clasificación cierre una única clase primaria por pantalla.

---

#### 4. Exclusiones

Esta tarea no:

- clasifica formalmente pantallas administrativas, de supervisión, configuración, auditoría, personales o de cliente;
- decide actores, roles o segregación;
- define dispositivos, estaciones o periféricos;
- define acción principal o acciones secundarias;
- define condiciones de entrada o salida;
- diseña estados vacíos, carga, bloqueo o recuperación de interfaz;
- decide información sensible visible;
- asigna permisos de lectura o acción;
- vincula Server Actions, APIs, RPC, eventos o tablas;
- mapea rutas o componentes legacy;
- activa AURA;
- convierte toda pantalla de una aplicación operativa en pantalla operativa.

---

#### 5. Definición canónica de pantalla operativa

Una pantalla tiene relevancia operativa cuando interviene sobre un trabajo empresarial **activo**, con efecto temporalmente sensible, y cumple al menos una de estas condiciones:

- ejecuta o confirma una mutación física, productiva, comercial, logística o de servicio;
- captura un hecho operacional necesario para continuar;
- admite o prioriza una cola de trabajo vivo;
- valida o decide una excepción que bloquea la continuidad;
- monitorea un compromiso abierto y permite actuar sobre desvíos;
- cierra un ciclo operativo;
- recupera o contiene una interrupción operacional;
- aporta consulta o identificación inmediata indispensable para ejecutar.

No basta con:

- mostrar información;
- pertenecer a una aplicación operativa;
- usar una tableta o dispositivo compartido;
- estar disponible durante un turno;
- consultar una tabla transaccional;
- contener un botón;
- tener un paso `EXECUTE`;
- ser importante para la empresa.

---

#### 6. Estados de clasificación

| Valor                       | Significado                                                                         | Efecto documental                                                    |
| --------------------------- | ----------------------------------------------------------------------------------- | -------------------------------------------------------------------- |
| `PRIMARY_OPERATIONAL`       | ejecutar, entrar, identificar, consultar o guiar trabajo vivo es la intención dominante e indispensable de la pantalla | reserva `OPERATIONAL` como clase primaria |
| `SECONDARY_OPERATIONAL`     | la pantalla presta soporte inmediato a la operación, pero otra clase será primaria  | agrega relevancia operativa secundaria sin cerrar la clase principal |
| `OUTSIDE_OPERATIONAL_CLASS` | la pantalla no representa ejecución ni soporte operativo interno bajo este contrato | queda disponible para las clasificaciones posteriores                |

Cada pantalla recibe exactamente uno de estos tres valores en esta tarea.

`SECONDARY_OPERATIONAL` no significa menor importancia. Significa que la pantalla apoya la operación mediante planificación, consulta, cola, control, monitoreo, recuperación o autoservicio, mientras su intención primaria pertenece probablemente a otro carril que deberá aprobarse después.

Una entrada, identificación, consulta o guía puede ser `PRIMARY_OPERATIONAL` cuando constituye el trabajo dominante del paso activo y su ausencia o demora impide ejecutar correctamente. No se exige una mutación material artificial para reconocer esa intención.

---

#### 7. Contrato mínimo

| Campo                                | Obligación                                                           |
| ------------------------------------ | -------------------------------------------------------------------- |
| `screen_id`                          | `VSCREEN-*` canónico                                                 |
| `primary_application_id`             | aplicación aprobada en `PROC-SCREEN-002`                             |
| `primary_process_id`                 | proceso aprobado en `PROC-SCREEN-003`                                |
| `primary_process_step_ref`           | paso aprobado en `PROC-SCREEN-004`                                   |
| `operational_fit`                    | uno de los tres estados aprobados                                    |
| `operational_pattern`                | uno de los once patrones o `NONE`                                    |
| `operational_reason`                 | fundamento verificable                                               |
| `operational_classification_version` | versión semántica                                                    |
| `operational_classification_status`  | `CANONICAL`, `CHANGE_PROPOSED`, `SUPERSEDED` o `RETIRED_WITH_SCREEN` |
| `operational_classification_task`    | tarea que aprobó o modificó la decisión                              |

Valores iniciales:

```text
operational_classification_version: 1.0.0
operational_classification_status: CANONICAL
operational_classification_task: PROC-SCREEN-005
decision_record: INITIAL_OPERATIONAL_CLASSIFICATION
```

---

#### 8. SCREEN-OPERATIONAL-PATTERN-VOCABULARY-001

| Patrón                   | Uso                                                                        |
| ------------------------ | -------------------------------------------------------------------------- |
| `OPERATIONAL_ENTRY`      | habilita la entrada inmediata a un espacio o contexto de trabajo operativo |
| `OPERATIONAL_QUEUE`      | admite, ordena o prioriza trabajo operativo pendiente                      |
| `OPERATIONAL_LOOKUP`     | identifica o consulta información imprescindible para ejecutar             |
| `OPERATIONAL_PLANNING`   | prepara capacidad, secuencia, ruta, mantenimiento o producción próxima     |
| `OPERATIONAL_CAPTURE`    | registra hechos, cantidades, tiempos, avances o condiciones                |
| `OPERATIONAL_EXECUTION`  | ejecuta o confirma una mutación material de la operación                   |
| `OPERATIONAL_CONTROL`    | valida, revisa, reconcilia o decide sobre trabajo activo                   |
| `OPERATIONAL_MONITORING` | sigue un compromiso operativo abierto                                      |
| `OPERATIONAL_EXCEPTION`  | resuelve rechazo, devolución, diferencia, reversión o retorno              |
| `OPERATIONAL_CLOSURE`    | cierra una sesión, lote o ciclo operativo                                  |
| `OPERATIONAL_RECOVERY`   | restablece o contiene la continuidad operacional                           |
| `NONE`                   | no existe relevancia operativa bajo esta tarea                             |

El patrón no sustituye el paso del proceso ni anticipa acciones de interfaz.

---

#### 9. Algoritmo de decisión

Se clasifica `PRIMARY_OPERATIONAL` cuando:

1. existe un caso, objeto, sesión, lote, pedido, movimiento, ruta, recepción o servicio activo;
2. la pantalla modifica, confirma, concilia o cierra su estado material;
3. la omisión o demora bloquea o degrada la operación inmediata;
4. la persona reconoce la pantalla como lugar principal para realizar ese trabajo;
5. la intención persiste aunque cambie ruta, componente o dispositivo.

Se clasifica `SECONDARY_OPERATIONAL` cuando:

1. la pantalla sirve a trabajo vivo mediante consulta, cola, planificación, control, monitoreo, recuperación o autoservicio;
2. no concentra la mutación material principal;
3. otra clase será probablemente dominante;
4. retirar la pantalla degrada la operación, pero no elimina el espacio propietario de ejecución.

Se clasifica `OUTSIDE_OPERATIONAL_CLASS` cuando predomina:

- gobierno o administración;
- configuración de maestros o políticas;
- auditoría histórica;
- análisis estratégico o financiero;
- autoservicio personal no operativo;
- experiencia de cliente;
- acceso o cuenta transversal sin trabajo operativo material.

---

#### 10. SCREEN-OPERATIONAL-CLASSIFICATION-REGISTER-001

| Screen ID      | Pantalla                                              | Aplicación | Paso dominante                                              | Clasificación operativa     | Patrón                   | Fundamento                                                                                                                                                                                                                                         |
| -------------- | ----------------------------------------------------- | ---------- | ----------------------------------------------------------- | --------------------------- | ------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VSCREEN-0001` | Hub Vento OS                                          | `shell`    | `VPROC-0059::STEP-ENTER_ECOSYSTEM`                          | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Acceso, cuenta o navegación transversal; no constituye por sí misma una superficie operativa.                                                                                                                                                      |
| `VSCREEN-0002` | Inicio de sesión y recuperación                       | `shell`    | `VPROC-0059::STEP-AUTHENTICATE_OR_RECOVER`                  | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Acceso, cuenta o navegación transversal; no constituye por sí misma una superficie operativa.                                                                                                                                                      |
| `VSCREEN-0003` | Resolución de contexto y acceso                       | `shell`    | `VPROC-0059::STEP-RESOLVE_EFFECTIVE_CONTEXT`                | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_ENTRY`      | La pantalla habilita la entrada inmediata a trabajo operativo, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.                  |
| `VSCREEN-0004` | Activación de dispositivo compartido                  | `shell`    | `VPROC-0059::STEP-ACTIVATE_SHARED_DEVICE`                   | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_ENTRY`      | La pantalla habilita la entrada inmediata a trabajo operativo, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.                  |
| `VSCREEN-0005` | Bandeja transversal de tareas y notificaciones        | `shell`    | `VPROC-0004::STEP-TRIAGE_TRANSVERSAL_WORK`                  | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_QUEUE`      | La pantalla prioriza o admite trabajo operativo pendiente, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.                      |
| `VSCREEN-0006` | Centro de soporte y diagnóstico                       | `shell`    | `VPROC-0058::STEP-DIAGNOSE_AND_ROUTE_SUPPORT`               | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_RECOVERY`   | La pantalla restablece o contiene la continuidad de la operación, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.               |
| `VSCREEN-0007` | Inicio ejecutivo y gerencial                          | `viso`     | `VPROC-0001::STEP-REVIEW_EXECUTIVE_WORK`                    | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Trabajo administrativo, de gobierno o decisión de backoffice; no tiene ejecución operativa interna dominante.                                                                                                                                      |
| `VSCREEN-0008` | Estructura organizativa                               | `viso`     | `VPROC-0002::STEP-MAINTAIN_ORGANIZATIONAL_STRUCTURE`        | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0009` | Políticas, delegaciones y límites                     | `viso`     | `VPROC-0003::STEP-AUTHOR_POLICIES_AND_LIMITS`               | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0010` | Compromisos y transferencias internas                 | `viso`     | `VPROC-0004::STEP-TRACK_INTERNAL_COMMITMENTS`               | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_MONITORING` | La pantalla sigue un compromiso operativo todavía abierto, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.                      |
| `VSCREEN-0011` | Embudo de candidatos                                  | `viso`     | `VPROC-0005::STEP-TRIAGE_CANDIDATES`                        | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Trabajo administrativo, de gobierno o decisión de backoffice; no tiene ejecución operativa interna dominante.                                                                                                                                      |
| `VSCREEN-0012` | Caso de selección                                     | `viso`     | `VPROC-0005::STEP-EVALUATE_AND_DECIDE_CANDIDATE`            | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Trabajo administrativo, de gobierno o decisión de backoffice; no tiene ejecución operativa interna dominante.                                                                                                                                      |
| `VSCREEN-0013` | Vinculación e incorporación                           | `viso`     | `VPROC-0006::STEP-ORCHESTRATE_ONBOARDING`                   | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Trabajo administrativo, de gobierno o decisión de backoffice; no tiene ejecución operativa interna dominante.                                                                                                                                      |
| `VSCREEN-0014` | Directorio y expediente laboral                       | `viso`     | `VPROC-0006::STEP-MAINTAIN_EMPLOYMENT_RECORD`               | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0015` | Programación laboral                                  | `viso`     | `VPROC-0007::STEP-PLAN_AND_PUBLISH_SCHEDULE`                | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_PLANNING`   | La pantalla prepara capacidad o secuencia de ejecución próxima, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.                 |
| `VSCREEN-0016` | Revisión de asistencia                                | `viso`     | `VPROC-0008::STEP-REVIEW_ATTENDANCE_EXCEPTION`              | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_CONTROL`    | La pantalla valida, revisa, reconcilia o decide sobre trabajo activo, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.           |
| `VSCREEN-0017` | Novedades, ausencias y reemplazos                     | `viso`     | `VPROC-0009::STEP-RESOLVE_WORKFORCE_CASE`                   | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_CONTROL`    | La pantalla valida, revisa, reconcilia o decide sobre trabajo activo, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.           |
| `VSCREEN-0018` | Retiro y revocación coordinada                        | `viso`     | `VPROC-0011::STEP-CLOSE_EMPLOYMENT_AND_REVOKE`              | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Trabajo administrativo, de gobierno o decisión de backoffice; no tiene ejecución operativa interna dominante.                                                                                                                                      |
| `VSCREEN-0019` | Catálogo de roles y permisos                          | `viso`     | `VPROC-0059::STEP-MAINTAIN_ACCESS_CATALOG`                  | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0020` | Perfil de acceso del trabajador                       | `viso`     | `VPROC-0059::STEP-ASSIGN_EFFECTIVE_ACCESS`                  | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0021` | Simulación de permisos y conflictos                   | `viso`     | `VPROC-0059::STEP-SIMULATE_ACCESS_DECISION`                 | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Análisis o simulación sin ejecución material inmediata; su carril primario se resolverá en las clasificaciones posteriores.                                                                                                                        |
| `VSCREEN-0022` | Gobierno de dispositivos compartidos                  | `viso`     | `VPROC-0059::STEP-GOVERN_SHARED_DEVICES`                    | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0023` | Riesgos de seguridad y salud                          | `viso`     | `VPROC-0012::STEP-ASSESS_SST_RISK`                          | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Trabajo administrativo, de gobierno o decisión de backoffice; no tiene ejecución operativa interna dominante.                                                                                                                                      |
| `VSCREEN-0024` | Incidentes y emergencias                              | `viso`     | `VPROC-0013::STEP-MANAGE_INCIDENT_RESPONSE`                 | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_RECOVERY`   | La pantalla restablece o contiene la continuidad de la operación, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.               |
| `VSCREEN-0025` | Controles de higiene y cumplimiento                   | `viso`     | `VPROC-0014::STEP-REVIEW_HYGIENE_COMPLIANCE`                | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_CONTROL`    | La pantalla valida, revisa, reconcilia o decide sobre trabajo activo, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.           |
| `VSCREEN-0026` | Bandeja de casos administrativos transversales        | `viso`     | `VPROC-0004::STEP-TRIAGE_ADMIN_CASES`                       | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_QUEUE`      | La pantalla prioriza o admite trabajo operativo pendiente, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.                      |
| `VSCREEN-0027` | Inicio personal del trabajador                        | `anima`    | `VPROC-0007::STEP-ENTER_PERSONAL_WORKSPACE`                 | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal personal del trabajador sin ejecución operativa interna dominante. Su clasificación primaria queda reservada a PROC-SCREEN-010.                                                                                                              |
| `VSCREEN-0028` | Registro de entrada, pausa y salida                   | `anima`    | `VPROC-0008::STEP-CAPTURE_ATTENDANCE_EVENT`                 | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_CAPTURE`    | La intención dominante registra hechos, cantidades, tiempos o condiciones de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                      |
| `VSCREEN-0029` | Mi programación                                       | `anima`    | `VPROC-0007::STEP-CONSULT_PUBLISHED_SCHEDULE`               | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_LOOKUP`     | La pantalla aporta consulta o identificación necesaria para ejecutar, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.           |
| `VSCREEN-0030` | Mi asistencia y solicitud de corrección               | `anima`    | `VPROC-0008::STEP-CONSULT_OR_REQUEST_ATTENDANCE_CORRECTION` | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_CONTROL`    | La pantalla valida, revisa, reconcilia o decide sobre trabajo activo, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.           |
| `VSCREEN-0031` | Mis novedades, permisos y ausencias                   | `anima`    | `VPROC-0009::STEP-SUBMIT_PERSONAL_WORKFORCE_CASE`           | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_CAPTURE`    | La pantalla registra hechos, cantidades, tiempos o condiciones de la operación, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011. |
| `VSCREEN-0032` | Mi perfil laboral                                     | `anima`    | `VPROC-0006::STEP-MAINTAIN_SELF_SERVICE_PROFILE`            | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal personal del trabajador sin ejecución operativa interna dominante. Su clasificación primaria queda reservada a PROC-SCREEN-010.                                                                                                              |
| `VSCREEN-0033` | Resumen de inventario y abastecimiento interno        | `nexo`     | `VPROC-0028::STEP-MONITOR_INTERNAL_SUPPLY`                  | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_MONITORING` | La pantalla sigue un compromiso operativo todavía abierto, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.                      |
| `VSCREEN-0034` | Catálogo de productos físicos                         | `nexo`     | `VPROC-0015::STEP-CONSULT_PHYSICAL_PRODUCT_CATALOG`         | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_LOOKUP`     | La pantalla aporta consulta o identificación necesaria para ejecutar, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.           |
| `VSCREEN-0035` | Editor de producto, unidad y presentación             | `nexo`     | `VPROC-0015::STEP-MAINTAIN_PRODUCT_PRESENTATION`            | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0036` | Especificaciones y criterios de calidad               | `nexo`     | `VPROC-0018::STEP-MAINTAIN_QUALITY_SPECIFICATION`           | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0037` | Catálogo de ubicaciones                               | `nexo`     | `VPROC-0023::STEP-MAINTAIN_LOCATION_CATALOG`                | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0038` | Identificación y detalle de ubicación | `nexo` | `VPROC-0023::STEP-IDENTIFY_LOCATION_AND_CONTENT` | `PRIMARY_OPERATIONAL` | `OPERATIONAL_LOOKUP` | La identificación y consulta inmediata de la ubicación es el trabajo operativo dominante del paso activo. |
| `VSCREEN-0039` | Consulta de existencias                               | `nexo`     | `VPROC-0024::STEP-CONSULT_STOCK_POSITION`                   | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_LOOKUP`     | La pantalla aporta consulta o identificación necesaria para ejecutar, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.           |
| `VSCREEN-0040` | Conteo de inventario                                  | `nexo`     | `VPROC-0026::STEP-CAPTURE_PHYSICAL_COUNT`                   | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_CAPTURE`    | La intención dominante registra hechos, cantidades, tiempos o condiciones de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                      |
| `VSCREEN-0041` | Revisión de conteo y diferencias                      | `nexo`     | `VPROC-0026::STEP-REVIEW_COUNT_VARIANCE`                    | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_CONTROL`    | La intención dominante valida, revisa, reconcilia o decide sobre trabajo activo sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0042` | Caso de ajuste de inventario                          | `nexo`     | `VPROC-0026::STEP-DECIDE_INVENTORY_ADJUSTMENT`              | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_CONTROL`    | La intención dominante valida, revisa, reconcilia o decide sobre trabajo activo sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0043` | Confirmación de entrada a inventario                  | `nexo`     | `VPROC-0024::STEP-CONFIRM_STOCK_ENTRY`                      | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0044` | Retiro y consumo de existencias                       | `nexo`     | `VPROC-0025::STEP-EXECUTE_STOCK_WITHDRAWAL`                 | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0045` | Traslado interno de existencias                       | `nexo`     | `VPROC-0025::STEP-EXECUTE_INTERNAL_TRANSFER`                | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0046` | Solicitud de remisión                                 | `nexo`     | `VPROC-0028::STEP-SUBMIT_REPLENISHMENT_REQUEST`             | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0047` | Preparación de remisión                               | `nexo`     | `VPROC-0028::STEP-PREPARE_REPLENISHMENT`                    | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0048` | Carga y despacho de remisión                          | `nexo`     | `VPROC-0028::STEP-LOAD_AND_DISPATCH_REPLENISHMENT`          | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0049` | Seguimiento de remisión en tránsito                   | `nexo`     | `VPROC-0028::STEP-MONITOR_REPLENISHMENT_TRANSIT`            | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_MONITORING` | La intención dominante sigue un compromiso operativo todavía abierto sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                           |
| `VSCREEN-0050` | Recepción de remisión                                 | `nexo`     | `VPROC-0028::STEP-RECEIVE_REPLENISHMENT`                    | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_CONTROL`    | La intención dominante valida, revisa, reconcilia o decide sobre trabajo activo sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0051` | Vencimiento, cuarentena, daño y merma                 | `nexo`     | `VPROC-0027::STEP-RESOLVE_STOCK_CONDITION`                  | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXCEPTION`  | La intención dominante resuelve una excepción, reversión, rechazo o retorno operativo sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                          |
| `VSCREEN-0052` | LPN, contenedores y reutilizables                     | `nexo`     | `VPROC-0032::STEP-MANAGE_LPN_AND_REUSABLES`                 | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0053` | Activos y custodia                                    | `nexo`     | `VPROC-0029::STEP-MANAGE_ASSET_CUSTODY`                     | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0054` | Etiquetas e impresión logística                       | `nexo`     | `VPROC-0024::STEP-ISSUE_LOGISTICS_LABEL`                    | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0055` | Inicio y cola de producción                           | `fogo`     | `VPROC-0033::STEP-TRIAGE_PRODUCTION_QUEUE`                  | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_QUEUE`      | La pantalla prioriza o admite trabajo operativo pendiente, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.                      |
| `VSCREEN-0056` | Planeación de producción                              | `fogo`     | `VPROC-0033::STEP-PLAN_PRODUCTION`                          | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_PLANNING`   | La pantalla prepara capacidad o secuencia de ejecución próxima, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.                 |
| `VSCREEN-0057` | Preparación e inicio de lote                          | `fogo`     | `VPROC-0034::STEP-PREPARE_AND_START_BATCH`                  | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0058` | Ejecución de lote                                     | `fogo`     | `VPROC-0034::STEP-EXECUTE_BATCH`                            | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0059` | Registro parcial de producción                        | `fogo`     | `VPROC-0034::STEP-CAPTURE_BATCH_PROGRESS`                   | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_CAPTURE`    | La intención dominante registra hechos, cantidades, tiempos o condiciones de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                      |
| `VSCREEN-0060` | Finalización y cierre de lote                         | `fogo`     | `VPROC-0037::STEP-CLOSE_BATCH`                              | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_CLOSURE`    | La intención dominante cierra una sesión, lote o ciclo operativo sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                               |
| `VSCREEN-0061` | Receta operativa | `fogo` | `VPROC-0016::STEP-CONSULT_APPLICABLE_RECIPE` | `PRIMARY_OPERATIONAL` | `OPERATIONAL_LOOKUP` | Consultar la receta aplicable es indispensable para ejecutar correctamente el lote activo y constituye la guía operativa dominante. |
| `VSCREEN-0062` | Catálogo y editor de recetas                          | `fogo`     | `VPROC-0016::STEP-AUTHOR_RECIPE`                            | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0063` | Revisión, aprobación y publicación de receta          | `fogo`     | `VPROC-0016::STEP-APPROVE_AND_PUBLISH_RECIPE`               | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno o auditoría del dominio productivo; no corresponde a ejecución operativa dominante en esta pantalla.                                                                                                                                      |
| `VSCREEN-0064` | Prueba de receta y rendimiento                        | `fogo`     | `VPROC-0016::STEP-TEST_RECIPE_AND_YIELD`                    | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_CONTROL`    | La intención dominante valida, revisa, reconcilia o decide sobre trabajo activo sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0065` | Control de calidad y liberación                       | `fogo`     | `VPROC-0035::STEP-DECIDE_QUALITY_RELEASE`                   | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_CONTROL`    | La intención dominante valida, revisa, reconcilia o decide sobre trabajo activo sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0066` | Empaque, etiquetado y almacenamiento de terminado     | `fogo`     | `VPROC-0036::STEP-PACK_AND_TRANSFER_FINISHED_GOOD`          | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0067` | Reproceso, aprovechamiento, merma y cierre productivo | `fogo`     | `VPROC-0037::STEP-RESOLVE_PRODUCTION_DISPOSITION`           | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXCEPTION`  | La intención dominante resuelve una excepción, reversión, rechazo o retorno operativo sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                          |
| `VSCREEN-0068` | Bandeja de necesidades de compra                      | `origo`    | `VPROC-0019::STEP-TRIAGE_PURCHASE_NEEDS`                    | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_QUEUE`      | La pantalla prioriza o admite trabajo operativo pendiente, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.                      |
| `VSCREEN-0069` | Solicitud de compra                                   | `origo`    | `VPROC-0019::STEP-SUBMIT_PURCHASE_REQUEST`                  | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Trabajo administrativo, de gobierno o decisión de backoffice; no tiene ejecución operativa interna dominante.                                                                                                                                      |
| `VSCREEN-0070` | Catálogo de proveedores                               | `origo`    | `VPROC-0020::STEP-CONSULT_SUPPLIER_CATALOG`                 | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Trabajo administrativo, de gobierno o decisión de backoffice; no tiene ejecución operativa interna dominante.                                                                                                                                      |
| `VSCREEN-0071` | Alta y expediente de proveedor                        | `origo`    | `VPROC-0020::STEP-ONBOARD_SUPPLIER`                         | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0072` | Comparación de cotizaciones                           | `origo`    | `VPROC-0020::STEP-COMPARE_QUOTES`                           | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Trabajo administrativo, de gobierno o decisión de backoffice; no tiene ejecución operativa interna dominante.                                                                                                                                      |
| `VSCREEN-0073` | Editor de orden de compra                             | `origo`    | `VPROC-0021::STEP-PREPARE_PURCHASE_ORDER`                   | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0074` | Bandeja de aprobaciones de compra                     | `origo`    | `VPROC-0021::STEP-APPROVE_PURCHASE`                         | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Trabajo administrativo, de gobierno o decisión de backoffice; no tiene ejecución operativa interna dominante.                                                                                                                                      |
| `VSCREEN-0075` | Detalle y seguimiento de orden                        | `origo`    | `VPROC-0021::STEP-MONITOR_PURCHASE_ORDER`                   | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_MONITORING` | La pantalla sigue un compromiso operativo todavía abierto, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.                      |
| `VSCREEN-0076` | Cola de recepciones                                   | `origo`    | `VPROC-0022::STEP-TRIAGE_RECEIPT_QUEUE`                     | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_QUEUE`      | La pantalla prioriza o admite trabajo operativo pendiente, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.                      |
| `VSCREEN-0077` | Recepción total o parcial                             | `origo`    | `VPROC-0022::STEP-RECEIVE_PURCHASE`                         | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0078` | Resolución de diferencias de recepción                | `origo`    | `VPROC-0022::STEP-RESOLVE_RECEIPT_VARIANCE`                 | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXCEPTION`  | La intención dominante resuelve una excepción, reversión, rechazo o retorno operativo sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                          |
| `VSCREEN-0079` | Historial y auditoría de abastecimiento               | `origo`    | `VPROC-0022::STEP-AUDIT_PROCUREMENT_CYCLE`                  | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Superficie histórica o de auditoría; no opera el caso vivo y se revisará en PROC-SCREEN-009.                                                                                                                                                       |
| `VSCREEN-0080` | Inicio POS | `pulso` | `VPROC-0039::STEP-ENTER_POS_WORKSPACE` | `PRIMARY_OPERATIONAL` | `OPERATIONAL_ENTRY` | Es la entrada inmediata al trabajo vivo de venta, salón, mostrador o caja; no es un tablero supervisor por defecto. |
| `VSCREEN-0081` | Creación de venta o pedido                            | `pulso`    | `VPROC-0039::STEP-CREATE_SALE_OR_ORDER`                     | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0082` | Mapa de salón y mesas                                 | `pulso`    | `VPROC-0038::STEP-MANAGE_TABLE_SERVICE`                     | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0083` | Detalle y modificación de pedido                      | `pulso`    | `VPROC-0038::STEP-MODIFY_ACTIVE_ORDER`                      | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXCEPTION`  | La intención dominante resuelve una excepción, reversión, rechazo o retorno operativo sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                          |
| `VSCREEN-0084` | Cobro y medios de pago                                | `pulso`    | `VPROC-0043::STEP-COLLECT_PAYMENT`                          | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0085` | Identificación de cliente y acumulación               | `pulso`    | `VPROC-0045::STEP-IDENTIFY_CUSTOMER_AND_ACCRUE`             | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0086` | Redención de puntos o beneficios                      | `pulso`    | `VPROC-0045::STEP-REDEEM_LOYALTY_VALUE`                     | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0087` | Bandeja de pedidos de canales externos                | `pulso`    | `VPROC-0040::STEP-ADMIT_EXTERNAL_ORDER`                     | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_CONTROL`    | La intención dominante valida, revisa, reconcilia o decide sobre trabajo activo sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0088` | Seguimiento de preparación y entrega                  | `pulso`    | `VPROC-0039::STEP-MONITOR_ORDER_FULFILLMENT`                | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_MONITORING` | La intención dominante sigue un compromiso operativo todavía abierto sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                           |
| `VSCREEN-0089` | Apertura de caja                                      | `pulso`    | `VPROC-0044::STEP-OPEN_CASH_SESSION`                        | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0090` | Cierre de caja                                        | `pulso`    | `VPROC-0044::STEP-CLOSE_CASH_SESSION`                       | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_CLOSURE`    | La intención dominante cierra una sesión, lote o ciclo operativo sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                               |
| `VSCREEN-0091` | Anulación, devolución y reembolso                     | `pulso`    | `VPROC-0042::STEP-RESOLVE_REVERSAL_OR_REFUND`               | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXCEPTION`  | La intención dominante resuelve una excepción, reversión, rechazo o retorno operativo sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                          |
| `VSCREEN-0092` | Oferta, menú, precio comercial y disponibilidad       | `pulso`    | `VPROC-0017::STEP-PUBLISH_COMMERCIAL_OFFER`                 | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0093` | Revisión de ventas, caja y terminales                 | `pulso`    | `VPROC-0044::STEP-REVIEW_SALES_AND_TERMINALS`               | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_CONTROL`    | La pantalla valida, revisa, reconcilia o decide sobre trabajo activo, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.           |
| `VSCREEN-0094` | Inicio financiero y ejecutivo                         | `numera`   | `VPROC-0061::STEP-REVIEW_FINANCIAL_POSITION`                | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0095` | Bandeja de hechos económicos                          | `numera`   | `VPROC-0051::STEP-TRIAGE_ECONOMIC_FACTS`                    | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0096` | Registro de gasto y soporte                           | `numera`   | `VPROC-0051::STEP-CAPTURE_EXPENSE_AND_EVIDENCE`             | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0097` | Bandeja de aprobaciones financieras                   | `numera`   | `VPROC-0052::STEP-APPROVE_FINANCIAL_DECISION`               | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0098` | Cuentas por pagar y obligaciones                      | `numera`   | `VPROC-0052::STEP-MANAGE_PAYABLE_OBLIGATION`                | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0099` | Cuentas por cobrar y cartera                          | `numera`   | `VPROC-0053::STEP-MANAGE_RECEIVABLE`                        | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0100` | Caja, bancos y movimientos financieros                | `numera`   | `VPROC-0052::STEP-EXECUTE_TREASURY_MOVEMENT`                | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0101` | Conciliación de ventas y pagos                        | `numera`   | `VPROC-0051::STEP-RECONCILE_SALES_AND_PAYMENTS`             | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0102` | Conciliación de compras y recepciones                 | `numera`   | `VPROC-0051::STEP-RECONCILE_PURCHASES_AND_RECEIPTS`         | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0103` | Conciliación de inventario, producción y variaciones  | `numera`   | `VPROC-0054::STEP-RECONCILE_OPERATING_VARIANCES`            | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0104` | Costos, rentabilidad y escenarios                     | `numera`   | `VPROC-0054::STEP-ANALYZE_COST_AND_PROFITABILITY`           | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0105` | Cierre, reapertura y corrección de periodo            | `numera`   | `VPROC-0054::STEP-CLOSE_OR_REOPEN_PERIOD`                   | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0106` | Reportes y exportaciones financieras                  | `numera`   | `VPROC-0061::STEP-PUBLISH_FINANCIAL_REPORT`                 | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0107` | Inicio del cliente y resumen de beneficios            | `pass`     | `VPROC-0045::STEP-ENTER_LOYALTY_HOME`                       | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0108` | QR personal de identificación                         | `pass`     | `VPROC-0045::STEP-PRESENT_CUSTOMER_ID`                      | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0109` | Catálogo de beneficios y recompensas                  | `pass`     | `VPROC-0045::STEP-CONSULT_REWARDS_CATALOG`                  | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0110` | Ticket o QR de redención                              | `pass`     | `VPROC-0045::STEP-CREATE_REDEMPTION_INTENT`                 | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0111` | Historial de puntos y redenciones                     | `pass`     | `VPROC-0045::STEP-AUDIT_PERSONAL_LOYALTY_LEDGER`            | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0112` | Perfil, privacidad y consentimientos                  | `pass`     | `VPROC-0045::STEP-MAINTAIN_CUSTOMER_PROFILE_AND_CONSENT`    | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0113` | Registro y seguimiento de decisiones empresariales    | `viso`     | `VPROC-0001::STEP-RECORD_AND_TRACK_DECISION`                | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Trabajo administrativo, de gobierno o decisión de backoffice; no tiene ejecución operativa interna dominante.                                                                                                                                      |
| `VSCREEN-0114` | Solicitudes y certificaciones de acceso               | `viso`     | `VPROC-0059::STEP-REVIEW_AND_CERTIFY_ACCESS`                | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Trabajo administrativo, de gobierno o decisión de backoffice; no tiene ejecución operativa interna dominante.                                                                                                                                      |
| `VSCREEN-0115` | Gobierno de documentos y evidencia                    | `viso`     | `VPROC-0060::STEP-GOVERN_DOCUMENT_EVIDENCE`                 | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0116` | Registro de riesgos empresariales                     | `viso`     | `VPROC-0063::STEP-ASSESS_ENTERPRISE_RISK`                   | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Trabajo administrativo, de gobierno o decisión de backoffice; no tiene ejecución operativa interna dominante.                                                                                                                                      |
| `VSCREEN-0117` | Requerimientos de asesores y autoridades              | `viso`     | `VPROC-0064::STEP-MANAGE_EXTERNAL_REQUIREMENT`              | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Trabajo administrativo, de gobierno o decisión de backoffice; no tiene ejecución operativa interna dominante.                                                                                                                                      |
| `VSCREEN-0118` | Gestión de desempeño y desarrollo                     | `viso`     | `VPROC-0065::STEP-REVIEW_PERFORMANCE_AND_DEVELOPMENT`       | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Trabajo administrativo, de gobierno o decisión de backoffice; no tiene ejecución operativa interna dominante.                                                                                                                                      |
| `VSCREEN-0119` | Asignación y control de elementos de protección       | `viso`     | `VPROC-0066::STEP-ASSIGN_PROTECTIVE_EQUIPMENT`              | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_CONTROL`    | La pantalla valida, revisa, reconcilia o decide sobre trabajo activo, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.           |
| `VSCREEN-0120` | Mesa de servicio tecnológico                          | `viso`     | `VPROC-0058::STEP-RESOLVE_TECH_SERVICE_CASE`                | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_RECOVERY`   | La pantalla restablece o contiene la continuidad de la operación, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.               |
| `VSCREEN-0121` | Continuidad, contingencia y recuperación              | `viso`     | `VPROC-0062::STEP-ACTIVATE_AND_RECOVER_CONTINUITY`          | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_RECOVERY`   | La pantalla restablece o contiene la continuidad de la operación, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.               |
| `VSCREEN-0122` | Privacidad, cumplimiento y conservación               | `viso`     | `VPROC-0060::STEP-GOVERN_PRIVACY_AND_RETENTION`             | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0123` | Gestión de comunicaciones internas                    | `viso`     | `VPROC-0004::STEP-PUBLISH_INTERNAL_COMMUNICATION`           | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0124` | Mis comunicados laborales                             | `anima`    | `VPROC-0004::STEP-CONSULT_AND_ACKNOWLEDGE_COMMUNICATION`    | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal personal del trabajador sin ejecución operativa interna dominante. Su clasificación primaria queda reservada a PROC-SCREEN-010.                                                                                                              |
| `VSCREEN-0125` | Mi carnet laboral                                     | `anima`    | `VPROC-0006::STEP-PRESENT_EMPLOYEE_CREDENTIAL`              | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal personal del trabajador sin ejecución operativa interna dominante. Su clasificación primaria queda reservada a PROC-SCREEN-010.                                                                                                              |
| `VSCREEN-0126` | Mis documentos laborales                              | `anima`    | `VPROC-0060::STEP-CONSULT_OR_SUBMIT_EMPLOYMENT_DOCUMENT`    | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal personal del trabajador sin ejecución operativa interna dominante. Su clasificación primaria queda reservada a PROC-SCREEN-010.                                                                                                              |
| `VSCREEN-0127` | Mi capacitación                                       | `anima`    | `VPROC-0065::STEP-COMPLETE_ASSIGNED_TRAINING`               | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal personal del trabajador sin ejecución operativa interna dominante. Su clasificación primaria queda reservada a PROC-SCREEN-010.                                                                                                              |
| `VSCREEN-0128` | Mis objetivos y retroalimentación                     | `anima`    | `VPROC-0065::STEP-REVIEW_PERSONAL_OBJECTIVES`               | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal personal del trabajador sin ejecución operativa interna dominante. Su clasificación primaria queda reservada a PROC-SCREEN-010.                                                                                                              |
| `VSCREEN-0129` | Mis solicitudes de soporte                            | `anima`    | `VPROC-0058::STEP-SUBMIT_AND_TRACK_SUPPORT_REQUEST`         | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_ENTRY`      | La pantalla habilita la entrada inmediata a trabajo operativo, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.                  |
| `VSCREEN-0130` | Mis reportes de seguridad y salud                     | `anima`    | `VPROC-0013::STEP-REPORT_SST_EVENT`                         | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_CAPTURE`    | La pantalla registra hechos, cantidades, tiempos o condiciones de la operación, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011. |
| `VSCREEN-0131` | Mis elementos de protección                           | `anima`    | `VPROC-0066::STEP-ACKNOWLEDGE_PROTECTIVE_EQUIPMENT`         | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_CAPTURE`    | La pantalla registra hechos, cantidades, tiempos o condiciones de la operación, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011. |
| `VSCREEN-0132` | Reservas de inventario                                | `nexo`     | `VPROC-0028::STEP-RESERVE_STOCK`                            | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0133` | Planes y órdenes de mantenimiento de activos          | `nexo`     | `VPROC-0030::STEP-PLAN_AND_EXECUTE_ASSET_MAINTENANCE`       | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_PLANNING`   | La intención dominante prepara capacidad o secuencia de ejecución próxima sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                      |
| `VSCREEN-0134` | Garantías, seguros y reclamaciones de activos         | `nexo`     | `VPROC-0030::STEP-MANAGE_ASSET_CLAIM`                       | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Maestro, configuración o gestión no inmediata del dominio logístico; no corresponde a ejecución operativa dominante.                                                                                                                               |
| `VSCREEN-0135` | Instancias y operación de kits                                      | `nexo`     | `VPROC-0067::STEP-ASSEMBLE_AND_CONTROL_KIT`                 | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0136` | Flota y vehículos                                     | `nexo`     | `VPROC-0031::STEP-MANAGE_FLEET_ASSET`                       | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_LOOKUP`     | La pantalla aporta consulta o identificación necesaria para ejecutar, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.           |
| `VSCREEN-0137` | Kilometraje y combustible                             | `nexo`     | `VPROC-0031::STEP-CAPTURE_MILEAGE_AND_FUEL`                 | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_CAPTURE`    | La intención dominante registra hechos, cantidades, tiempos o condiciones de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                      |
| `VSCREEN-0138` | Planeación de rutas y despachos                       | `nexo`     | `VPROC-0048::STEP-PLAN_ROUTE_AND_DISPATCH`                  | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_PLANNING`   | La intención dominante prepara capacidad o secuencia de ejecución próxima sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                      |
| `VSCREEN-0139` | Ejecución de ruta y prueba de entrega                 | `nexo`     | `VPROC-0049::STEP-EXECUTE_ROUTE_AND_PROVE_DELIVERY`         | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0140` | Novedades, rechazos y retornos logísticos             | `nexo`     | `VPROC-0049::STEP-RESOLVE_LOGISTICS_EXCEPTION`              | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXCEPTION`  | La intención dominante resuelve una excepción, reversión, rechazo o retorno operativo sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                          |
| `VSCREEN-0141` | Instalaciones, servicios y mantenimiento locativo     | `nexo`     | `VPROC-0055::STEP-MANAGE_FACILITY_SERVICE`                  | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0142` | Configuración de políticas y rutas logísticas         | `nexo`     | `VPROC-0048::STEP-CONFIGURE_LOGISTICS_POLICY`               | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0143` | Diseñador de etiquetas logísticas                     | `nexo`     | `VPROC-0015::STEP-AUTHOR_LOGISTICS_LABEL_TEMPLATE`          | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0144` | Cola y trabajos de impresión logística           | `nexo`     | `VPROC-0024::STEP-OPERATE_PRINT_QUEUE`        | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0145` | Contratos, precios y condiciones de proveedor         | `origo`    | `VPROC-0020::STEP-GOVERN_SUPPLIER_TERMS`                    | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0146` | Desempeño y reclamaciones de proveedor                | `origo`    | `VPROC-0020::STEP-REVIEW_SUPPLIER_PERFORMANCE`              | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Trabajo administrativo, de gobierno o decisión de backoffice; no tiene ejecución operativa interna dominante.                                                                                                                                      |
| `VSCREEN-0147` | Oportunidades y cotizaciones de catering o B2B        | `pulso`    | `VPROC-0041::STEP-QUALIFY_B2B_OPPORTUNITY`                  | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Configuración, análisis o desarrollo comercial fuera de la ejecución operativa inmediata.                                                                                                                                                          |
| `VSCREEN-0148` | Ejecución de catering o venta B2B                     | `pulso`    | `VPROC-0041::STEP-EXECUTE_B2B_COMMITMENT`                   | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0149` | Operación de reservas y eventos                       | `pulso`    | `VPROC-0047::STEP-MANAGE_RESERVATION_OR_EVENT`              | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0150` | Casos de reclamo y compensación                       | `pulso`    | `VPROC-0046::STEP-RESOLVE_CUSTOMER_CLAIM`                   | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXCEPTION`  | La intención dominante resuelve una excepción, reversión, rechazo o retorno operativo sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                          |
| `VSCREEN-0151` | Coordinación de entrega mediante tercero              | `pulso`    | `VPROC-0050::STEP-COORDINATE_THIRD_PARTY_DELIVERY`          | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_MONITORING` | La intención dominante sigue un compromiso operativo todavía abierto sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                           |
| `VSCREEN-0152` | Análisis de satisfacción y servicio                   | `pulso`    | `VPROC-0068::STEP-ANALYZE_SERVICE_SATISFACTION`             | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Análisis o simulación sin ejecución material inmediata; su carril primario se resolverá en las clasificaciones posteriores.                                                                                                                        |
| `VSCREEN-0153` | Paquete laboral para pagos y beneficios               | `numera`   | `VPROC-0010::STEP-PREPARE_LABOR_PAYMENT_PACKAGE`            | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0154` | Facturas y documentos fiscales                        | `numera`   | `VPROC-0051::STEP-MANAGE_FISCAL_DOCUMENT`                   | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0155` | Tesorería y programación de pagos                     | `numera`   | `VPROC-0052::STEP-PLAN_AND_EXECUTE_PAYMENTS`                | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0156` | Presupuestos, escenarios y forecast                   | `numera`   | `VPROC-0069::STEP-PLAN_BUDGET_AND_FORECAST`                 | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0157` | Impuestos y obligaciones de cumplimiento              | `numera`   | `VPROC-0052::STEP-MANAGE_TAX_OBLIGATION`                    | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0158` | Distribución y asignación de costos                   | `numera`   | `VPROC-0054::STEP-ALLOCATE_COSTS`                           | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0159` | Indicadores, análisis y planes de mejora              | `numera`   | `VPROC-0061::STEP-ANALYZE_AND_PLAN_IMPROVEMENT`             | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0160` | Inicio y selección del portal de compras              | `pass`     | `VPROC-0039::STEP-ENTER_CUSTOMER_COMMERCE`                  | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0161` | Menú y catálogo comercial del cliente                 | `pass`     | `VPROC-0017::STEP-BROWSE_COMMERCIAL_OFFER`                  | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0162` | Carrito y configuración del pedido                    | `pass`     | `VPROC-0039::STEP-CONFIGURE_CART`                           | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0163` | Dirección, modalidad y programación de entrega        | `pass`     | `VPROC-0050::STEP-SELECT_FULFILLMENT`                       | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0164` | Revisión, checkout e inicio de pago                   | `pass`     | `VPROC-0043::STEP-REVIEW_AND_START_PAYMENT`                 | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0165` | Confirmación de pedido y retorno de pago              | `pass`     | `VPROC-0043::STEP-PRESENT_ORDER_RECEIPT`                    | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0166` | Mis pedidos y detalle                                 | `pass`     | `VPROC-0039::STEP-CONSULT_PERSONAL_ORDERS`                  | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0167` | Seguimiento de preparación y entrega del cliente      | `pass`     | `VPROC-0050::STEP-TRACK_PERSONAL_FULFILLMENT`               | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0168` | Chat y comunicación asociada al pedido                | `pass`     | `VPROC-0047::STEP-COMMUNICATE_ABOUT_ORDER`                  | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0169` | Mis reclamos y casos de servicio                      | `pass`     | `VPROC-0046::STEP-SUBMIT_AND_TRACK_CLAIM`                   | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0170` | Mis reservas y eventos                                | `pass`     | `VPROC-0047::STEP-MANAGE_PERSONAL_RESERVATION`              | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0171` | Calificación y satisfacción                           | `pass`     | `VPROC-0068::STEP-SUBMIT_SATISFACTION_RATING`               | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0172` | Comunicaciones y notificaciones del cliente           | `pass`     | `VPROC-0047::STEP-CONSULT_CUSTOMER_COMMUNICATION`           | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0173` | Trazabilidad e investigación de lote                  | `fogo`     | `VPROC-0035::STEP-INVESTIGATE_BATCH_TRACEABILITY`           | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Superficie histórica o de auditoría; no opera el caso vivo y se revisará en PROC-SCREEN-009.                                                                                                                                                       |
| `VSCREEN-0174` | Controles operativos de inocuidad                     | `fogo`     | `VPROC-0014::STEP-EXECUTE_FOOD_SAFETY_CONTROL`              | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_CONTROL`    | La intención dominante valida, revisa, reconcilia o decide sobre trabajo activo sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0175` | Seguridad de cuenta y sesiones                        | `shell`    | `VPROC-0059::STEP-MANAGE_ACCOUNT_SECURITY`                  | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Acceso, cuenta o navegación transversal; no constituye por sí misma una superficie operativa.                                                                                                                                                      |
| `VSCREEN-0176` | Definición de kits y conjuntos | `nexo` | `VPROC-0067::STEP-MAINTAIN_KIT_DEFINITION` | `OUTSIDE_OPERATIONAL_CLASS` | `NONE` | Mantiene una definición reutilizable; no opera una instancia de kit. |
| `VSCREEN-0177` | Configuración de impresoras logísticas | `nexo` | `VPROC-0024::STEP-CONFIGURE_LOGISTICS_PRINTERS` | `OUTSIDE_OPERATIONAL_CLASS` | `NONE` | Mantiene recursos y políticas reutilizables; no opera un trabajo de impresión. |

---

#### 11. Resumen por aplicación

| Aplicación | Primaria operativa | Secundaria operativa | Fuera de clase operativa |   Total |
| ---------- | -----------------: | -------------------: | -----------------------: | ------: |
| `shell`    |                  0 |                    4 |                        3 |       7 |
| `viso`     |                  0 |                   10 |                       21 |      31 |
| `anima`    |                  1 |                    6 |                        7 |      14 |
| `nexo`     |                 25 |                    4 |                        8 |      37 |
| `fogo`     |                 10 |                    2 |                        3 |      15 |
| `origo`    |                  2 |                    3 |                        9 |      14 |
| `pulso`    |                 16 |                    1 |                        3 |      20 |
| `numera`   |                  0 |                    0 |                       20 |      20 |
| `pass`     |                  0 |                    0 |                       19 |      19 |
| **Total**  |             **54** |               **30** |                   **93** | **177** |

Las aplicaciones no determinan la clasificación. La tabla solo comprueba que la matriz física y sus conteos coincidan.

---

#### 12. Resumen por patrón

| Patrón                             | Pantallas |
| ---------------------------------- | --------: |
| `OPERATIONAL_ENTRY`                |         4 |
| `OPERATIONAL_QUEUE`                |         5 |
| `OPERATIONAL_LOOKUP`               |         6 |
| `OPERATIONAL_PLANNING`             |         4 |
| `OPERATIONAL_CAPTURE`              |         7 |
| `OPERATIONAL_EXECUTION`            |        26 |
| `OPERATIONAL_CONTROL`              |        13 |
| `OPERATIONAL_MONITORING`           |         6 |
| `OPERATIONAL_EXCEPTION`            |         7 |
| `OPERATIONAL_CLOSURE`              |         2 |
| `OPERATIONAL_RECOVERY`             |         4 |
| **Total con relevancia operativa** |    **84** |

Las 91 pantallas con `NONE` continúan hacia las tareas posteriores sin recibir una categoría inventada.

---

#### 13. Fronteras especiales

1. **SHELL:** contexto, dispositivo compartido, notificaciones y diagnóstico pueden ser soporte operativo, pero acceso, cuenta y navegación no son operación por sí solos.
2. **VISO:** programación, revisión, incidentes, cumplimiento, EPP, soporte y continuidad pueden tener relevancia secundaria; la aplicación no se convierte por eso en superficie operativa universal.
3. **ANIMA:** el registro de asistencia es operación primaria; consultas y solicitudes personales pueden apoyar la operación, pero la clasificación personal se resolverá en `PROC-SCREEN-010`.
4. **NEXO:** movimientos, conteos, remisiones, LPN, activos, rutas, mantenimiento, instalaciones e impresión operativa pueden ser primarios; maestros y plantillas no lo son automáticamente.
5. **FOGO:** lote, avance, calidad, empaque, disposición e inocuidad son operativos; edición y publicación de recetas o auditoría de trazabilidad conservan otra intención dominante.
6. **ORIGO:** recepción y resolución de diferencias son operativas; solicitud, comparación, aprobación y gobierno de proveedores son backoffice.
7. **PULSO:** venta, servicio de mesa, pago, caja, pedidos externos, devoluciones, catering, reservas, reclamos y entrega son operativos; configuración comercial y análisis no.
8. **NUMERA:** permanece fuera de la clase operativa en este corte; sus pantallas son backoffice financiero y se evaluarán en `PROC-SCREEN-006`.
9. **PASS:** permanece fuera de la operación interna; sus superficies se clasificarán como cliente en `PROC-SCREEN-011`.
10. **AURA:** continúa sin pantallas y sin clasificación.

---

#### 14. Relación con las clasificaciones posteriores

Las clasificaciones son acumulativas, pero solo una podrá quedar como clase primaria.

```text
PRIMARY_OPERATIONAL
→ operational es la clase primaria

SECONDARY_OPERATIONAL
→ operational queda como clase secundaria
→ la clase primaria se decide en PROC-SCREEN-006 a PROC-SCREEN-011

OUTSIDE_OPERATIONAL_CLASS
→ no agrega operational
→ la clase primaria se decide en PROC-SCREEN-006 a PROC-SCREEN-011
```

`PROC-SCREEN-011`, como última tarea de este subtramo, deberá ejecutar la puerta de cierre que confirme:

- exactamente una clase primaria por pantalla;
- cero o más clases secundarias compatibles;
- ninguna pantalla sin clasificación;
- ninguna pareja de clases primarias competidoras;
- fundamentos y versiones conservados.

---

#### 15. Cambio y versionado

Cambiar `operational_fit` o `operational_pattern` exige:

1. propuesta trazable;
2. comparación de intención, objeto, paso, urgencia, efecto y usuario;
3. explicación de por qué el trabajo dejó de ser o pasó a ser operativo;
4. nueva versión de clasificación;
5. conservación del valor anterior;
6. revisión coordinada de actores, dispositivos, acciones, estados, permisos, métricas y pruebas posteriores;
7. nueva identidad de pantalla cuando el cambio destruya su intención principal.

Un cambio de aplicación, ruta o componente no cambia automáticamente la clasificación.

---

#### 16. Validaciones obligatorias

La compilación deberá fallar cuando:

1. falte una de las 177 pantallas;
2. una pantalla aparezca más de una vez;
3. falte `operational_fit`;
4. el valor no pertenezca al vocabulario;
5. una pantalla primaria o secundaria use `NONE`;
6. una pantalla fuera de clase use un patrón operativo;
7. falte fundamento;
8. proceso o paso no coincidan con las tareas anteriores;
9. los conteos no sean 54, 30 y 93;
10. la distribución por aplicación no coincida;
11. los patrones no sumen 84;
12. PASS o NUMERA reciban `PRIMARY_OPERATIONAL` sin una nueva decisión aprobada;
13. una pantalla de configuración o auditoría sea primaria solo por pertenecer a una aplicación operativa;
14. la clasificación sea utilizada como permiso, rol, contexto o acceso;
15. un cambio elimine el historial anterior;
16. AURA reciba una clasificación sin pantalla admitida;
17. la puerta final deje más de una clase primaria o ninguna clase primaria.

---

#### 17. Seguridad y autorización

La clasificación operativa no concede:

- acceso a la pantalla;
- lectura de información;
- ejecución de acciones;
- uso de dispositivo compartido;
- turno o check-in;
- sede o área activa;
- autoridad para aprobar;
- capacidad de corregir o cerrar;
- acceso a procesos relacionados;
- confianza en handoffs.

Cada aplicación deberá resolver identidad, actor, permiso, contexto, recurso, territorio, estado, versión y segregación.

---

#### 18. SCREEN-OPERATIONAL-CARRYOVER-REGISTER-001

| Pendiente                                                              | Propietario exacto                                        |
| ---------------------------------------------------------------------- | --------------------------------------------------------- |
| clasificar pantallas administrativas                                   | `PROC-SCREEN-006`                                         |
| clasificar pantallas de supervisión                                    | `PROC-SCREEN-007`                                         |
| clasificar pantallas de configuración                                  | `PROC-SCREEN-008`                                         |
| clasificar pantallas de auditoría                                      | `PROC-SCREEN-009`                                         |
| clasificar pantallas personales                                        | `PROC-SCREEN-010`                                         |
| clasificar pantallas de cliente y cerrar la puerta de clases primarias | `PROC-SCREEN-011`                                         |
| definir actores objetivo                                               | `PROC-SCREEN-012`                                         |
| definir dispositivos soportados                                        | `PROC-SCREEN-013`                                         |
| definir acciones                                                       | `PROC-SCREEN-014` y `PROC-SCREEN-015`                     |
| definir entradas, salidas y estados de interfaz                        | `PROC-SCREEN-016` a `PROC-SCREEN-021`                     |
| definir sensibilidad y permisos                                        | `PROC-SCREEN-022` a `PROC-SCREEN-024`                     |
| vincular operaciones técnicas                                          | `PROC-SCREEN-025`                                         |
| mapear rutas y legado                                                  | `PROC-SCREEN-026`                                         |
| definir métricas y aceptación operativa                                | `PROC-SCREEN-027` y `PROC-SCREEN-028`                     |
| implementar tipos y validadores                                        | paquetes E5 y CI documental                               |
| validar con usuarios y estaciones reales                               | `UX-QA-*` y pilotos E5                                    |
| admitir AURA                                                           | tareas canónicas de AURA y nueva admisión `PROC-SCREEN-*` |

No queda pendiente narrativo sin tarea o puerta de resolución.

---

#### 19. Requisitos de prueba derivados

**Resultado:** GENERA 30 REQUISITOS DE PRUEBA.

Se incorporan `TREQ-UX-609` a `TREQ-UX-638` al Registro Canónico completo. Permanecen en estado `IDENTIFICADO`; automatización, implementación y evidencia corresponden a CI documental, paquetes E5, BLOQUE U, staging y pilotos.

---

#### 20. Criterios de aceptación

- [x] Se clasifican las 177 pantallas sin renumerarlas.
- [x] Cada pantalla recibe exactamente un `operational_fit`.
- [x] Se distinguen 54 primarias, 30 secundarias y 93 fuera de clase.
- [x] Las 84 pantallas con relevancia operativa utilizan once patrones cerrados.
- [x] La clasificación se deriva de proceso, paso, efecto y urgencia, no de aplicación o repositorio.
- [x] Se preservan las fronteras de SHELL, VISO, ANIMA, NEXO, FOGO, ORIGO, PULSO, NUMERA y PASS.
- [x] AURA conserva cero pantallas.
- [x] La clasificación no concede permisos ni contexto.
- [x] Se define la convivencia entre clase primaria y clases secundarias.
- [x] Se asigna a `PROC-SCREEN-011` la puerta final de completitud.
- [x] Se definen cambio, versionado, historial y validaciones.
- [x] Se generan `TREQ-UX-609` a `TREQ-UX-638`.
- [x] No se anticipan actores, dispositivos, acciones, estados, permisos, rutas o APIs.
- [x] No se implementa código ni se avanza a `PROC-SCREEN-006`.

---

#### 21. Resultado y continuidad

```text
PROC-SCREEN-004 APROBADA
PROC-SCREEN-005 APROBADA
PROC-SCREEN-006 NO INICIADA
```

La continuidad documental pasa exclusivamente a:

```text
PROC-SCREEN-006 — Clasificar pantalla administrativa
```


### ✅ PROC-SCREEN-006 — Clasificar pantalla administrativa

**Estado:** APROBADA

**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal

**Marcador exacto que reemplaza:** `### [ ] PROC-SCREEN-006 — Clasificar pantalla administrativa`

**Tarea anterior:** `PROC-SCREEN-005 — Clasificar pantalla operativa` — APROBADA

**Siguiente tarea reservada:** `PROC-SCREEN-007 — Clasificar pantalla de supervisión` — NO INICIADA

**Artefactos lógicos contenidos en esta tarea:**

- `SCREEN-ADMINISTRATIVE-CLASSIFICATION-CONTRACT-001`;
- `SCREEN-ADMINISTRATIVE-PATTERN-VOCABULARY-001`;
- `SCREEN-ADMINISTRATIVE-CLASSIFICATION-REGISTER-001`;
- `SCREEN-ADMINISTRATIVE-COVERAGE-MATRIX-001`;
- `SCREEN-ADMINISTRATIVE-CLASSIFICATION-CHANGE-POLICY-001`;
- `SCREEN-ADMINISTRATIVE-CLASSIFICATION-VALIDATION-GATE-001`;
- `SCREEN-ADMINISTRATIVE-CARRYOVER-REGISTER-001`.

**Resultado cuantitativo:** **177 pantallas clasificadas**, de las cuales **53** quedan como `PRIMARY_ADMINISTRATIVE`, **51** como `SECONDARY_ADMINISTRATIVE` y **73** como `OUTSIDE_ADMINISTRATIVE_CLASS`; se utilizan **12 patrones administrativos**, existen **104 pantallas con relevancia administrativa** y ninguna pantalla recibe simultáneamente clase primaria operativa y administrativa.

**Naturaleza:** clasificación documental del grado de relación de cada pantalla con el trabajo administrativo interno, el backoffice y el gobierno empresarial. No define todavía clasificación de supervisión, configuración, auditoría, personal o cliente; tampoco define actores, dispositivos, acciones, estados de interfaz, sensibilidad, permisos, rutas u operaciones técnicas.

**Cambios en código de producto, componentes, rutas, repositorios consumidores, Supabase, tablas, migraciones, RLS, RPC, eventos, analítica o producción:** no autorizados por esta tarea.

---

#### 1. Propósito

Determinar cuáles pantallas constituyen el espacio principal de trabajo administrativo de Vento Group, cuáles aportan soporte administrativo a otra intención dominante y cuáles quedan fuera de esta clase.

```text
PANTALLA
    +
PROCESO Y PASO DOMINANTES
    +
EXPEDIENTE, CASO, RECURSO, OBLIGACION O DECISION
    +
RESPONSABILIDAD DE BACKOFFICE
    =
CLASIFICACION ADMINISTRATIVA TRAZABLE
```

La clasificación responde **qué grado de relación tiene la pantalla con la administración y el gobierno interno**. No concede acceso, no asigna roles, no implica autoridad de aprobación y no convierte toda pantalla no operativa en administrativa.

---

#### 2. Dependencias consumidas

- `PROC-SCREEN-001` y la identidad estable `VSCREEN-*`;
- `PROC-SCREEN-002` y las aplicaciones primarias;
- `PROC-SCREEN-003` y los procesos primarios;
- `PROC-SCREEN-004` y los pasos dominantes;
- `PROC-SCREEN-005` y la clasificación operativa;
- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-010`;
- `UX-BASE-001` a `UX-BASE-015`;
- `UX-ADMIN-001` a `UX-ADMIN-005`;
- los contratos aprobados de autorización, contexto, segregación, ayuda, validación preventiva y vista previa de impacto.

La tarea no utiliza la aplicación, el repositorio ni el rol histórico como sustituto de la intención administrativa.

---

#### 3. Alcance

1. incorporar `administrative_fit` a las 177 pantallas;
2. distinguir trabajo administrativo primario, relevancia administrativa secundaria y ausencia de clase administrativa;
3. definir doce patrones administrativos reutilizables;
4. clasificar cada pantalla mediante objeto, expediente, caso, decisión, responsabilidad y resultado;
5. separar administración de operación, supervisión, configuración, auditoría, autoservicio personal y experiencia de cliente;
6. impedir que una pantalla sea primaria operativa y primaria administrativa a la vez;
7. conservar relevancias secundarias sin diluir la clase primaria;
8. establecer versionado, validaciones y carryovers exactos;
9. dejar preparada la continuidad hacia `PROC-SCREEN-007` a `PROC-SCREEN-011`;
10. mantener una puerta final de exactamente una clase primaria por pantalla.

---

#### 4. Exclusiones

Esta tarea no:

- clasifica formalmente pantallas de supervisión, configuración, auditoría, personales o de cliente;
- convierte dashboards, reportes o historiales en administrativos por defecto;
- considera todo maestro o editor como administración primaria;
- decide actores, roles o segregación;
- define dispositivos, estaciones o periféricos;
- define acciones principales o secundarias;
- diseña condiciones de entrada, salida, vacío, carga, bloqueo o recuperación;
- decide información sensible visible;
- asigna permisos de lectura o acción;
- vincula Server Actions, APIs, RPC, eventos o tablas;
- mapea rutas o componentes legacy;
- activa AURA.

---

#### 5. Definición canónica de pantalla administrativa

Una pantalla tiene relevancia administrativa cuando organiza, conserva, decide o coordina trabajo de backoffice sobre uno o más de estos objetos:

- expedientes y registros;
- casos y solicitudes;
- personas, proveedores, activos o recursos;
- planes, presupuestos y obligaciones;
- aprobaciones, certificaciones y delegaciones;
- políticas, riesgos y cumplimiento;
- conciliaciones y cierres;
- comunicaciones formales y compromisos;
- análisis utilizados para decisión administrativa.

No basta con:

- no ser operativa;
- vivir en VISO, ORIGO o NUMERA;
- mostrar una tabla;
- requerir permiso elevado;
- contener configuración;
- producir un reporte;
- permitir búsqueda o filtros;
- ser utilizada por un gerente.

---

#### 6. Estados de clasificación

| Valor                          | Significado                                                    | Efecto documental                                 |
| ------------------------------ | -------------------------------------------------------------- | ------------------------------------------------- |
| `PRIMARY_ADMINISTRATIVE`       | el trabajo de backoffice es la intención dominante             | reserva `ADMINISTRATIVE` como clase primaria      |
| `SECONDARY_ADMINISTRATIVE`     | existe soporte administrativo, pero otra clase es dominante    | agrega relevancia administrativa secundaria       |
| `OUTSIDE_ADMINISTRATIVE_CLASS` | no existe trabajo administrativo suficiente bajo este contrato | queda disponible para clasificaciones posteriores |

Cada pantalla recibe exactamente uno de estos tres valores.

`SECONDARY_ADMINISTRATIVE` no convierte una pantalla operativa, de supervisión, configuración o auditoría en backoffice principal. Conserva únicamente la responsabilidad administrativa que deberá ser visible en navegación, ayuda, métricas y permisos posteriores.

---

#### 7. Contrato mínimo

| Campo                                   | Obligación                                                           |
| --------------------------------------- | -------------------------------------------------------------------- |
| `screen_id`                             | `VSCREEN-*` canónico                                                 |
| `primary_application_id`                | aplicación aprobada en `PROC-SCREEN-002`                             |
| `primary_process_id`                    | proceso aprobado en `PROC-SCREEN-003`                                |
| `primary_process_step_ref`              | paso aprobado en `PROC-SCREEN-004`                                   |
| `operational_fit`                       | valor aprobado en `PROC-SCREEN-005`                                  |
| `administrative_fit`                    | uno de los tres estados de esta tarea                                |
| `administrative_pattern`                | uno de los doce patrones o `NONE`                                    |
| `administrative_reason`                 | fundamento verificable                                               |
| `administrative_classification_version` | versión semántica                                                    |
| `administrative_classification_status`  | `CANONICAL`, `CHANGE_PROPOSED`, `SUPERSEDED` o `RETIRED_WITH_SCREEN` |
| `administrative_classification_task`    | tarea que aprobó o modificó la decisión                              |

Valores iniciales:

```text
administrative_classification_version: 1.0.0
administrative_classification_status: CANONICAL
administrative_classification_task: PROC-SCREEN-006
decision_record: INITIAL_ADMINISTRATIVE_CLASSIFICATION
```

---

#### 8. SCREEN-ADMINISTRATIVE-PATTERN-VOCABULARY-001

| Patrón                      | Uso                                                             |
| --------------------------- | --------------------------------------------------------------- |
| `ADMIN_QUEUE`               | admite, prioriza o distribuye trabajo administrativo pendiente  |
| `ADMIN_RECORD`              | mantiene expediente, documento o registro canónico              |
| `ADMIN_CASE`                | gestiona un caso desde apertura hasta resolución                |
| `ADMIN_PLANNING`            | planifica recursos, capacidad, obligaciones o trabajo futuro    |
| `ADMIN_REVIEW`              | revisa o evalúa información para decidir                        |
| `ADMIN_APPROVAL`            | aplica aprobación, certificación o autoridad explícita          |
| `ADMIN_COORDINATION`        | coordina participantes, dependencias, compromisos y handoffs    |
| `ADMIN_RECONCILIATION`      | concilia hechos, saldos, obligaciones, periodos o variaciones   |
| `ADMIN_COMPLIANCE`          | gobierna riesgo, política, obligación, evidencia o cumplimiento |
| `ADMIN_RESOURCE_MANAGEMENT` | administra maestros, activos, proveedores, personas o recursos  |
| `ADMIN_COMMUNICATION`       | gobierna comunicación formal, entrega, acuse y seguimiento      |
| `ADMIN_ANALYSIS`            | consolida análisis, escenarios o indicadores para decisión      |
| `NONE`                      | no existe relevancia administrativa bajo esta tarea             |

El patrón no sustituye el proceso, el paso, la acción, el permiso ni la clase primaria final.

---

#### 9. Algoritmo de decisión

Se clasifica `PRIMARY_ADMINISTRATIVE` cuando:

1. existe un expediente, caso, registro, obligación, plan, recurso o decisión administrativa;
2. la pantalla es el espacio propietario para crear, organizar, evaluar, aprobar, coordinar, conciliar o cerrar ese trabajo;
3. el resultado principal es de backoffice y no una mutación física u operativa inmediata;
4. la responsabilidad continúa aunque cambie la ruta o el componente;
5. otra clase especializada no explica mejor la intención dominante.

Se clasifica `SECONDARY_ADMINISTRATIVE` cuando:

1. la pantalla contiene revisión, planificación, conciliación, gobierno, registro o configuración administrativa;
2. su intención primaria es operativa o probablemente corresponde a supervisión, configuración o auditoría;
3. la administración actúa como soporte y no como espacio propietario;
4. eliminar esa capa degrada control, trazabilidad o coordinación, pero no elimina el trabajo principal.

Se clasifica `OUTSIDE_ADMINISTRATIVE_CLASS` cuando predomina:

- ejecución operativa sin carga administrativa material;
- autoservicio personal;
- experiencia de cliente;
- acceso o cuenta transversal;
- consulta simple sin expediente, caso ni decisión;
- una clase especializada sin soporte administrativo relevante.

---

#### 10. SCREEN-ADMINISTRATIVE-CLASSIFICATION-REGISTER-001

| Screen ID      | Pantalla                                              | Aplicación | Paso dominante                                              | Clasificación operativa     | Clasificación administrativa   | Patrón                      | Fundamento                                                                                                                                                                                                                                                     |
| -------------- | ----------------------------------------------------- | ---------- | ----------------------------------------------------------- | --------------------------- | ------------------------------ | --------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VSCREEN-0001` | Hub Vento OS                                          | `shell`    | `VPROC-0059::STEP-ENTER_ECOSYSTEM`                          | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Superficie transversal de acceso, cuenta o navegación sin expediente, planificación ni decisión administrativa empresarial dominante.                                                                                                                          |
| `VSCREEN-0002` | Inicio de sesión y recuperación                       | `shell`    | `VPROC-0059::STEP-AUTHENTICATE_OR_RECOVER`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Superficie transversal de acceso, cuenta o navegación sin expediente, planificación ni decisión administrativa empresarial dominante.                                                                                                                          |
| `VSCREEN-0003` | Resolución de contexto y acceso                       | `shell`    | `VPROC-0059::STEP-RESOLVE_EFFECTIVE_CONTEXT`                | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_REVIEW`              | La pantalla revisa, contrasta o evalúa información para una decisión de backoffice, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                  |
| `VSCREEN-0004` | Activación de dispositivo compartido                  | `shell`    | `VPROC-0059::STEP-ACTIVATE_SHARED_DEVICE`                   | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Superficie transversal de acceso, cuenta o navegación sin expediente, planificación ni decisión administrativa empresarial dominante.                                                                                                                          |
| `VSCREEN-0005` | Bandeja transversal de tareas y notificaciones        | `shell`    | `VPROC-0004::STEP-TRIAGE_TRANSVERSAL_WORK`                  | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_QUEUE`               | La pantalla admite, prioriza o distribuye trabajo administrativo pendiente, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                          |
| `VSCREEN-0006` | Centro de soporte y diagnóstico                       | `shell`    | `VPROC-0058::STEP-DIAGNOSE_AND_ROUTE_SUPPORT`               | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_CASE`                | La pantalla gestiona un caso administrativo desde apertura hasta resolución, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                         |
| `VSCREEN-0007` | Inicio ejecutivo y gerencial                          | `viso`     | `VPROC-0001::STEP-REVIEW_EXECUTIVE_WORK`                    | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_ANALYSIS`            | La pantalla consolida análisis, escenarios o indicadores para decisión administrativa, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.               |
| `VSCREEN-0008` | Estructura organizativa                               | `viso`     | `VPROC-0002::STEP-MAINTAIN_ORGANIZATIONAL_STRUCTURE`        | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_RESOURCE_MANAGEMENT` | La pantalla administra maestros, recursos, activos, proveedores o configuraciones de apoyo, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.          |
| `VSCREEN-0009` | Políticas, delegaciones y límites                     | `viso`     | `VPROC-0003::STEP-AUTHOR_POLICIES_AND_LIMITS`               | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_COMPLIANCE`          | La pantalla gobierna riesgo, política, obligación, evidencia o cumplimiento, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                         |
| `VSCREEN-0010` | Compromisos y transferencias internas                 | `viso`     | `VPROC-0004::STEP-TRACK_INTERNAL_COMMITMENTS`               | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_COORDINATION`        | La intención dominante coordina participantes, dependencias, compromisos y handoffs administrativos y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.   |
| `VSCREEN-0011` | Embudo de candidatos                                  | `viso`     | `VPROC-0005::STEP-TRIAGE_CANDIDATES`                        | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_QUEUE`               | La intención dominante admite, prioriza o distribuye trabajo administrativo pendiente y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                 |
| `VSCREEN-0012` | Caso de selección                                     | `viso`     | `VPROC-0005::STEP-EVALUATE_AND_DECIDE_CANDIDATE`            | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_CASE`                | La intención dominante gestiona un caso administrativo desde apertura hasta resolución y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                |
| `VSCREEN-0013` | Vinculación e incorporación                           | `viso`     | `VPROC-0006::STEP-ORCHESTRATE_ONBOARDING`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_COORDINATION`        | La intención dominante coordina participantes, dependencias, compromisos y handoffs administrativos y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.   |
| `VSCREEN-0014` | Directorio y expediente laboral                       | `viso`     | `VPROC-0006::STEP-MAINTAIN_EMPLOYMENT_RECORD`               | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_RECORD`              | La intención dominante mantiene un expediente, registro o documento administrativo canónico y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.           |
| `VSCREEN-0015` | Programación laboral                                  | `viso`     | `VPROC-0007::STEP-PLAN_AND_PUBLISH_SCHEDULE`                | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_PLANNING`            | La intención dominante planifica capacidad, recursos, obligaciones o trabajo futuro y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                   |
| `VSCREEN-0016` | Revisión de asistencia                                | `viso`     | `VPROC-0008::STEP-REVIEW_ATTENDANCE_EXCEPTION`              | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_REVIEW`              | La pantalla revisa, contrasta o evalúa información para una decisión de backoffice, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                  |
| `VSCREEN-0017` | Novedades, ausencias y reemplazos                     | `viso`     | `VPROC-0009::STEP-RESOLVE_WORKFORCE_CASE`                   | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_CASE`                | La intención dominante gestiona un caso administrativo desde apertura hasta resolución y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                |
| `VSCREEN-0018` | Retiro y revocación coordinada                        | `viso`     | `VPROC-0011::STEP-CLOSE_EMPLOYMENT_AND_REVOKE`              | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_COORDINATION`        | La intención dominante coordina participantes, dependencias, compromisos y handoffs administrativos y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.   |
| `VSCREEN-0019` | Catálogo de roles y permisos                          | `viso`     | `VPROC-0059::STEP-MAINTAIN_ACCESS_CATALOG`                  | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_RESOURCE_MANAGEMENT` | La pantalla administra maestros, recursos, activos, proveedores o configuraciones de apoyo, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.          |
| `VSCREEN-0020` | Perfil de acceso del trabajador                       | `viso`     | `VPROC-0059::STEP-ASSIGN_EFFECTIVE_ACCESS`                  | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_RECORD`              | La intención dominante mantiene un expediente, registro o documento administrativo canónico y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.           |
| `VSCREEN-0021` | Simulación de permisos y conflictos                   | `viso`     | `VPROC-0059::STEP-SIMULATE_ACCESS_DECISION`                 | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_REVIEW`              | La intención dominante revisa, contrasta o evalúa información para una decisión de backoffice y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.         |
| `VSCREEN-0022` | Gobierno de dispositivos compartidos                  | `viso`     | `VPROC-0059::STEP-GOVERN_SHARED_DEVICES`                    | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_RESOURCE_MANAGEMENT` | La pantalla administra maestros, recursos, activos, proveedores o configuraciones de apoyo, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.          |
| `VSCREEN-0023` | Riesgos de seguridad y salud                          | `viso`     | `VPROC-0012::STEP-ASSESS_SST_RISK`                          | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_COMPLIANCE`          | La intención dominante gobierna riesgo, política, obligación, evidencia o cumplimiento y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                |
| `VSCREEN-0024` | Incidentes y emergencias                              | `viso`     | `VPROC-0013::STEP-MANAGE_INCIDENT_RESPONSE`                 | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_CASE`                | La intención dominante gestiona un caso administrativo desde apertura hasta resolución y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                |
| `VSCREEN-0025` | Controles de higiene y cumplimiento                   | `viso`     | `VPROC-0014::STEP-REVIEW_HYGIENE_COMPLIANCE`                | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_COMPLIANCE`          | La pantalla gobierna riesgo, política, obligación, evidencia o cumplimiento, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                         |
| `VSCREEN-0026` | Bandeja de casos administrativos transversales        | `viso`     | `VPROC-0004::STEP-TRIAGE_ADMIN_CASES`                       | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_QUEUE`               | La intención dominante admite, prioriza o distribuye trabajo administrativo pendiente y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                 |
| `VSCREEN-0027` | Inicio personal del trabajador                        | `anima`    | `VPROC-0007::STEP-ENTER_PERSONAL_WORKSPACE`                 | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Experiencia personal del trabajador sin gestión de poblaciones ni backoffice; su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                               |
| `VSCREEN-0028` | Registro de entrada, pausa y salida                   | `anima`    | `VPROC-0008::STEP-CAPTURE_ATTENDANCE_EVENT`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0029` | Mi programación                                       | `anima`    | `VPROC-0007::STEP-CONSULT_PUBLISHED_SCHEDULE`               | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Experiencia personal del trabajador sin gestión de poblaciones ni backoffice; su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                               |
| `VSCREEN-0030` | Mi asistencia y solicitud de corrección               | `anima`    | `VPROC-0008::STEP-CONSULT_OR_REQUEST_ATTENDANCE_CORRECTION` | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Experiencia personal del trabajador sin gestión de poblaciones ni backoffice; su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                               |
| `VSCREEN-0031` | Mis novedades, permisos y ausencias                   | `anima`    | `VPROC-0009::STEP-SUBMIT_PERSONAL_WORKFORCE_CASE`           | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Experiencia personal del trabajador sin gestión de poblaciones ni backoffice; su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                               |
| `VSCREEN-0032` | Mi perfil laboral                                     | `anima`    | `VPROC-0006::STEP-MAINTAIN_SELF_SERVICE_PROFILE`            | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Experiencia personal del trabajador sin gestión de poblaciones ni backoffice; su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                               |
| `VSCREEN-0033` | Resumen de inventario y abastecimiento interno        | `nexo`     | `VPROC-0028::STEP-MONITOR_INTERNAL_SUPPLY`                  | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_ANALYSIS`            | La pantalla consolida análisis, escenarios o indicadores para decisión administrativa, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.               |
| `VSCREEN-0034` | Catálogo de productos físicos                         | `nexo`     | `VPROC-0015::STEP-CONSULT_PHYSICAL_PRODUCT_CATALOG`         | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_RESOURCE_MANAGEMENT` | La pantalla administra maestros, recursos, activos, proveedores o configuraciones de apoyo, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.          |
| `VSCREEN-0035` | Editor de producto, unidad y presentación             | `nexo`     | `VPROC-0015::STEP-MAINTAIN_PRODUCT_PRESENTATION`            | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_RESOURCE_MANAGEMENT` | La pantalla administra maestros, recursos, activos, proveedores o configuraciones de apoyo, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.          |
| `VSCREEN-0036` | Especificaciones y criterios de calidad               | `nexo`     | `VPROC-0018::STEP-MAINTAIN_QUALITY_SPECIFICATION`           | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_COMPLIANCE`          | La pantalla gobierna riesgo, política, obligación, evidencia o cumplimiento, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                         |
| `VSCREEN-0037` | Catálogo de ubicaciones                               | `nexo`     | `VPROC-0023::STEP-MAINTAIN_LOCATION_CATALOG`                | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_RESOURCE_MANAGEMENT` | La pantalla administra maestros, recursos, activos, proveedores o configuraciones de apoyo, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.          |
| `VSCREEN-0038` | Identificación y detalle de ubicación | `nexo` | `VPROC-0023::STEP-IDENTIFY_LOCATION_AND_CONTENT` | `PRIMARY_OPERATIONAL` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE` | No cumple los criterios de backoffice, coordinación, expediente, aprobación, planificación, cumplimiento o conciliación definidos para esta clase. |
| `VSCREEN-0039` | Consulta de existencias                               | `nexo`     | `VPROC-0024::STEP-CONSULT_STOCK_POSITION`                   | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | No cumple los criterios de backoffice, coordinación, expediente, aprobación, planificación, cumplimiento o conciliación definidos para esta clase.                                                                                                             |
| `VSCREEN-0040` | Conteo de inventario                                  | `nexo`     | `VPROC-0026::STEP-CAPTURE_PHYSICAL_COUNT`                   | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0041` | Revisión de conteo y diferencias                      | `nexo`     | `VPROC-0026::STEP-REVIEW_COUNT_VARIANCE`                    | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_REVIEW`              | La pantalla revisa, contrasta o evalúa información para una decisión de backoffice, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                  |
| `VSCREEN-0042` | Caso de ajuste de inventario                          | `nexo`     | `VPROC-0026::STEP-DECIDE_INVENTORY_ADJUSTMENT`              | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_APPROVAL`            | La pantalla aplica aprobación, certificación o autoridad administrativa explícita, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                   |
| `VSCREEN-0043` | Confirmación de entrada a inventario                  | `nexo`     | `VPROC-0024::STEP-CONFIRM_STOCK_ENTRY`                      | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0044` | Retiro y consumo de existencias                       | `nexo`     | `VPROC-0025::STEP-EXECUTE_STOCK_WITHDRAWAL`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0045` | Traslado interno de existencias                       | `nexo`     | `VPROC-0025::STEP-EXECUTE_INTERNAL_TRANSFER`                | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0046` | Solicitud de remisión                                 | `nexo`     | `VPROC-0028::STEP-SUBMIT_REPLENISHMENT_REQUEST`             | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0047` | Preparación de remisión                               | `nexo`     | `VPROC-0028::STEP-PREPARE_REPLENISHMENT`                    | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0048` | Carga y despacho de remisión                          | `nexo`     | `VPROC-0028::STEP-LOAD_AND_DISPATCH_REPLENISHMENT`          | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0049` | Seguimiento de remisión en tránsito                   | `nexo`     | `VPROC-0028::STEP-MONITOR_REPLENISHMENT_TRANSIT`            | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0050` | Recepción de remisión                                 | `nexo`     | `VPROC-0028::STEP-RECEIVE_REPLENISHMENT`                    | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0051` | Vencimiento, cuarentena, daño y merma                 | `nexo`     | `VPROC-0027::STEP-RESOLVE_STOCK_CONDITION`                  | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_COMPLIANCE`          | La pantalla gobierna riesgo, política, obligación, evidencia o cumplimiento, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                         |
| `VSCREEN-0052` | LPN, contenedores y reutilizables                     | `nexo`     | `VPROC-0032::STEP-MANAGE_LPN_AND_REUSABLES`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0053` | Activos y custodia                                    | `nexo`     | `VPROC-0029::STEP-MANAGE_ASSET_CUSTODY`                     | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_RESOURCE_MANAGEMENT` | La pantalla administra maestros, recursos, activos, proveedores o configuraciones de apoyo, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.          |
| `VSCREEN-0054` | Etiquetas e impresión logística                       | `nexo`     | `VPROC-0024::STEP-ISSUE_LOGISTICS_LABEL`                    | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0055` | Inicio y cola de producción                           | `fogo`     | `VPROC-0033::STEP-TRIAGE_PRODUCTION_QUEUE`                  | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_QUEUE`               | La pantalla admite, prioriza o distribuye trabajo administrativo pendiente, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                          |
| `VSCREEN-0056` | Planeación de producción                              | `fogo`     | `VPROC-0033::STEP-PLAN_PRODUCTION`                          | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_PLANNING`            | La pantalla planifica capacidad, recursos, obligaciones o trabajo futuro, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                            |
| `VSCREEN-0057` | Preparación e inicio de lote                          | `fogo`     | `VPROC-0034::STEP-PREPARE_AND_START_BATCH`                  | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0058` | Ejecución de lote                                     | `fogo`     | `VPROC-0034::STEP-EXECUTE_BATCH`                            | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0059` | Registro parcial de producción                        | `fogo`     | `VPROC-0034::STEP-CAPTURE_BATCH_PROGRESS`                   | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0060` | Finalización y cierre de lote                         | `fogo`     | `VPROC-0037::STEP-CLOSE_BATCH`                              | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0061` | Receta operativa | `fogo` | `VPROC-0016::STEP-CONSULT_APPLICABLE_RECIPE` | `PRIMARY_OPERATIONAL` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE` | No cumple los criterios de backoffice, coordinación, expediente, aprobación, planificación, cumplimiento o conciliación definidos para esta clase. |
| `VSCREEN-0062` | Catálogo y editor de recetas                          | `fogo`     | `VPROC-0016::STEP-AUTHOR_RECIPE`                            | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_RESOURCE_MANAGEMENT` | La pantalla administra maestros, recursos, activos, proveedores o configuraciones de apoyo, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.          |
| `VSCREEN-0063` | Revisión, aprobación y publicación de receta          | `fogo`     | `VPROC-0016::STEP-APPROVE_AND_PUBLISH_RECIPE`               | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_APPROVAL`            | La pantalla aplica aprobación, certificación o autoridad administrativa explícita, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                   |
| `VSCREEN-0064` | Prueba de receta y rendimiento                        | `fogo`     | `VPROC-0016::STEP-TEST_RECIPE_AND_YIELD`                    | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_REVIEW`              | La pantalla revisa, contrasta o evalúa información para una decisión de backoffice, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                  |
| `VSCREEN-0065` | Control de calidad y liberación                       | `fogo`     | `VPROC-0035::STEP-DECIDE_QUALITY_RELEASE`                   | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_APPROVAL`            | La pantalla aplica aprobación, certificación o autoridad administrativa explícita, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                   |
| `VSCREEN-0066` | Empaque, etiquetado y almacenamiento de terminado     | `fogo`     | `VPROC-0036::STEP-PACK_AND_TRANSFER_FINISHED_GOOD`          | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0067` | Reproceso, aprovechamiento, merma y cierre productivo | `fogo`     | `VPROC-0037::STEP-RESOLVE_PRODUCTION_DISPOSITION`           | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_RECONCILIATION`      | La pantalla concilia hechos, obligaciones, saldos, periodos o variaciones, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                           |
| `VSCREEN-0068` | Bandeja de necesidades de compra                      | `origo`    | `VPROC-0019::STEP-TRIAGE_PURCHASE_NEEDS`                    | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_QUEUE`               | La intención dominante admite, prioriza o distribuye trabajo administrativo pendiente y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                 |
| `VSCREEN-0069` | Solicitud de compra                                   | `origo`    | `VPROC-0019::STEP-SUBMIT_PURCHASE_REQUEST`                  | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_RECORD`              | La intención dominante mantiene un expediente, registro o documento administrativo canónico y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.           |
| `VSCREEN-0070` | Catálogo de proveedores                               | `origo`    | `VPROC-0020::STEP-CONSULT_SUPPLIER_CATALOG`                 | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_RESOURCE_MANAGEMENT` | La pantalla administra maestros, recursos, activos, proveedores o configuraciones de apoyo, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.          |
| `VSCREEN-0071` | Alta y expediente de proveedor                        | `origo`    | `VPROC-0020::STEP-ONBOARD_SUPPLIER`                         | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_RECORD`              | La intención dominante mantiene un expediente, registro o documento administrativo canónico y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.           |
| `VSCREEN-0072` | Comparación de cotizaciones                           | `origo`    | `VPROC-0020::STEP-COMPARE_QUOTES`                           | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_REVIEW`              | La intención dominante revisa, contrasta o evalúa información para una decisión de backoffice y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.         |
| `VSCREEN-0073` | Editor de orden de compra                             | `origo`    | `VPROC-0021::STEP-PREPARE_PURCHASE_ORDER`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_RECORD`              | La intención dominante mantiene un expediente, registro o documento administrativo canónico y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.           |
| `VSCREEN-0074` | Bandeja de aprobaciones de compra                     | `origo`    | `VPROC-0021::STEP-APPROVE_PURCHASE`                         | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_APPROVAL`            | La intención dominante aplica aprobación, certificación o autoridad administrativa explícita y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.          |
| `VSCREEN-0075` | Detalle y seguimiento de orden                        | `origo`    | `VPROC-0021::STEP-MONITOR_PURCHASE_ORDER`                   | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_COORDINATION`        | La intención dominante coordina participantes, dependencias, compromisos y handoffs administrativos y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.   |
| `VSCREEN-0076` | Cola de recepciones                                   | `origo`    | `VPROC-0022::STEP-TRIAGE_RECEIPT_QUEUE`                     | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_QUEUE`               | La pantalla admite, prioriza o distribuye trabajo administrativo pendiente, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                          |
| `VSCREEN-0077` | Recepción total o parcial                             | `origo`    | `VPROC-0022::STEP-RECEIVE_PURCHASE`                         | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_RECORD`              | La pantalla mantiene un expediente, registro o documento administrativo canónico, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                    |
| `VSCREEN-0078` | Resolución de diferencias de recepción                | `origo`    | `VPROC-0022::STEP-RESOLVE_RECEIPT_VARIANCE`                 | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_CASE`                | La pantalla gestiona un caso administrativo desde apertura hasta resolución, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                         |
| `VSCREEN-0079` | Historial y auditoría de abastecimiento               | `origo`    | `VPROC-0022::STEP-AUDIT_PROCUREMENT_CYCLE`                  | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_REVIEW`              | La pantalla revisa, contrasta o evalúa información para una decisión de backoffice, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                  |
| `VSCREEN-0080` | Inicio POS | `pulso` | `VPROC-0039::STEP-ENTER_POS_WORKSPACE` | `PRIMARY_OPERATIONAL` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE` | No cumple los criterios de backoffice, coordinación, expediente, aprobación, planificación, cumplimiento o conciliación definidos para esta clase. |
| `VSCREEN-0081` | Creación de venta o pedido                            | `pulso`    | `VPROC-0039::STEP-CREATE_SALE_OR_ORDER`                     | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0082` | Mapa de salón y mesas                                 | `pulso`    | `VPROC-0038::STEP-MANAGE_TABLE_SERVICE`                     | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0083` | Detalle y modificación de pedido                      | `pulso`    | `VPROC-0038::STEP-MODIFY_ACTIVE_ORDER`                      | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0084` | Cobro y medios de pago                                | `pulso`    | `VPROC-0043::STEP-COLLECT_PAYMENT`                          | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0085` | Identificación de cliente y acumulación               | `pulso`    | `VPROC-0045::STEP-IDENTIFY_CUSTOMER_AND_ACCRUE`             | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0086` | Redención de puntos o beneficios                      | `pulso`    | `VPROC-0045::STEP-REDEEM_LOYALTY_VALUE`                     | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0087` | Bandeja de pedidos de canales externos                | `pulso`    | `VPROC-0040::STEP-ADMIT_EXTERNAL_ORDER`                     | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0088` | Seguimiento de preparación y entrega                  | `pulso`    | `VPROC-0039::STEP-MONITOR_ORDER_FULFILLMENT`                | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0089` | Apertura de caja                                      | `pulso`    | `VPROC-0044::STEP-OPEN_CASH_SESSION`                        | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0090` | Cierre de caja                                        | `pulso`    | `VPROC-0044::STEP-CLOSE_CASH_SESSION`                       | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_RECONCILIATION`      | La pantalla concilia hechos, obligaciones, saldos, periodos o variaciones, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                           |
| `VSCREEN-0091` | Anulación, devolución y reembolso                     | `pulso`    | `VPROC-0042::STEP-RESOLVE_REVERSAL_OR_REFUND`               | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_CASE`                | La pantalla gestiona un caso administrativo desde apertura hasta resolución, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                         |
| `VSCREEN-0092` | Oferta, menú, precio comercial y disponibilidad       | `pulso`    | `VPROC-0017::STEP-PUBLISH_COMMERCIAL_OFFER`                 | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_RESOURCE_MANAGEMENT` | La pantalla administra maestros, recursos, activos, proveedores o configuraciones de apoyo, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.          |
| `VSCREEN-0093` | Revisión de ventas, caja y terminales                 | `pulso`    | `VPROC-0044::STEP-REVIEW_SALES_AND_TERMINALS`               | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_REVIEW`              | La pantalla revisa, contrasta o evalúa información para una decisión de backoffice, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                  |
| `VSCREEN-0094` | Inicio financiero y ejecutivo                         | `numera`   | `VPROC-0061::STEP-REVIEW_FINANCIAL_POSITION`                | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_ANALYSIS`            | La pantalla consolida análisis, escenarios o indicadores para decisión administrativa, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.               |
| `VSCREEN-0095` | Bandeja de hechos económicos                          | `numera`   | `VPROC-0051::STEP-TRIAGE_ECONOMIC_FACTS`                    | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_QUEUE`               | La intención dominante admite, prioriza o distribuye trabajo administrativo pendiente y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                 |
| `VSCREEN-0096` | Registro de gasto y soporte                           | `numera`   | `VPROC-0051::STEP-CAPTURE_EXPENSE_AND_EVIDENCE`             | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_RECORD`              | La intención dominante mantiene un expediente, registro o documento administrativo canónico y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.           |
| `VSCREEN-0097` | Bandeja de aprobaciones financieras                   | `numera`   | `VPROC-0052::STEP-APPROVE_FINANCIAL_DECISION`               | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_APPROVAL`            | La intención dominante aplica aprobación, certificación o autoridad administrativa explícita y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.          |
| `VSCREEN-0098` | Cuentas por pagar y obligaciones                      | `numera`   | `VPROC-0052::STEP-MANAGE_PAYABLE_OBLIGATION`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_CASE`                | La intención dominante gestiona un caso administrativo desde apertura hasta resolución y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                |
| `VSCREEN-0099` | Cuentas por cobrar y cartera                          | `numera`   | `VPROC-0053::STEP-MANAGE_RECEIVABLE`                        | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_CASE`                | La intención dominante gestiona un caso administrativo desde apertura hasta resolución y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                |
| `VSCREEN-0100` | Caja, bancos y movimientos financieros                | `numera`   | `VPROC-0052::STEP-EXECUTE_TREASURY_MOVEMENT`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_RECORD`              | La intención dominante mantiene un expediente, registro o documento administrativo canónico y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.           |
| `VSCREEN-0101` | Conciliación de ventas y pagos                        | `numera`   | `VPROC-0051::STEP-RECONCILE_SALES_AND_PAYMENTS`             | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_RECONCILIATION`      | La intención dominante concilia hechos, obligaciones, saldos, periodos o variaciones y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                  |
| `VSCREEN-0102` | Conciliación de compras y recepciones                 | `numera`   | `VPROC-0051::STEP-RECONCILE_PURCHASES_AND_RECEIPTS`         | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_RECONCILIATION`      | La intención dominante concilia hechos, obligaciones, saldos, periodos o variaciones y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                  |
| `VSCREEN-0103` | Conciliación de inventario, producción y variaciones  | `numera`   | `VPROC-0054::STEP-RECONCILE_OPERATING_VARIANCES`            | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_RECONCILIATION`      | La intención dominante concilia hechos, obligaciones, saldos, periodos o variaciones y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                  |
| `VSCREEN-0104` | Costos, rentabilidad y escenarios                     | `numera`   | `VPROC-0054::STEP-ANALYZE_COST_AND_PROFITABILITY`           | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_ANALYSIS`            | La intención dominante consolida análisis, escenarios o indicadores para decisión administrativa y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.      |
| `VSCREEN-0105` | Cierre, reapertura y corrección de periodo            | `numera`   | `VPROC-0054::STEP-CLOSE_OR_REOPEN_PERIOD`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_RECONCILIATION`      | La intención dominante concilia hechos, obligaciones, saldos, periodos o variaciones y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                  |
| `VSCREEN-0106` | Reportes y exportaciones financieras                  | `numera`   | `VPROC-0061::STEP-PUBLISH_FINANCIAL_REPORT`                 | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_ANALYSIS`            | La pantalla consolida análisis, escenarios o indicadores para decisión administrativa, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.               |
| `VSCREEN-0107` | Inicio del cliente y resumen de beneficios            | `pass`     | `VPROC-0045::STEP-ENTER_LOYALTY_HOME`                       | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0108` | QR personal de identificación                         | `pass`     | `VPROC-0045::STEP-PRESENT_CUSTOMER_ID`                      | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0109` | Catálogo de beneficios y recompensas                  | `pass`     | `VPROC-0045::STEP-CONSULT_REWARDS_CATALOG`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0110` | Ticket o QR de redención                              | `pass`     | `VPROC-0045::STEP-CREATE_REDEMPTION_INTENT`                 | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0111` | Historial de puntos y redenciones                     | `pass`     | `VPROC-0045::STEP-AUDIT_PERSONAL_LOYALTY_LEDGER`            | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0112` | Perfil, privacidad y consentimientos                  | `pass`     | `VPROC-0045::STEP-MAINTAIN_CUSTOMER_PROFILE_AND_CONSENT`    | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0113` | Registro y seguimiento de decisiones empresariales    | `viso`     | `VPROC-0001::STEP-RECORD_AND_TRACK_DECISION`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_COORDINATION`        | La intención dominante coordina participantes, dependencias, compromisos y handoffs administrativos y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.   |
| `VSCREEN-0114` | Solicitudes y certificaciones de acceso               | `viso`     | `VPROC-0059::STEP-REVIEW_AND_CERTIFY_ACCESS`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_APPROVAL`            | La intención dominante aplica aprobación, certificación o autoridad administrativa explícita y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.          |
| `VSCREEN-0115` | Gobierno de documentos y evidencia                    | `viso`     | `VPROC-0060::STEP-GOVERN_DOCUMENT_EVIDENCE`                 | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_COMPLIANCE`          | La intención dominante gobierna riesgo, política, obligación, evidencia o cumplimiento y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                |
| `VSCREEN-0116` | Registro de riesgos empresariales                     | `viso`     | `VPROC-0063::STEP-ASSESS_ENTERPRISE_RISK`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_COMPLIANCE`          | La intención dominante gobierna riesgo, política, obligación, evidencia o cumplimiento y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                |
| `VSCREEN-0117` | Requerimientos de asesores y autoridades              | `viso`     | `VPROC-0064::STEP-MANAGE_EXTERNAL_REQUIREMENT`              | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_COMPLIANCE`          | La intención dominante gobierna riesgo, política, obligación, evidencia o cumplimiento y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                |
| `VSCREEN-0118` | Gestión de desempeño y desarrollo                     | `viso`     | `VPROC-0065::STEP-REVIEW_PERFORMANCE_AND_DEVELOPMENT`       | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_PLANNING`            | La intención dominante planifica capacidad, recursos, obligaciones o trabajo futuro y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                   |
| `VSCREEN-0119` | Asignación y control de elementos de protección       | `viso`     | `VPROC-0066::STEP-ASSIGN_PROTECTIVE_EQUIPMENT`              | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_RESOURCE_MANAGEMENT` | La intención dominante administra maestros, recursos, activos, proveedores o configuraciones de apoyo y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal. |
| `VSCREEN-0120` | Mesa de servicio tecnológico                          | `viso`     | `VPROC-0058::STEP-RESOLVE_TECH_SERVICE_CASE`                | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_CASE`                | La intención dominante gestiona un caso administrativo desde apertura hasta resolución y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                |
| `VSCREEN-0121` | Continuidad, contingencia y recuperación              | `viso`     | `VPROC-0062::STEP-ACTIVATE_AND_RECOVER_CONTINUITY`          | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_PLANNING`            | La intención dominante planifica capacidad, recursos, obligaciones o trabajo futuro y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                   |
| `VSCREEN-0122` | Privacidad, cumplimiento y conservación               | `viso`     | `VPROC-0060::STEP-GOVERN_PRIVACY_AND_RETENTION`             | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_COMPLIANCE`          | La intención dominante gobierna riesgo, política, obligación, evidencia o cumplimiento y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                |
| `VSCREEN-0123` | Gestión de comunicaciones internas                    | `viso`     | `VPROC-0004::STEP-PUBLISH_INTERNAL_COMMUNICATION`           | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_COMMUNICATION`       | La intención dominante gobierna comunicación formal, entrega, acuse y seguimiento y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                     |
| `VSCREEN-0124` | Mis comunicados laborales                             | `anima`    | `VPROC-0004::STEP-CONSULT_AND_ACKNOWLEDGE_COMMUNICATION`    | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Experiencia personal del trabajador sin gestión de poblaciones ni backoffice; su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                               |
| `VSCREEN-0125` | Mi carnet laboral                                     | `anima`    | `VPROC-0006::STEP-PRESENT_EMPLOYEE_CREDENTIAL`              | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Experiencia personal del trabajador sin gestión de poblaciones ni backoffice; su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                               |
| `VSCREEN-0126` | Mis documentos laborales                              | `anima`    | `VPROC-0060::STEP-CONSULT_OR_SUBMIT_EMPLOYMENT_DOCUMENT`    | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Experiencia personal del trabajador sin gestión de poblaciones ni backoffice; su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                               |
| `VSCREEN-0127` | Mi capacitación                                       | `anima`    | `VPROC-0065::STEP-COMPLETE_ASSIGNED_TRAINING`               | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Experiencia personal del trabajador sin gestión de poblaciones ni backoffice; su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                               |
| `VSCREEN-0128` | Mis objetivos y retroalimentación                     | `anima`    | `VPROC-0065::STEP-REVIEW_PERSONAL_OBJECTIVES`               | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Experiencia personal del trabajador sin gestión de poblaciones ni backoffice; su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                               |
| `VSCREEN-0129` | Mis solicitudes de soporte                            | `anima`    | `VPROC-0058::STEP-SUBMIT_AND_TRACK_SUPPORT_REQUEST`         | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Experiencia personal del trabajador sin gestión de poblaciones ni backoffice; su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                               |
| `VSCREEN-0130` | Mis reportes de seguridad y salud                     | `anima`    | `VPROC-0013::STEP-REPORT_SST_EVENT`                         | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Experiencia personal del trabajador sin gestión de poblaciones ni backoffice; su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                               |
| `VSCREEN-0131` | Mis elementos de protección                           | `anima`    | `VPROC-0066::STEP-ACKNOWLEDGE_PROTECTIVE_EQUIPMENT`         | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Experiencia personal del trabajador sin gestión de poblaciones ni backoffice; su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                               |
| `VSCREEN-0132` | Reservas de inventario                                | `nexo`     | `VPROC-0028::STEP-RESERVE_STOCK`                            | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0133` | Planes y órdenes de mantenimiento de activos          | `nexo`     | `VPROC-0030::STEP-PLAN_AND_EXECUTE_ASSET_MAINTENANCE`       | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_PLANNING`            | La pantalla planifica capacidad, recursos, obligaciones o trabajo futuro, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                            |
| `VSCREEN-0134` | Garantías, seguros y reclamaciones de activos         | `nexo`     | `VPROC-0030::STEP-MANAGE_ASSET_CLAIM`                       | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_CASE`                | La intención dominante gestiona un caso administrativo desde apertura hasta resolución y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                |
| `VSCREEN-0135` | Instancias y operación de kits                                      | `nexo`     | `VPROC-0067::STEP-ASSEMBLE_AND_CONTROL_KIT`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0136` | Flota y vehículos                                     | `nexo`     | `VPROC-0031::STEP-MANAGE_FLEET_ASSET`                       | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_RESOURCE_MANAGEMENT` | La intención dominante administra maestros, recursos, activos, proveedores o configuraciones de apoyo y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal. |
| `VSCREEN-0137` | Kilometraje y combustible                             | `nexo`     | `VPROC-0031::STEP-CAPTURE_MILEAGE_AND_FUEL`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0138` | Planeación de rutas y despachos                       | `nexo`     | `VPROC-0048::STEP-PLAN_ROUTE_AND_DISPATCH`                  | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0139` | Ejecución de ruta y prueba de entrega                 | `nexo`     | `VPROC-0049::STEP-EXECUTE_ROUTE_AND_PROVE_DELIVERY`         | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0140` | Novedades, rechazos y retornos logísticos             | `nexo`     | `VPROC-0049::STEP-RESOLVE_LOGISTICS_EXCEPTION`              | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0141` | Instalaciones, servicios y mantenimiento locativo     | `nexo`     | `VPROC-0055::STEP-MANAGE_FACILITY_SERVICE`                  | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_CASE`                | La pantalla gestiona un caso administrativo desde apertura hasta resolución, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                         |
| `VSCREEN-0142` | Configuración de políticas y rutas logísticas         | `nexo`     | `VPROC-0048::STEP-CONFIGURE_LOGISTICS_POLICY`               | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_PLANNING`            | La pantalla planifica capacidad, recursos, obligaciones o trabajo futuro, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                            |
| `VSCREEN-0143` | Diseñador de etiquetas logísticas                     | `nexo`     | `VPROC-0015::STEP-AUTHOR_LOGISTICS_LABEL_TEMPLATE`          | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_RESOURCE_MANAGEMENT` | La pantalla administra maestros, recursos, activos, proveedores o configuraciones de apoyo, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.          |
| `VSCREEN-0144` | Cola y trabajos de impresión logística | `nexo` | `VPROC-0024::STEP-OPERATE_PRINT_QUEUE` | `PRIMARY_OPERATIONAL` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE` | Opera trabajos de impresión; la administración del recurso técnico quedó separada en VSCREEN-0177. |
| `VSCREEN-0145` | Contratos, precios y condiciones de proveedor         | `origo`    | `VPROC-0020::STEP-GOVERN_SUPPLIER_TERMS`                    | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_RESOURCE_MANAGEMENT` | La intención dominante administra maestros, recursos, activos, proveedores o configuraciones de apoyo y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal. |
| `VSCREEN-0146` | Desempeño y reclamaciones de proveedor                | `origo`    | `VPROC-0020::STEP-REVIEW_SUPPLIER_PERFORMANCE`              | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_REVIEW`              | La intención dominante revisa, contrasta o evalúa información para una decisión de backoffice y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.         |
| `VSCREEN-0147` | Oportunidades y cotizaciones de catering o B2B        | `pulso`    | `VPROC-0041::STEP-QUALIFY_B2B_OPPORTUNITY`                  | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_CASE`                | La intención dominante gestiona un caso administrativo desde apertura hasta resolución y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                |
| `VSCREEN-0148` | Ejecución de catering o venta B2B                     | `pulso`    | `VPROC-0041::STEP-EXECUTE_B2B_COMMITMENT`                   | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_COORDINATION`        | La pantalla coordina participantes, dependencias, compromisos y handoffs administrativos, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.            |
| `VSCREEN-0149` | Operación de reservas y eventos                       | `pulso`    | `VPROC-0047::STEP-MANAGE_RESERVATION_OR_EVENT`              | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_COORDINATION`        | La pantalla coordina participantes, dependencias, compromisos y handoffs administrativos, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.            |
| `VSCREEN-0150` | Casos de reclamo y compensación                       | `pulso`    | `VPROC-0046::STEP-RESOLVE_CUSTOMER_CLAIM`                   | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_CASE`                | La pantalla gestiona un caso administrativo desde apertura hasta resolución, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                         |
| `VSCREEN-0151` | Coordinación de entrega mediante tercero              | `pulso`    | `VPROC-0050::STEP-COORDINATE_THIRD_PARTY_DELIVERY`          | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_COORDINATION`        | La pantalla coordina participantes, dependencias, compromisos y handoffs administrativos, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.            |
| `VSCREEN-0152` | Análisis de satisfacción y servicio                   | `pulso`    | `VPROC-0068::STEP-ANALYZE_SERVICE_SATISFACTION`             | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_ANALYSIS`            | La pantalla consolida análisis, escenarios o indicadores para decisión administrativa, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.               |
| `VSCREEN-0153` | Paquete laboral para pagos y beneficios               | `numera`   | `VPROC-0010::STEP-PREPARE_LABOR_PAYMENT_PACKAGE`            | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_RECONCILIATION`      | La intención dominante concilia hechos, obligaciones, saldos, periodos o variaciones y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                  |
| `VSCREEN-0154` | Facturas y documentos fiscales                        | `numera`   | `VPROC-0051::STEP-MANAGE_FISCAL_DOCUMENT`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_RECORD`              | La intención dominante mantiene un expediente, registro o documento administrativo canónico y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.           |
| `VSCREEN-0155` | Tesorería y programación de pagos                     | `numera`   | `VPROC-0052::STEP-PLAN_AND_EXECUTE_PAYMENTS`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_PLANNING`            | La intención dominante planifica capacidad, recursos, obligaciones o trabajo futuro y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                   |
| `VSCREEN-0156` | Presupuestos, escenarios y forecast                   | `numera`   | `VPROC-0069::STEP-PLAN_BUDGET_AND_FORECAST`                 | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_PLANNING`            | La intención dominante planifica capacidad, recursos, obligaciones o trabajo futuro y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                   |
| `VSCREEN-0157` | Impuestos y obligaciones de cumplimiento              | `numera`   | `VPROC-0052::STEP-MANAGE_TAX_OBLIGATION`                    | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_COMPLIANCE`          | La intención dominante gobierna riesgo, política, obligación, evidencia o cumplimiento y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                |
| `VSCREEN-0158` | Distribución y asignación de costos                   | `numera`   | `VPROC-0054::STEP-ALLOCATE_COSTS`                           | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_RECONCILIATION`      | La intención dominante concilia hechos, obligaciones, saldos, periodos o variaciones y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                  |
| `VSCREEN-0159` | Indicadores, análisis y planes de mejora              | `numera`   | `VPROC-0061::STEP-ANALYZE_AND_PLAN_IMPROVEMENT`             | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_ANALYSIS`            | La pantalla consolida análisis, escenarios o indicadores para decisión administrativa, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.               |
| `VSCREEN-0160` | Inicio y selección del portal de compras              | `pass`     | `VPROC-0039::STEP-ENTER_CUSTOMER_COMMERCE`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0161` | Menú y catálogo comercial del cliente                 | `pass`     | `VPROC-0017::STEP-BROWSE_COMMERCIAL_OFFER`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0162` | Carrito y configuración del pedido                    | `pass`     | `VPROC-0039::STEP-CONFIGURE_CART`                           | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0163` | Dirección, modalidad y programación de entrega        | `pass`     | `VPROC-0050::STEP-SELECT_FULFILLMENT`                       | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0164` | Revisión, checkout e inicio de pago                   | `pass`     | `VPROC-0043::STEP-REVIEW_AND_START_PAYMENT`                 | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0165` | Confirmación de pedido y retorno de pago              | `pass`     | `VPROC-0043::STEP-PRESENT_ORDER_RECEIPT`                    | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0166` | Mis pedidos y detalle                                 | `pass`     | `VPROC-0039::STEP-CONSULT_PERSONAL_ORDERS`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0167` | Seguimiento de preparación y entrega del cliente      | `pass`     | `VPROC-0050::STEP-TRACK_PERSONAL_FULFILLMENT`               | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0168` | Chat y comunicación asociada al pedido                | `pass`     | `VPROC-0047::STEP-COMMUNICATE_ABOUT_ORDER`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0169` | Mis reclamos y casos de servicio                      | `pass`     | `VPROC-0046::STEP-SUBMIT_AND_TRACK_CLAIM`                   | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0170` | Mis reservas y eventos                                | `pass`     | `VPROC-0047::STEP-MANAGE_PERSONAL_RESERVATION`              | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0171` | Calificación y satisfacción                           | `pass`     | `VPROC-0068::STEP-SUBMIT_SATISFACTION_RATING`               | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0172` | Comunicaciones y notificaciones del cliente           | `pass`     | `VPROC-0047::STEP-CONSULT_CUSTOMER_COMMUNICATION`           | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0173` | Trazabilidad e investigación de lote                  | `fogo`     | `VPROC-0035::STEP-INVESTIGATE_BATCH_TRACEABILITY`           | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_REVIEW`              | La pantalla revisa, contrasta o evalúa información para una decisión de backoffice, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                  |
| `VSCREEN-0174` | Controles operativos de inocuidad                     | `fogo`     | `VPROC-0014::STEP-EXECUTE_FOOD_SAFETY_CONTROL`              | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_COMPLIANCE`          | La pantalla gobierna riesgo, política, obligación, evidencia o cumplimiento, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                         |
| `VSCREEN-0175` | Seguridad de cuenta y sesiones                        | `shell`    | `VPROC-0059::STEP-MANAGE_ACCOUNT_SECURITY`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Superficie transversal de acceso, cuenta o navegación sin expediente, planificación ni decisión administrativa empresarial dominante.                                                                                                                          |
| `VSCREEN-0176` | Definición de kits y conjuntos | `nexo` | `VPROC-0067::STEP-MAINTAIN_KIT_DEFINITION` | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE` | `ADMIN_RESOURCE_MANAGEMENT` | Administra una definición maestra de apoyo, mientras configuración conserva la intención primaria. |
| `VSCREEN-0177` | Configuración de impresoras logísticas | `nexo` | `VPROC-0024::STEP-CONFIGURE_LOGISTICS_PRINTERS` | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE` | `ADMIN_RESOURCE_MANAGEMENT` | Administra el recurso técnico de apoyo, mientras configuración conserva la intención primaria. |

---

#### 11. Resumen por aplicación

| Aplicación | Primaria administrativa | Secundaria administrativa | Fuera de clase administrativa |   Total |
| ---------- | ----------------------: | ------------------------: | ----------------------------: | ------: |
| `shell`    |                       0 |                         3 |                             4 |       7 |
| `viso`     |                      24 |                         7 |                             0 |      31 |
| `anima`    |                       0 |                         0 |                            14 |      14 |
| `nexo`     |                       2 |                        15 |                            20 |      37 |
| `fogo`     |                       0 |                         9 |                             6 |      15 |
| `origo`    |                       9 |                         5 |                             0 |      14 |
| `pulso`    |                       1 |                         9 |                            10 |      20 |
| `numera`   |                      17 |                         3 |                             0 |      20 |
| `pass`     |                       0 |                         0 |                            19 |      19 |
| **Total**  |                  **53** |                    **51** |                        **73** | **177** |

La aplicación no determina la clasificación. El resumen comprueba únicamente que las 177 filas y sus conteos coincidan.

---

#### 12. Resumen por patrón

| Patrón                                  | Pantallas |
| --------------------------------------- | --------: |
| `ADMIN_QUEUE`                           |         7 |
| `ADMIN_RECORD`                          |         9 |
| `ADMIN_CASE`                            |        13 |
| `ADMIN_PLANNING`                        |         8 |
| `ADMIN_REVIEW`                          |        10 |
| `ADMIN_APPROVAL`                        |         6 |
| `ADMIN_COORDINATION`                    |         8 |
| `ADMIN_RECONCILIATION`                  |         8 |
| `ADMIN_COMPLIANCE`                      |        11 |
| `ADMIN_RESOURCE_MANAGEMENT`             |        16 |
| `ADMIN_COMMUNICATION`                   |         1 |
| `ADMIN_ANALYSIS`                        |         7 |
| **Total con relevancia administrativa** |   **104** |

Las 72 pantallas con `NONE` continúan hacia las tareas posteriores sin recibir una categoría inventada.

---

#### 13. Fronteras especiales

1. **SHELL:** bandejas, contexto y soporte pueden tener relevancia administrativa secundaria; acceso, cuenta y navegación no son backoffice empresarial.
2. **VISO:** concentra trabajo administrativo de organización, personas, acceso, cumplimiento y casos, pero dashboards, configuración y auditoría conservan clases especializadas.
3. **ANIMA:** no administra poblaciones; sus superficies siguen siendo personales, aunque inicien solicitudes que consumirá un backoffice.
4. **NEXO:** garantías y gobierno de flota pueden ser administrativos; movimientos físicos siguen siendo operativos y maestros o políticas se reservan a configuración.
5. **FOGO:** planeación y aprobación de receta pueden tener relevancia administrativa; ejecución, calidad y cierre productivo conservan intención operativa.
6. **ORIGO:** necesidades, solicitudes, proveedores, cotizaciones, órdenes, aprobaciones y contratos son backoffice; la recepción física conserva clase operativa.
7. **PULSO:** oportunidades B2B pueden ser administrativas; POS, salón, pagos, caja y entrega permanecen operativos y la oferta comercial se reserva a configuración.
8. **NUMERA:** hechos, gastos, obligaciones, cartera, tesorería, conciliaciones, cierres, presupuesto, fiscalidad y costos forman backoffice financiero; dashboards y reportes pueden conservar clases de supervisión o auditoría.
9. **PASS:** no recibe clase administrativa; es experiencia de cliente.
10. **AURA:** continúa sin pantallas y sin clasificación.

---

#### 14. Compatibilidad con la clasificación operativa

```text
PRIMARY_OPERATIONAL + PRIMARY_ADMINISTRATIVE
= PROHIBIDO

PRIMARY_OPERATIONAL + SECONDARY_ADMINISTRATIVE
= PERMITIDO CUANDO EXISTE CONTROL O TRAZABILIDAD DE BACKOFFICE

SECONDARY_OPERATIONAL + PRIMARY_ADMINISTRATIVE
= PERMITIDO CUANDO EL BACKOFFICE APOYA TRABAJO VIVO

OUTSIDE_OPERATIONAL_CLASS + PRIMARY_ADMINISTRATIVE
= PERMITIDO
```

La puerta final de `PROC-SCREEN-011` deberá impedir dos clases primarias y exigir al menos una.

---

#### 15. Relación con las clasificaciones posteriores

- dashboards y revisión transversal podrán recibir clase primaria de supervisión en `PROC-SCREEN-007`;
- maestros, reglas, políticas y plantillas podrán recibir clase primaria de configuración en `PROC-SCREEN-008`;
- historiales, reconstrucción y evidencia podrán recibir clase primaria de auditoría en `PROC-SCREEN-009`;
- ANIMA podrá recibir clase primaria personal en `PROC-SCREEN-010`;
- PASS podrá recibir clase primaria de cliente en `PROC-SCREEN-011`.

Una pantalla marcada `SECONDARY_ADMINISTRATIVE` debe conservar esa relevancia aunque otra tarea le asigne una clase primaria diferente.

---

#### 16. Cambio y versionado

Cambiar `administrative_fit` o `administrative_pattern` exige:

1. propuesta trazable;
2. comparación de objeto, expediente, caso, paso, responsabilidad y resultado;
3. explicación de por qué el trabajo pasó a ser o dejó de ser administrativo;
4. nueva versión de clasificación;
5. conservación del valor anterior;
6. revisión coordinada de clases, actores, acciones, permisos, métricas y pruebas posteriores;
7. nueva identidad de pantalla cuando cambie materialmente la intención principal.

Un cambio de rol, ruta, aplicación o componente no cambia automáticamente la clasificación.

---

#### 17. Validaciones obligatorias

La compilación deberá fallar cuando:

1. falte una de las 177 pantallas;
2. una pantalla aparezca más de una vez;
3. falte `administrative_fit`;
4. el valor no pertenezca al vocabulario;
5. una pantalla primaria o secundaria use `NONE`;
6. una pantalla fuera de clase use un patrón administrativo;
7. falte fundamento;
8. proceso, paso o clasificación operativa no coincidan con tareas anteriores;
9. los conteos no sean 53, 51 y 73;
10. la distribución por aplicación no coincida;
11. los patrones no sumen 104;
12. exista una pantalla primaria operativa y primaria administrativa;
13. PASS o ANIMA reciban clase primaria administrativa sin una nueva decisión aprobada;
14. una pantalla de configuración, supervisión o auditoría sea primaria administrativa solo por vivir en backoffice;
15. la clasificación sea usada como permiso, rol o autoridad;
16. un cambio elimine el historial anterior;
17. AURA reciba una clasificación sin pantalla admitida;
18. la puerta final deje más de una clase primaria o ninguna clase primaria.

---

#### 18. Seguridad y autorización

La clasificación administrativa no concede:

- acceso a la pantalla;
- lectura de expedientes;
- modificación de maestros;
- aprobación o certificación;
- consulta de información sensible;
- alcance global o territorial;
- autoridad jerárquica;
- ejecución de acciones;
- exportación;
- simulación de permisos;
- acceso directo por URL.

Cada aplicación deberá resolver identidad, actor, permiso, contexto, recurso, territorio, estado, versión y segregación.

---

#### 19. SCREEN-ADMINISTRATIVE-CARRYOVER-REGISTER-001

| Pendiente                                                    | Propietario exacto                                        |
| ------------------------------------------------------------ | --------------------------------------------------------- |
| clasificar pantallas de supervisión                          | `PROC-SCREEN-007`                                         |
| clasificar pantallas de configuración                        | `PROC-SCREEN-008`                                         |
| clasificar pantallas de auditoría                            | `PROC-SCREEN-009`                                         |
| clasificar pantallas personales                              | `PROC-SCREEN-010`                                         |
| clasificar pantallas de cliente y cerrar la puerta de clases | `PROC-SCREEN-011`                                         |
| definir actores objetivo                                     | `PROC-SCREEN-012`                                         |
| definir dispositivos soportados                              | `PROC-SCREEN-013`                                         |
| definir acciones                                             | `PROC-SCREEN-014` y `PROC-SCREEN-015`                     |
| definir entradas, salidas y estados de interfaz              | `PROC-SCREEN-016` a `PROC-SCREEN-021`                     |
| definir sensibilidad y permisos                              | `PROC-SCREEN-022` a `PROC-SCREEN-024`                     |
| vincular operaciones técnicas                                | `PROC-SCREEN-025`                                         |
| mapear rutas y legado                                        | `PROC-SCREEN-026`                                         |
| definir métricas y aceptación operativa                      | `PROC-SCREEN-027` y `PROC-SCREEN-028`                     |
| implementar tipos y validadores                              | paquetes E5 y CI documental                               |
| validar con usuarios administrativos                         | `UX-QA-*` y pilotos E5                                    |
| admitir AURA                                                 | tareas canónicas de AURA y nueva admisión `PROC-SCREEN-*` |

No queda pendiente narrativo sin tarea o puerta de resolución.

---

#### 20. Requisitos de prueba derivados

**Resultado:** GENERA 30 REQUISITOS DE PRUEBA.

Se incorporan `TREQ-UX-639` a `TREQ-UX-668` al Registro Canónico completo. Permanecen en estado `IDENTIFICADO`; automatización, implementación y evidencia corresponden a CI documental, paquetes E5, BLOQUE U, staging y pilotos.

---

#### 21. Criterios de aceptación

- [x] Se clasifican las 177 pantallas sin renumerarlas.
- [x] Cada pantalla recibe exactamente un `administrative_fit`.
- [x] Se distinguen 53 primarias, 51 secundarias y 73 fuera de clase.
- [x] Las 104 pantallas con relevancia administrativa utilizan doce patrones cerrados.
- [x] Ninguna pantalla queda primaria operativa y primaria administrativa simultáneamente.
- [x] La clasificación deriva de objeto, expediente, caso, decisión y responsabilidad, no de aplicación o repositorio.
- [x] Se preservan las fronteras entre VISO, ANIMA, NEXO, FOGO, ORIGO, PULSO, NUMERA, PASS y SHELL.
- [x] AURA conserva cero pantallas.
- [x] La clasificación no concede permisos ni autoridad.
- [x] Se conserva la coexistencia entre clase primaria y relevancias secundarias.
- [x] Se mantiene en `PROC-SCREEN-011` la puerta final de completitud.
- [x] Se definen cambio, versionado, historial y validaciones.
- [x] Se generan `TREQ-UX-639` a `TREQ-UX-668`.
- [x] No se anticipan actores, dispositivos, acciones, estados, permisos, rutas o APIs.
- [x] No se implementa código ni se avanza a `PROC-SCREEN-007`.

---

#### 22. Resultado y continuidad

```text
PROC-SCREEN-005 APROBADA
PROC-SCREEN-006 APROBADA
PROC-SCREEN-007 NO INICIADA
```

La continuidad documental pasa exclusivamente a:

```text
PROC-SCREEN-007 — Clasificar pantalla de supervisión
```


### ✅ PROC-SCREEN-007 — Clasificar pantalla de supervisión

**Estado:** APROBADA

**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal

**Marcador exacto que reemplaza:** `### [ ] PROC-SCREEN-007 — Clasificar pantalla de supervisión`

**Tarea anterior:** `PROC-SCREEN-006 — Clasificar pantalla administrativa` — APROBADA

**Siguiente tarea reservada:** `PROC-SCREEN-008 — Clasificar pantalla de configuración` — NO INICIADA

**Artefactos lógicos contenidos en esta tarea:**

- `SCREEN-SUPERVISION-CLASSIFICATION-CONTRACT-001`;
- `SCREEN-SUPERVISION-PATTERN-VOCABULARY-001`;
- `SCREEN-SUPERVISION-CLASSIFICATION-REGISTER-001`;
- `SCREEN-SUPERVISION-COVERAGE-MATRIX-001`;
- `SCREEN-SUPERVISION-DRILLDOWN-CONTRACT-001`;
- `SCREEN-SUPERVISION-CLASSIFICATION-CHANGE-POLICY-001`;
- `SCREEN-SUPERVISION-CLASSIFICATION-VALIDATION-GATE-001`;
- `SCREEN-SUPERVISION-CARRYOVER-REGISTER-001`.

**Resultado cuantitativo:** **177 pantallas clasificadas**, de las cuales **12** quedan como `PRIMARY_SUPERVISION`, **60** como `SECONDARY_SUPERVISION` y **105** como `OUTSIDE_SUPERVISION_CLASS`; se utilizan **12 patrones de supervisión**, existen **72 pantallas con relevancia de supervisión** y ninguna pantalla recibe simultáneamente dos clases primarias aprobadas.

**Naturaleza:** clasificación documental del grado en que cada pantalla permite vigilar, priorizar, coordinar, controlar o intervenir sobre trabajo de terceros, poblaciones, colas, recursos, compromisos o resultados agregados. No define todavía clasificación de configuración, auditoría, personal o cliente; tampoco define actores, dispositivos, acciones, estados de interfaz, sensibilidad, permisos, rutas u operaciones técnicas.

**Cambios en código de producto, componentes, rutas, repositorios consumidores, Supabase, tablas, migraciones, RLS, RPC, eventos, analítica o producción:** no autorizados por esta tarea.

---

#### 1. Propósito

Distinguir las pantallas cuya intención principal es supervisar trabajo empresarial de aquellas que solo incorporan controles de supervisión secundarios o que no pertenecen a esta clase.

```text
TRABAJO DE TERCEROS O AGREGADO
        +
ESTADO, CARGA, RIESGO O DESVIACION
        +
CAPACIDAD DE PRIORIZAR, ESCALAR O INTERVENIR
        +
DRILL-DOWN TRAZABLE
        =
CLASIFICACION DE SUPERVISION
```

La clasificación responde **si la pantalla permite comprender y conducir trabajo más allá del caso propio de quien la utiliza**. No concede jerarquía, autoridad de aprobación, acceso a datos sensibles ni capacidad de modificar el objeto supervisado.

---

#### 2. Dependencias consumidas

- `PROC-SCREEN-001` y la identidad estable `VSCREEN-*`;
- `PROC-SCREEN-002` y las aplicaciones primarias;
- `PROC-SCREEN-003` y los procesos primarios;
- `PROC-SCREEN-004` y los pasos dominantes;
- `PROC-SCREEN-005` y la clasificación operativa;
- `PROC-SCREEN-006` y la clasificación administrativa;
- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-010`;
- `UX-BASE-001` a `UX-BASE-015`;
- `UX-STATION-001` a `UX-STATION-012`;
- `UX-ADMIN-001` a `UX-ADMIN-005`;
- los contratos aprobados de autorización, contexto, segregación, auditoría, métricas, handoff y recuperación.

La tarea no utiliza títulos jerárquicos, nombres de rol, aplicación o repositorio como sustituto de la intención de supervisión.

---

#### 3. Alcance

1. incorporar `supervision_fit` a las 177 pantallas;
2. distinguir supervisión primaria, supervisión secundaria y ausencia de clase;
3. definir doce patrones de supervisión reutilizables;
4. clasificar cada pantalla mediante población, amplitud, señal, desvío, intervención y drill-down;
5. separar supervisión de operación directa, administración de casos, configuración y auditoría;
6. impedir dos clases primarias simultáneas;
7. conservar controles secundarios dentro de pantallas operativas o administrativas;
8. establecer reglas de frescura, procedencia y navegación hacia el objeto propietario;
9. definir cambio, versionado, validaciones y carryovers;
10. mantener la puerta final de una clase primaria por pantalla en `PROC-SCREEN-011`.

---

#### 4. Exclusiones

Esta tarea no:

- concede autoridad jerárquica;
- define quién puede supervisar;
- asigna ámbitos por empresa, sede, área o territorio;
- convierte cada dashboard o reporte en supervisión;
- convierte cada aprobación en supervisión;
- clasifica formalmente configuración, auditoría, pantallas personales o de cliente;
- define actores, dispositivos, acciones, estados de interfaz o permisos;
- permite modificar directamente fuentes ajenas desde una proyección;
- diseña métricas definitivas;
- vincula APIs, RPC, eventos o tablas;
- mapea rutas o componentes legacy;
- activa AURA.

---

#### 5. Definición canónica de pantalla de supervisión

Una pantalla tiene relevancia de supervisión cuando permite observar y conducir trabajo que excede el caso estrictamente propio del usuario y presenta uno o más de estos elementos:

- varias personas, casos, pedidos, lotes, recursos, ubicaciones o compromisos;
- una cola priorizable;
- carga, capacidad o disponibilidad;
- cumplimiento de tiempos o SLA;
- desvíos, excepciones o riesgos;
- comparación entre resultado esperado y real;
- necesidad de escalar, reasignar, intervenir o solicitar corrección;
- navegación trazable desde el agregado hasta el objeto propietario.

No basta con:

- mostrar indicadores decorativos;
- ser utilizada por un gerente;
- requerir un permiso sensible;
- contener filtros o gráficos;
- listar varios registros;
- aprobar un caso individual;
- consultar un historial;
- pertenecer a VISO o NUMERA;
- llamarse “inicio”, “resumen” o “dashboard”.

La clase primaria exige evidencia conjunta de amplitud o terceros, señal accionable, posibilidad real de intervención y drill-down trazable. Una bandeja propia, un diagnóstico técnico, una guía de ejecución o la publicación de un reporte no cumplen el contrato por el nombre de la superficie.

---

#### 6. Estados de clasificación

| Valor                       | Significado                                                                           | Efecto documental                                              |
| --------------------------- | ------------------------------------------------------------------------------------- | -------------------------------------------------------------- |
| `PRIMARY_SUPERVISION`       | vigilar y conducir trabajo agregado o de terceros es la intención dominante           | reserva `SUPERVISION` como clase primaria                      |
| `SECONDARY_SUPERVISION`     | la pantalla ejecuta o administra trabajo, pero incorpora control supervisor relevante | agrega supervisión secundaria sin reemplazar la clase primaria |
| `OUTSIDE_SUPERVISION_CLASS` | no existe una función supervisora material bajo este contrato                         | continúa hacia las clases posteriores                          |

`SECONDARY_SUPERVISION` no convierte una pantalla operativa o administrativa en dashboard ni autoriza a supervisar.

---

#### 7. Contrato mínimo

| Campo                                | Obligación                                                           |
| ------------------------------------ | -------------------------------------------------------------------- |
| `screen_id`                          | `VSCREEN-*` canónico                                                 |
| `primary_application_id`             | aplicación aprobada                                                  |
| `primary_process_id`                 | proceso aprobado                                                     |
| `primary_process_step_ref`           | paso aprobado                                                        |
| `operational_fit`                    | clasificación aprobada en `PROC-SCREEN-005`                          |
| `administrative_fit`                 | clasificación aprobada en `PROC-SCREEN-006`                          |
| `supervision_fit`                    | uno de los tres estados aprobados                                    |
| `supervision_pattern`                | patrón aprobado o `NONE`                                             |
| `supervision_reason`                 | fundamento verificable                                               |
| `supervision_classification_version` | versión semántica                                                    |
| `supervision_classification_status`  | `CANONICAL`, `CHANGE_PROPOSED`, `SUPERSEDED` o `RETIRED_WITH_SCREEN` |
| `supervision_classification_task`    | tarea que aprobó o modificó la decisión                              |

Valores iniciales:

```text
supervision_classification_version: 1.0.0
supervision_classification_status: CANONICAL
supervision_classification_task: PROC-SCREEN-007
decision_record: INITIAL_SUPERVISION_CLASSIFICATION
```

---

#### 8. SCREEN-SUPERVISION-PATTERN-VOCABULARY-001

| Patrón                     | Uso                                                              |
| -------------------------- | ---------------------------------------------------------------- |
| `SUPERVISION_DASHBOARD`    | consolida señales, carga, desviaciones y prioridades             |
| `SUPERVISION_QUEUE`        | admite, prioriza, distribuye o escala trabajo pendiente          |
| `SUPERVISION_MONITORING`   | sigue casos, recursos o compromisos abiertos                     |
| `SUPERVISION_REVIEW`       | contrasta evidencia antes de continuar o intervenir              |
| `SUPERVISION_CONTROL`      | verifica coherencia, cumplimiento o resultado de un ciclo activo |
| `SUPERVISION_EXCEPTION`    | concentra diferencias, rechazos, retornos o correcciones         |
| `SUPERVISION_CAPACITY`     | equilibra demanda, programación y disponibilidad                 |
| `SUPERVISION_COMPLIANCE`   | vigila controles, obligaciones y hallazgos                       |
| `SUPERVISION_PERFORMANCE`  | evalúa resultados, tendencias y mejora                           |
| `SUPERVISION_RISK`         | vigila exposición, continuidad y tratamientos                    |
| `SUPERVISION_SERVICE`      | coordina atención, SLA, recuperación y escalamiento              |
| `SUPERVISION_COORDINATION` | articula responsables, transferencias y dependencias             |
| `NONE`                     | no existe relevancia de supervisión bajo esta tarea              |

---

#### 9. Algoritmo de decisión

Se clasifica `PRIMARY_SUPERVISION` cuando:

1. la pantalla presenta una población, cola, carga o conjunto de resultados;
2. su propósito dominante es detectar situación, desvío o prioridad;
3. permite orientar intervención, escalamiento, reasignación o seguimiento;
4. conserva drill-down hacia el caso o aplicación propietaria;
5. no ejecuta directamente la mutación principal ni administra el expediente como intención dominante.

Se clasifica `SECONDARY_SUPERVISION` cuando:

1. la pantalla ya es primaria operativa o administrativa;
2. incorpora revisión, control, monitoreo, capacidad, cumplimiento o excepción;
3. la función supervisora es material pero subordinada;
4. suprimir esa función reduciría control, aunque el trabajo principal seguiría existiendo.

Se clasifica `OUTSIDE_SUPERVISION_CLASS` cuando predomina:

- ejecución individual directa;
- administración de un expediente o caso concreto;
- mantenimiento de maestros o reglas;
- auditoría histórica;
- autoservicio personal;
- experiencia de cliente;
- acceso o cuenta transversal sin vigilancia de trabajo empresarial.

---

#### 10. SCREEN-SUPERVISION-CLASSIFICATION-REGISTER-001

| Screen ID      | Pantalla                                              | Aplicación | Paso dominante                                              | Clase operativa             | Clase administrativa           | Clasificación de supervisión | Patrón                     | Fundamento                                                                                                                                                                                                                                                                                      |
| -------------- | ----------------------------------------------------- | ---------- | ----------------------------------------------------------- | --------------------------- | ------------------------------ | ---------------------------- | -------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VSCREEN-0001` | Hub Vento OS                                          | `shell`    | `VPROC-0059::STEP-ENTER_ECOSYSTEM`                          | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Acceso, cuenta, activación técnica o navegación transversal sin vigilancia dominante sobre trabajo empresarial de terceros.                                                                                                                                                                     |
| `VSCREEN-0002` | Inicio de sesión y recuperación                       | `shell`    | `VPROC-0059::STEP-AUTHENTICATE_OR_RECOVER`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Acceso, cuenta, activación técnica o navegación transversal sin vigilancia dominante sobre trabajo empresarial de terceros.                                                                                                                                                                     |
| `VSCREEN-0003` | Resolución de contexto y acceso                       | `shell`    | `VPROC-0059::STEP-RESOLVE_EFFECTIVE_CONTEXT`                | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Acceso, cuenta, activación técnica o navegación transversal sin vigilancia dominante sobre trabajo empresarial de terceros.                                                                                                                                                                     |
| `VSCREEN-0004` | Activación de dispositivo compartido                  | `shell`    | `VPROC-0059::STEP-ACTIVATE_SHARED_DEVICE`                   | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Acceso, cuenta, activación técnica o navegación transversal sin vigilancia dominante sobre trabajo empresarial de terceros.                                                                                                                                                                     |
| `VSCREEN-0005` | Bandeja transversal de tareas y notificaciones | `shell` | `VPROC-0004::STEP-TRIAGE_TRANSVERSAL_WORK` | `SECONDARY_OPERATIONAL` | `SECONDARY_ADMINISTRATIVE` | `OUTSIDE_SUPERVISION_CLASS` | `NONE` | La bandeja personal o transversal no demuestra población ajena, agregado, intervención ni drill-down supervisor. |
| `VSCREEN-0006` | Centro de soporte y diagnóstico | `shell` | `VPROC-0058::STEP-DIAGNOSE_AND_ROUTE_SUPPORT` | `SECONDARY_OPERATIONAL` | `SECONDARY_ADMINISTRATIVE` | `OUTSIDE_SUPERVISION_CLASS` | `NONE` | Diagnostica y deriva soporte; la supervisión de casos de servicio pertenece a una superficie distinta. |
| `VSCREEN-0007` | Inicio ejecutivo y gerencial                          | `viso`     | `VPROC-0001::STEP-REVIEW_EXECUTIVE_WORK`                    | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`        | `SUPERVISION_DASHBOARD`    | La intención dominante consolida señales, carga, desviaciones y prioridades para orientar intervención. La pantalla permite comprender el estado de trabajo ajeno o agregado, detectar desvíos y orientar intervención sin convertirse en el espacio principal de ejecución o backoffice.       |
| `VSCREEN-0008` | Estructura organizativa                               | `viso`     | `VPROC-0002::STEP-MAINTAIN_ORGANIZATIONAL_STRUCTURE`        | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | No existe vigilancia dominante sobre múltiples casos, personas, recursos, compromisos o desviaciones; la pantalla continuará hacia las clases posteriores.                                                                                                                                      |
| `VSCREEN-0009` | Políticas, delegaciones y límites                     | `viso`     | `VPROC-0003::STEP-AUTHOR_POLICIES_AND_LIMITS`               | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La intención dominante es mantener maestros, reglas, políticas o plantillas; la posible clase de configuración se resolverá en PROC-SCREEN-008.                                                                                                                                                 |
| `VSCREEN-0010` | Compromisos y transferencias internas                 | `viso`     | `VPROC-0004::STEP-TRACK_INTERNAL_COMMITMENTS`               | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_COORDINATION` | La pantalla articula responsables, dependencias, transferencias y compromisos, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                    |
| `VSCREEN-0011` | Embudo de candidatos                                  | `viso`     | `VPROC-0005::STEP-TRIAGE_CANDIDATES`                        | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0012` | Caso de selección                                     | `viso`     | `VPROC-0005::STEP-EVALUATE_AND_DECIDE_CANDIDATE`            | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0013` | Vinculación e incorporación                           | `viso`     | `VPROC-0006::STEP-ORCHESTRATE_ONBOARDING`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0014` | Directorio y expediente laboral                       | `viso`     | `VPROC-0006::STEP-MAINTAIN_EMPLOYMENT_RECORD`               | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0015` | Programación laboral                                  | `viso`     | `VPROC-0007::STEP-PLAN_AND_PUBLISH_SCHEDULE`                | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_CAPACITY`     | La pantalla equilibra demanda, capacidad, programación o disponibilidad, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                          |
| `VSCREEN-0016` | Revisión de asistencia                                | `viso`     | `VPROC-0008::STEP-REVIEW_ATTENDANCE_EXCEPTION`              | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`        | `SUPERVISION_REVIEW`       | La intención dominante contrasta evidencia y determina si el trabajo puede continuar o requiere intervención. La pantalla permite comprender el estado de trabajo ajeno o agregado, detectar desvíos y orientar intervención sin convertirse en el espacio principal de ejecución o backoffice. |
| `VSCREEN-0017` | Novedades, ausencias y reemplazos                     | `viso`     | `VPROC-0009::STEP-RESOLVE_WORKFORCE_CASE`                   | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_EXCEPTION`    | La pantalla concentra desvíos, diferencias, rechazos, retornos o correcciones, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                    |
| `VSCREEN-0018` | Retiro y revocación coordinada                        | `viso`     | `VPROC-0011::STEP-CLOSE_EMPLOYMENT_AND_REVOKE`              | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0019` | Catálogo de roles y permisos                          | `viso`     | `VPROC-0059::STEP-MAINTAIN_ACCESS_CATALOG`                  | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La intención dominante es mantener maestros, reglas, políticas o plantillas; la posible clase de configuración se resolverá en PROC-SCREEN-008.                                                                                                                                                 |
| `VSCREEN-0020` | Perfil de acceso del trabajador                       | `viso`     | `VPROC-0059::STEP-ASSIGN_EFFECTIVE_ACCESS`                  | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0021` | Simulación de permisos y conflictos                   | `viso`     | `VPROC-0059::STEP-SIMULATE_ACCESS_DECISION`                 | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_CONTROL`      | La pantalla verifica coherencia, cumplimiento o resultado de un ciclo activo, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                     |
| `VSCREEN-0022` | Gobierno de dispositivos compartidos                  | `viso`     | `VPROC-0059::STEP-GOVERN_SHARED_DEVICES`                    | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | No existe vigilancia dominante sobre múltiples casos, personas, recursos, compromisos o desviaciones; la pantalla continuará hacia las clases posteriores.                                                                                                                                      |
| `VSCREEN-0023` | Riesgos de seguridad y salud                          | `viso`     | `VPROC-0012::STEP-ASSESS_SST_RISK`                          | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_RISK`         | La pantalla vigila exposición, continuidad y tratamientos de riesgo, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                              |
| `VSCREEN-0024` | Incidentes y emergencias                              | `viso`     | `VPROC-0013::STEP-MANAGE_INCIDENT_RESPONSE`                 | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_EXCEPTION`    | La pantalla concentra desvíos, diferencias, rechazos, retornos o correcciones, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                    |
| `VSCREEN-0025` | Controles de higiene y cumplimiento                   | `viso`     | `VPROC-0014::STEP-REVIEW_HYGIENE_COMPLIANCE`                | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`        | `SUPERVISION_COMPLIANCE`   | La intención dominante vigila controles, obligaciones y hallazgos que requieren seguimiento. La pantalla permite comprender el estado de trabajo ajeno o agregado, detectar desvíos y orientar intervención sin convertirse en el espacio principal de ejecución o backoffice.                  |
| `VSCREEN-0026` | Bandeja de casos administrativos transversales        | `viso`     | `VPROC-0004::STEP-TRIAGE_ADMIN_CASES`                       | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_QUEUE`        | La pantalla presenta trabajo pendiente y permite priorizar, distribuir o escalar, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                 |
| `VSCREEN-0027` | Inicio personal del trabajador                        | `anima`    | `VPROC-0007::STEP-ENTER_PERSONAL_WORKSPACE`                 | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Autoservicio personal del trabajador; consulta o registra su propio caso sin supervisar a terceros. Su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                                          |
| `VSCREEN-0028` | Registro de entrada, pausa y salida                   | `anima`    | `VPROC-0008::STEP-CAPTURE_ATTENDANCE_EVENT`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Autoservicio personal del trabajador; consulta o registra su propio caso sin supervisar a terceros. Su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                                          |
| `VSCREEN-0029` | Mi programación                                       | `anima`    | `VPROC-0007::STEP-CONSULT_PUBLISHED_SCHEDULE`               | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Autoservicio personal del trabajador; consulta o registra su propio caso sin supervisar a terceros. Su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                                          |
| `VSCREEN-0030` | Mi asistencia y solicitud de corrección               | `anima`    | `VPROC-0008::STEP-CONSULT_OR_REQUEST_ATTENDANCE_CORRECTION` | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Autoservicio personal del trabajador; consulta o registra su propio caso sin supervisar a terceros. Su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                                          |
| `VSCREEN-0031` | Mis novedades, permisos y ausencias                   | `anima`    | `VPROC-0009::STEP-SUBMIT_PERSONAL_WORKFORCE_CASE`           | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Autoservicio personal del trabajador; consulta o registra su propio caso sin supervisar a terceros. Su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                                          |
| `VSCREEN-0032` | Mi perfil laboral                                     | `anima`    | `VPROC-0006::STEP-MAINTAIN_SELF_SERVICE_PROFILE`            | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Autoservicio personal del trabajador; consulta o registra su propio caso sin supervisar a terceros. Su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                                          |
| `VSCREEN-0033` | Resumen de inventario y abastecimiento interno        | `nexo`     | `VPROC-0028::STEP-MONITOR_INTERNAL_SUPPLY`                  | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`        | `SUPERVISION_DASHBOARD`    | La intención dominante consolida señales, carga, desviaciones y prioridades para orientar intervención. La pantalla permite comprender el estado de trabajo ajeno o agregado, detectar desvíos y orientar intervención sin convertirse en el espacio principal de ejecución o backoffice.       |
| `VSCREEN-0034` | Catálogo de productos físicos                         | `nexo`     | `VPROC-0015::STEP-CONSULT_PHYSICAL_PRODUCT_CATALOG`         | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La intención dominante es mantener maestros, reglas, políticas o plantillas; la posible clase de configuración se resolverá en PROC-SCREEN-008.                                                                                                                                                 |
| `VSCREEN-0035` | Editor de producto, unidad y presentación             | `nexo`     | `VPROC-0015::STEP-MAINTAIN_PRODUCT_PRESENTATION`            | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La intención dominante es mantener maestros, reglas, políticas o plantillas; la posible clase de configuración se resolverá en PROC-SCREEN-008.                                                                                                                                                 |
| `VSCREEN-0036` | Especificaciones y criterios de calidad               | `nexo`     | `VPROC-0018::STEP-MAINTAIN_QUALITY_SPECIFICATION`           | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | No existe vigilancia dominante sobre múltiples casos, personas, recursos, compromisos o desviaciones; la pantalla continuará hacia las clases posteriores.                                                                                                                                      |
| `VSCREEN-0037` | Catálogo de ubicaciones                               | `nexo`     | `VPROC-0023::STEP-MAINTAIN_LOCATION_CATALOG`                | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La intención dominante es mantener maestros, reglas, políticas o plantillas; la posible clase de configuración se resolverá en PROC-SCREEN-008.                                                                                                                                                 |
| `VSCREEN-0038` | Identificación y detalle de ubicación | `nexo` | `VPROC-0023::STEP-IDENTIFY_LOCATION_AND_CONTENT` | `PRIMARY_OPERATIONAL` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `NONE` | No existe vigilancia dominante sobre múltiples casos, personas, recursos, compromisos o desviaciones; la pantalla continuará hacia las clases posteriores. |
| `VSCREEN-0039` | Consulta de existencias                               | `nexo`     | `VPROC-0024::STEP-CONSULT_STOCK_POSITION`                   | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `PRIMARY_SUPERVISION`        | `SUPERVISION_MONITORING`   | La intención dominante sigue casos, recursos o compromisos todavía abiertos. La pantalla permite comprender el estado de trabajo ajeno o agregado, detectar desvíos y orientar intervención sin convertirse en el espacio principal de ejecución o backoffice.                                  |
| `VSCREEN-0040` | Conteo de inventario                                  | `nexo`     | `VPROC-0026::STEP-CAPTURE_PHYSICAL_COUNT`                   | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0041` | Revisión de conteo y diferencias                      | `nexo`     | `VPROC-0026::STEP-REVIEW_COUNT_VARIANCE`                    | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`      | `SUPERVISION_REVIEW`       | La pantalla contrasta evidencia y determina si el trabajo puede continuar o requiere intervención, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                |
| `VSCREEN-0042` | Caso de ajuste de inventario                          | `nexo`     | `VPROC-0026::STEP-DECIDE_INVENTORY_ADJUSTMENT`              | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`      | `SUPERVISION_EXCEPTION`    | La pantalla concentra desvíos, diferencias, rechazos, retornos o correcciones, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                    |
| `VSCREEN-0043` | Confirmación de entrada a inventario                  | `nexo`     | `VPROC-0024::STEP-CONFIRM_STOCK_ENTRY`                      | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0044` | Retiro y consumo de existencias                       | `nexo`     | `VPROC-0025::STEP-EXECUTE_STOCK_WITHDRAWAL`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0045` | Traslado interno de existencias                       | `nexo`     | `VPROC-0025::STEP-EXECUTE_INTERNAL_TRANSFER`                | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0046` | Solicitud de remisión                                 | `nexo`     | `VPROC-0028::STEP-SUBMIT_REPLENISHMENT_REQUEST`             | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0047` | Preparación de remisión                               | `nexo`     | `VPROC-0028::STEP-PREPARE_REPLENISHMENT`                    | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0048` | Carga y despacho de remisión                          | `nexo`     | `VPROC-0028::STEP-LOAD_AND_DISPATCH_REPLENISHMENT`          | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0049` | Seguimiento de remisión en tránsito                   | `nexo`     | `VPROC-0028::STEP-MONITOR_REPLENISHMENT_TRANSIT`            | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`      | `SUPERVISION_MONITORING`   | La pantalla sigue casos, recursos o compromisos todavía abiertos, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                                 |
| `VSCREEN-0050` | Recepción de remisión                                 | `nexo`     | `VPROC-0028::STEP-RECEIVE_REPLENISHMENT`                    | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`      | `SUPERVISION_CONTROL`      | La pantalla verifica coherencia, cumplimiento o resultado de un ciclo activo, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                     |
| `VSCREEN-0051` | Vencimiento, cuarentena, daño y merma                 | `nexo`     | `VPROC-0027::STEP-RESOLVE_STOCK_CONDITION`                  | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`      | `SUPERVISION_EXCEPTION`    | La pantalla concentra desvíos, diferencias, rechazos, retornos o correcciones, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                    |
| `VSCREEN-0052` | LPN, contenedores y reutilizables                     | `nexo`     | `VPROC-0032::STEP-MANAGE_LPN_AND_REUSABLES`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0053` | Activos y custodia                                    | `nexo`     | `VPROC-0029::STEP-MANAGE_ASSET_CUSTODY`                     | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`      | `SUPERVISION_MONITORING`   | La pantalla sigue casos, recursos o compromisos todavía abiertos, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                                 |
| `VSCREEN-0054` | Etiquetas e impresión logística                       | `nexo`     | `VPROC-0024::STEP-ISSUE_LOGISTICS_LABEL`                    | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0055` | Inicio y cola de producción                           | `fogo`     | `VPROC-0033::STEP-TRIAGE_PRODUCTION_QUEUE`                  | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`        | `SUPERVISION_QUEUE`        | La intención dominante presenta trabajo pendiente y permite priorizar, distribuir o escalar. La pantalla permite comprender el estado de trabajo ajeno o agregado, detectar desvíos y orientar intervención sin convertirse en el espacio principal de ejecución o backoffice.                  |
| `VSCREEN-0056` | Planeación de producción                              | `fogo`     | `VPROC-0033::STEP-PLAN_PRODUCTION`                          | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`        | `SUPERVISION_CAPACITY`     | La intención dominante equilibra demanda, capacidad, programación o disponibilidad. La pantalla permite comprender el estado de trabajo ajeno o agregado, detectar desvíos y orientar intervención sin convertirse en el espacio principal de ejecución o backoffice.                           |
| `VSCREEN-0057` | Preparación e inicio de lote                          | `fogo`     | `VPROC-0034::STEP-PREPARE_AND_START_BATCH`                  | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0058` | Ejecución de lote                                     | `fogo`     | `VPROC-0034::STEP-EXECUTE_BATCH`                            | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0059` | Registro parcial de producción                        | `fogo`     | `VPROC-0034::STEP-CAPTURE_BATCH_PROGRESS`                   | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`      | `SUPERVISION_MONITORING`   | La pantalla sigue casos, recursos o compromisos todavía abiertos, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                                 |
| `VSCREEN-0060` | Finalización y cierre de lote                         | `fogo`     | `VPROC-0037::STEP-CLOSE_BATCH`                              | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`      | `SUPERVISION_PERFORMANCE`  | La pantalla evalúa resultados, tendencias, variaciones y planes de mejora, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                        |
| `VSCREEN-0061` | Receta operativa | `fogo` | `VPROC-0016::STEP-CONSULT_APPLICABLE_RECIPE` | `PRIMARY_OPERATIONAL` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `NONE` | Guía la ejecución del lote activo; no vigila una población, cola o resultado agregado. |
| `VSCREEN-0062` | Catálogo y editor de recetas                          | `fogo`     | `VPROC-0016::STEP-AUTHOR_RECIPE`                            | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La intención dominante es mantener maestros, reglas, políticas o plantillas; la posible clase de configuración se resolverá en PROC-SCREEN-008.                                                                                                                                                 |
| `VSCREEN-0063` | Revisión, aprobación y publicación de receta          | `fogo`     | `VPROC-0016::STEP-APPROVE_AND_PUBLISH_RECIPE`               | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | No existe vigilancia dominante sobre múltiples casos, personas, recursos, compromisos o desviaciones; la pantalla continuará hacia las clases posteriores.                                                                                                                                      |
| `VSCREEN-0064` | Prueba de receta y rendimiento                        | `fogo`     | `VPROC-0016::STEP-TEST_RECIPE_AND_YIELD`                    | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`      | `SUPERVISION_REVIEW`       | La pantalla contrasta evidencia y determina si el trabajo puede continuar o requiere intervención, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                |
| `VSCREEN-0065` | Control de calidad y liberación                       | `fogo`     | `VPROC-0035::STEP-DECIDE_QUALITY_RELEASE`                   | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`      | `SUPERVISION_CONTROL`      | La pantalla verifica coherencia, cumplimiento o resultado de un ciclo activo, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                     |
| `VSCREEN-0066` | Empaque, etiquetado y almacenamiento de terminado     | `fogo`     | `VPROC-0036::STEP-PACK_AND_TRANSFER_FINISHED_GOOD`          | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0067` | Reproceso, aprovechamiento, merma y cierre productivo | `fogo`     | `VPROC-0037::STEP-RESOLVE_PRODUCTION_DISPOSITION`           | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`      | `SUPERVISION_EXCEPTION`    | La pantalla concentra desvíos, diferencias, rechazos, retornos o correcciones, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                    |
| `VSCREEN-0068` | Bandeja de necesidades de compra                      | `origo`    | `VPROC-0019::STEP-TRIAGE_PURCHASE_NEEDS`                    | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_QUEUE`        | La pantalla presenta trabajo pendiente y permite priorizar, distribuir o escalar, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                 |
| `VSCREEN-0069` | Solicitud de compra                                   | `origo`    | `VPROC-0019::STEP-SUBMIT_PURCHASE_REQUEST`                  | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0070` | Catálogo de proveedores                               | `origo`    | `VPROC-0020::STEP-CONSULT_SUPPLIER_CATALOG`                 | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La intención dominante es mantener maestros, reglas, políticas o plantillas; la posible clase de configuración se resolverá en PROC-SCREEN-008.                                                                                                                                                 |
| `VSCREEN-0071` | Alta y expediente de proveedor                        | `origo`    | `VPROC-0020::STEP-ONBOARD_SUPPLIER`                         | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0072` | Comparación de cotizaciones                           | `origo`    | `VPROC-0020::STEP-COMPARE_QUOTES`                           | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0073` | Editor de orden de compra                             | `origo`    | `VPROC-0021::STEP-PREPARE_PURCHASE_ORDER`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La intención dominante es mantener maestros, reglas, políticas o plantillas; la posible clase de configuración se resolverá en PROC-SCREEN-008.                                                                                                                                                 |
| `VSCREEN-0074` | Bandeja de aprobaciones de compra                     | `origo`    | `VPROC-0021::STEP-APPROVE_PURCHASE`                         | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_REVIEW`       | La pantalla contrasta evidencia y determina si el trabajo puede continuar o requiere intervención, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                |
| `VSCREEN-0075` | Detalle y seguimiento de orden                        | `origo`    | `VPROC-0021::STEP-MONITOR_PURCHASE_ORDER`                   | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_MONITORING`   | La pantalla sigue casos, recursos o compromisos todavía abiertos, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                                 |
| `VSCREEN-0076` | Cola de recepciones                                   | `origo`    | `VPROC-0022::STEP-TRIAGE_RECEIPT_QUEUE`                     | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`        | `SUPERVISION_QUEUE`        | La intención dominante presenta trabajo pendiente y permite priorizar, distribuir o escalar. La pantalla permite comprender el estado de trabajo ajeno o agregado, detectar desvíos y orientar intervención sin convertirse en el espacio principal de ejecución o backoffice.                  |
| `VSCREEN-0077` | Recepción total o parcial                             | `origo`    | `VPROC-0022::STEP-RECEIVE_PURCHASE`                         | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`      | `SUPERVISION_CONTROL`      | La pantalla verifica coherencia, cumplimiento o resultado de un ciclo activo, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                     |
| `VSCREEN-0078` | Resolución de diferencias de recepción                | `origo`    | `VPROC-0022::STEP-RESOLVE_RECEIPT_VARIANCE`                 | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`      | `SUPERVISION_EXCEPTION`    | La pantalla concentra desvíos, diferencias, rechazos, retornos o correcciones, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                    |
| `VSCREEN-0079` | Historial y auditoría de abastecimiento               | `origo`    | `VPROC-0022::STEP-AUDIT_PROCUREMENT_CYCLE`                  | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La intención dominante es reconstrucción histórica, evidencia o auditoría; la clase correspondiente se resolverá en PROC-SCREEN-009.                                                                                                                                                            |
| `VSCREEN-0080` | Inicio POS | `pulso` | `VPROC-0039::STEP-ENTER_POS_WORKSPACE` | `PRIMARY_OPERATIONAL` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION` | `SUPERVISION_DASHBOARD` | Puede mostrar señales de la estación como apoyo, pero su intención primaria es entrar al trabajo operativo vivo. |
| `VSCREEN-0081` | Creación de venta o pedido                            | `pulso`    | `VPROC-0039::STEP-CREATE_SALE_OR_ORDER`                     | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0082` | Mapa de salón y mesas                                 | `pulso`    | `VPROC-0038::STEP-MANAGE_TABLE_SERVICE`                     | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`      | `SUPERVISION_MONITORING`   | La pantalla sigue casos, recursos o compromisos todavía abiertos, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                                 |
| `VSCREEN-0083` | Detalle y modificación de pedido                      | `pulso`    | `VPROC-0038::STEP-MODIFY_ACTIVE_ORDER`                      | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0084` | Cobro y medios de pago                                | `pulso`    | `VPROC-0043::STEP-COLLECT_PAYMENT`                          | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0085` | Identificación de cliente y acumulación               | `pulso`    | `VPROC-0045::STEP-IDENTIFY_CUSTOMER_AND_ACCRUE`             | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0086` | Redención de puntos o beneficios                      | `pulso`    | `VPROC-0045::STEP-REDEEM_LOYALTY_VALUE`                     | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0087` | Bandeja de pedidos de canales externos                | `pulso`    | `VPROC-0040::STEP-ADMIT_EXTERNAL_ORDER`                     | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`      | `SUPERVISION_QUEUE`        | La pantalla presenta trabajo pendiente y permite priorizar, distribuir o escalar, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                 |
| `VSCREEN-0088` | Seguimiento de preparación y entrega                  | `pulso`    | `VPROC-0039::STEP-MONITOR_ORDER_FULFILLMENT`                | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`      | `SUPERVISION_MONITORING`   | La pantalla sigue casos, recursos o compromisos todavía abiertos, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                                 |
| `VSCREEN-0089` | Apertura de caja                                      | `pulso`    | `VPROC-0044::STEP-OPEN_CASH_SESSION`                        | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0090` | Cierre de caja                                        | `pulso`    | `VPROC-0044::STEP-CLOSE_CASH_SESSION`                       | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`      | `SUPERVISION_REVIEW`       | La pantalla contrasta evidencia y determina si el trabajo puede continuar o requiere intervención, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                |
| `VSCREEN-0091` | Anulación, devolución y reembolso                     | `pulso`    | `VPROC-0042::STEP-RESOLVE_REVERSAL_OR_REFUND`               | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`      | `SUPERVISION_EXCEPTION`    | La pantalla concentra desvíos, diferencias, rechazos, retornos o correcciones, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                    |
| `VSCREEN-0092` | Oferta, menú, precio comercial y disponibilidad       | `pulso`    | `VPROC-0017::STEP-PUBLISH_COMMERCIAL_OFFER`                 | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | No existe vigilancia dominante sobre múltiples casos, personas, recursos, compromisos o desviaciones; la pantalla continuará hacia las clases posteriores.                                                                                                                                      |
| `VSCREEN-0093` | Revisión de ventas, caja y terminales                 | `pulso`    | `VPROC-0044::STEP-REVIEW_SALES_AND_TERMINALS`               | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`        | `SUPERVISION_CONTROL`      | La intención dominante verifica coherencia, cumplimiento o resultado de un ciclo activo. La pantalla permite comprender el estado de trabajo ajeno o agregado, detectar desvíos y orientar intervención sin convertirse en el espacio principal de ejecución o backoffice.                      |
| `VSCREEN-0094` | Inicio financiero y ejecutivo                         | `numera`   | `VPROC-0061::STEP-REVIEW_FINANCIAL_POSITION`                | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`        | `SUPERVISION_DASHBOARD`    | La intención dominante consolida señales, carga, desviaciones y prioridades para orientar intervención. La pantalla permite comprender el estado de trabajo ajeno o agregado, detectar desvíos y orientar intervención sin convertirse en el espacio principal de ejecución o backoffice.       |
| `VSCREEN-0095` | Bandeja de hechos económicos                          | `numera`   | `VPROC-0051::STEP-TRIAGE_ECONOMIC_FACTS`                    | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0096` | Registro de gasto y soporte                           | `numera`   | `VPROC-0051::STEP-CAPTURE_EXPENSE_AND_EVIDENCE`             | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0097` | Bandeja de aprobaciones financieras                   | `numera`   | `VPROC-0052::STEP-APPROVE_FINANCIAL_DECISION`               | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_REVIEW`       | La pantalla contrasta evidencia y determina si el trabajo puede continuar o requiere intervención, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                |
| `VSCREEN-0098` | Cuentas por pagar y obligaciones                      | `numera`   | `VPROC-0052::STEP-MANAGE_PAYABLE_OBLIGATION`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0099` | Cuentas por cobrar y cartera                          | `numera`   | `VPROC-0053::STEP-MANAGE_RECEIVABLE`                        | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0100` | Caja, bancos y movimientos financieros                | `numera`   | `VPROC-0052::STEP-EXECUTE_TREASURY_MOVEMENT`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0101` | Conciliación de ventas y pagos                        | `numera`   | `VPROC-0051::STEP-RECONCILE_SALES_AND_PAYMENTS`             | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_CONTROL`      | La pantalla verifica coherencia, cumplimiento o resultado de un ciclo activo, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                     |
| `VSCREEN-0102` | Conciliación de compras y recepciones                 | `numera`   | `VPROC-0051::STEP-RECONCILE_PURCHASES_AND_RECEIPTS`         | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_CONTROL`      | La pantalla verifica coherencia, cumplimiento o resultado de un ciclo activo, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                     |
| `VSCREEN-0103` | Conciliación de inventario, producción y variaciones  | `numera`   | `VPROC-0054::STEP-RECONCILE_OPERATING_VARIANCES`            | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_CONTROL`      | La pantalla verifica coherencia, cumplimiento o resultado de un ciclo activo, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                     |
| `VSCREEN-0104` | Costos, rentabilidad y escenarios                     | `numera`   | `VPROC-0054::STEP-ANALYZE_COST_AND_PROFITABILITY`           | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_PERFORMANCE`  | La pantalla evalúa resultados, tendencias, variaciones y planes de mejora, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                        |
| `VSCREEN-0105` | Cierre, reapertura y corrección de periodo            | `numera`   | `VPROC-0054::STEP-CLOSE_OR_REOPEN_PERIOD`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_CONTROL`      | La pantalla verifica coherencia, cumplimiento o resultado de un ciclo activo, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                     |
| `VSCREEN-0106` | Reportes y exportaciones financieras | `numera` | `VPROC-0061::STEP-PUBLISH_FINANCIAL_REPORT` | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE` | `OUTSIDE_SUPERVISION_CLASS` | `NONE` | Publica evidencia financiera; su clasificación primaria especializada se reserva para auditoría en PROC-SCREEN-009. |
| `VSCREEN-0107` | Inicio del cliente y resumen de beneficios            | `pass`     | `VPROC-0045::STEP-ENTER_LOYALTY_HOME`                       | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0108` | QR personal de identificación                         | `pass`     | `VPROC-0045::STEP-PRESENT_CUSTOMER_ID`                      | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0109` | Catálogo de beneficios y recompensas                  | `pass`     | `VPROC-0045::STEP-CONSULT_REWARDS_CATALOG`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0110` | Ticket o QR de redención                              | `pass`     | `VPROC-0045::STEP-CREATE_REDEMPTION_INTENT`                 | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0111` | Historial de puntos y redenciones                     | `pass`     | `VPROC-0045::STEP-AUDIT_PERSONAL_LOYALTY_LEDGER`            | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0112` | Perfil, privacidad y consentimientos                  | `pass`     | `VPROC-0045::STEP-MAINTAIN_CUSTOMER_PROFILE_AND_CONSENT`    | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0113` | Registro y seguimiento de decisiones empresariales    | `viso`     | `VPROC-0001::STEP-RECORD_AND_TRACK_DECISION`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_MONITORING`   | La pantalla sigue casos, recursos o compromisos todavía abiertos, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                                 |
| `VSCREEN-0114` | Solicitudes y certificaciones de acceso               | `viso`     | `VPROC-0059::STEP-REVIEW_AND_CERTIFY_ACCESS`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_QUEUE`        | La pantalla presenta trabajo pendiente y permite priorizar, distribuir o escalar, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                 |
| `VSCREEN-0115` | Gobierno de documentos y evidencia                    | `viso`     | `VPROC-0060::STEP-GOVERN_DOCUMENT_EVIDENCE`                 | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0116` | Registro de riesgos empresariales                     | `viso`     | `VPROC-0063::STEP-ASSESS_ENTERPRISE_RISK`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_RISK`         | La pantalla vigila exposición, continuidad y tratamientos de riesgo, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                              |
| `VSCREEN-0117` | Requerimientos de asesores y autoridades              | `viso`     | `VPROC-0064::STEP-MANAGE_EXTERNAL_REQUIREMENT`              | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_COMPLIANCE`   | La pantalla vigila controles, obligaciones y hallazgos que requieren seguimiento, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                 |
| `VSCREEN-0118` | Gestión de desempeño y desarrollo                     | `viso`     | `VPROC-0065::STEP-REVIEW_PERFORMANCE_AND_DEVELOPMENT`       | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_PERFORMANCE`  | La pantalla evalúa resultados, tendencias, variaciones y planes de mejora, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                        |
| `VSCREEN-0119` | Asignación y control de elementos de protección       | `viso`     | `VPROC-0066::STEP-ASSIGN_PROTECTIVE_EQUIPMENT`              | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_COMPLIANCE`   | La pantalla vigila controles, obligaciones y hallazgos que requieren seguimiento, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                 |
| `VSCREEN-0120` | Mesa de servicio tecnológico                          | `viso`     | `VPROC-0058::STEP-RESOLVE_TECH_SERVICE_CASE`                | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_SERVICE`      | La pantalla coordina diagnóstico, atención, SLA, recuperación y escalamiento, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                     |
| `VSCREEN-0121` | Continuidad, contingencia y recuperación              | `viso`     | `VPROC-0062::STEP-ACTIVATE_AND_RECOVER_CONTINUITY`          | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_RISK`         | La pantalla vigila exposición, continuidad y tratamientos de riesgo, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                              |
| `VSCREEN-0122` | Privacidad, cumplimiento y conservación               | `viso`     | `VPROC-0060::STEP-GOVERN_PRIVACY_AND_RETENTION`             | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_COMPLIANCE`   | La pantalla vigila controles, obligaciones y hallazgos que requieren seguimiento, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                 |
| `VSCREEN-0123` | Gestión de comunicaciones internas                    | `viso`     | `VPROC-0004::STEP-PUBLISH_INTERNAL_COMMUNICATION`           | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0124` | Mis comunicados laborales                             | `anima`    | `VPROC-0004::STEP-CONSULT_AND_ACKNOWLEDGE_COMMUNICATION`    | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Autoservicio personal del trabajador; consulta o registra su propio caso sin supervisar a terceros. Su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                                          |
| `VSCREEN-0125` | Mi carnet laboral                                     | `anima`    | `VPROC-0006::STEP-PRESENT_EMPLOYEE_CREDENTIAL`              | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Autoservicio personal del trabajador; consulta o registra su propio caso sin supervisar a terceros. Su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                                          |
| `VSCREEN-0126` | Mis documentos laborales                              | `anima`    | `VPROC-0060::STEP-CONSULT_OR_SUBMIT_EMPLOYMENT_DOCUMENT`    | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Autoservicio personal del trabajador; consulta o registra su propio caso sin supervisar a terceros. Su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                                          |
| `VSCREEN-0127` | Mi capacitación                                       | `anima`    | `VPROC-0065::STEP-COMPLETE_ASSIGNED_TRAINING`               | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Autoservicio personal del trabajador; consulta o registra su propio caso sin supervisar a terceros. Su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                                          |
| `VSCREEN-0128` | Mis objetivos y retroalimentación                     | `anima`    | `VPROC-0065::STEP-REVIEW_PERSONAL_OBJECTIVES`               | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Autoservicio personal del trabajador; consulta o registra su propio caso sin supervisar a terceros. Su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                                          |
| `VSCREEN-0129` | Mis solicitudes de soporte                            | `anima`    | `VPROC-0058::STEP-SUBMIT_AND_TRACK_SUPPORT_REQUEST`         | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Autoservicio personal del trabajador; consulta o registra su propio caso sin supervisar a terceros. Su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                                          |
| `VSCREEN-0130` | Mis reportes de seguridad y salud                     | `anima`    | `VPROC-0013::STEP-REPORT_SST_EVENT`                         | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Autoservicio personal del trabajador; consulta o registra su propio caso sin supervisar a terceros. Su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                                          |
| `VSCREEN-0131` | Mis elementos de protección                           | `anima`    | `VPROC-0066::STEP-ACKNOWLEDGE_PROTECTIVE_EQUIPMENT`         | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Autoservicio personal del trabajador; consulta o registra su propio caso sin supervisar a terceros. Su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                                          |
| `VSCREEN-0132` | Reservas de inventario                                | `nexo`     | `VPROC-0028::STEP-RESERVE_STOCK`                            | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0133` | Planes y órdenes de mantenimiento de activos          | `nexo`     | `VPROC-0030::STEP-PLAN_AND_EXECUTE_ASSET_MAINTENANCE`       | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`      | `SUPERVISION_CAPACITY`     | La pantalla equilibra demanda, capacidad, programación o disponibilidad, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                          |
| `VSCREEN-0134` | Garantías, seguros y reclamaciones de activos         | `nexo`     | `VPROC-0030::STEP-MANAGE_ASSET_CLAIM`                       | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_EXCEPTION`    | La pantalla concentra desvíos, diferencias, rechazos, retornos o correcciones, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                    |
| `VSCREEN-0135` | Instancias y operación de kits                                      | `nexo`     | `VPROC-0067::STEP-ASSEMBLE_AND_CONTROL_KIT`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0136` | Flota y vehículos                                     | `nexo`     | `VPROC-0031::STEP-MANAGE_FLEET_ASSET`                       | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_CAPACITY`     | La pantalla equilibra demanda, capacidad, programación o disponibilidad, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                          |
| `VSCREEN-0137` | Kilometraje y combustible                             | `nexo`     | `VPROC-0031::STEP-CAPTURE_MILEAGE_AND_FUEL`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0138` | Planeación de rutas y despachos                       | `nexo`     | `VPROC-0048::STEP-PLAN_ROUTE_AND_DISPATCH`                  | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`      | `SUPERVISION_CAPACITY`     | La pantalla equilibra demanda, capacidad, programación o disponibilidad, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                          |
| `VSCREEN-0139` | Ejecución de ruta y prueba de entrega                 | `nexo`     | `VPROC-0049::STEP-EXECUTE_ROUTE_AND_PROVE_DELIVERY`         | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`      | `SUPERVISION_MONITORING`   | La pantalla sigue casos, recursos o compromisos todavía abiertos, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                                 |
| `VSCREEN-0140` | Novedades, rechazos y retornos logísticos             | `nexo`     | `VPROC-0049::STEP-RESOLVE_LOGISTICS_EXCEPTION`              | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`      | `SUPERVISION_EXCEPTION`    | La pantalla concentra desvíos, diferencias, rechazos, retornos o correcciones, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                    |
| `VSCREEN-0141` | Instalaciones, servicios y mantenimiento locativo     | `nexo`     | `VPROC-0055::STEP-MANAGE_FACILITY_SERVICE`                  | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`      | `SUPERVISION_MONITORING`   | La pantalla sigue casos, recursos o compromisos todavía abiertos, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                                 |
| `VSCREEN-0142` | Configuración de políticas y rutas logísticas         | `nexo`     | `VPROC-0048::STEP-CONFIGURE_LOGISTICS_POLICY`               | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La intención dominante es mantener maestros, reglas, políticas o plantillas; la posible clase de configuración se resolverá en PROC-SCREEN-008.                                                                                                                                                 |
| `VSCREEN-0143` | Diseñador de etiquetas logísticas                     | `nexo`     | `VPROC-0015::STEP-AUTHOR_LOGISTICS_LABEL_TEMPLATE`          | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La intención dominante es mantener maestros, reglas, políticas o plantillas; la posible clase de configuración se resolverá en PROC-SCREEN-008.                                                                                                                                                 |
| `VSCREEN-0144` | Cola y trabajos de impresión logística | `nexo` | `VPROC-0024::STEP-OPERATE_PRINT_QUEUE` | `PRIMARY_OPERATIONAL` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `NONE` | Opera trabajos de impresión; no configura el recurso ni supervisa una población agregada. |
| `VSCREEN-0145` | Contratos, precios y condiciones de proveedor         | `origo`    | `VPROC-0020::STEP-GOVERN_SUPPLIER_TERMS`                    | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0146` | Desempeño y reclamaciones de proveedor                | `origo`    | `VPROC-0020::STEP-REVIEW_SUPPLIER_PERFORMANCE`              | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_PERFORMANCE`  | La pantalla evalúa resultados, tendencias, variaciones y planes de mejora, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                        |
| `VSCREEN-0147` | Oportunidades y cotizaciones de catering o B2B        | `pulso`    | `VPROC-0041::STEP-QUALIFY_B2B_OPPORTUNITY`                  | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0148` | Ejecución de catering o venta B2B                     | `pulso`    | `VPROC-0041::STEP-EXECUTE_B2B_COMMITMENT`                   | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`      | `SUPERVISION_MONITORING`   | La pantalla sigue casos, recursos o compromisos todavía abiertos, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                                 |
| `VSCREEN-0149` | Operación de reservas y eventos                       | `pulso`    | `VPROC-0047::STEP-MANAGE_RESERVATION_OR_EVENT`              | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`      | `SUPERVISION_CAPACITY`     | La pantalla equilibra demanda, capacidad, programación o disponibilidad, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                          |
| `VSCREEN-0150` | Casos de reclamo y compensación                       | `pulso`    | `VPROC-0046::STEP-RESOLVE_CUSTOMER_CLAIM`                   | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`      | `SUPERVISION_EXCEPTION`    | La pantalla concentra desvíos, diferencias, rechazos, retornos o correcciones, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                    |
| `VSCREEN-0151` | Coordinación de entrega mediante tercero              | `pulso`    | `VPROC-0050::STEP-COORDINATE_THIRD_PARTY_DELIVERY`          | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`      | `SUPERVISION_MONITORING`   | La pantalla sigue casos, recursos o compromisos todavía abiertos, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                                 |
| `VSCREEN-0152` | Análisis de satisfacción y servicio                   | `pulso`    | `VPROC-0068::STEP-ANALYZE_SERVICE_SATISFACTION`             | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`        | `SUPERVISION_PERFORMANCE`  | La intención dominante evalúa resultados, tendencias, variaciones y planes de mejora. La pantalla permite comprender el estado de trabajo ajeno o agregado, detectar desvíos y orientar intervención sin convertirse en el espacio principal de ejecución o backoffice.                         |
| `VSCREEN-0153` | Paquete laboral para pagos y beneficios               | `numera`   | `VPROC-0010::STEP-PREPARE_LABOR_PAYMENT_PACKAGE`            | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0154` | Facturas y documentos fiscales                        | `numera`   | `VPROC-0051::STEP-MANAGE_FISCAL_DOCUMENT`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0155` | Tesorería y programación de pagos                     | `numera`   | `VPROC-0052::STEP-PLAN_AND_EXECUTE_PAYMENTS`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_CAPACITY`     | La pantalla equilibra demanda, capacidad, programación o disponibilidad, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                          |
| `VSCREEN-0156` | Presupuestos, escenarios y forecast                   | `numera`   | `VPROC-0069::STEP-PLAN_BUDGET_AND_FORECAST`                 | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_PERFORMANCE`  | La pantalla evalúa resultados, tendencias, variaciones y planes de mejora, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                        |
| `VSCREEN-0157` | Impuestos y obligaciones de cumplimiento              | `numera`   | `VPROC-0052::STEP-MANAGE_TAX_OBLIGATION`                    | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_COMPLIANCE`   | La pantalla vigila controles, obligaciones y hallazgos que requieren seguimiento, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                 |
| `VSCREEN-0158` | Distribución y asignación de costos                   | `numera`   | `VPROC-0054::STEP-ALLOCATE_COSTS`                           | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0159` | Indicadores, análisis y planes de mejora              | `numera`   | `VPROC-0061::STEP-ANALYZE_AND_PLAN_IMPROVEMENT`             | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`        | `SUPERVISION_PERFORMANCE`  | La intención dominante evalúa resultados, tendencias, variaciones y planes de mejora. La pantalla permite comprender el estado de trabajo ajeno o agregado, detectar desvíos y orientar intervención sin convertirse en el espacio principal de ejecución o backoffice.                         |
| `VSCREEN-0160` | Inicio y selección del portal de compras              | `pass`     | `VPROC-0039::STEP-ENTER_CUSTOMER_COMMERCE`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0161` | Menú y catálogo comercial del cliente                 | `pass`     | `VPROC-0017::STEP-BROWSE_COMMERCIAL_OFFER`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0162` | Carrito y configuración del pedido                    | `pass`     | `VPROC-0039::STEP-CONFIGURE_CART`                           | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0163` | Dirección, modalidad y programación de entrega        | `pass`     | `VPROC-0050::STEP-SELECT_FULFILLMENT`                       | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0164` | Revisión, checkout e inicio de pago                   | `pass`     | `VPROC-0043::STEP-REVIEW_AND_START_PAYMENT`                 | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0165` | Confirmación de pedido y retorno de pago              | `pass`     | `VPROC-0043::STEP-PRESENT_ORDER_RECEIPT`                    | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0166` | Mis pedidos y detalle                                 | `pass`     | `VPROC-0039::STEP-CONSULT_PERSONAL_ORDERS`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0167` | Seguimiento de preparación y entrega del cliente      | `pass`     | `VPROC-0050::STEP-TRACK_PERSONAL_FULFILLMENT`               | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0168` | Chat y comunicación asociada al pedido                | `pass`     | `VPROC-0047::STEP-COMMUNICATE_ABOUT_ORDER`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0169` | Mis reclamos y casos de servicio                      | `pass`     | `VPROC-0046::STEP-SUBMIT_AND_TRACK_CLAIM`                   | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0170` | Mis reservas y eventos                                | `pass`     | `VPROC-0047::STEP-MANAGE_PERSONAL_RESERVATION`              | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0171` | Calificación y satisfacción                           | `pass`     | `VPROC-0068::STEP-SUBMIT_SATISFACTION_RATING`               | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0172` | Comunicaciones y notificaciones del cliente           | `pass`     | `VPROC-0047::STEP-CONSULT_CUSTOMER_COMMUNICATION`           | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0173` | Trazabilidad e investigación de lote                  | `fogo`     | `VPROC-0035::STEP-INVESTIGATE_BATCH_TRACEABILITY`           | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La intención dominante es reconstrucción histórica, evidencia o auditoría; la clase correspondiente se resolverá en PROC-SCREEN-009.                                                                                                                                                            |
| `VSCREEN-0174` | Controles operativos de inocuidad                     | `fogo`     | `VPROC-0014::STEP-EXECUTE_FOOD_SAFETY_CONTROL`              | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`      | `SUPERVISION_COMPLIANCE`   | La pantalla vigila controles, obligaciones y hallazgos que requieren seguimiento, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                 |
| `VSCREEN-0175` | Seguridad de cuenta y sesiones                        | `shell`    | `VPROC-0059::STEP-MANAGE_ACCOUNT_SECURITY`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Acceso, cuenta, activación técnica o navegación transversal sin vigilancia dominante sobre trabajo empresarial de terceros.                                                                                                                                                                     |
| `VSCREEN-0176` | Definición de kits y conjuntos | `nexo` | `VPROC-0067::STEP-MAINTAIN_KIT_DEFINITION` | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE` | `OUTSIDE_SUPERVISION_CLASS` | `NONE` | Mantiene configuración reutilizable; no supervisa trabajo vivo. |
| `VSCREEN-0177` | Configuración de impresoras logísticas | `nexo` | `VPROC-0024::STEP-CONFIGURE_LOGISTICS_PRINTERS` | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE` | `OUTSIDE_SUPERVISION_CLASS` | `NONE` | Mantiene configuración reutilizable; no supervisa una cola operativa. |

---

#### 11. Resumen por aplicación

| Aplicación | Primaria supervisión | Secundaria supervisión | Fuera de clase |   Total |
| ---------- | -------------------: | ---------------------: | -------------: | ------: |
| `shell`    |                    0 |                      0 |              7 |       7 |
| `viso`     |                    3 |                     16 |             12 |      31 |
| `anima`    |                    0 |                      0 |             14 |      14 |
| `nexo`     |                    2 |                     13 |             22 |      37 |
| `fogo`     |                    2 |                      6 |              7 |      15 |
| `origo`    |                    1 |                      6 |              7 |      14 |
| `pulso`    |                    2 |                     10 |              8 |      20 |
| `numera`   |                    2 |                      9 |              9 |      20 |
| `pass`     |                    0 |                      0 |             19 |      19 |
| **Total**  |               **12** |                 **60** |        **105** | **177** |

La distribución por aplicación es una comprobación de integridad, no una regla de clasificación.

---

#### 12. Resumen por patrón

| Patrón                                  | Pantallas |
| --------------------------------------- | --------: |
| `SUPERVISION_DASHBOARD`                 |         4 |
| `SUPERVISION_QUEUE`                     |         6 |
| `SUPERVISION_MONITORING`                |        12 |
| `SUPERVISION_REVIEW`                    |         6 |
| `SUPERVISION_CONTROL`                   |         9 |
| `SUPERVISION_EXCEPTION`                 |        10 |
| `SUPERVISION_CAPACITY`                  |         7 |
| `SUPERVISION_COMPLIANCE`                |         6 |
| `SUPERVISION_PERFORMANCE`               |         7 |
| `SUPERVISION_RISK`                      |         3 |
| `SUPERVISION_SERVICE`                   |         1 |
| `SUPERVISION_COORDINATION`              |         1 |
| **Total con relevancia de supervisión** |    **72** |

Las 99 pantallas con `NONE` continúan hacia configuración, auditoría, personal o cliente sin recibir una clase inventada.

---

#### 13. Contrato de amplitud y drill-down

Toda pantalla de supervisión deberá declarar posteriormente:

```text
supervised_subject_type
supervised_scope
aggregation_window
freshness_indicator
source_application
source_process
drilldown_target_screen_id
intervention_boundary
escalation_target
```

Reglas:

1. el agregado no puede ocultar la fuente;
2. la frescura debe ser visible;
3. un indicador no sustituye el caso;
4. el drill-down debe abrir el objeto propietario o una proyección autorizada;
5. una acción desde supervisión deberá revalidar permiso, contexto, versión y estado;
6. una proyección no podrá escribir directamente sobre una fuente ajena;
7. no se podrá deducir desempeño individual desde datos incompletos o fuera de contexto;
8. filtros y exportaciones deberán respetar territorio y minimización.

Los campos se materializarán en tareas posteriores de acciones, permisos, métricas e implementación.

---

#### 14. Fronteras especiales

1. **SHELL:** una bandeja transversal o diagnóstico puede ser supervisión primaria; autenticación, cuenta y navegación no.
2. **VISO:** un dashboard o revisión transversal puede ser supervisión; administrar un expediente no se convierte automáticamente en supervisión.
3. **ANIMA:** las pantallas personales no supervisan a terceros.
4. **NEXO:** resumen de inventario, disponibilidad y seguimiento pueden supervisar; movimientos y conteos conservan ejecución primaria.
5. **FOGO:** cola, planeación y receta operativa pueden conducir producción; ejecución de lote permanece operativa.
6. **ORIGO:** cola de recepciones puede supervisar carga; compra, proveedor y orden conservan administración primaria.
7. **PULSO:** inicio y revisión transversal pueden supervisar; venta, caja, pedido y servicio conservan operación primaria.
8. **NUMERA:** inicio financiero, reportes e indicadores pueden supervisar; registros y conciliaciones conservan backoffice administrativo.
9. **PASS:** no supervisa la operación interna ni a otros clientes.
10. **AURA:** continúa sin pantallas.

---

#### 15. Compatibilidad con clases anteriores

```text
PRIMARY_SUPERVISION
+ PRIMARY_OPERATIONAL
= PROHIBIDO

PRIMARY_SUPERVISION
+ PRIMARY_ADMINISTRATIVE
= PROHIBIDO

SECONDARY_SUPERVISION
+ PRIMARY_OPERATIONAL
= PERMITIDO

SECONDARY_SUPERVISION
+ PRIMARY_ADMINISTRATIVE
= PERMITIDO
```

Una aprobación individual no es automáticamente supervisión. Debe existir amplitud sobre trabajo, carga, población, desviación o desempeño.

---

#### 16. Cambio y versionado

Cambiar `supervision_fit` o `supervision_pattern` exige:

1. propuesta trazable;
2. comparación de población, amplitud, señal, intervención y drill-down;
3. explicación de por qué la pantalla pasó a supervisar o dejó de hacerlo;
4. nueva versión;
5. conservación del valor anterior;
6. revisión de actores, territorio, acciones, sensibilidad, métricas y pruebas;
7. nueva identidad cuando cambie materialmente la intención principal.

Cambiar el título del rol, la ruta o el gráfico no cambia automáticamente la clasificación.

---

#### 17. Validaciones obligatorias

La compilación deberá fallar cuando:

1. falte una de las 177 pantallas;
2. una pantalla aparezca más de una vez;
3. falte `supervision_fit`;
4. el valor no pertenezca al vocabulario;
5. una pantalla primaria o secundaria use `NONE`;
6. una pantalla fuera de clase use un patrón;
7. falte fundamento;
8. proceso, paso o clases anteriores no coincidan;
9. los conteos no sean 12, 60 y 105;
10. los patrones no sumen 72;
11. exista una pantalla primaria de supervisión y primaria operativa;
12. exista una pantalla primaria de supervisión y primaria administrativa;
13. PASS o ANIMA reciban supervisión primaria sin nueva decisión;
14. una pantalla histórica sea supervisión solo por mostrar varios registros;
15. un dashboard carezca de fuente, frescura o drill-down;
16. la clasificación sea usada como permiso o jerarquía;
17. AURA reciba clasificación sin pantalla;
18. la puerta final deje más de una clase primaria o ninguna.

---

#### 18. Seguridad, privacidad y autorización

La clasificación de supervisión no concede:

- lectura transversal;
- autoridad sobre subordinados;
- acceso global;
- exportación;
- reasignación;
- aprobación;
- corrección;
- intervención sobre otro territorio;
- acceso a información individual sensible;
- acceso por URL directa.

Toda vista supervisora deberá aplicar minimización, alcance territorial, segregación, trazabilidad y revalidación servidor.

---

#### 19. SCREEN-SUPERVISION-CARRYOVER-REGISTER-001

| Pendiente                                                    | Propietario exacto                                        |
| ------------------------------------------------------------ | --------------------------------------------------------- |
| clasificar pantallas de configuración                        | `PROC-SCREEN-008`                                         |
| clasificar pantallas de auditoría                            | `PROC-SCREEN-009`                                         |
| clasificar pantallas personales                              | `PROC-SCREEN-010`                                         |
| clasificar pantallas de cliente y cerrar la puerta de clases | `PROC-SCREEN-011`                                         |
| definir actores y alcance supervisor                         | `PROC-SCREEN-012`                                         |
| definir dispositivos soportados                              | `PROC-SCREEN-013`                                         |
| definir acciones e intervenciones                            | `PROC-SCREEN-014` y `PROC-SCREEN-015`                     |
| definir estados y recuperación                               | `PROC-SCREEN-016` a `PROC-SCREEN-021`                     |
| definir sensibilidad y permisos                              | `PROC-SCREEN-022` a `PROC-SCREEN-024`                     |
| vincular operaciones técnicas                                | `PROC-SCREEN-025`                                         |
| mapear rutas y legado                                        | `PROC-SCREEN-026`                                         |
| definir métricas y aceptación                                | `PROC-SCREEN-027` y `PROC-SCREEN-028`                     |
| materializar fuente, frescura y drill-down                   | paquetes E5 y CI                                          |
| validar con supervisores reales                              | `UX-QA-*` y pilotos E5                                    |
| admitir AURA                                                 | tareas canónicas de AURA y nueva admisión `PROC-SCREEN-*` |

No queda pendiente narrativo sin tarea o puerta de resolución.

---

#### 20. Requisitos de prueba derivados

**Resultado:** GENERA 30 REQUISITOS DE PRUEBA.

Se incorporan `TREQ-UX-669` a `TREQ-UX-698` al Registro Canónico completo. Permanecen en estado `IDENTIFICADO`; automatización, implementación y evidencia corresponden a CI documental, paquetes E5, BLOQUE U, staging y pilotos.

---

#### 21. Criterios de aceptación

- [x] Se clasifican las 177 pantallas.
- [x] Cada pantalla recibe exactamente un `supervision_fit`.
- [x] Se distinguen 12 primarias, 60 secundarias y 105 fuera de clase.
- [x] Las 72 pantallas relevantes usan doce patrones.
- [x] Ninguna pantalla acumula dos clases primarias aprobadas.
- [x] Supervisión se separa de operación, administración, configuración y auditoría.
- [x] Se definen amplitud, frescura, fuente, drill-down e intervención.
- [x] PASS y ANIMA no se convierten en canales supervisores.
- [x] AURA conserva cero pantallas.
- [x] La clasificación no concede jerarquía ni permisos.
- [x] Se mantienen historia y versionado.
- [x] Se generan `TREQ-UX-669` a `TREQ-UX-698`.
- [x] No se anticipan actores, dispositivos, acciones, estados, permisos, rutas o APIs.
- [x] No se implementa código ni se avanza a `PROC-SCREEN-008`.

---

#### 22. Resultado y continuidad

```text
PROC-SCREEN-006 APROBADA
PROC-SCREEN-007 APROBADA
PROC-SCREEN-008 NO INICIADA
```

La continuidad documental pasa exclusivamente a:

```text
PROC-SCREEN-008 — Clasificar pantalla de configuración
```


### ✅ PROC-SCREEN-008 — Clasificar pantalla de configuración

**Estado:** APROBADA

**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal

**Marcador exacto que reemplaza:** `### [ ] PROC-SCREEN-008 — Clasificar pantalla de configuración`

**Tarea anterior:** `PROC-SCREEN-007 — Clasificar pantalla de supervisión` — APROBADA

**Siguiente tarea reservada:** `PROC-SCREEN-009 — Clasificar pantalla de auditoría` — NO INICIADA

**Fuente canónica obligatoria de nombres:** `PROC-SCREEN-002 / SCREEN-CANONICAL-CATALOG-001`

**Artefactos lógicos contenidos en esta tarea:**

- `SCREEN-CONFIGURATION-CLASSIFICATION-CONTRACT-001`;
- `SCREEN-CONFIGURATION-PATTERN-VOCABULARY-001`;
- `SCREEN-CONFIGURATION-CLASSIFICATION-REGISTER-001`;
- `SCREEN-CANONICAL-NAME-INTEGRITY-GATE-001`;
- `SCREEN-CONFIGURATION-COVERAGE-MATRIX-001`;
- `SCREEN-CONFIGURATION-CHANGE-POLICY-001`;
- `SCREEN-CONFIGURATION-VALIDATION-GATE-001`;
- `SCREEN-CONFIGURATION-CARRYOVER-REGISTER-001`.

**Resultado cuantitativo:** **177 pantallas clasificadas**, de las cuales **16** quedan como `PRIMARY_CONFIGURATION`, **12** como `SECONDARY_CONFIGURATION` y **149** como `OUTSIDE_CONFIGURATION_CLASS`; se utilizan **12 patrones**, existen **28 pantallas con relevancia de configuración**, AURA conserva cero pantallas y ningún nombre canónico fue modificado.

**Huella de nombres `screen_id|working_name`:** `cebd5daf5e5fadff5beb5fb45b9963c5a8a3808cf0972092fc63f97168d49984`

**Naturaleza:** clasificación documental del grado en que cada pantalla define, mantiene, versiona o publica estructuras, políticas, maestros, especificaciones, plantillas, términos, planes o reglas reutilizables que condicionan múltiples instancias futuras. No define todavía auditoría, pantallas personales o de cliente; tampoco define actores, dispositivos, acciones, estados de interfaz, sensibilidad, permisos, rutas u operaciones técnicas.

**Cambios en nombres canónicos, identificadores, aplicaciones, procesos, pasos, código de producto, componentes, rutas, Supabase, tablas, migraciones, RLS, RPC, eventos, analítica o producción:** no autorizados por esta tarea.

---

#### 1. Propósito

Distinguir las superficies cuyo trabajo principal consiste en configurar comportamiento empresarial reutilizable de aquellas que solo incorporan ajustes secundarios o que operan sobre una instancia concreta.

```text
ESTRUCTURA, POLITICA, MAESTRO, ESPECIFICACION, PLANTILLA O REGLA
        +
REUTILIZACION EN MULTIPLES INSTANCIAS FUTURAS
        +
VERSION, VIGENCIA, IMPACTO Y PUBLICACION CONTROLADA
        =
CLASIFICACION DE CONFIGURACION
```

La clasificación responde **si la pantalla gobierna una definición reutilizable**, no si contiene campos editables ni si utiliza la palabra “configuración”.

---

#### 2. Dependencias consumidas

- `PROC-SCREEN-001` y la identidad estable `VSCREEN-*`;
- `PROC-SCREEN-002` y `SCREEN-CANONICAL-CATALOG-001`;
- `PROC-SCREEN-003` y los procesos primarios;
- `PROC-SCREEN-004` y los pasos dominantes;
- `PROC-SCREEN-005` y la clasificación operativa;
- `PROC-SCREEN-006` y la clasificación administrativa;
- `PROC-SCREEN-007` y la clasificación de supervisión;
- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-010`;
- `UX-BASE-001` a `UX-BASE-015`;
- `UX-STATION-001` a `UX-STATION-012`;
- `UX-ADMIN-001` a `UX-ADMIN-005`;
- los contratos aprobados de catálogo, versionado, publicación, autorización, segregación, impacto, auditoría y recuperación.

La tarea consume los nombres canónicos sin reinterpretarlos, abreviarlos, corregirlos, pluralizarlos ni sustituirlos por sinónimos.

---

#### 3. Integridad obligatoria de nombres canónicos

`SCREEN-CANONICAL-NAME-INTEGRITY-GATE-001` establece:

1. `screen_id` es la clave de unión con `SCREEN-CANONICAL-CATALOG-001`;
2. la columna `Pantalla` deberá ser una copia textual exacta de `working_name`;
3. una tarea de clasificación no puede renombrar una pantalla;
4. no se permiten normalizaciones de mayúsculas, tildes, singular, plural, abreviaturas o sinónimos;
5. cualquier diferencia deberá fallar antes de validar la clasificación;
6. un cambio legítimo de nombre deberá aprobarse primero en el catálogo propietario, versionarse y regenerar todas las matrices consumidoras;
7. los nombres no sustituyen `screen_id`, pero se conservan exactos para detectar divergencia documental.

Casos de regresión obligatorios:

```text
VSCREEN-0026 = Bandeja de casos administrativos transversales
VSCREEN-0032 = Mi perfil laboral
```

---

#### 4. Alcance

1. incorporar `configuration_fit` a las 177 pantallas;
2. distinguir configuración primaria, secundaria y ausencia de clase;
3. definir doce patrones cerrados;
4. separar configuración reusable de edición de casos, planificación, operación y preferencias personales;
5. clasificar catálogos, maestros, políticas, especificaciones, plantillas, publicaciones y reglas;
6. conservar las clases aprobadas en `PROC-SCREEN-005` a `PROC-SCREEN-007`;
7. impedir dos clases primarias simultáneas;
8. establecer versionado, vigencia, impacto, publicación y rollback;
9. conservar exactos los 177 nombres del catálogo;
10. preparar la continuidad hacia auditoría, personal y cliente.

---

#### 5. Exclusiones

Esta tarea no:

- renombra pantallas;
- cambia `screen_id`, aplicación, proceso o paso;
- convierte todo formulario editable en configuración;
- convierte planificación de un caso en política reutilizable;
- convierte ajustes de un pedido, una reserva o una preferencia personal en configuración empresarial;
- define actores, dispositivos o estaciones;
- define acciones principales o secundarias;
- define estados de interfaz;
- concede permisos;
- vincula APIs, RPC, Server Actions, eventos o tablas;
- mapea rutas o componentes legacy;
- activa AURA.

---

#### 6. Definición canónica

Una pantalla tiene relevancia de configuración cuando su objeto principal o secundario es una definición reutilizable que:

- afecta múltiples instancias futuras;
- posee versión, vigencia o estado de publicación;
- requiere validación de consistencia e impacto;
- puede reemplazarse, retirarse o revertirse sin reescribir casos históricos;
- conserva fuente, autoridad y trazabilidad;
- no representa únicamente el avance de un caso vivo.

No basta con:

- tener campos editables;
- utilizar selectores;
- permitir ordenar una lista;
- contener la palabra “configuración”;
- modificar un pedido o reserva individual;
- administrar un expediente;
- planear una jornada, ruta, pago o presupuesto concreto;
- consultar un historial;
- cambiar preferencias o datos propios.

---

#### 7. Estados de clasificación

| Valor                         | Significado                                                        | Efecto documental                           |
| ----------------------------- | ------------------------------------------------------------------ | ------------------------------------------- |
| `PRIMARY_CONFIGURATION`       | mantener una definición reutilizable es la intención dominante     | reserva `CONFIGURATION` como clase primaria |
| `SECONDARY_CONFIGURATION`     | otra clase es primaria, pero existe configuración reusable acotada | agrega configuración secundaria             |
| `OUTSIDE_CONFIGURATION_CLASS` | no existe configuración empresarial material bajo este contrato    | continúa hacia las clases posteriores       |

---

#### 8. Contrato mínimo

| Campo                                  | Obligación                                                           |
| -------------------------------------- | -------------------------------------------------------------------- |
| `screen_id`                            | `VSCREEN-*` canónico                                                 |
| `canonical_screen_name`                | nombre exacto de `SCREEN-CANONICAL-CATALOG-001`                      |
| `primary_application_id`               | aplicación aprobada                                                  |
| `primary_process_id`                   | proceso aprobado                                                     |
| `primary_process_step_ref`             | paso aprobado                                                        |
| `operational_fit`                      | clasificación aprobada                                               |
| `administrative_fit`                   | clasificación aprobada                                               |
| `supervision_fit`                      | clasificación aprobada                                               |
| `configuration_fit`                    | uno de los tres estados aprobados                                    |
| `configuration_pattern`                | patrón aprobado o `NONE`                                             |
| `configuration_reason`                 | fundamento verificable                                               |
| `configuration_classification_version` | versión semántica                                                    |
| `configuration_classification_status`  | `CANONICAL`, `CHANGE_PROPOSED`, `SUPERSEDED` o `RETIRED_WITH_SCREEN` |
| `configuration_classification_task`    | tarea que aprobó o modificó la decisión                              |

Valores iniciales:

```text
configuration_classification_version: 1.0.0
configuration_classification_status: CANONICAL
configuration_classification_task: PROC-SCREEN-008
decision_record: INITIAL_CONFIGURATION_CLASSIFICATION
canonical_name_source: SCREEN-CANONICAL-CATALOG-001
```

---

#### 9. SCREEN-CONFIGURATION-PATTERN-VOCABULARY-001

| Patrón                   | Uso                                                        |
| ------------------------ | ---------------------------------------------------------- |
| `CONFIG_STRUCTURE`       | estructura organizativa, territorial o física reutilizable |
| `CONFIG_POLICY`          | política, límite o regla transversal versionada            |
| `CONFIG_ACCESS_MODEL`    | modelo o asignación de acceso                              |
| `CONFIG_DEVICE_POLICY`   | gobierno y parámetros de dispositivos                      |
| `CONFIG_CATALOG`         | catálogo canónico de entidades maestras                    |
| `CONFIG_MASTER_DATA`     | mantenimiento de datos maestros                            |
| `CONFIG_SPECIFICATION`   | especificaciones y criterios reutilizables                 |
| `CONFIG_PUBLICATION`     | aprobación y publicación de una versión reutilizable       |
| `CONFIG_TEMPLATE`        | plantilla versionada                                       |
| `CONFIG_CONTROL_PLAN`    | plan, calendario o control recurrente                      |
| `CONFIG_TERMS`           | condiciones contractuales o comerciales                    |
| `CONFIG_ALLOCATION_RULE` | regla de distribución o asignación                         |
| `NONE`                   | sin relevancia de configuración                            |

---

#### 10. Algoritmo de decisión

Se clasifica `PRIMARY_CONFIGURATION` cuando:

1. la pantalla trabaja principalmente sobre una definición reutilizable;
2. el objeto afecta múltiples casos posteriores;
3. exige versión, vigencia, publicación o retiro;
4. el cambio requiere análisis de impacto;
5. no ejecuta como intención dominante un caso vivo.

Se clasifica `SECONDARY_CONFIGURATION` cuando:

1. la pantalla ya posee otra clase primaria;
2. incorpora una regla, maestro, plan o parámetro reusable claramente delimitado;
3. la configuración no absorbe el expediente ni la ejecución;
4. conserva versión, autoridad y efecto identificable.

Se clasifica `OUTSIDE_CONFIGURATION_CLASS` cuando predomina:

- operación sobre una instancia;
- administración de un caso;
- supervisión;
- auditoría histórica;
- autoservicio personal;
- experiencia del cliente;
- selección o personalización de una instancia concreta.

---

#### 11. Fronteras críticas

1. Activar un dispositivo compartido es ejecución; gobernar sus capacidades y vigencia es configuración.
2. Emitir una etiqueta es operación; diseñar su plantilla es configuración.
3. Gestionar la cola de impresión es operación; parametrizar impresoras es configuración secundaria.
4. Ejecutar una receta es operación; mantener y publicar su versión es configuración.
5. Crear un pedido es operación o cliente; configurar el contenido de ese pedido no es configuración empresarial.
6. Mantener el catálogo físico es configuración; consultar existencias es supervisión u operación.
7. Planear una ruta concreta no es política logística; versionar políticas y restricciones de rutas sí.
8. Registrar un proveedor es administración con configuración secundaria; consultar el catálogo maestro es configuración primaria.
9. Preferencias, consentimiento y seguridad de cuenta propios pertenecen a personal o cliente, no a configuración empresarial.
10. Presupuesto, programación y planificación de casos no se convierten en configuración solo por tener supuestos.

---

#### 12. SCREEN-CONFIGURATION-CLASSIFICATION-REGISTER-001

| Screen ID      | Pantalla                                              | Aplicación | Paso dominante                                              | Clase operativa             | Clase administrativa           | Clase de supervisión        | Clasificación de configuración | Patrón                   | Fundamento                                                                                                                                                                                                                                                 |
| -------------- | ----------------------------------------------------- | ---------- | ----------------------------------------------------------- | --------------------------- | ------------------------------ | --------------------------- | ------------------------------ | ------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VSCREEN-0001` | Hub Vento OS                                          | `shell`    | `VPROC-0059::STEP-ENTER_ECOSYSTEM`                          | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Resuelve acceso, sesión, contexto o cuenta en tiempo de ejecución; no mantiene configuración empresarial reutilizable.                                                                                                                                     |
| `VSCREEN-0002` | Inicio de sesión y recuperación                       | `shell`    | `VPROC-0059::STEP-AUTHENTICATE_OR_RECOVER`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Resuelve acceso, sesión, contexto o cuenta en tiempo de ejecución; no mantiene configuración empresarial reutilizable.                                                                                                                                     |
| `VSCREEN-0003` | Resolución de contexto y acceso                       | `shell`    | `VPROC-0059::STEP-RESOLVE_EFFECTIVE_CONTEXT`                | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Resuelve acceso, sesión, contexto o cuenta en tiempo de ejecución; no mantiene configuración empresarial reutilizable.                                                                                                                                     |
| `VSCREEN-0004` | Activación de dispositivo compartido                  | `shell`    | `VPROC-0059::STEP-ACTIVATE_SHARED_DEVICE`                   | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Resuelve acceso, sesión, contexto o cuenta en tiempo de ejecución; no mantiene configuración empresarial reutilizable.                                                                                                                                     |
| `VSCREEN-0005` | Bandeja transversal de tareas y notificaciones | `shell` | `VPROC-0004::STEP-TRIAGE_TRANSVERSAL_WORK` | `SECONDARY_OPERATIONAL` | `SECONDARY_ADMINISTRATIVE` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `NONE` | La intención dominante es vigilar carga, riesgo, desviaciones o resultados; la pantalla no mantiene configuración como objeto principal. |
| `VSCREEN-0006` | Centro de soporte y diagnóstico | `shell` | `VPROC-0058::STEP-DIAGNOSE_AND_ROUTE_SUPPORT` | `SECONDARY_OPERATIONAL` | `SECONDARY_ADMINISTRATIVE` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `NONE` | La intención dominante es vigilar carga, riesgo, desviaciones o resultados; la pantalla no mantiene configuración como objeto principal. |
| `VSCREEN-0007` | Inicio ejecutivo y gerencial                          | `viso`     | `VPROC-0001::STEP-REVIEW_EXECUTIVE_WORK`                    | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es vigilar carga, riesgo, desviaciones o resultados; la pantalla no mantiene configuración como objeto principal.                                                                                                                   |
| `VSCREEN-0008` | Estructura organizativa                               | `viso`     | `VPROC-0002::STEP-MAINTAIN_ORGANIZATIONAL_STRUCTURE`        | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`        | `CONFIG_STRUCTURE`       | La intención dominante mantiene una estructura reutilizable que organiza entidades, ubicaciones o ámbitos. La configuración afecta múltiples instancias futuras, conserva versión y no ejecuta por sí sola un caso operativo.                              |
| `VSCREEN-0009` | Políticas, delegaciones y límites                     | `viso`     | `VPROC-0003::STEP-AUTHOR_POLICIES_AND_LIMITS`               | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`        | `CONFIG_POLICY`          | La intención dominante define y versiona políticas, límites o reglas transversales reutilizables. La configuración afecta múltiples instancias futuras, conserva versión y no ejecuta por sí sola un caso operativo.                                       |
| `VSCREEN-0010` | Compromisos y transferencias internas                 | `viso`     | `VPROC-0004::STEP-TRACK_INTERNAL_COMMITMENTS`               | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0011` | Embudo de candidatos                                  | `viso`     | `VPROC-0005::STEP-TRIAGE_CANDIDATES`                        | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0012` | Caso de selección                                     | `viso`     | `VPROC-0005::STEP-EVALUATE_AND_DECIDE_CANDIDATE`            | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0013` | Vinculación e incorporación                           | `viso`     | `VPROC-0006::STEP-ORCHESTRATE_ONBOARDING`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0014` | Directorio y expediente laboral                       | `viso`     | `VPROC-0006::STEP-MAINTAIN_EMPLOYMENT_RECORD`               | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0015` | Programación laboral                                  | `viso`     | `VPROC-0007::STEP-PLAN_AND_PUBLISH_SCHEDULE`                | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0016` | Revisión de asistencia                                | `viso`     | `VPROC-0008::STEP-REVIEW_ATTENDANCE_EXCEPTION`              | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es vigilar carga, riesgo, desviaciones o resultados; la pantalla no mantiene configuración como objeto principal.                                                                                                                   |
| `VSCREEN-0017` | Novedades, ausencias y reemplazos                     | `viso`     | `VPROC-0009::STEP-RESOLVE_WORKFORCE_CASE`                   | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0018` | Retiro y revocación coordinada                        | `viso`     | `VPROC-0011::STEP-CLOSE_EMPLOYMENT_AND_REVOKE`              | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0019` | Catálogo de roles y permisos                          | `viso`     | `VPROC-0059::STEP-MAINTAIN_ACCESS_CATALOG`                  | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`        | `CONFIG_ACCESS_MODEL`    | La intención dominante mantiene el modelo o asignación versionada de acceso. La configuración afecta múltiples instancias futuras, conserva versión y no ejecuta por sí sola un caso operativo.                                                            |
| `VSCREEN-0020` | Perfil de acceso del trabajador                       | `viso`     | `VPROC-0059::STEP-ASSIGN_EFFECTIVE_ACCESS`                  | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `SECONDARY_CONFIGURATION`      | `CONFIG_ACCESS_MODEL`    | La pantalla mantiene el modelo o asignación versionada de acceso, pero su intención primaria ya es operativa, administrativa o de supervisión. La configuración permanece acotada, versionada y subordinada al contrato propietario.                       |
| `VSCREEN-0021` | Simulación de permisos y conflictos                   | `viso`     | `VPROC-0059::STEP-SIMULATE_ACCESS_DECISION`                 | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0022` | Gobierno de dispositivos compartidos                  | `viso`     | `VPROC-0059::STEP-GOVERN_SHARED_DEVICES`                    | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`        | `CONFIG_DEVICE_POLICY`   | La intención dominante gobierna capacidades, vigencia o parámetros de dispositivos. La configuración afecta múltiples instancias futuras, conserva versión y no ejecuta por sí sola un caso operativo.                                                     |
| `VSCREEN-0023` | Riesgos de seguridad y salud                          | `viso`     | `VPROC-0012::STEP-ASSESS_SST_RISK`                          | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0024` | Incidentes y emergencias                              | `viso`     | `VPROC-0013::STEP-MANAGE_INCIDENT_RESPONSE`                 | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0025` | Controles de higiene y cumplimiento                   | `viso`     | `VPROC-0014::STEP-REVIEW_HYGIENE_COMPLIANCE`                | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `SECONDARY_CONFIGURATION`      | `CONFIG_CONTROL_PLAN`    | La pantalla mantiene planes, calendarios o controles recurrentes, pero su intención primaria ya es operativa, administrativa o de supervisión. La configuración permanece acotada, versionada y subordinada al contrato propietario.                       |
| `VSCREEN-0026` | Bandeja de casos administrativos transversales        | `viso`     | `VPROC-0004::STEP-TRIAGE_ADMIN_CASES`                       | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0027` | Inicio personal del trabajador                        | `anima`    | `VPROC-0007::STEP-ENTER_PERSONAL_WORKSPACE`                 | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie personal del trabajador. Consultar o modificar el caso propio no equivale a configurar el comportamiento empresarial.                                                                                                                    |
| `VSCREEN-0028` | Registro de entrada, pausa y salida                   | `anima`    | `VPROC-0008::STEP-CAPTURE_ATTENDANCE_EVENT`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0029` | Mi programación                                       | `anima`    | `VPROC-0007::STEP-CONSULT_PUBLISHED_SCHEDULE`               | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie personal del trabajador. Consultar o modificar el caso propio no equivale a configurar el comportamiento empresarial.                                                                                                                    |
| `VSCREEN-0030` | Mi asistencia y solicitud de corrección               | `anima`    | `VPROC-0008::STEP-CONSULT_OR_REQUEST_ATTENDANCE_CORRECTION` | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie personal del trabajador. Consultar o modificar el caso propio no equivale a configurar el comportamiento empresarial.                                                                                                                    |
| `VSCREEN-0031` | Mis novedades, permisos y ausencias                   | `anima`    | `VPROC-0009::STEP-SUBMIT_PERSONAL_WORKFORCE_CASE`           | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie personal del trabajador. Consultar o modificar el caso propio no equivale a configurar el comportamiento empresarial.                                                                                                                    |
| `VSCREEN-0032` | Mi perfil laboral                                     | `anima`    | `VPROC-0006::STEP-MAINTAIN_SELF_SERVICE_PROFILE`            | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie personal del trabajador. Consultar o modificar el caso propio no equivale a configurar el comportamiento empresarial.                                                                                                                    |
| `VSCREEN-0033` | Resumen de inventario y abastecimiento interno        | `nexo`     | `VPROC-0028::STEP-MONITOR_INTERNAL_SUPPLY`                  | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es vigilar carga, riesgo, desviaciones o resultados; la pantalla no mantiene configuración como objeto principal.                                                                                                                   |
| `VSCREEN-0034` | Catálogo de productos físicos                         | `nexo`     | `VPROC-0015::STEP-CONSULT_PHYSICAL_PRODUCT_CATALOG`         | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`        | `CONFIG_CATALOG`         | La intención dominante presenta el catálogo canónico de una entidad maestra reutilizable. La configuración afecta múltiples instancias futuras, conserva versión y no ejecuta por sí sola un caso operativo.                                               |
| `VSCREEN-0035` | Editor de producto, unidad y presentación             | `nexo`     | `VPROC-0015::STEP-MAINTAIN_PRODUCT_PRESENTATION`            | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`        | `CONFIG_MASTER_DATA`     | La intención dominante crea o mantiene datos maestros utilizados por múltiples instancias futuras. La configuración afecta múltiples instancias futuras, conserva versión y no ejecuta por sí sola un caso operativo.                                      |
| `VSCREEN-0036` | Especificaciones y criterios de calidad               | `nexo`     | `VPROC-0018::STEP-MAINTAIN_QUALITY_SPECIFICATION`           | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`        | `CONFIG_SPECIFICATION`   | La intención dominante define especificaciones y criterios reutilizables de aceptación. La configuración afecta múltiples instancias futuras, conserva versión y no ejecuta por sí sola un caso operativo.                                                 |
| `VSCREEN-0037` | Catálogo de ubicaciones                               | `nexo`     | `VPROC-0023::STEP-MAINTAIN_LOCATION_CATALOG`                | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`        | `CONFIG_STRUCTURE`       | La intención dominante mantiene una estructura reutilizable que organiza entidades, ubicaciones o ámbitos. La configuración afecta múltiples instancias futuras, conserva versión y no ejecuta por sí sola un caso operativo.                              |
| `VSCREEN-0038` | Identificación y detalle de ubicación | `nexo` | `VPROC-0023::STEP-IDENTIFY_LOCATION_AND_CONTENT` | `PRIMARY_OPERATIONAL` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `NONE` | Identifica una ubicación concreta y consulta su contenido; el catálogo reutilizable permanece en VSCREEN-0037. |
| `VSCREEN-0039` | Consulta de existencias                               | `nexo`     | `VPROC-0024::STEP-CONSULT_STOCK_POSITION`                   | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es vigilar carga, riesgo, desviaciones o resultados; la pantalla no mantiene configuración como objeto principal.                                                                                                                   |
| `VSCREEN-0040` | Conteo de inventario                                  | `nexo`     | `VPROC-0026::STEP-CAPTURE_PHYSICAL_COUNT`                   | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0041` | Revisión de conteo y diferencias                      | `nexo`     | `VPROC-0026::STEP-REVIEW_COUNT_VARIANCE`                    | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0042` | Caso de ajuste de inventario                          | `nexo`     | `VPROC-0026::STEP-DECIDE_INVENTORY_ADJUSTMENT`              | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0043` | Confirmación de entrada a inventario                  | `nexo`     | `VPROC-0024::STEP-CONFIRM_STOCK_ENTRY`                      | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0044` | Retiro y consumo de existencias                       | `nexo`     | `VPROC-0025::STEP-EXECUTE_STOCK_WITHDRAWAL`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0045` | Traslado interno de existencias                       | `nexo`     | `VPROC-0025::STEP-EXECUTE_INTERNAL_TRANSFER`                | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0046` | Solicitud de remisión                                 | `nexo`     | `VPROC-0028::STEP-SUBMIT_REPLENISHMENT_REQUEST`             | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0047` | Preparación de remisión                               | `nexo`     | `VPROC-0028::STEP-PREPARE_REPLENISHMENT`                    | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0048` | Carga y despacho de remisión                          | `nexo`     | `VPROC-0028::STEP-LOAD_AND_DISPATCH_REPLENISHMENT`          | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0049` | Seguimiento de remisión en tránsito                   | `nexo`     | `VPROC-0028::STEP-MONITOR_REPLENISHMENT_TRANSIT`            | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0050` | Recepción de remisión                                 | `nexo`     | `VPROC-0028::STEP-RECEIVE_REPLENISHMENT`                    | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0051` | Vencimiento, cuarentena, daño y merma                 | `nexo`     | `VPROC-0027::STEP-RESOLVE_STOCK_CONDITION`                  | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0052` | LPN, contenedores y reutilizables                     | `nexo`     | `VPROC-0032::STEP-MANAGE_LPN_AND_REUSABLES`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0053` | Activos y custodia                                    | `nexo`     | `VPROC-0029::STEP-MANAGE_ASSET_CUSTODY`                     | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0054` | Etiquetas e impresión logística                       | `nexo`     | `VPROC-0024::STEP-ISSUE_LOGISTICS_LABEL`                    | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0055` | Inicio y cola de producción                           | `fogo`     | `VPROC-0033::STEP-TRIAGE_PRODUCTION_QUEUE`                  | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es vigilar carga, riesgo, desviaciones o resultados; la pantalla no mantiene configuración como objeto principal.                                                                                                                   |
| `VSCREEN-0056` | Planeación de producción                              | `fogo`     | `VPROC-0033::STEP-PLAN_PRODUCTION`                          | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es vigilar carga, riesgo, desviaciones o resultados; la pantalla no mantiene configuración como objeto principal.                                                                                                                   |
| `VSCREEN-0057` | Preparación e inicio de lote                          | `fogo`     | `VPROC-0034::STEP-PREPARE_AND_START_BATCH`                  | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0058` | Ejecución de lote                                     | `fogo`     | `VPROC-0034::STEP-EXECUTE_BATCH`                            | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0059` | Registro parcial de producción                        | `fogo`     | `VPROC-0034::STEP-CAPTURE_BATCH_PROGRESS`                   | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0060` | Finalización y cierre de lote                         | `fogo`     | `VPROC-0037::STEP-CLOSE_BATCH`                              | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0061` | Receta operativa | `fogo` | `VPROC-0016::STEP-CONSULT_APPLICABLE_RECIPE` | `PRIMARY_OPERATIONAL` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `NONE` | La intención dominante es vigilar carga, riesgo, desviaciones o resultados; la pantalla no mantiene configuración como objeto principal. |
| `VSCREEN-0062` | Catálogo y editor de recetas                          | `fogo`     | `VPROC-0016::STEP-AUTHOR_RECIPE`                            | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`        | `CONFIG_MASTER_DATA`     | La intención dominante crea o mantiene datos maestros utilizados por múltiples instancias futuras. La configuración afecta múltiples instancias futuras, conserva versión y no ejecuta por sí sola un caso operativo.                                      |
| `VSCREEN-0063` | Revisión, aprobación y publicación de receta          | `fogo`     | `VPROC-0016::STEP-APPROVE_AND_PUBLISH_RECIPE`               | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`        | `CONFIG_PUBLICATION`     | La intención dominante revisa y publica una versión reutilizable que condiciona operación posterior. La configuración afecta múltiples instancias futuras, conserva versión y no ejecuta por sí sola un caso operativo.                                    |
| `VSCREEN-0064` | Prueba de receta y rendimiento                        | `fogo`     | `VPROC-0016::STEP-TEST_RECIPE_AND_YIELD`                    | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0065` | Control de calidad y liberación                       | `fogo`     | `VPROC-0035::STEP-DECIDE_QUALITY_RELEASE`                   | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0066` | Empaque, etiquetado y almacenamiento de terminado     | `fogo`     | `VPROC-0036::STEP-PACK_AND_TRANSFER_FINISHED_GOOD`          | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0067` | Reproceso, aprovechamiento, merma y cierre productivo | `fogo`     | `VPROC-0037::STEP-RESOLVE_PRODUCTION_DISPOSITION`           | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0068` | Bandeja de necesidades de compra                      | `origo`    | `VPROC-0019::STEP-TRIAGE_PURCHASE_NEEDS`                    | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0069` | Solicitud de compra                                   | `origo`    | `VPROC-0019::STEP-SUBMIT_PURCHASE_REQUEST`                  | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0070` | Catálogo de proveedores                               | `origo`    | `VPROC-0020::STEP-CONSULT_SUPPLIER_CATALOG`                 | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`        | `CONFIG_CATALOG`         | La intención dominante presenta el catálogo canónico de una entidad maestra reutilizable. La configuración afecta múltiples instancias futuras, conserva versión y no ejecuta por sí sola un caso operativo.                                               |
| `VSCREEN-0071` | Alta y expediente de proveedor                        | `origo`    | `VPROC-0020::STEP-ONBOARD_SUPPLIER`                         | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `SECONDARY_CONFIGURATION`      | `CONFIG_MASTER_DATA`     | La pantalla crea o mantiene datos maestros utilizados por múltiples instancias futuras, pero su intención primaria ya es operativa, administrativa o de supervisión. La configuración permanece acotada, versionada y subordinada al contrato propietario. |
| `VSCREEN-0072` | Comparación de cotizaciones                           | `origo`    | `VPROC-0020::STEP-COMPARE_QUOTES`                           | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0073` | Editor de orden de compra                             | `origo`    | `VPROC-0021::STEP-PREPARE_PURCHASE_ORDER`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0074` | Bandeja de aprobaciones de compra                     | `origo`    | `VPROC-0021::STEP-APPROVE_PURCHASE`                         | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0075` | Detalle y seguimiento de orden                        | `origo`    | `VPROC-0021::STEP-MONITOR_PURCHASE_ORDER`                   | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0076` | Cola de recepciones                                   | `origo`    | `VPROC-0022::STEP-TRIAGE_RECEIPT_QUEUE`                     | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es vigilar carga, riesgo, desviaciones o resultados; la pantalla no mantiene configuración como objeto principal.                                                                                                                   |
| `VSCREEN-0077` | Recepción total o parcial                             | `origo`    | `VPROC-0022::STEP-RECEIVE_PURCHASE`                         | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0078` | Resolución de diferencias de recepción                | `origo`    | `VPROC-0022::STEP-RESOLVE_RECEIPT_VARIANCE`                 | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0079` | Historial y auditoría de abastecimiento               | `origo`    | `VPROC-0022::STEP-AUDIT_PROCUREMENT_CYCLE`                  | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | No define ni mantiene una estructura, política, maestro, especificación, plantilla, publicación o regla reutilizable bajo este contrato.                                                                                                                   |
| `VSCREEN-0080` | Inicio POS | `pulso` | `VPROC-0039::STEP-ENTER_POS_WORKSPACE` | `PRIMARY_OPERATIONAL` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION` | `OUTSIDE_CONFIGURATION_CLASS` | `NONE` | La intención dominante es vigilar carga, riesgo, desviaciones o resultados; la pantalla no mantiene configuración como objeto principal. |
| `VSCREEN-0081` | Creación de venta o pedido                            | `pulso`    | `VPROC-0039::STEP-CREATE_SALE_OR_ORDER`                     | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0082` | Mapa de salón y mesas                                 | `pulso`    | `VPROC-0038::STEP-MANAGE_TABLE_SERVICE`                     | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0083` | Detalle y modificación de pedido                      | `pulso`    | `VPROC-0038::STEP-MODIFY_ACTIVE_ORDER`                      | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0084` | Cobro y medios de pago                                | `pulso`    | `VPROC-0043::STEP-COLLECT_PAYMENT`                          | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0085` | Identificación de cliente y acumulación               | `pulso`    | `VPROC-0045::STEP-IDENTIFY_CUSTOMER_AND_ACCRUE`             | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0086` | Redención de puntos o beneficios                      | `pulso`    | `VPROC-0045::STEP-REDEEM_LOYALTY_VALUE`                     | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0087` | Bandeja de pedidos de canales externos                | `pulso`    | `VPROC-0040::STEP-ADMIT_EXTERNAL_ORDER`                     | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0088` | Seguimiento de preparación y entrega                  | `pulso`    | `VPROC-0039::STEP-MONITOR_ORDER_FULFILLMENT`                | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0089` | Apertura de caja                                      | `pulso`    | `VPROC-0044::STEP-OPEN_CASH_SESSION`                        | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0090` | Cierre de caja                                        | `pulso`    | `VPROC-0044::STEP-CLOSE_CASH_SESSION`                       | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0091` | Anulación, devolución y reembolso                     | `pulso`    | `VPROC-0042::STEP-RESOLVE_REVERSAL_OR_REFUND`               | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0092` | Oferta, menú, precio comercial y disponibilidad       | `pulso`    | `VPROC-0017::STEP-PUBLISH_COMMERCIAL_OFFER`                 | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`        | `CONFIG_PUBLICATION`     | La intención dominante revisa y publica una versión reutilizable que condiciona operación posterior. La configuración afecta múltiples instancias futuras, conserva versión y no ejecuta por sí sola un caso operativo.                                    |
| `VSCREEN-0093` | Revisión de ventas, caja y terminales                 | `pulso`    | `VPROC-0044::STEP-REVIEW_SALES_AND_TERMINALS`               | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es vigilar carga, riesgo, desviaciones o resultados; la pantalla no mantiene configuración como objeto principal.                                                                                                                   |
| `VSCREEN-0094` | Inicio financiero y ejecutivo                         | `numera`   | `VPROC-0061::STEP-REVIEW_FINANCIAL_POSITION`                | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es vigilar carga, riesgo, desviaciones o resultados; la pantalla no mantiene configuración como objeto principal.                                                                                                                   |
| `VSCREEN-0095` | Bandeja de hechos económicos                          | `numera`   | `VPROC-0051::STEP-TRIAGE_ECONOMIC_FACTS`                    | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0096` | Registro de gasto y soporte                           | `numera`   | `VPROC-0051::STEP-CAPTURE_EXPENSE_AND_EVIDENCE`             | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0097` | Bandeja de aprobaciones financieras                   | `numera`   | `VPROC-0052::STEP-APPROVE_FINANCIAL_DECISION`               | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0098` | Cuentas por pagar y obligaciones                      | `numera`   | `VPROC-0052::STEP-MANAGE_PAYABLE_OBLIGATION`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0099` | Cuentas por cobrar y cartera                          | `numera`   | `VPROC-0053::STEP-MANAGE_RECEIVABLE`                        | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0100` | Caja, bancos y movimientos financieros                | `numera`   | `VPROC-0052::STEP-EXECUTE_TREASURY_MOVEMENT`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0101` | Conciliación de ventas y pagos                        | `numera`   | `VPROC-0051::STEP-RECONCILE_SALES_AND_PAYMENTS`             | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0102` | Conciliación de compras y recepciones                 | `numera`   | `VPROC-0051::STEP-RECONCILE_PURCHASES_AND_RECEIPTS`         | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0103` | Conciliación de inventario, producción y variaciones  | `numera`   | `VPROC-0054::STEP-RECONCILE_OPERATING_VARIANCES`            | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0104` | Costos, rentabilidad y escenarios                     | `numera`   | `VPROC-0054::STEP-ANALYZE_COST_AND_PROFITABILITY`           | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0105` | Cierre, reapertura y corrección de periodo            | `numera`   | `VPROC-0054::STEP-CLOSE_OR_REOPEN_PERIOD`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0106` | Reportes y exportaciones financieras | `numera` | `VPROC-0061::STEP-PUBLISH_FINANCIAL_REPORT` | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `NONE` | La intención dominante es vigilar carga, riesgo, desviaciones o resultados; la pantalla no mantiene configuración como objeto principal. |
| `VSCREEN-0107` | Inicio del cliente y resumen de beneficios            | `pass`     | `VPROC-0045::STEP-ENTER_LOYALTY_HOME`                       | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie de cliente. Preferencias, consentimientos, direcciones o elecciones propias no se clasifican como configuración empresarial.                                                                                                             |
| `VSCREEN-0108` | QR personal de identificación                         | `pass`     | `VPROC-0045::STEP-PRESENT_CUSTOMER_ID`                      | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie de cliente. Preferencias, consentimientos, direcciones o elecciones propias no se clasifican como configuración empresarial.                                                                                                             |
| `VSCREEN-0109` | Catálogo de beneficios y recompensas                  | `pass`     | `VPROC-0045::STEP-CONSULT_REWARDS_CATALOG`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie de cliente. Preferencias, consentimientos, direcciones o elecciones propias no se clasifican como configuración empresarial.                                                                                                             |
| `VSCREEN-0110` | Ticket o QR de redención                              | `pass`     | `VPROC-0045::STEP-CREATE_REDEMPTION_INTENT`                 | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie de cliente. Preferencias, consentimientos, direcciones o elecciones propias no se clasifican como configuración empresarial.                                                                                                             |
| `VSCREEN-0111` | Historial de puntos y redenciones                     | `pass`     | `VPROC-0045::STEP-AUDIT_PERSONAL_LOYALTY_LEDGER`            | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie de cliente. Preferencias, consentimientos, direcciones o elecciones propias no se clasifican como configuración empresarial.                                                                                                             |
| `VSCREEN-0112` | Perfil, privacidad y consentimientos                  | `pass`     | `VPROC-0045::STEP-MAINTAIN_CUSTOMER_PROFILE_AND_CONSENT`    | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie de cliente. Preferencias, consentimientos, direcciones o elecciones propias no se clasifican como configuración empresarial.                                                                                                             |
| `VSCREEN-0113` | Registro y seguimiento de decisiones empresariales    | `viso`     | `VPROC-0001::STEP-RECORD_AND_TRACK_DECISION`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0114` | Solicitudes y certificaciones de acceso               | `viso`     | `VPROC-0059::STEP-REVIEW_AND_CERTIFY_ACCESS`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0115` | Gobierno de documentos y evidencia                    | `viso`     | `VPROC-0060::STEP-GOVERN_DOCUMENT_EVIDENCE`                 | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `SECONDARY_CONFIGURATION`      | `CONFIG_POLICY`          | La pantalla define y versiona políticas, límites o reglas transversales reutilizables, pero su intención primaria ya es operativa, administrativa o de supervisión. La configuración permanece acotada, versionada y subordinada al contrato propietario.  |
| `VSCREEN-0116` | Registro de riesgos empresariales                     | `viso`     | `VPROC-0063::STEP-ASSESS_ENTERPRISE_RISK`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0117` | Requerimientos de asesores y autoridades              | `viso`     | `VPROC-0064::STEP-MANAGE_EXTERNAL_REQUIREMENT`              | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0118` | Gestión de desempeño y desarrollo                     | `viso`     | `VPROC-0065::STEP-REVIEW_PERFORMANCE_AND_DEVELOPMENT`       | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0119` | Asignación y control de elementos de protección       | `viso`     | `VPROC-0066::STEP-ASSIGN_PROTECTIVE_EQUIPMENT`              | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0120` | Mesa de servicio tecnológico                          | `viso`     | `VPROC-0058::STEP-RESOLVE_TECH_SERVICE_CASE`                | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0121` | Continuidad, contingencia y recuperación              | `viso`     | `VPROC-0062::STEP-ACTIVATE_AND_RECOVER_CONTINUITY`          | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `SECONDARY_CONFIGURATION`      | `CONFIG_CONTROL_PLAN`    | La pantalla mantiene planes, calendarios o controles recurrentes, pero su intención primaria ya es operativa, administrativa o de supervisión. La configuración permanece acotada, versionada y subordinada al contrato propietario.                       |
| `VSCREEN-0122` | Privacidad, cumplimiento y conservación               | `viso`     | `VPROC-0060::STEP-GOVERN_PRIVACY_AND_RETENTION`             | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `SECONDARY_CONFIGURATION`      | `CONFIG_POLICY`          | La pantalla define y versiona políticas, límites o reglas transversales reutilizables, pero su intención primaria ya es operativa, administrativa o de supervisión. La configuración permanece acotada, versionada y subordinada al contrato propietario.  |
| `VSCREEN-0123` | Gestión de comunicaciones internas                    | `viso`     | `VPROC-0004::STEP-PUBLISH_INTERNAL_COMMUNICATION`           | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0124` | Mis comunicados laborales                             | `anima`    | `VPROC-0004::STEP-CONSULT_AND_ACKNOWLEDGE_COMMUNICATION`    | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie personal del trabajador. Consultar o modificar el caso propio no equivale a configurar el comportamiento empresarial.                                                                                                                    |
| `VSCREEN-0125` | Mi carnet laboral                                     | `anima`    | `VPROC-0006::STEP-PRESENT_EMPLOYEE_CREDENTIAL`              | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie personal del trabajador. Consultar o modificar el caso propio no equivale a configurar el comportamiento empresarial.                                                                                                                    |
| `VSCREEN-0126` | Mis documentos laborales                              | `anima`    | `VPROC-0060::STEP-CONSULT_OR_SUBMIT_EMPLOYMENT_DOCUMENT`    | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie personal del trabajador. Consultar o modificar el caso propio no equivale a configurar el comportamiento empresarial.                                                                                                                    |
| `VSCREEN-0127` | Mi capacitación                                       | `anima`    | `VPROC-0065::STEP-COMPLETE_ASSIGNED_TRAINING`               | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie personal del trabajador. Consultar o modificar el caso propio no equivale a configurar el comportamiento empresarial.                                                                                                                    |
| `VSCREEN-0128` | Mis objetivos y retroalimentación                     | `anima`    | `VPROC-0065::STEP-REVIEW_PERSONAL_OBJECTIVES`               | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie personal del trabajador. Consultar o modificar el caso propio no equivale a configurar el comportamiento empresarial.                                                                                                                    |
| `VSCREEN-0129` | Mis solicitudes de soporte                            | `anima`    | `VPROC-0058::STEP-SUBMIT_AND_TRACK_SUPPORT_REQUEST`         | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie personal del trabajador. Consultar o modificar el caso propio no equivale a configurar el comportamiento empresarial.                                                                                                                    |
| `VSCREEN-0130` | Mis reportes de seguridad y salud                     | `anima`    | `VPROC-0013::STEP-REPORT_SST_EVENT`                         | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie personal del trabajador. Consultar o modificar el caso propio no equivale a configurar el comportamiento empresarial.                                                                                                                    |
| `VSCREEN-0131` | Mis elementos de protección                           | `anima`    | `VPROC-0066::STEP-ACKNOWLEDGE_PROTECTIVE_EQUIPMENT`         | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie personal del trabajador. Consultar o modificar el caso propio no equivale a configurar el comportamiento empresarial.                                                                                                                    |
| `VSCREEN-0132` | Reservas de inventario                                | `nexo`     | `VPROC-0028::STEP-RESERVE_STOCK`                            | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0133` | Planes y órdenes de mantenimiento de activos          | `nexo`     | `VPROC-0030::STEP-PLAN_AND_EXECUTE_ASSET_MAINTENANCE`       | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `SECONDARY_CONFIGURATION`      | `CONFIG_CONTROL_PLAN`    | La pantalla mantiene planes, calendarios o controles recurrentes, pero su intención primaria ya es operativa, administrativa o de supervisión. La configuración permanece acotada, versionada y subordinada al contrato propietario.                       |
| `VSCREEN-0134` | Garantías, seguros y reclamaciones de activos         | `nexo`     | `VPROC-0030::STEP-MANAGE_ASSET_CLAIM`                       | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0135` | Instancias y operación de kits | `nexo` | `VPROC-0067::STEP-ASSEMBLE_AND_CONTROL_KIT` | `PRIMARY_OPERATIONAL` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `NONE` | Opera instancias de kit; la definición reutilizable quedó separada en VSCREEN-0176. |
| `VSCREEN-0136` | Flota y vehículos                                     | `nexo`     | `VPROC-0031::STEP-MANAGE_FLEET_ASSET`                       | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `SECONDARY_CONFIGURATION`      | `CONFIG_MASTER_DATA`     | La pantalla crea o mantiene datos maestros utilizados por múltiples instancias futuras, pero su intención primaria ya es operativa, administrativa o de supervisión. La configuración permanece acotada, versionada y subordinada al contrato propietario. |
| `VSCREEN-0137` | Kilometraje y combustible                             | `nexo`     | `VPROC-0031::STEP-CAPTURE_MILEAGE_AND_FUEL`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0138` | Planeación de rutas y despachos                       | `nexo`     | `VPROC-0048::STEP-PLAN_ROUTE_AND_DISPATCH`                  | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0139` | Ejecución de ruta y prueba de entrega                 | `nexo`     | `VPROC-0049::STEP-EXECUTE_ROUTE_AND_PROVE_DELIVERY`         | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0140` | Novedades, rechazos y retornos logísticos             | `nexo`     | `VPROC-0049::STEP-RESOLVE_LOGISTICS_EXCEPTION`              | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0141` | Instalaciones, servicios y mantenimiento locativo     | `nexo`     | `VPROC-0055::STEP-MANAGE_FACILITY_SERVICE`                  | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `SECONDARY_CONFIGURATION`      | `CONFIG_CONTROL_PLAN`    | La pantalla mantiene planes, calendarios o controles recurrentes, pero su intención primaria ya es operativa, administrativa o de supervisión. La configuración permanece acotada, versionada y subordinada al contrato propietario.                       |
| `VSCREEN-0142` | Configuración de políticas y rutas logísticas         | `nexo`     | `VPROC-0048::STEP-CONFIGURE_LOGISTICS_POLICY`               | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`        | `CONFIG_POLICY`          | La intención dominante define y versiona políticas, límites o reglas transversales reutilizables. La configuración afecta múltiples instancias futuras, conserva versión y no ejecuta por sí sola un caso operativo.                                       |
| `VSCREEN-0143` | Diseñador de etiquetas logísticas                     | `nexo`     | `VPROC-0015::STEP-AUTHOR_LOGISTICS_LABEL_TEMPLATE`          | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`        | `CONFIG_TEMPLATE`        | La intención dominante diseña y versiona una plantilla reutilizable. La configuración afecta múltiples instancias futuras, conserva versión y no ejecuta por sí sola un caso operativo.                                                                    |
| `VSCREEN-0144` | Cola y trabajos de impresión logística | `nexo` | `VPROC-0024::STEP-OPERATE_PRINT_QUEUE` | `PRIMARY_OPERATIONAL` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `NONE` | Opera trabajos de impresión; la configuración de impresoras quedó separada en VSCREEN-0177. |
| `VSCREEN-0145` | Contratos, precios y condiciones de proveedor         | `origo`    | `VPROC-0020::STEP-GOVERN_SUPPLIER_TERMS`                    | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `SECONDARY_CONFIGURATION`      | `CONFIG_TERMS`           | La pantalla versiona condiciones contractuales o comerciales reutilizables, pero su intención primaria ya es operativa, administrativa o de supervisión. La configuración permanece acotada, versionada y subordinada al contrato propietario.             |
| `VSCREEN-0146` | Desempeño y reclamaciones de proveedor                | `origo`    | `VPROC-0020::STEP-REVIEW_SUPPLIER_PERFORMANCE`              | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0147` | Oportunidades y cotizaciones de catering o B2B        | `pulso`    | `VPROC-0041::STEP-QUALIFY_B2B_OPPORTUNITY`                  | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0148` | Ejecución de catering o venta B2B                     | `pulso`    | `VPROC-0041::STEP-EXECUTE_B2B_COMMITMENT`                   | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0149` | Operación de reservas y eventos                       | `pulso`    | `VPROC-0047::STEP-MANAGE_RESERVATION_OR_EVENT`              | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0150` | Casos de reclamo y compensación                       | `pulso`    | `VPROC-0046::STEP-RESOLVE_CUSTOMER_CLAIM`                   | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0151` | Coordinación de entrega mediante tercero              | `pulso`    | `VPROC-0050::STEP-COORDINATE_THIRD_PARTY_DELIVERY`          | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0152` | Análisis de satisfacción y servicio                   | `pulso`    | `VPROC-0068::STEP-ANALYZE_SERVICE_SATISFACTION`             | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es vigilar carga, riesgo, desviaciones o resultados; la pantalla no mantiene configuración como objeto principal.                                                                                                                   |
| `VSCREEN-0153` | Paquete laboral para pagos y beneficios               | `numera`   | `VPROC-0010::STEP-PREPARE_LABOR_PAYMENT_PACKAGE`            | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0154` | Facturas y documentos fiscales                        | `numera`   | `VPROC-0051::STEP-MANAGE_FISCAL_DOCUMENT`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0155` | Tesorería y programación de pagos                     | `numera`   | `VPROC-0052::STEP-PLAN_AND_EXECUTE_PAYMENTS`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0156` | Presupuestos, escenarios y forecast                   | `numera`   | `VPROC-0069::STEP-PLAN_BUDGET_AND_FORECAST`                 | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0157` | Impuestos y obligaciones de cumplimiento              | `numera`   | `VPROC-0052::STEP-MANAGE_TAX_OBLIGATION`                    | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `SECONDARY_CONFIGURATION`      | `CONFIG_CONTROL_PLAN`    | La pantalla mantiene planes, calendarios o controles recurrentes, pero su intención primaria ya es operativa, administrativa o de supervisión. La configuración permanece acotada, versionada y subordinada al contrato propietario.                       |
| `VSCREEN-0158` | Distribución y asignación de costos                   | `numera`   | `VPROC-0054::STEP-ALLOCATE_COSTS`                           | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `SECONDARY_CONFIGURATION`      | `CONFIG_ALLOCATION_RULE` | La pantalla define reglas reutilizables de distribución o asignación, pero su intención primaria ya es operativa, administrativa o de supervisión. La configuración permanece acotada, versionada y subordinada al contrato propietario.                   |
| `VSCREEN-0159` | Indicadores, análisis y planes de mejora              | `numera`   | `VPROC-0061::STEP-ANALYZE_AND_PLAN_IMPROVEMENT`             | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es vigilar carga, riesgo, desviaciones o resultados; la pantalla no mantiene configuración como objeto principal.                                                                                                                   |
| `VSCREEN-0160` | Inicio y selección del portal de compras              | `pass`     | `VPROC-0039::STEP-ENTER_CUSTOMER_COMMERCE`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie de cliente. Preferencias, consentimientos, direcciones o elecciones propias no se clasifican como configuración empresarial.                                                                                                             |
| `VSCREEN-0161` | Menú y catálogo comercial del cliente                 | `pass`     | `VPROC-0017::STEP-BROWSE_COMMERCIAL_OFFER`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie de cliente. Preferencias, consentimientos, direcciones o elecciones propias no se clasifican como configuración empresarial.                                                                                                             |
| `VSCREEN-0162` | Carrito y configuración del pedido                    | `pass`     | `VPROC-0039::STEP-CONFIGURE_CART`                           | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Configura una instancia concreta del pedido desde el canal de cliente; no define reglas, maestros ni parámetros reutilizables del sistema.                                                                                                                 |
| `VSCREEN-0163` | Dirección, modalidad y programación de entrega        | `pass`     | `VPROC-0050::STEP-SELECT_FULFILLMENT`                       | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie de cliente. Preferencias, consentimientos, direcciones o elecciones propias no se clasifican como configuración empresarial.                                                                                                             |
| `VSCREEN-0164` | Revisión, checkout e inicio de pago                   | `pass`     | `VPROC-0043::STEP-REVIEW_AND_START_PAYMENT`                 | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie de cliente. Preferencias, consentimientos, direcciones o elecciones propias no se clasifican como configuración empresarial.                                                                                                             |
| `VSCREEN-0165` | Confirmación de pedido y retorno de pago              | `pass`     | `VPROC-0043::STEP-PRESENT_ORDER_RECEIPT`                    | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie de cliente. Preferencias, consentimientos, direcciones o elecciones propias no se clasifican como configuración empresarial.                                                                                                             |
| `VSCREEN-0166` | Mis pedidos y detalle                                 | `pass`     | `VPROC-0039::STEP-CONSULT_PERSONAL_ORDERS`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie de cliente. Preferencias, consentimientos, direcciones o elecciones propias no se clasifican como configuración empresarial.                                                                                                             |
| `VSCREEN-0167` | Seguimiento de preparación y entrega del cliente      | `pass`     | `VPROC-0050::STEP-TRACK_PERSONAL_FULFILLMENT`               | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie de cliente. Preferencias, consentimientos, direcciones o elecciones propias no se clasifican como configuración empresarial.                                                                                                             |
| `VSCREEN-0168` | Chat y comunicación asociada al pedido                | `pass`     | `VPROC-0047::STEP-COMMUNICATE_ABOUT_ORDER`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie de cliente. Preferencias, consentimientos, direcciones o elecciones propias no se clasifican como configuración empresarial.                                                                                                             |
| `VSCREEN-0169` | Mis reclamos y casos de servicio                      | `pass`     | `VPROC-0046::STEP-SUBMIT_AND_TRACK_CLAIM`                   | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie de cliente. Preferencias, consentimientos, direcciones o elecciones propias no se clasifican como configuración empresarial.                                                                                                             |
| `VSCREEN-0170` | Mis reservas y eventos                                | `pass`     | `VPROC-0047::STEP-MANAGE_PERSONAL_RESERVATION`              | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie de cliente. Preferencias, consentimientos, direcciones o elecciones propias no se clasifican como configuración empresarial.                                                                                                             |
| `VSCREEN-0171` | Calificación y satisfacción                           | `pass`     | `VPROC-0068::STEP-SUBMIT_SATISFACTION_RATING`               | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie de cliente. Preferencias, consentimientos, direcciones o elecciones propias no se clasifican como configuración empresarial.                                                                                                             |
| `VSCREEN-0172` | Comunicaciones y notificaciones del cliente           | `pass`     | `VPROC-0047::STEP-CONSULT_CUSTOMER_COMMUNICATION`           | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie de cliente. Preferencias, consentimientos, direcciones o elecciones propias no se clasifican como configuración empresarial.                                                                                                             |
| `VSCREEN-0173` | Trazabilidad e investigación de lote                  | `fogo`     | `VPROC-0035::STEP-INVESTIGATE_BATCH_TRACEABILITY`           | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Reconstruye e investiga historia de lote; su clase primaria corresponde a auditoría y se resolverá en PROC-SCREEN-009.                                                                                                                                     |
| `VSCREEN-0174` | Controles operativos de inocuidad                     | `fogo`     | `VPROC-0014::STEP-EXECUTE_FOOD_SAFETY_CONTROL`              | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0175` | Seguridad de cuenta y sesiones                        | `shell`    | `VPROC-0059::STEP-MANAGE_ACCOUNT_SECURITY`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Resuelve acceso, sesión, contexto o cuenta en tiempo de ejecución; no mantiene configuración empresarial reutilizable.                                                                                                                                     |
| `VSCREEN-0176` | Definición de kits y conjuntos | `nexo` | `VPROC-0067::STEP-MAINTAIN_KIT_DEFINITION` | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE` | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION` | `CONFIG_MASTER_DATA` | Define y versiona el maestro reutilizable consumido por futuras instancias de kit. |
| `VSCREEN-0177` | Configuración de impresoras logísticas | `nexo` | `VPROC-0024::STEP-CONFIGURE_LOGISTICS_PRINTERS` | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE` | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION` | `CONFIG_DEVICE_POLICY` | Mantiene impresoras, capacidades, destinos, vigencia y políticas reutilizables. |

---

#### 13. Resumen por aplicación

| Aplicación | Primaria configuración | Secundaria configuración | Fuera de clase |   Total |
| ---------- | ---------------------: | -----------------------: | -------------: | ------: |
| `shell`    |                      0 |                        0 |              7 |       7 |
| `viso`     |                      4 |                        5 |             22 |      31 |
| `anima`    |                      0 |                        0 |             14 |      14 |
| `nexo`     |                      8 |                        3 |             26 |      37 |
| `fogo`     |                      2 |                        0 |             13 |      15 |
| `origo`    |                      1 |                        2 |             11 |      14 |
| `pulso`    |                      1 |                        0 |             19 |      20 |
| `numera`   |                      0 |                        2 |             18 |      20 |
| `pass`     |                      0 |                        0 |             19 |      19 |
| **Total**  |                 **16** |                   **12** |        **149** | **177** |

La aplicación no determina la clase. El resumen solo reconcilia las 177 filas físicas.

---

#### 14. Resumen por patrón

| Patrón                                    | Pantallas |
| ----------------------------------------- | --------: |
| `CONFIG_STRUCTURE`                        |         2 |
| `CONFIG_POLICY`                           |         4 |
| `CONFIG_ACCESS_MODEL`                     |         2 |
| `CONFIG_DEVICE_POLICY`                    |         2 |
| `CONFIG_CATALOG`                          |         2 |
| `CONFIG_MASTER_DATA`                      |         5 |
| `CONFIG_SPECIFICATION`                    |         1 |
| `CONFIG_PUBLICATION`                      |         2 |
| `CONFIG_TEMPLATE`                         |         1 |
| `CONFIG_CONTROL_PLAN`                     |         5 |
| `CONFIG_TERMS`                            |         1 |
| `CONFIG_ALLOCATION_RULE`                  |         1 |
| **Total con relevancia de configuración** |    **28** |

Las 146 pantallas con `NONE` continúan hacia auditoría, personal o cliente, o conservan una clase primaria ya aprobada.

---

#### 15. Publicación, vigencia e impacto

Toda configuración material deberá declarar posteriormente:

```text
configuration_object_id
configuration_version
lifecycle_status
effective_from
effective_until
scope
affected_processes
affected_screens
impact_summary
validation_result
approved_by
published_at
supersedes
rollback_target
```

Reglas:

1. editar no equivale a publicar;
2. publicar no reescribe casos históricos;
3. el consumidor deberá conocer la versión efectiva;
4. una vigencia futura no podrá aplicarse prematuramente;
5. la retirada conservará historia;
6. el rollback creará una nueva decisión o reactivación trazable;
7. cambios materiales repetirán validación y aprobación;
8. configuraciones sensibles exigirán segregación y autorización de servidor.

---

#### 16. Compatibilidad con clases anteriores

```text
PRIMARY_CONFIGURATION + cualquier otra clase primaria = PROHIBIDO

SECONDARY_CONFIGURATION + PRIMARY_OPERATIONAL = PERMITIDO
SECONDARY_CONFIGURATION + PRIMARY_ADMINISTRATIVE = PERMITIDO
SECONDARY_CONFIGURATION + PRIMARY_SUPERVISION = PERMITIDO
```

La coexistencia secundaria deberá tener fundamento y patrón explícitos.

---

#### 17. Cambio y versionado

Cambiar `configuration_fit` o `configuration_pattern` exige:

1. propuesta trazable;
2. comparación de intención, reutilización, alcance, versión e impacto;
3. conservación del valor anterior;
4. nueva versión de clasificación;
5. revisión de actores, permisos, acciones, auditoría, métricas y pruebas;
6. actualización coordinada del catálogo cuando cambie legítimamente el nombre;
7. nueva identidad de pantalla cuando cambie materialmente la intención principal.

Una tarea de clasificación nunca podrá corregir un nombre “de paso”.

---

#### 18. Validaciones obligatorias

La compilación deberá fallar cuando:

1. falte una de las 177 pantallas;
2. una pantalla aparezca más de una vez;
3. un nombre difiera del catálogo canónico;
4. falte `configuration_fit`;
5. el valor no pertenezca al vocabulario;
6. una primaria o secundaria use `NONE`;
7. una pantalla fuera de clase use un patrón;
8. falte fundamento;
9. las clases anteriores no coincidan;
10. exista otra clase primaria junto con `PRIMARY_CONFIGURATION`;
11. los conteos no sean 16, 12 y 149;
12. los patrones no sumen 29;
13. una personalización de caso se clasifique como configuración;
14. una preferencia personal o de cliente sea configuración empresarial;
15. AURA reciba clasificación;
16. un cambio elimine historia;
17. la puerta final deje más de una clase primaria o ninguna.

---

#### 19. Seguridad y autorización

La clasificación de configuración no concede:

- acceso a catálogos;
- creación o edición;
- publicación;
- aprobación;
- cambio de vigencia;
- rollback;
- exportación;
- administración global;
- acceso territorial;
- acceso por URL directa.

Toda mutación deberá validar permiso, actor, contexto, alcance, versión, impacto, estado y segregación.

---

#### 20. SCREEN-CONFIGURATION-CARRYOVER-REGISTER-001

| Pendiente                                                    | Propietario exacto                                        |
| ------------------------------------------------------------ | --------------------------------------------------------- |
| clasificar pantallas de auditoría                            | `PROC-SCREEN-009`                                         |
| clasificar pantallas personales                              | `PROC-SCREEN-010`                                         |
| clasificar pantallas de cliente y cerrar la puerta de clases | `PROC-SCREEN-011`                                         |
| definir actores                                              | `PROC-SCREEN-012`                                         |
| definir dispositivos                                         | `PROC-SCREEN-013`                                         |
| definir acciones                                             | `PROC-SCREEN-014` y `PROC-SCREEN-015`                     |
| definir estados de interfaz                                  | `PROC-SCREEN-016` a `PROC-SCREEN-021`                     |
| definir sensibilidad y permisos                              | `PROC-SCREEN-022` a `PROC-SCREEN-024`                     |
| vincular operaciones técnicas                                | `PROC-SCREEN-025`                                         |
| resolver rutas y legado                                      | `PROC-SCREEN-026`                                         |
| definir métricas y aceptación                                | `PROC-SCREEN-027` y `PROC-SCREEN-028`                     |
| materializar contratos y validadores                         | paquetes E5 y CI documental                               |
| validar con responsables reales                              | `UX-QA-*` y pilotos E5                                    |
| admitir AURA                                                 | tareas canónicas de AURA y nueva admisión `PROC-SCREEN-*` |

No queda pendiente narrativo sin tarea o puerta de resolución.

---

#### 21. Requisitos de prueba derivados

**Resultado:** GENERA 30 REQUISITOS DE PRUEBA.

Se incorporan `TREQ-UX-699` a `TREQ-UX-728` al Registro Canónico completo. Permanecen en estado `IDENTIFICADO`; automatización, implementación y evidencia corresponden a CI documental, paquetes E5, BLOQUE U, staging y pilotos.

---

#### 22. Criterios de aceptación

- [x] Se clasifican las 177 pantallas.
- [x] Los 177 nombres se conservan exactamente.
- [x] Cada pantalla recibe exactamente un `configuration_fit`.
- [x] Se distinguen 16 primarias, 12 secundarias y 149 fuera de clase.
- [x] Las 28 pantallas relevantes usan doce patrones.
- [x] Ninguna primaria de configuración compite con otra clase primaria.
- [x] Se separa configuración de operación, administración, supervisión y auditoría.
- [x] Se separa configuración reusable de personalización de casos.
- [x] Se definen versión, vigencia, impacto, publicación y rollback.
- [x] AURA conserva cero pantallas.
- [x] La clasificación no concede permisos.
- [x] Se generan `TREQ-UX-699` a `TREQ-UX-728`.
- [x] No se anticipan actores, dispositivos, acciones, estados, permisos, rutas o APIs.
- [x] No se implementa código ni se avanza a `PROC-SCREEN-009`.

---

#### 23. Resultado y continuidad

```text
PROC-SCREEN-007 APROBADA
PROC-SCREEN-008 APROBADA
PROC-SCREEN-009 NO INICIADA
```

La continuidad documental pasa exclusivamente a:

```text
PROC-SCREEN-009 — Clasificar pantalla de auditoría
```


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

