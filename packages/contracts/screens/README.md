# @vento/contracts/screens

Materialización interna de la identidad canónica de pantallas de Vento OS.

## Estado

`SHELL-CON-011::GLOBAL` materializa la proyección estática interna definida por `SHELL-CON-011`.

La autoridad semántica de identidad permanece en `SCREEN-IDENTITY-CONTRACT-001`, gobernado por `PROC-SCREEN-001`.

La autoridad del conjunto vigente permanece en `SCREEN-CANONICAL-CATALOG-001`, gobernado por `PROC-SCREEN-002`.

`PROC-SCREEN-003` y `PROC-SCREEN-004` agregan relaciones con procesos y pasos sin modificar `ScreenId`.

Esta materialización pertenece a la fundación `PRE_E5_FOUNDATION`.

No publica el subpath `@vento/contracts/screens`, no modifica la versión de `@vento/contracts`, no crea una release, tag o publicación en registry y no adopta consumidores.

## Identidad vigente

El conjunto materializado contiene exactamente 177 identidades canónicas:

- `VSCREEN-0001` a `VSCREEN-0177`;
- 177 registros vigentes `CANONICAL`;
- 0 faltantes;
- 0 duplicados.

`VSCREEN-0178` satisface la forma sintáctica mínima, pero no pertenece al conjunto canónico vigente y no se asigna en `SHELL-CON-011`.

`VSCREEN-0000` tampoco pertenece al conjunto asignado.

La secuencia es global para Vento OS. Los rangos no pertenecen a una aplicación concreta y no codifican semántica funcional.

## Distribución heredada por aplicación

La distribución aprobada por `PROC-SCREEN-002` se reconcilia como control de integridad del catálogo, sin incorporarse a `ScreenId`:

- `shell`: 7;
- `viso`: 31;
- `anima`: 14;
- `nexo`: 37;
- `fogo`: 15;
- `origo`: 14;
- `pulso`: 20;
- `numera`: 20;
- `pass`: 19;
- `aura`: 0.

Total: 177.

La aplicación primaria es metadata propietaria del catálogo de pantallas; no forma parte del namespace `VSCREEN-*`.

## Superficie interna

La salida generada expone internamente:

- `SCREEN_ID_PATTERN_SOURCE`;
- `SCREEN_ID_PATTERN`;
- `SCREEN_IDS`;
- `ScreenId`;
- `SCREEN_ID_REGISTRY_METADATA`;
- `ScreenIdRegistryMetadata`;
- `isScreenIdFormat()`;
- `isScreenId()`.

`ScreenId` se deriva de la misma colección literal `SCREEN_IDS`; no existe una segunda lista manual.

## Forma y pertenencia

La forma sintáctica es:

`^VSCREEN-[0-9]{4,}$`

Una entrada externa solo se acepta como `ScreenId` cuando:

1. es un string;
2. cumple la forma sintáctica;
3. pertenece exactamente a `SCREEN_IDS`.

Cumplir el patrón no demuestra pertenencia. Por tanto, `VSCREEN-0178` y `VSCREEN-9999` son referencias desconocidas en este corte.

## Estabilidad y opacidad

`ScreenId` es una identidad opaca.

No codifica:

- aplicación;
- proceso;
- paso;
- rol;
- sede;
- área;
- dispositivo;
- ruta;
- slug;
- componente;
- permiso;
- versión;
- entorno.

Cambios de nombre, ruta, slug, layout, componentes o adaptación responsive no renumeran por sí mismos una pantalla cuando su identidad lógica permanece.

Un identificador asignado no se reutiliza.

## Reconciliación con procesos y pasos

La generación comprueba que `PROC-SCREEN-003` y `PROC-SCREEN-004` conservan el mismo universo de 177 `ScreenId`.

Esa comprobación no convierte en parte de este contrato:

- `primary_process_id`;
- `step_id`;
- relaciones secundarias;
- acciones;
- navegación.

Los vínculos continúan gobernados por sus registros propietarios.

## Generación

Los artefactos bajo `generated/` se regeneran determinísticamente desde:

- `PROC-SCREEN-001`, que define `SCREEN-IDENTITY-CONTRACT-001`;
- `PROC-SCREEN-002`, que contiene `SCREEN-CANONICAL-CATALOG-001`;
- `PROC-SCREEN-003`, que reconcilia los vínculos pantalla-proceso;
- `PROC-SCREEN-004`, que reconcilia los vínculos pantalla-paso;
- `SHELL-CON-011`, que define la proyección compartida.

Los archivos generados no se editan para cambiar significado.

La comprobación de freshness normaliza saltos de línea para que LF y CRLF no creen una falsa divergencia semántica en Windows.

## Límites

Esta instancia no materializa:

- nuevas pantallas;
- aplicación, proceso o paso como parte de `ScreenId`;
- rutas, slugs, layouts o componentes;
- navegación runtime;
- acciones funcionales, reservadas a `SHELL-CON-012`;
- permisos o autorización;
- eventos, comandos o auditoría;
- persistencia o Supabase;
- migraciones o datos;
- consumidores;
- exports públicos;
- publicación del package;
- registry, tags o releases.

Reconocer un `ScreenId` no demuestra visibilidad, permiso, implementación, disponibilidad ni existencia de una superficie desplegada.
