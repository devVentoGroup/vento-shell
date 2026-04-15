# Ops V2 Readiness - Estado Actual

Fecha de corte: 2026-04-14
Fuente: vistas `public.v_ops_site_readiness` y `public.v_ops_restock_product_gaps`

## Cambios aplicados hoy

- Migracion aplicada: `20260414143000_ops_v2_readiness_views.sql`
- Migracion aplicada: `20260414152000_ops_v2_bootstrap_locations_and_defaults.sql`
- Sincronizacion de migraciones ejecutada a repos conectados.

## Resultado por sede

| Sede | Tipo | Score (0-6) | LOC total | Receiving | Storage/Picking/Staging | Produccion | Catalogo con area sugerida |
|---|---|---:|---:|---:|---:|---:|---:|
| Centro de Produccion | production_center | 3 | 10 | 1 | 8 | 1 | 58 / 465 (12.47%) |
| Vento Cafe | satellite | 5 | 3 | 1 | 2 | 0 | 302 / 302 (100%) |
| Saudo | satellite | 5 | 3 | 1 | 2 | 0 | 135 / 135 (100%) |
| Molka Principal | satellite | 5 | 3 | 1 | 2 | 0 | 107 / 107 (100%) |

## Brechas cerradas

- Satelites sin LOC base: resuelto (`REC`, `STO`, `OPS`).
- `default_area_kind` faltante en catalogo satelite: resuelto (0 gaps).
- Molka sin area `Mostrador`: resuelto.

## Brechas pendientes (prioridad alta)

1. Centro de Produccion con cobertura de `default_area_kind` baja (12.47%).
2. `recipe_cards_published = 0` en centro (FOGO sin salida productiva publicada).
3. `inventory_movements_last_30d = 0` en sedes (indica flujo aun no operativo/registrado en movimientos canonicos).
4. `production_batches_last_30d = 0` (cierre de lotes aun no impacta operacion real).

## Siguiente bloque de implementacion

1. Normalizar `default_area_kind` en centro para productos activos de operacion.
2. Publicar recetas criticas de FOGO (minimo set piloto) y validar costo por lote + porcion.
3. Ejecutar prueba E2E real:
   - solicitar (ORIGO)
   - alistar/despachar (ORIGO + NEXO stock)
   - recibir (ORIGO)
   - contar diferencia (NEXO)
4. Validar que cada paso genere `inventory_movements` con trazabilidad por sede y producto.
