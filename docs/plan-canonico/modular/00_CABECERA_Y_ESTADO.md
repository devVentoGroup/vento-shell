# DOCUMENTO CANÓNICO DE CONTINUIDAD — AUTORIZACIÓN VENTO OS

> **IMPORTANTE**
>
> Este archivo es el punto de entrada del plan canónico modular de Vento OS.
>
> Las fuentes documentales canónicas son los fragmentos enumerados, ordenados y controlados mediante `manifest.json`.
>
> El archivo ubicado en `.generated/PLAN_IMPLEMENTACION_VENTO_OS_CANONICO_COMPILADO.md` es un artefacto derivado para lectura integral, validación y transferencia de contexto. No debe editarse manualmente.

## Estado canónico

| Campo                     | Valor                                                               |
| ------------------------- | ------------------------------------------------------------------- |
| Versión                   | 2026-07-21                                                          |
| Revisión documental       | **38**                                                              |
| Estado documental         | **VIGENTE**                                                         |
| Arquitectura documental   | **MODULAR CANÓNICA**                                                |
| Fuente de orden canónico  | `manifest.json`                                                     |
| Fragmentos canónicos      | **62**                                                              |
| Tareas `AUTH` únicas      | **312**                                                             |
| Compilado derivado        | `.generated/PLAN_IMPLEMENTACION_VENTO_OS_CANONICO_COMPILADO.md`     |
| Estado del compilado      | **GENERADO Y VALIDADO**                                             |
| ADR vigente               | `ADR-AUTH-001 — ACCEPTED`                                           |
| Última tarea aprobada     | **AUTH-CTX-008 — Incluir rol base vigente**                         |
| Tarea actual              | **AUTH-CTX-009 — Incluir cobertura administrativa por sede y área** |
| Estado de la tarea actual | **NO INICIADA**                                                     |
| Siguiente tarea           | **AUTH-CTX-010 — Incluir turno publicado y vigente**                |
| Bloque actual             | **BLOQUE E — Contexto y decisión de autorización unificados**       |
| Progreso del bloque       | **AUTH-CTX-001 a AUTH-CTX-008 aprobadas; AUTH-CTX-009 pendiente**   |
| Estado de implementación  | **No iniciar código, migraciones ni cambios en Supabase**           |

### Continuidad inmediata

| Estado          | Valor                                                                               |
| --------------- | ----------------------------------------------------------------------------------- |
| Última aprobada | `AUTH-CTX-008` — Incluir rol base vigente                                           |
| Tarea actual    | `AUTH-CTX-009` — Incluir cobertura administrativa por sede y área — **NO INICIADA** |
| Siguiente tarea | `AUTH-CTX-010` — Incluir turno publicado y vigente                                  |
| Restricción     | **FASE EXCLUSIVAMENTE DOCUMENTAL**                                                  |

## Progreso documental aprobado

| Grupo de tareas                   | Estado                                         |
| --------------------------------- | ---------------------------------------------- |
| `AUTH-CAT-001` a `AUTH-CAT-024`   | **APROBADAS**                                  |
| `AUTH-RBAC-001` a `AUTH-RBAC-028` | **APROBADAS**                                  |
| BLOQUE D                          | **CERRADO DOCUMENTALMENTE**                    |
| `AUTH-MOD-001` a `AUTH-MOD-020`   | **APROBADAS**                                  |
| `AUTH-MOD-021`                    | **NO INICIADA — PUERTA ANTES DE AUTH-CTX-028** |
| `AUTH-CTX-001` a `AUTH-CTX-008`   | **APROBADAS**                                  |
| `AUTH-CTX-009`                    | **NO INICIADA**                                |
| `AUTH-CTX-010` a `AUTH-CTX-030`   | **NO INICIADAS**                               |
| Implementación física             | **NO INICIADA**                                |

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
- [Descubrimiento integral de operación y cobertura](./bloques/E1_DESCUBRIMIENTO_OPERATIVO/00_BLOQUE_E1.md)
- [Arquitectura funcional y experiencia](./bloques/E2_PROCESOS_Y_EXPERIENCIA/00_BLOQUE_E2.md)
- [Arquitectura integral de Supabase](./bloques/E3_SUPABASE/00_BLOQUE_E3.md)
- [Servicios operativos transversales](./bloques/E4_SERVICIOS_TRANSVERSALES/00_BLOQUE_E4.md)
- [Paquetes de implementación y preparación operativa](./bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/00_BLOQUE_E5.md)
- [Matrices operativas de caja, barra y cocina](./bloques/D_MATRICES/03_OPERATIVOS_CAJA_BARRA_COCINA.md)
- [Orden de implementación](./90_ORDEN_DE_IMPLEMENTACION.md)
- [Estado inicial conocido](./99_ESTADO_INICIAL_CONOCIDO.md)
- [Documento compilado](./.generated/PLAN_IMPLEMENTACION_VENTO_OS_CANONICO_COMPILADO.md)

## Control de continuidad

```text
ÚLTIMA TAREA APROBADA
AUTH-CTX-008 — Incluir rol base vigente
        ↓
TAREA ACTUAL
AUTH-CTX-009 — Incluir cobertura
administrativa por sede y área
        ↓
SIGUIENTE TAREA RESERVADA
AUTH-CTX-010 — Incluir turno
publicado y vigente
        ↓
CONTINUIDAD DEL BLOQUE
AUTH-CTX-011 a AUTH-CTX-027
        ↓
PUERTA CONTRACTUAL OBLIGATORIA
AUTH-MOD-021 — Definir rol base mínimo
no privilegiado para trabajadores
puramente operativos
        ↓
CIERRE DEL BLOQUE
AUTH-CTX-028 a AUTH-CTX-030
```
