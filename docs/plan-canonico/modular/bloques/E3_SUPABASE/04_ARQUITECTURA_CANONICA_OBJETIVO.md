### ARQUITECTURA CANÓNICA OBJETIVO

Criterios obligatorios de evaluación

Toda decisión de arquitectura deberá evaluarse, como mínimo, contra:

- propiedad de la fuente de verdad;
- estabilidad del dominio empresarial;
- consumidores actuales y futuros;
- exposición mediante Data API;
- seguridad, RLS y grants;
- compatibilidad temporal;
- rendimiento y crecimiento;
- auditoría y trazabilidad;
- capacidad de rollback;
- reproducibilidad desde `vento-shell`.

Estos criterios deberán aplicarse desde SUPA-ARC-001 y consolidarse
formalmente en SUPA-ARC-025 mediante una ADR aprobada.

### ✅ SUPA-ARC-001 — Definir principios de separación entre esquemas administrados y empresariales

**Estado:** APROBADA
**Fecha de preparación documental:** 2026-07-29
**Bloque propietario:** BLOQUE E3 — Arquitectura canónica de datos y gobierno integral de Supabase
**Tarea anterior:** `SUPA-AUD-024 — Clasificar riesgos críticos, altos, medios y deuda técnica` — APROBADA
**Siguiente tarea:** `SUPA-ARC-002 — Definir dominios empresariales estables`
**Proyecto de referencia:** `vento-os-dev` — `clzdpinthhtknkmefsxx`
**Repositorio canónico:** `devVentoGroup/vento-shell` — rama `main`; commit remoto observado `2653dc7d547fce24255bebd120bfa8274b5918aa`
**Tipo de tarea:** definición normativa de arquitectura objetivo; sin DDL, DML, migraciones, cambios en Supabase, movimiento de objetos, cambios de exposición, grants, RLS, Auth, Storage, Realtime, Edge Functions, cron, extensiones, secretos, backfills, despliegues ni retiros

#### 1. Objetivo

Establecer los principios obligatorios que separan la infraestructura administrada por PostgreSQL o Supabase de los esquemas y objetos gobernados por Vento, de modo que las tareas posteriores puedan definir dominios, fuentes de verdad, capas públicas y privadas, seguridad, integraciones y transición sin apropiarse de estructuras de plataforma ni convertir la distribución actual en arquitectura objetivo por inercia.

```text
23 ESQUEMAS NO EFÍMEROS AUDITADOS
        ↓
14 ADMINISTRADOS POR SUPABASE / POSTGRESQL / EXTENSIONES
+ 9 GOBERNADOS POR VENTO
        ↓
PRINCIPIOS DE SEPARACIÓN Y DEPENDENCIA
        ↓
FRONTERAS PARA SUPA-ARC-002 A SUPA-ARC-025
        ↓
TRANSICIÓN POSTERIOR SIN CAMBIOS FÍSICOS PREMATUROS
```

Esta tarea define cómo interpretar y proteger las fronteras. No decide todavía los dominios empresariales estables, el esquema propietario de cada fuente, la función futura de `public`, los nombres objetivo ni el destino de cada objeto.

#### 2. Artefacto producido

```text
SUPABASE-SCHEMA-SEPARATION-PRINCIPLES-001@1.0.0
```

| Propiedad                       | Valor                          |
| ------------------------------- | ------------------------------ |
| `current_schema_count`          | **23** esquemas no efímeros    |
| `managed_schema_count`          | **14**                         |
| `vento_governed_schema_count`   | **9**                          |
| `unclassified_schema_count`     | **0**                          |
| `separation_principle_count`    | **24**                         |
| `schema_boundary_rows`          | **23**                         |
| `target_domain_decisions`       | reservadas para `SUPA-ARC-002` |
| `target_owner_schema_decisions` | reservadas para `SUPA-ARC-003` |
| `public_target_decision`        | reservada para `SUPA-ARC-004`  |
| `physical_changes_authorized`   | **0**                          |

#### 3. Fuentes canónicas consumidas

| Fuente                                          | Uso en esta tarea                                                                     |
| ----------------------------------------------- | ------------------------------------------------------------------------------------- |
| `SUPABASE-SCHEMA-CLASSIFICATION-001@1.0.0`      | clasificación vigente de los 23 esquemas                                              |
| `SUPABASE-CONSOLIDATED-RISK-REGISTER-001@1.0.0` | riesgos que la separación deberá restringir                                           |
| `SUPABASE-OBJECT-BUSINESS-MAP-001@1.0.0`        | objetos, capacidades, propietarios y consumidores actuales                            |
| `SUPABASE-PROCESS-TECHNICAL-MAP-001@1.0.0`      | procesos, datos, RPC, eventos y aplicaciones                                          |
| `PROC-APPLICATION-OWNERSHIP-REGISTRY-001`       | propiedad funcional de los 69 procesos                                                |
| `PROC-APPLICATION-CONSUMER-REGISTRY-001`        | consumidoras directas y condicionales                                                 |
| `01_PRINCIPIOS_OBLIGATORIOS.md` de E3           | Supabase como plataforma; esquema como frontera; dominio como responsabilidad estable |
| documentación oficial vigente de Supabase       | Data API, schemas dedicados, grants, RLS, vistas y superficies soportadas             |

