### MATRIZ DE COBERTURA

Cada capacidad deberá recibir exactamente un estado principal:

```text
PRODUCTION_READY
FUNCTIONAL_PARTIAL
INFRASTRUCTURE_ONLY
UI_ONLY
PROTOTYPE_ONLY
LEGACY_ACTIVE
BROKEN
MISSING
BLOCKED_BY_DEPENDENCY
DEFERRED
OUT_OF_SCOPE
```

### Organización documental del bloque

<!-- PLAN-SECTION-META:START -->
El bloque se divide en mini-bloques funcionales. Cada archivo conserva juntas las tareas que comparten propósito y resultado, evitando tanto el archivo monolítico como la fragmentación de una tarea por archivo.

| Orden | Mini-bloque | Cobertura | Tareas |
|---:|---|---|---:|
| 1 | CRITERIOS Y COBERTURA FUNCIONAL | `CAP-COVER-001`–`CAP-COVER-004` | 4 |
| 2 | DATOS AUTORIZACIÓN AUDITORÍA PRUEBAS E INTEGRACIÓN | `CAP-COVER-005`–`CAP-COVER-009` | 5 |
| 3 | DEPENDENCIAS PRIORIZACION Y APROBACIÓN | `CAP-COVER-010`–`CAP-COVER-012` | 3 |
<!-- PLAN-SECTION-META:END -->
