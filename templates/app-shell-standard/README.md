# App Shell Standard (Template)

Este template contiene el AppShell y UI Kit estándar ya listos para copiar/pegar.

## Contenido

- `src/app/layout.tsx`
- `src/app/globals.css`
- `src/components/vento/standard/`
  - `vento-shell.tsx`
  - `vento-chrome.tsx`
  - `ui.tsx`
  - `table.tsx`
  - `app-switcher.tsx`
  - `profile-menu.tsx`

## Pasos de uso

1) Copia la carpeta `src/components/vento/standard/` al repo nuevo.
2) Copia `src/app/layout.tsx` y `src/app/globals.css`.
3) Ajusta en `globals.css` la paleta `--ui-*` segun el modulo.
4) Ajusta metadata y labels de app en `layout.tsx` y `vento-chrome.tsx`.
5) Actualiza `permissionCodes` y rutas de nav en `vento-chrome.tsx`.

## Dependencias esperadas

Este template asume que existen estos helpers (mismos paths que NEXO):

- `src/lib/supabase/client` + `src/lib/supabase/server`
- `src/lib/auth/guard`
- `src/lib/auth/role-override` y `src/lib/auth/role-override-config`

Si el repo nuevo no los tiene, copia esos módulos desde NEXO o adapta los imports.
