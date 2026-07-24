# Auditoría técnica TEC-01 a TEC-18

**Fecha de comprobación:** 2026-07-23
**Proyecto remoto revisado:** `vento-os-dev`
**Alcance:** repositorios disponibles en `C:\Users\User\devVentoGroup`, esquema y objetos remotos de Supabase
**Regla de seguridad:** no se copiaron valores de secretos, direcciones completas ni datos personales

---

## Resultado general

| Resultado                             | Cantidad |
| ------------------------------------- | -------: |
| Comprobaciones respondidas            |       18 |
| Comprobaciones parcialmente resueltas |        0 |
| Comprobaciones sin respuesta          |        0 |

La incorporación del repositorio local de NUMERA permitió completar `TEC-17` y cerrar `TEC-18`. Las dieciocho comprobaciones de este informe quedaron respondidas.

---

## TEC-01 — Repositorio de AURA

**Estado:** `RESPONDIDA`

AURA no tiene repositorio ni implementación. El usuario confirmó que es únicamente una idea, sin diseño inicial, pantallas ni funciones.

La inspección transversal encontró once repositorios VENTO y ninguno corresponde a AURA.

Supabase conserva solamente una referencia reservada:

- aplicación `aura` activa en el catálogo;
- cero elementos de navegación;
- cero pantallas registradas;
- un permiso base de acceso.

Ese registro no demuestra que exista una aplicación funcional.

---

## TEC-02 — Rutas o pantallas de AURA

**Estado:** `RESPONDIDA`

No existen rutas ni pantallas de AURA.

Evidencia:

- no existe repositorio AURA;
- `app_navigation_items`: cero registros para `aura`;
- `app_screen_registry`: cero registros para `aura`;
- confirmación directa del usuario.

---

## TEC-03 — Capacidades funcionales de AURA

**Estado:** `RESPONDIDA`

AURA no tiene capacidades funcionales implementadas.

El permiso `aura.access` es únicamente una reserva de catálogo. No habilita campañas, contenidos, publicaciones ni otra operación.

---

## TEC-04 — Oficina 1 y direcciones administrativas

**Estado:** `RESPONDIDA`

No se encontró el texto `Oficina 1` ni una variante equivalente en el código o la configuración ejecutable de los repositorios.

Supabase sí conserva direcciones mediante el campo general `public.sites.address`. En el proyecto remoto existen tres registros con tipo administrativo:

- `Vento Group`, con dirección registrada;
- `Punto recogida camioneta principal`, con dirección registrada;
- `App Review (Demo)`, sin dirección registrada.

Por tanto, **Oficina 1 no está identificada explícitamente como tal en los sistemas**, aunque existe una sede administrativa `Vento Group` con dirección. No se expuso el valor de la dirección.

---

## TEC-05 — Información de ventas

**Estado:** `RESPONDIDA`

Las estructuras remotas confirmadas son:

| Grupo                                   | Tablas o servicios                                                                                                             |
| --------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| Pedido y venta digital                  | `public.orders`, `public.order_items`, `public.order_item_options`, `public.order_status_events`                               |
| Conversación del pedido                 | `public.order_conversations`, `public.order_messages`                                                                          |
| Solicitud de factura                    | `public.order_billing_requests`                                                                                                |
| Pago digital                            | `payments.transactions`, `payments.webhook_events`                                                                             |
| POS interno todavía vacío               | `pos.pos_sessions`, `pos.pos_session_orders`, `pos.pos_payments`, `pos.pos_cash_shifts`, `pos.pos_cash_movements`              |
| Ventas externas importadas              | `public.pulso_daily_sales_import_batches`, `public.pulso_daily_sales_import_rows`, `public.pulso_external_sales_item_mappings` |
| Consumo de inventario por venta externa | `public.pulso_sales_consumption_rules`, `public.pulso_sales_inventory_postings`                                                |
| Lealtad por venta externa               | `public.loyalty_external_sales`                                                                                                |

En el corte remoto:

- `orders`: 7;
- `order_items`: 7;
- `payments.transactions`: 7;
- las tablas de importación Makos y las tablas POS están vacías.

