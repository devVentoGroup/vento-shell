### MINI-BLOQUE — CONTRATO FUNCIONAL DE PROGRAMACIÓN LABORAL

<!-- PLAN-SECTION-META:START -->
**Cobertura canónica:** `VISO-SCH-001` a `VISO-SCH-008` — 8 tareas.
<!-- PLAN-SECTION-META:END -->

### [ ] VISO-SCH-001 — Definir contrato funcional de programación laboral

Fijar frontera de `VPROC-0007`, unidad, periodo, trabajador, sede, área, rol, turno, versión y relación con ANIMA. Semana y mes son proyecciones del mismo proceso/fuente.

### [ ] VISO-SCH-002 — Definir horizontes semanal y mensual

Definir navegación, 28/29/30/31 días, zona horaria, cambio de año, contexto y responsabilidades de cada vista.

### [ ] VISO-SCH-003 — Definir bloques, fechas, duración y modalidad rápida

Decidir máximo de bloques, exclusividad de fecha, turnos partidos, overnight, duración, descansos, notas, presets y edición. Los valores actuales son provisionales.

### [ ] VISO-SCH-004 — Definir límites mensuales, advertencias, vigencia y excepciones

Resolver valor, unidad, redondeo, aplicación global/contrato/trabajador, vigencia, meses parciales, ausencias, extras, advertencias, excepciones, autoridad y auditoría. `186 h` y `174 h` son provisionales.

### [ ] VISO-SCH-005 — Definir borrador, revisión, publicación y corrección

Mapear a estados de `VPROC-0007` y definir alcance/atomicidad de publicación y corrección.

### [ ] VISO-SCH-006 — Definir conflictos, integridad, concurrencia y recuperación

Cubrir solapamientos, disponibilidad, descansos, límites, territorio, concurrencia, idempotencia, rollback, estado parcial y corrección versionada.

### [ ] VISO-SCH-007 — Definir autorización, auditoría, eventos y notificaciones

Diferenciar consultar, crear, modificar, eliminar borrador, revisar, publicar, corregir y autorizar excepción. Vincular actores, simulación, territorio, `published_by`, eventos y ANIMA.

### [ ] VISO-SCH-008 — Aprobar contrato de programación antes de E5

Exige `CODE-AUD-021`, `AUTH-UI-061`, límite resuelto, datos/publicación definidos, `04A`, pruebas, rollback y ausencia de fuente competidora.

### Requisitos

Materializar `TREQ-VISO-024` en adelante desde el `04A` local completo al desarrollar estas tareas.
