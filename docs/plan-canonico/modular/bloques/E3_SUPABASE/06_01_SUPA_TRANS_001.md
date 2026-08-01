### ✅ SUPA-TRANS-001 — Mapear cada objeto actual hacia la arquitectura objetivo

**Estado:** APROBADA  
**Fecha de preparación documental:** 2026-07-31  
**Bloque propietario:** BLOQUE E3 — Arquitectura canónica de datos y gobierno integral de Supabase  
**Tarea anterior:** `SUPA-ARC-025 — Consolidar y aprobar ADR de arquitectura canónica de datos` — APROBADA  
**Tarea siguiente:** `SUPA-TRANS-002 — Clasificar cada objeto como conservar, mover, fusionar, dividir, renombrar o retirar` — APROBADA
**Tipo de tarea:** mapeo documental y técnico read-only AS-IS → arquitectura objetivo; sin DDL, DML, cambios de configuración, migraciones nuevas, backfills, renombres, retiros ni despliegues

#### 1. Resultado concreto

Esta tarea **materializa el mapeo real objeto por objeto**. No se limita a definir un protocolo.

Se entregan conjuntamente dos componentes inseparables:

1. esta sección canónica, que fija el alcance, las reglas y el resultado aprobado;
2. el archivo ejecutable read-only `SUPA-TRANS-001_TRANSITION_MAP.sql`, que produce una fila de correspondencia por cada objeto actual cubierto.

El artefacto resultante es:

```text
TRANSITION-MAP-001@1.0.0
```

Artefacto canónico asociado:

```text
docs/plan-canonico/modular/bloques/E3_SUPABASE/SUPA-TRANS-001_TRANSITION_MAP.sql
```

La sección canónica y el artefacto SQL representan conjuntamente el resultado de `SUPA-TRANS-001`.

#### 2. Qué responde cada fila del mapa

Cada fila identifica:

```text
objeto actual exacto
→ clase técnica actual
→ estado actual
→ frontera de producto
→ capacidad empresarial actual
→ propietario actual
→ consumidores actuales
→ estado de ownership
→ dominio o clase lógica objetivo
→ rol lógico objetivo
→ modo de autoridad
→ contrato objetivo
→ límite de seguridad
→ dependencias de transición
→ clave estable de transición
→ estado del mapeo
→ disposición reservada para SUPA-TRANS-002
→ evidencia
```

Campos materializados por el SQL:

```text
current_object_key
current_object_class
current_source_status
current_product_boundary
current_capability_key
current_owner
current_consumers
current_ownership_state
target_domain_or_special_class
target_component_role
target_authority_mode
target_contract_mode
target_security_boundary
target_compatibility_dependencies
target_transition_key
mapping_status
disposition_status
evidence_refs
```

#### 3. Cobertura materializada

El mapa produce **970 filas lógicas**:

| Clase                                      |   Filas |
| ------------------------------------------ | ------: |
| relaciones PostgreSQL gobernadas por Vento | **379** |
| funciones PostgreSQL                       | **348** |
| triggers empresariales no internos         | **197** |
| buckets de Storage                         |  **14** |
| Edge Functions activas                     |  **24** |
| cron jobs                                  |   **7** |
| evidencia de la migración mensual de VISO  |   **1** |
| **Total**                                  | **970** |

Las 379 relaciones están cerradas así:

```text
379 RELACIONES
├── 323 VENTO OS vinculadas a CAP-01…CAP-18
├──  54 VITAL, separadas de Vento OS
└──   2 TEMPORARY_OR_LEGACY
```

Distribución verificada:

| Capacidad o clase       | Objetos |
| ----------------------- | ------: |
| `CAP-01`                |       9 |
| `CAP-02`                |      63 |
| `CAP-04`                |      39 |
| `CAP-05`                |       9 |
| `CAP-06`                |      35 |
| `CAP-07`                |      12 |
| `CAP-08`                |      14 |
| `CAP-09`                |      37 |
| `CAP-10`                |      26 |
| `CAP-11`                |      21 |
| `CAP-12`                |      19 |
| `CAP-14`                |       4 |
| `CAP-15`                |      27 |
| `CAP-16`                |       5 |
| `CAP-17`                |       2 |
| `CAP-18`                |       1 |
| `NO_CAPACITY_TEMPORARY` |       2 |
| `OUTSIDE_VENTO_OS`      |      54 |
| **Total**               | **379** |

