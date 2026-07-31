### PLAN DE TRANSICIÓN

### ✅ SUPA-TRANS-001 — Mapear cada objeto actual hacia la arquitectura objetivo

**Estado:** APROBADA  
**Fecha de preparación documental:** 2026-07-31  
**Bloque propietario:** BLOQUE E3 — Arquitectura canónica de datos y gobierno integral de Supabase  
**Tarea anterior:** `SUPA-ARC-025 — Consolidar y aprobar ADR de arquitectura canónica de datos` — APROBADA  
**Siguiente tarea reservada:** `SUPA-TRANS-002 — Clasificar cada objeto como conservar, mover, fusionar, dividir, renombrar o retirar`  
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

#### 14. Criterios de aceptación

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

#### 15. Continuidad

```text
SUPA-ARC-025 — APROBADA
        ↓
SUPA-TRANS-001 — APROBADA; mapa canónico materializado
        ↓
SUPA-TRANS-002 — APROBADA; disposición canónica materializada
        ↓
SUPA-TRANS-003 — NO INICIADA
```

La secuencia activa permanece en `SUPA-TRANS-003`; esta corrección no inicia ni desarrolla esa tarea.

### ✅ SUPA-TRANS-002 — Clasificar cada objeto como conservar, mover, fusionar, dividir, renombrar o retirar

**Estado:** APROBADA

#### 1. Objetivo

Resolver la disposición documental de cada identidad incluida en `TRANSITION-MAP-001@1.0.0`, sin alterar el estado remoto ni anticipar el orden físico de migración.

El resultado de esta tarea es:

```text
DISPOSITION-MAP-002@1.0.2
```

Cada una de las **970 identidades** queda asignada exactamente a una de estas disposiciones:

| Disposición | Significado canónico                                                                                                                                                                     |
| ----------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `CONSERVAR` | La identidad y su responsabilidad continúan en la arquitectura objetivo. Puede requerir endurecimiento, adaptación o pruebas posteriores.                                                |
| `MOVER`     | La identidad empresarial continúa, pero su modelo escribible, automatismo o función privilegiada debe trasladarse desde la frontera actual hacia el dominio o límite interno ya mapeado. |
| `FUSIONAR`  | Dos o más identidades actuales representan el mismo resultado o un automatismo solapado y deben converger en una sola autoridad.                                                         |
| `DIVIDIR`   | Una identidad actual mezcla propietarios, resultados o sensibilidades y debe separarse en contratos o almacenamientos independientes.                                                    |
| `RENOMBRAR` | La responsabilidad y la frontera permanecen; solo cambia la identidad nominal.                                                                                                           |
| `RETIRAR`   | La identidad deja de formar parte de la arquitectura objetivo después de demostrar sustitución, retención, cero consumidores y rollback.                                                 |

La clasificación no equivale a ejecutar el cambio. Toda disposición permanece sujeta a dependencias, datos, compatibilidad, consumidores, concurrencia, pruebas y rollback.

#### 2. Universo clasificado

| Clase                                      | Identidades |
| ------------------------------------------ | ----------: |
| relaciones PostgreSQL gobernadas por Vento |     **379** |
| funciones PostgreSQL                       |     **348** |
| triggers empresariales                     |     **197** |
| buckets de Storage                         |      **14** |
| Edge Functions activas                     |      **24** |
| cron jobs                                  |       **7** |
| evidencia migratoria mensual de VISO       |       **1** |
| **Total**                                  |     **970** |

La clasificación completa produce:

| Disposición | Identidades |
| ----------- | ----------: |
| `CONSERVAR` |     **420** |
| `MOVER`     |     **494** |
| `FUSIONAR`  |      **11** |
| `DIVIDIR`   |       **6** |
| `RENOMBRAR` |       **0** |
| `RETIRAR`   |      **39** |
| **Total**   |     **970** |

La ausencia de casos `RENOMBRAR` es deliberada. No se encontró una identidad cuyo único problema fuera nominal; los nombres problemáticos forman parte de fusiones, movimientos o retiros y no deben resolverse mediante un cambio cosmético aislado.

#### 3. Jerarquía de decisión

La disposición se resuelve en este orden cerrado:

1. conservar la frontera separada de VITAL;
2. retirar residuos temporales, objetos declarados legacy y proyecciones de compatibilidad con fuente canónica distinta;
3. retirar funciones huérfanas de trigger sin automatismo o consumidor vigente certificado;
4. fusionar fuentes competidoras y jobs operativamente solapados;
5. dividir documentos y archivos que mezclan propietarios, finalidades o sensibilidad;
6. mover modelos escribibles alojados en `public` hacia su dominio objetivo;
7. mover con el objeto padre sus triggers y funciones de trigger;
8. mover funciones privilegiadas alojadas en `public` hacia una frontera interna gobernada;
9. conservar las identidades restantes dentro de la frontera ya mapeada.

Ninguna regla por defecto puede sobrescribir una decisión explícita anterior.

#### 4. Decisiones explícitas de retiro

Se retiran documentalmente, condicionados a sus puertas de ejecución:

- `public.product_categories_backup_20260316_preparaciones`;
- `public.staging_insumos_import`;
- `public.role_capabilities`;
- las proyecciones `CURRENT_COMPATIBILITY_PROJECTION` respaldadas por tablas o vistas canónicas en `pass` o `pos`;
- `public.notify_shift_published()`;
- `public.update_loyalty_balance()`.

`public.role_capabilities` no se reemplaza por una sola tabla: su responsabilidad vigente se distribuye entre `public.app_permissions`, `public.role_permissions` y `public.operational_role_permissions`.

Una disposición `RETIRAR` no autoriza eliminación. Exige completar dependencias, reconciliación de datos, adaptación de consumidores, ventana de compatibilidad, pruebas negativas y rollback.

#### 5. Decisiones explícitas de fusión

| Grupo                                       | Identidades principales                                                           | Autoridad de convergencia                                                                         |
| ------------------------------------------- | --------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| `DISP::MERGE::ATTENDANCE_LOGS`              | `public.asistencia_logs`, `public.attendance_logs` y sus automatismos             | `public.attendance_logs` como ancla de identidad, sujeta a reconciliación de datos y consumidores |
| `DISP::MERGE::SITE_OPERATIONAL_ROLES`       | `public.site_operational_roles`, `viso.site_operational_roles` y sus automatismos | `public.site_operational_roles` como ancla de identidad, sin doble escritura                      |
| `DISP::MERGE::ATTENDANCE_DAY_END_CLOSE_JOB` | `cron.auto-close-attendance`, `cron.anima_attendance_day_end_close_0005`          | una única programación canónica, idempotente y observable                                         |

La fusión conserva historial y trazabilidad. No permite descartar filas divergentes ni seleccionar autoridad únicamente por nombre o schema.

#### 6. Decisiones explícitas de división

Se dividen seis identidades:

- `public.documents`;
- `public.document_types`;
- `public.required_document_rules`;
- `storage.bucket.documents`;
- `storage.bucket.employee-photos`;
- `storage.bucket.public-documents`.

La separación deberá resolver, como mínimo:

- propietario empresarial del documento o archivo;
- finalidad operacional, laboral, patrimonial, comercial o pública;
- sensibilidad y restricciones de acceso;
- retención y borrado;
- consumidores autorizados;
- contrato de metadata;
- ubicación del binario y relación con la entidad propietaria.

No se fijan todavía nombres físicos para las identidades resultantes.

#### 7. Decisiones de movimiento

Se mueven **494 identidades** porque la responsabilidad continúa, pero la frontera actual no es la arquitectura objetivo:

- tablas y modelos escribibles de dominio alojados en `public`;
- triggers vinculados a esos modelos;
- funciones de trigger alojadas en `public`;
- funciones `SECURITY DEFINER` alojadas en `public`;
- `public.internal_job_secrets`;
- `public.viso_enforce_monthly_schedule_publish_limit()`;
- `public.employee_shifts::trigger::trg_viso_monthly_schedule_publish_limit`.

El movimiento preserva `target_transition_key`, dominio objetivo, autoridad y contrato. No decide el nombre de schema, tabla, función o trigger futuro.

La guardia mensual de VISO conserva su efecto operacional, pero no su ubicación privilegiada actual. Su transición deberá revisar owner, `search_path`, grants, invocadores autorizados, atomicidad, concurrencia y pruebas negativas.

#### 8. Decisiones de conservación

Se conservan **420 identidades**, incluidas:

- las 54 relaciones de VITAL dentro de su frontera de producto separada;
- objetos ya ubicados en fronteras especializadas válidas;
- proyecciones vigentes que no son adapters de compatibilidad;
- endpoints y automatismos sin evidencia suficiente para mover, fusionar, dividir o retirar;
- Edge Functions activas, sujetas a autenticación, idempotencia y contratos posteriores;
- buckets no afectados por una división explícita;
- jobs no solapados;
- la evidencia histórica de la migración mensual de VISO.

`CONSERVAR` no significa congelar el objeto ni eximirlo de seguridad, rendimiento, dependencias, pruebas o adaptación de tipos.

#### 9. Contrato de cada fila

