# Limpieza transaccional de pruebas (Ops V2)

Fecha: 2026-04-14

## Ejecutado

- Migracion aplicada: `20260414164000_ops_v2_cleanup_test_orders_stock_movements.sql`
- Sincronizacion de migraciones ejecutada.

## Tablas limpiadas (0 registros)

- `purchase_orders`
- `purchase_order_items`
- `restock_requests`
- `restock_request_items`
- `procurement_receptions`
- `procurement_reception_items`
- `inventory_entries`
- `inventory_entry_items`
- `inventory_transfers`
- `inventory_transfer_items`
- `inventory_movements`
- `inventory_stock_by_location`
- `inventory_stock_by_site`
- `inventory_lpns`
- `inventory_lpn_items`
- `production_requests`
- `production_request_items`
- `production_batches`
- `production_batch_consumptions`

## Tablas oficiales preservadas

- `products`: 466
- `product_suppliers`: 255
- `suppliers`: 88
- `recipe_cards`: 37
- `recipes`: 203
- `recipe_steps`: 96

## Nota

No se modificaron fichas maestras de productos, proveedores ni recetas.
