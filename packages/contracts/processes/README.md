# @vento/contracts/processes

Materialización interna de la identidad canónica de procesos de Vento OS.

## Estado

`SHELL-CON-009::GLOBAL` materializa la proyección estática interna definida por `SHELL-CON-009`.

La autoridad semántica de asignación y linaje permanece en `PROC-CANONICAL-ID-REGISTRY-001`, gobernado por `PROC-CAT-003` y reconciliado por `PROC-CAT-020`.

Esta materialización pertenece a la fundación `PRE_E5_FOUNDATION`.

No publica el subpath `@vento/contracts/processes`, no modifica la versión de `@vento/contracts`, no crea una release, tag o publicación en registry y no adopta consumidores.

## Identidad vigente

El conjunto materializado contiene exactamente 69 identidades canónicas:

- `VPROC-0001` a `VPROC-0069`;
- 69 estados de registro `CANONICAL`;
- 0 `MERGED_ALIAS`;
- 0 `SPLIT_PARENT`;
- 0 `RETIRED`;
- 0 `VOID`.

`VPROC-0070` es únicamente el siguiente identificador disponible y no pertenece a `ProcessId`.

`VPROC-0000` es inválido.

## Superficie interna

La salida generada expone internamente:

- `PROCESS_ID_PATTERN_SOURCE`;
- `PROCESS_ID_PATTERN`;
- `PROCESS_IDS`;
- `ProcessId`;
- `PROCESS_ID_REGISTRY_METADATA`;
- `ProcessIdRegistryMetadata`;
- `isProcessIdFormat()`;
- `isProcessId()`.

`ProcessId` se deriva de la misma colección literal `PROCESS_IDS`; no existe una segunda lista manual.

## Validación

Una entrada externa solo se acepta como `ProcessId` cuando:

1. es un string;
2. cumple exactamente `^VPROC-[0-9]{4}$`;
3. no es `VPROC-0000`;
4. pertenece al conjunto asignado `VPROC-0001..VPROC-0069`.

Cumplir el patrón no demuestra pertenencia. Por tanto, `VPROC-0070` y `VPROC-9999` siguen siendo identidades desconocidas en este corte.

## Generación

Los artefactos bajo `generated/` se regeneran determinísticamente desde:

- `PROC-CAT-003`, que contiene `PROC-CANONICAL-ID-REGISTRY-001`;
- `PROC-CAT-020`, que reconcilia las 69 identidades como `CANONICAL`;
- `SHELL-CON-009`, que define la proyección compartida.

Los archivos generados no se editan para cambiar significado.

## Límites

Esta instancia no materializa:

- estados de proceso, reservados a `SHELL-CON-010`;
- instancias de proceso;
- pasos, pantallas, acciones, eventos, comandos o auditorías;
- aliases `ASIS-SRC-*` o `ADICIONAL-PROVISIONAL-*` como identidades públicas;
- lógica empresarial;
- persistencia o Supabase;
- autorización;
- consumidores;
- exports públicos;
- publicación del package;
- registry, tags o releases.

Reconocer un `ProcessId` no demuestra implementación, disponibilidad, autorización ni existencia de una instancia activa.
