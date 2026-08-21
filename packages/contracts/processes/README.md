# @vento/contracts/processes

Materialización interna de la identidad canónica de procesos y de sus estados principales normales en Vento OS.

## Estado

`SHELL-CON-009::GLOBAL` materializa la proyección estática interna de identidad de procesos definida por `SHELL-CON-009`.

`SHELL-CON-010::GLOBAL` amplía el mismo módulo lógico con la proyección estática interna de estados principales normales definida por `SHELL-CON-010`.

La autoridad semántica de identidad de proceso permanece en `PROC-CANONICAL-ID-REGISTRY-001`, gobernado por `PROC-CAT-003` y reconciliado por `PROC-CAT-020`.

La autoridad semántica de estados permanece en:

- `PROC-PROCESS-INITIAL-STATE-REGISTRY-001`;
- `PROC-PROCESS-INTERMEDIATE-STATE-REGISTRY-001`;
- `PROC-PROCESS-FINAL-STATE-REGISTRY-001`.

`PROC-PROCESS-TRANSITION-REGISTRY-001` conserva la autoridad del grafo normal y su reconciliación.

Estas materializaciones pertenecen a la fundación `PRE_E5_FOUNDATION`.

No publica el subpath `@vento/contracts/processes`, no modifica la versión de `@vento/contracts`, no crea una release, tag o publicación en registry y no adopta consumidores.

## Identidad de procesos vigente

El conjunto materializado contiene exactamente 69 identidades canónicas:

- `VPROC-0001` a `VPROC-0069`;
- 69 estados de registro `CANONICAL`;
- 0 `MERGED_ALIAS`;
- 0 `SPLIT_PARENT`;
- 0 `RETIRED`;
- 0 `VOID`.

`VPROC-0070` es únicamente el siguiente identificador disponible y no pertenece a `ProcessId`.

`VPROC-0000` es inválido.

La superficie de identidad de proceso expone internamente:

- `PROCESS_ID_PATTERN_SOURCE`;
- `PROCESS_ID_PATTERN`;
- `PROCESS_IDS`;
- `ProcessId`;
- `PROCESS_ID_REGISTRY_METADATA`;
- `ProcessIdRegistryMetadata`;
- `isProcessIdFormat()`;
- `isProcessId()`.

`ProcessId` se deriva de la misma colección literal `PROCESS_IDS`; no existe una segunda lista manual.

## Estados principales normales

`SHELL-CON-010::GLOBAL` materializa exactamente **592** identidades `ProcessStateId`:

- **69** `INITIAL`;
- **454** `INTERMEDIATE`;
- **69** `FINAL_NORMAL`.

Cada identidad usa la forma:

`VPROC-####.<STATE_CODE>`

El patrón sintáctico es:

`^VPROC-[0-9]{4}\.[A-Z][A-Z0-9_]*$`

Cumplir el patrón no demuestra pertenencia. Una entrada solo se reconoce como `ProcessStateId` si además existe en `PROCESS_STATE_IDS`.

La pertenencia también queda ligada al proceso propietario: un estado reconocido para `VPROC-0001` no puede reutilizarse como estado de `VPROC-0002`.

## Clasificación de estados

`ProcessStateKind` contiene únicamente:

- `INITIAL`;
- `INTERMEDIATE`;
- `FINAL_NORMAL`.

Los 454 estados intermedios conservan las diez fases semánticas aprobadas:

- `VALIDACION`: 29;
- `ANALISIS`: 44;
- `REVISION`: 36;
- `APROBACION`: 44;
- `PREPARACION`: 69;
- `EJECUCION`: 72;
- `HANDOFF`: 65;
- `VERIFICACION`: 35;
- `RECONCILIACION`: 34;
- `ACTIVO`: 26.

Los 69 finales normales conservan los ocho tipos terminales aprobados:

- `CERRADO`: 28;
- `RECONCILIADO`: 21;
- `LIBERADO`: 4;
- `CUMPLIDO`: 4;
- `VERIFICADO`: 6;
- `LIQUIDADO`: 2;
- `EVALUADO`: 3;
- `FORMALIZADO`: 1.

