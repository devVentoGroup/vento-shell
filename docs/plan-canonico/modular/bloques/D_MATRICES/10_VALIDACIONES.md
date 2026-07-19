### [ ] AUTH-RBAC-027 — Validar que no exista acceso operativo global accidental
### [ ] AUTH-RBAC-028 — Validar que la administración no dependa del check-in

Regla de implementación de matrices

AUTH-RBAC-024 a AUTH-RBAC-026
→ definen y aprueban datasets canónicos
→ no insertan, actualizan ni eliminan datos en Supabase

La aplicación física de estos datasets deberá ejecutarse únicamente
dentro del BLOQUE R, después de:

- aprobar la arquitectura objetivo del BLOQUE E3;
- crear las estructuras canónicas necesarias;
- completar los backfills correspondientes;
- validar integridad referencial;
- disponer de pruebas y rollback;
- crear la migración versionada en `vento-shell`.

Regla de cierre

propietario
gerente_general

→ no requieren turno ni check-in para acciones BASE_ONLY
→ reciben permisos administrativos globales explícitos
→ no reciben bypass por nombre de rol
→ las capacidades OPERATIONAL_ONLY continúan exigiendo contexto operativo

