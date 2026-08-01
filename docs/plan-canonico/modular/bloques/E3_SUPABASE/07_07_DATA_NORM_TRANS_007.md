### ✅ DATA-NORM-TRANS-007 — Validar búsquedas, relaciones e integraciones después del backfill

**Estado:** APROBADA

**Condición canónica:** APROBADA EXPLÍCITAMENTE POR EL USUARIO — `2026-08-01`

**Tarea anterior:** `DATA-NORM-TRANS-006 — Activar reglas sobre nuevas escrituras de forma progresiva` — APROBADA

**Tarea siguiente:** `DATA-NORM-TRANS-008 — Definir rollback y recuperación del valor anterior` — APROBADA

**Tipo de tarea:** diseño material de la suite post-backfill, matriz ejecutable read-only, reconciliación y gates por unidad; sin afirmar ejecución de backfills, consultar remoto, activar reglas, modificar datos, crear migraciones, cambiar índices/RLS/grants, desplegar consumidores ni ejecutar rollback

**Fecha de preparación documental:** `2026-08-01`

#### 1. Resultado concreto

Esta tarea deja listos:

1. nueve planes de validación, uno por cada unidad de backfill/preservación de `005`;
2. siete carriles obligatorios: fuente, búsqueda, relaciones, integraciones, propagación, seguridad y rendimiento;
3. comparaciones `before/after` que no reducen la paridad a igualdad de conteos;
4. tolerancias cero para identidad, integridad, seguridad, originales, tenants y efectos;
5. corpus de búsqueda con ranking, scope, autorización, paginación y casos negativos;
6. reconciliación de crosswalks, referencias y efectos hijos;
7. pruebas de imports, jobs, webhooks, APIs y originales externos;
8. outcomes cerrados, evidence bundle y gate de salida hacia `008`.

El artefacto [DATA-NORM-TRANS-007_POST_BACKFILL_VALIDATION.sql](./DATA-NORM-TRANS-007_POST_BACKFILL_VALIDATION.sql) materializa las nueve unidades, los siete carriles y sus invariantes usando únicamente tablas temporales y `ROLLBACK`.

#### 2. Estado real y alcance posible

```text
VALIDATION_SUITE_DESIGNED = true
MANIFEST_LOCALLY_EXECUTABLE = true
PHYSICAL_BACKFILL_EXECUTED = false
POST_BACKFILL_PARITY_OBSERVED = false
UNIT_READY_TO_CLOSE = 0
```

`005` diseñó los lotes, pero BLOQUE R todavía no los ha ejecutado. Por tanto, esta tarea puede desarrollar completamente qué se validará, cómo se reconciliará y qué resultado habilita continuar; no puede fabricar resultados `PASS` contra un estado post-backfill inexistente.

La aprobación de `007` aprueba la suite y su handoff. La evidencia operativa deberá producirse por ambiente cuando R ejecute cada unidad.

#### 3. Insumos obligatorios de una corrida real

Una validación no inicia sin:

```text
validation_run_id
environment_identity
candidate_commit_sha
migration_history_digest
backfill_plan_id
backfill_run_id
source_cut_reference
baseline_bundle_digest
mapping_version_set
policy_version_set
version_set_digest
activation_event_id cuando exista
batch_and_checkpoint_set
writer_and_consumer_registry_version
expected_unit_outcomes
owner_and_authorities
```

Si falta un insumo, el resultado es `BLOCKED_INPUT_MISSING`; nunca `PASS_WITH_ASSUMPTION`.

#### 4. Estados cerrados de validación

| Estado | Significado |
| --- | --- |
| `NOT_EXECUTED` | suite definida pero sin corrida física |
| `BLOCKED_INPUT_MISSING` | falta backfill, corte, digest, ambiente, owner o evidencia obligatoria |
| `RUNNING` | corrida abierta con mismo corte y versiones |
| `PASS` | todas las aserciones aplicables aprobaron y la reconciliación cerró |
| `FAIL` | al menos una aserción o invariante falló |
| `ABORTED` | la corrida se detuvo por seguridad, integridad o ambiente incorrecto |
| `SUPERSEDED` | otra corrida sobre un candidato/corte posterior la reemplaza sin borrar historia |
| `NOT_APPLICABLE` | carril excluido explícitamente para una unidad, con razón aprobada |

