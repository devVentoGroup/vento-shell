# @vento/data-normalization

Raiz privada de autoria para la fundacion compartida de normalizacion pura y determinista de Vento OS.

`SHELL-NORM-001::GLOBAL` materializo la identidad fisica minima del package. `SHELL-NORM-002::GLOBAL` materializo el sistema compartido de tipos de campo normalizable. `SHELL-NORM-003::GLOBAL` materializo las reglas puras de Unicode, espacios, espaciado de puntuacion de prosa y capitalizacion empresarial. `SHELL-NORM-004::GLOBAL` materializa ahora los catalogos versionados de conectores y excepciones oficiales, sin habilitar exports publicos, consumidores, persistencia ni cambios Supabase.

## Autoridad canonica

El package consume semantica aprobada; no crea una segunda fuente de politica.

- `DATA-NORM-ARC-001..012` conservan el gobierno canonico de normalizacion.
- `DATA-NORM-TRANS-001..009` conservan transicion, dry-run, colisiones, backfill, rollback y evidencia.
- `SHELL-PKG-001..008` conservan distribucion, versionado, compatibilidad, deprecacion, rollback y adopcion.
- `SHELL-NORM-002..009` materializan progresivamente el contenido especializado del package.
- `DATA-NORM-DB-001..010` conservan persistencia y enforcement fisico cuando corresponda.

La reconciliacion topologica vigente para `SHELL-NORM-001..009` es `GLOBAL_ENABLE_ONCE` / `PRE_E5_FOUNDATION`: la fundacion compartida pura puede materializarse una sola vez antes de E5, sin adquirir autoridad de persistencia.

## Frontera fisica heredada de SHELL-NORM-001

La raiz continua como workspace privado bajo `packages/*` con estas invariantes:

- nombre exacto: `@vento/data-normalization`;
- `private: true`;
- `type: module`;
- sin campo `version`;
- sin `exports`;
- sin `main` ni `types`;
- sin dependencias propias;
- sin scripts npm propios;
- sin publicacion, tag, release, registry ni credenciales;
- sin consumidores migrados;
- cambios Supabase: 0.

## Materializacion heredada de SHELL-NORM-002

`SHELL-NORM-002::GLOBAL` conserva una superficie TypeScript interna y type-only en `src/normalization.types.ts` con exactamente nueve artefactos logicos:

1. `NormalizableFieldSemanticClass`;
2. `NormalizationRepresentationRole`;
3. `NormalizationSourceRole`;
4. `NormalizationTreatmentMode`;
5. `NormalizationOperationKind`;
6. `NormalizableFieldCoordinate`;
7. `NormalizableFieldDescriptor`;
8. `NormalizableStructuredComponentDescriptor`;
9. `NormalizablePolymorphicVariantDescriptor`.

Los vocabularios de tipos conservan exactamente 48 literales: 14 clases semanticas, 7 roles de representacion, 6 roles de fuente, 8 modos de tratamiento y 13 familias de operacion.

`IDENTITY_OR_RECORD_ACTION` permanece fuera de la mutacion textual. La ausencia de modo explicito sigue cerrada como `PROHIBITED`. VITAL no hereda politicas Vento por compartir infraestructura o tipos.

El validador `scripts/validate-normalization-types.mjs` sigue siendo propietario de 002. A partir de 003 valida sus propios artefactos por inclusion, no exige que `src/` o `scripts/` permanezcan congelados para siempre; esta correccion de compatibilidad no modifica los nueve tipos ni los 48 literales verificados de 002.

## Materializacion de SHELL-NORM-003

La superficie interna queda:

```text
packages/data-normalization/
|-- README.md
|-- package.json
|-- scripts/
|   |-- validate-normalization-types.mjs
|   `-- validate-normalization-rules.mjs
`-- src/
    |-- normalization.types.ts
    `-- normalization.rules.ts
