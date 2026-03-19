# Especificacion V1 Inmediata

Estado: `Canonico para implementacion`
Fecha: `2026-03-11`
Scope: `NEXO v1 + base de datos compartida Vento OS`

## 1. Objetivo

Este documento baja el Plan Maestro a implementacion inmediata.

No define el sistema ideal completo. Define el sistema minimo que debe salir ya, sin dañar la evolucion hacia `v2` y `v3`.

La regla rectora es:

- `v1` debe ser simple de usar;
- `v1` debe ser correcta semantica y operativamente;
- `v1` no debe mostrar toda la complejidad futura;
- `v1` si debe dejar preparados los contratos que luego creceran.

## 2. Regla de oro de `v1`

En `v1` no se crean tablas nuevas por ansiedad de futuro si el schema actual ya soporta el flujo.

Primero:

- se define semantica exacta;
- se eliminan interpretaciones dobles;
- se esconde la complejidad no necesaria;
- se deja trazabilidad suficiente;
- se cierra el flujo diario real.

## 3. Flujo operativo que `v1` debe resolver de punta a punta

### 3.1 Catalogo

1. Crear producto maestro.
2. Asignar categoria operativa primaria.
3. Definir unidad base / stock.
4. Activar por sede.
5. Configurar minimo por sede cuando aplique.

### 3.2 Entrada / recepcion

1. Recibir stock manualmente o por contingencia.
2. Registrar costo base suficiente.
3. Guardar trazabilidad de entrada y movimiento.
4. Ubicar en LOC si la sede usa LOC.

### 3.3 Stock

1. Ver stock por sede.
2. Ver stock por LOC en sedes que lo usan.
3. Ver movimientos.
4. Contar y ajustar.

### 3.4 Abastecimiento interno

1. Satelite solicita.
2. CP o sede origen prepara.
3. Origen despacha.
4. Destino recibe.
5. Se registran faltantes si aplica.

## 4. Alcance real de `v1`

### 4.1 Entra en `v1`

- producto maestro unico;
- categoria operativa primaria;
- disponibilidad por sede;
- stock por sede;
- LOC solo donde sea necesario;
- entradas manuales y de contingencia;
- conteos y ajustes;
- abastecimiento interno fisico entre sedes;
- par levels minimos por sede;
- costo inventariable base;
- trazabilidad suficiente para auditoria.

### 4.2 No bloquea `v1`

- contextos comerciales;
- categorias comerciales por negocio;
- oferta comercial por canal;
- settlement interno formal;
- intercompany real;
- centros de costo por linea con UI completa;
- pricing automatico entre sedes;
- analitica gerencial compleja;
- automatizaciones entre apps.

### 4.3 Debe quedar preparado pero oculto

- `pricing_mode`
- `pricing_status`
- `transfer_unit_price`
- `transfer_total`
- `internal_supplier_site_id`
- `cost_centers`
- contexts comerciales futuros

## 5. Tablas oficiales de `v1`

## 5.1 `products`

Uso oficial en `v1`:

- producto maestro unico de venta, insumo o preparacion.

Campos obligatorios operativos:

- `id`
- `name`
- `sku`
- `product_type`
- `category_id`
- `unit`
- `stock_unit_code`
- `is_active`

Campos permitidos pero no fuente de verdad futura:

- `price`: puede existir para venta base o referencia, pero no se debe convertir en modelo definitivo de precio multi-negocio.
- `cost`: referencia o fallback, no sustituto del costo inventariable calculado.
- `catalog_image_url`: util para listados, pero no reemplaza una futura oferta comercial contextual.

Reglas:

1. `products.category_id` significa categoria operativa primaria.
2. `products` no resuelve merchandising por marca.
3. si cambia receta base, comportamiento de inventario o unidad operativa, probablemente ya es otro producto maestro.

## 5.2 `product_categories`

Uso oficial en `v1`:

- taxonomia operativa canonia para inventario, produccion y abastecimiento.

Campos relevantes:

- `id`
- `name`
- `parent_id`
- `site_id`
- `domain`
- `applies_to_kinds`
- `is_active`

Reglas:

