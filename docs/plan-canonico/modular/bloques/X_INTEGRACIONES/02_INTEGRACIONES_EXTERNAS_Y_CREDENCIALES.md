### MINI-BLOQUE — INTEGRACIONES EXTERNAS Y CREDENCIALES

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **integraciones externas y credenciales** dentro de **X INTEGRACIONES**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `INT-EXT-001` a `INT-EXT-020` — 20 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Límites funcionales:** comienza con “Inventariar sistemas externos, proveedores, propietarios y finalidad” y concluye con “Prohibir credenciales compartidas entre integraciones”.
<!-- PLAN-SECTION-META:END -->

### [ ] INT-EXT-001 — Inventariar sistemas externos, proveedores, propietarios y finalidad
### [ ] INT-EXT-002 — Definir principal técnico independiente por integración
### [ ] INT-EXT-003 — Diferenciar credenciales emitidas por proveedores y credenciales emitidas por Vento
### [ ] INT-EXT-004 — Definir autenticación mediante API key, OAuth, HMAC, certificado u otro mecanismo
### [ ] INT-EXT-005 — Definir alcance mínimo de cada credencial
### [ ] INT-EXT-006 — Separar credenciales de desarrollo, staging y producción
### [ ] INT-EXT-007 — Definir almacenamiento seguro de secretos
### [ ] INT-EXT-008 — Definir rotación, expiración y revocación
### [ ] INT-EXT-009 — Definir contratos de entrada y salida versionados
### [ ] INT-EXT-010 — Definir estrategia webhook, polling o híbrida
### [ ] INT-EXT-011 — Definir validación de firma, origen, timestamp y replay
### [ ] INT-EXT-012 — Definir idempotencia y deduplicación por sistema externo
### [ ] INT-EXT-013 — Definir mapeo de identificadores externos y canónicos
### [ ] INT-EXT-014 — Definir conservación controlada del payload original
### [ ] INT-EXT-015 — Definir rate limits, reintentos, backoff y circuit breaker
### [ ] INT-EXT-016 — Definir cuarentena o dead-letter
### [ ] INT-EXT-017 — Definir auditoría, métricas, alertas y conciliación
### [ ] INT-EXT-018 — Definir contingencia ante indisponibilidad del proveedor
### [ ] INT-EXT-019 — Definir retiro de integración y revocación de credenciales
### [ ] INT-EXT-020 — Prohibir credenciales compartidas entre integraciones

Separación obligatoria:

```text
PermissionKey
→ capacidad empresarial

IntegrationPrincipal
→ identidad técnica de la integración

ExternalCredentialId
→ referencia interna a una credencial

API key, token o secret
→ valor secreto almacenado fuera de tablas expuestas
```

Reglas:

- ninguna integración externa recibirá `service_role`;
- ningún secreto se almacenará en frontend o variable pública;
- los logs registrarán identificadores de credencial, no sus valores;
- una credencial de lectura no se reutilizará para escritura;
- cada entorno tendrá credenciales independientes;
- toda credencial deberá poder revocarse sin modificar contratos empresariales.
