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

DOMINIO

### [ ] DATA-DOM-001 — Definir gobierno federado de datos, propietarios, stewards y fuentes de verdad
### [ ] DATA-DOM-002 — Definir catálogo de datos maestros, datos de referencia y dimensiones compartidas
### [ ] DATA-DOM-003 — Definir identidad, claves, códigos, jerarquías, ciclo de vida, fusión y separación de datos maestros
### [ ] DATA-DOM-004 — Definir capa semántica y registro canónico de métricas e indicadores
### [ ] DATA-DOM-005 — Definir hechos, eventos, granularidad, dimensiones, calendarios, snapshots y comparabilidad histórica
### [ ] DATA-DOM-006 — Definir contratos de recopilación, ingestión, transformación, backfill y reconciliación
### [ ] DATA-DOM-007 — Definir calidad, certificación, frescura, completitud, unicidad, validez e integridad
### [ ] DATA-DOM-008 — Definir reportes, tableros, exportaciones, suscripciones, alertas y snapshots oficiales
### [ ] DATA-DOM-009 — Definir analítica de ventas, demanda, precios, promociones y canales
### [ ] DATA-DOM-010 — Definir analítica de inventario, abastecimiento, proveedores y logística
### [ ] DATA-DOM-011 — Definir analítica de producción, rendimiento, capacidad, merma y calidad
### [ ] DATA-DOM-012 — Definir analítica de servicio, clientes, fidelización, reputación y experiencia
### [ ] DATA-DOM-013 — Definir analítica de costos, rentabilidad, liquidez, presupuesto y escenarios
### [ ] DATA-DOM-014 — Definir diagnóstico transversal, anomalías, causas, oportunidades y nivel de confianza
### [ ] DATA-DOM-015 — Definir objetivos, líneas base, metas, drivers, guardrails y planes de medición
### [ ] DATA-DOM-016 — Definir acciones de mejora, experimentos, responsables, seguimiento y comprobación de resultados
### [ ] DATA-DOM-017 — Definir versionado de métricas, restatements, correcciones históricas y reproducibilidad

AUTORIZACIÓN

### [ ] DATA-AUTH-001 — Proteger datos maestros, métricas, reportes y análisis por dominio, entidad, territorio y finalidad
### [ ] DATA-AUTH-002 — Proteger información sensible, poblaciones pequeñas, comparaciones, exportaciones y drill-down
### [ ] DATA-AUTH-003 — Separar definición, certificación, publicación, fijación de metas, anotación, exportación y administración
### [ ] DATA-AUTH-004 — Auditar consultas, descargas, suscripciones, alertas, modelos y recomendaciones

EXPERIENCIA Y PANTALLAS

### [ ] DATA-UX-001 — Diseñar inicio ejecutivo simple y accionable por rol
### [ ] DATA-UX-002 — Diseñar catálogo de métricas y datos maestros con definición, dueño, fuente, calidad y linaje
### [ ] DATA-UX-003 — Diseñar tableros por dominio con filtros, comparación, drill-down y trazabilidad
### [ ] DATA-UX-004 — Diseñar centro de calidad, frescura, conciliaciones y certificación
### [ ] DATA-UX-005 — Diseñar espacio de investigación de variaciones, anomalías y causas
### [ ] DATA-UX-006 — Diseñar objetivos, metas, drivers, guardrails y acciones de mejora
### [ ] DATA-UX-007 — Diseñar reportes, exportaciones, suscripciones y snapshots versionados
### [ ] DATA-UX-008 — Validar comprensión, tiempos y decisiones con usuarios reales

INTEGRACIONES

### [ ] DATA-INT-001 — Definir contratos de eventos y lectura con todas las aplicaciones y fuentes externas
### [ ] DATA-INT-002 — Definir capa semántica, modelos analíticos, snapshots, caché, consultas y rendimiento
### [ ] DATA-INT-003 — Definir crosswalks, claves externas, identidad y reconciliación de datos maestros
### [ ] DATA-INT-004 — Definir integración controlada con BI, hojas de cálculo, modelos analíticos e inteligencia artificial
