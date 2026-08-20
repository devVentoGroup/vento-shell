### R1 — Fundación física canónica

<!-- EXECUTION-GATE-RECONCILIATION:B201-400:R1 -->
#### Reconciliación topológica de R1

Las once tareas de R1 materializan la fundación física canónica compartida de autorización, contexto, identidad y auditoría.

| Propiedad | Valor |
| --- | --- |
| modalidad | `GLOBAL_ENABLE_ONCE` |
| gate temporal | `PRE_E5_FOUNDATION` |
| identidad | `<task_id>::GLOBAL` |
| prerequisito | R0 aplicable verificado |
| autorización | explícita por instancia |

R1 puede materializarse antes de E5 porque crea infraestructura canónica reutilizable por múltiples paquetes y no una migración vertical de un `package_id`.

La materialización inicial no autoriza migrar dominios, ejecutar backfills empresariales, cambiar datos propios de una aplicación ni considerar aprobado un paquete consumidor. Esos cambios permanecen en R2, normalización física, integraciones físicas y sus gates post-E5.

### [ ] AUTH-DB-016 — Crear esquemas empresariales aprobados
### [ ] AUTH-DB-018 — Separar vistas y RPC expuestas de helpers internos
### [ ] AUTH-DB-017 — Configurar esquemas expuestos y privilegios de Data API
### [ ] AUTH-DB-019 — Implementar vínculos canónicos entre Auth e identidades empresariales

### [ ] AUTH-DB-033 — Implementar get_access_context canónico, sus resolvers privados y su proyección segura
### [ ] AUTH-DB-035 — Implementar token transaccional de frescura e invalidación del contexto
### [ ] AUTH-DB-034 — Implementar evaluate_authorization canónico, su núcleo de evaluación, resolvers de recurso y proyecciones seguras
### [ ] AUTH-DB-032 — Implementar persistencia canónica y vinculación de decisiones de autorización

### [ ] AUTH-DB-012 — Implementar auditoría de cambios de permisos
### [ ] AUTH-DB-013 — Implementar auditoría de simulación
### [ ] AUTH-DB-014 — Implementar auditoría de dispositivos

Regla de auditoría

AUTH-DB-012 a AUTH-DB-014 solo podrán ejecutarse después de crear
la capa o esquema transversal de auditoría aprobado en SUPA-ARC-007.

No deberán crear mecanismos de auditoría independientes dentro de cada
aplicación o dominio.
