### R3 — Retiro y certificación final

### [ ] AUTH-DB-030 — Retirar objetos legacy únicamente después de adopción comprobada
### [ ] AUTH-DB-031 — Certificar paridad entre documento, vento-shell, Supabase y aplicaciones

Regla de cierre

AUTH-DB-030 y AUTH-DB-031 no se ejecutarán completamente durante
la fundación inicial.

Se ejecutarán en la FASE 12 después de comprobar:

- adaptación de todos los consumidores;
- finalización de los pilotos aplicables;
- ausencia de lecturas legacy;
- ausencia de escrituras legacy;
- reconciliación de datos;
- pruebas de seguridad;
- pruebas de restauración;
- rollback todavía disponible;
- paridad local, staging y producción.

Ningún objeto legacy se retirará únicamente porque exista su reemplazo.
