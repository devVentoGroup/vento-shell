### R0 — Preparación, pruebas y contención de riesgos

<!-- EXECUTION-GATE-RECONCILIATION:B201-400:R0 -->
#### Reconciliación topológica de R0

Las nueve tareas de R0 constituyen prerrequisitos físicos compartidos de seguridad y reproducibilidad.

| Propiedad     | Valor                                                 |
| ------------- | ----------------------------------------------------- |
| tareas        | `AUTH-DB-015`, `AUTH-DB-027..029`, `AUTH-DB-001..005` |
| modalidad     | `GLOBAL_ENABLE_ONCE`                                  |
| gate temporal | `PRE_E5_FOUNDATION`                                   |
| identidad     | `<task_id>::GLOBAL`                                   |
| autorización  | explícita por instancia                               |

R0 debe existir antes de autorizar paquetes que modifiquen Supabase. Su función es disponer migraciones versionadas, harness, baseline y drift, backup, restore, rollback y contención inicial de riesgo.

`PRE_E5_FOUNDATION` no significa ejecución automática: cada cambio conserva autorización humana, alcance explícito, validaciones y rollback. R0 tampoco aprueba por sí mismo ninguna migración de dominio ni sustituye `E5-GATE-008::<package_id>` para trabajo perteneciente a un paquete.

### ✅ AUTH-DB-015 — Documentar y versionar todas las migraciones en vento-shell

**Estado:** APROBADA
**Tarea anterior:** AUTH-SRV-018 — Revisar acciones administrativas sin turno
**Tarea siguiente:** AUTH-DB-027 — Crear harness de pruebas de esquema, integridad, RLS, RPC y migraciones
**Tipo de tarea:** Documental
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/01_R0_PREPARACION_PRUEBAS_Y_CONTENCION_DE_RIESGOS.md`
**Estado físico resultante:** Definición documental cerrada; materialización física global posterior pendiente de autorización explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`AUTH-DB-015` define el contrato único para inventariar, identificar, versionar y documentar todas las migraciones de Supabase pertenecientes a VENTO desde `vento-shell`, sin confundir el historial versionado del repositorio con el estado aplicado de un entorno remoto.

La tarea fija cuatro fronteras:

```text
FUENTE SQL CANÓNICA
= supabase/migrations/

INVENTARIO DOCUMENTAL
= supabase/MIGRATION_MANIFEST.md

HISTORIAL VERSIONADO
≠ ESTADO APLICADO EN LOCAL / STAGING / PRODUCCIÓN

DOCUMENTAR Y VERSIONAR
≠ PROBAR ESQUEMA
≠ MEDIR DRIFT
≠ EJECUTAR BACKUP / RESTORE / ROLLBACK
```

Toda migración VENTO nueva pertenece a `vento-shell`. Los repositorios consumidores no crean una autoridad paralela de migraciones.

---

#### 2. Resultado canónico

Queda definido el siguiente modelo:

```text
supabase/migrations/
→ fuente ejecutable canónica de migraciones SQL

supabase/MIGRATION_MANIFEST.md
→ inventario completo, verificable y versionado del contenido de supabase/migrations/

AUTH-DB-015::GLOBAL
→ única instancia física posterior que materializa el manifiesto y reconcilia el historial existente

AUTH-DB-027
→ pruebas de esquema, integridad, RLS, RPC y migraciones

AUTH-DB-028
→ baseline y drift entre local, staging y producción

AUTH-DB-029
→ respaldo, restauración y rollback
```

El manifiesto nunca sustituye los archivos SQL y nunca se convierte en una segunda fuente de verdad sobre su contenido.

---

#### 3. Fuentes y precedencia

La definición conserva y reconcilia:

| Fuente                                               | Uso vinculante                                                                            |
| ---------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| `docs/plan-canonico/modular/01_PROTOCOLO.md`         | continuidad, aprobación explícita, granularidad y trazabilidad                            |
| `docs/plan-canonico/modular/delivery-contract.json`  | estructura validable de entrega y coordinación con 04A                                    |
| `docs/plan-canonico/modular/active-sequence.json`    | `AUTH-DB-015` como tarea documental actual                                                |
| `docs/plan-canonico/modular/task-work-topology.json` | `GLOBAL_ENABLE_ONCE` y `PRE_E5_FOUNDATION`                                                |
| `docs/ARQUITECTURA-MIGRACIONES-CENTRALIZADAS.md`     | centralización en `vento-shell`, directorio canónico y existencia esperada del manifiesto |
| `supabase/migrations/`                               | universo físico versionado que debe inventariarse                                         |
| `AUTH-DB-027`                                        | propietario del harness de pruebas posterior                                              |
| `AUTH-DB-028`                                        | propietario del baseline y drift por entorno                                              |
| `AUTH-DB-029`                                        | propietario de respaldo, restauración y rollback                                          |

La reconciliación topológica vigente del Bloque R prevalece sobre referencias históricas que situaban estas fundaciones exclusivamente después de E5:

```text
AUTH-DB-015
mode = GLOBAL_ENABLE_ONCE
execution_gate = PRE_E5_FOUNDATION
instance = AUTH-DB-015::GLOBAL
```

La aprobación documental no autoriza esa instancia física.

---

#### 4. Línea base verificable

El repositorio actual ya contiene la fuente física:

```text
supabase/migrations/
```

y la arquitectura vigente identifica como inventario esperado:

```text
supabase/MIGRATION_MANIFEST.md
```

La línea base observada presenta un historial real que no puede reducirse a una lista idealizada de nombres. Existen, entre otros, los siguientes casos que la materialización deberá clasificar sin reescribirlos por inferencia:

| Caso observado                                                | Evidencia física                                                                                                                              | Tratamiento contractual                                                |
| ------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| baseline reservado                                            | `00000000000000_baseline.sql`                                                                                                                 | `BASELINE`                                                             |
| sufijo manual histórico                                       | `20260531200500_generate_daily_internal_pos_documents.manual.sql`                                                                             | `MANUAL_LEGACY`                                                        |
| sufijo fixed histórico                                        | `20260605124500_pass_catalog_item_option_recipe_effects.fixed.sql`                                                                            | `FIXED_LEGACY`                                                         |
| archivo vacío seguido por una versión no vacía del mismo slug | `20260707173357_employees_document_identity.sql` y `20260707173408_employees_document_identity.sql`                                           | conservar ambos; marcar el primero `EMPTY_FILE` y declarar su relación |
| contenido idéntico bajo dos versiones                         | `20260309163000_vital_today_feed_scoring_spread_v4.sql` y `20260309170000_vital_today_feed_scoring_type_fix.sql`                              | `CONTENT_DUPLICATE`                                                    |
| contenido idéntico bajo dos versiones                         | `20260317110000_nexo_v1_validation_sandbox_seed.sql` y `20260318213000_nexo_v1_validation_sandbox_reseed.sql`                                 | `CONTENT_DUPLICATE`                                                    |
| contenido idéntico bajo dos versiones                         | `20260709134106_human_permission_catalog_configured_flag_v2.sql` y `20260709143932_human_permission_catalog_configured_flag_v2.sql`           | `CONTENT_DUPLICATE`                                                    |
| contenido idéntico bajo dos versiones                         | `20260709145349_shared_operational_devices_base.sql` y `20260709160904_shared_operational_devices_base.sql`                                   | `CONTENT_DUPLICATE`                                                    |
| contenido idéntico bajo dos versiones                         | `20260709212923_shared_device_operational_role_permission.sql` y `20260709213239_fix_shared_device_operational_role_permission_area_kind.sql` | `CONTENT_DUPLICATE`                                                    |

Estos hallazgos no se declaran errores de base de datos por el solo nombre o hash. Son hechos del historial que deben quedar explícitamente documentados antes de cualquier corrección posterior.

---

#### 5. Universo canónico de migraciones

El universo de `AUTH-DB-015` es:

```text
TODOS los archivos versionados bajo supabase/migrations/
```

Reglas de completitud:

1. cada archivo físico aparece exactamente una vez en el manifiesto;
2. ninguna fila del manifiesto puede apuntar a un archivo inexistente;
3. el total esperado se deriva mecánicamente del árbol real de `supabase/migrations/`, no de una cifra duplicada manualmente en este contrato;
4. el total materializado debe coincidir exactamente con ese universo en el mismo commit;
5. cualquier archivo nuevo obliga a actualizar el manifiesto en el mismo cambio que lo introduce;
6. cualquier archivo omitido, fila huérfana o identidad repetida bloquea la conformidad del inventario;
7. el manifiesto no puede excluir archivos por considerarlos legacy, vacíos, duplicados, manuales o corregidos;
8. un hallazgo se clasifica; no se borra del universo para hacer cuadrar el inventario.

---

#### 6. Contrato de `supabase/MIGRATION_MANIFEST.md`

La materialización posterior deberá crear el inventario completo con una fila por migración y, como mínimo, estas columnas:

| Campo      | Regla                                                           |
| ---------- | --------------------------------------------------------------- |
| `version`  | prefijo de versión del nombre del archivo                       |
| `filename` | nombre exacto del archivo físico                                |
| `sha256`   | huella SHA-256 del contenido exacto                             |
| `bytes`    | tamaño exacto del archivo                                       |
| `kind`     | `BASELINE`, `STANDARD`, `MANUAL_LEGACY` o `FIXED_LEGACY`        |
| `findings` | conjunto explícito de hallazgos; vacío cuando no existan        |
| `lineage`  | relación con otra migración cuando exista evidencia verificable |
| `notes`    | aclaración documental que no sustituye evidencia                |

Valores de `findings` reconocidos inicialmente:

```text
EMPTY_FILE
CONTENT_DUPLICATE
SAME_LOGICAL_FAMILY
LEGACY_NAMING
```

Reglas:

1. `sha256` identifica contenido; no sustituye `version` ni `filename`;
2. dos nombres con el mismo `sha256` siguen siendo dos entradas históricas distintas;
3. `lineage` solo se completa cuando la relación puede demostrarse;
4. una coincidencia semántica de nombre no autoriza a declarar supersesión;
5. el manifiesto no inventa estado de despliegue;
6. el manifiesto no contiene secretos, credenciales, SQL completo ni datos de producción;
7. el orden del manifiesto es ascendente por `version` y después por `filename`;
8. el baseline permanece primero;
9. el contenido del manifiesto se versiona junto con las migraciones que representa.

---

#### 7. Versionado y nombres

Para migraciones nuevas, la forma canónica queda restringida a:

```text
^[0-9]{14}_[a-z0-9][a-z0-9_]*\.sql$
```

Reglas:

1. `00000000000000_baseline.sql` queda reservado como baseline;
2. el prefijo de catorce dígitos es la identidad ordenable de versión de migración;
3. la identidad de versión debe ser única para cada migración nueva;
4. el slug usa minúsculas, números y `_`;
5. no se crean nuevos sufijos `.manual.sql` ni `.fixed.sql`;
6. los sufijos históricos existentes se preservan y se clasifican como legacy;
7. una versión histórica no se renombra para ajustarla retrospectivamente a la convención;
8. el nombre no demuestra por sí solo qué objetos SQL modifica ni en qué entorno fue aplicado;
9. no se interpreta un número de versión como evidencia suficiente de una fecha de despliegue remoto.

---

#### 8. Inmutabilidad del historial

Una migración ya incorporada al historial canónico no se corrige mediante borrado, renombrado o reescritura silenciosa.

Regla por defecto:

```text
CORRECCIÓN DE HISTORIAL
→ nueva migración forward
→ relación documentada en el manifiesto
→ conservación del archivo histórico
```

Excepciones a esta regla requieren una decisión canónica explícita que identifique el archivo, el motivo, los consumidores y el riesgo. `AUTH-DB-015` no concede esa excepción a ningún archivo existente.

Los archivos vacíos o con contenido duplicado se preservan hasta que una tarea propietaria demuestre que procede otra disposición.

---

#### 9. Separación del estado por entorno

El repositorio puede demostrar qué migraciones están versionadas, pero no demuestra por sí solo qué versión está aplicada en cada entorno.

Por tanto, `AUTH-DB-015` no autoriza etiquetas como:

```text
applied_remote
applied_staging
applied_production
pending_production
```

sin evidencia de entorno.

La comparación efectiva entre:

```text
LOCAL
STAGING
PRODUCCIÓN
```

queda reservada a `AUTH-DB-028`.

La validación de respaldo, restauración y rollback queda reservada a `AUTH-DB-029`.

---

#### 10. Detección de duplicados y familias

La materialización de `AUTH-DB-015::GLOBAL` debe revisar el universo completo y producir, sin omisiones:

1. versiones repetidas;
2. nombres físicos repetidos;
3. archivos de cero bytes;
4. contenidos idénticos por SHA-256;
5. slugs iguales o familias lógicas repetidas bajo versiones distintas;
6. sufijos legacy;
7. filas del manifiesto sin archivo;
8. archivos sin fila de manifiesto.

Una detección no implica automáticamente eliminación, rollback ni modificación SQL.

Toda relación debe terminar en una de estas disposiciones documentales:

```text
SIN_HALLAZGO
HISTÓRICO_PRESERVADO
RELACIÓN_DOCUMENTADA
REQUIERE_TAREA_PROPIETARIA
```

`REQUIERE_TAREA_PROPIETARIA` debe indicar una tarea canónica existente antes de cerrar la materialización; no se admite un pendiente narrativo sin dueño.

---

#### 11. Handoff de materialización

La topología de esta tarea es:

```text
mode = GLOBAL_ENABLE_ONCE
execution_gate = PRE_E5_FOUNDATION
instance = AUTH-DB-015::GLOBAL
```

La futura instancia física global deberá materializar, como mínimo:

1. `supabase/MIGRATION_MANIFEST.md`;
2. una fila por cada archivo existente en `supabase/migrations/`;
3. SHA-256 y tamaño exactos por archivo;
4. clasificación de baseline, estándar y excepciones legacy;
5. detección completa de archivos vacíos, contenidos duplicados y familias lógicas repetidas;
6. relaciones documentadas cuando exista evidencia suficiente;
7. regla de actualización conjunta para toda migración nueva.

La instancia no queda autorizada por esta tarea documental.

---

#### 12. Frontera con las tareas siguientes

`AUTH-DB-015` no absorbe:

| Tarea         | Responsabilidad reservada                                                  |
| ------------- | -------------------------------------------------------------------------- |
| `AUTH-DB-027` | crear el harness de pruebas de esquema, integridad, RLS, RPC y migraciones |
| `AUTH-DB-028` | establecer baseline y medir drift entre local, staging y producción        |
| `AUTH-DB-029` | validar respaldo, restauración y rollback antes del primer paquete         |

Handoff:

```text
AUTH-DB-015
→ entrega inventario y versionado verificables

AUTH-DB-027
→ prueba lo versionado

AUTH-DB-028
→ compara lo versionado con los entornos

AUTH-DB-029
→ valida recuperación y reversibilidad operacional
```

---

#### 13. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA NUEVOS
**Requisitos creados:** **0**
**Requisitos modificados:** **0**

La cobertura necesaria ya existe en el registro vigente y esta tarea no redefine su regla protegida.

---

#### 14. Cobertura de prueba vigente reutilizada

`TREQ-SUPABASE-008` ya protege explícitamente el ciclo de migraciones y asigna responsabilidad a `AUTH-DB-015` junto con las tareas posteriores de pruebas, drift y recuperación.

Esta tarea reutiliza esa cobertura sin modificar el requisito ni el registro 04A.

---

#### 15. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                    |
| --------- | -------------- | ---------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | pendiente de la materialización local de la entrega documental               |
| LOCAL     | NOT_EXECUTED   | pendiente de validadores del checkout de tarea                               |
| REMOTA    | NOT_EXECUTED   | no se usa una lectura remota como sustituto de las validaciones del checkout |
| OPERATIVA | NOT_APPLICABLE | esta tarea no aplica migraciones ni modifica entornos                        |
| FÍSICA    | NOT_APPLICABLE | la instancia `AUTH-DB-015::GLOBAL` permanece separada y no autorizada        |

---

#### 16. Decisiones vinculantes

1. `supabase/migrations/` es la fuente SQL canónica de migraciones VENTO.
2. `supabase/MIGRATION_MANIFEST.md` es el inventario versionado y no una segunda fuente SQL.
3. Toda migración física existente debe aparecer exactamente una vez en el manifiesto.
4. No se hardcodea una cardinalidad que pueda quedar obsoleta; la cardinalidad se deriva del árbol físico del mismo commit.
5. Cada fila conserva `version`, `filename`, SHA-256, bytes, tipo, hallazgos, lineage y notas.
6. Los duplicados de contenido se documentan sin borrar identidades históricas.
7. Los archivos vacíos se documentan sin asumir automáticamente que son inválidos.
8. Los sufijos `.manual.sql` y `.fixed.sql` existentes se preservan como legacy y no se permiten para migraciones nuevas.
9. Las migraciones nuevas usan un prefijo numérico de catorce dígitos y slug normalizado.
10. Una migración histórica no se renombra ni reescribe silenciosamente.
11. Una corrección usa por defecto una migración forward nueva y conserva trazabilidad.
12. El repositorio no demuestra por sí solo el estado aplicado de local, staging o producción.
13. `AUTH-DB-015` no ejecuta pruebas de esquema, drift, backup, restore ni rollback.
14. `AUTH-DB-027`, `AUTH-DB-028` y `AUTH-DB-029` conservan sus responsabilidades exclusivas.
15. La tarea no modifica SQL, Supabase, migraciones existentes ni entornos.
16. La única materialización propia posterior es `AUTH-DB-015::GLOBAL`.
17. La aprobación documental no autoriza esa instancia física.
18. No se crea ni modifica ningún requisito de prueba.

---

#### 17. Criterios de aceptación

`AUTH-DB-015` queda documentalmente cerrada cuando:

- `supabase/migrations/` quede definido como universo canónico;
- `supabase/MIGRATION_MANIFEST.md` quede definido como inventario completo y verificable;
- exista una regla de una fila por archivo y cero filas huérfanas;
- cada identidad futura tenga convención de versionado inequívoca;
- el baseline y las excepciones legacy queden preservados;
- archivos vacíos, contenidos duplicados y familias repetidas tengan tratamiento contractual;
- ninguna coincidencia de nombre o hash implique borrado o supersesión automática;
- el manifiesto no afirme estado remoto sin evidencia de entorno;
- la frontera con pruebas, drift y recuperación permanezca explícita;
- la instancia física quede identificada como `AUTH-DB-015::GLOBAL`;
- esa instancia permanezca sin autorización física por inferencia;
- se reutilice la cobertura de prueba vigente sin modificar 04A.

---

#### 18. Límites

`AUTH-DB-015` no:

- crea ni modifica migraciones SQL;
- aplica migraciones;
- ejecuta `db push`;
- consulta ni altera datos productivos;
- corrige archivos vacíos o duplicados;
- elimina o renombra historial;
- implementa el harness de `AUTH-DB-027`;
- calcula drift por entorno;
- ejecuta backup, restore o rollback;
- crea una tarea nueva para cada hallazgo sin comprobar antes el propietario canónico;
- autoriza `AUTH-DB-015::GLOBAL`;
- modifica `AUTH-DB-027`, `AUTH-DB-028` ni `AUTH-DB-029`.

---

#### 19. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-SRV-018 — Revisar acciones administrativas sin turno`

**TAREA ACTUAL APROBADA**
`AUTH-DB-015 — Documentar y versionar todas las migraciones en vento-shell`

**SIGUIENTE TAREA RESERVADA**
`AUTH-DB-027 — Crear harness de pruebas de esquema, integridad, RLS, RPC y migraciones`


### ✅ AUTH-DB-027 — Crear harness de pruebas de esquema, integridad, RLS, RPC y migraciones

**Estado:** APROBADA
**Tarea anterior:** AUTH-DB-015 — Documentar y versionar todas las migraciones en vento-shell
**Tarea siguiente:** AUTH-DB-028 — Establecer baseline y control de drift entre local, staging y producción
**Tipo de tarea:** Documental
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/01_R0_PREPARACION_PRUEBAS_Y_CONTENCION_DE_RIESGOS.md`
**Estado físico resultante:** Contrato documental cerrado; futura instancia global `AUTH-DB-027::GLOBAL` pendiente de autorización explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`AUTH-DB-027` define el harness global y reutilizable con el que VENTO deberá probar una base Supabase reconstruida desde las migraciones canónicas antes de permitir que tareas posteriores modifiquen esquema, datos, RLS, RPC, funciones, grants o contratos persistentes.

El harness debe cubrir cinco carriles independientes:

```text
SCHEMA
INTEGRITY
RLS
RPC
MIGRATIONS
```

La finalidad no es crear una prueba específica por cada tabla o función en esta tarea documental. La finalidad es fijar una infraestructura única que permita incorporar casos concretos sin inventar runners, fixtures o reglas de evidencia por paquete.

Frontera principal:

```text
HARNESS GLOBAL
= mecanismo reusable de ejecución, aislamiento, aserción y evidencia

CASOS DE DOMINIO
= pruebas concretas añadidas por las tareas que cambian comportamiento

DRIFT DE ENTORNOS
= AUTH-DB-028

BACKUP / RESTORE / ROLLBACK
= AUTH-DB-029
```

---

#### 2. Resultado canónico

Queda aprobado el siguiente modelo:

```text
AUTH-DB-027
→ define una vez el contrato del harness

AUTH-DB-027::GLOBAL
→ materializa una vez la infraestructura física reusable

supabase/migrations/
→ única fuente ejecutable de reconstrucción del esquema

supabase/tests/database/
→ ubicación canónica de pruebas SQL de base de datos

scripts/quality/
→ ubicación del orquestador de calidad del harness

package.json
→ expone entradas reproducibles para ejecutar el harness

paquetes y tareas posteriores
→ agregan casos al harness existente
→ no crean runners paralelos
```

La infraestructura física será global. Los paquetes futuros consumen el harness y amplían cobertura, pero no reabren `AUTH-DB-027` como instancia por paquete.

---

#### 3. Fuentes y precedencia

La definición conserva y reconcilia:

| Fuente                                               | Uso vinculante                                                                 |
| ---------------------------------------------------- | ------------------------------------------------------------------------------ |
| `docs/plan-canonico/modular/01_PROTOCOLO.md`         | continuidad, aprobación explícita, trazabilidad y separación documental/física |
| `docs/plan-canonico/modular/delivery-contract.json`  | estructura validable de la entrega                                             |
| `docs/plan-canonico/modular/active-sequence.json`    | `AUTH-DB-027` como tarea documental actual                                     |
| `docs/plan-canonico/modular/task-work-topology.json` | `GLOBAL_ENABLE_ONCE` y `PRE_E5_FOUNDATION`                                     |
| reconciliación topológica de R0                      | nueve fundaciones globales reutilizables antes de paquetes Supabase            |
| `AUTH-DB-015`                                        | fuente canónica y versionado de migraciones                                    |
| `SUPA-TRANS-016`                                     | requisitos históricos de reconstrucción, pruebas, seguridad y transición       |
| `supabase/config.toml`                               | configuración local vigente de Supabase                                        |
| `package.json`                                       | runtime, dependencias y scripts existentes                                     |
| `supabase/migrations/`                               | historial SQL ejecutable                                                       |
| `supabase/public_schema_check.sql`                   | evidencia auxiliar del esquema actual; no fuente de reconstrucción             |
| `supabase/schema/remote-schema.sql`                  | artefacto observado vacío; no fuente de reconstrucción                         |
| Registro Canónico de Requisitos de Prueba            | cobertura vigente de RLS/RPC y migraciones                                     |

La reconciliación topológica vigente del archivo propietario prevalece sobre la cláusula histórica de `SUPA-TRANS-016` que situaba R0 únicamente dentro de un paquete:

```text
AUTH-DB-027
mode = GLOBAL_ENABLE_ONCE
execution_gate = PRE_E5_FOUNDATION
instance = AUTH-DB-027::GLOBAL
```

Esto cambia la cardinalidad y el momento de materialización del harness, pero no autoriza ejecución automática ni modifica el gate de las migraciones de dominio.

---

#### 4. Línea base verificable

El repositorio actual presenta:

| Superficie                          | Estado observado                   | Disposición                                                     |
| ----------------------------------- | ---------------------------------- | --------------------------------------------------------------- |
| dependencia de Supabase CLI         | presente en `package.json`         | reutilizar; no incorporar un runner de base de datos competidor |
| PostgreSQL local                    | major 17 en `supabase/config.toml` | ambiente local de referencia del harness                        |
| migraciones                         | habilitadas                        | fuente de reconstrucción                                        |
| seed global                         | deshabilitado                      | conservar; los fixtures pertenecen a las pruebas                |
| `supabase/tests/`                   | no existe en el árbol actual       | materialización pendiente de `AUTH-DB-027::GLOBAL`              |
| script npm específico de pruebas DB | no observado                       | materialización pendiente                                       |
| `supabase/public_schema_check.sql`  | snapshot SQL extenso               | evidencia auxiliar; nunca sustituye migraciones                 |
| `supabase/schema/remote-schema.sql` | cero bytes                         | no utilizar como baseline ejecutable                            |
| harness RLS/RPC central             | no observado                       | materialización pendiente                                       |

El harness parte del estado real. No declara como ya existentes pruebas, fixtures, helpers o resultados que todavía no están versionados.

---

#### 5. Invariantes del harness

Toda materialización deberá cumplir simultáneamente:

1. usar exclusivamente una instancia Supabase local controlada para la batería base;
2. reconstruir el esquema desde `supabase/migrations/`;
3. no depender de un dump de producción;
4. no depender de `supabase/public_schema_check.sql` para crear el esquema;
5. mantener deshabilitado el seed global mientras no exista una tarea propietaria que cambie esa decisión;
6. crear sus propios fixtures de prueba de manera aislada;
7. no depender del orden de ejecución entre archivos de prueba;
8. revertir los datos de cada caso cuando el runner transaccional lo permita;
9. no usar credenciales, secretos o datos reales como fixtures;
10. ejecutar aserciones positivas y negativas;
11. producir estado no conforme ante cualquier fallo de reconstrucción o aserción;
12. conservar salida operativa ASCII segura;
13. permitir añadir cobertura sin editar el núcleo del runner;
14. impedir que un paquete introduzca un segundo harness de base de datos;
15. no tratar `service_role` como sustituto de una prueba de autorización RLS.

---

#### 6. Arquitectura física futura

`AUTH-DB-027::GLOBAL` deberá materializar cuatro capas:

| Capa                    | Propiedad                  | Responsabilidad                                                                                                                         |
| ----------------------- | -------------------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| orquestación            | `scripts/quality/`         | comprobar prerequisitos locales, seleccionar modo, ejecutar reconstrucción cuando corresponda, lanzar pruebas y consolidar resultado    |
| pruebas SQL             | `supabase/tests/database/` | aserciones pgTAP sobre esquema, integridad, RLS, RPC y estado posterior a migraciones                                                   |
| exposición npm          | `package.json`             | entradas estables para ejecución normal y reconstrucción limpia                                                                         |
| pruebas del orquestador | `scripts/quality/`         | comprobar lógica fail-closed, clasificación de errores, restricciones de entorno y resumen de evidencia sin requerir un proyecto remoto |

No se crea una dependencia externa de testing cuando la capacidad ya está disponible mediante el stack Supabase local.

---

#### 7. Dos modos de ejecución

El harness debe separar:

##### Modo incremental local

Objetivo:

```text
stack local ya disponible
→ ejecutar pruebas de base de datos
→ no reconstruir automáticamente
```

Uso:

- iteración rápida;
- desarrollo de un caso;
- diagnóstico local;
- repetición de una suite sin destruir la instancia.

##### Modo reconstrucción limpia

Objetivo:

```text
base local controlada
→ reconstrucción desde cero
→ aplicación íntegra de migraciones
→ ejecución de toda la suite
→ resultado único
```

Este modo es el gate reproducible de migraciones.

Reglas:

1. cualquier fallo de reconstrucción bloquea las pruebas posteriores;
2. una reconstrucción correcta no equivale por sí sola a PASS;
3. el PASS exige también completar las cinco categorías;
4. ambos modos usan el mismo conjunto de casos;
5. ninguno opera contra staging o producción;
6. la selección de un destino remoto no pertenece al harness base.

---

#### 8. Contrato de pruebas de esquema

La categoría `SCHEMA` debe permitir verificar, según los contratos de cada tarea consumidora:

- existencia y ausencia esperada de schemas;
- tablas;
- vistas;
- columnas;
- tipos;
- enums;
- claves primarias;
- claves foráneas;
- constraints;
- índices;
- triggers;
- funciones y procedimientos;
- firmas de argumentos y retornos;
- propiedades de seguridad relevantes;
- grants explícitos cuando formen parte del contrato;
- RLS habilitado cuando la superficie esté expuesta.

Reglas:

1. la prueba compara contra una expectativa canónica explícita, no contra un dump aceptado automáticamente;
2. un objeto adicional solo es fallo cuando exista una regla que prohíba esa extensión o demuestre drift;
3. el harness no convierte diferencias de entorno en conclusiones de `AUTH-DB-028`;
4. los casos de esquema deben poder ejecutarse después de una reconstrucción limpia sin preparación manual.

---

#### 9. Contrato de pruebas de integridad

La categoría `INTEGRITY` debe soportar:

- `NOT NULL`;
- unicidad;
- claves primarias;
- claves foráneas;
- `CHECK`;
- cardinalidades;
- invariantes entre columnas;
- restricciones de estado;
- relaciones obligatorias;
- efectos de delete/update definidos;
- rechazo de datos inválidos;
- conservación de datos válidos;
- atomicidad de operaciones cuando el contrato la exija.

Cada caso debe incluir al menos una de estas formas:

```text
VALID_INPUT → ACCEPTED
INVALID_INPUT → REJECTED
VALID_TRANSITION → PRESERVED
PARTIAL_FAILURE → NO_INCONSISTENT_COMMIT
```

El harness no usa errores textuales de PostgreSQL como única aserción cuando pueda verificarse el estado final.

---

#### 10. Contrato de pruebas RLS

La categoría `RLS` es obligatoriamente negativa y positiva.

Matriz mínima por superficie protegida cuando sea aplicable:

| Actor/contexto                            | Expectativa                                        |
| ----------------------------------------- | -------------------------------------------------- |
| sesión ausente                            | denegar salvo contrato público explícito           |
| usuario autenticado autorizado            | permitir únicamente la operación y filas aprobadas |
| usuario autenticado ajeno                 | denegar acceso lateral                             |
| actor con territorio incorrecto           | denegar                                            |
| actor con permiso o contexto insuficiente | denegar                                            |
| parámetros manipulados                    | no ampliar alcance                                 |
| acceso directo a tabla                    | resultado equivalente a la política aprobada       |

Reglas:

1. las pruebas simulan rol y claims requeridos por el contrato;
2. `service_role` no sirve para demostrar que RLS protege una operación;
3. una política que devuelve cero filas cuando debía permitir acceso es fallo;
4. una operación que modifica cero filas cuando debía denegarse de forma observable debe comprobar también el estado final;
5. las pruebas de `UPDATE` verifican tanto elegibilidad de fila como validez del nuevo estado cuando el contrato lo requiera;
6. una superficie pública debe demostrar explícitamente su condición pública;
7. RLS habilitado sin caso positivo y negativo no constituye cobertura suficiente.

---

#### 11. Contrato de pruebas RPC y funciones

La categoría `RPC` debe soportar, según el contrato propietario:

- existencia;
- firma;
- tipo de retorno;
- permisos de ejecución;
- `SECURITY INVOKER` o `SECURITY DEFINER`;
- `search_path` cuando sea vinculante;
- actor autorizado;
- actor no autorizado;
- parámetros manipulados;
- territorio;
- idempotencia;
- atomicidad;
- efectos persistentes;
- errores contractuales seguros;
- ausencia de bypass frente a RLS o al evaluador canónico.

Cuando una RPC sea una frontera sensible:

```text
MISMO ACTOR
+ MISMO CONTEXTO
+ MISMO RECURSO
+ MISMO TERRITORIO
→ decisión equivalente entre evaluador, RPC y RLS
```

La prueba no puede demostrar equivalencia utilizando un rol que evada las políticas por diseño.

---

#### 12. Contrato de pruebas de migraciones

La categoría `MIGRATIONS` debe comprobar:

1. reconstrucción completa desde la fuente canónica;
2. aplicación ordenada sin intervención manual;
3. ausencia de dependencia de un seed global;
4. disponibilidad de los objetos contractualmente requeridos después de reconstruir;
5. integración con el inventario de migraciones producido por `AUTH-DB-015::GLOBAL` cuando esa instancia esté verificada;
6. detección de archivo físico no inventariado;
7. detección de entrada inventariada sin archivo;
8. conservación del historial legacy sin renombrados automáticos;
9. ejecución de las cuatro categorías restantes sobre la base reconstruida;
10. fallo cerrado ante una migración inválida.

El harness no define:

- paridad entre local, staging y producción;
- baseline ambiental;
- backup;
- restore;
- rollback operacional.

Esas responsabilidades permanecen reservadas.

---

#### 13. Fixtures y aislamiento

Los fixtures del harness obedecen:

1. no contienen datos productivos;
2. no se cargan mediante un seed global;
3. cada archivo crea únicamente los datos que necesita;
4. los identificadores de prueba son controlados o generados dentro del caso;
5. un caso no depende de residuos de otro;
6. los datos se revierten al terminar siempre que la capa de pruebas permita transacción;
7. cuando una propiedad requiera persistencia entre conexiones, el caso debe usar un namespace de prueba inequívoco y limpieza explícita;
8. los fixtures de autorización representan actores mínimos y no reproducen perfiles personales reales;
9. los secretos se sustituyen por valores sintéticos;
10. los tests no modifican configuración alojada.

---

#### 14. Gobierno de casos y extensibilidad

Cada cambio físico posterior que altere comportamiento Supabase deberá:

```text
regla protegida existente
→ reutilizar TREQ
→ agregar o modificar caso en la categoría correspondiente

