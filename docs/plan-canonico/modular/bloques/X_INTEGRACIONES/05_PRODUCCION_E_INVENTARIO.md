### MINI-BLOQUE — PRODUCCION E INVENTARIO

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **produccion e inventario** dentro de **X INTEGRACIONES**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `INT-PROD-001` a `INT-PROD-005` — 5 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `INT-PROD-001`: Definir contrato para que FOGO solicite o reserve insumos
- `INT-PROD-002`: Definir contrato para que NEXO registre el consumo
- `INT-PROD-003`: Definir contrato para que FOGO finalice el lote
- `INT-PROD-004`: Definir contrato para que NEXO registre el producto terminado
- `INT-PROD-005`: Definir tratamiento de producción insuficiente para remisiones
<!-- PLAN-SECTION-META:END -->

### [ ] INT-PROD-001 — Definir contrato para que FOGO solicite o reserve insumos
### [ ] INT-PROD-002 — Definir contrato para que NEXO registre el consumo
### [ ] INT-PROD-003 — Definir contrato para que FOGO finalice el lote
### [ ] INT-PROD-004 — Definir contrato para que NEXO registre el producto terminado
### [ ] INT-PROD-005 — Definir tratamiento de producción insuficiente para remisiones

POS EXTERNO → CONTRATO CANÓNICO DE VENTAS → NEXO / NUMERA / PASS

Principio de transición

Mientras PULSO no sea la fuente operativa y fiscal definitiva de ventas,
el POS vigente podrá actuar como fuente temporal de ventas confirmadas.

El POS externo será fuente temporal de:

- hecho de venta;
- líneas vendidas;
- documento fiscal emitido externamente;
- descuentos;
- impuestos;
- propinas;
- medios de pago;
- anulaciones y devoluciones.

El POS externo no será propietario de:

- inventario;
- recetas;
- costos;
- contabilidad interna;
- catálogo canónico de productos;
- fidelización;
- autorización laboral.
