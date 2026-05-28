# Vento Shell

Vento Shell es la plataforma central del ecosistema Vento OS.

## Responsabilidad

- Supabase como fuente canonica de migraciones, RLS, RPCs, Edge Functions, storage y permisos.
- Auth/SSO, app access, guards y contratos compartidos.
- Estándares de AppShell/UI comunes para las apps.
- Documentación maestra del estado del ecosistema.

Las apps de negocio no deben crear migraciones paralelas para tablas compartidas. Cualquier cambio de base de datos del ecosistema se crea y corre desde este repo.

## Documentación vigente

- `docs/ESTADO-ACTUAL-ECOSISTEMA-2026-05-28.md`
- `docs/ARQUITECTURA-MIGRACIONES-CENTRALIZADAS.md`
- `docs/APP-SHELL-ESTANDARES.md`
- `supabase/MIGRATION_MANIFEST.md`

Los planes antiguos en `docs/` quedan como contexto histórico si contradicen el estado actual.

## Desarrollo

```bash
npm install
npm run dev
```

## Supabase

Migraciones:

```bash
npx supabase db push
```

Edge Functions y secrets también se gestionan desde este repo.
