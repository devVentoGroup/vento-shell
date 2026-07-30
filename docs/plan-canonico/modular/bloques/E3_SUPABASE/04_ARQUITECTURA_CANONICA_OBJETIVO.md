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


### ✅ SUPA-ARC-002 — Definir dominios empresariales estables

**Estado:** APROBADA
**Fecha de preparación documental:** 2026-07-29
**Bloque propietario:** BLOQUE E3 — Arquitectura canónica de datos y gobierno integral de Supabase
**Tarea anterior:** `SUPA-ARC-001 — Definir principios de separación entre esquemas administrados y empresariales` — APROBADA
**Siguiente tarea:** `SUPA-ARC-003 — Definir esquema propietario de cada fuente de verdad`
**Proyecto de referencia:** `vento-os-dev` — `clzdpinthhtknkmefsxx`
**Repositorio canónico:** `devVentoGroup/vento-shell` — rama `main`; commit remoto observado `1d9cf3b5e07466f752319bfd6b75751227051b60`
**Tipo de tarea:** definición normativa de dominios empresariales; sin asignar schemas físicos, mover objetos, definir la función futura de `public`, ejecutar DDL o DML, crear migraciones, cambiar exposición, grants, RLS, Auth, Storage, Realtime, Edge Functions, cron, secretos, código, datos o despliegues

#### 1. Objetivo

Definir un registro estable de responsabilidades empresariales que permita asignar después cada fuente de verdad a una frontera física sin confundir dominio con aplicación, schema actual, tabla, proceso, familia de capacidades, equipo o servicio administrado.

```text
18 FAMILIAS DE CAPACIDAD + 69 PROCESOS + 379 RELACIONES VENTO
        ↓
CRITERIOS DE COHESIÓN, AUTORIDAD, CICLO DE VIDA Y SEGURIDAD
        ↓
26 DOMINIOS EMPRESARIALES ESTABLES DE VENTO OS
        +
1 FRONTERA DE PRODUCTO EXTERNA: VITAL
        ↓
BASE PARA ASIGNAR FUENTES DE VERDAD EN SUPA-ARC-003
```

Esta tarea determina responsabilidades estables y asigna cada proceso a un dominio primario. No determina todavía cuántos schemas físicos existirán, sus nombres PostgreSQL, la ubicación de cada objeto ni la estrategia de transición.

#### 2. Artefacto producido

```text
SUPABASE-STABLE-BUSINESS-DOMAIN-REGISTRY-001@1.0.0
```

| Propiedad | Valor |
| --- | ---: |
| `stable_domain_count` | **26** |
| `domain_id_range` | `VDOM-001` a `VDOM-026` |
| `capability_families_covered` | **18 de 18** |
| `processes_mapped` | **69 de 69** |
| `processes_with_multiple_primary_domains` | **0** |
| `processes_without_primary_domain` | **0** |
| `current_owner_applications_preserved` | **9** |
| `external_product_boundaries` | **1** — VITAL |
| `target_schema_assignments` | **0** — reservadas para `SUPA-ARC-003` |
| `physical_changes_authorized` | **0** |

#### 3. Fuentes canónicas consumidas

