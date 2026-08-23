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


### [ ] AUTH-DB-006 — Incorporar contexto canónico en RPC sensibles
### [ ] AUTH-DB-007 — Validar sede dentro de RPC sensibles
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
