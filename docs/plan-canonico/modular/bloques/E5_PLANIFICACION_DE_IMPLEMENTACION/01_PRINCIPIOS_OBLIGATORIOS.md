### Principios obligatorios

E5 gobierna la planificación y autorización de una implementación identificada por `package_id`. No gobierna la cardinalidad de una fundación transversal ni constituye por sí mismo el gate de materialización inicial de una tarea clasificada `PRE_E5_FOUNDATION`.

```text
FUNDACIÓN TRANSVERSAL APLICABLE
→ contrato canónico aprobado
→ autorización física explícita de la instancia
→ materialización PRE_E5_FOUNDATION
→ validación y evidencia
→ habilitador reutilizable

CAPACIDAD APROBADA
→ PROCESO TO-BE
→ DISEÑO FUNCIONAL Y TÉCNICO
→ DELIV-PKG
→ PLAN DE PRUEBAS
→ PLAN DE READINESS
→ PLAN DE CUTOVER Y PILOTO
→ PLAN DE HYPERCARE
→ CRITERIOS DE EVIDENCIA Y CIERRE
→ E5-GATE-008::<package_id>
→ IMPLEMENTACIÓN FÍSICA POST_E5_PACKAGE
```

Las tareas E5 conservan cardinalidad `TEMPLATE_PER_PACKAGE` y usan `PRE_E5_PLANNING`: cada instancia construye el expediente de su `package_id` antes de la puerta. `E5-GATE-008::<package_id>` es el cierre de esa planificación y nunca su prerrequisito.

Una capacidad no podrá pasar a implementación del paquete cuando:

- no tenga propietario funcional;
- no tenga aplicación y repositorio propietarios;
- no tenga alcance objetivo aprobado;
- no tenga impacto de autorización evaluado;
- no tenga impacto de datos e integración evaluado;
- no tenga pruebas, rollout y rollback definidos;
- no tenga criterio de aceptación operativo;
- conserve una brecha crítica sin responsable;
- dependa de una fundación transversal aplicable todavía no disponible o no certificada.

### Requisitos de prueba por paquete

Todo paquete de implementación deberá:

- enumerar los requisitos `TREQ-*` que implementa;
- indicar cuáles pruebas serán automatizadas;
- indicar cuáles validaciones deberán ser manuales;
- definir los archivos de prueba que se crearán o modificarán;
- definir los comandos de ejecución;
- definir los datos iniciales y el resultado esperado;
- identificar las pruebas de regresión existentes que deberán seguir pasando;
- impedir el cierre con requisitos críticos sin implementar;
- justificar cualquier requisito diferido mediante una tarea exacta;
- actualizar el Registro Canónico de Requisitos de Prueba cuando corresponda.

### Límite entre planificación y ejecución

E5 solo podrá aprobar artefactos disponibles antes de implementar el paquete:

- alcance y archivos previstos;
- comandos y orden de aplicación;
- escenarios y datos de prueba;
- checklist de readiness;
- plan de cutover y piloto;
- plan de hypercare;
- condiciones de suspensión;
- rollback;
- criterios y formato de evidencia.

La evidencia real de código desplegado, migraciones de paquete aplicadas, restauración probada, piloto ejecutado o estabilización pertenece respectivamente a `SHELL-CI-020`, BLOQUE R post-gate, `SHELL-CI-021`, `SHELL-CI-022`, `SHELL-CI-023`, `SHELL-CI-024` y BLOQUE U según corresponda.

La existencia previa de una fundación `PRE_E5_FOUNDATION` no constituye evidencia de que un paquete consumidor haya sido implementado, desplegado o certificado.

### Aplicación incremental sin aprobación parcial

Una tarea transversal podrá producir un artefacto versionado para una aplicación antes de completar su cobertura global. Ese artefacto podrá ser entrada de un paquete prioritario solo cuando:

- identifique la tarea canónica que lo originó;
- declare que no cambia el marcador ni constituye aprobación parcial;
- mantenga el contrato global y sus identificadores;
- delimite filas, procesos, vistas, acciones, datos y ambientes cubiertos;
- declare faltantes y consumidores todavía no migrados;
- incluya compatibilidad y transición;
- sea verificable de manera independiente;
- quede vinculado al `package_id`.

El paquete no podrá inventar un sustituto local para una fundación transversal requerida. Si el habilitador mínimo seguro no existe, el paquete permanecerá bloqueado.

El primer carril designado es `NEXO-REMISSIONS-001`, definido en `priority-delivery-lanes.json`. Su designación no equivale a aprobación, readiness ni autorización física de una fundación.