Las fases y los tipos terminales son clasificación semántica; no crean estados adicionales.

## Superficie interna de estados

Los artefactos bajo `generated/states/` exponen internamente:

- `PROCESS_STATE_ID_PATTERN_SOURCE`;
- `PROCESS_STATE_ID_PATTERN`;
- `PROCESS_STATE_KINDS`;
- `PROCESS_INTERMEDIATE_PHASES`;
- `PROCESS_FINAL_TYPES`;
- `PROCESS_STATE_IDS`;
- `ProcessStateId`;
- `PROCESS_STATE_DEFINITIONS`;
- `PROCESS_STATE_REGISTRY_METADATA`;
- `isProcessStateIdFormat()`;
- `isProcessStateId()`;
- `isProcessStateForProcess()`;
- `getProcessStateDefinition()`;
- `getProcessIdForState()`;
- `getProcessStateCode()`.

`ProcessStateId` se deriva de `PROCESS_STATE_IDS`.

`PROCESS_STATE_DEFINITIONS` es una proyección generada de los registros propietarios y no sustituye su autoridad semántica. Permite resolver de forma determinista la identidad completa, `ProcessId`, `STATE_CODE`, clase y metadata aprobada.

## Separación de conceptos

Las **590** transiciones normales reconciliadas por `PROC-PROCESS-TRANSITION-REGISTRY-001` no pertenecen a `ProcessStateId`.

Tampoco pertenecen a `ProcessStateId`:

- instancias de proceso;
- transiciones;
- pasos;
- pantallas;
- acciones;
- eventos;
- comandos;
- condiciones transversales;
- errores;
- las acciones excepcionales de `PROC-CAT-013`;
- las acciones de cancelación, anulación, reversión, compensación y corrección de `PROC-CAT-014`.

Una condición transversal no reemplaza la posición principal normal de una instancia.

## Validación de entradas externas

Una entrada externa se valida en orden cerrado:

1. forma sintáctica;
2. `ProcessId` vigente;
3. pertenencia de la identidad plena a `PROCESS_STATE_IDS`;
4. correspondencia entre el prefijo del estado y el proceso de la instancia.

Un código desnudo como `UNDER_REVIEW` no es `ProcessStateId`.

Un valor con sintaxis válida pero no publicado para su proceso se rechaza.

Un estado legacy ambiguo no se convierte automáticamente mediante heurísticas.

## Generación

La identidad de procesos se regenera determinísticamente desde:

- `PROC-CAT-003`, que contiene `PROC-CANONICAL-ID-REGISTRY-001`;
- `PROC-CAT-020`, que reconcilia las 69 identidades como `CANONICAL`;
- `SHELL-CON-009`.

Los estados se regeneran determinísticamente desde:

- `PROC-CAT-009`, que contiene `PROC-PROCESS-INITIAL-STATE-REGISTRY-001`;
- `PROC-CAT-010`, que contiene `PROC-PROCESS-INTERMEDIATE-STATE-REGISTRY-001`;
- `PROC-CAT-011`, que contiene `PROC-PROCESS-FINAL-STATE-REGISTRY-001`;
- `PROC-CAT-012`, que contiene `PROC-PROCESS-TRANSITION-REGISTRY-001`;
- `SHELL-CON-010`, que reconcilia la matriz de 592 identidades.

Los archivos generados no se editan para cambiar significado.

La materialización de estados usa un directorio `generated/states/` independiente para no convertir el `generated/index.ts` creado por `SHELL-CON-009` en una segunda superficie mutable de identidad de proceso.

## Límites

Estas instancias no materializan:

- instancias de proceso;
- grafos o motores de transición;
- acciones excepcionales;
- acciones CCR;
- pasos;
- pantallas, reservadas a `SHELL-CON-011`;
- eventos, comandos o auditorías;
- aliases legacy como identidades públicas;
- lógica empresarial;
- persistencia o Supabase;
- autorización;
- consumidores;
- exports públicos;
- publicación del package;
- registry, tags o releases.

Reconocer un `ProcessId` o un `ProcessStateId` no demuestra implementación, disponibilidad, autorización ni existencia de una instancia activa.