regla protegida nueva
→ crear TREQ en su tarea propietaria
→ agregar caso al mismo harness
```

No se admiten:

- scripts ad hoc sin entrada desde el harness;
- una suite RLS separada por aplicación;
- un runner distinto por paquete;
- pruebas que solo puedan ejecutarse manualmente desde un editor SQL;
- fixtures que dependan de estado productivo;
- un resultado PASS sustentado únicamente en build de TypeScript;
- pruebas saltadas silenciosamente por ausencia de variables.

Una capacidad opcional debe declararse explícitamente como aplicable o no aplicable por el caso propietario.

---

#### 15. Contrato de fallo y evidencia

El harness debe fallar cerrado.

Resultado mínimo consolidado:

| Dato               | Regla                                                      |
| ------------------ | ---------------------------------------------------------- |
| modo               | incremental local o reconstrucción limpia                  |
| runtime            | versión Node y versión de Supabase CLI observadas          |
| PostgreSQL         | versión mayor observada                                    |
| migraciones        | cantidad física ejecutable observada                       |
| archivos de prueba | cantidad descubierta                                       |
| aserciones         | total ejecutado                                            |
| categorías         | estado individual de las cinco categorías                  |
| fallos             | archivo/caso y causa mínima                                |
| resultado global   | PASS únicamente con todos los gates aplicables satisfechos |

Reglas:

1. cualquier proceso hijo no cero produce FAIL;
2. cero archivos de prueba produce FAIL;
3. una categoría obligatoria sin caso produce FAIL;
4. una aserción omitida no se cuenta como PASS;
5. una prueba marcada skip requiere una causa contractual explícita y no puede ocultar una categoría vacía;
6. la salida destinada al operador usa ASCII seguro;
7. el resumen no imprime secretos ni cadenas de conexión completas;
8. la evidencia permite rastrear el resultado al commit de la materialización;
9. la instancia física conserva evidencia consolidada solo después de ejecutar las validaciones autorizadas.

---

#### 16. Integración con la cadena R0

Handoff:

```text
AUTH-DB-015
→ define e inventaría migraciones

AUTH-DB-027
→ prueba reconstrucción y contratos de base

AUTH-DB-028
→ usa una base reproducible y compara entornos

AUTH-DB-029
→ prueba recuperación y reversibilidad operacional

AUTH-DB-001..005
→ incorporan casos de seguridad al harness antes de cerrar sus correcciones
```

Orden físico previsto de las fundaciones iniciales:

```text
AUTH-DB-015::GLOBAL
→ AUTH-DB-027::GLOBAL
→ AUTH-DB-028::GLOBAL
→ AUTH-DB-029::GLOBAL
```

La definición documental puede avanzar por continuidad sin convertir este orden físico en autorización.

---

#### 17. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA NUEVOS
**Requisitos creados:** **0**
**Requisitos modificados:** **0**

La tarea materializa infraestructura de ejecución para reglas de prueba ya registradas. No introduce una regla empresarial, de seguridad o de migración distinta de las coberturas vigentes.

---

#### 18. Cobertura de prueba vigente reutilizada

`TREQ-SUPABASE-007` ya exige equivalencia entre evaluador, RPC y RLS para el mismo actor, contexto, permiso, recurso y territorio, e identifica `AUTH-DB-027` como responsable.

`TREQ-SUPABASE-008` ya exige reconstrucción limpia, upgrade soportado, integridad, constraints, RLS, RPC, tipos y migraciones, e identifica `AUTH-DB-027` dentro de su cadena responsable.

`AUTH-DB-027` convierte esas obligaciones en una infraestructura reutilizable sin cambiar la regla protegida ni el Registro Canónico de Requisitos de Prueba.

---

#### 19. Evidencia de validación

| Clase     | Estado         | Evidencia                                                              |
| --------- | -------------- | ---------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | pendiente de materialización local del artefacto documental en su rama |
| LOCAL     | NOT_EXECUTED   | pendiente de validadores documentales del checkout                     |
| REMOTA    | NOT_EXECUTED   | no se usa lectura remota como sustituto de validación local            |
| OPERATIVA | NOT_APPLICABLE | la tarea no ejecuta pruebas contra un entorno Supabase                 |
| FÍSICA    | NOT_APPLICABLE | `AUTH-DB-027::GLOBAL` permanece separada y sin autorización            |

---

#### 20. Decisiones vinculantes

1. Existe un único harness global de base de datos para VENTO.
2. Su instancia física es `AUTH-DB-027::GLOBAL`.
3. La instancia usa `GLOBAL_ENABLE_ONCE`.
4. Su gate es `PRE_E5_FOUNDATION`.
5. El harness se materializa en `vento-shell`.
6. Las migraciones de `supabase/migrations/` son la fuente de reconstrucción.
7. `supabase/public_schema_check.sql` no es fuente de reconstrucción.
8. `supabase/schema/remote-schema.sql` no es fuente de reconstrucción.
9. El seed global permanece deshabilitado.
10. Los fixtures pertenecen a las pruebas y deben quedar aislados.
11. La suite SQL canónica reside bajo `supabase/tests/database/`.
12. La orquestación pertenece a `scripts/quality/`.
13. El harness reutiliza el runner de base de datos suministrado por Supabase CLI y pgTAP.
14. Deben existir modos incremental local y reconstrucción limpia.
15. La reconstrucción limpia precede al PASS de migraciones.
16. Las categorías obligatorias son `SCHEMA`, `INTEGRITY`, `RLS`, `RPC` y `MIGRATIONS`.
17. RLS requiere casos positivos y negativos.
18. `service_role` no demuestra protección RLS.
19. RPC sensibles deben permitir probar equivalencia con RLS y evaluador.
20. Cero tests o una categoría obligatoria vacía producen FAIL.
21. Un paquete futuro amplía casos; no crea otro runner.
22. El harness base no accede a staging ni producción.
23. El drift de entornos pertenece a `AUTH-DB-028`.
24. Backup, restore y rollback pertenecen a `AUTH-DB-029`.
25. Esta tarea no modifica SQL, configuración, scripts, datos ni Supabase.
26. La aprobación documental no autoriza `AUTH-DB-027::GLOBAL`.
27. No se crea ni modifica ningún requisito de prueba.

---

#### 21. Criterios de aceptación

`AUTH-DB-027` queda documentalmente cerrada cuando:

- exista una única arquitectura de harness reusable;
- estén separados runner, pruebas SQL, exposición npm y pruebas del orquestador;
- las cinco categorías obligatorias tengan contratos explícitos;
- se preserve `supabase/migrations/` como fuente ejecutable;
- el seed global permanezca fuera del mecanismo de fixtures;
- exista un modo de reconstrucción limpia previo a la suite completa;
- exista un modo incremental local para iteración;
- los casos RLS incluyan permiso y denegación;
- los casos RPC puedan comprobar autorización, grants y efectos;
- los casos de integridad puedan comprobar aceptación y rechazo;
- la suite no dependa de datos productivos ni de orden entre tests;
- cero tests y categorías vacías fallen cerradas;
- no exista dependencia de staging o producción;
- la frontera con `AUTH-DB-028` y `AUTH-DB-029` permanezca intacta;
- `AUTH-DB-015` sea consumido como fuente de migraciones e inventario;
- la futura instancia quede identificada como `AUTH-DB-027::GLOBAL`;
- esa instancia permanezca sin autorización física por inferencia;
- se reutilice la cobertura TREQ vigente sin modificar 04A.

---

#### 22. Límites

`AUTH-DB-027` no:

- crea físicamente `supabase/tests/`;
- crea scripts;
- modifica `package.json`;
- ejecuta pruebas de base de datos;
- inicia, reinicia o destruye una instancia local;
- aplica migraciones;
- modifica migraciones existentes;
- consulta staging o producción;
- mide drift ambiental;
- realiza backup;
- restaura una base;
- ejecuta rollback;
- crea datos productivos;
- cambia RLS, RPC, grants, functions o constraints;
- autoriza `AUTH-DB-027::GLOBAL`;
- modifica `AUTH-DB-028` ni `AUTH-DB-029`;
- crea un requisito de prueba duplicado.

---

#### 23. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-DB-015 — Documentar y versionar todas las migraciones en vento-shell`

**TAREA ACTUAL APROBADA**
`AUTH-DB-027 — Crear harness de pruebas de esquema, integridad, RLS, RPC y migraciones`

**SIGUIENTE TAREA RESERVADA**
`AUTH-DB-028 — Establecer baseline y control de drift entre local, staging y producción`


### ✅ AUTH-DB-028 — Establecer baseline y control de drift entre local, staging y producción

**Estado:** APROBADA
**Tarea anterior:** AUTH-DB-027 — Crear harness de pruebas de esquema, integridad, RLS, RPC y migraciones
**Tarea siguiente:** AUTH-DB-029 — Validar respaldo, restauración y rollback antes del primer paquete
**Tipo de tarea:** Documental
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/01_R0_PREPARACION_PRUEBAS_Y_CONTENCION_DE_RIESGOS.md`
**Estado físico resultante:** Contrato documental cerrado; futura instancia global `AUTH-DB-028::GLOBAL` pendiente de autorización explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`AUTH-DB-028` establece una única fundación global para construir baselines verificables y detectar drift entre el estado esperado por `vento-shell` y los ambientes local, staging y producción, sin convertir la comparación en una autorización implícita para reparar, promover o modificar ningún ambiente.

La tarea materializa documentalmente esta frontera:

```text
ESTADO ESPERADO VERSIONADO
+
IDENTIDAD INEQUÍVOCA DEL AMBIENTE
+
ESTADO OBSERVADO READ-ONLY
↓
BASELINE + COMPARACIÓN
↓
SIN DIFERENCIAS
o
EXPECTED_OVERLAY
o
TEMPORARY_EXCEPTION
o
UNAUTHORIZED_DRIFT
o
INSUFFICIENT_EVIDENCE
```

La regla central es:

```text
DRIFT CONTROLADO
≠ IGUALDAD BYTE-A-BYTE ENTRE AMBIENTES

DRIFT CONTROLADO
= ninguna diferencia no autorizada
+ toda diferencia deliberada tipada, aprobada y trazable
+ evidencia suficiente de las superficies aplicables
```

---

#### 2. Resultado canónico

Queda aprobado el siguiente modelo:

```text
AUTH-DB-015
→ define e inventaría las migraciones canónicas

AUTH-DB-027
→ demuestra que una reconstrucción limpia y los contratos de base son ejecutables

AUTH-DB-028
→ fija la referencia esperada
→ identifica cada ambiente
→ observa sus superficies
→ compara expected vs observed
→ clasifica drift
→ produce evidencia reproducible

AUTH-DB-029
→ consume candidato + ambiente + baseline
→ valida backup, restore y rollback
```

`AUTH-DB-028` no crea otra fuente de verdad de schema. El estado esperado se deriva de los artefactos versionados de `vento-shell` y el estado observado se utiliza únicamente como evidencia de comparación.

---

#### 3. Topología y gate

La reconciliación vigente de R0 establece:

```text
mode = GLOBAL_ENABLE_ONCE
execution_gate = PRE_E5_FOUNDATION
instance = AUTH-DB-028::GLOBAL
```

Interpretación:

1. el contrato se define documentalmente una sola vez;
2. la futura instancia `AUTH-DB-028::GLOBAL` materializa una única infraestructura reusable de baseline y drift;
3. los paquetes posteriores reutilizan esa infraestructura y producen evidencia de sus candidatos y ambientes;
4. no se crea una nueva instancia `AUTH-DB-028::<package_id>`;
5. la aprobación documental no autoriza `AUTH-DB-028::GLOBAL`;
6. `PRE_E5_FOUNDATION` permite materializar la fundación antes de E5, pero no constituye despliegue de ningún paquete.

---

#### 4. Fuentes vinculantes

| Fuente                                               | Uso vinculante                                                                          |
| ---------------------------------------------------- | --------------------------------------------------------------------------------------- |
| `docs/plan-canonico/modular/01_PROTOCOLO.md`         | continuidad, separación documental/física y aprobación explícita                        |
| `docs/plan-canonico/modular/delivery-contract.json`  | formato validable de la tarea                                                           |
| `docs/plan-canonico/modular/active-sequence.json`    | `AUTH-DB-027` como anterior y `AUTH-DB-028` como actual                                 |
| `docs/plan-canonico/modular/task-work-topology.json` | `GLOBAL_ENABLE_ONCE` + `PRE_E5_FOUNDATION`                                              |
| `AUTH-DB-015`                                        | migraciones canónicas, manifiesto e inmutabilidad del historial                         |
| `AUTH-DB-027`                                        | harness reusable y reconstrucción limpia                                                |
| `SUPA-TRANS-013`                                     | contrato ambiental, candidate manifest, fingerprints, overlays, excepciones y evidencia |
| `SUPA-TRANS-016`                                     | R0 y orden `015 → 027 → 028 → 029`                                                      |
| `supabase/config.toml`                               | configuración local versionada                                                          |
| `supabase/migrations/`                               | fuente ejecutable del historial                                                         |
| Registro Canónico de Requisitos de Prueba            | regla vigente de drift y reproducibilidad                                               |

`SUPA-TRANS-013` conserva autoridad sobre el significado de paridad ambiental. `AUTH-DB-028` lo convierte en una fundación reusable de R0 sin duplicar sus 970 unidades históricas de transición.

---

#### 5. Línea base física observada

En el corte de preparación de esta tarea:

| Superficie                                   | Estado observado                   | Disposición                                                                        |
| -------------------------------------------- | ---------------------------------- | ---------------------------------------------------------------------------------- |
| proyecto local                               | `project_id = vento-shell`         | identidad local versionada                                                         |
| PostgreSQL local                             | major `17`                         | debe coincidir en major con el remoto objetivo                                     |
| migraciones                                  | habilitadas                        | fuente de reconstrucción                                                           |
| seed global                                  | deshabilitado                      | no forma parte del baseline de datos                                               |
| `supabase/migrations/`                       | existente                          | fuente ejecutable canónica                                                         |
| `supabase/MIGRATION_MANIFEST.md`             | todavía no materializado en `main` | será consumido cuando `AUTH-DB-015::GLOBAL` quede verificada                       |
| harness físico de `AUTH-DB-027`              | todavía no materializado en `main` | será consumido cuando `AUTH-DB-027::GLOBAL` quede verificada                       |
| `supabase/public_schema_check.sql`           | existente                          | evidencia auxiliar; no fuente canónica del baseline                                |
| `supabase/schema/remote-schema.sql`          | archivo de cero bytes              | no puede utilizarse como baseline                                                  |
| proyecto Supabase alojado de Vento observado | `vento-os-dev`, activo             | ambiente hosted actual; no se reclasifica por inferencia como staging o producción |
| branches Supabase observados                 | ninguno                            | no existe evidencia actual de un branch separado de staging                        |
| staging separado                             | no verificado                      | no puede certificarse hasta tener identidad explícita                              |
| producción separada                          | no verificada                      | no puede certificarse hasta tener identidad explícita                              |

La ausencia actual de staging o producción identificables no invalida el contrato global. Impide únicamente afirmar certificación para un ambiente cuya identidad todavía no existe o no está registrada.

---

#### 6. Autoridad del baseline

El baseline esperado de un candidato se deriva únicamente de fuentes versionadas y trazables.

Debe incluir, cuando corresponda:

1. commit SHA exacto;
2. árbol Git limpio del candidato;
3. conjunto ordenado de migraciones;
4. SHA-256 de cada migración mediante el manifiesto de `AUTH-DB-015`;
5. digest del manifiesto de migraciones;
6. digest de `supabase/config.toml`;
7. versión exacta de Supabase CLI usada en la evidencia;
8. versión de PostgreSQL esperada;
9. artefactos de Edge Functions y sus digests cuando pertenezcan al candidato;
10. configuración contractual no secreta;
11. conjunto nominal de secretos requeridos, sin valores;
12. contratos, suites y validaciones aplicables;
13. referencia del paquete o candidato que se esté evaluando.

No son fuentes de verdad del baseline:

- un dump remoto aceptado sin reconciliación;
- `supabase/public_schema_check.sql`;
- `supabase/schema/remote-schema.sql`;
- una captura de Studio;
- una lista de tablas obtenida manualmente;
- el resultado previo de otro ambiente;
- un archivo generado fuera del commit evaluado.

---

#### 7. Identidad obligatoria de ambiente

Ninguna comparación es válida si el ambiente no está inequívocamente identificado.

Cada evidencia ambiental debe registrar como mínimo:

| Campo              | Regla                                            |
| ------------------ | ------------------------------------------------ |
| rol ambiental      | local, staging o producción                      |
| identidad técnica  | run id local o project/branch ref remoto         |
| región             | cuando aplique                                   |
| PostgreSQL         | versión efectiva observada                       |
| Supabase CLI       | versión exacta utilizada para la comprobación    |
| commit             | SHA del candidato                                |
| candidate identity | misma identidad a través de la promoción         |
| configuración      | digest versionado + overlay ambiental            |
| momento            | timestamp UTC                                    |
| owner              | responsable del ambiente                         |
| modo de prueba     | destructivo permitido o read-only según ambiente |

Una etiqueta como `staging`, `prod`, `dev` o un nombre de proyecto no sustituye la identidad técnica.

Un ambiente sin identidad suficiente produce:

```text
INSUFFICIENT_EVIDENCE
```

y no puede declararse equivalente.

---

#### 8. Modelo de baseline por ambiente

Para cada ambiente existen dos referencias distintas:

##### 8.1. Expected baseline

Estado que debería existir según el candidato versionado.

##### 8.2. Observed baseline

Estado realmente observado en el ambiente identificado.

La comparación siempre se ancla así:

```text
EXPECTED(candidate)
vs.
OBSERVED(environment)
```

Las comparaciones:

```text
LOCAL vs STAGING
STAGING vs PRODUCTION
LOCAL vs PRODUCTION
```

son evidencia auxiliar, pero no sustituyen el ancla canónica.

Dos ambientes igualmente incorrectos no producen paridad por coincidir entre sí.

---

#### 9. Superficies obligatorias de comparación

La comprobación no se limita al schema `public`.

Debe cubrir, según aplicabilidad:

| Superficie                  | Evidencia mínima                                                           |
| --------------------------- | -------------------------------------------------------------------------- |
| historial de migraciones    | versiones, orden, presencia y reconciliación con manifiesto                |
| relaciones                  | columnas, tipos, defaults, constraints, índices y ownership contractual    |
| vistas                      | definición, seguridad y exposición                                         |
| funciones / RPC             | firma, retorno, cuerpo, volatilidad, security mode, search path y EXECUTE  |
| triggers                    | padre, timing, eventos, función y condición                                |
| RLS                         | habilitación, policies, roles, `USING`, `WITH CHECK` y grants relacionados |
| Data API                    | schemas expuestos y grants intencionales                                   |
| extensiones                 | conjunto requerido y versiones efectivas                                   |
| Realtime                    | publications y configuración aplicable                                     |
| Storage                     | buckets, privacidad, límites, MIME y políticas aplicables                  |
| Edge Functions              | código/bundle, runtime, `verify_jwt`, configuración y nombres de secretos  |
| Auth                        | providers, redirects, hooks y configuración contractual no secreta         |
| cron / jobs / webhooks      | definición, schedule, command digest, retry y ownership                    |
| configuración de plataforma | región, capacidades y parámetros contractualmente relevantes               |
| datos                       | únicamente invariantes y comparaciones semánticas autorizadas              |

Una superficie aplicable sin evidencia produce paridad incompleta aunque el diff SQL sea vacío.

---

#### 10. Uso de Supabase CLI y límites de herramienta

La futura infraestructura puede utilizar capacidades soportadas de Supabase CLI como señales independientes, pero ninguna herramienta aislada constituye certificado integral.

Reglas:

1. `migration list` compara historial local/remoto principalmente por versión; no demuestra igualdad de contenido;
2. los hashes del manifiesto de `AUTH-DB-015` complementan el ledger migratorio;
3. `db diff` compara schema contra las migraciones mediante una base shadow, pero no cubre de forma suficiente todas las superficies hosted;
4. las limitaciones conocidas de `db diff` incluyen publications, buckets de Storage y determinados atributos de views;
5. `db dump` excluye por defecto schemas administrados por Supabase y no incluye datos ni roles salvo opciones explícitas;
6. un dump limpio no demuestra Auth, Storage, Realtime, Edge Functions, cron, secretos ni configuración de plataforma;
7. las superficies hosted deben verificarse mediante interfaces soportadas;
8. toda versión de CLI utilizada en evidencia debe registrarse porque las capacidades y resultados pueden variar entre versiones.

`AUTH-DB-028` no adopta el workflow declarativo experimental de Supabase como segunda fuente de verdad. `supabase/migrations/` permanece como fuente ejecutable canónica mientras otra tarea no cambie expresamente esa decisión.

---

#### 11. Fingerprints

Un fingerprint debe preservar diferencias semánticas y ordenar únicamente colecciones cuyo orden no tenga significado contractual.

Como mínimo:

| Clase         | Componentes bloqueantes                                                                |
| ------------- | -------------------------------------------------------------------------------------- |
| migración     | versión, filename, SHA-256 y estado observado                                          |
| relación      | definición, columnas, tipos, defaults, constraints, índices, grants, RLS y publication |
| función/RPC   | firma, retorno, cuerpo, volatilidad, security mode, search path, owner y EXECUTE       |
| trigger       | padre, timing, eventos, nivel, condición y función                                     |
| Edge Function | source/bundle digest, runtime, verify_jwt, route y secret-name set                     |
| Storage       | configuración de bucket, privacidad, límites, MIME y policies                          |
| Auth          | configuración contractual redactada, providers, redirects y hooks                      |
| Realtime      | publication, tablas/canales y autorización                                             |
| cron/job      | schedule, timezone, command digest, owner, retry y locking                             |
| plataforma    | capacidades contractualmente requeridas y configuración relevante                      |

Queda prohibido convertir conteos iguales en equivalencia.

---

#### 12. Drift permitido y drift bloqueante

Toda diferencia debe terminar en una clasificación explícita.

##### `EXPECTED_OVERLAY`

Diferencia deliberada entre ambientes requerida por su función, por ejemplo:

- project ref;
- URL;
- dominio;
- credenciales;
- secreto;
- callback;
- región o capacidad aprobada;
- datos sintéticos frente a datos reales.

Requiere owner, razón y evidencia.

##### `TEMPORARY_EXCEPTION`

Diferencia no deseada, aceptada temporalmente.

Requiere:

- `drift_id`;
- superficie exacta;
- ambiente;
- razón;
- riesgo;
- owner;
- aprobador;
- expiración;
- tratamiento;
- evidencia.

Una excepción vencida bloquea.

##### `UNAUTHORIZED_DRIFT`

Diferencia sin autorización válida.

Bloquea promoción, certificación o cierre aplicable.

##### `INSUFFICIENT_EVIDENCE`

No existe evidencia suficiente para demostrar equivalencia o clasificar la diferencia.

También bloquea.

Sin diferencias aplicables, no se inventa un registro de excepción.

---

#### 13. Contrato de allowlist

La allowlist no puede ser una colección de regex amplios ni texto libre sin owner.

Cada entrada debe contener:

| Campo                   | Regla                                      |
| ----------------------- | ------------------------------------------ |
| `drift_id`              | estable y único                            |
| superficie              | exacta                                     |
| identidad afectada      | exacta                                     |
| ambiente origen/destino | explícito                                  |
| expected                | redactado cuando sea sensible              |
| observed                | redactado cuando sea sensible              |
| clasificación           | `EXPECTED_OVERLAY` o `TEMPORARY_EXCEPTION` |
| razón                   | concreta                                   |
| riesgo                  | explícito                                  |
| owner                   | obligatorio                                |
| aprobador               | obligatorio cuando corresponda             |
| expiración              | obligatoria para `TEMPORARY_EXCEPTION`     |
| evidencia               | reproducible                               |
| tratamiento             | corrección o permanencia intencional       |

Una entrada no puede ocultar objetos nuevos desconocidos mediante comodines generales.

---

#### 14. Reglas específicas por ambiente

##### Local

- puede reconstruirse desde cero;
- usa datos sintéticos;
- puede ejecutar pruebas destructivas del harness;
- no contiene secretos productivos;
- debe demostrar reproducibilidad desde las migraciones;
- cualquier gap de plataforma hosted queda explícitamente diferido a staging.

##### Staging

- debe tener identidad técnica separada;
- recibe exactamente el candidato aprobado;
- usa credenciales, callbacks y secretos propios;
- puede ejecutar integración, seguridad y pruebas controladas;
- no usa datos productivos salvo dataset sanitizado expresamente autorizado;
- cubre las superficies hosted ausentes localmente.

##### Producción

- requiere identidad técnica separada y registrada;
- el baseline previo es read-only;
- no ejecuta seed;
- no ejecuta reset;
- no ejecuta pruebas destructivas;
- no utiliza datos ficticios persistentes;
- la comprobación posterior conserva candidate identity;
- cualquier drift no autorizado bloquea cierre o exige rollback/forward-fix bajo la tarea propietaria.

---

#### 15. Control de cambios manuales

Un cambio realizado en Dashboard, SQL Editor, consola, API administrativa o cualquier interfaz remota fuera del historial versionado se considera drift hasta demostrar lo contrario.

La detección:

```text
NO AUTORIZA
db pull
migration repair
db push
db reset --linked
DDL
DML
cambio de policy
cambio de grant
cambio de Auth
cambio de Storage
redeploy de Edge Function
```

El controlador de drift es read-only respecto del ambiente evaluado salvo que otra tarea y autorización física concedan expresamente una mutación.

Una reparación debe:

1. identificar la tarea o paquete propietario;
2. preservar evidencia del drift;
3. decidir si el estado remoto debe capturarse, revertirse o reproducirse mediante una migración/artefacto versionado;
4. reejecutar baseline y comparación después de la corrección;
5. no reescribir el resultado anterior como si nunca hubiera existido.

---

#### 16. Drift de historial migratorio

La comprobación de migraciones exige simultáneamente:

1. mismo universo versionado esperado;
2. versiones remotas reconciliadas;
3. archivos físicos presentes;
4. SHA-256 esperado por archivo;
5. ausencia de archivo remoto/manual sin representación canónica;
6. ausencia de entrada de manifiesto sin archivo;
7. ausencia de migration history reparada sin evidencia propietaria;
8. preservación de excepciones legacy ya documentadas.

Una coincidencia de timestamps en el ledger no sustituye la validación de contenido.

Un `migration repair` previo debe aparecer como hecho auditado; no se considera automáticamente corrupción ni automáticamente conformidad.

---

#### 17. Drift de datos

`AUTH-DB-028` no exige que staging y producción tengan las mismas filas.

La paridad de datos se evalúa semánticamente mediante invariantes como:

- huérfanos;
- duplicados;
- nulos prohibidos;
- dominios;
- relaciones;
- estados;
- rangos;
- agregados críticos;
- idempotencia;
- outcomes;
- fronteras de actor/sede/tenant cuando apliquen.

Resultados heredados:

```text
SEMANTIC_PASS
EXPECTED_DATA_DIFFERENCE
EXPLAINED_EXCEPTION
UNEXPLAINED_MISMATCH
INSUFFICIENT_EVIDENCE
```

`UNEXPLAINED_MISMATCH` e `INSUFFICIENT_EVIDENCE` bloquean.

---

#### 18. Evidencia y cadena de custodia

Cada ejecución futura debe conservar como mínimo:

1. environment identity;
2. candidate identity;
3. commit SHA;
4. timestamp UTC;
5. versiones de herramientas;
6. migration manifest digest;
7. config digest;
8. fingerprints expected;
9. fingerprints observed;
10. resultados por superficie;
11. drift encontrado;
12. allowlist aplicada;
13. excepciones y expiraciones;
14. actor/owner/aprobador;
15. logs o referencias a evidencia no sensible;
16. resultado global;
17. digest del bundle de evidencia.

La evidencia:

- es append-only;
- no contiene valores de secretos;
- no contiene connection strings completas;
- no reemplaza un FAIL anterior;
- conserva el vínculo con el candidato exacto.

---

#### 19. Gates

La fundación global debe permitir estas decisiones:

```text
LOCAL_CERTIFIED
STAGING_CERTIFIED
PRODUCTION_CERTIFIED
```

pero `AUTH-DB-028` no afirma que esos gates estén actualmente superados.

Reglas:

1. `LOCAL_CERTIFIED` requiere baseline reproducible y harness aplicable;
2. `STAGING_CERTIFIED` requiere identidad de staging real y evidencia hosted suficiente;
3. `PRODUCTION_CERTIFIED` requiere identidad productiva real, precheck y postcheck no destructivos;
4. no se certifica un ambiente inexistente;
5. no se certifica un ambiente cuya identidad sea inferida;
6. no se promueve un candidato con `UNAUTHORIZED_DRIFT`;
7. no se promueve con `INSUFFICIENT_EVIDENCE`;
8. un overlay deliberado no bloquea si está correctamente tipado y aprobado;
9. una excepción temporal bloquea al expirar;
10. el resultado de un ambiente no se copia como evidencia de otro.

---

#### 20. Relación con `AUTH-DB-029`

`AUTH-DB-028` entrega a `AUTH-DB-029`:

```text
candidate identity
+
environment identity
+
expected baseline
+
observed baseline
+
drift classification
+
evidence bundle
```

`AUTH-DB-029` es propietario de:

- backup;
- recovery point;
- restore;
- rollback;
- RPO/RTO aplicable;
- ensayo de recuperación;
- validación posterior a restauración.

`AUTH-DB-028` no ejecuta ni certifica esas operaciones.

---

#### 21. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA NUEVOS

**Requisitos creados:** **0**
**Requisitos modificados:** **0**

La tarea operacionaliza una regla ya protegida por el Registro Canónico de Requisitos de Prueba y no introduce una obligación nueva de comportamiento.

---

#### 22. Cobertura de prueba vigente reutilizada

`TREQ-SUPABASE-008` ya exige que toda migración supere reconstrucción limpia, upgrade, datos, constraints, RLS, RPC, tipos, rendimiento, backup, restauración y rollback, y establece expresamente que el drift entre local, staging y producción debe ser nulo o aprobado sin omitir objetos manuales de la evidencia.

`TREQ-SUPABASE-010` y la cobertura reconciliada por `SUPA-TRANS-013` complementan las superficies hosted y la paridad de automatizaciones cuando resulten aplicables.

Esta tarea reutiliza esas obligaciones sin modificar ninguna fila del registro 04A.

---

#### 23. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                         |
| --------- | -------------- | ------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | pendiente de materialización local del artefacto documental en su rama                            |
| LOCAL     | NOT_EXECUTED   | pendiente de preflight, formato, quality y validadores documentales del checkout                  |
| REMOTA    | NOT_EXECUTED   | el estado hosted observado se utilizó como línea base de lectura, no como certificación ambiental |
| OPERATIVA | NOT_APPLICABLE | esta tarea documental no ejecuta promoción, reparación ni comparación destructiva                 |
| FÍSICA    | NOT_APPLICABLE | `AUTH-DB-028::GLOBAL` permanece separada y sin autorización                                       |

---

#### 24. Decisiones vinculantes

1. `AUTH-DB-028` materializa documentalmente una fundación global reusable.
2. Su futura instancia física es `AUTH-DB-028::GLOBAL`.
3. La topología es `GLOBAL_ENABLE_ONCE`.
4. El gate es `PRE_E5_FOUNDATION`.
5. Los paquetes posteriores reutilizan la fundación; no reabren esta tarea como instancia por paquete.
6. El estado esperado se deriva de `vento-shell`, no del remoto.
7. El remoto observado nunca se convierte automáticamente en la nueva fuente de verdad.
8. Cada comparación se ancla en `EXPECTED(candidate) vs OBSERVED(environment)`.
9. Dos ambientes igualmente incorrectos no constituyen paridad.
10. Drift controlado significa cero drift no autorizado, no igualdad byte-a-byte.
11. `EXPECTED_OVERLAY` representa diferencias deliberadas y trazables.
12. `TEMPORARY_EXCEPTION` requiere expiración.
13. `UNAUTHORIZED_DRIFT` bloquea.
14. `INSUFFICIENT_EVIDENCE` bloquea.
15. El baseline conserva commit, candidate, migraciones, hashes y configuración.
16. Cada ambiente requiere identidad técnica inequívoca.
17. Un ambiente inexistente o no identificado no puede certificarse.
18. `migration list` no demuestra igualdad de contenido.
19. `db diff` no certifica por sí solo todas las superficies de Supabase.
20. `db dump` no certifica por sí solo la plataforma hosted.
21. Las superficies no SQL forman parte del control de drift cuando son aplicables.
22. Los secretos se comparan por metadata permitida, nunca por valor en evidencia.
23. El controlador de drift no repara automáticamente.
24. Detectar drift no autoriza `db pull`, `migration repair`, `db push` ni `db reset --linked`.
25. Producción se compara mediante operaciones no destructivas.
26. `AUTH-DB-029` conserva propiedad exclusiva de backup, restore y rollback.
27. Esta tarea no modifica SQL, datos, Supabase, configuración, migraciones ni ambientes.
28. Esta tarea no crea ni modifica requisitos de prueba.
29. La aprobación documental no autoriza `AUTH-DB-028::GLOBAL`.

---

#### 25. Criterios de aceptación

`AUTH-DB-028` queda documentalmente completa cuando:

- exista una autoridad única del estado esperado;
- expected y observed estén separados;
- cada ambiente requiera identidad inequívoca;
- el candidate conserve la misma identidad a través de la promoción;
- migraciones, schema, RLS, RPC y superficies hosted tengan reglas de fingerprint;
- el historial migratorio no dependa únicamente de timestamps;
- `db diff` y `db dump` estén reconocidos como señales parciales;
- las diferencias ambientales deliberadas usen overlay explícito;
- las excepciones temporales tengan owner, aprobador y expiración;
- drift no autorizado e insuficiencia de evidencia bloqueen;
- la detección permanezca read-only;
- ninguna reparación se ejecute por inferencia;
- producción prohíba reset, seed y pruebas destructivas;
- los datos se comparen por invariantes y no por igualdad de filas;
- la evidencia conserve candidate, environment, herramientas, fingerprints y digest;
- el estado actual no finja staging ni producción si no existe identidad verificable;
- quede preservada la frontera con `AUTH-DB-029`;
- `AUTH-DB-028::GLOBAL` permanezca sin autorización física implícita;
- se reutilice la cobertura TREQ vigente sin modificar 04A.

---

#### 26. Límites

`AUTH-DB-028` no:

- materializa scripts de drift;
- crea archivos de baseline físicos;
- ejecuta Supabase CLI;
- ejecuta consultas de mutación;
- ejecuta `db pull`;
- ejecuta `migration repair`;
- ejecuta `db push`;
- ejecuta `db reset --linked`;
- crea staging;
- crea producción;
- crea branches;
- aplica migraciones;
- modifica historial migratorio;
- corrige drift;
- cambia Auth;
- cambia RLS;
- cambia grants;
- cambia Storage;
- despliega Edge Functions;
- cambia cron o webhooks;
- copia datos productivos;
- realiza backup;
- ejecuta restore;
- ejecuta rollback;
- autoriza `AUTH-DB-028::GLOBAL`;
- modifica `AUTH-DB-029`;
- crea un requisito de prueba duplicado.

---

#### 27. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-DB-027 — Crear harness de pruebas de esquema, integridad, RLS, RPC y migraciones`

