### Principios obligatorios

```text
CAPACIDAD APROBADA
→ PROCESO TO-BE
→ DISEÑO FUNCIONAL Y TÉCNICO
→ PAQUETE DE IMPLEMENTACIÓN
→ PLAN DE PRUEBAS
→ PLAN DE READINESS
→ PLAN DE CUTOVER Y PILOTO
→ PLAN DE HYPERCARE
→ CRITERIOS DE EVIDENCIA Y CIERRE
→ E5-GATE-008
→ IMPLEMENTACIÓN FÍSICA POSTERIOR
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
- actualizar el Registro Canónico de Requisitos de Prueba.

### Límite entre planificación y ejecución

E5 solo podrá aprobar artefactos disponibles antes de implementar:

- alcance y archivos previstos;
- comandos y orden de aplicación;
- escenarios y datos de prueba;
- checklist de readiness;
- plan de cutover y piloto;
- plan de hypercare;
- condiciones de suspensión;
- rollback;
- criterios y formato de evidencia.

La evidencia real de código desplegado, migraciones aplicadas, restauración
probada, piloto ejecutado o estabilización pertenece respectivamente a
`SHELL-CI-020`, BLOQUE R, `SHELL-CI-021`, `SHELL-CI-022`,
`SHELL-CI-023`, `SHELL-CI-024` y BLOQUE U.

### Aplicación incremental sin aprobación parcial

Una tarea transversal podrá producir un artefacto versionado para una
aplicación antes de completar su cobertura global. Ese artefacto podrá ser
entrada de un paquete prioritario solo cuando:

- identifique la tarea canónica que lo originó;
- declare que no cambia el marcador ni constituye aprobación parcial;
- mantenga el contrato global y sus identificadores;
- delimite filas, procesos, vistas, acciones, datos y ambientes cubiertos;
- declare faltantes y consumidores todavía no migrados;
- incluya compatibilidad y transición;
- sea verificable de manera independiente;
- quede vinculado al `package_id`.

El paquete no podrá inventar un sustituto local para una tarea transversal
pendiente. Si el artefacto mínimo seguro no existe, el paquete permanecerá
bloqueado.

El primer carril designado es `NEXO-REMISSIONS-001`, definido en
`priority-delivery-lanes.json`. Su designación no equivale a aprobación ni
readiness.
