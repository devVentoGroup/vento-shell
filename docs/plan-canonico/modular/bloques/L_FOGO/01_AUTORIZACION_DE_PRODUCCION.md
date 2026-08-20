### MINI-BLOQUE — AUTORIZACIÓN DE PRODUCCION

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **autorización de produccion** dentro de **L FOGO**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `FOGO-AUTH-001` a `FOGO-AUTH-016` — 16 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Límites funcionales:** comienza con “Inventariar vistas y acciones productivas” y concluye con “Ejecutar pruebas integrales”.
<!-- PLAN-SECTION-META:END -->

<!-- EXECUTION-GATE-RECONCILIATION:B601-800:FOGO-AUTH -->
### Reconciliación topológica de FOGO-AUTH-001 a FOGO-AUTH-016

La familia separa inventario/definición de permisos de la protección física posterior.

| Tareas | Modalidad | Gate |
| --- | --- | --- |
| `FOGO-AUTH-001`, `FOGO-AUTH-002`, `FOGO-AUTH-008` | `DEFINE_ONCE` | `NO_PHYSICAL_INSTANCE` |
| `FOGO-AUTH-003..007`, `FOGO-AUTH-009..016` | `PER_IMPLEMENTATION_UNIT` | `POST_E5_PACKAGE` |

### [ ] FOGO-AUTH-001 — Inventariar vistas y acciones productivas
### [ ] FOGO-AUTH-002 — Definir permisos por área productiva
### [ ] FOGO-AUTH-003 — Filtrar cola por sede y área
### [ ] FOGO-AUTH-004 — Restringir Panadería
### [ ] FOGO-AUTH-005 — Restringir Repostería
### [ ] FOGO-AUTH-006 — Restringir Cocina
### [ ] FOGO-AUTH-007 — Restringir Insumos
### [ ] FOGO-AUTH-008 — Definir permisos de supervisor
### [ ] FOGO-AUTH-009 — Proteger inicio de producción
### [ ] FOGO-AUTH-010 — Proteger producción parcial
### [ ] FOGO-AUTH-011 — Proteger finalización
### [ ] FOGO-AUTH-012 — Proteger correcciones y anulaciones
### [ ] FOGO-AUTH-013 — Proteger lotes y recetas
### [ ] FOGO-AUTH-014 — Registrar actor y turno
### [ ] FOGO-AUTH-015 — Migrar a paquetes de vento-shell
### [ ] FOGO-AUTH-016 — Ejecutar pruebas integrales
