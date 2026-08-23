### R2 — Migración progresiva por dominio

<!-- EXECUTION-GATE-RECONCILIATION:B201-400:R2 -->
#### Reconciliación topológica de R2

R2 implementa migración progresiva por dominio y conserva identidad de paquete.

| Propiedad     | Valor                            |
| ------------- | -------------------------------- |
| tareas        | las trece tareas de este archivo |
| modalidad     | `TEMPLATE_PER_PACKAGE`           |
| gate temporal | `POST_E5_PACKAGE`                |
| identidad     | `<task_id>::<package_id>`        |

Cada package_id ejecuta únicamente el subconjunto R2 incluido en su alcance aprobado. Las instancias R2 requieren R0/R1 aplicables disponibles, `E5-GATE-008::<package_id>` aprobado y gobierno de `SHELL-CI-020::<package_id>`.

`AUTH-DB-026` mantiene su responsabilidad incremental sobre generación y publicación de tipos después del paquete DB aplicable; no se convierte en un habilitador global único.

### ✅ AUTH-DB-020 — Migrar objetos por dominio con compatibilidad temporal

**Estado:** APROBADA
**Tarea anterior:** AUTH-DB-014 — Implementar auditoría de dispositivos
**Tarea siguiente:** AUTH-DB-006 — Incorporar contexto canónico en RPC sensibles
**Tipo de tarea:** Documental; contrato y plantilla R2 repetible por `package_id` para migración progresiva de objetos por dominio con coexistencia y compatibilidad temporal gobernadas
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/03_R2_MIGRACION_PROGRESIVA_POR_DOMINIO.md`
**Estado físico resultante:** Contrato canónico `TEMPLATE_PER_PACKAGE` cerrado; cada futura instancia `AUTH-DB-020::<package_id>` permanece no ejecutada hasta satisfacer R0/R1 aplicables, `E5-GATE-008::<package_id>`, `SHELL-CI-020::<package_id>` y autorización física explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Objetivo

`AUTH-DB-020` define el contrato físico repetible que deberá usar cada paquete aprobado para mover, conservar, fusionar, dividir o preparar el retiro de objetos Supabase desde su ubicación AS-IS hacia la arquitectura canónica por dominios, sin romper consumidores y sin convertir la compatibilidad temporal en una segunda fuente de verdad.

La tarea transforma los contratos aprobados de E3 en una plantilla R2 ejecutable por `package_id`, pero no ejecuta ninguna instancia física.

---

#### 2. Resultado canónico

Queda definido:

```text
AUTH-DB-020
→ contrato documental único y reutilizable

AUTH-DB-020::<package_id>
→ futura instancia física por paquete

resultado esperado de cada instancia
→ subconjunto exacto de transition_keys materializado
→ destino canónico preparado
→ fuente de autoridad controlada
→ compatibilidad temporal gobernada
→ consumidores tratados
→ datos reconciliados
→ seguridad y rendimiento comprobados
→ rollback disponible
→ retiro legacy todavía separado hasta su gate
```

La definición del marcador se realiza una sola vez. La ejecución se repite exclusivamente por paquete.

---

#### 3. Topología vinculante

La topología aplicable es:

```text
mode = TEMPLATE_PER_PACKAGE
execution_gate = POST_E5_PACKAGE
instance_pattern = AUTH-DB-020::<package_id>
```

Consecuencias:

1. no existe `AUTH-DB-020::GLOBAL`;
2. una aprobación documental no crea una instancia física;
3. cada paquete conserva identidad, alcance, candidate y evidencia propios;
4. dos paquetes no pueden compartir una ejecución anónima o sin lineage;
5. el marcador canónico no se reabre para ejecutar otro paquete.

---

#### 4. Gate temporal

Una instancia solo puede ejecutar cambios físicos cuando exista, para el mismo `package_id`:

```text
R0 aplicable = VERIFIED
R1 aplicable = VERIFIED
DELIV-PKG aplicable = CLOSED
E5-GATE-008::<package_id> = PASS
SHELL-CI-020::<package_id> = OPENED
physical_authorization = EXPLICIT
```

La falta de cualquiera de estas condiciones mantiene la instancia en `NOT_EXECUTED_GATE_CLOSED`.

---

#### 5. Identidad del paquete

Cada instancia conserva como mínimo:

```text
package_id
auth_db_020_instance_id
candidate_id
commit_sha
environment_scope
transition_keys
migration_unit_ids
owner_schemas
source_contract_versions
target_contract_versions
compatibility_plan_refs
consumer_cohort_refs
write_plan_refs
test_plan_refs
measurement_plan_refs
rollback_plan_refs
retirement_plan_refs
evidence_bundle_id
```

`auth_db_020_instance_id` se deriva únicamente como `AUTH-DB-020::<package_id>`.

---

#### 6. Fuentes vinculantes

La ejecución futura deberá consumir sin reinterpretación silenciosa:

- `TRANSITION-MAP-001@1.0.0`;
- `DISPOSITION-MAP-002@1.0.2`;
- `DEPENDENCY-MAP-003@1.0.0`;
- `MIGRATION-ORDER-004@1.0.0`;
- `BACKFILL-AND-DATA-QUALITY-PLAN-005@1.1.0`;
- `TEMPORARY-COMPATIBILITY-PLAN-006@1.1.0`;
- `CONSUMER-ADAPTATION-REGISTER-007@1.1.0`;
- `WRITE-COEXISTENCE-PLAN-008@1.0.0`;
- `MIGRATION-TEST-PLAN-009@1.0.0`;
- `TRANSITION-PERFORMANCE-SECURITY-MEASUREMENT-010@1.0.0`;
- `TRANSITION-ROLLBACK-PLAN-011@1.0.0`;
- `PROGRESSIVE-LEGACY-RETIREMENT-012@1.0.0`;
- `ENVIRONMENT-PARITY-VERIFICATION-013@1.0.0`;
- `TYPE-CONTRACT-DOCUMENTATION-UPDATE-014@1.0.0`;
- `VENTO-SUPABASE-EXECUTABLE-MIGRATION-ROADMAP-015@1.0.0`;
- `SUPA-TRANS-016`;
- R0 y R1 aplicables;
- el expediente E5 del `package_id`.

---

#### 7. Universo de transición

El universo de referencia aprobado conserva exactamente **970 identidades**:

| Clase                            | Identidades |
| -------------------------------- | ----------: |
| Relaciones PostgreSQL gobernadas |         379 |
| Funciones PostgreSQL             |         348 |
| Triggers empresariales           |         197 |
| Buckets Storage                  |          14 |
| Edge Functions                   |          24 |
| Cron jobs                        |           7 |
| Evidencia migratoria VISO        |           1 |
| **Total**                        |     **970** |

Una instancia de 020 no necesita incluir las 970 identidades. Debe incluir un subconjunto explícito, cerrado y trazable al paquete.

---

#### 8. Disposiciones canónicas

La distribución de E3 se conserva:

| Disposición | Identidades |
| ----------- | ----------: |
| `CONSERVAR` |         420 |
| `MOVER`     |         494 |
| `FUSIONAR`  |          11 |
| `DIVIDIR`   |           6 |
| `RENOMBRAR` |           0 |
| `RETIRAR`   |          39 |
| **Total**   |     **970** |

`AUTH-DB-020` no reclasifica una identidad. Si la evidencia futura contradice una disposición, se detiene la unidad y se devuelve la contradicción a su contrato propietario.

---

#### 9. Claves estables

Toda identidad conserva su `transition_key` original.

Queda prohibido:

- reconstruir claves por parecido de nombres;
- crear una clave nueva para evitar una dependencia;
- reutilizar una clave retirada para otra semántica;
- fusionar identidades sin el `disposition_group_key` aprobado;
- tratar un nombre físico nuevo como sustituto de la identidad de transición.

---

#### 10. Línea base remota vigente

La lectura remota read-only de `vento-os-dev` confirma en el corte de desarrollo de esta tarea:

```text
PostgreSQL = 17.6.1.054
migration_history_count = 550
max_migration_version = 20260731082600

governed_relations = 379
governed_functions = 348
governed_triggers = 197

active_edge_functions = 24
storage_buckets = 14
cron_jobs = 7
supabase_realtime_relations = 6
```

Los conteos estructurales principales coinciden con el universo aprobado de E3.

---

#### 11. Estado de schemas objetivo

La arquitectura objetivo conserva 29 schemas gobernados por Vento:

```text
26 owner schemas
+ api
+ app_private
+ audit
= 29
```

En el corte remoto de esta tarea existen físicamente:

```text
app_private
payments
```

y faltan 27 namespaces objetivo.

Esto es evidencia de estado actual, no autorización para que 020 cree schemas que pertenecen a R1.

---

#### 12. Regla de drift

Antes de cada futura instancia se recaptura baseline.

Resultado permitido:

```text
MATCHES_APPROVED_BASELINE
APPROVED_DRIFT
BLOCKING_DRIFT
```

`BLOCKING_DRIFT` impide iniciar la mutación hasta reconciliar:

- objetos nuevos;
- objetos ausentes;
- firma alterada;
- schema diferente;
- RLS o grants divergentes;
- consumidores nuevos;
- writer nuevo;
- Edge Function nueva;
- bucket nuevo;
- publicación o cron nuevos;
- historia migratoria distinta.

---

#### 13. Selección de alcance por paquete

Cada paquete produce una lista cerrada:

```text
included_transition_keys
excluded_transition_keys_with_reason
inherited_transition_keys
blocked_transition_keys
outside_scope_transition_keys
```

Toda identidad tocada físicamente debe estar en `included_transition_keys`.

Una identidad no incluida no puede modificarse por efecto lateral aceptado.

---

#### 14. Matriz de inclusión

Por cada `transition_key` incluida se materializa:

| Campo                    | Regla                                |
| ------------------------ | ------------------------------------ |
| `transition_key`         | identidad exacta de E3               |
| `current_object`         | objeto AS-IS exacto                  |
| `object_class`           | clase aprobada                       |
| `disposition`            | disposición aprobada                 |
| `migration_unit_id`      | unidad de `MIGRATION-ORDER-004`      |
| `owner_schema`           | owner objetivo aprobado              |
| `source_authority`       | fuente autoritativa antes del cambio |
| `target_authority`       | autoridad objetivo                   |
| `compatibility_plan_ref` | plan 006 aplicable                   |
| `consumer_ref`           | registro 007 aplicable               |
| `write_ref`              | plan 008 aplicable                   |
| `test_ref`               | plan 009 aplicable                   |
| `rollback_ref`           | plan 011 aplicable                   |
| `retirement_ref`         | plan 012 aplicable                   |
| `package_state`          | estado dentro del paquete            |

---

#### 15. Integridad del alcance

El paquete falla cerrado si existe:

```text
transition_key incluida dos veces
transition_key mutada sin inclusión
identidad sin disposition
identidad sin owner
identidad sin migration_unit
dependencia bloqueante sin tratamiento
consumidor desconocido no aislado
writer desconocido
target schema no disponible
rollback no resoluble
```

No se admite completar la matriz después de aplicar el cambio.

---

#### 16. Precondiciones R0

La instancia reutiliza R0 aplicable para:

- historial de migraciones versionado;
- harness de esquema y contratos;
- baseline y drift;
- backup, restore y rollback;
- contención de riesgos RLS, funciones privilegiadas y grants.

020 no vuelve a implementar R0.

---

#### 17. Precondiciones R1

La unidad debe comprobar que existen y están verificadas las fundaciones R1 que consume.

Ejemplos:

- owner schema objetivo;
- `api` cuando haya contrato expuesto;
- `app_private` cuando haya helper privado;
- `audit` cuando el cambio exige evidencia transversal;
- identidad y contexto canónicos cuando el objeto depende de ellos.

La ausencia se reporta como `R1_PREREQUISITE_NOT_VERIFIED`.

---

#### 18. No creación oportunista de fundaciones

020 no puede crear silenciosamente un schema, resolver, auditoría, catálogo o primitive de R1 para “desbloquear” una migración.

La salida correcta es:

```text
BLOCK PACKAGE UNIT
→ identify prerequisite
→ resolve in owning R1 instance
→ verify
→ resume same package candidate or create new candidate
```

---

#### 19. Gate E5

`E5-GATE-008::<package_id>` debe corresponder al mismo paquete que ejecutará 020.

No se reutiliza un gate de otro paquete, una aprobación genérica ni una ruta histórica suspendida.

---

#### 20. Gate SHELL-CI-020

`SHELL-CI-020::<package_id>` abre el ciclo físico post-E5.

020 no puede:

- abrir ese ciclo por sí misma;
- asumir que está abierto;
- ejecutarse solo porque el contrato documental está aprobado.

---

#### 21. Candidate inmutable

Cada instancia usa un `candidate_id` inmutable que vincula:

```text
commit_sha
migration_file_set
migration_sha256_set
config_digest
edge_bundle_digests
storage_manifest_digest
realtime_manifest_digest
cron_manifest_digest
contract_bundle_digest
```

Cambiar cualquiera de estos componentes crea un candidate distinto.

---

#### 22. Unidad de migración

La unidad mínima de avance es `migration_unit`.

No se certifica un schema completo por haber migrado una tabla.

Cada unidad conserva:

```text
migration_unit_id
transition_keys
owner_schema
wave_id
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

---

#### 23. Precedencia por oleadas

020 respeta el orden W0 a W6 aprobado.

Una unidad posterior puede prepararse, pero no tomar autoridad si una dependencia precedente sigue abierta.

La ubicación en la misma oleada tampoco implica paralelismo automático.

---

#### 24. Readiness del target schema

Antes de materializar destino:

1. el schema objetivo debe existir;
2. su identidad debe coincidir exactamente con E3;
3. no puede ser un schema managed de Supabase;
4. su owner técnico no se interpreta como owner empresarial;
5. sus grants base deben ser compatibles con la política R1;
6. no debe existir un homónimo conflictivo.

---

#### 25. Autoridad fuente

Cada unidad declara una sola `source_authority` antes del cambio.

Una vista, cache, wrapper, tabla shadow o proyección no se convierte en fuente porque resulte más completa.

---

#### 26. Autoridad objetivo

`target_authority` identifica el owner canónico posterior al cutover.

La creación del objeto destino no lo convierte en autoridad.

El cambio de autoridad requiere gate explícito.

---

#### 27. Invariante de writer único

En cada instante existe una sola autoridad de escritura empresarial.

Queda prohibido:

```text
app → write legacy
app → write target
```

como fan-out simultáneo autoritativo.

---

#### 28. Fase SOURCE_ONLY

Estado inicial:

```text
legacy/source = authoritative
target = non-authoritative or absent
```

Se captura baseline y no se permite que el target acepte comandos empresariales independientes.

