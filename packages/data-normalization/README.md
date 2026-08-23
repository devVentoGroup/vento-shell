# @vento/data-normalization

Raiz privada de autoria para la fundacion compartida de normalizacion pura y determinista de Vento OS.

`SHELL-NORM-001::GLOBAL` materializo la identidad fisica minima del package. `SHELL-NORM-002::GLOBAL` materializo tipos compartidos. `SHELL-NORM-003::GLOBAL` materializo reglas puras. `SHELL-NORM-004::GLOBAL` materializo catalogos versionados. `SHELL-NORM-005::GLOBAL` materializo el diccionario ortografico. `SHELL-NORM-006::GLOBAL` materializo busqueda y comparacion. `SHELL-NORM-007::GLOBAL` materializo preview no vinculante. `SHELL-NORM-008::GLOBAL` materializa ahora metadata logica de version, procedencia, auditoria, idempotencia, concurrencia y replay sin adquirir autoridad de persistencia.

## Autoridad canonica

El package consume semantica aprobada; no crea una segunda fuente de politica.

- `DATA-NORM-ARC-001..012` conservan el gobierno canonico de normalizacion.
- `DATA-NORM-TRANS-001..009` conservan transicion, materializacion, rollback, replay y evidencia.
- `SHELL-PKG-001..008` conservan distribucion, versionado, compatibilidad y adopcion.
- `SHELL-NORM-002..009` materializan progresivamente contenido especializado interno.
- `DATA-NORM-DB-001..010` conservan persistencia y enforcement fisico.

La reconciliacion topologica vigente para `SHELL-NORM-001..009` es `GLOBAL_ENABLE_ONCE` / `PRE_E5_FOUNDATION`: la fundacion pura puede materializarse una sola vez antes de E5 sin adquirir autoridad de persistencia.

## Frontera fisica heredada de SHELL-NORM-001

- nombre: `@vento/data-normalization`;
- `private: true`;
- `type: module`;
- version npm: NO DECLARADA;
- exports publicos: NO MATERIALIZADOS;
- `main` y `types`: NO MATERIALIZADOS;
- dependencias propias: 0;
- scripts npm propios: 0;
- consumidores migrados: 0;
- cambios Supabase: 0.

## Materializacion heredada de SHELL-NORM-002

`src/normalization.types.ts` conserva exactamente nueve artefactos logicos:

1. `NormalizableFieldSemanticClass`;
2. `NormalizationRepresentationRole`;
3. `NormalizationSourceRole`;
4. `NormalizationTreatmentMode`;
5. `NormalizationOperationKind`;
6. `NormalizableFieldCoordinate`;
7. `NormalizableFieldDescriptor`;
8. `NormalizableStructuredComponentDescriptor`;
9. `NormalizablePolymorphicVariantDescriptor`.

Los vocabularios conservan **48 literales**: 14 clases semanticas, 7 roles de representacion, 6 roles de fuente, 8 modos de tratamiento y 13 familias de operacion. VITAL no hereda politicas de Vento OS.

## Materializacion de SHELL-NORM-003

`normalization.rules.ts` y `validate-normalization-rules.mjs` conservan cinco operaciones puras:

```text
UNICODE_CANONICALIZATION
EDGE_WHITESPACE_TRIM
INTERNAL_WHITESPACE_COMPACTION
PROSE_PUNCTUATION_SPACING
COMMERCIAL_CAPITALIZATION
```

El perfil es `VENTO_COMMERCIAL_CAPITALIZATION_ES_CO@1.0.0`. El inventario de 003 conserva **23 literales**.

conectores y excepciones: RESOLVERS VERSIONADOS, CATALOGOS NO MATERIALIZADOS

Ese marcador es historico de 003 y permanece para trazabilidad aunque 004 ya haya materializado los catalogos.

## Materializacion de SHELL-NORM-004

Identidades exactas:

```text
VENTO_COMMERCIAL_CONNECTOR_CATALOG_ES_CO@1.0.0
VENTO_OFFICIAL_TEXT_EXCEPTION_CATALOG@1.0.0
```

formas normativas iniciales: 28 = 22 + 6

candidatos no activables: 34 = 14 + 11 + 9

Los catalogos exigen binding explicito de autoridad, scope, evidencia, vigencia y forma. Coincidencia, frecuencia o similitud no promueven candidatos.

## Materializacion de SHELL-NORM-005

`normalization.dictionary.ts` materializa `VENTO_CANONICAL_ORTHOGRAPHIC_DICTIONARY_ES_CO@1.0.0`.

atributos de entrada del diccionario: 21

correcciones iniciales: 3

