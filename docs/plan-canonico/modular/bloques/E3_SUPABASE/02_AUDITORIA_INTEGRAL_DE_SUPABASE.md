### AUDITORÍA INTEGRAL DE SUPABASE

### ✅ SUPA-AUD-001 — Inventariar todos los esquemas existentes

**Estado:** APROBADA
**Fecha de preparación documental:** 2026-07-29
**Bloque propietario:** BLOQUE E3 — Arquitectura canónica de datos y gobierno integral de Supabase
**Marcador exacto que reemplaza:** `### [ ] SUPA-AUD-001 — Inventariar todos los esquemas existentes`
**Tarea anterior:** `INT-APP-010 — Evitar escrituras cruzadas sin contrato` — APROBADA
**Siguiente tarea:** `SUPA-AUD-002 — Clasificar esquemas administrados por Supabase y esquemas de Vento`
**Línea base remota obligatoria:** `devVentoGroup/vento-shell@b1072ad4716022fadbb587cccfd73956c3a9e7eb`
**Proyecto Supabase observado:** `vento-os-dev` — `clzdpinthhtknkmefsxx`
**Tipo de tarea:** auditoría documental y consulta remota read-only de namespaces PostgreSQL; sin DDL, DML, migraciones, cambios de configuración, exposición, RLS, Auth, Storage, Realtime, Edge Functions, cron, código, piloto ni despliegue

#### 1. Objetivo

Crear una línea base reproducible y no mutante de todos los namespaces PostgreSQL observables en el proyecto Supabase `vento-os-dev`, diferenciando los esquemas no efímeros que deberán gobernarse durante E3 de los namespaces temporales de sesión que solo se contabilizan.

```text
PROYECTO REMOTO ACTIVO
        ↓
CATÁLOGOS POSTGRESQL DE SOLO LECTURA
        ↓
TODOS LOS NAMESPACES OBSERVADOS
        ↓
23 ESQUEMAS NO EFÍMEROS INVENTARIADOS
+ 120 NAMESPACES TEMPORALES CONTABILIZADOS
        ↓
BASE PARA CLASIFICACIÓN EN SUPA-AUD-002
```

Esta tarea inventaría existencia, propietario PostgreSQL, clase de ciclo observada, huella de objetos, comentario y señales de ACL. No decide todavía si un esquema es administrado por Supabase, empresarial de Vento, expuesto mediante Data API, legacy, correcto, incorrecto, conservable o candidato a transición.

#### 2. Inicio formal de BLOQUE E3 y continuidad

La secuencia `INT-APP-001` a `INT-APP-010` está cerrada y `SUPA-AUD-001` inicia la auditoría integral de Supabase prevista en el orden canónico.

```text
ÚLTIMA TAREA APROBADA
INT-APP-010 — Evitar escrituras cruzadas sin contrato
        ↓
TAREA ACTUAL EN REVISIÓN
SUPA-AUD-001 — Inventariar todos los esquemas existentes
        ↓
SIGUIENTE TAREA RESERVADA
SUPA-AUD-002 — Clasificar esquemas administrados por Supabase y esquemas de Vento
```

Para que los validadores deriven esta continuidad se entrega también el reemplazo completo de `active-sequence.json` con `SUPA-AUD-001` a `SUPA-AUD-024` como secuencia activa. Los archivos `E3_SUPABASE/00_INTRO.md` y `E3_SUPABASE/01_PRINCIPIOS_OBLIGATORIOS.md` fueron revisados y no requieren modificación.

#### 3. Fuentes de verdad congeladas

| Fuente                                             | Revisión, blob o corte                                                                        | Responsabilidad                                                       |
| -------------------------------------------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------- |
| `devVentoGroup/vento-shell`                        | `b1072ad4716022fadbb587cccfd73956c3a9e7eb`                                                    | remoto vigente con BLOQUE X cerrado y 04A hasta `INT-APP-010`         |
| `E3_SUPABASE/00_INTRO.md`                          | `2ce04b7045fafd10652c9f88350bbe89bc317860`                                                    | alcance y límites de E3                                               |
| `E3_SUPABASE/01_PRINCIPIOS_OBLIGATORIOS.md`        | `36bb9a4c19f6d8e7edbaa03687219fb642c9c526`                                                    | principios de plataforma, esquema, dominio, identidad y autorización  |
| `E3_SUPABASE/02_AUDITORIA_INTEGRAL_DE_SUPABASE.md` | `5ca352374b09ee8016f66eac869a3dbda6551f9a`                                                    | marcador y secuencia `SUPA-AUD-001` a `SUPA-AUD-024`                  |
| `active-sequence.json` remoto anterior             | `59c9c7d37d2bfd82fc7599174f5778cb8bc2e5e7`                                                    | secuencia X ya completa que debe sustituirse para activar E3          |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` | `e98bc163f28c325d9734d4ba2cdebae60379f675`                                                    | 4.308 requisitos canónicos hasta `INT-APP-010`                        |
| Supabase `vento-os-dev`                            | proyecto `clzdpinthhtknkmefsxx`; PostgreSQL `17.6`; observación `2026-07-29T17:36:37.527043Z` | estado remoto realmente consultado mediante SQL de catálogo read-only |

#### 4. Artefacto producido

```text
SUPABASE-SCHEMA-INVENTORY-001@1.0.0
```

| Propiedad                         | Valor                           | Regla                                                   |
| --------------------------------- | ------------------------------- | ------------------------------------------------------- |
| `inventory_id`                    | `SUPABASE-SCHEMA-INVENTORY-001` | identidad estable del inventario de schemas             |
| `inventory_version`               | `1.0.0`                         | primer corte remoto de E3                               |
| `inventory_status`                | `OBSERVED_REMOTE_BASELINE`      | evidencia ejecutada; no significa arquitectura aprobada |
| `project_name`                    | `vento-os-dev`                  | proyecto auditado                                       |
| `project_ref`                     | `clzdpinthhtknkmefsxx`          | identidad técnica del proyecto                          |
| `database_name`                   | `postgres`                      | base consultada                                         |
| `postgres_version`                | `17.6`                          | versión devuelta por el servidor                        |
| `query_role`                      | `postgres`                      | rol técnico de la consulta de catálogo                  |
| `observation_mode`                | `READ_ONLY_CATALOG_QUERY`       | ninguna sentencia DDL o DML                             |
| `namespace_rows_total`            | **143**                         | total observado en `pg_namespace`                       |
| `non_ephemeral_schemas`           | **23**                          | filas permanentes del inventario canónico               |
| `temporary_namespace_rows`        | **120**                         | 60 `pg_temp_*` y 60 `pg_toast_temp_*`                   |
| `managed_vs_vento_classification` | `DEFERRED_TO_SUPA-AUD-002`      | esta tarea no anticipa la clasificación siguiente       |

#### 5. Método de auditoría no mutante

Se ejecutaron únicamente consultas `SELECT` sobre catálogos PostgreSQL y funciones de inspección:

- `pg_namespace` para nombres, propietarios, ACL y comentarios;
- `pg_class` para huella de relaciones;
- `pg_proc` para rutinas;
- `pg_type` para enums y dominios;
- `pg_extension` para ubicación de extensiones;
- `pg_collation` para el resumen del catálogo interno;
- `has_schema_privilege` para señales de `USAGE`, sin auditar todavía grants completos.

No se ejecutaron `CREATE`, `ALTER`, `DROP`, `GRANT`, `REVOKE`, `INSERT`, `UPDATE`, `DELETE`, migraciones, funciones, RPC, cambios de Auth, Storage, Realtime, Edge Functions ni configuración del proyecto.

#### 6. Alcance exacto y exclusiones

Incluye:

1. todo namespace retornado por `pg_namespace`;
2. una fila canónica por cada esquema no efímero;
3. conteo agregado de namespaces temporales;
4. propietario PostgreSQL, comentario, ACL explícita y señales de `USAGE`;
5. huella agregada de tablas, particiones, vistas, secuencias, rutinas, tipos y extensiones.

Excluye deliberadamente:

- clasificar esquemas administrados por Supabase o empresariales de Vento (`SUPA-AUD-002`);
- decidir exposición mediante Data API (`SUPA-AUD-003`);
- inventariar objetos individualmente (`SUPA-AUD-004` a `SUPA-AUD-008`);
- auditar RLS, grants y privilegios completos (`SUPA-AUD-009`);
- decidir arquitectura objetivo, movimientos o retiros (`SUPA-ARC-*` y `SUPA-TRANS-*`).

#### 7. Corte técnico observado

| Campo                       | Resultado                     |
| --------------------------- | ----------------------------- |
| proyecto                    | `vento-os-dev`                |
| referencia                  | `clzdpinthhtknkmefsxx`        |
| región                      | `us-east-2`                   |
| estado de proyecto          | `ACTIVE_HEALTHY`              |
| base                        | `postgres`                    |
| servidor                    | PostgreSQL `17.6`             |
| versión numérica            | `170006`                      |
| rol de consulta             | `postgres`                    |
| `search_path` observado     | `"$user", public, extensions` |
| momento UTC                 | `2026-07-29T17:36:37.527043Z` |
| momento local de referencia | `2026-07-29 12:36:37 -05:00`  |

#### 8. Contrato de cada fila del inventario

Cada esquema no efímero conserva:

```text
schema_name
+ owner_name
+ lifecycle_class
+ schema_comment
+ explicit_acl_present
+ acl_item_count
+ anon_usage_observed
+ authenticated_usage_observed
+ service_role_usage_observed
+ ordinary_table_count
+ partitioned_table_count
+ view_count
+ materialized_view_count
+ sequence_count
+ foreign_table_count
+ routine_count
+ function_count
+ procedure_count
+ aggregate_count
+ enum_type_count
+ domain_type_count
+ installed_extension_names
+ observation_timestamp
+ classification_status
```

`classification_status` permanece `PENDIENTE_SUPA-AUD-002` para todas las filas. Propietario PostgreSQL, ACL o nombre del esquema no bastan para inferir su clasificación empresarial.

#### 9. Resumen del inventario

| Métrica                                     | Resultado |
| ------------------------------------------- | --------: |
| namespaces totales en `pg_namespace`        |   **143** |
| esquemas no efímeros inventariados          |    **23** |
| namespaces `pg_temp_*` contabilizados       |    **60** |
| namespaces `pg_toast_temp_*` contabilizados |    **60** |
| clases `PERSISTENT`                         |    **19** |
| clases `POSTGRES_INTERNAL`                  |     **3** |
| clases `SQL_STANDARD_SYSTEM`                |     **1** |
| propietarios distintos                      |     **4** |
| schemas con ACL explícita                   |    **20** |
| schemas con comentario                      |     **6** |
| schemas sin comentario                      |    **17** |
| instancias de extensión ubicadas            |     **8** |

#### 10. Inventario canónico de identidad, propietario y acceso observado

| Esquema               | Propietario PostgreSQL | Ciclo observado       | ACL explícita | `anon` USAGE | `authenticated` USAGE | `service_role` USAGE | Comentario actual                                                              | Clasificación administrado/Vento |
| --------------------- | ---------------------- | --------------------- | ------------: | -----------: | --------------------: | -------------------: | ------------------------------------------------------------------------------ | -------------------------------- |
| `app_private`         | `postgres`             | `PERSISTENT`          |    **sí** (1) |           no |                    no |                   no | —                                                                              | `PENDIENTE_SUPA-AUD-002`         |
| `auth`                | `supabase_admin`       | `PERSISTENT`          |    **sí** (7) |       **sí** |                **sí** |               **sí** | —                                                                              | `PENDIENTE_SUPA-AUD-002`         |
| `club`                | `postgres`             | `PERSISTENT`          |    **sí** (3) |           no |                **sí** |               **sí** | —                                                                              | `PENDIENTE_SUPA-AUD-002`         |
| `cron`                | `supabase_admin`       | `PERSISTENT`          |    **sí** (2) |           no |                    no |                   no | —                                                                              | `PENDIENTE_SUPA-AUD-002`         |
| `extensions`          | `postgres`             | `PERSISTENT`          |    **sí** (5) |       **sí** |                **sí** |               **sí** | —                                                                              | `PENDIENTE_SUPA-AUD-002`         |
| `graphql`             | `supabase_admin`       | `PERSISTENT`          |    **sí** (5) |       **sí** |                **sí** |               **sí** | —                                                                              | `PENDIENTE_SUPA-AUD-002`         |
| `graphql_public`      | `supabase_admin`       | `PERSISTENT`          |    **sí** (5) |       **sí** |                **sí** |               **sí** | —                                                                              | `PENDIENTE_SUPA-AUD-002`         |
| `information_schema`  | `supabase_admin`       | `SQL_STANDARD_SYSTEM` |    **sí** (2) |       **sí** |                **sí** |               **sí** | —                                                                              | `PENDIENTE_SUPA-AUD-002`         |
| `net`                 | `supabase_admin`       | `PERSISTENT`          |    **sí** (7) |       **sí** |                **sí** |               **sí** | —                                                                              | `PENDIENTE_SUPA-AUD-002`         |
| `pass`                | `postgres`             | `PERSISTENT`          |    **sí** (4) |       **sí** |                **sí** |               **sí** | Dominio Vento Pass: loyalty, rewards, satellites y helpers de fidelizacion.    | `PENDIENTE_SUPA-AUD-002`         |
| `payments`            | `postgres`             | `PERSISTENT`          |    **sí** (3) |           no |                **sí** |               **sí** | —                                                                              | `PENDIENTE_SUPA-AUD-002`         |
| `pg_catalog`          | `supabase_admin`       | `POSTGRES_INTERNAL`   |    **sí** (2) |       **sí** |                **sí** |               **sí** | system catalog schema                                                          | `PENDIENTE_SUPA-AUD-002`         |
| `pg_toast`            | `supabase_admin`       | `POSTGRES_INTERNAL`   |        no (0) |           no |                    no |                   no | reserved schema for TOAST tables                                               | `PENDIENTE_SUPA-AUD-002`         |
| `pgbouncer`           | `pgbouncer`            | `POSTGRES_INTERNAL`   |        no (0) |           no |                    no |                   no | —                                                                              | `PENDIENTE_SUPA-AUD-002`         |
| `pos`                 | `postgres`             | `PERSISTENT`          |    **sí** (4) |       **sí** |                **sí** |               **sí** | Dominio POS: sesiones, mesas, cajas, pagos y modificadores de venta en sitio.  | `PENDIENTE_SUPA-AUD-002`         |
| `public`              | `pg_database_owner`    | `PERSISTENT`          |    **sí** (6) |       **sí** |                **sí** |               **sí** | standard public schema                                                         | `PENDIENTE_SUPA-AUD-002`         |
| `realtime`            | `supabase_admin`       | `PERSISTENT`          |    **sí** (6) |       **sí** |                **sí** |               **sí** | —                                                                              | `PENDIENTE_SUPA-AUD-002`         |
| `storage`             | `supabase_admin`       | `PERSISTENT`          |    **sí** (7) |       **sí** |                **sí** |               **sí** | —                                                                              | `PENDIENTE_SUPA-AUD-002`         |
| `supabase_migrations` | `postgres`             | `PERSISTENT`          |        no (0) |           no |                    no |                   no | —                                                                              | `PENDIENTE_SUPA-AUD-002`         |
| `talento`             | `postgres`             | `PERSISTENT`          |    **sí** (4) |       **sí** |                **sí** |               **sí** | —                                                                              | `PENDIENTE_SUPA-AUD-002`         |
| `vault`               | `supabase_admin`       | `PERSISTENT`          |    **sí** (3) |           no |                    no |               **sí** | —                                                                              | `PENDIENTE_SUPA-AUD-002`         |
| `viso`                | `postgres`             | `PERSISTENT`          |    **sí** (2) |           no |                    no |               **sí** | Esquema de planeacion web, demanda, reglas y generacion inteligente para VISO. | `PENDIENTE_SUPA-AUD-002`         |
| `vital`               | `postgres`             | `PERSISTENT`          |    **sí** (3) |           no |                **sí** |               **sí** | —                                                                              | `PENDIENTE_SUPA-AUD-002`         |

Las columnas de `USAGE` son señales puntuales del privilegio de esquema observado. No demuestran por sí solas acceso a tablas, exposición por PostgREST, GraphQL, RLS correcta ni autorización empresarial; esas conclusiones quedan reservadas a `SUPA-AUD-003` y `SUPA-AUD-009`.

#### 11. Huella agregada de objetos por esquema

| Esquema               | Tablas | Particionadas | Vistas | Mat. | Secuencias | Externas | Rutinas | Funciones | Proced. | Agregados | Enums | Dominios | Extensiones instaladas en el esquema            |
| --------------------- | -----: | ------------: | -----: | ---: | ---------: | -------: | ------: | --------: | ------: | --------: | ----: | -------: | ----------------------------------------------- |
| `app_private`         |      1 |             0 |      0 |    0 |          0 |        0 |       1 |         1 |       0 |         0 |     0 |        0 | —                                               |
| `auth`                |     23 |             0 |      0 |    0 |          1 |        0 |       4 |         4 |       0 |         0 |     9 |        0 | —                                               |
| `club`                |     11 |             0 |      0 |    0 |          0 |        0 |       7 |         7 |       0 |         0 |     0 |        0 | —                                               |
| `cron`                |      2 |             0 |      0 |    0 |          2 |        0 |       7 |         7 |       0 |         0 |     0 |        0 | —                                               |
| `extensions`          |      0 |             0 |      2 |    0 |          0 |        0 |      55 |        55 |       0 |         0 |     0 |        0 | pg_net, pg_stat_statements, pgcrypto, uuid-ossp |
| `graphql`             |      0 |             0 |      0 |    0 |          0 |        0 |       0 |         0 |       0 |         0 |     0 |        0 | —                                               |
| `graphql_public`      |      0 |             0 |      0 |    0 |          0 |        0 |       1 |         1 |       0 |         0 |     0 |        0 | —                                               |
| `information_schema`  |      4 |             0 |     65 |    0 |          0 |        0 |      11 |        11 |       0 |         0 |     0 |        5 | —                                               |
| `net`                 |      2 |             0 |      0 |    0 |          1 |        0 |      12 |        12 |       0 |         0 |     1 |        1 | —                                               |
| `pass`                |     26 |             0 |      1 |    0 |          0 |        0 |      30 |        30 |       0 |         0 |     0 |        0 | —                                               |
| `payments`            |      2 |             0 |      0 |    0 |          0 |        0 |       0 |         0 |       0 |         0 |     0 |        0 | —                                               |
| `pg_catalog`          |     64 |             0 |     78 |    0 |          0 |        0 |    3319 |      3147 |       0 |       157 |     0 |        0 | pg_cron, plpgsql                                |
| `pg_toast`            |      0 |             0 |      0 |    0 |          0 |        0 |       0 |         0 |       0 |         0 |     0 |        0 | —                                               |
| `pgbouncer`           |      0 |             0 |      0 |    0 |          0 |        0 |       1 |         1 |       0 |         0 |     0 |        0 | —                                               |
| `pos`                 |     13 |             0 |      0 |    0 |          0 |        0 |       0 |         0 |       0 |         0 |     0 |        0 | —                                               |
| `public`              |    185 |             0 |     61 |    0 |          2 |        0 |     246 |       246 |       0 |         0 |     7 |        0 | unaccent                                        |
| `realtime`            |      9 |             1 |      0 |    0 |          1 |        0 |      15 |        15 |       0 |         0 |     2 |        0 | —                                               |
| `storage`             |      8 |             0 |      0 |    0 |          0 |        0 |      17 |        17 |       0 |         0 |     1 |        0 | —                                               |
| `supabase_migrations` |      1 |             0 |      0 |    0 |          0 |        0 |       0 |         0 |       0 |         0 |     0 |        0 | —                                               |
| `talento`             |     13 |             0 |      0 |    0 |          0 |        0 |      16 |        16 |       0 |         0 |     7 |        0 | —                                               |
| `vault`               |      1 |             0 |      1 |    0 |          0 |        0 |       5 |         5 |       0 |         0 |     0 |        0 | supabase_vault                                  |
| `viso`                |     12 |             0 |      0 |    0 |          0 |        0 |       0 |         0 |       0 |         0 |     0 |        0 | —                                               |
| `vital`               |     54 |             0 |      0 |    0 |          0 |        0 |      47 |        47 |       0 |         0 |     7 |        0 | —                                               |

#### 12. Totales de objetos observados

| Tipo                  | Total en 23 esquemas |
| --------------------- | -------------------: |
| tablas ordinarias     |              **431** |
| tablas particionadas  |                **1** |
| vistas                |              **208** |
| vistas materializadas |                **0** |
| secuencias            |                **7** |
| tablas extranjeras    |                **0** |
| rutinas               |             **3794** |
| funciones             |             **3622** |
| procedimientos        |                **0** |
| agregados             |              **157** |
| enums                 |               **34** |
| dominios PostgreSQL   |                **6** |

Estos totales incluyen catálogos internos y `information_schema`; no equivalen a objetos empresariales de Vento. La tarea `SUPA-AUD-004` deberá inventariar los objetos individualmente y permitir totales filtrados por clasificación.

#### 13. Distribución por propietario PostgreSQL

| Propietario         | Esquemas |
| ------------------- | -------: |
| `pg_database_owner` |    **1** |
| `pgbouncer`         |    **1** |
| `postgres`          |   **10** |
| `supabase_admin`    |   **11** |

La propiedad PostgreSQL observada es un dato técnico. No sustituye la aplicación propietaria, el dominio empresarial ni la clasificación de `SUPA-AUD-002`.

#### 14. Namespaces temporales

El catálogo contiene **120** namespaces temporales:

```text
60 pg_temp_*
+
60 pg_toast_temp_*
```

Reglas:

1. se contabilizan para demostrar cobertura total de `pg_namespace`;
2. no se registran como 120 esquemas permanentes del modelo E3;
3. no se les asigna dominio, propietaria, exposición ni destino de transición;
4. una nueva ejecución puede observar numeración o cantidad distintas sin representar necesariamente drift empresarial;
5. los validadores compararán el conjunto no efímero de 23 filas y reportarán por separado el conteo temporal.

#### 15. Esquemas vacíos o de huella mínima

`graphql` aparece con cero objetos en las categorías agregadas consultadas y permanece inventariado. `graphql_public` conserva una rutina y ningún objeto relacional de las categorías medidas.

Un esquema vacío o de huella mínima:

- no se elimina del inventario;
- no se declara inútil;
- no se clasifica como legacy;
- no se confunde con ausencia;
- deberá revisarse en `SUPA-AUD-002`, `SUPA-AUD-003`, `SUPA-AUD-006` y `SUPA-AUD-018` según corresponda.

#### 16. Comentarios y documentación observable

Solo cuatro esquemas poseen comentario observable: `pass`, `pos`, `public` y `viso`. Los otros diecinueve quedan con comentario ausente en esta línea base.

El texto de un comentario:

- se conserva literalmente como evidencia;
- no prueba propiedad empresarial;
- no autoriza renombre, movimiento o exposición;
- no corrige por sí solo documentación incompleta;
- deberá contrastarse con objetos, consumidores y migraciones posteriores.

#### 17. Ubicación observada de extensiones

Se observaron ocho instancias de extensión distribuidas así:

| Esquema      | Extensiones                                             |
| ------------ | ------------------------------------------------------- |
| `extensions` | `pg_net`, `pg_stat_statements`, `pgcrypto`, `uuid-ossp` |
| `pg_catalog` | `pg_cron`, `plpgsql`                                    |
| `public`     | `unaccent`                                              |
| `vault`      | `supabase_vault`                                        |

La ubicación se registra sin decidir si es correcta, administrada, movible o reproducible. `SUPA-AUD-015` auditará extensiones y configuración; `SUPA-AUD-016` y `SUPA-AUD-017` contrastarán el remoto con `vento-shell` y detectarán drift.

#### 18. Concentración observable en `public`

`public` contiene, en este corte, **185 tablas ordinarias, 61 vistas, 2 secuencias, 246 rutinas y 7 enums**. Es la mayor huella entre los esquemas clasificados únicamente como `PERSISTENT` en esta tarea.

Este dato es una señal de concentración para auditorías posteriores, no una decisión arquitectónica. `SUPA-AUD-001` no afirma que los objetos deban permanecer, moverse, dividirse o exponerse, y no considera `public` un destino universal.

#### 19. Invariantes del inventario

1. Cada esquema no efímero aparece exactamente una vez.
2. El conjunto se ordena por `schema_name` ascendente.
3. El nombre se conserva literalmente y distingue mayúsculas si existieran.
4. Los propietarios se resuelven mediante `pg_get_userbyid`.
5. Los conteos son agregados de catálogo y no estimaciones documentales.
6. Un esquema sin objetos sigue existiendo y permanece registrado.
7. Los temporales se contabilizan fuera del registro persistente.
8. Ningún nombre se normaliza por inferencia.
9. Una diferencia futura genera drift pendiente de explicación, no corrección automática.
10. El inventario no se usa como autorización ni como allowlist de Data API.

#### 20. Observaciones que requieren tareas posteriores

| Observación                                            | Tarea propietaria               |
| ------------------------------------------------------ | ------------------------------- |
| clasificación administrado por Supabase frente a Vento | `SUPA-AUD-002`                  |
| exposición real mediante Data API                      | `SUPA-AUD-003`                  |
| objetos individuales dentro de cada esquema            | `SUPA-AUD-004` a `SUPA-AUD-008` |
| grants, RLS y privilegios efectivos                    | `SUPA-AUD-009`                  |
| Auth e identidades empresariales                       | `SUPA-AUD-010` y `SUPA-AUD-011` |
| Storage, Realtime, automatizaciones y extensiones      | `SUPA-AUD-012` a `SUPA-AUD-015` |
| paridad con migraciones y drift                        | `SUPA-AUD-016` y `SUPA-AUD-017` |
| legacy, duplicidades y fuentes competidoras            | `SUPA-AUD-018` y `SUPA-AUD-019` |
| rendimiento y crecimiento                              | `SUPA-AUD-020`                  |
| tipos y consumidores                                   | `SUPA-AUD-021` a `SUPA-AUD-023` |
| riesgo consolidado                                     | `SUPA-AUD-024`                  |

No queda una observación narrativa sin destino documental.

#### 21. Relación con la arquitectura posterior

El inventario no aprueba esquemas objetivo. `SUPA-ARC-001` a `SUPA-ARC-025` deberán consumir la auditoría completa, y no solo los nombres actuales, para decidir separación, dominios, `public`, capas expuestas y privadas, identidad, RLS, Storage, Realtime, automatizaciones, rendimiento y ADR.

Los nombres preliminares de arquitectura no se convierten en canónicos porque exista hoy un esquema parecido. Estado actual y arquitectura objetivo permanecen separados.

#### 22. Relación con E1, E2, X, H y R

- E1 aporta cobertura técnica y brechas, pero este corte vuelve a observar el remoto actual.
- E2 aporta procesos, fuentes de verdad y propiedad funcional; no se infieren desde nombres de schema.
- X obliga a respetar propietarias y prohíbe escrituras cruzadas sin contrato.
- H implementará contratos y tipos compartidos después de la arquitectura aprobada.
- R ejecutará cambios físicos únicamente después de auditoría, ADR y transición aprobadas.

`SUPA-AUD-001` no reemplaza ninguna de esas responsabilidades.

#### 23. Riesgos registrados por esta tarea

| Riesgo                                     | Tratamiento documental inmediato                                    |
| ------------------------------------------ | ------------------------------------------------------------------- |
| omitir un esquema existente                | inventario completo de 23 filas y validación de unicidad            |
| confundir temporales con arquitectura      | conteo separado de 120 namespaces temporales                        |
| inferir propiedad desde nombre u owner     | clasificación diferida explícitamente a `SUPA-AUD-002`              |
| inferir exposición desde `USAGE`           | exposición diferida a `SUPA-AUD-003` y privilegios a `SUPA-AUD-009` |
| ignorar schemas vacíos                     | filas obligatorias aun con huella cero                              |
| perder drift entre sesiones                | corte, proyecto, versión, momento y huellas congelados              |
| modificar la base durante auditoría        | consultas read-only y prohibición de DDL/DML                        |
| diseñar arquitectura desde `public` actual | decisión reservada a `SUPA-ARC-*`                                   |

#### 24. Conclusiones que esta tarea no autoriza

No se concluye todavía:

- qué schemas son administrados por Supabase;
- cuáles pertenecen a Vento;
- cuáles deben exponerse, ocultarse, conservarse, moverse o retirarse;
- que `public`, `club`, `pass`, `payments`, `pos`, `talento`, `viso` o `vital` sean dominios canónicos futuros;
- que un schema con `USAGE` sea accesible a sus objetos;
- que owner `postgres` implique propiedad empresarial de Vento;
- que owner `supabase_admin` implique que todo el schema sea inmodificable;
- que un objeto ausente del conteo agregado no exista en otra categoría no inventariada todavía.

#### 25. Cambios no autorizados

`SUPA-AUD-001` no autoriza:

- crear, renombrar, mover o eliminar schemas;
- cambiar owner, comentario, ACL, grants o `search_path`;
- crear, modificar o retirar tablas, vistas, funciones, triggers, políticas, tipos o extensiones;
- cambiar exposición de Data API, Auth, Storage, Realtime, Edge Functions o cron;
- generar o aplicar migraciones;
- corregir drift;
- cambiar tipos TypeScript;
- modificar datos;
- escribir en GitHub;
- avanzar a `SUPA-AUD-002` antes de aprobación expresa.

#### 26. Requisitos de prueba derivados

```text
TREQ-SUPABASE-014 a TREQ-SUPABASE-025
```

Se crean doce requisitos. El detalle completo reside exclusivamente en `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` regenerado con esta tarea.

#### 27. Huellas de integridad

```text
SCHEMA_NAME_REGISTRY_SHA256 = 6d425ce7e671428e2966d51d87f3965c17defe148d2ecef8accdf7ba305874a8
SCHEMA_FOOTPRINT_REGISTRY_SHA256 = 247d854ca122612b3c0ca2969c4ace4d310426c7f42ee6051a23b2d660b632d8
SCHEMA_ACL_OBSERVATION_SHA256 = 4781382d9a7db63fcdc57540a3f9e11b4b2a4e0eee5bbc920b2e039c26e4c2d6
SCHEMA_INVENTORY_SUMMARY_SHA256 = 165bc22ff54c00583137496216ed6cd51a5696bae87a00f738285fe21075bc66
SCHEMA_INVENTORY_ARTIFACT_SHA256 = 6e7d6b9af60e9105447fe82d78911446127447d841c39193319e76c64b682320
REMOTE_COMMIT_SHA = b1072ad4716022fadbb587cccfd73956c3a9e7eb
REMOTE_04A_BASE_BLOB_SHA1 = e98bc163f28c325d9734d4ba2cdebae60379f675
E3_INTRO_BLOB_SHA1 = 2ce04b7045fafd10652c9f88350bbe89bc317860
E3_PRINCIPLES_BLOB_SHA1 = 36bb9a4c19f6d8e7edbaa03687219fb642c9c526
E3_AUDIT_BLOCK_BLOB_SHA1 = 5ca352374b09ee8016f66eac869a3dbda6551f9a
REMOTE_ACTIVE_SEQUENCE_BLOB_SHA1 = 59c9c7d37d2bfd82fc7599174f5778cb8bc2e5e7
SUPABASE_PROJECT_REF = clzdpinthhtknkmefsxx
OBSERVED_AT_UTC = 2026-07-29T17:36:37.527043Z
```

#### 28. Criterios de aceptación

- [x] BLOQUE X figura cerrado con `INT-APP-010` aprobada.
- [x] Se revisaron introducción, principios, auditoría, arquitectura, transición y resultado esperado de E3.
- [x] Se identificó el reemplazo requerido de `active-sequence.json` para activar E3.
- [x] Se consultó el proyecto remoto correcto en modo read-only.
- [x] Se contabilizaron 143 namespaces totales.
- [x] Se separaron 120 namespaces temporales de 23 esquemas no efímeros.
- [x] Los 23 esquemas aparecen exactamente una vez y en orden estable.
- [x] Cada fila conserva owner, ciclo, comentario, ACL observada y huella agregada de objetos.
- [x] Se incluyeron schemas vacíos o de huella mínima.
- [x] No se adelantó la clasificación de `SUPA-AUD-002` ni la exposición de `SUPA-AUD-003`.
- [x] Se congelaron proyecto, versión, momento y huellas.
- [x] Se crearon doce requisitos completos.
- [x] No se ejecutaron cambios físicos ni escrituras.
- [x] `SUPA-AUD-002` permanece reservada.

#### 29. Validaciones estructurales realizadas

| Control                                                      | Resultado                                      |
| ------------------------------------------------------------ | ---------------------------------------------- |
| esquemas no efímeros esperados                               | **23**                                         |
| filas del inventario                                         | **23**                                         |
| nombres duplicados                                           | **0**                                          |
| nombres fuera de orden                                       | **0**                                          |
| namespaces temporales contabilizados                         | **120**                                        |
| suma total reconciliada                                      | **23 + 120 = 143**                             |
| propietarios distintos                                       | **4**                                          |
| tablas ordinarias agregadas                                  | **431**                                        |
| vistas agregadas                                             | **208**                                        |
| rutinas agregadas                                            | **3794**                                       |
| requisitos históricos preservados en 04A                     | **4.308**                                      |
| requisitos nuevos                                            | **12**                                         |
| total 04A regenerado                                         | **4.320**                                      |
| dominio SUPABASE                                             | **25 — TREQ-SUPABASE-001 a TREQ-SUPABASE-025** |
| filas 04A con catorce columnas                               | **4.320 de 4.320**                             |
| identificadores TREQ duplicados                              | **0**                                          |
| relaciones TREQ no resolubles                                | **0**                                          |
| valores históricos modificados frente a la base reconstruida | **0**                                          |
| sentencias mutantes ejecutadas en Supabase                   | **0**                                          |

#### 30. Validación real del repositorio

```text
VALIDACIÓN REAL DEL REPOSITORIO PENDIENTE DE EJECUCIÓN LOCAL
```

Comandos requeridos desde la raíz de `vento-shell`, después de reemplazar la tarea, `04A` y `active-sequence.json`:

```bash
npm run docs:plan:build
npm run docs:plan:check
npm run docs:plan:test
npm run docs:int-app:check
npm run docs:treq:check
npm run docs:treq:test
git diff --check
```

No existe todavía un validador E3 específico declarado en `package.json`; esta tarea no autoriza crearlo. La cobertura estructural se verificó sobre los artefactos generados y el corte remoto se verificó mediante consultas read-only.

#### 31. Instrucción de reemplazo y continuidad

1. Reemplazar exactamente `### [ ] SUPA-AUD-001 — Inventariar todos los esquemas existentes` por este documento completo.
2. Reemplazar completamente `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` por el archivo regenerado entregado.
3. Reemplazar completamente `active-sequence.json` por el archivo entregado para activar BLOQUE E3.
4. No copiar, fusionar ni insertar filas `TREQ-*` manualmente.
5. No modificar `00_CABECERA_Y_ESTADO.md` ni archivos bajo `.generated/`; el compilador deberá derivarlos.
6. No modificar `00_INTRO.md` ni `01_PRINCIPIOS_OBLIGATORIOS.md`, porque ya son coherentes con esta tarea.