La documentación oficial vigente confirma que la exposición mediante Data API se controla mediante schemas expuestos, grants y RLS; que un schema dedicado puede delimitar la API; y que la creación de tablas nuevas está avanzando hacia exposición explícita en lugar de concesión automática. Estos cambios de plataforma refuerzan la separación, pero no sustituyen las decisiones empresariales del plan.

#### 4. Clasificación congelada recibida

##### 4.1. Esquemas administrados por PostgreSQL, Supabase o extensiones

```text
pg_catalog
pg_toast
information_schema
auth
realtime
storage
cron
net
vault
extensions
graphql
graphql_public
pgbouncer
supabase_migrations
```

##### 4.2. Esquemas gobernados por Vento

```text
app_private
club
pass
payments
pos
public
talento
viso
vital
```

La clasificación describe quién administra la frontera estructural actual. No declara que los nueve schemas de Vento deban conservar su nombre, alcance o distribución en la arquitectura objetivo.

#### 5. Distinciones normativas

| Concepto                          | Definición                                                                                                                       | Consecuencia                                                                                                                   |
| --------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| esquema administrado              | namespace cuya estructura y ciclo interno pertenecen al motor, a Supabase, al CLI o a una extensión                              | Vento configura su uso mediante superficies soportadas, pero no lo convierte en dominio ni modifica sus internals como propios |
| esquema gobernado por Vento       | namespace cuyos objetos empresariales o técnicos fueron creados y evolucionan bajo control de `vento-shell`                      | toda evolución deberá ser versionada, revisable y trazable por Vento                                                           |
| objeto administrado               | tabla, función, vista, tipo o metadata cuyo ciclo pertenece a la plataforma o extensión                                          | no se adopta como fuente empresarial ni se recrea manualmente fuera del contrato soportado                                     |
| artefacto de integración de Vento | política, grant, publicación, job, trigger permitido, configuración o referencia creada por Vento sobre una superficie soportada | permanece gobernado por Vento aunque se adjunte a un objeto administrado; requiere migración, propietario, prueba y rollback   |
| dominio empresarial               | responsabilidad estable derivada de capacidades y procesos                                                                       | se define en `SUPA-ARC-002`; no nace del nombre del schema                                                                     |
| aplicación                        | experiencia propietaria o consumidora                                                                                            | no obtiene un schema automáticamente y no define la frontera de datos por sí sola                                              |
| exposición                        | posibilidad de acceso mediante Data API, GraphQL, conexión o servicio                                                            | se decide separadamente de la administración del schema                                                                        |
| propiedad funcional               | aplicación o dominio responsable del resultado empresarial                                                                       | no se infiere desde owner PostgreSQL, ubicación, FK, trigger, grant ni consumidor técnico                                      |

#### 6. Principios canónicos de separación

