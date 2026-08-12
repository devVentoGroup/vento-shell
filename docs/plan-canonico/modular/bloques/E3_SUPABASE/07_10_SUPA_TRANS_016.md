### ✅ SUPA-TRANS-016 — Aprobar transición antes de iniciar BLOQUE R

**Estado:** APROBADA

**Condición canónica:** APROBADA EXPLÍCITAMENTE POR EL USUARIO — `2026-08-01`

**Tarea anterior:** `DATA-NORM-TRANS-009 — Definir evidencia de aprobación por dominio` — APROBADA

**Continuidad posterior:** fin de la secuencia activa de E3; `SHELL-AUD-001` queda como handoff reservado de `H-SHARED-AUDIT-001`, sin iniciarse ni cambiar de estado hasta que el usuario apruebe esta tarea y ordene continuar

**Tipo de tarea:** decisión final de transición y contrato de entrada condicionada; consolida veinticuatro tareas aprobadas; no ejecuta migraciones, DDL/DML, backfills, activaciones, rollback, despliegues, consultas remotas ni cambios en aplicaciones

**Fecha de preparación documental:** `2026-08-01`

#### 1. Decisión aprobada

```text
DECISION_OUTCOME = APPROVE_TRANSITION_CONTRACT_ONLY
SUPABASE_TRANSITION_DESIGN_COMPLETE = true
NORMALIZATION_TRANSITION_DESIGN_COMPLETE = true
BLOCK_R_PHYSICAL_ENTRY_AUTHORIZED = false
LOCAL_MIGRATION_EXECUTION_AUTHORIZED = false
STAGING_DEPLOYMENT_AUTHORIZED = false
PRODUCTION_DEPLOYMENT_AUTHORIZED = false
```

La aprobación de `SUPA-TRANS-016` cierra el diseño de transición de E3 y lo convierte en insumo vinculante para paquetes posteriores. No es una autorización general para “comenzar a migrar”.

#### 2. Resultado concreto

Esta tarea produce:

1. una decisión única sobre la completitud del contrato de transición;
2. la reconciliación de las quince tareas `SUPA-TRANS` previas y las nueve `DATA-NORM-TRANS`;
3. una matriz de capacidades aceptadas y evidencia todavía pendiente;
4. límites de autorización explícitos para local, staging y producción;
5. precondiciones exactas para que un paquete pueda entrar a BLOQUE R;
6. orden inicial obligatorio de R0, R1 y normalización física cuando aplique;
7. criterios de suspensión y reapertura de la transición;
8. handoff verificable hacia BLOQUE H, BLOQUE T, E5 y `SHELL-CI-020`.

El artefacto [SUPA-TRANS-016_BLOCK_R_ENTRY_GATE.sql](./SUPA-TRANS-016_BLOCK_R_ENTRY_GATE.sql) materializa declarativamente los 24 predecesores y quince condiciones del gate, comprueba sus invariantes y termina en `ROLLBACK`. Ese SQL valida la forma del contrato; el estado real de los marcadores canónicos se verifica independientemente mediante `npm run docs:plan:check`.

#### 3. Predecesores reconciliados

| Familia | Rango | Cantidad | Estado requerido | Resultado observado |
|---|---|---:|---|---|
| Transición general | `SUPA-TRANS-001..015` | 15 | `APROBADA` | 15 aprobadas |
| Transición de normalización | `DATA-NORM-TRANS-001..009` | 9 | `APROBADA` | 9 aprobadas |
| Total de insumos | ambos rangos | 24 | sin omisiones ni aprobación fuera de orden | 24 reconciliados |

La tarea 016 no reemplaza ninguno de esos contratos. Los incorpora por referencia y prohíbe reinterpretarlos silenciosamente durante implementación.

#### 4. Qué queda aprobado como diseño

