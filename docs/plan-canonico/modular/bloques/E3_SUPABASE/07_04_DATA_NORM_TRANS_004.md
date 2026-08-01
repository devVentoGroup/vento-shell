### ✅ DATA-NORM-TRANS-004 — Resolver duplicados antes de aplicar restricciones de unicidad

**Estado:** APROBADA

**Condición canónica:** APROBADA EXPLÍCITAMENTE POR EL USUARIO — `2026-08-01`

**Tarea anterior:** `DATA-NORM-TRANS-003 — Identificar colisiones producidas por valores normalizados` — APROBADA

**Tarea siguiente:** `DATA-NORM-TRANS-005 — Definir backfills por dominio y lotes reversibles` — APROBADA

**Tipo de tarea:** resolución documental de expedientes de colisión, definición de un plan concreto de consolidación y cierre o bloqueo explícito de candidatos; sin DDL, DML, migraciones, backfills, desactivaciones, reasignaciones, creación de constraints, ejecución remota nueva, cambios en aplicaciones ni modificación de VITAL

**Fecha de preparación documental:** `2026-08-01`

#### 1. Resultado concreto

Esta tarea produce:

```text
NORMALIZED-DUPLICATE-RESOLUTION-REGISTER-004@1.0.0
UOM-MERGE-PLAN-GOUDA-004@1.0.0
UNIQUENESS-READINESS-MATRIX-004@1.0.0
UNRESOLVED-IDENTITY-BLOCKER-REGISTER-004@1.0.0
```

Los seis casos remitidos por `DATA-NORM-TRANS-003` quedan resueltos para el estado de evidencia disponible:

| Resultado | Casos |
| --- | ---: |
| duplicado confirmado con plan documental completo | 1 |
| identidad distinta confirmada | 1 |
| revisión estructural obligatoria | 1 |
| evidencia insuficiente; conservación y bloqueo | 3 |
| fusiones físicas ejecutadas | 0 |

Resolver no significa forzar una fusión. Un caso queda resuelto para esta fase cuando recibe una disposición explícita, una conducta permitida, una conducta bloqueada y un propietario posterior. Los casos sin autoridad suficiente conservan todos sus registros y bloquean cualquier constraint incompatible.

#### 2. Evidencia material utilizada

| Evidencia | Corte | Uso |
| --- | --- | --- |
| `DATA-NORM-AUD-004` y `007` | observaciones aprobadas del `2026-07-30` | clasificación, actividad, estructura y radio relacional |
| `DATA-NORM-TRANS-001` | baseline aprobado | miembros, conteos, fronteras y limitaciones |
| `DATA-NORM-TRANS-002` | dry-run aprobado | grupos activos y comportamiento de reglas |
| `DATA-NORM-TRANS-003` | registro aprobado | seis expedientes abiertos |
| `outputs/019f9f2a-9508-77e3-a9ec-4ee497bf6531/operacion_piloto_data.json` | exportación `2026-07-30T02:47:40.28Z`, solo lectura | IDs y coordenadas actuales del catálogo activo |
| `tmp/nexo_public_data_dump.sql` | snapshot histórico disponible en repositorio | IDs y huellas históricas de perfiles UOM |

La exportación del piloto declara 950 productos activos y 1.074 perfiles UOM activos revisados. El dump UOM es evidencia histórica auxiliar: sus IDs y versiones deberán revalidarse antes de cualquier ejecución física. Esta tarea no presenta ese snapshot como estado remoto actual ni consulta producción nuevamente.

#### 3. Conjunto efectivo de versiones

```text
resolved_version_set =
  DATA-TEXT-NORMALIZATION-POLICY-REGISTRY-001@1.0.0
  DATA-TEXT-FIELD-CLASS-AND-TREATMENT-CATALOG-002@1.0.0
  DATA-COMMERCIAL-NAME-CAPITALIZATION-POLICY-003@1.0.0
  VENTO_COMMERCIAL_CAPITALIZATION_ES_CO@1.0.0
  VENTO_COMMERCIAL_CONNECTOR_CATALOG_ES_CO@1.0.0
  VENTO_OFFICIAL_TEXT_EXCEPTION_CATALOG@1.0.0
  VENTO_CANONICAL_ORTHOGRAPHIC_DICTIONARY_ES_CO@1.0.0
  VENTO_AMBIGUOUS_TEXT_REVIEW_QUEUE_POLICY@1.0.0
  VENTO_TEXT_SEARCH_AND_COMPARISON_POLICY@1.0.0
  VENTO_TEXT_RULE_AUDIT_VERSION_AND_IDEMPOTENCY_POLICY@1.0.0
  VENTO_NORMALIZED_UNIQUENESS_AND_DUPLICATE_GOVERNANCE_POLICY@1.0.0
  VENTO_TEXT_NORMALIZATION_EXECUTION_LAYER_POLICY@1.0.0
  VENTO_EXTERNAL_INBOUND_DATA_TREATMENT_POLICY@1.0.0

version_set_digest =
  sha256:36d4f3ed68d9943067a3dca9834d7eb696a60f96f823c71515e4f9bad290b256
```

