# @vento/ui-web

Raiz privada de autoria para la implementacion visual web compartida de Vento OS.

## Estado

`PRE_E5_FOUNDATION`

`SHELL-UI-001::GLOBAL` materializo la identidad fisica del workspace `@vento/ui-web` autorizada por la reconciliacion `GLOBAL_ENABLE_ONCE` / `PRE_E5_FOUNDATION`.

`SHELL-UI-002::GLOBAL` materializa internamente `Alert` y sus estilos de componente bajo el contrato aprobado de `SHELL-UI-002`, sin publicar todavia una API npm, una version, un entrypoint CSS ni una adopcion por consumidores.

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
- `src/alert.css` como estilos internos del componente.
- `scripts/validate-alert.mjs` como validador fisico de `SHELL-UI-002::GLOBAL`.
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

## Accesibilidad

La apariencia visual de `Alert` no implica una region viva universal. El consumidor aporta `role`, `aria-live`, `aria-atomic` u otros atributos ARIA cuando el escenario dinamico lo exige. El componente no captura ni mueve foco por defecto y el icono nunca sustituye el contenido textual.

La certificacion de contraste, tecnologias de asistencia, paridad visual y comportamiento por consumidor permanece en los gates de package, UX y migracion aplicables antes de retiro legacy.

## Superficie publica diferida

Esta instancia no modifica el manifest de `@vento/ui-web` y no crea `exports`, `main`, `types`, version npm, peer dependencies, publicacion ni entrypoints CSS publicos.

La habilitacion de una superficie publica versionada, compatibilidad, publicacion, adopcion de consumidores, rollback y retiro legacy permanecen gobernados por las tareas `SHELL-PKG-*`, `SHELL-CI-*` y `SHELL-MIG-*` que correspondan.

## Continuidad reservada

`SHELL-UI-003` conserva la responsabilidad de `Button`. `SHELL-UI-002::GLOBAL` no modifica `Button`, `Card`, `EmptyState`, contexto visual, AppShell, navegacion ni patrones compuestos posteriores.

## Fuera de alcance

Esta instancia no modifica `package.json` raiz, `package-lock.json`, `packages/ui-web/package.json`, `src/components/ui`, `templates/app-shell-standard`, `packages/contracts`, `packages/os-context`, `packages/supabase`, aplicaciones consumidoras, rutas, navegacion, autenticacion, autorizacion, SQL, migraciones, RLS, RPC, Storage, Realtime, Edge Functions, datos, secretos, configuracion remota, Supabase ni el registro 04A/TREQ.
