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
