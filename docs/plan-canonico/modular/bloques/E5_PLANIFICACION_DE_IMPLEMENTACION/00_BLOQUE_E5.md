## BLOQUE E5

**Diseño de solución, paquetes de implementación y preparación operativa**

Este bloque convierte las decisiones aprobadas de E1, E2, E3, E4, X y de
los roadmaps por aplicación en unidades de trabajo implementables,
verificables, desplegables y reversibles.

No reemplaza:

BLOQUE E1
→ descubre operación real, capacidades y cobertura actual

BLOQUE E2
→ diseña procesos, actores, pantallas y experiencia objetivo

BLOQUE X
→ define integraciones, eventos y contratos entre sistemas

BLOQUE E3
→ define arquitectura de datos, Supabase y transición

BLOQUE E4
→ define colas, impresión, notificaciones y evidencia

BLOQUES POR APLICACIÓN
→ definen el comportamiento funcional y la experiencia de cada dominio

BLOQUE E5
→ transforma esas decisiones en paquetes concretos de implementación,
  readiness, cutover, piloto, rollback e hypercare

Durante este bloque no se implementan código, migraciones ni cambios
físicos. Se diseña y aprueba cómo se implementará cada alcance.

### Principios obligatorios

```text
CAPACIDAD APROBADA
→ PROCESO TO-BE
→ DISEÑO FUNCIONAL Y TÉCNICO
→ PAQUETE DE IMPLEMENTACIÓN
→ PRUEBAS
→ READINESS
→ CUTOVER
→ PILOTO OPERATIVO
→ HYPERCARE
→ EVIDENCIA DE CIERRE
```

Una capacidad no podrá pasar a implementación cuando:

- no tenga propietario funcional;
- no tenga aplicación y repositorio propietarios;
- no tenga alcance objetivo aprobado;
- no tenga impacto de autorización evaluado;
- no tenga impacto de datos e integración evaluado;
- no tenga pruebas, rollout y rollback definidos;
- no tenga criterio de aceptación operativo;
- conserve una brecha crítica sin responsable.

### PAQUETES DE IMPLEMENTACIÓN

### [ ] DELIV-PKG-001 — Crear identificador estable para cada paquete de implementación
### [ ] DELIV-PKG-002 — Vincular el paquete con capability_id, process_id y gap_id
### [ ] DELIV-PKG-003 — Definir aplicación, dominio y repositorio propietarios
### [ ] DELIV-PKG-004 — Definir estado AS-IS y resultado TO-BE verificable
### [ ] DELIV-PKG-005 — Definir alcance incluido, excluido y diferido
### [ ] DELIV-PKG-006 — Definir pantallas, componentes y navegación que se crearán o modificarán
### [ ] DELIV-PKG-007 — Definir lógica de dominio, Server Actions, API, RPC y Edge Functions
### [ ] DELIV-PKG-008 — Definir tablas, vistas, funciones, políticas, Storage y Realtime afectados
### [ ] DELIV-PKG-009 — Definir migraciones, backfills, compatibilidad y retiro legacy
### [ ] DELIV-PKG-010 — Definir eventos emitidos, consumidos, colas y compensaciones
### [ ] DELIV-PKG-011 — Definir impresión, notificaciones, documentos y evidencia requeridos
### [ ] DELIV-PKG-012 — Definir permisos, modalidad, alcance, contexto y contrato de recurso
### [ ] DELIV-PKG-013 — Definir requisitos no funcionales aplicables
### [ ] DELIV-PKG-014 — Enumerar archivos exactos que se crearán, modificarán o retirarán
### [ ] DELIV-PKG-015 — Definir dependencias, bloqueos y orden de aplicación
### [ ] DELIV-PKG-016 — Definir pruebas unitarias, contractuales, integración, seguridad y E2E
### [ ] DELIV-PKG-017 — Definir observabilidad, métricas, logs, alertas y auditoría
### [ ] DELIV-PKG-018 — Definir feature flags, configuración y activación progresiva
### [ ] DELIV-PKG-019 — Definir estrategia de despliegue y rollout
### [ ] DELIV-PKG-020 — Definir rollback técnico, funcional y de datos
### [ ] DELIV-PKG-021 — Definir documentación, procedimiento y capacitación
### [ ] DELIV-PKG-022 — Definir alcance, actores, datos y duración del piloto
### [ ] DELIV-PKG-023 — Definir criterios de aceptación y evidencia de cierre
### [ ] DELIV-PKG-024 — Vincular el paquete con el registro canónico de brechas
### [ ] DELIV-PKG-025 — Aprobar el paquete antes de iniciar implementación física

### PUERTA DE READINESS OPERATIVO