Cada fila del mapa resuelto contiene:

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
target_transition_key
disposition_status
disposition_group_key
disposition_reason
decision_confidence
execution_gate
successor_transition_key
mapping_status
evidence_refs
```

`disposition_group_key` conecta identidades que deben tratarse como una sola unidad de transición. `successor_transition_key` solo aparece cuando existe una autoridad de convergencia o reemplazo explícita; su ausencia no autoriza inferir un destino físico.

#### 10. Artefacto ejecutable y trazabilidad

La clasificación completa se materializa en:

```text
docs/plan-canonico/modular/bloques/E3_SUPABASE/SUPA-TRANS-002_DISPOSITION_MAP.sql
```

Contrato del artefacto:

- versión: `DISPOSITION-MAP-002@1.0.2`;
- ejecutor: cliente `psql` con `ON_ERROR_STOP`;
- fuente única: ejecución directa de `SUPA-TRANS-001_TRANSITION_MAP.sql` mediante `\ir`;
- handoff: conserva sin reconstrucción `current_object_key`, `current_object_class` y `target_transition_key`;
- transformación: añade disposición, grupo, razón, confianza, puertas y sucesor cuando aplique;
- efectos: solo tablas temporales de sesión y archivos CSV locales bajo `/tmp`;
- efectos prohibidos: DDL o DML persistente, cambios de configuración, despliegues, backfills, renombres físicos y retiros;
- salida: 970 filas ordenadas por clase e identidad;
- comprobaciones incorporadas: universo, unicidad, reserva, conjunto cerrado, conteos por categoría y autoridad resoluble para toda fusión.

El artefacto corrige la ruptura anterior: `SUPA-TRANS-002` ya no reconstruye un inventario paralelo ni conserva el CTE inválido sin coma. La revisión `1.0.2` sincroniza la distribución ejecutada por las reglas vigentes y hace explícita la autoridad de convergencia de los cinco triggers incluidos en grupos de fusión.
#### 11. Requisitos de prueba

**Resultado:** NO CREA IDENTIFICADORES NUEVOS; ACTUALIZA REQUISITOS EXISTENTES EN `04A`.

La corrección consolida los conteos vigentes de 348 funciones y 197 triggers; la resolución de `RESERVED_FOR_SUPA_TRANS_002`; la clasificación condicionada de objetos temporales; el consumo del mismo mapa sin reinventario; las seis disposiciones canónicas; y la evidencia conjunta del mapa y la clasificación sin autorizar cambios físicos.

El registro canónico conserva 6.258 requisitos, catorce columnas por fila, identificadores únicos y relaciones resolubles.
#### 12. Invariantes de cierre

La tarea queda documentalmente completa porque:

1. existen exactamente **970 filas**;
2. no existen claves duplicadas por clase e identidad;
3. ninguna fila conserva `RESERVED_FOR_SUPA_TRANS_002`;
4. toda fila usa una disposición del conjunto cerrado;
5. la suma por disposición es **970**;
6. toda fusión tiene grupo y autoridad de convergencia;
7. toda división tiene grupo y puertas posteriores;
8. todo retiro está condicionado a datos, consumidores, compatibilidad, pruebas y rollback;
9. todo movimiento preserva la identidad empresarial y el dominio objetivo;
10. no se ejecuta DDL o DML persistente, despliegue, backfill, renombre físico, retiro ni cambio de configuración; solo se usan objetos temporales de sesión para comprobar el handoff.


### ✅ SUPA-TRANS-003 — Identificar dependencias de aplicaciones, RPC, RLS, triggers y datos

**Estado:** APROBADA
**Tarea anterior:** `SUPA-TRANS-002 — Clasificar cada objeto como conservar, mover, fusionar, dividir, renombrar o retirar` — APROBADA
**Siguiente tarea reservada:** `SUPA-TRANS-004 — Definir orden de migración por dominio`
**Tipo de tarea:** inventario documental y técnico read-only; sin DDL o DML persistente, migraciones, backfills, cambios de RLS, despliegues, renombres, retiros ni cambios de configuración

#### 1. Resultado concreto

Esta tarea fija el registro de dependencias que deberá acompañar las 970 identidades de `TRANSITION-MAP-001@1.0.0` y `DISPOSITION-MAP-002@1.0.2`.

El resultado canónico es:

```text
DEPENDENCY-MAP-003@1.0.0
```

Una dependencia es cualquier relación demostrable o candidata que pueda romperse, ampliar autoridad, duplicar efectos, perder historia o dejar un consumidor incompatible durante la transición. La ausencia de una clave foránea o de una coincidencia literal en código no demuestra ausencia de dependencia.

#### 2. Fuentes y corte de evidencia

| Fuente                               | Uso en esta tarea                                                        |
| ------------------------------------ | ------------------------------------------------------------------------ |
| `TRANSITION-MAP-001@1.0.0`           | conserva las 970 identidades y sus claves estables                       |
| `DISPOSITION-MAP-002@1.0.2`          | conserva disposición, grupo, gates y autoridad de convergencia           |
| catálogo read-only de `vento-os-dev` | FK, vistas, funciones, triggers, RLS, publicaciones y relaciones         |
| `SUPA-AUD-022` y `SUPA-AUD-023`      | owner, consumidores, procesos, datos, RPC, eventos y aplicaciones        |
| `SUPA-ARC-001` a `SUPA-ARC-025`      | fronteras, autoridad, contratos, seguridad y política de transición      |
| repositorios `vento-*` del workspace | referencias literales de cliente a tablas, RPC, Storage y Edge Functions |
| stack local de `vento-shell`         | comprobación de paridad disponible; `cron.job` ausente en el corte local |

La evidencia remota fue leída el 2026-07-31 sin ejecutar cambios persistentes.

#### 3. Contrato de cada dependencia

Cada arista del registro deberá conservar:

```text
source_transition_key
dependent_key
dependency_class
dependency_direction
access_or_effect
application_or_role
evidence_mode
evidence_reference
confidence
resolution_state
blocking_reason
owning_followup_task
```

Catálogo cerrado de `dependency_class`:

```text
FOREIGN_KEY
VIEW_SOURCE
FUNCTION_RELATION
FUNCTION_FUNCTION
RPC_CLIENT
RLS_POLICY
RLS_HELPER
TRIGGER_RELATION
TRIGGER_FUNCTION
REALTIME_PUBLICATION
STORAGE_CLIENT
EDGE_CLIENT
CRON_TARGET
APPLICATION_RELATION
DATA_HISTORY_OR_BACKFILL
EXTERNAL_OR_DYNAMIC_CONSUMER
```

Catálogo de evidencia:

```text
CONFIRMED_CATALOG
CONFIRMED_CODE_LITERAL
CONFIRMED_CANONICAL_AUDIT
LEXICAL_BODY_CANDIDATE
DYNAMIC_OR_EXTERNAL_REVIEW
NEGATIVE_SEARCH_ONLY
```

`NEGATIVE_SEARCH_ONLY` nunca podrá cerrar un objeto como `SIN_CONSUMIDORES`.

#### 4. Línea base materializada de base de datos

| Familia                                |                  Aristas u objetos | Cobertura confirmada                                                     |
| -------------------------------------- | ---------------------------------: | ------------------------------------------------------------------------ |
| relaciones gobernadas                  |                            **379** | nueve schemas del mapa `001`                                             |
| claves foráneas                        |                    **795 aristas** | 276 relaciones hijas y 106 relaciones padre                              |
| dependencias de vistas                 |                    **149 aristas** | las 62 vistas tienen al menos una fuente catalogada                      |
| triggers                               | **197 aristas relación → trigger** | 155 relaciones y 71 funciones ejecutoras                                 |
| políticas RLS                          |                            **790** | 300 relaciones protegidas                                                |
| dependencias policy → función          |                  **1.156 aristas** | 711 políticas con helper o función dependiente                           |
| dependencias policy → relación         |                    **972 aristas** | las 790 políticas conservan relación protegida y referencias catalogadas |
| referencias léxicas función → relación |                 **868 candidatas** | 280 funciones; requieren confirmación por parser o prueba                |
| referencias léxicas función → función  |                 **265 candidatas** | 148 funciones; requieren confirmación por firma                          |
| publicación `supabase_realtime`        |                   **6 relaciones** | inventario nominal cerrado para este corte                               |

PostgreSQL no registra de forma completa en `pg_depend` las referencias internas de cuerpos PL/pgSQL. Por ello, las 868 y 265 aristas léxicas son candidatas trazables, no dependencias estructurales confirmadas ni autorización para retirar código.

#### 5. Dependencias de datos

Las 795 claves foráneas son dependencias mínimas, no el universo completo. Cada relación deberá declarar adicionalmente:

- escritoras directas y funciones que cambian estado;
- vistas y proyecciones que leen sus columnas;
- triggers `BEFORE`, `AFTER` o `INSTEAD OF`, evento y orden;
- políticas, helpers y roles efectivos;
- historial, ledger, auditoría, archivos y eventos relacionados;
- imports, hojas, POS, webhooks, jobs o integraciones sin FK;
- volumen, nulabilidad, defaults y calidad que condicionen `SUPA-TRANS-005`;
- claves naturales, aliases y equivalencias que no puedan inferirse por texto.

Las fusiones `ATTENDANCE_LOGS` y `SITE_OPERATIONAL_ROLES` permanecen bloqueadas hasta reconciliar relaciones entrantes, salientes, automatismos, consumidores y datos divergentes. Las divisiones documentales permanecen bloqueadas hasta separar owner, sensibilidad, retención, metadata, binario y referencias.

#### 6. Dependencias RLS y exposición

Estado observado:

| Control                                    | Resultado |
| ------------------------------------------ | --------: |
| relaciones con RLS activo                  |   **305** |
| políticas sobre relaciones gobernadas      |   **790** |
| relaciones con RLS activo y cero políticas |     **5** |
| relaciones persistidas con RLS desactivado |    **12** |

RLS activo sin políticas:

```text
pass.site_business_hours
pass.site_delivery_slots
pass.site_schedule_exception_resolutions
pass.site_schedule_exceptions
public.client_push_tokens
```

Relaciones persistidas con RLS desactivado:

```text
app_private.delivery_pin_secrets
viso.demand_forecasts
viso.demand_history_hourly
viso.employee_availability
viso.employee_planning_limits
viso.employee_shift_preferences
viso.shift_generation_candidate_items
viso.shift_generation_candidates
viso.shift_generation_runs
viso.site_operational_roles
viso.site_planning_rules
viso.site_staffing_requirements
```

`app_private.delivery_pin_secrets` no se trata como tabla pública por tener RLS desactivado: su ACL y frontera server-only se revisan por separado. Las once relaciones `viso.*` no adquieren autorización de cliente por estar fuera del schema `public`. `SUPA-TRANS-010` resolverá seguridad y rendimiento; esta tarea únicamente conserva dependencia, exposición y gate.

#### 7. Dependencias Realtime

La publicación `supabase_realtime` contiene:

```text
public.order_conversations
public.order_delivery_sessions
public.order_messages
public.order_status_events
public.orders
public.users
```

Cada una queda bloqueada frente a movimiento, división, renombre o retiro hasta identificar canales, filtros, eventos, replica identity, volumen, autorización y consumidores efectivos. Una publicación de tabla no demuestra que exista consumidor activo; una búsqueda de `.channel(...)` sin literal tampoco demuestra ausencia.

#### 8. Dependencias de aplicaciones

El barrido estático de archivos TypeScript y JavaScript del workspace encontró el siguiente límite inferior de identificadores literales:

| Repositorio       | tablas/vistas |  RPC | buckets | Edge Functions |
| ----------------- | ------------: | ---: | ------: | -------------: |
| `vento-anima`     |            24 |   10 |       1 |              8 |
| `vento-fogo`      |            25 |    8 |       0 |              0 |
| `vento-group-web` |             2 |    0 |       0 |              0 |
| `vento-nexo`      |            90 |   40 |       0 |              0 |
| `vento-numera`    |            18 |    5 |       0 |              0 |
| `vento-origo`     |            29 |    9 |       0 |              0 |
| `vento-pass`      |            27 |   12 |       0 |              5 |
| `vento-pulso`     |            30 |   15 |       0 |              1 |
| `vento-shell`     |            31 |   14 |       0 |              0 |
| `vento-talento`   |            12 |    4 |       0 |              0 |
| `vento-viso`      |            97 |   14 |       0 |              1 |
| `vento-vital`     |             0 |    0 |       0 |              0 |

El conjunto combinado contiene al menos **217 identificadores literales de relación**, **102 nombres de RPC**, **13 Edge Functions** y **1 bucket**. Los conteos por repositorio se solapan y no deben sumarse como objetos únicos.

El barrido literal no cubre identificadores construidos, wrappers, SQL dinámico, secretos de integración, clientes externos, ramas no presentes, dashboards, hojas ni consumidores manuales. Esos casos quedan `DYNAMIC_OR_EXTERNAL_REVIEW`; nunca `SIN_CONSUMIDORES`.

#### 9. Edge Functions y Storage

Las trece Edge Functions con invocación literal localizada son:

```text
account-deletion
announcement-notify
employee-delete
order-message-notify
pass-address-search
pass-delivery-quote
pass-register-push-token
payments-create-intent
register-push-token
shift-publish-notify
staff-invitations-cancel
staff-invitations-create
staff-invitations-resend
```

Las otras once Edge Functions desplegadas no se declaran huérfanas: pueden ser webhooks, callbacks, jobs o endpoints externos. El bucket `documents` tiene referencia literal localizada; los demás buckets requieren correlación con URL, policy, contrato o consumidor externo antes de cualquier decisión de salida.

#### 10. Triggers, funciones y RPC

Cada uno de los 197 triggers conserva obligatoriamente:

- relación padre;
- función ejecutora por firma;
- momento, evento, nivel y condición;
- privilegio y `security_definer` de la función;
- tablas o funciones afectadas por el cuerpo;
- relación con otros triggers del mismo evento;
- consumidor funcional y efecto empresarial.

Las 348 funciones se identifican por firma PostgreSQL, no solo por nombre. Una coincidencia de `.rpc('nombre')` sin resolución de overload permanece bloqueada. Las funciones de trigger no son RPC por su presencia en `public`, y una función `SECURITY DEFINER` no adquiere autorización empresarial por ejecutarse correctamente.

La guardia mensual de VISO queda ligada a `public.employee_shifts`, su trigger, callers administrativos, owner, grants, `search_path`, regla provisional de 186 horas y pruebas posteriores. Su concurrencia pertenece a `SUPA-TRANS-008`; seguridad y coste a `SUPA-TRANS-010`.

#### 11. Dependencias cron y paridad local

Los siete cron jobs permanecen vinculados a scheduler, comando o endpoint, secreto, dominio propietario, observabilidad y resultado empresarial. El stack local activo de `vento-shell` no contiene `cron.job`; por eso `SUPA-TRANS-001_TRANSITION_MAP.sql` no puede reproducir localmente el bloque cron completo en este corte.

Esta diferencia se clasifica:

```text
LOCAL_PLATFORM_PARITY_GAP
```

No autoriza crear jobs, extensiones ni datos locales dentro de esta tarea. La paridad corresponde a `SUPA-TRANS-013` y el gate ejecutable a `SUPA-TRANS-015`.

#### 12. Estados de resolución

Cada identidad y arista usará exactamente uno:

| Estado                            | Significado                                                                       |
| --------------------------------- | --------------------------------------------------------------------------------- |
| `RESOLVED_CONFIRMED`              | dependencia demostrada por catálogo, código o auditoría canónica                  |
| `RESOLVED_NEGATIVE_WITH_SCOPE`    | búsqueda negativa con alcance explícito; no equivale a cero consumidores globales |
| `CANDIDATE_REQUIRES_CONFIRMATION` | referencia léxica, dinámica o ambigua                                             |
| `BLOCKED_EXTERNAL_CONSUMER`       | consumidor fuera del workspace o sin evidencia accesible                          |
| `BLOCKED_SIGNATURE_OR_OVERLOAD`   | RPC sin firma única resoluble                                                     |
| `BLOCKED_SECURITY_BOUNDARY`       | RLS, grants, definer, secreto o exposición sin resolución                         |
| `BLOCKED_DATA_RELATIONSHIP`       | datos, historia o relación no representada completamente por FK                   |
| `BLOCKED_LOCAL_PARITY`            | objeto remoto sin representación local equivalente                                |

Ningún estado bloqueado impide documentar `SUPA-TRANS-004`; sí impide ejecutar la migración física del objeto afectado.

#### 13. Entrega a tareas siguientes

| Trabajo derivado                                          | Tarea propietaria |
| --------------------------------------------------------- | ----------------- |
| orden topológico y oleadas por dominio                    | `SUPA-TRANS-004`  |
| reconciliación, calidad y backfill                        | `SUPA-TRANS-005`  |
| vistas, wrappers y aliases temporales                     | `SUPA-TRANS-006`  |
| adaptación exacta de repositorios y consumidores externos | `SUPA-TRANS-007`  |
| writers, concurrencia, doble escritura e idempotencia     | `SUPA-TRANS-008`  |
| pruebas de dependencias y regresión                       | `SUPA-TRANS-009`  |
| RLS, grants, definer, exposición y rendimiento            | `SUPA-TRANS-010`  |
| rollback por componente conectado                         | `SUPA-TRANS-011`  |
| cero consumidores y retiro progresivo                     | `SUPA-TRANS-012`  |
| paridad local, staging y producción                       | `SUPA-TRANS-013`  |
| tipos, firmas, contratos y documentación                  | `SUPA-TRANS-014`  |
| materialización de gates en roadmap                       | `SUPA-TRANS-015`  |

No queda un hallazgo accionable sin tarea propietaria.

#### 14. Requisitos de prueba

**NO GENERA REQUISITOS DE PRUEBA.** Esta tarea no crea, modifica ni elimina identificadores `TREQ-*`; aplica requisitos existentes, especialmente:

```text
TREQ-SUPABASE-255
TREQ-SUPABASE-265 a TREQ-SUPABASE-266
TREQ-SUPABASE-274
TREQ-SUPABASE-287
TREQ-SUPABASE-294 a TREQ-SUPABASE-295
TREQ-SUPABASE-302
TREQ-SUPABASE-425 a TREQ-SUPABASE-427
TREQ-SUPABASE-445 a TREQ-SUPABASE-452
TREQ-SUPABASE-510 a TREQ-SUPABASE-513
TREQ-SUPABASE-518
TREQ-SUPABASE-522
TREQ-SUPABASE-549
TREQ-SUPABASE-619
TREQ-SUPABASE-636 a TREQ-SUPABASE-647
TREQ-SUPABASE-682 a TREQ-SUPABASE-684
TREQ-SUPABASE-1696 a TREQ-SUPABASE-1735
TREQ-DATA-173
TREQ-DATA-183
TREQ-DATA-196
TREQ-DATA-207
TREQ-DATA-213
TREQ-DATA-217
TREQ-DATA-223
TREQ-DATA-227
TREQ-DATA-229
TREQ-DATA-237
```

Como no cambia filas del registro `04A`, no requiere reemplazar ese archivo en esta propuesta.

#### 15. Criterios de aceptación

- [x] conserva las 970 identidades y sus claves de transición;
- [x] separa dependencias confirmadas, candidatas, negativas y externas;
- [x] registra FK, vistas, funciones, triggers, RLS, Realtime, aplicaciones, Storage, Edge y cron;
- [x] identifica 795 FK, 149 aristas de vistas y 197 triggers;
- [x] registra las 790 políticas y sus dependencias catalogadas;
- [x] no convierte referencias léxicas en autoridad ni certeza estructural;
- [x] preserva las cinco relaciones RLS sin policy y las doce persistidas sin RLS;
- [x] conserva las seis relaciones Realtime;
- [x] inventaría el límite inferior de consumidores en los repositorios disponibles;
- [x] no declara huérfano un objeto por ausencia de coincidencia literal;
- [x] clasifica la ausencia local de `cron.job` sin crear objetos de prueba;
- [x] enruta cada resolución pendiente a `SUPA-TRANS-004` a `SUPA-TRANS-015`;
- [x] no ejecuta cambios remotos ni físicos.

#### 16. Continuidad preservada

```text
SUPA-TRANS-003 — APROBADA
        ↓
