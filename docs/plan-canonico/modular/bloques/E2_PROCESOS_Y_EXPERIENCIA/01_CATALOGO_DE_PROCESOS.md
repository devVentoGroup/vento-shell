CATÁLOGO DE PROCESOS

### [ ] PROC-CAT-001 — Consolidar el catálogo AS-IS de procesos levantado y aprobado en E1
### [ ] PROC-CAT-002 — Diseñar el proceso TO-BE para capacidades manuales, parciales, rotas o ausentes
### [ ] PROC-CAT-003 — Crear identificador estable para cada proceso
### [ ] PROC-CAT-004 — Definir propósito empresarial de cada proceso
### [ ] PROC-CAT-005 — Definir aplicación propietaria de cada proceso
### [ ] PROC-CAT-006 — Definir aplicaciones consumidoras de cada proceso
### [ ] PROC-CAT-007 — Definir actor que inicia cada proceso
### [ ] PROC-CAT-008 — Definir actores que continúan cada proceso
### [ ] PROC-CAT-009 — Definir estado inicial de cada proceso
### [ ] PROC-CAT-010 — Definir estados intermedios
### [ ] PROC-CAT-011 — Definir estado final
### [ ] PROC-CAT-012 — Definir transiciones permitidas
### [ ] PROC-CAT-013 — Definir acciones excepcionales
### [ ] PROC-CAT-014 — Definir cancelación, reversión y corrección
### [ ] PROC-CAT-015 — Definir información de entrada
### [ ] PROC-CAT-016 — Definir información producida
### [ ] PROC-CAT-017 — Definir eventos empresariales emitidos
### [ ] PROC-CAT-018 — Definir auditoría necesaria
### [ ] PROC-CAT-019 — Definir métricas de operación
### [ ] PROC-CAT-020 — Identificar procesos duplicados entre aplicaciones

---

## Consolidación candidata — PROC-CAT-001

**Estado:** `LISTA_PARA_VALIDAR`
**Fuente aprobada:** `E1_DESCUBRIMIENTO_OPERATIVO/02_AUDITORIA_DE_OPERACION_REAL.md`, inventario maestro de procesos ordinarios.
**Alcance:** consolidar el AS-IS; no define todavía proceso TO-BE, aplicaciones propietarias, estados, transiciones, datos, eventos, auditoría ni implementación.

### Catálogo AS-IS consolidado

| Grupo | Procesos consolidados | Fuente y tratamiento |
| --- | --- | --- |
| Abastecimiento, producción y logística | `PROC-001` Solicitud de remisión interna; `PROC-002` Consolidación productiva; `PROC-003` Preparación matutina de remisión; `PROC-004` a `PROC-009` Producción; `PROC-010` Alistamiento y despacho; `PROC-011` Transporte y entrega; `PROC-012` Retorno y lavado; `PROC-013` Recepción de proveedor; `PROC-014` Retiro de insumos; `PROC-015` Compra; `PROC-016` Recepción de fruver | Inventario ordinario aprobado en E1. Papel, Excel, WhatsApp, conocimiento operativo y herramientas parciales se conservan como evidencia AS-IS, no como arquitectura objetivo. |
| Venta, servicio y dinero | `PROC-017` Apertura de Vento Café; `PROC-018` Atención de mesa; `PROC-019` Cocina; `PROC-020` Bar y Barra; `PROC-021` Pago; `PROC-022` Pedido Rappi; `PROC-023` Pedido directo o domicilio; `PROC-024` Atención en Saudo; `PROC-025` Preparación en Saudo; `PROC-026` Atención en Molka; `PROC-027` Cierre y relevo de Caja; `PROC-028` Entrega de efectivo; `PROC-029` Registro contable de soporte | Makos, Rappi, ManyChat, papel y canales externos permanecen clasificados como soportes o canales actuales. Su permanencia futura no se infiere de este catálogo. |
| Personas y acceso | `PROC-030` Programación de turnos; `PROC-031` Consulta y check-in; `PROC-032` Revisión de asistencia; `PROC-033` Liquidación de propinas; `PROC-034` Pago de nómina; `PROC-035` Reclutamiento y contratación; `PROC-036` Inducción; `PROC-037` Alta de acceso; `PROC-038` Baja de acceso | VISO, ANIMA y Bancolombia Nóminas son evidencia de operación actual; identidad, autorización y transiciones se mantienen para tareas posteriores. |
| Comercial, soporte y continuidad | `PROC-039` Solicitud y publicación de Marketing; `PROC-040` Venta y despacho de Vaila Vainilla; `PROC-041` Soporte tecnológico; `PROC-042` Mantenimiento correctivo; `PROC-043` Disposición de merma; `PROC-044` Reasignación de producto a Molka; `PROC-045` Servicios Generales | Los procesos no se reinterpretan como pantallas, tablas o aplicaciones. Las dependencias y excepciones siguen en las fuentes de E1 hasta su tratamiento por tareas posteriores. |

### Conciliación de alcance

| Control | Resultado |
| --- | ---: |
| Procesos AS-IS consolidados | 45 |
| Brechas vinculadas a uno o más procesos AS-IS | 436 |
| Brechas cubiertas por proceso provisional de subcapacidad | 378 |
| Procesos AS-IS con relaciones directas a brechas | 39 de 45 |
| Familias de capacidad representadas | 18 de 18 |

La ausencia de vínculo AS-IS directo no elimina un proceso ni crea uno nuevo: conserva la cobertura provisional por subcapacidad aprobada en E1. Esta tarea tampoco reclasifica brechas, propietarios, fechas, paquetes o evidencia de cierre.

### Criterios para validación

- [x] el catálogo contiene exactamente los 45 procesos ordinarios inventariados en E1;
- [x] cada grupo conserva su referencia de evidencia AS-IS;
- [x] se distingue evidencia actual de arquitectura objetivo;
- [x] se preserva la cobertura de 814 brechas sin inventar vínculos nuevos;
- [ ] `OWN-GG` aprueba la consolidación para habilitar `PROC-CAT-002`.

