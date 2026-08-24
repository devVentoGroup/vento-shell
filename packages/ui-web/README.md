# @vento/ui-web

Raiz privada de autoria para la implementacion visual web compartida de Vento OS.

## Estado

`PRE_E5_FOUNDATION`

`SHELL-UI-001::GLOBAL` materializo la identidad fisica del workspace `@vento/ui-web` autorizada por la reconciliacion `GLOBAL_ENABLE_ONCE` / `PRE_E5_FOUNDATION`.

`SHELL-UI-002::GLOBAL` materializo internamente `Alert` y sus estilos de componente bajo el contrato aprobado de `SHELL-UI-002`.

`SHELL-UI-003::GLOBAL` materializa internamente `Button` y sus estilos de componente bajo el contrato aprobado de `SHELL-UI-003`, sin publicar todavia una API npm, una version, un entrypoint CSS ni una adopcion por consumidores.

`SHELL-UI-004::GLOBAL` materializa internamente `Card` y sus estilos de componente bajo el contrato aprobado de `SHELL-UI-004`, sin publicar todavia una API npm, una version, un entrypoint CSS ni una adopcion por consumidores.

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

## Accesibilidad

`Alert` no impone una region viva universal. El consumidor aporta `role`, `aria-live`, `aria-atomic` u otros atributos ARIA cuando el escenario dinamico lo exige.

`Button` conserva semantica nativa, foco visible, estados `disabled` y `loading` perceptibles, identidad de accion durante carga, reflow de contenido y soporte de nombre accesible aportado por el consumidor para botones de solo icono. La semantica nativa no se reemplaza por `role="button"` sobre elementos no interactivos.

`Card` permanece fuera de la secuencia de tabulacion por defecto, no inventa roles ni foco, permite reflow de contenido de longitud variable y conserva la semantica de los elementos que el consumidor compone dentro de ella.

La certificacion de contraste, tecnologias de asistencia, paridad visual y comportamiento por consumidor permanece en los gates de package, UX y migracion aplicables antes de retiro legacy.

## Superficie publica diferida

Esta instancia no modifica el manifest de `@vento/ui-web` y no crea `exports`, `main`, `types`, version npm, peer dependencies, publicacion ni entrypoints CSS publicos.

La habilitacion de una superficie publica versionada, compatibilidad, publicacion, adopcion de consumidores, rollback y retiro legacy permanecen gobernados por las tareas `SHELL-PKG-*`, `SHELL-CI-*` y `SHELL-MIG-*` que correspondan. El retiro legacy exige evidencia de uso residual cero o migracion certificada antes de eliminar una copia existente.

## Continuidad reservada

`SHELL-UI-005` conserva la responsabilidad de `EmptyState`. `SHELL-UI-004::GLOBAL` no modifica `EmptyState`, contexto visual, AppShell, navegacion ni patrones compuestos posteriores.

## Fuera de alcance

Esta instancia no modifica `package.json` raiz, `package-lock.json`, `packages/ui-web/package.json`, `src/components/ui`, `templates/app-shell-standard`, `packages/ui-web/src/Alert.tsx`, `packages/ui-web/src/alert.css`, `packages/ui-web/scripts/validate-alert.mjs`, `packages/ui-web/src/Button.tsx`, `packages/ui-web/src/button.css`, `packages/ui-web/scripts/validate-button.mjs`, `packages/contracts`, `packages/os-context`, `packages/supabase`, aplicaciones consumidoras, rutas, navegacion, autenticacion, autorizacion, SQL, migraciones, RLS, RPC, Storage, Realtime, Edge Functions, datos, secretos, configuracion remota, Supabase ni el registro 04A/TREQ.
