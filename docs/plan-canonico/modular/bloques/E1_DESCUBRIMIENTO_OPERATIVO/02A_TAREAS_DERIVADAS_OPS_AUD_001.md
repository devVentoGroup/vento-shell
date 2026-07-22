### TAREAS E1 DERIVADAS DE OPS-AUD-001

Estas tareas materializan brechas AS-IS detectadas por `OPS-AUD-001`.
No diseñan todavía procesos TO-BE, pantallas, estructuras definitivas de datos
ni implementaciones físicas.

La ejecución formal de este conjunto ocurre después de `OPS-AUD-015` y antes
de `CAP-MAP-001`. La recolección de evidencia de `OPS-PLAN-002`,
`OPS-PLAN-003` y `OPS-PLAN-004` puede comenzar antes, sin alterar la tarea
actual ni permitir aprobaciones fuera de secuencia.

### [ ] OPS-ADM-001 — Documentar brecha registral y plan de regularización de la sede administrativa

**Dependencias:** `OPS-AUD-015`.  
**Propósito:** reconciliar la ubicación administrativa real, la dirección registral vigente, la identificación de Oficina 1 y la relación física con Vento Café.  
**Salida obligatoria:** evidencia, estado actual, responsables, documentos afectados, decisiones requeridas y tarea de ejecución externa cuando corresponda.  
**Límite:** esta tarea no modifica registros legales ni reemplaza asesoría contable o jurídica.

### [ ] OPS-GOV-001 — Documentar gobernanza AS-IS del ecosistema de marcas y titulares

**Dependencias:** `OPS-AUD-015`.  
**Propósito:** documentar la relación operativa, administrativa, económica y de recursos entre Vento Group, Vento Café, Saudo, Molka, Vaila Vainilla y catering.  
**Salida obligatoria:** fronteras actuales, servicios compartidos, uso de personal y activos, facturación observada, costos compartidos, riesgos y decisiones pendientes.  
**Límite:** el modelo financiero y contable objetivo se diseña posteriormente en NUMERA y las integraciones correspondientes.

### [ ] OPS-ACT-001 — Inventariar activos y puntos externos de custodia

**Dependencias:** `OPS-AUD-015`.  
**Propósito:** completar el inventario AS-IS de decoraciones, vehículo, materiales residuales, mobiliario, elementos pendientes de instalar y demás activos ubicados fuera de sedes formales.  
**Salida obligatoria:** activo o familia, propietario, custodio, ubicación, condición, uso, riesgo, evidencia y destino documental.  
**Continuidad:** alimenta `NEXO-DOM-008`, `NEXO-DOM-010`, `NEXO-DOM-011`, `NEXO-DOM-017` y `NEXO-DOM-027`.

### [ ] OPS-PLAN-001 — Definir el programa de auditoría de demanda y requisitos de planificación productiva

**Dependencias:** `OPS-AUD-015`.  
**Propósito:** establecer preguntas, periodos, granularidad, fuentes, responsables, calidad mínima, criterios de conciliación y límites de la auditoría de demanda.  
**Salida obligatoria:** protocolo de análisis AS-IS para ventas, pedidos, remisiones, faltantes, sobrantes, mermas, inventarios finales, productos previsibles y productos bajo pedido.  
**Límite:** no aprueba todavía el algoritmo, los mínimos, la producción base ni el proceso TO-BE.

### [ ] OPS-PLAN-002 — Consolidar fuentes internas para la auditoría de demanda

**Sustituye la referencia narrativa:** `OPS-PLAN-001-A`.  
**Dependencias:** `OPS-PLAN-001`.  
**Responsable inicial de evidencia:** contabilidad.  
**Salida obligatoria:** inventario de fuentes de Makos, inventarios, compras, recepciones, remisiones, periodos disponibles, periodos faltantes, formato, acceso, propietario y calidad conocida.

### [ ] OPS-PLAN-003 — Levantar demanda, faltantes y variaciones por canal

**Sustituye la referencia narrativa:** `OPS-PLAN-001-B`.  
**Dependencias:** `OPS-PLAN-001`.  
**Responsable inicial de evidencia:** responsable de pedidos.  
**Salida obligatoria:** fuentes de Rappi y ManyChat, entrevistas, productos faltantes, sobrantes, variaciones recurrentes, estacionalidad conocida y limitaciones de recuperación.

### [ ] OPS-PLAN-004 — Iniciar registro prospectivo de solicitud, entrega y diferencia

**Sustituye la referencia narrativa:** `OPS-PLAN-001-C`.  
**Dependencias:** `OPS-PLAN-001`.  
**Responsables iniciales de evidencia:** contabilidad y responsable de pedidos.  
**Registro mínimo:** fecha, sede solicitante, canal cuando aplique, producto, presentación, cantidad solicitada, cantidad recibida, faltante, sobrante reportado, ajuste y observación.  
**Límite:** el registro prospectivo no se convierte por sí solo en fuente de verdad ni autoriza automatización.
