# Alineación local: historial de migraciones vs disco vs remoto

## Por qué se ve “desalineado”

1. **Tres fuentes distintas**
   - Archivos en `supabase/migrations/*.sql` (163+ en el monorepo).
   - Tabla **`supabase_migrations.schema_migrations`** en cada Postgres (local Docker, remoto, etc.).
   - Lo que el CLI muestra en `supabase migration list` (compara disco + historial del enlace).

2. **Operaciones que rompen la correspondencia 1:1**
   - Ejecutar SQL a mano en la BD **sin** registrar la versión en `schema_migrations`.
   - Un `db push` / `migration up --include-all` que **falla a mitad**: las migraciones anteriores ya quedaron aplicadas; las siguientes no; el disco sigue teniendo todos los archivos.
   - Tener **local antiguo** (pocas filas en `schema_migrations`) mientras el **remoto** ya recibió `db push` de migraciones nuevas.

3. **Cadena de migraciones que asume datos/tablas que el baseline local no trae**
   - Ej.: migraciones de **Anima / documentos** (`document_types`, etc.) que en producción existen por un esquema más amplio, pero **no** están en `00000000000000_baseline.sql` ni en `remote_schema` del repo.
   - En un `supabase db reset --local` desde cero, una migración puede fallar aunque el remoto ya la haya aplicado sobre otra base inicial.

## Qué ya se ajustó en el repo

- **`20260313103000_nexo_preparaciones_dulces_categories.sql`**: si no existe la categoría padre legacy, **ya no lanza error**; hace `NOTICE` y sale. Así el reset no se cae solo por catálogo vacío en local.
- Tras un reset fallido posterior, el local puede quedar coherente **hasta la última migración que sí aplicó** (revisar con `select version from supabase_migrations.schema_migrations order by version desc limit 5`).

## Cómo “arreglarlo todo” (opciones reales)

### A) Solo desarrollo local (aceptas borrar datos)

```powershell
cd vento-shell
supabase db reset --local --yes
```

- Deja el historial **igual al orden de archivos** en disco, si **todas** las migraciones pasan.
- Si falla una migración: corrige la migración (o añade una **anterior** que cree las tablas mínimas que faltan), luego vuelve a ejecutar el reset.

### B) Local debe parecerse al remoto (recomendado si el baseline no alcanza)

- Usa el proyecto **enlazado** y flujos tipo **`supabase db pull`** / schema desde remoto según vuestra guía interna.
- El remoto ya tiene el esquema acumulado; el reset local desde solo migraciones del repo puede seguir fallando hasta que exista una **migración “foundation”** en el repo para tablas como `document_types` (o se amplíe el baseline).

### C) Reparar historial sin tocar esquema (avanzado)

- `supabase migration repair` para marcar versiones aplicadas/revertidas cuando el esquema ya coincide pero el historial no.
- Solo cuando sabes exactamente qué pasó; si no, pref A o B.

## Sincronizar copias del repo

Tras cambiar migraciones en **vento-shell** (canónico):

```powershell
.\scripts\sync-migrations.ps1
```

---

**Resumen:** el desfase no es un bug del CLI: es mezcla de **historial en BD**, **orden de archivos** y **dependencias no modeladas** (tablas/datos que existen en remoto pero no en el camino “solo migraciones + baseline” del repo). La solución estable es **reset limpio** cuando la cadena sea completa, o **alinear local con remoto** mientras se cierran esos huecos en migraciones/baseline.
