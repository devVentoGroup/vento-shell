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


### ✅ AUTH-DB-008 — Validar área dentro de RPC sensibles

**Estado:** APROBADA
**Tarea anterior:** AUTH-DB-007 — Validar sede dentro de RPC sensibles
**Tarea siguiente:** AUTH-DB-009 — Validar permiso exacto dentro de RPC sensibles
**Tipo de tarea:** Documental; contrato y plantilla R2 repetible por `package_id` para resolución y validación canónica de área dentro de RPC sensibles
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/03_R2_MIGRACION_PROGRESIVA_POR_DOMINIO.md`
**Estado físico resultante:** Contrato `RPC-AREA-VALIDATION-008@1.0.0` cerrado como `TEMPLATE_PER_PACKAGE`; cada futura instancia `AUTH-DB-008::package_id` permanece no ejecutada hasta satisfacer R0/R1 aplicables, el paquete E5 correspondiente, `SHELL-CI-020::package_id` y autorización física explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`AUTH-DB-008` define cómo toda RPC sensible incluida en un paquete aprobado debe resolver y validar la dimensión de área del recurso, borrador, colección, agregado o relación empresarial después de que la sede aplicable haya quedado resuelta coherentemente por el contrato de `AUTH-DB-007`.

La tarea impide que un `area_id`, un nombre de área, un `area_kind`, una selección visual o un dato legacy enviado por el caller se convierta por sí mismo en autoridad territorial.

---

#### 2. Decisión central

La regla vinculante es:

```text
RPC SENSIBLE
→ CONSUMIR SEDE RESUELTA POR 007
→ RESOLVER RECURSO O BORRADOR
→ RESOLVER ÁREA REAL, DECLARADA O LEGÍTIMAMENTE AUSENTE
→ VALIDAR PERTENENCIA ÁREA-SEDE
→ VALIDAR COHERENCIA Y ESTADO TERRITORIAL
→ PRESERVAR TODOS LOS LADOS REQUERIDOS
→ ENTREGAR HECHOS DE ÁREA AL PIPELINE CANÓNICO
→ NO DECLARAR ALLOW POR SÍ SOLA
```

---

#### 3. Contrato material producido

Se define:

```text
RPC-AREA-VALIDATION-008@1.0.0
```

Este contrato gobierna la resolución, clasificación, coherencia sede-área y semántica de ausencia de área dentro de las RPC sensibles de cada package.

No reemplaza:

- `AccessContext@1.0.0`;
- el contrato de recurso;
- `AuthorizationDecision@1.0.0`;
- la validación de sede de `AUTH-DB-007`;
- la evaluación del permiso exacto de `AUTH-DB-009`;
- la validación del principal y actor efectivo de `AUTH-DB-010`.

---

#### 4. Topología vinculante

La topología vigente es:

```text
mode = TEMPLATE_PER_PACKAGE
execution_gate = POST_E5_PACKAGE
instance = AUTH-DB-008::package_id
```

Consecuencias:

1. el marcador documental se desarrolla una sola vez;
2. no existe `AUTH-DB-008::GLOBAL`;
3. cada package aplicable registra una instancia propia;
4. cada instancia opera únicamente sobre sus RPC y `transition_keys`;
5. la evidencia de un package no certifica otro;
6. la aprobación documental no autoriza materialización física.

---

#### 5. Gate temporal

La futura instancia solo podrá materializarse cuando, para el mismo `package_id`, se hayan satisfecho los gates aplicables:

```text
R0 aplicable = VERIFIED
R1 aplicable = VERIFIED
DELIV-PKG aplicable = CLOSED
E5-GATE-008::package_id = PASS
SHELL-CI-020::package_id = OPENED
physical_authorization = EXPLICIT
```

La falta de una precondición mantiene la instancia cerrada.

---

#### 6. Handoff recibido de AUTH-DB-007

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

008 no vuelve a escoger una sede diferente para hacer coincidir un área.

---

#### 7. Handoff hacia AUTH-DB-009

008 entrega a 009, sin conceder autorización:

```text
AccessContext canónico
+
ResolvedResourceContext
+
site_resolution_status
+
resolved_site_set
+
area_resolution_status
+
resolved_area_set
+
site_area_relationships
+
area_requirement
+
area_resolution_mode
+
area classification cuando aplique
+
resource side roles
```

009 conserva la responsabilidad de evaluar el permiso exacto, sus grants, denies, modalidad y alcance contra estos hechos.

---

#### 8. Handoff hacia AUTH-DB-010

008 no altera:

```text
principal
actor_effective
employee
domain_identity
```

Los conserva en el snapshot para que `AUTH-DB-010` valide principal y actor efectivo sin reinterpretar territorio.

---

#### 9. Separación entre resolución y autorización

La tarea distingue:

```text
RESOLVER ÁREA
≠
AUTORIZAR ÁREA
```

008 responde:

```text
¿qué área o áreas pertenecen realmente al recurso?
¿pertenecen a la sede correcta?
¿es obligatorio tener área?
¿la ausencia de área es legítima?
¿qué clasificación territorial tiene el área?
```

No responde de forma final:

```text
¿el permiso exacto cubre esa área?
```

---

#### 10. Sede como precondición

Toda área concreta debe estar contenida en una sede coherente ya resuelta.

Regla:

```text
area_id
→ area.site_id
→ una sede aplicable de resolved_site_set
```

Si la sede propietaria del área contradice el hecho de sede aplicable, la operación falla cerrada.

---

#### 11. No corrección silenciosa de sede

Ante:

```text
resolved_site = SITE_A
resolved_area.site_id = SITE_B
```

008 no puede:

- cambiar la sede a `SITE_B`;
- ignorar el área;
- buscar un área equivalente en `SITE_A`;
- usar el mismo nombre de área;
- reinterpretar el request.

El resultado es conflicto territorial.

---

#### 12. Fuente canónica del área

El área de una operación se obtiene desde el contrato de recurso y sus relaciones canónicas.

Regla:

```text
RECURSO O BORRADOR
→ TERRITORY RESOLVER
→ ÁREA REAL O AUSENCIA CONTRACTUAL
```

No:

```text
p_area_id
→ AUTORIDAD TERRITORIAL
```

---

#### 13. Contrato de recurso obligatorio

Toda RPC sensible que opere sobre recurso con dimensión de área debe enlazar un `resource_contract_id` vigente que permita conocer, según aplique:

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

008 no inventa una ruta de área cuando el contrato no la declara.

---

#### 14. Estados canónicos de resolución

Se preserva el vocabulario de resolución del recurso:

```text
RESOLVED
MULTI_RESOLVED
NOT_APPLICABLE
UNRESOLVED
CONFLICT
ISOLATED
```

La dimensión de área utiliza estos estados sin crear una taxonomía pública divergente.

---

#### 15. RESOLVED

`RESOLVED` para la dimensión de área significa:

```text
recurso o borrador exacto
+
área concreta aplicable o ausencia site-level explícitamente válida
+
sede propietaria coherente
+
relaciones resolubles
```

Permite continuar el pipeline.

No significa `ALLOW`.

---

#### 16. MULTI_RESOLVED

`MULTI_RESOLVED` conserva todos los lados o miembros de área exigidos por el contrato.

Ejemplos:

```text
origin_area
destination_area
source_area
target_area
requesting_area
fulfillment_area
```

Los lados no se colapsan por compartir sede o `area_kind`.

---

#### 17. NOT_APPLICABLE

`NOT_APPLICABLE` solo es válido cuando el contrato declara legítimamente que el recurso no tiene dimensión de área aplicable.

Puede ocurrir en:

```text
recurso organizacional
recurso estrictamente site-level
contrato NT u ORG
operación cuya granularidad aprobada termina en sede
```

La ausencia de área no crea acceso a todas las áreas.

---

#### 18. UNRESOLVED

`UNRESOLVED` significa que una dimensión de área obligatoria no pudo resolverse.

No puede repararse mediante:

- área seleccionada;
- área primaria;
- `employees.area_id`;
- primera área de la sede;
- única área encontrada;
- `employee_areas`;
- área del dispositivo;
- último turno distinto al vigente;
- `p_area_id` libre;
- nombre humano.

---

#### 19. CONFLICT

`CONFLICT` se produce cuando fuentes que deben representar el mismo hecho territorial son incompatibles.

Ejemplos:

```text
resource.area_id != persisted_related_area_id
area.site_id != resolved_resource_site_id
draft.area_id pertenece a otra sede
current_area != proposed_area cuando el comando no permite traslado
duplicate authoritative area relationships
```

No se escoge silenciosamente una fuente ganadora.

---

#### 20. ISOLATED

`ISOLATED` se conserva cuando el recurso, área o su relación territorial pertenece a un aislamiento no incluido por la autoridad ordinaria.

Compartir `area_kind` con un área autorizable no elimina el aislamiento.

---

#### 21. Área solicitada por cliente

Valores como:

```text
p_area_id
area_id
selected_area_id
target_area_id
origin_area_id
destination_area_id
```

pueden expresar intención, localización, filtro, borrador o compatibilidad.

Nunca son por sí solos evidencia de autorización.

---

#### 22. Roles cerrados para inputs de área

Cada input territorial de área incluido en una RPC se clasifica exactamente en uno de:

```text
RESOURCE_LOCATOR_AREA
RESOURCE_DRAFT_AREA
FILTER_ONLY
MULTI_SIDE_ORIGIN_AREA
MULTI_SIDE_DESTINATION_AREA
RELATED_RESOURCE_AREA
HISTORICAL_SNAPSHOT_AREA
COMPATIBILITY_ONLY
UNTRUSTED_AUTHORITY_AREA
NOT_APPLICABLE
```

Una firma puede contener varios inputs con roles diferentes.

---

#### 23. RESOURCE_LOCATOR_AREA

Un área recibida como locator participa en localizar o desambiguar un recurso.

Debe compararse contra la relación territorial persistida cuando el contrato exige coincidencia.

No reemplaza la lectura canónica del recurso.

---

#### 24. RESOURCE_DRAFT_AREA

Representa el área propuesta para una creación.

Antes del efecto debe comprobarse:

1. forma válida;
2. existencia;
3. sede propietaria;
4. compatibilidad con la sede ya resuelta;
5. estado aplicable;
6. relaciones padre;
7. clasificación cuando sea relevante;
8. obligatoriedad contractual;
9. incorporación al `ResourceDraft` normalizado.

---

#### 25. FILTER_ONLY

Un filtro por área reduce un conjunto ya gobernado.

Regla:

```text
FILTRO DE ÁREA
→ REDUCE
```

Nunca:

```text
FILTRO DE ÁREA
→ AMPLÍA
```

El servidor no recupera una colección territorial amplia para depender únicamente del filtrado cliente.

---

#### 26. MULTI_SIDE_ORIGIN_AREA

Cuando un área origen es obligatoria, conserva identidad independiente.

La autoridad sobre otra área del mismo site no la sustituye.

---

#### 27. MULTI_SIDE_DESTINATION_AREA

Cuando un área destino es obligatoria, conserva identidad independiente.

Compartir `area_kind` o sede con el origen no autoriza el destino por implicación.

---

#### 28. RELATED_RESOURCE_AREA

Cuando el área se deriva desde una relación:

```text
stock → location → zone → area
shift → area
production batch → workstation → area
document → target employee → territorial relation
```

la cadena debe existir y ser coherente.

Una cadena rota produce `UNRESOLVED`; una contradictoria produce `CONFLICT`.

---

#### 29. HISTORICAL_SNAPSHOT_AREA

Los recursos históricos utilizan el snapshot territorial aprobado cuando el área actual reescribiría el pasado.

Regla:

```text
HISTORIA
→ ÁREA HISTÓRICA AUTORITATIVA
```

No se sustituye por el área actual del trabajador, sede o recurso.

---

#### 30. COMPATIBILITY_ONLY

Un argumento legacy puede conservarse temporalmente para mantener consumidores.

Si está clasificado `COMPATIBILITY_ONLY`:

- no concede autoridad;
- puede compararse con el área resuelta;
- puede mantenerse por compatibilidad observable;
- debe tener owner y sunset;
- nunca es fallback.

---

#### 31. UNTRUSTED_AUTHORITY_AREA

Un parámetro usado históricamente como autoridad se marca explícitamente:

```text
UNTRUSTED_AUTHORITY_AREA
```

La migración debe retirar su uso como fuente de autoridad aunque la firma permanezca temporalmente.

---

#### 32. NOT_APPLICABLE como input

`NOT_APPLICABLE` significa que ese argumento concreto no participa en la dimensión de autorización de área.

No transforma una RPC territorial en no territorial.

---

#### 33. Modos de resolución de área

Cada RPC usa uno o más modos explícitos:

```text
FROM_EXISTING_RESOURCE
FROM_NORMALIZED_DRAFT
FROM_RELATED_RESOURCE
FROM_HISTORICAL_SNAPSHOT
FROM_COLLECTION_MEMBERS
FROM_AGGREGATE_MEMBERS
MULTI_SIDE
SITE_LEVEL_NO_AREA
NOT_APPLICABLE
```

No existe:

```text
FROM_CALLER_AUTHORITY
```

---

#### 34. Resultado interno de área

El resultado interno equivalente conserva:

```text
resolution_state
resource_contract_id
area_requirement
area_resolution_mode
areas[]
```

Cada elemento de `areas[]` conserva, cuando aplique:

```text
side_role
area_id
site_id
area_kind
source_path
state_observed
historical_snapshot
```

Este shape es interno y no crea un contrato público nuevo.

---

#### 35. Área requerida

Cuando el contrato del permiso, recurso, rol operativo o proceso exige área concreta:

```text
area_required = true
+
área no resoluble
=
UNRESOLVED
```

No existe fallback permisivo.

---

#### 36. Área opcional

`area_required = false` no significa:

```text
cualquier área
```

Significa que la operación puede ser válida sin granularidad de área únicamente cuando su contrato lo permite.

Si una área concreta está presente, debe seguir siendo coherente con la sede.

---

#### 37. Null no es wildcard

La regla universal es:

```text
area_id = null
≠
ALL_AREAS
```

`null` no significa:

- todas las áreas;
- primera área;
- área principal;
- área seleccionada;
- área del dispositivo;
- área del turno anterior;
- área de cualquier `area_kind`.

---

#### 38. Null site-level

`area_id = null` puede ser legítimo cuando el recurso o configuración es explícitamente de nivel sede.

Resultado conceptual:

```text
site resuelto
+
area = null
+
contrato site-level válido
=
SITE_LEVEL_NO_AREA
```

Esto conserva una ausencia de área, no una lista implícita de áreas.

---

#### 39. Site-wide operativo

Una configuración operacional puede ser site-wide solo cuando el contrato vigente lo declara expresamente.

Ejemplo conceptual:

```text
site_operational_role
area_id = null
site-wide = permitido
```

No se deriva site-wide por omisión.

---

#### 40. Área nula con requisito de área

Cuando el contrato exige área:

```text
area_id = null
→ fallo cerrado
```

No se usa:

```text
employee_areas
employees.area_id
selected_area_id
device.area_id
primary area
```

para completarla.

---

#### 41. Recursos existentes

Para recurso existente:

```text
stable resource locator
→ current persisted resource
→ canonical relationships
→ site fact de 007
→ current or historical area fact
```

El área persistida o relacional gobierna la resolución.

---

#### 42. Creaciones

Para creación:

```text
validated intent
→ normalized ResourceDraft
→ resolved site
→ target area resolution
→ site-area coherence
→ evaluator
→ insert
```

No se persiste primero para descubrir después si el área era coherente.

---

#### 43. Actualización sin cambio de área

Cuando una actualización no permite mover el recurso:

1. se resuelve el área actual;
2. cualquier selector debe coincidir cuando aplique;
3. el payload no acepta un área no permitida;
4. el evaluador recibe el área real;
5. la mutación conserva territorio.

---

#### 44. Actualización con cambio de área

Si la operación admite traslado:

```text
current_area
+
proposed_area
```

ambas áreas se resuelven.

Si implican sedes diferentes, se conservan también los lados de sede entregados por 007.

008 no oculta un cambio cross-site dentro de un cambio de área.

---

#### 45. Eliminaciones

Una eliminación debe resolver sede y área aplicables antes de borrar el recurso.

La evidencia territorial persiste aunque el registro deje de existir.

---

#### 46. Transiciones de estado

Una transición conserva la dimensión territorial.

Debe resolverse:

```text
resource
site
area
current state
```

antes del efecto o revalidarse dentro de la frontera transaccional.

---

#### 47. Colecciones

Para colecciones:

```text
territorio autorizable
→ query server-side
→ filtro opcional
→ paginación
→ orden
```

Cada miembro debe ser territorialmente resoluble o la consulta debe demostrar equivalencia semántica.

---

#### 48. Agregados

Un agregado por área solo incorpora miembros cuya área sea resoluble y posteriormente autorizable.

No puede inferir datos de áreas excluidas mediante:

- totales;
- conteos;
- diferencias;
- comparaciones;
- errores diferenciados.

---

#### 49. Operaciones masivas

Una operación masiva conserva por miembro:

```text
resource_id
resolved_site_set
resolved_area_set
resolution_state
```

o una consulta demostrablemente equivalente.

No se fuerza una única área a todo el lote por conveniencia.

---

#### 50. Recursos site-level

Un recurso legítimamente site-level puede tener:

```text
site_id = valor
area_id = null
```

Esto significa que pertenece a la sede sin subdivisión de área contractual.

No significa todas las áreas de esa sede.

---

#### 51. Recursos no territoriales

Para `NT` u `ORG`:

- el área puede ser `NOT_APPLICABLE`;
- no se inventa área;
- no se exige `employee_areas`;
- no se interpreta ausencia como globalidad;
- las demás restricciones continúan.

---

#### 52. Identidad de área

La identidad de un área concreta es su identificador canónico resuelto.

No es:

- nombre;
- etiqueta;
- posición visual;
- índice;
- `area_kind`;
- alias no contractual.

---

#### 53. Código de área

Un código puede participar en localización cuando el contrato lo declare.

Debe resolverse contra fuente canónica y quedar vinculado a un `area_id`.

No se usa texto libre como equivalencia.

---

#### 54. area_kind

`area_kind` representa clasificación funcional.

Regla:

```text
AREA KIND
≠
AREA ID
```

Un permiso por tipo de área todavía debe resolver el área concreta y su sede.

---

#### 55. Nombre de área

`areas.name` no es clasificación canónica para autorización.

No se autoriza por semejanza textual:

```text
"Cocina"
"cocina"
"COCINA"
```

La normalización de tipos pertenece a su contrato propietario.

---

#### 56. Fuente física de áreas

La futura instancia consume la fuente autoritativa vigente en su candidate.

El estado AS-IS observado contiene:

```text
public.areas
```

pero R2 puede mover esta autoridad al owner schema aprobado.

008 no congela `public.areas` como ubicación física eterna.

---

#### 57. assigned_areas

El contexto canónico representa `assigned_areas` como relaciones laborales explícitas.

Su semántica es:

```text
empleado
→ asignación de área
→ área
→ sede propietaria
```

No representa permisos ni área operativa.

---

#### 58. employee_areas AS-IS

La fuente AS-IS equivalente es:

```text
public.employee_areas
```

pero su cobertura actual incompleta no puede ampliar autoridad.

Una ausencia de filas no produce fallback permisivo.

---

#### 59. employees.area_id

`employees.area_id` es legacy y no representa el conjunto canónico de áreas asignadas.

No se usa como fallback cuando `assigned_areas` está vacío o inválido.

---

#### 60. Área primaria

Una relación:

```text
is_primary = true
```

representa referencia habitual.

No concede:

- permiso;
- autoridad;
- cobertura global;
- área operativa;
- área del recurso;
- fallback.

---

#### 61. Área seleccionada

`selected_area_id` es preferencia administrativa o de navegación.

Puede reducir la experiencia cuando sea coherente.

No amplía territorio ni reemplaza el área real del recurso.

---

#### 62. Lista vacía de assigned_areas

```text
assigned_areas = []
```

significa literalmente que no existen asignaciones de área representables en el snapshot.

No significa:

- todas las áreas de la sede;
- área general;
- área del turno;
- área seleccionada;
- área primaria;
- cualquier área del mismo tipo.

---

#### 63. Cobertura administrativa

`administrative_coverage` puede contener cobertura por áreas para el carril base.

No es `ALLOW`.

008 entrega hechos territoriales; 009 aplica permiso y alcance exactos.

---

#### 64. Área operativa

`operational_area` procede del contexto canónico derivado del turno publicado y vigente cuando exista.

No se obtiene desde:

- área primaria;
- `employee_areas`;
- `employees.area_id`;
- selected area;
- dispositivo;
- caller.

---

#### 65. Turno sin área

Un turno con `area_id = null` puede ser válido solo cuando la configuración operacional permite contexto site-wide.

008 conserva esa ausencia.

No inventa área.

---

#### 66. Rol con área obligatoria

Cuando el rol operativo exige área y el contexto no la resuelve:

```text
operational area required
+
operational_area = null
=
condición bloqueante
```

La evaluación final pertenece a 009 y al contrato canónico.

---

#### 67. Dispositivo compartido

El área fija de un dispositivo puede restringir.

No puede:

- crear área del recurso;
- crear asignación laboral;
- cambiar la sede resuelta;
- sustituir el turno;
- ampliar `assigned_areas`.

---

#### 68. Área del dispositivo distinta

Si un dispositivo restringido a un área participa y el recurso pertenece a otra, el hecho de incompatibilidad se conserva para evaluación.

008 no mueve el recurso ni el dispositivo para obtener coincidencia.

---

#### 69. Principal técnico

Un proceso técnico no elimina la necesidad de resolver área cuando el recurso la requiere.

La autoridad del proceso pertenece a su contrato de principal y permiso.

---

#### 70. service_role

`service_role` es privilegio técnico de infraestructura.

No significa:

```text
all_areas
skip_area_resolution
global_business_authority
```

Una llamada privilegiada conserva las reglas empresariales de área.

---

#### 71. SECURITY DEFINER

`SECURITY DEFINER` no concede autoridad territorial.

008 no exige agregarlo.

Cuando ya existe o es legítimamente necesario:

- el helper privilegiado no confía en `p_area_id`;
- se mantiene `search_path` endurecido;
- se minimiza `EXECUTE`;
- el owner PostgreSQL no se interpreta como actor empresarial.

---

#### 72. Grants y RLS

008 no modifica grants ni policies.

Sí registra la audiencia ejecutable actual de cada RPC porque afecta riesgo y pruebas.

La reconciliación final de grants y RLS permanece en `AUTH-DB-021`.

---

#### 73. Alcance AA

`AA` representa áreas activamente asignadas al actor.

008 resuelve el área real del recurso.

009 determina si un grant exacto con alcance `AA` la cubre.

---

#### 74. Alcance SA

`SA` representa un área específica dentro de sede autorizada.

008 garantiza identidad exacta de área y sede propietaria.

No decide el grant.

---

#### 75. Alcance AAT

`AAT` representa áreas asignadas cuyo tipo coincide con una clasificación aprobada.

Requiere:

```text
área concreta
+
sede coherente
+
area_kind canónico
```

El tipo no sustituye la identidad del área.

---

#### 76. Alcance ATW

`ATW` representa áreas de un tipo exacto dentro de un alcance superior de sedes autorizado.

No existe sin límite superior de sede.

008 conserva el vínculo área-sede para que 009 pueda evaluar esa intersección.

---

#### 77. Alcance CTX

`CTX` usa el territorio operativo efectivo.

008 entrega:

```text
resource area
```

El `AccessContext` entrega:

```text
operational_area
```

009 decide compatibilidad.

008 no reemplaza el área del recurso por el área operativa.

---

#### 78. Alcance OWN

`OWN` no elimina territorio.

Un recurso propio puede seguir requiriendo área.

008 resuelve el área incluso cuando el sujeto sea el actor.

---

#### 79. Alcance global

Un permiso global puede alcanzar recursos en distintas áreas ordinarias.

Aun así, un recurso territorial debe conservar su área real cuando la tenga.

```text
GLOBAL
≠
AREA UNRESOLVED
```

---

#### 80. BASE_ONLY

En carril base:

- cobertura administrativa puede participar;
- no se exige turno por la mera existencia de área;
- asignación de área no concede permiso;
- ausencia de `employee_areas` no crea fallback.

---

#### 81. OPERATIONAL_ONLY

En carril operativo:

- el contexto aporta `operational_site` y `operational_area`;
- el recurso aporta su propio territorio;
- el permiso aporta alcance y prerrequisitos;
- 009 evalúa la intersección.

---

#### 82. BASE_OR_OPERATIONAL

Cada carril conserva su territorio.

008 no fusiona:

```text
administrative area coverage
+
operational_area
```

en una lista más amplia.

---

#### 83. BASE_AND_OPERATIONAL

Los hechos de ambos carriles permanecen disponibles para la intersección posterior.

008 no declara éxito final porque uno de ellos coincida.

---

#### 84. Cambios cross-area

Una operación que cambia de área debe conservar:

```text
current_area
proposed_area
```

Si ambas pertenecen a la misma sede, sigue siendo cross-area.

Si pertenecen a sedes distintas, también conserva el tratamiento cross-site de 007.

---

#### 85. Recursos multilado

Cada lado obligatorio puede tener área propia.

La matriz no asume:

```text
same site
→ same area
```

ni:

```text
same area_kind
→ same authority
```

---

#### 86. Remisiones y logística

El área relevante puede cambiar según recurso, lado y estado.

008 consume `required_sides` y el `territory_resolver`.

No fija una única área universal para todas las acciones de una remisión.

---

#### 87. Inventario

Stock, ubicaciones, zonas, conteos y traslados pueden derivar área indirectamente.

La relación territorial debe resolverse desde el dominio.

Un `p_area_id` aislado no sustituye stock → ubicación → zona/área → sede cuando esa sea la ruta contractual.

---

#### 88. Producción

Una receta, lote, estación o solicitud puede ser site-level o area-level según su contrato.

008 no asume que “Producción” sea un área concreta ni que un nombre funcional equivalga a `area_id`.

---

#### 89. Asistencia

En asistencia pueden coexistir:

```text
shift.area_id
geofence site
check-in
device area
requested area
```

Cada hecho conserva su significado.

El área operativa procede del turno/contexto vigente cuando corresponda.

---

#### 90. Administración de perfiles

Operaciones sobre perfiles operativos deben distinguir:

```text
target employee
target site
target area
actor coverage
resource territory
```

El target area solicitado no prueba que el actor pueda administrarlo.

---

#### 91. Simulación

Un área simulada no se convierte en área real del actor.

Las RPC empresariales reales no aceptan un contexto simulado como autoridad real.

La simulación conserva contratos separados.

---

#### 92. Frescura

Cuando hechos de área dependen de:

- asignación laboral;
- turno;
- actor;
- dispositivo;
- recurso;
- clasificación territorial;

la instancia reutiliza la fundación de frescura aprobada.

008 no inventa un TTL local.

---

#### 93. Frontera transaccional

Para una mutación:

```text
resolve resource
→ consume site
→ resolve area
→ evaluate
→ validate state/concurrency
→ write
```

debe ocurrir en una frontera que impida usar un territorio obsoleto.

Si no puede mantenerse, se revalida antes del efecto.

---

#### 94. TOCTOU de área

Se debe impedir:

```text
authorize AREA_A
→ relation moves to AREA_B
→ write using old facts
```

La estrategia concreta puede usar versión, lock, snapshot o mecanismo equivalente definido por el contrato del recurso.

---

#### 95. Error seguro

Los estados territoriales internos no se sustituyen por textos libres.

La proyección cliente utiliza únicamente reason/message codes seguros de la capa propietaria.

008 no crea una taxonomía pública de errores paralela.

---

#### 96. Auditoría

La evidencia territorial conserva, cuando aplique:

```text
package_id
candidate_id
rpc identity
resource reference
resource_contract_id
site_resolution_status
resolved_site_set
area_resolution_status
resolved_area_set
area_requirement
area_resolution_mode
side roles
source references
context_id
decision reference posterior
correlation_id
timestamp
```

---

#### 97. Registro por RPC

Cada futura instancia mantiene una fila por firma exacta con, como mínimo:

```text
rpc_area_validation_id
package_id
candidate_id
transition_key
migration_unit_id
schema_name
function_name
identity_arguments
resource_contract_id
site_resolution_reference
area_inputs
area_input_roles
area_resolution_mode
resource_area_source
area_requirement
area_kind_source
null_area_policy
historical_territory_mode
multi_side_roles
legacy_area_fallbacks
context_area_inputs
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

---

#### 98. Cardinalidad por package

Cada package debe demostrar:

```text
RPC sensibles esperadas para 008 = N
RPC clasificadas = N
RPC sin tratamiento = 0
area inputs sin rol = 0
resource contracts faltantes = 0
áreas contradictorias aceptadas = 0
fallbacks permisivos aceptados = 0
```

