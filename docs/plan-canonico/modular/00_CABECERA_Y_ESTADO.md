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
| Fragmentos canónicos | **294** |
| Tareas canónicas con marcador | **1594** |
| Tareas `AUTH` únicas | **317** |
| Tareas aprobadas | **583** |
| Tareas en propuesta | **0** |
| Tareas no iniciadas | **1011** |
| Tareas rechazadas | **0** |
| Porcentaje de completamiento | **36.57% (583/1594)** |
| Compilado derivado            | `.generated/PLAN_IMPLEMENTACION_VENTO_OS_CANONICO_COMPILADO.md`                                 |
| Estado del compilado          | **PENDIENTE DE REGENERACIÓN Y VALIDACIÓN EN CI**                                                |
| ADR vigente                   | `ADR-AUTH-001 — ACCEPTED`                                                                       |
| Última tarea aprobada | **PRINT-ARC-005 — Definir plantilla, versión, tamaño y datos requeridos** |
| Tarea actual | **PRINT-ARC-006 — Definir contrato canónico de trabajo de impresión** |
| Estado de la tarea actual | **NO INICIADA** |
| Siguiente tarea | **PRINT-ARC-007 — Definir enrutamiento por sede, área, documento, canal y dispositivo** |
| Bloque actual | **CARRIL NEXO — Remisiones NEXO como primer paquete vertical — etapa 15: CONDITIONAL_DESIGN_ARTIFACTS** |
| Progreso del bloque | **CARRIL NEXO: 7 de 157 aprobadas; PRINT-ARC-006 pendiente** |
| Estado de implementación      | **No iniciar código, migraciones ni cambios en Supabase**                                       |

### Continuidad inmediata

| Estado          | Valor                                                                                                  |
| --------------- | ------------------------------------------------------------------------------------------------------ |
| Última aprobada | `PRINT-ARC-005` — Definir plantilla, versión, tamaño y datos requeridos |
| Tarea actual | `PRINT-ARC-006` — Definir contrato canónico de trabajo de impresión — **NO INICIADA** |
| Siguiente tarea | `PRINT-ARC-007` — Definir enrutamiento por sede, área, documento, canal y dispositivo |
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
| CONTINUIDAD ACTIVA | **CARRIL NEXO: 7 DE 157 APROBADAS — ACTUAL PRINT-ARC-006** |
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
PRINT-ARC-005 — Definir plantilla, versión, tamaño y datos requeridos
        ↓
TAREA ACTUAL
PRINT-ARC-006 — Definir contrato canónico de trabajo de impresión
        ↓
SIGUIENTE TAREA RESERVADA
PRINT-ARC-007 — Definir enrutamiento por sede, área, documento, canal y dispositivo
        ↓
CONTINUIDAD DEL BLOQUE
CARRIL NEXO — 7 de 157 tareas aprobadas
```
