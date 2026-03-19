# Plan Maestro Vento OS

Estado: `Draft operativo canonico`
Fecha: `2026-03-11`
Owner sugerido: Founder + owner de plataforma

## 1. Proposito

Este documento define el norte unico de Vento OS para evitar que cada repositorio siga resolviendo problemas reales del negocio con soluciones locales, visuales o temporales.

La meta no es solo "ordenar pantallas". La meta es construir una suite donde:

- cada dominio tenga un dueno claro;
- cada operacion tenga flujo normal, excepcion, correccion y auditoria;
- `v1`, `v2` y `v3` se puedan desplegar sin rehacer el modelo;
- las apps dejen de mezclar catalogo, operacion, configuracion y analitica en la misma pantalla o en la misma tabla;
- el centro de produccion, los satelites, el POS, loyalty, RRHH y gerencia puedan evolucionar sin romper la base.

## 2. Tesis del sistema

Vento OS no debe modelar solo pantallas. Debe modelar la operacion real de una empresa gastronomica multi-sede y multi-marca.

La tesis canonicamente correcta es esta:

- una cosa es la identidad maestra de un producto;
- otra cosa es como se mueve fisicamente ese producto;
- otra cosa es como se ofrece comercialmente;
- otra cosa es como se liquida internamente;
- otra cosa es como se analiza gerencialmente.

Cuando esas capas se mezclan, aparecen remaches. Cuando se separan, el sistema escala.

## 3. Alcance total de la operacion

El documento maestro debe cubrir toda la cadena de una operacion de centro de produccion, restaurante y satelites.

### 3.1 Maestros

- productos
- categorias operativas
- sedes
- areas
- ubicaciones fisicas
- unidades
- proveedores
- roles y permisos
- centros de costo
- marcas y contextos comerciales

### 3.2 Abastecimiento y compras

- proveedores
- acuerdos de precio
- ordenes de compra
- recepcion normal contra OC
- recepcion de contingencia
- validacion de costos

### 3.3 Inventario y bodega

- entradas
- stock por sede
- stock por LOC
- movimientos
- conteos
- ajustes
- retiros
- transferencias internas de bodega
- lotes, expiracion y trazabilidad
- LPN/LOC cuando aplique

### 3.4 Produccion

- recetas y BOM
- mise en place
- lotes de produccion
- consumo de insumos
- producto terminado
- rendimiento
- merma
- trazabilidad por lote

### 3.5 Abastecimiento interno entre sedes

- solicitud desde satelite o area
- preparacion en CP o sede origen
- despacho
- recepcion
- faltantes o disputa
- costo de inventario
- liquidacion interna opcional
- precio de transferencia opcional

### 3.6 Comercial y servicio

- venta POS
- pedidos
- pagos
- turnos de caja
- modificadores y menus
- loyalty
- canjes
- feedback

### 3.7 Personas y operacion diaria

- empleados
- invitaciones
- asistencia
- turnos
- sede activa
- permisos por app y por sede

### 3.8 Gerencia y consolidacion

- KPIs por sede
- KPIs por marca
- KPIs por centro de costo
- costo real vs transferido
- margen por sede
- eliminacion de margenes internos en consolidado
- alertas y hallazgos

## 4. Dimensiones maestras que nunca se deben confundir

Estas dimensiones deben quedar separadas en todo el modelo:

- `product`: identidad operativa maestra.
- `site`: sede fisica o entidad operativa.
- `area`: subdominio operativo dentro de la sede.
- `brand`: marca o concepto comercial.
- `channel`: canal de venta o catalogo.
- `cost_center`: centro de costo/resultado.
- `legal_entity`: entidad legal futura, si algun dia existe separacion juridica.

Reglas:

1. `site` no es lo mismo que `brand`.
2. `site` no es lo mismo que `cost_center`.
3. `product` no es lo mismo que `offering` comercial.
4. `inventory cost` no es lo mismo que `transfer price`.
5. `physical movement` no es lo mismo que `financial settlement`.
6. `internal supply` no es lo mismo que `external sale`.

