# Propuesta local: enrutamiento de arrastre para E1-GATE-001

**Estado:** APROBADA Y APLICADA LOCALMENTE — no publicada  
**Alcance:** las 138 brechas del Anexo A de `07_REGISTRO_CANONICO_DE_BRECHAS.md`  
**Objetivo:** completar la información de enrutamiento que hoy bloquea E1, sin declarar cerrada ninguna brecha ni alterar sus responsables, fechas, tareas, paquetes o perfiles ya registrados.

## Qué resuelve esta propuesta

La puerta E1 quedó correctamente bloqueada porque cada brecha ya tiene responsable, fecha, tarea primaria, paquete y perfil, pero faltan seis decisiones de arrastre:

1. bloque destino;
2. motivo de arrastre;
3. control compensatorio;
4. aprobación de Gobierno General;
5. fecha de aprobación;
6. siguiente fecha de revisión.

Esta propuesta agrupa las 138 brechas por el bloque que ya contiene su tarea primaria. No crea trabajo nuevo ni mueve una brecha a un área distinta de la que ya le corresponde en el plan.

## Regla única propuesta

Para cada fila del Anexo A:

- **Bloque destino:** el bloque canónico de su tarea primaria.
- **Motivo de arrastre:** “La evidencia material depende de la tarea primaria y del paquete ya asignados. E1 conserva la línea base, la trazabilidad y el control; no declara la brecha cerrada.”
- **Control compensatorio:** “Se mantienen inmutables el responsable, la fecha, la tarea primaria, el paquete, el perfil y la evidencia fuente. La tarea primaria debe conservar la referencia a la brecha; antes de aprobar su bloque, se reevalúa su estado. Ninguna brecha crítica pendiente habilita operación productiva, corte o cierre por sí sola.”
- **Aprobación y fecha:** `PENDIENTE — OWN-GG`; solo se diligencian tras la aprobación explícita de Gobierno General.
- **Siguiente revisión propuesta:** `2026-08-21`, primer hito crítico del corte. Gobierno General puede confirmarla o reemplazarla al aprobar.

## Enrutamiento propuesto

| Destino propuesto | Brechas | Soporte canónico ya existente | Tratamiento |
|---|---:|---|---|
| E1 — corrección de puerta | 3 | `E1_DESCUBRIMIENTO_OPERATIVO/07_REGISTRO_CANONICO_DE_BRECHAS.md` | No se arrastran fuera de E1: se corrigen dentro de E1-GATE-001 y se vuelve a evaluar la puerta. |
| E2 — Procesos y experiencia | 13 | Catálogo, procesos transversales y requisitos no funcionales de E2 | Arrastre a E2. |
| E3 — Supabase | 2 | Auditoría integral de Supabase | Arrastre a E3. |
| F — ANIMA | 1 | Bloque F | Arrastre a F. |
| J — Acciones de servidor | 1 | Bloque J | Arrastre a J. |
| K — NEXO | 34 | Extensión de dominio LPN, contenedores activos y reutilizables | Arrastre a K. |
| L — FOGO | 9 | Bloque L y tareas derivadas OPS-AUD-001 | Arrastre a L. |
| M — ORIGO | 3 | Bloque M | Arrastre a M. |
| N — PULSO | 10 | Bloque N | Arrastre a N. |
| O — NUMERA | 12 | Mapa de alcance financiero | Arrastre a O. |
| U — Pruebas integrales | 2 | Bloque U | Arrastre a U. |
| V — PASS | 2 | Bloque V | Arrastre a V. |
| W — AURA | 10 | Bloque W | Arrastre a W. |
| X — Integraciones | 8 | Bloque X | Arrastre a X. |
| Z — Tecnología y soporte | 13 | Bloque Z | Arrastre a Z. |
| AA — Gobierno de información | 13 | Bloque AA | Arrastre a AA. |
| AB — Analítica, indicadores y datos maestros | 1 | Bloque AB | Arrastre a AB. |
| AC — Continuidad operativa y recuperación | 1 | Bloque AC | Arrastre a AC. |
| **Total** | **138** | Anexo A completo | — |

## Casos que permanecen en E1

Estas tres filas no deben presentarse como arrastre a otro bloque, porque su tarea primaria pertenece al propio control E1:

| Brecha | Tarea primaria | Acción propuesta |
|---|---|---|
| `H-CAP-SCOPE-019-006` | `GAP-CTRL-008` | Completar su evidencia de control y reevaluarla en E1-GATE-001. |
| `H-CAP-SCOPE-019-014` | `GAP-CTRL-007` | Completar su evidencia de control y reevaluarla en E1-GATE-001. |
| `H-CAP-SCOPE-019-015` | `GAP-CTRL-007` | Completar su evidencia de control y reevaluarla en E1-GATE-001. |

## Decisión registrada

Gobierno General aprobó esta propuesta el `2026-07-25`. La aplicación quedó registrada en `E1-GATE-MANIFEST-002`:

1. se aprobaron 135 arrastres por bloque;
2. se confirmó la fecha de revisión `2026-08-21`;
3. se registró `OWN-GG` como aprobador.

La reejecución no aprueba E1: quedan tres correcciones internas que no pueden arrastrarse a la propia fase. E1 solo podrá pasar cuando esas tres brechas produzcan evidencia y una nueva puerta resulte `PASS` o `PASS_WITH_CARRYOVER`.
