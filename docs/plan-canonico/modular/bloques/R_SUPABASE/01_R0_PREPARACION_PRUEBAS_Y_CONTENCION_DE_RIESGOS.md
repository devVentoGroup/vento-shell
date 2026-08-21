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


### [ ] AUTH-DB-028 — Establecer baseline y control de drift entre local, staging y producción
### [ ] AUTH-DB-029 — Validar respaldo, restauración y rollback antes del primer paquete
### [ ] AUTH-DB-001 — Corregir tablas sin RLS identificadas en SUPA-AUD
### [ ] AUTH-DB-002 — Endurecer políticas RLS demasiado amplias aprobadas para corrección
### [ ] AUTH-DB-003 — Endurecer funciones SECURITY DEFINER aprobadas
### [ ] AUTH-DB-004 — Reducir grants innecesarios de authenticated
### [ ] AUTH-DB-005 — Revocar grants innecesarios de anon

No comenzar sin baseline, drift, entorno reproducible, pruebas negativas, respaldo, restauración, rollback y migración versionada.

### Package VISO mensual

- 015: nombre/orden/idempotencia/documentación.
- 027: debajo/igual/encima del límite, descanso/cancelado, mes, sedes, insert/update, publicación múltiple y concurrencia.
- 028: detectar drift y aplicación directa.
- 029: rollback del trigger/función con protección temporal.
- 003: owner, grants, search path y mensajes.
