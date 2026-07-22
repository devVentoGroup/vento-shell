### R2 — Migración progresiva por dominio

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

Regla de secuencia por dominio

`AUTH-DB-006` a `AUTH-DB-010` solo podrán ejecutarse después de:

- completar R0;
- disponer de `AUTH-DB-033`, `AUTH-DB-035`, `AUTH-DB-034` y `AUTH-DB-032` en R1;
- aprobar el paquete de migración del dominio mediante `AUTH-DB-020`;
- disponer de pruebas negativas y rollback mediante `AUTH-DB-027` y `AUTH-DB-029`.

Las políticas RLS y grants de `AUTH-DB-021` deberán adoptar el mismo núcleo y demostrar equivalencia con las RPC antes de completar la migración del consumidor correspondiente.
