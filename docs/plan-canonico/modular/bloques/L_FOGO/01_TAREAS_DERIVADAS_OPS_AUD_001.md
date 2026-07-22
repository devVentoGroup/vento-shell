### TAREAS PRODUCTIVAS DERIVADAS DE OPS-AUD-001

Estas tareas concretan necesidades productivas detectadas en E1. Sus salidas se
integran con las tareas FOGO existentes; no las sustituyen ni autorizan
implementación anticipada.

### [ ] OPS-REC-001 — Definir el contrato canónico de recetas y acceso contextual

**Dependencias:** cierre de E2 y línea base de capacidades productivas.  
**Propósito:** definir identidad, versión, vigencia, rendimiento, ingredientes, unidades, pasos, alérgenos, conservación, sensibilidad y acceso por sede, área, estación, rol y tipo de preparación.  
**Continuidad:** alimenta `FOGO-UX-008`, `FOGO-UX-009`, `FOGO-AUTH-013`, NEXO, NUMERA y E3.  
**Límite:** FOGO administra la receta y su ejecución; la autorización y la fuente de verdad física se aprueban en sus bloques propietarios.

### [ ] OPS-PRD-001 — Diseñar el Centro de Pesaje, Premezclas y Porcionamiento

**Dependencias:** `OPS-PLAN-001`, `OPS-REC-001` y diseño productivo de FOGO.  
**Propósito:** definir ubicación, actor, equipos, capacidad, kits, reservas, inventario, urgencias, alérgenos, contaminación cruzada, almacenamiento, devoluciones y protección de fórmulas.  
**Continuidad:** NEXO conserva existencias y movimientos; FOGO conserva planificación y ejecución; NUMERA consume costos; E5 define piloto e implementación.  
**Límite:** permanece como capacidad futura hasta validar demanda, recetas, espacio, personal y viabilidad.

### [ ] OPS-TRZ-001 — Definir el contrato empresarial de lotes, etiquetas y trazabilidad productiva

**Dependencias:** `OPS-REC-001`, `OPS-PRD-001` y diseño de lotes de FOGO.  
**Propósito:** definir identidad de lote, producto, receta y versión, fechas, vencimiento, área, actor, cantidad, conservación, relación con insumos y producto terminado, corrección y reetiquetado.  
**Continuidad:** FOGO origina el lote productivo; NEXO conserva existencias, ubicaciones y trazabilidad logística; BLOQUE E4 define plantillas, colas, enrutamiento, reimpresión y contingencia de impresión.  
**Límite:** esta tarea no duplica `PRINT-ARC-001` a `PRINT-ARC-020`.