No existen relaciones sin clasificación. La ausencia actual de relaciones principales para `CAP-03` y `CAP-13` se conserva como hecho del AS-IS; esta tarea no inventa objetos para cubrirlas.

#### 4. Fuentes utilizadas

| Fuente                          | Aporte                                                                                                                                          |
| ------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `SUPA-AUD-022`                  | identidad, clase, capacidad preliminar, propietario y consumidores de las 379 relaciones; reglas para funciones, triggers, Storage, Edge y cron |
| `SUPA-AUD-023`                  | procesos, datos, RPC, eventos y aplicaciones relacionados                                                                                       |
| `SUPA-AUD-024`                  | criticidad, deuda y riesgos condicionantes                                                                                                      |
| `SUPA-ARC-001` a `SUPA-ARC-025` | dominios, fuentes de verdad, capas, autoridad, seguridad, contratos, compatibilidad y ADR aprobado                                              |
| Supabase `vento-os-dev`         | catálogo remoto read-only del 2026-07-31                                                                                                        |
| `06_PLAN_DE_TRANSICION.md`      | continuidad de `SUPA-TRANS-*` y delta mensual de VISO                                                                                           |

El mapa reutiliza las identidades ya auditadas y añade su coordenada lógica objetivo. No reconstruye el inventario por semejanza de nombres ni modifica el AS-IS aprobado.

#### 5. Clave estable

Cada objeto obtiene una clave determinista:

```text
TRANS::<current_object_class>::<current_object_key>
```

Para objetos derivados:

```text
TRANS::<derived_class>::<parent_object_key>::<derived_object_key>
```

La clave no representa un nombre físico futuro. Permanece estable durante `SUPA-TRANS-002` a `SUPA-TRANS-015` y permite agregar disposición, dependencias, orden, backfill, compatibilidad, pruebas y rollback sin perder la identidad actual.

#### 6. Correspondencia objetivo utilizada

| Capacidad                | Dominio lógico objetivo                 |
| ------------------------ | --------------------------------------- |
| `CAP-01`                 | `OPERATING_STRUCTURE_AND_GOVERNANCE`    |
| `CAP-02`                 | `WORKFORCE_AND_WORK`                    |
| `CAP-04`                 | `PRODUCT_CATALOG_AND_KNOWLEDGE`         |
| `CAP-05`                 | `PROCUREMENT`                           |
| `CAP-06`                 | `INVENTORY_AND_STORAGE`                 |
| `CAP-07`                 | `ASSETS_AND_REUSABLES`                  |
| `CAP-08`                 | `PRODUCTION`                            |
| `CAP-09`                 | `ORDERS_SALES_AND_COLLECTION`           |
| `CAP-10`                 | `CUSTOMERS_AND_RELATIONSHIPS`           |
| `CAP-11`                 | `TRANSPORT_DISPATCH_AND_DELIVERY`       |
| `CAP-12`                 | `FINANCE_COSTS_AND_OBLIGATIONS`         |
| `CAP-14`                 | `COMMUNICATION_AND_PROMOTION`           |
| `CAP-15`                 | `TECHNOLOGY_AND_SUPPORT`                |
| `CAP-16`                 | `INFORMATION_DOCUMENTS_AND_EVIDENCE`    |
| `CAP-17`                 | `MEASUREMENT_ANALYTICS_AND_IMPROVEMENT` |
| `CAP-18`                 | `CONTINUITY_AND_INCIDENTS`              |
| VITAL                    | `VITAL_PRODUCT_BOUNDARY`                |
| backup, staging o legacy | `TEMPORARY_OR_LEGACY`                   |

Roles lógicos usados:

```text
AGGREGATE
REFERENCE
LEDGER
HISTORY
PROJECTION
ENDPOINT
AUTOMATION
FILE
ADAPTER
SUPPORT
VITAL
TEMPORARY
```

Contratos usados:

```text
COMMAND
QUERY
REFERENCE
DOMAIN_EVENT
PROJECTION
FILE_ASSET
JOB
AUDIT
COMPATIBILITY
PLATFORM_INTERNAL
```

#### 7. Cómo se materializa por clase

##### 7.1. Relaciones

Las 379 tablas y vistas se obtienen directamente de `pg_class` y `pg_namespace` para los nueve schemas gobernados por Vento:

