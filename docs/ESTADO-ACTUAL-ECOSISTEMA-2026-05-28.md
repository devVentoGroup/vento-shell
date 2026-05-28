# Estado actual del ecosistema Vento OS

Fecha: 2026-05-28
Owner documental: vento-shell
Estado: referencia operativa viva

Este documento reemplaza los planes generales antiguos cuando haya conflicto. Los documentos historicos siguen sirviendo para contexto, pero la fuente vigente para estado de apps, brechas y sinergia es este archivo.

## Regla de gobierno

- `vento-shell` es la fuente canonica de base de datos, migraciones Supabase, RPCs, Edge Functions, permisos y contratos compartidos.
- Las apps de negocio consumen esos contratos y no deben crear migraciones paralelas propias para tablas compartidas.
- Cada dominio tiene un dueno claro: Nexo inventario/logistica, Origo compras, Fogo produccion, Pulso POS/salon, Pass cliente/comercio, Anima personal, Viso gerencia/backoffice.
- Las categorias operativas no son categorias comerciales. El producto maestro no debe absorber menu, merchandising ni pricing por canal.
- El inventario fisico por presentacion se guarda como hecho fisico; no se infiere desde stock base.

## Estado por aplicacion

| App | Rol actual | Implementado | Falta para sinergia completa |
| --- | --- | --- | --- |
| Shell | Plataforma, Supabase, auth, permisos y funciones compartidas | Migraciones centralizadas, RLS/seguridad endurecida, pagos Wompi, delivery quotes, categorias comerciales Pass, production area rules, permisos de media, funciones de notificaciones | Consolidar docs antiguas, pruebas automatizadas de permisos/RPC, catalogo unico de contratos por app, observabilidad formal de Edge Functions |
| Nexo | Inventario, LOCs, abastecimiento interno, conteos, movimientos | Catalogo maestro, settings por sede, stock por sede/LOC, stock fisico por presentacion, remisiones con preparacion/recepcion, kiosk/board LOC, entradas, traslados, retiros, ajustes, conteos, etiquetas/printing | Recepcion contra OC de Origo, integracion completa con Fogo para consumo/terminado, liquidacion interna/cost centers, hardening del rediseño de remisiones por modos |
| Origo | Compras, proveedores y ordenes de compra | Auth Shell, proveedores, OC draft/sent/received, edicion de borradores, PDF/token publico, recibos iniciales, enlace hacia Nexo | Recepcion real contra OC conectada a Nexo, estados parciales, precios acordados, aprobaciones, trazabilidad de diferencias/costos |
| Fogo | Recetas, recipe book y lotes de produccion | Recetas, recipe book operacional, lotes desde receta publicada, permisos separados, areas de produccion por `site_area_purpose_rules`, RPC de batch desde receta | Experiencia completa de ejecucion en planta, consumo/terminado sincronizado y visible en Nexo, costos/rendimientos, mermas, etiquetas de lote |
| Pulso | Salon, POS operativo y puente con Pass | Salon visual, scanner, ordenes realtime, identificacion cliente, validacion/redencion loyalty, award loyalty, base de componentes POS | Llamados de mesa persistentes/realtime si no estan migrados, sesiones/caja completas, pagos/cierre, integracion formal con Pass y posible descuento de inventario |
| Viso | Backoffice gerencial y admin de Pass/personal/web | Negocios/sedes, staff, attendance report, calendario, schedule planner, menu y categorias comerciales, colecciones, productos, Pass users, CMS web, uploads | Dashboards ejecutivos reales, IA de horarios integrada al planner, auditoria gerencial cross-app, publicar/avisar turnos hacia Anima con confiabilidad completa |
| Pass | Cliente, catalogo comercial y checkout | Catalogo comercial por sede/precio/presentacion, checkout con Wompi gated, delivery address/quotes, conversaciones de orden | Cierre completo POS/Pulso, soporte operacional de pedidos, estados logisticos, reporting de loyalty y pagos |
| Anima | App movil de empleados | Asistencia, turnos publicados, notificaciones push registradas, documentos, soporte/in-app updates | Ledger unificado de notificaciones, cron shift-runtime corregido, pushes para soporte/anuncios/documentos, read/seen estructural |

