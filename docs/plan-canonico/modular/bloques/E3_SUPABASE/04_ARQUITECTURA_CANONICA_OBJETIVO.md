### ARQUITECTURA CANÓNICA OBJETIVO

Criterios obligatorios de evaluación

Toda decisión de arquitectura deberá evaluarse, como mínimo, contra:

- propiedad de la fuente de verdad;
- estabilidad del dominio empresarial;
- consumidores actuales y futuros;
- exposición mediante Data API;
- seguridad, RLS y grants;
- compatibilidad temporal;
- rendimiento y crecimiento;
- auditoría y trazabilidad;
- capacidad de rollback;
- reproducibilidad desde `vento-shell`.

Estos criterios deberán aplicarse desde SUPA-ARC-001 y consolidarse
formalmente en SUPA-ARC-025 mediante una ADR aprobada.

### [ ] SUPA-ARC-001 — Definir principios de separación entre esquemas administrados y empresariales
### [ ] SUPA-ARC-002 — Definir dominios empresariales estables
### [ ] SUPA-ARC-003 — Definir esquema propietario de cada fuente de verdad
### [ ] SUPA-ARC-004 — Definir función futura de `public`
### [ ] SUPA-ARC-005 — Definir capa expuesta de vistas y RPC
### [ ] SUPA-ARC-006 — Definir capa privada de helpers y lógica interna
### [ ] SUPA-ARC-007 — Definir esquema transversal de auditoría y eventos
### [ ] SUPA-ARC-008 — Definir modelo canónico de Auth e identidad empresarial
### [ ] SUPA-ARC-009 — Definir vínculo de `auth.users` con trabajador, cliente y dispositivo
### [ ] SUPA-ARC-010 — Definir ciclo de sesión, revocación y desactivación
### [ ] SUPA-ARC-011 — Definir convenciones de nombres para esquemas, tablas y columnas
### [ ] SUPA-ARC-012 — Definir convenciones de claves, constraints, estados y timestamps
### [ ] SUPA-ARC-013 — Definir convenciones para funciones, RPC y triggers
### [ ] SUPA-ARC-014 — Definir política canónica de `SECURITY DEFINER`
### [ ] SUPA-ARC-015 — Definir política canónica de exposición, grants y RLS
### [ ] SUPA-ARC-016 — Definir contratos de lectura y mutación por dominio
### [ ] SUPA-ARC-017 — Definir política de escrituras entre dominios
### [ ] SUPA-ARC-018 — Definir arquitectura de Storage
### [ ] SUPA-ARC-019 — Definir arquitectura de Realtime y eventos
### [ ] SUPA-ARC-020 — Definir arquitectura de Edge Functions, webhooks y cron
### [ ] SUPA-ARC-021 — Definir estrategia de índices, rendimiento y crecimiento
### [ ] SUPA-ARC-022 — Definir retención, archivado, respaldo y recuperación
### [ ] SUPA-ARC-023 — Definir generación canónica de tipos para consumidores
### [ ] SUPA-ARC-024 — Definir entornos local, pruebas, staging y producción
