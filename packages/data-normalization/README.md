# @vento/data-normalization

Raiz privada de autoria para la fundacion compartida de normalizacion de Vento OS.

`SHELL-NORM-001::GLOBAL` materializa unicamente la identidad fisica minima y la frontera arquitectonica del package. No materializa todavia tipos, algoritmos, catalogos, diccionarios, validadores de normalizacion, exports publicos, consumidores ni persistencia.

## Autoridad canonica

El package consume y ejecutara semantica aprobada; no crea una segunda fuente de politica.

- `DATA-NORM-ARC-001..012` conservan el gobierno canonico de normalizacion.
- `DATA-NORM-TRANS-001..009` conservan la transicion, dry-run, colisiones, backfill, rollback y evidencia.
- `SHELL-PKG-001..008` conservan distribucion, SemVer, compatibilidad, deprecacion, rollback y adopcion.
- `SHELL-NORM-002..009` materializaran progresivamente el contenido especializado del package.
- `DATA-NORM-DB-001..010` conservan persistencia y enforcement fisico cuando un package autorizado lo requiera.

## Frontera fisica de SHELL-NORM-001

La raiz existe como workspace privado bajo `packages/*` con estas invariantes:

- nombre exacto: `@vento/data-normalization`;
- `private: true`;
- `type: module`;
- sin campo `version` en esta instancia;
- sin `exports`;
- sin `main` ni `types`;
- sin `dependencies`, `devDependencies` ni `peerDependencies`;
- sin scripts propios;
- sin `src/` ni archivos TypeScript;
- sin publicacion, tag, release, registry ni credenciales;
- sin consumidores migrados;
- sin cambios Supabase.

El `package-lock.json` raiz registra este workspace exclusivamente como consecuencia determinista de `packages/*`.

## Pureza y determinismo

La futura evaluacion compartida debe conservar simultaneamente:

- mismo input logico + mismo contexto explicito + mismas versiones -> mismo resultado logico;
- cero persistencia o efectos empresariales por evaluar;
- cero acceso implicito a Supabase, red, filesystem mutable, navegador o secretos;
- cero dependencia de locale, timezone, hora actual, aleatoriedad o configuracion privada del consumidor cuando no sean inputs contractuales;
- fallo cerrado cuando falte contexto o version obligatoria;
- separacion entre evaluacion, preview, comando autorizado y commit transaccional.

Importar el package no concede autoridad semantica, empresarial, de autenticacion ni de autorizacion a la capa consumidora.

## Identidad, busqueda y representaciones

La normalizacion no constituye identidad ni autoriza consolidacion:

```text
VALOR NORMALIZADO IGUAL != MISMA ENTIDAD
CLAVE DE BUSQUEDA IGUAL != DUPLICADO CONFIRMADO
FORMA ORTOGRAFICA IGUAL != AUTORIZACION DE FUSION
```

Valor mostrado, valor de busqueda, original externo, identificador tecnico, texto libre, snapshot, proyeccion y estructura compuesta permanecen separados.

Los originales externos y su procedencia se preservan. Secretos, firmas, tokens, hashes e identificadores tecnicos no reciben correccion linguistica por defecto. VITAL no hereda automaticamente las politicas transversales de Vento OS por compartir infraestructura o importar este package.

## Handoffs reservados

Esta instancia no adelanta las tareas siguientes:

| Tarea | Responsabilidad reservada |
| --- | --- |
| `SHELL-NORM-002` | tipos de campo normalizable |
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
version npm: NO DECLARADA
src / TypeScript: NO MATERIALIZADO
exports: NO MATERIALIZADO
reglas / tipos / catalogos / diccionarios: NO MATERIALIZADOS
consumidores migrados: 0
cambios Supabase: 0
```

Source contract SHA-256 `SHELL-NORM-001`: `f88a0eb3dc6ed6103dc00063124e3e1f5b2a78545d1980e39f596b4fc1653c90`.