**TAREA ACTUAL APROBADA**
`AUTH-DB-028 — Establecer baseline y control de drift entre local, staging y producción`

**SIGUIENTE TAREA RESERVADA**
`AUTH-DB-029 — Validar respaldo, restauración y rollback antes del primer paquete`


### ✅ AUTH-DB-029 — Validar respaldo, restauración y rollback antes del primer paquete

**Estado:** APROBADA
**Tarea anterior:** AUTH-DB-028 — Establecer baseline y control de drift entre local, staging y producción
**Tarea siguiente:** AUTH-DB-001 — Corregir tablas sin RLS identificadas en SUPA-AUD
**Tipo de tarea:** Documental
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/01_R0_PREPARACION_PRUEBAS_Y_CONTENCION_DE_RIESGOS.md`
**Estado físico resultante:** Contrato documental cerrado; futura instancia global `AUTH-DB-029::GLOBAL` pendiente de autorización explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`AUTH-DB-029` establece la fundación global de recuperación que debe existir antes del primer paquete físico que pueda modificar Supabase. Su objetivo no es demostrar que existe una copia de seguridad, sino demostrar que un candidato y un ambiente pueden volver a un estado permitido, verificable y operable después de un fallo o de una reversión autorizada.

La decisión vinculante es:

```text
BACKUP_EXISTE
≠
RECUPERACION_VERIFICADA

ROLLBACK_DEFINIDO
≠
ROLLBACK_PROBADO
```

La recuperación solo puede considerarse demostrada cuando existe evidencia conjunta de:

```text
candidate identity
+
environment identity
+
recovery point válido
+
modo de rollback o recovery aplicable
+
point of no return explícito
+
RPO/RTO objetivo
+
ensayo controlado
+
validación post-recuperación
+
evidencia reproducible
```

---

#### 2. Resultado canónico

Queda aprobado el siguiente cierre de R0:

```text
AUTH-DB-015
→ migraciones versionadas e inventariadas

AUTH-DB-027
→ harness reproducible de esquema, integridad, RLS, RPC y migraciones

AUTH-DB-028
→ candidate identity + environment identity
→ baseline expected/observed
→ clasificación de drift

AUTH-DB-029
→ recovery envelope
→ recovery point
→ rollback pre-PONR
→ forward recovery / compensación post-PONR
→ restore cuando corresponda
→ RPO/RTO medidos
→ validación post-recuperación con 027 + 028
```

`AUTH-DB-029` no crea una segunda semántica de rollback. Operacionaliza en R0 el contrato ya definido por `SUPA-TRANS-011` y reutiliza las identidades ambientales y el baseline de `AUTH-DB-028`.

---

#### 3. Topología y gate

La reconciliación vigente de R0 establece:

```text
mode = GLOBAL_ENABLE_ONCE
execution_gate = PRE_E5_FOUNDATION
instance = AUTH-DB-029::GLOBAL
```

Interpretación:

1. el contrato documental se define una sola vez;
2. la futura instancia `AUTH-DB-029::GLOBAL` materializa una única infraestructura reusable para ensayar y verificar recuperación;
3. los paquetes posteriores reutilizan la infraestructura y aportan sus candidatos, ambientes, recovery points y evidencia específica;
4. no se crea una instancia `AUTH-DB-029::<package_id>`;
5. la aprobación documental no autoriza la instancia física;
6. `PRE_E5_FOUNDATION` permite preparar esta capacidad antes del primer paquete, pero no autoriza migraciones, restores ni cambios remotos.

---

#### 4. Fuentes vinculantes

| Fuente                                               | Uso vinculante                                                           |
| ---------------------------------------------------- | ------------------------------------------------------------------------ |
| `docs/plan-canonico/modular/01_PROTOCOLO.md`         | continuidad, separación documental/física y autorización explícita       |
| `docs/plan-canonico/modular/delivery-contract.json`  | estructura validable de la entrega                                       |
| `docs/plan-canonico/modular/active-sequence.json`    | `AUTH-DB-029` como tarea documental actual                               |
| `docs/plan-canonico/modular/task-work-topology.json` | `GLOBAL_ENABLE_ONCE` + `PRE_E5_FOUNDATION`                               |
| `AUTH-DB-015`                                        | fuente canónica de migraciones e inventario versionado                   |
| `AUTH-DB-027`                                        | harness de reconstrucción y pruebas post-recuperación                    |
| `AUTH-DB-028`                                        | candidate, environment, baseline y clasificación de drift                |
| `SUPA-TRANS-011`                                     | rollback, recovery point, PONR, RPO/RTO, outcomes y evidencia            |
| `SUPA-TRANS-013`                                     | paridad y evidencia por ambiente                                         |
| `SUPA-TRANS-016`                                     | orden obligatorio de R0                                                  |
| documentación oficial vigente de Supabase            | capacidades y límites actuales de backups, PITR, restore, Auth y Storage |

La capacidad concreta de backup, PITR, restore o recuperación ofrecida por la plataforma deberá comprobarse nuevamente en el momento de una ejecución física. Este contrato no convierte una capacidad de producto dependiente de plan, configuración o versión en una garantía estática.

---

#### 5. Frontera entre backup, restore, rollback y recovery

Los términos quedan separados:

| Concepto           | Significado contractual                                                                                           |
| ------------------ | ----------------------------------------------------------------------------------------------------------------- |
| `backup`           | artefacto o capacidad de recuperación que preserva un punto recuperable; no demuestra restaurabilidad por sí solo |
| `recovery point`   | referencia exacta, identificable y verificable desde la cual puede ejecutarse la estrategia aprobada              |
| `restore`          | reconstrucción de un estado desde un recovery point mediante el mecanismo soportado aplicable                     |
| `rollback`         | retorno controlado a la autoridad o comportamiento previo cuando todavía es semánticamente reversible             |
| `forward recovery` | restauración de invariantes mediante avance, compensación o reconciliación cuando ya no es seguro volver atrás    |
| `recovery drill`   | ensayo controlado que demuestra el mecanismo, mide RPO/RTO y verifica el estado posterior                         |

Por tanto:

```text
backup disponible
NO IMPLICA
restore demostrado

restore completado
NO IMPLICA
servicio operable

rollback SQL
NO IMPLICA
recuperación empresarial completa
```

---

#### 6. Recovery envelope obligatorio

Toda unidad que deba demostrar recuperabilidad deberá resolverse dentro de un `recovery envelope` que conserve como mínimo:

| Campo                     | Regla                                                       |
| ------------------------- | ----------------------------------------------------------- |
| candidate identity        | candidato exacto recibido de `AUTH-DB-028`                  |
| commit SHA                | commit exacto asociado al candidato                         |
| environment identity      | ambiente inequívoco recibido de `AUTH-DB-028`               |
| migration set             | conjunto ordenado aplicable                                 |
| migration manifest digest | digest del manifiesto materializado por `AUTH-DB-015`       |
| expected baseline         | referencia al baseline esperado de `AUTH-DB-028`            |
| observed baseline         | referencia al baseline previo observado                     |
| rollback mode             | modo heredado de `SUPA-TRANS-011`                           |
| recovery point            | tipo, identidad, timestamp y evidencia de disponibilidad    |
| point of no return        | condición concreta a partir de la cual cambia la estrategia |
| RPO target                | objetivo aprobado para la unidad                            |
| RTO target                | objetivo aprobado para la unidad                            |
| owner                     | responsable técnico/operativo                               |
| approver                  | autoridad requerida para el ambiente                        |
| pre-PONR strategy         | reversión antes del punto de no retorno                     |
| post-PONR strategy        | forward recovery, compensación o reconciliación posterior   |
| data reconciliation       | invariantes y cohortes que deben reconciliarse              |
| security validation       | suites de seguridad aplicables                              |
| consumer validation       | consumidores esenciales que deben recuperar operabilidad    |
| evidence bundle           | referencia inmutable al expediente de ejecución             |

No se permite un recovery envelope con referencias narrativas ambiguas como “último backup”, “estado anterior” o “versión previa” sin identidad verificable.

---

#### 7. Modos de recuperación heredados

`AUTH-DB-029` conserva los modos aprobados en `SUPA-TRANS-011` y no inventa una taxonomía competidora.

Entre los modos globales vigentes se encuentran:

```text
TRANSACTION_ABORT
REDEPLOY_PRIOR_ARTIFACT
TRAFFIC_ROUTE_BACK
AUTHORITY_RETURN_WITH_DELTA
FORWARD_FIX
SELECTIVE_DATA_RESTORE
COMPENSATE_FORWARD
RESTORE_PROJECT_OR_PITR
NO_INDEPENDENT_ROLLBACK
BOUNDARY_NO_TOUCH
```

También se conservan las composiciones especializadas definidas por el propietario, entre ellas:

```text
TRANSACTION_ABORT_OR_FORWARD_FIX
TRAFFIC_ROUTE_BACK+UNKNOWN_OUTCOME_RECONCILIATION
STOP_REPLAY+CHECKPOINT_RESTORE+COMPENSATE_FORWARD
ABORT_BEFORE_MERGE_OR_COMPENSATE_FORWARD
STOP_ROUTING+RETURN_SOURCE+RECONCILE_DESTINATIONS
RESTORE_LIMITED_COMPATIBILITY_NO_LEGACY_AUTHORITY
RETURN_AUTHORITY_WITH_DELTA_IF_SAFE_ELSE_FORWARD_RECOVERY
```

Reglas:

1. el modo se hereda de la unidad propietaria; no se decide por conveniencia en el momento del fallo;
2. `NO_INDEPENDENT_ROLLBACK` significa que la identidad hereda recovery point y evidencia de su unidad padre; no significa que pueda omitirse de la verificación;
3. `BOUNDARY_NO_TOUCH` conserva una frontera explícita sin operación de recuperación sobre el objeto excluido;
4. un restore de proyecto completo no sustituye modos más seguros o más acotados cuando estos son suficientes;
5. un forward fix no se utiliza para ocultar la ausencia de rollback donde el rollback era obligatorio antes del PONR.

---

#### 8. Point of no return

Cada recovery envelope debe identificar un `point_of_no_return` verificable.

Antes del PONR:

```text
preferencia
→ abortar o revertir de forma determinista
→ restaurar autoridad previa
→ reconciliar cualquier efecto transitorio
```

Después del PONR:

```text
prohibido fingir que la reversión conserva la misma semántica

estrategia
→ completar forward recovery
→ compensar efectos
→ reconciliar eventos/datos
→ escalar manualmente cuando el contrato lo exija
```

Ejemplos de PONR ya reconocidos por el contrato de transición incluyen primera escritura exclusiva en destino, primer efecto externo no reversible, commit de una transacción crítica, retiro de compatibilidad recuperable o redirección de referencias sin crosswalk reversible.

El PONR debe poder observarse durante el drill y quedar registrado en evidencia.

---

#### 9. Recovery point por superficie

La recuperación se diseña por superficie y no presupone que un backup PostgreSQL cubra todo Supabase.

| Superficie                   | Recovery point / mecanismo permitido                                                                         |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------ |
| proyecto PostgreSQL completo | backup soportado, PITR o mecanismo equivalente expresamente seleccionado y disponible                        |
| relaciones y datos           | snapshot controlado, watermark, delta, inverse transaction o restore selectivo según contrato                |
| historial migratorio         | manifiesto, ledger reconciliado y archivos SQL versionados; no reescritura silenciosa                        |
| Auth                         | mecanismos soportados de Auth/Admin/export/restore; no escritura directa de tablas internas de Auth          |
| Storage                      | recuperación consciente de objetos mediante Storage API o worker controlado; SQL por sí solo es insuficiente |
| Edge Functions               | fuente/bundle/configuración versionados y redeploy de artefacto previo cuando corresponda                    |
| secretos                     | nombre, versión, presencia y referencia al secret manager; nunca valor del secreto dentro de evidencia       |
| cron/jobs/webhooks           | definición versionada, checkpoint y reconciliación de efectos según contrato                                 |
| consumidores                 | versión/route/candidate compatible y capacidad de volver a un contrato aceptado                              |
| frontera externa excluida    | `BOUNDARY_NO_TOUCH` y evidencia de no intervención                                                           |

La existencia de backup de base de datos no autoriza a declarar recuperados Auth, objetos de Storage, secretos, Edge Functions, callbacks, integraciones o consumidores.

---

#### 10. Política de backup

Antes de una ejecución que pueda necesitar recuperación debe demostrarse:

1. qué mecanismo de backup o recovery point se utilizará;
2. que el mecanismo está disponible para el ambiente real;
3. qué superficies incluye;
4. qué superficies excluye;
5. identidad y timestamp del recovery point;
6. retención suficiente para la ventana de cambio;
7. owner y control de acceso;
8. integridad o verificabilidad del artefacto cuando corresponda;
9. procedimiento soportado de restauración;
10. impacto operativo esperado durante restore;
11. vínculo con el candidato y el baseline inmediatamente anteriores.

No se considera evidencia suficiente:

- una captura de Dashboard;
- una afirmación de que “Supabase hace backups”;
- un backup sin identidad;
- un backup cuya retención no cubre la ventana;
- un artefacto cuyo restore no se haya validado en un ambiente permitido;
- un dump que omite superficies necesarias para recuperar el servicio.

---

#### 11. Política de restore

El restore se considera válido únicamente cuando el resultado recuperado vuelve a superar las verificaciones contractuales aplicables.

Un restore debe incluir:

```text
RECOVERY_POINT_SELECTED
→ RESTORE_EXECUTED
→ DATABASE_AVAILABLE
→ AUTH-DB-027 POST-RECOVERY HARNESS
→ AUTH-DB-028 BASELINE/DRIFT CHECK
→ DATA RECONCILIATION
→ SECURITY CHECKS
→ ESSENTIAL_CONSUMER CHECKS
→ RPO/RTO MEASUREMENT
→ RECOVERY OUTCOME
```

`DATABASE_AVAILABLE` no es equivalente a `RECOVERY_PASS`.

La verificación posterior debe demostrar, según aplicabilidad:

- schema;
- constraints;
- integridad;
- RLS;
- RPC;
- grants;
- datos e invariantes;
- historial migratorio;
- funciones/triggers;
- Auth;
- Storage;
- Realtime;
- Edge Functions;
- jobs/webhooks;
- consumidores esenciales;
- ausencia de drift no autorizado.

---

#### 12. Drill de recuperación

La futura infraestructura global deberá soportar un ensayo reproducible con esta secuencia lógica:

1. identificar candidate y environment;
2. comprobar precondiciones y blockers;
3. capturar expected/observed baseline de `AUTH-DB-028`;
4. seleccionar y verificar el recovery point;
5. registrar `T0`;
6. aplicar la unidad forward en un ambiente autorizado para el ensayo;
7. ejecutar postcheck forward;
8. registrar si se alcanzó el PONR;
9. ejecutar rollback cuando siga siendo válido o forward recovery/compensación después del PONR;
10. registrar `T1`;
11. medir RTO real;
12. determinar pérdida o lag respecto del recovery point y medir RPO real;
13. ejecutar el harness post-recuperación de `AUTH-DB-027`;
14. ejecutar comparación de baseline/drift de `AUTH-DB-028`;
15. reconciliar invariantes de datos, writers, eventos y consumidores;
16. verificar seguridad y permisos;
17. emitir outcome cerrado;
18. preservar evidencia append-only;
19. limpiar únicamente después de conservar el expediente.

El drill no puede introducir una mutación permanente en producción que no estuviera ya autorizada por la tarea física propietaria.

---

#### 13. RPO

`RPO` mide la cantidad máxima de información o efecto empresarial que puede perderse o requerir reconciliación después de la recuperación.

Reglas:

1. no se reduce a diferencia entre timestamps;
2. debe expresarse en una unidad significativa para la unidad de cambio cuando corresponda;
3. puede incluir eventos, movimientos, pagos, documentos, writes, archivos o referencias pendientes de reconciliación;
4. el objetivo procede del contrato aplicable; `AUTH-DB-029` no inventa un RPO universal;
5. el drill debe producir un valor real u otra evidencia cuantificable equivalente;
6. exceder el RPO objetivo bloquea promoción salvo rediseño o aprobación explícita por el gate propietario.

---

#### 14. RTO

`RTO` se mide desde la decisión de ejecutar rollback/recovery hasta recuperar un estado operable permitido.

El cronómetro no termina cuando PostgreSQL acepta conexiones. Termina cuando se han restaurado, según aplicabilidad:

```text
contrato
+
invariantes de datos
+
seguridad
+
servicios requeridos
+
consumidores esenciales
+
capacidad operativa mínima
```

Reglas:

1. el objetivo procede del contrato aplicable;
2. el drill mide `T1 - T0` según el evento de inicio y cierre definido;
3. pausas manuales necesarias forman parte del RTO real si el procedimiento las exige;
4. exceder el objetivo bloquea promoción salvo rediseño o aprobación explícita;
5. un restore exitoso con RTO incumplido no produce `PASS`.

---

#### 15. Matriz de ambientes

##### Local / entorno efímero controlado

- puede ejecutar drills destructivos;
- utiliza datos sintéticos;
- puede reconstruirse desde migraciones;
- valida primero la mecánica del recovery envelope;
- no demuestra por sí solo capacidades hosted ausentes localmente.

##### Staging / hosted no productivo

- debe tener identidad técnica separada y verificable;
- recibe el mismo candidato;
- prueba capacidades hosted reales que no existen localmente;
- usa datos sintéticos o sanitizados autorizados;
- permite drills controlados dentro de su autorización;
- debe medir RPO/RTO y recuperación de superficies hosted aplicables.

##### Producción

- no ejecuta drills destructivos rutinarios;
- exige precheck de recovery point y capacidad real de recuperación;
- el procedimiento de restore/rollback productivo debe estar listo antes de promover;
- una ejecución real de restore, PITR o recuperación mayor exige la autorización física/operativa aplicable al incidente o cambio;
- pruebas post-recuperación deben ser no destructivas salvo autorización excepcional expresa;
- el impacto de indisponibilidad durante restore forma parte del RTO y de la decisión operacional.

Un ambiente inexistente o no identificado no puede producir evidencia de recovery drill.

---

#### 16. Producción y recuperación mayor

`RESTORE_PROJECT_OR_PITR` es una capacidad de recuperación mayor, no el rollback rutinario de toda migración.

Antes de depender de ese mecanismo en producción deberá verificarse:

1. disponibilidad real del mecanismo para el proyecto y plan vigentes;
2. recovery point seleccionable;
3. retención suficiente;
4. alcance exacto de lo restaurado;
5. superficies que requieren recuperación separada;
6. indisponibilidad esperada;
7. credenciales y owner autorizados;
8. procedimiento de verificación post-restore;
9. reconciliación de writes externos ocurridos alrededor de la ventana;
10. estrategia si el restore falla o excede el RTO.

PITR puede reducir la pérdida potencial frente a snapshots más espaciados, pero no elimina la necesidad de medir RPO real ni demuestra por sí solo el RTO de servicio completo.

---

#### 17. Historial migratorio y rollback

El historial canónico de migraciones sigue siendo inmutable conforme a `AUTH-DB-015`.

Por tanto:

- rollback no significa borrar una migración histórica;
- rollback no significa modificar silenciosamente un SQL ya versionado;
- `migration repair` no es un sustituto genérico de rollback;
- cualquier reparación de ledger debe tener propietario, motivo y evidencia;
- una corrección posterior al PONR puede requerir una nueva migración forward;
- el recovery envelope debe conservar el vínculo con el migration manifest y con la historia observada del ambiente;
- el estado post-recuperación debe volver a ser reconciliable con el repositorio y el baseline esperado.

---

#### 18. Datos, idempotencia y efectos externos

Un rollback se considera incompleto si recupera DDL pero deja efectos empresariales inconsistentes.

La reconciliación debe considerar, según la unidad:

- writers concurrentes;
- high-watermarks;
- deltas;
- eventos append-only;
- idempotency keys;
- pagos o efectos externos;
- documentos emitidos;
- webhooks;
- jobs;
- archivos;
- integraciones;
- crosswalks;
- referencias migradas;
- reintentos con outcome desconocido.

Después del PONR puede ser obligatorio compensar o reconciliar en lugar de intentar restaurar mecánicamente el estado anterior.

---

#### 19. Seguridad durante recuperación

La recuperación no puede degradar autorización o privacidad para acelerar el restablecimiento.

Debe comprobarse:

1. RLS habilitada donde corresponde;
2. policies y grants esperados;
3. funciones/RPC con security mode y `search_path` correctos;
4. ausencia de `service_role` en clientes;
5. secretos no expuestos en evidencia;
6. Auth recuperado mediante mecanismos soportados;
7. Storage y objetos con acceso coherente;
8. consumidores con credenciales del ambiente correcto;
9. ninguna apertura temporal de permisos queda persistente después del recovery;
10. el baseline post-recuperación no contiene drift de seguridad no autorizado.

Un restore que recupera datos pero degrada seguridad es `FAIL`.

---

#### 20. Outcomes cerrados

La fundación conserva los outcomes aprobados por `SUPA-TRANS-011`:

| Outcome                           | Significado                                                          |
| --------------------------------- | -------------------------------------------------------------------- |
| `PASS_ROLLBACK_VERIFIED`          | rollback pre-PONR demostrado y estado permitido recuperado           |
| `PASS_FORWARD_RECOVERY_VERIFIED`  | recovery/compensación post-PONR demostrada                           |
| `FAIL_PRECHECK`                   | no se cumplieron precondiciones antes del ensayo                     |
| `FAIL_FORWARD_EXECUTION`          | la ejecución forward falló de forma no aceptada                      |
| `FAIL_ROLLBACK`                   | rollback/recovery no logró el estado permitido                       |
| `FAIL_POSTCHECK`                  | las verificaciones posteriores fallaron                              |
| `FAIL_RPO`                        | el resultado excedió el RPO objetivo                                 |
| `FAIL_RTO`                        | el resultado excedió el RTO objetivo                                 |
| `BLOCKED_BEFORE_ROLLBACK_DRILL`   | existe blocker contractual previo al ensayo                          |
| `NOT_ELIGIBLE_FOR_ROLLBACK_DRILL` | faltan evidencias o condiciones para habilitar el drill              |
| `NOT_EXECUTED`                    | drill definido pero no ejecutado                                     |
| `NOT_APPLICABLE`                  | la identidad no requiere ensayo independiente conforme a su contrato |

No se crea un outcome alternativo para convertir evidencia incompleta en éxito.

---

#### 21. Condiciones de bloqueo antes del primer paquete

La capacidad de recuperación bloquea la promoción del primer paquete aplicable cuando ocurra cualquiera de estas condiciones:

```text
RECOVERY_POINT_MISSING
RECOVERY_POINT_NOT_VERIFIED
ROLLBACK_MODE_UNRESOLVED
POINT_OF_NO_RETURN_UNRESOLVED
RPO_TARGET_UNRESOLVED
RTO_TARGET_UNRESOLVED
DRILL_NOT_ELIGIBLE
DRILL_FAILED
POST_RECOVERY_HARNESS_FAILED
UNAUTHORIZED_DRIFT_AFTER_RECOVERY
DATA_RECONCILIATION_FAILED
SECURITY_RECOVERY_FAILED
ESSENTIAL_CONSUMER_RECOVERY_FAILED
EVIDENCE_INCOMPLETE
```

Estas etiquetas describen condiciones contractuales de bloqueo y no crean por sí mismas nuevos enums, tablas o estados físicos.

---

#### 22. Evidencia y cadena de custodia

Cada drill futuro debe conservar como mínimo:

1. candidate identity;
2. environment identity;
3. commit SHA;
4. recovery envelope identity;
5. recovery point identity;
6. timestamp UTC;
7. herramientas y versiones;
8. baseline previo;
9. estado forward alcanzado;
10. PONR alcanzado o no alcanzado;
11. modo de recuperación ejecutado;
12. `T0` y `T1`;
13. RPO objetivo y resultado;
14. RTO objetivo y resultado;
15. resultados del harness de `AUTH-DB-027`;
16. comparación post-recuperación de `AUTH-DB-028`;
17. reconciliación de datos y efectos;
18. verificación de seguridad;
19. verificación de consumidores esenciales;
20. outcome final;
21. logs o referencias no sensibles;
22. owner y aprobador;
23. digest del evidence bundle.

La evidencia es append-only. Un segundo drill no borra ni sustituye un fallo anterior.

---

#### 23. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA NUEVOS

**Requisitos creados:** **0**
**Requisitos modificados:** **0**

**Justificación:** la obligación de demostrar backup, restauración, rollback y recuperación ya existe en el registro canónico y en los contratos de transición aprobados. `AUTH-DB-029` la operacionaliza como fundación global de R0 sin introducir una regla de negocio, seguridad o recuperación adicional que requiera una nueva fila.

---

#### 24. Cobertura de prueba vigente reutilizada

`TREQ-SUPABASE-008` ya exige que toda migración supere reconstrucción limpia, upgrade, validación de datos, constraints, RLS, RPC, tipos, rendimiento, backup, restauración y rollback, además de controlar el drift entre ambientes.

`SUPA-TRANS-011` aporta el contrato detallado de recovery points, PONR, modos de recuperación, RPO/RTO, drills y outcomes. `AUTH-DB-027` y `AUTH-DB-028` aportan respectivamente el harness post-recuperación y el baseline/drift que deben volver a pasar después de un restore o rollback.

El Registro Canónico de Requisitos de Prueba permanece sin cambios.

---

#### 25. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                  |
| --------- | -------------- | ------------------------------------------------------------------------------------------ |
| BUILD     | NOT_EXECUTED   | pendiente de materialización local del artefacto documental y validación del plan          |
| LOCAL     | NOT_EXECUTED   | pendiente de preflight, formato, quality, delivery y validadores documentales del checkout |
| REMOTA    | NOT_EXECUTED   | no se ejecutó backup, restore, PITR, rollback ni drill contra un ambiente alojado          |
| OPERATIVA | NOT_APPLICABLE | esta tarea documental no ejecuta incidente, promoción, downtime ni recuperación operativa  |
| FÍSICA    | NOT_APPLICABLE | `AUTH-DB-029::GLOBAL` permanece separada y sin autorización física                         |

---

#### 26. Decisiones vinculantes

1. `AUTH-DB-029` es una fundación global reusable de R0.
2. Su futura instancia física es `AUTH-DB-029::GLOBAL`.
3. El modo es `GLOBAL_ENABLE_ONCE`.
4. El gate es `PRE_E5_FOUNDATION`.
5. La aprobación documental no autoriza la instancia física.
6. Existencia de backup no equivale a recuperación verificada.
7. Restore completado no equivale a servicio recuperado.
8. Rollback no equivale a borrar o reescribir migraciones históricas.
9. El recovery envelope se ancla a candidate y environment identities.
10. Todo recovery envelope tiene recovery point identificable.
11. Todo recovery envelope tiene PONR explícito.
12. Todo recovery envelope tiene RPO/RTO objetivo provenientes del contrato aplicable.
13. RPO se evalúa semánticamente y no solo por timestamp.
14. RTO termina cuando se recupera operabilidad aceptable, no cuando la base simplemente responde.
15. Los modos de recuperación se heredan de `SUPA-TRANS-011`.
16. `NO_INDEPENDENT_ROLLBACK` hereda recovery y evidencia de la unidad padre; no elimina la verificación.
17. Antes del PONR se prefiere reversión determinista a la autoridad previa.
18. Después del PONR puede ser obligatorio forward recovery, compensación o reconciliación.
19. Restore de proyecto o PITR es recuperación mayor, no rollback rutinario de toda migración.
20. La capacidad real de backup/PITR/restore se verifica nuevamente al ejecutar.
21. Un backup PostgreSQL no demuestra recuperación completa de Storage, Auth, secretos, Edge Functions o consumidores.
22. Auth no se recupera mediante escrituras directas a tablas internas.
23. Storage requiere recuperación consciente de objetos, no solo SQL.
24. Secretos no se copian a evidencia.
25. Producción no ejecuta drills destructivos rutinarios.
26. Un restore productivo real exige la autorización aplicable.
27. Todo resultado recuperado vuelve a ejecutar el harness de `AUTH-DB-027`.
28. Todo resultado recuperado vuelve a compararse con baseline/drift de `AUTH-DB-028`.
29. Drift no autorizado después de recovery bloquea.
30. Fallo de seguridad después de recovery bloquea.
31. Fallo de reconciliación de datos o consumidores esenciales bloquea.
32. Un RPO o RTO incumplido no produce PASS.
33. La evidencia conserva fallos históricos append-only.
34. `migration repair` no sustituye el rollback.
35. Esta tarea no crea ni modifica requisitos de prueba.
36. Esta tarea no realiza cambios físicos.
37. `AUTH-DB-001` permanece exclusivamente reservada.

---

#### 27. Criterios de aceptación

`AUTH-DB-029` queda documentalmente completa cuando:

- exista una distinción contractual inequívoca entre backup, recovery point, restore, rollback y forward recovery;
- quede definida una única fundación global `AUTH-DB-029::GLOBAL`;
- cada ensayo se ancle a candidate y environment identities;
- cada recovery envelope declare recovery point, PONR, RPO, RTO, owner y evidencia;
- se conserven los modos y outcomes actuales de `SUPA-TRANS-011`;
- exista una estrategia diferenciada pre-PONR y post-PONR;
- se documente recuperación por superficie y no solo de PostgreSQL;
- Auth, Storage, secretos, Edge Functions, jobs e integraciones tengan fronteras de recuperación explícitas cuando apliquen;
- el drill mida RPO y RTO reales;
- post-recovery ejecute el harness de `AUTH-DB-027`;
- post-recovery compare baseline/drift mediante `AUTH-DB-028`;
- producción quede protegida contra drills destructivos rutinarios;
- restore/PITR productivo requiera autorización operativa/física aplicable;
- el historial migratorio permanezca inmutable;
- un failure anterior permanezca en evidencia;
- ninguna capacidad de Supabase dependiente de plan/configuración se declare disponible sin verificación de ejecución;
- no se cree ni modifique ningún requisito de prueba;
- no se ejecute ningún cambio físico;
- la continuidad reserve exclusivamente `AUTH-DB-001`.

---

#### 28. Límites

`AUTH-DB-029` no:

- crea backups;
- obtiene copias de respaldo;
- ejecuta restores;
- ejecuta PITR;
- ejecuta rollback;
- ejecuta forward recovery;
- ejecuta drills destructivos;
- modifica Supabase;
- aplica migraciones;
- ejecuta `migration repair`;
- reescribe historial migratorio;
- modifica datos;
- modifica Auth;
- modifica Storage;
- rota secretos;
- redeploya Edge Functions;
- cambia cron, webhooks o Realtime;
- crea staging;
- crea producción;
- afirma que un mecanismo hosted está disponible sin verificarlo;
- fija resultados reales de RPO/RTO sin medición;
- autoriza un incidente o restore productivo;
- autoriza `AUTH-DB-029::GLOBAL`;
- modifica `AUTH-DB-001`;
- crea o modifica requisitos de prueba;
- modifica el Registro 04A.

---

#### 29. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-DB-028 — Establecer baseline y control de drift entre local, staging y producción`

