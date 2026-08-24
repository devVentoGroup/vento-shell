# @vento/ui-web

Raiz privada de autoria para la implementacion visual web compartida de Vento OS.

## Estado

`PRE_E5_FOUNDATION`

`SHELL-UI-001::GLOBAL` materializo la identidad fisica del workspace `@vento/ui-web` autorizada por la reconciliacion `GLOBAL_ENABLE_ONCE` / `PRE_E5_FOUNDATION`.

`SHELL-UI-002::GLOBAL` materializo internamente `Alert` y sus estilos de componente bajo el contrato aprobado de `SHELL-UI-002`.

`SHELL-UI-003::GLOBAL` materializa internamente `Button` y sus estilos de componente bajo el contrato aprobado de `SHELL-UI-003`, sin publicar todavia una API npm, una version, un entrypoint CSS ni una adopcion por consumidores.

`SHELL-UI-004::GLOBAL` materializa internamente `Card` y sus estilos de componente bajo el contrato aprobado de `SHELL-UI-004`, sin publicar todavia una API npm, una version, un entrypoint CSS ni una adopcion por consumidores.

`SHELL-UI-005::GLOBAL` materializa internamente `EmptyState` y sus estilos de componente bajo el contrato aprobado de `SHELL-UI-005`, sin publicar todavia una API npm, una version, un entrypoint CSS ni una adopcion por consumidores.

`SHELL-UI-006::GLOBAL` materializa internamente `ContextIndicator` y sus estilos de componente bajo el contrato aprobado de `SHELL-UI-006`, sin resolver contexto, publicar una API npm, una version, un entrypoint CSS ni migrar consumidores.

`SHELL-UI-007::GLOBAL` materializa internamente `SiteSelector` y sus estilos de componente bajo el contrato aprobado de `SHELL-UI-007`, sin resolver contexto, persistir sede, consultar red, publicar una API npm ni migrar consumidores.

## Responsabilidad canonica

La raiz contiene implementacion visual web compartida aprobada por sus tareas propietarias.

Fronteras vinculantes:

- contratos estaticos y catalogos autoritativos permanecen en `@vento/contracts`;
- contexto y autorizacion runtime permanecen en `@vento/os-context`;
- acceso compartido a datos permanece en `@vento/supabase`;
- `@vento/ui-web` no consulta Supabase ni evalua permisos;
- la logica empresarial y la composicion de proceso permanecen en cada aplicacion;
- React Native y Expo quedan fuera de esta raiz web;
- visibilidad, enabled o disabled en UI nunca sustituyen autorizacion de servidor.

## Superficie fisica actual

- `package.json` privado de workspace.
- Este `README.md`.
- `src/Alert.tsx` como implementacion interna de `Alert`.
- `src/alert.css` como estilos internos de `Alert`.
- `scripts/validate-alert.mjs` como validador fisico de `SHELL-UI-002::GLOBAL`.
- `src/Button.tsx` como implementacion interna de `Button`.
- `src/button.css` como estilos internos de `Button`.
- `scripts/validate-button.mjs` como validador fisico de `SHELL-UI-003::GLOBAL`.
- `src/Card.tsx` como implementacion interna de `Card`.
- `src/card.css` como estilos internos de `Card`.
- `scripts/validate-card.mjs` como validador fisico de `SHELL-UI-004::GLOBAL`.
- `src/EmptyState.tsx` como implementacion interna de `EmptyState`.
- `src/empty-state.css` como estilos internos de `EmptyState`.
- `scripts/validate-empty-state.mjs` como validador fisico de `SHELL-UI-005::GLOBAL`.
- `src/ContextIndicator.tsx` como implementacion interna de `ContextIndicator`.
- `src/context-indicator.css` como estilos internos de `ContextIndicator`.
- `scripts/validate-context-indicator.mjs` como validador fisico de `SHELL-UI-006::GLOBAL`.
- `src/SiteSelector.tsx` como implementacion interna de `SiteSelector`.
- `src/site-selector.css` como estilos internos de `SiteSelector`.
- `scripts/validate-site-selector.mjs` como validador fisico de `SHELL-UI-007::GLOBAL`.
- Sin `version` npm.
- Sin `main`, `types` o `exports` en el manifest del package.
- Sin `dependencies`, `devDependencies` o `peerDependencies` propias.
- Sin `scripts` declarados en el manifest del package.
- Sin entrypoint CSS publico o distribuible.
- Sin publicacion, registry, tags o releases.
- Sin consumidores migrados.

