# Arquitectura de Migraciones Centralizadas

## Estructura

```
vento-shell/
  supabase/
    migrations/          ← Fuente canónica de todas las migraciones
      00000000000000_baseline.sql
      20260415000000_nexo_locations_validation.sql  ← Nueva migración
      ...
    MIGRATION_MANIFEST.md ← Inventario de migraciones

vento-nexo/
vento-fogo/
vento-origo/
vento-viso/
vento-pulso/
  (NO tienen migraciones locales - solo consumen desde vento-shell)
```

## Flujo de Trabajo

### 1. Crear Nueva Migración

**Siempre en vento-shell:**

```bash
cd vento-shell

# Crear archivo en supabase/migrations/
# Formato: YYYYMMDDHHMM_descripcion.sql
# Ejemplo: 20260415000000_nexo_locations_validation.sql

# Contenido:
-- Comentario descriptivo
CREATE TABLE ...;
ALTER TABLE ...;
INSERT INTO ...;
```

### 2. Registrar en Manifest

Agregar a `vento-shell/supabase/MIGRATION_MANIFEST.md`:

```markdown
## applied_remote
- 20260415000000_nexo_locations_validation.sql
```

### 3. Hacer Push a GitHub

```bash
cd vento-shell
git add supabase/migrations/20260415000000_nexo_locations_validation.sql
git add supabase/MIGRATION_MANIFEST.md
git commit -m "feat: nexo locations validation"
git push origin main
```

### 4. Sincronizar en Otros Repos (Opcional)

Si otro repo necesita la misma migración (ej: vento-fogo también usa Supabase):

```bash
# En vento-fogo
git fetch upstream  # Si está configurado
cp ../vento-shell/supabase/migrations/20260415000000_nexo_locations_validation.sql supabase/migrations/
git add supabase/migrations/
git commit -m "chore: sync migrations from vento-shell"
git push origin main
```

---

## Estructura de Nombres

**Formato:** `YYYYMMDDHHMM_app_descripcion.sql`

| Parte | Ejemplo | Descripción |
|-------|---------|-------------|
| `YYYYMMDDHHMM` | `202604150000` | Timestamp (año, mes, día, hora, minuto) |
| `app` | `nexo`, `fogo`, `anima`, `vital` | App o módulo afectado |
| `descripcion` | `locations_validation` | Descripción legible |

**Ejemplos válidos:**
- `20260415000000_nexo_locations_validation.sql`
- `20260415100000_fogo_production_recipes_rls.sql`
- `20260415110000_anima_attendance_sync.sql`

---

## Política de Migraciones

✅ **CENTRALIZAR en vento-shell:**
- Todas las migraciones SQL nuevas
- Cambios de schema
- Permisos y RLS
- Seeders de datos

❌ **NO en repos individuales:**
- Migraciones nunca van en vento-nexo, vento-fogo, etc.
- Esos repos solo consumen desde vento-shell
- Evita duplicados y conflictos

---

## Aplicar Migraciones a Supabase

### Opción A: Supabase CLI (recomendado)

```bash
cd vento-shell

# Listar migraciones pendientes
supabase migration list

# Aplicar todas las pendientes
supabase db push

# O especificar una
supabase db push --include-seed
```

### Opción B: SQL Editor en Supabase Console

```bash
# Copiar contenido del archivo SQL
cat supabase/migrations/20260415000000_nexo_locations_validation.sql

# Pegar en Supabase -> SQL Editor -> Ejecutar
```

### Opción C: API (para CI/CD)

```bash
curl -X POST https://api.supabase.co/v1/projects/{PROJECT_ID}/migrations \
  -H "Authorization: Bearer {API_KEY}" \
  --data-binary @supabase/migrations/20260415000000_nexo_locations_validation.sql
```

---

## Validación Post-Aplicación

Después de aplicar una migración:

```sql
-- Verificar tabla existe
SELECT * FROM public.locations_validation LIMIT 0;

-- Verificar permisos
SELECT * FROM public.app_permissions WHERE code = 'inventory.validation';

-- Verificar RLS policies
SELECT * FROM pg_policies WHERE tablename = 'locations_validation';

-- Verificar indices
SELECT * FROM pg_indexes WHERE tablename = 'locations_validation';
```

---

## Caso de Uso: Validación de LOCs (20260415)

### Migration Flow

