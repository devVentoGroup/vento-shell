## BLOQUE X

**Integraciones empresariales internas y externas**

Relación con los demás bloques:

BLOQUE E2
→ identifica la necesidad empresarial y los eventos requeridos

BLOQUE X
→ define emisores internos y externos, consumidores, contratos,
  credenciales técnicas, idempotencia, reintentos, compensaciones
  y traspasos entre sistemas y aplicaciones

BLOQUE H
→ implementa los contratos y tipos compartidos en vento-shell

Los tres bloques son complementarios y no duplican responsabilidades.

REGLA GENERAL

Una integración no deberá obligar al trabajador a registrar nuevamente
la información que ya produjo una aplicación propietaria.

FRONTERA DE FASE

Antes de BLOQUE E3, todas las tareas de BLOQUE X son documentales: definen
contratos objetivo, responsabilidades, controles, secuencias, planes de prueba,
transición y retiro. Los verbos de negocio describen el comportamiento que
deberá implementar posteriormente el paquete propietario; no autorizan crear
credenciales, llamar proveedores, modificar Supabase, sincronizar datos,
producir efectos internos, ejecutar pilotos, hacer cutover ni operar en
producción. La implementación y la evidencia real corresponden a E5, BLOQUE R,
`SHELL-CI-020` a `SHELL-CI-024` y las puertas aplicables.

### Organización documental del bloque

<!-- PLAN-SECTION-META:START -->
El bloque se divide en mini-bloques funcionales. Cada archivo conserva juntas las tareas que comparten propósito y resultado, evitando tanto el archivo monolítico como la fragmentación de una tarea por archivo.

| Orden | Mini-bloque | Cobertura | Tareas |
|---:|---|---|---:|
| 1 | EVENTOS ENTRE APLICACIONES | `INT-APP-001`–`INT-APP-010` | 10 |
| 2 | INTEGRACIONES EXTERNAS Y CREDENCIALES | `INT-EXT-001`–`INT-EXT-020` | 20 |
| 3 | CONTEXTO LABORAL | `INT-WORK-001`–`INT-WORK-005` | 5 |
| 4 | COMPRAS RECEPCION E INVENTARIO | `INT-PROC-001`–`INT-PROC-005` | 5 |
| 5 | PRODUCCION E INVENTARIO | `INT-PROD-001`–`INT-PROD-005` | 5 |
| 6 | TRANSICIÓN DEL POS EXTERNO | `INT-POS-001`–`INT-POS-024` | 24 |
| 7 | VENTAS INVENTARIO FINANZAS Y FIDELIZACION | `INT-SALES-001`–`INT-SALES-011` | 11 |
| 8 | MARKETING BENEFICIOS Y VALIDACIÓN COMERCIAL | `INT-MKT-001`–`INT-MKT-003` | 3 |
<!-- PLAN-SECTION-META:END -->
