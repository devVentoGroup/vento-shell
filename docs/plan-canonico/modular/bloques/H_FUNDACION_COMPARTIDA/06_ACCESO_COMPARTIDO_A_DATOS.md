### MINI-BLOQUE — ACCESO COMPARTIDO A DATOS

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **acceso compartido a datos** dentro de **H FUNDACION COMPARTIDA**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `SHELL-DB-001` a `SHELL-DB-005` — 5 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `SHELL-DB-001`: Crear @vento/supabase
- `SHELL-DB-002`: Centralizar tipos generados por cada paquete de base de datos aprobado
- `SHELL-DB-003`: Crear y actualizar wrappers tipados para RPC canónicas
- `SHELL-DB-004`: Normalizar errores de Supabase
- `SHELL-DB-005`: Separar cliente server, browser y native
<!-- PLAN-SECTION-META:END -->

### [ ] SHELL-DB-001 — Crear @vento/supabase
### [ ] SHELL-DB-002 — Centralizar tipos generados por cada paquete de base de datos aprobado
### [ ] SHELL-DB-003 — Crear y actualizar wrappers tipados para RPC canónicas
### [ ] SHELL-DB-004 — Normalizar errores de Supabase
### [ ] SHELL-DB-005 — Separar cliente server, browser y native

Regla de sincronización con BLOQUE R

SHELL-DB-001, SHELL-DB-004 y SHELL-DB-005
→ pueden establecer la infraestructura inicial del paquete compartido

SHELL-DB-002 y SHELL-DB-003
→ se ejecutan incrementalmente con AUTH-DB-026
→ se actualizan después de cada paquete contractual del BLOQUE R
→ no se consideran terminadas hasta completar la certificación final
