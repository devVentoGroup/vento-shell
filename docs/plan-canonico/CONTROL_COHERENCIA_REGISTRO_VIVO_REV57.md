# Control de coherencia del registro vivo — revisión 57

**Fecha:** 2026-07-24  
**Archivo controlado:** `REGISTRO_VIVO_DE_PREGUNTAS_PENDIENTES.md`  
**Naturaleza:** complemento de integridad; no reemplaza respuestas ni elimina preguntas.

## Ajustes obligatorios

1. La fecha de última actualización del registro vivo pasa a `2026-07-24`.
2. Las dudas diferidas deberán usar destinos canónicos exactos:

| ID | Destino exacto |
| --- | --- |
| `DIF-04` | `PROC-CAT-014`, `INT-POS-008`, `INT-POS-019` |
| `DIF-05` | `NFR-REQ-004`, `UX-BASE-013`, `CUTOVER-OPS-005` |
| `DIF-06` | `INT-APP-004`, `INT-APP-005`, `INT-EXT-012`, `INT-EXT-015` |
| `DIF-07` | `NFR-REQ-010`, `UX-BASE-014`, `CUTOVER-OPS-006` |
| `DIF-08` | `NFR-REQ-002`, `PROC-CAT-019`, `CUTOVER-OPS-008` |
| `DIF-09` | `PROC-SCREEN-012`, `PROC-SCREEN-013`, `UX-BASE-015` |
| `DIF-10` | `CAP-SCOPE-015`, `CAP-SCOPE-019`, `NFR-REQ-009` |

3. Se registra la decisión `DEC-DOC-057-001`:

> TALENTO se reconoce como aplicación laboral futura. `CAP-TAL-001` a
> `CAP-TAL-006` se reubican de E1 a E2 por corresponder a diseño TO-BE. E1
> queda en 43 de 97 tareas aprobadas y `EXT-GOV-001` queda condicional,
> paralela y no bloqueante.

## Regla de aplicación

Este control deberá incorporarse al archivo principal durante la siguiente
actualización sustantiva del registro vivo. Hasta entonces, ante cualquier
conflicto de destino o conteo, prevalece este documento de revisión 57 junto
con el estado canónico vigente.