```

`src/normalization.rules.ts` materializa cinco operaciones puras e independientes:

1. `UNICODE_CANONICALIZATION`;
2. `EDGE_WHITESPACE_TRIM`;
3. `INTERNAL_WHITESPACE_COMPACTION`;
4. `PROSE_PUNCTUATION_SPACING`;
5. `COMMERCIAL_CAPITALIZATION`.

No existe pipeline universal. Cada operacion exige `NormalizableFieldDescriptor`, `operation_kind`, politica efectiva, `policy_version_ref`, tratamiento permitido y las versiones especificas de la etapa. Una operacion no habilita otra por implicacion.

## Inventario cerrado de SHELL-NORM-003

| Familia | Esperado | Materializado |
| --- | ---: | ---: |
| operaciones deterministas | 5 | 5 |
| clases de token de capitalizacion | 9 | 9 |
| resultados de token | 6 | 6 |
| fronteras de segmento | 3 | 3 |
| **Total** | **23 literales** | **23 literales** |

Faltantes: 0. Duplicados: 0.

### Clases de token

- `ORDINARY_LEXICAL_TOKEN`;
- `CONNECTOR_TOKEN`;
- `OFFICIAL_EXCEPTION_TOKEN`;
- `CONTROLLED_ACRONYM_TOKEN`;
- `MEASUREMENT_OR_UNIT_TOKEN`;
- `NUMERIC_TOKEN`;
- `ALPHANUMERIC_OR_MODEL_TOKEN`;
- `PUNCTUATION_OR_SEPARATOR`;
- `AMBIGUOUS_TOKEN`.

### Resultados de token

- `CAPITALIZED_ORDINARY`;
- `LOWERCASED_CONNECTOR`;
- `PRESERVED_OFFICIAL_EXCEPTION`;
- `PRESERVED_NON_CASED`;
- `PRESERVED_AMBIGUOUS`;
- `BLOCKED_CONFLICT`.

### Fronteras de segmento

- `NAME_START`;
- `DECLARED_SEGMENT_START`;
- `NO_SEGMENT_RESET`.

## Unicode

`UNICODE_CANONICALIZATION` ejecuta exclusivamente la composicion NFC suministrada por un adaptador explicito y versionado.

Reglas de frontera:

- no NFKC ni NFKD;
- no unaccent;
- no eliminacion de diacriticos;
- `ñ` permanece distinta de `n`;
- no transliteracion;
- no casefold del valor mostrado;
- no capitalizacion ni diccionario implicitos;
- el adaptador debe demostrar idempotencia para la version declarada;
- originales externos, snapshots, evidencia y material protegido permanecen cerrados por politica.

La implementacion no selecciona una libreria Unicode ni una version implicita del runtime. La semantica fisica se recibe mediante `UnicodeCanonicalizationAdapter` con `unicode_version_ref` explicito.

## Espacios

`EDGE_WHITESPACE_TRIM` solo elimina separadores de borde listados explicitamente por la politica de la etapa. No existe `trim` universal y no se permite cruzar silenciosamente la frontera hacia contenido vacio cuando `allow_empty_result` no lo autoriza.

`INTERNAL_WHITESPACE_COMPACTION` solo compacta separadores declarados `accidental_internal_separators` y conserva los separadores de borde. No existe una regla global equivalente a `\s+`. Saltos de linea, tabs, NBSP, Markdown, plantillas y formato significativo permanecen intactos salvo politica explicita que los identifique como transformables.

## Puntuacion de prosa

`PROSE_PUNCTUATION_SPACING` consume reglas explicitas de campo. Cada regla declara:

- puntuacion exacta;
- token de espaciado exacto;
- cantidad de espacios antes;
- cantidad de espacios despues;
- `prose_spacing_version_ref`.

La operacion solo modifica el espaciado adyacente a la puntuacion declarada. No agrega, elimina, sustituye ni reordena signos; no modifica palabras, tildes, caja, Unicode, identidad o estructura; no crea una gramatica universal.

## Capitalizacion empresarial

El unico perfil materializado es:

```text
VENTO_COMMERCIAL_CAPITALIZATION_ES_CO@1.0.0
```

con locale explicito:

```text
es-CO
```

`COMMERCIAL_CAPITALIZATION` solo puede producir mutacion sobre `COMMERCIAL_NAME` cuando la politica efectiva, representacion, fuente, perfil y todas las versiones obligatorias permiten la evaluacion.

Combinaciones admitidas por la frontera pura:

```text
PRIMARY_VALUE + AUTHORITATIVE_SOURCE
DISPLAY_OVERRIDE + APPROVED_OVERRIDE
OUTPUT_PROJECTION + OUTPUT_ONLY
```

La salida de `OUTPUT_PROJECTION` es derivada y no retroalimenta la fuente.

La precedencia fisica de clasificacion es:

```text
1. excepcion oficial de frase, coincidencia valida mas larga
2. excepcion oficial de token
3. sigla, unidad, codigo o forma tecnica protegida
4. conector aprobado
5. palabra ordinaria elegible
6. ambiguedad / revision
```

Un token ordinario cambia solo caja: primer grafema con caja a mayuscula y los restantes grafemas con caja a minuscula bajo `es-CO`; marcas, diacriticos y grafemas sin caja se preservan.

`Frio` y `Maiz` son resultados posibles de caja. `Frío` y `Maíz` requieren diccionario o revision y no pueden ser inventados por esta operacion.

Las fronteras `NAME_START`, `DECLARED_SEGMENT_START` y `NO_SEGMENT_RESET` permanecen separadas. Un reset declarado solo se activa cuando la politica lo habilita; la implementacion reconoce como fronteras declaradas los separadores contractuales de dos puntos y raya larga/corta rodeados por espacios, sin convertir puntuacion interna en una nueva palabra por heuristica.

## Catalogos futuros y fallo cerrado

conectores y excepciones: RESOLVERS VERSIONADOS, CATALOGOS NO MATERIALIZADOS

`SHELL-NORM-003` define interfaces de consumo para conectores y excepciones, pero no materializa ninguna entrada concreta. El consumidor debe proporcionar resolvers con `connector_catalog_version_ref` y `exception_catalog_version_ref` explicitos.

- no existe lista local de conectores;
- no existe lista local de marcas, siglas, unidades o nombres legales;
- no existe seleccion implicita de `latest`;
- conflicto de candidatos bloquea la mutacion;
- token tecnico o mixto no resuelto se preserva y exige revision;
- catalogos concretos pertenecen exclusivamente a `SHELL-NORM-004`.

## Materializacion de SHELL-NORM-004

El marcador historico de `SHELL-NORM-003` que dice `conectores y excepciones: RESOLVERS VERSIONADOS, CATALOGOS NO MATERIALIZADOS` describe correctamente el cierre de 003. `SHELL-NORM-004::GLOBAL` es el propietario posterior que materializa ahora esos catalogos sin reinterpretar E3.

La superficie interna queda ampliada asi:

```text
packages/data-normalization/
|-- README.md
|-- package.json
|-- scripts/
|   |-- validate-normalization-types.mjs
|   |-- validate-normalization-rules.mjs
|   `-- validate-normalization-catalogs.mjs
`-- src/
    |-- normalization.types.ts
    |-- normalization.rules.ts
    `-- normalization.catalogs.ts
```

