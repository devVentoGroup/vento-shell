### MINI-BLOQUE — NÚCLEO MÍNIMO PARA OPERACIÓN

<!-- PLAN-SECTION-META:START -->
**Cobertura canónica:** `VISO-CORE-001` a `VISO-CORE-006` — 6 tareas.
<!-- PLAN-SECTION-META:END -->

<!-- EXECUTION-GATE-RECONCILIATION:B601-800:VISO-CORE -->
### Reconciliación topológica de VISO-CORE-001 a VISO-CORE-006

La familia es mixta: `VISO-CORE-001`, `VISO-CORE-002` y `VISO-CORE-006` definen, vinculan y aprueban el corte mínimo; `VISO-CORE-003..005` materializan dependencias, autorización, conflictos y auditoría.

| Tareas | Modalidad | Gate |
| --- | --- | --- |
| `VISO-CORE-001`, `VISO-CORE-002`, `VISO-CORE-006` | `DEFINE_ONCE` | `NO_PHYSICAL_INSTANCE` |
| `VISO-CORE-003..005` | `PER_IMPLEMENTATION_UNIT` | `POST_E5_PACKAGE` |

### [ ] VISO-CORE-001 — Definir núcleo mínimo de VISO
### [ ] VISO-CORE-002 — Vincular núcleo con capacidades empresariales
### [ ] VISO-CORE-003 — Implementar dependencias administrativas mínimas
### [ ] VISO-CORE-004 — Implementar autorización real del núcleo
### [ ] VISO-CORE-005 — Implementar validación de conflictos y auditoría
### [ ] VISO-CORE-006 — Aprobar núcleo antes de ampliar alcance

### Dependencias del delta mensual

- `VISO-CORE-003` consume `VISO-SCH-008`.
- `VISO-CORE-004` debe demostrar permisos por acción o justificar un permiso común sin exceso.
- `VISO-CORE-005` incluye conflictos, límites, concurrencia, auditoría, corrección, borrado de borradores y notificación.
- `VISO-CORE-006` no cierra con el delta abierto ni sin cierre del package cuando este forme parte del núcleo.