`N` procede del package y del candidate, no de heurísticas globales.

---

#### 99. Universo no fijado por argumentos

Una RPC sin `p_area_id` puede ser area-level porque su recurso deriva área indirectamente.

Una RPC con `p_area_id` puede ser:

- técnica;
- pública;
- site-level;
- simulación;
- fuera del package;
- legacy.

Por tanto, la firma no define por sí sola pertenencia a 008.

---

#### 100. Baseline remoto observado

El corte read-only de `vento-os-dev` utilizado para desarrollar este contrato observa:

```text
public/api functions = 247
firmas con p_area_id uuid = 10
firmas con algún argumento uuid de área = 11
SECURITY DEFINER con p_area_id = 10
funciones que referencian employee_areas = 2
funciones que referencian employees + area_id = 7
funciones que referencian selected_area = 3
funciones que referencian get_operational_context = 3
```

Estos conteos son señales AS-IS y deberán recapturarse por candidate.

---

#### 101. Baseline de datos territoriales observado

El mismo corte read-only observa:

```text
areas total = 22
areas activas = 22
employee_areas total = 1
employee_areas activas = 1
employees con area_id = 0
employee_settings con selected_area_id = 0
employee_shifts con area_id = 1087
site_operational_roles con area_id = 13
site_operational_roles site-wide = 3
shared_operational_devices con area_id = 2
shared_operational_devices site-wide = 0
```

Esta asimetría confirma que la transición no puede usar `employee_areas` incompleto como razón para ampliar autoridad ni inventar fallbacks.

---

#### 102. Firmas AS-IS con argumentos de área

Se observaron, entre otras:

```text
can_access_area(...)
can_access_recipe_scope(...)
current_actor_shift_for_shared_device_v1(...)
has_operational_permission(...)
has_operational_role_permission(...)
has_permission(...)
has_role_permission(...)
permission_scope_matches(...)
shared_device_actor_is_allowed_v1(...)
start_context_simulation_v1(...)
upsert_site_operational_role(...)
```

La lista es evidencia de auditoría, no inclusión automática en un package.

---

#### 103. Helpers legacy

Los helpers booleanos legacy que reciben `area_id` no demuestran que el área se haya derivado del recurso.

No se acepta como prueba suficiente:

```text
has_permission(permission, site, caller_area)
```

si el `caller_area` no ha sido resuelto canónicamente.

---

#### 104. PUBLIC EXECUTE y audiencia

La superficie AS-IS incluye funciones privilegiadas con acceso heredado amplio.

008 no normaliza esos grants.

Cada futura instancia debe registrar audiencia y riesgo, mientras `AUTH-DB-021` mantiene la propiedad del cierre de grants y RLS.

---

#### 105. Drift previo a materialización

Antes de ejecutar una identidad se recaptura:

```text
schema
function name
identity arguments
function body
owner
security mode
search_path
EXECUTE grants
resource relationships
area sources
area kind source
consumer set
migration version
```

Resultado:

```text
MATCH
APPROVED_DRIFT
BLOCKING_DRIFT
```

---

#### 106. Pruebas mínimas de área

Por cada RPC area-level aplicable se cubre al menos:

- área correcta;
- área inexistente;
- área inactiva cuando aplica;
- área de otra sede;
- área aislada;
- área nula permitida;
- área nula requerida;
- recurso con área distinta al input;
- recurso sin área resoluble;
- relación duplicada;
- relación contradictoria;
- `area_kind` incorrecto;
- nombre parecido sin identidad;
- selected area distinta;
- primary area distinta;
- device area distinta.

---

#### 107. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

```text
Requisitos creados: 0
Requisitos modificados: 0
Requisitos diferidos: 0
Requisitos obsoletos: 0
```

La cobertura canónica vigente ya exige coherencia territorial de sede y área, igualdad de decisión entre capas y resistencia a manipulación directa de superficies protegidas.

---

#### 108. Cobertura de prueba vigente reutilizada

Esta sección es únicamente trazabilidad y no modifica el registro 04A.

Se reutiliza cobertura existente sobre:

- `TREQ-AUTH-004`, para igualdad de decisión entre evaluadores;
- `TREQ-AUTH-007`, para limitar administración por sede y área;
- `TREQ-AUTH-008`, para coherencia entre carriles, RPC y RLS;
- `TREQ-AUTH-009`, para resolución determinista de sede y área y bloqueo de cruces;
- `TREQ-AUTH-013`, para impedir bypass mediante RPC o request manipulado.

No se modifica texto, owner, estado ni relación de esos requisitos.

---

#### 109. Evidencia de validación

| Clase     | Estado       | Evidencia                                                                                                                                                                                                                  |
| --------- | ------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED | La batería del checkout se ejecutará después del reemplazo documental.                                                                                                                                                     |
| LOCAL     | PASS         | El artefacto fue validado estructuralmente: una tarea, metadata obligatoria, secciones requeridas, cinco clases de evidencia, cero placeholders y continuidad terminal.                                                    |
| REMOTA    | PASS         | Se verificaron `main`, continuidad, topología R2, 007 aprobado, contratos de contexto, alcances y recurso, paridad de Server Actions, 04A AUTH, documentación vigente de Supabase y el estado read-only de `vento-os-dev`. |
| OPERATIVA | NOT_EXECUTED | No se invocaron RPC empresariales ni escenarios de negocio.                                                                                                                                                                |
| FÍSICA    | NOT_EXECUTED | No se creó ni aplicó migración, función, grant, policy, DDL, DML ni configuración.                                                                                                                                         |

`REMOTA = PASS` valida el desarrollo documental y el baseline observado; no certifica una futura instancia física.

---

#### 110. Criterios de aceptación

`AUTH-DB-008` queda documentalmente satisfecha cuando:

1. conserva `TEMPLATE_PER_PACKAGE`;
2. conserva `POST_E5_PACKAGE`;
3. consume el handoff exacto de 007;
4. identifica cada RPC por firma exacta;
5. clasifica cada area input;
6. resuelve el área desde recurso o borrador;
7. valida pertenencia área-sede;
8. conserva todos los lados multilado;
9. preserva estados canónicos de resolución;
10. no convierte `p_area_id` en autoridad;
11. no usa selected area como fallback;
12. no usa primary area como fallback;
13. no usa `employees.area_id` como asignación canónica;
14. no usa `employee_areas` incompleto para ampliar autoridad;
15. separa `area_id` de `area_kind`;
16. no usa nombres humanos como tipo;
17. distingue área requerida de opcional;
18. `null` nunca equivale a todas las áreas;
19. permite site-level solo cuando el contrato lo declara;
20. preserva territorio histórico;
21. mantiene `operational_area` ligada al contexto/turno;
22. el dispositivo solo puede restringir;
23. `service_role` no elimina validación empresarial;
24. mantiene frontera transaccional o revalidación;
25. registra evidencia y rollback por RPC;
26. entrega hechos a 009 sin absorber su evaluación;
27. no absorbe 010;
28. no modifica RLS o grants;
29. reutiliza requisitos vigentes sin modificar 04A;
30. no ejecuta cambios físicos.

---

#### 111. Límites

Esta tarea no:

- materializa `AUTH-DB-008::package_id`;
- crea migraciones;
- modifica RPC;
- modifica tablas o datos;
- crea resolvers nuevos;
- modifica `get_access_context`;
- modifica `evaluate_authorization`;
- redefine el contrato de sede de 007;
- decide el permiso exacto;
- decide principal o actor efectivo;
- crea asignaciones `employee_areas`;
- migra `employees.area_id`;
- normaliza físicamente `area_kind`;
- modifica grants;
- modifica RLS;
- modifica Storage;
- modifica Realtime;
- cambia Edge Functions;
- publica tipos;
- retira helpers legacy;
- modifica 04A;
- abre E5;
- abre `SHELL-CI-020`;
- autoriza implementación física.

---

#### 112. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-DB-007 — Validar sede dentro de RPC sensibles`

**TAREA ACTUAL APROBADA**
`AUTH-DB-008 — Validar área dentro de RPC sensibles`

**SIGUIENTE TAREA RESERVADA**
`AUTH-DB-009 — Validar permiso exacto dentro de RPC sensibles`


### ✅ AUTH-DB-009 — Validar permiso exacto dentro de RPC sensibles