## Alert

`Alert` representa un mensaje o estado ya determinado por su propietario funcional. No determina el hecho empresarial, no autoriza, no consulta datos y no normaliza errores tecnicos.

Contrato interno materializado:

- variantes `neutral`, `success`, `warning` y `danger`;
- `neutral` por defecto;
- contenido visible `children` requerido;
- `icon` opcional;
- atributos HTML y ARIA transferibles al contenedor;
- `className` adicional permitido;
- root no interactivo basado en `div`;
- sin `role="alert"` ni `aria-live` impuestos por defecto;
- sin movimiento de foco por defecto;
- sin estado React obligatorio, efectos, timers, red, router, Supabase, sesion o autorizacion;
- compatible con SSR y con composicion desde componentes cliente.

Los nombres `.ui-alert*` usados por la implementacion interna no constituyen un contrato CSS publico del package mientras no exista un entrypoint CSS publicado.

La implementacion normaliza las variantes futuras a `warning` y `danger`. Las variantes legacy `.ui-alert--warn` y `.ui-alert--error` permanecen intactas en el template historico y en consumidores hasta su migracion propietaria; no se copian como variantes nuevas de la API.

## Button

`Button` representa una accion e interaccion entregada por el consumidor. No decide que acciones existen, quien puede ejecutarlas, que operacion empresarial corresponde ni si una mutacion fue confirmada.

Contrato interno materializado:

- variantes `primary`, `secondary`, `outline`, `ghost` y `danger`;
- `primary` por defecto;
- tamanos `sm`, `md` y `lg`;
- `md` por defecto;
- elemento HTML nativo `button`;
- `type="button"` por defecto, con `submit` y `reset` transferibles cuando el consumidor los declara;
- atributos nativos compatibles, eventos, `aria-*`, `data-*`, `className` y `style` transferibles;
- estado `disabled` basado en semantica nativa;
- `loading` deshabilita activacion repetida equivalente y expone `aria-busy="true"`;
- `loading` conserva `children` y por tanto la identidad visible y accesible de la accion;
- indicador visual de carga decorativo y compatible con `prefers-reduced-motion`;
- sin literal global `Cargando...` ni `loadingLabel` impuesto;
- sin prop especifica `fullWidth`;
- sin variante `brand` ni `success`;
- sin props especificas de icono;
- sin polimorfismo Link, `href`, router o navegacion;
- sin estado React obligatorio, efectos, timers, red, Supabase, sesion o autorizacion;
- compatible con SSR y con composicion desde componentes cliente.

Los nombres `.ui-button*` usados por la implementacion interna no constituyen un contrato CSS publico del package mientras no exista un entrypoint CSS publicado.

La variante `danger` expresa riesgo visual solamente. No sustituye confirmacion, step-up, permiso, validacion de recurso, idempotencia, receipt ni auditoria. El patron compuesto de confirmaciones sensibles permanece reservado a `SHELL-UI-014`.

La ocupacion de ancho permanece responsabilidad de layout o composicion. La implementacion legacy local con `fullWidth`, el literal `Cargando...` y el boundary `use client`, asi como la variante historica `brand` de `vento/standard`, permanecen intactos hasta su migracion propietaria; no se copian como contrato nuevo.

## Card

`Card` organiza contenido dentro de una superficie visual compartida. No determina estados empresariales, no concede autoridad, no ejecuta operaciones y no crea navegacion o activacion por si misma.

Contrato interno materializado:

- variantes `surface`, `soft` y `raised`;
- `surface` por defecto;
- paddings `sm`, `md` y `lg`;
- `md` por defecto;
- elemento HTML nativo no interactivo `div`;
- `children` opcional para permitir una Card vacia sin fallback inventado;
- atributos compatibles de `HTMLDivElement`, eventos, `aria-*`, `data-*`, `className` y `style` transferibles;
- sin `role`, `tabIndex`, nombre accesible, foco o keyboard handlers impuestos por defecto;
- sin props `interactive`, `clickable`, `selected`, `disabled` o `loading`;
- sin variantes empresariales `success`, `warning`, `danger` o `brand`;
- sin `href`, `to`, router, Link, `as` o `asChild`;
- sin `CardHeader`, `CardTitle`, `CardContent`, `CardFooter` ni `CardAction` publicos;
- sin estado React obligatorio, efectos, timers, red, Supabase, sesion o autorizacion;
- compatible con SSR y con composicion desde componentes cliente.

