### PUERTA DE SALIDA DE E5

### [ ] E5-GATE-001 — Confirmar que cada capacidad priorizada tiene paquete aprobado
### [ ] E5-GATE-002 — Confirmar que cada brecha crítica tiene propietario y destino
### [ ] E5-GATE-003 — Confirmar que los requisitos no funcionales están cubiertos
### [ ] E5-GATE-004 — Confirmar que rollout, rollback y contingencia son ejecutables
### [ ] E5-GATE-005 — Confirmar que el piloto tiene criterios medibles
### [ ] E5-GATE-006 — Confirmar que capacitación y soporte están planificados
### [ ] E5-GATE-007 — Confirmar trazabilidad desde cada requisito `TREQ-*` hasta su prueba, paquete y evidencia de cierre
### [ ] E5-GATE-008 — Aprobar entrada a implementación física por paquetes

`E5-GATE-008` solo puede comprobar que el paquete y sus planes previos son
completos y ejecutables. No depende de `READY-GATE-*` ejecutados ni de
evidencia posterior al despliegue.

Después de `E5-GATE-008`, la secuencia propietaria será:

```text
SHELL-CI-020
→ SHELL-CI-021
→ SHELL-CI-022
→ SHELL-CI-023
→ SHELL-CI-024
```

BLOQUE R se intercalará cuando el paquete incluya cambios físicos de Supabase,
y BLOQUE U certificará la regresión e integración transversal aplicables.