## Integraciones criticas

### Origo -> Nexo

Estado: parcialmente preparado. Origo puede crear y enviar OC y tiene enlace a `Recibir en Nexo`; Nexo todavia debe consumir `purchase_order_id`, precargar lineas y registrar recepcion contra OC con diferencias auditables.

Criterio de listo:
- OC enviada en Origo aparece como opcion de recepcion en Nexo.
- Nexo registra cantidades recibidas, faltantes, costo y presentacion fisica cuando aplique.
- Origo refleja parcial/recibida sin doble digitacion.

### Fogo -> Nexo

Estado: base fuerte. Fogo crea lotes desde recetas y Shell ya habilita LOCs de produccion por reglas de area. Falta cerrar la experiencia operacional y la reconciliacion visible de consumo/terminado en Nexo.

Criterio de listo:
- Produccion descuenta insumos fisicos correctos.
- Producto terminado entra a LOC/sede correcta.
- Nexo puede auditar movimientos originados por Fogo sin editar recetas.

### Pulso -> Pass -> Shell pagos

Estado: en progreso. Pass tiene checkout/pagos/delivery; Pulso tiene POS/ordenes/loyalty actions. Falta definir el flujo unico caja-cliente-pago para evitar duplicar ordenes o estados.

Criterio de listo:
- Una orden tiene owner operacional claro.
- Pagos se crean solo desde Edge Functions seguras.
- Loyalty se acredita/redime con trazabilidad y sin secretos en cliente.

### Viso -> Anima

Estado: planner/backoffice existe; Anima consume turnos publicados. Falta confiabilidad de notificacion, ledger de lectura y cierre del runtime cron.

Criterio de listo:
- Publicar turno dispara aviso auditable.
- El empleado ve solo turnos publicados.
- Managers pueden medir pendientes/vistos sin depender de estado efimero.

## Documentos vigentes recomendados

- Shell: `docs/ESTADO-ACTUAL-ECOSISTEMA-2026-05-28.md`, `docs/ARQUITECTURA-MIGRACIONES-CENTRALIZADAS.md`, `supabase/MIGRATION_MANIFEST.md`.
- Nexo: `docs/ESTADO-ACTUAL-NEXO-2026-05-28.md` y docs de flujos especificos que sigan alineados con codigo.
- Origo: `README.md` como estado operativo; eliminar guias placeholder de deploy.
- Fogo: `docs/ESTADO-ACTUAL-FOGO-2026-05-28.md` y README actualizado.
- Pulso: `docs/ESTADO-ACTUAL-PULSO-2026-05-28.md`; los docs de Salon quedan como diseño historico si no contradicen este estado.
- Viso: `docs/ESTADO-ACTUAL-VISO-2026-05-28.md`; los docs VISO/ANIMA de marzo quedan como historicos.

## Documentos obsoletos por tipo

- README generico de Next.js: reemplazar por estado real del repo.
- Guia de crear repo en GitHub/Vercel para apps ya existentes: eliminar.
- Planes fechados que dicen que una app es placeholder o que no tiene auth cuando el codigo ya lo tiene: reemplazar o marcar como historico.
- SQL orientativo dentro de docs: no ejecutarlo desde app; convertirlo en migracion desde `vento-shell` si se decide implementar.

## Backlog maestro de sinergia

1. Cerrar Origo -> Nexo recepcion contra OC.
2. Cerrar Fogo -> Nexo produccion con consumo/terminado auditable.
3. Unificar Pulso/Pass orden, pago y loyalty.
4. Completar notificaciones Anima/Viso con ledger y cron sano.
5. Crear catalogo de contratos Shell por app: tablas, RPCs, permisos, Edge Functions y eventos.
6. Convertir documentos historicos en `archive` o eliminarlos cuando sean duplicados exactos.
