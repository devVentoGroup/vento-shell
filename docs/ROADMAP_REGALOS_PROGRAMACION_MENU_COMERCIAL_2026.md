# Roadmap: regalos, programación y menú comercial

Estado base: julio de 2026.

## Principios funcionales

- El producto comercial tiene una sección principal.
- El producto puede aparecer en múltiples menús, campañas o temporadas.
- Desactivar una colección no desactiva sus productos.
- El comprador y el destinatario de un regalo son personas diferentes.
- La factura electrónica pertenece al comprador; el paquete de regalo no incluye precios ni comprobante físico.
- Programación y regalo son funciones independientes: un pedido puede ser inmediato/programado y normal/regalo.
- VISO debe mostrar decisiones de negocio y resolver automáticamente la estructura técnica.

## Fase A — Modelo e interfaz comercial

- [x] Diagnóstico general y estructural del menú.
- [x] Crear `pass.catalog_item_collections`.
- [x] Migrar la colección actual como relación primaria.
- [x] Mantener `catalog_items.commercial_collection_id` temporalmente por compatibilidad.
- [x] Crear entrada guiada de Menú comercial en VISO.
- [ ] Permitir seleccionar múltiples menús/temporadas al crear y editar un producto.
- [ ] Agregar automáticamente la sección del producto a las colecciones seleccionadas.
- [ ] Simplificar la pantalla de colecciones para seleccionar productos y generar secciones.
- [ ] Actualizar Vento Pass para consumir relaciones múltiples.
- [ ] Retirar dependencia funcional del campo legado cuando todos los consumidores estén migrados.

## Fase B — Disponibilidad y productos por encargo

- [ ] Configuración por producto y sede: inmediato, programable o programación obligatoria.
- [ ] Anticipación mínima y máxima.
- [ ] Hora límite y días disponibles.
- [ ] Primera fecha disponible calculada desde el carrito.
- [ ] Restricción más exigente cuando el carrito mezcla productos.
- [ ] Etiquetas en Pass: disponible ahora, por encargo, primera fecha disponible.
- [ ] Vista de pedidos programados y fecha límite de preparación en Pulso.

## Fase C — Personalizaciones de tortas y entremets

- [ ] Mantener opciones cerradas: tamaño, porciones, sabor, acabado y decoración.
- [ ] Agregar campos escritos configurables: texto corto, texto largo, número y fecha.
- [ ] Longitud máxima y obligatoriedad por campo.
- [ ] Mostrar la personalización estructurada en Pulso y posteriormente en FOGO.

## Fase D — Regalos en Vento Pass

- [ ] Checkbox “Este pedido es un regalo”.
- [ ] Catálogo reutilizable de destinatarios.
- [ ] Varias direcciones por destinatario.
- [ ] Dirección y teléfono del destinatario en la entrega; comprador conservado para pago y novedades.
- [ ] Regalo sorpresa y contacto primero al comprador.
- [ ] Fallback cuando el comprador no responda.
- [ ] Tarjeta: mensaje, Para y De.
- [ ] Ocultar precios, recibos y factura física.
- [ ] Snapshot inmutable del regalo por pedido.
- [ ] Badges y checklist operativo en Pulso.

## Fase E — Entrega programada

- [ ] Lo antes posible o programar.
- [ ] Fecha y franja de entrega.
- [ ] Validación contra horario, anticipación y disponibilidad del producto.
- [ ] `requested_for`, fin de ventana y liberación de preparación.
- [ ] Filtro de programados en Pulso.
- [ ] Alertas de preparación próxima y pedido en riesgo.

## Fase F — Evolución posterior

- [ ] Capacidad máxima por franja.
- [ ] Repetir regalo para un destinatario.
- [ ] Ocasión y fechas importantes.
- [ ] Recordatorios de cumpleaños o aniversarios.
- [ ] Tarjetas premium, envolturas y diseños.
- [ ] Comprobante de entrega y notificación al comprador.
- [ ] Integración con FOGO para producción anticipada.