No se permite `latest`, fallback, caché implícita ni combinación de versiones fuera de este conjunto.

#### 4. Registro cerrado de resolución

| Caso | Evidencia decisiva | Disposición propuesta | Estado de registros | Unicidad |
| --- | --- | --- | --- | --- |
| `COLL-003-PROD-001` — Chai | mismo tipo/categoría/unidad, pero dos SKU, IDs, fechas y dependencias no reconciliadas | `INSUFFICIENT_EVIDENCE` | conservar ambos activos | bloqueada para nombre normalizado de producto |
| `COLL-003-PROD-002` — Latte frío | mismo tipo/unidad; categorías distintas y dos vínculos de catálogo | `STRUCTURAL_MODEL_REVIEW_REQUIRED` | conservar ambos activos | bloqueada hasta decidir categoría e identidad |
| `COLL-003-PROD-004` — Choco Bites | nombres próximos, pero categorías, SKU e IDs distintos; denominación comercial ambigua | `INSUFFICIENT_EVIDENCE` | conservar ambos activos | bloqueada para búsqueda tolerante |
| `COLL-003-REM-001` — categoría de remisión | nombre y sede coincidentes; faltan IDs versionados, relaciones y autoridad de enrutamiento | `INSUFFICIENT_EVIDENCE` | conservar ambas activas | bloqueada en ese scope |
| `COLL-003-UOM-STRUCT-001` — Queso Gouda | mismo producto, etiqueta, unidad, cantidades, contexto y fuente; solo un miembro es default | `CONFIRMED_DUPLICATE_WITH_APPROVED_PLAN` al aprobar esta tarea | consolidación física diferida | elegible después de ejecutar y verificar el plan |
| `COLL-003-UOM-STRUCT-002` — Queso Mozzarella Tajado | huella cuantitativa coincidente, pero contextos `purchase` y `remission` distintos | `DISTINCT_IDENTITY` | conservar ambos activos | permitida solo incluyendo `usage_context` |

La aprobación de este documento vuelve inmutables estas disposiciones y permite supersederlas únicamente con una revisión vinculada. No ejecuta sus consecuencias físicas.

#### 5. Resolución de productos: conservar y bloquear

##### 5.1 `COLL-003-PROD-001` — Chai

| Atributo | Miembro A | Miembro B |
| --- | --- | --- |
| ID | `2d18dcce-e90f-4ab3-8879-59f66ab0ca70` | `f2a703e3-eba7-4e67-950e-754deee854ac` |
| nombre | `Chai latte frio` | `Chai Latte Frío` |
| categoría | `Bebidas frias` | `Bebidas frias` |
| tipo / unidad | `venta` / `un` | `venta` / `un` |
| SKU | `VEN-CHAILA-000959` | `VEN-CHAILA-000697` |
| alta observada | `2026-07-17` | `2026-06-11` |

La similitud es fuerte, pero SKU, identidad técnica y posibles referencias siguen separados. Elegir el más antiguo, el mejor escrito o el de menor ID sería heurístico. Resultado:

- ambos permanecen vigentes;
- la búsqueda puede mostrar la advertencia y ambos IDs;
- creación o reactivación equivalente opera como `REVIEW_REQUIRED_BEFORE_WRITE` cuando el motor exista;
- no se aplica unicidad por nombre, categoría y unidad;
- el propietario de producto deberá aportar identidad comercial, catálogo, ventas, recetas y referencias antes de superseder `INSUFFICIENT_EVIDENCE`.

##### 5.2 `COLL-003-PROD-002` — Latte frío

