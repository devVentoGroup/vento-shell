### ✅ DATA-NORM-TRANS-009 — Definir evidencia de aprobación por dominio

**Estado:** APROBADA

**Condición canónica:** aprobada explícitamente por el usuario el `2026-08-01`

**Tarea anterior:** `DATA-NORM-TRANS-008 — Definir rollback y recuperación del valor anterior` — APROBADA

**Tarea siguiente:** `SUPA-TRANS-016 — Aprobar transición antes de iniciar BLOQUE R` — PROPUESTA PARA APROBACIÓN

**Tipo de tarea:** contrato material de evidencia, autoridades, decisiones y revocación por dominio; manifiesto SQL ejecutable read-only; sin conceder aprobaciones operativas, ejecutar migraciones, backfills, activaciones, rollback, DDL/DML ni consultas remotas

**Fecha de preparación documental:** `2026-08-01`

#### 1. Resultado concreto

Esta tarea produce:

1. siete paquetes de aprobación que cubren, sin duplicados ni vacíos, las nueve unidades de normalización;
2. diez compuertas de evidencia desde el diseño hasta producción;
3. autoridades mínimas y segregación de funciones por dominio;
4. un expediente inmutable y verificable para cada decisión;
5. estados de decisión, vigencia, rechazo, suspensión y revocación;
6. reglas para invalidar una aprobación cuando cambia el candidato, el entorno o la evidencia;
7. el handoff exacto hacia `SUPA-TRANS-016` y BLOQUE R.

El artefacto [DATA-NORM-TRANS-009_DOMAIN_APPROVAL_EVIDENCE.sql](./DATA-NORM-TRANS-009_DOMAIN_APPROVAL_EVIDENCE.sql) materializa compuertas, paquetes y cobertura de unidades en tablas temporales, prueba sus invariantes y termina en `ROLLBACK`.

#### 2. Estado real y límite de la tarea

```text
EVIDENCE_CONTRACT_DEFINED = true
DESIGN_CHAIN_001_TO_008_APPROVED = true
PHYSICAL_IMPLEMENTATION_EXECUTED = false
LOCAL_OPERATIONAL_EVIDENCE_COMPLETE = false
STAGING_EVIDENCE_COMPLETE = false
PRODUCTION_EVIDENCE_COMPLETE = false
DOMAIN_OPERATIONAL_APPROVALS_GRANTED = 0
```

La aprobación de esta tarea aceptará **el contrato de evidencia**, no aprobará datos ni despliegues. Ningún dominio puede declararse aprobado para local, staging o producción solo porque `001..009` estén documentalmente aprobadas.

#### 3. Principios obligatorios

1. **Especificidad:** toda decisión pertenece a un dominio, candidato, versión, entorno y alcance concretos.
2. **Reproducibilidad:** un tercero debe poder reconstruir el resultado desde referencias y digests.
3. **Inmutabilidad:** una decisión emitida no se reescribe; se agrega una nueva decisión que supersede, suspenda o revoque.
4. **Separación ambiental:** evidencia local no equivale a staging y evidencia de staging no equivale a producción.
5. **Segregación:** quien implementa no puede ser la única persona que acepta el resultado.
6. **Prueba proporcional:** cada dominio presenta evidencia funcional, relacional, de seguridad, rendimiento y recuperación aplicable.
7. **Ausencia explícita:** una prueba no ejecutada se registra como `MISSING_NOT_EXECUTED`, nunca como `PASS`.
8. **Privacidad:** el expediente no contiene secretos, tokens, PII sin minimizar ni rutas absolutas locales.
9. **Trazabilidad:** archivos, consultas, logs y reportes se referencian por identificador estable y digest.
10. **Revocabilidad:** cualquier deriva relevante invalida la decisión anterior hasta una nueva revisión.

#### 4. Los siete paquetes de aprobación