**Estado:** APROBADA
**Tarea anterior:** AUTH-DB-008 — Validar área dentro de RPC sensibles
**Tarea siguiente:** AUTH-DB-010 — Validar principal y actor efectivo dentro de RPC sensibles
**Tipo de tarea:** Documental; contrato y plantilla R2 repetible por `package_id` para vinculación y evaluación de la capacidad canónica exacta dentro de RPC sensibles
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/03_R2_MIGRACION_PROGRESIVA_POR_DOMINIO.md`
**Estado físico resultante:** Contrato `RPC-PERMISSION-VALIDATION-009@1.0.0` cerrado como `TEMPLATE_PER_PACKAGE`; cada futura instancia `AUTH-DB-009::package_id` permanece no ejecutada hasta satisfacer R0/R1 aplicables, el paquete E5 correspondiente, `SHELL-CI-020::package_id` y autorización física explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`AUTH-DB-009` define cómo toda RPC sensible incluida en un paquete aprobado debe vincular cada efecto protegido con la `permission_key` canónica exacta y hacer que la decisión proceda del evaluador de autorización aprobado, usando el contexto y el territorio ya resueltos, sin convertir nombres de rol, acceso general a la aplicación, una pantalla visible, un argumento manipulable, un helper booleano legacy, `SECURITY DEFINER`, RLS bypass o privilegios SQL en autoridad empresarial.

La tarea cierra la frontera de permiso dentro de R2. No materializa ninguna RPC ni modifica el catálogo.

#### 2. Resultado canónico

Se define:

```text
RPC PERMISSION BINDING
+
PERMISSION CONTRACT SNAPSHOT
+
ACCESS CONTEXT
+
RESOLVED RESOURCE
+
SITE FACTS
+
AREA FACTS
=
INPUT CANÓNICO PARA evaluate_authorization
```

Y queda prohibido:

```text
ROLE NAME
OR APP ACCESS
OR CLIENT PERMISSION STRING
OR SQL PRIVILEGE
=
ALLOW
```

#### 3. Contrato material producido

La identidad contractual es:

```text
RPC-PERMISSION-VALIDATION-009@1.0.0
```

Este contrato gobierna por `package_id`:

- la identidad exacta del permiso requerido;
- su binding con la RPC y con cada operación protegida;
- la versión contractual usada;
- la resolución del `PermissionContractSnapshot`;
- la entrega al evaluador canónico;
- la prohibición de fallbacks o sustituciones;
- la transición desde helpers legacy;
- la evidencia, pruebas, adopción y rollback.

#### 4. Topología vinculante

La topología vigente es:

```text
mode = TEMPLATE_PER_PACKAGE
execution_gate = POST_E5_PACKAGE
instance = AUTH-DB-009::package_id
```

Consecuencias:

1. el marcador se desarrolla una sola vez;
2. no existe `AUTH-DB-009::GLOBAL`;
3. cada paquete conserva una instancia independiente;
4. cada instancia cubre exclusivamente las RPC incluidas en su candidate;
5. dos paquetes no comparten evidencia anónima;
6. una aprobación documental no autoriza materialización.

#### 5. Gate temporal

Una futura instancia requiere, para el mismo `package_id`:

```text
R0 aplicable = VERIFIED
R1 aplicable = VERIFIED
DELIV-PKG aplicable = CLOSED
E5-GATE-008::package_id = PASS
SHELL-CI-020::package_id = OPENED
physical_authorization = EXPLICIT
```

Si falta una condición, la instancia no ejecuta cambios físicos.

#### 6. Fuentes vinculantes

009 consume sin reinterpretación silenciosa:

- el modelo de permisos y precedencia aprobado;
- el catálogo canónico versionado de autorización;
- `AUTH-CAT-016`, para contrato de recurso;
- `AUTH-CAT-017`, para catálogo técnico versionado;
- `AUTH-CTX-025`, para `AccessContext`;
- `AUTH-CTX-026`, para `evaluate_authorization` y `AuthorizationRequestContext`;
- `AUTH-DB-034`, para el evaluador físico canónico y sus snapshots runtime;
- `AUTH-DB-007`, para sede;
- `AUTH-DB-008`, para área;
- `AUTH-SRV-005`, como contrato equivalente de permiso exacto en acciones de servidor;
- la release contractual aplicable al candidate;
- el expediente E5 del package.

#### 7. Handoff recibido de AUTH-DB-008

008 entrega a 009 hechos, no autorización:

```text
AccessContext canónico
ResolvedResourceContext
site_resolution_status
resolved_site_set
area_resolution_status
resolved_area_set
site_area_relationships
area_requirement
area_resolution_mode
area classification cuando aplique
resource side roles
```

009 no recalcula esos hechos con fallbacks locales para obtener una decisión favorable.

#### 8. Handoff hacia AUTH-DB-010

009 entrega a 010, sin absorber su responsabilidad:

```text
AccessContext canónico sin alterar
ResolvedResourceContext
site facts
area facts
required_permission_binding
permission_resolution_status
PermissionContractSnapshot
catalog_version
catalog_hash
permission_contract_hash
operation_kind
required lanes
prerequisite contract
scope contract
resource contract reference
AuthorizationEvaluationRequest preparado o referencia equivalente
```

010 conserva la responsabilidad de validar principal y actor efectivo dentro de la RPC antes de permitir el efecto.

#### 9. Regla de no autorización parcial

009 por sí sola no completa una autorización de RPC.

```text
006 + 007 + 008 + 009 + 010
→ conjunto de obligaciones de la frontera R2
```

Una RPC no puede ejecutar porque “el permiso dio true” si otra obligación del pipeline permanece inválida, no resuelta o técnicamente indisponible.

#### 10. Identidad canónica del permiso

La identidad protegida es:

```text
permission_key = app_code + "." + permission_code
```

La `permission_key` completa es estable dentro de una versión de catálogo y debe resolverse por igualdad exacta.

#### 11. app_code

`app_code` identifica la aplicación propietaria de la capacidad.

Debe:

- existir;
- estar activo en la release aplicable;
- coincidir exactamente;
- ser compatible con la `permission_key`;
- permanecer separado del nombre de repositorio, ruta o schema.

No existe aplicación predeterminada por comodidad del caller.

#### 12. permission_code

`permission_code` es relativo a la aplicación propietaria.

Ejemplo conceptual:

```text
app_code = nexo
permission_code = inventory.remissions.prepare
permission_key = nexo.inventory.remissions.prepare
```

La RPC no reconstruye otra semántica desde el texto del código.

#### 13. Igualdad exacta

La comparación vinculante es:

```text
requested/bound permission_key
===
published permission_key
```

No se admite equivalencia por:

- prefijo;
- sufijo;
- substring;
- case folding;
- coincidencia aproximada;
- normalización silenciosa;
- nombre humano;
- alias no publicado.

#### 14. Permiso activo

Una clave evaluable debe pertenecer a una definición activa de la release aplicable.

Una clave retirada, ausente, conflictiva o no publicada no se convierte en capacidad por existir todavía en SQL legacy o en un consumidor.

#### 15. Definición única

Para una combinación aplicable:

```text
catalog_version
+
permission_key
```

debe existir exactamente un `PermissionContractSnapshot` efectivo.

Cero definiciones bloquean. Más de una definición bloquea.

#### 16. Snapshot contractual mínimo

La resolución del permiso debe disponer, como mínimo, de las propiedades contractuales aprobadas que correspondan:

```text
permission_key
app_code
lifecycle_status
authorization_requirement
allowed_scopes
maximum_scope
lane prerequisites
operational area requirement
shared device mode
simulation mode
strong reauthentication requirement
resource_contract_id
resource_type
resolution_mode
required_sides
field_policy_id
audit_policy_id
contract_hash
catalog_version
catalog_hash
```

La ausencia de metadata requerida no se rellena desde defaults locales.

#### 17. Release runtime

La evaluación usa una release contractual explícita.

La release activa determina:

- universo de permisos evaluables;
- versión de catálogo;
- hashes;
- contratos de recurso;
- datasets y matrices compatibles.

No se mezcla metadata de dos releases en una misma decisión.

#### 18. Cardinalidad runtime

009 no congela un número eterno de permisos.

La cardinalidad esperada procede de la release activa aplicable al candidate.

```text
expected_permission_contracts
=
release manifest
```

No se usa un número histórico hardcodeado.

#### 19. Conteos históricos no son autoridad

Los conteos documentales o físicos observados en distintos cortes pueden divergir durante la transición.

Esa divergencia no se corrige haciendo que el evaluador acepte cualquier clave presente en alguna de las fuentes.

La regla es:

```text
release activa y validada
→ autoridad contractual runtime
```

#### 20. Catálogo técnico en vento-shell

El repositorio contiene una familia versionada bajo:

```text
packages/contracts/authorization
```

009 consume la identidad publicada de esa familia y no crea una copia local por RPC o aplicación.

#### 21. Proyección Supabase

`AUTH-DB-034` reserva una proyección runtime privada equivalente a:

```text
app_private.authorization_contract_releases
app_private.authorization_permission_contracts
```

Estas proyecciones sirven al evaluador; no son una segunda autoridad editable de negocio.

#### 22. Resolver canónico del permiso

La fundación R1 define conceptualmente:

```text
app_private.resolve_permission_contract_snapshot(text, text)
```

R2 no crea otro resolver semánticamente distinto por package.

La instancia de 009 adopta o consume esa fundación cuando esté materializada y verificada.

#### 23. Evaluador canónico

La frontera completa definida por R1 es:

```text
app_private.evaluate_authorization(jsonb) → jsonb
```

Una RPC sensible migrada no mantiene un segundo motor de decisión con reglas propias.

#### 24. AuthorizationRequestContext

La solicitud de evaluación conserva, entre otros hechos aprobados:

```text
app_code
permission_key
operation_kind
resource request
context reference
```

La presencia de `permission_key` en el request no significa que el cliente pueda elegir libremente qué permiso lo autoriza.

#### 25. Permission binding de la RPC

Cada operación protegida de una RPC debe declarar un binding cerrado:

```text
rpc identity
+
operation branch
→ exact required permission_key
```

Ese binding es contrato del servidor.

#### 26. El permiso requerido es SERVER_DERIVED

La capacidad necesaria para ejecutar un efecto es un hecho derivado del contrato de la operación.

El caller puede solicitar una operación. No puede declarar un permiso alternativo para obtener autorización.

#### 27. Inputs de permiso legacy

Un argumento como:

```text
p_permission_code
permission_code
permission_key
```

se clasifica por función real, no por nombre.

Puede ser:

```text
CONTRACT_SELECTOR_INTERNAL
COMPATIBILITY_ONLY
UNTRUSTED_PERMISSION_SELECTOR
```

No existe la clase `CLIENT_AUTHORITY`.

#### 28. CONTRACT_SELECTOR_INTERNAL

Solo es admisible cuando:

1. la superficie externa no puede elegir arbitrariamente la clave;
2. el caller interno ya está vinculado a una operación cerrada;
3. la clave pertenece a una allowlist contractual exacta;
4. el valor se valida contra la release activa;
5. no existe ampliación por prefijo o wildcard.

#### 29. COMPATIBILITY_ONLY

Un argumento conservado temporalmente por compatibilidad:

- no concede autoridad;
- puede compararse contra el binding esperado;
- debe tener consumer owner;
- debe tener plan de retiro;
- no puede transformarse en fallback si el binding no existe.

#### 30. UNTRUSTED_PERMISSION_SELECTOR

Un parámetro controlable por navegador, móvil o caller externo que seleccione la capacidad autorizante se considera no confiable.

La futura migración debe impedir cambiar una capacidad mutante por otra más débil para obtener acceso.

#### 31. Binding por constante contractual

Una RPC con un único efecto puede declarar:

```text
RPC_A
→ PERMISSION_X
```

La constante pertenece al contrato/matriz del package, no a un string disperso sin validación.

#### 32. Binding por rama de operación

Una RPC que reciba un selector empresarial legítimo de operación puede tener:

```text
operation = A → PERMISSION_A
operation = B → PERMISSION_B
```

La matriz de ramas debe ser cerrada.

Un valor fuera de la matriz falla cerrado.

#### 33. Operación única por decisión

El contrato canónico de evaluación conserva una `permission_key` por solicitud/decisión.

Una operación protegida no introduce silenciosamente un array de permisos dentro del mismo `AuthorizationDecision`.

#### 34. Operación compuesta

Si un efecto compuesto exige varias capacidades independientes:

```text
P1
AND
P2
```

cada obligación obtiene su evaluación canónica propia y todas deben resultar ejecutables antes del efecto compuesto.

No se sintetiza un permiso más amplio para evitar evaluaciones múltiples.

#### 35. Operación READ

Una lectura protegida se enlaza con su capacidad de lectura exacta.

Un permiso de acceso a aplicación o una lectura de otro recurso no sustituye el permiso requerido.

#### 36. Operación CREATE

Una creación se enlaza con la capacidad exacta de creación, registro o apertura que el catálogo declare para ese recurso y proceso.

La semántica no se deriva del verbo SQL `INSERT` por sí solo.

#### 37. Operación UPDATE

Una actualización utiliza la capacidad exacta de la acción empresarial.

`update`, `approve`, `resolve`, `override` o `publish` permanecen capacidades distintas cuando el catálogo las separa.

#### 38. Operación DELETE

Una eliminación o cancelación usa la capacidad exacta aprobada.

No se concede porque el actor tenga `manage`, `update` o acceso a aplicación salvo relación contractual explícita publicada.

#### 39. Operación EXECUTE

Una acción que no se modele como CRUD utiliza `EXECUTE` cuando el contrato de evaluación así corresponda, pero conserva una `permission_key` exacta.

El tipo de operación no sustituye el permiso.

#### 40. No wildcard

Queda prohibido evaluar mediante patrones equivalentes a:

```text
nexo.*
nexo.inventory.*
*.approve
permission prefix
```

La membresía y el grant son por clave publicada exacta.

#### 41. No prefijo de módulo como capacidad

Conocer que una clave pertenece a `inventory` no concede otras claves del mismo módulo.

```text
nexo.inventory.stock.view
≠
nexo.inventory.adjustments.register
```

#### 42. app.access

Una clave `app.access` representa acceso general a la aplicación según su contrato.

No equivale a todos sus permisos internos.

#### 43. Visibilidad de pantalla

Poder renderizar una pantalla, menú, tab, botón o ruta no autoriza el efecto de la RPC.

La RPC valida la capacidad exacta aunque la UI ya haya aplicado un guard.

#### 44. Nombre de rol

Ningún nombre de rol es una capacidad.

`propietario`, `gerente_general`, `gerente`, `supervisor` o un rol operativo no sustituyen un grant/deny evaluado para la `permission_key` exacta.

#### 45. Jerarquía

No existe autorización por rol superior fuera de las matrices y concesiones publicadas.

La jerarquía humana no crea wildcard de permisos.

#### 46. Herencia entre acciones

No se asume automáticamente:

```text
manage → view
approve → update
update → create
delete → manage
access → view
```

Toda relación permitida debe estar publicada como contrato.

#### 47. Alias

Un alias solo participa cuando la release contractual lo publica expresamente con semántica y ciclo de vida gobernados.

Un alias legacy no puede ampliar un permiso retirado hacia una capacidad más amplia.

#### 48. Clave retirada

Una clave retirada conserva historia y evidencia.

No se reactiva porque siga almacenada en una matriz legacy, un helper la reconozca, un consumidor antiguo la envíe o exista una cadena similar activa.

#### 49. Clave nueva

Una clave nueva no hereda concesiones por parecido, módulo, rol o permiso anterior.

Comienza con el tratamiento de default deny previsto por el modelo hasta contar con asignaciones aprobadas.

#### 50. Case, espacios y corrección silenciosa

009 no usa `lower()`, `trim()` o sustituciones para convertir una clave inválida en otra válida.

Una incompatibilidad de representación se resuelve mediante compatibilidad explícita, no modificando silenciosamente la identidad.

#### 51. permission_key y app_code coherentes

Debe cumplirse:

```text
permission_contract.app_code
=
request.app_code
```

y la `permission_key` debe pertenecer a ese namespace.

No se infiere `app_code` desde una entrada manipulable cuando el contrato exige declararlo y validarlo.

#### 52. Configuración ausente

Si la clave no tiene contrato runtime completo:

- no se fabrica metadata;
- no se consulta otro permiso parecido;
- no se degrada a `app.access`;
- no se usa un helper legacy como autoridad alternativa.

La evaluación falla cerrada conforme a la taxonomía propietaria.

#### 53. Fallo técnico no es DENY falso

La indisponibilidad técnica del catálogo, contexto, resolver o evaluator no se registra como un `DENY` empresarial inventado.

Se conserva la separación canónica entre decisión y fallo técnico.

#### 54. Default deny

Ausencia de grant aplicable significa que no existe autorización concedida.

No se busca un rol, scope o permiso alternativo para salvar la operación.

#### 55. authorization_requirement

Cada permiso activo declara exactamente una modalidad:

```text
BASE_ONLY
OPERATIONAL_ONLY
BASE_OR_OPERATIONAL
BASE_AND_OPERATIONAL
```

La RPC no redefine esta modalidad.

#### 56. BASE_ONLY

`BASE_ONLY` evalúa exclusivamente el carril base.

La existencia de turno o rol operativo no amplía ni reemplaza el grant base.

#### 57. OPERATIONAL_ONLY

`OPERATIONAL_ONLY` requiere el carril operativo conforme al contrato de contexto y prerrequisitos.

Una asignación administrativa no sustituye el carril operativo.

#### 58. BASE_OR_OPERATIONAL

Cada carril se evalúa independientemente.

La operación puede continuar por un carril permitido sin mezclar grants parciales de ambos para fabricar uno nuevo.

#### 59. BASE_AND_OPERATIONAL

Ambos carriles deben satisfacer sus obligaciones.

```text
base ALLOW
+
operational DENY
=
no executable
```

#### 60. Prerrequisitos N, T y T+C

La release conserva por carril los prerrequisitos aplicables:

```text
N
T
T+C
```

009 no cambia la exigencia de turno/check-in para hacer coincidir el estado del actor.

#### 61. Área operativa requerida

La clasificación contractual distingue:

```text
REQUIRED
SITE_SUFFICIENT
NOT_APPLICABLE
```

009 consume el resultado territorial de 008 y lo compara mediante el evaluador.

No transforma `SITE_SUFFICIENT` en todas las áreas.

#### 62. Scopes permitidos

La `PermissionContractSnapshot` define los scopes admitidos y el máximo del permiso.

Un grant con scope no admitido por el permiso es configuración inválida, no autoridad adicional.

#### 63. NT y ORG

Permisos legítimamente no territoriales u organizacionales no fabrican sede o área.

La ausencia de territorio solo es válida cuando el contrato exacto lo permite.

#### 64. G

El alcance global mantiene el límite de la capacidad exacta y de la organización aplicable.

```text
GLOBAL
≠
ALL PERMISSIONS
```

#### 65. AS, SS, AST y TST

Los scopes de sede o tipo de sede se comparan contra los hechos ya resueltos por 007.

009 no vuelve a escoger territorio desde el grant.

#### 66. AA, SA, AAT y ATW

Los scopes de área se comparan contra los hechos resueltos por 008.

`area_kind` clasifica; no sustituye la identidad concreta del área.

#### 67. CTX

`CTX` utiliza el territorio operativo efectivo del `AccessContext`.

No acepta sede o área enviadas por cliente como sustitutos del contexto.

#### 68. OWN

`OWN` requiere la relación exacta definida por el contrato de recurso.

Ser creador, registrador o actor de la pantalla no crea `OWN` por inferencia.

#### 69. Scope no se deduce del permiso

La identidad del permiso no indica por sí sola el territorio concedido.

```text
permission_key
+
grant/deny dataset
+
resource territory
+
context
→ alcance evaluado
```

#### 70. Contrato de recurso

El permiso exacto conserva su `resource_contract_id`.

La RPC no puede usar un permiso de un recurso y resolver territorio contra otro recurso para obtener un ALLOW aparente.

#### 71. operation_kind y resource contract

La combinación:

```text
permission_key
operation_kind
resolved resource
```

debe ser coherente con el contrato publicado.

Una inconsistencia bloquea antes del efecto.

#### 72. required_sides

En recursos multilado, el permiso conserva los lados que deben autorizarse.

009 usa los `resource side roles` heredados y no reduce la operación a un único lado conveniente.

#### 73. Política de campos

Autorizar el recurso no autoriza todos sus campos.

La `field_policy_id` aplicable continúa limitando qué puede leerse o mutarse.

#### 74. Sensibilidad

Una capacidad sensible conserva su clasificación.

No se rebaja sensibilidad porque la RPC sea interna, la invoque un backend o el actor ya esté autenticado.

#### 75. Reautenticación fuerte

Cuando el contrato exige reautenticación fuerte, la decisión no puede convertirse en ejecutable sin evidencia válida.

009 no implementa el mecanismo de reautenticación; conserva el prerrequisito.

#### 76. Dispositivo compartido

El dispositivo puede imponer un techo adicional.

Nunca crea el permiso del actor.

#### 77. Simulación

Una evaluación simulada permanece separada de una decisión real.

Una `permission_key` visible o permitida en simulación no autoriza una RPC empresarial real.

#### 78. Explicit deny

Las denegaciones explícitas aplicables conservan precedencia.

Un grant coincidente no neutraliza una denegación que el modelo declara superior.

#### 79. Deny individual

Un `employee_permissions` negativo aplicable debe conservar su efecto de denegación conforme a precedencia.

No se salta buscando después un rol con grant equivalente cuando el contrato lo prohíbe.

#### 80. Grant individual

Un grant individual solo autoriza si corresponde a la misma clave exacta, está vigente, su scope cubre el recurso, no existe deny superior y los demás prerrequisitos se satisfacen.

#### 81. Grant de rol base

Una asignación de rol base participa únicamente a través de la matriz contractual aplicable.

El rol no se convierte en shortcut de la evaluación.

#### 82. Grant de rol operativo

Un rol operativo participa únicamente cuando el carril operativo y la matriz correspondiente aplican.

La coincidencia de string de rol no sustituye turno, área, dispositivo ni recurso.

#### 83. Paridad con AUTH-SRV-005

La regla de servidor y la regla de RPC son equivalentes:

```text
EFECTO PROTEGIDO
→ UNA CAPACIDAD CANÓNICA EXACTA
→ CONTEXTO Y RECURSO RESUELTOS
→ DECISIÓN CANÓNICA
```

La misma operación no puede requerir un permiso en Server Action y otro más amplio en RPC sin contrato explícito.

#### 84. Helper booleano legacy no es decisión completa

Un helper que retorna `boolean` puede ser antecedente o compatibilidad.

No sustituye una `AuthorizationDecision` con permiso, lanes, razones, contexto, recurso, hashes, versión y evidencia.

#### 85. has_permission AS-IS

El estado remoto contiene `public.has_permission(...)`.

La función resuelve un permiso por clave completa contra `app_permissions`, roles y excepciones, pero pertenece al modelo legacy y no reemplaza el evaluator canónico de R1.

Su existencia se registra como transición, no como contrato normativo nuevo.

#### 86. has_effective_permission_v1 AS-IS

El estado remoto contiene `public.has_effective_permission_v1(...)`.

Se observaron comportamientos transitorios como:

- limpieza de strings;
- normalización de `app_code`;
- inferencia de app desde la clave cuando falta;
- mezcla con contexto legacy;
- selección de helpers base/operativos.

009 no incorpora esas precedencias al contrato canónico por existir físicamente.

#### 87. has_operational_permission AS-IS

El helper operacional observado:

- recibe `permission_code`, sede, área y app;
- usa contexto operacional legacy;
- consulta matrices operativas;
- contiene una ruta de `bypass_applied` heredada.

La futura adopción canónica no conserva un bypass por nombre, flag o helper local fuera de la decisión aprobada.

#### 88. app_code inferido AS-IS

Inferir `app_code` con el primer segmento de una clave puede existir en compatibilidad legacy.

El contrato futuro exige `app_code` explícito y coherente dentro del request canónico; una inferencia no puede ocultar una discrepancia.

#### 89. Normalización de strings AS-IS

`trim` o `lower` usados por helpers actuales son hechos del baseline, no reglas nuevas de identidad.

La adopción debe comparar contra la clave exacta publicada y tratar cualquier alias o normalización exclusivamente mediante compatibilidad gobernada.

#### 90. SQL privilege no es business permission

Tener `EXECUTE` sobre una función solo significa que el rol PostgreSQL puede invocar esa superficie.

No significa que el actor esté autorizado para el efecto empresarial.

#### 91. SECURITY DEFINER

`SECURITY DEFINER` ejecuta con privilegios del owner SQL.

Por tanto aumenta la necesidad de validar `permission_key`, actor, recurso y contexto; no la reduce.

#### 92. PUBLIC y anon

Una función accesible a `PUBLIC` o `anon` debe tratarse como superficie potencialmente invocable por audiencia amplia.

009 no corrige grants, pero su matriz registra la exposición observada y exige que la lógica empresarial no dependa de que nadie debería llamarla directamente.

#### 93. authenticated

`authenticated` demuestra autenticación de la sesión PostgreSQL/PostgREST.

No demuestra autorización para una capacidad concreta.

#### 94. service_role

`service_role` o una conexión privilegiada no representan automáticamente autoridad empresarial.

Cuando ejecuten en nombre de un actor o proceso, debe existir el contrato de principal y capacidad correspondiente.

#### 95. Principal técnico

Un principal técnico permitido usa permisos y contratos propios.

No toma prestado un permiso humano ni recibe un wildcard por ser integración, job, cron o worker.

#### 96. Direct PostgREST RPC

Una RPC expuesta debe producir la misma decisión aunque se invoque directamente y se omita la UI que normalmente la consume.

#### 97. Caller backend

Un Server Action, Route Handler o Edge Function que invoque la RPC sigue obligado a vincular el efecto al permiso exacto.

El backend no convierte argumentos manipulables del usuario en autoridad por reenviarlos.

#### 98. RLS

009 no implementa policies.

`AUTH-DB-021` mantiene la responsabilidad de que la capa RLS consuma una semántica equivalente sin crear una segunda tabla de permisos, excepción o scope.

#### 99. authorization_policy_allows

La fundación R1 reserva un helper de predicado equivalente a:

```text
app_private.authorization_policy_allows(jsonb)
```

Su uso futuro en RLS debe permanecer side-effect-free y semánticamente equivalente al evaluator.

#### 100. Grants

El cierre físico de grants pertenece a la tarea propietaria de RLS/grants.

009 identifica la audiencia y el riesgo de cada RPC para asegurar que el permiso exacto se valida incluso cuando la superficie es alcanzable.

#### 101. Frontera transaccional

Para efectos sensibles:

```text
resolve context/resource/territory
→ bind exact permission
→ evaluate
→ persist required decision evidence
→ validate freshness/concurrency
→ execute effect
```

La separación temporal no puede permitir ejecutar con una decisión obsoleta.

#### 102. Frescura

009 reutiliza la fundación de frescura e invalidación aprobada.

Cambios relevantes en actor, asignación, turno/check-in, recurso, sede/área, grants/denies, catálogo o datasets deben impedir reutilizar ciegamente una decisión anterior.

#### 103. Cambio de catálogo

Una nueva release contractual invalida la suposición de que una clave conserva exactamente la misma metadata.

El candidate debe demostrar qué release utiliza.

#### 104. Cambio de permiso

Cambiar modalidad, scope máximo, prerequisitos, sensibilidad o contrato de recurso requiere una nueva versión/hash y no una edición runtime silenciosa.

#### 105. Cache

No se permite un cache de decisiones cross-request que ignore versión de catálogo, contexto o recurso.

#### 106. Retry

Un retry no elige un permiso alternativo después de un DENY.

Si cambia la realidad contractual o contextual, se crea una nueva evaluación conforme al modelo canónico.

#### 107. Idempotencia

La clave de idempotencia de una operación no es un permiso.

La repetición segura conserva la misma obligación de autorización y detecta cambios que exijan reevaluación.

#### 108. Auditoría

La evidencia debe poder correlacionar:

```text
package_id
candidate_id
rpc identity
operation branch
required permission_key
catalog_version
catalog_hash
permission_contract_hash
context_id
resource reference
site/area facts
decision_id
outcome
correlation_id
execution reference
timestamp
```

#### 109. DENY como evidencia

Una denegación real se conserva como evidencia.

No se borra durante rollback ni se reetiqueta como error de interfaz.

#### 110. Fallo técnico

Un fallo técnico de evaluación conserva identidad y telemetría separadas.

No genera un candidate `decision_id` falso ni incrementa métricas de DENY empresarial.

#### 111. Mensajes seguros

La RPC no devuelve al cliente matrices completas, grants internos, denies de otros actores, hashes privados o detalles suficientes para enumerar permisos.

#### 112. Observabilidad

Las métricas pueden segmentar por RPC, aplicación, permiso, operation kind, ALLOW/DENY/TECHNICAL_FAILURE, latencia y candidate/package, sin convertir logs en una copia de datos sensibles.

#### 113. Registro obligatorio por RPC

Cada futura instancia mantiene una fila por firma exacta y operación protegida.

Una RPC con dos ramas protegidas produce dos bindings explícitos aunque comparta función SQL.

#### 114. Campos mínimos del registro

Cada binding conserva como mínimo:

```text
rpc_permission_binding_id
package_id
candidate_id
transition_key
migration_unit_id
schema_name
function_name
identity_arguments
operation_branch
operation_kind
required_permission_key
required_app_code
permission_binding_mode
catalog_version
catalog_hash
permission_contract_hash
resource_contract_id
authorization_requirement
allowed_scopes
maximum_scope
lane_prerequisites
area_requirement
shared_device_mode
simulation_mode
strong_reauthentication_requirement
site_handoff_reference
area_handoff_reference
principal_actor_handoff_reference
legacy_helper_reference
legacy_permission_argument_role
security_mode
owner_role
execute_audience
compatibility_reference
consumer_reference
rollback_reference
adoption_state
evidence_reference
owner
```

#### 115. Estados de binding

Cada fila usa un estado cerrado equivalente a:

```text
BOUND_EXACT
BOUND_MULTI_DECISION
COMPATIBILITY_ONLY
BLOCKED_MISSING_PERMISSION
BLOCKED_AMBIGUOUS_PERMISSION
BLOCKED_INACTIVE_PERMISSION
BLOCKED_CONTRACT_INCOMPLETE
BLOCKED_OPERATION_MISMATCH
BLOCKED_DRIFT
OUTSIDE_PACKAGE
```

Los estados `BLOCKED_*` nunca se interpretan como autorización.

#### 116. Cardinalidad por package

Cada candidate demuestra:

```text
protected rpc operations expected = N
classified operations = N
unbound protected operations = 0
unknown permission keys = 0
ambiguous permission keys = 0
inactive permission keys = 0
wildcard bindings = 0
client-authority permission selectors = 0
permission contracts incomplete = 0
```

`N` procede del package y del candidate.

#### 117. Cobertura de una RPC sin argumento de permiso

Una RPC puede no recibir ningún `permission_code` y seguir siendo protegida.

El binding exacto debe provenir de su contrato de operación.

#### 118. Cobertura de una RPC con argumento de permiso

Una RPC que recibe un string de permiso no queda automáticamente bien protegida.

La instancia debe demostrar que el argumento no permite seleccionar una capacidad más débil o diferente a la requerida por el efecto.

#### 119. Baseline remoto de catálogo

El corte read-only utilizado para desarrollar esta tarea observa en `vento-os-dev`:

```text
apps total = 10
apps activas = 10
app_permissions total = 179
app_permissions activas = 179
stored permission codes relative = 179
stored codes already app-prefixed = 0
duplicate app+code pairs = 0
duplicate derived permission keys = 0
role_permission rows = 613
employee_permission rows = 17
operational_role_permission rows = 32
```

Estos conteos son AS-IS y no se hardcodean como release eterna.

#### 120. Baseline remoto de funciones

El mismo corte observa:

```text
functions referencing has_permission = 35
functions referencing has_operational_permission = 2
functions referencing app_permissions = 4
functions referencing role_permissions = 4
functions referencing operational_role_permissions = 2
functions referencing permission_code = 9
physical app_private.evaluate_authorization = 0
physical api.get_safe_authorization_decision = 0
```

Esto confirma que la adopción del evaluator canónico continúa pendiente físicamente.

#### 121. Baseline de matrices operativas

En el corte observado:

```text
operational_role_permission rows = 32
allowed rows = 32
denied rows = 0
distinct permission strings = 11
rows matching active full permission_key = 32
rows matching only a relative code = 0
```

La diferencia de representación entre matrices legacy forma parte de la transición y no redefine la identidad canónica.

#### 122. Superficies de riesgo observadas

Entre las superficies actuales que consumen autorización legacy se observan, entre otras:

```text
apply_restock_receipt
apply_restock_shipment
create_remission_shipment_from_fulfillments
fogo_create_production_batch_from_recipe
fogo_create_real_production_batch
mark_restock_request_in_transit
origo_reverse_inventory_entry
pulso_post_daily_sales_import
update_order_operational_state
viso_accounting_dashboard
```

La lista es evidencia AS-IS y no significa que todas pertenezcan al mismo package.

#### 123. Superficies amplias observadas

El baseline también muestra funciones legacy de autorización alcanzables por audiencias amplias, entre ellas `has_permission` y algunas RPC con `PUBLIC`/`anon` EXECUTE.

009 registra el riesgo; la corrección física de grants permanece en su tarea propietaria.

#### 124. Drift previo a materialización

Antes de cada instancia se recaptura:

```text
schema
function name
identity arguments
function body
owner
security mode
search_path
EXECUTE grants
operation branches
permission bindings
catalog version/hash
resource contract
consumers
migration baseline
```

Resultado:

```text
MATCH
APPROVED_DRIFT
BLOCKING_DRIFT
```

#### 125. Drift de permiso

Se considera bloqueante, salvo reconciliación aprobada:

- permiso requerido ya no existe;
- permiso cambió de app;
- permiso se retiró;
- contrato cambió sin candidate nuevo;
- binding apunta a alias no aprobado;
- una rama nueva quedó sin permiso;
- la RPC empezó a aceptar permiso arbitrario;
- apareció bypass local.

#### 126. Candidate inmutable

Cada futura instancia vincula sus bindings a un `candidate_id` que fija como mínimo:

```text
commit_sha
migration set
rpc definitions
contract bundle
catalog version/hash
package scope
```

Cambiar un componente material crea otro candidate.

#### 127. Adopción por package

La adopción avanza únicamente para las RPC incluidas y verificadas del package.

No se migra una función fuera de alcance porque use el mismo helper.

#### 128. Shadow comparison

Cuando el plan de transición lo permita, una etapa controlada puede comparar:

```text
legacy result
vs
canonical AuthorizationDecision
```

La comparación no permite ejecutar con el resultado más permisivo.

#### 129. Fuente de autoridad durante shadow

Mientras canonical no sea la fuente de ejecución aprobada, shadow solo observa.

Después del cutover, el helper legacy no puede recuperar autoridad ante un DENY canónico.

#### 130. Cutover

El cutover de una RPC exige:

1. binding exacto validado;
2. evaluator canónico disponible;
3. contexto, recurso y territorio compatibles;
4. principal/actor de 010 cerrado;
5. evidencia y tests verdes;
6. consumidor migrado;
7. rollback preparado.

#### 131. Rollback

Rollback restaura una ruta de código o compatibilidad previamente aprobada cuando sea seguro.

No borra decisiones históricas, reactiva permisos retirados, convierte wildcard en solución temporal, relaja el permiso exacto ni omite evidencia.

#### 132. Rollback de catálogo

Si una release contractual debe revertirse, se activa una release aprobada compatible mediante el procedimiento propietario.

009 no edita en sitio una versión publicada.

#### 133. Pruebas de identidad exacta

Cada binding cubre al menos:

- clave exacta válida;
- typo;
- case diferente;
- espacios periféricos;
- clave inexistente;
- clave inactiva;
- clave de otra app;
- alias no publicado;
- wildcard;
- prefijo;
- substring.

#### 134. Pruebas de sustitución

Se prueba que no autoricen:

- `app.access` en lugar de permiso interno;
- permiso `view` para mutación;
- permiso de recurso vecino;
- rol administrativo por nombre;
- pantalla visible;
- flag cliente;
- permiso enviado por body distinto al binding.

#### 135. Pruebas de modalidad

Se cubren:

```text
BASE_ONLY
OPERATIONAL_ONLY
BASE_OR_OPERATIONAL
BASE_AND_OPERATIONAL
```

incluyendo casos donde solo uno de los carriles satisface condiciones.

#### 136. Pruebas de scopes

Se cubren scopes aplicables con:

- recurso dentro y fuera de territorio;
- recurso propio y de tercero;
- sede/área correcta e incorrecta;
- tipo de sede/área correcto e incorrecto;
- scope no admitido por el permiso;
- grant ausente;
- deny aplicable.

#### 137. Pruebas de prerequisitos

Se cubren N, turno válido/ausente, check-in requerido/ausente, área REQUIRED, SITE_SUFFICIENT y contexto no aplicable.

#### 138. Pruebas de precedencia

Se demuestra que:

- deny superior vence grant;
- individual grant no crea wildcard;
- rol no sustituye permiso;
- dos grants parciales no se fusionan fuera del contrato;
- base y operativo siguen la modalidad exacta.

#### 139. Pruebas de caller adversarial

Una llamada directa intenta modificar:

```text
permission_key
app_code
operation selector
site
area
resource locator
principal/actor hints
```

y no consigue sustituir los hechos de servidor ni el binding requerido.

#### 140. Pruebas de SQL privilege

Se comprueba que:

- `authenticated` con EXECUTE pero sin permiso empresarial falla;
- una función `SECURITY DEFINER` sigue validando negocio;
- `service_role` no se usa como sustituto del principal empresarial;
- acceso directo a PostgREST no salta el evaluator.

#### 141. Pruebas de operación compuesta

Si una operación exige varias capacidades:

- cada capacidad genera evaluación independiente;
- faltar una bloquea el efecto compuesto;
- no se crea permiso sintético más amplio;
- la evidencia correlaciona todas las decisiones requeridas.

#### 142. Pruebas de drift

Se cubren:

- nueva rama de RPC sin binding;
- clave retirada;
- catalog hash distinto;
- cambio de modalidad;
- cambio de resource contract;
- grant nuevo;
- helper legacy alterado;
- audiencia EXECUTE ampliada.

#### 143. Pruebas de paridad

Para el mismo request efectivo, contexto, recurso y release:

```text
RPC
Server Action / backend
RLS equivalente cuando aplique
```

deben producir semántica de autorización equivalente, sin excepciones locales de permiso.

#### 144. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0
**Requisitos diferidos:** 0
**Requisitos obsoletos:** 0

La cobertura ya registrada obliga a usar permisos canónicos exactos, mantener paridad entre capas y bloquear llamadas RPC manipuladas; 009 convierte esa obligación existente en contrato R2 por package sin crear una regla de negocio nueva.

#### 145. Cobertura de prueba vigente reutilizada

Esta sección es únicamente trazabilidad y no modifica el registro 04A.

Se reutiliza cobertura existente sobre:

- `TREQ-AUTH-001`, para resolución mediante permisos/contexto/alcance canónicos;
- `TREQ-AUTH-002`, para identidad de permiso existente y libre de strings huérfanos;
- `TREQ-AUTH-004`, para igualdad de decisión entre evaluadores;
- `TREQ-AUTH-008`, para coherencia entre carriles y capas;
- `TREQ-AUTH-009`, para territorio determinista;
- `TREQ-AUTH-013`, que asigna expresamente `AUTH-DB-006` a `AUTH-DB-010` al bloqueo de bypass por RPC;
- `TREQ-AUTH-015`, para evidencia correlacionable de permiso y decisión;
- `TREQ-AUTH-060`, para `permission_key` exacta sin wildcard/prefijo en membresías de autorización.

No se modifica texto, owner, estado, relación ni artefacto de esas filas.

#### 146. Evidencia de validación

| Clase     | Estado       | Evidencia                                                                                                                                                                                                                                                                                              |
| --------- | ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| BUILD     | NOT_EXECUTED | La batería del checkout se ejecutará después de insertar la tarea en su archivo propietario.                                                                                                                                                                                                           |
| LOCAL     | PASS         | El artefacto fue validado estructuralmente: una tarea, metadata obligatoria, secciones requeridas, cinco clases de evidencia, cero placeholders, cero TREQ dentro de la sección de cero cambios y continuidad terminal.                                                                                |
| REMOTA    | PASS         | Se verificaron `main` en `edeea19eea3a18d9eb5a1212f9c97f5ba4203e86`, continuidad, topología R2, 008 aprobado, catálogo versionado, `AUTH-CTX-026`, `AUTH-DB-034`, `AUTH-SRV-005`, 04A AUTH, scripts documentales vigentes, documentación actual de Supabase y el baseline read-only de `vento-os-dev`. |
| OPERATIVA | NOT_EXECUTED | No se invocaron RPC empresariales ni se ejecutaron flujos reales de negocio.                                                                                                                                                                                                                           |
| FÍSICA    | NOT_EXECUTED | No se creó ni aplicó migración, función, grant, policy, DDL, DML, despliegue o configuración.                                                                                                                                                                                                          |

`REMOTA = PASS` valida el desarrollo documental y los hechos observados; no certifica una futura instancia física.

#### 147. Criterios de aceptación

009 queda documentalmente satisfecha cuando:

1. conserva `TEMPLATE_PER_PACKAGE`;
2. conserva `POST_E5_PACKAGE`;
3. consume exactamente el handoff de 008;
4. entrega a 010 sin absorber principal/actor;
5. cada operación protegida tiene binding exacto;
6. `permission_key` se resuelve por igualdad exacta;
7. `app_code` se valida independientemente;
8. la clave está activa;
9. existe un único snapshot contractual aplicable;
10. se conservan versión y hashes;
11. la cardinalidad procede de la release;
12. no se hardcodean conteos históricos;
13. el permiso requerido es server-derived;
14. un argumento cliente no elige una capacidad alternativa;
15. una RPC multirama tiene matriz cerrada;
16. un efecto compuesto conserva decisiones separadas;
17. no existen wildcards;
18. no existen prefijos permisivos;
19. `app.access` no sustituye permisos internos;
20. no existe herencia implícita entre acciones;
21. alias y retiros son versionados;
22. no se normaliza silenciosamente una identidad inválida;
23. modalidad y lanes proceden del catálogo;
24. prerrequisitos proceden del catálogo;
25. scopes proceden del catálogo;
26. contrato de recurso coincide;
27. required sides se conservan;
28. política de campos no se omite;
29. sensibilidad y reautenticación no se degradan;
30. deny conserva precedencia;
31. grants individuales y de rol no crean bypass;
32. simulación no produce autoridad real;
33. dispositivo solo restringe conforme a contrato;
34. helper booleano legacy no es decisión completa;
35. `bypass_applied` legacy no se adopta como excepción canónica;
36. `SECURITY DEFINER` no es autoridad empresarial;
37. EXECUTE SQL no es permiso empresarial;
38. service role no es wildcard de negocio;
39. llamada PostgREST directa conserva autorización;
40. backend conserva la misma obligación;
41. RLS no crea semántica paralela;
42. se respeta frescura;
43. se respeta frontera transaccional;
44. DENY y fallo técnico permanecen separados;
45. se conserva evidencia correlacionable;
46. la matriz por RPC cierra N/N;
47. drift bloqueante se detecta;
48. shadow no escoge el resultado más permisivo;
49. rollback no relaja permiso exacto;
50. no se ejecutan cambios físicos durante esta tarea documental.

#### 148. Límites

Esta tarea no:

- materializa `AUTH-DB-009::package_id`;
- crea o modifica migraciones;
- modifica funciones o RPC;
- modifica `app_permissions`;
- modifica matrices de rol o empleado;
- publica una nueva versión de catálogo;
- crea runtime projections de R1;
- materializa `evaluate_authorization`;
- modifica `get_access_context`;
- redefine sede o área;
- valida principal/actor en lugar de 010;
- cambia grants;
- cambia RLS;
- cambia Storage, Realtime, Edge Functions o cron;
- retira helpers legacy;
- crea aliases;
- cambia consumidores;
- ejecuta backfills;
- modifica 04A;
- abre E5;
- abre `SHELL-CI-020`;
- autoriza una instancia física.

#### 149. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-DB-008 — Validar área dentro de RPC sensibles`

**TAREA ACTUAL APROBADA**
`AUTH-DB-009 — Validar permiso exacto dentro de RPC sensibles`

**SIGUIENTE TAREA RESERVADA**
`AUTH-DB-010 — Validar principal y actor efectivo dentro de RPC sensibles`


### ✅ AUTH-DB-010 — Validar principal y actor efectivo dentro de RPC sensibles

