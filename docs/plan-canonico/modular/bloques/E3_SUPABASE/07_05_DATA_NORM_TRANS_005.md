### ✅ DATA-NORM-TRANS-005 — Definir backfills por dominio y lotes reversibles

**Estado:** APROBADA

**Condición canónica:** APROBADA EXPLÍCITAMENTE POR EL USUARIO — `2026-08-01`

**Tarea anterior:** `DATA-NORM-TRANS-004 — Resolver duplicados antes de aplicar restricciones de unicidad` — APROBADA

**Tarea siguiente:** `DATA-NORM-TRANS-006 — Activar reglas sobre nuevas escrituras de forma progresiva` — APROBADA

**Tipo de tarea:** diseño material de unidades de backfill, manifiesto ejecutable de solo lectura, lotes, checkpoints, reanudación, reconciliación y reversibilidad; sin ejecutar DDL, DML, migraciones, backfills, merges, activaciones, constraints, consultas remotas nuevas ni cambios sobre VITAL

**Fecha de preparación documental:** `2026-08-01`

#### 1. Resultado concreto

Esta tarea produce:

```text
DATA-NORM-BACKFILL-PLAN-005@1.0.0
DATA-NORM-BATCH-CONTRACT-005@1.0.0
DATA-NORM-RECONCILIATION-PROFILE-005@1.0.0
DATA-NORM-ROLLBACK-ROUTING-005@1.0.0
```

El plan completo se materializa también en el archivo ejecutable y read-only:

```text
docs/plan-canonico/modular/bloques/E3_SUPABASE/
DATA-NORM-TRANS-005_BACKFILL_PLAN.sql
```

Ese SQL crea nueve unidades temporales, verifica modos y bloqueos, devuelve el manifiesto ordenado y termina con `ROLLBACK`. No contiene cambios persistentes ni se presenta como backfill ejecutado.

##### 1.1 Validación local ejecutada

El manifiesto se ejecutó el `2026-08-01` contra el PostgreSQL del stack local de `vento-shell` mediante `psql` dentro de `supabase_db_vento-shell`:

| Evidencia | Resultado |
| --- | --- |
| apertura transaccional | `BEGIN` |
| estructura usada | tabla temporal de sesión |
| unidades cargadas | `INSERT 0 9` |
| aserciones internas | bloque `DO` completado sin excepción |
| filas devueltas | 9, en orden 10 a 90 |
| planes únicos | 9 |
| planes de merge | exactamente 1 |
| estados físicos falsamente declarados | 0 |
| cierre | `ROLLBACK` |
| cambios persistentes | 0 |

La prueba valida sintaxis PostgreSQL, carga del manifiesto, restricciones, aserciones, salida ordenada y ausencia de persistencia. No valida todavía los datos remotos, targets físicos ni la ejecución de un backfill real.

#### 2. Alcance verdadero

La tarea define exactamente:

1. qué universos pueden entrar a backfill y cuáles deben preservarse o bloquearse;
2. nueve unidades por dominio con modo, mapping, corte, orden y tamaño de chunk;
3. el único merge aprobado: dos perfiles UOM de `Queso Gouda`;
4. derivaciones no destructivas para UOM, posiciones y búsqueda;
5. cuarentena lógica para observaciones visibles, diccionario y casos de identidad abiertos;
6. lotes deterministas, checkpoints confirmados después del commit e idempotencia;
7. prechecks, outcomes, reconciliación y tolerancias cero;
8. rollback o compensación por unidad;
9. handoff explícito al BLOQUE R y exclusiones para la activación progresiva de 006.

No define ni ejecuta:

- nombres físicos finales de tablas, columnas, funciones, RPC, triggers o índices;
- una migración SQL con DML;
- la estrategia de writers y delta, propiedad de `SUPA-TRANS-008`;
- suites físicas de transición, propiedad de `SUPA-TRANS-009`;
- el rollback ejecutable transversal, propiedad de `SUPA-TRANS-011`;
- activación sobre escrituras nuevas, propiedad de `DATA-NORM-TRANS-006`;
- reapertura automática de decisiones bloqueadas;
- políticas internas de VITAL.

