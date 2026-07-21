## BLOQUE E1

**Descubrimiento integral de operación, capacidades y cobertura de implementación**

Este bloque convierte la operación real de Vento Group en una entrada
obligatoria del roadmap antes de diseñar procesos, pantallas, datos o
implementaciones definitivas.

Depende de:

BLOQUE D
→ catálogo, matrices y contratos de autorización base conocidos

BLOQUE E
→ contexto efectivo y decisión unificada de autorización

Produce entradas obligatorias para:

BLOQUE E2
→ procesos, actores, pantallas y experiencia objetivo

BLOQUE E3
→ dominios, fuentes de verdad y arquitectura de Supabase

BLOQUE E4
→ servicios operativos transversales

BLOQUES POR APLICACIÓN
→ alcance funcional, técnico y de experiencia realmente faltante

Durante este bloque no se implementan pantallas, migraciones ni cambios
físicos en Supabase.

### Principio obligatorio

El roadmap no se derivará únicamente del código existente.

```text
OPERACIÓN REAL
+
PROCESOS MANUALES
+
DOCUMENTOS Y HERRAMIENTAS EXTERNAS
+
CÓDIGO ACTUAL
+
DATOS ACTUALES
+
PANTALLAS ACTUALES
+
INFRAESTRUCTURA PARCIAL
+
CAPACIDADES TODAVÍA AUSENTES
        ↓
MAPA DE CAPACIDADES DE VENTO GROUP
        ↓
MATRIZ DE COBERTURA FUNCIONAL Y TÉCNICA
        ↓
ROADMAP OBJETIVO
```

### AUDITORÍA DE OPERACIÓN REAL

### [ ] OPS-AUD-001 — Inventariar todas las empresas, sedes, áreas, canales y puntos operativos
### [ ] OPS-AUD-002 — Identificar familias de actores y responsables reales por proceso
### [ ] OPS-AUD-003 — Observar el trabajo real de cada área en operación ordinaria
### [ ] OPS-AUD-004 — Inventariar procesos ejecutados en papel
### [ ] OPS-AUD-005 — Inventariar procesos ejecutados por WhatsApp, correo, Excel u otras herramientas
### [ ] OPS-AUD-006 — Inventariar formularios, remisiones, órdenes, etiquetas, comprobantes y reportes
### [ ] OPS-AUD-007 — Documentar flujo ordinario de cada proceso
### [ ] OPS-AUD-008 — Documentar excepciones, correcciones, anulaciones, devoluciones y reversión
### [ ] OPS-AUD-009 — Documentar aprobaciones, segregación de funciones y controles manuales
### [ ] OPS-AUD-010 — Medir frecuencia, volumen, criticidad, tiempos y estacionalidad
### [ ] OPS-AUD-011 — Identificar dependencias entre áreas, sedes, aplicaciones y terceros
### [ ] OPS-AUD-012 — Identificar puntos de doble digitación y conciliación manual
### [ ] OPS-AUD-013 — Identificar pérdidas de trazabilidad, información y responsabilidad
### [ ] OPS-AUD-014 — Identificar contingencias por caída de red, energía, dispositivo o proveedor
### [ ] OPS-AUD-015 — Validar hallazgos con trabajadores, supervisores y responsables del proceso

### MAPA CANÓNICO DE CAPACIDADES EMPRESARIALES

### [ ] CAP-MAP-001 — Crear taxonomía jerárquica de capacidades de Vento Group
### [ ] CAP-MAP-002 — Definir capacidad, subcapacidad y resultado empresarial esperado
### [ ] CAP-MAP-003 — Vincular cada capacidad con empresa, sede, área y canal aplicables
### [ ] CAP-MAP-004 — Definir dominio y aplicación propietaria candidata
### [ ] CAP-MAP-005 — Definir aplicaciones y sistemas consumidores
### [ ] CAP-MAP-006 — Identificar actor iniciador, ejecutor, supervisor y aprobador
### [ ] CAP-MAP-007 — Identificar información de entrada y resultado producido
### [ ] CAP-MAP-008 — Identificar fuente de verdad actual y fuente de verdad objetivo
### [ ] CAP-MAP-009 — Identificar eventos e integraciones requeridos
### [ ] CAP-MAP-010 — Identificar permisos y controles de autorización requeridos
### [ ] CAP-MAP-011 — Identificar pantallas, dispositivos, documentos y evidencia requeridos
### [ ] CAP-MAP-012 — Clasificar capacidad núcleo, soporte, transversal, futura o fuera de alcance
### [ ] CAP-MAP-013 — Detectar capacidades duplicadas o con propiedad competidora
### [ ] CAP-MAP-014 — Detectar capacidades necesarias que no aparecen en código ni datos actuales
### [ ] CAP-MAP-015 — Aprobar la línea base de capacidades actuales, necesarias y candidatas de Vento Group

