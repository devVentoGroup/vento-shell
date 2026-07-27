## BLOQUE E5

**Diseño de solución, paquetes de implementación y preparación operativa**

Este bloque convierte las decisiones aprobadas de E1, E2, E3, E4, X y de
los roadmaps por aplicación en unidades de trabajo implementables,
verificables, desplegables y reversibles.

No reemplaza:

BLOQUE E1
→ descubre operación real, capacidades y cobertura actual

BLOQUE E2
→ diseña procesos, actores, pantallas y experiencia objetivo

BLOQUE X
→ define integraciones, eventos y contratos entre sistemas

BLOQUE E3
→ define arquitectura de datos, Supabase y transición

BLOQUE E4
→ define colas, impresión, notificaciones y evidencia

BLOQUES POR APLICACIÓN
→ definen el comportamiento funcional y la experiencia de cada dominio

BLOQUE E5
→ transforma esas decisiones en paquetes concretos de implementación,
  planes de readiness, cutover, piloto, rollback e hypercare

Durante este bloque no se implementan código, migraciones ni cambios
físicos. Se diseña y aprueba cómo se implementará cada alcance.

Separación obligatoria:

```text
BLOQUE E5
→ DISEÑA Y APRUEBA CÓMO SE IMPLEMENTARÁ

SHELL-CI-020 + BLOQUE R CUANDO APLIQUE
→ IMPLEMENTAN CÓDIGO, CONFIGURACIÓN Y MIGRACIONES POR PAQUETE

SHELL-CI-021
→ EJECUTA EL CHECKLIST DE READINESS APROBADO

SHELL-CI-022
→ EJECUTA CUTOVER Y PILOTO

SHELL-CI-023
→ EJECUTA HYPERCARE Y ESTABILIZACIÓN

SHELL-CI-024 + BLOQUE U
→ CERTIFICAN CIERRE DEL PAQUETE Y COBERTURA INTEGRAL
```

Las tareas `READY-GATE-*`, `CUTOVER-OPS-*` y `HYPERCARE-OPS-*` de E5
definen criterios, evidencia requerida, responsables, suspensión, rollback y
procedimientos. No ejecutan esas comprobaciones ni producen evidencia
posterior al despliegue.