Los nombres `.ui-card*` usados por la implementacion interna no constituyen un contrato CSS publico del package mientras no exista un entrypoint CSS publicado. Los valores fisicos actuales de padding, radio, superficie y sombra son detalles internos de esta materializacion y no se convierten en API publica. El candidato legacy local `src/components/ui/Card.tsx` y su barrel local permanecen intactos hasta una migracion controlada.

`raised` expresa mayor separacion visual, no interactividad ni prioridad empresarial. `soft` expresa una superficie secundaria, no estado disabled ni pendiente. El `backdrop-blur-xl` historico no se perpetua como contrato base y la sombra permanente de la familia `vento/standard` no se extiende a todas las Cards; la apariencia historica elevada se reconcilia conceptualmente bajo `raised` para una migracion posterior. El padding fijo `p-6` historico no crea una cuarta densidad y su paridad queda diferida a la migracion propietaria.

Una tarjeta completamente activable debe componer semantica nativa de enlace o boton en su superficie propietaria. La Card base no convierte un `div onClick` en el patron canonico de accion. Los componentes `*Card` de dominio no se absorben por coincidencia nominal; pueden adoptar la primitiva internamente durante su migracion sin dejar de pertenecer a su dominio.

## EmptyState

`EmptyState` presenta una ausencia confirmada dentro de un alcance ya resuelto. No determina por que no existe contenido, no consulta datos, no evalua permisos y no transforma un resultado desconocido en una afirmacion de ausencia.

Contrato interno materializado:

- `title` requerido como contenido principal visible y significativo aportado por el consumidor;
- `description` opcional;
- `icon` opcional y sin icono global por defecto;
- `action` opcional como nodo compuesto por el consumidor;
- elemento HTML nativo no interactivo `div`;
- atributos compatibles de `HTMLDivElement`, `aria-*`, `data-*`, `className` y `style` transferibles; el atributo HTML nativo `title` queda reservado por la prop principal `title`;
- sin `role="alert"`, `aria-live`, `tabIndex`, captura de foco o movimiento de foco impuestos por defecto;
- sin `variant`, `kind`, `status`, `size` ni `density`;
- sin `cta`, `href`, `to` ni router propios;
- sin Card interna obligatoria y sin dependencia obligatoria de Alert o Button;
- sin Supabase, sesion, permisos, contexto, red, timers ni persistencia;
- sin estado React obligatorio y compatible con SSR y composicion desde componentes cliente.

El icono se trata como apoyo visual decorativo por defecto y queda fuera del nombre accesible de la primitiva; el significado debe seguir siendo comprensible mediante `title` y, cuando aplique, `description`. Una accion puede componer un `Button` o un enlace semantico del consumidor sin convertir `EmptyState` en Button, Link o router.

La representacion visual interna usa una columna centrada de baja jerarquia, reflow, texto largo y el token existente `--ui-muted` para contenido secundario. No introduce superficie, borde, sombra, radio, altura minima ni ancho fijo propios de Card. Los valores fisicos actuales son detalles internos de esta materializacion y no se convierten en API publica.

### Frontera semantica de vacio

El vacio base solo corresponde cuando existe consulta o inicializacion exitosa, el alcance ya resuelto es conocido y la capa propietaria ha confirmado ausencia para ese alcance.

Un vacio filtrado conserva los filtros activos o su alcance comprensible en la superficie propietaria y no afirma inexistencia global.

Un error de carga no es EmptyState. `EmptyState` no representa carga o `loading`, resultado parcial, resultado desconocido, timeout sin conciliacion, cache stale sin certeza suficiente ni sincronizacion pendiente.

Una denegacion de permiso no es una coleccion vacia. El masking no puede usar un mensaje vacio para revelar existencia o conteo de elementos ocultos.

La ausencia de seleccion puede representarse como EmptyState cuando es una seleccion legitima dentro de una pantalla ya resuelta; no sustituye contexto operativo obligatorio como sede, area, turno, check-in, actor o permiso requeridos.

Una cola despejada solo se presenta como tal cuando la consulta propietaria esta completa y suficientemente fresca. La ausencia de trabajo para el actor no implica ausencia global y `EmptyState` nunca crea ni autoasigna trabajo.

Una accion de primer registro solo puede componerse cuando existe una accion real y el actor elegible ya fue determinado por el propietario funcional. El componente no fabrica autoridad ni ofrece CTAs automaticos.

### Reconciliacion legacy y consumidores