```text
maiz -> maiz con tilde canonica
clasico -> clasico con tilde canonica
frio -> frio con tilde canonica
```

La forma materializada conserva UTF-8 canonico; esta descripcion ASCII evita depender de la codificacion de consola.

expresso: REVISION, NO CORRECCION AUTOMATICA

Los scopes son 3, los modos de decision 3, los niveles de resolucion 4, la precedencia 8, las formas ambiguas explicitas 1, las condiciones de activacion 11, los estados 6 y los resultados 7. No existe matching por subcadena ni cuarta correccion inferida.

## Materializacion de SHELL-NORM-006

`normalization.search.ts` materializa `VENTO_TEXT_SEARCH_AND_COMPARISON_POLICY@1.0.0`.

Inventario cerrado:

```text
representaciones derivadas: 7
clases de token o frontera: 7
atributos de alias: 15
perfiles cerrados: 6
modos de coincidencia: 9
pipeline de busqueda: 15
atributos de respuesta: 13
clases semanticas: 14
componentes estructurados: 11
transliteracion: DESHABILITADA
similitud: DESHABILITADA
```

La busqueda conserva valor mostrado, scope y autorizacion. No convierte coincidencia en identidad, unicidad, correccion o fusion.

## Materializacion de SHELL-NORM-007

`normalization.preview.ts` materializa `NORMALIZATION_EVALUATION_QUERY` como preview interno y puro.

```text
funciones de autoridad: 4
capas logicas: 4
atributos del descriptor de colocacion: 21
etapas del flujo transaccional: 10
dimensiones de divergencia: 6
resultados cerrados de preview: 7
binding: NON_BINDING
```

Toda salida conserva `commit_authority: false`, `mutation_performed: false`, `state_reserved: false`, `uniqueness_certified: false`, `identity_decided: false` y exige revalidacion transaccional. Preview no es commit ni auditoria raiz.

## Materializacion de SHELL-NORM-008

`SHELL-NORM-008::GLOBAL` materializa metadata logica pura en:

```text
packages/data-normalization/src/normalization.audit.ts
```

El validador propietario queda en:

```text
packages/data-normalization/scripts/validate-normalization-audit.mjs
```

La identidad exacta es:

```text
VENTO_TEXT_RULE_AUDIT_VERSION_AND_IDEMPOTENCY_POLICY@1.0.0
```

La metadata compartida nunca equivale por si sola a auditoria persistida, autorizacion, commit o efecto empresarial. Actor, autorizacion, tiempos, identidades de evento y confirmacion de efectos deben ser proporcionados explicitamente por la capa propietaria.

### Inventarios cerrados de 008

```text
familias de registro logico: 6
atributos de regla y version: 13
dependencias del resolved_version_set: 11
estados unificados: 8
atributos de activacion: 7
modos de compatibilidad: 5
atributos de procedencia: 11
eventos de auditoria: 12
atributos del contrato de auditoria: 30
resultados de evaluacion: 10
clases de retencion: 5
niveles de reproducibilidad: 3
tiempos semanticos: 7
componentes de idempotencia: 9
clases de operacion idempotente: 6
expectativas de concurrencia: 4
atributos de replay: 9
```

### Familias de registro logico

```text
RULE_GOVERNANCE_RECORD
RULE_EVALUATION_RECORD
PERSISTED_MUTATION_RECORD
DERIVATION_MATERIALIZATION_RECORD
REVIEW_DECISION_RECORD
PROPAGATION_OR_TRANSITION_RECORD
```

Una `RULE_EVALUATION_RECORD` puede existir sin mutacion. `PERSISTED_MUTATION_RECORD` solo describe un efecto cuando la capa propietaria suministra confirmacion de commit y contexto de actor/autorizacion. El package nunca produce esa confirmacion por si mismo.

### Identidad y conjunto efectivo de versiones

Cada regla conserva `rule_key`, `rule_version_id`, familia, coordenada, clase, operacion, perfil, version, digest, estado, vigencia y supersesion. `rule_version_id` es inmutable y una variacion de contenido exige otra version.

`materializeResolvedVersionSet` acepta exclusivamente las 11 claves canonicas, exige estados `RESOLVED` o `NOT_APPLICABLE`, bloquea `latest`, elimina ambiguedad de orden mediante orden canonico y calcula `version_set_digest` mediante un adaptador de digest explicitamente inyectado. El modulo no selecciona versiones desde reloj, cache, Git, registry o configuracion ambiental.

### Ciclo de vida y compatibilidad

Los ocho estados son:

```text
DRAFT
APPROVED_PENDING_ACTIVATION
ACTIVE
SUSPENDED
SUPERSEDED
RETIRED
REJECTED
INVALIDATED
```

