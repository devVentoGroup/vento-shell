### MINI-BLOQUE — VALIDACIÓN AUTORIZACIÓN Y TERRITORIO

<!-- PLAN-SECTION-META:START -->
**Cobertura canónica:** `AUTH-SRV-004` a `AUTH-SRV-013` — 10 tareas.
<!-- PLAN-SECTION-META:END -->

### [ ] AUTH-SRV-004 — Eliminar confianza exclusiva en la interfaz
### [ ] AUTH-SRV-005 — Validar permiso en cada escritura
### [ ] AUTH-SRV-006 — Validar sede en cada escritura
### [ ] AUTH-SRV-007 — Validar área en cada escritura
### [ ] AUTH-SRV-008 — Validar turno cuando corresponda
### [ ] AUTH-SRV-009 — Validar rol operativo cuando corresponda
### [ ] AUTH-SRV-010 — Validar dispositivo compartido
### [ ] AUTH-SRV-011 — Validar estado actual de la entidad
### [ ] AUTH-SRV-012 — Evitar operaciones entre sedes no autorizadas
### [ ] AUTH-SRV-013 — Evitar operaciones entre áreas no autorizadas

### Reglas del package

| Tarea | Aplicación |
| --- | --- |
| 004 | recalcular payload, conflictos y límite |
| 005 | separar consulta, borrador, eliminación y publicación |
| 006 | vínculo y autoridad de sede |
| 007 | área en matriz activa |
| 008 | definir prerrequisito administrativo |
| 009 | rol y puntos externos |
| 010 | dispositivo compartido |
| 011 | borrador/publicado |
| 012 | total entre sedes sin acceso extra |
| 013 | área fuera de alcance |

`requireStaffScheduleAccess` es evidencia, no permiso atómico aprobado.
