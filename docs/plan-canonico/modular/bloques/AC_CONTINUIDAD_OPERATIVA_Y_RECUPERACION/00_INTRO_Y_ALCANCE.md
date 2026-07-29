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

### Organización documental del bloque

<!-- PLAN-SECTION-META:START -->
El bloque se divide en mini-bloques funcionales. Cada archivo conserva juntas las tareas que comparten propósito y resultado, evitando tanto el archivo monolítico como la fragmentación de una tarea por archivo.

| Orden | Mini-bloque | Cobertura | Tareas |
|---:|---|---|---:|
| 1 | DOMINIO DE CONTINUIDAD Y RECUPERACION | `CONT-DOM-001`–`CONT-DOM-015` | 15 |
| 2 | AUTORIZACIÓN DE EMERGENCIA Y RECUPERACION | `CONT-AUTH-001`–`CONT-AUTH-004` | 4 |
| 3 | EXPERIENCIA DE CONTINGENCIA Y MANDO | `CONT-UX-001`–`CONT-UX-007` | 7 |
| 4 | INTEGRACIONES DE CONTINUIDAD Y REINCORPORACION | `CONT-INT-001`–`CONT-INT-004` | 4 |
<!-- PLAN-SECTION-META:END -->
