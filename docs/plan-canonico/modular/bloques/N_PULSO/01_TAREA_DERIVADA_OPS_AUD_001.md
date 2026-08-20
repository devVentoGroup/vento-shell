### TAREA POS DERIVADA DE OPS-AUD-001

<!-- EXECUTION-GATE-RECONCILIATION:B601-800:OPS-POS-001 -->
### Reconciliación topológica de OPS-POS-001

La tarea define zonas, mesas, puntos de servicio y reglas por sede como contrato de diseño operativo. No materializa por sí misma configuración física o código del POS.

| modalidad | `DEFINE_ONCE` |
| gate temporal | `NO_PHYSICAL_INSTANCE` |

### [ ] OPS-POS-001 — Definir zonas físicas, mesas y puntos de servicio del POS por sede

**Dependencias:** cierre de E2 y `PULSO-UX-001`.  
**Propósito:** definir para Vento Café, Saudo y Molka las zonas visibles, numeración y agrupación de mesas, puntos de caja, mostrador, entrega de domicilios y Rappi, estaciones y reglas de configuración por sede.  
**Continuidad:** alimenta `PULSO-UX-002` a `PULSO-UX-006`, `PULSO-UX-015`, dispositivos compartidos y contratos de pantallas.  
**Límite:** la zona física no se convierte automáticamente en área de autorización; la relación deberá validarse contra el contexto canónico.
