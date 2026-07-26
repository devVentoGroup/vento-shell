## BLOQUE E2

**Arquitectura funcional, procesos y experiencia transversal**

Este bloque depende de:

BLOQUE C
→ catálogo canónico de aplicaciones y permisos

BLOQUE D
→ matrices vigentes de la versión contractual base

BLOQUE E
→ contexto y decisión de autorización

BLOQUE E1
→ mapa de capacidades, operación real y cobertura de implementación

No implementa todavía pantallas definitivas.

Regla de realimentación:

- E1 conserva el AS-IS y la línea base de cobertura;
- E2 diseña el TO-BE;
- E2, E3, E4, X y los bloques por aplicación pueden devolver nuevas
  brechas, dependencias o decisiones de propiedad a E1;
- una devolución deberá actualizar la trazabilidad y no crear inventarios
  paralelos.

### Secuencia documental interna

La continuidad de E2 se calcula desde `active-sequence.json`. No se actualiza
manualmente la cabecera al cerrar cada subbloque.

El orden lógico aprobado para desarrollar las tareas existentes es:

1. cerrar `PROC-ACTOR-001` a `PROC-ACTOR-010`;
2. inventariar la realidad física mediante `UX-STATION-001`;
3. completar los procesos transversales `OPS-CAN-001`, `OPS-LOG-001` y
   `OPS-B2B-001`;
4. completar `CAP-TAL-001` a `CAP-TAL-006`;
5. fijar principios de experiencia mediante `UX-BASE-001` a `UX-BASE-015`;
6. definir `NFR-REQ-001` a `NFR-REQ-011`;
7. diseñar estaciones mediante `UX-STATION-002` a `UX-STATION-007`;
8. definir gramática, bandeja y composición mediante `UX-STATION-010` a
   `UX-STATION-012`;
9. prototipar y aprobar mediante `UX-STATION-008` y `UX-STATION-009`;
10. diseñar `UX-ADMIN-001` a `UX-ADMIN-005`;
11. definir `PROC-SCREEN-001` a `PROC-SCREEN-028`;
12. cerrar cobertura mediante `PROC-COVER-001` a `PROC-COVER-010`;
13. aprobar la puerta no funcional `NFR-REQ-012`.

La recolección de evidencia podrá realizarse en paralelo. La aprobación
documental conservará este orden para impedir que una pantalla se diseñe antes
de conocer procesos, actores, condiciones físicas y requisitos no funcionales.

En particular:

```text
DISEÑO COMPLETO DE ESTACIÓN
UX-STATION-002 a UX-STATION-007
+ UX-STATION-010 a UX-STATION-012
        ↓
PROTOTIPO CON TRABAJADORES
UX-STATION-008
        ↓
APROBACIÓN DE MATRIZ
UX-STATION-009
```