Solo `ACTIVE` representa una version apta para decisiones nuevas. `SUPERSEDED`, `RETIRED`, `REJECTED` e `INVALIDATED` son terminales para esa version. El modulo valida transiciones logicas; no activa, suspende, supersede, retira ni invalida persistencia.

Los cinco modos son:

```text
ACTIVE_ONLY
DUAL_EVALUATION_SHADOW
HISTORICAL_READ_ONLY
REPLAY_ONLY
INCOMPATIBLE_BLOCKED
```

Shadow nunca implica dual write.

### Procedencia y auditoria logica

La procedencia conserva 11 atributos de algoritmo y artefacto. `latest` y dependencias ambientales implicitas estan bloqueados.

Los 12 eventos mantienen semanticas diferenciadas. Los 30 atributos del audit envelope distinguen `logical_operation_id`, `attempt_id`, `correlation_id`, `causation_id`, actor, autorizacion, coordenada, version set, procedencia, idempotencia, concurrencia, outcome y referencias relacionadas.

`validateLogicalAuditEnvelope` devuelve exclusivamente validacion logica y declara:

```text
persistence_authority: false
authorization_authority: false
```

Una evaluacion no puede afirmar `APPLIED_CHANGE`. Un efecto confirmado exige familia de efecto, contexto del owner y `effect_committed_at` explicito.

### Idempotencia

La clave logica usa exactamente nueve componentes. `materializeIdempotencyKey` produce una clave determinista mediante digest inyectado; no consulta ni persiste estado.

Misma clave + mismo payload puede reutilizar resultado previo solamente cuando la capa propietaria aporta ese estado. Misma clave + payload distinto produce exactamente:

```text
IDEMPOTENCY_PAYLOAD_CONFLICT
```

Un `APPLIED_CHANGE` previo no se reutiliza sin `effect_confirmation_reference` explicita.

`PURE_EVALUATION` es la unica de las seis clases cuya garantia puede demostrarse completamente dentro del motor puro. Las demas dependen de evidencia de la capa que posee estado o commit.

### Concurrencia

Las cuatro expectativas son:

```text
expected_source_version_or_hash
expected_policy_coordinate
expected_version_set_digest
expected_current_state
```

`assessConcurrency` compara expectativas con un estado entregado por el caller y devuelve `state_authority: false`. No existe last-writer-wins semantico.

### Replay

El contrato de replay conserva nueve atributos y `validateReplayContract` declara siempre:

```text
production_mutation_authority: false
```

Replay metadata no ejecuta replay, no selecciona ambiente, no toca produccion y no aplica rollback o compensaciones.

### Relacion con preview

`projectNonBindingPreviewAuditMetadata` puede proyectar metadata de evaluacion a partir de `SHELL-NORM-007`, pero conserva:

```text
binding: NON_BINDING
commit_authority: false
effect_committed_at: NOT_APPLICABLE
```

Un preview que intente afirmar `APPLIED_CHANGE` se rechaza como `PREVIEW_CANNOT_ASSERT_APPLIED_CHANGE`.

### VITAL y minimizacion

VITAL permanece fuera de la politica transversal de Vento OS. Metadata sensible se representa mediante referencias protegidas, hashes contextualizados o valores `NOT_APPLICABLE` cuando el contrato lo permite. El package no lee secretos ni amplia visibilidad.

### Fronteras fisicas

008 no crea ni modifica:

- tablas, columnas, ledger o almacenamiento de auditoria;
- API, endpoint, RPC o trigger;
- SQL, DDL, DML, indices, constraints, migraciones o backfills;
- timestamps desde reloj implicito;
- UUID o aleatoriedad para identidad semantica;
- autorizacion;
- persistencia de eventos;
- activacion de versiones;
- replay, rollback o compensaciones;
- diccionarios, catalogos, busqueda o preview anteriores;
- consumidores;
- Supabase.

persistencia de auditoria: NO MATERIALIZADA

## Validacion de SHELL-NORM-008

`validate-normalization-audit.mjs`:

1. verifica el SHA del contrato propietario de 008 mediante `parseTaskBlocks`;
2. comprueba `GLOBAL_ENABLE_ONCE` y `PRE_E5_FOUNDATION`;
3. ejecuta primero el validador verificado de 007, que encadena 006/005/004/003/002;
4. compila los siete modulos internos con el TypeScript local;
5. reconcilia todos los inventarios cerrados 6/13/11/8/7/5/11/12/30/10/5/3/7/9/6/4/9;
6. prueba version set determinista, terminalidad, procedencia, audit envelopes, idempotencia, concurrencia, replay, preview y VITAL;
7. bloquea I/O, reloj implicito, aleatoriedad, Supabase y autoridad de persistencia;
8. verifica que fuentes, validadores y contratos anteriores permanezcan sin cambios.