No existen `PARTIAL_PASS`, promedio compensatorio ni “aceptable con observaciones”. Una unidad con efectos hijos pendientes sigue `FAIL` o `BLOCKED`, según la causa.

#### 5. Siete carriles obligatorios

| # | Carril | Qué demuestra | Tolerancia de cierre |
| ---: | --- | --- | --- |
| 10 | `SOURCE_AND_OUTCOME` | fuente, originales, cortes, mappings, checkpoints y outcome por elemento | cero fuente destruida, fila sin outcome o versión desconocida |
| 20 | `SEARCH_AND_DISCOVERY` | claves, resultados, ranking, scopes, autorización, cursores y explicabilidad | cero resultado exacto perdido; corpus esperado completo |
| 30 | `RELATIONSHIP_AND_CROSSWALK` | FKs, referencias, sobrevivientes, crosswalks, jerarquías, vigencias y huérfanos | cero referencia perdida, ambigua, duplicada u huérfana |
| 40 | `INTEGRATION_AND_CONTRACT` | originales externos, mappings, API/RPC, imports, jobs, webhooks, ACK y eventos | cero contrato roto, original sobrescrito o efecto duplicado |
| 50 | `PROPAGATION_AND_PROJECTION` | copias, proyecciones, outbox/comandos hijos, reintentos y snapshots | cero copia divergente sin outcome; snapshots intactos |
| 60 | `SECURITY_AND_BOUNDARY` | RLS, grants, actores, tenant/sede/producto, minimización y VITAL | cero acceso indebido, mezcla de frontera o secreto expuesto |
| 70 | `PERFORMANCE_AND_OPERABILITY` | planes, índices, latencia, throughput, locks, alertas y rollback disponible | dentro de baseline/SLO y presupuestos aprobados en `SUPA-TRANS-010` |

`SOURCE_AND_OUTCOME`, `SECURITY_AND_BOUNDARY` y las partes autoritativas de `RELATIONSHIP_AND_CROSSWALK` nunca admiten tolerancia distinta de cero.

#### 6. Matriz ejecutable por unidad

| # | `validation_plan_id` | Unidad de `005` | Carriles principales | Resultado actual | Evidencia física faltante |
| ---: | --- | --- | --- | --- | --- |
| 10 | `DNT007-UOM-GOUDA-MERGE-V1` | `DNT005-UOM-GOUDA-MERGE-V1` | fuente, búsqueda, relaciones, integración, seguridad, rendimiento | `BLOCKED_INPUT_MISSING` | merge/crosswalk no ejecutado; referencias y writers sin corte revalidado |
| 20 | `DNT007-UOM-STRUCTURAL-V1` | `DNT005-UOM-STRUCTURAL-DERIVATION-V1` | fuente, búsqueda, relaciones, propagación, seguridad, rendimiento | `BLOCKED_INPUT_MISSING` | target derivado y delta de writers no materializados |
| 30 | `DNT007-POSITION-SCOPE-V1` | `DNT005-INVENTORY-POSITION-SCOPE-V1` | fuente, búsqueda, jerarquía, consumidores, seguridad, rendimiento | `BLOCKED_INPUT_MISSING` | scope derivado, target y corpus físico pendientes |
| 40 | `DNT007-SEARCH-REPRESENTATIONS-V1` | `DNT005-SEARCH-REPRESENTATIONS-V1` | fuente, búsqueda completa, consumidores, seguridad, rendimiento | `BLOCKED_INPUT_MISSING` | 4.030 filas no materializadas bajo algoritmo físico versionado |
| 50 | `DNT007-VISIBLE-FORM-QUARANTINE-V1` | `DNT005-VISIBLE-FORM-CANDIDATES-V1` | fuente, outcome, revisión, seguridad | `BLOCKED_INPUT_MISSING` | 46 observaciones no deduplicadas; no existe corrida de cuarentena |
| 60 | `DNT007-DICTIONARY-QUARANTINE-V1` | `DNT005-DICTIONARY-TOKEN-CANDIDATES-V1` | fuente, outcome, integración, seguridad | `BLOCKED_INPUT_MISSING` | scan elegible y coordenadas de maiz/clasico/frio pendientes |
| 70 | `DNT007-PASS-PRESERVATION-V1` | `DNT005-PASS-LIFECYCLE-PRESERVATION-V1` | fuente, relaciones temporales, integraciones, seguridad | `BLOCKED_INPUT_MISSING` | snapshot after y evidencia de no mutación no producidos |
| 80 | `DNT007-PERSON-PRESERVATION-V1` | `DNT005-PERSON-NAME-PRESERVATION-V1` | fuente, búsqueda restringida, privacidad, integraciones | `BLOCKED_INPUT_MISSING` | snapshot after y pruebas negativas de identidad textual pendientes |
| 90 | `DNT007-IDENTITY-BLOCKERS-V1` | `DNT005-OPEN-IDENTITY-BLOCKERS-V1` | fuente, relaciones, cuarentena, integraciones, seguridad | `BLOCKED_INPUT_MISSING` | snapshot after que preserve ocho miembros y cero efectos no autorizado |

