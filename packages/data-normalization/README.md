# @vento/data-normalization

Raiz privada de autoria para la fundacion compartida de normalizacion pura y determinista de Vento OS.

`SHELL-NORM-001::GLOBAL` materializo la identidad fisica minima del package. `SHELL-NORM-002::GLOBAL` materializo el sistema compartido de tipos de campo normalizable. `SHELL-NORM-003::GLOBAL` materializo las reglas puras de Unicode, espacios, puntuacion de prosa y capitalizacion empresarial. `SHELL-NORM-004::GLOBAL` materializo los catalogos versionados de conectores y excepciones oficiales. `SHELL-NORM-005::GLOBAL` materializa ahora el diccionario ortografico canonico versionado, sin habilitar exports publicos, consumidores, persistencia, busqueda ni cambios Supabase.

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

Los vocabularios de tipos conservan exactamente **48 literales**: 14 clases semanticas, 7 roles de representacion, 6 roles de fuente, 8 modos de tratamiento y 13 familias de operacion.

`IDENTITY_OR_RECORD_ACTION` permanece fuera de la mutacion textual. La ausencia de modo explicito sigue cerrada como `PROHIBITED`. VITAL no hereda politicas Vento por compartir infraestructura o tipos.

## Materializacion de SHELL-NORM-003

`src/normalization.rules.ts` conserva cinco operaciones puras e independientes:

1. `UNICODE_CANONICALIZATION`;
2. `EDGE_WHITESPACE_TRIM`;
3. `INTERNAL_WHITESPACE_COMPACTION`;
4. `PROSE_PUNCTUATION_SPACING`;
5. `COMMERCIAL_CAPITALIZATION`.

El inventario cerrado de 003 conserva exactamente 5 operaciones, 9 clases de token, 6 resultados de token y 3 fronteras: **23 literales** en total, sin faltantes ni duplicados.

El perfil de capitalizacion sigue siendo exactamente:

```text
VENTO_COMMERCIAL_CAPITALIZATION_ES_CO@1.0.0
```

con locale explicito `es-CO`.

La implementacion no selecciona Unicode, locale, segmentacion, case mapping o catalogos desde el runtime de forma implicita. Las dependencias se reciben mediante adaptadores y referencias de version explicitas.

### Marcador historico de 003

conectores y excepciones: RESOLVERS VERSIONADOS, CATALOGOS NO MATERIALIZADOS

Ese marcador describe correctamente el estado al cierre de `SHELL-NORM-003`; la materializacion posterior de 004 no reescribe la evidencia historica de 003.

## Materializacion de SHELL-NORM-004

`SHELL-NORM-004::GLOBAL` materializo dos identidades versionadas:

```text
VENTO_COMMERCIAL_CONNECTOR_CATALOG_ES_CO@1.0.0
VENTO_OFFICIAL_TEXT_EXCEPTION_CATALOG@1.0.0
```

El catalogo de conectores conserva exactamente 18 entradas, 3 familias descriptivas, 3 posiciones y 5 resultados. El catalogo de excepciones conserva exactamente 4 familias, 23 atributos de entrada, 4 scopes, 3 matchers, 4 modos de aplicacion, 7 resultados, 5 tipos de autoridad, 3 estados y 28 formas normativas iniciales.

formas normativas iniciales: 28 = 22 + 6

Las 28 formas se distribuyen en 3 marcas, 10 aplicaciones/codigos controlados, 9 unidades/familias tecnicas y 6 protecciones legales contextuales.

candidatos no activables: 34 = 14 + 11 + 9

Los 34 candidatos permanecen fuera del catalogo activo. Coincidencia, caja, frecuencia o similitud no los promueven.

`materializeOfficialExceptionEntry` exige binding explicito de coordenada, clase, representacion, fuente, autoridad, owner, evidencia, vigencia, estado y modo. 004 no inventa `authority_owner`, `evidence_reference`, scopes, aliases ni permisos de mutacion.

`normalization.rules.ts` conserva las cinco operaciones de 003 y solo incorpora el hook opcional `review_input` requerido por 004 para fallo cerrado antes de la tokenizacion.

## Materializacion de SHELL-NORM-005

`SHELL-NORM-005::GLOBAL` materializa una etapa ortografica pura nueva en:

```text
packages/data-normalization/src/normalization.dictionary.ts
```

El validador propietario queda en:

