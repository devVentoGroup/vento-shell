# @vento/supabase

Raíz privada de autoría para el acceso técnico compartido a Supabase de Vento OS.

## Estado

`PRE_E5_FOUNDATION`

`SHELL-DB-001::GLOBAL` materializa únicamente la identidad física del workspace. No publica una versión, no expone una API runtime y no migra consumidores.

## Responsabilidades reservadas

El package conserva exactamente cuatro familias de responsabilidad, cuya implementación pertenece a sus tareas propietarias:

1. factories de clientes Supabase — `SHELL-DB-005`;
2. tipos generados desde fuentes versionadas y aprobadas — `SHELL-DB-002` y `AUTH-DB-026`;
3. wrappers tipados de RPC canónicas — `SHELL-DB-003`;
4. errores normalizados de acceso a datos — `SHELL-DB-004`.

Esta raíz no materializa todavía ninguna de esas familias.

## Fronteras

- Browser, server, native y privileged permanecen capacidades separadas.
- Privileged será exclusivamente server-only y nunca implicará autorización administrativa automática.
- Middleware y proxies permanecen locales a sus consumidores hasta una migración gobernada.
- El package no contiene lógica empresarial, decisiones de autorización ni reglas de identidad.
- Los tipos y factories no sustituyen RLS ni otras protecciones server-side.
- La configuración debe ser explícita y los secretos nunca se almacenan en este package.
- Una importación no realiza conexiones, llamadas remotas, migraciones ni otros efectos secundarios.

## Superficie física actual

- Sin `exports`.
- Sin versión npm.
- Sin dependencias runtime propias.
- Sin archivos TypeScript.
- Sin factories, tipos generados, wrappers RPC ni taxonomía de errores.
- Sin publicación, registry, tags o releases.

## Fuera de alcance

Esta instancia no modifica consumidores, helpers legacy, SQL, migraciones, tablas, vistas, funciones, RPC, RLS, grants, triggers, índices, constraints, datos, secretos, configuración remota ni el proyecto Supabase.