#### 7. Validación de fuente, lineage y outcomes

Por unidad se comparará:

- universo total y por cohorte;
- claves estables, fuente y versión/hash;
- nulos, ausencia, vacío, whitespace, estados, dominios y vigencias;
- `batch_id`, `chunk_id`, checkpoint y conteos esperados/confirmados;
- mapping, política, algoritmo y `version_set_digest`;
- outcome cerrado por cada elemento;
- originales, snapshots, auditoría y evidencia preservados;
- errores, cuarentenas, pendientes y compensaciones.

Reglas:

1. la igualdad de conteos no demuestra paridad si cambian miembros, claves, relaciones o significado;
2. todo elemento del corte aparece exactamente una vez en outcomes;
3. una derivación enlaza una fuente exacta y no adquiere autoridad;
4. un merge conserva miembros, sobreviviente, crosswalk, before/after y autorización;
5. una unidad `NO_BACKFILL_REQUIRED` demuestra ausencia de mutación, no omite la validación;
6. replay de esta suite es read-only y no repite efectos.

#### 8. Suite de búsquedas

Cada consulta del corpus conservará:

```text
query_case_id
profile_and_version
language_profile
field_and_scope_coordinate
authorized_actor_fixture
query_original
query_representation_digest
expected_result_ids_in_order
expected_match_level_by_result
expected_exclusions
expected_cursor_pages
before_result
after_result
explanation
```

Comparaciones obligatorias:

1. `EXACT_VALUE_MATCH` conserva todos los IDs exactos y su precedencia;
2. `SEARCH_FORM_KEY` solo altera caja/espacios autorizados y conserva tildes, signos y fronteras;
3. `SEARCH_ACCENT_KEY` tolera `áéíóú` y el `ü` permitido, pero preserva `ñ ≠ n`;
4. aliases participan únicamente si están activos, versionados y acotados;
5. tokenización no convierte subcadenas en palabras ni une `Choco Bites/Chocobites`;
6. UOM filtra por producto, contexto, cantidad, unidad y multiplicador; la etiqueta sola no decide identidad;
7. posiciones incluyen sede, ubicación, padre y código; `Nivel 1` no colisiona globalmente;
8. personas no se resuelven ni deduplican por nombre;
9. VITAL no entra al corpus transversal;
10. ranking, empates, paginación y cursor son deterministas para la misma versión;
11. resultados no autorizados no se filtran después de exponerlos: nunca llegan a la respuesta;
12. toda coincidencia declara representación, nivel, versión y motivo.

El gate falla con cualquier resultado exacto perdido, resultado prohibido, orden contractual distinto, cursor duplicado/omitido o exposición fuera de scope. Para recuperación tolerante, el corpus aprobado define resultados y exclusiones exactos; no se inventa un porcentaje global que oculte casos críticos.

#### 9. Relaciones, crosswalks y jerarquías

La reconciliación produce por tabla/relación:

```text
reference_coordinate
before_distinct_source_ids
after_distinct_target_ids
crosswalked_ids
unchanged_ids
orphan_ids
ambiguous_crosswalks
duplicate_effects
expected_count
observed_count
digest
outcome
```

Puertas:

