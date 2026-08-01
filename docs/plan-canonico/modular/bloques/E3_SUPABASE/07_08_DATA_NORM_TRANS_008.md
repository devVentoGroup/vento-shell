### ✅ DATA-NORM-TRANS-008 — Definir rollback y recuperación del valor anterior

**Estado:** APROBADA

**Condición canónica:** aprobada explícitamente por el usuario el `2026-08-01`

**Tarea anterior:** `DATA-NORM-TRANS-007 — Validar búsquedas, relaciones e integraciones después del backfill` — APROBADA

**Tarea siguiente:** `DATA-NORM-TRANS-009 — Definir evidencia de aprobación por dominio` — APROBADA

**Tipo de tarea:** diseño material de rollback lógico, recuperación de fuente/derivación, compensación y evidence bundle por unidad; manifiesto SQL ejecutable read-only; sin ejecutar rollback, restore, PITR, DDL/DML, migraciones, backfills, activaciones, compensaciones, consultas remotas ni cambios sobre VITAL

**Fecha de preparación documental:** `2026-08-01`

#### 1. Resultado concreto

Esta tarea produce:

1. nueve planes de rollback, uno por cada unidad de `005/007`;
2. cuatro clases cerradas de recuperación y su punto de no retorno;
3. la definición exacta de “valor anterior” por tipo de representación;
4. disparadores, fences, orden, idempotencia y autoridad de ejecución;
5. recuperación separada de configuración, fuente, derivación, relaciones y efectos hijos;
6. tratamiento antes y después del punto de no retorno;
7. verificación post-rollback funcional, relacional, de seguridad y rendimiento;
8. handoff de evidencia hacia `009` y BLOQUE R.

El artefacto [DATA-NORM-TRANS-008_ROLLBACK_PLAN.sql](./DATA-NORM-TRANS-008_ROLLBACK_PLAN.sql) materializa las clases y nueve unidades mediante tablas temporales, comprueba sus invariantes y termina en `ROLLBACK`.

#### 2. Estado real

```text
ROLLBACK_DESIGN_COMPLETE = true
PHYSICAL_BACKFILL_EXECUTED = false
ROLLBACK_EXECUTED = false
ROLLBACK_DRILL_EXECUTED = false
ROLLBACK_PASS_CLAIMED = false
```

Como no existe backfill físico de las unidades, hoy no hay un efecto que revertir ni un recovery point operativo que certificar. La aprobación de esta tarea fija el contrato de recuperación; no autoriza una reversa ni permite marcarla como ensayada.

#### 3. Qué significa “valor anterior”

| Tipo | Valor anterior recuperable | Regla |
| --- | --- | --- |
| `PRIMARY_VALUE` | before-image exacta ligada a PK, versión/hash y source cut | solo puede restaurarse si no pisa una escritura legítima posterior |
| `SEARCH_DERIVATION` | resultado reproducible de la versión anterior del algoritmo | se reconstruye; no se copia una clave vieja sin validar su fuente |
| `STRUCTURAL_DERIVATION` | componentes derivados desde la fuente vigente con versión anterior | se descarta/reconstruye el target; la fuente no se sobrescribe |
| `DISPLAY_OVERRIDE` | override anterior aún vigente y autorizado | se restaura por nueva revisión/versionado, nunca editando historia |
| `EXTERNAL_ORIGINAL` | bytes/hash recibidos originalmente | nunca debió sobrescribirse; si falta, el estado es incidente, no rollback normal |
| `HISTORICAL_SNAPSHOT` | snapshot inmutable de su tiempo | no se resincroniza ni reinterpreta con reglas actuales |
| `RELATIONSHIP` | referencia anterior exacta y su crosswalk | requiere before-image, reverse-delta y ausencia de ambigüedad posterior |
| `POLICY_OR_MAPPING_VERSION` | versión previa compatible, no inválida ni comprometida | se activa mediante otro evento; nunca por fallback silencioso |

Recuperar no significa “poner el texto como estaba” si la entidad, versión, owner, vigencia o hechos posteriores cambiaron. En ese caso se bloquea la inversa y se usa compensación o forward-fix.

#### 4. Clases cerradas de recuperación

