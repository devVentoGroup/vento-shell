### ✅ DATA-NORM-TRANS-001 — Crear baseline de valores actuales antes de transformar

**Estado:** APROBADA

**Condición canónica:** APROBADA EXPLÍCITAMENTE POR EL USUARIO — `2026-08-01`

**Tarea anterior:** `SUPA-TRANS-015` — Crear roadmap ejecutable de migraciones en `vento-shell` — APROBADA

**Tarea siguiente:** `DATA-NORM-TRANS-002 — Ejecutar dry-run de cada regla de normalización` — APROBADA

**Tipo de tarea:** consolidación documental y congelamiento reproducible del estado observado antes de transformar; sin DDL, DML, migraciones, backfills, correcciones, fusiones, constraints, índices, cambios en aplicaciones, despliegues, consultas remotas nuevas ni modificación de VITAL

**Fecha de preparación documental:** `2026-08-01`

**Contrato material:** `CURRENT-TEXT-VALUE-BASELINE-001@1.0.0`

#### 1. Resultado concreto

Queda creado el baseline canónico previo a cualquier transformación textual de Vento OS. El baseline fija:

- el corte técnico y la procedencia de la evidencia disponible;
- el universo físico de campos textuales y el corpus comparativo ya medido;
- las cinco representaciones de comparación usadas en la auditoría;
- los conteos de colisiones, divergencias, actividad y dependencias que deberán permanecer explicables;
- doce unidades de baseline por entidad y scope, sin convertirlas en contratos de identidad;
- el estado conocido de catálogos, backlog, casos, ocurrencias, decisiones y vigencias al corte;
- el contrato que BLOQUE R deberá usar para recapturar y reconciliar sin exponer valores sensibles;
- la puerta documental que habilita usar este baseline como entrada de `DATA-NORM-TRANS-002`.

Este documento no afirma que el remoto permanezca idéntico al corte auditado. La tarea se considera materialmente desarrollada con la evidencia aprobada y fechada de `DATA-NORM-AUD-001` a `007`; una recaptura fresca inmediatamente anterior al primer cambio físico pertenece a `AUTH-DB-028` y a los paquetes `DATA-NORM-DB-*` de BLOQUE R, no es condición para aprobar esta tarea ni para iniciar el análisis de `DATA-NORM-TRANS-002`.

#### 2. Baseline aprobado como punto de partida

| Identidad                      | Valor                                              |
| ------------------------------ | -------------------------------------------------- |
| `baseline_id`                  | `DNT001::VENTO_OS::2026-07-30::AUDITED_V1`         |
| proyecto observado             | `vento-os-dev` — `clzdpinthhtknkmefsxx`            |
| motor observado                | PostgreSQL `17.6`                                  |
| corte del inventario de campos | `2026-07-30T21:28:37.404593+00:00`                 |
| corte del corpus comparativo   | `2026-07-30T22:26:52.869004+00:00`                 |
| fuentes propietarias           | `DATA-NORM-AUD-001` a `DATA-NORM-AUD-007`          |
| política y arquitectura        | `DATA-NORM-ARC-001` a `DATA-NORM-ARC-012`          |
| estado de frescura             | `HISTORICAL_APPROVED_BASELINE`                     |
| capacidad permitida            | comparación, planificación y detección de deriva   |
| capacidad prohibida            | certificar el estado remoto presente sin recaptura |

La diferencia temporal entre ambos cortes es explícita. No se fusionan como si fueran una única transacción consistente; forman un paquete de evidencia correlacionado y versionado.

#### 2.1 Estado de catálogos, revisión e historia al corte