### [ ] READY-GATE-001 — Confirmar código desplegado en el entorno objetivo
### [ ] READY-GATE-002 — Confirmar migraciones aplicadas y datos validados
### [ ] READY-GATE-003 — Confirmar permisos, matrices y dispositivos configurados
### [ ] READY-GATE-004 — Confirmar usuarios, roles, sedes, áreas y turnos requeridos
### [ ] READY-GATE-005 — Confirmar catálogos y datos maestros mínimos
### [ ] READY-GATE-006 — Confirmar integraciones y credenciales de prueba o producción
### [ ] READY-GATE-007 — Confirmar hardware, red, escáneres e impresoras
### [ ] READY-GATE-008 — Confirmar procedimientos operativos y contingencias
### [ ] READY-GATE-009 — Confirmar capacitación y material de apoyo
### [ ] READY-GATE-010 — Confirmar mesa de soporte, responsables y escalamiento
### [ ] READY-GATE-011 — Confirmar monitoreo, métricas y alertas
### [ ] READY-GATE-012 — Confirmar respaldo y rollback probados
### [ ] READY-GATE-013 — Capturar línea base previa al piloto
### [ ] READY-GATE-014 — Registrar riesgos aceptados y condiciones de suspensión
### [ ] READY-GATE-015 — Aprobar formalmente la entrada al piloto operativo

### CUTOVER Y PILOTO

### [ ] CUTOVER-OPS-001 — Definir fecha, ventana y responsables del cutover
### [ ] CUTOVER-OPS-002 — Definir secuencia de activación por sede, área, rol o proceso
### [ ] CUTOVER-OPS-003 — Definir convivencia temporal con el proceso anterior
### [ ] CUTOVER-OPS-004 — Evitar doble registro y doble efecto durante la transición
### [ ] CUTOVER-OPS-005 — Definir conciliaciones durante el piloto
### [ ] CUTOVER-OPS-006 — Definir criterio de pausa, reversión o continuación
### [ ] CUTOVER-OPS-007 — Registrar incidentes, decisiones y cambios de alcance
### [ ] CUTOVER-OPS-008 — Medir tiempos, errores, adopción y resultado empresarial
### [ ] CUTOVER-OPS-009 — Aprobar salida del piloto o exigir correcciones
### [ ] CUTOVER-OPS-010 — Retirar el proceso anterior solo con evidencia suficiente

### HYPERCARE Y ESTABILIZACIÓN

### [ ] HYPERCARE-OPS-001 — Definir periodo de acompañamiento intensivo
### [ ] HYPERCARE-OPS-002 — Definir responsables funcionales y técnicos
### [ ] HYPERCARE-OPS-003 — Monitorear errores, colas, integraciones y rendimiento
### [ ] HYPERCARE-OPS-004 — Monitorear adopción, tiempos y desviaciones operativas
### [ ] HYPERCARE-OPS-005 — Conciliar datos y efectos entre dominios
### [ ] HYPERCARE-OPS-006 — Priorizar y corregir incidentes de estabilización
### [ ] HYPERCARE-OPS-007 — Registrar deuda aceptada y tareas posteriores
### [ ] HYPERCARE-OPS-008 — Confirmar soporte ordinario y documentación definitiva
### [ ] HYPERCARE-OPS-009 — Confirmar retiro controlado de contingencias temporales
### [ ] HYPERCARE-OPS-010 — Aprobar cierre con evidencia funcional, técnica y operativa

### PUERTA DE SALIDA DE E5

### [ ] E5-GATE-001 — Confirmar que cada capacidad priorizada tiene paquete aprobado
### [ ] E5-GATE-002 — Confirmar que cada brecha crítica tiene propietario y destino
### [ ] E5-GATE-003 — Confirmar que los requisitos no funcionales están cubiertos
### [ ] E5-GATE-004 — Confirmar que rollout, rollback y contingencia son ejecutables
### [ ] E5-GATE-005 — Confirmar que el piloto tiene criterios medibles
### [ ] E5-GATE-006 — Confirmar que capacitación y soporte están planificados
### [ ] E5-GATE-007 — Confirmar trazabilidad hasta pruebas y evidencia de cierre
### [ ] E5-GATE-008 — Aprobar entrada a implementación física por paquetes

### Salida obligatoria

BLOQUE E5 deberá entregar:

- catálogo de paquetes de implementación;
- trazabilidad capacidad → proceso → brecha → paquete;
- inventario exacto de cambios por repositorio;
- impacto de datos, autorización, integración y servicios transversales;
- requisitos no funcionales aplicables;
- estrategia de pruebas y observabilidad;
- readiness operativo;
- plan de cutover y piloto;
- rollback y contingencia;
- plan de capacitación y soporte;
- plan de hypercare;
- criterios y evidencia de cierre.