`src/normalization.catalogs.ts` materializa exactamente dos identidades versionadas:

```text
VENTO_COMMERCIAL_CONNECTOR_CATALOG_ES_CO@1.0.0
VENTO_OFFICIAL_TEXT_EXCEPTION_CATALOG@1.0.0
```

### Catalogo de conectores

El inventario cerrado contiene exactamente 18 entradas, sin faltantes ni duplicados:

```text
a, al, con, de, del, e, el, en, la, las, lo, los, o, para, por, sin, u, y
```

Las tres familias descriptivas son `preposiciones y contracciones`, `articulos` y `conjunciones coordinantes`. No crean gramatica ni amplian el catalogo.

Las posiciones normativas son exactamente `NAME_START`, `DECLARED_SEGMENT_START` e `INTERNAL`. Los resultados cerrados son exactamente cinco: `CONNECTOR_INITIAL_CAPITALIZED`, `CONNECTOR_INTERNAL_LOWERCASED`, `CONNECTOR_PRESERVED_BY_EXCEPTION`, `CONNECTOR_PRESERVED_AMBIGUOUS` y `CONNECTOR_POLICY_BLOCKED`.

`al` y `del` permanecen atomicos. No existen contracciones, expansiones, matching por subcadena, sustituciones `y/e` o `o/u`, aliases implicitos ni deteccion automatica de idioma.