```text
app_private
public
pass
payments
pos
viso
talento
club
vital
```

Cada relación conserva la capacidad, owner, consumidores y estado aprobados en `SUPA-AUD-022`. Las vistas de compatibilidad se mapean como `ADAPTER`; las demás vistas como `PROJECTION`. Las tablas se distinguen entre agregado, referencia, ledger, historia, proyección, VITAL o temporal según su función actual y evidencia disponible.

##### 7.2. Funciones

Las 348 firmas se identifican mediante:

```text
<schema>.<function_name>(identity_arguments)
```

- una función de trigger hereda capacidad, owner, consumidores y dominio de la relación padre;
- una función no enlazada a trigger recibe una primera correspondencia por schema y efecto observable;
- esa correspondencia queda marcada `DEPENDENCY_REFINEMENT_SUPA_TRANS_003` hasta completar el grafo de dependencias;
- las funciones `SECURITY DEFINER` quedan en `SECURITY_DEFINER_REVIEW`;
- no se declara una función como fuente de verdad por el solo hecho de realizar escrituras.

##### 7.3. Triggers

Los 197 triggers no internos se mapean individualmente mediante:

```text
<relation_key>::trigger::<trigger_name>
```

Herederan capacidad, owner y dominio de la relación padre, pero conservan función ejecutora, privilegio y clave de transición propios.

##### 7.4. Storage

Los 14 buckets se mapean de manera explícita, con capacidad, owner, consumidores y frontera pública o privada. El mapa no cambia visibilidad ni policies.

##### 7.5. Edge Functions

Las 24 Edge Functions activas se mapean explícitamente por `slug`, capacidad, owner, consumidores y estado de verificación JWT observado. Una Edge Function se clasifica como endpoint o adaptador; no adquiere autoridad empresarial por utilizar `service_role`.

##### 7.6. Cron

Los siete jobs se mapean por nombre, capacidad, owner, dominio, schedule actual y ejecutor. Un resultado `succeeded` del scheduler no se interpreta como éxito empresarial completo.

#### 8. Muestras verificables del resultado

| Objeto actual                                                              | Clase         | Coordenada objetivo                        | Rol                                             | Owner actual                   | Estado                             |
| -------------------------------------------------------------------------- | ------------- | ------------------------------------------ | ----------------------------------------------- | ------------------------------ | ---------------------------------- |
| `public.employee_shifts`                                                   | relación      | `WORKFORCE_AND_WORK` / `CAP-02`            | `AGGREGATE` o ledger según transición posterior | ANIMA                          | `MAPPED_CURRENT_TO_LOGICAL_TARGET` |
| `public.products`                                                          | relación      | `PRODUCT_CATALOG_AND_KNOWLEDGE` / `CAP-04` | `AGGREGATE`                                     | NEXO                           | `MAPPED_CURRENT_TO_LOGICAL_TARGET` |
| `public.inventory_movements`                                               | relación      | `INVENTORY_AND_STORAGE` / `CAP-06`         | `LEDGER`                                        | NEXO                           | `MAPPED_CURRENT_TO_LOGICAL_TARGET` |
| `public.orders`                                                            | relación      | `ORDERS_SALES_AND_COLLECTION` / `CAP-09`   | `AGGREGATE`                                     | PASS/PULSO                     | `MAPPED_CURRENT_TO_LOGICAL_TARGET` |
| `public.product_categories_backup_20260316_preparaciones`                  | relación      | `TEMPORARY_OR_LEGACY`                      | `TEMPORARY`                                     | custodio técnico `vento-shell` | `MAPPED_TEMPORARY_OR_LEGACY`       |
| `vital.user_profiles`                                                      | relación      | `VITAL_PRODUCT_BOUNDARY`                   | `VITAL`                                         | VITAL                          | `MAPPED_VITAL_SEPARATE_PRODUCT`    |
| `public.viso_enforce_monthly_schedule_publish_limit()`                     | función       | `WORKFORCE_AND_WORK` / `CAP-02`            | `AUTOMATION`                                    | heredado de turnos             | `MAPPED_BY_TRIGGER_PARENT`         |
| `public.employee_shifts::trigger::trg_viso_monthly_schedule_publish_limit` | trigger       | `WORKFORCE_AND_WORK` / `CAP-02`            | `AUTOMATION`                                    | heredado de `employee_shifts`  | `MAPPED_BY_RELATION_PARENT`        |
| `edge.shift-runtime-processor`                                             | Edge Function | `WORKFORCE_AND_WORK` / `CAP-02`            | `ENDPOINT`                                      | ANIMA                          | `MAPPED_DEPLOYED_EDGE_FUNCTION`    |
| `cron.anima_shift_runtime_processor_every_5m`                              | cron          | `WORKFORCE_AND_WORK` / `CAP-02`            | `AUTOMATION`                                    | ANIMA                          | `MAPPED_CURRENT_TO_LOGICAL_TARGET` |