| Componente exigido | Estado congelado | Interpretación obligatoria |
| --- | --- | --- |
| estados de reglas `ACTIVE`, `SUSPENDED`, `RETIRED` | `CONTRACT_APPROVED_NOT_PHYSICALLY_MATERIALIZED_AT_CUT` | la arquitectura define los estados, pero el corte no demuestra un catálogo físico transversal que los materialice |
| versiones canónicas de reglas y diccionarios | `CONTRACT_APPROVED_NOT_PHYSICALLY_MATERIALIZED_AT_CUT` | los helpers y reglas legacy observados no se reinterpretan como versiones canónicas |
| cola transversal de revisión | `NOT_IMPLEMENTED_AT_CUT` | `DATA-NORM-ARC-007` registró ausencia de cola, interfaz y automatización físicas |
| casos y `review_case_key` canónicos | `NOT_IMPLEMENTED_AT_CUT` | los grupos auditados son candidatos históricos, no casos aprobados ni agrupaciones reutilizables |
| ocurrencias y miembros examinados | `PARTIAL_AUDIT_EVIDENCE` | solo cubre los corpus y cortes expresamente medidos; una muestra no aprueba elementos no examinados |
| decisiones, reaperturas y supersesiones canónicas | `NOT_IMPLEMENTED_AT_CUT` | no se infieren decisiones desde filas activas, frecuencia, similitud o antigüedad |
| SLA, asignaciones y escalamiento de revisión | `CONTRACT_APPROVED_NOT_PHYSICALLY_MATERIALIZED_AT_CUT` | la ausencia física no equivale a cero casos ni a backlog resuelto |
| evidencia histórica y relaciones | `PRESENT_BUT_DISTRIBUTED` | deben preservarse; no existe autorización para colapsarlas por texto normalizado |

`NOT_IMPLEMENTED_AT_CUT` y `CONTRACT_APPROVED_NOT_PHYSICALLY_MATERIALIZED_AT_CUT` son estados positivos de baseline: registran una ausencia comprobada de materialización canónica. Nunca se convierten silenciosamente en conteo cero, conformidad o inexistencia de datos legacy.

#### 3. Frontera física congelada

| Frontera            | Columnas textuales | Persistidas | Derivadas | Tratamiento                                                              |
| ------------------- | -----------------: | ----------: | --------: | ------------------------------------------------------------------------ |
| `app_private`       |                 12 |           9 |         3 | infraestructura privada Vento                                            |
| `club`              |                 45 |          45 |         0 | Vento OS actual                                                          |
| `pass`              |                 23 |          23 |         0 | Vento OS actual                                                          |
| `payments`          |                 26 |          26 |         0 | Vento OS actual                                                          |
| `pos`               |                 61 |          61 |         0 | Vento OS actual; separado del POS externo                                |
| `public`            |              1.275 |         937 |       338 | contenedor actual multi-capacidad, no dominio objetivo                   |
| `talento`           |                 48 |          46 |         2 | Vento OS actual                                                          |
| `viso`              |                 24 |          24 |         0 | Vento OS actual                                                          |
| `vital`             |                 29 |          29 |         0 | producto independiente; solo frontera de no intervención                 |
| **Total físico**    |          **1.543** |   **1.200** |   **343** | **inventario completo del corte**                                        |
| **Vento sin VITAL** |          **1.514** |   **1.171** |   **343** | **universo máximo por clasificar, no universo autorizado a transformar** |

Composición física total: 1.088 columnas escalares de texto, 402 JSON/JSONB, 32 enums y 21 arreglos textuales. Esta composición no autoriza aplicar una regla por tipo; JSON, enums, arreglos, identificadores, texto libre y valores externos requieren contrato propio.

#### 4. Clasificación semántica congelada

| Clase provisional                      |  Columnas | Uso permitido en transición                                |
| -------------------------------------- | --------: | ---------------------------------------------------------- |
| `IDENTIFICADOR_TECNICO_CANDIDATO`      |       538 | inventariar formato y consumidores; no corregir ortografía |
| `IDENTIFICADOR_TECNICO_ENUM`           |        32 | preservar literal y contrato técnico                       |
| `VALOR_MOSTRADO_CANDIDATO`             |        59 | comparar sin sustituir el original                         |
| `VALOR_BUSQUEDA_COMPARACION_CANDIDATO` |        18 | identificar algoritmo, versión y scope                     |
| `VALOR_EXTERNO_ORIGINAL_CANDIDATO`     |        10 | preservar origen y literal probatorio                      |
| `TEXTO_LIBRE_CANDIDATO`                |        46 | excluir de identidad y corrección destructiva              |
| `ESTRUCTURA_JSON_POR_REVISAR`          |       402 | clasificar por clave y contrato                            |
| `ARREGLO_TEXTUAL_POR_REVISAR`          |        21 | clasificar por elemento y semántica de orden               |
| `SIN_CLASIFICACION_SEMANTICA`          |       417 | gate cerrado hasta clasificación propietaria               |
| **Total**                              | **1.543** | **sin transformación implícita**                           |

