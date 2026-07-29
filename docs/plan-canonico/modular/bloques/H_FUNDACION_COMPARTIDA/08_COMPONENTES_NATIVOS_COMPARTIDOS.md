### MINI-BLOQUE — COMPONENTES NATIVOS COMPARTIDOS

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **componentes nativos compartidos** dentro de **H FUNDACION COMPARTIDA**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `SHELL-NATIVE-001` a `SHELL-NATIVE-003` — 3 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `SHELL-NATIVE-001`: Crear tokens compatibles con ANIMA
- `SHELL-NATIVE-002`: Compartir contratos y validadores
- `SHELL-NATIVE-003`: Mantener UI React Native separada
<!-- PLAN-SECTION-META:END -->

### [ ] SHELL-NATIVE-001 — Crear tokens compatibles con ANIMA
### [ ] SHELL-NATIVE-002 — Compartir contratos y validadores
### [ ] SHELL-NATIVE-003 — Mantener UI React Native separada

No se debe empezar trasladando el AppShell completo. Primero deben compartirse contratos, códigos, tipos, eventos y helpers puros.

No deberán compartirse inicialmente:

páginas completas;
formularios específicos de dominio;
procesos empresariales completos;
consultas propias de una aplicación;
componentes que obliguen a todas las aplicaciones a tener la misma interfaz.
