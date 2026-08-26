# Arquitectura de Migraciones Centralizadas

## Autoridad canónica

VENTO mantiene una única autoridad versionada de migraciones Supabase:

```text
vento-shell/
  supabase/
    migrations/          -> fuente SQL canónica
    MIGRATION_MANIFEST.md -> inventario verificable del historial físico
```

Los repositorios consumidores no crean, copian ni mantienen una autoridad paralela de migraciones. Cuando una aplicación necesita un cambio de base de datos, la migración se crea, versiona y documenta en `vento-shell`.

`supabase/MIGRATION_MANIFEST.md` no sustituye los archivos SQL. Su función es demostrar, para el mismo checkout, qué archivos existen y cuál es su identidad física.

## Fuente SQL e inventario

`supabase/migrations/` es el universo canónico de migraciones VENTO. Cada archivo regular contenido bajo ese directorio debe aparecer exactamente una vez en `supabase/MIGRATION_MANIFEST.md`.

El manifiesto conserva estas columnas:

| Campo | Regla |
| --- | --- |
| `version` | Prefijo de versión del nombre físico, o `UNVERSIONED` para una excepción histórica sin prefijo reconocible. |
| `filename` | Nombre o ruta relativa exacta dentro de `supabase/migrations/`. |
| `sha256` | SHA-256 del contenido versionado canonico; CRLF introducido por checkout se normaliza a LF antes del calculo. |
| `bytes` | Tamano exacto en bytes del contenido versionado canonico despues de neutralizar solo CRLF de checkout. |
| `kind` | `BASELINE`, `STANDARD`, `MANUAL_LEGACY` o `FIXED_LEGACY`. |
| `findings` | Hallazgos verificables separados por coma; vacío cuando no existen. |
| `lineage` | Relaciones demostrables por contenido, familia lógica o versión compartida. |
| `notes` | Disposición documental del hallazgo. |

Los hallazgos reconocidos inicialmente son:

```text
EMPTY_FILE
CONTENT_DUPLICATE
SAME_LOGICAL_FAMILY
LEGACY_NAMING
```

Las disposiciones documentales usadas por el inventario son:

```text
SIN_HALLAZGO
HISTÓRICO_PRESERVADO
RELACIÓN_DOCUMENTADA
REQUIERE_TAREA_PROPIETARIA
```

Un hallazgo no autoriza a borrar, renombrar, reescribir ni declarar supersedida una migración histórica.

## Generación y validación

El manifiesto se deriva mecánicamente del árbol físico; su cardinalidad no se mantiene a mano.

```text
npm run supabase:migrations:manifest:build
npm run supabase:migrations:manifest:check
```

`build` recalcula filas, SHA-256, bytes, clasificación y relaciones verificables.

`check` falla cerrado cuando ocurre cualquiera de estos casos:

- archivo físico sin fila;
- fila que ya no coincide con el archivo físico;
- hash, bytes, clasificación, hallazgos o lineage obsoletos;
- orden o cardinalidad inconsistentes;
- manifiesto ausente;
- una migración nueva incumple la convención de nombre;
- el manifiesto intenta representar estado aplicado por entorno.

El Required Gate ejecuta `supabase:migrations:manifest:check`, por lo que una migración nueva y su manifiesto forman una unidad de cambio.

## Versionado de migraciones nuevas

Las migraciones nuevas usan exclusivamente:

```text
^[0-9]{14}_[a-z0-9][a-z0-9_]*\.sql$
```

Reglas:

1. `00000000000000_baseline.sql` permanece reservado como baseline.
2. El prefijo de catorce dígitos es la identidad ordenable de versión.
3. El slug utiliza minúsculas, números y `_`.
4. No se crean nuevos sufijos `.manual.sql` ni `.fixed.sql`.
5. Los nombres históricos que no cumplen la convención actual se preservan y se clasifican; no se renombran retrospectivamente.
6. Una coincidencia de nombre no demuestra por sí sola qué objetos SQL cambia ni si fue aplicada en un entorno.

## Inmutabilidad del historial

La regla predeterminada de corrección es:

```text
historial existente
-> se preserva
-> corrección mediante nueva migración forward
-> relación documentada cuando exista evidencia verificable
```

Los archivos vacíos, los duplicados de contenido y las excepciones legacy permanecen dentro del universo canónico hasta que una decisión propietaria explícita autorice otra disposición.

## Separación de estado por entorno

El repositorio demuestra qué migraciones están versionadas. No demuestra, por sí solo, qué migraciones están aplicadas en local, staging o producción.

Por tanto, `supabase/MIGRATION_MANIFEST.md` no utiliza estados como:

```text
applied_remote
applied_staging
applied_production
pending_production
```

La medición de baseline y drift entre entornos pertenece a `AUTH-DB-028`.

## Baseline y control de drift

`AUTH-DB-028::GLOBAL` materializa el controlador reusable de baseline y drift sin crear una segunda fuente de verdad de schema ni de historial migratorio.

Las entradas estables son:

```text
npm run supabase:drift:test
npm run supabase:drift:expected
npm run supabase:drift:local
npm run supabase:drift:remote -- --environment-role staging --project-ref <ref> --owner <owner>
npm run supabase:drift:remote -- --environment-role production --project-ref <ref> --owner <owner>
```

Los parámetros `<ref>` y `<owner>` anteriores representan valores reales exigidos en cada ejecución; no son valores por defecto ni autorización para inferir una identidad ambiental.

La referencia siempre se construye así:

```text
EXPECTED(candidate versionado en vento-shell)
vs.
OBSERVED(environment identificado)
```

El estado esperado conserva el commit candidato, el árbol Git, el manifiesto y SHA-256 de migraciones, `supabase/config.toml`, versión de herramientas, Edge Functions versionadas, `verify_jwt` y nombres de secretos referenciados sin valores.

La observación local reutiliza el harness de `AUTH-DB-027` y fingerprints deterministas de PostgreSQL. La observación hosted utiliza exclusivamente lecturas soportadas: Management API GET y el endpoint SQL `database/query/read-only`. El controlador rechaza por allowlist interna métodos o endpoints de mutación.

La comparación cubre, según aplicabilidad:

- historial migratorio;
- relaciones, columnas, constraints, índices y vistas;
- funciones/RPC, triggers, grants y RLS;
- extensiones, publications y tipos;
- Data API;
- Auth contractual no secreto;
- Storage y buckets;
- Realtime;
- Edge Functions y `verify_jwt`;
- cron cuando `pg_cron` sea aplicable;
- nombres de secretos requeridos, nunca sus valores.

`vital` se excluye explícitamente de `governed_schemas`. Su existencia puede demostrarse como frontera, pero sus objetos no participan en fingerprints gobernados por Vento OS.

Un ambiente remoto solo puede usar rol `staging` o `production` y requiere `project_ref` y owner explícitos. Un nombre visible como `dev`, `staging` o `prod` no sustituye su identidad técnica.

Los resultados de drift son:

```text
EXPECTED_OVERLAY
TEMPORARY_EXCEPTION
UNAUTHORIZED_DRIFT
INSUFFICIENT_EVIDENCE
```

La allowlist solo admite coincidencia exacta por `drift_id`, superficie, identidad y ambiente. No admite comodines. `TEMPORARY_EXCEPTION` exige expiración futura, owner, aprobador, riesgo, evidencia y tratamiento.

`UNAUTHORIZED_DRIFT` e `INSUFFICIENT_EVIDENCE` bloquean certificación. Una superficie requerida que no pueda leerse no se convierte en PASS implícito.

La evidencia opcional solo puede escribirse bajo `.delivery/`. El controlador no persiste valores de secretos ni connection strings completas.

Detectar drift no autoriza ninguna de estas operaciones:

```text
db pull
migration repair
db push
db reset --linked
DDL
DML
cambios de Auth
cambios de RLS o grants
cambios de Storage
redeploy de Edge Functions
```

Toda reparación pertenece a su tarea o paquete propietario y debe volver a producir baseline y comparación después de la corrección.

## Fronteras de responsabilidad

| Tarea | Responsabilidad |
| --- | --- |
| `AUTH-DB-015` | Inventario y versionado verificable del historial físico de migraciones. |
| `AUTH-DB-027` | Harness de pruebas de esquema, integridad, RLS, RPC y migraciones. |
| `AUTH-DB-028` | Baseline y drift entre local, staging y producción mediante observación read-only. |
| `AUTH-DB-029` | Respaldo, restauración y rollback. |

`AUTH-DB-015` y `AUTH-DB-027` no representan estado remoto. `AUTH-DB-028` puede observar estado remoto únicamente en modo read-only y no lo convierte en fuente canónica. Ninguna de estas tareas aplica migraciones o repara drift por inferencia.

## Flujo para una migración nueva

1. Crear el archivo exclusivamente en `vento-shell/supabase/migrations/` con el nombre canónico.
2. Implementar el SQL correspondiente según la tarea propietaria del cambio.
3. Ejecutar `npm run supabase:migrations:manifest:build` en el mismo cambio.
4. Ejecutar `npm run supabase:migrations:manifest:check`.
5. Someter el cambio al Required Gate del repositorio.
6. Tratar despliegue, drift y recuperación únicamente en sus carriles propietarios.

No se copia el archivo a repositorios consumidores para crear una segunda historia de migraciones.

## Historial legacy

El inventario conserva y clasifica las excepciones existentes, incluidas migraciones con sufijos `.manual.sql` o `.fixed.sql`, archivos vacíos, contenido idéntico bajo identidades distintas y familias lógicas repetidas.

La clasificación es descriptiva. No equivale a error de base de datos, estado de despliegue, rollback ni permiso de eliminación.

## Referencias

- `docs/plan-canonico/modular/bloques/R_SUPABASE/01_R0_PREPARACION_PRUEBAS_Y_CONTENCION_DE_RIESGOS.md`
- `supabase/migrations/`
- `supabase/MIGRATION_MANIFEST.md`
- `scripts/supabase/migration-manifest.mjs`
- `scripts/quality/supabase-db-harness.mjs`
- `scripts/supabase/environment-drift.mjs`