La clasificación es una fotografía de descubrimiento. La política aprobada en `DATA-NORM-ARC-001` y `DATA-NORM-ARC-002` prevalece cuando exista una asignación campo por campo.

#### 5. Corpus comparativo congelado

| Métrica                                                   |                                  Baseline |
| --------------------------------------------------------- | ----------------------------------------: |
| entidades incluidas                                       |                                        12 |
| filas textuales comparadas                                |                                     4.030 |
| filas activas comparadas                                  |                                     3.667 |
| objetos PostgreSQL Vento OS examinados                    |                                       361 |
| objetos con señales de búsqueda o comparación             |                                       100 |
| rutinas con señales                                       |                                        96 |
| vistas con señales                                        |                                         4 |
| índices examinados                                        |                                       990 |
| índices con `lower` o `trim`                              |                                        13 |
| columnas `citext`                                         |                                         0 |
| índices empresariales de trigramas o full-text observados |                                         0 |
| claves foráneas entrantes sobre 15 entidades críticas     |                                       420 |
| tablas Vento OS consumidoras de esas entidades            |                                       177 |
| relaciones desde VITAL                                    | 1 constraint desde 1 tabla; solo frontera |

VITAL registró 47 objetos propios y 15 con señales textuales, pero queda fuera del corpus de colisiones, de los dry-runs y de cualquier transformación transversal de Vento OS.

#### 6. Perfiles de comparación fijados

| `profile_key`        | Transformación observada                    | Uso en baseline                              | Prohibición                                   |
| -------------------- | ------------------------------------------- | -------------------------------------------- | --------------------------------------------- |
| `LOWER_TRIM`         | recorte de bordes y comparación sin caja    | medir equivalencias locales actuales         | reemplazar almacenamiento visible             |
| `VENTO_NORM`         | compactación mediante `public._vento_norm`  | medir comportamiento del helper actual       | declararlo política objetivo por existencia   |
| `ACCENT_INSENSITIVE` | NFC, compactación, plegado de tildes y caja | medir recall y colisiones potenciales        | tratar colisión como duplicado                |
| `VENTO_SLUG`         | `public._vento_slugify`                     | congelar claves producidas por helper legacy | reescribir identificadores sin compatibilidad |
| `NAVIGATION_SLUG`    | `public._navigation_slugify`                | comparar divergencia entre capas             | sustituir el otro helper silenciosamente      |

Cada perfil se captura con `algorithm_key`, `algorithm_version`, versión Unicode, locale explícito, implementación, commit o definición SQL y digest. Un cambio en cualquiera de estos componentes crea otro baseline.

#### 7. Registro de unidades de baseline

| `baseline_unit_id` | Entidad                | Scope auditado                   | Coordenadas que impiden inferir identidad                         |
| ------------------ | ---------------------- | -------------------------------- | ----------------------------------------------------------------- |
| `DNT001-U01`       | producto               | tipo, categoría, unidad de stock | SKU, abastecimiento, recetas, catálogo, inventario y consumidores |
| `DNT001-U02`       | categoría de producto  | sede, padre, dominio             | ruta, propósito, relaciones y vigencia                            |
| `DNT001-U03`       | área                   | sede                             | tipo, enrutamiento, relaciones y estado                           |
| `DNT001-U04`       | posición de inventario | ubicación y posición padre       | sede, camino y código                                             |
| `DNT001-U05`       | perfil UOM             | producto y contexto de uso       | cantidades, unidades, fuente, proveedor y vigencia                |
| `DNT001-U06`       | política de solicitud  | producto                         | perfil, contexto, ciclo y vigencia                                |
| `DNT001-U07`       | categoría de remisión  | sede y tipo de área              | enrutamiento, uso e historial                                     |
| `DNT001-U08`       | categoría comercial    | sede                             | catálogo, propósito y vigencia                                    |
| `DNT001-U09`       | colección comercial    | sede y tipo de colección         | catálogo, orden y vigencia                                        |
| `DNT001-U10`       | ítem de catálogo       | sede                             | producto, código, estado y vigencia                               |
| `DNT001-U11`       | proveedor              | alcance global observado         | identificación legal, país, fuente y procedencia                  |
| `DNT001-U12`       | sede                   | alcance global observado         | código, organización, territorio y vigencia                       |