### Catalogo de excepciones

La superficie contractual materializa:

| Familia | Cantidad |
| --- | ---: |
| familias de excepcion | 4 |
| atributos obligatorios de `OfficialTextExceptionEntry` | 23 |
| alcances de coincidencia | 4 |
| modos de coincidencia | 3 |
| modos de aplicacion | 4 |
| resultados de evaluacion | 7 |
| tipos de autoridad | 5 |
| estados de ciclo de vida | 3 |
| formas normativas iniciales | 28 |

Las 28 formas se distribuyen exactamente en 3 marcas, 10 aplicaciones/codigos controlados, 9 unidades/familias tecnicas y 6 protecciones contextuales de sufijo legal. De ellas, 22 corresponden a emision canonica o validacion tecnica y 6 a proteccion legal contextual.

```text
marcas: 3M, iPhone, Coca-Cola
aplicaciones/codigos: NEXO, VISO, ORIGO, NUMERA, FOGO, PULSO, VGR, SAU, VCF, COP
unidades/familias: g, kg, ml, l, un, dz, count, mass, volume
sufijos legales: SAS, S.A.S., SA, S.A., LTDA, CIA
```

Las seis protecciones legales no son aliases entre si. `SAS` no implica `S.A.S.` y viceversa.

### Binding explicito y ausencia de autoridad inventada

Las 28 formas son definiciones normativas aprobadas, no entradas ejecutables globales con contexto inventado. La funcion `materializeOfficialExceptionEntry` exige que cada activacion suministre explicitamente los 23 atributos contractuales mediante un binding de coordenada, clase, representacion, fuente, autoridad, owner, evidencia, vigencia, estado y modo de aplicacion.

La implementacion no fabrica `authority_owner`, `evidence_reference`, dominio, entidad, campo, `valid_from`, aliases ni permisos de mutacion. Una forma normativa reconocida sin binding compatible se preserva y queda en revision/bloqueo, no se emite por heuristica. Solo `ACTIVE` participa en decisiones nuevas.

### Candidatos no activables

Se preserva un inventario de 34 casos documentales no activables: 14 casos de marca o forma mixta, 11 casos de sigla/codigo contextual y 9 casos estructurales o lexicos. Ninguno se incorpora a las 28 formas normativas.

Entre ellos permanecen `Oster/oster`, `Wellmix/Welmix`, `Vento`, `Saudo`, `BBQ`, `T26`, `Six Pack`, `six_pack` y `Bolsa 1 kg`. Coincidencia, caja, frecuencia o similitud no los promueven.

### Integracion con SHELL-NORM-003

`normalization.rules.ts` conserva las cinco operaciones y los 23 literales verificados de 003. 004 agrega un hook opcional `review_input` al resolver de catalogos. El hook es retrocompatible y permite que un candidato no activable, una entrada suspendida/retirada o una forma normativa sin binding explicito falle cerrada antes de la tokenizacion ordinaria.

`createCommercialCapitalizationCatalogResolver` implementa el contrato consumido por 003 con versiones exactas de catalogo, entradas de excepcion explicitamente activadas y resolucion determinista de conectores. No existe fallback a listas locales ni seleccion `latest`.

### Pureza y fronteras

La materializacion 004 no usa filesystem, red, Supabase, variables de entorno, reloj implicito, aleatoriedad ni locale implicito para decidir semantica. El case mapping se recibe mediante adaptador versionado.

Los catalogos no crean identidad, unicidad, deduplicacion, fusion, persistencia, commit ni autoridad empresarial. `EXTERNAL_ORIGINAL`, snapshots y evidencia conservan su frontera. VITAL no hereda estos catalogos. Correccion ortografica permanece reservada a `SHELL-NORM-005`; busqueda a `SHELL-NORM-006`.

### Validacion de SHELL-NORM-004