| Clase | Aplicación | Antes del punto de no retorno | Después del punto de no retorno |
| --- | --- | --- | --- |
| `REVERSIBLE_THEN_COMPENSATABLE` | merge Gouda | abortar transacción o reverse-delta exacto con crosswalk | conservar crosswalk/historia y compensar forward con decisión de dominio |
| `REBUILD_DERIVATION` | UOM estructural, posiciones y búsqueda | suspender candidata, volver ruta a versión compatible y reconstruir | mismo mecanismo; la derivación es reemplazable si la fuente está intacta |
| `NO_MUTATION_TO_ROLL_BACK` | cuarentenas, PASS, personas y bloqueos | cerrar/superseder corrida o revisión; cero DML empresarial | cualquier mutación es incidente y exige recuperación selectiva autorizada |
| `ESCALATE_RECOVERY` | corrupción amplia, fuente/original perdido o estado inseparable | no continuar | restore selectivo, compensación o PITR extraordinario según blast radius |

`migration repair --status reverted` no pertenece a estas clases: solo corrige el historial de migraciones y no revierte SQL ni datos.

#### 5. Estados cerrados

| Estado | Significado |
| --- | --- |
| `NOT_EXECUTED` | plan definido, sin cambio físico ni drill |
| `BLOCKED_INPUT_MISSING` | falta recovery point, before-image, owner, digest, suite o paquete físico |
| `READY_FOR_DRILL` | paquete implementado y elegible para ensayo aislado |
| `DRILL_RUNNING` | ensayo autorizado en curso |
| `DRILL_PASS` | recuperación ensayada, reconciliada y dentro de RPO/RTO |
| `ROLLBACK_STARTED` | rollback real autorizado y en curso |
| `ROLLBACK_PASS` | autoridad, datos, contratos y operación recuperados con evidencia completa |
| `FORWARD_RECOVERY_PASS` | inversa insegura; compensación/forward-fix cerró sin ocultar historia |
| `ROLLBACK_FAILED` | un paso, invariante o reconciliación falló |
| `RECOVERY_ESCALATED` | el paquete pasó a restore selectivo/PITR o recuperación mayor |

No existen `PARTIAL_PASS`, “revertido técnicamente” ni éxito por retorno de HTTP. Un paquete con un solo destino pendiente no cierra.

#### 6. Registro de rollback por unidad

| # | `rollback_plan_id` | Unidad | Clase | Punto de no retorno | Recuperación principal | Estado actual |
| ---: | --- | --- | --- | --- | --- | --- |
| 10 | `DNT008-UOM-GOUDA-MERGE-V1` | merge Gouda | `REVERSIBLE_THEN_COMPENSATABLE` | primer hecho nuevo cuya semántica no pueda distribuirse inequívocamente entre los dos perfiles anteriores | abort/reverse-delta antes; compensación preservando crosswalk después | `BLOCKED_INPUT_MISSING` |
| 20 | `DNT008-UOM-STRUCTURAL-V1` | derivación UOM | `REBUILD_DERIVATION` | no destructivo mientras la fuente permanezca intacta | suspender versión, route back y reconstruir derivación anterior | `BLOCKED_INPUT_MISSING` |
| 30 | `DNT008-POSITION-SCOPE-V1` | scope de posiciones | `REBUILD_DERIVATION` | no destructivo mientras jerarquía fuente permanezca intacta | route back y rebuild por sede/ubicación/padre/código | `BLOCKED_INPUT_MISSING` |
| 40 | `DNT008-SEARCH-REPRESENTATIONS-V1` | claves de búsqueda | `REBUILD_DERIVATION` | no destructivo mientras fuente y corpus/versiones existan | retirar candidata de lecturas y reconstruir índice/derivación anterior | `BLOCKED_INPUT_MISSING` |
| 50 | `DNT008-VISIBLE-FORM-QUARANTINE-V1` | 46 observaciones | `NO_MUTATION_TO_ROLL_BACK` | no aplica | superseder/cerrar corrida; preservar fuente y casos | `BLOCKED_INPUT_MISSING` |
| 60 | `DNT008-DICTIONARY-QUARANTINE-V1` | tokens candidatos | `NO_MUTATION_TO_ROLL_BACK` | no aplica | suspender propuesta/reprocess; no tocar fuente | `BLOCKED_INPUT_MISSING` |
| 70 | `DNT008-PASS-PRESERVATION-V1` | ciclo de vida PASS | `NO_MUTATION_TO_ROLL_BACK` | no aplica | certificar no mutación; cualquier cambio indebido escala | `BLOCKED_INPUT_MISSING` |
| 80 | `DNT008-PERSON-PRESERVATION-V1` | nombres de persona | `NO_MUTATION_TO_ROLL_BACK` | no aplica | certificar no mutación; recuperar solo por identidad estable autorizada | `BLOCKED_INPUT_MISSING` |
| 90 | `DNT008-IDENTITY-BLOCKERS-V1` | ocho miembros bloqueados | `NO_MUTATION_TO_ROLL_BACK` | no aplica | preservar miembros/casos; una fusión indebida escala a compensación humana | `BLOCKED_INPUT_MISSING` |