```text
ÚLTIMA TAREA APROBADA
INT-APP-010 — Evitar escrituras cruzadas sin contrato
        ↓
TAREA ACTUAL EN REVISIÓN
SUPA-AUD-001 — Inventariar todos los esquemas existentes
        ↓
SIGUIENTE TAREA RESERVADA
SUPA-AUD-002 — Clasificar esquemas administrados por Supabase y esquemas de Vento
```

No se inicia `SUPA-AUD-002` hasta la aprobación expresa de esta tarea.

APROBADA


### ✅ SUPA-AUD-002 — Clasificar esquemas administrados por Supabase y esquemas de Vento

**Estado:** APROBADA  
**Fecha:** 2026-07-29  
**Bloque:** BLOQUE E3 — Arquitectura canónica de datos y gobierno integral de Supabase  
**Tarea anterior:** `SUPA-AUD-001 — Inventariar todos los esquemas existentes` — APROBADA  
**Tarea siguiente:** `SUPA-AUD-003 — Identificar esquemas expuestos mediante Data API`  
**Descripción:** Clasifica los 23 esquemas no efímeros inventariados según quién administra su frontera estructural, separando los esquemas gestionados por PostgreSQL, Supabase o extensiones de los esquemas gobernados por Vento, sin definir todavía exposición, arquitectura objetivo ni transición física.

#### 1. Resultado canónico

Los **23 esquemas no efímeros** inventariados en `SUPA-AUD-001` quedan clasificados sin pendientes:

| Clase primaria                   | Cantidad | Regla de administración                                                                                                                                                                                                        |
| -------------------------------- | -------: | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `ADMINISTRADO_SUPABASE_POSTGRES` |   **14** | La estructura pertenece al motor PostgreSQL, a un producto de Supabase, a su infraestructura, al CLI o al ciclo de una extensión. Vento puede configurar su uso, pero no apropiarse de su estructura como dominio empresarial. |
| `GOBERNADO_VENTO`                |    **9** | La estructura fue creada, poblada o reorganizada por migraciones de `vento-shell` para capacidades, datos o lógica de Vento. Su evolución debe permanecer versionada y auditada por Vento.                                     |

```text
23 ESQUEMAS NO EFÍMEROS
=
14 ADMINISTRADOS POR SUPABASE / POSTGRESQL / EXTENSIONES
+
9 GOBERNADOS POR VENTO
+
0 SIN CLASIFICAR
```

Artefacto resultante:

```text
SUPABASE-SCHEMA-CLASSIFICATION-001@1.0.0
```

#### 2. Regla de clasificación

La clasificación responde exclusivamente a esta pregunta:

```text
¿QUIÉN ADMINISTRA LA FRONTERA ESTRUCTURAL DEL ESQUEMA
Y SU CICLO DE CAMBIO?
```

No responde todavía:

- qué aplicación consume cada objeto;
- qué esquema está expuesto mediante Data API;
- qué objetos son legacy;
- qué esquema deberá existir en la arquitectura objetivo;
- qué objetos deberán conservarse, moverse, dividirse o retirarse.

Se separan obligatoriamente cuatro conceptos:

| Concepto                   | Significado                                                     |
| -------------------------- | --------------------------------------------------------------- |
| origen del namespace       | quién o qué creó inicialmente el esquema                        |
| administración estructural | quién gobierna tablas, funciones y cambios internos del esquema |
| gobierno del contenido     | quién decide la finalidad empresarial de los datos almacenados  |
| propiedad funcional        | qué dominio o aplicación responde por el resultado empresarial  |

La coincidencia de nombre entre aplicación y esquema no prueba propiedad funcional. La ausencia de objetos tampoco convierte un esquema de plataforma en esquema de Vento.

#### 3. Taxonomía de esquemas administrados por Supabase o PostgreSQL

| Subclase                             | Cantidad | Esquemas                      | Naturaleza                                          |
| ------------------------------------ | -------: | ----------------------------- | --------------------------------------------------- |
| `POSTGRES_CORE_MANAGED`              |    **2** | `pg_catalog`, `pg_toast`      | catálogo y almacenamiento interno del motor         |
| `POSTGRES_SQL_STANDARD_MANAGED`      |    **1** | `information_schema`          | metadatos estándar SQL                              |
| `SUPABASE_PRODUCT_MANAGED`           |    **3** | `auth`, `realtime`, `storage` | servicios administrados de Supabase                 |
| `SUPABASE_EXTENSION_MANAGED`         |    **3** | `cron`, `net`, `vault`        | schemas o contenido regido por extensiones          |
| `SUPABASE_EXTENSION_CONTAINER`       |    **1** | `extensions`                  | contenedor reservado para extensiones               |
| `SUPABASE_PLATFORM_RESERVED_DORMANT` |    **2** | `graphql`, `graphql_public`   | frontera GraphQL de plataforma actualmente inactiva |
| `SUPABASE_INFRASTRUCTURE_MANAGED`    |    **1** | `pgbouncer`                   | pooling e infraestructura de conexión               |
| `SUPABASE_CLI_MANAGED`               |    **1** | `supabase_migrations`         | historial de migraciones del CLI                    |

Reglas comunes:

1. no crear tablas o funciones empresariales dentro de estos esquemas;
2. no renombrarlos, moverlos, fusionarlos ni eliminarlos como parte de una reorganización de dominios;
3. no editar directamente estructuras internas de `auth`, `storage`, `realtime`, `cron`, `net`, `vault`, `pgbouncer` o `supabase_migrations`;
4. gestionar configuración, políticas permitidas, jobs, secretos, publicaciones o extensiones mediante sus superficies soportadas y migraciones versionadas;
5. tratar objetos internos como infraestructura o metadata técnica, no como fuente de verdad empresarial de Vento.

#### 4. Taxonomía de esquemas gobernados por Vento

| Subclase                          | Cantidad | Esquemas                                                      | Naturaleza                                           |
| --------------------------------- | -------: | ------------------------------------------------------------- | ---------------------------------------------------- |
| `VENTO_PRIVATE_TECHNICAL`         |    **1** | `app_private`                                                 | lógica y secretos técnicos privados                  |
| `VENTO_DOMAIN_SCHEMA`             |    **7** | `club`, `pass`, `payments`, `pos`, `talento`, `viso`, `vital` | dominios o capacidades empresariales actuales        |
| `VENTO_SHARED_STANDARD_CONTAINER` |    **1** | `public`                                                      | contenedor estándar con objetos gobernados por Vento |

Reglas comunes:

1. toda evolución estructural corresponde a migraciones versionadas en `vento-shell`;
2. cada objeto deberá adquirir propietario funcional, consumidores y fuente de verdad en las tareas posteriores;
3. la clasificación como Vento no valida el diseño actual ni aprueba conservar el nombre o distribución existentes;
4. ningún esquema se convierte automáticamente en frontera canónica por coincidir con una aplicación;
5. `public` permanece bajo gobierno de Vento para sus objetos actuales, aunque el namespace sea estándar de PostgreSQL.

#### 5. Matriz canónica completa

| Esquema               | Clase primaria                   | Subclase                             | Administración estructural                                    | Contenido observado                                                               | Evidencia determinante                                                                                         | Regla resultante                                                                                                                |
| --------------------- | -------------------------------- | ------------------------------------ | ------------------------------------------------------------- | --------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| `app_private`         | `GOBERNADO_VENTO`                | `VENTO_PRIVATE_TECHNICAL`            | Vento mediante migraciones de `vento-shell`                   | secretos técnicos y helpers privados de Vento                                     | Creado por `20260713234029_add_order_delivery_sessions.sql`; owner `postgres`; acceso revocado a roles cliente | No es dominio empresarial ni infraestructura de Supabase; permanece bajo gobierno técnico de Vento.                             |
| `auth`                | `ADMINISTRADO_SUPABASE_POSTGRES` | `SUPABASE_PRODUCT_MANAGED`           | Supabase Auth                                                 | usuarios técnicos, identidades, sesiones y configuración interna de autenticación | Owner `supabase_admin`; Supabase inyecta y usa el esquema `auth` para Auth                                     | No se trata como catálogo laboral o de clientes y no se modifica estructuralmente como dominio Vento.                           |
| `club`                | `GOBERNADO_VENTO`                | `VENTO_DOMAIN_SCHEMA`                | Vento mediante migraciones de `vento-shell`                   | suscripciones, planes, entitlement y auditoría de Club                            | Creado por `20260310130000_club_schema_foundation.sql`; owner `postgres`                                       | Esquema empresarial actual de Vento; su correspondencia futura con dominios canónicos se decidirá después.                      |
| `cron`                | `ADMINISTRADO_SUPABASE_POSTGRES` | `SUPABASE_EXTENSION_MANAGED`         | extensión `pg_cron` y superficie Supabase Cron                | jobs y ejecuciones de programación                                                | El esquema es miembro de la extensión `pg_cron`; owner `supabase_admin`                                        | No se usa como dominio Vento ni se altera fuera del ciclo gobernado de la extensión.                                            |
| `extensions`          | `ADMINISTRADO_SUPABASE_POSTGRES` | `SUPABASE_EXTENSION_CONTAINER`       | extensiones PostgreSQL habilitadas en el proyecto             | objetos de `pg_net`, `pg_stat_statements`, `pgcrypto` y `uuid-ossp`               | Cuatro extensiones instaladas en el esquema; Supabase recomienda reservarlo para extensiones                   | Vento puede decidir qué extensiones habilita, pero no convierte sus objetos internos en objetos empresariales.                  |
| `graphql`             | `ADMINISTRADO_SUPABASE_POSTGRES` | `SUPABASE_PLATFORM_RESERVED_DORMANT` | Supabase / `pg_graphql`                                       | namespace reservado actualmente sin objetos observados                            | Owner `supabase_admin`; `pg_graphql` no está habilitado en el corte                                            | Se conserva como frontera de plataforma aunque esté inactivo; no se reclasifica como Vento por estar vacío.                     |
| `graphql_public`      | `ADMINISTRADO_SUPABASE_POSTGRES` | `SUPABASE_PLATFORM_RESERVED_DORMANT` | Supabase / `pg_graphql`                                       | función pública de compatibilidad que informa que `pg_graphql` está deshabilitado | Owner de esquema y función `supabase_admin`; función `graphql_public.graphql(...)` observada                   | Es infraestructura de compatibilidad de Supabase, no una RPC empresarial de Vento.                                              |
| `information_schema`  | `ADMINISTRADO_SUPABASE_POSTGRES` | `POSTGRES_SQL_STANDARD_MANAGED`      | PostgreSQL                                                    | metadatos estándar SQL                                                            | Namespace estándar; owner `supabase_admin` en el proyecto                                                      | Solo lectura y consulta; nunca se trata como esquema empresarial.                                                               |
| `net`                 | `ADMINISTRADO_SUPABASE_POSTGRES` | `SUPABASE_EXTENSION_MANAGED`         | extensión `pg_net`                                            | ejecución HTTP asíncrona y metadatos técnicos                                     | El esquema es miembro de la extensión `pg_net`; owner `supabase_admin`                                         | No se modifica como dominio ni se usa para persistir estado empresarial.                                                        |
| `pass`                | `GOBERNADO_VENTO`                | `VENTO_DOMAIN_SCHEMA`                | Vento mediante migraciones de `vento-shell`                   | fidelización, puntos, recompensas, favoritos y satélites                          | Creado y documentado por `20260310150000_pass_schema_reorganization_v1.sql`; owner `postgres`                  | Esquema empresarial actual de Vento; no equivale automáticamente a una frontera canónica definitiva.                            |
| `payments`            | `GOBERNADO_VENTO`                | `VENTO_DOMAIN_SCHEMA`                | Vento mediante migraciones de `vento-shell`                   | transacciones, webhooks y metadatos de proveedor de pagos                         | Creado por `20260312133000_orders_payments_wompi_foundation.sql`; owner `postgres`                             | Esquema empresarial e integrador de Vento; sus contratos y fuente de verdad se auditarán por objeto.                            |
| `pg_catalog`          | `ADMINISTRADO_SUPABASE_POSTGRES` | `POSTGRES_CORE_MANAGED`              | PostgreSQL                                                    | catálogo interno del motor                                                        | Namespace de catálogo; owner `supabase_admin`                                                                  | No se modifica, mueve, renombra ni considera dominio empresarial.                                                               |
| `pg_toast`            | `ADMINISTRADO_SUPABASE_POSTGRES` | `POSTGRES_CORE_MANAGED`              | PostgreSQL                                                    | almacenamiento TOAST interno                                                      | Namespace reservado para TOAST; owner `supabase_admin`                                                         | No se gestiona directamente ni participa en arquitectura de dominios.                                                           |
| `pgbouncer`           | `ADMINISTRADO_SUPABASE_POSTGRES` | `SUPABASE_INFRASTRUCTURE_MANAGED`    | infraestructura de pooling de conexiones                      | función técnica del pooler                                                        | Owner `pgbouncer`; namespace de infraestructura                                                                | No se usa para objetos Vento ni se incorpora a Data API o contratos empresariales.                                              |
| `pos`                 | `GOBERNADO_VENTO`                | `VENTO_DOMAIN_SCHEMA`                | Vento mediante migraciones de `vento-shell`                   | sesiones POS, cajas, mesas, modificadores y pagos en sitio                        | Creado y documentado por `20260311113000_pos_schema_reorganization_v1.sql`; owner `postgres`                   | Esquema empresarial actual de Vento; aplicación y dominio no se confunden por compartir el nombre POS.                          |
| `public`              | `GOBERNADO_VENTO`                | `VENTO_SHARED_STANDARD_CONTAINER`    | Vento para sus objetos; PostgreSQL para el namespace estándar | contenedor compartido y heterogéneo de objetos empresariales y técnicos actuales  | 185 tablas, 61 vistas y 246 rutinas observadas; cambios versionados en migraciones Vento                       | Su origen estándar no lo vuelve administrado por Supabase. La clasificación tampoco aprueba conservarlo como destino universal. |
| `realtime`            | `ADMINISTRADO_SUPABASE_POSTGRES` | `SUPABASE_PRODUCT_MANAGED`           | Supabase Realtime                                             | migraciones, suscripciones, autorización y mensajes del servicio Realtime         | Owner `supabase_admin`; contiene tablas y partición administradas por Realtime                                 | No se modifica como dominio Vento; publicaciones y consumidores se auditan por separado.                                        |
| `storage`             | `ADMINISTRADO_SUPABASE_POSTGRES` | `SUPABASE_PRODUCT_MANAGED`           | Supabase Storage                                              | metadatos de buckets, objetos y migraciones del servicio Storage                  | Owner `supabase_admin`; documentación Supabase exige tratar sus tablas como read-only                          | Vento gobierna buckets, políticas y uso, pero no la estructura interna del esquema.                                             |
| `supabase_migrations` | `ADMINISTRADO_SUPABASE_POSTGRES` | `SUPABASE_CLI_MANAGED`               | Supabase CLI                                                  | historial remoto de migraciones aplicadas                                         | Contiene `schema_migrations`; usado por `supabase migration list` y `db push`                                  | No es dominio Vento y no se edita como tabla empresarial.                                                                       |
| `talento`             | `GOBERNADO_VENTO`                | `VENTO_DOMAIN_SCHEMA`                | Vento mediante migraciones de `vento-shell`                   | reclutamiento, evaluación, documentos, entrevistas y preingreso                   | Creado por `20260324190000_talento_foundation.sql`; owner `postgres`                                           | Esquema empresarial actual de Vento; su integración con identidad y laboral se audita posteriormente.                           |
| `vault`               | `ADMINISTRADO_SUPABASE_POSTGRES` | `SUPABASE_EXTENSION_MANAGED`         | extensión `supabase_vault` y UI de Supabase Vault             | secretos cifrados y vista de acceso                                               | Extensión `supabase_vault` instalada en el esquema; owner `supabase_admin`                                     | Vento gobierna finalidades y permisos de secretos, pero no trata las tablas internas como dominio.                              |
| `viso`                | `GOBERNADO_VENTO`                | `VENTO_DOMAIN_SCHEMA`                | Vento mediante migraciones de `vento-shell`                   | planeación, demanda, reglas y generación para VISO                                | Creado por `20260413120000_viso_planning_ai_foundation.sql`; owner `postgres`                                  | Esquema empresarial actual de Vento; no prueba que toda información de VISO deba residir aquí.                                  |
| `vital`               | `GOBERNADO_VENTO`                | `VENTO_DOMAIN_SCHEMA`                | Vento mediante migraciones de `vento-shell`                   | programas, tareas, perfiles y dinámicas del dominio Vital                         | Creado por `20260302000001_vital_foundation.sql`; owner `postgres`                                             | Esquema empresarial actual de Vento; su propiedad funcional definitiva se resolverá con el mapa objeto-capacidad.               |

#### 6. Tratamiento específico de `public`

`public` tiene doble naturaleza:

```text
ORIGEN DEL NAMESPACE
→ estándar de PostgreSQL

CONTENIDO ACTUAL Y EVOLUCIÓN
→ gobernados por Vento
```

Por tanto:

- se clasifica como `GOBERNADO_VENTO / VENTO_SHARED_STANDARD_CONTAINER`;
- no se considera esquema administrado por Supabase;
- su clasificación no lo aprueba como destino universal;
- sus **185 tablas, 61 vistas y 246 rutinas** deberán clasificarse individualmente por propietario, capacidad, consumidor, exposición y estado;
- los objetos de extensiones que residan en `public`, como `unaccent`, conservan gobierno de extensión aunque compartan el namespace.

#### 7. Tratamiento específico de GraphQL

El corte remoto muestra:

- `graphql` sin objetos observados en las categorías inventariadas;
- `graphql_public` con la función `graphql_public.graphql(...)` propiedad de `supabase_admin`;
- la función informa que `pg_graphql` no está habilitado;
- la extensión `pg_graphql` no aparece instalada.

Ambos esquemas se clasifican como `SUPABASE_PLATFORM_RESERVED_DORMANT` porque su vacío o inactividad no transfiere administración a Vento. La necesidad de conservarlos, habilitar GraphQL o retirar compatibilidad se evaluará en las tareas específicas de objetos, exposición, extensiones y transición.

#### 8. Tratamiento específico de extensiones

La administración queda separada así:

| Esquema      | Evidencia                                                         | Clasificación                                                             |
| ------------ | ----------------------------------------------------------------- | ------------------------------------------------------------------------- |
| `cron`       | el namespace es miembro de `pg_cron`                              | extensión administrada                                                    |
| `net`        | el namespace es miembro de `pg_net`                               | extensión administrada                                                    |
| `vault`      | contiene la extensión `supabase_vault`                            | extensión administrada                                                    |
| `extensions` | contiene `pg_net`, `pg_stat_statements`, `pgcrypto` y `uuid-ossp` | contenedor de extensiones                                                 |
| `pg_catalog` | contiene `pg_cron` y `plpgsql` como namespaces de instalación     | catálogo PostgreSQL; no dominio Vento                                     |
| `public`     | contiene `unaccent` junto con objetos Vento                       | gobierno mixto por objeto; clase primaria Vento para el contenedor actual |

Habilitar una extensión es una decisión de Vento; administrar sus objetos internos corresponde al motor o a la extensión.

#### 9. Consecuencias para la auditoría de E3

Esta clasificación fija las siguientes restricciones:

1. `SUPA-AUD-003` evaluará exposición solo sobre superficies realmente servidas; `USAGE` no equivale a Data API.
2. `SUPA-AUD-004` a `SUPA-AUD-008` inventariarán objetos respetando la clase del esquema.
3. `SUPA-AUD-009` distinguirá privilegios permitidos sobre esquemas administrados de autorización empresarial sobre objetos Vento.
4. `SUPA-AUD-016` y `SUPA-AUD-017` compararán el remoto con migraciones sin exigir que objetos internos de Supabase estén definidos como dominios Vento.
5. `SUPA-AUD-018` no podrá declarar legacy un esquema administrado por plataforma solo por estar vacío o inactivo.
6. `SUPA-ARC-001` y `SUPA-ARC-004` utilizarán esta clasificación para separar infraestructura, extensiones y fronteras empresariales.
7. `SUPA-TRANS-*` no podrá incluir cambios estructurales sobre esquemas administrados como si fueran objetos propios de Vento.

