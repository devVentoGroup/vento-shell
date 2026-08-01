### ✅ DATA-NORM-TRANS-006 — Activar reglas sobre nuevas escrituras de forma progresiva

**Estado:** APROBADA

**Condición canónica:** APROBADA EXPLÍCITAMENTE POR EL USUARIO — `2026-08-01`

**Tarea anterior:** `DATA-NORM-TRANS-005 — Definir backfills por dominio y lotes reversibles` — APROBADA

**Tarea siguiente:** `DATA-NORM-TRANS-007 — Validar búsquedas, relaciones e integraciones después del backfill` — APROBADA

**Tipo de tarea:** diseño material de activación progresiva por política, ambiente, cohorte y modo; manifiesto SQL ejecutable de solo lectura; sin activar reglas, modificar writers, ejecutar backfills, crear migraciones, aplicar DDL/DML, desplegar código, cambiar grants/RLS ni consultar ambientes remotos

**Fecha de preparación documental:** `2026-08-01`

#### 1. Resultado concreto

Esta tarea deja definidos y cerrados:

1. el registro de activación de las diez coordenadas alcanzadas por `DATA-NORM-TRANS-004/005`;
2. la secuencia obligatoria `LOCAL_CORPUS → STAGING_SHADOW → STAGING_WRITERS → PROD_SHADOW → PROD_CANARY → PROD_EXPANSION → PROD_FULL`;
3. los modos máximos permitidos por política y las promociones prohibidas;
4. el contrato de evaluación y commit para toda escritura nueva;
5. las compuertas de entrada, promoción, aborto, suspensión y rollback;
6. cohortes deterministas `5% → 25% → 50% → 100%` cuando aplique advertencia o revisión en producción;
7. idempotencia, concurrencia, batch/import, cuarentena, telemetría y seguridad;
8. el handoff exacto hacia BLOQUE R y `DATA-NORM-TRANS-007`.

El artefacto complementario [DATA-NORM-TRANS-006_ACTIVATION_PLAN.sql](./DATA-NORM-TRANS-006_ACTIVATION_PLAN.sql) materializa el registro y sus invariantes dentro de tablas temporales y termina siempre en `ROLLBACK`.

#### 2. Decisión de alcance

`ACTIVATION_DESIGN_COMPLETE_PHYSICAL_ACTIVATION_BLOCKED`

La tarea desarrolla el plan de activación, pero no afirma que una regla esté operativa. A la fecha:

- los backfills de `005` no han sido ejecutados ni reconciliados físicamente;
- target, servicio, RPC, telemetría y estrategia de writers/delta siguen pendientes donde aplican;
- ninguna política superó las catorce puertas de `DATA-NORM-ARC-010` para `ENFORCE_CERTIFIED_UNIQUENESS`;
- por tanto, no existe una activación válida en local, staging o producción que esta tarea pueda registrar como completada.

La aprobación de este documento autorizará el diseño y su incorporación canónica. No autorizará ejecutar la activación.

#### 3. Invariantes no negociables

1. Aprobación de política, materialización, reconciliación y activación son operaciones distintas.
2. Una escritura fija un único `version_set_digest` antes de evaluar y lo revalida dentro del commit.
3. Aplicación, servicio, RPC, job e import no podrán ejecutar reglas distintas para la misma coordenada.
4. `SEARCH_FORM_KEY` y `SEARCH_ACCENT_KEY` sirven para descubrimiento; nunca adquieren autoridad de identidad.
5. Un modo superior no puede activarse si la política solo permite un modo inferior.
6. `OBSERVE_ONLY` no modifica la respuesta empresarial ni se presenta como protección activa.
7. `DUAL_EVALUATION_SHADOW` no emite efectos, warnings, eventos funcionales ni escrituras derivadas.
8. No existe dual write implícito ni fallback a reglas locales, caché o versión anterior.
9. Un fallo técnico, dependencia ausente o política obsoleta no se traduce a duplicado ni a éxito.
10. Toda promoción es explícita, atómica, idempotente, auditable y reversible al modo anterior.
11. El rollback de configuración no deshace escrituras empresariales ya confirmadas; estas conservan evidencia y, si corresponde, usan compensación separada.
12. Ninguna activación permite mutar nombres de persona, originales externos o snapshots históricos.

#### 4. Modos operativos cerrados

