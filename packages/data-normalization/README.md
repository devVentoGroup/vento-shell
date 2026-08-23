# @vento/data-normalization

Raiz privada de autoria para la fundacion compartida de normalizacion pura y determinista de Vento OS.

`SHELL-NORM-001::GLOBAL` materializo la identidad fisica minima del package. `SHELL-NORM-002::GLOBAL` materializo tipos compartidos. `SHELL-NORM-003::GLOBAL` materializo reglas puras. `SHELL-NORM-004::GLOBAL` materializo catalogos versionados. `SHELL-NORM-005::GLOBAL` materializo el diccionario ortografico. `SHELL-NORM-006::GLOBAL` materializo busqueda y comparacion. `SHELL-NORM-007::GLOBAL` materializo preview no vinculante. `SHELL-NORM-008::GLOBAL` materializo metadata logica de version, procedencia, auditoria, idempotencia, concurrencia y replay. `SHELL-NORM-009::GLOBAL` materializa ahora el corpus y el oraculo compartido de conformidad para determinismo, idempotencia de evaluacion y conservacion semantica.

## Autoridad canonica

El package consume semantica aprobada; no crea una segunda fuente de politica.

- `DATA-NORM-ARC-001..012` conservan el gobierno canonico de normalizacion.
- `DATA-NORM-TRANS-001..009` conservan transicion, materializacion, rollback, replay y evidencia.
- `SHELL-PKG-001..008` conservan distribucion, versionado, compatibilidad y adopcion.
- `SHELL-NORM-002..009` materializan progresivamente contenido especializado interno.
- `DATA-NORM-DB-001..010` conservan persistencia y enforcement fisico.
- `SHELL-CI-001` conserva la integracion futura del corpus con la suite general de CI del package.

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

expresso: REVISION, NO CORRECCION AUTOMATICA

Los scopes son 3, los modos de decision 3, los niveles de resolucion 4, la precedencia 8, las formas ambiguas explicitas 1, las condiciones de activacion 11, los estados 6 y los resultados 7. No existe matching por subcadena ni cuarta correccion inferida.

## Materializacion de SHELL-NORM-006

`normalization.search.ts` materializa `VENTO_TEXT_SEARCH_AND_COMPARISON_POLICY@1.0.0`.

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

`normalization.audit.ts` materializa:

```text
VENTO_TEXT_RULE_AUDIT_VERSION_AND_IDEMPOTENCY_POLICY@1.0.0
```

Inventarios cerrados:

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

`validateLogicalAuditEnvelope` declara siempre:

```text
persistence_authority: false
authorization_authority: false
```

Misma clave de idempotencia con payload distinto produce `IDEMPOTENCY_PAYLOAD_CONFLICT`. Replay conserva `production_mutation_authority: false`. Preview conserva `binding: NON_BINDING`, `commit_authority: false` y no puede afirmar `APPLIED_CHANGE`.

persistencia de auditoria: NO MATERIALIZADA

## Validacion de SHELL-NORM-008

`validate-normalization-audit.mjs` verifica la identidad contractual de 008, encadena 007 -> 002, compila los siete modulos internos, reconcilia todos los inventarios 008 y prueba version set, ciclo de vida, procedencia, audit envelope, idempotencia, concurrencia, replay, preview y VITAL.

## Materializacion de SHELL-NORM-009

`SHELL-NORM-009::GLOBAL` materializa el corpus fisico privado y el oraculo de certificacion en:

```text
packages/data-normalization/conformance/normalization.conformance.ts
```

El validador propietario queda en:

```text
packages/data-normalization/scripts/validate-normalization-conformance.mjs
```

La identidad exacta es:

```text
VENTO_NORMALIZATION_IDEMPOTENCY_AND_SEMANTIC_PRESERVATION_CONFORMANCE@1.0.0
```

### Corpus heredado

La fuente reconciliadora es `DATA-NORM-TRANS-002`.

```text
corpus heredado: 89
distribucion del corpus: 16 + 20 + 21 + 15 + 17

DATA-NORM-ARC-003 capitalizacion: 16
DATA-NORM-ARC-004 conectores: 20
DATA-NORM-ARC-005 excepciones oficiales: 21
DATA-NORM-ARC-006 diccionario: 15
DATA-NORM-ARC-008 busqueda y comparacion: 17
```

Los escenarios no se renombran semanticamente ni se sustituyen por ejemplos alternativos. La materializacion usa una clave fisica estable compuesta por tarea propietaria y ordinal de la fila canonica, y conserva las tres celdas de cada escenario para comparacion exacta contra las tablas propietarias.

### Cuatro dimensiones de prueba