`scripts/validate-normalization-catalogs.mjs` valida el SHA del contrato propietario mediante el parser canonico de tareas, ejecuta primero los validadores verificados de 002/003, compila tipos/reglas/catalogos con el TypeScript local y comprueba inventarios, distribuciones, ausencia de promociones de candidatos y comportamiento fail-closed mediante fixture ejecutable.

## Pureza y dependencias runtime

Las cinco funciones son puras respecto de sus inputs explicitos. El modulo no usa:

- filesystem;
- red;
- Supabase;
- variables de entorno;
- reloj;
- aleatoriedad;
- locale implicito;
- catalogos globales;
- persistencia;
- identidad, deduplicacion o fusion;
- autoridad de commit.

Los adaptadores de segmentacion, grafemas, case mapping y NFC son dependencias explicitas y versionadas. Esto evita convertir la version de Node, navegador o sistema operativo en semantica contractual silenciosa.

## Validacion

`scripts/validate-normalization-rules.mjs` valida simultaneamente:

- compatibilidad de `SHELL-NORM-002` mediante su validador propietario;
- cinco operaciones exactas;
- nueve clases de token;
- seis resultados de token;
- tres fronteras;
- total exacto de 23 literales;
- perfil `VENTO_COMMERCIAL_CAPITALIZATION_ES_CO@1.0.0`;
- locale `es-CO`;
- SHA-256 del contrato propietario de `SHELL-NORM-003`;
- ausencia de dependencias runtime implicitas prohibidas;
- ausencia de catalogos concretos de conectores y excepciones;
- comportamiento de NFC, trim, compactacion, puntuacion, capitalizacion, protecciones y fallo cerrado mediante fixture puro;
- permanencia del package sin version ni exports publicos.

## Estado de esta fundacion

```text
package root: MATERIALIZADO
package.json: MATERIALIZADO
tipos SHELL-NORM-002: MATERIALIZADOS
reglas SHELL-NORM-003: MATERIALIZADAS
operaciones SHELL-NORM-003: 5
inventario SHELL-NORM-003: 23 literales
catalogos SHELL-NORM-004: MATERIALIZADOS
conectores: 18
familias de conectores: 3
posiciones de conectores: 3
resultados de conectores: 5
familias de excepcion: 4
atributos de entrada de excepcion: 23
scopes / matchers / aplicaciones: 4 / 3 / 4
resultados / autoridades / estados: 7 / 5 / 3
formas normativas iniciales: 28 = 22 + 6
candidatos no activables: 34 = 14 + 11 + 9
entradas ejecutables globales con owner/evidencia inventados: 0
version npm: NO DECLARADA
exports publicos: NO MATERIALIZADOS
diccionario: NO MATERIALIZADO
busqueda: NO MATERIALIZADA
preview: NO MATERIALIZADO
metadata runtime / auditoria: NO MATERIALIZADA
consumidores migrados: 0
cambios Supabase: 0
```

## Handoffs reservados

| Tarea | Responsabilidad reservada |
| --- | --- |
| `SHELL-NORM-005` | diccionarios ortograficos versionados |
| `SHELL-NORM-006` | busqueda y comparacion |
| `SHELL-NORM-007` | previsualizacion de transformaciones |
| `SHELL-NORM-008` | metadatos de version y auditoria |
| `SHELL-NORM-009` | certificacion de idempotencia y conservacion semantica |

Ninguna de las tareas reservadas `SHELL-NORM-005..009` se adelanta por `SHELL-NORM-004`.

Source contract SHA-256 `SHELL-NORM-001`: `f88a0eb3dc6ed6103dc00063124e3e1f5b2a78545d1980e39f596b4fc1653c90`.

Source contract SHA-256 `SHELL-NORM-002`: `ae4bf09517c3e8d0e11c6e5e2e317079115205ba072913fbc76f31323dd90e76`.

Source contract SHA-256 `SHELL-NORM-003`: `ce86eef6da718064b58f9b977af644d9ce0030fc1de07c203c5709e877c9c461`.


Source contract SHA-256 `SHELL-NORM-004`: `abacc131fb8dd2b18dbd59ef04915e516f6044d4737422b55e45f1eb5dda64ef`.