## Estado de esta fundacion

```text
package root: MATERIALIZADO
package.json: MATERIALIZADO
tipos SHELL-NORM-002: MATERIALIZADOS
48 literales SHELL-NORM-002: MATERIALIZADOS
reglas SHELL-NORM-003: MATERIALIZADAS
23 literales SHELL-NORM-003: MATERIALIZADOS
catalogos SHELL-NORM-004: MATERIALIZADOS
conectores SHELL-NORM-004: 18
formas normativas SHELL-NORM-004: 28 = 22 + 6
candidatos no activables SHELL-NORM-004: 34 = 14 + 11 + 9
diccionario SHELL-NORM-005: MATERIALIZADO
atributos de entrada del diccionario: 21
correcciones iniciales: 3
busqueda SHELL-NORM-006: MATERIALIZADA
representaciones derivadas: 7
clases de token o frontera: 7
perfiles cerrados: 6
modos de coincidencia: 9
pipeline de busqueda: 15
atributos de respuesta: 13
clases semanticas: 14
componentes estructurados: 11
transliteracion: DESHABILITADA
similitud: DESHABILITADA
preview SHELL-NORM-007: MATERIALIZADO
funciones de autoridad: 4
capas logicas: 4
atributos del descriptor de colocacion: 21
etapas del flujo transaccional: 10
dimensiones de divergencia: 6
resultados cerrados de preview: 7
binding: NON_BINDING
metadata SHELL-NORM-008: MATERIALIZADA LOGICAMENTE
familias de registro logico: 6
atributos de regla y version: 13
dependencias del resolved_version_set: 11
estados unificados: 8
atributos de activacion: 7
modos de compatibilidad: 5
atributos de procedencia: 11
eventos de auditoria: 12
atributos del contrato de auditoria: 30
resultados de evaluacion: 10
clases de retencion: 5
niveles de reproducibilidad: 3
tiempos semanticos: 7
componentes de idempotencia: 9
clases de operacion idempotente: 6
expectativas de concurrencia: 4
atributos de replay: 9
persistencia de auditoria: NO MATERIALIZADA
version npm: NO DECLARADA
exports publicos: NO MATERIALIZADOS
consumidores migrados: 0
cambios Supabase: 0
```

## Handoffs reservados

| Tarea | Responsabilidad reservada |
| --- | --- |
| `SHELL-NORM-009` | corpus y certificacion de idempotencia y conservacion semantica |
| `DATA-NORM-DB-001` | almacenamiento fisico de versiones |
| `DATA-NORM-DB-009` | evidencia fisica de efectos confirmados |
| `DATA-NORM-DB-010` | pruebas fisicas de idempotencia y rollback |
| `DATA-NORM-TRANS-004..009` | coexistencia, activacion, replay, rollback y certificacion de transicion |
| `SUPA-TRANS-006..014` | compatibilidad, paridad, rendimiento, rollback, ambientes y artefactos desplegados |

Source contract SHA-256 `SHELL-NORM-001`: `f88a0eb3dc6ed6103dc00063124e3e1f5b2a78545d1980e39f596b4fc1653c90`.

Source contract SHA-256 `SHELL-NORM-002`: `ae4bf09517c3e8d0e11c6e5e2e317079115205ba072913fbc76f31323dd90e76`.

Source contract SHA-256 `SHELL-NORM-003`: `ce86eef6da718064b58f9b977af644d9ce0030fc1de07c203c5709e877c9c461`.

Source contract SHA-256 `SHELL-NORM-004`: `abacc131fb8dd2b18dbd59ef04915e516f6044d4737422b55e45f1eb5dda64ef`.

Source contract SHA-256 `SHELL-NORM-005`: `6a9e98517f962da17c5b8877aa8f358f746e60a397ff621f8dd559bde5ae8837`.

Source contract SHA-256 `SHELL-NORM-006`: `64d18e5a35e8a91dbae23cd0f3cef6928a684d8ba2c9e6e37101f1e7959a5a14`.

Source contract SHA-256 `SHELL-NORM-007`: `3a05097677cbf3e0f36700a7bbc0fb2e6e3a06e955296bbe9135db06b1bef9a0`.

Source contract SHA-256 `SHELL-NORM-008`: `6d20fca811de725d18a4df5c952b37f90557ba7d9ebf7365bb50becd5c827d2e`.