| ID        | Principio                                | Regla obligatoria                                                                                                                                                  | Riesgo restringido                                         |
| --------- | ---------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------- |
| `SEP-001` | clasificación única                      | Cada schema no efímero tendrá exactamente una clase primaria vigente: administrado o gobernado por Vento.                                                          | reclasificación arbitraria y objetos sin frontera          |
| `SEP-002` | plataforma no es dominio                 | Un schema administrado nunca representará por sí mismo un dominio, proceso o aplicación de Vento.                                                                  | dependencia de internals y propiedad empresarial falsa     |
| `SEP-003` | gobierno Vento versionado                | Los schemas y artefactos gobernados por Vento evolucionarán exclusivamente mediante fuentes versionadas y revisables en `vento-shell`.                             | drift y reconstrucción incompleta                          |
| `SEP-004` | ubicación no concede propiedad           | La ubicación física de una tabla, función, vista o política no determina su propietaria funcional.                                                                 | fuentes de verdad competidoras                             |
| `SEP-005` | exposición independiente                 | Ser Vento no implica estar expuesto; ser administrado no autoriza acceso directo. Exposición, grants y RLS son decisiones separadas.                               | acceso lateral y superficie accidental                     |
| `SEP-006` | denegación por defecto                   | Toda superficie nueva permanecerá no expuesta y sin privilegios cliente hasta que un contrato aprobado conceda acceso mínimo.                                      | publicación accidental y privilegio excesivo               |
| `SEP-007` | `public` no es destino universal         | Ningún objeto se ubicará en `public` por omisión arquitectónica. Su función objetivo se decidirá en `SUPA-ARC-004`.                                                | concentración de capacidades y acoplamiento                |
| `SEP-008` | privado no equivale a administrado       | `app_private` es una frontera privada gobernada por Vento; su privacidad no transfiere su administración a Supabase.                                               | secretos o helpers sin propietario Vento                   |
| `SEP-009` | internals no son fuente empresarial      | Metadata de Auth, Storage, Realtime, cron, red, Vault, migraciones o extensiones no sustituirá registros empresariales gobernados por Vento.                       | dependencia de internals y pérdida de contexto empresarial |
| `SEP-010` | identidad técnica separada               | `auth.users` y sus internals identifican sesión técnica; trabajador, cliente, dispositivo y actor de sistema se vinculan mediante registros de Vento.              | identidad laboral o comercial falsa                        |
| `SEP-011` | archivo separado de metadata empresarial | `storage.objects` administra objetos físicos; clasificación, expediente, proceso, retención y evidencia empresarial se gobiernan fuera del schema administrado.    | documentos huérfanos y privacidad inconsistente            |
| `SEP-012` | evento separado de transporte            | Realtime y sus internals transportan señales; no son el registro canónico del evento empresarial ni del proceso.                                                   | sincronización sin fuente y replay imposible               |
| `SEP-013` | automatización separada del resultado    | cron, `net`, Edge o workers ejecutan o transportan trabajo; el hecho empresarial confirmado permanece en la fuente de Vento.                                       | falso éxito y efectos perdidos                             |
| `SEP-014` | secretos mediante superficie soportada   | Vault y mecanismos oficiales podrán custodiar secretos; no se crearán catálogos empresariales ni dependencias directas de sus tablas internas.                     | exposición y rotación incompleta                           |
| `SEP-015` | extensiones como capacidad técnica       | `extensions` aloja objetos de extensiones; habilitar una extensión no crea un dominio ni autoriza objetos empresariales en ese schema.                             | namespace contaminado y ciclo incierto                     |
| `SEP-016` | GraphQL como superficie opcional         | `graphql` y `graphql_public` permanecen fronteras de plataforma incluso inactivas; activarlas no transfiere propiedad de los datos reflejados.                     | exposición inferida y contratos duplicados                 |
| `SEP-017` | puntos de extensión soportados           | Vento solo añadirá artefactos sobre schemas administrados cuando la plataforma documente esa extensión y exista compatibilidad, prueba, rollback y propietario.    | rotura por upgrades y customizaciones frágiles             |
| `SEP-018` | acceso mediante contrato                 | Clientes y aplicaciones usarán APIs oficiales, proyecciones, RPC o adaptadores aprobados; no consultarán internals administrados por conveniencia.                 | dependencia no soportada y bypass de autorización          |
| `SEP-019` | referencias mínimas y estables           | Una referencia hacia un schema administrado se limitará a identificadores o contratos estables necesarios; no copiará su modelo interno como autoridad.            | acoplamiento estructural y drift                           |
| `SEP-020` | dependencia no transfiere autoridad      | FK, trigger, función, grant, publicación o consumo entre schemas no cambia la propiedad funcional de ninguno de los lados.                                         | propiedad inferida y escritura cruzada                     |
| `SEP-021` | cambios compatibles con plataforma       | Toda personalización de una superficie administrada deberá superar pruebas de upgrade, paridad local-remoto y recuperación.                                        | incompatibilidad de versión y entorno irreproducible       |
| `SEP-022` | no mover antes de mapear                 | Ningún objeto se moverá, renombrará, dividirá o retirará antes de identificar consumidores, escrituras, seguridad, datos, compatibilidad y rollback.               | transición destructiva                                     |
| `SEP-023` | excepción explícita y temporal           | Toda excepción tendrá decisión, alcance, propietario, riesgo, vencimiento, evidencia, prueba y estrategia de salida; no podrá convertirse en precedente implícito. | deuda permanente y bypass silencioso                       |
| `SEP-024` | verificación recurrente                  | Clasificación, exposición, dependencias y excepciones deberán poder validarse automáticamente contra remoto, migraciones y contratos.                              | drift documental y regresión                               |

#### 7. Reglas para esquemas administrados

1. No crear tablas empresariales, ledgers, maestros, procesos ni catálogos de Vento dentro de un schema administrado.
2. No renombrar, mover, fusionar, eliminar ni reconstruir manualmente estructuras internas administradas.
3. No usar owner PostgreSQL, acceso de `postgres` o `service_role` como autorización para alterar internals.
4. No conceder acceso cliente directo a tablas internas por conveniencia.
5. Usar únicamente superficies públicas y documentadas: APIs, funciones, configuración, políticas o comandos soportados.
6. Versionar en `vento-shell` toda configuración o artefacto de integración creado por Vento, aun cuando se materialice sobre una superficie administrada.
7. Separar la evidencia del artefacto Vento de la estructura administrada a la que se adjunta.
8. Probar compatibilidad con la versión administrada y conservar rollback o retiro seguro.
9. No persistir la única copia de un hecho empresarial dentro de metadata administrada.
10. Tratar cambios de plataforma como dependencias externas que exigen evaluación de impacto y no como migraciones de dominio.

#### 8. Reglas para esquemas gobernados por Vento