SUPA-TRANS-004 — ÚLTIMA APROBADA
        ↓
SUPA-TRANS-005 — TAREA ACTUAL; NO INICIADA
```

La aprobación de esta tarea quedó incorporada sin iniciar trabajo de `SUPA-TRANS-005`.


### ✅ SUPA-TRANS-004 — Definir orden de migración por dominio

**Estado:** APROBADA
**Tarea anterior:** `SUPA-TRANS-003 — Identificar dependencias de aplicaciones, RPC, RLS, triggers y datos` — APROBADA
**Siguiente tarea reservada:** `SUPA-TRANS-005 — Definir backfills y correcciones de calidad de datos`
**Tipo de tarea:** diseño documental del orden de transición; sin DDL, DML, backfills, despliegues, cambios de RLS, escrituras remotas ni movimiento físico de objetos

#### 1. Resultado concreto

Esta tarea fija el orden topológico por dominios para las 26 responsabilidades objetivo `VSCHEMA-001` a `VSCHEMA-026`, preservando las 970 identidades de `TRANSITION-MAP-001@1.0.0`, sus disposiciones en `DISPOSITION-MAP-002@1.0.2` y las dependencias de `DEPENDENCY-MAP-003@1.0.0`.

El resultado canónico es:

```text
MIGRATION-ORDER-004@1.0.0
```

El orden define cuándo puede entrar cada dominio a preparación, materialización, paridad, cambio de consumidores y certificación. No autoriza ejecución física y no transforma una dependencia candidata en dependencia resuelta.

#### 2. Fuentes canónicas aplicadas

| Fuente                                             | Uso en esta tarea                                                                    |
| -------------------------------------------------- | ------------------------------------------------------------------------------------ |
| `TRANSITION-MAP-001@1.0.0`                         | universo cerrado de 970 identidades y claves estables                                |
| `DISPOSITION-MAP-002@1.0.2`                        | disposición, destino, autoridad y gates por identidad                                |
| `DEPENDENCY-MAP-003@1.0.0`                         | aristas confirmadas, candidatas, dinámicas, externas y bloqueadas                    |
| `SUPA-ARC-001` a `SUPA-ARC-025`                    | fronteras de autoridad, responsabilidades `VSCHEMA-*`, contratos, seguridad y retiro |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` | controles vigentes aplicables al orden, identidad, compatibilidad y gates            |

#### 3. Unidad de avance

La unidad mínima de avance es un `migration_unit`, no un schema completo. Cada unidad conserva:

```text
migration_unit_id
transition_keys
owner_schema
wave_id
intra_wave_order
predecessor_units
dependency_state
compatibility_contract
consumer_cohort
data_reconciliation_gate
security_gate
rollback_unit
entry_evidence
exit_evidence
status
```

Un schema puede tener unidades en momentos distintos cuando contiene maestros, hechos, proyecciones o compatibilidad con dependencias diferentes. La pertenencia a una misma oleada no implica paralelismo: prevalecen `predecessor_units` y las aristas de `DEPENDENCY-MAP-003@1.0.0`.

#### 4. Secuencia obligatoria dentro de cada unidad

Cada unidad sigue este orden cerrado:

1. congelar nuevas fuentes de autoridad en `public` y en schemas legados;
2. confirmar identidad, disposición, owner y consumidores conocidos;
3. resolver o aislar dependencias bloqueantes;
4. materializar el destino canónico sin retirar el origen;
5. publicar contrato de compatibilidad, RLS, grants y observabilidad;
6. demostrar paridad de estructura, datos, efectos, seguridad y rollback;
7. mover consumidores por cohortes controladas;
8. demostrar ausencia de consumidores ocultos dentro del alcance declarado;
9. certificar la nueva autoridad;
10. habilitar el retiro posterior de aliases, wrappers y fuentes antiguas.

Ninguna unidad puede saltar pasos porque otra unidad de su oleada haya finalizado.

#### 5. Carriles transversales

Los siguientes carriles acompañan todas las oleadas y no se posponen como limpieza final:

| Carril                            | Regla de orden                                                                                                                                                                             |
| --------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| identidad y autorización          | `identity_access` publica contratos y referencias estables antes del cambio de cualquier consumidor; los datos laborales, de cliente o dispositivo permanecen en sus dominios propietarios |
| evidencia y trazabilidad          | `business_records` admite referencias estables desde cada oleada, sin apropiarse del estado empresarial                                                                                    |
| eventos e integraciones           | todo evento conserva owner, versión, idempotencia, consumidor, replay y compatibilidad antes del cambio de escritor                                                                        |
| RLS, grants y código privilegiado | se certifican por unidad antes de exponer el destino o redirigir tráfico                                                                                                                   |
| datos y rollback                  | reconciliación, backfill, doble escritura y reversa deben estar definidos antes de mover consumidores                                                                                      |
| tipos y contratos                 | firmas, aliases y tipos generados se versionan por cohorte, nunca mediante un cambio global no trazado                                                                                     |
| observabilidad                    | cada unidad conserva señales de paridad, divergencia, errores, latencia y decisión de reversa                                                                                              |

#### 6. Orden canónico por oleadas