Estos scopes reproducen el análisis histórico; no son políticas de unicidad certificadas. Todo scope definitivo deberá citar una versión aprobada de `DATA-NORM-ARC-010`.

#### 8. Colisiones y divergencias congeladas

| Corte                | Grupos | Filas | Lectura obligatoria                       |
| -------------------- | -----: | ----: | ----------------------------------------- |
| `LOWER_TRIM`         |     26 |    52 | equivalencia de comparación, no identidad |
| `ACCENT_INSENSITIVE` |     27 |    54 | 17 grupos contienen solo filas activas    |
| `VENTO_SLUG`         |     26 |    52 | efecto del helper actual                  |
| `NAVIGATION_SLUG`    |     27 |    54 | efecto de un helper incompatible          |

Sobre 4.030 filas, `_vento_slugify` y `_navigation_slugify` difirieron exactamente en 2.730 filas (67,74 %) y continuaron semánticamente distintos en 324 filas (8,04 %) aun ignorando `-` frente a `_`.

| Familia                  | Resultado material congelado                                      | Disposición                                       |
| ------------------------ | ----------------------------------------------------------------- | ------------------------------------------------- |
| productos                | 963 filas; 1 grupo de 2 filas activas bajo comparación sin tildes | candidato; revisar 66 FK entrantes potenciales    |
| perfiles UOM             | 16 grupos, 32 filas activas; 14 grupos estructuralmente distintos | no usar etiqueta como identidad                   |
| catálogo PASS            | 8 grupos, 16 filas; una activa y una inactiva por grupo           | preservar código, vigencia e historial            |
| políticas de solicitud   | 2 grupos, 4 filas; pares de ciclo actual e histórico              | no consolidar por etiqueta                        |
| posiciones de inventario | 72 valores repetitivos `Nivel 1` a `Nivel 6` en el corte amplio   | falso positivo si se omite padre, camino o código |
| personas                 | 106 registros y 24 grupos por nombre en el corte amplio           | nombre no constituye identidad                    |

Los ejemplos `Chai latte frio`/`Chai Latte Frío`, `LATTE FRIO`/`Latte Frío`, `Maiz Dulce`/`Maíz Dulce`, `Choco Bites`/`Chocobites`, `Queso Gouda`, `Queso Mozzarella Tajado` y `VÍVERES & BODEGA PRINCIPAL` permanecen como candidatos históricos. No son correcciones aprobadas.

#### 9. Contrato de recaptura entregado a BLOQUE R

Antes del primer cambio físico, `AUTH-DB-028` y el paquete `DATA-NORM-DB-*` aplicable deberán generar un registro inmutable con:

```text
baseline_id
baseline_unit_id
project_ref
environment
captured_at_utc
transaction_snapshot_or_equivalent_cut
source_schema
source_relation
source_column_or_json_path
source_owner
field_class
sensitivity_class
scope_definition
scope_version
eligibility_predicate
row_count
active_row_count
null_count
empty_or_blank_count
distinct_exact_count
profile_key
profile_version
distinct_profile_count
collision_group_count
collision_row_count
max_group_size
source_set_digest
result_set_digest
query_or_extractor_digest
tool_name_and_version
captured_by
approved_by
evidence_uri
evidence_digest
status
```

Estados permitidos:

```text
DRAFT -> CAPTURED -> RECONCILED -> APPROVED_FOR_DRY_RUN -> SUPERSEDED
                         \-> REJECTED
```

No existe transición automática por fecha, silencio ni ejecución exitosa. `APPROVED_FOR_DRY_RUN` exige reconciliación y aprobación humanas explícitas.

