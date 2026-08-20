# @vento/contracts/authorization

Contrato estático de autorización compartido de Vento OS.

## Estado materializado

La raíz fue creada por `SHELL-CON-001::GLOBAL`.

`SHELL-CON-002::GLOBAL` materializa exclusivamente la identidad canónica de aplicaciones:

- fuente versionada: `catalog/versions/1.0.0/applications.json`;
- schema de aplicación: `schemas/application.schema.json`;
- tipos y valores TypeScript generados bajo `generated/versions/1.0.0/`;
- generación determinista mediante `scripts/generate-authorization-types.mjs`;
- validación de la porción de aplicaciones mediante `scripts/validate-authorization-catalog.mjs`.

Esta materialización es una fundación `PRE_E5_FOUNDATION`.

No constituye una publicación del catálogo `1.0.0`, una release de `@vento/contracts`, un tag, una publicación en registry ni una adopción por consumidores.

Por esa razón no se materializan todavía `catalog/current.json`, un manifiesto `published`, exports públicos consumibles ni metadata que afirme publicación.

## Aplicaciones canónicas

El universo vigente contiene exactamente:

- `shell`;
- `anima`;
- `viso`;
- `nexo`;
- `fogo`;
- `origo`;
- `pulso`;
- `numera`;
- `aura`;
- `pass`.

`hub` y `default` no pertenecen a `AppCode`.

## Frontera de responsabilidad

Esta instancia no materializa:

- códigos de permisos completos;
- roles base u operativos;
- scopes;
- aliases;
- permisos legacy o retirados;
- resource contracts;
- catálogo completo publicado;
- changelog de publicación;
- checksums globales;
- migraciones de consumidores;
- cambios en Supabase;
- exports públicos adicionales;
- releases o registry.

Esas responsabilidades permanecen en sus tareas e instancias propietarias.

Hasta que exista publicación y adopción autorizadas, ningún consumidor debe importar rutas internas de este directorio.