**Estado:** APROBADA
**Tarea anterior:** AUTH-DB-009 — Validar permiso exacto dentro de RPC sensibles
**Tarea siguiente:** AUTH-DB-021 — Implementar políticas RLS y grants canónicos por esquema
**Tipo de tarea:** Documental; contrato y plantilla R2 repetible por `package_id` para validación de principal técnico y actor efectivo dentro de RPC sensibles
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/03_R2_MIGRACION_PROGRESIVA_POR_DOMINIO.md`
**Estado físico resultante:** Contrato `RPC-PRINCIPAL-ACTOR-VALIDATION-010@1.0.0` cerrado como `TEMPLATE_PER_PACKAGE`; cada futura instancia `AUTH-DB-010::<package_id>` permanece no ejecutada hasta satisfacer R0/R1 aplicables, el paquete E5 correspondiente, `SHELL-CI-020::<package_id>` y autorización física explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`AUTH-DB-010` define cómo toda RPC sensible incluida en un paquete aprobado debe validar por separado el principal técnico que presenta la credencial y el actor empresarial efectivo al que se atribuye la acción.

La tarea consume el `AccessContext@1.0.0` canónico, la resolución territorial de `AUTH-DB-007` y `AUTH-DB-008`, y el binding exacto de permiso de `AUTH-DB-009`. No permite que una RPC convierta `auth.uid()`, un `employee_id` enviado por el caller, un rol, un dispositivo, una simulación, `service_role`, un campo `created_by` o una coincidencia histórica de UUID en actor autorizado por inferencia.

#### 2. Resultado canónico

Se congela la frontera:

```text
CREDENCIAL TÉCNICA VALIDADA
→ PRINCIPAL CANÓNICO
→ VÍNCULO EMPRESARIAL
→ IDENTIDAD DE DOMINIO
→ ACTOR EFECTIVO
→ CONTEXTO + RECURSO + TERRITORIO
→ PERMISO EXACTO DE 009
→ evaluate_authorization
→ DECISIÓN
→ EFECTO
```

Y queda prohibida la equivalencia:

```text
auth.uid()
=
employee_id
=
actor_id
=
business authority
```

#### 3. Contrato material producido

La identidad contractual es:

```text
RPC-PRINCIPAL-ACTOR-VALIDATION-010@1.0.0
```

Gobierna por `package_id` la procedencia del principal, la resolución del actor, la clasificación de argumentos de identidad, los casos humano/dispositivo/servicio/cliente, la delegación, la frescura, la evidencia, el cutover y el rollback.

#### 4. Topología vinculante

La topología vigente es:

```text
mode = TEMPLATE_PER_PACKAGE
execution_gate = POST_E5_PACKAGE
instance = AUTH-DB-010::<package_id>
```

El marcador se define una sola vez. Cada paquete aplicable conserva una instancia física independiente y no existe `AUTH-DB-010::GLOBAL`.

#### 5. Gate temporal

Una futura instancia requiere, para el mismo `package_id`:

```text
R0 aplicable = VERIFIED
R1 aplicable = VERIFIED
DELIV-PKG aplicable = CLOSED
E5-GATE-008::<package_id> = PASS
SHELL-CI-020::<package_id> = OPENED
physical_authorization = EXPLICIT
```

La falta de cualquiera mantiene la materialización cerrada.

#### 6. Fuentes vinculantes

010 consume sin reinterpretación silenciosa:

- `AUTH-CTX-005`, principal;
- `AUTH-CTX-006`, actor efectivo;
- `AUTH-CTX-025`, contrato de `get_access_context`;
- `AUTH-CTX-026`, contrato de `evaluate_authorization`;
- `AUTH-DB-019`, vínculos Auth e identidades empresariales;
- `AUTH-DB-033`, materialización futura del `AccessContext`;
- `AUTH-DB-035`, frescura e invalidación;
- `AUTH-DB-034`, evaluador canónico;
- `AUTH-DB-006..009`, handoffs de contexto, sede, área y permiso;
- contratos de dispositivo, simulación, auditoría y paquete E5 aplicables.

#### 7. Handoff recibido de AUTH-DB-009

009 entrega hechos y contrato de permiso, no una atribución nueva:

```text
AccessContext canónico sin alterar
ResolvedResourceContext
site facts
area facts
required_permission_binding
permission_resolution_status
PermissionContractSnapshot
catalog_version
catalog_hash
permission_contract_hash
operation_kind
required lanes
prerequisite contract
scope contract
resource contract reference
```

010 no vuelve a escoger permiso, sede o área para favorecer una decisión.

#### 8. Handoff hacia AUTH-DB-021

010 entrega a 021, para las superficies incluidas en el mismo package:

```text
RPC inventory
principal source classification
actor resolution classification
trusted identity sources
client-controlled identity arguments
principal/actor validation state
AccessContext dependency
permission binding reference
resource/site/area references
security mode
execute audience
legacy compatibility state
adoption state
evidence and rollback references
```

021 conserva la responsabilidad exclusiva de materializar RLS y grants canónicos por esquema.

#### 9. Regla de no autorización parcial

010 no autoriza por sí sola un efecto.

```text
006 + 007 + 008 + 009 + 010
→ obligaciones acumulativas de la frontera RPC
```

Una validación correcta de identidad no compensa un permiso, territorio, recurso, contexto o estado inválido.

#### 10. Separación entre principal y actor

El principal responde:

```text
¿quién o qué presentó la credencial técnica?
```

El actor efectivo responde:

```text
¿a qué sujeto empresarial se atribuye la acción?
```

Son dimensiones distintas y ambas deben conservarse en evidencia.

#### 11. PrincipalContext congelado

010 consume la forma aprobada de `PrincipalContext`:

```text
principal_type
auth_user_id
session_id
authenticated
authentication_method
authenticated_at
session_expires_at
principal_status
```

No agrega campos ad hoc dentro de una RPC.

#### 12. Clases de principal

Las clases canónicas son:

```text
HUMAN_USER
SHARED_DEVICE
SYSTEM_SERVICE
ANONYMOUS
```

Nombres de rol, aplicación, dispositivo o proceso no crean nuevas clases localmente.

#### 13. Principal válido no implica autorización

Se preserva:

```text
principal_status = VALID
≠ actor resuelto
≠ identidad laboral vigente
≠ permiso concedido
≠ efecto ejecutable
```

La autenticación abre la resolución; no la termina.

#### 14. Fuente autoritativa del principal

El principal procede de una credencial o sesión validada en servidor y de la fundación canónica de identidad.

No procede de:

- body;
- query string;
- headers empresariales definidos por cliente;
- `localStorage`;
- estado de UI;
- UUID escrito por caller;
- correo o teléfono;
- `user_metadata`;
- rol enviado por frontend.

#### 15. auth_user_id

`auth_user_id` identifica al sujeto técnico de Supabase Auth cuando aplica.

No significa por sí solo:

```text
employee_id
customer_id
device_id
actor_id
role
permission
```

No se acepta como autoridad desde argumentos de negocio.

#### 16. session_id

`session_id` es una referencia técnica opaca y no una credencial reutilizable.

No contiene access token, refresh token, JWT completo ni secreto. Su presencia tampoco sustituye la comprobación de vigencia requerida por la operación.

#### 17. Estado INVALID

Un principal `INVALID` no puede ejecutar una RPC protegida que requiera identidad autenticada.

La RPC no intenta recuperar autoridad buscando un empleado, dispositivo o rol por otros campos.

#### 18. Estado ANONYMOUS

`ANONYMOUS` representa ausencia comprobada de credencial aceptable.

Una RPC sensible que requiere actor empresarial falla cerrado. Un endpoint verdaderamente público solo continúa si su contrato propietario lo permite expresamente y no convierte datos enviados por el cliente en actor.

#### 19. EffectiveActorContext congelado

010 consume la forma aprobada del actor efectivo:

```text
actor_type
actor_id
attribution_source
delegation_id
resolved
```

El actor no se sustituye por el principal ni por el recurso objetivo.

#### 20. Clases de actor

Los valores canónicos son:

```text
EMPLOYEE
CUSTOMER
SYSTEM
UNRESOLVED
```

`HUMAN_USER`, `SHARED_DEVICE` y `SYSTEM_SERVICE` son clases de principal, no de actor.

#### 21. actor_id

`actor_id` se interpreta únicamente junto a `actor_type`:

```text
EMPLOYEE   → employee_id canónico
CUSTOMER   → customer_id canónico
SYSTEM     → identidad estable del proceso
UNRESOLVED → null
```

No se reemplaza por `auth_user_id`, `device_id`, correo, documento, rol o `delegation_id`.

#### 22. Fuentes de atribución

La matriz aprobada es:

```text
EMPLOYEE   → PERSONAL_SESSION | DEVICE_ACTOR_SESSION | SYSTEM_PROCESS
CUSTOMER   → DOMAIN_IDENTITY
SYSTEM     → SYSTEM_PROCESS
UNRESOLVED → NONE
```

Una RPC no inventa una fuente adicional para resolver un caso difícil.

#### 23. Invariante resolved true

Debe cumplirse:

```text
resolved = true
→ actor_type != UNRESOLVED
→ actor_id != null
→ attribution_source != NONE
```

El actor resuelto sigue sujeto a vigencia, dominio y autorización.

#### 24. Invariante resolved false

Debe cumplirse:

```text
resolved = false
→ actor_type = UNRESOLVED
→ actor_id = null
→ attribution_source = NONE
→ delegation_id = null
```

Un estado incompleto no se transforma en actor parcial.

#### 25. Ambigüedad

Dos o más candidatos válidos sin una regla canónica que seleccione exactamente uno producen:

```text
actor_type = UNRESOLVED
resolved = false
```

No se escoge el primero, el más reciente, el de la sede visible ni el de mayor rol.

#### 26. Identidad de dominio

La identidad de dominio y el actor deben ser coherentes.

```text
EMPLOYEE actor → identidad EMPLOYEE compatible
CUSTOMER actor → identidad CUSTOMER compatible
SYSTEM actor   → identidad SYSTEM cuando el contrato la exija
```

Una identidad adicional disponible no se fusiona silenciosamente.

#### 27. Vínculos Auth ↔ identidad

010 consume `AUTH-DB-019`.

La resolución futura usa vínculos empresariales explícitos y versionados. Correo, teléfono, provider, metadata o coincidencia histórica de UUID no son vínculos nuevos por sí mismos.

#### 28. Igualdad legacy de UUID

El estado físico puede conservar temporalmente:

```text
employees.id = auth.users.id
```

Pero la igualdad no es el contrato objetivo y no puede ser la única prueba de que el principal sea el empleado actor.

#### 29. Cambio de cuenta Auth

Reemplazar una cuenta Auth no renumera automáticamente la identidad empresarial.

La RPC debe resolver el vínculo vigente y no asumir que el identificador técnico permanecerá para siempre idéntico al actor.

#### 30. HUMAN_USER

Un `HUMAN_USER + VALID` demuestra una sesión personal técnica válida.

La aplicación y política de identidad de dominio determinan después qué identidad empresarial puede participar. La mera existencia del principal no declara EMPLOYEE ni CUSTOMER.

#### 31. HUMAN_USER como EMPLOYEE

Para atribuir:

```text
principal_type = HUMAN_USER
actor_type = EMPLOYEE
attribution_source = PERSONAL_SESSION
```

debe existir una resolución canónica, única y vigente hacia el empleado correspondiente, compatible con la aplicación y el contexto.

#### 32. Empleado inactivo

Un principal Auth puede continuar técnicamente válido aunque el empleado asociado esté inactivo.

Para una operación laboral:

```text
principal VALID
+
employee inactive
→ no executable
```

No se invalida ficticiamente Auth ni se ignora el estado laboral.

#### 33. Empleado inexistente

Un principal humano sin vínculo laboral válido no se convierte en empleado porque exista el mismo UUID en una tabla legacy o porque la aplicación sea laboral.

El actor queda no resoluble para operaciones que exijan empleado.

#### 34. HUMAN_USER como CUSTOMER

Una aplicación cliente puede resolver:

```text
principal_type = HUMAN_USER
actor_type = CUSTOMER
attribution_source = DOMAIN_IDENTITY
```

solo mediante la política de identidad de dominio y el vínculo canónico aplicables.

#### 35. Persona con identidad laboral y cliente

Una misma persona puede tener más de una identidad de dominio.

NEXO puede resolver EMPLOYEE y una superficie cliente puede resolver CUSTOMER, pero 010 no fusiona ambos namespaces ni permite que privilegios laborales aparezcan en una operación cliente.

#### 36. Aplicación como selector de dominio

`p_app_code` participa en la política de resolución de contexto, no como autoridad.

Una aplicación no convierte automáticamente al principal en empleado, cliente o actor.

#### 37. SHARED_DEVICE

Para un dispositivo compartido:

```text
principal = identidad técnica del dispositivo
actor     = humano efectivo cuando la acción lo requiera
```

La sesión técnica del dispositivo nunca es el trabajador.

#### 38. Vínculo técnico del dispositivo

Un dispositivo válido debe resolver de forma inequívoca su identidad técnica y su registro empresarial conforme a la fundación propietaria.

`auth_user_id` del dispositivo no se interpreta como `employee_id`.

#### 39. Actor de dispositivo

Un actor EMPLOYEE en dispositivo compartido requiere una relación de atribución aprobada, por ejemplo una `DEVICE_ACTOR_SESSION` vigente o evidencia equivalente gobernada.

La presencia física del dispositivo o su autenticación no crea actor.

#### 40. Sesión de actor

La sesión de actor debe conservar como mínimo identidad del dispositivo, actor, vigencia y contexto necesario.

Una sesión expirada, finalizada, revocada, ambigua o perteneciente a otro dispositivo no se reutiliza.

#### 41. Cambio de actor

Cambiar el trabajador efectivo invalida el contexto y las decisiones dependientes del actor anterior.

La siguiente acción debe reconstruir o revalidar el contexto correspondiente.

#### 42. PIN de dispositivo

Un PIN u otro mecanismo ligero puede servir como método aprobado de identificación del trabajador únicamente dentro del contrato de dispositivo.

No es una sesión Auth humana, no sustituye reautenticación fuerte y no concede privilegios por sí mismo.

#### 43. Firma de acción de dispositivo

Una firma legacy de acción puede aportar evidencia transitoria cuando su contrato la valide.

No se convierte automáticamente en `AccessContext`, `ActorEffectiveContext` o permiso. Debe conservar vínculo con dispositivo, actor, acción, objetivo, vigencia y política.

#### 44. navigation_role

`navigation_role` es información de navegación/compatibilidad legacy.

No es actor, rol efectivo canónico ni fuente de permiso.

#### 45. Administrador del dispositivo

La identidad de quien configuró, creó o administra un dispositivo no se transfiere al trabajador operativo.

```text
device administrator
≠ current actor
```

#### 46. Dispositivo sin actor

Un dispositivo puede mantener principal técnico válido y actor `UNRESOLVED`.

Las acciones cuya política exige actor humano permanecen bloqueadas. Una bandera local de conveniencia no crea excepción canónica.

#### 47. Dispositivo y techo de permisos

El dispositivo puede restringir el máximo permitido conforme al contrato propietario.

No concede un permiso que el actor no tenga y no sustituye el permiso exacto fijado por 009.

#### 48. SYSTEM_SERVICE

Un servicio interno puede ser un principal técnico `SYSTEM_SERVICE`.

La identidad técnica del runtime o el uso de credenciales privilegiadas no determina automáticamente el actor empresarial.

#### 49. Servicio autónomo

Un proceso autónomo aprobado puede resolver:

```text
actor_type = SYSTEM
attribution_source = SYSTEM_PROCESS
delegation_id = null
```

Debe existir una identidad estable y auditable del proceso, no el secreto que lo autentica.

#### 50. Servicio delegado

Un proceso puede actuar en nombre de un empleado únicamente mediante delegación explícita y verificable:

```text
actor_type = EMPLOYEE
attribution_source = SYSTEM_PROCESS
delegation_id != null
```

La delegación debe estar vigente y acotada al proceso, acción y alcance aplicables.

#### 51. Delegación implícita prohibida

No existe delegación por:

- recibir `employee_id`;
- conocer un correo;
- ejecutar con `service_role`;
- usar `createAdminClient`;
- correr en backend;
- tener owner PostgreSQL;
- haber sido invocado por un job.

#### 52. service_role

`service_role` es una credencial técnica privilegiada de Supabase.

No representa `SYSTEM`, EMPLOYEE, owner empresarial ni wildcard de permisos. Su uso exige controles de negocio explícitos.

#### 53. Supabase authenticated

El rol PostgreSQL `authenticated` demuestra una clase de sesión Data API.

No demuestra qué identidad empresarial actúa ni qué capacidad puede ejecutar.

#### 54. SECURITY DEFINER

`SECURITY DEFINER` cambia los privilegios SQL bajo los cuales se ejecuta una función.

No cambia principal ni actor empresariales. Una RPC privilegiada conserva la obligación de validar contexto y autorización antes del efecto.

#### 55. Owner PostgreSQL

El owner de una función o schema es identidad técnica de base de datos.

No se utiliza como actor de negocio y no se transforma en un usuario VENTO.

#### 56. ANONYMOUS y servicios públicos

Una superficie pública puede existir sin actor empresarial únicamente cuando su contrato lo permita.

Una mutación sensible no adopta un `user_id`, teléfono, order code o similar para simular atribución.

#### 57. Simulación

La simulación no reescribe `actor_effective`.

El actor real conserva la atribución de la solicitud de simulación y el sujeto simulado permanece en su contrato separado. Un resultado hipotético no se convierte en actor de una RPC real.

#### 58. Principal técnico en simulación

Un dispositivo, `service_role`, integración o cuenta compartida no se vuelve simulador humano por tener acceso técnico.

Las reglas propietarias de simulación siguen exigiendo actor real elegible.

#### 59. Argumentos de identidad

Toda firma de RPC incluida en el candidate clasifica cada argumento relacionado con identidad o atribución.

La clasificación se realiza por semántica, no por nombre.

#### 60. Clases de argumentos de identidad

Se utiliza un vocabulario cerrado equivalente a:

```text
TARGET_SUBJECT
RESOURCE_OWNER_INPUT
INTERNAL_DELEGATION_REFERENCE
COMPATIBILITY_ONLY
UNTRUSTED_ACTOR_SELECTOR
SERVER_DERIVED
NOT_IDENTITY
```

Ninguna clase convierte por sí sola un valor cliente en actor.

#### 61. TARGET_SUBJECT

Un `target_employee_id` puede identificar al empleado sobre el que actúa una operación administrativa.

Ese empleado es el sujeto objetivo, no necesariamente el actor. La acción sigue atribuida al caller resuelto.

#### 62. RESOURCE_OWNER_INPUT

Un identificador recibido puede servir para localizar un recurso cuya propiedad debe verificarse en servidor.

La propiedad resultante se compara con el actor canónico; el input no declara quién es el actor.

#### 63. INTERNAL_DELEGATION_REFERENCE

Una referencia de delegación solo es confiable en una frontera interna aprobada y debe resolverse contra datos autoritativos.

La existencia del ID no prueba que la delegación esté vigente o aplique.

#### 64. COMPATIBILITY_ONLY

Un parámetro legacy puede conservarse temporalmente para compatibilidad.

Debe:

- tener consumer owner;
- compararse contra el valor derivado cuando corresponda;
- no cambiar la atribución;
- tener plan de retiro;
- fallar cerrado ante mismatch.

#### 65. UNTRUSTED_ACTOR_SELECTOR

Un parámetro controlable por cliente que permite elegir quién aparece como actor se considera no confiable.

La futura adopción canónica debe eliminar su autoridad, aunque la firma se conserve transitoriamente.

#### 66. SERVER_DERIVED

Los campos de atribución persistida deben derivarse de principal/actor canónicos en servidor.

El cliente no debe poder sobrescribirlos.

#### 67. p_employee_id

`p_employee_id` puede ser target legítimo en algunos contratos, pero no se interpreta automáticamente como actor.

Si la función usa el parámetro para decidir autoridad o llenar atribución del caller, el candidate debe reclasificar y corregir esa dependencia antes del cutover.

#### 68. p_actor_id

Un argumento `p_actor_id` externo es `UNTRUSTED_ACTOR_SELECTOR` por defecto para una RPC sensible, salvo que un contrato interno específico demuestre otra clasificación segura.

La RPC no acepta la declaración del actor como hecho.

#### 69. p_user_id

`p_user_id` no se equipara a principal ni actor.

Puede ser sujeto objetivo en un proceso cliente, pero la autoridad del caller se resuelve por separado.

#### 70. created_by

Cuando `created_by` representa atribución, el valor objetivo se deriva del actor efectivo.

Un `p_created_by` suministrado por caller no puede escribir quién creó la acción salvo contrato explícito de importación histórica que lo clasifique como dato y no como autoridad.

#### 71. updated_by

`updated_by` se deriva del actor de la modificación.

La UI no decide el autor actual.

#### 72. approved_by

`approved_by` representa al actor que realmente aprobó bajo una decisión válida.

No se acepta un UUID arbitrario para registrar aprobación de tercero.

#### 73. closed_by y performed_by

Campos equivalentes de atribución siguen la misma regla:

```text
actor efectivo del efecto
→ campo de auditoría
```

No al revés.

#### 74. Campos de actor en payload JSON

La ausencia de un argumento SQL dedicado no elimina el riesgo.

Un `jsonb` puede contener `employee_id`, `actor_id`, `user_id`, `created_by` o equivalentes; el candidate debe clasificar también esos campos cuando influyan en autoridad o atribución.

#### 75. Headers empresariales

Headers como `X-Employee-Id`, `X-Actor-Id`, `X-Role` o equivalentes no son fuente de identidad solo por ser headers.

Únicamente un mecanismo criptográfico y contractual propietario podría convertir una cabecera en evidencia confiable.

#### 76. user_metadata

Los metadatos autoadministrables del usuario no son fuente de rol, empleado, actor, sede o permiso.

La RPC no resuelve actor desde valores que el usuario pueda modificar.

#### 77. app_metadata

Metadata protegida puede aportar contexto técnico solo cuando el contrato canónico la declare fuente.

No sustituye los vínculos empresariales de `AUTH-DB-019` ni el `AccessContext` completo.

#### 78. JWT

Un JWT decodificado no basta.

La identidad técnica debe provenir de una sesión/credencial validada conforme al borde de autenticación y luego resolverse empresarialmente.

#### 79. auth.uid()

`auth.uid()` es una fuente útil del sujeto Auth en sesiones compatibles.

No es una declaración canónica de EMPLOYEE. Toda dependencia legacy `employees.id = auth.uid()` se trata como compatibilidad hasta que los vínculos de R1 sean la fuente efectiva.

#### 80. UUID coincidente

Que dos UUID sean iguales no elimina sus namespaces.

La evidencia debe conservar al menos qué ID corresponde al principal y cuál al actor, aun cuando temporalmente tengan el mismo valor físico.

#### 81. Recurso propio

Una operación `OWN` compara la identidad propietaria resuelta del recurso con el actor/identidad de dominio que define el contrato.

No usa un `user_id` enviado por cliente para declarar que el recurso es propio.

#### 82. Acciones sobre terceros

En una operación administrativa sobre otra persona se mantienen separados:

```text
ACTOR
TARGET SUBJECT
RESOURCE OWNER
```

La coincidencia puede ocurrir, pero nunca se presume.

#### 83. Actor requerido

Cada operación protegida declara si exige actor efectivo.

Para mutaciones empresariales sensibles el patrón normal es `actor_required = true`; una excepción debe provenir del contrato propietario, no de la comodidad de una RPC.

#### 84. Actor no requerido

Si un proceso técnico legítimo no requiere actor humano, debe declarar qué principal y actor SYSTEM o ausencia contractual se permiten.

`resolved = false` no se transforma genéricamente en permiso para ejecutar.

#### 85. Estado del actor

Cuando el actor corresponde a una entidad con lifecycle, la operación usa su estado vigente.

Una identidad conocida pero inactiva no se convierte en `UNRESOLVED`; se conserva la identidad y se deniega conforme al estado aplicable.

#### 86. Actor eliminado o retirado

Retiro o finalización de vínculo no borra la evidencia histórica.

Las nuevas operaciones no pueden seguir utilizando autoridad derivada de un estado anterior.

#### 87. Frescura de principal

Expiración, revocación o reemplazo relevante de la sesión técnica obliga a revalidar el principal.

Una decisión anterior no se conserva solo porque `auth_user_id` continúe igual.

#### 88. Frescura de actor

Cambio de identidad de dominio, relación laboral, sesión de dispositivo, delegación o actor efectivo invalida decisiones dependientes.

La revalidación ocurre antes del efecto.

#### 89. Frescura de vínculo

Cambios en `enterprise_identity_links` o su equivalente materializado invalidan la resolución afectada.

La RPC no mantiene caches de actor independientes del token de frescura canónico.

#### 90. Frescura de dispositivo

Revocación, suspensión, cambio de endpoint o cambio de sesión de actor invalida la autoridad derivada del dispositivo.

La credencial técnica todavía válida no compensa un dispositivo empresarial inválido.

#### 91. Frescura de delegación

Una delegación expirada o revocada deja de autorizar atribución humana inmediatamente según el contrato de frescura.

No se extiende por retry ni por job reanudado.

#### 92. Frescura y permiso

La resolución de actor y la decisión de permiso deben referirse a un contexto compatible en el mismo candidate.

Un actor resuelto bajo un contexto obsoleto no se combina con un permiso recién evaluado para fabricar un ALLOW.

#### 93. Frontera transaccional

Para un efecto sensible:

```text
resolve/revalidate AccessContext
→ validate principal
→ validate actor
→ validate resource/site/area
→ bind exact permission
→ evaluate and persist required evidence
→ validate freshness/concurrency
→ execute effect
```

El orden físico puede optimizarse sin alterar estas obligaciones.

#### 94. Una resolución por request

Dentro de una evaluación atómica se reutiliza el mismo `AccessContext` canónico cuando el contrato así lo permita.

No se resuelve principal una vez y actor otra con fuentes o tiempos incompatibles.

#### 95. Operación compuesta

Una operación compuesta puede requerir varias decisiones de permiso, pero conserva principal y actor coherentes dentro de la misma unidad de ejecución o revalida antes de cada efecto cuando cambie el contexto.

#### 96. Retry

Un retry no acepta un actor alternativo después de un fallo.

Si cambió la sesión, actor, delegación o contexto, se produce una evaluación nueva.

#### 97. Idempotencia

Una clave de idempotencia no es identidad.

Debe impedir duplicados sin permitir que otro principal o actor reclame una operación previa.

#### 98. Concurrencia

Cambios concurrentes de sesión, actor, dispositivo, vínculo o estado empresarial se detectan mediante las primitivas de frescura y concurrencia propietarias.

Un resultado stale no ejecuta.

#### 99. Direct PostgREST RPC

Invocar directamente la RPC por PostgREST produce la misma validación de principal y actor que invocarla desde la UI o un backend.

La seguridad no depende de haber pasado primero por una pantalla.

#### 100. Server Action o Route Handler

Un backend que invoque la RPC no puede reenviar un `employee_id` cliente y tratarlo como actor confiable.

Debe conservar el mismo principal/actor canónico o una delegación técnica aprobada.

#### 101. Edge Function

Una Edge Function puede actuar como caller técnico o como proxy de una sesión.

En ambos casos debe declarar y validar cuál modelo aplica; no mezcla una credencial de servicio con el actor del usuario por inferencia.

#### 102. Jobs y cron

Un job puede operar como SYSTEM o bajo delegación explícita.

El nombre del job, su owner o el hecho de ejecutarse en infraestructura VENTO no crean autorización.

#### 103. RLS

010 no materializa RLS.

021 deberá consumir una semántica compatible y no tratar `auth.uid() = employee_id` como sustituto permanente del modelo de principal/actor cuando el dominio ya haya adoptado vínculos canónicos.

#### 104. Grants SQL

Los grants determinan quién puede invocar una superficie SQL.

No determinan a qué actor empresarial se atribuye la operación.

#### 105. RLS bypass y service_role

Un rol que bypassa RLS incrementa el riesgo y exige controles internos más fuertes.

No suprime la necesidad de autorización empresarial.

#### 106. Auditoría

La evidencia de una acción protegida conserva separadamente:

```text
principal_type
auth_user_id cuando aplique
session reference
actor_type
actor_id
attribution_source
delegation reference
device reference
context_id
permission_key
resource reference
decision_id
correlation_id
timestamp
```

No se colapsan principal y actor en un único `user_id`.

#### 107. Privacidad de evidencia

La auditoría conserva identificadores y hashes mínimos necesarios.

No copia tokens, PIN, secretos, JWT completos ni metadata sensible innecesaria.

#### 108. DENY

Un actor no resoluble, inactivo o incompatible puede producir una denegación contractual cuando los hechos están disponibles.

La evidencia conserva la razón sin inventar otro actor.

#### 109. Fallo técnico

Indisponibilidad del resolver, vínculo o fuente autoritativa se mantiene diferenciada de un DENY empresarial.

No se fabrica una identidad `UNRESOLVED` para ocultar una falla de infraestructura cuando el contrato exige distinguirla.

#### 110. Mensajes seguros

La respuesta pública no revela candidatos alternativos, vínculos internos, estado laboral de terceros, IDs de sesión, PIN, secretos ni estructuras completas de identidad.

La proyección pública usa códigos de error seguros.

#### 111. Matriz de binding principal/actor

Cada futura instancia conserva una fila por firma exacta y operación protegida.

Una misma función con varias ramas puede tener reglas distintas de target subject, actor requerido o delegación, pero cada rama queda explícita.

#### 112. Campos mínimos del registro

Cada fila conserva como mínimo:

```text
rpc_principal_actor_binding_id
package_id
candidate_id
transition_key
migration_unit_id
schema_name
function_name
identity_arguments
operation_branch
operation_kind
principal_required
allowed_principal_types
principal_source
actor_required
allowed_actor_types
allowed_attribution_sources
actor_resolution_source
enterprise_identity_link_reference
domain_identity_policy_reference
session_reference_policy
device_reference_policy
actor_session_reference_policy
delegation_reference_policy
identity_argument_classifications
target_subject_arguments
attribution_fields
permission_binding_reference
access_context_reference
resource_reference
site_handoff_reference
area_handoff_reference
security_mode
owner_role
execute_audience
compatibility_reference
consumer_reference
rollback_reference
adoption_state
evidence_reference
owner
```

#### 113. Estados de adopción

El registro usa un conjunto cerrado equivalente a:

```text
VALIDATED_PRINCIPAL_ACTOR
VALIDATED_SYSTEM_ACTOR
VALIDATED_NO_HUMAN_ACTOR_REQUIRED
COMPATIBILITY_ONLY
BLOCKED_UNAUTHENTICATED
BLOCKED_INVALID_PRINCIPAL
BLOCKED_ANONYMOUS
BLOCKED_ACTOR_UNRESOLVED
BLOCKED_ACTOR_AMBIGUOUS
BLOCKED_ACTOR_INACTIVE
BLOCKED_PRINCIPAL_ACTOR_MISMATCH
BLOCKED_IDENTITY_LINK
BLOCKED_DEVICE_ACTOR_SESSION
BLOCKED_DELEGATION
BLOCKED_CLIENT_ACTOR_SELECTOR
BLOCKED_DRIFT
OUTSIDE_PACKAGE
```

Los estados `BLOCKED_*` no son autorizaciones parciales.

#### 114. Cardinalidad por package

Cada candidate demuestra:

```text
protected rpc operations expected = N
classified operations = N
unclassified identity arguments = 0
client-authority actor selectors = 0
unresolved required actors = 0
ambiguous required actors = 0
principal/actor mismatches = 0
unowned compatibility paths = 0
```

`N` procede del package, no de un conteo global histórico.

#### 115. Baseline físico de Auth e identidades

El corte read-only usado para desarrollar 010 observa:

```text
auth.users = 79
public.users = 86
employees = 61
active employees = 39
employees matching auth.users by UUID = 61
employees without matching auth.users UUID = 0
employees matching public.users by UUID = 61
public.users matching auth.users by UUID = 79
```

Son hechos AS-IS y no cardinalidades objetivo.

#### 116. FK legacy de empleados

El corte actual confirma:

```text
public.employees.id
→ auth.users.id
ON DELETE CASCADE
```

La FK explica parte de la igualdad observada, pero `AUTH-DB-019` ya prohíbe convertir ese acoplamiento legacy en contrato objetivo.

#### 117. Baseline físico de dispositivos

El mismo corte observa:

```text
shared_operational_devices = 2
devices with auth_user_id = 2
devices whose auth_user_id matches auth.users = 2
actor sessions total = 0
active actor sessions = 0
active context simulations = 0
```

La ausencia actual de sesiones de actor no autoriza a usar `navigation_role` o el principal del dispositivo como trabajador.

#### 118. Baseline físico de funciones

La auditoría read-only observa en `public`, `app_private` y `api`:

```text
functions total = 248
functions using auth.uid() = 83
functions using auth.jwt() = 0
functions with identity-like arguments = 24
identity-like argument functions SECURITY DEFINER = 22
identity-like argument functions using auth.uid() = 11
identity-like argument functions without auth.uid() = 13
physical app_private.get_access_context = 0
physical app_private.evaluate_authorization = 0
```

Estos conteos se recapturan antes de materializar cada package.

#### 119. get_operational_context AS-IS

El resolver legacy acepta:

```text
p_employee_id
p_site_id
p_app_code
```

y contiene fallbacks territoriales y bypass administrativos. 010 no adopta esos argumentos como autoridad ni sus precedencias como contrato futuro.

#### 120. get_effective_context_v1 AS-IS

El resolver legacy usa `auth.uid()` y mezcla ramas real, dispositivo y simulación.

En la rama de dispositivo deriva un rol efectivo desde `navigation_role`; en la rama de simulación puede tratar el contexto simulado como efectivo. Esas divergencias son transición, no modelo canónico.

#### 121. sign_shared_device_action AS-IS

La función legacy de firma recibe `p_actor_employee_id` y/o PIN y registra `auth_user_id` del dispositivo junto a `actor_employee_id`.

Puede ser evidencia transitoria, pero el caller no obtiene autoridad para declarar libremente actor dentro del contrato objetivo.

#### 122. Riesgo observado en firma de dispositivo

La implementación AS-IS debe recapturarse antes del package: cuando el actor se resuelve por PIN en una variable interna, existen llamadas posteriores que usan el parámetro original `p_actor_employee_id`.

Ese patrón se clasifica como riesgo de reconciliación de compatibilidad; 010 no lo corrige físicamente ni lo convierte en semántica aprobada.

#### 123. verify_shared_device_action_signature AS-IS

La verificación legacy vincula firma, `auth.uid()`, app, acción, target y vigencia.

La futura adopción deberá demostrar que esa evidencia se integra correctamente al actor canónico y no permite replay, target widening ni atribución fuera de contexto.

#### 124. Funciones con p_employee_id AS-IS

El inventario actual incluye múltiples funciones con argumentos de empleado.

010 no afirma que todas sean vulnerables: cada package debe clasificar si el parámetro es target, dato de compatibilidad, selector no confiable o input interno aprobado.

#### 125. Funciones con created_by AS-IS

También existen firmas con parámetros de atribución como `p_created_by`.

Cada candidate debe demostrar si se trata de importación histórica, target metadata o autoría actual; la autoría actual se deriva del actor canónico.

#### 126. No generalización desde el baseline

Los 24 argumentos de identidad observados no definen el universo permanente.

Cada package recaptura firmas, payloads JSON, consumidores y funciones nuevas antes de su instancia.

#### 127. Drift previo a materialización

Antes de ejecutar `AUTH-DB-010::<package_id>` se recaptura:

```text
function identity
identity arguments
function body
security mode
owner
search_path
EXECUTE audience
auth/session usage
identity tables and links
device/session sources
delegation sources
consumers
catalog/context versions
migration baseline
```

Resultado:

```text
MATCH
APPROVED_DRIFT
BLOCKING_DRIFT
```

#### 128. Drift bloqueante de principal

Bloquea, salvo reconciliación aprobada:

- nueva fuente cliente de principal;
- dependencia nueva de metadata editable;
- nueva credencial técnica sin clasificación;
- sesión no verificable;
- app code que cambia política de identidad sin contrato;
- bypass por SQL role o owner.

#### 129. Drift bloqueante de actor

Bloquea:

- nuevo `p_actor_id` o equivalente con autoridad;
- selección de empleado desde body sin verificación;
- nuevo fallback por rol;
- dispositivo convertido en actor;
- simulación convertida en actor real;
- delegación sin lifecycle;
- actor ambiguo escogido por orden.

#### 130. Drift de vínculo de identidad

Bloquea una materialización si la tabla o contrato de vínculos difiere del candidate, aparecen duplicados, falta una identidad requerida o cambia la semántica de supersesión/revocación.

#### 131. Drift de audiencia

Una ampliación de `EXECUTE` a `anon`, `authenticated`, `PUBLIC` o un servicio nuevo cambia el riesgo de la superficie y debe entrar al candidate.

No se considera detalle irrelevante.

#### 132. Candidate inmutable

Cada instancia fija un `candidate_id` con:

```text
commit_sha
migration set
RPC definitions
principal/actor binding register
contract bundle
identity-link version
context version
permission/catalog version
package scope
```

Cambiar un componente material produce un nuevo candidate.

#### 133. Adopción por package

Solo se migran las RPC incluidas en el package.

Una función fuera de alcance no se reescribe porque use el mismo helper o tenga un parámetro parecido.

#### 134. Shadow comparison

Cuando el plan de transición lo permita, puede compararse:

```text
legacy principal/actor result
vs
canonical AccessContext principal/actor
```

Shadow observa diferencias; no ejecuta con la opción más permisiva.

#### 135. Divergencia en shadow

Una diferencia se clasifica y tiene owner.

No se resuelve escogiendo el actor legacy para mantener compatibilidad si el contrato canónico concluye `UNRESOLVED` o conflicto.

#### 136. Cutover

El cutover de una RPC exige:

1. R1 de identidad/contexto disponible;
2. principal source cerrado;
3. actor resolution cerrado;
4. argumentos de identidad clasificados;
5. binding de permiso de 009 válido;
6. recurso/sede/área compatibles;
7. pruebas positivas y adversariales verdes;
8. consumidor migrado;
9. evidencia y rollback preparados.

#### 137. Rollback

Rollback restaura una ruta de compatibilidad previamente aprobada cuando sea seguro.

No:

- reactiva actor ambiguo;
- acepta `p_employee_id` como autoridad temporal;
- convierte `auth.uid()` en empleado por atajo;
- borra evidencia;
- restablece privilegios más amplios que el baseline aprobado.

#### 138. Pruebas de HUMAN_USER EMPLOYEE

Se cubre al menos:

- principal válido y vínculo laboral único;
- actor EMPLOYEE correcto;
- employee inactive;
- employee missing;
- vínculo expirado/revocado;
- app incompatible;
- UUID coincidente sin vínculo objetivo después del cutover.

#### 139. Pruebas de HUMAN_USER CUSTOMER

Se cubre:

- customer único;
- identidad cliente inexistente;
- persona dual employee/customer;
- aplicación que selecciona dominio correcto;
- intento de usar privilegios laborales en contexto cliente.

#### 140. Pruebas de ambigüedad

Fixtures con múltiples candidatos deben producir `UNRESOLVED` o razón estructural aprobada.

No se acepta `LIMIT 1` como regla de resolución.

#### 141. Pruebas de principal inválido

Se cubren:

- sesión ausente;
- sesión expirada;
- sesión revocada cuando el contrato pueda comprobarla;
- sujeto no resoluble;
- tipo de principal no permitido;
- credencial de proyecto o contexto incorrectos.

#### 142. Pruebas de spoofing de cliente

Una llamada adversarial intenta alterar:

```text
auth_user_id
user_id
employee_id
actor_id
customer_id
device_id
role
created_by
updated_by
approved_by
delegation_id
```

y no cambia principal ni actor efectivos.

#### 143. Pruebas de user_metadata

Modificar metadata autoadministrable no cambia rol, actor, empleado, sede, área ni permiso.

El caso queda cubierto tanto por llamada directa como por consumer normal.

#### 144. Pruebas de dispositivo

Se cubren:

- dispositivo válido + actor válido;
- dispositivo sin actor;
- actor session expirada;
- actor de otro dispositivo;
- actor inactivo;
- cambio de actor;
- PIN incorrecto;
- firma expirada;
- replay;
- target mismatch;
- administrador del dispositivo distinto del actor.

#### 145. Pruebas de navigation_role

Cambiar `navigation_role` no cambia el actor ni crea capacidad empresarial.

Una implementación que lo use como rol efectivo canónico falla la adopción.

#### 146. Pruebas de servicio

Se cubren:

- servicio autónomo SYSTEM;
- servicio delegado EMPLOYEE válido;
- delegación inexistente;
- delegación expirada;
- delegación fuera de alcance;
- `service_role` sin contrato empresarial;
- intento de enviar employee ID como delegación implícita.

#### 147. Pruebas de simulación

Se demuestra que:

- el actor real permanece en `actor_effective`;
- el sujeto simulado no se vuelve actor real;
- una simulación no concede una mutación;
- el principal técnico no se transforma en simulador humano.

#### 148. Pruebas de target subject

Una acción administrativa sobre otro empleado conserva:

```text
actor != target employee
```

salvo coincidencia real del caso. El target no se escribe como `approved_by` o autor.

#### 149. Pruebas de campos de auditoría

El caller intenta enviar `created_by`, `updated_by` o equivalentes distintos del actor.

El servidor conserva el actor canónico o rechaza el campo según el contrato.

#### 150. Pruebas de Direct RPC

La misma operación ejecutada por PostgREST directo, UI o backend conserva principal/actor equivalentes y las mismas razones de bloqueo.

#### 151. Pruebas de SECURITY DEFINER

Una función `SECURITY DEFINER` sigue fallando si principal/actor empresarial no son válidos.

Los privilegios del owner SQL no se reflejan en el actor.

#### 152. Pruebas de authenticated

Una sesión `authenticated` sin vínculo empresarial suficiente no puede ejecutar una acción que requiera actor EMPLOYEE o CUSTOMER.

#### 153. Pruebas de frescura

Se invalidan resultados ante:

- expiración de sesión;
- cambio/revocación de vínculo;
- inactivación laboral;
- cambio de actor de dispositivo;
- revocación de dispositivo;
- revocación de delegación;
- cambio contractual relevante.

#### 154. Pruebas de concurrencia

Se fuerza un cambio de actor/vínculo entre evaluación y efecto.

La operación debe revalidar o abortar, nunca completar con atribución stale.

#### 155. Pruebas de evidencia

Se verifica que principal y actor queden correlacionables por separado y que no se registren secretos.

La evidencia de DENY y fallo técnico permanece distinguible.

#### 156. Pruebas de drift

Se cubren:

- firma nueva;
- nuevo identity arg;
- nuevo campo actor en JSON;
- nueva audiencia EXECUTE;
- cambio de FK;
- cambio de fuente de device actor;
- nueva delegación;
- cambio de resolver legacy.

#### 157. Pruebas de rollback

Después de rollback se demuestra que:

- no se pierden decisiones/auditoría;
- no revive una delegación expirada;
- no se amplía audiencia;
- no se restaura actor client-controlled;
- la compatibilidad vuelve al estado aprobado.

#### 158. Paridad con AUTH-SRV y otras capas

La misma acción protegida conserva la misma interpretación de principal y actor en acciones de servidor, RPC y RLS equivalente.

Ninguna capa puede introducir un actor alternativo para obtener una decisión distinta.

#### 159. Relación con AUTH-DB-021

021 recibe las fronteras ya cerradas por 006..010.

Al diseñar RLS/grants, no debe volver a definir principal, actor, permiso o territorio, sino consumir los contratos aprobados dentro de las capacidades técnicas de PostgreSQL/Supabase.

#### 160. Relación con AUTH-DB-011

010 no aplica constraints posteriores a backfill.

`AUTH-DB-011` conserva la responsabilidad de constraints después de reconciliación y no debe adelantarse desde esta tarea.

#### 161. Relación con auditoría

La auditoría transversal conserva principal y actor como hechos separados.

010 define qué evidencia debe llegar a esa capa, pero no materializa tablas de auditoría.

#### 162. Relación con revocación

La revocación de vínculo, sesión, dispositivo o delegación pertenece a sus tareas propietarias.

010 exige que las RPC respeten su resultado e invalidación.

#### 163. Relación con privacidad

Resolver actor no autoriza devolver perfiles completos.

Las RPC consumen identificadores y atributos mínimos necesarios para decidir y auditar.

#### 164. Relación con Pass

Una identidad cliente no se transforma en identidad laboral porque `public.users` y `employees` puedan compartir UUID hoy.

El namespace y la política de dominio permanecen explícitos.

#### 165. Relación con dispositivos compartidos

La autoridad efectiva desde un dispositivo conserva la intersección de:

```text
principal técnico válido
+
actor humano válido
+
techo del dispositivo
+
contexto
+
permiso exacto
+
territorio/recurso
+
ausencia de deny
```

Ningún componente sustituye a otro.

#### 166. Relación con simulación

La simulación conserva su propio contrato y evidencia.

010 evita que el actor simulado contamine las RPC reales y mantiene atribución al actor real.

#### 167. Relación con permisos

El actor correcto no concede capacidad.

009 conserva la selección y evaluación del permiso exacto; 010 solo asegura que la decisión se atribuye al principal/actor correctos.

#### 168. Relación con recurso y territorio

El actor se compara contra el recurso, sede y área ya resueltos.

010 no altera esos hechos para hacer coincidir asignaciones del actor.

#### 169. Relación con errores

La taxonomía propietaria debe distinguir, según corresponda:

```text
unauthenticated
invalid principal
actor unresolved
actor ambiguous
actor inactive
principal/actor mismatch
identity link failure
device actor session failure
delegation failure
technical failure
```

No se reemplaza todo por un único `permission denied`.

#### 170. Observabilidad

Métricas seguras pueden segmentar por:

- app;
- RPC;
- principal type;
- actor type;
- attribution source;
- adoption state;
- allow/deny/technical failure;
- package/candidate;
- latencia.

No incluyen tokens ni IDs personales innecesarios en labels de alta cardinalidad.

#### 171. Inventario obligatorio

Cada package produce inventario completo de sus RPC sensibles y no una muestra.

Toda firma se clasifica incluso cuando hoy parezca usar correctamente `auth.uid()`.

#### 172. Owners de hallazgos

Todo hallazgo diferido conserva:

```text
finding
blocking yes/no
owner task/package
exit condition
evidence reference
```

No quedan notas narrativas sin propietario.

#### 173. Compatibilidad temporal

La compatibilidad puede conservar firmas antiguas o igualdad de IDs mientras haya consumidores.

No puede conservar la autoridad de un argumento cliente una vez que el candidate declara adopción canónica.

#### 174. No implementación oportunista de R1

Si faltan `AUTH-DB-019`, `AUTH-DB-033`, `AUTH-DB-035` o `AUTH-DB-034` materializados para el package:

```text
BLOCK
→ resolver fundación propietaria
→ verificar
→ reanudar candidate
```

010 no crea esas fundaciones dentro de una migración R2.

#### 175. No modificación de Auth

010 no crea, elimina ni modifica cuentas, providers, sesiones, MFA, metadata o identidades de Supabase Auth.

Solo define cómo las RPC consumen el resultado canónico futuro.

#### 176. No cambio de identidad empresarial

La tarea no fusiona employees/users, no renumera IDs, no crea customer links y no migra dispositivos.

Esas responsabilidades pertenecen a R1/R2 propietarios.

#### 177. No cambio de funciones

Durante el desarrollo documental no se altera ninguna función SQL.

Los cambios de firmas o cuerpos ocurren únicamente dentro de futuras instancias físicas autorizadas.

#### 178. No cambio de grants

No se ejecutan REVOKE/GRANT.

La audiencia observada solo informa el candidate y se entrega a 021.

#### 179. No cambio de RLS

No se crean ni modifican policies.

La equivalencia futura se gobierna por 021 y las fundaciones de autorización.

#### 180. No cambio de datos

No se actualizan `employees`, `users`, `auth.users`, dispositivos, sesiones, simulaciones, grants ni registros de auditoría.

La auditoría remota usada para esta definición es read-only.

#### 181. No backfill

No se rellena ningún vínculo de identidad ni campo de actor en esta tarea documental.

Los backfills pertenecen a la materialización aprobada del package y sus tareas propietarias.

#### 182. No cambio de consumidores

No se modifica Next.js, Expo, Edge Functions ni clientes.

La futura instancia debe tratar consumidores según el candidate y el registro de adaptación correspondiente.

#### 183. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0
**Requisitos diferidos:** 0
**Requisitos obsoletos:** 0

La cobertura vigente ya exige principal y actor efectivos en toda mutación/RPC protegida, separación entre dispositivo y humano, evidencia correlacionable, invalidación por cambio de sesión/actor y bloqueo de bypass cliente. 010 convierte esas obligaciones existentes en un contrato R2 por package sin introducir una regla empresarial nueva.

#### 184. Cobertura de prueba vigente reutilizada

Esta sección es únicamente trazabilidad y no modifica el registro 04A.

Se reutiliza cobertura existente, entre otra, sobre:

- `TREQ-AUTH-004`, paridad para el mismo principal y actor;
- `TREQ-AUTH-011`, dispositivo compartido y humano real;
- `TREQ-AUTH-013`, principal y actor efectivos dentro de RPC protegidas;
- `TREQ-AUTH-014`, invalidación ante cambios de sesión, trabajador, dispositivo o rol;
- `TREQ-AUTH-015`, evidencia correlacionable de principal y actor;
- `TREQ-AUTH-019`, separación de identidad de dispositivo y actor humano;
- `TREQ-AUTH-021`, vínculo explícito del principal técnico y dispositivo;
- `TREQ-AUTH-062`, intersección entre actor, dispositivo, contexto y permiso.

No se modifica texto, owner, estado, relación ni artefacto de esas filas.

#### 185. Evidencia de validación

| Clase     | Estado       | Evidencia                                                                                                                                                                                                                                                |
| --------- | ------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED | La batería del checkout se ejecutará después de insertar la tarea en su archivo propietario.                                                                                                                                                             |
| LOCAL     | PASS         | El artefacto fue validado estructuralmente: una tarea, metadata obligatoria, secciones requeridas, cinco clases de evidencia, cero placeholders, cero referencias TREQ dentro de la sección de cero cambios y continuidad terminal.                      |
| REMOTA    | PASS         | Se verificaron `main` en `595492315e069ec285116260c02b9e634a120214`, continuidad, topología R2, 009 aprobado, contratos de principal/actor/contexto, fundaciones 019/033/034/035, 04A AUTH, scripts documentales y baseline read-only de `vento-os-dev`. |
| OPERATIVA | NOT_EXECUTED | No se invocaron flujos empresariales ni se alteraron sesiones, actores, dispositivos o consumidores.                                                                                                                                                     |
| FÍSICA    | NOT_EXECUTED | No se creó ni aplicó migración, DDL, DML, función, grant, policy, usuario, sesión, vínculo o despliegue.                                                                                                                                                 |

`REMOTA = PASS` valida el desarrollo documental y los hechos observados; no certifica una futura instancia física.

#### 186. Criterios de aceptación

010 queda documentalmente satisfecha cuando:

1. conserva `TEMPLATE_PER_PACKAGE`;
2. conserva `POST_E5_PACKAGE`;
3. la instancia futura es `AUTH-DB-010::<package_id>`;
4. recibe intacto el handoff de 009;
5. entrega a 021 sin absorber RLS/grants;
6. principal y actor permanecen separados;
7. principal procede de fuente técnica confiable;
8. actor procede de resolución empresarial canónica;
9. `auth.uid()` no se equipara permanentemente a employee;
10. igualdad legacy de UUID no es autoridad objetivo;
11. HUMAN_USER no implica EMPLOYEE;
12. HUMAN_USER puede resolver CUSTOMER por política de dominio;
13. identidad dual no se fusiona;
14. SHARED_DEVICE no actúa como trabajador;
15. actor de dispositivo exige relación vigente;
16. `navigation_role` no crea actor;
17. administrador de dispositivo no transfiere autoridad;
18. SYSTEM_SERVICE no crea business authority;
19. servicio autónomo usa actor SYSTEM válido;
20. delegación humana es explícita;
21. `service_role` no es wildcard;
22. ANONYMOUS no fabrica actor;
23. simulación no sustituye actor real;
24. actor ambiguo queda UNRESOLVED;
25. actor inactivo se distingue de no resuelto;
26. target subject se separa del actor;
27. argumentos de identidad quedan clasificados;
28. selector cliente de actor queda bloqueado;
29. campos de autoría se derivan en servidor;
30. payload JSON se inspecciona igual que argumentos escalares;
31. user metadata no concede identidad;
32. sesión y vínculo conservan frescura;
33. cambio de actor invalida contexto;
34. cambio de dispositivo invalida contexto aplicable;
35. cambio de delegación invalida autoridad;
36. retry no selecciona actor alternativo;
37. idempotencia no sustituye identidad;
38. PostgREST directo conserva la misma validación;
39. backend conserva la misma validación;
40. Edge/job declaran su modelo de principal;
41. SECURITY DEFINER no es actor;
42. authenticated no es actor;
43. RLS bypass no es actor;
44. evidencia conserva principal y actor por separado;
45. DENY y fallo técnico no se confunden;
46. registro por RPC cierra N/N;
47. drift material bloquea;
48. shadow no elige el resultado más permisivo;
49. rollback no restaura actor client-controlled;
50. no se ejecutan cambios físicos durante esta tarea documental.

#### 187. Límites

Esta tarea no:

- materializa `AUTH-DB-010::<package_id>`;
- crea migraciones;
- cambia funciones/RPC;
- crea `get_access_context`;
- crea `evaluate_authorization`;
- crea vínculos Auth;
- modifica Auth;
- modifica employees/users;
- crea sesiones de actor;
- modifica dispositivos;
- inicia simulaciones;
- crea delegaciones;
- cambia permisos;
- cambia 04A;
- cambia RLS;
- cambia grants;
- cambia schemas;
- ejecuta backfills;
- cambia consumidores;
- abre E5;
- abre `SHELL-CI-020`;
- autoriza una instancia física.

#### 188. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-DB-009 — Validar permiso exacto dentro de RPC sensibles`