| Fuente | Decisión consumida |
| --- | --- |
| `SUPABASE-SCHEMA-SEPARATION-PRINCIPLES-001@1.0.0` | principios `SEP-001` a `SEP-024`, separación de plataforma, schema, aplicación, dominio y exposición |
| `SUPABASE-OBJECT-CAPABILITY-OWNERSHIP-CONSUMER-MAP-022@1.0.0` | 379 relaciones Vento, capacidades, propietarios actuales, consumidoras y frontera VITAL |
| `SUPABASE-PROCESS-DATA-RPC-EVENT-APPLICATION-MAP-023@1.0.0` | 69 procesos, propietarias, coberturas, datos, comandos y fronteras interaplicación |
| `SUPABASE-CONSOLIDATED-RISK-REGISTER-001@1.0.0` | riesgos de fuentes competidoras, cobertura, `public`, identidad, inventario, pagos y aislamiento de producto |
| `CAP-MAP-001` a `CAP-MAP-015` | árbol único de 18 familias de capacidades y reglas de propiedad y consumo |
| `PROC-CAT-003`, `PROC-CAT-005` y `PROC-CAT-006` | identidad, propietaria y consumidoras aprobadas de cada proceso |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` | 4.849 requisitos hasta `SUPA-ARC-001` |

#### 4. Definición canónica de dominio empresarial estable

Un dominio empresarial estable es una responsabilidad cohesiva y duradera que:

1. produce o gobierna un resultado empresarial diferenciable;
2. posee el ciclo de vida, invariantes, decisiones de corrección y cierre de sus hechos autoritativos;
3. permanece válida aunque cambien aplicaciones, pantallas, equipos, schemas, proveedores o canales;
4. puede declarar consumidores sin transferirles autoridad de escritura;
5. tiene una frontera de seguridad, privacidad, retención o conciliación explicable;
6. puede integrarse con otros dominios mediante referencias, comandos, proyecciones y eventos explícitos;
7. no depende de la ubicación física actual para existir conceptualmente.

Los identificadores `VDOM-*` son identidades arquitectónicas estables. No son nombres de schema PostgreSQL, packages, rutas, aplicaciones, topics ni namespaces TypeScript.

#### 5. Criterios obligatorios de separación y agrupación

| Criterio | Regla |
| --- | --- |
| resultado autoritativo | hechos con decisiones de aceptación, corrección o cierre distintas pertenecen a dominios distintos |
| ciclo de vida | entidades con inicio, estados, vigencia y retiro independientes no se fusionan por compartir actor o pantalla |
| invariantes | una frontera debe proteger reglas coherentes sin depender de DML cruzado |
| sensibilidad | privacidad, segregación, retención o trazabilidad materialmente diferentes pueden exigir separación |
| propietario del proceso | la aplicación propietaria aprobada orienta la responsabilidad, pero no se convierte en nombre ni schema del dominio |
| consumidores | tener muchas consumidoras no convierte un dato en transversal ni compartido sin autoridad |
| canal o sede | un cambio de sede, marca, canal o dispositivo no crea otro dominio |
| tecnología | usar Supabase, Storage, Realtime, Edge, cron o una tabla común no crea dominio |
| cambio futuro | la taxonomía debe sobrevivir a reorganización de aplicaciones y transición física |

#### 6. Interpretaciones prohibidas

- una aplicación no es un dominio;
- un schema actual no es un dominio por coincidencia de nombre;
- `public`, `app_private`, `auth`, `storage`, `realtime`, `api`, `audit`, `events`, `outbox` o `integration` no se convierten por sí mismos en dominios empresariales;
- una familia `CAP-*` no se convierte automáticamente en un único schema ni en un único dominio;
- una tabla compartida, FK, vista, RPC, trigger o consumidor no vuelve compartida la autoridad;
- un proceso no puede adquirir dos dominios primarios para evitar decidir la fuente autoritativa;
- los nombres actuales `club`, `pass`, `payments`, `pos`, `talento`, `viso` y `vital` no quedan certificados como dominios objetivo por existir físicamente;
- una ausencia de fuente actual no elimina el dominio necesario ni autoriza representar el proceso con un objeto auxiliar.

#### 7. Registro canónico de dominios empresariales estables

| ID | Dominio estable | Familia arquitectónica | Resultado autoritativo | Incluye | Excluye | Capacidades principales | Procesos primarios | Propietarias funcionales actuales | Asignación física |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `VDOM-001` | Gobierno organizacional | `GOBIERNO_Y_PERSONAS` | Estructura organizativa, decisiones, políticas, delegaciones, compromisos, riesgos empresariales y relaciones institucionales vigentes. | empresas, marcas, sedes, áreas, decisiones, políticas, compromisos, riesgo empresarial, asesores y autoridades | autorización técnica, analítica derivada y custodia documental | CAP-01 | `VPROC-0001`; `VPROC-0002`; `VPROC-0003`; `VPROC-0004`; `VPROC-0063`; `VPROC-0064` | `viso` | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-002` | Reclutamiento y selección | `GOBIERNO_Y_PERSONAS` | Necesidad de personal, candidato, postulación, evaluación, oferta y decisión de selección con ciclo independiente del trabajador activo. | vacantes, candidatos, postulaciones, entrevistas, evaluaciones y ofertas | vínculo laboral activo, turnos y asistencia | CAP-02 | `VPROC-0005` | `viso` | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-003` | Vinculación y ciclo laboral | `GOBIERNO_Y_PERSONAS` | Vínculo laboral, expediente de trabajador, incorporación, habilitación, desarrollo y retiro con vigencia y trazabilidad. | trabajador, relación laboral, onboarding, offboarding, asignaciones base y desarrollo | selección de candidato, programación diaria, asistencia y nómina | CAP-02 | `VPROC-0006`; `VPROC-0011`; `VPROC-0065` | `viso` | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-004` | Programación y novedades laborales | `GOBIERNO_Y_PERSONAS` | Programación publicada y casos laborales de ausencia, permiso, novedad o reemplazo con resolución controlada. | turnos, disponibilidad, preferencias, reemplazos, ausencias y novedades laborales | marcaciones de asistencia y cálculo de nómina | CAP-02 | `VPROC-0007`; `VPROC-0009` | `viso` | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-005` | Asistencia y tiempo trabajado | `GOBIERNO_Y_PERSONAS` | Hechos de asistencia, descansos, tiempo trabajado y correcciones auditables e idempotentes. | check-in, check-out, descansos, eventos de turno, conflictos y correcciones | planificación de turnos, vínculo laboral y liquidación de nómina | CAP-02 | `VPROC-0008` | `anima` | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-006` | Nómina y beneficios laborales | `GOBIERNO_Y_PERSONAS` | Paquete autorizado y conciliable de pagos, deducciones y beneficios laborales por período. | preparación de nómina, novedades valorizadas, beneficios y paquete de pago laboral | hechos crudos de asistencia, tesorería general y contabilidad completa | CAP-02; CAP-12 | `VPROC-0010` | `numera` | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-007` | Salud, seguridad, inocuidad y cumplimiento operativo | `GOBIERNO_Y_PERSONAS` | Riesgos, controles preventivos, inspecciones, incidentes, higiene, inocuidad, acciones correctivas y EPP gobernados. | SST, emergencias, higiene, inocuidad, inspecciones, acciones correctivas y elementos de protección | incidentes tecnológicos y continuidad general del negocio | CAP-03 | `VPROC-0012`; `VPROC-0013`; `VPROC-0014`; `VPROC-0066` | `viso` | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-008` | Producto maestro y especificaciones | `PRODUCTO_Y_OPERACION` | Identidad, clasificación, presentación, unidad, equivalencia, especificación, alérgeno y criterio de calidad del producto. | productos, categorías, presentaciones, UOM, equivalencias, especificaciones, alérgenos e imágenes maestras | recetas, oferta por canal, stock y precio económico | CAP-04 | `VPROC-0015`; `VPROC-0018` | `nexo` | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-009` | Recetas y conocimiento productivo | `PRODUCTO_Y_OPERACION` | Receta versionada, método, pasos, insumos, rendimientos, salidas y usos productivos aprobados. | recetas, versiones, pasos, consumos teóricos, rendimientos y aplicabilidad por sede | producto maestro, lote ejecutado y oferta comercial | CAP-04 | `VPROC-0016` | `fogo` | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-010` | Oferta comercial y disponibilidad | `PRODUCTO_Y_OPERACION` | Oferta vendible, surtido, configuración comercial, precio y disponibilidad publicada por sede, canal y vigencia. | ítems vendibles, colecciones, opciones comerciales, precios de venta, disponibilidad y publicación | identidad maestra del producto, pedido y costo interno | CAP-04; CAP-09 | `VPROC-0017` | `pulso` | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-011` | Abastecimiento y proveedores | `PRODUCTO_Y_OPERACION` | Necesidad de compra, proveedor, condición acordada, orden y recepción comercial conciliables. | proveedores, cotizaciones, condiciones, órdenes de compra, recepción y diferencias comerciales | efecto físico de stock y obligación contable definitiva | CAP-05 | `VPROC-0019`; `VPROC-0020`; `VPROC-0021`; `VPROC-0022` | `origo` | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-012` | Inventario y almacenamiento | `PRODUCTO_Y_OPERACION` | Existencia autoritativa por producto, unidad, lote o contenedor, ubicación, posición y movimiento, con conteo y conciliación. | LOC, posiciones, stock, movimientos, transferencias, conteos, condición, cuarentena y abastecimiento interno | activos durables, recetas, pedidos y transporte de última milla | CAP-06 | `VPROC-0023`; `VPROC-0024`; `VPROC-0025`; `VPROC-0026`; `VPROC-0027`; `VPROC-0028` | `nexo` | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-013` | Activos, mantenimiento y reutilizables | `PRODUCTO_Y_OPERACION` | Identidad, condición, ubicación, custodia, mantenimiento y ciclo de vida de activos, vehículos, reutilizables y kits. | activos, equipos, vehículos, mantenimiento, garantías, contenedores reutilizables y kits | existencias consumibles y órdenes de trabajo de instalaciones | CAP-07 | `VPROC-0029`; `VPROC-0030`; `VPROC-0031`; `VPROC-0032`; `VPROC-0067` | `nexo` | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-014` | Producción y calidad de lote | `PRODUCTO_Y_OPERACION` | Plan, lote, consumos, salidas, empaque, liberación, reproceso, rendimiento y cierre productivo conciliables. | planificación, solicitudes, lotes, consumos, salidas, empaque, calidad, liberación, reproceso y merma | receta maestra, stock autoritativo y pedido comercial | CAP-08 | `VPROC-0033`; `VPROC-0034`; `VPROC-0035`; `VPROC-0036`; `VPROC-0037` | `fogo` | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-015` | Pedidos y operación de venta | `COMERCIAL_Y_ENTREGA` | Pedido y servicio de venta desde captura hasta preparación, entrega comercial, modificación, cancelación o devolución. | mesa, mostrador, para llevar, canales externos, B2B, catering, pedido, ítems, estados y cambios | confirmación de pago, cliente maestro, logística de ruta y registro contable | CAP-09 | `VPROC-0038`; `VPROC-0039`; `VPROC-0040`; `VPROC-0041`; `VPROC-0042` | `pulso` | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-016` | Pagos, caja y soporte fiscal | `COMERCIAL_Y_ENTREGA` | Intento y confirmación de pago, caja, efectivo, soporte fiscal y conciliación diaria de venta y recaudo. | transacciones, webhooks de pago, medios de pago, turnos de caja, movimientos, cierres y documentos fiscales | pedido, cartera contable, presupuesto y fidelización | CAP-09; CAP-12 | `VPROC-0043`; `VPROC-0044` | `pulso` | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-017` | Clientes, fidelización y experiencia | `COMERCIAL_Y_ENTREGA` | Identidad y consentimiento del cliente, beneficios, ledgers de fidelización, reclamos, compensaciones, reservas y satisfacción. | clientes, preferencias, consentimiento, lealtad, beneficios, reclamos, compensaciones, reservas y satisfacción | pedido, campaña de marketing y transacción de pago | CAP-10 | `VPROC-0045`; `VPROC-0046`; `VPROC-0047`; `VPROC-0068` | `pass`; `pulso` | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-018` | Logística, transporte y entrega | `COMERCIAL_Y_ENTREGA` | Ruta, vehículo, carga, custodia, recorrido, entrega, prueba, novedad, retorno e integración con tercero conciliables. | planeación de ruta, despacho, transporte, entrega, prueba, novedad, retorno y terceros logísticos | movimiento interno de stock como fuente y pedido comercial | CAP-11 | `VPROC-0048`; `VPROC-0049`; `VPROC-0050` | `nexo`; `pulso` | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-019` | Finanzas y control económico | `FINANZAS_Y_HABILITADORES` | Hecho económico, obligación, cartera, costo, presupuesto, período, cierre y rentabilidad con reglas versionadas. | contabilidad, cuentas por pagar y cobrar, costos, presupuestos, períodos, cierres y rentabilidad | ejecución de pago de cliente, caja operativa y nómina detallada | CAP-12 | `VPROC-0051`; `VPROC-0052`; `VPROC-0053`; `VPROC-0054`; `VPROC-0069` | `numera` | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-020` | Instalaciones y condiciones físicas | `FINANZAS_Y_HABILITADORES` | Espacio, condición, servicio, limpieza, mantenimiento, plaga, reparación e incidencia de instalación con orden y cierre. | instalaciones, limpieza, saneamiento, plagas, servicios, reparaciones, inspecciones y novedades físicas | mantenimiento de activos móviles y soporte tecnológico | CAP-13 | `VPROC-0055` | `nexo` | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-021` | Comunicación, marketing y oportunidades | `FINANZAS_Y_HABILITADORES` | Contenido, campaña, promoción, publicación, oportunidad y caso comercial digital con aprobación, vigencia y medición. | contenido, medios, campañas, promociones, reputación, prospectos y oportunidades | oferta vendible autoritativa, pedido y resolución de reclamo | CAP-14 | `VPROC-0056`; `VPROC-0057` | `aura` | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-022` | Tecnología y soporte | `FINANZAS_Y_HABILITADORES` | Servicio tecnológico, aplicación, dispositivo, red, cambio, versión, solicitud e incidente técnico gobernados. | aplicaciones, dispositivos, redes, periféricos, soporte, fallas, cambios, versiones y proveedores tecnológicos | decisión empresarial de acceso y continuidad integral del negocio | CAP-15 | `VPROC-0058` | `viso` | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-023` | Identidad empresarial y autorización | `FINANZAS_Y_HABILITADORES` | Vínculo principal-actor, rol, permiso, alcance, contexto, dispositivo, sesión empresarial, simulación y revocación autoritativos. | actores, roles, permisos, scopes, contexto, asignaciones de acceso, dispositivos compartidos, sesiones y revocación | perfil laboral o de cliente, autenticación interna de Supabase y soporte técnico | CAP-01; CAP-15 | `VPROC-0059` | `viso` | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-024` | Información documental y evidencia | `FINANZAS_Y_HABILITADORES` | Documento o evidencia clasificado, versionado, custodiado, relacionado, retenido y dispuesto de forma autorizada. | tipos documentales, metadatos, versiones, expedientes, firmas, custodia, retención, legal hold y disposición | hecho empresarial respaldado y objeto físico administrado por Storage | CAP-16 | `VPROC-0060` | `viso` | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-025` | Medición, analítica y mejora | `FINANZAS_Y_HABILITADORES` | Métrica, definición, corte, análisis, decisión de mejora, seguimiento y verificación sin sustituir las fuentes operativas. | indicadores, snapshots, reportes, análisis, oportunidades y acciones de mejora | hechos transaccionales fuente y observabilidad puramente técnica | CAP-17 | `VPROC-0061` | `numera` | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-026` | Continuidad operativa e incidentes de servicio | `FINANZAS_Y_HABILITADORES` | Dependencia crítica, incidente de continuidad, operación degradada, recuperación, reincorporación, conciliación y aprendizaje. | continuidad, contingencia, operación mínima, recuperación, reconciliación y revisión postincidente | accidente laboral, incidente tecnológico como ticket y respaldo técnico aislado | CAP-18 | `VPROC-0062` | `viso` | `DEFERRED_TO_SUPA-ARC-003` |

