### MINI-BLOQUE — TRANSICIÓN DEL POS EXTERNO

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **transición del pos externo** dentro de **X INTEGRACIONES**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `INT-POS-001` a `INT-POS-024` — 24 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Límites funcionales:** comienza con “Auditar documentación, endpoints, webhooks y límites del POS vigente” y concluye con “Definir revocación o reducción de credenciales cuando PULSO asuma la fuente”.
<!-- PLAN-SECTION-META:END -->

### [ ] INT-POS-001 — Auditar documentación, endpoints, webhooks y límites del POS vigente
### [ ] INT-POS-002 — Confirmar información disponible mediante API
### [ ] INT-POS-003 — Definir al POS vigente como fuente temporal del hecho de venta
### [ ] INT-POS-004 — Definir requisitos y procedimiento de una credencial independiente, revocable e inicialmente de solo lectura
### [ ] INT-POS-005 — Definir contrato canónico de venta y línea de venta
### [ ] INT-POS-006 — Definir importación de encabezados, líneas, estados y timestamps
### [ ] INT-POS-007 — Definir importación de descuentos, impuestos, propinas y medios de pago
### [ ] INT-POS-008 — Definir importación de anulaciones, devoluciones y reembolsos
### [ ] INT-POS-009 — Definir conservación de payload original, versión, hash y fecha de recepción
### [ ] INT-POS-010 — Definir mapeo de empresa, sede, terminal y caja externa
### [ ] INT-POS-011 — Definir mapeo de producto externo, producto Vento, presentación y receta
### [ ] INT-POS-012 — Definir cuarentena de líneas sin mapeo y sin descuento de inventario
### [ ] INT-POS-013 — Definir idempotencia por sistema, venta y línea externa
### [ ] INT-POS-014 — Definir webhook cuando exista y polling de conciliación como respaldo
### [ ] INT-POS-015 — Definir emisión del evento canónico de venta validada
### [ ] INT-POS-016 — Definir salida de inventario en NEXO exactamente una vez
### [ ] INT-POS-017 — Definir evento económico para NUMERA exactamente una vez
### [ ] INT-POS-018 — Definir evento de fidelización para PASS cuando corresponda
### [ ] INT-POS-019 — Definir compensación de anulaciones y devoluciones sin borrar historia
### [ ] INT-POS-020 — Definir conciliación diaria entre POS y efectos internos
### [ ] INT-POS-021 — Diseñar piloto sin efectos sobre inventario ni finanzas
### [ ] INT-POS-022 — Diseñar piloto controlado con efectos habilitados
### [ ] INT-POS-023 — Definir transición futura desde POS externo hacia PULSO
### [ ] INT-POS-024 — Definir revocación o reducción de credenciales cuando PULSO asuma la fuente

Flujo obligatorio:

```text
POS EXTERNO
        ↓
ADAPTADOR DEL PROVEEDOR
        ↓
STAGING Y PAYLOAD ORIGINAL
        ↓
VALIDACIÓN E IDEMPOTENCIA
        ↓
MAPEO DE SEDES Y PRODUCTOS
        ↓
CONTRATO CANÓNICO DE VENTA
        ├── NEXO
        ├── NUMERA
        └── PASS, cuando corresponda
```

Reglas:

- el proveedor no escribirá directamente en tablas internas;
- el proveedor no recibirá acceso a Supabase;
- una línea sin mapeo no descontará inventario;
- una venta duplicada no producirá efectos adicionales;
- una devolución generará una compensación auditable;
- el documento fiscal seguirá siendo responsabilidad del POS vigente;
- la integración temporal no se considerará implementación completa de PULSO.
