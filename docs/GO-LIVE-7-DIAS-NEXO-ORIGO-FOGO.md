# GO-LIVE 7 DIAS - NEXO + ORIGO + FOGO

Fecha: 2026-04-14
Estado: Pendiente de ejecucion

## Reglas de seguridad de datos

1. No tocar fichas maestras de productos (`products`, `product_*` de ficha).
2. No tocar proveedores oficiales (`suppliers`, `product_suppliers`).
3. No tocar recetas oficiales (`recipe_cards`, `recipes`, `recipe_steps`).
4. Todos los cambios de esta semana son operativos (LOC, stock inicial, remisiones, produccion y movimientos).

## Dia 1 - Diseno final de operacion

| Tarea | Responsable | Evidencia | Estado |
|---|---|---|---|
| Cerrar mapa fisico por sede (Centro, Vento Cafe, Saudo, Molka) | Operacion | Planos cargados + layout operativo Molka definido | [x] |
| Confirmar LOC definitivos por sede | Operacion + Nexo | Tabla LOC final (v1 confirmada) | [x] |
| Definir productos por area/LOC | Operacion | Matriz producto->area->LOC | [ ] |
| Congelar politica LPN (solo criticos) | Direccion + Operacion | Politica publicada | [ ] |

Criterio de cierre Dia 1: plano fisico + tabla LOC final aprobada.

### Evidencia Dia 1 (recibida)

1. `C:\Users\User\devVentoGroup\vento-nexo\docs\Centro de Producción Primer Piso.png`
2. `C:\Users\User\devVentoGroup\vento-nexo\docs\Centro de Producción Segundo Piso.png`
3. `C:\Users\User\devVentoGroup\vento-nexo\docs\Saudo Plano.pdf`
4. `C:\Users\User\devVentoGroup\vento-nexo\docs\Vento café Plano.pdf`
5. Molka: layout operativo simple confirmado por operacion (vitrinas + 2 neveras, bebidas; comida llega lista).

### Definicion operativa provisional Molka (hasta plano formal)

1. Area de solicitud: `Mostrador`.
2. LOC operativos: `LOC-MOL-REC-01`, `LOC-MOL-STO-01`, `LOC-MOL-OPS-01`.
3. Flujo: recepcion interna -> almacenamiento operativo -> alistamiento/consumo en mostrador.

### Tabla LOC final v1 (confirmada)

#### Centro de Produccion

1. `LOC-CP-REC-01` (`receiving`) - Recepcion de proveedor.
2. `LOC-CP-PROD-01` (`production`) - Produccion interna.
3. `LOC-CP-DESP-01` (`staging`) - Staging para despacho a satelites.
4. `LOC-CP-DEV-01` (`staging`) - Devoluciones e incidencias.
5. `LOC-CP-BOD-MAIN` (`storage`) - Bodega.
6. `LOC-CP-SECOS1-MAIN` (`storage`) - Secos.
7. `LOC-CP-FRIO-MAIN` (`storage`) - Frio.
8. `LOC-CP-CONG-MAIN` (`storage`) - Congelado.
9. `LOC-CP-N2P-MAIN` (`storage`) - Zona N2P.
10. `LOC-CP-N3P-MAIN` (`storage`) - Zona N3P.

#### Vento Cafe

1. `LOC-VC-REC-01` (`receiving`) - Recepcion interna.
2. `LOC-VC-STO-01` (`storage`) - Stock operativo.
3. `LOC-VC-OPS-01` (`picking`) - Picking operativo.

#### Saudo

1. `LOC-SAU-REC-01` (`receiving`) - Recepcion interna.
2. `LOC-SAU-STO-01` (`storage`) - Stock operativo.
3. `LOC-SAU-OPS-01` (`picking`) - Picking operativo.

#### Molka Principal

1. `LOC-MOL-REC-01` (`receiving`) - Recepcion interna.
2. `LOC-MOL-STO-01` (`storage`) - Stock operativo.
3. `LOC-MOL-OPS-01` (`picking`) - Picking operativo.