---

#### 29. Fase BASELINE_OR_REPLAY

El target puede recibir:

- copia exacta;
- transformación versionada;
- replay;
- rebuild de proyección;
- crosswalk;
- merge o split aprobado.

Sigue sin autoridad empresarial.

---

#### 30. Fase DELTA_CATCH_UP

Cuando la fuente continúa activa, el delta usa el contrato 008:

- watermark;
- rango append-only;
- replay;
- checkpoint;
- idempotencia;
- orden causal;
- reconciliación.

No se usa `last write wins` implícito.

---

#### 31. Fase FENCE

Antes del cutover:

- bloquea writers no inventariados;
- bloquea DML legacy no permitido;
- bloquea nuevos consumidores legacy;
- verifica rutas dinámicas;
- comprueba retries e inflight;
- fija el watermark de corte.

Un writer inesperado reabre el gate.

---

#### 32. Fase CUTOVER_ELIGIBLE

Solo existe cuando están en PASS:

```text
data reconciliation
consumer readiness
compatibility readiness
security gate
performance gate
rollback drill
writer fence
post-migration test readiness
```

No equivale todavía a `TARGET_ONLY`.

---

#### 33. Fase TARGET_ONLY

El target se vuelve única autoridad mediante una transición explícita y auditable.

Desde ese momento, el origen:

- no acepta nuevas mutaciones;
- puede conservar lectura temporal si el contrato 006 lo permite;
- no reabre autoridad por fallback.

---

#### 34. Fase OBSERVATION_AND_RETIREMENT

Después del cutover:

- se observan errores y divergencias;
- se conserva compatibilidad aprobada;
- se mide uso legacy;
- el retiro se delega al lane 012;
- el origen no recupera autoridad salvo rollback aprobado y técnicamente permitido.

---

#### 35. Prohibición de dual-write autoritativo

No existe fase válida con dos fuentes empresariales autoritativas.

Una captura de delta, réplica o shadow:

```text
replica estado
≠ autoridad
```

Una vista de compatibilidad:

```text
expone contrato
≠ autoridad
```

---

#### 36. Backfill por unidad

Toda unidad con estado persistido declara uno de los modos aprobados de 005.

Ninguna migración pesada mezcla DDL, backfill masivo y cutover en un único paso opaco cuando puedan separarse.

---

#### 37. Estrategias de corte

Se conservan las estrategias aprobadas:

```text
QUIESCED_SNAPSHOT
HIGH_WATERMARK_PLUS_DELTA
APPEND_ONLY_RANGE
EVENT_REPLAY_WINDOW
EXTERNAL_BATCH_VERSION
```

La estrategia se decide antes de ejecutar.

---

#### 38. Calidad de datos

La unidad conserva:

- conteos;
- claves;
- referencias;
- nulos;
- dominios;
- unidades;
- dinero;
- tiempo;
- texto;
- duplicados;
- huérfanos;
- historia;
- cuarentena;
- reconciliación.

Un conteo idéntico no demuestra paridad semántica.

---

#### 39. Identidad y crosswalk

UUID, clave natural, identificador externo y clave empresarial permanecen conceptos distintos.

Toda reasignación usa crosswalk versionado.

No se fusiona por:

- nombre;
- correo;
- teléfono;
- SKU;
- slug;
- documento no verificado;
- primer resultado.

---

#### 40. Semántica de ausencia

Deben mantenerse diferenciados:

```text
campo ausente
null explícito
cadena vacía
clear explícito
desconocido
no aplicable
valor parcial
```

020 no introduce defaults para ocultar datos sin resolver.

---

#### 41. Disposición FUSIONAR

Una fusión exige:

1. grupo aprobado;
2. autoridad sobreviviente;
3. crosswalk;
4. divergencias clasificadas;
5. tratamiento de hijos y referencias;
6. writer único;
7. rollback o compensación;
8. consumidores reconciliados.

Nunca se elige el sobreviviente por nombre o antigüedad.

---

#### 42. Disposición DIVIDIR

Una división exige discriminador total.

Cada fila, archivo, comando o referencia debe resolver exactamente un destino o quedar en cuarentena.

No se permite duplicar una misma autoridad entre dos destinos.

---

#### 43. Disposición RETIRAR

020 puede preparar sucesor, fence y compatibilidad, pero no omite el lane de retiro progresivo.

El drop físico pertenece al gate 012 y a la tarea R2 propietaria que materialice ese retiro.

---

#### 44. Disposición CONSERVAR

`CONSERVAR` no significa “no revisar”.

La instancia comprueba:

- ubicación;
- seguridad;
- consumidores;
- contratos;
- compatibilidad;
- drift.

Si no hay cambio físico propio, la identidad puede quedar `NO_INDEPENDENT_CHANGE` con evidencia.

---

#### 45. Disposición MOVER

`MOVER` usa expand/contract:

```text
EXPAND TARGET
→ COPY/REPLAY
→ RECONCILE
→ COMPATIBILITY
→ CONSUMERS
→ CUTOVER
→ OBSERVE
→ RETIRE SOURCE LATER
```

Mover no equivale a renombrar el origen.

---

#### 46. Disposición RENOMBRAR

El universo aprobado contiene cero identidades `RENOMBRAR`.

Si una instancia observa una necesidad de rename puro, no la inventa dentro de 020: produce drift y exige reconciliar el mapa de disposición.

---

#### 47. Relaciones

Para una relación migrable, el paquete debe declarar:

- schema y nombre origen;
- schema y nombre destino;
- columnas;
- tipos;
- defaults;
- claves;
- referencias;
- RLS;
- grants;
- índices;
- triggers;
- Realtime;
- consumidores;
- backfill;
- delta;
- rollback.

020 materializa la transición estructural solo dentro del alcance asignado; controles especializados conservan sus tareas propietarias.

---

#### 48. Vistas

Una vista de negocio objetivo pertenece a su contrato propietario.

Una vista de compatibilidad temporal debe:

- enumerar columnas;
- conservar filtros;
- conservar cardinalidad;
- no ampliar datos;
- usar invocación segura;
- tener consumidores;
- tener sunset;
- no aceptar autoridad independiente.

---

#### 49. Funciones y RPC

Toda función se identifica por:

```text
schema
name
argument_types
return_type
security_mode
owner
search_path
volatility
EXECUTE grants
effects
consumers
```

Una función migrada no puede cambiar firma o autoridad silenciosamente.

---

#### 50. Triggers

Cada trigger conserva:

- relación padre;
- timing;
- evento;
- nivel;
- condición;
- orden;
- función ejecutora;
- side effects;
- idempotencia.

Su transición debe respetar la relación padre y no duplicar efectos entre origen y target.

---

#### 51. Edge Functions

020 conserva su identidad y dependencia en el paquete, pero la materialización, configuración y despliegue de Edge Functions pertenecen a `AUTH-DB-024`.

020 no despliega Edge Functions.

---

#### 52. Storage

020 conserva buckets, paths y dependencias dentro del mapa del paquete.

La materialización de políticas, gobierno de buckets y operaciones Storage pertenece a `AUTH-DB-022`.

No se mueve un objeto Storage borrando solamente metadata SQL.

---

#### 53. Realtime

020 preserva dependencias y publicación en el plan del paquete.

La materialización del contrato Realtime pertenece a `AUTH-DB-023`.

No se crean objetos personalizados dentro del schema administrado `realtime`.

---

#### 54. Cron, webhooks y automatismos

020 conserva identidad, dependencia, schedule, efecto y owner.

La materialización de Edge, webhooks, cron y automatismos pertenece a `AUTH-DB-024`.

Un cron duplicado no puede permanecer activo durante un merge.

---

#### 55. Constraints

020 no absorbe la activación final de constraints posteriores a backfill.

La validación y aplicación correspondiente pertenece a `AUTH-DB-011`.

El paquete, no obstante, debe reservar su orden y condición de entrada.

---

#### 56. Índices, retención y crecimiento

La responsabilidad especializada permanece en `AUTH-DB-025`.

020 documenta dependencia y presupuesto de lock/capacidad cuando el movimiento de objeto la necesita.

---

#### 57. Tipos generados

La publicación final de tipos después del paquete pertenece a `AUTH-DB-026`.

020 debe impedir un cutover cuyo consumidor dependa de tipos todavía incompatibles.

---

#### 58. Endurecimiento de RPC

Las tareas:

```text
AUTH-DB-006
AUTH-DB-007
AUTH-DB-008
AUTH-DB-009
AUTH-DB-010
```

son propietarias de contexto, sede, área, permiso exacto, principal y actor efectivo dentro de RPC sensibles.

020 no duplica esa lógica.

---

#### 59. RLS y grants

`AUTH-DB-021` es propietaria de políticas y grants canónicos por schema.

020 no declara que un objeto movido sea seguro solo porque existe en el owner schema.

---

#### 60. Clases de compatibilidad

Una unidad usa exactamente una clase raíz por superficie:

```text
NO_COMPATIBILITY_REQUIRED
READ_COMPATIBILITY_VIEW
QUERY_RPC_WRAPPER
COMMAND_RPC_WRAPPER
COLUMN_READ_ALIAS
OBJECT_NAME_ALIAS
TYPE_OR_ENUM_ADAPTER
EVENT_OR_PAYLOAD_ADAPTER
STORAGE_PATH_OR_METADATA_ADAPTER
CONFIGURATION_ALIAS
```

No se aceptan “fallbacks” sin contrato.

---

#### 61. Compatibilidad de lectura

Una lectura legacy derivada del target:

- no escribe;
- no corrige el target;
- no amplía filas;
- no amplía columnas;
- conserva RLS;
- conserva orden y null semantics;
- registra uso;
- tiene fecha/gate de salida.

---

#### 62. Wrapper de consulta

Un wrapper de consulta conserva firma legacy y delega en un contrato canónico.

No replica la lógica empresarial para mantener una segunda implementación.

---

#### 63. Wrapper de comando

Un wrapper de comando:

```text
legacy input
→ translate
→ authorize
→ canonical command
→ one business effect
→ translate outcome
```

No escribe en legacy y target por separado.

---

#### 64. Adaptadores de tipo y evento

Un adaptador de enum, payload o evento conserva:

- versión;
- mapping;
- identidad;
- orden;
- causalidad;
- errores;
- idempotencia;
- consumidor.

Un mapping desconocido bloquea; no usa fallback amplio.

---

#### 65. Congelación de `public`

`public` se trata como namespace transitorio.

Durante R2:

- no recibe nuevas fuentes de verdad permanentes;
- no recibe nuevos contratos empresariales por conveniencia;
- sus adapters temporales tienen owner y sunset;
- el destino debe estar en la arquitectura aprobada.

---

#### 66. Capa `api`

`api` es la capa empresarial objetivo de contratos expuestos.

No almacena estado autoritativo.

Un paquete que necesite exposición debe verificar que la fundación R1 de `api` exista antes de publicar el contrato.

---

#### 67. Owner schemas

Los owner schemas contienen fuentes autoritativas de dominio.

No deben concederse directamente a roles cliente por el mero movimiento de una relación.

La exposición se gobierna separadamente.

---

#### 68. Funciones privilegiadas

Toda función privilegiada migrada o adaptada debe conservar:

- necesidad de `SECURITY DEFINER`;
- owner no interactivo;
- `search_path` fijo;
- referencias calificadas;
- autorización interna;
- `EXECUTE` mínimo;
- pruebas adversariales.

Una falla de permiso no se resuelve añadiendo privilegio amplio.

---

#### 69. Schemas administrados por Supabase

Queda prohibido crear, mover o alterar objetos empresariales dentro de:

```text
auth
storage
realtime
```

salvo interfaces explícitamente soportadas por la plataforma, como policies admitidas en superficies gestionadas.

---

#### 70. Extensiones

La ejecución futura no depende de fijar una versión de extensión mediante `CREATE EXTENSION ... VERSION` o `ALTER EXTENSION ... UPDATE TO`.

La versión efectiva se captura como parte del ambiente y del candidate; cualquier cambio requerido se valida contra la plataforma vigente antes de ejecutar.

---

#### 71. Realtime administrado

La transición no crea DDL personalizado dentro del schema `realtime`.

La publicación y autorización Realtime se tratan por interfaces soportadas y por `AUTH-DB-023`.

---

#### 72. Consumidores

Cada unidad debe enumerar consumidores conocidos:

- web;
- móvil;
- dispositivos;
- Server Actions;
- RPC callers;
- Edge;
- cron;
- BI;
- exports;
- scripts;
- integraciones;
- clientes offline;
- soporte.

Un consumidor sin owner impide el retiro y puede impedir el cutover.

---

#### 73. Cohortes

Los consumidores cambian por cohortes explícitas.

Cada cohorte conserva:

```text
cohort_id
supported_release_range
owner
entry_gate
candidate_contract
telemetry
rollback_path
exit_gate
```

No se migra “todo el frontend” como una sola afirmación sin evidencia.

---

#### 74. Consumidores desconocidos

La ausencia de referencias literales no demuestra cero consumidores.

`DYNAMIC_OR_EXTERNAL_REVIEW`, telemetría incompleta o tráfico sin owner mantienen el gate abierto.

---

#### 75. Telemetría de compatibilidad

Cada adapter temporal registra como mínimo:

- identidad del contrato;
- consumidor o cohorte;
- versión;
- timestamp;
- resultado;
- error estable;
- latencia;
- uso de ruta legacy/canónica;
- correlation id.

No registra secretos ni payload sensible completo.

---

#### 76. Gate local

Antes de staging, el candidate debe demostrar:

- replay limpio;
- migrations ordenadas;
- suites aplicables;
- schema esperado;
- RLS/grants según alcance;
- compatibilidad;
- datos;
- rollback;
- ausencia de drift bloqueante.

`db reset --local` nunca se sustituye por pruebas contra producción.

---

#### 77. Gate staging

Staging recibe exactamente el mismo candidate.

Debe probar:

- integración hosted;
- Auth aplicable;
- Data API;
- Storage;
- Realtime;
- Edge;
- cron;
- seguridad;
- concurrencia;
- rendimiento;
- rollback.

Una recompilación produce un candidate distinto.

---

#### 78. Gate producción

Producción requiere:

```text
PRE_PROMOTION_PASS
→ APPLY AUTHORIZED CANDIDATE
→ POST_PROMOTION_PASS
→ OBSERVATION
```

No se ejecutan seeds ni resets enlazados.

---

#### 79. Suite previa

Antes de tocar una identidad aplicable deben pasar:

- identidad y disposition;
- baseline;
- dependencias;
- consumidores;
- writer;
- migration history;
- recovery point;
- fixtures;
- security assertions;
- expected outcomes.

---

#### 80. Evidencia durante ejecución

La futura ejecución registra:

```text
package_id
instance_id
candidate_id
environment
commit
migration versions
statement/action
batch/checkpoint
watermark
lock/retry
rows or objects affected
outcome
actor
timestamp
correlation_id
```

La evidencia no se reconstruye después por memoria.

---

#### 81. Suite posterior

Antes de certificar autoridad objetivo se demuestran:

- claves;
- conteos;
- referencias;
- semántica;
- efectos;
- seguridad;
- consumers;
- delta;
- compatibilidad;
- observabilidad;
- rollback aún vigente.

Un assertion crítico fallido bloquea el paquete.

---

#### 82. Rendimiento

El paquete compara `before`, `during` y `after` bajo escenario comparable.

Una unidad sin baseline no puede certificarse por “verse rápida”.

Los presupuestos del contrato 010 son gates, no recomendaciones.

---

#### 83. Seguridad con tolerancia cero

Debe existir cero:

- acceso no autorizado;
- grant nuevo no aprobado;
- bypass RLS;
- `SECURITY DEFINER` expuesto indebidamente;
- secreto en cliente o evidencia;
- doble autoridad;
- pérdida o duplicación de efecto sensible.

---

#### 84. Rollback por paquete

Cada instancia conserva:

```text
rollback_package_id
rollback_unit_ids
recovery_point_id
pre_change_authority
candidate_authority
return_authority
rpo_target
rto_target
abort_triggers
point_of_no_return
rollback_mode
verification_suite
```

Sin estos campos resueltos, la unidad no entra a producción.

---

#### 85. Recovery point

El recovery point debe existir antes del cambio.

Puede ser:

- definición anterior;
- dump;
- snapshot;
- watermark + delta;
- bundle;
- manifest;
- crosswalk;
- evidencia compensable.

“Tenemos backups” no identifica un recovery point.

---

#### 86. RPO y RTO

Dinero, identidad, autorización, auditoría, documentos, secretos y efectos empresariales confirmados usan `RPO = 0` salvo un contrato empresarial más específico y explícito.

El RTO se valida mediante drill; un valor narrativo no cierra el gate.

---

#### 87. Migraciones ya aplicadas

Queda prohibido:

- editar una migración aplicada;
- cambiar su timestamp;
- reemplazar su contenido;
- usar `migration repair` como reversa de SQL;
- borrar historia para hacer coincidir ambientes.

Una corrección posterior usa una migración nueva.

---

#### 88. Retiro físico

020 no interpreta `MOVER`, `FUSIONAR`, `DIVIDIR` o `RETIRAR` como permiso de drop.

El retiro físico requiere lane 012, cero uso demostrado y la tarea R2 especializada aplicable.

---

#### 89. Cero uso

`ZERO_CONFIRMED` necesita fuentes de telemetría suficientes durante la ventana aprobada.

No equivalen a cero uso:

```text
no apareció en grep
no hubo logs hoy
pg_stat_statements fue reiniciado
no conocemos caller
```

---

#### 90. Estados de una instancia 020

Estados cerrados:

```text
NOT_EXECUTED_GATE_CLOSED
READY_FOR_PACKAGE_PREFLIGHT
BLOCKED_BY_DRIFT
BLOCKED_BY_PREREQUISITE
BLOCKED_BY_DEPENDENCY
READY_FOR_MATERIALIZATION
MATERIALIZATION_IN_PROGRESS
READY_FOR_COHORT
COHORT_IN_PROGRESS
CUTOVER_ELIGIBLE
TARGET_AUTHORITY_ACTIVE
OBSERVATION_ACTIVE
PACKAGE_PASS
PACKAGE_ROLLED_BACK
PACKAGE_FAILED_CLOSED
```

No existe `PARTIAL_PASS`.

---

#### 91. Monotonicidad

El avance normal es monotónico.

Un rollback puede volver a una autoridad anterior solo conforme al plan 011.

No se degrada un `BLOCKED` a `PASS` por omitir la evidencia que lo bloquea.

---

#### 92. Bundle de evidencia

Cada instancia produce un bundle append-only con:

1. manifiesto del paquete;
2. candidate;
3. transition_keys;
4. migration_units;
5. baseline remoto;
6. drift;
7. prechecks;
8. migraciones aplicadas;
9. backfill/delta;
10. compatibilidad;
11. consumers;
12. seguridad;
13. rendimiento;
14. rollback;
15. postchecks;
16. observación;
17. outcome;
18. hashes.

---

#### 93. Correlación

Toda evidencia debe poder correlacionarse mediante:

```text
package_id
AUTH-DB-020 instance id
candidate_id
migration_unit_id
transition_key
environment
commit_sha
correlation_id
```

Una captura aislada sin estas identidades no certifica la unidad.

---

#### 94. Cobertura de prueba vigente reutilizada

La tarea no modifica el registro 04A.

Reutiliza, entre otras, reglas vigentes que gobiernan:

- compatibilidad legacy con owner, consumers, paridad, rollback y retiro;
- prohibición de retirar objetos sin mapa verificable;
- mínimo privilegio en superficies Data API;
- equivalencia entre evaluadores, RPC y RLS;
- reconstrucción limpia, drift, backup, restore y rollback de migraciones.

Referencias vigentes reutilizadas incluyen `TREQ-SUPABASE-001`, `TREQ-SUPABASE-003`, `TREQ-SUPABASE-005`, `TREQ-SUPABASE-007` y `TREQ-SUPABASE-008`.

Esta sección es trazabilidad y no actualiza esos requisitos.

---

#### 95. Frontera VITAL

Las 54 relaciones y demás identidades de VITAL registradas en el universo de transición permanecen fuera de Vento OS cuando su clasificación es `OUTSIDE_VENTO_OS`.

Una instancia 020 de Vento OS:

- no mueve su autoridad;
- no incorpora sus datos;
- no modifica sus contracts;
- solo demuestra no intervención cuando la dependencia lo requiera.

---

#### 96. Especialización VISO mensual

El archivo propietario conserva una especialización registrada:

```text
AUTH-DB-020::VISO-SCHEDULE-MONTHLY-001
```

Esta especialización consume el contrato general de 020. Su existencia documental no constituye ejecución activa ni excepción al gate `POST_E5_PACKAGE`.

---

#### 97. Obligaciones de VISO-SCHEDULE-MONTHLY-001

La especialización conserva estas diez obligaciones heredadas:

1. parte de `VISO-SCH-004`;
2. crea una migración posterior si la provisional ya fue aplicada;
3. no edita migraciones aplicadas;
4. prueba comportamiento semanal y mensual;
5. define concurrencia;
6. permite reducir horas únicamente de forma autorizada;
7. expone errores estructurados;
8. conserva baseline antes y después;
9. tiene rollback;
10. actualiza tipos mediante su tarea propietaria.

Estas obligaciones complementan, no sustituyen, los gates generales de 020.

---

#### 98. Fronteras con las tareas R2 siguientes

020 se limita a la migración progresiva y compatibilidad estructural coordinada.

No absorbe:

| Tarea         | Responsabilidad reservada           |
| ------------- | ----------------------------------- |
| `AUTH-DB-006` | contexto canónico en RPC sensibles  |
| `AUTH-DB-007` | validación de sede                  |
| `AUTH-DB-008` | validación de área                  |
| `AUTH-DB-009` | permiso exacto                      |
| `AUTH-DB-010` | principal y actor efectivo          |
| `AUTH-DB-021` | RLS y grants canónicos              |
| `AUTH-DB-011` | constraints posteriores             |
| `AUTH-DB-022` | Storage                             |
| `AUTH-DB-023` | Realtime                            |
| `AUTH-DB-024` | Edge, webhooks, cron y automatismos |
| `AUTH-DB-025` | índices, retención y crecimiento    |
| `AUTH-DB-026` | tipos publicados                    |

---

#### 99. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

```text
Requisitos creados: 0
Requisitos modificados: 0
Requisitos diferidos: 0
Requisitos obsoletos: 0
```

La cobertura vigente de transición, seguridad, compatibilidad, consumidores, migraciones, paridad, recuperación y retiro es suficiente para especificar esta tarea sin crear identificadores adicionales.

---

#### 100. Criterios de aceptación

`AUTH-DB-020` queda documentalmente aceptable cuando se demuestra que:

- la topología es `TEMPLATE_PER_PACKAGE`;
- el gate es `POST_E5_PACKAGE`;
- el universo de 970 identidades se conserva por referencia;
- las disposiciones no se reinterpretan;
- cada futura instancia selecciona un subconjunto exacto;
- cada identidad conserva `transition_key`;
- R0/R1 se verifican antes de usarlos;
- E5 y SHELL-CI-020 son obligatorios;
- existe writer único;
- la compatibilidad no es autoridad;
- el backfill y delta son reconciliables;
- consumers se migran por cohorte;
- las tareas R2 posteriores conservan ownership;
- no se editan migraciones aplicadas;
- rollback y evidencia son obligatorios;
- retiro legacy continúa separado;
- VITAL permanece fuera de alcance;
- la especialización VISO mensual queda preservada;
- no se modifica 04A;
- no se ejecuta ningún cambio físico.

---

#### 101. Evidencia de validación

| Clase     | Estado       | Evidencia                                                                                                                                                                                |
| --------- | ------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED | La batería oficial del checkout se ejecutará después del reemplazo en la rama documental de la tarea.                                                                                    |
| LOCAL     | PASS         | El artefacto fue comprobado estructuralmente: título único, metadata obligatoria, secciones requeridas, evidencia completa, continuidad, ausencia de placeholders y whitespace residual. |
| REMOTA    | PASS         | `main`, topología, R2, contratos E3 y baseline read-only de `vento-os-dev` fueron consultados; los conteos 379/348/197 y 24/14/7 siguen alineados con el universo aprobado.              |
| OPERATIVA | NOT_EXECUTED | No se ejecutó package, cohorte, cutover, piloto ni observación operativa.                                                                                                                |
| FÍSICA    | NOT_EXECUTED | No se creó ni aplicó migración, DDL, DML, backfill, función, policy, grant, bucket, deploy, cron ni cambio remoto.                                                                       |

La evidencia `REMOTA = PASS` certifica exclusivamente la auditoría read-only necesaria para desarrollar el contrato. No certifica readiness físico de ninguna instancia `AUTH-DB-020::<package_id>`.

---

#### 102. Límites

Esta tarea no:

- crea una migración SQL;
- ejecuta `db push`;
- ejecuta `db reset`;
- ejecuta backfills;
- crea schemas;
- mueve tablas;
- mueve datos;
- crea wrappers físicos;
- activa compatibilidad;
- cambia writers;
- modifica RLS;
- modifica grants;
- crea constraints;
- despliega Edge Functions;
- cambia Storage;
- cambia Realtime;
- cambia cron;
- publica tipos;
- retira objetos legacy;
- modifica 04A;
- autoriza un package;
- abre `SHELL-CI-020`;
- autoriza producción.

Todo cambio físico queda reservado a una futura instancia con sus gates satisfechos.

---

#### 103. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-DB-014 — Implementar auditoría de dispositivos`

**TAREA ACTUAL APROBADA**
`AUTH-DB-020 — Migrar objetos por dominio con compatibilidad temporal`

**SIGUIENTE TAREA RESERVADA**
`AUTH-DB-006 — Incorporar contexto canónico en RPC sensibles`


### ✅ AUTH-DB-006 — Incorporar contexto canónico en RPC sensibles

**Estado:** APROBADA
**Tarea anterior:** AUTH-DB-020 — Migrar objetos por dominio con compatibilidad temporal
**Tarea siguiente:** AUTH-DB-007 — Validar sede dentro de RPC sensibles
**Tipo de tarea:** Documental; contrato y plantilla R2 repetible por `package_id` para adopción del contexto canónico dentro de RPC sensibles
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/03_R2_MIGRACION_PROGRESIVA_POR_DOMINIO.md`
**Estado físico resultante:** Contrato `RPC-CONTEXT-ADOPTION-006@1.0.0` cerrado como `TEMPLATE_PER_PACKAGE`; cada futura instancia `AUTH-DB-006::package_id` permanece no ejecutada hasta verificar R0/R1 aplicables, paquete E5, `SHELL-CI-020::package_id` y autorización física explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`AUTH-DB-006` define cómo toda RPC sensible incluida en un paquete aprobado incorpora un `AccessContext@1.0.0` real, resuelto en servidor y no controlable por el caller, antes de utilizar hechos de identidad, actor, empleo, turno, check-in, dispositivo, sede, área o rol para una operación protegida.

La tarea no implementa RPC ni cambia funciones remotas. Cierra el contrato que cada futura instancia `AUTH-DB-006::package_id` deberá materializar.

---

#### 2. Decisión central

La regla vinculante es:

```text
RPC SENSIBLE
→ RESUELVE CONTEXTO CANÓNICO EN SERVIDOR
→ CONSERVA UN ÚNICO SNAPSHOT DE CONTEXTO
→ USA ESE SNAPSHOT COMO HECHOS DE AUTORIZACIÓN
→ NO ACEPTA AUTORIDAD DEL CALLER
→ ENTREGA A LAS VALIDACIONES POSTERIORES 007..010
```

Queda prohibido reconstruir autoridad desde parámetros legacy, filas planas, cookies locales, metadata editable, nombres de rol o helpers booleanos históricos.

---

#### 3. Contrato material producido

El contrato de esta tarea se denomina:

```text
RPC-CONTEXT-ADOPTION-006@1.0.0
```

Su unidad repetible es una RPC identificada por firma exacta dentro de una instancia de paquete.

El contrato no reemplaza `AccessContext@1.0.0`; define su adopción dentro de las RPC sensibles.

---

#### 4. Topología vinculante

La topología aplicable es:

```text
mode = TEMPLATE_PER_PACKAGE
execution_gate = POST_E5_PACKAGE
instance = AUTH-DB-006::package_id
```

Consecuencias:

1. el marcador canónico se desarrolla una sola vez;
2. no existe `AUTH-DB-006::GLOBAL`;
3. cada `package_id` registra su propia instancia;
4. cada instancia contiene únicamente las RPC incluidas en el alcance aprobado del paquete;
5. una ejecución de un paquete no certifica las RPC de otro;
6. la definición documental no abre implementación física.

---

#### 5. Gate temporal

Una instancia futura solo podrá materializar cambios cuando, para el mismo `package_id`, existan:

```text
R0 aplicable = VERIFIED
R1 aplicable = VERIFIED
AUTH-DB-020::package_id = APPLICABLE_OR_VERIFIED
E5-GATE-008::package_id = PASS
SHELL-CI-020::package_id = OPENED
physical_authorization = EXPLICIT
```

La ausencia de cualquiera de estas condiciones mantiene la instancia en `NOT_EXECUTED_GATE_CLOSED`.

---

#### 6. Frontera con AUTH-DB-020

`AUTH-DB-020` decide qué objetos y contratos entran al paquete y gobierna su migración progresiva.

`AUTH-DB-006` recibe de 020:

```text
package_id
candidate_id
transition_keys
migration_unit_ids
RPC incluidas
compatibility_plan_refs
consumer_refs
rollback_refs
```

006 no amplía el package por descubrir una RPC nueva. Una RPC nueva produce drift y obliga a reconciliar el alcance propietario.

---

#### 7. Dependencias R1

La adopción canónica depende de que las fundaciones R1 necesarias estén físicamente verificadas.

Como mínimo, cuando aplique:

```text
app_private.get_access_context(text)
app_private.get_context_freshness_token(text)
app_private.evaluate_authorization(jsonb)
app_private.authorization_policy_allows(jsonb)
```

La instancia no crea esas fundaciones para desbloquearse.

---

#### 8. Estado físico observado de las dependencias R1

En el corte remoto usado para desarrollar esta tarea no existen todavía las identidades físicas canónicas enumeradas en la sección anterior.

Por tanto:

```text
CONTRATOS R1 = APROBADOS
MATERIALIZACIÓN R1 EN REMOTO = NO OBSERVADA
AUTH-DB-006 FÍSICO = NO MATERIALIZABLE AÚN POR INFERENCIA
```

Cada paquete deberá repetir el precheck. Un remoto futuro puede ser distinto.

---

#### 9. Fuente canónica del contexto

La fuente completa es:

```text
app_private.get_access_context(p_app_code text) → jsonb
```

y produce:

```text
AccessContext@1.0.0
```

La RPC sensible consume ese resultado como contexto autoritativo de hechos.

---

#### 10. Firma del resolver

La firma permitida para obtener contexto es exactamente:

```text
app_private.get_access_context(text)
```

El único argumento público del resolver es `p_app_code`.

No se aceptan overloads con actor, empleado, sede, área, dispositivo, rol, permiso o recurso como sustitutos.

---

#### 11. Proyección segura no autoritativa

`api.get_safe_access_context(text)` es una proyección cliente y no una fuente de autoridad para una RPC protegida.

Regla:

```text
api.get_safe_access_context
→ PRESENTACIÓN SEGURA