Los nombres funcionales anteriores son canónicos para la responsabilidad empresarial. La convención de nombres físicos y el número de schemas se resolverán en `SUPA-ARC-003` y `SUPA-ARC-011`.

#### 8. Cobertura del mapa de capacidades

| Capacidad | Nombre canónico | Dominios que materializan resultados diferenciados | Regla de frontera |
| --- | --- | --- | --- |
| `CAP-01` | Dirigir y gobernar la organización | `VDOM-001`; `VDOM-023` | Gobierno y autorización permanecen relacionados, pero la decisión empresarial no se confunde con la evaluación técnica de acceso. |
| `CAP-02` | Gestionar personas y trabajo | `VDOM-002`; `VDOM-003`; `VDOM-004`; `VDOM-005`; `VDOM-006` | Candidato, trabajador, programación, asistencia y nómina conservan ciclos e invariantes separados. |
| `CAP-03` | Proteger salud, seguridad y cumplimiento | `VDOM-007` | La evidencia puede residir en la capa documental, pero el caso y la decisión preventiva pertenecen al dominio de seguridad. |
| `CAP-04` | Gestionar productos, preparaciones y conocimiento | `VDOM-008`; `VDOM-009`; `VDOM-010` | Producto, receta y oferta comercial no comparten automáticamente identidad, versión ni autoridad. |
| `CAP-05` | Abastecer la operación | `VDOM-011` | La recepción comercial no modifica por sí sola la autoridad de stock ni el hecho contable. |
| `CAP-06` | Controlar inventario y almacenamiento | `VDOM-012` | Inventario gobierna consumibles y existencias; no activos durables ni pedido comercial. |
| `CAP-07` | Gestionar activos, equipos y elementos reutilizables | `VDOM-013` | Activo, vehículo, reutilizable y kit comparten custodia y condición, no stock consumible. |
| `CAP-08` | Planear y ejecutar producción | `VDOM-009`; `VDOM-014` | La receta es conocimiento aprobado; producción gobierna la ejecución y calidad del lote. |
| `CAP-09` | Vender, cobrar y atender pedidos | `VDOM-010`; `VDOM-015`; `VDOM-016` | Oferta, pedido y pago son resultados distintos y conciliables. |
| `CAP-10` | Atender clientes y fortalecer relaciones | `VDOM-017` | Cliente, fidelización y experiencia se separan de pedido, pago y campaña. |
| `CAP-11` | Transportar, despachar y entregar | `VDOM-018` | La entrega gobierna custodia y prueba de transporte; el stock y el pedido conservan sus fuentes. |
| `CAP-12` | Gestionar dinero, costos y obligaciones | `VDOM-006`; `VDOM-016`; `VDOM-019` | Nómina, pago de venta y contabilidad comparten efectos económicos, pero no la misma fuente. |
| `CAP-13` | Mantener instalaciones y condiciones de operación | `VDOM-020` | Instalaciones gobierna espacios y condiciones físicas, no activos móviles ni tickets tecnológicos. |
| `CAP-14` | Comunicar, promocionar y desarrollar ventas | `VDOM-021` | Marketing gobierna contenido y oportunidad; no la oferta vendible ni el pedido. |
| `CAP-15` | Gestionar tecnología y soporte | `VDOM-022`; `VDOM-023` | Tecnología presta el servicio; identidad y autorización deciden acceso empresarial. |
| `CAP-16` | Proteger información, documentos y evidencia | `VDOM-024` | Documentos gobierna ciclo y custodia de evidencia, no el hecho respaldado. |
| `CAP-17` | Medir, analizar y mejorar | `VDOM-025` | Analítica conserva definiciones y resultados derivados sin asumir autoridad sobre datos fuente. |
| `CAP-18` | Mantener continuidad y responder a incidentes | `VDOM-026` | Continuidad coordina degradación y recuperación sin apropiarse de incidentes laborales o tecnológicos especializados. |

