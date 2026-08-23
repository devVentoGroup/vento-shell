### R1 — Fundación física canónica

<!-- EXECUTION-GATE-RECONCILIATION:B201-400:R1 -->
#### Reconciliación topológica de R1

Las once tareas de R1 materializan la fundación física canónica compartida de autorización, contexto, identidad y auditoría.

| Propiedad     | Valor                   |
| ------------- | ----------------------- |
| modalidad     | `GLOBAL_ENABLE_ONCE`    |
| gate temporal | `PRE_E5_FOUNDATION`     |
| identidad     | `<task_id>::GLOBAL`     |
| prerequisito  | R0 aplicable verificado |
| autorización  | explícita por instancia |

R1 puede materializarse antes de E5 porque crea infraestructura canónica reutilizable por múltiples paquetes y no una migración vertical de un `package_id`.

La materialización inicial no autoriza migrar dominios, ejecutar backfills empresariales, cambiar datos propios de una aplicación ni considerar aprobado un paquete consumidor. Esos cambios permanecen en R2, normalización física, integraciones físicas y sus gates post-E5.

### ✅ AUTH-DB-016 — Crear esquemas empresariales aprobados

**Estado:** APROBADA
**Tarea anterior:** AUTH-DB-005 — Revocar grants innecesarios de anon
**Tarea siguiente:** AUTH-DB-018 — Separar vistas y RPC expuestas de helpers internos
**Tipo de tarea:** Documental
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/02_R1_FUNDACION_FISICA_CANONICA.md`
**Estado físico resultante:** Contrato de materialización de los 29 schemas objetivo Vento cerrado; futura instancia global `AUTH-DB-016::GLOBAL` pendiente de autorización explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`AUTH-DB-016` define el contrato único para materializar la topología de schemas objetivo aprobada para Vento OS sin adelantar migración de objetos, datos, grants, exposición Data API, RLS, funciones, consumidores ni transición de dominios.

La tarea convierte en una futura fundación física reproducible las decisiones arquitectónicas ya cerradas en E3:

```text
26 OWNER SCHEMAS CANÓNICOS
+ api
+ app_private
+ audit
= 29 SCHEMAS OBJETIVO GOBERNADOS POR VENTO
```

La existencia del namespace no concede por sí misma autoridad empresarial, exposición, acceso cliente ni autorización para mover objetos.

---

#### 2. Resultado canónico

Queda definido el siguiente resultado:

```text
AUTH-DB-016
→ contrato documental de creación y reconciliación de schemas

AUTH-DB-016::GLOBAL
→ única futura instancia física global

resultado físico esperado de esa instancia
→ los 29 schemas objetivo existen con identidad exacta
→ ningún schema objetivo falta
→ ningún schema objetivo se duplica
→ ningún schema legacy se elimina por inferencia
→ ningún objeto empresarial se mueve por esta unidad
→ ningún rol cliente obtiene acceso nuevo por esta unidad
```

La tarea no crea una segunda arquitectura de schemas. Materializa únicamente la topología aprobada por `SUPA-ARC-003`, `SUPA-ARC-005`, `SUPA-ARC-006` y `SUPA-ARC-007`.

---

#### 3. Topología y gate

La reconciliación vigente del Bloque R establece:

```text
mode = GLOBAL_ENABLE_ONCE
execution_gate = PRE_E5_FOUNDATION
instance = AUTH-DB-016::GLOBAL
prerequisite = R0 aplicable verificado
```

Consecuencias:

1. existe como máximo una instancia física global;
2. no se crea una instancia por paquete;
3. la fundación puede existir antes de E5 porque es reutilizable por múltiples paquetes;
4. la aprobación documental no autoriza la instancia física;
5. la instancia no puede migrar dominios ni ejecutar backfills empresariales;
6. la instancia no puede considerar aprobado ningún paquete consumidor;
7. toda materialización posterior conserva autorización humana explícita, migración versionada, pruebas y recuperación.

---

#### 4. Fuentes vinculantes y precedencia

La definición consume y preserva:

- `SUPA-ARC-001`, para separación entre schemas administrados y gobernados por Vento;
- `SUPA-ARC-002`, para los 26 dominios empresariales estables;
- `SUPA-ARC-003`, para `VSCHEMA-001..026` y los 26 nombres físicos de owner schema;
- `SUPA-ARC-004`, para retirar a `public` de la autoridad empresarial objetivo;
- `SUPA-ARC-005`, para `api` como única capa empresarial objetivo de contratos expuestos;
- `SUPA-ARC-006`, para `app_private` como capa técnica privada;
- `SUPA-ARC-007`, para `audit` como capa transversal durable de auditoría y eventos;
- `SUPA-ARC-015`, para exposición, grants, RLS, default privileges y roles runtime;
- `SUPA-ARC-025`, para gobierno integral, drift y trazabilidad;
- `AUTH-DB-015`, para migraciones versionadas y manifiesto;
- `AUTH-DB-027`, para harness de esquema, integridad, RLS, RPC y migraciones;
- `AUTH-DB-028`, para baseline y drift por ambiente;
- `AUTH-DB-029`, para backup, restore y rollback;
- `AUTH-DB-001..005`, para la contención RLS, policies, funciones privilegiadas y grants de roles cliente.

Precedencia:

```text
ARQUITECTURA E3 APROBADA
→ fija identidades y semántica

R0
→ garantiza reproducibilidad, pruebas, drift y recuperación

AUTH-DB-016
→ crea o reconcilia exclusivamente los namespaces objetivo

AUTH-DB-018 / AUTH-DB-017 / tareas posteriores
→ materializan separación, exposición y privilegios
```

---

#### 5. Universo exacto de 29 schemas objetivo

La arquitectura objetivo gobernada por Vento tiene cardinalidad exacta **29**.

##### 5.1. Owner schemas `VSCHEMA-001..026`

| ID            | Schema objetivo          | Dominio propietario                                               |
| ------------- | ------------------------ | ----------------------------------------------------------------- |
| `VSCHEMA-001` | `org_governance`         | `VDOM-001` — Gobierno organizacional                              |
| `VSCHEMA-002` | `recruiting`             | `VDOM-002` — Reclutamiento y selección                            |
| `VSCHEMA-003` | `workforce`              | `VDOM-003` — Vinculación y ciclo laboral                          |
| `VSCHEMA-004` | `work_scheduling`        | `VDOM-004` — Programación y novedades laborales                   |
| `VSCHEMA-005` | `attendance`             | `VDOM-005` — Asistencia y tiempo trabajado                        |
| `VSCHEMA-006` | `payroll`                | `VDOM-006` — Nómina y beneficios laborales                        |
| `VSCHEMA-007` | `operational_compliance` | `VDOM-007` — Salud, seguridad, inocuidad y cumplimiento operativo |
| `VSCHEMA-008` | `product_catalog`        | `VDOM-008` — Producto maestro y especificaciones                  |
| `VSCHEMA-009` | `recipes`                | `VDOM-009` — Recetas y conocimiento productivo                    |
| `VSCHEMA-010` | `commercial_offer`       | `VDOM-010` — Oferta comercial y disponibilidad                    |
| `VSCHEMA-011` | `procurement`            | `VDOM-011` — Abastecimiento y proveedores                         |
| `VSCHEMA-012` | `inventory`              | `VDOM-012` — Inventario y almacenamiento                          |
| `VSCHEMA-013` | `assets`                 | `VDOM-013` — Activos, mantenimiento y reutilizables               |
| `VSCHEMA-014` | `production`             | `VDOM-014` — Producción y calidad de lote                         |
| `VSCHEMA-015` | `sales_orders`           | `VDOM-015` — Pedidos y operación de venta                         |
| `VSCHEMA-016` | `payments`               | `VDOM-016` — Pagos, caja y soporte fiscal                         |
| `VSCHEMA-017` | `customer_engagement`    | `VDOM-017` — Clientes, fidelización y experiencia                 |
| `VSCHEMA-018` | `logistics`              | `VDOM-018` — Logística, transporte y entrega                      |
| `VSCHEMA-019` | `finance`                | `VDOM-019` — Finanzas y control económico                         |
| `VSCHEMA-020` | `facilities`             | `VDOM-020` — Instalaciones y condiciones físicas                  |
| `VSCHEMA-021` | `marketing`              | `VDOM-021` — Comunicación, marketing y oportunidades              |
| `VSCHEMA-022` | `technology_operations`  | `VDOM-022` — Tecnología y soporte                                 |
| `VSCHEMA-023` | `identity_access`        | `VDOM-023` — Identidad empresarial y autorización                 |
| `VSCHEMA-024` | `business_records`       | `VDOM-024` — Información documental y evidencia                   |
| `VSCHEMA-025` | `business_insights`      | `VDOM-025` — Medición, analítica y mejora                         |
| `VSCHEMA-026` | `operational_continuity` | `VDOM-026` — Continuidad operativa e incidentes de servicio       |

Reglas:

1. los 26 nombres son identidades físicas objetivo aprobadas;
2. existe relación uno a uno entre `VSCHEMA-*` y `VDOM-*`;
3. un owner schema gobierna fuentes autoritativas de su dominio;
4. el schema no es una aplicación ni se deriva del nombre de una aplicación;
5. la creación del namespace no crea tablas ni declara implementado el dominio.

##### 5.2. Tres schemas transversales no propietarios

| Schema        | Clase                                 | Autoridad empresarial | Finalidad                                                        |
| ------------- | ------------------------------------- | --------------------- | ---------------------------------------------------------------- |
| `api`         | `VENTO_EXPOSED_CONTRACT_LAYER`        | ninguna               | contratos canónicos expuestos de lectura y comando               |
| `app_private` | `VENTO_PRIVATE_TECHNICAL_LAYER`       | ninguna               | helpers, adaptadores y lógica técnica interna no expuesta        |
| `audit`       | `VENTO_TRANSVERSAL_AUDIT_EVENT_LAYER` | ninguna               | auditoría, eventos durables, outbox y evidencia de procesamiento |

Estos tres schemas no reciben `VSCHEMA-*` y no se convierten en dominios.

---

#### 6. Cardinalidades vinculantes

La futura instancia debe cerrar exactamente:

```text
owner schemas esperados = 26
owner schemas materializados = 26
schemas transversales esperados = 3
schemas transversales materializados = 3
total objetivo = 29
faltantes = 0
duplicados = 0
```

Además:

```text
dominios asignados = 26/26
procesos con owner schema lógico = 69/69
procesos con dos owner schemas = 0
procesos sin owner schema = 0
```

Estas cardinalidades describen la arquitectura. No autorizan mover las relaciones actuales a sus destinos.

---

#### 7. Línea base remota vigente

La observación read-only del proyecto `vento-os-dev` muestra:

```text
target_schema_count = 29
existing_target_count = 2
missing_target_count = 27
```

Schemas objetivo ya existentes:

| Schema        | Clase objetivo       | Owner PostgreSQL observado | Tratamiento                                                               |
| ------------- | -------------------- | -------------------------- | ------------------------------------------------------------------------- |
| `app_private` | capa técnica privada | `postgres`                 | conservar namespace; reconciliar sin recrear                              |
| `payments`    | `VSCHEMA-016`        | `postgres`                 | conservar namespace; no interpretar sus objetos actuales como ya migrados |

Los otros **27** schemas objetivo todavía no existen físicamente.

La existencia de `payments` solo satisface la identidad del namespace. No demuestra que todos sus objetos actuales pertenezcan al owner schema objetivo ni que su transición esté completada.

---

#### 8. Schemas actuales no equivalentes a la arquitectura objetivo

La línea base física mantiene también schemas gobernados por Vento o legacy:

```text
club
pass
pos
public
talento
viso
vital
```

Reglas:

1. `club`, `pass`, `pos`, `public`, `talento` y `viso` no se convierten en owner schemas objetivo por existir actualmente;
2. ninguno se elimina, renombra, vacía o fusiona por `AUTH-DB-016`;
3. sus objetos permanecen donde están hasta las tareas de transición propietarias;
4. `public` continúa como compatibilidad transitoria sin autoridad empresarial objetivo;
5. `vital` pertenece a una frontera de producto separada y permanece fuera de los 26 owner schemas de Vento OS;
6. crear los nuevos namespaces no altera el comportamiento de esos schemas legacy.

---

#### 9. Semántica de un owner schema vacío

Un owner schema puede existir físicamente antes de contener su fuente autoritativa.

Por tanto:

```text
SCHEMA EXISTE
≠ DOMINIO MIGRADO
≠ FUENTE MATERIALIZADA
≠ DATOS MIGRADOS
≠ CONSUMIDORES MIGRADOS
≠ CONTRATO API ACTIVO
```

Los dominios actualmente sin fuente canónica pueden recibir su namespace objetivo como fundación, pero permanecen sin fuente hasta que una tarea propietaria materialice sus objetos y datos.

Esto aplica especialmente a dominios cuya arquitectura E3 clasificó como `NO_CANONICAL_SOURCE`, `FUTURE_OR_PARTIAL` o equivalentes.

---

#### 10. Identidad y naming

Los nombres de los 29 schemas son cerrados.

Reglas:

1. se usan exactamente los identificadores de la sección 5;
2. no se singularizan, pluralizan, abrevian ni traducen;
3. no se usan nombres de aplicaciones como sustitutos;
4. no se crean aliases de schema;
5. no se crean variantes por ambiente;
6. no se añaden prefijos `vento_`, `app_`, `domain_` ni equivalentes;
7. no se reutilizan nombres legacy para representar un owner schema distinto;
8. cualquier cambio futuro de nombre exige modificación arquitectónica explícita, no una decisión de migración local.

---

#### 11. Frontera de ownership PostgreSQL

El owner PostgreSQL de un namespace es una identidad técnica y no la autoridad empresarial del dominio.

Esta tarea no inventa un rol técnico nuevo de ownership y no usa como equivalencia:

```text
postgres owner
= business owner
```

La futura materialización usará la identidad de ejecución de migraciones soportada y gobernada por la plataforma y por `vento-shell`, sin convertir `postgres`, `supabase_admin`, `service_role`, un usuario humano o un rol cliente en principal empresarial.

Si una política posterior introduce roles técnicos dedicados de ownership, su tarea propietaria deberá gobernar esa transición. `AUTH-DB-016` no crea roles ni memberships.

---

#### 12. Creación fail-closed

La creación de un schema nuevo debe partir sin exposición cliente implícita.

Invariantes de esta tarea:

1. no se concede `CREATE` a `PUBLIC`, `anon` ni `authenticated`;
2. no se concede `USAGE` a `anon` ni `authenticated` por el solo hecho de crear el namespace;
3. no se concede acceso a tablas, secuencias o funciones porque todavía no pertenecen a esta tarea;
4. no se añaden schemas a Data API;
5. no se cambia `extra_search_path` global;
6. no se crean default privileges amplios;
7. no se copia ACL de un schema legacy a uno objetivo;
8. una diferencia de privilegios inesperada bloquea la materialización hasta clasificación.

La asignación positiva de exposición y privilegios pertenece a `AUTH-DB-017`, `AUTH-DB-004`, `AUTH-DB-005` y contratos posteriores según audiencia.

---

#### 13. `api` como namespace, no como exposición

`AUTH-DB-016` puede materializar en el futuro la existencia del schema `api`, pero no habilitarlo como Data API.

Separación obligatoria:

```text
AUTH-DB-016
→ existencia del namespace api

AUTH-DB-018
→ separación de vistas/RPC expuestas y helpers internos

AUTH-DB-017
→ configuración de schemas expuestos y privilegios de Data API
```

Por tanto, después de `AUTH-DB-016::GLOBAL`, `api` puede existir físicamente y seguir teniendo cero contratos y cero acceso cliente.

---

#### 14. `app_private` como namespace privado

`app_private` ya existe físicamente y se adopta como identidad objetivo de la capa técnica privada.

Esta tarea:

- no lo recrea;
- no mueve helpers hacia él;
- no cambia funciones existentes;
- no concede acceso cliente;
- no interpreta todo objeto existente en `app_private` como automáticamente conforme;
- no convierte `app_private` en owner schema.

La clasificación y movimiento de lógica interna pertenecen a las tareas de separación y transición correspondientes.

---

#### 15. `audit` como namespace transversal

`audit` es el único schema transversal objetivo para auditoría, eventos durables, outbox y evidencia de procesamiento.

Su creación futura por esta instancia:

- no crea tablas de auditoría;
- no migra historias existentes;
- no mueve eventos actuales;
- no crea outbox, inbox ni workers;
- no concede acceso directo cliente;
- no convierte la evidencia en fuente empresarial;
- no absorbe hechos autoritativos de los owner schemas.

La topología física posterior debe conservar que `audit` tiene autoridad empresarial igual a ninguna.

---

#### 16. Frontera con objetos y datos

`AUTH-DB-016` tiene alcance de namespace exclusivamente.

Quedan fuera:

- tablas;
- vistas;
- materialized views;
- secuencias;
- funciones;
- procedimientos;
- tipos y enums;
- triggers;
- policies RLS;
- grants de objetos;
- índices;
- constraints;
- datos;
- backfills;
- Storage;
- Realtime;
- Edge Functions;
- cron;
- secretos;
- consumidores.

La futura migración de esta instancia no debe convertirse en un paquete de dominio encubierto.

---

#### 17. Frontera con `AUTH-DB-018`

`AUTH-DB-018` es propietaria de separar vistas y RPC expuestas de helpers internos.

Esta tarea no decide por objeto:

```text
api
vs
app_private
vs
owner schema
vs
audit
vs
compatibilidad legacy
```

Solo garantiza que los namespaces destino aprobados puedan existir antes de esa separación.

---

#### 18. Frontera con `AUTH-DB-017`

`AUTH-DB-017` es propietaria de configurar schemas expuestos y privilegios de Data API.

Por tanto, `AUTH-DB-016` no modifica:

- `api.schemas`;
- `extra_search_path`;
- exposición PostgREST;
- exposición GraphQL;
- `USAGE` para roles cliente;
- `SELECT` o `EXECUTE` de contratos;
- grants positivos de runtime;
- políticas de acceso de contratos.

Existencia física y exposición permanecen decisiones distintas.

---

#### 19. Frontera con RLS y grants

La existencia de un namespace no reemplaza controles de acceso.

```text
SCHEMA
+ ACL DE SCHEMA
+ ACL DE OBJETO
+ RLS
+ AUTORIZACIÓN EMPRESARIAL
= capas independientes
```

`AUTH-DB-001` a `AUTH-DB-005` conservan sus responsabilidades de contención. Esta tarea no reabre ni modifica esas decisiones.

Un schema vacío no necesita policies RLS; RLS pertenece a relaciones materializadas posteriormente.

---

#### 20. Estrategia de futura materialización

La instancia `AUTH-DB-016::GLOBAL` deberá usar una migración forward versionada en `vento-shell`.

Secuencia contractual:

```text
1. RECONCILIAR LOS 29 NOMBRES OBJETIVO
2. RECONCILIAR EXISTENCIA REMOTA
3. CLASIFICAR LOS 2 NAMESPACES YA EXISTENTES
4. CREAR ÚNICAMENTE LOS NAMESPACES OBJETIVO AUSENTES
5. NO ALTERAR OBJETOS LEGACY
6. NO AMPLIAR ACL NI EXPOSICIÓN
7. VALIDAR CARDINALIDAD 29/29
8. VALIDAR PARIDAD Y DRIFT
9. CONSERVAR EVIDENCIA Y RECUPERACIÓN
```

La migración debe ser determinista respecto del conjunto objetivo y no depender de nombres inferidos desde el remoto.

---

#### 21. Idempotencia y reconstrucción limpia

La fundación debe ser reproducible en:

- reconstrucción limpia;
- upgrade desde la línea base soportada;
- entorno que ya contenga `app_private` y `payments`;
- ejecución repetida del harness de verificación sin producir cambios adicionales.

La estrategia no puede ocultar una colisión semántica mediante creación silenciosa.

Si un schema objetivo ya existe, la verificación deberá demostrar que su identidad puede conservarse. Si existe una incompatibilidad material, la ejecución falla cerrada y se asigna a su tarea propietaria.

---

#### 22. Paridad ambiental y drift

`AUTH-DB-028` permanece como autoridad de baseline y drift.

La futura instancia verificará por ambiente, como mínimo:

```text
expected_target_schemas = 29
missing_target_schemas = 0
unexpected_target_name_variants = 0
managed_schema_reclassification = 0
vital_absorbed_into_vento_os = 0
```

Una diferencia entre migraciones, manifiesto y remoto bloquea conformidad hasta clasificación.

No se declara paridad entre local, staging y producción por observar únicamente el proyecto remoto actual.

---

#### 23. Recuperación y rollback

La creación de namespaces es una fundación aditiva, pero su rollback no puede convertirse en un `DROP SCHEMA` destructivo genérico.

Orden preferente:

```text
FORWARD_FIX
→ CORREGIR IDENTIDAD O ACL SIN DESTRUIR DATOS
→ DEJAR NAMESPACE INUTILIZADO SI AÚN ESTÁ VACÍO Y SU RETIRO NO ES SEGURO
→ RETIRAR SOLO CUANDO SE DEMUESTRE CERO OBJETOS, CERO DEPENDENCIAS Y CERO CONSUMIDORES
```

Reglas:

1. nunca se usa `DROP SCHEMA ... CASCADE` como rollback rutinario;
2. un schema que haya recibido objetos después de esta fundación no se elimina por rollback de `AUTH-DB-016`;
3. `AUTH-DB-029` gobierna evidencia de recuperación y rollback;
4. toda corrección queda versionada mediante migración forward;
5. una recuperación no restaura exposición o grants amplios por conveniencia.

---

#### 24. Manifiesto mínimo de la futura instancia

La evidencia física deberá incluir, como mínimo, por schema objetivo:

```text
canonical_schema_name
schema_class
v_schema_id_if_applicable
v_domain_id_if_applicable
expected_state
observed_state_before
observed_state_after
postgres_owner_before_if_existing
postgres_owner_after
client_usage
client_create
exposed_in_data_api
migration_reference
environment
drift_result
rollback_or_forward_recovery
evidence
```

Reglas:

1. aparecen exactamente 29 identidades;
2. `VSCHEMA-*` aparece solo para los 26 owner schemas;
3. `api`, `app_private` y `audit` declaran autoridad empresarial `NONE`;
4. `vital` no aparece como target schema de Vento OS;
5. los schemas legacy se registran como contexto de transición, no como miembros del conjunto objetivo;
6. ninguna fila queda con identidad o clase inferida.

---

#### 25. Pruebas positivas y negativas

La futura instancia deberá demostrar:

1. existen exactamente los 29 schemas objetivo;
2. los 26 owner schemas tienen nombres exactos;
3. `api`, `app_private` y `audit` existen exactamente una vez;
4. no falta ningún `VSCHEMA-*`;
5. no aparece ningún owner schema adicional inventado;
6. `vital` permanece fuera del conjunto Vento OS;
7. `public`, `club`, `pass`, `pos`, `talento` y `viso` no fueron eliminados por esta fundación;
8. `payments` fue reconciliado sin recreación destructiva;
9. `app_private` fue reconciliado sin recreación destructiva;
10. `PUBLIC`, `anon` y `authenticated` no reciben `CREATE` sobre los schemas objetivo;
11. `anon` y `authenticated` no reciben `USAGE` por la sola creación;
12. `api` no queda expuesto por esta tarea;
13. no se crearon tablas, vistas, funciones, secuencias, policies ni datos;
14. la reconstrucción limpia produce el mismo conjunto objetivo;
15. la segunda validación no detecta drift introducido por la primera materialización.

---

#### 26. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Justificación:** la cardinalidad y nombres de los owner schemas, la separación de `api`, `app_private` y `audit`, la prohibición de exposición directa, los default privileges, el control de `CREATE`, la autoridad por dominio, el drift y la reproducción de migraciones ya poseen cobertura canónica vigente. Esta tarea materializa documentalmente el contrato de fundación sin introducir una regla protegida nueva.

---

#### 27. Cobertura de prueba vigente reutilizada

Se reutiliza, sin modificarla, la cobertura existente, especialmente:

- `TREQ-SUPABASE-1047`;
- `TREQ-SUPABASE-1050`;
- `TREQ-SUPABASE-1053`;
- `TREQ-SUPABASE-1055`;
- `TREQ-SUPABASE-1059`;
- `TREQ-SUPABASE-1093`;
- `TREQ-SUPABASE-1095`;
- `TREQ-SUPABASE-1145`;
- `TREQ-SUPABASE-1146`;
- `TREQ-SUPABASE-1671`.

Estos identificadores se usan únicamente como trazabilidad de requisitos vigentes. No se modifica ninguna fila del registro.

---

#### 28. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                 |
| --------- | -------------- | ------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | la tarea documental no materializa migraciones ni código                                                                  |
| LOCAL     | NOT_EXECUTED   | pendiente del lifecycle documental y validadores del checkout de la tarea                                                 |
| REMOTA    | PASS           | arquitectura objetivo reconciliada con E3 y línea base read-only de `vento-os-dev`: 29 target, 2 existentes y 27 ausentes |
| OPERATIVA | NOT_APPLICABLE | no se alteran procesos, consumidores ni comportamiento de aplicaciones                                                    |
| FÍSICA    | NOT_APPLICABLE | `AUTH-DB-016::GLOBAL` permanece sin autorización física                                                                   |

---

#### 29. Decisiones vinculantes

1. La futura instancia es `AUTH-DB-016::GLOBAL`.
2. Su modo es `GLOBAL_ENABLE_ONCE`.
3. Su gate es `PRE_E5_FOUNDATION`.
4. El conjunto objetivo contiene exactamente 29 schemas gobernados por Vento.
5. Exactamente 26 son owner schemas `VSCHEMA-001..026`.
6. Los tres schemas transversales son `api`, `app_private` y `audit`.
7. `api`, `app_private` y `audit` tienen autoridad empresarial igual a ninguna.
8. Existe relación uno a uno entre los 26 `VSCHEMA-*` y los 26 `VDOM-*`.
9. Los 69 procesos resuelven un owner schema lógico mediante su dominio primario.
10. Los 29 nombres físicos son cerrados y no se renombran por inferencia.
11. La línea base remota actual contiene 2 de los 29 targets.
12. Los targets existentes son `app_private` y `payments`.
13. Faltan físicamente 27 targets en la línea base observada.
14. Existencia de `payments` no equivale a transición de sus objetos.
15. Existencia de `app_private` no certifica automáticamente sus objetos actuales.
16. `club`, `pass`, `pos`, `public`, `talento` y `viso` permanecen como superficies actuales o de transición y no se eliminan aquí.
17. `vital` permanece fuera de Vento OS.
18. Crear un schema no materializa su dominio.
19. Crear `api` no lo expone a Data API.
20. Crear `audit` no crea auditoría ni eventos.
21. Crear owner schemas no mueve tablas ni datos.
22. `AUTH-DB-018` conserva la separación de objetos expuestos e internos.
23. `AUTH-DB-017` conserva configuración de exposición y privilegios Data API.
24. `AUTH-DB-001..005` conservan RLS, policies, funciones privilegiadas y grants.
25. `PUBLIC`, `anon` y `authenticated` tienen objetivo de cero `CREATE` sobre schemas Vento.
26. La creación no concede `USAGE` cliente por defecto contractual.
27. No se crean roles ni memberships en esta tarea.
28. Toda materialización usa migración forward versionada en `vento-shell`.
29. El rollback no usa `DROP SCHEMA ... CASCADE` como mecanismo rutinario.
30. No se crean ni modifican requisitos de prueba.
31. La aprobación documental no autoriza ningún cambio físico en Supabase.

---

#### 30. Criterios de aceptación

`AUTH-DB-016` queda documentalmente completa cuando:

- el conjunto objetivo quede cerrado en 29 schemas;
- los 26 `VSCHEMA-*` y sus nombres físicos estén enumerados sin omisiones;
- `api`, `app_private` y `audit` estén clasificados como capas transversales no propietarias;
- la línea base remota 2 existentes / 27 ausentes quede reconciliada sin interpretarla como implementación;
- `payments` y `app_private` tengan tratamiento no destructivo;
- los schemas legacy permanezcan fuera del alcance de borrado o renombrado;
- VITAL permanezca fuera del conjunto objetivo de Vento OS;
- la existencia de namespace quede separada de objetos, datos, exposición, RLS y grants;
- `AUTH-DB-018` y `AUTH-DB-017` conserven sus responsabilidades;
- la materialización posterior exija migración forward, idempotencia, drift y recuperación;
- se definan pruebas positivas y negativas del conjunto completo;
- se declaren cero cambios TREQ con cobertura heredada en sección independiente;
- `AUTH-DB-016::GLOBAL` quede identificada sin quedar autorizada.

---

#### 31. Límites

`AUTH-DB-016` no:

- ejecuta SQL;
- crea migraciones;
- crea schemas remotos;
- mueve objetos;
- renombra schemas legacy;
- elimina schemas;
- crea tablas, vistas, funciones, tipos, secuencias o triggers;
- cambia datos;
- ejecuta backfills;
- modifica RLS;
- modifica policies;
- concede o revoca grants remotos;
- crea roles;
- cambia memberships;
- modifica owners PostgreSQL;
- configura Data API;
- modifica `api.schemas`;
- modifica `extra_search_path`;
- cambia GraphQL;
- modifica Auth, Storage, Realtime, Edge Functions, cron o secretos;
- modifica VITAL;
- cambia consumidores;
- modifica el registro 04A;
- autoriza `AUTH-DB-016::GLOBAL`;
- desarrolla `AUTH-DB-018`.

---

#### 32. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-DB-005 — Revocar grants innecesarios de anon`

**TAREA ACTUAL APROBADA**
`AUTH-DB-016 — Crear esquemas empresariales aprobados`

**SIGUIENTE TAREA RESERVADA**
`AUTH-DB-018 — Separar vistas y RPC expuestas de helpers internos`


### ✅ AUTH-DB-018 — Separar vistas y RPC expuestas de helpers internos

**Estado:** APROBADA
**Tarea anterior:** AUTH-DB-016 — Crear esquemas empresariales aprobados
**Tarea siguiente:** AUTH-DB-017 — Configurar esquemas expuestos y privilegios de Data API
**Tipo de tarea:** Documental
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/02_R1_FUNDACION_FISICA_CANONICA.md`
**Estado físico resultante:** contrato documental de separación de vistas, RPC y helpers internos cerrado; futura instancia global `AUTH-DB-018::GLOBAL` pendiente de autorización explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`AUTH-DB-018` define el contrato único para separar la superficie contractual expuesta de Vento de las vistas, funciones, RPC y helpers que deben permanecer internos.

La tarea no crea todavía objetos en `api`, no mueve rutinas, no cambia grants y no modifica la configuración de Data API. Su resultado es una clasificación canónica y verificable que permita materializar posteriormente la separación sin convertir la ubicación física actual en autoridad arquitectónica.

La separación distingue exactamente entre:

```text
api
→ contratos canónicos expuestos

OWNER SCHEMA
→ lógica, proyecciones y efectos internos del dominio propietario

app_private
→ helpers técnicos transversales privados

audit
→ evidencia, auditoría y eventos durables transversales

COMPATIBILITY
→ superficie legacy transitoria mientras existan consumidores

PLATFORM_MANAGED
→ objetos administrados por plataforma o extensión
```

Ninguna de estas capas adquiere autoridad empresarial por el solo hecho de alojar una vista o rutina.

---

#### 2. Resultado canónico

Queda definido el siguiente resultado:

```text
AUTH-DB-018
→ contrato documental de clasificación y separación

AUTH-DB-018::GLOBAL
→ única futura instancia física global

resultado físico esperado de esa instancia
→ todo objeto Vento aplicable tiene identidad inequívoca
→ todo objeto Vento aplicable tiene owner lógico
→ todo objeto Vento aplicable tiene una disposición primaria
→ los contratos expuestos quedan concentrados en api
→ los helpers privados quedan fuera de la superficie cliente
→ la lógica de negocio permanece en su owner
→ la auditoría transversal no absorbe autoridad empresarial
→ la compatibilidad legacy conserva condición explícita de salida
→ ningún objeto se retira sin evidencia suficiente
```

La clasificación no concede acceso cliente ni materializa por sí misma ningún cambio físico.

---

#### 3. Topología y gate

La reconciliación vigente del Bloque R establece:

```text
mode = GLOBAL_ENABLE_ONCE
execution_gate = PRE_E5_FOUNDATION
instance = AUTH-DB-018::GLOBAL
prerequisite = R0 aplicable verificado
```

Consecuencias:

1. existe como máximo una instancia física global;
2. no se crea una instancia por paquete;
3. la definición documental se aprueba una sola vez;
4. la aprobación documental no autoriza la instancia física;
5. la futura instancia puede crear la fundación de separación reutilizable sin migrar verticalmente un dominio;
6. tablas, datos y backfills empresariales permanecen fuera de esta unidad;
7. toda materialización conserva autorización humana explícita, migración versionada, pruebas y recuperación.

---

#### 4. Fuentes vinculantes y precedencia

La definición consume y preserva:

- `AUTH-DB-016`, para los 29 schemas objetivo y la separación entre 26 owner schemas, `api`, `app_private` y `audit`;
- `SUPA-ARC-004`, para retirar a `public` de la autoridad empresarial objetivo;
- `SUPA-ARC-005`, para `api` como única capa empresarial objetivo de contratos expuestos;
- `SUPA-ARC-006`, para `app_private` como capa técnica privada;
- `SUPA-ARC-007`, para `audit` como capa transversal durable de auditoría y eventos;
- `SUPA-ARC-015`, para exposición, grants, RLS, vistas, funciones y roles runtime;
- `SUPA-ARC-025`, para gobierno, drift y trazabilidad;
- `AUTH-DB-015`, para migraciones versionadas y atribuibles;
- `AUTH-DB-027`, para harness de esquema, integridad, RLS, RPC y migraciones;
- `AUTH-DB-028`, para baseline y drift;
- `AUTH-DB-029`, para recuperación y rollback;
- `AUTH-DB-001..005`, para contención de RLS, policies, funciones privilegiadas y grants.

Precedencia:

```text
ARQUITECTURA E3 APROBADA
→ fija ownership, exposición objetivo y seguridad

R0
→ garantiza reproducibilidad, pruebas, drift y recuperación

AUTH-DB-016
→ materializa o reconcilia namespaces objetivo

AUTH-DB-018
→ separa contratos expuestos de objetos internos

AUTH-DB-017
→ configura exposición y privilegios de Data API
```

`AUTH-DB-018` no puede reinterpretar contratos de E3 ni adelantar responsabilidades de `AUTH-DB-017`.

---

#### 5. Universo de clasificación

El universo primario de `AUTH-DB-018` está compuesto por:

```text
VISTAS VENTO
+
RUTINAS VENTO DIRECTAMENTE INVOCABLES
```

Los trigger functions se inventarían y reconciliarían por ownership interno, pero no forman parte del universo primario de contratos expuestos.

Un objeto de plataforma o extensión se clasifica como `PLATFORM_MANAGED` y queda fuera del universo gobernado de reubicación Vento.

Cada identidad Vento aplicable deberá quedar clasificada exactamente una vez antes de cualquier mutación física.

---

#### 6. Cardinalidades vinculantes

La línea base remota observada para esta tarea contiene:

```text
views_total = 62
views_security_invoker = 58
views_privileged = 4
direct_vento_routines = 226
direct_vento_security_definer = 192
trigger_functions = 72

primary_classification_universe
= 62 views + 226 direct Vento routines
= 288 identities
```

Los números son una línea base de evidencia y no una constante eterna.

La futura materialización deberá regenerar el inventario inmediatamente antes de actuar y reconciliar cualquier drift.

---

#### 7. Línea base remota vigente

La observación read-only de `vento-os-dev` muestra:

| Schema actual | Vistas | `security_invoker` | Vistas privilegiadas | Rutinas Vento directas | Directas `SECURITY DEFINER` | Trigger functions |
| ------------- | -----: | -----------------: | -------------------: | ---------------------: | --------------------------: | ----------------: |
| `app_private` |      0 |                  0 |                    0 |                      1 |                           1 |                 0 |
| `club`        |      0 |                  0 |                    0 |                      7 |                           2 |                 0 |
| `pass`        |      1 |                  1 |                    0 |                     19 |                          16 |                11 |
| `payments`    |      0 |                  0 |                    0 |                      0 |                           0 |                 0 |
| `pos`         |      0 |                  0 |                    0 |                      0 |                           0 |                 0 |
| `public`      |     61 |                 57 |                    4 |                    184 |                         146 |                59 |
| `talento`     |      0 |                  0 |                    0 |                     15 |                          11 |                 1 |
| `viso`        |      0 |                  0 |                    0 |                      0 |                           0 |                 0 |
| **TOTAL**     | **62** |             **58** |                **4** |                **226** |                     **192** |            **72** |

Esta línea base describe implementación actual. No convierte `public`, `club`, `pass`, `talento` ni ningún otro schema legacy en owner objetivo por mera existencia.

---

#### 8. Identidad física y sobrecargas

Toda vista se identifica mediante:

```text
schema.object
```

Toda rutina se identifica mediante:

```text
schema.name(identity arguments)
```

Queda prohibido usar únicamente `schema.name` cuando existan sobrecargas.

La línea base remota confirma al menos:

```text
public.create_order_checkout_draft
→ 4 identidades de rutina

public.fogo_create_real_production_batch
→ 2 identidades de rutina
```

Reglas:

1. cada firma se clasifica independientemente;
2. dos sobrecargas pueden recibir disposiciones diferentes si su semántica lo exige;
3. una sobrecarga no hereda automáticamente contrato, seguridad ni owner de otra;
4. cualquier manifiesto que colapse firmas distintas falla cerrado.

---

#### 9. Capas destino permitidas

Las capas destino canónicas son:

| Capa                  | Clase                           | Autoridad empresarial  | Exposición objetivo       |
| --------------------- | ------------------------------- | ---------------------- | ------------------------- |
| `api`                 | contrato expuesto               | ninguna                | sí, gobernada             |
| owner schema          | dominio propietario             | sí, cuando corresponda | no directa                |
| `app_private`         | técnica privada transversal     | ninguna                | no                        |
| `audit`               | auditoría/evidencia transversal | ninguna                | no directa por esta tarea |
| compatibilidad legacy | transición                      | ninguna nueva          | temporal                  |
| plataforma/extensión  | administrada externamente       | no gobernada por Vento | según plataforma          |

No se crean capas alternativas por aplicación, módulo o conveniencia local.

---

#### 10. Contratos admitidos en `api`

Todo objeto que llegue a `api` debe clasificarse exactamente como:

```text
READ_VIEW
QUERY_RPC
COMMAND_RPC
```

Significado:

| Tipo          | Uso                                                                           |
| ------------- | ----------------------------------------------------------------------------- |
| `READ_VIEW`   | proyección estable de lectura expuesta                                        |
| `QUERY_RPC`   | consulta parametrizada sin efecto empresarial                                 |
| `COMMAND_RPC` | comando contractual que solicita un efecto cuyo owner permanece en el dominio |

Queda prohibido convertir `api` en:

- almacén de helpers;
- owner de reglas de negocio;
- ubicación de trigger functions;
- ubicación de tablas autoritativas;
- ubicación de secuencias autoritativas;
- compatibilidad legacy indefinida.

---

#### 11. Ownership de lógica interna

La ubicación física actual no determina ownership.

Reglas:

1. una consulta interna pertenece al owner de los datos y significado consultados;
2. un comando interno pertenece al owner del efecto empresarial;
3. un helper que implementa reglas o invariantes pertenece al dominio correspondiente;
4. una proyección interna pertenece al owner de su significado;
5. una función que toca varios schemas no se vuelve automáticamente transversal;
6. el owner lógico se determina por autoridad y efecto, no por número de dependencias.

Mover una función desde `public` no autoriza mover las tablas que consume.

---

#### 12. `app_private`

`app_private` queda reservado a helpers técnicos transversales privados.

Un objeto puede clasificarse allí únicamente cuando:

- presta capacidad técnica reutilizable entre dominios;
- no decide resultados de negocio;
- no representa autoridad empresarial;
- no necesita invocación directa de clientes;
- su semántica no pertenece naturalmente a un único dominio.

La línea base remota contiene:

```text
app_private.delivery_pin_for_session(p_session_id uuid)
```

Su existencia demuestra una superficie privada actual, pero no autoriza usar `app_private` como depósito genérico de funciones.

---

#### 13. `audit`

`audit` puede alojar superficies técnicas transversales destinadas a:

- evidencia durable;
- auditoría;
- trazabilidad técnica;
- outbox;
- evidencia de eventos o procesamiento.

Reglas:

1. el productor conserva su ownership lógico;
2. registrar evidencia no transfiere autoridad empresarial;
3. un comando de negocio no se mueve a `audit` porque produzca auditoría;
4. `audit` no sustituye al owner del estado autoritativo;
5. la exposición de cualquier proyección de auditoría queda gobernada separadamente.

---

#### 14. Superficies legacy y compatibilidad

`public`, `club`, `pass`, `pos`, `talento`, `viso` y otras superficies actuales no son destinos canónicos por mera existencia.

Una identidad legacy con consumidor vigente puede conservarse temporalmente mediante:

- wrapper;
- alias compatible;
- forwarding controlado;
- contrato de compatibilidad equivalente.

Toda compatibilidad debe registrar:

```text
consumer_evidence
compatibility_requirement
exit_condition
```

La compatibilidad sin condición de salida es inválida.

---

#### 15. Regla de clasificación de vistas

Una vista es candidata a `READ_VIEW` cuando:

1. existe un caso legítimo de lectura cliente;
2. su contrato puede mantenerse estable;
3. no expone columnas internas por accidente;
4. no depende de autoridad implícita del creador;
5. su semántica puede mantenerse aunque cambie la implementación interna.

Una vista interna, administrativa o de soporte permanece con su owner salvo decisión canónica distinta.

---

#### 16. `security_invoker` en vistas expuestas

Toda `READ_VIEW` objetivo usa por defecto:

```text
security_invoker = true
```

La línea base actual contiene cuatro vistas en `public` que no cumplen ese default:

```text
public.permission_catalog_human_v1
public.shared_operational_device_actor_policies_admin_v1
public.shared_operational_device_templates_admin_v1
public.shared_operational_devices_admin_v1
```

Las cuatro quedan:

```text
PUBLISH_API = BLOCKED_AS_IS
```

No pueden copiarse directamente a `api` conservando privilegios implícitos del creador.

Si alguna necesita contrato expuesto, debe existir un rediseño explícito de seguridad antes de materializarla.

---

#### 17. Regla de clasificación de `QUERY_RPC`

Una rutina es candidata a `QUERY_RPC` cuando:

- no produce efecto empresarial;
- su parametrización forma parte real del contrato;
- la salida es explícita y estable;
- el owner de los datos consultados permanece identificado;
- la autorización puede evaluarse sin transferir autoridad a `api`;
- no exige exposición directa del schema propietario.

Una función que solo facilita implementación interna no se convierte en `QUERY_RPC` porque sea técnicamente invocable.

---

#### 18. Regla de clasificación de `COMMAND_RPC`

Una rutina es candidata a `COMMAND_RPC` cuando:

- representa una intención de negocio legítima;
- el efecto tiene owner inequívoco;
- la lógica autoritativa permanece en el owner;
- el contrato define inputs y salida;
- los errores son contractuales;
- concurrencia e idempotencia quedan gobernadas cuando correspondan;
- no depende de privilegios implícitos de una superficie legacy.

El wrapper contractual de `api` debe ser mínimo y no debe convertirse en fuente de verdad del dominio.

---

#### 19. `SECURITY DEFINER`

`SECURITY DEFINER` no se hereda por compatibilidad ni por copia física.

Estado objetivo:

```text
api_default_security_definer_rpc = 0
```

Una futura excepción requerirá una decisión canónica específica que cubra, como mínimo:

- justificación;
- principal efectivo;
- autorización explícita;
- `search_path` endurecido;
- referencias calificadas;
- errores;
- observabilidad;
- pruebas negativas;
- grants exactos.

`AUTH-DB-018` no aprueba ninguna excepción de ese tipo.

En capas privadas, la existencia de `SECURITY DEFINER` tampoco elimina la obligación de revisar exposición y autorización.

---

#### 20. Trigger functions

Los trigger functions:

- no pertenecen al universo primario de contratos expuestos;
- nunca se materializan en `api`;
- se reconcilian por owner del objeto protegido o del efecto producido;
- pueden pertenecer a una capa técnica transversal solo cuando su semántica sea realmente transversal.

La línea base actual contiene 72 trigger functions en los schemas observados.

Su recuento se conserva como evidencia de ownership interno, no como inventario de RPC cliente.

---

#### 21. Disposiciones canónicas

Cada identidad Vento aplicable recibe exactamente una disposición primaria:

| Disposición           | Significado                                                                   |
| --------------------- | ----------------------------------------------------------------------------- |
| `PUBLISH_API`         | materializar contrato canónico en `api`                                       |
| `KEEP_OWNER_INTERNAL` | mantener o materializar el objeto dentro del owner                            |
| `MOVE_APP_PRIVATE`    | materializar helper técnico transversal en `app_private`                      |
| `MOVE_AUDIT`          | materializar superficie técnica transversal en `audit`                        |
| `KEEP_COMPATIBILITY`  | conservar temporalmente identidad legacy gobernada                            |
| `RETIRE`              | retirar únicamente tras probar ausencia de contrato, consumidor y dependencia |
| `BLOCKED`             | impedir materialización hasta resolver riesgo o ambigüedad                    |
| `PLATFORM_MANAGED`    | excluir de la reubicación Vento por pertenecer a plataforma/extensión         |

No se permiten disposiciones libres o ambiguas.

---

#### 22. Reglas fail-closed

`RETIRE` exige demostrar:

- ausencia de contrato canónico;
- ausencia de consumidor vigente;
- ausencia de call sites relevantes;
- ausencia de dependencias de función, vista, trigger, policy o proceso;
- ausencia de compatibilidad abierta.

`BLOCKED` exige:

- motivo exacto;
- owner esperado o candidatos explícitos;
- evidencia faltante;
- riesgo;
- condición de salida.

`KEEP_COMPATIBILITY` exige:

- consumidor identificado;
- destino objetivo;
- condición de retiro.

La falta de evidencia nunca se interpreta como permiso para retirar o publicar.

---

#### 23. Manifiesto mínimo de la futura instancia

Antes de cualquier mutación física, `AUTH-DB-018::GLOBAL` deberá producir un manifiesto completo con, como mínimo:

```text
physical_identity
object_kind
current_schema
current_security_mode
logical_owner
contract_type
target_layer
disposition
consumer_evidence
compatibility_requirement
security_gate
blocking_reason
exit_condition
observed_state_before
expected_state_after
migration_reference
environment
drift_result
evidence
```

Reglas:

1. toda identidad aplicable aparece exactamente una vez;
2. ninguna sobrecarga colapsa;
3. ninguna identidad recibe dos disposiciones primarias;
4. `PUBLISH_API` exige `READ_VIEW`, `QUERY_RPC` o `COMMAND_RPC`;
5. `MOVE_APP_PRIVATE` no puede conservar contrato cliente directo;
6. `MOVE_AUDIT` no transfiere autoridad;
7. `RETIRE` exige evidencia negativa suficiente;
8. `BLOCKED` y `KEEP_COMPATIBILITY` exigen condición de salida.

---

#### 24. Cobertura completa antes de mutar

La futura instancia debe seguir:

```text
1. REGENERAR INVENTARIO
2. IDENTIFICAR DRIFT
3. RECONCILIAR DRIFT
4. CLASIFICAR 100 % DEL UNIVERSO APLICABLE
5. VALIDAR IDENTIDADES Y OWNERS
6. VALIDAR DISPOSICIONES
7. VALIDAR SEGURIDAD Y COMPATIBILIDAD
8. SOLO ENTONCES PREPARAR CAMBIOS FÍSICOS
```

Queda prohibido:

```text
MOVER LO OBVIO
→ DEJAR EL RESTO PARA DESPUÉS
```

Una identidad sin clasificación bloquea conformidad de la instancia.

---

#### 25. Frontera con `AUTH-DB-017`

`AUTH-DB-017` es propietaria de configurar schemas expuestos y privilegios de Data API.

Por tanto, `AUTH-DB-018` no modifica:

- `api.schemas`;
- `extra_search_path`;
- exposición PostgREST;
- exposición GraphQL;
- `USAGE` de schemas para roles cliente;
- `SELECT` sobre vistas expuestas;
- `EXECUTE` de RPC expuestas;
- default privileges;
- grants positivos de runtime.

Clasificación y exposición son decisiones separadas.

```text
AUTH-DB-018
→ QUÉ OBJETO PUEDE SER CONTRATO Y DÓNDE PERTENECE

AUTH-DB-017
→ QUÉ SUPERFICIE QUEDA EXPUESTA Y CON QUÉ PRIVILEGIOS
```

---

#### 26. Frontera con RLS, Auth y datos

`AUTH-DB-018` no modifica:

- RLS;
- policies;
- Supabase Auth;
- proveedores de Auth;
- sesiones;
- Storage;
- Realtime;
- Edge Functions;
- cron;
- secretos;
- datos;
- tablas;
- columnas;
- claves;
- backfills;
- ownership vertical de entidades.

Pertenecer a `api` no equivale a grant.

Pertenecer a un owner, `app_private` o `audit` no equivale a policy RLS.

Una dependencia de seguridad no resuelta produce `BLOCKED`; no se corrige silenciosamente dentro de esta tarea.

---

#### 27. Estrategia de futura materialización

La instancia `AUTH-DB-018::GLOBAL` deberá usar migraciones forward versionadas en `vento-shell`.

Secuencia contractual:

```text
1. REGENERAR Y CONGELAR BASELINE DE LA INSTANCIA
2. GENERAR MANIFIESTO DE CLASIFICACIÓN COMPLETO
3. VALIDAR 100 % DE COBERTURA
4. CREAR DESTINOS CANÓNICOS NO DESTRUCTIVOS
5. MATERIALIZAR WRAPPERS Y OBJETOS INTERNOS SEGÚN DISPOSICIÓN
6. CONSERVAR COMPATIBILIDAD DONDE EXISTA CONSUMIDOR
7. NO CONFIGURAR DATA API NI GRANTS DE AUTH-DB-017
8. VALIDAR SEGURIDAD Y DEPENDENCIAS
9. VALIDAR DRIFT
10. CONSERVAR EVIDENCIA Y RECUPERACIÓN
```

No se permiten movimientos destructivos como estrategia base.

---

#### 28. Compatibilidad, idempotencia y rollback

La transición es `wrapper-first`.

Para contratos consumidos:

```text
CREAR DESTINO
→ VALIDAR DESTINO
→ CONSERVAR IDENTIDAD LEGACY
→ MIGRAR CONSUMIDORES
→ DEMOSTRAR CERO DEPENDENCIAS
→ RETIRAR COMPATIBILIDAD
```

Reglas:

1. no se elimina una vista consumida antes de migrar consumidores;
2. no se renombra una RPC consumida sin compatibilidad;
3. no se cambia simultáneamente identidad, semántica y permisos sin transición verificable;
4. una ejecución repetida del harness no debe introducir nuevos cambios;
5. rollback no usa destrucción genérica de objetos con dependencias;
6. una corrección posterior se realiza mediante migración forward versionada;
7. los wrappers no deben duplicar efectos ni debilitar idempotencia/concurrencia del owner.

---

#### 29. Pruebas positivas y negativas

La futura instancia deberá demostrar:

1. se regeneró el inventario remoto antes de materializar;
2. toda vista Vento tiene identidad inequívoca;
3. toda rutina Vento directa usa firma completa;
4. el 100 % del universo aplicable tiene una disposición primaria;
5. cada objeto tiene owner lógico o clasificación de plataforma explícita;
6. cada `PUBLISH_API` tiene tipo `READ_VIEW`, `QUERY_RPC` o `COMMAND_RPC`;
7. `api` contiene cero tablas autoritativas;
8. `api` contiene cero secuencias autoritativas;
9. `api` contiene cero trigger functions;
10. las vistas expuestas usan `security_invoker=true` por defecto;
11. las cuatro vistas privilegiadas observadas no se publican tal como están;
12. `api` no incorpora RPC `SECURITY DEFINER` por defecto;
13. `app_private` permanece fuera de acceso cliente directo;
14. la lógica de negocio permanece en owner schemas;
15. `audit` no absorbe autoridad empresarial;
16. las identidades legacy consumidas conservan compatibilidad;
17. `RETIRE` nunca se aplica sin evidencia negativa suficiente;
18. `BLOCKED` siempre incluye condición de salida;
19. las sobrecargas se clasifican por firma;
20. trigger functions permanecen fuera de `api`;
21. el drift entre baseline documental e inventario de instancia queda reconciliado;
22. no se modifican grants ni configuración de Data API;
23. no se mueven tablas ni datos;
24. una segunda validación no detecta drift introducido por la primera materialización.

Casos negativos obligatorios:

- identidad faltante;
- identidad duplicada;
- firma sobrecargada colapsada;
- `PUBLISH_API` sin tipo contractual;
- vista privilegiada propuesta como contrato sin resolución de seguridad;
- helper de dominio propuesto para `app_private`;
- `RETIRE` sin evidencia;
- `KEEP_COMPATIBILITY` sin consumidor o salida;
- trigger function propuesta para `api`;
- drift remoto no reconciliado;
- intento de adelantar privilegios de `AUTH-DB-017`.

---

#### 30. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Justificación:** la separación entre `api`, owner schemas, `app_private` y `audit`, la seguridad de vistas y RPC, la prohibición de exposición directa, la compatibilidad, los grants, el drift y las condiciones de publicación ya poseen cobertura canónica vigente en la arquitectura E3. Esta tarea convierte esas decisiones en un contrato documental de materialización sin introducir una regla protegida nueva.

---

#### 31. Cobertura de prueba vigente reutilizada

Se reutiliza, sin modificarla, la cobertura existente asociada especialmente a:

- `TREQ-SUPABASE-651..686`, para la capa contractual expuesta `api`;
- `TREQ-SUPABASE-687..718`, para la capa técnica privada `app_private`;
- `TREQ-SUPABASE-1047..1090`, para seguridad, exposición, grants, vistas, RPC, compatibilidad y controles relacionados.

Estos identificadores se usan únicamente como trazabilidad de requisitos vigentes.

No se modifica ninguna fila del registro de requisitos.

---

#### 32. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                                               |
| --------- | -------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | la tarea documental no materializa migraciones ni código de producto                                                                                                    |
| LOCAL     | NOT_EXECUTED   | pendiente del lifecycle documental y validadores del checkout de la tarea                                                                                               |
| REMOTA    | PASS           | fuentes canónicas vigentes y línea base read-only de `vento-os-dev` reconciliadas: 62 vistas, 226 rutinas Vento directas, 72 trigger functions y 4 vistas privilegiadas |
| OPERATIVA | NOT_APPLICABLE | no se alteran consumidores, procesos ni comportamiento runtime                                                                                                          |
| FÍSICA    | NOT_APPLICABLE | `AUTH-DB-018::GLOBAL` permanece sin autorización física                                                                                                                 |

---

#### 33. Decisiones vinculantes

1. La futura instancia es `AUTH-DB-018::GLOBAL`.
2. Su modo es `GLOBAL_ENABLE_ONCE`.
3. Su gate es `PRE_E5_FOUNDATION`.
4. `api` es la única capa contractual expuesta objetivo de Vento.
5. `api` no posee autoridad empresarial.
6. Los únicos tipos contractuales admitidos son `READ_VIEW`, `QUERY_RPC` y `COMMAND_RPC`.
7. Las vistas se identifican por `schema.object`.
8. Las rutinas se identifican por `schema.name(identity arguments)`.
9. Las sobrecargas se clasifican independientemente.
10. La línea base remota actual contiene 62 vistas.
11. De esas vistas, 58 usan `security_invoker` y 4 son privilegiadas.
12. La línea base contiene 226 rutinas Vento directas.
13. La línea base contiene 72 trigger functions.
14. El universo primario observado es de 288 identidades.
15. Los 72 trigger functions permanecen fuera del universo primario de contratos.
16. Las cuatro vistas privilegiadas actuales quedan bloqueadas para publicación directa tal como están.
17. Toda `READ_VIEW` objetivo usa `security_invoker=true` por defecto.
18. `api` mantiene objetivo de cero RPC `SECURITY DEFINER` por defecto.
19. `app_private` aloja únicamente helpers técnicos transversales privados sin autoridad de negocio.
20. La lógica e invariantes de negocio permanecen en owner schemas.
21. `audit` registra evidencia transversal sin adquirir autoridad empresarial.
22. Los schemas legacy no se convierten en destinos canónicos por mera existencia.
23. La compatibilidad legacy requiere consumidor y condición de salida.
24. `RETIRE` requiere evidencia negativa suficiente.
25. `BLOCKED` requiere motivo y condición de salida.
26. Los objetos de plataforma/extensión se clasifican `PLATFORM_MANAGED`.
27. Ninguna tabla, secuencia o trigger function se publica en `api`.
28. La transición de contratos consumidos es wrapper-first.
29. La clasificación completa precede a cualquier mutación física.
30. El drift se regenera y reconcilia antes de materializar.
31. `AUTH-DB-017` conserva exposición, `USAGE`, `SELECT`, `EXECUTE` y default privileges.
32. `AUTH-DB-001..005` conservan sus responsabilidades de RLS, policies, funciones privilegiadas y grants.
33. Tablas, datos y backfills permanecen fuera del alcance.
34. Toda futura materialización se versiona en `vento-shell`.
35. La aprobación documental no autoriza ningún cambio físico en Supabase.
36. No se crean ni modifican requisitos de prueba.

---

#### 34. Criterios de aceptación

`AUTH-DB-018` queda documentalmente completa cuando:

- la separación entre `api`, owner schemas, `app_private`, `audit` y compatibilidad quede cerrada;
- se definan únicamente `READ_VIEW`, `QUERY_RPC` y `COMMAND_RPC` como contratos de `api`;
- se cierre la identidad física de vistas y rutinas;
- las sobrecargas no puedan colapsarse;
- la línea base remota de 62 vistas, 226 rutinas directas y 72 trigger functions quede registrada como evidencia;
- las cuatro vistas privilegiadas queden bloqueadas para publicación directa tal como están;
- `security_invoker=true` quede fijado como default de vistas expuestas;
- `SECURITY DEFINER` no quede heredado automáticamente hacia `api`;
- las disposiciones canónicas queden cerradas;
- `RETIRE`, `BLOCKED` y `KEEP_COMPATIBILITY` sean fail-closed;
- se exija manifiesto y cobertura completa antes de mutar;
- `AUTH-DB-017` conserve exposición y privilegios;
- tablas, datos, RLS y migraciones verticales permanezcan fuera del alcance;
- se definan pruebas positivas y negativas;
- se declaren cero cambios TREQ con cobertura vigente reutilizada;
- `AUTH-DB-018::GLOBAL` quede identificada sin quedar autorizada.

---

#### 35. Límites

`AUTH-DB-018` no:

- ejecuta SQL de mutación;
- crea migraciones;
- mueve funciones;
- mueve vistas;
- crea contratos físicos en `api`;
- elimina objetos;
- renombra objetos legacy;
- mueve tablas;
- cambia columnas;
- cambia claves;
- modifica datos;
- ejecuta backfills;
- modifica RLS;
- modifica policies;
- cambia Supabase Auth;
- cambia sesiones;
- cambia Storage;
- cambia Realtime;
- cambia Edge Functions;
- cambia cron;
- cambia secretos;
- configura Data API;
- modifica `api.schemas`;
- modifica `extra_search_path`;
- concede `USAGE`;
- concede `SELECT`;
- concede `EXECUTE`;
- cambia default privileges;
- modifica GraphQL;
- retira compatibilidad sin evidencia;
- modifica VITAL;
- modifica el registro de requisitos;
- autoriza `AUTH-DB-018::GLOBAL`;
- desarrolla `AUTH-DB-017`.

---

#### 36. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-DB-016 — Crear esquemas empresariales aprobados`

**TAREA ACTUAL APROBADA**
`AUTH-DB-018 — Separar vistas y RPC expuestas de helpers internos`

**SIGUIENTE TAREA RESERVADA**
`AUTH-DB-017 — Configurar esquemas expuestos y privilegios de Data API`


### ✅ AUTH-DB-017 — Configurar esquemas expuestos y privilegios de Data API

**Estado:** APROBADA
**Tarea anterior:** AUTH-DB-018 — Separar vistas y RPC expuestas de helpers internos
**Tarea siguiente:** AUTH-DB-019 — Implementar vínculos canónicos entre Auth e identidades empresariales
**Tipo de tarea:** Documental
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/02_R1_FUNDACION_FISICA_CANONICA.md`
**Estado físico resultante:** Contrato de exposición de Data API, grants explícitos y default privileges cerrado; futura instancia global `AUTH-DB-017::GLOBAL` pendiente de autorización explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`AUTH-DB-017` define el contrato único para configurar qué schemas Vento pueden quedar expuestos por la Data API de Supabase y qué privilegios mínimos reciben los roles runtime sobre esa superficie, sin convertir la exposición de un schema en autorización empresarial y sin reabrir la clasificación de objetos cerrada por `AUTH-DB-018`.

La regla central es:

```text
SUPERFICIE EMPRESARIAL VENTO EXPUESTA
=
api

OWNER SCHEMAS
app_private
audit
schemas legacy
=
NO SON SUPERFICIE OBJETIVO DE DATA API
```

La exposición de `api` no concede acceso automático a sus objetos. El acceso efectivo exige, de forma acumulativa y cuando aplique:

```text
SCHEMA EXPUESTO
+
USAGE DEL SCHEMA
+
PRIVILEGIO EXPLÍCITO DEL OBJETO
+
CONTRATO DE AUTORIZACIÓN
+
RLS / SEGURIDAD DEL OBJETO APLICABLE
=
ACCESO EFECTIVO
```

`AUTH-DB-017` cierra la capa de exposición y privilegios; no modifica las reglas empresariales de autorización ni las policies RLS propietarias de otras tareas.

---

#### 2. Resultado canónico

Queda definido el siguiente resultado documental:

```text
AUTH-DB-017
→ contrato documental de exposición y grants de Data API

AUTH-DB-017::GLOBAL
→ única futura instancia física global

resultado físico esperado de esa instancia
→ api es la única superficie empresarial Vento expuesta
→ public deja de ser superficie empresarial objetivo
→ owner schemas permanecen no expuestos
→ app_private permanece no expuesto
→ audit permanece no expuesto
→ graphql_public se trata únicamente como superficie administrada por plataforma cuando aplique
→ anon y authenticated reciben únicamente grants explícitos necesarios
→ PUBLIC no conserva EXECUTE genérico sobre rutinas empresariales Vento
→ default privileges quedan endurecidos para impedir exposición accidental futura
→ service_role no se convierte en contrato de cliente
→ grants y exposición quedan verificables por inventario y drift
```

La tarea no ejecuta todavía ninguna revocación ni modificación de `supabase/config.toml`.

---

#### 3. Topología y gate

La reconciliación vigente de R1 establece para `AUTH-DB-017`:

```text
mode = GLOBAL_ENABLE_ONCE
execution_gate = PRE_E5_FOUNDATION
instance = AUTH-DB-017::GLOBAL
prerequisite = R0 aplicable verificado
```

Consecuencias:

1. existe como máximo una instancia física global;
2. no se crea una instancia por `package_id`;
3. la fundación puede materializarse antes de E5 porque gobierna una frontera transversal reutilizable;
4. la aprobación documental no autoriza la instancia física;
5. la instancia no puede migrar tablas ni datos de dominio;
6. la instancia no puede declarar aprobado ningún paquete consumidor;
7. cualquier materialización conserva autorización humana explícita, migraciones versionadas, pruebas, drift y recuperación.

---

#### 4. Fuentes vinculantes y precedencia

La tarea consume y preserva:

- `AUTH-DB-016`, para los 29 schemas objetivo gobernados por Vento;
- `AUTH-DB-018`, para la separación entre contratos `api`, lógica interna de owner, `app_private`, `audit`, compatibilidad y plataforma;
- `SUPA-ARC-004`, para retirar `public` de la autoridad empresarial objetivo;
- `SUPA-ARC-005`, para `api` como única capa empresarial Vento de contratos expuestos;
- `SUPA-ARC-006`, para `app_private` como capa técnica privada;
- `SUPA-ARC-007`, para `audit` como capa transversal no propietaria;
- `SUPA-ARC-015`, para exposición, grants, RLS, vistas, funciones, roles runtime y default privileges;
- `SUPA-ARC-025`, para gobierno, evidencia y drift;
- `AUTH-DB-001..005`, para RLS, policies, funciones privilegiadas y contención previa de grants;
- `AUTH-DB-027`, para harness de esquema, integridad, RLS, RPC y migraciones;
- `AUTH-DB-028`, para baseline y drift;
- `AUTH-DB-029`, para recuperación y rollback.

Precedencia:

```text
ARQUITECTURA E3
→ define superficie objetivo y principios de seguridad

AUTH-DB-016
→ define namespaces objetivo

AUTH-DB-018
→ define qué objetos son contratos y qué objetos permanecen internos

AUTH-DB-017
→ define exposición efectiva y privilegios de Data API

AUTH-DB-019 Y POSTERIORES
→ continúan la fundación de identidad y autorización
```

`AUTH-DB-017` no puede publicar un objeto que `AUTH-DB-018` haya clasificado como interno, bloqueado, legacy sin salida resuelta o administrado por plataforma.

---

#### 5. Clasificación recomputada frente al trabajo proyectado

La clasificación independiente desde las fuentes canónicas es:

```text
TAREA = AUTH-DB-017
NATURALEZA = DOCUMENTAL
MODO = GLOBAL_ENABLE_ONCE
INSTANCIA FÍSICA FUTURA = AUTH-DB-017::GLOBAL
GATE = PRE_E5_FOUNDATION
CARRIL ACTUAL = DOCUMENTAL
SIGUIENTE DOCUMENTAL = AUTH-DB-019
```

Comparación:

```text
CLASIFICACIÓN RECOMPUTADA DESDE FUENTES CANÓNICAS
vs.
CURRENT-WORK DEL INICIADOR, QUE PRIORIZA SHELL-CON-017::GLOBAL EN EL CARRIL FÍSICO

RESULTADO = COINCIDE EN EL MODELO DE DOS CARRILES

La prioridad física de SHELL-CON-017::GLOBAL no suspende AUTH-DB-017.
La instrucción explícita del usuario selecciona el carril documental.
```

No existe contradicción que bloquee el desarrollo documental de `AUTH-DB-017`.

---

#### 6. Superficie objetivo de Data API

La configuración objetivo distingue dos categorías.

##### 6.1. Superficie empresarial Vento

La única superficie empresarial Vento expuesta es:

```text
api
```

Reglas:

1. `api` es contrato, no dominio;
2. `api` no aloja tablas autoritativas;
3. `api` no aloja secuencias autoritativas;
4. `api` no aloja trigger functions;
5. `api` solo publica objetos previamente aprobados como `READ_VIEW`, `QUERY_RPC` o `COMMAND_RPC`;
6. exponer `api` no concede por sí solo privilegios sobre sus objetos;
7. ningún owner schema se añade al conjunto objetivo de schemas empresariales expuestos.

##### 6.2. Superficies administradas por plataforma

`graphql_public`, cuando exista y sea requerido por la configuración de plataforma, se trata como superficie administrada por Supabase y no como contrato empresarial Vento.

Reglas:

1. no recibe autoridad empresarial;
2. no sustituye a `api`;
3. no autoriza exponer owner schemas;
4. su permanencia o retiro debe seguir la necesidad real de plataforma y no una inferencia desde esta tarea;
5. cualquier consumidor GraphQL deberá continuar respetando los contratos y privilegios de la superficie autorizada.

---

#### 7. Schemas que no pueden quedar expuestos como superficie empresarial

El estado objetivo prohíbe exposición directa de:

- los 26 owner schemas `VSCHEMA-001..026`;
- `app_private`;
- `audit`;
- `public` como superficie empresarial objetivo;
- schemas legacy de aplicación o transición;
- schemas de extensiones o administración interna que no formen parte del contrato de plataforma.

La no exposición es una propiedad independiente de RLS.

Un schema privado no debe confiar únicamente en RLS para compensar una exposición innecesaria.

---

#### 8. Transición de `public`

La configuración local vigente todavía declara:

```toml
[api]
schemas = ["public", "graphql_public"]
extra_search_path = ["public", "extensions"]
```

Este estado es legacy respecto de la arquitectura objetivo.

La transición debe ser no destructiva:

```text
1. MATERIALIZAR Y VALIDAR CONTRATOS api
2. CONSERVAR COMPATIBILIDAD LEGACY NECESARIA
3. MIGRAR CONSUMIDORES
4. EJECUTAR PRUEBAS POSITIVAS Y NEGATIVAS
5. DEMOSTRAR QUE NINGÚN CONSUMIDOR AUTORIZADO DEPENDE DE public COMO API EMPRESARIAL
6. RETIRAR public DEL CONJUNTO OBJETIVO EXPUESTO
7. REVALIDAR DRIFT Y ACCESO NEGATIVO
```

Queda prohibido retirar `public` de forma anticipada si todavía existen consumidores aprobados cuya migración no haya sido demostrada.

La compatibilidad temporal no convierte `public` en destino canónico.

---

#### 9. `extra_search_path`

El `extra_search_path` no se usa para volver visibles schemas propietarios ni para eludir referencias calificadas.

Reglas objetivo:

1. `api` debe resolver contratos mediante referencias explícitas y gobernadas;
2. owner schemas no se añaden a `extra_search_path` para facilitar consultas de clientes;
3. `app_private` no se añade para hacer accesibles helpers internos;
4. `audit` no se añade como atajo de consulta;
5. `extensions` solo permanece cuando sea una dependencia técnica aprobada;
6. cualquier permanencia de `public` en `extra_search_path` debe justificarse por dependencia técnica real y no por compatibilidad empresarial indefinida;
7. una función privilegiada debe usar `search_path` endurecido conforme a su contrato específico y no depender del `extra_search_path` general de Data API.

---

#### 10. Modelo de roles runtime

`AUTH-DB-017` distingue:

```text
anon
authenticated
service_role
PUBLIC
```

y prohíbe tratarlos como equivalentes.

##### 10.1. `anon`

`anon` recibe únicamente el acceso necesario para contratos expresamente públicos.

No recibe por defecto:

- acceso a owner schemas;
- acceso a `app_private`;
- acceso a `audit`;
- DML directo sobre tablas empresariales;
- `EXECUTE` genérico sobre funciones;
- privilegios heredados por conveniencia histórica.

##### 10.2. `authenticated`

`authenticated` recibe únicamente los contratos `api` aplicables a usuarios autenticados.

No recibe por defecto:

- acceso directo a owner schemas;
- acceso directo a `app_private`;
- acceso directo a `audit`;
- DML directo general sobre tablas empresariales;
- ejecución de helpers internos;
- privilegios por el solo hecho de estar autenticado.

##### 10.3. `service_role`

`service_role` es una credencial privilegiada de infraestructura y no un contrato público de cliente.

Reglas:

1. nunca se expone en frontend;
2. su capacidad no se usa como sustituto de autorización empresarial;
3. su acceso físico se gobierna como infraestructura privilegiada;
4. una RPC cliente no se vuelve legítima porque `service_role` pueda ejecutarla;
5. su presencia no cambia el principio de least privilege para `anon` y `authenticated`.

##### 10.4. `PUBLIC`

`PUBLIC` no se usa como mecanismo de concesión implícita para rutinas empresariales Vento.

Toda ejecución cliente debe provenir de un grant deliberado al rol aplicable, no de un `EXECUTE` genérico heredado.

---

#### 11. Privilegio de schema `USAGE`

`USAGE` se trata como requisito de acceso al namespace, no como autorización sobre datos u operaciones.

Reglas:

1. `anon` recibe `USAGE` sobre `api` únicamente cuando exista al menos un contrato `api` aprobado para acceso anónimo;
2. `authenticated` recibe `USAGE` sobre `api` cuando exista superficie contractual autenticada;
3. `USAGE` no concede `SELECT`, `INSERT`, `UPDATE`, `DELETE` ni `EXECUTE`;
4. no se concede `USAGE` cliente sobre owner schemas;
5. no se concede `USAGE` cliente sobre `app_private`;
6. no se concede `USAGE` cliente sobre `audit`;
7. cualquier excepción debe estar definida por una tarea propietaria y pruebas negativas.

---

#### 12. Grants sobre `READ_VIEW`

Una vista publicada como `READ_VIEW` recibe únicamente el `SELECT` requerido por su audiencia contractual.

Reglas:

1. `anon` obtiene `SELECT` solo cuando el contrato sea expresamente público;
2. `authenticated` obtiene `SELECT` solo cuando el contrato sea aplicable a usuarios autenticados;
3. no existe `SELECT ON ALL TABLES IN SCHEMA api` como sustituto de inventario contractual;
4. una vista no publicada no recibe grant cliente;
5. una vista `BLOCKED` por `AUTH-DB-018` no recibe grant;
6. las vistas expuestas usan `security_invoker=true` por defecto;
7. el privilegio del objeto no sustituye RLS ni autorización en sus fuentes.

---

#### 13. Grants sobre `QUERY_RPC` y `COMMAND_RPC`

Una rutina publicada recibe `EXECUTE` únicamente para los roles autorizados por su contrato.

Reglas:

1. no se usa `GRANT EXECUTE ON ALL FUNCTIONS` como política de exposición cliente;
2. `anon` solo ejecuta RPC expresamente públicas;
3. `authenticated` solo ejecuta RPC expresamente aprobadas para su audiencia;
4. helpers internos no reciben `EXECUTE` cliente;
5. rutinas `BLOCKED` no reciben grants;
6. las sobrecargas se conceden por firma exacta, no por nombre ambiguo;
7. `COMMAND_RPC` conserva autorización empresarial en el owner;
8. `QUERY_RPC` conserva límites de lectura y contexto;
9. la existencia de `EXECUTE` no demuestra por sí sola autorización.

---

#### 14. Tratamiento de `SECURITY DEFINER`

`AUTH-DB-018` fijó como objetivo:

```text
api_default_security_definer_rpc = 0
```

`AUTH-DB-017` aplica esa frontera a los privilegios:

1. una rutina `SECURITY DEFINER` no recibe grant cliente por herencia histórica;
2. una rutina privilegiada no se publica sin excepción canónica explícita;
3. una excepción futura debe demostrar autorización interna, `search_path` endurecido, referencias calificadas, errores, observabilidad y pruebas negativas;
4. `PUBLIC EXECUTE` sobre una rutina privilegiada es incompatible con el estado objetivo;
5. una rutina privilegiada interna permanece fuera de la superficie `api` salvo decisión específica posterior.

---

#### 15. Default privileges

La futura instancia debe endurecer privilegios predeterminados para impedir que objetos nuevos queden accesibles sin decisión explícita.

Principios:

```text
NUEVO OBJETO
≠
NUEVO ENDPOINT AUTORIZADO
```

Reglas:

1. los default privileges se configuran por rol creador/owner y schema aplicable;
2. no se asume que un `ALTER DEFAULT PRIVILEGES` global cubra objetos creados por otros owners;
3. nuevas rutinas Vento no heredan `EXECUTE` de `PUBLIC` como contrato cliente;
4. nuevas relaciones no reciben privilegios cliente generales por defecto;
5. `api` exige grants objeto por objeto o por manifiesto explícitamente generado desde contratos aprobados;
6. owner schemas, `app_private` y `audit` permanecen cerrados a roles cliente;
7. el harness debe crear objetos de prueba y demostrar que el default efectivo permanece cerrado;
8. cualquier cambio de owner exige revalidar default ACL.

---

#### 16. Estado remoto observado de privilegios

La auditoría read-only actual demuestra que la superficie heredada todavía es materialmente amplia.

##### 16.1. Relaciones observadas

Se observaron **325** relaciones o vistas relevantes en los schemas auditados.

Casos representativos:

| Schema    | Objetos | `anon` SELECT | `authenticated` SELECT | `authenticated` INSERT | `authenticated` UPDATE | `authenticated` DELETE |
| --------- | ------: | ------------: | ---------------------: | ---------------------: | ---------------------: | ---------------------: |
| `public`  |     246 |            18 |                    245 |                    242 |                    241 |                    241 |
| `pass`    |      27 |            20 |                     23 |                     21 |                     21 |                     21 |
| `pos`     |      13 |             0 |                     13 |                     13 |                     13 |                     13 |
| `club`    |      11 |             0 |                      8 |                      0 |                      0 |                      0 |
| `talento` |      13 |             1 |                     13 |                      4 |                      2 |                      0 |
| `viso`    |      12 |             0 |                      0 |                      0 |                      0 |                      0 |

La tabla es evidencia del AS-IS, no una orden de revocar en bloque sin reconciliar consumidores.

##### 16.2. Rutinas directas observadas

La auditoría de privilegios observó **224** rutinas Vento directas no administradas por extensión y no clasificadas como trigger-returning en el corte actual.

| Schema        | Rutinas directas | `PUBLIC EXECUTE` | `anon EXECUTE` | `authenticated EXECUTE` | `service_role EXECUTE` |
| ------------- | ---------------: | ---------------: | -------------: | ----------------------: | ---------------------: |
| `app_private` |                1 |                0 |              0 |                       0 |                      0 |
| `club`        |                7 |                5 |              5 |                       7 |                      7 |
| `pass`        |               19 |                5 |              5 |                      12 |                     19 |
| `public`      |              182 |               59 |             59 |                     160 |                    182 |
| `talento`     |               15 |                8 |              8 |                      15 |                     14 |
| **TOTAL**     |          **224** |           **77** |         **77** |                 **194** |                **222** |

Además, dentro de esas ejecuciones observadas existen rutinas `SECURITY DEFINER` accesibles por roles cliente.

Este baseline confirma que la transición de grants debe ser explícita y verificable.

---

#### 17. Drift respecto de la línea base anterior

`AUTH-DB-018` registró previamente un universo de **226** rutinas Vento directas para su clasificación.

La auditoría de privilegios de `AUTH-DB-017` observa actualmente **224** rutinas directas bajo el filtro aplicado a la superficie de grants.

La diferencia no se corrige ni se reescribe silenciosamente.

Reglas:

1. el baseline histórico de `AUTH-DB-018` permanece inmutable;
2. antes de materializar `AUTH-DB-017::GLOBAL` se regeneran ambos inventarios con consultas versionadas;
3. las dos identidades de diferencia deben clasificarse como drift real o diferencia de criterio de inventario;
4. ningún grant o revoke se ejecuta hasta reconciliar esa diferencia;
5. la evidencia debe registrar consulta, timestamp, entorno y resultado;
6. una identidad nueva o desaparecida obliga a revisar su disposición de `AUTH-DB-018` antes de cambiar privilegios.

---

#### 18. Configuración local observada

`supabase/config.toml` mantiene actualmente:

```toml
[api]
enabled = true
schemas = ["public", "graphql_public"]
extra_search_path = ["public", "extensions"]
max_rows = 1000
```

El objetivo de `AUTH-DB-017` no consiste en editar este archivo documentalmente, sino en cerrar el contrato que gobernará su futura modificación.

La futura instancia debe demostrar paridad entre:

- configuración versionada;
- configuración efectiva del entorno;
- catálogo de schemas;
- grants;
- default privileges;
- contratos publicados.

Una diferencia entre configuración local y efectiva se trata como drift y no como motivo para elegir silenciosamente una de las dos.

---

#### 19. Separación entre grants y RLS

Los grants y RLS resuelven problemas distintos.

```text
GRANT
→ puede permitir llegar al objeto

RLS / AUTORIZACIÓN
→ decide qué filas o efectos son legítimos
```

Por tanto:

1. RLS no sustituye un grant mínimo;
2. un grant no sustituye RLS;
3. `TO authenticated` no equivale a autorización por recurso;
4. una tabla no debe exponerse directamente para “aprovechar” una policy existente si el contrato objetivo es una vista o RPC;
5. `AUTH-DB-001..005` conservan ownership sobre las correcciones RLS/policies/grants legacy que les pertenecen;
6. `AUTH-DB-017` gobierna la frontera final de Data API y privilegios de contratos `api`.

---

#### 20. Matriz objetivo de exposición

| Superficie                      | Expuesta por Data API objetivo | `anon`                             | `authenticated`                       | Observación                        |
| ------------------------------- | ------------------------------ | ---------------------------------- | ------------------------------------- | ---------------------------------- |
| `api`                           | SÍ                             | solo contratos públicos aprobados  | solo contratos autenticados aprobados | única superficie empresarial Vento |
| owner schemas                   | NO                             | NO                                 | NO                                    | autoridad permanece interna        |
| `app_private`                   | NO                             | NO                                 | NO                                    | helpers técnicos privados          |
| `audit`                         | NO                             | NO                                 | NO                                    | evidencia transversal interna      |
| `public`                        | NO como objetivo empresarial   | compatibilidad temporal únicamente | compatibilidad temporal únicamente    | retiro condicionado a consumidores |
| `graphql_public`                | solo si plataforma lo requiere | según plataforma                   | según plataforma                      | no es contrato empresarial Vento   |
| schemas de plataforma/extensión | según plataforma               | no gobernado por esta tarea        | no gobernado por esta tarea           | excluir del contrato empresarial   |

---

#### 21. Matriz objetivo de privilegios en `api`

| Clase de objeto        | Privilegio cliente permitido             | Regla                                                 |
| ---------------------- | ---------------------------------------- | ----------------------------------------------------- |
| `READ_VIEW`            | `SELECT`                                 | solo audiencia contractual                            |
| `QUERY_RPC`            | `EXECUTE`                                | solo audiencia contractual                            |
| `COMMAND_RPC`          | `EXECUTE`                                | solo audiencia contractual y autorización propietaria |
| tabla autoritativa     | ninguno                                  | prohibida en `api`                                    |
| secuencia autoritativa | ninguno                                  | prohibida en `api`                                    |
| trigger function       | ninguno                                  | prohibida en `api`                                    |
| helper interno         | ninguno                                  | debe permanecer fuera de `api`                        |
| objeto `BLOCKED`       | ninguno                                  | requiere condición de salida                          |
| compatibilidad legacy  | no crea grant nuevo en `api` por sí sola | transición gobernada                                  |

---

#### 22. Manifiesto mínimo de grants

Antes de cualquier modificación física debe existir un manifiesto reproducible con, como mínimo:

```text
physical_identity
contract_type
source_disposition
target_schema
audience
schema_usage_required
object_privilege
security_mode
rls_dependency
legacy_privilege_before
target_privilege_after
compatibility_requirement
blocking_reason
exit_condition
migration_reference
environment
evidence
```

Integridad:

1. cada objeto `PUBLISH_API` aparece exactamente una vez;
2. ningún objeto interno aparece como contrato cliente;
3. toda sobrecarga usa firma exacta;
4. todo grant tiene audiencia explícita;
5. todo revoke legacy tiene evidencia de consumidor y salida;
6. ningún `BLOCKED` obtiene privilegio;
7. todo default privilege queda asociado a owner/creator real;
8. el manifiesto permite comparar before/after sin inferencia.

---

#### 23. Orden de futura materialización

La futura instancia deberá seguir:

```text
1. REGENERAR INVENTARIO DE SCHEMAS, OBJETOS Y ACL
2. RECONCILIAR DRIFT CON AUTH-DB-018
3. CONSTRUIR MANIFIESTO DE GRANTS
4. VALIDAR CONSUMIDORES LEGACY
5. MATERIALIZAR CONFIGURACIÓN OBJETIVO DE api
6. ENDURECER USAGE Y PRIVILEGIOS DE OBJETO
7. ENDURECER PUBLIC EXECUTE Y DEFAULT PRIVILEGES
8. CONSERVAR COMPATIBILIDAD QUE TODAVÍA TENGA CONSUMIDORES
9. EJECUTAR PRUEBAS POSITIVAS
10. EJECUTAR PRUEBAS NEGATIVAS
11. VALIDAR PARIDAD CONFIGURACIÓN/CATÁLOGO
12. VALIDAR DRIFT
13. CONSERVAR ROLLBACK Y EVIDENCIA
```

No se permite revocar primero y descubrir consumidores después.

---

#### 24. Compatibilidad y cutover

Todo acceso legacy se clasifica antes de retirarse.

Para cada privilegio heredado:

```text
PRIVILEGIO LEGACY
→ CONSUMIDOR IDENTIFICADO
→ CONTRATO OBJETIVO
→ MIGRACIÓN DEL CONSUMIDOR
→ PRUEBA POSITIVA DEL DESTINO
→ PRUEBA NEGATIVA DEL ORIGEN
→ REVOCACIÓN
```

Reglas:

1. una revocación no se aprueba solo porque el target architecture sea más restrictivo;
2. un acceso legacy sin consumidor identificado queda `BLOCKED`, no `RETIRE`;
3. retirar `public` de Data API exige demostrar migración de consumidores;
4. un rollback puede restaurar temporalmente la compatibilidad previa sin convertirla en estado objetivo;
5. la ventana de compatibilidad debe tener owner y condición de salida.

---

#### 25. Rollback

La futura instancia debe disponer de rollback probado.

El rollback debe poder restaurar, cuando sea necesario:

- la configuración de schemas expuestos anterior;
- `USAGE` requerido por consumidores todavía aprobados;
- grants de objeto retirados durante el cutover;
- default privileges modificados;
- compatibilidad legacy temporal.

Reglas:

1. rollback no restaura permisos más amplios que el baseline capturado;
2. no se usa `GRANT ALL` como mecanismo genérico de recuperación;
3. la restauración se basa en manifiesto y snapshot de ACL;
4. una corrección posterior se realiza mediante migración forward versionada;
5. rollback no altera datos empresariales.

---

#### 26. Observabilidad y evidencia

La materialización deberá registrar:

- proyecto y ambiente;
- SHA del contrato;
- configuración `api` before/after;
- schemas expuestos before/after;
- `extra_search_path` before/after;
- grants de schema;
- grants de vistas;
- grants de funciones por firma;
- `PUBLIC EXECUTE` before/after;
- default ACL before/after por owner;
- objetos bloqueados;
- consumidores legacy;
- pruebas positivas;
- pruebas negativas;
- drift final;
- referencia de migración;
- resultado de rollback ensayado.

No es suficiente registrar únicamente que una migración terminó con código cero.

---

#### 27. Pruebas positivas

La futura instancia deberá demostrar, como mínimo:

1. `api` responde únicamente para objetos contractuales aprobados;
2. un `READ_VIEW` autorizado puede consultarse por su audiencia;
3. una `QUERY_RPC` autorizada puede ejecutarse por su audiencia;
4. una `COMMAND_RPC` autorizada llega a la lógica propietaria sin transferir autoridad a `api`;
5. `authenticated` conserva solo los contratos necesarios;
6. `anon` conserva únicamente contratos expresamente públicos;
7. la configuración versionada coincide con la efectiva;
8. el default de un objeto nuevo de prueba permanece cerrado hasta grant explícito;
9. las firmas sobrecargadas conservan privilegios independientes;
10. compatibilidad aprobada continúa funcionando durante su ventana.

---

#### 28. Pruebas negativas

La futura instancia deberá demostrar, como mínimo:

1. `anon` no puede consultar owner schemas;
2. `authenticated` no puede consultar owner schemas directamente;
3. `anon` no puede usar `app_private`;
4. `authenticated` no puede usar `app_private`;
5. roles cliente no acceden directamente a `audit`;
6. un helper interno no puede ejecutarse como RPC cliente;
7. una vista `BLOCKED` no es accesible;
8. una rutina `BLOCKED` no es ejecutable;
9. una rutina no autorizada no obtiene acceso por `PUBLIC`;
10. una nueva función no queda ejecutable por `PUBLIC` por default accidental;
11. una nueva relación no obtiene grants cliente por default accidental;
12. `public` no queda como superficie empresarial objetivo después del cutover;
13. una RPC `SECURITY DEFINER` no obtiene acceso cliente sin excepción canónica;
14. un rol autenticado no obtiene privilegios adicionales solo por pertenecer a `authenticated`;
15. una sobrecarga no autorizada permanece inaccesible aunque otra firma del mismo nombre esté publicada.

---

#### 29. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Justificación:** la exposición de `api`, el cierre de schemas privados, grants mínimos, default privileges, seguridad de vistas y RPC, separación frente a RLS, compatibilidad y drift ya están protegidos por la arquitectura E3 y su Registro Canónico de Requisitos de Prueba. `AUTH-DB-017` convierte esa cobertura en un contrato documental de materialización sin introducir una capacidad nueva.

---

#### 30. Cobertura de prueba vigente reutilizada

Se reutiliza sin modificación la cobertura vigente asociada a la capa contractual `api`, la capa privada `app_private`, exposición, grants, vistas, RPC, seguridad, compatibilidad y drift.

La trazabilidad vigente incluye especialmente los rangos ya reconciliados por las tareas precedentes:

- `TREQ-SUPABASE-651..686`;
- `TREQ-SUPABASE-687..718`;
- `TREQ-SUPABASE-1047..1090`.

No se modifica ninguna fila del Registro Canónico de Requisitos de Prueba.

---

#### 31. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                                                                                                                                |
| --------- | -------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | la tarea documental no materializa código ni migraciones                                                                                                                                                                                                 |
| LOCAL     | NOT_EXECUTED   | pendiente del lifecycle documental y validadores del checkout de la tarea                                                                                                                                                                                |
| REMOTA    | PASS           | fuentes canónicas, `supabase/config.toml` y catálogo read-only de `vento-os-dev` auditados; `api` todavía no existe remotamente, la configuración local expone `public` y `graphql_public`, y persisten grants legacy amplios sobre relaciones y rutinas |
| OPERATIVA | NOT_APPLICABLE | no se modifican consumidores ni comportamiento runtime durante el desarrollo documental                                                                                                                                                                  |
| FÍSICA    | NOT_APPLICABLE | `AUTH-DB-017::GLOBAL` permanece sin autorización y no se ejecutó ninguna mutación Supabase                                                                                                                                                               |

---

#### 32. Decisiones vinculantes

1. `AUTH-DB-017` define una sola vez el contrato de exposición y grants.
2. Su futura instancia es `AUTH-DB-017::GLOBAL`.
3. Su modo es `GLOBAL_ENABLE_ONCE`.
4. Su gate es `PRE_E5_FOUNDATION`.
5. `api` es la única superficie empresarial Vento objetivo de Data API.
6. `graphql_public`, cuando aplique, es plataforma y no contrato empresarial Vento.
7. Los 26 owner schemas permanecen no expuestos a roles cliente.
8. `app_private` permanece no expuesto a roles cliente.
9. `audit` permanece no expuesto a roles cliente.
10. `public` no es superficie empresarial objetivo y su retiro se condiciona a migración de consumidores.
11. `extra_search_path` no se usa para exponer owner schemas.
12. `USAGE` sobre `api` no implica privilegios de objeto.
13. `anon` recibe únicamente contratos expresamente públicos.
14. `authenticated` recibe únicamente contratos expresamente aprobados para usuarios autenticados.
15. `service_role` es infraestructura privilegiada y no contrato cliente.
16. `PUBLIC` no se usa como mecanismo de exposición de rutinas empresariales.
17. `READ_VIEW` recibe únicamente `SELECT` de su audiencia contractual.
18. `QUERY_RPC` recibe únicamente `EXECUTE` de su audiencia contractual.
19. `COMMAND_RPC` recibe únicamente `EXECUTE` de su audiencia y conserva autorización en el owner.
20. No se usan grants generales sobre todas las funciones como sustituto de inventario contractual.
21. Ningún objeto `BLOCKED` recibe privilegios.
22. Las sobrecargas se gobiernan por firma exacta.
23. Las vistas expuestas usan `security_invoker=true` por defecto.
24. `api` conserva objetivo de cero RPC `SECURITY DEFINER` por defecto.
25. Default privileges se endurecen por owner/creator y schema.
26. Un objeto nuevo no se vuelve endpoint autorizado automáticamente.
27. Grants y RLS son capas distintas.
28. `AUTH-DB-001..005` conservan ownership de RLS, policies y contención que les corresponde.
29. La transición desde grants legacy es consumer-aware y fail-closed.
30. La materialización captura ACL before/after y permite rollback.
31. El drift de 226 a 224 rutinas observadas se reconcilia antes de cualquier revoke/grant.
32. La configuración local legacy no se modifica durante esta tarea documental.
33. Toda futura modificación Supabase se versiona desde `vento-shell`.
34. Esta tarea no crea ni modifica requisitos de prueba.
35. La aprobación documental no autoriza ninguna modificación física.

---

#### 33. Criterios de aceptación

`AUTH-DB-017` queda documentalmente completa cuando:

1. `api` queda definido como única superficie empresarial Vento objetivo de Data API;
2. se separa explícitamente `graphql_public` como plataforma;
3. se prohíbe exposición directa de owner schemas, `app_private` y `audit`;
4. se define la salida controlada de `public` como superficie empresarial;
5. se gobierna `extra_search_path`;
6. se separan `anon`, `authenticated`, `service_role` y `PUBLIC`;
7. se define `USAGE` como privilegio de namespace y no como autorización;
8. `READ_VIEW` recibe solo `SELECT` explícito;
9. `QUERY_RPC` y `COMMAND_RPC` reciben solo `EXECUTE` explícito;
10. las sobrecargas se gobiernan por firma;
11. `PUBLIC EXECUTE` deja de ser mecanismo de exposición;
12. default privileges quedan definidos fail-closed;
13. se conserva `security_invoker=true` para vistas expuestas;
14. se conserva objetivo de cero `SECURITY DEFINER` en `api` por defecto;
15. se separan grants y RLS;
16. se documenta el baseline legacy actual;
17. se registra el drift observado respecto de `AUTH-DB-018`;
18. se exige manifiesto de grants;
19. se define cutover consumer-aware;
20. se define rollback;
21. se definen pruebas positivas y negativas;
22. se declaran cero cambios TREQ;
23. `AUTH-DB-019` queda como única continuidad reservada.

---

#### 34. Límites

`AUTH-DB-017` no:

- ejecuta SQL de mutación;
- crea migraciones;
- modifica `supabase/config.toml`;
- modifica la configuración remota de Data API;
- crea el schema `api`;
- mueve vistas;
- mueve funciones;
- mueve tablas;
- cambia datos;
- cambia columnas;
- ejecuta backfills;
- modifica RLS;
- modifica policies;
- cambia Supabase Auth;
- cambia sesiones;
- cambia Storage;
- cambia Realtime;
- cambia Edge Functions;
- cambia cron;
- cambia secretos;
- concede o revoca físicamente `USAGE`;
- concede o revoca físicamente `SELECT`;
- concede o revoca físicamente `EXECUTE`;
- cambia físicamente default privileges;
- retira físicamente `public`;
- modifica consumidores;
- reabre la clasificación de `AUTH-DB-018`;
- modifica VITAL;
- modifica el registro 04A;
- autoriza `AUTH-DB-017::GLOBAL`;
- desarrolla `AUTH-DB-019`.

---

#### 35. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-DB-018 — Separar vistas y RPC expuestas de helpers internos`

**TAREA ACTUAL APROBADA**
`AUTH-DB-017 — Configurar esquemas expuestos y privilegios de Data API`

**SIGUIENTE TAREA RESERVADA**
`AUTH-DB-019 — Implementar vínculos canónicos entre Auth e identidades empresariales`


### ✅ AUTH-DB-019 — Implementar vínculos canónicos entre Auth e identidades empresariales

**Estado:** APROBADA
**Tarea anterior:** AUTH-DB-017 — Configurar esquemas expuestos y privilegios de Data API
**Tarea siguiente:** AUTH-DB-033 — Implementar get_access_context canónico, sus resolvers privados y su proyección segura
**Tipo de tarea:** Documental
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/02_R1_FUNDACION_FISICA_CANONICA.md`
**Estado físico resultante:** Contrato de materialización de vínculos canónicos entre Supabase Auth e identidades empresariales cerrado; futura instancia global `AUTH-DB-019::GLOBAL` pendiente de autorización explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`AUTH-DB-019` define el contrato de materialización física futura de los vínculos entre el plano administrado de Supabase Auth y las identidades empresariales de Vento, sin convertir `auth.users`, `auth.identities`, JWT, metadata, correo, teléfono ni una coincidencia histórica de UUID en fuente de verdad empresarial.

La regla central es:

```text
SUPABASE AUTH
→ autentica credenciales y mantiene el sujeto técnico

identity_access
→ gobierna principal y vínculo empresarial

OWNER SCHEMA DE DOMINIO
→ gobierna EMPLOYEE, CUSTOMER o DEVICE

ACTOR EFECTIVO
→ se resuelve después del vínculo y antes de autorización
```

La tarea no crea vínculos, no migra identidades y no modifica Auth. Cierra el diseño verificable que una futura instancia `AUTH-DB-019::GLOBAL` deberá materializar.

---

#### 2. Resultado canónico

Queda definido el resultado objetivo:

```text
AUTH-DB-019
→ contrato documental único

AUTH-DB-019::GLOBAL
→ futura instancia física global reutilizable

resultado esperado
→ auth.users conserva identidad técnica de autenticación
→ identity_access conserva principal y vínculos empresariales
→ EMPLOYEE permanece en workforce
→ CUSTOMER permanece en customer_engagement
→ DEVICE permanece en technology_operations
→ cada vínculo posee identidad propia y lifecycle auditable
→ las cardinalidades incompatibles fallan cerradas
→ ningún vínculo se infiere desde contacto, metadata o coincidencia legacy
→ la eliminación o sustitución de una cuenta Auth no elimina la identidad empresarial
```

---

#### 3. Topología y gate

La reconciliación vigente de R1 establece:

```text
mode = GLOBAL_ENABLE_ONCE
execution_gate = PRE_E5_FOUNDATION
instance = AUTH-DB-019::GLOBAL
```

Consecuencias:

1. existe como máximo una instancia física global;
2. no se crea una instancia por paquete;
3. la fundación puede materializarse antes de E5;
4. la aprobación documental no autoriza la instancia física;
5. la futura implementación no puede migrar verticales ni considerar aprobado un paquete consumidor;
6. todo cambio físico deberá ser versionado en `vento-shell`, reversible y validado.

---

#### 4. Fuentes vinculantes y precedencia

La tarea consume y preserva:

- `SUPA-ARC-001`, para separar Auth administrado de identidad empresarial;
- `SUPA-ARC-003`, para `identity_access` como `VSCHEMA-023`;
- `SUPA-ARC-008`, para los planos de Auth, principal, identidad y actor;
- `SUPA-ARC-009`, para cardinalidad, lifecycle, procedencia, conflictos y resolución de vínculos;
- `SUPA-ARC-010`, para sesión, revocación y desactivación;
- `SUPA-ARC-011` y `SUPA-ARC-012`, para nombres, claves, constraints, estados y timestamps;
- `AUTH-DB-016`, para la topología de schemas objetivo;
- `AUTH-DB-018`, para separación de contratos expuestos e internos;
- `AUTH-DB-017`, para exposición Data API y privilegios;
- `AUTH-DB-001..005`, para RLS, policies, funciones privilegiadas y grants;
- `AUTH-DB-033`, `AUTH-DB-035`, `AUTH-DB-034` y `AUTH-DB-032`, como consumidores posteriores de principal, contexto, evaluación y decisión.

Precedencia:

```text
SUPA-ARC-008/009
→ fija semántica y cardinalidades

AUTH-DB-019
→ fija materialización futura del vínculo

AUTH-DB-033/035/034/032
→ consume la identidad resuelta; no redefine el vínculo
```

---

#### 5. Clasificación de la tarea

```text
TAREA = AUTH-DB-019
NATURALEZA = DOCUMENTAL
MODO = GLOBAL_ENABLE_ONCE
INSTANCIA FUTURA = AUTH-DB-019::GLOBAL
GATE = PRE_E5_FOUNDATION
```

La tarea documental puede desarrollarse mientras existe un carril físico independiente. La prioridad física no suspende esta continuidad documental.

---

#### 6. Planos de identidad obligatorios

Se preservan cuatro planos distintos:

| Plano                 | Autoridad                                                                                  |
| --------------------- | ------------------------------------------------------------------------------------------ |
| Auth administrado     | `auth.users`, `auth.identities`, credenciales, sesiones y factores                         |
| Principal empresarial | `identity_access`                                                                          |
| Identidad de dominio  | `workforce`, `customer_engagement`, `technology_operations` y actor técnico cuando aplique |
| Actor efectivo        | resolución atribuible usada por contexto, autorización y auditoría                         |

Ningún plano sustituye a otro.

---

#### 7. Clases de principal autenticado

Se preservan exactamente tres clases:

- `HUMAN_USER`;
- `SHARED_DEVICE`;
- `SERVICE`.

Cada sujeto autenticado resuelve exactamente una clase primaria. Una misma cuenta no puede interpretarse simultáneamente como humana y dispositivo compartido.

---

#### 8. Clases de identidad empresarial

Se preservan exactamente cuatro clases:

- `EMPLOYEE`;
- `CUSTOMER`;
- `DEVICE`;
- `SYSTEM_ACTOR`.

`EMPLOYEE`, `CUSTOMER` y `DEVICE` conservan autoridad en sus dominios propietarios. `identity_access` conserva el vínculo y la resolución, no duplica sus perfiles.

---

#### 9. Objeto canónico de vínculo

Todo vínculo Auth ↔ identidad empresarial es un objeto explícito gobernado por `identity_access` y posee identidad propia.

Debe representar, como mínimo:

```text
enterprise_identity_link_id
auth_subject_id
principal_kind
enterprise_identity_kind
enterprise_identity_id
link_state
link_origin
assurance_level
authority_reference
reason_code
created_at
verified_at
activated_at
suspended_at
revoked_at
superseded_at
supersedes_link_id
resolution_case_id
source_version
audit_reference
```

La futura forma SQL deberá respetar esta semántica sin inventar autoridad adicional.

---

#### 10. Independencia de identificadores

1. `auth_subject_id` referencia al sujeto técnico administrado por Supabase;
2. `employee_id`, `customer_id` y `device_id` permanecen estables en sus owner schemas;
3. `enterprise_identity_link_id` identifica el vínculo, no la persona ni la cuenta;
4. reemplazar una cuenta Auth no renumera la identidad empresarial;
5. la igualdad física legacy entre `employees.id` y `auth.users.id` no es contrato objetivo;
6. ningún ID se deriva de correo, teléfono, provider, metadata o nombre.

---

#### 11. Cardinalidad desde la cuenta Auth

| Principal       | `EMPLOYEE` activo | `CUSTOMER` activo |                                       `DEVICE` activo |
| --------------- | ----------------: | ----------------: | ----------------------------------------------------: |
| `HUMAN_USER`    |              0..1 |              0..1 |                                                     0 |
| `SHARED_DEVICE` |                 0 |                 0 | 1 cuando el dispositivo requiera autenticación propia |
| `SERVICE`       |                 0 |                 0 |                                                     0 |

La combinación `EMPLOYEE + CUSTOMER` es la única multiidentidad humana aprobada y conserva dos vínculos independientes.

---

#### 12. Cardinalidad desde la identidad empresarial

| Identidad  |                                                    Cuentas Auth activas permitidas |
| ---------- | ---------------------------------------------------------------------------------: |
| `EMPLOYEE` |                                                                               0..1 |
| `CUSTOMER` |                                                                               0..1 |
| `DEVICE`   | 0..1; exactamente 1 cuando el dispositivo habilitado requiera autenticación propia |

Una segunda reclamación activa no reemplaza silenciosamente la primera: exige conflicto o supersesión formal.

---

#### 13. Compatibilidad y exclusiones

```text
EMPLOYEE + CUSTOMER
= COMPATIBLE PARA HUMAN_USER

EMPLOYEE + DEVICE
= PROHIBIDO EN LA MISMA CUENTA

CUSTOMER + DEVICE
= PROHIBIDO EN LA MISMA CUENTA

HUMAN_USER + SHARED_DEVICE
= PROHIBIDO COMO CLASIFICACIÓN SIMULTÁNEA

SERVICE + EMPLOYEE/CUSTOMER/DEVICE
= PROHIBIDO
```

Las combinaciones incompatibles fallan cerradas.

---

#### 14. Lifecycle del vínculo

Se preserva el vocabulario cerrado de seis estados:

| Estado                 |               Participa en resolución normal |
| ---------------------- | -------------------------------------------: |
| `PENDING_VERIFICATION` |                                           no |
| `ACTIVE`               | sí, sujeto al estado vigente de la identidad |
| `SUSPENDED`            |                                           no |
| `REVOKED`              |                                           no |
| `SUPERSEDED`           |                                           no |
| `CONFLICT`             |                                           no |

Solo `ACTIVE` puede participar en resolución empresarial normal.

---

#### 15. Origen del vínculo

Se preservan seis clases de origen:

- `STAFF_INVITATION`;
- `CUSTOMER_SELF_ENROLLMENT`;
- `ADMIN_DEVICE_PROVISIONING`;
- `VERIFIED_IDENTITY_CLAIM`;
- `LEGACY_MIGRATION`;
- `MANUAL_RECONCILIATION`.

`LEGACY_MIGRATION` no equivale a verificación automática.

---

#### 16. Clases de conflicto

Toda ambigüedad se clasifica mediante una de ocho clases:

- `AUTH_ACCOUNT_DUPLICATE`;
- `ENTERPRISE_IDENTITY_DUPLICATE`;
- `IDENTITY_LINK_DUPLICATE`;
- `CROSS_CLASS_COLLISION`;
- `CONTACT_MATCH_ONLY`;
- `ORPHAN_PROFILE`;
- `LEGACY_SHARED_UUID`;
- `DEVICE_HUMAN_COLLISION`.

La existencia de conflicto bloquea activación automática.

---

#### 17. Resultados de resolución

Se preservan seis resultados lógicos:

- `LINK_EXISTING_IDENTITY`;
- `CREATE_NEW_ENTERPRISE_IDENTITY`;
- `KEEP_UNLINKED`;
- `SPLIT_PRINCIPAL`;
- `SUPERSEDE_LINK`;
- `REJECT_AND_ESCALATE`.

La futura implementación debe producir un resultado inequívoco y auditable.

---

#### 18. Códigos mínimos de denegación

Se preservan, como mínimo:

```text
identity_link_missing
identity_link_pending
identity_link_inactive
identity_link_ambiguous
identity_link_conflict
principal_class_conflict
enterprise_identity_already_claimed
device_principal_not_dedicated
contact_match_requires_reconciliation
```

Los consumidores no reinterpretan estos códigos como éxito parcial.

---

#### 19. Vínculo laboral

Un vínculo `EMPLOYEE` activo requiere:

```text
HUMAN_USER
+ EMPLOYEE existente
+ origen autorizado
+ verificación suficiente
+ ausencia de otro vínculo EMPLOYEE activo para la cuenta
+ ausencia de otra cuenta activa para el EMPLOYEE
= ACTIVE
```

Una invitación propone o acredita el proceso correspondiente; no convierte por sí sola la cuenta en empleado.

---

#### 20. Vínculo de cliente

Un vínculo `CUSTOMER` activo conserva separación comercial:

1. un perfil puede existir sin Auth;
2. onboarding distingue creación de reclamación;
3. contacto coincidente genera candidato o conflicto, no vínculo automático;
4. una cuenta laboral puede además ser cliente sin modificar el vínculo laboral;
5. la baja laboral no elimina la identidad de cliente;
6. saldos, puntos, consentimientos y pedidos permanecen en su owner.

---

#### 21. Vínculo de dispositivo compartido

Un `SHARED_DEVICE`:

1. usa cuenta técnica dedicada;
2. mantiene como máximo un vínculo `DEVICE` activo;
3. no conserva `EMPLOYEE` ni `CUSTOMER` activos;
4. no recibe rol humano por existir una sesión Auth;
5. para mutaciones empresariales debe resolver una sesión de actor vigente y un `EMPLOYEE` activo;
6. sin actor solo puede ejecutar capacidades técnicas nominales aprobadas.

---

#### 22. Servicios y actores técnicos

`SERVICE` no usa vínculos `EMPLOYEE`, `CUSTOMER` o `DEVICE`.

Los servicios conservan identidad técnica, proceso, ambiente y operaciones permitidas mediante sus contratos propietarios. `service_role` es credencial privilegiada, no principal empresarial universal ni actor humano.

---

#### 23. Resolución server-side

La resolución confiable sigue:

```text
credencial válida
→ auth_subject_id
→ principal_kind
→ vínculo ACTIVE requerido
→ identidad empresarial vigente
→ actor efectivo cuando aplique
→ contexto
→ autorización
```

El cliente no puede sustituir `employee_id`, `customer_id`, `device_id`, principal, rol o actor mediante parámetros.

---

#### 24. Contactos y metadata no son autoridad

Correo, teléfono, documento, nombre, provider, `raw_user_meta_data`, `raw_app_meta_data` o coincidencia de UUID pueden aportar evidencia de reconciliación, pero no activan un vínculo por sí solos.

Toda ambigüedad produce caso de reconciliación o denegación cerrada.

---

#### 25. Eliminación, reemplazo y supersesión

La eliminación o sustitución de una cuenta Auth:

```text
CIERRA O SUPERSEDE EL VÍNCULO
NO ELIMINA EMPLOYEE/CUSTOMER/DEVICE
NO REESCRIBE HISTORIA
NO BORRA AUDITORÍA
```

La corrección de un vínculo crea historia de supersesión; no sobrescribe silenciosamente la relación anterior.

---

#### 26. Línea base remota vigente

La auditoría read-only actual de `vento-os-dev` observa:

```text
auth.users = 78
auth.identities = 78
```

La arquitectura histórica de `SUPA-ARC-009` documentó 73 cuentas e identidades. La diferencia se registra como drift temporal y no reescribe retrospectivamente el baseline aprobado.

En los schemas Vento auditados `app_private`, `club`, `pass`, `payments`, `pos`, `public`, `talento` y `viso` existen actualmente **73 foreign keys** directas hacia `auth.users`:

| Schema     | CASCADE | NO ACTION | RESTRICT | SET NULL |  Total |
| ---------- | ------: | --------: | -------: | -------: | -----: |
| `club`     |       7 |         0 |        0 |        1 |      8 |
| `pass`     |       3 |         0 |        1 |        0 |      4 |
| `payments` |       1 |         0 |        0 |        0 |      1 |
| `public`   |      11 |        24 |        2 |       23 |     60 |
| **TOTAL**  |  **22** |    **24** |    **3** |   **24** | **73** |

`public.employees.id → auth.users.id` continúa con `ON DELETE CASCADE`, confirmando que el acoplamiento legacy todavía existe físicamente.

`vital` conserva referencias adicionales a Auth, pero permanece fuera del alcance normal de los 26 owner schemas y no se absorbe en esta tarea.

---

#### 27. Clasificación de referencias Auth actuales

No toda FK hacia `auth.users` se convierte en `enterprise_identity_link`.

La futura instancia deberá clasificar cada referencia como una de estas finalidades:

1. vínculo canónico de identidad;
2. atribución histórica o auditoría;
3. referencia de cliente transaccional;
4. referencia de dispositivo;
5. referencia de actor o aprobador;
6. compatibilidad legacy;
7. referencia técnica administrada permitida;
8. `BLOCKED` pendiente de owner o transición.

Solo la primera clase se materializa como vínculo canónico en `identity_access`. Las demás conservan su owner y reciben transición propia cuando corresponda.

---

#### 28. Manifiesto mínimo de futura materialización

Antes de cualquier mutación debe existir un manifiesto con, como mínimo:

```text
source_identity
source_schema
source_table
source_column
reference_purpose
principal_kind
enterprise_identity_kind
enterprise_identity_id_source
link_origin
initial_link_state
authority_reference
conflict_class
consumer_inventory
compatibility_requirement
target_identity
migration_action
rollback_action
evidence
```

Cada referencia aplicable se clasifica exactamente una vez, sin faltantes ni duplicados.

---

#### 29. Frontera con `AUTH-DB-033`, `035`, `034` y `032`

`AUTH-DB-019` produce la base de identidad que consumen las tareas posteriores:

- `AUTH-DB-033` resuelve `get_access_context`;
- `AUTH-DB-035` gobierna frescura e invalidación del contexto;
- `AUTH-DB-034` evalúa autorización;
- `AUTH-DB-032` persiste y vincula decisiones.

Ninguna de esas tareas puede redefinir cardinalidades, lifecycle o ownership del vínculo.

---

#### 30. Frontera con Data API, RLS y Auth

`AUTH-DB-019` no modifica:

- schemas expuestos;
- grants de Data API;
- RLS;
- policies;
- configuración de Supabase Auth;
- providers;
- sesiones;
- MFA;
- tokens;
- metadata Auth;
- Edge Functions;
- Storage;
- Realtime.

La creación del vínculo no concede autorización empresarial por sí sola.

---

#### 31. Estrategia de futura materialización

La futura instancia seguirá una transición no destructiva:

```text
1. REGENERAR BASELINE REMOTO
2. INVENTARIAR REFERENCIAS AUTH Y CONSUMIDORES
3. CLASIFICAR 100 % DEL UNIVERSO
4. RECONCILIAR CUENTAS MIXTAS Y COLISIONES
5. CREAR ESTRUCTURAS OBJETIVO SIN RETIRAR LEGACY
6. MATERIALIZAR VÍNCULOS VERIFICABLES
7. VALIDAR CARDINALIDADES Y DENEGACIONES
8. MIGRAR CONSUMIDORES POR LOTES
9. PROBAR PARIDAD Y AUDITORÍA
10. RETIRAR ACOPLAMIENTOS LEGACY SOLO CON CERO DEPENDENCIAS
11. VALIDAR DRIFT Y ROLLBACK
```

No se permite crear vínculos masivamente a partir de correo, teléfono o igualdad de UUID sin evidencia y clasificación.

---

#### 32. Compatibilidad y rollback

La transición es consumer-aware y reversible.

1. `employees.id = auth.users.id` puede mantenerse temporalmente mientras existan consumidores;
2. una FK `CASCADE` legacy no se retira antes de demostrar su reemplazo;
3. perfiles cliente sin Auth no se provisionan automáticamente;
4. cuentas mixtas dispositivo-persona se separan mediante caso controlado;
5. rollback restaura compatibilidad previa sin eliminar identidades nuevas válidas ni historia;
6. ningún rollback usa `GRANT ALL`, recreación masiva de usuarios o borrado de vínculos históricos;
7. correcciones posteriores usan migraciones forward versionadas.

---

#### 33. Pruebas positivas y negativas

La futura instancia deberá demostrar, como mínimo:

**Positivas**

1. `HUMAN_USER` resuelve un único `EMPLOYEE` activo cuando corresponde;
2. `HUMAN_USER` puede coexistir con un `CUSTOMER` activo independiente;
3. `SHARED_DEVICE` resuelve un único `DEVICE` activo;
4. reemplazar la cuenta Auth conserva IDs empresariales;
5. supersesión conserva historia;
6. vínculos migrados conservan origen y evidencia;
7. `AUTH-DB-033` puede consumir una identidad resuelta inequívoca.

**Negativas**

1. dos vínculos `EMPLOYEE` activos para una cuenta fallan;
2. dos cuentas activas para un `EMPLOYEE` fallan;
3. `SHARED_DEVICE + CUSTOMER` falla;
4. `SHARED_DEVICE + EMPLOYEE` falla;
5. `SERVICE` reclamando identidad humana falla;
6. `PENDING_VERIFICATION`, `SUSPENDED`, `REVOKED`, `SUPERSEDED` y `CONFLICT` no autorizan resolución;
7. un contacto coincidente no activa vínculo;
8. IDs enviados por cliente no sustituyen la identidad resuelta;
9. borrar una cuenta Auth no elimina la identidad empresarial;
10. una referencia Auth no clasificada bloquea cutover.

---

#### 34. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Justificación:** el modelo de Auth, principal, vínculos, cardinalidad, lifecycle, colisiones, linking, separación de identificadores, resolución server-side, transición y drift ya posee cobertura canónica vigente derivada de `SUPA-ARC-008` y `SUPA-ARC-009`. Esta tarea convierte esas decisiones en contrato de materialización sin introducir una regla protegida nueva.

---

#### 35. Cobertura de prueba vigente reutilizada

Se reutiliza sin modificación la cobertura existente asociada especialmente a:

- `TREQ-SUPABASE-757..796`, para separación Auth/identidad, principal y actor;
- `TREQ-SUPABASE-797..836`, para vínculos Auth ↔ identidad empresarial, cardinalidades, lifecycle, conflictos, transición y drift.

Estos identificadores son trazabilidad de requisitos vigentes; no se modifica ninguna fila del registro.

---

#### 36. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                                                                                                            |
| --------- | -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| BUILD     | NOT_EXECUTED   | la tarea documental no crea código ni migraciones                                                                                                                                                                                    |
| LOCAL     | NOT_EXECUTED   | pendiente del lifecycle documental y validadores del checkout                                                                                                                                                                        |
| REMOTA    | PASS           | fuentes canónicas vigentes y auditoría read-only de `vento-os-dev`: 78 `auth.users`, 78 `auth.identities`, 73 FKs directas hacia `auth.users` en los schemas Vento auditados y `public.employees.id` todavía con `ON DELETE CASCADE` |
| OPERATIVA | NOT_APPLICABLE | no se alteraron consumidores ni comportamiento runtime                                                                                                                                                                               |
| FÍSICA    | NOT_APPLICABLE | `AUTH-DB-019::GLOBAL` permanece sin autorización física y no se ejecutó ninguna mutación                                                                                                                                             |

---

#### 37. Decisiones vinculantes

1. La futura instancia es `AUTH-DB-019::GLOBAL`.
2. Su modo es `GLOBAL_ENABLE_ONCE`.
3. Su gate es `PRE_E5_FOUNDATION`.
4. Supabase Auth conserva autoridad sobre credenciales y sesión técnica.
5. `identity_access` conserva autoridad sobre principal y vínculo empresarial.
6. Los perfiles de dominio permanecen en sus owner schemas.
7. Se preservan tres clases de principal autenticado.
8. Se preservan cuatro clases de identidad empresarial.
9. Cada vínculo tiene identidad propia.
10. `auth_subject_id` no es ID empresarial universal.
11. `EMPLOYEE`, `CUSTOMER` y `DEVICE` conservan IDs estables independientes de Auth.
12. `HUMAN_USER` admite como máximo un `EMPLOYEE` y un `CUSTOMER` activos.
13. `SHARED_DEVICE` admite únicamente un `DEVICE` activo cuando requiere autenticación.
14. `SERVICE` no reclama vínculos humanos o de dispositivo.
15. `EMPLOYEE + CUSTOMER` es compatible y permanece separado.
16. `EMPLOYEE + DEVICE` y `CUSTOMER + DEVICE` son incompatibles.
17. Se preservan seis estados de lifecycle y solo `ACTIVE` participa en resolución normal.
18. Se preservan seis orígenes de vínculo.
19. Se preservan ocho clases de conflicto.
20. Se preservan seis resultados de resolución.
21. Los códigos de denegación son estables y fail-closed.
22. Correo, teléfono, documento, provider y metadata no crean vínculos automáticamente.
23. La igualdad legacy `employees.id = auth.users.id` no es contrato objetivo.
24. Eliminar o sustituir Auth no elimina la identidad empresarial.
25. La supersesión conserva historia y auditoría.
26. No toda FK hacia Auth se convierte en vínculo de identidad.
27. La línea base actual de Auth es 78/78 y debe regenerarse antes de materializar.
28. Las 73 FKs auditadas requieren clasificación antes de cutover.
29. `vital` permanece fuera del alcance normal de esta tarea.
30. La transición es no destructiva y consumer-aware.
31. `AUTH-DB-033` consume el resultado sin redefinirlo.
32. Data API, RLS y Auth config permanecen fuera del alcance.
33. No se crean ni modifican requisitos de prueba.
34. La aprobación documental no autoriza cambios físicos.

---

#### 38. Criterios de aceptación

`AUTH-DB-019` queda documentalmente completa cuando:

- queda separada la autoridad de Auth, principal, identidad y actor;
- se preservan exactamente las clases y cardinalidades de `SUPA-ARC-008/009`;
- el vínculo posee identidad, campos mínimos, lifecycle, origen y evidencia;
- las combinaciones incompatibles fallan cerradas;
- se prohíbe linking automático por contacto o metadata;
- se preserva independencia de IDs empresariales;
- se prohíbe cascade conceptual desde Auth a la identidad empresarial;
- se clasifica el baseline remoto actual sin convertirlo en arquitectura objetivo;
- se registra el drift 73 → 78 cuentas respecto del baseline histórico;
- se registran 73 FKs directas en los schemas Vento auditados como universo de reconciliación, no como 73 vínculos canónicos;
- se define manifiesto completo antes de mutar;
- se define transición consumer-aware y rollback;
- se definen pruebas positivas y negativas;
- se declaran cero cambios TREQ;
- `AUTH-DB-033` queda como única continuidad reservada.

---

#### 39. Límites

`AUTH-DB-019` no:

- ejecuta SQL de mutación;
- crea migraciones;
- crea tablas o constraints;
- crea vínculos físicos;
- modifica `auth.users`;
- modifica `auth.identities`;
- crea o elimina cuentas;
- cambia providers;
- cambia sesiones o tokens;
- modifica metadata Auth;
- mueve perfiles de dominio;
- desacopla todavía `employees.id` de Auth;
- elimina FKs;
- ejecuta backfills;
- modifica datos;
- modifica RLS;
- modifica policies;
- cambia Data API o grants;
- modifica Storage, Realtime, Edge Functions o cron;
- modifica VITAL;
- modifica el registro 04A;
- autoriza `AUTH-DB-019::GLOBAL`;
- desarrolla `AUTH-DB-033`.

---

#### 40. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-DB-017 — Configurar esquemas expuestos y privilegios de Data API`

**TAREA ACTUAL APROBADA**
`AUTH-DB-019 — Implementar vínculos canónicos entre Auth e identidades empresariales`

**SIGUIENTE TAREA RESERVADA**
`AUTH-DB-033 — Implementar get_access_context canónico, sus resolvers privados y su proyección segura`


### ✅ AUTH-DB-033 — Implementar get_access_context canónico, sus resolvers privados y su proyección segura

**Estado:** APROBADA
**Tarea anterior:** AUTH-DB-019 — Implementar vínculos canónicos entre Auth e identidades empresariales
**Tarea siguiente:** AUTH-DB-035 — Implementar token transaccional de frescura e invalidación del contexto
**Tipo de tarea:** Documental
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/02_R1_FUNDACION_FISICA_CANONICA.md`
**Estado físico resultante:** Contrato de materialización del resolver canónico `get_access_context`, sus resolvers privados, fingerprints, serialización y proyección segura cerrado; futura instancia global `AUTH-DB-033::GLOBAL` pendiente de autorización explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`AUTH-DB-033` cierra el contrato de materialización física futura del contexto real de acceso de Vento OS.

La tarea transforma el diseño aprobado de `AUTH-CTX-025` en una especificación física única, verificable y reversible para:

```text
SESIÓN TÉCNICA REAL
+
APLICACIÓN CANÓNICA
+
PRINCIPAL EMPRESARIAL
+
ACTOR EFECTIVO
+
IDENTIDAD LABORAL O DE DOMINIO
+
CONTEXTO OPERATIVO
+
DISPOSITIVO
+
INSTANTE Y SNAPSHOT ÚNICOS
=
AccessContext@1.0.0
```

La función resuelve hechos.

No decide permisos, no resuelve recursos de una acción, no ejecuta operaciones empresariales y no sustituye `evaluate_authorization`.

Regla central:

```text
get_access_context
→ RESUELVE CONTEXTO REAL

evaluate_authorization
→ DECIDE AUTORIZACIÓN

PROYECCIÓN SEGURA
→ PRESENTA CONTEXTO MÍNIMO

NINGUNA DE LAS TRES CAPAS
→ CONCEDE AUTORIDAD POR INFERENCIA
```

---

#### 2. Resultado canónico

Queda definido el siguiente resultado objetivo:

```text
AUTH-DB-033
→ contrato documental único

AUTH-DB-033::GLOBAL
→ futura instancia física global reutilizable

app_private.get_access_context(text)
→ resolver canónico completo
→ AccessContext@1.0.0
→ no expuesto directamente al cliente

app_private.*
→ resolvers y helpers privados
→ no ejecutables por anon ni authenticated

api.get_safe_access_context(text)
→ única proyección SQL cliente de esta tarea
→ payload mínimo y no autoritativo
→ sin evidencia interna ni autoridad ejecutable
```

La instancia física futura deberá producir migraciones versionadas en `vento-shell`, pruebas reproducibles y evidencia de rollback.

---

#### 3. Topología y gate

La clasificación recomputada desde `task-work-topology.json` es:

```text
task_id = AUTH-DB-033
mode = GLOBAL_ENABLE_ONCE
instance = AUTH-DB-033::GLOBAL
execution_gate = PRE_E5_FOUNDATION
canonical_work = DEFINE_CONTRACT_ONCE
```

Consecuencias:

1. existe como máximo una instancia física global;
2. no se repite por `package_id`;
3. la tarea documental se desarrolla una sola vez;
4. la aprobación documental no autoriza la instancia;
5. la instancia física se autoriza únicamente cuando sus prerrequisitos técnicos estén verificados;
6. la futura materialización se reutiliza por todos los consumidores autorizados;
7. una corrección posterior se realiza mediante migración forward versionada.

---

#### 4. Fuentes vinculantes y precedencia

`AUTH-DB-033` consume y preserva, sin redefinirlas:

- `ADR-AUTH-001`;
- `AUTH-MOD-001..021`;
- `AUTH-CAT-001..024`;
- `AUTH-RBAC-001..028`;
- `AUTH-CTX-001` — `AccessContext`;
- `AUTH-CTX-004` — versionado y serialización;
- `AUTH-CTX-005..015` — nodos contextuales, readiness y problemas estructurales;
- `AUTH-CTX-016..024` — evidencia, referencias y auditoría;
- `AUTH-CTX-025` — contrato SQL de `get_access_context`;
- `AUTH-CTX-026` — evaluador posterior;
- `AUTH-CTX-027` — inventario de consumidores;
- `AUTH-CTX-028` — compatibilidad legacy;
- `AUTH-CTX-029` — caché, límites temporales y `SafeContextProjection` L2;
- `AUTH-CTX-030` — plan maestro de pruebas;
- `SUPA-ARC-005` — `api` como capa expuesta;
- `SUPA-ARC-006` — `app_private` como capa privada;
- `SUPA-ARC-013` — funciones, RPC y triggers;
- `SUPA-ARC-014` — política `SECURITY DEFINER`;
- `SUPA-ARC-015` — exposición, grants y RLS;
- `AUTH-DB-016` — topología de schemas;
- `AUTH-DB-018` — separación entre contratos expuestos e internos;
- `AUTH-DB-017` — Data API y privilegios;
- `AUTH-DB-019` — principal y vínculos empresariales;
- `AUTH-DB-027` — harness físico;
- `AUTH-DB-028` — baseline y drift;
- `AUTH-DB-029` — recuperación y rollback;
- `AUTH-DB-030` — retiro legacy;
- `AUTH-DB-031` — certificación final.

Precedencia funcional:

```text
AUTH-DB-019
→ principal y vínculo empresarial

AUTH-DB-033
→ contexto real

AUTH-DB-035
→ frescura transaccional

AUTH-DB-034
→ decisión de autorización

AUTH-DB-032
→ persistencia de decisión
```

`AUTH-DB-033` no redefine cardinalidad de identidad, permisos, grants empresariales, recurso, simulación o auditoría durable.

---

#### 5. Clasificación recomputada frente al trabajo proyectado

La clasificación independiente es:

```text
TAREA = AUTH-DB-033
NATURALEZA = DOCUMENTAL
MODO = GLOBAL_ENABLE_ONCE
INSTANCIA FUTURA = AUTH-DB-033::GLOBAL
GATE = PRE_E5_FOUNDATION
CARRIL ACTUAL = DOCUMENTAL
SIGUIENTE DOCUMENTAL = AUTH-DB-035
```

Resultado:

```text
CLASIFICACIÓN RECOMPUTADA
vs.
CURRENT-WORK DOCUMENTAL

COINCIDE
```

La existencia de una instancia física de otra familia no altera este contrato documental.

---

#### 6. Estado físico remoto AS-IS

La auditoría read-only de `vento-os-dev` realizada durante el desarrollo documental confirma que el estado físico actual todavía es legacy respecto del objetivo.

La línea base canónica vigente de R1 identifica actualmente como schemas objetivo ya existentes:

```text
app_private
payments
```

y mantiene todavía pendientes de materialización otros schemas objetivo relevantes para este resolver, entre ellos:

```text
api
identity_access
workforce
work_scheduling
attendance
technology_operations
audit
```

`public` permanece como superficie legacy y no se considera owner schema objetivo.

La configuración versionada de Data API todavía expone:

```text
public
graphql_public
```

con:

```text
extra_search_path = public, extensions
```

Existen además los resolvers legacy:

```text
public.get_operational_context(
  p_employee_id uuid,
  p_site_id uuid,
  p_app_code text
)

public.get_effective_context_v1(
  p_app_code text
)
```

El primero es `VOLATILE` y `SECURITY DEFINER`.

El segundo es `STABLE` y `SECURITY DEFINER`, pero:

- normaliza silenciosamente `p_app_code`;
- usa `auth.uid()` como llave directa de `public.employees`;
- consulta simulación;
- usa `navigation_role`;
- admite fallback a `nexo`;
- reutiliza `get_operational_context`;
- devuelve `bypass_applied`;
- devuelve `can_operate`;
- expone una forma plana incompatible con `AccessContext@1.0.0`.

Estos objetos son antecedentes técnicos.

No se convierten en fuente normativa y no se retiran dentro de esta tarea documental.

---

#### 7. Frontera exacta de responsabilidad

`AUTH-DB-033` gobierna exclusivamente:

1. identidad física del resolver canónico completo;
2. firma SQL;
3. ubicación privada;
4. grafo de helpers privados;
5. snapshot e instante únicos;
6. serialización canónica;
7. fingerprints;
8. metadatos de resolución;
9. seguridad de ejecución;
10. proyección SQL segura;
11. grants mínimos de sus funciones;
12. compatibilidad física de coexistencia;
13. pruebas del resolver;
14. rendimiento del resolver;
15. rollback de los objetos creados por la instancia.

No gobierna:

- catálogo de permisos;
- decisión `ALLOW/DENY`;
- recursos;
- simulación;
- caché L1;
- generaciones de frescura;
- persistencia durable de decisiones;
- adaptación completa de consumidores;
- retiro de resolvers legacy.

---

#### 8. Identidad física del resolver canónico

Se congela la identidad física:

```text
app_private.get_access_context(text) → jsonb
```

Identidad lógica publicada en `resolution_metadata.resolver`:

```text
vento.authorization.get_access_context
```

Versión inicial del resolver:

```text
1.0.0
```

Versión contractual:

```text
AccessContext@1.0.0
```

La identidad física no cambia por ambiente.

No se crean variantes como:

```text
get_access_context_v1
get_access_context()
get_access_context(uuid)
get_access_context(text, uuid)
get_access_context(jsonb)
```

Una firma nueva exige decisión contractual explícita.

---

#### 9. Firma exacta

La firma completa es:

```sql
app_private.get_access_context(
  p_app_code text
)
returns jsonb
```

`p_app_code` es el único parámetro.

No tiene default.

No puede ser `null`, vacío ni contener espacios periféricos.

No se corrige mediante `trim`, `lower`, alias o fallback.

Una invocación contractualmente mal formada produce:

```text
SQLSTATE 22023
```

Una app con forma válida pero configuración inexistente o ambigua se representa con los códigos estructurales ya aprobados.

No se acepta desde el caller:

```text
user_id
principal_id
actor_id
employee_id
customer_id
device_id
role
site_id
area_id
shift_id
checkin_id
simulation_id
permission_key
resource_id
bypass
can_operate
```

---

#### 10. Ubicación y exposición

Separación física obligatoria:

| Objeto                          | Schema        | Exposición cliente                     |
| ------------------------------- | ------------- | -------------------------------------- |
| `get_access_context(text)`      | `app_private` | NO                                     |
| resolvers privados              | `app_private` | NO                                     |
| canonicalizador/fingerprint     | `app_private` | NO                                     |
| proyector seguro                | `app_private` | NO directo                             |
| `get_safe_access_context(text)` | `api`         | SÍ, únicamente según grants explícitos |

`app_private` permanece fuera de Data API.

El cliente no recibe `USAGE` sobre `app_private`.

`api` continúa siendo la única capa empresarial Vento objetivo de contratos expuestos.

---

#### 11. Modo de seguridad del resolver completo

`app_private.get_access_context(text)` será:

```text
VOLATILITY = STABLE
SECURITY = DEFINER
```

`SECURITY DEFINER` se justifica exclusivamente porque el resolver debe leer fuentes que el caller no puede consultar directamente.

No convierte al owner SQL en autoridad empresarial.

Condiciones obligatorias:

1. owner técnico no interactivo;
2. owner no utilizado por frontend;
3. owner distinto de `anon` y `authenticated`;
4. privilegios mínimos;
5. `search_path` fijo;
6. objetos críticos calificados;
7. sin SQL dinámico por selección de app, rol, schema o tabla;
8. `PUBLIC EXECUTE` revocado;
9. `anon EXECUTE` revocado;
10. `authenticated EXECUTE` revocado sobre el resolver completo;
11. helpers inaccesibles al cliente;
12. prueba de escalamiento y poisoning.

El nombre exacto del rol técnico propietario se obtiene del inventario físico verificado de la instancia.

Si no existe un rol que cumpla estas condiciones, la instancia falla cerrada y no crea un owner improvisado por inferencia.

---

#### 12. `search_path`

El resolver completo congela:

```text
pg_catalog
app_private
```

como `search_path` lógico mínimo.

Los objetos de:

```text
auth
identity_access
workforce
work_scheduling
attendance
technology_operations
org_governance
extensions
```

se referencian mediante nombre calificado cuando sean consumidos.

No se utiliza:

```text
search_path = public
```

No se confía en `extra_search_path` de Data API.

No se incorpora un owner schema al `search_path` para ahorrar calificación.

La función de hash y generación UUID se referencia de forma calificada desde el schema de extensión aprobado.

---

#### 13. Grafo de resolvers privados

Se congela el siguiente grafo lógico dentro de `app_private`:

```text
resolve_access_application
        ↓
resolve_access_principal
        ↓
resolve_access_actor
        ├───────────────┐
        ↓               ↓
resolve_access_base_lane
                        resolve_access_device
        ↓               ↓
resolve_access_operational_lane
        └───────┬───────┘
                ↓
validate_access_context
                ↓
canonicalize_access_context
                ↓
fingerprint_access_context
                ↓
project_safe_access_context
```

Identidades privadas iniciales:

```text
app_private.resolve_access_application(text, timestamptz) → jsonb
app_private.resolve_access_principal(text, timestamptz, jsonb) → jsonb
app_private.resolve_access_actor(text, timestamptz, jsonb, jsonb) → jsonb
app_private.resolve_access_base_lane(text, timestamptz, jsonb, jsonb) → jsonb
app_private.resolve_access_operational_lane(text, timestamptz, jsonb, jsonb) → jsonb
app_private.resolve_access_device(text, timestamptz, jsonb, jsonb, jsonb) → jsonb
app_private.validate_access_context(jsonb) → jsonb
app_private.canonicalize_access_context(jsonb) → text
app_private.fingerprint_access_context(jsonb) → text
app_private.project_safe_access_context(text, jsonb) → jsonb
```

Las firmas son internas.

No se exponen en `api`.

No se consideran contratos cliente.

---

#### 14. Política de privilegios de helpers

Los helpers privados serán `SECURITY INVOKER` por defecto.

Motivo:

```text
UN ÚNICO BORDE PRIVILEGIADO
=
app_private.get_access_context
```

La función superior ejecuta con el owner técnico y los helpers heredan ese contexto de ejecución sin multiplicar superficies `SECURITY DEFINER`.

Excepciones solo se permiten cuando una prueba física demuestre necesidad técnica concreta y se documenten individualmente.

Para todos los helpers:

```text
PUBLIC        → REVOKE
anon          → REVOKE
authenticated → REVOKE
```

No existe ejecución directa cliente.

---

#### 15. Instante único

`app_private.get_access_context` captura exactamente una vez:

```text
v_resolved_at timestamptz
```

Ese instante:

- procede del servidor;
- usa zona horaria;
- se serializa UTC;
- se comparte con todos los helpers;
- gobierna vigencias;
- no procede del navegador;
- no se recalcula por resolver.

No se usan relojes independientes para turno, check-in, actor session o dispositivo.

---

#### 16. Snapshot único

La resolución completa opera bajo un único snapshot del statement.

Queda prohibido:

- abrir transacciones auxiliares;
- resolver parte en cliente;
- mezclar una caché anterior con tablas actuales;
- resolver principal antes de una mutación visible y turno después;
- combinar revisiones de fuentes distintas sin detección.

Una mezcla detectable produce:

```text
CONTEXT_SNAPSHOT_MIXED
```

y falla cerrada.

`get_access_context` no ejecuta escrituras para estabilizar el snapshot.

---

#### 17. Resolución de aplicación

`resolve_access_application` valida:

```text
p_app_code
+
catálogo canónico vigente
+
política de identidad de dominio
+
política de dispositivo aplicable
```

Resultado:

- una configuración exacta;
- `RESOLVER_CONFIGURATION_MISSING`;
- `RESOLVER_CONFIGURATION_AMBIGUOUS`;
- error 22023 cuando el argumento no cumple la forma contractual.

No existe:

```text
null → nexo
lowercase automático
alias de app
ruta frontend → app_code
última app usada → app_code
```

---

#### 18. Principal e identidad empresarial

`resolve_access_principal` consume:

```text
sesión técnica real
→ auth subject
→ principal empresarial
→ vínculo explícito
```

Conserva:

```text
auth.users
→ sujeto técnico

identity_access
→ principal y vínculo

owner schema
→ identidad empresarial
```

`auth.uid()` es un localizador técnico.

No es:

```text
employee_id
customer_id
device_id
actor_id
```

No se infiere identidad mediante:

- correo;
- teléfono;
- metadata;
- provider;
- nombre;
- igualdad UUID legacy.

---

#### 19. Identidad de dominio y actor efectivo

El actor se resuelve mediante:

```text
principal real
+
app_code
+
política de identidad de dominio
+
vínculos vigentes
+
actor session o delegación cuando aplique
```

Se conserva:

```text
principal
≠ actor_effective
```

Una identidad `EMPLOYEE + CUSTOMER` no se mezcla para ampliar autoridad.

Cuando la app no pueda seleccionar una identidad única:

```text
DOMAIN_IDENTITY_AMBIGUOUS
```

Una delegación exige vínculo explícito y vigente.

`service_role` no constituye delegación.

---

#### 20. Empleado y estado laboral

El empleado se resuelve desde el actor laboral efectivo.

No desde el usuario Auth.

Un empleado inactivo se representa:

```text
employee.is_active = false
base readiness = UNAVAILABLE
operational readiness = UNAVAILABLE
```

con razones aprobadas.

No se reactiva por:

- turno;
- check-in;
- rol legacy;
- dispositivo;
- grant residual.

---

#### 21. Carril base

`resolve_access_base_lane` resuelve:

1. estado laboral;
2. rol base;
3. assigned sites;
4. assigned areas;
5. cobertura administrativa;
6. readiness base.

`base_role` procede de una asignación laboral canónica vigente.

No procede de:

- turno;
- `navigation_role`;
- `employees.role` sin mapeo canónico;
- dispositivo;
- último rol usado.

`assigned_sites` conserva todas las asignaciones relevantes.

Orden:

```text
site_code
site_id
```

`assigned_areas` conserva sede y área.

Orden:

```text
site_id
area_kind
area_id
```

Una lista vacía significa ninguna asignación.

No significa organización.

---

#### 22. Cobertura administrativa

`administrative_coverage` se resuelve únicamente desde reglas aprobadas.

`ORGANIZATION` exige autoridad organizacional explícita.

No se infiere por:

- nombre de rol;
- varias sedes;
- sede primaria;
- `null`;
- lista vacía;
- `service_role`;
- capacidad SQL del owner.

La cobertura no decide un permiso específico.

---

#### 23. Carril operativo

`resolve_access_operational_lane` resuelve:

```text
turno vigente
→ rol operativo
→ sede operativa
→ área operativa
→ check-in disponible
→ readiness operativo
```

El turno debe ser:

- publicado;
- vigente en `v_resolved_at`;
- del actor;
- temporalmente válido;
- territorialmente válido;
- no ambiguo.

No se usa `LIMIT 1` para ocultar solapamientos.

Dos candidatos vigentes producen:

```text
SHIFT_OVERLAP
active_shift = null
operational readiness = INVALID
```

---

#### 24. Ausencia normal de turno y check-in

Ausencia normal de turno:

```text
active_shift = null
NO_ACTIVE_SHIFT
operational readiness = UNAVAILABLE
```

No invalida el carril base.

Ausencia normal de check-in:

```text
active_checkin_session = null
NO_ACTIVE_CHECKIN
```

No se convierte por sí sola en `StructuralIssue`.

El resolver no reconstruye una sesión activa buscando el último evento de entrada sin un modelo canónico de sesión.

---

#### 25. Rol y territorio operativos

`operational_role` procede exclusivamente del turno válido.

`operational_site` procede exclusivamente del turno válido.

`operational_area`:

- procede del turno;
- puede ser confirmado por check-in;
- pertenece a la sede;
- puede ser `null` legítimamente.

Queda prohibido:

```text
selected_site
employee_default_site
device_site
checkin_site aislado
última sede usada
navigation_role
```

como fallback de autoridad operativa.

---

#### 26. Zona horaria

El resolver no hardcodea una zona horaria global.

La vigencia temporal utiliza la fuente autoritativa correspondiente al contexto.

Las reglas de cruce de medianoche y límites temporales usan el mismo `v_resolved_at`.

Una zona horaria ausente o contradictoria se resuelve según el catálogo estructural aprobado y no mediante fallback silencioso.

---

#### 27. Dispositivo compartido

`resolve_access_device` admite un dispositivo únicamente cuando existe identidad canónica de dispositivo.

No usa:

- user agent;
- IP;
- hostname;
- cookie libre;
- texto de cliente.

Para `SHARED_DEVICE`:

```text
principal = SHARED_DEVICE
actor_effective = EMPLOYEE o UNRESOLVED
```

El actor procede de una actor session vigente.

El dispositivo puede restringir.

No puede ampliar autoridad.

No aporta:

- rol base;
- rol operativo;
- permiso;
- sede empresarial del actor.

Sin actor vigente:

```text
actor_effective = UNRESOLVED
base readiness = UNAVAILABLE
operational readiness = UNAVAILABLE
```

No se reutiliza el último actor.

---

#### 28. Actor de sistema

Un actor `SYSTEM` exige:

- principal técnico registrado;
- proceso permitido;
- identidad `SYSTEM`;
- actor exacto;
- delegación explícita cuando represente a otra entidad.

No basta con ejecutar bajo:

```text
service_role
postgres
owner de la función
```

Los privilegios SQL permiten ejecutar lógica.

No crean autoridad empresarial.

---

#### 29. Simulación excluida

El grafo real no consulta:

- simulación activa;
- actor simulado;
- rol simulado;
- sede simulada;
- área simulada;
- grants hipotéticos.

`SimulationContext` permanece separado.

`get_effective_context_v1` no se reutiliza como fuente del resolver nuevo porque mezcla contexto real y simulación.

---

#### 30. `lane_readiness`

El resultado conserva:

```text
lane_readiness.base
lane_readiness.operational
```

Readiness expresa suficiencia estructural.

No expresa autorización.

No existen en el resultado:

```text
can_operate
can_admin
allow
deny
has_permission
bypass_applied
```

La ausencia de permiso evaluado es intencional.

---

#### 31. `structural_issues`

Solo se emiten códigos del catálogo congelado por `AUTH-CTX-015`.

Reglas:

1. cada issue tiene resolver propietario;
2. no se inventan códigos SQL locales;
3. no se filtran nombres de tablas o excepciones;
4. cascadas se suprimen;
5. duplicados exactos se eliminan;
6. metadata contradictoria falla cerrada;
7. el orden es determinista.

Orden:

```text
severidad
issue_code
subject_type
subject_id o cadena vacía
source
```

Un fallo de turno no genera automáticamente falsos errores derivados de rol, sede y área.

---

#### 32. Forma exacta de `AccessContext@1.0.0`

El resolver retorna un único `jsonb` con todos los campos obligatorios del contrato:

```text
contract_family
contract_family_version
contract_name
contract_version
schema_version
context_id
resolved_at
principal
actor_effective
domain_identity
employee
base_role
assigned_sites
assigned_areas
administrative_coverage
active_shift
active_checkin_session
operational_role
operational_site
operational_area
device_context
lane_readiness
structural_issues
resolution_metadata
```

No retorna:

- tabla plana;
- múltiples filas;
- array;
- booleano;
- texto JSON;
- `null`;
- record parcial.

Campos obligatorios ausentes no se omiten.

`null` explícito y arrays vacíos conservan semántica distinta.

---

#### 33. `context_id`

Cada resolución nueva sin caché genera un UUID de servidor.

Propiedades:

```text
único
inmutable
no derivado de actor
no derivado de usuario
no derivado de dispositivo
no bearer token
no permiso
```

La futura implementación puede utilizar la función UUID criptográficamente segura disponible en la extensión aprobada, referenciada con nombre calificado.

Cuando una caché válida se implemente posteriormente, un HIT podrá conservar el `context_id` almacenado según `AUTH-CTX-029`.

---

#### 34. `resolution_metadata`

Se materializa exactamente:

```text
resolver
resolver_version
authorization_contract_version
catalog_version
source_versions
source_fingerprints
cache_status
```

Valores iniciales:

```text
resolver = vento.authorization.get_access_context
resolver_version = 1.0.0
authorization_contract_version = 1.0.0
catalog_version = 1.0.0
cache_status = NOT_IMPLEMENTED
```

`cache_status` permanecerá `NOT_IMPLEMENTED` mientras `AUTH-DB-035` y `SHELL-CTX-006` no hayan materializado y habilitado otra estrategia aprobada.

No se usa:

```text
latest
main
current
production
unknown
```

como versión.

---

#### 35. Registro cerrado de `source_versions`

Se congela el siguiente vocabulario de claves permitido:

```text
application_catalog
principal_registry
enterprise_identity_links
domain_identity_policy
actor_resolution_model
employment_model
role_catalog
site_catalog
area_catalog
administrative_coverage_policy
shift_model
checkin_model
device_model
actor_session_model
structural_issue_catalog
```

Reglas:

1. toda fuente materialmente utilizada aparece;
2. una fuente no utilizada no se inventa;
3. una clave fuera del vocabulario bloquea la serialización hasta decisión contractual;
4. cada valor es una versión exacta;
5. una versión no identificable falla cerrada;
6. `source_fingerprints` usa exactamente el mismo conjunto de claves efectivamente presentes.

---

#### 36. `source_fingerprints`

Cada fingerprint representa únicamente el snapshot autoritativo mínimo utilizado por el resolver.

Formato físico:

```text
sha256: seguido de 64 caracteres hexadecimales minúsculos
```

La preimagen:

- usa `vento.canonical-json@1.0.0`;
- contiene solo campos materialmente utilizados;
- ordena colecciones determinísticamente;
- no incluye JWT completo;
- no incluye secretos;
- no incluye tokens;
- no incluye tablas completas cuando no corresponda;
- no incluye datos de otros actores no utilizados;
- no depende del formato Markdown ni de JSON incidental.

La implementación utiliza SHA-256 desde una dependencia criptográfica aprobada y referenciada de forma calificada.

---

#### 37. `context_fingerprint`

El fingerprint semántico del contexto se define como SHA-256 de una proyección canonicalizada que incluye:

- versiones contractuales;
- resolver;
- versiones y fingerprints de fuentes;
- principal;
- actor;
- identidad de dominio;
- empleado;
- roles;
- asignaciones;
- cobertura;
- turno;
- check-in;
- territorio operativo;
- dispositivo;
- readiness;
- structural issues.

Excluye:

```text
context_id
resolved_at
cache_status
tiempos de caché
correlation_id
métricas
nodo de infraestructura
metadata de delivery
```

Motivo:

```text
DOS RESOLUCIONES NUEVAS
PUEDEN TENER
context_id DIFERENTE
+
context_fingerprint IGUAL
```

cuando los hechos semánticos no cambiaron.

Formato:

```text
sha256: seguido de 64 caracteres hexadecimales minúsculos
```

---

#### 38. Serialización canónica

Toda preimagen y salida contractual respeta:

```text
vento.canonical-json@1.0.0
```

Reglas:

- claves obligatorias presentes;
- `null` explícito;
- arrays vacíos explícitos;
- timestamps UTC normalizados;
- enums exactos;
- Unicode normalizado;
- conjuntos ordenados;
- secuencias semánticas preservadas;
- números no ambiguos.

Queda prohibido considerar:

```text
jsonb::text
```

como implementación suficiente de la política completa.

`app_private.canonicalize_access_context(jsonb)` centraliza la representación requerida y queda cubierta por pruebas propias.

---

#### 39. Identidad física de la proyección segura

Se congela:

```text
api.get_safe_access_context(text) → jsonb
```

Firma:

```sql
api.get_safe_access_context(
  p_app_code text
)
returns jsonb
```

Responsabilidad:

```text
1. validar la invocación;
2. obtener exactamente un AccessContext canónico;
3. calcular u obtener context_fingerprint;
4. aplicar el proyector privado;
5. devolver únicamente datos seguros;
6. no decidir permisos;
7. no devolver autoridad ejecutable.
```

No es equivalente a `app_private.get_access_context`.

No devuelve un `AccessContext@1.0.0` incompleto.

Es una proyección derivada.

---

#### 40. Excepción explícita `SECURITY DEFINER` de la proyección

`api` conserva como política objetivo cero RPC `SECURITY DEFINER` por defecto.

`api.get_safe_access_context(text)` constituye una excepción explícita y estrecha porque:

1. `authenticated` no recibe `USAGE` ni `EXECUTE` sobre `app_private`;
2. la proyección necesita invocar el resolver privado;
3. un wrapper `SECURITY INVOKER` no debe forzar a abrir la capa privada al cliente;
4. la salida se reduce antes de cruzar la frontera.

La excepción exige:

- owner técnico no interactivo;
- `search_path` fijo;
- llamadas totalmente calificadas a `app_private`;
- cero SQL dinámico;
- cero acceso directo cliente a helpers;
- prueba de poisoning;
- prueba de homónimos maliciosos;
- prueba de datos no filtrados;
- revisión de ACL.

Si estas condiciones no pueden demostrarse, la RPC segura no se publica.

---

#### 41. Forma de la proyección SQL segura

La proyección SQL devuelve únicamente:

```text
context_id
resolved_at
context_fingerprint
expires_at
safe_fields
```

`expires_at` representa el límite visual máximo de la proyección y nunca una autorización.

`safe_fields` puede contener:

```text
principal_type
actor_type
employee_active
base_role_code
operational_role_code
operational_site_code
operational_area_kind
operational_area_code
device_mode
lane_readiness.base.state
lane_readiness.base.reason_codes
lane_readiness.operational.state
lane_readiness.operational.reason_codes
safe_structural_issue_codes
```

Reglas:

1. códigos territoriales se usan en lugar de UUID internos cuando exista código canónico;
2. `base_role_code` solo se incluye cuando su visibilidad contractual sea segura;
3. reason codes se filtran por el catálogo seguro vigente;
4. `safe_structural_issue_codes` solo contiene códigos autorizados para presentación;
5. los detalles del issue no cruzan la frontera;
6. la proyección no contiene permisos efectivos.

`AUTH-CTX-029` y `SHELL-AUTH-002` podrán envolver este resultado en `SafeContextProjection` L2 con:

```text
projection_id
generated_at
refresh_at
actor_marker
app_code
```

sin reconstruir autoridad en el cliente.

---

#### 42. Reconciliación del fingerprint seguro

`AUTH-CTX-025` prohibió exponer fingerprints internos por defecto.

`AUTH-CTX-029`, aprobado posteriormente, exige `context_fingerprint` en `SafeContextProjection` L2.

Se reconcilia así:

```text
context_fingerprint
→ PUEDE cruzar la proyección segura

source_fingerprints
→ NO cruzan la proyección segura

source_versions internas
→ NO cruzan la proyección segura
```

El `context_fingerprint` no permite reconstruir las fuentes.

No se convierte en token de autorización.

---

#### 43. Límites temporales de la proyección

La proyección segura calcula su `expires_at` con la política de `AUTH-CTX-029`.

Debe respetar simultáneamente:

- TTL visual máximo por tipo de actor;
- expiración de sesión;
- fin o cambio de turno relevante;
- expiración o cierre de check-in;
- expiración de actor session;
- expiración de dispositivo;
- expiración de delegación;
- otras fronteras temporales contractualmente aprobadas;
- margen de seguridad aprobado.

La ausencia de una frontera aplicable no autoriza TTL infinito.

El cliente puede refrescar antes.

No puede usar una proyección no expirada como prueba de autorización de una mutación.

---

#### 44. Datos prohibidos en la proyección segura

No se exponen por defecto:

- `source_versions`;
- `source_fingerprints`;
- vínculo empresarial interno;
- auth subject id;
- employee id;
- customer id;
- device id interno;
- actor session id;
- shift id;
- check-in id;
- assigned sites completos;
- assigned areas completas;
- historial;
- metadata de fuentes;
- datos de otros actores;
- secretos;
- claims JWT;
- grants;
- denies;
- permisos;
- reglas de precedencia;
- configuración completa;
- errores PostgreSQL;
- nombres de tablas;
- detalles de `StructuralIssue`;
- decisiones `ALLOW/DENY`;
- `can_operate`;
- bypass.

Una nueva exposición requiere revisión contractual explícita.

---

#### 45. Matriz de grants

Estado objetivo:

| Identidad                              | `PUBLIC` |         `anon` | `authenticated` | Servicio privilegiado aprobado |
| -------------------------------------- | -------: | -------------: | --------------: | -----------------------------: |
| `app_private.get_access_context(text)` |       NO |             NO |              NO | solo si el manifiesto lo exige |
| helpers `app_private.*` de esta tarea  |       NO |             NO |              NO |         no directo por defecto |
| `api.get_safe_access_context(text)`    |       NO | NO por defecto |    SÍ explícito |      opcional según manifiesto |

Reglas:

1. `PUBLIC EXECUTE` queda revocado;
2. `anon` no recibe contexto por defecto;
3. `authenticated` recibe únicamente la proyección segura;
4. la firma del grant es exacta;
5. una sobrecarga futura no hereda el grant;
6. `service_role` no se interpreta como actor empresarial;
7. `USAGE api` se gobierna por `AUTH-DB-017`;
8. no se concede `USAGE app_private` a roles cliente.

---

#### 46. RLS y acceso a owner schemas

`get_access_context` no requiere que el caller tenga `SELECT` sobre fuentes empresariales.

Tampoco:

- desactiva RLS globalmente;
- concede SELECT amplio;
- cambia policies de otras tareas;
- convierte `SECURITY DEFINER` en bypass de autorización;
- expone tablas fuente.

El resolver privilegiado lee únicamente lo necesario para construir el contrato.

Los objetos propietarios conservan su autoridad de dominio.

Cuando una fuente exija una policy o función propietaria todavía inexistente, la instancia se bloquea en vez de inventarla dentro de `AUTH-DB-033`.

---

#### 47. Errores y fail closed

Se mantienen tres categorías.

##### Invocación inválida

```text
p_app_code mal formado
→ SQLSTATE 22023
```

##### Estado empresarial normal o inconsistente

```text
AccessContext válido
+
structural_issues
+
readiness correspondiente
```

No se usan excepciones para:

- falta normal de turno;
- falta normal de check-in;
- empleado inactivo conocido;
- dispositivo sin actor;
- área opcional ausente.

##### Fallo de infraestructura

```text
no se puede construir el contrato
→ excepción controlada
→ cero contexto parcial
→ cero proyección parcial
```

El error expuesto no revela:

- SQL;
- schema interno;
- tabla;
- ID ajeno;
- stack trace;
- policy;
- secreto.

---

#### 48. Frontera con legacy

Permanecen legacy:

```text
public.get_operational_context(...)
public.get_effective_context_v1(...)
has_permission(...)
has_operational_permission(...)
has_effective_permission_v1(...)
```

`AUTH-DB-033` no los convierte en canónicos.

La compatibilidad sigue:

```text
AccessContext canónico
→ proyección legacy
```

Nunca:

```text
fila legacy
→ reconstruir AccessContext
```

`AUTH-CTX-028` gobierna los modos:

```text
LEGACY_NATIVE
CANONICAL_PROJECTION
REMOVED
```

La adaptación de consumidores corresponde a tareas SHELL posteriores.

El retiro pertenece a `AUTH-DB-030`.

---

#### 49. Frontera con `AUTH-DB-035`

`AUTH-DB-033` implementa:

- resolver;
- contexto;
- versiones de fuentes;
- fingerprints;
- fingerprint semántico;
- límites temporales derivados;
- proyección segura.

No implementa:

- generaciones transaccionales;
- triggers de generación;
- token de frescura;
- outbox de invalidación;
- L1 compartida;
- single-flight cross-request.

Estas responsabilidades pertenecen a:

```text
AUTH-DB-035
SHELL-CTX-006
```

Hasta entonces:

```text
cache_status = NOT_IMPLEMENTED
```

---

#### 50. Frontera con `AUTH-DB-034` y `AUTH-DB-032`

`AUTH-DB-034`:

- invoca el resolver canónico;
- resuelve permiso y recurso;
- aplica carriles y precedencia;
- produce `AuthorizationDecision`.

No reconstruye contexto.

`AUTH-DB-032`:

- persiste decisiones y referencias;
- no sustituye al resolver;
- no convierte `context_id` en token.

`AUTH-DB-033` no inserta auditoría empresarial durable.

---

#### 51. Dependencias físicas de la instancia

`AUTH-DB-033::GLOBAL` no puede autorizarse únicamente porque el documento esté aprobado.

Antes de autorización física debe existir evidencia de los prerrequisitos aplicables:

```text
R0 aplicable verificado
+
AUTH-DB-016::GLOBAL verificada
+
AUTH-DB-018::GLOBAL verificada
+
AUTH-DB-017::GLOBAL verificada
+
AUTH-DB-019::GLOBAL verificada
+
SHELL-AUD-002..005 cerradas según su gate
+
SHELL-PKG-001..008 cerradas según su gate
+
SHELL-CON-001..008 materializadas según el orden físico
+
SHELL-AUTH-001 verificada
+
SHELL-CTX-001 verificada
=
AUTH-DB-033 físicamente elegible
```

`AUTH-DB-027`, `AUTH-DB-028` y `AUTH-DB-029` acompañan la materialización según sus contratos.

Una dependencia todavía no verificada bloquea únicamente la instancia física.

No bloquea esta aprobación documental.

---

#### 52. Manifiesto mínimo de materialización

Antes de mutar debe existir un manifiesto reproducible con:

```text
physical_identity
object_kind
schema
function_signature
logical_resolver_id
resolver_version
security_mode
owner_role
search_path
source_dependencies
source_version_key
source_fingerprint_policy
caller_roles
grant_before
grant_after
contract_version
migration_file
rollback_action
test_ids
environment
evidence
```

Integridad:

1. toda función creada aparece exactamente una vez;
2. toda firma es completa;
3. todo `SECURITY DEFINER` tiene justificación;
4. todo grant tiene audiencia;
5. todo helper permanece privado;
6. toda fuente tiene owner;
7. toda dependencia sin owner queda `BLOCKED`;
8. no existe objeto físico inferido fuera del manifiesto.

---

#### 53. Migración física futura

La instancia materializará exclusivamente mediante migraciones forward versionadas bajo:

```text
vento-shell/supabase/migrations
```

Orden contractual:

```text
1. regenerar baseline remoto
2. verificar schemas y dependencias
3. verificar owner técnico
4. congelar manifiesto
5. crear helpers privados
6. crear resolver canónico
7. crear canonicalizador y fingerprints
8. crear proyector privado
9. crear wrapper seguro en api
10. revocar grants implícitos
11. conceder grants exactos
12. recargar schema de API cuando corresponda
13. ejecutar pruebas físicas
14. capturar planes y rendimiento
15. validar drift
16. ensayar rollback
```

No se modifica un objeto legacy como atajo para convertirlo en el nuevo resolver.

---

#### 54. Índices y rendimiento

`AUTH-DB-033` no crea índices especulativos.

La instancia deberá capturar:

- plan de ejecución;
- filas estimadas y reales;
- buffers;
- tiempo total;
- p50;
- p95;
- cardinalidades relevantes;
- consultas dominantes.

Un índice adicional solo puede entrar en el alcance físico cuando:

1. el plan demuestra una necesidad;
2. el owner schema afectado está identificado;
3. no altera semántica;
4. no duplica un índice existente;
5. se incluye en manifiesto;
6. se prueba escritura y lectura;
7. dispone de rollback;
8. permanece dentro del alcance autorizado de la instancia.

No se usa `LIMIT 1` como optimización para resolver ambigüedades contractuales.

---

#### 55. Concurrencia

Las pruebas deben cubrir cambios concurrentes de:

- vínculo empresarial;
- actor session;
- estado laboral;
- rol base;
- asignación;
- turno;
- check-in;
- dispositivo.

La función `STABLE` conserva el snapshot del statement.

Una mutación concurrente posterior no cambia retrospectivamente el contexto ya resuelto.

La autorización de una acción posterior deberá revalidar frescura según las tareas propietarias.

---

#### 56. Rollback

El rollback se diseña para los objetos creados por `AUTH-DB-033`.

Secuencia segura:

```text
1. retirar grant de api.get_safe_access_context(text)
2. verificar cero consumidores nuevos o activar compatibilidad aprobada
3. retirar wrapper seguro solo sin dependencias
4. retirar helpers y resolver solo sin consumidores internos
5. restaurar ACL desde snapshot cuando corresponda
6. conservar legacy intacto
7. validar drift
```

Queda prohibido:

- `DROP ... CASCADE` genérico;
- `GRANT ALL`;
- borrar datos;
- borrar identidades;
- reconstruir usuarios;
- restaurar bypass;
- retirar legacy dentro del rollback de esta tarea.

Si ya existen consumidores del resolver, la corrección se realiza mediante migración forward y no mediante destrucción automática.

---

#### 57. Pruebas físicas obligatorias

La futura instancia debe demostrar, como mínimo:

##### Contrato

1. firma exacta `app_private.get_access_context(text)`;
2. retorno `jsonb`;
3. `STABLE`;
4. `SECURITY DEFINER`;
5. un solo resultado;
6. `AccessContext@1.0.0` completo;
7. ausencia de campos prohibidos;
8. serialización determinista;
9. context fingerprint reproducible.

##### Invocación

10. app válida;
11. app `null`;
12. app vacía;
13. app con espacios;
14. app desconocida;
15. app ambigua;
16. ausencia de overload inseguro.

##### Principal y actor

17. HUMAN_USER;
18. sesión sin vínculo;
19. identidad `EMPLOYEE`;
20. identidad `CUSTOMER`;
21. identidad múltiple;
22. actor delegado válido;
23. actor delegado inválido;
24. SYSTEM;
25. service role sin autoridad implícita.

##### Laboral

26. empleado activo;
27. empleado inactivo;
28. rol base válido;
29. rol base ambiguo;
30. varias sedes;
31. duplicados de sede;
32. áreas incompatibles;
33. cobertura NONE;
34. cobertura ORGANIZATION explícita.

##### Operativo

35. sin turno;
36. turno válido;
37. turno nocturno;
38. turno solapado;
39. turno no publicado;
40. sin check-in;
41. check-in válido;
42. check-in ajeno;
43. check-in expirado;
44. rol operativo inválido;
45. sede inválida;
46. área opcional;
47. área incompatible.

##### Dispositivo

48. dispositivo personal;
49. shared device con actor;
50. shared device sin actor;
51. dispositivo inactivo;
52. actor ajeno;
53. device id manipulado.

##### Seguridad

54. `PUBLIC` sin execute;
55. `anon` sin execute interno;
56. `authenticated` sin execute interno;
57. helpers inaccesibles;
58. wrapper seguro accesible solo por grant aprobado;
59. search path poisoning;
60. objeto homónimo malicioso;
61. claim manipulado;
62. SQL injection;
63. RLS coexistente;
64. ausencia de SELECT amplio.

##### Snapshot y error

65. mismo `resolved_at`;
66. mismo snapshot;
67. infraestructura fallida sin contexto parcial;
68. error seguro sin nombres internos;
69. orden determinista;
70. deduplicación de issues.

##### Proyección segura

71. no expone source versions;
72. no expone source fingerprints;
73. expone context fingerprint conforme a AUTH-CTX-029;
74. no expone IDs sensibles;
75. no expone permisos;
76. no expone grants o denies;
77. no expone sesiones;
78. no produce `can_operate`;
79. límite temporal coherente;
80. payload estable.

##### Performance y operación

81. plan de ejecución capturado;
82. p50/p95 registrados;
83. prueba de concurrencia;
84. rollback ensayado;
85. segunda ejecución idempotente;
86. drift final;
87. paridad local/staging/entorno autorizado.

---

#### 58. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Justificación:** `AUTH-DB-033` materializa reglas ya protegidas por `AUTH-CTX-001..030`, la arquitectura E3, los contratos de identidad de `AUTH-DB-019`, la exposición de `AUTH-DB-017/018` y el plan maestro de pruebas. La tarea concreta nombres físicos, seguridad, fingerprints, proyección y estrategia de materialización sin introducir una capacidad empresarial nueva, un permiso nuevo, una regla de acceso nueva ni una semántica nueva de autorización.

---

#### 59. Cobertura de prueba vigente reutilizada

Se reutiliza sin modificación la cobertura ya existente sobre:

- separación `api` / `app_private`;
- seguridad de RPC y `SECURITY DEFINER`;
- grants y exposición;
- principal, identidad y actor;
- vínculos Auth ↔ identidad;
- contexto laboral;
- turno y check-in;
- dispositivos compartidos;
- problemas estructurales;
- serialización y versionado;
- proyecciones seguras;
- caché e invalidación;
- seguridad adversarial;
- migración, paridad y rollback.

Se conserva además la trazabilidad previamente documentada por las tareas R1, incluida la cobertura relacionada con:

```text
TREQ-SUPABASE-651..718
TREQ-SUPABASE-757..836
TREQ-SUPABASE-1047..1090
```

Estos rangos se citan únicamente como requisitos vigentes reutilizados.

No se modifica ninguna fila del Registro Canónico de Requisitos de Prueba.

---

#### 60. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                                                                                                                                                                                                                                                         |
| --------- | -------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | la tarea documental no ejecutó build de producto ni creó migraciones                                                                                                                                                                                                                                                                                                              |
| LOCAL     | NOT_EXECUTED   | pendiente de insertar el bloque y ejecutar el lifecycle documental del checkout `task/auth-db-033`                                                                                                                                                                                                                                                                                |
| REMOTA    | PASS           | auditoría read-only 2026-08-22 sobre `vento-shell` y `vento-os-dev`: contrato `AUTH-CTX-025` vigente; `api` todavía no materializado en el corte consultado; `public.get_operational_context` y `public.get_effective_context_v1` continúan legacy; `supabase/config.toml` expone todavía `public` y `graphql_public`; `pgcrypto` y `uuid-ossp` están disponibles en `extensions` |
| OPERATIVA | NOT_APPLICABLE | no se alteraron consumidores ni runtime durante el desarrollo documental                                                                                                                                                                                                                                                                                                          |
| FÍSICA    | NOT_APPLICABLE | no se ejecutó SQL de mutación, no se creó migración y `AUTH-DB-033::GLOBAL` no fue autorizada                                                                                                                                                                                                                                                                                     |

---

#### 61. Decisiones vinculantes

1. La futura instancia es `AUTH-DB-033::GLOBAL`.
2. Su modo es `GLOBAL_ENABLE_ONCE`.
3. Su gate es `PRE_E5_FOUNDATION`.
4. El resolver completo es `app_private.get_access_context(text)`.
5. Retorna `jsonb`.
6. Produce `AccessContext@1.0.0`.
7. El único parámetro es `p_app_code text`.
8. No existe app por defecto.
9. No se normaliza silenciosamente el app code.
10. El caller no suministra actor, empleado, rol, sede, área, turno, check-in o dispositivo.
11. El resolver completo es `STABLE`.
12. El resolver completo es `SECURITY DEFINER` endurecido.
13. `PUBLIC`, `anon` y `authenticated` no ejecutan directamente el resolver completo.
14. Los helpers viven en `app_private`.
15. Los helpers son `SECURITY INVOKER` por defecto.
16. El borde privilegiado principal es único.
17. `search_path` mínimo es `pg_catalog, app_private`.
18. Los objetos críticos se califican.
19. No se usa SQL dinámico por app, rol, tabla o schema.
20. Se captura un solo `resolved_at`.
21. Se usa un solo snapshot.
22. `auth.uid()` no es employee id.
23. `identity_access` conserva principal y vínculos.
24. Los perfiles continúan en sus owner schemas.
25. El actor efectivo se resuelve explícitamente.
26. La identidad múltiple no amplía autoridad.
27. El rol base no procede del turno.
28. Las asignaciones múltiples no se colapsan.
29. `ORGANIZATION` exige autoridad explícita.
30. El turno no se elige con `LIMIT 1` ante ambigüedad.
31. El rol operativo procede del turno.
32. La sede operativa procede del turno.
33. El check-in no se reconstruye heurísticamente.
34. El dispositivo no concede rol.
35. Un shared device sin actor no reutiliza el actor anterior.
36. SYSTEM exige principal técnico registrado.
37. La simulación permanece fuera del contexto real.
38. Readiness no es autorización.
39. No existe `can_operate`.
40. Solo se usan structural issues del catálogo aprobado.
41. La salida es determinista.
42. `resolution_metadata.resolver` es `vento.authorization.get_access_context`.
43. `resolver_version` inicial es `1.0.0`.
44. `authorization_contract_version` es `1.0.0`.
45. `catalog_version` inicial es `1.0.0`.
46. `cache_status` inicia `NOT_IMPLEMENTED`.
47. `source_versions` usa vocabulario cerrado.
48. `source_fingerprints` refleja exactamente las fuentes utilizadas.
49. Los fingerprints usan SHA-256 sobre preimagen canonicalizada.
50. `context_fingerprint` excluye `context_id`, `resolved_at` y metadata de delivery.
51. `jsonb::text` no basta como canonicalización.
52. La proyección cliente es `api.get_safe_access_context(text)`.
53. La proyección segura es distinta del `AccessContext` completo.
54. `api.get_safe_access_context(text)` es una excepción `SECURITY DEFINER` explícita, estrecha y probada.
55. `authenticated` recibe únicamente la proyección segura por grant exacto.
56. `anon` no recibe la proyección por defecto.
57. `context_fingerprint` puede cruzar la proyección segura por reconciliación con `AUTH-CTX-029`.
58. `source_fingerprints` y `source_versions` no cruzan la proyección.
59. La proyección no contiene permisos ni decisiones.
60. `AUTH-DB-035` conserva ownership de generaciones e invalidación.
61. `AUTH-DB-034` conserva ownership de la evaluación.
62. `AUTH-DB-032` conserva persistencia durable.
63. Los resolvers legacy permanecen durante la compatibilidad.
64. La dirección de compatibilidad es canónico → legacy.
65. `AUTH-DB-030` conserva el retiro legacy.
66. Los índices requieren evidencia de plan.
67. Toda materialización usa migraciones forward en `vento-shell`.
68. Rollback no usa `DROP CASCADE` ni `GRANT ALL`.
69. No se crean ni modifican requisitos TREQ.
70. La aprobación documental no autoriza cambios físicos.

---

#### 62. Criterios de aceptación

`AUTH-DB-033` queda documentalmente completa cuando:

1. se fija la identidad física exacta de `get_access_context`;
2. se fija la firma `(text) → jsonb`;
3. se fija `app_private` como ubicación del resolver completo;
4. se fija `api.get_safe_access_context(text)` como proyección SQL segura;
5. se separa la proyección del contrato completo;
6. se congela el grafo de resolvers privados;
7. se minimiza la superficie `SECURITY DEFINER`;
8. se endurece `search_path`;
9. se fijan grants negativos y positivos;
10. se mantiene `authenticated` fuera de `app_private`;
11. se preserva un instante y snapshot únicos;
12. se conserva el modelo principal → identidad → actor;
13. se preserva la independencia de IDs empresariales;
14. se preservan rol base, asignaciones y cobertura;
15. se preservan turno, check-in, rol y territorio operativos;
16. se preserva el modelo de dispositivo;
17. se excluye simulación;
18. readiness permanece separado de autorización;
19. no existe `can_operate`;
20. structural issues permanecen en catálogo cerrado;
21. se congela resolver/versiones;
22. se congela vocabulario de `source_versions`;
23. se define fingerprint de fuentes;
24. se define `context_fingerprint`;
25. se define canonicalización;
26. se reconcilia la exposición del `context_fingerprint`;
27. se bloquea exposición de evidencia interna;
28. se define límite temporal seguro de la proyección;
29. se preserva compatibilidad legacy sin invertir la fuente de verdad;
30. se separan responsabilidades de AUTH-DB-035/034/032;
31. se fijan prerrequisitos físicos;
32. se define manifiesto de implementación;
33. se define orden de migración;
34. se define política de índices;
35. se define concurrencia;
36. se define rollback;
37. se definen pruebas positivas y negativas;
38. se documenta el AS-IS remoto sin convertirlo en objetivo;
39. se declaran cero cambios TREQ;
40. `AUTH-DB-035` queda como única continuidad documental reservada.

---

#### 63. Límites

`AUTH-DB-033` no:

- ejecuta SQL de mutación durante su desarrollo documental;
- crea migraciones durante su desarrollo documental;
- crea schemas durante su desarrollo documental;
- crea owner roles durante su desarrollo documental;
- modifica datos;
- crea vínculos de identidad;
- cambia Auth;
- cambia providers;
- cambia sesiones;
- crea permisos;
- crea grants empresariales;
- evalúa recursos;
- produce `AuthorizationDecision`;
- persiste decisiones;
- implementa simulación;
- implementa generaciones de frescura;
- implementa caché L1;
- crea outbox de invalidación;
- adapta todos los consumidores;
- retira `get_operational_context`;
- retira `get_effective_context_v1`;
- cambia RLS de otros dominios;
- desactiva RLS globalmente;
- expone owner schemas;
- concede acceso cliente a `app_private`;
- modifica `04A`;
- autoriza `AUTH-DB-033::GLOBAL`;
- desarrolla `AUTH-DB-035`.

---

#### 64. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-DB-019 — Implementar vínculos canónicos entre Auth e identidades empresariales`

**TAREA ACTUAL APROBADA**
`AUTH-DB-033 — Implementar get_access_context canónico, sus resolvers privados y su proyección segura`

**SIGUIENTE TAREA RESERVADA**
`AUTH-DB-035 — Implementar token transaccional de frescura e invalidación del contexto`


### ✅ AUTH-DB-035 — Implementar token transaccional de frescura e invalidación del contexto

**Estado:** APROBADA
**Tarea anterior:** AUTH-DB-033 — Implementar get_access_context canónico, sus resolvers privados y su proyección segura
**Tarea siguiente:** AUTH-DB-034 — Implementar evaluate_authorization canónico, su núcleo de evaluación, resolvers de recurso y proyecciones seguras
**Tipo de tarea:** Documental
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/02_R1_FUNDACION_FISICA_CANONICA.md`
**Estado físico resultante:** Contrato de materialización del token transaccional de frescura, generaciones, bindings de invalidación y outbox cerrado; futura instancia global `AUTH-DB-035::GLOBAL` pendiente de autorización explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`AUTH-DB-035` define el contrato físico único para materializar la infraestructura de frescura e invalidación exigida por `ContextFreshnessToken@1.0.0`, sin habilitar todavía una caché compartida y sin convertir el token en autoridad empresarial.

La futura instancia debe garantizar que:

```text
CAMBIO RELEVANTE DE CONTEXTO
+
GENERACIÓN AFECTADA
+
EVENTO OUTBOX
=
UNA MISMA TRANSACCIÓN
```

y que:

```text
CACHE HIT FUTURO
→ SOLO PUEDE EXISTIR
→ DESPUÉS DE VALIDAR UN TOKEN AUTORITATIVO ACTUAL
```

Esta tarea materializa la barrera de corrección necesaria para que `SHELL-CTX-006` pueda implementar posteriormente una caché compartida validada.

No implementa la caché L1.

No implementa `AuthorizationDecision`.

No expone el token al cliente.

---

#### 2. Resultado canónico

Queda definido el siguiente resultado:

```text
AUTH-DB-035
→ contrato documental único

AUTH-DB-035::GLOBAL
→ futura instancia física global reutilizable

app_private.context_freshness_generations
→ generaciones monotónicas privadas

app_private.context_freshness_bindings
→ registro técnico de fuentes obligadas a invalidar

app_private.get_context_freshness_token(text)
→ lectura autoritativa del token

app_private.bump_context_freshness(...)
→ incremento transaccional privado

audit.context_invalidation_outbox
→ evento durable de invalidación

resultado de esta tarea
→ infraestructura lista para ser consumida por SHELL-CTX-006
→ L1 continúa deshabilitada
→ cache_status no se convierte todavía en HIT o MISS
```

---

#### 3. Topología y gate

La clasificación canónica aplicable es:

```text
task_id = AUTH-DB-035
mode = GLOBAL_ENABLE_ONCE
instance = AUTH-DB-035::GLOBAL
execution_gate = PRE_E5_FOUNDATION
canonical_work = DEFINE_CONTRACT_ONCE
```

Consecuencias:

1. existe como máximo una instancia física global reutilizable;
2. no se crea una instancia por package_id;
3. puede materializarse antes de E5 cuando sus dependencias técnicas estén satisfechas;
4. no constituye migración vertical de una aplicación;
5. la aprobación documental no autoriza `AUTH-DB-035::GLOBAL`;
6. toda materialización futura requiere autorización humana explícita;
7. `SHELL-CTX-006` permanece separado y no se absorbe en esta instancia.

---

#### 4. Precedencia contractual

La implementación física futura deberá respetar, en este orden:

```text
AUTH-CTX-029
→ define semántica de frescura, generaciones y caché

AUTH-CTX-030
→ define pruebas contractuales

AUTH-DB-019
→ principal y vínculos empresariales

AUTH-DB-033
→ AccessContext, source versions, source fingerprints y proyección segura

AUTH-DB-035
→ generaciones transaccionales y token

AUTH-DB-034
→ evaluación de autorización

AUTH-DB-032
→ persistencia durable de decisiones

SHELL-CTX-006
→ caché compartida, single-flight y validación de frescura
```

`AUTH-DB-035` no puede redefinir contratos cerrados por las tareas anteriores.

---

#### 5. Fuentes vinculantes

Esta tarea consume y preserva:

- `ADR-AUTH-001`;
- `AUTH-CTX-025`, para `get_access_context(text) → jsonb`;
- `AUTH-CTX-029`, para L0, L1, L2, generaciones, token, outbox, TTL y límites temporales;
- `AUTH-CTX-030`, para pruebas de concurrencia, tiempo, caché e invalidación;
- `AUTH-DB-019`, para principal, vínculo empresarial e identidad efectiva;
- `AUTH-DB-033`, para el resolver, helpers privados, fingerprints y proyección segura;
- `AUTH-DB-027`, para el harness físico;
- `AUTH-DB-028`, para baseline y drift;
- `AUTH-DB-029`, para backup, restore y rollback;
- `AUTH-DB-016`, para la topología de schemas;
- `AUTH-DB-018`, para separación entre contratos expuestos y lógica privada;
- `AUTH-DB-017`, para exposición Data API y grants;
- `SUPA-ARC-005`, `SUPA-ARC-006` y `SUPA-ARC-007`, para `api`, `app_private` y `audit`;
- `SUPA-ARC-014` y `SUPA-ARC-015`, para `SECURITY DEFINER`, grants y RLS;
- el vocabulario de fuentes congelado por `AUTH-DB-033`.

---

#### 6. Principios no negociables

```text
FRESHNESS TOKEN
≠ PERMISO
```

```text
GENERATION
≠ AUTORIDAD EMPRESARIAL
```

```text
OUTBOX EVENT
≠ GARANTÍA ÚNICA DE FRESCURA
```

```text
TTL
≠ GARANTÍA ÚNICA DE FRESCURA
```

```text
TOKEN VÁLIDO
≠ AUTHORIZATION ALLOW
```

```text
CAMBIO RELEVANTE
→ NO PUEDE COMMITTEAR
→ SIN BARRERA DE GENERACIÓN APLICABLE
```

```text
EVENTO PERDIDO
→ NO PUEDE PRODUCIR STALE HIT
```

---

#### 7. Estado físico observado

La auditoría read-only del proyecto Supabase `vento-os-dev` realizada el 2026-08-22 confirma:

```text
project_status = ACTIVE_HEALTHY
postgres_engine = 17
postgres_version = 17.6.1.054
```

En los schemas consultados no se observan objetos existentes cuyo nombre represente:

```text
freshness
generation
invalidation
outbox
access_context
```

Los resolvers relacionados observados continúan siendo:

```text
public.get_operational_context(uuid, uuid, text)
public.get_effective_context_v1(text)
```

Ambos son legacy.

Por tanto, la tarea no adopta una infraestructura de frescura preexistente.

---

#### 8. Estado de sesión Supabase observado

`auth.sessions` contiene actualmente, entre otros:

```text
id
user_id
created_at
updated_at
aal
not_after
refreshed_at
oauth_client_id
refresh_token_counter
scopes
```

También existen columnas administradas que no deberán copiarse al token ni a logs.

Reglas:

1. `AUTH-DB-035` no crea triggers en `auth.sessions`;
2. no altera tablas administradas por Supabase Auth;
3. no duplica refresh tokens;
4. no copia secretos de sesión;
5. la existencia y estado actual de la sesión se consulta directamente al construir el token;
6. una sesión revocada o ausente no puede validarse mediante una generación Vento antigua.

---

#### 9. Decisión de ownership físico

La infraestructura se separa así:

| Objeto                  | Schema        | Clase                       |
| ----------------------- | ------------- | --------------------------- |
| generaciones            | `app_private` | estado técnico derivado     |
| bindings                | `app_private` | registro técnico privado    |
| funciones de token      | `app_private` | lógica privada              |
| funciones de incremento | `app_private` | lógica privada privilegiada |
| helpers de fingerprint  | `app_private` | lógica privada              |
| outbox de invalidación  | `audit`       | evento durable transversal  |

Las generaciones no se colocan en `identity_access` porque:

1. no son fuente empresarial de identidad;
2. no sustituyen principal, vínculo, empleado, turno o dispositivo;
3. son metadata técnica de coherencia;
4. eliminarlas no elimina hechos empresariales;
5. `app_private` es la capa aprobada para lógica y estado técnico no expuesto.

---

#### 10. Objeto `app_private.context_freshness_generations`

Se crea conceptualmente:

```text
app_private.context_freshness_generations
```

Columnas mínimas:

```text
organization_id uuid not null
scope_type text not null
scope_key text not null
generation bigint not null
last_event_id uuid not null
created_at timestamptz not null
updated_at timestamptz not null
schema_version text not null
```

Clave primaria:

```text
organization_id
+
scope_type
+
scope_key
```

No se almacena el token completo en esta tabla.

---

#### 11. Vocabulario cerrado de `scope_type`

Se permiten exactamente:

```text
ACTOR
EMPLOYEE
BASE_LANE
OPERATIONAL_LANE
DEVICE
APP_AUTHORIZATION
GLOBAL_AUTHORIZATION
SYSTEM_DELEGATION
```

`SESSION` no se almacena como contador persistente en esta tabla porque Supabase Auth conserva la autoridad sobre la sesión administrada.

La generación de sesión se deriva de la fuente Auth real.

---

#### 12. Semántica de `scope_key`

`scope_key` es un identificador técnico estable dentro del scope correspondiente.

Ejemplos conceptuales:

```text
ACTOR
→ principal o actor-session resuelto

EMPLOYEE
→ employee_id canónico

BASE_LANE
→ employee_id canónico

OPERATIONAL_LANE
→ employee_id canónico

DEVICE
→ device_id canónico

APP_AUTHORIZATION
→ app_code canónico

GLOBAL_AUTHORIZATION
→ GLOBAL

SYSTEM_DELEGATION
→ delegación o proceso técnico canónico
```

No se usan como `scope_key`:

- nombre;
- alias;
- correo;
- teléfono;
- documento;
- rol visible;
- sede seleccionada;
- área seleccionada;
- ruta;
- permiso;
- recurso.

---

#### 13. Tipo de generación persistida

`generation` utiliza:

```text
bigint
```

Reglas:

1. inicia en `1`;
2. `0` queda reservado para estado no inicializado y nunca se sirve como token válido;
3. cada cambio relevante incrementa mediante `generation = generation + 1`;
4. no se utiliza `nextval()` ni una sequence porque la barrera debe revertirse con la transacción;
5. no se usa timestamp como sustituto de contador;
6. no se usa `MAX(generation) + 1`;
7. el incremento es atómico;
8. overflow produce fallo cerrado.

---

#### 14. Generaciones expuestas dentro del token

Los contadores persistidos no cruzan el contrato como números crudos.

Cada generación del token se serializa como:

```text
sha256:
+
64 caracteres hexadecimales minúsculos
```

La preimagen contiene:

```text
contract_version
organization_id
scope_type
scope_key
generation
```

Esto uniforma el formato de:

```text
actor_generation
employee_generation
base_lane_generation
operational_lane_generation
device_generation
app_authorization_generation
global_authorization_generation
```

y evita convertir el contador interno en API.

---

#### 15. `session_generation`

`session_generation` se deriva directamente de la sesión administrada vigente.

Preimagen mínima:

```text
session_id
user_id
updated_at
not_after
aal
refreshed_at
oauth_client_id
refresh_token_counter
scopes
```

Reglas:

1. usa solo hechos autoritativos necesarios;
2. excluye `refresh_token_hmac_key`;
3. excluye user agent;
4. excluye IP;
5. excluye secretos;
6. excluye el JWT completo;
7. una sesión ausente invalida la lectura;
8. una sesión incompatible con el principal invalida la lectura;
9. la expiración también participa como límite temporal;
10. el resultado usa formato SHA-256 canónico.

No se modifica el schema `auth`.

---

#### 16. `actor_generation`

`actor_generation` representa cambios de:

- actor efectivo;
- sesión de actor;
- atribución;
- delegación;
- vínculo que altera el actor;
- identidad de dominio utilizada por el actor.

Para un actor persistente Vento se obtiene desde `scope_type = ACTOR`.

Para una delegación de sistema se incorpora además `SYSTEM_DELEGATION`.

Para un dispositivo compartido, cambiar la actor session debe cambiar el valor aunque el dispositivo permanezca igual.

---

#### 17. `employee_generation`

`employee_generation` cambia ante:

- creación;
- activación;
- inactivación;
- baja;
- cambio estructural necesario para autorización;
- reconciliación de identidad laboral;
- cambio que modifique la validez del empleado como actor.

No cambia por datos puramente descriptivos sin efecto contextual.

---

#### 18. `base_lane_generation`

`base_lane_generation` cambia ante:

- rol base;
- asignaciones de sede;
- asignaciones de área;
- cobertura administrativa;
- excepciones base;
- overrides individuales aplicables;
- denies base aplicables;
- cambios de vigencia de esos hechos.

No se incrementa por una selección visual de sede o área.

---

#### 19. `operational_lane_generation`

`operational_lane_generation` cambia ante:

- creación o modificación de turno;
- publicación;
- republicación;
- cancelación;
- revisión;
- rol operativo;
- sede operativa;
- área operativa;
- inicio de check-in;
- cierre de check-in;
- corrección;
- invalidación;
- mapping rol-sede-área;
- vigencia de actor operativo.

Los cambios temporales sin escritura se controlan adicionalmente mediante `next_temporal_boundary_at`.

---

#### 20. `device_generation`

`device_generation` cambia ante:

- registro;
- activación;
- inactivación;
- revocación;
- allowlist de aplicaciones;
- restricciones;
- cambio de política;
- cambio de actor session;
- expiración o reemplazo estructural relevante.

El dispositivo continúa siendo restrictivo.

No concede rol ni permiso.

---

#### 21. `app_authorization_generation`

Existe una fila por:

```text
organization_id
+
app_code
```

Cambia cuando una modificación aplicable a esa aplicación puede alterar:

- catálogo de permisos;
- requisito de autorización;
- sensibilidad;
- política de dispositivo;
- grants;
- matriz;
- override;
- deny;
- mapping autorizado.

Cuando el alcance por aplicación no puede determinarse de forma segura, se incrementa `GLOBAL_AUTHORIZATION`.

Nunca se elige un scope menor por optimización.

---

#### 22. `global_authorization_generation`

Existe una fila por organización con:

```text
scope_type = GLOBAL_AUTHORIZATION
scope_key = GLOBAL
```

Cambia cuando una modificación puede afectar transversalmente:

- catálogo global;
- roles canónicos;
- matrices transversales;
- políticas organizacionales;
- structural issue catalog;
- versión contractual activa;
- semántica global de autorización.

Es la barrera segura cuando el impacto no puede reducirse a una app o sujeto.

---

#### 23. Objeto `app_private.context_freshness_bindings`

Se crea conceptualmente:

```text
app_private.context_freshness_bindings
```

Finalidad:

> demostrar qué fuentes físicas están obligadas a incrementar qué generaciones y detectar una escritura relevante sin binding.

Campos mínimos:

```text
binding_id text primary key
source_schema text not null
source_relation text not null
source_kind text not null
mutation_ops text[] not null
event_type text not null
generation_scopes text[] not null
scope_strategy text not null
enforcement_state text not null
owner_task text not null
source_contract_key text not null
source_shape_fingerprint text not null
created_at timestamptz not null
updated_at timestamptz not null
```

---

#### 24. Estados de binding

Se permiten:

```text
BOOTSTRAP
ENFORCED
SUPERSEDED
BLOCKED
```

Semántica:

| Estado       | Significado                                              |
| ------------ | -------------------------------------------------------- |
| `BOOTSTRAP`  | inventariado y todavía no elegible para caché compartida |
| `ENFORCED`   | toda escritura relevante tiene barrera transaccional     |
| `SUPERSEDED` | fuente migrada; binding histórico conservado             |
| `BLOCKED`    | la fuente no puede garantizar invalidación y bloquea L1  |

`VALIDATED_SHARED` exige cero bindings requeridos en `BOOTSTRAP` o `BLOCKED`.

---

#### 25. Relación con el vocabulario de fuentes de AUTH-DB-033

Los bindings deben reconciliar, como mínimo, las fuentes semánticas:

```text
application_catalog
principal_registry
enterprise_identity_links
domain_identity_policy
actor_resolution_model
employment_model
role_catalog
site_catalog
area_catalog
administrative_coverage_policy
shift_model
checkin_model
device_model
actor_session_model
structural_issue_catalog
```

Regla:

```text
FUENTE UTILIZADA POR get_access_context
+
PUEDE CAMBIAR EL CONTEXTO
→ DEBE TENER ESTRATEGIA DE INVALIDACIÓN
```

Una fuente sin binding bloquea `VALIDATED_SHARED`.

---

#### 26. Inventario AS-IS de fuentes a reconciliar

La auditoría remota observó, entre otras, las siguientes relaciones legacy o actuales relacionadas con contexto y autorización:

```text
public.employees
public.employee_sites
public.employee_areas
public.employee_shifts
public.attendance_shift_events
public.employee_site_operational_profiles
public.shared_operational_devices
public.shared_operational_device_actor_sessions
public.shared_operational_device_apps
public.app_permissions
public.employee_permissions
public.operational_role_permissions
public.role_permissions
public.roles
public.operational_roles
public.site_operational_roles
public.shift_policy
```

La existencia de una relación no la convierte automáticamente en fuente canónica.

Antes de crear un trigger, la futura instancia compara esta lista con:

- la fuente realmente elegida por `AUTH-DB-033`;
- el estado después de `AUTH-DB-019`;
- cualquier owner schema ya materializado;
- el inventario de consumidores y migraciones.

---

#### 27. Regla de selección del binding físico

Para cada `source_contract_key` debe existir exactamente una de estas situaciones:

```text
A. fuente autoritativa única
→ binding ENFORCED

B. transición con fuente anterior y nueva
→ ambas registradas
→ una ACTIVE y otra TRANSITIONAL
→ misma generación semántica

C. fuente no materializada
→ binding BOOTSTRAP
→ L1 bloqueada

D. ambigüedad
→ binding BLOCKED
→ materialización no habilita L1
```

No se crean triggers sobre todas las tablas que “parezcan” relacionadas por nombre.

---

#### 28. Regla de scope mínimo seguro

Toda invalidación utiliza el scope más pequeño cuya completitud pueda demostrarse dentro de la misma transacción.

Orden preferido:

```text
SESSION
SUBJECT
DEVICE
APP
ORGANIZATION
GLOBAL
```

Si el scope preciso no puede demostrarse:

```text
AMPLIAR SCOPE
```

Nunca:

```text
ADIVINAR SCOPE MÁS PEQUEÑO
```

Una invalidación más amplia puede costar rendimiento.

Una invalidación demasiado estrecha puede producir stale authority y está prohibida.

---

#### 29. Función `app_private.bump_context_freshness`

Se define la identidad física privada:

```text
app_private.bump_context_freshness(jsonb) → jsonb
```

El argumento es un sobre interno producido únicamente por funciones y triggers privados.

Contiene de forma validada:

```text
organization_id
event_type
generation_scopes
scope_ids
app_code
subject_key_hash
producer
schema_version
```

No es una API para aplicaciones.

---

#### 30. Seguridad de `bump_context_freshness`

La función será:

```text
VOLATILE
SECURITY DEFINER
```

con:

```text
search_path = pg_catalog, app_private
```

y referencias calificadas hacia `audit`.

Reglas:

1. owner técnico no interactivo;
2. `PUBLIC EXECUTE` revocado;
3. `anon` sin execute;
4. `authenticated` sin execute;
5. cero grant cliente;
6. no acepta SQL dinámico;
7. valida catálogo cerrado de event types y scope types;
8. ordena scopes antes de bloquear filas;
9. deduplica scopes;
10. fallo en cualquier incremento aborta toda la escritura caller.

---

#### 31. Algoritmo transaccional de incremento

Dentro de la misma transacción:

```text
1. validar envelope interno
2. normalizar y deduplicar scopes
3. ordenar por organization_id + scope_type + scope_key
4. bloquear o upsert cada generation row
5. capturar generation_before
6. incrementar generation
7. capturar generation_after
8. insertar un evento outbox
9. devolver event_id y resumen técnico
```

Si cualquier paso falla:

```text
ROLLBACK
```

No se confirma el dato empresarial dejando la invalidación pendiente.

---

#### 32. Concurrencia de generaciones

El incremento utiliza operaciones atómicas de fila.

Se prohíbe:

```text
select generation
→ calcular en aplicación
→ update posterior
```

Se requiere una operación equivalente a:

```text
generation = generation + 1
```

bajo el lock de fila de PostgreSQL.

Dos transacciones concurrentes que modifican el mismo scope deben terminar con dos generaciones distintas y ordenadas.

No puede perderse un incremento.

---

#### 33. Orden de locks

Para reducir deadlocks:

```text
organization_id
scope_type
scope_key
```

se ordenan determinísticamente antes de modificar filas.

Un trigger que afecte varias generaciones no puede bloquearlas en orden dependiente del input.

Los deadlocks todavía se tratan como fallo de transacción, nunca como permiso para omitir invalidación.

---

#### 34. Triggers de invalidación

Los triggers pertenecen a las fuentes que realmente producen hechos contextuales.

Se prefieren:

- triggers `AFTER` dentro de la misma transacción;
- transición por statement cuando permita deduplicar scopes de una operación masiva;
- row-level cuando el scope dependa de OLD/NEW individual;
- funciones finas por familia de fuente;
- un núcleo común `bump_context_freshness`.

No se crea un único trigger genérico que infiera semántica por nombres de columnas.

---

#### 35. Familias mínimas de trigger

La implementación debe cubrir, según fuentes materializadas:

```text
identity/principal change
actor-session change
employee lifecycle change
base-role change
site assignment change
area assignment change
administrative coverage change
shift change
checkin change
operational mapping change
device change
device app-policy change
permission catalog change
grant/matrix change
individual override change
deny change
contract version change
```

Cada familia tiene mapping explícito de evento y generaciones.

---

#### 36. No triggers sobre Auth administrado

Queda prohibido usar como mecanismo principal:

```text
trigger custom sobre auth.sessions
trigger custom sobre auth.users
```

para mantener el token.

Razones:

1. Supabase administra esas tablas;
2. su lifecycle puede cambiar con la plataforma;
3. la frescura de sesión puede verificarse directamente;
4. el token no necesita duplicar secretos;
5. una sesión eliminada debe invalidar sin depender de un evento Vento.

Los vínculos empresariales Vento sí invalidan mediante sus propios bindings.

---

#### 37. Outbox `audit.context_invalidation_outbox`

Se crea conceptualmente:

```text
audit.context_invalidation_outbox
```

Campos mínimos:

```text
event_id uuid primary key
event_type text not null
scope_type text not null
scope_ids jsonb not null
app_code text null
organization_id uuid not null
subject_key_hash text null
generation_before jsonb not null
generation_after jsonb not null
occurred_at timestamptz not null
committed_at timestamptz null
source_transaction_id text not null
producer text not null
schema_version text not null
delivery_status text not null
attempt_count integer not null
last_attempt_at timestamptz null
last_error_class text null
delivered_at timestamptz null
```

No almacena `AccessContext`.

---

#### 38. Catálogo de eventos

Se congela inicialmente:

```text
AUTH_SESSION_CHANGED
DOMAIN_IDENTITY_CHANGED
ACTOR_ASSIGNMENT_CHANGED
EMPLOYEE_STATUS_CHANGED
BASE_ROLE_CHANGED
ASSIGNED_SITE_CHANGED
ASSIGNED_AREA_CHANGED
ADMINISTRATIVE_COVERAGE_CHANGED
SHIFT_CHANGED
CHECKIN_SESSION_CHANGED
OPERATIONAL_ROLE_MAPPING_CHANGED
DEVICE_CHANGED
DEVICE_ACTOR_SESSION_CHANGED
SYSTEM_DELEGATION_CHANGED
APP_AUTHORIZATION_CHANGED
PERMISSION_CATALOG_CHANGED
BASE_GRANTS_CHANGED
OPERATIONAL_GRANTS_CHANGED
INDIVIDUAL_OVERRIDE_CHANGED
DENY_CHANGED
CONTRACT_VERSION_CHANGED
```

Una nueva causa requiere extensión contractual explícita.

---

#### 39. Catálogo de scope de evento

Se permiten:

```text
SESSION
SUBJECT
DEVICE
APP
ORGANIZATION
GLOBAL
```

`scope_type` del evento describe el alcance de expulsión.

No es el mismo vocabulario que `scope_type` de la tabla de generaciones.

---

#### 40. Estado de delivery del outbox

Se permiten:

```text
PENDING
CLAIMED
DELIVERED
FAILED
DEAD_LETTER
```

Reglas:

1. la transacción empresarial crea `PENDING`;
2. la fila solo es visible a consumidores después del commit;
3. el dispatcher puede marcar `committed_at` al reclamar la fila visible;
4. fallo de delivery no revierte un commit ya confirmado;
5. fallo de delivery tampoco permite stale hit porque las generaciones ya cambiaron;
6. el replay es idempotente por `event_id`.

---

#### 41. `source_transaction_id`

Se captura una identidad de transacción PostgreSQL mediante una fuente equivalente a:

```text
pg_current_xact_id()
```

y se serializa como texto.

No se utiliza como ID empresarial.

No se expone a cliente.

Permite correlacionar:

```text
dato cambiado
↔ generación
↔ outbox
```

---

#### 42. Función `app_private.get_context_freshness_token`

Se define la identidad física:

```text
app_private.get_context_freshness_token(text) → jsonb
```

Único parámetro:

```text
p_app_code text
```

No acepta:

- user id;
- employee id;
- actor id;
- device id;
- session id;
- role;
- site;
- area;
- permiso;
- recurso;
- generation proporcionada por el caller.

---

#### 43. Volatilidad y seguridad del token reader

`get_context_freshness_token(text)` será:

```text
STABLE
SECURITY DEFINER
```

con:

```text
search_path = pg_catalog, app_private
```

Reglas:

1. usa el mismo snapshot de la invocación;
2. no escribe;
3. no crea generation rows;
4. no corrige bindings;
5. no hace lazy initialization;
6. no usa SQL dinámico;
7. lee únicamente fuentes calificadas;
8. `PUBLIC` no ejecuta;
9. `anon` no ejecuta;
10. `authenticated` no recibe execute directo;
11. el token completo no se publica mediante `api`.

---

#### 44. Transporte hacia SHELL-CTX-006

`AUTH-DB-035` no inventa un RPC cliente para el token.

La integración futura con `SHELL-CTX-006` deberá utilizar una frontera server-only aprobada.

Hasta que esa frontera exista y sea probada:

```text
cache_mode = REQUEST_ONLY
```

Queda prohibido resolver la falta de transporte haciendo:

```text
GRANT EXECUTE TO authenticated
```

sobre el token reader.

También queda prohibido exponer el token completo en `api`.

---

#### 45. Resolución del principal para el token

El token reader reutiliza la semántica de resolución aprobada por `AUTH-DB-033`.

Debe resolver:

```text
p_app_code
principal técnico
sesión
actor efectivo
empleado cuando aplique
dispositivo cuando aplique
organization_id
```

No reconstruye un segundo modelo de actor.

No acepta identidad del caller como argumento.

---

#### 46. `subject_key`

`subject_key` se calcula mediante serialización canónica de:

```text
environment
organization_id
app_code
principal_type
principal_id
auth_session_id
actor_session_id
system_process_id
effective_actor_identity
```

solo con dimensiones aplicables.

Se convierte a:

```text
sha256:
+
64 hex
```

No contiene PII humana.

No se registra en logs generales sin protección adicional.

---

#### 47. Identidad de environment

Se crea una fuente técnica privada:

```text
app_private.context_freshness_runtime
```

con exactamente una identidad activa por base de datos.

Campos mínimos:

```text
runtime_key text primary key
environment_code text not null
environment_identity text not null
schema_version text not null
created_at timestamptz not null
updated_at timestamptz not null
```

Regla de cardinalidad:

```text
runtime_key = ACTIVE
→ exactamente una fila
```

`environment_identity` es opaca y única por entorno.

No es nombre de usuario, app o organización.

---

#### 48. Bootstrap de environment

La migration crea la estructura.

La identidad específica del entorno se materializa mediante un procedimiento versionado de bootstrap ejecutado desde `vento-shell` y registrado en la evidencia de la instancia.

Reglas:

1. no se hardcodea `production` en una migration compartida;
2. no se obtiene environment desde el navegador;
3. no se confía en un header del cliente;
4. cada entorno debe tener identidad distinta;
5. ausencia o duplicado de runtime identity bloquea el token reader;
6. `AUTH-DB-028` debe capturar drift de esta identidad.

---

#### 49. Resolución de organization

`organization_id` procede de las fuentes organizacionales canónicas.

No se deduce de:

- dominio web;
- app code;
- sede;
- email;
- rol;
- una constante “Vento” embebida.

Aunque exista una sola organización activa, el campo permanece explícito.

Si no puede resolverse exactamente una organización aplicable:

```text
TOKEN READ FAILS CLOSED
```

---

#### 50. `next_temporal_boundary_at`

El token reader calcula el mínimo aplicable entre:

- expiración de access token;
- `auth.sessions.not_after`;
- fin del turno actual;
- inicio de turno futuro que cambia contexto;
- cierre o expiración de check-in;
- expiración de actor session;
- expiración del dispositivo;
- expiración de delegación;
- inicio o fin de asignación;
- inicio o fin de cobertura;
- inicio o fin de override;
- inicio o fin de deny;
- cambio contractual programado.

El cálculo usa reloj de servidor/base de datos.

Nunca reloj cliente.

---

#### 51. Helper temporal compartido

Para impedir dos algoritmos distintos entre token y L2 se define:

```text
app_private.resolve_context_temporal_boundary(text) → timestamptz
```

El parámetro es `p_app_code`.

El helper:

1. resuelve únicamente límites temporales;
2. no decide permisos;
3. no devuelve hechos completos;
4. puede ser consumido por el token reader;
5. puede ser consumido por la proyección segura de `AUTH-DB-033`;
6. mantiene el margen contractual de seguridad fuera del dato bruto.

La migración de 035 puede refactorizar internamente el cálculo de `expires_at` de la proyección segura sin cambiar su forma pública.

---

#### 52. Margen de seguridad

La política conserva:

```text
safety_margin = 1 segundo
```

El margen se aplica al consumidor de la boundary.

No se modifica el timestamp de la fuente para ocultar su valor.

Regla futura de uso:

```text
server_now
<
next_temporal_boundary_at - 1 segundo
```

---

#### 53. Forma exacta de `ContextFreshnessToken@1.0.0`

El token materializado contiene:

```text
contract_name
contract_version
environment
organization_id
app_code
subject_key
session_generation
actor_generation
employee_generation
base_lane_generation
operational_lane_generation
device_generation
app_authorization_generation
global_authorization_generation
next_temporal_boundary_at
issued_at
token_fingerprint
```

No se agregan campos de autorización.

---

#### 54. Campos nulos de generaciones

Cuando una dimensión no aplica, se usa una constante semántica estable:

```text
NOT_APPLICABLE
```

Ejemplos:

- `employee_generation` para un system service sin empleado;
- `device_generation` para una sesión humana personal sin dispositivo gobernado;
- `operational_lane_generation` para un actor que contractualmente no tiene carril operativo.

No se usa `null` para confundir:

```text
no aplica
```

con:

```text
faltó la generación
```

Una generación requerida ausente es error técnico.

---

#### 55. `issued_at`

`issued_at`:

- se genera en servidor;
- usa UTC;
- corresponde a la lectura actual;
- no es una generación;
- no prueba frescura por sí solo;
- no participa en `token_fingerprint`.

Dos lecturas consecutivas sin cambios pueden tener `issued_at` distinto y `token_fingerprint` igual.

---

#### 56. `token_fingerprint`

Se calcula sobre la representación canonicalizada de:

```text
contract_name
contract_version
environment
organization_id
app_code
subject_key
session_generation
actor_generation
employee_generation
base_lane_generation
operational_lane_generation
device_generation
app_authorization_generation
global_authorization_generation
next_temporal_boundary_at
```

Se excluyen:

```text
issued_at
token_fingerprint
delivery metadata
correlation_id
```

Formato:

```text
sha256:
+
64 hex minúsculos
```

---

#### 57. Canonicalización

Se reutiliza:

```text
vento.canonical-json@1.0.0
```

No se usa `jsonb::text` como contrato suficiente.

El orden de keys, arrays y valores normalizados debe ser determinista.

La misma semántica produce el mismo fingerprint.

---

#### 58. Lectura de generaciones requeridas

El token reader determina scopes desde el actor real.

Ejemplo humano:

```text
session
actor
employee
base lane
operational lane
app authorization
global authorization
```

Ejemplo dispositivo compartido:

```text
session técnica si aplica
device
actor session
actor humano
employee
base lane
operational lane
app authorization
global authorization
```

Ejemplo SYSTEM:

```text
system principal
system delegation
app authorization
global authorization
```

No se rellena una dimensión con datos de otro plano.

---

#### 59. Generación faltante

Antes de habilitar L1:

```text
GENERACIÓN REQUERIDA AUSENTE
→ TOKEN NO UTILIZABLE
→ BYPASS L1
→ RESOLUCIÓN FRESCA
→ ALERTA DE DRIFT
```

Una generación faltante nunca se interpreta como:

```text
g:0
```

ni como:

```text
sin cambios
```

No se inicializa mediante una lectura.

---

#### 60. Backfill inicial

La futura migration debe sembrar:

- generations de empleados existentes;
- base lanes aplicables;
- operational lanes aplicables;
- devices;
- actores/delegaciones Vento aplicables;
- apps activas;
- generación global por organización;
- bindings de fuentes.

Valor inicial:

```text
generation = 1
```

El backfill debe completarse antes de marcar los bindings como `ENFORCED`.

---

#### 61. Cierre de carrera durante backfill

La estrategia de materialización debe evitar:

```text
BACKFILL
→ escritura concurrente no observada
→ trigger instalado después
```

La instalación debe ejecutarse mediante una migration transaccional y locks de DDL adecuados.

Orden:

```text
crear estructuras
→ registrar bindings BOOTSTRAP
→ backfill
→ crear funciones
→ crear triggers
→ validar cobertura
→ cambiar bindings a ENFORCED
→ commit
```

Si no puede cerrarse la ventana:

```text
ROLLBACK
```

---

#### 62. Rebinding durante migraciones de dominio

Cuando una fuente se mueva desde un schema legacy a su owner schema:

```text
1. crear binding nuevo
2. conservar misma generación semántica
3. instalar invalidación nueva
4. probar escritura
5. cambiar lectura canónica
6. marcar binding anterior SUPERSEDED
7. retirar trigger anterior
```

No se reinicia la generación a `1`.

No se habilitan dos fuentes como autoridad simultánea sin transición explícita.

---

#### 63. Regla para writers de dominio

Después de `AUTH-DB-035::GLOBAL`, toda tarea que cree o cambie una fuente capaz de modificar `AccessContext` debe:

1. declarar impacto de frescura;
2. conservar o crear binding;
3. incrementar la generación correcta;
4. producir outbox en la misma transacción;
5. actualizar drift;
6. incluir prueba negativa de stale;
7. preservar rollback.

Esta regla aplica a migraciones posteriores de owner schemas.

---

#### 64. Integración con AUTH-DB-033

`AUTH-DB-035` no cambia:

```text
app_private.get_access_context(text)
```

ni:

```text
api.get_safe_access_context(text)
```

como contratos públicos ya definidos.

Puede reutilizar:

- principal resolver;
- actor resolver;
- canonicalizer;
- fingerprint helpers;
- temporal facts.

No puede convertir el freshness token en un nuevo campo de `AccessContext@1.0.0`.

---

#### 65. `cache_status` después de AUTH-DB-035

La sola existencia de generaciones no habilita L1.

Mientras `SHELL-CTX-006` no exista y no active una estrategia compartida:

```text
cache_status = NOT_IMPLEMENTED
```

permanece válido.

`AUTH-DB-035` no empieza a devolver `HIT` ni `MISS`.

---

#### 66. Integración con SafeContextProjection

La proyección segura puede conservar:

```text
context_id
context_fingerprint
expires_at
safe_fields
```

No puede incluir:

```text
ContextFreshnessToken
session_generation
actor_generation
employee_generation
base_lane_generation
operational_lane_generation
device_generation
app_authorization_generation
global_authorization_generation
token_fingerprint
generation counters
```

La caché L2 no obtiene la barrera interna.

---

#### 67. Integración con AUTH-DB-034

`AUTH-DB-034` podrá consumir un contexto cuya frescura haya sido validada.

No podrá interpretar:

```text
freshness_token valid
```

como:

```text
ALLOW
```

La evaluación conserva:

- permiso exacto;
- recurso exacto;
- requisito de autorización;
- precedencia;
- deny;
- evidencia;
- fail closed.

---

#### 68. Integración con AUTH-DB-032

`AUTH-DB-032` podrá persistir referencias como:

- context id;
- context fingerprint;
- cache status observado;
- versiones;
- decisión.

No persiste la tabla de generaciones como historia de decisión.

El outbox de 035 tampoco sustituye la auditoría de autorización.

---

#### 69. Integración con SHELL-CTX-006

`SHELL-CTX-006` será responsable de:

- modos `OFF`, `REQUEST_ONLY`, `SHADOW_SHARED`, `VALIDATED_SHARED`;
- storage L1;
- single-flight cross-request;
- lectura doble T1/T2;
- comparación de token;
- TTL;
- safety margin;
- purga por eventos;
- métricas de caché;
- rollback a `REQUEST_ONLY`.

`AUTH-DB-035` no crea Redis ni otro storage L1.

---

#### 70. Eventos como optimización

El evento outbox permite:

- purga anticipada;
- refresh de L2;
- reducción de misses;
- observabilidad;
- reconciliación.

Pero:

```text
EVENTO NO RECIBIDO
→ SIGUIENTE TOKEN READ VE LA NUEVA GENERACIÓN
→ ENTRADA ANTERIOR NO ES HIT
```

La seguridad no depende de delivery en tiempo real.

---

#### 71. Realtime y NOTIFY

Esta tarea no obliga a utilizar Supabase Realtime ni PostgreSQL `NOTIFY`.

Si se añaden después:

- consumen el outbox;
- no sustituyen generación;
- no cambian el commit empresarial;
- no conceden autoridad;
- no exponen el token al cliente;
- deben respetar el schema `realtime` administrado.

---

#### 72. RLS y ACL de tablas nuevas

Para:

```text
app_private.context_freshness_generations
app_private.context_freshness_bindings
app_private.context_freshness_runtime
audit.context_invalidation_outbox
```

se exige:

1. RLS habilitada como defensa en profundidad;
2. cero policy de cliente;
3. `PUBLIC` sin privileges;
4. `anon` sin privileges;
5. `authenticated` sin privileges;
6. ninguna tabla se añade a Data API;
7. ningún owner schema se expone;
8. acceso únicamente por owner técnico y funciones privadas aprobadas.

---

#### 73. ACL de funciones nuevas

Estado objetivo:

| Función                                               | PUBLIC | anon | authenticated | Uso                         |
| ----------------------------------------------------- | -----: | ---: | ------------: | --------------------------- |
| `app_private.get_context_freshness_token(text)`       |     NO |   NO |            NO | interno server-only         |
| `app_private.resolve_context_temporal_boundary(text)` |     NO |   NO |            NO | helper privado              |
| `app_private.bump_context_freshness(jsonb)`           |     NO |   NO |            NO | triggers y writers privados |
| helpers de fingerprint                                |     NO |   NO |            NO | internos                    |

No se crea una excepción equivalente a `api.get_safe_access_context`.

---

#### 74. Service role

`service_role` continúa siendo una identidad de infraestructura.

No significa:

```text
employee
owner
manager
authorized actor
```

Si una llamada técnica carece de principal empresarial o SYSTEM registrado:

```text
TOKEN READ FAILS CLOSED
```

No se crea bypass por service role.

---

#### 75. Seguridad de `SECURITY DEFINER`

Toda función privilegiada debe demostrar:

- owner no interactivo;
- `search_path` fijo;
- objetos críticos calificados;
- cero SQL dinámico;
- cero dependencia de nombres controlados por caller;
- cero execute cliente;
- poisoning test;
- homonym test;
- ACL test;
- RLS coexistente;
- error sin nombres internos.

No se usa `SECURITY DEFINER` solo para evitar un error de permisos.

---

#### 76. Idempotencia

Una segunda ejecución de la migration sobre un ambiente ya materializado debe:

- confirmar objetos;
- confirmar constraints;
- confirmar ACL;
- confirmar bindings;
- confirmar functions;
- confirmar triggers;
- no resetear generations;
- no duplicar outbox;
- no volver a `generation = 1`;
- no crear grants más amplios.

Drift incompatible bloquea.

---

#### 77. Drift de bindings

El harness debe comparar:

```text
binding registry
vs
pg_trigger
vs
source registry de get_access_context
```

Debe detectar:

- fuente sin binding;
- trigger ausente;
- trigger duplicado;
- binding hacia relación inexistente;
- relación reemplazada sin rebinding;
- generation scope incorrecto;
- event type incorrecto;
- binding BOOTSTRAP inesperado;
- binding BLOCKED.

Cualquier diferencia que pueda permitir stale authority bloquea `VALIDATED_SHARED`.

---

#### 78. Drift de Auth administrado

El token reader debe validar que las columnas de `auth.sessions` necesarias para su fingerprint siguen disponibles con semántica compatible.

Si Supabase cambia esa estructura:

```text
DRIFT
→ token reader incompatible
→ L1 BYPASS
→ no stale hit
```

No se parchea silenciosamente una migration histórica.

Se crea una migration forward.

---

#### 79. Índices

Índices mínimos candidatos:

```text
context_freshness_generations
→ PK organization_id, scope_type, scope_key

context_freshness_bindings
→ PK binding_id
→ índice por source_schema, source_relation
→ índice por enforcement_state

context_invalidation_outbox
→ PK event_id
→ índice parcial por delivery_status = PENDING
→ índice por organization_id, occurred_at
→ índice por app_code, occurred_at cuando app_code no sea null
```

Los índices definitivos requieren evidencia de plan.

No se agregan índices por rutina sin query real.

---

#### 80. Retención del outbox

El outbox no es auditoría eterna por defecto.

Debe existir política de retención que preserve:

- eventos no entregados;
- eventos en retry;
- dead letters;
- ventana de reconciliación;
- evidencia requerida por incidentes.

La purga solo elimina filas entregadas y fuera de la ventana aprobada.

La política exacta de retención operativa puede ajustarse sin cambiar la semántica del token.

---

#### 81. Privacidad de métricas y logs

No se registran:

- token completo;
- generation rows completas;
- JWT;
- refresh token;
- email;
- teléfono;
- documento;
- UUID humano crudo en logs generales;
- grants completos;
- denies completos.

Se permiten:

```text
app_code
scope_type
event_type
cache_mode
binding_id
generation_delta
token_fingerprint_prefix
subject_key protegido
correlation_id
latency
error_class
```

---

#### 82. Fallo del token reader

Casos:

| Caso                         | Resultado                                          |
| ---------------------------- | -------------------------------------------------- |
| generation requerida ausente | token no utilizable                                |
| sesión ausente               | error seguro o actor no autenticado según contrato |
| runtime identity ausente     | error técnico                                      |
| organization ambigua         | error técnico                                      |
| binding BLOCKED              | token no elegible para L1                          |
| temporal source inválida     | error técnico                                      |
| fingerprint falla            | error técnico                                      |

Ninguno produce una generación anterior por fallback.

---

#### 83. Fallo de generación durante escritura

Si un writer relevante no puede:

- resolver organization;
- resolver scope;
- incrementar generation;
- escribir outbox;

la transacción relevante falla.

No se permite:

```text
COMMIT EMPRESARIAL
+
LOG WARNING
+
CONTINUAR
```

cuando la escritura está clasificada como contextual.

---

#### 84. Fallo de delivery del outbox

Después del commit:

```text
delivery falla
→ generation ya cambió
→ token nuevo difiere
→ cache vieja no es HIT
```

Por tanto el dispatcher puede reintentar sin abrir una ventana de stale authority.

Dead letter genera incidente operativo.

No exige revertir el dato empresarial ya confirmado.

---

#### 85. Transacciones concurrentes

Pruebas obligatorias:

```text
T1 modifica turno
T2 modifica turno
→ dos incrementos observables
```

```text
T1 cambia rol
T2 lee token antes de commit
→ ve snapshot anterior válido para su transacción
```

```text
T2 lee después de commit
→ ve nueva generation
```

```text
transacción abortada
→ generation y outbox también abortan
```

---

#### 86. Carreras durante resolución de caché futura

La implementación de 035 debe permitir el algoritmo posterior:

```text
TOKEN T1
→ resolver contexto
→ TOKEN T2
```

Sin cambios:

```text
T1.fingerprint = T2.fingerprint
```

Con cambio concurrente:

```text
T1.fingerprint != T2.fingerprint
```

La resolución no se almacena.

035 no implementa el storage ni el retry del consumidor.

---

#### 87. Boundary sin escritura

Debe probarse que una entrada puede quedar obsoleta aunque ninguna generation cambie.

Ejemplo:

```text
turno termina a las 15:00
token leído a las 14:59
generation estable
15:00 alcanzado
→ token ya no habilita HIT
```

El mecanismo es:

```text
next_temporal_boundary_at
```

No un trigger ficticio de reloj.

---

#### 88. Denies y vigencias temporales

Un deny con inicio o fin programado participa en:

```text
next_temporal_boundary_at
```

Cuando se crea, modifica o elimina:

```text
generation correspondiente también cambia
```

Así se cubren:

- cambios por escritura;
- cambios por paso del tiempo.

---

#### 89. No caché de recursos

Un cambio en un recurso empresarial no obliga a incrementar contexto cuando no modifica hechos del actor.

Ejemplos:

- pedido cambia estado;
- activo cambia custodio;
- lote cambia fase;
- solicitud cambia destino.

Esos cambios pertenecen a:

```text
resource resolver
+
AuthorizationDecision nueva
```

No a `context_freshness_generations`.

---

#### 90. No caché de AuthorizationDecision

035 no crea:

- decision cache table;
- decision token;
- decision generation;
- bearer decision;
- reusable allow.

La futura evaluación de 034 permanece por solicitud y recurso exacto.

---

#### 91. No stale-while-revalidate

La infraestructura no crea ningún mecanismo que pueda devolver:

```text
token mismatch
+
context anterior
```

No se admite:

```text
usar stale
→ refrescar después
```

para autoridad.

El token mismatch es rechazo inmediato de la entrada.

---

#### 92. Bootstrap y modo inicial

Después de materializar `AUTH-DB-035::GLOBAL`:

```text
token infrastructure = AVAILABLE
generations = INITIALIZED
bindings = ENFORCED o explícitamente BLOCKED
outbox = AVAILABLE
cache L1 = DISABLED
cache mode = REQUEST_ONLY
```

No se habilita `SHADOW_SHARED` automáticamente.

No se habilita `VALIDATED_SHARED`.

---

#### 93. Puerta hacia SHADOW_SHARED

Antes de `SHADOW_SHARED` se requiere:

1. `AUTH-DB-035::GLOBAL` verificada;
2. cero binding requerido BLOCKED;
3. generations inicializadas;
4. token reader estable;
5. outbox probado;
6. runtime identity válida;
7. organización resuelta;
8. métricas disponibles;
9. storage privado de `SHELL-CTX-006`;
10. feature flag server-side.

Shadow nunca sirve la entrada como autoridad.

---

#### 94. Puerta hacia VALIDATED_SHARED

035 aporta solamente parte de la puerta.

Se mantiene el requisito global:

- 033 implementada;
- 035 implementada;
- `SHELL-CTX-006` implementada;
- `SHELL-AUTH-003` implementada;
- double-read probado;
- multiinstancia probada;
- pérdida de evento probada;
- cache outage probada;
- token outage probado;
- corrupción probada;
- actor switch probado;
- logout probado;
- check-out probado;
- deny inmediato probado;
- rollback probado;
- shadow sin diferencias no explicadas.

035 por sí sola nunca habilita producción compartida.

---

#### 95. Rollback de la infraestructura

Si 035 debe revertirse antes de existir L1:

```text
1. confirmar cache mode REQUEST_ONLY
2. detener consumidores del token
3. retirar triggers mediante migration forward
4. conservar evidencia outbox requerida
5. retirar functions solo sin dependencias
6. retirar tablas solo si no existen consumidores
7. restaurar ACL desde snapshot
8. validar drift
```

No se utiliza `DROP CASCADE`.

---

#### 96. Rollback después de existir L1

Si una versión posterior ya usa L1:

```text
1. forzar REQUEST_ONLY
2. comprobar cero reads L1
3. invalidar namespace compartido
4. detener consumo del token
5. aplicar migration forward correctiva
```

Queda prohibido:

```text
desactivar generation triggers
mientras VALIDATED_SHARED sigue activo
```

---

#### 97. Backup y restore

`AUTH-DB-029` debe cubrir:

- generation tables;
- binding registry;
- runtime identity;
- outbox requerido por ventana;
- functions y triggers;
- ACL.

Después de restore:

1. verificar runtime identity;
2. reconciliar generations contra fuentes;
3. marcar cache compartida como no confiable;
4. usar `REQUEST_ONLY`;
5. reactivar L1 solo después de drift y token checks.

No se asume que una entrada de caché externa restaurada siga válida.

---

#### 98. Reconciliación de generations

Debe existir una operación de verificación que detecte:

- scope esperado sin row;
- row huérfana;
- app faltante;
- global generation faltante;
- organization desconocida;
- binding sin scope;
- actor/device sin generación;
- source migration no rebindeada.

La reconciliación no reduce counters.

Una corrección crea rows faltantes con una nueva barrera global cuando sea necesario.

---

#### 99. Manifiesto mínimo de futura materialización

La futura instancia debe registrar, como mínimo:

```text
instance_id = AUTH-DB-035::GLOBAL
mode = GLOBAL_ENABLE_ONCE
execution_gate = PRE_E5_FOUNDATION
migration_files
source_contract_sha256
environment
project_ref
runtime_identity
generation_table
binding_table
outbox_table
token_reader_signature
bump_function_signature
trigger_bindings
acl_snapshot_before
acl_snapshot_after
rls_snapshot
generation_backfill_counts
binding_counts
outbox_test_event_ids
drift_before
drift_after
validation_commands
rollback_plan
evidence
```

No se considera implementada por existir únicamente la migration.

---

#### 100. Dependencias físicas de AUTH-DB-035::GLOBAL

Antes de autorizar físicamente la instancia debe existir evidencia de:

```text
R0 aplicable verificado
AUTH-DB-016::GLOBAL materializada cuando los schemas requeridos todavía no existan
AUTH-DB-018::GLOBAL materializada cuando la separación privada sea prerrequisito
AUTH-DB-017::GLOBAL coherente con api/app_private no expuesto
AUTH-DB-019::GLOBAL disponible para principal y vínculos
AUTH-DB-033::GLOBAL VERIFIED
AUTH-DB-027 disponible
AUTH-DB-028 baseline vigente
AUTH-DB-029 rollback disponible
```

Si `AUTH-DB-033::GLOBAL` no está `VERIFIED`, 035 no se autoriza físicamente.

---

#### 101. Orden de materialización física

Secuencia esperada:

```text
1. preflight y baseline
2. snapshot ACL/RLS/objetos
3. verificar AUTH-DB-033::GLOBAL
4. crear migration versionada
5. crear runtime identity structure
6. crear generation table
7. crear binding registry
8. crear outbox
9. crear helpers
10. crear token reader
11. backfill generations
12. instalar triggers/bindings
13. verificar atomicidad
14. verificar token
15. verificar boundaries
16. verificar ACL/RLS
17. ejecutar pruebas de concurrencia
18. ejecutar rollback rehearsal
19. validar drift
20. registrar evidencia
```

El procedimiento puede agruparse en migrations coherentes, pero no alterar la precedencia.

---

#### 102. Política de migrations

Toda modificación futura:

- se crea en `vento-shell`;
- utiliza migration versionada;
- no se aplica desde Dashboard manualmente;
- no se ejecuta SQL ad hoc como estado final;
- no reutiliza una migration histórica;
- no edita una migration ya aplicada;
- usa migration forward para correcciones;
- conserva evidencia del hash aplicado.

El bootstrap específico de environment también debe provenir de un script versionado del repositorio.

---

#### 103. Pruebas físicas obligatorias — estructura

La futura instancia debe demostrar:

1. existen los tres objetos privados previstos;
2. existe el outbox;
3. PK de generations exacta;
4. `generation >= 1`;
5. scope types cerrados;
6. binding states cerrados;
7. event types cerrados;
8. event scope types cerrados;
9. runtime identity cardinalidad exacta;
10. constraints bloquean estados inválidos.

---

#### 104. Pruebas físicas obligatorias — token

11. app válida produce exactamente un token;
12. app null falla;
13. app vacía falla;
14. app desconocida falla de forma cerrada;
15. no existe overload con actor;
16. token contract version exacta;
17. subject key estable;
18. issued_at cambia entre lecturas;
19. fingerprint no cambia solo por issued_at;
20. cambio de generation cambia fingerprint;
21. boundary cambia fingerprint;
22. generation requerida ausente no produce token válido;
23. dimensión no aplicable usa `NOT_APPLICABLE`;
24. token no contiene secretos.

---

#### 105. Pruebas físicas obligatorias — sesión

25. sesión válida produce session generation;
26. session id distinto produce generation distinta;
27. sesión ausente bloquea;
28. user id de session incompatible bloquea;
29. cambio de `not_after` cambia session generation o boundary;
30. cambio relevante de sesión cambia token;
31. access token expirado no permite token reutilizable;
32. no se crean triggers en `auth.sessions`;
33. no se leen secretos de refresh token;
34. service role no obtiene actor implícito.

---

#### 106. Pruebas físicas obligatorias — transacciones

35. update de empleado incrementa generation aplicable;
36. cambio de rol base incrementa base lane;
37. cambio de asignación incrementa base lane;
38. cambio de turno incrementa operational lane;
39. check-in incrementa operational lane;
40. cambio de dispositivo incrementa device generation;
41. cambio de actor incrementa actor y device cuando aplique;
42. cambio app incrementa app generation;
43. cambio global incrementa global generation;
44. outbox se inserta en misma transacción;
45. rollback empresarial revierte generation;
46. rollback empresarial revierte outbox;
47. fallo de generation revierte escritura;
48. dos writers concurrentes no pierden incrementos;
49. scopes múltiples se bloquean en orden determinista.

---

#### 107. Pruebas físicas obligatorias — bindings

50. cada source contract key requerido tiene binding;
51. no existe binding duplicado activo;
52. binding apunta a relación real;
53. trigger real coincide con binding;
54. source shape fingerprint coincide;
55. binding BOOTSTRAP bloquea shared;
56. binding BLOCKED bloquea shared;
57. source nueva sin binding se detecta;
58. source superseded no se usa como autoridad;
59. rebinding conserva generations.

---

#### 108. Pruebas físicas obligatorias — temporalidad

60. fin de turno define boundary;
61. inicio de turno futuro relevante define boundary;
62. check-in expirado define boundary;
63. actor session expira en boundary;
64. dispositivo expirado define boundary;
65. deny temporal define boundary;
66. asignación temporal define boundary;
67. safety margin de un segundo se respeta;
68. boundary alcanzada invalida aunque generation no cambie;
69. reloj cliente no participa.

---

#### 109. Pruebas físicas obligatorias — seguridad

70. `PUBLIC` sin SELECT;
71. `anon` sin SELECT;
72. `authenticated` sin SELECT;
73. `PUBLIC` sin execute token reader;
74. `anon` sin execute;
75. `authenticated` sin execute;
76. bump function inaccesible a cliente;
77. outbox inaccesible a cliente;
78. runtime table inaccesible a cliente;
79. search path poisoning falla;
80. objeto homónimo no altera resultado;
81. input manipulado no elige actor;
82. token no aparece en proyección segura;
83. no se añade schema a Data API;
84. RLS permanece habilitada;
85. service role no concede autoridad empresarial.

---

#### 110. Pruebas físicas obligatorias — outbox y resiliencia

86. event id único;
87. replay por event id es idempotente;
88. evento perdido no invalida la barrera de generation;
89. delivery FAIL conserva generation;
90. dead letter no produce stale hit;
91. outbox lag se puede medir;
92. source transaction id correlaciona;
93. evento no contiene contexto completo;
94. evento no contiene token;
95. evento no contiene secretos.

---

#### 111. Pruebas físicas obligatorias — operación

96. segunda ejecución no resetea generations;
97. drift final limpio;
98. plan de índices capturado;
99. p50/p95 del token reader registrados;
100. costo de incrementos registrado;
101. bulk update no crea deadlock reproducible;
102. rollback rehearsal aprobado;
103. restore obliga REQUEST_ONLY;
104. local/staging/ambiente autorizado conservan aislamiento;
105. dos ambientes no producen misma runtime identity.

---

#### 112. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Justificación:** `AUTH-DB-035` materializa el contrato de frescura, invalidación, concurrencia, temporalidad y seguridad ya definido por las tareas de contexto y por el plan maestro de pruebas. La tarea concreta objetos físicos, atomicidad, ACL, bindings, backfill, rollback y evidencia sin introducir una capacidad empresarial nueva, un permiso nuevo, una regla de acceso nueva ni una semántica nueva de autorización.

---

#### 113. Cobertura de prueba vigente reutilizada

Se reutiliza sin modificar la cobertura ya aprobada para:

- frescura de contexto;
- invalidación transaccional;
- carreras;
- límites temporales;
- session lifecycle;
- actor switch;
- check-in y turno;
- dispositivos;
- cambios de grants y denies;
- cache outage;
- token outage;
- evento perdido;
- stale rejection;
- multiinstancia;
- rollback;
- drift;
- seguridad adversarial;
- proyecciones cliente;
- no reutilización de decisiones.

No se modifica el Registro Canónico de Requisitos de Prueba.

---

#### 114. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| --------- | -------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | el desarrollo documental no creó migrations, tablas, triggers ni código físico                                                                                                                                                                                                                                                                                                                                                                                                |
| LOCAL     | NOT_EXECUTED   | pendiente de insertar el bloque en `task/auth-db-035`, normalizarlo con `docs:task:format --write` y ejecutar el lifecycle documental                                                                                                                                                                                                                                                                                                                                         |
| REMOTA    | PASS           | auditoría read-only 2026-08-22 sobre `vento-shell` y `vento-os-dev`: `AUTH-DB-033` está aprobada y reserva 035; no se observaron objetos de freshness/generation/invalidation/outbox en los schemas consultados; persisten los dos resolvers legacy; `auth.sessions` conserva datos suficientes para derivar frescura de sesión sin mutar el schema Auth; se inventariaron relaciones y triggers actuales relacionados con empleado, turno, check-in, permisos y dispositivos |
| OPERATIVA | NOT_APPLICABLE | no se modificó runtime, cache mode, consumers ni experiencia de usuario                                                                                                                                                                                                                                                                                                                                                                                                       |
| FÍSICA    | NOT_APPLICABLE | no se ejecutó SQL de mutación, no se creó migration y `AUTH-DB-035::GLOBAL` no fue autorizada                                                                                                                                                                                                                                                                                                                                                                                 |

---

#### 115. Decisiones vinculantes

1. La futura instancia es `AUTH-DB-035::GLOBAL`.
2. Su modo es `GLOBAL_ENABLE_ONCE`.
3. Su gate es `PRE_E5_FOUNDATION`.
4. 035 no implementa L1.
5. L1 permanece deshabilitada después de 035.
6. Las generations viven en `app_private`.
7. Los bindings viven en `app_private`.
8. El runtime environment vive en `app_private`.
9. El outbox vive en `audit`.
10. Ninguno de esos objetos es autoridad empresarial.
11. Se crea `app_private.context_freshness_generations`.
12. La PK usa organization, scope type y scope key.
13. Generation es `bigint`.
14. Generation inicia en 1.
15. No se usa sequence.
16. No se usa timestamp como generación.
17. Se crea vocabulario cerrado de generation scopes.
18. Session generation no depende de trigger custom en `auth.sessions`.
19. Session generation se deriva del estado Auth real.
20. Secrets de refresh token no participan.
21. Generations del token usan SHA-256 uniforme.
22. Se crea `app_private.context_freshness_bindings`.
23. Todo source contract key contextual tiene estrategia de invalidación.
24. Un source sin binding bloquea shared cache.
25. Se usan states BOOTSTRAP, ENFORCED, SUPERSEDED y BLOCKED.
26. Se usa el scope mínimo seguro.
27. Ante duda se amplía scope.
28. Se crea `app_private.bump_context_freshness(jsonb)`.
29. La función es privada.
30. La función es `VOLATILE`.
31. La función es `SECURITY DEFINER` endurecida.
32. Todo incremento y outbox están en la misma transacción.
33. Fallo del incremento revierte la escritura.
34. Los scopes se ordenan antes de locks.
35. No se pierde incremento concurrente.
36. Se crean triggers solo sobre fuentes autoritativas confirmadas.
37. No se infieren triggers por nombre.
38. No se crean triggers sobre Auth administrado.
39. Se crea `audit.context_invalidation_outbox`.
40. Outbox inicia PENDING.
41. Delivery posterior no es barrera de seguridad.
42. Evento perdido no permite stale.
43. Se crea catálogo cerrado de eventos.
44. Se crea catálogo cerrado de event scopes.
45. Se captura source transaction id.
46. Se crea `app_private.get_context_freshness_token(text)`.
47. Solo acepta app code.
48. Es `STABLE`.
49. Es `SECURITY DEFINER` endurecida.
50. No tiene grant cliente.
51. No existe wrapper `api` para el token.
52. SHELL-CTX-006 deberá consumirlo por frontera server-only.
53. Se reutiliza resolución de principal y actor de 033.
54. No se crea segundo modelo de identidad.
55. Subject key es SHA-256 canónico.
56. Environment es explícito.
57. Se crea runtime identity privada.
58. Environment no viene del cliente.
59. Organization es explícita.
60. Organization no se deduce de app o sede.
61. Boundary usa tiempo de servidor.
62. Se crea helper temporal compartido.
63. Safety margin permanece un segundo.
64. Token cumple `ContextFreshnessToken@1.0.0`.
65. Dimensión no aplicable usa `NOT_APPLICABLE`.
66. Dimensión requerida ausente es error.
67. `issued_at` no participa en fingerprint.
68. Token fingerprint excluye delivery metadata.
69. Se reutiliza canonical JSON.
70. No se usa `jsonb::text` como contrato.
71. Backfill inicial usa generation 1.
72. No existe lazy initialization en read.
73. Backfill y triggers cierran carrera en migration.
74. Rebinding conserva generations.
75. Migraciones futuras deben declarar impacto de frescura.
76. 035 no cambia shape de AccessContext.
77. 035 no cambia shape de SafeContextProjection.
78. Token completo no cruza L2.
79. Cache status permanece NOT_IMPLEMENTED hasta cache real.
80. 034 no trata token como ALLOW.
81. 032 no usa generations como historia de decisión.
82. SHELL-CTX-006 conserva ownership de storage y single-flight.
83. Realtime es opcional.
84. NOTIFY es opcional.
85. RLS se habilita como defensa en profundidad.
86. Cero policies de cliente.
87. Cero grants cliente.
88. Data API no se modifica.
89. Service role no concede autoridad.
90. Security definer requiere search path fijo.
91. Segunda ejecución no resetea counters.
92. Drift compara registry, triggers y fuentes.
93. Drift de Auth bloquea L1.
94. Índices requieren evidencia de plan.
95. Outbox tiene retención controlada.
96. Logs no contienen PII ni secrets.
97. Fallo de token no usa token anterior.
98. Fallo de generation revierte writer.
99. Fallo de outbox delivery no revierte dato ya committed.
100. Double-read futuro queda soportado.
101. Boundary invalida sin escritura.
102. Recursos no fuerzan invalidación de contexto por defecto.
103. No existe decision cache.
104. Stale-while-revalidate está prohibido.
105. Modo inicial posterior a 035 es REQUEST_ONLY.
106. 035 no habilita SHADOW_SHARED.
107. 035 no habilita VALIDATED_SHARED.
108. Rollback posterior exige REQUEST_ONLY primero.
109. Restore exige reconciliación.
110. Toda materialización usa migrations/versioned scripts de vento-shell.
111. Se definen pruebas positivas, negativas, de concurrencia y seguridad.
112. No se crean ni modifican requisitos de prueba.
113. La aprobación documental no autoriza cambios físicos.
114. La siguiente tarea documental es AUTH-DB-034.

---

#### 116. Criterios de aceptación

`AUTH-DB-035` queda documentalmente completa cuando:

1. se fija la topología global;
2. se fija el gate PRE_E5;
3. se separa 035 de SHELL-CTX-006;
4. se fija `app_private` para generations;
5. se fija `audit` para outbox;
6. se define generation table;
7. se define PK;
8. se define scope vocabulary;
9. se define bigint transaccional;
10. se prohíben sequences;
11. se define formato SHA-256 del token;
12. se define session generation;
13. se prohíben triggers sobre Auth administrado;
14. se define actor generation;
15. se define employee generation;
16. se define base lane generation;
17. se define operational lane generation;
18. se define device generation;
19. se define app generation;
20. se define global generation;
21. se define binding registry;
22. se definen binding states;
23. se reconcilia source registry de 033;
24. se documenta AS-IS;
25. se define selección de fuente autoritativa;
26. se define scope mínimo seguro;
27. se define bump function;
28. se define seguridad del bump;
29. se define algoritmo transaccional;
30. se define concurrencia;
31. se define orden de locks;
32. se definen triggers por fuente;
33. se prohíbe trigger genérico heurístico;
34. se define outbox;
35. se define event catalog;
36. se define event scopes;
37. se define delivery lifecycle;
38. se define source transaction id;
39. se define token reader;
40. se define firma única `(text) → jsonb`;
41. se define seguridad del token reader;
42. se niega exposición Data API;
43. se reserva transporte a server-only;
44. se reutiliza actor resolver;
45. se define subject key;
46. se define runtime identity;
47. se define bootstrap por entorno;
48. se define organization source;
49. se define temporal boundary;
50. se define helper temporal compartido;
51. se mantiene safety margin;
52. se fija shape exacto del token;
53. se define NOT_APPLICABLE;
54. se define issued_at;
55. se define fingerprint preimage;
56. se reutiliza canonical JSON;
57. se define lectura de scopes;
58. se define comportamiento de generation faltante;
59. se define backfill;
60. se cierra carrera de backfill;
61. se define rebinding;
62. se define obligación para writers futuros;
63. se preserva contrato de 033;
64. se mantiene cache status;
65. se bloquea token en L2;
66. se preserva frontera de 034;
67. se preserva frontera de 032;
68. se preserva frontera de SHELL-CTX-006;
69. eventos quedan como optimización;
70. Realtime queda opcional;
71. se fijan RLS y ACL;
72. service role no crea bypass;
73. security definer queda endurecido;
74. se define idempotencia;
75. se define drift de bindings;
76. se define drift Auth;
77. se define política de índices;
78. se define retención del outbox;
79. se define privacidad de logs;
80. se define fallo del token;
81. se define fallo de writer;
82. se define fallo de delivery;
83. se definen carreras;
84. se soporta double-read;
85. se soporta boundary sin escritura;
86. se soportan denies temporales;
87. se separan recursos;
88. no se crea decision cache;
89. se prohíbe stale-while-revalidate;
90. se fija bootstrap REQUEST_ONLY;
91. se fijan puertas de shadow;
92. se fijan puertas de validated shared;
93. se define rollback pre-L1;
94. se define rollback post-L1;
95. se define restore;
96. se define reconciliación;
97. se define manifiesto físico;
98. se fijan dependencias físicas;
99. se fija orden de materialización;
100. se fija política de migrations;
101. se definen 105 pruebas físicas mínimas;
102. se declara cero cambio de requisitos;
103. se registra evidencia remota;
104. se reserva AUTH-DB-034 sin desarrollarla.

---

#### 117. Límites

`AUTH-DB-035` no:

- ejecuta migrations durante su desarrollo documental;
- crea tablas durante su desarrollo documental;
- crea triggers durante su desarrollo documental;
- modifica Supabase durante su desarrollo documental;
- modifica `auth.sessions`;
- modifica `auth.users`;
- crea cache L1;
- crea Redis;
- habilita SHADOW_SHARED;
- habilita VALIDATED_SHARED;
- cambia `AccessContext@1.0.0`;
- agrega token a SafeContextProjection;
- agrega permissions al contexto;
- evalúa un permiso;
- resuelve un recurso;
- produce AuthorizationDecision;
- persiste decisiones;
- implementa simulación;
- crea decision cache;
- migra consumidores;
- retira resolvers legacy;
- cambia Data API;
- expone `app_private`;
- concede grants a roles cliente;
- modifica 04A;
- autoriza `AUTH-DB-035::GLOBAL`;
- desarrolla `AUTH-DB-034`.

---

#### 118. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-DB-033 — Implementar get_access_context canónico, sus resolvers privados y su proyección segura`

**TAREA ACTUAL APROBADA**
`AUTH-DB-035 — Implementar token transaccional de frescura e invalidación del contexto`

**SIGUIENTE TAREA RESERVADA**
`AUTH-DB-034 — Implementar evaluate_authorization canónico, su núcleo de evaluación, resolvers de recurso y proyecciones seguras`


### ✅ AUTH-DB-034 — Implementar evaluate_authorization canónico, su núcleo de evaluación, resolvers de recurso y proyecciones seguras

**Estado:** APROBADA
**Tarea anterior:** AUTH-DB-035 — Implementar token transaccional de frescura e invalidación del contexto
**Tarea siguiente:** AUTH-DB-032 — Implementar persistencia canónica y vinculación de decisiones de autorización
**Tipo de tarea:** Documental
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/02_R1_FUNDACION_FISICA_CANONICA.md`
**Estado físico resultante:** Contrato de materialización del evaluador canónico `evaluate_authorization`, su núcleo privado, contratos runtime, resolvers de recurso, datasets de evaluación, predicado privado para RLS y proyección segura cerrado; futura instancia global `AUTH-DB-034::GLOBAL` pendiente de autorización explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`AUTH-DB-034` define el contrato físico único para materializar la evaluación real de autorización de Vento OS.

La futura instancia debe convertir:

```text
PRINCIPAL Y ACTOR REALES
+
AccessContext@1.0.0 FRESCO
+
APLICACIÓN EXACTA
+
PERMISO EXACTO
+
CONTRATO VERSIONADO DEL PERMISO
+
RECURSO EXACTO
+
TERRITORIO, ESTADO Y CAMPOS DEL RECURSO
+
DATASETS DE GRANTS, OVERRIDES Y DENIES
+
PRECEDENCIA CANÓNICA
=
AuthorizationDecision@1.0.0
```

El resultado final real continúa siendo exclusivamente:

```text
ALLOW
DENY
```

La tarea no crea una lista general de permisos.

La tarea no convierte un rol en autorización.

La tarea no usa `can_operate`.

La tarea no acepta desde el caller actor, empleado, rol, sede efectiva, área efectiva, turno, check-in, dispositivo efectivo, grants, denies ni resultado deseado.

---

#### 2. Resultado canónico

Queda definido el siguiente resultado:

```text
AUTH-DB-034
→ contrato documental único

AUTH-DB-034::GLOBAL
→ futura instancia física global reutilizable

app_private.evaluate_authorization(jsonb)
→ frontera SQL completa
→ AuthorizationDecision@1.0.0

app_private.evaluate_authorization_core(...)
→ núcleo privado reutilizable y recursivo

app_private.resolve_permission_contract_snapshot(...)
→ contrato exacto del permiso

app_private.resolve_authorization_resource(...)
→ resolución canónica de recurso

app_private.load_authorization_datasets(...)
→ datasets exactos y versionados

app_private.project_safe_authorization_decision(jsonb)
→ reducción segura

api.get_safe_authorization_decision(jsonb)
→ única proyección SQL general apta para authenticated

app_private.authorization_policy_allows(jsonb)
→ predicado privado de paridad para RLS
→ no conectado a policies por esta tarea documental
```

`AUTH-DB-034` produce la decisión.

`AUTH-DB-032` conserva la persistencia durable.

`AUTH-DB-021` conserva la adopción de RLS por esquema.

`AUTH-DB-006` a `AUTH-DB-010` conservan la adopción en RPC sensibles.

---

#### 3. Topología y gate

La clasificación canónica vigente es:

```text
task_id = AUTH-DB-034
mode = GLOBAL_ENABLE_ONCE
instance = AUTH-DB-034::GLOBAL
execution_gate = PRE_E5_FOUNDATION
canonical_work = DEFINE_CONTRACT_ONCE
```

Consecuencias:

1. existe como máximo una instancia física global;
2. no se crea una instancia por `package_id`;
3. puede materializarse antes de E5 una vez aprobado su contrato;
4. requiere dependencias técnicas satisfechas;
5. requiere autorización física explícita;
6. no constituye adopción vertical de NEXO, FOGO, ORIGO, PULSO, VISO, NUMERA, ANIMA, PASS o AURA;
7. no autoriza por sí sola migrar policies, RPC o consumidores;
8. la aprobación documental no autoriza `AUTH-DB-034::GLOBAL`.

---

#### 4. Fuentes vinculantes

La futura materialización consume y preserva:

- `ADR-AUTH-001`;
- `AUTH-CAT-001` a `AUTH-CAT-024`;
- `AUTH-RBAC-001` a `AUTH-RBAC-028`;
- `AUTH-CTX-001` a `AUTH-CTX-030`;
- `AuthorizationEvaluationRequest@1.0.0`;
- `AuthorizationDecision@1.0.0`;
- `AccessContext@1.0.0`;
- `vento.canonical-json@1.0.0`;
- `AUTH-DB-019`, para principal y vínculos;
- `AUTH-DB-033`, para `get_access_context`;
- `AUTH-DB-035`, para frescura e invalidación;
- `AUTH-DB-027`, para harness físico;
- `AUTH-DB-028`, para baseline y drift;
- `AUTH-DB-029`, para backup, restore y rollback;
- `AUTH-DB-016`, `AUTH-DB-017` y `AUTH-DB-018`, para schemas, exposición y separación privada;
- `SUPA-ARC-005`, `SUPA-ARC-006`, `SUPA-ARC-013`, `SUPA-ARC-014` y `SUPA-ARC-015`;
- el catálogo compartido vigente de aplicaciones, permisos, roles, scopes y reason codes;
- los contratos de recurso vigentes.

---

#### 5. Precedencia

La precedencia física y contractual es:

```text
CONTRATOS AUTH
→ significado

@vento/contracts
→ identidades y artefactos estáticos materializados disponibles

AUTH-DB-019
→ principal y vínculos

AUTH-DB-033
→ contexto

AUTH-DB-035
→ frescura

AUTH-DB-034
→ decisión

AUTH-DB-032
→ persistencia

AUTH-DB-006..010 / AUTH-DB-021
→ adopción por RPC y RLS

AUTH-DB-030
→ retiro legacy
```

Una tabla legacy, función legacy o policy actual no puede redefinir esta precedencia.

---

#### 6. Estado contractual físico observado en `vento-shell`

La auditoría del remoto vigente identifica:

```text
AppCode activos = 10
PermissionKey activos = 140
ScopeCode = 13
AuthorizationReasonCode = 20
StructuralIssueCode = 100
LaneAvailabilityReasonCode = 10
LaneReasonCode = 110
```

Estos números describen el corte físico observado.

No se congelan como cardinalidad eterna.

La futura instancia deberá comprobar el universo exacto de la versión contractual activa al momento de materializarse.

---

#### 7. Reconciliación con contratos históricos

Parte de la documentación histórica de recurso se redactó cuando el catálogo tenía una cardinalidad menor.

Regla:

```text
MATRIZ HISTÓRICA
≠ UNIVERSO FÍSICO ACTUAL
```

La futura instancia no puede:

- asumir que 112 sigue siendo el número vigente;
- ignorar permisos añadidos después;
- fabricar contratos faltantes;
- aplicar el contrato de otro permiso por similitud;
- convertir una identidad de permiso sin metadata completa en un permiso evaluable.

Debe cumplirse:

```text
PERMISOS ACTIVOS DE LA RELEASE
=
PERMISOS CON PermissionContractSnapshot VÁLIDO
```

antes de certificar el evaluador para esa release.

---

#### 8. Estado actual de `AuthorizationDecision` compartida

La materialización actual de la familia de response contracts ya contiene:

- `ContractMetadata`;
- `AccessContextV1`;
- `SimulationContextV1`;
- `SimulatedAuthorizationDecisionV1`.

La instancia física observada de `SHELL-CON-007::GLOBAL` dejó expresamente fuera el `AuthorizationDecisionV1` completo.

Consecuencias:

1. `AUTH-DB-034` no modifica `@vento/contracts`;
2. no inventa una segunda definición TypeScript;
3. la salida SQL se deriva de la fuente canónica documental;
4. cuando exista una proyección estática completa, deberá demostrar paridad exacta;
5. la ausencia temporal del tipo TypeScript no permite alterar el shape SQL;
6. adopción y tipos se coordinan con las tareas propietarias existentes.

---

#### 9. Estado remoto Supabase observado

La auditoría read-only del proyecto:

```text
vento-os-dev
status = ACTIVE_HEALTHY
PostgreSQL = 17.6.1.054
```

no encontró una función canónica denominada:

```text
evaluate_authorization
```

ni objetos de runtime canónico de decisión o resource contract con esa responsabilidad.

Por tanto, esta tarea no adopta un evaluador físico existente como canonical.

---

#### 10. Evaluadores legacy observados

Persisten:

```text
public.has_permission(text, uuid, uuid)
public.has_operational_permission(text, uuid, uuid, text)
public.has_effective_permission_v1(text, text)
```

También persisten:

```text
public.get_operational_context(...)
public.get_effective_context_v1(...)
```

Estos objetos son antecedentes técnicos.

No son fuente normativa de `AuthorizationDecision@1.0.0`.

---

#### 11. Riesgos observados en `public.has_permission`

`public.has_permission` observado:

```text
STABLE
SECURITY DEFINER
search_path = public
```

y conserva `EXECUTE` para:

```text
PUBLIC
authenticated
service_role
```

Su semántica actual:

- deriva empleado mediante `auth.uid()` como si fuera ID empresarial;
- utiliza `public.employees.role`;
- consulta `public.app_permissions`;
- recibe site y area;
- usa `current_employee_site_id()` como fallback;
- evalúa overrides y role permissions;
- retorna booleano;
- no resuelve recurso canónico;
- no produce evidencia canónica completa.

Ninguna de esas características se hereda automáticamente.

---

#### 12. Riesgos observados en `has_operational_permission`

La función actual:

```text
STABLE
SECURITY DEFINER
search_path = public
```

y:

- llama `get_operational_context`;
- acepta site y area;
- permite `bypass_applied`;
- depende de `can_operate`;
- consulta `operational_role_permissions`;
- retorna booleano.

La futura evaluación elimina:

```text
bypass_applied
can_operate
caller site as effective site
caller area as effective area
```

como fuentes de autoridad.

---

#### 13. Riesgos observados en `has_effective_permission_v1`

La función actual:

```text
STABLE
SECURITY DEFINER
search_path = public, auth
```

mezcla:

- contexto real;
- simulación;
- dispositivo compartido;
- rol administrativo;
- rol operativo;
- `can_operate`.

El evaluador canónico real no reutiliza esta función como núcleo.

---

#### 14. Dependencia legacy en RLS

La auditoría actual encontró:

```text
policies que referencian has_permission = 181
tablas distintas afectadas = 88
```

También existe una cantidad material de policies con helpers de bypass administrativo legacy.

Estas cifras son AS-IS.

No son target.

Consecuencia:

```text
CREAR AUTH-DB-034
≠
REESCRIBIR AUTOMÁTICAMENTE 181 POLICIES
```

La adopción pertenece a `AUTH-DB-021` y paquetes posteriores.

---

#### 15. Decisión principal de arquitectura

Se separan cuatro fronteras:

```text
ISSUER
→ crea identidad temporal de decisión
→ obtiene contexto real
→ invoca núcleo

CORE
→ evalúa determinísticamente
→ no persiste
→ no tiene side effects empresariales

SAFE PROJECTION
→ reduce evidencia
→ apta para presentación

POLICY PROJECTION
→ booleano privado
→ únicamente para RLS certificado
```

No se crea un único helper booleano que sustituya todas esas fronteras.

---

#### 16. Identidad física del evaluador completo

Se congela:

```text
app_private.evaluate_authorization(jsonb) → jsonb
```

Firma:

```sql
app_private.evaluate_authorization(
  p_evaluation_request jsonb
)
returns jsonb
```

Es la única firma general completa.

No se crean overloads que acepten hechos autoritativos.

---

#### 17. Único argumento público de la frontera completa

El único argumento es:

```text
p_evaluation_request jsonb
```

Debe representar:

```text
AuthorizationEvaluationRequest@1.0.0
```

No se acepta:

```text
evaluate_authorization(text, text)
evaluate_authorization(text, uuid)
evaluate_authorization(jsonb, uuid)
evaluate_authorization(jsonb, text, uuid)
```

como interfaces generales equivalentes.

---

#### 18. Volatilidad del issuer

`app_private.evaluate_authorization(jsonb)` será:

```text
VOLATILE
SECURITY DEFINER
```

`VOLATILE` se utiliza porque el issuer:

- genera `decision_id`;
- captura `decided_at`;
- emite una instancia nueva de decisión.

No implica efectos empresariales.

La función no inserta la decisión durablemente.

---

#### 19. Seguridad del issuer

El evaluador completo utiliza:

```text
search_path = pg_catalog, app_private
```

y nombres totalmente calificados para:

- `auth`;
- schemas propietarios;
- `audit` cuando solo lea metadata autorizada;
- funciones auxiliares.

Reglas:

1. owner técnico no interactivo;
2. `PUBLIC EXECUTE` revocado;
3. `anon` sin execute;
4. `authenticated` sin execute directo;
5. cero SQL dinámico derivado del caller;
6. cero nombres de tabla derivados del caller;
7. cero nombres de función derivados del caller;
8. cero bypass por `service_role`;
9. poisoning test obligatorio;
10. homonym test obligatorio.

---

#### 20. Núcleo privado

Se define conceptualmente:

```text
app_private.evaluate_authorization_core(
  jsonb,
  jsonb,
  uuid,
  timestamptz,
  text[],
  integer
) → jsonb
```

Semántica de argumentos internos:

```text
request validado
AccessContext exacto
decision_id
decided_at
dependency_stack
dependency_depth
```

No es una API de aplicación.

---

#### 21. Propiedades del núcleo

El núcleo:

- no genera otro `decision_id`;
- no captura otro `decided_at`;
- no vuelve a resolver contexto principal;
- no persiste;
- no envía eventos;
- no ejecuta mutaciones empresariales;
- no altera sesiones;
- no altera caché;
- no usa frontend state;
- no consulta simulación.

Las dependencias recursivas utilizan este mismo núcleo.

---

#### 22. Helpers privados mínimos

La futura instancia puede materializar, bajo las identidades exactas gobernadas por esta tarea:

```text
app_private.validate_authorization_evaluation_request(jsonb)
app_private.resolve_permission_contract_snapshot(text, text)
app_private.resolve_authorization_resource(text, jsonb, text, text[])
app_private.load_authorization_datasets(jsonb, jsonb, jsonb)
app_private.evaluate_authorization_core(jsonb, jsonb, uuid, timestamptz, text[], integer)
app_private.project_safe_authorization_decision(jsonb)
app_private.authorization_policy_allows(jsonb)
app_private.canonicalize_authorization_payload(jsonb)
```

Todos permanecen privados.

---

#### 23. Seguridad de helpers

Regla por defecto:

```text
SECURITY INVOKER
```

excepto donde una lectura controlada requiera explícitamente una frontera privilegiada.

Toda excepción `SECURITY DEFINER` debe:

- tener motivo documental;
- tener owner controlado;
- fijar `search_path`;
- revocar `PUBLIC`;
- no recibir grants cliente;
- demostrar que no amplía autoridad.

No se utiliza `SECURITY DEFINER` como corrección genérica de permisos.

---

#### 24. Envelope de entrada

La entrada exige:

```text
contract_family
contract_family_version
contract_name
contract_version
schema_version
correlation_id
request
```

Valores contractuales:

```text
contract_family = vento.authorization.request-contracts
contract_family_version = 1.0.0
contract_name = AuthorizationEvaluationRequest
contract_version = 1.0.0
schema_version = 1.0.0
```

`correlation_id` debe existir y puede ser `null` cuando el contrato lo permita.

---

#### 25. Request interno

`request` contiene exactamente las dimensiones autorizadas:

```text
app_code
permission_key
operation_kind
resource_request
requested_fields
request_source
```

No contiene hechos efectivos del actor.

---

#### 26. `operation_kind`

Se preserva el vocabulario:

```text
READ
CREATE
UPDATE
DELETE
EXECUTE
TRANSITION
EXPORT
APP_ACCESS
```

Un valor desconocido invalida el request.

No se normaliza silenciosamente.

---

#### 27. `request_source`

Se preserva:

```text
SERVER_ACTION
RPC
RLS
API
UI_GUARD
JOB
```

`request_source` describe procedencia.

No concede autoridad.

No modifica precedencia.

No puede convertir un `DENY` en `ALLOW`.

---

#### 28. Datos prohibidos en input

El caller no declara:

```text
context_id
AccessContext
principal_id
actor_id
employee_id
base_role
operational_role
effective_site_id
effective_area_id
shift_id
checkin_id
device_id efectivo
authorization_requirement
grants
allows
denies
decision_id
outcome
catalog_hash
dataset_hashes
```

Tampoco:

```text
expected_outcome
allow
can_operate
bypass
force_allow
ignore_denies
skip_resource_resolution
skip_prerequisites
```

Cualquier equivalente semántico queda prohibido.

---

#### 29. Validación de forma

La validación distingue:

```text
JSON mal formado
envelope incompatible
request incompatible
estado empresarial denegado
fallo técnico
```

No convierte todos los casos en la misma categoría.

Un argumento estructuralmente inválido utiliza error SQL controlado de argumento inválido.

No retorna `null`.

---

#### 30. Aplicación exacta

`app_code`:

- es obligatorio;
- no tiene default;
- debe corresponder al catálogo activo;
- debe coincidir con el permiso;
- no se deriva mediante `split_part(permission_key)` como autoridad;
- no se corrige silenciosamente;
- no admite alias no publicados.

Una contradicción app-permission produce `DENY` contractual.

---

#### 31. Permiso exacto

`permission_key`:

- es obligatorio;
- utiliza la identidad canónica activa;
- no acepta prefijo parcial;
- no acepta wildcard;
- no acepta alias legacy salvo contrato explícito de transición;
- no se construye desde una ruta;
- no se construye desde nombre de componente;
- no se construye desde rol.

Un permiso ausente del catálogo produce razón segura equivalente a permiso no registrado.

---

#### 32. Snapshot de contrato del permiso

Se materializa un `PermissionContractSnapshot` exacto para la evaluación.

Debe conservar:

```text
catalog_version
catalog_hash
app_code
permission_key
status
authorization_modality
admitted_scopes
authorization_requirement
area_requirement
device_policy
sensitivity
simulation_policy
resource_contract_id
dependency_permissions
contract_fingerprint
```

La terminología física podrá mapear nombres de columnas sin alterar estos significados.

---

#### 33. Runtime projection del catálogo

El evaluador no depende de leer archivos npm durante una transacción SQL.

Se define una proyección técnica privada, versionada e inmutable:

```text
app_private.authorization_contract_releases
app_private.authorization_permission_contracts
```

Estas tablas son proyecciones runtime del contrato estático.

No son una segunda autoridad editable.

---

#### 34. `authorization_contract_releases`

Representa releases instaladas.

Campos mínimos:

```text
catalog_version
authorization_contract_version
schema_version
manifest_sha256
permission_count
resource_contract_count
contract_source_sha256
installed_at
activated_at
retired_at
status
```

Estados mínimos:

```text
INSTALLED
ACTIVE
SUPERSEDED
BLOCKED
```

Debe existir exactamente una release `ACTIVE` por organización y runtime aplicables.

---

#### 35. `authorization_permission_contracts`

Clave lógica mínima:

```text
catalog_version
+
permission_key
```

Conserva:

```text
app_code
permission_key
status
contract_snapshot
contract_fingerprint
resource_contract_id
source_manifest_sha256
```

`contract_snapshot` es inmutable para una versión publicada.

No se edita manualmente para corregir un permiso.

Una corrección produce nueva release contractual.

---

#### 36. Integridad del catálogo runtime

Antes de activar una release:

```text
permission_count declarado
=
filas válidas

PermissionKey activos
=
PermissionContractSnapshot activos

duplicados = 0
faltantes = 0
fingerprints inválidos = 0
resource_contract_id sin resolver = 0
```

Una diferencia bloquea activación.

---

#### 37. Cardinalidad vigente frente a ejecución futura

El corte auditado contiene 140 PermissionKey activos.

La migration futura no debe hardcodear:

```text
140 = cardinalidad eterna
```

Debe instalar la release exacta incluida en el commit autorizado.

La evidencia registra la cardinalidad observada de esa release.

---

#### 38. Resolución única del permiso

Para:

```text
app_code
permission_key
catalog_version
```

debe existir exactamente un contrato activo.

Resultados:

```text
0 coincidencias
→ DENY / contrato no registrado

1 coincidencia
→ continuar

más de 1
→ CONTRACT_INVALID / DENY
```

No se elige la primera fila.

---

#### 39. Fingerprint del contrato de permiso

Formato:

```text
sha256:
+
64 hex minúsculos
```

La preimagen incluye únicamente el snapshot contractual canonicalizado.

No incluye:

- timestamps de instalación;
- ID de fila;
- correlation id;
- métricas;
- metadata de delivery.

---

#### 40. AccessContext único

El issuer obtiene exactamente un contexto mediante:

```text
app_private.get_access_context(request.app_code)
```

para la decisión principal.

No reconstruye el contexto desde tablas.

No llama resolvers legacy.

No acepta contexto del caller.

---

#### 41. Relación con frescura

La evaluación real no puede tratar un contexto stale como válido.

Cuando `AUTH-DB-035::GLOBAL` esté activo:

```text
contexto servido desde L1
→ freshness ya validada por la frontera correspondiente
```

y:

```text
contexto resuelto fresco
→ se usa directamente
```

Un token válido no equivale a `ALLOW`.

---

#### 42. Context fingerprint

La decisión conserva referencia al:

```text
context_id
context_fingerprint
```

El evaluator no recalcula los hechos empresariales.

Puede validar integridad y versión.

No usa el fingerprint como bearer token.

---

#### 43. `AccessContextReference`

La referencia conserva:

```text
context_id
context_contract_version
resolved_at
actor_type
actor_id
principal_type
principal_id
context_fingerprint
```

No copia el `AccessContext` completo dentro de cada referencia pública.

La decisión completa sí puede conservar evidencia necesaria de forma controlada según su contrato.

---

#### 44. Identidad de decisión

`decision_id`:

- se genera en servidor;
- es opaco;
- es único por decisión nueva;
- no deriva de usuario;
- no deriva de recurso;
- no deriva de permiso;
- no concede autoridad;
- no es bearer token.

La persistencia posterior no cambia su identidad.

---

#### 45. Instante de decisión

`decided_at`:

- se captura una sola vez;
- utiliza UTC;
- procede del servidor/base de datos;
- se comparte por toda la evaluación principal y dependencias internas de esa decisión;
- no se obtiene desde el cliente.

---

#### 46. Snapshot transaccional

La decisión principal debe usar un snapshot coherente.

Regla:

```text
context
permission contract
resource
datasets
denies
dependencies
→ mismo marco de evaluación
```

No se combinan lecturas provenientes de instantes incompatibles para crear un `ALLOW`.

---

#### 47. Registro de resolvers de recurso

Se crea:

```text
app_private.authorization_resource_resolver_registry
```

Es un registro técnico.

No contiene autoridad empresarial.

Campos mínimos:

```text
resource_contract_id
resolver_key
resolver_version
resource_type
allowed_request_modes
owner_domain
source_contract_version
source_contract_fingerprint
resolver_shape_fingerprint
status
created_at
updated_at
```

---

#### 48. Estados del resolver registry

Se permiten:

```text
ACTIVE
SUPERSEDED
BLOCKED
```

Solo `ACTIVE` puede participar en una decisión real.

`BLOCKED` produce fail closed.

`SUPERSEDED` conserva historia de instalación pero no se selecciona para una release nueva.

---

#### 49. Prohibición de despacho dinámico inseguro

El registry no almacena un nombre de función controlable por cliente para ejecutarlo dinámicamente.

Regla:

```text
resource_contract_id
→ resolver_key cerrado
→ dispatch estático privado
```

No:

```text
caller text
→ format()
→ EXECUTE función arbitraria
```

El evaluator no construye SQL dinámico desde input.

---

#### 50. Resolver general de recurso

Se congela:

```text
app_private.resolve_authorization_resource(
  text,
  jsonb,
  text,
  text[]
) → jsonb
```

Semántica:

```text
resource_contract_id
resource_request
operation_kind
requested_fields
```

La función selecciona un dispatch privado cerrado.

---

#### 51. Modos de recurso

Se preservan:

```text
EXISTING_RESOURCE
RESOURCE_DRAFT
COLLECTION
AGGREGATE
BULK
NON_RESOURCE
```

La representación física debe distinguirlos sin inferencia.

Un shape de un modo no se interpreta como otro.

---

#### 52. Recurso existente

El caller suministra un localizador permitido.

El resolver:

1. valida forma;
2. localiza el recurso del lado servidor;
3. carga versión;
4. carga estado;
5. carga territorio;
6. carga sujetos y relaciones;
7. carga lados requeridos;
8. carga ownership;
9. calcula fingerprint;
10. valida campos solicitados.

El objeto enviado por cliente nunca sustituye la lectura autoritativa.

---

#### 53. Resource draft

En `CREATE`:

```text
draft
→ normalizar
→ resolver padres y relaciones
→ resolver territorio propuesto
→ validar estado inicial
→ validar campos
→ fingerprint
→ decisión
```

El draft no se persiste durante la evaluación.

La ejecución ocurre después y deberá revalidar.

---

#### 54. Colección

Una colección autorizable:

- se construye en servidor;
- no empieza como lectura global filtrada únicamente en cliente;
- conserva criterio de pertenencia;
- conserva territorio;
- conserva filtros efectivos;
- evita enumeración de miembros no autorizados.

El request del cliente puede reducir.

Nunca ampliar.

---

#### 55. Agregado

Un agregado solo incluye miembros cuya contribución esté permitida por el contrato.

No se autoriza:

```text
SELECT todo
→ ocultar filas después
→ devolver SUM/COUNT de todo
```

si el agregado permite inferir miembros excluidos.

---

#### 56. Bulk

Una solicitud bulk exige:

```text
permiso masivo explícito
```

o:

```text
decisión por recurso
```

La política de atomicidad debe ser explícita:

```text
ALL_OR_NOTHING
PARTIAL_WITH_RESULTS
```

No se elige por conveniencia.

---

#### 57. `NON_RESOURCE`

Solo se admite cuando el contrato del permiso declara legítimamente ausencia de recurso.

Ejemplo conceptual:

```text
APP_ACCESS
```

No se utiliza como fallback cuando falla un resolver.

---

#### 58. Estados de resolución de recurso

Se preservan:

```text
RESOLVED
MULTI_RESOLVED
NOT_APPLICABLE
UNRESOLVED
CONFLICT
ISOLATED
```

Semántica:

- `UNRESOLVED` no obtiene sede de fallback;
- `CONFLICT` deniega;
- `ISOLATED` deniega;
- `NOT_APPLICABLE` solo es válido cuando el contrato lo permite.

---

#### 59. Territory snapshot

El recurso puede resolver:

```text
organization
business units
sites
areas
site types
area kinds
origin
destination
routes
vehicles
isolated boundaries
historical territory
```

Solo incluye dimensiones aplicables.

`null` no significa organización.

Array vacío no significa todos.

---

#### 60. Resource fingerprint

Toda resolución produce fingerprint determinista del snapshot materialmente utilizado.

Formato:

```text
sha256:
+
64 hex
```

Incluye:

- identidad de contrato;
- localizador normalizado;
- versión;
- estado;
- territorio;
- ownership;
- sujetos;
- lados;
- campos relevantes.

No incluye secretos.

---

#### 61. Estado del recurso

Las mutaciones validan estado y transición.

No se autoriza únicamente porque el actor tenga un grant.

Regla:

```text
permiso
+
recurso
+
estado permitido
=
todavía sujeto a todos los demás controles
```

Un state mismatch produce `DENY`.

---

#### 62. Concurrencia

Cuando el contrato exige versión:

```text
expected version
=
resource current version
```

debe validarse.

Una versión anterior no puede utilizarse para autorizar una mutación posterior.

La ejecución deberá usar lock, condición optimista o mecanismo equivalente del dominio.

---

#### 63. Idempotencia

Una idempotency key:

- evita duplicación;
- no concede permiso;
- no permite saltar evaluación;
- no sustituye resource version;
- no convierte un request anterior en autoridad.

La misma clave con payload incompatible falla cerrada.

---

#### 64. Cambio de territorio

Una mutación que cambia territorio debe evaluar:

```text
territorio actual
+
territorio propuesto
```

según el contrato.

No basta autoridad sobre el destino.

No basta autoridad sobre el origen.

---

#### 65. Política de campos

El contrato distingue:

- campos visibles;
- campos ocultos;
- campos enmascarados;
- campos mutables;
- campos de solo lectura;
- campos sensibles;
- campos que exigen permiso adicional.

Autorizar el recurso no autoriza todos sus campos.

---

#### 66. Requested fields

`requested_fields`:

- se normaliza contra el contrato;
- no acepta nombres arbitrarios fuera de schema;
- no produce acceso implícito;
- puede reducir la proyección;
- no puede ampliar la política.

Para `READ` puede existir resultado de campo parcial.

Para mutaciones, un campo no autorizado no se elimina silenciosamente.

---

#### 67. Registro de datasets

Se crea:

```text
app_private.authorization_dataset_source_registry
```

Finalidad:

> declarar qué fuente física produce cada dataset requerido por el núcleo y detectar drift sin convertir nombres de tablas en input ejecutable.

Campos mínimos:

```text
dataset_key
dataset_version
source_owner
source_schema
source_relation
source_contract
source_shape_fingerprint
fingerprint_strategy
status
created_at
updated_at
```

---

#### 68. Registry de datasets no ejecuta SQL dinámico

El registry es evidencia y control de drift.

Los loaders contienen consultas estáticas y calificadas.

No se ejecuta:

```text
SELECT FROM registry.source_relation
```

mediante SQL construido dinámicamente.

Un cambio de fuente exige migration forward.

---

#### 69. Familias de datasets

El evaluador puede requerir, según contrato:

```text
permission_catalog
base_grants
operational_grants
individual_overrides
actor_wide_denies
base_lane_denies
operational_lane_denies
device_policy
sensitivity_policy
resource_contracts
dependency_graph
field_policy
scope_catalog
territory_catalogs
```

Solo se carga lo aplicable.

---

#### 70. Versionado de datasets

Cada dataset materialmente consultado debe declarar:

```text
dataset_key
dataset_version
dataset_fingerprint
```

No se usan:

```text
latest
current
unknown
main
```

como versión contractual.

Una versión obligatoria no identificable bloquea la decisión.

---

#### 71. Dataset con cero matches

Cero grants coincidentes sigue siendo un resultado válido del dataset:

```text
dataset identificado
versionado
fingerprinted
matches = []
```

No se interpreta como dataset inexistente.

Resultado de autorización:

```text
sin allow aplicable
→ DEFAULT_DENY
```

---

#### 72. Dataset no aplicable

Si un dataset no aplica al permiso:

- no se consulta;
- no se inventa una versión `null`;
- no se fabrica un hash vacío;
- su ausencia no se convierte en error.

La evidencia distingue:

```text
NOT_APPLICABLE
```

de:

```text
REQUIRED_BUT_MISSING
```

---

#### 73. Snapshot de grants base

Los grants base deben provenir de:

- rol base canónico;
- overrides individuales autorizados;
- alcance válido;
- vigencia;
- permiso exacto;
- fuente versionada.

No se deriva allow de nombre de rol.

---

#### 74. Snapshot de grants operativos

Los grants operativos deben provenir de:

- rol operativo válido del turno;
- dataset operativo;
- sede y área operativas;
- alcance;
- permiso exacto;
- vigencia.

No se utiliza `navigation_role`.

No se utiliza role override legacy.

---

#### 75. Overrides individuales

Un override:

- es explícito;
- tiene efecto;
- tiene scope;
- tiene vigencia;
- tiene fuente;
- tiene identidad;
- puede conceder o negar según contrato.

No se convierte en bypass general.

---

#### 76. Denies

Toda denegación aplicable conserva:

- identidad;
- efecto;
- lane;
- scope;
- vigencia;
- fuente;
- motivo seguro;
- evidencia necesaria.

No se elimina porque exista un allow.

---

#### 77. Precedencia exacta

Se congela:

```text
STRUCTURAL_DENY
>
ACTOR_WIDE_DENY
>
LANE_DENY
>
ALLOW
>
DEFAULT_DENY
```

No existe:

```text
ALLOW OR bypass
```

No existe:

```text
owner wins
```

No existe:

```text
manager wins
```

No existe:

```text
operational wins
```

fuera del contrato.

---

#### 78. Structural deny

Un problema estructural con severidad bloqueante se aplica antes de grants.

Ejemplos de fuentes:

- contexto inválido;
- principal incompatible;
- actor unresolved;
- contrato incompatible;
- recurso conflictivo;
- dataset requerido inválido.

El reason code proviene de catálogos aprobados.

---

#### 79. Actor-wide deny

Una denegación aplicable a todo el actor vence allows.

Se evalúa antes de la lane.

No puede ser omitida por:

- app;
- rol;
- dispositivo;
- resource owner;
- service role.

---

#### 80. Lane deny

Una denegación de carril vence los allows de ese carril.

No necesariamente invalida un carril distinto cuando la modalidad permite OR y el deny no es global.

La combinación aplica la modalidad exacta.

---

#### 81. Default deny

Si no existe un allow suficiente después de todas las validaciones:

```text
DENY
```

No se utiliza ausencia de deny como allow.

---

#### 82. Modalidades de autorización

Se preservan:

```text
BASE_ONLY
OPERATIONAL_ONLY
BASE_OR_OPERATIONAL
BASE_AND_OPERATIONAL
```

Mapping:

```text
BASE_ONLY
→ BASE requerido

OPERATIONAL_ONLY
→ OPERATIONAL requerido

BASE_OR_OPERATIONAL
→ ambos evaluables
→ uno válido puede satisfacer combinación si no existe deny prevalente aplicable

BASE_AND_OPERATIONAL
→ ambos requeridos
```

---

#### 83. Lane no admitida

Una lane no admitida produce:

```text
evaluated = false
outcome = NOT_APPLICABLE
matched_allows = []
matched_denies = []
```

No produce un `DENY` artificial que altere otra lane.

---

#### 84. Base lane

La base lane utiliza:

- actor real;
- empleado cuando aplique;
- rol base;
- asignaciones;
- cobertura administrativa;
- scope;
- recurso;
- grants;
- overrides;
- denies.

No toma prestados:

- turno;
- check-in;
- rol operativo.

---

#### 85. Operational lane

La lane operativa utiliza:

- empleado;
- turno válido;
- check-in cuando el permiso lo exige;
- rol operativo;
- sede operativa;
- área operativa cuando aplique;
- grants operativos;
- overrides;
- denies;
- recurso.

No utiliza sede seleccionada.

---

#### 86. Prerrequisitos

Se preservan las modalidades contractuales:

```text
N
T
T+C
```

Semántica:

```text
N
→ no exige turno por ese contrato

T
→ exige turno válido

T+C
→ exige turno válido + check-in válido
```

El check-in nunca sustituye el turno.

---

#### 87. Check-in incompatible

Un check-in activo pero incompatible con:

- actor;
- shift;
- site;
- area;
- temporalidad;

no satisface el prerrequisito.

No se usa “último check-in abierto” como autoridad.

---

#### 88. Área operativa

Cuando el permiso exige área:

```text
operational_area válida
+
compatible con rol
+
compatible con shift
+
compatible con resource
```

debe existir.

Un área enviada por frontend no rellena la ausencia.

---

#### 89. Dispositivo

La política de dispositivo funciona por intersección.

```text
AUTORIDAD HUMANA
∩
RESTRICCIÓN DEL DISPOSITIVO
```

El dispositivo puede reducir.

No puede ampliar.

---

#### 90. Shared device

En dispositivo compartido:

- principal de dispositivo permanece separado;
- actor humano procede de actor session;
- el actor real conserva sus lanes;
- cambiar actor exige nuevo contexto;
- la allowlist del dispositivo restringe app/permiso;
- no existe rol propio del dispositivo.

Sin actor válido:

```text
DENY
```

para acciones laborales reales que exijan actor humano.

---

#### 91. Sensibilidad

El contrato puede exigir:

- reautenticación;
- AAL/MFA;
- motivo;
- aprobación;
- separación de funciones;
- dispositivo compatible;
- controles reforzados.

Cumplir sensibilidad no crea permiso.

Fallar sensibilidad bloquea.

---

#### 92. Separación de funciones

Cuando el contrato exige separación:

- requester y approver se resuelven desde hechos autoritativos;
- el actor no puede aprobarse a sí mismo si está prohibido;
- un rol amplio no elimina la regla;
- service role no elimina la regla.

---

#### 93. Dependencias entre permisos

Las dependencias se evalúan desde el mismo:

```text
actor
context
decided_at
catalog version
```

La dependencia utiliza un nuevo request interno.

No reingresa por el issuer general.

---

#### 94. Grafo de dependencias

Se exige:

```text
acyclic
```

y:

```text
MAX_DEPENDENCY_DEPTH = 32
```

El stack registra PermissionKey ya visitados.

Ciclo:

```text
CONTRACT_INVALID
→ DENY
```

Profundidad excedida:

```text
CONTRACT_INVALID
→ DENY
```

---

#### 95. Dependencia no heredable

Un `ALLOW` sobre permiso A no se convierte en allow sobre permiso B salvo que B sea dependencia contractual explícita y se evalúe B.

No existen jerarquías implícitas por prefijo.

---

#### 96. Combinación

El objeto `combination` registra:

- modalidad;
- lanes requeridas;
- lane results;
- reglas aplicadas;
- resultado antes de restricciones finales.

No oculta denies.

No sustituye `final_decision`.

---

#### 97. Restricciones posteriores a lanes

Aun cuando la combinación de lanes sea positiva, el resultado puede ser `DENY` por:

- resource invalid;
- state mismatch;
- dependency fail;
- device restriction;
- sensitivity fail;
- field policy;
- concurrency fail;
- idempotency conflict;
- structural deny prevalente.

---

#### 98. Resultado final

`final_decision` solo admite:

```text
ALLOW
DENY
```

No se serializa:

```text
UNKNOWN
PARTIAL_ALLOW
SOFT_ALLOW
ALLOW_WITH_WARNING
```

como outcome final real.

La visibilidad parcial se expresa en field policy, no cambiando el outcome final contractual de la operación evaluada.

---

#### 99. Matched allows

Cada allow materializado debe conservar evidencia suficiente para demostrar:

- permiso exacto;
- lane;
- source;
- subject o role aplicable;
- scope;
- territory match;
- resource relation;
- vigencia.

No se retorna una fila de allow por existir un rol sin scope válido.

---

#### 100. Matched denies

Cada deny materializado conserva:

- deny identity;
- lane;
- source;
- scope;
- vigencia;
- match reason.

La safe projection no expone esta evidencia completa.

---

#### 101. Blocked reasons

`blocked_reasons`:

- contiene todas las razones aplicables;
- usa catálogo aprobado;
- evita texto SQL libre;
- no revela nombres de tablas;
- no revela datos de terceros;
- tiene orden determinista.

No se devuelve solo “el primer error” si existen varias razones relevantes.

---

#### 102. Reason codes físicos

La implementación consume el vocabulario compartido vigente.

En el corte actual incluye 20 `AuthorizationReasonCode` canónicos y los reason codes estructurales ya materializados.

Reglas:

1. no se inventa un reason code local si existe uno canónico;
2. un código nuevo requiere la tarea contractual propietaria;
3. la proyección segura utiliza únicamente códigos permitidos;
4. el texto visible procede del catálogo de mensajes, no del exception message.

---

#### 103. Auditoría dentro de la decisión

`AuthorizationDecision.audit` contiene evidencia contractual suficiente para:

- reproducir el porqué;
- identificar versiones;
- identificar contexto;
- identificar recurso;
- identificar datasets;
- identificar combinación;
- identificar restricciones;
- vincular decisión posterior.

No persiste por sí solo.

---

#### 104. Persistencia separada

`AUTH-DB-034`:

```text
CONSTRUYE DECISIÓN
```

`AUTH-DB-032`:

```text
PERSISTE Y VINCULA
```

034 no inserta filas durables de decisiones.

Esto evita que una función de lectura/evaluación tenga efectos empresariales ocultos.

---

#### 105. Canonicalización de payloads

Se define:

```text
app_private.canonicalize_authorization_payload(jsonb)
```

que implementa:

```text
vento.canonical-json@1.0.0
```

para preimágenes de 034.

No cambia la política ya utilizada por 033.

No considera `jsonb::text` suficiente.

---

#### 106. Fingerprints internos

La evaluación puede utilizar internamente:

```text
request_fingerprint
permission_contract_fingerprint
resource_fingerprint
dataset_fingerprints
context_fingerprint
```

Cada uno tiene preimagen separada.

No se reutiliza un hash de un objeto para representar otro.

---

#### 107. Request fingerprint

Excluye:

```text
correlation_id
timestamps de delivery
```

Incluye la semántica exacta de:

```text
app
permission
operation
resource request
requested fields
request source cuando sea semánticamente relevante
contract versions
```

No se convierte en decision ID.

---

#### 108. Decision identity frente a fingerprint

```text
decision_id
→ identidad de instancia

fingerprints
→ identidad semántica/evidencia
```

Dos decisiones nuevas pueden tener:

```text
decision_id distinto
```

aunque hechos y resultado sean semánticamente iguales.

---

#### 109. Forma raíz de `AuthorizationDecision@1.0.0`

La salida completa conserva:

```text
contract_family
contract_family_version
contract_name
contract_version
schema_version
decision_id
decided_at
correlation_id
access_context_ref
request
permission_contract
resource
required_lanes
base_decision
operational_decision
prerequisite_decisions
device_decision
sensitivity_decision
field_policy_decision
matched_allows
matched_denies
structural_denies
actor_wide_denies
lane_denies
blocked_reasons
combination
final_decision
audit
```

No se eliminan campos para ahorrar payload interno.

---

#### 110. Determinismo de arrays

Los arrays cuyo orden no sea semántico se ordenan por claves estables.

Ejemplos:

- matched allows;
- matched denies;
- blocked reasons;
- dataset evidence;
- territories;
- requested fields normalizados.

La misma semántica produce el mismo orden.

---

#### 111. Proyección segura privada

Se define:

```text
app_private.project_safe_authorization_decision(jsonb) → jsonb
```

Recibe exclusivamente una `AuthorizationDecision@1.0.0` validada.

No ejecuta una segunda evaluación.

No rellena campos ausentes.

---

#### 112. Proyección SQL segura expuesta

Se congela:

```text
api.get_safe_authorization_decision(jsonb) → jsonb
```

Firma:

```sql
api.get_safe_authorization_decision(
  p_evaluation_request jsonb
)
returns jsonb
```

Responsabilidad:

```text
validar request
→ evaluar una vez
→ proyectar una vez
→ devolver solo forma segura
```

---

#### 113. Naturaleza del wrapper `api`

`api.get_safe_authorization_decision(jsonb)` es una excepción estrecha a la preferencia por `SECURITY INVOKER`.

Será:

```text
VOLATILE
SECURITY DEFINER
```

porque:

1. debe invocar el evaluador privado;
2. authenticated no recibe `USAGE` sobre `app_private`;
3. crea una nueva decision instance;
4. reduce el payload antes de cruzar la frontera.

---

#### 114. ACL del wrapper seguro

Estado objetivo:

| Rol               | Acceso                                |
| ----------------- | ------------------------------------- |
| `PUBLIC`          | NO                                    |
| `anon`            | NO por defecto                        |
| `authenticated`   | EXECUTE exacto                        |
| servicio aprobado | solo cuando el manifiesto lo requiera |

El grant es por firma exacta.

Una futura overload no hereda el permiso.

---

#### 115. Forma segura

La proyección puede incluir:

```text
outcome
app_code
permission_key
operation_kind
resource_type
safe_resource_reference
safe_message_code
safe_reason_codes
recovery_actions
visible_fields
correlation_id
decided_at
```

Los campos exactos se validan contra el contrato de presentación vigente.

La proyección no es una `AuthorizationDecision` incompleta.

---

#### 116. Datos prohibidos en safe projection

No se exponen por defecto:

```text
access_context_ref interno completo
actor_id interno
principal_id interno
employee_id
device_id
shift_id
checkin_id
matched_allows completos
matched_denies completos
structural_denies completos
actor_wide_denies completos
lane_denies completos
dataset versions
dataset fingerprints
source fingerprints
permission contract hash
resource fingerprint
dependency graph interno
audit completo
SQL errors
table names
security configuration
freshness token
generation values
```

---

#### 117. Outcome visible no es bearer authority

Una respuesta segura:

```text
outcome = ALLOW
```

puede utilizarse para:

- presentación;
- navegación;
- guard de lectura no ejecutiva;
- explicación segura.

No puede viajar posteriormente como:

```text
proof_of_authorization
```

para una mutación.

La mutación se reevalúa en su frontera.

---

#### 118. Safe projection y navegador

El navegador puede recibir únicamente la proyección segura.

No recibe:

```text
app_private.evaluate_authorization
```

ni:

```text
AuthorizationDecision completo
```

La existencia del wrapper seguro no concede acceso directo a funciones privadas.

---

#### 119. RLS predicate privado

Se define:

```text
app_private.authorization_policy_allows(jsonb) → boolean
```

Propósito:

> proveer una proyección booleana privada sobre el mismo núcleo cuando una policy futura necesite una frontera SQL certificada.

No es una API general.

---

#### 120. Reglas del RLS predicate

El predicado:

- no usa legacy `has_permission`;
- no recibe actor;
- no recibe rol efectivo;
- no recibe sede efectiva;
- no recibe area efectiva;
- construye o recibe únicamente localizadores de recurso permitidos por la policy;
- usa el mismo contrato de permiso;
- usa el mismo contexto;
- usa la misma precedencia;
- retorna `true` solo si la decisión equivalente sería `ALLOW`.

---

#### 121. RLS predicate no se conecta todavía

`AUTH-DB-034` puede materializar el primitive privado.

No modifica las 181 policies legacy observadas.

La conexión a policies pertenece a:

```text
AUTH-DB-021
```

y requiere paquete, recurso y parity evidence.

---

#### 122. Certificación de equivalencia RLS

Antes de usar el predicado en una policy:

```text
full evaluator outcome
=
private RLS predicate outcome
```

para el mismo actor, permiso, recurso y snapshot.

Deben probarse:

- allow;
- deny;
- resource mismatch;
- scope mismatch;
- deny precedence;
- actor switch;
- stale context;
- concurrent update.

---

#### 123. Rendimiento RLS

No se llama al evaluator completo con generación de payload pesado por fila si un predicado equivalente certificado puede reducir la evaluación.

Optimización permitida:

```text
MISMA SEMÁNTICA
+
MENOR PROYECCIÓN
```

Optimización prohibida:

```text
MENOS REGLAS
+
MÁS ALLOW
```

---

#### 124. Adopción en RPC

Las RPC sensibles no reciben el resultado de 034 desde el cliente.

Su patrón futuro:

```text
RPC
→ resolver resource
→ evaluar internamente
→ verificar ALLOW
→ validar versión/lock
→ ejecutar
```

La adopción concreta corresponde a:

```text
AUTH-DB-006
AUTH-DB-007
AUTH-DB-008
AUTH-DB-009
AUTH-DB-010
```

---

#### 125. Legacy `has_permission`

`has_permission` no se modifica ni retira por el simple hecho de crear 034.

Durante transición:

```text
legacy
→ inventariado
→ migrado por consumidor
→ telemetría cero
→ retiro AUTH-DB-030
```

No se convierte el legacy en un alias silencioso del evaluador sin revisar sus firmas.

---

#### 126. Bypass legacy

La futura migración no conserva:

```text
is_owner()
is_global_manager()
is_manager()
bypass_applied
```

como precedencia paralela.

Si un actor debe tener una capacidad:

```text
permiso exacto
+
scope
+
resource
+
contrato
+
sin deny
```

deben demostrarla.

---

#### 127. Simulación excluida

`AUTH-DB-034` evalúa autoridad real.

No acepta:

- simulation id;
- simulated role;
- simulated site;
- hypothetical grant;
- would_allow.

La simulación utiliza su evaluador separado.

---

#### 128. SYSTEM

Un `SYSTEM`:

- exige principal técnico registrado;
- exige proceso/delegación aprobada;
- usa permisos y recursos exactos;
- no hereda autoridad de `service_role`;
- deja evidencia de atribución.

---

#### 129. `service_role`

`service_role` es capacidad técnica de infraestructura.

No es:

```text
OWNER
GLOBAL MANAGER
SYSTEM ACTOR automáticamente
```

Una función ejecutada con privilegios altos todavía debe resolver un principal empresarial o técnico válido.

---

#### 130. Error de argumento

Un envelope mal formado produce error SQL controlado.

Categoría prevista:

```text
SQLSTATE 22023
```

No se devuelve `ALLOW = false` para ocultar un bug de contrato cuando el request ni siquiera es una invocación válida.

---

#### 131. Estado empresarial denegado

Casos normales como:

- permiso inexistente;
- recurso fuera de scope;
- lane no lista;
- prerequisito faltante;
- deny aplicable;
- dispositivo incompatible;

producen una decisión `DENY` válida cuando el contrato puede materializarla.

---

#### 132. Fallo técnico

Un fallo que impide construir una decisión completa:

- corrupción de contrato;
- dataset requerido inaccesible;
- source version imposible;
- resolver roto;
- schema incompatible;
- excepción inesperada;

no produce un `AuthorizationDecision` parcial positivo.

Produce error técnico seguro.

---

#### 133. No fallback ante error

Queda prohibido:

```text
evaluator error
→ has_permission legacy
→ ALLOW
```

También:

```text
resource resolver error
→ NON_RESOURCE
```

y:

```text
dataset error
→ asumir sin denies
```

---

#### 134. Mensaje técnico seguro

Las excepciones expuestas no contienen:

- SQL completo;
- nombres privados;
- grants;
- deny details;
- IDs de otros actores;
- secretos;
- stacktrace.

La correlación permite diagnóstico interno.

---

#### 135. Correlation id

`correlation_id`:

- se propaga;
- puede ser `null` según contrato;
- no concede permiso;
- no participa en precedencia;
- no sustituye decision id;
- no se usa como cache key de autoridad.

---

#### 136. Cache de decisiones

No se crea L1 de `AuthorizationDecision`.

La política permanece:

```text
REQUEST-SCOPED ONLY
```

y con clave semántica exacta por:

- context fingerprint;
- app;
- permission;
- operation;
- resource;
- version;
- fields;
- source.

---

#### 137. Reutilización de decisión

Una decisión no se reutiliza:

- en otra solicitud;
- para otro recurso;
- para otra versión;
- para otra mutación;
- después de cambiar actor;
- después de write barrier;
- como token.

---

#### 138. Escritura posterior

Patrón mínimo:

```text
evaluate
→ ALLOW
→ validar versión/lock
→ persistir evidencia requerida
→ ejecutar
```

Si existe una ventana material entre evaluación y escritura:

```text
REEVALUAR
```

o usar una frontera transaccional equivalente.

---

#### 139. Observabilidad

Métricas mínimas futuras:

```text
authorization_evaluations_total
authorization_allow_total
authorization_deny_total
authorization_error_total
authorization_latency
authorization_resource_resolution_latency
authorization_dependency_depth
authorization_dataset_load_latency
authorization_contract_invalid_total
authorization_default_deny_total
authorization_structural_deny_total
authorization_actor_wide_deny_total
authorization_lane_deny_total
authorization_safe_projection_total
authorization_rls_projection_total
authorization_legacy_comparison_total
```

Dimensiones sin PII:

- app;
- permission family cuando esté aprobada;
- operation kind;
- request source;
- outcome;
- reason class;
- version.

---

#### 140. Logs

Los logs pueden incluir:

```text
correlation_id
decision_id protegido
app_code
permission_key
operation_kind
request_source
outcome
primary_safe_reason_code
context_fingerprint_prefix
resource_fingerprint_prefix
contract_version
catalog_version
latency
```

No incluyen payloads completos por defecto.

---

#### 141. Privacidad de evidencia

No registrar en logs generales:

- documentos;
- nombres;
- correos;
- salarios;
- direcciones;
- JWT;
- refresh token;
- grants completos;
- denies completos;
- contexto completo;
- resource payload completo.

La evidencia sensible se gobierna por auditoría propietaria.

---

#### 142. Objetos físicos runtime de contrato

La futura instancia contempla:

```text
app_private.authorization_contract_releases
app_private.authorization_permission_contracts
app_private.authorization_resource_resolver_registry
app_private.authorization_dataset_source_registry
```

Son metadata técnica y snapshots contractuales.

No son tablas de decisión durable.

---

#### 143. RLS de objetos privados

Las tablas anteriores:

- mantienen RLS como defensa en profundidad;
- no tienen policy para `anon`;
- no tienen policy para `authenticated`;
- no se añaden a Data API;
- no se exponen en `api`;
- no conceden `SELECT` cliente.

---

#### 144. ACL general

Objetivo:

```text
PUBLIC
→ sin acceso a objetos 034 privados

anon
→ sin acceso a objetos 034 privados
→ sin safe decision por defecto

authenticated
→ solo api.get_safe_authorization_decision(jsonb)
→ ningún helper privado

servicio privilegiado aprobado
→ solo firmas requeridas por manifiesto
```

---

#### 145. `api` no contiene tablas de autoridad

`api` contiene únicamente contrato expuesto.

No contiene:

- permission contract tables;
- resolver registries;
- datasets;
- grants;
- denies;
- decision storage.

---

#### 146. No exposición de owner schemas

034 no añade owner schemas a Data API.

No concede `SELECT` directo para que frontend “resuelva” autorización.

El evaluator privilegiado lee únicamente lo necesario.

---

#### 147. Source registry y drift

El harness compara:

```text
permission contracts
resource resolver registry
dataset source registry
physical functions
source schemas/relations
contract hashes
```

Debe detectar:

- permission missing;
- duplicate contract;
- resource resolver missing;
- dataset source missing;
- source shape changed;
- function signature changed;
- ACL drift;
- release mismatch.

---

#### 148. Drift que bloquea

Bloquean una release:

```text
permission active without contract
resource contract without resolver
resolver registry duplicate
dataset required but unresolved
catalog hash mismatch
reason-code version mismatch
context contract mismatch
unknown authorization modality
unknown scope
unknown requirement
unknown event/source enum
```

No se ignoran con warning.

---

#### 149. Idempotencia de migration

Una segunda aplicación segura:

- no duplica release;
- no duplica permission contracts;
- no cambia snapshot publicado;
- no amplía ACL;
- no activa dos releases;
- no cambia resource resolver por inferencia;
- no resetea fingerprints.

Drift incompatible requiere migration forward.

---

#### 150. Instalación de una nueva release contractual

Orden:

```text
1. insertar release INSTALLED
2. cargar permission contracts
3. cargar resource registry
4. verificar dataset registry
5. validar cardinalidad
6. validar hashes
7. validar dependencies
8. validar resource coverage
9. ejecutar contract tests
10. activar nueva release
11. invalidar global authorization generation mediante 035
12. marcar anterior SUPERSEDED
```

El cambio de release participa en frescura.

---

#### 151. Atomicidad de activación

La activación de release y la invalidación correspondiente deben quedar en la misma transacción cuando cambien autoridad efectiva.

Si no puede incrementarse la generación global:

```text
ROLLBACK
```

No se activa una release nueva con contexto cacheado de release anterior.

---

#### 152. Resource registry durante release

Un nuevo permission contract no puede activarse si referencia un `resource_contract_id` sin resolver.

No se acepta:

```text
TODO resolver
```

como estado activo.

Puede permanecer `BLOCKED` sin activar la release.

---

#### 153. Dataset source migration

Cuando un dataset cambia de tabla o schema:

```text
migration forward
→ nuevo loader estático
→ nuevo source shape fingerprint
→ pruebas de paridad
→ registry actualizado
→ invalidación
```

No se cambia una fila de registry para apuntar dinámicamente a cualquier tabla.

---

#### 154. Índices

Candidatos mínimos:

```text
authorization_contract_releases
→ status
→ catalog_version

authorization_permission_contracts
→ PK catalog_version + permission_key
→ app_code + status
→ resource_contract_id

authorization_resource_resolver_registry
→ PK resource_contract_id
→ status
→ owner_domain

authorization_dataset_source_registry
→ PK dataset_key + dataset_version
→ status
```

Los índices finales requieren planes reales.

---

#### 155. Rendimiento

El benchmark debe medir:

- contexto;
- permission contract;
- resource resolution;
- datasets;
- dependencies;
- final decision;
- safe projection;
- RLS predicate.

Se registran p50 y p95 como mínimo.

No se cambia semántica para alcanzar un objetivo de latencia.

---

#### 156. N+1 de dependencias

El evaluator debe evitar consultas redundantes dentro de la misma decisión.

Puede memoizar request-scoped:

- context;
- permission contracts;
- datasets;
- resource snapshots compatibles.

No utiliza cache cross-request de decisiones.

---

#### 157. Bulk performance

Una evaluación bulk no ejecuta una consulta completa independiente por campo o por regla cuando puede usar una consulta set-based equivalente.

La equivalencia semántica debe probarse.

Optimización no elimina decisiones por recurso cuando el contrato las requiere.

---

#### 158. RLS performance

La existencia de 181 policies legacy que hoy llaman `has_permission` demuestra que la migración debe medir planes y frecuencia antes del cutover.

No se sustituye mecánicamente:

```text
has_permission(...)
```

por:

```text
evaluate_authorization(...)
```

fila por fila.

Se utilizan predicados certificados y queries de recurso apropiados.

---

#### 159. Rollout físico

Orden de activación:

```text
1. materializar núcleo sin consumidores
2. validar full evaluator
3. validar safe projection
4. validar policy predicate
5. ejecutar shadow/parity contra casos legacy
6. migrar consumidores por tareas propietarias
7. medir diferencias
8. clasificar diferencias
9. retirar legacy solo al final
```

034 no hace cutover global.

---

#### 160. Paridad legacy

Las comparaciones se clasifican:

```text
EXPECTED_EQUAL
INTENTIONAL_CANONICAL_DENY
LEGACY_SECURITY_BUG
LEGACY_DATA_FALLBACK
CANONICAL_DEFECT
DATA_GAP
CONSUMER_DEFECT
CONTRACT_GAP
```

Un bug legacy no se conserva por paridad.

---

#### 161. Diferencias esperables actuales

Son candidatos a corrección intencional:

- bypass por rol;
- `auth.uid()` como employee id;
- site enviado como autoridad;
- site default;
- `can_operate`;
- simulación mezclada;
- booleano sin recurso;
- ausencia de evidencia;
- permiso por route helper;
- policy con helper administrativo paralelo.

La clasificación definitiva se prueba caso por caso.

---

#### 162. Rollback antes de consumidores

Si la instancia física debe revertirse antes de adopción:

```text
1. confirmar cero consumidores
2. retirar grant safe wrapper
3. retirar api wrapper
4. retirar helpers privados sin dependencias
5. retirar registries mediante migration forward
6. conservar legacy intacto
7. validar drift
```

No `DROP CASCADE`.

---

#### 163. Rollback después de consumidores

Si ya existen consumidores:

```text
1. detener nuevos cutovers
2. volver consumidores a adapter compatible aprobado
3. conservar evidencia
4. aplicar migration forward
5. no reactivar bypass
6. no cambiar al resultado más permisivo
```

El rollback no convierte legacy en target final.

---

#### 164. Backup y restore

`AUTH-DB-029` debe cubrir:

- runtime contract releases;
- permission contract snapshots;
- resolver registry;
- dataset registry;
- funciones;
- ACL;
- RLS;
- migrations.

Después de restore:

```text
drift check
→ contract hash check
→ context/freshness check
→ evaluator parity
```

antes de reanudar adopción.

---

#### 165. Dependencias físicas de `AUTH-DB-034::GLOBAL`

Antes de autorización física debe existir evidencia de:

```text
R0 aplicable verificado
AUTH-DB-016::GLOBAL cuando los schemas requeridos aún no existan
AUTH-DB-018::GLOBAL cuando la separación de helpers sea prerrequisito
AUTH-DB-017::GLOBAL coherente con exposición api
AUTH-DB-019::GLOBAL VERIFIED
AUTH-DB-033::GLOBAL VERIFIED
AUTH-DB-035::GLOBAL VERIFIED
AUTH-DB-027 disponible
AUTH-DB-028 baseline vigente
AUTH-DB-029 rollback disponible
release contractual completa para el PermissionKey activo
resource contracts resolubles
reason-code contract compatible
```

Si 033 o 035 no están `VERIFIED`, 034 no se materializa.

---

#### 166. Dependencia de `@vento/contracts`

La futura instancia registra hashes de la release contractual utilizada.

No requiere que una aplicación cliente consuma el package.

Sí requiere que la fuente contractual completa que alimenta el runtime sea verificable.

Un artefacto estático parcial no se presenta como contrato completo.

---

#### 167. Manifiesto de futura materialización

Debe registrar:

```text
instance_id = AUTH-DB-034::GLOBAL
mode = GLOBAL_ENABLE_ONCE
execution_gate = PRE_E5_FOUNDATION
project_ref
environment
migration_files
source_contract_sha256
request_contract_version
decision_contract_version
context_contract_version
catalog_version
catalog_manifest_sha256
permission_count
resource_contract_count
reason_code_version
function_signatures
registry_counts
acl_snapshot_before
acl_snapshot_after
rls_snapshot
legacy_function_inventory
legacy_policy_counts
benchmark
drift_before
drift_after
rollback_plan
validation_commands
evidence
```

---

#### 168. Orden de materialización física

Secuencia esperada:

```text
1. preflight
2. baseline y snapshots
3. verificar 019/033/035
4. verificar release contractual
5. crear migration
6. crear runtime contract tables
7. cargar release y permission contracts
8. crear resource resolver registry
9. crear dataset registry
10. crear canonicalizer
11. crear request validator
12. crear permission resolver
13. crear resource resolver dispatch
14. crear dataset loaders
15. crear core
16. crear issuer
17. crear safe projector
18. crear api safe wrapper
19. crear private policy predicate
20. aplicar ACL/RLS
21. ejecutar contract tests
22. ejecutar resource tests
23. ejecutar precedence tests
24. ejecutar security tests
25. ejecutar parity tests
26. ejecutar performance tests
27. rehearsal rollback
28. drift final
29. registrar evidencia
```

---

#### 169. Política de migration

Todo cambio físico:

- se versiona en `vento-shell`;
- no se aplica manualmente como estado final desde Dashboard;
- no edita migration aplicada;
- no crea objeto ad hoc fuera de historial;
- usa migration forward para correcciones;
- conserva hash.

El desarrollo documental de esta tarea no crea la migration.

---

#### 170. Pruebas físicas — firma y envelope

La futura instancia debe demostrar:

1. existe exactamente `app_private.evaluate_authorization(jsonb)`;
2. retorna `jsonb`;
3. es `VOLATILE`;
4. es `SECURITY DEFINER`;
5. no existe overload inseguro;
6. request null falla;
7. objeto vacío falla;
8. contract family inválida falla;
9. version inválida falla;
10. schema version inválida falla;
11. request source inválido falla;
12. operation kind inválido falla;
13. actor suministrado por caller es rechazado;
14. role suministrado es rechazado;
15. site efectivo suministrado es rechazado.

---

#### 171. Pruebas físicas — permiso

16. app válida;
17. app desconocida;
18. permission válida;
19. permission desconocida;
20. app-permission mismatch;
21. alias no autorizado;
22. wildcard rechazado;
23. contrato único;
24. contrato faltante;
25. contrato duplicado;
26. fingerprint reproducible;
27. release cardinality consistente;
28. permission activa sin snapshot bloquea.

---

#### 172. Pruebas físicas — contexto

29. get_access_context se resuelve una sola vez;
30. contexto sin actor;
31. empleado inactivo;
32. HUMAN_USER;
33. SHARED_DEVICE con actor;
34. SHARED_DEVICE sin actor;
35. SYSTEM válido;
36. service role sin SYSTEM;
37. context fingerprint preservado;
38. stale context rechazado;
39. simulation no aparece.

---

#### 173. Pruebas físicas — recurso

40. existing resource;
41. draft;
42. collection;
43. aggregate;
44. bulk;
45. non-resource legítimo;
46. resolver faltante;
47. resolver conflictivo;
48. resource isolated;
49. territory null no global;
50. array vacío no global;
51. origin/destination;
52. multi-site;
53. historical snapshot;
54. ownership exacta;
55. resource version mismatch;
56. state mismatch;
57. field desconocido.

---

#### 174. Pruebas físicas — lanes

58. BASE_ONLY allow;
59. BASE_ONLY deny;
60. OPERATIONAL_ONLY allow;
61. OPERATIONAL_ONLY deny;
62. BASE_OR_OPERATIONAL base allow;
63. BASE_OR_OPERATIONAL operational allow;
64. BASE_OR_OPERATIONAL ambos deny;
65. BASE_AND_OPERATIONAL ambos allow;
66. BASE_AND_OPERATIONAL una lane deny;
67. lane no admitida NOT_APPLICABLE;
68. base sin turno;
69. operational sin turno;
70. operational sin check-in requerido;
71. operational con check-in válido;
72. área requerida ausente.

---

#### 175. Pruebas físicas — precedencia

73. structural deny vence allow;
74. actor-wide deny vence allow;
75. lane deny vence allow;
76. allow sin deny permite cuando resto cumple;
77. ausencia de allow produce default deny;
78. deny no se borra por override positivo;
79. role owner no bypass;
80. global manager no bypass;
81. manager no bypass;
82. device no bypass;
83. service role no bypass.

---

#### 176. Pruebas físicas — dependencias y restricciones

84. dependencia allow;
85. dependencia deny;
86. ciclo;
87. profundidad 32;
88. profundidad 33;
89. device restrict;
90. MFA requerida;
91. reauth requerida;
92. separation of duties;
93. field read partial;
94. mutation con field bloqueado;
95. idempotency conflict;
96. concurrency conflict.

---

#### 177. Pruebas físicas — salida

97. decision_id único;
98. decided_at único por decisión;
99. contract metadata completa;
100. required lanes correctas;
101. matched allows deterministas;
102. matched denies deterministas;
103. blocked reasons deterministas;
104. final ALLOW;
105. final DENY;
106. audit coherente;
107. canonical JSON reproducible;
108. no `can_operate`;
109. no `bypass_applied`.

---

#### 178. Pruebas físicas — safe projection

110. wrapper seguro retorna jsonb;
111. authenticated puede ejecutar firma exacta;
112. anon no;
113. PUBLIC no;
114. no source fingerprints;
115. no dataset fingerprints;
116. no full grants;
117. no full denies;
118. no internal IDs prohibidos;
119. safe reason codes válidos;
120. outcome coincide con full decision;
121. safe projection no se usa como mutation token.

---

#### 179. Pruebas físicas — seguridad

122. internal evaluator sin execute authenticated;
123. helpers sin execute cliente;
124. registries sin select cliente;
125. search path poisoning;
126. homonym function;
127. homonym table;
128. SQL injection;
129. dynamic function injection imposible;
130. dynamic relation injection imposible;
131. malicious resource request fail closed;
132. manipulated app fail closed;
133. manipulated permission fail closed;
134. error no filtra SQL.

---

#### 180. Pruebas físicas — RLS

135. private predicate allow = full allow;
136. private predicate deny = full deny;
137. resource mismatch parity;
138. deny parity;
139. actor switch parity;
140. request source RLS no amplía;
141. boolean predicate no concede fuera de core;
142. no se reemplaza ninguna policy durante 034 por inferencia.

---

#### 181. Pruebas físicas — operación

143. plan de ejecución capturado;
144. p50 registrado;
145. p95 registrado;
146. dependencies benchmark;
147. resource resolver benchmark;
148. dataset loader benchmark;
149. concurrencia;
150. rollback rehearsal;
151. segunda ejecución idempotente;
152. drift final;
153. release mismatch bloquea;
154. local/staging/ambiente autorizado conservan paridad contractual.

---

#### 182. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Justificación:** `AUTH-DB-034` materializa en una futura instancia física las reglas de evaluación, recurso, lanes, precedencia, evidencia, seguridad y proyección ya definidas por el modelo canónico, el catálogo, `AuthorizationDecision@1.0.0`, `AuthorizationEvaluationRequest@1.0.0` y el plan maestro de pruebas. La tarea concreta objetos SQL, fronteras, registries, loaders, ACL, rollback y validación sin introducir una capacidad empresarial nueva, un permiso nuevo ni una regla nueva de acceso.

---

#### 183. Cobertura de prueba vigente reutilizada

Se reutiliza sin modificación la cobertura existente sobre:

- aplicación y PermissionKey exactos;
- modalidades;
- scopes;
- resource contracts;
- ownership;
- territory;
- lanes;
- shift y check-in;
- devices;
- sensitivity;
- explicit denies;
- dependencies;
- field policies;
- safe projections;
- RLS parity;
- RPC adoption;
- legacy transition;
- concurrency;
- rollback;
- drift;
- adversarial security.

El Registro Canónico de Requisitos de Prueba no se modifica.

---

#### 184. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| --------- | -------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | el desarrollo documental no creó migrations, funciones, tablas, policies ni código runtime                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| LOCAL     | NOT_EXECUTED   | pendiente de insertar el bloque en la rama documental `task/auth-db-034`, ejecutar formateo `--write`, `--check`, quality, delivery, topología y batería global                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| REMOTA    | PASS           | auditoría read-only 2026-08-22 sobre `vento-shell` y `vento-os-dev`: continuidad remota sitúa `AUTH-DB-034` después de 035; topología `GLOBAL_ENABLE_ONCE` y gate `PRE_E5_FOUNDATION` confirmados; catálogo compartido observado con 10 AppCode, 140 PermissionKey activos y 13 scopes; response contracts actuales materializan AccessContext y simulación pero no el AuthorizationDecision completo; Supabase no contiene evaluate_authorization canónico; persisten has_permission, has_operational_permission y has_effective_permission_v1 legacy; se observaron 181 policies sobre 88 tablas que referencian has_permission |
| OPERATIVA | NOT_APPLICABLE | no se alteraron consumidores, navegación, RPC, policies, cache mode ni runtime                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| FÍSICA    | NOT_APPLICABLE | no se ejecutó SQL de mutación, no se creó migration y `AUTH-DB-034::GLOBAL` no fue autorizada                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |

---

#### 185. Decisiones vinculantes

1. La futura instancia es `AUTH-DB-034::GLOBAL`.
2. El modo es `GLOBAL_ENABLE_ONCE`.
3. El gate es `PRE_E5_FOUNDATION`.
4. La frontera completa es `app_private.evaluate_authorization(jsonb)`.
5. Retorna `jsonb`.
6. El input es `AuthorizationEvaluationRequest@1.0.0`.
7. El output completo es `AuthorizationDecision@1.0.0`.
8. El único argumento general es un envelope JSON.
9. El caller no declara actor.
10. El caller no declara empleado.
11. El caller no declara roles efectivos.
12. El caller no declara territorio efectivo.
13. El caller no declara grants.
14. El caller no declara denies.
15. El caller no declara expected outcome.
16. El issuer es `VOLATILE`.
17. El issuer es `SECURITY DEFINER` endurecido.
18. El issuer no persiste decisiones.
19. Se separa issuer y core.
20. El core reutiliza un solo AccessContext principal.
21. Las dependencias no reingresan por el issuer.
22. La profundidad máxima es 32.
23. Los ciclos deniegan por contrato inválido.
24. Se reutiliza `get_access_context`.
25. 035 conserva ownership de freshness.
26. Token válido no equivale a allow.
27. Se crea runtime projection de releases contractuales.
28. Se crea runtime projection de PermissionContractSnapshot.
29. Esa projection no es una segunda autoridad editable.
30. La cardinalidad futura proviene de la release.
31. El corte observado es 140 permisos activos.
32. No se hardcodea 112.
33. No se hardcodea 140 como eterno.
34. Todo permiso activo exige snapshot.
35. Permiso sin snapshot bloquea release.
36. Se crea resource resolver registry.
37. El registry no ejecuta nombres dinámicos.
38. El dispatch es cerrado.
39. Se define existing resource.
40. Se define draft.
41. Se define collection.
42. Se define aggregate.
43. Se define bulk.
44. NON_RESOURCE no es fallback.
45. Territory viene del recurso.
46. Null no significa global.
47. Empty no significa all.
48. Ownership es explícita.
49. State predicate participa.
50. Concurrency participa.
51. Idempotency no concede autoridad.
52. Field policy participa.
53. Se crea dataset source registry.
54. Los loaders usan SQL estático.
55. Datasets son versionados.
56. Cero matches no equivale a dataset faltante.
57. Se preserva la precedencia exacta.
58. Structural deny vence.
59. Actor-wide deny vence.
60. Lane deny vence.
61. Allow solo aplica después.
62. Default deny permanece.
63. BASE_ONLY se preserva.
64. OPERATIONAL_ONLY se preserva.
65. BASE_OR_OPERATIONAL se preserva.
66. BASE_AND_OPERATIONAL se preserva.
67. Lane no admitida es NOT_APPLICABLE.
68. Base no toma turno.
69. Operational usa turno.
70. Check-in solo cuando el contrato lo exige.
71. Device restringe.
72. Device no concede.
73. Sensitivity restringe.
74. SoD se preserva.
75. Final real es ALLOW o DENY.
76. Reasons son deterministas.
77. La decisión tiene audit payload.
78. 032 conserva persistencia.
79. Canonical JSON se reutiliza.
80. `jsonb::text` no basta.
81. Se separan decision id y fingerprints.
82. Se define safe projector privado.
83. Se define `api.get_safe_authorization_decision(jsonb)`.
84. El wrapper seguro es proyección, no decisión incompleta.
85. `authenticated` recibe solo el wrapper seguro.
86. `anon` no por defecto.
87. El cliente no ejecuta el evaluator completo.
88. Safe outcome no es bearer token.
89. Se define private RLS predicate.
90. 034 no reescribe las 181 policies observadas.
91. 021 conserva adopción RLS.
92. 006..010 conservan adopción RPC.
93. 030 conserva retiro legacy.
94. Bypass por owner no se conserva.
95. Bypass por manager no se conserva.
96. `can_operate` no se conserva.
97. Simulación permanece separada.
98. Service role no es autoridad empresarial.
99. SYSTEM exige principal técnico.
100. Input inválido falla controladamente.
101. Deny empresarial produce decisión válida.
102. Fallo técnico no produce allow.
103. No existe fallback al legacy.
104. No existe L1 de decisiones.
105. Una decisión no se reutiliza cross-request.
106. Mutaciones reevalúan.
107. Se definen métricas sin PII.
108. Se definen logs seguros.
109. Objetos privados tienen RLS defensiva.
110. Cero grants cliente a app_private.
111. Data API no expone owner schemas.
112. Drift de contracts/resolvers/datasets bloquea.
113. Una nueva release invalida generación global.
114. Activación e invalidación son atómicas.
115. Migration es forward y versionada.
116. Rollback no usa DROP CASCADE.
117. Paridad no conserva bugs legacy.
118. Rendimiento no cambia semántica.
119. 154 pruebas físicas mínimas quedan especificadas.
120. No se crean ni modifican requisitos de prueba.
121. La aprobación documental no autoriza cambios físicos.
122. La siguiente tarea documental es AUTH-DB-032.

---

#### 186. Criterios de aceptación

`AUTH-DB-034` queda documentalmente completa cuando:

1. se fija la instancia global;
2. se fija el gate;
3. se fija la firma completa;
4. se fija el envelope;
5. se excluyen inputs autoritativos;
6. se separan issuer y core;
7. se fija seguridad del issuer;
8. se fija search path;
9. se fijan ACL negativas;
10. se fija request validation;
11. se fija app exacta;
12. se fija permission exacta;
13. se fija PermissionContractSnapshot;
14. se reconcilia la cardinalidad histórica;
15. se documenta cardinalidad actual observada;
16. se define runtime contract release;
17. se define permission contract projection;
18. se define integridad de release;
19. se define AccessContext único;
20. se preserva freshness;
21. se define AccessContextReference;
22. se define decision ID;
23. se define decided_at;
24. se define snapshot coherente;
25. se define resource registry;
26. se prohíbe dynamic dispatch;
27. se define resource resolver;
28. se definen seis modos de recurso;
29. se define existing;
30. se define draft;
31. se define collection;
32. se define aggregate;
33. se define bulk;
34. se define NON_RESOURCE;
35. se definen estados de resolución;
36. se define territory;
37. se define resource fingerprint;
38. se define state;
39. se define concurrency;
40. se define idempotency;
41. se define territory mutation;
42. se define field policy;
43. se define requested fields;
44. se define dataset registry;
45. se prohíbe SQL dinámico por registry;
46. se definen datasets;
47. se define versionado;
48. se define cero matches;
49. se define NOT_APPLICABLE;
50. se define base grants;
51. se define operational grants;
52. se definen overrides;
53. se definen denies;
54. se fija precedencia exacta;
55. se define structural deny;
56. se define actor-wide deny;
57. se define lane deny;
58. se define default deny;
59. se definen modalidades;
60. se define lane no admitida;
61. se define base lane;
62. se define operational lane;
63. se definen prerrequisitos;
64. se define check-in incompatible;
65. se define área;
66. se define device;
67. se define shared device;
68. se define sensitivity;
69. se define SoD;
70. se definen dependencies;
71. se define profundidad;
72. se define combinación;
73. se definen restricciones posteriores;
74. se fija final decision;
75. se definen matched allows;
76. se definen matched denies;
77. se definen blocked reasons;
78. se reutilizan reason codes;
79. se define audit;
80. se preserva 032;
81. se define canonicalizer;
82. se definen fingerprints;
83. se define request fingerprint;
84. se separa decision identity;
85. se fija shape raíz;
86. se fija determinismo;
87. se define safe projector;
88. se define wrapper api;
89. se justifica security definer;
90. se fija ACL safe;
91. se define forma segura;
92. se definen datos prohibidos;
93. se declara outcome no bearer;
94. se define frontera navegador;
95. se define RLS predicate;
96. se define paridad RLS;
97. se conserva adopción en 021;
98. se conserva adopción RPC;
99. se conserva legacy;
100. se eliminan bypasses del target;
101. se excluye simulación;
102. se define SYSTEM;
103. se define service role;
104. se define error de argumento;
105. se define deny empresarial;
106. se define fallo técnico;
107. se prohíbe fallback;
108. se define correlation;
109. se prohíbe cache cross-request de decisiones;
110. se define revalidación;
111. se define observabilidad;
112. se define privacidad;
113. se definen objetos runtime;
114. se define RLS defensiva;
115. se define ACL;
116. se preserva api como capa;
117. se define drift;
118. se define idempotencia de migration;
119. se define nueva release;
120. se define activación atómica;
121. se define dataset migration;
122. se define indexing;
123. se define performance;
124. se define N+1;
125. se define bulk performance;
126. se define RLS performance;
127. se define rollout;
128. se define parity;
129. se define rollback;
130. se define restore;
131. se fijan dependencias;
132. se define manifiesto;
133. se fija orden físico;
134. se fija política de migration;
135. se definen pruebas de firma;
136. se definen pruebas de permiso;
137. se definen pruebas de contexto;
138. se definen pruebas de recurso;
139. se definen pruebas de lanes;
140. se definen pruebas de precedencia;
141. se definen pruebas de dependencias;
142. se definen pruebas de salida;
143. se definen pruebas safe;
144. se definen pruebas de seguridad;
145. se definen pruebas RLS;
146. se definen pruebas operativas;
147. se declara cero modificación del registro de pruebas;
148. se registra evidencia remota;
149. se preservan límites;
150. se reserva AUTH-DB-032 sin desarrollarla.

---

#### 187. Límites

`AUTH-DB-034` no:

- ejecuta SQL durante su desarrollo documental;
- crea migrations durante su desarrollo documental;
- crea tablas durante su desarrollo documental;
- crea funciones durante su desarrollo documental;
- cambia Supabase durante su desarrollo documental;
- autoriza `AUTH-DB-034::GLOBAL`;
- modifica `@vento/contracts`;
- inventa PermissionKey;
- inventa scope;
- inventa reason code;
- cambia `AccessContext@1.0.0`;
- cambia `ContextFreshnessToken@1.0.0`;
- persiste decisiones;
- implementa simulación;
- crea cache cross-request de decisiones;
- migra las 181 policies legacy observadas;
- reescribe RLS;
- migra RPC sensibles;
- cambia consumidores;
- cambia UI;
- cambia navegación;
- retira `has_permission`;
- retira `has_operational_permission`;
- retira `has_effective_permission_v1`;
- retira `get_operational_context`;
- retira `get_effective_context_v1`;
- modifica 04A;
- desarrolla `AUTH-DB-032`.

---

#### 188. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-DB-035 — Implementar token transaccional de frescura e invalidación del contexto`

**TAREA ACTUAL APROBADA**
`AUTH-DB-034 — Implementar evaluate_authorization canónico, su núcleo de evaluación, resolvers de recurso y proyecciones seguras`

**SIGUIENTE TAREA RESERVADA**
`AUTH-DB-032 — Implementar persistencia canónica y vinculación de decisiones de autorización`


### ✅ AUTH-DB-032 — Implementar persistencia canónica y vinculación de decisiones de autorización

**Estado:** APROBADA
**Tarea anterior:** AUTH-DB-034 — Implementar evaluate_authorization canónico, su núcleo de evaluación, resolvers de recurso y proyecciones seguras
**Tarea siguiente:** AUTH-DB-012 — Implementar auditoría de cambios de permisos
**Tipo de tarea:** Documental
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/02_R1_FUNDACION_FISICA_CANONICA.md`
**Estado físico resultante:** Contrato de persistencia durable de `AuthorizationDecision@1.0.0`, separación de fallos técnicos, vínculos decisión–ejecución, consultas auditables, integridad, minimización, retención y rollback cerrado; futura instancia global `AUTH-DB-032::GLOBAL` pendiente de autorización explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`AUTH-DB-032` define el contrato físico único para persistir y vincular las decisiones reales de autorización de Vento OS sin convertir la auditoría en una segunda fuente de verdad, sin convertir `decision_id` en un token de capacidad y sin mezclar un fallo técnico con una denegación.

La regla raíz es:

```text
AuthorizationDecision@1.0.0 COMPLETA
+
AuthorizationAuditContext CONSISTENTE
+
PERSISTENCIA DURABLE SEGÚN CLASE DE AUDITORÍA
+
VÍNCULO EXPLÍCITO CON COMANDO, EJECUCIÓN, EVENTO, ERROR O COMPENSACIÓN
=
EVIDENCIA RECONSTRUIBLE, INMUTABLE Y AUDITABLE
```

Para una operación que puede producir un efecto empresarial:

```text
RESOLVER
→ EVALUAR
→ PERSISTIR ANCLA DE DECISIÓN
→ VALIDAR CONCURRENCIA
→ EJECUTAR
→ VINCULAR RESULTADO
```

en una única frontera transaccional o mediante un protocolo explícito de revalidación, idempotencia y conciliación.

---

#### 2. Resultado canónico

La futura materialización establece:

```text
audit.authorization_decisions
audit.authorization_decision_resources
audit.authorization_decision_links
audit.authorization_evaluation_failures
audit.authorization_evaluation_failure_attempts
audit.authorization_decision_persistence_policies
```

y las primitivas privadas:

```text
audit.append_authorization_decision(jsonb)
audit.append_authorization_decision_link(jsonb)
audit.append_authorization_evaluation_failure(jsonb)
audit.append_authorization_evaluation_failure_attempt(jsonb)
audit.get_authorization_decision(text)
audit.search_authorization_decisions(jsonb)
audit.list_authorization_decision_links(text)
audit.reject_authorization_record_mutation()
app_private.resolve_authorization_persistence_profile(jsonb)
app_private.evaluate_and_record_authorization(jsonb)
```

La firma ya definida:

```text
api.get_safe_authorization_decision(jsonb)
```

conserva su contrato externo y, después de la futura materialización de 032, deberá atravesar la ruta persistente de decisión antes de devolver la proyección segura.

---

#### 3. Topología y gate

La clasificación canónica vigente es:

```text
task_id = AUTH-DB-032
mode = GLOBAL_ENABLE_ONCE
instance = AUTH-DB-032::GLOBAL
execution_gate = PRE_E5_FOUNDATION
canonical_work = DEFINE_CONTRACT_ONCE
```

Consecuencias:

1. existe como máximo una instancia física global;
2. no se crea una instancia por aplicación;
3. no se crea una instancia por `package_id`;
4. puede materializarse antes de E5 únicamente cuando sus dependencias físicas estén verificadas;
5. requiere autorización física explícita;
6. su aprobación documental no autoriza SQL, migrations ni cambios remotos;
7. la adopción vertical posterior conserva gates y propietarios propios.

---

#### 4. Fuentes vinculantes

La futura instancia debe preservar, como mínimo:

- `ADR-AUTH-001`;
- `AUTH-CTX-002`, para `AuthorizationDecision`;
- `AUTH-CTX-024`, para `AuthorizationAuditContext` y la cadena de evidencia;
- `AUTH-CTX-026`, para implementación canónica de evaluación;
- `AUTH-CTX-029`, para frescura e invalidación;
- `AUTH-ERR-019`, para separación `DECIDED | TECHNICAL_FAILURE`;
- `AUTH-ERR-020`, para reason codes y presentación segura;
- `AUTH-DB-033`, para `AccessContext@1.0.0`;
- `AUTH-DB-035`, para frescura;
- `AUTH-DB-034`, para evaluación real;
- `SUPA-ARC-006`, para fronteras de `app_private`;
- `SUPA-ARC-007`, para schema `audit`, clases transversales, atomicidad, inmutabilidad y minimización;
- `SUPA-ARC-011`, para nombres físicos;
- `SUPA-ARC-012`, para claves, constraints, estados y tiempo;
- `SUPA-ARC-013`, para funciones y triggers;
- `SUPA-ARC-014`, para excepciones privilegiadas;
- `SUPA-ARC-015`, para grants, RLS y ACL;
- `SUPA-ARC-021`, para rendimiento y crecimiento;
- `SUPA-ARC-022`, para retención, legal hold, archivado, backup y restore;
- `ENTERPRISE-INTEGRATION-AUDIT-POLICY-001@1.0.0`;
- `vento.canonical-json@1.0.0`.

---

#### 5. Precedencia

La precedencia aplicable es:

```text
CONTRATOS AUTH
→ significado de decisión y auditoría

SUPA-ARC-007
→ frontera transversal audit

AUTH-DB-016
→ schemas físicos requeridos

AUTH-DB-033
→ contexto

AUTH-DB-035
→ frescura

AUTH-DB-034
→ decisión

AUTH-DB-032
→ persistencia y vínculo

AUTH-DB-012
→ auditoría de cambios de permisos

AUTH-DB-013
→ auditoría de simulación

AUTH-DB-014
→ auditoría de dispositivos

AUTH-DB-006..010 / AUTH-DB-021
→ adopción en RPC y RLS
```

032 no absorbe las responsabilidades posteriores.

---

#### 6. Frontera con `SUPA-ARC-007`

`SUPA-ARC-007` fija:

```text
schema transversal = audit
business_domain_authority = NONE
direct_client_access_target = 0
```

y clasifica como append-only o inmutables:

- `AUDIT_ENTRY`;
- `AUDIT_LINK`;
- `BUSINESS_EVENT_RECORD`;
- intentos;
- efectos confirmados;
- correcciones enlazadas.

032 materializa únicamente el subconjunto especializado necesario para autorización.

No crea el sistema genérico completo de:

- eventos empresariales;
- outbox;
- emisión;
- delivery;
- inbox;
- efectos consumidores;
- reconciliación transversal.

---

#### 7. Clase de compromiso de la decisión

Toda decisión real de autorización utiliza:

```text
AUDIT_ATOMIC_REQUIRED
```

La ancla durable no puede considerarse telemetría opcional.

Para una operación con efecto:

```text
DECISIÓN VÁLIDA
+
ANCLA DURABLE
```

deben existir antes del efecto o dentro de la misma transacción que lo ejecutará.

Si la ancla obligatoria no puede persistirse:

```text
NO SE LIBERA LA DECISIÓN COMO EJECUTABLE
NO SE INICIA EL EFECTO
```

---

#### 8. Diferencia entre contrato emitido y persistencia

Toda `AuthorizationDecision@1.0.0` válida contiene `audit`.

032 distingue:

```text
CONTRATO EMITIDO
→ forma completa de la decisión

REGISTRO DURABLE
→ representación privada, indexable e inmutable

PROYECCIÓN SEGURA
→ representación mínima para consumidor autorizado
```

No son el mismo objeto.

La persistencia no modifica el contrato emitido.

---

#### 9. Línea base física remota observada

La auditoría read-only del proyecto:

```text
vento-os-dev
project_ref = clzdpinthhtknkmefsxx
status = ACTIVE_HEALTHY
PostgreSQL = 17.6.1.054
```

confirma que, en el corte observado:

```text
app_private = EXISTE
audit = NO EXISTE
api = NO EXISTE
identity_access = NO EXISTE
```

Por tanto, 032 no puede asumir que el schema `audit` ya está desplegado.

---

#### 10. Objetos legacy o ajenos observados

Existen objetos con nombres relacionados con auditoría o decisiones, entre ellos:

```text
auth.audit_log_entries
auth.oauth_authorizations
club.audit_events
vital.adaptive_decision_logs
vital.ai_decision_logs
```

y funciones `vital.*` de logging de decisiones.

Ninguno se adopta como persistencia canónica de `AuthorizationDecision@1.0.0`.

Razones:

- `auth.*` pertenece a la plataforma administrada;
- `club.*` pertenece a un dominio legacy distinto;
- `vital.*` permanece fuera de la autoridad de Vento OS;
- ninguno implementa el contrato completo de AUTH-CTX-024.

---

#### 11. Ausencia física de persistencia canónica

En el corte remoto no existe una relación canónica que materialice:

```text
AuthorizationDecision@1.0.0
+
AuthorizationAuditContext
+
decision_id
+
context_fingerprint
+
resource_fingerprint
+
catalog_hash
+
dataset_hashes
+
decision–execution linkage
```

Tampoco se observó una instancia:

```text
AUTH-DB-032::GLOBAL
```

materializada.

---

#### 12. Principio de autoridad

El schema `audit`:

```text
CONSERVA EVIDENCIA
```

pero nunca:

```text
REDEFINE EL HECHO
REDEFINE EL ACTOR
REDEFINE EL PERMISO
REDEFINE EL RECURSO
REDEFINE EL RESULTADO EMPRESARIAL
```

El owner schema del recurso continúa siendo fuente de verdad.

---

#### 13. Identidad del registro principal

Se congela:

```text
audit.authorization_decisions
```

Clase:

```text
AUDIT_ENTRY
```

Responsabilidad:

> conservar una representación durable, privada, indexable e inmutable de cada `AuthorizationDecision@1.0.0` que alcance la frontera persistente canónica.

---

#### 14. Clave de `authorization_decisions`

La clave lógica es:

```text
decision_id
```

Reglas:

1. no se genera otra identidad empresarial para sustituirla;
2. no se deriva de actor;
3. no se deriva de recurso;
4. no se deriva de permiso;
5. no se reutiliza;
6. no es bearer token;
7. la PK física conserva el valor exacto emitido por la decisión.

---

#### 15. Columnas mínimas de `authorization_decisions`

La relación debe poder materializar, como mínimo:

```text
decision_id
decision_contract_version
decision_schema_version
decision_record_fingerprint
decided_at
recorded_at
correlation_id
context_id
principal_id
actor_id
device_id
app_code
permission_key
operation_kind
request_source
resource_type
resource_ids
outcome
authorizing_lanes
authorization_reason_codes
context_fingerprint
resource_fingerprint
catalog_hash
dataset_hashes
evaluator_name
evaluator_version
evidence_storage_mode
decision_payload
sensitivity_class
retention_class
source_contract_sha256
```

Los nombres finales permanecen en inglés, ASCII y `lower_snake_case`.

---

#### 16. `recorded_at`

`recorded_at` representa:

```text
momento en que audit persistió el registro
```

No reemplaza:

```text
decided_at
```

Debe cumplirse:

```text
recorded_at >= decided_at
```

salvo una tolerancia técnica explícitamente aprobada por el contrato temporal.

---

#### 17. Igualdad obligatoria de `decision_id`

Se valida:

```text
AuthorizationDecision.decision_id
=
AuthorizationDecision.audit.decision_id
=
authorization_decisions.decision_id
```

Una discrepancia es corrupción contractual.

No se corrige escogiendo uno de los valores.

---

#### 18. Igualdad de `correlation_id`

Cuando exista:

```text
root correlation_id
=
audit correlation_id
=
persisted correlation_id
```

`null` conserva el significado aprobado.

No se inventa retrospectivamente una correlación distinta.

---

#### 19. Identidad de actor

La fila persistida conserva las identidades exactas del audit context:

```text
principal_id
actor_id
device_id
```

Reglas:

- `actor_id` no se deriva de `principal_id`;
- `device_id` no se deriva de User-Agent;
- un dispositivo no sustituye al humano;
- `null` conserva significado contractual;
- una discrepancia con `access_context_ref` bloquea inserción.

---

#### 20. Aplicación y permiso

Debe cumplirse:

```text
persisted app_code
=
AuthorizationDecision.request.app_code
=
AuthorizationDecision.audit.app_code
```

y:

```text
persisted permission_key
=
AuthorizationDecision.request.permission_key
=
AuthorizationDecision.audit.permission_key
```

No se normaliza una contradicción.

---

#### 21. Recurso

La relación principal conserva:

```text
resource_type
resource_ids
resource_fingerprint
```

`resource_ids`:

- se deduplica;
- se ordena determinísticamente;
- puede ser vacío cuando el contrato lo permite;
- no se rellena con IDs inferidos;
- nunca se usa como autorización posterior.

---

#### 22. Outcome

Solo se persiste como decisión real:

```text
ALLOW
DENY
```

Queda prohibido almacenar en `authorization_decisions.outcome`:

```text
TECHNICAL_FAILURE
UNKNOWN
MAYBE
INDETERMINATE
WOULD_ALLOW
WOULD_DENY
```

---

#### 23. Authorizing lanes

Se conserva:

```text
authorizing_lanes
```

Invariantes:

```text
ALLOW
→ al menos una lane autorizante válida

DENY
→ authorizing_lanes = []
```

El valor persistido debe ser idéntico al audit context.

---

#### 24. Reason codes

Se conserva la colección de razones aplicables a la decisión.

Reglas:

- orden determinista;
- códigos del catálogo vigente;
- sin texto SQL;
- sin stacktrace;
- sin nombres privados de tablas;
- sin copy humano como fuente de identidad;
- sin códigos inventados por persistencia.

---

#### 25. Hashes y fingerprints

La fila conserva:

```text
context_fingerprint
resource_fingerprint
catalog_hash
dataset_hashes
decision_record_fingerprint
```

Cada identidad conserva preimagen y significado separados.

No se reutiliza un hash para representar otro objeto.

---

#### 26. `decision_record_fingerprint`

Se define como fingerprint técnico de la representación persistida.

Formato:

```text
sha256:
+
64 caracteres hexadecimales minúsculos
```

No forma parte de `AuthorizationDecision@1.0.0`.

No se expone como autoridad.

Su finalidad es:

- detectar corrupción;
- validar reintentos idempotentes;
- detectar mutación indebida;
- validar restore;
- validar archive.

---

#### 27. Preimagen de `decision_record_fingerprint`

Incluye la representación persistida canonicalizada de:

- identidad contractual;
- decision_id;
- decided_at;
- correlation;
- audit context;
- request identity;
- outcome;
- reasons;
- hashes;
- evidence storage mode;
- payload persistido cuando exista.

Excluye:

- `recorded_at`;
- ubicación física;
- partición;
- métricas;
- nodo;
- timestamps de backup;
- metadata de delivery.

---

#### 28. Canonicalización

La preimagen utiliza:

```text
vento.canonical-json@1.0.0
```

No se considera suficiente:

```text
jsonb::text
```

La persistencia reutiliza la primitiva canónica ya gobernada por AUTH.

---

#### 29. `decision_payload`

`decision_payload` es privado.

Puede contener la `AuthorizationDecision@1.0.0` completa cuando el perfil de evidencia lo exige.

No cruza directamente:

```text
api
frontend
Data API
cliente móvil
```

No se usa como prueba de autorización futura.

---

#### 30. Modos de evidencia persistida

Se congelan dos modos físicos:

```text
AUDIT_ANCHOR
FULL_DECISION
```

`AUDIT_ANCHOR`:

- persiste todos los campos mínimos de auditoría y búsqueda;
- conserva hashes y referencias;
- no conserva necesariamente el árbol completo de matched evidence.

`FULL_DECISION`:

- conserva además `decision_payload` completo;
- permanece privado;
- aplica minimización y retención.

---

#### 31. Política inicial por categoría

La persistencia distingue las categorías ya previstas por AUTH-CTX-024:

| Categoría         | Modo mínimo     |
| ----------------- | --------------- |
| navegación        | `AUDIT_ANCHOR`  |
| UI guard          | `AUDIT_ANCHOR`  |
| lectura ordinaria | `AUDIT_ANCHOR`  |
| agregado          | `AUDIT_ANCHOR`  |
| lectura sensible  | `FULL_DECISION` |
| exportación       | `FULL_DECISION` |
| soporte           | `FULL_DECISION` |
| mutación          | `FULL_DECISION` |

Una política posterior puede escalar `AUDIT_ANCHOR` a `FULL_DECISION`.

Nunca puede reducir una categoría obligatoria sin nueva decisión contractual.

---

#### 32. Clasificación server-side

El caller no declara libremente:

```text
evidence_storage_mode
retention_class
sensitivity_class
persistence_category
```

La clasificación se resuelve server-side usando:

- `operation_kind`;
- `request_source`;
- modo de recurso;
- sensibilidad del permiso;
- sensibilidad del recurso;
- contrato de consumidor cuando aplique;
- política de auditoría activa.

---

#### 33. Registro de política de persistencia

Se congela:

```text
audit.authorization_decision_persistence_policies
```

Responsabilidad:

> materializar la política versionada de clasificación y profundidad de evidencia sin convertirla en autorización empresarial.

Campos mínimos:

```text
policy_version
category
evidence_storage_mode
sensitivity_floor
retention_class
source_contract_fingerprint
status
activated_at
superseded_at
```

---

#### 34. Estados de policy

Se permiten:

```text
INSTALLED
ACTIVE
SUPERSEDED
BLOCKED
```

Debe existir exactamente una policy `ACTIVE` aplicable.

Una policy ausente o ambigua bloquea la persistencia que dependa de ella.

---

#### 35. `retention_class`

Todo registro durable declara:

```text
retention_class
```

032 no inventa periodos en días.

Los periodos exactos, legal hold, partición, archivo y disposición se consumen desde `SUPA-ARC-022`.

---

#### 36. Legal hold

Un legal hold:

- impide disposición destructiva;
- no cambia outcome;
- no cambia decision_id;
- no cambia el contenido histórico;
- no autoriza lectura;
- no convierte audit en fuente empresarial.

La gestión física del hold pertenece a la capa transversal de retención.

---

#### 37. Inmutabilidad

`authorization_decisions` es append-only.

Queda prohibido para runtime:

```text
UPDATE
DELETE
UPSERT que cambie contenido
```

Una corrección de realidad produce:

```text
nueva evaluación
+
nuevo decision_id
```

No edita la decisión anterior.

---

#### 38. Reintento idempotente de persistencia

Si se intenta persistir nuevamente el mismo `decision_id`:

```text
mismo decision_record_fingerprint
→ retorno idempotente del registro existente

fingerprint diferente
→ INTEGRITY_CONFLICT
→ fail closed
```

No se aplica last-write-wins.

---

#### 39. Relación de recursos

Se congela:

```text
audit.authorization_decision_resources
```

Clase:

```text
AUDIT_LINK
```

Finalidad:

- indexar recursos de forma relacional;
- soportar búsqueda por resource;
- evitar depender de scan de arrays;
- conservar orden y deduplicación.

---

#### 40. Columnas mínimas de resource link

```text
decision_id
resource_ordinal
resource_type
resource_id
resource_fingerprint
decided_at
recorded_at
link_fingerprint
```

La colección de filas debe ser exactamente equivalente al `resource_ids` persistido en la decisión.

---

#### 41. Resource draft sin ID

Cuando un draft legítimo aún no tenga `resource_id`:

```text
resource_ids = []
```

puede ser válido.

La evidencia continúa mediante:

```text
resource_type
resource_fingerprint
decision_id
```

No se inventa un UUID temporal para aparentar persistencia empresarial.

---

#### 42. Dedupe de recursos

Dentro de una misma decisión:

```text
resource_type + resource_id
```

no se duplica.

El ordinal conserva el orden determinista del contrato.

---

#### 43. Vínculo decisión–ejecución

Se congela:

```text
audit.authorization_decision_links
```

Clase:

```text
AUDIT_LINK
```

Responsabilidad:

> enlazar una decisión ya persistida con las identidades durables que demuestran qué comando, resultado, evento, error, compensación, reconciliación o audit entry siguió a esa decisión.

---

#### 44. Link kinds

Se congela el vocabulario:

```text
COMMAND
EXECUTION_RESULT
BUSINESS_EVENT
ERROR
COMPENSATION
RECONCILIATION
AUDIT_ENTRY
```

No se usa un `link_kind` libre.

Un nuevo tipo exige evolución contractual.

---

#### 45. Columnas mínimas del vínculo

```text
decision_link_id
decision_id
link_kind
reference_type
reference_id
process_id
process_instance_id
correlation_id
causation_id
occurred_at
recorded_at
result_code
result_reference
error_class
expected_resource_version
observed_resource_version
idempotency_key_reference
link_fingerprint
```

Los campos no aplicables permanecen `null` de forma explícita según shape físico.

---

#### 46. `decision_link_id`

`decision_link_id` identifica únicamente el vínculo.

No sustituye:

- decision_id;
- command_id;
- event_id;
- effect_id;
- process_instance_id.

Puede generarse como UUID técnico del servidor.

---

#### 47. Link no crea el hecho

Un link:

```text
decision_id
→ BUSINESS_EVENT
```

afirma que existe una relación auditada.

No afirma por sí solo que:

- el evento sea válido;
- el efecto haya ocurrido;
- el recurso tenga un nuevo estado;
- la operación deba repetirse.

El owner del hecho continúa siendo la fuente.

---

#### 48. Vínculo previo a efecto

Antes de iniciar una mutación sensible debe existir:

```text
AuthorizationDecision persistida
+
referencia al command o execution intent cuando el proceso la tenga
```

La falta de persistencia obligatoria bloquea el efecto.

---

#### 49. Vínculo posterior a efecto

Después de un efecto confirmado se agrega un vínculo nuevo hacia:

- resultado;
- business event;
- audit entry;
- effect record;

según corresponda.

No se actualiza el link previo.

---

#### 50. Concurrencia

Cuando una ejecución valida una versión:

```text
expected_resource_version
observed_resource_version
```

se conservan en el vínculo aplicable o en la evidencia propietaria enlazada.

Un conflicto de concurrencia no reutiliza la decisión para un segundo intento.

---

#### 51. Stale antes de ejecutar

Si el contexto o recurso cambia antes del efecto:

```text
decisión histórica
→ permanece

ejecución
→ rechazada

retry
→ nueva evaluación
→ nuevo decision_id
```

No se edita la decisión anterior para convertirla en DENY.

---

#### 52. Idempotencia de ejecución

`idempotency_key_reference`:

- es una referencia;
- no contiene el secreto o payload original;
- no sustituye decision_id;
- no permite reusar una decisión stale;
- no convierte fallo técnico en éxito.

---

#### 53. Resultado desconocido

Si una falla ocurre después de que un efecto pudo empezar y la atomicidad no puede demostrarse:

```text
NO afirmar effects_committed = false
NO crear TECHNICAL_FAILURE pre-efecto falso
→ ERROR / RECONCILIATION link
→ proceso propietario
```

La conciliación no altera la decisión original.

---

#### 54. Separación de fallos técnicos

Un fallo técnico previo a producir una decisión válida no se inserta en:

```text
audit.authorization_decisions
```

No obtiene:

```text
decision_id
outcome = DENY
authorizing_lanes
matched evidence
```

Utiliza la familia de `AUTH-ERR-019`.

---

#### 55. Relación de fallos técnicos

Se congela:

```text
audit.authorization_evaluation_failures
```

Clase:

```text
AUDIT_ENTRY
```

Identidad:

```text
evaluation_attempt_id
```

No contiene columna autoritativa `decision_id`.

---

#### 56. Forma mínima de technical failure

La fila debe poder conservar:

```text
evaluation_attempt_id
correlation_id
support_code
request_source
consumer_id
app_code
permission_key
operation_kind
failure_stage
private_failure_family
sanitized_provider_code
source_status
retry_count
retry_budget
duration_ms
source_versions
source_fingerprints
session_preserved
effects_committed
occurred_at
recorded_at
failure_fingerprint
sensitivity_class
retention_class
```

---

#### 57. Invariantes del technical failure

Debe cumplirse:

```text
source_status = UNAVAILABLE
session_preserved = true
effects_committed = false
```

para el fallo técnico pre-efecto gobernado por esta tabla.

No incrementa métricas de DENY.

No se presenta como falta de permiso.

---

#### 58. `permission_key` privada en fallo técnico

La evidencia privada puede conservar el permiso exacto cuando sea necesario para diagnóstico.

La proyección humana no lo expone por defecto.

No se usa para construir un decision_id retroactivo.

---

#### 59. Intentos técnicos

Se congela:

```text
audit.authorization_evaluation_failure_attempts
```

Clase:

```text
AUDIT_ENTRY
```

Finalidad:

> conservar cada intento interno perteneciente al mismo `evaluation_attempt_id` sin convertir cada retry en una decisión.

---

#### 60. Clave de failure attempt

Clave lógica:

```text
evaluation_attempt_id
+
attempt_ordinal
```

`attempt_ordinal`:

- empieza en 1;
- aumenta monotónicamente;
- no se reutiliza;
- no puede superar el presupuesto observado sin marcar inconsistencia.

---

#### 61. Campos mínimos del intento

```text
evaluation_attempt_id
attempt_ordinal
source_key
started_at
completed_at
duration_ms
sanitized_provider_code
retryable
retry_after_seconds
attempt_result
attempt_fingerprint
```

No contiene secrets ni raw provider payload.

---

#### 62. Retry

Un retry técnico:

```text
mismo evaluation_attempt_id
+
otro attempt_ordinal
```

Una nueva solicitud del usuario:

```text
nuevo evaluation_attempt_id
```

No se mezclan.

---

#### 63. Fallo del propio audit store

Si la dependencia de persistencia obligatoria no está disponible:

```text
NO SE PUEDE REGISTRAR UNA DECISIÓN DURABLE
→ NO SE LIBERA LA DECISIÓN COMO EJECUTABLE
→ NO SE INICIA EFECTO
```

Si el propio store de auditoría está caído, no se exige que la misma base registre mágicamente su propia indisponibilidad.

La evidencia de infraestructura utiliza observabilidad externa y correlation/support code cuando esté disponible.

---

#### 64. Primitive de append de decisión

Se congela:

```text
audit.append_authorization_decision(jsonb) → text
```

Argumento lógico:

```text
decision
```

No acepta:

- actor override;
- retention override;
- evidence mode override;
- outcome override;
- decided_at override;
- fingerprint suministrado como autoridad.

---

#### 65. Validaciones de append

Antes de insertar:

1. valida contract family;
2. valida version;
3. valida schema version;
4. valida outcome;
5. valida audit no nulo;
6. valida decision_id;
7. valida correlation;
8. valida actor/principal/device;
9. valida app y permission;
10. valida resource;
11. valida authorizing lanes;
12. valida fingerprints;
13. valida evaluator;
14. resuelve persistence profile;
15. canonicaliza;
16. calcula record fingerprint;
17. inserta decisión;
18. inserta resource links;
19. comprueba equivalencia.

Todo ocurre atómicamente.

---

#### 66. Seguridad de append

`audit.append_authorization_decision(jsonb)` es:

```text
VOLATILE
SECURITY DEFINER
```

por tratarse de una frontera privada de escritura sin grants directos a tablas.

Requiere:

- owner técnico no interactivo;
- `search_path` fijo;
- objetos totalmente calificados;
- `PUBLIC EXECUTE` revocado;
- `anon` sin execute;
- `authenticated` sin execute;
- grant exacto solo a llamadores técnicos aprobados;
- cero SQL dinámico abierto.

---

#### 67. Primitive de link

Se congela:

```text
audit.append_authorization_decision_link(jsonb) → text
```

Argumento lógico:

```text
link
```

Valida:

- decision existente;
- correlation compatible;
- link kind válido;
- referencia no vacía;
- timestamps;
- idempotency reference;
- versiones cuando apliquen;
- link fingerprint;
- duplicado idempotente.

---

#### 68. Primitive de technical failure

Se congela:

```text
audit.append_authorization_evaluation_failure(jsonb) → text
```

Acepta exclusivamente una evidencia técnica compatible con:

```text
AUTHORIZATION-TECHNICAL-UNAVAILABILITY-CONTRACT-001@1.0.0
```

No acepta `AuthorizationDecision`.

---

#### 69. Primitive de failure attempt

Se congela:

```text
audit.append_authorization_evaluation_failure_attempt(jsonb) → text
```

No finaliza por sí solo el evaluation attempt.

Solo registra un intento técnico.

---

#### 70. Trigger de inmutabilidad

Se congela:

```text
audit.reject_authorization_record_mutation()
```

Clase:

```text
TRIGGER_FUNCTION
```

Se aplica a las relaciones append-only de 032 para rechazar:

```text
UPDATE
DELETE
```

por interfaces ordinarias.

---

#### 71. Retención no usa UPDATE histórico

La expiración por política no modifica el contenido de una decisión.

Archivado y disposición utilizan la estrategia de `SUPA-ARC-022`, incluyendo particiones cuando corresponda.

No se crea:

```text
is_deleted = true
```

como sustituto universal de retención.

---

#### 72. Resolver de persistence profile

Se congela:

```text
app_private.resolve_authorization_persistence_profile(jsonb) → jsonb
```

Entrada:

```text
AuthorizationDecision completa
```

Salida mínima:

```text
policy_version
category
evidence_storage_mode
sensitivity_class
retention_class
audit_commit_class
```

`audit_commit_class` para la ancla de decisión es:

```text
AUDIT_ATOMIC_REQUIRED
```

---

#### 73. Coordinador persistente

Se congela:

```text
app_private.evaluate_and_record_authorization(jsonb) → jsonb
```

Responsabilidad:

```text
1. invocar app_private.evaluate_authorization exactamente una vez;
2. validar una AuthorizationDecision completa;
3. persistirla mediante audit.append_authorization_decision;
4. devolver la misma decisión completa al llamador interno;
5. no ejecutar el efecto empresarial.
```

No evalúa simulación.

---

#### 74. Naturaleza del coordinador

`app_private.evaluate_and_record_authorization(jsonb)` es:

```text
VOLATILE
SECURITY DEFINER
INTERNAL_COORDINATOR
```

No recibe grants cliente.

No sustituye al evaluator.

No duplica su lógica.

---

#### 75. Regla de no escape

Si:

```text
evaluate_authorization
→ produce decisión válida
```

pero:

```text
append_authorization_decision
→ falla
```

entonces:

```text
evaluate_and_record_authorization
→ falla
→ la decisión no se devuelve como ejecutable
```

Esta es la aplicación directa de `AUDIT_ATOMIC_REQUIRED`.

---

#### 76. Wrapper seguro existente

La firma pública segura permanece:

```text
api.get_safe_authorization_decision(jsonb) → jsonb
```

032 no cambia su request ni su response.

Su ruta interna objetivo pasa a ser:

```text
evaluate_and_record_authorization
→ project_safe_authorization_decision
→ response
```

en lugar de:

```text
evaluate_authorization
→ project
```

sin ancla durable.

---

#### 77. Decisión segura no reutilizable

Aunque el wrapper seguro devuelva:

```text
outcome = ALLOW
```

el cliente no puede enviarlo después como:

```text
authorization_proof
decision_token
capability_token
```

La mutación reevalúa dentro de su frontera.

---

#### 78. RLS y side effects

Queda prohibido insertar auditoría desde una policy RLS por cada fila.

El predicado RLS:

```text
app_private.authorization_policy_allows(jsonb)
```

permanece side-effect free.

---

#### 79. Preflight para operaciones RLS auditables

Cuando una operación mediante Data API/RLS requiera evidencia de decisión:

```text
preflight autoritativo
→ persistir decisión una vez
→ ejecutar consulta o mutación
→ RLS verifica paridad
```

La policy no se convierte en writer.

Una superficie que no pueda cumplir esta frontera permanece sin migración canónica hasta que `AUTH-DB-021` y su consumidor propietario resuelvan el patrón.

---

#### 80. Adopción RPC

Una RPC sensible futura usa:

```text
evaluate_and_record_authorization
→ ALLOW
→ concurrency/idempotency
→ efecto
→ append_authorization_decision_link
```

La adopción concreta pertenece a `AUTH-DB-006` a `AUTH-DB-010`.

---

#### 81. Consulta por `decision_id`

Se congela:

```text
audit.get_authorization_decision(text) → jsonb
```

Argumento:

```text
decision_id
```

Devuelve una proyección privada para un llamador técnico autorizado.

No es Data API pública.

---

#### 82. Búsqueda privada

Se congela:

```text
audit.search_authorization_decisions(jsonb)
```

La búsqueda admite exclusivamente filtros estructurados cerrados.

No acepta SQL, predicate, order expression ni nombre de columna libres.

---

#### 83. Filtros de búsqueda permitidos

La request de búsqueda puede expresar:

```text
decision_id
correlation_id
actor_id
principal_id
device_id
app_code
permission_key
resource_type
resource_id
outcome
decided_from
decided_to
limit
cursor
```

Los filtros pueden reducir el conjunto.

No amplían la autorización del llamador.

---

#### 84. Límites de búsqueda

Toda búsqueda:

- exige límite;
- usa paginación por cursor estable;
- tiene orden determinista;
- impone ventana temporal cuando el volumen lo exija;
- no permite scan ilimitado por cliente;
- no admite wildcard sobre IDs sensibles;
- no devuelve decision_payload por defecto.

---

#### 85. Búsqueda por correlación

Debe poder resolverse:

```text
correlation_id
→ decisiones
→ links
→ errores
→ eventos
→ resultados
```

La correlación no concede derecho a ver esos registros.

---

#### 86. Búsqueda por actor

Las búsquedas por:

```text
actor_id
principal_id
device_id
```

son sensibles.

Solo se ejecutan dentro de una finalidad autorizada.

No se exponen a un trabajador como mecanismo de enumeración.

---

#### 87. Búsqueda por permiso

Debe soportarse:

```text
app_code
+
permission_key
+
rango temporal
```

para investigación y paridad.

No se expone el catálogo completo por consecuencia.

---

#### 88. Búsqueda por recurso

`authorization_decision_resources` soporta:

```text
resource_type
+
resource_id
+
rango temporal
```

sin scan del `decision_payload`.

---

#### 89. Consulta de links

Se congela:

```text
audit.list_authorization_decision_links(text)
```

Retorna los vínculos autorizados de un `decision_id`.

No sigue recursivamente referencias hacia owner schemas sin otro contrato de consulta.

---

#### 90. Exposición mediante `api`

032 no crea una RPC de búsqueda de auditoría ejecutable por `authenticated`.

Motivo:

- el permiso exacto de una superficie administrativa debe pertenecer a su contrato consumidor;
- la finalidad y territorio deben ser explícitos;
- una función genérica de auditoría sería una superficie de enumeración.

La infraestructura privada queda lista para que la tarea consumidora cree una proyección `api` mínima y autorizada.

---

#### 91. Acceso directo cliente

Objetivo:

```text
PUBLIC → 0
anon → 0
authenticated → 0
```

sobre:

- tablas;
- sequences;
- functions privadas de audit;
- raw decision payloads.

---

#### 92. `service_role`

`service_role` no recibe:

```text
SELECT ALL
INSERT ALL
UPDATE ALL
DELETE ALL
EXECUTE ALL
```

por defecto.

Cualquier acceso técnico se concede por firma y finalidad exactas.

No crea autoridad empresarial.

---

#### 93. Owner técnico

El owner físico:

- es no interactivo;
- no es una cuenta humana;
- se resuelve desde la política de roles aprobada al materializar;
- no se inventa si el inventario no ofrece uno compatible.

La ausencia de owner válido bloquea la migration.

---

#### 94. `search_path`

Funciones privilegiadas de 032 usan un `search_path` fijo y mínimo.

Referencia objetivo:

```text
pg_catalog, audit, app_private
```

Las dependencias empresariales y técnicas continúan totalmente calificadas.

No se confía en resolución incidental por orden de schemas.

---

#### 95. SQL dinámico

032 no necesita SQL dinámico abierto.

Queda prohibido construir:

- relation names;
- column names;
- order clauses;
- predicates;
- function names;

desde strings del caller.

---

#### 96. RLS de defensa en profundidad

Las tablas de 032 habilitan RLS conforme a la política objetivo.

No existen policies que concedan acceso directo a:

```text
anon
authenticated
```

La escritura ocurre mediante funciones privadas controladas.

---

#### 97. FORCE RLS y owners

La migration debe comprobar explícitamente:

- owner PostgreSQL;
- `BYPASSRLS`;
- `FORCE ROW LEVEL SECURITY` cuando aplique;
- comportamiento de funciones `SECURITY DEFINER`;
- privilegios de mantenimiento.

No se asume que `ENABLE RLS` por sí solo controla al owner.

---

#### 98. ACL por defecto

La materialización debe verificar que la creación de funciones nuevas no reintroduzca:

```text
PUBLIC EXECUTE
```

y que nuevas tablas no reciban grants cliente por defaults históricos.

La evidencia registra ACL antes y después.

---

#### 99. Persistencia y Data API

El schema `audit` no se agrega a:

```text
api.schemas
extra_search_path
```

como efecto de 032.

Las consultas futuras atraviesan contratos `api` específicos.

---

#### 100. Integridad de `decision_payload`

Cuando `evidence_storage_mode = FULL_DECISION`:

1. `decision_payload` no es null;
2. pasa el schema contractual;
3. decision_id coincide;
4. outcome coincide;
5. audit coincide;
6. hashes coinciden;
7. evaluator coincide;
8. canonical fingerprint coincide.

---

#### 101. Integridad de `AUDIT_ANCHOR`

Cuando:

```text
evidence_storage_mode = AUDIT_ANCHOR
```

se exige:

- `decision_payload` no requerido;
- audit context completo;
- root identity/version;
- request identity;
- final outcome;
- reason codes;
- hashes;
- evaluator;
- resource links;
- record fingerprint.

No se degrada a un log textual.

---

#### 102. Dataset hashes

`dataset_hashes` conserva exactamente los datasets materialmente consultados.

Incluye dataset válido con:

```text
matches = []
```

si fue consultado.

No incluye dataset `NOT_APPLICABLE`.

---

#### 103. Historial y versiones

Una decisión histórica se interpreta contra:

```text
decision_contract_version
decision_schema_version
catalog_hash
dataset_hashes
evaluator_name
evaluator_version
source_contract_sha256
```

Nunca se reinterpreta con el catálogo actual como si hubiera sido evaluada hoy.

---

#### 104. Corrección de una decisión

Una nueva realidad o corrección de datos produce:

```text
nueva evaluación
+
nuevo decision_id
```

La relación histórica anterior permanece intacta.

Si se requiere documentar una brecha del registro:

```text
AUDIT_CORRECTION
```

de la capa transversal enlaza la evidencia sin modificar el original.

---

#### 105. Simulación

Una simulación no se inserta como decisión real en:

```text
audit.authorization_decisions
```

`AUTH-DB-013` conserva su auditoría propia.

Queda prohibido:

```text
WOULD_ALLOW → ALLOW
WOULD_DENY → DENY
```

durante persistencia.

---

#### 106. Cambio de permisos

La auditoría de crear, modificar o retirar grants/denies pertenece a:

```text
AUTH-DB-012
```

032 puede vincular una decisión que autorizó ese cambio.

No reemplaza el audit trail del cambio de configuración.

---

#### 107. Auditoría de dispositivos

El ciclo de vida del dispositivo pertenece a:

```text
AUTH-DB-014
```

032 conserva `device_id` cuando participó en la decisión.

No registra altas, revocaciones o rotaciones como si fueran decisiones.

---

#### 108. SYSTEM

Una decisión `SYSTEM` persistida conserva:

- principal técnico;
- actor de sistema;
- app;
- permiso;
- recurso;
- delegación o proceso aplicable;
- hashes;
- evaluator.

`service_role` por sí solo no satisface esas identidades.

---

#### 109. Denegaciones

Una `DENY` válida:

- se persiste como decisión;
- tiene decision_id;
- tiene audit context;
- conserva razones;
- no tiene authorizing lanes;
- no inicia efecto.

No se confunde con error técnico.

---

#### 110. Technical failure

Un `TECHNICAL_FAILURE`:

- usa evaluation_attempt_id;
- no usa decision_id;
- preserva sesión;
- no inicia efecto;
- puede tener retries internos;
- genera evidencia técnica separada;
- no incrementa deny rate.

---

#### 111. Métricas separadas

Mínimo:

```text
authorization_decisions_persisted_total
authorization_decision_persistence_error_total
authorization_decision_links_total
authorization_decision_integrity_conflict_total
authorization_evaluation_failures_persisted_total
authorization_evaluation_failure_attempts_total
authorization_audit_query_total
authorization_audit_query_denied_total
authorization_audit_query_latency
authorization_decision_payload_bytes
```

Se separan métricas ALLOW, DENY y TECHNICAL_FAILURE.

---

#### 112. Dimensiones de métricas

Pueden utilizarse:

- app;
- operation kind;
- request source;
- outcome;
- evidence mode;
- persistence category;
- evaluator version;
- contract version.

No usar como label de alta cardinalidad:

- decision_id;
- actor_id;
- resource_id;
- correlation_id.

---

#### 113. Logs

Logs técnicos pueden registrar:

```text
correlation_id
decision_id protegido
evaluation_attempt_id protegido
operation
outcome o technical failure
persistence mode
latency
record fingerprint prefix
```

No registran payload completo.

---

#### 114. Datos prohibidos en logs

No incluir:

- JWT;
- refresh token;
- password;
- PIN;
- raw credential;
- decision_payload;
- matched grants completos;
- matched denies completos;
- datos personales innecesarios;
- documentos;
- SQL sensible;
- stack traces expuestos a cliente.

---

#### 115. Sensibilidad

Todo registro declara `sensitivity_class`.

La sensibilidad:

- controla lectura;
- controla proyección;
- influye en evidencia;
- influye en retención;
- no cambia outcome;
- no concede autoridad.

---

#### 116. Redacción

La persistencia privada conserva únicamente datos necesarios para reconstrucción.

Campos descriptivos de personas o recursos se sustituyen por:

- IDs;
- referencias;
- hashes;
- códigos canónicos.

No se almacenan nombres humanos por conveniencia.

---

#### 117. `before` y `after`

032 no persiste snapshots genéricos completos `before`/`after`.

Cuando el vínculo de ejecución necesite evidencia de versión, utiliza:

```text
expected_resource_version
observed_resource_version
result_reference
```

El owner schema conserva el hecho.

---

#### 118. Eventos transversales

Una decisión puede vincularse a:

```text
BUSINESS_EVENT
```

pero 032 no crea el `BUSINESS_EVENT_RECORD` genérico.

Cuando el evento exista:

```text
decision link
→ event_id
```

y el evento conserva su propio contrato.

---

#### 119. Outbox

032 no crea:

- outbox;
- emission attempts;
- delivery attempts;
- inbox;
- consumer effects.

Si una operación produce un business event, la atomicidad del outbox pertenece al contrato transversal correspondiente.

---

#### 120. Correlation chain

Debe poder reconstruirse:

```text
request
→ context
→ decision
→ command
→ execution result
→ business event
→ error o compensation
```

mediante:

- correlation_id;
- causation_id;
- typed links;
- referencias propietarias.

---

#### 121. Causalidad

`correlation_id` agrupa.

`causation_id` identifica causa inmediata.

No se usa timestamp como única prueba de causalidad.

---

#### 122. Tiempo

Persistencia usa UTC para instantes técnicos.

Cuando la zona local sea material, se conserva mediante la evidencia propietaria correspondiente.

No se convierte `America/Bogota` en universal de todos los dominios.

---

#### 123. Retención

032 almacena `retention_class`.

No fija días.

No ejecuta borrado por antigüedad.

La disposición consume el contrato de `SUPA-ARC-022`.

---

#### 124. Archivado

El archivado debe preservar:

- decision_id;
- correlation;
- actor/principal/device refs;
- resource refs;
- hashes;
- links;
- integrity fingerprint;
- versión contractual;
- búsqueda investigativa autorizada.

No rompe FKs o referencias sin estrategia.

---

#### 125. Restore

Después de restore se valida:

```text
record counts
decision_id uniqueness
fingerprints
resource-link equality
decision-link integrity
technical-failure separation
policy version
ACL
RLS
search results
```

No se reevalúan decisiones históricas para “regenerarlas”.

---

#### 126. Backup

`AUTH-DB-029` cubre el backup/restore físico aplicable.

032 añade a su inventario:

- relaciones de decisión;
- relaciones de fallos;
- policy de persistencia;
- funciones;
- triggers;
- constraints;
- indexes;
- ACL;
- RLS;
- fingerprints.

---

#### 127. Partition readiness

Las relaciones de alto crecimiento se diseñan para permitir partición temporal según `SUPA-ARC-021` y `SUPA-ARC-022`.

032 no inventa un intervalo de partición independiente.

La migration física consume el intervalo aprobado vigente.

---

#### 128. Query patterns obligatorios

La estrategia física debe soportar de forma eficiente:

```text
decision_id
correlation_id + time
actor_id + time
principal_id + time
device_id + time
app_code + permission_key + time
resource_type + resource_id + time
outcome + time
evaluation_attempt_id
technical failure stage + time
```

---

#### 129. Índices

Los índices exactos se seleccionan según `SUPA-ARC-021` y evidencia de planes.

Obligaciones:

- PK por decision_id;
- unicidad de failure identity;
- acceso por correlation;
- acceso por actor/principal/device;
- acceso por permission;
- acceso por resource child relation;
- acceso temporal;
- acceso por technical failure;
- evitar índices redundantes.

---

#### 130. Planes de ejecución

La futura instancia captura `EXPLAIN` o evidencia equivalente para las búsquedas críticas.

No se certifica rendimiento únicamente porque exista un índice.

---

#### 131. Límites

La búsqueda privada aplica un máximo de resultados por página.

El valor físico exacto se fija en la implementación conforme a la política vigente y benchmark.

No existe búsqueda ilimitada por omisión.

---

#### 132. Paginación

La paginación usa cursor estable derivado de:

```text
decided_at
+
decision_id
```

o una clave equivalente que preserve orden total.

No usa `OFFSET` profundo como estrategia canónica para grandes historiales.

---

#### 133. Atomicidad de append principal

La inserción de:

```text
authorization_decisions
+
authorization_decision_resources
```

ocurre en una sola transacción.

No puede existir resource link sin decisión.

No puede declararse éxito si faltan resource links obligatorios.

---

#### 134. Atomicidad de mutación protegida

Para un comando sensible:

```text
BEGIN
  evaluate_and_record_authorization
  if DENY → rollback effect / no effect
  validate expected resource version
  execute owner command
  append decision link
  owner event/outbox when applicable
COMMIT
```

La decisión no ejecuta el comando por sí sola.

---

#### 135. Lectura sensible

Para una lectura que exige evidencia durable antes de responder:

```text
evaluate_and_record_authorization
→ persist FULL_DECISION
→ ejecutar consulta
→ devolver proyección autorizada
```

Si audit persistence falla:

```text
NO RESPUESTA EXITOSA
```

cuando la clase de compromiso así lo exige.

---

#### 136. Navegación y UI guard

Estas decisiones siguen produciendo audit context y ancla durable.

El modo inicial mínimo puede ser:

```text
AUDIT_ANCHOR
```

No se usa la ausencia de full payload para omitir la decisión.

---

#### 137. Agregados

Una decisión sobre agregado conserva:

- aggregate/resource fingerprint;
- filtros autorizados;
- resource type;
- decision identity;
- audit evidence.

No guarda como audit payload toda la colección subyacente.

---

#### 138. Exportación

Exportación usa como mínimo:

```text
FULL_DECISION
```

y exige vínculo con el resultado/export artifact cuando se materialice.

El archivo exportado no se almacena dentro del decision payload.

---

#### 139. Soporte

Una operación de soporte sensible:

- usa FULL_DECISION;
- conserva finalidad;
- conserva actor real;
- conserva recurso;
- conserva correlation;
- no obtiene privilegio por ser soporte.

---

#### 140. Mutaciones

CREATE, UPDATE, DELETE, EXECUTE y TRANSITION que produzcan efectos utilizan:

```text
FULL_DECISION
```

como modo mínimo inicial.

No se reduce a anchor-only durante la ventana de ejecución.

---

#### 141. Query authorization

Las funciones privadas de búsqueda no deciden por sí mismas si el usuario final puede consultar auditoría.

La autorización se resuelve antes mediante el evaluator canónico.

La función recibe una solicitud ya acotada desde un llamador técnico autorizado.

---

#### 142. Anti-enumeración

Una búsqueda no autorizada no distingue públicamente:

- decisión inexistente;
- decisión existente sin acceso;
- actor ajeno;
- recurso ajeno.

La proyección pública futura usa error seguro.

---

#### 143. Row leakage

Las queries:

- filtran antes de paginar;
- no recuperan dataset amplio para filtrar en frontend;
- no revelan total global sin autorización;
- no revelan payload de filas fuera de scope.

---

#### 144. Consumer access

Una aplicación no obtiene acceso a audit por ser la aplicación evaluada.

Debe existir un permiso y finalidad de consulta propios.

---

#### 145. Corrección histórica

Un bug de evaluator corregido hoy no reescribe decisiones históricas.

Se puede:

```text
marcar incidente
+
crear decisión nueva para nueva solicitud
+
vincular evidencia de corrección
```

sin mutar el registro anterior.

---

#### 146. Delete prohibido por aplicación

Ninguna aplicación Vento puede borrar una decisión para ocultar:

- DENY;
- ALLOW;
- error;
- actividad administrativa;
- intento fallido.

La disposición solo ocurre por retención autorizada.

---

#### 147. Cambio de retention class

Una modificación de política de retención no reescribe silenciosamente historia.

Se aplica conforme a `SUPA-ARC-022`, preservando legal hold y evidencia de cambio.

---

#### 148. Migration forward

Todo cambio físico se crea en una nueva migration de `vento-shell`.

No se edita una migration ya aplicada.

No se usa Dashboard como fuente final.

---

#### 149. Idempotencia de migration

Una segunda aplicación segura no:

- duplica tablas;
- duplica policies;
- duplica triggers;
- duplica policy rows;
- amplía grants;
- reescribe decisiones;
- resetea fingerprints.

Un drift incompatible exige migration forward.

---

#### 150. Dependencias físicas de `AUTH-DB-032::GLOBAL`

Antes de autorizar la instancia debe existir evidencia compatible de:

```text
AUTH-DB-016::GLOBAL
AUTH-DB-017::GLOBAL cuando api sea requerido
AUTH-DB-018::GLOBAL
AUTH-DB-019::GLOBAL
AUTH-DB-033::GLOBAL
AUTH-DB-035::GLOBAL
AUTH-DB-034::GLOBAL
AUTH-DB-027
AUTH-DB-028
AUTH-DB-029
SUPA-ARC-007 vigente
SUPA-ARC-021 vigente
SUPA-ARC-022 vigente
```

En particular:

```text
audit schema ausente
→ 032 no crea un bypass de AUTH-DB-016

evaluator canónico ausente
→ 032 no fabrica decisiones propias
```

---

#### 151. Estado físico actual frente a dependencias

La auditoría remota actual confirma:

```text
audit schema = AUSENTE
canonical decision persistence = AUSENTE
```

Por tanto, el desarrollo documental de 032 no constituye readiness física.

La futura instancia deberá ejecutar su propio preflight de dependencias.

---

#### 152. Manifiesto de implementación

La futura evidencia debe registrar:

```text
instance_id
project_ref
environment
migration_files
source_contract_sha256
authorization_decision_contract_version
audit_context_contract_version
technical_failure_contract_version
audit_policy_version
retention_policy_version
table_inventory
function_inventory
trigger_inventory
constraint_inventory
index_inventory
rls_snapshot
acl_snapshot_before
acl_snapshot_after
decision_count_before
decision_count_after
technical_failure_count_before
technical_failure_count_after
query_plan_evidence
rollback_plan
restore_evidence
validation_commands
```

---

#### 153. Orden físico de materialización

Secuencia:

```text
1. verificar dependencias
2. capturar baseline
3. verificar audit schema
4. crear persistence policy
5. crear authorization_decisions
6. crear authorization_decision_resources
7. crear authorization_decision_links
8. crear authorization_evaluation_failures
9. crear authorization_evaluation_failure_attempts
10. crear constraints
11. crear indexes
12. crear append functions
13. crear query functions
14. crear mutation-rejection trigger
15. aplicar RLS/ACL
16. crear persistence profile resolver
17. crear evaluate-and-record coordinator
18. integrar safe decision wrapper sin cambiar contrato externo
19. ejecutar contract tests
20. ejecutar integrity tests
21. ejecutar security tests
22. ejecutar transaction tests
23. ejecutar query-plan tests
24. ejecutar technical-failure tests
25. ejecutar concurrency tests
26. ejecutar rollback rehearsal
27. ejecutar restore rehearsal
28. ejecutar drift final
29. registrar evidencia
```

---

#### 154. Relación con `AUTH-DB-012`

032 crea el soporte durable para decisiones.

012 implementará la auditoría de:

- creación de grants;
- modificación de grants;
- retiro de grants;
- cambios de denies;
- cambios de matrices o configuración de permisos según su contrato.

Una decisión que autorice ese cambio puede enlazarse, pero no reemplaza el audit entry del cambio.

---

#### 155. Relación con `AUTH-DB-013`

013 conserva:

```text
SimulationContext
+
simulated decisions
+
entrada/salida de simulación
```

separadas de la autoridad real.

No escribe `WOULD_ALLOW` en `authorization_decisions`.

---

#### 156. Relación con `AUTH-DB-014`

014 conserva eventos y evidencia del ciclo de dispositivos.

032 únicamente conserva `device_id` y vínculos relevantes cuando el dispositivo participó en una decisión.

---

#### 157. Relación con `AUTH-DB-021`

021 migrará RLS.

032 no reescribe policies actuales.

El audit de una operación protegida por RLS se diseña sin side effects dentro del predicate.

---

#### 158. Relación con `AUTH-DB-030`

030 retira funciones y políticas legacy después de:

- adopción;
- paridad;
- telemetría;
- ausencia de consumidores;
- rollback probado.

032 no retira nada legacy.

---

#### 159. No dependencia de logs

Se considera inválido:

```text
console log
postgres log
edge log
provider log
```

como sustituto de:

```text
authorization_decisions
```

para evidencia empresarial canónica.

---

#### 160. No dependencia de métricas

Un contador de ALLOW/DENY no permite reconstruir una decisión.

Métricas complementan.

No reemplazan persistencia.

---

#### 161. No autoridad por persistencia

La existencia de una fila:

```text
decision_id = X
outcome = ALLOW
```

no permite ejecutar una operación futura.

La fila es evidencia histórica.

No es capacidad.

---

#### 162. No replay

Queda prohibido:

```text
leer ALLOW histórico
→ ejecutar efecto hoy
```

Toda nueva operación requiere nueva evaluación.

---

#### 163. Duplicado con mismo ID

Un duplicado byte/semánticamente equivalente se trata idempotentemente.

Un duplicado incompatible produce incidente de integridad.

No crea otro registro con sufijo.

---

#### 164. FK y referencias

Las FKs físicas se aplican cuando ambos lados pertenecen a una frontera estable y la arquitectura las permite.

No se crea una FK hacia:

- tabla legacy;
- objeto administrado inestable;
- recurso polimórfico genérico;
- event store todavía no materializado;

solo para simular integridad.

Los vínculos tipados conservan referencia y fingerprint hasta que una FK canónica exista.

---

#### 165. Resource references

`authorization_decision_resources` no intenta FK polimórfica a todas las tablas de negocio.

La integridad del recurso se prueba mediante:

- resource resolver;
- resource fingerprint;
- typed reference;
- owner schema;
- evidencia de decisión.

---

#### 166. Principal references

La persistencia no crea un nuevo maestro de principal.

Conserva el ID histórico emitido.

La fuente vigente permanece en `identity_access`.

---

#### 167. Device references

La persistencia no crea un nuevo maestro de device.

Conserva referencia histórica y fingerprint/context aplicable.

---

#### 168. Hash drift

Una decisión ya persistida no cambia porque el catálogo actual tenga otro hash.

El drift solo afecta nuevas evaluaciones y la validación de historial.

---

#### 169. Archive drift

Después de archivar y restaurar:

```text
decision_record_fingerprint
```

debe permanecer idéntico.

Una diferencia es corrupción.

---

#### 170. Query de historial

La consulta privada puede diferenciar:

```text
ACTIVE_STORAGE
ARCHIVED_STORAGE
```

como ubicación técnica.

No cambia el significado de la decisión.

La estrategia exacta de federación/restore pertenece a retención.

---

#### 171. Consistencia de resource child rows

Se prueba:

```text
set(authorization_decision_resources.resource_id)
=
set(authorization_decisions.resource_ids)
```

para cada decisión con IDs.

No existen filas huérfanas.

---

#### 172. Consistencia de links

Todo `authorization_decision_links.decision_id` debe resolver a una decisión persistida.

Un technical failure no se enlaza fingiendo decision_id.

---

#### 173. Consistencia de failure attempts

Todo failure attempt resuelve a un `evaluation_attempt_id` reconocido por su caso técnico.

La secuencia de intentos es monotónica.

---

#### 174. Technical failure final

El registro final conserva:

```text
retry_count
retry_budget
duration_ms
final sanitized failure
```

sin reinterpretar cada retry como DENY.

---

#### 175. Post-effect failure

Un fallo posterior a iniciar un efecto no se clasifica en la tabla pre-efecto si:

```text
effects_committed
```

es desconocido.

Se crea evidencia de error/reconciliación en la capa correspondiente y se enlaza a la decisión si existe.

---

#### 176. Rollback antes de adopción

Si 032 se materializa pero ningún consumidor fue adoptado:

```text
1. comprobar cero consumidores
2. restaurar cuerpo anterior del safe wrapper mediante migration forward
3. revocar grants de funciones 032
4. retirar coordinador
5. retirar query/append functions
6. retirar triggers
7. retirar tablas vacías o conservarlas según rollback plan
8. no tocar legacy
9. validar drift
```

No se usa `DROP CASCADE`.

---

#### 177. Rollback después de datos

Si existen decisiones persistidas:

```text
NO DROP de evidencia histórica
```

El rollback de código:

- detiene nuevas escrituras;
- revierte caller adoption;
- conserva tablas;
- conserva decisiones;
- conserva links;
- conserva failures;
- registra incidente;
- usa migration forward.

---

#### 178. Rollback después de efectos

Un rollback de software no borra:

- decisión;
- comando;
- evento;
- efecto;
- error;
- compensación.

La historia permanece.

---

#### 179. Restore rehearsal

El rehearsal debe demostrar:

1. backup identificable;
2. restore aislado;
3. conteos;
4. PKs;
5. FKs;
6. hashes;
7. resource links;
8. execution links;
9. failures;
10. failure attempts;
11. policy activa;
12. RLS;
13. ACL;
14. funciones;
15. queries;
16. no reinterpretación histórica.

---

#### 180. Pruebas — decisiones válidas

La futura instancia debe demostrar:

1. persistir ALLOW;
2. persistir DENY;
3. decision_id único;
4. audit decision_id igual;
5. decided_at conservado;
6. recorded_at válido;
7. correlation null legítima;
8. correlation presente;
9. actor/principal/device consistentes;
10. app consistente;
11. permission consistente;
12. outcome consistente;
13. lanes consistentes;
14. reason codes válidos;
15. context fingerprint;
16. resource fingerprint;
17. catalog hash;
18. dataset hashes;
19. evaluator identity;
20. record fingerprint.

---

#### 181. Pruebas — modos de evidencia

21. navigation → anchor;
22. UI guard → anchor;
23. ordinary read → anchor;
24. aggregate → anchor;
25. sensitive read → full;
26. export → full;
27. support → full;
28. mutation → full;
29. escalation anchor→full permitida por policy;
30. downgrade obligatorio→anchor bloqueado;
31. caller no controla evidence mode;
32. caller no controla retention class.

---

#### 182. Pruebas — idempotencia e inmutabilidad

33. mismo ID + mismo fingerprint idempotente;
34. mismo ID + fingerprint distinto falla;
35. UPDATE rechazado;
36. DELETE rechazado;
37. correction no modifica original;
38. nueva realidad usa nuevo decision_id;
39. record fingerprint reproducible;
40. archive/restore conserva fingerprint.

---

#### 183. Pruebas — recursos

41. resource_ids deduplicados;
42. orden determinista;
43. child rows equivalentes;
44. draft vacío válido;
45. resource mismatch bloquea;
46. resource child huérfano imposible;
47. resource search exacta;
48. resource fingerprint no cambia en persistencia.

---

#### 184. Pruebas — links

49. COMMAND link;
50. EXECUTION_RESULT link;
51. BUSINESS_EVENT link;
52. ERROR link;
53. COMPENSATION link;
54. RECONCILIATION link;
55. AUDIT_ENTRY link;
56. duplicate exacto idempotente;
57. duplicate incompatible falla;
58. decision inexistente falla;
59. correlation incompatible falla;
60. expected/observed version preservadas;
61. idempotency reference minimizada.

---

#### 185. Pruebas — technical failure

62. technical failure no crea decision row;
63. no decision_id;
64. evaluation_attempt_id único;
65. source_status UNAVAILABLE;
66. session_preserved true;
67. effects_committed false;
68. retry_count;
69. retry_budget;
70. duration;
71. source versions conocidas;
72. source fingerprints conocidas;
73. support code;
74. provider code sanitizado;
75. permission privada no se expone;
76. deny metrics no incrementan.

---

#### 186. Pruebas — failure attempts

77. ordinal 1;
78. retry ordinal 2;
79. misma evaluation identity;
80. request nueva usa otra identity;
81. budget respetado;
82. duration no negativa;
83. payload proveedor no persistido;
84. secrets ausentes;
85. retry_after preservado.

---

#### 187. Pruebas — coordinador

86. evaluator invocado una vez;
87. append invocado una vez;
88. append fail impide retorno ejecutable;
89. DENY se persiste;
90. ALLOW se persiste;
91. no ejecuta dominio;
92. no evalúa simulación;
93. no acepta actor override;
94. no acepta evidence mode override.

---

#### 188. Pruebas — safe wrapper

95. firma externa sin cambio;
96. response segura sin cambio semántico;
97. decision se persiste antes de response;
98. full payload no cruza;
99. audit raw no cruza;
100. failure de audit bloquea éxito cuando aplique;
101. authenticated sigue sin acceso a audit raw.

---

#### 189. Pruebas — RLS

102. policy predicate no escribe audit;
103. SELECT RLS no genera inserts por fila;
104. preflight persistente usa una decisión;
105. predicate produce misma semántica;
106. operation sin preflight requerido permanece bloqueada;
107. 032 no reescribe policies legacy.

---

#### 190. Pruebas — consultas

108. get por decision_id;
109. correlation search;
110. actor search;
111. principal search;
112. device search;
113. app+permission search;
114. resource search;
115. outcome search;
116. time bounds;
117. cursor estable;
118. limit obligatorio;
119. no arbitrary order;
120. no arbitrary SQL;
121. decision_payload excluido por defecto.

---

#### 191. Pruebas — seguridad

122. audit fuera de Data API;
123. PUBLIC sin acceso;
124. anon sin acceso;
125. authenticated sin acceso raw;
126. service_role sin acceso global;
127. append function con grant mínimo;
128. query function con grant mínimo;
129. fixed search_path;
130. homonym table test;
131. homonym function test;
132. search_path poisoning;
133. SQL injection;
134. function-name injection;
135. relation-name injection.

---

#### 192. Pruebas — privacidad

136. no JWT;
137. no refresh token;
138. no PIN;
139. no secret;
140. no raw credential;
141. no nombres personales innecesarios;
142. no provider payload completo;
143. reason codes sin copy libre;
144. logs sin full payload.

---

#### 193. Pruebas — transacción

145. decision anchor antes de mutación;
146. persistence failure → cero efecto;
147. DENY → cero efecto;
148. concurrency conflict → decisión no reutilizada;
149. stale context → nueva evaluación;
150. post-effect unknown → reconciliation;
151. event link conserva causalidad;
152. rollback no borra historia.

---

#### 194. Pruebas — restore y crecimiento

153. backup incluye tablas;
154. backup incluye functions;
155. backup incluye ACL/RLS;
156. restore conserva hashes;
157. restore conserva links;
158. restore conserva failures;
159. retention class preservada;
160. legal hold respetado;
161. query plan decision_id;
162. query plan correlation;
163. query plan actor;
164. query plan resource;
165. query plan permission;
166. p50 registrado;
167. p95 registrado;
168. segunda migration execution idempotente;
169. drift final.

---

#### 195. Pruebas — fronteras

170. 012 no absorbida;
171. 013 no absorbida;
172. 014 no absorbida;
173. 021 no absorbida;
174. 030 no absorbida;
175. no business event store genérico;
176. no outbox genérico;
177. no consumer inbox;
178. no direct client audit API;
179. no authority from historical ALLOW;
180. no technical failure as DENY.

---

#### 196. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Justificación:** `AUTH-DB-032` materializa responsabilidades de auditoría, evidencia, separación de fallos técnicos, transacción, inmutabilidad, seguridad, retención y vínculo decisión–ejecución que ya están cubiertas por contratos y requisitos aprobados. La tarea no crea una capacidad empresarial nueva, un permiso nuevo, una regla de autorización nueva ni una semántica de prueba que requiera otra identidad en el Registro Canónico de Requisitos de Prueba.

---

#### 197. Cobertura de prueba vigente reutilizada

La trazabilidad existente que ya asigna responsabilidad material a 032 incluye, entre otros:

- `TREQ-AUTH-015`, evidencia correlacionable de decisiones y acciones;
- `TREQ-AUTH-311`, cero efectos ante fallo técnico pre-efecto y reconciliación post-efecto;
- `TREQ-AUTH-316`, `evaluation_attempt_id` y auditoría técnica separada;
- `TREQ-AUTH-317`, dependencia durable obligatoria antes de efecto;
- `TREQ-AUTH-318`, reconciliación física multicanal;
- los requisitos de `SUPA-ARC-007` sobre `audit`, atomicidad, inmutabilidad, outbox, causalidad, seguridad, minimización, retención e integridad.

Esta sección es trazabilidad heredada.

No modifica esas filas.

---

#### 198. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| --------- | -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | el desarrollo documental no creó migrations, relaciones, funciones, triggers, indexes, policies ni código runtime                                                                                                                                                                                                                                                                                                                                                                                                         |
| LOCAL     | NOT_EXECUTED   | pendiente de insertar el bloque en la rama documental `task/auth-db-032`, normalizarlo con `docs:task:format --write` y ejecutar los validadores reales del checkout                                                                                                                                                                                                                                                                                                                                                      |
| REMOTA    | PASS           | auditoría read-only 2026-08-22: continuidad remota `AUTH-DB-034 → AUTH-DB-032 → AUTH-DB-012`; topología `GLOBAL_ENABLE_ONCE` con gate `PRE_E5_FOUNDATION`; `SUPA-ARC-007` confirma `audit` y `AUDIT_ATOMIC_REQUIRED` para decisiones de autorización; AUTH-CTX-024 asigna a 032 persistencia inmutable y vínculo decisión–ejecución; AUTH-ERR-019 separa `evaluation_attempt_id` de `decision_id`; `vento-os-dev` está `ACTIVE_HEALTHY`, `audit` no existe y no se observó persistencia canónica de AuthorizationDecision |
| OPERATIVA | NOT_APPLICABLE | no se modificaron consumidores, RPC, RLS, navegación, UI, procesos ni aplicaciones                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| FÍSICA    | NOT_APPLICABLE | no se ejecutó SQL mutante, no se creó migration y `AUTH-DB-032::GLOBAL` no fue autorizada                                                                                                                                                                                                                                                                                                                                                                                                                                 |

---

#### 199. Decisiones vinculantes

1. La futura instancia es `AUTH-DB-032::GLOBAL`.
2. El modo es `GLOBAL_ENABLE_ONCE`.
3. El gate es `PRE_E5_FOUNDATION`.
4. El schema objetivo es `audit`.
5. `audit` no tiene autoridad empresarial.
6. La decisión real usa `decision_id`.
7. El fallo técnico usa `evaluation_attempt_id`.
8. No se mezclan ambas identidades.
9. ALLOW se persiste.
10. DENY se persiste.
11. TECHNICAL_FAILURE no se persiste como decisión.
12. Toda decisión persistida conserva audit context.
13. La ancla usa `AUDIT_ATOMIC_REQUIRED`.
14. Persistencia obligatoria falla cerrada.
15. La decisión no escapa como ejecutable si falla su ancla.
16. Se crea `authorization_decisions`.
17. Se crea `authorization_decision_resources`.
18. Se crea `authorization_decision_links`.
19. Se crea `authorization_evaluation_failures`.
20. Se crea `authorization_evaluation_failure_attempts`.
21. Se crea `authorization_decision_persistence_policies`.
22. Las relaciones son privadas.
23. No se exponen por Data API.
24. No hay acceso directo cliente.
25. `service_role` no tiene acceso global por defecto.
26. Se usa owner no interactivo.
27. Se usa fixed search_path.
28. No hay SQL dinámico abierto.
29. Se define `AUDIT_ANCHOR`.
30. Se define `FULL_DECISION`.
31. Navegación usa anchor mínimo.
32. UI guard usa anchor mínimo.
33. Lectura ordinaria usa anchor mínimo.
34. Agregado usa anchor mínimo.
35. Lectura sensible usa full.
36. Exportación usa full.
37. Soporte usa full.
38. Mutación usa full.
39. Caller no controla persistence profile.
40. Caller no controla retention class.
41. Retención consume SUPA-ARC-022.
42. No se fijan días localmente.
43. Legal hold prevalece sobre disposición.
44. `decision_payload` es privado.
45. `decision_record_fingerprint` no es autoridad.
46. Reintento exacto es idempotente.
47. Mismo ID con distinto fingerprint falla.
48. UPDATE runtime está prohibido.
49. DELETE runtime está prohibido.
50. Corrección produce nueva decisión.
51. Resource IDs se normalizan en child rows.
52. Resource draft puede tener array vacío.
53. Resource child rows deben ser equivalentes.
54. Links son append-only.
55. Link no crea el hecho.
56. Vínculo previo puede apuntar a command.
57. Vínculo posterior puede apuntar a result/event.
58. Concurrency conflict no reutiliza decisión.
59. Stale no reescribe decisión.
60. Post-effect unknown va a reconciliación.
61. Technical failure pre-efecto exige effects_committed=false.
62. Technical failure preserva sesión.
63. Retry técnico conserva evaluation attempt.
64. Nueva solicitud usa nuevo attempt ID.
65. Failure attempts son append-only.
66. Se define append function de decisión.
67. Se define append function de link.
68. Se define append function de technical failure.
69. Se define append function de failure attempt.
70. Se define trigger de inmutabilidad.
71. Se define persistence profile resolver.
72. Se define evaluate-and-record coordinator.
73. El coordinator no duplica evaluator.
74. El coordinator no ejecuta efecto.
75. Safe wrapper conserva firma.
76. Safe wrapper pasa por persistencia.
77. Safe outcome no es bearer token.
78. RLS predicate permanece side-effect free.
79. No se inserta audit por fila desde RLS.
80. Data API auditable requiere preflight cuando corresponda.
81. RPC sensible futura usa evaluate-and-record.
82. Se define get por decision_id.
83. Se define search estructurado.
84. Search no acepta SQL libre.
85. Search exige limit.
86. Search usa cursor estable.
87. Search puede filtrar correlation.
88. Search puede filtrar actor.
89. Search puede filtrar principal.
90. Search puede filtrar device.
91. Search puede filtrar app/permission.
92. Search puede filtrar resource.
93. Search por actor es sensible.
94. 032 no crea API genérica de auditoría cliente.
95. Anti-enumeration es obligatoria.
96. Historial conserva versiones.
97. Historial no se reinterpreta con catálogo actual.
98. Simulación permanece fuera.
99. 012 conserva cambios de permisos.
100. 013 conserva simulación.
101. 014 conserva ciclo de dispositivo.
102. 021 conserva migración RLS.
103. 030 conserva retiro legacy.
104. Logs no sustituyen audit.
105. Métricas no sustituyen audit.
106. Persisted ALLOW no autoriza replay.
107. No existe replay desde decision histórica.
108. FKs polimórficas falsas están prohibidas.
109. Principal master no se duplica.
110. Device master no se duplica.
111. Archive conserva fingerprint.
112. Restore no reevalúa historia.
113. Query patterns obligatorios quedan fijados.
114. Índices se prueban con planes.
115. Partición consume 021/022.
116. Backup consume 029.
117. Mutation usa frontera transaccional.
118. Sensitive read respeta durable-before-response cuando aplique.
119. Export vincula resultado.
120. Soporte no obtiene autoridad implícita.
121. SYSTEM conserva principal técnico.
122. `audit` actualmente ausente es dependencia física.
123. 032 no crea bypass de 016.
124. 032 no fabrica evaluator si 034 no está materializada.
125. Migration es forward-only.
126. Rollback no usa DROP CASCADE.
127. Rollback con datos conserva evidencia.
128. No se modifican requisitos de prueba.
129. Se especifican 180 comprobaciones físicas mínimas.
130. La siguiente tarea documental es AUTH-DB-012.

---

#### 200. Criterios de aceptación

`AUTH-DB-032` queda documentalmente completa cuando:

1. fija instancia, modo y gate;
2. consume audit como schema transversal;
3. separa autoridad y evidencia;
4. fija atomicidad de decisión;
5. define baseline física;
6. descarta logs ajenos como autoridad;
7. define tabla principal;
8. define identidad;
9. define columnas mínimas;
10. define tiempos;
11. define igualdad de IDs;
12. define correlation;
13. define actor/principal/device;
14. define app/permission;
15. define resource;
16. define outcome;
17. define lanes;
18. define reasons;
19. define fingerprints;
20. define record fingerprint;
21. define canonical JSON;
22. define decision payload;
23. define evidence modes;
24. define policy inicial;
25. impide caller-controlled policy;
26. define policy registry;
27. define retention;
28. define legal hold;
29. define immutability;
30. define idempotent duplicate;
31. define resource table;
32. define resource equality;
33. define link table;
34. define link kinds;
35. define link columns;
36. define link identity;
37. define pre-effect link;
38. define post-effect link;
39. define concurrency;
40. define stale behavior;
41. define idempotency reference;
42. define unknown outcome;
43. separa technical failure;
44. define failure table;
45. define failure shape;
46. define failure invariants;
47. define retry-attempt table;
48. define retry identity;
49. define retry behavior;
50. define audit-store failure;
51. define append decision;
52. define append validation;
53. define append security;
54. define append link;
55. define append failure;
56. define append failure attempt;
57. define mutation trigger;
58. define no historical update;
59. define profile resolver;
60. define coordinator;
61. define coordinator security;
62. define no-escape rule;
63. integra safe wrapper;
64. prohíbe bearer decision;
65. mantiene RLS side-effect free;
66. define preflight RLS;
67. conserva adopción RPC;
68. define get;
69. define search;
70. define filtros;
71. define límites;
72. define correlation search;
73. define actor search;
74. define permission search;
75. define resource search;
76. define links query;
77. no crea API cliente genérica;
78. fija cero direct access;
79. limita service role;
80. define owner;
81. fija search path;
82. prohíbe SQL dinámico;
83. define RLS defensiva;
84. verifica FORCE RLS;
85. verifica ACL defaults;
86. mantiene audit fuera de Data API;
87. valida full payload;
88. valida anchor;
89. conserva dataset hashes;
90. preserva historial/versiones;
91. define correction;
92. excluye simulación;
93. preserva 012;
94. preserva 013;
95. preserva 014;
96. define SYSTEM;
97. persiste DENY;
98. separa technical failure;
99. separa métricas;
100. define logs;
101. define privacidad;
102. define sensibilidad;
103. define redacción;
104. evita before/after genérico;
105. define event links;
106. excluye outbox genérico;
107. define correlation chain;
108. define causalidad;
109. define tiempo;
110. define retención;
111. define archivado;
112. define restore;
113. define backup;
114. define partition readiness;
115. define query patterns;
116. define índices por planes;
117. define limits;
118. define cursor;
119. define atomic append;
120. define atomic mutation;
121. define sensitive read;
122. define navigation;
123. define aggregate;
124. define export;
125. define support;
126. define mutation;
127. define query authorization;
128. define anti-enumeration;
129. define row leakage;
130. define consumer access;
131. define historical correction;
132. prohíbe app delete;
133. gobierna retention changes;
134. exige migration forward;
135. exige idempotent migration;
136. fija physical dependencies;
137. registra estado actual;
138. define implementation manifest;
139. define materialization order;
140. delimita 012;
141. delimita 013;
142. delimita 014;
143. delimita 021;
144. delimita 030;
145. separa logs;
146. separa metrics;
147. niega authority by persistence;
148. niega replay;
149. define incompatible duplicate;
150. define referencias;
151. define resource refs;
152. no duplica principal;
153. no duplica device;
154. conserva hash drift;
155. conserva archive integrity;
156. define history query;
157. valida resource children;
158. valida links;
159. valida failure attempts;
160. define final technical failure;
161. define post-effect handling;
162. define rollback sin adopción;
163. define rollback con datos;
164. define rollback con efectos;
165. define restore rehearsal;
166. define pruebas de decisión;
167. define pruebas de evidencia;
168. define pruebas de idempotencia;
169. define pruebas de recursos;
170. define pruebas de links;
171. define pruebas de technical failure;
172. define pruebas de retries;
173. define pruebas de coordinator;
174. define pruebas de safe wrapper;
175. define pruebas RLS;
176. define pruebas de queries;
177. define pruebas de seguridad;
178. define pruebas de privacidad;
179. define pruebas transaccionales;
180. define pruebas de restore;
181. declara cero TREQ nuevos;
182. registra evidencia remota;
183. conserva límites;
184. reserva AUTH-DB-012 sin desarrollarla.

---

#### 201. Límites

`AUTH-DB-032` no:

- ejecuta SQL durante su desarrollo documental;
- crea migrations durante su desarrollo documental;
- autoriza `AUTH-DB-032::GLOBAL`;
- crea el schema `audit` saltándose `AUTH-DB-016`;
- implementa `AUTH-DB-034`;
- cambia la semántica de `AuthorizationDecision`;
- cambia la semántica de `AuthorizationAuditContext`;
- cambia `AuthorizationTechnicalFailure`;
- convierte technical failure en DENY;
- convierte DENY en fallo técnico;
- convierte decision_id en token;
- ejecuta efectos empresariales;
- crea fuente de verdad de recursos;
- duplica principal;
- duplica device;
- implementa simulación;
- implementa auditoría de cambios de permisos;
- implementa auditoría de simulación;
- implementa auditoría del ciclo de dispositivos;
- crea el event store transversal completo;
- crea outbox genérico;
- crea inbox genérico;
- crea workers;
- habilita Realtime;
- crea Edge Functions;
- crea webhooks;
- crea cron;
- migra las policies RLS actuales;
- migra RPC sensibles;
- retira helpers legacy;
- fija periodos de retención fuera de SUPA-ARC-022;
- expone audit a Data API;
- concede acceso directo a clientes;
- modifica 04A;
- desarrolla `AUTH-DB-012`.

---

#### 202. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-DB-034 — Implementar evaluate_authorization canónico, su núcleo de evaluación, resolvers de recurso y proyecciones seguras`

**TAREA ACTUAL APROBADA**
`AUTH-DB-032 — Implementar persistencia canónica y vinculación de decisiones de autorización`

**SIGUIENTE TAREA RESERVADA**
`AUTH-DB-012 — Implementar auditoría de cambios de permisos`


### ✅ AUTH-DB-012 — Implementar auditoría de cambios de permisos

**Estado:** APROBADA
**Tarea anterior:** AUTH-DB-032 — Implementar persistencia canónica y vinculación de decisiones de autorización
**Tarea siguiente:** AUTH-DB-013 — Implementar auditoría de simulación
**Tipo de tarea:** Documental
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/02_R1_FUNDACION_FISICA_CANONICA.md`
**Estado físico resultante:** Contrato global de auditoría inmutable y transaccional de cambios de autoridad cerrado; futura instancia `AUTH-DB-012::GLOBAL` pendiente de autorización explícita y de la capa transversal `audit`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`AUTH-DB-012` define el mecanismo canónico para conservar evidencia durable de cada cambio que altere la autoridad concedida o denegada por el sistema de permisos de Vento OS.

La regla raíz es:

```text
MUTACIÓN AUTORIZATIVA VÁLIDA
+
IDENTIDAD REAL DEL ACTOR Y DEL PRINCIPAL TÉCNICO
+
DECISIÓN DE AUTORIZACIÓN PERSISTIDA CUANDO APLIQUE
+
ESTADO ANTERIOR Y POSTERIOR MINIMIZADOS
+
CAUSA, APROBACIÓN, VERSIÓN Y HUELLA
+
ANCLA AUDITABLE EN LA MISMA FRONTERA TRANSACCIONAL
=
CAMBIO DE PERMISO RECONSTRUIBLE
```

Esta tarea no vuelve a evaluar permisos, no convierte la auditoría en fuente de autoridad y no sustituye la persistencia de decisiones de `AUTH-DB-032`.

---

#### 2. Resultado canónico

La futura instancia global podrá materializar una única infraestructura compartida:

```text
audit.authorization_permission_change_sets
audit.authorization_permission_changes
audit.authorization_permission_change_attempts
audit.authorization_permission_change_links
```

y las primitivas privadas:

```text
audit.append_authorization_permission_change(jsonb)
audit.append_authorization_permission_change_attempt(jsonb)
audit.get_authorization_permission_change(text)
audit.search_authorization_permission_changes(jsonb)
audit.list_authorization_permission_change_items(text)
audit.reject_authorization_permission_audit_mutation()
app_private.canonicalize_authorization_permission_change(jsonb)
app_private.fingerprint_authorization_permission_change(jsonb)
```

La infraestructura es transversal. Ninguna aplicación recibe una tabla de auditoría propia.

---

#### 3. Topología y gate

La clasificación vigente es:

```text
task_id = AUTH-DB-012
mode = GLOBAL_ENABLE_ONCE
instance = AUTH-DB-012::GLOBAL
execution_gate = PRE_E5_FOUNDATION
canonical_work = DEFINE_CONTRACT_ONCE
```

Consecuencias:

1. existe como máximo una instancia física global;
2. no existe `AUTH-DB-012` por aplicación;
3. no existe `AUTH-DB-012` por `package_id`;
4. la infraestructura puede existir antes de adopciones verticales;
5. la cobertura de cada writer se completa después en su unidad propietaria;
6. la aprobación documental no autoriza la instancia física;
7. toda materialización conserva autorización explícita, migration versionada, pruebas, rollback y evidencia.

---

#### 4. Precondición transversal obligatoria

`AUTH-DB-012::GLOBAL` requiere que exista físicamente la capa transversal aprobada por `SUPA-ARC-007`:

```text
audit
```

Si `audit` no existe:

```text
AUTH-DB-012::GLOBAL
→ BLOCKED
```

012 no crea una tabla de auditoría alternativa en `public`, `identity_access`, una aplicación o un dominio para evadir esta precondición.

---

#### 5. Fuentes vinculantes

La definición consume y preserva:

- `ADR-AUTH-001`;
- `AUTH-MOD-018`, para composición de carriles;
- `AUTH-MOD-019`, para denegación explícita;
- `AUTH-CAT-011`, para alcances permitidos;
- `AUTH-RBAC-020`, para concesiones individuales base;
- `AUTH-RBAC-021`, para concesiones individuales operativas;
- `AUTH-RBAC-022`, para denegaciones individuales y transversales;
- `AUTH-RBAC-024`, para `vento.authorization.base-role-grants@1.0.0`;
- `AUTH-RBAC-025`, para la matriz operativa canónica;
- `AUTH-RBAC-026`, para overrides canónicos;
- `AUTH-CTX-024`, para evidencia de autorización;
- `AUTH-DB-032`, para persistencia de decisiones y vínculo decisión–ejecución;
- `SUPA-ARC-007`, para `audit`, inmutabilidad y clases de compromiso;
- `SUPA-ARC-011`, para nombres físicos;
- `SUPA-ARC-012`, para claves, constraints, estados y tiempo;
- `SUPA-ARC-013`, para funciones y triggers;
- `SUPA-ARC-014`, para funciones privilegiadas;
- `SUPA-ARC-015`, para grants, RLS y ACL;
- `SUPA-ARC-021`, para índices y crecimiento;
- `SUPA-ARC-022`, para retención, legal hold, archivo, backup y restore;
- `SUPA-TRANS-016`, para el orden R1/R2;
- `vento.canonical-json@1.0.0`.

---

#### 6. Precedencia

La precedencia material es:

```text
MODELO Y CATÁLOGO AUTH
→ definen qué significa grant, deny, lane, scope y vigencia

SUPA-ARC-007
→ define la capa audit

AUTH-DB-032
→ persiste la decisión que autorizó o denegó la administración

AUTH-DB-012
→ persiste el cambio de autoridad o el intento administrativo

AUTH-DB-013
→ audita simulación

AUTH-DB-014
→ audita dispositivos

AUTH-DB-020
→ adopta los contratos en objetos migrados por dominio
```

012 no absorbe el trabajo de las tareas posteriores.

---

#### 7. Distinción fundamental

Se preservan tres hechos diferentes:

```text
DECISIÓN DE AUTORIZACIÓN
→ ¿podía el actor intentar el comando?

CAMBIO DE PERMISO
→ ¿qué autoridad se creó, restringió, suspendió, revocó o sustituyó?

EFECTO EMPRESARIAL POSTERIOR
→ ¿qué operación ejecutó después el beneficiario?
```

Cada hecho conserva identidad y evidencia propias.

---

#### 8. Frontera con `AUTH-DB-032`

`AUTH-DB-032` persiste:

```text
AuthorizationDecision@1.0.0
```

012 persiste:

```text
MUTACIÓN DE CONFIGURACIÓN AUTORIZATIVA
```

Cuando una decisión autorizó el cambio:

```text
authorization_decision_id
→ referencia a la decisión persistida
```

El cambio no copia todo el payload de la decisión.

---

#### 9. Frontera con `AUTH-DB-013`

Una decisión simulada:

```text
WOULD_ALLOW
WOULD_DENY
```

no crea un cambio de permisos real.

La simulación y su historial pertenecen a `AUTH-DB-013`.

012 solo registra cambios en autoridad real.

---

#### 10. Frontera con `AUTH-DB-014`

Alta, activación, suspensión, revocación, rotación y retiro de dispositivos pertenecen a `AUTH-DB-014`.

012 puede conservar `device_id` como contexto del actor que administró permisos.

No convierte un cambio de dispositivo en un cambio de permiso.

---

#### 11. Frontera con `AUTH-DB-020`

012 crea una infraestructura global reutilizable.

`AUTH-DB-020` debe integrar cada fuente autorizativa que migre para que sus writers:

```text
MUTEN LA FUENTE
+
REGISTREN EL CAMBIO
```

en la misma frontera transaccional.

012 no mueve objetos de `public` a `identity_access` ni ejecuta backfills de permisos.

---

#### 12. Fuentes autorizativas cubiertas conceptualmente

El audit debe poder representar cambios provenientes de:

```text
PERMISSION_CATALOG_RELEASE
BASE_ROLE_GRANT
OPERATIONAL_ROLE_GRANT
INDIVIDUAL_OVERRIDE
EXPLICIT_DENIAL
```

Estas clases son lógicas y no equivalen a nombres de tablas legacy.

---

#### 13. `PERMISSION_CATALOG_RELEASE`

Cubre únicamente cambios de catálogo que alteren semántica de autorización, por ejemplo:

- alta de una clave nueva;
- activación;
- desactivación;
- cambio incompatible de modalidad;
- cambio incompatible de alcance máximo;
- cambio contractual de sensibilidad o prerrequisito cuando afecte evaluación;
- supersesión de una versión.

No convierte 012 en propietaria del catálogo.

El catálogo continúa versionándose mediante su contrato propio.

---

#### 14. Cambios de presentación del catálogo

Un cambio exclusivamente de:

- etiqueta humana;
- descripción humana;
- orden visual;
- agrupación visual;

no se presenta como cambio de autoridad si no modifica el contrato efectivo.

Puede conservar auditoría administrativa por otra finalidad, pero no se contabiliza como `authorization_permission_change` por inferencia.

---

#### 15. `BASE_ROLE_GRANT`

Representa una decisión material sobre la matriz base:

```text
role_code
+
permission_key
+
BASE
+
scope
+
condiciones
```

La identidad lógica consume el dataset base canónico y no el nombre de una tabla legacy.

---

#### 16. `OPERATIONAL_ROLE_GRANT`

Representa una decisión material sobre la matriz operativa:

```text
operational_role_code
+
permission_key
+
OPERATIONAL
+
scope operativo
+
condiciones
```

No puede producir autoridad global por ausencia de contexto.

---

#### 17. `INDIVIDUAL_OVERRIDE`

Representa una concesión individual positiva o una excepción compatible con el modelo aprobado.

Debe conservar:

- trabajador exacto;
- permiso exacto;
- carril;
- alcance;
- vigencia;
- estado;
- motivo normalizado;
- solicitante;
- aprobador;
- fuente o expediente de origen.

No se convierte en un segundo rol.

---

#### 18. `EXPLICIT_DENIAL`

Representa denegaciones explícitas reales:

```text
BASE_DENY
OPERATIONAL_DENY
ACTOR_WIDE_DENY
```

La ausencia de un grant no crea una fila de esta clase.

---

#### 19. Default deny no es explicit deny

Se conserva:

```text
SIN ALLOW
→ DEFAULT_DENY
```

separado de:

```text
DENEGACIÓN ADMINISTRATIVA EXPRESA
→ EXPLICIT_DENY
```

012 nunca fabrica una denegación explícita para explicar una ausencia de concesión.

---

#### 20. Cambio actual no reescribe historia

Una denegación creada hoy:

```text
NO convierte ALLOW históricos válidos
EN acciones retrospectivamente inválidas
```

La auditoría histórica conserva la política, versión y huellas vigentes en el instante del hecho.

---

#### 21. Línea base física remota observada

La auditoría read-only del proyecto `vento-os-dev` identificó como superficies físicas actuales relacionadas con permisos:

```text
public.app_permissions
public.role_permissions
public.employee_permissions
public.operational_role_permissions
public.role_capabilities
```

Conteos observados:

```text
app_permissions = 179
role_permissions = 613
employee_permissions = 17
operational_role_permissions = 32
role_capabilities = 26
```

El snapshot es evidencia AS-IS, no el dataset objetivo.

---

#### 22. Denegaciones físicas observadas

En el mismo corte:

```text
role_permissions deny = 0
employee_permissions deny = 0
operational_role_permissions deny = 0
```

La ausencia actual de filas `DENY` no elimina el contrato de auditoría de denegaciones.

El modelo canónico ya las define y la infraestructura debe estar preparada antes de su materialización.

---

#### 23. Triggers observados

Entre las superficies anteriores se observó únicamente:

```text
operational_role_permissions_touch_updated_at
```

como trigger relacionado, y su finalidad es actualizar `updated_at`.

No se observó un trigger canónico que registre de forma completa actor, decisión, causa, before/after, versión y vínculo transaccional de cambios de permisos.

---

#### 24. RLS actual observado

Las cinco relaciones auditadas tienen RLS habilitado en el corte observado.

No tienen `FORCE ROW LEVEL SECURITY`.

012 no interpreta este hecho como cobertura suficiente de auditoría.

---

#### 25. Grants actuales observados

Las superficies legacy mantienen privilegios relacionales amplios para roles como `authenticated` y `service_role`, incluyendo operaciones de mutación en varias tablas.

Ese estado:

```text
NO es el modelo objetivo
NO prueba atribución suficiente
NO prueba cobertura de audit
```

La reducción de privilegios y adopción canónica conservan sus tareas propietarias.

---

#### 26. Ausencia del schema `audit`

En el snapshot remoto utilizado para esta tarea:

```text
audit = AUSENTE
```

Por ello, el estado físico actual de 012 es:

```text
NOT_IMPLEMENTED
```

No se crea una excepción local dentro de `public`.

---

#### 27. Registro de change set

Se congela:

```text
audit.authorization_permission_change_sets
```

Clase lógica:

```text
AUDIT_ENTRY
```

Cada fila representa una operación administrativa que intentó modificar uno o más elementos de autoridad y terminó con cambios confirmados.

---

#### 28. Identidad del change set

Identidad:

```text
change_set_id
```

Reglas:

- generada en servidor;
- única;
- estable;
- no derivada del actor;
- no derivada del permiso;
- no reutilizada;
- no expuesta como token de autoridad.

---

#### 29. Campos mínimos del change set

Debe poder conservar:

```text
change_set_id
audit_schema_version
occurred_at
recorded_at
principal_id
effective_actor_id
technical_principal_id
session_id
device_id
app_code
request_source
command_id
authorization_decision_id
correlation_id
causation_id
reason_code
justification_reference
source_reference
approval_reference
source_dataset_versions
source_dataset_hashes
change_count
result_code
sensitivity_class
retention_class
change_set_fingerprint
```

No se añaden nombres humanos por conveniencia.

---

#### 30. `occurred_at` y `recorded_at`

```text
occurred_at
→ instante empresarial/técnico del commit autorizativo

recorded_at
→ instante en que audit persistió el ancla
```

Para `AUDIT_ATOMIC_REQUIRED`, ambos pertenecen a la misma frontera de commit.

---

#### 31. Principal, actor y principal técnico

La auditoría conserva por separado:

```text
principal_id
effective_actor_id
technical_principal_id
```

No se derivan entre sí.

Un servicio técnico no sustituye al actor humano cuando la operación fue iniciada por una persona.

---

#### 32. `device_id`

`device_id` se conserva cuando el contexto de autorización lo proporcionó.

No se deriva de:

- User-Agent;
- IP;
- hostname;
- nombre de navegador.

La vida del dispositivo continúa siendo responsabilidad de `AUTH-DB-014`.

---

#### 33. `authorization_decision_id`

Cuando una mutación administrativa fue autorizada mediante el evaluador canónico:

```text
authorization_decision_id
```

debe resolver al `decision_id` persistido por 032.

No se copia una decisión completa dentro del change set.

---

#### 34. Cambio ejecutado por sistema

Un cambio legítimo `SYSTEM` debe conservar:

- principal técnico;
- proceso o automatismo propietario;
- permiso técnico/empresarial aplicable;
- source reference;
- correlation;
- razón canónica.

`service_role` por sí solo no es explicación suficiente.

---

#### 35. `reason_code`

Todo cambio de autoridad exige una causa normalizada.

`reason_code` no es texto libre.

Debe permitir diferenciar, como mínimo, familias tales como:

- responsabilidad aprobada;
- cobertura temporal;
- cambio organizacional;
- suspensión;
- segregación de funciones;
- seguridad;
- corrección de configuración;
- expiración;
- migración controlada.

La taxonomía final se gobierna por el contrato administrativo propietario.

---

#### 36. `justification_reference`

La explicación humana extensa no se duplica en el audit por defecto.

Se conserva una referencia a:

- solicitud;
- acta;
- caso;
- incidente;
- aprobación;
- expediente;
- cambio versionado.

El contenido sensible permanece en su owner.

---

#### 37. `approval_reference`

Cuando el contrato requiera aprobación reforzada o dual, la evidencia enlaza el expediente o resultado de aprobación.

No basta:

```text
approved = true
```

sin identidad y procedencia verificables.

---

#### 38. Registro de items

Se congela:

```text
audit.authorization_permission_changes
```

Cada fila representa exactamente un elemento de autoridad cuyo estado efectivo cambió dentro de un `change_set_id`.

---

#### 39. Identidad del item

Se congela:

```text
permission_change_id
```

Es diferente de:

- change_set_id;
- decision_id;
- grant_id;
- deny_id;
- permission_id;
- employee_id.

---

#### 40. Campos mínimos del item

```text
permission_change_id
change_set_id
change_ordinal
source_kind
authorization_record_reference
subject_kind
subject_reference
permission_key
lane
effect
change_kind
changed_fields
before_state
after_state
before_fingerprint
after_fingerprint
source_dataset_id
source_dataset_version
source_dataset_hash
item_reason_code
occurred_at
recorded_at
item_fingerprint
```

---

#### 41. `source_kind`

Vocabulario cerrado inicial:

```text
PERMISSION_CATALOG_RELEASE
BASE_ROLE_GRANT
OPERATIONAL_ROLE_GRANT
INDIVIDUAL_OVERRIDE
EXPLICIT_DENIAL
```

No se usa el nombre físico de una tabla como semántica primaria.

---

#### 42. `subject_kind`

Vocabulario cerrado inicial:

```text
BASE_ROLE
OPERATIONAL_ROLE
EMPLOYEE
CATALOG
```

No se admite:

```text
UNKNOWN
GENERIC
ANY
```

como sujeto de una mutación exitosa.

---

#### 43. `subject_reference`

Debe ser la identidad canónica mínima del sujeto:

- role code;
- operational role code;
- employee ID;
- catalog release ID.

No contiene nombre humano, correo ni documento.

---

#### 44. `permission_key`

Toda fila de autoridad sobre una capacidad exacta conserva el `permission_key` canónico.

Reglas:

- coincidencia exacta;
- sin wildcard;
- sin prefijo como permiso;
- sin label humana;
- sin alias legacy como identidad nueva.

---

#### 45. `lane`

Valores aplicables:

```text
BASE
OPERATIONAL
ALL_COMPATIBLE
NOT_APPLICABLE
```

`ALL_COMPATIBLE` solo corresponde a una denegación transversal aprobada.

`NOT_APPLICABLE` puede usarse en un release de catálogo.

---

#### 46. `effect`

Valores de autoridad:

```text
ALLOW
DENY
NOT_APPLICABLE
```

`NOT_APPLICABLE` solo se admite cuando el item describe un cambio de release de catálogo y no una asignación.

---

#### 47. Efecto no cambia in-place

Una asignación real no cambia silenciosamente:

```text
ALLOW → DENY
```

o:

```text
DENY → ALLOW
```

como simple edición de un mismo hecho.

La transición se representa mediante retiro/supersesión del registro anterior y creación del nuevo hecho dentro del mismo change set cuando corresponda.

---

#### 48. Lane no cambia in-place

```text
BASE → OPERATIONAL
```

no se trata como una edición inocua.

Cambia la identidad semántica de la autoridad y exige sustitución explícita.

---

#### 49. Permission key no cambia in-place

Renombrar una fila de autoridad de una clave a otra está prohibido como actualización.

Debe existir:

```text
retiro del vínculo anterior
+
creación del vínculo nuevo
+
referencia a transición contractual
```

---

#### 50. Subject no cambia in-place

Una concesión a un trabajador no puede convertirse por UPDATE en concesión a otro trabajador.

La misma regla aplica a roles base y operativos.

---

#### 51. Vocabulario de `change_kind`

Se congela:

```text
CREATE
ACTIVATE
CHANGE_SCOPE
CHANGE_VALIDITY
SUSPEND
REVOKE
EXPIRE
REJECT
SUPERSEDE
MIGRATE
CORRECT_METADATA
CATALOG_RELEASE_ACTIVATED
```

Cualquier clase nueva exige evolución contractual.

---

#### 52. `CREATE`

Requiere:

```text
before_state = null
after_state != null
```

No significa que la autoridad esté activa si el `after_state` es `SCHEDULED` o `PENDING_APPROVAL`.

---

#### 53. `ACTIVATE`

Conserva el mismo registro autorizativo y cambia su lifecycle a un estado efectivo autorizado por contrato.

No puede adelantar `effective_from` por inferencia.

---

#### 54. `CHANGE_SCOPE`

Registra únicamente una modificación de alcance permitida por el permiso.

Debe conservar:

```text
scope_before
scope_after
```

y sus fingerprints.

Un scope nuevo no puede superar el máximo contractual.

---

#### 55. `CHANGE_VALIDITY`

Conserva cambios de:

```text
effective_from
effective_until
```

No se usa para renovar silenciosamente una concesión temporal.

Cuando el contrato exija nueva decisión administrativa, se crea el registro correspondiente y el audit lo refleja.

---

#### 56. `SUSPEND`

Suspender conserva el registro histórico pero impide su participación efectiva mientras la suspensión sea aplicable.

No equivale a borrar.

---

#### 57. `REVOKE`

Revocar:

- deja el hecho anterior disponible para historia;
- registra actor y causa;
- registra momento;
- invalida uso futuro según el contrato;
- no borra decisiones históricas.

---

#### 58. `EXPIRE`

Expiración automática o administrada conserva:

- regla de origen;
- instante efectivo;
- proceso técnico que cerró la vigencia;
- estado anterior/posterior.

Una expiración no se registra como acción humana si no lo fue.

---

#### 59. `REJECT`

Una solicitud rechazada que nunca produjo autoridad pertenece normalmente al registro de intentos.

`REJECT` como item solo aplica cuando existe un registro de lifecycle que cambia de `PENDING_APPROVAL` a `REJECTED` y ese registro forma parte de la fuente canónica.

---

#### 60. `SUPERSEDE`

Se utiliza cuando una versión nueva sustituye una autoridad o release anterior sin borrar historia.

Debe enlazar la referencia reemplazada.

---

#### 61. `MIGRATE`

`MIGRATE` identifica una transición controlada desde una fuente legacy hacia una fuente canónica.

No autoriza:

- inventar actor humano;
- inventar motivo;
- reescribir fechas históricas;
- convertir ausencia de evidencia en certeza.

---

#### 62. `CORRECT_METADATA`

Solo corrige metadata auditada que no cambia autoridad efectiva.

Si cambia autoridad:

```text
CORRECT_METADATA
→ prohibido
```

y debe usarse una operación autorizativa real.

---

#### 63. `CATALOG_RELEASE_ACTIVATED`

Registra la activación de un release contractual del catálogo.

El payload de 012 conserva referencia, versión y hash.

No duplica todas las descripciones humanas del catálogo.

---

#### 64. `changed_fields`

Es una lista ordenada, deduplicada y cerrada de campos semánticos realmente modificados.

No se calcula comparando JSON arbitrario sin esquema.

No incluye metadata técnica como `recorded_at`.

---

#### 65. `before_state`

Es una proyección canónica mínima del estado autorizativo anterior.

Puede contener:

```text
subject_reference
permission_key
lane
effect
scope
resource_constraint
effective_from
effective_until
lifecycle_status
reason_code
source_reference
```

según aplique.

---

#### 66. `after_state`

Usa exactamente la misma forma lógica que `before_state`.

La comparación entre ambas formas debe ser determinista.

No incorpora campos visuales ni datos personales innecesarios.

---

#### 67. Prohibición de snapshots completos

No se persiste por defecto:

- fila SQL completa;
- perfil completo del trabajador;
- nombre del rol;
- catálogo entero;
- payload de formulario;
- JWT;
- metadata de Auth;
- response completa del frontend.

Se conserva la proyección mínima necesaria para reconstrucción.

---

#### 68. Fingerprints de estado

Se conservan:

```text
before_fingerprint
after_fingerprint
```

Formato:

```text
sha256:
+
64 caracteres hexadecimales minúsculos
```

`null` es válido únicamente cuando no existe ese lado del cambio.

---

#### 69. `item_fingerprint`

Representa el item auditado completo canonicalizado.

No concede autoridad.

Sirve para:

- integridad;
- idempotencia;
- restore;
- archive;
- detección de mutación.

---

#### 70. `change_set_fingerprint`

Representa el change set y la colección ordenada de items.

No depende de:

- ubicación física;
- partición;
- nodo;
- métrica;
- timestamp de backup.

---

#### 71. Canonicalización

Todos los fingerprints usan:

```text
vento.canonical-json@1.0.0
```

Queda expresamente insuficiente:

```text
jsonb::text
```

como contrato de serialización canónica.

---

#### 72. Dataset identity

Cada item conserva cuando aplique:

```text
source_dataset_id
source_dataset_version
source_dataset_hash
```

Esto permite interpretar el cambio contra la matriz o catálogo vigente en ese instante.

---

#### 73. Revisión histórica

Una investigación futura utiliza la versión histórica registrada.

No sustituye:

```text
hash histórico
```

por:

```text
hash actual
```

para reinterpretar un cambio antiguo.

---

#### 74. Registro de attempts

Se congela:

```text
audit.authorization_permission_change_attempts
```

Clase lógica:

```text
AUDIT_ENTRY
```

Registra operaciones administrativas que no produjeron un cambio confirmado.

---

#### 75. Identidad del attempt

```text
change_attempt_id
```

Es distinta de:

- change_set_id;
- decision_id;
- evaluation_attempt_id de evaluación técnica;
- command_id.

---

#### 76. Resultados de attempt

Vocabulario cerrado inicial:

```text
DENIED
INVALID
CONFLICT
TECHNICAL_FAILURE
NO_CHANGE
ROLLED_BACK
```

Un attempt nunca se inserta como cambio confirmado.

---

#### 77. `DENIED`

Se usa cuando una decisión válida `DENY` bloqueó la administración.

Conserva referencia a `decision_id` cuando exista.

No contiene after_state efectivo.

---

#### 78. `INVALID`

Se usa cuando la solicitud administrativa no supera contrato, formato, lifecycle o invariantes antes de mutar.

No se transforma automáticamente en `DENIED`.

---

#### 79. `CONFLICT`

Se usa para:

- versión stale;
- cambio concurrente;
- contradicción de asignación;
- duplicado incompatible;
- precondición administrativa que cambió.

No aplica last-write-wins.

---

#### 80. `TECHNICAL_FAILURE`

Se usa cuando una dependencia técnica impide completar la operación y se conoce que no se comprometió el cambio.

No se inventa una denegación.

---

#### 81. `NO_CHANGE`

Registra una solicitud válida que no alteró autoridad porque el resultado ya era semánticamente equivalente.

No crea un item de cambio ficticio.

---

#### 82. `ROLLED_BACK`

Solo se usa cuando puede demostrarse que la transacción autorizativa fue revertida completamente.

Si el resultado es incierto:

```text
ROLLED_BACK
→ prohibido
```

y se deriva a incidente/reconciliación.

---

#### 83. Campos mínimos del attempt

```text
change_attempt_id
occurred_at
recorded_at
principal_id
effective_actor_id
technical_principal_id
device_id
app_code
request_source
command_id
authorization_decision_id
correlation_id
permission_key
source_kind
subject_kind
subject_reference
requested_change_kind
attempt_result
reason_code
error_class
result_reference
request_fingerprint
sensitivity_class
retention_class
attempt_fingerprint
```

---

#### 84. Denegación auditada sin duplicar decisión

El attempt conserva:

```text
authorization_decision_id
```

pero no copia:

- matched grants;
- matched denies;
- AccessContext completo;
- AuthorizationDecision completa.

032 continúa siendo la fuente de esa evidencia.

---

#### 85. Retry administrativo

Un retry no reescribe el attempt anterior.

Cada solicitud efectiva conserva su identidad propia y la idempotency key del comando evita duplicar el cambio.

---

#### 86. Fallo del audit store

Si el audit requerido para un cambio de autoridad está indisponible:

```text
NO COMMIT DE AUTORIDAD
NO ACK DE ÉXITO
```

La dependencia es obligatoria.

Si el propio store no puede escribir su indisponibilidad, la observabilidad externa conserva la señal técnica disponible.

---

#### 87. Clase de compromiso

Todo cambio real de autoridad utiliza:

```text
AUDIT_ATOMIC_REQUIRED
```

Regla:

```text
CAMBIO DE AUTORIDAD
+
AUDIT CHANGE SET
+
AUDIT ITEMS
=
MISMO COMMIT
```

---

#### 88. Prohibición de audit después del commit

Queda prohibido el patrón:

```text
UPDATE PERMISO
COMMIT
LUEGO INSERT AUDIT
```

porque permite autoridad activa sin evidencia obligatoria.

---

#### 89. Prohibición de éxito sin audit

Una API, RPC, Server Action o worker no puede presentar:

```text
CAMBIO APLICADO
```

si el audit obligatorio no quedó durable.

---

#### 90. No usar trigger como única atribución

Un trigger genérico de `before/after` no puede por sí solo reconstruir de forma fiable:

- actor efectivo;
- principal técnico;
- autorización;
- razón;
- aprobación;
- expediente;
- command ID;
- correlación.

Por tanto, un trigger SQL no será la única fuente de contexto administrativo.

---

#### 91. Patrón objetivo de writer

Todo writer canónico de autoridad deberá ejecutar conceptualmente:

```text
BEGIN
  resolver contexto
  evaluar permiso administrativo
  persistir AuthorizationDecision
  validar request y expected version
  aplicar mutación autorizativa
  append authorization permission change
COMMIT
```

El rollback revierte mutación y audit del change set juntos.

---

#### 92. Direct writes después de adopción

Cuando una fuente autorizativa sea adoptada canónicamente:

```text
DIRECT INSERT/UPDATE/DELETE DE CLIENTE
→ PROHIBIDO
```

Los cambios pasan por comandos propietarios que cumplen la frontera transaccional.

---

#### 93. Legacy durante transición

Las tablas legacy actuales no reciben por 012 una falsa certificación de cobertura completa.

Durante `AUTH-DB-020` cada writer debe clasificarse:

```text
CANONICAL_AUDITED
TRANSITIONAL_ADAPTER
BLOCKED_FOR_MIGRATION
RETIRED
```

No existe `UNTRACKED_BUT_ALLOWED` como estado objetivo.

---

#### 94. Backfill de historia

012 no fabrica eventos históricos para cambios antiguos que no tuvieron audit canónico.

Un backfill puede conservar:

- snapshot conocido;
- procedencia;
- ventana;
- nivel de certeza;
- referencia a fuente legacy.

Pero no inventa actor, decisión o hora exacta.

---

#### 95. Historia previa al cutover

La ausencia de audit canónico anterior al cutover se registra como una limitación de evidencia.

No se oculta mediante timestamps actuales presentados como históricos.

---

#### 96. Registro de links

Se congela:

```text
audit.authorization_permission_change_links
```

Clase lógica:

```text
AUDIT_LINK
```

Relaciona change sets o items con artefactos durables externos sin duplicarlos.

---

#### 97. Link kinds

Vocabulario cerrado inicial:

```text
AUTHORIZATION_DECISION
APPROVAL
SOURCE_EVIDENCE
INCIDENT
CORRECTION
MIGRATION
AUDIT_ENTRY
```

No se acepta un tipo libre.

---

#### 98. Campos mínimos del link

```text
permission_change_link_id
change_set_id
permission_change_id
link_kind
reference_type
reference_id
correlation_id
causation_id
occurred_at
recorded_at
link_fingerprint
```

`permission_change_id` puede ser `null` si el vínculo aplica al change set completo.

---

#### 99. Link no concede autoridad

Un vínculo a una aprobación o decisión:

```text
NO autoriza una operación futura
NO reabre una concesión expirada
NO evita revalidación
```

Solo conserva causalidad y evidencia.

---

#### 100. Append principal

Se congela:

```text
audit.append_authorization_permission_change(jsonb) → jsonb
```

Recibe un envelope completo del cambio confirmado y materializa atómicamente:

- change set;
- items;
- links obligatorios.

---

#### 101. Argumento del append principal

La identidad lógica del único parámetro es:

```text
change
```

El caller no suministra como autoridad:

- recorded_at;
- fingerprints finales;
- retention class libre;
- sensitivity class libre;
- audit schema version libre;
- actor override.

---

#### 102. Validaciones del append principal

Antes de insertar debe validar:

1. forma contractual;
2. identidad de change set;
3. actor/principal;
4. decision reference cuando aplique;
5. correlation;
6. source kind;
7. subject kind;
8. permission key exacta;
9. lane;
10. effect;
11. change kind;
12. before/after shape;
13. changed fields;
14. dataset version/hash;
15. reason/source/approval requeridos;
16. cardinalidad de items;
17. orden determinista;
18. canonicalización;
19. fingerprints;
20. idempotencia.

---

#### 103. Seguridad del append principal

La futura función es candidata a:

```text
VOLATILE
SECURITY DEFINER
AUDIT_APPEND_FUNCTION
```

solo porque debe escribir una capa privada que los callers no pueden modificar directamente.

Requiere la excepción individual de `SUPA-ARC-014` antes de materializarse.

---

#### 104. Reglas `SECURITY DEFINER`

Si se materializa como `SECURITY DEFINER`:

- owner no interactivo;
- `search_path` fijo y mínimo;
- referencias totalmente calificadas;
- `PUBLIC EXECUTE` revocado;
- `anon` sin execute;
- `authenticated` sin execute;
- grants exactos a callers técnicos aprobados;
- validación interna de inputs;
- cero SQL dinámico abierto.

---

#### 105. Append de attempts

Se congela:

```text
audit.append_authorization_permission_change_attempt(jsonb) → text
```

No puede insertar un change set exitoso.

No puede declarar un efecto comprometido si no existe evidencia.

---

#### 106. Función de inmutabilidad

Se congela:

```text
audit.reject_authorization_permission_audit_mutation()
```

Clase:

```text
TRIGGER_FUNCTION
```

Rechaza `UPDATE` y `DELETE` ordinarios sobre las relaciones append-only de 012.

---

#### 107. No UPDATE del audit

Queda prohibido corregir historia con:

```text
UPDATE audit.authorization_permission_changes
```

Una corrección utiliza el mecanismo `AUDIT_CORRECTION` de la capa transversal y un link `CORRECTION`.

---

#### 108. No DELETE del audit

Aplicaciones, administradores funcionales y servicios ordinarios no eliminan evidencia.

La disposición por retención pertenece al mecanismo gobernado por `SUPA-ARC-022`.

---

#### 109. Idempotencia del change set

Mismo `change_set_id` y mismo fingerprint:

```text
→ retorno idempotente
```

Mismo `change_set_id` con fingerprint diferente:

```text
→ INTEGRITY_CONFLICT
→ fail closed
```

---

#### 110. Idempotencia de item

Mismo `permission_change_id` y mismo fingerprint:

```text
→ idempotente
```

Mismo ID con otra semántica:

```text
→ conflicto
```

No se crea un ID con sufijo para ocultar la colisión.

---

#### 111. Orden de items

Los items de un change set usan:

```text
change_ordinal
```

contiguo, único y determinista.

El orden no sustituye causalidad entre comandos distintos.

---

#### 112. Cardinalidad declarada

Debe cumplirse:

```text
change_count
=
COUNT(items del change_set)
```

Un cambio exitoso con `change_count = 0` es inválido.

Un no-op pertenece a attempts.

---

#### 113. Change set bulk

Una operación bulk válida puede contener varios items cuando comparte:

- comando;
- autorización aplicable;
- causa;
- frontera transaccional;
- aprobación;
- resultado.

No se usa bulk para mezclar causas o autoridades incompatibles.

---

#### 114. Bulk parcial prohibido

Si el comando es contractualmente atómico:

```text
item 1 aplicado
item 2 falla
→ rollback completo
```

No se confirma un change set parcial.

Si un proceso permite parcialidad por contrato, cada subresultado requiere identidad y evidencia propias.

---

#### 115. Reautorización ante cambio concurrente

Si una precondición autorizativa cambia entre evaluación y commit:

```text
DECISIÓN STALE
→ NO MUTACIÓN
→ nuevo request
→ nueva evaluación
```

No se reutiliza el `decision_id` anterior.

---

#### 116. Scope widening

Un cambio que amplía alcance se trata como operación sensible.

Debe validar el máximo de `AUTH-CAT-011` y la cobertura administrativa del actor.

No se deriva globalidad desde `null`.

---

#### 117. Scope narrowing

Reducir alcance también es un cambio de autoridad y se audita.

No se omite por ser una reducción de privilegio.

Puede afectar operación pendiente y requiere invalidación conforme a los contratos de frescura.

---

#### 118. Grant creation

Crear un grant registra:

- sujeto;
- permiso;
- lane;
- scope;
- vigencia;
- motivo;
- aprobaciones;
- dataset/version;
- decisión autorizante;
- after fingerprint.

---

#### 119. Grant revocation

Revocar un grant registra:

- referencia original;
- before state;
- estado de revocación;
- actor;
- causa;
- instante;
- decisión;
- invalidación requerida por contrato.

No borra la fila histórica ordinariamente.

---

#### 120. Deny creation

Crear un deny registra explícitamente:

- clase de deny;
- sujeto;
- permiso exacto;
- lane;
- scope;
- vigencia;
- razón;
- aprobación;
- fuente.

No se genera por simple ausencia de grant.

---

#### 121. Deny revocation

Retirar un deny es un cambio sensible independiente.

No se corrige agregando un grant contrario.

El audit debe poder demostrar quién retiró la restricción y con qué autorización.

---

#### 122. Actor-wide deny

Un `ACTOR_WIDE_DENY` registra:

```text
subject_kind = EMPLOYEE
lane = ALL_COMPATIBLE
effect = DENY
```

Nunca se origina desde un rol, dispositivo o sede seleccionada.

---

#### 123. Expiración automática

Una expiración ejecutada por job conserva:

```text
technical_principal_id
process reference
source rule
previous state
new state
```

No inventa `effective_actor_id` humano.

---

#### 124. Autoaprobación

El audit debe permitir probar que:

```text
beneficiario
solicitante
aprobador
```

cumplieron la segregación exigida.

012 no define quién puede aprobar; conserva la evidencia para comprobarlo.

---

#### 125. Doble aprobación

Cuando el permiso o alcance exija doble aprobación, el audit enlaza la evidencia correspondiente.

No degrada dos aprobadores a un booleano.

---

#### 126. Administrador local

Un actor con autoridad territorial limitada solo puede cambiar permisos dentro de esa cobertura.

El audit conserva suficiente referencia territorial para demostrarlo sin duplicar el perfil completo del actor.

---

#### 127. Self-service prohibido

Un trabajador ordinario no puede modificar sus propios grants/denies porque pueda leer su registro.

Lectura y administración permanecen capacidades diferentes.

---

#### 128. Cambio de rol no pertenece a 012

Asignar a un trabajador otro rol base es un hecho laboral/identitario propietario.

012 no duplica ese lifecycle como permission change.

Puede existir un link si el cambio de rol provoca una reconciliación de permisos, pero la fuente original permanece fuera de 012.

---

#### 129. Cambio de turno no pertenece a 012

Turno, check-in y rol operativo efectivo forman parte de contexto laboral.

No se auditan como cambios de permisos dentro de 012.

---

#### 130. Cambio de dispositivo no pertenece a 012

La activación o revocación de un dispositivo permanece en 014.

Que el dispositivo limite capacidades no lo convierte en una matriz de permisos.

---

#### 131. Query por ID

Se congela:

```text
audit.get_authorization_permission_change(text) → jsonb
```

Entrada:

```text
change_set_id
```

Devuelve una proyección privada del change set y sus items para un caller técnico autorizado.

---

#### 132. Search privada

Se congela:

```text
audit.search_authorization_permission_changes(jsonb) → jsonb
```

No acepta SQL libre.

No es una RPC Data API para `authenticated`.

---

#### 133. Filtros permitidos

La búsqueda puede acotar por:

```text
change_set_id
permission_change_id
authorization_decision_id
correlation_id
effective_actor_id
principal_id
subject_kind
subject_reference
permission_key
lane
effect
source_kind
change_kind
occurred_from
occurred_to
limit
cursor
```

Los filtros reducen resultados; no conceden acceso.

---

#### 134. Paginación

La búsqueda usa cursor estable basado en:

```text
occurred_at
+
change_set_id
```

o identidad equivalente con orden total.

No usa `OFFSET` profundo como estrategia canónica de historiales grandes.

---

#### 135. Limit obligatorio

Toda búsqueda aplica límite máximo.

El valor físico exacto se fija en implementación y benchmark según `SUPA-ARC-021`.

No existe búsqueda ilimitada por omisión.

---

#### 136. Search por actor

La búsqueda por actor es sensible.

No expone automáticamente:

- todos los permisos de la organización;
- motivos disciplinarios;
- investigaciones;
- identidades de terceros.

---

#### 137. Search por permission key

Debe poder reconstruirse:

```text
permission_key
+
rango temporal
→ historial de cambios autorizado
```

sin depender de scans de payload JSON.

---

#### 138. Search por sujeto

Debe poder investigarse:

```text
BASE_ROLE + role_code
OPERATIONAL_ROLE + role_code
EMPLOYEE + employee_id
```

respetando finalidad y alcance del investigador.

---

#### 139. Search por decisión

Debe poder seguirse:

```text
decision_id
→ change set
→ items
```

para demostrar qué cambio administrativo fue autorizado por esa decisión.

---

#### 140. Search por correlación

Debe poder reconstruirse:

```text
request
→ AuthorizationDecision
→ permission change
→ invalidación/efectos posteriores
```

sin usar timestamp como única causalidad.

---

#### 141. API pública genérica prohibida

012 no crea:

```text
api.search_all_permission_audit
```

o equivalente genérico para roles cliente.

Una UI administrativa futura deberá exponer una proyección mínima con permiso, finalidad, territorio, filtros y límites explícitos.

---

#### 142. Acceso directo al schema `audit`

Objetivo:

```text
PUBLIC = 0
anon = 0
authenticated = 0
```

para acceso directo a tablas y primitivas privadas de 012.

---

#### 143. `service_role`

`service_role` no recibe privilegios globales de auditoría por defecto.

Los servicios aprobados usan grants nominales sobre firmas exactas.

`service_role` no es autoridad empresarial.

---

#### 144. RLS como defensa en profundidad

Las relaciones futuras habilitan RLS conforme al contrato de `SUPA-ARC-015`.

No se crean policies cliente de lectura o escritura directa.

La protección se evalúa además junto a ACL, owner y funciones privilegiadas.

---

#### 145. `FORCE ROW LEVEL SECURITY`

La futura implementación verifica explícitamente:

- owner;
- `BYPASSRLS`;
- `ENABLE RLS`;
- `FORCE ROW LEVEL SECURITY` cuando aplique;
- ejecución de funciones `SECURITY DEFINER`.

No se asume que RLS habilitado es suficiente para el owner.

---

#### 146. Default privileges

La migration debe comprobar que nuevos objetos no hereden:

```text
PUBLIC EXECUTE
```

o grants cliente accidentales.

Se captura ACL antes y después.

---

#### 147. `search_path`

Las funciones privilegiadas usan `search_path` fijo y mínimo.

Referencia objetivo:

```text
pg_catalog, audit, app_private
```

Las dependencias continúan calificadas.

---

#### 148. SQL dinámico

No existe necesidad de SQL dinámico abierto para el contrato principal.

Quedan prohibidos nombres de:

- schema;
- tabla;
- columna;
- función;
- order clause;
- predicate;

suministrados libremente por callers.

---

#### 149. Integridad referencial con 032

Cuando `authorization_decision_id` exista, debe resolver a una decisión persistida válida.

Un change set no crea un decision ID huérfano para aparentar autorización.

---

#### 150. Cambios de sistema sin decisión humana

Cuando una transición automática legítima no requiera una nueva decisión humana, el audit conserva:

- regla que la habilita;
- principal técnico;
- source record;
- versión contractual;
- causation;
- evento o job aplicable.

No fabrica un actor humano.

---

#### 151. Seguridad de motivos

Razones de investigación, disciplina, seguridad o conflicto de interés pueden ser sensibles.

El audit conserva código y referencia mínima.

No copia el expediente completo.

---

#### 152. PII

No almacenar por defecto:

- nombre;
- correo;
- teléfono;
- documento;
- dirección;
- foto;
- datos médicos;
- texto disciplinario completo.

Los IDs y referencias bastan para atribución técnica.

---

#### 153. Secretos

Queda prohibido persistir:

- JWT;
- refresh token;
- API key;
- PIN;
- password;
- credential secret;
- private key;
- raw session token.

---

#### 154. Logs

Logs técnicos pueden incluir:

- change_set_id protegido;
- correlation_id protegido;
- operation;
- item count;
- source kind;
- latency;
- result.

No incluyen before/after completos.

---

#### 155. Métricas

Métricas mínimas:

```text
authorization_permission_changes_total
authorization_permission_change_attempts_total
authorization_permission_change_denied_total
authorization_permission_change_conflict_total
authorization_permission_audit_write_error_total
authorization_permission_audit_query_total
authorization_permission_audit_query_denied_total
authorization_permission_audit_query_latency
```

---

#### 156. Dimensiones de métricas

Se permiten dimensiones de baja cardinalidad como:

- source kind;
- change kind;
- lane;
- effect;
- result;
- app code cuando aplique.

No usar como labels:

- change_set_id;
- employee_id;
- decision_id;
- correlation_id;
- permission_change_id.

---

#### 157. Retención

Cada registro declara:

```text
retention_class
```

012 no inventa periodos en días.

El periodo y disposición pertenecen a `SUPA-ARC-022`.

---

#### 158. Legal hold

Un legal hold:

- impide disposición destructiva;
- no cambia el hecho;
- no cambia fingerprints;
- no concede lectura;
- no reactiva un permiso;
- no suspende reglas de autorización.

---

#### 159. Archivado

El archivo debe preservar:

- change set;
- items;
- links;
- attempts;
- fingerprints;
- versiones;
- correlación;
- identidad mínima;
- capacidad de búsqueda investigativa autorizada.

---

#### 160. Restore

Después de restore se valida:

```text
conteos
unicidad
FKs aplicables
fingerprints
item cardinality
links
attempts
RLS
ACL
funciones
búsquedas
```

No se regeneran cambios históricos desde el estado actual.

---

#### 161. Backup

`AUTH-DB-029` debe incluir en su inventario futuro:

- tablas de 012;
- funciones;
- trigger de inmutabilidad;
- constraints;
- indexes;
- ACL;
- RLS;
- políticas de retención;
- evidencia de restore.

---

#### 162. Crecimiento

Las relaciones se diseñan para crecimiento append-only y potencial partición temporal.

012 no fija un intervalo de partición independiente de `SUPA-ARC-021` y `SUPA-ARC-022`.

---

#### 163. Query patterns obligatorios

La futura estrategia física debe soportar:

```text
change_set_id
decision_id + time
correlation_id + time
actor + time
subject + time
permission_key + time
source_kind + time
change_kind + time
attempt result + time
```

---

#### 164. Índices

La futura migration debe justificar con planes, al menos:

- PK de change sets;
- PK de items;
- PK de attempts;
- unique fingerprints donde aplique;
- lookup por decision;
- lookup por correlation;
- lookup por actor;
- lookup por permission;
- lookup por subject;
- lookup temporal;
- lookup de attempts.

No se crean índices redundantes por intuición.

---

#### 165. Planes de ejecución

Se captura evidencia de `EXPLAIN` o equivalente para búsquedas críticas.

Un índice existente no se considera prueba de rendimiento por sí solo.

---

#### 166. Integridad change set/items

Debe cumplirse:

```text
change_count = COUNT(items)
```

además de:

```text
change_ordinal único dentro del set
```

No existen items huérfanos.

---

#### 167. Integridad before/after

Reglas:

```text
CREATE
→ before null

operación sobre registro existente
→ before no null

cambio efectivo
→ before_fingerprint != after_fingerprint
```

salvo operaciones de metadata que explícitamente no cambien autoridad.

---

#### 168. No-op

Si before y after son semánticamente iguales:

```text
NO_CHANGE attempt
```

No se crea un cambio de autoridad ficticio.

---

#### 169. Concurrencia

Todo writer sensible usa versión esperada o mecanismo equivalente para evitar overwrite silencioso.

Un conflicto produce:

```text
CONFLICT attempt
```

y nueva solicitud después de refrescar estado.

---

#### 170. Idempotency key

La clave de idempotencia pertenece al comando administrativo.

El audit conserva una referencia o fingerprint, no el payload sensible completo.

Una clave fallida no se marca como cambio exitoso.

---

#### 171. Cambio y frescura

Un cambio de grant/deny que altere autoridad debe disparar la invalidación definida por `AUTH-DB-035`.

La auditoría conserva referencia al cambio; no implementa otro sistema de cache invalidation.

---

#### 172. Invalidación no es audit

```text
OUTBOX DE INVALIDACIÓN
≠
AUDIT DE CAMBIO
```

Ambos pueden compartir correlación, pero tienen responsabilidades distintas.

---

#### 173. Cambio masivo de matriz

Una publicación versionada de matriz puede afectar múltiples filas.

El audit registra:

- release/dataset anterior;
- release/dataset nuevo;
- hash anterior;
- hash nuevo;
- conteo de items;
- items realmente cambiados;
- source reference.

No duplica filas sin cambio para inflar evidencia.

---

#### 174. Diff de dataset

Para cambios de matriz, la evidencia distingue:

```text
ADDED
REMOVED
SCOPE_CHANGED
VALIDITY_CHANGED
STATUS_CHANGED
```

como resultado derivado del diff, sin crear un segundo catálogo de permisos.

---

#### 175. `REMOVED` en dataset

Retirar una fila de un release nuevo no borra el release histórico anterior.

El audit conserva el diff y ambos hashes.

---

#### 176. Drift

Si el estado físico difiere del dataset publicado sin un change set correspondiente:

```text
DRIFT AUTORIZATIVO
→ FAIL
→ incidente
```

No se fabrica retrospectivamente un audit para esconderlo.

---

#### 177. Reconciliación de drift

La corrección de drift:

- identifica estado esperado;
- identifica estado observado;
- identifica origen conocido/desconocido;
- requiere autorización;
- aplica migration/comando forward;
- genera change set nuevo;
- conserva incidente previo.

---

#### 178. Cambios manuales de Dashboard

Una mutación manual de permisos mediante Dashboard no es workflow objetivo.

Si ocurre como intervención excepcional autorizada, debe quedar:

- registrada como incidente/mantenimiento;
- reconciliada en `vento-shell`;
- auditada con procedencia;
- seguida por drift check.

No se convierte en fuente canónica.

---

#### 179. Migration de permisos

Una migration que materialice un dataset inicial o corrija autoridad debe declarar:

- source contract;
- hash;
- identidad técnica;
- motivo de migración;
- conteos;
- baseline;
- resultado;
- rollback;
- relación con audit.

No se atribuye a un humano inexistente.

---

#### 180. Seed inicial

La carga inicial de un dataset canónico no se presenta como cientos de decisiones humanas individuales si proviene de un release aprobado.

Puede representarse mediante un change set de clase migración/release con items deterministas y referencia al artefacto aprobado.

---

#### 181. Auditoría de catálogos immutable

Una versión publicada no se modifica in-place.

Un cambio produce:

```text
nueva versión
+
nuevo hash
+
diff auditado
```

La historia de versiones permanece reproducible.

---

#### 182. Funciones de query son read-only

`get`, `search` y `list`:

- no ejecutan DML;
- no cambian sesión;
- no generan audit recursivo por cada fila leída;
- no abren acceso por estar dentro de `audit`.

La auditoría de consultas sensibles puede registrarse en una frontera administrativa separada aprobada.

---

#### 183. Query de audit sensible

Consultar historial de denegaciones o cambios individuales puede revelar información sensible de seguridad y empleo.

Una futura proyección cliente requiere permiso específico y minimización.

012 no inventa ese permiso.

---

#### 184. Anti-enumeración

La superficie pública futura no distinguirá innecesariamente:

- registro inexistente;
- registro existente pero fuera de alcance;
- trabajador ajeno;
- permiso sensible ajeno.

La query privada puede diferenciar internamente para soporte autorizado.

---

#### 185. Correcciones

Una corrección de audit utiliza una entrada enlazada.

Nunca cambia:

- before original;
- after original;
- actor original;
- timestamp original;
- fingerprint original.

---

#### 186. Rollback de código

Un rollback de deployment no borra cambios de permisos que realmente ocurrieron.

Debe conservar:

- change sets;
- items;
- attempts;
- links;
- incidentes;
- compensaciones administrativas.

---

#### 187. Reversión de un permiso

Revertir una concesión o deny es una nueva operación autorizativa.

Genera:

```text
nuevo change_set_id
```

No elimina el cambio anterior.

---

#### 188. Rollback antes de adopción

Si 012 se materializa pero ningún writer fue adoptado:

```text
1. verificar cero consumidores
2. revocar execute de funciones 012
3. retirar funciones mediante migration forward
4. retirar relaciones vacías si el plan lo permite
5. conservar audit transversal ajeno
6. validar ACL/RLS/drift
```

No se usa `DROP CASCADE`.

---

#### 189. Rollback con datos

Si existen change sets reales:

```text
NO DROP DE EVIDENCIA
```

El rollback:

- detiene nuevas escrituras;
- revierte adopción de writers;
- conserva audit;
- registra incidente;
- mantiene capacidad de investigación.

---

#### 190. Restore rehearsal

La futura instancia debe demostrar en ambiente aislado:

1. backup identificable;
2. restore;
3. conteos;
4. unicidad;
5. change_count;
6. item order;
7. fingerprints;
8. links;
9. attempts;
10. RLS;
11. ACL;
12. funciones;
13. búsquedas;
14. no reinterpretación histórica.

---

#### 191. Dependencias físicas de `AUTH-DB-012::GLOBAL`

Antes de autorizar la instancia debe existir evidencia compatible de:

```text
AUTH-DB-016::GLOBAL
AUTH-DB-018::GLOBAL
AUTH-DB-019::GLOBAL
AUTH-DB-033::GLOBAL
AUTH-DB-035::GLOBAL
AUTH-DB-034::GLOBAL
AUTH-DB-032::GLOBAL
AUTH-DB-027
AUTH-DB-028
AUTH-DB-029
SUPA-ARC-007 vigente
SUPA-ARC-015 vigente
SUPA-ARC-021 vigente
SUPA-ARC-022 vigente
```

La ausencia de una dependencia bloquea solo la materialización física, no el cierre documental.

---

#### 192. Manifiesto de implementación

La futura evidencia debe registrar:

```text
instance_id
project_ref
environment
migration_files
source_contract_sha256
audit_contract_version
permission_catalog_version
base_role_dataset_version
operational_role_dataset_version
override_dataset_version
table_inventory
function_inventory
trigger_inventory
constraint_inventory
index_inventory
rls_snapshot
acl_snapshot_before
acl_snapshot_after
legacy_source_inventory
writer_inventory
coverage_matrix
query_plan_evidence
rollback_plan
restore_evidence
validation_commands
```

---

#### 193. Matriz de cobertura de writers

Cada writer que pueda alterar autoridad deberá declarar:

```text
writer_id
owner_schema
source_kind
command_identity
current_location
target_location
audit_mode
transaction_mode
idempotency_mode
authorization_mode
adoption_status
package_id cuando aplique
```

No se certifica 100% de cobertura por contar tablas.

---

#### 194. Estados de adopción

Vocabulario:

```text
NOT_ADOPTED
TRANSITIONAL_ADAPTER
CANONICAL_AUDITED
BLOCKED
RETIRED
```

La infraestructura global puede estar instalada mientras algunos writers continúan `NOT_ADOPTED`; ese hecho debe permanecer visible hasta R2.

---

#### 195. Criterio de cobertura completa

La cobertura global de cambios de permisos solo puede declararse completa cuando:

```text
writers relevantes identificados = writers relevantes cubiertos
+
cero writer activo sin audit obligatorio
+
cero direct write cliente
+
cero drift no explicado
```

012 no declara anticipadamente ese estado durante su desarrollo documental.

---

#### 196. Orden físico de materialización futura

```text
1. verificar dependencias R1
2. capturar baseline de permisos y audit
3. verificar existencia de audit
4. crear change_sets
5. crear change_items
6. crear attempts
7. crear links
8. crear constraints
9. crear indexes mínimos
10. crear canonicalizer/fingerprint helpers
11. crear append functions
12. crear query functions
13. crear inmutability trigger
14. aplicar RLS/ACL/default privileges
15. registrar contract/version metadata
16. probar append atomicity
17. probar idempotency
18. probar security
19. probar privacy
20. probar queries y plans
21. probar backup/restore
22. registrar writer coverage inicial
23. validar que legacy no fue marcado como cubierto por inferencia
24. ejecutar drift final
25. registrar evidencia
```

No hay ejecución física en esta tarea documental.

---

#### 197. Pruebas — identidad y forma

La futura instancia debe demostrar:

1. `change_set_id` único;
2. `permission_change_id` único;
3. `change_attempt_id` único;
4. `permission_change_link_id` único;
5. change set con schema version válida;
6. actor/principal separados;
7. technical principal separado;
8. decision reference válida;
9. correlation preservada;
10. causation preservada;
11. reason code válido;
12. source reference mínima;
13. approval reference cuando aplica;
14. sensitivity class;
15. retention class.

---

#### 198. Pruebas — source kinds

16. catalog release válido;
17. base role grant válido;
18. operational role grant válido;
19. individual override válido;
20. explicit denial válido;
21. source kind desconocido falla;
22. tabla física no sustituye source kind;
23. dataset id/version/hash consistentes.

---

#### 199. Pruebas — subjects

24. base role subject;
25. operational role subject;
26. employee subject;
27. catalog subject;
28. subject desconocido falla;
29. employee ID no se reemplaza por auth user ID por inferencia;
30. subject no cambia in-place.

---

#### 200. Pruebas — permiso, lane y effect

31. permission key exacta;
32. wildcard rechazado;
33. alias legacy rechazado como identidad nueva;
34. BASE válido;
35. OPERATIONAL válido;
36. ALL_COMPATIBLE solo para deny transversal;
37. ALLOW válido;
38. DENY válido;
39. effect flip in-place rechazado;
40. lane flip in-place rechazado;
41. permission key rename in-place rechazado.

---

#### 201. Pruebas — change kinds

42. CREATE;
43. ACTIVATE;
44. CHANGE_SCOPE;
45. CHANGE_VALIDITY;
46. SUSPEND;
47. REVOKE;
48. EXPIRE;
49. REJECT;
50. SUPERSEDE;
51. MIGRATE;
52. CORRECT_METADATA;
53. CATALOG_RELEASE_ACTIVATED;
54. change kind desconocido falla.

---

#### 202. Pruebas — before/after

55. CREATE before null;
56. CREATE after presente;
57. existing mutation before presente;
58. scope diff real;
59. validity diff real;
60. fingerprints distintos ante cambio efectivo;
61. no-op no crea item;
62. snapshots minimizados;
63. nombres humanos ausentes;
64. JWT ausente;
65. secrets ausentes.

---

#### 203. Pruebas — denegaciones

66. explicit deny se audita;
67. default deny no fabrica change;
68. BASE_DENY conserva lane;
69. OPERATIONAL_DENY conserva lane;
70. ACTOR_WIDE_DENY conserva ALL_COMPATIBLE;
71. deny creation registra causa;
72. deny revocation registra causa;
73. grant contrario no borra deny histórico;
74. deny nuevo no reescribe decisiones históricas.

---

#### 204. Pruebas — concesiones

75. base grant creation;
76. operational grant creation;
77. individual grant creation;
78. scope widening auditado;
79. scope narrowing auditado;
80. validity change auditado;
81. suspend auditado;
82. revoke auditado;
83. expire auditado;
84. supersede auditado;
85. no silent renewal.

---

#### 205. Pruebas — atomicidad

86. source mutation + change set mismo commit;
87. item failure revierte source mutation;
88. audit failure revierte source mutation;
89. source mutation failure no confirma change set;
90. success no se responde antes del audit;
91. bulk atomic rollback;
92. no audit-after-commit;
93. no trigger-only attribution.

---

#### 206. Pruebas — idempotencia y concurrencia

94. same change set + same fingerprint idempotente;
95. same change set + different fingerprint falla;
96. same item + same fingerprint idempotente;
97. same item + different fingerprint falla;
98. stale version produce conflict;
99. conflict no aplica last-write-wins;
100. retry no duplica autoridad;
101. failed idempotency key no se marca success.

---

#### 207. Pruebas — attempts

102. DENIED attempt;
103. INVALID attempt;
104. CONFLICT attempt;
105. TECHNICAL_FAILURE attempt;
106. NO_CHANGE attempt;
107. ROLLED_BACK solo con prueba;
108. attempt no crea change item;
109. denied attempt referencia decision;
110. technical failure no fabrica deny;
111. unknown outcome no fabrica rolled back.

---

#### 208. Pruebas — links

112. AUTHORIZATION_DECISION link;
113. APPROVAL link;
114. SOURCE_EVIDENCE link;
115. INCIDENT link;
116. CORRECTION link;
117. MIGRATION link;
118. AUDIT_ENTRY link;
119. link kind desconocido falla;
120. link no concede autoridad;
121. item link opcional válido;
122. set-level link válido.

---

#### 209. Pruebas — inmutabilidad

123. UPDATE change set rechazado;
124. DELETE change set rechazado;
125. UPDATE item rechazado;
126. DELETE item rechazado;
127. UPDATE attempt rechazado;
128. DELETE attempt rechazado;
129. corrección usa entrada enlazada;
130. reversión usa nuevo change set;
131. rollback de código conserva historia.

---

#### 210. Pruebas — seguridad

132. audit fuera de Data API;
133. PUBLIC sin acceso;
134. anon sin acceso;
135. authenticated sin acceso directo;
136. service role sin acceso global por defecto;
137. grants nominales;
138. fixed search path;
139. search-path poisoning falla;
140. homonym table no se resuelve;
141. homonym function no se resuelve;
142. SQL injection falla;
143. relation-name injection falla;
144. order-clause injection falla.

---

#### 211. Pruebas — privacidad

145. no JWT;
146. no refresh token;
147. no PIN;
148. no credentials;
149. no documento personal;
150. no correo innecesario;
151. no nombre humano innecesario;
152. justificación extensa por referencia;
153. motivo sensible minimizado;
154. logs sin before/after completo.

---

#### 212. Pruebas — búsqueda

155. get por change set;
156. search por decision;
157. search por correlation;
158. search por actor;
159. search por subject;
160. search por permission;
161. search por source kind;
162. search por change kind;
163. time bounds;
164. cursor estable;
165. limit obligatorio;
166. no arbitrary SQL;
167. no wildcard de subject sensible;
168. no total global no autorizado.

---

#### 213. Pruebas — datasets y drift

169. base dataset version/hash;
170. operational dataset version/hash;
171. override dataset version/hash;
172. release diff determinista;
173. added item;
174. removed item;
175. scope changed item;
176. status changed item;
177. unchanged row no genera item;
178. drift sin audit falla;
179. reconciliación de drift genera nuevo change set;
180. no backfill de actor inventado.

---

#### 214. Pruebas — restore y crecimiento

181. backup incluye objetos 012;
182. restore conserva change sets;
183. restore conserva items;
184. restore conserva attempts;
185. restore conserva links;
186. restore conserva fingerprints;
187. restore conserva versions;
188. RLS tras restore;
189. ACL tras restore;
190. query plan por permission;
191. query plan por actor;
192. query plan por correlation;
193. query plan por subject;
194. métricas sin high-cardinality IDs;
195. partition readiness compatible.

---

#### 215. Pruebas — fronteras

196. 032 no absorbida;
197. 013 no absorbida;
198. 014 no absorbida;
199. 020 conserva migración por dominio;
200. role assignment no duplicado;
201. shift/check-in no duplicados;
202. device lifecycle no duplicado;
203. catalog ownership no transferido;
204. audit no se vuelve autoridad;
205. historic ALLOW no se vuelve token;
206. current deny no reescribe historia;
207. no per-app audit tables;
208. audit schema ausente bloquea instancia física.

---

#### 216. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Justificación:** la obligación de auditar de forma correlacionable decisiones, operaciones administrativas, denegaciones, reintentos y rollback ya está registrada en el inventario canónico de pruebas y asigna expresamente responsabilidad a esta familia de tareas. `AUTH-DB-012` materializa esa obligación para cambios de autoridad sin introducir una capacidad empresarial, una regla de autorización, una taxonomía funcional o una semántica de prueba nueva.

---

#### 217. Cobertura de prueba vigente reutilizada

La cobertura heredada incluye `TREQ-AUTH-015`, que exige evidencia correlacionable para decisiones y acciones protegidas y asigna responsabilidad a `AUTH-DB-012` a `AUTH-DB-014` junto con la persistencia de decisiones y la certificación posterior.

También se reutilizan los requisitos vigentes de seguridad, segregación, frescura, denegaciones, integración y auditoría ya enlazados por los contratos consumidos.

Esta sección es únicamente trazabilidad.

No modifica el Registro Canónico de Requisitos de Prueba.

---

#### 218. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| --------- | -------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | el desarrollo documental no creó migrations, tablas, funciones, triggers, indexes, policies, código runtime ni artefactos de build                                                                                                                                                                                                                                                                                                           |
| LOCAL     | NOT_EXECUTED   | pendiente de insertar `AUTH-DB-012` en su rama documental, ejecutar el formateo canónico y correr los validadores reales del checkout actualizado                                                                                                                                                                                                                                                                                            |
| REMOTA    | PASS           | `main` confirma `AUTH-DB-032` cerrada y `AUTH-DB-012` como siguiente marcador; topología `GLOBAL_ENABLE_ONCE` con gate `PRE_E5_FOUNDATION`; 04A ya asigna cobertura a `AUTH-DB-012..014`; auditoría read-only de `vento-os-dev` observó 179 permisos, 613 grants base físicos, 17 permisos individuales, 32 grants operativos, cero denies en las tres fuentes con `is_allowed`, ningún audit trigger canónico y ausencia del schema `audit` |
| OPERATIVA | NOT_APPLICABLE | no se modificaron UI, permisos de trabajadores, matrices, sesiones, turnos, dispositivos, RPC, RLS, consumidores ni comportamiento operativo                                                                                                                                                                                                                                                                                                 |
| FÍSICA    | NOT_APPLICABLE | no se ejecutó SQL mutante, no se creó migration, no se alteró Supabase y `AUTH-DB-012::GLOBAL` no fue autorizada                                                                                                                                                                                                                                                                                                                             |

---

#### 219. Decisiones vinculantes

1. La futura instancia es `AUTH-DB-012::GLOBAL`.
2. Su modo es `GLOBAL_ENABLE_ONCE`.
3. Su gate es `PRE_E5_FOUNDATION`.
4. Requiere el schema transversal `audit`.
5. No crea auditoría por aplicación.
6. No crea auditoría por dominio.
7. `audit` no gana autoridad empresarial.
8. La decisión de autorización permanece en 032.
9. El cambio de autoridad permanece en 012.
10. La simulación permanece en 013.
11. El dispositivo permanece en 014.
12. La migración de writers permanece en 020.
13. Se auditan releases autorizativos relevantes.
14. Se auditan grants base.
15. Se auditan grants operativos.
16. Se auditan overrides individuales.
17. Se auditan denies explícitos.
18. Default deny no es explicit deny.
19. Cambio actual no reescribe historia.
20. El baseline legacy no se adopta como target.
21. Cero denies actuales no elimina el contrato.
22. RLS actual no sustituye audit.
23. Broad grants actuales no sustituyen audit.
24. Se crea change set lógico.
25. Se crea item lógico.
26. Se crea attempt lógico.
27. Se crea link lógico.
28. Change set ID es servidor-side.
29. Permission change ID es distinto.
30. Attempt ID es distinto.
31. Principal y actor permanecen separados.
32. Technical principal permanece separado.
33. Device es contexto, no actor.
34. Decision ID se referencia, no se duplica.
35. SYSTEM requiere identidad técnica real.
36. Reason code es normalizado.
37. Justificación extensa usa referencia.
38. Approval usa referencia verificable.
39. Source kind es vocabulario cerrado.
40. Subject kind es vocabulario cerrado.
41. Permission key es exacta.
42. Wildcards están prohibidos.
43. Lane es explícito.
44. Effect es explícito.
45. Effect no cambia in-place.
46. Lane no cambia in-place.
47. Permission key no cambia in-place.
48. Subject no cambia in-place.
49. Change kind es cerrado.
50. CREATE exige before null.
51. Scope change conserva before/after.
52. Validity change se audita.
53. Suspend se audita.
54. Revoke se audita.
55. Expire se audita.
56. Supersede se audita.
57. Migrate preserva incertidumbre.
58. Metadata correction no cambia autoridad.
59. Release activation conserva hash.
60. Changed fields es determinista.
61. Before/after son minimizados.
62. No se guardan snapshots completos.
63. Se calculan fingerprints separados.
64. Canonical JSON es obligatorio.
65. Se conservan dataset versions/hashes.
66. Historia usa su versión original.
67. Attempts no son cambios.
68. DENIED attempt referencia decisión.
69. INVALID no es DENY.
70. CONFLICT no usa last-write-wins.
71. TECHNICAL_FAILURE no fabrica deny.
72. NO_CHANGE no fabrica item.
73. ROLLED_BACK requiere certeza.
74. Retry no reescribe attempt.
75. Audit store es dependencia obligatoria.
76. Cambios reales usan AUDIT_ATOMIC_REQUIRED.
77. Audit-after-commit está prohibido.
78. Éxito sin audit está prohibido.
79. Trigger-only attribution es insuficiente.
80. Writer target usa misma transacción.
81. Direct writes cliente se retiran al adoptar.
82. Legacy mantiene estado de adopción explícito.
83. No se fabrica historia antigua.
84. Gaps previos se declaran.
85. Links son tipados.
86. Links no conceden autoridad.
87. Append principal crea set/items/links.
88. Caller no controla fingerprints.
89. Caller no controla retention libremente.
90. SECURITY DEFINER requiere excepción.
91. PUBLIC EXECUTE se revoca.
92. `authenticated` no ejecuta primitives raw.
93. Inmutability trigger rechaza update/delete.
94. Corrección usa nueva evidencia.
95. Duplicado exacto es idempotente.
96. Duplicado incompatible falla.
97. Item order es determinista.
98. change_count coincide con items.
99. Bulk no mezcla causas incompatibles.
100. Bulk atómico revierte completo.
101. Concurrencia stale exige nueva evaluación.
102. Scope widening es sensible.
103. Scope narrowing también se audita.
104. Grant create conserva after.
105. Grant revoke conserva before.
106. Deny create conserva clase y causa.
107. Deny revoke es cambio sensible.
108. Actor-wide deny usa ALL_COMPATIBLE.
109. Expiración automática no inventa humano.
110. Segregación de aprobación es verificable.
111. Administrador local conserva territorio.
112. Self-service no concede administración.
113. Cambio de rol no se duplica.
114. Cambio de turno no se duplica.
115. Cambio de device no se duplica.
116. Query get es privada.
117. Search es estructurada.
118. Search no acepta SQL libre.
119. Search usa cursor estable.
120. Limit es obligatorio.
121. Search por actor es sensible.
122. Search por permission es posible.
123. Search por subject es posible.
124. Search por decision es posible.
125. Search por correlation es posible.
126. No se crea API pública genérica.
127. PUBLIC direct access es cero.
128. anon direct access es cero.
129. authenticated direct access es cero.
130. service role no es autoridad.
131. RLS es defensa en profundidad.
132. FORCE RLS se verifica explícitamente.
133. ACL defaults se verifican.
134. Fixed search path es obligatorio.
135. SQL dinámico abierto está prohibido.
136. Decision FK/ref no es huérfana.
137. System automation conserva regla y proceso.
138. Motivos sensibles se minimizan.
139. PII innecesaria está prohibida.
140. Secretos están prohibidos.
141. Logs no contienen payload completo.
142. Métricas separan resultados.
143. High-cardinality IDs no son labels.
144. Retention class es obligatoria.
145. Periodos exactos pertenecen a 022.
146. Legal hold no cambia autoridad.
147. Archive conserva trazabilidad.
148. Restore conserva fingerprints.
149. Backup incluye objetos 012.
150. Crecimiento se diseña append-only.
151. Query patterns quedan fijados.
152. Índices requieren planes.
153. Change set/items mantienen integridad.
154. No-op no crea cambio.
155. Concurrencia usa precondición.
156. Idempotency no duplica autoridad.
157. Cambios disparan invalidación de 035.
158. Invalidación no sustituye audit.
159. Bulk matrix release conserva diff.
160. Unchanged rows no se auditan como cambios.
161. Drift sin audit es incidente.
162. Reconciliación no fabrica pasado.
163. Dashboard manual no es fuente canónica.
164. Migrations conservan atribución técnica.
165. Seed inicial referencia release aprobado.
166. Catálogo publicado es inmutable.
167. Query functions son read-only.
168. Audit sensible requiere autorización propia.
169. Anti-enumeración es obligatoria.
170. Corrección no modifica original.
171. Rollback de código conserva historia.
172. Reversión genera nuevo change set.
173. Rollback sin adopción no usa cascade.
174. Rollback con datos no borra evidencia.
175. Restore rehearsal es obligatorio.
176. Dependencias físicas son explícitas.
177. Manifiesto físico es obligatorio.
178. Writer coverage matrix es obligatoria.
179. Adoption status es cerrado.
180. Cobertura completa exige cero writer activo sin audit.
181. Orden físico futuro está definido.
182. Se especifican 208 comprobaciones mínimas.
183. No se crean TREQ nuevos.
184. No se modifica 04A.
185. La siguiente tarea es AUTH-DB-013.

---

#### 220. Criterios de aceptación

`AUTH-DB-012` queda documentalmente completa cuando:

1. fija topología, instancia y gate;
2. exige `audit` como precondición;
3. preserva la precedencia R1;
4. separa decisión y cambio;
5. separa simulación;
6. separa dispositivos;
7. separa migración de writers;
8. define source kinds;
9. define cambios de catálogo relevantes;
10. define base grants;
11. define operational grants;
12. define overrides;
13. define explicit denies;
14. separa default deny;
15. preserva historia;
16. registra baseline remoto;
17. registra cero denies observados;
18. registra ausencia de audit trigger;
19. registra RLS actual;
20. registra broad grants actuales;
21. registra ausencia de audit schema;
22. define change set table;
23. define change set identity;
24. define campos mínimos;
25. define tiempo;
26. separa principal/actor/technical principal;
27. define device context;
28. define decision link;
29. define system changes;
30. define reason code;
31. define justification reference;
32. define approval reference;
33. define item table;
34. define item identity;
35. define item shape;
36. define source kind;
37. define subject kind;
38. define subject reference;
39. define exact permission key;
40. define lane;
41. define effect;
42. prohíbe effect flip;
43. prohíbe lane flip;
44. prohíbe permission rename;
45. prohíbe subject swap;
46. define change kind;
47. define create;
48. define activate;
49. define change scope;
50. define change validity;
51. define suspend;
52. define revoke;
53. define expire;
54. define reject;
55. define supersede;
56. define migrate;
57. define metadata correction;
58. define catalog release activation;
59. define changed fields;
60. define before state;
61. define after state;
62. prohíbe full snapshots;
63. define state fingerprints;
64. define item fingerprint;
65. define set fingerprint;
66. define canonicalization;
67. define dataset identity;
68. define historical versioning;
69. define attempts table;
70. define attempt identity;
71. define attempt results;
72. define denied;
73. define invalid;
74. define conflict;
75. define technical failure;
76. define no change;
77. define rolled back;
78. define attempt shape;
79. evita duplicar decision payload;
80. define retry;
81. define audit-store failure;
82. fija audit atomic required;
83. prohíbe audit after commit;
84. prohíbe success without audit;
85. prohíbe trigger-only attribution;
86. define writer target pattern;
87. define direct writes after adoption;
88. define legacy transition;
89. define no fabricated history;
90. define pre-cutover gaps;
91. define links table;
92. define link kinds;
93. define link shape;
94. define no authority by link;
95. define append principal;
96. define append argument;
97. define append validations;
98. define append security;
99. define security-definer conditions;
100. define append attempt;
101. define immutability trigger;
102. prohíbe audit update;
103. prohíbe audit delete;
104. define set idempotency;
105. define item idempotency;
106. define item order;
107. define cardinality;
108. define bulk;
109. define bulk rollback;
110. define stale reauthorization;
111. define scope widening;
112. define scope narrowing;
113. define grant creation;
114. define grant revocation;
115. define deny creation;
116. define deny revocation;
117. define actor-wide deny;
118. define automatic expiration;
119. define self-approval evidence;
120. define dual approval evidence;
121. define local-admin territory;
122. define no self-service administration;
123. separates role assignment;
124. separates shift;
125. separates device;
126. define get query;
127. define search query;
128. define filters;
129. define pagination;
130. define limit;
131. define actor search;
132. define permission search;
133. define subject search;
134. define decision search;
135. define correlation search;
136. prohibits generic public API;
137. fixes zero direct client access;
138. limits service role;
139. defines RLS defense;
140. defines FORCE RLS review;
141. defines default privileges;
142. defines search path;
143. prohibits dynamic SQL;
144. defines 032 referential integrity;
145. defines system transitions;
146. defines sensitive reasons;
147. minimizes PII;
148. prohibits secrets;
149. defines logs;
150. defines metrics;
151. defines metric dimensions;
152. defines retention;
153. defines legal hold;
154. defines archive;
155. defines restore;
156. defines backup;
157. defines growth;
158. defines query patterns;
159. defines indexes by evidence;
160. defines change-set integrity;
161. defines before/after integrity;
162. defines no-op;
163. defines concurrency;
164. defines idempotency reference;
165. links invalidation;
166. separates invalidation;
167. defines bulk matrix changes;
168. defines dataset diff;
169. defines removed rows;
170. defines drift;
171. defines drift reconciliation;
172. defines Dashboard exception;
173. defines migration audit;
174. defines initial seed audit;
175. defines immutable catalog release;
176. keeps query functions read-only;
177. protects sensitive audit queries;
178. defines anti-enumeration;
179. defines corrections;
180. defines code rollback;
181. defines permission reversal;
182. defines rollback before adoption;
183. defines rollback with data;
184. defines restore rehearsal;
185. fixes physical dependencies;
186. fixes implementation manifest;
187. fixes writer coverage matrix;
188. fixes adoption states;
189. fixes completeness criterion;
190. fixes materialization order;
191. defines 208 physical checks;
192. reuses current TREQ coverage;
193. reports five evidence classes;
194. declares zero physical changes now;
195. preserves exact continuity to AUTH-DB-013.

---

#### 221. Límites

`AUTH-DB-012` no:

- ejecuta `AUTH-DB-012::GLOBAL`;
- crea migrations en el carril documental;
- ejecuta SQL mutante;
- crea el schema `audit` por sí sola si 016 no lo materializó;
- modifica las 613 filas legacy de `role_permissions`;
- modifica los 17 registros actuales de `employee_permissions`;
- modifica las 32 filas actuales de `operational_role_permissions`;
- crea denegaciones físicas para poblar un escenario vacío;
- cambia el catálogo canónico;
- decide qué rol recibe un permiso;
- decide qué trabajador recibe una excepción;
- decide quién puede aprobar cada capacidad;
- implementa la UI administrativa;
- implementa Server Actions administrativas;
- migra objetos por dominio;
- ejecuta backfills de permisos;
- implementa RLS canónico por dominio;
- implementa `AUTH-DB-013`;
- implementa `AUTH-DB-014`;
- reemplaza `AUTH-DB-032`;
- reemplaza `AUTH-DB-035`;
- crea un event store general;
- crea outbox general;
- crea Realtime;
- crea Edge Functions;
- crea cron;
- crea otra taxonomía global de audit;
- expone audit directamente a roles cliente;
- fija periodos de retención fuera de `SUPA-ARC-022`;
- inventa historial anterior al cutover;
- edita 04A;
- crea requisitos de prueba nuevos;
- desarrolla la siguiente tarea.

---

#### 222. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-DB-032 — Implementar persistencia canónica y vinculación de decisiones de autorización`

**TAREA ACTUAL APROBADA**
`AUTH-DB-012 — Implementar auditoría de cambios de permisos`

**SIGUIENTE TAREA RESERVADA**
`AUTH-DB-013 — Implementar auditoría de simulación`


### ✅ AUTH-DB-013 — Implementar auditoría de simulación

**Estado:** APROBADA
**Tarea anterior:** AUTH-DB-012 — Implementar auditoría de cambios de permisos
**Tarea siguiente:** AUTH-DB-014 — Implementar auditoría de dispositivos
**Tipo de tarea:** Documental
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/02_R1_FUNDACION_FISICA_CANONICA.md`
**Estado físico resultante:** Contrato global de persistencia y auditoría inmutable de simulaciones, escenarios, evaluaciones y lifecycle cerrado; futura instancia `AUTH-DB-013::GLOBAL` pendiente de autorización explícita y de la capa transversal `audit`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma cerrada la futura materialización física de la auditoría de simulación de Vento OS sin convertir una evaluación hipotética en autoridad empresarial, sin mezclar el contexto real con el simulado y sin crear una segunda fuente de verdad para permisos, roles, sedes, áreas, turnos, check-ins, recursos o decisiones reales.

La tarea debe permitir demostrar de manera durable:

```text
QUIÉN REALMENTE SOLICITÓ
+
QUÉ ESCENARIO HIPOTÉTICO FUE FIJADO
+
QUÉ VERSIONES Y FINGERPRINTS SE USARON
+
QUÉ EVALUACIONES HIPOTÉTICAS SE PRODUJERON
+
QUÉ RESULTADO WOULD_* SE OBTUVO
+
CUÁNDO SE ACTIVÓ, REVISÓ, COMPLETÓ, EXPIRÓ O REVOCÓ
+
QUÉ DECISIÓN REAL AUTORIZÓ LA OPERACIÓN SOBRE EL SIMULADOR
=
EVIDENCIA DE SIMULACIÓN REPRODUCIBLE Y NO EJECUTABLE
```

`AUTH-DB-013` no concede la capacidad de simular y no implementa una mutación empresarial ejecutable. Su responsabilidad es cerrar el contrato físico compartido que conservará la evidencia de las simulaciones autorizadas, denegadas, inválidas y fallidas.

---

#### 2. Resultado canónico

La futura instancia global podrá materializar una única infraestructura compartida:

```text
audit.authorization_simulations
audit.authorization_simulation_revisions
audit.authorization_simulation_evaluations
audit.authorization_simulation_events
audit.authorization_simulation_attempts
audit.authorization_simulation_links
audit.authorization_simulation_corrections
```

y helpers privados estrictamente técnicos bajo `app_private`.

El conjunto anterior no es una aplicación, no es un dominio empresarial y no sustituye `SimulationContext@1.0.0`. Es la persistencia durable y auditable de sus identidades, snapshots, lifecycle y resultados.

---

#### 3. Clasificación topológica

La clasificación vigente queda congelada:

```text
task_id = AUTH-DB-013
mode = GLOBAL_ENABLE_ONCE
instance = AUTH-DB-013::GLOBAL
execution_gate = PRE_E5_FOUNDATION
canonical_work = DEFINE_CONTRACT_ONCE
```

Consecuencias:

1. existe como máximo una instancia física global;
2. no se repite por `package_id`;
3. la tarea documental se desarrolla una sola vez;
4. la aprobación documental no autoriza la instancia física;
5. la futura materialización se reutiliza por todos los consumidores autorizados;
6. una corrección física posterior se realiza mediante migración forward versionada;
7. ningún consumidor puede crear una auditoría local paralela.

---

#### 4. Precondición transversal obligatoria

`AUTH-DB-013::GLOBAL` requiere que exista físicamente la capa transversal aprobada por `SUPA-ARC-007`:

```text
audit
```

Si `audit` no existe, la instancia permanece bloqueada.

No se admite como sustituto:

```text
public.simulation_audit
viso.simulation_audit
identity_access.simulation_audit
una tabla por aplicación
un log de frontend
telemetría de consola
metadata libre dentro de la sesión legacy
```

---

#### 5. Fuentes normativas vinculantes

La definición conserva, sin reinterpretarlas, las decisiones de:

- `ADR-AUTH-001`;
- `AUTH-MOD-012`;
- `AUTH-CTX-003`;
- `AUTH-CTX-024`;
- `AUTH-CTX-029`;
- `AUTH-SIM-001` a `AUTH-SIM-006`;
- `AUTH-ERR-016`;
- `SUPA-ARC-007`;
- `SUPA-ARC-012`;
- `SUPA-ARC-014`;
- `SUPA-ARC-015`;
- `SUPA-ARC-021`;
- `SUPA-ARC-022`;
- `SUPA-ARC-025`;
- `AUTH-DB-016`;
- `AUTH-DB-019`;
- `AUTH-DB-033`;
- `AUTH-DB-035`;
- `AUTH-DB-034`;
- `AUTH-DB-032`;
- `AUTH-DB-012`.

Las tareas `AUTH-SIM-007..014` continúan siendo propietarias de visibilidad, lifecycle funcional, bloqueo de acciones y certificación del modo simulado; 013 no las adelanta.

---

#### 6. Precedencia entre contratos

La precedencia conceptual es:

```text
AccessContext real
→ hechos reales

SimulationContext
→ escenario hipotético

AuthorizationDecision
→ decisión real

SimulatedAuthorizationDecision
→ resultado hipotético no ejecutable

AUTH-DB-032
→ persistencia de decisión real

AUTH-DB-013
→ persistencia y auditoría de simulación

AUTH-SRV-015
→ servicio autoritativo de simulación

AUTH-QA-019
→ certificación integral
```

La persistencia no puede invertir esta dirección.

---

#### 7. Frontera con AUTH-DB-012

`AUTH-DB-012` conserva cambios reales de autoridad: altas, modificaciones y retiros de grants o denies.

`AUTH-DB-013` conserva escenarios hipotéticos y sus evaluaciones.

Por tanto:

```text
SIMULAR QUE UN ROL TENDRÍA UN PERMISO
≠
CAMBIAR EL PERMISO REAL

WOULD_ALLOW
≠
ALLOW

WOULD_DENY
≠
EXPLICIT_DENY
```

Un escenario de simulación nunca se inserta como cambio de permisos.

---

#### 8. Frontera con AUTH-DB-032

`AUTH-DB-032` conserva `AuthorizationDecision` real.

Cuando una acción real de administración del simulador —iniciar, revisar, completar, revocar o consultar una simulación— requiera autorización, 013 enlaza la decisión real producida por 032.

La evaluación hipotética interna no se almacena como `AuthorizationDecision`. Se conserva en `audit.authorization_simulation_evaluations` con resultado restringido a:

```text
WOULD_ALLOW
WOULD_DENY
INDETERMINATE
```

---

#### 9. Frontera con AUTH-DB-014

`AUTH-DB-014` conserva auditoría del ciclo de dispositivos.

013 puede registrar una referencia mínima al dispositivo real desde el que se solicitó una simulación cuando esa referencia sea necesaria para atribución, pero no registra alta, activación, cambio de actor, expiración, revocación, rotación de credenciales o retiro del dispositivo.

Esos eventos siguen perteneciendo a 014.

---

#### 10. Cuatro planos obligatoriamente separados

La implementación física deberá conservar cuatro planos:

| Plano                     | Contenido                                                      | Puede autorizar efecto real |
| ------------------------- | -------------------------------------------------------------- | --------------------------: |
| `REAL_AUTHORITY`          | principal, actor, sesión, contexto y decisión reales           |                          sí |
| `SIMULATION_SCENARIO`     | sujeto, rol, territorio, turno, check-in y recurso hipotéticos |                          no |
| `SIMULATION_PRESENTATION` | vista previa y explicación                                     |                          no |
| `SIMULATION_AUDIT`        | evidencia durable de lo ocurrido                               |                          no |

Ningún campo del plano simulado puede sustituir un hecho del plano real.

---

#### 11. Contrato de identidad raíz

La identidad durable de una simulación utiliza `simulation_id`.

Reglas:

1. se genera en servidor;
2. es única;
3. identifica una simulación, no una sesión Auth;
4. no equivale a `context_id`;
5. no equivale a `decision_id`;
6. no equivale a un recurso empresarial;
7. no se acepta como autorización en endpoints reales;
8. no se recicla después de completar, expirar, revocar o invalidar;
9. una nueva simulación crea un nuevo `simulation_id`.

---

#### 12. Contrato de revisión

Cada modificación material del escenario se representa mediante:

```text
simulation_revision_id
simulation_id
revision_number
scenario_fingerprint
```

La revisión es append-only.

Cambiar sujeto, rol, sede, área, turno, check-in, permiso, aplicación, recurso, instante hipotético o una condición que altere la evaluación exige una revisión nueva o una simulación nueva según el contrato de `SimulationContext`.

Nunca se actualiza silenciosamente una revisión ya evaluada.

---

#### 13. Contrato de evaluación hipotética

Cada evaluación produce una identidad `simulated_decision_id` y conserva como mínimo:

```text
simulation_id
simulation_revision_id
evaluated_at
app_code
permission_key
resource_scenario_id
hypothetical_context_id
outcome
reason_codes
executable
evaluation_fingerprint
```

`executable` es siempre `false`.

---

#### 14. Resultados permitidos

Los únicos resultados hipotéticos permitidos son:

```text
WOULD_ALLOW
WOULD_DENY
INDETERMINATE
```

Queda prohibido persistir para una evaluación simulada:

```text
ALLOW
DENY como AuthorizationDecision real
can_operate = true
authorized = true
token ejecutable
grant derivado
sesión operativa
```

---

#### 15. Estados canónicos de SimulationContext

Se preservan exactamente los estados:

```text
DRAFT
ACTIVE
COMPLETED
EXPIRED
REVOKED
INVALID
```

La auditoría no inventa estados equivalentes ni aliases.

`ACTIVE` es el único estado que puede producir nuevas evaluaciones hipotéticas.

---

#### 16. Estado derivado y evidencia

El estado actual de una simulación se deriva de:

1. el registro raíz inmutable;
2. la revisión vigente;
3. los eventos append-only;
4. `expires_at`;
5. la presencia de un evento terminal.

No se requiere reescribir una fila histórica para expresar cambios de lifecycle.

Una proyección privada podrá calcular `effective_status`, pero la evidencia original permanece inmutable.

---

#### 17. Clases de registro de SUPA-ARC-007

La materialización usa clases semánticas del esquema transversal:

| Objeto 013                             | Clase de auditoría |
| -------------------------------------- | ------------------ |
| `authorization_simulations`            | `AUDIT_ENTRY`      |
| `authorization_simulation_revisions`   | `AUDIT_ENTRY`      |
| `authorization_simulation_evaluations` | `AUDIT_ENTRY`      |
| `authorization_simulation_events`      | `AUDIT_ENTRY`      |
| `authorization_simulation_attempts`    | `AUDIT_ENTRY`      |
| `authorization_simulation_links`       | `AUDIT_LINK`       |
| `authorization_simulation_corrections` | `AUDIT_CORRECTION` |

No se introduce una clase genérica `log`.

---

#### 18. Registro raíz de simulación

`audit.authorization_simulations` conserva una fila inmutable por `simulation_id`.

Campos lógicos mínimos:

```text
simulation_id
contract_name
contract_version
schema_version
created_at
expires_at
purpose_code
real_principal_id
real_actor_id
real_employee_id
real_session_reference
real_access_context_id
real_access_context_fingerprint
requester_authorization_decision_id
initial_revision_id
correlation_id
causation_id
recorded_at
source_versions
source_fingerprints
root_fingerprint
```

Los identificadores empresariales se minimizan a los estrictamente necesarios.

---

#### 19. Revisiones de escenario

`audit.authorization_simulation_revisions` conserva una fila por versión material del escenario.

Campos lógicos mínimos:

```text
simulation_revision_id
simulation_id
revision_number
created_at
created_by_real_actor_id
scenario_kind
simulated_subject
simulated_role
simulated_site
simulated_area
simulated_shift
simulated_checkin
simulated_resource
simulated_resolved_at
policy_snapshot
source_versions
source_fingerprints
scenario_fingerprint
```

Los nodos complejos pueden representarse como `jsonb` tipado únicamente cuando el contrato, validadores y canonicalización impidan payload libre ambiguo.

---

#### 20. Evaluaciones

`audit.authorization_simulation_evaluations` conserva una fila por evaluación hipotética.

Campos mínimos:

```text
simulated_decision_id
simulation_id
simulation_revision_id
evaluation_request_id
evaluated_at
app_code
permission_key
resource_scenario_id
hypothetical_context_id
outcome
reason_codes
executable
scenario_fingerprint
authorization_contract_version
catalog_version
source_versions
source_fingerprints
evaluation_fingerprint
recorded_at
```

`executable` debe estar restringido físicamente a `false`.

---

#### 21. Eventos de lifecycle

`audit.authorization_simulation_events` conserva transiciones y hechos de lifecycle.

Vocabulario inicial cerrado:

```text
SIMULATION_CREATED
SIMULATION_ACTIVATED
SIMULATION_REVISED
SIMULATION_EVALUATED
SIMULATION_COMPLETED
SIMULATION_EXPIRED
SIMULATION_REVOKED
SIMULATION_INVALIDATED
SIMULATION_CORRECTION_LINKED
```

Nuevos códigos requieren evolución contractual; no se aceptan strings libres como semántica principal.

---

#### 22. Intentos no materializados

`audit.authorization_simulation_attempts` registra operaciones que no producen un cambio válido en el lifecycle o no alcanzan a crear una simulación.

Outcomes iniciales:

```text
DENIED
INVALID
CONFLICT
TECHNICAL_FAILURE
NO_CHANGE
ROLLED_BACK
```

Un intento denegado no crea una simulación ficticia para poder auditarla.

---

#### 23. Vínculos

`audit.authorization_simulation_links` relaciona evidencia sin duplicar payloads.

Tipos iniciales:

```text
REQUESTER_AUTHORIZATION_DECISION
REAL_ACCESS_CONTEXT
REAL_AUTH_SESSION
DEVICE_CONTEXT
SIMULATED_EVALUATION
RESOURCE_REFERENCE
EVIDENCE_REFERENCE
CORRECTION
```

El vínculo no transfiere autoridad desde el objeto relacionado.

---

#### 24. Correcciones

Una corrección de auditoría no modifica la entrada original.

`audit.authorization_simulation_corrections` conserva razón, objetivo, actor real, decisión autorizadora, tiempos y fingerprint de corrección.

Una corrección no puede cambiar retroactivamente `WOULD_DENY` a `WOULD_ALLOW`; solo registra una aclaración o rectificación auditada.

---

#### 25. Inmutabilidad física

Las tablas de evidencia son append-only.

Para los roles de ejecución ordinaria:

```text
UPDATE = REVOKED
DELETE = REVOKED
TRUNCATE = REVOKED
```

Cuando una operación requiera modificar el escenario, se agrega una revisión.
Cuando requiera cerrar lifecycle, se agrega un evento.
Cuando requiera corregir evidencia, se agrega una corrección.

---

#### 26. No soft delete de evidencia

No se usa `deleted_at` para ocultar una simulación, evaluación, evento o intento.

Retención, privacidad y disposición final se gobiernan por la política transversal aplicable y no se convierten en soft delete operativo.

El rollback de código no borra hechos ya registrados.

---

#### 27. Atomicidad requerida

Las operaciones decisorias de simulación usan `AUDIT_ATOMIC_REQUIRED`.

Un inicio aceptado no puede confirmarse si la evidencia raíz y su evento inicial no quedaron durables.

Una evaluación aceptada no puede devolverse como resultado válido si su entrada auditable obligatoria falló.

Un cierre o revocación no se confirma si el evento terminal no quedó durable.

---

#### 28. Transacción de creación

Flujo físico objetivo:

```text
BEGIN
  resolver actor y sesión reales
  evaluar autorización real para iniciar simulación
  persistir AuthorizationDecision real cuando aplique
  validar escenario inicial
  insertar authorization_simulations
  insertar revision 1
  insertar SIMULATION_CREATED
  insertar vínculos mínimos
COMMIT
```

Si falla cualquier paso obligatorio, la simulación no se presenta como creada.

---

#### 29. Transacción de activación

Activar una simulación exige:

```text
BEGIN
  bloquear identidad de simulation_id
  comprobar estado derivado
  comprobar expiración
  revalidar autoridad real exigida por el contrato
  insertar SIMULATION_ACTIVATED
COMMIT
```

No se actualiza `is_active` en una fila mutable como fuente autoritativa.

---

#### 30. Transacción de evaluación

Toda evaluación hipotética válida sigue:

```text
BEGIN
  validar simulation_id
  validar ACTIVE
  validar revisión exacta
  resolver escenario completo
  evaluar hipotéticamente
  insertar authorization_simulation_evaluations
  insertar SIMULATION_EVALUATED
  enlazar evidencia necesaria
COMMIT
```

Un resultado calculado pero no persistido no puede presentarse como evaluación auditada.

---

#### 31. Transacción de revisión

Una revisión aceptada sigue:

```text
BEGIN
  validar simulación no terminal
  obtener revision_number vigente
  aplicar optimistic concurrency
  canonicalizar escenario nuevo
  insertar nueva revisión
  insertar SIMULATION_REVISED
COMMIT
```

Una revisión concurrente con base obsoleta produce `CONFLICT`.

---

#### 32. Transacción de cierre

Completar o revocar sigue:

```text
BEGIN
  bloquear simulation_id
  comprobar que no exista evento terminal incompatible
  insertar evento terminal
  insertar vínculos de decisión real cuando corresponda
COMMIT
```

El cierre es idempotente únicamente para el mismo outcome terminal y la misma operación causal.

---

#### 33. Expiración

`expires_at` es obligatorio.

Al superar el límite:

- no se aceptan nuevas evaluaciones;
- el estado efectivo es `EXPIRED`;
- una materialización explícita del evento `SIMULATION_EXPIRED` puede realizarse de forma determinista;
- la ausencia de un job no convierte una simulación vencida en activa;
- la expiración no modifica sesión, rol, turno, check-in o permisos reales.

---

#### 34. No reactivación

Una simulación `COMPLETED`, `EXPIRED`, `REVOKED` o `INVALID` no vuelve a `ACTIVE`.

Para continuar trabajo hipotético se crea una nueva simulación o una nueva instancia permitida por el contrato, con nueva identidad y nueva evidencia.

---

#### 35. Actor real

Toda simulación interactiva conserva el actor humano real que la solicita.

La auditoría separa:

```text
real_principal_id
real_actor_id
real_employee_id
real_session_reference
```

de:

```text
simulated_subject
simulated_role
simulated_site
simulated_area
```

El sujeto simulado nunca se utiliza como `created_by`.

---

#### 36. Principal técnico

Un principal técnico, `service_role`, dispositivo compartido, integración o cuenta compartida no se presenta como simulador humano.

Si participa técnicamente en transporte o ejecución, su identificador se registra por separado como principal técnico y nunca sustituye al actor humano requerido por el contrato.

---

#### 37. Decisión real del solicitante

La autoridad para iniciar o administrar una simulación se evalúa desde el contexto real.

El vínculo con `AuthorizationDecision` debe demostrar, cuando aplique:

```text
viso.access
+
viso.authorization.context_simulations.view
+
carril real válido
+
alcance real suficiente
+
sin deny aplicable
```

La simulación solicitada no puede satisfacer ninguno de esos requisitos.

---

#### 38. Justificación

La justificación de una simulación se conserva de forma minimizada.

Debe existir un `reason_code` normalizado y, cuando el contrato lo exija, una explicación humana.

No se admiten en la justificación contraseñas, PIN, tokens, JWT, secretos de integración, datos médicos innecesarios ni documentos personales completos.

---

#### 39. Reautenticación fuerte

Cuando el escenario requiera reautenticación fuerte, la evidencia se referencia mediante identidad no reutilizable y vinculada al actor, sesión, solicitud y objetivo.

No se almacena el secreto de autenticación.

La presencia de STRONG no amplía el alcance real del simulador.

---

#### 40. Identidad tipada de rol

Toda referencia de rol simulado conserva:

```text
role_kind
role_code
role_catalog_version
matrix_version
```

`BASE/bodeguero` y `OPERATIONAL/bodeguero` son identidades distintas.

Un código bare o ambiguo produce `INVALID` o `INDETERMINATE` conforme al punto del flujo.

---

#### 41. Cobertura de roles

El contrato físico deberá poder reconciliar el universo aprobado:

```text
8 roles base canónicos
12 roles operativos canónicos
20 objetivos canónicos simulables
10 exclusiones físicas no canónicas
30 identidades tipadas en el registro consolidado
```

Los nueve roles base legacy y `OPERATIONAL/propietario_admin` no se convierten por inferencia en objetivos válidos.

---

#### 42. Identidad de sede simulada

Una sede simulada exacta conserva:

```text
simulated_site_id
simulated_site_code
simulated_site_type
simulated_site_kind
site_catalog_version
```

No se resuelve desde una etiqueta, sede primaria, sede seleccionada o `null`.

---

#### 43. Cobertura territorial de sedes

La implementación deberá poder reconciliar la clasificación documental de siete identidades físicas:

```text
5 sedes ordinarias SIMULABLE_CONDITIONAL
1 APP-REVIEW ISOLATED_EXPLICIT_ONLY
1 pickup_camioneta_principal NOT_SIMULABLE_AS_SITE
```

La auditoría no convierte el punto físico de pickup en sede.

---

#### 44. Identidad de área simulada

Una referencia exacta conserva:

```text
simulated_site_id
simulated_area_id
area_code
area_class
area_kind
area_catalog_version
```

El área debe pertenecer a la sede aceptada y ser exacta.

Un agregado como `todos` o `GENERAL` no se almacena como área exacta.

---

#### 45. Cobertura de áreas

La reconciliación contractual debe distinguir:

```text
22 áreas activas observadas en el snapshot de diseño
18 organizacionales ordinarias
1 aislada
3 agregadas no exactas
```

Las cifras se usan como baseline contractual histórico; la implementación física deberá comparar el inventario vigente y registrar drift antes de aplicar cambios.

---

#### 46. Vínculos rol-sede-área

Los vínculos operativos deben conservarse como identidades exactas.

Un vínculo sin `area_id` no se completa mediante inferencia.

`AREA_BINDING_UNRESOLVED` es una condición explícita y no un wildcard.

---

#### 47. Turno simulado

El escenario de turno conserva uno de los modos aprobados:

- turno exacto versionado;
- turno hipotético sintético;
- ausencia positiva `NO_SHIFT`.

Un turno exacto requiere identidad, revisión o snapshot, fingerprint, instante hipotético y zona horaria.

---

#### 48. Estados temporales del turno

Una simulación no presta el turno real.

Para prerrequisitos:

- `N` no depende de turno;
- `T` exige turno simulado válido;
- `T+C` exige además check-in hipotético compatible.

Un turno futuro, terminado, cancelado, descanso o no publicado no se vuelve válido por existir en la base.

---

#### 49. Check-in simulado

El check-in hipotético pertenece exclusivamente al escenario.

No se crea una fila real de asistencia.
No se usa un check-in real para completar el escenario.
No se usa un check-in hipotético para autorizar una operación real.

---

#### 50. Recurso simulado

Los modos de recurso conservan la semántica aprobada:

```text
SYNTHETIC_RESOURCE
MASKED_REAL_RESOURCE
AUTHORIZED_REAL_REFERENCE
RESOURCE_DRAFT
UNRESOLVED
```

Una referencia real solo puede registrarse cuando el actor real tenía autoridad independiente para conocerla.

---

#### 51. Lectura real y RLS

Toda lectura de datos reales requerida para construir una vista previa se ejecuta bajo la autoridad real del actor.

El contexto simulado nunca amplía filas visibles por RLS.

Una simulación no puede utilizar un recurso real para el que el simulador carece de acceso real.

---

#### 52. Aplicación y permiso

Cada evaluación conserva:

```text
app_code
permission_key
simulation_requirement
```

La aplicación no se infiere desde una ruta visual ni desde un prefijo desconocido.

El permiso debe existir en el catálogo canónico aplicable a la versión evaluada.

---

#### 53. Clasificación simulation_requirement

La política canónica de simulación usa un vocabulario cerrado:

```text
FULL_PREVIEW
DECISION_ONLY
NOT_ALLOWED
```

Semántica:

- `FULL_PREVIEW`: puede producir representación hipotética minimizada y controles inertes;
- `DECISION_ONLY`: produce únicamente la decisión y explicación autorizada;
- `NOT_ALLOWED`: no se simula.

Un valor ausente o desconocido falla cerrado.

---

#### 54. Distribución contractual de permisos

La implementación debe poder reconciliar el snapshot documental:

```text
140 permisos evaluados
85 FULL_PREVIEW
52 DECISION_ONLY
3 NOT_ALLOWED
```

Las tres claves `NOT_ALLOWED` documentadas son:

```text
aura.access
pass.access
viso.authorization.context_simulations.view
```

No se permite que VISO auto-simule el propio permiso que habilita el simulador.

---

#### 55. Drift físico del catálogo

La línea base remota observada contiene 179 filas activas en `public.app_permissions` y no contiene una columna cuyo nombre represente `simulation_requirement`.

Por tanto:

```text
179 FÍSICOS
≠
140 SNAPSHOT DOCUMENTAL
```

La futura implementación deberá reconciliar identidad por identidad. Las filas adicionales no reciben `FULL_PREVIEW` por defecto.

---

#### 56. Política para permisos sin clasificación

Una clave física sin clasificación canónica de simulación no es simulable.

El resultado seguro es:

```text
NOT_ALLOWED_BY_DEFAULT
```

hasta que el contrato propietario del catálogo publique una decisión.

No se deduce clasificación desde `is_read_only`, nombre, aplicación, sensibilidad o permiso vecino.

---

#### 57. No autoridad desde FULL_PREVIEW

`FULL_PREVIEW` controla únicamente la riqueza de la vista hipotética.

Nunca significa:

```text
puede ejecutar
puede leer más datos
puede ignorar RLS
puede crear token
puede invocar mutación
puede reutilizar idempotency key
```

---

#### 58. No autoridad desde DECISION_ONLY

`DECISION_ONLY` no permite recuperar el contenido protegido del recurso para simular una pantalla completa.

La evidencia puede conservar identidad mínima del recurso y resultado tipado sin copiar su payload.

---

#### 59. Prohibición de anidamiento

Una simulación activa no puede iniciar, modificar, administrar privilegiadamente ni cerrar otra simulación utilizando autoridad simulada.

El actor debe volver al contexto real y reautorizar la nueva operación.

---

#### 60. No mezcla de contextos

Queda prohibido un resolver que construya:

```text
effective_context = real_context reemplazado por simulated_context
```

El contexto real y el contexto simulado usan contratos, namespaces, tipos, cache keys y consumidores separados.

---

#### 61. No mezcla de permisos

Un helper real de permisos no puede retornar un resultado positivo porque el rol simulado lo tendría.

Los evaluadores hipotéticos deben usar una API distinta que produzca `WOULD_*` y `executable=false`.

---

#### 62. No can_operate simulado

`can_operate=true` es incompatible con el contrato simulado.

Toda compatibilidad legacy que exponga `can_operate` durante una simulación debe ser retirada, encapsulada o neutralizada antes de declarar la instancia conforme.

---

#### 63. No booleano ambiguo

Una función de simulación no retorna `boolean` como contrato de autorización.

La forma mínima conserva:

```text
outcome
executable
reason_codes
simulation_id
simulation_revision_id
evaluated_at
```

Esto evita que `true` se interprete como autoridad ejecutable.

---

#### 64. Provenance obligatoria

Toda salida hipotética conserva procedencia:

```text
authority_plane = SIMULATION_SCENARIO
executable = false
```

Los canales reales deben rechazar cualquier request que intente reutilizar esta procedencia como autoridad.

---

#### 65. Bloqueo de efectos reales

La persistencia de 013 debe soportar la evidencia de bloqueo para:

- Server Actions;
- Route Handlers;
- RPC/PostgREST;
- RLS/Data API;
- Edge Functions;
- Realtime;
- cliente offline;
- exportación;
- impresión;
- notificación;
- jobs;
- colas;
- webhooks;
- integraciones.

La implementación de cada guard pertenece a sus tareas consumidoras, pero 013 conserva la identidad de simulación y evidencia necesaria para probar el bloqueo.

---

#### 66. Ejecución posterior a la vista previa

Ejecutar una operación real después de una simulación exige:

1. salir o cerrar el modo simulado;
2. descartar escenario y resultados simulados de la solicitud ejecutable;
3. emitir una solicitud nueva sin `simulation_id`;
4. resolver actor, contexto, permiso, alcance y recurso reales;
5. producir una nueva `AuthorizationDecision`;
6. usar una idempotency key real distinta cuando corresponda.

No existe `promote simulation to execution`.

---

#### 67. Idempotencia de creación

Una solicitud de creación puede usar una clave idempotente técnica, pero su scope debe incluir al menos:

```text
real_actor_id
real_session_reference
operation_kind
request_fingerprint
```

La repetición exacta retorna la misma identidad únicamente cuando el contrato demuestra que representa la misma operación y no un escenario nuevo.

---

#### 68. Idempotencia de evaluación

Una evaluación repetida con:

```text
misma simulation_revision_id
misma request canonicalizada
mismas versiones
mismos fingerprints de fuentes
```

puede deduplicarse de forma controlada.

Si cambia una fuente autoritativa material, debe existir una nueva evaluación o una revisión nueva según el contrato.

---

#### 69. Concurrencia

Las transiciones de lifecycle usan locking transaccional por `simulation_id` o mecanismo equivalente.

Condiciones obligatorias:

- dos activaciones concurrentes no crean dos estados efectivos;
- dos cierres incompatibles no pueden confirmarse;
- una evaluación no se confirma después de un cierre concurrente;
- una revisión no se confirma sobre una revisión base obsoleta;
- la expiración no se ignora por una carrera.

---

#### 70. Orden causal

La auditoría conserva causalidad mediante:

```text
correlation_id
causation_id
simulation_id
simulation_revision_id
```

El timestamp no se usa como orden global suficiente.

El orden relevante es por agregado de simulación y por relación causal.

---

#### 71. Snapshot transaccional

Una evaluación debe resolver su escenario, políticas, versiones y fuentes dentro de un snapshot consistente.

No se combina una revisión antigua con un catálogo nuevo sin declarar la diferencia.

Si una fuente cambia durante la evaluación y el contrato no puede demostrar consistencia, el resultado es `INDETERMINATE` o fallo controlado.

---

#### 72. Versiones de fuente

La evidencia conserva versiones explícitas para las fuentes utilizadas, por ejemplo:

```text
authorization_contract
permission_catalog
base_role_matrix
operational_role_matrix
individual_overrides
site_catalog
area_catalog
shift_policy
simulation_policy
resource_contract
```

No se utilizan valores ambiguos como `latest`, `current` o `unknown` cuando la reproducibilidad exige una versión concreta.

---

#### 73. Fingerprints de fuente

Cada fuente material utilizada puede registrar un fingerprint `sha256:` seguido por 64 caracteres hexadecimales minúsculos.

El fingerprint identifica el snapshot consumido, no la hora de consulta.

---

#### 74. Canonicalización

La preimagen para fingerprints utiliza:

```text
vento.canonical-json@1.0.0
```

`jsonb::text` no se considera por sí solo una especificación suficiente de canonicalización contractual.

La misma semántica debe producir el mismo fingerprint independientemente del orden de claves de entrada.

---

#### 75. Fingerprint del escenario

`scenario_fingerprint` cubre únicamente identidad semántica hipotética.

Incluye, cuando aplique:

- contract/version;
- simulated subject;
- typed role;
- site;
- area;
- shift;
- check-in;
- hypothetical time;
- application/permission context;
- resource scenario;
- relevant policy versions.

Excluye IDs de entrega, timestamps de persistencia y metadata operativa que no cambie la semántica.

---

#### 76. Fingerprint de evaluación

`evaluation_fingerprint` cubre:

```text
scenario_fingerprint
+
request canonicalizada
+
permission_key
+
resource scenario
+
outcome
+
reason_codes
+
contract versions
+
source fingerprints
```

No convierte el resultado en una autorización real.

---

#### 77. Fingerprint de registro raíz

`root_fingerprint` permite verificar la identidad del registro inicial de la simulación sin depender del orden físico de columnas.

Debe excluir campos cuya única función sea transporte o almacenamiento.

---

#### 78. Timestamps

Los registros append-only usan:

```text
occurred_at
recorded_at
```

cuando ambos conceptos existan.

Además, `SimulationContext` conserva `created_at`, `activated_at`, `expires_at`, `completed_at` y `revoked_at`.

No se reemplazan por un único `updated_at`.

---

#### 79. Zona horaria

Los timestamps se almacenan como `timestamptz` y se comparan como instantes.

Cuando el contrato laboral exija interpretar un turno en `America/Bogota`, esa política se aplica al escenario correspondiente; no se cambia la representación durable del instante.

---

#### 80. Minimización de datos

La auditoría conserva evidencia suficiente para reproducibilidad sin duplicar innecesariamente el contenido del recurso.

Preferencias:

1. IDs estables;
2. versiones;
3. fingerprints;
4. clasificaciones;
5. snapshots mínimos;
6. referencias autorizadas.

No se replica una fila empresarial completa solo por conveniencia de auditoría.

---

#### 81. Secretos prohibidos

No se persisten en payloads de simulación o auditoría:

```text
password
PIN
access token
refresh token
JWT raw
service_role key
secret key
cookie raw
authorization header
secretos de integración
```

Si una prueba de autenticación debe enlazarse, se usa una referencia segura.

---

#### 82. Datos sensibles

Datos laborales, financieros, médicos, disciplinarios o personales se minimizan.

Una simulación `DECISION_ONLY` no justifica almacenar contenido protegido.

La auditoría conserva identidad, clasificación y fingerprint cuando sean suficientes.

---

#### 83. Metadata

`metadata` no es una vía de extensión sin gobierno.

Cualquier objeto JSON:

- tiene schema_version;
- valida claves permitidas;
- tiene tamaño máximo;
- rechaza secretos;
- no puede alterar outcome, autoridad o lifecycle;
- no reemplaza columnas contractuales.

Una clave desconocida que pretenda afectar semántica es inválida.

---

#### 84. Errores de argumento

Una firma privada que reciba argumentos contractualmente inválidos debe fallar de forma tipada.

Errores normales de negocio no se convierten en excepciones SQL libres cuando existe un outcome contractual.

La forma final de códigos se coordina con el catálogo de errores vigente.

---

#### 85. Denegación al iniciar

Cuando el actor real carece de autoridad para iniciar una simulación:

- no se crea `authorization_simulations`;
- se conserva un intento cuando la política de auditoría lo exige;
- se enlaza la decisión real de denegación;
- no se revela qué rol o recurso habría sido simulable;
- no se crea un escenario parcial.

---

#### 86. Escenario inválido

Cuando rol, sede, área, turno, recurso o versión son inválidos:

- no se completa silenciosamente con datos reales;
- no se usa fallback;
- el intento o revisión se registra como `INVALID` cuando corresponda;
- una simulación ya activa puede recibir un evento `SIMULATION_INVALIDATED` si la inconsistencia afecta su continuidad.

---

#### 87. Conflicto de concurrencia

Un conflicto de revisión o transición produce outcome `CONFLICT`.

No se resuelve mediante last-write-wins.

La respuesta debe permitir al consumidor recargar el estado real y emitir una nueva operación.

---

#### 88. Fallo técnico

Timeout, indisponibilidad de fuente, error de almacenamiento o fallo de red no se clasifica como policy deny.

La evidencia usa `TECHNICAL_FAILURE` y conserva correlación suficiente para diagnóstico sin exponer internals al usuario final.

---

#### 89. Rollback transaccional

Si la transacción que crea o evalúa una simulación hace rollback:

- no queda una entrada de éxito parcial;
- si existe un canal durable de intento técnicamente independiente aprobado, registra `ROLLED_BACK`;
- no se inventa una simulación activa;
- no se modifica la sesión real.

---

#### 90. Acceso directo a audit

El schema `audit` permanece fuera de Data API.

Roles cliente `anon` y `authenticated` no reciben acceso directo a las tablas de 013.

Toda consulta futura usa contratos autorizados, proyecciones o servicios con minimización explícita.

---

#### 91. RLS como defensa adicional

Aunque `audit` no se exponga, la implementación puede usar RLS como defensa en profundidad cuando sea compatible con el owner técnico y el patrón de escritura.

RLS no sustituye revocación de grants, schema no expuesto, funciones privadas ni autorización de negocio.

---

#### 92. Grants

La política objetivo es mínimo privilegio.

Se revoca `PUBLIC` y no se concede a `anon` o `authenticated`:

```text
SELECT
INSERT
UPDATE
DELETE
TRUNCATE
REFERENCES
TRIGGER
```

sobre las tablas de auditoría.

Las funciones privadas reciben `EXECUTE` únicamente para roles técnicos exactos que las necesiten.

---

#### 93. SECURITY DEFINER

`SECURITY DEFINER` solo se admite para una frontera que necesite privilegios elevados y tenga justificación.

Toda función de este tipo debe:

- vivir en schema privado o no expuesto;
- revocar `PUBLIC EXECUTE`;
- usar `search_path` endurecido;
- calificar objetos;
- derivar identidad real desde la sesión/contrato aprobado;
- no aceptar actor empresarial autoritativo desde el cliente;
- tener grants exactos.

---

#### 94. search_path

Las nuevas funciones privilegiadas no usarán:

```text
search_path = public, auth
```

como frontera abierta.

El patrón objetivo se restringe a namespaces aprobados y objetos calificados, por ejemplo `pg_catalog` más schemas privados exactos requeridos.

---

#### 95. Owner técnico

El owner PostgreSQL es una identidad técnica.

No equivale a actor real, aprobador, propietario empresarial, gerente o `service_role`.

La migración seleccionará un owner técnico compatible con la plataforma y el gobierno de `vento-shell`.

---

#### 96. service_role

`service_role` no es autoridad empresarial.

Si una integración server-side usa capacidades técnicas de `service_role`, todavía debe presentar o resolver la identidad empresarial y la decisión real requerida por el contrato.

No se acepta `service_role → simulation admin`.

---

#### 97. Funciones privadas objetivo

La futura instancia puede materializar helpers como:

```text
app_private.canonicalize_authorization_simulation(jsonb)
app_private.fingerprint_authorization_simulation(jsonb)
app_private.derive_authorization_simulation_status(uuid)
app_private.append_authorization_simulation(jsonb)
app_private.append_authorization_simulation_revision(jsonb)
app_private.append_authorization_simulation_evaluation(jsonb)
app_private.append_authorization_simulation_event(jsonb)
app_private.append_authorization_simulation_attempt(jsonb)
app_private.link_authorization_simulation_evidence(jsonb)
app_private.correct_authorization_simulation_audit(jsonb)
```

Los nombres son parte del contrato de esta tarea y deben materializarse de forma consistente o cambiarse mediante decisión documental explícita antes de implementación.

---

#### 98. Superficie pública

013 no crea una API pública de simulación.

`AUTH-SRV-015` continúa siendo propietaria del servicio autoritativo y de las superficies de aplicación.

Si en el futuro se requiere una proyección segura para cumplimiento o soporte, deberá definirse con campos mínimos y autorización propia.

---

#### 99. Índices mínimos

Los índices se diseñarán desde patrones reales de consulta.

Mínimos candidatos:

- `simulation_id`;
- `(real_actor_id, created_at desc)`;
- `(simulation_id, revision_number)`;
- `(simulation_id, evaluated_at desc)`;
- `(simulation_id, occurred_at)`;
- `requester_authorization_decision_id`;
- correlation/causation IDs usados operativamente.

No se indexa cada clave JSON por defecto.

---

#### 100. Unicidad

Restricciones mínimas:

```text
simulation_id UNIQUE
(simulation_id, revision_number) UNIQUE
simulated_decision_id UNIQUE
event_id UNIQUE
attempt_id UNIQUE
correction_id UNIQUE
```

La identidad idempotente adicional se define con una constraint separada cuando el patrón de reintento esté aprobado.

---

#### 101. Foreign keys y referencias

Las FK solo se crean cuando el ciclo de vida y owner del objeto referenciado son compatibles.

Una referencia a evidencia que deba sobrevivir a la eliminación o transición de la fuente puede requerir identidad lógica y fingerprint en lugar de `ON DELETE CASCADE`.

Está prohibido borrar auditoría porque se elimine un usuario técnico.

---

#### 102. Prohibición de ON DELETE CASCADE sobre evidencia

La auditoría no puede desaparecer por cascada desde:

- `auth.users`;
- empleado;
- sesión;
- dispositivo;
- turno;
- recurso;
- permiso.

Las relaciones físicas deben preservar evidencia incluso cuando la fuente deje de estar activa.

---

#### 103. Particionamiento

El particionamiento no se aplica por anticipación sin evidencia.

`AUTH-DB-025` y las políticas transversales de crecimiento definirán cuándo el volumen justifica particionar.

013 debe dejar claves temporales y de identidad compatibles con esa evolución.

---

#### 104. Retención

013 no fija un periodo arbitrario de retención.

La retención, legal hold, purga y disposición final pertenecen a `SUPA-ARC-022` y tareas posteriores aplicables.

Una implementación no puede sustituir esa política por un DELETE temporal local.

---

#### 105. Restore

El restore debe preservar IDs, revision_number, fingerprints, causalidad, eventos, evaluaciones, intentos, correcciones y vínculos.

Restaurar solo la simulación raíz sin su evidencia asociada es un restore incompleto.

---

#### 106. Integridad

La futura implementación deberá poder detectar:

- UPDATE no autorizado;
- DELETE no autorizado;
- gaps de revision_number;
- evento que referencia simulación inexistente;
- evaluación que usa revisión inexistente;
- fingerprint inválido;
- evento terminal contradictorio;
- outcome simulado ejecutable;
- vínculo a decisión real inexistente cuando sea obligatorio.

---

#### 107. Línea base física observada

La auditoría read-only del proyecto de referencia confirma:

```text
schema audit = AUSENTE
schema app_private = PRESENTE
schema api = AUSENTE
public.context_simulation_sessions = PRESENTE
filas context_simulation_sessions = 0
RLS = ENABLED
FORCE RLS = false
```

Este estado es evidencia de línea base, no autorización para modificarlo.

---

#### 108. Forma legacy de context_simulation_sessions

La tabla legacy observada contiene:

```text
id
user_id
site_id
area_id
operational_role
administrative_role
is_active
expires_at
ended_at
created_by
metadata
created_at
updated_at
```

No representa `SimulationContext@1.0.0` completo y no conserva revisiones, evaluaciones hipotéticas, fingerprints, source versions ni causalidad.

---

#### 109. Restricciones legacy observadas

La tabla legacy tiene PK por `id`, FK a `auth.users` con `ON DELETE CASCADE`, FK a `sites`, FK a `areas`, FK de `created_by` a `employees`, checks temporales y de rol, e índice único de una sesión activa por `user_id`.

Estas reglas no se adoptan automáticamente como diseño objetivo.

---

#### 110. RLS legacy observado

La policy observada permite SELECT propio a `authenticated` cuando:

```text
user_id = auth.uid()
and can_manage_context_simulation_v1(auth.uid())
```

La tabla mantiene grants SQL amplios a `authenticated`, incluidos DML, aunque RLS reduzca filas.

El objetivo no conserva acceso directo de cliente a la nueva auditoría.

---

#### 111. Trigger legacy observado

`trg_validate_context_simulation_session_v1` se ejecuta en INSERT y UPDATE y llama `validate_context_simulation_session_v1()`.

La función valida área y rol operativo, y además muta `updated_at`.

Ese patrón mutable no es la persistencia append-only objetivo.

---

#### 112. Funciones legacy observadas

Se observaron seis funciones `SECURITY DEFINER` relacionadas directamente con simulación/contexto efectivo y concedidas a `authenticated`:

```text
can_manage_context_simulation_v1
get_active_context_simulation_v1
get_effective_context_v1
has_effective_permission_v1
start_context_simulation_v1
stop_context_simulation_v1
```

Todas usan `search_path` con `public, auth`.

---

#### 113. Brecha can_manage_context_simulation_v1

La función legacy autoriza por:

```text
employees.role in ('propietario', 'gerente_general')
```

Esto convierte nombre de rol en autoridad y no aplica el permiso exacto, alcance, deny, sesión real, reautenticación ni `AuthorizationDecision` canónicos.

La función no puede permanecer como fuente de autoridad objetivo.

---

#### 114. Brecha start_context_simulation_v1

La función legacy:

- acepta rol administrativo u operativo desde parámetros;
- acepta `metadata` libre;
- cierra por UPDATE la sesión previa;
- crea una fila mutable;
- usa duración por defecto de 240 minutos;
- permite rango hasta 720 minutos;
- valida permiso de simulación mediante nombre de rol;
- no persiste `SimulationContext@1.0.0`;
- no crea una evaluación no ejecutable separada.

013 debe retirar esa autoridad legacy del camino canónico.

---

#### 115. Brecha stop_context_simulation_v1

La función legacy cierra mediante UPDATE de `is_active`, `ended_at` y `updated_at`.

El objetivo usa evidencia append-only de lifecycle y no reescribe el hecho original como única evidencia del cierre.

---

#### 116. Brecha get_active_context_simulation_v1

La función legacy proyecta una sesión mutable desde `public` y depende de `can_manage_context_simulation_v1`.

No fija fingerprints, revisión, versiones ni estado contractual completo.

No puede considerarse una proyección canónica de `SimulationContext@1.0.0`.

---

#### 117. Brecha get_effective_context_v1

La función legacy mezcla contexto simulado con contexto real.

Cuando encuentra simulación:

```text
source = simulation
effective_administrative_role = simulated
effective_operational_role = simulated
is_simulation = true
can_operate = true
blocked_reasons = {}
```

Este comportamiento contradice la separación de planos y debe dejar de participar en autoridad real.

---

#### 118. Brecha has_effective_permission_v1

La función legacy consume `get_effective_context_v1`.

Si `source = simulation`, evalúa permisos del rol administrativo u operativo simulado y retorna un boolean.

Por tanto puede convertir un escenario hipotético en un resultado indistinguible de permiso efectivo.

La ruta canónica debe eliminar esta ambigüedad.

---

#### 119. Brecha de grants legacy

Las seis funciones observadas tienen `EXECUTE` para `authenticated` y `service_role`.

La transición debe revisar cada grant.

No se preserva un grant porque actualmente no existan filas de simulación.

---

#### 120. Cero sesiones no demuestra conformidad

La tabla legacy tiene cero filas en el corte observado.

Eso demuestra ausencia de uso material en ese instante, no seguridad.

Debe probarse el comportamiento positivo y negativo de las rutas antes de considerar cerrada la brecha.

---

#### 121. Migración desde la tabla legacy

Antes de retiro o compatibilidad se vuelve a contar `public.context_simulation_sessions`.

Si continúa en cero:

- no se inventa backfill;
- se conserva evidencia del conteo;
- se migra el contrato sin historial artificial.

Si existen filas:

- se clasifican;
- se valida reproducibilidad;
- se evita `ON DELETE CASCADE`;
- se conserva lineage;
- las filas no reproducibles se marcan como legacy no reproducible, no como contexto canónico válido.

---

#### 122. No dual-write indefinido

La transición puede requerir una ventana controlada de compatibilidad, pero no deja dos fuentes permanentes —legacy mutable y audit canónico— como autoridades iguales.

Debe existir un writer objetivo y una condición verificable de salida del legacy.

---

#### 123. Compatibilidad de lectura

Una proyección temporal puede leer evidencia canónica y adaptarla para un consumidor legacy únicamente si:

- no añade autoridad;
- no retorna `can_operate=true` por simulación;
- no presenta `WOULD_ALLOW` como booleano real;
- conserva `executable=false`;
- su retiro tiene tarea propietaria.

---

#### 124. Retiro legacy

El retiro definitivo de objetos legacy se coordina con `AUTH-DB-030` y los consumidores.

013 define qué debe quedar reemplazado, pero no elimina por inferencia una función o tabla todavía consumida.

El orden es inventariar consumidores, migrarlos, probar paridad segura, bloquear autoridad legacy y retirar cuando el gate lo permita.

---

#### 125. Relación con AUTH-DB-035

Frescura e invalidación de contexto real pertenecen a `AUTH-DB-035`.

013 conserva referencias a versiones y fingerprints para demostrar qué se simuló.

No crea un token ejecutable de frescura simulado aceptable por una acción real.

---

#### 126. Relación con AUTH-DB-034

`AUTH-DB-034` implementa el evaluador canónico real.

La evaluación simulada puede reutilizar su núcleo puro o reglas compartidas únicamente si existe una frontera explícita que suministra contexto hipotético tipado, fuerza outcome `WOULD_*`, fuerza `executable=false`, impide persistir una decisión real y no usa RLS como si el actor simulado fuera real.

---

#### 127. Relación con AUTH-SRV-015

`AUTH-SRV-015` será el servicio autoritativo de simulación.

013 le entrega persistencia durable, identidades, lifecycle, fingerprints, intentos, enlaces e invariantes de seguridad.

013 no diseña la UI ni sustituye el servicio.

---

#### 128. Relación con AUTH-SIM-007 a AUTH-SIM-011

Las tareas posteriores del Bloque Q conservan su ownership:

- `AUTH-SIM-007`: aviso persistente;
- `AUTH-SIM-008`: inicio funcional;
- `AUTH-SIM-009`: salida;
- `AUTH-SIM-010`: bloqueo de acciones críticas;
- `AUTH-SIM-011`: modo solo lectura.

013 aporta evidencia física común, pero no marca ninguna de estas tareas como implementada.

---

#### 129. Relación con AUTH-SIM-012 a AUTH-SIM-014

Las validaciones integrales posteriores conservan ownership de:

- navegación simulada;
- Server Actions simuladas;
- prueba de las diez aplicaciones.

013 prepara la evidencia común para correlacionar esos tests, pero no certifica aplicaciones ni consumidores.

---

#### 130. Cobertura por aplicación

La infraestructura es transversal a:

```text
SHELL
ANIMA
AURA
FOGO
NEXO
NUMERA
ORIGO
PASS
PULSO
VISO
```

Ninguna aplicación recibe una excepción local para aceptar autoridad simulada.

---

#### 131. AURA y PASS

Las exclusiones aprobadas de simulación permanecen.

La existencia de 013 no habilita AURA ni PASS para simulación.

`aura.access` y `pass.access` permanecen `NOT_ALLOWED` en el snapshot contractual de simulación.

---

#### 132. VISO

VISO presenta la superficie administrativa de simulación, pero `viso.authorization.context_simulations.view` no puede ser un permiso objetivo simulable que autojustifique acceso.

El permiso para administrar el simulador se resuelve siempre desde autoridad real.

---

#### 133. Manifest de migración futuro

La futura migración de `AUTH-DB-013::GLOBAL` deberá registrar al menos:

```text
task_id
instance_id
migration_file
contract_version
schema_version
source_commit
environment
preconditions
created_objects
altered_objects
grants_before
grants_after
legacy_objects
rollback_class
test_ids
evidence
```

No se crea una migración desde esta tarea documental.

---

#### 134. Orden de materialización futuro

Orden vinculante salvo evidencia que exija una variación documentada:

1. verificar R0 aplicable;
2. verificar `audit`;
3. capturar baseline;
4. crear tipos/checks necesarios;
5. crear tablas append-only;
6. crear constraints;
7. crear índices;
8. crear helpers privados;
9. cerrar grants;
10. materializar clasificación de simulación donde corresponda;
11. crear compatibilidad estrictamente necesaria;
12. ejecutar backfill/reconciliación si existen filas;
13. ejecutar tests adversariales;
14. comparar drift;
15. publicar evidencia.

---

#### 135. Dependencias físicas de AUTH-DB-013::GLOBAL

Antes de autorizar físicamente la instancia debe existir evidencia compatible de:

```text
R0 aplicable verificado
AUTH-DB-016::GLOBAL materializada cuando el schema audit todavía no exista
AUTH-DB-027 disponible
AUTH-DB-028 baseline vigente
AUTH-DB-029 estrategia de restore y rollback vigente
contratos AUTH-SIM-001..006 disponibles
contratos AUTH-CTX aplicables disponibles
autorización humana explícita de la instancia
```

La aprobación documental no satisface estas dependencias.

---

#### 136. Relación física con AUTH-DB-012::GLOBAL

013 y 012 comparten la capa `audit`, pero mantienen tablas y semántica separadas.

Si la materialización de 013 reutiliza helpers genéricos introducidos físicamente por 012, deberá comprobar su versión antes de ejecutar.

Si no los reutiliza, la ausencia de 012 física no autoriza crear un segundo framework incompatible.

---

#### 137. Sin creación de schema alternativa

Si `audit` está ausente durante la ejecución futura, la acción correcta es bloquear y resolver `AUTH-DB-016::GLOBAL`.

Está prohibido crear una tabla de auditoría equivalente en `public`, `app_private`, VISO o cualquier dominio para evadir la dependencia.

---

#### 138. Rollback de DDL

El rollback de una migración sin datos puede retirar objetos nuevos en orden inverso cuando sea seguro.

Una vez exista evidencia real:

- no se usa `DROP CASCADE`;
- no se borra historial;
- se desactiva el writer nuevo mediante migración forward si es necesario;
- se conserva compatibilidad de lectura;
- se documenta recuperación.

---

#### 139. Rollback funcional

Si el nuevo servicio de simulación debe suspenderse:

1. se bloquea creación de nuevas simulaciones;
2. se preserva lectura autorizada de evidencia;
3. se bloquea cualquier fallback que reactive autoridad legacy;
4. se conservan simulaciones históricas;
5. se reabre únicamente con una nueva versión aprobada.

---

#### 140. Backup y recuperación

Antes de materializar cambios que puedan afectar objetos legacy se verifica backup/restore conforme a R0.

La evidencia del backup no sustituye pruebas de rollback lógico ni validación de integridad de la auditoría.

---

#### 141. Pruebas de esquema

La suite física deberá comprobar existencia exacta de objetos, owner, tipos, nullability, PK, UNIQUE, CHECK, FK, índices, ausencia de duplicados, grants, RLS cuando aplique, search_path y execute privileges.

---

#### 142. Pruebas de inmutabilidad

Casos mínimos:

1. INSERT autorizado mediante helper;
2. UPDATE directo rechazado;
3. DELETE directo rechazado;
4. TRUNCATE rechazado;
5. corrección crea nueva entrada;
6. cierre crea evento;
7. revisión crea fila nueva;
8. evidencia histórica permanece idéntica.

---

#### 143. Pruebas de lifecycle

La suite cubre `DRAFT`, `ACTIVE`, `COMPLETED`, `EXPIRED`, `REVOKED` e `INVALID` y comprueba transiciones válidas e inválidas.

No debe existir transición terminal → ACTIVE.

---

#### 144. Pruebas de outcome simulado

Para cada camino se verifica:

```text
WOULD_ALLOW → executable=false
WOULD_DENY → executable=false
INDETERMINATE → executable=false
```

Se rechaza cualquier intento de persistir `ALLOW`, token o `can_operate=true`.

---

#### 145. Pruebas de separación real/simulado

Se deben intentar, entre otros:

- usar rol simulado en un guard real;
- usar sede simulada en RLS;
- usar área simulada en RPC real;
- usar turno simulado en operación real;
- usar check-in real para completar escenario;
- usar check-in simulado en operación real;
- usar simulation_id como token;
- usar WOULD_ALLOW como permiso.

Todos deben fallar cerrado.

---

#### 146. Pruebas de actor

Se prueban actor humano autorizado, actor sin permiso, gerente sin grant específico, principal técnico, service role, dispositivo compartido, sesión anónima, sesión expirada, actor inactivo y deny aplicable.

La auditoría debe atribuir correctamente el intento sin convertir un principal técnico en humano.

---

#### 147. Pruebas de roles

Se verifican ocho roles base, doce roles operativos, colisión de códigos, nueve roles base legacy, rol deprecado `OPERATIONAL/propietario_admin`, rol desconocido, rol futuro no aprobado y referencia bare.

El resultado nunca usa inferencia textual.

---

#### 148. Pruebas de sedes

Se prueban las cinco sedes ordinarias, `APP-REVIEW`, `pickup_camioneta_principal`, sede inexistente, sede inactiva, versión incompatible, `null` en acción territorial y sede fuera de alcance real.

---

#### 149. Pruebas de áreas

Se prueban área exacta válida, área de otra sede, área inactiva, agregado `todos`, agregado `GENERAL`, `APP-REVIEW/OPERACION`, vínculo sin `area_id`, área fuera de alcance real y `NO_AREA_NOT_REQUIRED`.

---

#### 150. Pruebas de turno

Se reproducen los quince escenarios aprobados de turno y se verifica revisión/snapshot, fingerprint, instante hipotético, zona horaria, publicación, vigencia, descanso, futuro, terminal, `NO_SHIFT` y legacy no reproducible.

---

#### 151. Pruebas de recurso

Se cubren los cinco modos de recurso y se verifica que una referencia real no autorizada no se revela, un draft no crea recurso real, un synthetic no obtiene ID real, un masked no filtra payload y unresolved no produce WOULD_ALLOW cuando el recurso es obligatorio.

---

#### 152. Pruebas de catálogo de simulación

La suite reconcilia:

```text
85 FULL_PREVIEW
52 DECISION_ONLY
3 NOT_ALLOWED
140 snapshot contractual
179 filas físicas observadas en baseline remoto
```

Toda diferencia produce reporte de drift y decisión explícita; no se autocorrige clasificando claves nuevas.

---

#### 153. Pruebas de seguridad SQL

Se verifica `PUBLIC EXECUTE` revocado, `anon` sin acceso, `authenticated` sin DML directo sobre audit, search_path poisoning, objetos homónimos, llamada directa a helpers privados, spoofing de actor, spoofing de simulation_id e intento de escribir `executable=true`.

---

#### 154. Pruebas de concurrencia

Casos mínimos: dos create con misma idempotency key, dos revisiones desde misma base, evaluación concurrente con revocación, evaluación con expiración, complete vs revoke, dos eventos terminales y retry después de commit desconocido.

El sistema debe producir un resultado determinista y auditable.

---

#### 155. Pruebas de rollback

Se ensaya rollback antes del root insert, después del root insert pero antes del evento inicial, durante evaluación, durante evento terminal, reintento seguro, restauración desde backup y conservación de evidencia previa.

---

#### 156. Pruebas de compatibilidad legacy

La suite debe detectar explícitamente el permiso por nombre de rol de `can_manage_context_simulation_v1`, la mezcla de `get_effective_context_v1`, `can_operate=true` en simulación, el booleano simulado de `has_effective_permission_v1`, start/stop mutables, grants legacy y acceso directo a la tabla legacy.

Ninguna brecha se marca cerrada solo porque row_count sea cero.

---

#### 157. Pruebas de diez aplicaciones

La certificación posterior debe demostrar para cada aplicación que no acepta `simulation_id` como autoridad, no acepta `WOULD_ALLOW`, no amplía RLS, no ejecuta mutación, no dispara efecto externo y preserva la autoridad real del actor.

013 prepara la evidencia común; `AUTH-SIM-014` y tareas consumidoras ejecutan la cobertura integral.

---

#### 158. Pruebas de restauración histórica

Una simulación histórica debe poder reconstruir actor real, decisión real del solicitante, revisión exacta, versiones, fingerprints, evaluación, outcome, reasons, lifecycle y causalidad.

Si una fuente legacy no permite reproducir el escenario, se declara no reproducible en vez de inventar datos.

---

#### 159. Oracle de cero efectos

Para cualquier evaluación simulada se debe poder afirmar:

```text
business_writes = 0
business_events = 0
outbox_business_items = 0
external_effects = 0
real_permission_changes = 0
real_shift_changes = 0
real_checkin_changes = 0
```

salvo la propia evidencia de auditoría y métricas técnicas permitidas.

---

#### 160. Observabilidad

Métricas técnicas pueden contar simulaciones creadas, evaluaciones, denegaciones, invalidaciones, expiraciones y fallos técnicos.

No se usan como fuente canónica del historial.

Los logs no sustituyen las tablas append-only.

---

#### 161. Alertas de seguridad

La implementación futura puede emitir alertas ante intento de ejecutar WOULD_ALLOW, modificación directa de audit, simulation_id usado en endpoint real, role spoofing, volumen anómalo, repetidos intentos denegados o corrupción de fingerprint.

La alerta no cambia el outcome de la evidencia original.

---

#### 162. Rendimiento y crecimiento

La auditoría no puede forzar scans completos del historial para cada evaluación.

Las consultas de estado usan índices por `simulation_id` y revisión.

Las consultas administrativas históricas se separan del camino crítico de evaluación.

El crecimiento, particionamiento y retención se gobiernan por las tareas transversales propietarias.

---

#### 163. Presupuesto de payload

Cada payload JSON debe tener límites definidos por la implementación y pruebas de tamaño.

Un recurso grande se referencia; no se copia completo.

Un exceso de payload falla antes de comprometer un registro parcial.

---

#### 164. Reproducibilidad

Una evaluación histórica se considera reproducible cuando existen:

```text
simulation_revision
scenario_fingerprint
contract versions
catalog versions
source fingerprints
evaluation request
outcome
reason codes
evaluation fingerprint
```

y las identidades mínimas necesarias para interpretar esos valores.

---

#### 165. No reinterpretación histórica

Un cambio posterior de permisos, roles, sedes, áreas, catálogo o política no modifica un resultado simulado histórico.

Puede producir una nueva evaluación bajo una revisión o versión nueva.

El resultado anterior permanece con las versiones originales.

---

#### 166. Evolución de fingerprints

Si evoluciona el algoritmo de fingerprint:

- se publica una versión;
- se conserva el algoritmo histórico;
- no se reescriben fingerprints antiguos;
- una nueva evaluación usa la versión nueva;
- el verificador selecciona algoritmo por metadata contractual.

---

#### 167. Contrato de consulta de auditoría

Una consulta administrativa futura debe distinguir root, revision, evaluation, event, attempt, link y correction.

No devuelve un blob mezclado que pierda procedencia.

La consulta segura no forma parte de una API cliente general.

---

#### 168. Estado de implementación documental

Esta tarea produce exclusivamente el contrato.

No crea migration, tabla, function, trigger, policy, grant, index, código runtime, schema, backfill ni cambio de configuración.

La futura instancia permanece pendiente de autorización física explícita.

---

#### 169. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA**

**Requisitos creados:** 0
**Requisitos modificados:** 0

Justificación: la cobertura contractual y física necesaria para simulación ya está registrada en el 04A vigente por las tareas canónicas de simulación, errores, contexto y auditoría. Esta tarea materializa el contrato físico que esas pruebas consumirán, sin alterar su regla protegida, prioridad, owner, paquete, ambiente, estado ni relación.

---

#### 170. Cobertura de prueba vigente reutilizada

La trazabilidad existente se reutiliza sin modificar el registro 04A.

Cobertura principal:

```text
TREQ-AUTH-012
TREQ-AUTH-015
TREQ-AUTH-069..128
TREQ-AUTH-279..288
```

Dentro de esos rangos ya existen controles de elegibilidad, roles, sedes, áreas, turno, separación de autoridad, fingerprints, cero efectos, bloqueo multicanal y reconciliación física cuya implementación o evidencia incluye `AUTH-DB-013` cuando corresponde.

Esta sección es informativa y no declara requisitos afectados por la entrega.

---

#### 171. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                                                                                                                                                                                                                                                                                      |
| --------- | -------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | el desarrollo documental no creó migration, tablas, funciones, triggers, índices, policies, grants ni código runtime                                                                                                                                                                                                                                                                                           |
| LOCAL     | NOT_EXECUTED   | pendiente de insertar la tarea en la rama documental, ejecutar formateo canónico y validadores reales del checkout actualizado                                                                                                                                                                                                                                                                                 |
| REMOTA    | PASS           | `main` confirma `AUTH-DB-012` cerrada y `AUTH-DB-013` como tarea actual; la topología es `GLOBAL_ENABLE_ONCE` / `PRE_E5_FOUNDATION`; el 04A vigente ya contiene cobertura de simulación; la auditoría read-only observó `audit` ausente, una tabla legacy de simulación con 0 filas, 179 permisos físicos y seis funciones `SECURITY DEFINER` de simulación/contexto efectivo con EXECUTE para `authenticated` |
| OPERATIVA | NOT_APPLICABLE | no se modificaron UI, sesiones, permisos, turnos, check-ins, dispositivos, consumidores ni comportamiento operativo                                                                                                                                                                                                                                                                                            |
| FÍSICA    | NOT_APPLICABLE | no se ejecutó SQL mutante, no se creó migration, no se alteró Supabase y `AUTH-DB-013::GLOBAL` no fue autorizada                                                                                                                                                                                                                                                                                               |

---

#### 172. Validaciones físicas mínimas futuras

Antes de declarar `AUTH-DB-013::GLOBAL` como `VERIFIED` deberán pasar, como mínimo, las familias de esquema, append-only, lifecycle, outcome no ejecutable, actor real, roles, sedes, áreas, turno, check-in, recurso, clasificación de permisos, grants, RLS, funciones privilegiadas, search_path, concurrencia, idempotencia, rollback, restore, drift, compatibilidad legacy, diez aplicaciones, cero efectos reales, minimización e integridad de fingerprints.

---

#### 173. Criterios de aceptación

1. la tarea conserva exactamente el título canónico y ownership del Bloque R.
2. `AUTH-DB-013` permanece `GLOBAL_ENABLE_ONCE` con instancia futura `AUTH-DB-013::GLOBAL`.
3. el gate temporal permanece `PRE_E5_FOUNDATION`.
4. la aprobación documental no autoriza SQL ni migraciones.
5. el schema transversal objetivo es `audit` y no se crea un sustituto por aplicación.
6. la auditoría usa registros append-only y correcciones enlazadas.
7. SimulationContext y AccessContext permanecen separados.
8. AuthorizationDecision real y evaluación simulada permanecen separados.
9. los únicos outcomes simulados son WOULD_ALLOW, WOULD_DENY e INDETERMINATE.
10. toda evaluación simulada conserva executable=false.
11. ninguna evaluación simulada produce can_operate=true.
12. ninguna simulación produce token ejecutable.
13. la autoridad para iniciar simulación proviene del actor real.
14. la decisión real del solicitante puede enlazarse con evidencia de 032.
15. el sujeto simulado nunca sustituye al actor real.
16. los roles simulados son identidades tipadas.
17. las colisiones de código entre catálogos fallan cerrado.
18. las sedes simuladas son identidades exactas y versionadas.
19. APP-REVIEW conserva aislamiento explícito.
20. pickup_camioneta_principal no se convierte en sede.
21. las áreas simuladas son exactas y coherentes con su sede.
22. los agregados de área no se convierten en wildcard.
23. los vínculos sin area_id permanecen no resueltos.
24. el turno simulado no presta el turno real.
25. el check-in simulado no crea asistencia.
26. un check-in real no completa el escenario.
27. los recursos reales solo se referencian bajo autoridad real independiente.
28. FULL_PREVIEW no concede ejecución ni lectura adicional.
29. DECISION_ONLY no expone payload protegido.
30. NOT_ALLOWED falla cerrado.
31. las claves sin clasificación no reciben FULL_PREVIEW implícito.
32. el snapshot 85/52/3 puede reconciliarse contra el catálogo físico vigente.
33. el drift 140 documental versus 179 físico se trata explícitamente.
34. una simulación activa no administra otra usando autoridad simulada.
35. todo efecto real exige una nueva solicitud real sin simulation_id.
36. la idempotencia no reutiliza una simulación para un escenario diferente.
37. la concurrencia no permite dos terminales incompatibles.
38. la expiración bloquea nuevas evaluaciones aunque no haya job.
39. una simulación terminal no se reactiva.
40. una revisión no reescribe revisiones previas.
41. los fingerprints usan canonicalización versionada.
42. las fuentes relevantes conservan versiones y fingerprints.
43. los secretos quedan excluidos.
44. los datos sensibles se minimizan.
45. metadata libre no altera semántica.
46. un deny al iniciar no crea una simulación ficticia.
47. un fallo técnico no se clasifica como deny.
48. un conflicto no usa last-write-wins.
49. el rollback no deja éxito parcial.
50. `audit` permanece fuera de Data API.
51. `anon` no recibe acceso directo.
52. `authenticated` no recibe DML directo sobre audit.
53. `PUBLIC EXECUTE` se revoca en funciones privilegiadas nuevas.
54. SECURITY DEFINER se usa solo con frontera justificada.
55. search_path se endurece y los objetos se califican.
56. service_role no se convierte en autoridad empresarial.
57. las referencias auditables no usan ON DELETE CASCADE destructivo.
58. retención no se inventa dentro de 013.
59. restore conserva IDs, versiones, causalidad y fingerprints.
60. la tabla legacy no se presenta como SimulationContext canónico.
61. cero filas legacy no se presenta como prueba de seguridad.
62. can_manage_context_simulation_v1 no permanece como autoridad por nombre de rol.
63. get_effective_context_v1 no puede seguir mezclando simulación como contexto efectivo real.
64. has_effective_permission_v1 no puede devolver permiso real desde rol simulado.
65. start/stop legacy no permanecen como lifecycle canónico mutable.
66. los grants legacy se revisan explícitamente.
67. la transición no deja dual-write indefinido.
68. el retiro legacy depende de consumidores y gate propietario.
69. AUTH-DB-035 conserva propiedad de frescura real.
70. AUTH-DB-034 conserva propiedad del evaluador real.
71. AUTH-SRV-015 conserva propiedad del servicio de simulación.
72. AUTH-SIM-007..014 no se marcan implementadas por esta tarea.
73. la infraestructura es transversal a las diez aplicaciones.
74. AURA y PASS no adquieren simulación por la existencia del audit.
75. VISO no autoautoriza context_simulations.view.
76. la materialización física exige R0, audit y autorización explícita.
77. no se crea 04A nuevo porque los requisitos ya existen.
78. la evidencia documental distingue BUILD, LOCAL, REMOTA, OPERATIVA y FÍSICA.

---

#### 174. Decisiones vinculantes

1. La futura instancia es `AUTH-DB-013::GLOBAL`.
2. Su modo es `GLOBAL_ENABLE_ONCE`.
3. Su gate es `PRE_E5_FOUNDATION`.
4. Requiere la capa transversal `audit`.
5. La persistencia es append-only.
6. Las correcciones crean nuevas entradas.
7. El actor real y el sujeto simulado son identidades distintas.
8. El contexto real y el escenario hipotético no se fusionan.
9. `AuthorizationDecision` real y evaluación simulada no comparten tabla ni outcome.
10. `WOULD_ALLOW` nunca es `ALLOW`.
11. Toda evaluación simulada declara `executable=false`.
12. `simulation_id` nunca es un token de autoridad.
13. Los roles se identifican por kind + code + versiones.
14. Sede y área se resuelven como identidades exactas.
15. El turno y check-in simulados no usan hechos reales como fallback.
16. La clasificación de simulación es `FULL_PREVIEW`, `DECISION_ONLY` o `NOT_ALLOWED`.
17. Una clasificación ausente falla cerrado.
18. La auditoría conserva versiones, fingerprints y causalidad.
19. `audit` queda fuera de Data API.
20. Los clientes no escriben ni enumeran audit directamente.
21. Los seis helpers legacy observados requieren reconciliación.
22. La tabla legacy mutable no es la fuente objetivo.
23. Cero sesiones actuales no cierra la brecha.
24. 013 no desarrolla `AUTH-SIM-007..014`.
25. 013 no desarrolla auditoría de dispositivos.
26. 013 no desarrolla cambios de permisos.
27. 013 no ejecuta una implementación física desde el carril documental.
28. No se crean ni modifican requisitos de prueba.
29. La siguiente tarea documental es `AUTH-DB-014`.

---

#### 175. Límites

`AUTH-DB-013` no:

- ejecuta `AUTH-DB-013::GLOBAL`;
- crea migrations desde este carril documental;
- ejecuta SQL mutante;
- crea el schema `audit` para evadir `AUTH-DB-016`;
- modifica permisos de trabajadores;
- modifica roles reales;
- crea turnos o check-ins;
- crea una sesión simulada real en el proyecto;
- inicia o detiene una simulación existente;
- desarrolla UI;
- desarrolla Server Actions;
- desarrolla `AUTH-SIM-007..014`;
- certifica las diez aplicaciones;
- modifica `AUTH-DB-012`;
- desarrolla `AUTH-DB-014`;
- fija retención fuera de la política transversal;
- habilita Data API sobre `audit`;
- concede acceso directo a clientes;
- elimina objetos legacy;
- modifica 04A;
- crea TREQ nuevos.

---

#### 176. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-DB-012 — Implementar auditoría de cambios de permisos`

**TAREA ACTUAL APROBADA**
`AUTH-DB-013 — Implementar auditoría de simulación`

**SIGUIENTE TAREA RESERVADA**
`AUTH-DB-014 — Implementar auditoría de dispositivos`


### ✅ AUTH-DB-014 — Implementar auditoría de dispositivos

**Estado:** APROBADA
**Tarea anterior:** AUTH-DB-013 — Implementar auditoría de simulación
**Tarea siguiente:** AUTH-DB-020 — Migrar objetos por dominio con compatibilidad temporal
**Tipo de tarea:** Documental
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/02_R1_FUNDACION_FISICA_CANONICA.md`
**Estado físico resultante:** Contrato global de auditoría inmutable, correlacionable y transaccional del lifecycle de dispositivos compartidos cerrado; futura instancia `AUTH-DB-014::GLOBAL` pendiente de autorización explícita y de la capa transversal `audit`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir el contrato canónico, global, inmutable y transaccional de auditoría para el ciclo de vida de dispositivos compartidos y sus identidades técnicas, sin convertir la evidencia de auditoría en fuente de autoridad empresarial ni adelantar la implementación operativa de las tareas `AUTH-DEV-007` a `AUTH-DEV-016`.

La tarea separa de forma obligatoria:

```text
DISPOSITIVO LÓGICO
!=
ENDPOINT TÉCNICO
!=
PRINCIPAL TÉCNICO
!=
VÍNCULO DE CREDENCIAL
!=
ACTIVO FÍSICO
!=
ESTACIÓN
!=
ACTOR HUMANO
!=
SESIÓN DE ACTOR
!=
DECISIÓN DE AUTORIZACIÓN
!=
EVIDENCIA DE AUDITORÍA
```

El resultado de esta tarea es documental. No crea objetos en Supabase, no cambia dispositivos, no rota credenciales, no revoca sesiones y no ejecuta la futura instancia `AUTH-DB-014::GLOBAL`.

#### 2. Resultado canónico

Queda definido un único contrato global de auditoría de dispositivos reutilizable por todos los consumidores autorizados.

La futura instancia podrá materializar la infraestructura:

```text
audit.authorization_devices
audit.authorization_device_revisions
audit.authorization_device_events
audit.authorization_device_attempts
audit.authorization_device_links
audit.authorization_device_corrections
```

Semántica:

- `audit.authorization_devices`: raíz inmutable de auditoría por `device_id` canónico; no sustituye el registro empresarial del dispositivo;
- `audit.authorization_device_revisions`: snapshot versionado de la configuración material que participó en cada transición relevante;
- `audit.authorization_device_events`: hechos de lifecycle confirmados;
- `audit.authorization_device_attempts`: intentos denegados, fallidos, conflictivos o sin efecto confirmado;
- `audit.authorization_device_links`: correlación con decisiones, sesiones, recursos, cambios de permisos, simulaciones, migraciones y evidencia externa;
- `audit.authorization_device_corrections`: correcciones append-only sin reescribir evidencia histórica.

#### 3. Clasificación topológica

La clasificación vigente es:

```text
task_id = AUTH-DB-014
mode = GLOBAL_ENABLE_ONCE
instance = AUTH-DB-014::GLOBAL
execution_gate = PRE_E5_FOUNDATION
canonical_work = DEFINE_CONTRACT_ONCE
```

Consecuencias:

1. el marcador documental se desarrolla una sola vez;
2. existe como máximo una instancia física global;
3. no se crea una instancia por `package_id`;
4. la aprobación documental no autoriza la instancia;
5. la futura infraestructura podrá existir antes de E5 porque es transversal y reutilizable;
6. su adopción por writers legacy o por paquetes concretos continúa dependiendo de sus tareas propietarias;
7. una corrección física posterior se realiza mediante migración forward versionada.

#### 4. Precondición transversal obligatoria

`AUTH-DB-014::GLOBAL` requiere la capa transversal aprobada por `SUPA-ARC-007`:

```text
audit
```

Si el schema `audit` no existe físicamente cuando se autorice la instancia:

```text
AUTH-DB-014::GLOBAL
-> BLOCKED
```

014 no crea una tabla alternativa en `public`, `technology_operations`, una aplicación o un dominio para evadir esta precondición.

#### 5. Fuentes vinculantes consumidas

La definición conserva las decisiones de:

- `SUPA-ARC-007`, para la capa transversal `audit`, evidencia append-only y clases de compromiso;
- `AUTH-MOD-011`, para separación entre dispositivo compartido, principal técnico y actor humano;
- `AUTH-CTX-006`, `AUTH-CTX-014`, `AUTH-CTX-025` y `AUTH-CTX-029`, para contexto, identidad técnica e invalidación;
- `AUTH-DEV-001` a `AUTH-DEV-006`, para inventario, identidad, sede, área, aplicaciones y techo máximo;
- `AUTH-DB-012`, para auditoría de cambios de permisos sin absorber lifecycle de dispositivo;
- `AUTH-DB-013`, para auditoría de simulación sin absorber lifecycle de dispositivo;
- `AUTH-DB-032`, para persistencia de decisiones que solo referencia el dispositivo cuando participó;
- `AUTH-DB-035`, para frescura e invalidación derivadas de cambios de identidad o contexto;
- `AUTH-DB-020`, para adopción física progresiva de contratos en objetos migrados;
- `AUTH-DEV-007` a `AUTH-DEV-013`, como futuros productores funcionales del lifecycle y de sesiones de actor;
- `AUTH-QA-017`, `AUTH-QA-018` y `AUTH-QA-030`, como certificación posterior.

#### 6. Frontera de propiedad

`AUTH-DB-014` no se convierte en fuente de verdad del dispositivo.

La autoridad del estado vigente del dispositivo, endpoint, principal técnico, vínculo de credencial, plantilla, sede, área, aplicaciones, paquetes y políticas permanece en las fuentes canónicas que las tareas propietarias materialicen.

`audit` conserva evidencia histórica y correlacionable:

```text
FUENTE VIGENTE
-> estado empresarial/técnico actual

AUDIT
-> evidencia inmutable de qué cambió, quién lo solicitó,
   qué fue validado, qué resultado ocurrió y con qué versión
```

Una fila de auditoría no puede reactivar, suspender, mover, autorizar ni retirar un dispositivo.

#### 7. Frontera con AUTH-DB-012

`AUTH-DB-012` registra cambios de autoridad real sobre permisos, concesiones y denegaciones.

`AUTH-DB-014` registra lifecycle y configuración de dispositivos.

Ejemplos:

```text
cambiar permiso individual de un empleado
-> AUTH-DB-012

rotar credencial de un dispositivo
-> AUTH-DB-014

reducir paquete máximo del dispositivo
-> AUTH-DB-014
   + vínculo a la evidencia de autorización aplicable

usar device_id como contexto de quien administró permisos
-> AUTH-DB-012 puede referenciarlo
```

Ninguna de las dos tareas duplica el registro principal de la otra.

#### 8. Frontera con AUTH-DB-013

`AUTH-DB-013` registra simulaciones, revisiones de escenario, evaluaciones hipotéticas y lifecycle de simulación.

`AUTH-DB-014` registra lifecycle de dispositivos reales o técnicamente enrolados.

Una simulación puede conservar una referencia mínima al `device_id` real desde el que se solicitó, pero:

- no convierte el dispositivo en simulación;
- no registra un cambio de actor como cambio de escenario;
- no registra rotación de credencial como evento de simulación;
- no trata `WOULD_ALLOW` como autoridad del dispositivo.

#### 9. Frontera con AUTH-DB-032

`AUTH-DB-032` persiste decisiones de autorización.

Cuando un dispositivo participó en la decisión, 032 conserva `device_id`, principal técnico y referencias de contexto aprobadas.

014 conserva los eventos del dispositivo que explican su lifecycle.

```text
authorization_decision
-> qué se decidió para una solicitud

authorization_device_event
-> qué ocurrió con el dispositivo
```

Un evento de dispositivo no es una decisión de autorización y una decisión no reemplaza el historial del dispositivo.

#### 10. Frontera con AUTH-DB-035

Los cambios de dispositivo que alteran identidad, sesión, territorio, aplicaciones, paquetes, credenciales o capacidad deberán invalidar contexto y tokens derivados conforme a `AUTH-DB-035`.

014 conserva evidencia del hecho que disparó la invalidación y puede vincular:

```text
device_event_id
freshness_event_id
generation_before
generation_after
```

014 no implementa el algoritmo de frescura ni genera por sí sola autoridad nueva.

#### 11. Frontera con AUTH-DB-020

`AUTH-DB-014::GLOBAL` crea la infraestructura global de auditoría cuando sea autorizada.

`AUTH-DB-020::<package_id>` adopta los contratos canónicos en cada conjunto de objetos que migre y deberá clasificar cada writer de dispositivo o de configuración como:

```text
CANONICAL_AUDITED
TRANSITIONAL_ADAPTER
BLOCKED_FOR_MIGRATION
LEGACY_READ_ONLY
```

014 no mueve las tablas legacy de dispositivo ni ejecuta backfills de dominio.

#### 12. Frontera con AUTH-DEV-007 a AUTH-DEV-016

Las tareas del BLOQUE P implementarán comportamiento y pruebas de dispositivos.

Relación:

- `AUTH-DEV-007`: identificación fuerte del trabajador;
- `AUTH-DEV-008`: intersección entre actor y límites del dispositivo;
- `AUTH-DEV-009`: no heredar autoridad administrativa;
- `AUTH-DEV-010`: producir la evidencia correlacionada de dispositivo y trabajador;
- `AUTH-DEV-011`: revocar dispositivo;
- `AUTH-DEV-012`: manejar sesión expirada;
- `AUTH-DEV-013`: manejar cambio de trabajador;
- `AUTH-DEV-014` a `AUTH-DEV-016`: validar equipos y aplicaciones reales.

Estas tareas consumen 014; no crean un ledger alternativo.

#### 13. Planos de identidad obligatoriamente separados

La auditoría reconoce como identidades independientes:

| Identidad                   | Significado                                    |
| --------------------------- | ---------------------------------------------- |
| `device_id`                 | dispositivo lógico administrado                |
| `device_code`               | código humano estable y no reutilizable        |
| `endpoint_id`               | instalación técnica enrolada                   |
| `technical_principal_id`    | principal técnico autenticado                  |
| `credential_binding_id`     | vínculo versionado de credencial               |
| `asset_id`                  | equipo físico                                  |
| `station_instance_id`       | puesto físico compuesto                        |
| `actor_employee_id`         | humano efectivo cuando aplique                 |
| `actor_session_id`          | sesión temporal del actor                      |
| `administrative_actor_id`   | actor real que ordenó un cambio administrativo |
| `authorization_decision_id` | decisión que autorizó una operación protegida  |
| `correlation_id`            | correlación transversal                        |
| `causation_id`              | hecho inmediatamente causante                  |

Ninguno puede sustituirse por otro por conveniencia.

#### 14. Raíz de auditoría del dispositivo

`audit.authorization_devices` conserva una raíz inmutable por `device_id`.

Campos mínimos contractuales:

```text
device_audit_id
device_id
device_code
first_observed_at
first_event_id
source_registry
source_identity_version
created_at
```

Reglas:

1. una raíz no concede existencia física validada;
2. el `device_code` se conserva como referencia histórica;
3. un reemplazo de hardware no crea automáticamente otra raíz si el contrato mantiene el mismo dispositivo lógico;
4. un dispositivo lógico nuevo exige otro `device_id`;
5. la raíz no se elimina por revocación o retiro.

#### 15. Revisión auditable de configuración

`audit.authorization_device_revisions` conserva un snapshot por cambio material.

Campos mínimos:

```text
device_revision_id
device_audit_id
device_id
revision_number
revision_kind
configuration_snapshot
configuration_fingerprint
source_versions
source_fingerprints
valid_from
recorded_at
recorded_by_actor_id
correlation_id
```

`configuration_snapshot` no contiene secretos y solo incluye valores necesarios para reproducir la decisión de lifecycle.

#### 16. Componentes versionables de una revisión

Una nueva revisión se exige cuando cambia materialmente cualquiera de estas dimensiones:

- endpoint;
- principal técnico;
- vínculo de credencial;
- activo físico;
- estación;
- estado de activación;
- plantilla y versión;
- sede fija;
- política de área o conjunto permitido;
- aplicaciones efectivas;
- aplicación predeterminada;
- paquete máximo de permisos;
- reducción específica de instancia;
- política de actor;
- soporte de reautenticación fuerte;
- restricciones de dispositivo;
- generación de instalación;
- generación de credencial.

Un cambio puramente visual sin impacto contractual no crea revisión salvo que una política propietaria lo exija.

#### 17. Fingerprint de configuración

Cada revisión material usa SHA-256 sobre una representación canonicalizada.

La preimagen incluye únicamente campos semánticos:

```text
contract_name
contract_version
device_id
revision_number
endpoint_id
technical_principal_id
credential_binding_id
asset_id
station_instance_id
activation_state
template_code
template_version
site_binding
area_policy
application_set
permission_package_set
actor_policy
installation_generation
credential_generation
source_versions
```

No se incluyen timestamps de escritura, IDs de fila de auditoría ni metadata de transporte que cambie sin alterar el significado.

#### 18. Estados de lifecycle

El contrato distingue:

```text
DRAFT
ENROLLING
ACTIVE
SUSPENDED
REVOKED
RETIRED
CONFLICTED
RECOVERY_REQUIRED
```

Reglas:

- `ACTIVE` no equivale a equipo físicamente verificado;
- `SUSPENDED` impide acciones empresariales mientras dure;
- `REVOKED` invalida la identidad técnica aplicable;
- `RETIRED` es terminal para nuevas operaciones del dispositivo lógico salvo proceso formal de reversión aprobado por otra decisión;
- `CONFLICTED` falla cerrado;
- `RECOVERY_REQUIRED` no permite autorizar por fallback.

#### 19. Taxonomía de eventos

`audit.authorization_device_events.event_type` utiliza vocabulario cerrado y versionado.

Familias:

```text
IDENTITY
ENROLLMENT
ACTIVATION
CREDENTIAL
ENDPOINT
HARDWARE
TERRITORY
APPLICATIONS
PERMISSIONS
TEMPLATE
ACTOR_SESSION
HEALTH_STATE
SUSPENSION
REVOCATION
RETIREMENT
CONFLICT
RECOVERY
MIGRATION
```

Un string libre no crea un tipo canónico nuevo.

#### 20. Catálogo inicial de eventos

| Event type                    | Familia         | Semántica                                                                                   |
| ----------------------------- | --------------- | ------------------------------------------------------------------------------------------- |
| `DEVICE_REGISTERED`           | `IDENTITY`      | Se registra por primera vez la identidad lógica auditable.                                  |
| `ENROLLMENT_STARTED`          | `ENROLLMENT`    | Comienza enrolamiento sin conceder operación.                                               |
| `ENROLLMENT_SUCCEEDED`        | `ENROLLMENT`    | Posesión y vínculo técnico quedaron validados.                                              |
| `ENROLLMENT_FAILED`           | `ENROLLMENT`    | El enrolamiento terminó sin identidad operativa válida.                                     |
| `DEVICE_ACTIVATED`            | `ACTIVATION`    | El estado vigente pasa a activo mediante operación autorizada.                              |
| `DEVICE_SUSPENDED`            | `SUSPENSION`    | Se bloquea temporalmente el dispositivo.                                                    |
| `DEVICE_RESUMED`              | `SUSPENSION`    | Se restaura desde suspensión después de revalidación.                                       |
| `CREDENTIAL_ROTATION_STARTED` | `CREDENTIAL`    | Comienza rotación y se fija la generación previa.                                           |
| `CREDENTIAL_ROTATED`          | `CREDENTIAL`    | Nueva generación quedó activa y la anterior dejó de ser válida.                             |
| `CREDENTIAL_ROTATION_FAILED`  | `CREDENTIAL`    | No se confirma cambio de generación.                                                        |
| `CREDENTIAL_REVOKED`          | `CREDENTIAL`    | El vínculo de credencial deja de ser válido.                                                |
| `ENDPOINT_REINSTALLED`        | `ENDPOINT`      | Se crea endpoint nuevo para el mismo dispositivo lógico mediante recuperación autorizada.   |
| `ENDPOINT_REVOKED`            | `ENDPOINT`      | Endpoint anterior deja de ser aceptable.                                                    |
| `HARDWARE_REPLACED`           | `HARDWARE`      | Se sustituye activo físico conservando o no el dispositivo lógico según decisión explícita. |
| `SITE_BINDING_CHANGED`        | `TERRITORY`     | Cambia la sede fija con cierre de versión anterior.                                         |
| `AREA_POLICY_CHANGED`         | `TERRITORY`     | Cambia área fija o conjunto permitido.                                                      |
| `APPLICATION_SET_CHANGED`     | `APPLICATIONS`  | Cambia el conjunto efectivo de aplicaciones.                                                |
| `DEFAULT_APPLICATION_CHANGED` | `APPLICATIONS`  | Cambia la aplicación predeterminada válida.                                                 |
| `PERMISSION_PACKAGE_CHANGED`  | `PERMISSIONS`   | Cambia techo o reducción de permisos.                                                       |
| `TEMPLATE_BINDING_CHANGED`    | `TEMPLATE`      | Cambia plantilla o versión de plantilla.                                                    |
| `ACTOR_SESSION_STARTED`       | `ACTOR_SESSION` | Se identifica actor humano para una sesión temporal.                                        |
| `ACTOR_SESSION_ENDED`         | `ACTOR_SESSION` | Cierre normal de sesión de actor.                                                           |
| `ACTOR_SESSION_EXPIRED`       | `ACTOR_SESSION` | Cierre por vencimiento.                                                                     |
| `ACTOR_SESSION_REVOKED`       | `ACTOR_SESSION` | Cierre anticipado por revocación.                                                           |
| `ACTOR_CHANGED`               | `ACTOR_SESSION` | Termina actor previo y comienza nuevo actor mediante transición correlacionada.             |
| `DEVICE_BECAME_UNHEALTHY`     | `HEALTH_STATE`  | Cambio de estado de salud que bloquea o degrada capacidad según política.                   |
| `DEVICE_RECOVERED_HEALTH`     | `HEALTH_STATE`  | Recupera estado de salud después de validación.                                             |
| `DEVICE_REVOKED`              | `REVOCATION`    | Se invalida el dispositivo para nuevas acciones.                                            |
| `RETIREMENT_STARTED`          | `RETIREMENT`    | Comienza retiro controlado.                                                                 |
| `DEVICE_RETIRED`              | `RETIREMENT`    | Finaliza retiro y se preserva identidad histórica.                                          |
| `IDENTITY_CONFLICT_DETECTED`  | `CONFLICT`      | Se detecta duplicado, clon o vínculo incompatible.                                          |
| `IDENTITY_CONFLICT_RESOLVED`  | `CONFLICT`      | La reconciliación cierra el conflicto con evidencia.                                        |
| `RECOVERY_STARTED`            | `RECOVERY`      | Comienza recuperación controlada.                                                           |
| `RECOVERY_COMPLETED`          | `RECOVERY`      | La recuperación termina con identidades y generaciones nuevas o revalidadas.                |
| `LEGACY_RECORD_IMPORTED`      | `MIGRATION`     | Se preserva evidencia existente sin afirmar un hecho no demostrado.                         |

#### 21. Invariantes de evento confirmado

Un registro en `authorization_device_events` significa que el hecho ocurrió o quedó confirmado por la fuente autorizada.

Campos mínimos:

```text
device_event_id
device_audit_id
device_id
device_revision_id
event_type
event_family
event_outcome
occurred_at
recorded_at
administrative_actor_id
actor_employee_id
actor_session_id
technical_principal_id
endpoint_id
credential_binding_id
authorization_decision_id
correlation_id
causation_id
source_system
source_operation_id
contract_version
source_versions
source_fingerprints
event_payload
event_fingerprint
```

`event_outcome` para un evento confirmado es `SUCCEEDED` o `NO_OP_CONFIRMED`; un fallo previo pertenece a attempts.

#### 22. Intentos de lifecycle

`audit.authorization_device_attempts` registra operaciones que no producen un cambio confirmado.

Resultados:

```text
DENIED
FAILED
CONFLICT
RETRYABLE_FAILURE
UNKNOWN_OUTCOME
NO_EFFECT
```

Casos:

- activación sin autorización;
- revocación con dispositivo inexistente;
- rotación con vínculo de credencial obsoleto;
- traslado cross-site no permitido;
- cierre de sesión de actor que ya estaba cerrada;
- conflicto de concurrencia;
- fallo de proveedor externo;
- timeout con resultado todavía incierto.

#### 23. Campos de un intento

Campos mínimos:

```text
device_attempt_id
device_id
requested_operation
requested_at
resolved_at
outcome
reason_codes
administrative_actor_id
actor_employee_id
technical_principal_id
endpoint_id
authorization_decision_id
correlation_id
idempotency_key_hash
source_operation_id
safe_request_snapshot
safe_result_snapshot
contract_version
source_versions
attempt_fingerprint
```

No se almacena el secreto usado en la solicitud.

#### 24. Eventos de actor y cambio de trabajador

El cambio de trabajador nunca se modela como edición del actor de una misma sesión.

Flujo canónico:

```text
ACTOR_SESSION_ENDED(actor A)
+
ACTOR_SESSION_STARTED(actor B)
+
ACTOR_CHANGED(correlation_id común)
```

Cuando el actor A no puede cerrarse limpiamente:

```text
ACTOR_SESSION_REVOKED(actor A)
+
ACTOR_SESSION_STARTED(actor B)
```

La sesión de actor B no hereda permisos, reautenticaciones, recursos, idempotency keys ni contexto cacheado del actor A.

#### 25. Auditoría de enrolamiento

El enrolamiento registra por separado:

1. solicitud;
2. challenge emitido;
3. prueba de posesión verificada;
4. endpoint asignado;
5. principal técnico vinculado;
6. vínculo de credencial creado;
7. revisión de configuración;
8. activación, si fue autorizada.

No se considera enrolado por recibir `device_id` desde el cliente, por coincidir IP, MAC, hostname, serial, User-Agent o fingerprint de navegador.

#### 26. Auditoría de activación

`DEVICE_ACTIVATED` exige:

```text
device_id válido
+
endpoint válido
+
principal técnico válido
+
vínculo de credencial vigente
+
configuración no conflictiva
+
autorización administrativa aplicable
+
revisión persistida
+
evidencia durable
```

La activación no crea permisos del actor y no demuestra que una estación física haya sido validada en sitio.

#### 27. Auditoría de suspensión y reanudación

Suspensión:

- conserva identidad histórica;
- invalida capacidad operativa;
- termina o invalida sesiones incompatibles;
- provoca frescura/invalidation cuando corresponda;
- registra razón y actor;
- no elimina evidencia.

Reanudación:

- nunca ocurre por simple cambio de `is_active`;
- exige verificar que la causa de suspensión está resuelta;
- produce revisión nueva cuando cambia configuración;
- reautoriza desde cero el contexto aplicable.

#### 28. Auditoría de rotación de credenciales

La rotación registra:

```text
credential_generation_before
credential_generation_after
credential_binding_before
credential_binding_after
rotation_reason
initiated_at
completed_at
provider_reference_hash
result
```

Prohibido persistir:

- contraseña;
- secret key;
- token completo;
- refresh token;
- private key;
- PIN;
- passkey secret;
- código MFA;
- challenge reutilizable.

#### 29. Auditoría de revocación de credenciales

`CREDENTIAL_REVOKED` identifica la generación y vínculo revocados.

La revocación debe ser idempotente:

```text
revocar vínculo vigente
-> evento confirmado

repetir misma revocación con misma idempotency key
-> mismo resultado lógico, sin duplicar efecto

revocar vínculo distinto u obsoleto
-> intento denegado o conflictivo
```

Una revocación no borra el vínculo histórico.

#### 30. Auditoría de reinstalación

Una reinstalación autorizada:

- conserva `device_id` solo cuando el contrato de recuperación lo permite;
- crea `endpoint_id` nuevo;
- incrementa generación de instalación;
- crea vínculo técnico nuevo;
- revoca endpoint y vínculo anteriores;
- invalida sesiones incompatibles;
- registra correlación entre identidades anterior y nueva.

La auditoría debe permitir reconstruir la cadena completa.

#### 31. Auditoría de reemplazo de hardware

Un reemplazo de hardware puede:

```text
MANTENER device_id
```

solo cuando existe decisión explícita de sustitución del mismo dispositivo lógico.

Debe conservar:

- activo anterior;
- activo nuevo;
- endpoint anterior;
- endpoint nuevo;
- motivo;
- aprobador;
- evidencia física o administrativa;
- revisión antes/después;
- fingerprint antes/después.

Sin decisión explícita se crea una identidad lógica nueva o se falla cerrado.

#### 32. Auditoría de traslado de sede

`SITE_BINDING_CHANGED` nunca actualiza silenciosamente la sede.

Debe registrar:

```text
site_binding_before
site_binding_after
effective_at
verified_destination
invalidated_actor_sessions
freshness_link
administrative_actor_id
reason
```

La sede anterior permanece en la evidencia histórica.

Un `null`, una sede inactiva o una resolución ambigua no significan cobertura global.

#### 33. Auditoría de política de área

Cambio de área fija o conjunto permitido:

- cierra la versión anterior;
- crea versión nueva;
- conserva miembros exactos;
- valida pertenencia a la sede;
- termina sesiones incompatibles;
- invalida contexto afectado;
- revalida plantilla, aplicaciones y paquete máximo;
- registra diff semántico.

No se audita una lista ordenada como cambio cuando solo cambió el orden y no la semántica.

#### 34. Auditoría de aplicaciones

`APPLICATION_SET_CHANGED` registra conjunto antes/después mediante códigos canónicos exactos.

Debe conservar:

- apps añadidas;
- apps retiradas;
- default anterior;
- default nuevo;
- versión de catálogo;
- plantilla/version;
- actor;
- justificación;
- invalidaciones disparadas.

Una aplicación visible, instalada o enrutable no se interpreta como pertenencia al conjunto.

#### 35. Auditoría de techo de permisos

`PERMISSION_PACKAGE_CHANGED` registra:

- paquetes antes/después;
- versiones;
- claves añadidas o retiradas por delta;
- clasificación STANDARD/STRONG/NOT_ALLOWED cuando aplique;
- catálogo de permisos;
- actor autorizador;
- motivo;
- invalidaciones;
- vínculo a cambio de autoridad cuando exista.

El evento no concede permisos. Solo evidencia la configuración del límite técnico.

#### 36. Auditoría de plantilla

`TEMPLATE_BINDING_CHANGED` separa:

```text
device_id
template_code
template_version
```

Cambiar plantilla:

- no cambia automáticamente `device_id`;
- no autoriza aplicaciones o permisos fuera de la nueva intersección;
- obliga a recalcular sede, área, apps, paquete y política de actor;
- produce conflicto si la instancia no puede satisfacer la plantilla.

#### 37. Auditoría de revocación del dispositivo

`DEVICE_REVOKED` es un hecho de seguridad de alto impacto.

Debe correlacionar:

- actor que revoca;
- motivo;
- decisión autorizadora;
- endpoint y principal revocados;
- credenciales afectadas;
- sesiones de actor terminadas;
- contexto y tokens invalidados;
- estado anterior;
- estado resultante;
- evidencia de efectos externos;
- resultado de conciliación.

No puede confirmarse éxito mientras un efecto obligatorio conserve estado desconocido sin contención.

#### 38. Auditoría de retiro

El retiro conserva:

```text
device_id
device_code
historial completo
vínculos anteriores
revisiones
eventos
intentos
correcciones
```

No reutiliza `device_code`.

El retiro no borra evidencia ni reactiva automáticamente una identidad ante un alta posterior.

#### 39. Auditoría de conflictos de identidad

Se registra `IDENTITY_CONFLICT_DETECTED` cuando exista cualquiera de estos casos:

- mismo principal técnico vinculado incompatiblemente a varios dispositivos;
- mismo endpoint vinculado a varias identidades;
- clon de credencial;
- duplicación de `device_code`;
- múltiples vínculos vigentes donde debe existir uno;
- activo físico asociado contradictoriamente;
- estación incompatible;
- reconciliación física no concluyente.

Mientras el conflicto siga abierto, las acciones empresariales dependientes del dispositivo fallan cerrado.

#### 40. Resolución de conflictos

`IDENTITY_CONFLICT_RESOLVED` exige:

- caso de conflicto;
- fuentes comparadas;
- decisión;
- actor responsable;
- identidades que permanecen;
- identidades cerradas;
- efectos de revocación;
- versión de configuración resultante;
- evidencia física cuando aplique;
- fingerprint antes/después.

La resolución no reescribe el evento de conflicto original.

#### 41. Correcciones append-only

Una evidencia incorrecta no se edita.

`audit.authorization_device_corrections` conserva:

```text
device_correction_id
target_record_type
target_record_id
correction_kind
reason
authorized_by_actor_id
authorization_decision_id
before_reference
after_reference
recorded_at
correction_fingerprint
```

La corrección puede aclarar metadata o enlazar evidencia faltante, pero no falsifica que un hecho ocurrió cuando no existe prueba.

#### 42. Links de correlación

`audit.authorization_device_links` relaciona sin duplicar payloads:

```text
device_event
authorization_decision
permission_change
simulation
freshness_event
actor_session
business_resource
migration
external_provider_operation
evidence_object
incident
```

Cada link declara:

```text
source_type
source_id
target_type
target_id
relationship
recorded_at
```

No se permite un link cuyo tipo no pertenezca al vocabulario aprobado.

#### 43. Atomicidad para cambios locales

Cuando el estado fuente y la auditoría viven en la misma base y la operación es transaccional:

```text
MUTAR FUENTE
+
INSERTAR REVISIÓN
+
INSERTAR EVENTO
+
REGISTRAR INVALIDACIÓN/OUTBOX APLICABLE
=
MISMA TRANSACCIÓN
```

Clase:

```text
AUDIT_ATOMIC_REQUIRED
```

No se confirma éxito al cliente si la mutación queda durable y la evidencia obligatoria no.

#### 44. Efectos externos y durable before ack

Para rotación de proveedor, Auth, MDM, secreto externo u otra operación fuera de la transacción PostgreSQL:

1. se crea intento durable;
2. se fija `correlation_id` e idempotency key;
3. se registra la obligación o ancla durable;
4. se ejecuta el efecto externo;
5. se persiste resultado;
6. se reconcilia estado;
7. solo entonces se presenta éxito definitivo.

Clase por defecto:

```text
AUDIT_DURABLE_BEFORE_ACK
```

Un timeout produce `UNKNOWN_OUTCOME`, no éxito supuesto.

#### 45. Outbox y eventos transversales

014 no crea un outbox general alternativo.

Cuando una transición de dispositivo deba publicar un evento o invalidación, reutiliza la infraestructura transversal aprobada por `SUPA-ARC-007` y las tareas propietarias.

La auditoría conserva el link entre:

```text
device_event_id
outbox_item_id
business_event_id
delivery/effect evidence
```

si esos artefactos existen.

#### 46. Idempotencia

Toda operación mutante de lifecycle debe tener identidad idempotente estable.

La preimagen de idempotencia incluye, según operación:

```text
device_id
operation_kind
expected_revision
target_generation
target_binding
requested_effect
actor_id
request_scope
```

La auditoría guarda únicamente hash o referencia segura de la key.

La misma operación repetida no crea dos activaciones, dos revocaciones ni dos rotaciones.

#### 47. Concurrencia

La implementación futura debe impedir:

- dos activaciones incompatibles;
- dos rotaciones simultáneas sobre la misma generación;
- revocación y activación concurrentes;
- doble cambio de actor;
- traslado de sede durante sesión incompatible;
- cambio de paquete sobre revisión obsoleta;
- recuperación mientras retiro está en curso.

La decisión usa `expected_revision` o mecanismo equivalente y falla cerrado ante stale write.

#### 48. Secuencia por dispositivo

No existe orden global confiable por timestamp.

Cada dispositivo conserva orden lógico por:

```text
device_id
revision_number
event_sequence
causation_id
```

`recorded_at` no sustituye la causalidad.

Una importación tardía puede tener `occurred_at` anterior sin alterar silenciosamente una revisión ya consolidada.

#### 49. Timestamps

Timestamps mínimos:

| Campo          | Regla                                              |
| -------------- | -------------------------------------------------- |
| `occurred_at`  | cuándo ocurrió el hecho                            |
| `recorded_at`  | cuándo quedó durable en audit                      |
| `requested_at` | cuándo se solicitó un intento                      |
| `resolved_at`  | cuándo se conoció el resultado                     |
| `effective_at` | desde cuándo rige una configuración cuando difiera |
| `expires_at`   | solo cuando el concepto expira                     |
| `revoked_at`   | revocación efectiva                                |
| `retired_at`   | retiro efectivo                                    |

Todos se almacenan como `timestamptz`. La presentación local no altera la semántica.

#### 50. Versionado contractual

Valores iniciales:

```text
contract_family = vento.authorization.device-audit
contract_family_version = 1.0.0
contract_name = AuthorizationDeviceAudit
contract_version = 1.0.0
schema_version = 1.0.0
```

Cambios incompatibles exigen versión nueva.

Un campo desconocido no se interpreta permisivamente.

#### 51. Versiones de fuente

`source_versions` usa vocabulario cerrado cuando la fuente participa:

```text
device_registry
endpoint_registry
technical_principal_registry
credential_binding_registry
device_template_catalog
site_catalog
area_catalog
application_catalog
permission_catalog
device_permission_package_catalog
actor_policy_catalog
authorization_contract
freshness_contract
```

No se utilizan valores genéricos como `latest`, `current` o `unknown`.

#### 52. Fingerprints de fuente

`source_fingerprints` conserva únicamente las fuentes que materialmente participaron.

Formato:

```text
sha256:
+
64 caracteres hexadecimales minúsculos
```

La preimagen se canonicaliza de forma determinista.

Un fingerprint no es firma criptográfica del actor y no sustituye control de acceso.

#### 53. Canonicalización

La serialización usada para fingerprints debe:

- ordenar claves de objeto;
- normalizar strings según el contrato;
- preservar tipos;
- ordenar conjuntos cuya semántica sea de conjunto;
- preservar arrays cuando el orden sea semántico;
- excluir timestamps no semánticos;
- excluir IDs de fila de auditoría;
- excluir secretos;
- definir representación exacta de `null`.

`jsonb::text` no se adopta por sí solo como contrato de canonicalización.

#### 54. Inmutabilidad

Tablas de evidencia confirmada:

```text
authorization_devices
authorization_device_revisions
authorization_device_events
authorization_device_attempts
authorization_device_links
authorization_device_corrections
```

se tratan como append-only para usuarios y servicios ordinarios.

No se permiten:

- UPDATE histórico;
- DELETE ordinario;
- TRUNCATE desde roles de aplicación;
- corrección en sitio;
- cascadas que borren evidencia por eliminar una fuente.

Las referencias a objetos retirados deben sobrevivir mediante IDs y snapshots mínimos.

#### 55. Acceso directo desde clientes

Roles de cliente no reciben acceso directo al schema `audit`.

Objetivo:

```text
anon
-> 0 acceso directo

authenticated
-> 0 acceso directo

dispositivo técnico
-> 0 acceso SQL directo al ledger

service_role
-> no se considera autoridad empresarial por sí solo
```

Toda escritura pasa por una función o servicio interno con contrato, validación e identidad efectiva.

#### 56. Proyección de consulta

Si una interfaz administrativa necesita consultar auditoría, lo hará mediante una proyección mínima y autorizada.

La proyección:

- vive en `api` o en servicio equivalente aprobado;
- no expone secretos;
- no entrega payload interno completo por defecto;
- aplica alcance real del actor;
- conserva paginación y límites;
- separa resumen de evidencia sensible;
- registra accesos sensibles cuando corresponda.

014 no crea la interfaz de usuario.

#### 57. Funciones privilegiadas

Una función `SECURITY DEFINER` futura solo se admite cuando:

- existe necesidad real de cruzar RLS;
- reside en schema no expuesto;
- tiene owner técnico controlado;
- fija `search_path` endurecido;
- usa nombres cualificados;
- valida identidad y autorización;
- revoca `PUBLIC EXECUTE`;
- concede solo firmas exactas;
- tiene pruebas de search-path poisoning y llamada directa.

`SECURITY DEFINER` nunca se añade para resolver simplemente un error de permiso.

#### 58. Minimización del payload

`event_payload`, `safe_request_snapshot` y `safe_result_snapshot` contienen únicamente datos necesarios para reproducir el hecho.

Preferir:

```text
IDs estables
códigos canónicos
versiones
hashes
razones estructuradas
diff mínimo
```

Evitar:

```text
objetos completos
perfiles completos
tokens
headers
payloads de terceros
PII no necesaria
```

#### 59. Secretos prohibidos

Nunca se persisten en audit:

- contraseña;
- PIN de trabajador;
- PIN de dispositivo;
- bearer token;
- JWT completo;
- refresh token;
- service role key;
- secret key;
- private key;
- passkey private material;
- OTP;
- recovery code;
- challenge reutilizable;
- cookie;
- session secret;
- Authorization header.

Cuando sea necesaria correlación se usa referencia opaca o hash no reversible con política aprobada.

#### 60. Datos personales

La auditoría puede conservar IDs de actor cuando son necesarios para atribución, pero no copia perfiles laborales ni datos personales no requeridos.

`actor_employee_id` prueba atribución; no justifica persistir:

- nombre completo;
- documento;
- correo;
- teléfono;
- salario;
- diagnóstico;
- información disciplinaria;
- metadata ajena al evento.

#### 61. Telemetría frente a auditoría

014 no convierte cada heartbeat en evento de auditoría.

Separación:

```text
TELEMETRÍA
-> frecuencia alta, salud, métricas, last_seen

AUDITORÍA
-> cambios de estado, operaciones protegidas, incidentes y hechos relevantes
```

Solo un cambio de estado de salud con consecuencia contractual produce evento auditable.

#### 62. Semántica de last_seen_at

`last_seen_at` es observabilidad y no prueba por sí sola:

- identidad física;
- actor humano;
- autorización;
- estado de credencial;
- sesión vigente;
- seguridad del endpoint.

Un dispositivo activo con `last_seen_at = null` no se certifica como físicamente operativo solo por tener fila activa.

#### 63. Línea base remota de schemas

La auditoría read-only del proyecto de referencia observó:

```text
audit       = AUSENTE
api         = AUSENTE
app_private = PRESENTE
```

Consecuencia:

```text
AUTH-DB-014::GLOBAL
no puede ejecutarse hoy sin materializar antes la capa audit aplicable.
```

La ausencia de `api` tampoco autoriza exponer audit mediante `public`.

#### 64. Línea base remota de tablas legacy

Se observaron ocho tablas base relacionadas con dispositivo compartido en `public`:

```text
shared_operational_devices
shared_operational_device_apps
shared_operational_device_actor_sessions
shared_operational_device_events
shared_operational_device_templates
shared_operational_device_template_apps
shared_operational_device_actor_policies
shared_operational_device_template_actor_policies
```

Todas las tablas base consultadas tienen RLS habilitado y `FORCE RLS = false`.

También existen vistas administrativas legacy y varios índices auxiliares.

#### 65. Cardinalidades físicas observadas

| Relación                                            | Filas observadas |
| --------------------------------------------------- | ---------------: |
| `shared_operational_devices`                        |                2 |
| `shared_operational_device_apps`                    |                4 |
| `shared_operational_device_actor_sessions`          |                0 |
| `shared_operational_device_events`                  |                3 |
| `shared_operational_device_templates`               |                6 |
| `shared_operational_device_template_apps`           |               17 |
| `shared_operational_device_actor_policies`          |                2 |
| `shared_operational_device_template_actor_policies` |                7 |

Estas cifras son un snapshot de auditoría remota y no constituyen cardinalidades objetivo.

#### 66. Instancias físicas observadas

Se observaron exactamente dos filas activas:

| device_code          | device_type          | activation_status | default_app | last_seen_at |
| -------------------- | -------------------- | ----------------- | ----------- | ------------ |
| `CAJA_VENTO_CAFE_01` | `pos_terminal`       | `active`          | `pulso`     | `null`       |
| `KIOSCO_BODEGA_CP`   | `warehouse_terminal` | `active`          | `nexo`      | `null`       |

Ambas exigen PIN de actor y turno activo según sus flags actuales.

La fila registral no se eleva a evidencia física validada.

#### 67. Plantillas físicas observadas

El remoto contiene seis plantillas legacy activas:

```text
bar_satellite
management_terminal
pos_satellite
procurement_reception
production_center
warehouse_kiosk
```

El contrato documental aprobado de `AUTH-DEV-001` conserva catorce plantillas objetivo y una plantilla legacy retirada.

Por tanto, la estructura física actual no puede presentarse como cobertura completa. La reconciliación debe ser identidad por identidad y no por conteo o semejanza textual.

#### 68. Eventos legacy observados

`public.shared_operational_device_events` contiene tres eventos:

```text
device.created
device.migrated_from_employee.safe_phase_1
legacy_employee.deactivated
```

Distribución:

```text
device.created                              = 1
device.migrated_from_employee.safe_phase_1 = 1
legacy_employee.deactivated                = 1
```

No existen filas de sesión de actor en `shared_operational_device_actor_sessions`.

#### 69. Brecha de cobertura del ledger legacy

Tres eventos legacy no cubren el lifecycle exigido.

No existe evidencia física suficiente, dentro del ledger observado, para demostrar de forma completa:

- enrolamiento;
- activación;
- suspensión;
- reanudación;
- rotación de credenciales;
- revocación de credenciales;
- reinstalación;
- reemplazo de hardware;
- traslado;
- cambio de área;
- cambio de aplicaciones;
- cambio de paquete;
- cambio de plantilla;
- inicio/cierre/expiración de actor;
- revocación de dispositivo;
- retiro;
- conflictos y resolución.

La ausencia de eventos no prueba que esos hechos nunca ocurrieron.

#### 70. Brecha de ubicación del ledger legacy

La evidencia actual vive en:

```text
public.shared_operational_device_events
```

La arquitectura objetivo exige:

```text
audit.*
```

014 no renombra la tabla actual por inferencia.

La transición futura debe:

1. preservar los tres eventos existentes;
2. clasificar su calidad;
3. migrar o enlazar evidencia mediante una operación versionada;
4. impedir doble autoridad entre ledger legacy y canónico;
5. conservar rollback.

#### 71. Brecha de inmutabilidad física

La tabla legacy observada:

- no tiene trigger propio de inmutabilidad;
- tiene PK e índices por dispositivo/actor y tiempo;
- permite INSERT al rol `authenticated` mediante RLS para su propio dispositivo activo;
- conserva grants de tabla amplios a roles runtime, aunque las policies limiten operaciones efectivas.

El modelo objetivo no permite que un cliente sea escritor directo del ledger canónico de auditoría.

#### 72. Brecha de grants legacy

Las tablas y vistas relacionadas muestran privilegios amplios concedidos a `authenticated` y `service_role` en la capa legacy.

Esto no significa que RLS permita todas las operaciones, pero sí demuestra que:

```text
GRANT DE TABLA
+
RLS LEGACY
```

no debe reutilizarse como diseño del schema `audit`.

La futura materialización parte de `REVOKE ALL`/default deny para roles cliente y concede solo contratos internos exactos.

#### 73. Brecha de funciones privilegiadas

La consulta física identificó once funciones relacionadas con shared-device.

De ellas:

```text
9 = SECURITY DEFINER
2 = funciones validadoras SECURITY INVOKER/triggers
2 = SECURITY DEFINER con PUBLIC/anon EXECUTE observado
```

Las dos exposiciones observadas son:

```text
current_shared_device_can_access_app
shared_device_actor_is_allowed_v1
```

014 no absorbe la corrección autoritativa de esos helpers. Su contrato sí prohíbe que cualquier nueva función del ledger canónico herede esa exposición.

#### 74. Brecha de FK histórica

La tabla legacy de eventos usa varias FK con `ON DELETE SET NULL`, incluidas referencias a dispositivo, actor y sesión técnica.

El ledger canónico debe preservar identidad histórica aun cuando la fuente se retire.

La implementación futura podrá usar:

- IDs inmutables sin FK destructiva;
- snapshots mínimos;
- FK restringida cuando la retención sea compatible;
- links append-only.

Nunca se permitirá que eliminar una fuente borre o vuelva anónima evidencia que debe conservar atribución.

#### 75. Registro canónico de brechas físicas

Se congelan como brechas a reconciliar:

| ID                | Brecha                                                          | Propietario de salida                   |
| ----------------- | --------------------------------------------------------------- | --------------------------------------- |
| `DEV-AUD-GAP-001` | schema `audit` ausente                                          | `AUTH-DB-016::GLOBAL`                   |
| `DEV-AUD-GAP-002` | ledger en `public`                                              | `AUTH-DB-014::GLOBAL` + `AUTH-DB-020`   |
| `DEV-AUD-GAP-003` | solo tres eventos legacy                                        | `AUTH-DB-014` + productores futuros     |
| `DEV-AUD-GAP-004` | cero sesiones de actor persistidas                              | `AUTH-DEV-007` a `AUTH-DEV-013`         |
| `DEV-AUD-GAP-005` | dos dispositivos activos con `last_seen_at = null`              | validación física `AUTH-DEV-014..016`   |
| `DEV-AUD-GAP-006` | seis plantillas físicas frente a catálogo objetivo mayor        | `AUTH-DB-020` + bloque P                |
| `DEV-AUD-GAP-007` | grants legacy amplios                                           | `AUTH-DB-004`, `AUTH-DB-021` y adopción |
| `DEV-AUD-GAP-008` | funciones privilegiadas legacy                                  | `AUTH-DB-003`, `AUTH-DB-034` y adopción |
| `DEV-AUD-GAP-009` | ledger legacy sin contrato canónico de corrección               | `AUTH-DB-014::GLOBAL`                   |
| `DEV-AUD-GAP-010` | no existe evidencia completa de credential/endpoint generations | identidad física futura del dispositivo |

Estas brechas no se marcan como corregidas por documentarlas.

#### 76. Política de migración de evidencia legacy

El proceso de migración usa tres clases:

```text
LEGACY_VERIFIED
LEGACY_PARTIAL
LEGACY_UNVERIFIABLE
```

`LEGACY_VERIFIED`:
- conserva campos comprobables;
- puede materializar un evento canónico importado con referencia de origen.

`LEGACY_PARTIAL`:
- conserva evento importado y señala campos no demostrados;
- no inventa actor, endpoint, credencial o revisión.

`LEGACY_UNVERIFIABLE`:
- se conserva como evidencia legacy enlazada;
- no se promueve a evento canónico afirmativo.

#### 77. Prohibición de fabricar historia

Un backfill no puede inferir que:

```text
fila activa actual
=> DEVICE_ACTIVATED histórico

template_id actual
=> TEMPLATE_BINDING_CHANGED histórico

auth_user_id actual
=> enrolamiento demostrado

last_seen_at null
=> nunca usado

0 actor sessions
=> nunca existió actor humano
```

La historia se materializa solo desde evidencia verificable.

#### 78. Estrategia de cutover

La futura adopción debe declarar una etapa explícita:

```text
LEGACY_READ
CANONICAL_SHADOW_AUDIT
CANONICAL_AUTHORITATIVE_AUDIT
LEGACY_READ_ONLY
LEGACY_RETIRED
```

Reglas:

- no existen dos ledgers autoritativos indefinidamente;
- shadow audit compara sin ser fuente de autorización;
- el cutover fija instante, versión y writer autorizado;
- el legacy queda read-only antes de retiro;
- los tres eventos históricos permanecen accesibles mediante lineage.

#### 79. Dual write controlado

Si una transición exige escribir temporalmente legacy y canónico:

- una única operación orquestadora controla ambas escrituras;
- se usa `correlation_id` común;
- se usa idempotencia común;
- se detecta divergencia;
- el éxito solo se comunica según la clase de compromiso aprobada;
- existe reconciliación;
- la etapa tiene fecha/condición de salida;
- no se deja dual write como arquitectura permanente.

#### 80. Rollback

Rollback de 014 nunca borra evidencia ya confirmada.

La estrategia física deberá distinguir:

```text
ROLLBACK DE CÓDIGO
-> volver a writer anterior si es seguro

ROLLBACK DE EXPOSICIÓN
-> retirar grants/RPC nuevos

ROLLBACK DE CUTOVER
-> volver temporalmente a lectura legacy cuando sea compatible

EVIDENCIA YA ESCRITA
-> se conserva
```

Si una versión nueva escribió hechos válidos, se mantiene su ledger aunque el código retroceda.

#### 81. Retención

La duración de conservación, legal hold, archivado y disposición final depende del gobierno transversal de retención.

014 fija únicamente:

- no borrado ordinario;
- no cascada destructiva;
- correcciones append-only;
- capacidad de particionar/archivar sin perder correlación;
- preservación de IDs y fingerprints.

No inventa una cantidad de años.

#### 82. Índices mínimos

La materialización física evaluará índices sobre:

```text
(device_id, event_sequence)
(device_id, occurred_at desc)
(correlation_id)
(administrative_actor_id, occurred_at desc)
(actor_employee_id, occurred_at desc)
(event_type, occurred_at desc)
(source_operation_id)
(configuration_fingerprint)
(event_fingerprint)
```

No se crea un índice por cada campo JSON.

Los índices se justifican con planes y volumen esperado.

#### 83. Partición y crecimiento

La primera versión puede permanecer no particionada si el volumen lo permite.

Antes de particionar se requiere:

- cardinalidad real;
- tasa de crecimiento;
- patrones de consulta;
- política de retención;
- impacto de índices;
- backup/restore;
- constraints compatibles;
- pruebas de pruning.

Una partición no cambia la identidad del evento.

#### 84. Observabilidad de la infraestructura de auditoría

Métricas mínimas posteriores:

```text
device_audit_write_success
device_audit_write_failure
device_audit_unknown_outcome
device_audit_reconciliation_open
device_audit_reconciliation_age
device_audit_idempotent_replay
device_audit_conflict
device_audit_lag
```

Las métricas no incluyen secretos ni payloads completos.

#### 85. Errores estructurados

Familias mínimas:

```text
DEVICE_AUDIT_INVALID_INPUT
DEVICE_AUDIT_IDENTITY_CONFLICT
DEVICE_AUDIT_STALE_REVISION
DEVICE_AUDIT_NOT_AUTHORIZED
DEVICE_AUDIT_SOURCE_UNAVAILABLE
DEVICE_AUDIT_EXTERNAL_RESULT_UNKNOWN
DEVICE_AUDIT_PERSISTENCE_FAILED
DEVICE_AUDIT_CONTRACT_MISMATCH
DEVICE_AUDIT_LEGACY_UNVERIFIABLE
```

El mensaje público es seguro; el detalle interno queda en evidencia restringida.

#### 86. Fail closed

Ante ambigüedad:

```text
NO EVENTO DE ÉXITO
NO ACTIVACIÓN SUPUESTA
NO ROTACIÓN SUPUESTA
NO REVOCACIÓN SUPUESTA
NO CAMBIO DE ACTOR SUPUESTO
NO MIGRACIÓN SUPUESTA
```

Se registra attempt o caso de reconciliación según corresponda.

#### 87. Manifiesto de implementación futura

La futura migración de `AUTH-DB-014::GLOBAL` deberá declarar al menos:

```text
task_id
instance_id
contract_version
migration_file
source_schema
target_schema
created_objects
changed_grants
changed_functions
legacy_objects
backfill_mode
cutover_mode
rollback_action
test_ids
environment
baseline_fingerprint
evidence
```

El manifiesto se versiona en `vento-shell`.

#### 88. Orden de materialización futura

Orden recomendado:

```text
1. verificar R0 y prerequisitos R1
2. materializar/reconciliar schema audit
3. crear vocabularios y tablas del ledger
4. aplicar constraints
5. aplicar índices mínimos
6. revocar acceso directo
7. crear writers internos endurecidos
8. probar atomicidad e idempotencia
9. importar evidencia legacy verificable
10. comparar legacy/canónico
11. habilitar adapters propietarios
12. ejecutar cutover controlado
13. validar rollback
14. registrar baseline posterior
```

No se ejecuta en esta tarea documental.

#### 89. Dependencias físicas de AUTH-DB-014::GLOBAL

Antes de autorización física debe existir evidencia compatible de:

```text
R0 aplicable verificado
AUTH-DB-016::GLOBAL materializada cuando audit todavía no exista
AUTH-DB-018::GLOBAL cuando la separación de helpers sea necesaria para el writer
AUTH-DB-019::GLOBAL cuando se requiera resolver principal/actor canónico
AUTH-DB-027 disponible
AUTH-DB-028 baseline vigente
AUTH-DB-029 estrategia de backup/rollback disponible
```

Para declarar adopción completa de productores además deben estar disponibles las tareas propietarias de dispositivo y migración correspondientes.

La ausencia de productores futuros no impide crear la infraestructura global, pero sí impide certificar cobertura operacional completa.

#### 90. Pruebas de esquema

La implementación física deberá probar:

1. objetos exactos;
2. PK/UNIQUE;
3. FK o estrategia histórica;
4. checks de vocabulario;
5. no null;
6. event sequence;
7. revision sequence;
8. canonical fingerprints;
9. ausencia de secrets;
10. grants;
11. exposición;
12. RLS/definer boundaries;
13. índices;
14. rollback.

#### 91. Pruebas de inmutabilidad

Casos obligatorios:

```text
authenticated UPDATE event
-> DENY

authenticated DELETE event
-> DENY

authenticated TRUNCATE
-> DENY

writer interno corrige evento existente
-> DENY

correction insert autorizada
-> PASS

borrado de fuente referenciada
-> evidencia histórica preservada
```

#### 92. Pruebas de lifecycle

La suite cubre al menos:

- registrar;
- enrolar;
- activar;
- suspender;
- reanudar;
- rotar credencial;
- revocar credencial;
- reinstalar;
- reemplazar hardware;
- trasladar sede;
- cambiar área;
- cambiar apps;
- cambiar paquete;
- cambiar plantilla;
- iniciar actor;
- cambiar actor;
- expirar actor;
- revocar actor;
- revocar dispositivo;
- retirar;
- conflicto;
- recuperación.

#### 93. Pruebas negativas

Casos:

- ID de dispositivo desconocido;
- endpoint ajeno;
- principal ajeno;
- vínculo de credencial obsoleto;
- revisión stale;
- sede incompatible;
- área cross-site;
- app no canónica;
- permiso fuera de paquete;
- actor no autorizado;
- sesión expirada;
- secreto en payload;
- event type desconocido;
- source version desconocida;
- fingerprint inválido;
- duplicado de idempotencia incompatible.

#### 94. Pruebas de concurrencia

Escenarios:

```text
ROTATE vs ROTATE
REVOKE vs ACTIVATE
RETIRE vs RECOVERY
ACTOR_CHANGE vs ACTOR_CHANGE
SITE_MOVE vs ACTOR_START
PACKAGE_CHANGE vs ACTION
ENDPOINT_REINSTALL vs CREDENTIAL_REVOKE
```

Solo una transición compatible puede confirmar la revisión esperada.

#### 95. Pruebas de fallos externos

Inyectar:

- timeout;
- conexión cortada después de enviar solicitud;
- proveedor responde dos veces;
- proveedor acepta pero respuesta se pierde;
- base falla después del anchor;
- outbox falla;
- retry;
- resultado tardío.

La evidencia nunca presenta `SUCCEEDED` mientras el resultado real sea incierto.

#### 96. Pruebas de migración legacy

La suite fija el snapshot observado:

```text
devices = 2
device_apps = 4
actor_sessions = 0
events = 3
templates = 6
template_apps = 17
actor_policies = 2
template_actor_policies = 7
```

Debe demostrar:

- los tres eventos no se pierden;
- ningún evento nuevo se inventa;
- la clasificación legacy es reproducible;
- la reconciliación no altera IDs fuente;
- el cutover no duplica eventos;
- rollback conserva evidencia.

#### 97. Pruebas de acceso directo

Verificar:

```text
anon -> 0 acceso audit
authenticated -> 0 acceso audit
PUBLIC EXECUTE -> 0 en writers privilegiados
```

Los consumidores autorizados usan únicamente el contrato interno aprobado.

#### 98. Pruebas de search_path

Para cada función privilegiada:

- crear homónimo malicioso en schema accesible;
- variar `search_path`;
- intentar llamada con role cliente;
- intentar referencia no cualificada;
- verificar owner;
- verificar EXECUTE exacto.

El resultado debe permanecer fail closed.

#### 99. Pruebas de minimización

Fixtures con:

- PIN;
- JWT;
- refresh token;
- secret;
- passkey material;
- Authorization header;
- correo;
- teléfono.

La prueba falla si cualquiera aparece en:

```text
event_payload
attempt snapshots
logs de writer
errores públicos
evidence export
```

#### 100. Pruebas de fingerprints

Validar:

- misma semántica -> mismo fingerprint;
- orden distinto de set -> mismo fingerprint;
- cambio de valor material -> fingerprint distinto;
- timestamp de escritura distinto -> mismo fingerprint semántico;
- `null` vs ausencia conforme al contrato;
- Unicode canonicalizado conforme a versión;
- campos secretos excluidos.

#### 101. Criterios de cierre físico futuro

`AUTH-DB-014::GLOBAL` solo puede declararse `VERIFIED` cuando:

1. existe `audit`;
2. existen los seis objetos del contrato;
3. el acceso cliente directo es cero;
4. writers internos están endurecidos;
5. la inmutabilidad está demostrada;
6. la importación legacy está reconciliada;
7. los tres eventos actuales están preservados;
8. no se inventó historia;
9. idempotencia y concurrencia pasan;
10. rollback pasa;
11. baseline posterior está registrado;
12. los gaps propiedad de 014 están cerrados o clasificados con dueño externo.

#### 102. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

Justificación:

- el lifecycle completo del dispositivo ya está cubierto por requisitos canónicos vigentes;
- la identidad, endpoint, principal, credencial, sede, área, aplicaciones y techo ya poseen cobertura específica;
- la atribución entre dispositivo y trabajador ya posee cobertura;
- la auditoría transversal ya posee cobertura;
- esta tarea materializa el contrato de persistencia de esa evidencia sin introducir una regla de negocio nueva.

```text
Requisitos creados: 0
Requisitos modificados: 0
Requisitos diferidos: 0
Requisitos obsoletos: 0
```

#### 103. Cobertura de prueba vigente reutilizada

La tarea reutiliza, sin modificarlos:

- `TREQ-AUTH-003`, para ciclo auditable de creación, activación, uso, cambio de actor, expiración, suspensión, revocación, rotación y retiro;
- `TREQ-AUTH-011`, para atribución de dispositivo, principal y actor;
- `TREQ-AUTH-015`, para evidencia correlacionable de decisiones y acciones;
- `TREQ-AUTH-020` a `TREQ-AUTH-029`, para identidad, endpoint, principal, credencial, reemplazo y conflictos;
- `TREQ-AUTH-030` a `TREQ-AUTH-038`, para sede fija y traslados;
- `TREQ-AUTH-039` a `TREQ-AUTH-048`, para política de área;
- `TREQ-AUTH-049` a `TREQ-AUTH-058`, para aplicaciones;
- `TREQ-AUTH-059` a `TREQ-AUTH-068`, para paquete máximo, cambios e invalidación.

Esta lista es trazabilidad heredada, no actualización del registro 04A.

#### 104. Criterios de aceptación

- [x] Se definió una única instancia global `AUTH-DB-014::GLOBAL`.
- [x] Se preservó el gate `PRE_E5_FOUNDATION`.
- [x] Se exige la capa `audit`.
- [x] Se separó fuente vigente de evidencia histórica.
- [x] Se separaron dispositivo, endpoint, principal, credencial, activo, estación y actor.
- [x] Se definieron seis objetos de auditoría.
- [x] Se definieron revisiones y fingerprints.
- [x] Se definió vocabulario de lifecycle.
- [x] Se cubrieron enrolamiento, activación, suspensión, rotación, revocación y retiro.
- [x] Se cubrieron cambios de sede, área, apps, paquetes y plantilla.
- [x] Se cubrieron sesiones y cambios de actor.
- [x] Se definieron attempts y unknown outcome.
- [x] Se definió idempotencia.
- [x] Se definió concurrencia.
- [x] Se definió atomicidad local.
- [x] Se definió durable-before-ack para efectos externos.
- [x] Se definieron links y correcciones append-only.
- [x] Se prohibieron secretos.
- [x] Se prohibió acceso directo cliente al ledger objetivo.
- [x] Se definió endurecimiento de funciones privilegiadas.
- [x] Se distinguió telemetría de auditoría.
- [x] Se auditó el remoto sin escrituras.
- [x] Se preservaron las dos instancias observadas como registrales no verificadas.
- [x] Se preservó que ambas tienen `last_seen_at = null`.
- [x] Se preservaron seis plantillas legacy observadas.
- [x] Se preservaron tres eventos legacy.
- [x] Se preservó que existen cero sesiones de actor.
- [x] Se congeló un registro de brechas.
- [x] Se prohibió fabricar historia durante backfill.
- [x] Se definió cutover y dual-write controlado.
- [x] Se definió rollback sin borrar evidencia.
- [x] Se definieron pruebas de esquema, seguridad, concurrencia y migración.
- [x] Se justificaron cero cambios 04A.
- [x] No se ejecutó SQL mutante.
- [x] No se creó migration.
- [x] No se cambió Supabase.
- [x] No se inició `AUTH-DB-020`.

#### 105. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                                                                                                                                 |
| --------- | -------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | El carril documental no creó build, migration, SQL, código runtime ni artefactos de despliegue.                                                                                                                                                           |
| LOCAL     | NOT_EXECUTED   | El artefacto todavía debe insertarse y validarse en el checkout actualizado del usuario mediante el workflow documental.                                                                                                                                  |
| REMOTA    | PASS           | `main` confirma `AUTH-DB-013` aprobado, `AUTH-DB-014` como marcador actual, topología `GLOBAL_ENABLE_ONCE`; lectura read-only de Supabase confirmó schemas, tablas, cardinalidades, dispositivos, plantillas, eventos, RLS, grants y funciones descritos. |
| OPERATIVA | NOT_APPLICABLE | No se cambió comportamiento de tablets, kioscos, terminales, actor sessions, PIN, navegación ni aplicaciones.                                                                                                                                             |
| FÍSICA    | NOT_APPLICABLE | No se ejecutó DDL/DML mutante, no se modificaron dispositivos, credenciales, sesiones, grants ni funciones.                                                                                                                                               |

#### 106. Decisiones vinculantes

1. `AUTH-DB-014` es documental.
2. La futura instancia es `AUTH-DB-014::GLOBAL`.
3. El modo es `GLOBAL_ENABLE_ONCE`.
4. El gate es `PRE_E5_FOUNDATION`.
5. Requiere `audit`.
6. El ledger objetivo usa seis objetos.
7. El ledger es append-only.
8. Los roles cliente tienen cero acceso directo.
9. El dispositivo no es actor humano.
10. El principal técnico no es autoridad empresarial.
11. Una credencial nunca se persiste en audit.
12. Cada cambio material produce revisión.
13. Un hecho confirmado y un intento fallido son clases distintas.
14. Unknown outcome no se presenta como éxito.
15. La causalidad es por dispositivo, no por timestamp global.
16. La migración legacy no inventa historia.
17. Los tres eventos existentes deben preservarse.
18. Cero sesiones no se interpreta como conformidad.
19. `last_seen_at = null` no prueba inactividad ni operación.
20. Las seis plantillas físicas no sustituyen el catálogo documental objetivo.
21. 014 no migra tablas de dominio.
22. 014 no implementa el bloque P.
23. 014 no absorbe 012, 013, 032, 035 ni 020.
24. 04A no cambia.

#### 107. Límites

`AUTH-DB-014` no:

- ejecuta `AUTH-DB-014::GLOBAL`;
- crea el schema `audit` en este carril;
- crea migrations;
- ejecuta SQL mutante;
- mueve `public.shared_operational_devices`;
- mueve `public.shared_operational_device_events`;
- modifica los dos dispositivos actuales;
- crea sesiones de actor;
- rota credenciales;
- revoca dispositivos;
- cambia plantillas;
- cambia sede o área;
- cambia aplicaciones;
- cambia permisos;
- corrige las funciones legacy;
- cambia grants o RLS;
- implementa `AUTH-DEV-007..016`;
- implementa `AUTH-DB-020`;
- crea un outbox alternativo;
- crea una UI de auditoría;
- define retención legal definitiva;
- certifica equipos físicos.

#### 108. Handoff exacto a AUTH-DB-020

`AUTH-DB-020 — Migrar objetos por dominio con compatibilidad temporal` recibe de 014:

1. schema objetivo de auditoría ya definido;
2. objetos del ledger y sus identidades;
3. vocabulario de lifecycle;
4. reglas de revisión y fingerprints;
5. clasificación de evidencia legacy;
6. snapshot de ocho tablas legacy;
7. snapshot de cardinalidades;
8. tres eventos existentes que no pueden perderse;
9. reglas de cutover;
10. reglas de dual write temporal;
11. prohibición de fabricar historia;
12. gaps que requieren adopción por writer;
13. política de rollback;
14. default deny para acceso cliente.

020 no deberá rediseñar el contrato de auditoría para cada dominio.

Regla de auditoría

AUTH-DB-012 a AUTH-DB-014 solo podrán ejecutarse después de crear
la capa o esquema transversal de auditoría aprobado en SUPA-ARC-007.

No deberán crear mecanismos de auditoría independientes dentro de cada
aplicación o dominio.

---

#### 109. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-DB-013 — Implementar auditoría de simulación`

**TAREA ACTUAL APROBADA**
`AUTH-DB-014 — Implementar auditoría de dispositivos`

**SIGUIENTE TAREA RESERVADA**
`AUTH-DB-020 — Migrar objetos por dominio con compatibilidad temporal`