1. Toda creación, cambio o retiro se materializará mediante migraciones y configuración versionadas en `vento-shell`.
2. Cada objeto deberá resolver a capacidad, proceso, propietario funcional, escritores y consumidores.
3. Ningún schema actual se conserva por su nombre sin superar `SUPA-ARC-002`, `SUPA-ARC-003` y la transición correspondiente.
4. Un schema de Vento podrá ser privado, interno, expuesto o de compatibilidad; esas modalidades no cambian su administración primaria.
5. La exposición se concederá por contrato y mínimo privilegio, no por pertenecer a `public` ni por usar `supabase-js`.
6. Las aplicaciones no recibirán schemas propios por defecto; la separación seguirá dominios estables y fuentes de verdad.
7. Las escrituras entre dominios usarán comandos o contratos aprobados; no se autoriza una malla de DML cruzado por compartir proyecto.
8. Todo objeto legacy conservará compatibilidad y trazabilidad hasta completar adopción, paridad y rollback.
9. Los schemas Vento deberán poder reconstruirse desde fuentes versionadas sin depender de DDL manual remoto.
10. La coexistencia en un mismo proyecto no elimina la frontera entre productos, dominios, datos sensibles o ciclos de despliegue.

#### 9. Matriz completa de frontera actual

| Schema                | Clase actual                     | Subclase recibida                    | Tratamiento obligatorio desde esta tarea                            | Interacción de Vento permitida                             | Acción prohibida                                                       | Decisión posterior propietaria                     |
| --------------------- | -------------------------------- | ------------------------------------ | ------------------------------------------------------------------- | ---------------------------------------------------------- | ---------------------------------------------------------------------- | -------------------------------------------------- |
| `pg_catalog`          | `ADMINISTRADO_SUPABASE_POSTGRES` | `POSTGRES_CORE_MANAGED`              | conservar como catálogo interno del motor                           | lectura de catálogo para auditoría y tooling autorizado    | alterar objetos internos o almacenar datos Vento                       | plataforma PostgreSQL; controles en `SUPA-ARC-024` |
| `pg_toast`            | `ADMINISTRADO_SUPABASE_POSTGRES` | `POSTGRES_CORE_MANAGED`              | conservar como almacenamiento interno                               | ninguna dependencia empresarial directa                    | consulta o modificación como contrato de aplicación                    | plataforma PostgreSQL                              |
| `information_schema`  | `ADMINISTRADO_SUPABASE_POSTGRES` | `POSTGRES_SQL_STANDARD_MANAGED`      | usar solo para introspección estándar                               | auditoría y validadores                                    | tratar metadata como fuente empresarial                                | tooling y `SUPA-ARC-024`                           |
| `auth`                | `ADMINISTRADO_SUPABASE_POSTGRES` | `SUPABASE_PRODUCT_MANAGED`           | conservar como frontera técnica de autenticación                    | APIs Auth y puntos soportados de vinculación               | catálogo laboral, comercial o de autorización empresarial              | `SUPA-ARC-008` a `SUPA-ARC-010`                    |
| `realtime`            | `ADMINISTRADO_SUPABASE_POSTGRES` | `SUPABASE_PRODUCT_MANAGED`           | conservar como infraestructura de transporte                        | configuración y políticas soportadas                       | registro canónico de eventos o procesos                                | `SUPA-ARC-019`                                     |
| `storage`             | `ADMINISTRADO_SUPABASE_POSTGRES` | `SUPABASE_PRODUCT_MANAGED`           | conservar como infraestructura de objetos                           | buckets, políticas y APIs soportadas                       | expediente, retención o evidencia empresarial solo en metadata interna | `SUPA-ARC-018`; `SUPA-ARC-022`                     |
| `cron`                | `ADMINISTRADO_SUPABASE_POSTGRES` | `SUPABASE_EXTENSION_MANAGED`         | conservar bajo ciclo de `pg_cron`                                   | programación mediante superficies soportadas y versionadas | DML directo sobre internals o resultado empresarial en job metadata    | `SUPA-ARC-020`                                     |
| `net`                 | `ADMINISTRADO_SUPABASE_POSTGRES` | `SUPABASE_EXTENSION_MANAGED`         | conservar como transporte HTTP técnico                              | invocación server-only aprobada                            | exposición cliente, cola empresarial o historial canónico              | `SUPA-ARC-020`                                     |
| `vault`               | `ADMINISTRADO_SUPABASE_POSTGRES` | `SUPABASE_EXTENSION_MANAGED`         | conservar como servicio administrado de secretos                    | operaciones soportadas con mínimo privilegio               | catálogo empresarial o lectura cliente                                 | `SUPA-ARC-006`; `SUPA-ARC-020`                     |
| `extensions`          | `ADMINISTRADO_SUPABASE_POSTGRES` | `SUPABASE_EXTENSION_CONTAINER`       | reservar para extensiones                                           | instalación y configuración versionadas                    | tablas, vistas o funciones empresariales de Vento                      | `SUPA-ARC-006`; `SUPA-ARC-011`                     |
| `graphql`             | `ADMINISTRADO_SUPABASE_POSTGRES` | `SUPABASE_PLATFORM_RESERVED_DORMANT` | preservar aunque permanezca inactivo                                | configuración soportada si se aprueba GraphQL              | reutilizar el schema como dominio                                      | `SUPA-ARC-005`; `SUPA-ARC-015`                     |
| `graphql_public`      | `ADMINISTRADO_SUPABASE_POSTGRES` | `SUPABASE_PLATFORM_RESERVED_DORMANT` | preservar como frontera reservada                                   | configuración soportada si se aprueba                      | objetos empresariales por estar vacío                                  | `SUPA-ARC-005`; `SUPA-ARC-015`                     |
| `pgbouncer`           | `ADMINISTRADO_SUPABASE_POSTGRES` | `SUPABASE_INFRASTRUCTURE_MANAGED`    | conservar como infraestructura de pooling                           | configuración de conexión soportada                        | dependencia de datos o dominio                                         | `SUPA-ARC-024`                                     |
| `supabase_migrations` | `ADMINISTRADO_SUPABASE_POSTGRES` | `SUPABASE_CLI_MANAGED`               | conservar como historial técnico del CLI                            | lectura y conciliación mediante CLI y validadores          | usar como manifiesto empresarial suficiente o editar historia          | `SUPA-ARC-024`; `SUPA-TRANS-013`                   |
| `app_private`         | `GOBERNADO_VENTO`                | `VENTO_PRIVATE_TECHNICAL`            | preservar como frontera privada actual hasta decisión objetivo      | helpers y datos técnicos server-only versionados           | exposición Data API o secreto accesible a clientes                     | `SUPA-ARC-006`                                     |
| `club`                | `GOBERNADO_VENTO`                | `VENTO_DOMAIN_SCHEMA`                | conservar temporalmente sin certificar dominio objetivo             | evolución versionada y consumo contractual                 | asumir que nombre de producto equivale a dominio final                 | `SUPA-ARC-002`; `SUPA-ARC-003`                     |
| `pass`                | `GOBERNADO_VENTO`                | `VENTO_DOMAIN_SCHEMA`                | conservar temporalmente sin certificar dominio objetivo             | evolución versionada y consumo contractual                 | apropiarse de venta, pago o catálogo por coexistencia                  | `SUPA-ARC-002`; `SUPA-ARC-003`                     |
| `payments`            | `GOBERNADO_VENTO`                | `VENTO_DOMAIN_SCHEMA`                | conservar temporalmente como capacidad actual                       | evolución versionada y contratos server-side               | convertir schema técnico en propietaria funcional de pagos             | `SUPA-ARC-002`; `SUPA-ARC-003`; `SUPA-ARC-016`     |
| `pos`                 | `GOBERNADO_VENTO`                | `VENTO_DOMAIN_SCHEMA`                | conservar temporalmente sin certificar dominio objetivo             | evolución versionada y consumo contractual                 | asumir que todo PULSO debe residir aquí                                | `SUPA-ARC-002`; `SUPA-ARC-003`                     |
| `public`              | `GOBERNADO_VENTO`                | `VENTO_SHARED_STANDARD_CONTAINER`    | congelar como contenedor actual multi-capacidad                     | mantener compatibilidad mientras se diseña destino         | seguir usándolo como destino universal o inferir exposición            | `SUPA-ARC-002` a `SUPA-ARC-005`                    |
| `talento`             | `GOBERNADO_VENTO`                | `VENTO_DOMAIN_SCHEMA`                | conservar como producto o capacidad futura separada                 | evolución versionada y handoff controlado                  | convertir candidato en trabajador o autoridad Auth por ubicación       | `SUPA-ARC-002`; `SUPA-ARC-003`; `SUPA-ARC-008`     |
| `viso`                | `GOBERNADO_VENTO`                | `VENTO_DOMAIN_SCHEMA`                | conservar temporalmente sin certificar dominio objetivo             | evolución versionada y consumo contractual                 | concentrar todos los procesos administrativos por conveniencia         | `SUPA-ARC-002`; `SUPA-ARC-003`                     |
| `vital`               | `GOBERNADO_VENTO`                | `VENTO_DOMAIN_SCHEMA`                | reconocer como producto Vento distinto que comparte proyecto actual | evolución versionada mientras se decide aislamiento        | mezclar contratos, tipos o propiedad con Vento OS por coexistencia     | `SUPA-ARC-002`; `SUPA-ARC-003`; `SUPA-ARC-024`     |