**TAREA ACTUAL APROBADA**
`AUTH-DB-010 — Validar principal y actor efectivo dentro de RPC sensibles`

**SIGUIENTE TAREA RESERVADA**
`AUTH-DB-021 — Implementar políticas RLS y grants canónicos por esquema`


### ✅ AUTH-DB-021 — Implementar políticas RLS y grants canónicos por esquema

**Estado:** APROBADA
**Tarea anterior:** AUTH-DB-010 — Validar principal y actor efectivo dentro de RPC sensibles
**Tarea siguiente:** AUTH-DB-011 — Aplicar constraints después de backfills y reconciliación
**Tipo de tarea:** Documental; contrato y plantilla R2 repetible por `package_id` para materializar RLS y privilegios mínimos sobre los objetos incluidos en cada paquete
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/03_R2_MIGRACION_PROGRESIVA_POR_DOMINIO.md`
**Estado físico resultante:** Contrato `RLS-GRANTS-PACKAGE-021@1.0.0` cerrado como `TEMPLATE_PER_PACKAGE`; cada futura instancia `AUTH-DB-021::<package_id>` permanece no ejecutada hasta satisfacer las fundaciones aplicables, `E5-GATE-008::<package_id>`, `SHELL-CI-020::<package_id>` y autorización física explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`AUTH-DB-021` define el contrato repetible que cada paquete R2 utilizará para cerrar Row Level Security y privilegios PostgreSQL sobre los objetos que ese paquete migra, crea, adapta o publica.

La tarea no ejecuta SQL. Impide considerar operativo un package cuyas tablas, vistas, rutinas, schemas, policies, grants o default privileges todavía permitan una superficie más amplia, distinta o incoherente con los contratos de autorización aprobados.

#### 2. Resultado canónico

```text
PACKAGE APROBADO
→ OBJETOS EXACTOS DEL PACKAGE
→ AUTORIDAD Y AUDIENCIA CLASIFICADAS
→ RLS POR RELACIÓN
→ POLICIES POR OPERACIÓN Y ROL
→ GRANTS MÍNIMOS POR OBJETO
→ DEFAULT PRIVILEGES VERIFICADOS
→ PARIDAD CON RPC + EVALUATOR
→ PRUEBAS POSITIVAS Y NEGATIVAS
→ CUTOVER CONSUMER-AWARE
→ EVIDENCIA + ROLLBACK
```

La policy y el grant se derivan del contrato del objeto; no se copian desde el schema legacy por conveniencia.

#### 3. Contrato material producido

Se define:

```text
RLS-GRANTS-PACKAGE-021@1.0.0
```

Su unidad física futura es `AUTH-DB-021::<package_id>` y su inventario se identifica por objeto, operación, rol runtime, policy/grant objetivo y candidate.

#### 4. Topología vinculante

```text
mode = TEMPLATE_PER_PACKAGE
execution_gate = POST_E5_PACKAGE
instance = AUTH-DB-021::<package_id>
```

La definición global no se reabre por package. Cada package registra su propia instancia, evidencia y rollback.

#### 5. Gate temporal

Una futura instancia solo puede materializarse cuando, para el mismo `package_id`, estén satisfechos:

```text
R0 aplicable = VERIFIED
R1 aplicable = VERIFIED
AUTH-DB-020::<package_id> = APPLICABLE_OR_VERIFIED
E5-GATE-008::<package_id> = PASS
SHELL-CI-020::<package_id> = OPENED
physical_authorization = EXPLICIT
```

La ausencia de una condición mantiene la instancia no ejecutable.

#### 6. Frontera con AUTH-DB-020

020 define package, candidate, transition keys, migration units, compatibilidad, consumidores y rollback.

021 no amplía el package porque descubra una policy, grant o relación adyacente. Un objeto nuevo produce drift y debe reconciliarse antes de modificar seguridad.

#### 7. Handoff de AUTH-DB-006

006 entrega el inventario de RPC sensibles, adopción de `AccessContext`, audiencia y security mode.

021 asegura que policy y grant no permitan un camino directo que evite ese contexto.

#### 8. Handoff de AUTH-DB-007

007 entrega la sede real y los lados de sede del recurso.

021 no vuelve a escoger una sede desde el request ni usa `selected_site` como autoridad.

#### 9. Handoff de AUTH-DB-008

008 entrega área real, pertenencia a sede, semántica de área nula y lados aplicables.

021 no interpreta `area_id = null` como wildcard ni reconstruye autoridad desde columnas legacy.

#### 10. Handoff de AUTH-DB-009

009 entrega binding exacto de `permission_key`, modalidad, scopes, prerequisitos, resource contract, catalog version y hashes.

021 no autoriza por nombre de rol, prefijo, wildcard, `app.access` o visibilidad de pantalla.

#### 11. Handoff de AUTH-DB-010

010 entrega principal, actor efectivo, fuentes confiables de identidad, argumentos controlables por cliente, audiencia SQL, security mode, compatibilidad y evidencia.

021 no trata `auth.uid() = employee_id`, `authenticated`, `service_role` u owner PostgreSQL como autoridad empresarial universal.

#### 12. Handoff hacia AUTH-DB-011

021 entrega a 011 un candidate cuya seguridad de acceso ya es coherente con estructura y datos reconciliados.

011 conserva constraints posteriores a backfill. 021 no adelanta `NOT NULL`, FKs, uniques o checks dependientes de reconciliación.

#### 13. Fronteras posteriores

021 no absorbe:

```text
AUTH-DB-022 → Storage
AUTH-DB-023 → Realtime
AUTH-DB-024 → Edge Functions, webhooks, cron y automatizaciones
AUTH-DB-025 → índices, retención y crecimiento
AUTH-DB-026 → tipos publicados
```

Puede producir handoffs, nunca materializar esas responsabilidades.

#### 14. R0 como contención previa

`AUTH-DB-001..005` gobiernan la contención transversal de RLS faltante, policies demasiado amplias, funciones privilegiadas y grants legacy.

021 no repite ese barrido global. Consume el resultado R0 y aplica el estado final únicamente a las identidades del package.

#### 15. Fundación R1 de exposición

R1 ya fija:

```text
api
= única superficie empresarial Vento objetivo de Data API

owner schemas
app_private
audit
= no son superficie empresarial cliente
```

y limita contratos `api` a:

```text
READ_VIEW
QUERY_RPC
COMMAND_RPC
```

021 no reabre esta arquitectura.

#### 16. Grants y RLS son capas distintas

```text
SCHEMA / API EXPOSURE
+
SCHEMA PRIVILEGE
+
OBJECT GRANT
+
RLS / INTERNAL AUTHORIZATION
=
ACCESO EFECTIVO
```

Un grant permite llegar al objeto. RLS decide qué filas puede operar el rol cuando aplica. Ninguna capa sustituye a la otra.

#### 17. Unidad de inventario

Cada package produce una decisión por identidad:

```text
RELATION    = schema + relation
POLICY      = schema + relation + policy identity
VIEW        = schema + view
ROUTINE     = schema + name + identity arguments
SCHEMA      = schema
DEFAULT ACL = creator role + target schema + object class
```

No se colapsan overloads ni objetos homónimos.

#### 18. Registro RLS/grants por package

Cada futura instancia conserva, como mínimo:

```text
rls_grant_binding_id
package_id
candidate_id
transition_key
migration_unit_id
object_class
schema_name
object_name
routine_identity_arguments
logical_owner
contract_type
client_exposure_mode
required_audiences
rls_required
force_rls_mode
policy_set_reference
grant_set_reference
default_acl_reference
context_contract_reference
permission_binding_reference
site_handoff_reference
area_handoff_reference
principal_actor_reference
legacy_compatibility_reference
consumer_reference
rollback_reference
adoption_state
evidence_reference
owner
```

#### 19. Clases de relación

Cada relación aplicable queda en una clase cerrada:

```text
OWNER_AUTHORITATIVE_TABLE
OWNER_PROJECTION_TABLE
LEGACY_COMPATIBILITY_RELATION
API_READ_VIEW
AUDIT_RELATION
PRIVATE_TECHNICAL_RELATION
PLATFORM_MANAGED
OUTSIDE_PACKAGE
```

La clase determina qué controles aplican.

#### 20. Identidad de policy

Una policy se registra por:

```text
schema
relation
policy_name
command
roles
permissive_or_restrictive
using_expression
with_check_expression
```

Cambiar cualquiera puede alterar la autorización efectiva.

#### 21. Comandos RLS

Se distinguen:

```text
SELECT
INSERT
UPDATE
DELETE
ALL
```

`ALL` no se usa por comodidad cuando las operaciones tienen contratos distintos.

#### 22. SELECT

`SELECT` controla visibilidad mediante `USING`.

El conjunto visible debe coincidir con resource contract, actor, permission, scope y territorio aplicables.

#### 23. INSERT

`INSERT` usa `WITH CHECK` para validar la fila nueva.

Autenticación sola no basta: ownership, territorio y campos protegidos siguen su contrato.

#### 24. UPDATE

`UPDATE` gobierna:

```text
USING
→ fila existente operable

