## BLOQUE AB

**Analítica, indicadores, calidad de datos y datos maestros**

Este bloque define el gobierno transversal de datos maestros, métricas,
indicadores, reportes, análisis y mejora continua de Vento Group.

No crea una aplicación monolítica de analítica ni sustituye las fuentes de
verdad de las aplicaciones propietarias.

Propiedad funcional:

```text
APLICACIONES DE DOMINIO
→ conservan sus datos maestros propietarios
→ conservan sus hechos y transacciones
→ presentan la analítica operativa de su proceso

SUPABASE Y BLOQUE E3
→ gobiernan arquitectura física, fuentes de verdad,
  integridad, exposición y rendimiento

VISO
→ presenta la visión administrativa y ejecutiva transversal

NUMERA
→ presenta costos, rentabilidad, liquidez,
  presupuestos y análisis económico

BLOQUE AB
→ gobierna datos maestros federados
→ define métricas e indicadores
→ gobierna calidad y certificación
→ define reportes y snapshots
→ coordina diagnóstico y mejora continua
```

### Organización documental del bloque

<!-- PLAN-SECTION-META:START -->
El bloque se divide en mini-bloques funcionales. Cada archivo conserva juntas las tareas que comparten propósito y resultado, evitando tanto el archivo monolítico como la fragmentación de una tarea por archivo.

| Orden | Mini-bloque | Cobertura | Tareas |
|---:|---|---|---:|
| 1 | DOMINIO DE DATOS MAESTROS Y ANALITICA | `DATA-DOM-001`–`DATA-DOM-017` | 17 |
| 2 | AUTORIZACIÓN DE DATOS Y METRICAS | `DATA-AUTH-001`–`DATA-AUTH-004` | 4 |
| 3 | EXPERIENCIA ANALITICA Y DE DECISIÓN | `DATA-UX-001`–`DATA-UX-008` | 8 |
| 4 | INTEGRACIONES ANALITICAS Y SEMANTICAS | `DATA-INT-001`–`DATA-INT-004` | 4 |
<!-- PLAN-SECTION-META:END -->