Este contrato es un handoff de implementación. La creación del extractor, su automatización, el almacenamiento del bundle y la recaptura remota no forman parte de `DATA-NORM-TRANS-001`. `DATA-NORM-TRANS-002` puede usar el baseline auditado como estado `before` para su análisis preimplementación; el dry-run físico de funciones y paquetes pertenece a `DATA-NORM-DB-004`.

#### 10. Conteos y fórmulas obligatorias

Para cada unidad, scope y perfil:

```text
eligible_rows        = count(rows que cumplen eligibility_predicate)
exact_distinct       = count(distinct valor original dentro del scope)
profile_distinct     = count(distinct representación del perfil dentro del scope)
collision_groups     = count(grupos con profile_count >= 2)
collision_rows       = sum(profile_count de grupos con profile_count >= 2)
active_collisions    = count(grupos cuyos miembros elegibles están todos activos)
collapse_delta       = exact_distinct - profile_distinct
null_rate            = null_count / eligible_rows
blank_rate           = empty_or_blank_count / eligible_rows
collision_row_rate   = collision_rows / eligible_rows
```

Toda división con denominador cero produce `NOT_APPLICABLE`, nunca cero implícito. Conteos de perfiles diferentes no se suman para estimar duplicados porque los mismos registros pueden aparecer en varios cortes.

#### 11. Identidad y digest reproducible

```text
baseline_id = DNT001::<environment>::<captured_at_utc>::<source_set_digest_prefix>

row_fingerprint = HMAC_SHA256(
  evidence_key,
  source_identity || primary_key || row_version || original_value_bytes
)

source_set_digest = SHA256(
  versión de schema + relaciones + columnas + predicates + scopes + orden canónico
)

result_set_digest = SHA256(
  fingerprints ordenados + conteos + perfiles + versiones de algoritmo
)
```

El digest prueba igualdad del corte capturado; no sustituye el respaldo ni permite reconstruir el valor. La clave HMAC pertenece al gestor de secretos y nunca se almacena junto al bundle. Si una tabla carece de clave o versión estable, la unidad queda `REJECTED` hasta definir identidad de captura reproducible.

#### 12. Privacidad y seguridad de la evidencia

| Clase               | Ejemplos                           | Evidencia ordinaria                | Evidencia restringida                       |
| ------------------- | ---------------------------------- | ---------------------------------- | ------------------------------------------- |
| `PUBLIC_CATALOG`    | nombres públicos de catálogo       | agregados y ejemplos autorizados   | exportación completa si no es necesaria     |
| `INTERNAL_BUSINESS` | productos, UOM, ubicaciones        | conteos, digests y IDs seudónimos  | valores originales y relaciones             |
| `PERSONAL`          | nombres, correos, teléfonos        | solo agregados y grupos seudónimos | valores, IDs y contexto autorizado          |
| `SECRET_OR_SIGNED`  | tokens, firmas, payload firmado    | presencia, conteo y exclusión      | literal únicamente bajo custodia específica |
| `EXTERNAL_EVIDENCE` | referencias y payloads de terceros | digest, emisor y contrato          | original preservado con acceso mínimo       |

Reglas:

1. El documento canónico no contendrá volcados de producción ni listados masivos de valores.
2. Los ejemplos se limitan a los ya aprobados en la auditoría o a fixtures sintéticos.
3. La evidencia restringida se cifra, se separa por finalidad y registra accesos.
4. Los bundles no incluyen credenciales, tokens, JWT, cookies, secretos, firmas privadas ni variables de entorno.
5. Un revisor recibe solo las filas y coordenadas necesarias para su dominio.
6. RLS, grants y autorización del repositorio de evidencia se prueban por separado; poseer el URI no concede acceso.
7. VITAL se valida mediante prueba de no inclusión, no copiando sus valores al corpus Vento.

#### 13. Consistencia exigida a la recaptura de BLOQUE R

La captura ejecutable deberá usar una instantánea transaccional coherente o un mecanismo equivalente documentado. Si por volumen se divide en páginas o lotes:

- todos los extractores usan el mismo corte lógico;
- la paginación tiene orden total estable y cursor registrado;
- altas, bajas o actualizaciones concurrentes se detectan mediante versión o reconciliación;
- cada lote conserva conteo y digest hijo;
- el digest padre fija orden y conjunto de lotes;
- una interrupción no mezcla resultados de cortes diferentes;
- reanudar exige demostrar que snapshot, schema, perfiles y predicates no cambiaron.

