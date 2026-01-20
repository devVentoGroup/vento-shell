# Diagnóstico Supabase antes de aplicar migración Conteo inicial

**Objetivo:** Ver el estado real de tu proyecto Supabase (qué migraciones están aplicadas, qué datos y políticas existen) para no aplicar cambios a ciegas.

**Actualización tras consultas (supabase/consultas/):** En tu BD ya existe `initial_count` en `inventory_movement_types`. La migración **no inserta** `count`; el wizard usa `movement_type='initial_count'`. Las políticas se actualizan para añadir `nexo.inventory.counts`.

---

## 1. Qué hay en el repo (orden de migraciones)

| Orden | Archivo | Qué toca en inventory_* |
|-------|---------|-------------------------|
| 1 | `00000000000000_baseline.sql` | Crea `inventory_movement_types`, `inventory_movements`, `inventory_stock_by_site`. Crea políticas `inventory_movements_insert_roles`, `inventory_movements_select_site`, `inventory_movements_update_owner`, `inventory_stock_select_site`, `inventory_stock_write_manager`. **No inserta filas** en `inventory_movement_types`. Usa `purchase_in`, `transfer_out`, `transfer_in` en funciones. |
| 2 | `20260117130000_permissions_core.sql` | Define `has_permission`, `app_permissions` (incl. `inventory.counts`), etc. Reemplaza `inventory_movements_insert_roles` por una con roles legacy. |
| 3 | `20260118193000_remissions_production.sql` | Funciones que insertan en `inventory_movements` con `transfer_out` y `transfer_in`, y en `inventory_stock_by_site`. **Dependen de que existan** esos códigos en `inventory_movement_types`. |
| 4 | `20260118195000_nexo_rls_permissions.sql` | Añade `created_by` a `inventory_movements`. **Elimina** `inventory_movements_insert_roles`, `inventory_movements_select_site`, `inventory_movements_update_owner`, `inventory_stock_select_site`, `inventory_stock_write_manager`. **Crea** `inventory_movements_insert_permission`, `inventory_movements_select_permission`, `inventory_stock_*_permission` (insert/update) usando `has_permission('nexo.inventory.*', site_id)`. |
| 5 | `20260120120000_product_site_settings.sql` | Tabla `product_site_settings`. No toca inventory_movements ni inventory_stock. |
| 6 | `20260122120000_nexo_count_movement_type.sql` | **Sustituye** las políticas `inventory_movements_insert_permission`, `inventory_stock_insert_permission`, `inventory_stock_update_permission` por versiones que **añaden** `has_permission('nexo.inventory.counts', site_id)`. No inserta en `inventory_movement_types` (se usa `initial_count`, que ya existe en tu BD). |

---

## 2. Qué asume la migración de Conteo (20260122120000)

- Que **20260118195000_nexo_rls_permissions** está aplicada: existen las políticas `inventory_movements_insert_permission`, `inventory_stock_insert_permission`, `inventory_stock_update_permission`. La migración hace `DROP` de esas y `CREATE` de unas nuevas con un `OR` extra.  
  Si 20260118 **no** está aplicada, el `DROP` no borra nada y el `CREATE` añade políticas nuevas; podrías acabar con políticas duplicadas o distintas a las que esperas.

- Que existe la función `has_permission` (de **20260117130000_permissions_core**). Si no, las políticas que la usan fallarán.

- Que existe el tipo `initial_count` en `inventory_movement_types` (en tu BD ya está). La migración **no inserta** tipos; el API usa `movement_type='initial_count'`.

---

## 3. Consultas para ejecutar en el SQL Editor de Supabase

Copia y ejecuta en tu proyecto. Así vemos el estado real antes de aplicar la migración de Conteo.

### A) Migraciones aplicadas

```sql
select * from supabase_migrations.schema_migrations
order by version;
```



Indica qué `version` te salen (o pégalas). Con eso vemos si tienes baseline, 20260117, 20260118, 20260120.

