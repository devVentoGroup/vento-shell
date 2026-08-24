# @vento/ui-web

Raiz privada de autoria para la implementacion visual web compartida de Vento OS.

## Estado

`PRE_E5_FOUNDATION`

`SHELL-UI-001::GLOBAL` materializa unicamente la identidad fisica del workspace `@vento/ui-web` autorizada por la reconciliacion `GLOBAL_ENABLE_ONCE` / `PRE_E5_FOUNDATION`.

Esta instancia no publica una version, no define exports, no crea una API runtime, no distribuye CSS, no materializa componentes compartidos y no migra consumidores.

## Responsabilidad canonica

La raiz queda reservada para implementacion visual web compartida aprobada posteriormente por sus tareas propietarias.

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
- Sin `version` npm.
- Sin `main`, `types` o `exports`.
- Sin `dependencies`, `devDependencies` o `peerDependencies` propias.
- Sin `scripts` propios.
- Sin directorio `src`.
- Sin componentes compartidos.
- Sin entrypoints CSS.
- Sin publicacion, registry, tags o releases.
- Sin consumidores migrados.

## Responsabilidades reservadas

Las superficies concretas permanecen reservadas a `SHELL-UI-002..020`. En particular, esta instancia no adelanta `Alert`, `Button`, `Card`, `EmptyState`, contexto visual, AppShell, navegacion ni patrones compuestos posteriores.

La publicacion, compatibilidad, adopcion de consumidores, rollback y retiro legacy permanecen gobernados por las tareas `SHELL-PKG-*`, `SHELL-CI-*` y `SHELL-MIG-*` que correspondan.

## Fuera de alcance

Esta instancia no modifica `src/components/ui`, `templates/app-shell-standard`, `packages/contracts`, `packages/os-context`, `packages/supabase`, aplicaciones consumidoras, rutas, navegacion, autenticacion, autorizacion, SQL, migraciones, RLS, RPC, Storage, Realtime, Edge Functions, datos, secretos, configuracion remota, Supabase ni el registro 04A/TREQ.
