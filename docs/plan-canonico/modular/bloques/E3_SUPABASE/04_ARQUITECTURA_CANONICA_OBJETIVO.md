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