1. la categoria primaria del producto debe tender a ser global y estable.
2. `site_id` y `domain` se toleran en `v1`, pero no deben seguir creciendo para resolver categorias comerciales por negocio.
3. un producto no debe cambiarse de categoria operativa para resolver como se ve en Saudo o Vento Cafe.

## 5.3 `product_site_settings`

Uso oficial en `v1`:

- disponibilidad operativa del producto por sede.

Campos activos de `v1`:

- `site_id`
- `product_id`
- `is_active`
- `default_area_kind`
- `min_stock_qty`

Semantica oficial:

- si existe fila activa, el producto esta habilitado para operar en esa sede.
- `min_stock_qty` es el par level minimo visible de `v1`.
- `default_area_kind` es sugerencia operativa para abastecimiento o produccion.

### `audience` en `v1`

`audience` queda como campo transicional de compatibilidad, no como modelo canónico.

Regla oficial:

- la disponibilidad real por sede la define la fila `site_id + product_id`.
- `audience` puede seguir usandose en la UI actual como filtro auxiliar o compatibilidad para remisiones.
- no se debe usar `audience` para modelar negocio, marca, categoria comercial ni oferta comercial.

Decision:

- `SAUDO`, `VCF`, `BOTH`, `INTERNAL` quedan tolerados en `v1`.
- ningun desarrollo nuevo debe profundizar esa dependencia.
- la evolucion correcta es mover eso a contextos comerciales o reglas de abastecimiento, no a catalogo maestro.

## 5.4 `sites`

Uso oficial en `v1`:

- sedes fisicas u operativas donde existe inventario y operacion.

Campos activos:

- `id`
- `code`
- `name`
- `site_type`
- `site_kind`
- `is_active`

Reglas:

1. `site` es sede operativa, no marca.
2. `site` no reemplaza `cost_center`.
3. `site_type` debe soportar al menos la diferencia entre CP y satelite.

## 5.5 `inventory_locations`

Uso oficial en `v1`:

- LOC fisico solo donde haga falta control fino.

Regla:

- `v1` puede operar con LOC solo en CP o sede central.
- no forzar LOC en satelites si la operacion real no lo necesita.

## 5.6 `inventory_entries` y `inventory_entry_items`

Uso oficial en `v1`:

- entradas de stock y recepciones de contingencia.

Campos activos:

- `site_id`
- `supplier_name` o `supplier_id`
- `received_at`
- `source_app`
- `entry_mode`
- `emergency_reason`
- lineas con `product_id`, `quantity_declared`, `quantity_received`, `location_id`, `stock_unit_cost`, `line_total_cost`

Reglas:

1. `entry_mode = normal | emergency` si importa ya en `v1`.
2. `source_app = origo | nexo` si importa ya en `v1`.
3. la recepcion de contingencia no debe romper el futuro flujo de `Origo`.
4. en sedes con LOC, la entrada debe dejar ubicacion por linea.

## 5.7 `inventory_movements`

Uso oficial en `v1`:

- ledger inmutable de movimientos.

Reglas:

1. es la fuente de auditoria operativa.
2. toda entrada, ajuste, retiro o abastecimiento debe terminar reflejado aqui.
3. no usar esta tabla para resolver UX primaria; usarla para trazabilidad.

## 5.8 `inventory_stock_by_site`

Uso oficial en `v1`:

- disponibilidad consolidada por sede.

Campos activos:

- `site_id`
- `product_id`
- `current_qty`
- `avg_unit_cost`
- `min_qty`

Decision:

- `min_qty` puede convivir, pero la referencia operativa visible en catalogo puede salir de `product_site_settings.min_stock_qty`.
- si ambos existen, se debe definir una sola fuente visible en UI. En `v1` la preferida es `product_site_settings.min_stock_qty`.

## 5.9 `inventory_count_sessions` y `inventory_count_lines`

Uso oficial en `v1`:

- conteo, cierre y ajuste auditable.

Reglas:

1. el conteo es mecanismo oficial de correccion controlada.
2. no usar ajustes libres para resolver faltantes que en realidad debieron pasar por conteo o recepcion.

## 5.10 `restock_requests` y `restock_request_items`

Uso oficial en `v1`:

- documento fisico de abastecimiento interno entre sedes.

No es en `v1`:

- factura interna;
- venta POS interna;
- settlement contable completo.

