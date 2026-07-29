### MINI-BLOQUE — GOBIERNO DE ACCESO Y SEGURIDAD

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **gobierno de acceso y seguridad** dentro de **G VISO**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `VISO-AUTH-001` a `VISO-AUTH-020` — 20 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Límites funcionales:** comienza con “Crear catálogo administrativo de roles base” y concluye con “Crear exporte de matriz de acceso”.
<!-- PLAN-SECTION-META:END -->

### [ ] VISO-AUTH-001 — Crear catálogo administrativo de roles base
### [ ] VISO-AUTH-002 — Crear catálogo administrativo de roles operativos
### [ ] VISO-AUTH-003 — Administrar permisos por rol base
### [ ] VISO-AUTH-004 — Administrar permisos por rol operativo
### [ ] VISO-AUTH-005 — Administrar roles permitidos por sede
### [ ] VISO-AUTH-006 — Administrar roles permitidos por área
### [ ] VISO-AUTH-007 — Administrar perfiles operativos por trabajador
### [ ] VISO-AUTH-008 — Administrar sedes asignadas
### [ ] VISO-AUTH-009 — Administrar áreas asignadas
### [ ] VISO-AUTH-010 — Asignar rol operativo al turno
### [ ] VISO-AUTH-011 — Validar turnos sin rol operativo
### [ ] VISO-AUTH-012 — Validar turnos con área incompatible
### [ ] VISO-AUTH-013 — Crear vista previa trabajador × sede × área × turno
### [ ] VISO-AUTH-014 — Crear simulador de permisos efectivos
### [ ] VISO-AUTH-015 — Mostrar origen de cada permiso
### [ ] VISO-AUTH-016 — Mostrar conflictos de configuración
### [ ] VISO-AUTH-017 — Administrar excepciones individuales
### [ ] VISO-AUTH-018 — Auditar cambios de seguridad
### [ ] VISO-AUTH-019 — Restringir quién administra seguridad
### [ ] VISO-AUTH-020 — Crear exporte de matriz de acceso

SUBBLOQUE G2 — VISO Core

VISO Core deberá implementarse antes o en paralelo con las aplicaciones
operativas porque administra el modelo que estas consumen.

VISO Core no crea un segundo catálogo de funciones administrativas.

Su alcance funcional está compuesto por las tareas:

VISO-AUTH-001 a VISO-AUTH-020

Estas tareas cubren:

trabajadores;
roles base;
roles operativos;
sedes;
áreas;
perfiles operativos;
turnos;
permisos;
excepciones;
simulación;
conflictos;
auditoría.

Las tareas VISO-CORE controlan únicamente el corte mínimo,
la priorización y la aprobación del habilitador.
