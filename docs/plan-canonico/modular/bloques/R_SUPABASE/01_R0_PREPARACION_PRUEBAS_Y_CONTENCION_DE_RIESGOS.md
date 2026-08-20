### R0 — Preparación, pruebas y contención de riesgos

<!-- EXECUTION-GATE-RECONCILIATION:B201-400:R0 -->
#### Reconciliación topológica de R0

Las nueve tareas de R0 constituyen prerrequisitos físicos compartidos de seguridad y reproducibilidad.

| Propiedad | Valor |
| --- | --- |
| tareas | `AUTH-DB-015`, `AUTH-DB-027..029`, `AUTH-DB-001..005` |
| modalidad | `GLOBAL_ENABLE_ONCE` |
| gate temporal | `PRE_E5_FOUNDATION` |
| identidad | `<task_id>::GLOBAL` |
| autorización | explícita por instancia |

R0 debe existir antes de autorizar paquetes que modifiquen Supabase. Su función es disponer migraciones versionadas, harness, baseline y drift, backup, restore, rollback y contención inicial de riesgo.

`PRE_E5_FOUNDATION` no significa ejecución automática: cada cambio conserva autorización humana, alcance explícito, validaciones y rollback. R0 tampoco aprueba por sí mismo ninguna migración de dominio ni sustituye `E5-GATE-008::<package_id>` para trabajo perteneciente a un paquete.

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
