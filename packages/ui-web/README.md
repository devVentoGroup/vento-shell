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

`SHELL-UI-008::GLOBAL` materializa internamente `AreaSelector` y sus estilos de componente bajo el contrato aprobado de `SHELL-UI-008`, sin resolver elegibilidad, autoridad, persistencia, red, publicar una API npm ni migrar consumidores.

`SHELL-UI-009::GLOBAL` materializa internamente `SimulatedRoleNotice` y sus estilos de componente bajo el contrato aprobado de `SHELL-UI-009`, como presentacion estatica de simulacion controlada por su propietario, sin resolver autoridad, lifecycle, persistencia, red, publicar una API npm ni migrar consumidores.

`SHELL-UI-010::GLOBAL` materializa internamente `AppShell` como marco interactivo de composicion y sus estilos de chrome bajo el contrato aprobado de `SHELL-UI-010`, con navegacion preparada externamente y disclosure local, sin resolver identidad, autoridad, contexto, datos, rutas empresariales, publicar una API npm ni migrar consumidores.

`SHELL-UI-011::GLOBAL` materializa internamente `TaskNavigation` como superficie server-safe de grupos y destinos orientados a trabajo bajo el contrato aprobado de `SHELL-UI-011`, con identidad semantica preparada externamente, cinco estados renderizables y composicion dentro de `AppShell.navigation`, sin resolver permisos, contexto, prioridad, router, datos, publicar una API npm ni migrar consumidores.

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
- `src/AreaSelector.tsx` como implementacion interna de `AreaSelector`.
- `src/area-selector.css` como estilos internos de `AreaSelector`.
- `scripts/validate-area-selector.mjs` como validador fisico de `SHELL-UI-008::GLOBAL`.
- `src/SimulatedRoleNotice.tsx` como implementacion interna de `SimulatedRoleNotice`.
- `src/simulated-role-notice.css` como estilos internos de `SimulatedRoleNotice`.
- `scripts/validate-simulated-role-notice.mjs` como validador fisico de `SHELL-UI-009::GLOBAL`.
- `src/AppShell.tsx` como implementacion interna de `AppShell`.
- `src/app-shell.css` como estilos internos del marco y disclosure responsive de `AppShell`.
- `scripts/validate-app-shell.mjs` como validador fisico de `SHELL-UI-010::GLOBAL`.
- `src/TaskNavigation.tsx` como implementacion interna de `TaskNavigation`.
- `src/task-navigation.css` como estilos internos de grupos, destinos y estados de `TaskNavigation`.
- `scripts/validate-task-navigation.mjs` como validador fisico de `SHELL-UI-011::GLOBAL`.
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

`SiteSelector` no es un filtro administrativo: un filtro administrativo limita una consulta y no cambia contexto operativo. Tampoco contiene `AreaSelector`; ambos selectores conservan contratos separados y su coordinacion pertenece a la capa propietaria. Simulacion, diagnostico, recuperacion, confirmaciones sensibles y AppShell conservan sus tareas propietarias.

El componente no consulta `@vento/supabase`, no abre cliente Supabase, no conoce `employee_settings`, no escribe `selected_site_id`, no lee ni escribe cookies o storage, no consume `site_id` desde query params, no usa router, no ejecuta RPC y no realiza llamadas de red. Las opciones visibles y la disponibilidad se preparan fuera del componente y nunca sustituyen enforcement de servidor.

### Legacy, migracion y rollback

El selector del template historico y las seis copias runtime observadas en NEXO, FOGO, ORIGO, VISO, PULSO y NUMERA permanecen legacy. Sus cookies, query params, escrituras cliente y gating local de roles no se copian a la API compartida.

La adopcion permanece en `SHELL-MIG-*` y `SHELL-CI-*`, por lotes reversibles con paridad y rollback antes de retirar cada copia legacy. Consumidores migrados: 0.

## AreaSelector

`AreaSelector` presenta candidatas de area ya preparadas por la capa propietaria y emite una solicitud de cambio. El componente no resuelve elegibilidad, no confirma la transicion, no persiste preferencias y no produce autoridad.

Contrato interno materializado:

- frontera cliente aislada mediante `use client` exclusivamente para capturar la interaccion del control;
- `label` obligatorio y visible;
- `confirmedAreaId` obligatorio y nullable como area confirmada entregada por la capa propietaria;
- `requestedAreaId` opcional y nullable como destino solicitado todavia no confirmado;
- `options` readonly de `AreaSelectorOption` con `id` estable y `label` humano;
- `onRequestChange(areaId)` como emision de intencion, no como receipt ni confirmacion;
- `pending`, `pendingLabel`, `disabled` y `placeholderLabel` como estado de presentacion e interaccion;
- control nativo `select` asociado a un `label`, con opciones nativas y orden preservado;
- placeholder no accionable cuando la composicion aporta `placeholderLabel` o no existe una opcion confirmada visible;
- sin `defaultAreaId`, `primaryAreaId`, `lastAreaId`, `preferredAreaId`, `deviceAreaId`, `firstEligibleAreaId`, `siteId`, `areaKind`, permisos, grants, scopes ni contexto runtime como API publica;
- sin taxonomia publica `variant`, `tone`, `size`, `fullWidth`, `compact`, `kiosk`, `admin` u `operational`;
- sin combobox buscable, listeners globales, autofocus, navegacion, persistencia o estado autoritativo propios.

### Area confirmada y solicitud pendiente

`confirmedAreaId` representa exclusivamente el area confirmada recibida. `requestedAreaId` representa una intencion en curso y solo puede ocupar el valor visual del control mientras `pending=true`; no sustituye `confirmedAreaId` como autoridad.

Durante una transicion, la composicion puede mantener `ContextIndicator state="changing"` mientras `AreaSelector` muestra la candidata solicitada y el texto de `pendingLabel`. `ContextIndicator` conserva el contexto confirmado hasta que exista un receipt autoritativo. La nueva area solo se trata como confirmada cuando la capa propietaria vuelve a renderizar con el nuevo `confirmedAreaId`.

El selector no autoelige la primera opcion, no autoemite cuando existe una sola opcion, no inventa una causa cuando la lista esta vacia y no crea una opcion universal `Sin area`. Un area confirmada que no figure en `options` tampoco se sintetiza como opcion nueva.

### Sede, elegibilidad y estaciones compartidas

`AreaSelector` no recibe `siteId` para calcular pertenencia ni elegibilidad. La capa propietaria prepara `options` contra la sede y el contexto territorial vigentes. Un cambio confirmado de sede puede invalidar el area anterior; el selector no la conserva como fallback ni autoelige la primera area del nuevo conjunto.

`SiteSelector` y `AreaSelector` pueden coexistir, pero la coordinacion sede-area, la invalidacion de solicitudes incompatibles y cualquier transicion conjunta permanecen fuera de ambos componentes.

En estaciones compartidas o multi-area, la interseccion entre dispositivo, actor, turno, permiso, proceso y territorio se calcula externamente. Las allowed areas del dispositivo son un limite externo, no una concesion de autoridad. Al cambiar de actor, la composicion descarta cualquier intencion de area incompatible y entrega una proyeccion nueva.

### Autoridad, filtros y concurrencia

Un filtro administrativo de area limita una consulta y no cambia contexto operativo. `AreaSelector` tampoco interpreta `area_kind`, nombre humano, URL, orden de opciones o configuracion del dispositivo como autoridad.

La presencia de una opcion solo significa que puede mostrarse como candidata. La autorizacion empresarial y la compatibilidad territorial se revalidan fuera del componente con contexto y recurso vigentes. Una superficie de bloqueo que prohiba corregir area localmente no puede reutilizar el selector como bypass.

La concurrencia puede volver obsoleta una solicitud si cambian actor, sede, turno, check-in, rol, dispositivo, simulacion, pertenencia area-sede, permiso, recurso o trabajo en curso. `AreaSelector` no conserva estado autoritativo interno, no aplica resultados obsoletos por su cuenta, no mantiene cache de elegibilidad y no crea una cola offline de cambios. Mientras `pending=true`, el control impide solicitudes concurrentes desde la misma instancia.

### Dependencias, persistencia y efectos

El componente no depende directamente de `@vento/os-context` ni recibe `EffectiveContext` como prop publica. Tampoco consulta `@vento/supabase`, abre cliente Supabase, ejecuta RPC, evalua permisos, lee o escribe cookies, `localStorage`, `sessionStorage`, IndexedDB, query parameters, URL, settings del trabajador o base de datos.

No inventa una columna o contrato `selected_area_id`, no navega para confirmar una seleccion y no ejecuta mutaciones de negocio. Borradores, claims, custodia, operaciones pendientes, confirmaciones sensibles, diagnostico y recuperacion permanecen bajo sus propietarios funcionales.