| Atributo | Miembro A | Miembro B |
| --- | --- | --- |
| ID | `ebe62d81-f211-4b4d-9418-3c0d81ba4a3c` | `d80789c8-7dba-4138-88c7-3d3c36bf1f83` |
| nombre | `LATTE FRIO` | `Latte Frío` |
| categoría | `Bebidas frias` | `Cafe y espresso` |
| tipo / unidad | `venta` / `un` | `venta` / `un` |
| SKU | `VEN-LATTEF-000958` | `VEN-LATTEF-000688` |
| alta observada | `2026-07-17` | `2026-06-09` |

La diferencia de categoría puede ser error de clasificación, override comercial o identidad distinta. Cambiar texto no lo resuelve. Se conserva ambos y se remite al propietario de catálogo/producto para decidir la categoría autoritativa y los consumidores. La unicidad queda bloqueada hasta una revisión supersedente.

##### 5.3 `COLL-003-PROD-004` — Choco Bites

| Atributo | Miembro A | Miembro B |
| --- | --- | --- |
| ID | `49db7f00-56c6-48e5-b420-0cafef1786b1` | `523393df-f98a-4932-87e6-7b93b0ebd17e` |
| nombre | `Choco Bites` | `Chocobites` |
| categoría | `Tortas y postres` | `Panaderia y bolleria` |
| tipo / unidad | `venta` / `un` | `venta` / `un` |
| SKU | `VEN-CHOCOB-000927` | `VEN-CHOCOB-000900` |
| alta observada | `2026-07-08` | `2026-06-30` |

La tokenización no une ni divide la denominación. Las categorías y SKU son evidencia negativa suficiente para impedir una fusión automática, pero no para declarar identidades distintas con autoridad comercial. Ambos permanecen y el matcher tolerante solo puede emitir candidato explicable.

#### 6. Resolución de la categoría de remisión

`COLL-003-REM-001` conserva los dos registros activos `VÍVERES & BODEGA PRINCIPAL`.

No se permite escoger sobreviviente porque el expediente aprobado no contiene simultáneamente:

- IDs y versiones actuales de ambos miembros;
- relaciones producto-sede-área-categoría;
- solicitudes y remisiones históricas;
- reglas de enrutamiento y visibilidad;
- consumidores sin FK, snapshots o referencias externas;
- autoridad del dominio para el propósito de cada categoría.

La política futura puede operar en `REVIEW_REQUIRED_BEFORE_WRITE` para una nueva categoría con la misma coordenada, pero `ENFORCE_CERTIFIED_UNIQUENESS` queda bloqueado. El caso solo se supersede con un expediente que cubra las doce dimensiones de evidencia.

#### 7. Plan concreto `UOM-MERGE-PLAN-GOUDA-004@1.0.0`

##### 7.1 Identidad y miembros

```text
merge_case_id: COLL-003-UOM-STRUCT-001
entity_family: public.product_uom_profiles
product_id: c80ed0d2-010f-4643-aed1-45ba8cf0e911
business_coordinate:
  label=Empaque
  input_unit_code=un
  qty_in_input_unit=1
  qty_in_stock_unit=10
  usage_context=general
  source=supplier_primary
```

| Rol propuesto | ID histórico | Evidencia de autoridad |
| --- | --- | --- |
| referencia/sobreviviente | `270c3233-2650-4c32-9b3d-b0bee0a2d002` | miembro activo marcado `is_default=true` para la coordenada exacta |
| no sobreviviente | `0f98e076-8e83-485b-be61-f4d9a7fbd3fe` | miembro activo `is_default=false` con la misma huella |

`is_default=true` se usa como atributo empresarial explícito de autoridad dentro de la coordenada, no como score de popularidad, antigüedad o completitud. Si la revalidación demuestra que el default cambió, existe otro miembro, una divergencia material o referencias incompatibles, el plan pasa a `INCOMPATIBLE_BLOCKED` y no se ejecuta.

##### 7.2 Autoridad por atributo

| Atributo | Fuente autoritativa | Tratamiento |
| --- | --- | --- |
| ID vigente | sobreviviente revalidado | conservar |
| producto, etiqueta, unidades y cantidades | igualdad certificada entre miembros | no reescribir |
| contexto y fuente | igualdad certificada entre miembros | conservar |
| `is_default` | sobreviviente con default vigente | conservar `true` |
| `is_active` | estado revalidado al iniciar el lote | no inferir desde snapshot |
| creación y cambios | cada registro histórico | conservar en auditoría; no copiar fechas |
| referencias externas | emisor y contrato de cada referencia | mantener original y crosswalk |

##### 7.3 Crosswalk propuesto