```text
packages/data-normalization/scripts/validate-normalization-dictionary.mjs
```

La superficie interna despues de 005 es:

```text
packages/data-normalization/
|-- README.md
|-- package.json
|-- scripts/
|   |-- validate-normalization-types.mjs
|   |-- validate-normalization-rules.mjs
|   |-- validate-normalization-catalogs.mjs
|   `-- validate-normalization-dictionary.mjs
`-- src/
    |-- normalization.types.ts
    |-- normalization.rules.ts
    |-- normalization.catalogs.ts
    `-- normalization.dictionary.ts
```

### Identidad y locale

El diccionario compartido es exactamente:

```text
VENTO_CANONICAL_ORTHOGRAPHIC_DICTIONARY_ES_CO@1.0.0
```

El perfil linguistico es exactamente `es-CO` y nunca se infiere desde Node, navegador, sistema operativo, base de datos o consumidor.

### Contrato de entrada

atributos de entrada del diccionario: 21

Los 21 atributos son exactamente:

```text
dictionary_entry_key
locale
source_form
canonical_form
match_scope
semantic_class
domain_scope
entity_scope
field_scope
representation_role
source_role
case_projection_mode
decision_mode
status
valid_from
valid_to
dictionary_version
supersedes
evidence_reference
approval_reference
reason
```

Las tres correcciones aprobadas se materializan primero como definiciones normativas. `materializeOrthographicDictionaryEntry` solo las convierte en entradas ejecutables cuando recibe un binding explicito de alcance, clase, representacion, fuente, estado, vigencia, evidencia, aprobacion y motivo. Una entrada incompleta no es ejecutable.

No se inventan scopes, `evidence_reference`, `approval_reference`, `valid_from`, autoridad o contexto empresarial para hacer ejecutable una correccion.

### Alcances, caja y decision

Los alcances cerrados de coincidencia son exactamente:

```text
FULL_VALUE
PHRASE
TOKEN
```

La version 1.0.0 solo contiene entradas activables `TOKEN`; `FULL_VALUE` y `PHRASE` permanecen parte del contrato cerrado para versiones/entradas que los declaren explicitamente. No existe matching por subcadena.

El modo de proyeccion de caja es exactamente:

```text
PRESERVE_RESOLVED_CASE_PATTERN
```

La etapa ortografica consume la caja ya resuelta; no vuelve a ejecutar capitalizacion. Ejemplos:

```text
maiz -> maíz
Maiz -> Maíz
MAIZ -> MAÍZ
```

Los modos cerrados de decision son exactamente:

```text
REPLACE_ORTHOGRAPHY
PRESERVE_AS_APPROVED
REVIEW_REQUIRED
```

### Resolucion de alcance

Los cuatro niveles explicitos son exactamente:

```text
FIELD_SCOPE
ENTITY_SCOPE
DOMAIN_SCOPE
VENTO_OS_TRANSVERSAL_SCOPE
```

La codificacion fisica del alcance transversal usa `domain_scope = VENTO_OS_TRANSVERSAL_SCOPE` con `entity_scope = null` y `field_scope = null`. Es una representacion interna explicita del nivel contractual; no crea un dominio empresarial nuevo.

La especificidad es:

```text
FIELD_SCOPE
> ENTITY_SCOPE
> DOMAIN_SCOPE
> VENTO_OS_TRANSVERSAL_SCOPE
> conservar por ausencia de politica
```

La ausencia de resolucion no es un quinto scope permisivo.

### Precedencia general

La precedencia conserva exactamente ocho niveles:

1. excepcion oficial de frase valida mas larga;
2. excepcion oficial de token o componente estructurado;
3. proteccion tecnica por clase, representacion o fuente;
4. entrada de diccionario mas especifica;
5. entrada de frase mas larga dentro de la misma especificidad;
6. entrada de token exacto;
7. token sin entrada;
8. forma ambigua o conflictiva.

`OrthographicDictionaryPrecedenceResolver` es una dependencia explicita: 005 no duplica los catalogos de 004 ni intenta inferir excepciones, conectores o protecciones tecnicas por su cuenta. El resolver debe declarar exactamente las versiones de 004 compatibles con la evaluacion.

### Catalogo inicial

correcciones iniciales: 3

La version 1.0.0 contiene exactamente:

| Clave | Origen | Forma canonica | Scope | Decision |
| --- | --- | --- | --- | --- |
| `ORTHO_ES_CO_MAIZ_MAIZ` | `maiz` | `maíz` | `TOKEN` | `REPLACE_ORTHOGRAPHY` |
| `ORTHO_ES_CO_CLASICO_CLASICO` | `clasico` | `clásico` | `TOKEN` | `REPLACE_ORTHOGRAPHY` |
| `ORTHO_ES_CO_FRIO_FRIO` | `frio` | `frío` | `TOKEN` | `REPLACE_ORTHOGRAPHY` |

No existe cuarta correccion por analogia.

### Expresso

expresso: REVISION, NO CORRECCION AUTOMATICA

`expresso` permanece fuera de las tres entradas. Bajo el contrato 1.0.0 produce `DICTIONARY_AMBIGUOUS_REVIEW`, conserva el valor y mantiene destino en `DATA-NORM-ARC-007`. No se convierte automaticamente en `espresso`, `expreso` ni otra forma.

### Puerta de activacion

La evaluacion conserva exactamente 11 condiciones de activacion:

1. existe una politica activa para dominio, entidad y campo;
2. la clase semantica admite correccion mediante diccionario;
3. representacion y fuente permiten mutacion o derivacion;
4. el locale es explicitamente `es-CO`;
5. diccionario, capitalizacion, conectores y excepciones usan versiones compatibles;
6. la entrada esta `APPROVED_ACTIVE` y vigente;
7. el matching exacto y las fronteras se resuelven;
8. no existe excepcion oficial o proteccion de mayor precedencia;
9. no existe conflicto entre entradas activas aplicables;
10. la proyeccion de caja es determinista;
11. decision, entrada y versiones quedan trazables.

Faltar una condicion preserva el valor y produce no aplicacion, revision o bloqueo segun la causa.

### Estados y resultados

Los seis estados cerrados son exactamente:

```text
DRAFT
APPROVED_ACTIVE
SUSPENDED
SUPERSEDED
RETIRED
REJECTED
```

Solo `APPROVED_ACTIVE` puede participar en una decision ejecutable nueva. No existe fallback desde una entrada suspendida, supersedida, retirada o rechazada.

Los siete resultados cerrados son exactamente:

```text
DICTIONARY_CANONICAL_EMITTED
DICTIONARY_ALREADY_CANONICAL
DICTIONARY_PRESERVED_PROTECTED
DICTIONARY_NOT_APPLICABLE
DICTIONARY_AMBIGUOUS_REVIEW
DICTIONARY_CONFLICT_BLOCKED
DICTIONARY_POLICY_BLOCKED
```

Proteccion, no aplicabilidad, revision, conflicto y bloqueo permanecen semanticamente distintos.

### Pureza y matching

La implementacion solo usa comparacion exacta direccional mediante case mapping `es-CO` suministrado por un adaptador versionado. No elimina tildes ni signos durante el matching y no une o divide palabras.

Quedan fuera:

- Levenshtein y distancia de edicion;
- matching difuso;
- fonetica;
- stemming o lematizacion;
- autocorrector del sistema, navegador o teclado;
- frecuencia, popularidad o mayoria;
- modelos linguisticos como autoridad;
- aliases automaticos;
- `unaccent` o transliteracion;
- sustituciones `y/e` u `o/u`;
- contracciones o expansiones;
- busqueda tolerante.

### Clases, representaciones y fuentes

La etapa exige `APPROVED_DICTIONARY_CORRECTION` dentro de una politica activa. Una mutacion directa solo es posible en las combinaciones autorizadas:

```text
PRIMARY_VALUE + AUTHORITATIVE_SOURCE
DISPLAY_OVERRIDE + APPROVED_OVERRIDE
```

`OUTPUT_PROJECTION + OUTPUT_ONLY` solo puede operar como derivacion bajo `DERIVATION_ONLY`.

Permanecen protegidos por defecto:

- `OFFICIAL_BRAND_FORM`;
- `OFFICIAL_LEGAL_NAME`;
- `MEASUREMENT_OR_UNIT_CODE`;
- `TECHNICAL_IDENTIFIER`;
- `CONTACT_IDENTIFIER`;
- `SECRET_OR_SIGNATURE_MATERIAL`;
- `UNCLASSIFIED_PRESERVE`;
- cualquier combinacion de representacion/fuente que no tenga autoridad de mutacion o derivacion.

`EXTERNAL_ORIGINAL`, snapshots, evidencia y copias sin autoridad independiente se preservan. `SYNCHRONIZED_COPY` no se convierte en una autoridad ortografica local.

### Frontera VITAL

El contexto de evaluacion declara explicitamente `product_boundary` como `VENTO_OS` o `VITAL`. El diccionario transversal solo ejecuta bajo `VENTO_OS`. `VITAL` produce bloqueo de politica y preserva el valor aun cuando el texto coincida con una de las tres formas de origen.

### Idempotencia y trazabilidad

Para la misma entrada, coordenada, versiones y contexto:

```text
apply_dictionary(apply_dictionary(value, context), context)
=
apply_dictionary(value, context)
```

La evaluacion devuelve `matched_entry_keys`, referencias de evidencia y aprobacion, scope resuelto, versiones y resultados por token. La persistencia fisica de esas trazas no pertenece a 005.

Una entrada nueva o un cambio ejecutable exige versionado/supersesion. El rollback logico no borra historia, evidencia ni decisiones. La version nueva no es retroactiva por defecto.

### Corpus de conformidad de 005

El validador cubre como minimo:

- `Harina de Maiz` -> `Harina de Maíz`;
- `Pan Masa Madre Clasico` -> `Pan Masa Madre Clásico`;
- `Latte Frio` -> `Latte Frío`;
- `MAIZ` -> `MAÍZ`;
- `Maíz` -> `DICTIONARY_ALREADY_CANONICAL`;
- `expresso` -> revision y preservacion;
- `Coca-Cola` -> proteccion por 004;
- `COMERCIALIZADORA ABC S.A.S.` -> preservacion por clase protegida;
- `500 g` -> proteccion de unidad;
- identificador tecnico `FRIO` -> preservacion;
- `EXTERNAL_ORIGINAL=maiz` -> preservacion;
- `maizena` -> no aplicable, sin matching por subcadena;
- conflicto de igual especificidad -> `DICTIONARY_CONFLICT_BLOCKED`;
- scope de campo prevalece sobre scope transversal;
- entrada retirada no ejecuta ni reaparece como fallback;
- VITAL queda bloqueado;
- segunda evaluacion sobre resultado canonico es estable.

## Validacion de SHELL-NORM-005

`scripts/validate-normalization-dictionary.mjs`:

1. verifica el SHA del contrato propietario de `SHELL-NORM-005` mediante `parseTaskBlocks`;
2. comprueba `GLOBAL_ENABLE_ONCE` y `PRE_E5_FOUNDATION`;
3. ejecuta primero el validador verificado de 004, que encadena compatibilidad 003/002;
4. compila tipos, reglas, catalogos y diccionario con el TypeScript local;
5. valida 21 atributos, 3 scopes, 3 modos de decision, 4 niveles, 8 precedencias, 3 entradas, 1 forma ambigua, 11 condiciones, 6 estados y 7 resultados;
6. verifica binding explicito, falta de cuarta correccion, protecciones, conflicto, idempotencia, VITAL y fallo cerrado mediante fixture ejecutable;
7. bloquea dependencias runtime implicitas y heuristicas de busqueda;
8. verifica que archivos y contratos propietarios anteriores permanezcan sin cambios.

## Materializacion de SHELL-NORM-006

`SHELL-NORM-006::GLOBAL` materializa la politica interna, pura y determinista de busqueda y comparacion en:

```text
packages/data-normalization/src/normalization.search.ts
```

La identidad exacta es:

```text
VENTO_TEXT_SEARCH_AND_COMPARISON_POLICY@1.0.0
```

El runtime recibe adaptadores y resolvers versionados de NFC, case mapping `es-CO`, tokenizacion, plegado acotado de tildes, aliases y autorizacion. No selecciona locale, catalogos, permisos, filesystem, red, reloj, entorno ni persistencia de forma implicita.

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

`deriveSearchRepresentations` produce claves y tokens no autoritativos despues de validar finalidad, scope, clase, perfil, locale, versiones y autorizacion. La consulta vacia, una clase bloqueada, una version incompleta, un adapter inconsistente o una autorizacion denegada fallan cerrado.

`evaluateSearchCandidates` aplica la precedencia cerrada de nueve modos y ordena deterministamente por nivel, especificidad de scope, cobertura, prioridad empresarial aprobada, clave estable e identificador inmutable. El valor mostrado siempre procede del candidato autorizado; las claves derivadas no sustituyen el valor empresarial.

La tolerancia `es-CO` pliega solo vocales autorizadas y preserva `ñ`. Signos, guiones, apostrofos y fronteras permanecen disponibles para comparacion. No hay matching por subcadena dentro de tokens, stopwords implicitas, aprendizaje de aliases, seleccion automatica, identidad, unicidad, correccion, fusion ni efectos de escritura.

La superficie sigue siendo interna: no agrega version npm, exports publicos, dependencias o consumidores. No crea SQL, RPC, columnas, indices, constraints, migraciones, backfills ni cambios Supabase.

## Validacion de SHELL-NORM-006

`scripts/validate-normalization-search.mjs`:

1. verifica el SHA del contrato propietario de `SHELL-NORM-006` mediante `parseTaskBlocks`;
2. comprueba `GLOBAL_ENABLE_ONCE` y `PRE_E5_FOUNDATION`;
3. ejecuta primero el validador verificado de 005, que encadena compatibilidad 004/003/002;
4. compila tipos, reglas, catalogos, diccionario y busqueda con el TypeScript local;
5. valida los inventarios cerrados 7/7/15/6/9/15/13/14/11;
6. prueba tildes con `ñ` preservada, signos, fronteras, ausencia de union de palabras, prefijo del ultimo token, ranking estable, privacidad y autorizacion fail-closed;
7. bloquea dependencias runtime implicitas, heuristicas fuzzy, `unaccent`, Supabase y efectos de escritura;
8. verifica que las fuentes y validadores propietarios anteriores permanezcan sin cambios.

Source contract SHA-256 `SHELL-NORM-006`: `64d18e5a35e8a91dbae23cd0f3cef6928a684d8ba2c9e6e37101f1e7959a5a14`.

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
scopes del diccionario: 3
modos de decision: 3
niveles de resolucion: 4
niveles de precedencia: 8
correcciones iniciales: 3
formas ambiguas explicitas: 1
condiciones de activacion: 11
estados: 6
resultados: 7
entradas ejecutables globales con scope/evidencia/aprobacion inventados: 0
version npm: NO DECLARADA
exports publicos: NO MATERIALIZADOS
busqueda SHELL-NORM-006: MATERIALIZADA
representaciones derivadas de busqueda: 7
clases de token o frontera de busqueda: 7
atributos de alias de busqueda: 15
perfiles cerrados de busqueda: 6
modos de coincidencia: 9
pasos de pipeline: 15
atributos de respuesta: 13
clases semanticas gobernadas: 14
componentes estructurados: 11
transliteracion: DESHABILITADA
similitud: DESHABILITADA
preview: NO MATERIALIZADO
metadata runtime / auditoria: NO MATERIALIZADA
consumidores migrados: 0
cambios Supabase: 0
```