#### 9. Matriz completa proceso → dominio primario

| Proceso canónico | Propietaria funcional actual | Dominio primario | Nombre del dominio | Cobertura física heredada |
| --- | --- | --- | --- | --- |
| `VPROC-0001` — Gobernar decisiones empresariales con registro, alcance, responsable, compromisos y seguimiento | `viso` | `VDOM-001` | Gobierno organizacional | `NO_CANONICAL_SOURCE` |
| `VPROC-0002` — Mantener una estructura organizativa y jurídica coherente entre empresas, marcas, establecimientos, sedes y áreas | `viso` | `VDOM-001` | Gobierno organizacional | `PARTIAL_CURRENT` |
| `VPROC-0003` — Gobernar responsabilidades, políticas, delegaciones y límites de decisión mediante versiones vigentes | `viso` | `VDOM-001` | Gobierno organizacional | `PARTIAL_CURRENT` |
| `VPROC-0004` — Coordinar compromisos y transferencias de trabajo entre negocios, sedes y áreas | `viso` | `VDOM-001` | Gobierno organizacional | `NO_CANONICAL_SOURCE` |
| `VPROC-0005` — Planear dotación y ejecutar selección sin mezclar necesidad laboral, candidato y trabajador activo | `viso` | `VDOM-002` | Reclutamiento y selección | `FUTURE_OR_PARTIAL` |
| `VPROC-0006` — Orquestar vinculación, expediente, incorporación, preparación y habilitación inicial de la persona | `viso` | `VDOM-003` | Vinculación y ciclo laboral | `PARTIAL_CURRENT` |
| `VPROC-0007` — Administrar asignaciones laborales y programación publicada con historial y revisión controlada | `viso` | `VDOM-004` | Programación y novedades laborales | `PARTIAL_CURRENT` |
| `VPROC-0008` — Capturar asistencia como hechos inmutables y corregirla mediante decisiones auditables | `anima` | `VDOM-005` | Asistencia y tiempo trabajado | `IMPLEMENTED_CURRENT` |
| `VPROC-0009` — Gestionar novedades, ausencias, permisos y reemplazos como casos laborales completos | `viso` | `VDOM-004` | Programación y novedades laborales | `PARTIAL_CURRENT` |
| `VPROC-0010` — Preparar y reconciliar el paquete autorizado para pagos y beneficios laborales | `numera` | `VDOM-006` | Nómina y beneficios laborales | `NO_CANONICAL_SOURCE` |
| `VPROC-0011` — Orquestar retiro laboral, devolución, revocación de accesos y cierre documental | `viso` | `VDOM-003` | Vinculación y ciclo laboral | `FRAGMENTED_CURRENT` |
| `VPROC-0012` — Gestionar riesgos, inspecciones, controles preventivos y acciones correctivas | `viso` | `VDOM-007` | Salud, seguridad, inocuidad y cumplimiento operativo | `NO_CANONICAL_SOURCE` |
| `VPROC-0013` — Gestionar incidentes, accidentes y emergencias con respuesta inmediata y expediente posterior | `viso` | `VDOM-007` | Salud, seguridad, inocuidad y cumplimiento operativo | `NO_CANONICAL_SOURCE` |
| `VPROC-0014` — Ejecutar controles de higiene, inocuidad y cumplimiento mediante procedimientos versionados | `viso` | `VDOM-007` | Salud, seguridad, inocuidad y cumplimiento operativo | `NO_CANONICAL_SOURCE` |
| `VPROC-0015` — Gobernar el ciclo de vida de productos, presentaciones, unidades y equivalencias | `nexo` | `VDOM-008` | Producto maestro y especificaciones | `PARTIAL_CURRENT` |
| `VPROC-0016` — Gestionar desarrollo, prueba, aprobación, publicación y versión de recetas | `fogo` | `VDOM-009` | Recetas y conocimiento productivo | `PARTIAL_CURRENT` |
| `VPROC-0017` — Publicar oferta y disponibilidad desde una definición gobernada hacia todos los canales | `pulso` | `VDOM-010` | Oferta comercial y disponibilidad | `FRAGMENTED_CURRENT` |
| `VPROC-0018` — Mantener especificaciones, alérgenos, restricciones y criterios de calidad del producto | `nexo` | `VDOM-008` | Producto maestro y especificaciones | `PARTIAL_CURRENT` |
| `VPROC-0019` — Capturar y priorizar necesidades de compra mediante una entrada única y trazable | `origo` | `VDOM-011` | Abastecimiento y proveedores | `PARTIAL_CURRENT` |
| `VPROC-0020` — Comparar proveedores y condiciones con evidencia suficiente para decidir | `origo` | `VDOM-011` | Abastecimiento y proveedores | `PARTIAL_CURRENT` |
| `VPROC-0021` — Aprobar y emitir compras separando flujo ordinario, urgencia y excepción | `origo` | `VDOM-011` | Abastecimiento y proveedores | `PARTIAL_CURRENT` |
| `VPROC-0022` — Recibir compras, verificar conformidad y resolver diferencias sin separar recepción física, documental y económica | `origo` | `VDOM-011` | Abastecimiento y proveedores | `FRAGMENTED_CURRENT` |
| `VPROC-0023` — Gobernar sedes, LOC, zonas, posiciones y condiciones de almacenamiento | `nexo` | `VDOM-012` | Inventario y almacenamiento | `IMPLEMENTED_CURRENT` |
| `VPROC-0024` — Registrar ingreso, ubicación y reubicación mediante movimientos correlacionados | `nexo` | `VDOM-012` | Inventario y almacenamiento | `IMPLEMENTED_CURRENT` |
| `VPROC-0025` — Retirar, consumir o trasladar existencias conservando unidad, conversión, origen y destino | `nexo` | `VDOM-012` | Inventario y almacenamiento | `IMPLEMENTED_CURRENT` |
| `VPROC-0026` — Contar como observación, investigar diferencias y ajustar mediante decisión separada | `nexo` | `VDOM-012` | Inventario y almacenamiento | `IMPLEMENTED_CURRENT` |
| `VPROC-0027` — Gestionar condición, vencimiento, cuarentena, merma, pérdida, frío y disposición | `nexo` | `VDOM-012` | Inventario y almacenamiento | `PARTIAL_CURRENT` |
| `VPROC-0028` — Ejecutar abastecimiento interno de solicitud a recepción con cantidades conciliables por etapa | `nexo` | `VDOM-012` | Inventario y almacenamiento | `PARTIAL_CURRENT` |
| `VPROC-0029` — Gestionar identidad, ubicación, custodia, préstamo y transferencia de activos | `nexo` | `VDOM-013` | Activos, mantenimiento y reutilizables | `PARTIAL_CURRENT` |
| `VPROC-0030` — Gestionar mantenimiento, reparación, garantía, repuesto y disposición de activos | `nexo` | `VDOM-013` | Activos, mantenimiento y reutilizables | `PARTIAL_CURRENT` |
| `VPROC-0031` — Gestionar disponibilidad de vehículos, combustible, kilometraje e incidencias | `nexo` | `VDOM-013` | Activos, mantenimiento y reutilizables | `NO_CANONICAL_SOURCE` |
| `VPROC-0032` — Controlar entrega, tenencia, retorno, pérdida y completitud de reutilizables y contenedores | `nexo` | `VDOM-013` | Activos, mantenimiento y reutilizables | `PARTIAL_CURRENT` |
| `VPROC-0033` — Planear producción desde demanda, inventario, capacidad, prioridad y fecha requerida | `fogo` | `VDOM-014` | Producción y calidad de lote | `PARTIAL_CURRENT` |
| `VPROC-0034` — Preparar materiales y ejecutar producción contra una versión aprobada | `fogo` | `VDOM-014` | Producción y calidad de lote | `IMPLEMENTED_CURRENT` |
| `VPROC-0035` — Inspeccionar y decidir liberación, retención, rechazo o corrección de producto | `fogo` | `VDOM-014` | Producción y calidad de lote | `NO_CANONICAL_SOURCE` |
| `VPROC-0036` — Empacar, etiquetar y almacenar producto terminado con trazabilidad preservada | `fogo` | `VDOM-014` | Producción y calidad de lote | `PARTIAL_CURRENT` |
| `VPROC-0037` — Gestionar reproceso, aprovechamiento, rendimiento, merma y cierre productivo | `fogo` | `VDOM-014` | Producción y calidad de lote | `PARTIAL_CURRENT` |
| `VPROC-0038` — Gestionar servicio en mesa de apertura a cierre con pedido, preparación, entrega, pago y conciliación | `pulso` | `VDOM-015` | Pedidos y operación de venta | `FRAGMENTED_CURRENT` |
| `VPROC-0039` — Gestionar venta de mostrador o para llevar con entrega y cobro correlacionados | `pulso` | `VDOM-015` | Pedidos y operación de venta | `FRAGMENTED_CURRENT` |
| `VPROC-0040` — Normalizar pedidos de canales externos y transferirlos al proceso interno con reconciliación | `pulso` | `VDOM-015` | Pedidos y operación de venta | `EXTERNAL_FRAGMENTED` |
| `VPROC-0041` — Gestionar cotización, aprobación, capacidad, producción, facturación y entrega de catering o venta B2B | `pulso` | `VDOM-015` | Pedidos y operación de venta | `NO_CANONICAL_SOURCE` |
| `VPROC-0042` — Gestionar modificación, sustitución, cancelación, anulación y devolución sin confundir sus efectos | `pulso` | `VDOM-015` | Pedidos y operación de venta | `FRAGMENTED_CURRENT` |
| `VPROC-0043` — Cobrar, confirmar pago y emitir soporte fiscal mediante contrato conciliable | `pulso` | `VDOM-016` | Pagos, caja y soporte fiscal | `FRAGMENTED_CURRENT` |
| `VPROC-0044` — Cerrar caja y conciliar ventas, pagos, efectivo, diferencias y responsables | `pulso` | `VDOM-016` | Pagos, caja y soporte fiscal | `PARTIAL_CURRENT` |
| `VPROC-0045` — Identificar cliente y administrar fidelización mediante ledgers y consentimientos separados | `pass` | `VDOM-017` | Clientes, fidelización y experiencia | `FRAGMENTED_CURRENT` |
| `VPROC-0046` — Gestionar reclamo, devolución, compensación y aprendizaje de causa | `pulso` | `VDOM-017` | Clientes, fidelización y experiencia | `FRAGMENTED_CURRENT` |
| `VPROC-0047` — Gestionar reservas, eventos y comunicaciones al cliente con capacidad y consentimiento | `pulso` | `VDOM-017` | Clientes, fidelización y experiencia | `NO_CANONICAL_SOURCE` |
| `VPROC-0048` — Planear ruta, vehículo, carga, secuencia y restricciones antes del despacho | `nexo` | `VDOM-018` | Logística, transporte y entrega | `PARTIAL_CURRENT` |
| `VPROC-0049` — Ejecutar ruta y confirmar entrega, rechazo, novedad o retorno con prueba suficiente | `nexo` | `VDOM-018` | Logística, transporte y entrega | `PARTIAL_CURRENT` |
| `VPROC-0050` — Integrar entrega de tercero con seguimiento, prueba y conciliación interna | `pulso` | `VDOM-018` | Logística, transporte y entrega | `EXTERNAL_FRAGMENTED` |
| `VPROC-0051` — Registrar hechos económicos desde eventos operativos y soportes correlacionados | `numera` | `VDOM-019` | Finanzas y control económico | `PARTIAL_CURRENT` |
| `VPROC-0052` — Gestionar obligación, aprobación y pago a proveedor con conciliación bancaria | `numera` | `VDOM-019` | Finanzas y control económico | `NO_CANONICAL_SOURCE` |
| `VPROC-0053` — Gestionar cartera, cobro, recaudo, aplicación y diferencia | `numera` | `VDOM-019` | Finanzas y control económico | `NO_CANONICAL_SOURCE` |
| `VPROC-0054` — Gestionar costos, distribución, presupuesto, cierre y rentabilidad con reglas versionadas | `numera` | `VDOM-019` | Finanzas y control económico | `PARTIAL_CURRENT` |
| `VPROC-0055` — Gestionar limpieza, inspección, mantenimiento, plagas, servicios y cierre de novedades de instalaciones | `nexo` | `VDOM-020` | Instalaciones y condiciones físicas | `NO_CANONICAL_SOURCE` |
| `VPROC-0056` — Gestionar contenido y promociones desde solicitud y aprobación hasta publicación y retiro | `aura` | `VDOM-021` | Comunicación, marketing y oportunidades | `FUTURE_OR_PARTIAL` |
| `VPROC-0057` — Convertir consultas y oportunidades de canales digitales en casos comerciales trazables | `aura` | `VDOM-021` | Comunicación, marketing y oportunidades | `FUTURE_OR_PARTIAL` |
| `VPROC-0058` — Gestionar solicitudes e incidentes tecnológicos con diagnóstico, prioridad, resolución y conocimiento | `viso` | `VDOM-022` | Tecnología y soporte | `PARTIAL_CURRENT` |
| `VPROC-0059` — Gestionar el ciclo de acceso tecnológico desde solicitud hasta revocación y verificación | `viso` | `VDOM-023` | Identidad empresarial y autorización | `PARTIAL_CURRENT` |
| `VPROC-0060` — Gestionar documentos y evidencia desde creación hasta disposición con metadatos y custodia | `viso` | `VDOM-024` | Información documental y evidencia | `FRAGMENTED_CURRENT` |
| `VPROC-0061` — Gestionar medición, análisis, decisión de mejora y verificación de resultado | `numera` | `VDOM-025` | Medición, analítica y mejora | `PARTIAL_CURRENT` |
| `VPROC-0062` — Gestionar continuidad desde detección hasta operación mínima, recuperación, reconciliación y aprendizaje | `viso` | `VDOM-026` | Continuidad operativa e incidentes de servicio | `NO_CANONICAL_SOURCE` |
| `VPROC-0063` — Gestionar riesgos empresariales como registro versionado de riesgo, tratamiento y seguimiento | `viso` | `VDOM-001` | Gobierno organizacional | `NO_CANONICAL_SOURCE` |
| `VPROC-0064` — Gestionar relaciones con asesores y autoridades conservando obligaciones, vencimientos y evidencia interna | `viso` | `VDOM-001` | Gobierno organizacional | `NO_CANONICAL_SOURCE` |
| `VPROC-0065` — Acompañar desempeño y desarrollo con objetivos, retroalimentación, privacidad y decisiones separadas | `viso` | `VDOM-003` | Vinculación y ciclo laboral | `NO_CANONICAL_SOURCE` |
| `VPROC-0066` — Entregar y controlar elementos de protección desde requisito hasta devolución y evidencia | `viso` | `VDOM-007` | Salud, seguridad, inocuidad y cumplimiento operativo | `NO_CANONICAL_SOURCE` |
| `VPROC-0067` — Gestionar kits y conjuntos sin confundir kit, activo, LPN o contenedor | `nexo` | `VDOM-013` | Activos, mantenimiento y reutilizables | `NO_CANONICAL_SOURCE` |
| `VPROC-0068` — Medir satisfacción separando medición, incentivo, reclamo y compensación | `pulso` | `VDOM-017` | Clientes, fidelización y experiencia | `NO_CANONICAL_SOURCE` |
| `VPROC-0069` — Gestionar presupuestos con versión, supuestos, aprobación, vigencia, consumo, proyección y desviación | `numera` | `VDOM-019` | Finanzas y control económico | `PARTIAL_CURRENT` |

