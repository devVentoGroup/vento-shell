### MINI-BLOQUE — PRUEBAS INTEGRALES DE AUTORIZACIÓN

<!-- PLAN-SECTION-META:START -->
**Cobertura canónica:** `AUTH-QA-001` a `AUTH-QA-030` — 30 tareas.
<!-- PLAN-SECTION-META:END -->

<!-- EXECUTION-GATE-RECONCILIATION:B801-974:AUTH-QA -->
### Reconciliación topológica de AUTH-QA-001 a AUTH-QA-030

Cada paquete ejecuta el subconjunto integral aplicable y, después de todos los paquetes, se conserva una certificación global sin duplicar implementaciones.

| modalidad | `PER_PACKAGE_AND_GLOBAL_FINAL` |
| gate temporal | `POST_E5_PACKAGE` |

### [ ] AUTH-QA-001 — Propietario sin check-in entra a administración
### [ ] AUTH-QA-002 — Gerente general sin check-in entra a administración
### [ ] AUTH-QA-003 — Gerente de sede solo opera sus sedes
### [ ] AUTH-QA-004 — Trabajador sin turno queda bloqueado
### [ ] AUTH-QA-005 — Trabajador con turno sin check-in queda bloqueado
### [ ] AUTH-QA-006 — Trabajador con turno y check-in obtiene su rol operativo
### [ ] AUTH-QA-007 — Trabajador solo ve su sede
### [ ] AUTH-QA-008 — Trabajador solo ve su área
### [ ] AUTH-QA-009 — Trabajador rotado cambia de permisos por turno
### [ ] AUTH-QA-010 — Bodeguero puede preparar pero no producir
### [ ] AUTH-QA-011 — Producción puede producir pero no ajustar inventario global
### [ ] AUTH-QA-012 — Cajero puede operar PULSO pero no configurar
### [ ] AUTH-QA-013 — Conductor puede transitar sin área productiva
### [ ] AUTH-QA-014 — Conductor no puede preparar ni recibir inventario general
### [ ] AUTH-QA-015 — Compras puede crear órdenes según alcance
### [ ] AUTH-QA-016 — Recepción puede recibir pero no aprobar compras
### [ ] AUTH-QA-017 — Dispositivo compartido limita al administrador autenticado
### [ ] AUTH-QA-018 — PIN identifica al trabajador real
### [ ] AUTH-QA-019 — Rol simulado no hereda permisos reales
### [ ] AUTH-QA-020 — Acceso directo por URL queda bloqueado
### [ ] AUTH-QA-021 — Formulario manipulado queda bloqueado en servidor
### [ ] AUTH-QA-022 — RPC manipulada queda bloqueada
### [ ] AUTH-QA-023 — Cruce de sede queda bloqueado
### [ ] AUTH-QA-024 — Cruce de área queda bloqueado
### [ ] AUTH-QA-025 — Check-out retira permisos operativos
### [ ] AUTH-QA-026 — Cola offline de ANIMA se revalida
### [ ] AUTH-QA-027 — Actualización de paquete no rompe otros repositorios
### [ ] AUTH-QA-028 — Rollback funciona por aplicación
### [ ] AUTH-QA-029 — Auditoría conserva actor, turno, sede y área
### [ ] AUTH-QA-030 — Ejecutar prueba de regresión completa

### Subconjunto VISO mensual

`003`, `017`, `019`, `020`, `021`, `023`, `024`, `027`, `028`, `029` y `030` son obligatorias para el package.
