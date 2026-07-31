### MINI-BLOQUE — NÚCLEO MÍNIMO PARA OPERACIÓN

<!-- PLAN-SECTION-META:START -->
**Cobertura canónica:** `VISO-CORE-001` a `VISO-CORE-006` — 6 tareas.
<!-- PLAN-SECTION-META:END -->

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
