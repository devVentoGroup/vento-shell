### PLAN DE TRANSICIÓN

### ✅ SUPA-TRANS-001 — Mapear cada objeto actual hacia la arquitectura objetivo

**Estado:** APROBADA  
**Fecha de preparación documental:** 2026-07-31  
**Bloque propietario:** BLOQUE E3 — Arquitectura canónica de datos y gobierno integral de Supabase  
**Marcador exacto que reemplaza:** `### [ ] SUPA-TRANS-001 — Mapear cada objeto actual hacia la arquitectura objetivo`  
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

El archivo SQL debe incorporarse al repositorio junto con esta tarea en:

```text
docs/plan-canonico/modular/bloques/E3_SUPABASE/SUPA_TRANS_001_TRANSITION_MAP.sql
```

No se considera cerrada la incorporación documental si se reemplaza esta sección sin incorporar también el archivo SQL.

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

**NO GENERA REQUISITOS DE PRUEBA NUEVOS NI MODIFICA EL REGISTRO 04A.**

La razón no es que el mapeo carezca de validación, sino que sus invariantes ya están protegidas por requisitos canónicos existentes, principalmente:

```text
TREQ-SUPABASE-423  cobertura de las 379 relaciones
TREQ-SUPABASE-424  capacidad, owner, consumidores y estado por relación
TREQ-SUPABASE-425  cobertura y trazabilidad de funciones
TREQ-SUPABASE-426  cobertura y herencia de triggers
TREQ-SUPABASE-428  cobertura de buckets
TREQ-SUPABASE-430  Edge Functions y cron
TREQ-SUPABASE-431  catálogo de capacidades y clases especiales
TREQ-SUPABASE-432  una capacidad principal por objeto
TREQ-SUPABASE-433  definición correcta de propietario actual
TREQ-SUPABASE-438  separación productor, propietario y consumidor
TREQ-SUPABASE-439  estado de fuente por objeto
TREQ-SUPABASE-443  separación de VITAL
TREQ-SUPABASE-444  backup y staging
TREQ-SUPABASE-447  vistas, aliases y proyecciones
TREQ-SUPABASE-448  herencia de objetos derivados
TREQ-SUPABASE-449  sensibilidad y exposición
TREQ-SUPABASE-450  identidades, conteos y orden determinista
TREQ-SUPABASE-451  prohibición de cambios físicos anticipados
TREQ-SUPABASE-454  validador integral
TREQ-SUPABASE-1695 gate integral del cierre arquitectónico
```

`04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` no requiere reemplazo para esta tarea.

#### 14. Validaciones ejecutadas

##### 14.1. Supabase remoto, solo lectura

Se verificó:

- proyecto `vento-os-dev`, referencia `clzdpinthhtknkmefsxx`, estado `ACTIVE_HEALTHY`;
- PostgreSQL `17.6.1`;
- 379 relaciones: 317 tablas y 62 vistas;
- partición exacta de las 379 relaciones en los 18 grupos indicados, sin `UNCLASSIFIED`;
- 348 firmas de funciones;
- 197 triggers empresariales no internos;
- 14 buckets;
- 24 Edge Functions activas;
- 7 cron jobs;
- migración `20260731082600_viso_monthly_schedule_186_hour_publish_guard` registrada;
- función y trigger mensuales de VISO materializados.

No se ejecutó DDL, DML, migración ni modificación de configuración.

##### 14.2. Artefacto SQL

| Control                                               | Resultado                                                          |
| ----------------------------------------------------- | ------------------------------------------------------------------ |
| archivo                                               | `SUPA-TRANS-001_TRANSITION_MAP.sql`                                |
| líneas                                                | **868**                                                            |
| bytes UTF-8                                           | **42.395**                                                         |
| SHA-256                                               | `b4e09b635facdc48c95728edbd5a867bf449e5d4da9ab3347cdff86df783a774` |
| sentencias mutantes                                   | **0**                                                              |
| disposición distinta de `RESERVED_FOR_SUPA_TRANS_002` | **0**                                                              |
| relaciones sin capacidad                              | **0**                                                              |
| resultado esperado                                    | **970 filas**                                                      |

##### 14.3. Repositorio

```text
VALIDACIÓN REAL DEL REPOSITORIO PENDIENTE DE EJECUCIÓN LOCAL
```

Después de incorporar ambos archivos en un checkout actualizado deberán ejecutarse:

```bash
npm run docs:plan:build
npm run docs:plan:check
npm run docs:plan:test
npm run docs:treq:check
npm run docs:treq:test
git diff --check
```

No se declara CI aprobada mientras esos comandos no se ejecuten sobre el repositorio actualizado.

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
SUPA-TRANS-001 — ARCHIVO APROBADO PARA REEMPLAZAR
        ↓ aprobación explícita del usuario
SUPA-TRANS-001 — APROBADA CANÓNICAMENTE
        ↓ solicitud expresa de continuar
SUPA-TRANS-002 — NO INICIADA
```

No se inicia `SUPA-TRANS-002` automáticamente.


### ✅ SUPA-TRANS-002 — Clasificar cada objeto como conservar, mover, fusionar, dividir, renombrar o retirar

**Estado:** APROBADA

#### 1. Objetivo

Resolver la disposición documental de cada identidad incluida en `TRANSITION-MAP-001@1.0.0`, sin alterar el estado remoto ni anticipar el orden físico de migración.

El resultado de esta tarea es:

```text
DISPOSITION-MAP-002@1.0.0
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
| `CONSERVAR` |     **416** |
| `MOVER`     |     **498** |
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

Se mueven **498 identidades** porque la responsabilidad continúa, pero la frontera actual no es la arquitectura objetivo:

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

Se conservan **416 identidades**, incluidas:

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

#### 10. Mapa completo ejecutable

El siguiente artefacto read-only materializa la clasificación de las 970 identidades y devuelve una fila por objeto:

```sql
-- DISPOSITION-MAP-002@1.0.0
-- Clasificacion read-only de los 970 objetos de TRANSITION-MAP-001.
-- Resuelve cada identidad como CONSERVAR, MOVER, FUSIONAR, DIVIDIR, RENOMBRAR o RETIRAR.
-- No ejecuta DDL, DML ni cambios de configuracion.

with recursive
relation_base as (
  select
    c.oid as relation_oid,
    n.nspname as schema_name,
    c.relname as object_name,
    n.nspname || '.' || c.relname as object_key,
    case c.relkind
      when 'r' then 'TABLE'
      when 'p' then 'PARTITIONED_TABLE'
      when 'v' then 'VIEW'
      when 'm' then 'MATERIALIZED_VIEW'
    end as object_type,
    coalesce(obj_description(c.oid, 'pg_class'), '') as object_comment,
    c.relrowsecurity as rls_enabled,
    c.relforcerowsecurity as rls_forced
  from pg_class c
  join pg_namespace n on n.oid = c.relnamespace
  where n.nspname in (
    'app_private', 'public', 'pass', 'payments', 'pos',
    'viso', 'talento', 'club', 'vital'
  )
    and c.relkind in ('r', 'p', 'v', 'm')
),
relation_capability as (
  select
    rb.*,
    case
      when schema_name = 'vital' then 'OUTSIDE_VENTO_OS'
      when object_key in (
        'public.product_categories_backup_20260316_preparaciones',
        'public.staging_insumos_import'
      ) then 'NO_CAPACITY_TEMPORARY'
      when schema_name = 'app_private' then 'CAP-11'
      when schema_name = 'talento' then 'CAP-02'
      when schema_name = 'viso' and object_name like 'demand_%' then 'CAP-17'
      when schema_name = 'viso' then 'CAP-02'
      when schema_name = 'club' and object_name = 'audit_events' then 'CAP-16'
      when schema_name = 'club' then 'CAP-10'
      when schema_name = 'payments' then 'CAP-09'
      when schema_name = 'pos'
        and object_name in ('pos_cash_movements', 'pos_cash_shifts', 'pos_payments') then 'CAP-12'
      when schema_name = 'pos' then 'CAP-09'
      when schema_name = 'pass'
        and (
          object_name like 'catalog_%'
          or object_name like 'commercial_%'
          or object_name = 'sell_products_by_site'
        ) then 'CAP-04'
      when schema_name = 'pass'
        and (object_name like 'loyalty_%' or object_name = 'user_favorites') then 'CAP-10'
      when schema_name = 'pass' then 'CAP-11'
      when schema_name = 'public'
        and object_name in (
          'area_kinds', 'areas', 'operational_sites',
          'site_area_purpose_rules', 'site_operational_capabilities',
          'site_purpose_settings', 'sites', 'v_ops_site_readiness',
          'v_site_area_operational_diagnostics'
        ) then 'CAP-01'
      when schema_name = 'public' and object_name = 'account_deletion_requests' then 'CAP-18'
      when schema_name = 'public'
        and object_name in ('asset_documents', 'document_types', 'documents', 'required_document_rules') then 'CAP-16'
      when schema_name = 'public'
        and (
          object_name = 'announcements'
          or object_name = 'app_content_blocks'
          or object_name like 'website_%'
        ) then 'CAP-14'
      when schema_name = 'public'
        and (
          object_name like 'asset_%'
          or object_name like 'product_asset_%'
          or object_name like 'v_asset_%'
        ) then 'CAP-07'
      when schema_name = 'public'
        and (
          object_name like 'procurement_%'
          or object_name like 'purchase_%'
          or object_name in ('product_suppliers', 'suppliers', 'v_procurement_price_book')
        ) then 'CAP-05'
      when schema_name = 'public'
        and (
          object_name like 'inventory_%'
          or object_name like 'restock_%'
          or object_name like 'product_request_polic%'
          or object_name in (
            'v_inventory_catalog', 'v_inventory_stock_by_location',
            'v_ops_restock_product_gaps'
          )
        ) then 'CAP-06'
      when schema_name = 'public'
        and (
          object_name like 'production_%'
          or object_name like 'recipe_%'
          or object_name = 'recipes'
          or object_name in (
            'product_site_production_routes', 'site_production_pick_order',
            'v_site_production_route_diagnostics'
          )
        ) then 'CAP-08'
      when schema_name = 'public'
        and (
          object_name like 'remission_%'
          or object_name in (
            'product_fulfillment_routes',
            'product_site_area_remission_categories',
            'site_supply_routes', 'pass_delivery_distance_rates', 'pass_satellites'
          )
        ) then 'CAP-11'
      when schema_name = 'public'
        and (
          object_name like 'order_%'
          or object_name like 'pulso_%'
          or (
            object_name like 'pos_%'
            and object_name not in ('pos_cash_movements', 'pos_cash_shifts', 'pos_payments')
          )
        ) then 'CAP-09'
      when schema_name = 'public'
        and (
          object_name like 'client_%'
          or object_name like 'gift_%'
          or object_name like 'loyalty_%'
          or object_name like 'wallet_%'
          or object_name in ('users', 'user_favorites')
        ) then 'CAP-10'
      when schema_name = 'public'
        and (
          object_name in ('cost_centers', 'product_cost_events')
          or object_name like 'internal_pos_%'
          or object_name like 'internal_price_%'
          or object_name like 'internal_transfer_%'
          or object_name like 'numera_%'
          or object_name in ('pos_cash_movements', 'pos_cash_shifts', 'pos_payments')
        ) then 'CAP-12'
      when schema_name = 'public'
        and (
          object_name = 'apps'
          or object_name like 'app_%'
          or object_name like 'shared_%'
          or object_name like 'support_%'
          or object_name in (
            'context_simulation_sessions', 'internal_job_secrets',
            'printing_label_templates', 'user_feedback'
          )
        ) then 'CAP-15'
      when schema_name = 'public'
        and (
          object_name like 'asistencia_%'
          or object_name like 'attendance_%'
          or object_name like 'employee_%'
          or object_name like 'operational_role_%'
          or object_name like 'permission_%'
          or object_name like 'role_%'
          or object_name = 'roles'
          or object_name like 'shift_%'
          or object_name like 'site_attendance_%'
          or object_name = 'site_operational_roles'
          or object_name like 'staff_%'
          or object_name like 'vento_%'
          or object_name like 'viso_%'
        ) then 'CAP-02'
      when schema_name = 'public'
        and (
          object_name like 'catalog_%'
          or object_name like 'commercial_%'
          or object_name = 'sell_products_by_site'
          or object_name like 'product_%'
          or object_name = 'products'
        ) then 'CAP-04'
      else 'UNCLASSIFIED'
    end as capability_key
  from relation_base rb
),
relation_owned as (
  select
    rc.*,
    case
      when capability_key = 'OUTSIDE_VENTO_OS' then 'VITAL'
      when capability_key = 'NO_CAPACITY_TEMPORARY' then 'CUSTODIO_TECNICO_ONLY: vento-shell'
      when capability_key = 'CAP-01' then 'VISO'
      when capability_key = 'CAP-02' and schema_name = 'talento' then 'TALENTO'
      when capability_key = 'CAP-02' and schema_name = 'viso' then 'VISO'
      when capability_key = 'CAP-02'
        and object_name in (
          'asistencia_logs', 'attendance_breaks', 'attendance_logs',
          'attendance_policy', 'attendance_shift_events', 'attendance_sync_conflicts',
          'employee_attendance_status', 'employee_devices', 'employee_push_tokens',
          'employee_settings', 'employee_shifts', 'employee_wallet_cards',
          'shift_calendar_view', 'shift_policy', 'shift_runtime_events',
          'site_attendance_policy', 'staff_invitations',
          'staff_manual_calendar_events', 'staff_schedule_hidden_employees'
        ) then 'ANIMA'
      when capability_key = 'CAP-02' then 'VISO'
      when capability_key = 'CAP-04'
        and (
          schema_name = 'pass'
          or object_type = 'VIEW'
          or object_name like 'catalog_%'
          or object_name like 'commercial_%'
          or object_name = 'sell_products_by_site'
        ) then 'PASS'
      when capability_key = 'CAP-04' then 'NEXO'
      when capability_key = 'CAP-05' then 'ORIGO'
      when capability_key = 'CAP-06' then 'NEXO'
      when capability_key = 'CAP-07' then 'NEXO'
      when capability_key = 'CAP-08' then 'FOGO'
      when capability_key = 'CAP-09'
        and (
          schema_name = 'pos'
          or object_name like 'pos_%'
          or object_name like 'pulso_%'
        ) then 'PULSO'
      when capability_key = 'CAP-09' then 'PASS/PULSO'
      when capability_key = 'CAP-10' and schema_name = 'club' then 'PASS/CLUB'
      when capability_key = 'CAP-10' and schema_name = 'pass' then 'PASS'
      when capability_key = 'CAP-10' then 'PASS/PULSO'
      when capability_key = 'CAP-11'
        and schema_name = 'public'
        and (
          object_name like 'remission_%'
          or object_name in (
            'product_fulfillment_routes',
            'product_site_area_remission_categories', 'site_supply_routes'
          )
        ) then 'NEXO'
      when capability_key = 'CAP-11' then 'PASS/PULSO'
      when capability_key = 'CAP-12'
        and (
          schema_name = 'pos'
          or object_name like 'pos_%'
          or object_name like 'internal_pos_%'
        ) then 'PULSO'
      when capability_key = 'CAP-12' then 'NUMERA'
      when capability_key = 'CAP-14' and object_name = 'announcements' then 'ANIMA'
      when capability_key = 'CAP-14' and object_name = 'app_content_blocks' then 'SHELL'
      when capability_key = 'CAP-14' then 'PASS/AURA'
      when capability_key = 'CAP-15' and object_name = 'printing_label_templates' then 'NEXO'
      when capability_key = 'CAP-15'
        and (
          object_name = 'app_permissions'
          or object_name = 'context_simulation_sessions'
          or object_name like 'shared_%'
        ) then 'VISO/SHELL'
      when capability_key = 'CAP-15' then 'SHELL'
      when capability_key = 'CAP-16' and schema_name = 'club' then 'PASS/CLUB'
      when capability_key = 'CAP-16' and object_name = 'asset_documents' then 'NEXO'
      when capability_key = 'CAP-16' then 'ANIMA/VISO'
      when capability_key = 'CAP-17' then 'VISO'
      when capability_key = 'CAP-18' then 'PASS/SHELL'
      else 'UNRESOLVED_OWNER'
    end as current_owner,
    case capability_key
      when 'CAP-01' then 'SHELL, ANIMA, NEXO, FOGO, ORIGO, PULSO, NUMERA, PASS'
      when 'CAP-02' then 'SHELL, VISO, ANIMA, NEXO, FOGO, ORIGO, PULSO, NUMERA'
      when 'CAP-04' then 'ORIGO, NEXO, FOGO, PULSO, PASS, NUMERA, AURA'
      when 'CAP-05' then 'NEXO, NUMERA, FOGO, VISO'
      when 'CAP-06' then 'ORIGO, FOGO, PULSO, NUMERA, VISO'
      when 'CAP-07' then 'VISO, NUMERA'
      when 'CAP-08' then 'NEXO, PULSO, NUMERA, VISO'
      when 'CAP-09' then 'PASS, PULSO, FOGO, NEXO, NUMERA, AURA'
      when 'CAP-10' then 'PASS, PULSO, AURA, NUMERA, VISO'
      when 'CAP-11' then 'NEXO, PULSO, PASS, NUMERA, FOGO, ORIGO'
      when 'CAP-12' then 'NUMERA, PULSO, ORIGO, NEXO, VISO'
      when 'CAP-14' then 'ANIMA, SHELL, PASS, PULSO, AURA, NUMERA'
      when 'CAP-15' then 'SHELL, VISO, ANIMA, NEXO, FOGO, ORIGO, PULSO, PASS'
      when 'CAP-16' then 'ANIMA, VISO, NEXO, PASS y consumidores autorizados del hecho'
      when 'CAP-17' then 'VISO, PULSO, NUMERA, FOGO'
      when 'CAP-18' then 'PASS, SHELL, VISO'
      when 'NO_CAPACITY_TEMPORARY' then 'NONE_AUTHORIZED'
      when 'OUTSIDE_VENTO_OS' then 'vento-vital y servicios VITAL'
      else 'UNRESOLVED_CONSUMERS'
    end as current_consumers,
    case capability_key
      when 'CAP-01' then 'CONFIRMED_CURRENT_WITH_BOUNDARY'
      when 'CAP-02' then 'SHARED_CURRENT'
      when 'CAP-04' then 'FRAGMENTED_CURRENT'
      when 'CAP-05' then 'CONFIRMED_CURRENT'
      when 'CAP-06' then 'CONFIRMED_CURRENT'
      when 'CAP-07' then 'CONFIRMED_CURRENT_WITH_BOUNDARY'
      when 'CAP-08' then 'CONFIRMED_CURRENT'
      when 'CAP-09' then 'FRAGMENTED_CURRENT'
      when 'CAP-10' then 'SHARED_CURRENT'
      when 'CAP-11' then 'REQUIRES_RESULT_SPLIT'
      when 'CAP-12' then 'SHARED_CURRENT'
      when 'CAP-14' then 'FRAGMENTED_CURRENT'
      when 'CAP-15' then 'SHARED_CURRENT'
      when 'CAP-16' then 'REQUIRES_RESULT_SPLIT'
      when 'CAP-17' then 'CONFIRMED_CURRENT_WITH_BOUNDARY'
      when 'CAP-18' then 'SHARED_CURRENT'
      when 'NO_CAPACITY_TEMPORARY' then 'TEMPORARY_OR_LEGACY'
      when 'OUTSIDE_VENTO_OS' then 'OUTSIDE_VENTO_OS'
      else 'UNRESOLVED_STATE'
    end as current_ownership_state
  from relation_capability rc
),
relation_targeted as (
  select
    ro.*,
    case capability_key
      when 'CAP-01' then 'OPERATING_STRUCTURE_AND_GOVERNANCE'
      when 'CAP-02' then 'WORKFORCE_AND_WORK'
      when 'CAP-04' then 'PRODUCT_CATALOG_AND_KNOWLEDGE'
      when 'CAP-05' then 'PROCUREMENT'
      when 'CAP-06' then 'INVENTORY_AND_STORAGE'
      when 'CAP-07' then 'ASSETS_AND_REUSABLES'
      when 'CAP-08' then 'PRODUCTION'
      when 'CAP-09' then 'ORDERS_SALES_AND_COLLECTION'
      when 'CAP-10' then 'CUSTOMERS_AND_RELATIONSHIPS'
      when 'CAP-11' then 'TRANSPORT_DISPATCH_AND_DELIVERY'
      when 'CAP-12' then 'FINANCE_COSTS_AND_OBLIGATIONS'
      when 'CAP-14' then 'COMMUNICATION_AND_PROMOTION'
      when 'CAP-15' then 'TECHNOLOGY_AND_SUPPORT'
      when 'CAP-16' then 'INFORMATION_DOCUMENTS_AND_EVIDENCE'
      when 'CAP-17' then 'MEASUREMENT_ANALYTICS_AND_IMPROVEMENT'
      when 'CAP-18' then 'CONTINUITY_AND_INCIDENTS'
      when 'NO_CAPACITY_TEMPORARY' then 'TEMPORARY_OR_LEGACY'
      when 'OUTSIDE_VENTO_OS' then 'VITAL_PRODUCT_BOUNDARY'
      else 'UNRESOLVED_TARGET_DOMAIN'
    end as target_domain_or_special_class,
    case
      when capability_key = 'OUTSIDE_VENTO_OS' then 'VITAL'
      when capability_key = 'NO_CAPACITY_TEMPORARY' then 'TEMPORARY'
      when object_type = 'VIEW'
        and (
          object_comment ilike '%compat view%'
          or (schema_name = 'public' and object_name like 'pos_%')
          or object_name in (
            'catalog_item_customization_template_assignments',
            'catalog_item_customization_template_groups',
            'catalog_item_customization_templates',
            'catalog_item_option_consumption_rules', 'catalog_item_option_groups',
            'catalog_item_option_recipe_effects', 'catalog_item_options',
            'catalog_item_presentation', 'catalog_items', 'catalog_option_visual_assets',
            'commercial_categories', 'commercial_collection_categories',
            'commercial_collections', 'loyalty_redemptions', 'loyalty_rewards',
            'loyalty_transactions', 'user_favorites', 'pass_delivery_distance_rates',
            'pass_satellites', 'sell_products_by_site'
          )
        ) then 'ADAPTER'
      when object_type = 'VIEW' then 'PROJECTION'
      when object_name like '%history%' then 'HISTORY'
      when object_name ~ '(events|logs|ledger|movements|transactions|postings|conflicts|snapshots|reviews)$' then 'LEDGER'
      when object_name ~ '(summary|status|forecast|forecasts|stock_by|readiness)' then 'PROJECTION'
      when object_name ~ '(types|kinds|categories|catalog|catalogs|policies|policy|rules|settings|profiles|templates|units|roles|permissions|capabilities|limits|requirements|sequences|rates|prices|routes|mappings)$' then 'REFERENCE'
      else 'AGGREGATE'
    end as target_component_role
  from relation_owned ro
),
relation_map as (
  select
    relation_oid,
    object_key as current_object_key,
    'RELATION'::text as current_object_class,
    case
      when capability_key = 'OUTSIDE_VENTO_OS' then 'OUTSIDE_VENTO_OS'
      when capability_key = 'NO_CAPACITY_TEMPORARY' then 'TEMPORARY_OR_LEGACY'
      when target_component_role = 'ADAPTER' then 'CURRENT_COMPATIBILITY_PROJECTION'
      when object_type in ('VIEW', 'MATERIALIZED_VIEW') then 'CURRENT_PROJECTION'
      else 'CURRENT_PERSISTED_RELATION'
    end as current_source_status,
    case
      when capability_key = 'OUTSIDE_VENTO_OS' then 'VITAL'
      when capability_key = 'NO_CAPACITY_TEMPORARY' then 'VENTO_OS_TECHNICAL_RESIDUE'
      else 'VENTO_OS'
    end as current_product_boundary,
    capability_key as current_capability_key,
    current_owner,
    current_consumers,
    current_ownership_state,
    target_domain_or_special_class,
    target_component_role,
    case target_component_role
      when 'ADAPTER' then 'DERIVED_READ_MODEL'
      when 'PROJECTION' then 'DERIVED_READ_MODEL'
      when 'LEDGER' then 'APPEND_ONLY_OR_CONTROLLED_HISTORY'
      when 'HISTORY' then 'APPEND_ONLY_OR_CONTROLLED_HISTORY'
      when 'REFERENCE' then 'AUTHORITATIVE_REFERENCE'
      when 'VITAL' then 'VITAL_AUTHORITY'
      when 'TEMPORARY' then 'NO_BUSINESS_AUTHORITY'
      else 'AUTHORITATIVE_WRITE_MODEL'
    end as target_authority_mode,
    case target_component_role
      when 'ADAPTER' then 'COMPATIBILITY'
      when 'PROJECTION' then 'PROJECTION'
      when 'LEDGER' then 'AUDIT'
      when 'HISTORY' then 'AUDIT'
      when 'REFERENCE' then 'REFERENCE'
      when 'VITAL' then 'PLATFORM_INTERNAL'
      when 'TEMPORARY' then 'COMPATIBILITY'
      else 'COMMAND'
    end as target_contract_mode,
    case
      when schema_name = 'app_private' then 'SERVER_ONLY_PRIVATE_SCHEMA'
      when capability_key = 'OUTSIDE_VENTO_OS' then 'VITAL_SEPARATE_PRODUCT_BOUNDARY'
      when object_type in ('VIEW', 'MATERIALIZED_VIEW') then 'DATA_API_READ_MODEL_REVIEW'
      when rls_enabled then 'RLS_GOVERNED_DATA_API'
      else 'NON_RLS_PRIVATE_OR_BLOCKED_REVIEW'
    end as target_security_boundary,
    case
      when target_component_role = 'ADAPTER' then 'SUPA-TRANS-003;SUPA-TRANS-006;SUPA-TRANS-007;SUPA-TRANS-014'
      when target_component_role = 'PROJECTION' then 'SUPA-TRANS-003;SUPA-TRANS-006;SUPA-TRANS-007;SUPA-TRANS-009'
      when capability_key = 'NO_CAPACITY_TEMPORARY' then 'SUPA-TRANS-002;SUPA-TRANS-005;SUPA-TRANS-012'
      when capability_key = 'OUTSIDE_VENTO_OS' then 'SUPA-TRANS-003;SUPA-TRANS-007;SUPA-TRANS-013;SUPA-TRANS-014'
      else 'SUPA-TRANS-003;SUPA-TRANS-005;SUPA-TRANS-007;SUPA-TRANS-008;SUPA-TRANS-009'
    end as target_compatibility_dependencies,
    'TRANS::RELATION::' || object_key as target_transition_key,
    'MAPPED_CURRENT_TO_LOGICAL_TARGET'::text as mapping_status,
    'RESERVED_FOR_SUPA_TRANS_002'::text as disposition_status,
    'SUPA-AUD-022;SUPA-ARC-025;REMOTE_CATALOG_2026-07-31'::text as evidence_refs
  from relation_targeted
),
trigger_parent as (
  select
    p.oid as function_oid,
    count(distinct rm.current_capability_key)::int as capability_count,
    min(rm.current_capability_key) as single_capability,
    count(distinct rm.current_owner)::int as owner_count,
    min(rm.current_owner) as single_owner,
    string_agg(distinct rm.current_consumers, ' | ' order by rm.current_consumers) as consumers,
    string_agg(distinct rm.target_domain_or_special_class, ' | ' order by rm.target_domain_or_special_class) as target_domains,
    string_agg(distinct rm.current_object_key, ', ' order by rm.current_object_key) as parent_relations
  from pg_proc p
  join pg_trigger t on t.tgfoid = p.oid and not t.tgisinternal
  join relation_map rm on rm.relation_oid = t.tgrelid
  group by p.oid
),
function_base as (
  select
    p.oid as function_oid,
    n.nspname as schema_name,
    p.proname as function_name,
    n.nspname || '.' || p.proname || '(' || pg_get_function_identity_arguments(p.oid) || ')' as object_key,
    p.prosecdef as security_definer,
    p.provolatile,
    pg_get_function_result(p.oid) as result_type,
    l.lanname as language_name,
    tp.capability_count,
    tp.single_capability,
    tp.owner_count,
    tp.single_owner,
    tp.consumers as trigger_consumers,
    tp.target_domains as trigger_target_domains,
    tp.parent_relations
  from pg_proc p
  join pg_namespace n on n.oid = p.pronamespace
  join pg_language l on l.oid = p.prolang
  left join trigger_parent tp on tp.function_oid = p.oid
  where n.nspname in (
    'app_private', 'public', 'pass', 'payments', 'pos',
    'viso', 'talento', 'club', 'vital'
  )
    and p.prokind = 'f'
),
function_classified as (
  select
    fb.*,
    case
      when capability_count = 1 then single_capability
      when capability_count > 1 then 'MULTI_CAPABILITY_REVIEW'
      when schema_name = 'vital' then 'OUTSIDE_VENTO_OS'
      when schema_name = 'talento' then 'CAP-02'
      when schema_name = 'viso' and function_name like 'demand_%' then 'CAP-17'
      when schema_name = 'viso' then 'CAP-02'
      when schema_name = 'club' and function_name like '%audit%' then 'CAP-16'
      when schema_name = 'club' then 'CAP-10'
      when schema_name = 'payments' then 'CAP-09'
      when schema_name = 'pos' and function_name ~ '(cash|payment)' then 'CAP-12'
      when schema_name = 'pos' then 'CAP-09'
      when schema_name = 'pass' and function_name ~ '(catalog|commercial|product|collection|option)' then 'CAP-04'
      when schema_name = 'pass' and function_name ~ '(loyalty|wallet|reward|redemption|favorite)' then 'CAP-10'
      when schema_name = 'pass' and function_name ~ '(delivery|address|satellite|schedule|business_hour)' then 'CAP-11'
      when schema_name = 'app_private' then 'CAP-11'
      when function_name ~ '(attendance|shift|staff|employee|role|permission|checkin|checkout)' then 'CAP-02'
      when function_name ~ '(procurement|purchase|supplier)' then 'CAP-05'
      when function_name ~ '(inventory|restock|stock|lpn|location|transfer)' then 'CAP-06'
      when function_name ~ '(asset)' then 'CAP-07'
      when function_name ~ '(production|recipe|fogo)' then 'CAP-08'
      when function_name ~ '(order|payment|checkout|pos_|pulso|sales)' then 'CAP-09'
      when function_name ~ '(loyalty|wallet|client|user_|gift|reward|redemption)' then 'CAP-10'
      when function_name ~ '(delivery|remission|shipment|dispatch|route)' then 'CAP-11'
      when function_name ~ '(numera|cost|expense|price|cash)' then 'CAP-12'
      when function_name ~ '(announcement|website|content)' then 'CAP-14'
      when function_name ~ '(document)' then 'CAP-16'
      else 'CAP-15'
    end as capability_key
  from function_base fb
),
function_map as (
  select
    object_key as current_object_key,
    'FUNCTION'::text as current_object_class,
    case when capability_count is not null then 'CURRENT_TRIGGER_FUNCTION' else 'CURRENT_DATABASE_FUNCTION' end as current_source_status,
    case when schema_name = 'vital' then 'VITAL' else 'VENTO_OS' end as current_product_boundary,
    capability_key as current_capability_key,
    case
      when owner_count = 1 then single_owner
      when owner_count > 1 then 'MULTI_PARENT_OWNER_REVIEW'
      when capability_key = 'OUTSIDE_VENTO_OS' then 'VITAL'
      when capability_key = 'CAP-01' then 'VISO'
      when capability_key = 'CAP-02' and schema_name = 'talento' then 'TALENTO'
      when capability_key = 'CAP-02' and schema_name = 'viso' then 'VISO'
      when capability_key = 'CAP-02' then 'ANIMA/VISO'
      when capability_key = 'CAP-04' then case when schema_name = 'pass' then 'PASS' else 'NEXO' end
      when capability_key = 'CAP-05' then 'ORIGO'
      when capability_key = 'CAP-06' then 'NEXO'
      when capability_key = 'CAP-07' then 'NEXO'
      when capability_key = 'CAP-08' then 'FOGO'
      when capability_key = 'CAP-09' then 'PASS/PULSO'
      when capability_key = 'CAP-10' then case when schema_name = 'club' then 'PASS/CLUB' else 'PASS/PULSO' end
      when capability_key = 'CAP-11' then 'NEXO/PASS/PULSO'
      when capability_key = 'CAP-12' then 'NUMERA/PULSO'
      when capability_key = 'CAP-14' then 'ANIMA/AURA/SHELL'
      when capability_key = 'CAP-15' then 'CUSTODIO_TECNICO_ONLY: vento-shell'
      when capability_key = 'CAP-16' then 'ANIMA/VISO/NEXO'
      when capability_key = 'CAP-17' then 'VISO'
      when capability_key = 'CAP-18' then 'PASS/SHELL'
      else 'UNRESOLVED_OWNER'
    end as current_owner,
    coalesce(trigger_consumers,
      case capability_key
        when 'CAP-02' then 'SHELL, VISO, ANIMA, NEXO, FOGO, ORIGO, PULSO, NUMERA'
        when 'CAP-04' then 'ORIGO, NEXO, FOGO, PULSO, PASS, NUMERA, AURA'
        when 'CAP-05' then 'NEXO, NUMERA, FOGO, VISO'
        when 'CAP-06' then 'ORIGO, FOGO, PULSO, NUMERA, VISO'
        when 'CAP-07' then 'VISO, NUMERA'
        when 'CAP-08' then 'NEXO, PULSO, NUMERA, VISO'
        when 'CAP-09' then 'PASS, PULSO, FOGO, NEXO, NUMERA, AURA'
        when 'CAP-10' then 'PASS, PULSO, AURA, NUMERA, VISO'
        when 'CAP-11' then 'NEXO, PULSO, PASS, NUMERA, FOGO, ORIGO'
        when 'CAP-12' then 'NUMERA, PULSO, ORIGO, NEXO, VISO'
        when 'CAP-14' then 'ANIMA, SHELL, PASS, PULSO, AURA, NUMERA'
        when 'CAP-15' then 'SHELL, VISO, ANIMA, NEXO, FOGO, ORIGO, PULSO, PASS'
        when 'CAP-16' then 'ANIMA, VISO, NEXO, PASS y consumidores autorizados del hecho'
        when 'CAP-17' then 'VISO, PULSO, NUMERA, FOGO'
        when 'CAP-18' then 'PASS, SHELL, VISO'
        when 'OUTSIDE_VENTO_OS' then 'vento-vital y servicios VITAL'
        else 'DEPENDENCY_DISCOVERY_REQUIRED'
      end
    ) as current_consumers,
    case
      when capability_count = 1 then 'INHERITED_FROM_TRIGGER_PARENT'
      when capability_count > 1 then 'MULTI_PARENT_REVIEW'
      else 'DEPENDENCY_REFINEMENT_REQUIRED'
    end as current_ownership_state,
    coalesce(
      case when capability_count = 1 then trigger_target_domains end,
      case capability_key
        when 'CAP-01' then 'OPERATING_STRUCTURE_AND_GOVERNANCE'
        when 'CAP-02' then 'WORKFORCE_AND_WORK'
        when 'CAP-04' then 'PRODUCT_CATALOG_AND_KNOWLEDGE'
        when 'CAP-05' then 'PROCUREMENT'
        when 'CAP-06' then 'INVENTORY_AND_STORAGE'
        when 'CAP-07' then 'ASSETS_AND_REUSABLES'
        when 'CAP-08' then 'PRODUCTION'
        when 'CAP-09' then 'ORDERS_SALES_AND_COLLECTION'
        when 'CAP-10' then 'CUSTOMERS_AND_RELATIONSHIPS'
        when 'CAP-11' then 'TRANSPORT_DISPATCH_AND_DELIVERY'
        when 'CAP-12' then 'FINANCE_COSTS_AND_OBLIGATIONS'
        when 'CAP-14' then 'COMMUNICATION_AND_PROMOTION'
        when 'CAP-15' then 'TECHNOLOGY_AND_SUPPORT'
        when 'CAP-16' then 'INFORMATION_DOCUMENTS_AND_EVIDENCE'
        when 'CAP-17' then 'MEASUREMENT_ANALYTICS_AND_IMPROVEMENT'
        when 'CAP-18' then 'CONTINUITY_AND_INCIDENTS'
        when 'OUTSIDE_VENTO_OS' then 'VITAL_PRODUCT_BOUNDARY'
        else 'MULTI_DOMAIN_REVIEW'
      end
    ) as target_domain_or_special_class,
    case when capability_count is not null then 'AUTOMATION' else 'ENDPOINT' end as target_component_role,
    case when capability_count is not null then 'DERIVED_AUTOMATION' else 'COMMAND_OR_QUERY_ENDPOINT' end as target_authority_mode,
    case
      when capability_count is not null then 'DOMAIN_EVENT'
      when function_name ~ '^(get|list|find|search|can|is|has|resolve|calculate|compute|preview|validate|check|current|fetch)' then 'QUERY'
      else 'COMMAND'
    end as target_contract_mode,
    case
      when security_definer then 'SECURITY_DEFINER_REVIEW'
      when schema_name = 'app_private' then 'SERVER_ONLY_PRIVATE_SCHEMA'
      when schema_name = 'vital' then 'VITAL_SEPARATE_PRODUCT_BOUNDARY'
      else 'FUNCTION_EXECUTION_PRIVILEGE_REVIEW'
    end as target_security_boundary,
    'SUPA-TRANS-003;SUPA-TRANS-007;SUPA-TRANS-008;SUPA-TRANS-009;SUPA-TRANS-010' as target_compatibility_dependencies,
    'TRANS::FUNCTION::' || object_key as target_transition_key,
    case
      when capability_count is not null then 'MAPPED_BY_TRIGGER_PARENT'
      else 'MAPPED_BY_SCHEMA_AND_EFFECT;DEPENDENCY_REFINEMENT_SUPA_TRANS_003'
    end as mapping_status,
    'RESERVED_FOR_SUPA_TRANS_002' as disposition_status,
    'SUPA-AUD-022;SUPA-ARC-013;SUPA-ARC-016;REMOTE_CATALOG_2026-07-31' as evidence_refs
  from function_classified
),
trigger_map as (
  select
    rm.current_object_key || '::trigger::' || t.tgname as current_object_key,
    'TRIGGER'::text as current_object_class,
    'CURRENT_DATABASE_AUTOMATION'::text as current_source_status,
    rm.current_product_boundary,
    rm.current_capability_key,
    rm.current_owner,
    rm.current_consumers,
    'INHERITED_FROM_RELATION_PARENT'::text as current_ownership_state,
    rm.target_domain_or_special_class,
    'AUTOMATION'::text as target_component_role,
    'DERIVED_AUTOMATION'::text as target_authority_mode,
    'DOMAIN_EVENT'::text as target_contract_mode,
    case when p.prosecdef then 'SECURITY_DEFINER_TRIGGER_REVIEW' else 'TRIGGER_PRIVILEGE_REVIEW' end as target_security_boundary,
    'SUPA-TRANS-003;SUPA-TRANS-008;SUPA-TRANS-009;SUPA-TRANS-010'::text as target_compatibility_dependencies,
    'TRANS::TRIGGER::' || rm.current_object_key || '::' || t.tgname as target_transition_key,
    'MAPPED_BY_RELATION_PARENT'::text as mapping_status,
    'RESERVED_FOR_SUPA_TRANS_002'::text as disposition_status,
    'SUPA-AUD-022;SUPA-ARC-013;REMOTE_CATALOG_2026-07-31'::text as evidence_refs
  from pg_trigger t
  join relation_map rm on rm.relation_oid = t.tgrelid
  join pg_proc p on p.oid = t.tgfoid
  where not t.tgisinternal
),
bucket_map as (
  select
    'storage.bucket.' || b.id as current_object_key,
    'STORAGE_BUCKET'::text as current_object_class,
    case when b.public then 'CURRENT_PUBLIC_BUCKET' else 'CURRENT_PRIVATE_BUCKET' end as current_source_status,
    'VENTO_OS'::text as current_product_boundary,
    case b.id
      when 'commercial-menu-images' then 'CAP-04'
      when 'documents' then 'CAP-16'
      when 'employee-photos' then 'CAP-02'
      when 'nexo-ai-documents' then 'CAP-15'
      when 'nexo-catalog-images' then 'CAP-04'
      when 'pass-satellite-logos' then 'CAP-10'
      when 'product-images' then 'CAP-04'
      when 'public-documents' then 'CAP-14'
      when 'recipe-media' then 'CAP-08'
      when 'recipe-step-photos' then 'CAP-08'
      when 'talento-cv' then 'CAP-02'
      when 'talento-documents' then 'CAP-02'
      when 'talento-medical' then 'CAP-02'
      when 'website-media' then 'CAP-14'
      else 'UNCLASSIFIED_BUCKET'
    end as current_capability_key,
    case b.id
      when 'commercial-menu-images' then 'PASS/AURA'
      when 'documents' then 'ANIMA/VISO'
      when 'employee-photos' then 'ANIMA/VISO'
      when 'nexo-ai-documents' then 'NEXO'
      when 'nexo-catalog-images' then 'NEXO'
      when 'pass-satellite-logos' then 'PASS'
      when 'product-images' then 'NEXO'
      when 'public-documents' then 'AURA/PASS'
      when 'recipe-media' then 'FOGO'
      when 'recipe-step-photos' then 'FOGO'
      when 'talento-cv' then 'TALENTO'
      when 'talento-documents' then 'TALENTO'
      when 'talento-medical' then 'TALENTO'
      when 'website-media' then 'AURA/PASS'
      else 'UNRESOLVED_OWNER'
    end as current_owner,
    case b.id
      when 'commercial-menu-images' then 'PASS, PULSO, AURA'
      when 'documents' then 'ANIMA, VISO y destinatarios autorizados'
      when 'employee-photos' then 'ANIMA, VISO y superficies laborales autorizadas'
      when 'nexo-ai-documents' then 'NEXO server-side'
      when 'nexo-catalog-images' then 'NEXO, PASS, PULSO, ORIGO, FOGO'
      when 'pass-satellite-logos' then 'PASS, website y PULSO'
      when 'product-images' then 'NEXO, PASS, PULSO, ORIGO, FOGO'
      when 'public-documents' then 'website, PASS y publico autorizado'
      when 'recipe-media' then 'FOGO y NEXO autorizado'
      when 'recipe-step-photos' then 'FOGO y ejecucion productiva'
      when 'talento-cv' then 'TALENTO y VISO autorizado'
      when 'talento-documents' then 'TALENTO y VISO autorizado'
      when 'talento-medical' then 'TALENTO y responsables medicos autorizados'
      when 'website-media' then 'website y AURA'
      else 'UNRESOLVED_CONSUMERS'
    end as current_consumers,
    'CONFIRMED_CURRENT_WITH_BOUNDARY'::text as current_ownership_state,
    case b.id
      when 'commercial-menu-images' then 'PRODUCT_CATALOG_AND_KNOWLEDGE'
      when 'documents' then 'INFORMATION_DOCUMENTS_AND_EVIDENCE'
      when 'employee-photos' then 'WORKFORCE_AND_WORK'
      when 'nexo-ai-documents' then 'TECHNOLOGY_AND_SUPPORT'
      when 'nexo-catalog-images' then 'PRODUCT_CATALOG_AND_KNOWLEDGE'
      when 'pass-satellite-logos' then 'CUSTOMERS_AND_RELATIONSHIPS'
      when 'product-images' then 'PRODUCT_CATALOG_AND_KNOWLEDGE'
      when 'public-documents' then 'COMMUNICATION_AND_PROMOTION'
      when 'recipe-media' then 'PRODUCTION'
      when 'recipe-step-photos' then 'PRODUCTION'
      when 'talento-cv' then 'WORKFORCE_AND_WORK'
      when 'talento-documents' then 'WORKFORCE_AND_WORK'
      when 'talento-medical' then 'WORKFORCE_AND_WORK'
      when 'website-media' then 'COMMUNICATION_AND_PROMOTION'
      else 'UNRESOLVED_TARGET_DOMAIN'
    end as target_domain_or_special_class,
    'FILE'::text as target_component_role,
    'AUTHORITATIVE_FILE_ASSET'::text as target_authority_mode,
    'FILE_ASSET'::text as target_contract_mode,
    case when b.public then 'PUBLIC_BUCKET_POLICY_REVIEW' else 'PRIVATE_BUCKET_RLS_REVIEW' end as target_security_boundary,
    'SUPA-TRANS-003;SUPA-TRANS-005;SUPA-TRANS-007;SUPA-TRANS-009;SUPA-TRANS-010'::text as target_compatibility_dependencies,
    'TRANS::STORAGE_BUCKET::' || b.id as target_transition_key,
    'MAPPED_CURRENT_TO_LOGICAL_TARGET'::text as mapping_status,
    'RESERVED_FOR_SUPA_TRANS_002'::text as disposition_status,
    'SUPA-AUD-022;SUPA-ARC-018;storage.buckets;REMOTE_CATALOG_2026-07-31'::text as evidence_refs
  from storage.buckets b
),
edge_source(slug, capability_key, owner_name, consumers, verify_jwt) as (
  values
    ('wallet-pass', 'CAP-10', 'PASS', 'usuario PASS', true),
    ('attendance-report', 'CAP-02', 'ANIMA', 'usuario laboral autorizado', true),
    ('staff-invitations-create', 'CAP-02', 'VISO/ANIMA', 'administrador laboral', true),
    ('request-account-deletion', 'CAP-18', 'PASS', 'cliente autenticado', true),
    ('account-deletion', 'CAP-18', 'PASS', 'cliente autenticado y worker', true),
    ('payments-create-intent', 'CAP-09', 'PASS/PULSO', 'cliente o caja autorizada', true),
    ('shift-publish-notify', 'CAP-02', 'ANIMA', 'ANIMA y notificaciones', true),
    ('pass-delivery-quote', 'CAP-11', 'PASS/PULSO', 'cliente PASS', true),
    ('pass-address-search', 'CAP-11', 'PASS', 'cliente PASS', true),
    ('support-message-notify', 'CAP-15', 'SHELL/ANIMA', 'soporte y notificaciones', true),
    ('pass-register-push-token', 'CAP-10', 'PASS', 'cliente PASS', true),
    ('order-message-notify', 'CAP-09', 'PASS/PULSO', 'participantes del pedido', true),
    ('staff-invitations-accept', 'CAP-02', 'VISO/ANIMA', 'trabajador invitado', false),
    ('document-alerts', 'CAP-16', 'ANIMA', 'cron y trabajadores', false),
    ('process-account-deletions', 'CAP-18', 'PASS', 'workflow GitHub Actions', false),
    ('register-push-token', 'CAP-02', 'ANIMA', 'trabajador autenticado', false),
    ('announcement-notify', 'CAP-14', 'ANIMA/AURA', 'trabajadores y canales autorizados', false),
    ('employee-delete', 'CAP-02', 'VISO', 'administracion laboral', false),
    ('payments-webhook', 'CAP-09', 'PASS/PULSO', 'Wompi y dominio de pagos', false),
    ('staff-invitations-resend', 'CAP-02', 'VISO/ANIMA', 'administrador laboral', false),
    ('staff-invitations-cancel', 'CAP-02', 'VISO/ANIMA', 'administrador laboral', false),
    ('shift-runtime-processor', 'CAP-02', 'ANIMA', 'cron y runtime de turnos', false),
    ('payments-return', 'CAP-09', 'PASS', 'navegador y aplicacion PASS', false),
    ('delivery-portal', 'CAP-11', 'PULSO/PASS', 'repartidor externo por token de capacidad', false)
),
edge_map as (
  select
    'edge.' || slug as current_object_key,
    'EDGE_FUNCTION'::text as current_object_class,
    'ACTIVE_EDGE_FUNCTION'::text as current_source_status,
    'VENTO_OS'::text as current_product_boundary,
    capability_key as current_capability_key,
    owner_name as current_owner,
    consumers as current_consumers,
    'CONFIRMED_CURRENT_WITH_BOUNDARY'::text as current_ownership_state,
    case capability_key
      when 'CAP-02' then 'WORKFORCE_AND_WORK'
      when 'CAP-09' then 'ORDERS_SALES_AND_COLLECTION'
      when 'CAP-10' then 'CUSTOMERS_AND_RELATIONSHIPS'
      when 'CAP-11' then 'TRANSPORT_DISPATCH_AND_DELIVERY'
      when 'CAP-14' then 'COMMUNICATION_AND_PROMOTION'
      when 'CAP-15' then 'TECHNOLOGY_AND_SUPPORT'
      when 'CAP-16' then 'INFORMATION_DOCUMENTS_AND_EVIDENCE'
      when 'CAP-18' then 'CONTINUITY_AND_INCIDENTS'
      else 'UNRESOLVED_TARGET_DOMAIN'
    end as target_domain_or_special_class,
    'ENDPOINT'::text as target_component_role,
    'COMMAND_OR_QUERY_ENDPOINT'::text as target_authority_mode,
    'COMMAND'::text as target_contract_mode,
    case when verify_jwt then 'JWT_VERIFIED_EDGE_ENDPOINT' else 'CUSTOM_AUTH_OR_PUBLIC_ENDPOINT_REVIEW' end as target_security_boundary,
    'SUPA-TRANS-003;SUPA-TRANS-007;SUPA-TRANS-008;SUPA-TRANS-009;SUPA-TRANS-010'::text as target_compatibility_dependencies,
    'TRANS::EDGE_FUNCTION::' || slug as target_transition_key,
    'MAPPED_DEPLOYED_EDGE_FUNCTION'::text as mapping_status,
    'RESERVED_FOR_SUPA_TRANS_002'::text as disposition_status,
    'SUPA-AUD-022;SUPA-ARC-020;REMOTE_EDGE_FUNCTION_LIST_2026-07-31'::text as evidence_refs
  from edge_source
),
cron_map as (
  select
    'cron.' || j.jobname as current_object_key,
    'CRON_JOB'::text as current_object_class,
    case when j.active then 'ACTIVE_CRON_JOB' else 'DISABLED_CRON_JOB' end as current_source_status,
    'VENTO_OS'::text as current_product_boundary,
    case
      when j.jobname = 'document-alerts-daily' then 'CAP-16'
      when j.jobname in (
        'auto-close-attendance', 'anima_shift_runtime_processor_every_5m',
        'anima_attendance_day_end_close_0005',
        'attendance_stale_open_shift_autoclose_daily_bogota'
      ) then 'CAP-02'
      when j.jobname = 'pass_delivery_quotes_cleanup_hourly' then 'CAP-11'
      when j.jobname = 'pass_payment_checkout_expiry_reconciliation' then 'CAP-09'
      else 'UNCLASSIFIED_CRON'
    end as current_capability_key,
    case
      when j.jobname = 'document-alerts-daily' then 'ANIMA'
      when j.jobname in (
        'auto-close-attendance', 'anima_shift_runtime_processor_every_5m',
        'anima_attendance_day_end_close_0005',
        'attendance_stale_open_shift_autoclose_daily_bogota'
      ) then 'ANIMA'
      when j.jobname = 'pass_delivery_quotes_cleanup_hourly' then 'PASS'
      when j.jobname = 'pass_payment_checkout_expiry_reconciliation' then 'PASS/PULSO'
      else 'UNRESOLVED_OWNER'
    end as current_owner,
    'scheduler, endpoint objetivo y dominio propietario'::text as current_consumers,
    'CONFIRMED_CURRENT_WITH_BOUNDARY'::text as current_ownership_state,
    case
      when j.jobname = 'document-alerts-daily' then 'INFORMATION_DOCUMENTS_AND_EVIDENCE'
      when j.jobname in (
        'auto-close-attendance', 'anima_shift_runtime_processor_every_5m',
        'anima_attendance_day_end_close_0005',
        'attendance_stale_open_shift_autoclose_daily_bogota'
      ) then 'WORKFORCE_AND_WORK'
      when j.jobname = 'pass_delivery_quotes_cleanup_hourly' then 'TRANSPORT_DISPATCH_AND_DELIVERY'
      when j.jobname = 'pass_payment_checkout_expiry_reconciliation' then 'ORDERS_SALES_AND_COLLECTION'
      else 'UNRESOLVED_TARGET_DOMAIN'
    end as target_domain_or_special_class,
    'AUTOMATION'::text as target_component_role,
    'DERIVED_AUTOMATION'::text as target_authority_mode,
    'JOB'::text as target_contract_mode,
    'SCHEDULER_SECRET_AND_DELIVERY_REVIEW'::text as target_security_boundary,
    'SUPA-TRANS-003;SUPA-TRANS-008;SUPA-TRANS-009;SUPA-TRANS-010;SUPA-TRANS-011'::text as target_compatibility_dependencies,
    'TRANS::CRON_JOB::' || j.jobname as target_transition_key,
    'MAPPED_CURRENT_TO_LOGICAL_TARGET'::text as mapping_status,
    'RESERVED_FOR_SUPA_TRANS_002'::text as disposition_status,
    'SUPA-AUD-022;SUPA-ARC-020;cron.job;REMOTE_CATALOG_2026-07-31'::text as evidence_refs
  from cron.job j
),
migration_map as (
  select
    'migration.' || m.version || '_' || m.name as current_object_key,
    'MIGRATION_EVIDENCE'::text as current_object_class,
    'DEPLOYED_REMOTE_MIGRATION_EVIDENCE'::text as current_source_status,
    'VENTO_OS'::text as current_product_boundary,
    'CAP-02'::text as current_capability_key,
    'VISO/ANIMA'::text as current_owner,
    'VISO, ANIMA y consumidores de employee_shifts'::text as current_consumers,
    'PROVISIONAL_OPERATIONAL_RULE'::text as current_ownership_state,
    'WORKFORCE_AND_WORK'::text as target_domain_or_special_class,
    'SUPPORT'::text as target_component_role,
    'MIGRATION_EVIDENCE_ONLY'::text as target_authority_mode,
    'COMPATIBILITY'::text as target_contract_mode,
    'SECURITY_DEFINER_AND_TRIGGER_REVIEW'::text as target_security_boundary,
    'SUPA-TRANS-003;SUPA-TRANS-008;SUPA-TRANS-009;SUPA-TRANS-010;SUPA-TRANS-011;SUPA-TRANS-013'::text as target_compatibility_dependencies,
    'TRANS::MIGRATION_EVIDENCE::' || m.version || '::' || m.name as target_transition_key,
    'MAPPED_AS_DEPLOYED_EVIDENCE_NOT_STABLE_ARCHITECTURE'::text as mapping_status,
    'RESERVED_FOR_SUPA_TRANS_002'::text as disposition_status,
    '06_PLAN_DE_TRANSICION.md;supabase_migrations.schema_migrations;REMOTE_CATALOG_2026-07-31'::text as evidence_refs
  from supabase_migrations.schema_migrations m
  where m.version = '20260731082600'
    and m.name = 'viso_monthly_schedule_186_hour_publish_guard'
),
transition_map as (
  select
    current_object_key, current_object_class, current_source_status,
    current_product_boundary, current_capability_key, current_owner,
    current_consumers, current_ownership_state,
    target_domain_or_special_class, target_component_role,
    target_authority_mode, target_contract_mode, target_security_boundary,
    target_compatibility_dependencies, target_transition_key,
    mapping_status, disposition_status, evidence_refs
  from relation_map
  union all
  select * from function_map
  union all
  select * from trigger_map
  union all
  select * from bucket_map
  union all
  select * from edge_map
  union all
  select * from cron_map
  union all
  select * from migration_map
)
disposition_classified as (
  select
    tm.*,
    case
      when tm.current_product_boundary = 'VITAL' then 'CONSERVAR'
      when tm.current_object_key in (
        'public.product_categories_backup_20260316_preparaciones',
        'public.staging_insumos_import',
        'public.role_capabilities'
      ) then 'RETIRAR'
      when tm.current_object_class = 'RELATION'
        and tm.current_source_status = 'CURRENT_COMPATIBILITY_PROJECTION' then 'RETIRAR'
      when tm.current_object_key in (
        'public.notify_shift_published()',
        'public.update_loyalty_balance()'
      ) then 'RETIRAR'
      when tm.current_object_key in (
        'public.asistencia_logs',
        'public.attendance_logs'
      ) then 'FUSIONAR'
      when tm.current_object_class = 'TRIGGER'
        and (
          tm.current_object_key like 'public.asistencia_logs::trigger::%'
          or tm.current_object_key like 'public.attendance_logs::trigger::%'
        ) then 'FUSIONAR'
      when tm.current_object_key in (
        'public.site_operational_roles',
        'viso.site_operational_roles'
      ) then 'FUSIONAR'
      when tm.current_object_class = 'TRIGGER'
        and (
          tm.current_object_key like 'public.site_operational_roles::trigger::%'
          or tm.current_object_key like 'viso.site_operational_roles::trigger::%'
        ) then 'FUSIONAR'
      when tm.current_object_key in (
        'cron.auto-close-attendance',
        'cron.anima_attendance_day_end_close_0005'
      ) then 'FUSIONAR'
      when tm.current_object_key in (
        'public.documents',
        'public.document_types',
        'public.required_document_rules',
        'storage.bucket.documents',
        'storage.bucket.employee-photos',
        'storage.bucket.public-documents'
      ) then 'DIVIDIR'
      when tm.current_object_key = 'public.internal_job_secrets' then 'MOVER'
      when tm.current_object_key = 'public.viso_enforce_monthly_schedule_publish_limit()' then 'MOVER'
      when tm.current_object_key like 'public.employee_shifts::trigger::trg_viso_monthly_schedule_publish_limit' then 'MOVER'
      when tm.current_object_class = 'RELATION'
        and tm.current_object_key like 'public.%'
        and tm.target_component_role not in ('ADAPTER', 'PROJECTION') then 'MOVER'
      when tm.current_object_class = 'TRIGGER'
        and tm.current_object_key like 'public.%' then 'MOVER'
      when tm.current_object_class = 'FUNCTION'
        and tm.current_object_key like 'public.%'
        and (
          tm.current_source_status = 'CURRENT_TRIGGER_FUNCTION'
          or tm.target_security_boundary = 'SECURITY_DEFINER_REVIEW'
        ) then 'MOVER'
      else 'CONSERVAR'
    end as resolved_disposition_status,
    case
      when tm.current_product_boundary = 'VITAL' then 'DISP::VITAL_BOUNDARY'
      when tm.current_object_key = 'public.product_categories_backup_20260316_preparaciones' then 'DISP::RETIRE::PRODUCT_CATEGORY_BACKUP'
      when tm.current_object_key = 'public.staging_insumos_import' then 'DISP::RETIRE::INSUMOS_STAGING'
      when tm.current_object_key = 'public.role_capabilities' then 'DISP::RETIRE::LEGACY_ROLE_CAPABILITIES'
      when tm.current_object_class = 'RELATION' and tm.current_source_status = 'CURRENT_COMPATIBILITY_PROJECTION' then 'DISP::RETIRE::COMPATIBILITY_PROJECTION'
      when tm.current_object_key in ('public.notify_shift_published()', 'public.update_loyalty_balance()') then 'DISP::RETIRE::ORPHAN_TRIGGER_FUNCTION'
      when tm.current_object_key in ('public.asistencia_logs', 'public.attendance_logs')
        or (tm.current_object_class = 'TRIGGER' and (tm.current_object_key like 'public.asistencia_logs::trigger::%' or tm.current_object_key like 'public.attendance_logs::trigger::%'))
        then 'DISP::MERGE::ATTENDANCE_LOGS'
      when tm.current_object_key in ('public.site_operational_roles', 'viso.site_operational_roles')
        or (tm.current_object_class = 'TRIGGER' and (tm.current_object_key like 'public.site_operational_roles::trigger::%' or tm.current_object_key like 'viso.site_operational_roles::trigger::%'))
        then 'DISP::MERGE::SITE_OPERATIONAL_ROLES'
      when tm.current_object_key in ('cron.auto-close-attendance', 'cron.anima_attendance_day_end_close_0005') then 'DISP::MERGE::ATTENDANCE_DAY_END_CLOSE_JOB'
      when tm.current_object_key in ('public.documents', 'public.document_types', 'public.required_document_rules', 'storage.bucket.documents', 'storage.bucket.employee-photos', 'storage.bucket.public-documents') then 'DISP::SPLIT::DOCUMENT_OWNERSHIP_AND_SENSITIVITY'
      when tm.current_object_key = 'public.internal_job_secrets' then 'DISP::MOVE::PRIVATE_JOB_SECRETS'
      when tm.current_object_key = 'public.viso_enforce_monthly_schedule_publish_limit()'
        or tm.current_object_key like 'public.employee_shifts::trigger::trg_viso_monthly_schedule_publish_limit'
        then 'DISP::MOVE::VISO_MONTHLY_LIMIT_GUARD'
      when tm.current_object_class = 'RELATION' and tm.current_object_key like 'public.%' and tm.target_component_role not in ('ADAPTER', 'PROJECTION') then 'DISP::MOVE::PUBLIC_WRITE_MODEL_TO_TARGET_DOMAIN'
      when tm.current_object_class = 'TRIGGER' and tm.current_object_key like 'public.%' then 'DISP::MOVE::PUBLIC_TRIGGER_WITH_PARENT_DOMAIN'
      when tm.current_object_class = 'FUNCTION' and tm.current_object_key like 'public.%' and (tm.current_source_status = 'CURRENT_TRIGGER_FUNCTION' or tm.target_security_boundary = 'SECURITY_DEFINER_REVIEW') then 'DISP::MOVE::PUBLIC_PRIVILEGED_OR_TRIGGER_FUNCTION'
      else 'DISP::KEEP::CURRENT_IDENTITY'
    end as disposition_group_key,
    case
      when tm.current_product_boundary = 'VITAL' then 'Mantener el objeto dentro de la frontera separada de VITAL; estar fuera de Vento OS no lo convierte en legacy.'
      when tm.current_object_key in ('public.product_categories_backup_20260316_preparaciones', 'public.staging_insumos_import') then 'Residuo tecnico sin capacidad empresarial vigente; retirar solo despues de reconciliacion, retencion y rollback.'
      when tm.current_object_key = 'public.role_capabilities' then 'Objeto declarado legacy; la autoridad vigente se distribuye entre app_permissions, role_permissions y operational_role_permissions.'
      when tm.current_object_class = 'RELATION' and tm.current_source_status = 'CURRENT_COMPATIBILITY_PROJECTION' then 'Proyeccion de compatibilidad con fuente canonica distinta; retirar despues de adaptar y certificar cero consumidores.'
      when tm.current_object_key in ('public.notify_shift_published()', 'public.update_loyalty_balance()') then 'Funcion de trigger sin trigger asociado ni consumidor vigente certificado en la auditoria canónica.'
      when tm.current_object_key like 'public.asistencia_logs%' or tm.current_object_key like 'public.attendance_logs%' then 'Dos superficies registran el mismo resultado de asistencia; converger en una unica autoridad e integrar automatismos.'
      when tm.current_object_key like 'public.site_operational_roles%' or tm.current_object_key like 'viso.site_operational_roles%' then 'Fuentes competidoras para roles operativos por sede; converger sin mantener doble escritura.'
      when tm.current_object_key in ('cron.auto-close-attendance', 'cron.anima_attendance_day_end_close_0005') then 'Jobs solapados sobre el cierre diario de asistencia; consolidar una programacion canonica e idempotente.'
      when tm.current_object_key in ('public.documents', 'public.document_types', 'public.required_document_rules', 'storage.bucket.documents', 'storage.bucket.employee-photos', 'storage.bucket.public-documents') then 'La identidad mezcla propietarios, finalidades o sensibilidades; separar contratos y ciclos de vida antes de migrar datos.'
      when tm.current_object_key = 'public.internal_job_secrets' then 'Secretos internos no deben permanecer en una superficie empresarial compartida; trasladar a limite privado server-only.'
      when tm.current_object_key = 'public.viso_enforce_monthly_schedule_publish_limit()' or tm.current_object_key like 'public.employee_shifts::trigger::trg_viso_monthly_schedule_publish_limit' then 'Guardia SECURITY DEFINER provisional en public; conservar el efecto pero moverlo a una frontera interna gobernada.'
      when tm.current_object_class = 'RELATION' and tm.current_object_key like 'public.%' and tm.target_component_role not in ('ADAPTER', 'PROJECTION') then 'Modelo escribible de dominio alojado en public; preservar identidad empresarial y moverlo al limite objetivo ya mapeado.'
      when tm.current_object_class = 'TRIGGER' and tm.current_object_key like 'public.%' then 'Automatismo ligado a un modelo de dominio que se mueve; trasladarlo con el padre y revalidar orden, privilegios e idempotencia.'
      when tm.current_object_class = 'FUNCTION' and tm.current_object_key like 'public.%' and (tm.current_source_status = 'CURRENT_TRIGGER_FUNCTION' or tm.target_security_boundary = 'SECURITY_DEFINER_REVIEW') then 'Funcion privilegiada o de trigger alojada en public; mover a la frontera del dominio o capa interna correspondiente.'
      else 'La identidad actual ya coincide con una frontera valida o actua como proyeccion/endpoint gobernado; conservar sujeto a dependencias y pruebas posteriores.'
    end as disposition_reason,
    case
      when tm.current_object_key in (
        'public.product_categories_backup_20260316_preparaciones', 'public.staging_insumos_import', 'public.role_capabilities',
        'public.notify_shift_published()', 'public.update_loyalty_balance()',
        'public.asistencia_logs', 'public.attendance_logs', 'public.site_operational_roles', 'viso.site_operational_roles',
        'cron.auto-close-attendance', 'cron.anima_attendance_day_end_close_0005',
        'public.internal_job_secrets', 'public.viso_enforce_monthly_schedule_publish_limit()'
      ) then 'HIGH'
      when tm.current_source_status = 'CURRENT_COMPATIBILITY_PROJECTION' then 'HIGH'
      when tm.current_product_boundary = 'VITAL' then 'HIGH'
      when tm.current_object_key in ('public.documents', 'public.document_types', 'public.required_document_rules', 'storage.bucket.documents', 'storage.bucket.employee-photos', 'storage.bucket.public-documents') then 'HIGH'
      when tm.current_object_class in ('RELATION', 'FUNCTION', 'TRIGGER') and tm.current_object_key like 'public.%' then 'MEDIUM'
      else 'HIGH'
    end as decision_confidence,
    case
      when tm.current_product_boundary = 'VITAL' then 'SUPA-TRANS-003;SUPA-TRANS-013;SUPA-TRANS-014'
      when tm.current_object_key in ('public.product_categories_backup_20260316_preparaciones', 'public.staging_insumos_import', 'public.role_capabilities')
        or tm.current_source_status = 'CURRENT_COMPATIBILITY_PROJECTION'
        or tm.current_object_key in ('public.notify_shift_published()', 'public.update_loyalty_balance()')
        then 'SUPA-TRANS-003;SUPA-TRANS-005;SUPA-TRANS-006;SUPA-TRANS-007;SUPA-TRANS-009;SUPA-TRANS-011;SUPA-TRANS-012'
      when tm.current_object_key like 'public.asistencia_logs%' or tm.current_object_key like 'public.attendance_logs%'
        or tm.current_object_key like 'public.site_operational_roles%' or tm.current_object_key like 'viso.site_operational_roles%'
        or tm.current_object_key in ('cron.auto-close-attendance', 'cron.anima_attendance_day_end_close_0005')
        then 'SUPA-TRANS-003;SUPA-TRANS-004;SUPA-TRANS-005;SUPA-TRANS-007;SUPA-TRANS-008;SUPA-TRANS-009;SUPA-TRANS-011'
      when tm.current_object_key in ('public.documents', 'public.document_types', 'public.required_document_rules', 'storage.bucket.documents', 'storage.bucket.employee-photos', 'storage.bucket.public-documents')
        then 'SUPA-TRANS-003;SUPA-TRANS-004;SUPA-TRANS-005;SUPA-TRANS-006;SUPA-TRANS-007;SUPA-TRANS-008;SUPA-TRANS-009;SUPA-TRANS-011;SUPA-TRANS-014'
      when tm.current_object_key = 'public.internal_job_secrets'
        or tm.current_object_key = 'public.viso_enforce_monthly_schedule_publish_limit()'
        or tm.current_object_key like 'public.employee_shifts::trigger::trg_viso_monthly_schedule_publish_limit'
        then 'SUPA-TRANS-003;SUPA-TRANS-004;SUPA-TRANS-006;SUPA-TRANS-008;SUPA-TRANS-009;SUPA-TRANS-010;SUPA-TRANS-011'
      when tm.current_object_class in ('RELATION', 'FUNCTION', 'TRIGGER') and tm.current_object_key like 'public.%'
        then 'SUPA-TRANS-003;SUPA-TRANS-004;SUPA-TRANS-005;SUPA-TRANS-006;SUPA-TRANS-007;SUPA-TRANS-008;SUPA-TRANS-009;SUPA-TRANS-011;SUPA-TRANS-014'
      else tm.target_compatibility_dependencies
    end as execution_gate,
    case
      when tm.current_object_class = 'RELATION' and tm.current_source_status = 'CURRENT_COMPATIBILITY_PROJECTION' and tm.current_object_key like 'public.pos_%'
        then 'TRANS::RELATION::pos.' || replace(tm.current_object_key, 'public.', '')
      when tm.current_object_class = 'RELATION' and tm.current_source_status = 'CURRENT_COMPATIBILITY_PROJECTION'
        then 'TRANS::RELATION::pass.' || replace(tm.current_object_key, 'public.', '')
      when tm.current_object_key in ('public.asistencia_logs', 'public.attendance_logs') then 'TRANS::RELATION::public.attendance_logs'
      when tm.current_object_key in ('public.site_operational_roles', 'viso.site_operational_roles') then 'TRANS::RELATION::public.site_operational_roles'
      when tm.current_object_key in ('cron.auto-close-attendance', 'cron.anima_attendance_day_end_close_0005') then 'TRANS::CRON_JOB::anima_attendance_day_end_close_0005'
      when tm.current_object_key = 'public.role_capabilities' then 'MULTIPLE::TRANS::RELATION::public.app_permissions|TRANS::RELATION::public.role_permissions|TRANS::RELATION::public.operational_role_permissions'
      else null
    end as successor_transition_key,
    tm.evidence_refs || ';SUPA-TRANS-002;DISPOSITION-MAP-002@1.0.0' as disposition_evidence_refs
  from transition_map tm
),
disposition_map as (
  select
    current_object_key,
    current_object_class,
    current_source_status,
    current_product_boundary,
    current_capability_key,
    current_owner,
    current_consumers,
    current_ownership_state,
    target_domain_or_special_class,
    target_component_role,
    target_authority_mode,
    target_contract_mode,
    target_security_boundary,
    target_transition_key,
    resolved_disposition_status as disposition_status,
    disposition_group_key,
    disposition_reason,
    decision_confidence,
    execution_gate,
    successor_transition_key,
    mapping_status,
    disposition_evidence_refs as evidence_refs
  from disposition_classified
)
select *
from disposition_map
order by current_object_class, current_object_key;
```

#### 11. Requisitos de prueba

**Resultado:** NO GENERA REQUISITOS DE PRUEBA NUEVOS.

La tarea resuelve el campo de disposición reservado por `SUPA-TRANS-001` sin introducir una categoría, objeto técnico o invariante nueva fuera del marco ya protegido. Permanecen aplicables, entre otros, los requisitos canónicos que exigen:

- cobertura exacta e identidades únicas del mapa;
- una clasificación explícita por objeto;
- tratamiento de temporales, legacy y objetos sin consumidor;
- herencia de controles para objetos derivados;
- orden determinista y huellas reproducibles;
- prohibición de ejecutar movimientos o retiros sin transición aprobada;
- comprobación integral de relaciones, funciones, triggers, Storage, Edge Functions y cron.

El registro canónico de requisitos no requiere modificación por esta tarea.

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
10. no se ejecuta DDL, DML, despliegue, backfill, renombre físico, retiro ni cambio de configuración.


### [ ] SUPA-TRANS-003 — Identificar dependencias de aplicaciones, RPC, RLS, triggers y datos
### [ ] SUPA-TRANS-004 — Definir orden de migración por dominio
### [ ] SUPA-TRANS-005 — Definir backfills y correcciones de calidad de datos
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