### Evidencia actual, migracion y rollback

No se observo un patron homogeneo de `AreaSelector` en las siete firmas `ProfileMenu` revisadas por el contrato: template historico mas NEXO, FOGO, ORIGO, VISO, PULSO y NUMERA. Tampoco existe una primitiva local dedicada `AreaSelector` entre Button, Card, Chip, Input y Modal. Esa evidencia no autoriza a afirmar ausencia de controles de area en todo el ecosistema.

El inventario ejecutable completo, adopcion y retiro permanecen en `SHELL-MIG-*` y `SHELL-CI-*`. Cada consumidor requiere clasificacion, paridad y rollback verificable antes de retirar cualquier control existente. Consumidores migrados: 0.

## SimulatedRoleNotice

`SimulatedRoleNotice` presenta de forma perceptible una simulacion que ya fue determinada por una capa propietaria. El componente no detecta simulaciones, no decide cuando deben existir y no transforma una vista simulada en autoridad efectiva.

Contrato interno materializado:

- `title` obligatorio como titulo visible aportado por la composicion;
- `simulatedRoleLabel` obligatorio como nombre humano visible del rol que se esta representando;
- `description` obligatorio como explicacion visible del alcance de la vista;
- `nonExecutableLabel` obligatorio como texto visible que mantiene perceptible la naturaleza no ejecutable de la representacion;
- raiz HTML `div` no interactiva;
- atributos compatibles de `HTMLDivElement`, `aria-*`, `data-*`, `className` y `style` transferibles; `children` queda controlado por la estructura del componente;
- sin `use client`, estado React, effects, timers, autocierre, foco automatico, movimiento de foco ni listeners globales;
- sin `role="alert"` ni live region impuestos por defecto;
- compatible con SSR y con composicion desde componentes cliente.

### Simulacion, autoridad y lifecycle

La capa propietaria determina la existencia de una simulacion y renderiza solo cuando esa condicion ya fue resuelta. El componente no recibe `active` ni `isSimulated` para resolverla por su cuenta.

El rol simulado no sustituye el rol real y la primitiva no modifica identidad, rol base, rol operativo, sesion, contexto efectivo ni permisos. La presentacion no es autoridad: mostrar una capacidad o alcance simulado no concede permisos, no transforma `WOULD_ALLOW` en `ALLOW` y no habilita operaciones reales.

La permanencia visual depende del montaje decidido por la capa propietaria. La primitiva permanece sin dismiss y sin autocierre; no inicia ni termina simulaciones, no persiste sesiones, no audita el lifecycle y no hace enforcement de acciones. Tampoco ofrece selector de rol, salida de simulacion, modo solo lectura ni bloqueo de operaciones criticas.

### Composicion y dependencias

`ContextIndicator`, `SiteSelector`, `AreaSelector` y `SimulatedRoleNotice` conservan responsabilidades separadas. `ContextIndicator` puede resumir el contexto confirmado; los selectores emiten intenciones de cambio; el aviso hace perceptible una condicion simulada ya resuelta. Ninguno absorbe el contrato de los demas.

El copy empresarial permanece externo. Los cuatro textos son entregados por la composicion y no existe un literal global obligatorio como `Modo prueba`, `Solo lectura` o `No ejecutable` congelado dentro de la primitiva.

El componente no consulta `@vento/os-context`, `@vento/supabase`, Supabase, RPC, red, cookies, `localStorage`, `sessionStorage`, IndexedDB, URL, query params o router. No conoce tablas, settings, claims, grants, actor, empleado ni identificadores de sesion.

AppShell permanece fuera de esta materializacion y su evaluacion corresponde a `SHELL-UI-010`.

### Legacy, migracion y rollback

Los usos legacy de `Modo prueba`, role overrides y avisos locales existentes no se canonizan por coincidencia nominal. Su clasificacion, adopcion, paridad y retiro permanecen en `SHELL-MIG-*` y `SHELL-CI-*`.

Cada consumidor requiere paridad y rollback verificable antes de retirar una copia legacy. Consumidores migrados: 0.

## AppShell

`AppShell` es un marco de composicion para chrome y contenido web. Recibe piezas ya preparadas por la aplicacion, organiza landmarks, responsive y disclosure local de navegacion, pero no se convierte en orquestador de identidad, autorizacion, contexto, datos, gating o navegacion empresarial.

