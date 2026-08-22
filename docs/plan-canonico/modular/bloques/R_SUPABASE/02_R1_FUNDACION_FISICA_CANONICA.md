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


### [ ] AUTH-DB-017 — Configurar esquemas expuestos y privilegios de Data API
### [ ] AUTH-DB-019 — Implementar vínculos canónicos entre Auth e identidades empresariales

### [ ] AUTH-DB-033 — Implementar get_access_context canónico, sus resolvers privados y su proyección segura
### [ ] AUTH-DB-035 — Implementar token transaccional de frescura e invalidación del contexto
### [ ] AUTH-DB-034 — Implementar evaluate_authorization canónico, su núcleo de evaluación, resolvers de recurso y proyecciones seguras
### [ ] AUTH-DB-032 — Implementar persistencia canónica y vinculación de decisiones de autorización

### [ ] AUTH-DB-012 — Implementar auditoría de cambios de permisos
### [ ] AUTH-DB-013 — Implementar auditoría de simulación
### [ ] AUTH-DB-014 — Implementar auditoría de dispositivos

Regla de auditoría

AUTH-DB-012 a AUTH-DB-014 solo podrán ejecutarse después de crear
la capa o esquema transversal de auditoría aprobado en SUPA-ARC-007.

No deberán crear mecanismos de auditoría independientes dentro de cada
aplicación o dominio.