## 5. Capas canonicas del sistema

### 5.1 Capa maestra

Responde:

- que es esto;
- como se llama canonica y operativamente;
- en que unidad se mueve;
- que tipo de item es.

Ejemplos:

- `products`
- `product_categories`
- `sites`
- `areas`
- `inventory_units`
- `suppliers`
- `cost_centers`

### 5.2 Capa operativa

Responde:

- que entro;
- que salio;
- que se produjo;
- que se conto;
- que se ajusto;
- que sede lo tiene.

Ejemplos:

- `inventory_entries`
- `inventory_movements`
- `inventory_stock_by_site`
- `inventory_stock_by_location`
- `production_batches`
- `restock_requests`

### 5.3 Capa comercial

Responde:

- como se muestra el producto al cliente;
- en que menu, catalogo o canal aparece;
- que precio y copy tiene;
- en que categoria comercial cae.

Ejemplos futuros:

- `catalog_contexts`
- `product_offerings`
- `commercial_categories`
- `product_offering_category_assignments`

### 5.4 Capa de liquidacion interna

Responde:

- esta salida entre sedes se liquida o no;
- se liquida a costo, con margen o como venta interna;
- cual es el precio de transferencia;
- cual es el estado de liquidacion.

Ejemplos actuales/parciales:

- `restock_requests.pricing_mode`
- `restock_requests.pricing_status`
- `restock_requests.internal_supplier_site_id`
- `restock_request_items.transfer_unit_price`
- `restock_request_items.transfer_total`

Ejemplos futuros:

- `transfer_pricing_policies`
- `internal_settlement_documents`
- `internal_settlement_lines`

### 5.5 Capa gerencial

Responde:

- cual sede gana o consume;
- cual centro de costo absorbe el movimiento;
- cuanto margen interno hubo;
- como consolidar y eliminar operaciones internas.

Ejemplos:

- `Viso`
- reportes por `site`
- reportes por `cost_center`
- eliminacion de margenes internos en consolidado

## 6. Principios no negociables

1. Una sola fuente de verdad por dominio.
2. Una sola captura por dato critico.
3. Ninguna excepcion se resuelve con un remache invisible; toda excepcion debe quedar modelada.
4. Ninguna tabla critica existe sin pantalla duena.
5. Ninguna pantalla existe sin rol dueno y KPI operativo.
6. Ninguna integracion elimina el fallback manual hasta completar al menos dos ciclos operativos sanos.
7. Un producto maestro no debe cargar atributos comerciales que cambian por negocio, canal o catalogo.
8. El costo del inventario y el precio de transferencia nunca se mezclan.
9. Toda automatizacion futura debe poder auditarse y revertirse.
10. Toda logica que hoy sea intraempresa debe poder migrar a intercompany sin reescribir todo.
11. Toda medicion gerencial debe distinguir dato operativo, dato comercial y dato consolidado.
12. Ningun modulo debe crecer invadiendo responsabilidades del otro.

## 7. Dueno por dominio

| Dominio | Dueno | Que si controla | Que no debe controlar |
| --- | --- | --- | --- |
| Plataforma | `Shell` | auth, sesion, permisos, sedes, navegacion, primitives UI | logica operativa diaria |
| Inventario y logistica | `Nexo` | stock, movimientos, abastecimiento interno, conteos, ajustes, ubicaciones | recetas, OC completas, loyalty |
| Compras | `Origo` | proveedores, OC, recepcion contra OC, acuerdos de compra | stock diario y abastecimiento interno |
| Produccion | `Fogo` | recetas, BOM, lotes, consumo, rendimiento, merma de produccion | catalogo logistico general |
| Venta / POS | `Pulso` | ordenes, caja, pagos, servicio | inventario maestro |
| Cliente / loyalty | `Pass` | puntos, canjes, identidad cliente, experiencia cliente | configuracion operativa interna |
| Personal | `Anima` | asistencia, turnos, invitaciones, regularizaciones | datos de cliente |
| Gerencia | `Viso` | KPIs, feedback, vistas ejecutivas, alertas | captura operativa primaria |