app_private.get_access_context
→ CONTEXTO COMPLETO INTERNO
```

Una RPC no recibe la proyección segura desde el caller para reconstruir el contexto completo.

---

#### 12. Frontera con el evaluador canónico

El contexto resuelve hechos.

La autorización decide si una acción concreta está permitida.

Por tanto:

```text
get_access_context
→ RESUELVE QUIÉN Y EN QUÉ CONTEXTO

evaluate_authorization
→ DECIDE SI PUEDE HACER LA ACCIÓN
```

006 no sustituye la evaluación de permiso exacto propiedad de `AUTH-DB-009`.

---

#### 13. Prohibición de usar contexto como decisión

Campos de contexto como:

```text
base_role
operational_role
operational_site
operational_area
lane_readiness
```

no son equivalentes a `ALLOW`.

Una RPC no puede concluir autorización solamente porque alguno de esos campos exista.

---

#### 14. Definición de RPC sensible

Dentro de un paquete, una RPC es sensible cuando cumple al menos una de estas condiciones:

1. muta estado empresarial protegido;
2. lee datos no públicos sujetos a actor, territorio o propósito;
3. ejecuta una transición de estado;
4. produce efectos externos o derivados;
5. administra identidad, autorización, permisos, dispositivos o sesiones;
6. actúa sobre dinero, inventario, documentos, asistencia, producción, pedidos o datos equivalentes protegidos;
7. usa o deriva actor, empleado, rol, sede, área, turno, check-in o dispositivo;
8. opera como borde privilegiado `SECURITY DEFINER`;
9. puede ser invocada por un cliente, integración o servicio fuera del owner interno;
10. un contrato canónico previo exige autorización contextual.

El nombre de la función no decide por sí solo la sensibilidad.

---

#### 15. Registro por paquete

Cada futura instancia materializa un registro cerrado:

```text
rpc_context_adoption_id
package_id
candidate_id
transition_key
migration_unit_id
schema_name
function_name
identity_arguments
return_contract
rpc_class
audience
exposure_mode
security_mode
app_code_contract
context_requirement
canonical_context_source
authority_bearing_legacy_arguments
resource_arguments
context_fields_consumed
downstream_validation_007
downstream_validation_008
downstream_validation_009
downstream_validation_010
rls_handoff_021
types_handoff_026
compatibility_reference
consumer_reference
rollback_reference
adoption_state
blocking_or_exit_gate
evidence_reference
owner
```

No se admite una fila identificada solo por nombre sin firma.

---

#### 16. Cardinalidad del registro

Para cada package:

```text
RPC sensibles esperadas = N
RPC sensibles materializadas = N
faltantes = 0
duplicadas = 0
sin clasificación = 0
sin owner = 0
sin firma exacta = 0
sin estado = 0
```

`N` se deriva del package aprobado y del preflight de drift; no es un número global fijo de esta tarea.

---

#### 17. Identidad exacta de RPC

Una RPC se identifica por:

```text
schema
function_name
identity_arguments
```

Cuando existan overloads, cada firma es una identidad distinta.

Cambiar argumentos, tipos o schema requiere reconciliación contractual; no se considera la misma RPC por compartir nombre.

---

#### 18. Clases cerradas de adopción

Cada identidad usa exactamente una clase:

| Clase                              | Semántica                                                                                |
| ---------------------------------- | ---------------------------------------------------------------------------------------- |
| `CONTEXT_REQUIRED_COMMAND`         | comando protegido que debe resolver contexto antes de efectos                            |
| `CONTEXT_REQUIRED_QUERY`           | consulta protegida que debe resolver contexto antes de leer                              |
| `CONTEXT_INHERITED_INTERNAL`       | helper no expuesto que opera únicamente dentro de una RPC padre protegida                |
| `CONTEXT_NOT_APPLICABLE_PUBLIC`    | contrato verdaderamente público con evidencia de que no depende de autoridad empresarial |
| `CONTEXT_NOT_APPLICABLE_SYSTEM`    | operación de sistema con principal técnico explícito y contrato propio                   |
| `LEGACY_CONTEXT_ADAPTER_TEMPORARY` | adapter temporal que conserva compatibilidad sin convertirse en autoridad                |
| `BLOCKED_UNCLASSIFIED`             | evidencia insuficiente para decidir de forma segura                                      |

No existe clase implícita por defecto.

---

#### 19. Comandos protegidos

`CONTEXT_REQUIRED_COMMAND` exige que el contexto se resuelva antes de:

- DML empresarial;
- efectos externos;
- emisión de eventos;
- escritura de auditoría de resultado;
- cambio de estado;
- uso de parámetros que el caller pudiera falsificar para ampliar alcance.

Un fallo de contexto produce cero efecto empresarial.

---

#### 20. Consultas protegidas

`CONTEXT_REQUIRED_QUERY` resuelve contexto antes de construir filtros, joins, agregaciones o proyecciones sensibles.

La ausencia de mutación no convierte una lectura en pública.

---

#### 21. Helpers internos

`CONTEXT_INHERITED_INTERNAL` solo aplica cuando:

1. no existe `EXECUTE` cliente;
2. no constituye Data API pública;
3. recibe su contexto desde una RPC padre ya protegida o trabaja dentro del mismo borde;
4. no vuelve a resolver una autoridad contradictoria;
5. su evidencia identifica la RPC padre.

Un helper expuesto deja de ser elegible para esta clase.

---

#### 22. Contratos públicos

`CONTEXT_NOT_APPLICABLE_PUBLIC` requiere evidencia positiva de publicidad.

No basta con:

```text
anon tiene EXECUTE
la función siempre estuvo en public
no encontramos un check de permiso
```

Si la función toca información o efectos protegidos, permanece bloqueada hasta su clasificación correcta.

---

#### 23. Procesos de sistema

`CONTEXT_NOT_APPLICABLE_SYSTEM` requiere un principal técnico explícito, proceso, ambiente, operaciones permitidas y owner.

Un proceso de sistema no se representa como empleado ficticio.

---

#### 24. Adapter legacy temporal

`LEGACY_CONTEXT_ADAPTER_TEMPORARY` puede conservar una firma histórica solo si:

- la autoridad proviene del contexto canónico;
- no reconstruye contexto desde la forma legacy;
- no acepta actor o territorio del caller como autoridad;
- tiene consumer owner;
- tiene telemetría;
- tiene sunset;
- tiene rollback;
- no admite nuevos consumidores.

---

#### 25. Estado bloqueado

`BLOCKED_UNCLASSIFIED` impide cutover.

Debe conservar:

```text
qué evidencia falta
owner de resolución
tarea propietaria
condición exacta de salida
```

No se resuelve por inferencia optimista.

---

#### 26. Contrato de app_code

Toda RPC sensible declara cómo obtiene `app_code`.

Modos cerrados:

```text
FIXED_BY_RPC_CONTRACT
EXACT_VALIDATED_INPUT
INHERITED_FROM_PROTECTED_PARENT
SYSTEM_CONTRACT
NOT_APPLICABLE_PUBLIC
```

No se permiten defaults silenciosos.

---

#### 27. FIXED_BY_RPC_CONTRACT

Cuando una RPC pertenece a una sola aplicación canónica, el código se fija server-side.

Ejemplo conceptual:

```text
RPC de inventario NEXO
→ app_code definido por el contrato de esa RPC
→ caller no selecciona otra app para cambiar autoridad
```

El valor exacto pertenece al package y al contrato de la RPC.

---

#### 28. EXACT_VALIDATED_INPUT

Solo se usa si una misma firma está contractualmente autorizada para más de una aplicación.

El input:

- es obligatorio;
- se compara exactamente;
- no se corrige silenciosamente;
- no se convierte a minúscula para encubrir error;
- no usa alias;
- no tiene aplicación fallback.

---

#### 29. Resolución única por invocación

Una RPC protegida resuelve el contexto una sola vez por ejecución lógica.

Forma conceptual:

```text
BEGIN RPC
→ resolve AccessContext
→ freeze local immutable context
→ validate resource/territory/permission
→ execute business operation
→ record correlated evidence
END RPC
```

No se re-resuelve contextualmente en distintos puntos para escoger el resultado más conveniente.

---

#### 30. Snapshot inmutable

La invocación conserva como mínimo cuando el contrato los produzca:

```text
context_id
context_contract_version
resolved_at
principal
actor_effective
context_fingerprint
lane_readiness
structural_issues
```

La RPC no modifica ese objeto.

---

#### 31. Frescura

Una instancia que dependa de frescura debe consumir la fundación canónica correspondiente.

Reglas:

1. no usa una caché cliente como autoridad;
2. no usa stale-while-revalidate para autorizar una mutación;
3. no inventa TTL local;
4. no toma `context_fingerprint` del caller como prueba suficiente;
5. un contexto no verificable mantiene la operación bloqueada.

---

#### 32. Sesión

Para operaciones que exijan sesión activa, el contrato canónico conserva la identidad de sesión resuelta por servidor.

Una RPC sensible no confía en:

- un `session_id` enviado como parámetro;
- una cookie interpretada manualmente dentro de SQL;
- metadata de usuario editable;
- la mera capacidad de una credencial privilegiada.

La validación estricta de sesión permanece en su fundación propietaria.

---

#### 33. Parámetros con hechos de contexto

Una firma legacy puede contener parámetros como:

```text
p_user_id
p_employee_id
p_actor_id
p_site_id
p_area_id
p_role
p_device_id
p_shift_id
```

La presencia del argumento no concede autoridad.

Cada parámetro debe clasificarse como:

```text
RESOURCE_IDENTIFIER
BUSINESS_INPUT
COMPATIBILITY_ONLY
UNTRUSTED_AUTHORITY_INPUT
REMOVE_AFTER_CONSUMER_MIGRATION
```

---

#### 34. User, employee, principal y actor

El caller no elige el principal o actor efectivo de una RPC humana protegida mediante un UUID.

Un identificador de otra persona puede ser recurso de la operación, por ejemplo un empleado administrado, pero nunca se confunde con el actor que ejecuta la operación.

---

#### 35. Sede y área

Los argumentos de sede y área pueden identificar el recurso objetivo.

No definen por sí solos la sede o área autorizada del actor.

La comparación de territorio se entrega a `AUTH-DB-007` y `AUTH-DB-008`.

---

#### 36. Rol y permiso

Una RPC no acepta un rol enviado por el caller para decidir autoridad.

El permiso exacto tampoco se deduce de un booleano proporcionado por el cliente.

La evaluación de permiso exacto pertenece a `AUTH-DB-009`.

---

#### 37. Identificadores de recurso

IDs de pedido, producto, documento, sesión de conteo, remisión o entidad equivalente siguen siendo inputs de negocio.

La RPC debe resolver server-side su owner, territorio, estado y atributos necesarios antes de autorizar.

006 define esta separación; las validaciones específicas posteriores conservan su ownership.

---

#### 38. Dispositivo y actor efectivo

Un `device_id` o `actor_employee_id` enviado como argumento no prueba posesión, vínculo, sesión de actor ni autoridad.

El contexto canónico debe conservar la resolución efectiva ya aprobada.

---

#### 39. Simulación

`SimulationContext` permanece separado de `AccessContext` real.

Una RPC de negocio no convierte una simulación en autoridad real ni reutiliza un rol simulado como actor efectivo.

La operación solo admite simulación cuando su contrato propietario lo autorice expresamente y sin producir efectos prohibidos.

---

#### 40. Principal técnico

Un principal técnico conserva:

```text
service identity
system process
environment
delegation when applicable
allowed operation
```

No adopta automáticamente carriles humanos de empleado o cliente.

---

#### 41. service_role

`service_role` es capacidad de infraestructura y no autoridad empresarial universal.

Reglas:

1. no representa un empleado;
2. no representa un gerente;
3. no representa consentimiento;
4. no sustituye `AccessContext`;
5. no permite omitir el contrato de un principal técnico;
6. una RPC no se considera autorizada porque `service_role` pueda ejecutarla.

---

#### 42. anon y authenticated

`anon` y `authenticated` son roles técnicos de acceso, no decisiones empresariales.

Una RPC sensible debe distinguir:

```text
puede invocar físicamente
≠
está autorizado empresarialmente
```

La reducción final de grants pertenece además a `AUTH-DB-021`.

---

#### 43. SECURITY DEFINER

Adoptar contexto canónico no justifica añadir `SECURITY DEFINER`.

Cuando una RPC ya lo necesita o su diseño aprobado lo exige:

- la necesidad se documenta;
- la autorización interna permanece obligatoria;
- el owner técnico no se convierte en autoridad empresarial;
- el privilegio no sustituye RLS ni evaluación;
- la superficie de `EXECUTE` se minimiza.

---

#### 44. search_path

Toda función `SECURITY DEFINER` aplicable debe tener `search_path` endurecido conforme al contrato vigente y referencias calificadas.

Un package no conserva `search_path=public` por compatibilidad si eso contradice la fundación aprobada.

La corrección física correspondiente se versiona en el package.

---

#### 45. Grants de ejecución

El inventario por firma conserva:

```text
PUBLIC EXECUTE
anon EXECUTE
authenticated EXECUTE
service execution
```

Una concesión histórica no se interpreta como contrato aprobado.

006 registra la necesidad; `AUTH-DB-021` gobierna la política final de grants y RLS.

---

#### 46. Frontera transaccional

La adquisición de contexto y la operación protegida deben pertenecer a una frontera coherente.

La RPC no puede:

1. autorizar con un contexto;
2. ejecutar una operación significativa mucho después;
3. ignorar cambios de versión o precondición;
4. producir efectos parciales antes del fallo.

---

#### 47. Fallo antes del efecto

Si falla la resolución o la precondición contextual:

```text
business mutation = 0
external effect = 0
authorization success = false
```

La auditoría del intento puede persistir únicamente según el contrato de auditoría aprobado.

---

#### 48. Reintentos e idempotencia

Un retry no vuelve a confiar en inputs de autoridad.

Cuando la RPC es idempotente, la identidad de operación, actor/contexto y precondiciones se correlacionan conforme al contrato del comando.

Un resultado previo no se reutiliza para otro actor o contexto.

---

#### 49. Legacy: get_operational_context

La identidad actual:

```text
public.get_operational_context(
  p_employee_id uuid,
  p_site_id uuid,
  p_app_code text
)
```

es legacy.

Divergencias observadas:

- acepta `employee_id`;
- acepta `site_id`;
- usa defaults;
- combina selected site, check-in, shift y employee site;
- contiene bypass por nombres de rol;
- produce `can_operate`;
- usa helpers legacy de permisos.

No puede convertirse en la fuente canónica de 006.

---

#### 50. Legacy: get_effective_context_v1

La identidad actual:

```text
public.get_effective_context_v1(p_app_code text)
```

es una proyección legacy.

Divergencias observadas:

- normaliza el app code;
- admite default;
- mezcla rutas de shared device, simulación y contexto real;
- llama `get_operational_context`;
- devuelve forma plana;
- expone `bypass_applied` y `can_operate`.

No representa `AccessContext@1.0.0`.

---

#### 51. Evaluadores booleanos legacy

El baseline remoto contiene, entre otros:

| Firma lógica                                                       | Estado en 006                        |
| ------------------------------------------------------------------ | ------------------------------------ |
| `public.has_effective_permission_v1(text,text)`                    | legacy; no autoridad canónica        |
| `public.has_operational_permission(text,uuid,uuid,text)`           | legacy; no autoridad canónica        |
| `public.has_operational_role_permission(text,text,uuid,uuid,text)` | helper legacy; no evaluador canónico |
| `public.has_permission(text,uuid,uuid)`                            | legacy; no evaluador canónico        |
| `public.has_role_permission(text,text,uuid,uuid)`                  | helper legacy; no evaluador canónico |

La adopción de contexto no autoriza seguir ampliando estos contratos.

---

#### 52. Prohibición de dependencia legacy nueva

Después de adoptar 006 en una RPC:

```text
new dependency on get_operational_context = PROHIBITED
new dependency on get_effective_context_v1 = PROHIBITED
new generic boolean permission dependency = PROHIBITED
```

Una excepción de compatibilidad debe figurar como adapter temporal con owner y sunset.

---

#### 53. Compatibilidad temporal

Cuando un consumer todavía depende de firma legacy, el package puede conservar la firma mientras cambia la autoridad interna.

Regla:

```text
LEGACY SIGNATURE
→ CANONICAL CONTEXT
→ CANONICAL VALIDATIONS
→ SAME APPROVED OBSERVABLE CONTRACT
```

No:

```text
LEGACY SIGNATURE
→ LEGACY AUTHORITY
```

---

#### 54. Evolución de firma

006 no obliga a eliminar en el mismo paso todos los parámetros legacy.

El package decide, conforme a 020 y a los consumers:

```text
KEEP_TEMPORARILY
DEPRECATE
REMOVE_AFTER_ZERO_USE
REPLACE_WITH_CANONICAL_CONTRACT
```

La autoridad debe migrarse antes o al mismo tiempo que el uso protegido de esos parámetros.

---

#### 55. Consumidores

Toda RPC incluida debe enlazar sus consumidores conocidos.

La adaptación conserva:

- repositorio;
- callsite o binding;
- release/cohorte;
- owner;
- versión actual;
- versión objetivo;
- compatibilidad;
- telemetría;
- rollback.

La ausencia de referencia literal no demuestra ausencia de consumidor.

---

#### 56. Invocación directa

La suite debe invocar la RPC por su superficie real, sin pasar por la UI.

Objetivo:

```text
UI BYPASS
→ MISMA AUTORIZACIÓN O MÁS RESTRICTIVA
```

Una protección solo presente en frontend no satisface 006.

---

#### 57. Llamada sin interfaz

Server Action, script, Data API, SDK, integración y llamada SQL autorizada deben conservar la misma autoridad contextual para la misma operación.

La capa de presentación no puede agregar el hecho que haga segura la RPC.

---

#### 58. Handoff a AUTH-DB-007

006 entrega a 007:

```text
AccessContext canónico resuelto
+
recurso objetivo identificado
+
site inputs clasificados
```

007 es propietaria de validar la sede dentro de la RPC.

006 no congela reglas territoriales adicionales.

---

#### 59. Handoff a AUTH-DB-008

006 entrega a 008:

```text
AccessContext canónico
+
resource area cuando aplique
+
area inputs clasificados
```

008 valida área y compatibilidad territorial.

---

#### 60. Handoff a AUTH-DB-009

006 entrega a 009:

```text
AccessContext canónico
+
acción/recurso
+
permission contract exacto por definir en la RPC
```

009 adopta el evaluador canónico para el permiso exacto.

006 no usa `has_permission` como sustituto.

---

#### 61. Handoff a AUTH-DB-010

006 conserva principal y actor efectivos del contexto sin permitir que el caller los reemplace.

010 valida explícitamente principal y actor efectivo dentro de las RPC sensibles.

---

#### 62. Handoff a AUTH-DB-021

006 inventaría exposición y privilegio de ejecución.

021 alinea:

- RLS;
- grants;
- audiences;
- superficie `api`;
- owner schemas;
- funciones privilegiadas.

El contexto correcto no compensa una policy o grant incorrectos.

---

#### 63. Handoff a AUTH-DB-026

Toda modificación de firma, retorno, schema o contrato observable queda registrada para regeneración y publicación de tipos después del paquete.

006 no publica tipos.

---

#### 64. Paridad con RLS

La adopción del contexto en RPC no crea una lógica de autorización paralela a RLS.

El package debe poder demostrar que para el mismo actor, contexto, recurso y permiso:

```text
RPC
RLS
CANONICAL EVALUATOR
```

no producen una ampliación contradictoria.

La materialización específica de políticas pertenece a 021.

---

#### 65. Semántica de errores

006 no crea strings de error locales como contrato público.

Una falla de contexto se mapea al catálogo canónico vigente de errores y razones.

Si no existe un código compatible:

```text
BLOCK
→ route to owning AUTH-ERR contract
→ approve semantic error
→ resume package
```

No se inventa un texto libre para poder continuar.

---

#### 66. Observabilidad

Cada RPC adoptada registra evidencia correlacionable suficiente para distinguir:

```text
package
candidate
RPC exacta
context_id
context_fingerprint
actor/principal reference
resource reference
decision reference cuando exista
outcome
timestamp
correlation_id
```

La telemetría no expone el `AccessContext` completo ni datos sensibles innecesarios.

---

#### 67. Evidencia por RPC

El bundle mínimo por identidad contiene:

1. firma before/after;
2. grants before/after;
3. security mode;
4. search_path;
5. app_code contract;
6. context source;
7. parámetros de autoridad legacy;
8. clasificación de esos parámetros;
9. consumer set;
10. tests positivos;
11. tests negativos;
12. manipulación directa;
13. resultado sin UI;
14. rollback;
15. digest de evidencia.

---

#### 68. Suite previa

Antes de materializar una RPC deben existir assertions para:

- ausencia de contexto;
- caller no autenticado cuando aplique;
- app incorrecta;
- actor incorrecto;
- input de empleado falsificado;
- input territorial falsificado;
- rol falsificado;
- llamada directa;
- contexto estructuralmente inválido;
- compatibilidad legacy;
- rollback.

Una suite no ejecutada no produce `PASS`.

---

#### 69. Prueba de contexto falsificado

Los tests intentan suministrar:

```text
otro employee_id
otro user_id
otro actor_id
otro site_id
otro area_id
otro role
context_id ajeno
context_fingerprint ajeno
payload de contexto fabricado
```

El resultado esperado es que esos valores no sustituyan la autoridad resuelta en servidor.

Un parámetro que sea recurso válido conserva su significado de recurso, no de actor.

---

#### 70. Prueba de app_code

Casos mínimos:

```text
app exacta autorizada
app desconocida
app inactiva
case alterado
espacios periféricos
alias
null cuando el contrato exige app
app de otro producto
```

La RPC no corrige silenciosamente el input para producir una autorización diferente.

---

#### 71. Prueba de frescura

Cuando la fundación de frescura sea aplicable, se prueban al menos:

- sesión revocada;
- cambio de actor;
- cambio laboral;
- cambio de turno;
- check-out;
- cambio de rol;
- cambio de dispositivo;
- cambio de autorización de app.

Un contexto viejo no puede conservar autorización indefinida.

---

#### 72. Prueba de dispositivo compartido

El package demuestra que:

```text
principal del dispositivo
+
actor efectivo
+
límites del dispositivo
```

no transfieren privilegios administrativos del principal al trabajador ni del trabajador siguiente al anterior.

006 verifica adopción de contexto; reglas específicas siguen en sus contratos propietarios.

---

#### 73. Prueba de principal técnico

Para RPC de sistema:

- el principal técnico debe ser identificable;
- la operación permitida debe ser explícita;
- no se usa un empleado ficticio;
- `service_role` no es la única prueba;
- una delegación, cuando exista, debe ser verificable.

---

#### 74. Prueba de consumidor directo

Al menos una prueba por audiencia llama el contrato sin la ruta normal de UI.

Debe demostrar que manipular parámetros o saltarse la interfaz no concede autoridad adicional.

---

#### 75. Rollback

La instancia conserva rollback por RPC y package.

Modos posibles se heredan de `AUTH-DB-020` y del plan de rollback del paquete.

El rollback debe poder:

- retirar la versión candidata;
- restaurar contrato previo cuando sea seguro;
- conservar datos y efectos válidos;
- reconciliar operaciones ejecutadas;
- no reabrir una fuente legacy como autoridad si ya cruzó su punto de no retorno.

---

#### 76. Drift

Antes de aplicar, el package recaptura:

```text
firma
cuerpo
security mode
owner
search_path
EXECUTE grants
dependencias
consumidores
context helpers
migration version
```

Resultado:

```text
MATCH
APPROVED_DRIFT
BLOCKING_DRIFT
```

`BLOCKING_DRIFT` detiene la identidad afectada.

---

#### 77. Baseline remoto de descubrimiento

El corte remoto de desarrollo observa en `public` y `api`:

```text
funciones totales = 247
SECURITY DEFINER = 165
ejecutables por authenticated = 174
ejecutables por anon = 73
```

Estos valores son baseline de exposición y descubrimiento.

No significan:

```text
174 RPC sensibles
73 RPC públicas aprobadas
165 RPC que deben conservar SECURITY DEFINER
```

La clasificación se realiza por firma y contrato dentro de cada package.

Ejemplos actuales que justifican revisión por paquete incluyen funciones con inputs de empleado, actor, sede, área, dispositivo, pedido, inventario, pago, asistencia y operación administrativa. La lista exacta futura se deriva del candidate y del alcance 020, no de una expresión heurística congelada aquí.

---

#### 78. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

```text
Requisitos creados: 0
Requisitos modificados: 0
Requisitos diferidos: 0
Requisitos obsoletos: 0
```

La cobertura canónica vigente ya exige autorización server-side de RPC manipuladas, coherencia contextual entre capas, frescura, trazabilidad y paridad con RLS.

---

#### 79. Cobertura de prueba vigente reutilizada

Esta sección es trazabilidad y no modifica el registro 04A.

Cobertura existente reutilizada:

- `TREQ-AUTH-013` exige que ninguna RPC manipulada eluda autorización y asigna responsabilidad directa a `AUTH-DB-006` a `AUTH-DB-010`;
- `TREQ-AUTH-008` protege coherencia entre contexto administrativo/operativo y las distintas capas;
- `TREQ-AUTH-009` protege resolución territorial determinista;
- `TREQ-AUTH-014` protege invalidez de contexto y decisiones obsoletas;
- `TREQ-AUTH-015` protege evidencia correlacionable de decisiones y acciones.

006 no cambia texto, owner, estado ni relaciones de esas filas.

---

#### 80. Criterios de aceptación

`AUTH-DB-006` queda documentalmente aceptable cuando:

1. se confirma `TEMPLATE_PER_PACKAGE`;
2. se confirma `POST_E5_PACKAGE`;
3. cada RPC se identifica por firma exacta;
4. el universo se deriva del package y no de un conteo heurístico;
5. existe una clase cerrada por RPC;
6. `AccessContext@1.0.0` proviene del resolver privado canónico;
7. la proyección segura no se usa como autoridad;
8. el caller no puede suministrar actor o contexto autoritativo;
9. app_code tiene contrato server-side;
10. el contexto se resuelve una vez por invocación;
11. una falla ocurre antes de efectos;
12. `service_role` no equivale a autoridad empresarial;
13. funciones privilegiadas conservan hardening;
14. helpers legacy no se convierten en canonical;
15. no se crean nuevas dependencias sobre evaluadores booleanos legacy;
16. compatibilidad temporal no crea segunda autoridad;
17. 007, 008, 009, 010, 021 y 026 conservan sus responsabilidades;
18. existe evidencia y rollback por RPC;
19. se reutiliza cobertura 04A sin cambiarla;
20. no se ejecuta ningún cambio físico.

---

#### 81. Evidencia de validación

| Clase     | Estado       | Evidencia                                                                                                                                                                                                                                              |
| --------- | ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| BUILD     | NOT_EXECUTED | La batería del checkout se ejecutará después del reemplazo documental.                                                                                                                                                                                 |
| LOCAL     | PASS         | El artefacto fue validado estructuralmente: título único, metadata obligatoria, numeración continua, secciones requeridas, evidencia completa, cero placeholders y continuidad terminal.                                                               |
| REMOTA    | PASS         | Se verificaron `main`, continuidad, topología R2, contratos R1, 04A aplicable y estado read-only de `vento-os-dev`; se observó la superficie legacy y se confirmó que las primitivas R1 canónicas aún no están materializadas en el remoto consultado. |
| OPERATIVA | NOT_EXECUTED | No se invocaron RPC de negocio, cohortes, cutover, shadow traffic ni operación real.                                                                                                                                                                   |
| FÍSICA    | NOT_EXECUTED | No se creó ni aplicó migración, función, wrapper, grant, policy, DDL, DML ni cambio de configuración.                                                                                                                                                  |

`REMOTA = PASS` valida únicamente el desarrollo documental y el baseline read-only. No certifica ninguna futura instancia física.

---

#### 82. Límites

Esta tarea no:

- materializa `AUTH-DB-006::package_id`;
- crea migraciones;
- modifica RPC;
- cambia firmas;
- cambia cuerpos SQL;
- crea `get_access_context`;
- crea `evaluate_authorization`;
- cambia RLS;
- cambia grants;
- revoca `EXECUTE`;
- crea schemas;
- modifica Auth;
- cambia sesiones;
- implementa validación de sede;
- implementa validación de área;
- implementa permiso exacto;
- implementa principal/actor efectivo;
- publica tipos;
- retira helpers legacy;
- actualiza 04A;
- autoriza E5;
- abre `SHELL-CI-020`;
- ejecuta cambios en Supabase.

Todo cambio físico pertenece a la instancia futura y a sus tareas propietarias.

---

#### 83. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-DB-020 — Migrar objetos por dominio con compatibilidad temporal`