Campos activos de cabecera:

- `from_site_id`
- `to_site_id`
- `requested_by_site_id`
- `status`
- `expected_date`
- `priority`
- `request_type`

Campos activos de linea:

- `product_id`
- `quantity`
- `prepared_quantity`
- `shipped_quantity`
- `received_quantity`
- `shortage_quantity`
- `item_status`
- `source_location_id`

Campos reservados que SI se guardan pero NO bloquean:

- `pricing_mode`
- `pricing_status`
- `internal_supplier_site_id`
- `transfer_unit_price`
- `transfer_currency`
- `transfer_total`

Reglas:

1. el flujo fisico no depende de la liquidacion.
2. `pricing_mode` debe quedar en `none` por defecto en `v1` salvo casos controlados.
3. `transfer_*` puede almacenarse si existe una necesidad puntual, pero no debe ser requisito diario.
4. la UI de `v1` debe hablar de `abastecimiento interno` o `remision`, no de venta interna.

## 5.11 `inventory_transfers` y `inventory_transfer_items`

Uso oficial en `v1`:

- movimiento interno dentro de la misma sede o bodega.

Regla:

- no sustituye el abastecimiento entre sedes.

## 5.12 `cost_centers`

Uso oficial en `v1`:

- dimension financiera preparada para crecimiento.

Regla:

- no debe bloquear la operacion diaria de `v1`.
- si se usa, que sea solo en reportes, compras o configuracion administrativa puntual.
- no exigir centro de costo por linea en `v1` si el equipo todavia no opera asi.

## 6. Campos que deben tratarse como transicionales en `v1`

### 6.1 `products.price`

- permitido como referencia simple;
- no tratado como modelo de precios multi-negocio.

### 6.2 `products.cost`

- permitido como fallback o referencia;
- no sustituye el costo inventariable calculado.

### 6.3 `product_site_settings.audience`

- compatibilidad de UI actual;
- no fuente de verdad futura.

### 6.4 `restock_requests.pricing_mode` y `restock_request_items.transfer_*`

- reservados para evolucion;
- no obligatorios en `v1`.

## 7. UI minima que corresponde a este schema

### 7.1 Operar

- Entradas
- Abastecimiento interno
- Conteos
- Traslados
- Retiros

### 7.2 Verificar

- Stock
- Movimientos
- Alertas
- Salud del catalogo

### 7.3 Configurar

- Productos
- Ubicaciones
- Sedes
- Rutas
- Unidades
- Categorias

## 8. Exclusiones explicitas de `v1`

No implementar ahora como core diario:

- categorias comerciales por negocio;
- offerings por canal;
- listas de precio complejas;
- settlement interno formal;
- intercompany;
- UI completa de centros de costo por linea;
- dashboards avanzados;
- automatizacion de pricing interno.

## 9. Migrations minimas recomendadas para salir bien

Si la data actual no esta sana, la prioridad no es agregar mas tablas. La prioridad es endurecer integridad y setup.

Orden recomendado:

1. validar `sites`, `site_supply_routes`, `areas`, `inventory_units`;
2. validar que todo producto operativo tenga `stock_unit_code` y `category_id`;
3. validar que toda sede operativa tenga `product_site_settings` correctos;
4. validar que CP tenga LOCs minimos;
5. validar que `restock_requests` y sus RPCs cubran el flujo real;
6. dejar pricing interno en modo reservado.

## 10. Definicion de listo para implementar `v1`

`v1` esta correctamente modelada cuando:

- se puede crear un producto maestro sin decidir todavia su menu comercial futuro;
- se puede activar por sede sin depender de stock existente;
- se puede recibir stock y costearlo de forma auditable;
- se puede mover fisicamente entre sedes;
- se puede contar y corregir;
- el usuario no necesita entender oferta comercial, pricing interno ni centros de costo para operar el dia a dia;
- los datos no impiden crecer luego hacia `v2`.

## 11. Siguiente paso despues de esta especificacion

Despues de aprobar este documento, el orden correcto es:

1. traducirlo a backlog tecnico;
2. limpiar `NEXO` pantalla por pantalla segun este alcance;
3. endurecer setup y salud del catalogo;
4. luego definir migraciones y UI de `v2`.
