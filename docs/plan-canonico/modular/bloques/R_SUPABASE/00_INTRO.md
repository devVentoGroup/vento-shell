## BLOQUE R

**Implementación progresiva de arquitectura Supabase, seguridad y transición**

Relación obligatoria:

BLOQUE E3
→ audita el estado real
→ define la arquitectura objetivo
→ aprueba el plan de transición

BLOQUE R
→ implementa exclusivamente decisiones aprobadas
→ utiliza paquetes pequeños y reversibles
→ conserva compatibilidad temporal
→ registra todas las migraciones en `vento-shell`

BLOQUE R no repetirá las auditorías realizadas en BLOQUE E3.

Cada tarea de corrección deberá partir de un hallazgo aprobado,
un objeto identificado y un paquete de transición definido.

Cuando un paquete aprobado por `E5-GATE-008` afecte Supabase:

- `SHELL-CI-020` gobierna la ejecución integral del paquete;
- las tareas exactas de R ejecutan migraciones, backfills, seguridad,
  compatibilidad, tipos y rollback;
- `SHELL-CI-021` comprueba después la evidencia de readiness definida en E5;
- ninguna tarea `READY-GATE-*` aplica migraciones ni valida datos durante la
  planificación previa.
