# E1-GATE-MANIFEST-002 — Reejecución posterior a aprobación de arrastres

## Identidad y aprobación

| Campo | Valor |
| --- | --- |
| `gate_id` | `E1-GATE-MANIFEST-002` |
| `phase_id` | `E1` |
| `phase_version` | `2026-07-25` |
| `evaluated_at` | `2026-07-25` |
| `approved_by` | `OWN-GG` |
| `approved_at` | `2026-07-25` |
| `approval_scope` | Regla de arrastre y fecha de revisión `2026-08-21`, según `E1_GATE_ARRASTRE_PROPUESTA_001.md`. |
| `evidence_location` | Anexo A de `07_REGISTRO_CANONICO_DE_BRECHAS.md`; `E1_GATE_ARRASTRE_PROPUESTA_001.md`; este manifiesto. |

La aprobación no declara cerrada ninguna brecha ni aprueba el cierre de E1. Autoriza únicamente los arrastres que cumplen el contrato y conserva las tres brechas cuyo cierre depende del propio control E1 como correcciones internas obligatorias.

## Contrato común de los 135 arrastres aprobados

| Campo | Valor aprobado |
| --- | --- |
| `carryover_reason` | La evidencia material depende de la tarea primaria y del paquete ya asignados. E1 conserva la línea base, la trazabilidad y el control; no declara la brecha cerrada. |
| `compensating_control` | Se mantienen inmutables el responsable, la fecha, la tarea primaria, el paquete, el perfil y la evidencia fuente. La tarea primaria debe conservar la referencia a la brecha; antes de aprobar su bloque, se reevalúa su estado. Ninguna brecha crítica pendiente habilita operación productiva, corte o cierre por sí sola. |
| `carryover_approved_by` | `OWN-GG` |
| `carryover_approved_at` | `2026-07-25` |
| `next_gate_date` | `2026-08-21` |

## Matriz exacta de arrastres aprobados

Cada identificador de esta matriz declara el bloque indicado como `target_phase` y hereda íntegramente el contrato común anterior. La tarea primaria de cada fila del Anexo A pertenece al bloque de destino señalado.

