# @vento/contracts/authorization

Contrato estático de autorización compartido de Vento OS.

## Estado materializado

La raíz fue creada por `SHELL-CON-001::GLOBAL`.

`SHELL-CON-002::GLOBAL` materializó la identidad canónica de las diez aplicaciones.

`SHELL-CON-003::GLOBAL` añade exclusivamente la identidad canónica de permisos activos:

- fuente versionada de aplicaciones: `catalog/versions/1.0.0/applications.json`;
- fuente versionada de permisos activos: `catalog/versions/1.0.0/permissions.json`;
- schema de aplicación: `schemas/application.schema.json`;
- schema de identidad de permiso: `schemas/permission.schema.json`;
- tipos y valores TypeScript derivados bajo `generated/versions/1.0.0/`;
- generación determinista mediante `scripts/generate-authorization-types.mjs`;
- validación de aplicaciones, permisos activos, fronteras legacy/retired y artefactos generados mediante `scripts/validate-authorization-catalog.mjs`.

Estas materializaciones pertenecen a la fundación `PRE_E5_FOUNDATION`.

No constituyen una publicación del catálogo `vento.authorization@1.0.0`, una release de `@vento/contracts`, un tag, una publicación en registry ni una adopción por consumidores.

Por esa razón no se materializan todavía `catalog/current.json`, un manifiesto `published`, checksums globales, changelog de publicación, exports públicos consumibles ni metadata que afirme publicación.

## Aplicaciones canónicas

El universo vigente contiene exactamente diez `AppCode`:

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

## Permisos canónicos activos

`permissions.json` contiene exactamente **140** identidades activas y únicas.

Distribución contractual:

| Aplicación | Permisos activos |
| --- | ---: |
| `shell` | 1 |
| `anima` | 10 |
| `aura` | 1 |
| `fogo` | 6 |
| `nexo` | 67 |
| `numera` | 6 |
| `origo` | 6 |
| `pass` | 1 |
| `pulso` | 11 |
| `viso` | 31 |
| **Total** | **140** |

Cada fila materializada por `SHELL-CON-003::GLOBAL` conserva únicamente la porción de identidad que pertenece a esta instancia:

- `permission_key`;
- `app_code`;
- `lifecycle_status`.

El resto de la metadata contractual de un permiso permanece bajo sus tareas propietarias y no se inventa ni adelanta aquí.

## `PermissionKey`

`PermissionKey` se genera determinísticamente desde las 140 claves activas de `permissions.json`.

No se mantiene como:

- `string`;
- un template literal abierto;
- un enum manual;
- una lista paralela de consumidor.

La salida generada incorpora:

- `PermissionKey`;
- `PermissionLifecycleStatus`;
- `PermissionIdentityDefinition`;
- `PermissionByKey`;
- `PERMISSION_KEYS`;
- `PERMISSION_IDENTITIES`;
- `PERMISSION_BY_KEY`;
- `isPermissionKey()`.

Estos artefactos continúan siendo internos al package mientras no exista una publicación y una superficie pública autorizadas.

## Separación legacy y retirados

Las 140 claves activas no incluyen:

- los 22 permisos legacy bloqueados o pendientes de descomposición documentados por `SHELL-CON-003`;
- las 14 claves técnicas retiradas documentadas por `SHELL-CON-003`;
- aliases de compatibilidad.

El validador comprueba que ninguna de esas 36 claves prohibidas aparezca dentro del conjunto activo.

Esta instancia **no** crea todavía:

- `aliases.json`;
- `legacy-permissions.json`;
- `retired-permissions.json`;
- parsers de compatibilidad;
- telemetría de aliases;
- migraciones de consumidores.

La existencia documental de esas categorías se conserva sin convertirlas en `PermissionKey`.

## Frontera de responsabilidad

`SHELL-CON-003::GLOBAL` no materializa:

- metadata completa de permisos como modalidad, sensibilidad, scopes, carriles o contratos de recurso;
- roles base;
- roles operativos;
- scopes;
- aliases;
- permisos legacy o retirados como archivos físicos;
- resource contracts;
- catálogo completo publicado;
- `catalog/current.json`;
- manifest publicado;
- changelog de publicación;
- checksums globales;
- migraciones de consumidores;
- cambios en Supabase;
- lint o gates de consumidores;
- exports públicos adicionales;
- cambio de versión de `@vento/contracts`;
- releases, tags o registry.

Esas responsabilidades permanecen en sus tareas e instancias propietarias.

Hasta que exista publicación y adopción autorizadas, ningún consumidor debe importar rutas internas de este directorio.