Contrato interno materializado:

- frontera cliente aislada mediante `use client` porque el disclosure de navegacion movil necesita estado local de presentacion;
- `children` obligatorio como contenido principal de la aplicacion;
- `brand` obligatorio como identidad visual ya preparada por el consumidor;
- `skipToContentLabel` obligatorio como texto humano y localizable aportado por el consumidor para el salto al contenido principal; este refinamiento fisico cumple la obligacion de accesibilidad sin congelar copy dentro del package;
- `navigation` opcional; cuando existe, la relacion de tipos exige `navigationLabel` humano y perceptible;
- navegacion presente exige `navigationLabel`; sin `navigation`, `navigationLabel` no forma parte de la combinacion valida de props;
- `context`, `notices` y `headerActions` opcionales como slots de composicion;
- atributos compatibles de `HTMLDivElement`, `aria-*`, `data-*`, `className` y `style` transferibles a la raiz;
- una sola cabecera estructural y un unico landmark `main` dentro del componente;
- enlace de salto al contenido principal con destino focusable mediante `tabIndex={-1}`;
- navegacion persistente en escritorio y disclosure colapsado por defecto en viewport reducido;
- navegacion movil cerrada mediante `display: none`, por lo que no permanece interactiva ni en el tab order de ese layout;
- control nativo `button` con `aria-controls` y `aria-expanded` para el disclosure;
- cierre local mediante el mismo control y mediante `Escape` cuando el foco esta dentro de la navegacion abierta; el cierre por `Escape` devuelve foco al control;
- sin animacion ni transicion obligatoria, por lo que no depende de movimiento para comunicar estado;
- sin variantes fisicas `tablet`, `kiosk`, `simulated`, `admin` u `operational` dentro de la API base.

### Slots y composicion

`brand` presenta identidad visual; no determina `AppCode`, permiso, dominio ni disponibilidad operacional.

`navigation` recibe navegacion preparada externamente. AppShell no define items, rutas, permisos ni agrupacion empresarial y no interpreta `permissionCode`, `required`, `anyOf`, matrices de rol o rutas autorizadas. `SHELL-UI-011` conserva la navegacion orientada a tareas y su contrato propio.

`context` reserva una ubicacion estable para una proyeccion visual ya resuelta. Puede componer `ContextIndicator`, `SiteSelector` y `AreaSelector`, pero AppShell no confirma sede, area, rol, turno, actor, dispositivo ni simulacion.

`notices` puede componer `SimulatedRoleNotice`, `Alert` u otros avisos ya preparados. AppShell no resuelve su causa, no los convierte en autoridad y no inicia recuperacion o lifecycle empresarial.

`headerActions` recibe utilidades ya preparadas. `AppSwitcher` y `ProfileMenu` pueden ser contenidos candidatos, pero no forman parte integral de AppShell y sus datos, catalogos, sesion y autoridad permanecen fuera del componente.

`children` ocupa el unico contenido principal. AppShell no inspecciona proceso, etapa, recurso, permiso, mutacion, idempotencia, confirmacion ni persistencia del contenido.

### Presentacion, autoridad y datos

El estado `navigationOpen` es exclusivamente presentacional. Abrir o cerrar el disclosure no cambia permisos, no filtra items, no activa contexto y no representa un receipt empresarial. La presentacion no sustituye autorizacion y la visibilidad del chrome nunca concede acceso.

AppShell no recibe `AccessContext`, `EffectiveContext`, `SimulationContext`, `siteId`, `areaId`, `shiftId`, `role` o `isSimulated` como contrato propio. Tampoco consulta `@vento/os-context`, `@vento/supabase`, Supabase, Auth, RPC, tablas, red, cookies, storage, query params o router.

No contiene `OperatingGate`, no reconstruye sesion, no resuelve empleados, no mantiene catalogo local de aplicaciones y no hardcodea rutas de NEXO, FOGO, ORIGO, VISO, PULSO, NUMERA o SHELL.

### Responsive, foco y accesibilidad

En escritorio, el marco puede mantener navegacion lateral junto al `main`. En viewport reducido, el layout pasa a disclosure y la navegacion cerrada queda fuera del flujo interactivo. El contenido, contexto, avisos y acciones permiten reflow mediante columnas flexibles, `min-width: 0`, wrapping y breakpoints sin imponer scroll horizontal estructural ordinario.