```text
dimensiones de prueba: 4

DETERMINISM
EVALUATION_IDEMPOTENCY
SEMANTIC_PRESERVATION
NO_UNAUTHORIZED_SIDE_EFFECTS
```

### Diez dimensiones de conservacion semantica

```text
dimensiones de conservacion semantica: 10

COORDINATE
SEMANTIC_CLASS
REPRESENTATION
SOURCE_ROLE
STRUCTURE
PROTECTED_FORM
PROVENANCE
IDENTITY
HISTORY
PRODUCT_BOUNDARY
```

Un resultado visual correcto no certifica conformidad si cambia cualquiera de estas dimensiones fuera del delta autorizado.

### Cobertura cerrada

```text
operaciones cubiertas: 13/13
clases semanticas cubiertas: 14/14
roles de representacion cubiertos: 7/7
roles de fuente cubiertos: 6/6
modos de tratamiento cubiertos: 8/8

faltantes: 0
duplicados: 0
```

### Oraculo A/B/C

A/B/C: MATERIALIZADO

```text
A = evaluacion de la entrada bajo un corte contractual fijo
B = repeticion de la misma evaluacion bajo el mismo corte
C = reevaluacion de la salida de A cuando la operacion sea reaplicable
```

`certifyABCConformance` exige simultaneamente:

1. A y B con el mismo resultado logico, salida y snapshot protegido;
2. C sin un segundo cambio semantico;
3. las diez dimensiones protegidas invariantes respecto del snapshot fuente;
4. cero side effects no autorizados.

El oraculo devuelve siempre:

```text
production_mutation_authority: false
identity_authority: false
uniqueness_authority: false
merge_authority: false
```

### Versiones

`classifyVersionCut` distingue `SAME_CONTRACT_CUT` de `DIFFERENT_CONTRACT_CUT`.

Una diferencia entre conjuntos efectivos de versiones no se clasifica como fallo de idempotencia del mismo contrato. `latest`, un digest vacio o un corte no fijado son invalidos.

### Frontera VITAL

`conformanceProductBoundaryDisposition('VITAL')` devuelve `BLOCKED_VITAL`. Compartir proyecto, tipos o infraestructura no transfiere la politica transversal de Vento OS.

### Alcance de la certificacion fisica

`validate-normalization-conformance.mjs`:

1. verifica el SHA del contrato propietario de 009 mediante `parseTaskBlocks`;
2. comprueba `GLOBAL_ENABLE_ONCE` y `PRE_E5_FOUNDATION`;
3. ejecuta primero `validate-normalization-audit.mjs`, que encadena toda la compatibilidad 008 -> 002;
4. compila los siete modulos internos mas el contrato de conformance;
5. compara fila por fila el corpus fisico con las tablas canonicas de ARC-003/004/005/006/008;
6. reconcilia 89/89 y la distribucion 16/20/21/15/17 contra `DATA-NORM-TRANS-002`;
7. valida 4 dimensiones de prueba, 10 dimensiones protegidas y cobertura 13/14/7/6/8;
8. prueba A/B/C positivo y fallos por divergencia, segunda mutacion, dimension protegida, side effect, mezcla de versiones y VITAL;
9. bloquea I/O, reloj implicito, aleatoriedad, Supabase y autoridad estructural dentro del contrato de conformance;
10. verifica que fuentes, validadores, manifests y contratos propietarios anteriores permanezcan sin cambios.

El validador de 009 es una certificacion interna ejecutable y privada. No agrega framework de test, script npm, export publico ni consumidor. La incorporacion posterior a la suite transversal de CI del package permanece en `SHELL-CI-001` sin cambiar los oraculos definidos aqui.

efectos empresariales desde conformance: 0

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
conformance SHELL-NORM-009: MATERIALIZADA
corpus heredado: 89
distribucion del corpus: 16 + 20 + 21 + 15 + 17
dimensiones de prueba: 4
dimensiones de conservacion semantica: 10
operaciones cubiertas: 13/13
clases semanticas cubiertas: 14/14
roles de representacion cubiertos: 7/7
roles de fuente cubiertos: 6/6
modos de tratamiento cubiertos: 8/8
A/B/C: MATERIALIZADO
efectos empresariales desde conformance: 0
version npm: NO DECLARADA
exports publicos: NO MATERIALIZADOS
consumidores migrados: 0
cambios Supabase: 0
```

## Handoffs reservados

| Tarea | Responsabilidad reservada |
| --- | --- |
| `SHELL-CI-001` | integrar y ejecutar el corpus dentro de la suite transversal de CI del package |
| `SHELL-CI-005` | certificar compatibilidad por consumidor |
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

Source contract SHA-256 `SHELL-NORM-009`: `13632f04e23e618baf5e1ead9d0c0370ae19106a611d6e68730713e443777cd5`.
