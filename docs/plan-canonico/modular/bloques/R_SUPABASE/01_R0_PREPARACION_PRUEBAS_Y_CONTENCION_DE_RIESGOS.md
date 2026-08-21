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


### [ ] AUTH-DB-027 — Crear harness de pruebas de esquema, integridad, RLS, RPC y migraciones
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
