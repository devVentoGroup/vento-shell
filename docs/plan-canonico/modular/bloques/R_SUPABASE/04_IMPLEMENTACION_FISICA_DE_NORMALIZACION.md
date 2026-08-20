### IMPLEMENTACIÓN FÍSICA DE NORMALIZACIÓN

<!-- EXECUTION-GATE-RECONCILIATION:B201-400:DATA-NORM-DB -->
#### Reconciliación topológica de DATA-NORM-DB-001 a DATA-NORM-DB-010

La normalización física se ejecuta de forma progresiva, trazable y delimitada por dominio o paquete; queda prohibida una transformación global indiscriminada.

| Propiedad | Valor |
| --- | --- |
| modalidad | `TEMPLATE_PER_PACKAGE` |
| gate temporal | `POST_E5_PACKAGE` |
| identidad | `<task_id>::<package_id>` |

El package_id aplicable debe identificar reglas, dominio, dry-run, colisiones, backfill, activación, constraints, índices, triggers, auditoría, rollback y evidencia que correspondan a su alcance.

Una infraestructura o función reutilizable creada durante una instancia no autoriza aplicar la misma transformación a dominios ajenos al paquete. Los backfills y cambios persistentes conservan siempre aislamiento, evidencia y rollback por alcance aprobado.

### [ ] DATA-NORM-DB-001 — Implementar almacenamiento de versiones de reglas y diccionarios
### [ ] DATA-NORM-DB-002 — Implementar funciones SQL deterministas cuando sean necesarias
### [ ] DATA-NORM-DB-003 — Implementar columnas o expresiones normalizadas de búsqueda
### [ ] DATA-NORM-DB-004 — Ejecutar dry-runs y reportes de colisiones
### [ ] DATA-NORM-DB-005 — Ejecutar backfills aprobados por dominio
### [ ] DATA-NORM-DB-006 — Implementar constraints después de reconciliar datos
### [ ] DATA-NORM-DB-007 — Implementar índices de búsqueda y unicidad normalizada
### [ ] DATA-NORM-DB-008 — Implementar triggers únicamente como barrera defensiva final
### [ ] DATA-NORM-DB-009 — Registrar valor previo, valor resultante y versión de regla
### [ ] DATA-NORM-DB-010 — Probar idempotencia, rollback y ausencia de cambios semánticos