| Oleada                           | Orden interno obligatorio | Responsabilidad                      | Razón topológica principal                                                                                           |
| -------------------------------- | ------------------------- | ------------------------------------ | -------------------------------------------------------------------------------------------------------------------- |
| `W0_CONTROL_FOUNDATION`          | `001`                     | `VSCHEMA-001 org_governance`         | publica organización, sedes, tenant, unidades y referencias comunes                                                  |
|                                  | `002`                     | `VSCHEMA-023 identity_access`        | estabiliza sujeto, cuenta, sesión, rol y decisión de acceso sin asumir datos de otros dominios                       |
|                                  | `003`                     | `VSCHEMA-022 technology_operations`  | establece configuración, secretos, webhooks, jobs y controles técnicos necesarios para operar oleadas                |
| `W1_PEOPLE_OPERATIONS`           | `001`                     | `VSCHEMA-002 recruiting`             | prepara candidatos y entrega explícita hacia workforce                                                               |
|                                  | `002`                     | `VSCHEMA-003 workforce`              | publica trabajador y relación laboral para los consumidores posteriores                                              |
|                                  | `003`                     | `VSCHEMA-004 work_scheduling`        | depende de workforce y publica el plan operativo                                                                     |
|                                  | `004`                     | `VSCHEMA-005 attendance`             | consume trabajador y planificación; produce asistencia real                                                          |
|                                  | `005`                     | `VSCHEMA-006 payroll`                | consume hechos laborales y de asistencia ya estabilizados                                                            |
|                                  | `006`                     | `VSCHEMA-007 operational_compliance` | consolida cumplimiento sobre referencias laborales y operativas estables                                             |
| `W2_PRODUCT_AND_OFFER`           | `001`                     | `VSCHEMA-008 product_catalog`        | publica producto, presentación, unidad y taxonomía compartida                                                        |
|                                  | `002`                     | `VSCHEMA-009 recipes`                | consume catálogo y publica composición y rendimiento                                                                 |
|                                  | `003`                     | `VSCHEMA-010 commercial_offer`       | consume catálogo y publica disponibilidad, precio y oferta comercial                                                 |
| `W3_SUPPLY_AND_PRODUCTION`       | `001`                     | `VSCHEMA-011 procurement`            | inicia abastecimiento sobre catálogo y referencias organizacionales estables                                         |
|                                  | `002`                     | `VSCHEMA-012 inventory`              | recibe movimientos de abastecimiento y se vuelve autoridad de existencias                                            |
|                                  | `003`                     | `VSCHEMA-013 assets`                 | estabiliza activos y mantenimientos vinculados a sedes y operación                                                   |
|                                  | `004`                     | `VSCHEMA-020 facilities`             | coordina sede, activos, compras y cumplimiento sin absorber sus autoridades                                          |
|                                  | `005`                     | `VSCHEMA-014 production`             | consume catálogo, recetas e inventario y publica resultados productivos                                              |
| `W4_COMMERCIAL_FULFILLMENT`      | `001`                     | `VSCHEMA-017 customer_engagement`    | estabiliza perfil, consentimiento y relación con cliente antes del ciclo de pedido                                   |
|                                  | `002`                     | `VSCHEMA-015 sales_orders`           | consume cliente, catálogo y oferta; publica la orden comercial                                                       |
|                                  | `003`                     | `VSCHEMA-016 payments`               | registra hechos de pago contra órdenes y sujetos estables                                                            |
|                                  | `004`                     | `VSCHEMA-018 logistics`              | acepta la entrega de órdenes y coordina cumplimiento con inventario y sedes                                          |
| `W5_RECORD_AND_ECONOMIC_CLOSURE` | `001`                     | `VSCHEMA-019 finance`                | consume hechos económicos estabilizados de compras, inventario, órdenes, pagos y producción                          |
|                                  | `002`                     | `VSCHEMA-024 business_records`       | consolida vínculos documentales sobre identidades empresariales ya estables; sus adaptadores acompañaron cada oleada |
|                                  | `003`                     | `VSCHEMA-021 marketing`              | activa canales sobre oferta, consentimiento y cliente sin asumir sus autoridades                                     |
| `W6_DERIVED_AND_CONTINUITY`      | `001`                     | `VSCHEMA-025 business_insights`      | consume fuentes certificadas y no escribe de vuelta sobre dominios operativos                                        |
|                                  | `002`                     | `VSCHEMA-026 operational_continuity` | registra contratos, degradación y recuperación después de estabilizar dependencias de servicio                       |

Las 26 responsabilidades aparecen una sola vez. `business_records` mantiene adaptadores tempranos, pero su autoridad consolidada entra en `W5`; `identity_access` puede publicar referencias en `W0`, pero no adelanta la migración de perfiles laborales o de clientes.

#### 7. Dependencias entre oleadas

```text
W0_CONTROL_FOUNDATION
 ├─> W1_PEOPLE_OPERATIONS
 └─> W2_PRODUCT_AND_OFFER

W2_PRODUCT_AND_OFFER ─> W3_SUPPLY_AND_PRODUCTION
W1_PEOPLE_OPERATIONS ─> W3_SUPPLY_AND_PRODUCTION

W2_PRODUCT_AND_OFFER ─> W4_COMMERCIAL_FULFILLMENT
W3_SUPPLY_AND_PRODUCTION ─> W4_COMMERCIAL_FULFILLMENT

W3_SUPPLY_AND_PRODUCTION ─> W5_RECORD_AND_ECONOMIC_CLOSURE
W4_COMMERCIAL_FULFILLMENT ─> W5_RECORD_AND_ECONOMIC_CLOSURE

W1..W5 CERTIFICADAS ─> W6_DERIVED_AND_CONTINUITY
```

Una unidad puede iniciar preparación documental antes de que termine su predecesora, pero no puede asumir autoridad, cambiar writers ni retirar compatibilidad hasta que todas sus aristas bloqueantes estén cerradas.

#### 8. Compuertas de entrada por unidad

Una unidad entra a materialización únicamente si:

- su `transition_key` existe en los tres artefactos `001`, `002` y `003`;
- owner, destino, disposición y claves de identidad son inequívocos;
- toda FK, vista, trigger, RLS, función, RPC, Realtime, Storage, Edge, cron y consumidor conocido tiene tratamiento;
- las candidatas léxicas y consumidores dinámicos tienen resolución o aislamiento explícito;
- las relaciones con RLS sin policy y las relaciones sin RLS no adquieren exposición accidental;
- cada función está identificada por firma y cada trigger por relación, evento y ejecutora;
- existe estrategia de reconciliación, backfill, compatibilidad, observabilidad y rollback;
- la paridad del entorno requerido está demostrada o declarada como gate bloqueante.

Los RPC defectuosos identificados por `TREQ-SUPABASE-080`, `TREQ-SUPABASE-081` y `TREQ-SUPABASE-082` no pueden ser invocados como compuertas confiables hasta que su precondición estructural esté resuelta y probada.

#### 9. Compuertas de salida por unidad y oleada

Una unidad sale de su oleada únicamente con evidencia de:

- paridad de conteos, claves, nulabilidad, semántica, historia y efectos laterales;
- autorización equivalente o más restrictiva por actor, tenant, sede y propósito;
- idempotencia y orden de eventos, triggers, jobs y webhooks;
- consumidores migrados por cohorte y métricas dentro de umbral;
- doble escritura reconciliada cuando aplique;
- rollback ejecutable dentro de la ventana definida;
- cero consumidores ocultos dentro del alcance medido, sin inferirlo solo por búsqueda literal.

La oleada se certifica cuando todas sus unidades están certificadas o cuando las excepciones restantes están aisladas y no son predecesoras de la siguiente oleada. Una excepción nunca se hereda silenciosamente.

#### 10. Reglas para identidad compartida

- se preservan UUID y claves externas durante toda la coexistencia;
- cuenta, trabajador, cliente y dispositivo siguen siendo identidades separables;
- no se provisiona Auth automáticamente por existencia de perfil empresarial;
- cuentas compartidas trabajador/dispositivo se separan antes del cambio de autoridad;
- cuentas de dispositivo no adquieren perfil de cliente;
- duplicados por email o teléfono requieren resolución explícita, sin fusión automática;
- deshabilitar una identidad aplica al contexto correcto y conserva historia y relaciones;
- sesiones y refresh tokens incompatibles se revocan antes del cambio de cohorte;
- perfiles sin Auth permanecen válidos cuando el contrato de negocio lo permita.

Estas reglas bloquean unidades concretas; no fuerzan detener toda una oleada si la dependencia puede aislarse sin degradar integridad o autorización.

#### 11. Objetos derivados y plataforma

Vistas, funciones auxiliares, triggers, políticas, grants, publicaciones, índices, tipos y objetos técnicos heredan la oleada de su objeto padre salvo que `DEPENDENCY-MAP-003@1.0.0` demuestre una dependencia anterior. No forman una oleada autónoma ni pueden adelantarse por conveniencia de despliegue.

La experiencia pública `VITAL` no constituye un dominio migrable. Solo entra como cohorte de compatibilidad y paridad sobre contratos autorizados; no crea tablas, RPC ni fuente de autoridad propia.

#### 12. Estados del orden

Cada unidad usa exactamente uno:

| Estado                       | Significado                                                                |
| ---------------------------- | -------------------------------------------------------------------------- |
| `ORDERED_NOT_READY`          | posición asignada, con gates todavía abiertos                              |
| `READY_FOR_MATERIALIZATION`  | entrada completa; puede preparar destino sin cambiar autoridad             |
| `READY_FOR_CONSUMER_COHORT`  | paridad y compatibilidad certificadas; puede mover una cohorte             |
| `COHORT_IN_PROGRESS`         | una cohorte controlada está activa                                         |
| `DOMAIN_AUTHORITY_CERTIFIED` | autoridad canónica demostrada con rollback vigente                         |
| `RETIREMENT_ELIGIBLE`        | cero consumidores demostrado; el retiro corresponde a su tarea propietaria |
| `BLOCKED`                    | existe una dependencia que impide el siguiente estado                      |

El avance es monotónico salvo rollback declarado. `BLOCKED` conserva la última evidencia válida y el propietario de resolución.

#### 13. Entrega a tareas siguientes

| Trabajo derivado                                      | Tarea propietaria |
| ----------------------------------------------------- | ----------------- |
| estrategia de reconciliación y backfill por unidad    | `SUPA-TRANS-005`  |
| vistas, aliases y wrappers temporales                 | `SUPA-TRANS-006`  |
| adaptación de aplicaciones y consumidores             | `SUPA-TRANS-007`  |
| writers, doble escritura, concurrencia e idempotencia | `SUPA-TRANS-008`  |
| pruebas de paridad y regresión por oleada             | `SUPA-TRANS-009`  |
| RLS, grants, exposición y rendimiento                 | `SUPA-TRANS-010`  |
| rollback ejecutable por unidad                        | `SUPA-TRANS-011`  |
| demostración de cero consumidores y retiro            | `SUPA-TRANS-012`  |
| promoción local, staging y producción                 | `SUPA-TRANS-013`  |
| tipos, contratos y documentación derivados            | `SUPA-TRANS-014`  |
| materialización de gates y owners en roadmap          | `SUPA-TRANS-015`  |

#### 14. Requisitos de prueba

**NO GENERA REQUISITOS DE PRUEBA.** Esta tarea no crea, modifica ni elimina identificadores `TREQ-*`. Aplica los requisitos vigentes del registro 04A relacionados con orden de transición, identidad compartida, compatibilidad por consumidor, objetos derivados, RLS, RPC y gates de corte.

#### 15. Criterios de aceptación

- [x] ordena las 26 responsabilidades `VSCHEMA-*` exactamente una vez;
- [x] preserva las 970 identidades y las decisiones de `SUPA-TRANS-001` a `SUPA-TRANS-003`;
- [x] distingue oleada de unidad física y prohíbe asumir paralelismo implícito;
- [x] fija predecesores e intraorden para personas, producto, suministro, comercio, finanzas y derivados;
- [x] aplica identidad, evidencia, eventos, seguridad, datos, contratos y observabilidad como carriles transversales;
- [x] define compuertas de entrada y salida sin declarar resueltos los bloqueos existentes;
- [x] preserva separación entre cuenta, trabajador, cliente y dispositivo;
- [x] mantiene `VITAL` fuera de la autoridad de datos;
- [x] hereda los objetos derivados desde su padre canónico;
- [x] asigna toda ejecución posterior a su tarea propietaria;
- [x] no ejecuta cambios físicos, remotos ni productivos;
- [x] reserva únicamente `SUPA-TRANS-005` como siguiente tarea.

#### 16. Continuidad preservada

```text
SUPA-TRANS-004 — ÚLTIMA APROBADA
        ↓
SUPA-TRANS-005 — TAREA ACTUAL; NO INICIADA
        ↓
SUPA-TRANS-006 — SIGUIENTE RESERVADA; NO INICIADA
```

La aprobación de esta tarea quedó incorporada sin iniciar trabajo de `SUPA-TRANS-005`.


### ✅ SUPA-TRANS-005 — Definir backfills y correcciones de calidad de datos

