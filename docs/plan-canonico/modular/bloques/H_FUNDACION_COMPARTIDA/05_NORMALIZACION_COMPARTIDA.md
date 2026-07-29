### MINI-BLOQUE — NORMALIZACIÓN COMPARTIDA

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **normalización compartida** dentro de **H FUNDACION COMPARTIDA**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `SHELL-NORM-001` a `SHELL-NORM-009` — 9 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Límites funcionales:** comienza con “Crear `@vento/data-normalization`” y concluye con “Probar idempotencia y conservación semántica”.
<!-- PLAN-SECTION-META:END -->

### [ ] SHELL-NORM-001 — Crear `@vento/data-normalization`
### [ ] SHELL-NORM-002 — Centralizar tipos de campo normalizable
### [ ] SHELL-NORM-003 — Centralizar reglas de espacios, Unicode y capitalización
### [ ] SHELL-NORM-004 — Centralizar conectores y excepciones
### [ ] SHELL-NORM-005 — Centralizar diccionarios ortográficos versionados
### [ ] SHELL-NORM-006 — Crear normalización de búsqueda y comparación
### [ ] SHELL-NORM-007 — Crear previsualización de transformaciones
### [ ] SHELL-NORM-008 — Crear metadatos de versión y auditoría de reglas
### [ ] SHELL-NORM-009 — Probar idempotencia y conservación semántica

Regla:

`@vento/data-normalization`
→ contiene funciones puras, tipos, diccionarios y validadores compartidos

BLOQUE R
→ implementa únicamente persistencia, backfills, funciones SQL,
  constraints, índices y triggers defensivos
