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