| Capacidad | Fuente vinculante | Resultado del gate |
|---|---|---|
| Mapa AS-IS → TO-BE y disposición | `SUPA-TRANS-001..002` | aceptado |
| Dependencias y orden por dominio | `SUPA-TRANS-003..004` | aceptado |
| Backfills, calidad y compatibilidad | `SUPA-TRANS-005..006` | aceptado |
| Consumidores y escrituras concurrentes | `SUPA-TRANS-007..008` | aceptado |
| Pruebas, rendimiento y seguridad | `SUPA-TRANS-009..010` | aceptado |
| Rollback y retiro legacy | `SUPA-TRANS-011..012` | aceptado |
| Paridad ambiental | `SUPA-TRANS-013` | aceptado |
| Tipos, contratos y documentación | `SUPA-TRANS-014` | aceptado |
| Roadmap ejecutable desde `vento-shell` | `SUPA-TRANS-015` | aceptado |
| Baseline, dry-run y colisiones | `DATA-NORM-TRANS-001..003` | aceptado |
| Duplicados y backfills reversibles | `DATA-NORM-TRANS-004..005` | aceptado |
| Activación y validación post-backfill | `DATA-NORM-TRANS-006..007` | aceptado |
| Recuperación del valor anterior | `DATA-NORM-TRANS-008` | aceptado |
| Evidencia de aprobación por dominio | `DATA-NORM-TRANS-009` | aceptado |

“Aceptado” significa que BLOQUE R debe implementar esa decisión. No significa que el objeto físico ya exista ni que la evidencia operacional haya pasado.

#### 5. Frontera de autorización

`SUPA-TRANS-016` autoriza:

- usar los contratos E3 para construir un paquete ejecutable;
- descomponer el roadmap en migraciones pequeñas y reversibles;
- preparar scripts, tests, fixtures y evidencia dentro del paquete;
- evaluar aplicabilidad de R0, R1, R2, R3 y `DATA-NORM-DB`;
- rechazar cualquier implementación que contradiga el diseño aprobado.

`SUPA-TRANS-016` no autoriza:

- crear o aplicar una migración fuera de un `package_id`;
- ejecutar backfills o normalizaciones sobre datos reales;
- usar el proyecto enlazado como laboratorio;
- promover a staging o producción;
- retirar objetos legacy;
- activar writers, triggers, policies, grants o RPC;
- declarar un dominio aprobado operacionalmente;
- omitir las etapas 5 a 23 del carril prioritario, incluidas `READY-GATE`, `CUTOVER-OPS`, `HYPERCARE-OPS`, `SHELL-CI-001..019`, `E5-GATE-001..008` o `SHELL-CI-020`.

#### 6. Quince condiciones del gate

| Orden | Condición | Estado actual | Interpretación |
|---:|---|---|---|
| 10 | `GENERAL_TRANSITION_001_015_APPROVED` | `PASS_DOCUMENTAL` | las quince tareas generales están aprobadas |
| 20 | `NORMALIZATION_TRANSITION_001_009_APPROVED` | `PASS_DOCUMENTAL` | las nueve tareas de normalización están aprobadas |
| 30 | `TRANSITION_CONTRACT_COHERENT` | `PASS_DOCUMENTAL` | continuidad, rollback, paridad, evidencia y roadmap no se contradicen |
| 40 | `POST_E3_DESIGN_STAGES_005_016_COMPLETE` | `BLOCKED_FUTURE_GATE` | faltan auditoría/distribución compartida, contratos transversales y definición funcional previa al paquete |
| 50 | `PACKAGE_ID_AND_SCOPE_SELECTED` | `BLOCKED_FUTURE_GATE` | falta instancia ejecutable y alcance exacto |
| 60 | `E5_READINESS_PLAN_001_015_COMPLETE` | `BLOCKED_FUTURE_GATE` | falta cerrar el plan de readiness técnico y operativo |
| 70 | `E5_CUTOVER_PLAN_001_010_COMPLETE` | `BLOCKED_FUTURE_GATE` | falta cerrar convivencia, reversión, piloto y salida |
| 80 | `E5_HYPERCARE_PLAN_001_010_COMPLETE` | `BLOCKED_FUTURE_GATE` | falta cerrar monitoreo, soporte, contingencias y autoridad de cierre |
| 90 | `CI_FOUNDATION_001_019_CERTIFIED` | `BLOCKED_FUTURE_GATE` | falta capacidad CI certificada |
| 100 | `E5_ENTRY_GATES_001_007_APPROVED` | `BLOCKED_FUTURE_GATE` | faltan gates de cobertura, NFR, rollout, rollback, piloto, capacitación y TREQ |
| 110 | `E5_PACKAGE_GATE_008_APPROVED` | `BLOCKED_FUTURE_GATE` | falta autorización del paquete, todavía sin despliegue |
| 120 | `SHELL_CI_020_EXECUTION_OPENED` | `BLOCKED_FUTURE_GATE` | no se ha abierto el ciclo de implementación |
| 130 | `LOCAL_PHYSICAL_EVIDENCE_COMPLETE` | `MISSING_NOT_EXECUTED` | ninguna implementación física fue ejecutada por este gate |
| 140 | `STAGING_EVIDENCE_COMPLETE` | `MISSING_NOT_EXECUTED` | no existe promoción de staging atribuible a esta tarea |
| 150 | `PRODUCTION_EVIDENCE_COMPLETE` | `MISSING_NOT_EXECUTED` | no existe promoción productiva atribuible a esta tarea |