**TAREA ACTUAL APROBADA**
`AUTH-DB-029 — Validar respaldo, restauración y rollback antes del primer paquete`

**SIGUIENTE TAREA RESERVADA**
`AUTH-DB-001 — Corregir tablas sin RLS identificadas en SUPA-AUD`


### ✅ AUTH-DB-001 — Corregir tablas sin RLS identificadas en SUPA-AUD

**Estado:** APROBADA
**Tarea anterior:** AUTH-DB-029 — Validar respaldo, restauración y rollback antes del primer paquete
**Tarea siguiente:** AUTH-DB-002 — Endurecer políticas RLS demasiado amplias aprobadas para corrección
**Tipo de tarea:** Documental
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/01_R0_PREPARACION_PRUEBAS_Y_CONTENCION_DE_RIESGOS.md`
**Estado físico resultante:** Definición documental cerrada; contención RLS global posterior pendiente de autorización explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`AUTH-DB-001` cierra documentalmente el alcance exacto de la primera contención RLS de R0 para las tablas Vento que continúan con `relrowsecurity = false`, reconciliando el hallazgo de `SUPA-AUD-009` contra el estado remoto vigente antes de definir cualquier cambio físico.

La tarea separa de forma obligatoria:

```text
TABLA SIN RLS
!=
TABLA ABIERTA A CLIENTES

HABILITAR RLS
!=
CREAR POLÍTICAS RLS
!=
CAMBIAR GRANTS
!=
FORZAR RLS AL OWNER
```

La corrección de esta tarea es una capa de contención. No redefine permisos empresariales, no endurece políticas existentes, no revoca grants y no convierte `service_role` en un actor sujeto a RLS.

---

#### 2. Resultado canónico

Queda definido el contrato de `AUTH-DB-001::GLOBAL`:

```text
UNIVERSO ACTUAL CON RLS OFF
= 12 tablas Vento

OBJETIVO DE ESTA TAREA
= RLS ENABLED en 12/12

POLÍTICAS NUEVAS
= 0

CAMBIOS DE GRANTS
= 0

FORCE RLS
= 0 activaciones

TABLAS YA CORREGIDAS
= no se vuelven a modificar por esta tarea
```

La futura materialización deberá producir una sola migración versionada en `vento-shell` que habilite RLS exclusivamente sobre las doce tablas pendientes verificadas en esta tarea y preserve el resto de su contrato físico.

---

#### 3. Fuentes y precedencia

La definición conserva y reconcilia:

| Fuente                                               | Uso vinculante                                                                 |
| ---------------------------------------------------- | ------------------------------------------------------------------------------ |
| `docs/plan-canonico/modular/01_PROTOCOLO.md`         | continuidad, aprobación explícita, trazabilidad y separación documental/física |
| `docs/plan-canonico/modular/delivery-contract.json`  | estructura validable de entrega y coordinación con 04A                         |
| `docs/plan-canonico/modular/active-sequence.json`    | `AUTH-DB-001` como tarea documental actual                                     |
| `docs/plan-canonico/modular/task-work-topology.json` | `GLOBAL_ENABLE_ONCE` y gate `PRE_E5_FOUNDATION`                                |
| `SUPA-AUD-009`                                       | hallazgo original de relaciones Vento sin RLS, grants y políticas observadas   |
| `SUPA-ARC-015`                                       | política canónica que separa exposición, grants, RLS y `FORCE RLS`             |
| `SUPA-TRANS-007`                                     | consumidores y fronteras de adaptación vigentes                                |
| `SUPA-TRANS-011`                                     | recuperación, rollback y evidencia por cambio                                  |
| `AUTH-DB-027`                                        | harness propietario de pruebas de RLS y migraciones                            |
| `AUTH-DB-028`                                        | baseline y control de drift por ambiente                                       |
| `AUTH-DB-029`                                        | backup, restore, recovery point y rollback                                     |
| estado remoto read-only de `vento-os-dev`            | reconciliación material del conjunto que continúa pendiente                    |

La reconciliación topológica vigente prevalece sobre referencias históricas que situaban estas correcciones únicamente después de E5:

```text
AUTH-DB-001
mode = GLOBAL_ENABLE_ONCE
execution_gate = PRE_E5_FOUNDATION
instance = AUTH-DB-001::GLOBAL
```

La aprobación documental de esta tarea no autoriza la instancia física.

---

#### 4. Reconciliación del hallazgo de `SUPA-AUD`

`SUPA-AUD-009` registró tablas Vento con RLS deshabilitado dentro de `app_private` y `viso`. Antes de congelar el alcance de R0 se volvió a observar el estado remoto.

La reconciliación detecta un cambio ya materializado fuera de esta tarea:

| Relación auditada              | Estado remoto vigente | Políticas vigentes | Decisión de `AUTH-DB-001` |
| ------------------------------ | --------------------- | -----------------: | ------------------------- |
| `viso.role_concurrency_limits` | `RLS_ENABLED`         |                  1 | `YA_CORREGIDA_NO_TOCAR`   |

La política remota observada para esa tabla es `no_client_access_role_concurrency_limits`, dirigida a `anon, authenticated`, con `USING false` y `WITH CHECK false`. `AUTH-DB-001` no la recrea, modifica, renombra ni usa como plantilla para las demás tablas.

El conjunto material pendiente se deriva del estado remoto actual, no de copiar de forma ciega el corte histórico.

---

#### 5. Universo exacto pendiente

El universo actual pendiente queda cerrado en **12 tablas**:

|    # | Relación                                | Owner      | RLS actual | FORCE actual | Políticas | Grants `anon` | Grants `authenticated` | Grants `service_role` | RLS objetivo | Decisión FORCE                          | Decisión          |
| ---: | --------------------------------------- | ---------- | ---------- | ------------ | --------: | ------------: | ---------------------: | --------------------: | ------------ | --------------------------------------- | ----------------- |
|    1 | `app_private.delivery_pin_secrets`      | `postgres` | `OFF`      | `OFF`        |         0 |             0 |                      0 |                     0 | `ON`         | `FORCE_NOT_REQUIRED_WITH_JUSTIFICATION` | `ENABLE_RLS_ONLY` |
|    2 | `viso.demand_forecasts`                 | `postgres` | `OFF`      | `OFF`        |         0 |             0 |                      0 |                     7 | `ON`         | `FORCE_NOT_REQUIRED_WITH_JUSTIFICATION` | `ENABLE_RLS_ONLY` |
|    3 | `viso.demand_history_hourly`            | `postgres` | `OFF`      | `OFF`        |         0 |             0 |                      0 |                     7 | `ON`         | `FORCE_NOT_REQUIRED_WITH_JUSTIFICATION` | `ENABLE_RLS_ONLY` |
|    4 | `viso.employee_availability`            | `postgres` | `OFF`      | `OFF`        |         0 |             0 |                      0 |                     7 | `ON`         | `FORCE_NOT_REQUIRED_WITH_JUSTIFICATION` | `ENABLE_RLS_ONLY` |
|    5 | `viso.employee_planning_limits`         | `postgres` | `OFF`      | `OFF`        |         0 |             0 |                      0 |                     7 | `ON`         | `FORCE_NOT_REQUIRED_WITH_JUSTIFICATION` | `ENABLE_RLS_ONLY` |
|    6 | `viso.employee_shift_preferences`       | `postgres` | `OFF`      | `OFF`        |         0 |             0 |                      0 |                     7 | `ON`         | `FORCE_NOT_REQUIRED_WITH_JUSTIFICATION` | `ENABLE_RLS_ONLY` |
|    7 | `viso.shift_generation_candidate_items` | `postgres` | `OFF`      | `OFF`        |         0 |             0 |                      0 |                     7 | `ON`         | `FORCE_NOT_REQUIRED_WITH_JUSTIFICATION` | `ENABLE_RLS_ONLY` |
|    8 | `viso.shift_generation_candidates`      | `postgres` | `OFF`      | `OFF`        |         0 |             0 |                      0 |                     7 | `ON`         | `FORCE_NOT_REQUIRED_WITH_JUSTIFICATION` | `ENABLE_RLS_ONLY` |
|    9 | `viso.shift_generation_runs`            | `postgres` | `OFF`      | `OFF`        |         0 |             0 |                      0 |                     7 | `ON`         | `FORCE_NOT_REQUIRED_WITH_JUSTIFICATION` | `ENABLE_RLS_ONLY` |
|   10 | `viso.site_operational_roles`           | `postgres` | `OFF`      | `OFF`        |         0 |             0 |                      0 |                     7 | `ON`         | `FORCE_NOT_REQUIRED_WITH_JUSTIFICATION` | `ENABLE_RLS_ONLY` |
|   11 | `viso.site_planning_rules`              | `postgres` | `OFF`      | `OFF`        |         0 |             0 |                      0 |                     7 | `ON`         | `FORCE_NOT_REQUIRED_WITH_JUSTIFICATION` | `ENABLE_RLS_ONLY` |
|   12 | `viso.site_staffing_requirements`       | `postgres` | `OFF`      | `OFF`        |         0 |             0 |                      0 |                     7 | `ON`         | `FORCE_NOT_REQUIRED_WITH_JUSTIFICATION` | `ENABLE_RLS_ONLY` |

Reconciliación:

```text
TABLAS PENDIENTES ESPERADAS = 12
TABLAS PENDIENTES MATERIALIZADAS = 12
FALTANTES = 0
DUPLICADOS = 0
TABLAS CON RLS YA HABILITADO DENTRO DEL ALCANCE = 0
```

---

#### 6. Regla de contención RLS

Para cada una de las doce tablas pendientes, el estado objetivo de esta tarea es exclusivamente:

```text
relrowsecurity = true
```

La materialización deberá preservar simultáneamente:

- nombre y esquema de la tabla;
- owner PostgreSQL;
- columnas y tipos;
- claves, constraints e índices;
- triggers;
- datos existentes;
- grants existentes;
- políticas existentes, que actualmente son cero en las doce tablas;
- consumidores y autoridad empresarial;
- comportamiento server-side permitido por roles privilegiados existentes.

`AUTH-DB-001` no usa la habilitación de RLS para alterar ninguna otra dimensión.

---

#### 7. Default deny sin fabricar autorización

Habilitar RLS sin crear policies establece un estado de denegación por defecto para roles sujetos a RLS. En el corte remoto actual, las doce tablas pendientes ya presentan:

```text
anon table grants = 0
authenticated table grants = 0
```

Por tanto, la corrección añade defensa en profundidad sin conceder una ruta de acceso nueva.

No se crea una policy `USING true`, una policy temporal, una policy de compatibilidad ni una policy copiada de otra tabla para “mantener funcionando” clientes. Si un consumidor requiere acceso directo futuro, su autorización deberá quedar definida por la tarea propietaria correspondiente antes de concederlo.

---

#### 8. Frontera de `service_role` y backend privilegiado

Las once tablas `viso.*` pendientes conservan grants observados para `service_role`; `app_private.delivery_pin_secrets` no presenta grants directos para `service_role` en el corte consultado.

`service_role` y cualquier rol con `BYPASSRLS` no se convierten en roles restringidos por esta tarea. La habilitación de RLS no se presentará como sustituto de:

- mínimo privilegio;
- revisión de funciones `SECURITY DEFINER`;
- control de secretos;
- autorización empresarial interna;
- hardening de grants;
- separación de runtime, migración y mantenimiento.

Esas responsabilidades permanecen en sus tareas canónicas.

---

#### 9. Decisión explícita sobre `FORCE ROW LEVEL SECURITY`

Las doce tablas reciben la misma decisión explícita:

```text
FORCE_NOT_REQUIRED_WITH_JUSTIFICATION
```

Justificación acumulada:

1. el owner observado es `postgres`, usado como autoridad administrativa y de migración, no como rol cliente ordinario;
2. `anon` y `authenticated` no tienen grants directos sobre las doce tablas;
3. `FORCE RLS` no corrige un rol con `BYPASSRLS`;
4. `SUPA-ARC-015` prohíbe activar `FORCE RLS` masivamente para compensar grants, owners o funciones privilegiadas mal diseñados;
5. cualquier cambio futuro de owner, grants, exposición o rol de runtime obliga a reevaluar esta decisión antes de considerarla vigente.

`AUTH-DB-001::GLOBAL` no ejecutará `FORCE ROW LEVEL SECURITY` sobre ninguna tabla.

---

#### 10. Frontera con políticas RLS

Esta tarea no diseña ni modifica políticas.

```text
AUTH-DB-001
= habilitar RLS donde sigue OFF

AUTH-DB-002
= endurecer políticas RLS demasiado amplias aprobadas para corrección
```

Las doce tablas pendientes tienen actualmente cero policies. Ese hecho se preserva durante esta contención para evitar inventar semántica de acceso sin owner, actor, operación, scope y pruebas negativas aprobadas.

La policy ya existente en `viso.role_concurrency_limits` queda fuera del cambio porque la tabla ya no pertenece al conjunto pendiente de `AUTH-DB-001`.

---

#### 11. Frontera con grants

Esta tarea tampoco concede ni revoca privilegios PostgreSQL.

```text
AUTH-DB-004
= reducir grants innecesarios de authenticated

AUTH-DB-005
= revocar grants innecesarios de anon
```

Los conteos observados de grants se utilizan solo como evidencia para demostrar que habilitar RLS no está fabricando una nueva autorización cliente.

La presencia de grants de `service_role` en VISO se conserva como hecho del runtime privilegiado y no se normaliza en `AUTH-DB-001`.

---

#### 12. Handoff de materialización física

La topología de la tarea es:

```text
mode = GLOBAL_ENABLE_ONCE
execution_gate = PRE_E5_FOUNDATION
instance = AUTH-DB-001::GLOBAL
```

La futura instancia física deberá materializar, como mínimo:

1. una migración nueva, versionada e inmutable bajo la fuente canónica de migraciones de `vento-shell`;
2. precondición fail-closed de que las doce identidades esperadas existen como tablas y continúan siendo las únicas pendientes del alcance autorizado;
3. `ENABLE ROW LEVEL SECURITY` para cada una de las doce tablas;
4. cero `CREATE POLICY`, `ALTER POLICY` o `DROP POLICY`;
5. cero `GRANT` o `REVOKE`;
6. cero `FORCE ROW LEVEL SECURITY`;
7. cero cambios de owner, columnas, constraints, índices, triggers o datos;
8. evidencia de que `relrowsecurity = true` en 12/12 después del cambio;
9. evidencia de que los conteos de policies y grants no se ampliaron por la migración;
10. validación mediante el harness de `AUTH-DB-027` y contra el baseline/drift gobernado por `AUTH-DB-028`.

La instancia no queda autorizada por esta tarea documental.

---

#### 13. Precondiciones fail-closed

La futura materialización se detiene antes de mutar si ocurre cualquiera de estas condiciones:

1. falta alguna de las doce tablas autorizadas;
2. aparece una identidad adicional con RLS deshabilitado dentro del universo gobernado por esta corrección y no ha sido reconciliada;
3. una tabla cambió de tipo de relación;
4. una tabla fue movida, retirada o renombrada por una decisión canónica posterior;
5. cambió el owner de forma no conciliada;
6. aparecieron policies no contempladas en una de las doce tablas;
7. aparecieron grants cliente no conciliados;
8. el baseline o drift de `AUTH-DB-028` no permite identificar el entorno con certeza;
9. no existe recovery point válido conforme a `AUTH-DB-029`;
10. la instancia física no tiene autorización explícita vigente.

No se sustituye una identidad faltante por otra tabla “equivalente” por nombre o intención.

---

#### 14. Recuperación y rollback

La habilitación de RLS es una corrección de seguridad. Su estrategia normal de recuperación será:

```text
PREFERENCIA = FORWARD_FIX
```

Reglas:

1. el recovery point debe capturar al menos `relrowsecurity`, `relforcerowsecurity`, policies y grants previos de las doce tablas;
2. un fallo funcional se corrige identificando el consumidor, grant o policy faltante en su tarea propietaria, no desactivando RLS de forma automática;
3. `DISABLE ROW LEVEL SECURITY` no constituye rollback rutinario permitido para esta corrección;
4. reabrir temporalmente una tabla solo podría ocurrir como acción extraordinaria de recuperación, con autorización explícita, blast radius conocido y evidencia de que no introduce acceso cliente no autorizado;
5. cualquier recuperación preserva datos, constraints, autoridad empresarial y evidencia histórica;
6. el resultado posterior debe volver a ejecutar las comprobaciones RLS del harness y reconciliar drift.

---

#### 15. Handoff a tareas posteriores de R0

`AUTH-DB-001` no absorbe:

| Tarea         | Responsabilidad reservada                          |
| ------------- | -------------------------------------------------- |
| `AUTH-DB-002` | revisar y endurecer policies RLS demasiado amplias |
| `AUTH-DB-003` | endurecer funciones `SECURITY DEFINER` aprobadas   |
| `AUTH-DB-004` | reducir grants innecesarios de `authenticated`     |
| `AUTH-DB-005` | revocar grants innecesarios de `anon`              |

Una discrepancia encontrada durante la futura materialización se asigna a la tarea propietaria correspondiente; no se corrige lateralmente dentro de `AUTH-DB-001`.

---

#### 16. Requisitos de prueba derivados

**Resultado:** NO GENERA NI MODIFICA REQUISITOS DE PRUEBA.

**Requisitos creados:** 0

**Requisitos modificados:** 0

Justificación: la tarea materializa el alcance exacto de una contención RLS ya exigida por la arquitectura de seguridad y por el contrato de validación de migraciones. No crea una regla empresarial nueva, no define permisos nuevos, no concede acceso, no modifica la semántica de policies ni cambia la obligación de validar RLS, drift y rollback.

---

#### 17. Cobertura de prueba vigente reutilizada

La tarea reutiliza, sin modificar el Registro Canónico de Requisitos de Prueba:

- `TREQ-SUPABASE-007`, para equivalencia y pruebas negativas entre autorización, RPC y RLS cuando exista una superficie autorizada;
- `TREQ-SUPABASE-008`, para reconstrucción, validación de RLS, drift, backup, restauración y rollback de migraciones.

Esta trazabilidad no crea ni modifica esas filas.

---

#### 18. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                                           |
| --------- | -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | pendiente de materialización local del artefacto documental y validación del plan                                                                                   |
| LOCAL     | NOT_EXECUTED   | pendiente de preflight, formato, quality, delivery y validadores documentales del checkout                                                                          |
| REMOTA    | PASS           | consulta read-only de catálogos PostgreSQL confirmó 12 tablas pendientes con RLS OFF; `viso.role_concurrency_limits` ya aparece con RLS ON y una policy deny-client |
| OPERATIVA | NOT_APPLICABLE | esta tarea documental no cambia disponibilidad, tráfico, procesos ni consumidores                                                                                   |
| FÍSICA    | NOT_APPLICABLE | `AUTH-DB-001::GLOBAL` permanece separada, pendiente y sin autorización física                                                                                       |

---

#### 19. Criterios de aceptación

- [x] `AUTH-DB-001` se confirma como tarea documental actual de R0.
- [x] La topología se confirma como `GLOBAL_ENABLE_ONCE` con gate `PRE_E5_FOUNDATION`.
- [x] Se reconcilia el hallazgo histórico contra el estado remoto vigente.
- [x] `viso.role_concurrency_limits` se reconoce como ya corregida y queda fuera del cambio.
- [x] Se materializan exactamente 12 tablas pendientes, sin faltantes ni duplicados.
- [x] Las 12 tienen `RLS OFF`, `FORCE RLS OFF` y cero policies en el corte observado.
- [x] Las 12 carecen de grants directos para `anon` y `authenticated`.
- [x] Se define `ENABLE_RLS_ONLY` para 12/12.
- [x] Se definen cero policies nuevas.
- [x] Se definen cero cambios de grants.
- [x] Se definen cero activaciones de `FORCE RLS` y una justificación explícita por tabla.
- [x] Se preserva la frontera de `service_role` y `BYPASSRLS` sin confundirla con autorización empresarial.
- [x] Se define materialización física fail-closed y una sola instancia `AUTH-DB-001::GLOBAL`.
- [x] Se define recuperación preferente mediante `FORWARD_FIX` y se prohíbe desactivar RLS como rollback rutinario.
- [x] Se preservan las responsabilidades de `AUTH-DB-002` a `AUTH-DB-005`.
- [x] Se declaran cero cambios TREQ con cobertura heredada explícita fuera de la sección de requisitos derivados.
- [x] No se ejecuta DDL, DML, migración, policy, grant, revoke ni cambio remoto.

---

#### 20. Límites

Esta tarea no autoriza ni ejecuta:

- migraciones SQL;
- `ENABLE ROW LEVEL SECURITY` en el proyecto remoto;
- `FORCE ROW LEVEL SECURITY`;
- creación, modificación o retiro de policies;
- `GRANT` o `REVOKE`;
- cambios de owner;
- cambios de esquemas, tablas, columnas, constraints, índices o triggers;
- cambios de datos;
- exposición de schemas mediante Data API;
- cambios de Auth, Storage, Realtime, Edge Functions, cron o secretos;
- cambios en repositorios consumidores;
- implementación de `AUTH-DB-002`, `AUTH-DB-003`, `AUTH-DB-004` o `AUTH-DB-005`;
- autorización de `AUTH-DB-001::GLOBAL`.

**ÚLTIMA TAREA APROBADA:** `AUTH-DB-029 — Validar respaldo, restauración y rollback antes del primer paquete`

**TAREA ACTUAL APROBADA:** `AUTH-DB-001 — Corregir tablas sin RLS identificadas en SUPA-AUD`

**SIGUIENTE TAREA RESERVADA:** `AUTH-DB-002 — Endurecer políticas RLS demasiado amplias aprobadas para corrección`

---

#### 21. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-DB-029 — Validar respaldo, restauración y rollback antes del primer paquete`

