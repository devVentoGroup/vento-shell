## BLOQUE U

**Pruebas integrales**

### Regla de entrada

El BLOQUE U no es el momento inicial para escribir todas las pruebas.

Antes de entrar a U deberán existir:

- pruebas unitarias implementadas con cada paquete;
- pruebas contractuales implementadas con cada paquete;
- pruebas de integración de datos y servicios;
- pruebas negativas de autorización;
- pruebas de migraciones;
- pruebas de idempotencia y concurrencia aplicables;
- evidencia de ejecución por repositorio;
- Registro Canónico de Requisitos de Prueba actualizado.

El BLOQUE U ejecutará:

- regresión automatizada transversal;
- pruebas E2E entre aplicaciones;
- pruebas de seguridad;
- pruebas funcionales;
- pruebas operativas;
- pruebas de experiencia;
- pilotos con usuarios reales;
- validación final de requisitos `TREQ-*`.

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

PRUEBAS FUNCIONALES Y DE EXPERIENCIA

### [ ] UX-QA-001 — El trabajador identifica su siguiente tarea
### [ ] UX-QA-002 — La acción principal se encuentra sin capacitación
### [ ] UX-QA-003 — El trabajador comprende el estado del proceso
### [ ] UX-QA-004 — Los errores indican cómo continuar
### [ ] UX-QA-005 — Un rol no ve opciones irrelevantes
### [ ] UX-QA-006 — Las pantallas táctiles funcionan en tablet
### [ ] UX-QA-007 — Las vistas administrativas no contaminan la operación
### [ ] UX-QA-008 — El proceso continúa correctamente entre aplicaciones
### [ ] UX-QA-009 — No se registra dos veces la misma información
### [ ] UX-QA-010 — Los cambios conservan trazabilidad
### [ ] UX-QA-011 — Las tareas críticas soportan conectividad inestable
### [ ] UX-QA-012 — El retorno entre aplicaciones conserva contexto
### [ ] UX-QA-013 — El retorno conserva el proceso cuando corresponde
### [ ] UX-QA-014 — El trabajador completa la tarea dentro del tiempo objetivo
### [ ] UX-QA-015 — Los bloqueos se entienden sin códigos técnicos
### [ ] UX-QA-016 — La información sensible se oculta correctamente
### [ ] UX-QA-017 — La aplicación propietaria conserva la fuente de verdad
### [ ] UX-QA-018 — Los eventos idempotentes no duplican efectos
### [ ] UX-QA-019 — Los fallos parciales permiten recuperación
### [ ] UX-QA-020 — Cada aplicación supera piloto con usuarios reales

PRUEBAS POR APLICACIÓN

### [ ] UX-QA-021 — Probar SHELL por tipo de actor
### [ ] UX-QA-022 — Probar ANIMA con trabajadores y administradores
### [ ] UX-QA-023 — Probar VISO por rol administrativo
### [ ] UX-QA-024 — Probar NEXO por rol operativo
### [ ] UX-QA-025 — Probar FOGO por área productiva
### [ ] UX-QA-026 — Probar ORIGO por etapa de compra
### [ ] UX-QA-027 — Probar PULSO por punto operativo
### [ ] UX-QA-028 — Probar NUMERA por alcance financiero
### [ ] UX-QA-029 — Probar PASS como cliente
### [ ] UX-QA-030 — Probar AURA únicamente después de aprobar su continuidad