Las clases `.ui-empty-state` y `.ui-empty` permanecen legacy y no se convierten en selectores publicos del package. Esta materializacion utiliza una clase raiz interna distinta y deja sin migrar consumidores.

`.ui-empty-state` requiere clasificacion semantica antes de cualquier adopcion. `.ui-empty` puede ser candidato title-only cuando realmente represente ausencia y la region no necesite composicion adicional.

Los usos legacy que en realidad representen error requieren reclasificacion. Los usos que representen permiso o contexto tambien requieren reclasificacion antes de migrar.

La evidencia de ORIGO proveedores conserva la diferencia entre vacio base y vacio filtrado. La evidencia de ORIGO ordenes exige distinguir filtros activos antes de afirmar ausencia global. FOGO demuestra que un estado title-only es valido sin icono obligatorio; VISO confirma que superficies administrativas densas pueden conservar una representacion compacta y separar error de vacio.

La adopcion, paridad por consumidor, compatibilidad y rollback independiente permanecen en `SHELL-MIG-*` y `SHELL-CI-*`. La paridad por consumidor debe demostrarse antes de retiro legacy. Consumidores migrados: 0.

## ContextIndicator

`ContextIndicator` representa una proyeccion humana, compacta y accesible de contexto efectivo o alcance aplicable ya resuelto por una capa propietaria. No resuelve contexto, no crea autoridad, no modifica sede, area, turno o rol y no habilita operaciones empresariales.

Contrato interno materializado:

- `state` obligatorio con los estados `resolving`, `active`, `changing`, `stale`, `invalid` y `unavailable`;
- `stateLabel` obligatorio como texto humano visible;
- `items` obligatorio como coleccion readonly de pares `label` y `value`;
- orden de `items` preservado exactamente como lo entrega el consumidor;
- cero items permitido sin inventar contexto ni copy de fallback;
- raiz HTML `div` no interactiva;
- dimensiones representadas mediante estructura descriptiva `dl`, `dt` y `dd`;
- atributos compatibles de `HTMLDivElement`, `aria-*`, `data-*`, `className` y `style` transferibles;
- sin `children` libre, `variant`, `tone`, enum visual de dimensiones ni API obligatoria de iconos;
- sin `role="status"`, `aria-live`, `tabIndex`, foco automatico o movimiento de foco impuestos por defecto;
- sin estado React obligatorio, efectos, timers, red, router, storage, Supabase, sesion o autorizacion;
- compatible con SSR y composicion desde componentes cliente.

El significado del estado permanece en `stateLabel` y no depende solo de color. Los estilos internos usan tokens visuales existentes y conservan reflow, zoom, valores largos y disposicion de una o varias columnas sin exigir scroll horizontal ordinario.

### Frontera de autoridad y frescura

`ContextIndicator` recibe decisiones de presentacion ya resueltas. No recibe ni interpreta `EffectiveContext`, `AccessContext` o `SimulationContext`, no evalua permisos y no deriva sede, area, rol, turno, check-in, actor, dispositivo o territorio desde URL, query parameters, storage, nombre de aplicacion o primera opcion disponible.

`active` expresa que la capa propietaria declaro vigente la proyeccion; no significa permiso concedido. `stale` no prolonga autoridad. `invalid` no diagnostica la causa. `unavailable` no se transforma en EmptyState.

Durante `changing`, una seleccion solicitada no equivale a contexto nuevo confirmado. El destino solicitado no se presenta como activo hasta que la capa propietaria entregue la proyeccion confirmada.

### Contexto operativo y alcance administrativo

Las etiquetas aportadas por el consumidor conservan las diferencias entre sede activa, filtro administrativo, area activa, rol base, rol operativo, turno, check-in, actor, dispositivo, estacion y territorio del recurso.

El componente no convierte un filtro administrativo en contexto operativo, no convierte un turno programado en turno vigente y no convierte un dispositivo compartido en actor humano.

### Composicion, simulacion y diagnostico

`Alert` y `ContextIndicator` conservan responsabilidades distintas: el indicador resume contexto y `Alert` comunica mensajes que la composicion propietaria determine.

Los selectores de sede y area permanecen separados. `ContextIndicator` puede coexistir con `SiteSelector`, `AreaSelector` y `SimulatedRoleNotice`, pero no lo absorbe ni implementa sus cambios de autoridad.

La simulacion material permanece perceptible mediante la composicion propietaria. El diagnostico detallado de contexto tambien permanece fuera del indicador.

### Privacidad, legacy y consumidores