| Modo | Efecto sobre una escritura nueva | Autoridad |
| --- | --- | --- |
| `OBSERVE_ONLY` | evalúa, registra candidatos y métricas; la respuesta y el commit no cambian | servicio evalúa; RPC conserva correlación sin bloquear |
| `WARN_EXPLICIT_CONFIRMATION` | presenta candidatos explicables y exige confirmación autorizada | servicio explica; RPC revalida confirmación, política, scope y versiones |
| `REVIEW_REQUIRED_BEFORE_WRITE` | impide commit y abre/reutiliza un caso hasta decisión compatible | servicio clasifica; RPC confirma estado vigente de la revisión |
| `ENFORCE_CERTIFIED_UNIQUENESS` | rechaza únicamente una violación exacta de política certificada y activa | defensa atómica aprobada en base; nunca búsqueda tolerante |

Una política podrá omitir modos intermedios solo si su matriz lo exige y existe decisión explícita. Nunca podrá saltar directo a `ENFORCE_CERTIFIED_UNIQUENESS`.

#### 5. Registro ejecutable por coordenada

| # | `activation_plan_id` | Coordenada/política | Estado actual | Máximo permitido | Primera activación futura | Bloqueo actual |
| ---: | --- | --- | --- | --- | --- | --- |
| 10 | `DNT006-PRODUCT-NAME-V1` | producto + frontera de catálogo + nombre normalizado | `BLOCKED` | `WARN_EXPLICIT_CONFIRMATION` | `LOCAL_CORPUS/OBSERVE_ONLY` | Chai, Latte Frío y Choco Bites; identidad y relaciones abiertas |
| 20 | `DNT006-REMITTANCE-CATEGORY-V1` | sede + categoría de remisión + nombre | `BLOCKED` | `REVIEW_REQUIRED_BEFORE_WRITE` | `LOCAL_CORPUS/OBSERVE_ONLY` | expediente `REM-001`, routing y autoridad incompletos |
| 30 | `DNT006-UOM-LABEL-DISCOVERY-V1` | etiqueta UOM sin contexto | `REJECTED_FOR_IDENTITY` | `OBSERVE_ONLY` | observación de falsos positivos únicamente | scope estructural insuficiente; promoción prohibida |
| 40 | `DNT006-UOM-FULL-COORDINATE-V1` | producto + `usage_context` + componentes UOM | `BLOCKED` | `REVIEW_REQUIRED_BEFORE_WRITE` | `LOCAL_CORPUS/OBSERVE_ONLY` | Gouda no ejecutado; target, writers y reconciliación pendientes |
| 50 | `DNT006-POSITION-NAME-DISCOVERY-V1` | ubicación + nombre de posición | `REJECTED_FOR_IDENTITY` | `OBSERVE_ONLY` | observación de falsos positivos únicamente | padre/código ausentes; promoción prohibida |
| 60 | `DNT006-POSITION-FULL-SCOPE-V1` | sede + ubicación + padre + código | `BLOCKED` | `REVIEW_REQUIRED_BEFORE_WRITE` | `LOCAL_CORPUS/OBSERVE_ONLY` | target, writer path, corpus físico y reconciliación pendientes |
| 70 | `DNT006-PASS-TEMPORAL-V1` | sede + producto + código + vigencia activa | `BLOCKED` | `WARN_EXPLICIT_CONFIRMATION` | `LOCAL_CORPUS/OBSERVE_ONLY` | política de solapamiento temporal y códigos incompleta |
| 80 | `DNT006-PERSON-NAME-DISCOVERY-V1` | fuente + enlace estable + nombre de persona | `NON_UNIQUE_DISCOVERY_ONLY` | `OBSERVE_ONLY` | observación minimizada y autorizada | privacidad e identidad prohíben unicidad textual y promoción |
| 90 | `DNT006-SEARCH-DERIVATIONS-V1` | dominio + entidad + campo + PK estable | `BLOCKED` | `OBSERVE_ONLY` | `STAGING_SHADOW/OBSERVE_ONLY` | derivaciones, target, writer delta y paridad no materializados |
| 100 | `DNT006-VISIBLE-DICTIONARY-RULES-V1` | regla + dominio + entidad + campo + PK | `BLOCKED` | `REVIEW_REQUIRED_BEFORE_WRITE` | `LOCAL_CORPUS/OBSERVE_ONLY` | 46 observaciones sin deduplicar y tokens sin coordenada certificada |