## 8. Decisiones estructurales canonicas

### 8.1 Producto maestro vs oferta comercial

El problema de categorias no es aislado. Revela un error mayor: hoy `products` esta cargando atributos maestros y comerciales al mismo tiempo.

La regla canonica es:

- `products` representa el producto maestro fisico/operativo.
- `product_categories` clasifica el producto maestro de forma canonica y operativa.
- las clasificaciones comerciales por negocio, canal o catalogo no viven en `products.category_id`.
- esas clasificaciones deben vivir en un nivel de oferta comercial contextual.

Documento complementario:

- `vento-nexo/docs/MODELO-CATEGORIAS-CANONICO.md`

### 8.2 Categoria operativa primaria

Mientras exista la columna actual:

- `products.category_id` se interpreta como `primary_operational_category_id`.
- no debe volver a interpretarse como categoria visible de cada marca.
- si un mismo producto aparece en `Bolleria`, `Vitrina` o `Bakery`, eso se resuelve en la capa comercial, no en `products`.

### 8.3 Abastecimiento interno entre sedes

La remision no debe ser el concepto maestro definitivo. El concepto maestro debe ser un `documento interno entre sedes`.

Ese documento puede operar en modos distintos:

- `transferencia_sin_precio`
- `transferencia_a_costo`
- `transferencia_con_margen`
- `venta_interna`
- `consignacion`
- `emergencia`

El movimiento fisico puede ser el mismo. La liquidacion cambia segun politica.

### 8.4 Costo de inventario vs precio de transferencia

Regla critica:

- `inventory_valuation_unit_cost` = costo real o costo estandar del inventario.
- `settlement_unit_price` = valor al que una sede le carga a otra.

Nunca deben mezclarse.

### 8.5 Centro de produccion como proveedor interno

El centro de produccion debe poder evolucionar por etapas:

- en `v1`: sede origen que despacha abastecimiento interno.
- en `v2`: proveedor interno con precio de transferencia y liquidacion entre sedes.
- en `v3`: posible proveedor intercompany o mayorista, si la estructura legal o contable lo requiere.

### 8.6 Venta interna vs remision interna

Si hoy todo sigue bajo la misma empresa legal, lo correcto normalmente es:

- movimiento fisico interno;
- liquidacion interna gerencial;
- consolidacion con eliminacion de margenes internos.

Si en el futuro hay entidades legales distintas, el mismo modelo debe extenderse a:

- proveedor interno formal;
- cliente interno formal;
- AR/AP;
- impuestos;
- factura real.

### 8.7 Centros de costo

Reglas:

- una sede puede tener varios centros de costo;
- el CP tambien puede ser sede y centro de costo;
- un documento puede tener centro de costo en cabecera;
- una linea puede requerir centro de costo propio;
- `site` y `cost_center` nunca se deben colapsar en una sola cosa.

## 9. Arquitectura objetivo del catalogo

### 9.1 Nivel maestro

- `products`: identidad fisica/operativa.
- `product_categories`: taxonomia canonica para inventario, produccion, abastecimiento y reporting base.
- `product_site_settings`: reglas operativas por sede.

### 9.2 Nivel comercial

Agregar en `v2`:

- `catalog_contexts`: contexto comercial reutilizable por negocio/canal.
- `commercial_categories`: arbol comercial por contexto.
- `product_offerings`: representacion comercial del producto maestro dentro de un contexto.
- `product_offering_category_assignments`: asignacion de una o varias categorias comerciales por offering.

Esto evita duplicar el producto cuando cambian:

- categoria comercial;
- nombre visible;
- precio;
- foto de catalogo;
- orden en menu;
- disponibilidad por negocio o canal.

## 10. V1 inmediata: implementacion simple pero escalable

Esta seccion define que SI entra en implementacion inmediata y que NO debe bloquear `v1`.

### 10.1 Lo que SI entra en `v1`

