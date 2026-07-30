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

| Propiedad                                 |                                  Valor |
| ----------------------------------------- | -------------------------------------: |
| `stable_domain_count`                     |                                 **26** |
| `domain_id_range`                         |                `VDOM-001` a `VDOM-026` |
| `capability_families_covered`             |                           **18 de 18** |
| `processes_mapped`                        |                           **69 de 69** |
| `processes_with_multiple_primary_domains` |                                  **0** |
| `processes_without_primary_domain`        |                                  **0** |
| `current_owner_applications_preserved`    |                                  **9** |
| `external_product_boundaries`             |                          **1** — VITAL |
| `target_schema_assignments`               | **0** — reservadas para `SUPA-ARC-003` |
| `physical_changes_authorized`             |                                  **0** |

#### 3. Fuentes canónicas consumidas

| Fuente                                                        | Decisión consumida                                                                                           |
| ------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| `SUPABASE-SCHEMA-SEPARATION-PRINCIPLES-001@1.0.0`             | principios `SEP-001` a `SEP-024`, separación de plataforma, schema, aplicación, dominio y exposición         |
| `SUPABASE-OBJECT-CAPABILITY-OWNERSHIP-CONSUMER-MAP-022@1.0.0` | 379 relaciones Vento, capacidades, propietarios actuales, consumidoras y frontera VITAL                      |
| `SUPABASE-PROCESS-DATA-RPC-EVENT-APPLICATION-MAP-023@1.0.0`   | 69 procesos, propietarias, coberturas, datos, comandos y fronteras interaplicación                           |
| `SUPABASE-CONSOLIDATED-RISK-REGISTER-001@1.0.0`               | riesgos de fuentes competidoras, cobertura, `public`, identidad, inventario, pagos y aislamiento de producto |
| `CAP-MAP-001` a `CAP-MAP-015`                                 | árbol único de 18 familias de capacidades y reglas de propiedad y consumo                                    |
| `PROC-CAT-003`, `PROC-CAT-005` y `PROC-CAT-006`               | identidad, propietaria y consumidoras aprobadas de cada proceso                                              |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`            | 4.849 requisitos hasta `SUPA-ARC-001`                                                                        |

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

| Criterio                | Regla                                                                                                               |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------- |
| resultado autoritativo  | hechos con decisiones de aceptación, corrección o cierre distintas pertenecen a dominios distintos                  |
| ciclo de vida           | entidades con inicio, estados, vigencia y retiro independientes no se fusionan por compartir actor o pantalla       |
| invariantes             | una frontera debe proteger reglas coherentes sin depender de DML cruzado                                            |
| sensibilidad            | privacidad, segregación, retención o trazabilidad materialmente diferentes pueden exigir separación                 |
| propietario del proceso | la aplicación propietaria aprobada orienta la responsabilidad, pero no se convierte en nombre ni schema del dominio |
| consumidores            | tener muchas consumidoras no convierte un dato en transversal ni compartido sin autoridad                           |
| canal o sede            | un cambio de sede, marca, canal o dispositivo no crea otro dominio                                                  |
| tecnología              | usar Supabase, Storage, Realtime, Edge, cron o una tabla común no crea dominio                                      |
| cambio futuro           | la taxonomía debe sobrevivir a reorganización de aplicaciones y transición física                                   |

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

| ID         | Dominio estable                                      | Familia arquitectónica     | Resultado autoritativo                                                                                                                   | Incluye                                                                                                             | Excluye                                                                          | Capacidades principales | Procesos primarios                                                                 | Propietarias funcionales actuales | Asignación física          |
| ---------- | ---------------------------------------------------- | -------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | ----------------------- | ---------------------------------------------------------------------------------- | --------------------------------- | -------------------------- |
| `VDOM-001` | Gobierno organizacional                              | `GOBIERNO_Y_PERSONAS`      | Estructura organizativa, decisiones, políticas, delegaciones, compromisos, riesgos empresariales y relaciones institucionales vigentes.  | empresas, marcas, sedes, áreas, decisiones, políticas, compromisos, riesgo empresarial, asesores y autoridades      | autorización técnica, analítica derivada y custodia documental                   | CAP-01                  | `VPROC-0001`; `VPROC-0002`; `VPROC-0003`; `VPROC-0004`; `VPROC-0063`; `VPROC-0064` | `viso`                            | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-002` | Reclutamiento y selección                            | `GOBIERNO_Y_PERSONAS`      | Necesidad de personal, candidato, postulación, evaluación, oferta y decisión de selección con ciclo independiente del trabajador activo. | vacantes, candidatos, postulaciones, entrevistas, evaluaciones y ofertas                                            | vínculo laboral activo, turnos y asistencia                                      | CAP-02                  | `VPROC-0005`                                                                       | `viso`                            | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-003` | Vinculación y ciclo laboral                          | `GOBIERNO_Y_PERSONAS`      | Vínculo laboral, expediente de trabajador, incorporación, habilitación, desarrollo y retiro con vigencia y trazabilidad.                 | trabajador, relación laboral, onboarding, offboarding, asignaciones base y desarrollo                               | selección de candidato, programación diaria, asistencia y nómina                 | CAP-02                  | `VPROC-0006`; `VPROC-0011`; `VPROC-0065`                                           | `viso`                            | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-004` | Programación y novedades laborales                   | `GOBIERNO_Y_PERSONAS`      | Programación publicada y casos laborales de ausencia, permiso, novedad o reemplazo con resolución controlada.                            | turnos, disponibilidad, preferencias, reemplazos, ausencias y novedades laborales                                   | marcaciones de asistencia y cálculo de nómina                                    | CAP-02                  | `VPROC-0007`; `VPROC-0009`                                                         | `viso`                            | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-005` | Asistencia y tiempo trabajado                        | `GOBIERNO_Y_PERSONAS`      | Hechos de asistencia, descansos, tiempo trabajado y correcciones auditables e idempotentes.                                              | check-in, check-out, descansos, eventos de turno, conflictos y correcciones                                         | planificación de turnos, vínculo laboral y liquidación de nómina                 | CAP-02                  | `VPROC-0008`                                                                       | `anima`                           | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-006` | Nómina y beneficios laborales                        | `GOBIERNO_Y_PERSONAS`      | Paquete autorizado y conciliable de pagos, deducciones y beneficios laborales por período.                                               | preparación de nómina, novedades valorizadas, beneficios y paquete de pago laboral                                  | hechos crudos de asistencia, tesorería general y contabilidad completa           | CAP-02; CAP-12          | `VPROC-0010`                                                                       | `numera`                          | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-007` | Salud, seguridad, inocuidad y cumplimiento operativo | `GOBIERNO_Y_PERSONAS`      | Riesgos, controles preventivos, inspecciones, incidentes, higiene, inocuidad, acciones correctivas y EPP gobernados.                     | SST, emergencias, higiene, inocuidad, inspecciones, acciones correctivas y elementos de protección                  | incidentes tecnológicos y continuidad general del negocio                        | CAP-03                  | `VPROC-0012`; `VPROC-0013`; `VPROC-0014`; `VPROC-0066`                             | `viso`                            | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-008` | Producto maestro y especificaciones                  | `PRODUCTO_Y_OPERACION`     | Identidad, clasificación, presentación, unidad, equivalencia, especificación, alérgeno y criterio de calidad del producto.               | productos, categorías, presentaciones, UOM, equivalencias, especificaciones, alérgenos e imágenes maestras          | recetas, oferta por canal, stock y precio económico                              | CAP-04                  | `VPROC-0015`; `VPROC-0018`                                                         | `nexo`                            | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-009` | Recetas y conocimiento productivo                    | `PRODUCTO_Y_OPERACION`     | Receta versionada, método, pasos, insumos, rendimientos, salidas y usos productivos aprobados.                                           | recetas, versiones, pasos, consumos teóricos, rendimientos y aplicabilidad por sede                                 | producto maestro, lote ejecutado y oferta comercial                              | CAP-04                  | `VPROC-0016`                                                                       | `fogo`                            | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-010` | Oferta comercial y disponibilidad                    | `PRODUCTO_Y_OPERACION`     | Oferta vendible, surtido, configuración comercial, precio y disponibilidad publicada por sede, canal y vigencia.                         | ítems vendibles, colecciones, opciones comerciales, precios de venta, disponibilidad y publicación                  | identidad maestra del producto, pedido y costo interno                           | CAP-04; CAP-09          | `VPROC-0017`                                                                       | `pulso`                           | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-011` | Abastecimiento y proveedores                         | `PRODUCTO_Y_OPERACION`     | Necesidad de compra, proveedor, condición acordada, orden y recepción comercial conciliables.                                            | proveedores, cotizaciones, condiciones, órdenes de compra, recepción y diferencias comerciales                      | efecto físico de stock y obligación contable definitiva                          | CAP-05                  | `VPROC-0019`; `VPROC-0020`; `VPROC-0021`; `VPROC-0022`                             | `origo`                           | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-012` | Inventario y almacenamiento                          | `PRODUCTO_Y_OPERACION`     | Existencia autoritativa por producto, unidad, lote o contenedor, ubicación, posición y movimiento, con conteo y conciliación.            | LOC, posiciones, stock, movimientos, transferencias, conteos, condición, cuarentena y abastecimiento interno        | activos durables, recetas, pedidos y transporte de última milla                  | CAP-06                  | `VPROC-0023`; `VPROC-0024`; `VPROC-0025`; `VPROC-0026`; `VPROC-0027`; `VPROC-0028` | `nexo`                            | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-013` | Activos, mantenimiento y reutilizables               | `PRODUCTO_Y_OPERACION`     | Identidad, condición, ubicación, custodia, mantenimiento y ciclo de vida de activos, vehículos, reutilizables y kits.                    | activos, equipos, vehículos, mantenimiento, garantías, contenedores reutilizables y kits                            | existencias consumibles y órdenes de trabajo de instalaciones                    | CAP-07                  | `VPROC-0029`; `VPROC-0030`; `VPROC-0031`; `VPROC-0032`; `VPROC-0067`               | `nexo`                            | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-014` | Producción y calidad de lote                         | `PRODUCTO_Y_OPERACION`     | Plan, lote, consumos, salidas, empaque, liberación, reproceso, rendimiento y cierre productivo conciliables.                             | planificación, solicitudes, lotes, consumos, salidas, empaque, calidad, liberación, reproceso y merma               | receta maestra, stock autoritativo y pedido comercial                            | CAP-08                  | `VPROC-0033`; `VPROC-0034`; `VPROC-0035`; `VPROC-0036`; `VPROC-0037`               | `fogo`                            | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-015` | Pedidos y operación de venta                         | `COMERCIAL_Y_ENTREGA`      | Pedido y servicio de venta desde captura hasta preparación, entrega comercial, modificación, cancelación o devolución.                   | mesa, mostrador, para llevar, canales externos, B2B, catering, pedido, ítems, estados y cambios                     | confirmación de pago, cliente maestro, logística de ruta y registro contable     | CAP-09                  | `VPROC-0038`; `VPROC-0039`; `VPROC-0040`; `VPROC-0041`; `VPROC-0042`               | `pulso`                           | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-016` | Pagos, caja y soporte fiscal                         | `COMERCIAL_Y_ENTREGA`      | Intento y confirmación de pago, caja, efectivo, soporte fiscal y conciliación diaria de venta y recaudo.                                 | transacciones, webhooks de pago, medios de pago, turnos de caja, movimientos, cierres y documentos fiscales         | pedido, cartera contable, presupuesto y fidelización                             | CAP-09; CAP-12          | `VPROC-0043`; `VPROC-0044`                                                         | `pulso`                           | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-017` | Clientes, fidelización y experiencia                 | `COMERCIAL_Y_ENTREGA`      | Identidad y consentimiento del cliente, beneficios, ledgers de fidelización, reclamos, compensaciones, reservas y satisfacción.          | clientes, preferencias, consentimiento, lealtad, beneficios, reclamos, compensaciones, reservas y satisfacción      | pedido, campaña de marketing y transacción de pago                               | CAP-10                  | `VPROC-0045`; `VPROC-0046`; `VPROC-0047`; `VPROC-0068`                             | `pass`; `pulso`                   | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-018` | Logística, transporte y entrega                      | `COMERCIAL_Y_ENTREGA`      | Ruta, vehículo, carga, custodia, recorrido, entrega, prueba, novedad, retorno e integración con tercero conciliables.                    | planeación de ruta, despacho, transporte, entrega, prueba, novedad, retorno y terceros logísticos                   | movimiento interno de stock como fuente y pedido comercial                       | CAP-11                  | `VPROC-0048`; `VPROC-0049`; `VPROC-0050`                                           | `nexo`; `pulso`                   | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-019` | Finanzas y control económico                         | `FINANZAS_Y_HABILITADORES` | Hecho económico, obligación, cartera, costo, presupuesto, período, cierre y rentabilidad con reglas versionadas.                         | contabilidad, cuentas por pagar y cobrar, costos, presupuestos, períodos, cierres y rentabilidad                    | ejecución de pago de cliente, caja operativa y nómina detallada                  | CAP-12                  | `VPROC-0051`; `VPROC-0052`; `VPROC-0053`; `VPROC-0054`; `VPROC-0069`               | `numera`                          | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-020` | Instalaciones y condiciones físicas                  | `FINANZAS_Y_HABILITADORES` | Espacio, condición, servicio, limpieza, mantenimiento, plaga, reparación e incidencia de instalación con orden y cierre.                 | instalaciones, limpieza, saneamiento, plagas, servicios, reparaciones, inspecciones y novedades físicas             | mantenimiento de activos móviles y soporte tecnológico                           | CAP-13                  | `VPROC-0055`                                                                       | `nexo`                            | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-021` | Comunicación, marketing y oportunidades              | `FINANZAS_Y_HABILITADORES` | Contenido, campaña, promoción, publicación, oportunidad y caso comercial digital con aprobación, vigencia y medición.                    | contenido, medios, campañas, promociones, reputación, prospectos y oportunidades                                    | oferta vendible autoritativa, pedido y resolución de reclamo                     | CAP-14                  | `VPROC-0056`; `VPROC-0057`                                                         | `aura`                            | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-022` | Tecnología y soporte                                 | `FINANZAS_Y_HABILITADORES` | Servicio tecnológico, aplicación, dispositivo, red, cambio, versión, solicitud e incidente técnico gobernados.                           | aplicaciones, dispositivos, redes, periféricos, soporte, fallas, cambios, versiones y proveedores tecnológicos      | decisión empresarial de acceso y continuidad integral del negocio                | CAP-15                  | `VPROC-0058`                                                                       | `viso`                            | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-023` | Identidad empresarial y autorización                 | `FINANZAS_Y_HABILITADORES` | Vínculo principal-actor, rol, permiso, alcance, contexto, dispositivo, sesión empresarial, simulación y revocación autoritativos.        | actores, roles, permisos, scopes, contexto, asignaciones de acceso, dispositivos compartidos, sesiones y revocación | perfil laboral o de cliente, autenticación interna de Supabase y soporte técnico | CAP-01; CAP-15          | `VPROC-0059`                                                                       | `viso`                            | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-024` | Información documental y evidencia                   | `FINANZAS_Y_HABILITADORES` | Documento o evidencia clasificado, versionado, custodiado, relacionado, retenido y dispuesto de forma autorizada.                        | tipos documentales, metadatos, versiones, expedientes, firmas, custodia, retención, legal hold y disposición        | hecho empresarial respaldado y objeto físico administrado por Storage            | CAP-16                  | `VPROC-0060`                                                                       | `viso`                            | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-025` | Medición, analítica y mejora                         | `FINANZAS_Y_HABILITADORES` | Métrica, definición, corte, análisis, decisión de mejora, seguimiento y verificación sin sustituir las fuentes operativas.               | indicadores, snapshots, reportes, análisis, oportunidades y acciones de mejora                                      | hechos transaccionales fuente y observabilidad puramente técnica                 | CAP-17                  | `VPROC-0061`                                                                       | `numera`                          | `DEFERRED_TO_SUPA-ARC-003` |
| `VDOM-026` | Continuidad operativa e incidentes de servicio       | `FINANZAS_Y_HABILITADORES` | Dependencia crítica, incidente de continuidad, operación degradada, recuperación, reincorporación, conciliación y aprendizaje.           | continuidad, contingencia, operación mínima, recuperación, reconciliación y revisión postincidente                  | accidente laboral, incidente tecnológico como ticket y respaldo técnico aislado  | CAP-18                  | `VPROC-0062`                                                                       | `viso`                            | `DEFERRED_TO_SUPA-ARC-003` |

Los nombres funcionales anteriores son canónicos para la responsabilidad empresarial. La convención de nombres físicos y el número de schemas se resolverán en `SUPA-ARC-003` y `SUPA-ARC-011`.

#### 8. Cobertura del mapa de capacidades

| Capacidad | Nombre canónico                                      | Dominios que materializan resultados diferenciados         | Regla de frontera                                                                                                                 |
| --------- | ---------------------------------------------------- | ---------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| `CAP-01`  | Dirigir y gobernar la organización                   | `VDOM-001`; `VDOM-023`                                     | Gobierno y autorización permanecen relacionados, pero la decisión empresarial no se confunde con la evaluación técnica de acceso. |
| `CAP-02`  | Gestionar personas y trabajo                         | `VDOM-002`; `VDOM-003`; `VDOM-004`; `VDOM-005`; `VDOM-006` | Candidato, trabajador, programación, asistencia y nómina conservan ciclos e invariantes separados.                                |
| `CAP-03`  | Proteger salud, seguridad y cumplimiento             | `VDOM-007`                                                 | La evidencia puede residir en la capa documental, pero el caso y la decisión preventiva pertenecen al dominio de seguridad.       |
| `CAP-04`  | Gestionar productos, preparaciones y conocimiento    | `VDOM-008`; `VDOM-009`; `VDOM-010`                         | Producto, receta y oferta comercial no comparten automáticamente identidad, versión ni autoridad.                                 |
| `CAP-05`  | Abastecer la operación                               | `VDOM-011`                                                 | La recepción comercial no modifica por sí sola la autoridad de stock ni el hecho contable.                                        |
| `CAP-06`  | Controlar inventario y almacenamiento                | `VDOM-012`                                                 | Inventario gobierna consumibles y existencias; no activos durables ni pedido comercial.                                           |
| `CAP-07`  | Gestionar activos, equipos y elementos reutilizables | `VDOM-013`                                                 | Activo, vehículo, reutilizable y kit comparten custodia y condición, no stock consumible.                                         |
| `CAP-08`  | Planear y ejecutar producción                        | `VDOM-009`; `VDOM-014`                                     | La receta es conocimiento aprobado; producción gobierna la ejecución y calidad del lote.                                          |
| `CAP-09`  | Vender, cobrar y atender pedidos                     | `VDOM-010`; `VDOM-015`; `VDOM-016`                         | Oferta, pedido y pago son resultados distintos y conciliables.                                                                    |
| `CAP-10`  | Atender clientes y fortalecer relaciones             | `VDOM-017`                                                 | Cliente, fidelización y experiencia se separan de pedido, pago y campaña.                                                         |
| `CAP-11`  | Transportar, despachar y entregar                    | `VDOM-018`                                                 | La entrega gobierna custodia y prueba de transporte; el stock y el pedido conservan sus fuentes.                                  |
| `CAP-12`  | Gestionar dinero, costos y obligaciones              | `VDOM-006`; `VDOM-016`; `VDOM-019`                         | Nómina, pago de venta y contabilidad comparten efectos económicos, pero no la misma fuente.                                       |
| `CAP-13`  | Mantener instalaciones y condiciones de operación    | `VDOM-020`                                                 | Instalaciones gobierna espacios y condiciones físicas, no activos móviles ni tickets tecnológicos.                                |
| `CAP-14`  | Comunicar, promocionar y desarrollar ventas          | `VDOM-021`                                                 | Marketing gobierna contenido y oportunidad; no la oferta vendible ni el pedido.                                                   |
| `CAP-15`  | Gestionar tecnología y soporte                       | `VDOM-022`; `VDOM-023`                                     | Tecnología presta el servicio; identidad y autorización deciden acceso empresarial.                                               |
| `CAP-16`  | Proteger información, documentos y evidencia         | `VDOM-024`                                                 | Documentos gobierna ciclo y custodia de evidencia, no el hecho respaldado.                                                        |
| `CAP-17`  | Medir, analizar y mejorar                            | `VDOM-025`                                                 | Analítica conserva definiciones y resultados derivados sin asumir autoridad sobre datos fuente.                                   |
| `CAP-18`  | Mantener continuidad y responder a incidentes        | `VDOM-026`                                                 | Continuidad coordina degradación y recuperación sin apropiarse de incidentes laborales o tecnológicos especializados.             |

#### 9. Matriz completa proceso → dominio primario

| Proceso canónico                                                                                                                  | Propietaria funcional actual | Dominio primario | Nombre del dominio                                   | Cobertura física heredada |
| --------------------------------------------------------------------------------------------------------------------------------- | ---------------------------- | ---------------- | ---------------------------------------------------- | ------------------------- |
| `VPROC-0001` — Gobernar decisiones empresariales con registro, alcance, responsable, compromisos y seguimiento                    | `viso`                       | `VDOM-001`       | Gobierno organizacional                              | `NO_CANONICAL_SOURCE`     |
| `VPROC-0002` — Mantener una estructura organizativa y jurídica coherente entre empresas, marcas, establecimientos, sedes y áreas  | `viso`                       | `VDOM-001`       | Gobierno organizacional                              | `PARTIAL_CURRENT`         |
| `VPROC-0003` — Gobernar responsabilidades, políticas, delegaciones y límites de decisión mediante versiones vigentes              | `viso`                       | `VDOM-001`       | Gobierno organizacional                              | `PARTIAL_CURRENT`         |
| `VPROC-0004` — Coordinar compromisos y transferencias de trabajo entre negocios, sedes y áreas                                    | `viso`                       | `VDOM-001`       | Gobierno organizacional                              | `NO_CANONICAL_SOURCE`     |
| `VPROC-0005` — Planear dotación y ejecutar selección sin mezclar necesidad laboral, candidato y trabajador activo                 | `viso`                       | `VDOM-002`       | Reclutamiento y selección                            | `FUTURE_OR_PARTIAL`       |
| `VPROC-0006` — Orquestar vinculación, expediente, incorporación, preparación y habilitación inicial de la persona                 | `viso`                       | `VDOM-003`       | Vinculación y ciclo laboral                          | `PARTIAL_CURRENT`         |
| `VPROC-0007` — Administrar asignaciones laborales y programación publicada con historial y revisión controlada                    | `viso`                       | `VDOM-004`       | Programación y novedades laborales                   | `PARTIAL_CURRENT`         |
| `VPROC-0008` — Capturar asistencia como hechos inmutables y corregirla mediante decisiones auditables                             | `anima`                      | `VDOM-005`       | Asistencia y tiempo trabajado                        | `IMPLEMENTED_CURRENT`     |
| `VPROC-0009` — Gestionar novedades, ausencias, permisos y reemplazos como casos laborales completos                               | `viso`                       | `VDOM-004`       | Programación y novedades laborales                   | `PARTIAL_CURRENT`         |
| `VPROC-0010` — Preparar y reconciliar el paquete autorizado para pagos y beneficios laborales                                     | `numera`                     | `VDOM-006`       | Nómina y beneficios laborales                        | `NO_CANONICAL_SOURCE`     |
| `VPROC-0011` — Orquestar retiro laboral, devolución, revocación de accesos y cierre documental                                    | `viso`                       | `VDOM-003`       | Vinculación y ciclo laboral                          | `FRAGMENTED_CURRENT`      |
| `VPROC-0012` — Gestionar riesgos, inspecciones, controles preventivos y acciones correctivas                                      | `viso`                       | `VDOM-007`       | Salud, seguridad, inocuidad y cumplimiento operativo | `NO_CANONICAL_SOURCE`     |
| `VPROC-0013` — Gestionar incidentes, accidentes y emergencias con respuesta inmediata y expediente posterior                      | `viso`                       | `VDOM-007`       | Salud, seguridad, inocuidad y cumplimiento operativo | `NO_CANONICAL_SOURCE`     |
| `VPROC-0014` — Ejecutar controles de higiene, inocuidad y cumplimiento mediante procedimientos versionados                        | `viso`                       | `VDOM-007`       | Salud, seguridad, inocuidad y cumplimiento operativo | `NO_CANONICAL_SOURCE`     |
| `VPROC-0015` — Gobernar el ciclo de vida de productos, presentaciones, unidades y equivalencias                                   | `nexo`                       | `VDOM-008`       | Producto maestro y especificaciones                  | `PARTIAL_CURRENT`         |
| `VPROC-0016` — Gestionar desarrollo, prueba, aprobación, publicación y versión de recetas                                         | `fogo`                       | `VDOM-009`       | Recetas y conocimiento productivo                    | `PARTIAL_CURRENT`         |
| `VPROC-0017` — Publicar oferta y disponibilidad desde una definición gobernada hacia todos los canales                            | `pulso`                      | `VDOM-010`       | Oferta comercial y disponibilidad                    | `FRAGMENTED_CURRENT`      |
| `VPROC-0018` — Mantener especificaciones, alérgenos, restricciones y criterios de calidad del producto                            | `nexo`                       | `VDOM-008`       | Producto maestro y especificaciones                  | `PARTIAL_CURRENT`         |
| `VPROC-0019` — Capturar y priorizar necesidades de compra mediante una entrada única y trazable                                   | `origo`                      | `VDOM-011`       | Abastecimiento y proveedores                         | `PARTIAL_CURRENT`         |
| `VPROC-0020` — Comparar proveedores y condiciones con evidencia suficiente para decidir                                           | `origo`                      | `VDOM-011`       | Abastecimiento y proveedores                         | `PARTIAL_CURRENT`         |
| `VPROC-0021` — Aprobar y emitir compras separando flujo ordinario, urgencia y excepción                                           | `origo`                      | `VDOM-011`       | Abastecimiento y proveedores                         | `PARTIAL_CURRENT`         |
| `VPROC-0022` — Recibir compras, verificar conformidad y resolver diferencias sin separar recepción física, documental y económica | `origo`                      | `VDOM-011`       | Abastecimiento y proveedores                         | `FRAGMENTED_CURRENT`      |
| `VPROC-0023` — Gobernar sedes, LOC, zonas, posiciones y condiciones de almacenamiento                                             | `nexo`                       | `VDOM-012`       | Inventario y almacenamiento                          | `IMPLEMENTED_CURRENT`     |
| `VPROC-0024` — Registrar ingreso, ubicación y reubicación mediante movimientos correlacionados                                    | `nexo`                       | `VDOM-012`       | Inventario y almacenamiento                          | `IMPLEMENTED_CURRENT`     |
| `VPROC-0025` — Retirar, consumir o trasladar existencias conservando unidad, conversión, origen y destino                         | `nexo`                       | `VDOM-012`       | Inventario y almacenamiento                          | `IMPLEMENTED_CURRENT`     |
| `VPROC-0026` — Contar como observación, investigar diferencias y ajustar mediante decisión separada                               | `nexo`                       | `VDOM-012`       | Inventario y almacenamiento                          | `IMPLEMENTED_CURRENT`     |
| `VPROC-0027` — Gestionar condición, vencimiento, cuarentena, merma, pérdida, frío y disposición                                   | `nexo`                       | `VDOM-012`       | Inventario y almacenamiento                          | `PARTIAL_CURRENT`         |
| `VPROC-0028` — Ejecutar abastecimiento interno de solicitud a recepción con cantidades conciliables por etapa                     | `nexo`                       | `VDOM-012`       | Inventario y almacenamiento                          | `PARTIAL_CURRENT`         |
| `VPROC-0029` — Gestionar identidad, ubicación, custodia, préstamo y transferencia de activos                                      | `nexo`                       | `VDOM-013`       | Activos, mantenimiento y reutilizables               | `PARTIAL_CURRENT`         |
| `VPROC-0030` — Gestionar mantenimiento, reparación, garantía, repuesto y disposición de activos                                   | `nexo`                       | `VDOM-013`       | Activos, mantenimiento y reutilizables               | `PARTIAL_CURRENT`         |
| `VPROC-0031` — Gestionar disponibilidad de vehículos, combustible, kilometraje e incidencias                                      | `nexo`                       | `VDOM-013`       | Activos, mantenimiento y reutilizables               | `NO_CANONICAL_SOURCE`     |
| `VPROC-0032` — Controlar entrega, tenencia, retorno, pérdida y completitud de reutilizables y contenedores                        | `nexo`                       | `VDOM-013`       | Activos, mantenimiento y reutilizables               | `PARTIAL_CURRENT`         |
| `VPROC-0033` — Planear producción desde demanda, inventario, capacidad, prioridad y fecha requerida                               | `fogo`                       | `VDOM-014`       | Producción y calidad de lote                         | `PARTIAL_CURRENT`         |
| `VPROC-0034` — Preparar materiales y ejecutar producción contra una versión aprobada                                              | `fogo`                       | `VDOM-014`       | Producción y calidad de lote                         | `IMPLEMENTED_CURRENT`     |
| `VPROC-0035` — Inspeccionar y decidir liberación, retención, rechazo o corrección de producto                                     | `fogo`                       | `VDOM-014`       | Producción y calidad de lote                         | `NO_CANONICAL_SOURCE`     |
| `VPROC-0036` — Empacar, etiquetar y almacenar producto terminado con trazabilidad preservada                                      | `fogo`                       | `VDOM-014`       | Producción y calidad de lote                         | `PARTIAL_CURRENT`         |
| `VPROC-0037` — Gestionar reproceso, aprovechamiento, rendimiento, merma y cierre productivo                                       | `fogo`                       | `VDOM-014`       | Producción y calidad de lote                         | `PARTIAL_CURRENT`         |
| `VPROC-0038` — Gestionar servicio en mesa de apertura a cierre con pedido, preparación, entrega, pago y conciliación              | `pulso`                      | `VDOM-015`       | Pedidos y operación de venta                         | `FRAGMENTED_CURRENT`      |
| `VPROC-0039` — Gestionar venta de mostrador o para llevar con entrega y cobro correlacionados                                     | `pulso`                      | `VDOM-015`       | Pedidos y operación de venta                         | `FRAGMENTED_CURRENT`      |
| `VPROC-0040` — Normalizar pedidos de canales externos y transferirlos al proceso interno con reconciliación                       | `pulso`                      | `VDOM-015`       | Pedidos y operación de venta                         | `EXTERNAL_FRAGMENTED`     |
| `VPROC-0041` — Gestionar cotización, aprobación, capacidad, producción, facturación y entrega de catering o venta B2B             | `pulso`                      | `VDOM-015`       | Pedidos y operación de venta                         | `NO_CANONICAL_SOURCE`     |
| `VPROC-0042` — Gestionar modificación, sustitución, cancelación, anulación y devolución sin confundir sus efectos                 | `pulso`                      | `VDOM-015`       | Pedidos y operación de venta                         | `FRAGMENTED_CURRENT`      |
| `VPROC-0043` — Cobrar, confirmar pago y emitir soporte fiscal mediante contrato conciliable                                       | `pulso`                      | `VDOM-016`       | Pagos, caja y soporte fiscal                         | `FRAGMENTED_CURRENT`      |
| `VPROC-0044` — Cerrar caja y conciliar ventas, pagos, efectivo, diferencias y responsables                                        | `pulso`                      | `VDOM-016`       | Pagos, caja y soporte fiscal                         | `PARTIAL_CURRENT`         |
| `VPROC-0045` — Identificar cliente y administrar fidelización mediante ledgers y consentimientos separados                        | `pass`                       | `VDOM-017`       | Clientes, fidelización y experiencia                 | `FRAGMENTED_CURRENT`      |
| `VPROC-0046` — Gestionar reclamo, devolución, compensación y aprendizaje de causa                                                 | `pulso`                      | `VDOM-017`       | Clientes, fidelización y experiencia                 | `FRAGMENTED_CURRENT`      |
| `VPROC-0047` — Gestionar reservas, eventos y comunicaciones al cliente con capacidad y consentimiento                             | `pulso`                      | `VDOM-017`       | Clientes, fidelización y experiencia                 | `NO_CANONICAL_SOURCE`     |
| `VPROC-0048` — Planear ruta, vehículo, carga, secuencia y restricciones antes del despacho                                        | `nexo`                       | `VDOM-018`       | Logística, transporte y entrega                      | `PARTIAL_CURRENT`         |
| `VPROC-0049` — Ejecutar ruta y confirmar entrega, rechazo, novedad o retorno con prueba suficiente                                | `nexo`                       | `VDOM-018`       | Logística, transporte y entrega                      | `PARTIAL_CURRENT`         |
| `VPROC-0050` — Integrar entrega de tercero con seguimiento, prueba y conciliación interna                                         | `pulso`                      | `VDOM-018`       | Logística, transporte y entrega                      | `EXTERNAL_FRAGMENTED`     |
| `VPROC-0051` — Registrar hechos económicos desde eventos operativos y soportes correlacionados                                    | `numera`                     | `VDOM-019`       | Finanzas y control económico                         | `PARTIAL_CURRENT`         |
| `VPROC-0052` — Gestionar obligación, aprobación y pago a proveedor con conciliación bancaria                                      | `numera`                     | `VDOM-019`       | Finanzas y control económico                         | `NO_CANONICAL_SOURCE`     |
| `VPROC-0053` — Gestionar cartera, cobro, recaudo, aplicación y diferencia                                                         | `numera`                     | `VDOM-019`       | Finanzas y control económico                         | `NO_CANONICAL_SOURCE`     |
| `VPROC-0054` — Gestionar costos, distribución, presupuesto, cierre y rentabilidad con reglas versionadas                          | `numera`                     | `VDOM-019`       | Finanzas y control económico                         | `PARTIAL_CURRENT`         |
| `VPROC-0055` — Gestionar limpieza, inspección, mantenimiento, plagas, servicios y cierre de novedades de instalaciones            | `nexo`                       | `VDOM-020`       | Instalaciones y condiciones físicas                  | `NO_CANONICAL_SOURCE`     |
| `VPROC-0056` — Gestionar contenido y promociones desde solicitud y aprobación hasta publicación y retiro                          | `aura`                       | `VDOM-021`       | Comunicación, marketing y oportunidades              | `FUTURE_OR_PARTIAL`       |
| `VPROC-0057` — Convertir consultas y oportunidades de canales digitales en casos comerciales trazables                            | `aura`                       | `VDOM-021`       | Comunicación, marketing y oportunidades              | `FUTURE_OR_PARTIAL`       |
| `VPROC-0058` — Gestionar solicitudes e incidentes tecnológicos con diagnóstico, prioridad, resolución y conocimiento              | `viso`                       | `VDOM-022`       | Tecnología y soporte                                 | `PARTIAL_CURRENT`         |
| `VPROC-0059` — Gestionar el ciclo de acceso tecnológico desde solicitud hasta revocación y verificación                           | `viso`                       | `VDOM-023`       | Identidad empresarial y autorización                 | `PARTIAL_CURRENT`         |
| `VPROC-0060` — Gestionar documentos y evidencia desde creación hasta disposición con metadatos y custodia                         | `viso`                       | `VDOM-024`       | Información documental y evidencia                   | `FRAGMENTED_CURRENT`      |
| `VPROC-0061` — Gestionar medición, análisis, decisión de mejora y verificación de resultado                                       | `numera`                     | `VDOM-025`       | Medición, analítica y mejora                         | `PARTIAL_CURRENT`         |
| `VPROC-0062` — Gestionar continuidad desde detección hasta operación mínima, recuperación, reconciliación y aprendizaje           | `viso`                       | `VDOM-026`       | Continuidad operativa e incidentes de servicio       | `NO_CANONICAL_SOURCE`     |
| `VPROC-0063` — Gestionar riesgos empresariales como registro versionado de riesgo, tratamiento y seguimiento                      | `viso`                       | `VDOM-001`       | Gobierno organizacional                              | `NO_CANONICAL_SOURCE`     |
| `VPROC-0064` — Gestionar relaciones con asesores y autoridades conservando obligaciones, vencimientos y evidencia interna         | `viso`                       | `VDOM-001`       | Gobierno organizacional                              | `NO_CANONICAL_SOURCE`     |
| `VPROC-0065` — Acompañar desempeño y desarrollo con objetivos, retroalimentación, privacidad y decisiones separadas               | `viso`                       | `VDOM-003`       | Vinculación y ciclo laboral                          | `NO_CANONICAL_SOURCE`     |
| `VPROC-0066` — Entregar y controlar elementos de protección desde requisito hasta devolución y evidencia                          | `viso`                       | `VDOM-007`       | Salud, seguridad, inocuidad y cumplimiento operativo | `NO_CANONICAL_SOURCE`     |
| `VPROC-0067` — Gestionar kits y conjuntos sin confundir kit, activo, LPN o contenedor                                             | `nexo`                       | `VDOM-013`       | Activos, mantenimiento y reutilizables               | `NO_CANONICAL_SOURCE`     |
| `VPROC-0068` — Medir satisfacción separando medición, incentivo, reclamo y compensación                                           | `pulso`                      | `VDOM-017`       | Clientes, fidelización y experiencia                 | `NO_CANONICAL_SOURCE`     |
| `VPROC-0069` — Gestionar presupuestos con versión, supuestos, aprobación, vigencia, consumo, proyección y desviación              | `numera`                     | `VDOM-019`       | Finanzas y control económico                         | `PARTIAL_CURRENT`         |

Cada proceso aparece exactamente una vez como responsabilidad primaria. Los dominios secundarios que participan como consumidor, proveedor de referencia o receptor de evento no duplican la asignación primaria.

#### 10. Fronteras empresariales obligatorias

| Frontera                                        | Decisión estable                                                                                                    |
| ----------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| candidato ↔ trabajador                          | `VDOM-002` gobierna candidato y selección; `VDOM-003` inicia al materializarse el vínculo laboral autorizado        |
| trabajador ↔ programación ↔ asistencia ↔ nómina | `VDOM-003`, `VDOM-004`, `VDOM-005` y `VDOM-006` intercambian referencias y hechos sin compartir fuente autoritativa |
| producto ↔ receta ↔ oferta                      | `VDOM-008` gobierna producto; `VDOM-009` conocimiento productivo; `VDOM-010` oferta y disponibilidad comercial      |
| abastecimiento ↔ inventario                     | `VDOM-011` acepta la recepción comercial; `VDOM-012` registra el efecto físico conciliado                           |
| inventario ↔ activos                            | `VDOM-012` gobierna existencias consumibles; `VDOM-013` identidad, custodia y condición de activos o reutilizables  |
| inventario ↔ producción                         | `VDOM-012` gobierna stock; `VDOM-014` lote, consumo productivo, salida y calidad                                    |
| pedido ↔ pago ↔ cliente                         | `VDOM-015` gobierna pedido; `VDOM-016` pago y caja; `VDOM-017` cliente, lealtad y experiencia                       |
| pedido ↔ logística                              | `VDOM-015` conserva compromiso comercial; `VDOM-018` custodia, ruta y prueba de entrega                             |
| pago ↔ finanzas                                 | `VDOM-016` confirma el recaudo operativo; `VDOM-019` reconoce obligación, hecho económico y conciliación contable   |
| oferta ↔ marketing                              | `VDOM-010` publica qué puede venderse; `VDOM-021` gobierna contenido, campaña y oportunidad                         |
| tecnología ↔ autorización                       | `VDOM-022` opera tecnología y soporte; `VDOM-023` decide identidad, contexto, permiso y revocación empresarial      |
| hecho ↔ documento                               | cada dominio conserva el hecho; `VDOM-024` gobierna el ciclo documental y la evidencia asociada                     |
| fuente ↔ analítica                              | cada dominio conserva el dato fuente; `VDOM-025` gobierna definición, corte, análisis y acción de mejora            |
| incidente especializado ↔ continuidad           | el dominio especializado gobierna el incidente; `VDOM-026` coordina degradación, recuperación y reincorporación     |

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

| Capa o superficie                              | Tratamiento                                                 | Tarea propietaria                               |
| ---------------------------------------------- | ----------------------------------------------------------- | ----------------------------------------------- |
| schemas administrados de PostgreSQL y Supabase | infraestructura de plataforma, nunca dominio Vento          | `SUPA-ARC-001`; tareas específicas del servicio |
| `public`                                       | contenedor actual multi-capacidad, no dominio               | `SUPA-ARC-004`                                  |
| API, vistas y RPC expuestas                    | capa de contrato, no autoridad empresarial                  | `SUPA-ARC-005`                                  |
| helpers, secretos y lógica privada             | capa privada técnica                                        | `SUPA-ARC-006`                                  |
| auditoría, outbox y eventos                    | capa transversal que conserva productor y dominio de origen | `SUPA-ARC-007`; `SUPA-ARC-019`                  |
| Storage, Realtime, Edge, webhooks y cron       | servicios de transporte o ejecución                         | `SUPA-ARC-018` a `SUPA-ARC-020`                 |
| integración externa                            | adaptador entre propietarios, no dominio interno            | `SUPA-ARC-020`; BLOQUE X                        |

#### 15. Riesgos restringidos y carryover

| Riesgo         | Efecto de esta tarea                                                                | Resolución restante                                             |
| -------------- | ----------------------------------------------------------------------------------- | --------------------------------------------------------------- |
| `RSK-SUPA-006` | separa pedido, pago y reconocimiento financiero                                     | `SUPA-ARC-003`; `SUPA-ARC-016`; `SUPA-ARC-017`; `SUPA-ARC-020`  |
| `RSK-SUPA-011` | separa vínculo laboral, asistencia e identidad-autorización                         | `SUPA-ARC-003`; `SUPA-ARC-008` a `SUPA-ARC-010`; `SUPA-ARC-016` |
| `RSK-SUPA-012` | establece `VDOM-012` como responsabilidad de inventario                             | `SUPA-ARC-003`; `SUPA-ARC-012`; `SUPA-ARC-016`; `SUPA-ARC-017`  |
| `RSK-SUPA-013` | asigna los 20 procesos sin fuente a un dominio necesario sin inventar fuente actual | `SUPA-ARC-003`; `SUPA-ARC-016`; paquetes E5 propietarios        |
| `RSK-SUPA-016` | elimina ambigüedad conceptual de dominio y autoridad para los 69 procesos           | `SUPA-ARC-003`; `SUPA-ARC-016`; `SUPA-ARC-017`; transición      |
| `RSK-SUPA-017` | confirma que `public` no es dominio                                                 | `SUPA-ARC-003` a `SUPA-ARC-005`                                 |
| `RSK-SUPA-018` | excluye VITAL de la taxonomía de Vento OS y exige frontera contractual              | `SUPA-ARC-003`; `SUPA-ARC-023`; `SUPA-ARC-024`                  |
| `RSK-SUPA-033` | asigna identidades de dominio para catalogar objetos sin inferir desde schema       | `SUPA-ARC-003`; `SUPA-ARC-011`; `SUPA-ARC-016`; `SHELL-CI-017`  |

Ningún riesgo queda aceptado, mitigado o cerrado por esta definición. La taxonomía reduce ambigüedad y prepara decisiones físicas verificables.

#### 16. Decisiones reservadas

| Decisión                                                           | Tarea propietaria                   |
| ------------------------------------------------------------------ | ----------------------------------- |
| schema propietario de cada fuente, proyección y objeto             | `SUPA-ARC-003`                      |
| función futura de `public`                                         | `SUPA-ARC-004`                      |
| superficies expuestas y privadas                                   | `SUPA-ARC-005`; `SUPA-ARC-006`      |
| auditoría y eventos                                                | `SUPA-ARC-007`; `SUPA-ARC-019`      |
| detalle de Auth, identidad, principal y sesión                     | `SUPA-ARC-008` a `SUPA-ARC-010`     |
| nombres físicos, claves, funciones y triggers                      | `SUPA-ARC-011` a `SUPA-ARC-014`     |
| exposición, contratos y escrituras entre dominios                  | `SUPA-ARC-015` a `SUPA-ARC-017`     |
| Storage, automatización, rendimiento, retención, tipos y ambientes | `SUPA-ARC-018` a `SUPA-ARC-024`     |
| consolidación mediante ADR                                         | `SUPA-ARC-025`                      |
| movimientos, compatibilidad, backfills y retiros                   | `SUPA-TRANS-001` a `SUPA-TRANS-015` |

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

| Control                        |      Resultado esperado |
| ------------------------------ | ----------------------: |
| dominios únicos                |                  **26** |
| IDs consecutivos               | `VDOM-001` a `VDOM-026` |
| capacidades cubiertas          |            **18 de 18** |
| procesos cubiertos             |            **69 de 69** |
| procesos duplicados            |                   **0** |
| procesos sin dominio           |                   **0** |
| dominios físicos asignados     |                   **0** |
| fronteras de producto externas |                   **1** |
| requisitos nuevos              |                  **32** |
| cambios físicos                |                   **0** |

#### 21. Continuidad inmediata

```text
ÚLTIMA TAREA APROBADA
SUPA-ARC-001 — Definir principios de separación entre esquemas administrados y empresariales
        ↓
TAREA ACTUAL APROBADA
SUPA-ARC-002 — Definir dominios empresariales estables
        ↓
SIGUIENTE TAREA RESERVADA
SUPA-ARC-003 — Definir esquema propietario de cada fuente de verdad
```

`SUPA-ARC-003` permanece reservada y no se inicia sin aprobación expresa de esta tarea y una nueva solicitud de continuidad.


### ✅ SUPA-ARC-003 — Definir esquema propietario de cada fuente de verdad

**Estado:** APROBADA
**Fecha de preparación documental:** 2026-07-29
**Bloque propietario:** BLOQUE E3 — Arquitectura canónica de datos y gobierno integral de Supabase
**Tarea anterior:** `SUPA-ARC-002 — Definir dominios empresariales estables` — APROBADA
**Siguiente tarea:** SUPA-ARC-004 — Definir función futura de `public`
**Proyecto de referencia:** `vento-os-dev` — `clzdpinthhtknkmefsxx`
**Repositorio canónico:** `devVentoGroup/vento-shell` — rama `main`; commit remoto observado `529c475fe7e4173211ba0e95dce4ffd376420fce`
**Tipo de tarea:** definición normativa de owner schemas y autoridad de fuentes de verdad; sin crear, renombrar o mover schemas u objetos, sin DDL, DML, migraciones, backfills, cambios de `public`, Data API, grants, RLS, Auth, Storage, Realtime, Edge Functions, cron, secretos, código, datos ni despliegues

#### 1. Objetivo

Asignar a cada uno de los 26 dominios empresariales estables un owner schema único y explícito que gobierne sus fuentes de verdad, de modo que toda tabla autoritativa, proceso, proyección, función, trigger, recurso administrado o ausencia de fuente pueda resolver una autoridad sin inferirla desde la aplicación, el schema actual, el owner PostgreSQL, el consumidor o la superficie de exposición.

```text
26 DOMINIOS EMPRESARIALES ESTABLES
        +
69 PROCESOS + 379 RELACIONES VENTO
        ↓
26 OWNER SCHEMAS UNO A UNO
        +
54 RELACIONES VITAL FUERA DE VENTO OS
        +
2 RELACIONES TEMPORALES O LEGACY SIN OWNER EMPRESARIAL
        ↓
AUTORIDAD LÓGICA COMPLETA SIN CAMBIOS FÍSICOS
```

La asignación aprobada define el namespace propietario objetivo de las fuentes. No materializa schemas, no mueve objetos y no decide todavía la función futura de `public`, la capa expuesta, la capa privada, auditoría, eventos, exposición, contratos de lectura o escrituras cruzadas.

#### 2. Artefacto producido

```text
SUPABASE-AUTHORITATIVE-SCHEMA-OWNERSHIP-REGISTRY-001@1.0.0
```

| Propiedad                              |                         Valor |
| -------------------------------------- | ----------------------------: |
| `owner_schema_count`                   |                        **26** |
| `owner_schema_id_range`                | `VSCHEMA-001` a `VSCHEMA-026` |
| `stable_domains_assigned`              |                  **26 de 26** |
| `processes_assigned`                   |                  **69 de 69** |
| `vento_os_business_relations_in_scope` |                       **323** |
| `external_vital_relations`             |                        **54** |
| `temporary_or_legacy_relations`        |                         **2** |
| `vento_governed_relations_total`       |                       **379** |
| `platform_managed_relations`           |                       **261** |
| `application_named_owner_schemas`      |                         **0** |
| `physical_changes_authorized`          |                         **0** |

#### 3. Fuentes canónicas consumidas

| Fuente                                                        | Decisión consumida                                                                                                               |
| ------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| `SUPABASE-SCHEMA-SEPARATION-PRINCIPLES-001@1.0.0`             | principios `SEP-001` a `SEP-024`, separación entre plataforma, autoridad, exposición y ubicación                                 |
| `SUPABASE-STABLE-BUSINESS-DOMAIN-REGISTRY-001@1.0.0`          | 26 dominios `VDOM-001` a `VDOM-026` y partición exacta de 69 procesos                                                            |
| `SUPABASE-OBJECT-CAPABILITY-OWNERSHIP-CONSUMER-MAP-022@1.0.0` | 379 relaciones Vento, 347 funciones, 196 triggers, 14 buckets, 24 Edge Functions, siete cron jobs y 261 relaciones administradas |
| `SUPABASE-PROCESS-DATA-RPC-EVENT-APPLICATION-MAP-023@1.0.0`   | fuentes actuales, ausencias, fragmentaciones, comandos, eventos y aplicaciones de `VPROC-0001` a `VPROC-0069`                    |
| `SUPABASE-CONSOLIDATED-RISK-REGISTER-001@1.0.0`               | riesgos `RSK-SUPA-006`, `011`, `012`, `013`, `016`, `017`, `018`, `033` y gates de ownership                                     |
| `01_PRINCIPIOS_OBLIGATORIOS.md` de E3                         | schema como frontera lógica, dominio como responsabilidad y aplicación como consumidora                                          |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`            | 4.881 requisitos hasta `SUPA-ARC-002`; rango `TREQ-SUPABASE-001` a `586`                                                         |

#### 4. Definiciones normativas

| Concepto                  | Definición                                                                                                            | Consecuencia                                                                                       |
| ------------------------- | --------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- |
| owner schema              | namespace empresarial objetivo que posee las tablas autoritativas de un único dominio estable                         | controla nombres, invariantes, ciclo de vida y autoridad de sus fuentes; no concede acceso cliente |
| owner schema lógico       | autoridad asignada aunque el objeto continúe temporalmente en `public`, `pass`, `pos`, `talento` u otro schema actual | permite diseñar transición sin declarar materialización inexistente                                |
| tabla autoritativa        | relación que representa identidad, estado, corrección y cierre del hecho del dominio                                  | debe residir finalmente en un solo owner schema                                                    |
| proyección                | vista, alias, caché, snapshot o tabla de compatibilidad derivada de una fuente                                        | conserva `source_owner_schema`; no crea autoridad ni escritura independiente                       |
| objeto dependiente        | índice, constraint, secuencia, política, grant, partición o trigger interno                                           | hereda owner schema del objeto principal                                                           |
| función de dominio        | función cuya consulta o efecto pertenece a un solo dominio                                                            | hereda owner schema por efecto, no por ubicación actual                                            |
| coordinador interdominio  | comando, worker o automatismo que enlaza varias autoridades                                                           | no crea schema compartido; usa contratos definidos posteriormente                                  |
| recurso administrado      | objeto de Auth, Storage, Realtime, cron, net, Vault, PostgreSQL o extensión                                           | permanece administrado y referencia el owner schema del efecto cuando corresponda                  |
| owner de producto externo | autoridad de VITAL fuera de Vento OS                                                                                  | no participa en `VSCHEMA-001` a `VSCHEMA-026`                                                      |

#### 5. Decisión de cardinalidad

La arquitectura objetivo adopta una relación deliberada **uno a uno** entre dominio estable y owner schema:

```text
1 VDOM
  =
1 VSCHEMA
  =
1 NOMBRE DE OWNER SCHEMA
  =
1 AUTORIDAD PRIMARIA PARA SUS FUENTES
```

Esta decisión no surge automáticamente del número de dominios. Se adopta porque los 26 dominios ya demostraron ciclos de vida, invariantes, correcciones, sensibilidades y propietarias funcionales diferenciadas. Agruparlos físicamente volvería a mezclar fronteras que `SUPA-ARC-002` separó expresamente. La capa expuesta posterior evita que las aplicaciones necesiten consumir directamente los 26 namespaces.

Reglas:

1. ningún owner schema gobernará dos dominios;
2. ningún dominio tendrá dos owner schemas;
3. una aplicación podrá consumir varios owner schemas sin recibir uno propio;
4. una referencia compartida tendrá una sola autoridad y múltiples consumidoras;
5. un proceso interdominio coordinará fuentes distintas sin fusionarlas;
6. todo nombre permanecerá estable aunque cambien aplicaciones o equipos;
7. la creación física requerirá transición posterior por objeto.

#### 6. Registro canónico de owner schemas

| ID            | Owner schema             | Dominio propietario                                               | Fuente de verdad gobernada        | Evidencia física actual                                                                                                                                     | Estado AS-IS                     | Driver de frontera                                                                | Procesos primarios                                                                 |
| ------------- | ------------------------ | ----------------------------------------------------------------- | --------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------- | --------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- |
| `VSCHEMA-001` | `org_governance`         | `VDOM-001` — Gobierno organizacional                              | fuentes autoritativas del dominio | public.sites, public.areas, public.area_kinds y reglas organizativas; decisiones, compromisos, riesgos y relaciones institucionales aún sin fuente integral | `PARTIAL_CURRENT`                | estructura, decisiones, obligaciones y gobierno                                   | `VPROC-0001`; `VPROC-0002`; `VPROC-0003`; `VPROC-0004`; `VPROC-0063`; `VPROC-0064` |
| `VSCHEMA-002` | `recruiting`             | `VDOM-002` — Reclutamiento y selección                            | fuentes autoritativas del dominio | talento.vacancies, talento.candidates, talento.applications, entrevistas, evaluaciones y ofertas                                                            | `FUTURE_OR_PARTIAL`              | datos personales de candidatos y decisiones de selección                          | `VPROC-0005`                                                                       |
| `VSCHEMA-003` | `workforce`              | `VDOM-003` — Vinculación y ciclo laboral                          | fuentes autoritativas del dominio | public.employees, invitaciones, asignaciones laborales, enlaces candidato-trabajador y preboarding; desempeño y offboarding integrales incompletos          | `PARTIAL_OR_FRAGMENTED_CURRENT`  | expediente laboral, vigencia, asignaciones y retiro                               | `VPROC-0006`; `VPROC-0011`; `VPROC-0065`                                           |
| `VSCHEMA-004` | `work_scheduling`        | `VDOM-004` — Programación y novedades laborales                   | fuentes autoritativas del dominio | public.employee_shifts, eventos de calendario y viso.shift_generation_* / viso.site_*                                                                       | `PARTIAL_CURRENT`                | programación publicada, disponibilidad y novedades laborales                      | `VPROC-0007`; `VPROC-0009`                                                         |
| `VSCHEMA-005` | `attendance`             | `VDOM-005` — Asistencia y tiempo trabajado                        | fuentes autoritativas del dominio | public.attendance_logs, attendance_breaks, attendance_shift_events, attendance_sync_conflicts y equivalentes vigentes                                       | `CURRENT_AUTHORITY_PRESENT`      | hechos temporales laborales y correcciones auditables                             | `VPROC-0008`                                                                       |
| `VSCHEMA-006` | `payroll`                | `VDOM-006` — Nómina y beneficios laborales                        | fuentes autoritativas del dominio | sin fuente canónica de nómina o beneficios; solo insumos desde trabajador, asistencia y novedades                                                           | `NO_CANONICAL_SOURCE`            | información salarial, deducciones y beneficios                                    | `VPROC-0010`                                                                       |
| `VSCHEMA-007` | `operational_compliance` | `VDOM-007` — Salud, seguridad, inocuidad y cumplimiento operativo | fuentes autoritativas del dominio | sin fuente relacional integral; documentos, activos e inventario son únicamente referencias o evidencia                                                     | `NO_CANONICAL_SOURCE`            | salud, incidentes, inspecciones, inocuidad, acciones correctivas y EPP            | `VPROC-0012`; `VPROC-0013`; `VPROC-0014`; `VPROC-0066`                             |
| `VSCHEMA-008` | `product_catalog`        | `VDOM-008` — Producto maestro y especificaciones                  | fuentes autoritativas del dominio | public.products, product_categories, product_uom_profiles, product_inventory_profiles, imágenes, aliases y especificaciones                                 | `PARTIAL_CURRENT`                | identidad, unidad, presentación, especificación y calidad maestra                 | `VPROC-0015`; `VPROC-0018`                                                         |
| `VSCHEMA-009` | `recipes`                | `VDOM-009` — Recetas y conocimiento productivo                    | fuentes autoritativas del dominio | public.recipes, recipe_cards, recipe_steps, recipe_outputs, recipe_site_uses y reglas de aplicabilidad                                                      | `PARTIAL_CURRENT`                | conocimiento productivo versionado y rendimientos teóricos                        | `VPROC-0016`                                                                       |
| `VSCHEMA-010` | `commercial_offer`       | `VDOM-010` — Oferta comercial y disponibilidad                    | fuentes autoritativas del dominio | pass.catalog_*, pass.commercial_*, sell_products_by_site y configuración comercial actual                                                                   | `FRAGMENTED_CURRENT`             | surtido, configuración vendible, precio y publicación por canal                   | `VPROC-0017`                                                                       |
| `VSCHEMA-011` | `procurement`            | `VDOM-011` — Abastecimiento y proveedores                         | fuentes autoritativas del dominio | public.suppliers, product_suppliers, purchase_orders, procurement_receptions, precios y condiciones acordadas                                               | `PARTIAL_CURRENT`                | proveedores, compras, recepción comercial y diferencias                           | `VPROC-0019`; `VPROC-0020`; `VPROC-0021`; `VPROC-0022`                             |
| `VSCHEMA-012` | `inventory`              | `VDOM-012` — Inventario y almacenamiento                          | fuentes autoritativas del dominio | public.inventory_*, restock_*, remission_* vinculadas al abastecimiento interno, LOC, posiciones, LPN, stock, movimientos y conteos                         | `CURRENT_AUTHORITY_WITH_GAPS`    | cantidades, unidades, ubicaciones, lotes, condición y conciliación física         | `VPROC-0023`; `VPROC-0024`; `VPROC-0025`; `VPROC-0026`; `VPROC-0027`; `VPROC-0028` |
| `VSCHEMA-013` | `assets`                 | `VDOM-013` — Activos, mantenimiento y reutilizables               | fuentes autoritativas del dominio | public.asset_*, product_asset_*, reutilizables y referencias LPN; vehículos y entidad kit aún sin fuente completa                                           | `PARTIAL_CURRENT`                | identidad durable, custodia, condición, mantenimiento y retorno                   | `VPROC-0029`; `VPROC-0030`; `VPROC-0031`; `VPROC-0032`; `VPROC-0067`               |
| `VSCHEMA-014` | `production`             | `VDOM-014` — Producción y calidad de lote                         | fuentes autoritativas del dominio | public.production_*, rutas de producción, paquetes y ejecución de lotes; liberación y reproceso integrales incompletos                                      | `PARTIAL_CURRENT`                | lote, consumo, salida, calidad, empaque y cierre productivo                       | `VPROC-0033`; `VPROC-0034`; `VPROC-0035`; `VPROC-0036`; `VPROC-0037`               |
| `VSCHEMA-015` | `sales_orders`           | `VDOM-015` — Pedidos y operación de venta                         | fuentes autoritativas del dominio | public.orders, order_items, order_status_events, pos.pos_sessions, pos_session_orders, mesas, zonas y modificadores                                         | `FRAGMENTED_CURRENT`             | compromiso comercial, ítems, servicio, estado, cancelación y devolución           | `VPROC-0038`; `VPROC-0039`; `VPROC-0040`; `VPROC-0041`; `VPROC-0042`               |
| `VSCHEMA-016` | `payments`               | `VDOM-016` — Pagos, caja y soporte fiscal                         | fuentes autoritativas del dominio | payments.transactions, payments.webhook_events, pos.pos_payments, pos_cash_*, billing requests y documentos fiscales operativos                             | `FRAGMENTED_CURRENT`             | dinero, caja, recaudo, webhook, cierre y soporte fiscal                           | `VPROC-0043`; `VPROC-0044`                                                         |
| `VSCHEMA-017` | `customer_engagement`    | `VDOM-017` — Clientes, fidelización y experiencia                 | fuentes autoritativas del dominio | public.users y perfiles de cliente, pass.loyalty_*, club.wallet_*, beneficios, favoritos, reclamos, reservas y satisfacción                                 | `FRAGMENTED_CURRENT`             | identidad de cliente, consentimiento, saldo, beneficios y experiencia             | `VPROC-0045`; `VPROC-0046`; `VPROC-0047`; `VPROC-0068`                             |
| `VSCHEMA-018` | `logistics`              | `VDOM-018` — Logística, transporte y entrega                      | fuentes autoritativas del dominio | remission_shipments, receipts, dispatch runs, delivery sessions, pass.delivery_*, rutas, prueba de entrega y secretos de capacidad vinculados               | `PARTIAL_OR_EXTERNAL_FRAGMENTED` | ruta, carga, custodia, entrega, novedad, retorno y tercero logístico              | `VPROC-0048`; `VPROC-0049`; `VPROC-0050`                                           |
| `VSCHEMA-019` | `finance`                | `VDOM-019` — Finanzas y control económico                         | fuentes autoritativas del dominio | public.numera_*, cost_centers, expenses, periods, budgets, product_cost_events y proyecciones económicas; CxP/CxC aún sin ledger integral                   | `PARTIAL_CURRENT`                | hechos económicos, obligaciones, cartera, costos, presupuesto y cierre            | `VPROC-0051`; `VPROC-0052`; `VPROC-0053`; `VPROC-0054`; `VPROC-0069`               |
| `VSCHEMA-020` | `facilities`             | `VDOM-020` — Instalaciones y condiciones físicas                  | fuentes autoritativas del dominio | sin orden de trabajo integral; asset_maintenance_records y support_tickets solo aportan referencias parciales                                               | `NO_CANONICAL_SOURCE`            | espacio, limpieza, plagas, servicios, reparación e incidencia física              | `VPROC-0055`                                                                       |
| `VSCHEMA-021` | `marketing`              | `VDOM-021` — Comunicación, marketing y oportunidades              | fuentes autoritativas del dominio | public.announcements, app_content_blocks, website_blocks/items, promociones y colecciones; campañas y oportunidades AURA incompletas                        | `FUTURE_OR_PARTIAL`              | contenido, campaña, promoción, publicación, reputación y oportunidad              | `VPROC-0056`; `VPROC-0057`                                                         |
| `VSCHEMA-022` | `technology_operations`  | `VDOM-022` — Tecnología y soporte                                 | fuentes autoritativas del dominio | public.apps, app_config, runtime/update policies, screen registry, dispositivos, redes y support_tickets/messages                                           | `PARTIAL_CURRENT`                | servicios tecnológicos, configuración, dispositivos, cambios e incidentes         | `VPROC-0058`                                                                       |
| `VSCHEMA-023` | `identity_access`        | `VDOM-023` — Identidad empresarial y autorización                 | fuentes autoritativas del dominio | roles, permisos, scopes, asignaciones, contexto, simulación, dispositivos compartidos, sesiones actor y revocación; auth.users permanece administrado       | `PARTIAL_OR_FRAGMENTED_CURRENT`  | principal, actor, permiso, contexto, sesión, firma y revocación                   | `VPROC-0059`                                                                       |
| `VSCHEMA-024` | `business_records`       | `VDOM-024` — Información documental y evidencia                   | fuentes autoritativas del dominio | public.documents, document_types, required_document_rules, asset_documents y metadata empresarial vinculada a objetos físicos de Storage                    | `FRAGMENTED_CURRENT`             | clasificación, expediente, versión, custodia, retención, legal hold y disposición | `VPROC-0060`                                                                       |
| `VSCHEMA-025` | `business_insights`      | `VDOM-025` — Medición, analítica y mejora                         | fuentes autoritativas del dominio | viso.demand_forecasts, demand_history_hourly, métricas, snapshots, reportes y casos de mejora aún parciales                                                 | `PARTIAL_CURRENT`                | definición de métrica, corte, análisis, decisión y verificación de mejora         | `VPROC-0061`                                                                       |
| `VSCHEMA-026` | `operational_continuity` | `VDOM-026` — Continuidad operativa e incidentes de servicio       | fuentes autoritativas del dominio | sin registro integral; soporte, configuraciones y automatismos de recuperación son auxiliares                                                               | `NO_CANONICAL_SOURCE`            | dependencia crítica, degradación, operación mínima, recuperación y reconciliación | `VPROC-0062`                                                                       |

Los nombres anteriores son identificadores físicos objetivo aprobados. `SUPA-ARC-011` definirá la convención general para objetos y podrá validarlos, pero no los renombrará sin una modificación arquitectónica explícita.

#### 7. Matriz de descomposición de schemas actuales

| Schema actual | Owner schemas lógicos resultantes                                                                         | Decisión                                                                                               |
| ------------- | --------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `public`      | los owner schemas aplicables de `VSCHEMA-001` a `VSCHEMA-026`, más clases de proyección, técnica o legacy | no conserva autoridad universal; cada objeto deberá resolver por semántica                             |
| `talento`     | `recruiting`; `workforce` cuando el objeto materialice el handoff laboral                                 | el nombre de canal o módulo futuro no define la autoridad                                              |
| `viso`        | `work_scheduling`; `business_insights`; cualquier otra autoridad se resolverá por objeto                  | la aplicación VISO no recibe schema objetivo propio                                                    |
| `pass`        | `commercial_offer`; `customer_engagement`; `logistics`                                                    | catálogo comercial, cliente y entrega se separan                                                       |
| `club`        | `customer_engagement`; evidencia técnica o auditoría conserva owner de origen                             | membresía, wallet y fidelización no crean un dominio CLUB                                              |
| `payments`    | `payments`                                                                                                | la coincidencia nominal no autoriza conservar objetos sin revisión de fuente, consumidores y seguridad |
| `pos`         | `sales_orders`; `payments`                                                                                | servicio y pedido se separan de caja, pago y soporte fiscal                                            |
| `app_private` | owner schema lógico del efecto; ubicación privada reservada para `SUPA-ARC-006`                           | no es dominio ni autoridad empresarial                                                                 |
| `vital`       | owner de producto externo VITAL                                                                           | permanece fuera de Vento OS; aislamiento físico posterior reservado                                    |

#### 8. Asignación de procesos sin fuente canónica actual

Los veinte procesos identificados como `NO_CANONICAL_SOURCE` conservan esa condición. La tarea solo fija dónde deberá nacer su fuente futura:

| Proceso      | Owner schema futuro      | Estado                |
| ------------ | ------------------------ | --------------------- |
| `VPROC-0001` | `org_governance`         | `NO_CANONICAL_SOURCE` |
| `VPROC-0004` | `org_governance`         | `NO_CANONICAL_SOURCE` |
| `VPROC-0010` | `payroll`                | `NO_CANONICAL_SOURCE` |
| `VPROC-0012` | `operational_compliance` | `NO_CANONICAL_SOURCE` |
| `VPROC-0013` | `operational_compliance` | `NO_CANONICAL_SOURCE` |
| `VPROC-0014` | `operational_compliance` | `NO_CANONICAL_SOURCE` |
| `VPROC-0066` | `operational_compliance` | `NO_CANONICAL_SOURCE` |
| `VPROC-0031` | `assets`                 | `NO_CANONICAL_SOURCE` |
| `VPROC-0067` | `assets`                 | `NO_CANONICAL_SOURCE` |
| `VPROC-0035` | `production`             | `NO_CANONICAL_SOURCE` |
| `VPROC-0041` | `sales_orders`           | `NO_CANONICAL_SOURCE` |
| `VPROC-0047` | `customer_engagement`    | `NO_CANONICAL_SOURCE` |
| `VPROC-0068` | `customer_engagement`    | `NO_CANONICAL_SOURCE` |
| `VPROC-0052` | `finance`                | `NO_CANONICAL_SOURCE` |
| `VPROC-0053` | `finance`                | `NO_CANONICAL_SOURCE` |
| `VPROC-0055` | `facilities`             | `NO_CANONICAL_SOURCE` |
| `VPROC-0062` | `operational_continuity` | `NO_CANONICAL_SOURCE` |
| `VPROC-0063` | `org_governance`         | `NO_CANONICAL_SOURCE` |
| `VPROC-0064` | `org_governance`         | `NO_CANONICAL_SOURCE` |
| `VPROC-0065` | `workforce`              | `NO_CANONICAL_SOURCE` |

No se acepta usar documentos, tickets, vistas, hojas de cálculo, tablas auxiliares o señales técnicas como sustituto implícito de estas veinte fuentes.

#### 9. Reglas por clase de objeto

| Clase                                    | Regla de owner schema                                                        | Ubicación física                                             |
| ---------------------------------------- | ---------------------------------------------------------------------------- | ------------------------------------------------------------ |
| tabla autoritativa                       | exactamente un owner schema según `VSCHEMA-*`                                | owner schema correspondiente, después de transición aprobada |
| vista o proyección                       | hereda `source_owner_schema`; no recibe autoridad propia                     | decisión reservada a `SUPA-ARC-004` y `SUPA-ARC-005`         |
| alias o compatibilidad                   | hereda fuente, declara consumidores y fecha de salida                        | transición y deprecación posteriores                         |
| función de consulta                      | owner por dato consultado; sin mutación lateral                              | convención y capa reservadas a `SUPA-ARC-005`, `011` y `013` |
| función de comando                       | owner por efecto empresarial y proceso                                       | contrato reservado a `SUPA-ARC-013` a `017`                  |
| trigger function                         | owner del objeto y efecto principal                                          | semántica y seguridad reservadas a `SUPA-ARC-013` y `014`    |
| índice, constraint, secuencia o política | hereda objeto principal                                                      | junto al objeto o según soporte de plataforma                |
| auditoría, evento u outbox               | conserva dominio productor y referencia al owner schema                      | capa reservada a `SUPA-ARC-007` y `019`                      |
| helper o secreto privado                 | owner lógico por efecto; no fuente empresarial                               | capa reservada a `SUPA-ARC-006`                              |
| objeto Storage                           | `storage` administra bytes; metadata resuelve owner empresarial              | `storage` administrado más metadata Vento                    |
| objeto Auth                              | `auth` administra autenticación; identidad empresarial resuelve schema Vento | `auth` administrado más vínculos soportados                  |
| recurso Realtime, Edge o cron            | propietario por efecto, sin autoridad de fuente                              | servicio administrado o despliegue técnico                   |
| objeto VITAL                             | owner externo VITAL                                                          | frontera física reservada a `SUPA-ARC-023` y `024`           |
| backup o staging                         | sin owner schema empresarial                                                 | retención o retiro posterior                                 |

#### 10. Fuentes compartidas y referencias transversales

1. empresa, sede y área pertenecen a `org_governance`; los demás schemas conservan sus identificadores, no copias autoritativas;
2. trabajador pertenece a `workforce`; programación, asistencia, nómina e identidad-acceso referencian su identidad empresarial;
3. producto pertenece a `product_catalog`; recetas, oferta, compras, inventario, producción, pedidos y finanzas lo referencian;
4. pedido pertenece a `sales_orders`; pagos, logística, cliente y finanzas conservan sus propios hechos correlacionados;
5. cliente pertenece a `customer_engagement`; Auth solo identifica la sesión técnica;
6. documento empresarial pertenece a `business_records`, pero no sustituye el hecho del dominio que respalda;
7. métrica o snapshot pertenece a `business_insights`, pero no corrige la fuente operacional;
8. toda referencia entre schemas será calificada y deberá sobrevivir a cambios de `search_path`;
9. una FK, trigger, grant, vista o consumo no transferirá autoridad;
10. las escrituras y transacciones interdominio quedan reservadas a `SUPA-ARC-016` y `017`.

#### 11. Separación de plataforma y capas técnicas

| Superficie                                                                                                                          | Owner schema empresarial               | Tratamiento                                         |
| ----------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------- | --------------------------------------------------- |
| `auth`, `storage`, `realtime`, `cron`, `net`, `vault`, `extensions`, `graphql`, schemas internos PostgreSQL y `supabase_migracións` | ninguno                                | administrados; solo referencias y puntos soportados |
| `public`                                                                                                                            | ninguno                                | función futura reservada a `SUPA-ARC-004`           |
| API, vistas y RPC expuestas                                                                                                         | owner de origen, no autoridad propia   | capa reservada a `SUPA-ARC-005`                     |
| `app_private`, helpers, secretos y adaptadores                                                                                      | owner de origen, no autoridad propia   | capa reservada a `SUPA-ARC-006`                     |
| auditoría, outbox y eventos                                                                                                         | owner productor, no fuente transversal | capa reservada a `SUPA-ARC-007` y `019`             |
| integraciones y automatismos                                                                                                        | owner del efecto                       | contratos reservados a `SUPA-ARC-020` y BLOQUE X    |

#### 12. Fronteras críticas resultantes

| Frontera                                        | Owner schemas                                              | Regla                                                                              |
| ----------------------------------------------- | ---------------------------------------------------------- | ---------------------------------------------------------------------------------- |
| candidato → trabajador                          | `recruiting` → `workforce`                                 | handoff autorizado; el candidato no se convierte en trabajador por copiar una fila |
| trabajador → programación → asistencia → nómina | `workforce` → `work_scheduling` → `attendance` → `payroll` | cada etapa conserva su fuente y vigencia                                           |
| producto → receta → oferta                      | `product_catalog` → `recipes` → `commercial_offer`         | identidad, conocimiento y publicación permanecen separados                         |
| compra → inventario → producción                | `procurement` → `inventory` → `production`                 | recepción comercial, efecto físico y lote se concilian                             |
| inventario ↔ activos                            | `inventory` ↔ `assets`                                     | consumible, LPN, reutilizable y activo no se confunden                             |
| pedido → pago → finanzas                        | `sales_orders` → `payments` → `finance`                    | compromiso, recaudo y reconocimiento económico son hechos distintos                |
| cliente ↔ pedido ↔ marketing                    | `customer_engagement` ↔ `sales_orders` ↔ `marketing`       | identidad, transacción y campaña conservan autoridades distintas                   |
| pedido ↔ logística                              | `sales_orders` ↔ `logistics`                               | compromiso comercial y custodia de entrega se correlacionan                        |
| tecnología ↔ autorización                       | `technology_operations` ↔ `identity_access`                | operar un dispositivo o ticket no concede acceso                                   |
| hecho ↔ documento ↔ Storage                     | owner del hecho ↔ `business_records` ↔ `storage`           | fuente, metadata y bytes tienen responsabilidades distintas                        |
| fuente ↔ insight                                | owner del hecho ↔ `business_insights`                      | derivación no transfiere autoridad                                                 |
| incidente especializado ↔ continuidad           | owner especializado ↔ `operational_continuity`             | recuperación coordina sin duplicar el incidente                                    |

#### 13. Estado AS-IS y materialización futura

La asignación de un owner schema objetivo no cambia la clasificación actual de ninguna fuente:

- `CURRENT_AUTHORITY_PRESENT` o `CURRENT_AUTHORITY_WITH_GAPS` no significa que el objeto ya esté en su schema objetivo;
- `PARTIAL_CURRENT`, `PARTIAL_OR_FRAGMENTED_CURRENT`, `FRAGMENTED_CURRENT`, `PARTIAL_OR_EXTERNAL_FRAGMENTED` y `FUTURE_OR_PARTIAL` mantienen sus brechas;
- `NO_CANONICAL_SOURCE` mantiene ausencia de fuente;
- un nombre actual coincidente, especialmente `payments`, no acredita paridad ni permite conservar objetos automáticamente;
- la materialización requiere mapa por objeto, dependencias, datos, consumidores, compatibilidad, backfill, pruebas, observabilidad y rollback;
- ningún riesgo queda mitigado, aceptado o cerrado por esta tarea.

#### 14. Riesgos restringidos y carryover

| Riesgo         | Efecto de esta tarea                                                                      | Resolución restante                            |
| -------------- | ----------------------------------------------------------------------------------------- | ---------------------------------------------- |
| `RSK-SUPA-006` | separa físicamente las autoridades objetivo de pedido, pago y finanzas                    | `SUPA-ARC-016`; `017`; `020`; transición       |
| `RSK-SUPA-011` | asigna workforce, scheduling, attendance, payroll e identity_access a fronteras distintas | `SUPA-ARC-008` a `010`; `016`; transición      |
| `RSK-SUPA-012` | fija `inventory` como owner schema del stock y separa activos y producción                | `SUPA-ARC-012`; `016`; `017`; transición       |
| `RSK-SUPA-013` | asigna owner schema futuro a los 20 procesos sin fuente                                   | paquetes E5; `SUPA-ARC-016`; transición        |
| `RSK-SUPA-016` | elimina ambigüedad de owner schema para los dominios y procesos                           | `SUPA-ARC-016`; `017`; `SUPA-TRANS-*`          |
| `RSK-SUPA-017` | retira a `public` de toda autoridad empresarial objetivo                                  | `SUPA-ARC-004`; `005`; transición              |
| `RSK-SUPA-018` | conserva VITAL fuera de los 26 owner schemas                                              | `SUPA-ARC-023`; `024`; decisión de aislamiento |
| `RSK-SUPA-033` | crea identidades `VSCHEMA-*` y nombres exactos para el catálogo ejecutable                | `SUPA-ARC-011`; `016`; `SHELL-CI-017`          |

#### 15. Decisiones reservadas

| Decisión                                                                     | Tarea propietaria                   |
| ---------------------------------------------------------------------------- | ----------------------------------- |
| función futura de `public`                                                   | `SUPA-ARC-004`                      |
| capa expuesta de vistas y RPC                                                | `SUPA-ARC-005`                      |
| capa privada de helpers y lógica                                             | `SUPA-ARC-006`                      |
| auditoría, eventos y outbox                                                  | `SUPA-ARC-007`; `SUPA-ARC-019`      |
| Auth, identidad técnica, principal y sesión                                  | `SUPA-ARC-008` a `SUPA-ARC-010`     |
| convenciones generales de schemas, tablas y columnas                         | `SUPA-ARC-011`                      |
| claves, constraints, funciones y triggers                                    | `SUPA-ARC-012` a `SUPA-ARC-014`     |
| exposición, RLS, contratos y escrituras interdominio                         | `SUPA-ARC-015` a `SUPA-ARC-017`     |
| Storage, Realtime, automatización, rendimiento, retención, tipos y ambientes | `SUPA-ARC-018` a `SUPA-ARC-024`     |
| consolidación mediante ADR                                                   | `SUPA-ARC-025`                      |
| creación, movimientos, compatibilidad, backfills y retiros                   | `SUPA-TRANS-001` a `SUPA-TRANS-015` |

#### 16. Límites de autorización

Esta tarea no autoriza:

- crear los 26 schemas;
- renombrar, mover, dividir, fusionar o retirar objetos;
- modificar `public`, `app_private` o schemas administrados;
- alterar Data API, GraphQL, grants, RLS, owners PostgreSQL o privilegios;
- cambiar Auth, Storage, Realtime, Edge Functions, cron, Vault, secretos o configuración;
- ejecutar migraciones, DDL, DML, backfills, merges, eliminaciones o despliegues;
- convertir proyecciones o estructuras parciales en fuentes certificadas;
- cambiar propietarias o consumidoras aprobadas de los procesos;
- declarar resuelto un riesgo o una brecha AS-IS.

#### 17. Requisitos de prueba generados

**Resultado:** GENERA REQUISITOS DE PRUEBA.

Se incorporan al Registro Canónico de Requisitos de Prueba:

```text
TREQ-SUPABASE-587 a TREQ-SUPABASE-620
```

Los treinta y cuatro requisitos protegen cardinalidad y nombres de owner schemas, cobertura de dominios, procesos y relaciones, separación de plataforma, VITAL y legacy, herencia de objetos, fronteras críticas, ausencia de fuentes, límites de exposición y transición, y detección recurrente de drift. El detalle completo existe únicamente en `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`.

#### 18. Criterios de aceptación

- [ ] Existen exactamente 26 owner schemas únicos `VSCHEMA-001` a `VSCHEMA-026`.
- [ ] Los 26 nombres físicos son únicos, lowercase snake_case y no corresponden a aplicaciones ni schemas administrados.
- [ ] Cada `VDOM-*` resuelve a exactamente un `VSCHEMA-*` y viceversa.
- [ ] Los 69 procesos heredan exactamente un owner schema desde su dominio primario.
- [ ] Las 323 relaciones Vento OS tienen regla determinista de owner schema lógico o clase derivada.
- [ ] Las 54 relaciones VITAL permanecen fuera de Vento OS.
- [ ] Las dos relaciones temporales o legacy permanecen sin owner empresarial.
- [ ] Las 261 relaciones administradas permanecen `PLATFORM_MANAGED`.
- [ ] `public` y `app_private` no son owner schemas empresariales.
- [ ] Las veinte ausencias de fuente conservan `NO_CANONICAL_SOURCE` y reciben destino futuro exacto.
- [ ] Tablas autoritativas, proyecciones, funciones, triggers, controles y recursos administrados tienen reglas diferenciadas.
- [ ] Las fronteras de personas, producto, operación, comercio, identidad, documentos, insights y continuidad permanecen separadas.
- [ ] La asignación no concede exposición, autorización ni escritura interdominio.
- [ ] Se generan `TREQ-SUPABASE-587` a `TREQ-SUPABASE-620`.
- [ ] No se ejecutan cambios físicos, código ni implementación.
- [ ] `SUPA-ARC-004` permanece reservada.

#### 19. Controles estructurales requeridos

| Control                                              |            Resultado esperado |
| ---------------------------------------------------- | ----------------------------: |
| owner schemas únicos                                 |                        **26** |
| IDs consecutivos                                     | `VSCHEMA-001` a `VSCHEMA-026` |
| nombres físicos únicos                               |                        **26** |
| dominios asignados                                   |                  **26 de 26** |
| procesos asignados                                   |                  **69 de 69** |
| procesos con dos owner schemas                       |                         **0** |
| procesos sin owner schema                            |                         **0** |
| relaciones Vento OS con regla de owner               |                **323 de 323** |
| relaciones VITAL fuera de Vento OS                   |                  **54 de 54** |
| relaciones temporales o legacy sin owner empresarial |                    **2 de 2** |
| relaciones administradas preservadas                 |                **261 de 261** |
| requisitos nuevos                                    |                        **34** |
| cambios físicos                                      |                         **0** |

#### 20. Continuidad inmediata

```text
ÚLTIMA TAREA APROBADA
SUPA-ARC-002 — Definir dominios empresariales estables
        ↓
TAREA ACTUAL APROBADA
SUPA-ARC-003 — Definir esquema propietario de cada fuente de verdad
        ↓
SIGUIENTE TAREA RESERVADA
SUPA-ARC-004 — Definir función futura de `public`
```

`SUPA-ARC-004` permanece reservada y no se inicia hasta una solicitud expresa de continuidad.


### ✅ SUPA-ARC-004 — Definir función futura de `public`

**Estado:** APROBADA
**Fecha de preparación documental:** 2026-07-29
**Bloque propietario:** BLOQUE E3 — Arquitectura canónica de datos y gobierno integral de Supabase
**Tarea anterior:** `SUPA-ARC-003 — Definir esquema propietario de cada fuente de verdad` — APROBADA
**Siguiente tarea:** `SUPA-ARC-005 — Definir capa expuesta de vistas y RPC`
**Proyecto de referencia:** `vento-os-dev` — `clzdpinthhtknkmefsxx`
**Fuentes remotas observadas:** `04_ARQUITECTURA_CANONICA_OBJETIVO.md` blob `7e8a7e55fd581b4dd8245c1c8af921f43d0bdf46`; `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` blob `9937378f9bdd87d4a19841845001d59fc33d86f3`; `delivery-contract.json` blob `01f197364800a1998867eb4e9a8d104429bb222f`
**Tipo de tarea:** definición normativa de la función objetivo y ciclo de vida de `public`; sin crear, renombrar, mover o retirar objetos, sin DDL, DML, migraciones, backfills, cambios de Data API, grants, RLS, Auth, Storage, Realtime, Edge Functions, cron, secretos, código, datos ni despliegues

#### 1. Objetivo

Definir la función futura de `public` después de asignar los 26 owner schemas empresariales, eliminando su papel de contenedor universal sin romper los consumidores actuales ni anticipar el inventario de la capa expuesta que corresponde a `SUPA-ARC-005`.

```text
PUBLIC ACTUAL MULTICAPACIDAD
        ↓
CLASIFICACIÓN OBJETO POR OBJETO
        ↓
FUENTES AUTORITATIVAS → VSCHEMA-001 A VSCHEMA-026
CONTRATOS CANÓNICOS → CAPA EXPUESTA DE SUPA-ARC-005
LÓGICA PRIVADA → SUPA-ARC-006
AUDITORÍA Y EVENTOS → SUPA-ARC-007 Y SUPA-ARC-019
COMPATIBILIDAD ACTUAL → PUBLIC TEMPORAL CON SALIDA
        ↓
PUBLIC SIN AUTORIDAD EMPRESARIAL
```

La decisión no modifica el schema desplegado. Define la frontera que deberán respetar la capa expuesta, la capa privada, la seguridad y la transición posterior.

#### 2. Artefacto producido

```text
SUPABASE-PUBLIC-SCHEMA-FUTURE-FUNCTION-001@1.0.0
```

| Propiedad                                 |                                                            Valor |
| ----------------------------------------- | ---------------------------------------------------------------: |
| `public_future_role`                      |                           `TRANSITIONAL_COMPATIBILITY_NAMESPACE` |
| `business_domain_authority`               |                                                           `NONE` |
| `owner_schema_identity`                   |                                                           `NONE` |
| `canonical_long_lived_api_role`           |                              `NONE` — reservada a `SUPA-ARC-005` |
| `authoritative_business_tables_target`    |                                                            **0** |
| `direct_client_business_mutations_target` |                                                            **0** |
| `unclassified_public_objects_target`      |                                                            **0** |
| `new_business_sources_allowed`            |                                                            **0** |
| `transitional_compatibility_objects`      |            solo los necesarios, versionados y con gate de salida |
| `terminal_state`                          | vacío de objetos empresariales o excepciones técnicas soportadas |
| `physical_changes_authorized`             |                                                            **0** |

#### 3. Fuentes canónicas consumidas

| Fuente                                                        | Decisión consumida                                                                                                                            |
| ------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| `01_PROTOCOLO.md`                                             | Supabase como plataforma integral, `public` sin destino universal, propietarios y consumidores explícitos, compatibilidad, pruebas y rollback |
| `delivery-contract.json`                                      | archivo de una sola tarea, sin contenido operativo de chat y registro 04A completo con nombre único                                           |
| `active-sequence.json`                                        | secuencia `SUPA-ARC-001` a `SUPA-ARC-025`; tarea actual derivada `SUPA-ARC-004`                                                               |
| `SUPABASE-SCHEMA-SEPARATION-PRINCIPLES-001@1.0.0`             | `SEP-004` a `SEP-007`, `SEP-018`, `SEP-022` y `SEP-024`                                                                                       |
| `SUPABASE-STABLE-BUSINESS-DOMAIN-REGISTRY-001@1.0.0`          | 26 dominios estables; `public` no es dominio                                                                                                  |
| `SUPABASE-AUTHORITATIVE-SCHEMA-OWNERSHIP-REGISTRY-001@1.0.0`  | 26 owner schemas `VSCHEMA-001` a `VSCHEMA-026`; `public` sin autoridad empresarial                                                            |
| `SUPABASE-OBJECT-CAPABILITY-OWNERSHIP-CONSUMER-MAP-022@1.0.0` | universo de objetos, funciones, dependencias y consumidores actuales                                                                          |
| `SUPABASE-PROCESS-DATA-RPC-EVENT-APPLICATION-MAP-023@1.0.0`   | procesos, fuentes, RPC, eventos y aplicaciones que dependen del estado actual                                                                 |
| `SUPABASE-CONSOLIDATED-RISK-REGISTER-001@1.0.0`               | riesgos de concentración, seguridad, legacy, consumidores ocultos, RPC y gobierno de objetos                                                  |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`            | 4.915 requisitos hasta `SUPA-ARC-003`; rango `TREQ-SUPABASE-001` a `620`                                                                      |

#### 4. Decisión canónica

`public` permanecerá como schema técnico existente durante la transición, pero su función objetivo será exclusivamente **compatibilidad temporal no autoritativa**.

Esto implica simultáneamente:

1. no representará dominio, aplicación, producto, proceso ni owner schema;
2. no alojará fuentes empresariales autoritativas en el estado objetivo;
3. no será la capa canónica permanente para contratos nuevos;
4. podrá conservar temporalmente vistas o wrappers estrictamente necesarios para consumidores actuales;
5. cada objeto temporal deberá declarar fuente, consumidor, reemplazo, seguridad, versión, paridad, rollback y gate de salida;
6. cuando termine la transición quedará vacío de objetos empresariales de Vento o contendrá únicamente excepciones técnicas soportadas y no autoritativas;
7. su mera existencia no concederá exposición ni privilegios.

#### 5. Definiciones normativas

| Concepto                                | Definición                                                                                            | Consecuencia                                                                       |
| --------------------------------------- | ----------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- |
| namespace de compatibilidad transitoria | schema que conserva temporalmente nombres o firmas consumidas mientras el contrato canónico se adopta | cada objeto tiene salida obligatoria y no puede recibir nuevas fuentes             |
| fuente autoritativa                     | tabla o agregado que controla identidad, estado, corrección y cierre de un hecho                      | su destino es el owner schema aprobado, nunca `public`                             |
| proyección de compatibilidad            | vista de solo lectura que conserva temporalmente forma o nombre legacy                                | hereda la autoridad de la fuente y no admite mutación                              |
| RPC de compatibilidad                   | wrapper versionado que delega en una consulta o comando canónico                                      | no conserva reglas empresariales ni secretos propios                               |
| capa expuesta canónica                  | superficie de vistas y RPC para consumidores aprobados                                                | su diseño físico y catálogo pertenecen a `SUPA-ARC-005`, no a `public` por defecto |
| excepción técnica soportada             | objeto exigido por plataforma o extensión mediante mecanismo documentado                              | no contiene estado empresarial, no amplía acceso y conserva pruebas de upgrade     |
| estado terminal de `public`             | schema existente sin fuentes ni contratos empresariales activos                                       | compatibilidad residual o elemento sin destino bloquea el cierre                   |

#### 6. Invariantes de arquitectura

1. `public` tendrá **cero owner schemas**, **cero dominios** y **cero fuentes autoritativas** en el estado objetivo.
2. Los 26 owner schemas aprobados conservarán autoridad aunque una vista o wrapper temporal permanezca físicamente en `public`.
3. No se creará ningún objeto empresarial nuevo en `public` por comodidad, default del proveedor, ausencia de decisión o compatibilidad no documentada.
4. Un objeto temporal en `public` no podrá escribir directamente en más de un owner schema ni coordinar transacciones interdominio sin contrato aprobado.
5. Una vista, alias o RPC de compatibilidad no recibirá owner empresarial independiente.
6. Data API, grants, RLS, `EXECUTE`, Realtime y credenciales permanecerán decisiones separadas.
7. Toda referencia deberá ser determinista y sobrevivir a cambios de `search_path`.
8. La compatibilidad tendrá responsable y condición verificable de salida; no se aceptará permanencia indefinida.
9. La ausencia de consumidores localizados no bastará para retirar un objeto.
10. Ninguna decisión de esta tarea cambia el estado AS-IS ni cierra riesgos.

#### 7. Clases de destino obligatorias para objetos actuales

| Clase de destino               | Aplicación                                                               | Autoridad                             | Tarea que completa el diseño       |
| ------------------------------ | ------------------------------------------------------------------------ | ------------------------------------- | ---------------------------------- |
| `MOVE_TO_OWNER_SCHEMA`         | tablas autoritativas, secuencias y dependientes propios del dominio      | owner schema `VSCHEMA-*`              | `SUPA-TRANS-001`; `SUPA-TRANS-005` |
| `MOVE_TO_EXPOSED_LAYER`        | vista o RPC que deba convertirse en contrato canónico estable            | owner de origen; capa sin autoridad   | `SUPA-ARC-005`; `SUPA-TRANS-003`   |
| `MOVE_TO_PRIVATE_LAYER`        | helper, secreto, adaptador o función interna                             | owner del efecto                      | `SUPA-ARC-006`; `SUPA-TRANS-003`   |
| `MOVE_TO_AUDIT_OR_EVENT_LAYER` | auditoría, outbox, eventos y evidencia transversal                       | dominio productor                     | `SUPA-ARC-007`; `SUPA-ARC-019`     |
| `TRANSITIONAL_COMPATIBILITY`   | nombre, vista o firma requerida temporalmente por consumidores vigentes  | owner de origen; sin autoridad propia | `SUPA-TRANS-003`; `SUPA-TRANS-007` |
| `RETIRE`                       | objeto sin finalidad vigente, reemplazado o legacy con salida demostrada | ninguna autoridad nueva               | `SUPA-TRANS-002`; `SUPA-TRANS-012` |
| `PLATFORM_EXCEPTION`           | objeto técnico soportado que no puede relocalizarse todavía              | ninguna autoridad empresarial         | `SUPA-ARC-024`; `SUPA-TRANS-015`   |

Todo objeto deberá pertenecer exactamente a una clase primaria. Una clase secundaria podrá describir compatibilidad o dependencia, pero no sustituirá el destino principal.

#### 8. Contenido permitido temporalmente en `public`

| Clase                   | Condiciones acumulativas                                                                     | Prohibición                                                 |
| ----------------------- | -------------------------------------------------------------------------------------------- | ----------------------------------------------------------- |
| vista de compatibilidad | solo lectura; fuente exacta; consumidores inventariados; paridad; versión; reemplazo; salida | mutación, estado propio o fuente competidora                |
| RPC alias               | firma exacta; delegación; autorización equivalente; idempotencia; telemetría; deprecación    | lógica empresarial duplicada, secreto o DML lateral propio  |
| tipo de compatibilidad  | requerido por una firma vigente; versionado; consumidor y reemplazo conocidos                | usarlo como modelo canónico o expandirlo a contratos nuevos |
| excepción técnica       | mecanismo soportado; no expuesto por default; sin estado empresarial; prueba de upgrade      | convertirla en contenedor general o precedente              |

No se permite crear una superficie nueva dentro de estas clases para evitar la capa expuesta, privada o propietaria correspondiente.

#### 9. Contenido prohibido en el estado objetivo

- tablas maestras, transaccionales, ledgers, catálogos o estados de proceso;
- tablas compartidas entre dominios o aplicaciones;
- escrituras directas de clientes a estado empresarial;
- funciones que concentren reglas o mutaciones interdominio;
- helpers internos, secretos, claves, tokens o configuración privilegiada;
- outbox, auditoría, eventos, colas, staging, backups o importaciones temporales;
- políticas o grants amplios heredados por costumbre;
- aliases sin consumidor, reemplazo, versión y salida;
- objetos cuyo propietario se infiera desde aplicación, nombre, rol PostgreSQL o ubicación;
- contratos nuevos permanentes creados antes de `SUPA-ARC-005`.

#### 10. Contrato mínimo por objeto de compatibilidad

Cada objeto temporal de `public` deberá registrar:

```text
object_key
+ object_kind
+ current_signature_or_shape
+ source_owner_schema_id
+ source_owner_schema_name
+ process_ids
+ current_consumers
+ target_class
+ canonical_replacement_key
+ read_write_mode
+ exposure_and_security_owner
+ compatibility_version
+ parity_evidence
+ observability_signal
+ deprecation_owner
+ exit_gate
+ rollback_contract
+ test_requirement_ids
```

No se aceptarán `TBD`, propietario genérico, consumidor supuesto, fecha narrativa ni reemplazo sin identidad resoluble.

#### 11. Ciclo de vida de compatibilidad

| Etapa                   | Condición de entrada                                      | Condición de salida                       |
| ----------------------- | --------------------------------------------------------- | ----------------------------------------- |
| `INVENTORIED`           | identidad, firma, dependencias y consumidores localizados | destino primario aprobado                 |
| `REPLACEMENT_AVAILABLE` | fuente y contrato canónicos disponibles                   | paridad y seguridad verificadas           |
| `DUAL_COMPATIBILITY`    | objeto legacy delega en el reemplazo                      | adopción observada por consumidores       |
| `DEPRECATED`            | aviso, versión y gate de retiro publicados                | cero consumidores y ventana aprobada      |
| `RETIRED`               | retiro ejecutado con evidencia                            | observación postcambio y rollback cerrado |

Un objeto no podrá saltar directamente de inventariado a retirado. La transición podrá abreviarse únicamente cuando se demuestre que nunca tuvo consumidor ni datos y exista aprobación explícita en la tarea de transición.

#### 12. Exposición y autorización

1. `public` no se considerará expuesto por definición documental ni por su nombre.
2. La lista de schemas expuestos, vistas, RPC, roles y privilegios se definirá en `SUPA-ARC-005` y `SUPA-ARC-015`.
3. Todo objeto temporal permanecerá denegado por defecto hasta que un contrato identifique audiencia, operación y mínima autoridad.
4. Una vista o wrapper no podrá degradar la autorización de su fuente ni ocultar un bypass privilegiado.
5. `anon`, `authenticated`, roles empresariales y actores de sistema se tratarán como audiencias distintas.
6. El uso de una credencial privilegiada por backend no convertirá la superficie en acceso autorizado para clientes.
7. La compatibilidad deberá incluir pruebas negativas y de paridad antes de habilitarse o retirarse.

#### 13. Reglas por clase de objeto actual

| Objeto actual en `public`                | Decisión de esta tarea                                                                | Destino documental                                         |
| ---------------------------------------- | ------------------------------------------------------------------------------------- | ---------------------------------------------------------- |
| tabla autoritativa                       | pierde toda autoridad objetivo en `public`; se asigna al owner schema lógico aprobado | `SUPA-ARC-003`; `SUPA-TRANS-001`; `SUPA-TRANS-005`         |
| vista                                    | se clasifica como contrato canónico, compatibilidad, interno o retiro                 | `SUPA-ARC-005`; `SUPA-TRANS-003`; `SUPA-TRANS-007`         |
| función o RPC                            | se clasifica por firma, efecto, seguridad y audiencia                                 | `SUPA-ARC-013` a `SUPA-ARC-016`; `SUPA-TRANS-003`          |
| trigger function                         | hereda objeto y efecto; no es API por residir en `public`                             | `SUPA-ARC-013`; `SUPA-ARC-014`                             |
| tipo o enum                              | acompaña al contrato o dominio propietario; no convierte `public` en raíz de tipos    | `SUPA-ARC-011`; `SUPA-ARC-023`                             |
| secuencia, índice, constraint o política | hereda destino del objeto principal                                                   | `SUPA-ARC-012`; `SUPA-ARC-015`; transición correspondiente |
| backup, staging o importación            | conserva clase temporal y decisión de retención o retiro                              | `SUPA-ARC-022`; `SUPA-TRANS-002`; `SUPA-TRANS-012`         |
| extensión u objeto técnico               | excepción soportada o traslado a superficie administrada                              | `SUPA-ARC-006`; `SUPA-ARC-024`                             |

#### 14. Relación con consumidores y tipos

- las aplicaciones actuales podrán conservar temporalmente contratos `public` únicamente mediante el manifiesto de compatibilidad;
- un consumidor nuevo deberá adoptar la capa canónica y no el alias legacy;
- los clientes generados distinguirán superficies canónicas y temporales;
- una vista o RPC no podrá retirarse solo porque no aparezca en una búsqueda de código;
- scripts, automatizaciones, integraciones externas, clientes desplegados y operación manual deberán formar parte de la búsqueda de consumidores;
- la adopción se medirá por telemetría o evidencia reproducible, no por declaración narrativa.

#### 15. Orden obligatorio de transición

```text
1. CONGELAR NUEVAS FUENTES EN PUBLIC
2. INVENTARIAR Y CLASIFICAR CADA OBJETO
3. MATERIALIZAR OWNER SCHEMA O CAPA DESTINO
4. CREAR CONTRATO CANÓNICO Y COMPATIBILIDAD
5. VALIDAR PARIDAD, SEGURIDAD Y ROLLBACK
6. MIGRAR CONSUMIDORES POR OLEADAS
7. DEMOSTRAR CERO CONSUMIDORES OCULTOS
8. RETIRAR ALIAS O WRAPPER
9. CERTIFICAR PUBLIC SIN AUTORIDAD
```

Este orden no autoriza ninguna migración. `SUPA-TRANS-001` a `SUPA-TRANS-015` definirán y ejecutarán documentalmente la preparación de cada cambio antes de los paquetes de implementación.

#### 16. Riesgos restringidos y carryover

| Riesgo         | Efecto de esta tarea                                                                  | Resolución restante                      |
| -------------- | ------------------------------------------------------------------------------------- | ---------------------------------------- |
| `RSK-SUPA-004` | prohíbe interpretar `public` como autorización o exposición                           | `SUPA-ARC-005`; `014`; `015`; transición |
| `RSK-SUPA-017` | define el retiro de toda autoridad empresarial y el rol transitorio de compatibilidad | `SUPA-ARC-005`; `SUPA-TRANS-001` a `007` |
| `RSK-SUPA-022` | obliga a versionar, medir y retirar aliases y fachadas legacy                         | `SUPA-TRANS-006`; `007`; `012`           |
| `RSK-SUPA-033` | exige destino, owner de origen y ciclo de vida por objeto                             | `SUPA-ARC-011`; `016`; `SHELL-CI-017`    |
| `RSK-SUPA-035` | impide retirar superficies sin búsqueda completa de consumidores                      | `SUPA-TRANS-003`; `007`; `012`           |
| `RSK-SUPA-036` | exige identidad de firma y clasificación para funciones y RPC de `public`             | `SUPA-ARC-013`; `014`; `SUPA-TRANS-003`  |
| `RSK-SUPA-041` | separa vacío, futuro, compatibilidad y abandono antes del retiro                      | `SUPA-TRANS-001`; `002`; `012`           |

Ningún riesgo queda aceptado, mitigado o cerrado. La tarea fija la función objetivo y los gates que deberán producir evidencia posterior.

#### 17. Decisiones reservadas

| Decisión                                                          | Tarea propietaria                       |
| ----------------------------------------------------------------- | --------------------------------------- |
| nombre, schemas y catálogo exacto de la capa expuesta             | `SUPA-ARC-005`                          |
| ubicación y contrato de helpers o lógica privada                  | `SUPA-ARC-006`                          |
| estructura de auditoría, outbox y eventos                         | `SUPA-ARC-007`; `SUPA-ARC-019`          |
| convenciones de nombres y tipos                                   | `SUPA-ARC-011`; `SUPA-ARC-023`          |
| firmas, seguridad y privilegios de funciones                      | `SUPA-ARC-013` a `SUPA-ARC-015`         |
| contratos y escrituras entre dominios                             | `SUPA-ARC-016`; `SUPA-ARC-017`          |
| inventario exacto de objetos que permanecen temporalmente         | `SUPA-TRANS-001`; `SUPA-TRANS-003`      |
| orden por consumidor, backfill, compatibilidad, retiro y rollback | `SUPA-TRANS-003` a `SUPA-TRANS-015`     |
| implementación física                                             | paquetes E5 y BLOQUE R correspondientes |

#### 18. Límites de autorización

Esta tarea no autoriza:

- crear una capa expuesta nueva;
- cambiar la lista de schemas expuestos;
- crear, mover, renombrar, alterar o retirar objetos en `public`;
- modificar grants, RLS, owners PostgreSQL, privilegios o `search_path`;
- cambiar firmas de vistas, RPC, funciones, tipos o clientes;
- desplegar wrappers, aliases o telemetría;
- ejecutar migraciones, DDL, DML, backfills, conciliaciones o cutovers;
- declarar cero consumidores, paridad, seguridad o rollback sin evidencia;
- marcar riesgos como resueltos;
- iniciar `SUPA-ARC-005` antes de aprobación expresa.

#### 19. Requisitos de prueba generados

**Resultado:** GENERA REQUISITOS DE PRUEBA

Se incorporan al Registro Canónico de Requisitos de Prueba:

```text
TREQ-SUPABASE-621 a TREQ-SUPABASE-650
```

Los treinta requisitos protegen función única, cero autoridad, congelación de nuevas fuentes, clasificación completa, compatibilidad, RPC y vistas, seguridad, resolución calificada, tipos, transición por oleadas, rollback, retiro y verificación recurrente de `public`. El detalle completo existe únicamente en `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`.

#### 20. Criterios de aceptación

- [ ] `public` tiene una sola función objetivo: compatibilidad transitoria no autoritativa.
- [ ] `public` no se registra como dominio, aplicación, owner schema ni capa canónica permanente.
- [ ] El objetivo contiene cero tablas autoritativas y cero mutaciones directas de clientes.
- [ ] Ninguna fuente nueva podrá crearse en `public` después de la decisión arquitectónica.
- [ ] Cada objeto actual deberá recibir exactamente una clase de destino.
- [ ] Toda compatibilidad declara fuente, consumidores, reemplazo, versión, paridad, seguridad, salida y rollback.
- [ ] Vistas y RPC temporales no adquieren autoridad ni duplican reglas.
- [ ] Privilegios, RLS y exposición permanecen decisiones independientes.
- [ ] La capa expuesta canónica permanece reservada a `SUPA-ARC-005`.
- [ ] Helpers, secretos, auditoría, eventos, staging y backups quedan fuera del estado objetivo.
- [ ] La transición exige oleadas, adopción verificable, cero consumidores y rollback.
- [ ] El estado terminal queda vacío de objetos empresariales o limitado a excepciones soportadas.
- [ ] Se generan `TREQ-SUPABASE-621` a `TREQ-SUPABASE-650`.
- [ ] No se ejecutan cambios físicos, código ni implementación.
- [ ] `SUPA-ARC-005` permanece reservada.

#### 21. Controles estructurales requeridos

| Control                              | Resultado esperado |
| ------------------------------------ | -----------------: |
| funciones objetivo de `public`       |              **1** |
| owner schemas asignados a `public`   |              **0** |
| dominios asignados a `public`        |              **0** |
| tablas autoritativas objetivo        |              **0** |
| mutaciones directas cliente objetivo |              **0** |
| clases de destino permitidas         |              **7** |
| objetos sin clase objetivo           |              **0** |
| nuevas fuentes permitidas            |              **0** |
| compatibilidades sin salida          |              **0** |
| requisitos nuevos                    |             **30** |
| cambios físicos                      |              **0** |

#### 22. Continuidad inmediata

```text
ÚLTIMA TAREA APROBADA
SUPA-ARC-003 — Definir esquema propietario de cada fuente de verdad
        ↓
TAREA ACTUAL APROBADA
SUPA-ARC-004 — Definir función futura de `public`
        ↓
SIGUIENTE TAREA RESERVADA
SUPA-ARC-005 — Definir capa expuesta de vistas y RPC
```

`SUPA-ARC-005` permanece reservada y no se inicia hasta una solicitud expresa de continuidad.


### ✅ SUPA-ARC-005 — Definir capa expuesta de vistas y RPC

**Estado:** APROBADA
**Fecha de preparación documental:** 2026-07-29
**Bloque propietario:** BLOQUE E3 — Arquitectura canónica de datos y gobierno integral de Supabase
**Tarea anterior:** `SUPA-ARC-004` — Definir función futura de `public` — APROBADA
**Siguiente tarea:** `SUPA-ARC-006` — Definir capa privada de helpers y lógica interna
**Proyecto de referencia:** `vento-os-dev` — `clzdpinthhtknkmefsxx`
**Fuentes remotas observadas:** `04_ARQUITECTURA_CANONICA_OBJETIVO.md` blob `547d83bf2a85a9db29599808fc7b56dce9167568`; `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` blob `af5731907724a8a10202e1329a39aa1f6b5014a6`; `delivery-contract.json` blob `01f197364800a1998867eb4e9a8d104429bb222f`; `active-sequence.json` blob `0c63430b3efff08c308482196d781a20a424d172`
**Tipo de tarea:** definición normativa de la capa canónica expuesta de vistas y RPC; sin crear schemas, vistas, funciones o contratos físicos, sin DDL, DML, migraciones, backfills, cambios de Data API, `api.schemas`, `extra_search_path`, grants, RLS, Auth, Storage, Realtime, Edge Functions, cron, secretos, código, datos ni despliegues

#### 1. Objetivo

Definir una única capa contractual, estable y gobernada para las lecturas y comandos que Vento OS exponga mediante Data API, separándola de los 26 owner schemas, de `public`, de la lógica privada y de los servicios administrados.

```text
CLIENTE O SISTEMA AUTORIZADO
        ↓
DATA API
        ↓
SCHEMA CANÓNICO api
        ↓
VISTA DE LECTURA O RPC VERSIONADA
        ↓
OWNER SCHEMA VSCHEMA-001 A VSCHEMA-026
```

La capa expuesta no será fuente de verdad ni dominio empresarial. Su responsabilidad será presentar contratos mínimos, versionados y verificables sin transferir autoridad desde los owner schemas ni permitir acceso directo a sus estructuras internas.

#### 2. Artefacto producido

```text
SUPABASE-EXPOSED-CONTRACT-LAYER-001@1.0.0
```

| Propiedad                                |                                           Valor |
| ---------------------------------------- | ----------------------------------------------: |
| `canonical_exposed_schema_name`          |                                           `api` |
| `schema_class`                           |                  `VENTO_EXPOSED_CONTRACT_LAYER` |
| `business_domain_authority`              |                                          `NONE` |
| `owner_schema_identity`                  |                                          `NONE` |
| `authoritative_tables_allowed`           |                                           **0** |
| `sequences_allowed`                      |                                           **0** |
| `trigger_functions_allowed`              |                                           **0** |
| `primary_contract_kinds`                 | **3** — `READ_VIEW`, `QUERY_RPC`, `COMMAND_RPC` |
| `target_vento_business_data_api_schemas` |                                           **1** |
| `owner_schemas_exposed_to_client_roles`  |                                           **0** |
| `public_target_role`                     |          `TRANSITIONAL_COMPATIBILITY_NAMESPACE` |
| `graphql_public_role`                    |             `PLATFORM_MANAGED_OPTIONAL_SURFACE` |
| `physical_changes_authorized`            |                                           **0** |

#### 3. Fuentes canónicas consumidas

| Fuente                                                       | Decisión consumida                                                                                                                           |
| ------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------- |
| `01_PROTOCOLO.md`                                            | Supabase como plataforma integral; separación de dominio, schema, exposición y autorización; compatibilidad, pruebas y rollback obligatorios |
| `delivery-contract.json`                                     | una sola tarea, sin instrucciones operativas internas y registro 04A completo con nombre único                                               |
| `active-sequence.json`                                       | secuencia `SUPA-ARC-001` a `SUPA-ARC-025`; `SUPA-ARC-005` como tarea actual                                                                  |
| `SUPABASE-DATA-API-SCHEMA-EXPOSURE-REGISTRY-001@1.0.0`       | cuatro capas independientes de exposición y estado actual de `public`, `graphql_public`, schemas Vento y `app_private`                       |
| `SUPABASE-RELATION-INVENTORY-004@1.0.0`                      | 62 vistas gobernadas por Vento; 58 `security_invoker=true`; cuatro vistas privilegiadas                                                      |
| `SUPABASE-FUNCTION-RPC-SIGNATURE-INVENTORY-006@1.0.0`        | 347 firmas Vento, 274 directamente invocables, 73 funciones de trigger, cero procedimientos y tres nombres sobrecargados                     |
| `SUPABASE-RLS-GRANT-PRIVILEGE-REGISTRY-009@1.0.0`            | composición de `USAGE`, privilegios, RLS, modo de ejecución, ACL actuales y ACL por defecto                                                  |
| `SUPABASE-AUTHORITATIVE-SCHEMA-OWNERSHIP-REGISTRY-001@1.0.0` | 26 owner schemas y autoridad única de las fuentes empresariales                                                                              |
| `SUPABASE-PUBLIC-SCHEMA-FUTURE-FUNCTION-001@1.0.0`           | `public` como compatibilidad transitoria, sin autoridad ni contratos nuevos permanentes                                                      |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`           | 4.945 requisitos hasta `SUPA-ARC-004`; rango `TREQ-SUPABASE-001` a `650`                                                                     |

#### 4. Decisión canónica

Vento OS adoptará un único schema gobernado por Vento llamado `api` como capa canónica de contratos expuestos mediante Data API.

```text
api
├── READ_VIEW
├── QUERY_RPC
└── COMMAND_RPC
```

La decisión implica:

1. `api` no será un dominio ni un owner schema;
2. `api` no contendrá tablas autoritativas, secuencias, triggers, colas, secretos, staging ni estado empresarial;
3. las aplicaciones no accederán directamente a los 26 owner schemas mediante roles cliente;
4. cada objeto de `api` resolverá una fuente o efecto autoritativo exacto;
5. `public` conservará únicamente compatibilidad transitoria durante la adopción;
6. `graphql_public` seguirá siendo una superficie administrada opcional e independiente, no la capa empresarial de Vento;
7. la configuración física de schemas expuestos, grants y RLS se aprobará en `SUPA-ARC-015` y se implementará posteriormente mediante transición versionada.

#### 5. Topología de exposición objetivo

| Superficie                     | Función objetivo                           | Autoridad empresarial                    | Exposición cliente objetivo                                 |
| ------------------------------ | ------------------------------------------ | ---------------------------------------- | ----------------------------------------------------------- |
| `api`                          | contratos canónicos de lectura y comando   | ninguna; deriva o delega a owner schemas | única superficie empresarial candidata                      |
| `public`                       | compatibilidad transitoria                 | ninguna                                  | temporal y decreciente hasta retiro                         |
| `graphql_public`               | superficie administrada de GraphQL         | ninguna autoridad Vento                  | solo si el producto se habilita y existe contrato explícito |
| `VSCHEMA-001` a `VSCHEMA-026`  | fuentes y lógica autoritativas por dominio | sí                                       | **no** para `anon` ni `authenticated`                       |
| capa privada de `SUPA-ARC-006` | helpers, adaptadores y lógica interna      | no es fuente por sí sola                 | no expuesta                                                 |
| capas de auditoría y eventos   | evidencia, outbox y transporte             | conservan productor                      | no exposición genérica                                      |
| schemas administrados          | servicios e internals de plataforma        | no Vento                                 | solo mediante APIs soportadas                               |

El conjunto objetivo de schemas empresariales Vento directamente expuestos a roles cliente tendrá cardinalidad **uno**: `api`.

#### 6. Clases contractuales permitidas

| Clase         | Propósito                                                                             | Mutación                    | Fuente o efecto                                                  |
| ------------- | ------------------------------------------------------------------------------------- | --------------------------- | ---------------------------------------------------------------- |
| `READ_VIEW`   | proyección estable y mínima para lectura                                              | prohibida                   | exactamente uno o más owner schemas declarados, con uno primario |
| `QUERY_RPC`   | consulta parametrizada que no puede expresarse de forma segura o eficiente como vista | prohibida                   | fuentes declaradas, sin efectos laterales                        |
| `COMMAND_RPC` | comando empresarial autorizado con resultado estable                                  | permitida solo por contrato | un efecto primario y coordinaciones explícitas                   |

No existirán tablas Data API empresariales dentro de `api`. Las lecturas tabulares se expresarán mediante `READ_VIEW`; las mutaciones, mediante `COMMAND_RPC`.

#### 7. Contenido prohibido en `api`

- tablas maestras, transaccionales, ledgers, snapshots autoritativos o estados de proceso;
- secuencias, particiones, índices o constraints que impliquen persistencia propia;
- funciones de trigger o automatismos internos;
- helpers reutilizables sin contrato externo;
- secretos, credenciales, claves, tokens o configuración privilegiada;
- DML directo de clientes sobre owner schemas;
- RPC genéricas de SQL, filtros arbitrarios o ejecución dinámica;
- objetos que dependan de `search_path` para resolver una fuente empresarial;
- firmas sobrecargadas con el mismo nombre y versión;
- errores SQL internos, nombres físicos o columnas sensibles expuestos como contrato;
- objetos sin consumidor, audiencia, fuente, versión, propietario y pruebas;
- compatibilidad legacy sin ciclo de retiro.

#### 8. Registro canónico de contratos expuestos

Cada objeto de `api` deberá tener una fila en un registro único con, como mínimo:

```text
contract_id
+ contract_kind
+ qualified_name
+ major_version
+ lifecycle_status
+ source_owner_schema_ids
+ primary_owner_schema_id
+ process_ids
+ audience_class
+ authorization_requirement
+ operation_semantics
+ request_contract
+ response_contract
+ sensitivity_class
+ pagination_and_ordering
+ idempotency_contract
+ error_code_catalog
+ observability_contract
+ current_consumers
+ supersedes_contract_id
+ deprecation_gate
+ rollback_contract
+ test_requirement_ids
```

No se aceptarán `TBD`, owner genérico, audiencia “interna” sin identidad, consumidor supuesto, retorno no documentado ni contrato sin versión.

#### 9. Audiencias canónicas

| Audiencia             | Identidad técnica                                                             | Regla                                                                                      |
| --------------------- | ----------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| `ANON_PUBLIC`         | rol `anon`                                                                    | solo lectura pública mínima o comandos públicos expresamente aprobados                     |
| `AUTHENTICATED_ACTOR` | rol `authenticated` con sesión válida                                         | la autorización empresarial se resuelve por actor, contexto, permiso, recurso y territorio |
| `TRUSTED_SYSTEM`      | backend o integración autenticada mediante credencial privilegiada controlada | no representa usuario final ni permite reutilizar la credencial en clientes                |

Los roles PostgreSQL son audiencias técnicas. No sustituyen roles empresariales, scopes, contexto activo, check-in, sede, área, dispositivo, simulación ni autorización del recurso.

#### 10. Reglas para `READ_VIEW`

1. será de solo lectura y no tendrá estado propio;
2. declarará fuente primaria, joins, filtros, audiencia y sensibilidad;
3. usará columnas explícitas; queda prohibido `SELECT *` como contrato estable;
4. omitirá secretos, datos internos y columnas no necesarias para el caso de uso;
5. usará `security_invoker=true` por defecto;
6. cualquier excepción de ejecución privilegiada requerirá la política de `SUPA-ARC-014`, mínimo privilegio y prueba negativa;
7. una colección tendrá paginación, límite máximo y orden determinista;
8. no convertirá una proyección, agregado o caché en fuente de verdad;
9. los cambios destructivos exigirán nueva versión mayor;
10. la vista conservará trazabilidad hacia procesos y owner schemas aunque combine dominios.

#### 11. Reglas para `QUERY_RPC`

1. será `STABLE` o `IMMUTABLE` cuando la semántica y PostgreSQL lo permitan;
2. no ejecutará DML, efectos externos, colas, webhooks ni cambios de sesión;
3. tendrá nombres de parámetros, tipos de entrada y retorno inequívocos;
4. no tendrá sobrecargas con el mismo nombre y versión en la capa expuesta;
5. aplicará límites, paginación y orden determinista cuando retorne colecciones;
6. no revelará mensajes SQL, stack traces, nombres internos ni datos fuera de la audiencia;
7. referenciará objetos mediante nombres calificados;
8. permanecerá `SECURITY INVOKER` salvo excepción aprobada en `SUPA-ARC-014`.

#### 12. Reglas para `COMMAND_RPC`

1. será la única forma de mutación empresarial directa ofrecida por `api`;
2. validará autenticación técnica y autorización empresarial antes del efecto;
3. declarará exactamente un efecto primario y su owner schema;
4. no trasladará autoridad a `api` ni almacenará estado propio;
5. exigirá idempotencia cuando el consumidor pueda reintentar o el transporte pueda duplicar solicitudes;
6. devolverá un resultado contractual estable, no el resultado bruto de una sentencia SQL;
7. usará códigos de error de máquina versionados y mensajes humanos separados;
8. no coordinará escrituras entre dominios sin el contrato de `SUPA-ARC-017`;
9. cualquier uso de `SECURITY DEFINER` quedará sometido a `SUPA-ARC-014`;
10. registrará correlación, resultado, duración y señal de fallo sin incluir secretos.

#### 13. Identidad y versión de objetos

La identidad contractual mínima será:

```text
api.<contract_name>_v<major>
```

Reglas:

1. cada nombre y versión tendrá una sola firma efectiva;
2. una modificación incompatible crea una versión mayor nueva;
3. no se renombrarán, eliminarán, reordenarán semánticamente ni cambiarán tipos obligatorios dentro de una versión activa;
4. los cambios aditivos requieren análisis de consumidores, tipos generados y pruebas de regresión;
5. una versión anterior podrá coexistir solo durante un ciclo de deprecación medido;
6. `SUPA-ARC-011` y `SUPA-ARC-013` completarán las convenciones físicas sin cambiar esta identidad de capa;
7. `SUPA-ARC-023` generará tipos desde contratos canónicos y no desde todos los owner schemas expuestos.

#### 14. Ciclo de vida contractual

| Estado       | Condición                                                                      |
| ------------ | ------------------------------------------------------------------------------ |
| `DRAFT`      | contrato definido, aún no habilitado ni consumido                              |
| `ACTIVE`     | exposición, seguridad, tipos, pruebas y consumidores aprobados                 |
| `DEPRECATED` | reemplazo activo, aviso publicado, telemetría y gate de salida definidos       |
| `RETIRED`    | cero consumidores, retiro ejecutado, observación postcambio y rollback cerrado |

Una versión no podrá pasar de `ACTIVE` a `RETIRED` sin atravesar `DEPRECATED`, salvo que exista evidencia de que nunca estuvo habilitada ni tuvo consumidores.

#### 15. Exposición, grants y autorización

1. `api.schemas`, `extra_search_path`, `USAGE`, `SELECT`, `EXECUTE`, RLS y ACL por defecto permanecerán controles independientes.
2. La inclusión de `api` en PostgREST no concederá operaciones por sí sola.
3. Todo objeto comenzará con denegación efectiva y recibirá grants mínimos por contrato.
4. Se revocará la herencia accidental de `EXECUTE` o acceso desde `PUBLIC` antes de habilitar un RPC.
5. Los owner schemas no concederán `USAGE` directo a `anon` ni `authenticated` por ser fuentes autoritativas.
6. Las vistas invocadoras conservarán RLS y privilegios de las fuentes.
7. `service_role` y roles con `BYPASSRLS` permanecerán exclusivamente en backends confiables.
8. La matriz exacta de grants, políticas y defaults será responsabilidad de `SUPA-ARC-015`.

#### 16. Contratos de datos y comportamiento

Toda superficie deberá especificar:

- columnas o campos de entrada y salida, orden lógico, nulabilidad y semántica;
- identificadores estables y claves de correlación;
- sensibilidad y finalidad de cada dato;
- filtros, paginación, orden y límites;
- consistencia esperada y momento de lectura;
- idempotencia, concurrencia y reintentos cuando aplique;
- catálogo de errores y resultado ante denegación;
- telemetría mínima sin datos sensibles;
- compatibilidad de tipos y consumidores;
- prueba positiva, negativa, territorial, contractual y de regresión aplicable.

La definición detallada de lecturas y mutaciones por dominio corresponde a `SUPA-ARC-016`; las escrituras interdominio corresponden a `SUPA-ARC-017`.

#### 17. Línea base que deberá clasificarse

La arquitectura objetivo no acepta automáticamente las superficies actuales. La transición deberá clasificar:

| Universo actual                                                | Cantidad | Tratamiento                                                                  |
| -------------------------------------------------------------- | -------: | ---------------------------------------------------------------------------- |
| vistas Vento OS                                                |   **62** | convertir a `READ_VIEW`, compatibilidad, privada o retiro                    |
| vistas Vento OS con `security_invoker=true`                    |   **58** | candidatas, sujetas a contrato, columnas, audiencia y consumidores           |
| vistas privilegiadas Vento OS                                  |    **4** | excepción bloqueada hasta revisión de `SUPA-ARC-014` y `015`                 |
| firmas directamente invocables Vento OS no VITAL y no privadas |  **232** | clasificar como `QUERY_RPC`, `COMMAND_RPC`, privada, compatibilidad o retiro |
| función directa de `app_private`                               |    **1** | excluida de la capa expuesta; destino `SUPA-ARC-006`                         |
| firmas directas VITAL                                          |   **41** | fuera de Vento OS                                                            |
| funciones de trigger Vento                                     |   **73** | excluidas de la capa expuesta                                                |
| procedimientos PostgreSQL                                      |    **0** | ninguna superficie `CALL` existente                                          |
| nombres sobrecargados observados                               |    **3** | resolver mediante nombres y versiones inequívocos                            |

Estas cifras describen el corte auditado. No representan el número final de contratos de `api`.

#### 18. Relación con `public` y compatibilidad

- un contrato nuevo se crea en `api`, nunca en `public`;
- una vista o RPC legacy en `public` podrá delegar temporalmente en `api` mediante el manifiesto de compatibilidad de `SUPA-ARC-004`;
- el wrapper de `public` conservará firma y comportamiento, pero no lógica ni autoridad independiente;
- la adopción se medirá por consumidor y versión;
- el retiro exigirá paridad, cero consumidores, observabilidad y rollback;
- ningún consumidor nuevo podrá adoptar el wrapper legacy;
- el estado terminal elimina `public` de la superficie empresarial activa.

#### 19. Relación con `graphql_public`

`graphql_public` permanecerá clasificado como superficie administrada opcional de Supabase, separada de `api`.

Reglas:

1. no contendrá contratos empresariales propios de Vento por conveniencia;
2. su inclusión en configuración no demostrará que GraphQL esté funcionalmente habilitado;
3. solo permanecerá expuesto si existe una decisión explícita de producto, consumidores, seguridad, tipos y pruebas;
4. si permanece inactivo y sin consumidores, `SUPA-TRANS-002` y `SUPA-TRANS-015` definirán su tratamiento;
5. activarlo no expondrá automáticamente los owner schemas ni transferirá autoridad desde `api`.

#### 20. Orden obligatorio de materialización futura

```text
1. CATALOGAR CANDIDATOS ACTUALES
2. ASIGNAR OWNER SCHEMA, PROCESO Y AUDIENCIA
3. DEFINIR CONTRATO Y VERSIÓN
4. DEFINIR SEGURIDAD, GRANTS Y RLS
5. CREAR api Y OBJETO CANÓNICO
6. GENERAR TIPOS Y PRUEBAS
7. CREAR COMPATIBILIDAD public SI ES NECESARIA
8. MIGRAR CONSUMIDORES POR OLEADAS
9. DEPRECAR Y RETIRAR CONTRATOS LEGACY
10. VERIFICAR PARIDAD ENTRE AMBIENTES
```

Este orden no autoriza ejecución física. La materialización requiere las tareas de arquitectura restantes, `SUPA-TRANS-001` a `SUPA-TRANS-015` y los paquetes de implementación correspondientes.

#### 21. Riesgos restringidos y carryover

| Riesgo                         | Efecto de esta tarea                                          | Resolución restante                     |
| ------------------------------ | ------------------------------------------------------------- | --------------------------------------- |
| `RSK-SUPA-004`                 | separa exposición, privilegios y autorización por contrato    | `SUPA-ARC-014` a `016`; transición      |
| `RSK-SUPA-017`                 | establece una capa canónica fuera de `public`                 | `SUPA-TRANS-001` a `007`                |
| `RSK-SUPA-022`                 | obliga a versionar y retirar superficies legacy               | `SUPA-TRANS-006`; `007`; `012`          |
| `RSK-SUPA-033`                 | exige owner, proceso, audiencia y ciclo de vida por contrato  | `SUPA-ARC-011`; `016`; `023`            |
| `RSK-SUPA-035`                 | impide retirar vistas y RPC sin consumidores y telemetría     | `SUPA-TRANS-003`; `007`; `012`          |
| `RSK-SUPA-036`                 | elimina sobrecargas ambiguas y separa RPC, helpers y triggers | `SUPA-ARC-013`; `014`; transición       |
| superficie privilegiada actual | bloquea cuatro vistas invocadoras del owner hasta revisión    | `SUPA-ARC-014`; `015`; `SUPA-TRANS-003` |
| ACL por defecto amplias        | exige defaults y grants explícitos al materializar `api`      | `SUPA-ARC-015`; `024`; transición       |

Ningún riesgo queda aceptado, mitigado o cerrado. La tarea define la arquitectura contractual y conserva la obligación de evidencia posterior.

#### 22. Decisiones reservadas

| Decisión                                                     | Tarea propietaria                       |
| ------------------------------------------------------------ | --------------------------------------- |
| helpers, adaptadores y lógica privada                        | `SUPA-ARC-006`                          |
| auditoría, outbox y eventos                                  | `SUPA-ARC-007`; `SUPA-ARC-019`          |
| Auth, principal, sesión y revocación                         | `SUPA-ARC-008` a `SUPA-ARC-010`         |
| convención general de nombres                                | `SUPA-ARC-011`                          |
| funciones, RPC y triggers                                    | `SUPA-ARC-013`                          |
| excepciones `SECURITY DEFINER`                               | `SUPA-ARC-014`                          |
| schemas expuestos, grants, RLS y ACL por defecto             | `SUPA-ARC-015`                          |
| contrato detallado por dominio                               | `SUPA-ARC-016`                          |
| escrituras interdominio                                      | `SUPA-ARC-017`                          |
| tipos generados                                              | `SUPA-ARC-023`                          |
| paridad entre ambientes                                      | `SUPA-ARC-024`; `SUPA-TRANS-013`        |
| catálogo objeto por objeto, adaptación, deprecación y retiro | `SUPA-TRANS-001` a `SUPA-TRANS-015`     |
| implementación física                                        | paquetes E5 y BLOQUE R correspondientes |

#### 23. Límites de autorización

Esta tarea no autoriza:

- crear el schema `api`;
- modificar `supabase/config.toml`, `api.schemas` o `extra_search_path`;
- crear, mover, renombrar, alterar o eliminar vistas, funciones, grants, políticas o tipos;
- revocar o conceder privilegios;
- exponer owner schemas;
- habilitar o retirar `public` o `graphql_public`;
- cambiar firmas, cuerpos, `SECURITY DEFINER`, `search_path`, volatilidad o propietarios;
- ejecutar migraciones, DDL, DML, backfills, despliegues o pruebas mutantes;
- declarar una superficie actual como canónica sin clasificación y evidencia;
- iniciar `SUPA-ARC-006` antes de aprobación expresa.

#### 24. Requisitos de prueba generados

**Resultado:** GENERA REQUISITOS DE PRUEBA

Se incorporan al Registro Canónico de Requisitos de Prueba:

```text
TREQ-SUPABASE-651 a TREQ-SUPABASE-686
```

Los treinta y seis requisitos protegen identidad de la capa, ausencia de autoridad y persistencia, clases permitidas, views invocadoras, RPC de consulta y comando, audiencias, grants, RLS, versiones, idempotencia, errores, tipos, compatibilidad, clasificación del corte actual, paridad ambiental y detección recurrente de drift. El detalle completo existe únicamente en `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`.

#### 25. Criterios de aceptación

- [ ] Existe exactamente una capa empresarial canónica expuesta llamada `api`.
- [ ] `api` no representa dominio, owner schema ni fuente de verdad.
- [ ] `api` admite únicamente `READ_VIEW`, `QUERY_RPC` y `COMMAND_RPC` como clases primarias.
- [ ] El objetivo contiene cero tablas autoritativas, cero secuencias y cero funciones de trigger.
- [ ] Los 26 owner schemas permanecen fuera de exposición directa a roles cliente.
- [ ] Toda vista declara fuente, audiencia, columnas, sensibilidad, paginación y versión.
- [ ] `security_invoker=true` es la regla por defecto para vistas.
- [ ] Toda RPC tiene firma inequívoca, versión, efecto, autorización, errores y observabilidad.
- [ ] No existen sobrecargas con el mismo nombre y versión.
- [ ] Las mutaciones cliente se realizan exclusivamente mediante `COMMAND_RPC` autorizadas.
- [ ] Reintentos y duplicados están protegidos mediante idempotencia cuando aplica.
- [ ] `public` queda limitado a compatibilidad temporal y `graphql_public` permanece separado.
- [ ] Las 62 vistas y 232 firmas directas Vento OS quedan dentro del universo de clasificación posterior, sin aceptación automática.
- [ ] Las cuatro vistas privilegiadas y tres nombres sobrecargados conservan gates explícitos.
- [ ] Los tipos generados distinguen contrato canónico, compatibilidad y superficies privadas.
- [ ] Se generan `TREQ-SUPABASE-651` a `TREQ-SUPABASE-686`.
- [ ] No se ejecutan cambios físicos, código ni implementación.
- [ ] `SUPA-ARC-006` permanece reservada.

#### 26. Controles estructurales requeridos

| Control                                                       | Resultado esperado |
| ------------------------------------------------------------- | -----------------: |
| schemas empresariales canónicos expuestos                     |              **1** |
| nombre del schema expuesto                                    |              `api` |
| owner schemas expuestos a roles cliente                       |              **0** |
| clases contractuales primarias                                |              **3** |
| tablas autoritativas permitidas                               |              **0** |
| secuencias permitidas                                         |              **0** |
| funciones de trigger permitidas                               |              **0** |
| vistas actuales dentro del universo de clasificación          |             **62** |
| firmas directas Vento OS dentro del universo de clasificación |            **232** |
| vistas privilegiadas con gate                                 |              **4** |
| nombres sobrecargados con gate                                |              **3** |
| requisitos nuevos                                             |             **36** |
| cambios físicos                                               |              **0** |

#### 27. Continuidad inmediata

```text
ÚLTIMA TAREA APROBADA
SUPA-ARC-004 — Definir función futura de `public`
        ↓
TAREA ACTUAL APROBADA
SUPA-ARC-005 — Definir capa expuesta de vistas y RPC
        ↓
SIGUIENTE TAREA RESERVADA
SUPA-ARC-006 — Definir capa privada de helpers y lógica interna
```

`SUPA-ARC-006` permanece reservada y no se inicia hasta una solicitud expresa de continuidad.


### ✅ SUPA-ARC-006 — Definir capa privada de helpers y lógica interna

**Estado:** APROBADA
**Fecha de preparación documental:** 2026-07-29
**Bloque propietario:** BLOQUE E3 — Arquitectura canónica de datos y gobierno integral de Supabase
**Tarea anterior:** `SUPA-ARC-005 — Definir capa expuesta de vistas y RPC` — APROBADA
**Siguiente tarea:** `SUPA-ARC-007 — Definir esquema transversal de auditoría y eventos`
**Proyecto de referencia:** `vento-os-dev` — `clzdpinthhtknkmefsxx`
**Fuentes remotas observadas:** `04_ARQUITECTURA_CANONICA_OBJETIVO.md` blob `a2bb7436b2af25ec938b92ae73886a29a49374ff`; `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` blob `2d3b9a9a43569227fd52b36e6bb126382af1789a`; `delivery-contract.json` blob `01f197364800a1998867eb4e9a8d104429bb222f`; `active-sequence.json` blob `0c63430b3efff08c308482196d781a20a424d172`
**Tipo de tarea:** definición normativa de la capa técnica privada de helpers y lógica interna; sin crear, renombrar, mover o retirar schemas u objetos, sin DDL, DML, migraciones, backfills, cambios de Data API, `api.schemas`, `extra_search_path`, grants, RLS, Auth, Storage, Realtime, Edge Functions, cron, Vault, secretos, código, datos ni despliegues

#### 1. Objetivo

Definir la capa técnica privada de Vento OS que podrá alojar helpers compartidos, primitivas de seguridad, adaptadores de plataforma y coordinadores internos no expuestos, preservando simultáneamente la autoridad de los 26 owner schemas, la frontera contractual de `api`, la compatibilidad temporal de `public` y las capas reservadas de auditoría, eventos e integración.

```text
CONSUMIDOR INTERNO AUTORIZADO
        ↓
CONTRATO api U OBJETO DE DOMINIO
        ↓
CAPA PRIVADA app_private
        ↓
HELPER, PRIMITIVA O COORDINADOR INTERNO
        ↓
OWNER SCHEMA O SUPERFICIE ADMINISTRADA SOPORTADA
```

La capa privada no será fuente de verdad, dominio, API, almacén genérico de secretos ni contenedor universal de lógica. Su existencia permitirá reutilizar capacidades técnicas internas sin publicar internals ni centralizar reglas empresariales que pertenecen a un dominio.

#### 2. Artefacto producido

```text
SUPABASE-PRIVATE-INTERNAL-LAYER-001@1.0.0
```

| Propiedad                              |                           Valor |
| -------------------------------------- | ------------------------------: |
| `canonical_private_schema_name`        |                   `app_private` |
| `schema_class`                         | `VENTO_PRIVATE_TECHNICAL_LAYER` |
| `business_domain_authority`            |                          `NONE` |
| `owner_schema_identity`                |                          `NONE` |
| `data_api_exposure_target`             |                          `NONE` |
| `direct_client_execution_target`       |                           **0** |
| `authoritative_business_tables_target` |                           **0** |
| `persistent_secret_values_target`      |                           **0** |
| `primary_private_object_kinds`         |                           **7** |
| `current_relations_in_app_private`     |                           **1** |
| `current_functions_in_app_private`     |                           **1** |
| `current_views_in_app_private`         |                           **0** |
| `current_triggers_in_app_private`      |                           **0** |
| `physical_changes_authorized`          |                           **0** |

#### 3. Fuentes canónicas consumidas

| Fuente                                                       | Decisión consumida                                                                                                                       |
| ------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `01_PROTOCOLO.md`                                            | separación entre plataforma, dominio, schema, aplicación, exposición, autorización, transición, pruebas y rollback                       |
| `delivery-contract.json`                                     | una sola tarea, sin contenido operativo de chat y registro 04A completo con nombre único                                                 |
| `active-sequence.json`                                       | secuencia `SUPA-ARC-001` a `SUPA-ARC-025`; `SUPA-ARC-006` como tarea actual                                                              |
| `SUPA-AUD-003`                                               | `app_private` clasificado `PRIVADO_NO_EXPONER`, fuera de `api.schemas`, sin acceso de `anon` o `authenticated`                           |
| `SUPA-AUD-004`                                               | una relación actual en `app_private` y ausencia de vistas, materialized views y otras superficies tabulares del schema                   |
| `SUPA-AUD-006`                                               | una firma directa en `app_private`, `SECURITY DEFINER`, sin ejecución efectiva para roles cliente                                        |
| `SUPA-AUD-007`                                               | modos de seguridad, owners, ACL, `search_path`, `PUBLIC EXECUTE` y riesgos de funciones privilegiadas                                    |
| `SUPA-AUD-008`                                               | cero triggers explícitos en `app_private` y separación entre helpers privados y automatismos de dominio                                  |
| `SUPA-AUD-009`                                               | cero privilegios de relación o ejecución para `anon` y `authenticated`; tabla actual con RLS deshabilitado pero aislada por ACL y schema |
| `SUPA-AUD-015`                                               | reglas de custodia, rotación, registro y redacción de secretos; Vault instalado sin consumo canónico observado                           |
| `SUPABASE-AUTHORITATIVE-SCHEMA-OWNERSHIP-REGISTRY-001@1.0.0` | 26 owner schemas y autoridad única de las fuentes empresariales                                                                          |
| `SUPABASE-PUBLIC-SCHEMA-FUTURE-FUNCTION-001@1.0.0`           | `public` como compatibilidad transitoria no autoritativa                                                                                 |
| `SUPABASE-EXPOSED-CONTRACT-LAYER-001@1.0.0`                  | `api` como única capa empresarial canónica expuesta; helpers privados excluidos                                                          |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`           | 4.981 requisitos hasta `SUPA-ARC-005`; rango `TREQ-SUPABASE-001` a `686`                                                                 |

#### 4. Decisión canónica

Vento OS conservará el nombre `app_private` como único schema técnico privado transversal de base de datos.

```text
app_private
├── INTERNAL_READ_VIEW
├── INTERNAL_QUERY_HELPER
├── INTERNAL_COMMAND_HELPER
├── PLATFORM_ADAPTER
├── SECURITY_PRIMITIVE
├── INTERNAL_COORDINATOR
└── TRANSITIONAL_PRIVATE_COMPATIBILITY
```

La decisión implica:

1. `app_private` no representa aplicación, dominio, owner schema, proceso ni producto;
2. `app_private` no se incluirá en Data API ni en el `extra_search_path` global;
3. `public`, `anon` y `authenticated` no tendrán `USAGE`, acceso relacional ni `EXECUTE` directo sobre la capa;
4. la lógica específica de un solo dominio permanecerá en su owner schema, aunque sea privada;
5. `app_private` alojará únicamente lógica técnica compartida o coordinación interna que no pueda asignarse honestamente a un solo dominio;
6. ninguna tabla autoritativa ni secreto persistente tendrá destino objetivo en `app_private`;
7. toda función conservará owner de efecto, llamadores, seguridad, dependencias, lifecycle y requisitos de prueba explícitos;
8. la materialización física dependerá de las tareas de seguridad, contratos y transición posteriores.

#### 5. Fronteras de ubicación

| Responsabilidad                                                 | Ubicación objetivo                                    | Regla                                                 |
| --------------------------------------------------------------- | ----------------------------------------------------- | ----------------------------------------------------- |
| identidad, estado, invariantes y cierre de un hecho empresarial | owner schema `VSCHEMA-*`                              | autoridad única del dominio                           |
| vista o RPC consumida mediante Data API                         | `api`                                                 | contrato expuesto, versionado y sin autoridad propia  |
| wrapper legacy de cliente                                       | `public` temporal                                     | compatibilidad con salida obligatoria                 |
| helper privado específico de un dominio                         | owner schema correspondiente                          | privacidad no justifica extraer la lógica del dominio |
| helper técnico compartido o primitiva interna                   | `app_private`                                         | no expuesto y sin autoridad empresarial               |
| auditoría, evidencia transversal y outbox                       | capas de `SUPA-ARC-007` y `SUPA-ARC-019`              | conserva productor y finalidad                        |
| HTTP, webhook, Edge, cron y ejecución asíncrona                 | `SUPA-ARC-020`                                        | no se ocultan dentro de un helper SQL privado         |
| secreto operativo                                               | custodia aprobada por `SUPA-ARC-020` y `SUPA-ARC-024` | nunca tabla empresarial ni valor embebido             |
| objeto administrado por Supabase o extensión                    | schema administrado y punto soportado                 | Vento no se apropia de internals                      |

#### 6. Regla de colocación determinista

Todo objeto interno deberá resolver el siguiente árbol antes de recibir schema:

```text
¿PERSISTE O AUTORIZA UN HECHO DE UN DOMINIO?
  sí → OWNER SCHEMA
  no ↓
¿ES CONTRATO PARA CLIENTE O SISTEMA CONSUMIDOR?
  sí → api
  no ↓
¿ES AUDITORÍA, EVENTO, OUTBOX O EVIDENCIA TRANSVERSAL?
  sí → SUPA-ARC-007 / SUPA-ARC-019
  no ↓
¿EJECUTA HTTP, CRON, WEBHOOK, EDGE O COLA?
  sí → SUPA-ARC-020
  no ↓
¿ES SECRETO O CREDENCIAL?
  sí → CUSTODIA APROBADA
  no ↓
¿ES HELPER TÉCNICO COMPARTIDO, PRIMITIVA O COORDINADOR INTERNO?
  sí → app_private
  no → CLASIFICACIÓN BLOQUEADA
```

No se aceptará una colocación basada únicamente en conveniencia, nombre actual, owner PostgreSQL, aplicación consumidora, necesidad temporal o deseo de ocultar un objeto.

#### 7. Clases privadas permitidas

| Clase                                | Propósito                                               | Persistencia propia | Efecto permitido                     |
| ------------------------------------ | ------------------------------------------------------- | ------------------: | ------------------------------------ |
| `INTERNAL_READ_VIEW`                 | proyección interna reutilizable no expuesta             |               **0** | lectura declarada y acotada          |
| `INTERNAL_QUERY_HELPER`              | consulta técnica o transformación interna               |               **0** | sin DML ni efectos laterales         |
| `INTERNAL_COMMAND_HELPER`            | primitiva interna de escritura                          |               **0** | un owner schema primario             |
| `PLATFORM_ADAPTER`                   | adaptación a una superficie administrada soportada      |               **0** | operación mínima y explícita         |
| `SECURITY_PRIMITIVE`                 | hash, verificación, firma o derivación técnica estrecha |               **0** | sin decidir autorización empresarial |
| `INTERNAL_COORDINATOR`               | secuenciar contratos internos aprobados                 |               **0** | coordinación sin autoridad propia    |
| `TRANSITIONAL_PRIVATE_COMPATIBILITY` | helper interno temporal durante migración               |               **0** | delegación con gate de salida        |

Toda clase es lógica. `SUPA-ARC-011` y `SUPA-ARC-013` completarán las convenciones físicas sin convertir `app_private` en contenedor universal.

#### 8. Contenido prohibido en `app_private`

- tablas maestras, transaccionales, ledgers, catálogos o estados de proceso;
- tablas compartidas que oculten una fuente de verdad sin owner schema;
- secretos, tokens, API keys, private keys, contraseñas o credenciales persistentes;
- objetos expuestos directamente a `anon` o `authenticated`;
- contratos Data API nuevos o wrappers de cliente permanentes;
- reglas de autorización empresarial duplicadas o roles hardcoded;
- funciones de trigger colocadas allí solo para ocultarlas del dominio propietario;
- auditoría, outbox, eventos, colas, staging, backups o importaciones temporales;
- llamadas HTTP, webhooks, cron o ejecución asíncrona embebida como helper SQL genérico;
- SQL dinámico abierto, nombres de objetos suministrados por cliente o ejecución arbitraria;
- dependencias de `public` o `api` como fuente de verdad;
- excepciones `SECURITY DEFINER` sin la política de `SUPA-ARC-014`;
- objetos sin llamadores, owner de efecto, lifecycle, observabilidad y pruebas.

#### 9. Registro canónico de objetos privados

Cada objeto de la capa deberá registrarse con:

```text
private_object_id
+ private_object_kind
+ qualified_name
+ lifecycle_status
+ technical_owner
+ primary_effect_owner_schema_id
+ additional_owner_schema_dependencies
+ process_ids
+ authorized_caller_classes
+ current_callers
+ invocation_path
+ read_write_mode
+ security_mode
+ owner_role
+ fixed_search_path
+ qualified_dependency_set
+ volatility
+ idempotency_contract
+ concurrency_contract
+ error_contract
+ secret_handling_class
+ platform_dependencies
+ observability_contract
+ supersedes_object_id
+ deprecation_gate
+ rollback_contract
+ test_requirement_ids
```

No se aceptarán `TBD`, owner “backend”, llamador “interno”, dependencia narrativa, secreto sin clasificación, función sin identidad completa ni objeto sin gate de salida cuando sea temporal.

#### 10. Clases de llamador autorizadas

| Clase                           | Ejemplo de entrada                     | Regla                                                                           |
| ------------------------------- | -------------------------------------- | ------------------------------------------------------------------------------- |
| `API_CONTRACT`                  | vista o RPC de `api`                   | el contrato expuesto autentica, autoriza y limita el resultado antes de delegar |
| `DOMAIN_OBJECT`                 | función o automatismo del owner schema | la llamada conserva el dominio y no transfiere autoridad a `app_private`        |
| `DATABASE_AUTOMATION`           | trigger o job aprobado                 | el entrypoint permanece en su capa propietaria y registra el efecto             |
| `TRUSTED_BACKEND`               | Edge Function o servicio controlado    | no expone credencial ni representa usuario final                                |
| `SCHEDULED_OR_ASYNC_WORKER`     | cron, worker o consumidor durable      | usa contrato, identidad de servicio, idempotencia y observabilidad aprobados    |
| `MIGRATION_OR_MAINTENANCE_ROLE` | operación versionada y excepcional     | no se convierte en dependencia de runtime                                       |

`ANON_PUBLIC` y `AUTHENTICATED_ACTOR` no serán llamadores directos de `app_private`. Deberán atravesar `api` u otra superficie aprobada.

#### 11. Dirección de dependencias

| Origen        | Destino permitido   | Restricción                                                                 |
| ------------- | ------------------- | --------------------------------------------------------------------------- |
| `api`         | `app_private`       | solo helper registrado; autorización y contrato permanecen en `api`         |
| owner schema  | `app_private`       | solo primitiva técnica compartida; no llama de vuelta generando ciclo       |
| `app_private` | owner schema        | fuente o efecto explícito; referencias calificadas y owner primario         |
| `app_private` | schema administrado | únicamente punto de extensión soportado y documentado                       |
| `app_private` | `public`            | prohibido como dependencia objetivo; solo transición excepcional registrada |
| `app_private` | `api`               | prohibido; la capa privada no depende de la fachada expuesta                |
| `app_private` | auditoría o eventos | mediante contrato de `SUPA-ARC-007` o `SUPA-ARC-019`, sin escritura ad hoc  |

El grafo completo deberá ser acíclico. Un coordinador podrá depender de varios owner schemas, pero ningún owner schema participante podrá depender del mismo coordinador en una ruta recursiva.

#### 12. Separación entre lógica de dominio y lógica técnica

1. Una función que valida estados, calcula un resultado empresarial o controla el ciclo de una entidad pertenece al owner schema del dominio.
2. Una función no cambia de owner por ser llamada desde varias aplicaciones.
3. La reutilización no autoriza mover reglas empresariales a `app_private`.
4. Una primitiva puramente técnica podrá ser compartida si sus entradas y salidas no deciden el resultado empresarial.
5. Un helper con un efecto primario deberá declarar el `VSCHEMA-*` responsable y no podrá escribir en otro dominio por conveniencia.
6. Una coordinación entre dominios requerirá el contrato de `SUPA-ARC-017`, incluyendo orden, idempotencia, compensación y conciliación.
7. `app_private` no resolverá permisos mediante nombres de rol, metadata editable o supuestos de aplicación.

#### 13. Reglas para `INTERNAL_READ_VIEW` e `INTERNAL_QUERY_HELPER`

1. no tendrán estado propio ni DML;
2. declararán fuentes, joins, filtros, límite y consistencia esperada;
3. utilizarán columnas explícitas y referencias calificadas;
4. no devolverán secretos, credenciales, internals ni datos fuera de finalidad;
5. no se expondrán automáticamente por existir o por ser consumidos desde una RPC;
6. usarán semántica de volatilidad compatible con su comportamiento real;
7. cualquier consulta de colección tendrá límites y orden determinista;
8. una proyección interna no será fuente de verdad ni contrato público.

#### 14. Reglas para `INTERNAL_COMMAND_HELPER`

1. tendrá exactamente un efecto primario y un owner schema responsable;
2. no aceptará identificadores de schema, tabla, función o SQL suministrados libremente por el llamador;
3. validará invariantes del dominio mediante el owner correspondiente, no mediante copias locales;
4. declarará transacción, bloqueo, concurrencia, reintentos e idempotencia cuando apliquen;
5. no devolverá resultados brutos de DML ni mensajes SQL internos;
6. no coordinará escrituras entre dominios antes de `SUPA-ARC-017`;
7. no usará `service_role` o `SECURITY DEFINER` como sustituto de autorización;
8. registrará resultado y fallo sin persistir secretos ni payloads innecesarios.

#### 15. Reglas para `INTERNAL_COORDINATOR`

Un coordinador privado:

- no tendrá tablas ni estado autoritativo propio;
- declarará proceso, owner primario, participantes, orden de efectos y contrato de compensación;
- invocará contratos estables de los dominios y no escribirá tablas ajenas de forma lateral;
- exigirá idempotencia y correlación cuando pueda reintentarse;
- separará resultado empresarial, evento, auditoría y transporte;
- no ocultará HTTP, cron, webhook o cola dentro de una función SQL;
- permanecerá bloqueado hasta completar `SUPA-ARC-016`, `SUPA-ARC-017` y, cuando aplique, `SUPA-ARC-020`.

#### 16. Reglas para `PLATFORM_ADAPTER`

1. utilizará exclusivamente APIs, funciones o puntos de extensión soportados de Auth, Storage, Realtime, Vault, cron, `net` o extensiones;
2. no consultará internals administrados como fuente empresarial;
3. no trasladará modelos administrados completos a tablas de Vento;
4. conservará finalidad, versión, dependencia de plataforma, fallback y prueba de upgrade;
5. no expondrá directamente la superficie administrada a clientes;
6. cualquier llamada externa, retry o cola pertenece a `SUPA-ARC-020` y no se implementará como efecto opaco de base de datos;
7. una dependencia de plataforma no convierte `app_private` en schema administrado.

#### 17. Primitivas de seguridad y custodia de secretos

`SECURITY_PRIMITIVE` podrá realizar operaciones técnicas estrechas —por ejemplo hash, comparación constante, derivación o validación criptográfica—, pero no decidirá por sí sola roles, permisos, territorio, contexto ni autorización empresarial.

Reglas obligatorias:

1. `app_private` no será secret store canónico;
2. ningún valor secreto persistirá en tablas, funciones, comentarios, errores, logs o artefactos de la capa;
3. los secretos residirán en custodia aprobada y cifrada, con identidad de servicio mínima, rotación y revocación;
4. la capa podrá consumir una referencia opaca o un valor efímero mediante superficie soportada, sin registrarlo;
5. un helper no devolverá un secreto a un llamador que no tenga contrato explícito para recibir el resultado derivado;
6. toda rotación comprobará rechazo del valor anterior y continuidad de consumidores;
7. el registro canónico conservará metadata no sensible, nunca el valor.

#### 18. Seguridad, grants y modos de ejecución

1. `app_private` permanecerá fuera de `api.schemas` y de `extra_search_path` global.
2. `PUBLIC`, `anon` y `authenticated` tendrán `USAGE`, privilegios relacionales y `EXECUTE` revocados.
3. Las ACL por defecto impedirán que objetos nuevos hereden acceso cliente o `PUBLIC EXECUTE`.
4. `service_role` no recibirá acceso global por defecto; cualquier acceso directo será mínimo, nominal y aprobado.
5. `SECURITY INVOKER` será el modo predeterminado.
6. `SECURITY DEFINER` requerirá excepción individual de `SUPA-ARC-014`, owner controlado, `search_path` seguro, validación interna, grants mínimos y pruebas negativas.
7. Una función privilegiada no asumirá que su llamador ya fue autorizado por el simple hecho de llegar desde otra función.
8. RLS, grants, owner, modo de seguridad y autorización empresarial se evaluarán como controles separados.

#### 19. Resolución de nombres y `search_path`

- toda dependencia empresarial o técnica se referenciará mediante nombre calificado;
- `app_private` no se añadirá al `extra_search_path` de todas las solicitudes;
- las funciones declararán un `search_path` fijo cuando su modo y dependencias lo requieran;
- el `search_path` no incluirá schemas mutables o controlados por llamadores sin una justificación y protección explícitas;
- el uso de `public` dentro del `search_path` actual no se considerará automáticamente aceptado para el objetivo;
- cambios de orden, inclusión o ausencia de `pg_temp` se revisarán en `SUPA-ARC-014`;
- ningún objeto se resolverá por coincidencia de nombre entre ambientes.

#### 20. SQL dinámico y superficies genéricas

El SQL dinámico estará prohibido por defecto. Una excepción deberá:

1. demostrar que una consulta estática o un contrato tipado no resuelve el caso;
2. limitar identificadores a una allowlist versionada;
3. separar identificadores de valores y parametrizar estos últimos;
4. impedir que el llamador proporcione expresiones, predicates, order clauses o cuerpos SQL libres;
5. registrar owner, consumidor, riesgo, pruebas negativas y rollback;
6. quedar sometida a `SUPA-ARC-013`, `SUPA-ARC-014` y `SUPA-ARC-015` antes de materializarse.

No se permitirá una función genérica de lectura, escritura, bypass de RLS o ejecución arbitraria.

#### 21. Contrato mínimo de funciones privadas

Toda función o vista privada declarará:

- identidad calificada y firma inequívoca;
- tipos de entrada y salida, nulabilidad y semántica;
- clase privada y lifecycle;
- owner técnico y owner schema de efecto;
- llamadores exactos y ruta de invocación;
- modo de lectura o escritura;
- modo de seguridad, owner PostgreSQL y `search_path`;
- volatilidad compatible con comportamiento;
- autorización requerida antes y dentro del helper;
- idempotencia, concurrencia y reintento;
- catálogo de errores estable;
- observabilidad y redacción de datos sensibles;
- dependencias de plataforma y dominios;
- compatibilidad, deprecación, rollback y requisitos de prueba.

No habrá sobrecargas ambiguas dentro del mismo nombre lógico. Toda firma deberá ser resoluble por nombre y tipos sin depender de heurísticas del cliente.

#### 22. Manejo de errores y observabilidad

1. no se capturará `WHEN OTHERS` para convertir cualquier fallo en éxito silencioso;
2. un error esperado usará código estable y contexto mínimo, sin revelar internals;
3. un fallo inesperado se propagará o se registrará mediante la capa aprobada, sin ocultar estado parcial;
4. cada comando tendrá correlación, duración, resultado y señal de retry cuando aplique;
5. logs y auditoría excluirán secretos, tokens, SQL sensible y PII innecesaria;
6. telemetría no sustituirá la fuente empresarial ni el evento canónico;
7. auditoría y outbox definitivos pertenecen a `SUPA-ARC-007` y `SUPA-ARC-019`.

#### 23. Ciclo de vida de objetos privados

| Estado       | Condición                                                               |
| ------------ | ----------------------------------------------------------------------- |
| `DRAFT`      | objeto definido, sin consumidor habilitado                              |
| `ACTIVE`     | seguridad, dependencias, llamadores, pruebas y observabilidad aprobados |
| `DEPRECATED` | reemplazo activo, consumidores identificados y gate de salida medido    |
| `RETIRED`    | cero consumidores, retiro ejecutado, observación y rollback cerrados    |

Un helper no podrá permanecer indefinidamente como temporal. Los objetos de compatibilidad deberán registrar reemplazo y gate desde su creación.

#### 24. Línea base actual de `app_private`

El corte auditado contiene:

| Objeto                                       | Clase actual                                 | Señales positivas                                                 | Gate pendiente                                                                                 |
| -------------------------------------------- | -------------------------------------------- | ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------- |
| `app_private.delivery_pin_secrets`           | tabla técnica con secreto persistido         | schema privado; sin grants cliente observados                     | custodia aprobada, rotación, retiro de tabla y paridad de consumidores                         |
| `app_private.delivery_pin_for_session(uuid)` | función directa `STABLE`, `SECURITY DEFINER` | sin `EXECUTE` para `anon` o `authenticated`; `search_path` fijado | revisión `SECURITY DEFINER`, dependencia de secreto, callers, autorización, rotación y pruebas |

Invariantes observados:

```text
RELACIONES app_private = 1
FUNCIONES app_private = 1
VISTAS app_private = 0
TRIGGERS EXPLÍCITOS app_private = 0
PRIVILEGIOS CLIENTE OBSERVADOS = 0
```

La línea base describe el estado actual. No certifica esos objetos como arquitectura objetivo.

#### 25. Clasificación obligatoria de la línea base

1. `delivery_pin_secrets` se clasifica `CURRENT_SECRET_STORAGE_LEGACY_REVIEW`; no podrá permanecer como secret store objetivo.
2. `delivery_pin_for_session(uuid)` se clasifica `CURRENT_SECURITY_PRIMITIVE_CANDIDATE`; no se declara `ACTIVE` hasta superar `SUPA-ARC-014`, seguridad, custodia, rotación y pruebas.
3. La transición deberá localizar todos los llamadores y consumidores, incluidos triggers, RPC, Edge Functions, scripts y clientes desplegados.
4. La migración del secreto deberá coordinar creación de custodia, rotación, actualización de consumidores, rechazo del valor anterior y rollback seguro.
5. El retiro de la tabla no podrá ejecutarse antes de demostrar paridad del PIN derivado y ausencia de dependencias ocultas.
6. Cualquier objeto adicional detectado en `app_private` constituye drift y bloquea el cierre hasta clasificarse.

Destinos exactos: `SUPA-ARC-014`, `SUPA-ARC-015`, `SUPA-ARC-020`, `SUPA-ARC-024`, `SUPA-TRANS-001` a `SUPA-TRANS-004`, `SUPA-TRANS-009`, `SUPA-TRANS-011` a `SUPA-TRANS-013` y `SUPA-TRANS-015`.

#### 26. Relación con las demás capas

| Capa                  | Relación con `app_private`                                                               |
| --------------------- | ---------------------------------------------------------------------------------------- |
| owner schemas         | conservan toda autoridad; consumen primitivas o reciben efectos declarados               |
| `api`                 | puede delegar en helpers registrados; conserva contrato, audiencia y autorización        |
| `public`              | no es dependencia objetivo; solo compatibilidad temporal con salida                      |
| auditoría             | recibe evidencia mediante el contrato de `SUPA-ARC-007`                                  |
| eventos y Realtime    | reciben eventos canónicos mediante `SUPA-ARC-019`                                        |
| Edge, webhooks y cron | invocan contratos internos mediante `SUPA-ARC-020`; no exponen `app_private`             |
| Auth y Storage        | se consumen mediante superficies soportadas, no por internals como fuente                |
| tipos de consumidor   | excluyen internals de `app_private` salvo paquete server-only separado en `SUPA-ARC-023` |
| VITAL                 | permanece fuera de Vento OS; no comparte helpers privados por coexistencia               |

#### 27. Orden obligatorio de materialización futura

```text
1. INVENTARIAR Y CLASIFICAR TODA LÓGICA INTERNA
2. CONFIRMAR OWNER DE EFECTO Y LLAMADORES
3. SEPARAR LÓGICA DE DOMINIO, API, PRIVADA Y EVENTOS
4. DEFINIR SEGURIDAD, search_path Y GRANTS
5. MIGRAR SECRETOS A CUSTODIA APROBADA
6. CREAR O AJUSTAR app_private Y SUS OBJETOS
7. IMPLEMENTAR PRUEBAS NEGATIVAS, CONTRATOS Y DRIFT
8. ADAPTAR LLAMADORES POR OLEADAS
9. DEPRECAR Y RETIRAR HELPERS LEGACY
10. VERIFICAR PARIDAD ENTRE AMBIENTES Y ROLLBACK
```

Este orden no autoriza ejecución física. La materialización depende de las tareas `SUPA-ARC-007` a `SUPA-ARC-025`, `SUPA-TRANS-001` a `SUPA-TRANS-015` y los paquetes de implementación correspondientes.

#### 28. Riesgos restringidos y carryover

| Riesgo o hallazgo                  | Efecto de esta tarea                                | Resolución restante                          |
| ---------------------------------- | --------------------------------------------------- | -------------------------------------------- |
| exposición de `app_private`        | fija no exposición y cero acceso cliente directo    | `SUPA-ARC-015`; transición                   |
| `PUBLIC EXECUTE` y ACL por defecto | exige defaults privados y grants nominales          | `SUPA-ARC-014`; `015`; `024`                 |
| `SECURITY DEFINER`                 | lo prohíbe por defecto y exige excepción individual | `SUPA-ARC-014`; transición                   |
| secreto persistido en tabla        | declara que no es estado objetivo                   | `SUPA-ARC-020`; `024`; transición y rotación |
| lógica de dominio centralizada     | obliga a mantenerla en owner schema                 | `SUPA-ARC-016`; `017`                        |
| SQL dinámico o helper genérico     | queda bloqueado por defecto                         | `SUPA-ARC-013`; `014`; `015`                 |
| HTTP, cron o cola oculta           | separa ejecución externa de helper SQL              | `SUPA-ARC-020`; `022`                        |
| error silenciado sin evidencia     | exige error estable y observabilidad                | `SUPA-ARC-007`; `019`; `020`                 |
| drift de objetos privados          | exige registro y validación recurrente              | `SUPA-ARC-025`; `SUPA-TRANS-015`             |

Ningún riesgo queda aceptado, mitigado o cerrado por esta definición.

#### 29. Decisiones reservadas

| Decisión                                                       | Tarea propietaria                       |
| -------------------------------------------------------------- | --------------------------------------- |
| esquema de auditoría, evidencia y outbox                       | `SUPA-ARC-007`                          |
| Auth, principal, vínculo y sesión                              | `SUPA-ARC-008` a `SUPA-ARC-010`         |
| convenciones físicas de nombres                                | `SUPA-ARC-011`                          |
| funciones, RPC y triggers                                      | `SUPA-ARC-013`                          |
| excepciones `SECURITY DEFINER` y `search_path`                 | `SUPA-ARC-014`                          |
| grants, RLS, ACL por defecto y roles de ejecución              | `SUPA-ARC-015`                          |
| contratos detallados por dominio                               | `SUPA-ARC-016`                          |
| escrituras y coordinaciones interdominio                       | `SUPA-ARC-017`                          |
| eventos, Realtime, Edge, webhooks y cron                       | `SUPA-ARC-019`; `SUPA-ARC-020`          |
| retención, respaldo y recuperación                             | `SUPA-ARC-022`                          |
| tipos server-only y consumidores                               | `SUPA-ARC-023`                          |
| secretos, ambientes y paridad                                  | `SUPA-ARC-024`; `SUPA-TRANS-013`        |
| inventario, adaptación, rotación, retiro y rollback por objeto | `SUPA-TRANS-001` a `SUPA-TRANS-015`     |
| implementación física                                          | paquetes E5 y BLOQUE R correspondientes |

#### 30. Límites de autorización

Esta tarea no autoriza:

- crear, renombrar, alterar o retirar `app_private`;
- mover funciones, vistas, tablas, secretos o dependencias;
- crear custodia, rotar secretos o modificar Vault;
- cambiar `delivery_pin_secrets` o `delivery_pin_for_session(uuid)`;
- modificar `api.schemas`, `extra_search_path`, grants, ACL por defecto, RLS, owners o `search_path`;
- convertir funciones `SECURITY DEFINER` a `INVOKER` o viceversa;
- crear helpers, adaptadores, coordinadores, triggers, jobs o Edge Functions;
- ejecutar migraciones, DDL, DML, backfills, pruebas mutantes o despliegues;
- declarar un helper actual como canónico sin clasificación y evidencia;
- iniciar `SUPA-ARC-007` antes de aprobación expresa.

#### 31. Requisitos de prueba generados

**Resultado:** GENERA REQUISITOS DE PRUEBA

Se incorporan al Registro Canónico de Requisitos de Prueba:

```text
TREQ-SUPABASE-687 a TREQ-SUPABASE-718
```

Los treinta y dos requisitos protegen identidad y no exposición de `app_private`, ausencia de autoridad y persistencia, colocación por responsabilidad, clases privadas, callers, dependencias, seguridad, `search_path`, SQL dinámico, dominio, coordinación, secretos, errores, observabilidad, lifecycle, clasificación de la línea base y detección recurrente de drift. El detalle completo existe únicamente en `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`.

#### 32. Criterios de aceptación

- [ ] Existe exactamente una capa técnica privada transversal llamada `app_private`.
- [ ] `app_private` no representa dominio, aplicación, owner schema ni fuente de verdad.
- [ ] La capa no se expone mediante Data API ni `extra_search_path` global.
- [ ] `public`, `anon` y `authenticated` conservan cero acceso directo.
- [ ] El objetivo contiene cero tablas autoritativas y cero secretos persistentes.
- [ ] La lógica específica de un dominio permanece en su owner schema.
- [ ] Se permiten exactamente siete clases privadas con responsabilidades diferenciadas.
- [ ] Todo objeto privado declara owner de efecto, llamadores, seguridad, dependencias, lifecycle y pruebas.
- [ ] `SECURITY INVOKER` es el modo predeterminado y toda excepción queda reservada a `SUPA-ARC-014`.
- [ ] Las referencias son calificadas y el grafo de dependencias es acíclico.
- [ ] `INTERNAL_QUERY_HELPER` no ejecuta DML ni efectos laterales.
- [ ] `INTERNAL_COMMAND_HELPER` tiene un único efecto primario.
- [ ] La coordinación interdominio permanece bloqueada hasta `SUPA-ARC-017`.
- [ ] HTTP, cron, webhooks, colas, auditoría y eventos permanecen fuera de la capa.
- [ ] Los secretos usan custodia aprobada y nunca se persisten como estado objetivo.
- [ ] La tabla y función actuales de `app_private` quedan clasificadas sin aceptación automática.
- [ ] Se generan `TREQ-SUPABASE-687` a `TREQ-SUPABASE-718`.
- [ ] No se ejecutan cambios físicos, código ni implementación.
- [ ] `SUPA-ARC-007` permanece reservada.

#### 33. Controles estructurales requeridos

| Control                                 | Resultado esperado |
| --------------------------------------- | -----------------: |
| schemas técnicos privados transversales |              **1** |
| nombre del schema privado               |      `app_private` |
| dominios asignados                      |              **0** |
| owner schemas asignados                 |              **0** |
| schemas expuestos                       |              **0** |
| acceso directo de roles cliente         |              **0** |
| tablas autoritativas objetivo           |              **0** |
| secretos persistentes objetivo          |              **0** |
| clases privadas primarias               |              **7** |
| relaciones actuales clasificadas        |         **1 de 1** |
| funciones actuales clasificadas         |         **1 de 1** |
| vistas actuales                         |              **0** |
| triggers actuales                       |              **0** |
| requisitos nuevos                       |             **32** |
| cambios físicos                         |              **0** |

#### 34. Continuidad inmediata

```text
ÚLTIMA TAREA APROBADA
SUPA-ARC-005 — Definir capa expuesta de vistas y RPC
        ↓
TAREA ACTUAL APROBADA
SUPA-ARC-006 — Definir capa privada de helpers y lógica interna
        ↓
SIGUIENTE TAREA RESERVADA
SUPA-ARC-007 — Definir esquema transversal de auditoría y eventos
```

`SUPA-ARC-007` permanece reservada y no se inicia hasta una solicitud expresa de continuidad.


### ✅ SUPA-ARC-007 — Definir esquema transversal de auditoría y eventos

**Estado:** APROBADA
**Fecha de preparación documental:** 2026-07-29
**Bloque propietario:** BLOQUE E3 — Arquitectura canónica de datos y gobierno integral de Supabase
**Tarea anterior:** `SUPA-ARC-006 — Definir capa privada de helpers y lógica interna` — APROBADA
**Siguiente tarea:** `SUPA-ARC-008 — Definir modelo canónico de Auth e identidad empresarial`
**Proyecto de referencia:** `vento-os-dev` — `clzdpinthhtknkmefsxx`
**Fuentes remotas observadas:** `00_CABECERA_Y_ESTADO.md` blob `573ab643a85c0cc38d61b846e314634cf5d27554`; `04_ARQUITECTURA_CANONICA_OBJETIVO.md` blob `bd90cc8e9065702cf87886f54bf1ad90222083f7`; `01_EVENTOS_ENTRE_APLICACIONES.md` blob `8502533e144e5c1878192f470e766da99c522ecd`; `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` blob `c2816d093e7a66ac11e7d1bceceaa00eac7df1e5`; `delivery-contract.json` blob `01f197364800a1998867eb4e9a8d104429bb222f`; `active-sequence.json` blob `0c63430b3efff08c308482196d781a20a424d172`
**Tipo de tarea:** definición normativa del schema transversal de auditoría, registro durable de eventos y outbox de Vento OS; sin crear, renombrar, mover o retirar schemas u objetos, sin DDL, DML, migraciones, particiones, índices, backfills, cambios de Data API, `api.schemas`, `extra_search_path`, grants, RLS, Auth, Storage, Realtime, Edge Functions, cron, colas, secretos, código, datos ni despliegues

#### 1. Objetivo

Definir la frontera transversal que conservará evidencia auditable, eventos empresariales durables, outbox, intentos de emisión, entregas, deduplicación, efectos consumidores, conciliaciones y correcciones, sin convertir esa capa en fuente de verdad de los 26 dominios ni anticipar el transporte que corresponde a `SUPA-ARC-019` y `SUPA-ARC-020`.

```text
HECHO EMPRESARIAL CONFIRMADO EN OWNER SCHEMA
        +
AUTORIZACIÓN, COMANDO Y RESULTADO
        ↓ MISMA TRANSACCIÓN CUANDO APLIQUE
SCHEMA TRANSVERSAL audit
        ├── EVIDENCIA AUDITABLE
        ├── EVENTO EMPRESARIAL DURABLE
        ├── OUTBOX Y EMISIONES
        ├── ENTREGAS E INBOX
        ├── EFECTOS CONSUMIDORES
        └── CONCILIACIÓN Y CORRECCIÓN
        ↓
TRANSPORTE, REALTIME, EDGE, WEBHOOKS Y CRON EN TAREAS POSTERIORES
```

La capa permitirá reconstruir causalidad y resultados sin duplicar el estado empresarial, sin usar logs como evidencia suficiente y sin confundir publicación, entrega, consumo o efecto.

#### 2. Artefacto producido

```text
SUPABASE-TRANSVERSAL-AUDIT-EVENT-SCHEMA-001@1.0.0
```

| Propiedad                              |                                 Valor |
| -------------------------------------- | ------------------------------------: |
| `canonical_transversal_schema_name`    |                               `audit` |
| `schema_class`                         | `VENTO_TRANSVERSAL_AUDIT_EVENT_LAYER` |
| `business_domain_authority`            |                                `NONE` |
| `owner_schema_identity`                |                                `NONE` |
| `data_api_exposure_target`             |                                `NONE` |
| `direct_client_access_target`          |                                 **0** |
| `authoritative_business_tables_target` |                                 **0** |
| `primary_object_kinds`                 |                                **10** |
| `covered_processes`                    |                                **69** |
| `normal_event_definitions`             |                               **395** |
| `audit_planes`                         |                                **14** |
| `audit_action_types`                   |                                **22** |
| `audit_outcomes`                       |                                **17** |
| `audit_commit_classes`                 |                                 **3** |
| `transport_guarantee`                  |                       `AT_LEAST_ONCE` |
| `physical_changes_authorized`          |                                 **0** |

#### 3. Fuentes canónicas consumidas

| Fuente                                                       | Decisión consumida                                                                                                                |
| ------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------- |
| `01_PROTOCOLO.md`                                            | continuidad, propiedad, trazabilidad, pendientes con destino exacto, pruebas y separación entre definición e implementación       |
| `delivery-contract.json`                                     | una sola tarea, sin contenido operativo de chat y registro 04A completo con nombre único                                          |
| `active-sequence.json`                                       | secuencia `SUPA-ARC-001` a `SUPA-ARC-025`; `SUPA-ARC-007` como tarea actual                                                       |
| `SUPABASE-SCHEMA-SEPARATION-PRINCIPLES-001@1.0.0`            | evento separado de transporte; dependencia no transfiere autoridad; cambios reproducibles desde `vento-shell`                     |
| `SUPABASE-AUTHORITATIVE-SCHEMA-OWNERSHIP-REGISTRY-001@1.0.0` | 26 owner schemas y autoridad única por hecho empresarial                                                                          |
| `SUPABASE-PUBLIC-SCHEMA-FUTURE-FUNCTION-001@1.0.0`           | `public` como compatibilidad transitoria sin autoridad ni destino de auditoría permanente                                         |
| `SUPABASE-EXPOSED-CONTRACT-LAYER-001@1.0.0`                  | `api` como capa expuesta; acceso a auditoría solo mediante contratos mínimos autorizados                                          |
| `SUPABASE-PRIVATE-INTERNAL-LAYER-001@1.0.0`                  | `app_private` excluye auditoría, outbox y eventos como persistencia transversal                                                   |
| `ENTERPRISE-EVENT-CATALOG-001@1.0.0`                         | 395 definiciones normales de 69 procesos y sobre `EVENT-ENVELOPE-001`                                                             |
| `ENTERPRISE-INTEGRATION-AUDIT-POLICY-001@1.0.0`              | 14 planos, 22 tipos de acción, 17 outcomes y tres clases de compromiso de auditoría                                               |
| `INT-APP-004` a `INT-APP-010`                                | idempotencia, reintentos, compensaciones, auditoría, pending, errores parciales y prohibición de escrituras cruzadas sin contrato |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`           | 5.013 requisitos hasta `SUPA-ARC-006`; rango `TREQ-SUPABASE-001` a `718`                                                          |

#### 4. Decisión canónica

Vento OS tendrá exactamente un schema transversal de base de datos llamado `audit` para persistir evidencia auditable y registros operativos durables de eventos.

```text
audit
├── AUDIT_ENTRY
├── AUDIT_LINK
├── BUSINESS_EVENT_RECORD
├── OUTBOX_ITEM
├── EMISSION_ATTEMPT
├── DELIVERY_ATTEMPT
├── CONSUMER_INBOX_RECEIPT
├── CONSUMER_EFFECT_RECORD
├── RECONCILIATION_CASE
└── AUDIT_CORRECTION
```

La decisión implica:

1. `audit` no representa dominio, aplicación, producto, proceso ni owner schema;
2. el owner schema productor conserva identidad, invariantes, estado y autoridad del hecho;
3. `audit` conserva evidencia, causalidad, publicación y procesamiento, pero no reemplaza la fuente empresarial;
4. el evento empresarial durable se registra con identidad y versión propias, vinculado al hecho confirmado;
5. el outbox se crea en la misma transacción del hecho y del evento cuando la clase de compromiso lo exige;
6. publicación, entrega, claim, efecto, retry y conciliación son resultados diferentes y no se colapsan en un único estado;
7. `audit` permanecerá fuera de Data API y de acceso directo de roles cliente;
8. Realtime, topics, canales, Edge Functions, webhooks, cron y colas se diseñarán en `SUPA-ARC-019` y `SUPA-ARC-020` sin crear otro registro autoritativo de eventos.

#### 5. Fronteras de responsabilidad

| Responsabilidad                                                | Ubicación objetivo                                     | Regla                                       |
| -------------------------------------------------------------- | ------------------------------------------------------ | ------------------------------------------- |
| hecho empresarial, estado e invariantes                        | owner schema `VSCHEMA-*`                               | única fuente de verdad                      |
| contrato cliente o sistema consumidor                          | `api`                                                  | proyección o comando autorizado             |
| helper técnico no expuesto                                     | `app_private`                                          | sin persistencia transversal                |
| auditoría, evento durable, outbox y evidencia de procesamiento | `audit`                                                | conserva productor, causalidad y resultados |
| wrapper legacy                                                 | `public` temporal                                      | compatibilidad con salida obligatoria       |
| transporte Realtime y publicación                              | `SUPA-ARC-019`                                         | no sustituye el evento durable              |
| Edge, webhook, cron, HTTP y workers                            | `SUPA-ARC-020`                                         | ejecución y adaptación, no autoridad        |
| retención, archivado, respaldo y recuperación                  | `SUPA-ARC-022`                                         | aplica clases sin romper integridad         |
| analítica                                                      | owner schema `business_insights` o proyección aprobada | consume hechos; no reescribe auditoría      |

#### 6. Clases primarias permitidas

| Clase                    | Propósito                                                                    | Mutabilidad                                    |
| ------------------------ | ---------------------------------------------------------------------------- | ---------------------------------------------- |
| `AUDIT_ENTRY`            | registrar una acción, decisión, intento o resultado auditable                | append-only                                    |
| `AUDIT_LINK`             | relacionar entradas, recursos, evidencias y artefactos sin duplicar payloads | append-only                                    |
| `BUSINESS_EVENT_RECORD`  | registrar un hecho empresarial durable del catálogo canónico                 | inmutable                                      |
| `OUTBOX_ITEM`            | conservar la obligación durable de publicación                               | estado operativo monotónico y cuerpo inmutable |
| `EMISSION_ATTEMPT`       | registrar cada intento de publicación y su resultado técnico                 | append-only                                    |
| `DELIVERY_ATTEMPT`       | registrar cada intento de entrega por consumidora                            | append-only                                    |
| `CONSUMER_INBOX_RECEIPT` | deduplicar por consumidora y evento y conservar resultado previo             | identidad única y cierre controlado            |
| `CONSUMER_EFFECT_RECORD` | registrar el efecto propio confirmado, no-op o fallo de la consumidora       | append-only                                    |
| `RECONCILIATION_CASE`    | conservar incertidumbre, fuentes comparadas, decisión y residual             | lifecycle controlado                           |
| `AUDIT_CORRECTION`       | corregir o ampliar una entrada sin modificar la original                     | append-only                                    |

No se crearán clases genéricas de log, payload, mensaje o historia que eviten declarar semántica, owner, sensibilidad, lifecycle y responsabilidad.

#### 7. Autoridad y propiedad por registro

Cada registro deberá declarar:

```text
producer_owner_schema_id
+ producer_domain_id
+ process_id
+ owner_application
+ aggregate_type
+ aggregate_id
+ aggregate_version
+ source_fact_reference
+ source_command_id
```

Reglas:

1. el productor válido es el owner del hecho, no la aplicación que transporta o presenta;
2. una consumidora no puede emitir el evento original como si fuera productora;
3. una entrada transversal no adquiere owner empresarial propio;
4. un evento derivado de varios dominios deberá identificar un único productor primario y referencias a participantes;
5. una coordinación interdominio requiere los contratos de `SUPA-ARC-016` y `SUPA-ARC-017`;
6. una FK, trigger, función o publicación no transfiere autoridad.

#### 8. Separación semántica obligatoria

| Elemento           | Qué afirma                                        | Qué no afirma                      |
| ------------------ | ------------------------------------------------- | ---------------------------------- |
| comando            | solicitud aceptada o rechazada                    | hecho ya confirmado                |
| auditoría          | quién o qué intentó, decidió o ejecutó una acción | fuente completa del proceso        |
| evento empresarial | hecho durable ya confirmado                       | orden, permiso o entrega           |
| outbox             | obligación durable de publicar un evento          | publicación exitosa                |
| emisión            | intento o aceptación del transporte               | consumo o efecto                   |
| entrega            | llegada a una consumidora concreta                | aplicación del efecto              |
| inbox              | claim, deduplicación y resultado previo           | efecto nuevo por sí solo           |
| efecto consumidor  | resultado propio de la consumidora                | resultado de otras consumidoras    |
| log técnico        | diagnóstico de infraestructura                    | evidencia empresarial suficiente   |
| métrica            | agregación para medición                          | historia completa de una instancia |

Un `200`, ACK, log, span, publicación Realtime o cambio de UI no podrá cerrar un hecho empresarial ni un efecto consumidor.

#### 9. Registro canónico de objetos de `audit`

Cada objeto físico futuro deberá registrarse con:

```text
transversal_object_id
+ object_kind
+ qualified_name
+ lifecycle_status
+ technical_owner
+ producer_owner_schema_ids
+ process_ids
+ audit_planes
+ action_types_or_event_definitions
+ caller_classes
+ read_write_mode
+ security_mode
+ owner_role
+ fixed_search_path
+ grants_contract
+ rls_contract
+ sensitivity_classes
+ retention_classes
+ legal_hold_behavior
+ immutability_contract
+ idempotency_contract
+ ordering_contract
+ partitioning_contract
+ indexing_contract
+ integrity_contract
+ observability_contract
+ current_consumers
+ deprecation_gate
+ rollback_contract
+ test_requirement_ids
```

No se aceptarán owner genérico, consumidor supuesto, retención narrativa, payload sin clasificación, tabla sin lifecycle ni objeto sin contrato de integridad.

#### 10. Sobre mínimo de `AUDIT_ENTRY`

La entrada auditable deberá poder representar los campos obligatorios por tipo definidos por `INT-APP-007`, incluyendo:

```text
audit_entry_id
+ audit_schema_version
+ audit_plane
+ audit_action_type
+ audit_outcome
+ occurred_at
+ recorded_at
+ completed_at
+ principal_id
+ effective_actor_id
+ technical_principal_id
+ actor_type
+ session_id
+ device_id
+ site_id
+ area_id
+ shift_id
+ permission_key
+ authorization_decision
+ authorization_reason_codes
+ process_id
+ process_instance_id
+ resource_type
+ resource_id
+ resource_version
+ command_id
+ event_id
+ delivery_id
+ attempt_id
+ effect_id
+ correlation_id
+ causation_id
+ result_code
+ error_class
+ result_reference
+ evidence_references
+ sensitivity_class
+ access_scope
+ retention_class
+ integrity_reference
```

Los campos no aplicables se omiten por contrato. Los campos obligatorios de una acción no podrán degradarse a opcionales por conveniencia de una aplicación.

#### 11. Sobre mínimo de `BUSINESS_EVENT_RECORD`

Todo evento durable deberá preservar el contrato `EVENT-ENVELOPE-001` y, como mínimo:

```text
event_id
+ event_definition_id
+ event_type
+ event_version
+ process_id
+ process_instance_id
+ producer_application
+ producer_owner_schema_id
+ aggregate_type
+ aggregate_id
+ aggregate_version
+ occurred_at
+ recorded_at
+ correlation_id
+ causation_id
+ source_command_id
+ idempotency_key_reference
+ result_reference
+ output_references
+ evidence_references
+ audit_reference
+ sensitivity_class
+ access_scope
+ retention_class
+ schema_version
```

El payload será mínimo, versionado y suficiente para consumidoras autorizadas. Datos adicionales se recuperarán desde contratos propietarios, no mediante copias indiscriminadas.

#### 12. Atomicidad y clases de compromiso

Se preservan las tres clases aprobadas:

| Clase                          | Regla arquitectónica                                                                                                                  |
| ------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------- |
| `AUDIT_ATOMIC_REQUIRED`        | hecho, evento y ancla auditable quedan en la misma transacción o en un mecanismo equivalente que impide presentar éxito sin evidencia |
| `AUDIT_DURABLE_BEFORE_ACK`     | la frontera no confirma al emisor hasta persistir registro durable o contención verificable                                           |
| `AUDIT_DURABLE_BUFFER_ALLOWED` | solo para enriquecimiento no decisorio con ancla previa, identidad fija, buffer durable y recuperación                                |

Para eventos empresariales publicados desde PostgreSQL, la regla predeterminada será:

```text
OWNER FACT + BUSINESS_EVENT_RECORD + OUTBOX_ITEM
= UNA TRANSACCIÓN ATÓMICA
```

No se permitirá publicar primero y registrar después, ni confirmar éxito mientras el evento o la evidencia requerida permanezcan únicamente en memoria.

#### 13. Outbox, emisiones y estado operativo

1. `OUTBOX_ITEM` tendrá identidad estable, `event_id` único, destino lógico, prioridad, disponibilidad, política de retry y lifecycle.
2. El contenido semántico del evento y su hash permanecerán inmutables.
3. Claim, lease, intento, timeout y liberación se registrarán sin reescribir la historia.
4. Cada `EMISSION_ATTEMPT` tendrá `attempt_id` y número propios, conservando el mismo `event_id`.
5. La aceptación del transporte no marcará consumo ni efecto.
6. Un resultado desconocido activa conciliación antes de una repetición que pueda duplicar efectos.
7. El vocabulario de pending, retry y dead-letter deberá conservar las decisiones de `INT-APP-005`, `INT-APP-008` e `INT-APP-009`.
8. El transporte concreto, colas y publicaciones permanecen reservados a `SUPA-ARC-019` y `SUPA-ARC-020`.

#### 14. Entrega, inbox y efecto consumidor

| Etapa     | Identidad mínima                                  | Regla                                                 |
| --------- | ------------------------------------------------- | ----------------------------------------------------- |
| entrega   | `consumer_application + delivery_id + attempt_id` | independiente para cada consumidora                   |
| inbox     | `consumer_application + event_id`                 | única, idempotente y con resultado previo recuperable |
| efecto    | `consumer_application + effect_id`                | confirma solo el efecto de esa propietaria            |
| duplicado | misma identidad y huella                          | devuelve resultado anterior o no-op aprobado          |
| conflicto | misma identidad y huella incompatible             | no aplica efecto y abre conciliación                  |

El fallo de una consumidora no revierte el hecho del productor ni altera el resultado de otras consumidoras.

#### 15. Identidad, causalidad y orden

1. `audit_entry_id`, `event_id`, `outbox_item_id`, `delivery_id`, `attempt_id` y `effect_id` serán identidades diferentes.
2. `correlation_id` agrupa un caso; `causation_id` identifica la causa inmediata.
3. No existirá orden global entre todos los dominios.
4. El orden aplicable se resolverá por agregado, `aggregate_version`, causalidad y dependencias.
5. `occurred_at` no reemplaza la versión ni la causalidad.
6. Un evento tardío no podrá sobrescribir un estado o versión posterior.
7. Una restauración deberá preservar identidades, relaciones, secuencia por agregado y resultados previos.

#### 16. Inmutabilidad, corrección e integridad

1. `AUDIT_ENTRY`, `BUSINESS_EVENT_RECORD`, intentos y efectos confirmados serán append-only.
2. Las interfaces y servicios ordinarios no podrán actualizar ni eliminar evidencia histórica.
3. Toda corrección utilizará `AUDIT_CORRECTION` enlazada a la entrada original, con razón, autoridad y antes o después mínimo.
4. Un rollback de código no borrará hechos ni efectos ya ocurridos.
5. Inserciones, modificaciones o eliminaciones no autorizadas deberán ser detectables.
6. La técnica exacta de firma, hash encadenado, sello o control equivalente se completará en `SUPA-ARC-012`, `SUPA-ARC-021` y `SUPA-ARC-022`.
7. Una brecha histórica se registra como conciliación; nunca se fabrican entradas retrospectivas para simular cobertura.

#### 17. Autorización y acceso

1. `audit` permanecerá fuera de `api.schemas` y de `extra_search_path` global.
2. `PUBLIC`, `anon` y `authenticated` tendrán acceso directo objetivo igual a cero.
3. `service_role` no recibirá acceso global por defecto; los servicios utilizarán funciones o roles nominales mínimos.
4. Crear una entrada no concede derecho a consultarla.
5. Las consultas autorizadas se ofrecerán mediante `api` con finalidad, proceso, sensibilidad, territorio, filtros y límites explícitos.
6. Accesos sensibles, búsquedas, vistas previas, exportaciones, impresiones y correcciones de auditoría deberán auditarse.
7. RLS, grants, ACL por defecto, owners y funciones privilegiadas se resolverán en `SUPA-ARC-014` y `SUPA-ARC-015`.

#### 18. Minimización, sensibilidad y redacción

- secretos, tokens, credenciales, firmas completas, contraseñas y claves quedan prohibidos;
- payloads externos completos se conservarán en almacenamiento protegido cuando exista finalidad, y `audit` guardará hash o referencia;
- datos personales, laborales, financieros, médicos y técnicos se reducirán a identificadores o referencias mínimas;
- `before` y `after` usarán campos cambiados, hashes o referencias, no copias completas por defecto;
- errores no expondrán SQL, stack traces, nombres internos ni datos sensibles;
- cada evento y entrada declarará sensibilidad, acceso y retención;
- una proyección de consulta aplicará minimización adicional según audiencia.

#### 19. Denegaciones y decisiones de autorización

Toda operación sensible deberá conservar:

```text
principal_id
+ effective_actor_id
+ technical_principal_id
+ permission_key
+ resource_reference
+ territory_reference
+ context_reference
+ authorization_decision
+ authorization_reason_codes
+ authorization_policy_version
```

Una denegación se audita aunque no exista mutación. La entrada no repetirá reglas de autorización ni convertirá roles PostgreSQL en roles empresariales.

#### 20. Reintentos, resultado desconocido y conciliación

1. Cada retry crea otro intento, no otro evento ni otra operación empresarial.
2. El presupuesto, backoff, error, momento y resultado de cada intento quedan vinculados.
3. `UNKNOWN_OUTCOME` bloquea reejecución sensible hasta consultar o conciliar.
4. `RETRY_EXHAUSTED` no fabrica compensación ni cierre.
5. `RECONCILIATION_CASE` conserva fuentes comparadas, diferencias, autoridad, decisión, residual, acciones y evidencia.
6. Toda obligación residual tendrá owner y tarea de resolución.
7. Una conciliación no reinterpreta ni elimina el hecho original.

#### 21. Compensaciones y escrituras interdominio

La auditoría de una compensación deberá enlazar plan, versión, acción CCR, efecto original, reversibilidad, pasos, intentos, verificaciones, residuales y resultado.

Ningún registro en `audit` podrá ejecutar por sí mismo una escritura inversa en otro dominio. Las coordinaciones y compensaciones materiales requieren `SUPA-ARC-016`, `SUPA-ARC-017` y los contratos de `INT-APP-006` e `INT-APP-010`.

#### 22. Offline, replay y backfill

- offline conserva actor, dispositivo, sesión, momento del hecho, recepción y calidad del reloj;
- sincronización tardía revalida autorización, versión, expiración y conflictos;
- replay conserva `event_id`, audiencia histórica y resultados previos;
- backfill declara fuente, lote, ventana, versión, autorización y resultado por elemento;
- replay o backfill no activan efectos sensibles sin permiso explícito;
- un lote no puede declararse correcto solo por su resumen si existen elementos fallidos o inciertos.

#### 23. Tiempo, retención y legal hold

1. `occurred_at`, `recorded_at` y `completed_at` conservarán semánticas distintas.
2. La base persistirá UTC y zona IANA cuando el contexto local sea material.
3. La captura tardía no cambia el momento del hecho.
4. Cada clase declarará `retention_class` y comportamiento de legal hold.
5. Las relaciones entre evento, auditoría, evidencia y resultado deberán sobrevivir archivado y restauración.
6. Periodos exactos, particionamiento, compresión, archivo y disposición se decidirán en `SUPA-ARC-021` y `SUPA-ARC-022`.
7. El vencimiento técnico de un intento no habilita otro efecto irreversible.

#### 24. Rendimiento, particionamiento e índices

La futura materialización deberá separar patrones de escritura y consulta:

| Patrón                     | Claves mínimas de diseño                              |
| -------------------------- | ----------------------------------------------------- |
| reconstrucción por proceso | `process_id`, `process_instance_id`, tiempo           |
| trazabilidad por agregado  | `aggregate_type`, `aggregate_id`, `aggregate_version` |
| causalidad                 | `correlation_id`, `causation_id`, `event_id`          |
| outbox pendiente           | lifecycle, disponibilidad, prioridad y claim          |
| entrega por consumidora    | consumidora, evento, intento y resultado              |
| investigación de seguridad | actor, recurso, decisión, tiempo y sensibilidad       |
| retención                  | clase, fecha, partición y legal hold                  |

La selección física de índices, particiones y mantenimiento pertenece a `SUPA-ARC-021` y `SUPA-ARC-022`; esta tarea fija los patrones que no podrán perderse.

#### 25. Relación con `api`, `app_private` y `public`

| Capa          | Relación con `audit`                                                          |
| ------------- | ----------------------------------------------------------------------------- |
| owner schemas | escriben evidencia y eventos mediante contratos atómicos; conservan autoridad |
| `api`         | expone únicamente consultas o comandos autorizados y minimizados              |
| `app_private` | puede usar primitivas internas; no persiste auditoría ni outbox propios       |
| `public`      | no aloja la capa objetivo; wrappers legacy tienen salida obligatoria          |
| VITAL         | permanece fuera de Vento OS y no comparte `audit` por coexistencia            |

No se permitirá que una aplicación consulte tablas de `audit` directamente para reconstruir una fuente que pertenece a un owner schema.

#### 26. Relación con Realtime, Edge, webhooks y cron

`audit` define la persistencia durable. No define por sí solo:

- publicaciones Realtime, canales o filtros;
- broker, queue, topic, worker o suscripción;
- invocación de Edge Functions;
- webhooks entrantes o salientes;
- jobs cron, `pg_net` o HTTP;
- alertas, dashboards o proveedor de observabilidad.

`SUPA-ARC-019` definirá Realtime y eventos en transporte. `SUPA-ARC-020` definirá Edge Functions, webhooks y cron. Ambos deberán consumir el evento durable y conservar `event_id`, causalidad, idempotencia y evidencia sin crear otra fuente de verdad.

#### 27. Línea base actual y clasificación obligatoria

El estado actual mantiene auditoría y eventos distribuidos entre owner schemas, `public`, schemas especializados, triggers, tablas de historia, eventos de estado y webhooks. Entre las superficies ya documentadas aparecen `public.order_status_events`, `public.shift_runtime_events`, `public.shared_operational_device_events`, `payments.webhook_events`, `club.audit_events`, `talento.application_events` y proyecciones de auditoría.

Reglas:

1. la existencia actual no implica aceptación en `audit`;
2. cada objeto se clasificará como hecho propietario, auditoría, evento, outbox, intento, entrega, inbox, efecto, conciliación, compatibilidad o retiro;
3. una tabla de historia que sea fuente empresarial permanecerá en su owner schema;
4. una proyección de auditoría no se convertirá en tabla autoritativa;
5. triggers y funciones actuales deberán mapear producer, atomicidad, seguridad, payload, consumidores y fallo;
6. el inventario objeto por objeto corresponde a `SUPA-TRANS-001` a `SUPA-TRANS-003`;
7. cualquier superficie adicional detectada constituye drift y deberá clasificarse antes del cierre.

#### 28. Orden obligatorio de materialización futura

```text
1. INVENTARIAR AUDITORÍA, EVENTOS, HISTORIAS, TRIGGERS Y CONSUMIDORES
2. CLASIFICAR FUENTE PROPIETARIA Y CLASE TRANSVERSAL
3. DEFINIR CONTRATOS, IDENTIDADES, SEGURIDAD Y RETENCIÓN
4. CREAR audit Y CONTROLES DE ACCESO
5. MATERIALIZAR EVENTO, AUDITORÍA Y OUTBOX ATÓMICOS
6. IMPLEMENTAR INTENTOS, ENTREGA, INBOX, EFECTOS Y CONCILIACIÓN
7. ADAPTAR TRANSPORTE Y CONSUMIDORES POR OLEADAS
8. VERIFICAR PARIDAD, REPLAY, RESTAURACIÓN Y ROLLBACK
9. DEPRECAR SUPERFICIES FRAGMENTADAS Y WRAPPERS LEGACY
10. CERTIFICAR INTEGRIDAD, RENDIMIENTO Y AUSENCIA DE DRIFT
```

El orden no autoriza ejecución física. Cada cambio deberá pasar por `SUPA-TRANS-001` a `SUPA-TRANS-015` y los paquetes de implementación correspondientes.

#### 29. Riesgos restringidos y carryover

| Riesgo o hallazgo                   | Efecto de esta tarea                                | Resolución restante              |
| ----------------------------------- | --------------------------------------------------- | -------------------------------- |
| auditoría fragmentada               | define una frontera única sin mover todavía objetos | `SUPA-TRANS-001` a `003`         |
| publicación sin commit atómico      | exige hecho, evento y outbox en una transacción     | `SUPA-ARC-013`; `016`; `019`     |
| ACK tratado como resultado          | separa emisión, entrega, inbox y efecto             | `SUPA-ARC-019`; `020`            |
| `PUBLIC EXECUTE` o acceso cliente   | fija cero acceso directo a `audit`                  | `SUPA-ARC-014`; `015`            |
| payloads sensibles                  | exige minimización, referencias y redacción         | `SUPA-ARC-015`; `022`; `024`     |
| retry y resultado desconocido       | exige intentos, presupuesto y conciliación          | `SUPA-ARC-019`; `020`; `022`     |
| orden global supuesto               | fija orden por agregado y causalidad                | `SUPA-ARC-012`; `019`; `021`     |
| modificación o borrado de evidencia | exige append-only, corrección enlazada e integridad | `SUPA-ARC-012`; `022`            |
| crecimiento sin control             | define patrones para partición, índice y retención  | `SUPA-ARC-021`; `022`            |
| drift de objetos y contratos        | exige registro y validación recurrente              | `SUPA-ARC-025`; `SUPA-TRANS-015` |

Ningún riesgo queda aceptado, mitigado o cerrado por esta definición.

#### 30. Decisiones reservadas

| Decisión                                                         | Tarea propietaria                       |
| ---------------------------------------------------------------- | --------------------------------------- |
| modelo de Auth, actor, vínculo y sesión                          | `SUPA-ARC-008` a `SUPA-ARC-010`         |
| convenciones físicas de nombres, claves y timestamps             | `SUPA-ARC-011`; `SUPA-ARC-012`          |
| funciones, RPC y triggers de escritura                           | `SUPA-ARC-013`                          |
| excepciones `SECURITY DEFINER`                                   | `SUPA-ARC-014`                          |
| grants, RLS, roles y ACL por defecto                             | `SUPA-ARC-015`                          |
| contratos por dominio y atomicidad de comandos                   | `SUPA-ARC-016`                          |
| escrituras y coordinaciones interdominio                         | `SUPA-ARC-017`                          |
| Storage y evidencia física                                       | `SUPA-ARC-018`                          |
| transporte Realtime, publicaciones y consumidores                | `SUPA-ARC-019`                          |
| Edge Functions, webhooks, cron, HTTP y colas                     | `SUPA-ARC-020`                          |
| índices, particiones y capacidad                                 | `SUPA-ARC-021`                          |
| retención, legal hold, archivo, respaldo y recuperación          | `SUPA-ARC-022`                          |
| tipos para productores y consumidores                            | `SUPA-ARC-023`                          |
| paridad de ambientes                                             | `SUPA-ARC-024`; `SUPA-TRANS-013`        |
| consolidación por ADR                                            | `SUPA-ARC-025`                          |
| inventario, migración, compatibilidad, replay, retiro y rollback | `SUPA-TRANS-001` a `SUPA-TRANS-015`     |
| implementación física                                            | paquetes E5 y BLOQUE R correspondientes |

#### 31. Límites de autorización

Esta tarea no autoriza:

- crear, renombrar, alterar o retirar el schema `audit`;
- crear tablas, funciones, triggers, vistas, índices, particiones, publicaciones, colas o jobs;
- mover objetos actuales ni copiar datos históricos;
- modificar `public`, `api`, `app_private` u owner schemas;
- cambiar `api.schemas`, `extra_search_path`, grants, RLS, ACL, owners o roles;
- habilitar Realtime, Edge Functions, webhooks, cron, `pg_net` o proveedores externos;
- ejecutar migraciones, DDL, DML, backfills, replay, conciliaciones o pruebas mutantes;
- declarar cubierto un evento, audit plane o consumidor sin implementación y evidencia;
- iniciar `SUPA-ARC-008` antes de aprobación expresa.

#### 32. Requisitos de prueba generados

**Resultado:** GENERA REQUISITOS DE PRUEBA

Se incorporan al Registro Canónico de Requisitos de Prueba:

```text
TREQ-SUPABASE-719 a TREQ-SUPABASE-756
```

Los treinta y ocho requisitos protegen identidad y aislamiento del schema, autoridad del productor, atomicidad, inmutabilidad, catálogo de eventos y auditoría, outbox, emisión, entrega, inbox, efectos, idempotencia, causalidad, seguridad, minimización, conciliación, compensación, replay, retención, integridad, rendimiento, clasificación del estado actual y detección recurrente de drift. El detalle completo existe únicamente en `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`.

#### 33. Criterios de aceptación

- [ ] Existe exactamente un schema transversal objetivo llamado `audit`.
- [ ] `audit` no representa dominio, aplicación, owner schema ni fuente de verdad.
- [ ] Los 26 owner schemas conservan autoridad sobre sus hechos.
- [ ] Se permiten exactamente diez clases primarias diferenciadas.
- [ ] El objetivo contiene cero tablas empresariales autoritativas y cero acceso directo de roles cliente.
- [ ] Los 69 procesos y 395 definiciones de eventos pueden resolver producer, agregado, versión y evidencia.
- [ ] Se preservan los 14 planos, 22 tipos de acción, 17 outcomes y tres clases de compromiso.
- [ ] Hecho, evento, outbox y ancla auditable son atómicos cuando el contrato lo exige.
- [ ] Publicación, entrega, inbox y efecto permanecen estados distintos.
- [ ] Auditoría y eventos son append-only; las correcciones crean entradas enlazadas.
- [ ] Principal, actor efectivo y principal técnico permanecen separados.
- [ ] El orden es por agregado y causalidad, nunca global por timestamp.
- [ ] Payloads, secretos y datos sensibles se minimizan mediante referencias y hashes.
- [ ] Replay, backfill, retry y resultado desconocido conservan identidad y controles explícitos.
- [ ] `audit` queda fuera de Data API; toda consulta usa contratos autorizados de `api`.
- [ ] Realtime, Edge, webhooks y cron permanecen reservados a sus tareas exactas.
- [ ] Las superficies actuales quedan dentro del universo de clasificación sin aceptación automática.
- [ ] Se generan `TREQ-SUPABASE-719` a `TREQ-SUPABASE-756`.
- [ ] No se ejecutan cambios físicos, código ni implementación.
- [ ] `SUPA-ARC-008` permanece reservada.

#### 34. Controles estructurales requeridos

| Control                                      | Resultado esperado |
| -------------------------------------------- | -----------------: |
| schemas transversales de auditoría y eventos |              **1** |
| nombre del schema                            |            `audit` |
| dominios asignados                           |              **0** |
| owner schemas asignados                      |              **0** |
| acceso directo de roles cliente              |              **0** |
| tablas autoritativas objetivo                |              **0** |
| clases primarias                             |             **10** |
| procesos cubiertos                           |       **69 de 69** |
| definiciones normales de evento cubiertas    |     **395 de 395** |
| planos de auditoría preservados              |       **14 de 14** |
| tipos de acción preservados                  |       **22 de 22** |
| outcomes preservados                         |       **17 de 17** |
| clases de compromiso preservadas             |         **3 de 3** |
| objetos actuales aceptados automáticamente   |              **0** |
| requisitos nuevos                            |             **38** |
| cambios físicos                              |              **0** |

#### 35. Continuidad inmediata

```text
ÚLTIMA TAREA APROBADA
SUPA-ARC-006 — Definir capa privada de helpers y lógica interna
        ↓
TAREA ACTUAL APROBADA
SUPA-ARC-007 — Definir esquema transversal de auditoría y eventos
        ↓
SIGUIENTE TAREA RESERVADA
SUPA-ARC-008 — Definir modelo canónico de Auth e identidad empresarial
```

`SUPA-ARC-008` permanece reservada y no se inicia hasta una solicitud expresa de continuidad.


### ✅ SUPA-ARC-008 — Definir modelo canónico de Auth e identidad empresarial

**Estado:** APROBADA
**Fecha de preparación documental:** 2026-07-29
**Bloque propietario:** BLOQUE E3 — Arquitectura canónica de datos y gobierno integral de Supabase
**Tarea anterior:** `SUPA-ARC-007 — Definir esquema transversal de auditoría y eventos` — APROBADA
**Tarea siguiente:** `SUPA-ARC-009 — Definir vínculo de auth.users con trabajador, cliente y dispositivo`
**Proyecto de referencia:** `vento-os-dev` — `clzdpinthhtknkmefsxx`
**Fuentes remotas observadas:** `00_CABECERA_Y_ESTADO.md` blob `18a3e5f2a517f4b3886a438fd85f7a478db6cbed`; `04_ARQUITECTURA_CANONICA_OBJETIVO.md` blob `11b6d0c7f70f739c1108c2a1316d68c37b1e2dbe`; `01_IDENTIDAD_Y_ROLES.md` blob `ed957e29cff70ff9042bbc2b739464587f928cdb`; `06_ADR_AUTH_001.md` blob `e41074801c22a761123ba103353f2981672078a2`; `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` blob `dab90321d79d215d6cc5ebd353976a5bd60e9156`; `delivery-contract.json` blob `01f197364800a1998867eb4e9a8d104429bb222f`; `active-sequence.json` blob `0c63430b3efff08c308482196d781a20a424d172`
**Tipo de tarea:** definición normativa del modelo objetivo de autenticación, principal, identidad empresarial y actor efectivo; sin crear, alterar o eliminar usuarios, identidades, sesiones, factores, tablas, schemas, funciones, triggers, RLS, grants, claims, proveedores, configuraciones, migraciones, código, datos ni despliegues

#### 1. Objetivo

Definir cómo Vento OS utilizará Supabase Auth para autenticar credenciales sin convertir `auth.users`, los proveedores, los tokens o sus metadatos en fuente de verdad de trabajador, cliente, dispositivo, rol, permiso, sede, área, turno o actor efectivo.

```text
CREDENCIAL VALIDADA POR SUPABASE AUTH
        ↓
PRINCIPAL AUTENTICADO
        ↓
VÍNCULOS EMPRESARIALES RESUELTOS
        ↓
IDENTIDAD DE DOMINIO REQUERIDA
        ↓
ACTOR EFECTIVO
        ↓
CONTEXTO + AUTORIZACIÓN + AUDITORÍA
```

La autenticación demostrará quién presenta una credencial. La identidad empresarial demostrará qué entidad representa. El actor efectivo determinará a quién se atribuye la acción. La autorización decidirá si puede ejecutarla.

#### 2. Artefacto producido

```text
SUPABASE-AUTH-ENTERPRISE-IDENTITY-MODEL-001@1.0.0
```

| Propiedad                                  |             Valor |
| ------------------------------------------ | ----------------: |
| `managed_auth_schema`                      |            `auth` |
| `enterprise_identity_owner_schema`         | `identity_access` |
| `enterprise_identity_owner_schema_id`      |     `VSCHEMA-023` |
| `authenticated_principal_kinds`            |             **3** |
| `business_identity_kinds`                  |             **4** |
| `effective_actor_kinds`                    |             **3** |
| `authorization_from_auth_metadata`         |             **0** |
| `client_service_role_usage_target`         |             **0** |
| `direct_business_authority_in_auth_target` |             **0** |
| `physical_changes_authorized`              |             **0** |

#### 3. Fuentes canónicas consumidas

| Fuente                                                       | Decisión consumida                                                                                              |
| ------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------- |
| `01_PROTOCOLO.md`                                            | continuidad, separación entre definición e implementación, trazabilidad y pruebas                               |
| `delivery-contract.json`                                     | una sola tarea y registro 04A completo con nombre único                                                         |
| `active-sequence.json`                                       | secuencia `SUPA-ARC-001` a `SUPA-ARC-025`; `SUPA-ARC-008` como tarea actual                                     |
| `ADR-AUTH-001`                                               | capas de identidad, contexto, autorización y presentación; tres clases de principal; actor efectivo obligatorio |
| `AUTH-MOD-001`                                               | separación entre usuario Auth, empleado, cliente, dispositivo técnico, actor de dispositivo y servicio          |
| `SUPABASE-SCHEMA-SEPARATION-PRINCIPLES-001@1.0.0`            | `auth` como schema administrado y sus internals fuera de la autoridad empresarial                               |
| `SUPABASE-AUTHORITATIVE-SCHEMA-OWNERSHIP-REGISTRY-001@1.0.0` | `identity_access` como owner schema de identidad empresarial y autorización                                     |
| `SUPABASE-EXPOSED-CONTRACT-LAYER-001@1.0.0`                  | `api` como única capa expuesta para contratos empresariales                                                     |
| `SUPABASE-PRIVATE-INTERNAL-LAYER-001@1.0.0`                  | helpers privados sin duplicar autoridad de identidad                                                            |
| `SUPABASE-TRANSVERSAL-AUDIT-EVENT-SCHEMA-001@1.0.0`          | principal, actor y decisión como referencias auditables separadas                                               |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`           | 5.051 requisitos hasta `SUPA-ARC-007`; rango `TREQ-SUPABASE-001` a `756`                                        |

#### 4. Decisión canónica

Vento OS adoptará una separación obligatoria entre cuatro planos:

```text
1. AUTH MANAGED PLANE
   auth.users, auth.identities, sesiones, tokens, factores y flujos administrados

2. ENTERPRISE PRINCIPAL PLANE
   identity_access: principal estable, clase, estado y vínculo empresarial

3. DOMAIN IDENTITY PLANE
   trabajador, cliente, dispositivo y actor de sistema en sus fronteras propietarias

4. EFFECTIVE ACTOR PLANE
   actor atribuible que continúa hacia contexto, autorización y auditoría
```

`auth` seguirá administrado por Supabase. `identity_access` será la frontera empresarial objetivo para registrar la interpretación autorizada del principal y sus vínculos, sin copiar credenciales, tokens, contraseñas ni internals administrados.

#### 5. Principios normativos

1. `auth.users` representa una cuenta autenticable, no una persona laboral, cliente, dispositivo empresarial, rol ni permiso.
2. `auth.identities` representa proveedores e identidades externas, no perfiles de dominio.
3. Una cuenta podrá coexistir con más de una identidad empresarial compatible; la cardinalidad física exacta se define en `SUPA-ARC-009`.
4. Una identidad empresarial podrá existir sin cuenta Auth cuando el proceso lo permita, sin adquirir acceso autenticado implícito.
5. La ausencia de vínculo requerido produce denegación cerrada o onboarding explícito, nunca inferencia.
6. JWT, claims y metadata transportan evidencia de sesión o bootstrap; no sustituyen fuentes empresariales vigentes.
7. El actor efectivo se resuelve server-side y nunca se acepta libremente desde el cliente.
8. Un servicio privilegiado conserva identidad técnica propia y no se presenta como usuario humano.
9. Un dispositivo compartido autentica la terminal; la acción empresarial requiere actor humano vigente.
10. La revocación, expiración y desactivación se completarán en `SUPA-ARC-010` sin alterar estas fronteras.

#### 6. Clases de principal autenticado

| Clase           | Credencial                                          | Qué demuestra                                                        | Qué no demuestra                                                |
| --------------- | --------------------------------------------------- | -------------------------------------------------------------------- | --------------------------------------------------------------- |
| `HUMAN_USER`    | sesión personal de Supabase Auth                    | una persona presentó una credencial válida                           | empleo, clientela, rol, permiso o contexto                      |
| `SHARED_DEVICE` | cuenta técnica vinculada a una terminal             | una terminal autorizada está autenticada                             | identidad humana, rol laboral o permiso empresarial             |
| `SERVICE`       | credencial server-side o identidad técnica aprobada | un proceso técnico identificado puede invocar una frontera permitida | autorización empresarial universal o identidad de usuario final |

Cada principal autenticado tendrá exactamente una clase primaria por resolución. Una misma credencial no podrá interpretarse simultáneamente como persona, dispositivo y servicio.

#### 7. Identidades empresariales reconocidas

| Clase          | Autoridad empresarial                                 | Regla                                                                |
| -------------- | ----------------------------------------------------- | -------------------------------------------------------------------- |
| `EMPLOYEE`     | identidad laboral vigente del dominio correspondiente | exige vínculo válido y estado laboral activo para acciones laborales |
| `CUSTOMER`     | identidad comercial del dominio correspondiente       | no concede acceso laboral ni permisos administrativos                |
| `DEVICE`       | registro empresarial del dispositivo compartido       | no recibe rol base, rol operativo ni capacidad humana propia         |
| `SYSTEM_ACTOR` | proceso o servicio registrado y permitido             | solo actúa dentro de operaciones nominales y auditables              |

Una persona podrá ser simultáneamente `EMPLOYEE` y `CUSTOMER`. Esa coexistencia no fusiona perfiles, estados, datos, finalidades ni permisos.

#### 8. Actor efectivo

Los tipos de actor efectivo serán:

```text
EMPLOYEE
SYSTEM
NONE
```

Resolución:

```text
HUMAN_USER + EMPLOYEE ACTIVO
→ actor efectivo EMPLOYEE

SHARED_DEVICE + SESIÓN DE ACTOR VIGENTE + EMPLOYEE ACTIVO
→ actor efectivo EMPLOYEE

SERVICE + PROCESO REGISTRADO + OPERACIÓN PERMITIDA
→ actor efectivo SYSTEM

PRINCIPAL SIN VÍNCULO O SIN CONDICIONES SUFICIENTES
→ NONE + DENEGACIÓN
```

El actor efectivo no es un claim libre, un rol, una selección de interfaz ni un parámetro sustituible por el consumidor.

#### 9. Fronteras de autoridad

| Elemento                           | Fuente autorizada                                  | Prohibición                                             |
| ---------------------------------- | -------------------------------------------------- | ------------------------------------------------------- |
| cuenta, proveedor y sesión técnica | Supabase Auth                                      | no derivar perfil empresarial desde el email o provider |
| principal y vínculo empresarial    | `identity_access`                                  | no duplicarlo en metadata editable                      |
| identidad laboral                  | owner schema laboral                               | no derivarla de `public.users` ni del rol JWT           |
| identidad de cliente               | owner schema de cliente                            | no usarla como identidad laboral                        |
| dispositivo y actor compartido     | contrato de `identity_access` y tareas posteriores | no modelar una tablet como empleado ficticio            |
| roles, permisos y contexto         | catálogos y contratos de autorización              | no convertirlos en identidad                            |
| auditoría                          | `audit`                                            | no usar logs como fuente de identidad                   |

#### 10. Cuenta Auth y perfil empresarial

La relación conceptual será:

```text
AUTH ACCOUNT
  0..N provider identities
  0..N enterprise identity links

ENTERPRISE IDENTITY
  owner schema propio
  lifecycle propio
  0..1 vínculo autenticable activo según contrato posterior
```

La notación anterior no aprueba constraints físicos. `SUPA-ARC-009` definirá cardinalidades, claves, enlaces, conflictos, perfiles legacy y resolución de duplicados.

#### 11. Proveedores e identidades externas

1. El proveedor de autenticación es un mecanismo de ingreso, no una categoría empresarial.
2. Varias identidades de proveedor podrán converger en una cuenta cuando Supabase y el contrato lo soporten.
3. Cambiar proveedor no cambiará `employee_id`, `customer_id`, `device_id` ni actor de sistema.
4. Email y teléfono podrán ser atributos de contacto o login, pero no claves empresariales universales.
5. Linking, unlinking y recuperación deberán impedir apropiación de cuentas y preservar auditoría.
6. La política exacta de proveedores, reautenticación y MFA se completa en `SUPA-ARC-010` y `SUPA-ARC-024`.

#### 12. JWT, claims y metadata

- `sub` identifica la cuenta Auth dentro del proyecto y no la identidad empresarial completa.
- `raw_user_meta_data` queda prohibido como fuente de autorización, rol, sede, área, turno o estado laboral.
- `raw_app_meta_data` podrá transportar señales server-managed de bootstrap o compatibilidad, pero no será la única autoridad de información mutable.
- Un claim puede estar obsoleto hasta renovar el token; las operaciones sensibles deberán resolver estado vigente.
- El rol PostgreSQL del JWT no equivale a rol base u operativo de Vento.
- Claims, metadata y tokens no se copiarán a tablas empresariales ni auditoría salvo referencia mínima y finalidad aprobada.

#### 13. Sesión personal humana

Una sesión personal laboral deberá resolver, en orden:

```text
JWT VÁLIDO
→ CUENTA AUTH
→ PRINCIPAL HUMAN_USER
→ VÍNCULO EMPLOYEE
→ EMPLOYEE ACTIVO
→ ACTOR EFECTIVO EMPLOYEE
→ CONTEXTO
→ AUTORIZACIÓN
```

Una sesión cliente seguirá una ruta independiente hacia `CUSTOMER`. La aplicación declarará qué identidad acepta y no cambiará de identidad por fallback.

#### 14. Dispositivo compartido

```text
JWT TÉCNICO VÁLIDO
→ PRINCIPAL SHARED_DEVICE
→ DISPOSITIVO ACTIVO
→ SESIÓN DE ACTOR VIGENTE
→ EMPLOYEE ACTIVO
→ ACTOR EFECTIVO EMPLOYEE
```

Sin actor vigente, el dispositivo solo podrá ejecutar capacidades técnicas nominales: configuración, heartbeat, inicio o cierre de sesión de actor y diagnóstico aprobado. No podrá ejecutar mutaciones empresariales.

#### 15. Servicios y `service_role`

1. `service_role` es una capacidad técnica privilegiada, no una identidad empresarial.
2. Nunca estará disponible en cliente, dispositivo no confiable, bundle móvil o navegador.
3. Toda ejecución autónoma declarará `service_principal_id`, proceso, operación, ambiente y owner técnico.
4. Toda ejecución iniciada por humano conservará principal humano y actor efectivo aunque use un backend privilegiado.
5. La credencial no podrá sustituir permiso, territorio, contexto, idempotencia ni auditoría.
6. El uso de `SECURITY DEFINER`, roles de base y grants se resolverá en `SUPA-ARC-014` y `SUPA-ARC-015`.

#### 16. Actividad y denegación cerrada

Una identidad será utilizable solo cuando todas sus capas requeridas estén vigentes. Tendrán precedencia las condiciones negativas:

```text
CUENTA BLOQUEADA O SESIÓN INVÁLIDA
> VÍNCULO POSITIVO

IDENTIDAD EMPRESARIAL INACTIVA
> ROL, PERMISO, SEDE, TURNO O EXCEPCIÓN

DISPOSITIVO INACTIVO O SESIÓN DE ACTOR EXPIRADA
> CAPACIDAD OPERATIVA
```

No se aplicarán fallbacks que amplíen privilegios por ausencia de datos.

#### 17. Contrato lógico de resolución

```text
EnterpriseIdentityContext
├── auth_subject_id
├── principal_id
├── principal_kind
├── provider_identity_refs[]
├── employee_id
├── customer_id
├── device_id
├── service_principal_id
├── effective_actor_kind
├── effective_actor_id
├── actor_session_id
├── identity_state
├── assurance_level
├── session_reference
├── resolved_at
├── source_versions
└── denial_reason_codes[]
```

Los campos no aplicables serán nulos por contrato. La ausencia de un identificador requerido no podrá ocultarse con valores por defecto.

#### 18. Estados lógicos de resolución

| Estado                   | Significado                                                                        |
| ------------------------ | ---------------------------------------------------------------------------------- |
| `ANONYMOUS`              | no existe sesión autenticada válida                                                |
| `AUTHENTICATED_UNLINKED` | existe cuenta Auth, pero no el vínculo empresarial exigido                         |
| `ACTIVE`                 | principal, identidad y condiciones requeridas están vigentes                       |
| `INACTIVE`               | la identidad empresarial existe, pero está desactivada                             |
| `TECHNICAL_ONLY`         | dispositivo o servicio válido sin actor humano requerido para mutación empresarial |
| `DENIED`                 | existe una condición estructural que impide continuar                              |

Los estados de token, sesión, refresh, revocación y offboarding se especificarán en `SUPA-ARC-010`.

#### 19. Códigos mínimos de denegación

```text
unauthenticated
unsupported_principal
principal_unlinked
identity_not_found
identity_inactive
device_not_found
device_inactive
device_actor_required
actor_session_expired
actor_identity_inactive
service_principal_missing
service_operation_not_allowed
identity_ambiguous
identity_incomplete
fresh_state_required
```

Los consumidores podrán traducirlos, pero no reinterpretar la decisión ni reemplazarla por mensajes genéricos de éxito.

#### 20. Acceso a schemas administrados

- las aplicaciones no consultarán tablas internas de `auth` mediante Data API;
- los flujos de login, logout, recuperación y MFA usarán APIs soportadas de Supabase;
- la lógica server-side podrá consultar superficies administradas permitidas cuando el contrato lo exija;
- una referencia a `auth.users.id` no transfiere ownership del objeto empresarial;
- no se recrearán tablas espejo de sesiones, tokens o identidades de proveedor como autoridad alternativa;
- cambios de Auth deberán superar compatibilidad de plataforma, paridad ambiental y rollback.

#### 21. Relación con las capas objetivo

| Capa              | Relación con identidad                                                 |
| ----------------- | ---------------------------------------------------------------------- |
| owner schemas     | conservan perfiles y estados empresariales de cada dominio             |
| `identity_access` | registra principal, vínculos y resolución empresarial autorizada       |
| `api`             | expone contratos mínimos de identidad y comandos autorizados           |
| `app_private`     | aloja primitivas técnicas, nunca perfiles ni credenciales persistentes |
| `audit`           | conserva principal, actor, decisión y resultado mediante referencias   |
| `public`          | solo compatibilidad temporal con salida obligatoria                    |
| `auth`            | administra credenciales y sesión técnica mediante Supabase             |

#### 22. Integridad y unicidad conceptual

1. Una cuenta no podrá vincularse silenciosamente con dos identidades empresariales incompatibles de la misma clase.
2. Una identidad empresarial no podrá ser reclamada por otra cuenta sin workflow de resolución y evidencia.
3. La fusión o separación de cuentas preservará actor, auditoría, consentimiento, sesiones y recursos.
4. Los perfiles huérfanos no se eliminarán ni enlazarán automáticamente.
5. Los enlaces se versionarán y tendrán lifecycle, origen, autoridad y razón.
6. La integridad física exacta queda reservada a `SUPA-ARC-009`, `SUPA-ARC-012` y la transición.

#### 23. Auditoría mínima

Se auditarán, según sensibilidad:

- creación, confirmación, bloqueo y eliminación de cuenta;
- linking y unlinking de proveedor;
- creación, activación, desactivación y corrección de vínculo empresarial;
- resolución ambigua o denegada;
- inicio, renovación y cierre de actor en dispositivo compartido;
- uso de servicio y operación privilegiada;
- acceso o exportación de información de identidad;
- recuperación, reautenticación, MFA y revocación cuando se definan.

La auditoría registrará referencias e integridad, no tokens, contraseñas ni secretos.

#### 24. Línea base actual y clasificación

El estado actual contiene cuentas, proveedores, sesiones y tokens administrados por Supabase, junto con perfiles de cliente, empleados, invitaciones, dispositivos compartidos y perfiles especializados distribuidos en schemas Vento.

Reglas:

1. la coexistencia actual no prueba que todos los vínculos sean correctos;
2. `public.users` y `employees` no se fusionan por compartir un identificador;
3. roles o sedes presentes en metadata se clasifican como compatibilidad, no autoridad;
4. cuentas técnicas no se convierten en empleados ficticios;
5. perfiles sin cuenta se clasifican antes de enlazar, crear o eliminar;
6. sesiones y tokens actuales se tratan en `SUPA-ARC-010`;
7. el inventario objeto por objeto corresponde a `SUPA-TRANS-001` a `SUPA-TRANS-004`.

#### 25. Orden obligatorio de materialización futura

```text
1. INVENTARIAR CUENTAS, PROVEEDORES, PERFILES, DISPOSITIVOS Y SERVICIOS
2. CLASIFICAR PRINCIPAL E IDENTIDADES EMPRESARIALES
3. RESOLVER CARDINALIDADES, HUÉRFANOS, DUPLICADOS Y CONFLICTOS
4. DEFINIR ESTADOS, REVOCACIÓN, MFA Y OFFBOARDING
5. MATERIALIZAR REGISTRO DE PRINCIPALES Y VÍNCULOS
6. ADAPTAR GUARDS, RPC, RLS Y SERVICIOS
7. MIGRAR METADATA Y BYPASSES LEGACY
8. PROBAR SESIONES PERSONALES, DISPOSITIVOS Y SERVICIOS
9. VERIFICAR PARIDAD, AUDITORÍA, RECUPERACIÓN Y ROLLBACK
10. RETIRAR FUENTES COMPETIDORAS SIN PERDER HISTORIA
```

Este orden no autoriza implementación física.

#### 26. Riesgos restringidos y carryover

| Riesgo                               | Efecto de esta tarea                             | Resolución restante              |
| ------------------------------------ | ------------------------------------------------ | -------------------------------- |
| Auth tratado como perfil empresarial | separa cuenta, principal e identidad             | `SUPA-ARC-009`; transición       |
| metadata editable como autorización  | la prohíbe como autoridad                        | `SUPA-ARC-015`; transición       |
| dispositivo modelado como empleado   | define principal técnico y actor humano separado | `SUPA-ARC-009`; `010`            |
| `service_role` como bypass           | exige servicio nominal y operación permitida     | `SUPA-ARC-014`; `015`; `020`     |
| cuenta con varios perfiles           | permite coexistencia sin fusionar dominios       | `SUPA-ARC-009`                   |
| perfiles huérfanos o duplicados      | exige clasificación y resolución controlada      | `SUPA-ARC-009`; transición       |
| sesión válida con identidad inactiva | establece denegación estructural                 | `SUPA-ARC-010`                   |
| claims obsoletos                     | exige estado fresco en operaciones sensibles     | `SUPA-ARC-010`; `015`            |
| drift entre ambientes                | exige manifiesto y paridad                       | `SUPA-ARC-024`; `SUPA-TRANS-013` |

Ningún riesgo queda cerrado físicamente por esta definición.

#### 27. Decisiones reservadas

| Decisión                                                               | Tarea propietaria                   |
| ---------------------------------------------------------------------- | ----------------------------------- |
| cardinalidades, claves y enlaces de trabajador, cliente y dispositivo  | `SUPA-ARC-009`                      |
| sesión, refresh, revocación, bloqueo, desactivación, MFA y offboarding | `SUPA-ARC-010`                      |
| nombres físicos y constraints                                          | `SUPA-ARC-011`; `SUPA-ARC-012`      |
| funciones, RPC y triggers                                              | `SUPA-ARC-013`                      |
| `SECURITY DEFINER` y `search_path`                                     | `SUPA-ARC-014`                      |
| grants, RLS, roles de ejecución y claims autorizados                   | `SUPA-ARC-015`                      |
| contratos por dominio                                                  | `SUPA-ARC-016`                      |
| Storage de evidencias de identidad                                     | `SUPA-ARC-018`                      |
| Edge Functions, webhooks y servicios                                   | `SUPA-ARC-020`                      |
| retención y recuperación                                               | `SUPA-ARC-022`                      |
| tipos generados                                                        | `SUPA-ARC-023`                      |
| proveedores y paridad por ambiente                                     | `SUPA-ARC-024`                      |
| inventario, migración y retiro                                         | `SUPA-TRANS-001` a `SUPA-TRANS-015` |

#### 28. Límites de autorización

Esta tarea no autoriza:

- crear o alterar schemas, tablas, funciones, triggers, policies, roles o grants;
- crear, bloquear, confirmar, eliminar o vincular cuentas;
- modificar proveedores, MFA, contraseñas, sesiones, refresh tokens o configuración de Auth;
- cambiar metadata, claims, JWT, templates, redirects o credenciales;
- migrar perfiles, resolver huérfanos, fusionar cuentas o eliminar duplicados;
- cambiar guards, Server Actions, RPC, RLS o clientes Supabase;
- introducir `service_role` en nuevos consumidores;
- ejecutar DDL, DML, migraciones, backfills, despliegues o pruebas mutantes;
- iniciar `SUPA-ARC-009` antes de aprobación expresa.

#### 29. Requisitos de prueba generados

**Resultado:** GENERA REQUISITOS DE PRUEBA

Se incorporan al Registro Canónico de Requisitos de Prueba:

```text
TREQ-SUPABASE-757 a TREQ-SUPABASE-796
```

Los cuarenta requisitos protegen separación de Auth e identidad, clases de principal, identidades empresariales, actor efectivo, vínculos, proveedores, metadata, claims, dispositivos compartidos, servicios, estados, denegación cerrada, integridad, auditoría, transición y drift. El detalle completo existe únicamente en `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`.

#### 30. Criterios de aceptación

- [ ] `auth` permanece administrado por Supabase y sin autoridad empresarial directa.
- [ ] `identity_access` queda identificado como owner schema empresarial de principal y vínculos.
- [ ] Se preservan exactamente tres clases de principal autenticado.
- [ ] Se preservan cuatro clases de identidad empresarial.
- [ ] Se preservan tres clases de actor efectivo.
- [ ] `auth.users`, proveedores, JWT y metadata no equivalen a trabajador, cliente, dispositivo, rol o permiso.
- [ ] Una persona puede ser empleado y cliente sin fusionar identidades.
- [ ] Un dispositivo técnico no adquiere identidad laboral ni permisos humanos.
- [ ] `service_role` no concede autorización empresarial automática.
- [ ] Toda mutación empresarial tiene actor efectivo resoluble.
- [ ] `raw_user_meta_data` queda excluido de autorización.
- [ ] Claims obsoletos no sustituyen validación de estado vigente.
- [ ] La ausencia o inactividad produce denegación cerrada.
- [ ] Perfiles huérfanos, duplicados o ambiguos requieren resolución controlada.
- [ ] Auditoría conserva principal, actor y decisión sin secretos.
- [ ] Las decisiones físicas de vínculo y sesión permanecen reservadas.
- [ ] Se generan `TREQ-SUPABASE-757` a `TREQ-SUPABASE-796`.
- [ ] No se ejecutan cambios físicos, código ni implementación.
- [ ] `SUPA-ARC-009` permanece reservada.

#### 31. Controles estructurales requeridos

| Control                                     |        Resultado esperado |
| ------------------------------------------- | ------------------------: |
| schemas administrados de Auth               |            **1** (`auth`) |
| owner schemas de identidad empresarial      | **1** (`identity_access`) |
| clases de principal autenticado             |                     **3** |
| clases de identidad empresarial             |                     **4** |
| clases de actor efectivo                    |                     **3** |
| autoridad empresarial directa en Auth       |                     **0** |
| autorización basada en `raw_user_meta_data` |                     **0** |
| uso cliente de `service_role`               |                     **0** |
| cuentas técnicas modeladas como empleados   |                     **0** |
| mutaciones empresariales sin actor efectivo |                     **0** |
| requisitos nuevos                           |                    **40** |
| cambios físicos                             |                     **0** |

#### 32. Continuidad inmediata

```text
ÚLTIMA TAREA APROBADA
SUPA-ARC-007 — Definir esquema transversal de auditoría y eventos
        ↓
TAREA ACTUAL APROBADA
SUPA-ARC-008 — Definir modelo canónico de Auth e identidad empresarial
        ↓
SIGUIENTE TAREA RESERVADA
SUPA-ARC-009 — Definir vínculo de auth.users con trabajador, cliente y dispositivo
```

`SUPA-ARC-009` permanece reservada y no se inicia hasta una solicitud expresa de continuidad.


### ✅ SUPA-ARC-009 — Definir vínculo de `auth.users` con trabajador, cliente y dispositivo

**Estado:** APROBADA
**Fecha de preparación documental:** 2026-07-30
**Bloque propietario:** BLOQUE E3 — Arquitectura canónica de datos y gobierno integral de Supabase
**Tarea anterior:** `SUPA-ARC-008 — Definir modelo canónico de Auth e identidad empresarial` — APROBADA
**Tarea siguiente:** `SUPA-ARC-010 — Definir ciclo de sesión, revocación y desactivación`
**Proyecto de referencia:** `vento-os-dev` — `clzdpinthhtknkmefsxx`
**Fuentes remotas observadas:** `00_CABECERA_Y_ESTADO.md` blob `c3d0103dfe1131f25dfa54ea5d8b39a3029bcae5`; `04_ARQUITECTURA_CANONICA_OBJETIVO.md` blob `e9ae77fa51f91531cb1bfa4a9d7a2595a6a3d9a1`; `02_AUDITORIA_INTEGRAL_DE_SUPABASE.md` blob `02198192088e1c24def67b73e23322b6e78d1ca4`; `01_IDENTIDAD_Y_ROLES.md` blob `ed957e29cff70ff9042bbc2b739464587f928cdb`; `06_ADR_AUTH_001.md` blob `e41074801c22a761123ba103353f2981672078a2`; `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` blob `1159128475e76e7c24e8c1c02b749ce808a4fbd1`; `delivery-contract.json` blob `01f197364800a1998867eb4e9a8d104429bb222f`; `active-sequence.json` blob `0c63430b3efff08c308482196d781a20a424d172`
**Tipo de tarea:** definición normativa de cardinalidades, compatibilidad, lifecycle, integridad y resolución de vínculos entre cuentas administradas de Supabase Auth e identidades empresariales de trabajador, cliente y dispositivo; sin crear, modificar, fusionar, separar, bloquear o eliminar cuentas, perfiles, dispositivos, vínculos, sesiones, tablas, schemas, constraints, funciones, triggers, policies, grants, claims, migraciones, código, datos ni despliegues

#### 1. Objetivo

Definir el contrato lógico que vinculará una cuenta administrada en `auth.users` con identidades empresariales de trabajador, cliente y dispositivo, preservando simultáneamente:

- la independencia del ciclo de vida de la cuenta Auth;
- la autoridad de cada identidad en su dominio propietario;
- la compatibilidad legítima entre trabajador y cliente;
- la exclusión absoluta entre una cuenta humana y una cuenta técnica de dispositivo;
- la atribución correcta del actor efectivo;
- la clasificación controlada de perfiles legacy, huérfanos, duplicados y colisiones.

```text
AUTH SUBJECT ADMINISTRADO
        ↓
PRINCIPAL CLASIFICADO
        ↓
REGISTRO DE VÍNCULO EN identity_access
        ↓
IDENTIDAD EMPRESARIAL EN SU OWNER SCHEMA
        ↓
ACTOR EFECTIVO O DENEGACIÓN CERRADA
```

El vínculo no convertirá `auth.users` en fuente de verdad empresarial ni hará depender la existencia de un trabajador, cliente o dispositivo de que la cuenta Auth continúe activa.

#### 2. Artefacto producido

```text
SUPABASE-AUTH-ENTERPRISE-IDENTITY-LINK-MODEL-001@1.0.0
```

| Propiedad                                      |             Valor |
| ---------------------------------------------- | ----------------: |
| `managed_auth_subject_source`                  |      `auth.users` |
| `enterprise_link_owner_schema`                 | `identity_access` |
| `enterprise_link_owner_schema_id`              |     `VSCHEMA-023` |
| `human_compatible_identity_kinds`              |             **2** |
| `dedicated_device_principal_required`          |             **1** |
| `active_link_max_per_subject_and_kind`         |             **1** |
| `active_auth_link_max_per_enterprise_identity` |             **1** |
| `link_lifecycle_states`                        |             **6** |
| `link_origin_classes`                          |             **6** |
| `conflict_case_classes`                        |             **8** |
| `automatic_linking_from_contact_match`         |             **0** |
| `physical_changes_authorized`                  |             **0** |

#### 3. Fuentes canónicas consumidas

| Fuente                                                       | Decisión consumida                                                                                                 |
| ------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------ |
| `01_PROTOCOLO.md`                                            | continuidad, integridad, trazabilidad, entrega de una sola tarea y separación entre definición e implementación    |
| `delivery-contract.json`                                     | formato único de tarea y registro 04A completo con nombre único                                                    |
| `active-sequence.json`                                       | secuencia `SUPA-ARC-001` a `SUPA-ARC-025`; `SUPA-ARC-009` como tarea actual                                        |
| `SUPABASE-AUTH-ENTERPRISE-IDENTITY-MODEL-001@1.0.0`          | tres clases de principal, cuatro identidades empresariales, actor efectivo y denegación cerrada                    |
| `AUTH-MOD-001`                                               | usuario Auth, empleado, cliente, dispositivo técnico y actor compartido como conceptos separados                   |
| `ADR-AUTH-001`                                               | identidad, contexto, autorización y presentación como capas independientes                                         |
| `SUPA-AUD-010`                                               | 73 cuentas Auth, 56 trabajadores, 80 perfiles cliente, siete perfiles sin Auth y brechas de integridad referencial |
| `SUPA-AUD-011`                                               | intersecciones reales entre trabajador, cliente y dispositivo; colisiones y ausencia de sesiones de actor          |
| `SUPABASE-AUTHORITATIVE-SCHEMA-OWNERSHIP-REGISTRY-001@1.0.0` | `workforce`, `customer_engagement`, `technology_operations` e `identity_access` como fronteras diferenciadas       |
| `SUPABASE-TRANSVERSAL-AUDIT-EVENT-SCHEMA-001@1.0.0`          | historial, corrección y evidencia mediante referencias append-only                                                 |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`           | 5.091 requisitos hasta `SUPA-ARC-008`; rango `TREQ-SUPABASE-001` a `796`                                           |

#### 4. Decisión canónica

Los vínculos entre Auth e identidades empresariales serán registros explícitos gobernados por `identity_access`. La cuenta Auth, el vínculo y la identidad empresarial serán objetos distintos:

```text
AUTH ACCOUNT
  auth.users.id
  credenciales y sesión administradas

ENTERPRISE IDENTITY LINK
  principal y vínculo gobernados por identity_access

DOMAIN IDENTITY
  EMPLOYEE en workforce
  CUSTOMER en customer_engagement
  DEVICE master en technology_operations
  identidad técnica y actor compartido en identity_access
```

La igualdad física actual entre algunos UUID no constituirá identidad conceptual ni constraint objetivo. El modelo deberá poder cambiar una cuenta Auth, fusionar o separar cuentas y retirar una credencial sin renumerar ni eliminar la identidad empresarial.

#### 5. Matriz de propiedad

| Elemento                               | Owner lógico            | Autoridad                                                        |
| -------------------------------------- | ----------------------- | ---------------------------------------------------------------- |
| cuenta, proveedor, credencial y sesión | Supabase Auth           | autenticación técnica                                            |
| principal y vínculo empresarial        | `identity_access`       | clasificación, compatibilidad, lifecycle y resolución            |
| identidad laboral                      | `workforce`             | existencia, estado y ciclo laboral del trabajador                |
| identidad comercial                    | `customer_engagement`   | existencia, consentimiento y ciclo del cliente                   |
| dispositivo operativo maestro          | `technology_operations` | identidad física, configuración, activación y soporte del equipo |
| sesión de actor compartido             | `identity_access`       | trabajador efectivo temporal sobre un dispositivo                |
| auditoría del vínculo                  | `audit`                 | evidencia, causalidad, corrección y resultado                    |

Una FK, un UUID coincidente, un trigger, una invitación o una fila de bootstrap no transferirá autoridad entre estas fronteras.

#### 6. Cardinalidades objetivo

##### 6.1. Desde la cuenta Auth

| Principal       | Vínculo `EMPLOYEE` activo | Vínculo `CUSTOMER` activo |                                       Vínculo `DEVICE` activo |
| --------------- | ------------------------: | ------------------------: | ------------------------------------------------------------: |
| `HUMAN_USER`    |                  **0..1** |                  **0..1** |                                                         **0** |
| `SHARED_DEVICE` |                     **0** |                     **0** | **1** cuando el dispositivo esté habilitado para autenticarse |
| `SERVICE`       |                     **0** |                     **0** |                                                         **0** |

Un `HUMAN_USER` podrá tener simultáneamente un vínculo `EMPLOYEE` y uno `CUSTOMER`. Esa es la única combinación multiidentidad humana aprobada en esta tarea.

##### 6.2. Desde la identidad empresarial

| Identidad  |                                                        Cuentas Auth activas permitidas |
| ---------- | -------------------------------------------------------------------------------------: |
| `EMPLOYEE` |                                                                               **0..1** |
| `CUSTOMER` |                                                                               **0..1** |
| `DEVICE`   | **0..1**; exactamente **1** cuando el dispositivo activo requiera autenticación propia |

Una identidad podrá existir sin cuenta Auth. Ninguna identidad podrá tener dos cuentas activas simultáneas sin un caso formal de transición que cierre o superseda el vínculo anterior.

#### 7. Compatibilidad y exclusión

```text
EMPLOYEE + CUSTOMER
= COMPATIBLE PARA UNA MISMA PERSONA

EMPLOYEE + DEVICE
= PROHIBIDO EN UNA MISMA CUENTA AUTH

CUSTOMER + DEVICE
= PROHIBIDO EN UNA MISMA CUENTA AUTH

HUMAN_USER + SHARED_DEVICE
= PROHIBIDO COMO CLASIFICACIÓN SIMULTÁNEA
```

Reglas:

1. la coexistencia `EMPLOYEE + CUSTOMER` conserva dos identidades, dos owners, dos estados y dos finalidades;
2. una aplicación laboral nunca hará fallback a `CUSTOMER`;
3. una aplicación de cliente nunca derivará permisos laborales desde `EMPLOYEE`;
4. una cuenta de dispositivo deberá ser dedicada y no podrá representar una persona;
5. `SERVICE` utilizará su contrato de actor de sistema y no reclamará identidades de trabajador, cliente o dispositivo.

#### 8. Identificadores estables e independencia de Auth

1. `auth_subject_id` será una referencia administrada y reemplazable, no el identificador empresarial universal.
2. `employee_id`, `customer_id` y `device_id` conservarán identidad estable en sus owner schemas.
3. La coincidencia actual `employees.id = auth.users.id` se clasifica como compatibilidad física transitoria, no como regla de arquitectura objetivo.
4. La eliminación o sustitución de una cuenta Auth no borrará ni renumerará la identidad empresarial.
5. El vínculo tendrá identidad propia para conservar historial, origen, cambios y auditoría.
6. Los nombres físicos, tipos de clave y constraints se completarán en `SUPA-ARC-011` y `SUPA-ARC-012`.

#### 9. Contrato lógico del vínculo

Todo vínculo deberá representar, como mínimo:

```text
enterprise_identity_link_id
+ auth_subject_id
+ principal_kind
+ enterprise_identity_kind
+ enterprise_identity_id
+ link_state
+ link_origin
+ assurance_level
+ authority_reference
+ reason_code
+ created_at
+ verified_at
+ activated_at
+ suspended_at
+ revoked_at
+ superseded_at
+ supersedes_link_id
+ resolution_case_id
+ source_version
+ audit_reference
```

Los campos no aplicables serán nulos por contrato. Ningún consumidor podrá reconstruir un vínculo omitiendo su estado, origen o autoridad.

#### 10. Lifecycle del vínculo

Se adopta un vocabulario lógico cerrado de seis estados:

| Estado                 | Significado                                        |      Autoriza resolución empresarial |
| ---------------------- | -------------------------------------------------- | -----------------------------------: |
| `PENDING_VERIFICATION` | vínculo propuesto aún no comprobado                |                                   no |
| `ACTIVE`               | vínculo verificado y vigente                       | sí, sujeto al estado de la identidad |
| `SUSPENDED`            | vínculo temporalmente inutilizable                 |                                   no |
| `REVOKED`              | vínculo cerrado por decisión o cambio de autoridad |                                   no |
| `SUPERSEDED`           | sustituido por otro vínculo identificado           |                                   no |
| `CONFLICT`             | existe ambigüedad o incompatibilidad sin resolver  |                                   no |

Solo `ACTIVE` participa en la resolución normal. El estado de sesión, refresh, bloqueo, MFA y offboarding se define en `SUPA-ARC-010` y no se duplicará dentro del vínculo.

#### 11. Orígenes permitidos

Cada vínculo declarará exactamente una clase de origen:

| Origen                      | Uso                                                              |
| --------------------------- | ---------------------------------------------------------------- |
| `STAFF_INVITATION`          | alta laboral mediante invitación válida y consumible             |
| `CUSTOMER_SELF_ENROLLMENT`  | creación o reclamación de perfil de cliente por flujo verificado |
| `ADMIN_DEVICE_PROVISIONING` | aprovisionamiento nominal de una cuenta técnica dedicada         |
| `VERIFIED_IDENTITY_CLAIM`   | reclamación de una identidad existente con prueba suficiente     |
| `LEGACY_MIGRATION`          | vínculo trasladado desde una relación histórica clasificada      |
| `MANUAL_RECONCILIATION`     | decisión autorizada sobre conflicto documentado                  |

`LEGACY_MIGRATION` no equivale a verificación automática. Todo vínculo migrado deberá declarar evidencia, clasificación y gate de revisión.

#### 12. Vínculo laboral

```text
CUENTA HUMAN_USER
+ IDENTIDAD EMPLOYEE EXISTENTE
+ ORIGEN AUTORIZADO
+ VERIFICACIÓN COMPLETA
+ AUSENCIA DE OTRO VÍNCULO EMPLOYEE ACTIVO
= VÍNCULO EMPLOYEE ACTIVE
```

Reglas:

1. una invitación crea o reserva una intención de vínculo, no autoridad laboral inmediata;
2. la aceptación deberá demostrar invitación vigente, destinatario, rol del proceso, sede prevista y consumo único;
3. un trabajador existente no podrá ser reclamado por otra cuenta mediante coincidencia de correo, teléfono o nombre;
4. la identidad laboral podrá existir antes de Auth y permanecer no autenticable;
5. la actividad laboral seguirá determinada por `workforce`, no por el estado del vínculo únicamente;
6. un cambio de cuenta supersederá el vínculo anterior sin alterar el `employee_id`.

#### 13. Vínculo de cliente

```text
CUENTA HUMAN_USER
+ CUSTOMER NUEVO O EXISTENTE
+ CONSENTIMIENTO Y VERIFICACIÓN DEL FLUJO
+ AUSENCIA DE OTRO VÍNCULO CUSTOMER ACTIVO
= VÍNCULO CUSTOMER ACTIVE
```

Reglas:

1. un perfil cliente podrá existir sin cuenta para soportar historia, importación o captura empresarial legítima;
2. el onboarding podrá crear un perfil nuevo o abrir reclamación de uno existente;
3. correo, teléfono y documento serán señales de reconciliación, no autorización para enlazar;
4. una coincidencia ambigua abrirá `CONFLICT` y no fusionará saldos, puntos, beneficios, pedidos ni consentimientos;
5. una cuenta laboral podrá añadir vínculo de cliente sin modificar el vínculo `EMPLOYEE`;
6. la baja laboral no eliminará automáticamente el perfil de cliente.

#### 14. Coexistencia trabajador-cliente

La coexistencia aprobada se representará mediante dos vínculos activos independientes:

```text
AUTH SUBJECT HUMAN_USER
├── EMPLOYEE LINK → workforce
└── CUSTOMER LINK → customer_engagement
```

Cada aplicación o contrato deberá declarar la identidad requerida. Una misma solicitud no mezclará datos, permisos o estados de ambos dominios salvo un proceso explícito que consuma referencias autorizadas.

Las 56 cuentas observadas con identidad laboral y perfil cliente no se declararán automáticamente correctas ni defectuosas. Cada perfil deberá clasificarse como comercial deliberado, bootstrap legacy, dependencia técnica o duplicación antes de conservarlo o retirarlo.

#### 15. Vínculo de dispositivo

```text
CUENTA AUTH DEDICADA
+ PRINCIPAL SHARED_DEVICE EXPLÍCITO
+ DEVICE ACTIVO
+ APROVISIONAMIENTO ADMINISTRATIVO
+ AUSENCIA DE IDENTIDADES HUMANAS
= VÍNCULO DEVICE ACTIVE
```

Reglas:

1. un dispositivo no se modelará como empleado ni cliente;
2. la cuenta Auth del dispositivo no se compartirá con una persona;
3. el vínculo identifica la terminal, no al trabajador que la utiliza;
4. una mutación empresarial seguirá requiriendo sesión de actor y trabajador activo;
5. el cierre de la sesión de actor no revoca el vínculo del dispositivo;
6. el retiro del dispositivo y la revocación de su cuenta se coordinarán en `SUPA-ARC-010`;
7. el PIN del trabajador o del dispositivo no forma parte del vínculo ni se almacenará en texto.

#### 16. Perfiles sin cuenta Auth

Un perfil empresarial sin Auth será un estado permitido y explícito:

```text
ENTERPRISE IDENTITY EXISTE
+ ACTIVE AUTH LINK = 0
= IDENTIDAD NO AUTENTICABLE
```

No se deberá:

- eliminarlo por ausencia de cuenta;
- crear una cuenta automáticamente;
- enlazarlo al primer contacto coincidente;
- tratarlo como error de integridad por defecto;
- concederle acceso autenticado.

Los siete perfiles cliente sin Auth del corte vigente permanecerán sin cambio hasta clasificarse como históricos, importados, invitados, deliberadamente no autenticables o huérfanos.

#### 17. Clases de conflicto

Toda ambigüedad se registrará mediante una de ocho clases:

```text
AUTH_ACCOUNT_DUPLICATE
ENTERPRISE_IDENTITY_DUPLICATE
IDENTITY_LINK_DUPLICATE
CROSS_CLASS_COLLISION
CONTACT_MATCH_ONLY
ORPHAN_PROFILE
LEGACY_SHARED_UUID
DEVICE_HUMAN_COLLISION
```

El caso deberá conservar candidatos, evidencias, fuentes, riesgo, decisión requerida, autoridad y estado. La existencia de un caso bloquea la activación automática de los vínculos afectados.

#### 18. Resultados de resolución

Un caso podrá terminar únicamente mediante un resultado explícito:

| Resultado                        | Efecto documental futuro                                         |
| -------------------------------- | ---------------------------------------------------------------- |
| `LINK_EXISTING_IDENTITY`         | activa un vínculo comprobado con identidad ya existente          |
| `CREATE_NEW_ENTERPRISE_IDENTITY` | crea una identidad nueva mediante el dominio propietario         |
| `KEEP_UNLINKED`                  | conserva el perfil o la cuenta sin vínculo activo                |
| `SPLIT_PRINCIPAL`                | separa una cuenta humana de una cuenta técnica o de otra persona |
| `SUPERSEDE_LINK`                 | cierra el vínculo anterior y activa uno sucesor                  |
| `REJECT_AND_ESCALATE`            | impide el vínculo y deriva a revisión autorizada                 |

Esta tarea define resultados lógicos. No ejecuta ninguna de estas acciones.

#### 19. Datos de contacto y matching

1. email, teléfono y documento normalizados serán evidencia de búsqueda y reconciliación;
2. ninguno será una clave universal de autorización;
3. una coincidencia exacta no activará un vínculo sin demostrar control, autoridad y ausencia de conflicto;
4. múltiples coincidencias bloquearán el flujo automático;
5. valores faltantes no se inventarán ni se completarán desde metadata no autoritativa;
6. el documento laboral se definirá y protegerá en su dominio, sin copiarlo a Auth;
7. los grupos duplicados observados por correo o teléfono deberán abrir caso de reconciliación antes de merge.

#### 20. Integridad referencial y eliminación

El modelo objetivo prohibirá que la eliminación técnica de `auth.users` elimine en cascada una identidad empresarial o su historia.

```text
AUTH ACCOUNT DELETED OR REPLACED
        ↓
LINK REVOKED OR SUPERSEDED
        ↓
EMPLOYEE / CUSTOMER / DEVICE PRESERVED
        ↓
AUDIT AND REFERENCES PRESERVED
```

La FK actual `employees.id → auth.users.id` con eliminación en cascada se clasifica como dependencia transitoria que deberá migrarse con paridad, protección histórica y rollback. La ausencia actual de FK en `public.users`, invitaciones, candidatos y wallet no autoriza enlaces débiles; el diseño físico se resolverá en `SUPA-ARC-012`.

#### 21. Resolución server-side

Toda frontera confiable resolverá en orden:

```text
1. VALIDAR CUENTA Y SESIÓN AUTH
2. RESOLVER PRINCIPAL_KIND EXPLÍCITO
3. OBTENER VÍNCULOS ACTIVE
4. VALIDAR CARDINALIDAD Y COMPATIBILIDAD
5. SELECCIONAR LA IDENTIDAD EXIGIDA POR EL CONTRATO
6. VERIFICAR ESTADO VIGENTE EN EL OWNER SCHEMA
7. RESOLVER ACTOR EFECTIVO
8. CONTINUAR A CONTEXTO Y AUTORIZACIÓN
```

El cliente no podrá suministrar libremente `employee_id`, `customer_id`, `device_id`, `principal_kind` ni `effective_actor_id` para reemplazar la resolución.

#### 22. Comportamiento de denegación

Se incorporan códigos lógicos mínimos:

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

Los códigos complementan los definidos en `SUPA-ARC-008`. No sustituyen los estados de sesión y revocación de `SUPA-ARC-010`.

#### 23. Auditoría del vínculo

Se auditarán, según sensibilidad:

- propuesta, verificación y activación;
- suspensión, revocación y supersesión;
- intento de reclamar una identidad ya vinculada;
- conflicto, candidatos evaluados y resultado;
- creación, separación o consolidación autorizada de cuentas;
- cambio de principal humano a técnico o viceversa;
- acceso administrativo a información de reconciliación.

La auditoría conservará referencias, razón, autoridad y resultado. No almacenará contraseñas, tokens, OTP, PIN ni datos de contacto completos innecesarios.

#### 24. Clasificación de la línea base vigente

| Hallazgo AS-IS                                | Clasificación objetivo                                                      | Acción futura obligatoria                                    |
| --------------------------------------------- | --------------------------------------------------------------------------- | ------------------------------------------------------------ |
| 55 cuentas trabajador + cliente               | combinación compatible pendiente de confirmar semántica comercial           | clasificar cada perfil cliente                               |
| 1 cuenta trabajador + cliente + dispositivo   | `DEVICE_HUMAN_COLLISION`                                                    | separar principal técnico y humano                           |
| 1 cuenta cliente + dispositivo técnico        | `CROSS_CLASS_COLLISION`                                                     | retirar vínculo cliente de la cuenta técnica o reprovisionar |
| 16 cuentas solo cliente u otro                | `HUMAN_USER` pendiente de finalidad exacta                                  | conservar y clasificar por contrato consumidor               |
| 7 perfiles cliente sin Auth                   | `ORPHAN_PROFILE` o identidad deliberadamente no autenticable por clasificar | no crear ni enlazar automáticamente                          |
| 2 dispositivos con Auth                       | universo de transición                                                      | asegurar cuenta dedicada y clase explícita                   |
| 1 grupo duplicado por correo y 1 por teléfono | `CONTACT_MATCH_ONLY` hasta resolver                                         | abrir reconciliación sin merge automático                    |
| 1 PIN en texto plano                          | credencial legacy fuera del vínculo                                         | retirar mediante transición de secretos                      |

La clasificación no modifica ninguna fila ni declara que un perfil o cuenta deba eliminarse.

#### 25. Puertas específicas para las colisiones actuales

##### 25.1. Cuenta trabajador-dispositivo

Antes de cualquier cutover deberá:

1. crear o identificar una cuenta técnica dedicada mediante paquete autorizado;
2. vincularla exclusivamente al dispositivo;
3. conservar la identidad laboral en la cuenta humana;
4. revocar o superseder la asociación técnica anterior;
5. probar atribución, sesión de actor, offboarding y rollback;
6. preservar auditoría histórica sin reescribir actor pasado.

##### 25.2. Perfiles cliente de cuentas técnicas

Los perfiles cliente ligados a cuentas de dispositivo no se mantendrán como vínculos `CUSTOMER` activos en el objetivo. Se deberá determinar si contienen historia empresarial real, bootstrap técnico o datos residuales antes de desvincular, migrar o retirar.

#### 26. Invitaciones y reclamación de identidades

1. `staff_invitations` seguirá siendo el proceso autorizado de propuesta laboral, no el vínculo definitivo.
2. Una invitación terminal no podrá reutilizarse para activar otro vínculo.
3. El token de invitación no formará parte del registro de vínculo.
4. `auth_user_id`, `employee_id` y la identidad invitada deberán reconciliarse antes de activar.
5. Una reclamación de cliente existente exigirá control del canal y evidencia adicional proporcional al riesgo.
6. Un workflow administrativo no podrá enlazar por simple coincidencia visual.
7. La implementación física de funciones y triggers queda reservada a `SUPA-ARC-013`.

#### 27. Merge, split y cambio de cuenta

Toda operación de merge, split o reemplazo deberá:

- conservar IDs empresariales estables;
- mantener historial completo de vínculos;
- cerrar o superseder enlaces, nunca sobrescribirlos silenciosamente;
- preservar consentimiento, puntos, pedidos, roles, sedes, auditoría y recursos en su owner correspondiente;
- resolver sesiones y revocación mediante `SUPA-ARC-010`;
- evitar dos cuentas activas para la misma identidad durante el corte;
- contar con idempotencia, conciliación, verificación y rollback.

#### 28. Orden obligatorio de materialización futura

```text
1. INVENTARIAR CUENTAS, PERFILES, DISPOSITIVOS Y VÍNCULOS AS-IS
2. CLASIFICAR PRINCIPAL Y COMBINACIONES COMPATIBLES
3. ABRIR CASOS PARA HUÉRFANOS, DUPLICADOS Y COLISIONES
4. DEFINIR CONSTRAINTS, ESTADOS Y CICLO DE SESIÓN
5. MATERIALIZAR REGISTRO DE VÍNCULOS EN identity_access
6. MIGRAR VÍNCULOS LABORALES Y DE CLIENTE SIN CAMBIAR IDS EMPRESARIALES
7. SEPARAR CUENTAS TÉCNICAS Y HUMANAS
8. ADAPTAR GUARDS, RPC, RLS Y CONSUMIDORES
9. PROBAR PARIDAD, OFFBOARDING, MERGE, SPLIT Y ROLLBACK
10. RETIRAR RELACIONES LEGACY Y DETECTAR DRIFT
```

El orden no autoriza implementación física.

#### 29. Riesgos restringidos y carryover

| Riesgo                                         | Efecto de esta tarea                                     | Resolución restante                        |
| ---------------------------------------------- | -------------------------------------------------------- | ------------------------------------------ |
| UUID Auth usado como identidad empresarial     | lo desacopla contractualmente                            | `SUPA-ARC-011`; `012`; transición          |
| cuenta humana usada por dispositivo            | la prohíbe y exige split                                 | `SUPA-ARC-010`; transición de dispositivos |
| perfiles de dispositivo tratados como clientes | los clasifica como colisión                              | transición de identidad                    |
| perfiles cliente sin cuenta                    | permite existencia no autenticable y exige clasificación | `SUPA-TRANS-001` a `004`; paquete PASS     |
| duplicados por contacto                        | impide merge o link automático                           | `SUPA-ARC-012`; transición                 |
| cascade desde Auth a empleado                  | prohíbe pérdida de identidad e historia                  | `SUPA-ARC-012`; transición                 |
| invitaciones como autoridad final              | las limita a propuesta verificada                        | `SUPA-ARC-010`; `013`; transición          |
| vínculo activo con identidad inactiva          | conserva validación fresca en owner schema               | `SUPA-ARC-010`; `015`                      |
| drift de links y consumidores                  | exige registro y validador recurrente                    | `SUPA-ARC-025`; `SUPA-TRANS-015`           |

Ningún riesgo queda cerrado físicamente por esta definición.

#### 30. Decisiones reservadas

| Decisión                                                | Tarea propietaria                   |
| ------------------------------------------------------- | ----------------------------------- |
| sesión, refresh, revocación, bloqueo, MFA y offboarding | `SUPA-ARC-010`                      |
| nombres físicos, tipos de clave y constraints           | `SUPA-ARC-011`; `SUPA-ARC-012`      |
| funciones, RPC y triggers de linking                    | `SUPA-ARC-013`                      |
| funciones privilegiadas                                 | `SUPA-ARC-014`                      |
| grants, RLS, claims y roles de ejecución                | `SUPA-ARC-015`                      |
| contratos por dominio y aplicación                      | `SUPA-ARC-016`                      |
| evidencia física                                        | `SUPA-ARC-018`                      |
| Edge Functions y servicios de aprovisionamiento         | `SUPA-ARC-020`                      |
| retención y recuperación                                | `SUPA-ARC-022`                      |
| tipos compartidos                                       | `SUPA-ARC-023`                      |
| paridad de Auth entre ambientes                         | `SUPA-ARC-024`                      |
| inventario, migración, reconciliación, cutover y retiro | `SUPA-TRANS-001` a `SUPA-TRANS-015` |

#### 31. Límites de autorización

Esta tarea no autoriza:

- crear o modificar el registro físico de vínculos;
- agregar, eliminar o cambiar FK, índices, unique constraints o cascadas;
- crear, fusionar, separar, bloquear, eliminar o reprovisionar cuentas Auth;
- enlazar o desvincular trabajadores, clientes o dispositivos;
- resolver los siete perfiles sin cuenta, los duplicados de contacto o las dos colisiones de dispositivo;
- migrar `employees.id`, `public.users.id` o `shared_operational_devices.auth_user_id`;
- borrar perfiles cliente de cuentas técnicas;
- cambiar invitaciones, PIN, metadata, claims, sesiones o proveedores;
- modificar guards, RPC, RLS, policies, grants, aplicaciones o Edge Functions;
- ejecutar DDL, DML, migraciones, backfills, pruebas mutantes o despliegues;
- iniciar `SUPA-ARC-010` antes de aprobación expresa.

#### 32. Requisitos de prueba generados

**Resultado:** GENERA REQUISITOS DE PRUEBA

Se incorporan al Registro Canónico de Requisitos de Prueba:

```text
TREQ-SUPABASE-797 a TREQ-SUPABASE-836
```

Los cuarenta requisitos protegen propiedad del vínculo, cardinalidad por clase, compatibilidad trabajador-cliente, exclusión de dispositivos, independencia de IDs, lifecycle, origen, linking laboral y comercial, perfiles no autenticables, reconciliación, integridad referencial, resolución server-side, denegaciones, auditoría, colisiones AS-IS, transición y drift. El detalle completo existe únicamente en `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`.

#### 33. Criterios de aceptación

- [ ] Los vínculos se gobiernan en `identity_access` sin trasladar perfiles de dominio.
- [ ] Una cuenta `HUMAN_USER` admite como máximo un vínculo `EMPLOYEE` y uno `CUSTOMER` activos.
- [ ] La combinación `EMPLOYEE + CUSTOMER` es compatible y permanece separada por dominio.
- [ ] Una cuenta `SHARED_DEVICE` utiliza exclusivamente un vínculo `DEVICE` activo.
- [ ] Ninguna cuenta de dispositivo conserva identidad laboral o comercial objetivo.
- [ ] Cada identidad empresarial tiene como máximo una cuenta Auth activa.
- [ ] Los IDs empresariales permanecen independientes del `auth_subject_id`.
- [ ] Solo `ACTIVE` participa en la resolución normal.
- [ ] El origen, autoridad, lifecycle y razón de cada vínculo son obligatorios.
- [ ] Contactos coincidentes no activan enlaces ni merges automáticos.
- [ ] Perfiles sin Auth permanecen posibles y no autenticables.
- [ ] La eliminación de Auth no elimina identidades ni historia empresarial.
- [ ] El cliente no elige libremente identidad, principal ni actor efectivo.
- [ ] Las colisiones trabajador-dispositivo y cliente-dispositivo quedan prohibidas en el objetivo.
- [ ] Las 56 coexistencias trabajador-cliente quedan sujetas a clasificación, no eliminación automática.
- [ ] Los siete perfiles cliente sin Auth quedan sujetos a clasificación controlada.
- [ ] Merge, split y cambio de cuenta conservan historial, autoridad y rollback.
- [ ] Se generan `TREQ-SUPABASE-797` a `TREQ-SUPABASE-836`.
- [ ] No se ejecutan cambios físicos, código ni implementación.
- [ ] `SUPA-ARC-010` permanece reservada.

#### 34. Controles estructurales requeridos

| Control                                              |        Resultado esperado |
| ---------------------------------------------------- | ------------------------: |
| owner schemas del vínculo empresarial                | **1** (`identity_access`) |
| identidades humanas compatibles por cuenta           |                     **2** |
| vínculos activos máximos por clase y cuenta          |                     **1** |
| cuentas activas máximas por identidad                |                     **1** |
| estados lógicos del vínculo                          |                     **6** |
| clases de origen                                     |                     **6** |
| clases de conflicto                                  |                     **8** |
| linking automático por contacto                      |                     **0** |
| cuentas dispositivo con identidades humanas objetivo |                     **0** |
| cascadas Auth que eliminen identidad objetivo        |                     **0** |
| requisitos nuevos                                    |                    **40** |
| cambios físicos                                      |                     **0** |

#### 35. Continuidad inmediata

```text
ÚLTIMA TAREA APROBADA
SUPA-ARC-008 — Definir modelo canónico de Auth e identidad empresarial
        ↓
TAREA ACTUAL APROBADA
SUPA-ARC-009 — Definir vínculo de auth.users con trabajador, cliente y dispositivo
        ↓
SIGUIENTE TAREA RESERVADA
SUPA-ARC-010 — Definir ciclo de sesión, revocación y desactivación
```

`SUPA-ARC-010` permanece reservada y no se inicia hasta una solicitud expresa de continuidad.


### ✅ SUPA-ARC-010 — Definir ciclo de sesión, revocación y desactivación

**Estado:** APROBADA
**Fecha de preparación documental:** 2026-07-30
**Bloque propietario:** BLOQUE E3 — Arquitectura canónica de datos y gobierno integral de Supabase
**Tarea anterior:** `SUPA-ARC-009 — Definir vínculo de auth.users con trabajador, cliente y dispositivo` — APROBADA
**Tarea siguiente:** `SUPA-ARC-011 — Definir convenciones de nombres para esquemas, tablas y columnas`
**Proyecto de referencia:** `vento-os-dev` — `clzdpinthhtknkmefsxx`
**Fuentes remotas observadas:** `00_CABECERA_Y_ESTADO.md` blob `09f54a95b52cc140ace1f0951f56a0058e17f2e2`; `04_ARQUITECTURA_CANONICA_OBJETIVO.md` blob `d259e8158c50e1ae8ecda2fb242e5bd4c29a1ffc`; `02_AUDITORIA_INTEGRAL_DE_SUPABASE.md` blob `02198192088e1c24def67b73e23322b6e78d1ca4`; `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` blob `5aca70b4f00e0eedd78d36c8f4f09a058a9f7053`; `01_PROTOCOLO.md` blob `a5213ffd355917ec47bc5b79ad3f002905939e6b`; `delivery-contract.json` blob `01f197364800a1998867eb4e9a8d104429bb222f`; `active-sequence.json` blob `0c63430b3efff08c308482196d781a20a424d172`
**Tipo de tarea:** definición normativa del ciclo de sesiones Auth y empresariales, renovación, aseguramiento, cierre, revocación, bloqueo, desactivación, offboarding y sesiones de actor compartido; sin crear, modificar, bloquear o eliminar cuentas, sesiones, refresh tokens, factores, vínculos, trabajadores, clientes, dispositivos, tablas, schemas, constraints, funciones, triggers, policies, grants, configuración de Auth, migraciones, código, datos ni despliegues

#### 1. Objetivo

Definir un ciclo único, verificable y fail closed para las sesiones que intervienen en Vento OS, separando obligatoriamente:

- la sesión técnica administrada por Supabase Auth;
- el control empresarial de vigencia del principal y sus identidades;
- la sesión temporal de actor humano sobre un dispositivo compartido;
- el contexto efímero de una ejecución de servicio;
- la revocación técnica de credenciales;
- la desactivación empresarial de trabajador, cliente o dispositivo;
- el cierre coordinado de accesos derivados durante offboarding.

```text
CREDENCIAL VÁLIDA
        ↓
SESIÓN AUTH ADMINISTRADA
        ↓
CONTROL EMPRESARIAL DE SESIÓN
        ↓
PRINCIPAL + VÍNCULO + IDENTIDAD VIGENTES
        ↓
ACTOR EFECTIVO Y ASEGURAMIENTO SUFICIENTE
        ↓
CONTEXTO + AUTORIZACIÓN
        ↓
OPERACIÓN O DENEGACIÓN ESTABLE
```

Una fila de sesión, un refresh token no revocado, un JWT aún presentable o una cuenta no eliminada no demostrarán por sí solos que una operación empresarial continúa autorizada.

#### 2. Artefacto producido

```text
SUPABASE-AUTH-SESSION-REVOCATION-DEACTIVATION-MODEL-001@1.0.0
```

| Propiedad                              |             Valor |
| -------------------------------------- | ----------------: |
| `managed_auth_session_source`          |   `Supabase Auth` |
| `enterprise_session_control_owner`     | `identity_access` |
| `audit_owner`                          |           `audit` |
| `principal_session_classes`            |             **3** |
| `enterprise_session_states`            |             **8** |
| `actor_session_states`                 |             **6** |
| `revocation_scopes`                    |             **5** |
| `revocation_reason_classes`            |            **12** |
| `duration_policy_profiles`             |             **5** |
| `offboarding_execution_states`         |             **5** |
| `raw_tokens_persisted_by_vento_target` |             **0** |
| `physical_changes_authorized`          |             **0** |

#### 3. Fuentes canónicas consumidas

| Fuente                                                   | Decisión consumida                                                                                                                         |
| -------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| `01_PROTOCOLO.md`                                        | continuidad, integridad, una sola tarea y separación estricta entre definición e implementación                                            |
| `delivery-contract.json`                                 | artefacto único de tarea y registro 04A completo con nombre único                                                                          |
| `active-sequence.json`                                   | secuencia `SUPA-ARC-001` a `SUPA-ARC-025`; `SUPA-ARC-010` como tarea actual                                                                |
| `SUPABASE-AUTH-ENTERPRISE-IDENTITY-MODEL-001@1.0.0`      | cuenta, principal, identidad, actor efectivo, aseguramiento y denegación cerrada                                                           |
| `SUPABASE-AUTH-ENTERPRISE-IDENTITY-LINK-MODEL-001@1.0.0` | cardinalidades, lifecycle de vínculos, coexistencia trabajador-cliente y exclusión de cuentas técnicas                                     |
| `AUTH-MOD-001` y `ADR-AUTH-001`                          | autenticación, identidad, actor, contexto, autorización y presentación como capas separadas                                                |
| `SUPA-AUD-010`                                           | 174 sesiones AAL1, 172 refresh tokens no revocados, 45 sesiones de trabajadores inactivos y seis tokens no revocados de cuentas bloqueadas |
| `SUPA-AUD-011`                                           | dos dispositivos activos, cero sesiones de actor y cero firmas de actor en el corte auditado                                               |
| `SUPABASE-TRANSVERSAL-AUDIT-EVENT-SCHEMA-001@1.0.0`      | evidencia append-only, causalidad, resultados y conciliación sin secretos                                                                  |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`       | 5.131 requisitos hasta `SUPA-ARC-009`; rango `TREQ-SUPABASE-001` a `836`                                                                   |

#### 4. Decisión canónica

Vento OS distinguirá cuatro planos que no podrán colapsarse:

```text
AUTH SESSION
  cuenta, proveedor, access token, refresh chain y AAL administrados por Supabase

ENTERPRISE SESSION CONTROL
  referencia opaca, principal, estado, vigencia, versión de revocación y aseguramiento

SHARED DEVICE ACTOR SESSION
  trabajador temporal que actúa sobre una sesión técnica de dispositivo

SERVICE EXECUTION CONTEXT
  ejecución server-side nominal, acotada, correlacionada y sin identidad humana implícita
```

`identity_access` gobernará el control empresarial y las sesiones de actor; Supabase Auth continuará gobernando credenciales, sesiones y rotación técnica. Vento no creará una copia competidora de `auth.sessions`, `auth.refresh_tokens`, contraseñas, OTP, factores o tokens.

#### 5. Fronteras de responsabilidad

| Elemento                                                | Owner                           | Regla                                                               |
| ------------------------------------------------------- | ------------------------------- | ------------------------------------------------------------------- |
| access token, refresh token, proveedor y sesión técnica | Supabase Auth                   | usar superficies soportadas; no duplicar secretos                   |
| estado empresarial de la sesión                         | `identity_access`               | resolver vigencia, principal, identidad, aseguramiento y revocación |
| estado laboral                                          | `workforce`                     | determina si la identidad `EMPLOYEE` continúa activa                |
| estado de cliente                                       | `customer_engagement`           | determina si la identidad `CUSTOMER` continúa activa                |
| estado del dispositivo                                  | `technology_operations`         | determina si la terminal continúa habilitada                        |
| sesión de actor compartido                              | `identity_access`               | vincula temporalmente dispositivo, trabajador y contexto            |
| autorización                                            | contratos AUTH y `SUPA-ARC-015` | decide capacidad sobre recurso y territorio                         |
| evidencia de apertura, cierre y revocación              | `audit`                         | registra referencias, razones, resultados y fallos sin secretos     |

La revocación técnica no sustituirá la desactivación empresarial y la desactivación empresarial no se considerará completa mientras los accesos derivados permanezcan sin cierre o conciliación.

#### 6. Clases de sesión por principal

| Clase                     | Principal       | Uso permitido                                                                                                      |
| ------------------------- | --------------- | ------------------------------------------------------------------------------------------------------------------ |
| `HUMAN_PERSONAL`          | `HUMAN_USER`    | acceso personal a contratos laborales o de cliente según la identidad exigida por la aplicación                    |
| `SHARED_DEVICE_TECHNICAL` | `SHARED_DEVICE` | configuración, heartbeat, diagnóstico y apertura o cierre de sesión de actor; sin mutación empresarial por sí sola |
| `SERVICE_EXECUTION`       | `SERVICE`       | operación server-side nominal incluida en allowlist y con contexto de ejecución limitado                           |

Una sesión `HUMAN_PERSONAL` no fusionará identidades. La misma cuenta podrá resolver `EMPLOYEE` o `CUSTOMER` únicamente cuando el contrato consumidor lo exija y el vínculo correspondiente esté vigente.

#### 7. Estados del control empresarial de sesión

Vocabulario cerrado:

| Estado              | Significado                                                                                          |     Puede ejecutar operación ordinaria |
| ------------------- | ---------------------------------------------------------------------------------------------------- | -------------------------------------: |
| `PENDING_ASSURANCE` | la autenticación existe, pero falta confirmación, reautenticación o nivel de aseguramiento requerido |                                     No |
| `ACTIVE`            | sesión, principal, vínculo e identidad cumplen las condiciones actuales                              |   Sí, sujeto a contexto y autorización |
| `REAUTH_REQUIRED`   | debe demostrar nuevamente presencia o elevar aseguramiento antes de continuar                        | No para mutaciones o accesos sensibles |
| `SUSPENDED`         | acceso contenido temporalmente por revisión, riesgo o dependencia no resuelta                        |                                     No |
| `REVOKING`          | el cierre fue ordenado y existen acciones técnicas o consumidoras pendientes                         |                                     No |
| `REVOKED`           | la sesión fue invalidada por decisión administrativa, seguridad o lifecycle                          |                                     No |
| `EXPIRED`           | terminó por política temporal, inactividad o vencimiento de la sesión administrada                   |                                     No |
| `TERMINATED`        | terminó de forma normal y auditable por cierre explícito                                             |                                     No |

Solo `ACTIVE` podrá entrar a la evaluación normal de contexto y autorización. Ningún estado terminal retornará a `ACTIVE`; una nueva autenticación producirá una identidad de sesión distinta.

#### 8. Invariantes del ciclo de sesión

1. Toda sesión tendrá un único `principal_kind`.
2. Una sesión técnica de dispositivo nunca adquirirá identidad laboral propia.
3. Una sesión de actor no podrá existir sin una sesión técnica de dispositivo vigente.
4. La actividad de una identidad se verificará en su owner schema y no únicamente en claims.
5. Un vínculo revocado, suspendido, en conflicto o supersedido no participará en resolución.
6. El bloqueo, revocación, expiración o desactivación tendrá precedencia sobre roles, permisos, sedes, turnos y excepciones positivas.
7. El refresh de credenciales no podrá reactivar una sesión `SUSPENDED`, `REVOKING`, `REVOKED`, `EXPIRED` o `TERMINATED`.
8. Una operación sensible resolverá estado fresco antes de producir efecto.
9. Un cierre parcial nunca se presentará como logout, revocación u offboarding completo.
10. Todo cambio será monotónico, idempotente y auditable.

#### 9. Contrato lógico de control de sesión

Todo control empresarial de sesión deberá poder representar:

```text
enterprise_session_control_id
+ auth_subject_id
+ auth_session_reference
+ principal_id
+ principal_kind
+ session_class
+ session_state
+ session_generation
+ principal_revocation_version
+ assurance_level_observed
+ assurance_level_required
+ opened_at
+ last_verified_at
+ absolute_expires_at
+ idle_expires_at
+ reauth_required_at
+ suspended_at
+ revocation_requested_at
+ revoked_at
+ terminated_at
+ revocation_scope
+ revocation_reason
+ device_id
+ actor_session_id
+ source_versions
+ audit_reference
```

`auth_session_reference` será una referencia opaca o identificador administrado permitido. No contendrá access token, refresh token, OTP, contraseña, secreto, private key ni credencial reutilizable.

#### 10. Aseguramiento, reautenticación y MFA

1. El nivel observado provendrá de la sesión administrada y no de un parámetro del cliente.
2. Cada contrato sensible declarará `assurance_level_required`.
3. Una sesión con nivel insuficiente pasará a `PENDING_ASSURANCE` o `REAUTH_REQUIRED` y no ejecutará el efecto solicitado.
4. La elevación de aseguramiento no ampliará identidades, roles, permisos ni territorio.
5. Reautenticar no reactivará una identidad, vínculo, dispositivo o sesión suspendida.
6. Recuperación de cuenta, cambio de proveedor y renovación de token no equivaldrán a MFA ni a aprobación empresarial.
7. El corte actual de 174 sesiones AAL1 y cero AAL2 se conservará como línea base, no como certificación de suficiencia.
8. La selección exacta de acciones con step-up se vinculará con permisos sensibles y contratos de dominio en `SUPA-ARC-015` y `SUPA-ARC-016`.

#### 11. Perfiles de duración y renovación

Se definen cinco perfiles lógicos:

| Perfil                    | Uso                                | Parámetros obligatorios                                                             |
| ------------------------- | ---------------------------------- | ----------------------------------------------------------------------------------- |
| `EMPLOYEE_PERSONAL`       | sesión personal laboral            | edad absoluta, inactividad, renovación, reautenticación y cierre por baja           |
| `CUSTOMER_PERSONAL`       | sesión personal de cliente         | edad absoluta, renovación, recuperación y revocación por riesgo o estado de cliente |
| `SHARED_DEVICE_TECHNICAL` | terminal compartida                | edad absoluta, rotación, vínculo con dispositivo y cierre remoto                    |
| `SENSITIVE_STEP_UP`       | ventana de aseguramiento reforzado | duración corta, finalidad concreta y no reutilización fuera del contrato            |
| `SERVICE_EXECUTION`       | ejecución técnica                  | expiración breve o de una sola ejecución, operación permitida y correlación         |

Cada perfil tendrá valores explícitos por ambiente para `absolute_max_age`, `idle_timeout`, `refresh_policy`, `reauth_window`, `concurrent_session_policy` y `offline_tolerance`. Esta tarea no inventa duraciones numéricas; su parametrización y paridad corresponden a `SUPA-ARC-024`.

#### 12. Frescura y versión de revocación

Las operaciones sensibles deberán comprobar, en una frontera confiable:

```text
SESIÓN AUTH VÁLIDA
AND enterprise session = ACTIVE
AND session_generation vigente
AND principal_revocation_version vigente
AND vínculo ACTIVE
AND identidad de dominio ACTIVE
AND aseguramiento suficiente
AND actor vigente cuando aplique
```

Una sesión o token con versión anterior a la última revocación efectiva producirá denegación aunque todavía pueda presentarse técnicamente. Los mecanismos físicos de versión, cache, consulta y propagación se resolverán en `SUPA-ARC-012`, `SUPA-ARC-013` y `SUPA-ARC-015`.

#### 13. Alcances de revocación

Vocabulario cerrado:

| Alcance                    | Efecto esperado                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------- |
| `CURRENT_SESSION`          | cierra una sesión concreta y su cadena de renovación                                         |
| `SUBJECT_ALL_SESSIONS`     | cierra todas las sesiones del `auth_subject_id`                                              |
| `PRINCIPAL_CLASS_SESSIONS` | cierra las sesiones de una clase de principal o uso controlado                               |
| `ACTOR_SESSION`            | termina una sesión humana sobre dispositivo compartido sin confundirla con la cuenta técnica |
| `SERVICE_EXECUTION`        | invalida una ejecución o credencial técnica nominal y sus reintentos pendientes              |

Todo alcance deberá declarar iniciador, autoridad, razón, momento efectivo, resultado por dependencia y evidencia.

#### 14. Razones de revocación y cierre

Vocabulario cerrado:

```text
USER_SIGN_OUT
ADMINISTRATIVE_BLOCK
EMPLOYEE_DEACTIVATED
CUSTOMER_DEACTIVATED
DEVICE_DEACTIVATED
IDENTITY_LINK_REVOKED
ACTOR_SESSION_ENDED
CREDENTIAL_ROTATED
ASSURANCE_POLICY_CHANGED
SUSPECTED_COMPROMISE
ACCOUNT_REPLACED_OR_SPLIT
ENVIRONMENT_OR_POLICY_CHANGE
```

La razón no se inferirá desde un mensaje de interfaz. Deberá provenir de una acción autorizada, evento de lifecycle o control técnico verificable.

#### 15. Logout y cierre voluntario

1. El logout de sesión actual usará `CURRENT_SESSION`.
2. El logout global usará `SUBJECT_ALL_SESSIONS`.
3. El cliente deberá limpiar credenciales y estado local después de obtener resultado del servidor, pero esa limpieza no será la evidencia única del cierre.
4. Repetir la misma solicitud será idempotente y devolverá el resultado previo o un no-op aprobado.
5. Un fallo parcial dejará estado `REVOKING` y abrirá reconciliación.
6. Cerrar una sesión personal no desactivará la identidad empresarial.
7. Cerrar una sesión de actor no cerrará por sí solo la sesión técnica del dispositivo, salvo política o riesgo que lo ordene.

#### 16. Bloqueo administrativo y compromiso sospechado

`ADMINISTRATIVE_BLOCK` y `SUSPECTED_COMPROMISE` exigirán:

- contención inmediata del control empresarial;
- incremento de la versión de revocación aplicable;
- revocación de las sesiones y cadenas de renovación afectadas;
- cierre de sesiones de actor y contextos de servicio relacionados cuando corresponda;
- invalidación de recuperación o factores comprometidos mediante superficies soportadas;
- auditoría de actor, razón, alcance, resultados y residuales;
- prohibición de mostrar éxito mientras exista acceso material no conciliado.

Una marca de cuenta bloqueada sin cierre observable de sesiones y refresh chains no se considerará revocación completa.

#### 17. Desactivación empresarial por identidad

| Evento                            | Efecto obligatorio                                                                                                                       |
| --------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| trabajador inactivo               | denegar identidad `EMPLOYEE`, cerrar accesos laborales, sesiones de actor, simulaciones y contexto operativo; conservar historia laboral |
| cliente inactivo                  | denegar identidad `CUSTOMER` y accesos comerciales; conservar historia, consentimiento, saldos y transacciones según su owner            |
| dispositivo inactivo              | revocar sesión técnica, cerrar toda sesión de actor y bloquear capacidades técnicas y empresariales                                      |
| vínculo revocado o supersedido    | excluir la identidad del principal y forzar nueva resolución antes de continuar                                                          |
| cuenta Auth bloqueada o eliminada | denegar todas las identidades autenticables asociadas sin eliminar perfiles empresariales                                                |

La desactivación de una identidad no eliminará el objeto empresarial ni sus referencias históricas.

#### 18. Offboarding laboral

El offboarding utilizará cinco estados:

```text
REQUESTED
CONTAINMENT_ACTIVE
REVOCATION_IN_PROGRESS
RECONCILIATION_REQUIRED
COMPLETED
```

Para llegar a `COMPLETED` deberá existir evidencia de:

1. trabajador inactivo en `workforce`;
2. vínculo `EMPLOYEE` suspendido, revocado o supersedido según la causa;
3. control empresarial denegado desde el inicio de la contención;
4. sesiones personales laborales y refresh chains afectadas cerradas;
5. sesiones de actor compartido finalizadas;
6. simulaciones, turnos o check-ins que otorguen contexto efectivo cerrados o invalidados;
7. push tokens y registros personales de dispositivo retirados o reasignados según contrato;
8. caches, sesiones de aplicación y consumidores derivados notificados o invalidados;
9. permisos, sedes y áreas residuales imposibilitados de autorizar;
10. fallos parciales conciliados y residuales con owner, tarea y evidencia.

La baja laboral no desactivará automáticamente la identidad `CUSTOMER`. Cuando ambas identidades compartan cuenta, la sesión existente podrá cerrarse para garantizar la contención laboral; el cliente deberá iniciar una nueva sesión y resolver exclusivamente su identidad comercial vigente.

#### 19. Sesión de actor en dispositivo compartido

La sesión Auth técnica y la sesión del actor serán independientes:

```text
SHARED_DEVICE_TECHNICAL SESSION
        +
ACTIVE DEVICE
        +
ACTOR SESSION ACTIVE
        +
EMPLOYEE ACTIVE
        +
SHIFT / SITE / AREA / ROLE VALID
        =
EFFECTIVE ACTOR EMPLOYEE
```

Estados cerrados de sesión de actor:

| Estado          | Significado                                             |
| --------------- | ------------------------------------------------------- |
| `PENDING_ACTOR` | terminal activa sin trabajador efectivo                 |
| `ACTIVE`        | trabajador, contexto y vigencia comprobados             |
| `LOCKED`        | actor temporalmente contenido por control o riesgo      |
| `EXPIRED`       | venció por tiempo, turno, contexto o sesión técnica     |
| `ENDED`         | cierre normal por el trabajador o el flujo operativo    |
| `REVOKED`       | cierre administrativo, de seguridad o por desactivación |

Solo `ACTIVE` permitirá mutaciones empresariales. La sesión de actor no podrá sobrevivir a la sesión técnica, dispositivo inactivo, trabajador inactivo, turno inválido, contexto incompatible o revocación administrativa.

#### 20. Contrato lógico de sesión de actor

```text
actor_session_id
+ device_id
+ technical_auth_subject_id
+ technical_session_reference
+ employee_id
+ actor_session_state
+ shift_id
+ site_id
+ area_id
+ operational_role_id
+ assurance_reference
+ started_at
+ expires_at
+ last_verified_at
+ locked_at
+ ended_at
+ revoked_at
+ end_reason
+ source_versions
+ audit_reference
```

Cada mutación sensible desde terminal compartida volverá a comprobar actor, trabajador, dispositivo, turno y contexto. Un PIN, firma o selección visual no sustituirá esa resolución.

#### 21. Ejecuciones de servicio

1. `SERVICE_EXECUTION` no será una sesión de usuario ni tendrá perfil laboral o de cliente.
2. Cada ejecución declarará `service_principal_id`, operación, ambiente, owner técnico, finalidad, inicio, expiración y correlación.
3. `service_role` continuará siendo una capacidad técnica y no el actor empresarial.
4. Una acción iniciada por humano conservará el principal y actor humanos aunque un backend privilegiado produzca el efecto.
5. Una ejecución autónoma utilizará allowlist, expiración, idempotencia, auditoría y alcance mínimo.
6. Una credencial técnica rotada o revocada no podrá mantener ejecuciones nuevas bajo una versión anterior.
7. Edge Functions, webhooks, cron y workers completarán su materialización en `SUPA-ARC-020`.

#### 22. Concurrencia, renovación e idempotencia

- una refresh chain revocada no podrá abrir una sesión sucesora activa;
- una renovación concurrente con revocación deberá converger en denegación cuando la revocación gane precedencia;
- una respuesta tardía no reducirá `session_generation` ni `principal_revocation_version`;
- reintentar logout, bloqueo, desactivación u offboarding no duplicará efectos ni auditorías principales;
- cada dependencia conservará resultado `SUCCEEDED`, `ALREADY_CLOSED`, `FAILED_SAFE`, `UNKNOWN_OUTCOME` o `RECONCILIATION_REQUIRED`;
- `UNKNOWN_OUTCOME` impedirá asumir continuidad y exigirá consulta o conciliación;
- ningún consumidor podrá reactivar acceso a partir de cache, sesión local o evento tardío.

#### 23. Recuperación, cambio de proveedor y sustitución de cuenta

1. Recuperar contraseña o canal no reactivará vínculos, identidades ni permisos.
2. Vincular otro proveedor no cambiará IDs empresariales ni el actor efectivo.
3. Desvincular el último proveedor autenticable exigirá una ruta segura de recuperación o dejará la cuenta no autenticable sin eliminar perfiles.
4. Cambiar, fusionar o separar cuentas cerrará o supersederá sesiones anteriores antes del cutover.
5. Una cuenta sucesora tendrá nueva sesión, nueva generación y resolución completa.
6. Toda operación conservará auditoría, consentimiento, historia, rollback y prueba de no apropiación.
7. La paridad de proveedores y ambientes se resolverá en `SUPA-ARC-024`.

#### 24. Auditoría y minimización

Se auditarán, según sensibilidad:

- apertura, renovación, reautenticación, suspensión, revocación, expiración y cierre;
- sesión actual y alcance global de revocación;
- cambios de aseguramiento y factores;
- bloqueo administrativo y compromiso sospechado;
- desactivación de trabajador, cliente o dispositivo;
- apertura, bloqueo y cierre de actor compartido;
- offboarding y cada dependencia cerrada, fallida o pendiente;
- recuperación, cambio de proveedor, merge, split y cambio de cuenta;
- acceso administrativo a sesiones y decisiones de revocación.

La evidencia conservará referencias, hashes, versiones, actor, autoridad, razón y resultado. Quedan prohibidos access tokens, refresh tokens, OTP, contraseñas, PIN, factores completos, secretos y payloads de recuperación.

#### 25. Comportamiento de denegación

Códigos mínimos:

```text
session_not_active
session_expired
session_suspended
session_revoking
session_revoked
session_terminated
session_generation_stale
principal_revocation_version_stale
reauthentication_required
assurance_level_insufficient
refresh_chain_revoked
account_blocked
identity_deactivated
identity_link_not_active
device_session_invalid
actor_session_not_active
service_execution_invalid
offboarding_in_progress
revocation_reconciliation_required
```

Los consumidores podrán traducirlos, pero no reinterpretar una denegación como sesión anónima, error genérico o éxito parcial.

#### 26. Línea base actual y clasificación obligatoria

| Evidencia AS-IS                                              | Clasificación objetivo                                                  |
| ------------------------------------------------------------ | ----------------------------------------------------------------------- |
| 174 sesiones, todas AAL1                                     | línea base sin certificación de aseguramiento suficiente                |
| cero sesiones AAL2 y cero factores MFA                       | capacidad no implementada; requiere contrato y prueba antes de exigirla |
| 174 sesiones con `not_after` nulo                            | duración máxima no certificada en el dato observado                     |
| 172 refresh tokens no revocados                              | universo que deberá reconciliar lifecycle y política de duración        |
| 14 trabajadores inactivos con 45 sesiones                    | brecha crítica de offboarding y contención                              |
| tres cuentas bloqueadas con seis refresh tokens no revocados | bloqueo no equivalente a revocación completa                            |
| dos dispositivos activos con cuenta Auth                     | universo de sesión técnica que deberá usar cuenta dedicada              |
| cero sesiones y cero firmas de actor                         | control configurado pero sin readiness operativo demostrado             |

La tarea no altera esos datos ni declara que cada fila observada continúe utilizable. Los conteos son baseline para transición, pruebas y reconciliación.

#### 27. Orden obligatorio de materialización futura

```text
1. INVENTARIAR SESIONES, REFRESH CHAINS, FACTORES, ACTORES Y CONSUMIDORES
2. CLASIFICAR SESIÓN, PRINCIPAL, IDENTIDAD, ASEGURAMIENTO Y DURACIÓN
3. MATERIALIZAR CONTROL EMPRESARIAL Y VERSIONES DE REVOCACIÓN
4. IMPLEMENTAR CIERRE DE SESIÓN Y REVOCACIÓN IDEMPOTENTE
5. IMPLEMENTAR SESIONES DE ACTOR COMPARTIDO
6. ORQUESTAR DESACTIVACIÓN Y OFFBOARDING CON CONTENCIÓN INMEDIATA
7. ADAPTAR GUARDS, RPC, RLS, CLIENTES, PUSH Y CACHES
8. ACTIVAR STEP-UP Y MFA POR CONTRATO SENSIBLE
9. PROBAR CONCURRENCIA, FALLOS PARCIALES, RECUPERACIÓN Y ROLLBACK
10. RECONCILIAR HISTÓRICO, RETIRAR FUENTES LEGACY Y DETECTAR DRIFT
```

El orden no autoriza implementación física.

#### 28. Riesgos restringidos y carryover

| Riesgo                                     | Efecto de esta tarea                                           | Resolución restante                      |
| ------------------------------------------ | -------------------------------------------------------------- | ---------------------------------------- |
| trabajador inactivo con sesiones           | exige contención inmediata y cierre verificable                | `SUPA-TRANS-004`; paquete de offboarding |
| cuenta bloqueada con refresh activo        | separa bloqueo de revocación completa                          | `SUPA-ARC-013`; `015`; transición        |
| duración máxima no certificada             | define perfiles y parámetros obligatorios                      | `SUPA-ARC-024`                           |
| ausencia de MFA y AAL2                     | define aseguramiento por contrato, sin declararlo implementado | `SUPA-ARC-015`; `016`; `024`             |
| token o claim obsoleto                     | exige estado fresco y versión de revocación                    | `SUPA-ARC-012`; `013`; `015`             |
| dispositivo sin sesión de actor demostrada | define ciclo, estados y vigencia                               | transición de dispositivos compartidos   |
| offboarding parcial                        | exige estado `RECONCILIATION_REQUIRED` y residuales con owner  | `SUPA-ARC-007`; `022`; transición        |
| caches y consumidores divergentes          | exige propagación e invalidación controladas                   | `SUPA-ARC-019`; `020`; `025`             |
| drift de política y ambientes              | exige registro, paridad y validador recurrente                 | `SUPA-ARC-024`; `025`; `SUPA-TRANS-015`  |

Ningún riesgo queda cerrado físicamente por esta definición.

#### 29. Decisiones reservadas

| Decisión                                                      | Tarea propietaria                       |
| ------------------------------------------------------------- | --------------------------------------- |
| nombres físicos, claves, constraints, estados y timestamps    | `SUPA-ARC-011`; `SUPA-ARC-012`          |
| funciones, RPC, triggers y orquestación transaccional         | `SUPA-ARC-013`                          |
| excepciones privilegiadas y `SECURITY DEFINER`                | `SUPA-ARC-014`                          |
| RLS, grants, claims, roles de ejecución y políticas de acceso | `SUPA-ARC-015`                          |
| requerimiento de aseguramiento por contrato de dominio        | `SUPA-ARC-016`                          |
| Storage y evidencia física                                    | `SUPA-ARC-018`                          |
| Realtime y propagación de eventos                             | `SUPA-ARC-019`                          |
| Edge Functions, webhooks, cron, workers y revocación externa  | `SUPA-ARC-020`                          |
| retención, respaldo, restauración y legal hold                | `SUPA-ARC-022`                          |
| tipos compartidos de sesión y denegación                      | `SUPA-ARC-023`                          |
| duraciones, proveedores, MFA y paridad por ambiente           | `SUPA-ARC-024`                          |
| inventario, migración, reconciliación, cutover y rollback     | `SUPA-TRANS-001` a `SUPA-TRANS-015`     |
| implementación física                                         | paquetes E5 y BLOQUE R correspondientes |

#### 30. Límites de autorización

Esta tarea no autoriza:

- crear, actualizar, bloquear o eliminar cuentas Auth;
- cerrar, revocar o renovar sesiones o refresh tokens;
- configurar duración, proveedor, MFA, captcha, recuperación o protección de contraseña;
- activar, desactivar o modificar trabajadores, clientes, dispositivos, vínculos, turnos, check-ins, simulaciones o push tokens;
- crear tablas espejo de Auth, copiar tokens o persistir secretos;
- crear o modificar schemas, tablas, constraints, funciones, triggers, policies, grants, RLS o ACL;
- modificar aplicaciones, guards, Server Actions, RPC, Edge Functions, cron, webhooks o workers;
- ejecutar DDL, DML, migraciones, backfills, pruebas mutantes, cutover o despliegues;
- iniciar `SUPA-ARC-011` antes de aprobación expresa.

#### 31. Requisitos de prueba generados

**Resultado:** GENERA REQUISITOS DE PRUEBA

Se incorporan al Registro Canónico de Requisitos de Prueba:

```text
TREQ-SUPABASE-837 a TREQ-SUPABASE-878
```

Los cuarenta y dos requisitos protegen separación de planos, clases y estados de sesión, no persistencia de secretos, aseguramiento, frescura, duración, renovación, revocación, bloqueo, desactivación, offboarding, sesiones de actor, servicios, concurrencia, recuperación, auditoría, transición y detección de drift. El detalle completo existe únicamente en `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`.

#### 32. Criterios de aceptación

- [ ] Supabase Auth conserva autoridad exclusiva sobre credenciales, sesiones y refresh chains administradas.
- [ ] `identity_access` gobierna control empresarial y sesiones de actor sin copiar tokens.
- [ ] Existen exactamente tres clases de sesión por principal.
- [ ] Existen exactamente ocho estados empresariales de sesión y solo `ACTIVE` admite operación normal.
- [ ] Existen exactamente seis estados de sesión de actor.
- [ ] Estados terminales no retornan a `ACTIVE`.
- [ ] Revocación y desactivación prevalecen sobre permisos y contexto positivos.
- [ ] Una operación sensible comprueba versión y estado fresco.
- [ ] Aseguramiento insuficiente exige reautenticación o step-up sin ampliar autoridad.
- [ ] Los cinco perfiles de duración declaran todos sus parámetros sin inventar valores numéricos.
- [ ] Logout, revocación y offboarding son idempotentes y conciliables.
- [ ] Una cuenta bloqueada no se considera cerrada mientras persistan accesos no conciliados.
- [ ] La baja laboral cierra acceso laboral sin eliminar ni desactivar automáticamente la identidad cliente.
- [ ] Un dispositivo inactivo cierra sesión técnica y sesiones de actor.
- [ ] Una sesión de actor no sobrevive a su dispositivo, trabajador, turno, contexto o sesión técnica.
- [ ] Una ejecución de servicio nunca se presenta como usuario o autorización empresarial.
- [ ] Recuperación o cambio de proveedor no reactiva vínculos ni permisos.
- [ ] Auditoría y controles no almacenan tokens, OTP, contraseñas, PIN ni secretos.
- [ ] La línea base de sesiones y brechas queda protegida por pruebas de transición.
- [ ] Se generan `TREQ-SUPABASE-837` a `TREQ-SUPABASE-878`.
- [ ] No se ejecutan cambios físicos, código ni implementación.
- [ ] `SUPA-ARC-011` permanece reservada.

#### 33. Controles estructurales requeridos

| Control                                 | Resultado esperado |
| --------------------------------------- | -----------------: |
| owner de sesión técnica                 |    `Supabase Auth` |
| owner de control empresarial            |  `identity_access` |
| owner de evidencia                      |            `audit` |
| clases de sesión por principal          |              **3** |
| estados empresariales de sesión         |              **8** |
| estados de sesión de actor              |              **6** |
| alcances de revocación                  |              **5** |
| razones de revocación                   |             **12** |
| perfiles de duración                    |              **5** |
| estados de offboarding                  |              **5** |
| estados ordinarios autorizables         |   **1** (`ACTIVE`) |
| tokens o secretos persistidos por Vento |              **0** |
| requisitos nuevos                       |             **42** |
| cambios físicos                         |              **0** |

#### 34. Continuidad inmediata

```text
ÚLTIMA TAREA APROBADA
SUPA-ARC-009 — Definir vínculo de auth.users con trabajador, cliente y dispositivo
        ↓
TAREA ACTUAL APROBADA
SUPA-ARC-010 — Definir ciclo de sesión, revocación y desactivación
        ↓
SIGUIENTE TAREA RESERVADA
SUPA-ARC-011 — Definir convenciones de nombres para esquemas, tablas y columnas
```

`SUPA-ARC-011` permanece reservada y no se inicia hasta una solicitud expresa de continuidad.


### ✅ SUPA-ARC-011 — Definir convenciones de nombres para esquemas, tablas y columnas

**Estado:** APROBADA
**Fecha de preparación documental:** 2026-07-30
**Bloque propietario:** BLOQUE E3 — Arquitectura canónica de datos y gobierno integral de Supabase
**Tarea anterior:** `SUPA-ARC-010 — Definir ciclo de sesión, revocación y desactivación` — APROBADA
**Tarea siguiente:** `SUPA-ARC-012 — Definir convenciones de claves, constraints, estados y timestamps`
**Proyecto de referencia:** `vento-os-dev` — `clzdpinthhtknkmefsxx`
**Fuentes remotas observadas:** `00_CABECERA_Y_ESTADO.md` blob `ca97ffa51359e956a3187dbeff821c921485f8cd`; `04_ARQUITECTURA_CANONICA_OBJETIVO.md` blob `37a5f985d315273c4ff9f850f881bc6c31ad2c4b`; `02_AUDITORIA_INTEGRAL_DE_SUPABASE.md` blob `02198192088e1c24def67b73e23322b6e78d1ca4`; `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` blob `a14efa35424ff442689993127f6ae0ac5e04384b`; `01_PROTOCOLO.md` blob `a5213ffd355917ec47bc5b79ad3f002905939e6b`; `delivery-contract.json` blob `01f197364800a1998867eb4e9a8d104429bb222f`; `active-sequence.json` blob `0c63430b3efff08c308482196d781a20a424d172`; `01_PRINCIPIOS_OBLIGATORIOS.md` blob `36bb9a4c19f6d8e7edbaa03687219fb642c9c526`; `package.json` blob `2b98a51f48b721ffa3b53e2c9fc5188f8478e83d`; `validate-task-delivery.mjs` blob `6e1dc15ac9359dd4f311be73cbcfce2c6f40c286`
**Tipo de tarea:** definición normativa del lenguaje físico para schemas, relaciones tabulares y columnas de Vento OS; sin crear, renombrar, mover o retirar objetos, sin definir nombres de constraints, índices, secuencias, funciones, RPC, triggers o policies, sin DDL, DML, migraciones, backfills, cambios de datos, Data API, grants, RLS, Auth, Storage, Realtime, Edge Functions, cron, código ni despliegues

#### 1. Objetivo

Definir un estándar único, legible, estable y verificable para los nombres físicos de schemas, tablas, vistas, vistas materializadas y columnas gobernados por Vento, de modo que la arquitectura objetivo pueda distinguir responsabilidad empresarial, identidad de objeto y semántica de datos sin depender de aplicaciones, pantallas, rutas, equipos, ambientes, fechas, abreviaturas ambiguas o compatibilidad legacy.

```text
CONCEPTO EMPRESARIAL O TÉCNICO APROBADO
        ↓
TOKEN CANÓNICO EN INGLÉS
        ↓
IDENTIFICADOR ASCII EN lower_snake_case
        ↓
SCHEMA + RELACIÓN + COLUMNA CON SEMÁNTICA INEQUÍVOCA
        ↓
REGISTRO, COMPATIBILIDAD, TRANSICIÓN Y VALIDACIÓN RECURRENTE
```

El estándar gobierna identidad nominal. No decide todavía tipos físicos, generación de claves, nombres de constraints, vocabularios de estado, timestamps obligatorios, firmas de funciones, exposición, RLS ni transición objeto por objeto.

#### 2. Artefacto producido

```text
SUPABASE-SCHEMA-TABLE-COLUMN-NAMING-STANDARD-001@1.0.0
```

| Propiedad                              |              Valor |
| -------------------------------------- | -----------------: |
| `canonical_identifier_language`        |          `ENGLISH` |
| `canonical_identifier_case`            | `lower_snake_case` |
| `canonical_identifier_charset`         |            `ASCII` |
| `postgres_identifier_hard_limit_bytes` |             **63** |
| `target_owner_schema_names`            |             **26** |
| `target_transversal_schema_names`      |              **3** |
| `target_vento_schema_names_total`      |             **29** |
| `managed_schema_names_reserved`        |             **14** |
| `transitional_public_schema_names`     |              **1** |
| `approved_abbreviation_tokens`         |             **19** |
| `new_test_requirements`                |             **40** |
| `physical_changes_authorized`          |              **0** |

#### 3. Fuentes canónicas consumidas

| Fuente                                                       | Decisión consumida                                                                                          |
| ------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------- |
| `01_PROTOCOLO.md`                                            | continuidad, preservación histórica, una sola tarea y separación entre definición e implementación          |
| `delivery-contract.json`                                     | artefacto único de tarea y registro 04A completo con identidad de entrega única                             |
| `active-sequence.json`                                       | secuencia `SUPA-ARC-001` a `SUPA-ARC-025`; `SUPA-ARC-011` como tarea actual                                 |
| `01_PRINCIPIOS_OBLIGATORIOS.md` de E3                        | schema como frontera lógica y de nombres; dominio como responsabilidad estable; aplicación como consumidora |
| `SUPABASE-SCHEMA-SEPARATION-PRINCIPLES-001@1.0.0`            | separación entre plataforma, dominio, aplicación, exposición y compatibilidad                               |
| `SUPABASE-AUTHORITATIVE-SCHEMA-OWNERSHIP-REGISTRY-001@1.0.0` | nombres físicos aprobados de `VSCHEMA-001` a `VSCHEMA-026`                                                  |
| `SUPABASE-PUBLIC-SCHEMA-FUTURE-FUNCTION-001@1.0.0`           | `public` como namespace transitorio de compatibilidad y no como destino universal                           |
| `SUPABASE-EXPOSED-CONTRACT-LAYER-001@1.0.0`                  | schema `api` e identidad contractual `api.<contract_name>_v<major>`                                         |
| `SUPABASE-PRIVATE-INTERNAL-LAYER-001@1.0.0`                  | schema técnico privado `app_private`                                                                        |
| `SUPABASE-TRANSVERSAL-AUDIT-EVENT-SCHEMA-001@1.0.0`          | schema transversal `audit` y clases de evidencia, eventos y conciliación                                    |
| `SUPA-AUD-001` a `SUPA-AUD-005`                              | inventario de schemas, relaciones, columnas, constraints, enums y secuencias actuales                       |
| `SUPA-AUD-016` a `SUPA-AUD-018`                              | procedencia, drift y ejemplos confirmados de compatibilidad, backup, staging y nombres legacy               |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`           | 5.173 requisitos hasta `SUPA-ARC-010`; rango `TREQ-SUPABASE-001` a `878`                                    |

#### 4. Alcance y frontera de la decisión

Esta tarea gobierna:

1. nombres de schemas gobernados por Vento;
2. nombres de tablas ordinarias y particionadas;
3. nombres de vistas y vistas materializadas como relaciones tabulares;
4. nombres de columnas persistidas o proyectadas;
5. tokens, abreviaturas, pluralización, calificadores y sufijos nominales;
6. compatibilidad y lifecycle de nombres;
7. reglas que deberá aplicar un linter recurrente.

Esta tarea no gobierna:

- nombres de PK, FK, UNIQUE, CHECK, EXCLUDE, índices o secuencias;
- tipos de identificador, cascadas, nullability o generación de claves;
- estados permitidos, transiciones o timestamps obligatorios;
- nombres y firmas de funciones, RPC, procedimientos, parámetros o triggers;
- nombres de policies, roles PostgreSQL, grants o publicaciones;
- nombres de buckets, rutas de Storage, Edge Functions, cron jobs o secretos;
- renombres físicos ni mapeo individual de los objetos actuales.

Esas decisiones permanecen en `SUPA-ARC-012` a `SUPA-ARC-024` y en la transición posterior.

#### 5. Forma léxica obligatoria

Todo identificador nuevo gobernado por esta tarea deberá cumplir:

```text
^[a-z][a-z0-9]*(?:_[a-z0-9]+)*$
```

Reglas:

1. solo caracteres ASCII en minúscula;
2. palabras separadas por un único guion bajo;
3. primer carácter alfabético;
4. sin espacios, guiones medios, puntos, tildes, mayúsculas ni caracteres invisibles;
5. sin guion bajo inicial, final o duplicado;
6. sin identificadores entre comillas;
7. máximo de 63 bytes UTF-8, sin depender del truncamiento de PostgreSQL;
8. dos nombres distintos no podrán producir el mismo valor después de normalización o truncamiento;
9. los dígitos solo aparecerán cuando formen parte de un estándar aprobado o de la versión contractual de `api`; no sustituirán campos repetibles mediante sufijos ordinales;
10. toda excepción requerirá decisión versionada, propietario, riesgo, consumidores y puerta de salida.

#### 6. Idioma y vocabulario canónico

Los identificadores físicos usarán inglés. La documentación, etiquetas humanas y mensajes podrán permanecer en español.

Principios:

```text
UN CONCEPTO PRIMARIO
→ UN TOKEN CANÓNICO

UN TOKEN CANÓNICO
→ UN SIGNIFICADO PRIMARIO DENTRO DEL MODELO
```

| Concepto documental              | Token físico canónico                                   | Distinción obligatoria                                                |
| -------------------------------- | ------------------------------------------------------- | --------------------------------------------------------------------- |
| organización o grupo empresarial | `organization` o `org` únicamente donde ya fue aprobado | no usar `company` y `business` como sinónimos libres                  |
| sede                             | `site`                                                  | no confundir con ubicación interna                                    |
| área organizacional              | `area`                                                  | no usar para coordenada o superficie física                           |
| ubicación física de inventario   | `location`                                              | no sustituye `site` ni `area`                                         |
| trabajador                       | `employee`                                              | no alternar con `worker`, `staff` o `user` sin diferencia contractual |
| cliente                          | `customer`                                              | no inferir desde cuenta Auth                                          |
| usuario autenticable             | `auth_subject` o `principal` según el contrato          | no convertirlo en identidad laboral o comercial                       |
| actor efectivo                   | `actor`                                                 | no confundir con principal o rol                                      |
| dispositivo                      | `device`                                                | no modelarlo como empleado                                            |
| producto                         | `product`                                               | no usar `item` cuando representa el maestro de producto               |
| línea o elemento dependiente     | `item`                                                  | requiere entidad propietaria explícita                                |
| proveedor                        | `supplier`                                              | no alternar con `vendor` sin decisión de dominio                      |
| pedido de venta                  | `order`                                                 | no usar para orden de compra                                          |
| orden de compra                  | `purchase_order`                                        | conserva semántica distinta de `order`                                |
| envío o expedición               | `shipment`                                              | no equivale automáticamente a entrega confirmada                      |
| entrega confirmada               | `delivery`                                              | no equivale a transporte en curso                                     |
| permiso                          | `permission`                                            | no usar `capability` como sinónimo legacy                             |
| rol                              | `role`                                                  | no representa permiso efectivo ni actor                               |
| documento empresarial            | `document`                                              | no equivale al objeto físico de Storage                               |

Una nueva sinonimia no podrá introducirse por preferencia local de una aplicación o equipo.

#### 7. Namespaces canónicos de Vento

Los 26 owner schemas aprobados conservan exactamente estos nombres:

```text
org_governance
recruiting
workforce
work_scheduling
attendance
payroll
operational_compliance
product_catalog
recipes
commercial_offer
procurement
inventory
assets
production
sales_orders
payments
customer_engagement
logistics
finance
facilities
marketing
technology_operations
identity_access
business_records
business_insights
operational_continuity
```

Las tres capas transversales gobernadas por Vento conservan:

```text
api
app_private
audit
```

Reglas:

1. los 29 nombres anteriores pasan la forma léxica y son el registro nominal objetivo vigente;
2. ningún schema adicional podrá aparecer sin modificar explícitamente la arquitectura y su ownership;
3. un schema no llevará nombre de aplicación, repositorio, pantalla, equipo, persona, sede concreta, ambiente, fecha o fase;
4. no se usarán sufijos de versión, `legacy`, `old`, `new`, `backup`, `temp`, `staging`, `dev`, `test`, `qa`, `stage` o `prod` en schemas objetivo;
5. el nombre permanecerá estable aunque cambien aplicaciones, equipos o responsables;
6. un alias de schema no creará una segunda autoridad ni podrá permanecer sin lifecycle de compatibilidad.

#### 8. Namespaces administrados y reservados

Vento tratará como nombres reservados exactos:

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

No se crearán schemas Vento que colisionen, imiten o extiendan estos nombres para aparentar una superficie administrada. `public` permanece como namespace transitorio definido por `SUPA-ARC-004`; no recibe nuevas fuentes autoritativas ni se considera nombre disponible para otro propósito.

#### 9. Regla general para relaciones tabulares

El nombre de una tabla, vista o vista materializada deberá describir la colección o proyección empresarial que representa dentro de su schema.

Reglas:

1. usar sustantivos o frases nominales, nunca nombres de botones, rutas o acciones de interfaz;
2. usar plural para colecciones contables y un nombre de masa aceptado cuando el concepto no tenga plural operativo;
3. omitir el nombre del schema cuando repetirlo no añada semántica;
4. no incluir prefijos de aplicación como `nexo_`, `fogo_`, `viso_`, `numera_`, `pass_`, `pulso_`, `origo_`, `anima_`, `aura_` o `shell_` por razón de consumo;
5. no incluir prefijos o sufijos técnicos como `tbl_`, `table_`, `vw_`, `view_`, `mv_`, `_table`, `_view` o `_materialized_view`;
6. no usar nombres genéricos aislados como `data`, `records`, `details`, `master`, `misc`, `info`, `values`, `objects` o `entities`;
7. no codificar owner PostgreSQL, rol, grant, RLS, lenguaje, tipo de almacenamiento o estrategia de índice en el nombre;
8. el tipo físico de relación se conservará en catálogos y registros, no en el identificador;
9. una vista no podrá adoptar el mismo nombre calificado que su fuente ni presentarse como autoridad;
10. toda relación tendrá un concepto canónico y un owner schema resoluble antes de materializarse.

#### 10. Familias semánticas de tablas

Los siguientes tokens finales solo se usarán con su significado contractual:

| Token final   | Uso permitido                                                       |
| ------------- | ------------------------------------------------------------------- |
| `items`       | elementos dependientes de una entidad propietaria explícita         |
| `events`      | hechos inmutables ordenados; no estado actual mutable               |
| `entries`     | asientos o entradas append-only con semántica de ledger o auditoría |
| `assignments` | relación vigente o histórica de asignación con lifecycle propio     |
| `memberships` | pertenencia explícita entre una entidad y un conjunto               |
| `links`       | vínculo identificable con origen, estado y lifecycle                |
| `attempts`    | intentos independientes con resultado y correlación                 |
| `receipts`    | constancias de recepción, deduplicación o aceptación                |
| `snapshots`   | captura inmutable de un estado en un instante                       |
| `versions`    | revisiones persistidas de una entidad estable                       |
| `settings`    | configuración tipada de una entidad o ámbito explícito              |
| `policies`    | reglas configurables con autoridad y vigencia declaradas            |
| `rules`       | condiciones normativas evaluables; no policies de PostgreSQL        |
| `sessions`    | sesiones empresariales o técnicas declaradas por su owner           |

No se usarán `_map`, `_mapping`, `_xref`, `_join`, `_assoc`, `_log` o `_history` como sustitutos genéricos de una semántica no definida. Una tabla de relación deberá nombrar la relación empresarial en orden natural y declarar cuál entidad gobierna su lifecycle.

#### 11. Backups, staging y temporales

Una fuente autoritativa, una relación de `api` o una tabla de `public` no podrá usar nombres que incorporen:

```text
backup
bak
copy
old
new
temp
tmp
staging
import
pre
post
YYYYMMDD
```

El objeto actual `product_categories_backup_20260316_preparaciones` y `staging_insumos_import` permanecen como evidencia AS-IS de backup, staging, fecha y mezcla de idioma; esta tarea no los renombra ni retira. Su clasificación, datos, consumidores, TTL, exportación y disposición continúan bajo `SUPA-AUD-018` y `SUPA-TRANS-*`.

#### 12. Versiones y compatibilidad nominal

1. schemas, tablas autoritativas y columnas no llevarán sufijos `v1`, `v2` o equivalentes;
2. la identidad `api.<contract_name>_v<major>` aprobada en `SUPA-ARC-005` es la única excepción general para versión mayor visible en nombres gobernados por esta tarea;
3. un sufijo `v1` en una superficie `api` activa no implica legado;
4. deprecación, compatibilidad y sucesión se registrarán en metadata y contratos, no mediante `old`, `new`, `legacy` o fechas en nombres canónicos;
5. una coexistencia temporal conservará nombre fuente, nombre sucesor, consumidores, telemetría, paridad y condición de salida;
6. no existirán dos objetos activos con el mismo nombre y versión contractual.

#### 13. Regla general para columnas

Cada columna deberá expresar una propiedad atómica, una referencia o una medida del concepto representado por su relación.

Reglas:

1. cumplir la forma léxica general;
2. no repetir el nombre completo de la tabla cuando el contexto ya sea inequívoco;
3. no usar `data`, `value`, `field`, `property`, `attribute`, `misc`, `extra`, `info`, `details` o `other` sin un contrato tipado y una semántica específica;
4. no usar columnas ordinales como `phone_1`, `phone_2`, `address_1` o `value_3` para modelar colecciones;
5. no codificar tipo SQL en el nombre mediante `_uuid`, `_json`, `_jsonb`, `_text`, `_int`, `_bool` o equivalentes;
6. no usar palabras reservadas que obliguen a citar el identificador;
7. no mezclar idioma, abreviatura local y nombre completo para el mismo concepto;
8. una columna derivada declarará semántica de derivación y no aparentará ser la fuente autoritativa;
9. un alias legacy no podrá recibir nuevas escrituras salvo contrato de compatibilidad explícito;
10. nombres iguales en tablas distintas deberán conservar el mismo significado cuando representen el mismo concepto transversal.

#### 14. Identidad y referencias

| Caso                               | Convención nominal                          |
| ---------------------------------- | ------------------------------------------- |
| identidad primaria local           | `id`                                        |
| referencia a entidad               | `<entity_singular>_id`                      |
| referencia a principal             | `principal_id`                              |
| referencia a actor efectivo        | `actor_id` o un nombre de acción calificado |
| referencia a trabajador            | `employee_id`                               |
| referencia a cliente               | `customer_id`                               |
| referencia a dispositivo           | `device_id`                                 |
| referencia a servicio nominal      | `service_principal_id`                      |
| identificador de proveedor externo | `<provider>_<entity>_id`                    |

Reglas:

1. `_id` expresa identidad o referencia, no cualquier código;
2. `_uuid` queda prohibido como sufijo nominal nuevo: el tipo físico corresponde a `SUPA-ARC-012`;
3. `entity_id`, `object_id`, `record_id`, `ref_id` o `target_id` no se usarán sin un discriminador tipado y un contrato polimórfico aprobado;
4. una referencia interdominio nombrará la entidad referenciada y no la aplicación consumidora;
5. una columna de actor iniciada por una acción usará una forma inequívoca como `<action>_by_actor_id` cuando sea necesario distinguirla de la entidad afectada;
6. `created_by` permanece como nombre legacy ambiguo donde exista y requerirá clasificación; no se convertirá automáticamente en usuario, empleado o actor.

#### 15. Códigos, claves, números y nombres humanos

| Sufijo    | Significado                                                       |
| --------- | ----------------------------------------------------------------- |
| `_code`   | código empresarial legible y estable dentro de un ámbito definido |
| `_key`    | clave de máquina estable usada por contratos o catálogos          |
| `_number` | número documental o secuencial visible para operación             |
| `_name`   | nombre humano principal de la entidad                             |
| `_label`  | texto de presentación; no identidad ni autoridad                  |
| `_slug`   | token legible para URL o navegación pública                       |

`id`, `code`, `key`, `number`, `name`, `label` y `slug` no serán intercambiables. La unicidad, tipo, generación y constraint de cada uno se decidirán en `SUPA-ARC-012` y en el contrato del dominio.

#### 16. Booleanos

Todo booleano nuevo deberá leerse como una proposición inequívoca. Prefijos permitidos:

```text
is_
has_
can_
requires_
allows_
should_
```

Reglas:

1. evitar nombres negativos como `is_not_active`, `not_deleted` o dobles negaciones;
2. evitar `flag`, `enabled_flag`, `value` o el uso de `NULL` como tercer estado implícito;
3. no representar un estado multivalor mediante varios booleanos competidores;
4. un booleano derivado o cacheado deberá declarar su fuente y política de invalidación;
5. las reglas exactas de estados y nulabilidad se completarán en `SUPA-ARC-012`.

#### 17. Tipos, categorías, estados y razones

1. una columna genérica `type`, `category`, `status`, `state` o `reason` solo será válida cuando exista un único concepto primario inequívoco en la relación;
2. cuando coexistan varios conceptos, se usará `<concept>_type`, `<concept>_category`, `<concept>_status`, `<concept>_state` o `<concept>_reason_code`;
3. `_reason_code` representará un vocabulario de máquina; el mensaje humano permanecerá separado;
4. no se duplicarán `status` y `state` sin una diferencia contractual explícita;
5. esta tarea define la forma nominal; vocabularios, transiciones, estado inicial, terminalidad y timestamps de cambio corresponden a `SUPA-ARC-012`.

#### 18. Tiempo y duración

Convenciones nominales:

| Sufijo                                    | Tipo conceptual                                |
| ----------------------------------------- | ---------------------------------------------- |
| `_at`                                     | instante temporal                              |
| `_date`                                   | fecha civil                                    |
| `_time`                                   | hora local sin fecha                           |
| `_timezone`                               | zona horaria identificable                     |
| `_from` y `_until`                        | límites semánticos de una vigencia o intervalo |
| `_seconds`, `_minutes`, `_hours`, `_days` | duración expresada en una unidad explícita     |

No se usarán `timestamp`, `datetime`, `time_value`, `start`, `end` o `duration` sin calificador suficiente. Tipos SQL, precisión, zona, defaults, columnas obligatorias y reglas de actualización se reservan a `SUPA-ARC-012`.

#### 19. Cantidades, unidades, dinero y medidas

1. usar `quantity`, no `qty`, en nombres nuevos;
2. una cantidad declarará su significado y unidad mediante el nombre o una referencia `uom_profile_id` aprobada;
3. `amount` se calificará por concepto: subtotal, impuesto, descuento, pago, saldo u otro hecho económico definido;
4. toda moneda se asociará a `currency_code` o al contrato monetario del dominio;
5. un porcentaje usará `_percentage`, una tasa `_rate` y un conteo `_count`;
6. medidas físicas usarán una unidad explícita o un perfil de unidad; no se aceptará `value` con unidad en metadata informal;
7. `qty_base`, `qty` y `unit_code` actuales permanecen como compatibilidad identificada por `SUPA-AUD-018`; no autorizan nuevas columnas con esos tokens.

#### 20. JSON, payloads y metadata

Los tokens `payload`, `metadata` y `snapshot` solo se permitirán cuando:

1. exista schema o contrato de contenido versionado;
2. el owner y la finalidad sean explícitos;
3. se defina sensibilidad, retención y compatibilidad;
4. no sustituyan columnas necesarias para integridad, autorización, búsqueda o constraints;
5. no contengan secretos ni credenciales reutilizables;
6. `payload` corresponda a evento, comando, outbox, inbox o integración identificable;
7. `metadata` sea complementaria y no autoridad empresarial;
8. `snapshot` sea una captura inmutable con origen y momento definidos.

`json`, `jsonb`, `blob`, `data`, `extra` e `info` no serán nombres canónicos por sí solos.

#### 21. Registro de abreviaturas

Abreviaturas permitidas cuando su concepto sea realmente el indicado:

```text
api
id
ip
url
uri
sku
gtin
uom
lpn
loc
pos
mfa
aal
jwt
otp
rpc
http
https
org
```

Reglas:

1. el registro es cerrado; una nueva abreviatura requiere aprobación y definición;
2. los tokens se usan en minúscula y no se pluralizan de forma arbitraria;
3. `id` solo representa identidad o referencia;
4. `loc` y `lpn` conservan su significado logístico aprobado;
5. `org` se conserva por el nombre aprobado `org_governance`; no autoriza abreviar cualquier uso de `organization`;
6. quedan prohibidos para nombres nuevos `qty`, `usr`, `emp`, `prod`, `inv`, `cat`, `cfg`, `desc`, `num`, `addr`, `msg`, `aux`, `misc`, `tmp` y abreviaturas locales no registradas.

#### 22. Registro canónico de decisiones nominales

Toda creación o cambio futuro deberá poder registrarse con:

```text
naming_entry_id
+ object_kind
+ qualified_name
+ owner_schema_id
+ semantic_concept
+ canonical_tokens
+ abbreviations_used
+ lifecycle_status
+ legacy_aliases
+ predecessor_qualified_name
+ consumer_ids
+ compatibility_contract
+ transition_task_ids
+ test_requirement_ids
```

No se aceptará un nombre sin concepto, owner, consumidores potenciales, lifecycle o evaluación de colisión. El registro nominal no sustituye el catálogo PostgreSQL ni el registro de contratos expuestos.

#### 23. Cambios de nombre y compatibilidad

Todo cambio nominal será tratado como cambio de contrato cuando exista cualquier consumidor SQL, Data API, tipo generado, RPC, vista, trigger, policy, Edge Function, aplicación, reporte, integración o operación manual que use el nombre anterior.

Secuencia obligatoria:

```text
INVENTARIAR NOMBRE Y CONSUMIDORES
→ DEFINIR NOMBRE SUCESOR Y OWNER
→ PROBAR COLISIONES Y SEMÁNTICA
→ DEFINIR COMPATIBILIDAD DE LECTURA Y ESCRITURA
→ ADAPTAR CONSUMIDORES POR OLEADAS
→ MEDIR USO DEL NOMBRE ANTERIOR
→ RETIRAR ALIAS SOLO CON CERO CONSUMIDORES Y ROLLBACK
```

Reglas:

1. no ejecutar renombre masivo por consistencia estética;
2. no mantener dual write sin precedencia, idempotencia y conciliación;
3. un alias de columna no podrá divergir silenciosamente de su fuente;
4. un nombre nuevo no podrá reutilizar la identidad de un objeto retirado con otra semántica;
5. toda transición conservará historia, datos, grants, policies, dependencias y rollback;
6. `SUPA-TRANS-001` a `SUPA-TRANS-015` decidirán y ejecutarán el tratamiento objeto por objeto.

#### 24. Clasificación de la línea base vigente

| Evidencia AS-IS                                                    | Clasificación nominal                   | Consecuencia                                        |
| ------------------------------------------------------------------ | --------------------------------------- | --------------------------------------------------- |
| 26 owner schemas aprobados                                         | `CANONICAL_TARGET_NAME`                 | se preservan exactamente                            |
| `api`, `app_private`, `audit`                                      | `CANONICAL_TRANSVERSAL_NAME`            | se preservan exactamente                            |
| 14 schemas administrados                                           | `RESERVED_MANAGED_NAME`                 | Vento no los renombra ni reutiliza                  |
| `public`                                                           | `TRANSITIONAL_COMPATIBILITY_NAME`       | no recibe nueva autoridad                           |
| schemas actuales `club`, `pass`, `pos`, `talento`, `viso`, `vital` | `CURRENT_PHYSICAL_NAME`                 | no se declaran destino objetivo por existir         |
| `product_categories_backup_20260316_preparaciones`                 | `BACKUP_NAMING_VIOLATION_AS_IS`         | exige reconciliación antes de disposición           |
| `staging_insumos_import`                                           | `STAGING_AND_LANGUAGE_VIOLATION_AS_IS`  | exige lifecycle y transición controlada             |
| `qty_base`, `qty`, `unit_code`, `created_by`                       | `LEGACY_OR_AMBIGUOUS_COLUMN_NAME_AS_IS` | requiere mapeo semántico, no sustitución automática |
| superficies `v1` activas                                           | `ACTIVE_VERSIONED_CONTRACT`             | no se clasifican como legacy por el sufijo          |

Esta clasificación no renombra, acepta, retira ni corrige físicamente ningún objeto actual.

#### 25. Linter y controles recurrentes

El control automático deberá:

1. leer catálogos remotos, migraciones, contratos y tipos generados;
2. validar forma léxica, bytes, ASCII, minúsculas y guiones bajos;
3. comprobar los 29 nombres objetivo y los 14 nombres administrados reservados;
4. detectar nombres de aplicación, ambiente, fecha, backup, staging y tipo físico;
5. validar vocabulario, abreviaturas, sufijos semánticos y palabras reservadas;
6. detectar nombres que colisionen después de normalización o truncamiento;
7. detectar dos tokens distintos usados para el mismo concepto sin decisión;
8. detectar un token reutilizado con semánticas incompatibles;
9. distinguir deuda histórica registrada de una nueva infracción;
10. bloquear nuevas infracciones y exigir tarea propietaria para las históricas;
11. comparar remoto, migraciones y contratos para detectar drift nominal;
12. producir evidencia ordenada sin exponer datos ni secretos.

No se declarará conforme un objeto únicamente porque PostgreSQL acepte su identificador.

#### 26. Orden obligatorio de materialización futura

```text
1. CONGELAR EL ESTÁNDAR Y EL GLOSARIO
2. INVENTARIAR NOMBRES REMOTOS, MIGRACIONES Y CONSUMIDORES
3. CLASIFICAR CANÓNICO, COMPATIBLE, LEGACY, AMBIGUO O RESERVADO
4. DEFINIR NOMBRES SUCESORES SIN COLISIONES
5. COMPLETAR CLAVES, CONSTRAINTS, ESTADOS Y TIMESTAMPS
6. COMPLETAR FUNCIONES, RPC, TRIGGERS, SEGURIDAD Y CONTRATOS
7. GENERAR MAPAS DE COMPATIBILIDAD Y TIPOS
8. EJECUTAR TRANSICIÓN POR OLEADAS CON TELEMETRÍA
9. RETIRAR ALIASES SOLO DESPUÉS DE CERO CONSUMIDORES
10. VALIDAR DRIFT, PARIDAD AMBIENTAL Y ROLLBACK
```

Este orden no autoriza cambios físicos.

#### 27. Riesgos restringidos y carryover

| Riesgo o hallazgo                          | Efecto de esta tarea                                            | Resolución restante                |
| ------------------------------------------ | --------------------------------------------------------------- | ---------------------------------- |
| schemas nombrados por aplicación           | los prohíbe en el objetivo y conserva el registro de 29 nombres | inventario y transición por objeto |
| `public` como namespace universal          | impide nuevos nombres autoritativos allí                        | `SUPA-TRANS-*`                     |
| abreviaturas como `qty`                    | las bloquea para nombres nuevos                                 | mapeo y compatibilidad de columnas |
| backup y staging fechados en `public`      | los clasifica como deuda, no como fuente                        | `SUPA-TRANS-001`; `003`; `006`     |
| `created_by` ambiguo                       | exige actor o principal explícito                               | `SUPA-ARC-012`; transición         |
| nombres versionados confundidos con legacy | reserva `_v<major>` para contratos `api`                        | `SUPA-ARC-013`; `023`              |
| renombre masivo                            | exige consumidores, compatibilidad, telemetría y rollback       | `SUPA-TRANS-005` a `012`           |
| nombres truncados o citados                | los prohíbe para objetos nuevos                                 | linter y `SUPA-ARC-025`            |
| drift remoto-migraciones                   | exige comparación recurrente                                    | `SUPA-ARC-025`; `SUPA-TRANS-015`   |

Ningún riesgo queda cerrado físicamente por esta definición.

#### 28. Decisiones reservadas

| Decisión                                                        | Tarea propietaria                   |
| --------------------------------------------------------------- | ----------------------------------- |
| tipos de identificador y generación de claves                   | `SUPA-ARC-012`                      |
| nombres de PK, FK, UNIQUE, CHECK, EXCLUDE, índices y secuencias | `SUPA-ARC-012`                      |
| vocabularios de estado, transiciones y timestamps obligatorios  | `SUPA-ARC-012`                      |
| nombres y firmas de funciones, RPC, parámetros y triggers       | `SUPA-ARC-013`                      |
| funciones privilegiadas y `search_path`                         | `SUPA-ARC-014`                      |
| exposición, grants, roles y RLS                                 | `SUPA-ARC-015`                      |
| contratos de lectura y mutación por dominio                     | `SUPA-ARC-016`                      |
| escrituras interdominio                                         | `SUPA-ARC-017`                      |
| nombres y rutas de Storage                                      | `SUPA-ARC-018`                      |
| canales Realtime y eventos                                      | `SUPA-ARC-019`                      |
| Edge Functions, webhooks y cron                                 | `SUPA-ARC-020`                      |
| generación de tipos para consumidores                           | `SUPA-ARC-023`                      |
| valores por ambiente y paridad                                  | `SUPA-ARC-024`                      |
| ADR y linter recurrente consolidado                             | `SUPA-ARC-025`                      |
| inventario, renombre, compatibilidad, cutover y retiro físico   | `SUPA-TRANS-001` a `SUPA-TRANS-015` |

#### 29. Límites de autorización

Esta tarea no autoriza:

- crear, renombrar, mover, copiar o retirar schemas, tablas, vistas, vistas materializadas o columnas;
- crear aliases, fachadas, tablas temporales o nombres sucesores físicos;
- modificar tipos, defaults, nullability, PK, FK, constraints, índices, secuencias, enums o timestamps;
- cambiar nombres de funciones, RPC, triggers, policies, buckets, Edge Functions o cron jobs;
- modificar Data API, `api.schemas`, `extra_search_path`, grants, ACL, RLS o owners;
- editar datos, ejecutar backfills o reconciliar backups y staging;
- modificar aplicaciones, tipos TypeScript, consultas, reportes, integraciones o documentación de consumidores;
- ejecutar DDL, DML, migraciones, pruebas mutantes, cutover o despliegues;
- declarar conforme o retirar un objeto actual por su nombre;
- iniciar `SUPA-ARC-012` antes de aprobación expresa.

#### 30. Requisitos de prueba generados

**Resultado:** GENERA REQUISITOS DE PRUEBA

Se incorporan al Registro Canónico de Requisitos de Prueba:

```text
TREQ-SUPABASE-879 a TREQ-SUPABASE-918
```

Los cuarenta requisitos protegen forma léxica, schemas canónicos y reservados, lenguaje, vocabulario, relaciones tabulares, columnas, referencias, booleanos, medidas, JSON, abreviaturas, compatibilidad, transición, linter y drift. El detalle completo existe únicamente en `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`.

#### 31. Criterios de aceptación

- [ ] Existe un único estándar versionado para schemas, relaciones tabulares y columnas.
- [ ] Todo identificador nuevo usa ASCII `lower_snake_case`, no requiere comillas y ocupa como máximo 63 bytes.
- [ ] Los 26 owner schemas conservan exactamente sus nombres aprobados.
- [ ] `api`, `app_private` y `audit` son las únicas capas transversales Vento ya nombradas.
- [ ] Los 14 schemas administrados permanecen reservados y `public` continúa transitorio.
- [ ] Ningún schema objetivo se nombra por aplicación, equipo, ambiente, fecha o versión.
- [ ] Las relaciones usan conceptos empresariales y no prefijos de aplicación o tipo físico.
- [ ] Backups, staging y temporales no se convierten en fuentes canónicas por nombre.
- [ ] `_v<major>` se limita a contratos expuestos de `api`.
- [ ] Las columnas diferencian identidad, referencia, código, clave, número, nombre, label y slug.
- [ ] Booleanos, tipos, estados, tiempo, cantidades, dinero y medidas tienen formas inequívocas.
- [ ] `qty`, `_uuid`, `data`, `value`, `created_by` y abreviaturas no registradas no se propagan a nombres nuevos.
- [ ] JSON, payloads, metadata y snapshots requieren contrato, owner, versión y sensibilidad.
- [ ] Un cambio nominal exige consumidores, compatibilidad, telemetría, paridad y rollback.
- [ ] La línea base AS-IS se clasifica sin renombres ni retiros automáticos.
- [ ] El linter distingue deuda histórica de nuevas infracciones y bloquea estas últimas.
- [ ] Se generan `TREQ-SUPABASE-879` a `TREQ-SUPABASE-918`.
- [ ] No se ejecutan cambios físicos, código ni implementación.
- [ ] `SUPA-ARC-012` permanece reservada.

#### 32. Controles estructurales requeridos

| Control                                            | Resultado esperado |
| -------------------------------------------------- | -----------------: |
| idioma físico canónico                             |          `ENGLISH` |
| forma física canónica                              | `lower_snake_case` |
| charset físico canónico                            |            `ASCII` |
| límite duro PostgreSQL                             |       **63 bytes** |
| owner schemas nombrados                            |       **26 de 26** |
| capas transversales Vento nombradas                |         **3 de 3** |
| nombres objetivo Vento                             |             **29** |
| schemas administrados reservados                   |             **14** |
| schemas `public` transitorios                      |              **1** |
| abreviaturas permitidas                            |             **19** |
| nombres de aplicación permitidos como owner schema |              **0** |
| versionado nominal general fuera de `api`          |              **0** |
| cambios físicos                                    |              **0** |
| requisitos nuevos                                  |             **40** |

#### 33. Continuidad inmediata

```text
ÚLTIMA TAREA APROBADA
SUPA-ARC-010 — Definir ciclo de sesión, revocación y desactivación
        ↓
TAREA ACTUAL APROBADA
SUPA-ARC-011 — Definir convenciones de nombres para esquemas, tablas y columnas
        ↓
SIGUIENTE TAREA RESERVADA
SUPA-ARC-012 — Definir convenciones de claves, constraints, estados y timestamps
```

`SUPA-ARC-012` permanece reservada y no se inicia hasta una solicitud expresa de continuidad.


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