La tabla anterior es solo una muestra legible. Las 970 filas completas se producen en `SUPA-TRANS-001_TRANSITION_MAP.sql`.

#### 9. Delta mensual de VISO incorporado

El corte remoto confirma:

| Identidad                                                     | Estado actual verificado                                                             | Correspondencia                                                                  |
| ------------------------------------------------------------- | ------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------- |
| `public.employee_shifts`                                      | tabla remota con RLS activo                                                          | `WORKFORCE_AND_WORK` / `CAP-02`                                                  |
| `public.viso_enforce_monthly_schedule_publish_limit()`        | función remota `SECURITY DEFINER`, owner PostgreSQL `postgres`, `search_path=public` | automatismo de validación y commit sujeto a revisión de seguridad y concurrencia |
| `trg_viso_monthly_schedule_publish_limit`                     | trigger `BEFORE INSERT OR UPDATE` row-level sobre `public.employee_shifts`           | automatismo defensivo heredado de la relación padre                              |
| `20260731082600_viso_monthly_schedule_186_hour_publish_guard` | migración registrada en remoto                                                       | evidencia AS-IS; no patrón físico estable                                        |

La función concede actualmente ejecución a `PUBLIC`, `postgres`, `authenticated` y `service_role`. Esta tarea **no valida ni aprueba** ese modelo de acceso: lo registra como estado actual y remite owner, grants, actor validation, `search_path`, concurrencia y pruebas negativas a `SUPA-TRANS-003`, `SUPA-TRANS-008`, `SUPA-TRANS-009` y `SUPA-TRANS-010`.

`11160` minutos y `186` horas permanecen como regla operativa provisional. No se convierten en constante de arquitectura canónica.

#### 10. Hallazgo VISO de RLS

Se observaron once tablas `viso.*` con RLS deshabilitado:

```text
viso.site_planning_rules
viso.site_staffing_requirements
viso.employee_availability
viso.employee_shift_preferences
viso.employee_planning_limits
viso.demand_history_hourly
viso.demand_forecasts
viso.shift_generation_runs
viso.shift_generation_candidates
viso.shift_generation_candidate_items
viso.site_operational_roles
```

No se activa RLS en esta tarea. Cada fila queda con `target_security_boundary = NON_RLS_PRIVATE_OR_BLOCKED_REVIEW` y con resolución asignada a:

- dependencias y consumidores: `SUPA-TRANS-003`;
- seguridad y rendimiento: `SUPA-TRANS-010`;
- paridad por ambientes: `SUPA-TRANS-013`;
- roadmap y gates: `SUPA-TRANS-015`.

#### 11. Disposición deliberadamente reservada

Todas las 970 filas contienen exactamente:

```text
disposition_status = RESERVED_FOR_SUPA_TRANS_002
```

Por tanto, esta tarea no decide:

- conservar;
- mover;
- fusionar;
- dividir;
- renombrar;
- retirar.

Tampoco inventa nombres futuros de schema, tabla, vista, función, trigger, bucket, Edge Function o job.

#### 12. Entrega a las tareas siguientes

| Decisión o trabajo pendiente        | Tarea propietaria |
| ----------------------------------- | ----------------- |
| disposición individual              | `SUPA-TRANS-002`  |
| dependencias completas              | `SUPA-TRANS-003`  |
| orden de migración                  | `SUPA-TRANS-004`  |
| backfills y calidad de datos        | `SUPA-TRANS-005`  |
| compatibilidad temporal             | `SUPA-TRANS-006`  |
| adaptación de consumidores          | `SUPA-TRANS-007`  |
| escrituras durante transición       | `SUPA-TRANS-008`  |
| pruebas antes y después             | `SUPA-TRANS-009`  |
| rendimiento y seguridad             | `SUPA-TRANS-010`  |
| rollback                            | `SUPA-TRANS-011`  |
| retiro legacy                       | `SUPA-TRANS-012`  |
| paridad local, staging y producción | `SUPA-TRANS-013`  |
| tipos, contratos y documentación    | `SUPA-TRANS-014`  |
| roadmap ejecutable                  | `SUPA-TRANS-015`  |

