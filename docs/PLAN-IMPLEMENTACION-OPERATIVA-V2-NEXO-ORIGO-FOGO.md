# Plan de Implementacion Operativa V2 (NEXO + ORIGO + FOGO)

Fecha: 2026-04-14
Estado: En ejecucion

## Alcance de esta fase

- Incluye: inventario, remisiones, traslados internos, produccion por lote y costeo operativo.
- Excluye: turnos/rrhh de ANIMA (se integra en fase posterior).

## Objetivo operativo

Lograr que el flujo diario sea ejecutable por trabajadores con pantallas simples (`pedir`, `despachar`, `recibir`, `contar`) manteniendo trazabilidad tecnica (`LOC`, `LPN`, movimientos).

## Avance de hoy

- [x] Documento maestro de implementacion creado.
- [x] Migracion `20260414143000_ops_v2_readiness_views.sql` creada.
- [x] Script `supabase/ops_v2_readiness_check.sql` creado para auditoria operativa.
- [x] Aplicar migracion en remoto (`supabase db push`).
- [x] Sincronizar migraciones al resto de repos.

## Fase 0 - Base tecnica (vento-shell)

### Checklist

- [ ] Congelar esquema v2 de inventario/remisiones/produccion.
- [ ] Aplicar migraciones pendientes en remoto.
- [ ] Sincronizar migraciones a todos los repos conectados.
- [ ] Ejecutar auditoria de readiness por sede.

### Migraciones pendientes detectadas

- `20260409113000_nexo_remission_area_kind_galleteria.sql`
- `20260409121500_nexo_fix_galleteria_category_not_area.sql`
- `20260409133000_nexo_remove_area_kind_galleteria.sql`
- `20260413120000_viso_planning_ai_foundation.sql`
- `20260414143000_ops_v2_readiness_views.sql`

## Fase 1 - NEXO (maestro operativo)

### Checklist

- [ ] LOC base por sede (recepcion, secos, frio, congelado, produccion, despacho, devoluciones).
- [ ] Areas por sede para remision (Vento Cafe, Saudo, Molka).
- [ ] Configurar producto por sede: disponible, area sugerida, unidad operativa/remision.
- [ ] LPN solo para categorias criticas (lote/vencimiento/alto costo).
- [ ] Conteo inicial por sede sin campos tecnicos para el trabajador.

## Fase 2 - ORIGO (flujo diario)

### Checklist

- [ ] Solicitud: buscador dinamico integrado a la lista.
- [ ] Alistamiento: origen LOC sugerido automatico.
- [ ] Despacho: confirmar completo/parcial/faltante por item.
- [ ] Recepcion satelite: confirmacion operativa simple.
- [ ] Historial de remision auditable por producto/sede/area.

## Fase 3 - FOGO (produccion)

### Checklist

- [ ] Receta publicada por producto de preparacion.
- [ ] BOM + pasos sin mezclar datos de otro producto.
- [ ] Cierre de lote: consumo insumos + entrada producto final.
- [ ] Mostrar costo total y costo por porcion.
- [ ] Si aplica, generar trazabilidad de lote/vencimiento.

## Fase 4 - Integracion entre apps

### Checklist

- [ ] NEXO define catalogo, unidades, areas y reglas.
- [ ] FOGO impacta inventario real (movimientos).
- [ ] ORIGO remisiona contra stock real actualizado.
- [ ] Validar flujo E2E: solicitar -> alistar -> despachar -> recibir -> contar.

## Criterio de salida

- [ ] Tiempo de solicitud < 60s por trabajador.
- [ ] Tiempo de recepcion < 45s.
- [ ] Sin captura manual de campos tecnicos en operacion diaria.
- [ ] Descuadre diario dentro de tolerancia definida por sede.

## Arranque inmediato

1. Aplicar y sincronizar migraciones pendientes.
2. Ejecutar script `supabase/ops_v2_readiness_check.sql`.
3. Priorizar sedes piloto: `Centro de Produccion` y `Vento Cafe`.
4. Cerrar brechas de configuracion y repetir auditoria.