#### 10. Registro canónico de clasificación

```text
ADMINISTRADOS POR SUPABASE / POSTGRESQL
information_schema
pg_catalog
pg_toast
auth
realtime
storage
cron
extensions
net
vault
graphql
graphql_public
pgbouncer
supabase_migrations
```

```text
GOBERNADOS POR VENTO
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

#### 11. Requisitos de prueba derivados

```text
TREQ-SUPABASE-026 a TREQ-SUPABASE-037
```

Estos requisitos protegen la cobertura completa, la separación entre administración y semántica, los esquemas de motor y plataforma, las extensiones, los esquemas Vento, el tratamiento de `public`, el estado GraphQL y la estabilidad de la clasificación ante drift.

#### 12. Huellas deterministas

```text
SCHEMA_CLASSIFICATION_MATRIX_SHA256 = 35ea4de8f92c3954a735d092cd309184a73207b0970dd9d47e2635430dc78ec7
MANAGED_SCHEMA_REGISTRY_SHA256 = 5a28761c86fd0a447eead63c65ab62cc226fb5e64ef19e653272d37ec1aea753
VENTO_SCHEMA_REGISTRY_SHA256 = d9758f76ffbf1a84c6b7b4b963f52b2cae569a9d8776b971ecc8f1d02a3d5ff1
SCHEMA_CLASSIFICATION_POLICY_SHA256 = 0cda615837ef9f960c572e9a5ea54d77d530feb7ea587461e9466aa00813178a
```

### ✅ SUPA-AUD-003 — Identificar esquemas expuestos mediante Data API

**Estado:** APROBADA
**Fecha:** 2026-07-29
**Bloque:** BLOQUE E3 — Arquitectura canónica de datos y gobierno integral de Supabase
**Tarea anterior:** `SUPA-AUD-002 — Clasificar esquemas administrados por Supabase y esquemas de Vento` — APROBADA
**Tarea siguiente:** `SUPA-AUD-004 — Inventariar tablas, particiones, vistas y vistas materializadas`
**Descripción:** Identifica la exposición de los 23 esquemas no efímeros frente a la Data API de Supabase, separando configuración PostgREST, privilegio `USAGE`, privilegios sobre objetos y autorización por filas, y clasifica cada esquema según la evidencia versionada, remota y de consumo disponible.

#### 1. Resultado canónico

La exposición mediante Data API no se deduce del nombre del esquema ni de un `GRANT` aislado. El resultado se organiza en cinco estados mutuamente excluyentes:

| Estado de exposición                                           | Cantidad | Esquemas                                                                                                                                                           |
| -------------------------------------------------------------- | -------: | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `DECLARADO_EN_CONFIG_VERSIONADA`                               |    **2** | `public`, `graphql_public`                                                                                                                                         |
| `REQUERIDO_POR_IMPLEMENTACION_PENDIENTE_RECONCILIACION_REMOTA` |    **3** | `club`, `pass`, `viso`                                                                                                                                             |
| `GRANT_READY_NO_DECLARADO`                                     |    **4** | `payments`, `pos`, `talento`, `vital`                                                                                                                              |
| `PRIVADO_NO_EXPONER`                                           |    **1** | `app_private`                                                                                                                                                      |
| `GESTIONADO_NO_DECLARADO_COMO_DATA_API`                        |   **13** | `auth`, `realtime`, `storage`, `cron`, `extensions`, `net`, `vault`, `graphql`, `information_schema`, `pg_catalog`, `pg_toast`, `pgbouncer`, `supabase_migrations` |

```text
23 ESQUEMAS NO EFÍMEROS
=
2 DECLARADOS EN CONFIGURACIÓN VERSIONADA
+ 3 REQUERIDOS POR IMPLEMENTACIÓN Y PENDIENTES DE RECONCILIACIÓN REMOTA
+ 4 PREPARADOS MEDIANTE GRANTS PERO NO DECLARADOS
+ 1 PRIVADO
+ 13 GESTIONADOS NO DECLARADOS COMO DATA API
```

Artefacto resultante:

```text
SUPABASE-DATA-API-SCHEMA-EXPOSURE-REGISTRY-001@1.0.0
```

#### 2. Modelo obligatorio de exposición

Para que un objeto sea alcanzable mediante PostgREST deben coincidir cuatro capas independientes:

| Capa                | Pregunta                                                                        | Evidencia                                                                     |
| ------------------- | ------------------------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| `CONFIGURED_SCHEMA` | ¿El esquema está incluido en la lista de esquemas expuestos de PostgREST?       | `api.schemas` en configuración versionada o configuración remota del proyecto |
| `SCHEMA_USAGE`      | ¿El rol API puede resolver nombres dentro del esquema?                          | `has_schema_privilege(..., 'USAGE')` o grants equivalentes                    |
| `OBJECT_PRIVILEGE`  | ¿El rol puede ejecutar la operación sobre la tabla, vista, secuencia o función? | `SELECT`, `INSERT`, `UPDATE`, `DELETE`, `USAGE` o `EXECUTE`                   |
| `ROW_AUTHORIZATION` | ¿Qué filas puede leer o modificar el actor?                                     | RLS, políticas, claims y autorización empresarial                             |

Regla canónica:

```text
ESQUEMA CONFIGURADO
+ USAGE
+ PRIVILEGIO SOBRE EL OBJETO
= OBJETO ALCANZABLE POR DATA API

OBJETO ALCANZABLE
+ RLS / AUTORIZACIÓN
= FILAS EFECTIVAMENTE PERMITIDAS
```

Por tanto:

- `USAGE` sin inclusión en la configuración no demuestra exposición;
- inclusión en la configuración sin `USAGE` o sin privilegio de objeto no produce acceso útil;
- RLS no incorpora un esquema a PostgREST;
- desactivar RLS no incorpora un esquema a PostgREST;
- `service_role` puede omitir RLS, pero no elimina la necesidad de configuración y privilegios cuando accede por Data API;
- `EXECUTE` heredado por `PUBLIC` no demuestra que una función sea invocable mediante Data API.

#### 3. Evidencia canónica de configuración

La configuración versionada de `vento-shell` declara:

```toml
[api]
schemas = ["public", "graphql_public"]
extra_search_path = ["public", "extensions"]
```

Esto establece dos superficies declaradas para entornos reproducidos desde el repositorio:

| Esquema          | Gobierno | Estado                           | Interpretación                                                                                                                                                                                     |
| ---------------- | -------- | -------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `public`         | Vento    | `DECLARADO_EN_CONFIG_VERSIONADA` | Superficie relacional principal actualmente declarada. No se convierte por ello en destino universal ni en autorización empresarial.                                                               |
| `graphql_public` | Supabase | `DECLARADO_EN_CONFIG_VERSIONADA` | Frontera administrada para GraphQL. La función remota observada actualmente informa que `pg_graphql` no está habilitada, por lo que configuración y disponibilidad funcional no deben confundirse. |

`extensions` aparece en `extra_search_path`, no en `schemas`. Esto permite resolución auxiliar de funciones o tipos, pero no convierte el esquema en una colección de recursos expuesta.

#### 4. Límite de observación del estado remoto

La lista remota de esquemas expuestos pertenece a la configuración del proceso PostgREST y puede ser administrada desde el control plane de Supabase. No está materializada necesariamente como una propiedad consultable en `pg_namespace`, grants, RLS, `pg_settings` o la sesión SQL usada para esta auditoría.

En el proyecto remoto:

- `current_setting('pgrst.db_schemas', true)` no devolvió una lista utilizable;
- no existen ajustes persistidos en `pg_db_role_setting` que permitan reconstruirla;
- los grants observados prueban preparación de acceso, no inclusión en PostgREST;
- los tipos generados desde la base prueban existencia de objetos, no exposición mediante Data API.

La comparación entre configuración versionada y configuración remota queda asignada a:

```text
SUPA-AUD-016 — Comparar estado remoto con migraciones versionadas
```

Esa tarea deberá obtener la configuración remota por una interfaz de control plane autorizada y registrar cualquier esquema adicional, ausente o divergente. Hasta entonces, esta auditoría no inventa una lista remota a partir de señales indirectas.

#### 5. Esquemas Vento con evidencia de uso mediante Data API

| Esquema | Evidencia de implementación                                                                                          | Roles preparados                        | Estado                                                         |
| ------- | -------------------------------------------------------------------------------------------------------------------- | --------------------------------------- | -------------------------------------------------------------- |
| `club`  | una Edge Function usa `supabase.schema("club").rpc(...)`                                                             | `authenticated`, `service_role`         | `REQUERIDO_POR_IMPLEMENTACION_PENDIENTE_RECONCILIACION_REMOTA` |
| `pass`  | una Edge Function usa `supabase.schema("pass").from(...)`                                                            | `anon`, `authenticated`, `service_role` | `REQUERIDO_POR_IMPLEMENTACION_PENDIENTE_RECONCILIACION_REMOTA` |
| `viso`  | una migración dedicada concede acceso Data API a `service_role` y excluye deliberadamente a `anon` y `authenticated` | `service_role`                          | `REQUERIDO_POR_IMPLEMENTACION_PENDIENTE_RECONCILIACION_REMOTA` |

Estas evidencias demuestran intención y dependencia técnica de PostgREST con perfil de esquema personalizado. No demuestran por sí solas que la configuración remota vigente incluya los tres esquemas.

La ausencia de cualquiera de estos esquemas en el control plane remoto produciría un fallo contractual aunque sus grants fueran correctos.

#### 6. Esquemas Vento preparados mediante grants pero no declarados

| Esquema    | `anon` USAGE | `authenticated` USAGE | `service_role` USAGE | Relaciones con algún privilegio por rol          | Clasificación              |
| ---------- | -----------: | --------------------: | -------------------: | ------------------------------------------------ | -------------------------- |
| `payments` |           no |                    sí |                   sí | `anon` 0; `authenticated` 2; `service_role` 2    | `GRANT_READY_NO_DECLARADO` |
| `pos`      |           sí |                    sí |                   sí | `anon` 13; `authenticated` 13; `service_role` 13 | `GRANT_READY_NO_DECLARADO` |
| `talento`  |           sí |                    sí |                   sí | `anon` 13; `authenticated` 13; `service_role` 13 | `GRANT_READY_NO_DECLARADO` |
| `vital`    |           no |                    sí |                   sí | `anon` 0; `authenticated` 54; `service_role` 54  | `GRANT_READY_NO_DECLARADO` |

Interpretación:

1. estos esquemas están técnicamente preparados, total o parcialmente, para ser consumidos por roles API;
2. no aparecen en `api.schemas` del repositorio;
3. no se encontró en `vento-shell` evidencia suficiente para declararlos expuestos en el estado canónico;
4. sus grants actuales deberán auditarse en `SUPA-AUD-009`, aunque finalmente no sean expuestos;
5. cualquier exposición futura deberá ser una decisión explícita de `SUPA-ARC-005`, `SUPA-ARC-015` y `SUPA-ARC-016`, no una consecuencia accidental de grants existentes.

#### 7. Esquema privado de Vento

`app_private` queda clasificado como:

```text
PRIVADO_NO_EXPONER
```

Evidencia:

- no está declarado en `api.schemas`;
- `USAGE` está revocado para `public`, `anon` y `authenticated`;
- no se observaron privilegios relacionales o de ejecución para roles cliente;
- contiene secretos y helpers internos utilizados desde lógica controlada;
- su inclusión futura en PostgREST quedaría prohibida salvo una redefinición arquitectónica explícita que no exponga secretos ni helpers internos.

`app_private` puede ser añadido al `search_path` de una función controlada sin convertirse en esquema expuesto.

#### 8. Esquemas administrados que no constituyen una superficie Data API de Vento

| Esquema               | Naturaleza                              | Conclusión Data API                                                                                  |
| --------------------- | --------------------------------------- | ---------------------------------------------------------------------------------------------------- |
| `auth`                | servicio de autenticación               | se consume mediante Auth API y contratos administrados; no se expone como dominio PostgREST de Vento |
| `realtime`            | servicio Realtime                       | no se expone como colección empresarial                                                              |
| `storage`             | servicio Storage                        | se consume mediante Storage API y políticas propias                                                  |
| `cron`                | extensión `pg_cron`                     | no exponer jobs y metadatos internos como API general                                                |
| `extensions`          | contenedor y search path de extensiones | `extra_search_path` no equivale a exposición                                                         |
| `net`                 | extensión `pg_net`                      | no exponer colas o helpers internos                                                                  |
| `vault`               | gestión de secretos                     | prohibido convertir en superficie PostgREST general                                                  |
| `graphql`             | frontera reservada                      | no declarada en `api.schemas`; sin objetos relevantes observados                                     |
| `information_schema`  | metadatos SQL                           | no exponer                                                                                           |
| `pg_catalog`          | catálogo interno                        | no exponer                                                                                           |
| `pg_toast`            | almacenamiento interno                  | no exponer                                                                                           |
| `pgbouncer`           | infraestructura de pooling              | no exponer                                                                                           |
| `supabase_migrations` | historial del CLI                       | no exponer                                                                                           |

La presencia de `USAGE`, privilegios heredados o funciones ejecutables en algunos de estos esquemas responde a necesidades internas del motor y de los servicios. No autoriza a tratarlos como recursos empresariales.

#### 9. Matriz canónica completa

| Esquema               | Clasificación E3                                                      | Estado Data API                                                | Evidencia determinante                                            |
| --------------------- | --------------------------------------------------------------------- | -------------------------------------------------------------- | ----------------------------------------------------------------- |
| `app_private`         | `GOBERNADO_VENTO / VENTO_PRIVATE_TECHNICAL`                           | `PRIVADO_NO_EXPONER`                                           | revocación explícita y ausencia de acceso cliente                 |
| `auth`                | `ADMINISTRADO_SUPABASE_POSTGRES / SUPABASE_PRODUCT_MANAGED`           | `GESTIONADO_NO_DECLARADO_COMO_DATA_API`                        | API administrada separada                                         |
| `club`                | `GOBERNADO_VENTO / VENTO_BUSINESS_DOMAIN`                             | `REQUERIDO_POR_IMPLEMENTACION_PENDIENTE_RECONCILIACION_REMOTA` | cliente PostgREST con schema personalizado                        |
| `cron`                | `ADMINISTRADO_SUPABASE_POSTGRES / SUPABASE_EXTENSION_MANAGED`         | `GESTIONADO_NO_DECLARADO_COMO_DATA_API`                        | propiedad de `pg_cron`                                            |
| `extensions`          | `ADMINISTRADO_SUPABASE_POSTGRES / SUPABASE_EXTENSION_CONTAINER`       | `GESTIONADO_NO_DECLARADO_COMO_DATA_API`                        | solo extra search path                                            |
| `graphql`             | `ADMINISTRADO_SUPABASE_POSTGRES / SUPABASE_PLATFORM_RESERVED_DORMANT` | `GESTIONADO_NO_DECLARADO_COMO_DATA_API`                        | no incluido en configuración versionada                           |
| `graphql_public`      | `ADMINISTRADO_SUPABASE_POSTGRES / SUPABASE_PLATFORM_RESERVED_DORMANT` | `DECLARADO_EN_CONFIG_VERSIONADA`                               | incluido en `api.schemas`; implementación GraphQL remota inactiva |
| `information_schema`  | `ADMINISTRADO_SUPABASE_POSTGRES / POSTGRES_SQL_STANDARD_MANAGED`      | `GESTIONADO_NO_DECLARADO_COMO_DATA_API`                        | metadatos estándar                                                |
| `net`                 | `ADMINISTRADO_SUPABASE_POSTGRES / SUPABASE_EXTENSION_MANAGED`         | `GESTIONADO_NO_DECLARADO_COMO_DATA_API`                        | propiedad de `pg_net`                                             |
| `pass`                | `GOBERNADO_VENTO / VENTO_BUSINESS_DOMAIN`                             | `REQUERIDO_POR_IMPLEMENTACION_PENDIENTE_RECONCILIACION_REMOTA` | cliente PostgREST con schema personalizado                        |
| `payments`            | `GOBERNADO_VENTO / VENTO_BUSINESS_DOMAIN`                             | `GRANT_READY_NO_DECLARADO`                                     | grants sin inclusión versionada                                   |
| `pg_catalog`          | `ADMINISTRADO_SUPABASE_POSTGRES / POSTGRES_CORE_MANAGED`              | `GESTIONADO_NO_DECLARADO_COMO_DATA_API`                        | catálogo interno                                                  |
| `pg_toast`            | `ADMINISTRADO_SUPABASE_POSTGRES / POSTGRES_CORE_MANAGED`              | `GESTIONADO_NO_DECLARADO_COMO_DATA_API`                        | almacenamiento interno                                            |
| `pgbouncer`           | `ADMINISTRADO_SUPABASE_POSTGRES / SUPABASE_INFRASTRUCTURE_MANAGED`    | `GESTIONADO_NO_DECLARADO_COMO_DATA_API`                        | infraestructura de conexión                                       |
| `pos`                 | `GOBERNADO_VENTO / VENTO_BUSINESS_DOMAIN`                             | `GRANT_READY_NO_DECLARADO`                                     | grants sin inclusión versionada                                   |
| `public`              | `GOBERNADO_VENTO / VENTO_SHARED_STANDARD_CONTAINER`                   | `DECLARADO_EN_CONFIG_VERSIONADA`                               | incluido en `api.schemas`                                         |
| `realtime`            | `ADMINISTRADO_SUPABASE_POSTGRES / SUPABASE_PRODUCT_MANAGED`           | `GESTIONADO_NO_DECLARADO_COMO_DATA_API`                        | servicio administrado separado                                    |
| `storage`             | `ADMINISTRADO_SUPABASE_POSTGRES / SUPABASE_PRODUCT_MANAGED`           | `GESTIONADO_NO_DECLARADO_COMO_DATA_API`                        | Storage API separada                                              |
| `supabase_migrations` | `ADMINISTRADO_SUPABASE_POSTGRES / SUPABASE_CLI_MANAGED`               | `GESTIONADO_NO_DECLARADO_COMO_DATA_API`                        | historial interno del CLI                                         |
| `talento`             | `GOBERNADO_VENTO / VENTO_BUSINESS_DOMAIN`                             | `GRANT_READY_NO_DECLARADO`                                     | grants sin inclusión versionada                                   |
| `vault`               | `ADMINISTRADO_SUPABASE_POSTGRES / SUPABASE_EXTENSION_MANAGED`         | `GESTIONADO_NO_DECLARADO_COMO_DATA_API`                        | secretos administrados                                            |
| `viso`                | `GOBERNADO_VENTO / VENTO_BUSINESS_DOMAIN`                             | `REQUERIDO_POR_IMPLEMENTACION_PENDIENTE_RECONCILIACION_REMOTA` | migración explícita de acceso Data API para service_role          |
| `vital`               | `GOBERNADO_VENTO / VENTO_BUSINESS_DOMAIN`                             | `GRANT_READY_NO_DECLARADO`                                     | grants sin inclusión versionada                                   |

#### 10. Lectura correcta de privilegios observados

Para los esquemas Vento:

| Esquema       | Relaciones con privilegio `anon` | `authenticated` | `service_role` | Rutinas ejecutables `anon` | `authenticated` | `service_role` |
| ------------- | -------------------------------: | --------------: | -------------: | -------------------------: | --------------: | -------------: |
| `app_private` |                                0 |               0 |              0 |                          0 |               0 |              0 |
| `club`        |                                0 |              11 |             11 |                          0 |               5 |              7 |
| `pass`        |                                7 |              21 |             27 |                         21 |              29 |             30 |
| `payments`    |                                0 |               2 |              2 |                          0 |               0 |              0 |
| `pos`         |                               13 |              13 |             13 |                          0 |               0 |              0 |
| `public`      |                              134 |             192 |            248 |                        246 |             246 |            246 |
| `talento`     |                               13 |              13 |             13 |                         16 |              16 |             16 |
| `viso`        |                                0 |               0 |             12 |                          0 |               0 |              0 |
| `vital`       |                                0 |              54 |             54 |                         43 |              45 |             47 |

Estos conteos indican cuántos objetos tienen al menos un privilegio compatible con el rol. No prueban que todas las operaciones estén permitidas ni que las políticas RLS sean correctas.

La cantidad elevada de rutinas ejecutables puede provenir del privilegio PostgreSQL `EXECUTE` concedido a `PUBLIC` por defecto. Su revisión individual corresponde a `SUPA-AUD-005`, `SUPA-AUD-008`, `SUPA-AUD-009` y `SUPA-AUD-015`.

#### 11. Reglas de gobierno derivadas

1. `public` permanece como superficie declarada actual, pero no como destino universal de datos o lógica.
2. `graphql_public` puede estar configurado y al mismo tiempo carecer de una implementación GraphQL activa; ambos estados deben reportarse por separado.
3. `club`, `pass` y `viso` no podrán considerarse reproducibles hasta que configuración local, configuración remota, grants y consumidores coincidan.
4. `payments`, `pos`, `talento` y `vital` no se declararán expuestos basándose solo en grants.
5. `app_private` no podrá incorporarse a la lista de esquemas expuestos.
6. Los trece esquemas gestionados no declarados no podrán añadirse como superficies empresariales genéricas.
7. Una Edge Function que use `service_role` no justifica conceder acceso a `anon` o `authenticated`.
8. La exposición se decidirá por contrato mínimo y no por conveniencia del cliente.
9. Toda superficie expuesta deberá tener RLS o una justificación equivalente para cada objeto accesible; la evaluación concreta corresponde a `SUPA-AUD-009`.
10. Todo cambio de `api.schemas` deberá quedar versionado, comparado contra remoto y protegido por prueba de regresión.

#### 12. Brechas y decisiones vinculadas

| Hallazgo                                                              | Riesgo                                                    | Resolución documental                                                                                 |
| --------------------------------------------------------------------- | --------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| no existe evidencia SQL concluyente de la lista remota de PostgREST   | declarar falsamente un esquema expuesto o privado         | `SUPA-AUD-016` comparará control plane remoto con `supabase/config.toml`                              |
| `club`, `pass` y `viso` requieren perfil de esquema personalizado     | fallos de producción pese a grants correctos              | `SUPA-AUD-016` verificará inclusión remota; `SUPA-TRANS-013` verificará paridad por ambiente          |
| cuatro esquemas Vento tienen grants sin declaración versionada        | superficie accidental o privilegios innecesarios          | `SUPA-AUD-009` auditará grants; `SUPA-ARC-015` decidirá exposición y mínimos                          |
| `public` concentra una superficie amplia                              | exposición excesiva y mezcla de dominios                  | `SUPA-ARC-004`, `SUPA-ARC-005` y `SUPA-TRANS-001` definirán función futura y transición               |
| `graphql_public` está declarado, pero GraphQL remoto aparece inactivo | configuración inútil, contrato ambiguo o dependencia rota | `SUPA-AUD-016` reconciliará entorno; `SUPA-ARC-005` decidirá su función futura                        |
| rutinas con `EXECUTE` heredado por `PUBLIC`                           | RPC accidental al exponer un esquema                      | `SUPA-AUD-008`, `SUPA-AUD-009` y `SUPA-AUD-015` revisarán funciones, privilegios y `SECURITY DEFINER` |

No queda un hallazgo diferido sin tarea responsable.

#### 13. Requisitos de prueba derivados

```text
TREQ-SUPABASE-038 a TREQ-SUPABASE-049
```

Los requisitos protegen:

- separación de las cuatro capas de exposición;
- configuración versionada exacta de `public` y `graphql_public`;
- prohibición de inferir exposición desde grants;
- protección de `app_private`;
- reconciliación remota de `club`, `pass` y `viso`;
- tratamiento de esquemas grant-ready;
- exclusión de esquemas administrados;
- semántica de `service_role` y RLS;
- detección de drift entre configuración, privilegios y consumidores.

#### 14. Invariantes del registro

```text
SCHEMAS_NO_EFIMEROS = 23
DECLARADOS_EN_CONFIG_VERSIONADA = 2
REQUERIDOS_POR_IMPLEMENTACION = 3
GRANT_READY_NO_DECLARADOS = 4
PRIVADOS = 1
GESTIONADOS_NO_DECLARADOS = 13
SIN_CLASIFICAR = 0
```

```text
DATA_API_EXPOSURE_MODEL_SHA256 = 7be62d59a5b231643f71e30ea1c979334839170d8086e1903ebc6550e88271df
DATA_API_SCHEMA_EXPOSURE_MATRIX_SHA256 = c667db6062fa69592d6f8028f1cd5e39d231638456f1cb1084008763c3ac34bd
```

Todo esquema nuevo, eliminado o reclasificado deberá producir drift explícito y volver a evaluar configuración, grants, consumidores y RLS.

#### 15. Resultado final

`SUPA-AUD-003` deja identificada la exposición canónica y la evidencia disponible para los 23 esquemas:

- `public` y `graphql_public` son las únicas superficies declaradas en la configuración versionada;
- `club`, `pass` y `viso` dependen de acceso Data API personalizado y deben reconciliarse contra la configuración remota;
- `payments`, `pos`, `talento` y `vital` tienen grants compatibles, pero no quedan declarados como expuestos;
- `app_private` permanece explícitamente privado;
- los trece esquemas administrados restantes no constituyen superficies empresariales de PostgREST;
- exposición, privilegios y autorización por filas quedan separados como controles independientes.


### ✅ SUPA-AUD-004 — Inventariar tablas, particiones, vistas y vistas materializadas

#### 1. Objetivo

Crear el inventario individual, reproducible y reconciliado de todas las relaciones PostgreSQL de tipo tabla ordinaria, tabla particionada, partición hija, vista y vista materializada observables en los **23 esquemas no efímeros** inventariados por `SUPA-AUD-001`, conservando la clasificación estructural definida por `SUPA-AUD-002` y sin confundir existencia técnica con exposición Data API, autorización, propiedad funcional, calidad arquitectónica o destino futuro.

```text
23 ESQUEMAS NO EFÍMEROS
        ↓
640 RELACIONES INVENTARIADAS
        ↓
424 TABLAS ORDINARIAS NO PARTICIÓN
+ 1 TABLA PARTICIONADA
+ 7 PARTICIONES HIJAS
+ 208 VISTAS
+ 0 VISTAS MATERIALIZADAS
        ↓
