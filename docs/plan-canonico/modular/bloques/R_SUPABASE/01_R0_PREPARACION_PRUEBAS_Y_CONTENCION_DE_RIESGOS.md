### R0 — Preparación, pruebas y contención de riesgos

### [ ] AUTH-DB-015 — Documentar y versionar todas las migraciones en vento-shell
### [ ] AUTH-DB-027 — Crear harness de pruebas de esquema, integridad, RLS, RPC y migraciones
### [ ] AUTH-DB-028 — Establecer baseline y control de drift entre local, staging y producción
### [ ] AUTH-DB-029 — Validar respaldo, restauración y rollback antes del primer paquete
### [ ] AUTH-DB-001 — Corregir tablas sin RLS identificadas en SUPA-AUD
### [ ] AUTH-DB-002 — Endurecer políticas RLS demasiado amplias aprobadas para corrección
### [ ] AUTH-DB-003 — Endurecer funciones SECURITY DEFINER aprobadas
### [ ] AUTH-DB-004 — Reducir grants innecesarios de authenticated
### [ ] AUTH-DB-005 — Revocar grants innecesarios de anon

No comenzar sin baseline, drift, entorno reproducible, pruebas negativas, respaldo, restauración, rollback y migración versionada.

### Package VISO mensual

- 015: nombre/orden/idempotencia/documentación.
- 027: debajo/igual/encima del límite, descanso/cancelado, mes, sedes, insert/update, publicación múltiple y concurrencia.
- 028: detectar drift y aplicación directa.
- 029: rollback del trigger/función con protección temporal.
- 003: owner, grants, search path y mensajes.