### Matriz operativa Dia 1 (producto -> area -> LOC) [v1]

Objetivo: que cada item operativo tenga ruta clara para `pedir`, `alistar`, `despachar`, `recibir` y `contar` sin decisiones manuales del trabajador.

#### Centro de Produccion (origen interno)

| Flujo | Area | LOC sugerido |
|---|---|---|
| Recepcion proveedor | Bodega | `LOC-CP-REC-01` |
| Almacen seco | Bodega | `LOC-CP-SECOS1-MAIN` |
| Almacen frio | Bodega | `LOC-CP-FRIO-MAIN` |
| Almacen congelado | Bodega | `LOC-CP-CONG-MAIN` |
| Produccion | Cocina | `LOC-CP-PROD-01` |
| Despacho satelites | Logistica | `LOC-CP-DESP-01` |
| Devoluciones/incidencias | Logistica | `LOC-CP-DEV-01` |

#### Satelites (destino interno)

| Sede | Area de solicitud | LOC recepcion | LOC stock | LOC operacion |
|---|---|---|---|---|
| Vento Cafe | Mostrador / Cocina / Bar | `LOC-VC-REC-01` | `LOC-VC-STO-01` | `LOC-VC-OPS-01` |
| Saudo | Cocina Bar | `LOC-SAU-REC-01` | `LOC-SAU-STO-01` | `LOC-SAU-OPS-01` |
| Molka | Mostrador | `LOC-MOL-REC-01` | `LOC-MOL-STO-01` | `LOC-MOL-OPS-01` |

#### Regla de asignacion por familia de producto (v1)

| Familia operativa | Centro (LOC origen) | Satelite (LOC destino) |
|---|---|---|
| Secos / empaques | `LOC-CP-SECOS1-MAIN` | `*-STO-01` |
| Refrigerados | `LOC-CP-FRIO-MAIN` | `*-STO-01` |
| Congelados | `LOC-CP-CONG-MAIN` | `*-STO-01` |
| Preparaciones listas para despacho | `LOC-CP-PROD-01` -> `LOC-CP-DESP-01` | `*-REC-01` -> `*-STO-01` |
| Insumos de consumo inmediato | `LOC-CP-BOD-MAIN`/zona correspondiente | `*-OPS-01` |

Estado: [ ] Validar con operacion producto por producto (top criticos primero).

### Politica LPN (solo criticos) [v1 congelada]

Regla base: no usar LPN para todo. Solo para items donde agrega control real y evita perdida.

#### Usa LPN (obligatorio)

1. Producto con lote + vencimiento.
2. Producto de alto costo unitario.
3. Producto sensible a trazabilidad sanitaria.
4. Produccion/lote en FOGO con seguimiento de consumo y salida.

#### No usa LPN (operacion simplificada)

1. Insumos de rotacion alta y bajo riesgo.
2. Empaques, desechables, consumibles generales.
3. Flujo diario de remision estandar Centro -> satelite (sin lote critico).

#### Criterio de implementacion

1. Activar LPN por categoria critica, no por toda la sede.
2. Etiquetar fisicamente solo contenedores criticos.
3. Flujo trabajador: escanear LOC + confirmar cantidad (sin pasos extra).
4. Auditoria semanal de excepciones (sin bloquear operacion diaria).

Estado: [ ] Politica publicada y comunicada a equipos.

## Dia 2 - Etiquetado fisico (QR)

| Tarea | Responsable | Evidencia | Estado |
|---|---|---|---|
| Interface QR operativa en NEXO (/inventory/warehouse) | Codex | Página responsiva + scanner integrado + autenticación | [x] |
| Imprimir etiquetas LOC (QR + codigo + sede/area) | Operacion | Lote de etiquetas impresas | [ ] |
| Imprimir etiquetas de contenedor/bin | Operacion | Etiquetas contenedor impresas | [ ] |
| Pegar etiquetas en piso y validar escaneo | Operacion | Registro de prueba de lectura | [ ] |
| Corregir etiquetas no legibles o mal ubicadas | Operacion | Lista corregida | [ ] |