BASE PARA CONSTRAINTS, FUNCIONES, RLS, DRIFT Y ARQUITECTURA OBJETIVO
```

#### 2. Semántica de tipos obligatoria

| Clase canónica      | Criterio PostgreSQL                    |  Conteo | Regla                                                      |
| ------------------- | -------------------------------------- | ------: | ---------------------------------------------------------- |
| `ORDINARY_TABLE`    | `relkind='r' AND relispartition=false` | **424** | tabla ordinaria no hija de partición                       |
| `PARTITIONED_TABLE` | `relkind='p'`                          |   **1** | padre lógico particionado; no se suma como tabla ordinaria |
| `PARTITION_CHILD`   | `relkind='r' AND relispartition=true`  |   **7** | relación física hija; conserva padre y bound               |
| `VIEW`              | `relkind='v'`                          | **208** | vista PostgreSQL no materializada                          |
| `MATERIALIZED_VIEW` | `relkind='m'`                          |   **0** | ausencia explícita y protegida contra drift                |

La huella de `SUPA-AUD-001` reportó **431 tablas ordinarias** porque contó todas las relaciones `relkind='r'`. `SUPA-AUD-004` no contradice ese total: lo descompone correctamente en **424 tablas ordinarias no partición + 7 particiones hijas = 431 relaciones `relkind='r'`**.

#### 3. Método de auditoría no mutante

Se utilizaron exclusivamente consultas `SELECT` sobre:

- `pg_namespace` para mantener el universo de 23 esquemas;
- `pg_class` para tipo, nombre, owner, persistencia, tamaño, RLS, comentarios y opciones de vista;
- `pg_inherits` para relaciones padre-hija;
- `pg_get_partkeydef` y `pg_get_expr` para clave y límites de partición;
- `pg_options_to_table` para `security_invoker` y `security_barrier`;
- `pg_total_relation_size` para tamaño físico observado.

No se ejecutaron `CREATE`, `ALTER`, `DROP`, `GRANT`, `REVOKE`, `INSERT`, `UPDATE`, `DELETE`, `TRUNCATE`, `REFRESH MATERIALIZED VIEW`, RPC, funciones empresariales, migraciones ni cambios de configuración.

#### 4. Contrato mínimo de cada registro

Cada entrada publicada en el inventario nominal conserva:

```text
schema_name
+ object_name
+ qualified_name
+ object_type
+ schema_governance_class
+ observation_timestamp
```

La consulta reproducible que genera el inventario captura además owner, persistencia, flags de partición, padre, clave o bound, RLS, `FORCE RLS`, opciones de vista, comentario, estimación de filas y tamaño. Este documento consolida esos atributos en matrices, jerarquías y excepciones verificables; no inventa valores para campos no aplicables ni convierte una observación técnica en decisión de seguridad.

#### 5. Reconciliación global

| Métrica                                          |             Resultado |
| ------------------------------------------------ | --------------------: |
| esquemas no efímeros representados               |          **23 de 23** |
| relaciones inventariadas                         |               **640** |
| tablas ordinarias no partición                   |               **424** |
| tablas particionadas                             |                 **1** |
| particiones hijas                                |                 **7** |
| vistas                                           |               **208** |
| vistas materializadas                            |                 **0** |
| relaciones permanentes                           |               **638** |
| relaciones `UNLOGGED`                            |                 **2** |
| relaciones temporales persistidas en el corte    |                 **0** |
| objetos tabulares con RLS observado              |               **332** |
| objetos tabulares con `FORCE ROW LEVEL SECURITY` |                 **0** |
| vistas `security_invoker=true`                   |                **58** |
| vistas con `security_invoker=false` o ausente    |               **150** |
| vistas `security_barrier=true`                   |                 **3** |
| vistas con `security_barrier=false` o ausente    |               **205** |
| relaciones con comentario                        |               **207** |
| relaciones sin comentario                        |               **433** |
| tamaño físico tabular/materializado observado    | **137.756.672 bytes** |

#### 6. Matriz completa por esquema

| Esquema               | Clase                            | Tablas ordinarias | Tabla particionada | Particiones hijas |  Vistas | Vistas materializadas |   Total | Persistentes | Unlogged | RLS activo en objetos tabulares | Tamaño tabular observado |
| --------------------- | -------------------------------- | ----------------: | -----------------: | ----------------: | ------: | --------------------: | ------: | -----------: | -------: | ------------------------------: | -----------------------: |
| `app_private`         | `GOBERNADO_VENTO`                |                 1 |                  0 |                 0 |       0 |                     0 |   **1** |            1 |        0 |                               0 |                 32.768 B |
| `auth`                | `ADMINISTRADO_SUPABASE_POSTGRES` |                23 |                  0 |                 0 |       0 |                     0 |  **23** |           23 |        0 |                              16 |             17.563.648 B |
| `club`                | `GOBERNADO_VENTO`                |                11 |                  0 |                 0 |       0 |                     0 |  **11** |           11 |        0 |                              11 |                368.640 B |
| `cron`                | `ADMINISTRADO_SUPABASE_POSTGRES` |                 2 |                  0 |                 0 |       0 |                     0 |   **2** |            2 |        0 |                               2 |              8.708.096 B |
| `extensions`          | `ADMINISTRADO_SUPABASE_POSTGRES` |                 0 |                  0 |                 0 |       2 |                     0 |   **2** |            2 |        0 |                               0 |                      0 B |
| `graphql`             | `ADMINISTRADO_SUPABASE_POSTGRES` |                 0 |                  0 |                 0 |       0 |                     0 |   **0** |            0 |        0 |                               0 |                      0 B |
| `graphql_public`      | `ADMINISTRADO_SUPABASE_POSTGRES` |                 0 |                  0 |                 0 |       0 |                     0 |   **0** |            0 |        0 |                               0 |                      0 B |
| `information_schema`  | `ADMINISTRADO_SUPABASE_POSTGRES` |                 4 |                  0 |                 0 |      65 |                     0 |  **69** |           69 |        0 |                               0 |                253.952 B |
| `net`                 | `ADMINISTRADO_SUPABASE_POSTGRES` |                 2 |                  0 |                 0 |       0 |                     0 |   **2** |            0 |        2 |                               0 |             50.290.688 B |
| `pass`                | `GOBERNADO_VENTO`                |                26 |                  0 |                 0 |       1 |                     0 |  **27** |           27 |        0 |                              26 |              2.695.168 B |
| `payments`            | `GOBERNADO_VENTO`                |                 2 |                  0 |                 0 |       0 |                     0 |   **2** |            2 |        0 |                               2 |                180.224 B |
| `pg_catalog`          | `ADMINISTRADO_SUPABASE_POSTGRES` |                64 |                  0 |                 0 |      78 |                     0 | **142** |          142 |        0 |                               0 |             25.935.872 B |
| `pg_toast`            | `ADMINISTRADO_SUPABASE_POSTGRES` |                 0 |                  0 |                 0 |       0 |                     0 |   **0** |            0 |        0 |                               0 |                      0 B |
| `pgbouncer`           | `ADMINISTRADO_SUPABASE_POSTGRES` |                 0 |                  0 |                 0 |       0 |                     0 |   **0** |            0 |        0 |                               0 |                      0 B |
| `pos`                 | `GOBERNADO_VENTO`                |                13 |                  0 |                 0 |       0 |                     0 |  **13** |           13 |        0 |                              13 |                335.872 B |
| `public`              | `GOBERNADO_VENTO`                |               185 |                  0 |                 0 |      61 |                     0 | **246** |          246 |        0 |                             185 |             24.444.928 B |
| `realtime`            | `ADMINISTRADO_SUPABASE_POSTGRES` |                 2 |                  1 |                 7 |       0 |                     0 |  **10** |           10 |        0 |                               1 |                270.336 B |
| `storage`             | `ADMINISTRADO_SUPABASE_POSTGRES` |                 8 |                  0 |                 0 |       0 |                     0 |   **8** |            8 |        0 |                               8 |              2.211.840 B |
| `supabase_migrations` | `ADMINISTRADO_SUPABASE_POSTGRES` |                 1 |                  0 |                 0 |       0 |                     0 |   **1** |            1 |        0 |                               0 |              1.449.984 B |
| `talento`             | `GOBERNADO_VENTO`                |                13 |                  0 |                 0 |       0 |                     0 |  **13** |           13 |        0 |                              13 |                450.560 B |
| `vault`               | `ADMINISTRADO_SUPABASE_POSTGRES` |                 1 |                  0 |                 0 |       1 |                     0 |   **2** |            2 |        0 |                               0 |                 24.576 B |
| `viso`                | `GOBERNADO_VENTO`                |                12 |                  0 |                 0 |       0 |                     0 |  **12** |           12 |        0 |                               1 |                548.864 B |
| `vital`               | `GOBERNADO_VENTO`                |                54 |                  0 |                 0 |       0 |                     0 |  **54** |           54 |        0 |                              54 |              1.990.656 B |
| **TOTAL**             | —                                |           **424** |              **1** |             **7** | **208** |                 **0** | **640** |      **638** |    **2** |                         **332** |        **137.756.672 B** |

Reglas de lectura:

1. los tamaños son evidencia del corte, no métricas de capacidad ni retención;
2. las vistas no almacenan bytes propios en esta suma;
3. la tabla padre particionada y sus hijos se identifican por separado;
4. los esquemas sin relaciones permanecen representados con cero;
5. los indicadores RLS y de vistas son inventario, no certificación de seguridad.

#### 7. Distribución por gobierno estructural

| Clase vigente según `SUPA-AUD-002` | Esquemas | Tablas ordinarias | Padres particionados | Particiones hijas |  Vistas | Materializadas |   Total |
| ---------------------------------- | -------: | ----------------: | -------------------: | ----------------: | ------: | -------------: | ------: |
| `GOBERNADO_VENTO`                  |        9 |           **317** |                    0 |                 0 |  **62** |              0 | **379** |
| `ADMINISTRADO_SUPABASE_POSTGRES`   |       14 |           **107** |                **1** |             **7** | **146** |              0 | **261** |
| **TOTAL**                          |   **23** |           **424** |                **1** |             **7** | **208** |          **0** | **640** |

Esta distribución no aprueba conservar, mover, dividir o retirar ningún objeto. La propiedad funcional y los consumidores se resolverán en `SUPA-AUD-022`; el diseño objetivo en `SUPA-ARC-*`; la transición en `SUPA-TRANS-*`.

#### 8. Jerarquía de particiones observada

Existe una sola tabla particionada:

| Padre               | Owner                     | Persistencia | Clave                 | RLS    | `FORCE RLS` |
| ------------------- | ------------------------- | ------------ | --------------------- | ------ | ----------- |
| `realtime.messages` | `supabase_realtime_admin` | `PERMANENT`  | `RANGE (inserted_at)` | activo | no          |

Particiones hijas observadas:

| Partición                      | Bound literal observado    | Owner                     | RLS propio |   Tamaño |
| ------------------------------ | -------------------------- | ------------------------- | ---------- | -------: |
| `realtime.messages_2026_07_26` | `[2026-07-26, 2026-07-27)` | `supabase_realtime_admin` | no         | 24.576 B |
| `realtime.messages_2026_07_27` | `[2026-07-27, 2026-07-28)` | `supabase_realtime_admin` | no         | 24.576 B |
| `realtime.messages_2026_07_28` | `[2026-07-28, 2026-07-29)` | `supabase_realtime_admin` | no         | 24.576 B |
| `realtime.messages_2026_07_29` | `[2026-07-29, 2026-07-30)` | `supabase_realtime_admin` | no         | 24.576 B |
| `realtime.messages_2026_07_30` | `[2026-07-30, 2026-07-31)` | `supabase_realtime_admin` | no         | 24.576 B |
| `realtime.messages_2026_07_31` | `[2026-07-31, 2026-08-01)` | `supabase_realtime_admin` | no         | 24.576 B |
| `realtime.messages_2026_08_01` | `[2026-08-01, 2026-08-02)` | `supabase_realtime_admin` | no         | 24.576 B |

Los índices hijos también aparecen en `pg_inherits`, pero no pertenecen al alcance de relaciones `r`, `p`, `v` o `m`; su inventario se resolverá con índices y rendimiento en `SUPA-AUD-020`. La política de creación, retención y mantenimiento de estas particiones corresponde a `SUPA-AUD-013`, `SUPA-AUD-020` y `SUPA-AUD-016` según servicio, rendimiento y reproducibilidad.

#### 9. Persistencia y ownership

- **638** relaciones son `PERMANENT`.
- Las únicas **2** relaciones `UNLOGGED` son `net._http_response` y `net.http_request_queue`.
- No se observó ninguna relación temporal persistida dentro de los 23 esquemas no efímeros.
- El owner se conserva por objeto; no se hereda conceptualmente desde el owner del esquema.
- `realtime` contiene owners distintos (`supabase_admin` y `supabase_realtime_admin`), lo que demuestra que owner de esquema y owner de objeto no son equivalentes.

La idoneidad de owners, grants y privilegios se auditará en `SUPA-AUD-009`; esta tarea solo registra el estado.

#### 10. Señales RLS observadas

De **432 objetos tabulares** —424 tablas ordinarias, 1 padre particionado y 7 hijos—:

- **332** tienen `relrowsecurity=true`;
- **100** tienen `relrowsecurity=false`;
- **0** tienen `relforcerowsecurity=true`.

Dentro de los nueve esquemas gobernados por Vento, los objetos tabulares sin RLS observado son:

```text
app_private.delivery_pin_secrets
viso.demand_forecasts
viso.demand_history_hourly
viso.employee_availability
viso.employee_planning_limits
viso.employee_shift_preferences
viso.shift_generation_candidate_items
viso.shift_generation_candidates
viso.shift_generation_runs
viso.site_operational_roles
viso.site_planning_rules
viso.site_staffing_requirements
```

La ausencia de RLS no constituye automáticamente una vulnerabilidad: puede existir aislamiento por esquema, grants, acceso exclusivo de backend o diseño interno. La evaluación objeto por objeto, roles, políticas y justificaciones corresponde exclusivamente a `SUPA-AUD-009`.

#### 11. Opciones de ejecución de vistas

| Señal                              | Total global | Gobernadas por Vento |
| ---------------------------------- | -----------: | -------------------: |
| `security_invoker=true`            |       **58** |               **58** |
| `security_invoker=false` o ausente |      **150** |                **4** |
| `security_barrier=true`            |        **3** |                **0** |
| `security_barrier=false` o ausente |      **205** |               **62** |

Las cuatro vistas gobernadas por Vento sin `security_invoker=true` son:

```text
public.permission_catalog_human_v1
public.shared_operational_device_actor_policies_admin_v1
public.shared_operational_device_templates_admin_v1
public.shared_operational_devices_admin_v1
```

`pass.sell_products_by_site` y las otras 57 vistas Vento observadas tienen `security_invoker=true`. La matriz no decide si las cuatro excepciones son correctas: `SUPA-AUD-009` deberá cruzar definición, owner, grants, RLS de tablas base y consumidores; `SUPA-AUD-016` verificará su reproducción por migraciones.

#### 12. Vistas materializadas

No existe ninguna relación `relkind='m'` en el corte:

```text
MATERIALIZED_VIEW_COUNT = 0
```

La ausencia se registra como resultado positivo del inventario, no como categoría omitida. La aparición futura de una vista materializada deberá generar drift, identificar refresh, owner, dependencias, índices, seguridad, retención y consumidor antes de considerarse aceptada.

#### 13. Inventario nominal completo

El inventario se ordena por esquema, tipo y nombre calificado. Incluye objetos de PostgreSQL y Supabase porque el alcance aprobado exige reconciliar el universo completo de 23 esquemas; su inclusión no los convierte en objetos empresariales de Vento.

##### 1. `app_private`

- clasificación vigente: `GOBERNADO_VENTO` / `VENTO_PRIVATE_TECHNICAL`;
- huella: 1 tablas ordinarias, 0 tablas particionadas, 0 particiones hijas, 0 vistas y 0 vistas materializadas;

**Tablas ordinarias (1):**

```text
app_private.delivery_pin_secrets
```

##### 2. `auth`

- clasificación vigente: `ADMINISTRADO_SUPABASE_POSTGRES` / `SUPABASE_PRODUCT_MANAGED`;
- huella: 23 tablas ordinarias, 0 tablas particionadas, 0 particiones hijas, 0 vistas y 0 vistas materializadas;

**Tablas ordinarias (23):**

```text
auth.audit_log_entries
auth.custom_oauth_providers
auth.flow_state
auth.identities
auth.instances
auth.mfa_amr_claims
auth.mfa_challenges
auth.mfa_factors
auth.oauth_authorizations
auth.oauth_client_states
auth.oauth_clients
auth.oauth_consents
auth.one_time_tokens
auth.refresh_tokens
auth.saml_providers
auth.saml_relay_states
auth.schema_migrations
auth.sessions
auth.sso_domains
auth.sso_providers
auth.users
auth.webauthn_challenges
auth.webauthn_credentials
```

##### 3. `club`

- clasificación vigente: `GOBERNADO_VENTO` / `VENTO_DOMAIN_SCHEMA`;
- huella: 11 tablas ordinarias, 0 tablas particionadas, 0 particiones hijas, 0 vistas y 0 vistas materializadas;

**Tablas ordinarias (11):**

```text
club.audit_events
club.beta_access
club.cashback_rules
club.earn_events
club.entitlements
club.plans
club.redemption_links
club.store_products
club.subscriptions
club.wallet_accounts
club.wallet_ledger
```

##### 4. `cron`

- clasificación vigente: `ADMINISTRADO_SUPABASE_POSTGRES` / `SUPABASE_EXTENSION_MANAGED`;
- huella: 2 tablas ordinarias, 0 tablas particionadas, 0 particiones hijas, 0 vistas y 0 vistas materializadas;

**Tablas ordinarias (2):**

```text
cron.job
cron.job_run_details
```

##### 5. `extensions`

- clasificación vigente: `ADMINISTRADO_SUPABASE_POSTGRES` / `SUPABASE_EXTENSION_CONTAINER`;
- huella: 0 tablas ordinarias, 0 tablas particionadas, 0 particiones hijas, 2 vistas y 0 vistas materializadas;

**Vistas (2):**

```text
extensions.pg_stat_statements
extensions.pg_stat_statements_info
```

##### 6. `graphql`

- clasificación vigente: `ADMINISTRADO_SUPABASE_POSTGRES` / `SUPABASE_PLATFORM_RESERVED_DORMANT`;
- huella: 0 tablas ordinarias, 0 tablas particionadas, 0 particiones hijas, 0 vistas y 0 vistas materializadas;

```text
SIN OBJETOS DE TIPO r, p, v O m EN EL CORTE OBSERVADO
```

##### 7. `graphql_public`

- clasificación vigente: `ADMINISTRADO_SUPABASE_POSTGRES` / `SUPABASE_PLATFORM_RESERVED_DORMANT`;
- huella: 0 tablas ordinarias, 0 tablas particionadas, 0 particiones hijas, 0 vistas y 0 vistas materializadas;

```text
SIN OBJETOS DE TIPO r, p, v O m EN EL CORTE OBSERVADO
```

##### 8. `information_schema`

- clasificación vigente: `ADMINISTRADO_SUPABASE_POSTGRES` / `POSTGRES_SQL_STANDARD_MANAGED`;
- huella: 4 tablas ordinarias, 0 tablas particionadas, 0 particiones hijas, 65 vistas y 0 vistas materializadas;

**Tablas ordinarias (4):**

```text
information_schema.sql_features
information_schema.sql_implementation_info
information_schema.sql_parts
information_schema.sql_sizing
```

**Vistas (65):**

```text
information_schema._pg_foreign_data_wrappers
information_schema._pg_foreign_servers
information_schema._pg_foreign_table_columns
information_schema._pg_foreign_tables
information_schema._pg_user_mappings
information_schema.administrable_role_authorizations
information_schema.applicable_roles
information_schema.attributes
information_schema.character_sets
information_schema.check_constraint_routine_usage
information_schema.check_constraints
information_schema.collation_character_set_applicability
information_schema.collations
information_schema.column_column_usage
information_schema.column_domain_usage
information_schema.column_options
information_schema.column_privileges
information_schema.column_udt_usage
information_schema.columns
information_schema.constraint_column_usage
information_schema.constraint_table_usage
information_schema.data_type_privileges
information_schema.domain_constraints
information_schema.domain_udt_usage
information_schema.domains
information_schema.element_types
information_schema.enabled_roles
information_schema.foreign_data_wrapper_options
information_schema.foreign_data_wrappers
information_schema.foreign_server_options
information_schema.foreign_servers
information_schema.foreign_table_options
information_schema.foreign_tables
information_schema.information_schema_catalog_name
information_schema.key_column_usage
information_schema.parameters
information_schema.referential_constraints
information_schema.role_column_grants
information_schema.role_routine_grants
information_schema.role_table_grants
information_schema.role_udt_grants
information_schema.role_usage_grants
information_schema.routine_column_usage
information_schema.routine_privileges
information_schema.routine_routine_usage
information_schema.routine_sequence_usage
information_schema.routine_table_usage
information_schema.routines
information_schema.schemata
information_schema.sequences
information_schema.table_constraints
information_schema.table_privileges
information_schema.tables
information_schema.transforms
information_schema.triggered_update_columns
information_schema.triggers
information_schema.udt_privileges
information_schema.usage_privileges
information_schema.user_defined_types
information_schema.user_mapping_options
information_schema.user_mappings
information_schema.view_column_usage
information_schema.view_routine_usage
information_schema.view_table_usage
information_schema.views
```

##### 9. `net`

- clasificación vigente: `ADMINISTRADO_SUPABASE_POSTGRES` / `SUPABASE_EXTENSION_MANAGED`;
- huella: 2 tablas ordinarias, 0 tablas particionadas, 0 particiones hijas, 0 vistas y 0 vistas materializadas;

**Tablas ordinarias (2):**

```text
net._http_response
net.http_request_queue
```

##### 10. `pass`

- clasificación vigente: `GOBERNADO_VENTO` / `VENTO_DOMAIN_SCHEMA`;
- huella: 26 tablas ordinarias, 0 tablas particionadas, 0 particiones hijas, 1 vistas y 0 vistas materializadas;

**Tablas ordinarias (26):**

```text
pass.catalog_item_collections
pass.catalog_item_customization_template_assignments
pass.catalog_item_customization_template_groups
pass.catalog_item_customization_templates
pass.catalog_item_option_consumption_rules
pass.catalog_item_option_groups
pass.catalog_item_option_recipe_effects
pass.catalog_item_options
pass.catalog_item_presentation
pass.catalog_items
pass.catalog_option_visual_assets
pass.commercial_categories
pass.commercial_collection_categories
pass.commercial_collections
pass.delivery_addresses
pass.delivery_distance_rates
pass.delivery_quotes
pass.loyalty_redemptions
pass.loyalty_rewards
pass.loyalty_transactions
pass.pass_satellites
pass.site_business_hours
pass.site_delivery_slots
pass.site_schedule_exception_resolutions
pass.site_schedule_exceptions
pass.user_favorites
```

**Vistas (1):**

```text
pass.sell_products_by_site
```

##### 11. `payments`

- clasificación vigente: `GOBERNADO_VENTO` / `VENTO_DOMAIN_SCHEMA`;
- huella: 2 tablas ordinarias, 0 tablas particionadas, 0 particiones hijas, 0 vistas y 0 vistas materializadas;

**Tablas ordinarias (2):**

```text
payments.transactions
payments.webhook_events
```

##### 12. `pg_catalog`

- clasificación vigente: `ADMINISTRADO_SUPABASE_POSTGRES` / `POSTGRES_CORE_MANAGED`;
- huella: 64 tablas ordinarias, 0 tablas particionadas, 0 particiones hijas, 78 vistas y 0 vistas materializadas;

**Tablas ordinarias (64):**

```text
pg_catalog.pg_aggregate
pg_catalog.pg_am
pg_catalog.pg_amop
pg_catalog.pg_amproc
pg_catalog.pg_attrdef
pg_catalog.pg_attribute
pg_catalog.pg_auth_members
pg_catalog.pg_authid
pg_catalog.pg_cast
pg_catalog.pg_class
pg_catalog.pg_collation
pg_catalog.pg_constraint
pg_catalog.pg_conversion
pg_catalog.pg_database
pg_catalog.pg_db_role_setting
pg_catalog.pg_default_acl
pg_catalog.pg_depend
pg_catalog.pg_description
pg_catalog.pg_enum
pg_catalog.pg_event_trigger
pg_catalog.pg_extension
pg_catalog.pg_foreign_data_wrapper
pg_catalog.pg_foreign_server
pg_catalog.pg_foreign_table
pg_catalog.pg_index
pg_catalog.pg_inherits
pg_catalog.pg_init_privs
pg_catalog.pg_language
pg_catalog.pg_largeobject
pg_catalog.pg_largeobject_metadata
pg_catalog.pg_namespace
pg_catalog.pg_opclass
pg_catalog.pg_operator
pg_catalog.pg_opfamily
pg_catalog.pg_parameter_acl
pg_catalog.pg_partitioned_table
pg_catalog.pg_policy
pg_catalog.pg_proc
pg_catalog.pg_publication
pg_catalog.pg_publication_namespace
pg_catalog.pg_publication_rel
pg_catalog.pg_range
pg_catalog.pg_replication_origin
pg_catalog.pg_rewrite
pg_catalog.pg_seclabel
pg_catalog.pg_sequence
pg_catalog.pg_shdepend
pg_catalog.pg_shdescription
pg_catalog.pg_shseclabel
pg_catalog.pg_statistic
pg_catalog.pg_statistic_ext
pg_catalog.pg_statistic_ext_data
pg_catalog.pg_subscription
pg_catalog.pg_subscription_rel
pg_catalog.pg_tablespace
pg_catalog.pg_transform
pg_catalog.pg_trigger
pg_catalog.pg_ts_config
pg_catalog.pg_ts_config_map
pg_catalog.pg_ts_dict
pg_catalog.pg_ts_parser
pg_catalog.pg_ts_template
pg_catalog.pg_type
pg_catalog.pg_user_mapping
```

**Vistas (78):**

```text
pg_catalog.pg_available_extension_versions
pg_catalog.pg_available_extensions
pg_catalog.pg_backend_memory_contexts
pg_catalog.pg_config
pg_catalog.pg_cursors
pg_catalog.pg_file_settings
pg_catalog.pg_group
pg_catalog.pg_hba_file_rules
pg_catalog.pg_ident_file_mappings
pg_catalog.pg_indexes
pg_catalog.pg_locks
pg_catalog.pg_matviews
pg_catalog.pg_policies
pg_catalog.pg_prepared_statements
pg_catalog.pg_prepared_xacts
pg_catalog.pg_publication_tables
pg_catalog.pg_replication_origin_status
pg_catalog.pg_replication_slots
pg_catalog.pg_roles
pg_catalog.pg_rules
pg_catalog.pg_seclabels
pg_catalog.pg_sequences
pg_catalog.pg_settings
pg_catalog.pg_shadow
pg_catalog.pg_shmem_allocations
pg_catalog.pg_stat_activity
pg_catalog.pg_stat_all_indexes
pg_catalog.pg_stat_all_tables
pg_catalog.pg_stat_archiver
pg_catalog.pg_stat_bgwriter
pg_catalog.pg_stat_checkpointer
pg_catalog.pg_stat_database
pg_catalog.pg_stat_database_conflicts
pg_catalog.pg_stat_gssapi
pg_catalog.pg_stat_io
pg_catalog.pg_stat_progress_analyze
pg_catalog.pg_stat_progress_basebackup
pg_catalog.pg_stat_progress_cluster
pg_catalog.pg_stat_progress_copy
pg_catalog.pg_stat_progress_create_index
pg_catalog.pg_stat_progress_vacuum
pg_catalog.pg_stat_recovery_prefetch
pg_catalog.pg_stat_replication
pg_catalog.pg_stat_replication_slots
pg_catalog.pg_stat_slru
pg_catalog.pg_stat_ssl
pg_catalog.pg_stat_subscription
pg_catalog.pg_stat_subscription_stats
pg_catalog.pg_stat_sys_indexes
pg_catalog.pg_stat_sys_tables
pg_catalog.pg_stat_user_functions
pg_catalog.pg_stat_user_indexes
pg_catalog.pg_stat_user_tables
pg_catalog.pg_stat_wal
pg_catalog.pg_stat_wal_receiver
pg_catalog.pg_stat_xact_all_tables
pg_catalog.pg_stat_xact_sys_tables
pg_catalog.pg_stat_xact_user_functions
pg_catalog.pg_stat_xact_user_tables
pg_catalog.pg_statio_all_indexes
pg_catalog.pg_statio_all_sequences
pg_catalog.pg_statio_all_tables
pg_catalog.pg_statio_sys_indexes
pg_catalog.pg_statio_sys_sequences
pg_catalog.pg_statio_sys_tables
pg_catalog.pg_statio_user_indexes
pg_catalog.pg_statio_user_sequences
pg_catalog.pg_statio_user_tables
pg_catalog.pg_stats
pg_catalog.pg_stats_ext
pg_catalog.pg_stats_ext_exprs
pg_catalog.pg_tables
pg_catalog.pg_timezone_abbrevs
pg_catalog.pg_timezone_names
pg_catalog.pg_user
pg_catalog.pg_user_mappings
pg_catalog.pg_views
pg_catalog.pg_wait_events
```

##### 13. `pg_toast`

- clasificación vigente: `ADMINISTRADO_SUPABASE_POSTGRES` / `POSTGRES_CORE_MANAGED`;
- huella: 0 tablas ordinarias, 0 tablas particionadas, 0 particiones hijas, 0 vistas y 0 vistas materializadas;

```text
SIN OBJETOS DE TIPO r, p, v O m EN EL CORTE OBSERVADO
```

##### 14. `pgbouncer`

- clasificación vigente: `ADMINISTRADO_SUPABASE_POSTGRES` / `SUPABASE_INFRASTRUCTURE_MANAGED`;
- huella: 0 tablas ordinarias, 0 tablas particionadas, 0 particiones hijas, 0 vistas y 0 vistas materializadas;

```text
SIN OBJETOS DE TIPO r, p, v O m EN EL CORTE OBSERVADO
```

##### 15. `pos`

- clasificación vigente: `GOBERNADO_VENTO` / `VENTO_DOMAIN_SCHEMA`;
- huella: 13 tablas ordinarias, 0 tablas particionadas, 0 particiones hijas, 0 vistas y 0 vistas materializadas;

**Tablas ordinarias (13):**

```text
pos.pos_cash_movements
pos.pos_cash_shifts
pos.pos_modifier_options
pos.pos_modifiers
pos.pos_order_item_modifiers
pos.pos_payments
pos.pos_product_modifiers
pos.pos_session_orders
pos.pos_sessions
pos.pos_table_call_devices
pos.pos_table_service_calls
pos.pos_tables
pos.pos_zones
```

##### 16. `public`

- clasificación vigente: `GOBERNADO_VENTO` / `VENTO_SHARED_STANDARD_CONTAINER`;
- huella: 185 tablas ordinarias, 0 tablas particionadas, 0 particiones hijas, 61 vistas y 0 vistas materializadas;

**Tablas ordinarias (185):**

```text
public.account_deletion_requests
public.announcements
public.app_config
public.app_content_blocks
public.app_navigation_items
public.app_operation_policies
public.app_permissions
public.app_runtime_settings
public.app_screen_registry
public.app_update_policies
public.apps
public.area_kinds
public.areas
public.asistencia_logs
public.asset_count_lines
public.asset_count_sessions
public.asset_documents
public.asset_groups
public.asset_items
public.asset_maintenance_records
public.asset_movements
public.attendance_breaks
public.attendance_logs
public.attendance_policy
public.attendance_shift_events
public.attendance_sync_conflicts
public.client_billing_profiles
public.client_push_tokens
public.context_simulation_sessions
public.cost_centers
public.document_types
public.documents
public.employee_area_purpose_assignments
public.employee_areas
public.employee_devices
public.employee_inventory_location_assignments
public.employee_permissions
public.employee_push_tokens
public.employee_settings
public.employee_shifts
public.employee_site_operational_profiles
public.employee_sites
public.employee_wallet_cards
public.employees
public.gift_recipient_events
public.gift_recipients
public.internal_job_secrets
public.internal_pos_document_lines
public.internal_pos_document_sequences
public.internal_pos_documents
public.internal_price_list_items
public.internal_price_lists
public.internal_transfer_variances
public.inventory_cost_policies
public.inventory_count_line_entries
public.inventory_count_lines
public.inventory_count_sessions
public.inventory_entries
public.inventory_entry_corrections
public.inventory_entry_items
public.inventory_form_drafts
public.inventory_location_positions
public.inventory_location_product_catalog
public.inventory_locations
public.inventory_lpn_items
public.inventory_lpns
public.inventory_movement_types
public.inventory_movements
public.inventory_stock_by_location
public.inventory_stock_by_position
public.inventory_stock_by_site
public.inventory_stock_by_uom_profile
public.inventory_transfer_items
public.inventory_transfers
public.inventory_unit_aliases
public.inventory_units
public.loyalty_external_sales
public.numera_cost_center_budgets
public.numera_expense_categories
public.numera_expenses
public.numera_periods
public.operational_role_permissions
public.operational_roles
public.order_billing_requests
public.order_conversations
public.order_delivery_sessions
public.order_gift_details
public.order_item_options
public.order_items
public.order_messages
public.order_status_events
public.orders
public.printing_label_templates
public.procurement_agreed_prices
public.procurement_reception_items
public.procurement_receptions
public.procurement_supplier_product_costs
public.product_asset_maintenance_events
public.product_asset_profiles
public.product_asset_transfer_events
public.product_categories
public.product_categories_backup_20260316_preparaciones
public.product_configuration_batches
public.product_cost_events
public.product_fulfillment_routes
public.product_images
public.product_inventory_profiles
public.product_master_review_requests
public.product_request_policies
public.product_request_policy_presentations
public.product_site_area_remission_categories
public.product_site_production_routes
public.product_site_settings
public.product_sku_aliases
public.product_sku_sequences
public.product_suppliers
public.product_uom_profiles
public.production_batch_consumptions
public.production_batch_outputs
public.production_batch_packages
public.production_batches
public.production_request_items
public.production_requests
public.products
public.pulso_daily_sales_import_batches
public.pulso_daily_sales_import_rows
public.pulso_external_sales_item_mappings
public.pulso_sales_consumption_rules
public.pulso_sales_inventory_postings
public.purchase_order_items
public.purchase_orders
public.recipe_cards
public.recipe_outputs
public.recipe_site_uses
public.recipe_steps
public.recipes
public.remission_dispatch_runs
public.remission_exceptions
public.remission_product_categories
public.remission_receipt_items
public.remission_receipts
public.remission_shipment_items
public.remission_shipments
public.required_document_rules
public.restock_item_fulfillments
public.restock_request_item_picks
public.restock_request_items
public.restock_requests
public.role_capabilities
public.role_permissions
public.role_site_type_rules
public.roles
public.shared_device_actor_signatures
public.shared_operational_device_actor_policies
public.shared_operational_device_actor_sessions
public.shared_operational_device_apps
public.shared_operational_device_events
public.shared_operational_device_template_actor_policies
public.shared_operational_device_template_apps
public.shared_operational_device_templates
public.shared_operational_devices
public.shift_policy
public.shift_runtime_events
public.site_area_purpose_rules
public.site_attendance_policy
public.site_operational_capabilities
public.site_operational_roles
public.site_production_pick_order
public.site_purpose_settings
public.site_supply_routes
public.sites
public.staff_invitations
public.staff_manual_calendar_events
public.staff_schedule_hidden_employees
public.staging_insumos_import
public.suppliers
public.support_messages
public.support_ticket_reads
public.support_tickets
public.user_feedback
public.users
public.wallet_devices
public.wallet_passes
public.website_blocks
public.website_items
```

**Vistas (61):**

```text
public.catalog_item_customization_template_assignments
public.catalog_item_customization_template_groups
public.catalog_item_customization_templates
public.catalog_item_option_consumption_rules
public.catalog_item_option_groups
public.catalog_item_option_recipe_effects
public.catalog_item_options
public.catalog_item_presentation
public.catalog_items
public.catalog_option_visual_assets
public.commercial_categories
public.commercial_collection_categories
public.commercial_collections
public.employee_attendance_status
public.loyalty_redemptions
public.loyalty_rewards
public.loyalty_transactions
public.numera_cost_center_monthly_summary
public.operational_sites
public.pass_delivery_distance_rates
public.pass_satellites
public.permission_catalog_human_v1
public.pos_cash_movements
public.pos_cash_shifts
public.pos_modifier_options
public.pos_modifiers
public.pos_order_item_modifiers
public.pos_payments
public.pos_product_modifiers
public.pos_session_orders
public.pos_sessions
public.pos_table_call_devices
public.pos_table_service_calls
public.pos_tables
public.pos_zones
public.product_request_policy_audit
public.product_request_policy_audit_summary
public.product_request_policy_usage
public.pulso_sales_import_rows_pending_consumption
public.sell_products_by_site
public.shared_operational_device_actor_policies_admin_v1
public.shared_operational_device_templates_admin_v1
public.shared_operational_devices_admin_v1
public.shift_calendar_view
public.user_favorites
public.v_asset_count_session_summary
public.v_asset_groups_inventory_status
public.v_asset_items_inventory_status
public.v_inventory_catalog
public.v_inventory_stock_by_location
public.v_ops_restock_product_gaps
public.v_ops_site_readiness
public.v_procurement_price_book
public.v_site_area_operational_diagnostics
public.v_site_production_route_diagnostics
public.vento_operational_roles_v1
public.vento_site_operational_role_matrix_v1
public.viso_employee_site_operational_profiles
public.viso_operational_checkin_points
public.viso_operational_sites
public.viso_site_operational_roles
```

##### 17. `realtime`

- clasificación vigente: `ADMINISTRADO_SUPABASE_POSTGRES` / `SUPABASE_PRODUCT_MANAGED`;
- huella: 2 tablas ordinarias, 1 tablas particionadas, 7 particiones hijas, 0 vistas y 0 vistas materializadas;

**Tablas ordinarias (2):**

```text
realtime.schema_migrations
realtime.subscription
```

**Tablas particionadas (1):**

```text
realtime.messages
```

**Particiones hijas (7):**

```text
realtime.messages_2026_07_26
realtime.messages_2026_07_27
realtime.messages_2026_07_28
realtime.messages_2026_07_29
realtime.messages_2026_07_30
realtime.messages_2026_07_31
realtime.messages_2026_08_01
```

##### 18. `storage`

- clasificación vigente: `ADMINISTRADO_SUPABASE_POSTGRES` / `SUPABASE_PRODUCT_MANAGED`;
- huella: 8 tablas ordinarias, 0 tablas particionadas, 0 particiones hijas, 0 vistas y 0 vistas materializadas;

**Tablas ordinarias (8):**

```text
storage.buckets
storage.buckets_analytics
storage.buckets_vectors
storage.migrations
storage.objects
storage.s3_multipart_uploads
storage.s3_multipart_uploads_parts
storage.vector_indexes
```

##### 19. `supabase_migrations`

- clasificación vigente: `ADMINISTRADO_SUPABASE_POSTGRES` / `SUPABASE_CLI_MANAGED`;
- huella: 1 tablas ordinarias, 0 tablas particionadas, 0 particiones hijas, 0 vistas y 0 vistas materializadas;

**Tablas ordinarias (1):**

```text
supabase_migrations.schema_migrations
```

##### 20. `talento`

- clasificación vigente: `GOBERNADO_VENTO` / `VENTO_DOMAIN_SCHEMA`;
- huella: 13 tablas ordinarias, 0 tablas particionadas, 0 particiones hijas, 0 vistas y 0 vistas materializadas;

**Tablas ordinarias (13):**

```text
talento.application_events
talento.application_requirements
talento.application_stage_history
talento.applications
talento.candidate_documents
talento.candidate_employee_links
talento.candidate_profiles
talento.candidates
talento.interviews
talento.medical_evaluations
talento.offers
talento.preboarding_tasks
talento.vacancies
```

##### 21. `vault`

- clasificación vigente: `ADMINISTRADO_SUPABASE_POSTGRES` / `SUPABASE_EXTENSION_MANAGED`;
- huella: 1 tablas ordinarias, 0 tablas particionadas, 0 particiones hijas, 1 vistas y 0 vistas materializadas;

**Tablas ordinarias (1):**

```text
vault.secrets
```

**Vistas (1):**

```text
vault.decrypted_secrets
```

##### 22. `viso`

- clasificación vigente: `GOBERNADO_VENTO` / `VENTO_DOMAIN_SCHEMA`;
- huella: 12 tablas ordinarias, 0 tablas particionadas, 0 particiones hijas, 0 vistas y 0 vistas materializadas;

**Tablas ordinarias (12):**

```text
viso.demand_forecasts
viso.demand_history_hourly
viso.employee_availability
viso.employee_planning_limits
viso.employee_shift_preferences
viso.role_concurrency_limits
viso.shift_generation_candidate_items
viso.shift_generation_candidates
viso.shift_generation_runs
viso.site_operational_roles
viso.site_planning_rules
viso.site_staffing_requirements
```

##### 23. `vital`

- clasificación vigente: `GOBERNADO_VENTO` / `VENTO_DOMAIN_SCHEMA`;
- huella: 54 tablas ordinarias, 0 tablas particionadas, 0 particiones hijas, 0 vistas y 0 vistas materializadas;

**Tablas ordinarias (54):**

```text
vital.academy_staff_assignments
vital.adaptive_decision_logs
vital.admin_users
vital.ai_decision_logs
vital.ai_plan_proposals
vital.availability_profiles
vital.badges
vital.body_metrics
vital.challenge_progress
vital.challenges
vital.consent_records
vital.daily_nutrition_logs_v1
vital.daily_readiness_inputs
vital.fair_play_events
vital.fatigue_scores
vital.feature_flags
vital.football_preset_catalog
vital.game_profiles
vital.goal_profiles
vital.health_profiles
vital.league_memberships
vital.level_states
vital.module_catalog
vital.module_goal_weights_v1
vital.module_interference_rules
vital.module_template_catalog
vital.muscle_load_snapshots
vital.notification_plans
vital.program_versions
vital.programs
vital.readiness_scores
vital.recovery_signals
vital.safety_intake
vital.seasons
vital.session_logs
vital.sport_module_template_catalog
vital.sport_objective_blend_rules
vital.sports_profiles
vital.squad_memberships
vital.squads
vital.starter_program_catalog
vital.starter_program_tasks
vital.task_instances
vital.task_templates
vital.telemetry_events
vital.user_badges
vital.user_cycle_states
vital.user_feature_flags
vital.user_module_preferences
vital.user_nutrition_profiles_v1
vital.user_profiles
vital.weekly_leaderboard_snapshots
vital.weekly_reviews
vital.xp_events
```

#### 14. Hallazgos y resolución documental

| Hallazgo                                                                            | Riesgo                                                              | Tarea responsable de resolverlo                                                                   |
| ----------------------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| el conteo anterior de 431 tablas mezclaba tablas ordinarias con 7 particiones hijas | doble conteo o interpretación incorrecta de capacidad               | `SUPA-AUD-004` deja la semántica corregida; `SUPA-AUD-020` usará esta separación para rendimiento |
| `public` concentra 185 tablas y 61 vistas                                           | frontera compartida sobredimensionada o dominios mezclados          | `SUPA-AUD-022`, `SUPA-ARC-004`, `SUPA-ARC-005` y `SUPA-TRANS-001`                                 |
| 12 objetos tabulares Vento no tienen RLS observado                                  | acceso no evaluado o falsa alarma por ignorar grants y aislamiento  | `SUPA-AUD-009`                                                                                    |
| 4 vistas Vento no tienen `security_invoker=true`                                    | ejecución con privilegios del owner sin evaluación contextual       | `SUPA-AUD-009` y `SUPA-AUD-016`                                                                   |
| `net` contiene 2 tablas `UNLOGGED`                                                  | pérdida aceptada o no comprendida ante crash                        | `SUPA-AUD-014`, `SUPA-AUD-015` y `SUPA-AUD-020`                                                   |
| las particiones `realtime.messages_*` cambian con el tiempo                         | drift normal del servicio confundido con cambio manual              | `SUPA-AUD-013`, `SUPA-AUD-016`, `SUPA-AUD-017` y `SUPA-AUD-020`                                   |
| 207 relaciones tienen comentario y 433 no                                           | contexto insuficiente o confianza excesiva en comentarios parciales | `SUPA-AUD-022` y `SUPA-ARC-001`                                                                   |
| no existen vistas materializadas                                                    | ausencia no protegida frente a aparición no gobernada               | `SUPA-AUD-017` y `SUPA-AUD-020`                                                                   |

No queda un hallazgo diferido sin tarea responsable.

#### 15. Decisiones que esta tarea no toma

Queda prohibido usar este inventario, por sí solo, para:

1. declarar un objeto legacy o duplicado;
2. asignar dominio o aplicación propietaria;
3. aprobar o rechazar RLS, grants u owners;
4. inferir exposición Data API;
5. mover objetos entre esquemas;
6. eliminar tablas, vistas o particiones;
7. definir claves, constraints, índices o retención;
8. concluir que una vista con `security_invoker=false` es insegura sin contexto;
9. concluir que una tabla sin RLS es accesible por roles cliente;
10. tratar tamaño o `reltuples` como conteo exacto de filas.

#### 16. Requisitos de prueba derivados

```text
TREQ-SUPABASE-050 a TREQ-SUPABASE-061
```

Los requisitos protegen:

- cobertura individual de las 640 relaciones;
- tipificación correcta de tablas y particiones;
- representación de los 23 esquemas, incluidos los vacíos;
- jerarquía y bounds de partición;
- metadatos técnicos mínimos;
- persistencia `UNLOGGED` explícita;
- separación entre observación RLS y decisión de seguridad;
- opciones `security_invoker` y `security_barrier`;
- ausencia explícita de vistas materializadas;
- reconciliación por gobierno estructural;
- procedencia del corte;
- huellas deterministas y detección de drift.

El detalle completo queda incorporado en `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`.

#### 17. Invariantes y huellas

```text
SCHEMAS_NO_EFIMEROS = 23
RELATIONS_TOTAL = 640
ORDINARY_TABLES = 424
PARTITIONED_TABLES = 1
PARTITION_CHILDREN = 7
RELKIND_R_TOTAL = 431
VIEWS = 208
MATERIALIZED_VIEWS = 0
PERMANENT_RELATIONS = 638
UNLOGGED_RELATIONS = 2
TEMPORARY_RELATIONS = 0
VENTO_GOVERNED_RELATIONS = 379
MANAGED_RELATIONS = 261
UNCLASSIFIED_RELATIONS = 0
```

```text
RELATION_NAME_REGISTRY_SHA256 = 6acfebdf063f483af03a60d88b9c14e0d95b3eab0e5fbd91e5de525c08937f63
SCHEMA_RELATION_COUNT_MATRIX_SHA256 = 797f86e828a076c19244937431adb1cb854e09ef312dd024df9ad0195e2bbbec
PARTITION_HIERARCHY_SHA256 = ee48c126781ed4e2bf1c137b45c2eac063c135d833bf63dd991f5f926ae506c1
RELATION_INVENTORY_SUMMARY_SHA256 = 201b7b51535a773fa9e33a0e94b5e1dab0ad1d97d487e45cb37916f147caa116
```

Las huellas se calculan sobre registros ordenados y normalizados. Un nombre nuevo, eliminado, reclasificado o reordenado cambia la evidencia y exige revalidación.

### ✅ SUPA-AUD-005 — Inventariar claves primarias, foráneas, constraints, enums y secuencias

**Estado:** APROBADA  
**Fecha:** 2026-07-29  
**Bloque:** BLOQUE E3 — Arquitectura canónica de datos y gobierno integral de Supabase  
**Tarea anterior:** `SUPA-AUD-004 — Inventariar tablas, particiones, vistas y vistas materializadas` — APROBADA  
**Tarea siguiente:** `SUPA-AUD-006 — Inventariar funciones, RPC, procedimientos y firmas públicas`  
**Descripción:** Inventaría las claves primarias, claves foráneas, restricciones estructurales, columnas `NOT NULL`, tipos enum y secuencias observables en los 23 esquemas no efímeros, preservando su estado de validación, dependencias y gobierno sin aprobar todavía correcciones, rediseños ni migraciones.

#### 1. Objetivo

Crear una línea base reproducible de integridad estructural para las **432 relaciones tabulares** inventariadas en `SUPA-AUD-004`, junto con los tipos enum y secuencias de los 23 esquemas no efímeros.

```text
2.057 CONSTRAINTS
= 422 PRIMARY KEY
+ 818 FOREIGN KEY
+ 155 UNIQUE
+ 662 CHECK

