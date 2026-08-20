### MINI-BLOQUE — AUTORIZACIÓN DE VENTA Y CAJA

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **autorización de venta y caja** dentro de **N PULSO**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `PULSO-AUTH-001` a `PULSO-AUTH-016` — 16 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Límites funcionales:** comienza con “Inventariar vistas POS” y concluye con “Ejecutar pruebas integrales”.
<!-- PLAN-SECTION-META:END -->

<!-- EXECUTION-GATE-RECONCILIATION:B601-800:PULSO-AUTH -->
### Reconciliación topológica de PULSO-AUTH-001 a PULSO-AUTH-016

`PULSO-AUTH-001..008` inventarían superficies y definen permisos; `PULSO-AUTH-009..016` materializan protección, contexto, dispositivo, trazabilidad, migración y pruebas.

| Tareas | Modalidad | Gate |
| --- | --- | --- |
| `PULSO-AUTH-001..008` | `DEFINE_ONCE` | `NO_PHYSICAL_INSTANCE` |
| `PULSO-AUTH-009..016` | `PER_IMPLEMENTATION_UNIT` | `POST_E5_PACKAGE` |

### [ ] PULSO-AUTH-001 — Inventariar vistas POS
### [ ] PULSO-AUTH-002 — Inventariar órdenes
### [ ] PULSO-AUTH-003 — Inventariar salón
### [ ] PULSO-AUTH-004 — Inventariar escáner
### [ ] PULSO-AUTH-005 — Inventariar importaciones
### [ ] PULSO-AUTH-006 — Definir permisos de cajero
### [ ] PULSO-AUTH-007 — Definir permisos de supervisor
### [ ] PULSO-AUTH-008 — Definir permisos de cierre y anulación
### [ ] PULSO-AUTH-009 — Proteger acumulación de puntos
### [ ] PULSO-AUTH-010 — Proteger redenciones
### [ ] PULSO-AUTH-011 — Limitar operación a sede del turno
### [ ] PULSO-AUTH-012 — Integrar dispositivos POS compartidos
### [ ] PULSO-AUTH-013 — Registrar trabajador que ejecuta la operación
### [ ] PULSO-AUTH-014 — Mantener configuración administrativa separada
### [ ] PULSO-AUTH-015 — Migrar a paquetes de vento-shell
### [ ] PULSO-AUTH-016 — Ejecutar pruebas integrales
