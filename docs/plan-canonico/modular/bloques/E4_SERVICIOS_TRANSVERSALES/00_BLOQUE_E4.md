## BLOQUE E4

**Servicios operativos transversales, colas y evidencia**

Este bloque define servicios compartidos que soportan varios procesos y
aplicaciones sin apropiarse de la lógica empresarial de cada dominio.

Depende de:

BLOQUE E1
→ identifica necesidades transversales reales y cobertura actual

BLOQUE E2
→ define procesos, documentos, acciones y experiencia requerida

BLOQUE E3
→ define fuentes de verdad, persistencia y seguridad

BLOQUE X
→ define eventos, integraciones y adaptadores

No implementa todavía adaptadores físicos ni migraciones.

### Principio de propiedad

```text
APLICACIÓN PROPIETARIA DEL PROCESO
→ decide qué resultado empresarial debe producirse

SERVICIO TRANSVERSAL
→ ejecuta una capacidad técnica compartida mediante contrato versionado
```

Un servicio transversal no deberá convertirse en propietario del proceso,
del permiso empresarial ni de la fuente de verdad del dominio consumidor.

### CATÁLOGO DE SERVICIOS TRANSVERSALES

### [ ] TSVC-CAT-001 — Inventariar servicios transversales actuales y faltantes
### [ ] TSVC-CAT-002 — Definir propietario técnico y gobierno de cada servicio
### [ ] TSVC-CAT-003 — Definir aplicaciones productoras y consumidoras
### [ ] TSVC-CAT-004 — Definir contrato, versión y compatibilidad
### [ ] TSVC-CAT-005 — Definir identidad técnica y credenciales mínimas
### [ ] TSVC-CAT-006 — Definir idempotencia, reintentos y deduplicación
### [ ] TSVC-CAT-007 — Definir observabilidad, métricas, alertas y auditoría
### [ ] TSVC-CAT-008 — Definir contingencia y degradación controlada
### [ ] TSVC-CAT-009 — Definir retención, archivado y limpieza
### [ ] TSVC-CAT-010 — Definir adopción progresiva y retiro de soluciones legacy

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

### SERVICIO TRANSVERSAL DE IMPRESIÓN

### [ ] PRINT-ARC-001 — Inventariar impresoras por empresa, sede, área y punto operativo
### [ ] PRINT-ARC-002 — Inventariar conexión, protocolo, capacidades, papel y lenguaje de impresión
### [ ] PRINT-ARC-003 — Inventariar documentos, etiquetas, comandas y comprobantes imprimibles
### [ ] PRINT-ARC-004 — Definir aplicación propietaria de cada documento
### [ ] PRINT-ARC-005 — Definir plantilla, versión, tamaño y datos requeridos
### [ ] PRINT-ARC-006 — Definir contrato canónico de trabajo de impresión
### [ ] PRINT-ARC-007 — Definir enrutamiento por sede, área, documento, canal y dispositivo
### [ ] PRINT-ARC-008 — Definir impresora principal, alternativas y fallback
### [ ] PRINT-ARC-009 — Definir estado de impresora y heartbeat
### [ ] PRINT-ARC-010 — Definir idempotencia y prevención de impresiones duplicadas
### [ ] PRINT-ARC-011 — Definir reintentos automáticos y cola de fallos
### [ ] PRINT-ARC-012 — Definir confirmación de envío, impresión y entrega cuando sea verificable
### [ ] PRINT-ARC-013 — Definir cancelación y expiración
### [ ] PRINT-ARC-014 — Definir reimpresión como acción separada y auditable
### [ ] PRINT-ARC-015 — Definir permisos de impresión, reimpresión y administración
### [ ] PRINT-ARC-016 — Definir privacidad y ocultamiento de datos sensibles
### [ ] PRINT-ARC-017 — Definir operación offline y contingencia manual
### [ ] PRINT-ARC-018 — Definir adaptadores LAN, USB, Bluetooth o puente local
### [ ] PRINT-ARC-019 — Definir monitoreo y diagnóstico por sede
### [ ] PRINT-ARC-020 — Definir alcance, prerrequisitos, métricas y criterios de aceptación del piloto de impresión

Flujo mínimo:

```text
PROCESO EMPRESARIAL
→ DOCUMENTO VERSIONADO
→ PRINT JOB
→ ROUTING
→ PRINTER ADAPTER
→ RESULTADO Y AUDITORÍA
```

La cola de impresión no autoriza la operación empresarial que originó el
documento. Solo ejecuta un trabajo ya autorizado.

### NOTIFICACIONES Y ALERTAS

### [ ] NOTIFY-ARC-001 — Inventariar notificaciones actuales y canales
### [ ] NOTIFY-ARC-002 — Definir evento empresarial que origina cada notificación
### [ ] NOTIFY-ARC-003 — Definir destinatarios por responsabilidad y contexto
### [ ] NOTIFY-ARC-004 — Definir prioridad, vigencia y deduplicación
### [ ] NOTIFY-ARC-005 — Definir canales internos, correo, push o mensajería externa
### [ ] NOTIFY-ARC-006 — Definir preferencias sin ocultar alertas obligatorias
### [ ] NOTIFY-ARC-007 — Definir confirmación, lectura y escalamiento
### [ ] NOTIFY-ARC-008 — Definir reintentos, fallos y contingencia
### [ ] NOTIFY-ARC-009 — Definir privacidad y contenido sensible
### [ ] NOTIFY-ARC-010 — Definir métricas y auditoría de entrega

### ARCHIVOS, DOCUMENTOS Y EVIDENCIA

### [ ] EVID-ARC-001 — Inventariar archivos y evidencia por proceso
### [ ] EVID-ARC-002 — Definir propietario funcional de cada tipo documental
### [ ] EVID-ARC-003 — Definir clasificación de sensibilidad
### [ ] EVID-ARC-004 — Definir metadatos, versión y vínculo con el recurso
### [ ] EVID-ARC-005 — Definir carga, sustitución, anulación y retención
### [ ] EVID-ARC-006 — Definir validación de tipo, tamaño, integridad y malware
### [ ] EVID-ARC-007 — Definir acceso temporal y URLs firmadas
### [ ] EVID-ARC-008 — Definir auditoría de consulta y modificación
### [ ] EVID-ARC-009 — Definir conservación legal y eliminación
### [ ] EVID-ARC-010 — Definir contingencia ante indisponibilidad de Storage

Los pilotos operativos reales no se ejecutan durante E4.

E4 define contratos, arquitectura y criterios. La implementación, readiness,
cutover, piloto e hypercare se planifican en E5 y se ejecutan después de
implementar el paquete aprobado.

### Salida obligatoria

BLOQUE E4 deberá entregar:

- catálogo de servicios transversales;
- contrato canónico de trabajos asíncronos;
- arquitectura de colas;
- arquitectura de impresión;
- catálogo de impresoras y documentos;
- reglas de enrutamiento por sede y área;
- contrato de notificaciones;
- contrato de archivos y evidencia;
- permisos y riesgos contractuales que deban volver al catálogo;
- plan de implementación y criterios de piloto.