#### 7. Paquete obligatorio antes de ejecutar o ensayar

Cada unidad requiere:

```text
rollback_run_id
rollback_plan_id
backfill_plan_id
validation_run_id
environment_identity
candidate_commit_sha
migration_history_digest
source_cut_reference
recovery_point_id_and_digest
before_image_manifest
crosswalk_and_reverse_delta_manifest
policy_mapping_and_algorithm_versions
version_set_digest
activation_event_id_and_previous_event_id
writer_fence_plan
ordered_steps
verification_suite_id
rpo_target
rto_target
point_of_no_return
rollback_commander
domain_owner_and_steward
independent_approver
evidence_bundle_id
```

Campos vacíos, recovery point no probado, rutas absolutas locales, credenciales o comandos sin versión mantienen `BLOCKED_INPUT_MISSING`.

#### 8. Disparadores de rollback

Se congela avance ante:

1. pérdida, duplicado, corrupción, huérfano o crosswalk ambiguo;
2. source cut, mapping, algoritmo, política o digest distinto;
3. writer no inventariado, doble autoridad o fence ineficaz;
4. resultado exacto de búsqueda perdido, ranking contractual roto o exposición fuera de scope;
5. relación, integración, ACK, evento o efecto hijo divergente/no conciliable;
6. fuente/original/snapshot sobrescrito o reinterpretado;
7. acceso no autorizado, secreto, PII, tenant/sede/producto mezclado o VITAL afectado;
8. timeout, deadlock, lock, backlog, latencia o throughput fuera de presupuesto;
9. telemetría/auditoría insuficiente para determinar efectos;
10. recovery point, owner, aprobación, ventana o rollback dejan de ser válidos.

La primera respuesta siempre es `FREEZE_CHANGE → STOP_NEW_EFFECTS → CAPTURE_WATERMARK`; nunca reintentar ni borrar por rango.

#### 9. Runbook universal

```text
FREEZE_CHANGE
→ CAPTURE_INCIDENT_WATERMARK_AND_UNKNOWN_OUTCOMES
→ STOP_NEW_EFFECTS
→ FENCE_CANDIDATE_WRITERS_AND_JOBS
→ SUSPEND_CANDIDATE_ACTIVATION
→ CLASSIFY_POINT_OF_NO_RETURN
→ SELECT_APPROVED_RECOVERY_CLASS
→ RESTORE_ROUTE_OR_REBUILD_DERIVATION_OR_COMPENSATE
→ RECONCILE_SOURCE_RELATIONS_DELTA_AND_CHILD_EFFECTS
→ RESTORE_SECURITY_OBSERVABILITY_AND_ALERTS
→ RUN_007_POST_ROLLBACK_SUITE
→ RECORD_OUTCOME_AND_HANDOFF_TO_009
```

Cada paso conserva actor, tiempo UTC, precondición, artefacto/comando versionado, intento, filas o destinos afectados, digest, resultado y correlation id.

#### 10. Recuperación de Gouda

Before-state obligatorio:

```text
non_survivor = 0f98e076-8e83-485b-be61-f4d9a7fbd3fe
survivor     = 270c3233-2650-4c32-9b3d-b0bee0a2d002
crosswalk    = non_survivor -> survivor
```

Antes del punto de no retorno:

1. fence de todos los writers;
2. confirmar versiones y watermark del merge;
3. revertir únicamente referencias incluidas en el reverse manifest;
4. restaurar estado del no sobreviviente mediante before-image exacta;
5. conservar crosswalk y auditoría como históricos/inactivos, no borrarlos;
6. reabrir writers solo después de la suite completa de `007`.