WITH CHECK
→ estado posterior permitido
```

Si el contrato no permite mover owner, sede o área, el estado nuevo debe impedirlo.

#### 25. SELECT requerido para UPDATE

Una operación `UPDATE` bajo RLS necesita visibilidad compatible de la fila objetivo.

El package prueba explícitamente la interacción `SELECT` + `UPDATE`; cero filas modificadas no se interpreta como autorización correcta sin diagnóstico.

#### 26. DELETE

`DELETE` usa `USING` sobre la fila existente.

La autorización se resuelve antes de perder owner, territorio o estado que la sustentan.

#### 27. FOR ALL

`FOR ALL` solo es admisible cuando audiencia, predicados y semántica sean realmente equivalentes para todas las operaciones afectadas.

Si no se demuestra, se separan policies.

#### 28. USING

`USING` forma parte de la decisión efectiva y queda versionado en evidencia.

No se sustituye por una descripción narrativa.

#### 29. WITH CHECK

`WITH CHECK` protege el estado posterior de `INSERT` y `UPDATE`.

La semántica implícita solo se acepta cuando se verifica explícitamente y coincide con el contrato.

#### 30. Roles de policy

Cada policy declara su audiencia mediante roles PostgreSQL explícitos.

La ausencia de `TO` no se usa para incluir audiencias no analizadas.

#### 31. authenticated

`TO authenticated` selecciona un rol técnico; no concede autorización empresarial.

Contexto, actor, permiso, recurso y territorio siguen siendo obligatorios cuando el contrato los exige.

#### 32. anon

`anon` recibe policies y grants únicamente para contratos expresamente públicos.

La ausencia de sesión no habilita fallbacks hacia otra identidad ni actor fabricado.

#### 33. service_role

`service_role` es infraestructura privilegiada.

No se modela como policy de negocio ni demuestra que un flujo cliente esté protegido. Los procesos que lo usan mantienen principal técnico y autorización interna.

#### 34. PUBLIC

`PUBLIC` no es audiencia empresarial Vento.

Un privilege heredado de `PUBLIC` se clasifica expresamente; nunca se asume legítimo por default PostgreSQL.

#### 35. Owner y BYPASSRLS

Un owner o rol `BYPASSRLS` no sirve como sujeto de prueba positiva de RLS.

El package prueba con roles runtime reales y registra owner, `relrowsecurity`, `relforcerowsecurity` y bypasses relevantes.

#### 36. force_rls_mode

Cada relación aplicable declara:

```text
REQUIRED
NOT_REQUIRED
NOT_APPLICABLE
BLOCKED_PENDING_DECISION
```

021 no impone `FORCE ROW LEVEL SECURITY` indiscriminadamente.

#### 37. RLS habilitado

Toda tabla alcanzable directamente desde una superficie cliente expuesta debe tener RLS habilitado.

Las tablas privadas también pueden mantener RLS como defensa en profundidad.

#### 38. RLS sin policy

```text
RLS ENABLED
+
NO CLIENT GRANT
+
NO CLIENT POLICY
```

puede ser un estado fail-closed válido para una relación privada.

021 no crea `USING (true)` solo para silenciar un advisor.

#### 39. Policies PERMISSIVE

Las policies `PERMISSIVE` aplicables pueden combinarse por OR.

El package analiza el conjunto efectivo y no cada policy aisladamente.

#### 40. Policies RESTRICTIVE

Las policies `RESTRICTIVE` actúan como guardrails acumulativos según la semántica PostgreSQL.

No se convierten mecánicamente; la elección debe proceder del contrato.

#### 41. Composición efectiva

Por rol y comando se conserva:

```text
permissive set
restrictive set
effective predicate
expected business set
```

La composición no puede ampliar el contrato y debe conservar casos legítimos.

#### 42. Predicados true

`USING (true)` o `WITH CHECK (true)` no se califican solo por sintaxis.

Requieren un contrato realmente amplio y audiencia deliberada; no se agregan como compatibilidad genérica.

#### 43. auth.role()

Las policies nuevas o modificadas no dependen de `auth.role()` para seleccionar audiencia cuando `TO` resuelve esa dimensión.

Audiencia técnica y autorización empresarial permanecen separadas.

#### 44. auth.uid()

`auth.uid()` identifica un sujeto Auth, no un empleado universal.

Solo participa directamente cuando el resource contract realmente usa ownership Auth o una fundación canónica lo consume para resolver principal.

#### 45. JWT y metadata

Claims de JWT solo participan según contratos aprobados y frescura.

`user_metadata` autoadministrable no concede rol, permiso, employee, actor, sede, área ni ownership protegido.

#### 46. Contexto canónico en RLS

Cuando una policy necesite autorización compleja, reutiliza una fundación canónica compatible y side-effect-free.

No copia en cada tabla la lógica completa de roles, turnos, scopes, sedes y áreas.

#### 47. Helper privilegiado para policy

Un helper `SECURITY DEFINER` utilizado por RLS solo puede existir como primitiva privada aprobada.

Debe estar fuera de schemas expuestos, con `search_path` endurecido, referencias calificadas, `EXECUTE` mínimo y sin convertirse en endpoint cliente.

#### 48. Recursión RLS

El package prueba que helpers y relaciones usadas por policies no generen recursión infinita, ciclos o bypass accidental.

Romper recursión nunca justifica exponer un helper privilegiado.

#### 49. Paridad con evaluator y RPC

Para el mismo actor, contexto, permission key, resource y territorio:

```text
CANONICAL EVALUATOR
RPC
RLS
```

deben producir semántica equivalente.

RLS no añade excepciones locales.

#### 50. Permission key exacta

Una policy/helper no evalúa permiso por prefijo, wildcard o nombre de rol.

El permiso procede del binding exacto de 009 o del resource contract aplicable.

#### 51. Principal y actor

La policy no permite que parámetros, columnas manipulables o headers cliente reemplacen principal y actor de 010.

El mismo modelo aplica a acceso directo Data API.

#### 52. Sede

La dimensión de sede usada por RLS debe ser la resuelta por 007 o una proyección semánticamente equivalente desde el recurso.

`selected_site` no es autoridad.

#### 53. Área

La dimensión de área conserva 008.

`null` no significa todas las áreas y `area_kind` no reemplaza la identidad concreta.

#### 54. Scopes, lanes y deny

Los scopes se comparan contra recurso y contexto canónicos.

`BASE_ONLY`, `OPERATIONAL_ONLY`, `BASE_OR_OPERATIONAL` y `BASE_AND_OPERATIONAL` conservan su semántica, y un deny aplicable no se neutraliza mediante una policy más amplia.

#### 55. Resource contract y multilado

Toda policy sensible está vinculada a un recurso/operación.

Cuando el contrato exige varios lados territoriales u ownership, se conservan todos; no se autoriza solo por el lado favorable.

#### 56. Historia, colecciones y agregados

Territorio histórico usa su snapshot contractual.

Colecciones se filtran server-side y agregados no pueden revelar filas excluidas mediante totales, conteos, diferencias o errores.

#### 57. Protección de campos

RLS controla filas, no columnas por sí sola.

Campos sensibles requieren proyección, field policy, RPC u otro mecanismo propietario. `SELECT` de una fila no autoriza todos sus campos.

#### 58. Schema USAGE

`USAGE` permite resolver objetos del namespace; no concede privilegios de objeto.

La matriz lo registra por rol/schema y evita concesiones cliente a owner schemas, `app_private` o `audit` como estado objetivo.

#### 59. Grants sobre tablas

Tablas autoritativas de owner schemas no reciben DML cliente directo como estado objetivo.

Un grant legacy temporal solo permanece con consumidor, telemetría, rollback y condición de salida.

#### 60. Grants sobre vistas

Una `READ_VIEW` publicada recibe exclusivamente `SELECT` de su audiencia contractual.

No se usa `SELECT ON ALL TABLES IN SCHEMA api` como sustituto del manifiesto.

#### 61. Grants sobre funciones

`QUERY_RPC` y `COMMAND_RPC` reciben `EXECUTE` únicamente por firma exacta y audiencia aprobada.

No se usa `GRANT EXECUTE ON ALL FUNCTIONS`.

#### 62. Sobrecargas

Cada overload de una rutina tiene identidad y grant independiente.

Publicar una firma no publica otra con el mismo nombre.

#### 63. Grants sobre secuencias

Una secuencia no se expone a roles cliente por default.

Si un flujo interno requiere privilegio, se registra rol técnico exacto y se demuestra que no crea una superficie cliente.

#### 64. Schemas privados y security_invoker

Los roles cliente objetivo no reciben `USAGE` directo sobre owner schemas, `app_private` ni `audit`.

Si una `READ_VIEW security_invoker` demuestra una dependencia técnica incompatible con esta frontera, el package queda `BLOCKED` y la contradicción se resuelve en la fundación propietaria; no se concede `USAGE` silenciosamente.

#### 65. api como destino contractual

021 puede aplicar seguridad final a objetos `api` incluidos en su package únicamente si están clasificados como:

```text
READ_VIEW
QUERY_RPC
COMMAND_RPC
```

No coloca tablas autoritativas en `api`.

#### 66. Owner schemas

Los owner schemas conservan lógica y autoridad empresarial.

Su estado objetivo es no exposición directa a clientes, grants mínimos a roles técnicos necesarios y RLS coherente como defensa o mecanismo runtime cuando corresponda.

#### 67. app_private

`app_private` aloja helpers técnicos transversales privados.

No recibe acceso cliente directo. Un helper utilizado por RLS no se convierte en RPC Data API.

#### 68. audit

`audit` conserva evidencia y no autoridad empresarial.

021 no concede acceso cliente directo a sus relaciones o rutinas.

#### 69. graphql_public

`graphql_public`, cuando sea requerido por Supabase, es superficie administrada por plataforma y no dominio empresarial Vento.

No sustituye `api` ni autoriza owner schemas.

#### 70. Transición de public

`public` puede seguir siendo superficie legacy durante migración.

021 no lo retira globalmente; cada package elimina dependencias propias cuando consumidores y fundación Data API lo permiten.

#### 71. Vistas security_invoker

Una vista contractual expuesta usa `security_invoker=true` por defecto conforme a R1.

El package prueba con rol runtime real que respeta RLS de sus fuentes y que los privilegios necesarios no abren acceso directo no aprobado.

#### 72. Vistas privilegiadas

Una vista que ejecute con privilegios del creador no se publica directamente sin excepción canónica explícita.

Las vistas privilegiadas actuales son hallazgos de transición, no patrones a copiar.

#### 73. QUERY_RPC

Una `QUERY_RPC` conserva autorización interna o acceso a fuentes protegido según su contrato.

Tener `EXECUTE` no significa permiso para cualquier fila.

#### 74. COMMAND_RPC

Una `COMMAND_RPC` valida contexto, actor, permiso, resource y estado dentro de la operación.

RLS subyacente no sustituye esa validación si la función usa privilegios que pueden bypassarlo.

#### 75. SECURITY INVOKER por defecto

Las rutinas usan `SECURITY INVOKER` por defecto cuando no requieren elevación.

No se cambia a `SECURITY DEFINER` para resolver un error de permisos.

#### 76. Excepción SECURITY DEFINER

Una excepción debe demostrar:

```text
necesidad
owner
search_path endurecido
referencias calificadas
autorización interna
audiencia exacta
grants mínimos
tests negativos
observabilidad
rollback
```

Sin el bundle queda bloqueada.

#### 77. search_path y SQL dinámico

Funciones privilegiadas no dependen de `search_path` amplio/controlable.

Dynamic SQL exige validación estricta de identificadores y ausencia de interpolación insegura; una policy externa correcta no compensa una rutina privilegiada insegura.

#### 78. Default privileges

El package verifica que default privileges de R1 no reabran acceso al crear objetos.

La revisión se realiza por:

```text
creator/owner role
schema
object class
target grantee
privileges
```

No se asume una regla global para todos los owners.

#### 79. Nuevo objeto no es endpoint

Crear tabla, vista o función no la convierte automáticamente en contrato Data API.

Exposición exige clasificación, audiencia, grant y seguridad explícitos.

#### 80. Auto-exposure de plataforma

Supabase actual permite proyectos donde tablas nuevas ya no reciben grants automáticos de Data API.

021 no depende de ese default cambiante: el estado esperado procede del manifiesto y se verifica explícitamente.

#### 81. Manifiesto de grants

Cada package genera before/after exacto:

```text
schema
object identity
grantee
privilege
source of privilege
target state
consumer
compatibility state
revoke gate
rollback
evidence
```

No se cierran grants desde una lista narrativa.

#### 82. Origen del privilege

El inventario distingue:

```text
DIRECT GRANT
ROLE MEMBERSHIP
PUBLIC INHERITANCE
DEFAULT ACL
OWNER
BYPASSRLS
PLATFORM_MANAGED
```

La ausencia de grant directo no demuestra ausencia de acceso efectivo.

#### 83. No GRANT ALL

`GRANT ALL` no es estado objetivo ni rollback genérico.

Los privileges se conceden por operación necesaria.

#### 84. Revoke consumer-aware

Toda revocación legacy sigue:

```text
privilegio observado
→ consumidor identificado
→ destino aprobado
→ consumidor migrado
→ prueba positiva destino
→ prueba negativa origen
→ revoke
```

No se revoca primero para descubrir dependencias después.

#### 85. Compatibilidad temporal

Una policy o grant legacy temporal requiere:

```text
owner
consumer set
activation condition
telemetry
sunset
exit gate
rollback
```

No admite consumidores nuevos.

#### 86. VITAL fuera de alcance

VITAL permanece fuera del alcance de Vento OS para esta tarea.

Un advisor global que reporte objetos VITAL no autoriza su modificación dentro de `AUTH-DB-021`.

#### 87. Security advisor actual

El audit read-only actual reporta RLS habilitado sin policies en:

```text
pass.site_business_hours
pass.site_delivery_slots
pass.site_schedule_exception_resolutions
pass.site_schedule_exceptions
public.client_push_tokens
```

También reporta cuatro vistas privilegiadas en `public`:

```text
shared_operational_devices_admin_v1
shared_operational_device_templates_admin_v1
permission_catalog_human_v1
shared_operational_device_actor_policies_admin_v1
```

y numerosas funciones `SECURITY DEFINER` ejecutables por `anon` o `authenticated`.

Estos hallazgos son baseline AS-IS; 021 solo actúa sobre identidades del package aplicable.

#### 88. Baseline histórico de R1

R1 registró una superficie legacy amplia de relaciones, vistas y rutinas con grants cliente.

Ese baseline es evidencia histórica. Cada instancia recaptura el before-state actual de sus propias identidades.

#### 89. Candidate inmutable

Cada instancia fija un `candidate_id` con:

```text
commit_sha
migration set
package scope
object identities
policy definitions
ACL/default ACL snapshot
R1 contract bundle
006..010 handoffs
consumer set
```

Cambiar una dimensión material crea otro candidate.

#### 90. Captura before

Antes de mutar se captura:

- `relrowsecurity`;
- `relforcerowsecurity`;
- owner;
- policies completas;
- ACL de schema;
- ACL de relación/vista;
- ACL de rutina por firma;
- default ACL;
- security mode;
- `search_path`;
- exposición Data API relevante;
- consumers;
- advisors relevantes;
- migration baseline.

#### 91. Drift

Cada identidad produce:

```text
MATCH
APPROVED_DRIFT
BLOCKING_DRIFT
```

Es drift material un cambio de policy, `USING`, `WITH CHECK`, roles, composición, owner, grantee, privilege, PUBLIC inheritance, default ACL, overload expuesta o schema USAGE.

`BLOCKING_DRIFT` detiene la identidad.

#### 92. Orden de materialización

La futura instancia sigue:

```text
1. CAPTURAR BASELINE
2. RECONCILIAR DRIFT
3. CONGELAR MANIFIESTO RLS/GRANTS
4. VALIDAR R1 + 006..010
5. MATERIALIZAR CAMBIOS EXPANSIVOS NO DESTRUCTIVOS
6. CREAR/REEMPLAZAR POLICIES OBJETIVO
7. APLICAR GRANTS OBJETIVO
8. CONSERVAR COMPATIBILIDAD NECESARIA
9. EJECUTAR PARIDAD Y TESTS ADVERSARIALES
10. MIGRAR CONSUMIDORES
11. RETIRAR PRIVILEGIOS LEGACY AUTORIZADOS
12. REVALIDAR DEFAULT ACL
13. REVALIDAR DRIFT
14. CONSERVAR EVIDENCIA Y ROLLBACK
```

#### 93. Expand antes de contract

El destino nuevo se crea y valida antes de retirar la ruta legacy.

Un estado intermedio no puede ser más permisivo que el baseline aprobado.

#### 94. Migraciones aplicadas

Una policy/grant ya desplegada no se corrige reescribiendo una migración aplicada.

La corrección usa migración forward versionada y conserva lineage.

#### 95. Shadow y paridad

Cuando el plan lo permita puede compararse:

```text
legacy result
vs
canonical result
```

Shadow observa diferencias; nunca ejecuta con la opción más permisiva.

#### 96. Cutover

Cutover exige:

1. candidate intacto;
2. R1 disponible;
3. 006..010 satisfechas;
4. policies/grants objetivo aplicados;
5. consumers destino listos;
6. pruebas positivas;
7. pruebas negativas;
8. paridad;
9. rollback listo;
10. evidencia correlacionada.

#### 97. Ventana de observación

Compatibilidad legacy solo permanece durante la ventana aprobada.

Retiro exige evidencia de cero consumidor dentro del alcance medido; una búsqueda literal aislada no basta.

#### 98. Rollback

Rollback puede restaurar policy/grant before-state capturado cuando sea seguro.

No usa `GRANT ALL`, no amplía más que el baseline, no revive `PUBLIC` genérico y no borra evidencia.

#### 99. Paridad entre ambientes

Local, staging y producción usan el mismo candidate promovible.

Policies, ACL, default ACL y configuración efectiva relevante deben ser equivalentes o tener divergencia aprobada. No se corrige producción manualmente fuera de `vento-shell`.

#### 100. Pruebas positivas

Por objeto se prueba al menos:

- lectura autorizada con filas/campos exactos;
- creación válida;
- actualización válida;
- eliminación válida cuando corresponda;
- view/RPC autorizada;
- audiencia contractual correcta;
- compatibilidad todavía aprobada.

Un `200` sin verificar resultado no es suficiente.

#### 101. Pruebas negativas de lectura

Se cubren:

- otro usuario;
- otra sede;
- otra área;
- otro owner;
- permiso ausente;
- deny;
- actor no resuelto;
- llamada directa;
- recurso aislado;
- contexto stale cuando aplique.

#### 102. Pruebas de mutaciones

Para INSERT/UPDATE/DELETE se intenta:

- owner ajeno;
- site ajeno;
- area de otra sede;
- actor fabricado;
- permiso insuficiente;
- campo protegido;
- cambio territorial no permitido;
- relación no resoluble.

El efecto no puede completarse fuera de contrato.

#### 103. Prueba de composición

Fixtures activan múltiples policies `PERMISSIVE` y `RESTRICTIVE`.

La suite demuestra el conjunto efectivo, no únicamente cada policy por separado.

#### 104. Pruebas de roles runtime

Se prueba:

```text
anon
authenticated
service process cuando aplique
```

`authenticated` sin permiso empresarial falla y un proceso privilegiado no usa bypass de RLS como sustituto de autorización.

#### 105. Direct Data API / RPC

La misma operación se invoca directamente por Data API o RPC, sin UI.

El resultado debe ser igual o más restrictivo que el consumer normal.

#### 106. Views, SECURITY DEFINER y overloads

Una `READ_VIEW` demuestra source RLS, audiencia y campos mínimos.

Toda excepción `SECURITY DEFINER` prueba caller autorizado/no autorizado, search_path y ausencia de PUBLIC accidental.

Una overload autorizada no habilita otra firma.

#### 107. Default ACL, metadata y null

El harness demuestra que un objeto nuevo no recibe privilege cliente accidental.

Cambiar `user_metadata` no cambia autorización.

`NULL` no se convierte en wildcard, globalidad u ownership.

#### 108. Territorio y deny

Fixtures cross-site/cross-area demuestran que un permiso no cruza scope.

Un deny aplicable continúa prevaleciendo aunque exista grant SQL suficiente para alcanzar el objeto.

#### 109. Rendimiento e índices

El package mide rutas críticas before/after.

Si una policy necesita índice para ser viable, 021 registra el hallazgo y lo entrega a `AUTH-DB-025` cuando corresponda; nunca elimina filtros de seguridad para recuperar rendimiento.

#### 110. Observabilidad y evidence bundle

La instancia registra, como mínimo:

1. candidate/commit;
2. objetos exactos;
3. baseline RLS;
4. policies before/after;
5. ACL before/after;
6. default ACL before/after;
7. owners;
8. security mode;
9. exposición relevante;
10. consumer map;
11. compatibilidad;
12. tests positivos;
13. tests negativos;
14. paridad evaluator/RPC/RLS;
15. performance;
16. drift final;
17. rollback;
18. digest de evidencia.

#### 111. Estados y cardinalidad

Estados cerrados equivalentes:

```text
RLS_GRANTS_ALIGNED
PRIVATE_FAIL_CLOSED
COMPATIBILITY_TEMPORARY
BLOCKED_R1_MISSING
BLOCKED_POLICY_AMBIGUOUS
BLOCKED_GRANT_AMBIGUOUS
BLOCKED_CONSUMER
BLOCKED_SECURITY_DEFINER
BLOCKED_DATA_API_CONTRADICTION
BLOCKED_DRIFT
OUTSIDE_PACKAGE
```

Y por package:

```text
objetos esperados = N
objetos clasificados = N
faltantes = 0
duplicados = 0
policies sin owner = 0
grants sin audiencia = 0
objetos BLOCKED publicados = 0
```

#### 112. No implementación oportunista de R1

Si faltan `api`, `app_private`, evaluator, identity links o predicados canónicos requeridos:

```text
BLOCK
→ resolver fundación propietaria
→ verificar
→ reanudar package
```

021 no crea R1 oportunistamente.

#### 113. No implementación global desde 021

El título no autoriza un sweep global.

Cada futura ejecución se restringe a `package_id` e identidades del candidate. Correcciones globales siguen en R0/R1 o en su owner canónico.

#### 114. Plataforma Supabase vigente

El contrato incorpora hechos verificados:

1. grants y RLS son controles separados;
2. nuevas tablas pueden requerir grants explícitos para Data API;
3. RLS debe estar habilitado en tablas expuestas;
4. views en PostgreSQL 15+ pueden usar `security_invoker=true`;
5. RLS no protege el `EXECUTE` de funciones como protege filas.

021 deriva siempre el estado esperado del manifiesto y no de defaults de plataforma.

#### 115. Ownership de hallazgos

Todo finding diferido conserva:

```text
qué falta
blocking yes/no
owner
exit condition
evidence reference
```

No se permiten pendientes narrativos sin dueño.

#### 116. Cierre de una instancia

`AUTH-DB-021::<package_id>` solo puede cerrarse cuando el 100 % del universo de seguridad aplicable tenga decisión, evidencia y estado no bloqueante.

No se cierra por muestreo.

#### 117. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

```text
Requisitos creados: 0
Requisitos modificados: 0
Requisitos diferidos: 0
Requisitos obsoletos: 0
```

La tarea materializa por package reglas ya protegidas por el registro canónico; no introduce una capacidad empresarial nueva.

#### 118. Cobertura de prueba vigente reutilizada

Esta sección es trazabilidad y no modifica 04A.

Se reutiliza especialmente:

- `TREQ-SUPABASE-005`, mínimo privilegio de vistas/RPC, `security_invoker`, `search_path`, grants y autorización interna;
- `TREQ-SUPABASE-007`, equivalencia entre evaluator, RPC y RLS;
- `TREQ-SUPABASE-008`, RLS, RPC, drift, rollback y migraciones;
- `TREQ-AUTH-004`, paridad entre evaluadores;
- `TREQ-AUTH-008`, coherencia entre contexto, RPC y RLS;
- `TREQ-AUTH-009`, territorio determinista;
- `TREQ-AUTH-013`, bloqueo de bypass mediante RPC/request manipulado.

No se modifica texto, owner, estado ni relación de esas filas.

#### 119. Evidencia de validación

| Clase     | Estado       | Evidencia                                                                                                                                                                                                                        |
| --------- | ------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED | La batería real del checkout se ejecutará después de insertar y normalizar la tarea.                                                                                                                                             |
| LOCAL     | PASS         | El artefacto fue validado estructuralmente: una tarea, metadata obligatoria, secciones requeridas, cinco clases de evidencia, continuidad terminal, cero placeholders y cero TREQ dentro de la sección que declara cero cambios. |
| REMOTA    | PASS         | Se verificaron `main`, continuidad 010→021→011, topología R2, contratos R0/R1, handoffs 006..010, 04A aplicable, `package.json`, documentación vigente de Supabase y el security advisor read-only de `vento-os-dev`.            |
| OPERATIVA | NOT_EXECUTED | No se ejecutaron requests de negocio ni cambios de consumers.                                                                                                                                                                    |
| FÍSICA    | NOT_EXECUTED | No se creó ni modificó policy, grant, schema, función, vista, tabla, default ACL, configuración Data API, migración o dato.                                                                                                      |

`REMOTA = PASS` certifica únicamente el desarrollo documental y el baseline consultado; no certifica una instancia física futura.

#### 120. Criterios de aceptación

`AUTH-DB-021` queda documentalmente completa cuando:

1. conserva `TEMPLATE_PER_PACKAGE`;
2. conserva `POST_E5_PACKAGE`;
3. define `AUTH-DB-021::<package_id>`;
4. consume el alcance de 020 y handoffs 006..010;
5. no absorbe 011 ni 022..026;
6. distingue grants de RLS;
7. inventaría todo objeto por identidad exacta;
8. define policies por comando y audiencia;
9. gobierna `USING` y `WITH CHECK`;
10. prueba SELECT requerido para UPDATE;
11. calcula composición permissive/restrictive;
12. `authenticated`, `service_role`, owner y `PUBLIC` no son autoridad empresarial;
13. force RLS es decisión explícita;
14. RLS sin policy puede ser fail-closed legítimo;
15. no crea `USING (true)` como compatibilidad genérica;
16. no usa `user_metadata` para autoridad;
17. `auth.uid()` no se equipara universalmente a employee;
18. reutiliza contexto/evaluator canónicos;
19. preserva permission key, actor, recurso, sede, área, scopes, lanes y deny;
20. protege colecciones, agregados y campos sensibles;
21. gobierna USAGE/SELECT/EXECUTE por objeto;
22. gobierna overloads por firma;
23. evita exposición cliente de owner schemas como objetivo;
24. conserva `api`, `app_private`, `audit` y VITAL en sus fronteras;
25. verifica `security_invoker`;
26. SECURITY DEFINER requiere excepción explícita;
27. endurece search_path;
28. verifica default ACL por owner;
29. nuevo objeto no se auto-publica;
30. usa manifiesto de grants;
31. no usa GRANT ALL;
32. revoca consumer-aware;
33. compatibilidad tiene owner y sunset;
34. candidate es inmutable;
35. drift bloqueante detiene;
36. no edita migraciones aplicadas;
37. expand precede contract;
38. cutover exige tests, paridad y rollback;
39. rollback no amplía baseline;
40. usa mismo candidate entre ambientes;
41. cubre pruebas positivas/negativas por operación;
42. cubre llamada directa;
43. cubre roles runtime;
44. cubre policies compuestas;
45. cubre views, RPC y overloads;
46. cubre default privileges, metadata y null;
47. cubre cross-site/cross-area y deny;
48. mide performance;
49. conserva observabilidad/evidencia;
50. reutiliza 04A sin modificarlo y no ejecuta cambios físicos.

#### 121. Límites

Esta tarea no:

- materializa `AUTH-DB-021::<package_id>`;
- crea migraciones;
- ejecuta DDL/DML;
- habilita o deshabilita RLS;
- crea, altera o elimina policies;
- concede o revoca grants;
- cambia default privileges;
- modifica owners, roles o memberships;
- modifica `supabase/config.toml`;
- cambia schemas expuestos;
- crea `api`, `app_private` u owner schemas;
- materializa context/evaluator;
- cambia Auth;
- cambia Storage;
- cambia Realtime;
- cambia Edge Functions o cron;
- crea constraints de 011;
- crea índices de 025;
- genera tipos de 026;
- modifica VITAL;
- modifica 04A;
- abre E5;
- abre `SHELL-CI-020`;
- autoriza implementación física.

#### 122. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-DB-010 — Validar principal y actor efectivo dentro de RPC sensibles`