Solo las tres primeras condiciones son necesarias para aprobar el **contrato de transición**. Las doce restantes bloquean la ejecución física y se resuelven en etapas posteriores.

#### 7. Secuencia obligatoria hasta la implementación

```text
SUPA-TRANS-016
  transición aprobada como contrato
        ↓
SHELL-AUD-001..011 → SHELL-PKG-001..008 → TSVC-CAT-001..010
        ↓
AUTH-UI-030..039 → AUTH-DEV-001..006 → AUTH-SIM-001..006
        ↓
AUTH-ERR-001..020 → NEXO-DOM-001 → NEXO-UX-001..025 → AUTH-UI-052..060
        ↓
matrices condicionales de diseño e implementación resueltas
        ↓
DELIV-PKG-001..025::<package_id>
  paquete exacto, alcance y condicionales resueltos
        ↓
READY-GATE-001..015
        ↓
CUTOVER-OPS-001..010
        ↓
HYPERCARE-OPS-001..010
        ↓
SHELL-CI-001..019
  CI, pruebas, versionado, evidencia y rollback certificados
        ↓
E5-GATE-001..007::<package_id>
        ↓
E5-GATE-008::<package_id>
  autorización explícita; todavía sin cambio físico
        ↓
SHELL-CI-020::<package_id>
  apertura de implementación y despliegue
        ↓
BLOQUE R aplicable al mismo package_id
        ↓
SHELL-CI-021..024::<package_id>
  readiness, piloto, hypercare y cierre
```

No se puede invertir ni comprimir esta secuencia usando la aprobación de E3.

#### 8. Propiedad y unidad de ejecución

Toda migración Supabase de VENTO:

1. se crea y conserva en `vento-shell`;
2. pertenece a un `package_id` estable;
3. identifica commit, versión, entorno y owner;
4. enlaza unidades de `SUPA-TRANS-015` y, si aplica, `DATA-NORM-TRANS-005..009`;
5. se prueba primero en la instancia local reproducible;
6. se promueve mediante CI al entorno explícito;
7. produce evidencia separada por entorno;
8. conserva mecanismo de rollback y criterio de suspensión.

Los repositorios consumidores pueden cambiar contratos o código coordinadamente, pero no se convierten en propietarios de migraciones Supabase.

#### 9. Entrada a R0

R0 empieza únicamente dentro de un paquete autorizado y en este orden:

| Orden | Tarea | Salida necesaria |
|---:|---|---|
| 10 | `AUTH-DB-015` | migraciones versionadas y atribuibles en `vento-shell` |
| 20 | `AUTH-DB-027` | harness de esquema, integridad, RLS, RPC y migraciones |
| 30 | `AUTH-DB-028` | baseline y drift entre local, staging y producción |
| 40 | `AUTH-DB-029` | respaldo, restore y rollback ensayados |
| 50 | `AUTH-DB-001..005` | contención de RLS, functions y grants aprobada por paquete |

La corrección de seguridad no justifica saltarse baseline o rollback, salvo incidente formal gestionado por el proceso de emergencia aplicable.

#### 10. Entrada a R1

R1 requiere R0 suficiente para el paquete y respeta:

```text
AUTH-DB-016 → AUTH-DB-018 → AUTH-DB-017 → AUTH-DB-019
AUTH-DB-019 → AUTH-DB-033 → AUTH-DB-035 → AUTH-DB-034 → AUTH-DB-032
AUTH-DB-012..014 después de la capa transversal de auditoría aprobada
```

Cada paquete debe incluir `AUTH-DB-027` como harness. R1 no crea mecanismos de auditoría independientes por aplicación.

#### 11. Normalización física condicional

`DATA-NORM-DB-001..010` solo entra al paquete cuando este modifica o normaliza datos existentes de catálogo, búsqueda o inventario.

La decisión de inclusión o exclusión debe quedar en `DELIV-PKG` antes de `E5-GATE-008`. Si se incluye, deben heredarse como mínimo:

- baseline y source cut de `001`;
- dry-run reproducible de `002`;
- colisiones y resolución de `003..004`;
- lotes reversibles de `005`;
- activación progresiva de `006`;
- siete carriles de validación de `007`;
- clase de recuperación de `008`;
- expediente y autoridades de `009`.

#### 12. Paquetes iniciales y ausencia de autorización global

El registro histórico identifica `NEXO-REMISSIONS-001` como un carril anteriormente designado. Su estado vigente es `SUSPENDED`, `active = false`, y no habilita ejecución.

Todo paquete futuro deberá completar `DELIV-PKG-001..025::<package_id>`, resolver sus condicionales y superar `E5-GATE-008::<package_id>`. Cerrar un paquete tampoco cerrará una aplicación, un dominio, BLOQUE R ni Vento OS.

#### 13. Evidencia heredada frente a evidencia futura

| Evidencia | Estado al proponer 016 | Productor futuro |
|---|---|---|
| Decisiones y manifiestos de transición | disponible | E3 |
| Roadmap y unidades de migración | disponible como diseño | `SUPA-TRANS-015` |
| Paquete físico versionado | pendiente | `DELIV-PKG` + `SHELL-CI-020` |
| Base reconstruida desde cero | pendiente | `SHELL-CI-001..019` + R0 |
| Drift local/staging/producción | pendiente | `AUTH-DB-028` |
| Restore/rollback ensayado | pendiente | `AUTH-DB-029` |
| Evidencia de normalización real | pendiente | `DATA-NORM-DB` |
| Aprobación por dominio | pendiente | autoridades de `DATA-NORM-TRANS-009` |
| Readiness, piloto e hypercare | pendiente | `SHELL-CI-021..024` |

La evidencia futura no puede marcarse `PASS` anticipadamente.

`SUPA-TRANS-001_TRANSITION_MAP.sql` y `SUPA-TRANS-002_DRY_RUN.sql` se clasifican como `REMOTE_CATALOG_ARTIFACT`: preservan el catálogo y la huella histórica obtenidos del proyecto alojado. No forman parte de la suite local universal porque `001` consulta capacidades opcionales como `cron.job` y `002` incorpora `001` mediante `\ir`. Su replay debe ejecutarse con `psql -f` desde el directorio propietario, contra un ambiente autorizado con las mismas extensiones, y no se interpreta como requisito para los manifiestos locales read-only de `DATA-NORM-TRANS-005..009` o este gate. La ausencia local de `pg_cron` se reporta como diferencia de capacidad, no como prueba falsa ni como motivo para alterar la huella histórica.

#### 14. Breaking changes de Supabase revisados