Después del punto de no retorno:

1. no dividir hechos nuevos por heurística, cantidad, frecuencia o último uso;
2. mantener sobreviviente y crosswalk como interpretación vigente mientras se investiga;
3. abrir decisión de dominio para cada hecho/relación no separable;
4. emitir compensaciones y reasignaciones explícitas con operaciones hijas idempotentes;
5. cerrar como `FORWARD_RECOVERY_PASS` únicamente tras reconciliar todos los destinos.

#### 11. Recuperación de derivaciones

Para UOM, posiciones y búsqueda:

1. suspender `activation_event_id` candidato y bloquear nuevas materializaciones;
2. mantener fuente, originales y snapshots intactos;
3. validar que la versión previa no esté `INVALIDATED`, comprometida o incompatible;
4. enrutar lecturas al conjunto previo de forma atómica o, si no es seguro, publicar una versión correctiva;
5. marcar derivaciones candidatas como no vigentes sin borrar evidencia;
6. reconstruir desde la fuente vigente bajo algoritmo/política anterior compatible;
7. invalidar cachés por versión, nunca por borrado global sin scope;
8. repetir búsqueda, relaciones, consumidores, RLS y rendimiento de `007`.

Una clave de búsqueda almacenada no se “restaura” copiando bytes de un snapshot si la fuente cambió legítimamente después; se vuelve a derivar desde la fuente actual bajo la versión seleccionada.

#### 12. Unidades sin mutación autorizada

Para texto visible, diccionario, PASS, personas y bloqueos:

- rollback normal significa cerrar, suspender, superseder o reabrir la corrida/revisión, conservando decisiones y evidencia;
- no se ejecuta DML sobre el valor empresarial porque `005` lo prohibió;
- si se detecta una mutación, el caso cambia a `RECOVERY_ESCALATED`;
- la recuperación exige PK estable, before-image, versión esperada, owner y análisis de hechos posteriores;
- personas nunca se recuperan emparejando nombres;
- PASS conserva estado/vigencia y no reactiva registros por coincidencia textual;
- los ocho miembros bloqueados no se fusionan ni separan automáticamente.

#### 13. Activación, mappings y políticas

1. Rollback de modo y rollback de datos son operaciones distintas.
2. Volver de `REVIEW` a `WARN` u `OBSERVE` no deshace escrituras confirmadas.
3. La transición crea otro `activation_event_id` vinculado al anterior.
4. Una versión previa solo vuelve si sigue compatible, segura y autorizada.
5. `INVALIDATED`, `RETIRED`, `REJECTED` o comprometida no puede reactivarse.
6. Mappings nuevos no reinterpretan entregas, snapshots ni decisiones históricas.
7. Shadow continúa sin efectos; no se convierte en dual write durante rollback.
8. Toda caché se invalida por coordinate/version/digest.

#### 14. Efectos hijos e integraciones

1. Se detienen nuevos comandos hijos, no el registro causal de la fuente.
2. Cada destino confirmado permanece confirmado; no se repite.
3. Pendientes y fallidos se reconcilian por `child_effect_id` e idempotency key.
4. `UNKNOWN_OUTCOME` consulta proveedor/destino antes de compensar o reintentar.
5. ACK, commit, evento, notificación y receipt conservan estados distintos.
6. Originales externos, archivos y payloads no se reescriben.
7. Rectificaciones son evidencia nueva vinculada.
8. Un proveedor que ya aceptó un efecto requiere compensación empresarial, no borrado local.

#### 15. Recovery point, RPO y RTO

Cada unidad fija un recovery point anterior al cambio:

- before-images y hashes de fuente;
- export/selectivo de referencias y crosswalks;
- versiones de política, mapping, algoritmo y activación;
- manifest de writers, consumers, jobs y efectos hijos;
- schema, funciones, grants y RLS aplicables;
- backup/PITR solo como recuperación extraordinaria.

`rpo_target = 0` para identidad, autorización, auditoría, originales, relaciones y efectos empresariales confirmados. Derivaciones reconstruibles podrán tener RPO técnico distinto solo si el contrato declara que no se pierde fuente ni capacidad empresarial. `rto_target` debe ensayarse; un número no probado mantiene bloqueada producción.