La implementación física deberá crearse y ejecutarse posteriormente desde `vento-shell` en el BLOQUE R.

#### 3. Fuentes y versión efectiva

| Fuente | Decisión consumida |
| --- | --- |
| `DATA-NORM-TRANS-001` | baseline, cortes y conteos aprobados |
| `DATA-NORM-TRANS-002` | 25 unidades de dry-run, resultados y bloqueos |
| `DATA-NORM-TRANS-003` | colisiones, falsos positivos y corpus negativo |
| `DATA-NORM-TRANS-004` | seis disposiciones, merge Gouda y exclusiones |
| `SUPA-TRANS-005` | modos de backfill, outcomes, cuarentena y reconciliación |
| `SUPA-TRANS-008` | obligación de resolver writers, high-watermark y delta |
| `SUPA-TRANS-009` | manifiestos y evidencia de prueba |
| `SUPA-TRANS-011` | rollback por paquete de cambio |

Se reutiliza sin modificación el `resolved_version_set` y el digest aprobados en 004:

```text
sha256:36d4f3ed68d9943067a3dca9834d7eb696a60f96f823c71515e4f9bad290b256
```

Un cambio de política, mapping, parser, locale, Unicode, miembro, scope o source cut crea una revisión y un dry-run nuevos.

#### 4. Manifiesto de nueve unidades

| Orden | `backfill_plan_id` | Dominio | Universo observado | Modo principal | Estado documental |
| ---: | --- | --- | ---: | --- | --- |
| 10 | `DNT005-UOM-GOUDA-MERGE-V1` | inventario/UOM | 2 perfiles | `APPROVED_MERGE_PLAN` | listo condicionado a revalidación |
| 20 | `DNT005-UOM-STRUCTURAL-DERIVATION-V1` | inventario/UOM | 2.312 perfiles/políticas | `VERSIONED_TRANSFORMATION` | bloqueado por destino y writers |
| 30 | `DNT005-INVENTORY-POSITION-SCOPE-V1` | posiciones | 72 posiciones | `VERSIONED_TRANSFORMATION` | bloqueado por destino y writers |
| 40 | `DNT005-SEARCH-REPRESENTATIONS-V1` | búsqueda transversal | 4.030 filas | `VERSIONED_TRANSFORMATION` | bloqueado por destino y writers |
| 50 | `DNT005-VISIBLE-FORM-CANDIDATES-V1` | texto empresarial visible | 46 observaciones no deduplicadas | `QUARANTINE_ONLY` | bloqueado por coordenada |
| 60 | `DNT005-DICTIONARY-TOKEN-CANDIDATES-V1` | texto empresarial visible | universo por escanear, 3 reglas | `QUARANTINE_ONLY` | bloqueado por coordenada |
| 70 | `DNT005-PASS-LIFECYCLE-PRESERVATION-V1` | PASS/políticas | 20 filas | `NO_BACKFILL_REQUIRED` | preservación certificada |
| 80 | `DNT005-PERSON-NAME-PRESERVATION-V1` | identidad/personas | 106 representaciones | `NO_BACKFILL_REQUIRED` | preservación certificada |
| 90 | `DNT005-OPEN-IDENTITY-BLOCKERS-V1` | producto/remisiones | 8 filas | `QUARANTINE_ONLY` | bloqueado por autoridad |

Los conteos pertenecen a cortes distintos y no se suman como un total global de filas a modificar. Las 46 observaciones visibles corresponden a `4 + 32 + 1 + 9` señales que pueden solaparse; primero deberán deduplicarse por coordenada y PK.

#### 5. Unidad 10 — merge UOM Gouda

```text
source members:
  0f98e076-8e83-485b-be61-f4d9a7fbd3fe
  270c3233-2650-4c32-9b3d-b0bee0a2d002

approved survivor:
  270c3233-2650-4c32-9b3d-b0bee0a2d002

crosswalk:
  0f98e076-8e83-485b-be61-f4d9a7fbd3fe
    -> 270c3233-2650-4c32-9b3d-b0bee0a2d002
```