#### 10. Fronteras específicas de servicios administrados

##### 10.1. Auth

- `auth.users` conserva el identificador técnico de autenticación.
- El vínculo con trabajador, cliente, candidato, dispositivo o actor se materializa en schemas Vento.
- Roles, permisos, sede, área, turno, check-in y simulación no se gobiernan desde `user_metadata` ni desde la estructura interna de Auth.
- Los triggers o hooks permitidos deberán ser mínimos, idempotentes, versionados y resistentes a reintento.

##### 10.2. Storage

- El bucket y el objeto físico pertenecen al servicio administrado.
- El expediente, clasificación, proceso, propietario, retención, legal hold y evidencia pertenecen a un dominio Vento.
- Una ruta de Storage no será clave empresarial primaria ni autorización suficiente.
- Las políticas sobre `storage.objects` serán artefactos Vento versionados sobre una superficie administrada.

##### 10.3. Realtime

- La publicación o canal no convierte una tabla en evento empresarial.
- El consumidor no adquiere propiedad por suscribirse.
- La arquitectura de outbox, replay, orden, deduplicación y dead-letter se definirá en `SUPA-ARC-019`.
- Las tablas administradas de Realtime no conservarán la única evidencia del hecho.

##### 10.4. Cron, red y automatización

- Un job o request técnico no demuestra que el efecto empresarial ocurrió.
- La programación se conserva como configuración versionada de Vento sobre un servicio administrado.
- El resultado, la idempotencia y la conciliación residen en fuentes de Vento.
- Secretos y headers no se incrustarán como datos ordinarios del catálogo administrado.