Resultado actual del registro:

```text
ACTIVE_NOW = 0
READY_FOR_PRODUCTION = 0
ENFORCE_CERTIFIED_UNIQUENESS_ELIGIBLE = 0
BLOCKED_OR_DISCOVERY_ONLY = 10
```

#### 6. Secuencia obligatoria de activación

| Orden | Etapa | Ambiente y audiencia | Conducta | Puerta de salida |
| ---: | --- | --- | --- | --- |
| 10 | `LOCAL_CORPUS` | PostgreSQL/Supabase local; fixtures completos | replay determinista, negativos, carreras, idempotencia y RLS; sin datos operativos | corpus completo aprobado y cero divergencia inexplicada |
| 20 | `STAGING_SHADOW` | staging; todos los writers alcanzados | evaluación candidata paralela sin efecto | tres corridas comparables; métricas, seguridad y paridad en `PASS` |
| 30 | `STAGING_WRITERS` | staging; UI, RPC, batch, import, job e integración por separado | modo máximo autorizado para staging | resultados equivalentes por canal y rollback ensayado |
| 40 | `PROD_SHADOW` | producción; 100% de escrituras elegibles, efecto 0% | telemetría minimizada; respuesta empresarial intacta | ventana declarada, sin drift, bypass, pérdida ni doble efecto |
| 50 | `PROD_CANARY` | cohorte determinista 5% | `WARN` o `REVIEW` según política; nunca `ENFORCE` | compuertas estables y owner aprueba promoción |
| 60 | `PROD_EXPANSION_25` | cohorte acumulada 25% | mismo modo y versión | sin regresión y reconciliación por cohorte |
| 70 | `PROD_EXPANSION_50` | cohorte acumulada 50% | mismo modo y versión | sin regresión y rollback aún ejecutable |
| 80 | `PROD_FULL` | 100% de writers elegibles | modo autorizado, sin cohortes omitidas | estabilización completa y evidencia por canal |

La cohorte se asignará mediante hash estable de `tenant/site + actor/service + policy_coordinate`, salado y versionado para el rollout. No se seleccionará por orden de llegada, valor normalizado, tipo de resultado ni decisión manual ad hoc. Jobs, imports y canales de bajo volumen se tratan como cohortes explícitas, no se diluyen dentro del porcentaje interactivo.

#### 7. Reglas de promoción

Una etapa solo puede promoverse si todas son verdaderas:

1. política en `APPROVED_PENDING_ACTIVATION` o `ACTIVE` para la transición aplicable;
2. materialización y reconciliación de `005` terminadas en BLOQUE R cuando corresponda;
3. target, writers, delta, servicio, RPC, tipos y documentación desplegados en el ambiente;
4. mismo `version_set_digest` entre evaluación, commit, telemetría y replay;
5. inventario de writers y consumidores sin desconocidos;
6. pruebas positivas, negativas, ambiguas, temporales, autorización, RLS, concurrencia e idempotencia aprobadas;
7. tres corridas comparables de rendimiento y seguridad en `PASS` antes del primer impacto de producción;
8. rollback del modo ensayado y versión anterior disponible para lectura histórica;
9. cero pérdida, duplicado, doble efecto, deadlock, acceso no autorizado, bypass o secreto expuesto;
10. latencia `p50/p95 ≤ +10%`, `p99 ≤ +15%`, throughput no inferior a `-10%` y error inesperado no mayor a `+0,25` puntos porcentuales frente al baseline, respetando cualquier SLO más estricto;
11. falsos positivos confirmados igual a cero antes de cualquier modo bloqueante; todo falso negativo conocido está clasificado y tratado;
12. owner de dominio, steward de datos y autoridad de seguridad aprueban la promoción correspondiente.

No se fija un número universal de escrituras ni una ventana ficticia. Cada `activation_event` deberá declarar duración, carga esperada y cobertura de clases con base en el baseline real; una ventana sin volumen o sin cobertura no produce evidencia suficiente.

#### 8. Contrato de escritura nueva