**TAREA ACTUAL APROBADA**
`AUTH-DB-001 — Corregir tablas sin RLS identificadas en SUPA-AUD`

**SIGUIENTE TAREA RESERVADA**
`AUTH-DB-002 — Endurecer políticas RLS demasiado amplias aprobadas para corrección`


### ✅ AUTH-DB-002 — Endurecer políticas RLS demasiado amplias aprobadas para corrección

**Estado:** APROBADA
**Tarea anterior:** AUTH-DB-001 — Corregir tablas sin RLS identificadas en SUPA-AUD
**Tarea siguiente:** AUTH-DB-003 — Endurecer funciones SECURITY DEFINER aprobadas
**Tipo de tarea:** Documental
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/01_R0_PREPARACION_PRUEBAS_Y_CONTENCION_DE_RIESGOS.md`
**Estado físico resultante:** Contrato de endurecimiento RLS cerrado; futura instancia global `AUTH-DB-002::GLOBAL` pendiente de autorización explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`AUTH-DB-002` define el contrato de contención para las políticas Row Level Security que las auditorías canónicas ya clasificaron como demasiado amplias y aprobaron para corrección.

La tarea no convierte en defecto cualquier policy que use `authenticated`, `PERMISSIVE`, `USING (true)` o una función helper. La inclusión exige simultáneamente:

```text
HALLAZGO CANÓNICO CONFIRMADO
+
POLICY O COMPOSICIÓN RLS OBSERVABLE
+
ACCESO MÁS AMPLIO QUE EL CONTRATO EMPRESARIAL
+
PROPIETARIO DE CORRECCIÓN IDENTIFICADO
```

La frontera queda:

```text
AUTH-DB-001
→ habilita RLS donde sigue deshabilitado

AUTH-DB-002
→ elimina o restringe policies existentes que amplían autorización

AUTH-DB-003
→ endurece funciones SECURITY DEFINER

AUTH-DB-004
→ reduce grants innecesarios de authenticated

AUTH-DB-005
→ revoca grants innecesarios de anon
```

---

#### 2. Resultado canónico

La corrección RLS objetivo obedece:

```text
AUTENTICADO
≠ AUTORIZADO

TRABAJADOR ACTIVO
≠ AUTORIZADO PARA TODA FILA

MISMA SEDE
≠ AUTORIZADO PARA TODO RECURSO

ROL GERENTE
≠ ADMINISTRACIÓN GLOBAL

POLICY PERMISSIVE A
+
POLICY PERMISSIVE B
=
A OR B
```

Por tanto, una policy general no puede anular por composición `OR` una policy más específica que ya limite permiso, sede, recurso, estado o actor.

La futura materialización deberá producir una migración versionada y verificable que cierre únicamente las superficies aprobadas en esta tarea.

---

#### 3. Topología y gate

La reconciliación vigente de R0 establece:

```text
mode = GLOBAL_ENABLE_ONCE
execution_gate = PRE_E5_FOUNDATION
instance = AUTH-DB-002::GLOBAL
```

Consecuencias:

1. existe una única materialización física global de esta fundación;
2. no se crea una instancia por paquete;
3. la infraestructura de `AUTH-DB-015`, `AUTH-DB-027`, `AUTH-DB-028`, `AUTH-DB-029` y la contención de `AUTH-DB-001` constituyen el handoff físico anterior;
4. `PRE_E5_FOUNDATION` permite cerrar esta contención antes de los paquetes E5;
5. esta aprobación documental no autoriza ninguna migración ni modificación remota.

---

#### 4. Fuentes vinculantes

La tarea reconcilia:

- `SUPA-AUD-009`, como inventario y auditoría de policies, grants y privilegios;
- `CODE-AUD-017`, como fuente de hallazgos de autorización confirmados y sus destinos;
- `SUPA-ARC-015`, como política canónica objetivo de exposición, grants y RLS;
- `AUTH-DB-001`, como frontera anterior de habilitación RLS;
- los contratos `AUTH-SRV-*`, `PULSO-AUTH-*`, `ORIGO-AUTH-*`, `VISO-AUTH-*`, `PASS-INT-*` y `EVID-ARC-*` ya aprobados que poseen la semántica empresarial;
- el Registro Canónico de Requisitos de Prueba vigente;
- el estado remoto observable de `vento-os-dev`, utilizado únicamente como evidencia de línea base y no como autoridad normativa.

Precedencia:

```text
REGLA EMPRESARIAL APROBADA
→ define quién debe poder hacer qué

CONTRATO RLS CANÓNICO
→ define cómo expresar la frontera de filas

ESTADO REMOTO
→ demuestra qué existe hoy

AUTH-DB-002
→ decide qué policy amplia se retira o restringe
→ no inventa capacidades nuevas
```

---

#### 5. Regla de inclusión y exclusión

Una policy entra en `AUTH-DB-002` cuando una fuente canónica ya demostró que concede acceso lateral, mutación excesiva o bypass lógico por composición.

Una policy no entra únicamente porque:

- sea `PERMISSIVE`;
- use `TO authenticated`;
- tenga `USING (true)` sobre un catálogo deliberadamente global;
- conceda acceso a `service_role`;
- su nombre parezca administrativo;
- exista una alternativa más estricta teóricamente posible.

Toda ampliación del universo de corrección exige evidencia canónica equivalente a la utilizada en esta tarea.

---

#### 6. Línea base reconciliada de `public.users`

El estado observado conserva estas policies relevantes:

| Policy                        | Operación | Estado observado                                           | Hallazgo                                                                |
| ----------------------------- | --------- | ---------------------------------------------------------- | ----------------------------------------------------------------------- |
| `users_update_self`           | `UPDATE`  | limita fila por `id = auth.uid()`, pero no limita columnas | un cliente puede intentar modificar campos protegidos de su propia fila |
| `staff_select_all_users`      | `SELECT`  | permite todas las filas a cualquier trabajador activo      | lectura masiva de datos de cliente                                      |
| `users_select_cashier`        | `SELECT`  | autoriza por rol laboral general sin territorio de fila    | lectura directa más amplia que la proyección operacional mínima         |
| `users_select_cashier_for_qr` | `SELECT`  | replica la misma concesión amplia                          | segunda vía directa equivalente                                         |

Decisión:

```text
users_update_self
→ NO puede permanecer como frontera suficiente para una fila mixta
→ la autoadministración debe limitarse a campos aprobados mediante contrato de servidor, proyección o grants mínimos
→ AUTH-DB-004 conserva la propiedad de los grants

staff_select_all_users
→ RETIRAR COMO VÍA GENERAL

users_select_cashier
users_select_cashier_for_qr
→ NO pueden autorizar lectura completa de public.users como sustituto de una proyección mínima
→ el flujo de caja consume una frontera controlada y limitada
```

El acceso `users_select_self` permanece conceptualmente válido para la propia fila únicamente en la medida en que la proyección resultante no exponga campos que otra capa deba ocultar.

---

#### 7. Línea base reconciliada de fidelización

##### 7.1. Ledger de puntos

Estado observado:

```text
pass.loyalty_transactions
policy = "Users can insert their own transactions"
operation = INSERT
predicate = auth.uid() = user_id
```

El predicado demuestra ownership de la fila, pero no demuestra autorización para crear un hecho económico de fidelización.

Decisión:

```text
CLIENTE AUTENTICADO
→ NO INSERTA DIRECTAMENTE EL LEDGER

ACUMULACIÓN / GASTO / AJUSTE / REVERSIÓN
→ CONTRATO DE SERVIDOR AUTORIZADO
→ OPERACIÓN ATÓMICA E IDEMPOTENTE
```

La policy de inserción cliente debe desaparecer como capacidad directa antes de considerar cerrado el hallazgo.

##### 7.2. Redenciones

Conviven policies específicas de caja y sede con:

```text
staff_select_all_redemptions
staff_validate_redemptions
```

Las dos policies generales usan `is_active_staff()` y se componen de manera permisiva con las específicas.

Decisión:

| Policy amplia                  | Resultado                                                                                     |
| ------------------------------ | --------------------------------------------------------------------------------------------- |
| `staff_select_all_redemptions` | retirar; no puede ampliar la lectura más allá del contrato específico de actor/sede           |
| `staff_validate_redemptions`   | retirar; no puede ampliar la validación más allá del contrato específico de actor/sede/estado |

Las policies específicas existentes tampoco se convierten por esta tarea en autoridad definitiva. Permanecen sujetas al contrato de permiso, sede, actor y operación atómica aprobado para PULSO/PASS.

---

#### 8. Línea base reconciliada de documentos

`CODE-AUD-017` confirmó que pertenecer a una sede permite actualmente una lectura documental más amplia que el contrato de privacidad.

La policy observada:

```text
public.documents
documents_select_self_or_permission
```

incluye una rama que permite leer por mera pertenencia activa a la misma sede.

Decisión:

```text
MISMA SEDE
→ NO ES CONDICIÓN SUFICIENTE

LECTURA DOCUMENTAL
→ propio documento
OR
→ sujeto autorizado
OR
→ permiso explícito aplicable al recurso
```

La rama de pertenencia desnuda a sede debe retirarse.

La policy de Storage:

```text
storage.objects
documents_select_visible
```

reproduce el mismo principio mediante metadata documental y también debe excluir la pertenencia desnuda a sede como criterio suficiente.

Esta tarea no cambia:

- la bandera pública/privada del bucket;
- URLs firmadas;
- expiración;
- ciclos de vida;
- grants de Storage.

Esas responsabilidades permanecen en sus contratos propietarios.

---

#### 9. Línea base reconciliada de órdenes de compra

Estado observado:

```text
public.purchase_orders
employees_crud_purchase_orders
FOR ALL
criterio principal = existe una fila de employee para auth.uid()
```

El contrato canónico exige permiso, sede o centro de costo, estado y columnas.

Decisión:

1. `employees_crud_purchase_orders` no puede sobrevivir como concesión genérica;
2. `FOR ALL` se descompone por operación cuando existan operaciones directas permitidas;
3. ninguna escritura se concede únicamente por existir como trabajador;
4. una operación sin predicate canónico completo queda denegada hasta que su acción propietaria exista;
5. `AUTH-DB-004` conserva la reducción de grants;
6. los contratos ORIGO conservan la semántica de consulta, aprobación y alcance.

La ausencia temporal de una ruta directa permitida se resuelve fail-closed; no se reintroduce `is_employee()` como permiso empresarial.

---

#### 10. Línea base reconciliada de pedidos y líneas

Las policies observadas relevantes incluyen:

```text
public.orders
orders_update_staff

public.order_items
order_items_update_staff
```

Ambas permiten `UPDATE` usando esencialmente:

```text
trabajador
+
acceso a sede
```

Eso permite mutar una fila completa sin demostrar acción nombrada, transición ni columnas permitidas.

Decisión:

```text
UPDATE DIRECTO GENERICO
→ NO AUTORIZADO

MUTACION DE PEDIDO O LINEA
→ ACCION NOMBRADA
→ PERMISO
→ SEDE
→ ESTADO DE ORIGEN
→ TRANSICION
→ COLUMNAS PERMITIDAS
→ AUDITORIA
```

`order_item_options_update_staff` pertenece al mismo agregado técnico, pero no se incorpora automáticamente a la corrección por semejanza. Su modificación física exige demostrar que la acción propietaria y el hallazgo canónico la incluyen.

---

#### 11. Línea base reconciliada de configuración administrativa

El hallazgo `H-CODE-017-014` prohíbe que `gerente` equivalga a administración global.

El estado remoto contiene policies administrativas con la forma:

```text
owner
OR global_manager
OR role = gerente
```

sin una restricción territorial o una capacidad administrativa explícita suficiente.

Entre las superficies observadas se encuentran:

```text
public.document_types
document_types_write_admin

public.required_document_rules
required_document_rules_insert
required_document_rules_update
required_document_rules_delete
```

Decisión:

1. `gerente` por sí solo deja de ser una autorización suficiente;
2. owner y gerencia global conservan únicamente las facultades aprobadas por sus contratos;
3. una regla territorial usa el recurso territorial real cuando exista;
4. un catálogo verdaderamente global exige una capacidad administrativa global explícita;
5. si no existe aún un permiso canónico exacto para una mutación, la operación queda fail-closed hasta su tarea propietaria;
6. esta tarea no inventa nombres de permisos.

---

#### 12. Composición de policies

La materialización futura deberá validar el resultado efectivo por tabla, rol y operación, no cada policy de forma aislada.

Regla:

```text
PERMISSIVE(A)
+
PERMISSIVE(B)
→ A OR B
```

Por tanto:

1. una policy amplia no permanece al lado de otra específica con la expectativa de que la específica la limite;
2. para una misma audiencia y operación, cualquier rama que conceda acceso fuera del contrato bloquea;
3. una policy `RESTRICTIVE` solo se introduce cuando la arquitectura aprobada lo exija y existan pruebas de composición;
4. no se usa una policy restrictiva como parche opaco para conservar indefinidamente una policy permisiva defectuosa;
5. el resultado efectivo debe ser legible, reproducible y testeable.

---

#### 13. Forma canónica de las policies corregidas

Toda policy nueva o reemplazada dentro de la futura materialización cumple:

1. audiencia explícita mediante `TO`;
2. cero uso nuevo de `PUBLIC` para estas superficies protegidas;
3. operación específica `SELECT`, `INSERT`, `UPDATE` o `DELETE`;
4. `FOR ALL` únicamente cuando la misma guarda sea correcta para todas las operaciones y exista evidencia explícita;
5. `TO authenticated` no constituye autorización empresarial;
6. `USING` limita filas existentes;
7. `WITH CHECK` valida la fila resultante o insertada;
8. `UPDATE` comprueba estado anterior y estado posterior cuando el contrato incluya transición;
9. permiso, recurso, territorio, estado y actor se incluyen cuando sean parte del contrato;
10. metadata autoadministrable no se usa como autoridad;
11. las funciones helper utilizadas deben pertenecer al contrato canónico y no ampliar silenciosamente la decisión.

---

#### 14. Matriz de decisiones de endurecimiento

| Superficie                   | Policy / familia                                              | Decisión `AUTH-DB-002`                                             | Propietario complementario         |
| ---------------------------- | ------------------------------------------------------------- | ------------------------------------------------------------------ | ---------------------------------- |
| `public.users`               | `users_update_self`                                           | cerrar actualización directa de fila mixta como control suficiente | `AUTH-DB-004`, contratos PASS/AUTH |
| `public.users`               | `staff_select_all_users`                                      | retirar lectura general por trabajador activo                      | contratos PULSO/PASS               |
| `public.users`               | `users_select_cashier`                                        | sustituir lectura de fila completa por frontera mínima autorizada  | PULSO/PASS                         |
| `public.users`               | `users_select_cashier_for_qr`                                 | sustituir lectura de fila completa por frontera mínima autorizada  | PULSO/PASS                         |
| `pass.loyalty_transactions`  | inserción directa de cliente                                  | retirar                                                            | PASS/PULSO server contracts        |
| `pass.loyalty_redemptions`   | `staff_select_all_redemptions`                                | retirar policy que amplía por OR                                   | PULSO/PASS                         |
| `pass.loyalty_redemptions`   | `staff_validate_redemptions`                                  | retirar policy que amplía por OR                                   | PULSO/PASS                         |
| `public.documents`           | `documents_select_self_or_permission`                         | eliminar pertenencia desnuda a sede como vía de lectura            | EVID / ANIMA                       |
| `storage.objects`            | `documents_select_visible`                                    | eliminar pertenencia desnuda a sede como vía de lectura            | EVID / Storage                     |
| `public.purchase_orders`     | `employees_crud_purchase_orders`                              | retirar autorización genérica `FOR ALL` de trabajador              | ORIGO                              |
| `public.orders`              | `orders_update_staff`                                         | cerrar UPDATE genérico de fila completa                            | PULSO                              |
| `public.order_items`         | `order_items_update_staff`                                    | cerrar UPDATE genérico de línea completa                           | PULSO                              |
| configuración administrativa | policies que autorizan por `gerente` sin capacidad/territorio | sustituir rol desnudo por contrato administrativo explícito        | VISO / AUTH                        |
| otras policies amplias       | no incluidas expresamente                                     | no modificar por analogía                                          | tarea propietaria correspondiente  |

La tabla define decisiones contractuales. No contiene SQL ejecutable ni autoriza la materialización.

---

#### 15. Hallazgos relacionados que no quedan cerrados por esta tarea

`AUTH-DB-002` participa en defensa en profundidad, pero no reclama cierre total de:

| Hallazgo                                     | Propietario fuera de `AUTH-DB-002`            |
| -------------------------------------------- | --------------------------------------------- |
| rol/sede enviados al aceptar invitación      | acciones y funciones de servidor `AUTH-SRV-*` |
| grants directos excesivos de `authenticated` | `AUTH-DB-004`                                 |
| grants o exposición de `anon`                | `AUTH-DB-005`                                 |
| funciones `SECURITY DEFINER`                 | `AUTH-DB-003`                                 |
| vistas sin `security_invoker`                | arquitectura de vistas + grants               |
| bucket público y URL temporal                | EVID / Storage                                |
| RPC anónimas                                 | `AUTH-DB-003` + `AUTH-DB-005`                 |
| atomicidad de redención                      | contratos PASS/PULSO y servidor               |
| mutaciones de pedido por acción nombrada     | PULSO + servidor                              |
| autorización completa de compras             | ORIGO + servidor                              |

Un PASS físico de `AUTH-DB-002::GLOBAL` significa que las policies amplias incluidas fueron contenidas; no significa que esos hallazgos transversales estén totalmente cerrados.

---

#### 16. Pruebas negativas obligatorias

La futura materialización debe incorporar al harness de `AUTH-DB-027` casos que demuestren, como mínimo:

1. usuario cliente no modifica saldo, rol ni estado protegido;
2. trabajador activo sin necesidad operacional no enumera clientes;
3. cajero fuera del territorio permitido no obtiene la proyección de otro territorio;
4. cliente no inserta directamente el ledger de puntos;
5. trabajador no cajero no lee todas las redenciones;
6. trabajador fuera de sede no valida una redención;
7. pertenecer a una sede no concede por sí solo metadata documental de otro trabajador;
8. conocer una ruta de Storage no concede lectura;
9. empleado sin permiso ORIGO no crea, modifica, aprueba ni elimina una orden de compra;
10. trabajador con acceso a sede no modifica libremente pago, precio, fidelización, inventario o estado de un pedido;
11. gerente de una sede no administra configuración global ni filas de otra sede;
12. actor autorizado conserva el caso positivo mínimo necesario.

Una policy que deniega todos los casos, incluidos los legítimos, no constituye corrección suficiente.

---

#### 17. Materialización física posterior

La futura instancia:

```text
AUTH-DB-002::GLOBAL
```

deberá:

1. partir de los contratos y baselines físicos ya verificados de R0;
2. reconciliar nuevamente el estado real de cada policy incluida;
3. fallar si una policy desapareció, cambió de semántica o fue sustituida sin trazabilidad;
4. crear una migración forward versionada;
5. no reescribir migraciones históricas;
6. aplicar únicamente las decisiones de esta tarea;
7. ejecutar pruebas positivas y negativas;
8. demostrar ausencia de ampliación por composición `OR`;
9. demostrar drift permitido únicamente conforme a `AUTH-DB-028`;
10. preservar evidencia de recovery conforme a `AUTH-DB-029`.

La aprobación documental no autoriza esa instancia.

---

#### 18. Rollback seguro

Una reversión no puede restaurar silenciosamente una policy que ya fue clasificada como vulnerabilidad confirmada.

Orden de respuesta ante fallo posterior a la corrección:

```text
CORREGIR FORWARD
o
DESHABILITAR TEMPORALMENTE LA CAPACIDAD AFECTADA
o
RESTAURAR UNA POLICY PREVIA SOLO SI SIGUE CUMPLIENDO EL CONTRATO DE SEGURIDAD
```

El rollback físico deberá preservar:

- historial de migraciones;
- evidencia del estado anterior;
- motivo;
- actor;
- recovery point;
- validación posterior.

`AUTH-DB-029` conserva la autoridad del mecanismo de recuperación.

---

#### 19. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA NUEVOS

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Justificación:** los hallazgos de autorización, privacidad, fidelización, compras, pedidos, documentos y territorio ya están protegidos por requisitos canónicos existentes. `AUTH-DB-002` define la corrección RLS de esas reglas sin alterar su comportamiento protegido.

---

#### 20. Cobertura de prueba vigente reutilizada

La trazabilidad existente que cubre esta tarea incluye:

- `TREQ-AUTH-005`;
- `TREQ-AUTH-006`;
- `TREQ-AUTH-007`;
- `TREQ-PASS-008`;
- `TREQ-ORIGO-002`;
- `TREQ-PULSO-004`;
- `TREQ-SUPABASE-004`;
- `TREQ-SUPABASE-007`;
- `TREQ-SUPABASE-008`.

Estos identificadores se reutilizan únicamente como cobertura vigente. Esta tarea no modifica sus filas ni su estado.

---

#### 21. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                              |
| --------- | -------------- | ---------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | pendiente de materialización documental en el checkout de la tarea                                                     |
| LOCAL     | NOT_EXECUTED   | pendiente de preflight, quality, delivery y validadores del repositorio                                                |
| REMOTA    | PASS           | estado RLS actual contrastado en modo read-only sobre `vento-os-dev`; confirma las policies utilizadas como línea base |
| OPERATIVA | NOT_APPLICABLE | la tarea documental no modifica flujos de usuario ni ejecuta correcciones físicas                                      |
| FÍSICA    | NOT_APPLICABLE | `AUTH-DB-002::GLOBAL` permanece separada y sin autorización física                                                     |

---

#### 22. Decisiones vinculantes

1. `AUTH-DB-002` corrige policies aprobadas para endurecimiento; no ejecuta una limpieza global por patrón sintáctico.
2. La futura instancia física es `AUTH-DB-002::GLOBAL`.
3. Su modo es `GLOBAL_ENABLE_ONCE`.
4. Su gate es `PRE_E5_FOUNDATION`.
5. `authenticated` representa autenticación técnica, no autorización empresarial.
6. Una policy permisiva amplia no puede convivir con una específica si la amplia anula su restricción por `OR`.
7. `public.users` no expone lectura completa a cualquier trabajador activo.
8. `public.users` no usa ownership de fila como autorización suficiente para modificar campos protegidos.
9. el cliente no inserta directamente el ledger de fidelización.
10. las policies generales de redención que amplían las específicas se retiran.
11. pertenencia a sede no concede por sí sola acceso documental.
12. una orden de compra no admite CRUD total por la sola existencia de un trabajador.
13. pedidos y líneas no admiten UPDATE completo por `is_employee() + can_access_site()`.
14. `gerente` no equivale a capacidad administrativa global.
15. las policies nuevas o reemplazadas usan audiencia y operación explícitas.
16. no se inventan permisos ausentes; la falta de contrato suficiente produce deny hasta su tarea propietaria.
17. `AUTH-DB-004` conserva los grants de `authenticated`.
18. `AUTH-DB-005` conserva los grants de `anon`.
19. `AUTH-DB-003` conserva `SECURITY DEFINER`.
20. el estado público/privado de buckets no se modifica aquí.
21. los consumidores no se reescriben en esta tarea documental.
22. la materialización posterior usa migración forward.
23. un rollback no puede reabrir silenciosamente una vulnerabilidad confirmada.
24. no se crea ni modifica ningún requisito de prueba.
25. la aprobación documental no autoriza ninguna modificación de Supabase.

---

#### 23. Criterios de aceptación

`AUTH-DB-002` queda documentalmente completa cuando:

- el universo de corrección se base en hallazgos confirmados y no en heurísticas;
- las policies amplias de `public.users` tengan destino explícito;
- la inserción cliente del ledger tenga destino explícito;
- las policies generales de redención tengan destino explícito;
- la lectura documental por mera sede quede prohibida;
- la policy genérica de órdenes de compra quede rechazada como contrato válido;
- el UPDATE genérico de pedidos y líneas quede rechazado;
- la administración por rol `gerente` sin capacidad o territorio quede rechazada;
- la composición permisiva `OR` quede contemplada;
- exista una decisión para sintaxis, audiencia, operación, `USING` y `WITH CHECK`;
- los hallazgos reservados a DB-003, DB-004 y DB-005 permanezcan separados;
- existan casos positivos y negativos mínimos;
- la futura instancia quede identificada como `AUTH-DB-002::GLOBAL`;
- no exista autorización física implícita;
- se reutilice la cobertura vigente sin modificar 04A.

---

#### 24. Límites

`AUTH-DB-002` no:

- ejecuta SQL;
- crea migraciones;
- modifica policies remotas;
- modifica grants;
- cambia funciones `SECURITY DEFINER`;
- cambia `search_path`;
- cambia privilegios `EXECUTE`;
- cambia buckets;
- genera URLs firmadas;
- cambia Edge Functions;
- modifica consumidores;
- crea acciones de servidor;
- crea nombres nuevos de permisos;
- cambia el modelo de autorización;
- aplica `FORCE ROW LEVEL SECURITY`;
- modifica datos;
- modifica 04A;
- autoriza `AUTH-DB-002::GLOBAL`;
- desarrolla `AUTH-DB-003`.

---

#### 25. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-DB-001 — Corregir tablas sin RLS identificadas en SUPA-AUD`

**TAREA ACTUAL APROBADA**
`AUTH-DB-002 — Endurecer políticas RLS demasiado amplias aprobadas para corrección`

**SIGUIENTE TAREA RESERVADA**
`AUTH-DB-003 — Endurecer funciones SECURITY DEFINER aprobadas`


### ✅ AUTH-DB-003 — Endurecer funciones SECURITY DEFINER aprobadas

**Estado:** APROBADA
**Tarea anterior:** AUTH-DB-002 — Endurecer políticas RLS demasiado amplias aprobadas para corrección
**Tarea siguiente:** AUTH-DB-004 — Reducir grants innecesarios de authenticated
**Tipo de tarea:** Documental
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/01_R0_PREPARACION_PRUEBAS_Y_CONTENCION_DE_RIESGOS.md`
**Estado físico resultante:** Contrato de endurecimiento `SECURITY DEFINER` cerrado; futura instancia global `AUTH-DB-003::GLOBAL` pendiente de autorización explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`AUTH-DB-003` define el contrato de endurecimiento de las funciones PostgreSQL `SECURITY DEFINER` gobernadas por Vento OS que deban conservar, transformar, mover, sustituir o retirar privilegio elevado conforme a la política canónica ya aprobada.

La regla de entrada es:

```text
SECURITY INVOKER
= modo predeterminado

SECURITY DEFINER
= excepción individual
= necesidad demostrada
= privilegio mínimo
= autorización interna
= evidencia negativa
```

Esta tarea no interpreta `SECURITY DEFINER` como vulnerabilidad automática ni como aprobación automática. Cada firma debe tener una disposición explícita y verificable antes de cualquier cambio físico.

---

#### 2. Resultado canónico

Queda fijado el siguiente modelo:

```text
SUPA-ARC-014
→ autoridad normativa sobre SECURITY DEFINER

SUPA-TRANS-*
→ disposición, movimiento, compatibilidad y retiro de objetos concretos

AUTH-DB-003
→ contrato físico de endurecimiento inicial

AUTH-DB-003::GLOBAL
→ única futura materialización física de esta contención

AUTH-DB-004
→ grants de authenticated

AUTH-DB-005
→ grants de anon
```

`AUTH-DB-003` no absorbe las responsabilidades de grants ni reemplaza los contratos de RLS, autorización empresarial, consumidores o transición.

---

#### 3. Topología y gate

La reconciliación vigente de R0 establece:

```text
mode = GLOBAL_ENABLE_ONCE
execution_gate = PRE_E5_FOUNDATION
instance = AUTH-DB-003::GLOBAL
```

Consecuencias:

1. existe una única instancia física global;
2. no se crea una instancia por paquete;
3. la contención debe estar disponible antes de autorizar paquetes E5 que dependan de estas superficies;
4. la aprobación documental no ejecuta ni autoriza la instancia;
5. toda materialización conservará autorización humana explícita, migración versionada, pruebas y rollback.

---

#### 4. Fuentes vinculantes

La tarea consume y preserva:

- `SUPA-AUD-006` y `SUPA-AUD-007`, como línea base de firmas, modos de seguridad, owners, ACL, `search_path` y exposición efectiva;
- `SUPA-AUD-009`, como frontera de grants, policies y privilegios efectivos;
- `SUPA-ARC-013`, como contrato de funciones, RPC y triggers;
- `SUPA-ARC-014`, como política canónica de `SECURITY DEFINER`;
- `SUPA-ARC-015`, como propietario de grants, RLS, roles de ejecución y `FORCE RLS`;
- `SUPA-TRANS-*`, como autoridad de disposición, movimiento, compatibilidad y retiro por objeto;
- el Registro Canónico de Requisitos de Prueba vigente;
- el estado remoto verificable, únicamente como evidencia de línea base.

Precedencia:

```text
POLÍTICA CANÓNICA
→ define seguridad objetivo

DISPOSICIÓN CANÓNICA
→ define destino del objeto

ESTADO REMOTO
→ demuestra qué existe hoy

