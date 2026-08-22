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