**TAREA ACTUAL APROBADA**
`AUTH-DB-021 — Implementar políticas RLS y grants canónicos por esquema`

**SIGUIENTE TAREA RESERVADA**
`AUTH-DB-011 — Aplicar constraints después de backfills y reconciliación`


### ✅ AUTH-DB-011 — Aplicar constraints después de backfills y reconciliación

**Estado:** APROBADA
**Tarea anterior:** AUTH-DB-021 — Implementar políticas RLS y grants canónicos por esquema
**Tarea siguiente:** AUTH-DB-022 — Implementar gobierno y políticas de Storage
**Tipo de tarea:** Documental; contrato y plantilla R2 repetible por `package_id` para aplicar constraints únicamente después de backfills, reconciliación y compatibilidad verificadas
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/03_R2_MIGRACION_PROGRESIVA_POR_DOMINIO.md`
**Estado físico resultante:** Contrato `POST-BACKFILL-CONSTRAINTS-011@1.0.0` cerrado como `TEMPLATE_PER_PACKAGE`; cada futura instancia `AUTH-DB-011::<package_id>` permanece no ejecutada hasta satisfacer R0/R1 aplicables, package/E5, backfill/reconciliación, `SHELL-CI-020::<package_id>` y autorización física explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`AUTH-DB-011` define el contrato repetible por `package_id` para convertir invariantes ya reconciliadas en constraints PostgreSQL exigibles, sin adelantar restricciones sobre datos todavía ambiguos, sin perder compatibilidad necesaria y sin usar el constraint como mecanismo de descubrimiento de errores de calidad.

```text
BACKFILL / RECONCILIACIÓN CERRADOS
+ INVARIANTE APROBADA
+ UNIVERSO LIMPIO Y DEMOSTRADO
+ WRITERS COMPATIBLES
+ ROLLBACK PREPARADO
= CONSTRAINT ELEGIBLE
```

#### 2. Resultado canónico

Se define `POST-BACKFILL-CONSTRAINTS-011@1.0.0`. Cada ejecución física futura será `AUTH-DB-011::<package_id>` y contendrá exclusivamente constraints del candidate aprobado de ese package.

#### 3. Topología y gate

```text
mode = TEMPLATE_PER_PACKAGE
execution_gate = POST_E5_PACKAGE
instance = AUTH-DB-011::<package_id>
```
No existe `AUTH-DB-011::GLOBAL`. La aprobación documental no autoriza materialización física.

#### 4. Precondiciones físicas

La futura instancia requiere para el mismo package: R0/R1 aplicables verificados, 020/021 aplicables o verificados, `E5-GATE-008::<package_id> = PASS`, `SHELL-CI-020::<package_id> = OPENED`, backfill y reconciliación cerrados, y autorización física explícita.

#### 5. Frontera con AUTH-DB-020 y 021

020 aporta candidate, objetos, transition keys, migration units, consumidores, coexistencia, backfills y rollback. 021 aporta RLS/grants canónicos. 011 no amplía el package ni cambia seguridad para hacer pasar una constraint.

#### 6. Handoff de backfills

Todo constraint dependiente de transformación, crosswalk, deduplicación, derivación, cuarentena o corrección exige evidencia del backfill propietario. `DATA-NORM-TRANS-005` ya define lotes, checkpoints, reconciliación, idempotencia y rollback por unidad; 011 consume esos resultados cuando apliquen.

#### 7. Principio post-backfill

Un constraint no se usa para descubrir por primera vez filas inválidas. Antes de endurecer: `precheck exacto -> violaciones = 0 -> reconciliación = PASS -> writers compatibles -> constraint`.

#### 8. Unidad de inventario

Cada identidad conserva `package_id`, `candidate_id`, `transition_key`, `migration_unit_id`, schema, relation, nombre, clase, definición, columnas, referencia cuando aplique, modo de validación, writer/consumer compatibility, backfill/reconciliation refs, rollback, owner y evidencia.

#### 9. Cardinalidad

Por package: `constraints esperados = N`, `clasificados = N`, faltantes 0, duplicados 0, sin owner 0, sin precheck 0, sin rollback 0 y `BLOCKED` materializados 0. `N` se deriva del candidate, no del catálogo global.

#### 10. Clases de constraint

011 gobierna cuando correspondan: `CHECK`, `FOREIGN_KEY`, `UNIQUE`, `PRIMARY_KEY`, `NOT_NULL`, `EXCLUSION` y `DOMAIN_CONSTRAINT`. Cada clase conserva reglas propias.

#### 11. CHECK

Un `CHECK` se deriva de una invariante aprobada. No se crea por intuición desde valores actuales ni se eleva una regla local a global sin owner semántico.

#### 12. FOREIGN KEY

Una FK exige referenced key estable, cero huérfanos, semántica aprobada, `ON UPDATE`/`ON DELETE` aprobados, writers compatibles y rollback. IDs parecidos no demuestran relación canónica.

#### 13. UNIQUE

`UNIQUE` se aplica después de resolver duplicados y equivalencias. Coincidencia textual o normalizada no autoriza unicidad si el contrato distingue entidades legítimas.

#### 14. PRIMARY KEY

Una PK nueva o modificada exige identidad estable aprobada. 011 no reidentifica hechos históricos ni cambia claves por conveniencia.

#### 15. NOT NULL

Solo se aplica cuando `null_count = 0`, la semántica de ausencia está resuelta, writers nuevos producen valor válido, compatibilidad no requiere null y rollback está evaluado. `NULL`, vacío, desconocido, no aplica y pendiente no se colapsan.

#### 16. EXCLUSION y DOMAIN

Una exclusion constraint requiere regla explícita de solapamiento y operadores compatibles. Un domain constraint solo aplica si la misma invariante rige realmente para todos los consumidores del tipo.

#### 17. Estados de adopción

Estados cerrados: `READY_TO_CREATE`, `READY_NOT_VALID`, `READY_TO_VALIDATE`, `READY_TO_SET_NOT_NULL`, `READY_TO_ATTACH_UNIQUE`, `COMPATIBILITY_REQUIRED`, `BLOCKED_BACKFILL`, `BLOCKED_RECONCILIATION`, `BLOCKED_WRITER`, `BLOCKED_DUPLICATES`, `BLOCKED_ORPHANS`, `BLOCKED_SEMANTICS`, `BLOCKED_DRIFT`, `NOT_APPLICABLE`.

#### 18. Candidate inmutable

El candidate fija commit, migrations, objetos, constraint manifest, versiones de backfill, digests de reconciliación, writers, consumers, estado RLS/grants y rollback. Un cambio material crea otro candidate.

#### 19. Baseline remoto

El corte read-only actual de `vento-os-dev` en schemas Vento observados reporta 520 CHECK (508 validados, 12 `NOT VALID`), 726 FK (725 validadas, 1 `NOT VALID`), 261 PK y 91 UNIQUE. Es evidencia AS-IS, no el universo automático de 011.

#### 20. Constraints NOT VALID observados

Hay trece constraints no validados observados: doce CHECK y una FK, hoy ubicados en `public`. Solo entran a una instancia si su relation/transition key pertenece al package y su semántica coincide con el contrato aprobado.

#### 21. NOT VALID y VALIDATE CONSTRAINT

Cuando PostgreSQL lo permita para la clase aplicable, `NOT VALID` puede separar enforcement de nuevas escrituras de validación histórica. `VALIDATE CONSTRAINT` solo se ejecuta después de precheck y reconciliación con cero violaciones; no se usa como exploración en producción.

#### 22. NOT NULL y UNIQUE transicionales

`NOT NULL` no comparte exactamente el mismo ciclo de `NOT VALID`; el package define estrategia apropiada de bajo bloqueo. Para UNIQUE puede usarse una estrategia de índice previo/attachment cuando corresponda, preservando identidad, concurrencia, duplicate precheck y rollback.

#### 23. Orden de endurecimiento

```text
1 congelar candidate
2 capturar baseline
3 ejecutar prechecks
4 cerrar backfill
5 cerrar reconciliación
6 verificar writers/consumers
7 materializar forma transicional segura
8 validar histórico
9 elevar enforcement final
10 medir
11 recapturar drift
12 cerrar evidencia
```

#### 24. Precheck y reconciliación

Cada constraint tiene precheck determinista equivalente a su predicado, con conteo, claves, digest y corte. Reconciliación compara source expected, target actual, quarantine, rejected, unresolved y delta writes. La tolerancia final es cero violaciones no aprobadas.

#### 25. Writers y consumers

Todos los writers activos del package deben producir datos compatibles: RPC, triggers, funciones, jobs, Edge Functions, imports y escrituras directas aprobadas. Los consumers de lectura deben tolerar el estado endurecido.

#### 26. Quarantine, duplicados y huérfanos

Una fila en cuarentena no se fuerza artificialmente. UNIQUE exige cero duplicados reales según la identidad aprobada. FK exige cero huérfanos; no se crean padres sintéticos solo para hacer pasar el constraint.

#### 27. Historia y semántica de NULL

Los hechos históricos conservan su significado. Antes de presence constraints se distinguen `NULL`, `EMPTY`, `UNKNOWN`, `NOT_APPLICABLE`, `NOT_RECEIVED` y `PENDING`; solo estados semánticamente equivalentes convergen.

#### 28. Identidad, búsqueda y UOM

Nombre, email, slug o forma normalizada no son identidad automática. Representaciones de búsqueda no justifican merge/UNIQUE sin contrato. En UOM se preservan cantidad, unidad, multiplicador, contexto y fuente.

#### 29. Territorio, estados y texto

Constraints de sede/área preservan jerarquía e historia aprobadas. CHECK de estados consume catálogo/versionado estable. Checks textuales distinguen identificador técnico, valor mostrado, texto libre y valor externo; no hay regex global por tipo `text`.

#### 30. Acciones FK y deferrability

`ON DELETE`/`ON UPDATE` se derivan del ciclo de vida, no de facilidad de migración. `DEFERRABLE`/`INITIALLY DEFERRED` solo se usan cuando una transacción legítima lo requiere; el baseline consultado no mostró constraints deferrable en las clases agregadas observadas.

#### 31. RLS, triggers y generated values

RLS controla acceso y constraints integridad. Un trigger complementa solo lógica no expresable declarativamente y conserva owner propio. Columnas derivadas deben estar estabilizadas; cambiar algoritmo/version invalida candidate.

#### 32. Concurrencia, locks y timeouts

Si continúan escrituras durante backfill, debe existir high-watermark/delta o equivalente y reconciliarse antes del enforcement final. Cada DDL declara impacto de locks, ventana y timeouts. Un timeout exige determinar outcome antes de reintentar.

#### 33. Idempotencia y drift

La migración distingue constraint ausente, presente exacta, presente drifted y parcialmente validada. Drift compara nombre, tipo, definición, columnas, referencia, acciones, validación, deferrability, owner y schema. `BLOCKING_DRIFT` detiene.

#### 34. Migraciones y compatibilidad

No se reescriben migraciones aplicadas; se usa forward migration. Se aplica expand-before-contract. Una forma menos restrictiva solo permanece con consumer legítimo, owner, deadline, telemetría, salida y rollback.

#### 35. Rollback

Rollback es específico por constraint y no siempre significa `DROP CONSTRAINT`. Debe evaluar datos creados después del endurecimiento y nunca borrar evidencia de prechecks, violaciones, locks o drift.

#### 36. Validación por ambiente

Local cubre clean rebuild y upgrade desde versión soportada con fixtures válidos/inválidos. Staging usa el mismo candidate y mide locks/tiempos/rollback. Producción promueve el mismo candidate y recaptura drift antes de actuar.

#### 37. Pruebas por clase

CHECK: casos válidos/inválidos y null. FK: parent válido/ausente, ON DELETE/UPDATE y huérfanos. UNIQUE: duplicado real y duplicado aparente permitido. NOT NULL: null_count cero y escrituras null rechazadas. Todas incluyen writers reales y upgrade.

#### 38. Performance y observabilidad

Se mide costo de validación y efecto en escrituras/consultas. Si hace falta índice, el finding se entrega al owner aplicable; no se debilita integridad. Evidencia registra package/candidate, identity, digest, violaciones, duración, locks, writer failures, rollback y drift.

#### 39. Evidence bundle

Bundle mínimo: manifiesto, baseline, backfill refs, reconciliation refs, prechecks, cero violaciones, writers/consumers, DDL candidate, validación local, staging, performance, rollback, drift final y digest.

#### 40. Fronteras

El baseline remoto no autoriza un sweep. VITAL queda fuera. Schemas administrados por Supabase/PostgreSQL no se alteran por inferencia. 011 no absorbe Storage (022), Realtime (023), Edge/cron (024), índices/retención (025) ni tipos (026).

#### 41. Supabase vigente

La revisión del changelog vigente no muestra un breaking change de agosto de 2026 que cambie la semántica PostgreSQL de constraints usada aquí. La deprecación reciente de version pinning de extensiones no modifica 011.

#### 42. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

```text
Requisitos creados: 0
Requisitos modificados: 0
Requisitos diferidos: 0
Requisitos obsoletos: 0
```
La tarea materializa controles de integridad ya cubiertos por requisitos canónicos existentes.

#### 43. Cobertura de prueba vigente reutilizada

Esta sección es trazabilidad y no modifica 04A. Se reutiliza especialmente `TREQ-SUPABASE-002`, `TREQ-SUPABASE-003`, `TREQ-SUPABASE-008`, `TREQ-DATA-001` y `TREQ-DATA-003`, que ya protegen atomicidad/reconciliación, dependencia/rollback, constraints/drift, identidad estable e integridad/backfills.

#### 44. Evidencia de validación

| Clase     | Estado       | Evidencia                                                                                                                                                                                                             |
| --------- | ------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED | La batería real del checkout se ejecutará después de insertar y normalizar la tarea.                                                                                                                                  |
| LOCAL     | PASS         | Validación estructural del artefacto: una tarea, metadata obligatoria, secciones requeridas, cinco clases de evidencia, continuidad terminal, cero placeholders y cero TREQ dentro de la sección de cero cambios.     |
| REMOTA    | PASS         | Se verificaron `main`, merge de 021, active sequence 021→011→022, topología R2, owner R2, backfill plan, 04A aplicable, package.json, baseline read-only de constraints y changelog/documentación actual de Supabase. |
| OPERATIVA | NOT_EXECUTED | No se ejecutaron writers, consumers ni pruebas de negocio.                                                                                                                                                            |
| FÍSICA    | NOT_EXECUTED | No se creó, validó, alteró ni eliminó ningún constraint ni dato.                                                                                                                                                      |

#### 45. Criterios de aceptación

La tarea queda documentalmente completa si conserva topología/gate, candidate por package, exige backfill/reconciliación y cero violaciones, gobierna todas las clases aplicables, writers/consumers, quarantine, identidad, null, FK actions, locks, idempotencia, drift, forward migrations, compatibilidad, rollback, clean rebuild/upgrade, pruebas por clase, performance, evidence bundle, fronteras 022..026 y cero cambios 04A.

#### 46. Límites

No ejecuta SQL; no crea migraciones, constraints, backfills, correcciones, merges, crosswalks, RLS/grants, schemas, Auth, Storage, Realtime, Edge/cron, índices ajenos, tipos ni cambios VITAL; no modifica 04A ni autoriza implementación física.

#### 47. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-DB-021 — Implementar políticas RLS y grants canónicos por esquema`

**TAREA ACTUAL APROBADA**
`AUTH-DB-011 — Aplicar constraints después de backfills y reconciliación`

**SIGUIENTE TAREA RESERVADA**
`AUTH-DB-022 — Implementar gobierno y políticas de Storage`


### ✅ AUTH-DB-022 — Implementar gobierno y políticas de Storage

**Estado:** APROBADA
**Tarea anterior:** AUTH-DB-011 — Aplicar constraints después de backfills y reconciliación
**Tarea siguiente:** AUTH-DB-023 — Implementar canales y contratos Realtime aprobados
**Tipo de tarea:** Documental; contrato y plantilla R2 repetible por `package_id` para materializar gobierno, exposición, autorización, referencias, integridad, ciclo de vida y rollback de Supabase Storage conforme a la arquitectura canónica aprobada
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/03_R2_MIGRACION_PROGRESIVA_POR_DOMINIO.md`
**Estado físico resultante:** Contrato `STORAGE-GOVERNANCE-PACKAGE-022@1.0.0` cerrado como `TEMPLATE_PER_PACKAGE`; cada futura instancia `AUTH-DB-022::<package_id>` permanece no ejecutada hasta satisfacer fundaciones R0/R1 aplicables, `E5-GATE-008::<package_id>`, `SHELL-CI-020::<package_id>`, reconciliación de drift de Storage y autorización física explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Cerrar el contrato R2 que gobierna cómo una unidad de implementación aprobada puede materializar cambios de Supabase Storage sin convertir el estado remoto observado, el nombre de un bucket, una URL pública, una política histórica ni una credencial técnica en fuente de verdad.

La tarea transforma `SUPABASE-STORAGE-ARCHITECTURE-001@1.0.0` en una plantilla ejecutable por `package_id` y fija las condiciones que deberán cumplirse antes de crear, adoptar, endurecer, privatizar, dividir, consolidar, reubicar, versionar o retirar cualquier bucket, objeto, política, referencia o flujo de acceso incluido por un paquete.

El resultado documental debe garantizar simultáneamente:

1. identidad estable del objeto de Storage y de su registro empresarial;
2. aislamiento exacto del alcance de cada paquete;
3. privacidad por finalidad y sensibilidad;
4. publicación pública deliberada, nunca inferida;
5. autorización empresarial separada de autenticación y de privilegios técnicos;
6. políticas de `storage.objects` trazables y versionadas;
7. límites de tamaño, MIME y gramática de `object_path` verificables;
8. referencias empresariales independientes de URLs derivadas;
9. sustitución, versionado, retención, legal hold y disposición gobernados;
10. reconciliación entre fila empresarial, objeto físico y consumidores;
11. compatibilidad temporal y rollback antes de retirar el estado anterior;
12. reproducción completa del cambio desde `vento-shell`;
13. bloqueo ante drift no reconciliado;
14. evidencia por paquete suficiente para certificar el cambio sin depender de una captura aislada.

Esta tarea no materializa ningún cambio de Storage. Define el contrato que una futura instancia física deberá satisfacer.

#### 2. Resultado canónico

Se establece:

```text
STORAGE-GOVERNANCE-PACKAGE-022@1.0.0
```

como contrato R2 repetible por paquete para Storage.

El contrato produce, por cada futura instancia física autorizada:

```text
AUTH-DB-022::<package_id>
```

y únicamente puede afectar el subconjunto de identidades de Storage incluido de forma explícita en ese `package_id`.

La existencia de este contrato no autoriza por sí sola:

- cambios en `storage.buckets`;
- cambios en `storage.objects`;
- creación o eliminación de buckets;
- cambios de `public`;
- cambios de `file_size_limit`;
- cambios de `allowed_mime_types`;
- creación, sustitución o eliminación de políticas;
- copia, movimiento, renombre o eliminación de objetos;
- modificación de referencias empresariales;
- emisión o ampliación de acceso mediante URLs firmadas;
- uso de `service_role` fuera de un contrato técnico aprobado;
- limpieza, archivado o disposición;
- despliegue o promoción a ambientes remotos.

Cada una de esas acciones pertenece a una futura instancia física autorizada y cerrada por sus gates.

#### 3. Topología vinculante

`AUTH-DB-022` usa exclusivamente:

```text
mode = TEMPLATE_PER_PACKAGE
execution_gate = POST_E5_PACKAGE
cardinality = una instancia por package_id aplicable
physical_identity = AUTH-DB-022::<package_id>
```

Consecuencias:

1. no existe una instancia física global de `AUTH-DB-022`;
2. un paquete no puede modificar identidades reservadas a otro paquete;
3. un bucket compartido por varios dominios no autoriza una ejecución transversal automática;
4. si una misma identidad participa en más de un paquete, deberá existir una decisión de ownership y secuencia que impida mutaciones competidoras;
5. una instancia solo puede actuar sobre `included_storage_transition_keys` y artefactos derivados explícitamente asociados;
6. Storage no se corrige oportunísticamente mientras se ejecuta otra tarea R2;
7. una brecha detectada fuera del paquete se registra como bloqueo o carryover hacia su propietario canónico, sin absorberla.

#### 4. Gate de materialización

Una futura instancia `AUTH-DB-022::<package_id>` solo puede materializarse cuando estén verificadas, como mínimo, las siguientes condiciones:

1. fundaciones R0 aplicables al paquete en estado verificable;
2. fundaciones R1 aplicables al paquete en estado verificable;
3. package E5 cerrado y coherente con el alcance real;
4. `E5-GATE-008::<package_id>` en PASS;
5. `SHELL-CI-020::<package_id>` abierto y vinculado al mismo candidato;
6. inventario actual de Storage recapturado;
7. drift entre arquitectura aprobada, repositorio y remoto clasificado;
8. consumidores y referencias del subconjunto incluidos inventariados;
9. estrategia de compatibilidad y rollback definida;
10. pruebas negativas de seguridad definidas;
11. candidato físico inmutable identificado;
12. autorización física explícita para esa identidad.

Si una condición no se cumple, el resultado es `BLOCKED`; no se degrada a una ejecución parcial silenciosa.

#### 5. Fuentes vinculantes

La futura instancia deberá consumir, sin reinterpretarlas por conveniencia:

- `SUPABASE-STORAGE-ARCHITECTURE-001@1.0.0`;
- la clasificación y ownership vigentes de objetos y capacidades;
- el mapa de transición E3 y sus identidades estables;
- las disposiciones aprobadas de transición;
- el contrato R2 general de `AUTH-DB-020`;
- las decisiones de autorización y privilegio vigentes;
- las decisiones de constraints ya cerradas por `AUTH-DB-011`;
- los contratos E5 del `package_id`;
- el inventario remoto recapturado al momento de preparar el candidato;
- el catálogo de consumidores y referencias empresariales aplicable;
- las reglas de retención, auditoría, continuidad y recuperación ya aprobadas por sus tareas propietarias;
- la cobertura de prueba vigente del registro 04A.

El remoto describe el estado observado; no sustituye una decisión canónica. La arquitectura aprobada describe el objetivo; no sustituye la recaptura del remoto. La instancia física debe reconciliar ambos.

#### 6. Frontera con tareas R2 vecinas

La responsabilidad se distribuye así:

| Tarea         | Responsabilidad                                                                                                 |
| ------------- | --------------------------------------------------------------------------------------------------------------- |
| `AUTH-DB-020` | transición general de objetos por dominio, coexistencia, subset por paquete y compatibilidad                    |
| `AUTH-DB-021` | RLS y grants canónicos de objetos empresariales fuera de la responsabilidad específica de Storage               |
| `AUTH-DB-011` | constraints posteriores a backfills y reconciliación                                                            |
| `AUTH-DB-022` | buckets, políticas de `storage.objects`, acceso, referencias, límites, lifecycle y transición física de Storage |
| `AUTH-DB-023` | canales y contratos Realtime aprobados                                                                          |
| `AUTH-DB-024` | Edge Functions, webhooks, cron y automatizaciones                                                               |
| `AUTH-DB-025` | índices, retención y crecimiento conforme a sus decisiones propietarias                                         |
| `AUTH-DB-026` | generación y distribución de tipos para consumidores                                                            |

`AUTH-DB-022` puede exigir como prerequisito una decisión de retención, un permiso, un consumidor, un job o un tipo; no puede redefinir su semántica si pertenece a otra tarea.

#### 7. Línea base arquitectónica y recaptura obligatoria

`SUPA-ARC-018` congeló como línea base arquitectónica un corte de catorce buckets, ocho públicos y seis privados, junto con objetos, referencias, clases, accesos y disposiciones.

Ese corte es una identidad histórica aprobada de arquitectura, no una declaración eterna del remoto.

La verificación read-only realizada durante el desarrollo de esta tarea confirmó que el proyecto remoto mantiene catorce buckets, pero su conjunto nominal, visibilidad y configuración ya no coincide de forma literal con el corte histórico de `SUPA-ARC-018`.

Por tanto, cada futura instancia debe ejecutar una recaptura propia y clasificar cada diferencia como exactamente uno de estos estados:

```text
MATCHES_APPROVED_BASELINE
APPROVED_DRIFT
BLOCKING_DRIFT
```

Reglas:

1. `MATCHES_APPROVED_BASELINE` exige identidad y propiedades compatibles con el contrato aprobado;
2. `APPROVED_DRIFT` exige una transición, adopción, renombre, reemplazo o decisión posterior identificable que explique la diferencia;
3. `BLOCKING_DRIFT` cubre todo bucket, política, configuración, objeto o referencia cuya diferencia no tenga procedencia y destino canónicos;
4. un nombre parecido no demuestra continuidad de identidad;
5. un bucket nuevo no hereda automáticamente el contrato del bucket histórico que parece reemplazar;
6. un bucket histórico ausente no se considera retirado sin evidencia de consumidores, referencias, datos, reemplazo y rollback;
7. una diferencia de `public`, límite, MIME o política es material aunque el nombre del bucket coincida;
8. la mutación queda bloqueada mientras exista `BLOCKING_DRIFT` dentro del subconjunto.

#### 8. Identidad y subset por paquete

Cada instancia deberá producir una matriz cerrada de Storage con una fila por identidad incluida.

La fila mínima contiene:

```text
package_id
storage_transition_key
current_bucket_id
approved_identity_state
storage_class
lifecycle_status
public_flag
object_count
total_bytes
file_size_limit_bytes
allowed_mime_types
policy_fingerprint
business_reference_count
business_metadata_owner
current_consumers
target_disposition
compatibility_gate
rollback_contract
verification_state
```

La matriz debe distinguir:

- identidades incluidas;
- identidades heredadas pero no modificadas;
- identidades bloqueadas;
- identidades fuera de alcance;
- identidades observadas sin reconciliación.

No se permite resumir varios buckets o políticas bajo una sola fila genérica si sus decisiones difieren.

#### 9. Identidad estable de transición

Las identidades aprobadas por E3 se conservan aunque cambie el nombre físico o exista una fase de coexistencia.

Para buckets históricos mapeados por transición, la clave estable conserva el patrón lógico:

```text
TRANS::STORAGE_BUCKET::bucket_id_aprobado
```

Una identidad remota que no corresponda inequívocamente a una transición aprobada debe pasar por adopción o reconciliación explícita antes de ser tratada como continuidad del objeto histórico.

Queda prohibido:

- renombrar una transición por semejanza de nombre;
- fusionar dos identidades sin decisión de transición;
- reutilizar una transición retirada para un bucket nuevo;
- ocultar una creación remota tratándola como simple rename;
- modificar fuera del subset una identidad compartida.

#### 10. Clases canónicas de Storage

Toda identidad materializada debe resolver exactamente una clase primaria:

```text
PUBLIC_BRAND_MEDIA
PUBLIC_CATALOG_MEDIA
PUBLIC_REFERENCE_DOCUMENT
PRIVATE_BUSINESS_RECORD
PRIVATE_PERSONAL_RECORD
PRIVATE_HIGHLY_RESTRICTED_RECORD
PRIVATE_TECHNICAL_MEDIA
PRIVATE_TRANSIENT_INGEST
```

La clase no se infiere del nombre del bucket, de la aplicación que lo usa, del flag `public`, de la extensión del archivo ni de una policy existente.

La clase determina, como mínimo:

- sensibilidad;
- modos de acceso permitidos;
- posibilidad o prohibición de publicación;
- límites y MIME admisibles;
- requisitos de auditoría;
- tratamiento de derivados;
- compatibilidad con retención y legal hold;
- pruebas negativas obligatorias.

#### 11. Modos de acceso

Se conservan cuatro modos canónicos:

| Modo                  | Uso contractual                                                                       |
| --------------------- | ------------------------------------------------------------------------------------- |
| `PRIVATE_SERVER_ONLY` | proceso confiable con principal técnico mínimo, owner y finalidad explícitos          |
| `PRIVATE_AUTHORIZED`  | actor autenticado y autorizado para el recurso, territorio, sensibilidad y finalidad  |
| `SIGNED_EPHEMERAL`    | capacidad temporal para objeto y operación exactos, con expiración y alcance acotados |
| `PUBLIC_PUBLISHED`    | distribución abierta únicamente de una versión deliberadamente publicada              |

Reglas:

1. `SIGNED_EPHEMERAL` no vuelve público el bucket;
2. `PUBLIC_PUBLISHED` no vuelve públicas las mutaciones;
3. autenticación válida no equivale a `PRIVATE_AUTHORIZED`;
4. una URL conocida no concede acceso;
5. `service_role` no crea por sí mismo un modo de acceso empresarial;
6. todo acceso efectivo debe ser compatible con la clase primaria del objeto.

#### 12. Roles canónicos de objeto

Todo objeto materializado debe resolver un rol:

```text
SOURCE_ORIGINAL
PUBLISHED_DERIVATIVE
PREVIEW_DERIVATIVE
EVIDENCE_ATTACHMENT
IMPORT_PAYLOAD
EXPORT_RESULT
TRANSIENT_UPLOAD
```

Reglas vinculantes:

1. `SOURCE_ORIGINAL` permanece privado salvo decisión explícita en contrario;
2. `PUBLISHED_DERIVATIVE` conserva vínculo con fuente, transformación y versión;
3. `PREVIEW_DERIVATIVE` reduce exposición o detalle sin reemplazar la fuente;
4. `EVIDENCE_ATTACHMENT` respalda un hecho empresarial y no lo sustituye;
5. `IMPORT_PAYLOAD` y `EXPORT_RESULT` tienen lifecycle independiente;
6. `TRANSIENT_UPLOAD` no se convierte en registro disponible hasta completar verificación y finalización;
7. un objeto no cambia de rol silenciosamente por moverlo entre prefijos.

#### 13. Contrato mínimo de bucket

Cada bucket físico incluido deberá resolver una fila contractual con los campos aprobados por arquitectura:

```text
bucket_contract_id
bucket_id
storage_class
lifecycle_status
public_flag
business_metadata_owner_schema_id
participating_owner_schema_ids
allowed_object_roles
allowed_access_modes
allowed_mime_types
file_size_limit_bytes
path_grammar_version
upload_contract
read_contract
mutation_contract
derivative_policy
replacement_and_version_policy
retention_class_allowlist
legal_hold_policy
disposition_policy
current_consumers
compatibility_gate
observability_contract
rollback_contract
test_requirement_ids
```

Ningún campo puede quedar implícito en la UI, el SDK o el Dashboard.

El bucket solo puede declararse conforme cuando el remoto, la definición versionada y la fila contractual sean compatibles.

#### 14. Referencia empresarial canónica

La identidad empresarial de un archivo no será una URL.

La referencia mínima conserva:

```text
business_record_id
record_version_id
storage_provider
bucket_id
object_path
object_role
```

Cuando aplique, también conserva clasificación, hash, tamaño, MIME, versión, actor, timestamps, procedencia, retención, hold, disposición y relación con derivados.

Consecuencias:

1. una URL pública es una presentación derivada;
2. una signed URL es una capacidad efímera;
3. cambiar dominio, CDN, bucket o mecanismo de entrega no debe cambiar la identidad empresarial;
4. toda transición debe reconciliar referencias antes y después del cambio;
5. una fila sin objeto y un objeto sin fila se tratan como estados de integridad, no como residuos ignorables.

#### 15. Gramática de `object_path`

La gramática canónica de nueva generación conserva la estructura lógica:

```text
v1/{owner_schema}/{entity_type}/{entity_id}/{record_type}/{record_id}/v{record_version}/{object_role}/{opaque_object_id}.{safe_extension}
```

Reglas:

1. `bucket_id` usa minúsculas ASCII y guiones;
2. segmentos semánticos usan tokens canónicos, no texto libre;
3. `entity_id`, `record_id` y `opaque_object_id` son opacos y no contienen PII;
4. el nombre original permanece metadata de presentación;
5. un `object_path` reservado es inmutable;
6. una nueva versión recibe una identidad nueva;
7. `auth.uid()` puede participar en autorización, pero no es el único owner semántico;
8. se prohíben `..`, backslash, slash inicial, doble slash, segmentos vacíos y extensiones fuera de allowlist;
9. un cambio de gramática requiere versión y compatibilidad explícitas;
10. un repath no puede romper referencias activas ni ocultar objetos huérfanos.

#### 16. Contrato de carga

Toda carga deberá resolver antes de aceptar bytes:

1. actor o principal efectivo;
2. finalidad;
3. recurso empresarial propietario;
4. `bucket_contract_id`;
5. clase de Storage;
6. `object_role`;
7. `object_path` reservado;
8. límite de bytes;
9. allowlist MIME;
10. cuota, frecuencia o concurrencia cuando aplique;
11. política de sustitución;
12. requerimiento de auditoría;
13. condición de expiración si es temporal.

Después de la carga se comprueba:

- objeto exacto existente;
- bytes;
- MIME declarado y detectado;
- extensión;
- hash cuando aplique;
- referencia empresarial;
- estado de verificación;
- ausencia de duplicado o colisión no aprobada.

Un upload exitoso a nivel SDK no equivale a finalización empresarial.

#### 17. Límites de tamaño y MIME

Todo bucket activo debe declarar:

```text
file_size_limit_bytes
allowed_mime_types
```

Reglas:

1. la ausencia de límite o allowlist exige decisión explícita y no puede considerarse segura por omisión;
2. UI y cliente no son el único control;
3. extensión, MIME declarado y MIME detectado deben ser coherentes;
4. PDF, SVG, imagen, video, archivo comprimido y documento se tratan según clase y riesgo;
5. los objetos legacy fuera de límite se inventarían y clasifican antes de modificar el límite;
6. reducir un límite no autoriza borrar objetos existentes;
7. aumentar un límite exige justificación y prueba;
8. nuevas cargas fuera del contrato deben fallar;
9. los límites físicos remotos deben reconciliarse con la definición versionada.

#### 18. Publicación pública

El plano público se materializa únicamente mediante el flujo:

```text
SOURCE_ORIGINAL PRIVADO
        ->
