# Supabase Schema Review (Vento OS)

## Scope y fuentes
- Fuente: supabase/migrations/*.sql en vento-platform.
- Nota: hay tablas reportadas en Supabase que no existen en migrations (schema drift).

## Hallazgos clave
- Roles: hay chequeos y funciones con listas distintas (cook/baker/pastry vs cocinero/panadero/repostero); requiere normalizacion.
- Duplicidad potencial: employees.site_id vs employee_sites; employees.area_id vs employee_areas.
- Permissions jsonb en employees parece legacy si se adopta el modelo roles/apps/permissions.
- RLS: varios modulos POS aparecen sin RLS en el dump de politicas (revisar).

## Cambios nuevos (permissions core)
- Migration nueva: `supabase/migrations/20260117130000_permissions_core.sql` en vento-shell.
- Agrega catalogos: roles, apps, app_permissions, role_permissions, employee_permissions, role_site_type_rules.
- Reemplaza el CHECK de roles por FK a roles y normaliza roles legacy (cook/baker/pastry).
- La validacion de rol por tipo de sede se mueve a tabla (role_site_type_rules).

### Nuevas tablas (permissions core)

#### roles
Status: OK

Purpose: Catalogo canonico de roles.

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| code | text | NO | - | - | Identificador canonico (owner, manager, etc). |
| name | text | NO | - | - | Nombre legible. |
| description | text | YES | - | - | Descripcion. |
| is_active | boolean | NO | true | - | Flag activo/inactivo. |
| created_at | timestamptz | NO | now() | - | Timestamp. |
| updated_at | timestamptz | NO | now() | - | Timestamp. |

#### role_site_type_rules
Status: OK

Purpose: Define que roles pueden existir en cada site_type.

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| role | text | NO | - | roles.code | Rol permitido. |
| site_type | site_type | NO | - | - | Tipo de sede. |
| is_allowed | boolean | NO | true | - | Flag permitido. |
| created_at | timestamptz | NO | now() | - | Timestamp. |

#### apps
Status: OK

Purpose: Catalogo de aplicaciones.

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| id | uuid | NO | gen_random_uuid() | - | Primary key. |
| code | text | NO | - | - | Codigo unico (nexo, fogo, etc). |
| name | text | NO | - | - | Nombre visible. |
| description | text | YES | - | - | Descripcion. |
| is_active | boolean | NO | true | - | Flag activo/inactivo. |
| created_at | timestamptz | NO | now() | - | Timestamp. |
| updated_at | timestamptz | NO | now() | - | Timestamp. |

#### app_permissions
Status: OK

Purpose: Catalogo de permisos por app.

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| id | uuid | NO | gen_random_uuid() | - | Primary key. |
| app_id | uuid | NO | - | apps.id | App. |
| code | text | NO | - | - | Codigo (inventory.stock, pos.main, etc). |
| name | text | NO | - | - | Nombre visible. |
| description | text | YES | - | - | Descripcion. |
| is_active | boolean | NO | true | - | Flag activo/inactivo. |
| created_at | timestamptz | NO | now() | - | Timestamp. |
| updated_at | timestamptz | NO | now() | - | Timestamp. |

#### role_permissions
Status: OK

Purpose: Permisos base por rol.

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| id | uuid | NO | gen_random_uuid() | - | Primary key. |
| role | text | NO | - | roles.code | Rol. |
| permission_id | uuid | NO | - | app_permissions.id | Permiso. |
| scope_type | permission_scope_type | NO | site | - | Alcance (global/site/site_type/area/area_kind). |
| scope_site_type | site_type | YES | - | - | Usa site_type cuando aplique. |
| scope_area_kind | text | YES | - | - | Usa areas.kind cuando aplique. |
| is_allowed | boolean | NO | true | - | Allow/deny. |
| created_at | timestamptz | NO | now() | - | Timestamp. |

#### employee_permissions
Status: OK

Purpose: Overrides por empleado (allow/deny).

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| id | uuid | NO | gen_random_uuid() | - | Primary key. |
| employee_id | uuid | NO | - | employees.id | Empleado. |
| permission_id | uuid | NO | - | app_permissions.id | Permiso. |
| is_allowed | boolean | NO | true | - | Allow/deny. |
| scope_type | permission_scope_type | NO | site | - | Alcance. |
| scope_site_id | uuid | YES | - | sites.id | Sede especifica (override). |
| scope_area_id | uuid | YES | - | areas.id | Area especifica (override). |
| scope_site_type | site_type | YES | - | - | Usa site_type cuando aplique. |
| scope_area_kind | text | YES | - | - | Usa areas.kind cuando aplique. |
| created_at | timestamptz | NO | now() | - | Timestamp. |

## Mapa por dominio
- Core / Staff: employees, employee_sites, employee_areas, employee_settings, areas, sites, cost_centers, staff_invitations
- Inventory: inventory_movements, inventory_movement_types, inventory_stock_by_site
- Procurement: procurement_receptions, procurement_reception_items, purchase_orders, purchase_order_items, suppliers, product_suppliers, procurement_agreed_prices
- Production: recipe_cards, recipe_steps, recipes, production_requests, production_request_items, production_batches
- POS: orders, order_items, pos_sessions, pos_session_orders, pos_payments, pos_cash_shifts, pos_cash_movements, pos_tables, pos_zones, pos_modifiers, pos_modifier_options, pos_product_modifiers, pos_order_item_modifiers
- Loyalty: loyalty_rewards, loyalty_redemptions, loyalty_transactions, user_favorites
- Users / Feedback: users, user_feedback
- Misc / Staging: staging_insumos_import

## Tablas (definidas en migrations)

### areas
Status: Review

Purpose: Areas internas por sede (cocina, bar, etc).

Notes:
- campo kind es texto libre; depende de normalizacion en datos

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| code | text | NO | - | - | Codigo corto o identificador humano. |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| is_active | boolean | NO | true | - | Flag activo/inactivo. |
| kind | text | NO | - | - | - |
| name | text | NO | - | - | Nombre visible. |
| site_id | uuid | NO | - | - | Referencia a sites.id. |

### cost_centers
Status: OK

Purpose: Centros de costo por sede.

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| created_at | timestamp with time zone | YES | now() | - | Timestamp de creacion. |
| current_month_spend | numeric | YES | 0 | - | - |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| is_active | boolean | YES | true | - | Flag activo/inactivo. |
| monthly_budget | numeric | YES | 0 | - | - |
| name | text | NO | - | - | Nombre visible. |
| site_id | uuid | YES | - | - | Referencia a sites.id. |

### employee_areas
Status: OK

Purpose: Relacion empleado-area (M2M).

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| area_id | uuid | NO | - | - | Referencia a areas.id. |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| employee_id | uuid | NO | - | - | Referencia a employees.id. |
| is_active | boolean | NO | true | - | Flag activo/inactivo. |
| is_primary | boolean | NO | false | - | - |

### employee_settings
Status: Review

Purpose: Preferencias por empleado (site/area seleccionado).

Notes:
- duplica parcialmente employee_sites/employee_areas pero como preferencia de UI

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| employee_id | uuid | NO | - | - | Referencia a employees.id. |
| selected_area_id | uuid | YES | - | - | FK id. |
| selected_site_id | uuid | YES | - | - | FK id. |
| updated_at | timestamp with time zone | NO | now() | - | Timestamp de ultima actualizacion. |

### employee_sites
Status: OK

Purpose: Relacion empleado-sede (M2M).

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| employee_id | uuid | NO | - | - | Referencia a employees.id. |
| is_active | boolean | NO | true | - | Flag activo/inactivo. |
| is_primary | boolean | NO | false | - | - |
| site_id | uuid | NO | - | - | Referencia a sites.id. |

### employees
Status: Review

Purpose: Staff interno vinculado a auth.users.

Notes:
- role es texto libre sin catalogo
- site_id coexiste con employee_sites; puede duplicar

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| alias | text | YES | - | - | - |
| area_id | uuid | YES | - | - | Referencia a areas.id. |
| full_name | text | NO | - | - | - |
| id | uuid | NO | - | - | Primary key (uuid). |
| is_active | boolean | YES | true | - | Flag activo/inactivo. |
| joined_at | timestamp with time zone | YES | now() | - | Timestamp. |
| permissions | jsonb | YES | '{}'::jsonb | - | - |
| pin_code | text | YES | - | - | - |
| role | text | NO | - | - | - |
| site_id | uuid | NO | - | - | Referencia a sites.id. |
| updated_at | timestamp with time zone | YES | now() | - | Timestamp de ultima actualizacion. |

### inventory_movement_types
Status: OK

Purpose: Catalogo de tipos de movimiento de inventario.

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| affects_stock | smallint | NO | - | - | - |
| code | text | YES | - | - | Codigo corto o identificador humano. |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| description | text | YES | - | - | Descripcion o notas libres. |
| is_active | boolean | NO | true | - | Flag activo/inactivo. |
| name | text | NO | - | - | Nombre visible. |

### inventory_movements
Status: OK

Purpose: Ledger de movimientos de inventario.

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| movement_type | text | NO | - | - | - |
| note | text | YES | - | - | - |
| product_id | uuid | NO | - | - | Referencia a products.id. |
| quantity | numeric | NO | - | - | Cantidad numerica. |
| related_order_id | uuid | YES | - | - | FK id. |
| related_production_batch_id | uuid | YES | - | - | FK id. |
| related_production_request_id | uuid | YES | - | - | FK id. |
| related_purchase_order_id | uuid | YES | - | - | FK id. |
| related_restock_request_id | uuid | YES | - | - | FK id. |
| site_id | uuid | NO | - | - | Referencia a sites.id. |
| unit_cost | numeric | YES | - | - | - |

### inventory_stock_by_site
Status: OK

Purpose: Stock consolidado por sede y producto.

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| avg_unit_cost | numeric | YES | - | - | - |
| current_qty | numeric | NO | '0'::numeric | - | - |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| max_qty | numeric | NO | '0'::numeric | - | - |
| min_qty | numeric | NO | '0'::numeric | - | - |
| product_id | uuid | NO | - | - | Referencia a products.id. |
| site_id | uuid | NO | - | - | Referencia a sites.id. |
| updated_at | timestamp with time zone | NO | now() | - | Timestamp de ultima actualizacion. |

### loyalty_redemptions
Status: OK

Purpose: Redenciones de fidelizacion.

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| metadata | jsonb | YES | '{}'::jsonb | - | - |
| order_id | uuid | YES | - | - | Referencia a orders.id. |
| points_spent | integer | NO | - | - | - |
| qr_code | text | YES | - | - | - |
| reward_id | uuid | NO | - | - | FK id. |
| status | text | NO | 'pending'::text | - | Estado de flujo. |
| user_id | uuid | NO | - | - | Referencia a users.id o auth.users.id. |
| validated_at | timestamp with time zone | YES | - | - | Timestamp. |

### loyalty_rewards
Status: OK

Purpose: Catalogo de rewards de fidelizacion.

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| code | text | NO | - | - | Codigo corto o identificador humano. |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| description | text | YES | - | - | Descripcion o notas libres. |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| is_active | boolean | NO | true | - | Flag activo/inactivo. |
| metadata | jsonb | YES | '{}'::jsonb | - | - |
| name | text | NO | - | - | Nombre visible. |
| points_cost | integer | NO | - | - | - |
| site_id | uuid | YES | - | - | Referencia a sites.id. |
| updated_at | timestamp with time zone | NO | now() | - | Timestamp de ultima actualizacion. |

### loyalty_transactions
Status: OK

Purpose: Movimientos de puntos de fidelizacion.

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| description | text | YES | - | - | Descripcion o notas libres. |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| kind | text | NO | - | - | - |
| metadata | jsonb | YES | '{}'::jsonb | - | - |
| order_id | uuid | YES | - | - | Referencia a orders.id. |
| points_delta | integer | NO | - | - | - |
| user_id | uuid | NO | - | - | Referencia a users.id o auth.users.id. |

### order_items
Status: OK

Purpose: Lineas de orden POS.

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| allergy_alert | text | YES | - | - | - |
| comp_reason | text | YES | - | - | - |
| course | text | YES | 'main'::text | - | - |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| is_comped | boolean | YES | false | - | - |
| notes | text | YES | - | - | - |
| order_id | uuid | NO | - | - | Referencia a orders.id. |
| product_id | uuid | NO | - | - | Referencia a products.id. |
| quantity | numeric | NO | '1'::numeric | - | Cantidad numerica. |
| seat_number | integer | YES | - | - | - |
| sent_at | timestamp with time zone | YES | - | - | Timestamp. |
| status | text | YES | 'pending'::text | - | Estado de flujo. |
| total_amount | numeric | NO | '0'::numeric | - | - |
| unit_price | numeric | NO | '0'::numeric | - | - |
| updated_at | timestamp with time zone | NO | now() | - | Timestamp de ultima actualizacion. |

### orders
Status: OK

Purpose: Ordenes POS/venta.

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| client_id | uuid | YES | - | - | FK id. |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| discount_amount | numeric | YES | 0 | - | - |
| discount_reason | text | YES | - | - | - |
| guest_info | jsonb | YES | '{}'::jsonb | - | - |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| inventory_processed | boolean | NO | false | - | - |
| loyalty_points_awarded | integer | NO | 0 | - | - |
| loyalty_processed | boolean | NO | false | - | - |
| notes | text | YES | - | - | - |
| order_type | text | NO | 'dine_in'::text | - | - |
| payment_status | text | NO | 'unpaid'::text | - | - |
| server_id | uuid | YES | - | - | FK id. |
| session_id | uuid | YES | - | - | FK id. |
| site_id | uuid | YES | - | - | Referencia a sites.id. |
| source | text | NO | 'vento_os'::text | - | - |
| split_type | text | YES | - | - | - |
| status | text | NO | 'pending'::text | - | Estado de flujo. |
| table_number | text | YES | - | - | - |
| total_amount | numeric | NO | '0'::numeric | - | - |
| updated_at | timestamp with time zone | NO | now() | - | Timestamp de ultima actualizacion. |
| void_reason | text | YES | - | - | - |
| voided_at | timestamp with time zone | YES | - | - | Timestamp. |
| voided_by | uuid | YES | - | - | - |

### pos_cash_movements
Status: Review

Purpose: Movimientos de caja POS.

Notes:
- verificar RLS: en datos actuales aparece sin RLS

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| amount | numeric | NO | - | - | - |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| created_by | uuid | YES | - | - | - |
| description | text | YES | - | - | Descripcion o notas libres. |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| order_id | uuid | YES | - | - | Referencia a orders.id. |
| payment_method | text | YES | - | - | - |
| reference | text | YES | - | - | - |
| shift_id | uuid | NO | - | - | FK id. |
| type | text | NO | - | - | - |

### pos_cash_shifts
Status: Review

Purpose: Turnos de caja POS.

Notes:
- verificar RLS

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| closed_at | timestamp with time zone | YES | - | - | Timestamp. |
| counted_amount | numeric | YES | - | - | - |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| difference | numeric | YES | - | - | - |
| employee_id | uuid | NO | - | - | Referencia a employees.id. |
| expected_amount | numeric | YES | - | - | - |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| notes | text | YES | - | - | - |
| opened_at | timestamp with time zone | NO | now() | - | Timestamp. |
| opening_amount | numeric | NO | 0 | - | - |
| site_id | uuid | NO | - | - | Referencia a sites.id. |
| status | text | NO | 'open'::text | - | Estado de flujo. |

### pos_modifier_options
Status: Review

Purpose: Opciones de modificadores POS.

Notes:
- verificar RLS

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| display_order | integer | YES | 0 | - | - |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| is_active | boolean | NO | true | - | Flag activo/inactivo. |
| is_default | boolean | YES | false | - | - |
| modifier_id | uuid | NO | - | - | FK id. |
| name | text | NO | - | - | Nombre visible. |
| price_adjustment | numeric | YES | 0 | - | - |

### pos_modifiers
Status: Review

Purpose: Modificadores POS.

Notes:
- verificar RLS

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| display_order | integer | YES | 0 | - | - |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| is_active | boolean | NO | true | - | Flag activo/inactivo. |
| is_required | boolean | YES | false | - | - |
| max_selections | integer | YES | 1 | - | - |
| min_selections | integer | YES | 0 | - | - |
| name | text | NO | - | - | Nombre visible. |
| site_id | uuid | YES | - | - | Referencia a sites.id. |
| type | text | NO | 'single'::text | - | - |

### pos_order_item_modifiers
Status: Review

Purpose: Modificadores aplicados a items.

Notes:
- verificar RLS

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| modifier_id | uuid | NO | - | - | FK id. |
| modifier_option_id | uuid | YES | - | - | FK id. |
| order_item_id | uuid | NO | - | - | FK id. |
| price_adjustment | numeric | YES | 0 | - | - |

### pos_payments
Status: Review

Purpose: Pagos POS.

Notes:
- verificar RLS

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| amount | numeric | NO | - | - | - |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| order_id | uuid | NO | - | - | Referencia a orders.id. |
| payment_method | text | NO | - | - | - |
| processed_by | uuid | YES | - | - | - |
| reference | text | YES | - | - | - |
| session_id | uuid | YES | - | - | FK id. |
| shift_id | uuid | YES | - | - | FK id. |
| status | text | NO | 'completed'::text | - | Estado de flujo. |
| tip_amount | numeric | YES | 0 | - | - |

### pos_product_modifiers
Status: Review

Purpose: Relacion producto-modificador.

Notes:
- verificar RLS

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| display_order | integer | YES | 0 | - | - |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| modifier_id | uuid | NO | - | - | FK id. |
| product_id | uuid | NO | - | - | Referencia a products.id. |

### pos_session_orders
Status: Review

Purpose: Ordenes asociadas a una sesion POS.

Notes:
- verificar RLS

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| course | text | YES | 'main'::text | - | - |
| course_status | text | YES | 'pending'::text | - | - |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| fired_at | timestamp with time zone | YES | - | - | Timestamp. |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| order_id | uuid | NO | - | - | Referencia a orders.id. |
| seat_number | integer | YES | - | - | - |
| session_id | uuid | NO | - | - | FK id. |

### pos_sessions
Status: Review

Purpose: Sesiones POS.

Notes:
- verificar RLS

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| closed_at | timestamp with time zone | YES | - | - | Timestamp. |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| notes | text | YES | - | - | - |
| opened_at | timestamp with time zone | NO | now() | - | Timestamp. |
| pax | integer | YES | 1 | - | - |
| server_id | uuid | YES | - | - | FK id. |
| site_id | uuid | NO | - | - | Referencia a sites.id. |
| status | text | NO | 'open'::text | - | Estado de flujo. |
| table_id | uuid | NO | - | - | FK id. |
| updated_at | timestamp with time zone | NO | now() | - | Timestamp de ultima actualizacion. |

### pos_tables
Status: Review

Purpose: Mesas POS.

Notes:
- verificar RLS

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| capacity | integer | NO | 4 | - | - |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| height | numeric | YES | 80 | - | - |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| is_active | boolean | NO | true | - | Flag activo/inactivo. |
| name | text | NO | - | - | Nombre visible. |
| position_x | numeric | NO | 0 | - | - |
| position_y | numeric | NO | 0 | - | - |
| rotation | numeric | YES | 0 | - | - |
| shape | text | NO | 'square'::text | - | - |
| site_id | uuid | NO | - | - | Referencia a sites.id. |
| table_number | integer | YES | - | - | - |
| updated_at | timestamp with time zone | NO | now() | - | Timestamp de ultima actualizacion. |
| width | numeric | YES | 80 | - | - |
| zone_id | uuid | YES | - | - | FK id. |

### pos_zones
Status: Review

Purpose: Zonas POS.

Notes:
- verificar RLS

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| color | text | YES | '#00d4ff'::text | - | - |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| display_order | integer | YES | 0 | - | - |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| is_active | boolean | NO | true | - | Flag activo/inactivo. |
| name | text | NO | - | - | Nombre visible. |
| site_id | uuid | NO | - | - | Referencia a sites.id. |

### procurement_agreed_prices
Status: OK

Purpose: Precios acordados por proveedor/producto.

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| agreed_price | numeric | NO | - | - | - |
| currency | text | YES | 'COP'::text | - | - |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| is_active | boolean | YES | true | - | Flag activo/inactivo. |
| product_id | uuid | NO | - | - | Referencia a products.id. |
| supplier_id | uuid | NO | - | - | FK id. |
| valid_from | timestamp with time zone | YES | now() | - | - |
| valid_until | timestamp with time zone | YES | - | - | - |

### procurement_reception_items
Status: OK

Purpose: Items de recepciones de compra.

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| discrepancy | numeric generated always as ((quantity_received - quantity_declared)) stored | YES | - | - | - |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| product_id | uuid | NO | - | - | Referencia a products.id. |
| quantity_declared | numeric | NO | - | - | - |
| quantity_received | numeric | NO | - | - | - |
| reception_id | uuid | NO | - | - | FK id. |

### procurement_receptions
Status: OK

Purpose: Recepciones de compra.

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| evidence_photo_url | text | NO | - | - | - |
| geolocation | jsonb | YES | - | - | - |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| notes | text | YES | - | - | - |
| purchase_order_id | uuid | NO | - | - | FK id. |
| received_at | timestamp with time zone | YES | now() | - | Timestamp. |
| received_by | uuid | NO | - | - | - |
| site_id | uuid | YES | - | - | Referencia a sites.id. |
| weight_source | text | YES | 'MANUAL'::text | - | - |

### product_categories
Status: OK

Purpose: Categorias de producto (jerarquia).

Notes:
- site_id opcional; definir si categorias son globales o por sede

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| description | text | YES | - | - | Descripcion o notas libres. |
| display_order | integer | YES | - | - | - |
| domain | text | YES | - | - | - |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| is_active | boolean | NO | true | - | Flag activo/inactivo. |
| name | text | NO | - | - | Nombre visible. |
| parent_id | uuid | YES | - | - | FK id. |
| slug | text | YES | - | - | - |
| updated_at | timestamp with time zone | YES | - | - | Timestamp de ultima actualizacion. |

### product_suppliers
Status: OK

Purpose: Relacion producto-proveedor.

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| currency | text | NO | 'COP'::text | - | - |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| is_primary | boolean | NO | false | - | - |
| lead_time_days | integer | YES | - | - | - |
| min_order_qty | numeric | YES | - | - | - |
| product_id | uuid | NO | - | - | Referencia a products.id. |
| purchase_price | numeric | YES | - | - | - |
| purchase_unit | text | YES | - | - | - |
| purchase_unit_size | numeric | YES | - | - | - |
| supplier_id | uuid | NO | - | - | FK id. |
| supplier_sku | text | YES | - | - | - |

### production_batches
Status: OK

Purpose: Lotes de produccion.

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| created_by | uuid | YES | - | - | - |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| notes | text | YES | - | - | - |
| produced_qty | numeric | NO | - | - | - |
| produced_unit | text | NO | - | - | - |
| product_id | uuid | NO | - | - | Referencia a products.id. |
| recipe_card_id | uuid | YES | - | - | FK id. |
| site_id | uuid | NO | - | - | Referencia a sites.id. |
| status | text | NO | 'posted'::text | - | Estado de flujo. |
| total_cost | numeric | YES | - | - | - |
| unit_cost | numeric | YES | - | - | - |

### production_request_items
Status: OK

Purpose: Items de solicitudes de produccion.

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| loaded_quantity | numeric | NO | '0'::numeric | - | - |
| produced_quantity | numeric | NO | '0'::numeric | - | - |
| product_id | uuid | NO | - | - | Referencia a products.id. |
| quantity | numeric | YES | '0'::numeric | - | Cantidad numerica. |
| received_quantity | numeric | NO | '0'::numeric | - | - |
| recipe_id | uuid | YES | - | - | FK id. |
| request_id | uuid | NO | - | - | FK id. |
| requested_quantity | numeric | NO | '0'::numeric | - | - |
| stage_status | text | NO | '''pending'''::text | - | - |
| unit | text | YES | - | - | Unidad de medida. |

### production_requests
Status: OK

Purpose: Solicitudes de produccion.

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| created_by | uuid | YES | - | - | - |
| from_location | text | NO | - | - | - |
| from_site_id | uuid | YES | - | - | FK id. |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| needed_for_date | date | YES | - | - | - |
| notes | text | YES | - | - | - |
| status | text | NO | '''pending'''::text | - | Estado de flujo. |
| to_location | text | NO | - | - | - |
| to_site_id | uuid | YES | - | - | FK id. |

### products
Status: Review

Purpose: Catalogo de productos.

Notes:
- product_type es texto libre; validar consistencia

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| category_id | uuid | NO | - | - | FK id. |
| cost | numeric | YES | - | - | - |
| cost_original | numeric | YES | - | - | - |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| description | text | YES | - | - | Descripcion o notas libres. |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| is_active | boolean | NO | true | - | Flag activo/inactivo. |
| name | text | NO | - | - | Nombre visible. |
| price | numeric | YES | - | - | - |
| product_type | text | NO | 'venta'::text | - | - |
| sku | text | YES | - | - | - |
| unit | text | NO | - | - | Unidad de medida. |
| updated_at | timestamp with time zone | NO | now() | - | Timestamp de ultima actualizacion. |

### purchase_order_items
Status: OK

Purpose: Items de ordenes de compra.

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| line_total | numeric | YES | - | - | - |
| product_id | uuid | NO | - | - | Referencia a products.id. |
| purchase_order_id | uuid | NO | - | - | FK id. |
| quantity_ordered | numeric | NO | - | - | - |
| quantity_received | numeric | YES | - | - | - |
| unit | text | YES | - | - | Unidad de medida. |
| unit_cost | numeric | NO | - | - | - |

### purchase_orders
Status: OK

Purpose: Ordenes de compra.

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| approval_date | timestamp with time zone | YES | - | - | - |
| approved_by | uuid | YES | - | - | - |
| cost_center_id | uuid | YES | - | - | FK id. |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| created_by | uuid | YES | auth.uid() | - | - |
| currency | text | NO | 'COP'::text | - | - |
| expected_at | timestamp with time zone | YES | - | - | Timestamp. |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| notes | text | YES | - | - | - |
| received_at | timestamp with time zone | YES | - | - | Timestamp. |
| site_id | uuid | NO | - | - | Referencia a sites.id. |
| status | text | NO | 'draft'::text | - | Estado de flujo. |
| supplier_id | uuid | NO | - | - | FK id. |
| total_amount | numeric | YES | - | - | - |

### recipe_cards
Status: OK

Purpose: Ficha de receta (metadatos, scope, status).

Notes:
- status enum; requiere gobierno de publicacion

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| area | text | YES | - | - | - |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| difficulty | text | YES | - | - | - |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| is_active | boolean | NO | true | - | Flag activo/inactivo. |
| portion_size | numeric | YES | - | - | - |
| portion_unit | text | YES | - | - | - |
| prep_time_minutes | integer | YES | - | - | - |
| product_id | uuid | NO | - | - | Referencia a products.id. |
| shelf_life_days | integer | YES | - | - | - |
| status | public.recipe_status | NO | 'draft' | - | Estado de flujo. |
| updated_at | timestamp with time zone | NO | now() | - | Timestamp de ultima actualizacion. |
| yield_qty | numeric | NO | 1 | - | - |
| yield_unit | text | NO | - | - | - |

### recipe_steps
Status: OK

Purpose: Pasos de recetas.

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| created_at | timestamptz | NO | now() | - | Timestamp de creacion. |
| description | text | NO | - | - | Descripcion o notas libres. |
| id | uuid | YES | gen_random_uuid() | - | Primary key (uuid). |
| image_path | text | YES | - | - | - |
| recipe_card_id | uuid | NO | - | public.recipe_cards(id) | FK id. |
| step_number | integer | NO | - | - | - |
| time_minutes | integer | YES | - | - | - |
| tip | text | YES | - | - | - |
| updated_at | timestamptz | NO | now() | - | Timestamp de ultima actualizacion. |

### recipes
Status: OK

Purpose: Ingredientes/cantidades por receta.

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| ingredient_product_id | uuid | YES | - | - | FK id. |
| is_active | boolean | NO | true | - | Flag activo/inactivo. |
| product_id | uuid | NO | - | - | Referencia a products.id. |
| quantity | numeric | NO | '0'::numeric | - | Cantidad numerica. |
| updated_at | timestamp with time zone | NO | now() | - | Timestamp de ultima actualizacion. |

### restock_request_items
Status: OK

Purpose: Items de solicitudes de reabastecimiento.

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| product_id | uuid | NO | - | - | Referencia a products.id. |
| quantity | numeric | NO | '0'::numeric | - | Cantidad numerica. |
| request_id | uuid | NO | - | - | FK id. |
| transfer_currency | text | YES | - | - | - |
| transfer_total | numeric | YES | - | - | - |
| transfer_unit_price | numeric | YES | - | - | - |
| unit | text | YES | - | - | Unidad de medida. |

### restock_requests
Status: OK

Purpose: Solicitudes de reabastecimiento entre sedes.

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| created_by | uuid | YES | - | - | - |
| expected_date | date | YES | - | - | - |
| from_location | text | NO | - | - | - |
| from_site_id | uuid | YES | - | - | FK id. |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| internal_supplier_site_id | uuid | YES | - | - | FK id. |
| notes | text | YES | - | - | - |
| pricing_mode | text | NO | 'none'::text | - | - |
| pricing_status | text | NO | 'draft'::text | - | - |
| status | text | NO | '''pending'''::text | - | Estado de flujo. |
| to_location | text | NO | - | - | - |
| to_site_id | uuid | YES | - | - | FK id. |

### sites
Status: Review

Purpose: Sedes/entidades operativas.

Notes:
- type y site_kind son texto libre; definir catalogo
- falta bandera explicita para production_center vs satellite

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| address | text | YES | - | - | - |
| checkin_radius_meters | integer | YES | 50 | - | - |
| code | text | NO | - | - | Codigo corto o identificador humano. |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| is_active | boolean | NO | true | - | Flag activo/inactivo. |
| latitude | numeric(10,8) | YES | - | - | - |
| longitude | numeric(11,8) | YES | - | - | - |
| name | text | NO | - | - | Nombre visible. |
| site_kind | text | NO | - | - | - |
| site_type | public.site_type | NO | 'satellite'::public.site_type | - | - |
| type | text | NO | - | - | - |

### staff_invitations
Status: Review

Purpose: Invitaciones de staff.

Notes:
- verificar si sigue en uso

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| accepted_at | timestamp with time zone | YES | - | - | Timestamp. |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| created_by | uuid | YES | - | - | - |
| email | text | YES | - | - | - |
| expires_at | timestamp with time zone | YES | - | - | Timestamp. |
| full_name | text | YES | - | - | - |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| staff_area | text | YES | - | - | - |
| staff_role | text | YES | - | - | - |
| staff_site_id | uuid | YES | - | - | FK id. |
| status | text | NO | 'pending'::text | - | Estado de flujo. |
| token | text | NO | - | - | - |

### staging_insumos_import
Status: Legacy

Purpose: Staging temporal para import de insumos.

Notes:
- tabla temporal; evaluar limpieza o mover a schema staging

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| area | text | YES | - | - | - |
| base_unit | text | YES | - | - | - |
| fecha | text | YES | - | - | - |
| issues | text | YES | - | - | - |
| precio_cop | text | YES | - | - | - |
| precio_raw | text | YES | - | - | - |
| presentacion_raw | text | YES | - | - | - |
| producto | text | YES | - | - | - |
| proveedor | text | YES | - | - | - |
| purchase_unit | text | YES | - | - | - |
| purchase_unit_size | text | YES | - | - | - |
| unit_token | text | YES | - | - | - |

### suppliers
Status: OK

Purpose: Proveedores.

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| address | text | YES | - | - | - |
| contact_name | text | YES | - | - | - |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| email | text | YES | - | - | - |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| is_active | boolean | NO | true | - | Flag activo/inactivo. |
| name | text | NO | - | - | Nombre visible. |
| notes | text | YES | - | - | - |
| phone | text | YES | - | - | - |
| tax_id | text | YES | - | - | FK id. |
| updated_at | timestamp with time zone | YES | - | - | Timestamp de ultima actualizacion. |

### user_favorites
Status: OK

Purpose: Favoritos del usuario (loyalty rewards).

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| reward_id | uuid | NO | - | - | FK id. |
| user_id | uuid | NO | - | - | Referencia a users.id o auth.users.id. |

### user_feedback
Status: OK

Purpose: Feedback de usuarios/empleados.

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| category | text | YES | - | - | - |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| feedback_text | text | YES | - | - | - |
| id | uuid | NO | gen_random_uuid() | - | Primary key (uuid). |
| metadata | jsonb | YES | '{}'::jsonb | - | - |
| rating | integer | NO | - | - | - |
| resolution_notes | text | YES | - | - | - |
| reviewed_at | timestamp with time zone | YES | - | - | Timestamp. |
| reviewed_by | uuid | YES | - | - | - |
| site_id | uuid | YES | - | - | Referencia a sites.id. |
| status | text | NO | 'pending'::text | - | Estado de flujo. |
| updated_at | timestamp with time zone | NO | now() | - | Timestamp de ultima actualizacion. |
| user_id | uuid | NO | - | - | Referencia a users.id o auth.users.id. |

### users
Status: Review

Purpose: Perfil extendido de usuarios (clientes).

Notes:
- duplica auth.users; mantener sincronizacion

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| birth_date | date | YES | - | - | - |
| created_at | timestamp with time zone | NO | now() | - | Timestamp de creacion. |
| document_id | text | YES | - | - | FK id. |
| document_type | text | YES | - | - | - |
| email | text | YES | - | - | - |
| full_name | text | YES | - | - | - |
| has_reviewed_google | boolean | YES | false | - | - |
| id | uuid | NO | - | - | Primary key (uuid). |
| is_active | boolean | NO | true | - | Flag activo/inactivo. |
| is_client | boolean | NO | true | - | - |
| last_review_prompt_date | timestamp with time zone | YES | - | - | - |
| loyalty_points | integer | NO | 0 | - | - |
| marketing_opt_in | boolean | NO | false | - | - |
| phone | text | YES | - | - | - |
| role | text | NO | 'client'::text | - | - |
| updated_at | timestamp with time zone | NO | now() | - | Timestamp de ultima actualizacion. |

## Tablas reportadas en Supabase pero no presentes en migrations
Estas tablas requieren migracion o export completo de schema para documentar al 100%.

### _backup_inventory_movements_initial_count
Status: Legacy

Purpose: respaldo temporal de movimientos iniciales.

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| id | uuid | YES | - | - | - |
| site_id | uuid | YES | - | - | - |
| product_id | uuid | YES | - | - | - |
| movement_type | text | YES | - | - | - |
| quantity | numeric | YES | - | - | - |
| note | text | YES | - | - | - |
| related_order_id | uuid | YES | - | - | - |
| related_production_request_id | uuid | YES | - | - | - |
| related_restock_request_id | uuid | YES | - | - | - |
| created_at | timestamp with time zone | YES | - | - | - |
| related_purchase_order_id | uuid | YES | - | - | - |
| unit_cost | numeric | YES | - | - | - |
| related_production_batch_id | uuid | YES | - | - | - |

### asistencia_logs
Status: Review

Purpose: logs legacy de asistencia (duplicado con attendance_logs).

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| id | uuid | YES | - | - | - |
| empleado_nombre | text | YES | - | - | - |
| empleado_id | text | YES | - | - | - |
| fecha_hora | timestamp with time zone | YES | - | - | - |
| sucursal | text | YES | - | - | - |
| created_at | timestamp with time zone | YES | - | - | - |

### attendance_logs
Status: Review

Purpose: logs de asistencia (nuevo).

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| id | uuid | YES | - | - | - |
| employee_id | uuid | YES | - | - | - |
| site_id | uuid | YES | - | - | - |
| action | text | YES | - | - | - |
| source | text | YES | - | - | - |
| occurred_at | timestamp with time zone | YES | - | - | - |
| latitude | numeric | YES | - | - | - |
| longitude | numeric | YES | - | - | - |
| accuracy_meters | numeric | YES | - | - | - |
| device_info | jsonb | YES | - | - | - |
| notes | text | YES | - | - | - |
| created_at | timestamp with time zone | YES | - | - | - |

### inventory_locations
Status: Review

Purpose: ubicaciones fisicas de inventario.

Note: columnas inferidas desde app; falta migration oficial.

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| id | uuid | YES | - | - | - |
| site_id | uuid | YES | - | - | - |
| code | text | YES | - | - | - |
| zone | text | YES | - | - | - |
| aisle | text | YES | - | - | - |
| level | text | YES | - | - | - |
| description | text | YES | - | - | - |
| is_active | boolean | YES | - | - | - |
| capacity_units | numeric | YES | - | - | - |
| location_type | text | YES | - | - | - |
| created_at | timestamp with time zone | YES | - | - | - |
| updated_at | timestamp with time zone | YES | - | - | - |

### inventory_lpns
Status: Review

Purpose: contenedores LPN por sede.

Note: columnas inferidas desde app; falta migration oficial.

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| id | uuid | YES | - | - | - |
| site_id | uuid | YES | - | - | - |
| code | text | YES | - | - | - |
| location_id | uuid | YES | - | - | - |
| label | text | YES | - | - | - |
| notes | text | YES | - | - | - |
| created_by | uuid | YES | - | - | - |
| created_at | timestamp with time zone | YES | - | - | - |
| updated_at | timestamp with time zone | YES | - | - | - |

### inventory_lpn_items
Status: Review

Purpose: items dentro de un LPN.

Note: columnas inferidas desde app; falta migration oficial.

| column | type | null | default | references | notes |
| --- | --- | --- | --- | --- | --- |
| id | uuid | YES | - | - | - |
| lpn_id | uuid | YES | - | - | - |
| product_id | uuid | YES | - | - | - |
| quantity | numeric | YES | - | - | - |
| unit | text | YES | - | - | - |
| lot_number | text | YES | - | - | - |
| expiry_date | date | YES | - | - | - |
| received_at | timestamp with time zone | YES | - | - | - |
| cost_per_unit | numeric | YES | - | - | - |
| created_at | timestamp with time zone | YES | - | - | - |
| updated_at | timestamp with time zone | YES | - | - | - |