#### 16. Seguridad durante la reversa

1. No ampliar grants ni deshabilitar RLS para “facilitar” rollback.
2. Restaurar `USING`, `WITH CHECK`, owner, `search_path`, `EXECUTE` y `security_invoker` aprobados.
3. Service role, secretos y tokens no aparecen en scripts/logs.
4. Una credencial comprometida nunca se reactiva.
5. Actor técnico no sustituye owner de dominio.
6. Se repiten pruebas negativas por actor, tenant, sede, producto y VITAL.
7. Evidence bundle minimiza PII, texto personal y originales sensibles.
8. `SECURITY DEFINER` no se añade como bypass de recuperación.

#### 17. Verificación post-rollback

La unidad no cierra hasta repetir los siete carriles de `007`:

| Carril | Cierre requerido |
| --- | --- |
| fuente/outcome | before/after, mappings, outcomes y digests reconciliados |
| búsqueda | exactos, ranking, scope, `ñ`, cursores y autorizaciones correctos |
| relaciones | cero huérfanos, duplicados, crosswalk ambiguo o hecho perdido |
| integraciones | contratos, originales, ACK/eventos y retries conciliados |
| propagación | todos los child outcomes cerrados, sin duplicación |
| seguridad | RLS, grants y fronteras en estado aprobado |
| rendimiento | SLO/baseline recuperados y backlog drenado |

Además se verifica que el writer/autoridad sea único, la candidata esté suspendida, la versión efectiva sea la registrada y no haya residuos fuera del paquete.

#### 18. Cuándo usar restore selectivo o PITR

Solo `RECOVERY_ESCALATED` puede considerar restore/PITR ante corrupción amplia, fuente/original irrecuperable o blast radius no aislable. Antes se declara:

- punto recuperable real y lag;
- datos posteriores que se perderían;
- downtime estimado y aceptado;
- Storage fuera de la copia de base de datos;
- subscriptions/replication slots a tratar;
- plan de reconciliación posterior;
- aprobación extraordinaria.

PITR no es rollback rutinario. Una restauración completa puede dejar el proyecto inaccesible durante el proceso y no recupera objetos de Storage borrados, solo su metadata de base.

#### 19. Evidencia mínima

Cada drill o rollback entrega:

```text
manifest_and_versions
trigger_and_point_of_no_return_classification
recovery_point_and_before_image_digests
writer_authority_before_during_after
steps_attempts_commands_and_results
crosswalk_reverse_delta_and_compensations
unknown_outcomes_and_child_effects
schema_RLS_grants_and_contract_diff
007_post_rollback_suite
RPO_RTO_downtime_and_data_loss
final_outcome_and_open_actions
owners_approvals_timestamps_and_bundle_hash
```

Una captura del Dashboard, `migration repair`, restaurar un deploy o comparar conteos aislados no constituye prueba suficiente.

#### 20. Implementación futura en BLOQUE R

R deberá crear desde `vento-shell`:

1. migraciones forward-fix o de reversa mediante `supabase migration new` cuando haya SQL;
2. comandos/RPC idempotentes de fence, route back, reverse-delta y compensación;
3. snapshots/selectivos y manifests de before-images sin secretos;
4. tests pgTAP de estructura, funciones, RLS, grants e invariantes;
5. fixtures de aplicaciones e integraciones;
6. drill local/CI y staging con medición RPO/RTO;
7. runbook versionado y kill switch;
8. generador del evidence bundle;
9. gate que impida producción sin `DRILL_PASS`;
10. procedimiento extraordinario separado para restore/PITR.

No se editarán migraciones aplicadas ni se usará `migration repair` como reversa.

#### 21. Handoff hacia `DATA-NORM-TRANS-009`

`009` recibirá por dominio:

- rollback plan y recovery class;
- punto de no retorno y disparadores;
- recovery point, RPO/RTO y drill;
- owners y segregación;
- suite post-rollback;
- resultado o estado bloqueado;
- compensaciones y acciones abiertas;
- evidence bundle y hash.

`009` no podrá aprobar un dominio por tener plan: exigirá evidencia física cuando corresponda y distinguirá diseño aprobado de drill/rollback ejecutado.

#### 22. Referencias Supabase verificadas

