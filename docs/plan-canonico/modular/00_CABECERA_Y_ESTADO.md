# DOCUMENTO CANÓNICO DE CONTINUIDAD — AUTORIZACIÓN VENTO OS

> **IMPORTANTE**
>
> Este archivo es el punto de entrada del plan canónico modular de Vento OS.
>
> Las fuentes documentales canónicas son los fragmentos enumerados, ordenados y controlados mediante `manifest.json`.
>
> El archivo ubicado en `.generated/PLAN_IMPLEMENTACION_VENTO_OS_CANONICO_COMPILADO.md` es un artefacto derivado para lectura integral, validación y transferencia de contexto. No debe editarse manualmente.

## Estado canónico

| Campo                     | Valor                                                                  |
| ------------------------- | ---------------------------------------------------------------------- |
| Versión                   | 2026-07-18                                                             |
| Revisión documental       | **34**                                                                 |
| Estado documental         | **VIGENTE**                                                            |
| Arquitectura documental   | **MODULAR CANÓNICA**                                                   |
| Fuente de orden canónico  | `manifest.json`                                                        |
| Fragmentos canónicos      | **59**                                                                 |
| Tareas `AUTH` únicas      | **311**                                                                |
| Compilado derivado        | `.generated/PLAN_IMPLEMENTACION_VENTO_OS_CANONICO_COMPILADO.md`        |
| Estado del compilado      | **GENERADO Y VALIDADO**                                                |
| ADR vigente               | `ADR-AUTH-001 — ACCEPTED`                                              |
| Última tarea aprobada     | **AUTH-RBAC-008 — Crear matriz de cajero_satelite**                    |
| Tarea actual              | **AUTH-RBAC-009 — Crear matriz de barista_satelite**                   |
| Estado de la tarea actual | **NO INICIADA**                                                        |
| Siguiente tarea           | **AUTH-RBAC-010 — Crear matriz de cocinero_satelite**                  |
| Bloque actual             | **BLOQUE D — Matrices canónicas de roles, excepciones y dispositivos** |
| Progreso del bloque       | **AUTH-RBAC-001 a AUTH-RBAC-008 aprobadas; AUTH-RBAC-009 pendiente**   |
| Estado de implementación  | **No iniciar código, migraciones ni cambios en Supabase**              |

### Continuidad inmediata

| Estado          | Valor                                                        |
| --------------- | ------------------------------------------------------------ |
| Última aprobada | `AUTH-RBAC-008` — matriz de `cajero_satelite`                |
| Tarea actual    | `AUTH-RBAC-009` — matriz de `barista_satelite` — NO INICIADA |
| Siguiente tarea | `AUTH-RBAC-010` — matriz de `cocinero_satelite`              |
| Archivo activo  | `bloques/D_MATRICES/03_OPERATIVOS_CAJA_BARRA_COCINA.md`      |
| Restricción     | **FASE EXCLUSIVAMENTE DOCUMENTAL**                           |

## Progreso documental aprobado

| Grupo de tareas                   | Estado          |
| --------------------------------- | --------------- |
| `AUTH-CAT-001` a `AUTH-CAT-019`   | **APROBADAS**   |
| `AUTH-RBAC-001` a `AUTH-RBAC-008` | **APROBADAS**   |
| `AUTH-RBAC-009`                   | **NO INICIADA** |
| Implementación física             | **NO INICIADA** |

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
- [Matrices operativas de caja, barra y cocina](./bloques/D_MATRICES/03_OPERATIVOS_CAJA_BARRA_COCINA.md)
- [Orden de implementación](./90_ORDEN_DE_IMPLEMENTACION.md)
- [Estado inicial conocido](./99_ESTADO_INICIAL_CONOCIDO.md)
- [Documento compilado](./.generated/PLAN_IMPLEMENTACION_VENTO_OS_CANONICO_COMPILADO.md)

## Control de continuidad

```text
ÚLTIMA TAREA APROBADA
AUTH-RBAC-008
        ↓
TAREA ACTUAL
AUTH-RBAC-009 — Crear matriz de barista_satelite
        ↓
SIGUIENTE TAREA RESERVADA
AUTH-RBAC-010 — Crear matriz de cocinero_satelite