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