### B) Tipos en inventory_movement_types

```sql
select code, name, affects_stock, is_active
from public.inventory_movement_types
order by code;
```

El wizard de Conteo inicial usa `movement_type = 'initial_count'`. Debe existir en la tabla (en tu BD ya está).

### C) Políticas actuales en inventory_movements

```sql
select policyname, cmd, qual, with_check
from pg_policies
where tablename = 'inventory_movements'
order by policyname;
```

Esperado si 20260118 está aplicada: `inventory_movements_insert_permission`, `inventory_movements_select_permission`.  
Si ves `inventory_movements_insert_roles`, 20260118 no está aplicada.

### D) Políticas actuales en inventory_stock_by_site

```sql
select policyname, cmd, qual, with_check
from pg_policies
where tablename = 'inventory_stock_by_site'
order by policyname;
```

Esperado si 20260118 está aplicada: `inventory_stock_insert_permission`, `inventory_stock_update_permission`, `inventory_stock_select_permission`.  
Si ves `inventory_stock_write_manager`, 20260118 no está aplicada.

### E) Columna created_by en inventory_movements

```sql
select column_name, data_type, column_default
from information_schema.columns
where table_schema = 'public' and table_name = 'inventory_movements'
  and column_name = 'created_by';
```

Si no sale ninguna fila, 20260118 no está aplicada (la migración de Conteo no toca `created_by`).

### F) Función has_permission

```sql
select routine_name
from information_schema.routines
where routine_schema = 'public' and routine_name = 'has_permission';
```

Si no existe, 20260117 (o la migración que la crea) no está aplicada.

---

## 4. Cómo seguir

1. Ejecuta las consultas de la sección 3 y guarda los resultados (o descríbelos).
2. Con eso se puede:
   - Decir si es seguro aplicar `20260122120000_nexo_count_movement_type.sql` tal cual.
   - O proponer una versión ajustada (por ejemplo, si 20260118 no está aplicada).
3. No apliques la migración de Conteo hasta tener claro que 20260117 y 20260118 están aplicadas (o hasta que adaptemos la migración a tu estado).

---

## 5. Sobre `schema.sql` del repo

`schema.sql` en el repo parece reflejar solo el **baseline** (políticas viejas, sin `created_by`, etc.). No incorpora 20260118 ni 20260120. **No uses schema.sql como referencia del estado real** de tu Supabase; usa las consultas de la sección 3.

---

## 6. Cómo actualizar `schema.sql` con Supabase CLI

Para que `supabase/schema.sql` refleje el estado **actual** de tu proyecto remoto:

### Requisito

- [Supabase CLI](https://supabase.com/docs/guides/cli) instalado.
- Proyecto enlazado: `supabase link --project-ref TU_PROJECT_REF` (desde la raíz del repo, p. ej. `vento-shell/`).

### Exportar solo el schema (para `schema.sql`)

Desde la raíz donde está la carpeta `supabase/` (p. ej. `vento-shell/`):

```bash
supabase db dump -f supabase/schema.sql
```

Eso **sobrescribe** `supabase/schema.sql` con un dump del schema de la BD remota (tablas, tipos, funciones, políticas, etc.; **sin datos**).

### Opciones útiles

- Incluir otros esquemas (p. ej. `auth`, `storage`):

  ```bash
  supabase db dump -f supabase/schema.sql --schema public,auth,storage
  ```

- Solo ver el SQL sin escribir en disco: quita `-f supabase/schema.sql`.

### Alternativa: `supabase db pull`

Genera una **nueva migración** con las diferencias entre el remoto y tu historial de migraciones, en `supabase/migrations/`. No reemplaza `schema.sql`:

```bash
supabase db pull
```

Si quieres mantener `schema.sql` como copia del schema actual, usa `supabase db dump -f supabase/schema.sql` después de aplicar migraciones o de hacer cambios en el remoto.