+ 3.187 COLUMNAS NOT NULL
+ 34 ENUMS / 150 VALORES
+ 7 SECUENCIAS
```

La tarea registra existencia, identidad, definición, validación y dependencia. No concluye que un constraint sea correcto por existir, que una tabla sin PK sea defectuosa por definición, ni que una FK entre esquemas apruebe esa dependencia como arquitectura objetivo.

#### 2. Método de auditoría no mutante

Se consultaron exclusivamente catálogos PostgreSQL mediante `SELECT`:

- `pg_constraint` y `pg_get_constraintdef` para PK, FK, UNIQUE y CHECK;
- `pg_attribute` para columnas `NOT NULL`;
- `pg_type` y `pg_enum` para enums y orden de valores;
- `pg_class`, `pg_sequence` y `pg_depend` para secuencias, persistencia y vínculos;
- `pg_namespace` para mantener el universo de 23 esquemas;
- `pg_inherits` y metadatos de relación para distinguir padres y particiones.

No se ejecutó DDL, DML, `VALIDATE CONSTRAINT`, `ALTER TYPE`, reinicio de secuencias, migración ni cambio de datos.

#### 3. Resultado global de constraints

| Tipo          |  Cantidad | Estado relevante    |
| ------------- | --------: | ------------------- |
| `PRIMARY KEY` |   **422** | todas validadas     |
| `FOREIGN KEY` |   **818** | **1** no validada   |
| `UNIQUE`      |   **155** | todas validadas     |
| `CHECK`       |   **662** | **13** no validadas |
| exclusión     |     **0** | ausencia explícita  |
| otros tipos   |     **0** | ausencia explícita  |
| **Total**     | **2.057** | **14** no validados |

Propiedades transversales:

- constraints `DEFERRABLE`: **0**;
- constraints `INITIALLY DEFERRED`: **0**;
- constraints heredados o no locales: **14**;
- checks `NO INHERIT`: **1.388**;
- columnas `NOT NULL`: **3.187**.

`NOT NULL` se registra separadamente porque PostgreSQL lo representa como atributo de columna en este corte, no como las 2.057 filas de `pg_constraint`.

#### 4. Matriz por esquema

| Esquema               |      PK |      FK |  UNIQUE |   CHECK |     Total | No validados | `NOT NULL` |  Enums | Valores enum | Secuencias |
| --------------------- | ------: | ------: | ------: | ------: | --------: | -----------: | ---------: | -----: | -----------: | ---------: |
| `app_private`         |       1 |       0 |       0 |       1 |         2 |            0 |          3 |      0 |            0 |          0 |
| `auth`                |      23 |      18 |      10 |      43 |        94 |            0 |        111 |      9 |           25 |          1 |
| `club`                |      11 |      15 |       5 |      14 |        45 |            0 |         84 |      0 |            0 |          0 |
| `cron`                |       2 |       0 |       1 |       0 |         3 |            0 |          9 |      0 |            0 |          2 |
| `extensions`          |       0 |       0 |       0 |       0 |         0 |            0 |          0 |      0 |            0 |          0 |
| `graphql`             |       0 |       0 |       0 |       0 |         0 |            0 |          0 |      0 |            0 |          0 |
| `graphql_public`      |       0 |       0 |       0 |       0 |         0 |            0 |          0 |      0 |            0 |          0 |
| `information_schema`  |       0 |       0 |       0 |       2 |         2 |            0 |          0 |      0 |            0 |          0 |
| `net`                 |       0 |       0 |       0 |       1 |         1 |            0 |          5 |      1 |            3 |          1 |
| `pass`                |      26 |      54 |      18 |      86 |       184 |            0 |        236 |      0 |            0 |          0 |
| `payments`            |       2 |       4 |       2 |       2 |        10 |            0 |         20 |      0 |            0 |          0 |
| `pg_catalog`          |      62 |       0 |      48 |       0 |       110 |            0 |        509 |      0 |            0 |          0 |
| `pg_toast`            |       0 |       0 |       0 |       0 |         0 |            0 |          0 |      0 |            0 |          0 |
| `pgbouncer`           |       0 |       0 |       0 |       0 |         0 |            0 |          0 |      0 |            0 |          0 |
| `pos`                 |      13 |      33 |       2 |       6 |        54 |            0 |         81 |      0 |            0 |          0 |
| `public`              |     183 |     587 |      51 |     395 |     1.216 |           13 |      1.419 |      7 |           26 |          2 |
| `realtime`            |      10 |       0 |       0 |       9 |        19 |            1 |         48 |      2 |           18 |          1 |
| `storage`             |       8 |       5 |       1 |       0 |        14 |            0 |         41 |      1 |            3 |          0 |
| `supabase_migrations` |       1 |       0 |       1 |       0 |         2 |            0 |          1 |      0 |            0 |          0 |
| `talento`             |      13 |      14 |       6 |       0 |        33 |            0 |         87 |      7 |           49 |          0 |
| `vault`               |       1 |       0 |       0 |       0 |         1 |            0 |          5 |      0 |            0 |          0 |
| `viso`                |      12 |      19 |       7 |      16 |        54 |            0 |        123 |      0 |            0 |          0 |
| `vital`               |      54 |      69 |       3 |      87 |       213 |            0 |        405 |      7 |           26 |          0 |
| **TOTAL**             | **422** | **818** | **155** | **662** | **2.057** |       **14** |  **3.187** | **34** |      **150** |      **7** |

#### 5. Distribución por gobierno estructural

| Clase                            | Constraints |      PK |      FK |  UNIQUE |   CHECK | No validados |  Enums | Valores enum | Secuencias |
| -------------------------------- | ----------: | ------: | ------: | ------: | ------: | -----------: | -----: | -----------: | ---------: |
| `GOBERNADO_VENTO`                |   **1.811** |     315 |     795 |      94 |     607 |           13 |     21 |          101 |          2 |
| `ADMINISTRADO_SUPABASE_POSTGRES` |     **246** |     107 |      23 |      61 |      55 |            1 |     13 |           49 |          5 |
| **TOTAL**                        |   **2.057** | **422** | **818** | **155** | **662** |       **14** | **34** |      **150** |      **7** |

La distribución no autoriza modificar objetos administrados ni conservar automáticamente la estructura actual de los esquemas Vento.

#### 6. Cobertura de claves primarias

Se observaron **432 objetos tabulares**: 424 tablas ordinarias, una tabla particionada y siete particiones hijas. **422** tienen PK y **10** no tienen PK propia.

| Esquema              | Objeto sin PK                                      | Clase                          |
| -------------------- | -------------------------------------------------- | ------------------------------ |
| `information_schema` | `sql_features`                                     | administrado                   |
| `information_schema` | `sql_implementation_info`                          | administrado                   |
| `information_schema` | `sql_parts`                                        | administrado                   |
| `information_schema` | `sql_sizing`                                       | administrado                   |
| `net`                | `_http_response`                                   | administrado / extensión       |
| `net`                | `http_request_queue`                               | administrado / extensión       |
| `pg_catalog`         | `pg_depend`                                        | administrado                   |
| `pg_catalog`         | `pg_shdepend`                                      | administrado                   |
| `public`             | `product_categories_backup_20260316_preparaciones` | Vento / backup legacy aparente |
| `public`             | `staging_insumos_import`                           | Vento / staging aparente       |

Las ocho ausencias administradas no son brechas de diseño de Vento. Las dos tablas de `public` deberán clasificarse por vigencia, fuente de verdad y retiro en `SUPA-AUD-018` y `SUPA-AUD-019`; esta tarea no aprueba agregarles PK ni conservarlas.

#### 7. Constraints no validados

Se observaron **14** constraints con `convalidated=false`.

| Esquema    | Tabla                       | Constraint                                               | Tipo               |
| ---------- | --------------------------- | -------------------------------------------------------- | ------------------ |
| `public`   | `app_screen_registry`       | `app_screen_registry_navigation_kind_check`              | CHECK              |
| `public`   | `cost_centers`              | `cost_centers_code_not_blank`                            | CHECK              |
| `public`   | `cost_centers`              | `cost_centers_type_check`                                | CHECK              |
| `public`   | `production_batch_packages` | `production_batch_packages_original_qty_chk`             | CHECK              |
| `public`   | `production_batch_packages` | `production_batch_packages_remaining_qty_chk`            | CHECK              |
| `public`   | `production_batch_packages` | `production_batch_packages_reserved_qty_chk`             | CHECK              |
| `public`   | `products`                  | `products_sku_format_chk`                                | CHECK              |
| `public`   | `recipe_site_uses`          | `recipe_site_uses_location_chk`                          | CHECK              |
| `public`   | `restock_request_items`     | `restock_request_items_transfer_total_non_negative`      | CHECK              |
| `public`   | `restock_request_items`     | `restock_request_items_transfer_unit_price_non_negative` | CHECK              |
| `public`   | `restock_requests`          | `restock_requests_pricing_mode_check`                    | CHECK              |
| `public`   | `restock_requests`          | `restock_requests_pricing_status_check`                  | CHECK              |
| `public`   | `site_operational_roles`    | `site_operational_roles_role_code_fkey`                  | FK                 |
| `realtime` | `messages`                  | `messages_payload_exclusive`                             | CHECK administrado |

Un constraint `NOT VALID` se aplica a nuevas escrituras, pero no certifica que todas las filas históricas cumplan. Los trece objetos de `public` deberán contrastarse con datos y migraciones en `SUPA-AUD-016`, `SUPA-AUD-017` y la auditoría de calidad `SUPA-NORM-*`; el constraint de `realtime` permanece bajo gobierno de Supabase.

#### 8. Claves foráneas entre esquemas

De las **818 FK**, **200** cruzan fronteras de esquema. Distribución observada:

| Origen     | Destino    |      FK |
| ---------- | ---------- | ------: |
| `club`     | `auth`     |       8 |
| `club`     | `pass`     |       1 |
| `club`     | `public`   |       1 |
| `pass`     | `auth`     |       4 |
| `pass`     | `public`   |      32 |
| `payments` | `auth`     |       1 |
| `payments` | `public`   |       2 |
| `pos`      | `public`   |      18 |
| `public`   | `auth`     |      60 |
| `public`   | `pass`     |       8 |
| `public`   | `payments` |       1 |
| `public`   | `pos`      |       1 |
| `viso`     | `public`   |      17 |
| `vital`    | `auth`     |      45 |
| `vital`    | `public`   |       1 |
| **TOTAL**  | —          | **200** |

Estas FK prueban dependencia física actual, no propiedad funcional ni arquitectura canónica. `SUPA-AUD-022` deberá asignar objeto, capacidad y propietario; `SUPA-AUD-019` detectará fuentes competidoras; `SUPA-ARC-*` decidirá fronteras objetivo.

#### 9. Inventario de enums

| Esquema    | Enum                          | Valores ordenados                                           |
| ---------- | ----------------------------- | ----------------------------------------------------------- |
| `auth`     | `aal_level`                   | `aal1`, `aal2`, `aal3`                                      |
| `auth`     | `code_challenge_method`       | `s256`, `plain`                                             |
| `auth`     | `factor_status`               | `unverified`, `verified`                                    |
| `auth`     | `factor_type`                 | `totp`, `webauthn`, `phone`                                 |
| `auth`     | `oauth_authorization_status`  | `pending`, `approved`, `denied`, `expired`                  |
| `auth`     | `oauth_client_type`           | `public`, `confidential`                                    |
| `auth`     | `oauth_registration_type`     | `dynamic`, `manual`                                         |
| `auth`     | `oauth_response_type`         | `code`                                                      |
| `auth`     | `one_time_token_type`         | 6 valores administrados                                     |
| `net`      | `request_status`              | `PENDING`, `SUCCESS`, `ERROR`                               |
| `public`   | `document_scope`              | `employee`, `site`, `group`                                 |
| `public`   | `document_status`             | `pending_review`, `approved`, `rejected`                    |
| `public`   | `employee_wallet_card_status` | `eligible`, `issued`, `revoked`, `expired`, `blocked`       |
| `public`   | `permission_scope_type`       | `global`, `site`, `site_type`, `area`, `area_kind`          |
| `public`   | `recipe_status`               | `draft`, `published`, `archived`                            |
| `public`   | `site_type`                   | `satellite`, `production_center`, `admin`                   |
| `public`   | `support_ticket_status`       | `open`, `in_progress`, `resolved`, `closed`                 |
| `realtime` | `action`                      | `INSERT`, `UPDATE`, `DELETE`, `TRUNCATE`, `ERROR`           |
| `realtime` | `equality_op`                 | 13 operadores administrados                                 |
| `storage`  | `buckettype`                  | `STANDARD`, `ANALYTICS`, `VECTOR`                           |
| `talento`  | `application_status`          | 13 estados                                                  |
| `talento`  | `document_status`             | 6 estados                                                   |
| `talento`  | `interview_status`            | 6 estados                                                   |
| `talento`  | `medical_status`              | 6 estados                                                   |
| `talento`  | `offer_status`                | 5 estados                                                   |
| `talento`  | `requirement_status`          | 5 estados                                                   |
| `talento`  | `stage_code`                  | 8 etapas                                                    |
| `vital`    | `challenge_scope`             | `personal`, `squad`, `company`                              |
| `vital`    | `competition_mode`            | `private`, `friends`, `team`, `public`                      |
| `vital`    | `fair_play_severity`          | `low`, `medium`, `high`                                     |
| `vital`    | `league_tier`                 | `bronze`, `silver`, `gold`, `platinum`, `titan`             |
| `vital`    | `profile_context`             | `personal`, `employee`                                      |
| `vital`    | `program_status`              | `draft`, `active`, `paused`, `archived`                     |
| `vital`    | `task_status`                 | `pending`, `in_progress`, `completed`, `skipped`, `snoozed` |

Los nombres repetidos entre esquemas, como `document_status`, son tipos distintos. Su consolidación o permanencia se decidirá en `SUPA-AUD-021` y `SUPA-ARC-*`, no por coincidencia nominal.

#### 10. Inventario de secuencias

| Esquema    | Secuencia                   | Persistencia | Vínculo observado                                                    |
| ---------- | --------------------------- | ------------ | -------------------------------------------------------------------- |
| `auth`     | `refresh_tokens_id_seq`     | permanente   | owned by `auth.refresh_tokens.id`                                    |
| `cron`     | `jobid_seq`                 | permanente   | uso administrado por `pg_cron`; sin dependencia `OWNED BY` observada |
| `cron`     | `runid_seq`                 | permanente   | uso administrado por `pg_cron`; sin dependencia `OWNED BY` observada |
| `net`      | `http_request_queue_id_seq` | `UNLOGGED`   | owned by `net.http_request_queue.id`                                 |
| `public`   | `inventory_sku_seq`         | permanente   | secuencia Vento sin dependencia `OWNED BY` observada                 |
| `public`   | `lpn_sequence`              | permanente   | secuencia Vento sin dependencia `OWNED BY` observada                 |
| `realtime` | `subscription_id_seq`       | permanente   | dependencia interna de identidad con `realtime.subscription.id`      |

Todas usan `bigint`, inicio 1, incremento 1, caché 1 y `NO CYCLE`. Las dos secuencias Vento de `public` deberán conservar consumidor, función generadora, concurrencia y política de no reutilización en `SUPA-AUD-006`, `SUPA-AUD-016` y `SUPA-AUD-020`; la ausencia de `OWNED BY` no autoriza alterarlas.

#### 11. Hallazgos y destino documental

| Hallazgo                             | Riesgo                                                        | Tarea responsable                                        |
| ------------------------------------ | ------------------------------------------------------------- | -------------------------------------------------------- |
| dos tablas Vento sin PK              | duplicados o identidad ambigua si continúan activas           | `SUPA-AUD-018`, `SUPA-AUD-019`                           |
| trece constraints Vento no validados | datos históricos incompatibles con reglas declaradas          | `SUPA-AUD-016`, `SUPA-AUD-017`, `SUPA-NORM-*`            |
| 200 FK entre esquemas                | acoplamiento físico convertido en arquitectura implícita      | `SUPA-AUD-019`, `SUPA-AUD-022`, `SUPA-ARC-*`             |
| 21 enums Vento                       | contratos rígidos o duplicados no gobernados                  | `SUPA-AUD-021`, `SUPA-ARC-*`                             |
| dos secuencias Vento sin `OWNED BY`  | dependencia invisible, colisión o reinicio incorrecto         | `SUPA-AUD-006`, `SUPA-AUD-016`, `SUPA-AUD-020`           |
| cero constraints diferibles          | ciclos o transacciones complejas no pueden diferir validación | `SUPA-AUD-019`, `SUPA-ARC-*` solo si un proceso lo exige |

No queda hallazgo narrativo sin tarea responsable.

#### 12. Requisitos de prueba derivados

Se incorporan al registro canónico:

```text
TREQ-SUPABASE-062 a TREQ-SUPABASE-073
```

Protegen clasificación completa, reconciliación por esquema, cobertura PK, constraints no validados, FK cruzadas, enums, secuencias, procedencia y drift.

#### 13. Huellas de integridad

```text
CONSTRAINT_REGISTRY_SHA256 = 01e934fc142742e278d6f5eac23c1db029478221b6e0cdded6e8d9421b1bba9f
ENUM_REGISTRY_SHA256 = d04bcc6c6750c0463c8568adba65011c6be2f0f94d1f66864faf170ca7c61e73
SEQUENCE_REGISTRY_SHA256 = 2fe6eefbae8fbb8c14f41d2e0b5a3f12a1e246e9fe294134561f830d659ccb24
CROSS_SCHEMA_FK_REGISTRY_SHA256 = 4e7cc9b3f33f68772176b50caa4f943fdb8eca08370c7499919ed71ed5f633c2
```

Cualquier cambio en cantidades, definiciones, validación, orden de enums, secuencias o dependencias deberá registrarse como drift en `SUPA-AUD-017` antes de utilizar el inventario para arquitectura o transición.

#### 14. Resultado final

`SUPA-AUD-005` deja inventariados y reconciliados:

- **2.057 constraints**;
- **422 PK**, **818 FK**, **155 UNIQUE** y **662 CHECK**;
- **3.187** columnas `NOT NULL`;
- **14** constraints no validados;
- **10** objetos tabulares sin PK propia;
- **200** FK entre esquemas;
- **34** enums y **150** valores ordenados;
- **7** secuencias, cinco administradas y dos Vento.

La tarea no modifica la base ni aprueba correcciones. Proporciona la línea base para funciones, triggers, RLS, drift, normalización, arquitectura objetivo y transición.


### ✅ SUPA-AUD-006 — Inventariar funciones, RPC, procedimientos y firmas públicas

**Estado:** APROBADA
**Fecha:** 2026-07-29
**Bloque:** BLOQUE E3 — Arquitectura canónica de datos y gobierno integral de Supabase
**Tarea anterior:** `SUPA-AUD-005 — Inventariar claves primarias, foráneas, constraints, enums y secuencias` — APROBADA
**Tarea siguiente:** `SUPA-AUD-007 — Inventariar triggers y automatismos de base de datos`
**Descripción:** Inventaría las rutinas PostgreSQL observables en los 23 esquemas no efímeros, separa funciones normales, agregados, funciones de ventana, procedimientos, funciones de trigger y firmas invocables como RPC; registra privilegios de ejecución, modo de seguridad, configuración de `search_path`, sobrecargas y defectos estructurales comprobables, sin ejecutar rutinas mutantes ni aprobar correcciones físicas.

#### 1. Objetivo

Crear una línea base reproducible de las rutinas remotas y de la superficie RPC que puede ser consumida por aplicaciones, Edge Functions, automatizaciones o actores de base de datos.

```text
3.794 RUTINAS REMOTAS
= 3.622 FUNCIONES NORMALES
+ 157 AGREGADOS
+ 15 FUNCIONES DE VENTANA
+ 0 PROCEDIMIENTOS