## Handoffs reservados

| Tarea | Responsabilidad reservada |
| --- | --- |
| `SHELL-NORM-006` | normalizacion de busqueda y comparacion |
| `SHELL-NORM-007` | previsualizacion de transformaciones |
| `SHELL-NORM-008` | metadatos de version y auditoria |
| `SHELL-NORM-009` | certificacion de idempotencia y conservacion semantica |

005 no adelanta busqueda, preview, auditoria runtime, persistencia, identidad, unicidad, deduplicacion o fusion.

Source contract SHA-256 `SHELL-NORM-001`: `f88a0eb3dc6ed6103dc00063124e3e1f5b2a78545d1980e39f596b4fc1653c90`.

Source contract SHA-256 `SHELL-NORM-002`: `ae4bf09517c3e8d0e11c6e5e2e317079115205ba072913fbc76f31323dd90e76`.

Source contract SHA-256 `SHELL-NORM-003`: `ce86eef6da718064b58f9b977af644d9ce0030fc1de07c203c5709e877c9c461`.

Source contract SHA-256 `SHELL-NORM-004`: `abacc131fb8dd2b18dbd59ef04915e516f6044d4737422b55e45f1eb5dda64ef`.

Source contract SHA-256 `SHELL-NORM-005`: `6a9e98517f962da17c5b8877aa8f358f746e60a397ff621f8dd559bde5ae8837`.

Source contract SHA-256 `SHELL-NORM-006`: `64d18e5a35e8a91dbae23cd0f3cef6928a684d8ba2c9e6e37101f1e7959a5a14`.