El control movil conserva semantica nativa, estado expandido perceptible y foco visible. El skip link aparece al recibir foco y permite saltar al `main`. El componente no crea listeners globales ni focus trap; el contenido suministrado por cada slot conserva su propia responsabilidad de accesibilidad.

### Consumidores, legacy y rollback

La materializacion global no migra aplicaciones. Permanecen 7 consumidores conceptualmente elegibles: `vento-shell`, `vento-nexo`, `vento-fogo`, `vento-origo`, `vento-viso`, `vento-pulso` y `vento-numera`.

La evidencia documental conserva 6 familias runtime duplicadas `VentoShell` / `VentoChrome` que requieren reconciliacion y 1 launcher SHELL con composicion diferenciada sin sidebar obligatorio. Esta instancia no adopta ninguna copia actual como API canónica, no modifica `templates/app-shell-standard` y no retira `VentoShell` o `VentoChrome`.

Consumidores migrados: 0/7. Copias legacy retiradas: 0. Releases publicadas por UI010: 0. Cambios Supabase por UI010: 0.

La adopcion, paridad, compatibilidad, observacion y rollback por consumidor permanecen en `SHELL-MIG-*`, `SHELL-CI-*` y los packages propietarios antes de cualquier retiro legacy.

## TaskNavigation

`TaskNavigation` presenta una proyeccion de navegacion ya resuelta y organizada alrededor de trabajo, obligacion, resultado y siguiente paso. Conserva estructura, identidad y estados presentacionales, pero no descubre permisos, no resuelve contexto, no calcula prioridad empresarial, no fabrica rutas y no convierte navegacion en una cola de tareas.

Contrato interno materializado:

- `TaskNavigationProps` exige `ariaLabel` humano y localizable, `groups` ya preparados y permite `currentNavigationId` ya resuelto;
- `TaskNavigationGroup` conserva `groupId`, `label`, `description` opcional e `items` en el orden recibido;
- `TaskNavigationItem` conserva `navigationId`, `intentCode`, `label`, `description`, `href`, `state`, `statusLabel`, `ownerLabel` e `icon` sin payloads de autorizacion;
- `TaskNavigationPresentationState` contiene exactamente `PRIMARY`, `SECONDARY`, `DISCOVERABLE`, `CONTEXTUAL_DISABLED` y `REQUIRED_BLOCKED`;
- `HIDDEN` queda fuera de la union renderizable: la capa propietaria excluye esos destinos antes de construir las props;
- `navigationId` es la identidad estable del destino y permanece separado de `href`, `label`, permiso, componente y proceso;
- `intentCode` permanece como identidad semantica para instrumentacion o adaptacion y no se presenta como copy ordinario;
- `currentNavigationId` marca el destino actual mediante `aria-current` cuando existe coincidencia y no se deriva de pathname, query params, hash, storage o historial;
- `href` se conserva como destino ya preparado y no implica autoridad para ejecutar la operacion de destino;
- grupos e items conservan estrictamente el orden recibido y la primitiva no realiza sorting autonomo;
- `CONTEXTUAL_DISABLED` y `REQUIRED_BLOCKED` permanecen visibles pero no accionables aunque reciban `href`;
- cualquier item sin `href` se presenta como no accionable sin inventar una causa;
- `statusLabel`, `ownerLabel`, `description` e `icon` permanecen opcionales y preparados externamente;
- iconos se tratan como decorativos por defecto y no sustituyen `label`;
- `groups` vacio no genera mensajes automaticos como ausencia de permisos, ausencia de trabajo o inexistencia de pantallas;
- duplicados de `groupId` o `navigationId` fallan cerrado para impedir identidad visual ambigua;
- atributos compatibles de `HTMLDivElement`, `aria-*`, `data-*`, `className` y `style` pueden transferirse a la raiz, mientras `children` y `aria-label` permanecen controlados por el contrato de la primitiva;
- sin `use client`, estado React, efectos, timers, red, browser storage, Supabase, sesion, router o lectura de contexto, por lo que la superficie base permanece server-safe.

### AppShell y landmarks

La composicion primaria es `AppShell.navigation -> TaskNavigation`. `AppShell` conserva el unico landmark de navegacion y su `navigationLabel`; `TaskNavigation` usa una raiz `role="group"` con `ariaLabel` para nombrar la estructura interna sin crear un segundo `<nav>` o `role="navigation"` anidado. La aplicacion debe mantener `AppShell.navigationLabel` y `TaskNavigation.ariaLabel` semanticamente coherentes para la misma finalidad localizada.

