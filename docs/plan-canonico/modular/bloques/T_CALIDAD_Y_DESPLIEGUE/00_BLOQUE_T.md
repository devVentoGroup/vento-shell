## BLOQUE T

**CI, versionado y despliegue**

### [ ] SHELL-CI-001 — Crear pruebas de paquetes compartidos
### [ ] SHELL-CI-002 — Crear build independiente por paquete
### [ ] SHELL-CI-003 — Crear releases versionados
### [ ] SHELL-CI-004 — Crear changelog automático
### [ ] SHELL-CI-005 — Crear matriz de compatibilidad
### [ ] SHELL-CI-006 — Crear actualización de consumidores mediante PR
### [ ] SHELL-CI-007 — Probar NEXO antes de actualizar
### [ ] SHELL-CI-008 — Probar FOGO antes de actualizar
### [ ] SHELL-CI-009 — Probar ORIGO antes de actualizar
### [ ] SHELL-CI-010 — Probar PULSO antes de actualizar
### [ ] SHELL-CI-011 — Probar VISO antes de actualizar
### [ ] SHELL-CI-012 — Probar NUMERA antes de actualizar
### [ ] SHELL-CI-013 — Probar ANIMA antes de actualizar
### [ ] SHELL-CI-014 — Permitir rollback por repositorio
### [ ] SHELL-CI-015 — Evitar despliegue simultáneo obligatorio
### [ ] SHELL-CI-016 — Estandarizar un comando de pruebas automatizadas por repositorio
### [ ] SHELL-CI-017 — Crear verificador automático del Registro Canónico de Requisitos de Prueba
### [ ] SHELL-CI-018 — Bloquear merge o despliegue cuando fallen pruebas obligatorias
### [ ] SHELL-CI-019 — Publicar evidencia de pruebas por paquete y repositorio
### [ ] SHELL-CI-020 — Implementar y desplegar cada paquete aprobado por E5
### [ ] SHELL-CI-021 — Ejecutar y resolver el checklist de readiness aprobado
### [ ] SHELL-CI-022 — Ejecutar cutover y piloto conforme al plan aprobado
### [ ] SHELL-CI-023 — Ejecutar hypercare, conciliación y estabilización
### [ ] SHELL-CI-024 — Certificar cierre del paquete y transferencia a soporte

### Ciclo de ejecución por paquete

```text
E5-GATE-008
→ SHELL-CI-020
→ SHELL-CI-021
→ SHELL-CI-022
→ SHELL-CI-023
→ SHELL-CI-024
```

Reglas:

- `SHELL-CI-020` ejecuta únicamente un paquete aprobado y conserva commit,
  versión, ambiente, despliegue, migraciones aplicables, pruebas y rollback;
- las migraciones y validaciones de datos se ejecutan mediante las tareas
  exactas de BLOQUE R incluidas en el paquete;
- `SHELL-CI-021` produce la evidencia real definida por `READY-GATE-001` a
  `READY-GATE-015` y decide listo, suspendido o rechazado;
- `SHELL-CI-022` ejecuta `CUTOVER-OPS-001` a `CUTOVER-OPS-010`, incluida la
  decisión de continuar, pausar o revertir;
- `SHELL-CI-023` ejecuta `HYPERCARE-OPS-001` a
  `HYPERCARE-OPS-010` y convierte defectos en tareas y pruebas de regresión;
- `SHELL-CI-024` no cierra con incidentes, conciliaciones, contingencias o
  deuda sin tarea, propietario, fecha y evidencia;
- BLOQUE U certifica pruebas integrales, pero no sustituye las verificaciones
  realizadas durante implementación, readiness, piloto e hypercare.