| Orden | `domain_key` | Unidades cubiertas | Propósito de aprobación |
|---:|---|---|---|
| 10 | `INVENTORY_UOM` | `GOUDA_ALIAS_MERGE`, `UOM_STRUCTURAL_DERIVATION` | Aceptar equivalencias Gouda y estructura UOM sin alterar cantidad, costo o conversión |
| 20 | `INVENTORY_LOCATIONS` | `INVENTORY_POSITION_SCOPE` | Aceptar alcance y relaciones de posiciones por organización/sede/almacén |
| 30 | `CROSS_DOMAIN_SEARCH` | `SEARCH_REPRESENTATIONS` | Aceptar representaciones de búsqueda sin falsos positivos críticos ni pérdida de descubribilidad |
| 40 | `VISIBLE_BUSINESS_TEXT` | `VISIBLE_FORM_CANDIDATES`, `DICTIONARY_CANDIDATES` | Aceptar texto visible y diccionarios con revisión humana del significado |
| 50 | `PASS_CATALOG_AND_REQUEST_POLICIES` | `PASS_LIFECYCLE_PRESERVATION` | Certificar que PASS conserva catálogo, solicitudes y políticas sin mutación indebida |
| 60 | `IDENTITY_AND_WORKFORCE` | `PERSON_NAME_PRESERVATION` | Certificar preservación de identidad, nombres y vínculos laborales con control de privacidad |
| 70 | `PRODUCT_AND_REMITTANCE_IDENTITY` | `OPEN_IDENTITY_BLOCKERS` | Resolver o rechazar bloqueos de identidad de producto/remisión antes de cualquier restricción |

Cada una de las nueve unidades aparece exactamente una vez. Un paquete puede tener varias unidades porque comparten autoridad semántica y riesgo, pero sus resultados continúan discriminados por unidad.

#### 5. Diez compuertas de evidencia

| Orden | `gate_key` | Evidencia mínima | Estado actual |
|---:|---|---|---|
| 10 | `DESIGN_CHAIN_001_008` | Tareas `001..008` aprobadas, artefactos enlazados y trazabilidad | `PASS_DOCUMENTAL` |
| 20 | `PHYSICAL_PACKAGE_AND_MIGRATIONS` | Migraciones reales, checksum, orden y candidato de código | `MISSING_NOT_EXECUTED` |
| 30 | `BASELINE_DRYRUN_COLLISIONS` | Baseline, dry-run y colisiones recalculados sobre el entorno objetivo | `MISSING_NOT_EXECUTED` |
| 40 | `BACKFILL_AND_OUTCOMES` | Lotes, filas intentadas/afectadas/omitidas/fallidas y reconciliación | `MISSING_NOT_EXECUTED` |
| 50 | `ACTIVATION_AND_WRITERS` | Etapa activa, versión de reglas y cobertura de escritores | `MISSING_NOT_EXECUTED` |
| 60 | `POST_BACKFILL_VALIDATION` | Los siete carriles de `007`, por unidad y consumidor | `MISSING_NOT_EXECUTED` |
| 70 | `SECURITY_RLS_GRANTS` | RLS, grants, roles, exposición, privacidad y pruebas positivas/negativas | `MISSING_NOT_EXECUTED` |
| 80 | `PERFORMANCE_AND_OPERABILITY` | Planes, latencia, locks, error budget, observabilidad y capacidad | `MISSING_NOT_EXECUTED` |
| 90 | `ROLLBACK_DRILL` | Clase `008`, precondiciones, ensayo, RPO/RTO y verificación posterior | `MISSING_NOT_EXECUTED` |
| 100 | `ENVIRONMENT_PARITY_AND_SIGNOFF` | Paridad local/CI/staging/producción y firmas vigentes | `MISSING_NOT_EXECUTED` |

`PASS_DOCUMENTAL` solo prueba que el diseño existe. No satisface ninguna compuerta operacional.

#### 6. Contenido obligatorio del expediente

Cada `domain_approval_bundle` debe contener, como mínimo:

```text
bundle_id
domain_key
approval_stage
decision_id
decision_outcome
candidate_commit_sha
schema_migration_digest
normalization_rule_version_set_digest
environment_id_and_project_ref
covered_unit_ids
evidence_gate_results
baseline_and_dry_run_refs
collision_resolution_refs
backfill_run_and_batch_refs
activation_event_refs
validation_bundle_refs
security_and_performance_refs
rollback_plan_and_drill_refs
open_exceptions_and_expiry
required_authorities_and_signatures
created_at_utc
supersedes_decision_id
bundle_sha256
```

