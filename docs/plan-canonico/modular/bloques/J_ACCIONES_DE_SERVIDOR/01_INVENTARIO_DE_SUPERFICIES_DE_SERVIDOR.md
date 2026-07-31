### MINI-BLOQUE — INVENTARIO DE SUPERFICIES DE SERVIDOR

<!-- PLAN-SECTION-META:START -->
**Cobertura canónica:** `AUTH-SRV-001` a `AUTH-SRV-003` — 3 tareas.
<!-- PLAN-SECTION-META:END -->

### [ ] AUTH-SRV-001 — Inventariar Server Actions de todos los repositorios
### [ ] AUTH-SRV-002 — Inventariar API routes
### [ ] AUTH-SRV-003 — Inventariar RPC utilizadas

### Package VISO mensual

`AUTH-SRV-001` registra `createMonthlyShiftsAction`, `deleteMonthlyDraftShiftAction`, `deleteMonthlyDraftsAction` y `publishMonthAction`, con entradas, tablas, cliente, acceso, mutación, revalidación, auditoría y error.

`AUTH-SRV-002` confirma que no hay API route nueva. `AUTH-SRV-003` no clasifica el trigger como RPC.