`AppShell` sigue siendo propietario del marco, disclosure responsive y tab order de la navegacion cerrada. `TaskNavigation` solo organiza grupos, listas, destinos, estado actual y estado no accionable dentro del contenido que recibe ese slot.

### Identidad, autoridad y trabajo

La presencia de un destino no concede acceso. La capa propietaria debe resolver previamente autorizacion, relevancia, visibilidad, descubribilidad, enabled, accionabilidad y obligatoriedad, y entregar a `TaskNavigation` solo la proyeccion presentable.

La API no recibe `permissionCode`, `requiredPermissions`, `anyOfPermissions`, roles, `AccessContext`, `AuthorizationDecision`, `canAccess`, `canExecute`, Supabase ni objetos de sesion. Tampoco interpreta `navigationId`, `intentCode`, `href`, label, grupo, icono o estado como autoridad.

Seleccionar un destino no equivale a claim, start, accept, approve, execute o complete. Los estados `PRIMARY`, `SECONDARY`, `DISCOVERABLE`, `CONTEXTUAL_DISABLED` y `REQUIRED_BLOCKED` describen presentacion y descubribilidad, no estados de work item, proceso o autorizacion.

### Router, datos y adapters

La superficie base no importa `next/link`, `next/navigation`, `usePathname`, `useSearchParams` ni router imperativo. Cada consumidor puede mantener un adapter local pequeno para resolver `currentNavigationId`, mapear iconos a `ReactNode`, localizar labels, excluir destinos `HIDDEN` y construir el orden ya resuelto.

Ese adapter no puede trasladar permisos, contexto autoritativo, prioridad o una taxonomia divergente dentro de la primitiva. `TaskNavigation` tampoco consulta `app_navigation_items`, Supabase, RPC, red, cookies o storage.

### Estados, accesibilidad y responsive

Los destinos accionables usan enlaces semanticos. Los destinos no accionables permanecen fuera de la activacion y exponen `aria-disabled`. El destino actual expone `aria-current="page"` sin depender solo de color. Los estados visuales utilizan estructura, borde, peso y contenido secundario ademas de color; `statusLabel` o una descripcion equivalente sigue siendo responsabilidad de la proyeccion cuando sea necesario explicar un bloqueo.

La estructura utiliza grupo, listas e items en orden recibido, conserva foco visible, objetivos tactiles de al menos 44 px para destinos accionables, reflow, `min-width: 0`, wrapping y viewport reducido sin scroll horizontal estructural. No depende de hover, animacion o transicion para comunicar significado.

### Consumidores, migracion y rollback

La materializacion global no migra aplicaciones. La reconciliacion documental mantiene siete consumidores evaluados: `SHELL`, `NEXO`, `FOGO`, `ORIGO`, `VISO`, `PULSO` y `NUMERA`. `SHELL` conserva su launcher actual como composicion elegible sin equivalente lateral obligatorio; los otros seis permanecen `CANDIDATO_A_MIGRAR` por conservar familias locales `NavGroup` / `NavItem` dentro de chrome.

Los adapters, paridad de rutas y estados, compatibilidad, observacion y rollback por consumidor permanecen en `SHELL-MIG-*` y `SHELL-CI-*`. El template `app-shell-standard` permanece evidencia historica y no define la API de `TaskNavigation`.

Consumidores migrados por UI011: 0/7. Copias legacy retiradas por UI011: 0. Releases publicadas por UI011: 0. Cambios Supabase por UI011: 0.

## Accesibilidad

`Alert` no impone una region viva universal. El consumidor aporta `role`, `aria-live`, `aria-atomic` u otros atributos ARIA cuando el escenario dinamico lo exige.

`Button` conserva semantica nativa, foco visible, estados `disabled` y `loading` perceptibles, identidad de accion durante carga, reflow de contenido y soporte de nombre accesible aportado por el consumidor para botones de solo icono. La semantica nativa no se reemplaza por `role="button"` sobre elementos no interactivos.

`Card` permanece fuera de la secuencia de tabulacion por defecto, no inventa roles ni foco, permite reflow de contenido de longitud variable y conserva la semantica de los elementos que el consumidor compone dentro de ella.

