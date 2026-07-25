# E1-CLOSE-001 — Evidencia candidata para las tres correcciones internas

**Estado:** `CERRADA`
**Alcance:** `H-CAP-SCOPE-019-006`, `H-CAP-SCOPE-019-014`, `H-CAP-SCOPE-019-015`
**Aprobación documental:** `OWN-GG`, `2026-07-25`
**No implica:** aprobación de E1, inicio de E2 ni autorización de implementación.

## Regla común de validación

Cada cierre usa el perfil `CLOSE-CON-CTR`. Será válido únicamente si el contrato queda versionado en la fuente canónica, se puede trazar desde la brecha a su tarea y paquete, y su cumplimiento se verifica mediante los casos definidos abajo. La aprobación de un documento aislado no basta.

| Campo | Valor |
| --- | --- |
| `closure_profile_id` | `CLOSE-CON-CTR` |
| `validator` | `OWN-OPS` |
| `co_validator` | `OWN-TEC` |
| Evidencia mínima | `EV-01`, `EV-02`, `EV-05`, `EV-11`, `EV-17` |
| Rechazo | `RJ-CON-CTR` si falta versionado, adopción, trazabilidad, errores o prueba de compatibilidad. |

## 1. H-CAP-SCOPE-019-006 — Ningún BUILD autoriza implementación

### Contrato de fase

`BUILD` describe una necesidad o una intención de evolución; nunca es una autorización para crear código, migraciones, paquetes de implementación, piloto, despliegue o cambio productivo.

La única secuencia válida es:

```text
E1-GATE-001 = PASS o PASS_WITH_CARRYOVER
        ↓
PROC-CAT-001 y las tareas aprobadas de E2
        ↓
diseño y decisiones aprobadas de E3/E4 cuando correspondan
        ↓
paquete autorizado de E5
        ↓
implementación, pruebas, piloto y despliegue
```

Mientras E1 esté bloqueado, ningún marcador `BUILD` puede usarse como evidencia de autorización. Si aparece una tarea de implementación antes de esa secuencia, debe registrarse como violación de puerta y E1 permanece bloqueado.

### Evidencia candidata

| Evidencia | Ubicación o prueba |
| --- | --- |
| `EV-01` | El contrato anterior, junto con la condición de transición de `E1-GATE-001`. |
| `EV-02` | `H-CAP-SCOPE-019-006` → `GAP-CTRL-008` → `GAP-PKG-049` → `E1-GATE-001`. |
| `EV-05` | Revisar tres escenarios: E1 bloqueado no habilita E2; E1 aprobado habilita primero `PROC-CAT-001`; ningún paquete E5 se habilita solo por tener estado `BUILD`. |
| `EV-11` | Cada ejecución de puerta conserva `gate_status`, razones de bloqueo y fecha del siguiente gate. |
| `EV-17` | El orden de transición y el manifiesto deben declarar la misma secuencia. |

## 2. H-CAP-SCOPE-019-014 — El cambio de propietario no reescribe historia

### Contrato de propiedad versionada

Todo cambio de propietario conserva el registro anterior y crea una transición nueva; no se permiten actualizaciones destructivas de historial. La transición debe contener:

```text
ownership_transition_id
affected_gap_or_capability_id
previous_owner
next_owner
effective_at
decision_authority
reason
affected_consumers[]
handover_evidence
rollback_or_reversal_rule
```

Los consumidores históricos continúan resolviendo el propietario que estaba vigente en su fecha de decisión. La vista vigente puede mostrar el nuevo propietario, pero debe enlazar la transición y no sustituir la evidencia anterior. Sin esa transición, el cambio se rechaza y la brecha permanece abierta.

### Evidencia candidata

| Evidencia | Ubicación o prueba |
| --- | --- |
| `EV-01` | Contrato de propiedad versionada de esta sección. |
| `EV-02` | `H-CAP-SCOPE-019-014` → `GAP-CTRL-007` → `GAP-PKG-031`; transición futura vinculada a `SUPA-TRANS-*` cuando haya soporte físico. |
| `EV-05` | Probar un cambio de propietario: la consulta histórica conserva el anterior, la vista vigente muestra el nuevo y ambos exponen el mismo identificador de transición. |
| `EV-11` | La transición debe generar auditoría con actor, fecha, decisión y consumidores afectados. |
| `EV-17` | La transición no rompe referencias históricas ni contratos de consumidores. |

## 3. H-CAP-SCOPE-019-015 — Un cierre local no oculta efectos externos

### Contrato de cierre multidominio

Una brecha con efectos en más de un dominio solo puede marcarse `CERRADA` cuando todos sus efectos dependientes estén explícitamente resueltos, arrastrados con aprobación vigente o retirados del alcance mediante decisión versionada. El manifiesto de cierre debe contener:

```text
closure_id
source_gap_id
affected_domains[]
dependent_tasks[]
dependency_status_by_domain[]
evidence_by_domain[]
open_effects[]
approved_carryovers[]
final_validator_decision
```

Si cualquiera de los dominios afectados tiene un efecto abierto sin arrastre aprobado, el cierre local se rechaza. La tarea `INT-POS-021` y los `TREQ-INTEGRATION-*` aplicables deberán aportar la evidencia de implementación cuando la brecha alcance E4/E5; esta regla no los declara ejecutados.

### Evidencia candidata

| Evidencia | Ubicación o prueba |
| --- | --- |
| `EV-01` | Contrato de cierre multidominio de esta sección. |
| `EV-02` | `H-CAP-SCOPE-019-015` → `GAP-CTRL-007` → `GAP-PKG-037` → `INT-POS-021` y `TREQ-INTEGRATION-*` aplicables. |
| `EV-05` | Probar un cierre con dos dominios: uno pendiente sin arrastre aprobado debe rechazar el cierre; con todos los dominios resueltos o arrastrados debe permitir validación. |
| `EV-11` | El manifiesto de cierre registra la decisión por dominio y sus efectos abiertos. |
| `EV-17` | Productores y consumidores mantienen compatibilidad hasta que cada efecto dependiente tenga resolución o transición explícita. |

## Resultado de preparación

| Brecha | Tarea primaria | Resultado | Siguiente acción |
| --- | --- | --- | --- |
| `H-CAP-SCOPE-019-006` | `GAP-CTRL-008` | `CERRADA` | Contrato de fase aprobado; los tres escenarios quedan como prueba obligatoria de cada ejecución de puerta. |
| `H-CAP-SCOPE-019-014` | `GAP-CTRL-007` | `CERRADA` | Contrato de propiedad versionada aprobado; toda futura transición debe conservar historial y consumidores. |
| `H-CAP-SCOPE-019-015` | `GAP-CTRL-007` | `CERRADA` | Contrato de cierre multidominio aprobado; todo efecto externo debe quedar resuelto o arrastrado explícitamente. |

La aprobación explícita de `OWN-GG` del `2026-07-25` registra estas tres brechas como `CERRADA` con evidencia documental. Si durante una ejecución futura se detecta que alguno de los contratos no se adopta o no supera sus casos de prueba, la brecha deberá pasar a `REABIERTA` y E1 se reevaluará.
