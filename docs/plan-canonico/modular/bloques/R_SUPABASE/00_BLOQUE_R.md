## BLOQUE R

**Implementación progresiva de arquitectura Supabase, seguridad y transición**

Relación obligatoria:

BLOQUE E3
→ audita el estado real
→ define la arquitectura objetivo
→ aprueba el plan de transición

BLOQUE R
→ implementa exclusivamente decisiones aprobadas
→ utiliza paquetes pequeños y reversibles
→ conserva compatibilidad temporal
→ registra todas las migraciones en `vento-shell`

BLOQUE R no repetirá las auditorías realizadas en BLOQUE E3.

Cada tarea de corrección deberá partir de un hallazgo aprobado,
un objeto identificado y un paquete de transición definido.

### R0 — Preparación, pruebas y contención de riesgos

### [ ] AUTH-DB-015 — Documentar y versionar todas las migraciones en vento-shell
### [ ] AUTH-DB-027 — Crear harness de pruebas de esquema, integridad, RLS, RPC y migraciones
### [ ] AUTH-DB-028 — Establecer baseline y control de drift entre local, staging y producción
### [ ] AUTH-DB-029 — Validar respaldo, restauración y rollback antes del primer paquete

### [ ] AUTH-DB-001 — Corregir tablas sin RLS identificadas en SUPA-AUD
### [ ] AUTH-DB-002 — Endurecer políticas RLS demasiado amplias aprobadas para corrección
### [ ] AUTH-DB-003 — Endurecer funciones SECURITY DEFINER aprobadas
### [ ] AUTH-DB-004 — Reducir grants innecesarios de authenticated
### [ ] AUTH-DB-005 — Revocar grants innecesarios de anon
### [ ] AUTH-DB-006 — Incorporar contexto canónico en RPC sensibles
### [ ] AUTH-DB-007 — Validar sede dentro de RPC sensibles
### [ ] AUTH-DB-008 — Validar área dentro de RPC sensibles
### [ ] AUTH-DB-009 — Validar permiso exacto dentro de RPC sensibles
### [ ] AUTH-DB-010 — Validar principal y actor efectivo dentro de RPC sensibles

Regla de entrada a migraciones

No podrá comenzar ningún paquete estructural mientras no existan:

- baseline de Supabase remoto;
- comparación con migraciones locales;
- entorno de pruebas reproducible;
- pruebas negativas de autorización;
- respaldo verificable;
- restauración probada;
- rollback documentado;
- migración versionada en `vento-shell`.

### R1 — Fundación física canónica

### [ ] AUTH-DB-016 — Crear esquemas empresariales aprobados
### [ ] AUTH-DB-018 — Separar vistas y RPC expuestas de helpers internos
### [ ] AUTH-DB-017 — Configurar esquemas expuestos y privilegios de Data API
### [ ] AUTH-DB-019 — Implementar vínculos canónicos entre Auth e identidades empresariales

### [ ] AUTH-DB-012 — Implementar auditoría de cambios de permisos
### [ ] AUTH-DB-013 — Implementar auditoría de simulación
### [ ] AUTH-DB-014 — Implementar auditoría de dispositivos

Regla de auditoría

AUTH-DB-012 a AUTH-DB-014 solo podrán ejecutarse después de crear
la capa o esquema transversal de auditoría aprobado en SUPA-ARC-007.

No deberán crear mecanismos de auditoría independientes dentro de cada
aplicación o dominio.

### R2 — Migración progresiva por dominio

### [ ] AUTH-DB-020 — Migrar objetos por dominio con compatibilidad temporal
### [ ] AUTH-DB-011 — Aplicar constraints después de backfills y reconciliación
### [ ] AUTH-DB-021 — Implementar políticas RLS y grants canónicos por esquema
### [ ] AUTH-DB-022 — Implementar gobierno y políticas de Storage
### [ ] AUTH-DB-023 — Implementar canales y contratos Realtime aprobados
### [ ] AUTH-DB-024 — Versionar Edge Functions, webhooks, cron y automatizaciones
### [ ] AUTH-DB-025 — Implementar índices, retención y controles de crecimiento
### [ ] AUTH-DB-026 — Generar y publicar tipos después de cada paquete aprobado

### IMPLEMENTACIÓN FÍSICA DE NORMALIZACIÓN

### [ ] DATA-NORM-DB-001 — Implementar almacenamiento de versiones de reglas y diccionarios
### [ ] DATA-NORM-DB-002 — Implementar funciones SQL deterministas cuando sean necesarias
### [ ] DATA-NORM-DB-003 — Implementar columnas o expresiones normalizadas de búsqueda
### [ ] DATA-NORM-DB-004 — Ejecutar dry-runs y reportes de colisiones
### [ ] DATA-NORM-DB-005 — Ejecutar backfills aprobados por dominio
### [ ] DATA-NORM-DB-006 — Implementar constraints después de reconciliar datos
### [ ] DATA-NORM-DB-007 — Implementar índices de búsqueda y unicidad normalizada
### [ ] DATA-NORM-DB-008 — Implementar triggers únicamente como barrera defensiva final
### [ ] DATA-NORM-DB-009 — Registrar valor previo, valor resultante y versión de regla
### [ ] DATA-NORM-DB-010 — Probar idempotencia, rollback y ausencia de cambios semánticos

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

### R3 — Retiro y certificación final

### [ ] AUTH-DB-030 — Retirar objetos legacy únicamente después de adopción comprobada
### [ ] AUTH-DB-031 — Certificar paridad entre documento, vento-shell, Supabase y aplicaciones

Regla de cierre

AUTH-DB-030 y AUTH-DB-031 no se ejecutarán completamente durante
la fundación inicial.

Se ejecutarán en la FASE 12 después de comprobar:

- adaptación de todos los consumidores;
- finalización de los pilotos aplicables;
- ausencia de lecturas legacy;
- ausencia de escrituras legacy;
- reconciliación de datos;
- pruebas de seguridad;
- pruebas de restauración;
- rollback todavía disponible;
- paridad local, staging y producción.

Ningún objeto legacy se retirará únicamente porque exista su reemplazo.