| Contrato | Valor |
| --- | --- |
| modo | `APPROVED_MERGE_PLAN` |
| mapping | `EXACT_CONTRACT_MAPPING` |
| corte | `QUIESCED_SNAPSHOT` |
| chunk | 1 grupo / 2 miembros |
| orden | `product_id, usage_context, id` |
| efecto | crosswalk, referencias vivas autorizadas y desactivación razonada del no sobreviviente |
| reversibilidad | transaccional antes de hechos nuevos; compensatoria después |

Precondiciones obligatorias:

1. ambos IDs existen, permanecen activos y no cambiaron versión;
2. producto, etiqueta, unidades, cantidades, contexto y fuente siguen iguales;
3. el sobreviviente continúa como default autoritativo;
4. no apareció un tercer miembro en la coordenada;
5. toda FK, referencia lógica, JSON, snapshot, archivo e integración tiene tratamiento;
6. writers están congelados o serializados;
7. conteos y digests de referencias coinciden con el manifiesto;
8. existe aprobación de ejecución R y rollback ensayado.

Si falla una sola precondición, el outcome es `BLOCKED_CONFLICT` o `SOURCE_DRIFT`; nunca se elige otro sobreviviente automáticamente.

#### 6. Unidad 20 — representación estructural UOM

La unidad cubre el corte histórico de 2.312 perfiles y políticas. No cambia etiquetas, cantidades, unidades, contexto, fuente, proveedor, estado o vigencia.

Deriva separadamente:

```text
product_id
+ input_quantity
+ input_unit_code
+ stock_quantity
+ stock_unit_code
+ multiplier
+ usage_context
+ source
+ supplier_when_applicable
+ active_interval
```

Reglas:

- `Queso Mozzarella Tajado` conserva perfiles `purchase` y `remission` distintos;
- los 14 grupos activos estructuralmente divergentes no se fusionan;
- una etiqueta igual no produce crosswalk;
- nulos y ausencia permanecen distintos;
- el original se conserva y la huella es una derivación versionada;
- el lote usa chunks de 250 ordenados por `product_id, usage_context, id`;
- queda bloqueado hasta existir destino físico y estrategia `HIGH_WATERMARK_PLUS_DELTA`.

#### 7. Unidad 30 — scope jerárquico de posiciones

Los 72 registros `Nivel 1` a `Nivel 6` se preservan como identidades legítimas. Solo podrá derivarse:

```text
site_id
+ location_id
+ parent_position_id o hierarchical_path
+ code
```

| Propiedad | Definición |
| --- | --- |
| chunk | 50 filas |
| orden | `site_id, location_id, parent_position_id, code, id` |
| mapping | `DERIVE_WITHOUT_SOURCE_MUTATION` |
| source cut | `HIGH_WATERMARK_PLUS_DELTA` |
| control negativo | los 72 miembros permanecen distintos |
| rollback | eliminar/reconstruir únicamente la derivación, nunca las posiciones |

Una derivación que colapse dos caminos, padres o códigos produce `INVARIANT_VIOLATION`.

#### 8. Unidad 40 — representaciones de búsqueda

El corte histórico de 4.030 filas se procesa en chunks de 250 por dominio, entidad y PK. Se materializan, cuando exista contrato físico:

```text
SOURCE_VALUE              -- preservado
SEARCH_FORM_KEY           -- forma normalizada versionada
SEARCH_ACCENT_KEY         -- representación tolerante es-CO versionada
algorithm_key
algorithm_version
version_set_digest
source_value_hash/version
```

Controles:

1. `_vento_slugify` y `_navigation_slugify` son evidencia legacy, no algoritmo objetivo;
2. 2.730 diferencias exactas y 324 semánticas entre helpers permanecen en el corpus de regresión;
3. 27 grupos y 54 filas sin tildes se conservan como colisiones conocidas;
4. 17 grupos completamente activos no bloquean ni fusionan desde búsqueda;
5. alias, ranking o similitud no crean identidad;
6. una clave derivada nunca sobrescribe el valor fuente;
7. el backfill permanece bloqueado hasta existir algoritmo y destino físicos certificados.

#### 9. Unidades 50 y 60 — texto visible y diccionario

##### 9.1 Observaciones de forma

