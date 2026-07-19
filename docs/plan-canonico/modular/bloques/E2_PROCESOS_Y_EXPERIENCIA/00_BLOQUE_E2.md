## BLOQUE E2

**Arquitectura funcional, procesos y experiencia transversal**

Este bloque depende de:

BLOQUE C
→ catálogo canónico de aplicaciones y permisos

BLOQUE D
→ matrices definitivas

BLOQUE E
→ contexto y decisión de autorización

No implementa todavía pantallas definitivas.

CATÁLOGO DE PROCESOS

### [ ] PROC-CAT-001 Inventariar todos los procesos actuales de Vento OS
### [ ] PROC-CAT-002 Identificar procesos manuales todavía no representados
### [ ] PROC-CAT-003 Crear identificador estable para cada proceso
### [ ] PROC-CAT-004 Definir propósito empresarial de cada proceso
### [ ] PROC-CAT-005 Definir aplicación propietaria de cada proceso
### [ ] PROC-CAT-006 Definir aplicaciones consumidoras de cada proceso
### [ ] PROC-CAT-007 Definir actor que inicia cada proceso
### [ ] PROC-CAT-008 Definir actores que continúan cada proceso
### [ ] PROC-CAT-009 Definir estado inicial de cada proceso
### [ ] PROC-CAT-010 Definir estados intermedios
### [ ] PROC-CAT-011 Definir estado final
### [ ] PROC-CAT-012 Definir transiciones permitidas
### [ ] PROC-CAT-013 Definir acciones excepcionales
### [ ] PROC-CAT-014 Definir cancelación, reversión y corrección
### [ ] PROC-CAT-015 Definir información de entrada
### [ ] PROC-CAT-016 Definir información producida
### [ ] PROC-CAT-017 Definir eventos empresariales emitidos
### [ ] PROC-CAT-018 Definir auditoría necesaria
### [ ] PROC-CAT-019 Definir métricas de operación
### [ ] PROC-CAT-020 Identificar procesos duplicados entre aplicaciones

MAPA DE ACTORES

### [ ] PROC-ACTOR-001 Vincular cada proceso con roles base aplicables
### [ ] PROC-ACTOR-002 Vincular cada proceso con roles operativos aplicables
### [ ] PROC-ACTOR-003 Diferenciar iniciador, ejecutor, supervisor y aprobador
### [ ] PROC-ACTOR-004 Definir procesos personales
### [ ] PROC-ACTOR-005 Definir procesos administrativos
### [ ] PROC-ACTOR-006 Definir procesos operativos
### [ ] PROC-ACTOR-007 Definir procesos híbridos
### [ ] PROC-ACTOR-008 Definir procesos del dominio cliente
### [ ] PROC-ACTOR-009 Definir procesos de sistema sin actor humano directo
### [ ] PROC-ACTOR-010 Prohibir autorización derivada únicamente del nombre del rol

CONTRATO DE PANTALLAS

### [ ] PROC-SCREEN-001 Crear identificador estable para cada pantalla
### [ ] PROC-SCREEN-002 Vincular cada pantalla con una aplicación
### [ ] PROC-SCREEN-003 Vincular cada pantalla con un proceso
### [ ] PROC-SCREEN-004 Vincular cada pantalla con un paso del proceso
### [ ] PROC-SCREEN-005 Clasificar pantalla operativa
### [ ] PROC-SCREEN-006 Clasificar pantalla administrativa
### [ ] PROC-SCREEN-007 Clasificar pantalla de supervisión
### [ ] PROC-SCREEN-008 Clasificar pantalla de configuración
### [ ] PROC-SCREEN-009 Clasificar pantalla de auditoría
### [ ] PROC-SCREEN-010 Clasificar pantalla personal
### [ ] PROC-SCREEN-011 Clasificar pantalla de cliente
### [ ] PROC-SCREEN-012 Definir actores objetivo
### [ ] PROC-SCREEN-013 Definir dispositivos soportados
### [ ] PROC-SCREEN-014 Definir acción principal
### [ ] PROC-SCREEN-015 Definir acciones secundarias
### [ ] PROC-SCREEN-016 Definir condiciones de entrada
### [ ] PROC-SCREEN-017 Definir condiciones de salida
### [ ] PROC-SCREEN-018 Definir estados vacíos
### [ ] PROC-SCREEN-019 Definir estados de carga
### [ ] PROC-SCREEN-020 Definir estados de bloqueo
### [ ] PROC-SCREEN-021 Definir recuperación ante errores
### [ ] PROC-SCREEN-022 Definir información sensible visible
### [ ] PROC-SCREEN-023 Definir permiso de lectura
### [ ] PROC-SCREEN-024 Definir permisos de cada acción
### [ ] PROC-SCREEN-025 Vincular cada acción con Server Action, API o RPC
### [ ] PROC-SCREEN-026 Identificar pantalla reemplazada o legacy
### [ ] PROC-SCREEN-027 Definir métrica de usabilidad
### [ ] PROC-SCREEN-028 Definir criterio de aceptación operativo

PRINCIPIOS DE EXPERIENCIA

### [ ] UX-BASE-001 Separar experiencia operativa y administrativa
### [ ] UX-BASE-002 Mostrar primero la tarea actual del trabajador
### [ ] UX-BASE-003 Evitar navegación basada en nombres técnicos
### [ ] UX-BASE-004 Ocultar funciones irrelevantes para el actor
### [ ] UX-BASE-005 Mantener visible sede, área, turno y rol activos
### [ ] UX-BASE-006 Explicar bloqueos con lenguaje humano
### [ ] UX-BASE-007 Evitar registrar dos veces la misma información
### [ ] UX-BASE-008 Reducir pasos para tareas frecuentes
### [ ] UX-BASE-009 Mantener acciones excepcionales fuera del flujo ordinario
### [ ] UX-BASE-010 Aplicar divulgación progresiva a opciones avanzadas
### [ ] UX-BASE-011 Diseñar interfaces táctiles para tablets y kioscos
### [ ] UX-BASE-012 Diseñar interfaces densas solo para administración
### [ ] UX-BASE-013 Definir comportamiento con conectividad inestable
### [ ] UX-BASE-014 Definir reanudación del proceso después de interrupciones
### [ ] UX-BASE-015 Validar terminología con trabajadores reales

Resultado esperado:

PROCESS
+
ACTOR
+
PROCESS STEP
+
SCREEN
+
PRIMARY ACTION
+
PERMISSIONS
+
CONTEXT
+
RESOURCE
+
SERVER PROTECTION
+
AUDIT
+
USABILITY CRITERIA