Cada proceso aparece exactamente una vez como responsabilidad primaria. Los dominios secundarios que participan como consumidor, proveedor de referencia o receptor de evento no duplican la asignación primaria.

#### 10. Fronteras empresariales obligatorias

| Frontera | Decisión estable |
| --- | --- |
| candidato ↔ trabajador | `VDOM-002` gobierna candidato y selección; `VDOM-003` inicia al materializarse el vínculo laboral autorizado |
| trabajador ↔ programación ↔ asistencia ↔ nómina | `VDOM-003`, `VDOM-004`, `VDOM-005` y `VDOM-006` intercambian referencias y hechos sin compartir fuente autoritativa |
| producto ↔ receta ↔ oferta | `VDOM-008` gobierna producto; `VDOM-009` conocimiento productivo; `VDOM-010` oferta y disponibilidad comercial |
| abastecimiento ↔ inventario | `VDOM-011` acepta la recepción comercial; `VDOM-012` registra el efecto físico conciliado |
| inventario ↔ activos | `VDOM-012` gobierna existencias consumibles; `VDOM-013` identidad, custodia y condición de activos o reutilizables |
| inventario ↔ producción | `VDOM-012` gobierna stock; `VDOM-014` lote, consumo productivo, salida y calidad |
| pedido ↔ pago ↔ cliente | `VDOM-015` gobierna pedido; `VDOM-016` pago y caja; `VDOM-017` cliente, lealtad y experiencia |
| pedido ↔ logística | `VDOM-015` conserva compromiso comercial; `VDOM-018` custodia, ruta y prueba de entrega |
| pago ↔ finanzas | `VDOM-016` confirma el recaudo operativo; `VDOM-019` reconoce obligación, hecho económico y conciliación contable |
| oferta ↔ marketing | `VDOM-010` publica qué puede venderse; `VDOM-021` gobierna contenido, campaña y oportunidad |
| tecnología ↔ autorización | `VDOM-022` opera tecnología y soporte; `VDOM-023` decide identidad, contexto, permiso y revocación empresarial |
| hecho ↔ documento | cada dominio conserva el hecho; `VDOM-024` gobierna el ciclo documental y la evidencia asociada |
| fuente ↔ analítica | cada dominio conserva el dato fuente; `VDOM-025` gobierna definición, corte, análisis y acción de mejora |
| incidente especializado ↔ continuidad | el dominio especializado gobierna el incidente; `VDOM-026` coordina degradación, recuperación y reincorporación |