`EmptyState` conserva `title` visible, mantiene iconografia decorativa fuera del nombre accesible, no impone region viva, no entra por defecto a la secuencia de tabulacion y conserva la semantica nativa de cualquier accion compuesta por el consumidor.

`ContextIndicator` conserva estado textual, relacion semantica entre etiquetas y valores, orden de lectura, reflow y atributos ARIA compatibles sin imponer una live region, tabulacion, foco automatico o interaccion sobre la raiz.

`SiteSelector` conserva semantica nativa de `label`, `select` y `option`, teclado del navegador, foco visible, objetivo tactil, reflow y estado pendiente textual cuando la composicion aporta `pendingLabel`; no depende de hover ni mueve foco por una confirmacion ordinaria.

`AreaSelector` conserva semantica nativa de `label`, `select` y `option`, teclado del navegador, foco visible, objetivo tactil, reflow y estado pendiente textual cuando la composicion aporta `pendingLabel`; no depende de hover, no mueve foco por un receipt ordinario y no confunde area solicitada con area confirmada.

`SimulatedRoleNotice` conserva los cuatro significados como texto visible, no depende solo de color o iconografia, no entra por defecto a la secuencia de tabulacion, no impone una region viva y permite reflow, zoom, viewport estrecho y contenido largo sin autocierre ni movimiento de foco.

`AppShell` conserva un unico `main`, skip link con copy externo, navegacion con nombre accesible, control nativo con `aria-expanded`, disclosure movil fuera del tab order cuando esta cerrado, foco visible, retorno de foco al cerrar por `Escape`, reflow y chrome operable por teclado sin convertir presentacion en autoridad.

`TaskNavigation` conserva grupos e items en orden recibido, nombres humanos, destino actual mediante `aria-current`, estados no accionables mediante semantica perceptible, iconografia decorativa fuera del nombre accesible, foco visible, objetivos tactiles, reflow y composicion dentro del landmark de `AppShell` sin crear un segundo landmark de navegacion.

La certificacion de contraste, tecnologias de asistencia, paridad visual y comportamiento por consumidor permanece en los gates de package, UX y migracion aplicables antes de retiro legacy.

## Superficie publica diferida

Esta instancia no modifica el manifest de `@vento/ui-web` y no crea `exports`, `main`, `types`, version npm, peer dependencies, publicacion ni entrypoints CSS publicos. Los exports publicos permanecen diferidos.

La habilitacion de una superficie publica versionada, compatibilidad, publicacion, adopcion de consumidores, rollback y retiro legacy permanecen gobernados por las tareas `SHELL-PKG-*`, `SHELL-CI-*` y `SHELL-MIG-*` que correspondan. El retiro legacy exige evidencia de uso residual cero o migracion certificada antes de eliminar una copia existente.

## Continuidad reservada

ÚLTIMA TAREA APROBADA: `SHELL-UI-010`

TAREA ACTUAL APROBADA: `SHELL-UI-011`

SIGUIENTE TAREA RESERVADA: `SHELL-UI-012`

`SHELL-UI-011::GLOBAL` materializa solamente la superficie presentacional de grupos y destinos ya resueltos. `SHELL-UI-012` conserva la linea compartida de estados de proceso; UI011 no adelanta estados empresariales, work items, proceso, migracion de consumidores ni patrones compuestos posteriores.

## Fuera de alcance

Esta instancia no modifica `package.json` raiz, `package-lock.json`, `packages/ui-web/package.json`, `src/components/ui`, `templates/app-shell-standard`, componentes, estilos o validadores previos de `packages/ui-web` incluido `AppShell`, `packages/contracts`, `packages/os-context`, `packages/supabase`, `ProfileMenu`, `AppSwitcher`, `VentoShell`, `VentoChrome`, aplicaciones consumidoras, `app_navigation_items`, rutas empresariales, catalogos de aplicaciones, permission codes, roles reales o simulados, permisos, grants, contexto efectivo, `OperatingGate`, work items, claims, prioridades, inicio o finalizacion de trabajo, router cross-app, busqueda, favoritos, recientes, breadcrumbs, SQL, DDL, DML, migraciones, RLS, RPC, Storage, Realtime, Edge Functions, datos, exports npm, versionado, publicacion, adopcion de consumidores, retiro legacy, Supabase, `SHELL-UI-012` ni el registro 04A/TREQ.