AUTH-DB-003
→ define cómo endurecer sin inventar destino
```

---

#### 5. Línea base reconciliada

El corte histórico de `SUPA-ARC-014` registraba:

```text
347 funciones Vento
210 SECURITY DEFINER
179 SECURITY DEFINER directas
45 ejecutables por anon
151 ejecutables por authenticated
29 triggers usando función SECURITY DEFINER
```

La línea base remota vigente presenta una reconciliación posterior:

```text
348 funciones gobernadas en el universo auditado
211 SECURITY DEFINER
179 SECURITY DEFINER directas
32 funciones trigger SECURITY DEFINER
46 SECURITY DEFINER ejecutables efectivamente por anon
152 SECURITY DEFINER ejecutables efectivamente por authenticated
14 SECURITY DEFINER con row_security=off
```

El incremento se explica por:

```text
public.viso_enforce_monthly_schedule_publish_limit()
```

y su trigger asociado sobre `public.employee_shifts`.

La función fue introducida mediante migración versionada y ya aparece reconciliada en el registro canónico posterior. Por tanto, los conteos antiguos permanecen como baseline histórico y no como cardinalidad vigente.

---

#### 6. Frontera de producto

El universo auditado contiene también funciones pertenecientes a la frontera separada de VITAL.

Para `AUTH-DB-003`:

```text
UNIVERSO GOBERNADO OBSERVADO
= 211 SECURITY DEFINER

FRONTERA VITAL
= 5 SECURITY DEFINER
= fuera del alcance físico de Vento OS

UNIVERSO VENTO OS PARA CONTENCIÓN
= 206 SECURITY DEFINER
```

Reglas:

1. VITAL no se incorpora por semejanza técnica;
2. una función VITAL conserva su propia disposición y gobierno;
3. la futura instancia no modifica objetos de VITAL;
4. los conteos globales pueden usarse para reconciliación, pero no amplían el alcance físico.

---

#### 7. Clases de excepción permitidas

Una función solo puede permanecer `SECURITY DEFINER` cuando pertenezca exactamente a una clase aprobada:

| Clase                                   | Finalidad                                                        |
| --------------------------------------- | ---------------------------------------------------------------- |
| `PRIVILEGED_READ_BRIDGE`                | lectura mínima privilegiada para contrato autorizado             |
| `PRIVILEGED_COMMAND_GATEWAY`            | comando con un efecto primario que requiere privilegio adicional |
| `RLS_SUPPORT_PRIMITIVE`                 | primitiva estrecha de soporte para RLS o autorización            |
| `AUDIT_APPEND_GATE`                     | escritura append-only de evidencia o evento                      |
| `TRIGGER_INVARIANT_ENFORCER`            | preservación de invariante mediante trigger                      |
| `PLATFORM_ADAPTER`                      | adaptación mínima a una superficie administrada                  |
| `TRANSITIONAL_PRIVILEGED_COMPATIBILITY` | compatibilidad privilegiada temporal durante cutover             |

Cualquier función sin clase inequívoca queda:

```text
BLOCKED_PENDING_EVIDENCE
```

No existen clases genéricas de bypass administrativo, wrapper de `service_role`, helper universal ni ejecución arbitraria.

---

#### 8. Disposición obligatoria por firma

Cada función Vento OS `SECURITY DEFINER` recibirá exactamente una disposición:

| Disposición                            | Resultado                                              |
| -------------------------------------- | ------------------------------------------------------ |
| `KEEP_AS_DEFINER`                      | conserva elevación tras superar el gate completo       |
| `CONVERT_TO_INVOKER`                   | elimina elevación porque no es necesaria               |
| `SPLIT_CONTRACT_AND_PRIVILEGED_CORE`   | separa contrato invoker de núcleo privilegiado privado |
| `REPLACE_WITH_RLS_CONSTRAINT_OR_MODEL` | elimina necesidad mediante RLS, constraint o rediseño  |
| `TRANSITIONAL_COMPATIBILITY`           | conserva temporalmente con sucesor y salida            |
| `RETIRE`                               | se elimina después de demostrar reemplazo o cero uso   |
| `BLOCKED_PENDING_EVIDENCE`             | no se modifica ni promueve sin evidencia suficiente    |

La clase no se infiere desde nombre, schema, owner, ACL o uso histórico.

---

#### 9. Prioridad de revisión

La futura materialización revisará primero las cohortes con mayor radio de impacto:

1. funciones Vento OS `SECURITY DEFINER` ejecutables efectivamente por `anon`;
2. funciones ejecutables por `authenticated`;
3. funciones directas invocables;
4. funciones de trigger privilegiadas;
5. funciones con `row_security=off`;
6. helpers internos y adapters;
7. compatibilidades, overloads, funciones huérfanas y resto del universo.

La pertenencia a varias cohortes no duplica la firma.

---

#### 10. Owner técnico objetivo

Toda función que conserve `SECURITY DEFINER` deberá abandonar el patrón histórico de owner privilegiado amplio.

El owner objetivo:

1. será un rol técnico dedicado;
2. será `NOLOGIN`;
3. no será `postgres`, `supabase_admin`, `service_role`, `anon`, `authenticated`, usuario humano ni rol de aplicación;
4. tendrá cero `SUPERUSER`;
5. tendrá cero `BYPASSRLS`;
6. no será owner de tablas de dominio por conveniencia;
7. recibirá únicamente los privilegios requeridos por el cuerpo;
8. tendrá memberships explícitas, mínimas y verificables.

La identidad concreta del rol y sus grants pertenecen a la materialización gobernada por `SUPA-ARC-015`; esta tarea no inventa nombres de roles.

---

#### 11. Autorización interna

Una función privilegiada no puede depender de que el caller haya llegado desde una interfaz, wrapper o RPC aparentemente autorizado.

Debe resolver server-side:

```text
principal válido
+ sesión activa
+ identidad vigente
+ actor efectivo
+ permiso atómico
+ scope
+ territorio
+ recurso
+ precondiciones
= efecto permitido
```

Queda prohibido tratar como autoridad final:

- `raw_user_meta_data`;
- roles enviados por cliente;
- identificadores de empleado o actor enviados por caller;
- `current_user`;
- el owner PostgreSQL;
- pertenencia a `authenticated`;
- una conexión `service_role`;
- una policy RLS que el owner privilegiado pueda omitir.

---

#### 12. `search_path` y resolución

Toda función que permanezca `SECURITY DEFINER` tendrá:

1. `search_path` explícito;
2. conjunto mínimo de schemas confiables;
3. ausencia de schemas controlables por callers;
4. referencias empresariales calificadas;
5. dependencias inventariadas;
6. prueba contra shadowing;
7. hash contractual que cambie cuando cambie la resolución de nombres.

La línea base vigente conserva funciones con `search_path` centrado en `public` y variantes con otros schemas. La existencia de configuración explícita no demuestra por sí sola seguridad objetivo.

No se preservará `public` en `search_path` únicamente por compatibilidad histórica.

---

#### 13. SQL dinámico

SQL dinámico queda prohibido por defecto.

Una excepción deberá:

- demostrar necesidad;
- usar allowlist server-side cerrada;
- separar identificadores y valores;
- parametrizar valores;
- impedir fragmentos SQL libres;
- limitar filas y tiempo;
- registrar owner, consumidores y pruebas de inyección.

No se autoriza una función genérica de lectura, escritura, administración de objetos o bypass.

---

#### 14. Funciones de lectura privilegiada

Una `PRIVILEGED_READ_BRIDGE`:

- no ejecuta DML;
- no produce red, colas o webhooks;
- usa filtros contractuales;
- aplica minimización;
- limita columnas y filas;
- evita enumeración transversal;
- no devuelve internals, ACL, SQL, secretos ni información fuera de finalidad.

Si la misma lectura puede expresarse con `SECURITY INVOKER` y RLS correctos, la disposición será `CONVERT_TO_INVOKER` o `REPLACE_WITH_RLS_CONSTRAINT_OR_MODEL`.

---

#### 15. Funciones de comando privilegiado

Una `PRIVILEGED_COMMAND_GATEWAY`:

1. tiene un único efecto primario;
2. valida autorización antes del primer efecto;
3. declara read set y write set;
4. no escribe entre dominios sin contrato propietario;
5. declara idempotencia;
6. controla concurrencia;
7. no ejecuta transacciones autónomas;
8. devuelve resultado estable;
9. conserva auditoría y correlación;
10. trata resultados inciertos mediante conciliación.

---

#### 16. Funciones de trigger

Una función privilegiada de trigger:

1. pertenece a un conjunto cerrado de triggers;
2. no es una RPC;
3. no conserva `EXECUTE` cliente por necesidad del trigger;
4. declara relación, timing, evento, nivel y condición;
5. no ejecuta red;
6. no oculta un proceso empresarial completo;
7. demuestra terminación y ausencia de doble efecto;
8. conserva comportamiento ante bulk, replay y concurrencia.

Una función trigger sin asociación válida queda bloqueada hasta su disposición de drift, compatibilidad o retiro.

---

#### 17. Caso reconciliado VISO

La función:

```text
public.viso_enforce_monthly_schedule_publish_limit()
```

tiene una disposición de transición ya definida:

```text
MOVER
→ DISP::MOVE::VISO_MONTHLY_LIMIT_GUARD
```

Su efecto deberá conservarse únicamente dentro de una frontera interna gobernada.

Sin embargo, la migración que la introdujo declara la regla de 186 horas como provisional y pendiente de aprobación canónica.

Por tanto:

```text
DESTINO ESTRUCTURAL
= MOVER

APROBACIÓN PARA CONSERVAR SECURITY DEFINER
= BLOCKED_PENDING_EVIDENCE
```

hasta que la regla empresarial, owner, excepción, autorización, alcance, pruebas y transición estén aprobados.

Esta tarea no legitima la regla provisional por el hecho de que exista físicamente.

---

#### 18. Frontera con grants

`AUTH-DB-003` endurece la identidad y ejecución privilegiada, pero no absorbe los cambios de grants.

```text
AUTH-DB-003
→ modo de seguridad
→ necesidad de excepción
→ owner objetivo
→ search_path
→ dependencias
→ autorización interna
→ disposición

AUTH-DB-004
→ grants innecesarios de authenticated

AUTH-DB-005
→ grants innecesarios de anon
```

La futura materialización puede depender de que esas tareas completen la audiencia efectiva. No deberá simular su resultado mediante cambios fuera de alcance.

---

#### 19. Manifiesto de endurecimiento

Antes de modificar una firma, la instancia física deberá materializar o derivar un registro verificable con:

```text
qualified_signature
product_boundary
current_security_mode
current_owner
current_owner_attributes
current_search_path
current_execute_audiences
current_row_security_config
trigger_associations
current_definition_hash
canonical_disposition
exception_class
target_location
target_security_mode
target_owner_contract
authorization_contract
grant_contract_reference
dependencies
read_set
write_set
migration_reference
rollback
evidence
```

Ninguna firma puede modificarse sin identidad y disposición inequívocas.

---

#### 20. Migración física posterior

La futura instancia:

```text
AUTH-DB-003::GLOBAL
```

deberá:

1. reconciliar el universo real antes del cambio;
2. fallar ante drift no clasificado;
3. excluir la frontera VITAL;
4. crear una migración forward versionada;
5. no reescribir migraciones históricas;
6. aplicar únicamente firmas con disposición suficiente;
7. preservar compatibilidad solo cuando exista contrato;
8. ejecutar pruebas negativas y positivas;
9. demostrar que no aparece una nueva función privilegiada sin registro;
10. conservar rollback y evidencia.

Una firma sin evidencia suficiente permanece sin promoción y no se normaliza por inferencia.

---

#### 21. Pruebas negativas mínimas

La futura validación incluirá, según aplique:

1. caller no autorizado invocando directamente la función;
2. `anon` frente a función no pública;
3. `authenticated` sin identidad empresarial vigente;
4. actor fuera de sede, área o recurso;
5. parámetros que intentan seleccionar otro actor;
6. metadata autoadministrable manipulada;
7. objeto homónimo en schema no confiable;
8. SQL dinámico o identificador fuera de allowlist;
9. replay de comando;
10. llamadas concurrentes;
11. acceso a recurso que RLS denegaría al actor;
12. función trigger llamada como RPC;
13. trigger huérfano o duplicado;
14. dependencia nueva no inventariada;
15. owner con privilegio excedente;
16. función nueva `SECURITY DEFINER` sin registro.

Los casos positivos deberán demostrar que el actor autorizado conserva la operación mínima necesaria.

---

#### 22. Rollback seguro

El rollback no puede restaurar silenciosamente una elevación ya clasificada como insegura.

Orden preferente:

```text
CORRECCIÓN FORWARD
→ RESTAURAR CONTRATO SEGURO
→ DESHABILITAR CAPACIDAD
→ REVERTIR SOLO A ESTADO ANTERIOR QUE SIGA CUMPLIENDO EL CONTRATO
```

Toda reversión conservará migración, hash, motivo, owner, consumidores, evidencia y validación posterior.

---

#### 23. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Justificación:** la política `SECURITY DEFINER`, sus clases de excepción, owner, privilegio mínimo, autorización interna, `search_path`, SQL dinámico, triggers, compatibilidad, drift y pruebas ya están protegidos por requisitos canónicos vigentes. El drift VISO posterior también está reconciliado en el registro. Esta tarea materializa el contrato de contención sin crear una regla protegida nueva.

---

#### 24. Cobertura de prueba vigente reutilizada

La cobertura existente incluye:

- `TREQ-SUPABASE-005`;
- `TREQ-SUPABASE-007`;
- `TREQ-SUPABASE-008`;
- `TREQ-SUPABASE-1005` a `TREQ-SUPABASE-1046`;
- `TREQ-SUPABASE-1760`.

Estos identificadores se reutilizan como trazabilidad. Esta tarea no modifica sus filas ni su estado.

---

#### 25. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                        |
| --------- | -------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | pendiente de materialización documental en el checkout de la tarea                                                               |
| LOCAL     | NOT_EXECUTED   | pendiente de preflight, quality, delivery y validadores del repositorio                                                          |
| REMOTA    | PASS           | inventario `SECURITY DEFINER` contrastado en modo read-only; drift VISO identificado y reconciliado con migración y 04A vigentes |
| OPERATIVA | NOT_APPLICABLE | la tarea documental no cambia flujos ni ejecuta funciones                                                                        |
| FÍSICA    | NOT_APPLICABLE | `AUTH-DB-003::GLOBAL` permanece sin autorización física                                                                          |

---

#### 26. Decisiones vinculantes

1. `SECURITY INVOKER` es el modo predeterminado.
2. `SECURITY DEFINER` requiere excepción individual.
3. Existen exactamente siete clases de excepción.
4. Existen exactamente siete clases de disposición.
5. La futura instancia es `AUTH-DB-003::GLOBAL`.
6. Su modo es `GLOBAL_ENABLE_ONCE`.
7. Su gate es `PRE_E5_FOUNDATION`.
8. El universo remoto auditado vigente contiene 211 funciones `SECURITY DEFINER`.
9. Cinco pertenecen a la frontera VITAL y no forman parte del alcance físico Vento OS.
10. El universo Vento OS de contención es 206 funciones `SECURITY DEFINER`.
11. La cardinalidad se reconcilia nuevamente antes de cualquier migración.
12. Ninguna función se modifica por su nombre o modo de seguridad aislado.
13. Una función sin disposición suficiente queda `BLOCKED_PENDING_EVIDENCE`.
14. Una función que conserve elevación usa owner técnico dedicado `NOLOGIN`.
15. El owner objetivo no tiene `SUPERUSER` ni `BYPASSRLS`.
16. `postgres` no es owner objetivo de funciones privilegiadas Vento.
17. Toda función privilegiada aplica autorización interna server-side.
18. RLS y `SECURITY DEFINER` son controles separados.
19. `search_path` es explícito, mínimo y no controlable por caller.
20. Las dependencias empresariales se califican e inventarían.
21. SQL dinámico queda prohibido por defecto.
22. Una función trigger privilegiada no es RPC.
23. `public.viso_enforce_monthly_schedule_publish_limit()` conserva destino estructural `MOVER`.
24. Su permanencia como `SECURITY DEFINER` queda bloqueada hasta evidencia completa.
25. `AUTH-DB-004` conserva grants de `authenticated`.
26. `AUTH-DB-005` conserva grants de `anon`.
27. VITAL no se modifica por esta tarea.
28. Toda corrección se realiza mediante migración forward.
29. No se crea ni modifica ningún requisito de prueba.
30. La aprobación documental no autoriza cambios en Supabase.

---

#### 27. Criterios de aceptación

`AUTH-DB-003` queda documentalmente completa cuando:

- el modo predeterminado sea `SECURITY INVOKER`;
- las siete clases de excepción estén preservadas;
- las siete disposiciones estén preservadas;
- la cardinalidad histórica y el drift vigente estén reconciliados;
- VITAL permanezca fuera del alcance físico;
- el nuevo guard VISO tenga destino explícito sin convertir su regla provisional en aprobación;
- owner, `BYPASSRLS`, `search_path`, dependencias y autorización interna tengan reglas cerradas;
- grants permanezcan en sus tareas propietarias;
- exista manifiesto mínimo por firma;
- existan pruebas negativas y positivas definidas;
- el rollback no pueda reabrir privilegio inseguro por omisión;
- la futura instancia quede identificada como `AUTH-DB-003::GLOBAL`;
- no exista autorización física implícita;
- no exista cambio 04A.

---

#### 28. Límites

`AUTH-DB-003` no:

- ejecuta SQL;
- crea migraciones;
- modifica funciones remotas;
- cambia owners;
- crea roles;
- cambia memberships;
- cambia grants;
- cambia policies RLS;
- cambia `FORCE ROW LEVEL SECURITY`;
- modifica Edge Functions;
- modifica VITAL;
- aprueba reglas empresariales provisionales;
- modifica consumidores;
- retira funciones;
- crea wrappers;
- mueve objetos;
- ejecuta cutover;
- modifica 04A;
- autoriza `AUTH-DB-003::GLOBAL`;
- desarrolla `AUTH-DB-004`.

---

#### 29. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-DB-002 — Endurecer políticas RLS demasiado amplias aprobadas para corrección`

**TAREA ACTUAL APROBADA**
`AUTH-DB-003 — Endurecer funciones SECURITY DEFINER aprobadas`

**SIGUIENTE TAREA RESERVADA**
`AUTH-DB-004 — Reducir grants innecesarios de authenticated`


### ✅ AUTH-DB-004 — Reducir grants innecesarios de authenticated

**Estado:** APROBADA
**Tarea anterior:** AUTH-DB-003 — Endurecer funciones SECURITY DEFINER aprobadas
**Tarea siguiente:** AUTH-DB-005 — Revocar grants innecesarios de anon
**Tipo de tarea:** Documental
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/01_R0_PREPARACION_PRUEBAS_Y_CONTENCION_DE_RIESGOS.md`
**Estado físico resultante:** Contrato de reducción de privilegios de `authenticated` cerrado; futura instancia global `AUTH-DB-004::GLOBAL` pendiente de autorización explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`AUTH-DB-004` define el contrato único de contención y reducción de privilegios PostgreSQL concedidos al rol técnico `authenticated` dentro de las superficies gobernadas por Vento OS.

La tarea separa cuatro conceptos que no pueden confundirse:

```text
AUTENTICADO EN SUPABASE
≠
AUTORIZADO EMPRESARIALMENTE

PRIVILEGIO DE SCHEMA
≠
PRIVILEGIO DE OBJETO

PRIVILEGIO DE OBJETO
≠
AUTORIZACIÓN DE FILA O RECURSO

ESTADO LEGACY FUNCIONAL
≠
CONTRATO OBJETIVO APROBADO
```

El objetivo no es ejecutar un `REVOKE` indiscriminado. El objetivo es impedir que `authenticated` conserve o herede privilegios superiores a los estrictamente necesarios para contratos aprobados, sin romper consumidores vigentes por inferencia y sin sustituir RLS, autorización empresarial, compatibilidad o transición.

---

#### 2. Resultado canónico

Queda definido el siguiente modelo:

```text
SUPA-ARC-015
→ autoridad normativa de exposición, grants y RLS

SUPA-ARC-016
→ autoridad de contratos READ_VIEW, QUERY_RPC y COMMAND_RPC

AUTH-DB-002
→ endurecimiento de policies RLS

AUTH-DB-003
→ endurecimiento de SECURITY DEFINER

AUTH-DB-004
→ reducción de privilegios de authenticated

AUTH-DB-005
→ reducción de privilegios de anon

AUTH-DB-004::GLOBAL
→ única futura materialización física de esta contención
```

La tarea protege mínimo privilegio sin convertir `authenticated` en una representación de empleado, rol operativo, sede, área, permiso o capacidad empresarial.

---

#### 3. Topología y gate

La reconciliación vigente de R0 establece:

```text
mode = GLOBAL_ENABLE_ONCE
execution_gate = PRE_E5_FOUNDATION
instance = AUTH-DB-004::GLOBAL
```

Consecuencias:

1. existe una sola instancia física global;
2. no se crea una instancia por paquete;
3. la contención debe estar disponible antes de paquetes E5 que modifiquen Supabase;
4. la aprobación documental no autoriza la instancia física;
5. cualquier cambio físico exige autorización humana explícita, migración forward, pruebas y rollback;
6. la materialización no puede invadir trabajo reservado a `AUTH-DB-005` ni a paquetes E5.

---

#### 4. Fuentes vinculantes y precedencia

La definición consume y preserva:

- `SUPA-AUD-003`, para exposición Data API observada;
- `SUPA-AUD-006` y `SUPA-AUD-007`, para funciones, modos de seguridad y ejecución efectiva;
- `SUPA-AUD-009`, para grants, RLS, policies y privilegios efectivos;
- `SUPA-ARC-014`, para excepciones `SECURITY DEFINER`;
- `SUPA-ARC-015`, para exposición, grants, default privileges, RLS y roles de ejecución;
- `SUPA-ARC-016`, para `READ_VIEW`, `QUERY_RPC` y `COMMAND_RPC`;
- `SUPA-TRANS-*`, para consumidores, compatibilidad, movimiento, retiro y drift;
- el Registro Canónico de Requisitos de Prueba vigente;
- el estado remoto verificable, exclusivamente como línea base física.

Precedencia:

```text
CONTRATO OBJETIVO
→ define el mínimo permitido

CONSUMIDORES Y COMPATIBILIDAD
→ determinan qué puede reducirse sin ruptura

ESTADO REMOTO
→ demuestra privilegio actual

AUTH-DB-004
→ contiene y reduce sin inventar autorización ni destino
```

La existencia histórica de un grant no lo convierte en contrato objetivo.

---

#### 5. Definición de grant innecesario

Para esta tarea, un privilegio de `authenticated` es innecesario cuando se cumple al menos una de estas condiciones:

1. no existe contrato aprobado que requiera esa operación;
2. el objeto es privado, técnico o autoritativo y no debe ser alcanzado directamente por cliente;
3. el grant permite más operaciones que las requeridas;
4. el grant expone más columnas que las necesarias;
5. el acceso debe realizarse mediante `READ_VIEW`, `QUERY_RPC` o `COMMAND_RPC`;
6. el privilegio existe únicamente por default privilege amplio;
7. la misma capacidad puede satisfacerse mediante un contrato más estrecho ya aprobado;
8. el objeto carece de owner, consumidor, finalidad, sensibilidad o compatibilidad suficientes para justificar exposición;
9. la audiencia `authenticated` se está usando como sustituto de permiso empresarial;
10. el grant de dependencia excede lo estrictamente requerido por una vista `security_invoker`.

La ausencia de una referencia encontrada no demuestra por sí sola que un privilegio pueda retirarse. Ante evidencia incompleta, la disposición es `BLOCKED_PENDING_EVIDENCE`.

---

#### 6. Línea base remota vigente

La observación read-only vigente del proyecto muestra que el schema objetivo `api` todavía no está materializado físicamente.

Para las superficies Vento OS actualmente presentes y separando VITAL como frontera independiente:

```text
api_schema_exists = false

objetos relación/vista observados = 325
authenticated con SELECT efectivo = 303
authenticated con INSERT efectivo = 280
authenticated con UPDATE efectivo = 277
authenticated con DELETE efectivo = 275

funciones observadas = 301
authenticated con EXECUTE efectivo = 209

secuencias observadas = 2
authenticated con USAGE efectivo = 2
authenticated con SELECT efectivo = 2
authenticated con UPDATE efectivo = 2
```

Estos conteos describen el estado remoto actual. No significan que todas las operaciones sean utilizables, necesarias, seguras o aprobadas.

---

#### 7. Reconciliación por schema físico vigente

La línea base Vento OS observada queda resumida así:

| Schema        | Objetos relación/vista | `SELECT` | `INSERT` | `UPDATE` | `DELETE` | Decisión objetivo de frontera                            |
| ------------- | ---------------------: | -------: | -------: | -------: | -------: | -------------------------------------------------------- |
| `app_private` |                      1 |        0 |        0 |        0 |        0 | conservar acceso cliente directo en cero                 |
| `club`        |                     11 |        8 |        0 |        0 |        0 | owner schema no expuesto directamente                    |
| `pass`        |                     27 |       23 |       21 |       21 |       21 | retirar DML directo objetivo; transición por contrato    |
| `payments`    |                      2 |        1 |        0 |        0 |        0 | owner schema no expuesto directamente                    |
| `pos`         |                     13 |       13 |       13 |       13 |       13 | retirar DML directo objetivo; transición por contrato    |
| `public`      |                    246 |      245 |      242 |      241 |      241 | compatibilidad legacy congelada y clasificada por objeto |
| `talento`     |                     13 |       13 |        4 |        2 |        0 | owner schema no expuesto directamente                    |
| `viso`        |                     12 |        0 |        0 |        0 |        0 | conservar acceso cliente directo en cero                 |
| **Total**     |                **325** |  **303** |  **280** |  **277** |  **275** | reducción individual y fail-closed                       |

La tabla no asigna automáticamente una disposición de retiro a cada objeto. El privilegio efectivo observado es el universo de reconciliación, no una lista de grants aprobados.

---

#### 8. Funciones y secuencias

La misma observación física registra:

| Schema        | Funciones | `EXECUTE` efectivo de `authenticated` |
| ------------- | --------: | ------------------------------------: |
| `app_private` |         1 |                                     0 |
| `club`        |         7 |                                     7 |
| `pass`        |        30 |                                    13 |
| `public`      |       247 |                                   174 |
| `talento`     |        16 |                                    15 |
| `payments`    |         0 |                                     0 |
| `pos`         |         0 |                                     0 |
| `viso`        |         0 |                                     0 |
| **Total**     |   **301** |                               **209** |

Además, existen dos secuencias Vento OS observadas en `public`; `authenticated` conserva sobre ambas `USAGE`, `SELECT` y `UPDATE` efectivos.

Reglas:

1. `EXECUTE` pertenece a esta tarea solo como grant de audiencia;
2. el modo `SECURITY DEFINER` o `SECURITY INVOKER` pertenece a `AUTH-DB-003`;
3. una función no se conserva ejecutable por `authenticated` solo porque sea invocable hoy;
4. una secuencia no se expone a roles cliente en el objetivo;
5. un contrato que necesite numeración o identidad deberá ocultar la secuencia detrás de la frontera propietaria correspondiente.

---

#### 9. Frontera VITAL

VITAL permanece como producto y frontera separada.

La observación remota registra para `vital`:

```text
54 objetos relación/vista
54 con SELECT efectivo para authenticated
54 con INSERT efectivo
54 con UPDATE efectivo
54 con DELETE efectivo

47 funciones
46 con EXECUTE efectivo para authenticated
```

`AUTH-DB-004::GLOBAL` no modifica esos privilegios.

La presencia de VITAL en el mismo proyecto físico no transfiere su gobierno a Vento OS. Cualquier reducción sobre esa frontera requiere su autoridad propietaria correspondiente.

---

#### 10. Frontera con schemas administrados

Los schemas administrados por Supabase, PostgreSQL o extensiones no se convierten en objetos Vento por compartir roles técnicos.

Por tanto:

1. `auth`, `storage`, `realtime`, `graphql`, `graphql_public`, `extensions`, `net`, `cron`, `vault` y demás superficies administradas conservan sus contratos soportados;
2. esta tarea no revoca privilegios de plataforma por inferencia;
3. defaults creados por roles administrados no se alteran sin demostrar que la modificación es soportada y propiedad de Vento;
4. el endurecimiento de `public` separará defaults y grants gobernados por Vento de defaults que pertenezcan a la plataforma;
5. una configuración administrada amplia no se copia como patrón empresarial.

---

#### 11. Topología objetivo de acceso de `authenticated`

El estado objetivo es:

```text
authenticated
        ↓
schema api
        ↓
USAGE explícito
        ↓
READ_VIEW      → SELECT explícito
QUERY_RPC      → EXECUTE explícito
COMMAND_RPC    → EXECUTE explícito
        ↓
RLS / autorización / dependencias mínimas
        ↓