| Señal | Observaciones históricas |
| --- | ---: |
| espacios de borde | 4 |
| separadores repetidos | 32 |
| espacio previo a puntuación | 1 |
| ausencia posterior a puntuación | 9 |

No son todavía filas elegibles. Cada observación deberá adquirir:

```text
domain + entity + field + source role + field class
+ primary key + source version/hash
+ owner + approved visible result
```

Hasta entonces se conserva el original y el outcome es `REVIEW_REQUIRED` o `BLOCKED_POLICY`.

##### 9.2 Diccionario

Las tres reglas aprobadas son `maiz -> maíz`, `clasico -> clásico` y `frio -> frío`. El scan futuro:

- exige coincidencia exacta por token, no substring;
- filtra campo, clase, locale y scope elegibles;
- excluye marcas, códigos, personas, legales, externos y texto libre;
- preserva `SOURCE_VALUE`;
- separa corrección visible de identidad y deduplicación;
- envía `expresso` y cualquier ambigüedad a revisión;
- no ejecuta cambios mientras falten coordenadas y decisión de identidad.

#### 10. Unidades 70, 80 y 90 — preservación y exclusiones

| Unidad | Resultado obligatorio |
| --- | --- |
| PASS y políticas | conservar ocho pares de catálogo y dos pares de política como historia activo/inactivo; 20 filas sin backfill |
| personas | conservar 106 representaciones; nombre normalizado nunca forma identidad ni autoriza fusión |
| casos abiertos | conservar seis productos de Chai/Latte/Choco y dos categorías de remisión; excluir de mutación y unicidad |

Estas unidades producen `NO_ACTION_REQUIRED`, `PRESERVED_SOURCE`, `REVIEW_REQUIRED` o `ESCALATED_STRUCTURAL`. Ninguna produce `APPLIED_CHANGE`.

#### 11. Contrato de corrida, lote y checkpoint

Cada ejecución física futura deberá registrar:

```text
backfill_run_id
backfill_plan_id y version
batch_id
chunk_id
source_cut_reference
source_snapshot_or_digest
mapping_and_policy_versions
first_and_last_source_key
expected_item_count
confirmed_item_count
rejected_item_count
quarantined_item_count
checkpoint_digest
started_at
committed_at
status
```

Reglas:

1. el orden indicado en el manifiesto es estable;
2. el chunk no usa `offset`; continúa por la última clave confirmada;
3. un checkpoint solo existe después del commit;
4. un elemento confirmado no vuelve a mutarse;
5. payload o versión diferentes bajo la misma clave producen conflicto;
6. timeout exige consultar outcome previo antes de reintentar;
7. cambiar source cut crea una corrida vinculada;
8. el fallo de una fila no se presenta como rollback global;
9. source drift bloquea el chunk completo antes de aplicar efectos;
10. el mismo lote no mezcla versiones ni modos de coexistencia.

#### 12. Estados y secuencia del lote

```text
PLANNED
  -> PRECHECKED
  -> ELIGIBLE
  -> RUNNING
  -> RECONCILING
  -> COMMITTED
  -> VERIFIED
```

Salidas laterales:

```text
PRECHECKED -> BLOCKED
RUNNING -> FAILED_PARTIAL
RECONCILING -> ROLLBACK_REQUIRED
COMMITTED -> COMPENSATION_REQUIRED
```

`VERIFIED` exige evidencia poscommit; `COMMITTED` por sí solo no cierra la unidad. Estados terminales no se editan: una corrección crea nueva corrida vinculada.

#### 13. Outcome por elemento

Cada fila termina exactamente en uno:

```text
NO_ACTION_REQUIRED
PRESERVED_SOURCE
TRANSFORMED_BY_VERSIONED_RULE
REFERENCE_REMAPPED
MERGED_BY_APPROVED_PLAN
QUARANTINED
REVIEW_REQUIRED
REJECTED_FROM_TARGET
FAILED_TECHNICALLY
```

No existe `SUCCESS` genérico. `FAILED_TECHNICALLY` no cambia la decisión empresarial ni permite reintentar con otra versión.

#### 14. Reconciliación por unidad

