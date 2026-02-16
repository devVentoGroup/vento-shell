# Mapa de tablas por app – Vento OS

Auditoría de qué tablas usa cada aplicación, qué parece redundante y qué requiere pantalla de gestión.

---

## Resumen por app

| App | Tablas principales | Pantallas de gestión existentes | Pendientes |
|-----|--------------------|----------------------------------|------------|
| **NEXO** | Inventario, stock, remisiones, LOCs, productos | Catálogo, Ubicaciones, Entradas | site_supply_routes, sites, area_kinds, areas |
| **ORIGO** | Órdenes de compra, proveedores | Órdenes, Proveedores | — |
| **PASS** | Loyalty, rewards, users | (en app móvil) | — |
| **ANIMA** | Asistencia, turnos, empleados | Team, Invitations | — |
| **PULSO** | POS | (en app POS) | — |
| **Shell/Común** | apps, roles, permisos, sites, employees | Shell (login, SSO) | sites, roles, employee_sites |

---

## NEXO (Inventario)

| Tabla | Uso | Gestión actual | Notas |
|-------|-----|----------------|-------|
| `products` | Catálogo maestro | Catálogo (pestañas) | OK |
| `product_categories` | Categorías | Dentro de ficha producto | OK |
| `product_inventory_profiles` | Tipo inventario | Ficha producto | OK |
| `product_site_settings` | Insumos por sede | Ficha producto → Sedes | OK |
| `product_suppliers` | Proveedores por producto | Ficha producto | OK |
| `product_sku_aliases` | Aliases SKU | (probablemente no usado en UI) | Revisar |
| `product_sku_sequences` | Secuencias SKU | Auto | OK |
| `sites` | Sedes (Centro, Saudo, etc.) | **NO** – solo lectura en selects | **Pendiente** |
| `site_supply_routes` | Rutas satélite→Centro | **NO** – insertar en Supabase | **Pendiente** |
| `areas` | Áreas por sede | **NO** – solo lectura | **Pendiente** |
| `area_kinds` | Tipos de área | Solo lectura en selects | OK (catálogo pequeño) |
| `inventory_locations` | LOCs | Ubicaciones | OK |
| `inventory_stock_by_site` | Stock por sede | Stock, remisiones | OK |
| `inventory_stock_by_location` | Stock por LOC | Stock, traslados, conteo | OK |
| `inventory_movements` | Movimientos | Movimientos | OK |
| `inventory_entries` | Entradas | Entradas | OK |
| `inventory_entry_items` | Ítems de entrada | Entradas | OK |
| `inventory_transfers` | Traslados | Traslados | OK |
| `inventory_transfer_items` | Ítems traslado | Traslados | OK |
| `inventory_lpns` | LPNs/contenedores | LPNs | OK |
| `inventory_lpn_items` | Ítems en LPN | LPNs | OK |
| `restock_requests` | Remisiones | Remisiones | OK |
| `restock_request_items` | Ítems remisión | Remisiones | OK |
| `inventory_count_sessions` | Sesiones conteo | Conteo inicial | OK |
| `inventory_count_lines` | Líneas conteo | Conteo inicial | OK |
| `production_batches` | Lotes producción | Production batches | OK |
| `inventory_movement_types` | Tipos movimiento | Catálogo (readonly) | OK |
| `suppliers` | Proveedores | (ORIGO + ficha producto) | OK |
| `employees` | Empleados | ANIMA/Shell | OK |
| `employee_sites` | Empleado↔Sede | ANIMA Team | OK |

---

## ORIGO (Compras)

| Tabla | Uso | Gestión actual | Notas |
|-------|-----|----------------|-------|
| `purchase_orders` | Órdenes de compra | Órdenes | OK |
| `purchase_order_items` | Ítems OC | Órdenes | OK |
| `suppliers` | Proveedores | Proveedores | OK |
| `products` | Productos (para ítems) | Compartido NEXO | OK |

---

## PASS (Loyalty / App cliente)

| Tabla | Uso | Gestión actual | Notas |
|-------|-----|----------------|-------|
| `users` | Usuarios (Supabase Auth) | Auth | OK |
| `loyalty_rewards` | Premios | (admin externo?) | Revisar |
| `loyalty_redemptions` | Canjes | App móvil | OK |
| `loyalty_transactions` | Transacciones puntos | App | OK |
| `user_favorites` | Favoritos | App | OK |
| `user_feedback` | Feedback/ratings | App | OK |
| `account_deletion_requests` | Solicitudes baja | Función edge | OK |