**TAREA ACTUAL APROBADA**
`AUTH-DB-006 — Incorporar contexto canónico en RPC sensibles`

**SIGUIENTE TAREA RESERVADA**
`AUTH-DB-007 — Validar sede dentro de RPC sensibles`


### ✅ AUTH-DB-007 — Validar sede dentro de RPC sensibles

**Estado:** APROBADA
**Tarea anterior:** AUTH-DB-006 — Incorporar contexto canónico en RPC sensibles
**Tarea siguiente:** AUTH-DB-008 — Validar área dentro de RPC sensibles
**Tipo de tarea:** Documental; contrato y plantilla R2 repetible por `package_id` para resolución y validación canónica de sede dentro de RPC sensibles
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/03_R2_MIGRACION_PROGRESIVA_POR_DOMINIO.md`
**Estado físico resultante:** Contrato `RPC-SITE-VALIDATION-007@1.0.0` cerrado como `TEMPLATE_PER_PACKAGE`; cada futura instancia `AUTH-DB-007::package_id` permanece no ejecutada hasta satisfacer R0/R1 aplicables, el paquete E5 correspondiente, `SHELL-CI-020::package_id` y autorización física explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`AUTH-DB-007` define cómo toda RPC sensible incluida en un paquete aprobado debe resolver y validar la sede empresarial relevante para la operación antes de producir efectos o entregar hechos territoriales al evaluador de autorización.

La tarea recibe el handoff de `AUTH-DB-006`:

```text
AccessContext canónico resuelto
+
recurso objetivo identificado
+
site inputs clasificados
```

y lo transforma en un resultado territorial de sede determinista, verificable y no controlado por el caller.

---

#### 2. Decisión central

La regla vinculante es:

```text
RPC SENSIBLE
→ RESOLVER RECURSO O BORRADOR
→ RESOLVER SU SEDE REAL O DECLARADA
→ VALIDAR EXISTENCIA, RELACIONES Y COHERENCIA
→ PRESERVAR CADA LADO TERRITORIAL REQUERIDO
→ ENTREGAR HECHOS DE SEDE AL PIPELINE CANÓNICO
→ NO CONCEDER ALLOW POR SÍ SOLA
```

Un `site_id` enviado por cliente puede expresar intención, localizar un recurso o declarar la sede objetivo de una creación, pero nunca constituye por sí mismo autoridad territorial.

---

#### 3. Contrato material producido

Se define:

```text
RPC-SITE-VALIDATION-007@1.0.0
```

El contrato gobierna la resolución, clasificación y validación de la dimensión sede dentro de cada RPC sensible del package.

No reemplaza:

- `AccessContext@1.0.0`;
- el contrato de recurso del permiso;
- `AuthorizationDecision@1.0.0`;
- la validación de área de `AUTH-DB-008`;
- la evaluación de permiso exacto de `AUTH-DB-009`.

---

#### 4. Topología vinculante

La topología vigente es:

```text
mode = TEMPLATE_PER_PACKAGE
execution_gate = POST_E5_PACKAGE
instance = AUTH-DB-007::package_id
```

Consecuencias:

1. el marcador documental se desarrolla una sola vez;
2. no existe `AUTH-DB-007::GLOBAL`;
3. cada package aplicable registra una instancia propia;
4. cada instancia contiene únicamente RPC y recursos incluidos en ese package;
5. la ejecución de una instancia no certifica otra;
6. la aprobación documental no autoriza ejecución física.

---

#### 5. Gate temporal

La futura instancia solo puede materializar cambios cuando, para el mismo `package_id`, se hayan satisfecho los gates aplicables del ciclo R2:

```text
R0 aplicable = VERIFIED
R1 aplicable = VERIFIED
E5-GATE-008::package_id = PASS
SHELL-CI-020::package_id = OPENED
physical_authorization = EXPLICIT
```

Si una precondición no está satisfecha, el package permanece cerrado para materialización.

---

#### 6. Handoff recibido de AUTH-DB-006

006 entrega exactamente:

```text
AccessContext canónico resuelto
recurso objetivo identificado
site inputs clasificados
```

007 no vuelve a resolver el actor desde parámetros legacy.

007 tampoco convierte la clasificación realizada por 006 en una decisión territorial automática.

---

#### 7. Handoff hacia AUTH-DB-008

007 entrega a 008:

```text
site_resolution_status
+
resolved_site_set
+
resource_site_relationships
+
resource area references cuando existan
+
site/area coherence preconditions
```

008 conserva la responsabilidad exclusiva de validar área dentro de la RPC.

---

#### 8. Handoff hacia AUTH-DB-009

007 entrega a 009 hechos, no autorización:

```text
AccessContext canónico
+
ResolvedResourceContext
+
resolved_site_set
+
site resolution state
+
resource side roles
+
site classifications
```

009 adopta el permiso exacto y el evaluador canónico para decidir si el alcance concedido cubre esos hechos.

---

#### 9. Separación entre resolución y autorización

La tarea distingue:

```text
RESOLVER SEDE
≠
AUTORIZAR SEDE
```

007 responde:

```text
¿qué sede o sedes pertenecen realmente al recurso?
¿son coherentes y resolubles?
¿qué papel tiene cada una?
```

No responde de forma final:

```text
¿el permiso exacto del actor cubre esa sede?
```

La segunda pregunta pertenece al pipeline de autorización exacta.

---

#### 10. Fuente canónica del territorio

La sede de una operación se obtiene desde el contrato de recurso y sus relaciones canónicas.

Regla:

```text
RECURSO O BORRADOR
→ TERRITORY RESOLVER
→ SEDE REAL
```

No:

```text
p_site_id
→ AUTORIDAD TERRITORIAL
```

---

#### 11. Contrato de recurso obligatorio

Toda RPC sensible territorial debe enlazar un `resource_contract_id` vigente que defina, según aplique:

```text
resource_type
resource_locator
territory_resolver
required_sides
state_predicate
concurrency_policy
field_policy
audit_policy
```

007 no inventa una ruta de sede cuando el contrato no la declara.

---

#### 12. Resolver canónico de recurso

La fundación R1 aprobada reserva la resolución canónica de recurso dentro del pipeline de autorización.

007 debe ser compatible con esa resolución y no crear un segundo resolver territorial independiente con semántica distinta.

La instancia por package podrá adaptar RPC legacy, pero el resultado deberá ser semánticamente equivalente al contrato canónico de recurso.

---

#### 13. Estados canónicos de resolución

Se preserva exactamente el vocabulario:

```text
RESOLVED
MULTI_RESOLVED
NOT_APPLICABLE
UNRESOLVED
CONFLICT
ISOLATED
```

007 no crea estados alternos para sede que contradigan esta taxonomía.

---

#### 14. RESOLVED

`RESOLVED` significa:

```text
recurso o borrador exacto
+
una sede territorial aplicable
+
relaciones coherentes
+
identidad de sede comprobable
```

Este estado permite continuar el pipeline.

No significa `ALLOW`.

---

#### 15. MULTI_RESOLVED

`MULTI_RESOLVED` significa que se resolvieron todos los lados territoriales de sede exigidos por el contrato.

Ejemplos:

```text
origin_site
destination_site
seller_site
buyer_site
requesting_site
fulfillment_site
```

Los lados no se colapsan a una sola sede.

---

#### 16. NOT_APPLICABLE

`NOT_APPLICABLE` solo es válido cuando el contrato de recurso declara legítimamente que la operación no posee dimensión de sede variable.

Casos posibles:

```text
NT
ORG
recurso organizacional sin sede
```

En ese caso 007 no inventa una sede para satisfacer una validación territorial inexistente.

---

#### 17. UNRESOLVED

`UNRESOLVED` significa que falta una dimensión de sede necesaria.

No puede repararse mediante:

- sede seleccionada;
- sede primaria;
- `employees.site_id`;
- última sede usada;
- primera sede asignada;
- sede del dispositivo;
- `p_site_id` libre;
- valor por defecto de la aplicación.

La operación falla cerrada para la dimensión que exige sede.

---

#### 18. CONFLICT

`CONFLICT` se produce cuando dos fuentes que deberían representar el mismo hecho territorial se contradicen.

Ejemplos:

```text
order.site_id != persisted_fulfillment.site_id
area.site_id != resolved_resource.site_id
request_site != persisted_resource_site cuando deben coincidir
origin relation contradictoria
duplicate authoritative relationship
```

El conflicto no se resuelve escogiendo una fuente arbitrariamente.

---

#### 19. ISOLATED

`ISOLATED` se conserva cuando el recurso o su sede pertenecen a un aislamiento no incluido en la autoridad ordinaria aplicable.

Un alcance organizacional ordinario no convierte un recurso aislado en accesible.

---

#### 20. Sede solicitada por cliente

Un valor como:

```text
p_site_id
site_id
selected_site_id
target_site_id
```

se trata según su rol contractual.

Puede ser:

- localizador;
- intención de creación;
- filtro;
- lado explícito de un recurso multilado;
- dato de compatibilidad.

Nunca es evidencia suficiente de autoridad.

---

#### 21. Roles cerrados para inputs de sede

Cada site input de una RPC incluida se clasifica exactamente como uno de:

```text
RESOURCE_LOCATOR_SITE
RESOURCE_DRAFT_SITE
FILTER_ONLY
MULTI_SIDE_ORIGIN
MULTI_SIDE_DESTINATION
RELATED_RESOURCE_SITE
HISTORICAL_SNAPSHOT_SITE
COMPATIBILITY_ONLY
UNTRUSTED_AUTHORITY_SITE
NOT_APPLICABLE
```

Una firma puede contener varios inputs con roles distintos.

---

#### 22. RESOURCE_LOCATOR_SITE

`RESOURCE_LOCATOR_SITE` participa en localizar un recurso, pero no reemplaza la lectura de su estado territorial persistido.

Ejemplo:

```text
order_id + site_id
→ localizar candidate
→ leer order
→ obtener persisted site
→ comparar
```

Si el contrato exige coincidencia y no coincide, el resultado es conflicto o denegación estructural, nunca reubicación silenciosa.

---

#### 23. RESOURCE_DRAFT_SITE

`RESOURCE_DRAFT_SITE` representa la sede propuesta de un recurso que todavía no existe.

La sede de creación debe:

1. tener forma válida;
2. existir en la fuente autoritativa aplicable;
3. pertenecer al dominio/organización esperados;
4. cumplir estado y clasificación exigidos;
5. ser coherente con relaciones padre;
6. quedar incorporada al borrador normalizado;
7. ser evaluada después contra el permiso exacto.

---

#### 24. FILTER_ONLY

Un filtro de sede:

```text
site_id
site_ids
selected_site
```

puede reducir un conjunto previamente autorizable.

Regla:

```text
FILTRO
→ REDUCE
```

Nunca:

```text
FILTRO
→ AMPLÍA
```

Una lista no se recupera globalmente para filtrar únicamente en el cliente.

---

#### 25. MULTI_SIDE_ORIGIN

Cuando una sede es origen obligatorio:

```text
origin_site_id
```

007 conserva ese lado con identidad independiente.

No se sustituye por la sede del actor ni por la sede destino.

---

#### 26. MULTI_SIDE_DESTINATION

Cuando una sede es destino obligatorio:

```text
destination_site_id
```

007 conserva ese lado con identidad independiente.

Una autoridad sobre el origen no implica autoridad sobre destino.

---

#### 27. RELATED_RESOURCE_SITE

Cuando la sede se deriva mediante una relación:

```text
document → employee → active territory
location → zone → site
fulfillment → order → site
```

la relación debe existir y ser coherente.

Una cadena rota produce `UNRESOLVED`; una cadena contradictoria produce `CONFLICT`.

---

#### 28. HISTORICAL_SNAPSHOT_SITE

Un recurso histórico puede requerir la sede vigente al momento del hecho y no la sede actual.

La implementación futura deberá usar el snapshot territorial aprobado por el contrato.

Regla:

```text
HISTORIA
→ TERRITORIO HISTÓRICO AUTORITATIVO
```

No se reescribe el pasado usando la sede actual del actor, del empleado o del recurso.

---

#### 29. COMPATIBILITY_ONLY

Un argumento legacy puede conservarse temporalmente para no romper consumidores.

Si está clasificado `COMPATIBILITY_ONLY`:

- no concede autoridad;
- puede compararse contra el hecho resuelto;
- puede participar en compatibilidad observable;
- tiene owner y sunset;
- no se usa como fallback.

---

#### 30. UNTRUSTED_AUTHORITY_SITE

Un parámetro que históricamente se utilizaba como autoridad debe marcarse explícitamente:

```text
UNTRUSTED_AUTHORITY_SITE
```

La migración debe dejar de usarlo para decidir territorio.

Conservarlo en la firma no autoriza conservar su semántica insegura.

---

#### 31. NOT_APPLICABLE como input

`NOT_APPLICABLE` para un input de sede significa que ese argumento no participa en la dimensión territorial de autorización.

No convierte una RPC territorial en no territorial.

La clasificación se hace por argumento y por contrato de recurso.

---

#### 32. Recursos existentes

Para un recurso existente:

```text
stable resource locator
→ current persisted resource
→ canonical relationships
→ current or contract-approved historical territory
```

La sede real del recurso gobierna la resolución.

Un site recibido se compara cuando el contrato lo requiere, pero no sobrescribe la sede persistida.

---

#### 33. Creaciones

Para una creación:

```text
validated intent
→ normalized ResourceDraft
→ target site resolution
→ relationship validation
→ evaluator
→ insert
```

La sede objetivo debe quedar resuelta antes de persistir.

No existe fase válida:

```text
insertar primero
→ descubrir después si la sede era autorizable
```

---

#### 34. Actualizaciones sin cambio territorial

Cuando una actualización no pretende cambiar sede:

1. se resuelve la sede actual desde el recurso;
2. cualquier site selector requerido debe coincidir;
3. la sede se mantiene como hecho de recurso;
4. no se acepta un campo de sede no permitido dentro del payload final;
5. el evaluador recibe la sede real.

---

#### 35. Actualizaciones con cambio territorial

Si una operación puede mover un recurso entre sedes:

```text
current_site
+
proposed_site
```

ambas deben resolverse.

El resultado territorial es multilado.

La futura evaluación debe autorizar todos los lados obligatorios según el contrato de recurso.

007 no colapsa la operación al `proposed_site`.

---

#### 36. Eliminaciones

Una eliminación utiliza el territorio del recurso existente antes de borrarlo.

La autorización no puede evaluarse después de perder la relación territorial que la sustentaba.

La evidencia conserva la sede resuelta.

---

#### 37. Transiciones de estado

Cambiar estado no elimina el requisito territorial.

La RPC debe resolver el recurso, su sede y el estado vigente dentro de una frontera coherente antes de la transición.

Las reglas concretas de estado siguen siendo propiedad del contrato de recurso y sus tareas dueñas.

---

#### 38. Colecciones

Para colecciones:

```text
scope autorizado
→ query server-side
→ filtro solicitado
→ paginación/orden
```

007 asegura que la dimensión sede de la colección sea computable por miembro o por consulta equivalente.

No se autoriza una colección por el `site_id` de la pantalla.

---

#### 39. Agregados

Un agregado territorial solo puede incorporar miembros cuya sede sea resoluble dentro del conjunto que después será autorizado.

La etiqueta de un agregado no sustituye los territorios de sus miembros.

No puede inferir o revelar datos de sedes excluidas mediante totales o conteos.

---

#### 40. Operaciones masivas

Una operación masiva no convierte múltiples recursos en una única sede por conveniencia.

Cada miembro conserva:

```text
resource_id
resolved_site_set
resolution_state
```

o una consulta demostrablemente equivalente.

La política de atomicidad pertenece al contrato del comando.

---

#### 41. Recursos no territoriales

Si el contrato declara `NT` u `ORG`:

- 007 acepta `NOT_APPLICABLE` para sede;
- no usa sede del actor;
- no exige `employee_sites`;
- no convierte ausencia de sede en denegación por sí sola;
- tampoco convierte ausencia de sede en globalidad.

El evaluador conserva las demás restricciones.

---

#### 42. Sede activa

Para recursos corrientes que exigen sede ordinaria activa, la sede resuelta debe cumplir la política de vigencia definida por el contrato.

007 no establece una regla universal de:

```text
site.is_active = true
```

para todo objeto histórico.

Los recursos históricos usan la semántica temporal aprobada de su contrato.

---

#### 43. Fuente física de sedes

La futura instancia debe consumir la fuente autoritativa vigente en el candidate del package.

El estado AS-IS observado contiene:

```text
public.sites
```

pero R2 puede mover esa autoridad al owner schema aprobado.

Por tanto, 007 no congela `public.sites` como ubicación física eterna.

---

#### 44. Identidad de sede

La identidad territorial se basa en el identificador canónico de sede resuelto desde la fuente vigente.

Un nombre humano no constituye identidad.

Un código puede participar como identificador contractual cuando su contrato lo declare, pero no se compara por texto libre.

---

#### 45. Tipo de sede

`site_type` es una clasificación territorial, no una sede concreta.

Regla:

```text
SITE TYPE
≠
SITE ID
```

Una capacidad por tipo de sede todavía debe resolver la sede real del recurso.

---

#### 46. Campos físicos legacy de tipo

El estado actual puede contener más de una representación física histórica de clasificación de sede.

Una instancia no escogerá entre campos legacy por parecido de nombre.

El mapping físico debe proceder del contrato de transición y del candidate aplicable.

---

#### 47. Sedes asignadas

El contexto canónico representa `assigned_sites` como lista explícita.

En el estado AS-IS, la relación laboral relevante se observa mediante la fuente equivalente a:

```text
employee_sites
```

La ubicación física futura puede cambiar por R2 sin cambiar la semántica.

---

#### 48. employees.site_id

`employees.site_id` se considera referencia legacy de sede primaria en el modelo actual.

No es la fuente canónica definitiva de cobertura multisede.

No se usa como fallback cuando la relación autoritativa de sedes asignadas está vacía o es inválida.

---

#### 49. Sede primaria

Una sede primaria:

```text
is_primary = true
```

es referencia laboral.

No concede:

- permiso;
- cobertura global;
- autoridad sobre el recurso;
- fallback territorial;
- sustitución del `territory_resolver`.

---

#### 50. Sede seleccionada

La sede seleccionada es preferencia de navegación o filtro.

No participa como autoridad.

Puede reducir la experiencia visible cuando esté dentro del conjunto permitido, pero no crea una nueva sede autorizable.

---

#### 51. Lista vacía de assigned_sites

```text
assigned_sites = []
```

no significa:

- todas las sedes;
- la sede primaria;
- la sede seleccionada;
- sede global;
- sede del recurso;
- sede del dispositivo.

La interpretación permanece literalmente vacía.

---

#### 52. Cobertura administrativa

`administrative_coverage` es un hecho contextual que puede contribuir al carril base.

No es una decisión de permiso.

007 no convierte:

```text
administrative_coverage.site_ids
```

en `ALLOW`.

La cobertura se entrega al evaluador junto con el permiso exacto y el recurso.

---

#### 53. Alcance global

Un permiso con alcance global organizacional puede cubrir múltiples sedes ordinarias.

Sin embargo:

```text
GLOBAL
≠
WILDCARD DE RECURSO
```

007 todavía resuelve la sede real del recurso cuando el recurso es territorial.

---

#### 54. Alcance AS

El alcance conceptual `AS` representa sedes activamente asignadas.

La colección de sedes asignadas proviene del contexto/fuente laboral canónica, no de `employees.site_id`.

007 entrega la sede real del recurso; 009 determina si el permiso exacto con alcance AS la cubre.

---

#### 55. Alcance SS

`SS` representa una sede específica.

007 no decide el grant SS.

Su obligación es entregar una sede real exacta para que el evaluador pueda comparar identidad con identidad.

---

#### 56. Alcances AST y TST

Para permisos por tipo de sede:

- 007 resuelve la sede exacta;
- resuelve su clasificación canónica cuando el contrato la necesita;
- no transforma el tipo en lista de sedes por inferencia;
- no trata TST como modalidad predeterminada.

La evaluación del grant sigue en 009.

---

#### 57. Alcance CTX

`CTX` utiliza territorio operativo efectivo.

007 entrega la sede del recurso.

El `AccessContext` entrega la sede operativa efectiva.

El evaluador decide la compatibilidad entre ambos hechos.

007 no sustituye la sede del recurso por la sede operativa.

---

#### 58. OWN

La relación `OWN` no elimina la sede.

Un recurso propio puede seguir estando sujeto a territorio.

007 resuelve la sede aunque el sujeto sea el actor.

---

#### 59. Carril base

En el carril base:

- la cobertura administrativa puede participar;
- no se exige turno por el solo hecho de validar sede;
- una sede asignada no concede permiso;
- una sede primaria no concede permiso;
- el permiso exacto conserva su modalidad y alcance.

---

#### 60. Carril operativo

En el carril operativo:

```text
operational_site
```

proviene del contexto canónico aprobado.

La sede del recurso se resuelve de forma independiente.

El evaluador posterior intersecta las condiciones del carril operativo y el recurso.

---

#### 61. BASE_OR_OPERATIONAL

En `BASE_OR_OPERATIONAL`, cada carril conserva su propia resolución y alcance.

007 no fusiona:

```text
administrative site coverage
+
operational site
```

en un único wildcard territorial.

---

#### 62. BASE_AND_OPERATIONAL

En `BASE_AND_OPERATIONAL`, los hechos territoriales de ambos carriles deben permanecer disponibles para la intersección posterior.

007 no declara éxito final porque uno de los carriles coincida.

---

#### 63. Dispositivo compartido

El territorio de un dispositivo puede restringir.

No puede:

- crear la sede del recurso;
- ampliar las sedes del actor;
- sustituir el turno;
- sustituir `assigned_sites`;
- autorizar una sede distinta.

La compatibilidad final permanece en el evaluador y las tareas propietarias de dispositivo.

---

#### 64. Principal técnico

Una credencial técnica o proceso de sistema no convierte el territorio en irrelevante.

Cuando el recurso es territorial, su sede continúa resolviéndose.

La autoridad del proceso técnico pertenece a su contrato propietario.

---

#### 65. service_role

`service_role` es una capacidad técnica de infraestructura.

No significa:

```text
all_sites
global_business_authority
skip_resource_territory
```

Una RPC ejecutada mediante una credencial privilegiada debe conservar las mismas reglas contractuales de territorio aplicables a su operación.

---

#### 66. SECURITY DEFINER

`SECURITY DEFINER` no concede autoridad territorial.

007 no exige añadirlo.

Cuando una RPC ya usa o necesita legítimamente ese modo:

- conserva autorización empresarial explícita;
- endurece `search_path` según la fundación aprobada;
- minimiza `EXECUTE`;
- no usa el owner técnico como actor empresarial.

---

#### 67. Grants y RLS

007 no modifica grants ni policies.

Sí registra si la RPC puede ser ejecutada por:

```text
PUBLIC
anon
authenticated
service
```

porque esa superficie afecta el riesgo y las pruebas.

La política final de RLS y grants permanece en `AUTH-DB-021`.

---

#### 68. Null no es global

Un `site_id = null` no significa por sí mismo:

```text
all_sites
global
organization
assigned_sites
```

La interpretación procede únicamente del contrato de permiso/recurso que corresponda.

Los `null` históricos no reciben nueva semántica local.

---

#### 69. Site + null legacy

Cuando una configuración legacy de alcance `site + null` conserva semántica aprobada de sedes asignadas, esa interpretación pertenece al contrato canónico de alcance y no a una regla genérica de SQL.

007 no transforma cualquier argumento de sede nulo en `assigned_sites`.

---

#### 70. Operaciones cross-site

Una operación que afecta más de una sede conserva todos los lados requeridos.

Ejemplo:

```text
inventory transfer
→ origin
→ destination
```

Participar en un lado no autoriza el otro.

La futura decisión exacta deberá comprobar todos los lados requeridos.

---

#### 71. Remisiones y logística

Los recursos de remisión pueden cambiar qué lado es relevante según estado y acción.

007 consume `required_sides` del contrato.

No fija por sí sola que origen o destino sea siempre suficiente.

---

#### 72. Pagos y pedidos

Una RPC que recibe:

```text
order_id
+
site_id
```

debe resolver el pedido y su sede persistida o contractual.

El parámetro de sede no puede desplazar un pedido a otro territorio ni actuar como prueba de pertenencia.

---

#### 73. Inventario

Stock, ubicación, conteo, ajuste o traslado deben resolver sus relaciones territoriales desde las fuentes del dominio.

Un `p_site_id` de una RPC de inventario puede participar como locator o draft intent, pero no sustituye la relación real entre stock, ubicación y sede.

---

#### 74. Asistencia

Un evento de asistencia puede contener sede observada, geofence o sede de turno.

Cada dimensión conserva su significado.

007 no declara equivalentes:

```text
requested site
geofence site
shift site
employee primary site
```

El contrato aplicable determina cuál es el territorio del recurso o evento.

---

#### 75. Administración de perfiles

Operaciones sobre perfiles operativos o configuraciones de sede deben distinguir:

```text
target employee
target site
actor territory
resource owner
```

El `target_site` es el objeto solicitado; no prueba que el actor pueda administrarlo.

---

#### 76. Simulación

Una sede simulada no se transforma en sede real del actor.

Las RPC empresariales reales no usan un contexto simulado para producir autoridad real.

Las herramientas de simulación conservan contratos separados y sin mutaciones prohibidas.

---

#### 77. Frescura

Cuando la sede efectiva depende de asignaciones, turno, check-in, actor o dispositivo, la instancia usa la fundación de frescura aprobada.

Una sede resuelta desde un contexto obsoleto no puede conservarse indefinidamente como autoridad.

007 no inventa TTL local.

---

#### 78. Frontera transaccional

Para una mutación:

```text
resolve resource
→ resolve site
→ evaluate
→ validate state/concurrency
→ write
```

debe ocurrir dentro de una frontera que impida usar un territorio que cambió entre evaluación y escritura.

Cuando no pueda mantenerse la misma frontera, se revalida antes del efecto.

---

#### 79. TOCTOU territorial

La instancia debe probar cambios concurrentes de sede o relación territorial.

No es válido:

```text
authorize site A
→ resource moves to site B
→ write using old decision
```

El control puede ser versión, lock, snapshot o mecanismo equivalente definido por el contrato de recurso.

---

#### 80. Error seguro

007 no crea mensajes de negocio libres como fuente contractual.

Los resultados territoriales internos usan estados y reason codes canónicos.

La proyección cliente usa únicamente códigos seguros aprobados por la capa de error correspondiente.

---

#### 81. Auditoría

La evidencia territorial conserva como mínimo, cuando aplique:

```text
package_id
candidate_id
rpc identity
resource reference
resource_contract_id
site_resolution_status
resolved_site_set
side roles
source references
context_id
decision reference posterior
correlation_id
timestamp
```

No necesita exponer el `AccessContext` completo.

---

#### 82. Registro por RPC

Cada futura instancia mantiene una fila por firma exacta con, como mínimo:

```text
rpc_site_validation_id
package_id
candidate_id
transition_key
migration_unit_id
schema_name
function_name
identity_arguments
resource_contract_id
site_inputs
site_input_roles
site_resolution_mode
resource_site_source
historical_territory_mode
site_state_requirement
multi_side_roles
legacy_site_fallbacks
context_site_inputs
handoff_008
handoff_009
handoff_010
rls_handoff_021
types_handoff_026
compatibility_reference
consumer_reference
rollback_reference
adoption_state
evidence_reference
owner
```

La fila se identifica por package y firma exacta.

---

#### 83. Modos de resolución de sede

Cada RPC usa uno o más modos contractuales explícitos:

```text
FROM_EXISTING_RESOURCE
FROM_NORMALIZED_DRAFT
FROM_RELATED_RESOURCE
FROM_HISTORICAL_SNAPSHOT
FROM_COLLECTION_MEMBERS
FROM_AGGREGATE_MEMBERS
MULTI_SIDE
NOT_APPLICABLE
```

No existe `FROM_CALLER_AUTHORITY`.

---

#### 84. Resultado lógico de validación

El resultado interno equivalente conserva:

```text
resolution_state
resource_contract_id
sites[]
```

Cada elemento de `sites[]` conserva, cuando aplique:

```text
side_role
site_id
site_code
site_type
source_path
state_observed
historical_snapshot
```

Este shape es interno y no se declara como nuevo contrato público.

---

#### 85. Cardinalidad por package

Para cada package:

```text
RPC sensibles esperadas para 007 = N
RPC clasificadas = N
RPC sin tratamiento = 0
site inputs sin rol = 0
resource contracts faltantes = 0
resoluciones ambiguas aceptadas = 0
fallbacks permisivos aceptados = 0
```

`N` procede del alcance aprobado y del preflight de drift.

---

#### 86. Universo no fijado por heurística

El estado remoto observado contiene actualmente funciones con argumentos de sede, pero esa observación no define el universo canónico de 007.

Una RPC sin `p_site_id` puede seguir siendo territorial por sus relaciones.

Una RPC con `p_site_id` puede ser pública, técnica, no territorial para autorización o estar fuera del package.

---

#### 87. Baseline remoto observado

En el corte read-only de desarrollo se observó:

```text
public/api functions = 247
firmas con p_site_id uuid = 42
de esas, EXECUTE authenticated = 41
de esas, EXECUTE anon = 16
de esas, SECURITY DEFINER = 39
```

También existen funciones que:

```text
referencian selected_site
referencian employees.site_id o equivalentes
usan current_employee_site_id
usan get_operational_context
```

Estos conteos son señales de auditoría AS-IS y deberán recapturarse por candidate.

---

#### 88. Ejemplos de firmas AS-IS a clasificar cuando entren en un package

Ejemplos observados:

```text
apply_inventory_site_count(...)
assign_inventory_stock_to_location(...)
create_inventory_count_session_with_lines(...)
create_order_delivery_courier_link(...)
process_order_payment(...)
register_shift_departure_event(...)
start_attendance_break(...)
update_order_operational_state(...)
upsert_employee_site_operational_profile(...)
viso_accounting_dashboard(...)
```

La presencia en esta lista no las incluye automáticamente en una instancia futura.

El package y sus `transition_keys` gobiernan inclusión.

---

#### 89. RPC legacy de contexto

`get_operational_context(...)` acepta una sede suministrada por caller y contiene fallbacks incompatibles con el modelo canónico final.

007 no reutiliza esa semántica como resolver de sede.

La compatibilidad temporal puede conservar firmas, nunca autoridad legacy.

---

#### 90. Helper legacy de permisos

Los helpers booleanos legacy que reciben `site_id` no demuestran que la sede haya sido resuelta desde el recurso.

007 no considera suficiente:

```text
has_permission(permission, caller_site)
```

como prueba territorial de una RPC.

---

#### 91. Funciones anon actuales

Que una firma con `p_site_id` tenga `EXECUTE` por `anon` es una observación de superficie, no una declaración de publicidad legítima.

La audiencia y los grants finales se reconcilian en su package y en `AUTH-DB-021`.

007 debe probar que un caller anónimo no puede convertir site input en autoridad cuando la RPC es protegida.

---

#### 92. Funciones privileged actuales

Que una RPC sea `SECURITY DEFINER` aumenta la necesidad de demostrar resolución territorial correcta.

No autoriza:

```text
trust p_site_id
skip resource lookup
skip actor context
skip evaluator
```

---

#### 93. Drift previo a materialización

Antes de ejecutar una identidad se recaptura:

```text
schema
function name
identity arguments
body
owner
security mode
search_path
EXECUTE grants
resource relationships
site sources
consumer set
migration version
```

Resultado:

```text
MATCH
APPROVED_DRIFT
BLOCKING_DRIFT
```

Un cambio material no aprobado bloquea esa identidad.

---

#### 94. Pruebas de sede requerida

Por cada RPC territorial aplicable se prueban, como mínimo:

- sede existente correcta;
- sede inexistente;
- sede inactiva cuando la política exige actividad;
- sede aislada;
- site input nulo;
- site input de otra sede;
- recurso con sede distinta al input;
- recurso sin sede resoluble;
- relación territorial duplicada;
- relación territorial contradictoria.

---

#### 95. Pruebas de creación

Para un `ResourceDraft`:

- target site válida;
- target site inexistente;
- target site inactiva cuando aplica;
- parent de otra sede;
- area que pertenece a otra sede;
- caller intenta alterar sede después de validación;
- draft sin dimensión obligatoria;
- idempotent retry con misma sede;
- retry con sede distinta.

La validación específica del área se completa en 008.

---

#### 96. Pruebas cross-site

Cuando el contrato sea multilado:

- origen permitido y destino no permitido;
- origen no permitido y destino permitido;
- ambos iguales cuando el dominio lo prohíbe;
- relación origen/destino inexistente;
- uno de los lados aislado;
- lado faltante;
- lado cambia concurrentemente;
- ambos lados resueltos.

007 prueba la resolución; 009 prueba la autorización exacta.

---

#### 97. Pruebas de contexto

Casos:

- assigned_sites vacía;
- una sede asignada;
- múltiples sedes asignadas;
- sede primaria distinta al recurso;
- selected site distinta al recurso;
- operational site distinta al recurso;
- contexto estructuralmente inválido;
- contexto stale cuando la fundación lo detecta;
- dispositivo con sede distinta;
- principal técnico.

Ningún caso permite que el contexto reemplace la sede del recurso.

---

#### 98. Pruebas de filtros y colecciones

Se prueba:

- sin filtro de sede;
- filtro dentro del conjunto;
- filtro fuera del conjunto;
- lista multisede;
- paginación;
- búsqueda;
- orden;
- agregado;
- intento de inferir una sede excluida.

El filtro solo puede reducir.

---

#### 99. Pruebas históricas

Se prueba al menos:

- recurso histórico de sede aún activa;
- recurso histórico de sede hoy inactiva;
- recurso trasladado después del hecho;
- actor trasladado después del hecho;
- snapshot ausente cuando es obligatorio;
- snapshot contradictorio.

No se reescribe el territorio histórico con datos actuales.

---

#### 100. Pruebas de llamada directa

La suite invoca la RPC sin UI y manipula:

```text
p_site_id
site_id
selected_site
target_site
origin_site
destination_site
```

El resultado debe ser igual o más restrictivo que el camino normal.

---

#### 101. Pruebas de credencial privilegiada

Cuando aplique se prueba:

- authenticated;
- anon;
- service process;
- ejecución privilegiada controlada.

Una credencial con mayor privilegio SQL no cambia la sede empresarial del recurso.

---

#### 102. Pruebas de rollback

El rollback por RPC debe restaurar el candidate previo sin:

- perder evidencia territorial válida;
- crear autoridad nueva desde un fallback legacy;
- reabrir consumers incompatibles sin control;
- dejar firmas parcialmente migradas.

El mecanismo exacto se hereda del plan del package.

---

#### 103. Rendimiento

Resolver territorio no justifica consultas repetidas sin límite.

La implementación futura deberá:

- evitar N+1 cuando una colección pueda resolverse server-side;
- conservar equivalencia semántica;
- usar índices gobernados por su tarea propietaria;
- medir rutas críticas;
- no sustituir precisión por una caché autoritativa incorrecta.

---

#### 104. Concurrencia

Las pruebas incluyen cambios de relaciones territoriales durante una operación.

Una decisión basada en una sede que dejó de ser válida antes del efecto debe fallar o revalidarse conforme al contrato de concurrencia.

---

#### 105. Paridad entre capas

Para el mismo:

```text
principal
actor
context
resource
resource state
site facts
permission
```

RPC, evaluador, Server Action y RLS no pueden producir una ampliación territorial contradictoria.

007 gobierna el hecho de sede dentro de RPC; las demás capas conservan sus tareas propietarias.

---

#### 106. Semántica de denegación

007 puede producir una condición territorial que impida continuar, por ejemplo:

```text
UNRESOLVED
CONFLICT
ISOLATED
```

No crea una excepción para “intentar” con otra sede.

La decisión final y sus reasons pertenecen al evaluador canónico.

---

#### 107. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

```text
Requisitos creados: 0
Requisitos modificados: 0
Requisitos diferidos: 0
Requisitos obsoletos: 0
```

La cobertura vigente ya exige resolución territorial determinista, bloqueo de cruces no autorizados y resistencia a manipulación directa de RPC.

---

#### 108. Cobertura de prueba vigente reutilizada

Esta sección es trazabilidad y no modifica el registro 04A.

La cobertura existente reutilizada incluye:

- `TREQ-AUTH-007`, para limitar administración de seguridad al territorio autorizado;
- `TREQ-AUTH-008`, para coherencia entre carril administrativo, operativo, RPC y RLS;
- `TREQ-AUTH-009`, para resolución determinista de sede y área y denegación de cruces territoriales;
- `TREQ-AUTH-013`, para impedir bypass mediante RPC o request manipulado.

007 no cambia texto, owner, estado ni relaciones de estas filas.

---

#### 109. Evidencia de validación

| Clase     | Estado       | Evidencia                                                                                                                                                                                                                   |
| --------- | ------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED | La batería del checkout se ejecutará después del reemplazo documental.                                                                                                                                                      |
| LOCAL     | PASS         | El artefacto fue validado estructuralmente: una tarea, metadata obligatoria, secciones requeridas, evidencia completa, cero placeholders, cero TREQ dentro de la sección de cero cambios y continuidad terminal.            |
| REMOTA    | PASS         | Se verificaron `main`, continuidad, topología R2, 006 aprobado, contratos de contexto/alcance/recurso, 04A AUTH y el estado read-only de `vento-os-dev`, incluyendo firmas actuales con argumentos de sede y fuentes AS-IS. |
| OPERATIVA | NOT_EXECUTED | No se invocaron RPC empresariales ni se ejecutaron escenarios de negocio.                                                                                                                                                   |
| FÍSICA    | NOT_EXECUTED | No se creó ni aplicó migración, función, grant, policy, DDL, DML ni cambio de configuración.                                                                                                                                |

`REMOTA = PASS` valida el desarrollo documental y el baseline observado; no certifica una futura instancia física.

---

#### 110. Criterios de aceptación

`AUTH-DB-007` queda documentalmente aceptable cuando:

1. conserva `TEMPLATE_PER_PACKAGE`;
2. conserva `POST_E5_PACKAGE`;
3. consume exactamente el handoff de 006;
4. identifica cada RPC por firma exacta;
5. clasifica cada site input;
6. deriva la sede de recursos existentes desde el recurso;
7. normaliza y valida la sede de creaciones antes del efecto;
8. conserva todos los lados de recursos multisede;
9. usa estados de resolución canónicos;
10. no convierte `p_site_id` en autoridad;
11. no usa sede seleccionada como fallback;
12. no usa sede primaria como fallback;
13. no usa `employees.site_id` como cobertura canónica;
14. distingue site ID de site type;
15. preserva territorio histórico cuando el contrato lo exige;
16. no inventa sede para NT/ORG;
17. no convierte null en global;
18. no confunde cobertura administrativa con ALLOW;
19. no confunde operational site con resource site;
20. el dispositivo solo puede restringir;
21. `service_role` no otorga autoridad territorial;
22. mantiene frontera transaccional/revalidación;
23. registra evidencia y rollback por RPC;
24. entrega hechos a 008 y 009 sin absorberlas;
25. no modifica RLS/grants/tipos;
26. reutiliza TREQ existentes sin cambiar 04A;
27. no ejecuta cambios físicos.

---

#### 111. Límites

Esta tarea no:

- materializa `AUTH-DB-007::package_id`;
- crea migraciones;
- modifica RPC;
- cambia tablas o datos;
- crea resolvers;
- modifica `get_access_context`;
- modifica `evaluate_authorization`;
- valida área de forma completa;
- decide el permiso exacto;
- decide principal o actor efectivo;
- modifica grants;
- modifica RLS;
- modifica Storage;
- modifica Realtime;
- cambia Edge Functions;
- publica tipos;
- retira funciones legacy;
- modifica 04A;
- autoriza E5;
- abre `SHELL-CI-020`;
- autoriza implementación física.

Las responsabilidades reservadas continúan en sus tareas propietarias.

---

#### 112. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-DB-006 — Incorporar contexto canónico en RPC sensibles`