##### 10.5. Extensiones y GraphQL

- La selección de extensiones es una decisión técnica gobernada por Vento, pero sus internals siguen administrados.
- Los objetos instalados por una extensión no se copiarán ni modificarán como si fueran código de dominio.
- GraphQL, si se activa, será otra superficie de los mismos datos y permisos; no una fuente paralela.
- La introspección, exposición y privilegios se gobernarán explícitamente en `SUPA-ARC-005` y `SUPA-ARC-015`.

#### 11. Exposición y seguridad independientes de la clasificación

La evaluación de acceso seguirá este orden:

```text
CLASE DEL SCHEMA
        ↓
¿DEBE EXISTIR UNA SUPERFICIE DE API?
        ↓
SCHEMA / OBJETO EXPUESTO EXPLÍCITAMENTE
        ↓
GRANTS MÍNIMOS POR ROL
        ↓
RLS O CONTROL EQUIVALENTE
        ↓
FUNCIÓN, VISTA O RPC CON SEGURIDAD REVISADA
        ↓
CONSUMIDOR Y FINALIDAD DECLARADOS
```

Reglas:

1. Un schema gobernado por Vento podrá permanecer completamente privado.
2. Un schema expuesto no deberá contener automáticamente sus fuentes internas.
3. Los grants determinan alcanzabilidad; RLS determina filas; ninguno sustituye autorización empresarial completa.
4. Las vistas expuestas deberán usar semántica de seguridad aprobada y no eludir RLS por su propietario.
5. Las funciones expuestas tendrán `EXECUTE` explícito y una clasificación de invocador o definidor revisada.
6. Los cambios de defaults de Supabase no sustituirán grants explícitos en migraciones ni pruebas de no exposición.

#### 12. Dependencias entre fronteras

| Dependencia                             | Permitida                     | Condición                                                                                    |
| --------------------------------------- | ----------------------------- | -------------------------------------------------------------------------------------------- |
| schema Vento → `auth.users.id`          | sí, de forma controlada       | vínculo técnico mínimo, FK o validación aprobada, sin convertir Auth en catálogo empresarial |
| schema Vento → objeto físico Storage    | sí                            | referencia estable y metadata empresarial separada                                           |
| schema Vento → cron, net o Edge         | sí, como comando técnico      | idempotencia, correlación, secreto y resultado conciliable                                   |
| schema Vento → tablas internas Realtime | no como contrato empresarial  | usar publicaciones y APIs soportadas                                                         |
| cliente → schema administrado           | no por defecto                | solo API oficial o excepción aprobada sin acceso a internals                                 |
| schema administrado → schema Vento      | solo mediante punto soportado | trigger, hook o integración mínima, versionada y probada                                     |
| schema Vento → schema Vento             | sí mediante contrato          | propietario, acción, seguridad, idempotencia y consumidor declarados                         |
| producto VITAL ↔ Vento OS               | no por coexistencia           | cualquier integración requiere contrato y decisión de aislamiento                            |

#### 13. Gobierno de artefactos de integración sobre schemas administrados

Todo artefacto creado por Vento sobre una superficie administrada deberá registrar:

```text
integration_artifact_id
managed_schema
managed_object_or_surface
artifact_kind
business_purpose
owner_team_or_application
source_migration_or_config
supported_extension_reference
required_privileges
security_model
consumers
compatibility_assumptions
upgrade_test
rollback_or_removal
risk_refs
TREQ_refs
reviewed_at
expires_at cuando sea excepción
```

El artefacto será gobernado por Vento, pero no cambiará la clasificación del schema ni convertirá el objeto administrado en fuente de verdad empresarial.

#### 14. Excepciones

Una excepción a estos principios solo podrá aprobarse cuando:

1. la plataforma no ofrezca otra superficie soportada;
2. exista una necesidad empresarial material y documentada;
3. se haya evaluado una alternativa en schema Vento;
4. la dependencia se limite al mínimo técnicamente necesario;
5. exista propietario, consumidor, riesgo, prueba, observabilidad y rollback;
6. se defina una fecha de revisión o expiración;
7. la excepción quede registrada en la ADR de `SUPA-ARC-025` o en una ADR específica;
8. no debilite una contención crítica de `SUPA-AUD-024`.

No son excepciones válidas:

- “ya funciona”;
- “es más rápido”;
- “Supabase lo permite técnicamente”;
- “el cliente ya consulta esa tabla”;
- “el schema está vacío”;
- “el owner es postgres”;
- “no se ha producido un incidente”.

#### 15. Riesgos restringidos y carryover

