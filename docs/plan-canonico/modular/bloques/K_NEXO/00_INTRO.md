## BLOQUE K

**NEXO**

### [ ] NEXO-AUTH-001 — Separar configuración administrativa de operación
### [ ] NEXO-AUTH-002 — Corregir bypass administrativo de remisiones
### [ ] NEXO-AUTH-003 — Corregir inventory.remissions.all_sites
### [ ] NEXO-AUTH-004 — Proteger creación de solicitudes
### [ ] NEXO-AUTH-005 — Proteger edición y cancelación
### [ ] NEXO-AUTH-006 — Proteger preparación
### [ ] NEXO-AUTH-007 — Proteger producción vinculada
### [ ] NEXO-AUTH-008 — Proteger despacho
### [ ] NEXO-AUTH-009 — Proteger tránsito
### [ ] NEXO-AUTH-010 — Proteger recepción
### [ ] NEXO-AUTH-011 — Proteger ajustes de inventario
### [ ] NEXO-AUTH-012 — Proteger conteos
### [ ] NEXO-AUTH-013 — Proteger movimientos
### [ ] NEXO-AUTH-014 — Proteger catálogo y configuraciones
### [ ] NEXO-AUTH-015 — Filtrar por sede y área efectivas
### [ ] NEXO-AUTH-016 — Integrar dispositivo compartido
### [ ] NEXO-AUTH-017 — Integrar simulación estricta
### [ ] NEXO-AUTH-018 — Migrar a paquetes de vento-shell
### [ ] NEXO-AUTH-019 — Eliminar helpers duplicados
### [ ] NEXO-AUTH-020 — Ejecutar pruebas integrales

### Carril histórico suspendido

`NEXO-REMISSIONS-001 — alias histórico suspendido; no reserva ni define un paquete vigente`

Este identificador correspondió a un carril de entrega; ya no reserva ni crea
un futuro `package_id`, no es una tarea nueva ni reemplaza `NEXO-AUTH-*`,
`NEXO-UX-*`, `AUTH-UI-*`, E3, E4, E5, H, J, R, S o T.

El alcance histórico contemplaba:

- solicitar, editar y cancelar;
- preparar cantidades y registrar diferencias;
- despachar separando custodia e inicio de tránsito;
- registrar tránsito y novedades;
- recibir con cantidades y observaciones;
- publicar y conciliar movimientos de inventario sin doble efecto;
- resolver sesión, actor, permiso, sede, área, turno, check-in y dispositivo;
- consumir contratos y módulos compartidos de `vento-shell`;
- proteger cada mutación en servidor;
- conservar idempotencia, auditoría, evidencia, impresión y rollback cuando
  apliquen;
- validar tablet o kiosco y operación con usuarios representativos.

Quedan fuera del cierre, salvo dependencia explícita del paquete:

- LPN y contenedores avanzados;
- activos, reutilizables, mantenimiento e instalaciones;
- cierre completo del dominio de inventario;
- cierre completo de NEXO;
- funcionalidades de otras aplicaciones.

La matriz completa de dependencias, condiciones e invariantes se conserva en
`priority-delivery-lanes.json`.