### AUDITORÍA DE IMPLEMENTACIÓN ACTUAL

### [ ] CODE-AUD-001 — Inventariar todos los repositorios y superficies desplegadas
### [ ] CODE-AUD-002 — Inventariar rutas, layouts, pantallas, componentes y formularios
### [ ] CODE-AUD-003 — Inventariar acciones de usuario y comportamiento efectivo
### [ ] CODE-AUD-004 — Inventariar hooks, servicios, adaptadores, consultas y estado local
### [ ] CODE-AUD-005 — Inventariar Server Actions, API routes, RPC, Edge Functions y jobs
### [ ] CODE-AUD-006 — Vincular código con tablas, vistas, Storage, Realtime y eventos
### [ ] CODE-AUD-007 — Inventariar pruebas, fixtures, mocks y datos de demostración
### [ ] CODE-AUD-008 — Detectar `TODO`, `FIXME`, stubs y funciones no terminadas
### [ ] CODE-AUD-009 — Detectar valores hardcodeados y decisiones técnicas temporales
### [ ] CODE-AUD-010 — Detectar pantallas con interfaz pero sin lógica completa
### [ ] CODE-AUD-011 — Detectar infraestructura sin proceso funcional utilizable
### [ ] CODE-AUD-012 — Detectar procesos implementados solo parcialmente
### [ ] CODE-AUD-013 — Detectar código legacy todavía activo
### [ ] CODE-AUD-014 — Detectar código duplicado y fuentes de verdad competidoras
### [ ] CODE-AUD-015 — Detectar rutas, componentes, funciones y tablas sin consumidores
### [ ] CODE-AUD-016 — Ejecutar build, lint, tipos y pruebas disponibles por repositorio
### [ ] CODE-AUD-017 — Auditar autorización, validación de servidor y exposición de datos
### [ ] CODE-AUD-018 — Auditar operación offline, reintentos, concurrencia e idempotencia
### [ ] CODE-AUD-019 — Vincular cada capacidad con su implementación actual verificable
### [ ] CODE-AUD-020 — Crear backlog técnico y funcional trazable por repositorio

### COBERTURA EMPRESARIAL OBLIGATORIA

E1 deberá evaluar como mínimo los siguientes dominios. Evaluar un dominio
no obliga a construirlo dentro de Vento OS; obliga a decidir de forma
explícita su tratamiento.

Clasificaciones permitidas:

```text
BUILD
REUSE_OR_REFACTOR
INTEGRATE_EXTERNAL
BUY
CONTROLLED_MANUAL
DEFERRED
OUT_OF_SCOPE
RETIRE
```

### [ ] CAP-SCOPE-001 — Evaluar gobierno, empresas, sedes y organización
### [ ] CAP-SCOPE-002 — Evaluar personal, contratación, turnos, asistencia, capacitación y retiro
### [ ] CAP-SCOPE-003 — Evaluar seguridad y salud en el trabajo
### [ ] CAP-SCOPE-004 — Evaluar catálogo, productos, presentaciones, unidades, menús y recetas
### [ ] CAP-SCOPE-005 — Evaluar compras, proveedores, contratos, precios y abastecimiento
### [ ] CAP-SCOPE-006 — Evaluar inventario, lotes, vencimientos, LOC y LPN
### [ ] CAP-SCOPE-007 — Evaluar activos, vajilla, decoración, herramientas, repuestos y mantenimiento
### [ ] CAP-SCOPE-008 — Evaluar producción, planificación, rendimiento, calidad e inocuidad
### [ ] CAP-SCOPE-009 — Evaluar ventas, pedidos, mesas, comandas, caja y pagos
### [ ] CAP-SCOPE-010 — Evaluar clientes, fidelización, reclamos y servicio
### [ ] CAP-SCOPE-011 — Evaluar logística, rutas, vehículos, combustible y entregas
### [ ] CAP-SCOPE-012 — Evaluar costos, gastos, presupuestos, tesorería, contabilidad e impuestos
### [ ] CAP-SCOPE-013 — Evaluar instalaciones, mantenimiento, limpieza, inspecciones y calibración
### [ ] CAP-SCOPE-014 — Evaluar marketing, campañas y contenido
### [ ] CAP-SCOPE-015 — Evaluar TI, dispositivos, redes, impresión, soporte y seguridad
### [ ] CAP-SCOPE-016 — Evaluar privacidad, cumplimiento, documentos, conservación y auditoría
### [ ] CAP-SCOPE-017 — Evaluar analítica, indicadores y datos maestros
### [ ] CAP-SCOPE-018 — Evaluar continuidad operativa, respaldo y recuperación
### [ ] CAP-SCOPE-019 — Aprobar clasificación y propietario de cada dominio evaluado