La minimizacion ocurre antes de renderizar. El indicador recibe lenguaje humano necesario para la tarea y no utiliza datos tecnicos o privados como UUID, correo, telefono, documento, token, identificador de sesion, nombres de tablas, RPC o permisos como sustituto del contenido humano.

Las implementaciones `VentoChrome`, chips, menus, selectores y presentaciones de contexto actuales permanecen legacy hasta su migracion propietaria. No se copian firmas locales como API comun.

La adopcion permanece en `SHELL-MIG-*` y `SHELL-CI-*`. Debe demostrarse paridad por consumidor antes de retiro legacy. Consumidores migrados: 0.

## SiteSelector

`SiteSelector` presenta candidatas de sede ya preparadas por la capa propietaria y emite una solicitud de cambio. El componente no resuelve contexto, no confirma la transicion y no produce autoridad.

Contrato interno materializado:

- frontera cliente aislada mediante `use client` exclusivamente para capturar la interaccion del control;
- `label` obligatorio y visible;
- `confirmedSiteId` obligatorio y nullable como sede confirmada entregada por la capa propietaria;
- `requestedSiteId` opcional como destino solicitado todavia no confirmado;
- `options` readonly de `SiteSelectorOption` con `id` estable y `label` humano;
- `onRequestChange(siteId)` como emision de intencion, no como receipt ni confirmacion;
- `pending`, `pendingLabel`, `disabled` y `placeholderLabel` como estado de presentacion e interaccion;
- control nativo `select` asociado a un `label`, con opciones nativas y orden preservado;
- placeholder no accionable cuando la composicion aporta `placeholderLabel` o no existe una opcion seleccionable confirmada;
- sin `defaultSiteId`, `primarySiteId`, `lastSiteId`, `activeSiteId`, `canSwitchRole`, `canOperate`, `permissionCode`, `role`, `siteCookie`, `queryParam`, `supabaseClient` ni `employeeId`;
- sin taxonomia publica `variant`, `tone`, `size`, `fullWidth`, `compact`, `kiosk`, `admin` u `operational`;
- sin combobox buscable, listeners globales, autofocus, navegacion o persistencia propios.

### Sede confirmada y solicitud pendiente

`confirmedSiteId` representa exclusivamente la sede confirmada recibida. `requestedSiteId` representa una solicitud en curso y solo puede ocupar el valor visual del control mientras `pending=true`; no sustituye `confirmedSiteId` como autoridad.

Durante una transicion, la composicion puede mantener `ContextIndicator state="changing"` mientras `SiteSelector` muestra la candidata solicitada y el texto de `pendingLabel`. La nueva sede solo se trata como confirmada cuando la capa propietaria vuelve a renderizar con el nuevo `confirmedSiteId`.

El selector no autoelige la primera opcion, no autoemite cuando existe una sola opcion, no inventa opciones cuando la lista esta vacia y no crea una opcion universal `Sin sede`. Una sede confirmada que no figure en `options` tampoco se sintetiza como opcion nueva.

### Autoridad, revalidacion y concurrencia

La presencia de una opcion solo significa que puede mostrarse como candidata. El servidor revalida elegibilidad, autoridad y estado fresco antes de la confirmacion. Despues de un cambio confirmado, la capa propietaria debe invalidar el contexto anterior y publicar la nueva proyeccion autoritativa.

La concurrencia puede volver obsoleta una lista de opciones entre render y solicitud. `SiteSelector` no mantiene cache autoritativo de elegibilidad, no reintenta por su cuenta y no transforma una seleccion offline en cambio confirmado. Mientras `pending=true`, el control impide solicitudes concurrentes o equivalentes desde la misma instancia.

### Fronteras de composicion

`SiteSelector` no es un filtro administrativo: un filtro administrativo limita una consulta y no cambia contexto operativo. Tampoco contiene `AreaSelector`; el selector de area permanece reservado a `SHELL-UI-008`. Simulacion, diagnostico, recuperacion, confirmaciones sensibles y AppShell conservan sus tareas propietarias.

El componente no consulta `@vento/supabase`, no abre cliente Supabase, no conoce `employee_settings`, no escribe `selected_site_id`, no lee ni escribe cookies o storage, no consume `site_id` desde query params, no usa router, no ejecuta RPC y no realiza llamadas de red. Las opciones visibles y la disponibilidad se preparan fuera del componente y nunca sustituyen enforcement de servidor.

### Legacy, migracion y rollback

