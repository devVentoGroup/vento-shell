### R2 — Migración progresiva por dominio

<!-- EXECUTION-GATE-RECONCILIATION:B201-400:R2 -->
#### Reconciliación topológica de R2

R2 implementa migración progresiva por dominio y conserva identidad de paquete.

| Propiedad | Valor |
| --- | --- |
| tareas | las trece tareas de este archivo |
| modalidad | `TEMPLATE_PER_PACKAGE` |
| gate temporal | `POST_E5_PACKAGE` |
| identidad | `<task_id>::<package_id>` |

Cada package_id ejecuta únicamente el subconjunto R2 incluido en su alcance aprobado. Las instancias R2 requieren R0/R1 aplicables disponibles, `E5-GATE-008::<package_id>` aprobado y gobierno de `SHELL-CI-020::<package_id>`.

`AUTH-DB-026` mantiene su responsabilidad incremental sobre generación y publicación de tipos después del paquete DB aplicable; no se convierte en un habilitador global único.

### [ ] AUTH-DB-020 — Migrar objetos por dominio con compatibilidad temporal
### [ ] AUTH-DB-006 — Incorporar contexto canónico en RPC sensibles
### [ ] AUTH-DB-007 — Validar sede dentro de RPC sensibles
### [ ] AUTH-DB-008 — Validar área dentro de RPC sensibles
### [ ] AUTH-DB-009 — Validar permiso exacto dentro de RPC sensibles
### [ ] AUTH-DB-010 — Validar principal y actor efectivo dentro de RPC sensibles
### [ ] AUTH-DB-021 — Implementar políticas RLS y grants canónicos por esquema
### [ ] AUTH-DB-011 — Aplicar constraints después de backfills y reconciliación
### [ ] AUTH-DB-022 — Implementar gobierno y políticas de Storage
### [ ] AUTH-DB-023 — Implementar canales y contratos Realtime aprobados
### [ ] AUTH-DB-024 — Versionar Edge Functions, webhooks, cron y automatizaciones
### [ ] AUTH-DB-025 — Implementar índices, retención y controles de crecimiento
### [ ] AUTH-DB-026 — Generar y publicar tipos después de cada paquete aprobado

### `AUTH-DB-020::VISO-SCHEDULE-MONTHLY-001`

1. Parte de `VISO-SCH-004`.
2. Crea migración posterior si la provisional ya se aplicó.
3. No edita migraciones aplicadas.
4. Prueba semana/mes.
5. Define concurrencia.
6. Permite reducir horas de forma autorizada.
7. Expone errores estructurados.
8. Baseline antes/después.
9. Rollback.
10. Tipos actualizados.