```text
1. RECEIVE original + stable identity + context + idempotency key
2. AUTHORIZE actor/service and requested capability
3. RESOLVE policy coordinate and one active version_set_digest
4. LOAD current source/version and expected state
5. EVALUATE in domain service
6. RETURN observation, warning, review requirement or certified conflict
7. RPC REVALIDATES authorization, source, scope, policy, digest and decision
8. COMMIT business effect + root audit atomically, or return a closed non-success outcome
9. EMIT child effects after commit and reconcile them independently
```

Para `OBSERVE_ONLY`, los pasos 5 y 8 no pueden alterar el valor empresarial por el resultado observado. Para `DUAL_EVALUATION_SHADOW`, la ruta candidata termina antes de cualquier efecto. Batch, import, cron y herramientas operativas atravesarán el mismo servicio y comando que una escritura interactiva.

#### 9. Idempotencia y concurrencia

Cada operación conservará:

```text
logical_operation_id
operation_class
actor_or_service
entity_and_field_coordinate
source_version_or_hash
requested_action
version_set_digest
business_correlation
idempotency_key
payload_and_preconditions_digest
activation_event_id
cohort_id
attempt_id
root_outcome
child_outcomes
```

Reglas:

1. misma clave y mismo payload devuelven el resultado lógico confirmado sin repetir efectos;
2. misma clave con payload, fuente, versión o precondición distinta devuelve `BLOCKED_CONFLICT/IDEMPOTENCY_PAYLOAD_CONFLICT`;
3. fuente, política, caso o digest obsoleto bloquea y exige reevaluación;
4. timeout consulta primero el resultado; nunca crea una operación nueva automáticamente;
5. evaluación, mutación, materialización, transición de regla, decisión de revisión y propagación conservan clases idempotentes distintas;
6. import y lote conservan archivo/hash/hoja/fila/celda, batch, chunk, digest por fila y outcome por elemento;
7. reanudación omite efectos confirmados y mantiene corte, política y versiones;
8. una carrera no se resuelve por último escritor ni por warning de interfaz.

#### 10. Evento atómico de activación

Cada cambio de etapa o modo requiere un registro inmutable con:

```text
activation_event_id
policy_coordinate
policy_version_id
from_state_and_mode
to_state_and_mode
activation_environment
cohort_definition_version
activation_scope
version_set_digest
expected_previous_activation_version
effective_from_utc
effective_to_utc
owner
approving_authorities
evidence_bundle_id
rollback_target_event_id
idempotency_key
payload_digest
```

El evento cambia atómicamente el conjunto efectivo. Repetir el mismo evento compatible devuelve el resultado previo; reutilizar su identidad con otro payload bloquea. Una fecha futura sin evento válido no activa nada.

#### 11. Telemetría mínima por política, ambiente, canal y cohorte

- escrituras recibidas, elegibles, evaluadas, omitidas y bloqueadas;
- versión de política, `version_set_digest` y `activation_event_id`;
- candidatos por clase, warnings, confirmaciones, revisiones y rechazos;
- falsos positivos y negativos confirmados;
- divergencia active/shadow y razón clasificada;
- latencia `p50/p95/p99`, throughput, timeout, error y lock wait;
- conflictos concurrentes, idempotency replays y payload conflicts;
- outcomes por elemento, cuarentenas, reintentos y efectos hijos pendientes;
- bypasses y writers desconocidos detectados;
- rollback/suspensión, motivo, tiempo y residuos.

No se registrarán secretos, tokens, nombres personales completos, payloads externos íntegros ni texto libre innecesario. Los valores de comparación se minimizarán o usarán referencias/digests conforme a su clasificación.

#### 12. Aborto, suspensión y rollback

| Señal | Acción inmediata | Estado resultante |
| --- | --- | --- |
| acceso no autorizado, bypass, secreto o cruce de tenant/producto | kill switch y suspensión global de la coordenada | `SUSPENDED_SECURITY` |
| pérdida, corrupción, duplicado, doble efecto o deadlock | detener promoción y writers afectados; preservar evidencia | `SUSPENDED_INTEGRITY` |
| `version_set_digest` distinto, fuente obsoleta o política ausente | bloquear operación; no fallback | `SUSPENDED_VERSION_DRIFT` |
| falso positivo en modo bloqueante | volver al modo anterior para la cohorte; abrir caso | `ROLLED_BACK_POLICY_QUALITY` |
| presupuesto de rendimiento excedido | volver a etapa previa o sombra | `ROLLED_BACK_PERFORMANCE` |
| writer/canal desconocido o sin telemetría | congelar expansión | `PROMOTION_BLOCKED_COVERAGE` |