PULSO contiene la superficie que consulta pedidos y recibe archivos de ventas Makos.

---

## TEC-06 — Información de inventario

**Estado:** `RESPONDIDA`

NEXO usa y mantiene las principales estructuras de inventario:

| Grupo                    | Tablas principales                                                                                                                            |
| ------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------- |
| Catálogo                 | `products`, `product_inventory_profiles`, `product_site_settings`, `product_uom_profiles`                                                     |
| Existencia               | `inventory_stock_by_site`, `inventory_stock_by_location`, `inventory_stock_by_position`, `inventory_stock_by_uom_profile`                     |
| Ubicación                | `inventory_locations`, `inventory_location_positions`, `inventory_lpns`, `inventory_lpn_items`                                                |
| Movimientos              | `inventory_movements`, `inventory_movement_types`                                                                                             |
| Entradas                 | `inventory_entries`, `inventory_entry_items`, `inventory_entry_corrections`                                                                   |
| Traslados                | `inventory_transfers`, `inventory_transfer_items`                                                                                             |
| Conteos                  | `inventory_count_sessions`, `inventory_count_lines`, `inventory_count_line_entries`                                                           |
| Solicitudes y remisiones | `restock_requests`, `restock_request_items`, `restock_item_fulfillments`, `remission_shipments`, `remission_receipts`, `remission_exceptions` |

Volumen remoto observado:

- 959 productos;
- 803 movimientos;
- 202 saldos por sede;
- 218 saldos por ubicación;
- 75 sesiones de conteo;
- 35 traslados;
- 11 solicitudes de reabastecimiento.

---

## TEC-07 — Información de compras

**Estado:** `RESPONDIDA`

Las estructuras confirmadas son:

- `suppliers`;
- `product_suppliers`;
- `purchase_orders`;
- `purchase_order_items`;
- `procurement_agreed_prices`;
- `procurement_supplier_product_costs`;
- `procurement_receptions`;
- `procurement_reception_items`;
- `inventory_entries` e `inventory_entry_items` para la entrada física relacionada.

Volumen remoto observado:

- 91 proveedores;
- 434 relaciones producto-proveedor;
- 3 órdenes de compra y 9 líneas;
- 6 costos producto-proveedor;
- cero recepciones en las tablas nuevas de `procurement`.

ORIGO administra órdenes y recepciones; NEXO también consulta órdenes durante entradas de inventario.

---

## TEC-08 — Información de producción

**Estado:** `RESPONDIDA`

Las estructuras confirmadas son:

| Grupo       | Tablas                                                                                                         |
| ----------- | -------------------------------------------------------------------------------------------------------------- |
| Recetas     | `recipes`, `recipe_cards`, `recipe_steps`, `recipe_site_uses`, `recipe_outputs`                                |
| Solicitudes | `production_requests`, `production_request_items`                                                              |
| Ejecución   | `production_batches`, `production_batch_consumptions`, `production_batch_outputs`, `production_batch_packages` |
| Rutas       | `product_site_production_routes`, `site_production_pick_order`                                                 |

Volumen remoto observado:

- 276 recetas;
- 52 fichas;
- 177 pasos;
- 64 usos por sede;
- 15 salidas de receta;
- 110 rutas de producción;
- cero solicitudes y lotes de producción registrados.

FOGO mantiene la superficie de recetas y lotes; NEXO también consume rutas, paquetes y datos de producción para inventario y remisiones.

---

## TEC-09 — Información financiera

**Estado:** `RESPONDIDA`

Las estructuras financieras o económicas confirmadas son:

- `cost_centers`;
- `numera_periods`;
- `numera_expense_categories`;
- `numera_expenses`;
- `numera_cost_center_budgets`;
- vista `numera_cost_center_monthly_summary`;
- función `numera_current_period_summary`;
- `inventory_cost_policies`;
- `product_cost_events`;
- `internal_price_lists`;
- `internal_price_list_items`;
- `internal_pos_documents` y líneas;
- `payments.transactions`;
- `club.wallet_accounts` y `club.wallet_ledger`.

Volumen remoto observado:

- 6 centros de costo;
- 1 periodo NUMERA;
- 7 categorías de gasto;
- cero gastos y presupuestos NUMERA;
- 4 eventos de costo;
- 3 listas internas de precios;
- 7 transacciones de pago digital;
- cero comprobantes POS internos y cero movimientos de billetera.

No se encontraron estructuras completas de contabilidad general, bancos, cuentas por cobrar o cuentas por pagar. NUMERA es actualmente una base económica parcial, no un sistema contable completo.

---

## TEC-10 — Referencias técnicas a Makos

**Estado:** `RESPONDIDA`

Makos está integrado únicamente mediante **carga manual de Excel**, no mediante API o webhook.

Evidencia:

- `vento-pulso/src/app/sales-imports/page.tsx`;
- función local `parseMakosWorkbook`;
- formulario que acepta `.xlsx`;
- mapeo manual de identificadores Makos;
- `pulso_daily_sales_import_batches`;
- `pulso_daily_sales_import_rows`;
- `pulso_external_sales_item_mappings`;
- origen `makos_excel` y código de origen `makos`.

No se encontró una conexión automática directa con Makos.

---

## TEC-11 — Integración automática con Shopify

**Estado:** `RESPONDIDA`

No existe evidencia de una integración automática entre Shopify y una aplicación VENTO.

Se revisaron:

- repositorios;
- migraciones;
- funciones SQL;
- Edge Functions desplegadas;
- nombres de secretos almacenados en Vault;
- trabajos programados.

No se encontraron referencias Shopify en esos mecanismos.

---

## TEC-12 — Integración automática con Rappi

**Estado:** `RESPONDIDA`

No existe evidencia de una integración automática con la API de Rappi.

La única referencia técnica remota es `pass.validate_catalog_item_option_rappi_level`, utilizada para validar la presentación visual de opciones “tipo Rappi”. Esto no recibe pedidos ni se comunica con Rappi.

No se encontraron Edge Functions, secretos, trabajos programados o webhooks de Rappi.

---

## TEC-13 — Integración automática con ManyChat

**Estado:** `RESPONDIDA`

No existe evidencia de una integración automática con ManyChat.

No se encontraron referencias en código, base de datos, funciones, Edge Functions, secretos de Vault o trabajos programados.

---

## TEC-14 — Corrección de horarios publicados

**Estado:** `RESPONDIDA`

Dos aplicaciones contienen mecanismos de edición:

| Aplicación | Mecanismo                                                                                                   |
| ---------- | ----------------------------------------------------------------------------------------------------------- |
| VISO       | edición desde calendario, ficha del trabajador y API `staff-schedule-shifts`; la ficha exige `staff.manage` |
| ANIMA      | `EditShiftModal` actualiza `employee_shifts` y depende de las políticas RLS para permitir la operación      |

Comportamiento relevante:

- ANIMA puede editar un turno ya publicado y conserva su publicación;
- la edición desde la ficha de VISO deja `published_at` y `published_by` en `null`, por lo que el turno debe publicarse nuevamente;
- Supabase conserva políticas de escritura para gerentes de sede, propietarios y gerencia global.

---

## TEC-15 — Corrección de marcaciones de asistencia

**Estado:** `RESPONDIDA`

No se encontró una pantalla o función interna que permita cambiar la hora o el tipo de una marcación existente.

ANIMA permite editar únicamente las **notas de incidencia** de `attendance_logs`.  
VISO consulta las marcaciones para informes, horarios y métricas, pero no actualiza sus horas.

Por tanto, actualmente no existe un mecanismo funcional comprobado para corregir una marcación.

---

## TEC-16 — Corrección de medios de pago

**Estado:** `RESPONDIDA`

No se encontró una pantalla o acción de PULSO que permita corregir manualmente el medio de pago.

Supabase conserva:

- `pos.pos_payments`, actualmente sin registros;
- `payments.transactions`, con transacciones de pago digital;
- funciones de intención, webhook y conciliación de pago.

Esos mecanismos crean o actualizan estados técnicos del pago, pero no constituyen una corrección manual auditable del medio de pago.

---

## TEC-17 — Exportaciones utilizables para auditoría

**Estado:** `RESPONDIDA`

