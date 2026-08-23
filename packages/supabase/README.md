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
- `src/errors.ts` existe como infraestructura interna de normalización técnica; no es un export público del package.
- Sin factories, tipos generados ni wrappers RPC.
- Sin publicación, registry, tags o releases.

## Fuera de alcance

Esta instancia no modifica consumidores, helpers legacy, SQL, migraciones, tablas, vistas, funciones, RPC, RLS, grants, triggers, índices, constraints, datos, secretos, configuración remota ni el proyecto Supabase.

## Normalización técnica de errores

`SHELL-DB-004::GLOBAL` materializa la política interna y runtime-neutral:

`VENTO_SUPABASE_TECHNICAL_ERROR_NORMALIZATION@1.0.0`

La política conserva:

- 4/4 capas separadas: diagnóstico nativo, normalización técnica, outcome contractual y mensaje público;
- 11/11 familias semánticas heredadas;
- prioridad de un outcome contractual machine-readable válido;
- mappings exactos y versionados por fuente, código, contrato y versión;
- fallback cerrado para errores desconocidos o sin mapping;
- resultado desconocido y reconciliación para commands despachados cuyo efecto sea incierto;
- retry únicamente desde un contrato explícito;
- correlación segura y diagnóstico técnico protegido;
- redacción de SQLSTATE, stack, SQL, constraints, objetos físicos, secretos y PII en superficies públicas;
- paridad semántica entre server, browser y native;
- 36/36 coberturas conductuales contractuales.

La clasificación nunca depende de `Error.message`, `hint`, `details`, stack, idioma, copy, heurísticas textuales o un status HTTP aislado. Un fallo técnico nunca se transforma silenciosamente en `null`, lista vacía, `false` o éxito.

El detalle protegido completo solo se conserva en runtime `SERVER`. Browser y native reciben únicamente la representación pública redactada. VITAL permanece excluido de esta política transversal.

La separación física de factories, configuración, cookies, secretos y capacidades browser/server/native/privileged continúa reservada a `SHELL-DB-005`.