**Estado:** APROBADA  
**Fecha de preparación documental:** 2026-07-31  
**Bloque propietario:** BLOQUE E3 — Arquitectura canónica de datos y gobierno integral de Supabase  
**Tarea anterior:** `SUPA-TRANS-004 — Definir orden de migración por dominio` — APROBADA  
**Tarea siguiente:** `SUPA-TRANS-006 — Definir vistas, wrappers o aliases temporales de compatibilidad`  
**Tipo de tarea:** definición documental del contrato de backfill, reconciliación y corrección de calidad por unidad de migración; sin DDL, DML, ejecución de migraciones, mutación de datos, despliegues, cambios de RLS, cambios de writers, cutover, rollback operativo ni retiros físicos

#### 1. Resultado concreto

Esta tarea establece el contrato canónico:

```text
BACKFILL-AND-DATA-QUALITY-PLAN-005@1.0.0
```

El contrato extiende cada `migration_unit` de `MIGRATION-ORDER-004@1.0.0` con una estrategia verificable para:

- determinar si necesita backfill;
- fijar el corte y baseline de la fuente;
- seleccionar un modo cerrado de tratamiento;
- preservar identidad, historia, procedencia y autoridad;
- clasificar defectos y ambigüedades;
- definir lotes, checkpoints, reanudación e idempotencia;
- reconciliar fuente, destino y efectos derivados;
- impedir pérdida, invención o fusión silenciosa de datos;
- producir evidencia consumible por las tareas posteriores.

El contrato aplica a las **970 identidades** preservadas por `TRANSITION-MAP-001@1.0.0`, clasificadas por `DISPOSITION-MAP-002@1.0.2` y ordenadas mediante `MIGRATION-ORDER-004@1.0.0`.

Esta tarea no ejecuta backfills ni declara que una unidad haya superado dry run, reconciliación, cutover o rollback.

#### 2. Fuentes canónicas aplicadas

| Fuente                                    | Decisión consumida                                                                                                          |
| ----------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| `TRANSITION-MAP-001@1.0.0`                | universo cerrado de 970 identidades y claves estables de transición                                                         |
| `DISPOSITION-MAP-002@1.0.2`               | 420 `CONSERVAR`, 494 `MOVER`, 11 `FUSIONAR`, 6 `DIVIDIR`, 0 `RENOMBRAR` y 39 `RETIRAR`                                      |
| `DEPENDENCY-MAP-003@1.0.0`                | dependencias estructurales, candidatas, dinámicas, externas y bloqueadas                                                    |
| `MIGRATION-ORDER-004@1.0.0`               | 26 responsabilidades, oleadas, unidades, gates y secuencia de transición                                                    |
| `DATA-NORM-AUD-001` a `DATA-NORM-AUD-007` | defectos, excepciones, duplicados, transformaciones, consumidores e impacto de normalización                                |
| `DATA-NORM-ARC-001` a `DATA-NORM-ARC-012` | políticas por campo, clases, transformaciones, excepciones, revisión, búsqueda, auditoría, unicidad, capas y datos externos |
| `SUPA-AUD-022` a `SUPA-AUD-024`           | inventario, dependencias, riesgos y cohortes de calidad ya identificadas                                                    |
| `SUPA-ARC-001` a `SUPA-ARC-025`           | ownership, contratos, seguridad, eventos, escrituras, recuperación, ambientes y ADR aceptado                                |
| registro canónico `04A`                   | requisitos vigentes de migración, calidad, identidad, replay, lotes, reconciliación y recuperación                          |

#### 3. Alcance exacto

La tarea define:

1. el contrato mínimo de backfill por `migration_unit`;
2. los modos cerrados de backfill;
3. los modos permitidos de mapping y corrección;
4. el baseline y los tipos de corte de fuente;
5. las dimensiones obligatorias de calidad;
6. la preservación de originales, lineage y autoridad;
7. las reglas de identidad, crosswalk y referencias;
8. la semántica de nulos, números, unidades, tiempo, texto y valores externos;
9. el tratamiento de duplicados, huérfanos, merges y splits;
10. los lotes, checkpoints, outcomes, reanudación e idempotencia;
11. la cuarentena y revisión de casos ambiguos;
12. las reglas de reconciliación y tolerancia;
13. la conducta por clase de objeto y disposición;
14. la estrategia base por las 26 responsabilidades objetivo;
15. los gates documentales y handoffs hacia `SUPA-TRANS-006` a `SUPA-TRANS-015`.

La tarea no define ni ejecuta:

- nombres físicos finales;
- scripts DDL o DML;
- estrategia de compatibilidad temporal, propiedad de `SUPA-TRANS-006`;
- adaptación de consumidores, propiedad de `SUPA-TRANS-007`;
- writers, doble escritura o concurrencia durante coexistencia, propiedad de `SUPA-TRANS-008`;
- suites ejecutables antes y después de migrar, propiedad de `SUPA-TRANS-009`;
- certificación de seguridad o rendimiento, propiedad de `SUPA-TRANS-010`;
- rollback ejecutable, propiedad de `SUPA-TRANS-011`;
- retiro físico, propiedad de `SUPA-TRANS-012`;
- promoción por ambientes, propiedad de `SUPA-TRANS-013`;
- tipos y contratos generados, propiedad de `SUPA-TRANS-014`;
- roadmap ejecutable, propiedad de `SUPA-TRANS-015`.

#### 4. Extensión obligatoria de cada unidad de migración

Cada `migration_unit` deberá incorporar como mínimo:

```text
backfill_plan_id
migration_unit_id
transition_keys
owner_schema
wave_id
source_authority
target_authority
source_cut_strategy
source_cut_reference
source_snapshot_or_digest
disposition_set
backfill_mode
mapping_contract
policy_versions
identity_contract
reference_contract
temporal_contract
null_semantics_contract
duplicate_resolution_contract
quarantine_contract
batch_contract
checkpoint_contract
idempotency_contract
reconciliation_contract
acceptance_profile
zero_tolerance_invariants
security_profile
evidence_bundle
downstream_handoffs
backfill_status
```

Reglas:

1. `backfill_plan_id` será estable y versionado.
2. `transition_keys` conservará las claves de `TRANSITION-MAP-001@1.0.0` sin reconstruir identidades.
3. una unidad con varias identidades declarará tratamiento por identidad y reglas comunes del grupo;
4. una identidad en más de una fase deberá conservar un plan raíz y revisiones vinculadas, no planes independientes contradictorios;
5. todo campo desconocido o no resuelto bloqueará la elegibilidad de ejecución;
6. un plan no podrá declararse listo únicamente porque el destino exista o porque los conteos coincidan.

#### 5. Modos cerrados de backfill

Cada unidad seleccionará exactamente uno como modo principal y podrá declarar submodos por componente sin contradecirlo:

| Modo                       | Uso permitido                                                                                     | Condición principal                                                                                  |
| -------------------------- | ------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- |
| `NO_BACKFILL_REQUIRED`     | funciones, triggers, políticas, contratos u objetos sin estado persistido que trasladar           | demostrar que no existe dato, cola, checkpoint, archivo, configuración o historia asociada pendiente |
| `EXACT_COPY`               | valores y filas cuya identidad, semántica y autoridad permanecen sin transformación               | igualdad de claves, tipos, nulabilidad y significado demostrada                                      |
| `VERSIONED_TRANSFORMATION` | cambio determinista de estructura, enum, representación o formato                                 | mapping y políticas inmutables, versionadas e idempotentes                                           |
| `REFERENCE_CROSSWALK`      | cambio de claves o referencias entre identidades estables                                         | crosswalk completo, auditable y sin resolución por nombre                                            |
| `LEDGER_OR_HISTORY_REPLAY` | reconstrucción desde hechos, eventos, outbox, snapshots o historia durable                        | replay seguro, orden, idempotencia, audiencia y causalidad preservados                               |
| `PROJECTION_REBUILD`       | vistas materializadas lógicas, saldos, agregados, disponibilidad, búsqueda o reportes derivados   | fuente certificada y fórmula versionada; la proyección no se copia como autoridad                    |
| `APPROVED_MERGE_PLAN`      | grupos `FUSIONAR` con autoridad, sobreviviente, crosswalk y tratamiento de divergencias aprobados | prohibida la selección por schema, antigüedad, frecuencia, completitud o nombre                      |
| `APPROVED_SPLIT_PLAN`      | identidades `DIVIDIR` con discriminador y destino por propietario, finalidad o sensibilidad       | cobertura total de filas, metadata, archivos, referencias y retención                                |
| `QUARANTINE_ONLY`          | datos no transformables responsablemente dentro del corte                                         | owner, motivo, evidencia, estado y puerta de resolución obligatorios                                 |
| `NO_COPY_RETIREMENT`       | objetos `RETIRAR` sin dato que deba continuar en el destino                                       | retención, evidencia, cero consumidores y recuperación definidos antes del retiro                    |

Ningún modo autoriza por sí mismo la ejecución física.

#### 6. Modos permitidos de mapping y corrección

Cuando exista transformación, se reutilizarán los modos canónicos de `DATA-NORM-ARC-012`:

```text
EXACT_CONTRACT_MAPPING
VERSIONED_ENUM_MAPPING
APPROVED_ALIAS_MAPPING
STRUCTURED_COMPONENT_MAPPING
DERIVE_WITHOUT_SOURCE_MUTATION
PRESERVE_AND_DEFER
HUMAN_REVIEW_REQUIRED
ESCALATE_STRUCTURAL_OR_IDENTITY
```

Reglas obligatorias:

1. no se permite similitud, frecuencia, primer resultado ni heurística local como mapping;
2. `APPROVED_ALIAS_MAPPING` exige alias explícito, fuente y versión;
3. `DERIVE_WITHOUT_SOURCE_MUTATION` crea una representación separada y no sobrescribe el original;
4. `PRESERVE_AND_DEFER` mantiene el dato y bloquea la mutación dependiente;
5. `HUMAN_REVIEW_REQUIRED` no produce automáticamente un valor objetivo;
6. `ESCALATE_STRUCTURAL_OR_IDENTITY` impide continuar hasta resolver ownership, identidad o modelo;
7. un cambio de mapping, catálogo, diccionario, locale, Unicode, parser o regla produce una nueva versión y un nuevo dry run.

#### 7. Baseline y corte de fuente

Toda unidad deberá declarar un baseline reproducible que incluya:

```text
ambiente
owner
source_object_versions
schema_or_contract_version
source_cut_strategy
source_cut_timestamp_or_watermark
row_or_object_count
primary_key_set_or_digest
reference_set_or_digest
null_and_domain_profile
critical_aggregates
policy_and_mapping_versions
sensitivity_and_retention_profile
capture_actor_and_evidence
```

Los tipos de corte permitidos son:

| Estrategia                  | Aplicación                                                                                      |
| --------------------------- | ----------------------------------------------------------------------------------------------- |
| `QUIESCED_SNAPSHOT`         | fuente temporalmente estable con writers suspendidos mediante una decisión posterior autorizada |
| `HIGH_WATERMARK_PLUS_DELTA` | fuente activa con corte y delta posterior gobernados por `SUPA-TRANS-008`                       |
| `APPEND_ONLY_RANGE`         | hechos o ledger acotados por rango inmutable y checkpoint                                       |
| `EVENT_REPLAY_WINDOW`       | reconstrucción desde eventos u outbox durables dentro de una ventana explícita                  |
| `EXTERNAL_BATCH_VERSION`    | archivo, importación o entrega externa identificada por versión y digest                        |

Si la fuente puede cambiar durante la ejecución y `SUPA-TRANS-008` todavía no ha resuelto writers, concurrencia y delta, la unidad permanece bloqueada.

#### 8. Preservación del original, autoridad y lineage

