### PLAN DE TRANSICIÓN

### [ ] SUPA-TRANS-001 — Mapear cada objeto actual hacia la arquitectura objetivo
### [ ] SUPA-TRANS-002 — Clasificar cada objeto como conservar, mover, fusionar, dividir, renombrar o retirar
### [ ] SUPA-TRANS-003 — Identificar dependencias de aplicaciones, RPC, RLS, triggers y datos
### [ ] SUPA-TRANS-004 — Definir orden de migración por dominio
### [ ] SUPA-TRANS-005 — Definir backfills y correcciones de calidad de datos
### [ ] SUPA-TRANS-006 — Definir vistas, wrappers o aliases temporales de compatibilidad
### [ ] SUPA-TRANS-007 — Definir adaptación coordinada de consumidores
### [ ] SUPA-TRANS-008 — Definir estrategia ante escrituras durante la transición
### [ ] SUPA-TRANS-009 — Definir pruebas antes y después de cada migración
### [ ] SUPA-TRANS-010 — Definir mediciones de rendimiento y seguridad
### [ ] SUPA-TRANS-011 — Definir rollback por paquete de cambio
### [ ] SUPA-TRANS-012 — Definir retiro progresivo de objetos legacy
### [ ] SUPA-TRANS-013 — Definir verificación de paridad local, staging y producción
### [ ] SUPA-TRANS-014 — Definir actualización de tipos, contratos y documentación
### [ ] SUPA-TRANS-015 — Crear roadmap ejecutable de migraciones en `vento-shell`

### Delta VISO mensual

| Objeto | Estado inicial |
| --- | --- |
| `employee_shifts` | fuente actual |
| `viso_enforce_monthly_schedule_publish_limit()` | local/provisional SECURITY DEFINER |
| `trg_viso_monthly_schedule_publish_limit` | local/provisional row-level |
| migración `20260731082600...` | propuesta; producción no autorizada |

- 001 inventaria.
- 002 clasifica; no presume conservación.
- 003 mapea dependencias.
- 008 define concurrencia.
- 009 prueba migración/límite/rollback.
- 010 mide coste.
- 011 define rollback.
- 013 valida paridad de ambientes.
- 014 actualiza tipos/errores/política.
- 015 incorpora solo después de `VISO-SCH-008` y E5.

`11160`/`186` no son arquitectura estable. SECURITY DEFINER requiere owner, grants, search path y pruebas negativas. El trigger debe demostrar atomicidad/concurrencia. No aplicar a producción durante la fase documental.
