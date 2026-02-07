# Schema único – Nexo, Origo y apps

La base de datos está definida en **vento-shell/supabase**: `schema.sql` (dump de referencia) y **migrations/** (fuente de verdad aplicada). Todas las aplicaciones (Nexo, Origo, Shell, etc.) usan el **mismo proyecto Supabase**.

---

## Auth y permisos

### RPC `has_permission(p_permission_code, p_site_id?, p_area_id?)`

- Resuelve `p_permission_code` como `app_code + '.' + permission_code` (ej. `origo.access`, `nexo.inventory.entries`).
- Busca en `app_permissions` + `apps` el permiso; luego comprueba `employee_permissions` (overrides) y `role_permissions` (por rol), con scope (global, site, site_type, area, area_kind).
- Requiere empleado activo en `employees` con `role` en `roles`.

### Catálogos

| Tabla | Uso |
|-------|-----|
| **apps** | Aplicaciones (nexo, origo, shell, pulso, fogo, etc.). |
| **app_permissions** | Permisos por app (ej. `access`, `inventory.stock`, `inventory.entries`). |
| **roles** | Roles canónicos (propietario, gerente_general, gerente, bodeguero, …). |
| **role_permissions** | Asignación rol → permiso + scope. |
| **employee_permissions** | Overrides por empleado (opcional). |

### ORIGO en el schema

- **App**: en `20260117130000_permissions_core.sql` ya existe `INSERT ... ('origo', 'ORIGO', 'Compras')` en `apps`.
- **Permiso `access`**: se inserta para **todas** las apps con `insert into app_permissions (app_id, code, name, description) select id, 'access', ... from public.apps` → existe **origo.access**.
- **Quién tiene origo.access**:
  - **propietario** y **gerente_general**: tienen *todos* los permisos (scope global) → ya tienen origo.access.
  - **gerente**: tiene todos los permisos con scope site → ya tiene origo.access.

Conclusión: **no hace falta ninguna migración** para que Origo funcione con auth. Los usuarios con rol propietario, gerente_general o gerente ya pueden entrar a ORIGO.

Si más adelante quieres dar acceso a un rol solo-compras (ej. `compras` o `bodeguero` solo a Origo), se puede añadir un `INSERT` en `role_permissions` para ese rol y el permiso `origo.access`.

---

## Tablas usadas por Nexo

- **employees**, **employee_sites**, **sites** – auth y sede actual.
- **inventory_*** (locations, movements, stock_by_site, stock_by_location, entries, entry_items, transfers, etc.).
- **restock_requests**, **restock_request_items** – remisiones.
- **products**, **product_inventory_profiles**, **product_site_settings**, **product_suppliers**.
- **suppliers** – proveedores (compartida con Origo).
- **inventory_count_sessions**, **inventory_count_lines** (migración 20250203…).

RLS en tablas de inventario usa `has_permission('nexo.inventory.*', site_id)`.

---

## Tablas usadas por Origo (actual / futuro)

- **employees**, **employee_sites**, **sites** – mismos que Nexo (VentoShell y guard).
- **suppliers** – misma tabla que Nexo para el catálogo de proveedores.
- **purchase_orders**, **purchase_order_items** – **no existen aún** en el schema. Cuando se implemente el CRUD de OC, habrá que añadir una migración con estas tablas.

---

## Resumen

| Tema | Estado |
|------|--------|
| Base única para todas las apps | Sí – vento-shell/supabase |
| has_permission | Sí – en schema y migrations |
| App ORIGO en apps | Sí – en 20260117130000 |
| Permiso origo.access | Sí – creado con “access” por app |
| Roles con acceso a Origo | propietario, gerente_general, gerente |
| employees / employee_sites / sites | Sí – para Shell y guard |
| suppliers | Sí – compartida Nexo/Origo |
| purchase_orders / items | No – pendiente de migración |

Las aplicaciones Nexo y Origo deben usar las **mismas** variables de entorno de Supabase (`NEXT_PUBLIC_SUPABASE_URL`, `NEXT_PUBLIC_SUPABASE_ANON_KEY`) para apuntar a esta base.