1. El valor o registro original se conservará cuando sea externo, oficial, personal, técnico, histórico, sensible o necesario para auditoría.
2. Ninguna corrección destruirá payload, archivo, snapshot, ledger, evento, comprobante o evidencia original.
3. Toda salida transformada conservará fuente, clave, versión, mapping, actor o sistema, tiempo, causalidad y resultado.
4. Un dato derivado no adquiere autoridad sobre su fuente.
5. Una vista, snapshot, reporte, proyección o catálogo consumidor no corregirá el owner original.
6. Un valor más completo o reciente no se declarará correcto sin autoridad y vigencia demostradas.
7. Credenciales, secretos y material criptográfico no ingresarán al pipeline general; solo se migrarán mediante referencias o mecanismos protegidos definidos por su owner.
8. La trazabilidad mínima enlazará `source_record`, `target_record`, `transition_key`, `mapping_version`, `batch_id`, `checkpoint_id` y `outcome`.

#### 9. Identidad, crosswalk y referencias

1. UUID, claves naturales, IDs externos y claves de negocio se tratarán como conceptos distintos.
2. No se generará una identidad nueva cuando exista una identidad estable que deba preservarse.
3. No se impondrá el UUID recibido desde un cliente como autoridad sin contrato server-side.
4. Todo cambio de clave usará un crosswalk versionado y auditable.
5. Correo, teléfono, documento, nombre, slug, SKU o referencia externa no fusionarán registros automáticamente.
6. Las referencias externas conservarán emisor, ambiente, tenant, tipo, vigencia y contrato.
7. Cada FK o referencia lógica deberá terminar como válida, redirigida por crosswalk, conservada en cuarentena o clasificada como bloqueo.
8. Un registro padre no se considerará migrado mientras existan hijos, snapshots, JSON, archivos o consumidores que aún lo referencien sin tratamiento.
9. Las referencias circulares se resolverán mediante fases o constraints diferibles aprobados posteriormente; no se rompen eliminando vínculos.
10. El backfill no podrá crear huérfanos ni ocultarlos mediante valores nulos o placeholders.

#### 10. Semántica de ausencia, números, unidades, tiempo y texto

El plan deberá preservar como estados distintos:

```text
campo ausente
null explícito
cadena vacía
solo espacios
clear explícito
desconocido
no aplicable
valor parcial
```

Reglas:

1. no se utilizará un valor predeterminado para encubrir desconocimiento;
2. un `NOT NULL` futuro requiere resolver o aislar los datos existentes antes de validarse;
3. números conservan forma original, signo, escala, precisión, moneda, unidad, locale y contexto;
4. conversiones de unidad o moneda exigen regla versionada y evidencia de origen;
5. timestamps conservan instante, zona, offset, precisión, fuente y semántica empresarial;
6. eventos tardíos, fuera de orden, corregidos o retractados no sobrescriben por orden de llegada;
7. texto se gobierna por dominio, entidad, campo, representación y versión, nunca por una función global;
8. marcas, siglas, unidades, nombres legales, personas, direcciones, identificadores y originales externos conservan las protecciones de `DATA-NORM-ARC-001` a `DATA-NORM-ARC-012`;
9. JSON y arreglos se tratan por clave o elemento, no como una sola cadena;
10. VITAL no hereda las políticas transversales de Vento OS.

#### 11. Dimensiones obligatorias de calidad

| Dimensión                  | Evidencia mínima                                           | Condición de cierre                                                |
| -------------------------- | ---------------------------------------------------------- | ------------------------------------------------------------------ |
| completitud                | campos requeridos, ausencias y cobertura por cohorte       | toda ausencia queda resuelta, permitida o aislada con owner        |
| validez contractual        | tipos, dominios, enums, formatos y constraints             | cero valores incompatibles no clasificados                         |
| identidad y unicidad       | claves, scopes, vigencias, duplicados y colisiones         | ninguna fusión o constraint se activa por similitud no certificada |
| integridad referencial     | FK, referencias lógicas, JSON, archivos y externos         | cero huérfanos no explicados                                       |
| consistencia               | equivalencia entre fuentes, copias, aliases y proyecciones | divergencias clasificadas y con autoridad definida                 |
| integridad temporal        | orden, vigencia, supersesión, estados y secuencias         | cero inversión o solapamiento que altere el significado            |
| autoridad y exactitud      | owner, fuente, evidencia y política                        | cada corrección tiene autoridad suficiente y reproducible          |
| lineage y auditoría        | origen, mapping, lote, actor, causalidad y resultado       | cada efecto objetivo puede trazarse hasta la fuente                |
| seguridad y privacidad     | sensibilidad, minimización, acceso, retención y masking    | cero exposición nueva o mezcla de fronteras                        |
| reconciliación empresarial | conteos, sumas, saldos, movimientos, documentos y hechos   | diferencias dentro del perfil aprobado y sin pérdida silenciosa    |

Una dimensión no evaluada mantiene el gate abierto.

#### 12. Correcciones permitidas y prohibidas

Se permiten únicamente:

- correcciones deterministas respaldadas por contrato y versión;
- mapeos exactos o aliases aprobados;
- reconstrucción de proyecciones desde fuentes certificadas;
- reparación de referencias mediante crosswalk aprobado;
- rectificaciones aditivas que preserven el hecho anterior;
- aislamiento o cuarentena con owner y evidencia;
- decisiones humanas registradas mediante workflow autorizado.

Quedan prohibidos:

1. inventar valores para completar campos;
2. elegir el registro más antiguo, más reciente, más usado o más completo como autoridad automática;
3. deduplicar por nombre normalizado, correo, teléfono, texto parecido o coincidencia parcial;
4. sobrescribir ledgers, historia, comprobantes, snapshots o eventos para que coincidan;
5. convertir error técnico en corrección de datos;
6. reinterpretar una versión histórica con la política vigente;
7. ocultar diferencias mediante truncamiento, rounding, `coalesce`, defaults o nulificación;
8. mezclar tenants, sedes, productos, ambientes o fronteras de producto;
9. ejecutar correcciones semánticas dentro de triggers defensivos;
10. continuar cuando owner, mapping o autoridad estén en conflicto.

#### 13. Tratamiento de duplicados, fusiones y divisiones

Todo candidato a duplicado deberá pasar por las políticas de `DATA-NORM-ARC-010` y conservar:

```text
scope
miembros y versiones
evidencia positiva y negativa
autoridad por atributo
relaciones y hechos
referencias externas
estado y vigencia
plan de transición
crosswalk
rollback o compensación
aprobaciones
```

Reglas:

1. `CONFIRMED_DUPLICATE_PENDING_PLAN` no habilita backfill de consolidación.
2. Solo `CONFIRMED_DUPLICATE_WITH_APPROVED_PLAN` puede alimentar `APPROVED_MERGE_PLAN`.
3. La selección de sobreviviente nunca es implícita.
4. Una fusión preserva IDs históricos, aliases, redirecciones, tombstones, hechos y auditoría.
5. Una división debe asignar cada fila, archivo, metadata y referencia a un destino explícito o a cuarentena.
6. Un elemento puede producir varios destinos únicamente cuando la regla aprobada lo exija y se preserve causalidad.
7. Ninguna fila puede desaparecer porque no cumpla el discriminador esperado.
8. Los seis casos `DIVIDIR` conservarán owner, finalidad, sensibilidad, retención, consumidores y metadata antes de separar binarios o registros.

#### 14. Lotes, checkpoints, reanudación e idempotencia

Cada ejecución futura deberá declarar:

```text
backfill_run_id
batch_id
chunk_id
source_cut_reference
mapping_and_policy_versions
first_and_last_source_key
expected_item_count
confirmed_item_count
rejected_item_count
quarantined_item_count
checkpoint_digest
started_at
committed_at
status
```

Reglas:

1. el tamaño y orden de chunk serán deterministas o quedarán registrados;
2. el checkpoint se confirma únicamente después del commit de sus efectos;
3. una reanudación usa el mismo corte, mapping, políticas y reglas;
4. elementos ya confirmados no vuelven a mutarse;
5. la misma identidad de operación con payload igual reutiliza el resultado;
6. la misma identidad con payload o versión diferente produce conflicto;
7. timeout o respuesta perdida exige consultar el resultado antes de reintentar;
8. un fallo parcial registra outcome por elemento y no se presenta como rollback global;
9. cambiar el source cut crea una nueva corrida vinculada, no reescribe la anterior;
10. todo bypass administrativo exige actor, finalidad, ventana, autorización y evidencia equivalentes.

#### 15. Outcomes por elemento

Cada fila, archivo, evento o componente procesado deberá terminar exactamente en uno:

| Outcome                         | Significado                                                              |
| ------------------------------- | ------------------------------------------------------------------------ |
| `NO_ACTION_REQUIRED`            | la unidad no requiere mutación de datos                                  |
| `PRESERVED_SOURCE`              | se conserva en origen o como evidencia sin transformación                |
| `COPIED_EXACTLY`                | se copió sin cambio semántico                                            |
| `TRANSFORMED_BY_VERSIONED_RULE` | se produjo una salida determinista mediante contrato versionado          |
| `REFERENCE_REMAPPED`            | se actualizó una referencia mediante crosswalk aprobado                  |
| `PROJECTION_REBUILT`            | se reconstruyó un derivado desde fuentes certificadas                    |
| `MERGED_BY_APPROVED_PLAN`       | se consolidó dentro de un plan aprobado y auditable                      |
| `SPLIT_BY_APPROVED_PLAN`        | se distribuyó según una regla de división aprobada                       |
| `QUARANTINED`                   | quedó aislado con owner, motivo y evidencia                              |
| `REVIEW_REQUIRED`               | requiere decisión humana o de autoridad de dominio                       |
| `REJECTED_FROM_TARGET`          | no puede entrar al destino, pero el original se preserva                 |
| `FAILED_TECHNICALLY`            | no se obtuvo outcome empresarial y puede requerir reanudación controlada |

No se admite un estado genérico de éxito que oculte resultados parciales.

#### 16. Cuarentena y revisión

Toda excepción deberá registrar como mínimo:

```text
exception_id
migration_unit_id
transition_key
source_record_or_object
exception_class
original_reference
source_cut
mapping_and_policy_versions
owner
required_authority
sensitivity
status
evidence
resolution_task
reprocess_eligibility
```

Clases mínimas:

```text
UNMAPPED_VALUE
AMBIGUOUS_IDENTITY
MISSING_REFERENCE
CONFLICTING_AUTHORITY
INVALID_TEMPORAL_ORDER
DUPLICATE_CANDIDATE
UNSUPPORTED_CONTRACT_VERSION
SENSITIVE_DATA_REVIEW
SOURCE_DRIFT
INVARIANT_VIOLATION
```

Reglas:

1. cuarentena no equivale a descarte;
2. todo caso conserva el original y una tarea propietaria;
3. una revisión no muta datos por sí misma;
4. una resolución crea evidencia nueva y no edita la decisión anterior;
5. reprocess solo opera con versiones compatibles y una identidad estable;
6. un caso no se cierra por silencio, antigüedad o vencimiento de SLA;
7. datos sensibles permanecen minimizados y con acceso segregado;
8. una excepción bloqueante impide certificar la unidad aunque el resto haya reconciliado.

#### 17. Reconciliación obligatoria

Cada unidad declarará comparaciones antes y después del backfill, como mínimo:

- conteo total y por cohorte;
- conjunto o digest de claves primarias;
- conjunto o digest de referencias;
- distribución de nulos y valores de dominio;
- duplicados y colisiones por scope;
- huérfanos físicos y lógicos;
- conteos por estado y vigencia;
- mínimos, máximos y rangos temporales;
- sumas, saldos y agregados críticos;
- secuencia de ledger, eventos o movimientos;
- cantidad y digest de archivos, objetos y metadata;
- resultados por outcome;
- divergencias entre fuente, destino, compatibilidad y proyecciones;
- errores, cuarentenas y casos pendientes;
- exposición, tenant y frontera de producto.

La reconciliación deberá explicar cada diferencia. La igualdad de conteos no prueba por sí sola igualdad semántica, identidad, referencias, seguridad o efectos.

