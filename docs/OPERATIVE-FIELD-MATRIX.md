# Operative Field Matrix

## Scope
This matrix defines which app owns each critical operative field in the shared Supabase schema.

Rules:
- Every critical field must have a frontend owner screen.
- If a field has no operative use, mark it as `deprecated` before dropping it.
- Canonical DB migrations are created only in `vento-shell/supabase/migrations`.

## Inventory Core (NEXO)
| Table.field | Owner screen | Required | Operative reason | Status |
| --- | --- | --- | --- | --- |
| `products.name` | Nexo / Catalog / New + Edit | required | Product identity in all flows | active |
| `products.sku` | Nexo / Catalog / New + Edit | required on create | Unique operative code | active |
| `products.category_id` | Nexo / Catalog / New + Edit | required | Catalog governance and filters | active |
| `products.stock_unit_code` | Nexo / Catalog / Storage step | required (inventory products) | Canonical stock/cost/recipe unit | active |
| `products.cost` | Nexo / Catalog (read) + Origo receipts | optional in UI, required in logic | Weighted average operative cost | active |
| `product_site_settings.site_id` | Nexo / Catalog / Site availability | required per row | Product visibility by site | active |
| `product_site_settings.is_active` | Nexo / Catalog / Site availability | required per row | Enable/disable usage by site | active |
| `product_site_settings.audience` | Nexo / Catalog / Site availability | required per row | Saudo/VCF/internal audience gating | active |
| `product_site_settings.default_area_id` | Nexo / Catalog / Site availability | optional | Default destination area in internal logistics | active |
| `product_site_settings.min_stock_qty` | Nexo / Catalog / Site availability | optional | Site purchase alert threshold | active |
| `product_uom_profiles.*` | Nexo / Catalog / Supplier + UOM sections | optional | Operational capture profiles (pack/base conversion) | active |
| `inventory_stock_by_site.current_qty` | Nexo / Stock views | system | Current stock by site | active |
| `inventory_stock_by_location.current_qty` | Nexo / LOC stock views | system | Current stock by LOC | active |
| `inventory_movements.*` | Nexo / Movements | system | Immutable inventory ledger | active |

## Procurement and Receipts (ORIGO)
| Table.field | Owner screen | Required | Operative reason | Status |
| --- | --- | --- | --- | --- |
| `suppliers.name` | Origo / Suppliers / New + Edit | required | Supplier identity | active |
| `purchase_orders.supplier_id` | Origo / Purchase Orders / New + Edit | required | Tie order to supplier | active |
| `purchase_order_items.product_id` | Origo / Purchase Orders / lines | required | Product requested in OC | active |
| `purchase_order_items.quantity_ordered` | Origo / Purchase Orders / lines | required | Expected quantity | active |
| `purchase_order_items.unit_cost` | Origo / Purchase Orders / lines | optional | Planned purchase cost | active |
| `purchase_order_items.quantity_received` | Origo / Receipts | system/update | Partial/total OC reception status | active |
| `inventory_entries.source_app` | Origo / Receipts + Nexo emergency entries | required (defaulted) | Audit app ownership (`origo`/`nexo`) | active |
| `inventory_entries.entry_mode` | Origo / Receipts + Nexo emergency entries | required (defaulted) | Normal vs emergency reception | active |
| `inventory_entries.emergency_reason` | Nexo / Emergency entry form | required only for emergency | Exception audit trace | active |
| `inventory_entry_items.input_unit_cost` | Origo / Receipts item lines | optional with fallback | Captured cost per input unit | active |
| `inventory_entry_items.stock_unit_cost` | Origo / Receipts item lines | system | Cost converted to stock unit | active |
| `inventory_entry_items.line_total_cost` | Origo / Receipts item lines | system | Cost traceability per line | active |
| `inventory_entry_items.cost_source` | Origo / Receipts item lines | system | Manual/prefill/fallback audit | active |
| `inventory_entries.purchase_order_id` | Origo / Receipts from OC | optional | Link reception to OC | active |
| `inventory_entry_items.purchase_order_item_id` | Origo / Receipts from OC | optional | Link line to OC line | active |

## Production and Recipes (FOGO)
| Table.field | Owner screen | Required | Operative reason | Status |
| --- | --- | --- | --- | --- |
| `recipes.*` | Fogo / Recipes | required for production items | BOM source of truth | active |
| `recipe_cards.*` | Fogo / Recipes | optional metadata | Yield, prep context, media linkage | active |
| `recipe_steps.*` | Fogo / Recipes / Steps | optional | Operational preparation procedure | active |
| `production_batches.*` | Fogo / Production Batches | required | Batch execution and traceability | active |
| `production_batch_consumptions.*` | Fogo / Production Batches | system | Ingredient consumption trace | active |
| `site_production_pick_order.*` | Fogo / Production config | optional | LOC priority allocation | active |
| `product_cost_events.source='production'` | Fogo / Production Batches | system | Cost trace from production | active |

## Permissions and Access
| Permission code | Owner screen | Required | Operative reason | Status |
| --- | --- | --- | --- | --- |
| `origo.procurement.receipts` | Origo / Receipts | required | Receive stock from procurement flow | active |
| `nexo.inventory.entries_emergency` | Nexo / Emergency entries | required | Controlled emergency reception | active |
| `fogo.production.recipes` | Fogo / Recipes | required | Recipe governance | active |
| `fogo.production.batches` | Fogo / Production Batches | required | Production execution | active |

## Deprecated candidates (current)
| Field | Current state | Deprecation condition | Status |
| --- | --- | --- | --- |
| `nexo.inventory.production_batches` permission usage in UI | Replaced by Fogo redirect | Remove after 2 operative cycles without direct use | candidate |
| Any recipe editing widget inside Nexo catalog | Replaced by CTA to Fogo | Remove after UX confirmation cycle | candidate |
