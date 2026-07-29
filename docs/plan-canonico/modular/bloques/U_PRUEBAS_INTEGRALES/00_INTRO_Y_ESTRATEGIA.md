## BLOQUE U

**Pruebas integrales**

### Regla de entrada

El BLOQUE U no es el momento inicial para escribir todas las pruebas.

Antes de entrar a U deberán existir:

- pruebas unitarias implementadas con cada paquete;
- pruebas contractuales implementadas con cada paquete;
- pruebas de integración de datos y servicios;
- pruebas negativas de autorización;
- pruebas de migraciones;
- pruebas de idempotencia y concurrencia aplicables;
- evidencia de ejecución por repositorio;
- Registro Canónico de Requisitos de Prueba actualizado.

El BLOQUE U ejecutará:

- regresión automatizada transversal;
- pruebas E2E entre aplicaciones;
- pruebas de seguridad;
- pruebas funcionales;
- pruebas operativas;
- pruebas de experiencia;
- pilotos con usuarios reales;
- validación final de requisitos `TREQ-*`.

La ejecución por paquete ocurre antes mediante `SHELL-CI-020` a
`SHELL-CI-024`. U consume esa evidencia, ejecuta certificación transversal y
puede rechazar el cierre; no reemplaza readiness, cutover, piloto o hypercare.

### Organización documental del bloque

<!-- PLAN-SECTION-META:START -->
El bloque se divide en mini-bloques funcionales. Cada archivo conserva juntas las tareas que comparten propósito y resultado, evitando tanto el archivo monolítico como la fragmentación de una tarea por archivo.

| Orden | Mini-bloque | Cobertura | Tareas |
|---:|---|---|---:|
| 1 | PRUEBAS INTEGRALES DE AUTORIZACIÓN | `AUTH-QA-001`–`AUTH-QA-030` | 30 |
| 2 | PRUEBAS INTEGRALES DE EXPERIENCIA | `UX-QA-001`–`UX-QA-030` | 30 |
<!-- PLAN-SECTION-META:END -->