#### 18. Invariantes de tolerancia cero

No se permitirá ninguna tolerancia para:

1. pérdida o duplicación de identificadores estables;
2. referencias autoritativas huérfanas;
3. valores de estado o enum sin mapping;
4. filas omitidas sin outcome;
5. mezcla de tenant, sede, ambiente o producto;
6. saldo, cantidad o movimiento irreconciliable en ledgers y hechos críticos;
7. evento o efecto empresarial duplicado;
8. original externo o evidencia destruida;
9. secreto o dato sensible expuesto por el proceso;
10. VITAL incorporado a una autoridad de Vento OS;
11. política, mapping o source cut no identificables;
12. caso bloqueante sin owner ni tarea de resolución;
13. writer activo no cubierto por la estrategia de `SUPA-TRANS-008`;
14. rollback requerido sin handoff a `SUPA-TRANS-011`.

Las tolerancias distintas de cero solo podrán aplicarse a métricas no autoritativas, con umbral, justificación, owner, periodo, tendencia y puerta de cierre. Nunca podrán ocultar pérdida de datos o integridad.

#### 19. Tratamiento por clase de objeto

| Clase                                  | Estrategia base                                                                                                     |
| -------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| tabla o relación persistida            | plan completo de datos, identidad, referencias, lotes y reconciliación                                              |
| vista o proyección                     | `PROJECTION_REBUILD` o `NO_BACKFILL_REQUIRED`; nunca se copia como fuente autoritativa                              |
| función o RPC                          | `NO_BACKFILL_REQUIRED`, salvo que administre estado auxiliar, checkpoints, colas o resultados persistidos           |
| trigger                                | sin backfill propio; su tabla, función y efectos históricos deben estar reconciliados antes de activarlo            |
| política RLS o grant                   | sin backfill de datos; requiere demostrar que el tratamiento no amplía visibilidad                                  |
| bucket de Storage                      | inventario de objetos, digest, tamaño, content type, metadata, owner, entidad, sensibilidad, retención y referencia |
| Edge Function                          | sin backfill por código; colas, inbox, outbox, receipts, configuraciones y estados asociados sí requieren plan      |
| cron job                               | sin backfill del job; checkpoints, runs, locks, resultados y efectos pendientes requieren reconciliación            |
| evidencia de migración                 | preservar de forma inmutable; no ejecutar ni reinterpretar como estado productivo                                   |
| componente administrado por plataforma | no mover datos empresariales; verificar dependencia y frontera soportada                                            |

#### 20. Tratamiento por disposición

| Disposición | Identidades | Regla de datos                                                                                                                             |
| ----------- | ----------: | ------------------------------------------------------------------------------------------------------------------------------------------ |
| `CONSERVAR` |         420 | baseline, calidad y drift obligatorios; no se asume ausencia de deuda por permanecer en la misma frontera                                  |
| `MOVER`     |         494 | preservar identidad y autoridad; aplicar `EXACT_COPY`, `VERSIONED_TRANSFORMATION`, `REFERENCE_CROSSWALK`, replay o rebuild según el objeto |
| `FUSIONAR`  |          11 | requiere `APPROVED_MERGE_PLAN`, crosswalk, divergencias resueltas, historia preservada y cero doble escritura implícita                    |
| `DIVIDIR`   |           6 | requiere `APPROVED_SPLIT_PLAN`, discriminador exhaustivo, cobertura de metadata, archivos, referencias, retención y consumidores           |
| `RENOMBRAR` |           0 | no existen casos vigentes; cualquier caso nuevo exige revisión de disposición y no se trata como refactor neutral                          |
| `RETIRAR`   |          39 | reconciliar datos, retención, sustitución y cero consumidores; usar `NO_COPY_RETIREMENT` solo cuando no exista estado que preservar        |

#### 21. Casos explícitos de disposición

##### 21.1. Fusión de asistencia

`public.asistencia_logs`, `public.attendance_logs` y sus automatismos conservarán toda historia, actores, timestamps, estados, correcciones y efectos. `public.attendance_logs` es ancla de identidad, pero no se convierte automáticamente en autoridad de cada valor divergente. Toda divergencia deberá resolverse por contrato o cuarentena.

##### 21.2. Fusión de roles operativos por sede

`public.site_operational_roles` y `viso.site_operational_roles` deberán reconciliar identidad, sede, rol, vigencia, referencias y consumidores. La convergencia no admite doble escritura implícita ni selección por schema.

##### 21.3. Fusión del cierre diario de asistencia

Los jobs `cron.auto-close-attendance` y `cron.anima_attendance_day_end_close_0005` no requieren copiar un job como dato. Sus runs, checkpoints, cierres ejecutados, omisiones, reintentos y efectos deberán reconciliarse antes de mantener una sola programación.

##### 21.4. División documental y de Storage

`public.documents`, `public.document_types`, `public.required_document_rules` y los buckets `documents`, `employee-photos` y `public-documents` deberán separar propietario, finalidad, sensibilidad, retención, metadata, binario y consumidores. Ningún archivo se moverá únicamente por ruta, nombre o bucket actual.

##### 21.5. Temporales y legacy

`public.product_categories_backup_20260316_preparaciones` y `public.staging_insumos_import` conservarán custodio, datos, lote, procedencia, consumidores, retención y reconciliación. Su disposición `RETIRAR` no autoriza eliminación y exige demostrar que ninguna fila continúa siendo autoridad o evidencia necesaria.

##### 21.6. Proyecciones y funciones retirables

Las proyecciones `CURRENT_COMPATIBILITY_PROJECTION`, `public.notify_shift_published()` y `public.update_loyalty_balance()` deberán demostrar fuente sucesora, equivalencia, consumidores, historia y ausencia de estado auxiliar antes del retiro. Una función sin filas propias puede seguir teniendo efectos o dependencias que requieren reconciliación.

#### 22. Estrategia base por responsabilidad objetivo

| Oleada                           | Responsabilidad                      | Estrategia base de backfill y calidad                                                                                            |
| -------------------------------- | ------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------- |
| `W0_CONTROL_FOUNDATION`          | `VSCHEMA-001 org_governance`         | copiar identidades organizacionales y referencias estables; validar tenant, entidad legal, sede, área, jerarquía y vigencia      |
| `W0_CONTROL_FOUNDATION`          | `VSCHEMA-023 identity_access`        | usar crosswalk de cuenta, sujeto, sesión, rol y dispositivo; prohibir fusiones por correo, teléfono o nombre                     |
| `W0_CONTROL_FOUNDATION`          | `VSCHEMA-022 technology_operations`  | preservar configuración, jobs y referencias protegidas; secretos se tratan fuera del pipeline general                            |
| `W1_PEOPLE_OPERATIONS`           | `VSCHEMA-002 recruiting`             | preservar candidatos, consentimientos, documentos y procedencia externa; separar identidad de contratación                       |
| `W1_PEOPLE_OPERATIONS`           | `VSCHEMA-003 workforce`              | conservar trabajador, relación laboral, historia, documentos y vínculos Auth sin aprovisionamiento o fusión automática           |
| `W1_PEOPLE_OPERATIONS`           | `VSCHEMA-004 work_scheduling`        | preservar versiones, fechas, zonas, turnos, borradores, publicaciones y temporalidad                                             |
| `W1_PEOPLE_OPERATIONS`           | `VSCHEMA-005 attendance`             | aplicar el merge aprobado, conservar marcaciones, cierres, correcciones, fuentes y secuencia temporal                            |
| `W1_PEOPLE_OPERATIONS`           | `VSCHEMA-006 payroll`                | tratar hechos económicos y laborales como historia reconciliable; no recomputar ni sobrescribir periodos cerrados sin contrato   |
| `W1_PEOPLE_OPERATIONS`           | `VSCHEMA-007 operational_compliance` | preservar evidencia, vigencia, responsable, documento y relación con trabajador o proceso                                        |
| `W2_PRODUCT_AND_OFFER`           | `VSCHEMA-008 product_catalog`        | preservar IDs, variantes, roles, presentaciones, unidades y taxonomías; duplicados se revisan por scope y estructura             |
| `W2_PRODUCT_AND_OFFER`           | `VSCHEMA-009 recipes`                | conservar versiones, composición, rendimiento, unidades, vigencia e ingredientes sin fusionar por nombre                         |
| `W2_PRODUCT_AND_OFFER`           | `VSCHEMA-010 commercial_offer`       | reconstruir disponibilidad, precio y oferta desde catálogo y reglas certificadas cuando sean proyecciones                        |
| `W3_SUPPLY_AND_PRODUCTION`       | `VSCHEMA-011 procurement`            | conservar proveedor, contratos, presentaciones, órdenes, recepciones, obligaciones y referencias externas                        |
| `W3_SUPPLY_AND_PRODUCTION`       | `VSCHEMA-012 inventory`              | reconstruir saldos desde movimientos y hechos autorizados; prohibido fijar stock para cuadrar diferencias                        |
| `W3_SUPPLY_AND_PRODUCTION`       | `VSCHEMA-013 assets`                 | preservar identidad de activo, serial, modelo, sede, estado, mantenimiento, evidencia y vida útil                                |
| `W3_SUPPLY_AND_PRODUCTION`       | `VSCHEMA-020 facilities`             | reconciliar referencias a sedes, activos, compras, mantenimiento y cumplimiento sin absorber sus autoridades                     |
| `W3_SUPPLY_AND_PRODUCTION`       | `VSCHEMA-014 production`             | conservar lotes, recetas, consumos, rendimientos, resultados, fechas y trazabilidad hacia inventario                             |
| `W4_COMMERCIAL_FULFILLMENT`      | `VSCHEMA-017 customer_engagement`    | separar persona, cuenta, contactos, consentimiento, perfil y relación de marca; no fusionar por contacto coincidente             |
| `W4_COMMERCIAL_FULFILLMENT`      | `VSCHEMA-015 sales_orders`           | conservar orden, líneas, versiones, estados, correcciones, cancelaciones y referencias comerciales                               |
| `W4_COMMERCIAL_FULFILLMENT`      | `VSCHEMA-016 payments`               | preservar intentos, autorizaciones, capturas, reversos, conciliación y ledger; nunca sobrescribir para obtener un saldo esperado |
| `W4_COMMERCIAL_FULFILLMENT`      | `VSCHEMA-018 logistics`              | conservar solicitud, producción, carga, tránsito, recepción, cantidades, evidencias y secuencia de estados                       |
| `W5_RECORD_AND_ECONOMIC_CLOSURE` | `VSCHEMA-019 finance`                | reconstruir proyecciones desde hechos certificados y preservar asientos, obligaciones, ajustes y periodos cerrados               |
| `W5_RECORD_AND_ECONOMIC_CLOSURE` | `VSCHEMA-024 business_records`       | aplicar la división documental, conservar original, hash, metadata, retención, owner y entidad vinculada                         |
| `W5_RECORD_AND_ECONOMIC_CLOSURE` | `VSCHEMA-021 marketing`              | preservar campaña, canal, audiencia, consentimiento, versión y resultados sin ampliar finalidad                                  |
| `W6_DERIVED_AND_CONTINUITY`      | `VSCHEMA-025 business_insights`      | usar `PROJECTION_REBUILD`; no copiar métricas o reportes como fuente que corrija dominios operativos                             |
| `W6_DERIVED_AND_CONTINUITY`      | `VSCHEMA-026 operational_continuity` | preservar contratos, incidentes, degradaciones, checkpoints, recuperación y evidencia de ejercicios                              |

La estrategia base no sustituye el plan por unidad. Una dependencia o sensibilidad más restrictiva prevalece.

#### 23. Fronteras especiales