El rollback será una nueva transición atómica hacia el último `activation_event_id` compatible. Conserva decisiones, confirmaciones, casos, auditoría y efectos empresariales previos. Una escritura confirmada que requiera corrección usa el plan compensatorio de su dominio; no se revierte reescribiendo historia ni reactivando silenciosamente reglas antiguas.

#### 13. Cuarentena y resultados cerrados

Los ingresos ambiguos o incompatibles usarán exactamente:

`QUARANTINED_NEW`, `AWAITING_AUTHENTICITY`, `AWAITING_CONTRACT`, `AWAITING_MAPPING`, `AWAITING_DOMAIN_AUTHORITY`, `UNDER_RECONCILIATION`, `RESOLVED_REPROCESSABLE` o `RESOLVED_NO_EFFECT`.

Cada elemento termina en uno de los outcomes definidos por `TREQ-SUPABASE-1745`; no existe `SUCCESS` genérico. Reprocess es una operación nueva vinculada, explícita e idempotente, y nunca sobrescribe el original.

#### 14. Responsabilidades por capa

| Capa | Responsabilidad | Prohibido |
| --- | --- | --- |
| aplicación/adaptador | capturar original, contexto, identidad e intención; presentar warning/review | normalizar como autoridad, confirmar en silencio o usar service key |
| servicio de dominio | resolver política y evaluar señales explicables | mutar base directamente o inventar fallback local |
| RPC/comando servidor | autorizar, revalidar y confirmar efecto + auditoría raíz | confiar en actor/política enviados sin validación |
| trigger/constraint | defender invariante local, exacta, acotada y certificada | fuzzy matching, clustering, red, workflow o selección de sobreviviente |
| job/import | usar el mismo comando por elemento y conservar checkpoint/outcome | SQL paralelo con semántica distinta o éxito parcial oculto |

#### 15. Seguridad de una implementación futura

1. Todo artefacto físico se creará desde `vento-shell` mediante migración versionada en BLOQUE R.
2. Tablas en schemas expuestos tendrán RLS habilitado, grants mínimos y políticas explícitas.
3. Preview, observación, confirmación, revisión, activación, suspensión, exportación y replay serán capacidades distintas.
4. `SECURITY DEFINER` no se usará como bypass general; cualquier uso excepcional deberá fijar `search_path`, privilegios mínimos y pruebas negativas.
5. Service role y secretos no llegarán a aplicaciones cliente.
6. La RPC revalidará RLS/autorización aun cuando la interfaz oculte la acción.
7. Una ruta sombra no podrá emitir eventos empresariales ni mutaciones indirectas.
8. Ninguna política ampliará audiencia, grants o frontera de producto por ser una transición.

#### 16. Qué debe implementar BLOQUE R

Por cada coordenada que cierre sus bloqueos, R deberá producir en `vento-shell`:

1. migración de catálogos/estado de política, telemetría y soporte idempotente;
2. servicio de evaluación y RPC transaccional con autorización explícita;
3. adaptaciones de todos los writers enumerados;
4. tests SQL/pgTAP de estructura, RLS, grants, concurrencia e invariantes;
5. fixtures de aplicación, batch, import, job e integración;
6. comando de activación/suspensión idempotente y kill switch;
7. dashboards y alertas por política/cohorte;
8. evidencia de cada etapa y evento de promoción;
9. migración de defensa exacta solo si una política alcanza las catorce puertas;
10. plan de rollback y compensación probado.

R no podrá convertir este manifiesto temporal en migración sin resolver primero targets, schemas, owners, permisos, productores y mecanismo físico de `DATA-NORM-ARC-011`.

#### 17. Handoff hacia `DATA-NORM-TRANS-007`

`007` validará búsquedas, relaciones e integraciones después de un backfill real. Recibirá de `006`:

- coordenada, versión, ambiente, cohorte y `activation_event_id`;
- baseline y evidencia active/shadow;
- writers cubiertos y desconocidos;
- consultas/search keys sin autoridad de identidad;
- relaciones, crosswalks, proyecciones y efectos hijos a reconciliar;
- outcomes, cuarentenas, rollbacks y divergencias;
- el mismo `version_set_digest` usado al escribir.