347 FIRMAS EN ESQUEMAS GOBERNADOS POR VENTO
= 274 FIRMAS DIRECTAMENTE INVOCABLES
+ 73 FUNCIONES DE TRIGGER
```

La existencia de una función no certifica que su cuerpo sea correcto, que tenga autorización suficiente, que sus grants sean apropiados ni que haya sido ejecutada con éxito en producción.

#### 2. Método de auditoría no mutante

Se consultaron exclusivamente catálogos PostgreSQL mediante `SELECT`:

- `pg_proc` para identidad, clase, propietario, lenguaje, volatilidad, paralelismo, modo de seguridad y configuración;
- `pg_namespace` para reconciliar los 23 esquemas no efímeros;
- `pg_language` para identificar lenguaje de implementación;
- `pg_get_function_identity_arguments`, `pg_get_function_arguments`, `pg_get_function_result` y `pg_get_functiondef` para firmas y cuerpos;
- `has_function_privilege` para observar `EXECUTE` efectivo de `anon`, `authenticated` y `service_role`;
- `pg_attribute`, `pg_constraint` y `pg_index` para comprobar los tres defectos estructurales informados;
- lectura del consumidor `vento-nexo/src/app/inventory/settings/products/actions.ts` para confirmar que las tres RPC defectuosas están activamente referenciadas.

No se ejecutó ninguna RPC mutante, procedimiento, función de trigger, DDL, DML, migración ni cambio de grants.

#### 3. Resultado global

| Clase de rutina      | Total remoto | Administrado por PostgreSQL/Supabase | Gobernado por Vento |
| -------------------- | -----------: | -----------------------------------: | ------------------: |
| funciones normales   |    **3.622** |                                3.275 |                 347 |
| agregados            |      **157** |                                  157 |                   0 |
| funciones de ventana |       **15** |                                   15 |                   0 |
| procedimientos       |        **0** |                                    0 |                   0 |
| **Total**            |    **3.794** |                            **3.447** |             **347** |

No existe ningún objeto `PROCEDURE` (`prokind='p'`) en el corte remoto. El término RPC usado por Supabase corresponde aquí a funciones expuestas mediante PostgREST, no a procedimientos PostgreSQL.

#### 4. Matriz por esquema

| Esquema               |    Firmas | Nombres distintos | `SECURITY DEFINER` | `SECURITY INVOKER` | Ejecutables por `anon` | Ejecutables por `authenticated` | Gobierno     |
| --------------------- | --------: | ----------------: | -----------------: | -----------------: | ---------------------: | ------------------------------: | ------------ |
| `app_private`         |         1 |                 1 |                  1 |                  0 |                      0 |                               0 | Vento        |
| `auth`                |         4 |                 4 |                  0 |                  4 |                      4 |                               4 | administrado |
| `club`                |         7 |                 7 |                  2 |                  5 |                      5 |                               7 | Vento        |
| `cron`                |         7 |                 5 |                  0 |                  7 |                      5 |                               5 | administrado |
| `extensions`          |        55 |                41 |                  0 |                 55 |                     54 |                              54 | administrado |
| `graphql`             |         0 |                 0 |                  0 |                  0 |                      0 |                               0 | administrado |
| `graphql_public`      |         1 |                 1 |                  0 |                  1 |                      1 |                               1 | administrado |
| `information_schema`  |        11 |                11 |                  0 |                 11 |                     11 |                              11 | administrado |
| `net`                 |        12 |                12 |                  0 |                 12 |                     12 |                              12 | administrado |
| `pass`                |        30 |                30 |                 27 |                  3 |                      5 |                              13 | Vento        |
| `payments`            |         0 |                 0 |                  0 |                  0 |                      0 |                               0 | Vento        |
| `pg_catalog`          |     3.319 |             2.719 |                  0 |              3.319 |                  3.257 |                           3.257 | administrado |
| `pg_toast`            |         0 |                 0 |                  0 |                  0 |                      0 |                               0 | administrado |
| `pgbouncer`           |         1 |                 1 |                  1 |                  0 |                      0 |                               0 | administrado |
| `pos`                 |         0 |                 0 |                  0 |                  0 |                      0 |                               0 | Vento        |
| `public`              |       246 |               241 |                164 |                 82 |                     72 |                             173 | Vento        |
| `realtime`            |        15 |                14 |                  0 |                 15 |                     15 |                              15 | administrado |
| `storage`             |        17 |                17 |                  0 |                 17 |                     17 |                              17 | administrado |
| `supabase_migrations` |         0 |                 0 |                  0 |                  0 |                      0 |                               0 | administrado |
| `talento`             |        16 |                16 |                 11 |                  5 |                      8 |                              15 | Vento        |
| `vault`               |         5 |                 5 |                  2 |                  3 |                      0 |                               0 | administrado |
| `viso`                |         0 |                 0 |                  0 |                  0 |                      0 |                               0 | Vento        |
| `vital`               |        47 |                47 |                  5 |                 42 |                     44 |                              46 | Vento        |
| **TOTAL**             | **3.794** |                 — |            **213** |          **3.581** |              **3.510** |                       **3.630** | —            |

Los grants de rutinas administradas no se interpretan como superficie empresarial de Vento. La revisión contextual de grants, RLS y privilegios efectivos permanece en `SUPA-AUD-009`.

#### 5. Superficie gobernada por Vento

Las **347 firmas Vento** se distribuyen así:

| Esquema       |  Firmas | Directas | Funciones de trigger |
| ------------- | ------: | -------: | -------------------: |
| `app_private` |       1 |        1 |                    0 |
| `club`        |       7 |        7 |                    0 |
| `pass`        |      30 |       20 |                   10 |
| `payments`    |       0 |        0 |                    0 |
| `pos`         |       0 |        0 |                    0 |
| `public`      |     246 |      190 |                   56 |
| `talento`     |      16 |       15 |                    1 |
| `viso`        |       0 |        0 |                    0 |
| `vital`       |      47 |       41 |                    6 |
| **TOTAL**     | **347** |  **274** |               **73** |

Dentro de las 274 firmas directamente invocables:

- **125** tienen `EXECUTE` efectivo para `anon`;
- **244** tienen `EXECUTE` efectivo para `authenticated`;
- **272** tienen `EXECUTE` efectivo para `service_role`;
- **179** son `SECURITY DEFINER`;
- **95** son `SECURITY INVOKER`.

Estas categorías se superponen. No equivalen a 125 endpoints anónimos seguros ni a 179 vulnerabilidades confirmadas.

#### 6. Firmas sobrecargadas

Se observaron tres nombres sobrecargados en esquemas Vento:

| Esquema  | Nombre                              | Firmas |
| -------- | ----------------------------------- | -----: |
| `public` | `create_order_checkout_draft`       |      4 |
| `public` | `fogo_create_real_production_batch` |      2 |
| `public` | `unaccent`                          |      2 |

Toda llamada RPC deberá resolver una firma inequívoca por nombres y tipos de parámetros. La compatibilidad de consumidores y contratos se verificará en `SUPA-AUD-023`, `SUPA-AUD-021` y los paquetes de transición correspondientes.

#### 7. Registro nominal de firmas Vento

El registro nominal completo se define por la identidad PostgreSQL estable:

```text
<schema>.<proname>(pg_get_function_identity_arguments)
```

Cobertura del registro:

| Esquema                                                | Firmas nominales registradas |
| ------------------------------------------------------ | ---------------------------: |
| `app_private`                                          |                            1 |
| `club`                                                 |                            7 |
| `pass`                                                 |                           30 |
| `public`                                               |                          246 |
| `talento`                                              |                           16 |
| `vital`                                                |                           47 |
| esquemas Vento sin rutinas (`payments`, `pos`, `viso`) |                            0 |
| **TOTAL**                                              |                      **347** |

La firma canónica incorpora además tipo de retorno, clase, lenguaje, owner, `SECURITY DEFINER/INVOKER`, volatilidad, grants efectivos y configuración `proconfig`. El registro queda congelado mediante las huellas de la sección 15; cualquier diferencia futura constituye drift y deberá tratarse en `SUPA-AUD-017`.

#### 8. RPC defectuosa: `apply_master_supplier_purchase_batch`

Firma remota:

```sql
public.apply_master_supplier_purchase_batch(p_changes jsonb) returns uuid
```

Propiedades observadas:

- lenguaje `plpgsql`;
- `SECURITY INVOKER`;
- `VOLATILE`;
- `search_path=public`;
- ejecutable por `authenticated` y `service_role`;
- consumida por NEXO en `applyMasterSupplierPurchases`.

Defecto comprobado:

```sql
update public.product_suppliers
set purchase_price = price,
    purchase_pack_qty = pack_qty,
    purchase_pack_unit_code = unit_code,
    is_primary = primary_flag,
    updated_at = now()
where id = supplier_link;
```

`public.product_suppliers` no contiene la columna `updated_at`. La sentencia fallará cuando alcance ese `UPDATE`.

Clasificación: **DEFECTO ESTRUCTURAL CONFIRMADO — BLOQUEANTE PARA ESA RAMA RPC**.

Destino obligatorio:

- corrección física: `SUPA-TRANS-004` y paquete E5 del configurador maestro de productos;
- paridad migratoria y drift: `SUPA-AUD-016`, `SUPA-AUD-017`;
- consumidor: `SUPA-AUD-023`;
- prueba contractual y de integración: `TREQ-SUPABASE-080`.

#### 9. RPC defectuosa: `apply_master_presentation_version_batch`

Firma remota:

```sql
public.apply_master_presentation_version_batch(p_changes jsonb) returns uuid
```

Propiedades observadas:

- lenguaje `plpgsql`;
- `SECURITY INVOKER`;
- `VOLATILE`;
- `search_path=public`;
- ejecutable por `authenticated` y `service_role`;
- consumida por NEXO en `applyMasterPresentationVersions`.

Defecto comprobado:

```sql
update public.product_suppliers
set uom_profile_id = new_id,
    updated_at = now()
where uom_profile_id = p.id;
```

La misma columna inexistente `product_suppliers.updated_at` hace fallar la rama cuando el `UPDATE` se ejecuta.

Clasificación: **DEFECTO ESTRUCTURAL CONFIRMADO — BLOQUEANTE PARA ESA RAMA RPC**.

Destino obligatorio:

- corrección física: `SUPA-TRANS-004` y paquete E5 del versionado de presentaciones;
- paridad migratoria y drift: `SUPA-AUD-016`, `SUPA-AUD-017`;
- consumidor: `SUPA-AUD-023`;
- prueba contractual y de integración: `TREQ-SUPABASE-081`.

#### 10. RPC defectuosa: `apply_master_production_route_batch`

Firma remota:

```sql
public.apply_master_production_route_batch(p_changes jsonb) returns uuid
```

Propiedades observadas:

- lenguaje `plpgsql`;
- `SECURITY INVOKER`;
- `VOLATILE`;
- `search_path=public`;
- ejecutable por `authenticated` y `service_role`;
- consumida por NEXO en `applyMasterProductionRoutes`.

Defecto comprobado:

```sql
on conflict (product_id, site_id)
do update set ...
```

`public.product_site_production_routes` no posee constraint `UNIQUE(product_id, site_id)` ni índice único no parcial compatible. El índice `idx_product_site_production_routes_product_site` existe, pero no es único. El único índice único funcional relacionado es parcial sobre `(product_id, site_id, area_kind)` con predicado `is_active=true and is_default=true`; no puede arbitrar ese `ON CONFLICT`.

La sentencia fallará con ausencia de constraint único o de exclusión compatible.

Clasificación: **DEFECTO ESTRUCTURAL CONFIRMADO — BLOQUEANTE PARA ESA RAMA RPC**.

Destino obligatorio:

- definición de cardinalidad y clave natural: `SUPA-AUD-019`, `SUPA-AUD-022`, `SUPA-ARC-*`;
- corrección física: `SUPA-TRANS-004` y paquete E5 de rutas productivas;
- paridad migratoria y drift: `SUPA-AUD-016`, `SUPA-AUD-017`;
- consumidor: `SUPA-AUD-023`;
- prueba contractual y de integración: `TREQ-SUPABASE-082`.

No se aprueba automáticamente crear `UNIQUE(product_id, site_id)`, porque la tabla también modela `area_kind`, defaults y rutas activas. La clave correcta debe derivarse del proceso aprobado antes de migrar.

#### 11. Confirmación de consumidores activos

El archivo `vento-nexo/src/app/inventory/settings/products/actions.ts` referencia las tres RPC:

| Acción NEXO                       | RPC                                       |
| --------------------------------- | ----------------------------------------- |
| `applyMasterSupplierPurchases`    | `apply_master_supplier_purchase_batch`    |
| `applyMasterPresentationVersions` | `apply_master_presentation_version_batch` |
| `applyMasterProductionRoutes`     | `apply_master_production_route_batch`     |

Por tanto, no son cuerpos huérfanos sin consumidor conocido. El fallo puede alcanzar una ruta funcional vigente del configurador maestro de productos.

#### 12. Seguridad de funciones privilegiadas

En esquemas gobernados por Vento se observaron:

- **210** funciones `SECURITY DEFINER`;
- **45** de ellas ejecutables por `anon`;
- **151** ejecutables por `authenticated`;
- **210** ejecutables por `service_role`;
- **0** `SECURITY DEFINER` sin `search_path` fijado en `proconfig`.

El `search_path` fijado reduce una clase de riesgo, pero no certifica autorización interna, mínimo privilegio, aislamiento territorial, manejo de actor ni exposición correcta. La revisión individual corresponde a `SUPA-AUD-009`; los triggers y automatismos se continúan en `SUPA-AUD-007` y `SUPA-AUD-008`.

#### 13. Límites de certificación operativa

No se certifica ejecución histórica ni éxito operacional de todas las rutinas porque:

- `track_functions` está desactivado;
- no se obtuvo telemetría histórica de PostgreSQL por función;
- no se ejecutaron RPC mutantes sobre datos reales;
- la existencia, firma y cuerpo estático no demuestran que cada rama haya sido recorrida;
- las funciones que crean tablas temporales deben probarse en ejecución controlada, aunque el análisis estático aislado pueda producir falsos positivos.

Estado de evidencia:

| Afirmación                                                      | Estado                             |
| --------------------------------------------------------------- | ---------------------------------- |
| existencia remota y firma                                       | confirmada                         |
| owner, lenguaje, seguridad, volatilidad, grants y `search_path` | confirmados                        |
| tres defectos estructurales reportados                          | confirmados                        |
| consumidor NEXO de las tres RPC                                 | confirmado                         |
| éxito histórico de todas las funciones                          | no demostrable con el corte actual |
| autorización integral de cada función                           | pendiente de `SUPA-AUD-009`        |
| comportamiento operativo de cada RPC                            | pendiente de pruebas controladas   |

#### 14. Hallazgos y destino documental

| Hallazgo                                                                     | Riesgo                                                                         | Tarea responsable                                                                            |
| ---------------------------------------------------------------------------- | ------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------- |
| tres RPC activamente consumidas contienen defectos estructurales confirmados | fallos deterministas en configuración maestra de productos                     | `SUPA-AUD-016`, `SUPA-AUD-017`, `SUPA-AUD-023`, `SUPA-TRANS-004`, paquete E5 correspondiente |
| 210 funciones Vento `SECURITY DEFINER`                                       | bypass de RLS o privilegio excesivo si la autorización interna es insuficiente | `SUPA-AUD-009`                                                                               |
| 45 `SECURITY DEFINER` ejecutables por `anon`                                 | superficie anónima privilegiada no justificada                                 | `SUPA-AUD-009`                                                                               |
| 151 `SECURITY DEFINER` ejecutables por `authenticated`                       | acceso privilegiado demasiado amplio o sin territorio                          | `SUPA-AUD-009`                                                                               |
| 73 funciones de trigger                                                      | automatismos invisibles para consumidores si no se vinculan a sus triggers     | `SUPA-AUD-007`                                                                               |
| tres nombres sobrecargados                                                   | resolución ambigua o ruptura de clientes al cambiar parámetros                 | `SUPA-AUD-021`, `SUPA-AUD-023`                                                               |
| ausencia de procedimientos                                                   | consumidores no deben documentar `CALL` donde solo existen funciones RPC       | `SUPA-AUD-023`                                                                               |
| ausencia de telemetría histórica                                             | falsa certificación de uso o éxito operativo                                   | `SUPA-AUD-020`, `SUPA-OBS-*`                                                                 |

No queda hallazgo narrativo sin tarea responsable.

#### 15. Huellas de integridad

```text
VENTO_FUNCTION_SIGNATURE_REGISTRY_SHA256 = aa46a7e201dd67d1c2bd67163173b407c76d604820f5a858b0a35ee1bfb4b6e0
VENTO_FUNCTION_BODY_REGISTRY_SHA256 = e49a641135848e848f9bea303ae7865abd3766f434f3b416cfc6eafdba5d7d7b
OBSERVED_AT_UTC = 2026-07-29T19:27:28.627615Z
SUPABASE_PROJECT_REF = clzdpinthhtknkmefsxx
POSTGRESQL_VERSION = 17.6
```

La huella de firmas incluye esquema, nombre, argumentos de identidad, retorno, clase, lenguaje, owner, modo de seguridad, grants efectivos y `proconfig`. La huella de cuerpos agrega la definición completa obtenida mediante `pg_get_functiondef` para las 347 firmas Vento.

#### 16. Requisitos de prueba derivados

Se incorporan al registro canónico:

```text
TREQ-SUPABASE-074 a TREQ-SUPABASE-085
```

Protegen inventario completo, separación de clases, superficie invocable, funciones privilegiadas, sobrecargas, los tres defectos estructurales, consumidores, ausencia de procedimientos, límites de observabilidad e integridad por huellas.

#### 17. Resultado final

`SUPA-AUD-006` deja inventariados y reconciliados:

- **3.794** rutinas remotas;
- **347** firmas gobernadas por Vento;
- **274** firmas directamente invocables;
- **73** funciones de trigger;
- **0** procedimientos PostgreSQL;
- **210** funciones Vento `SECURITY DEFINER`;
- **45** `SECURITY DEFINER` ejecutables por `anon`;
- **151** `SECURITY DEFINER` ejecutables por `authenticated`;
- tres nombres sobrecargados;
- tres RPC defectuosas y activamente consumidas, con causa estructural comprobada.

La tarea no modifica la base, no corrige las RPC y no certifica todavía autorización integral ni éxito operativo de todas las funciones.


### ✅ SUPA-AUD-007 — Inventariar funciones `SECURITY DEFINER` y `SECURITY INVOKER`

**Estado:** APROBADA
**Fecha:** 2026-07-29
**Bloque:** BLOQUE E3 — Arquitectura canónica de datos y gobierno integral de Supabase
**Tarea anterior:** `SUPA-AUD-006 — Inventariar funciones, RPC, procedimientos y firmas públicas` — APROBADA
**Tarea siguiente:** `SUPA-AUD-008 — Inventariar triggers y funciones ejecutadas por triggers`
**Descripción:** Clasifica las 3.622 funciones normales observables por modo de seguridad, propietario, capacidad de bypass RLS, clase de invocación, `search_path`, configuración de `row_security`, ACL y privilegios efectivos; profundiza las 347 firmas ubicadas en esquemas gobernados por Vento sin declarar vulnerabilidades únicamente por utilizar `SECURITY DEFINER` ni certificar seguridad únicamente por utilizar `SECURITY INVOKER`.

#### 1. Objetivo

Establecer una línea base reproducible de la identidad de ejecución de cada función normal inventariada en `SUPA-AUD-006`.

```text
3.622 FUNCIONES NORMALES
= 213 SECURITY DEFINER
+ 3.409 SECURITY INVOKER