---

## ANIMA (Asistencia / RRHH)

| Tabla | Uso | Gestión actual | Notas |
|-------|-----|----------------|-------|
| `employees` | Empleados | Team | OK |
| `employee_sites` | Empleado↔Sede | Team | OK |
| `sites` | Sedes | Team | OK |
| `roles` | Roles | Team, invitaciones | OK |
| `attendance_logs` | Check-in/out | App móvil | OK |
| `employee_shifts` | Turnos | (¿en ANIMA?) | Revisar |
| `staff_invitations` | Invitaciones | Invite | OK |

---

## PULSO (POS)

| Tabla | Uso | Gestión actual | Notas |
|-------|-----|----------------|-------|
| `pos_sessions` | Sesiones caja | POS | OK |
| `pos_cash_shifts` | Turnos efectivo | POS | OK |
| `pos_cash_movements` | Movimientos efectivo | POS | OK |
| `pos_payments` | Pagos | POS | OK |
| `pos_session_orders` | Órdenes por sesión | POS | OK |
| `orders` | Pedidos | POS/Pass | OK |
| `order_items` | Ítems pedido | POS | OK |
| `pos_modifiers` | Modificadores | POS | OK |
| `pos_modifier_options` | Opciones modificador | POS | OK |
| `pos_product_modifiers` | Modificador↔Producto | POS | OK |
| `pos_tables` | Mesas | POS | OK |
| `pos_zones` | Zonas | POS | OK |

---

## Shell / Común (permisos, auth)

| Tabla | Uso | Gestión actual | Notas |
|-------|-----|----------------|-------|
| `apps` | Aplicaciones | Supabase / seed | Catálogo pequeño |
| `app_permissions` | Permisos por app | Supabase | Catálogo |
| `role_permissions` | Rol↔Permiso | Supabase | Catálogo |
| `roles` | Roles | ANIMA | OK |
| `role_site_type_rules` | Reglas por tipo sede | Supabase | Avanzado |
| `employee_permissions` | Overrides por empleado | (¿existe UI?) | Revisar |
| `sites` | Sedes | **NO** – solo selects | **Pendiente** |
| `employee_settings` | Preferencias (sede activa) | Panel | OK |
| `employee_devices` | Dispositivos push | (backend) | OK |
| `employee_push_tokens` | Tokens push | (backend) | OK |

---

## Tablas posiblemente redundantes o poco usadas

| Tabla | Observación |
|-------|-------------|
| `asistencia_logs` | Parece legacy; `attendance_logs` es la actual (ANIMA) |
| `cost_centers` | No visto en código NEXO/ORIGO; ¿ORIGO futuro? |
| `document_types`, `documents` | ¿Qué app los usa? Revisar |
| `employee_areas` | Área por empleado; usado en permisos |
| `procurement_agreed_prices` | Precios acordados; ¿ORIGO? |
| `procurement_receptions` | Recepciones compras; ¿ORIGO? |
| `production_requests`, `production_request_items` | Producción; ¿FOGO? |
| `recipe_cards`, `recipe_steps`, `recipes` | Recetas; ¿FOGO? |
| `staging_insumos_import` | Staging import; ¿temporal? |
| `support_messages`, `support_tickets` | Soporte; ¿qué app? |
| `wallet_devices`, `wallet_passes` | Apple/Google Wallet; PASS |

---

## Prioridad de pantallas de gestión

### Alta (crítico para operación)

1. **Rutas de abastecimiento** (`site_supply_routes`) – NEXO  
   Sin esto, las remisiones no saben qué satélite abastece el Centro.

2. **Sedes** (`sites`) – Shell o NEXO  
   Crear/editar sedes, tipo (centro/satélite).

### Media

3. **Áreas** (`areas`) – NEXO  
   Áreas por sede (cocina, bar, etc.) para remisiones.

4. **Área kinds** (`area_kinds`) – NEXO  
   Catálogo de tipos de área (si se necesita editar).

### Baja

5. Roles, permisos – ya hay gestión en ANIMA.  
6. Catálogos pequeños (apps, movement_types) – se pueden dejar en Supabase o crear pantallas simples.

---

## Cómo leer este mapa

- **OK** = hay pantalla o flujo que lo gestiona.
- **Pendiente** = se requiere pantalla nueva.
- **Revisar** = uso no confirmado o posible redundancia.

---

*Última actualización: Auditoría inicial.*
