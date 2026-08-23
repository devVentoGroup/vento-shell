# @vento/data-normalization

Raiz privada de autoria para la fundacion compartida de normalizacion de Vento OS.

`SHELL-NORM-001::GLOBAL` materializo la identidad fisica minima y la frontera arquitectonica del package. `SHELL-NORM-002::GLOBAL` materializa exclusivamente el sistema compartido de tipos de campo normalizable, sin habilitar todavia algoritmos, catalogos especializados, diccionarios, validadores runtime, exports publicos, consumidores ni persistencia.

## Autoridad canonica

El package consume y ejecutara semantica aprobada; no crea una segunda fuente de politica.

- `DATA-NORM-ARC-001..012` conservan el gobierno canonico de normalizacion.
- `DATA-NORM-TRANS-001..009` conservan la transicion, dry-run, colisiones, backfill, rollback y evidencia.
- `SHELL-PKG-001..008` conservan distribucion, SemVer, compatibilidad, deprecacion, rollback y adopcion.
- `SHELL-NORM-002..009` materializan progresivamente el contenido especializado del package.
- `DATA-NORM-DB-001..010` conservan persistencia y enforcement fisico cuando un package autorizado lo requiera.

## Frontera fisica de SHELL-NORM-001

La raiz existe como workspace privado bajo `packages/*` con estas invariantes:

- nombre exacto: `@vento/data-normalization`;
- `private: true`;
- `type: module`;
- sin campo `version`;
- sin `exports`;
- sin `main` ni `types`;
- sin `dependencies`, `devDependencies` ni `peerDependencies`;
- sin scripts npm propios;
- sin publicacion, tag, release, registry ni credenciales;
- sin consumidores migrados;
- sin cambios Supabase.

El `package-lock.json` raiz registra este workspace exclusivamente como consecuencia determinista de `packages/*`.

## Materializacion de SHELL-NORM-002

`SHELL-NORM-002::GLOBAL` agrega una unica superficie TypeScript interna y type-only:

```text
packages/data-normalization/
├─ README.md
├─ package.json
├─ scripts/
│  └─ validate-normalization-types.mjs
└─ src/
   └─ normalization.types.ts
```

El archivo `src/normalization.types.ts` materializa exactamente nueve artefactos logicos compartidos:

1. `NormalizableFieldSemanticClass`;
2. `NormalizationRepresentationRole`;
3. `NormalizationSourceRole`;
4. `NormalizationTreatmentMode`;
5. `NormalizationOperationKind`;
6. `NormalizableFieldCoordinate`;
7. `NormalizableFieldDescriptor`;
8. `NormalizableStructuredComponentDescriptor`;
9. `NormalizablePolymorphicVariantDescriptor`.

Los cinco vocabularios cerrados conservan exactamente esta conciliacion:

| Familia | Literales |
| --- | ---: |
| clases semanticas | 14 |
| roles de representacion | 7 |
| roles de fuente | 6 |
| modos de tratamiento | 8 |
| familias de operacion | 13 |
| **Total** | **48 literales** |

Los cuatro descriptores son contratos de clasificacion. No conceden autorizacion, no persisten, no ejecutan operaciones y no convierten coincidencia textual en identidad empresarial.

`implementation_binding_ref` conserva cardinalidad opcional de cero o mas referencias sin convertir bindings fisicos en semantica. `auxiliary_context` permanece deliberadamente `unknown` en esta instancia para no inventar una estructura fisica que el contrato documental no define.

El validador `scripts/validate-normalization-types.mjs` comprueba:

- cobertura exacta 14/7/6/8/13 y total 48;
- orden e identidad exacta de cada literal;
- existencia exacta de los nueve artefactos;
- campos exactos de los cuatro descriptores;
- ausencia de declaraciones runtime en el contrato de tipos;
- permanencia de la raiz privada sin version, exports ni dependencias;
- coherencia con la reconciliacion `GLOBAL_ENABLE_ONCE` / `PRE_E5_FOUNDATION`;
- presencia de las fronteras de identidad, fallo cerrado y VITAL en el contrato canonico;
- frontera documental de esta materializacion.

## Pureza y determinismo

La futura evaluacion compartida debe conservar simultaneamente:

- mismo input logico + mismo contexto explicito + mismas versiones -> mismo resultado logico;
- cero persistencia o efectos empresariales por evaluar;
- cero acceso implicito a Supabase, red, filesystem mutable, navegador o secretos;
- cero dependencia de locale, timezone, hora actual, aleatoriedad o configuracion privada del consumidor cuando no sean inputs contractuales;
- fallo cerrado cuando falte contexto o version obligatoria;
- separacion entre evaluacion, preview, comando autorizado y commit transaccional.

Importar el package no concede autoridad semantica, empresarial, de autenticacion ni de autorizacion a la capa consumidora.

## Clasificacion, identidad y tratamiento

Las taxonomias de `SHELL-NORM-002` expresan contrato, no ejecucion.

```text
semantic_class
+ representation_role
+ source_role
+ operation_kind
+ applicable_exceptions
+ policy_version
=
treatment_mode
```

La interseccion es restrictiva. La ausencia de modo explicito equivale a `PROHIBITED`; una dimension local puede restringir mas, pero no convertir un modo restrictivo en uno permisivo.

`IDENTITY_OR_RECORD_ACTION` cruza deliberadamente la frontera de normalizacion textual: nunca se resuelve como mutacion textual. Igualdad de texto o de derivacion de busqueda no constituye identidad, unicidad, duplicado confirmado ni autorizacion de fusion.

## Datos externos, evidencia y VITAL

`EXTERNAL_ORIGINAL` expresa representacion y `EXTERNAL_EVIDENCE` expresa rol de fuente. Ninguno convierte procedencia externa en autoridad interna.

Secretos, firmas, tokens, hashes y material criptografico permanecen bajo `SECRET_OR_SIGNATURE_MATERIAL` y `PRESERVE_EXACT`.

VITAL permanece fuera de las reglas transversales de Vento OS. Compartir estos tipos no transfiere politicas Vento a VITAL.

## Handoffs reservados

La materializacion actual no adelanta las tareas siguientes:

| Tarea | Responsabilidad reservada |
| --- | --- |
| `SHELL-NORM-003` | espacios, Unicode, puntuacion de prosa y capitalizacion |
| `SHELL-NORM-004` | conectores y excepciones |
| `SHELL-NORM-005` | diccionarios ortograficos versionados |
| `SHELL-NORM-006` | busqueda y comparacion |
| `SHELL-NORM-007` | previsualizacion de transformaciones |
| `SHELL-NORM-008` | metadatos de version y auditoria |
| `SHELL-NORM-009` | idempotencia y conservacion semantica |

## Estado de esta fundacion

```text
package root: MATERIALIZADO
package.json: MATERIALIZADO
README: MATERIALIZADO
tipos SHELL-NORM-002: MATERIALIZADOS
artefactos logicos de tipos: 9
literales contractuales: 48
version npm: NO DECLARADA
exports publicos: NO MATERIALIZADOS
algoritmos de normalizacion: NO MATERIALIZADOS
catalogos especializados / diccionarios: NO MATERIALIZADOS
validadores runtime: NO MATERIALIZADOS
consumidores migrados: 0
cambios Supabase: 0
```

Source contract SHA-256 `SHELL-NORM-001`: `f88a0eb3dc6ed6103dc00063124e3e1f5b2a78545d1980e39f596b4fc1653c90`.

Source contract SHA-256 `SHELL-NORM-002`: `ae4bf09517c3e8d0e11c6e5e2e317079115205ba072913fbc76f31323dd90e76`.