| `target_phase` | Brechas | Identificadores cubiertos |
| --- | ---: | --- |
| `E2_PROCESOS_Y_EXPERIENCIA` | 13 | `EQG-055`, `H-CAP-COVER-010-002`, `H-CAP-COVER-011-005`, `H-CAP-SCOPE-006-007`, `H-CAP-SCOPE-006-016`, `H-CAP-SCOPE-009-004`, `H-CAP-SCOPE-009-008`, `H-CAP-SCOPE-009-010`, `H-CAP-SCOPE-011-027`, `H-CAP-SCOPE-019-001`, `H-CAP-SCOPE-019-002`, `H-CAP-SCOPE-019-003`, `H-CAP-SCOPE-019-007` |
| `E3_SUPABASE` | 2 | `H-CAP-SCOPE-004-002`, `H-CAP-SCOPE-006-008` |
| `F_ANIMA` | 1 | `H-CAP-SCOPE-002-006` |
| `J_ACCIONES_DE_SERVIDOR` | 1 | `H-CAP-SCOPE-011-016` |
| `K_NEXO` | 34 | `H-CAP-SCOPE-006-004`, `H-CAP-SCOPE-006-005`, `H-CAP-SCOPE-007-003`, `H-CAP-SCOPE-007-004`, `H-CAP-SCOPE-007-005`, `H-CAP-SCOPE-007-009`, `H-CAP-SCOPE-008-006`, `H-CAP-SCOPE-011-002`, `H-CAP-SCOPE-011-003`, `H-CAP-SCOPE-011-004`, `H-CAP-SCOPE-011-005`, `H-CAP-SCOPE-011-006`, `H-CAP-SCOPE-011-009`, `H-CAP-SCOPE-011-010`, `H-CAP-SCOPE-011-011`, `H-CAP-SCOPE-011-012`, `H-CAP-SCOPE-011-014`, `H-CAP-SCOPE-011-017`, `H-CAP-SCOPE-011-018`, `H-CAP-SCOPE-011-019`, `H-CAP-SCOPE-013-002`, `H-CAP-SCOPE-013-004`, `H-CAP-SCOPE-013-005`, `H-CAP-SCOPE-013-006`, `H-CAP-SCOPE-013-009`, `H-CAP-SCOPE-013-011`, `H-CAP-SCOPE-013-012`, `H-CAP-SCOPE-013-014`, `H-CAP-SCOPE-013-017`, `H-CAP-SCOPE-013-018`, `H-CAP-SCOPE-013-019`, `H-CAP-SCOPE-013-021`, `H-CAP-SCOPE-013-023`, `H-CAP-SCOPE-013-025` |
| `L_FOGO` | 9 | `H-CAP-SCOPE-008-002`, `H-CAP-SCOPE-008-004`, `H-CAP-SCOPE-008-007`, `H-CAP-SCOPE-008-009`, `H-CAP-SCOPE-008-013`, `H-CAP-SCOPE-008-017`, `H-CAP-SCOPE-008-019`, `H-CAP-SCOPE-008-021`, `H-CAP-SCOPE-008-023` |
| `M_ORIGO` | 3 | `H-CAP-SCOPE-005-004`, `H-CAP-SCOPE-005-006`, `H-CAP-SCOPE-005-012` |
| `N_PULSO` | 10 | `H-CAP-SCOPE-009-001`, `H-CAP-SCOPE-009-006`, `H-CAP-SCOPE-009-009`, `H-CAP-SCOPE-009-017`, `H-CAP-SCOPE-009-018`, `H-CAP-SCOPE-009-021`, `H-CAP-SCOPE-009-022`, `H-CAP-SCOPE-011-021`, `H-CAP-SCOPE-011-022`, `H-CAP-SCOPE-011-024` |
| `O_NUMERA` | 12 | `H-CAP-SCOPE-012-003`, `H-CAP-SCOPE-012-004`, `H-CAP-SCOPE-012-007`, `H-CAP-SCOPE-012-008`, `H-CAP-SCOPE-012-010`, `H-CAP-SCOPE-012-011`, `H-CAP-SCOPE-012-013`, `H-CAP-SCOPE-012-014`, `H-CAP-SCOPE-012-015`, `H-CAP-SCOPE-012-020`, `H-CAP-SCOPE-012-021`, `H-CAP-SCOPE-012-030` |
| `U_PRUEBAS_INTEGRALES` | 2 | `H-CAP-SCOPE-008-024`, `H-CAP-SCOPE-011-023` |
| `V_PASS` | 2 | `H-CAP-SCOPE-009-025`, `H-CAP-SCOPE-014-026` |
| `W_AURA` | 10 | `H-CAP-SCOPE-014-002`, `H-CAP-SCOPE-014-006`, `H-CAP-SCOPE-014-007`, `H-CAP-SCOPE-014-011`, `H-CAP-SCOPE-014-013`, `H-CAP-SCOPE-014-017`, `H-CAP-SCOPE-014-019`, `H-CAP-SCOPE-014-020`, `H-CAP-SCOPE-014-022`, `H-CAP-SCOPE-014-024` |
| `X_INTEGRACIONES` | 8 | `H-CAP-SCOPE-004-013`, `H-CAP-SCOPE-006-010`, `H-CAP-SCOPE-006-011`, `H-CAP-SCOPE-009-019`, `H-CAP-SCOPE-009-026`, `H-CAP-SCOPE-009-027`, `H-CAP-SCOPE-012-017`, `H-CAP-SCOPE-019-005` |
| `Z_TECNOLOGIA_Y_SOPORTE` | 13 | `EQG-053`, `H-CAP-SCOPE-015-003`, `H-CAP-SCOPE-015-007`, `H-CAP-SCOPE-015-008`, `H-CAP-SCOPE-015-009`, `H-CAP-SCOPE-015-012`, `H-CAP-SCOPE-015-013`, `H-CAP-SCOPE-015-014`, `H-CAP-SCOPE-015-018`, `H-CAP-SCOPE-015-021`, `H-CAP-SCOPE-015-025`, `H-CAP-SCOPE-015-026`, `H-CAP-SCOPE-019-008` |
| `AA_GOBIERNO_DE_INFORMACION` | 13 | `H-CAP-SCOPE-016-002`, `H-CAP-SCOPE-016-003`, `H-CAP-SCOPE-016-007`, `H-CAP-SCOPE-016-008`, `H-CAP-SCOPE-016-013`, `H-CAP-SCOPE-016-014`, `H-CAP-SCOPE-016-022`, `H-CAP-SCOPE-016-026`, `H-CAP-SCOPE-016-028`, `H-CAP-SCOPE-016-029`, `H-CAP-SCOPE-016-030`, `H-CAP-SCOPE-016-031`, `H-CAP-SCOPE-019-011` |
| `AB_ANALITICA_INDICADORES_Y_DATOS_MAESTROS` | 1 | `H-CAP-COVER-001-009` |
| `AC_CONTINUIDAD_OPERATIVA_Y_RECUPERACION` | 1 | `H-CAP-SCOPE-019-012` |
| **Total con arrastre aprobado** | **135** | — |