Un backup o PITR protege recuperación, pero no sustituye el registro lógico de valores, scopes, versiones y digests requerido por este baseline.

#### 14. Reconciliación y detección de deriva para BLOQUE R

Se ejecutan cuatro reconciliaciones independientes:

| Control                     | Comparación                                                                          | Resultado de falla                                |
| --------------------------- | ------------------------------------------------------------------------------------ | ------------------------------------------------- |
| `STRUCTURE_RECONCILIATION`  | relaciones, columnas, tipos, nulabilidad, índices y constraints frente al inventario | recapturar universo y clasificar deriva           |
| `POPULATION_RECONCILIATION` | conteos, actividad, nulos, vacíos y distintos                                        | explicar altas, bajas o cambios antes del dry-run |
| `ALGORITHM_RECONCILIATION`  | código, SQL, Unicode, locale y versiones de perfiles                                 | crear versión nueva; no comparar como equivalente |
| `EVIDENCE_RECONCILIATION`   | digests, owners, tiempos, queries y artefactos                                       | invalidar bundle incompleto o alterado            |

Clasificación de deriva:

```text
NO_DRIFT
EXPECTED_DATA_DRIFT
UNEXPLAINED_DATA_DRIFT
SCHEMA_DRIFT
SCOPE_DRIFT
ALGORITHM_DRIFT
SECURITY_BOUNDARY_DRIFT
EVIDENCE_DRIFT
```

Solo `NO_DRIFT` y `EXPECTED_DATA_DRIFT` con explicación, owner y evidencia aprobada pueden avanzar. Los demás estados cierran el gate.

#### 15. Paquete de evidencia requerido a BLOQUE R

```text
DNT001-BASELINE-BUNDLE/
  manifest.json
  provenance.json
  schema-inventory.json
  baseline-units.jsonl
  aggregate-metrics.jsonl
  collision-group-index.jsonl
  algorithm-versions.json
  relationship-counts.jsonl
  exclusion-proof.json
  reconciliation.json
  approvals.json
  digests.sha256
```

`collision-group-index.jsonl` contiene identificadores seudónimos, clase, scope, conteos y referencias controladas; no valores sensibles. Los artefactos con originales viven fuera del bundle ordinario y se enlazan mediante referencias autorizadas y digest.

#### 16. Responsables de la recaptura y ejecución posterior

| Rol                         | Responsabilidad                                     | No puede sustituir                |
| --------------------------- | --------------------------------------------------- | --------------------------------- |
| `baseline_operator`         | ejecutar captura de solo lectura y producir digests | aprobación del dominio            |
| `data_steward`              | validar clasificación, scope, calidad y excepciones | autorización de seguridad         |
| `domain_owner`              | confirmar significado y completitud de su unidad    | evidencia técnica                 |
| `security_privacy_reviewer` | aprobar minimización, acceso y tratamiento sensible | decisión de identidad empresarial |
| `platform_owner`            | confirmar proyecto, ambiente, snapshot y artefactos | aprobación funcional              |
| `independent_reconciler`    | repetir conteos/digests y registrar diferencias     | operador que produjo el baseline  |
| `release_approver`          | habilitar uso por `DATA-NORM-TRANS-002`             | cierre de hallazgos pendientes    |

El mismo actor no puede ser simultáneamente operador, reconciliador independiente y aprobador final del mismo bundle.

#### 17. Puerta documental de salida hacia `DATA-NORM-TRANS-002`

El baseline queda `CANONICAL_INPUT_FOR_DNT002` únicamente si:

1. los dos cortes históricos, proyecto, motor y procedencia están identificados;
2. el universo de 1.543 columnas y la frontera separada de VITAL coinciden con la auditoría aprobada;
3. el corpus de 4.030 filas, doce entidades y cinco perfiles conserva scopes provisionales explícitos;
4. grupos, filas, actividad, divergencias y dependencias coinciden con `DATA-NORM-AUD-004` y `007`;
5. los candidatos históricos permanecen separados de decisiones, duplicados confirmados y sobrevivientes;
6. los estados de catálogo, backlog, casos, ocurrencias, decisiones, SLA e historia quedan congelados sin convertir ausencia física en cero;
7. `TREQ-DATA-083`, `116`, `122` y `159` tienen cobertura material;
8. la evidencia sensible permanece minimizada y no se incorporan volcados productivos al repositorio;
9. no se ejecutó una consulta remota nueva para presentar un corte histórico como estado presente;
10. no se ejecutó ni autorizó transformación, fusión, dry-run físico, backfill, constraint o cambio de writer;
11. la recaptura, drift, automatización y ejecución física permanecen asignados a BLOQUE R;
12. `DATA-NORM-TRANS-002` continúa reservada hasta aprobación explícita del usuario.

La aprobación explícita de esta tarea fija el baseline histórico como entrada canónica de `DATA-NORM-TRANS-002`. No certifica el remoto presente, no crea un bundle ejecutado de BLOQUE R y no cambia automáticamente ninguna recaptura futura a `APPROVED_FOR_DRY_RUN`.

#### 18. Trazabilidad de requisitos

| Requisito        | Cobertura material                                                                                         | Evidencia esperada                                                |
| ---------------- | ---------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| `TREQ-DATA-083`  | separa actividad observada de los estados canónicos `ACTIVE`, `SUSPENDED` y `RETIRED`, y preserva historia | tabla 2.1, cortes y prohibición de reinterpretación retroactiva |
| `TREQ-DATA-116`  | conserva ocurrencias y scopes; prohíbe que grupos o muestras aprueben elementos no examinados | unidades U01–U12, scopes provisionales y candidatos históricos |
| `TREQ-DATA-122`  | congela ausencia o distribución de casos, decisiones, SLA, evidencia y relaciones sin autoaprobar | tabla 2.1, dependencias y frontera frente a backfill/cutover |
| `TREQ-DATA-159`  | clasificación de reproducibilidad, replay controlado y explicación de diferencias sin modificar producción | cortes, perfiles, manifest futuro, digests y reconciliación de solo lectura |
| `DN-ARC-005-H08` | datos existentes se evalúan sin mutación global                                                            | frontera, unidades y gate sin DML                                 |
| `DN-ARC-007-H02` | backlog disperso se captura sin activar formas                                                             | índices seudónimos y clasificación propietaria                    |
| `DN-ARC-010-H11` | enforcement no inicia sin baseline                                                                         | gate de catorce condiciones y estado bloqueante                   |
| `SUPA-TRANS-013` | ambiente y paridad se identifican                                                                          | proyecto, corte, herramientas y versiones                         |
| `SUPA-TRANS-014` | contratos y documentación permanecen trazables                                                             | manifest y digests de artefactos                                  |
| `SUPA-TRANS-015` | ejecución pertenece a paquetes del roadmap                                                                 | baseline es prerequisito, no paquete de mutación                  |

#### 19. Casos de conformidad mínimos

| Caso                                                       | Resultado esperado                                                  |
| ---------------------------------------------------------- | ------------------------------------------------------------------- |
| repetir captura sobre el mismo snapshot, query y versiones | mismo `result_set_digest`                                           |
| cambiar un valor sin cambiar conteo total                  | digest diferente y `EXPECTED_DATA_DRIFT` o `UNEXPLAINED_DATA_DRIFT` |
| cambiar Unicode, locale o helper                           | `ALGORITHM_DRIFT`; baseline nuevo                                   |
| agregar una columna textual                                | `SCHEMA_DRIFT`; inventario y clasificación nuevos                   |
| mezclar páginas de cortes distintos                        | bundle `REJECTED`                                                   |
| encontrar dos valores con la misma representación          | grupo candidato; ninguna fusión automática                          |
| campo personal exportado al bundle ordinario               | falla de seguridad y bundle `REJECTED`                              |
| VITAL incluido en corpus de transformación                 | falla de frontera y bundle `REJECTED`                               |
| unidad sin owner o scope                                   | gate cerrado                                                        |
| conteo cero por error de extracción                        | error; no se interpreta como ausencia de datos                      |
| backup disponible sin digest lógico                        | recuperación parcial; baseline incompleto                           |
| baseline histórico usado como certificación presente       | uso no conforme                                                     |
| catálogo o cola canónicos no materializados al corte        | estado explícito de ausencia; nunca conteo cero ni conformidad       |
| grupo auditado tratado como `review_case_key` aprobado      | uso no conforme; agrupación pertenece a la tarea posterior aplicable |