- producto maestro unico;
- categoria operativa primaria;
- configuracion por sede (`product_site_settings`);
- sedes, rutas de abastecimiento y ubicaciones base;
- entradas manuales y recepcion de contingencia;
- stock por sede y por LOC;
- abastecimiento interno fisico entre sedes;
- conteos, ajustes, retiros y traslados;
- recetas y lotes solo donde sean estrictamente necesarios para no romper produccion, pero sin invadir `Nexo`;
- par levels minimos por sede;
- salud de catalogo y validaciones fuertes;
- trazabilidad suficiente para auditar movimientos.

### 10.2 Lo que NO debe bloquear `v1`

- categoria comercial por negocio;
- contexts comerciales y offerings completos;
- settlement interno completo;
- intercompany real;
- contabilidad automatica;
- dashboards gerenciales complejos;
- automatizacion total entre compras, produccion y POS.

### 10.3 Lo que debe quedar preparado pero escondido en `v1`

- `pricing_mode` y `pricing_status` en abastecimiento interno;
- `transfer_unit_price` por linea, sin exigir su uso diario;
- `cost_centers` como dimension de datos, aunque la UI inicial sea minima;
- estructura futura de contexts comerciales;
- hooks de integracion con `Origo`, `Fogo`, `Pulso` y `Viso`.

### 10.4 Regla de simplificacion

En `v1`, cada usuario debe poder entender en menos de 10 segundos:

- que pantalla abrir;
- que accion hacer;
- que dato es obligatorio;
- que excepcion debe registrar;
- que resultado esperar.

Si una pantalla exige entender producto, pricing interno, menu comercial, centros de costo y reglas contables al mismo tiempo, esa pantalla esta mal disenada para `v1`.

## 11. Backbone documental y de datos para `v1`

### 11.1 Catalogo maestro

- `products`
- `product_categories`
- `product_site_settings`

### 11.2 Compra externa

- `purchase_orders`
- `purchase_order_items`
- recepcion en `inventory_entries`

### 11.3 Produccion

- `recipes`
- `recipe_cards`
- `production_batches`
- consumo y terminados en inventario

### 11.4 Abastecimiento interno

Actual `v1`:

- `restock_requests`
- `restock_request_items`

Interpretacion canonica:

- documento fisico de suministro interno entre sedes;
- con posibilidad futura de liquidacion y precio interno.

### 11.5 Transferencia de bodega

- `inventory_transfers`
- `inventory_transfer_items`

Uso correcto:

- movimiento dentro de la misma sede o bodega, no sustituto de abastecimiento entre sedes.

### 11.6 Venta externa

- `orders`
- `order_items`
- `pos_*`
- `loyalty_*`

## 12. Arquitectura objetivo del abastecimiento interno

### 12.1 `v1`

- mantener `restock_requests` como flujo fisico principal;
- permitir solicitud, preparacion, despacho y recepcion;
- no depender de liquidacion para mover inventario;
- permitir valores de pricing guardados sin volverlos obligatorios;
- tratar CP como sede origen, no como POS disfrazado.

### 12.2 `v2`

Agregar o endurecer:

- politica de precio de transferencia;
- pricing por origen/destino/producto/categoria;
- estado de liquidacion;
- centros de costo en cabecera y linea;
- reportes por sede y por centro de costo.

### 12.3 `v3`

Agregar:

- liquidacion automatica;
- eventos entre apps;
- integracion contable o BI;
- soporte intercompany si algun dia aplica.

## 13. Contrato de versiones

| Version | Significado real | Permitido | Prohibido |
| --- | --- | --- | --- |
| `v1` | Manual pero auditable | checklists, entradas manuales, confirmaciones humanas, contingencias, captura operativa simple | automatizacion opaca |
| `v2` | Integrado pero supervisado | pre-cargas, integraciones entre apps, menos doble digitacion, pricing interno formal | depender de una sola integracion sin fallback |
| `v3` | Automatizado con cola de excepciones | eventos, sugerencias automaticas, alertas y reglas, settlement automatizado | flujos irreversibles sin auditoria |

## 14. Norte de navegacion para NEXO

`NEXO` debe quedar organizado por intencion operativa.

### 14.1 Operar