| Aplicación | Exportación encontrada                                                                               |
| ---------- | ---------------------------------------------------------------------------------------------------- |
| NEXO       | CSV de movimientos, CSV de stock por ubicación, Excel de catálogo/conteo y descarga de QR de activos |
| VISO       | Excel de turnos y asistencia                                                                         |
| ANIMA      | descarga y compartición del mismo informe Excel de asistencia                                        |
| ORIGO      | PDF interno y PDF para proveedor de órdenes de compra                                                |
| FOGO       | PDF de recetas publicadas                                                                            |
| PULSO      | no se encontró exportación; sí carga manual de Excel Makos                                           |
| NUMERA     | repositorio revisado; no se encontró mecanismo de exportación                                        |

Durante la auditoría se encontró desplegada la Edge Function temporal `inventory-excel-export-20260721`, que generaba un Excel amplio de inventario.

Hallazgo de seguridad:

- la función tiene `verify_jwt=false`;
- utiliza un token incrustado en su código;
- no se encontró una fuente local canónica equivalente.

No se expone el token. Este hallazgo originó `TEC-19`.

**Resolución de `TEC-19` (2026-07-23):** por instrucción explícita del usuario, la función fue eliminada de `vento-os-dev` desde `vento-shell`. Una segunda consulta al listado remoto confirmó que ya no está desplegada. No se modificaron otras Edge Functions ni datos de Supabase.

---

## TEC-18 — Contratos y estructuras duplicadas

**Estado:** `RESPONDIDA`

Duplicaciones confirmadas:

1. `SiteRow`, `SiteOption`, `EmployeeRow`, `ProductRow` y tipos similares se declaran repetidamente en NEXO, FOGO, ORIGO y PULSO.
2. FOGO y ORIGO conservan copias separadas de:
   - formulario guiado de órdenes de compra;
   - plantilla de mensaje de orden;
   - generación de PDF;
   - tipos de producto, sede y orden.
3. Las copias de FOGO y ORIGO ya tienen hashes diferentes, por lo que existe deriva.
4. NEXO y FOGO vuelven a declarar modos de salida de producción como:
   - `inventory_stock`;
   - `sellable_stock`;
   - `order_fulfillment`.
5. PULSO repite tipos de pedido, líneas, eventos, conversaciones y mensajes entre su página principal, tablero actual, tablero legado y componentes en tiempo real.
6. Los componentes estándar de navegación y contexto (`vento-shell`, `vento-chrome`, `app-switcher`) están copiados en varios repositorios.
7. NUMERA repite `SiteRow`, `SiteOption`, `EmployeeRow`, sesión operativa, normalización de sedes y componentes estándar de navegación.
8. La sesión operativa de NUMERA y ORIGO es idéntica en la revisión realizada, mientras otras copias estándar ya tienen hashes diferentes; existe tanto duplicación exacta como deriva.
9. NUMERA consulta directamente `cost_centers`, tablas `numera_*`, `sites`, `employees`, `employee_sites`, permisos y navegación sin usar contratos TypeScript generados desde una fuente común.

La base de datos centraliza las tablas, pero los contratos TypeScript no provienen de un paquete o generación única.

La incorporación del repositorio `vento-numera` permitió completar la comparación que faltaba. El hallazgo queda cerrado como evidencia AS-IS; corregir la duplicación y diseñar contratos compartidos pertenece a la remodelación posterior.

---

## Evidencia principal

| Evidencia                                                     | Uso                                                 |
| ------------------------------------------------------------- | --------------------------------------------------- |
| `schema_public_current.sql`                                   | estructura local canónica                           |
| `supabase/migrations`                                         | evolución y funciones                               |
| listado remoto de tablas `public`, `pos`, `payments` y `club` | existencia y volumen actuales                       |
| listado remoto de Edge Functions                              | funciones realmente desplegadas                     |
| consulta de `public.sites`                                    | referencias administrativas sin exponer direcciones |
| búsqueda de funciones, Vault y cron                           | Shopify, Rappi, ManyChat y Makos                    |
| repositorios NEXO, FOGO, ORIGO, PULSO, NUMERA, VISO y ANIMA   | superficies y contratos de aplicación               |