El selector del template historico y las seis copias runtime observadas en NEXO, FOGO, ORIGO, VISO, PULSO y NUMERA permanecen legacy. Sus cookies, query params, escrituras cliente y gating local de roles no se copian a la API compartida.

La adopcion permanece en `SHELL-MIG-*` y `SHELL-CI-*`, por lotes reversibles con paridad y rollback antes de retirar cada copia legacy. Consumidores migrados: 0.

## Accesibilidad

`Alert` no impone una region viva universal. El consumidor aporta `role`, `aria-live`, `aria-atomic` u otros atributos ARIA cuando el escenario dinamico lo exige.

`Button` conserva semantica nativa, foco visible, estados `disabled` y `loading` perceptibles, identidad de accion durante carga, reflow de contenido y soporte de nombre accesible aportado por el consumidor para botones de solo icono. La semantica nativa no se reemplaza por `role="button"` sobre elementos no interactivos.

`Card` permanece fuera de la secuencia de tabulacion por defecto, no inventa roles ni foco, permite reflow de contenido de longitud variable y conserva la semantica de los elementos que el consumidor compone dentro de ella.

`EmptyState` conserva `title` visible, mantiene iconografia decorativa fuera del nombre accesible, no impone region viva, no entra por defecto a la secuencia de tabulacion y conserva la semantica nativa de cualquier accion compuesta por el consumidor.

`ContextIndicator` conserva estado textual, relacion semantica entre etiquetas y valores, orden de lectura, reflow y atributos ARIA compatibles sin imponer una live region, tabulacion, foco automatico o interaccion sobre la raiz.

`SiteSelector` conserva semantica nativa de `label`, `select` y `option`, teclado del navegador, foco visible, objetivo tactil, reflow y estado pendiente textual cuando la composicion aporta `pendingLabel`; no depende de hover ni mueve foco por una confirmacion ordinaria.

La certificacion de contraste, tecnologias de asistencia, paridad visual y comportamiento por consumidor permanece en los gates de package, UX y migracion aplicables antes de retiro legacy.

## Superficie publica diferida

Esta instancia no modifica el manifest de `@vento/ui-web` y no crea `exports`, `main`, `types`, version npm, peer dependencies, publicacion ni entrypoints CSS publicos. Los exports publicos permanecen diferidos.

La habilitacion de una superficie publica versionada, compatibilidad, publicacion, adopcion de consumidores, rollback y retiro legacy permanecen gobernados por las tareas `SHELL-PKG-*`, `SHELL-CI-*` y `SHELL-MIG-*` que correspondan. El retiro legacy exige evidencia de uso residual cero o migracion certificada antes de eliminar una copia existente.

## Continuidad reservada

`SHELL-UI-008` conserva la responsabilidad del selector compartido de area. `SHELL-UI-007::GLOBAL` no materializa `AreaSelector`, aviso especializado de rol simulado, diagnostico de contexto, AppShell, navegacion, migracion de consumidores ni patrones compuestos posteriores.

## Fuera de alcance

Esta instancia no modifica `package.json` raiz, `package-lock.json`, `packages/ui-web/package.json`, `src/components/ui`, `templates/app-shell-standard`, `packages/ui-web/src/Alert.tsx`, `packages/ui-web/src/alert.css`, `packages/ui-web/scripts/validate-alert.mjs`, `packages/ui-web/src/Button.tsx`, `packages/ui-web/src/button.css`, `packages/ui-web/scripts/validate-button.mjs`, `packages/ui-web/src/Card.tsx`, `packages/ui-web/src/card.css`, `packages/ui-web/scripts/validate-card.mjs`, `packages/ui-web/src/EmptyState.tsx`, `packages/ui-web/src/empty-state.css`, `packages/ui-web/scripts/validate-empty-state.mjs`, `packages/ui-web/src/ContextIndicator.tsx`, `packages/ui-web/src/context-indicator.css`, `packages/ui-web/scripts/validate-context-indicator.mjs`, `packages/contracts`, `packages/os-context`, `packages/supabase`, `ProfileMenu`, `VentoChrome`, aplicaciones consumidoras, cookies legacy, `employee_settings`, query params, rutas, navegacion, autenticacion, autorizacion, resolucion de contexto, roles, turnos, check-in, simulacion, SQL, migraciones, RLS, RPC, Storage, Realtime, Edge Functions, datos, secretos, configuracion remota, exports npm, versionado, publicacion, migracion de consumidores, retiro legacy, Supabase, `SHELL-UI-008` ni el registro 04A/TREQ.
