# DOCUMENTO CANÓNICO DE CONTINUIDAD — AUTORIZACIÓN VENTO OS

> **IMPORTANTE**
>
> Este archivo es el punto de entrada del plan canónico modular de Vento OS.
>
> Las fuentes documentales canónicas son los fragmentos enumerados, ordenados y controlados mediante `manifest.json`.
>
> El archivo ubicado en `.generated/PLAN_IMPLEMENTACION_VENTO_OS_CANONICO_COMPILADO.md` es un artefacto derivado para lectura integral, validación y transferencia de contexto. No debe editarse manualmente.

## Estado canónico

| Campo                         | Valor                                                                                           |
| ----------------------------- | ----------------------------------------------------------------------------------------------- |
| Versión                       | 2026-07-25                                                                                      |
| Revisión documental           | **58**                                                                                          |
| Estado documental             | **VIGENTE**                                                                                     |
| Arquitectura documental       | **MODULAR CANÓNICA**                                                                            |
| Fuente de orden canónico      | `manifest.json`                                                                                 |
| Fragmentos canónicos | **263** |
| Tareas canónicas con marcador | **1575** |
| Tareas `AUTH` únicas | **316** |
| Tareas aprobadas | **378** |
| Tareas en propuesta | **0** |
| Tareas no iniciadas | **1197** |
| Tareas rechazadas | **0** |
| Porcentaje de completamiento | **24.00% (378/1575)** |
| Compilado derivado            | `.generated/PLAN_IMPLEMENTACION_VENTO_OS_CANONICO_COMPILADO.md`                                 |
| Estado del compilado          | **PENDIENTE DE REGENERACIÓN Y VALIDACIÓN EN CI**                                                |
| ADR vigente                   | `ADR-AUTH-001 — ACCEPTED`                                                                       |
| Última tarea aprobada | **INT-APP-007 — Definir auditoría transversal** |
| Tarea actual | **INT-APP-008 — Definir estados pendientes de sincronización** |
| Estado de la tarea actual | **NO INICIADA** |
| Siguiente tarea | **INT-APP-009 — Definir manejo de errores parciales** |
| Bloque actual | **BLOQUE X — Integraciones empresariales internas y externas** |
| Progreso del bloque | **BLOQUE X: 7 de 10 aprobadas; INT-APP-008 pendiente** |
| Estado de implementación      | **No iniciar código, migraciones ni cambios en Supabase**                                       |

### Continuidad inmediata

| Estado          | Valor                                                                                                  |
| --------------- | ------------------------------------------------------------------------------------------------------ |
| Última aprobada | `INT-APP-007` — Definir auditoría transversal |
| Tarea actual | `INT-APP-008` — Definir estados pendientes de sincronización — **NO INICIADA** |
| Siguiente tarea | `INT-APP-009` — Definir manejo de errores parciales |
| Restricción     | **FASE EXCLUSIVAMENTE DOCUMENTAL**                                                                     |

## Progreso documental aprobado

| Grupo de tareas                   | Estado                                       |
| --------------------------------- | -------------------------------------------- |
| `AUTH-CAT-001` a `AUTH-CAT-024`   | **APROBADAS**                                |
| `AUTH-RBAC-001` a `AUTH-RBAC-028` | **APROBADAS**                                |
| BLOQUE D                          | **CERRADO DOCUMENTALMENTE**                  |
| `AUTH-MOD-001` a `AUTH-MOD-020`   | **APROBADAS**                                |
| `AUTH-MOD-021` | **APROBADA — PUERTA SUPERADA** |
| `AUTH-CTX-001` a `AUTH-CTX-030` | **APROBADAS** |
| BLOQUE X | **7 DE 10 APROBADAS — ACTUAL INT-APP-008** |
| Implementación física             | **NO INICIADA**                              |

## Reglas de edición

1. Los archivos ubicados dentro de `docs/plan-canonico/modular/` son las fuentes documentales editables.
2. El orden de compilación debe corresponder exclusivamente al registrado en `manifest.json`.
3. No debe editarse manualmente ningún archivo dentro de `.generated/`.
4. Cada cambio guardado en un fragmento canónico debe regenerar y validar automáticamente el compilado.
5. Una tarea no puede marcarse como aprobada hasta que el usuario indique expresamente `APROBADO`.
6. No debe adelantarse la tarea siguiente ni modificarse una decisión aprobada sin autorización expresa.
7. Las migraciones, cambios de código y modificaciones de Supabase permanecen prohibidas durante la fase documental actual.

## Navegación principal

- [Protocolo obligatorio](./01_PROTOCOLO.md)
- [Roadmap maestro](./02_ROADMAP_MAESTRO.md)
- [Contexto y decisión de autorización](./bloques/E_CONTEXTO_Y_DECISION/00_INTRO.md)
- [Descubrimiento integral de operación y cobertura](./bloques/E1_DESCUBRIMIENTO_OPERATIVO/00_INTRO.md)
- [Arquitectura funcional y experiencia](./bloques/E2_PROCESOS_Y_EXPERIENCIA/00_BLOQUE_E2.md)
- [Arquitectura integral de Supabase](./bloques/E3_SUPABASE/00_INTRO.md)
- [Servicios operativos transversales](./bloques/E4_SERVICIOS_TRANSVERSALES/00_INTRO.md)
- [Paquetes de implementación y preparación operativa](./bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/00_INTRO.md)
- [Matrices operativas de caja, barra y cocina](./bloques/D_MATRICES/03_OPERATIVOS_CAJA_BARRA_COCINA.md)
- [Orden de implementación](./90_ORDEN_DE_IMPLEMENTACION.md)
- [Estado inicial conocido](./99_ESTADO_INICIAL_CONOCIDO.md)
- [Documento compilado](./.generated/PLAN_IMPLEMENTACION_VENTO_OS_CANONICO_COMPILADO.md)
- [Registro global de tareas](./.generated/REGISTRO_GLOBAL_DE_TAREAS.md)

## Control de continuidad

```text
ÚLTIMA TAREA APROBADA
INT-APP-007 — Definir auditoría transversal
        ↓
TAREA ACTUAL
INT-APP-008 — Definir estados pendientes de sincronización
        ↓
SIGUIENTE TAREA RESERVADA
INT-APP-009 — Definir manejo de errores parciales
        ↓
CONTINUIDAD DEL BLOQUE
BLOQUE X — 7 de 10 tareas aprobadas
```