1. cada ID no sobreviviente del merge Gouda resuelve a un solo sobreviviente aprobado;
2. ninguna referencia cambia por coincidencia textual;
3. FK, asociaciones, políticas, inventario, movimientos, recetas, compras, catálogo, ventas, documentos e historia se reconcilian por identidad estable;
4. posiciones conservan padre, código, sede y ubicación;
5. PASS conserva estados y vigencias; activos e históricos no se fusionan por nombre;
6. secuencias/identities no retroceden ni reutilizan claves;
7. cero huérfanos autoritativos y cero referencias al no sobreviviente fuera del conjunto explícitamente histórico;
8. referencias históricas que deban conservar el ID anterior se identifican como tales y no se fuerzan al crosswalk vivo.

#### 10. Integraciones, contratos y canales

Se probarán por separado:

- aplicación/RPC interactiva;
- CSV y Excel;
- jobs y cron;
- Edge Functions y webhooks;
- POS y proveedores externos observados;
- eventos, outbox y consumidores asincrónicos;
- exportaciones, reportes y herramientas operativas.

Cada caso valida:

1. `EXTERNAL_ORIGINAL` conserva bytes/hash, emisor, contrato y procedencia;
2. parsing y mapping son representaciones separadas y versionadas;
3. el mismo original/digest reutiliza el resultado; identidad externa igual con digest distinto bloquea;
4. ACK técnico, commit empresarial, evento y receipt permanecen separados;
5. un timeout posterior al commit recupera el resultado sin duplicar efecto;
6. eventos tardíos, fuera de orden, rectificados o retractados no vencen por orden de llegada;
7. batch/import conserva archivo, hoja, fila, columna, celda, chunk y outcome;
8. clientes legacy y nuevos consumen la misma semántica o permanecen bloqueados;
9. ninguna integración sobrescribe el original con una forma normalizada;
10. ningún canal usa service role en cliente ni evade RLS/autoridad.

#### 11. Propagación, copias y efectos hijos

1. fuente y registro causal se confirman en la misma transacción.
2. cada destino tiene `child_effect_id`, idempotency key, versión esperada, estado y outcome.
3. destinos asincrónicos se ejecutan después del commit.
4. reintento omite destinos confirmados y no duplica eventos.
5. una copia sincronizada usa la misma versión; no normaliza localmente.
6. snapshots históricos y evidencia no se resincronizan.
7. overrides conservan precedencia y no se sobrescriben sin contrato.
8. éxito parcial conserva destinos pendientes/fallidos y mantiene la unidad sin `PASS`.
9. una compensación es un efecto nuevo causalmente vinculado.
10. triggers no llaman red ni orquestan propagación.

#### 12. Seguridad y frontera

La corrida futura incluirá pruebas positivas y negativas para:

- `anon`, `authenticated`, service/backend autorizado, owner técnico y actor de dominio;
- `SELECT`, búsqueda, preview, mutación, confirmación, revisión, exportación y replay como capacidades separadas;
- RLS `USING/WITH CHECK`, grants efectivos, funciones y vistas;
- tenant, sede, dominio, ambiente y producto;
- minimización de consultas, resultados, evidencia y logs;
- ausencia de secretos, firmas y payloads sensibles en telemetría;
- VITAL completamente fuera de Vento OS.

Una tabla futura en schema expuesto exige RLS y grants explícitos. Una vista deberá respetar RLS mediante `security_invoker` o permanecer fuera de exposición. `SECURITY DEFINER` no resolverá permisos por bypass.

#### 13. Rendimiento y planes

Por consulta y canal se preservarán `EXPLAIN` sin efectos para análisis estático y, solo sobre dataset autorizado, métricas reales de ejecución. Se compararán:

- plan y uso de índice;
- filas estimadas/observadas y scans evitables;
- latencia `p50/p95/p99`;
- throughput, timeout y error rate;
- locks, deadlocks, conexiones y recursos;
- tamaño/costo de índices y write amplification;
- paginación profunda y estabilidad de cursor.

Presupuestos máximos de transición: `p50/p95 +10%`, `p99 +15%`, throughput `-10%`, error inesperado `+0,25` puntos porcentuales, deadlocks `0`, pérdida/duplicado `0`, sin superar un SLO más estricto. Un flujo sin baseline permanece bloqueado.