owner schemas privados
```

Invariantes:

1. `api` será la única superficie Data API empresarial objetivo;
2. `authenticated` no tendrá `CREATE` sobre schemas empresariales;
3. los owner schemas no serán exposición directa;
4. `app_private` y `audit` permanecerán sin acceso cliente directo;
5. `public` continuará únicamente como compatibilidad transitoria congelada;
6. autenticarse no concede permiso empresarial;
7. toda capacidad resolverá principal, sesión, identidad, actor, permiso, scope, territorio, recurso y precondiciones.

La ausencia física actual de `api` impide interpretar este objetivo como autorización para revocar masivamente los contratos legacy todavía consumidos.

---

#### 12. DML directo sobre tablas autoritativas

El objetivo para `authenticated` es:

```text
INSERT directo en tablas autoritativas = 0
UPDATE directo en tablas autoritativas = 0
DELETE directo en tablas autoritativas = 0
```

Las mutaciones empresariales cliente convergerán en `COMMAND_RPC`.

Consecuencias:

1. un grant DML actual debe recibir disposición individual;
2. un grant no se conserva por comodidad del SDK;
3. una policy RLS correcta no justifica DML directo cuando el contrato objetivo es comando;
4. una mutación que deba atravesar invariantes, idempotencia, auditoría o coordinación no queda expuesta como tabla;
5. una tabla legacy con consumidores vigentes puede permanecer temporalmente accesible solo bajo compatibilidad registrada, congelada y con salida definida.

---

#### 13. Lecturas y grants de dependencia

`authenticated` no obtiene `SELECT` directo sobre owner tables como regla general.

Una excepción de dependencia para una `READ_VIEW security_invoker` solo puede existir cuando simultáneamente:

1. el owner schema permanece fuera de Data API;
2. RLS está habilitado y probado en las tablas alcanzables;
3. `USAGE` de schema y `SELECT` se limitan a lo estrictamente necesario;
4. se prefieren grants de columnas cuando la proyección no necesita la fila completa;
5. no se concede DML;
6. no se concede acceso a secuencias;
7. la vista enumera columnas explícitas;
8. la vista aplica filtros contractuales;
9. sensibilidad, inferencia y enumeración lateral están probadas;
10. se evaluó si un `QUERY_RPC` o puente privilegiado sería una frontera más segura.

Si cualquiera de esas condiciones falta, el grant de dependencia no queda aprobado.

---

#### 14. Default privileges

La línea base remota muestra defaults amplios aplicables a `authenticated`, incluido el rol creador `postgres` dentro de `public` para relaciones, funciones y secuencias.

Eso constituye una fuente de reintroducción automática de privilegios aunque los objetos existentes se endurezcan uno por uno.

La política queda cerrada así:

1. los roles creadores gobernados por Vento tendrán default privileges explícitos y restrictivos;
2. ningún objeto Vento nuevo heredará acceso de `authenticated` por default;
3. tablas y vistas nuevas nacerán sin privilegio runtime;
4. funciones nuevas nacerán sin `EXECUTE` de `authenticated`;
5. secuencias nuevas nacerán sin `USAGE`, `SELECT` ni `UPDATE` de `authenticated`;
6. el acceso se concede después de aprobar el contrato específico;
7. defaults administrados por plataforma se clasifican por separado y no se modifican por inferencia;
8. cualquier default privilege que reintroduzca acceso constituye drift bloqueante.

La futura materialización deberá contener primero la creación de exposición nueva antes de intentar una limpieza amplia del inventario histórico.

---

#### 15. Ocho disposiciones obligatorias

Cada privilegio actual de `authenticated` dentro del universo Vento OS deberá terminar exactamente en una de estas disposiciones canónicas:

| Disposición                     | Resultado                                                                 |
| ------------------------------- | ------------------------------------------------------------------------- |
| `KEEP_AND_HARDEN`               | se conserva únicamente el mínimo exigido por un contrato válido           |
| `MOVE_TO_API`                   | la capacidad migra a un contrato expuesto en `api`                        |
| `NARROW_PRIVILEGES`             | el objeto permanece, pero se reducen operaciones, columnas o dependencias |
| `REPLACE_WITH_COMMAND_OR_QUERY` | el acceso directo se sustituye por RPC o contrato de consulta             |
| `PRIVATE_ONLY`                  | el objeto queda fuera de roles cliente                                    |
| `TRANSITIONAL_COMPATIBILITY`    | el grant legacy permanece temporalmente con sucesor y salida              |
| `RETIRE`                        | el grant se elimina después de demostrar que ya no existe consumo válido  |
| `BLOCKED_PENDING_EVIDENCE`      | no puede mantenerse, ampliar ni retirar hasta resolver evidencia faltante |

No existe una disposición implícita `KEEP_BECAUSE_IT_WORKS`.

---

#### 16. Reglas de clasificación por superficie

La decisión individual seguirá estas reglas:

| Superficie actual                          | Regla de clasificación                                                                                                                |
| ------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------- |
| `app_private`                              | `PRIVATE_ONLY`; cualquier grant cliente nuevo bloquea                                                                                 |
| `viso` sin grants cliente actuales         | conservar cero acceso directo                                                                                                         |
| owner schemas con DML cliente              | `MOVE_TO_API`, `REPLACE_WITH_COMMAND_OR_QUERY`, `TRANSITIONAL_COMPATIBILITY` o `BLOCKED_PENDING_EVIDENCE`; nunca DML directo objetivo |
| owner schemas con lectura cliente          | evaluar dependencia estrecha, `MOVE_TO_API`, `NARROW_PRIVILEGES`, `PRIVATE_ONLY` o transición                                         |
| `public`                                   | congelar expansión y decidir por objeto; no preservar por pertenecer al schema                                                        |
| funciones                                  | conservar `EXECUTE` solo para contrato y audiencia aprobados                                                                          |
| secuencias                                 | acceso cliente objetivo cero                                                                                                          |
| schemas privados                           | `USAGE` cliente objetivo cero salvo dependencia estricta aprobada                                                                     |
| objetos sin owner o consumidor demostrable | `BLOCKED_PENDING_EVIDENCE`                                                                                                            |

La clasificación usa identidad calificada de objeto y no solo nombre simple.

---

#### 17. Compatibilidad y protección contra ruptura

Como `api` todavía no existe físicamente, la reducción debe preservar consumidores vigentes hasta disponer de sucesor seguro.

Un grant legacy solo puede conservarse como `TRANSITIONAL_COMPATIBILITY` cuando registra:

- objeto y privilegio exactos;
- consumidor;
- finalidad;
- owner;
- sensibilidad;
- contrato sucesor;
- telemetría;
- versión o cohorte;
- fecha o condición de revisión;
- condición de salida;
- rollback.

Reglas:

1. no se amplían operaciones durante la transición;
2. no se incorporan consumidores nuevos;
3. no se agregan columnas por conveniencia;
4. no se interpreta una búsqueda de código sin resultados como cero consumo;
5. la reducción no se ejecuta hasta que el reemplazo esté disponible cuando exista dependencia activa;
6. una compatibilidad sin sucesor o evidencia permanece bloqueada.

---

#### 18. Frontera con RLS

`AUTH-DB-002` y `AUTH-DB-004` resuelven controles diferentes.

```text
AUTH-DB-002
→ quién puede alcanzar qué filas y bajo qué predicate

AUTH-DB-004
→ qué privilegio PostgreSQL posee authenticated sobre schema/objeto
```

Por tanto:

1. RLS no crea un `GRANT`;
2. un `GRANT` no desactiva RLS;
3. una policy restrictiva no justifica un privilegio de objeto innecesario;
4. retirar un grant no corrige una policy defectuosa;
5. las pruebas deben identificar si la denegación procede de schema, objeto, RLS o autorización empresarial;
6. esta tarea no reescribe policies para hacer cuadrar una reducción de ACL.

---

#### 19. Frontera con `SECURITY DEFINER`

`AUTH-DB-003` conserva la autoridad sobre necesidad de elevación, owner técnico, `search_path`, autorización interna y modo de seguridad.

`AUTH-DB-004` decide únicamente si `authenticated` debe tener `EXECUTE`.

Consecuencias:

1. una función `SECURITY DEFINER` aprobada no queda automáticamente ejecutable por `authenticated`;
2. una función `SECURITY INVOKER` tampoco recibe `EXECUTE` por defecto;
3. `EXECUTE` se concede por contrato y audiencia;
4. una función de trigger no necesita `EXECUTE` cliente por ser consumida por un trigger;
5. la reducción de `EXECUTE` no puede cambiar el cuerpo o modo de seguridad como efecto lateral.

---

#### 20. Frontera con `anon`

`AUTH-DB-005` es propietaria de la reducción de grants innecesarios de `anon`.

Esta tarea:

- no usa cambios sobre `anon` para hacer pasar validaciones de `authenticated`;
- no revoca grants de `anon`;
- no modifica policies dirigidas a `anon`;
- no altera contratos públicos;
- sí registra dependencias cuando un mismo objeto tiene audiencias múltiples para evitar decisiones contradictorias posteriores.

El cierre de `AUTH-DB-004` entrega a `AUTH-DB-005` una superficie `authenticated` clasificada sin anticipar su decisión.

---

#### 21. Manifiesto obligatorio de la futura instancia

Antes de modificar un privilegio, `AUTH-DB-004::GLOBAL` deberá derivar un inventario completo por identidad con, como mínimo:

```text
qualified_object_identity
object_kind
product_boundary
schema_exposure_state
object_owner
current_schema_privileges
current_object_privileges
current_column_privileges
current_effective_privileges
privilege_origin
default_privilege_origin
role_membership_origin
rls_protection_class
consumer_repositories
consumer_applications
contract_kind
business_owner
technical_owner
sensitivity
canonical_disposition
target_schema
target_operations
target_columns
dependency_grants
successor_contract
compatibility_state
review_or_exit_gate
migration_reference
definition_or_acl_hash
rollback
evidence
```

Reglas de completitud:

1. toda identidad alcanzable por `authenticated` aparece exactamente una vez;
2. todo privilegio efectivo tiene origen explicable;
3. se distinguen grants directos, membresías, defaults y dependencias;
4. VITAL queda marcado y excluido del cambio;
5. superficies administradas quedan marcadas y fuera de cambios inferidos;
6. ninguna fila queda sin disposición;
7. las cardinalidades se recalculan inmediatamente antes de materializar.

---

#### 22. Estrategia de materialización física posterior

La futura instancia global seguirá una transición por seguridad, no por cantidad:

```text
1. RECONCILIAR ESTADO REAL
2. CLASIFICAR TODA IDENTIDAD
3. CONTENER DEFAULT PRIVILEGES VENTO
4. PRESERVAR COMPATIBILIDADES ACTIVAS SIN AMPLIARLAS
5. REVOCAR SOLO PRIVILEGIOS CON DISPOSICIÓN EJECUTABLE
6. CONCEDER ÚNICAMENTE MÍNIMOS EXPLÍCITOS
7. PROBAR CAPACIDADES POSITIVAS Y DENEGACIONES
8. RECONCILIAR DRIFT
```

La materialización:

- usa migración forward versionada;
- no reescribe migraciones históricas;
- no crea el schema `api` por inferencia si su creación pertenece a otra unidad;
- no corta un consumidor antes de disponer de sucesor;
- no mantiene un grant amplio para evitar diseñar autorización;
- no toca VITAL;
- no altera defaults de plataforma sin contrato soportado;
- falla cerrado ante drift no clasificado.

---

#### 23. Pruebas positivas y negativas

La futura instancia deberá demostrar, según aplique:

1. un actor válido conserva el contrato mínimo que necesita;
2. `authenticated` sin autorización empresarial no obtiene acceso por estar autenticado;
3. DML directo sobre tabla autoritativa queda denegado en el estado objetivo;
4. lectura directa de owner table queda denegada salvo dependencia explícita aprobada;
5. columnas sensibles fuera del contrato no son accesibles;
6. acceso cruzado entre actor, sede, área o recurso falla cerrado;
7. `app_private` permanece inaccesible directamente;
8. `viso` no adquiere grants cliente por drift;
9. secuencias no son utilizables por cliente;
10. una función no aprobada no conserva `EXECUTE`;
11. una membership no reintroduce un privilegio retirado;
12. un default privilege no concede acceso a un objeto nuevo;
13. una compatibilidad solo funciona dentro de su ventana y contrato;
14. un objeto nuevo sin manifiesto bloquea;
15. el rollback no reabre privilegios amplios;
16. la ausencia física de `api` no provoca una revocación destructiva de consumidores legacy.

---

#### 24. Rollback seguro

El rollback no significa restaurar todos los ACL históricos.

Orden preferente:

```text
CORRECCIÓN FORWARD
→ RESTAURAR ÚNICAMENTE EL PRIVILEGIO MÍNIMO CONTRACTUAL
→ REACTIVAR COMPATIBILIDAD ACOTADA SI EXISTÍA
→ DESHABILITAR TEMPORALMENTE LA CAPACIDAD
→ NUNCA REABRIR GRANTS GLOBALES POR CONVENIENCIA
```

Toda reversión conservará:

- objeto;
- privilegio exacto;
- consumidor;
- motivo;
- duración;
- owner;
- migración;
- evidencia;
- prueba posterior.

Si recuperar una capacidad exige volver a un grant no autorizado, el rollback falla cerrado y la capacidad permanece bloqueada hasta una corrección segura.

---

#### 25. Drift y control recurrente

El control recurrente comparará:

```text
schemas configurados
+ USAGE y CREATE
+ ACL de objetos
+ column grants
+ secuencias
+ EXECUTE
+ default privileges
+ memberships
+ RLS y clase de protección
+ contrato expuesto
+ consumidores
+ disposición
+ hashes
+ paridad ambiental
```

Generan drift bloqueante:

- nuevo grant de `authenticated` sin contrato;
- nuevo default privilege amplio;
- nueva secuencia accesible;
- nuevo DML directo en owner table;
- `CREATE` runtime;
- `USAGE` sobre schema privado sin dependencia;
- `EXECUTE` nuevo no registrado;
- ampliación de columnas;
- membership que reintroduce acceso;
- compatibilidad expirada;
- diferencia entre manifiesto, migraciones y remoto.

---

#### 26. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Justificación:** la arquitectura canónica de exposición, grants, default privileges, RLS, contratos `api`, acceso directo, secuencias, funciones, compatibilidad y drift ya tiene cobertura específica vigente. Esta tarea convierte esa política en contrato de contención para `authenticated` sin introducir una regla observable nueva.

---

#### 27. Cobertura de prueba vigente reutilizada

Se reutiliza, sin modificarla, la cobertura canónica existente, especialmente:

- `TREQ-SUPABASE-1047` a `TREQ-SUPABASE-1090`;
- `TREQ-SUPABASE-1095`;
- `TREQ-SUPABASE-1096`;
- `TREQ-SUPABASE-1101`;
- `TREQ-SUPABASE-1108`;
- `TREQ-SUPABASE-1140`;
- `TREQ-SUPABASE-1671`.

Estos identificadores se registran únicamente como trazabilidad de cobertura preexistente.

---

#### 28. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                           |
| --------- | -------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | la definición documental no materializa código ni migraciones                                                                       |
| LOCAL     | NOT_EXECUTED   | pendiente del lifecycle documental y validadores del checkout de la tarea                                                           |
| REMOTA    | PASS           | línea base read-only reconciliada para schemas, objetos, funciones, secuencias, default privileges y memberships de `authenticated` |
| OPERATIVA | NOT_APPLICABLE | no se alteran consumidores, permisos efectivos ni flujos operativos                                                                 |
| FÍSICA    | NOT_APPLICABLE | `AUTH-DB-004::GLOBAL` permanece sin autorización física                                                                             |

---

#### 29. Decisiones vinculantes

1. `authenticated` es audiencia técnica y no autorización empresarial.
2. La futura instancia es `AUTH-DB-004::GLOBAL`.
3. Su modo es `GLOBAL_ENABLE_ONCE`.
4. Su gate es `PRE_E5_FOUNDATION`.
5. `api` es la única superficie Data API empresarial objetivo.
6. `api` no existe físicamente en la línea base remota vigente.
7. La ausencia de `api` impide una revocación masiva que rompa consumidores legacy.
8. El universo Vento OS observado contiene 325 objetos relación/vista para reconciliación.
9. `authenticated` tiene `SELECT` efectivo sobre 303 de ellos.
10. Tiene `INSERT` efectivo sobre 280, `UPDATE` sobre 277 y `DELETE` sobre 275.
11. El universo observado contiene 301 funciones Vento OS.
12. `authenticated` tiene `EXECUTE` efectivo sobre 209.
13. Las dos secuencias Vento OS observadas conservan `USAGE`, `SELECT` y `UPDATE` para `authenticated`.
14. VITAL queda fuera del alcance físico.
15. Los schemas administrados quedan fuera de cambios inferidos.
16. DML cliente directo sobre tablas autoritativas tiene objetivo cero.
17. Acceso cliente a secuencias tiene objetivo cero.
18. `CREATE` runtime sobre schemas empresariales tiene objetivo cero.
19. Los grants de dependencia de vistas invoker son excepciones estrechas y demostradas.
20. Los default privileges de roles creadores Vento deben dejar de conceder acceso automático.
21. Los defaults administrados por plataforma no se cambian por inferencia.
22. Cada privilegio actual recibe una de ocho disposiciones canónicas.
23. La falta de evidencia produce `BLOCKED_PENDING_EVIDENCE`.
24. `public` permanece compatibilidad transitoria congelada, no arquitectura objetivo.
25. `AUTH-DB-002` conserva la autoridad sobre RLS.
26. `AUTH-DB-003` conserva la autoridad sobre modo y endurecimiento `SECURITY DEFINER`.
27. `AUTH-DB-005` conserva la autoridad sobre grants de `anon`.
28. Toda reducción física usa migración forward.
29. El rollback no restaura privilegios globales por defecto.
30. No se crean ni modifican requisitos de prueba.
31. La aprobación documental no autoriza cambios en Supabase.

---

#### 30. Criterios de aceptación

`AUTH-DB-004` queda documentalmente completa cuando:

- `authenticated` queda definido como audiencia técnica y no como autoridad empresarial;
- la topología `GLOBAL_ENABLE_ONCE` y `PRE_E5_FOUNDATION` queda preservada;
- la línea base remota de privilegios queda reconciliada;
- la ausencia física de `api` queda tratada como restricción de transición y no como excusa para mantener grants amplios;
- VITAL y schemas administrados quedan fuera de alcance;
- DML directo, secuencias, `CREATE`, `EXECUTE`, schema `USAGE` y default privileges tienen reglas explícitas;
- las ocho disposiciones canónicas quedan preservadas;
- toda identidad futura exige manifiesto y origen de privilegio;
- se separan RLS, `SECURITY DEFINER` y `anon`;
- se define compatibilidad sin ampliación;
- se define rollback seguro;
- se definen pruebas positivas, negativas y drift;
- `AUTH-DB-004::GLOBAL` queda identificada sin quedar autorizada;
- el Registro Canónico de Requisitos de Prueba permanece sin cambios;
- `AUTH-DB-005` permanece reservada.

---

#### 31. Límites

`AUTH-DB-004` no:

- ejecuta SQL;
- crea migraciones;
- crea el schema `api`;
- revoca grants remotos;
- concede grants nuevos;
- modifica RLS;
- modifica policies;
- cambia funciones;
- cambia `SECURITY DEFINER` o `SECURITY INVOKER`;
- modifica owners;
- crea roles;
- altera memberships administradas;
- modifica default privileges de plataforma por inferencia;
- modifica VITAL;
- modifica Storage, Auth, Realtime, cron o GraphQL administrados;
- retira consumidores;
- ejecuta cutover;
- cambia aplicaciones cliente;
- modifica el registro 04A;
- autoriza `AUTH-DB-004::GLOBAL`;
- desarrolla `AUTH-DB-005`.

---

#### 32. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-DB-003 — Endurecer funciones SECURITY DEFINER aprobadas`

**TAREA ACTUAL APROBADA**
`AUTH-DB-004 — Reducir grants innecesarios de authenticated`

**SIGUIENTE TAREA RESERVADA**
`AUTH-DB-005 — Revocar grants innecesarios de anon`


### ✅ AUTH-DB-005 — Revocar grants innecesarios de anon

**Estado:** APROBADA
**Tarea anterior:** AUTH-DB-004 — Reducir grants innecesarios de authenticated
**Tarea siguiente:** AUTH-DB-016 — Crear esquemas empresariales aprobados
**Tipo de tarea:** Documental
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/01_R0_PREPARACION_PRUEBAS_Y_CONTENCION_DE_RIESGOS.md`
**Estado físico resultante:** Contrato de reducción de privilegios de `anon` cerrado; futura instancia global `AUTH-DB-005::GLOBAL` pendiente de autorización explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`AUTH-DB-005` define el contrato único de contención, clasificación y reducción de privilegios PostgreSQL concedidos al rol técnico `anon` dentro de las superficies gobernadas por Vento OS.

La tarea separa conceptos que no pueden confundirse:

```text
anon EN POSTGRES
= solicitud no autenticada
≠ usuario de Auth anónimo
≠ cliente público aprobado por negocio
≠ autorización empresarial

GRANT DE OBJETO
≠ POLICY RLS
≠ CONTRATO PÚBLICO
≠ CONTROL DE ABUSO

OBJETO LEGACY ACCESIBLE
≠ CONTRATO ANON_PUBLIC APROBADO
```

Un usuario creado mediante autenticación anónima de Supabase continúa utilizando el rol `authenticated`; `anon` queda reservado para solicitudes que no han autenticado un principal.

El objetivo no es ejecutar una revocación masiva. El objetivo es que `anon` alcance únicamente contratos públicos deliberados, mínimos, observables y gobernados, sin conservar privilegios por herencia, defaults, compatibilidad histórica o apariencia nominal del objeto.

---

#### 2. Resultado canónico

Queda definido el siguiente modelo:

```text
SUPA-ARC-015
→ autoridad normativa de exposición, grants, default privileges y RLS

SUPA-ARC-016
→ autoridad de contratos READ_VIEW, QUERY_RPC y COMMAND_RPC

AUTH-DB-002
→ endurecimiento de policies RLS

AUTH-DB-003
→ endurecimiento de SECURITY DEFINER

AUTH-DB-004
→ reducción de privilegios de authenticated

AUTH-DB-005
→ reducción de privilegios de anon

AUTH-DB-005::GLOBAL
→ única futura materialización física de esta contención
```

`AUTH-DB-005` no redefine la arquitectura de exposición. La convierte en un contrato ejecutable de mínimo privilegio para la audiencia no autenticada.

---

#### 3. Topología y gate

La reconciliación vigente de R0 establece:

```text
mode = GLOBAL_ENABLE_ONCE
execution_gate = PRE_E5_FOUNDATION
instance = AUTH-DB-005::GLOBAL
```

Consecuencias:

1. existe una sola instancia física global;
2. no se crea una instancia por paquete;
3. la contención debe existir antes de paquetes E5 que dependan de la superficie pública de Supabase;
4. la aprobación documental no autoriza la instancia física;
5. cualquier cambio físico exige autorización humana explícita, migración forward, pruebas y rollback;
6. la materialización no puede invadir la fundación física de R1 ni crear contratos `api` por inferencia.

---

#### 4. Fuentes vinculantes y precedencia

La definición consume y preserva:

- `SUPA-AUD-003`, para exposición Data API observada;
- `SUPA-AUD-006` y `SUPA-AUD-007`, para funciones, modos de seguridad y ejecución efectiva;
- `SUPA-AUD-009`, para grants, RLS, policies y privilegios efectivos;
- `SUPA-ARC-014`, para excepciones y endurecimiento `SECURITY DEFINER`;
- `SUPA-ARC-015`, para exposición, grants, default privileges, RLS y roles de ejecución;
- `SUPA-ARC-016`, para `READ_VIEW`, `QUERY_RPC` y `COMMAND_RPC`;
- `SUPA-TRANS-*`, para consumidores, compatibilidad, movimiento, retiro y drift;
- `AUTH-DB-004`, como handoff de la clasificación de audiencia autenticada;
- el Registro Canónico de Requisitos de Prueba vigente;
- el estado remoto verificable, exclusivamente como línea base física;
- el comportamiento soportado vigente de Supabase respecto de `anon`, grants, RLS, funciones y Data API.

Precedencia:

```text
CONTRATO OBJETIVO
→ define qué puede ser público

CONSUMIDORES Y COMPATIBILIDAD
→ determinan qué acceso legacy todavía necesita transición

ESTADO REMOTO
→ demuestra privilegio actual

AUTH-DB-005
→ clasifica y contiene sin inventar contratos públicos
```

La existencia histórica de un privilegio no lo convierte en contrato `ANON_PUBLIC`.

---

#### 5. Semántica exacta de `anon`

Para Vento OS, `anon` es una audiencia técnica de PostgreSQL utilizada por solicitudes sin principal autenticado.

Reglas:

1. `anon` no representa un cliente registrado;
2. `anon` no representa un usuario de Supabase Auth autenticado de forma anónima;
3. `anon` no representa un rol empresarial;
4. `anon` no porta por sí mismo sede, área, vínculo laboral, permiso, scope o actor empresarial;
5. un contrato público puede aceptar `anon` únicamente cuando su audiencia canónica sea `ANON_PUBLIC`;
6. un objeto accesible a `anon` sin contrato `ANON_PUBLIC` queda en estado de transición, retiro o bloqueo según evidencia;
7. la clave publicable o legacy anon utilizada para conectar un cliente no constituye autorización de datos;
8. autenticación, grants, RLS, finalidad pública y protección contra abuso permanecen controles separados.

---

#### 6. Definición de grant innecesario

Para esta tarea, un privilegio efectivo de `anon` es innecesario cuando se cumple al menos una de estas condiciones:

1. no existe contrato `ANON_PUBLIC` aprobado que requiera esa operación;
2. el objeto es privado, técnico, autoritativo o sensible y no debe ser alcanzado directamente por una solicitud no autenticada;
3. el grant permite más operaciones que las necesarias para la finalidad pública;
4. el grant expone más columnas o datos que los requeridos;
5. existe DML directo sobre una tabla autoritativa;
6. `EXECUTE` está disponible sin audiencia pública aprobada para la firma exacta;
7. el acceso existe únicamente por default privilege, grant histórico, pertenencia indirecta o compatibilidad no gobernada;
8. una vista pública permite alcanzar fuentes o columnas no declaradas;
9. la capacidad debería residir en un contrato `api` y el acceso actual es solo legacy;
10. no existen owner, consumidor, finalidad, sensibilidad, límites, protección de enumeración, política de errores o condición de salida suficientes;
11. una policy dirigida a `anon` o `PUBLIC` se está interpretando como justificación automática del grant;
12. un nombre aparentemente público se está utilizando como evidencia de publicación.

La ausencia de una referencia encontrada no demuestra que un privilegio pueda retirarse. Ante evidencia insuficiente, la disposición es `BLOCKED_PENDING_EVIDENCE`.

---

#### 7. Línea base remota vigente

La observación read-only vigente del proyecto Vento OS registra, dentro de las superficies Vento incluidas en esta tarea:

```text
objetos relación/vista observados = 325
anon con algún acceso efectivo = 39
anon con SELECT efectivo = 39
anon con INSERT efectivo = 4
anon con UPDATE efectivo = 4
anon con DELETE efectivo = 4

funciones observadas = 301
anon con EXECUTE efectivo = 91
SECURITY DEFINER ejecutables por anon = 43

secuencias observadas = 2
anon con USAGE = 0
anon con SELECT = 0
anon con UPDATE = 0