| Unidad | Antes/después obligatorio | Tolerancia |
| --- | --- | --- |
| Gouda | miembros, crosswalk, FK/referencias, default, huérfanos, hechos y auditoría | cero |
| UOM estructural | conteo fuente, digest de claves y huellas, nulos, contextos y colisiones | cero filas omitidas; colisiones explicadas |
| posiciones | 72 IDs, padres, caminos, códigos y 72 huellas distintas | cero colapsos |
| búsqueda | 4.030 fuentes, derivaciones, digest, 27 grupos conocidos y divergencia entre algoritmos | cero fuente mutada |
| texto visible | observaciones deduplicadas, revisadas, bloqueadas y preservadas | cero correcciones sin coordenada |
| diccionario | candidatos por regla, elegibles, excluidos, revisados y bloqueados | cero substring o scope indebido |
| PASS | 20 filas, estados, vigencia, producto y sede | cero historia eliminada |
| personas | 106 representaciones y vínculos secundarios | cero identidad inferida por nombre |
| casos abiertos | 8 miembros y cuatro expedientes | cero miembro modificado |

La igualdad de conteos no sustituye identidad, referencias, seguridad ni semántica.

#### 15. Tolerancias cero

Se bloquea el lote ante:

- ID estable perdido o duplicado;
- referencia autoritativa huérfana;
- fila sin outcome;
- mezcla de sede, tenant, ambiente o producto;
- source cut, mapping o versión desconocidos;
- valor original destruido;
- corrección por similitud, frecuencia o primer resultado;
- UOM fusionada sin contexto;
- posición colapsada por nombre;
- persona fusionada por texto;
- writer activo fuera de la estrategia de delta;
- rollback requerido sin paquete propietario;
- dato sensible expuesto;
- cualquier efecto sobre VITAL.

#### 16. Rollback por unidad

| Clase | Unidades | Estrategia |
| --- | --- | --- |
| `REVERSIBLE_THEN_COMPENSATABLE` | Gouda | rollback transaccional antes de nuevos hechos; después, compensación preservando crosswalk y auditoría |
| `REBUILD_DERIVATION` | UOM, posiciones y búsqueda | descartar/reconstruir derivación con versión anterior; nunca restaurar sobrescribiendo fuente |
| `NO_MUTATION_TO_ROLL_BACK` | texto, diccionario, PASS, personas y casos abiertos | conservar evidencia y cerrar/reabrir revisión; no existe dato transformado |

Un rollback nunca elimina decisiones, source cut, checkpoints, outcomes, crosswalks o evidencia del intento.

#### 17. Seguridad y ejecución posterior

1. Los scripts físicos vivirán en `vento-shell` y se crearán con `supabase migration new` cuando el BLOQUE R lo autorice.
2. Toda función o tabla auxiliar deberá tener owner, grants y RLS explícitos cuando esté en un schema expuesto.
3. La ejecución por lotes usará comando servidor/RPC autorizada o bypass controlado; no credenciales en clientes.
4. `SECURITY DEFINER` no se usará para evadir RLS o permisos.
5. Logs y checkpoints minimizarán valores personales, legales o externos.
6. El actor que aprueba no ejecutará un merge sensible sin segregación aplicable.
7. El SQL adjunto es un manifiesto temporal de solo lectura, no una migración.

#### 18. Referencias Supabase verificadas