#### 11. Reglas de autoridad y fuente de verdad

1. Todo hecho empresarial deberá resolver a un único dominio autoritativo antes de asignarse a un schema objetivo.
2. El dominio gobierna identidad, invariantes, estados, correcciones, cierre y evidencia mínima del hecho; la aplicación propietaria gobierna la experiencia y el proceso conforme a los contratos aprobados.
3. Una aplicación consumidora utilizará referencias, vistas, consultas, comandos o eventos aprobados y no adquirirá autoridad por leer o presentar el dato.
4. Una proyección, caché, vista, alias, tabla de compatibilidad, índice de búsqueda o snapshot analítico no constituye otra fuente de verdad.
5. Cuando el estado actual sea `FRAGMENTED_CURRENT`, `EXTERNAL_FRAGMENTED`, `PARTIAL_CURRENT`, `FUTURE_OR_PARTIAL` o `NO_CANONICAL_SOURCE`, esta tarea define la responsabilidad necesaria pero no declara resuelta la implementación.
6. La asignación objeto → dominio → schema, incluidos objetos compartidos, funciones, triggers, Storage y recursos administrados, corresponde a `SUPA-ARC-003`.
7. Las lecturas y mutaciones entre dominios se definirán en `SUPA-ARC-016` y `SUPA-ARC-017`; esta tarea no autoriza DML cruzado.