## Correcciones que permanecen en E1

Las siguientes brechas no pueden arrastrarse a E1: una fase no puede usarse como su propio destino para declarar su cierre. Deben producir evidencia de corrección mediante sus tareas primarias y luego someterse de nuevo a la puerta.

| Brecha | Tarea primaria | Estado | Acción de cierre requerida |
| --- | --- | --- | --- |
| `H-CAP-SCOPE-019-006` | `GAP-CTRL-008` | `PENDING_E1_REMEDIATION` | Demostrar que `BUILD` no puede avanzar a implementación sin pasar por E2–E5. |
| `H-CAP-SCOPE-019-014` | `GAP-CTRL-007` | `PENDING_E1_REMEDIATION` | Definir criterio y evidencia verificable de cierre. |
| `H-CAP-SCOPE-019-015` | `GAP-CTRL-007` | `PENDING_E1_REMEDIATION` | Definir criterio y evidencia verificable de cierre. |

## Resultado de TREQ-GAP-001

| Arreglo de control | Resultado |
| --- | ---: |
| `critical_gap_count` | 138 |
| `critical_with_approved_carryover[]` | 135 |
| `critical_without_target_phase[]` | 3 |
| `critical_without_carryover_reason[]` | 3 |
| `critical_without_compensating_control[]` | 3 |
| `critical_without_approval[]` | 3 |
| `critical_pending_e1_remediation[]` | 3 |

```text
gate_status = BLOCKED_ROUTING
blocking_reasons[] = [
  "H-CAP-SCOPE-019-006 debe producir evidencia de GAP-CTRL-008 antes de cierre de E1.",
  "H-CAP-SCOPE-019-014 y H-CAP-SCOPE-019-015 deben producir criterio y evidencia de cierre mediante GAP-CTRL-007.",
  "Las tres brechas no pueden usar E1 como target_phase de su propio cierre."
]
next_gate_date = 2026-08-21
```

## Decisión de la puerta

La aprobación de Gobierno General regulariza el arrastre de 135 brechas y reduce el bloqueo de 138 a 3 brechas concretas. E1 sigue sin aprobarse, `PROC-CAT-001` no queda habilitada y BLOQUE E2 no inicia hasta corregir esas tres brechas y ejecutar una nueva puerta con resultado `PASS` o `PASS_WITH_CARRYOVER`.