Criterio de cierre Dia 2: 100% LOC criticos etiquetados y escaneables.

## Dia 3 - Configuracion de sistema

| Tarea | Responsable | Evidencia | Estado |
|---|---|---|---|
| Ajustar LOC/areas finales en DB segun Dia 1 | Codex + Operacion | Script aplicado | [ ] |
| Verificar producto-sede-area para remision | Nexo | Auditoria sin brechas criticas | [ ] |
| Bloquear remisiones sin lineas | Origo + DB | Validacion activa | [ ] |
| Verificar permisos por rol operativo | Nexo + Origo | Checklist permisos | [ ] |

Criterio de cierre Dia 3: readiness sin brechas criticas bloqueantes.

## Dia 4 - Stock inicial

| Tarea | Responsable | Evidencia | Estado |
|---|---|---|---|
| Cargar conteo inicial real por sede/LOC | Operacion | Sesiones de conteo cerradas | [ ] |
| Validar top 50 productos criticos | Operacion + Control | Acta de validacion | [ ] |
| Ajustar diferencias antes de remisiones | Operacion | Ajustes aplicados | [ ] |
| Congelar snapshot de stock base | Nexo | Corte de inventario base | [ ] |

Criterio de cierre Dia 4: stock inicial reconciliado y firmado.

## Dia 5 - Piloto remisiones E2E

| Tarea | Responsable | Evidencia | Estado |
|---|---|---|---|
| Remision 1: Centro -> Vento Cafe | Origo + Operacion | Request con estado final | [ ] |
| Remision 2: Centro -> Saudo | Origo + Operacion | Request con estado final | [ ] |
| Remision 3: Centro -> Molka | Origo + Operacion | Request con estado final | [ ] |
| Validar trazabilidad (`transfer_out` + `transfer_in`) | DB + Nexo | Query de auditoria `ok_e2e` | [ ] |

Criterio de cierre Dia 5: 3 remisiones `ok_e2e` sin inconsistencias.

## Dia 6 - Produccion real (FOGO)

| Tarea | Responsable | Evidencia | Estado |
|---|---|---|---|
| Publicar recetas criticas | Fogo + Operacion | Recetas en estado `published` | [ ] |
| Cerrar lote real de cada receta piloto | Fogo | Lotes cerrados | [ ] |
| Verificar consumo de insumos y entrada de producto | Fogo + Nexo | Movimientos asociados | [ ] |
| Confirmar costo total y costo por porcion | Fogo | Reporte de costos | [ ] |

Criterio de cierre Dia 6: lotes reales cerrados con impacto correcto en inventario.

## Dia 7 - Salida operativa

| Tarea | Responsable | Evidencia | Estado |
|---|---|---|---|
| Capacitacion corta por rol (pedir/despachar/recibir/contar) | Operacion | Lista de asistencia | [ ] |
| SOP de 1 pagina por flujo | Operacion + Codex | SOP publicados | [ ] |
| Activar operacion diaria | Direccion | Confirmacion de arranque | [ ] |
| Monitoreo primeras 24h y correccion rapida | Operacion + Codex | Log de incidentes y fixes | [ ] |

Criterio de cierre Dia 7: operacion en vivo sin bloqueos criticos.

## KPIs de salida (obligatorios)

1. Solicitud < 60 segundos por trabajador.
2. Recepcion < 45 segundos.
3. 0 remisiones sin lineas.
4. 100% remisiones piloto con `ok_e2e`.
5. Descuadre diario dentro de tolerancia definida por sede.

## Comandos SQL de control

1. `supabase/ops_v2_readiness_check.sql`
2. `supabase/ops_v2_restock_traceability_audit.sql`
3. `supabase/ops_v2_day1_product_area_loc_matrix_check.sql`

## Cambios ya aplicados (base)

1. `20260414143000_ops_v2_readiness_views.sql`
2. `20260414152000_ops_v2_bootstrap_locations_and_defaults.sql`
3. `20260414164000_ops_v2_cleanup_test_orders_stock_movements.sql`
