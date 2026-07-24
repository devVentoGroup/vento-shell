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