```text
crosswalk_key: UOM-GOUDA-GENERAL-EMPAQUE-10UN-V1
from_id: 0f98e076-8e83-485b-be61-f4d9a7fbd3fe
to_id:   270c3233-2650-4c32-9b3d-b0bee0a2d002
reason: CONFIRMED_DUPLICATE_WITH_APPROVED_PLAN
validity: effective only after physical cutover approval
```

El crosswalk es aditivo, versionado y nunca recicla el ID retirado.

##### 7.4 Tratamiento de referencias y hechos

Antes de modificar el no sobreviviente, el BLOQUE R deberá clasificar cada dependencia como:

| Dependencia | Tratamiento obligatorio |
| --- | --- |
| FK directa al perfil | remapear al sobreviviente dentro del mismo paquete |
| referencia lógica sin FK | actualizar mediante inventario aprobado o bloquear |
| JSON, snapshot, comprobante o evento histórico | preservar el ID original; resolver mediante crosswalk al leer |
| archivo o metadata externa | preservar identificador y añadir vínculo, no sobrescribir evidencia |
| caché, índice de búsqueda o proyección | reconstruir después del commit y verificar digest |
| integración externa | conservar referencia del emisor y mapping versionado |

Inventario, costo, remisiones, solicitudes, documentos y hechos pasados no se reescriben para aparentar que siempre usaron el sobreviviente.

##### 7.5 Secuencia física reservada

```text
PRECHECK_VERSION_AND_MEMBERS
  -> FREEZE_OR_SERIALIZE_COORDINATE
  -> SNAPSHOT_REFERENCES_AND_TOTALS
  -> CREATE_IDEMPOTENT_CROSSWALK
  -> REMAP_AUTHORIZED_LIVE_REFERENCES
  -> DEACTIVATE_NON_SURVIVOR_WITH_REASON
  -> REBUILD_DERIVED_PROJECTIONS
  -> RECONCILE_REFERENCES_AND_FACTS
  -> RELEASE_COORDINATE
```

Esta secuencia es entrada para `DATA-NORM-TRANS-005` y el BLOQUE R; no se ejecuta en E3.

##### 7.6 Idempotencia

```text
idempotency_key =
  DNT004/UOM-GOUDA-GENERAL-EMPAQUE-10UN/V1/
  0f98e076->270c3233
```

- repetir con el mismo digest devuelve el mismo resultado lógico;
- un miembro, versión o referencia diferente bloquea el reintento;
- una respuesta perdida no autoriza una segunda desactivación o reasignación;
- cada paso conserva checkpoint y conteos antes/después.

##### 7.7 Rollback y compensación

| Momento | Respuesta |
| --- | --- |
| antes de remapear referencias | rollback transaccional completo |
| después de remapeo, antes de nuevos hechos | restaurar referencias desde snapshot, reactivar no sobreviviente y superseder crosswalk |
| después de nuevos hechos | compensación controlada; no repartir automáticamente hechos nuevos entre miembros |
| divergencia de conteos o referencia huérfana | detener, mantener freeze y ejecutar rollback/compensación aprobada |

El rollback no borra auditoría, decisiones, crosswalks ni evidencia del intento.

##### 7.8 Criterios de éxito físico posteriores

- conjunto y versiones coinciden con el manifiesto;
- una sola autoridad default permanece para la coordenada;
- toda referencia queda válida, redirigida, preservada históricamente o bloqueada con razón;
- no existen huérfanos;
- conteos y hechos antes/después se reconcilian;
- búsquedas y consumidores resuelven el sobreviviente sin perder el ID histórico;
- rollback fue ensayado antes de producción;
- propietario de inventario/UOM y autoridad de transición aprueban la ejecución.

#### 8. `COLL-003-UOM-STRUCT-002` — identidad distinta confirmada

| Miembro histórico | Contexto | Huella |
| --- | --- | --- |
| `b9c1b203-9d7c-4a9b-9f9a-47b72b5c044d` | `purchase` | `Bloque`, `un`, 1 entrada, 83 stock, fuente `supplier_primary` |
| `7ca6a1eb-cc4f-4299-b031-54164431b8ec` | `remission` | `Bloque`, `un`, 1 entrada, 83 stock, fuente `supplier_primary` |

El contexto representa usos distintos y forma parte de la identidad estructural aprobada. Resultado:

```text
DISTINCT_IDENTITY
```

- ambos perfiles se conservan;
- no existe crosswalk ni sobreviviente;
- una restricción que omita `usage_context` queda prohibida;
- que ambos sean default dentro de contextos diferentes no es conflicto;
- cualquier consumidor deberá buscar por componentes y contexto, no solo por etiqueta.

