# @vento/contracts

Raíz contractual compartida de Vento OS.

## Estado

Esta materialización corresponde a `SHELL-CON-001::GLOBAL` y establece únicamente la raíz física reutilizable de `@vento/contracts`.

Es una fundación `PRE_E5_FOUNDATION`.

No constituye una release publicada, un tag, una publicación en registry ni una adopción por consumidores.

La versión `1.0.0-alpha.1` es metadata de prerelease para autoría local y no constituye la primera versión estable.

## Responsabilidad

`@vento/contracts` es la autoridad técnica estática para contratos compartidos versionados de Vento OS.

Puede alojar, cuando sus tareas propietarias sean materializadas:

- catálogos;
- schemas;
- códigos e identificadores;
- tipos derivados;
- manifiestos;
- hashes;
- metadata contractual;
- diagnósticos estáticos.

No ejecuta:

- autorización runtime;
- acceso a Supabase;
- red;
- sesiones;
- cookies;
- SSO;
- redirects;
- lógica empresarial;
- UI;
- secretos;
- migraciones;
- RLS;
- RPC;
- persistencia.

## Alcance de SHELL-CON-001

Esta instancia crea únicamente:

- la identidad física `@vento/contracts`;
- el workspace `packages/contracts`;
- la reserva física del módulo `authorization`.

No materializa las responsabilidades reservadas a `SHELL-CON-002` a `SHELL-CON-016`.

No publica exports públicos adicionales antes de que su tarea propietaria los materialice.

## Módulo de procesos

`SHELL-CON-009::GLOBAL` materializa internamente `packages/contracts/processes` como proyección estática de identidad de procesos para el subpath lógico `@vento/contracts/processes`.

La materialización contiene exactamente 69 identidades derivadas de `PROC-CANONICAL-ID-REGISTRY-001`, desde `VPROC-0001` hasta `VPROC-0069`, junto con validación de formato y pertenencia.

`SHELL-CON-010::GLOBAL` amplía el mismo módulo con exactamente 592 estados principales normales derivados de los registros `PROC-CAT-009`, `PROC-CAT-010` y `PROC-CAT-011`, reconciliados por `PROC-CAT-012`: 69 `INITIAL`, 454 `INTERMEDIATE` y 69 `FINAL_NORMAL`.

Los estados se materializan internamente bajo `packages/contracts/processes/generated/states/`; las 590 transiciones normales y las acciones excepcionales permanecen fuera de `ProcessStateId`.

El módulo de procesos no absorbe identificadores de pantallas. La identidad de pantalla se materializa en el módulo hermano `packages/contracts/screens`.

Esta materialización no añade `exports` públicos, no modifica la versión de `@vento/contracts`, no publica el subpath, no adopta consumidores y no toca Supabase.

## Módulo de pantallas

`SHELL-CON-011::GLOBAL` materializa internamente `packages/contracts/screens` como proyección estática de identidad de pantallas para el subpath lógico `@vento/contracts/screens`.

La materialización contiene exactamente 177 identidades derivadas de `SCREEN-CANONICAL-CATALOG-001`, desde `VSCREEN-0001` hasta `VSCREEN-0177`, junto con validación de sintaxis y pertenencia.

`VSCREEN-0178` permanece fuera de `SCREEN_IDS` como siguiente identidad no asignada en este corte. La aplicación, los procesos, los pasos, las rutas, los componentes y los permisos no forman parte de `ScreenId`.

La materialización reconcilia que `PROC-SCREEN-003` y `PROC-SCREEN-004` conservan las mismas 177 identidades, pero no incorpora sus vínculos a la superficie de identidad compartida.

Esta materialización no añade `exports` públicos, no modifica la versión de `@vento/contracts`, no publica el subpath, no adopta consumidores, no toca Supabase y no materializa acciones funcionales reservadas a `SHELL-CON-012`.

## Módulo de acciones funcionales

`SHELL-CON-012::GLOBAL` materializa internamente `packages/contracts/actions` como proyección estática de identidad de acciones funcionales para el subpath lógico `@vento/contracts/actions`.

La materialización contiene exactamente 885 identidades funcionales derivadas de `PROC-SCREEN-014` y `PROC-SCREEN-015`: 177 principales y 708 secundarias sobre las 177 pantallas vigentes.

Cada `ScreenId` aporta una identidad `::PRIMARY` y cuatro identidades `::SECONDARY:01..04` en el corte actual. `FunctionalActionId` distingue sintaxis de pertenencia y conserva la referencia determinista a su pantalla, clase, fuente documental y ordinal secundario cuando aplica.

Familias, efectos, clases secundarias, relaciones, disponibilidad, ubicación y confirmación continúan gobernados por E2; no se convierten en una segunda autoridad dentro del módulo de identidad.

Esta materialización no añade `exports` públicos, no modifica la versión de `@vento/contracts`, no publica el subpath, no adopta consumidores, no concede autorización y no toca Supabase. La identidad de eventos empresariales se materializa separadamente en el módulo hermano `packages/contracts/events`.

## Módulo de eventos empresariales

`SHELL-CON-013::GLOBAL` materializa internamente `packages/contracts/events` como proyección estática de identidad de eventos empresariales para el subpath lógico `@vento/contracts/events`.

La materialización contiene exactamente 395 definiciones normales derivadas de `PROC-CAT-017` sobre los 69 `ProcessId` vigentes. Conserva `BusinessEventId`, el `event_type` semántico versionado, la clase y la sensibilidad aprobadas, sin copiar el hecho fuente ni la descripción del hecho confirmado como nueva autoridad.

Las ocho familias condicionales se proyectan por separado como plantillas canónicas y permanecen fuera del inventario normal de 395. Sintaxis y pertenencia de `BusinessEventId` se validan de manera separada.

Esta materialización no añade `exports` públicos, no modifica la versión de `@vento/contracts`, no publica el subpath, no adopta productores o consumidores, no implementa infraestructura runtime de eventos y no toca Supabase. `SHELL-CON-014` materializa separadamente los traspasos entre aplicaciones en el módulo hermano `packages/contracts/handoffs`.

## Módulo de traspasos entre aplicaciones

`SHELL-CON-014::GLOBAL` materializa internamente `packages/contracts/handoffs` como proyección estática de las relaciones admitidas para el subpath lógico `@vento/contracts/handoffs`.

El corte vigente contiene exactamente 49 relaciones únicas por la tupla `ProcessId + owner_application + participant_application`: 27 directas y 22 condicionales, distribuidas sobre 8 procesos con modalidad `SOLICITUD_HANDOFF_Y_EVENTO`, con `viso` como única propietaria en este corte y 9 aplicaciones participantes.

Cada relación conserva `DIRECTA` o `CONDICIONAL`, `HANDOFF_PROJECTION` y `HANDOFF_REQUEST`. La existencia de una relación no concede autorización, no transfiere la propiedad del proceso y no obliga a ejecutar el handoff en toda instancia.

La materialización reutiliza `AppCode` y `ProcessId`; no crea un identificador serializado paralelo, no implementa el payload runtime de continuidad, no crea rutas o deep links, no implementa inbox/outbox, productores, consumidores ni escritura cruzada.

Esta materialización no añade `exports` públicos, no modifica la versión de `@vento/contracts`, no toca Supabase y no materializa tareas pendientes reservadas a `SHELL-CON-015`.
