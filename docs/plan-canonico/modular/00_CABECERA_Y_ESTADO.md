# DOCUMENTO CANÓNICO DE CONTINUIDAD — AUTORIZACIÓN VENTO OS

> **IMPORTANTE**
>
> Este archivo es el punto de entrada del plan canónico modular de Vento OS.
>
> Las fuentes documentales canónicas son los fragmentos enumerados, ordenados y controlados mediante `manifest.json`.
>
> El archivo ubicado en `.generated/PLAN_IMPLEMENTACION_VENTO_OS_CANONICO_COMPILADO.md` es un artefacto derivado para lectura integral, validación y transferencia de contexto. No debe editarse manualmente.

## Estado canónico

| Campo                     | Valor                                                                                                                         |
| ------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| Versión                   | 2026-07-20                                                                                                                    |
| Revisión documental       | **36**                                                                                                                        |
| Estado documental         | **VIGENTE**                                                                                                                   |
| Arquitectura documental   | **MODULAR CANÓNICA**                                                                                                          |
| Fuente de orden canónico  | `manifest.json`                                                                                                               |
| Fragmentos canónicos      | **62**                                                                                                                        |
| Tareas `AUTH` únicas      | **311**                                                                                                                       |
| Compilado derivado        | `.generated/PLAN_IMPLEMENTACION_VENTO_OS_CANONICO_COMPILADO.md`                                                               |
| Estado del compilado      | **GENERADO Y VALIDADO**                                                                                                       |
| ADR vigente               | `ADR-AUTH-001 — ACCEPTED`                                                                                                     |
| Última tarea aprobada     | **AUTH-CAT-022 — Descomponer permisos legacy maduros y definir nuevas claves atómicas**                                       |
| Tarea actual              | **AUTH-CAT-023 — Actualizar matrices, excepciones, denegaciones y paquetes de dispositivo afectados por el diff contractual** |
| Estado de la tarea actual | **NO INICIADA**                                                                                                               |
| Siguiente tarea           | **AUTH-CAT-024 — Validar, publicar y congelar la versión canónica que alimentará los datasets**                               |
| Bloque actual             | **BLOQUE D — Revisión contractual previa a datasets**                                                                         |
| Progreso del bloque       | **AUTH-RBAC-001 a AUTH-RBAC-023 y AUTH-CAT-020 a AUTH-CAT-022 aprobadas; AUTH-CAT-023 pendiente**                             |
| Estado de implementación  | **No iniciar código, migraciones ni cambios en Supabase**                                                                     |

### Continuidad inmediata

| Estado          | Valor                                                                                                                                         |
| --------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| Última aprobada | `AUTH-CAT-022` — Descomponer permisos legacy maduros y definir nuevas claves atómicas                                                         |
| Tarea actual    | `AUTH-CAT-023` — Actualizar matrices, excepciones, denegaciones y paquetes de dispositivo afectados por el diff contractual — **NO INICIADA** |
| Siguiente tarea | `AUTH-CAT-024` — Validar, publicar y congelar la versión canónica que alimentará los datasets                                                 |
| Restricción     | **FASE EXCLUSIVAMENTE DOCUMENTAL**                                                                                                            |

## Progreso documental aprobado

| Grupo de tareas                   | Estado          |
| --------------------------------- | --------------- |
| `AUTH-CAT-001` a `AUTH-CAT-022`   | **APROBADAS**   |
| `AUTH-CAT-023`                    | **NO INICIADA** |
| `AUTH-CAT-024`                    | **NO INICIADA** |
| `AUTH-RBAC-001` a `AUTH-RBAC-023` | **APROBADAS**   |
| `AUTH-RBAC-024`                   | **NO INICIADA** |
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
AUTH-CAT-022 — Descomponer permisos legacy maduros
y definir nuevas claves atómicas
        ↓
TAREA ACTUAL
AUTH-CAT-023 — Actualizar matrices, excepciones,
denegaciones y paquetes de dispositivo afectados
por el diff contractual
        ↓
SIGUIENTE TAREA RESERVADA
AUTH-CAT-024 — Validar, publicar y congelar
la versión canónica que alimentará los datasets
        ↓
ETAPA POSTERIOR
AUTH-RBAC-024 — Definir dataset canónico de matriz base
```