#### 9. Matriz de preparación para unicidad

| Familia/política | Estado después de 004 | Modo máximo permitido | Bloqueo pendiente |
| --- | --- | --- | --- |
| productos por nombre normalizado | `NOT_CERTIFIED` | `WARN_EXPLICIT_CONFIRMATION` | Chai, Latte y Choco; homónimos entre capas |
| categoría de remisión por sede/nombre | `BLOCKED_BY_OPEN_COLLISION` | `REVIEW_REQUIRED_BEFORE_WRITE` | expediente `REM-001` incompleto |
| UOM por etiqueta solamente | `REJECTED_POLICY` | `OBSERVE_ONLY` | produce falsos positivos estructurales |
| UOM por coordenada completa | `READY_FOR_BACKFILL_DESIGN` | `REVIEW_REQUIRED_BEFORE_WRITE` | ejecutar plan Gouda y revalidar corte |
| posiciones por ubicación/nombre | `REJECTED_POLICY` | `OBSERVE_ONLY` | scope incompleto |
| posiciones por sede/ubicación/padre/código | `READY_FOR_CORPUS_AND_BACKFILL_DESIGN` | `REVIEW_REQUIRED_BEFORE_WRITE` | implementación y prueba física pendientes |
| catálogo PASS activo por sede/producto/código/vigencia | `READY_FOR_POLICY_DETAIL` | `WARN_EXPLICIT_CONFIRMATION` | definir solapamiento temporal y códigos |
| personas por nombre | `NON_UNIQUE_DISCOVERY_ONLY` | `OBSERVE_ONLY` | identidad y privacidad impiden unicidad textual |

Ninguna familia alcanza todavía `ENFORCE_CERTIFIED_UNIQUENESS`.

#### 10. Registro de bloqueos residuales

| Bloqueo | Propietario | Evidencia necesaria | Efecto mientras siga abierto |
| --- | --- | --- | --- |
| `DNT004-BLK-001` Chai | producto, catálogo y ventas | identidad comercial, 66 dependencias potenciales, hechos y autoridad por atributo | conservar ambos; sin constraint |
| `DNT004-BLK-002` Latte | producto y catálogo | categoría autoritativa, catálogo, ventas y referencias | conservar ambos; sin constraint |
| `DNT004-BLK-003` Choco Bites | producto/marca | denominación oficial, categoría, catálogo y hechos | conservar ambos; matcher solo advierte |
| `DNT004-BLK-004` categoría remisión | inventario/remisiones | IDs vigentes, relaciones, enrutamiento, visibilidad y auditoría | conservar ambas; escritura bajo revisión |
| `DNT004-BLK-005` Gouda | ejecución R | revalidación de miembros/versiones y mapa exhaustivo de referencias | no materializar merge ni constraint |

Los bloqueos no se cierran por SLA, silencio, popularidad ni éxito parcial de una migración.

#### 11. Compatibilidad y coexistencia

| Estado | Aplicación en esta tarea |
| --- | --- |
| `ACTIVE_ONLY` | conjunto de políticas `@1.0.0` para decisiones nuevas |
| `DUAL_EVALUATION_SHADOW` | comparar detector futuro sin modificar datos ni emitir efectos empresariales |
| `HISTORICAL_READ_ONLY` | reconstruir decisiones con snapshots y reglas históricas |
| `REPLAY_ONLY` | verificar casos cerrados sin repetir consolidaciones |
| `INCOMPATIBLE_BLOCKED` | detener ante miembros, versiones, scopes o referencias divergentes |

No existe dual write, fallback de autoridad ni recuperación implícita desde una versión histórica.

#### 12. Seguridad, privacidad e integridad

1. La resolución sobre productos y UOM no concede acceso adicional a tablas o datos.
2. No se crean tablas, vistas, funciones, RPC, triggers, índices o grants.
3. Si el registro de decisiones se materializa después en un schema expuesto, requerirá grants explícitos, RLS y políticas por scope; autenticación sola no será autorización suficiente.
4. Ninguna función futura de consolidación podrá usar `SECURITY DEFINER` como atajo de permisos.
5. Evidencia personal permanece fuera de este expediente.
6. Tokens, firmas, referencias externas y payloads originales no se normalizan ni registran en texto abierto.
7. VITAL permanece fuera del alcance y no hereda estas decisiones.

#### 13. Referencias técnicas verificadas