#### 14. Orden de ejecución por ambiente

```text
LOCAL_CLEAN_REPLAY
→ LOCAL_PGTAP_AND_CLIENT_FIXTURES
→ CI_REPRODUCIBLE
→ STAGING_READ_ONLY_BASELINE
→ STAGING_BACKFILL_PACKAGE
→ STAGING_POSTCHECK_AND_SOAK
→ PRODUCTION_PRECHECK
→ PRODUCTION_BACKFILL_AUTHORIZED_WINDOW
→ PRODUCTION_POSTCHECK
→ OBSERVATION_AND_EVIDENCE_CLOSE
```

La suite debe ejecutarse sobre el mismo candidato y versión de migraciones. Una diferencia de ambiente, commit, history digest o `version_set_digest` invalida la comparación. Producción solo recibe consultas read-only y verificaciones aprobadas alrededor de una ejecución autorizada; `007` no la autoriza.

#### 15. Gate de cierre por unidad

Una unidad obtiene `PASS` únicamente si:

1. backfill y checkpoints están cerrados;
2. todos los elementos tienen outcome;
3. conteos, claves, semántica, relaciones y digests se reconciliaron;
4. búsqueda y ranking aprobaron corpus y negativos;
5. consumidores e integraciones aprobaron por canal;
6. efectos hijos están confirmados o cerrados mediante outcome compatible;
7. cero invariantes de tolerancia cero fallaron;
8. seguridad/RLS/grants y frontera aprobaron;
9. rendimiento está dentro del presupuesto;
10. divergencias tienen explicación, owner y tratamiento cerrado;
11. rollback de `008` tiene todos sus insumos, sin ejecutarlo;
12. evidence bundle está firmado por owner y steward aplicables.

El cierre global requiere `PASS` de todas las unidades ejecutadas y `NOT_APPLICABLE` justificado para carriles realmente excluidos. Una unidad bloqueada impide declarar completada la transición, pero no borra el `PASS` histórico de otras unidades.

#### 16. Evidence bundle

Cada corrida entrega:

```text
run_identity_and_environment
candidate_and_migration_digests
baseline_and_source_cut
backfill_batches_checkpoints_and_outcomes
search_corpus_results_and_query_plans
relationship_and_crosswalk_reconciliation
integration_contract_results
child_effect_and_projection_reconciliation
security_and_RLS_results
performance_measurements
divergences_and_decisions
rollback_handoff
owners_approvals_and_timestamps
sanitized_raw_evidence_references
```

La evidencia es aditiva e inmutable. Una nueva corrida supersede, no edita, la anterior.

#### 17. Qué debe implementar BLOQUE R

Por unidad, R deberá crear desde `vento-shell`:

1. consultas read-only de reconciliación con coordenadas físicas reales;
2. pruebas pgTAP de estructura, constraints, funciones, RLS y grants;
3. fixtures de búsqueda y clientes con resultados esperados ordenados;
4. pruebas de crosswalk/FK y detectores de huérfanos;
5. pruebas de contrato por integración/canal;
6. verificadores de outbox/efectos hijos e idempotencia;
7. mediciones y captura de planes;
8. generador de evidence bundle sanitizado;
9. comando fail-closed que no marque `PASS` si falta una dimensión;
10. ejecución local/CI/staging y, solo con autorización, producción.

Las pruebas de base podrán vivir en `supabase/tests/database`; cualquier cambio de schema deberá crearse como migración versionada. Este manifiesto documental no se copiará literalmente como migración.

#### 18. Handoff hacia `DATA-NORM-TRANS-008`

`008` recibirá por unidad:

- fuente y valores/crosswalks before/after;
- escrituras y efectos confirmados;
- destinos pendientes o fallidos;
- snapshots e historia que no deben reescribirse;
- activation event/mode vigente;
- condición que dispara rollback;
- ventana, owner y mecanismo de recuperación;
- evidencia de integridad y seguridad previa al rollback.

`007` no ejecuta rollback. Si detecta un fallo, congela activación/promoción, preserva evidencia y entrega el estado exacto a `008`.

#### 19. Referencias Supabase verificadas