#### 12. Relación entre dominios y aplicaciones

- `shell`, `anima`, `viso`, `nexo`, `fogo`, `origo`, `pulso`, `numera`, `aura` y `pass` permanecen como aplicaciones propietarias o consumidoras de procesos, no como dominios automáticos;
- una aplicación puede operar procesos de un dominio y consumir varios dominios sin recibir un schema propio;
- un dominio puede ser operado por más de una aplicación cuando los procesos aprobados tienen propietarios distintos, sin perder una sola autoridad por hecho;
- los propietarios actuales de la matriz se preservan exactamente y solo podrán cambiar mediante la tarea funcional propietaria, no por una decisión de schema;
- `vento-shell` es fuente versionada de contratos, migraciones y pruebas, no propietario empresarial universal.

#### 13. Frontera de producto VITAL

VITAL no forma parte de los 26 dominios empresariales de Vento OS. Sus 54 relaciones auditadas conservan la clasificación `OUTSIDE_VENTO_OS` y una frontera de producto independiente.

Reglas:

1. compartir proyecto Supabase no integra VITAL con Vento OS;
2. ninguna tabla, tipo, sesión, secreto, migración o cliente VITAL se convierte en recurso transversal por coexistencia;
3. cualquier intercambio requiere contrato, finalidad, seguridad, propietario y compatibilidad explícitos;
4. `SUPA-ARC-003`, `SUPA-ARC-023` y `SUPA-ARC-024` decidirán separación física, tipos y ambientes;
5. esta tarea no confirma que el schema actual `vital` sea la frontera física definitiva.

#### 14. Capas técnicas y transversales que no son dominios empresariales

| Capa o superficie | Tratamiento | Tarea propietaria |
| --- | --- | --- |
| schemas administrados de PostgreSQL y Supabase | infraestructura de plataforma, nunca dominio Vento | `SUPA-ARC-001`; tareas específicas del servicio |
| `public` | contenedor actual multi-capacidad, no dominio | `SUPA-ARC-004` |
| API, vistas y RPC expuestas | capa de contrato, no autoridad empresarial | `SUPA-ARC-005` |
| helpers, secretos y lógica privada | capa privada técnica | `SUPA-ARC-006` |
| auditoría, outbox y eventos | capa transversal que conserva productor y dominio de origen | `SUPA-ARC-007`; `SUPA-ARC-019` |
| Storage, Realtime, Edge, webhooks y cron | servicios de transporte o ejecución | `SUPA-ARC-018` a `SUPA-ARC-020` |
| integración externa | adaptador entre propietarios, no dominio interno | `SUPA-ARC-020`; BLOQUE X |

#### 15. Riesgos restringidos y carryover