#### 20. Límites explícitos

Esta tarea no:

- ejecuta consultas nuevas sobre el proyecto remoto;
- crea extractores, harnesses, automatizaciones o almacenamiento de bundles;
- crea migraciones, tablas de staging, vistas, funciones ni buckets;
- guarda datos productivos en Git o fixtures;
- decide correcciones, excepciones, duplicados o sobrevivientes;
- ejecuta dry-runs, backfills, restricciones o cambios sobre writers;
- certifica que el corte de julio continúe vigente;
- transforma, inspecciona en detalle ni modifica datos de VITAL;
- reemplaza backup, PITR, rollback, pruebas de transición o aprobación por dominio.

Asignación posterior obligatoria:

| Trabajo pendiente | Propietario |
| --- | --- |
| recaptura fresca y drift entre local, staging y producción | `AUTH-DB-028` |
| respaldo, restauración y rollback técnico previo | `AUTH-DB-029` |
| almacenamiento y funciones físicas de normalización | `DATA-NORM-DB-001` a `003` |
| dry-run y reporte físico de colisiones | `DATA-NORM-DB-004` |
| backfills, constraints, índices, triggers y trazas | `DATA-NORM-DB-005` a `009` |
| análisis preimplementación de reglas sobre el baseline aprobado | `DATA-NORM-TRANS-002` |
| clasificación y decisión de colisiones | `DATA-NORM-TRANS-003` y `004` |
| aprobación por dominio | `DATA-NORM-TRANS-009` |

#### 21. Referencias técnicas vigentes

| Fuente oficial                                                                                                     | Aplicación limitada en este contrato                                                         |
| ------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------- |
| [Supabase — Database Backups](https://supabase.com/docs/guides/platform/backups)                                   | distinguir respaldo, restauración y PITR del baseline lógico reproducible                    |
| [Supabase — Local development with schema migrations](https://supabase.com/docs/guides/local-development/overview) | mantener cambios de schema versionados y probarlos localmente antes de desplegar             |
| [Supabase — Seeding your database](https://supabase.com/docs/guides/local-development/seeding-your-database)       | usar datos sintéticos o autorizados para ambientes reproducibles; no copiar producción a Git |

Estas referencias no conceden autorización de acceso, ejecución remota ni transformación. Su vigencia deberá verificarse nuevamente al preparar el paquete ejecutable.

#### 22. Criterios de aceptación documental

- [x] existe una identidad de baseline y dos cortes técnicos explícitos;
- [x] el universo de 1.543 columnas y la frontera VITAL están cuantificados;
- [x] el corpus de 4.030 filas y doce entidades está congelado;
- [x] perfiles, colisiones, divergencias y relaciones conservan valores observados;
- [x] cada unidad tiene scope y coordenadas anti-fusión;
- [x] catálogos, backlog, casos, ocurrencias, decisiones, SLA e historia tienen estado explícito al corte;
- [x] recaptura, fórmulas, digests, privacidad y evidencia quedan como contrato para BLOQUE R;
- [x] la deriva futura tiene clasificación y gate cerrado por defecto;
- [x] responsables y segregación de la ejecución posterior están definidos;
- [x] `TREQ-DATA-083`, `116`, `122` y `159` tienen trazabilidad material;
- [x] no se creó extractor, harness, bundle ejecutado ni automatización física;
- [x] no se ejecutó ni autorizó DDL, DML o acceso remoto nuevo;
- [x] `DATA-NORM-TRANS-002` permanece reservada.

#### 23. Continuidad

```text
TAREA CANÓNICAMENTE APROBADA
DATA-NORM-TRANS-001 — Crear baseline de valores actuales antes de transformar
        ↓
SIGUIENTE TAREA CANÓNICAMENTE APROBADA
DATA-NORM-TRANS-002 — Ejecutar dry-run de cada regla de normalización
```
