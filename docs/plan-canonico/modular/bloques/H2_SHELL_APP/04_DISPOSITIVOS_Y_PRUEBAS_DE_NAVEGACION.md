### MINI-BLOQUE — DISPOSITIVOS, PRUEBAS Y SANEAMIENTO DE NAVEGACIÓN

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **dispositivos, pruebas y saneamiento de navegación** dentro de **H2 SHELL APP**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `SHELL-APP-017` a `SHELL-APP-021` — 5 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `SHELL-APP-017`: Diseñar experiencia para computador
- `SHELL-APP-018`: Diseñar experiencia para tablet
- `SHELL-APP-019`: Probar navegación por rol
- `SHELL-APP-020`: Probar navegación con bloqueos reales
- `SHELL-APP-021`: Retirar placeholders de perfil y configuración sin destino real
<!-- PLAN-SECTION-META:END -->

### [ ] SHELL-APP-017 — Diseñar experiencia para computador
### [ ] SHELL-APP-018 — Diseñar experiencia para tablet
### [ ] SHELL-APP-019 — Probar navegación por rol
### [ ] SHELL-APP-020 — Probar navegación con bloqueos reales

### [ ] SHELL-APP-021 — Retirar placeholders de perfil y configuración sin destino real

**Propósito:** eliminar del Hub las acciones `Mi perfil` y `Configuración` mientras no exista una capacidad funcional aprobada y una ruta propietaria distinta de `/`.

**Dependencias:** decisión de retiro `SHELL-AUD-011`; composición definida por `SHELL-UI-010`.

**Puerta de cierre:** ninguna acción visible anuncia una capacidad inexistente; navegación, build y rollback de SHELL quedan verificados. Crear perfil o configuración requerirá una tarea funcional nueva y aprobación independiente.
