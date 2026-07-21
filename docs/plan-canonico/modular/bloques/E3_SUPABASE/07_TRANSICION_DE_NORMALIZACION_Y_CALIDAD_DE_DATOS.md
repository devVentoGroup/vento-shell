### TRANSICIÓN DE NORMALIZACIÓN Y CALIDAD DE DATOS

### [ ] DATA-NORM-TRANS-001 — Crear baseline de valores actuales antes de transformar
### [ ] DATA-NORM-TRANS-002 — Ejecutar dry-run de cada regla de normalización
### [ ] DATA-NORM-TRANS-003 — Identificar colisiones producidas por valores normalizados
### [ ] DATA-NORM-TRANS-004 — Resolver duplicados antes de aplicar restricciones de unicidad
### [ ] DATA-NORM-TRANS-005 — Definir backfills por dominio y lotes reversibles
### [ ] DATA-NORM-TRANS-006 — Activar reglas sobre nuevas escrituras de forma progresiva
### [ ] DATA-NORM-TRANS-007 — Validar búsquedas, relaciones e integraciones después del backfill
### [ ] DATA-NORM-TRANS-008 — Definir rollback y recuperación del valor anterior
### [ ] DATA-NORM-TRANS-009 — Definir evidencia de aprobación por dominio

Regla de transición

No se ejecutará una actualización global indiscriminada equivalente a:

```text
UPDATE todas_las_tablas
SET nombre = normalize(nombre)
```

Cada dominio deberá pasar por:

```text
baseline
→ dry-run
→ detección de colisiones
→ revisión
→ aprobación
→ backfill por lote
→ verificación
→ activación sobre nuevas escrituras
→ auditoría
```

### [ ] SUPA-TRANS-016 — Aprobar transición antes de iniciar BLOQUE R
