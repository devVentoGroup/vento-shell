# @vento/data-normalization

Raiz privada de autoria para la fundacion compartida de normalizacion pura y determinista de Vento OS.

`SHELL-NORM-001::GLOBAL` materializo la identidad fisica minima del package. `SHELL-NORM-002::GLOBAL` materializo exclusivamente el sistema compartido de tipos de campo normalizable. `SHELL-NORM-003::GLOBAL` materializa ahora las reglas puras de Unicode, espacios, espaciado de puntuacion de prosa y capitalizacion empresarial, sin habilitar exports publicos, consumidores, persistencia ni cambios Supabase.

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
clases de token: 9
resultados de token: 6
fronteras de segmento: 3
inventario SHELL-NORM-003: 23 literales
version npm: NO DECLARADA
exports publicos: NO MATERIALIZADOS
conectores y excepciones concretos: NO MATERIALIZADOS
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
| `SHELL-NORM-004` | catalogos versionados de conectores y excepciones |
| `SHELL-NORM-005` | diccionarios ortograficos versionados |
| `SHELL-NORM-006` | busqueda y comparacion |
| `SHELL-NORM-007` | previsualizacion de transformaciones |
| `SHELL-NORM-008` | metadatos de version y auditoria |
| `SHELL-NORM-009` | certificacion de idempotencia y conservacion semantica |

Ninguna de esas tareas se adelanta por `SHELL-NORM-003`.

Source contract SHA-256 `SHELL-NORM-001`: `f88a0eb3dc6ed6103dc00063124e3e1f5b2a78545d1980e39f596b4fc1653c90`.

Source contract SHA-256 `SHELL-NORM-002`: `ae4bf09517c3e8d0e11c6e5e2e317079115205ba072913fbc76f31323dd90e76`.

Source contract SHA-256 `SHELL-NORM-003`: `ce86eef6da718064b58f9b977af644d9ce0030fc1de07c203c5709e877c9c461`.