Las referencias deben señalar artefactos durables. Una captura de pantalla aislada, una descripción verbal o una salida sin identidad de entorno no son evidencia suficiente.

#### 7. Etapas y resultados permitidos

Etapas cerradas:

```text
DESIGN
LOCAL_IMPLEMENTATION
STAGING
PRODUCTION_COHORT
PRODUCTION_FULL
```

Resultados cerrados:

```text
APPROVED
APPROVED_WITH_EXPIRING_EXCEPTIONS
REJECTED
SUSPENDED
REVOKED
```

Una decisión debe combinar etapa y resultado, por ejemplo `STAGING/APPROVED`. No existen los estados ambiguos `OK`, `VALIDATED` ni `READY` como aprobación final.

#### 8. Autoridades y segregación

| Autoridad | Responsabilidad que firma |
|---|---|
| `DOMAIN_OWNER` | Semántica, integridad de negocio y excepciones aceptables |
| `DATA_STEWARD` | Linaje, cobertura, calidad, colisiones y reconciliación |
| `PLATFORM_DATABASE_OWNER` | Migraciones, locks, reversibilidad, paridad y operación PostgreSQL |
| `SECURITY_PRIVACY_OWNER` | RLS, grants, exposición, datos sensibles y pruebas negativas |
| `CONSUMER_OWNER` | Contratos, búsquedas, relaciones e integraciones consumidoras |
| `QA_PERFORMANCE_OWNER` | Regresión, carga, observabilidad y límites operativos |
| `RELEASE_AUTHORITY` | Decisión de promoción para el entorno y ventana concreta |

Reglas:

- `DOMAIN_OWNER` y `DATA_STEWARD` son obligatorios para todos los paquetes.
- `PLATFORM_DATABASE_OWNER` y `SECURITY_PRIVACY_OWNER` son obligatorios desde `LOCAL_IMPLEMENTATION`.
- los propietarios de consumidores afectados deben firmar antes de staging;
- `QA_PERFORMANCE_OWNER` y `RELEASE_AUTHORITY` son obligatorios en staging y producción;
- identidad/personas requiere además la autoridad de privacidad aplicable;
- implementador y autor del backfill pueden aportar evidencia, pero no ser los únicos aprobadores;
- una persona puede ocupar más de un rol solo si queda documentado y existe al menos una revisión independiente.

#### 9. Matriz de aceptación por paquete

| Dominio | Evidencia adicional no sustituible |
|---|---|
| `INVENTORY_UOM` | Conservación de cantidades/costos; relaciones UOM; equivalencia Gouda; no colisiones residuales |
| `INVENTORY_LOCATIONS` | Aislamiento tenant/sede; jerarquía y FK; consultas de existencias; writers cubiertos |
| `CROSS_DOMAIN_SEARCH` | Corpus versionado; precisión/recall acordados; acentos/alias; plan y latencia de consultas |
| `VISIBLE_BUSINESS_TEXT` | Muestras antes/después; aceptación semántica humana; localización; ausencia de mutación oculta |
| `PASS_CATALOG_AND_REQUEST_POLICIES` | Evidencia de no mutación; ciclo de vida; permisos; políticas y consumidores PASS |
| `IDENTITY_AND_WORKFORCE` | Conservación byte-a-byte cuando aplica; privacidad; referencias; ausencia de merges de personas |
| `PRODUCT_AND_REMITTANCE_IDENTITY` | Resolución explícita por bloqueo; no auto-merge ambiguo; FK; historial y decisión atribuible |

#### 10. Estados de preparación actuales

Los siete paquetes quedan en:

```text
DESIGN_EVIDENCE_COMPLETE_OPERATIONAL_BLOCKED
```

Motivo común: todavía no existen implementación física, ejecución de backfill, activación progresiva ni evidencia ambiental. Este estado no es un fallo; impide adelantar una aprobación falsa.

#### 11. Emisión de una decisión

Una decisión solo puede emitirse si:

1. identifica paquete, etapa, candidato y entorno inequívocos;
2. todas las compuertas aplicables están en `PASS` o tienen excepción explícita, temporal y firmada;
3. no hay bloqueadores `OPEN` ni resultados críticos `FAIL`;
4. el bundle pasa validación de esquema y sus referencias son accesibles;
5. `bundle_sha256` coincide con el contenido revisado;
6. las autoridades mínimas firmaron después de generarse la última evidencia;
7. la decisión tiene vigencia y alcance de promoción explícitos.