| Fuente | Aplicación |
| --- | --- |
| [Supabase — Testing Your Database](https://supabase.com/docs/guides/database/testing) | pruebas SQL/pgTAP versionadas, ejecutables y con rollback |
| [Supabase — Row Level Security](https://supabase.com/docs/guides/database/postgres/row-level-security) | pruebas positivas/negativas y RLS obligatoria en schemas expuestos |
| [Supabase — Query Optimization](https://supabase.com/docs/guides/database/query-optimization) | comparar planes e índices con `EXPLAIN` y medir en contexto real |
| [Supabase — Local development with schema migrations](https://supabase.com/docs/guides/local-development/overview) | reproducir schema mediante migraciones locales antes de validar |
| [Supabase — Breaking changes](https://supabase.com/changelog?types=breaking-change) | revalidar plataforma antes de implementar R; exposición Data API y versiones de extensiones permanecen explícitas |

El cambio próximo de versionado de extensiones no afecta este manifiesto porque no crea extensiones. El cambio de exposición automática de tablas refuerza que R deberá probar grants Data API y RLS por separado.

#### 20. Trazabilidad de requisitos

| Requisito | Evidencia producida |
| --- | --- |
| `TREQ-SUPABASE-1740` | originales, lineage, versiones y causalidad se preservan |
| `TREQ-SUPABASE-1746` | reconciliación multidimensional por unidad y cohorte |
| `TREQ-SUPABASE-1747` | tolerancia cero para catorce clases críticas |
| `TREQ-SUPABASE-1752` | evidence bundle y handoffs sin declarar ejecución inexistente |
| `TREQ-DATA-031` | fuente, búsqueda, original, snapshot, proyección y auditoría permanecen separados |
| `TREQ-DATA-163` | una operación lógica correlacionada entre capas y canales |
| `TREQ-DATA-198` | fuente, derivaciones sincrónicas y auditoría confirman o revierten juntas |
| `TREQ-DATA-208` | efectos hijos posteriores al commit, idempotentes y reconciliables |
| `TREQ-DATA-226` | eventos tardíos/rectificados no sobrescriben por orden de llegada |
| `TREQ-DATA-236` | ACK, commit, evento y receipt no se confunden |
| `TREQ-DATA-239` | replay/reconciliación conservan historia y no repiten efectos |

#### 21. Criterios de aceptación documental

- [x] nueve unidades tienen plan, carriles, estado y evidencia faltante;
- [x] siete carriles cubren fuente, búsqueda, relaciones, integraciones, propagación, seguridad y rendimiento;
- [x] estados cerrados impiden `PARTIAL_PASS` y éxito supuesto;
- [x] búsqueda valida siete representaciones, ranking, scope, cursor, autorización y negativos;
- [x] UOM, posiciones, PASS, personas y bloqueos conservan sus decisiones estructurales;
- [x] crosswalks, FKs, jerarquías, vigencias y referencias tienen tolerancia cero;
- [x] originales externos, mappings, ACK, eventos, imports y reintentos están separados;
- [x] propagación y efectos hijos son post-commit, idempotentes y reconciliables;
- [x] seguridad cubre RLS, grants, actores, fronteras y VITAL;
- [x] rendimiento reutiliza presupuestos aprobados y no inventa baseline;
- [x] evidence bundle y gate de cierre están definidos;
- [x] once requisitos tienen trazabilidad;
- [x] documentación y breaking changes de Supabase fueron verificados;
- [x] manifiesto ejecutado en PostgreSQL local: 7 carriles, 9 unidades, aserciones superadas, cero falsos `PASS` y `ROLLBACK` confirmado;
- [x] ninguna unidad afirma backfill ejecutado, paridad observada o `PASS`;
- [x] `DATA-NORM-TRANS-008` permanece reservada.

#### 22. Continuidad

```text
TAREA CANÓNICAMENTE APROBADA
DATA-NORM-TRANS-006 — Activar reglas sobre nuevas escrituras de forma progresiva
        ↓
TAREA CANÓNICAMENTE APROBADA
DATA-NORM-TRANS-007 — Validar búsquedas, relaciones e integraciones después del backfill
        ↓
SIGUIENTE TAREA CANÓNICAMENTE APROBADA
DATA-NORM-TRANS-008 — Definir rollback y recuperación del valor anterior
```
