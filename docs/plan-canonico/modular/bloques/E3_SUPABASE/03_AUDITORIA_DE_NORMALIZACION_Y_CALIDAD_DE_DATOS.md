### AUDITORÍA DE NORMALIZACIÓN Y CALIDAD DE DATOS

### [ ] DATA-NORM-AUD-001 — Inventariar campos textuales y reglas actuales de normalización
### [ ] DATA-NORM-AUD-002 — Detectar inconsistencias de espacios, mayúsculas, Unicode, tildes, signos y conectores
### [ ] DATA-NORM-AUD-003 — Identificar marcas, siglas, unidades, razones sociales y excepciones que no admiten transformación genérica
### [ ] DATA-NORM-AUD-004 — Detectar duplicados semánticos mediante valores normalizados de comparación
### [ ] DATA-NORM-AUD-005 — Clasificar transformaciones deterministas, correcciones por diccionario y casos ambiguos
### [ ] DATA-NORM-AUD-006 — Inventariar triggers, funciones, código cliente y procesos externos que actualmente modifican texto
### [ ] DATA-NORM-AUD-007 — Medir impacto de normalización sobre búsquedas, integraciones, relaciones y unicidad

Regla de auditoría

La auditoría deberá diferenciar:

VALOR MOSTRADO
→ texto empresarial visible para personas

VALOR DE BÚSQUEDA
→ representación tolerante para búsquedas y comparación

VALOR EXTERNO ORIGINAL
→ dato recibido desde una integración o importación

IDENTIFICADOR TÉCNICO
→ código que no debe corregirse ortográficamente

La coincidencia entre dos valores normalizados no autoriza por sí sola
fusionar registros.

Toda posible fusión deberá revisar:

- relaciones;
- movimientos;
- recetas;
- inventario;
- proveedores;
- integraciones;
- historial;
- auditoría.