La decisión se registra de forma append-only y nunca se infiere del estado de una tarea canónica.

#### 12. Excepciones

Una excepción debe registrar:

- gate y riesgo residual;
- evidencia faltante o resultado fuera de umbral;
- dominio, unidades y consumidores afectados;
- mitigación temporal y monitoreo;
- propietario y autoridad que acepta;
- fecha/hora de expiración;
- criterio de cierre o rollback.

No se permiten excepciones para pérdida de integridad referencial, bypass de RLS, exposición de secretos/PII, corrupción no recuperable o ausencia total de rollback cuando el cambio sea destructivo.

#### 13. Suspensión y revocación

Una aprobación se suspende o revoca ante cualquiera de estos eventos:

1. cambia el commit, checksum de migraciones o versión de reglas;
2. existe drift del esquema o configuración respecto del bundle;
3. aparece un writer, consumidor o relación no evaluado;
4. falla una compuerta previamente aprobada;
5. vence una excepción o ventana;
6. ocurre incidente de seguridad, privacidad o integridad;
7. deja de estar disponible el mecanismo de recuperación;
8. una autoridad retira su aceptación.

La revocación crea otra decisión con causa y referencia a la decisión reemplazada. El historial anterior se conserva.

#### 14. Evidencia ambiental

| Entorno | Uso de la evidencia |
|---|---|
| Local Docker | Reproducibilidad técnica, migraciones limpias, pgTAP/invariantes, fallos tempranos |
| CI efímero | Repetibilidad desde cero, checks automáticos, digests y artefactos del candidato |
| Staging | Datos/carga representativos, integraciones reales controladas, rollback drill y aprobación preproducción |
| Producción cohort | Ventana, cohorte, observabilidad, error budget, stop conditions y reversa |
| Producción full | Expansión posterior a cohorte estable, reconciliación y decisión final por dominio |

Ninguna fila hereda automáticamente el `PASS` de la anterior: la evidencia se enlaza, pero se vuelve a evaluar para el entorno destino.

#### 15. Convención de artefactos

```text
evidence/data-normalization/<candidate_sha>/<environment>/<domain_key>/
  manifest.json
  gates.json
  baseline/
  dry-run/
  collisions/
  backfill/
  activation/
  validation/
  security-performance/
  rollback/
  decision.json
```

`manifest.json` contiene digests, no secretos. Los datos sensibles se minimizan o anonimizan y permanecen en almacenamiento autorizado con referencia controlada.

#### 16. Consulta y auditoría

Debe poder responderse sin interpretación manual:

- qué dominio fue aprobado;
- para qué candidato, reglas, migraciones y entorno;
- qué unidades y consumidores cubre;
- qué pruebas pasaron, fallaron o faltan;
- quién decidió y bajo qué rol;
- qué excepciones existen y cuándo vencen;
- qué decisión supersede o revoca a cuál;
- si el bundle revisado conserva el mismo digest.

#### 17. Seguridad Supabase/PostgreSQL

- RLS y grants se prueban por separado con roles positivos y negativos.
- Las tablas expuestas no se consideran seguras solo por tener una policy escrita.
- Service role no se usa como sustituto de pruebas de usuario real.
- Los bundles no almacenan claves, connection strings ni JWT.
- El acceso a evidencia de identidad/personas sigue mínimo privilegio y retención definida.
- Las consultas de verificación deben ser read-only salvo las pruebas explícitas dentro de transacciones revertidas.

#### 18. Rendimiento y operabilidad

La aprobación operacional exige, según el dominio:

- plan de ejecución antes/después;
- latencia y volumen comparables;
- locks, bloat y duración de lotes;
- error rate y consumo de recursos;
- observabilidad para stop conditions;
- RTO/RPO medidos o justificados;
- capacidad de ejecutar `007` y `008` dentro de la ventana.

Un resultado funcional correcto puede ser rechazado si incumple el presupuesto operacional.

#### 19. Referencias Supabase verificadas