No queda una decisión diferida sin tarea responsable.

#### 13. Requisitos de prueba

**Resultado:** CONSERVA CUARENTA REQUISITOS CANÓNICOS Y ACTUALIZA SU EVIDENCIA.

`SUPA-TRANS-001` está protegido por `TREQ-SUPABASE-1696` a `TREQ-SUPABASE-1735`, además de los requisitos de auditoría y arquitectura relacionados. El rango cubre identidad, campos obligatorios, capacidad, roles, autoridad, funciones, triggers, RLS, Storage, Realtime, Edge Functions, cron, integraciones, VITAL, plataforma administrada, objetos temporales, bloqueos, contratos, dependencias, reproducibilidad y handoff a `SUPA-TRANS-002`.

La corrección conjunta con `SUPA-TRANS-002` no crea identificadores adicionales. Actualiza en el registro canónico `04A` el universo vigente de 348 funciones y 197 triggers, la evidencia de resolución de la reserva, el contrato de handoff para seis disposiciones y la última tarea incorporada.

#### 14. Evidencia histórica de validación consolidada

La evidencia antes almacenada en un `.txt` huérfano se integra aquí para conservar procedencia sin mantener un artefacto sin referencias:

- corte remoto read-only: `2026-07-31`, proyecto `vento-os-dev` (`clzdpinthhtknkmefsxx`), estado observado `ACTIVE_HEALTHY`, PostgreSQL `17.6.1`;
- universo observado: 379 relaciones —317 tablas y 62 vistas—, 348 funciones, 197 triggers empresariales, 14 buckets, 24 Edge Functions y 7 cron jobs;
- delta VISO observado: migración `20260731082600_viso_monthly_schedule_186_hour_publish_guard` y su función/trigger mensual materializados;
- no se ejecutó DDL, DML, migración ni modificación de configuración durante esa verificación;
- huella histórica del SQL: 868 líneas, 42.395 bytes UTF-8 y SHA-256 `b4e09b635facdc48c95728edbd5a867bf449e5d4da9ab3347cdff86df783a774`;
- resultado registrado: 970 filas, cero sentencias mutantes, cero disposiciones distintas de `RESERVED_FOR_SUPA_TRANS_002` y cero relaciones sin capacidad;
- la batería documental posterior fue ejecutada satisfactoriamente sobre el repositorio actualizado.

La huella histórica no sustituye el hash vigente del archivo cuando vuelva a usarse como evidencia. Los requisitos `TREQ-SUPABASE-423` a `454` y `TREQ-SUPABASE-1695` conservan su trazabilidad en el registro canónico `04A`.

#### 15. Criterios de aceptación

- [x] existe un mapa materializado, no únicamente una especificación;
- [x] el mapa cubre 970 identidades lógicas actuales;
- [x] las 379 relaciones aparecen una vez y ninguna queda sin capacidad;
- [x] las 348 funciones y 197 triggers conservan identidad individual;
- [x] Storage, Edge Functions y cron están incluidos;
- [x] Vento OS, VITAL y temporal/legacy permanecen separados;
- [x] `public` no se interpreta como dominio empresarial;
- [x] los objetos derivados heredan de su padre sin recibir ownership falso;
- [x] el delta mensual de VISO está incorporado;
- [x] los 11 objetos `viso.*` sin RLS tienen tarea de resolución;
- [x] todas las disposiciones permanecen reservadas para `SUPA-TRANS-002`;
- [x] no se inventan nombres físicos futuros;
- [x] no se ejecutan cambios remotos.

#### 16. Continuidad

```text
SUPA-ARC-025 — APROBADA
        ↓
SUPA-TRANS-001 — APROBADA; mapa canónico materializado
        ↓
SUPA-TRANS-002 — APROBADA; disposición canónica materializada
        ↓
SUPA-TRANS-003 — APROBADA; dependencias reconciliadas
```

Este registro histórico quedó reconciliado con las aprobaciones posteriores del bloque.