1. Las 54 relaciones VITAL y sus objetos asociados permanecen en `OUTSIDE_VENTO_OS_VITAL`.
2. Ningún backfill de Vento OS escribirá, normalizará, fusionará o corregirá datos de VITAL.
3. Una interoperabilidad futura requerirá contrato y ADR propios.
4. Los componentes administrados por Supabase o PostgreSQL no se reclasifican como datos empresariales.
5. Buckets, Auth, Realtime, cron y extensiones se tratan mediante interfaces soportadas y sin modificar tablas internas por conveniencia.
6. Los objetos `TEMPORARY_OR_LEGACY` no se convierten en fuentes permanentes por participar en reconciliación.
7. El delta mensual de VISO permanece como evidencia propuesta y no se ejecuta desde esta tarea.

#### 24. Estados del plan

Cada unidad utilizará exactamente uno:

| Estado                                     | Significado                                                                          |
| ------------------------------------------ | ------------------------------------------------------------------------------------ |
| `BACKFILL_NOT_APPLICABLE`                  | no existe estado que trasladar y la ausencia fue demostrada                          |
| `BACKFILL_PLAN_BLOCKED`                    | falta owner, fuente, mapping, dependencia, writer strategy, seguridad o autoridad    |
| `BACKFILL_PLAN_SPECIFIED`                  | contrato completo definido, todavía sin dry run                                      |
| `BACKFILL_DRY_RUN_ELIGIBLE`                | baseline, versiones, datos y dependencias permiten ejecutar un dry run futuro        |
| `BACKFILL_DRY_RUN_RECONCILED`              | dry run futuro ejecutado y diferencias explicadas con evidencia                      |
| `BACKFILL_EXECUTION_ELIGIBLE`              | gates de writers, compatibilidad, seguridad, pruebas y rollback completos            |
| `BACKFILL_EXECUTED_PENDING_RECONCILIATION` | ejecución futura confirmada, todavía sin cierre de paridad                           |
| `BACKFILL_RECONCILED`                      | fuente, destino, efectos, excepciones y evidencia reconciliados                      |
| `BACKFILL_FAILED`                          | fallo técnico o empresarial que impide continuar y conserva checkpoint y diagnóstico |

Esta tarea deja las unidades en `BACKFILL_PLAN_SPECIFIED`, `BACKFILL_PLAN_BLOCKED` o `BACKFILL_NOT_APPLICABLE` según la evidencia disponible. No declara dry runs ni ejecuciones realizadas.

#### 25. Gates previos a ejecución

Una unidad no podrá llegar a `BACKFILL_EXECUTION_ELIGIBLE` hasta demostrar simultáneamente:

1. identidad, owner, disposición y destino inequívocos;
2. baseline y source cut reproducibles;
3. mapping, políticas y catálogos versionados;
4. inventario de writers y tratamiento de cambios concurrentes;
5. compatibilidad y consumidores tratados;
6. referencias, duplicados, nulos y temporalidad clasificados;
7. plan de lotes, checkpoints e idempotencia;
8. dry run reconciliado;
9. cuarentenas con owner y sin bloqueos ocultos;
10. seguridad, RLS, grants y minimización certificadas;
11. pruebas positivas, negativas, migratorias y de regresión definidas;
12. rendimiento y duración dentro de la ventana aprobada;
13. rollback ejecutable y evidencia de recuperación;
14. paridad del ambiente requerido;
15. aprobaciones de owner, steward y autoridades adicionales aplicables.

La falta de una puerta produce `BACKFILL_PLAN_BLOCKED`; no se compensa con una ventana de mantenimiento más amplia.

#### 26. Handoffs obligatorios

| Trabajo derivado                      | Tarea propietaria | Entrega mínima de esta tarea                                                                   |
| ------------------------------------- | ----------------- | ---------------------------------------------------------------------------------------------- |
| compatibilidad de lectura y escritura | `SUPA-TRANS-006`  | forma antigua, forma objetivo, periodo, source cut y campos aún no convergidos                 |
| adaptación de consumidores            | `SUPA-TRANS-007`  | mappings, IDs, outcomes, errores, cohortes y datos que pueden permanecer en cuarentena         |
| writers y delta                       | `SUPA-TRANS-008`  | estrategia de corte, fuentes activas, claves idempotentes, checkpoints y riesgo de divergencia |
| pruebas migratorias                   | `SUPA-TRANS-009`  | baseline, corpus, dimensiones, reconciliaciones, tolerancias y outcomes esperados              |
| seguridad y rendimiento               | `SUPA-TRANS-010`  | sensibilidad, acceso, volumen, batch, coste, exposición y datos de prueba permitidos           |
| rollback                              | `SUPA-TRANS-011`  | source cut, crosswalk, efectos confirmados, checkpoints, reversibilidad y datos no reversibles |
| retiro legacy                         | `SUPA-TRANS-012`  | datos preservados, retención, cuarentena, cero consumidores y evidencia de sustitución         |
| paridad ambiental                     | `SUPA-TRANS-013`  | versiones, digests, baseline y resultados requeridos por ambiente                              |
| tipos y contratos                     | `SUPA-TRANS-014`  | modos, estados, outcomes, errores, mapping y versiones publicables                             |
| roadmap ejecutable                    | `SUPA-TRANS-015`  | unidades, gates, owners, dependencias, estados, evidencias y tareas bloqueantes                |

Ningún handoff autoriza automáticamente a la tarea siguiente a ejecutar cambios físicos.

#### 27. Evidencia mínima por unidad

El `evidence_bundle` deberá contener, como mínimo:

```text
migration_unit_id
backfill_plan_id
transition_keys
disposition_map_version
dependency_map_version
migration_order_version
source_cut_reference
source_baseline_digest
target_baseline_digest cuando exista
mapping_and_policy_versions
dry_run_reference cuando exista
reconciliation_report_reference
exception_register_reference
batch_and_checkpoint_reference
security_review_reference
test_plan_reference
rollback_plan_reference
owner_approval
steward_approval
status_and_decision_timestamp
```

Una referencia vacía, inexistente o no reproducible no satisface el gate. La evidencia podrá quedar pendiente en esta etapa, pero deberá conservar propietario y tarea de producción.

#### 28. Conductas no conformes

Quedan prohibidas:

1. ejecutar un backfill sin `migration_unit_id` y `backfill_plan_id`;
2. reconstruir identidades por nombre, schema, posición o orden de consulta;
3. usar la fecha actual, usuario actual o defaults para rellenar historia desconocida;
4. actualizar directamente una proyección para cuadrarla con la expectativa;
5. fijar stock, saldo, puntos, pago, costo o disponibilidad sin hechos reconciliables;
6. fusionar registros por representación normalizada;
7. aplicar constraints antes de resolver los datos existentes;
8. ignorar filas fallidas y reportar éxito del lote;
9. reanudar con otra versión de mapping sin una nueva corrida;
10. borrar staging, backups, archivos o legacy antes de retención, consumidores y rollback;
11. migrar secretos a tablas ordinarias o logs;
12. usar triggers para revisión humana, similitud, red o corrección semántica;
13. ampliar audiencia histórica durante replay o backfill;
14. tratar la igualdad de conteos como paridad suficiente;
15. aceptar tolerancias sobre pérdida de identidad, referencias, ledgers, seguridad o fronteras;
16. aplicar políticas de Vento OS a VITAL;
17. declarar ejecución, dry run o reconciliación sin evidencia real;
18. iniciar `SUPA-TRANS-006` dentro de esta tarea.

#### 29. Requisitos de prueba derivados

Se incorporan los siguientes requisitos:

- `TREQ-SUPABASE-1736` — plan obligatorio por `migration_unit`;
- `TREQ-SUPABASE-1737` — baseline y corte reproducibles;
- `TREQ-SUPABASE-1738` — modo cerrado compatible con disposición;
- `TREQ-SUPABASE-1739` — mapping determinista, versionado e idempotente;
- `TREQ-SUPABASE-1740` — preservación de original, autoridad y lineage;
- `TREQ-SUPABASE-1741` — identidad, crosswalk y referencias sin huérfanos;
- `TREQ-SUPABASE-1742` — semántica de ausencia, números, unidades, tiempo y texto;
- `TREQ-SUPABASE-1743` — duplicados, merges, splits y cuarentena controlados;
- `TREQ-SUPABASE-1744` — lotes, checkpoints y reanudación idempotente;
- `TREQ-SUPABASE-1745` — outcome obligatorio por elemento y éxito parcial explícito;
- `TREQ-SUPABASE-1746` — reconciliación multidimensional por unidad;
- `TREQ-SUPABASE-1747` — invariantes de tolerancia cero y gate de elegibilidad;
- `TREQ-SUPABASE-1748` — tratamiento específico por clase de objeto;
- `TREQ-SUPABASE-1749` — bloqueo mientras writers y delta permanezcan sin resolver;
- `TREQ-SUPABASE-1750` — tratamiento de fusiones, divisiones y retiros explícitos;
- `TREQ-SUPABASE-1751` — fronteras VITAL, plataforma y datos sensibles;
- `TREQ-SUPABASE-1752` — evidencia y handoff completo hacia tareas posteriores.

También se corrige la evidencia de `TREQ-SUPABASE-1702`, `TREQ-SUPABASE-1725` y `TREQ-SUPABASE-1735` para referenciar la versión canónica `DISPOSITION-MAP-002@1.0.2`.

#### 30. Criterios de aceptación

- [x] conserva las 970 identidades y sus claves de transición;
- [x] consume las seis disposiciones y sus conteos aprobados;
- [x] extiende cada unidad con un contrato de backfill y calidad;
- [x] define diez modos cerrados de backfill;
- [x] reutiliza los ocho modos canónicos de mapping y corrección;
- [x] define baseline, source cut, lote, checkpoint, outcome, cuarentena y evidencia;
- [x] separa identidad, autoridad, representación, original y proyección;
- [x] prohíbe valores inventados, fusiones por heurística y pérdida silenciosa;
- [x] cubre nulos, números, unidades, tiempo, texto, JSON, archivos y datos externos;
- [x] define diez dimensiones obligatorias de calidad;
- [x] establece invariantes de tolerancia cero;
- [x] trata tablas, vistas, funciones, triggers, Storage, Edge, cron, plataforma y evidencia;
- [x] concreta el tratamiento de los grupos de fusión, las seis divisiones y los retiros legacy explícitos;
- [x] fija estrategia base para las 26 responsabilidades objetivo;
- [x] mantiene VITAL separado de Vento OS;
- [x] entrega handoffs sin invadir `SUPA-TRANS-006` a `SUPA-TRANS-015`;
- [x] no ejecuta DDL, DML, backfills, dry runs, cutover, rollback ni retiros físicos;
- [x] reserva únicamente `SUPA-TRANS-006` como siguiente tarea.

#### 31. Continuidad

```text
ÚLTIMA TAREA APROBADA
SUPA-TRANS-004 — Definir orden de migración por dominio
        ↓
TAREA ACTUAL APROBADA
SUPA-TRANS-005 — Definir backfills y correcciones de calidad de datos
        ↓
SIGUIENTE TAREA RESERVADA
SUPA-TRANS-006 — Definir vistas, wrappers o aliases temporales de compatibilidad
```

La aprobación de esta tarea no inicia ni desarrolla `SUPA-TRANS-006`.


### [ ] SUPA-TRANS-006 — Definir vistas, wrappers o aliases temporales de compatibilidad
### [ ] SUPA-TRANS-007 — Definir adaptación coordinada de consumidores
### [ ] SUPA-TRANS-008 — Definir estrategia ante escrituras durante la transición
### [ ] SUPA-TRANS-009 — Definir pruebas antes y después de cada migración
### [ ] SUPA-TRANS-010 — Definir mediciones de rendimiento y seguridad
### [ ] SUPA-TRANS-011 — Definir rollback por paquete de cambio
### [ ] SUPA-TRANS-012 — Definir retiro progresivo de objetos legacy
### [ ] SUPA-TRANS-013 — Definir verificación de paridad local, staging y producción
### [ ] SUPA-TRANS-014 — Definir actualización de tipos, contratos y documentación
### [ ] SUPA-TRANS-015 — Crear roadmap ejecutable de migraciones en `vento-shell`

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
