### INFRAESTRUCTURA DE INTEGRACIONES EXTERNAS

### [ ] INT-DB-001 — Crear registro de sistemas e integraciones externas
### [ ] INT-DB-002 — Crear referencias de credenciales sin almacenar secretos en tablas expuestas
### [ ] INT-DB-003 — Crear staging inmutable de payloads externos
### [ ] INT-DB-004 — Crear mapeos de identificadores externos y canónicos
### [ ] INT-DB-005 — Crear restricciones e índices de idempotencia
### [ ] INT-DB-006 — Crear cuarentena y registro de errores no procesables
### [ ] INT-DB-007 — Crear auditoría de procesamiento, reintentos y compensaciones
### [ ] INT-DB-008 — Crear mecanismos de conciliación por integración

Orden obligatorio de cada paquete de dominio

1. Confirmar objeto, dominio, propietario y consumidores.
2. Crear estructura objetivo.
3. Crear compatibilidad temporal.
4. Ejecutar dry-run de normalización cuando corresponda.
5. Identificar colisiones y posibles duplicados.
6. Aprobar tratamiento de colisiones.
7. Ejecutar backfill.
8. Reconciliar datos.
9. Adaptar escrituras.
10. Adaptar lecturas.
11. Aplicar normalización en límites del dominio.
12. Aplicar constraints.
13. Aplicar RLS y grants.
14. Generar tipos.
15. Actualizar contratos y wrappers.
16. Adaptar consumidores.
17. Ejecutar pruebas.
18. Verificar drift.
19. Verificar rendimiento.
20. Confirmar rollback.
21. Aprobar adopción del paquete.

AUTH-DB-011 no podrá ejecutarse antes del backfill y la reconciliación
del paquete correspondiente.

AUTH-DB-026 no será una acción única al final del proyecto.

Los tipos deberán regenerarse después de cada cambio contractual de:

- esquemas;
- tablas;
- vistas;
- funciones;
- RPC;
- enums;
- contratos expuestos.