| Riesgo         | Efecto de esta tarea                                                             | Tarea que deberá cerrarlo o reducirlo                          |
| -------------- | -------------------------------------------------------------------------------- | -------------------------------------------------------------- |
| `RSK-SUPA-004` | separa clasificación, exposición, grants, RLS y autoridad                        | `SUPA-ARC-005`; `SUPA-ARC-014` a `SUPA-ARC-016`                |
| `RSK-SUPA-007` | obliga a que toda personalización Vento sea versionada                           | `SUPA-ARC-024`; `SUPA-TRANS-013`; `SHELL-CI-017`               |
| `RSK-SUPA-008` | exige reconstrucción diferenciada de recursos Vento y administrados              | `SUPA-ARC-022`; `SUPA-ARC-024`; `SUPA-TRANS-011`               |
| `RSK-SUPA-011` | separa Auth técnico de identidad y autoridad empresarial                         | `SUPA-ARC-008` a `SUPA-ARC-010`; `SUPA-ARC-016`                |
| `RSK-SUPA-015` | separa objeto físico administrado de metadata y ciclo empresarial                | `SUPA-ARC-018`; `SUPA-ARC-022`                                 |
| `RSK-SUPA-016` | prohíbe inferir propiedad desde schema y dependencia técnica                     | `SUPA-ARC-002`; `SUPA-ARC-003`; `SUPA-ARC-016`; `SUPA-ARC-017` |
| `RSK-SUPA-017` | congela `public` como contenedor actual, no como destino objetivo                | `SUPA-ARC-004`; `SUPA-ARC-005`                                 |
| `RSK-SUPA-018` | reconoce VITAL como producto distinto aunque comparta proyecto                   | `SUPA-ARC-002`; `SUPA-ARC-003`; `SUPA-ARC-024`                 |
| `RSK-SUPA-033` | exige propietario y contrato para objetos y artefactos                           | `SUPA-ARC-003`; `SUPA-ARC-011`; `SUPA-ARC-016`                 |
| `RSK-SUPA-039` | reserva `extensions` para extensiones y exige ciclo explícito                    | `SUPA-ARC-006`; `SUPA-ARC-011`                                 |
| `RSK-SUPA-054` | exige manifiestos versionados para recursos administrados configurados por Vento | `SUPA-ARC-018` a `SUPA-ARC-020`; `SUPA-ARC-024`                |
| `RSK-SUPA-056` | convierte los principios en controles recurrentes y no solo narrativos           | `SHELL-CI-017`; `SUPA-ARC-024`; `SUPA-ARC-025`                 |

Esta tarea restringe el espacio de diseño, pero no declara mitigado ni cerrado ninguno de los riesgos.

#### 16. Decisiones reservadas

| Decisión                                         | Tarea propietaria                   |
| ------------------------------------------------ | ----------------------------------- |
| dominios empresariales estables                  | `SUPA-ARC-002`                      |
| schema propietario de cada fuente de verdad      | `SUPA-ARC-003`                      |
| función futura de `public`                       | `SUPA-ARC-004`                      |
| capa expuesta de vistas y RPC                    | `SUPA-ARC-005`                      |
| capa privada de helpers y lógica                 | `SUPA-ARC-006`                      |
| auditoría y eventos                              | `SUPA-ARC-007`                      |
| Auth, identidad y ciclo de sesión                | `SUPA-ARC-008` a `SUPA-ARC-010`     |
| nombres, claves, funciones y triggers            | `SUPA-ARC-011` a `SUPA-ARC-014`     |
| exposición, RLS, contratos y escrituras cruzadas | `SUPA-ARC-015` a `SUPA-ARC-017`     |
| Storage, Realtime, Edge y cron                   | `SUPA-ARC-018` a `SUPA-ARC-020`     |
| rendimiento, retención, tipos y ambientes        | `SUPA-ARC-021` a `SUPA-ARC-024`     |
| consolidación mediante ADR                       | `SUPA-ARC-025`                      |
| movimiento, compatibilidad y retiro físico       | `SUPA-TRANS-001` a `SUPA-TRANS-015` |

#### 17. Secuencia activa requerida

El inicio de arquitectura objetivo sustituye la secuencia de auditoría cerrada por:

```text
previous_task_id = SUPA-AUD-024
segment = SUPA-ARC-001 a SUPA-ARC-025
current = SUPA-ARC-001
next = SUPA-ARC-002
```

La actualización de `active-sequence.json` es necesaria para que los validadores deriven `SUPA-ARC-001` como tarea actual y reconozcan sus requisitos de prueba. No modifica el contenido de tareas anteriores ni la cabecera derivada manualmente.

#### 18. Requisitos de prueba generados

**Resultado:** GENERA REQUISITOS DE PRUEBA.

Se incorporan al Registro Canónico de Requisitos de Prueba:

```text
TREQ-SUPABASE-531 a TREQ-SUPABASE-554
```

Los veinticuatro requisitos protegen clasificación, counts, separación de ownership y exposición, prohibiciones sobre internals administrados, contratos de Auth, Storage, Realtime y automatización, versionado en `vento-shell`, compatibilidad de plataforma, excepciones, secuencia activa y validación recurrente. El detalle completo existe únicamente en `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`.

#### 19. Criterios de aceptación

