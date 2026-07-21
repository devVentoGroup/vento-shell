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
### [ ] AUTH-DB-006 — Incorporar contexto canónico en RPC sensibles
### [ ] AUTH-DB-007 — Validar sede dentro de RPC sensibles
### [ ] AUTH-DB-008 — Validar área dentro de RPC sensibles
### [ ] AUTH-DB-009 — Validar permiso exacto dentro de RPC sensibles
### [ ] AUTH-DB-010 — Validar principal y actor efectivo dentro de RPC sensibles

Regla de entrada a migraciones

No podrá comenzar ningún paquete estructural mientras no existan:

- baseline de Supabase remoto;
- comparación con migraciones locales;
- entorno de pruebas reproducible;
- pruebas negativas de autorización;
- respaldo verificable;
- restauración probada;
- rollback documentado;
- migración versionada en `vento-shell`.