| Fuente | Aplicación |
| --- | --- |
| [Supabase — Database Migrations](https://supabase.com/docs/guides/deployment/database-migrations) | las reversas de schema son migraciones nuevas; `migration repair` no revierte SQL |
| [Supabase — Database Backups](https://supabase.com/docs/guides/platform/backups) | daily backup, backup físico, dump y PITR no son equivalentes; restore implica downtime y límites de Storage |
| [Supabase — Testing Your Database](https://supabase.com/docs/guides/database/testing) | tests SQL/pgTAP aislados mediante transacción y rollback |
| [Supabase — Breaking changes](https://supabase.com/changelog?types=breaking-change) | revalidar plataforma antes del drill; cambios de Data API/extensiones no alteran este manifiesto |

#### 23. Trazabilidad de requisitos directos

| Requisito | Evidencia producida |
| --- | --- |
| `TREQ-DATA-083` | estados no activos conservan historia y no retornan por fallback |
| `TREQ-DATA-114` | revisión y rollback crean evidencia vinculada, sin editar decisiones |
| `TREQ-DATA-122` | backlog, casos, SLA y revisiones sobreviven transición y reversa |
| `TREQ-DATA-138` | fuente, override, copia, snapshot y respuesta conservan vigencia propia |
| `TREQ-DATA-156` | raíz, intentos y efectos hijos son idempotentes/reanudables |
| `TREQ-DATA-160` | rollback lógico, código y compensación permanecen distintos |
| `TREQ-DATA-170` | vigencia e historia no se borran ni liberan códigos implícitamente |
| `TREQ-DATA-183` | relaciones y hechos se inventariarán antes de consolidar/revertir |
| `TREQ-DATA-184` | crosswalks, hechos, externos y auditoría permanecen preservados |
| `TREQ-DATA-198` | fuente, derivaciones sincrónicas y auditoría revierten juntas |
| `TREQ-DATA-200` | misma operación lógica, expectativas y retries entre capas |
| `TREQ-DATA-208` | efectos hijos posteriores al commit se reconcilian por destino |
| `TREQ-DATA-226` | eventos tardíos no revierten estado por orden de llegada |
| `TREQ-DATA-238` | mapping previo solo retorna si es activo-compatible y no reinterpreta historia |
| `TREQ-DATA-239` | rollback/replay conserva original, efecto y operación correctiva |

#### 24. Criterios de aceptación documental

- [x] existen cuatro clases cerradas de recuperación;
- [x] “valor anterior” está definido para ocho tipos de representación/estado;
- [x] nueve unidades tienen clase, punto de no retorno, mecanismo y estado;
- [x] Gouda separa reversa exacta de compensación posterior;
- [x] UOM, posiciones y búsqueda se recuperan reconstruyendo derivaciones;
- [x] texto, diccionario, PASS, personas y bloqueos no reciben DML ficticio;
- [x] disparadores, fences, runbook e idempotencia están cerrados;
- [x] activación, datos, relaciones, integraciones y efectos hijos se recuperan separadamente;
- [x] RPO/RTO, restore selectivo y PITR tienen límites explícitos;
- [x] seguridad impide bypass, grants amplios y reactivación de secretos;
- [x] cierre exige repetir los siete carriles de `007`;
- [x] evidence bundle y handoff hacia `009` están definidos;
- [x] quince requisitos directos tienen trazabilidad;
- [x] documentación y breaking changes de Supabase fueron verificados;
- [x] manifiesto ejecutado en PostgreSQL local: 4 clases, 9 unidades, distribución `1/3/5`, aserciones superadas, cero falsos `PASS` y `ROLLBACK` confirmado;
- [x] no se ejecutó rollback, restore, PITR, DDL/DML, migración, backfill o consulta remota;
- [x] `DATA-NORM-TRANS-009` permanece reservada.

#### 25. Continuidad propuesta

```text
TAREA CANÓNICAMENTE APROBADA
DATA-NORM-TRANS-007 — Validar búsquedas, relaciones e integraciones después del backfill
        ↓
TAREA CANÓNICAMENTE APROBADA
DATA-NORM-TRANS-008 — Definir rollback y recuperación del valor anterior
        ↓
SIGUIENTE TAREA CANÓNICAMENTE APROBADA
DATA-NORM-TRANS-009 — Definir evidencia de aprobación por dominio
```