| Fuente | Aplicación |
| --- | --- |
| [Supabase — Managing Indexes in Postgres](https://supabase.com/docs/guides/database/postgres/indexes) | reconocer costo y bloqueo potencial de índices; ningún índice se crea antes de resolver datos y política |
| [Supabase — Database migrations](https://supabase.com/docs/guides/local-development/database-migrations) | reservar todo cambio de esquema o datos a migraciones versionadas, locales y verificables |
| [Supabase — Changelog de breaking changes](https://supabase.com/changelog?types=breaking-change) | verificar cambios de plataforma antes de materializar; ninguno altera la decisión documental actual |

La futura materialización deberá revisar nuevamente documentación y changelog. El cambio de exposición automática de tablas por Data API refuerza que cualquier artefacto nuevo deberá definir grants y RLS explícitos; esta tarea no crea tablas.

#### 14. Trazabilidad de requisitos

| Requisito | Evidencia producida |
| --- | --- |
| `TREQ-DATA-113` | decisión separada de modificación, backfill, runtime y constraint |
| `TREQ-DATA-122` | casos, versiones, evidencia y bloqueos permanecen durante transición |
| `TREQ-DATA-144` | conjunto efectivo y digest fijados |
| `TREQ-DATA-147` | cinco modos de coexistencia sin dual write ni fallback |
| `TREQ-DATA-162` | disposiciones inmutables y operaciones posteriores separadas |
| `TREQ-DATA-181` | cada caso recibe exactamente una disposición aprobada |
| `TREQ-DATA-182` | sobreviviente Gouda definido por autoridad empresarial, no heurística |
| `TREQ-DATA-183` | plan exige referencias con/sin FK, hechos y cero huérfanos |
| `TREQ-DATA-184` | crosswalk, historia, snapshots y rollback preservados |
| `TREQ-DATA-204` | decisión no activa materialización; ambigüedad conserva revisión |
| `TREQ-SUPABASE-1741` | UUID, coordenada empresarial y crosswalk mantienen semánticas separadas |
| `TREQ-SUPABASE-1743` | merge Gouda incluye miembros, autoridad, referencias, hechos, estado, rollback y aprobación |
| `TREQ-SUPABASE-1750` | ninguna disposición autoriza pérdida, doble escritura o eliminación física |

#### 15. Entrega a `DATA-NORM-TRANS-005`

La tarea siguiente recibe únicamente paquetes aptos para diseño de backfill:

| Paquete | Estado de entrada a 005 |
| --- | --- |
| `UOM-MERGE-PLAN-GOUDA-004@1.0.0` | diseñar lote reversible condicionado a revalidación |
| corrección de detector UOM con `usage_context` | diseñar cálculo/validación; no fusionar Mozzarella |
| corrección de scope jerárquico de posiciones | diseñar backfill de representación solo si el modelo físico lo requiere |
| productos y categoría de remisión | excluidos del backfill mientras existan bloqueos `001` a `004` |

`DATA-NORM-TRANS-005` no podrá autoaprobar candidatos ni convertir bloqueos en filas por corregir.

#### 16. Criterios de aceptación documental

- [x] los seis casos de 003 tienen una disposición explícita;
- [x] solo un caso se confirma como duplicado con plan;
- [x] un falso duplicado UOM se cierra como identidad distinta por contexto;
- [x] tres casos insuficientes y uno estructural conservan ambos registros;
- [x] IDs, atributos y evidencia del único merge planificado están declarados;
- [x] sobreviviente Gouda se deriva de autoridad default explícita y no de una heurística;
- [x] crosswalk, referencias, hechos, idempotencia y rollback están definidos;
- [x] la preparación de unicidad está clasificada por familia;
- [x] ninguna política alcanza aún enforcement certificado;
- [x] conjunto efectivo y digest quedan fijados;
- [x] cinco bloqueos residuales tienen propietario y efecto;
- [x] trece requisitos directos tienen trazabilidad;
- [x] documentación y changelog Supabase fueron verificados;
- [x] no se ejecutó DDL, DML, consulta remota nueva, migración, backfill, merge o constraint;
- [x] `DATA-NORM-TRANS-005` permanece reservada.

#### 17. Continuidad

```text
TAREA CANÓNICAMENTE APROBADA
DATA-NORM-TRANS-004 — Resolver duplicados antes de aplicar restricciones de unicidad
        ↓
SIGUIENTE TAREA CANÓNICAMENTE APROBADA
DATA-NORM-TRANS-005 — Definir backfills por dominio y lotes reversibles
```
