# DELTA-VISO-SCHEDULE-20260731-001 — Programación mensual VISO

## Estado

| Campo | Valor |
| --- | --- |
| Estado | `CONGELADO_PENDIENTE_DE_ESTABILIZACION` |
| Fecha | 2026-07-31 |
| Aplicación | `viso` |
| Repositorio | `devVentoGroup/vento-viso` |
| Migraciones | `devVentoGroup/vento-shell` |
| Proceso | `VPROC-0007` |
| Capacidad nueva | No |
| Proceso nuevo | No |
| Permiso nuevo | No aprobado |
| Commit estable | Pendiente |
| Package | `VISO-SCHEDULE-MONTHLY-001` — reservado |

## Propósito

Congelar la implementación local mientras se completa contrato funcional, reconciliación, seguridad, arquitectura, pruebas y paquete de despliegue.

## Archivos observados

`vento-viso`:

```text
src/app/staff/schedule/layout.tsx
src/app/staff/schedule/month/page.tsx
src/app/staff/schedule/month/actions.ts
src/app/staff/schedule/month/constants.ts
src/components/viso/schedule-view-switch.tsx
src/components/viso/monthly-shift-builder.tsx
```

`vento-shell`:

```text
supabase/migrations/20260731082600_viso_monthly_schedule_186_hour_publish_guard.sql
```

## Comportamiento congelado

1. Semana y mes son vistas del mismo proceso.
2. Mes representa 28, 29, 30 o 31 días.
3. Una operación rápida usa un trabajador y hasta 12 bloques.
4. Cada bloque tiene rol/área, inicio, fin, fechas y nota.
5. Una fecha pertenece a un solo bloque en el constructor rápido.
6. No admite overnight en esta modalidad.
7. Guarda `break_minutes = 0` provisionalmente.
8. Todo turno nuevo queda en borrador.
9. El preview suma actual, nuevas y proyectadas.
10. El total mensual agrega todas las sedes.
11. Advertencia provisional: 174 h.
12. Límite provisional: 186 h/11.160 min.
13. Borradores pueden exceder.
14. Publicación se bloquea por encima del límite.
15. Eliminación mensual solo afecta borradores.
16. Publicación notifica a ANIMA mediante el adaptador existente.

## Decisiones provisionales y propietario

| Decisión | Tarea |
| --- | --- |
| 186 h y 174 h | `VISO-SCH-004` |
| bloques, overnight, descansos | `VISO-SCH-003` |
| borrador/publicación/corrección | `VISO-SCH-005` |
| concurrencia y rollback | `VISO-SCH-006` |
| permisos, auditoría, notificación | `VISO-SCH-007` |

## Riesgos abiertos

- hardcode duplicado en TypeScript y PL/pgSQL;
- política no versionada;
- trigger row-level sin prueba de concurrencia;
- cliente administrativo para totales entre sedes;
- helper de acceso posiblemente demasiado amplio;
- versionado de periodo incompleto;
- ausencia de pruebas automatizadas;
- paridad semanal/mensual no certificada;
- notificación sin prueba de idempotencia;
- `SECURITY DEFINER` sin cierre de owner/grants;
- borrado masivo sin auditoría aprobada.

## Tareas nuevas

- `CODE-AUD-021`;
- `VISO-SCH-001` a `VISO-SCH-008`;
- `AUTH-UI-061`.

## Criterios de descongelación

- [ ] Commit estable.
- [ ] Build y typecheck.
- [ ] `CODE-AUD-021` ejecutada.
- [ ] `AUTH-UI-061` ejecutada.
- [ ] `VISO-SCH-001` a `008` aprobadas.
- [ ] Límite confirmado o sustituido.
- [ ] E3 clasifica función/trigger.
- [ ] `04A` completo actualizado.
- [ ] Package E5 aprobado.
- [ ] Pruebas y rollback.
- [ ] Piloto e hypercare.

```text
PRODUCTION_RELEASE_AUTHORIZED = false
CANONICAL_RULE_186H_APPROVED = false
ACTIVE_SEQUENCE_CHANGED = false
```