api_schema_exists = false
```

Estos conteos describen el estado remoto actual. No convierten ningún privilegio en contrato aprobado y deberán recalcularse antes de cualquier materialización.

---

#### 8. Reconciliación por schema físico vigente

La línea base de relaciones y vistas Vento OS queda resumida así:

| Schema        | Objetos relación/vista | `SELECT` de `anon` | `INSERT` | `UPDATE` | `DELETE` | Objetos con algún acceso `anon` |
| ------------- | ---------------------: | -----------------: | -------: | -------: | -------: | ------------------------------: |
| `app_private` |                      1 |                  0 |        0 |        0 |        0 |                               0 |
| `club`        |                     11 |                  0 |        0 |        0 |        0 |                               0 |
| `pass`        |                     27 |                 20 |        4 |        4 |        4 |                              20 |
| `payments`    |                      2 |                  0 |        0 |        0 |        0 |                               0 |
| `pos`         |                     13 |                  0 |        0 |        0 |        0 |                               0 |
| `public`      |                    246 |                 18 |        0 |        0 |        0 |                              18 |
| `talento`     |                     13 |                  1 |        0 |        0 |        0 |                               1 |
| `viso`        |                     12 |                  0 |        0 |        0 |        0 |                               0 |
| **Total**     |                **325** |             **39** |    **4** |    **4** |    **4** |                          **39** |

La tabla es un universo de reconciliación, no una allowlist pública.

---

#### 9. Superficie DML anónima prioritaria

La observación vigente identifica cuatro tablas con `SELECT`, `INSERT`, `UPDATE` y `DELETE` efectivos para `anon`:

```text
pass.loyalty_redemptions
pass.loyalty_transactions
pass.pass_satellites
pass.user_favorites
```

Reglas:

1. las cuatro identidades requieren disposición individual;
2. su DML actual no se declara conforme por existir RLS;
3. la futura materialización no ejecutará una revocación hasta identificar consumidores y sucesor seguro;
4. el objetivo contractual es cero DML directo de `anon` sobre tablas autoritativas;
5. cualquier mutación pública legítima deberá existir mediante contrato expuesto aprobado, con invariantes, autorización aplicable, idempotencia y auditoría según su semántica;
6. el nombre de la tabla no determina si su operación debe ser pública, autenticada o privada.

---

#### 10. Superficie de lectura anónima

Los treinta y nueve objetos accesibles a `anon` se distribuyen así:

```text
pass   = 20
public = 18
talento = 1
```

Dentro de `pass`, dieciséis objetos son de solo lectura efectiva para `anon` y cuatro conservan además DML.

Dentro de `public`, dieciocho objetos conservan `SELECT` efectivo y cero DML observado.

Dentro de `talento`, `talento.vacancies` conserva `SELECT` efectivo y cero DML observado.

Reglas:

1. una lectura pública solo se conserva como estado objetivo si existe un contrato `ANON_PUBLIC` explícito;
2. catálogos, colecciones, tarifas, vacantes, configuración o datos de operación no se clasifican por su nombre;
3. `SELECT` sobre una tabla autoritativa no se mantiene por conveniencia cuando el contrato objetivo exige proyección o consulta;
4. una vista no se declara segura por ocultar físicamente la tabla subyacente;
5. cualquier superficie legacy permitida temporalmente queda congelada y sin expansión.

---

#### 11. Policies y evidencia de RLS sobre la superficie accesible

La misma observación registra sobre los objetos alcanzables por `anon`:

```text
policies observadas = 114
policies con rol anon explícito = 15
policies con rol PUBLIC = 8
objetos alcanzables con alguna policy = 26
vistas public alcanzables sin policy propia = 13
```

Las trece vistas de `public` sin policy propia son:

```text
public.catalog_item_customization_template_assignments
public.catalog_item_customization_template_groups
public.catalog_item_customization_templates
public.catalog_item_option_consumption_rules
public.catalog_item_option_groups
public.catalog_item_option_recipe_effects
public.catalog_item_options
public.catalog_item_presentation
public.catalog_option_visual_assets
public.commercial_categories
public.commercial_collection_categories
public.commercial_collections
public.pass_delivery_distance_rates
```

Reglas:

1. una vista sin policy propia no queda automáticamente desprotegida ni protegida; se revisan modo de seguridad, owner, fuentes, grants y RLS de dependencias;
2. una policy dirigida a `PUBLIC` puede alcanzar `anon`, pero no crea por sí sola un contrato público;
3. una policy dirigida a `anon` no justifica privilegios de objeto mayores que los aprobados;
4. `AUTH-DB-002` conserva propiedad sobre predicates, roles y endurecimiento de policies;
5. `AUTH-DB-005` utiliza esa evidencia exclusivamente para decidir la audiencia efectiva del grant.

---

#### 12. Funciones y `EXECUTE`

La observación vigente registra:

| Schema        | Funciones | `EXECUTE` de `anon` | `SECURITY DEFINER` ejecutables por `anon` |
| ------------- | --------: | ------------------: | ----------------------------------------: |
| `app_private` |         1 |                   0 |                                         0 |
| `club`        |         7 |                   5 |                                         0 |
| `pass`        |        30 |                   5 |                                         2 |
| `public`      |       247 |                  73 |                                        37 |
| `talento`     |        16 |                   8 |                                         4 |
| **Total**     |   **301** |              **91** |                                    **43** |

Reglas:

1. `AUTH-DB-005` decide únicamente si `anon` debe conservar `EXECUTE` sobre una firma exacta;
2. `AUTH-DB-003` conserva autoridad sobre `SECURITY DEFINER`, owner, `search_path`, autorización interna y elevación;
3. una función `SECURITY DEFINER` no queda ejecutable por `anon` por necesitar elevación internamente;
4. una función `SECURITY INVOKER` tampoco recibe `EXECUTE` por defecto;
5. una función trigger no necesita privilegio cliente solo por existir un trigger;
6. funciones públicas legítimas requieren contrato, finalidad, parámetros, retorno, límites, errores y protección contra abuso explícitos;
7. cualquier firma no clasificada permanece `BLOCKED_PENDING_EVIDENCE`.

---

#### 13. Privilegios de schema

La observación vigente registra:

| Schema        | `USAGE` de `anon` | `CREATE` de `anon` |
| ------------- | ----------------- | ------------------ |
| `app_private` | no                | no                 |
| `club`        | no                | no                 |
| `pass`        | sí                | no                 |
| `payments`    | no                | no                 |
| `pos`         | sí                | no                 |
| `public`      | sí                | no                 |
| `talento`     | sí                | no                 |
| `viso`        | no                | no                 |

Invariantes:

1. `CREATE` de `anon` sobre schemas Vento permanece en cero;
2. `USAGE` no concede por sí solo acceso a objetos;
3. `pos` demuestra físicamente esa separación: existe `USAGE` de schema y cero relaciones/vistas alcanzables por `anon` dentro de la superficie observada;
4. `USAGE` sobre un owner schema solo puede mantenerse durante transición cuando sea requisito técnico demostrado de una compatibilidad activa;
5. el objetivo es que la exposición empresarial pública converja en `api`, no en owner schemas.

---

#### 14. Secuencias

Existen dos secuencias Vento OS observadas en `public` y `anon` conserva sobre ellas:

```text
USAGE = 0
SELECT = 0
UPDATE = 0
```

Ese estado constituye la referencia objetivo para roles cliente.

Reglas:

1. `anon` no recibe acceso a secuencias empresariales;
2. identidad, consecutivos y numeración se resuelven en la frontera server-side correspondiente;
3. una migración o default privilege que conceda acceso a secuencias constituye drift bloqueante;
4. la materialización preservará el cero actual y no introducirá grants compensatorios.

---

#### 15. Default privileges y roles administrados

La línea base remota muestra defaults en `public` creados por `supabase_admin` que mencionan `anon` para relaciones, funciones y secuencias.

También se observan relaciones de roles propias de la arquitectura de plataforma, incluida la capacidad de `authenticator` para asumir la audiencia determinada por la solicitud.

Reglas:

1. un default privilege amplio puede reintroducir acceso aunque los objetos existentes se endurezcan individualmente;
2. los roles creadores gobernados por Vento deberán usar defaults explícitos y restrictivos;
3. ningún objeto Vento nuevo dependerá de concesiones automáticas a `anon`;
4. defaults originados en roles administrados por Supabase se clasifican por separado y no se modifican por inferencia;
5. memberships de plataforma no se alteran para resolver un problema de ACL empresarial;
6. la política Vento seguirá siendo explícita aunque la plataforma cambie sus defaults en versiones futuras;
7. cualquier grant necesario se declarará por contrato, no por expectativa del default de plataforma.

---

#### 16. Frontera VITAL

VITAL permanece como producto y frontera separada.

`AUTH-DB-005::GLOBAL` no modifica privilegios de VITAL ni incorpora sus objetos a la cardinalidad Vento OS de esta tarea.

La convivencia en un mismo proyecto físico no transfiere ownership ni autorización. Cualquier reducción sobre VITAL requiere su autoridad propietaria correspondiente.

---

#### 17. Frontera con superficies administradas por Supabase

Los schemas y servicios administrados por Supabase o PostgreSQL no se convierten en objetos empresariales Vento por compartir roles técnicos.

Por tanto:

1. `auth`, `storage`, `realtime`, `graphql`, `graphql_public`, `extensions`, `net`, `cron`, `vault` y demás superficies administradas conservan sus contratos soportados;
2. esta tarea no revoca privilegios de plataforma por inferencia;
3. Auth público, Storage público, webhooks o capacidades administradas se gobiernan por sus contratos propietarios, no por una revocación global de objetos internos;
4. una operación soportada de plataforma puede ser pública sin convertir internals administrados en Data API empresarial;
5. ningún permiso administrado sirve como precedente para exponer owner schemas Vento.

---

#### 18. Topología objetivo de acceso de `anon`

El estado objetivo es:

```text
anon
  ↓
schema api
  ↓
USAGE explícito
  ↓
contrato con audiencia ANON_PUBLIC
  ↓
READ_VIEW  → SELECT explícito
QUERY_RPC  → EXECUTE explícito
COMMAND_RPC → EXECUTE explícito solo cuando la semántica pública esté aprobada
  ↓
finalidad + minimización + límites + RLS/autorización aplicable + control de abuso
  ↓
owner schemas privados
```

Invariantes:

1. `api` será la única superficie Data API empresarial objetivo;
2. `api` no existe físicamente en la línea base vigente;
3. `anon` no tendrá DML directo sobre tablas autoritativas;
4. `anon` no tendrá acceso a secuencias empresariales;
5. `anon` no tendrá `CREATE` sobre schemas Vento;
6. owner schemas no serán una superficie pública objetivo;
7. `public` permanecerá solo como compatibilidad transitoria congelada;
8. una capacidad anónima existe por contrato `ANON_PUBLIC`, no porque una tabla, vista o función sea alcanzable hoy.

La ausencia física actual de `api` impide usar esta tarea como autorización para un corte destructivo de consumidores legacy.

---

#### 19. Contrato `ANON_PUBLIC`

Todo acceso objetivo de `anon` deberá declarar de forma explícita, como mínimo:

```text
contract_id
contract_version
contract_kind
audience = ANON_PUBLIC
public_purpose
business_owner
technical_owner
consumer_or_channel
allowed_operation
allowed_columns_or_return_shape
row_or_resource_scope
sensitivity
volume_and_pagination_policy
abuse_protection_policy
error_disclosure_policy
enumeration_resistance
rls_or_authorization_dependencies
function_security_mode_if_applicable
dependency_grants
telemetry
compatibility_state
review_or_exit_gate
definition_hash
rollback
evidence
```

Reglas:

1. no se inventan límites numéricos en esta tarea; cada contrato propietario los define y prueba;
2. los errores públicos minimizan información y no revelan existencia de recursos protegidos;
3. la finalidad pública no autoriza campos adicionales por conveniencia;
4. el contrato distingue lectura pública de mutación pública;
5. una mutación pública exige la frontera transaccional aprobada y nunca DML directo sobre tabla;
6. la audiencia no se expande de `ANON_PUBLIC` a otros roles por herencia narrativa;
7. toda compatibilidad legacy conserva sucesor o condición de salida verificable.

---

#### 20. DML directo sobre tablas autoritativas

El objetivo para `anon` es:

```text
INSERT directo = 0
UPDATE directo = 0
DELETE directo = 0
```

Consecuencias:

1. las cuatro tablas `pass` actualmente mutables por `anon` requieren transición individual;
2. RLS no convierte DML directo en arquitectura objetivo;
3. una policy permisiva o restrictiva no sustituye invariantes de comando;
4. creación, actualización o eliminación públicas que sean legítimas deberán atravesar `COMMAND_RPC` o una superficie administrada propietaria aprobada;
5. la futura reducción no retirará una capacidad activa antes de disponer de sucesor o decisión explícita de retiro;
6. ningún rollback podrá restaurar DML global por conveniencia.

---

#### 21. Lecturas públicas y minimización

Una lectura anónima puede permanecer únicamente si existe finalidad pública deliberada.

Para cada lectura se demuestra:

1. owner empresarial;
2. consumidor o canal público;
3. finalidad;
4. conjunto explícito de columnas o shape;
5. criterio de filas o recursos;
6. sensibilidad;
7. límites y paginación;
8. protección contra enumeración;
9. manejo de errores;
10. telemetría y abuso;
11. contrato sucesor cuando la identidad actual sea legacy;
12. rollback y condición de salida.

Una tabla de configuración, una sede, un turno, una vacante, un catálogo o una tarifa no recibe clasificación por semántica inferida desde su nombre.

---

#### 22. Protección frente a enumeración, abuso y errores

La exposición anónima exige controles adicionales porque la audiencia no aporta una identidad empresarial autenticada.

Reglas:

1. recursos no públicos no podrán distinguirse mediante diferencias de error, status, timing contractual o shape cuando esa diferencia revele existencia sensible;
2. búsquedas y listados públicos deberán declarar límites, paginación y alcance;
3. endpoints o RPC públicos deberán declarar mecanismo de protección contra abuso apropiado a su contrato;
4. ningún rate limit se presume suficiente para corregir un grant indebido;
5. datos sensibles no se publican mediante truncado superficial, nombre opaco o UUID;
6. respuestas públicas no incluirán metadatos administrativos sin finalidad;
7. telemetría de abuso no registrará secretos o payloads sensibles innecesarios;
8. una mitigación de abuso no sustituye RLS, grants o autorización.

---

#### 23. Frontera con RLS

`AUTH-DB-002` y `AUTH-DB-005` resuelven controles diferentes:

```text
AUTH-DB-002
→ quién puede alcanzar qué filas y bajo qué predicate

AUTH-DB-005
→ qué privilegio PostgreSQL posee anon sobre schema/objeto/firma
```

Por tanto:

1. RLS no crea un `GRANT`;
2. un `GRANT` no sustituye RLS;
3. una policy `TO anon` no crea un contrato `ANON_PUBLIC`;
4. una policy `TO public` exige revisar explícitamente su alcance sobre `anon`;
5. retirar un grant no corrige una policy defectuosa;
6. esta tarea no reescribe policies para hacer cuadrar una reducción de ACL;
7. las pruebas deberán identificar si una denegación procede de schema, objeto, RLS, contrato o protección de abuso.

---

#### 24. Frontera con `SECURITY DEFINER`

`AUTH-DB-003` conserva autoridad sobre necesidad de elevación, owner técnico, `search_path`, autorización interna y modo de seguridad.

`AUTH-DB-005` decide únicamente si `anon` debe tener `EXECUTE` sobre una firma.

Consecuencias:

1. las 43 funciones `SECURITY DEFINER` actualmente ejecutables por `anon` requieren clasificación de audiencia;
2. su existencia no autoriza conservar `EXECUTE`;
3. retirar `EXECUTE` no modifica cuerpo, owner o modo de seguridad;
4. conservar `EXECUTE` requiere `ANON_PUBLIC` y evidencia completa;
5. una función de trigger no recibe audiencia pública por ser privilegiada;
6. pruebas adversariales de elevación permanecen bajo el contrato de `AUTH-DB-003` y su cobertura vigente.

---

#### 25. Ocho disposiciones obligatorias

Cada privilegio actual de `anon` dentro del universo Vento OS deberá terminar exactamente en una de estas disposiciones canónicas:

| Disposición                     | Resultado                                                                 |
| ------------------------------- | ------------------------------------------------------------------------- |
| `KEEP_AND_HARDEN`               | se conserva únicamente el mínimo exigido por un contrato `ANON_PUBLIC`    |
| `MOVE_TO_API`                   | la capacidad migra a un contrato expuesto en `api`                        |
| `NARROW_PRIVILEGES`             | el objeto permanece temporalmente, pero se reducen operaciones o columnas |
| `REPLACE_WITH_COMMAND_OR_QUERY` | el acceso directo se sustituye por RPC o contrato de consulta             |
| `PRIVATE_ONLY`                  | el objeto queda fuera de `anon`                                           |
| `TRANSITIONAL_COMPATIBILITY`    | el grant legacy permanece temporalmente con sucesor y salida              |
| `RETIRE`                        | el grant se elimina después de demostrar ausencia de consumo válido       |
| `BLOCKED_PENDING_EVIDENCE`      | no puede mantenerse, ampliar ni retirar hasta resolver evidencia faltante |

No existe una disposición implícita `KEEP_BECAUSE_PUBLIC_NAME` ni `KEEP_BECAUSE_CURRENTLY_WORKS`.

---

#### 26. Reglas de clasificación por superficie

| Superficie actual                        | Regla de clasificación                                                                                        |
| ---------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| `app_private` y `viso` sin acceso `anon` | conservar acceso directo en cero                                                                              |
| owner schema con acceso directo          | `MOVE_TO_API`, `NARROW_PRIVILEGES`, `TRANSITIONAL_COMPATIBILITY`, `PRIVATE_ONLY` o `BLOCKED_PENDING_EVIDENCE` |
| tabla autoritativa con DML `anon`        | `REPLACE_WITH_COMMAND_OR_QUERY`, transición o bloqueo; DML directo objetivo cero                              |
| tabla con `SELECT` `anon`                | conservar solo con `ANON_PUBLIC`; en otro caso mover, estrechar, privatizar, retirar o transicionar           |
| `public`                                 | congelar expansión y decidir por identidad; pertenecer a `public` no demuestra audiencia pública              |
| vista                                    | revisar modo de seguridad, fuentes, RLS, columnas y dependency grants antes de conservar                      |
| función                                  | `EXECUTE` únicamente por firma y audiencia `ANON_PUBLIC` aprobadas                                            |
| secuencia                                | `PRIVATE_ONLY`; acceso cliente objetivo cero                                                                  |
| schema con `USAGE` sin objetos públicos  | revisar necesidad; `USAGE` aislado no se conserva por costumbre                                               |
| objeto sin owner, consumidor o finalidad | `BLOCKED_PENDING_EVIDENCE`                                                                                    |
| superficie administrada por plataforma   | clasificar como administrada y no mutar por inferencia                                                        |
| VITAL                                    | fuera del alcance físico de esta tarea                                                                        |

La clasificación utiliza identidad calificada y firma exacta cuando aplique.

---

#### 27. Compatibilidad y protección contra ruptura

Como `api` todavía no existe físicamente, la reducción debe proteger consumidores vigentes sin convertir la transición en permanencia.

Un grant legacy solo puede conservarse como `TRANSITIONAL_COMPATIBILITY` cuando registra:

- objeto y privilegio exactos;
- consumidor;
- finalidad;
- owner;
- sensibilidad;
- contrato sucesor;
- telemetría;
- versión o cohorte;
- revisión o condición de salida;
- rollback.

Reglas:

1. no se amplían operaciones durante la transición;
2. no se incorporan consumidores nuevos;
3. no se agregan columnas por conveniencia;
4. no se interpreta una búsqueda de código sin resultados como cero consumo;
5. una compatibilidad sin sucesor, revisión o evidencia permanece bloqueada;
6. la falta física de `api` no autoriza conservar indefinidamente grants amplios;
7. la materialización de R1 deberá preceder al cutover cuando el sucesor dependa de la nueva frontera.

---

#### 28. Manifiesto obligatorio de la futura instancia

Antes de modificar un privilegio, `AUTH-DB-005::GLOBAL` deberá derivar un inventario completo por identidad con, como mínimo:

```text
qualified_object_identity
object_kind
product_boundary
schema_exposure_state
object_owner
current_schema_privileges
current_object_privileges
current_column_privileges
current_effective_privileges
privilege_origin
default_privilege_origin
role_membership_origin
rls_protection_class
policy_audiences
consumer_repositories
consumer_applications
contract_kind
audience_contract
public_purpose
business_owner
technical_owner
sensitivity
row_or_resource_scope
column_or_return_scope
volume_and_pagination_policy
abuse_protection_policy
error_disclosure_policy
canonical_disposition
target_schema
target_operations
dependency_grants
successor_contract
compatibility_state
review_or_exit_gate
migration_reference
definition_or_acl_hash
rollback
evidence
```

Reglas de completitud:

1. toda identidad alcanzable por `anon` aparece exactamente una vez;
2. todo privilegio efectivo tiene origen explicable;
3. se distinguen grants directos, defaults, memberships y dependencias;
4. toda firma ejecutable aparece individualmente;
5. toda vista conserva fuentes y modo de seguridad;
6. VITAL queda marcado y excluido del cambio;
7. superficies administradas quedan marcadas y fuera de cambios inferidos;
8. ninguna fila queda sin disposición;
9. las cardinalidades se recalculan inmediatamente antes de materializar.

---

#### 29. Estrategia de materialización física posterior

La futura instancia global seguirá una transición por seguridad:

```text
1. RECONCILIAR ESTADO REAL
2. CLASIFICAR TODA IDENTIDAD Y FIRMA
3. SEPARAR DEFAULTS Y MEMBERSHIPS VENTO DE PLATAFORMA
4. IDENTIFICAR CONTRATOS ANON_PUBLIC VÁLIDOS
5. MATERIALIZAR SUCESORES SEGUROS CUANDO CORRESPONDA
6. PRESERVAR COMPATIBILIDAD ACTIVA SIN AMPLIARLA
7. REVOCAR SOLO PRIVILEGIOS CON DISPOSICIÓN EJECUTABLE
8. CONCEDER ÚNICAMENTE MÍNIMOS EXPLÍCITOS
9. EJECUTAR PRUEBAS POSITIVAS, NEGATIVAS Y DE ABUSO
10. RECONCILIAR DRIFT Y PARIDAD
```

La materialización:

- usa migración forward versionada;
- no reescribe migraciones históricas;
- no crea `api` por inferencia;
- no modifica policies RLS fuera de su tarea propietaria;
- no cambia modo, owner o cuerpo de funciones fuera de `AUTH-DB-003`;
- no corta un consumidor antes de disponer de sucesor o retiro aprobado;
- no toca VITAL;
- no altera internals o defaults administrados sin contrato soportado;
- falla cerrado ante drift o identidad no clasificados.

---

#### 30. Pruebas positivas y negativas

La futura instancia deberá demostrar, según aplique:

1. un contrato `ANON_PUBLIC` aprobado funciona sin privilegios adicionales;
2. un objeto sin contrato público no es alcanzable por `anon`;
3. DML directo sobre tablas autoritativas queda denegado;
4. columnas sensibles o administrativas quedan fuera de la respuesta pública;
5. filas o recursos fuera del scope público no son enumerables;
6. identificadores manipulados no revelan recursos protegidos;
7. errores no filtran datos internos ni diferencias sensibles innecesarias;
8. límites y paginación del contrato se respetan;
9. controles de abuso definidos por el contrato se aplican y observan;
10. `app_private` y `viso` no adquieren acceso directo;
11. secuencias permanecen inaccesibles;
12. `CREATE` por `anon` falla en schemas Vento;
13. una función sin audiencia pública aprobada no conserva `EXECUTE`;
14. una función `SECURITY DEFINER` pública satisface también las pruebas propietarias de elevación;
15. una vista pública no revela columnas o filas fuera de su contrato mediante dependencias;
16. una policy `PUBLIC` no amplía la superficie más allá del grant y contrato aprobados;
17. un default privilege no concede acceso a un objeto Vento nuevo;
18. una membership no reintroduce un privilegio retirado;
19. compatibilidades funcionan solo dentro de su contrato y ventana;
20. la ausencia física de `api` no provoca un cutover destructivo;
21. rollback no reabre grants amplios ni DML directo.

---

#### 31. Rollback seguro

El rollback no significa restaurar todos los ACL históricos.

Orden preferente:

```text
CORRECCIÓN FORWARD
→ RESTAURAR ÚNICAMENTE EL CONTRATO ANON_PUBLIC MÍNIMO
→ REACTIVAR COMPATIBILIDAD ACOTADA SI YA EXISTÍA
→ DESHABILITAR TEMPORALMENTE LA CAPACIDAD
→ NUNCA REABRIR GRANTS GLOBALES O DML DIRECTO POR CONVENIENCIA
```

Toda reversión conservará:

- identidad;
- privilegio exacto;
- consumidor;
- finalidad;
- motivo;
- duración;
- owner;
- migración;
- evidencia;
- prueba posterior.

Si recuperar una capacidad exige volver a un privilegio no autorizado, el rollback falla cerrado y la capacidad permanece bloqueada hasta una corrección segura.

---

#### 32. Drift y control recurrente

El control recurrente comparará:

```text
schemas configurados
+ USAGE y CREATE
+ ACL de objetos
+ column grants
+ secuencias
+ EXECUTE por firma
+ default privileges
+ memberships
+ RLS y policy audiences
+ contratos ANON_PUBLIC
+ consumidores
+ disposiciones
+ hashes
+ migraciones
+ paridad ambiental
```

Generan drift bloqueante:

- nuevo grant de `anon` sin contrato;
- nuevo `USAGE` sobre schema Vento sin necesidad clasificada;
- cualquier `CREATE` de `anon`;
- nuevo default privilege que exponga objetos Vento;
- nueva secuencia accesible;
- nuevo DML directo sobre tabla autoritativa;
- nuevo `EXECUTE` no registrado;
- ampliación de columnas o filas públicas;
- nueva vista pública con dependencias no clasificadas;
- policy `anon` o `PUBLIC` incompatible con el contrato efectivo;
- membership nueva que reintroduzca acceso;
- compatibilidad expirada;
- contrato `ANON_PUBLIC` sin manifiesto o evidencia;
- diferencia no explicada entre documentación, migraciones y remoto.

---

#### 33. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Justificación:** la arquitectura canónica ya protege mínimo privilegio, exposición Data API, `ANON_PUBLIC`, default privileges, `CREATE`, DML directo, secuencias, funciones, RLS, contratos `api`, compatibilidad, rollback, paridad y drift. `AUTH-DB-005` materializa documentalmente esas reglas para la audiencia `anon` sin introducir una regla observable nueva.

---

#### 34. Cobertura de prueba vigente reutilizada

Se reutiliza, sin modificarla, la cobertura canónica existente, especialmente:

- `TREQ-SUPABASE-005`;
- `TREQ-SUPABASE-008`;
- `TREQ-SUPABASE-1047`;
- `TREQ-SUPABASE-1048`;
- `TREQ-SUPABASE-1050`;
- `TREQ-SUPABASE-1052` a `TREQ-SUPABASE-1056`;
- `TREQ-SUPABASE-1059` a `TREQ-SUPABASE-1064`;
- `TREQ-SUPABASE-1095`;
- `TREQ-SUPABASE-1096`;
- `TREQ-SUPABASE-1101`;
- `TREQ-SUPABASE-1140`;
- `TREQ-SUPABASE-1671`.

Estos identificadores se registran únicamente como trazabilidad de cobertura preexistente.

---

#### 35. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                                         |
| --------- | -------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | la definición documental no materializa código ni migraciones                                                                                                     |
| LOCAL     | NOT_EXECUTED   | pendiente del lifecycle documental y validadores del checkout de la tarea                                                                                         |
| REMOTA    | PASS           | línea base read-only reconciliada para relaciones, vistas, funciones, secuencias, privilegios de schema, default ACL, memberships y policies relevantes de `anon` |
| OPERATIVA | NOT_APPLICABLE | no se alteran consumidores, permisos efectivos, datos ni flujos operativos                                                                                        |
| FÍSICA    | NOT_APPLICABLE | `AUTH-DB-005::GLOBAL` permanece sin autorización física                                                                                                           |

---

#### 36. Decisiones vinculantes

1. `anon` representa solicitudes no autenticadas y no autorización empresarial.
2. Un usuario de Supabase Auth autenticado de forma anónima usa `authenticated`, no `anon`.
3. El único estado objetivo público de Vento es un contrato con audiencia `ANON_PUBLIC` explícita.
4. La futura instancia física es `AUTH-DB-005::GLOBAL`.
5. Su modo es `GLOBAL_ENABLE_ONCE`.
6. Su gate es `PRE_E5_FOUNDATION`.
7. La aprobación documental no autoriza la instancia física.
8. `api` es la única superficie Data API empresarial objetivo.
9. `api` no existe físicamente en la línea base remota vigente.
10. La ausencia de `api` impide un corte masivo que rompa consumidores legacy.
11. El universo Vento OS observado contiene 325 objetos relación/vista.
12. `anon` alcanza 39 de esos objetos.
13. Los 39 se distribuyen en 20 objetos `pass`, 18 `public` y 1 `talento`.
14. `anon` tiene `SELECT` efectivo sobre los 39.
15. `anon` tiene `INSERT`, `UPDATE` y `DELETE` efectivos sobre cuatro tablas `pass`.
16. Las cuatro tablas con DML son `loyalty_redemptions`, `loyalty_transactions`, `pass_satellites` y `user_favorites` dentro de `pass`.
17. DML directo de `anon` sobre tablas autoritativas tiene objetivo cero.
18. El universo observado contiene 301 funciones Vento OS.
19. `anon` tiene `EXECUTE` efectivo sobre 91 funciones.
20. De ellas, 43 son `SECURITY DEFINER`.
21. `AUTH-DB-003` conserva autoridad sobre modo y endurecimiento de `SECURITY DEFINER`.
22. `AUTH-DB-005` conserva autoridad sobre `EXECUTE` de `anon`.
23. Las dos secuencias Vento observadas conservan cero privilegios para `anon` y ese estado debe preservarse.
24. `anon` conserva `USAGE` sobre `pass`, `pos`, `public` y `talento` y cero `CREATE` sobre los ocho schemas Vento observados.
25. `USAGE` de schema no equivale a acceso de objeto.
26. Los default ACL administrados observados se clasifican por separado y no se modifican por inferencia.
27. Los roles y memberships administrados por plataforma no se usan como palanca de limpieza empresarial.
28. La superficie accesible registra 114 policies relacionadas, 15 dirigidas explícitamente a `anon` y 8 a `PUBLIC`.
29. Trece vistas `public` accesibles no tienen policy propia y exigen revisar sus fuentes y modo de seguridad.
30. Una policy no sustituye un grant y un grant no sustituye una policy.
31. `public` permanece compatibilidad transitoria congelada, no arquitectura objetivo.
32. VITAL queda fuera del alcance físico de esta tarea.
33. Los schemas y servicios administrados por Supabase quedan fuera de cambios inferidos.
34. Cada privilegio actual recibe una de ocho disposiciones canónicas.
35. La falta de evidencia produce `BLOCKED_PENDING_EVIDENCE`.
36. `KEEP_AND_HARDEN` para `anon` exige contrato `ANON_PUBLIC` completo.
37. Toda reducción física usa migración forward.
38. El rollback no restaura privilegios amplios por defecto.
39. No se crean ni modifican requisitos de prueba.
40. El Registro Canónico de Requisitos de Prueba permanece sin cambios.

---

#### 37. Criterios de aceptación

`AUTH-DB-005` queda documentalmente completa cuando:

- `anon` queda definido de forma inequívoca como audiencia no autenticada;
- se separa `anon` de usuarios Auth anónimos que utilizan `authenticated`;
- `ANON_PUBLIC` queda establecido como condición obligatoria de acceso público objetivo;
- la topología `GLOBAL_ENABLE_ONCE`, `PRE_E5_FOUNDATION` y `AUTH-DB-005::GLOBAL` queda preservada;
- la línea base remota de objetos, funciones, secuencias, schemas, defaults, memberships y policies queda reconciliada;
- las cuatro tablas con DML anónimo quedan identificadas sin declarar una revocación automática;
- `api` ausente queda tratado como restricción de transición;
- se preserva cero acceso de secuencias y cero `CREATE`;
- `EXECUTE` de funciones queda separado del endurecimiento `SECURITY DEFINER`;
- las vistas públicas exigen clasificación de dependencias y no se consideran seguras por su forma;
- VITAL y superficies administradas quedan fuera de cambios inferidos;
- las ocho disposiciones canónicas quedan preservadas;
- toda identidad futura exige manifiesto, audiencia, origen de privilegio y disposición;
- se define compatibilidad sin ampliación;
- se definen pruebas positivas, negativas, de abuso y drift;
- se define rollback seguro;
- no existe autorización física implícita;
- no existe cambio 04A;
- la continuidad avanza a `AUTH-DB-016` únicamente después de aprobación explícita.

---

#### 38. Límites

`AUTH-DB-005` no:

- ejecuta SQL mutante;
- crea migraciones;
- crea el schema `api`;
- revoca grants remotos;
- concede grants nuevos;
- modifica RLS;
- modifica policies;
- cambia funciones;
- cambia `SECURITY DEFINER` o `SECURITY INVOKER`;
- modifica owners;
- crea roles;
- altera memberships administradas;
- modifica default privileges de plataforma por inferencia;
- modifica VITAL;
- modifica Auth, Storage, Realtime, cron, GraphQL o internals administrados;
- retira consumidores;
- ejecuta cutover;
- cambia aplicaciones cliente;
- modifica el Registro Canónico de Requisitos de Prueba;
- autoriza `AUTH-DB-005::GLOBAL`;
- desarrolla `AUTH-DB-016`.

No comenzar sin baseline, drift, entorno reproducible, pruebas negativas, respaldo, restauración, rollback y migración versionada.

### Package VISO mensual

- 015: nombre/orden/idempotencia/documentación.
- 027: debajo/igual/encima del límite, descanso/cancelado, mes, sedes, insert/update, publicación múltiple y concurrencia.
- 028: detectar drift y aplicación directa.
- 029: rollback del trigger/función con protección temporal.
- 003: owner, grants, search path y mensajes.

---

#### 39. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-DB-004 — Reducir grants innecesarios de authenticated`

**TAREA ACTUAL APROBADA**
`AUTH-DB-005 — Revocar grants innecesarios de anon`

**SIGUIENTE TAREA RESERVADA**
`AUTH-DB-016 — Crear esquemas empresariales aprobados`