| Riesgo | Efecto de esta tarea | Resolución restante |
| --- | --- | --- |
| `RSK-SUPA-006` | separa pedido, pago y reconocimiento financiero | `SUPA-ARC-003`; `SUPA-ARC-016`; `SUPA-ARC-017`; `SUPA-ARC-020` |
| `RSK-SUPA-011` | separa vínculo laboral, asistencia e identidad-autorización | `SUPA-ARC-003`; `SUPA-ARC-008` a `SUPA-ARC-010`; `SUPA-ARC-016` |
| `RSK-SUPA-012` | establece `VDOM-012` como responsabilidad de inventario | `SUPA-ARC-003`; `SUPA-ARC-012`; `SUPA-ARC-016`; `SUPA-ARC-017` |
| `RSK-SUPA-013` | asigna los 20 procesos sin fuente a un dominio necesario sin inventar fuente actual | `SUPA-ARC-003`; `SUPA-ARC-016`; paquetes E5 propietarios |
| `RSK-SUPA-016` | elimina ambigüedad conceptual de dominio y autoridad para los 69 procesos | `SUPA-ARC-003`; `SUPA-ARC-016`; `SUPA-ARC-017`; transición |
| `RSK-SUPA-017` | confirma que `public` no es dominio | `SUPA-ARC-003` a `SUPA-ARC-005` |
| `RSK-SUPA-018` | excluye VITAL de la taxonomía de Vento OS y exige frontera contractual | `SUPA-ARC-003`; `SUPA-ARC-023`; `SUPA-ARC-024` |
| `RSK-SUPA-033` | asigna identidades de dominio para catalogar objetos sin inferir desde schema | `SUPA-ARC-003`; `SUPA-ARC-011`; `SUPA-ARC-016`; `SHELL-CI-017` |

Ningún riesgo queda aceptado, mitigado o cerrado por esta definición. La taxonomía reduce ambigüedad y prepara decisiones físicas verificables.

#### 16. Decisiones reservadas

| Decisión | Tarea propietaria |
| --- | --- |
| schema propietario de cada fuente, proyección y objeto | `SUPA-ARC-003` |
| función futura de `public` | `SUPA-ARC-004` |
| superficies expuestas y privadas | `SUPA-ARC-005`; `SUPA-ARC-006` |
| auditoría y eventos | `SUPA-ARC-007`; `SUPA-ARC-019` |
| detalle de Auth, identidad, principal y sesión | `SUPA-ARC-008` a `SUPA-ARC-010` |
| nombres físicos, claves, funciones y triggers | `SUPA-ARC-011` a `SUPA-ARC-014` |
| exposición, contratos y escrituras entre dominios | `SUPA-ARC-015` a `SUPA-ARC-017` |
| Storage, automatización, rendimiento, retención, tipos y ambientes | `SUPA-ARC-018` a `SUPA-ARC-024` |
| consolidación mediante ADR | `SUPA-ARC-025` |
| movimientos, compatibilidad, backfills y retiros | `SUPA-TRANS-001` a `SUPA-TRANS-015` |

#### 17. Límites de autorización

Esta tarea no autoriza:

- crear o renombrar schemas;
- mover, dividir, fusionar o retirar tablas, vistas, funciones, tipos, políticas o triggers;
- cambiar `public`, Data API, grants, RLS o privilegios;
- crear dominios físicos con los nombres funcionales aquí definidos;
- modificar Auth, Storage, Realtime, Edge Functions, webhooks, cron, secretos o configuración;
- ejecutar migraciones, DDL, DML, backfills, merges, eliminaciones o despliegues;
- cambiar propietarias o consumidoras aprobadas de los procesos;
- declarar resuelta una fuente fragmentada o ausente.

#### 18. Requisitos de prueba generados

**Resultado:** GENERA REQUISITOS DE PRUEBA.

Se incorporan al Registro Canónico de Requisitos de Prueba:

```text
TREQ-SUPABASE-555 a TREQ-SUPABASE-586
```

Los treinta y dos requisitos protegen identidad y cardinalidad de dominios, cobertura exacta de capacidades y procesos, fronteras críticas, separación de aplicaciones, schemas y servicios, exclusión de VITAL, autoridad única, carryovers y límites de implementación. El detalle completo existe únicamente en `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`.

#### 19. Criterios de aceptación

- [ ] Existen exactamente 26 dominios únicos `VDOM-001` a `VDOM-026`.
- [ ] Cada dominio declara resultado autoritativo, inclusiones, exclusiones, capacidades, procesos y asignación física diferida.
- [ ] Las 18 familias `CAP-01` a `CAP-18` están cubiertas sin convertirlas automáticamente en schemas.
- [ ] Los 69 procesos `VPROC-0001` a `VPROC-0069` aparecen exactamente una vez como proceso primario.
- [ ] Las propietarias funcionales actuales coinciden con `PROC-CAT-005` y `SUPA-AUD-023`.
- [ ] Ninguna aplicación, schema actual o servicio administrado se declara dominio por inferencia.
- [ ] Reclutamiento, vínculo laboral, programación, asistencia y nómina conservan fronteras explícitas.
- [ ] Producto, receta, oferta, pedido, pago, cliente, logística y finanzas conservan fuentes diferenciadas.
- [ ] Tecnología y autorización permanecen separadas.
- [ ] Documento, analítica y continuidad no sustituyen la fuente del hecho respaldado.
- [ ] VITAL permanece fuera de Vento OS con frontera de producto explícita.
- [ ] `public` no se considera dominio y su decisión permanece reservada.
- [ ] Se generaron `TREQ-SUPABASE-555` a `TREQ-SUPABASE-586`.
- [ ] No se autorizaron cambios físicos, código ni implementación.
- [ ] `SUPA-ARC-003` permanece reservada.

#### 20. Controles estructurales requeridos

| Control | Resultado esperado |
| --- | ---: |
| dominios únicos | **26** |
| IDs consecutivos | `VDOM-001` a `VDOM-026` |
| capacidades cubiertas | **18 de 18** |
| procesos cubiertos | **69 de 69** |
| procesos duplicados | **0** |
| procesos sin dominio | **0** |
| dominios físicos asignados | **0** |
| fronteras de producto externas | **1** |
| requisitos nuevos | **32** |
| cambios físicos | **0** |

#### 21. Continuidad inmediata

```text
ÚLTIMA TAREA APROBADA
SUPA-ARC-001 — Definir principios de separación entre esquemas administrados y empresariales
        ↓
TAREA ACTUAL PREPARADA PARA CONFIRMACIÓN
SUPA-ARC-002 — Definir dominios empresariales estables
        ↓
SIGUIENTE TAREA RESERVADA
SUPA-ARC-003 — Definir esquema propietario de cada fuente de verdad
```

`SUPA-ARC-003` permanece reservada y no se inicia sin aprobación expresa de esta tarea y una nueva solicitud de continuidad.


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