- [ ] `SUPA-AUD-024` figura aprobada y sus 56 riesgos permanecen abiertos, no aceptados ni cerrados.
- [ ] Existen exactamente 24 principios `SEP-001` a `SEP-024`.
- [ ] Se preserva la clasificación exacta de 23 schemas: 14 administrados y 9 gobernados por Vento.
- [ ] Los 23 schemas aparecen exactamente una vez en la matriz de frontera.
- [ ] Ningún schema administrado se presenta como dominio o aplicación de Vento.
- [ ] Ningún schema Vento se presenta automáticamente como dominio objetivo.
- [ ] `public` queda congelado como contenedor actual y su función objetivo permanece reservada.
- [ ] `app_private` queda reconocido como frontera privada gobernada por Vento.
- [ ] Auth técnico se separa de trabajador, cliente, dispositivo y autorización empresarial.
- [ ] Storage físico se separa de metadata, expediente y retención empresarial.
- [ ] Realtime se separa del evento empresarial y de su fuente canónica.
- [ ] cron, net, Edge y workers se separan del resultado empresarial confirmado.
- [ ] Los artefactos Vento sobre schemas administrados requieren punto soportado, versión, seguridad, prueba y rollback.
- [ ] La administración del schema se mantiene separada de Data API, grants, RLS y propiedad funcional.
- [ ] Se prohíbe mover, renombrar o retirar objetos antes del mapa de transición.
- [ ] Las excepciones requieren decisión, propietario, riesgo, vencimiento y salida.
- [ ] Los riesgos afectados conservan tarea exacta de resolución.
- [ ] Se generaron `TREQ-SUPABASE-531` a `TREQ-SUPABASE-554`.
- [ ] `active-sequence.json` cambia a `SUPA-ARC-001` a `SUPA-ARC-025`, con `SUPA-AUD-024` como antecedente.
- [ ] No se ejecutaron migraciones, cambios en Supabase ni modificaciones de código.
- [ ] `SUPA-ARC-002` permanece reservada.

#### 20. Validaciones estructurales requeridas

| Control                   | Resultado esperado |
| ------------------------- | -----------------: |
| principios únicos         |             **24** |
| schemas administrados     |             **14** |
| schemas Vento             |              **9** |
| schemas totales           |             **23** |
| filas de matriz           |             **23** |
| schemas duplicados        |              **0** |
| schemas sin clasificación |              **0** |
| riesgos sin carryover     |              **0** |
| requisitos nuevos         |             **24** |
| cambios físicos           |              **0** |

#### 21. Continuidad inmediata

```text
ÚLTIMA TAREA APROBADA
SUPA-AUD-024 — Clasificar riesgos críticos, altos, medios y deuda técnica
        ↓
TAREA ACTUAL APROBADA
SUPA-ARC-001 — Definir principios de separación entre esquemas administrados y empresariales
        ↓
SIGUIENTE TAREA RESERVADA
SUPA-ARC-002 — Definir dominios empresariales estables
```

`SUPA-ARC-002` permanece reservada y no se inicia hasta una solicitud expresa de continuidad.


### [ ] SUPA-ARC-002 — Definir dominios empresariales estables
### [ ] SUPA-ARC-003 — Definir esquema propietario de cada fuente de verdad
### [ ] SUPA-ARC-004 — Definir función futura de `public`
### [ ] SUPA-ARC-005 — Definir capa expuesta de vistas y RPC
### [ ] SUPA-ARC-006 — Definir capa privada de helpers y lógica interna
### [ ] SUPA-ARC-007 — Definir esquema transversal de auditoría y eventos
### [ ] SUPA-ARC-008 — Definir modelo canónico de Auth e identidad empresarial
### [ ] SUPA-ARC-009 — Definir vínculo de `auth.users` con trabajador, cliente y dispositivo
### [ ] SUPA-ARC-010 — Definir ciclo de sesión, revocación y desactivación
### [ ] SUPA-ARC-011 — Definir convenciones de nombres para esquemas, tablas y columnas
### [ ] SUPA-ARC-012 — Definir convenciones de claves, constraints, estados y timestamps
### [ ] SUPA-ARC-013 — Definir convenciones para funciones, RPC y triggers
### [ ] SUPA-ARC-014 — Definir política canónica de `SECURITY DEFINER`
### [ ] SUPA-ARC-015 — Definir política canónica de exposición, grants y RLS
### [ ] SUPA-ARC-016 — Definir contratos de lectura y mutación por dominio
### [ ] SUPA-ARC-017 — Definir política de escrituras entre dominios
### [ ] SUPA-ARC-018 — Definir arquitectura de Storage
### [ ] SUPA-ARC-019 — Definir arquitectura de Realtime y eventos
### [ ] SUPA-ARC-020 — Definir arquitectura de Edge Functions, webhooks y cron
### [ ] SUPA-ARC-021 — Definir estrategia de índices, rendimiento y crecimiento
### [ ] SUPA-ARC-022 — Definir retención, archivado, respaldo y recuperación
### [ ] SUPA-ARC-023 — Definir generación canónica de tipos para consumidores
### [ ] SUPA-ARC-024 — Definir entornos local, pruebas, staging y producción