347 FUNCIONES EN ESQUEMAS GOBERNADOS POR VENTO
= 210 SECURITY DEFINER
+ 137 SECURITY INVOKER
```

El modo de seguridad responde una pregunta concreta:

- `SECURITY DEFINER`: la función se ejecuta con los privilegios del propietario;
- `SECURITY INVOKER`: la función se ejecuta con los privilegios del actor que la invoca.

Ninguno de los dos modos constituye por sí solo una certificación de seguridad. Una función `DEFINER` puede ser necesaria y segura si sus grants, autorización interna, `search_path`, entradas y efectos están correctamente restringidos. Una función `INVOKER` puede seguir siendo insegura si el rol llamador posee privilegios excesivos, la función acepta identificadores arbitrarios o la superficie Data API está mal gobernada.

#### 2. Alcance y método no mutante

Se consultaron exclusivamente catálogos y funciones de inspección PostgreSQL mediante `SELECT`:

- `pg_proc.prosecdef` para clasificar `DEFINER` e `INVOKER`;
- `pg_proc.prorettype` para separar funciones directas y funciones de trigger;
- `pg_roles.rolsuper` y `pg_roles.rolbypassrls` para registrar el poder efectivo del owner;
- `pg_proc.proconfig` para `search_path` y `row_security=off`;
- `pg_proc.proacl`, `aclexplode` y `acldefault` para distinguir grants de `PUBLIC`, `anon` y `authenticated`;
- `has_function_privilege` para privilegios efectivos de `anon`, `authenticated` y `service_role`;
- `pg_get_functiondef` únicamente para señales estáticas auxiliares de autorización, sin afirmar equivalencia con una revisión semántica completa.

El universo de esta tarea es `pg_proc.prokind='f'`. Los 157 agregados y 15 objetos de ventana inventariados en `SUPA-AUD-006` no se mezclan con estas 3.622 funciones normales. No se ejecutó ninguna función, trigger, RPC mutante, DDL, DML, migración, `GRANT` ni `REVOKE`.

#### 3. Artefacto canónico

```text
SUPABASE-FUNCTION-SECURITY-MODE-INVENTORY-007@1.0.0
```

Cada registro queda identificado por:

```text
schema_name
+ function_name
+ identity_arguments
+ result_type
+ owner_name
+ owner_superuser
+ owner_bypassrls
+ security_mode
+ call_kind
+ language
+ volatility
+ parallel_safety
+ search_path
+ row_security_off
+ acl_source
+ public_execute
+ anon_execute_effective
+ authenticated_execute_effective
+ service_role_execute_effective
+ observation_timestamp
```

La identidad nominal continúa siendo `<schema>.<nombre>(argumentos de identidad)`. Las 347 firmas de esquemas Vento ya congeladas en `SUPA-AUD-006` quedan enriquecidas por este registro sin cambiar su identidad.

#### 4. Resultado global por esquema

| Esquema               | Funciones | `DEFINER` | `INVOKER` | `DEFINER` directas | `DEFINER` trigger | `INVOKER` directas | `INVOKER` trigger | Gobierno     |
| --------------------- | --------: | --------: | --------: | -----------------: | ----------------: | -----------------: | ----------------: | ------------ |
| `app_private`         |         1 |         1 |         0 |                  1 |                 0 |                  0 |                 0 | Vento        |
| `auth`                |         4 |         0 |         4 |                  0 |                 0 |                  4 |                 0 | administrado |
| `club`                |         7 |         2 |         5 |                  2 |                 0 |                  5 |                 0 | Vento        |
| `cron`                |         7 |         0 |         7 |                  0 |                 0 |                  6 |                 1 | administrado |
| `extensions`          |        55 |         0 |        55 |                  0 |                 0 |                 49 |                 6 | administrado |
| `graphql`             |         0 |         0 |         0 |                  0 |                 0 |                  0 |                 0 | administrado |
| `graphql_public`      |         1 |         0 |         1 |                  0 |                 0 |                  1 |                 0 | administrado |
| `information_schema`  |        11 |         0 |        11 |                  0 |                 0 |                 11 |                 0 | administrado |
| `net`                 |        12 |         0 |        12 |                  0 |                 0 |                 12 |                 0 | administrado |
| `pass`                |        30 |        27 |         3 |                 16 |                11 |                  3 |                 0 | Vento        |
| `payments`            |         0 |         0 |         0 |                  0 |                 0 |                  0 |                 0 | Vento        |
| `pg_catalog`          |     3.147 |         0 |     3.147 |                  0 |                 0 |              3.129 |                18 | administrado |
| `pg_toast`            |         0 |         0 |         0 |                  0 |                 0 |                  0 |                 0 | administrado |
| `pgbouncer`           |         1 |         1 |         0 |                  1 |                 0 |                  0 |                 0 | administrado |
| `pos`                 |         0 |         0 |         0 |                  0 |                 0 |                  0 |                 0 | Vento        |
| `public`              |       246 |       164 |        82 |                144 |                20 |                 42 |                40 | Vento        |
| `realtime`            |        15 |         0 |        15 |                  0 |                 0 |                 14 |                 1 | administrado |
| `storage`             |        17 |         0 |        17 |                  0 |                 0 |                 14 |                 3 | administrado |
| `supabase_migrations` |         0 |         0 |         0 |                  0 |                 0 |                  0 |                 0 | administrado |
| `talento`             |        16 |        11 |         5 |                 11 |                 0 |                  4 |                 1 | Vento        |
| `vault`               |         5 |         2 |         3 |                  2 |                 0 |                  3 |                 0 | administrado |
| `viso`                |         0 |         0 |         0 |                  0 |                 0 |                  0 |                 0 | Vento        |
| `vital`               |        47 |         5 |        42 |                  5 |                 0 |                 41 |                 1 | Vento        |
| **TOTAL**             | **3.622** |   **213** | **3.409** |            **182** |            **31** |          **3.338** |            **71** | —            |

Las **102 funciones de trigger** de este corte se componen de 31 `DEFINER` y 71 `INVOKER`. `SUPA-AUD-008` deberá enlazarlas con los triggers reales, tablas, eventos, orden y condiciones de disparo; esta tarea solo clasifica su identidad de ejecución.

#### 5. Reconciliación por gobierno estructural

| Frontera                                       | `DEFINER` | `INVOKER` |     Total |
| ---------------------------------------------- | --------: | --------: | --------: |
| esquemas administrados por PostgreSQL/Supabase |         3 |     3.272 |     3.275 |
| esquemas gobernados por Vento                  |       210 |       137 |       347 |
| **TOTAL**                                      |   **213** | **3.409** | **3.622** |

La clasificación por esquema admite una excepción de propiedad: cuatro funciones `unaccent*` están físicamente en `public`, pero pertenecen a la extensión `unaccent`, tienen owner `supabase_admin` y no deberán tratarse como lógica empresarial de Vento. Por tanto:

```text
347 FUNCIONES EN ESQUEMAS VENTO
= 343 OWNER postgres
+ 4 OWNER supabase_admin / EXTENSIÓN unaccent
```

La ubicación en `public` no transfiere gobierno estructural sobre una función administrada por extensión. Su ciclo permanece vinculado a `SUPA-AUD-015`, `SUPA-AUD-016` y `SUPA-AUD-017`.

#### 6. Propietarios y capacidad de bypass RLS

| Grupo                       | Owner            | `rolsuper` | `rolbypassrls` | Cantidad |
| --------------------------- | ---------------- | ---------: | -------------: | -------: |
| `DEFINER` en esquemas Vento | `postgres`       |         no |         **sí** |  **210** |
| `DEFINER` administradas     | `supabase_admin` |     **sí** |         **sí** |    **3** |

Las 210 funciones `DEFINER` de esquemas Vento se ejecutan como `postgres`, rol que no es superusuario en este proyecto pero sí posee `BYPASSRLS`. Por ello, su autorización no puede delegarse implícitamente a las políticas RLS de las tablas consultadas: cada función deberá demostrar controles internos y grants coherentes con su finalidad en `SUPA-AUD-009`.

Las 137 funciones `INVOKER` de esquemas Vento se dividen en 133 con owner `postgres` y cuatro `unaccent*` con owner `supabase_admin`; el owner no eleva una llamada `INVOKER`, porque la ejecución utiliza al actor llamador.

#### 7. Superficie de llamada en esquemas Vento

La clase `anon` significa que `anon` posee `EXECUTE` efectivo; no significa acceso exclusivo de ese rol. Las categorías se construyen con precedencia `anon` → `authenticated` → sin rol cliente.

| Modo      | Clase   |  `anon` | Solo `authenticated` | Sin rol cliente |   Total |
| --------- | ------- | ------: | -------------------: | --------------: | ------: |
| `DEFINER` | directa |  **44** |              **105** |          **30** | **179** |
| `DEFINER` | trigger |   **1** |                **1** |          **29** |  **31** |
| `INVOKER` | directa |  **81** |               **14** |           **0** |  **95** |
| `INVOKER` | trigger |   **8** |                **0** |          **34** |  **42** |
| **TOTAL** | —       | **134** |              **120** |          **93** | **347** |

Una función de retorno `trigger` no constituye una RPC directa válida aunque conserve `EXECUTE`; sus grants se registran porque son superficie innecesaria o confusa que deberá reconciliarse con el trigger real en `SUPA-AUD-008` y con privilegios en `SUPA-AUD-009`.

#### 8. Matriz ACL de las 210 funciones `SECURITY DEFINER` Vento

| `PUBLIC EXECUTE` | Grant explícito `anon` | Grant explícito `authenticated` | Cantidad |
| ---------------: | ---------------------: | ------------------------------: | -------: |
|               no |                     no |                              no |   **59** |
|               no |                     no |                              sí |  **106** |
|               sí |                     no |                              sí |   **43** |
|               sí |                     sí |                              sí |    **2** |
|        **Total** |                      — |                               — |  **210** |

Conclusiones estrictamente observables:

- **45** funciones `DEFINER` conservan `EXECUTE` para `PUBLIC`; por herencia, `anon` y `authenticated` obtienen ejecución efectiva;
- las 45 también tienen grant explícito para `authenticated`;
- solo dos tienen además grant explícito para `anon`: `pass.catalog_item_allowed_option_groups` y `pass.catalog_item_option_group_is_allowed`;
- las 210 tienen ACL explícita; ninguna depende únicamente del ACL por defecto;
- **151** tienen `EXECUTE` explícito para `authenticated`;
- **59** no conceden ejecución a `PUBLIC`, `anon` ni `authenticated`.

La presencia de `PUBLIC EXECUTE` no demuestra explotación, pero sí una frontera de llamada más amplia que la intención aparente de varios helpers administrativos y operativos. Su justificación, autorización interna y eventual revocación pertenecen a `SUPA-AUD-009`, no a esta tarea.

#### 9. Registro prioritario: 45 `SECURITY DEFINER` con `PUBLIC EXECUTE`

El conjunto contiene 44 funciones directas y una función de trigger.

##### 9.1 Funciones directas ejecutables por `anon`

1. `pass.catalog_item_allowed_option_groups(p_catalog_item_id uuid)`
2. `pass.catalog_item_option_group_is_allowed(p_catalog_item_id uuid, p_option_group_id uuid)`
3. `public.archive_finished_order_conversations(p_site_id uuid)`
4. `public.assert_inventory_uom_profile_stock_input(p_location_id uuid, p_location_position_id uuid, p_product_id uuid, p_uom_profile_id uuid, p_presentation_qty numeric, p_base_qty numeric)`
5. `public.can_access_area(p_area_id uuid)`
6. `public.can_access_recipe_scope(p_site_id uuid, p_area_id uuid)`
7. `public.can_access_site(p_site_id uuid)`
8. `public.create_order_checkout_draft(p_site_id uuid, p_satellite_name text, p_fulfillment_type text, p_contact_name text, p_contact_phone text, p_address_line text, p_address_reference text, p_notes text, p_items jsonb, p_delivery_fee_amount numeric, p_source text, p_delivery_distance_km integer, p_delivery_quote_id uuid)`
9. `public.create_order_checkout_draft(p_site_id uuid, p_satellite_name text, p_fulfillment_type text, p_contact_name text, p_contact_phone text, p_address_line text, p_address_reference text, p_notes text, p_items jsonb, p_delivery_fee_amount numeric, p_source text, p_delivery_distance_km integer, p_delivery_quote_id uuid, p_invoice_requested boolean, p_billing_data jsonb)`
10. `public.current_employee_area_id()`
11. `public.current_employee_primary_site_id()`
12. `public.current_employee_role()`
13. `public.current_employee_selected_area_id()`
14. `public.current_employee_selected_site_id()`
15. `public.current_employee_site_id()`
16. `public.current_shared_device_can_access_app(app_code_input text)`
17. `public.ensure_order_conversation(p_order_id uuid)`
18. `public.fogo_recipe_area_options(p_site_id uuid)`
19. `public.get_client_order_chat_unread_counts(p_order_ids uuid[])`
20. `public.get_site_cost_center(p_site_id uuid)`
21. `public.get_staff_order_chat_unread_counts(p_site_id uuid)`
22. `public.has_permission(p_permission_code text, p_site_id uuid, p_area_id uuid)`
23. `public.is_active_staff()`
24. `public.is_employee()`
25. `public.is_global_manager()`
26. `public.is_manager()`
27. `public.is_manager_or_owner()`
28. `public.is_owner()`
29. `public.mark_order_conversation_read(p_conversation_id uuid)`
30. `public.permission_scope_matches(p_scope_type permission_scope_type, p_context_site_id uuid, p_context_area_id uuid, p_scope_site_id uuid, p_scope_area_id uuid, p_scope_site_type site_type, p_scope_area_kind text)`
31. `public.register_shift_departure_event(p_site_id uuid, p_distance_meters integer, p_accuracy_meters integer, p_source text, p_notes text, p_occurred_at timestamp with time zone)`
32. `public.register_shift_departure_event_autoclose(p_site_id uuid, p_distance_meters integer, p_accuracy_meters integer, p_source text, p_notes text, p_occurred_at timestamp with time zone, p_auto_checkout_threshold_meters integer)`
33. `public.resolve_internal_transfer_price(p_product_id uuid, p_seller_cost_center_id uuid, p_buyer_cost_center_id uuid, p_buyer_site_id uuid, p_unit_code text, p_at timestamp with time zone)`
34. `public.resolve_internal_transfer_price_for_profile(p_product_id uuid, p_seller_cost_center_id uuid, p_buyer_cost_center_id uuid, p_buyer_site_id uuid, p_uom_profile_id uuid, p_unit_code text, p_at timestamp with time zone)`
35. `public.set_order_conversation_archived(p_conversation_id uuid, p_archived boolean)`
36. `public.shared_device_actor_is_allowed_v1(p_device_id uuid, p_actor_employee_id uuid, p_site_id uuid, p_area_id uuid)`
37. `public.update_order_operational_state(p_order_id uuid, p_site_id uuid, p_operation text, p_dispatch_partner text, p_dispatch_reference text, p_metadata jsonb)`
38. `talento.confirm_interview(p_interview_id uuid, p_public_note text)`
39. `talento.respond_to_offer(p_application_id uuid, p_decision talento.offer_status, p_public_note text)`
40. `talento.set_primary_application(p_application_id uuid)`
41. `talento.submit_application(p_vacancy_id uuid, p_source text, p_metadata jsonb)`
42. `vital.can_access_user(target_user_id uuid)`
43. `vital.is_feature_enabled(p_flag_key text, p_user_id uuid)`
44. `vital.is_squad_member(target_squad_id uuid)`

##### 9.2 Función de trigger con grant cliente

```text
public.unarchive_order_conversation_from_client_message()
```

Esta función de trigger conserva `PUBLIC EXECUTE`, por lo que `anon` y `authenticated` tienen privilegio efectivo aunque PostgreSQL no permita usarla como una función directa normal. `SUPA-AUD-008` deberá comprobar su trigger consumidor y `SUPA-AUD-009` deberá decidir si el grant es necesario.

#### 10. Funciones `DEFINER` con `row_security=off`

Se observaron **14 funciones**, todas:

- ubicadas en `public`;
- directas;
- con owner `postgres` y `BYPASSRLS`;
- ejecutables por `PUBLIC`, `anon`, `authenticated` y `service_role`;
- con `search_path=public`.

- `public.can_access_area(p_area_id uuid)`
- `public.can_access_site(p_site_id uuid)`
- `public.current_employee_area_id()`
- `public.current_employee_primary_site_id()`
- `public.current_employee_role()`
- `public.current_employee_selected_area_id()`
- `public.current_employee_selected_site_id()`
- `public.current_employee_site_id()`
- `public.is_active_staff()`
- `public.is_employee()`
- `public.is_global_manager()`
- `public.is_manager()`
- `public.is_manager_or_owner()`
- `public.is_owner()`

`row_security=off` es una decisión explícita adicional al modo `SECURITY DEFINER`. Estas funciones parecen formar una capa de resolución de identidad, rol, sede, área y acceso, pero esa intención no sustituye la revisión de entradas, retorno mínimo, uso dentro de políticas, recursión y exposición RPC. La decisión contextual queda en `SUPA-AUD-009` y la arquitectura objetivo en `SUPA-ARC-*`.

#### 11. `search_path` de funciones `SECURITY DEFINER`

Las 210 funciones `DEFINER` de esquemas Vento tienen un `search_path` fijado. No existe ninguna con configuración ausente, pero tampoco existe una que use el patrón vacío `search_path=''` recomendado como endurecimiento máximo cuando todas las referencias están calificadas.

| `search_path` Vento `DEFINER`       | Cantidad |
| ----------------------------------- | -------: |
| `public`                            |       89 |
| `public, pg_temp`                   |       22 |
| `public, auth`                      |       21 |
| `public, pass`                      |       16 |
| `talento, public`                   |       11 |
| `public, pass, auth`                |       10 |
| `pass, public`                      |        8 |
| `public, payments`                  |        8 |
| `public, vital, auth`               |        5 |
| `public, auth, pass`                |        4 |
| `public, extensions`                |        4 |
| `public, app_private, extensions`   |        3 |
| `pass, public, auth`                |        2 |
| `public, auth, storage, extensions` |        2 |
| `public, club, auth`                |        2 |
| `app_private, public, extensions`   |        1 |
| `public, pass, pg_temp`             |        1 |
| `public, pos`                       |        1 |
| **TOTAL**                           |  **210** |

Resumen de endurecimiento:

```text
210 CON SEARCH_PATH FIJADO
= 23 CON pg_temp EXPLÍCITO AL FINAL
+ 187 SIN pg_temp EXPLÍCITO