- [Managing Environments](https://supabase.com/docs/guides/deployment/managing-environments): separación de entornos y flujo de migraciones.
- [Testing your database](https://supabase.com/docs/guides/database/testing): pruebas de base de datos automatizables con pgTAP.
- [Row Level Security](https://supabase.com/docs/guides/database/postgres/row-level-security): RLS para tablas expuestas y verificación separada de autorización.
- [Deployment and branching](https://supabase.com/docs/guides/deployment): promoción por entornos y ramas.

#### 20. Trazabilidad mínima

| Requisito | Cobertura en esta tarea |
|---|---|
| `TREQ-DATA-084` | Paridad e idempotencia entre capas |
| `TREQ-DATA-086` | Formularios, corpus y consumidores VITAL |
| `TREQ-DATA-120` | Revisión de idempotencia y concurrencia |
| `TREQ-DATA-122` | Preservación de casos durante la transición |
| `TREQ-DATA-147` | Coexistencia cerrada y ausencia de dual-write ambiguo |
| `TREQ-DATA-159` | Replay controlado y atribuible |
| `TREQ-DATA-164` | Corpus versionado, seguridad y paridad |
| `TREQ-DATA-187` | Ejecución y decisión atribuibles |
| `TREQ-DATA-190` | Corpus de identidad y colisiones |
| `TREQ-DATA-209` | Raíz única de auditoría |
| `TREQ-DATA-214` | Corpus transversal entre capas |
| `TREQ-DATA-228` | Estados explícitos de bloqueo/cuarentena |
| `TREQ-DATA-239` | Historial de replay y rollback |
| `TREQ-DATA-240` | Corpus de integración externa |
| `TREQ-SUPABASE-1752` | Evidence bundle y handoff verificable |

#### 21. Definition of Done

- [x] siete paquetes cubren exactamente las nueve unidades de `005/007/008`;
- [x] existen diez compuertas y se separa diseño de operación;
- [x] el expediente tiene identidad, alcance, digests, evidencia, decisiones y firmas;
- [x] etapas y resultados son cerrados y no ambiguos;
- [x] autoridades y segregación están definidas;
- [x] cada dominio tiene evidencia adicional específica;
- [x] emisión, excepciones, suspensión y revocación están cerradas;
- [x] local, CI, staging, cohorte y producción full se evalúan separadamente;
- [x] seguridad, privacidad, rendimiento y recuperación son gates reales;
- [x] quince requisitos tienen trazabilidad;
- [x] el manifiesto SQL fue ejecutado en PostgreSQL local: 10 compuertas, 7 paquetes, 9 unidades, cobertura exacta, cero aprobaciones falsas, aserciones superadas y `ROLLBACK` confirmado;
- [ ] existe evidencia operacional local de la implementación física;
- [ ] existe evidencia operacional de staging;
- [ ] existe evidencia operacional de producción;
- [x] el usuario aprobó explícitamente este contrato.

#### 22. Condición de aprobación de esta tarea

Al aprobar `DATA-NORM-TRANS-009` se acepta:

- la división en siete paquetes;
- las diez compuertas;
- las autoridades, el esquema de bundle y las reglas de decisión;
- que hoy hay cero aprobaciones operativas por dominio;
- que las pruebas reales se producirán durante BLOQUE R y promociones posteriores.

No se acepta ni ejecuta una migración o despliegue.

#### 23. Handoff hacia `SUPA-TRANS-016`

`SUPA-TRANS-016` recibe:

1. cadena documental `001..009` completa;
2. siete paquetes en estado `DESIGN_EVIDENCE_COMPLETE_OPERATIONAL_BLOCKED`;
3. cero decisiones operativas concedidas;
4. el contrato que BLOQUE R deberá materializar;
5. la prohibición de presentar diseño aprobado como despliegue validado.

#### 24. Continuidad propuesta

```text
TAREA CANÓNICAMENTE APROBADA
DATA-NORM-TRANS-008 — Definir rollback y recuperación del valor anterior
        ↓
TAREA CANÓNICAMENTE APROBADA
DATA-NORM-TRANS-009 — Definir evidencia de aprobación por dominio
        ↓
SIGUIENTE TAREA EN PROPUESTA PARA APROBACIÓN
SUPA-TRANS-016 — Aprobar transición antes de iniciar BLOQUE R
```