Revisión realizada el `2026-08-01` sobre el changelog oficial:

| Cambio | Fecha anunciada | Tratamiento obligatorio en paquetes R |
|---|---|---|
| La versión explícita de extensiones queda deprecada y será ignorada | `2026-08-05` | registrar versión efectiva y no depender de que `CREATE/ALTER EXTENSION ... VERSION` fuerce una versión |
| Envoy pasa a ser gateway predeterminado en Supabase self-hosted | semana de `2026-08-09` | fingerprint del gateway; no asumir servicio, listener o configuración Kong |
| Management API retira `logs.all` a favor de `logs` | `2026-09-23` | inventariar observabilidad y migrar consultas aplicables antes de depender de ellas |

No se encontraron referencias directas a `logs.all`, pinning SQL de extensiones ni supuestos Kong en los archivos del repositorio inspeccionados. La revisión debe repetirse por candidato porque esta evidencia caduca.

#### 15. Reglas de seguridad

- Todo objeto expuesto debe reconciliar Data API, grants y RLS como controles distintos.
- Una policy escrita no equivale a autorización comprobada.
- Las vistas deben evaluar `security_invoker` o permanecer fuera de schemas expuestos.
- `SECURITY DEFINER` requiere necesidad explícita, schema privado, `search_path`, grants mínimos y pruebas negativas.
- `service_role` no se utiliza para demostrar permisos de usuario.
- Ninguna clave, JWT o connection string entra a manifiestos de evidencia.
- Auth, Storage y Realtime conservan sus fronteras de schema administrado.

#### 16. Paridad ambiental

| Ambiente | Requisito para avanzar |
|---|---|
| Local | reconstrucción limpia, migraciones, tests y rollback sin depender de estado manual |
| CI/preview | candidato exacto, checks automáticos, tipos y evidencia reproducible |
| Staging | proyecto separado, migraciones promovidas, integraciones y carga representativas |
| Producción cohort | ventana, stop conditions, observabilidad, reconciliación y rollback |
| Producción full | cohorte estable, decisión por dominio y ausencia de bloqueadores |

El stack local de Supabase no es evidencia suficiente de equivalencia con la plataforma alojada; las diferencias se registran y prueban.

#### 17. Criterios de suspensión o reapertura

La transición se suspende o reabre si:

1. aparece un objeto, writer o consumidor material no inventariado;
2. cambia una decisión arquitectónica adoptada por `SUPA-ARC-025`;
3. el roadmap omite una unidad o altera su propiedad;
4. una migración necesita ejecución irreversible no cubierta por `011`;
5. staging demuestra deriva semántica o de seguridad;
6. una actualización Supabase invalida un supuesto del contrato;
7. el paquete no puede satisfacer rollback, paridad o evidencia por dominio;
8. se pretende mezclar VENTO con VITAL sin contrato y ADR explícitos.

La reapertura produce una nueva decisión trazable; no edita retrospectivamente la aprobación anterior.

#### 18. Reglas de fallo cerrado

El gate falla si existe:

- menos o más de 24 predecesores;
- una tarea previa no aprobada;
- una unidad sin owner, disposición, rollback o evidencia;
- discrepancia entre roadmap y paquete;
- `package_id`, commit o entorno ambiguos;
- ejecución física anterior a `E5-GATE-008` y `SHELL-CI-020`;
- una aprobación operacional inferida de documentación;
- una migración Supabase fuera de `vento-shell`;
- un bloqueador oculto como “no aplica” sin decisión atribuible.

#### 19. Trazabilidad de requisitos

Este gate hereda todos los TREQ reconciliados en `SUPA-TRANS-001..015` y `DATA-NORM-TRANS-001..009`. Para el cierre aplica especialmente:

| Requisito | Cobertura |
|---|---|
| `TREQ-SUPABASE-1682` | unidad estable, estado y gate atribuibles |
| `TREQ-SUPABASE-1736` | backfill por unidad y paquete |
| `TREQ-SUPABASE-1747` | invariantes de elegibilidad |
| `TREQ-SUPABASE-1752` | evidence bundle sin ejecución ficticia |
| `TREQ-SUPABASE-1754` | compatibilidad temporal gobernada |
| `TREQ-SUPABASE-1757` | rollback y recuperación por paquete |
| `TREQ-SUPABASE-1763` | paridad ambiental |
| `TREQ-SUPABASE-1767` | retiro legacy condicionado |
| `TREQ-SUPABASE-1769` | contrato, tipos y documentación coordinados |
| `TREQ-SUPABASE-1770` | roadmap ejecutable y handoff integral |
| `TREQ-DATA-159` | replay reproducible y controlado |
| `TREQ-DATA-214` | corpus transversal y paridad de capas |
| `TREQ-DATA-239` | historia preservada en rollback/reprocess |
| `TREQ-DATA-240` | frontera de datos externos y VITAL |

#### 20. Referencias Supabase verificadas

- [Changelog — breaking changes](https://supabase.com/changelog?types=breaking-change).
- [Managing Environments](https://supabase.com/docs/guides/deployment/managing-environments).
- [Local development workflow](https://supabase.com/docs/guides/local-development/cli-workflows).
- [Deployment and Branching](https://supabase.com/docs/guides/deployment).
- [Testing Overview](https://supabase.com/docs/guides/local-development/testing/overview).

#### 21. Definition of Done

- [x] `DATA-NORM-TRANS-009` fue aprobada explícitamente;
- [x] los 24 predecesores están aprobados y reconciliados;
- [x] las capacidades aceptadas conservan su fuente vinculante;
- [x] autorización documental y ejecución física están separadas;
- [x] las quince condiciones del gate tienen estado no ambiguo;
- [x] la secuencia `diseño posterior a E3 → DELIV-PKG → READY-GATE → CUTOVER-OPS → HYPERCARE-OPS → CI → E5 → SHELL-CI-020 → R` está cerrada;
- [x] la propiedad de migraciones permanece en `vento-shell`;
- [x] R0, R1 y normalización condicional tienen entrada definida;
- [x] evidencia heredada y futura no se mezclan;
- [x] breaking changes actuales fueron revisados;
- [x] seguridad, paridad, suspensión y fallo cerrado están definidos;
- [x] el manifiesto SQL fue ejecutado en PostgreSQL local: 24 predecesores declarativos, 15 condiciones, 12 bloqueos físicos, decisión restringida, aserciones superadas y `ROLLBACK` confirmado;
- [x] el usuario aprobó explícitamente `SUPA-TRANS-016`;
- [ ] existe un paquete con `E5-GATE-008` aprobado;
- [ ] `SHELL-CI-020` abrió una ejecución física;
- [ ] existe evidencia local, staging o producción de BLOQUE R.

#### 22. Efecto exacto de aprobar

Al aprobar esta tarea:

1. la secuencia activa de E3 queda completa;
2. las decisiones `SUPA-TRANS` y `DATA-NORM-TRANS` se vuelven vinculantes para implementación;
3. el grupo `SUPABASE_TRANSITION` del carril prioritario queda satisfecho documentalmente;
4. se habilita continuar con las dependencias posteriores y construir paquetes;
5. BLOQUE R sigue físicamente bloqueado hasta su instancia de `E5-GATE-008` y `SHELL-CI-020`.

#### 23. Continuidad propuesta

```text
TAREA CANÓNICAMENTE APROBADA
DATA-NORM-TRANS-009 — Definir evidencia de aprobación por dominio
        ↓
TAREA CANÓNICAMENTE APROBADA
SUPA-TRANS-016 — Aprobar transición antes de iniciar BLOQUE R
        ↓
FIN DE SECUENCIA E3
HANDOFF RESERVADO, NO INICIADO
SHELL-AUD-001 — Buscar código duplicado entre repositorios
        ↓
Etapas 5..23 del carril prioritario antes de cualquier BLOQUE R
```
