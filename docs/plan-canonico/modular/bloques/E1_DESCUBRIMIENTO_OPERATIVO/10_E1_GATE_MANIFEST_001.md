# E1-GATE-MANIFEST-001 — Primera ejecución de puerta de cierre de BLOQUE E1

> **Evidencia histórica.** Este manifiesto conserva la primera ejecución y su resultado `BLOCKED_ROUTING`. La interpretación que exigía materializar razón, control compensatorio y aprobación individual para las 138 brechas fue considerada desproporcionada para descubrimiento. La propuesta corregida está en `E1-GATE-MANIFEST-002`; el manifiesto `001` no se elimina ni se presenta como resultado vigente.

## Identidad y evidencia

| Campo                       | Valor                                                                                                            |
| --------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| `gate_id`                   | `E1-GATE-MANIFEST-001`                                                                                           |
| `phase_id`                  | `E1`                                                                                                             |
| `phase_version`             | `2026-07-25`                                                                                                     |
| `source_commit_or_revision` | `6032783aaeb82797b3207aa604548ab5a0b6b7b6`                                                                       |
| `evaluated_at`              | `2026-07-25`                                                                                                     |
| `evaluated_by`              | revisión documental reproducible sobre las fuentes canónicas compiladas                                          |
| `approved_by`               | `PENDIENTE — OWN-GG`                                                                                             |
| `evidence_location`         | `07_REGISTRO_CANONICO_DE_BRECHAS.md`, Anexo A; `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`; `E1-GATE-001` |

## Conjunto crítico reconciliado

| Control                |                                  Resultado |
| ---------------------- | -----------------------------------------: |
| `critical_gap_count`   |                                    **138** |
| Identificadores únicos |                                    **138** |
| Con propietario válido |                                    **138** |
| Con fecha de decisión  |                                    **138** |
| Con tarea primaria     |                                    **138** |
| Con paquete            |                                    **138** |
| Con perfil de cierre   |                                    **138** |
| Estado fuente          | `OWNER_ASSIGNED_GATE_PENDING` para las 138 |

`critical_gap_ids[]` corresponde exactamente a las 138 filas del Anexo A de `07_REGISTRO_CANONICO_DE_BRECHAS.md`: `EQG-053`, `EQG-055`, 3 identificadores `H-CAP-COVER-*` y 133 identificadores `H-CAP-SCOPE-*`. La serialización UTF-8 de esas 138 filas tiene SHA-256 `6315e22660d9058d6e9ff0120c6d90a60d58d00951a64dc5c5c5d5c18ca60754`; cualquier nueva ejecución deberá reproducir ese conjunto o documentar una versión aprobada distinta.

## Resultado de TREQ-GAP-001

| Arreglo de control                        |                                   Resultado |
| ----------------------------------------- | ------------------------------------------: |
| `critical_without_owner[]`                |                                           0 |
| `critical_without_due_date[]`             |                                           0 |
| `critical_without_task[]`                 |                                           0 |
| `critical_without_package[]`              |                                           0 |
| `critical_without_closure_profile[]`      |                                           0 |
| `critical_without_target_phase[]`         |                                         138 |
| `critical_without_carryover_reason[]`     |                                         138 |
| `critical_without_compensating_control[]` |                                         138 |
| `critical_without_approval[]`             |                                         138 |
| `critical_with_expired_carryover[]`       | 0 — no existe arrastre aprobado que evaluar |
| `critical_closed_with_valid_evidence[]`   |                                           0 |
| `critical_open_with_approved_carryover[]` |                                           0 |

```text
gate_status = BLOCKED_ROUTING
blocking_reasons[] = [
  "Las 138 brechas críticas abiertas no declaran target_phase.",
  "Las 138 brechas críticas abiertas no declaran carryover_reason ni compensating_control.",
  "Las 138 brechas críticas abiertas no tienen carryover_approved_by, carryover_approved_at ni next_gate_date.",
  "No existe approved_by = OWN-GG para autorizar el cierre de E1."
]
next_gate_date = PENDIENTE_DE_DEFINIR_POR_OWN_GG
```

## Decisión de la puerta

La puerta produce un estado permitido por `TREQ-GAP-001`: `BLOCKED_ROUTING`. No existe brecha crítica sin propietario válido, pero el contrato de arrastre está incompleto para todas las brechas abiertas. Por tanto, no se aprueba el cierre de E1, no se habilita `PROC-CAT-001` y no se inicia BLOQUE E2.

## Condición histórica de reejecución

Esta ejecución concluyó originalmente que debían completarse campos individuales de arrastre. Esa condición queda conservada como historial, pero fue reemplazada por la regla proporcional de `E1-GATE-MANIFEST-002`: en descubrimiento el destino se deriva, la continuidad se aprueba sobre la línea base y los controles compensatorios solo se exigen si existe exposición operativa.
