## BLOQUE AC

**Continuidad operativa, contingencia, incidentes, respaldo y recuperación**

Este bloque define el gobierno transversal mediante el cual Vento Group
mantiene una operación mínima, responde a interrupciones, recupera sus
servicios y reincorpora de forma controlada el trabajo realizado durante
una contingencia.

No sustituye los procesos propietarios de las aplicaciones ni convierte
continuidad en una responsabilidad exclusiva del área técnica.

Propiedad funcional:

```text
APLICACIONES Y DOMINIOS
→ conservan sus procesos y fuentes de verdad
→ definen sus procedimientos alternativos
→ validan que el resultado empresarial se haya recuperado
→ reincorporan y concilian sus hechos

BLOQUE Z
→ recupera dispositivos, redes, aplicaciones,
  infraestructura, impresión y respaldos técnicos

E4
→ gobierna colas, reintentos, idempotencia,
  notificaciones y contratos transversales

E5
→ gobierna contingencia temporal durante
  cutover, piloto e hypercare

BLOQUE AC
→ gobierna continuidad empresarial permanente
→ análisis de impacto y criticidad
→ operación mínima y contingencia
→ mando y comunicación
→ recuperación coordinada
→ reincorporación y conciliación
→ ejercicios y mejora

Un servicio técnicamente disponible no se considerará recuperado hasta que
el proceso empresarial haya sido validado y sus datos, pendientes y efectos
hayan sido conciliados.

La existencia de estas tareas no autoriza activaciones de contingencia,
accesos de emergencia, restauraciones, failover, cambios de proveedores,
alteraciones de respaldos ni procedimientos manuales en producción.
```

DOMINIO

### [ ] CONT-DOM-001 — Definir política, alcance, gobierno, roles y ciclo de mantenimiento de continuidad
### [ ] CONT-DOM-002 — Definir análisis de impacto empresarial, servicios críticos, procesos, sedes y niveles mínimos
### [ ] CONT-DOM-003 — Definir mapa de dependencias, recursos críticos, single points of failure y sustitutos
### [ ] CONT-DOM-004 — Definir MTPD, RTO, RPO, MBCO, prioridades y criterios de aceptación de riesgo
### [ ] CONT-DOM-005 — Definir taxonomía, severidad, declaración, activación, escalamiento, desactivación y cierre de incidentes de continuidad
### [ ] CONT-DOM-006 — Definir mando, sustitución, bitácora de decisiones, comunicación de crisis y coordinación externa
### [ ] CONT-DOM-007 — Definir operación mínima viable por proceso, sede, horario, temporada y duración
### [ ] CONT-DOM-008 — Definir estrategias de contingencia, alternativas manuales, offline, físicas y de proveedor
### [ ] CONT-DOM-009 — Definir registro, folios, evidencia, custodia y trabajo ejecutado durante la falla
### [ ] CONT-DOM-010 — Definir reincorporación, idempotencia, conflictos, conciliación y confirmación de pendientes
### [ ] CONT-DOM-011 — Definir inventario, política, frecuencia, retención, seguridad y cobertura de respaldos
### [ ] CONT-DOM-012 — Definir runbooks, orden de recuperación, restauración, failover, retorno y validación funcional
### [ ] CONT-DOM-013 — Definir continuidad de proveedores, energía, red, pagos, transporte, canales y recursos alternativos
### [ ] CONT-DOM-014 — Definir programa de walkthroughs, tabletops, simulaciones, restauraciones y ejercicios operativos
### [ ] CONT-DOM-015 — Definir revisión posterior, lecciones, acciones, eficacia y actualización periódica del plan

AUTORIZACIÓN

### [ ] CONT-AUTH-001 — Proteger declaración, activación, mando, decisiones excepcionales, comunicación y desactivación
### [ ] CONT-AUTH-002 — Proteger acceso de emergencia, credenciales de recuperación, break-glass, failover y revocación
### [ ] CONT-AUTH-003 — Proteger respaldos, runbooks, contactos, evidencia, formularios y datos de contingencia
### [ ] CONT-AUTH-004 — Separar ejecución, validación, reincorporación, conciliación, cierre y revisión posterior

EXPERIENCIA Y PANTALLAS

### [ ] CONT-UX-001 — Diseñar inicio ejecutivo de continuidad con estado, impacto, prioridades, responsables y decisiones
### [ ] CONT-UX-002 — Diseñar centro de mando del incidente con línea de tiempo, servicios afectados y recuperación
### [ ] CONT-UX-003 — Diseñar runbooks y checklists simples por rol, proceso, sede y modalidad
### [ ] CONT-UX-004 — Diseñar captura controlada durante la falla y reincorporación posterior
### [ ] CONT-UX-005 — Diseñar seguimiento de respaldos, restauración, failover, validación y pendientes
### [ ] CONT-UX-006 — Diseñar comunicaciones internas y externas con plantillas, canales, confirmación y escalamiento
### [ ] CONT-UX-007 — Diseñar ejercicios, revisión posterior, acciones y comprobación de readiness

INTEGRACIONES

### [ ] CONT-INT-001 — Definir contratos de criticidad, dependencia, salud, estado degradado e incidente con todas las aplicaciones
### [ ] CONT-INT-002 — Definir contratos con SHELL, VISO, ANIMA, BLOQUE Z, AA, AB, E4, E5, T, U y X
### [ ] CONT-INT-003 — Definir contratos con Supabase, nube, energía, ISP, pagos, mensajería, transporte y proveedores críticos
### [ ] CONT-INT-004 — Definir contratos de captura, replay, idempotencia, reincorporación, conciliación y retorno al servicio normal