- Entradas
- Abastecimiento interno
- Conteos
- Traslados
- Retiros

### 14.2 Verificar

- Stock
- Movimientos
- Alertas
- Salud de catalogo

### 14.3 Configurar

- Productos
- Ubicaciones
- Sedes
- Rutas de abastecimiento
- Unidades
- Categorias

### 14.4 Integrar

- Produccion: redirect o vinculo a `Fogo`
- Compras: vinculo a `Origo`
- Comercial: lectura de contexts y offerings cuando exista `v2`

### 14.5 Utilidades

- Impresion
- Escaneo
- Setup/checklist

## 15. Plan de trabajo maestro

### Fase 0 — Congelar el modelo de gobierno

Objetivo: dejar de inventar estructura mientras se corrige operacion.

Entregables:

- mapa unico de dominios y duenos;
- definicion unica de `v1`, `v2`, `v3`;
- lista de excepciones reales del negocio;
- decision canonica del modelo de producto/categorias;
- decision canonica del modelo de abastecimiento interno y liquidacion;
- backlog unificado por cadena operativa.

### Fase 1 — Cerrar `NEXO v1`

Objetivo: que `NEXO` haga muy bien inventario base y abastecimiento interno fisico.

Acciones:

- esconder o mover lo que no sea core de `v1`;
- separar setup de operacion diaria;
- partir paginas grandes en modulos;
- hacer que el UI kit mande de verdad;
- tratar `restock_requests` como documento fisico canonicamente interpretable;
- dejar lista la semantica de `pricing_mode` sin obligar aun la liquidacion completa;
- endurecer par levels y alertas basicas por sede.

### Fase 2 — Endurecer plataforma compartida

Objetivo: que las apps dejen de copiar layout, auth y componentes a mano.

Acciones:

- estabilizar AppShell;
- extraer primitives compartidas;
- unificar guards, sesion, site switcher y pattern de errores;
- formalizar contratos compartidos de datos y tipos.

### Fase 3 — Integrar por verticales

Objetivo: conectar la cadena sin un big bang.

Orden recomendado:

1. `Origo -> Nexo` para recepcion contra OC.
2. `Fogo -> Nexo` para consumo y terminados.
3. `Nexo -> settlement interno` para pricing y centros de costo.
4. `Pulso -> Pass` para loyalty real.
5. `Viso` para lectura ejecutiva consolidada.

### Fase 4 — Migrar el modelo comercial del catalogo

Objetivo: sacar del producto maestro todo lo que cambia por negocio/canal.

Acciones:

- crear contexts comerciales;
- crear offerings por contexto;
- crear categorias comerciales contextuales;
- mover filtros y navegacion comercial a ese nivel.

### Fase 5 — Hardening

Objetivo: volver la suite segura, auditable y mantenible.

Acciones:

- observabilidad;
- metricas de uso real de pantallas;
- politicas de deprecacion;
- pruebas de permisos;
- pruebas de integridad operativa por cadena;
- pruebas de consistencia entre costo inventariable y precio de transferencia.

## 16. Hallazgos externos que validan el modelo

Se revisaron patrones actuales en sistemas reales de inventario, ERP y restaurant ops.

### 16.1 Categoria operativa distinta de categoria comercial

Patron validado externamente:

- Restaurant365 separa `Item Categories` de `Menu Item Categories`.
- Las categorias de inventario se usan para subtotales, cuentas, variancias y recetas.
- Las categorias de menu se usan para agrupar items visibles/reportables de venta.

Implicacion para Vento:

- `products.category_id` no debe seguir resolviendo al mismo tiempo inventario y menu.

### 16.2 Producto maestro compartido, transacciones separadas

Patron validado externamente:

- Odoo permite productos compartidos entre companias y separa eso de las transacciones inter-company.

Implicacion para Vento:

- un producto maestro puede ser compartido por varias marcas/sedes sin obligar a duplicarlo;
- la liquidacion entre entidades o sedes debe vivir en otra capa.

### 16.3 Reabastecimiento entre almacenes/sedes por rutas y reglas

Patron validado externamente:

- Odoo modela el reabastecimiento entre almacenes con rutas y reglas de reposicion.
- Lightspeed modela las transferencias como flujo origen -> en transito -> recepcion.
- Lightspeed usa `par levels` como punto de reposicion visible para operacion.

Implicacion para Vento:

- la ruta de abastecimiento y el minimo por sede deben ser parte del core de `v1`.

### 16.4 Precio fuera del item maestro

Patron validado externamente:

- ERPNext separa `Item` de `Item Price`, permite multiples price lists y precios por UOM.

Implicacion para Vento:

- el precio no debe quedar pegado rigidamente al producto maestro cuando cambie por negocio, canal o politica.

### 16.5 Receta construida con items ya existentes

Patron validado externamente:

- Lightspeed exige que producto final e ingredientes existan primero como items antes de construir recetas.

Implicacion para Vento:

- el catalogo maestro primero, la receta despues.
- no se debe crear producto nuevo desde el modulo de recetas como atajo.

## 17. Donde te puedes estar equivocando hoy

1. Querer que `v1` resuelva visualmente demasiados casos de `v2` y `v3`.
2. Intentar que una sola categoria responda operacion, menu, reportes y marca.
3. Usar `site` como sustituto de `brand` o de `cost_center`.
4. Dejar que `Nexo` siga absorbiendo produccion, compras y comercial al mismo tiempo.
5. Querer automatizacion total antes de cerrar un flujo manual auditable.
6. Creer que una venta interna futura obliga a modelar una venta POS desde ya.

La correccion es esta:

- `v1` debe ser simple en UI, pero correcta en semantica.
- El modelo se prepara para crecer; la interfaz no tiene por que mostrar todo desde el dia uno.

## 18. Criterios de listo

### `NEXO v1` listo

- flujo `catalogo -> entradas -> stock -> abastecimiento interno -> conteo` sin dependencias ocultas;
- navegacion limpia por intencion;
- sin modulos de produccion editables dentro de `NEXO`;
- sin formularios que mezclen setup, merchandising y operacion;
- par levels minimos visibles por sede;
- validacion de salud de catalogo suficiente para operar.

### `v2` listo

- producto maestro separado de oferta comercial;
- recepcion desde `Origo`;
- produccion desde `Fogo`;
- pricing interno formal;
- centros de costo utiles para gestion;
- fallback manual todavia activo.

### `v3` listo

- automatizacion por eventos;
- cola de excepciones visible;
- KPIs y alertas confiables;
- pocas intervenciones manuales fuera de contingencia;
- settlement y consolidacion suficientemente maduros.

## 19. Prohibiciones explicitas

No hacer:

- duplicar el producto maestro solo porque cambia la categoria comercial;
- seguir usando `products.category_id` para resolver merchandising por negocio;
- meter reglas de `Saudo`, `Vento Cafe`, `Molka` o futuras marcas directamente en tablas core;
- crear mas filtros de `scope/domain/site` para forzar una sola categoria a responder todo;
- convertir el CP en un POS disfrazado para cobrarle a satelites;
- mezclar costo inventariable con precio de transferencia;
- usar `site` como sustituto de `cost_center`;
- agregar nuevas excepciones sin decidir si son flujo normal, excepcion permanente o workaround temporal.

## 20. Decisiones obligatorias a aprobar

1. Confirmar que `products` sera producto maestro y no menu/oferta.
2. Confirmar que `products.category_id` queda como categoria operativa primaria.
3. Confirmar que las categorias comerciales saldran del producto maestro y viviran en contexts/offerings.
4. Confirmar que `audience` dejara de ser el mecanismo central de diferenciacion comercial.
5. Confirmar que `restock_requests` se interpretara como documento fisico de abastecimiento interno y no solo como remision basica.
6. Confirmar que el costo del inventario y el precio de transferencia siempre iran separados.
7. Confirmar que `cost_centers` sera dimension real del sistema y no un accesorio tardio.
8. Confirmar que `NEXO` se congela como inventario/logistica y no seguira creciendo como hub de todo.