### MATRIZ DE COBERTURA

Cada capacidad deberá recibir exactamente un estado principal:

```text
PRODUCTION_READY
FUNCTIONAL_PARTIAL
INFRASTRUCTURE_ONLY
UI_ONLY
PROTOTYPE_ONLY
LEGACY_ACTIVE
BROKEN
MISSING
BLOCKED_BY_DEPENDENCY
DEFERRED
OUT_OF_SCOPE
```

### [ ] CAP-COVER-001 — Definir criterios verificables de cada estado de cobertura
### [ ] CAP-COVER-002 — Clasificar cobertura funcional
### [ ] CAP-COVER-003 — Clasificar cobertura de interfaz
### [ ] CAP-COVER-004 — Clasificar cobertura de servidor
### [ ] CAP-COVER-005 — Clasificar cobertura de datos
### [ ] CAP-COVER-006 — Clasificar cobertura de autorización
### [ ] CAP-COVER-007 — Clasificar cobertura de auditoría
### [ ] CAP-COVER-008 — Clasificar cobertura de pruebas
### [ ] CAP-COVER-009 — Clasificar cobertura de integración
### [ ] CAP-COVER-010 — Registrar dependencias y bloqueos
### [ ] CAP-COVER-011 — Priorizar por criticidad, frecuencia, riesgo y valor operativo
### [ ] CAP-COVER-012 — Aprobar matriz capacidad × proceso × aplicación × implementación

### REGISTRO CANÓNICO DE BRECHAS

### [ ] GAP-CTRL-001 — Consolidar brechas de auditoría, CAT-021, operación y código
### [ ] GAP-CTRL-002 — Deduplicar brechas equivalentes
### [ ] GAP-CTRL-003 — Clasificar brecha funcional, contractual, técnica, de datos, seguridad u operación
### [ ] GAP-CTRL-004 — Asignar propietario y fecha de decisión
### [ ] GAP-CTRL-005 — Vincular cada brecha con capacidad y proceso
### [ ] GAP-CTRL-006 — Vincular cada brecha con tarea y paquete de implementación
### [ ] GAP-CTRL-007 — Definir criterio y evidencia de cierre
### [ ] GAP-CTRL-008 — Impedir cerrar una fase con brechas críticas sin propietario

### Salida obligatoria

BLOQUE E1 deberá entregar:

- mapa aprobado de capacidades de Vento Group;
- inventario de procesos manuales y externos;
- inventario técnico por repositorio;
- matriz de cobertura funcional y técnica;
- matriz de cobertura empresarial mínima;
- registro canónico de brechas con propietario, destino y evidencia de cierre;
- backlog de capacidades ausentes;
- backlog de implementación incompleta;
- decisiones pendientes de propiedad;
- lista de nuevas necesidades de autorización;
- lista de servicios transversales requeridos;
- prioridades y dependencias.

### Regla de evolución del catálogo

Cuando E1 identifique una capacidad no incluida en el catálogo vigente:

```text
CAPACIDAD AUSENTE
→ DEFINICIÓN FUNCIONAL SUFICIENTE
→ REVISIÓN CONTRACTUAL
→ NUEVA VERSIÓN DEL CATÁLOGO, SI CORRESPONDE
→ DIFF DE MATRICES Y DISPOSITIVOS
→ REGENERACIÓN DE DATASETS AFECTADOS
```

El catálogo congelado antes de E1 se considerará una versión base de las
capacidades conocidas y maduras, no una declaración de que toda capacidad
futura de Vento Group ya fue inventariada.
