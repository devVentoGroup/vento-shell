### Delta VISO mensual

| Objeto                                          | Estado inicial                      |
| ----------------------------------------------- | ----------------------------------- |
| `employee_shifts`                               | fuente actual                       |
| `viso_enforce_monthly_schedule_publish_limit()` | local/provisional SECURITY DEFINER  |
| `trg_viso_monthly_schedule_publish_limit`       | local/provisional row-level         |
| migración `20260731082600...`                   | propuesta; producción no autorizada |

- 001 inventaria.
- 002 clasifica; no presume conservación.
- 003 mapea dependencias.
- 008 define concurrencia.
- 009 prueba migración/límite/rollback.
- 010 mide coste.
- 011 define rollback.
- 013 valida paridad de ambientes.
- 014 actualiza tipos/errores/política.
- 015 incorpora solo después de `VISO-SCH-008` y E5.

`11160`/`186` no son arquitectura estable. SECURITY DEFINER requiere owner, grants, search path y pruebas negativas. El trigger debe demostrar atomicidad/concurrencia. No aplicar a producción durante la fase documental.