**TAREA ACTUAL APROBADA**
`AUTH-DB-007 — Validar sede dentro de RPC sensibles`

**SIGUIENTE TAREA RESERVADA**
`AUTH-DB-008 — Validar área dentro de RPC sensibles`


### [ ] AUTH-DB-008 — Validar área dentro de RPC sensibles
### [ ] AUTH-DB-009 — Validar permiso exacto dentro de RPC sensibles
### [ ] AUTH-DB-010 — Validar principal y actor efectivo dentro de RPC sensibles
### [ ] AUTH-DB-021 — Implementar políticas RLS y grants canónicos por esquema
### [ ] AUTH-DB-011 — Aplicar constraints después de backfills y reconciliación
### [ ] AUTH-DB-022 — Implementar gobierno y políticas de Storage
### [ ] AUTH-DB-023 — Implementar canales y contratos Realtime aprobados
### [ ] AUTH-DB-024 — Versionar Edge Functions, webhooks, cron y automatizaciones
### [ ] AUTH-DB-025 — Implementar índices, retención y controles de crecimiento
### [ ] AUTH-DB-026 — Generar y publicar tipos después de cada paquete aprobado

### `AUTH-DB-020::VISO-SCHEDULE-MONTHLY-001`

1. Parte de `VISO-SCH-004`.
2. Crea migración posterior si la provisional ya se aplicó.
3. No edita migraciones aplicadas.
4. Prueba semana/mes.
5. Define concurrencia.
6. Permite reducir horas de forma autorizada.
7. Expone errores estructurados.
8. Baseline antes/después.
9. Rollback.
10. Tipos actualizados.
