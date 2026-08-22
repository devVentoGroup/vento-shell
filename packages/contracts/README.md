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

Esta materialización no añade `exports` públicos, no modifica la versión de `@vento/contracts`, no publica el subpath, no adopta consumidores y no toca Supabase. La continuidad histórica mantiene `SHELL-CON-011` como la responsabilidad separada de identidad de pantallas, materializada en `packages/contracts/screens`.

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

Esta materialización no añade `exports` públicos, no modifica la versión de `@vento/contracts`, no publica el subpath, no adopta consumidores, no concede autorización y no toca Supabase. `SHELL-CON-013` conserva la responsabilidad separada de identidad de eventos empresariales, materializada en el módulo hermano `packages/contracts/events`.

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

Esta materialización no añade `exports` públicos, no modifica la versión de `@vento/contracts` y no toca Supabase. `SHELL-CON-015` materializa separadamente el contrato estático de ítems de trabajo en el módulo hermano `packages/contracts/work-items`.

## Módulo de ítems de trabajo

`SHELL-CON-015::GLOBAL` materializa internamente `packages/contracts/work-items` como proyección estática del contrato lógico `@vento/contracts/work-items`.

La superficie contiene exactamente 29 campos contractuales, 8 clases de ítem de trabajo, 16 estados conceptuales, 7 estados de readiness y 6 niveles de prioridad. No contiene instancias runtime ni un catálogo de obligaciones actuales.

`work_item_id` permanece como referencia opaca: esta materialización no define sintaxis, patrón, longitud, serialización ni pertenencia estática. La identidad de proceso, estado, acción, evento y handoff continúa en sus autoridades compartidas existentes.

La materialización reutiliza `AppCode`, `ProcessId`, `ProcessStateId`, `FunctionalActionId`, `BusinessEventId` y `ApplicationHandoffRelation` cuando corresponda, sin copiar sus catálogos ni transportar autoridad.

Esta materialización no añade `exports` públicos, no modifica la versión de `@vento/contracts`, no implementa claims, leases, prioridad runtime, scheduler, workflow engine, persistencia, colas, APIs, navegación, UI, autorización ni Supabase. `SHELL-CON-016` materializa separadamente la proyección estática de propiedad funcional en el módulo hermano `packages/contracts/ownership`.


## Módulo de propiedad funcional

`SHELL-CON-016::GLOBAL` materializa internamente `packages/contracts/ownership` como proyección estática del contrato lógico `@vento/contracts/ownership`.

La superficie adopta exactamente 69 asignaciones de propietaria de proceso desde `PROC-CAT-005`, conserva el universo de 10 `AppCode` y distingue que 9 `AppCode` están efectivamente usados como propietaria de proceso en el corte vigente porque `shell` tiene 0 asignaciones.

Las 217 decisiones de fuente objetivo de `CAP-MAP-008` se conservan mediante su modelo canónico familia más excepción. El corte comprende 18 familias; el módulo materializa 18 proyecciones base de familia y los 5 estados de fuente objetivo, pero no fabrica una segunda tabla editable con 217 filas ni crea un `ownership_id`.

La propiedad funcional permanece separada de autorización, actor, participación, consumo, repositorio, Supabase, pantalla, navegación, evento, handoff e ítem de trabajo. Las representaciones `REFERENCE`, `PROJECTION`, `CONTROLLED_CACHE`, `DERIVED_RESULT` y `EVIDENCE_COPY` no adquieren autoridad sobre el original por su sola existencia.

El caso `public.employee_shifts` se conserva como deuda AS-IS preexistente documentada por `CAP-MAP-013`: VISO y ANIMA pueden editar actualmente, mientras la frontera objetivo mantiene a VISO como propietaria de publicación/corrección y a ANIMA como consumidora. Esta instancia no remedia ese conflicto.

La materialización no añade `exports` públicos, no modifica la versión de `@vento/contracts`, no reasigna propiedad, no implementa escritura cross-app, persistencia, autorización, consumidores, APIs, UI, Supabase, RLS, migraciones ni datos. `SHELL-CON-017` materializa separadamente el contrato de principal técnico de integración en el módulo hermano `packages/contracts/integrations`.

## Módulo de integraciones externas

`SHELL-CON-017::GLOBAL` materializa internamente `packages/contracts/integrations` como contrato estático de principal técnico para la semántica lógica `@vento/contracts/integrations`.

La superficie conserva `IntegrationPrincipalId`, `IntegrationPrincipal` e `IntegrationPrincipalRef` sin definir formato serial físico, parser, cast ni registro runtime. Adopta por referencia las 21 decisiones de `INT-EXT-002`: 21 `ESPECIFICADO`, 11 `PENDIENTE_DE_EVIDENCIA`, 10 `NO_APLICA` y 0 valores físicos de `IntegrationPrincipalId`.

