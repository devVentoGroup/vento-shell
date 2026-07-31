### MINI-BLOQUE — RECONCILIACIÓN DE DELTAS POSTERIORES AL SNAPSHOT E1

<!-- PLAN-SECTION-META:START -->
Esta sección registra reconciliaciones técnicas posteriores a snapshots aprobados sin reescribirlos ni reabrir E1 en bloque.

**Cobertura canónica:** `CODE-AUD-021` — 1 tarea.
<!-- PLAN-SECTION-META:END -->

### [ ] CODE-AUD-021 — Reconciliar el delta técnico de programación mensual VISO

**Estado:** NO INICIADA  
**Delta:** `DELTA-VISO-SCHEDULE-20260731-001`  
**Dependencias:** commit estable; migración documentada; snapshots `CODE-AUD-*` aprobados  
**Salida:** `CODE-DELTA-VISO-SCHEDULE-001`

#### Alcance

1. Recontar rutas, layouts, componentes, formularios y acciones.
2. Registrar `/staff/schedule/month` y guard.
3. Registrar layout y dos componentes nuevos.
4. Inventariar cuatro Server Actions.
5. Vincular tablas, vistas, perfiles y matriz de roles.
6. Vincular notificación ANIMA.
7. Inventariar función, trigger y migración.
8. Ejecutar build, typecheck, lint y pruebas.
9. Auditar autorización.
10. Auditar concurrencia, idempotencia, transacción y rollback.
11. Actualizar implementación verificable de programación.
12. Destinar todo hallazgo.

#### Deltas esperados sujetos a ejecución

| Métrica | Antes | Esperado |
| --- | ---: | ---: |
| Rutas web | 168 | 169 |
| Rutas VISO | 60 | 61 |
| Rutas VISO personal | 10 | 11 |
| Layouts | 9 | 10 |
| Layouts VISO | 1 | 2 |
| Componentes | 290 | 292 |
| Componentes VISO | 46 | 48 |
| Archivos Server Action | 101 | 102 |
| Archivos Server Action VISO | 41 | 42 |

Otros conteos deben recalcularse; no se infieren.

#### Hallazgos mínimos

- hardcodes 186/174;
- permiso por acción;
- totales entre sedes;
- paridad semana/mes;
- concurrencia y atomicidad;
- notificación idempotente;
- borrado/auditoría;
- pruebas;
- versionado de periodo.

#### Requisitos de prueba

No genera nuevos por sí sola; consume los reservados por `VISO-SCH-*`. Un hallazgo nuevo exige actualizar `04A` antes de aprobación.

#### Aceptación

- [ ] Commit fijado.
- [ ] Comandos reales ejecutados.
- [ ] Delta cuantitativo real.
- [ ] Guard y acciones auditados.
- [ ] Migración/rollback inspeccionados.
- [ ] Hallazgos con tarea.
- [ ] Evidencia histórica preservada.
- [ ] Entrega a `AUTH-UI-061` y E5.
