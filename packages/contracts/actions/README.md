# @vento/contracts/actions

Materialización interna del contrato de identidad de acciones funcionales de Vento OS.

## Estado

`SHELL-CON-012::GLOBAL` materializa la proyección estática interna definida por `SHELL-CON-012`.

La autoridad semántica de las acciones principales permanece en `PROC-SCREEN-014 / SCREEN-PRIMARY-ACTION-REGISTER-001`.

La autoridad semántica de las acciones secundarias permanece en `PROC-SCREEN-015 / SCREEN-SECONDARY-ACTION-REGISTER-001`.

La identidad de pantalla consumida permanece en `SHELL-CON-011::GLOBAL` y su contrato `ScreenId`.

Esta materialización pertenece a la fundación `PRE_E5_FOUNDATION`.

No publica el subpath `@vento/contracts/actions`, no modifica la versión de `@vento/contracts`, no crea una release, tag o publicación en registry y no adopta consumidores.

## Universo vigente

El conjunto materializado contiene exactamente 885 identidades funcionales:

- 177 acciones principales;
- 708 acciones secundarias;
- 177 pantallas cubiertas;
- exactamente 5 identidades de acción por pantalla en el corte vigente.

Las principales recorren:

- `VSCREEN-0001::PRIMARY`;
- ...
- `VSCREEN-0177::PRIMARY`.

Cada pantalla vigente conserva cuatro secundarias actuales:

- `::SECONDARY:01` a `::SECONDARY:04`.

`VSCREEN-0001::SECONDARY:05` cumple la forma estructural general, pero no pertenece al conjunto vigente. Tampoco pertenece ninguna acción asociada a un `ScreenId` ausente del contrato de pantallas.

## Identidad y gramática

La identidad contractual es `FunctionalActionId`.

La forma estructural es:

`^VSCREEN-[0-9]{4,}::(?:PRIMARY|SECONDARY:[0-9]{2})$`

Sintaxis y pertenencia son comprobaciones diferentes.

Una cadena solo se acepta como `FunctionalActionId` vigente cuando:

1. es un string;
2. cumple la forma estructural;
3. pertenece exactamente a `FUNCTIONAL_ACTION_IDS`.

La forma por sí sola no crea una acción.

## Superficie interna

La salida generada expone internamente:

- `FUNCTIONAL_ACTION_ID_PATTERN_SOURCE`;
- `FUNCTIONAL_ACTION_ID_PATTERN`;
- `FUNCTIONAL_ACTION_KINDS`;
- `FunctionalActionKind`;
- `FUNCTIONAL_ACTION_SOURCES`;
- `FunctionalActionSource`;
- `SECONDARY_FUNCTIONAL_ACTION_ORDINALS`;
- `SecondaryFunctionalActionOrdinal`;
- `FUNCTIONAL_ACTION_IDS`;
- `FunctionalActionId`;
- `PRIMARY_FUNCTIONAL_ACTION_IDS`;
- `PrimaryFunctionalActionId`;
- `SECONDARY_FUNCTIONAL_ACTION_IDS`;
- `SecondaryFunctionalActionId`;
- `FUNCTIONAL_ACTION_DEFINITIONS`;
- `FunctionalActionDefinition`;
- `FUNCTIONAL_ACTION_REGISTRY_METADATA`;
- `FunctionalActionRegistryMetadata`;
- `isFunctionalActionIdFormat()`;
- `isFunctionalActionId()`;
- `assertFunctionalActionId()`;
- `resolveFunctionalActionScreenId()`;
- `resolveFunctionalActionKind()`;
- `resolveFunctionalActionSource()`;
- `resolveFunctionalActionSecondaryOrdinal()`.

`FunctionalActionId` se deriva de `FUNCTIONAL_ACTION_IDS`. Los subconjuntos y definiciones se generan desde las mismas fuentes canónicas; no son listas editables independientes.

## Metadata mínima proyectada

Cada definición materializada conserva únicamente:

- `functional_action_id`;
- `screen_id`;
- `kind`;
- `source`;
- `secondary_ordinal`.

La fuente es:

- `PROC-SCREEN-014` para `PRIMARY`;
- `PROC-SCREEN-015` para `SECONDARY`.

El ordinal es `null` para la principal y `1`, `2`, `3` o `4` para las secundarias actuales.

Familias, efectos, clases secundarias, relaciones, disponibilidad, ubicación y confirmación continúan gobernados por E2 y no se duplican como nueva autoridad dentro de este contrato de identidad.

## Reconciliación de fuentes

La generación comprueba simultáneamente:

- 177 `ScreenId` físicos vigentes en el contrato predecesor;
- 177 filas de `SCREEN-PRIMARY-ACTION-REGISTER-001`;
- 708 filas de `SCREEN-SECONDARY-ACTION-REGISTER-001`;
- cuatro ordinales secundarios `01..04` por cada pantalla;
- 885 identidades únicas;
- las 22 familias y 11 efectos principales del corte aprobado;
- la distribución de las 708 secundarias por aplicación;
- las 177 filas de la matriz de centralización de `SHELL-CON-012`;
- decisión `CENTRALIZAR_SIN_RENUMERAR`;
- estado `ESPECIFICADO`;
- bloqueo `NO_APLICA`.

El contrato generado no reemplaza ninguna de esas fuentes.

## Separaciones obligatorias

`FunctionalActionId` no es:

- `ScreenId`;
- `ProcessId`;
- `ProcessStateId`;
- un permiso;
- un evento empresarial;
- una ruta o slug;
- un componente o botón;
- una Server Action, API o RPC;
- una credencial o concesión de autorización.

Conocer una identidad funcional no concede visibilidad ni derecho de ejecución.

Una operación técnica puede implementar una acción sin convertirse en su identidad canónica. Un evento empresarial puede ser consecuencia de una acción sin convertirse en la acción.

## Evolución

Las identidades actuales se centralizan sin renumerar.

Los ordinales secundarios actuales son `01..04`. La regla documental de evolución que admite entre dos y cinco secundarias no crea automáticamente `:05`.

Una futura secundaria solo entra al conjunto cuando su fuente propietaria la apruebe. Retirar, reordenar o reclasificar una acción requiere la decisión canónica propietaria y conserva trazabilidad histórica.

## Generación

Los artefactos bajo `generated/` se regeneran determinísticamente desde:

- `PROC-SCREEN-014`;
- `PROC-SCREEN-015`;
- `SHELL-CON-012`;
- el `ScreenId` materializado por `SHELL-CON-011`.

Los archivos generados no se editan para cambiar significado.

La comprobación de freshness normaliza saltos de línea para que LF y CRLF no creen una falsa divergencia semántica en Windows.

## Límites

Esta instancia no materializa:

- nuevas acciones;
- cambios de familia, efecto, clase, relación, ubicación o confirmación;
- permisos o autorización;
- acciones de servidor, APIs o RPC;
- ejecución de lógica empresarial;
- navegación runtime;
- rutas, componentes o botones;
- eventos empresariales, reservados a `SHELL-CON-013`;
- Supabase, RLS, RPC, migraciones o datos;
- consumidores;
- exports públicos;
- publicación del package;
- registry, tags o releases.

Reconocer un `FunctionalActionId` no demuestra permiso, elegibilidad, disponibilidad, implementación ni ejecución exitosa.