`SHELL-CON-018::GLOBAL` amplía el mismo módulo con `ExternalCredentialId` y `ExternalCredentialRef` como referencia contractual no sensible de credencial externa. La referencia conserva separación frente al valor autenticador, principal técnico, sistema externo, cuenta de proveedor, superficie y ambiente; no contiene ni resuelve secretos y no concede autoridad empresarial.

La cobertura de `SHELL-CON-018` conserva exactamente 21 decisiones de aplicabilidad: 9 `PENDIENTE_DE_EVIDENCIA`, 2 `NO_APLICA` y 10 `NO_APLICA_ACTUAL`. Se crean 0 valores físicos de `ExternalCredentialId`, 0 referencias persistidas y 0 secretos.

`SHELL-CON-019::GLOBAL` amplía el módulo con `ExternalReceivedEvent<TNormalizedAssertion>` como contrato estático para una afirmación externa recibida antes de cualquier efecto empresarial. Conserva identidad del sistema, referencias opcionales a `IntegrationPrincipalId` y `ExternalCredentialId`, ambiente, versiones, contrato de entrada, transporte, `external_event_id`, `receipt_id`, temporalidad, autenticidad referenciada, evidencia protegida, huella, afirmación normalizada y referencias de mapping, idempotencia, correlación y propietario.

El símbolo exportado interno `ExternalReceivedEvent` se materializa mediante la forma genérica `ExternalReceivedEvent<TNormalizedAssertion>`. La autoridad semántica relacionada permanece en `INT-EXT-009..017`; `INT-DB-002` conserva la persistencia física posterior de referencias de credenciales sin secretos.

La recepción externa no es un hecho empresarial, el proveedor no se convierte en productor interno y autenticidad, receipt, callback, webhook o `2xx` no confirman por sí solos el efecto de dominio. El payload original no se incrusta por defecto y `normalized_assertion` permanece tipada, validada y minimizada.

La cobertura de `SHELL-CON-019` conserva 21 decisiones: 2 `APLICA_EVENTO_INBOUND_ACREDITADO` — Wompi para webhook de resultado de pago y RevenueCat para webhook de entitlement / suscripción — y 19 identidades sin evento externo recibido acreditado en el corte. Resumen literal de cobertura: 19 sin evento externo recibido acreditado. Los estados físicos quedan 2 `DEFINIDO_NO_MATERIALIZADO`, 9 `NO_APLICA`, 8 `NO_APLICA_ACTUAL` y 2 `BLOQUEADO`.

`SHELL-CON-020::GLOBAL` amplía el mismo módulo con `CanonicalSaleId` y `CanonicalSale<TSaleLine>` como representación estática compartida de una venta individual. La forma materializa 22 campos de nivel superior y 6 componentes monetarios dentro de `monetary_snapshot`, mantiene `TSaleLine` abstracto y exige al menos una línea mediante una colección no vacía sin adelantar la identidad ni los campos de línea de `SHELL-CON-021`.

La semántica empresarial permanece en `INT-POS-005` e `INT-SALES-001`: una venta histórica Makos conserva Makos como fuente aunque se reciba o almacene después en PULSO, mientras PULSO solo es fuente de una nueva venta cuando existe autoridad aprobada. `source_system`, `source_sale_id`, `source_revision`, `CanonicalSaleId`, `occurred_at` y `recorded_at` permanecen conceptos separados.

La venta canónica permanece distinta de pedido, pago, caja, documento fiscal, movimiento de inventario, fidelización, hecho económico, entrega, evento de integración y payload de proveedor. Una recepción `ExternalReceivedEvent<TNormalizedAssertion>` puede aportar procedencia, pero no se convierte en venta únicamente por autenticidad, receipt o transporte.

La materialización crea 0 ventas operativas, 0 persistencia, 0 eventos empresariales emitidos, 0 consumidores migrados, 0 efectos downstream, 0 secretos y 0 cambios Supabase. No añade `exports` públicos, no modifica la versión de `@vento/contracts` y no publica el subpath.

Las cuatro materializaciones `SHELL-CON-017::GLOBAL` a `SHELL-CON-020::GLOBAL` son fundaciones estáticas `PRE_E5_FOUNDATION`. `SHELL-CON-021` conserva la identidad y forma compartida de línea de venta; `SHELL-CON-022`, `SHELL-CON-023` y `SHELL-CON-024` conservan mapping, idempotencia/conciliación y rechazo/cuarentena compartidos.