Mientras no exista ejecución física de `005/R`, `007` podrá diseñar su matriz de validación, pero no declarar paridad post-backfill observada.

#### 18. Referencias Supabase verificadas

| Fuente | Aplicación en esta tarea |
| --- | --- |
| [Supabase — Local development with schema migrations](https://supabase.com/docs/guides/local-development/overview) | reservar cambios reales a migraciones versionadas, locales y revisables |
| [Supabase — Testing your database](https://supabase.com/docs/guides/database/testing) | exigir pruebas SQL/pgTAP y `ROLLBACK` para estructura, funciones y RLS |
| [Supabase — Row Level Security](https://supabase.com/docs/guides/database/postgres/row-level-security) | habilitar RLS y grants explícitos en objetos futuros de schemas expuestos |
| [Supabase — Database migrations](https://supabase.com/docs/guides/deployment/database-migrations) | mantener archivos y tabla de historial de migraciones sincronizados antes de desplegar |

#### 19. Trazabilidad de requisitos directos

| Requisito | Evidencia producida |
| --- | --- |
| `TREQ-SUPABASE-1744` | corrida, batch, chunk, checkpoint y retry preservan corte/versiones y consultan resultado antes de reintentar |
| `TREQ-SUPABASE-1745` | outcome cerrado por elemento y prohibición de éxito genérico |
| `TREQ-DATA-154` | componentes obligatorios de idempotency key y digest independiente |
| `TREQ-DATA-155` | replay compatible reutiliza resultado; payload incompatible bloquea |
| `TREQ-DATA-156` | seis clases idempotentes y efectos hijos diferenciados |
| `TREQ-DATA-157` | revalidación de fuente, coordenada, digest y estado antes del commit |
| `TREQ-DATA-186` | decisiones y transiciones no se duplican por carrera o retry |
| `TREQ-DATA-194` | RPC autorizada conserva frontera transaccional del efecto |
| `TREQ-DATA-200` | una operación lógica se correlaciona entre todas las capas |
| `TREQ-DATA-207` | UI, batch, import, job e integración usan el mismo servicio/comando |
| `TREQ-DATA-225` | identidad externa contextual y conflicto por digest distinto |
| `TREQ-DATA-227` | procedencia por archivo/fila, atomicidad explícita y reanudación sin duplicado |
| `TREQ-DATA-228` | ocho estados exactos de cuarentena y reprocess idempotente |

#### 20. Criterios de aceptación documental

- [x] existe un manifiesto SQL ejecutable y read-only con diez coordenadas y ocho etapas;
- [x] las diez coordenadas tienen estado actual, máximo, primer paso y bloqueo;
- [x] ninguna coordenada afirma activación física ni elegibilidad para enforcement;
- [x] `OBSERVE`, `WARN`, `REVIEW` y `ENFORCE` tienen conducta y autoridad cerradas;
- [x] cohortes de producción usan asignación determinista y progresión `5/25/50/100`;
- [x] promociones exigen gates funcionales, seguridad, rendimiento, RLS, paridad y rollback;
- [x] escritura interactiva, batch, import, job e integración comparten servicio y RPC;
- [x] idempotencia, concurrencia, timeout, outcomes y cuarentena están cerrados;
- [x] aborto, suspensión, rollback y compensación no reescriben historia;
- [x] responsabilidades por capa impiden normalizadores paralelos y fuzzy matching en triggers;
- [x] trece requisitos directos tienen trazabilidad;
- [x] documentación oficial vigente de Supabase fue verificada;
- [x] manifiesto ejecutado en PostgreSQL local: 10 coordenadas, 8 etapas, aserciones superadas y `ROLLBACK` confirmado;
- [x] no se ejecutó DDL/DML persistente, migración, backfill, activación, despliegue o consulta remota;
- [x] `DATA-NORM-TRANS-007` permanece reservada.

#### 21. Continuidad

```text
TAREA CANÓNICAMENTE APROBADA
DATA-NORM-TRANS-005 — Definir backfills por dominio y lotes reversibles
        ↓
TAREA CANÓNICAMENTE APROBADA
DATA-NORM-TRANS-006 — Activar reglas sobre nuevas escrituras de forma progresiva
        ↓
SIGUIENTE TAREA CANÓNICAMENTE APROBADA
DATA-NORM-TRANS-007 — Validar búsquedas, relaciones e integraciones después del backfill
```