APROBACION DE DOMINIO Y PRIVACIDAD
        ->
DERIVADO PUBLICABLE VERIFICADO
        ->
PUBLISHED_DERIVATIVE EN PLANO PUBLICO
        ->
REFERENCIA VERSIONADA Y REVERSIBLE
```

No se puede inferir publicación desde:

- bucket actualmente público;
- URL ya distribuida;
- acceso anónimo histórico;
- necesidad de CDN;
- uso en una pantalla pública;
- existencia de una policy SELECT abierta.

Un bucket público debe mantener mutaciones protegidas por capacidad funcional. Leer públicamente no concede INSERT, UPDATE ni DELETE.

#### 19. Privatización

Cuando la disposición aprobada sea `PRIVATIZE_REQUIRED`, la instancia debe demostrar antes del corte:

1. inventario completo de objetos;
2. inventario completo de referencias;
3. consumidores actuales e históricos relevantes;
4. mecanismo privado de lectura;
5. mecanismo de carga compatible;
6. signed URLs o equivalente temporal cuando corresponda;
7. paridad funcional;
8. cero dependencia necesaria de URL pública;
9. estrategia de rollback;
10. observación posterior;
11. eliminación de exposición residual únicamente después de probar compatibilidad.

No se permite privatizar primero y reparar consumidores después.

#### 20. Fuentes privadas y derivados públicos

Para `SPLIT_PRIVATE_SOURCE_PUBLIC_DERIVATIVE`:

1. la fuente original queda en plano privado;
2. el derivado público tiene identidad, transformación y versión;
3. la aplicación consumidora distingue fuente de presentación;
4. el retiro de un derivado no elimina la fuente;
5. la regeneración produce nueva versión o reemplazo auditable;
6. privacidad, consentimiento o base aplicable se evalúan antes de publicar;
7. cache/CDN no se convierte en fuente de verdad.

#### 21. Políticas de `storage.objects`

Toda política creada, adoptada o modificada por una instancia deberá estar versionada en `vento-shell` y declarar:

```text
bucket_id
operation
database_role
authorization_contract
resource_binding
path_constraints
using_expression
with_check_expression
owner
consumers
rollback
test_cases
```

Reglas:

1. SELECT, INSERT, UPDATE y DELETE se evalúan de forma independiente;
2. `authenticated` por sí solo no concede mutación;
3. el nombre de un rol base no sustituye un permiso funcional;
4. conocer `bucket_id` o un prefijo no concede acceso;
5. ownership técnico no equivale a ownership empresarial;
6. una policy no puede depender de una condición cliente manipulable como única defensa;
7. las capacidades para crear, sustituir y borrar deben ser coherentes o tener una asimetría aprobada;
8. las policies remotas sin procedencia bloquean el cierre hasta adopción o reemplazo;
9. el fingerprint del conjunto de policies se compara antes y después.

#### 22. Autorización empresarial

Las operaciones privadas y las mutaciones públicas deberán resolver autorización con el contrato canónico vigente para:

- principal;
- actor efectivo;
- permiso exacto;
- recurso;
- sede cuando aplique;
- área cuando aplique;
- finalidad;
- sensibilidad;
- vigencia.

Storage no define una segunda taxonomía de permisos.

Cuando la operación dependa de un servicio o helper autorizado, el helper debe fallar cerrado y conservar la relación con el actor o principal que originó el comando.

Una política RLS de Storage no puede conceder más de lo que el contrato empresarial permite para el mismo actor, recurso y contexto.

#### 23. `service_role` y actores técnicos

`service_role` es un mecanismo técnico privilegiado; no es una identidad empresarial ni una aprobación de acceso.

Toda operación server-side privilegiada debe declarar:

1. proceso propietario;
2. caller técnico;
3. finalidad;
4. recurso afectado;
5. actor humano o razón de ausencia cuando aplique;
6. alcance de bucket y operación;
7. idempotencia;
8. auditoría;
9. política de retry;
10. rollback o compensación.

Queda prohibido usar `service_role` para evitar diseñar autorización, ownership, auditoría o disposición.

#### 24. Acceso firmado

`SIGNED_EPHEMERAL` debe emitir una capacidad limitada a:

```text
object_identity
operation
authorized_subject_or_purpose
expires_at
issuance_context
```

Reglas:

1. la autorización se verifica antes de emitir la capacidad;
2. la capacidad no cambia `public_flag`;
3. el TTL se define por sensibilidad y finalidad en el contrato aplicable;
4. no se persiste la signed URL como fuente de verdad;
5. no se amplía a un prefijo completo si el contrato requiere objeto exacto;
6. renovación exige reevaluación cuando el contexto pueda haber cambiado;
7. logs no exponen el token completo;
8. revocación, sustitución o disposición del objeto invalida la continuidad de uso según el contrato.

#### 25. Sustitución y versionado

La sustitución de un archivo no se modela como sobrescritura opaca.

Cada contrato debe definir uno de estos comportamientos:

- nueva versión inmutable;
- reemplazo controlado con historial;
- derivado regenerable;
- objeto temporal descartable;
- publicación reversible.

La instancia debe conservar:

- versión anterior cuando el contrato lo exija;
- vínculo entre versiones;
- referencia activa;
- hash o fingerprint;
- actor y causa;
- timestamps;
- consumidores afectados;
- rollback.

Un `upsert` técnico no demuestra que la semántica empresarial de sustitución sea correcta.

#### 26. Retención, legal hold y disposición

`AUTH-DB-022` materializa los controles de Storage necesarios para respetar decisiones de retención; no inventa plazos legales ni políticas empresariales que pertenezcan a sus tareas propietarias.

Cada bucket debe consumir:

```text
retention_class_allowlist
legal_hold_policy
disposition_policy
```

Reglas:

1. un objeto bajo legal hold no se elimina por un cleanup genérico;
2. expiración técnica y disposición autorizada no son sinónimos;
3. archivo, backup y objeto activo son planos distintos;
4. una policy DELETE no constituye por sí sola una política de disposición;
5. la eliminación debe dejar evidencia suficiente de autorización, alcance y resultado;
6. las excepciones de retención tienen owner, fundamento y condición de salida;
7. limpieza automática solo se habilita cuando el contrato de retención aplicable ya está cerrado.

#### 27. Integridad fila-objeto

Para todo recurso con referencia empresarial se validan ambos sentidos:

```text
business_reference -> storage_object
storage_object -> business_owner_or_explicit_orphan_state
```

La instancia debe detectar:

- referencia sin objeto;
- objeto sin referencia cuando se esperaba referencia;
- duplicado activo;
- versiones incompatibles;
- carga abandonada;
- ownership inválido;
- bucket desconocido;
- `object_path` no canónico;
- referencia persistida como URL;
- mismatch de hash, tamaño o MIME cuando esos campos sean contractuales.

La detección no autoriza eliminación automática.

#### 28. Reconciliación y objetos huérfanos

Todo huérfano se clasifica antes de actuar y su registro debe indicar:

- por qué existe;
- si corresponde a una carga temporal esperada, una referencia faltante, un objeto legacy, una versión sustituida o un estado todavía desconocido;
- owner responsable;
- consumidores potenciales revisados;
- retención y legal hold aplicables;
- evidencia que permitiría conservarlo, reconciliarlo o disponerlo;
- condición exacta de salida.

La detección de un huérfano no equivale a autorización de borrado. La disposición depende del contrato de retención, consumidores, backups, legal hold, evidencia y autorización correspondiente.

#### 29. Copia, movimiento, repath y consolidación

Una transición de Storage no se implementa eliminando únicamente metadata SQL ni cambiando solo una referencia.

Para mover, copiar, repath o consolidar se requiere:

1. inventario fuente;
2. destino aprobado;
3. capacidad suficiente;
4. copia verificable;
5. hash o equivalencia adecuada;
6. metadata empresarial reconciliada;
7. referencias actualizadas de forma idempotente;
8. compatibilidad temporal para consumidores;
9. observación;
10. rollback;
11. retiro de la fuente únicamente al cerrar el gate.

Si la operación queda en estado incierto, la instancia debe conservar ambas identidades y abrir reconciliación; no declara éxito por ausencia de error del cliente.

#### 30. Disposiciones arquitectónicas

Las disposiciones aprobadas que una instancia puede consumir son:

```text
KEEP_PUBLIC_CONTRACTED
KEEP_PRIVATE_CONTRACTED
PRIVATIZE_REQUIRED
SPLIT_PRIVATE_SOURCE_PUBLIC_DERIVATIVE
HARDEN_PRIVATE_POLICY
HARDEN_PUBLIC_CONTRACT
EMPTY_BUCKET_CONTRACT_REVIEW
CONSOLIDATION_OR_REPATH_CANDIDATE
```

La disposición es una intención arquitectónica, no una operación automática.

Cada uso debe resolver qué cambia, qué permanece, qué consumidores migran, cómo se prueba paridad y cómo se revierte.

#### 31. Buckets vacíos

Un bucket con cero objetos no se considera automáticamente inútil, seguro ni retirado.

Antes de adoptar o retirar un bucket vacío se comprueba:

- finalidad;
- owner;
- productor esperado;
- consumidores;
- configuración;
- policies;
- referencias potenciales;
- contratos E5;
- despliegues no ejercitados;
- retención;
- historial de uso;
- transición aprobada.

La ausencia temporal de objetos no sustituye esa evaluación.

#### 32. Declaración versionada en `vento-shell`

Toda configuración de Storage gobernada por Vento debe quedar representada de forma reproducible en `vento-shell`.

La fuente versionada debe permitir reconstruir o comprobar, según corresponda:

- buckets;
- `public_flag`;
- límites;
- MIME;
- policies;
- funciones auxiliares de autorización;
- contratos de referencia;
- gramática de `object_path`;
- seeds o configuración inicial aprobada;
- manifiestos complementarios cuando `db diff` no represente el recurso;
- rollback;
- fingerprints de drift.

El Dashboard remoto no es fuente canónica de cambios.

#### 33. Migraciones de Supabase

Toda mutación física de Supabase perteneciente a una instancia `AUTH-DB-022::<package_id>` debe:

1. originarse en `vento-shell`;
2. estar versionada;
3. tener orden determinista;
4. declarar objeto y operación;
5. ser idempotente cuando el mecanismo lo permita;
6. evitar depender de estado manual no registrado;
7. preservar datos y referencias durante transición;
8. incluir rollback o estrategia compensatoria;
9. ejecutarse primero en el ambiente autorizado por el gate;
10. demostrar paridad con el candidato aprobado.

Cambios manuales detectados en remoto deben adoptarse o revertirse mediante una decisión versionada antes de cerrar la instancia.

#### 34. Candidato físico

La instancia debe congelar un candidato con, como mínimo:

```text
package_id
source_commit
storage_manifest_hash
migration_set
policy_set_hash
bucket_contract_hash
reference_snapshot_hash
consumer_snapshot_hash
remote_baseline_hash
rollback_artifacts
validation_plan
```

La evidencia de pruebas y la promoción deben referirse al mismo candidato.

Si cambia una migración, policy, manifiesto, referencia contractual o artefacto que altere el comportamiento, el candidato cambia y las pruebas afectadas se repiten.

#### 35. Pruebas negativas mínimas

Toda instancia que afecte acceso debe demostrar, según su alcance:

- `anon` denegado donde el objeto no sea público;
- `authenticated` sin permiso denegado;
- actor correcto con recurso incorrecto denegado;
- sede incorrecta denegada cuando aplique;
- área incorrecta denegada cuando aplique;
- path manipulado denegado;
- bucket alterno denegado;
- extensión o MIME no permitido denegado;
- objeto sobre límite denegado;
- operación distinta a la firmada denegada;
- signed URL vencida o inválida denegada;
- mutación pública denegada sin permiso funcional;
- borrado bajo hold denegado;
- referencia a objeto inexistente detectada;
- objeto no reconciliado no retirado.

No basta probar solo el caso permitido.

#### 36. Pruebas positivas mínimas

Cuando el contrato lo permita, se demuestra:

- upload autorizado;
- lectura privada autorizada;
- publicación deliberada;
- signed access acotado;
- sustitución o nueva versión;
- reconciliación de referencia;
- retry idempotente;
- rollback;
- lectura por consumidores autorizados;
- paridad antes y después de la transición.

El conjunto exacto depende del `package_id`; no se ejecutan casos irrelevantes para inflar evidencia.

#### 37. Observabilidad y auditoría

La instancia debe poder correlacionar:

```text
package_id
candidate
actor_or_principal
business_record
bucket_id
object_path
operation
outcome
correlation_id
timestamp
```

La observabilidad no registra tokens firmados completos, secretos ni contenido sensible innecesario.

Se debe distinguir:

- intento;
- aceptación técnica;
- finalización empresarial;
- compensación;
- reconciliación;
- disposición.

Un log de éxito del SDK no sustituye la evidencia del resultado empresarial.

#### 38. Rollback

Antes de ejecutar una mutación se define el estado de retorno verificable.

El rollback debe cubrir, según el cambio:

- definición del bucket;
- privacidad;
- límites y MIME;
- policies;
- referencias;
- consumidor;
- objeto fuente y destino;
- versión activa;
- derivado público;
- configuración server-side.

Reglas:

1. no se elimina la última copia válida antes de cerrar paridad;
2. un rollback no puede reexponer contenido privado sin decisión explícita;
3. si el cambio de consumidor ya fue promovido, la reversión incluye compatibilidad del consumidor;
4. un objeto nuevo creado durante una ejecución fallida se clasifica antes de limpiarse;
5. un resultado incierto abre reconciliación y bloquea nuevas mutaciones sobre la misma identidad.

#### 39. Compatibilidad temporal

Cuando existan consumidores desplegados de forma independiente, la transición debe soportar una ventana compatible.

Mecanismos permitidos según el paquete:

- lectura dual controlada;
- referencia compatible;
- alias temporal de identidad;
- copia temporal;
- derivado paralelo;
- adapter server-side;
- fallback explícito y medido.

Todo mecanismo temporal declara:

- owner;
- consumidor;
- condición de activación;
- telemetría;
- fecha o condición de retiro;
- rollback.

No se deja compatibilidad indefinida por omisión.

#### 40. Frontera con el lifecycle físico

Esta tarea no redefine los estados ni las transiciones de `implementation-control`.

La futura instancia `AUTH-DB-022::<package_id>` deberá usar el lifecycle físico vigente y adjuntar a cada transición la evidencia de Storage exigida por este contrato.

En particular:

1. un estado físico no puede interpretarse como conformidad de Storage si el subset conserva drift bloqueante;
2. una reversión física debe conservar causa, residual y evidencia del estado retornado;
3. la certificación final debe referirse al mismo candidato, remoto y subset que superaron las pruebas;
4. cualquier transición de lifecycle permanece subordinada al control físico canónico y no se inventa dentro de este documento.

#### 41. Handoff de salida

Al finalizar una instancia `AUTH-DB-022::<package_id>` se entrega a tareas posteriores y consumidores un handoff con:

- identidades modificadas;
- identidades heredadas;
- contratos de bucket vigentes;
- referencias canónicas vigentes;
- public/private final;
- policies y fingerprints;
- compatibilidad aún activa;
- consumidores migrados;
- consumidores pendientes con owner;
- rollback cerrado o todavía disponible;
- drift residual;
- evidencia de seguridad;
- candidato verificado.

La tarea siguiente no debe reconstruir este estado desde el remoto por inferencia.

#### 42. Requisitos de prueba derivados

NO GENERA REQUISITOS DE PRUEBA.

**Requisitos creados:** 0
**Requisitos modificados:** 0
**Requisitos diferidos:** 0
**Requisitos obsoletos:** 0

La tarea materializa en R2 obligaciones de Storage que ya están protegidas por el registro canónico; no introduce una capacidad empresarial ni una regla de prueba nueva.

#### 43. Cobertura de prueba vigente reutilizada

Esta sección es únicamente trazabilidad y no modifica el registro 04A.

Se reutiliza especialmente la cobertura existente sobre:

- `TREQ-SUPABASE-003`: ownership, consumidores, datos, reemplazo, rollback y gate antes de retirar o declarar operativo un bucket;
- `TREQ-SUPABASE-004`: archivos sensibles privados y acceso temporal auditable;
- `TREQ-SUPABASE-155`: contrato canónico por bucket;
- `TREQ-SUPABASE-156` a `TREQ-SUPABASE-169`: privacidad, referencias, disposición, políticas, límites, paths e integridad de Storage;
- `TREQ-SUPABASE-256`: recursos administrados o de configuración fuera de la cobertura completa de `db diff`;
- `TREQ-SUPABASE-264`: declaración versionada y drift de buckets y policies;
- `TREQ-SUPABASE-282`: procedencia y prueba de policies de imágenes;
- `TREQ-SUPABASE-388` a `TREQ-SUPABASE-391`: retención, huérfanos, optimización y continuidad de Storage;
- `TREQ-SUPABASE-418`: contrato tipado de bucket, path, metadata y referencia;
- `TREQ-SUPABASE-428`: capacidad, owner, productores, consumidores, sensibilidad, visibilidad y lifecycle de los buckets;
- `TREQ-SUPABASE-449`: coherencia entre sensibilidad, exposición, owner y consumidores;
- `TREQ-SUPABASE-454`: integridad del mapa canónico que incluye Storage.

La cobertura vigente es suficiente para verificar la plantilla y sus futuras instancias sin modificar 04A en esta tarea.

#### 44. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                                                                                                                                                                                                             |
| --------- | -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | La batería local del repositorio no se ejecutó durante la preparación documental; deberá ejecutarse sobre el checkout de la tarea.                                                                                                                                                                                                    |
| LOCAL     | NOT_EXECUTED   | No se ejecutaron migraciones, emulador, stack local ni pruebas locales de Storage durante esta tarea documental.                                                                                                                                                                                                                      |
| REMOTA    | PASS           | Se verificaron read-only el repositorio canónico vigente, la arquitectura Storage aprobada y el catálogo remoto de `vento-os-dev`; el remoto mantiene 14 buckets pero presenta drift nominal y de configuración respecto del corte histórico de `SUPA-ARC-018`, por lo que la plantilla exige recaptura y reconciliación fail-closed. |
| OPERATIVA | NOT_APPLICABLE | La tarea no altera flujos operativos ni consumidores en ejecución.                                                                                                                                                                                                                                                                    |
| FÍSICA    | NOT_EXECUTED   | No se creó, modificó, privatizó, movió, eliminó ni reconfiguró ningún bucket, objeto, policy, referencia o ajuste de Supabase.                                                                                                                                                                                                        |

#### 45. Criterios de aceptación

- [ ] Existe exactamente un contrato `STORAGE-GOVERNANCE-PACKAGE-022@1.0.0`.
- [ ] La topología es `TEMPLATE_PER_PACKAGE`.
- [ ] La identidad física válida es `AUTH-DB-022::<package_id>`.
- [ ] El gate temporal es `POST_E5_PACKAGE`.
- [ ] Ninguna instancia global está autorizada.
- [ ] El subset de Storage se expresa mediante identidades estables y filas individualizadas.
- [ ] El remoto se recaptura antes de cada candidato.
- [ ] Todo drift se clasifica como `MATCHES_APPROVED_BASELINE`, `APPROVED_DRIFT` o `BLOCKING_DRIFT`.
- [ ] `BLOCKING_DRIFT` impide mutaciones sobre el subconjunto afectado.
- [ ] Toda identidad resuelve clase, acceso, rol de objeto, owner y consumidores.
- [ ] Todo bucket incluido resuelve el contrato mínimo aprobado por `SUPA-ARC-018`.
- [ ] Toda referencia empresarial separa identidad de objeto y URL derivada.
- [ ] La gramática de `object_path` es versionada, opaca y sin PII.
- [ ] Todo bucket activo declara límites y MIME o una excepción aprobada.
- [ ] La publicación pública exige decisión y derivado publicable.
- [ ] La lectura pública no concede mutación pública.
- [ ] Las policies de `storage.objects` quedan versionadas, trazables y probadas por operación.
- [ ] `service_role` no sustituye autorización ni auditoría empresarial.
- [ ] `SIGNED_EPHEMERAL` permanece acotado a objeto, operación y expiración.
- [ ] Sustitución y versionado conservan historia y rollback según contrato.
- [ ] Retención y legal hold se consumen desde decisiones propietarias; no se inventan plazos en esta tarea.
- [ ] Se valida integridad en ambos sentidos entre referencia y objeto.
- [ ] Los huérfanos se clasifican antes de cualquier disposición.
- [ ] Move, copy, repath y consolidación conservan compatibilidad y rollback.
- [ ] Toda mutación Supabase se origina y versiona en `vento-shell`.
- [ ] Candidato, fingerprints y evidencias pertenecen a la misma revisión.
- [ ] Existen pruebas positivas y negativas proporcionales al paquete.
- [ ] El handoff final identifica cambios, residual, compatibilidad y rollback.
- [ ] La tarea crea 0 TREQ y modifica 0 TREQ.
- [ ] La tarea no ejecuta cambios físicos durante su aprobación documental.

#### 46. Límites

Esta tarea no:

- ejecuta una instancia `AUTH-DB-022::<package_id>`;
- autoriza una instancia física;
- decide qué package E5 debe ejecutarse primero;
- convierte el corte histórico de `SUPA-ARC-018` en fotografía remota actual;
- declara canónicos los nombres de buckets observados actualmente por el solo hecho de existir;
- adopta automáticamente drift remoto;
- cambia Auth, permisos o contexto canónico fuera de los contratos que consume;
- redefine la responsabilidad general de RLS de `AUTH-DB-021`;
- redefine constraints de `AUTH-DB-011`;
- implementa Realtime de `AUTH-DB-023`;
- implementa Edge Functions, webhooks o cron de `AUTH-DB-024`;
- inventa plazos de retención o estrategia de crecimiento reservados a sus propietarios;
- genera tipos de consumidor reservados a `AUTH-DB-026`;
- elimina objetos huérfanos por detección;
- convierte una signed URL en referencia permanente;
- usa el Dashboard como fuente de cambios;
- cambia Supabase fuera de `vento-shell`;
- avanza a la tarea siguiente sin cierre documental válido.

---

#### 47. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-DB-011 — Aplicar constraints después de backfills y reconciliación`

**TAREA ACTUAL APROBADA**
`AUTH-DB-022 — Implementar gobierno y políticas de Storage`

**SIGUIENTE TAREA RESERVADA**
`AUTH-DB-023 — Implementar canales y contratos Realtime aprobados`


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