1. **Creado en:** `vento-shell/supabase/migrations/20260415000000_nexo_locations_validation.sql`
   - Tabla: `locations_validation`
   - Permiso: `inventory.validation`
   - RLS: Solo gerentes y propietarios
   - Indices: 4 (para búsquedas rápidas)

2. **Registrado en:** `vento-shell/supabase/MIGRATION_MANIFEST.md`
   ```
   - 20260415000000_nexo_locations_validation.sql
   ```

3. **Sincronizado en:** GitHub
   ```
   vento-shell main branch
   └─ supabase/migrations/20260415000000_nexo_locations_validation.sql
   ```

4. **Eliminado de:** `vento-nexo`
   ```
   Removida: vento-nexo/supabase/migrations/20260415000000_locations_validation.sql
   Commit: "chore: migrate locations_validation to vento-shell"
   ```

5. **Aplicado a:** Supabase remota
   ```
   supabase db push
   → Tabla creada
   → Permisos asignados
   → RLS configurada
   ```

---

## Sincronización Multi-Repo

Si múltiples apps usan la misma BD (caso de Vento OS):

```
Supabase Remota (Única)
  ├─ Schema compartido (permisos, RLS, etc.)
  └─ Apps específicas (nexo, fogo, viso, etc.)

vento-shell (Fuente canónica)
  └─ supabase/migrations/
      ├─ 20260415000000_nexo_locations_validation.sql
      ├─ 20260415100000_fogo_production_recipes.sql
      └─ 20260415200000_vital_sports_profile.sql

vento-nexo (Consume)
  └─ (sin migraciones locales)

vento-fogo (Consume)
  └─ (sin migraciones locales)

vento-viso (Consume)
  └─ (sin migraciones locales)
```

---

## Checklist: Migración Nueva

- [ ] Crear archivo en `vento-shell/supabase/migrations/YYYYMMDDHHMM_app_descripcion.sql`
- [ ] Nombre sigue formato estándar
- [ ] SQL es idempotente (`if not exists`, `on conflict`)
- [ ] Incluye comentarios explicativos
- [ ] Actualizar `MIGRATION_MANIFEST.md`
- [ ] Commit y push en vento-shell
- [ ] Aplicar a Supabase remota (`supabase db push`)
- [ ] Validar en SQL Editor
- [ ] Si otro repo la necesita, sincronizar (copiar + commit)
- [ ] Documentar en PR/commits qué cambios hay

---

## Troubleshooting

### Error: "Migration already applied"

```
✗ Migration 20260415000000_nexo_locations_validation.sql already applied
```

**Solución:** Migration ya fue aplicada a Supabase. Ignorar.

### Error: "Table already exists"

```
✗ relation "locations_validation" already exists
```

**Solución:** Usar `CREATE TABLE IF NOT EXISTS`:

```sql
CREATE TABLE IF NOT EXISTS public.locations_validation (
  ...
);
```

### Error: "Permission denied"

```
✗ permission denied for schema public
```

**Solución:** Usar `CREATE TABLE ... ENABLE ROW LEVEL SECURITY`:

```sql
ALTER TABLE public.locations_validation ENABLE ROW LEVEL SECURITY;
```

### Reversible Migrations (si se necesita deshacer)

```sql
-- Down: revertir cambios
DROP TABLE IF EXISTS public.locations_validation CASCADE;
DELETE FROM public.app_permissions WHERE code = 'inventory.validation';
```

Pero en general, **no se deshacen migraciones** - en su lugar se crean migraciones nuevas que "arreglan" lo anterior.

---

## Ejemplos de Migraciones Previas

```
vento-shell/supabase/migrations/
├─ 20260117130000_permissions_core.sql     (roles, apps, permisos base)
├─ 20260209120000_seed_sites_vento.sql     (datos iniciales de sedes)
├─ 20260218000006_app_split_permissions.sql (limpieza de permisos)
├─ 20260310120000_nexo_inventory_ai.sql    (schema para IA)
├─ 20260315100000_employee_wallet.sql      (vento-pass)
├─ 20260324190000_talento_foundation.sql   (talento new app)
└─ 20260415000000_nexo_locations_validation.sql (validación de LOCs - NUEVA)
```

---

## Referencias

- [Supabase Migrations Docs](https://supabase.com/docs/guides/cli/managing-migrations)
- [Migration Best Practices](https://supabase.com/docs/guides/database/migrations)
- [Vento OS Schema](./supabase/schema.sql) - Vista completa del schema
- [MIGRATION_MANIFEST.md](./supabase/MIGRATION_MANIFEST.md) - Inventario
