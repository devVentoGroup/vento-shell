## BLOQUE G

**VISO — Gobierno administrativo, programación laboral y configuración transversal**

VISO gobierna trabajadores, asignaciones, programación, roles, sedes, áreas, permisos, excepciones, simulación, dispositivos y auditoría administrativa.

VISO no replica la operación propietaria de otras aplicaciones.

### Organización

| Orden | Mini-bloque | Cobertura | Tareas |
| ---: | --- | --- | ---: |
| 1 | Gobierno de acceso | `VISO-AUTH-001`–`020` | 20 |
| 2 | Programación laboral | `VISO-SCH-001`–`008` | 8 |
| 3 | Núcleo mínimo | `VISO-CORE-001`–`006` | 6 |
| 4 | Experiencia administrativa | `VISO-UX-001`–`020` | 20 |

### Frontera

```text
VISO → propone, revisa, publica, corrige y audita
ANIMA → presenta publicados y registra ejecución/asistencia
employee_shifts → fuente actual mientras E3 define objetivo
```

No se autoriza tabla mensual paralela.

El delta mensual no completa tareas. `VISO-SCH-008` debe aprobarse antes de hacer canónica la regla de 186 h, autorizar producción, cerrar el núcleo/UX afectados o aprobar el package.