0 CON SEARCH_PATH VACÍO
```

La ausencia de `pg_temp` explícito no se declara vulnerabilidad sin comprobar referencias no calificadas y capacidad real del llamador para crear objetos temporales. Se registra como condición que deberá evaluar `SUPA-AUD-009`, `SUPA-AUD-016` y la normalización posterior.

Las tres funciones `DEFINER` administradas utilizan `search_path=''`:

- `pgbouncer.get_auth(p_usename text)`;
- `vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid)`;
- `vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid)`.

No se autoriza modificar esas funciones administradas.

#### 12. Inventario `SECURITY INVOKER` de esquemas Vento

```text
137 SECURITY INVOKER
= 95 DIRECTAS
+ 42 FUNCIONES DE TRIGGER
```

Privilegios efectivos observados:

- **89** ejecutables por `anon`;
- **103** ejecutables por `authenticated`;
- **135** ejecutables por `service_role`;
- dentro de las 95 directas, 81 son ejecutables por `anon` y las 14 restantes solo por `authenticated` entre los roles cliente evaluados.

La ejecución `INVOKER` conserva RLS y privilegios del llamador, pero no valida por sí sola ownership de filas, territorio, contexto empresarial ni parámetros. La revisión funcional y de grants permanece en `SUPA-AUD-009` y `SUPA-AUD-023`.

Cuatro funciones `INVOKER` sin `search_path` fijado pertenecen a la extensión `unaccent`, no a lógica Vento:

- `public.unaccent(regdictionary, text)`;
- `public.unaccent(text)`;
- `public.unaccent_init(internal)`;
- `public.unaccent_lexize(internal, internal, internal, internal)`.

Su ausencia de `proconfig` no deberá generar una migración empresarial ni un reemplazo manual; se auditará como extensión en `SUPA-AUD-015`.

#### 13. Señales estáticas auxiliares de autorización

Sobre las 179 funciones `DEFINER` directas de esquemas Vento se buscaron, únicamente como señales textuales no concluyentes:

| Señal estática                  | Funciones donde aparece |
| ------------------------------- | ----------------------: |
| `auth.uid()`                    |                      90 |
| `auth.jwt()`                    |                       1 |
| `current_user`                  |                       4 |
| helper de permiso, rol o acceso |                      59 |
| `RAISE EXCEPTION`               |                      94 |
| ninguna de esas señales         |                      46 |

Las categorías se superponen. La presencia de una señal no demuestra autorización correcta y su ausencia no demuestra vulnerabilidad: una función puede delegar en otra función, depender de RLS del invocador, resolver acceso mediante una vista o aplicar un contrato distinto.

Dentro de las 44 funciones `DEFINER` directas ejecutables por `anon`, ocho no contienen ninguna de esas señales textuales:

- `pass.catalog_item_allowed_option_groups(p_catalog_item_id uuid)`
- `pass.catalog_item_option_group_is_allowed(p_catalog_item_id uuid, p_option_group_id uuid)`
- `public.current_employee_area_id()`
- `public.current_employee_site_id()`
- `public.get_site_cost_center(p_site_id uuid)`
- `public.resolve_internal_transfer_price(p_product_id uuid, p_seller_cost_center_id uuid, p_buyer_cost_center_id uuid, p_buyer_site_id uuid, p_unit_code text, p_at timestamp with time zone)`
- `public.resolve_internal_transfer_price_for_profile(p_product_id uuid, p_seller_cost_center_id uuid, p_buyer_cost_center_id uuid, p_buyer_site_id uuid, p_uom_profile_id uuid, p_unit_code text, p_at timestamp with time zone)`
- `public.shared_device_actor_is_allowed_v1(p_device_id uuid, p_actor_employee_id uuid, p_site_id uuid, p_area_id uuid)`

Estas ocho reciben prioridad de revisión semántica en `SUPA-AUD-009`; no se clasifican como vulnerables en `SUPA-AUD-007`.

#### 14. Funciones de trigger con grants de roles cliente

Entre las 31 funciones `DEFINER` de trigger ubicadas en esquemas Vento:

- una es ejecutable por `anon`: `public.unarchive_order_conversation_from_client_message()`;
- una adicional es ejecutable por `authenticated`: `pass.validate_catalog_item_product_site()`;
- 29 no son ejecutables por roles cliente.

Entre las 42 funciones `INVOKER` de trigger:

- ocho son ejecutables por `anon` mediante `PUBLIC EXECUTE`;
- 34 no son ejecutables por roles cliente.

`SUPA-AUD-008` deberá verificar si cada grant es necesario, pero la decisión de `REVOKE` permanece reservada a `SUPA-AUD-009` y a una transición aprobada.

#### 15. Relación con los tres RPC defectuosos de `SUPA-AUD-006`

Las tres RPC estructuralmente defectuosas son `SECURITY INVOKER`:

- `public.apply_master_supplier_purchase_batch(p_changes jsonb)`;
- `public.apply_master_presentation_version_batch(p_changes jsonb)`;
- `public.apply_master_production_route_batch(p_changes jsonb)`.

Cambiar estas funciones a `SECURITY DEFINER` no corregiría sus referencias inválidas y además ampliaría su poder de ejecución. Sus defectos continúan vinculados a `SUPA-AUD-016`, `SUPA-AUD-017`, `SUPA-AUD-023`, `SUPA-TRANS-004` y al paquete E5 correspondiente.

#### 16. Hallazgos y destino documental

| Hallazgo                                                                      | Riesgo                                                                                  | Tarea responsable                              |
| ----------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- | ---------------------------------------------- |
| 210 funciones `DEFINER` en esquemas Vento ejecutan como owner con `BYPASSRLS` | autorización interna insuficiente o acceso más amplio que la intención empresarial      | `SUPA-AUD-009`, `SUPA-AUD-023`, `SUPA-ARC-*`   |
| 45 `DEFINER` conservan `PUBLIC EXECUTE`                                       | superficie privilegiada disponible a roles no previstos                                 | `SUPA-AUD-009`, `SUPA-AUD-016`, `SUPA-AUD-017` |
| 14 `DEFINER` combinan `PUBLIC EXECUTE` y `row_security=off`                   | bypass explícito usado fuera de políticas o helpers autorizados                         | `SUPA-AUD-009`, `SUPA-ARC-*`                   |
| 187 `DEFINER` no colocan `pg_temp` explícitamente al final                    | posible shadowing si existen referencias no calificadas y capacidad de crear temporales | `SUPA-AUD-009`, `SUPA-AUD-016`, `SUPA-NORM-*`  |
| cero `DEFINER` Vento usan `search_path=''`                                    | endurecimiento máximo no aplicado de forma uniforme                                     | `SUPA-AUD-009`, `SUPA-ARC-*`, `SUPA-NORM-*`    |
| dos funciones de trigger `DEFINER` tienen grants cliente                      | privilegios confusos o innecesarios sobre funciones no invocables como RPC normal       | `SUPA-AUD-008`, `SUPA-AUD-009`                 |
| cuatro `unaccent*` administradas residen en `public`                          | apropiación accidental de objetos de extensión o drift falso                            | `SUPA-AUD-015`, `SUPA-AUD-016`, `SUPA-AUD-017` |
| ocho `DEFINER` anónimas carecen de señales estáticas simples                  | falsa confianza sin revisión semántica del cuerpo y dependencias                        | `SUPA-AUD-009`, `SUPA-AUD-023`                 |

No queda hallazgo narrativo sin tarea responsable.

#### 17. Decisiones que esta tarea no autoriza

`SUPA-AUD-007` no autoriza:

1. cambiar una función de `DEFINER` a `INVOKER` o viceversa;
2. aplicar `GRANT`, `REVOKE` o cambios de privilegios por defecto;
3. modificar `search_path`, `row_security`, owner, cuerpo, firma o volatilidad;
4. asumir que las 45 funciones con `PUBLIC EXECUTE` son explotables;
5. asumir que las 137 funciones `INVOKER` son seguras;
6. ejecutar RPC mutantes para probarlas sobre datos reales;
7. modificar funciones administradas por Supabase, PostgreSQL o extensiones;
8. corregir los tres RPC defectuosos registrados en `SUPA-AUD-006`;
9. adelantar la vinculación de triggers reservada a `SUPA-AUD-008`;
10. cerrar la auditoría integral de grants, RLS y privilegios reservada a `SUPA-AUD-009`.

#### 18. Requisitos de prueba derivados

Se incorporan al registro canónico:

```text
TREQ-SUPABASE-086 a TREQ-SUPABASE-097
```

Protegen clasificación completa, reconciliación por esquema y owner, semántica de ejecución, superficie cliente, ACL de `PUBLIC`, `row_security=off`, `search_path`, objetos administrados, revisión heurística, continuidad con triggers y detección de drift.

#### 19. Huellas de integridad

```text
SECURITY_MODE_REGISTRY_SHA256 = dd3f8c67682f07d8c382cac3da10dab6d3319110fa4978a19c20ab52ecbf8098
SECURITY_DEFINER_REGISTRY_SHA256 = b4b931b5751f3f430771bba9258ff1ef7b69628c7a69ce9cddcd740a803c285e
SECURITY_INVOKER_REGISTRY_SHA256 = 1d899264f73c5846ab95f3f64919119dfc948867f05c0b35e4bb18fd239f028c
PUBLIC_EXECUTE_DEFINER_SHA256 = 7b98ec6492583870155a2b6a876457004e420211215bf247347b69dca4c8e1a5
ROW_SECURITY_OFF_DEFINER_SHA256 = 9a9f0f92fdfe0c0fb45c716be7e8af479d4e1a97abe5169ed02761b35c2af129
SEARCH_PATH_MATRIX_SHA256 = fd0ffa03fe489e9ebd1c86398bb677e899ecedc502c6732874b377d7f3848148
ACL_MATRIX_SHA256 = 19423842665406774473c8a6bf8edd396e2baf706e732e262a55772019c0bbc5
OBSERVED_AT_UTC = 2026-07-29T19:38:41.563719Z
SUPABASE_PROJECT_REF = clzdpinthhtknkmefsxx
POSTGRESQL_VERSION = 17.6
```

Toda variación de modo, owner, ACL, `search_path`, `row_security`, firma o pertenencia al conjunto de 45 deberá registrarse como drift en `SUPA-AUD-017` antes de utilizar el inventario para arquitectura, normalización o transición.

#### 20. Resultado final

`SUPA-AUD-007` deja inventariadas y reconciliadas:

- **3.622** funciones normales: 213 `SECURITY DEFINER` y 3.409 `SECURITY INVOKER`;
- **347** funciones ubicadas en esquemas Vento: 210 `DEFINER` y 137 `INVOKER`;
- **343** funciones owner `postgres` y cuatro funciones `unaccent*` administradas por extensión dentro de `public`;
- **179** `DEFINER` directas y 31 de trigger;
- **95** `INVOKER` directas y 42 de trigger dentro de esquemas Vento;
- **45** `DEFINER` con `PUBLIC EXECUTE`;
- **14** `DEFINER` con `row_security=off`;
- **210** `DEFINER` Vento con `search_path` fijado, 23 con `pg_temp` explícito y cero con `search_path=''`;
- tres funciones `DEFINER` administradas con `search_path=''`;
- ocho funciones anónimas priorizadas para revisión semántica, sin declararlas vulnerables.

La tarea no modifica Supabase y no certifica todavía la autorización integral de ninguna función. La siguiente tarea deberá vincular las funciones de trigger con sus automatismos reales.


### ✅ SUPA-AUD-008 — Inventariar triggers y funciones ejecutadas por triggers

**Estado:** APROBADA
**Fecha:** 2026-07-29
**Bloque:** BLOQUE E3 — Arquitectura canónica de datos y gobierno integral de Supabase
**Tarea anterior:** `SUPA-AUD-007 — Inventariar funciones SECURITY DEFINER y SECURITY INVOKER` — APROBADA
**Tarea siguiente:** `SUPA-AUD-009 — Inventariar políticas RLS, grants y privilegios por rol`
**Descripción:** Inventaría los triggers de relación, triggers internos de constraints, event triggers y funciones de retorno `trigger` o `event_trigger` observables en los 23 esquemas no efímeros; vincula cada automatismo explícito con relación, evento, temporización, nivel, condición, función y modo de seguridad, sin ejecutar DML ni aprobar cambios físicos.

#### 1. Objetivo

Establecer una línea base reproducible de los automatismos ejecutados por PostgreSQL ante cambios de datos o DDL.

```text
3.475 TRIGGERS DE RELACIÓN
= 203 TRIGGERS DEFINIDOS POR USUARIO
+ 3.272 TRIGGERS INTERNOS DE FOREIGN KEY

102 FUNCIONES DE TRIGGER
= 31 SECURITY DEFINER
+ 71 SECURITY INVOKER

6 EVENT TRIGGERS ADMINISTRADOS
```

La existencia de un trigger no certifica que su orden, cuerpo, privilegios o efectos sean correctos. Esta tarea registra la topología ejecutable; la autorización integral queda en `SUPA-AUD-009`, el drift en `SUPA-AUD-016` y `SUPA-AUD-017`, las duplicidades en `SUPA-AUD-019`, y el mapa proceso → datos → RPC → eventos → aplicaciones en `SUPA-AUD-023`.

#### 2. Método de auditoría no mutante

Se consultaron únicamente catálogos PostgreSQL mediante `SELECT`:

- `pg_trigger` para triggers de relación, estado de habilitación, función, condición, constraint y parent trigger;
- `pg_get_triggerdef` para definición normalizada;
- `pg_proc`, `pg_namespace`, `pg_language` y `pg_get_functiondef` para identidad y cuerpo de funciones de trigger;
- `pg_constraint` para reconciliar triggers internos de claves foráneas;
- `pg_event_trigger` para automatismos de DDL;
- `pg_class` para relación, clase y esquema propietario.

No se ejecutaron triggers, RPC, DDL, DML, migraciones, `ALTER TABLE ... ENABLE/DISABLE TRIGGER`, `CREATE TRIGGER`, `DROP TRIGGER`, `GRANT` ni `REVOKE`.

#### 3. Artefacto canónico

```text
SUPABASE-TRIGGER-INVENTORY-008@1.0.0
```

Cada trigger explícito queda identificado por:

```text
table_schema
+ relation_name
+ trigger_name
+ enabled_mode
+ timing
+ level
+ events
+ has_when_condition
+ transition_tables
+ function_schema
+ function_name
+ function_identity_arguments
+ function_owner
+ function_security_mode
+ function_search_path
+ trigger_definition
+ observation_timestamp
```

Los triggers internos se registran por identidad nominal y constraint asociado, pero se resumen funcionalmente como infraestructura derivada de FK. No se documentan como automatismos empresariales independientes.

#### 4. Resultado global

| Clase                          |     Total |     Vento | Administrado |
| ------------------------------ | --------: | --------: | -----------: |
| triggers definidos por usuario |   **203** |   **196** |        **7** |
| triggers internos de FK        | **3.272** | **2.944** |      **328** |
| triggers de relación totales   | **3.475** | **3.140** |      **335** |
| funciones de trigger           |   **102** |    **73** |       **29** |
| event triggers                 |     **6** |         0 |        **6** |

Todos los 3.475 triggers de relación están habilitados en modo `ORIGIN` (`tgenabled='O'`). No se observaron triggers `DISABLED`, `REPLICA` ni `ALWAYS`.

No se observaron:

- triggers `INSTEAD OF`;
- triggers clonados desde particiones (`tgparentid <> 0`);
- transition tables `OLD TABLE` o `NEW TABLE`;
- constraint triggers diferibles;
- triggers explícitos de nivel statement en objetos Vento.

#### 5. Triggers explícitos Vento por esquema

| Esquema de la relación | Triggers | Relaciones afectadas | Funciones distintas | `DEFINER` | `INVOKER` |
| ---------------------- | -------: | -------------------: | ------------------: | --------: | --------: |
| `club`                 |        8 |                    8 |                   1 |         0 |         8 |
| `pass`                 |       28 |                   18 |                  12 |        11 |        17 |
| `payments`             |        1 |                    1 |                   1 |         0 |         1 |
| `pos`                  |        2 |                    2 |                   1 |         0 |         2 |
| `public`               |      123 |                   92 |                  57 |        18 |       105 |
| `talento`              |       10 |                   10 |                   1 |         0 |        10 |
| `vital`                |       24 |                   24 |                   1 |         0 |        24 |
| **TOTAL**              |  **196** |              **155** |                   — |    **29** |   **167** |

Los esquemas Vento `app_private` y `viso` no tienen triggers definidos por usuario. `viso` sí contiene triggers internos de FK; esa presencia no se interpreta como automatismo empresarial explícito.

#### 6. Forma de disparo de los 196 triggers Vento

| Temporización | Nivel | Triggers | Eventos INSERT | Eventos UPDATE | Eventos DELETE | `DEFINER` | `INVOKER` |
| ------------- | ----- | -------: | -------------: | -------------: | -------------: | --------: | --------: |
| `BEFORE`      | `ROW` |  **181** |             38 |            174 |              0 |        14 |       167 |
| `AFTER`       | `ROW` |   **15** |             12 |              9 |              2 |        15 |         0 |
| **TOTAL**     | —     |  **196** |              — |              — |              — |    **29** |   **167** |

Un mismo trigger puede cubrir más de un evento; por ello los conteos por evento no se suman para obtener 196.

Los 15 automatismos Vento `AFTER` se ejecutan mediante funciones `SECURITY DEFINER`. Los 181 `BEFORE` incluyen 14 `DEFINER` y 167 `INVOKER`. Esta distribución es una señal de diseño, no una aprobación de privilegios.

#### 7. Triggers explícitos administrados

Los siete triggers definidos por usuario en esquemas administrados son:

| Relación                | Trigger                              | Forma                                                             | Función                                 | Seguridad |
| ----------------------- | ------------------------------------ | ----------------------------------------------------------------- | --------------------------------------- | --------- |
| `auth.users`            | `on_auth_user_created`               | `AFTER INSERT FOR EACH ROW`                                       | `public.handle_new_user()`              | `DEFINER` |
| `cron.job`              | `cron_job_cache_invalidate`          | `AFTER INSERT OR UPDATE OR DELETE OR TRUNCATE FOR EACH STATEMENT` | `cron.job_cache_invalidate()`           | `INVOKER` |
| `realtime.subscription` | `tr_check_filters`                   | `BEFORE INSERT OR UPDATE FOR EACH ROW`                            | `realtime.subscription_check_filters()` | `INVOKER` |
| `storage.buckets`       | `enforce_bucket_name_length_trigger` | `BEFORE INSERT OR UPDATE FOR EACH ROW`                            | `storage.enforce_bucket_name_length()`  | `INVOKER` |
| `storage.buckets`       | `protect_buckets_delete`             | `BEFORE DELETE FOR EACH STATEMENT`                                | `storage.protect_delete()`              | `INVOKER` |
| `storage.objects`       | `protect_objects_delete`             | `BEFORE DELETE FOR EACH STATEMENT`                                | `storage.protect_delete()`              | `INVOKER` |
| `storage.objects`       | `update_objects_updated_at`          | `BEFORE UPDATE FOR EACH ROW`                                      | `storage.update_updated_at_column()`    | `INVOKER` |

`on_auth_user_created` reside sobre una tabla administrada pero ejecuta una función empresarial Vento. Por tanto, su tabla no transfiere ownership de la función y su continuidad deberá comprobarse tanto en Auth como en el proceso empresarial de alta.

#### 8. Triggers internos derivados de claves foráneas

Los **3.272 triggers internos** corresponden exclusivamente a enforcement de `FOREIGN KEY`:

| Gobierno de la relación | Triggers internos FK |
| ----------------------- | -------------------: |
| Vento                   |            **2.944** |
| PostgreSQL/Supabase     |              **328** |
| **TOTAL**               |            **3.272** |

No se observaron triggers internos asociados a PK, UNIQUE o CHECK. El número de triggers internos no equivale al número de FK: PostgreSQL puede crear varios triggers por constraint para comprobar modificaciones en la tabla referenciante y acciones sobre la tabla referenciada.

Estos objetos se reconciliarán contra las 818 FK de `SUPA-AUD-005`; no se administrarán individualmente mediante migraciones empresariales.

#### 9. Funciones de trigger

```text
102 FUNCIONES CON RETORNO trigger/event_trigger
= 73 UBICADAS EN ESQUEMAS VENTO
+ 29 ADMINISTRADAS
```

Dentro de las 73 funciones Vento:

- 31 son `SECURITY DEFINER`;
- 42 son `SECURITY INVOKER`;
- 71 están enlazadas al menos a un trigger explícito o interno;
- 2 no están enlazadas actualmente a ningún trigger.

Funciones Vento sin trigger asociado:

1. `public.notify_shift_published()`;
2. `public.update_loyalty_balance()`.

Su retorno `trigger` demuestra intención de automatismo, pero la ausencia de enlace no permite concluir si son legacy, drift, instalación incompleta o funciones reservadas. La clasificación corresponde a `SUPA-AUD-016`, `SUPA-AUD-017`, `SUPA-AUD-018`, `SUPA-AUD-019` y `SUPA-AUD-023`.

#### 10. Reutilización de funciones

Las funciones de mantenimiento temporal más reutilizadas son:

| Función                                            | Triggers explícitos | Relaciones |
| -------------------------------------------------- | ------------------: | ---------: |
| `public._set_updated_at()`                         |                  44 |         44 |
| `public.update_updated_at()`                       |                  27 |         27 |
| `vital.set_updated_at()`                           |                  24 |         24 |
| `talento.set_updated_at()`                         |                  10 |         10 |
| `public.touch_updated_at()`                        |                   9 |          9 |
| `public.touch_restock_fulfillment_updated_at()`    |                   6 |          6 |
| `public.set_updated_at()`                          |                   5 |          5 |
| `public.set_numera_updated_at()`                   |                   4 |          4 |
| `public.tg_set_updated_at()`                       |                   4 |          4 |
| `public.set_pulso_daily_sales_import_updated_at()` |                   2 |          2 |

La coexistencia de múltiples helpers equivalentes de `updated_at` no se declara duplicidad funcional por nombre. Su semántica, owner, consumidores y posibilidad de consolidación pertenecen a `SUPA-AUD-018`, `SUPA-AUD-019`, `SUPA-AUD-022` y normalización posterior.

#### 11. Relaciones con múltiples automatismos

Las concentraciones más altas observadas son:

| Relación                       | Triggers explícitos | Función principal de la concentración                            |
| ------------------------------ | ------------------: | ---------------------------------------------------------------- |
| `public.restock_request_items` |               **6** | políticas, UOM, mediciones, estado de ítem y estado de solicitud |
| `public.attendance_logs`       |               **4** | geofence, resolución de turno, secuencia y contexto              |
| `pass.commercial_collections`  |               **3** | reconciliación, sincronización y `updated_at`                    |
| `public.employees`             |               **3** | asignación por sede y validación rol/sede                        |
| `public.inventory_locations`   |               **3** | área/sede, parent y `updated_at`                                 |
| `public.orders`                |               **3** | sesión de entrega, facturación y fulfillment                     |

La cantidad no implica conflicto. `SUPA-AUD-023` deberá definir orden, precondiciones, datos producidos y consumidores; `SUPA-AUD-019` deberá detectar efectos duplicados o fuentes competidoras.

#### 12. Hallazgo de posible automatismo duplicado

`public.employee_push_tokens` tiene dos triggers `BEFORE UPDATE` de mantenimiento temporal:

- `set_employee_push_tokens_updated_at` → `public._set_updated_at()`;
- `trg_employee_push_tokens_updated_at` → `public.update_updated_at()`.

Ambos están habilitados y se disparan en la misma clase de operación. La evidencia demuestra solapamiento estructural, pero no autoriza eliminar ninguno sin comparar cuerpos, migraciones, consumidores y efecto final. Queda vinculado a `SUPA-AUD-016`, `SUPA-AUD-017`, `SUPA-AUD-018`, `SUPA-AUD-019` y transición aprobada.

#### 13. Triggers con condición `WHEN`

Solo dos triggers explícitos usan condición `WHEN`:

1. `pass.pass_delivery_addresses_single_default`:
   - `AFTER INSERT OR UPDATE OF is_default`;
   - ejecuta `pass.ensure_single_default_delivery_address()`;
   - condición `new.is_default = true`.
2. `public.trg_orders_sync_billing_request_status`:
   - `AFTER UPDATE OF status, payment_status`;
   - ejecuta `public.sync_order_billing_request_status()`;
   - condición de cambio real entre `OLD` y `NEW`.

La ausencia de `WHEN` en los demás triggers no significa ejecución inútil: varios limitan columnas mediante `UPDATE OF`, o realizan validaciones obligatorias en toda operación.

#### 14. Event triggers administrados

Los seis event triggers son administrados por Supabase/PostgreSQL y están habilitados en modo `ORIGIN`:

| Event trigger               | Evento            | Tags               | Función                                |
| --------------------------- | ----------------- | ------------------ | -------------------------------------- |
| `issue_graphql_placeholder` | `sql_drop`        | `DROP EXTENSION`   | `extensions.set_graphql_placeholder()` |
| `issue_pg_cron_access`      | `ddl_command_end` | `CREATE EXTENSION` | `extensions.grant_pg_cron_access()`    |
| `issue_pg_graphql_access`   | `ddl_command_end` | `CREATE FUNCTION`  | `extensions.grant_pg_graphql_access()` |
| `issue_pg_net_access`       | `ddl_command_end` | `CREATE EXTENSION` | `extensions.grant_pg_net_access()`     |
| `pgrst_ddl_watch`           | `ddl_command_end` | todos              | `extensions.pgrst_ddl_watch()`         |
| `pgrst_drop_watch`          | `sql_drop`        | todos              | `extensions.pgrst_drop_watch()`        |

No se autoriza alterar estos event triggers. Su función es mantener integración de extensiones y recarga de esquema de PostgREST.

#### 15. Hallazgos y destino documental

| Hallazgo                                                                | Riesgo                                                                      | Tarea responsable                                              |
| ----------------------------------------------------------------------- | --------------------------------------------------------------------------- | -------------------------------------------------------------- |
| 196 triggers empresariales explícitos distribuidos sobre 155 relaciones | automatismos invisibles, orden no gobernado o efectos laterales no mapeados | `SUPA-AUD-022`, `SUPA-AUD-023`                                 |
| 29 triggers Vento usan funciones `SECURITY DEFINER`                     | bypass de RLS o privilegio elevado sin autorización contextual demostrada   | `SUPA-AUD-009`, `SUPA-AUD-023`                                 |
| dos funciones de trigger Vento no tienen trigger asociado               | drift, función legacy o automatismo no instalado                            | `SUPA-AUD-016`, `SUPA-AUD-017`, `SUPA-AUD-018`, `SUPA-AUD-019` |
| dos triggers de `employee_push_tokens` mantienen `updated_at`           | doble ejecución, divergencia de helper o deuda de migración                 | `SUPA-AUD-016`, `SUPA-AUD-017`, `SUPA-AUD-019`                 |
| seis triggers sobre `restock_request_items`                             | orden implícito, efectos acoplados o transición parcial                     | `SUPA-AUD-019`, `SUPA-AUD-023`, paquete E5 de NEXO             |
| cuatro triggers sobre `attendance_logs`                                 | orden crítico no certificado y doble resolución de contexto                 | `SUPA-AUD-019`, `SUPA-AUD-023`, paquete E5 de ANIMA            |
| 3.272 triggers internos dependen de FK                                  | conteo inflado o manipulación manual de infraestructura derivada            | `SUPA-AUD-005`, `SUPA-AUD-016`, `SUPA-AUD-017`                 |
| seis event triggers administrados reaccionan a DDL                      | modificación accidental de infraestructura Supabase/PostgREST               | `SUPA-AUD-015`, `SUPA-AUD-016`, `SUPA-AUD-017`                 |

No queda hallazgo narrativo sin tarea responsable.

#### 16. Decisiones que esta tarea no autoriza

`SUPA-AUD-008` no autoriza:

1. crear, eliminar, habilitar o deshabilitar triggers;
2. cambiar orden, temporización, eventos, condición o nivel;
3. modificar funciones ejecutadas por triggers;
4. consolidar helpers de `updated_at`;
5. retirar las dos funciones sin trigger asociado;
6. eliminar uno de los triggers de `employee_push_tokens`;
7. modificar triggers internos de FK;
8. alterar event triggers administrados;
9. declarar que un trigger `SECURITY DEFINER` es vulnerable únicamente por su modo;
10. certificar el comportamiento operativo sin pruebas transaccionales controladas.

#### 17. Requisitos de prueba derivados

Se incorporan al registro canónico:

```text
TREQ-SUPABASE-098 a TREQ-SUPABASE-109
```

Protegen cobertura total, separación entre triggers explícitos e internos, vinculación función-trigger, forma de disparo, seguridad, automatismos sin enlace, solapamientos, event triggers, procedencia y detección de drift.

#### 18. Huellas de integridad

```text
VENTO_USER_TRIGGER_REGISTRY_SHA256 = 61c95cc2e03953d7782d38ba803c1664b44f7bcbc62c714fc58e748dcc80d73a
VENTO_TRIGGER_FUNCTION_REGISTRY_SHA256 = 9fb01f9cf20c56c97a54abe4be6185cd47e0bb2de7a71ce7565b80eddb37cde7
INTERNAL_TRIGGER_REGISTRY_SHA256 = b0bf2a7d3147328e94ca9f766128b1fbc3ab64722b9014fd50c36245fd309796
ALL_RELATION_TRIGGER_REGISTRY_SHA256 = 6b12609dbd4de2cf52e9406ad135dd38646ca52e95588e982f4c7f932493355c
OBSERVED_AT_UTC = 2026-07-29T19:58:03.294936Z
SUPABASE_PROJECT_REF = clzdpinthhtknkmefsxx
POSTGRESQL_VERSION = 17.6
```

Toda variación en trigger, función, evento, temporización, condición, relación, modo de habilitación, seguridad o constraint asociado deberá registrarse como drift antes de arquitectura o transición.

#### 19. Resultado final

`SUPA-AUD-008` deja inventariados y reconciliados:

- **3.475** triggers de relación;
- **203** triggers definidos por usuario: 196 Vento y 7 administrados;
- **3.272** triggers internos derivados exclusivamente de FK;
- **102** funciones de trigger: 73 Vento y 29 administradas;
- **29** triggers explícitos Vento ejecutados por funciones `SECURITY DEFINER`;
- **167** triggers explícitos Vento ejecutados por funciones `SECURITY INVOKER`;
- **2** funciones Vento de trigger sin enlace actual;
- **2** triggers condicionales con `WHEN`;
- **6** event triggers administrados;
- **0** triggers deshabilitados, `REPLICA`, `ALWAYS`, `INSTEAD OF`, con transition tables o clones de partición;
- un solapamiento estructural en `public.employee_push_tokens` pendiente de resolución documental.

La tarea no modifica Supabase y no certifica todavía autorización, orden semántico ni funcionamiento operativo de los automatismos.


### [ ] SUPA-AUD-009 — Inventariar políticas RLS, grants y privilegios por rol
### [ ] SUPA-AUD-010 — Auditar Auth, usuarios, identidades, sesiones y vínculos empresariales
### [ ] SUPA-AUD-011 — Auditar identidades de trabajadores, clientes, dispositivos y actores de sistema
### [ ] SUPA-AUD-012 — Auditar buckets, rutas, políticas y ciclos de vida de Storage
### [ ] SUPA-AUD-013 — Auditar publicaciones, canales y consumidores de Realtime
### [ ] SUPA-AUD-014 — Auditar Edge Functions, webhooks, cron, colas y automatizaciones
### [ ] SUPA-AUD-015 — Auditar extensiones, secretos, variables y configuración del proyecto
### [ ] SUPA-AUD-016 — Comparar Supabase remoto con migraciones y configuración de `vento-shell`
### [ ] SUPA-AUD-017 — Detectar drift, cambios manuales y objetos sin migración
### [ ] SUPA-AUD-018 — Identificar tablas, columnas, funciones y políticas legacy
### [ ] SUPA-AUD-019 — Detectar duplicidades, datos huérfanos y fuentes de verdad competidoras
### [ ] SUPA-AUD-020 — Auditar índices, consultas, planes, crecimiento y retención
### [ ] SUPA-AUD-021 — Auditar generación y consumo de tipos de base de datos
### [ ] SUPA-AUD-022 — Crear mapa objeto → capacidad empresarial preliminar → propietario actual → consumidores actuales
### [ ] SUPA-AUD-023 — Crear mapa proceso → datos → RPC → eventos → aplicaciones
### [ ] SUPA-AUD-024 — Clasificar riesgos críticos, altos, medios y deuda técnica
