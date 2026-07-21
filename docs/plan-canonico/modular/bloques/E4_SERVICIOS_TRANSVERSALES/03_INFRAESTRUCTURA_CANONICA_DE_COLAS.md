### INFRAESTRUCTURA CANÓNICA DE COLAS

### [ ] QUEUE-ARC-001 — Inventariar colas, cron, jobs y automatizaciones existentes
### [ ] QUEUE-ARC-002 — Definir contrato canónico de trabajo asíncrono
### [ ] QUEUE-ARC-003 — Definir clave de idempotencia por trabajo
### [ ] QUEUE-ARC-004 — Definir prioridad, programación y vencimiento
### [ ] QUEUE-ARC-005 — Definir asignación a trabajador, dispositivo o adaptador
### [ ] QUEUE-ARC-006 — Definir reintentos, backoff y límite máximo
### [ ] QUEUE-ARC-007 — Definir cancelación antes y durante ejecución
### [ ] QUEUE-ARC-008 — Definir cola de fallos y recuperación manual
### [ ] QUEUE-ARC-009 — Definir bloqueo de duplicados y concurrencia
### [ ] QUEUE-ARC-010 — Definir estados y eventos canónicos
### [ ] QUEUE-ARC-011 — Definir métricas de espera, ejecución y error
### [ ] QUEUE-ARC-012 — Definir autorización para crear, cancelar y reintentar trabajos

Estados mínimos:

```text
queued
scheduled
assigned
processing
succeeded
retry_pending
failed
cancelled
expired
```