| Fuente | Aplicación |
| --- | --- |
| [Supabase — Database migrations](https://supabase.com/docs/guides/local-development/database-migrations) | reservar cambios físicos a migraciones versionadas y verificadas localmente |
| [Supabase — Testing your database](https://supabase.com/docs/guides/database/testing) | exigir pruebas de base y regresión antes de ejecutar lotes |
| [Supabase — Row Level Security](https://supabase.com/docs/guides/database/postgres/row-level-security) | no ampliar acceso al crear artefactos auxiliares futuros |
| [Supabase — Breaking changes](https://supabase.com/changelog?types=breaking-change) | revalidar plataforma antes del BLOQUE R |

El cambio próximo sobre versionado explícito de extensiones no afecta este plan porque no crea ni modifica extensiones. El cambio de exposición automática por Data API obliga a declarar grants y RLS si más adelante se crean tablas de control expuestas.

#### 19. Trazabilidad de requisitos directos

| Requisito | Evidencia producida |
| --- | --- |
| `TREQ-SUPABASE-1739` | ocho modos de mapping cerrados y sin heurísticas |
| `TREQ-SUPABASE-1742` | nulos, ausencia, unidades, texto y originales permanecen diferenciados |
| `TREQ-SUPABASE-1759` | mappings versionados y valores ambiguos bloqueados |
| `TREQ-DATA-113` | decisión y backfill permanecen operaciones distintas |
| `TREQ-DATA-145` | estados cerrados y terminalidad por corrida |
| `TREQ-DATA-146` | aprobación, ejecución y activación permanecen separadas |
| `TREQ-DATA-147` | no existe dual write ni fallback de versión |
| `TREQ-DATA-157` | precheck fija fuente, coordenada, digest y estado esperado |
| `TREQ-DATA-162` | decisiones y evidencia no se editan durante materialización |
| `TREQ-DATA-185` | ningún backfill activa enforcement certificado |
| `TREQ-DATA-192` | aplicación no ejecuta ni confirma el lote |
| `TREQ-DATA-194` | mutación física futura atraviesa frontera transaccional autorizada |
| `TREQ-DATA-197` | secuencia conserva evaluación, revalidación, commit y propagación |
| `TREQ-DATA-201` | preview no vinculante y source drift bloqueante |
| `TREQ-DATA-202` | scripts e imports requieren bypass controlado y evidencia |
| `TREQ-DATA-204` | reglas léxicas no se materializan junto con la decisión |
| `TREQ-DATA-206` | unicidad física permanece fuera del backfill |

#### 20. Handoff hacia 006 y BLOQUE R

`DATA-NORM-TRANS-006` podrá diseñar activación progresiva únicamente para:

- coordenadas cuya derivación haya sido materializada y reconciliada en R;
- unidades sin bloqueos de identidad, target, writers o source drift;
- políticas en modo máximo aprobado por `UNIQUENESS-READINESS-MATRIX-004`;
- nuevas escrituras que consuman el mismo `version_set_digest`.

Permanecen fuera de activación:

- Chai, Latte Frío, Choco Bites y categoría `VÍVERES & BODEGA PRINCIPAL`;
- nombre de persona;
- UOM por etiqueta sin contexto;
- posiciones por nombre sin padre/código;
- búsqueda tolerante como identidad;
- cualquier lote no ejecutado y verificado físicamente.

#### 21. Criterios de aceptación documental

- [x] existe un manifiesto SQL ejecutable y read-only;
- [x] el manifiesto fue ejecutado en PostgreSQL local: nueve filas, aserciones superadas y `ROLLBACK` confirmado;
- [x] nueve unidades tienen dominio, universo, modo, mapping, corte, chunk, orden, efecto, estado y rollback;
- [x] el merge Gouda conserva miembros, sobreviviente, crosswalk y precondiciones;
- [x] UOM, posiciones y búsqueda usan derivaciones sin destruir fuente;
- [x] 46 observaciones se declaran no deduplicadas y no filas a corregir;
- [x] las tres reglas de diccionario permanecen bloqueadas hasta tener coordenada;
- [x] PASS, personas y ocho miembros abiertos se preservan sin backfill;
- [x] corrida, lote, checkpoint, reanudación y outcomes están cerrados;
- [x] cada unidad tiene reconciliación y tolerancias cero;
- [x] rollback o compensación está asignado por clase;
- [x] diecisiete requisitos directos tienen trazabilidad;
- [x] documentación y breaking changes de Supabase fueron verificados;
- [x] no se ejecutó DDL, DML, migración, merge, backfill, consulta remota o constraint;
- [x] `DATA-NORM-TRANS-006` permanece reservada.

#### 22. Continuidad

```text
TAREA CANÓNICAMENTE APROBADA
DATA-NORM-TRANS-005 — Definir backfills por dominio y lotes reversibles
        ↓
SIGUIENTE TAREA CANÓNICAMENTE APROBADA
DATA-NORM-TRANS-006 — Activar reglas sobre nuevas escrituras de forma progresiva
```
