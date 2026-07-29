### MINI-BLOQUE — AUTORIZACIÓN Y CONTEXTO OPERATIVO

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **autorización y contexto operativo** dentro de **F ANIMA**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `ANIMA-AUTH-001` a `ANIMA-AUTH-020` — 20 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Límites funcionales:** comienza con “Confirmar turno publicado antes del check-in” y concluye con “Mantener Supabase como fuente de verdad”.
<!-- PLAN-SECTION-META:END -->

### [ ] ANIMA-AUTH-001 — Confirmar turno publicado antes del check-in
### [ ] ANIMA-AUTH-002 — Confirmar sede del turno
### [ ] ANIMA-AUTH-003 — Confirmar área del turno
### [ ] ANIMA-AUTH-004 — Confirmar rol operativo del turno
### [ ] ANIMA-AUTH-005 — Confirmar que el rol esté permitido en la sede
### [ ] ANIMA-AUTH-006 — Confirmar que el rol esté permitido en el área
### [ ] ANIMA-AUTH-007 — Crear contexto operativo al registrar entrada
### [ ] ANIMA-AUTH-008 — Actualizar contexto cuando cambia el turno
### [ ] ANIMA-AUTH-009 — Cerrar contexto al registrar salida
### [ ] ANIMA-AUTH-010 — Manejar descansos sin cerrar autorización
### [ ] ANIMA-AUTH-011 — Manejar cambio temporal de área
### [ ] ANIMA-AUTH-012 — Manejar reemplazos de turno
### [ ] ANIMA-AUTH-013 — Manejar turnos cruzados de medianoche
### [ ] ANIMA-AUTH-014 — Manejar cola offline de check-in
### [ ] ANIMA-AUTH-015 — Revalidar permisos al sincronizar una cola offline
### [ ] ANIMA-AUTH-016 — Mostrar diagnóstico de contexto al trabajador
### [ ] ANIMA-AUTH-017 — Diferenciar falta de turno y falta de permiso
### [ ] ANIMA-AUTH-018 — Auditar creación y cierre del contexto
### [ ] ANIMA-AUTH-019 — Evitar que ANIMA otorgue permisos directamente
### [ ] ANIMA-AUTH-020 — Mantener Supabase como fuente de verdad

ANIMA ya fue ajustado parcialmente para bloquear check-in cuando no hay turno publicado o cuando falta un rol operativo válido.
