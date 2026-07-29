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


### ✅ SUPA-AUD-009 — Inventariar políticas RLS, grants y privilegios por rol

#### 1. Objetivo

Establecer una línea base reproducible de autorización PostgreSQL para los 23 esquemas no efímeros del proyecto `vento-os-dev`, distinguiendo de forma obligatoria:

```text
ACCESO EFECTIVO
= USAGE DEL ESQUEMA
+ PRIVILEGIO SOBRE EL OBJETO
+ POLÍTICA RLS APLICABLE CUANDO RLS ESTÁ ACTIVO
+ MODO DE EJECUCIÓN DE LA FUNCIÓN O VISTA
+ ATRIBUTOS Y MEMBRESÍAS DEL ROL
```

La presencia de un `GRANT` no concede por sí sola acceso a filas protegidas por RLS. La presencia de RLS tampoco concede acceso al objeto. Una política dirigida a `PUBLIC` no vuelve público un objeto si el rol carece de `USAGE` del esquema o del privilegio necesario. `service_role`, propietarios y roles con `BYPASSRLS` se analizan separadamente porque pueden quedar fuera del filtrado ordinario de RLS.

#### 2. Semántica canónica de autorización

| Capa                 | Pregunta que responde                                      | No debe confundirse con                       |
| -------------------- | ---------------------------------------------------------- | --------------------------------------------- |
| `USAGE` del esquema  | ¿el rol puede resolver objetos del esquema?                | acceso a tablas o funciones                   |
| privilegio de objeto | ¿puede ejecutar `SELECT`, DML, `EXECUTE`, `USAGE`, etc.?   | autorización sobre filas                      |
| RLS habilitado       | ¿PostgreSQL debe aplicar políticas a roles no exceptuados? | existencia de una política permisiva          |
| política RLS         | ¿qué filas admite para un comando y rol?                   | acceso al objeto o al esquema                 |
| `SECURITY INVOKER`   | ¿la rutina usa privilegios del llamador?                   | seguridad automática del cuerpo               |
| `SECURITY DEFINER`   | ¿la rutina usa privilegios del propietario?                | autorización interna suficiente               |
| `BYPASSRLS`          | ¿el rol omite RLS?                                         | permiso para exponer la credencial a clientes |
| ACL por defecto      | ¿qué permisos heredarán objetos futuros?                   | permisos actuales de objetos existentes       |

Una decisión de seguridad requiere componer todas las capas. Esta tarea no declara una tabla abierta únicamente porque tenga grants, ni cerrada únicamente porque tenga RLS.

#### 3. Método de auditoría no mutante

Se consultaron exclusivamente catálogos y funciones de inspección mediante `SELECT`:

- `pg_class` para `relrowsecurity`, `relforcerowsecurity`, clase y owner;
- `pg_policy` y `pg_get_expr` para identidad, modo, comando, roles, `USING` y `WITH CHECK`;
- `pg_namespace`, `pg_roles`, `pg_auth_members` y `pg_db_role_setting` para esquemas, atributos, membresías y ajustes de rol;
- `has_schema_privilege`, `has_table_privilege`, `has_sequence_privilege`, `has_function_privilege` y `has_type_privilege` para privilegios efectivos;
- `aclexplode`, `acldefault` y `pg_default_acl` para ACL actuales y futuras;
- `pg_proc`, `pg_type`, `pg_sequence` y `pg_class` para reconciliar funciones, tipos, secuencias, tablas y vistas;
- Supabase Database Advisors para contrastar RLS sin políticas, vistas privilegiadas y funciones `SECURITY DEFINER` ejecutables por roles cliente.

No se ejecutaron `GRANT`, `REVOKE`, `ALTER TABLE ... ENABLE/FORCE ROW LEVEL SECURITY`, `CREATE/DROP POLICY`, cambios de roles, migraciones, RPC, DDL ni DML.

#### 4. Resultado global de RLS y políticas

| Métrica                              |   Total |   Vento | Administrado |
| ------------------------------------ | ------: | ------: | -----------: |
| objetos tabulares `r/p`              | **432** | **317** |      **115** |
| RLS habilitado                       | **332** | **305** |       **27** |
| RLS deshabilitado                    | **100** |  **12** |       **88** |
| `FORCE ROW LEVEL SECURITY`           |   **0** |   **0** |        **0** |
| políticas RLS                        | **831** | **790** |       **41** |
| tablas con políticas                 | **303** |       — |            — |
| tablas sin políticas                 | **122** |       — |            — |
| RLS habilitado sin políticas         |  **29** |   **5** |       **24** |
| RLS deshabilitado con políticas      |   **0** |   **0** |        **0** |
| RLS deshabilitado con grants cliente |   **0** |   **0** |        **0** |

Las **831 políticas** están asociadas a tablas con RLS habilitado. Una reconciliación directa `pg_policy.polrelid → pg_class.oid` confirmó cero políticas sobre tablas con `relrowsecurity=false`.

La ausencia total de `FORCE ROW LEVEL SECURITY` significa que propietarios y roles con `BYPASSRLS` no quedan sometidos al mismo filtro que los roles cliente ordinarios. No se deduce de ello que cada owner deba cambiar ni que `FORCE RLS` sea obligatorio para todas las tablas.

#### 5. Matriz por esquema

| Esquema               | Gobierno     |  Tablas | RLS activo | RLS inactivo | Políticas | RLS activo sin política |
| --------------------- | ------------ | ------: | ---------: | -----------: | --------: | ----------------------: |
| `app_private`         | Vento        |       1 |          0 |            1 |         0 |                       0 |
| `auth`                | administrado |      23 |         16 |            7 |         0 |                  **16** |
| `club`                | Vento        |      11 |         11 |            0 |        11 |                       0 |
| `cron`                | administrado |       2 |          2 |            0 |         2 |                       0 |
| `extensions`          | administrado |       0 |          0 |            0 |         0 |                       0 |
| `graphql`             | administrado |       0 |          0 |            0 |         0 |                       0 |
| `graphql_public`      | administrado |       0 |          0 |            0 |         0 |                       0 |
| `information_schema`  | administrado |       4 |          0 |            4 |         0 |                       0 |
| `net`                 | administrado |       2 |          0 |            2 |         0 |                       0 |
| `pass`                | Vento        |      26 |         26 |            0 |       102 |                   **4** |
| `payments`            | Vento        |       2 |          2 |            0 |         3 |                       0 |
| `pg_catalog`          | administrado |      64 |          0 |           64 |         0 |                       0 |
| `pg_toast`            | administrado |       0 |          0 |            0 |         0 |                       0 |
| `pgbouncer`           | administrado |       0 |          0 |            0 |         0 |                       0 |
| `pos`                 | Vento        |      13 |         13 |            0 |        21 |                       0 |
| `public`              | Vento        |     185 |        185 |            0 |       444 |                   **1** |
| `realtime`            | administrado |      10 |          1 |            9 |         0 |                   **1** |
| `storage`             | administrado |       8 |          8 |            0 |        39 |                   **7** |
| `supabase_migrations` | administrado |       1 |          0 |            1 |         0 |                       0 |
| `talento`             | Vento        |      13 |         13 |            0 |        20 |                       0 |
| `vault`               | administrado |       1 |          0 |            1 |         0 |                       0 |
| `viso`                | Vento        |      12 |          1 |           11 |         1 |                       0 |
| `vital`               | Vento        |      54 |         54 |            0 |       188 |                       0 |
| **TOTAL**             | —            | **432** |    **332** |      **100** |   **831** |                  **29** |

Las **29 tablas con RLS activo y sin políticas** se dividen en **5 tablas Vento** y **24 administradas por Supabase/PostgreSQL**: 16 en `auth`, 1 en `realtime` y 7 en `storage`. Las 24 administradas se conservan como estado de producto observado; su ausencia de políticas no se clasifica automáticamente como defecto empresarial porque sus mecanismos de acceso y operación pertenecen a los servicios administrados.

#### 6. Taxonomía de las 831 políticas

##### 6.1. Modo

| Modo          | Políticas |
| ------------- | --------: |
| `PERMISSIVE`  |   **831** |
| `RESTRICTIVE` |     **0** |

Todas las políticas son permisivas. Cuando varias políticas permisivas aplican al mismo comando y rol, PostgreSQL combina su admisión mediante OR. Este inventario no concluye que deba existir una política restrictiva; conserva la ausencia para análisis posterior de composición.

##### 6.2. Comando

| Comando   |   Total |   Vento | Administrado |
| --------- | ------: | ------: | -----------: |
| `ALL`     | **137** |     135 |            2 |
| `SELECT`  | **333** |     327 |            6 |
| `INSERT`  | **146** |     134 |           12 |
| `UPDATE`  | **121** |     109 |           12 |
| `DELETE`  |  **94** |      85 |            9 |
| **TOTAL** | **831** | **790** |       **41** |

##### 6.3. Destinos de rol

Las asignaciones de rol no son mutuamente excluyentes: una política puede listar más de un rol.

| Destino         | Total observado | Vento | Administrado |
| --------------- | --------------: | ----: | -----------: |
| `PUBLIC`        |         **213** |   211 |            2 |
| `anon`          |          **25** |    25 |            0 |
| `authenticated` |         **610** |   571 |           39 |
| `service_role`  |           **6** |     6 |            0 |

`PUBLIC` significa todos los roles PostgreSQL, pero la política solo participa después de superar la capa de esquema y objeto. Por ello, las 211 políticas Vento dirigidas a `PUBLIC` no equivalen a 211 superficies públicas.

#### 7. Tablas Vento con RLS habilitado y sin políticas

| Tabla                                      | Grants cliente observados                       | Efecto actual para roles sin `BYPASSRLS` |
| ------------------------------------------ | ----------------------------------------------- | ---------------------------------------- |
| `pass.site_business_hours`                 | `authenticated: SELECT`                         | acceso denegado por ausencia de política |
| `pass.site_delivery_slots`                 | `authenticated: SELECT`                         | acceso denegado por ausencia de política |
| `pass.site_schedule_exception_resolutions` | ninguno para `anon/authenticated`               | sin superficie cliente directa           |
| `pass.site_schedule_exceptions`            | ninguno para `anon/authenticated`               | sin superficie cliente directa           |
| `public.client_push_tokens`                | `authenticated: SELECT, INSERT, UPDATE, DELETE` | acceso denegado por ausencia de política |

Las cinco tablas Vento son `deny by default` para roles ordinarios. En tres existe además grant de cliente, por lo que la configuración produce una superficie declarada a nivel de objeto pero inutilizable a nivel de filas. Esto puede ser una protección deliberada, una instalación incompleta o drift; la tarea no lo decide.

`service_role` conserva acceso por sus grants y `BYPASSRLS`, por lo que “sin políticas” no significa inaccesible para backend privilegiado.

#### 8. Tablas Vento con RLS deshabilitado

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

Ninguna de las doce tiene privilegios efectivos de tabla para `anon` o `authenticated`. Por tanto, en el corte actual no están abiertas directamente a roles cliente pese a tener RLS deshabilitado.

Este resultado no autoriza mantener RLS desactivado de forma indefinida. Un grant futuro, cambio de esquema expuesto, función privilegiada o vista podría modificar la superficie. La protección actual depende de la continuidad de ACL y del aislamiento del esquema.

#### 9. Superficie anónima de tablas y vistas

Cuatro tablas `pass` poseen privilegios completos de DML para `anon`, todas con RLS activo y políticas:

| Tabla                       | Privilegios de objeto            | Políticas |
| --------------------------- | -------------------------------- | --------: |
| `pass.loyalty_redemptions`  | `SELECT, INSERT, UPDATE, DELETE` |         6 |
| `pass.loyalty_transactions` | `SELECT, INSERT, UPDATE, DELETE` |         2 |
| `pass.pass_satellites`      | `SELECT, INSERT, UPDATE, DELETE` |         5 |
| `pass.user_favorites`       | `SELECT, INSERT, UPDATE, DELETE` |         3 |

Los grants no permiten omitir RLS. La semántica individual de cada política y operación deberá validarse con pruebas negativas y de territorio antes de certificar la superficie.

Trece vistas seleccionables por `anon` se observaron con `security_invoker=true`:

```text
public.catalog_item_customization_template_assignments
public.catalog_item_customization_template_groups
public.catalog_item_customization_templates
public.catalog_item_option_consumption_rules
public.catalog_item_option_groups
public.catalog_item_option_recipe_effects
public.catalog_item_options
public.catalog_item_presentation
public.catalog_option_visual_assets
public.commercial_categories
public.commercial_collection_categories
public.commercial_collections
public.pass_delivery_distance_rates
```

No se observaron vistas anónimas Vento de esta lista ejecutando con semántica privilegiada del owner.

#### 10. Políticas dirigidas explícitamente a `anon`

Las 25 políticas se distribuyen así:

| Esquema    | Comando  | Cantidad | Naturaleza observada                                                  |
| ---------- | -------- | -------: | --------------------------------------------------------------------- |
| `pass`     | `SELECT` |       12 | catálogo, tarifas, recompensas y satélites activos                    |
| `payments` | `ALL`    |        1 | denegación explícita `false`                                          |
| `public`   | `SELECT` |        2 | configuración y política de actualización visibles                    |
| `public`   | `ALL`    |        8 | denegaciones explícitas `false` sobre objetos internos/legacy/staging |
| `talento`  | `SELECT` |        1 | vacantes publicadas                                                   |
| `viso`     | `ALL`    |        1 | denegación explícita `false`                                          |

Las políticas `ALL` con `USING false` y `WITH CHECK false` son barreras declarativas, no grants. Deben conservarse diferenciadas de políticas de acceso real.

#### 11. Modelo de roles y membresías

| Rol                       | Login  | Herencia       | `BYPASSRLS`         | Función observada                             |
| ------------------------- | ------ | -------------- | ------------------- | --------------------------------------------- |
| `anon`                    | no     | sí             | no                  | actor cliente sin sesión                      |
| `authenticated`           | no     | sí             | no                  | actor cliente con JWT válido                  |
| `service_role`            | no     | sí             | **sí**              | backend privilegiado                          |
| `authenticator`           | **sí** | **no**         | no                  | gateway que adopta el rol indicado por JWT    |
| `postgres`                | sí     | sí             | **sí**              | owner/administración del proyecto             |
| `supabase_admin`          | sí     | sí             | **sí**              | superusuario administrado                     |
| roles `supabase_*_admin`  | mixto  | según producto | generalmente **sí** | operación de productos Supabase               |
| `supabase_read_only_user` | sí     | sí             | **sí**              | lectura administrativa, no aislamiento tenant |
| `dashboard_user`          | no     | sí             | no                  | lectura de dashboard según grants             |

`authenticator` es miembro de `anon`, `authenticated` y `service_role` con `INHERIT=false` y `SET=true`. Esto permite cambiar al rol resuelto por PostgREST sin heredar simultáneamente las capacidades de los tres.

`service_role` nunca debe interpretarse como identidad de usuario final: sus privilegios y `BYPASSRLS` constituyen una frontera de backend. `supabase_read_only_user` tampoco es un rol tenant: aunque no tenga DML, puede leer sin quedar limitado por RLS.

#### 12. Privilegios efectivos sobre objetos Vento

Universo: **9 esquemas**, **379 relaciones**, **2 secuencias**, **347 funciones** y **400 tipos** gobernados por Vento.

| Rol                       | Esquemas `USAGE` | Relaciones `SELECT` | `INSERT` | `UPDATE` | `DELETE` | Funciones `EXECUTE` |  Secuencias | Tipos `USAGE` |
| ------------------------- | ---------------: | ------------------: | -------: | -------: | -------: | ------------------: | ----------: | ------------: |
| `anon`                    |              5/9 |              51/379 |        4 |        4 |        4 |             134/347 |         0/2 |       400/400 |
| `authenticated`           |              8/9 |             357/379 |      334 |      332 |      329 |             244/347 |         2/2 |       400/400 |
| `service_role`            |              9/9 |             346/379 |      328 |      328 |      326 |             341/347 |         2/2 |       400/400 |
| `authenticator`           |              0/9 |                   0 |        0 |        0 |        0 |                   0 |           0 |             0 |
| `supabase_read_only_user` |              9/9 |             379/379 |        0 |        0 |        0 |             347/347 | `USAGE` 2/2 |       400/400 |
| `dashboard_user`          |              9/9 |             379/379 |        0 |        0 |        0 |             347/347 |         0/2 |       400/400 |

Los conteos son privilegios efectivos y pueden incluir ACL directas, `PUBLIC`, ownership o membresías. No significan filas visibles ni operaciones autorizadas por negocio.

La amplitud de `authenticated` es consistente con un diseño Supabase donde RLS gobierna filas, pero obliga a que toda tabla expuesta tenga políticas completas, territoriales y probadas. Un grant amplio sin RLS correcto sería crítico.

#### 13. ACL actuales y diferencia frente a privilegios efectivos

ACL directas o implícitas por defecto PostgreSQL sobre objetos Vento:

| Grantee         | Clase                    | Señal principal                                        |
| --------------- | ------------------------ | ------------------------------------------------------ |
| `PUBLIC`        | funciones                | `EXECUTE` sobre **134** funciones                      |
| `PUBLIC`        | tipos                    | `USAGE` sobre **400** tipos                            |
| `PUBLIC`        | esquema                  | `USAGE` sobre `public`                                 |
| `PUBLIC`        | tablas/vistas/secuencias | **0 grants**                                           |
| `anon`          | tablas                   | 26 `SELECT`; 4 con DML completo                        |
| `anon`          | vistas                   | 13 `SELECT`                                            |
| `authenticated` | tablas                   | 295 `SELECT`, 273 `INSERT`, 270 `UPDATE`, 268 `DELETE` |
| `authenticated` | vistas                   | 62 `SELECT`                                            |
| `authenticated` | funciones                | 240 `EXECUTE` explícitos                               |
| `service_role`  | funciones                | 332 `EXECUTE` explícitos                               |

La diferencia entre 6 grants explícitos de función para `anon` y 134 ejecuciones efectivas se explica principalmente por `EXECUTE` concedido a `PUBLIC`. Esa herencia debe evaluarse junto con `SUPA-AUD-007`.

#### 14. ACL por defecto y objetos futuros

Los defaults actuales pueden ampliar automáticamente la superficie al crear objetos:

| Owner/esquema                                     | Clase futura                   | Grants heredados relevantes                                                                                                |
| ------------------------------------------------- | ------------------------------ | -------------------------------------------------------------------------------------------------------------------------- |
| `postgres` / `public`                             | tablas                         | privilegios amplios para `authenticated` y `service_role`, incluidos DML, `TRUNCATE`, `REFERENCES`, `TRIGGER` y `MAINTAIN` |
| `postgres` / `public`                             | secuencias                     | privilegios completos para `authenticated` y `service_role`                                                                |
| `postgres` / `public`                             | funciones                      | `EXECUTE` para `authenticated` y `service_role`                                                                            |
| `postgres` / `pass`                               | tablas y secuencias            | privilegios amplios para `service_role`                                                                                    |
| `postgres` / `pass`                               | funciones                      | `EXECUTE` para `service_role`                                                                                              |
| `postgres` / `club`, `payments`, `pos`, `talento` | funciones                      | `EXECUTE` para `service_role`                                                                                              |
| `postgres` / `viso`                               | tablas, secuencias y funciones | privilegios amplios para `service_role`                                                                                    |
| `postgres` / `vital`                              | tablas                         | DML y lectura para `authenticated`; ejecución/servicio para `service_role` según clase                                     |
| `postgres` / `vital`                              | funciones                      | `EXECUTE` para `authenticated` y `service_role`                                                                            |

Estos defaults son parte del contrato de creación. Un objeto nuevo puede nacer con exposición distinta a la esperada aunque su migración no contenga un `GRANT` explícito. `SUPA-AUD-016` y `SUPA-AUD-017` deberán comparar defaults remotos con migraciones y prevenir drift.

#### 15. Vistas privilegiadas y funciones `SECURITY DEFINER`

Supabase Database Advisors confirmó cuatro vistas `public` con semántica privilegiada del owner y `SELECT` efectivo para `authenticated`:

```text
public.permission_catalog_human_v1
public.shared_operational_device_actor_policies_admin_v1
public.shared_operational_device_templates_admin_v1
public.shared_operational_devices_admin_v1
```

Las cuatro tienen `security_invoker=false`, no son seleccionables por `anon` y sí por `authenticated`. Su nombre administrativo no constituye autorización. Deben revisarse por columnas expuestas, predicates, consumidores y controles de aplicación antes de conservarlas o convertirlas.

El advisor también confirmó la exposición cliente de funciones `SECURITY DEFINER` inventariada en `SUPA-AUD-007`. Esta tarea no duplica las 210 firmas Vento; compone sus grants con roles y RLS:

- 45 `SECURITY DEFINER` Vento son ejecutables efectivamente por `anon`;
- 151 son ejecutables efectivamente por `authenticated`;
- 14 combinan `SECURITY DEFINER`, owner con `BYPASSRLS`, `row_security=off` y ejecución mediante `PUBLIC`.

La revisión cuerpo por cuerpo y su autorización empresarial siguen siendo obligatorias; el advisor no convierte automáticamente cada función en vulnerabilidad ni certifica su intención.

#### 16. Señales estáticas en políticas

| Señal                                  | Políticas observadas | Interpretación permitida                                           |
| -------------------------------------- | -------------------: | ------------------------------------------------------------------ |
| `auth.uid()`                           |                  341 | identidad usada en la expresión; no demuestra territorio completo  |
| `auth.jwt()`                           |                   18 | dependencia de claims; debe validarse origen y frescura            |
| `auth.role()`                          |                **1** | uso de helper deprecado pendiente de normalización                 |
| `raw_user_meta_data` / `user_metadata` |                **0** | no se observó autorización basada en metadata editable del usuario |
| `raw_app_meta_data` / `app_metadata`   |                    0 | no se observó referencia textual directa                           |
| `current_user`                         |                   18 | dependencia del rol PostgreSQL actual                              |

La única política con `auth.role()` es:

```text
public.app_content_blocks
policy: app_content_blocks_write_admin
command: ALL
roles: authenticated
USING/WITH CHECK:
is_owner() OR is_global_manager() OR auth.role() = 'service_role'
```

La corrección no se ejecuta aquí. Debe definirse una semántica explícita para `service_role` sin depender de un helper deprecado.

`public.user_feedback` tiene una política `UPDATE` sin `WITH CHECK` escrito de forma explícita. Esta señal exige revisión semántica y prueba de reasignación de columnas de ownership; la ausencia textual no se trata por sí sola como bypass confirmado.

#### 17. Políticas `PUBLIC` de mutación

En esquemas Vento existen **144 políticas** dirigidas a `PUBLIC` para `ALL`, `INSERT`, `UPDATE` o `DELETE`:

| Esquema  | Políticas |
| -------- | --------: |
| `pass`   |         2 |
| `public` |         8 |
| `vital`  |       134 |

En esquemas administrados existen además 2 políticas `PUBLIC` de mutación en `cron`.

La mayoría de las políticas Vento mantienen predicates de identidad, ownership, administración o `service_role`; el destino `PUBLIC` amplía el conjunto de roles al que puede aplicar la política, pero no omite el predicate ni crea grants. Su normalización deberá comparar intención, schema `USAGE`, grants y consumidores antes de cambiar el rol objetivo.

#### 18. Hallazgos y destino documental

| Hallazgo                                                                 | Riesgo                                                                 | Tarea responsable                                                       |
| ------------------------------------------------------------------------ | ---------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| cinco tablas Vento con RLS activo y cero políticas                       | acceso cliente bloqueado o instalación incompleta                      | `SUPA-AUD-016`, `SUPA-AUD-017`, `SUPA-AUD-024` y paquete E5 del dominio |
| doce tablas Vento sin RLS pero sin grants cliente                        | protección dependiente de ACL y aislamiento, susceptible a drift       | `SUPA-AUD-016`, `SUPA-AUD-017`, `SUPA-AUD-024`, `SUPA-ARC-*`            |
| 29 tablas globales con RLS activo y cero políticas, 24 administradas     | configuración de producto no reconciliada o falso positivo empresarial | `SUPA-AUD-010`, `SUPA-AUD-012`, `SUPA-AUD-013`, `SUPA-AUD-024`          |
| 831 políticas exclusivamente permisivas                                  | composición OR no evaluada contra cada proceso                         | `SUPA-AUD-023`, `SUPA-AUD-024`, `SUPA-ARC-*`                            |
| 211 políticas Vento dirigidas a `PUBLIC`                                 | alcance de rol mayor que la intención si grants cambian                | `SUPA-AUD-016`, `SUPA-AUD-017`, `SUPA-AUD-023`, `SUPA-AUD-024`          |
| cuatro tablas `pass` con DML anónimo y RLS                               | dependencia crítica de políticas correctas y pruebas negativas         | `SUPA-AUD-023`, `SUPA-AUD-024` y paquetes E5 PASS                       |
| cuatro vistas administrativas privilegiadas accesibles a `authenticated` | bypass de RLS/privilegios del llamador o columnas excesivas            | `SUPA-AUD-016`, `SUPA-AUD-017`, `SUPA-AUD-024`, `SUPA-TRANS-*`          |
| 134 funciones Vento ejecutables mediante `PUBLIC`                        | RPC no intencional o dependencia invisible de ACL por defecto          | `SUPA-AUD-007`, `SUPA-AUD-016`, `SUPA-AUD-017`, `SUPA-AUD-024`          |
| defaults amplios de ACL                                                  | objetos futuros expuestos sin `GRANT` visible en su migración          | `SUPA-AUD-016`, `SUPA-AUD-017`, `SUPA-AUD-024`, `SUPA-ARC-*`            |
| una política usa `auth.role()`                                           | autorización deprecada o comportamiento divergente                     | `SUPA-AUD-016`, `SUPA-AUD-017`, `SUPA-AUD-018`, `SUPA-AUD-024`          |
| una política UPDATE no escribe `WITH CHECK` explícito                    | reasignación no probada o contrato difícil de auditar                  | `SUPA-AUD-016`, `SUPA-AUD-017`, `SUPA-AUD-024`                          |
| `service_role` y roles administrativos poseen `BYPASSRLS`                | credencial privilegiada usada fuera de backend confiable               | `SUPA-AUD-010`, `SUPA-AUD-014`, `SUPA-AUD-015`, `SUPA-AUD-024`          |

No queda hallazgo narrativo sin tarea responsable.

#### 19. Decisiones que esta tarea no toma

Este inventario no autoriza:

1. habilitar o deshabilitar RLS;
2. crear, borrar o reescribir políticas;
3. revocar grants sin identificar consumidores;
4. conceder grants para “hacer funcionar” una pantalla;
5. convertir automáticamente todas las políticas `PUBLIC` a `authenticated`;
6. activar `FORCE RLS` indiscriminadamente;
7. reemplazar `SECURITY DEFINER` sin analizar su necesidad;
8. exponer `service_role` a clientes;
9. mover vistas o funciones entre esquemas;
10. certificar seguridad integral sin pruebas positivas, negativas, territoriales y de escalamiento.

#### 20. Requisitos de prueba derivados

```text
TREQ-SUPABASE-110 a TREQ-SUPABASE-123
```

Los requisitos protegen cobertura de RLS, registro completo de políticas, composición grants/RLS, tablas sin políticas, tablas sin RLS, atributos y membresías, `BYPASSRLS`, ACL actuales, ACL por defecto, vistas privilegiadas, señales deprecadas, advisors e integridad por huellas.

#### 21. Invariantes y huellas

```text
TABLE_LIKE_OBJECTS = 432
RLS_ENABLED = 332
RLS_DISABLED = 100
FORCE_RLS = 0
POLICIES_TOTAL = 831
VENTO_POLICIES = 790
MANAGED_POLICIES = 41
PERMISSIVE_POLICIES = 831
RESTRICTIVE_POLICIES = 0
RLS_ENABLED_WITHOUT_POLICY = 29
VENTO_RLS_ENABLED_WITHOUT_POLICY = 5
MANAGED_RLS_ENABLED_WITHOUT_POLICY = 24
TABLES_WITH_POLICIES = 303
RLS_DISABLED_WITH_POLICY = 0
RLS_DISABLED_WITH_CLIENT_GRANT = 0
VENTO_PUBLIC_FUNCTION_EXECUTE = 134
VENTO_ANON_MUTABLE_TABLES = 4
PRIVILEGED_AUTHENTICATED_VIEWS = 4
```

```text
RLS_REGISTRY_SHA256 = c4fd11aaf07ba22e36a31c3243cf4d7b81d679ab576ac92040deafeb174180b9
POLICY_REGISTRY_SHA256 = bc969aeb62580f8580b812b199b9a3c3b4d660665583472f51738979a21d0eb4
EFFECTIVE_PRIVILEGE_SHA256 = 8d2cc20d48fac49e0af69b5c51eebb3bffdf81d1d6f89fc5ea224c037ebc8587
ACL_REGISTRY_SHA256 = 4b7eda3c7fe253e74321ae1dc42c41be2a2199e78ab8d06ac420bcc1cb8cc09b
DEFAULT_ACL_SHA256 = c09d3b1651f375f18abe02aaa9a4e7776911cc9676df95746d80c6adede98bf0
ROLE_ATTRIBUTE_SHA256 = 2a2c459ff7939840b96f60657ca114750b03b7836c1479b94bc631176aff6586
ROLE_MEMBERSHIP_SHA256 = c9c4a6fff0003faefee0550b1e94e1204de570aa42aa6df7e757f57bdc7c97a4
OBSERVED_AT_UTC = 2026-07-29T20:09:34.911632Z
SUPABASE_PROJECT_REF = clzdpinthhtknkmefsxx
POSTGRESQL_VERSION = 17.6
```

Las huellas se calculan sobre registros ordenados. Cualquier cambio de RLS, política, rol, membresía, grant actual o ACL por defecto exige revalidación antes de arquitectura, normalización o transición.


### ✅ SUPA-AUD-010 — Auditar Auth, usuarios, identidades, sesiones y vínculos empresariales

#### 1. Objetivo

Establecer una línea base reproducible del sistema de identidad y autenticación de `vento-os-dev`, separando obligatoriamente:

```text
CUENTA DE AUTENTICACIÓN       = auth.users
IDENTIDAD DE PROVEEDOR        = auth.identities
SESIÓN Y ROTACIÓN             = auth.sessions + auth.refresh_tokens
PERFIL DE CLIENTE             = public.users
IDENTIDAD LABORAL             = public.employees
INVITACIÓN LABORAL            = public.staff_invitations
ACTOR TÉCNICO COMPARTIDO      = public.shared_operational_devices.auth_user_id
PERFILES ESPECIALIZADOS       = talento.candidates, vital.user_profiles y dominios consumidores
```

`auth.users` no se considera catálogo laboral ni catálogo de clientes. Su función es autenticar una cuenta. La condición de cliente, trabajador, candidato, dispositivo o actor de sistema debe derivarse de vínculos empresariales explícitos y no de nombres, correos o metadatos editables.

#### 2. Alcance y método no mutante

Se consultaron exclusivamente catálogos y datos agregados mediante `SELECT`:

- `auth.users`, `auth.identities`, `auth.sessions`, `auth.refresh_tokens`, `auth.mfa_*`, `auth.audit_log_entries`, `auth.flow_state` y `auth.one_time_tokens`;
- `public.users`, `public.employees`, `public.employee_sites`, `public.employee_areas`, `public.employee_settings` y `public.staff_invitations`;
- vínculos con dispositivos compartidos, candidatos y perfiles especializados;
- constraints, funciones, políticas y vistas que podrían consumir `raw_user_meta_data`, `raw_app_meta_data` o `auth.jwt()`;
- hashes SHA-256 de registros normalizados, sin incluir contraseñas, tokens, correos, teléfonos ni otros secretos en el documento.

No se ejecutaron altas, bajas, invitaciones, revocaciones, cambios de contraseña, actualización de metadatos, cierre de sesiones, DDL, DML, RPC ni migraciones.

Corte principal: `2026-07-29T20:34:06.446837Z`. Algunos contadores administrados continuaron creciendo durante la inspección —por ejemplo `auth.audit_log_entries`— y deberán compararse mediante huellas y timestamp, no suponerse estáticos.

#### 3. Semántica canónica

| Entidad               | Autoridad observada                                            | Regla de interpretación                                                                        |
| --------------------- | -------------------------------------------------------------- | ---------------------------------------------------------------------------------------------- |
| `auth.users`          | cuenta autenticable y estado administrado por Supabase Auth    | no contiene por sí sola rol laboral ni condición de cliente                                    |
| `auth.identities`     | proveedor e identidad externa asociada                         | varias identidades pueden pertenecer a una cuenta, aunque hoy existe una por usuario           |
| `auth.sessions`       | sesión administrada, AAL, expiración y contexto de dispositivo | una fila no prueba por sí sola que un access token actual siga siendo utilizable               |
| `auth.refresh_tokens` | cadena de renovación de sesión                                 | `revoked=false` es una señal material que debe cerrarse en offboarding                         |
| `public.users`        | perfil de cliente y fidelización                               | hoy se sincroniza lógicamente con Auth, sin FK a `auth.users`                                  |
| `public.employees`    | identidad laboral                                              | `employees.id` referencia `auth.users.id` con eliminación en cascada                           |
| `staff_invitations`   | proceso empresarial de alta laboral                            | contiene campos legacy y actuales; no debe conservar secretos reutilizables después del cierre |
| metadatos JWT         | atributos de transporte o bootstrap                            | `raw_user_meta_data` no puede ser autoridad de autorización                                    |

#### 4. Resultado global de Auth

| Métrica                         | Resultado |
| ------------------------------- | --------: |
| cuentas `auth.users`            |    **73** |
| confirmadas                     |    **66** |
| no confirmadas                  |     **7** |
| eliminadas lógicamente          |     **0** |
| anónimas                        |     **0** |
| SSO                             |     **0** |
| bloqueadas actualmente          |     **3** |
| con correo                      |    **73** |
| con teléfono                    |     **0** |
| con contraseña cifrada presente |    **72** |
| inicio de sesión en 30 días     |    **25** |
| nunca iniciaron sesión          |     **7** |

Las siete cuentas no confirmadas coinciden con las siete que nunca iniciaron sesión. No se observan cuentas eliminadas ni anónimas.

#### 5. Identidades y proveedores

| Métrica                                      |    Resultado |
| -------------------------------------------- | -----------: |
| identidades                                  |       **73** |
| usuarios cubiertos                           | **73 de 73** |
| proveedor `email`                            |       **73** |
| usuarios sin identidad                       |        **0** |
| usuarios con múltiples identidades           |        **0** |
| referencias huérfanas                        |        **0** |
| `provider_id` duplicado dentro del proveedor |        **0** |

El proyecto usa actualmente un único proveedor de identidad: `email`. No existen SSO providers, custom OAuth providers ni OAuth clients configurados en las tablas administradas observadas. La arquitectura debe conservar capacidad de múltiples identidades sin suponer que una cuenta tendrá siempre exactamente una.

#### 6. Sesiones, tokens y nivel de aseguramiento

| Métrica                                | Resultado |
| -------------------------------------- | --------: |
| sesiones                               |   **174** |
| usuarios con sesiones                  |    **63** |
| sesiones `aal1`                        |   **174** |
| sesiones `aal2`                        |     **0** |
| sesiones con `not_after` nulo          |   **174** |
| sesiones con refresh token no revocado |   **172** |
| sesiones sin refresh token no revocado |     **2** |
| refresh tokens totales                 | **6.371** |
| revocados                              | **6.199** |
| no revocados                           |   **172** |
| refresh tokens sin sesión              |     **0** |
| referencias de sesión huérfanas        |     **0** |

Distribución de antigüedad de sesiones:

| Antigüedad     | Sesiones |
| -------------- | -------: |
| 0–7 días       |        1 |
| 8–30 días      |       50 |
| 31–90 días     |       50 |
| más de 90 días |       73 |

No existen factores MFA, credenciales WebAuthn ni sesiones `aal2`. Esta ausencia no se declara automáticamente defecto: debe confrontarse con sensibilidad, roles y acciones en `SUPA-ARC-008`, `SUPA-ARC-009` y la arquitectura de autenticación.

Todas las sesiones tienen `not_after` nulo. Por ello, la vigencia máxima no está representada en esa columna y depende de la configuración de Auth y de la rotación/revocación. La política de duración debe auditarse en `SUPA-AUD-015` y formalizarse antes de certificar sesiones administrativas o de dispositivos.

#### 7. Baja laboral y revocación

| Señal                                             |                     Resultado |
| ------------------------------------------------- | ----------------------------: |
| empleados totales                                 |                        **56** |
| empleados inactivos                               |                        **16** |
| inactivos con cuenta confirmada y no eliminada    |                        **15** |
| inactivos con filas de sesión                     | **14 usuarios / 45 sesiones** |
| refresh tokens no revocados ligados a inactivos   |                        **45** |
| inactivos con inicio de sesión en 30 días         |                         **2** |
| cuentas bloqueadas entre inactivos                |                         **3** |
| refresh tokens no revocados de cuentas bloqueadas |                         **6** |

La inactivación laboral no está acompañada por una revocación observable de sesiones y refresh tokens. Esto constituye una brecha de ciclo de vida, no una prueba de explotación: una fila de sesión o token no demuestra por sí sola que un access token concreto siga aceptándose. Sin embargo, el contrato objetivo deberá hacer verificable y atómico, o compensable con evidencia, el cierre de:

1. vínculo laboral activo;
2. sesiones y refresh tokens;
3. dispositivos y push tokens personales;
4. simulaciones, turnos o actor compartido activos;
5. permisos, sedes y áreas efectivas;
6. accesos derivados en aplicaciones consumidoras.

Ruta de resolución: `SUPA-AUD-011`, `SUPA-ARC-008`, `SUPA-ARC-009`, tareas `AUTH-SRV-*`, `AUTH-DB-*` y paquete de offboarding correspondiente. No se revocaron sesiones durante esta auditoría.

#### 8. Vínculos empresariales

| Vínculo                                             |    Resultado |
| --------------------------------------------------- | -----------: |
| perfiles `public.users`                             |       **80** |
| cuentas Auth con perfil cliente                     | **73 de 73** |
| perfiles cliente sin cuenta Auth                    |        **7** |
| cuentas Auth con identidad laboral                  |       **56** |
| cuentas Auth sin identidad laboral                  |       **17** |
| empleados sin sede activa                           |        **0** |
| empleados sin sede primaria                         |        **0** |
| empleados con múltiples sedes primarias             |        **0** |
| discrepancias `employees.site_id` vs sede primaria  |        **0** |
| discrepancias de área primaria                      |        **0** |
| empleados sin `employee_settings`                   |        **0** |
| selección de sede o área fuera de asignación activa |        **0** |

La integridad de sede, área y preferencias de contexto está bien reconciliada en el corte. La frontera cliente/Auth no tiene la misma protección estructural:

- `public.employees.id → auth.users.id` posee FK;
- `public.users.id → auth.users.id` **no** posee FK;
- `staff_invitations.auth_user_id → auth.users.id` **no** posee FK;
- `talento.candidates.auth_user_id → auth.users.id` **no** posee FK;
- `public.wallet_passes.user_id → auth.users.id` **no** posee FK.

Los siete perfiles `public.users` sin cuenta Auth deben clasificarse en `SUPA-AUD-011` y `SUPA-AUD-019` como perfiles legacy, invitados, importados o huérfanos antes de corregirlos. No se autoriza borrarlos ni crear cuentas automáticamente.

#### 9. Clases de cuenta observadas

Aplicando precedencia `SHARED_DEVICE → EMPLOYEE → CANDIDATE → CLIENT_OR_OTHER`:

| Clase inferida         | Cuentas |
| ---------------------- | ------: |
| dispositivo compartido |   **2** |
| empleado               |  **55** |
| candidato              |   **0** |
| cliente u otro         |  **16** |

La suma es 73. Una cuenta de dispositivo también puede coincidir estructuralmente con un empleado; por eso la precedencia evita doble conteo y explica que existan 56 vínculos laborales aunque 55 cuentas queden clasificadas como `EMPLOYEE`.

La clase inferida no es todavía un atributo canónico. `SUPA-AUD-011` deberá auditar identidad de trabajador, cliente, dispositivo y actor de sistema con cardinalidades y restricciones explícitas.

#### 10. Metadatos de usuario y aplicación

`raw_user_meta_data` contiene:

| Clave                             |   Usuarios |
| --------------------------------- | ---------: |
| `role`                            |     **47** |
| `site_id`                         |     **47** |
| `full_name`                       |     **47** |
| `sub`                             |         21 |
| `email`                           |         21 |
| `email_verified`                  |         72 |
| `phone_verified`                  |         21 |
| claves de dispositivo y plantilla | 1 cada una |

`raw_app_meta_data` contiene `provider/providers` en 73 cuentas y señales de cuenta técnica en una cuenta.

La búsqueda estática remota encontró:

- **0 políticas RLS** que usen `raw_user_meta_data`, `user_metadata`, `raw_app_meta_data`, `app_metadata` o `auth.jwt()`;
- **0 vistas** con esas señales;
- `talento.bootstrap_my_candidate(...)` consulta `auth.jwt()` y metadatos durante bootstrap;
- `vital.is_service_role()` consulta `auth.jwt()` para identificar el rol de servicio.

Por tanto, no se observó autorización RLS basada directamente en metadatos editables. Aun así, almacenar `role` y `site_id` laborales en `raw_user_meta_data` crea riesgo de consumo accidental, divergencia y datos obsoletos. Deben tratarse como información de compatibilidad, no como autoridad, y rastrearse en código y migraciones mediante `SUPA-AUD-016` y `SUPA-AUD-017`.

#### 11. Invitaciones laborales

| Estado                 |  Filas | Con token en texto | Con hash | Vinculadas a Auth | Vinculadas a empleado |
| ---------------------- | -----: | -----------------: | -------: | ----------------: | --------------------: |
| `accepted`             |     15 |                 15 |       15 |                15 |                    15 |
| `cancelled`            |      8 |                  8 |        5 |                 4 |                     4 |
| `linked_existing_user` |      5 |                  5 |        0 |                 5 |                     5 |
| **TOTAL**              | **28** |             **28** |   **20** |            **24** |                **24** |

Hallazgos:

- las 28 invitaciones conservan `token` no vacío aunque todos sus estados son terminales o equivalentes;
- 20 poseen además `invite_token_hash` SHA-256 de longitud 64;
- 8 no poseen hash;
- no existen discrepancias entre `staff_role/role_code` ni `staff_site_id/site_id` cuando ambos están presentes;
- las 15 aceptadas tienen `auth_user_id = employee_id` y referencias existentes;
- las cinco `linked_existing_user` están enlazadas tanto a Auth como a empleado.

La columna `token` no se expuso ni se incluyó en huellas. Su presencia persistente debe tratarse como retención de secreto potencial hasta verificar cuerpo, formato, uso y capacidad de reutilización. La resolución corresponde a `SUPA-AUD-011`, `SUPA-AUD-016`, `SUPA-AUD-018` y la transición de invitaciones; no se eliminaron valores.

#### 12. Estado administrado auxiliar

| Objeto                        |                       Filas |
| ----------------------------- | --------------------------: |
| `auth.audit_log_entries`      | **41.092** al segundo corte |
| `auth.flow_state`             |                     **192** |
| `auth.one_time_tokens`        |                      **11** |
| `auth.mfa_amr_claims`         |                     **174** |
| `auth.mfa_factors`            |                       **0** |
| `auth.sso_providers`          |                       **0** |
| `auth.custom_oauth_providers` |                       **0** |
| `auth.oauth_clients`          |                       **0** |

Estos objetos son administrados por Supabase. No deben ser reestructurados mediante migraciones empresariales. Retención, configuración de Auth, protección de contraseñas filtradas, duración de sesiones y proveedores se completarán en `SUPA-AUD-015`.

#### 13. Brechas y enrutamiento obligatorio

| ID local           | Hallazgo                                                                         | Riesgo                                               | Resolución obligatoria                                                               |
| ------------------ | -------------------------------------------------------------------------------- | ---------------------------------------------------- | ------------------------------------------------------------------------------------ |
| `SUPA-AUD-010-B01` | 16 empleados inactivos; 14 conservan 45 sesiones/tokens no revocados             | acceso posterior a baja                              | `SUPA-AUD-011`; `SUPA-ARC-008`; `SUPA-ARC-009`; `AUTH-SRV-*`; paquete de offboarding |
| `SUPA-AUD-010-B02` | tres cuentas bloqueadas conservan seis refresh tokens no revocados               | bloqueo no reconciliado con revocación               | `SUPA-AUD-011`; `SUPA-AUD-015`; `AUTH-SRV-*`                                         |
| `SUPA-AUD-010-B03` | 47 cuentas almacenan rol y sede en `raw_user_meta_data`                          | consumo accidental o claims obsoletos                | `SUPA-AUD-016`; `SUPA-AUD-017`; `AUTH-DB-*`                                          |
| `SUPA-AUD-010-B04` | siete perfiles cliente no tienen cuenta Auth                                     | fuente de verdad ambigua o legacy                    | `SUPA-AUD-011`; `SUPA-AUD-019`; `SUPA-ARC-008`                                       |
| `SUPA-AUD-010-B05` | vínculos Auth en `public.users`, invitaciones, candidatos y wallet carecen de FK | referencias huérfanas posibles                       | `SUPA-AUD-011`; `SUPA-AUD-019`; `SUPA-ARC-008`; transición posterior                 |
| `SUPA-AUD-010-B06` | 28 invitaciones terminales conservan token; ocho carecen de hash                 | retención de secreto potencial y coexistencia legacy | `SUPA-AUD-011`; `SUPA-AUD-016`; `SUPA-AUD-018`; transición de invitaciones           |
| `SUPA-AUD-010-B07` | 174 sesiones AAL1, cero MFA/AAL2                                                 | aseguramiento no diferenciado por sensibilidad       | `SUPA-AUD-015`; `SUPA-ARC-009`; tareas AUTH de MFA/step-up                           |
| `SUPA-AUD-010-B08` | 174 sesiones con `not_after` nulo                                                | duración máxima no visible en datos                  | `SUPA-AUD-015`; `SUPA-ARC-009`                                                       |
| `SUPA-AUD-010-B09` | dos cuentas de dispositivo comparten el mismo universo Auth que personas         | confusión entre sujeto humano y técnico              | `SUPA-AUD-011`; `SUPA-ARC-008`; `SUPA-ARC-009`                                       |

No quedan pendientes narrativos sin tarea. Esta tarea identifica el estado; no define todavía el modelo definitivo ni aplica saneamiento.

#### 14. Requisitos de prueba derivados

```text
TREQ-SUPABASE-124 a TREQ-SUPABASE-138
```

Los requisitos protegen cuentas Auth, identidades, sesiones, refresh tokens, revocación laboral, bloqueo, metadatos no autoritativos, perfiles cliente, vínculos laborales, integridad referencial, invitaciones, clases de cuenta, nivel de aseguramiento, objetos administrados e integridad por huellas.

#### 15. Huellas de integridad

```text
AUTH_USER_REGISTRY_SHA256=103ea5a60e57394bf6eeded95647416ae9175176123ee9b036bb45e68210a6eb
IDENTITY_REGISTRY_SHA256=f9aa009f72937309fb70f653672e89c1f58c4af5779e4682f1f7ad0d0528690e
SESSION_REGISTRY_SHA256=87be3f3af4972d4dc0d3273361f6c0424c6694617e3a1dd4126d5767c65b343b
BUSINESS_LINK_REGISTRY_SHA256=fc45a7347c12880f01ef1bd1f9d2a61078072a81fe9c5eb4882a69ea64c46a75
INVITATION_STATE_REGISTRY_SHA256=80dd11cebceeb330717cc901d023cfc06518e2c7ca2cb760b572a5a49fe98876
METADATA_KEY_REGISTRY_SHA256=e5591f6e261d5fa4a7adc3522ec3984240b5e2e8d5b9d9d1957bc950e1a9455a
```

Las huellas excluyen valores de contraseña, correo, teléfono, token, IP, user-agent y payload sensible. Cualquier cambio deberá interpretarse junto con timestamp y operación legítima, porque usuarios y sesiones son datos vivos.

#### 16. Criterios de cierre

SUPA-AUD-010 queda completa porque:

- se inventariaron cuentas, identidades, sesiones, refresh tokens y nivel AAL;
- se reconciliaron perfiles cliente, empleados, sedes, áreas y settings;
- se auditaron invitaciones y referencias Auth principales;
- se identificó la frontera de metadatos y su uso en funciones/políticas/vistas;
- se registraron brechas con tarea y etapa de resolución;
- se produjeron huellas reproducibles sin exponer PII ni secretos;
- no se modificó el remoto.

La siguiente tarea canónica es:

```text
SUPA-AUD-011 — Auditar identidades de trabajadores, clientes, dispositivos y actores de sistema
```


### ✅ SUPA-AUD-011 — Auditar identidades de trabajadores, clientes, dispositivos y actores de sistema

**Estado:** APROBADA  
**Fecha de preparación documental:** 2026-07-29  
**Bloque propietario:** BLOQUE E3 — Arquitectura canónica de datos y gobierno integral de Supabase  
**Marcador exacto que reemplaza:** `### [ ] SUPA-AUD-011 — Auditar identidades de trabajadores, clientes, dispositivos y actores de sistema`  
**Tarea anterior:** `SUPA-AUD-010 — Auditar Auth, usuarios, identidades, sesiones y vínculos empresariales` — APROBADA  
**Siguiente tarea:** `SUPA-AUD-012 — Auditar buckets, rutas, políticas y ciclos de vida de Storage`  
**Proyecto Supabase observado:** `vento-os-dev` — `clzdpinthhtknkmefsxx`  
**Tipo de tarea:** auditoría documental y consultas remotas read-only; sin DDL, DML, migraciones, cambios de Auth, creación o baja de cuentas, revocación de sesiones, saneamiento ni despliegue

#### 1. Objetivo

Definir una línea base verificable de las clases de sujeto que operan Vento OS y de sus relaciones reales: trabajador, cliente, candidato, dispositivo compartido y actor técnico. La auditoría distingue cuenta autenticable, perfil empresarial, actor efectivo y origen técnico; no los fusiona por compartir UUID, correo o dispositivo.

#### 2. Regla canónica derivada

```text
CUENTA AUTH
  ≠ PERFIL CLIENTE
  ≠ IDENTIDAD LABORAL
  ≠ DISPOSITIVO COMPARTIDO
  ≠ ACTOR HUMANO EFECTIVO
  ≠ ACTOR TÉCNICO DE SISTEMA
```

Una misma persona puede mantener legítimamente perfil laboral y perfil de cliente, pero esa coexistencia debe declararse. Una cuenta técnica no puede representar simultáneamente a una persona. El actor de una acción debe resolverse de forma explícita y auditable.

#### 3. Método y alcance

Se consultaron exclusivamente catálogos y tablas mediante `SELECT`: `auth.users`, `public.users`, `public.employees`, `talento.candidates`, `public.shared_operational_devices`, sesiones y políticas de actor compartido, firmas y eventos. Se verificaron claves foráneas, intersecciones, estados, roles, sedes, áreas, documentos, PIN, perfiles técnicos y huellas SHA-256. No se expusieron correos, teléfonos, documentos, tokens, PIN, UUID completos de personas ni secretos.

#### 4. Matriz real de cuentas Auth

| Combinación observada                   | Cuentas |
| --------------------------------------- | ------: |
| trabajador + cliente                    |  **55** |
| trabajador + cliente + dispositivo      |   **1** |
| cliente + dispositivo técnico explícito |   **1** |
| solo cliente u otro usuario             |  **16** |
| candidato                               |   **0** |
| sin identidad empresarial observable    |   **0** |
| **Total**                               |  **73** |

La precedencia usada en SUPA-AUD-010 permitía contar 55 trabajadores, 2 dispositivos y 16 clientes sin duplicar cuentas. Esta tarea conserva además las intersecciones, porque son las que revelan colisiones semánticas.

#### 5. Identidad de trabajadores

| Control                   | Resultado |
| ------------------------- | --------: |
| trabajadores              |    **56** |
| activos                   |    **40** |
| inactivos                 |    **16** |
| sin cuenta Auth           |     **0** |
| rol inválido              |     **0** |
| sede inválida             |     **0** |
| área inválida             |     **0** |
| sin documento             |    **56** |
| sin documento normalizado |    **56** |
| PIN en texto plano        |     **1** |
| PIN con hash              |     **0** |
| texto y hash simultáneos  |     **0** |

El vínculo `employees.id → auth.users.id` es estructural y consistente. La identificación laboral documental todavía no está poblada. Esto no autoriza rellenar datos artificiales: deberá definirse fuente, obligatoriedad, normalización, privacidad y migración. El único `pin_code` en texto plano queda registrado como credencial legacy que debe retirarse mediante transición controlada.

#### 6. Identidad de clientes

| Control                                     | Resultado |
| ------------------------------------------- | --------: |
| perfiles `public.users`                     |    **80** |
| marcados como cliente                       |    **79** |
| sin cuenta Auth                             |     **7** |
| activos sin cuenta Auth                     |     **6** |
| también trabajadores                        |    **56** |
| sin correo                                  |     **0** |
| sin teléfono                                |    **59** |
| sin documento                               |    **59** |
| grupos duplicados por correo normalizado    |     **1** |
| grupos duplicados por teléfono normalizado  |     **1** |
| grupos duplicados por documento normalizado |     **0** |

`public.users.id` no posee FK a `auth.users.id`. Los siete perfiles sin Auth no se clasifican automáticamente como errores: pueden ser históricos, importados, invitados o huérfanos. Se prohíbe eliminarlos, fusionarlos o provisionarlos sin clasificación y evidencia. Correo, teléfono y documento sirven para reconciliación, no como autoridad de autorización.

#### 7. Coexistencia trabajador-cliente

Las 56 identidades laborales también poseen perfil en `public.users`. Puede ser legítimo que una persona trabajadora sea cliente, pero hoy la mera presencia de la fila no distingue:

1. perfil comercial deliberado;
2. fila creada por bootstrap general;
3. dependencia legacy de aplicaciones;
4. duplicación técnica sin semántica cliente.

La arquitectura objetivo deberá declarar si ambos perfiles son independientes, relacionados o si uno debe dejar de existir. Ningún consumidor podrá inferir rol laboral desde `public.users` ni condición de cliente desde `employees`.

#### 8. Dispositivos compartidos

| Control                                  | Resultado |
| ---------------------------------------- | --------: |
| dispositivos registrados                 |     **2** |
| activos                                  |     **2** |
| con cuenta Auth                          |     **2** |
| cuenta Auth inexistente                  |     **0** |
| cuenta Auth también empleada             |     **1** |
| cuenta Auth con perfil cliente           |     **2** |
| `account_type` técnico explícito         |     **1** |
| `device_code` en metadatos administrados |     **1** |

Los dos dispositivos operan en modo `shared_device`, están activos, exigen PIN de actor y turno activo, y no permiten actuar sin actor ni sin PIN. No obstante:

- un dispositivo utiliza la cuenta Auth de un trabajador real;
- el otro posee cuenta técnica explícita;
- ambos aparecen también como perfiles cliente;
- solo uno declara `account_type=shared_operational_device` y `device_code`.

La colisión trabajador-dispositivo es una brecha crítica: offboarding, permisos, sesiones, auditoría y atribución pueden afectar simultáneamente a la persona y al equipo.

#### 9. Actor humano en dispositivo compartido

| Evidencia                         | Resultado |
| --------------------------------- | --------: |
| sesiones de actor registradas     |     **0** |
| sesiones activas                  |     **0** |
| firmas de actor                   |     **0** |
| políticas activas por dispositivo |     **2** |
| políticas activas por plantilla   |     **7** |
| eventos de dispositivo            |     **3** |
| eventos sin actor humano          |     **2** |
| eventos sin cuenta de sesión      |     **0** |
| eventos con referencia huérfana   |     **0** |

La configuración expresa controles correctos, pero no existe evidencia de que el flujo de actor haya operado: no hay sesiones ni firmas. Dos de tres eventos carecen de actor humano. Esto puede ser válido para eventos técnicos de activación o heartbeat, pero cada tipo de evento deberá declarar si exige actor. La cuenta de sesión técnica y el actor empleado deben permanecer separados.

#### 10. Actores de sistema

No se encontraron filas actuales en `vital.adaptive_decision_logs` con actor textual, por lo que no existe un universo de nombres libres que deba sanearse en esa tabla. Sin embargo, el contrato transversal sigue siendo obligatorio:

```text
actor_type + actor_id + source + correlation_id + occurred_at
```

Los actores automáticos deberán clasificarse como servicio, función, job, cron, webhook, cola o proceso equivalente. `service_role`, `postgres` o el propietario de una función representan capacidad técnica, no una persona. La auditoría completa de productores automáticos continúa en `SUPA-AUD-014`.

#### 11. Catálogo de roles

Existen 15 roles activos; 14 aparecen en empleados y uno no tiene asignaciones actuales. No se elimina el rol sin uso: puede ser reservado o pendiente de adopción. La validez del rol no basta para resolver identidad efectiva; también se requieren vínculo activo, sede, área, turno, dispositivo y contexto de autorización.

#### 12. Brechas y enrutamiento obligatorio

| ID local           | Hallazgo                                               | Riesgo                                             | Resolución obligatoria                                                     |
| ------------------ | ------------------------------------------------------ | -------------------------------------------------- | -------------------------------------------------------------------------- |
| `SUPA-AUD-011-B01` | una cuenta es simultáneamente trabajador y dispositivo | atribución falsa y acoplamiento con offboarding    | `SUPA-ARC-008`; `SUPA-ARC-009`; `SUPA-TRANS-*`; `AUTH-SRV-*`               |
| `SUPA-AUD-011-B02` | las dos cuentas de dispositivo tienen perfil cliente   | datos comerciales y cuenta técnica mezclados       | `SUPA-AUD-019`; `SUPA-ARC-008`; transición de identidades                  |
| `SUPA-AUD-011-B03` | solo un dispositivo declara clase y código técnicos    | aprovisionamiento no reproducible                  | `SUPA-ARC-008`; `SUPA-ARC-009`; `AUTH-DB-*`                                |
| `SUPA-AUD-011-B04` | 56 trabajadores sin documento ni normalización         | identidad laboral no reconciliable documentalmente | `SUPA-AUD-019`; `SUPA-ARC-008`; paquete ANIMA                              |
| `SUPA-AUD-011-B05` | un PIN permanece en texto plano                        | secreto operativo expuesto                         | `SUPA-AUD-015`; `SUPA-AUD-018`; `SUPA-ARC-009`; transición de credenciales |
| `SUPA-AUD-011-B06` | siete perfiles cliente sin Auth, seis activos          | fuente de verdad y ciclo de vida ambiguos          | `SUPA-AUD-019`; `SUPA-ARC-008`; paquete PASS; `SUPA-TRANS-*`               |
| `SUPA-AUD-011-B07` | duplicidad por correo y teléfono                       | perfiles y beneficios fragmentados                 | `SUPA-AUD-019`; `SUPA-ARC-008`; paquete PASS                               |
| `SUPA-AUD-011-B08` | 56 trabajadores también son perfiles cliente           | doble identidad no formalizada                     | `SUPA-AUD-019`; `SUPA-ARC-008`; paquetes PASS y ANIMA                      |
| `SUPA-AUD-011-B09` | cero sesiones y cero firmas de actor compartido        | control configurado pero no demostrado             | `SUPA-ARC-009`; `AUTH-SRV-*`; paquete de dispositivos compartidos          |
| `SUPA-AUD-011-B10` | dos de tres eventos no tienen actor humano             | trazabilidad dependiente del tipo de evento        | `SUPA-ARC-009`; `SUPA-AUD-019`; contrato de auditoría                      |
| `SUPA-AUD-011-B11` | actores automáticos sin contrato transversal cerrado   | automatización no atribuible                       | `SUPA-AUD-014`; `SUPA-ARC-008`; `SUPA-ARC-009`                             |

No quedan pendientes narrativos sin tarea.

#### 13. Huellas de integridad

| Registro                    | SHA-256                                                            |
| --------------------------- | ------------------------------------------------------------------ |
| clases de cuenta Auth       | `dd702a5ff8247c393be619284c7db1e29f95ba1acb7766649163956140bcce3b` |
| identidades laborales       | `aec83880d869c2c5dd3f319911a2cef26324151610cd71fb84a9fb8903b0e0c1` |
| identidades cliente         | `83cbef270879d177a46167ce7c7a5576aeab8c3d4e99917fe8f6f73f6553e46a` |
| identidades de dispositivo  | `620102ca413b09f0259965c957faebe46699865c15f552149fba7a457936a7d4` |
| políticas de actor          | `18622507a04ae951ff2a34f0486f269c673fcb09b411c9092c402679cfa4e1a3` |
| eventos de actor compartido | `8f065bd506626efe6bfdc1b8689d569be91ed375db89e62eed021cfffc211a3e` |

#### 14. Requisitos de prueba generados

Se incorporan `TREQ-SUPABASE-139` a `TREQ-SUPABASE-153` en el registro canónico completo.

#### 15. Cierre

La tarea queda aprobada como línea base observada, no como aprobación de la arquitectura actual. No se crearon, modificaron, bloquearon ni eliminaron usuarios; no se movieron perfiles; no se cambió ningún PIN; no se generaron sesiones de actor ni migraciones.

La siguiente tarea canónica es:

```text
SUPA-AUD-012 — Auditar buckets, rutas, políticas y ciclos de vida de Storage
```


### ✅ SUPA-AUD-012 — Auditar buckets, rutas, políticas y ciclos de vida de Storage

**Estado:** APROBADA
**Fecha de preparación documental:** 2026-07-29
**Bloque propietario:** BLOQUE E3 — Arquitectura canónica de datos y gobierno integral de Supabase
**Marcador exacto que reemplaza:** `### [ ] SUPA-AUD-012 — Auditar buckets, rutas, políticas y ciclos de vida de Storage`
**Tarea anterior:** `SUPA-AUD-011 — Auditar identidades de trabajadores, clientes, dispositivos y actores de sistema` — APROBADA
**Siguiente tarea:** `SUPA-AUD-013 — Auditar publicaciones, canales y consumidores de Realtime`
**Proyecto Supabase observado:** `vento-os-dev` — `clzdpinthhtknkmefsxx`
**Tipo de tarea:** auditoría documental, consultas remotas read-only y contraste estático de consumidores; sin DDL, DML, migraciones, creación o modificación de buckets, movimiento o eliminación de objetos, cambios de políticas, exposición, secretos ni despliegue

#### 1. Objetivo

Establecer una línea base reproducible de Supabase Storage: buckets, exposición, límites, objetos, rutas, políticas, referencias empresariales y ciclos de vida. La auditoría distingue cuatro planos que no deben confundirse:

```text
BUCKET Y CONFIGURACIÓN
        ≠
OBJETO FÍSICO Y RUTA
        ≠
FILA EMPRESARIAL QUE LO REFERENCIA
        ≠
AUTORIZACIÓN Y CICLO DE VIDA
```

Que una ruta exista no demuestra que su exposición sea correcta; que una política RLS exista no protege una URL pública; que una fila sea eliminada no demuestra que el objeto haya sido dispuesto; y que el objeto sea privado no reemplaza la autorización de dominio.

#### 2. Método y límites

Se ejecutaron únicamente consultas `SELECT` sobre `storage.buckets`, `storage.objects`, `storage.s3_multipart_uploads`, `pg_policies`, grants, índices, triggers, funciones, cron y columnas empresariales potencialmente referenciales. Se contrastaron consumidores estáticos en repositorios Vento para confirmar patrones de carga, URL firmada y eliminación compensatoria.

No se descargó contenido, no se listaron nombres completos de archivos personales en este artefacto, no se generaron enlaces públicos o firmados, no se modificó Storage y no se invocaron operaciones de subida, copia, sustitución o borrado.

#### 3. Corte cuantitativo

| Métrica                               |                                              Resultado |
| ------------------------------------- | -----------------------------------------------------: |
| buckets STANDARD                      |                                                 **14** |
| públicos                              |                                                  **8** |
| privados                              |                                                  **6** |
| objetos exactos                       |                                              **1.101** |
| tamaño agregado                       | **750.891.333 bytes** — aproximadamente **716,11 MiB** |
| políticas sobre `storage.objects`     |                                                 **39** |
| objetos en bucket inexistente         |                                                  **0** |
| rutas activas duplicadas por bucket   |                                                  **0** |
| cargas multipart en progreso          |                                                  **0** |
| referencias empresariales verificadas |                                              **1.054** |
| referencias sin objeto                |                                                  **0** |
| referencias a bucket inexistente      |                                                  **0** |

La estimación estadística de `storage.objects` era 1.104, mientras que el conteo exacto por bucket suma 1.101. El artefacto usa el conteo exacto y conserva esta diferencia como señal normal de estadísticas no instantáneas, no como pérdida de datos.

#### 4. Inventario canónico de buckets

| Bucket                   | Público | Objetos |       Bytes |         Límite | MIME permitido    | Estado observado                                                       |
| ------------------------ | ------: | ------: | ----------: | -------------: | ----------------- | ---------------------------------------------------------------------- |
| `commercial-menu-images` |      sí |      51 |   2.800.621 |          5 MiB | JPEG, PNG, WebP   | activo y coherente                                                     |
| `documents`              |  **sí** |     164 | 152.907.573 | **sin límite** | **sin allowlist** | **exposición incompatible con expediente laboral**                     |
| `employee-photos`        |      sí |      26 |  39.118.553 |          5 MiB | JPEG, PNG, WebP   | dato personal publicado por diseño actual; requiere decisión explícita |
| `nexo-ai-documents`      |      no |       1 |     312.532 |         12 MiB | PDF e imágenes    | privado, sin políticas cliente                                         |
| `nexo-catalog-images`    |      sí |     790 | 172.881.585 |          5 MiB | imágenes          | activo; rutas heterogéneas y contenido draft/optimized                 |
| `pass-satellite-logos`   |      sí |      11 |     685.743 |          5 MiB | imágenes y SVG    | activo                                                                 |
| `product-images`         |      sí |      45 | 378.566.937 |          5 MiB | imágenes y SVG    | **15 objetos exceden el límite actual**                                |
| `public-documents`       |      sí |       9 |   3.250.029 | **sin límite** | **sin allowlist** | contenido público deliberado mezclando PDF e imágenes                  |
| `recipe-media`           |      no |       0 |           0 |        100 MiB | imagen y video    | privado, preparado para adopción                                       |
| `recipe-step-photos`     |      sí |       4 |     367.760 |          8 MiB | JPEG, PNG, WebP   | mutación demasiado amplia para authenticated                           |
| `talento-cv`             |      no |       0 |           0 |         10 MiB | PDF               | sin DELETE de candidato                                                |
| `talento-documents`      |      no |       0 |           0 |         15 MiB | PDF, JPEG, PNG    | sin DELETE de candidato                                                |
| `talento-medical`        |      no |       0 |           0 |         15 MiB | PDF, JPEG, PNG    | sensible; sin DELETE de candidato                                      |
| `website-media`          |      no |       0 |           0 |         40 MiB | imagen y video    | privado con lectura authenticated                                      |

La existencia de buckets vacíos no constituye por sí sola una brecha. Deben conservarse si son parte de un contrato de producto aprobado; de lo contrario, su retiro se resolverá en arquitectura y transición, no en esta auditoría.

#### 5. Exposición pública y privacidad

El hallazgo crítico es `documents`: contiene expedientes laborales referenciados por `public.documents`, posee políticas `SELECT` que verifican empleado, destinatario, sede y permisos, pero el bucket está configurado como público.

```text
POLÍTICA SELECT RESTRICTIVA
        +
BUCKET PUBLIC = TRUE
        ↓
LA URL PÚBLICA NO DEPENDE DE ESA POLÍTICA
```

El cliente ANIMA genera enlaces firmados de cinco minutos, lo que confirma intención de acceso privado. Esa intención no coincide con la configuración efectiva. La corrección futura deberá privatizar de manera controlada, verificar consumidores y evitar enlaces rotos; no se cambia el flag durante esta tarea.

`employee-photos` también es público. No se declara automáticamente incorrecto porque puede existir una necesidad de distribución visual interna o pública, pero deberá documentarse finalidad, minimización, consentimiento o base aplicable, tamaño derivado y consumidores. La fotografía laboral no debe publicarse por simple conveniencia técnica.

#### 6. Políticas de `storage.objects`

Distribución observada:

| Comando   | Políticas |
| --------- | --------: |
| `SELECT`  |     **6** |
| `INSERT`  |    **12** |
| `UPDATE`  |    **12** |
| `DELETE`  |     **9** |
| **Total** |    **39** |

Hallazgos principales:

1. `recipe-step-photos` permite insertar, actualizar y eliminar a cualquier `authenticated` siempre que coincida el bucket; no valida permiso, receta, sede ni área.
2. `product-images` usa `viso.menu.images.manage` para insertar y actualizar, pero permite eliminar a propietario o gerente global. La capacidad no es simétrica.
3. `talento-cv`, `talento-documents` y `talento-medical` permiten seleccionar, insertar y actualizar por pertenencia del candidato, pero no ofrecen DELETE. Esto puede ser una decisión de retención, pero hoy no existe ciclo explícito de disposición.
4. `nexo-ai-documents` es privado y no posee políticas cliente; el único objeto fue creado por flujo privilegiado. El acceso futuro deberá documentar productor y consumidor.
5. Los buckets públicos no requieren política SELECT para distribución pública, pero sí requieren autorización estricta para mutaciones.

Los grants amplios observados sobre tablas administradas por Storage no se interpretan aisladamente como exposición, porque RLS y el servicio Storage participan en el control. No se modifican objetos administrados por Supabase.

#### 7. Rutas y convenciones observadas

Las rutas activas muestran varios contratos coexistentes:

- prefijo funcional: `catalog-items`, `staff`, `products`, `recipes`, `viso`;
- prefijo de estado: `draft-insumo`, `draft-asset`, `draft-reventa`, `draft-preparacion`, `optimized`;
- prefijo UUID sin semántica declarada;
- objeto directamente en raíz;
- prefijo de usuario Auth para `documents`;
- URLs públicas completas persistidas en numerosas tablas;
- rutas desnudas persistidas en `public.documents.storage_path`.

No se encontraron secuencias `..`, backslashes, dobles slash o slash inicial en los nombres activos. Sin embargo, la heterogeneidad impide definir de forma uniforme propietario, reemplazo, limpieza por entidad y migración. `SUPA-ARC-010` y `SUPA-ARC-011` deberán fijar gramática por bucket y versionarla.

#### 8. Integridad entre tablas empresariales y objetos

Se reconciliaron **1.054 referencias** y todas corresponden a objetos existentes. La cobertura confirmada incluye:

| Fuente                                  | Bucket o buckets observados                                       | Referencias exactas |
| --------------------------------------- | ----------------------------------------------------------------- | ------------------: |
| `public.documents.storage_path`         | `documents`                                                       |                 157 |
| `public.employees.photo_url`            | `employee-photos`                                                 |                  18 |
| catálogo comercial                      | `commercial-menu-images`, `nexo-catalog-images`, `product-images` |                  72 |
| imágenes de inventario y presentaciones | `nexo-catalog-images`                                             |                 792 |
| logos de satélite                       | `pass-satellite-logos`                                            |                   9 |
| fotos de pasos de receta                | `recipe-step-photos`                                              |                   4 |
| medios website actualmente reutilizados | `pass-satellite-logos`                                            |                   2 |

No hay referencias rotas en este corte. Sí existe acoplamiento semántico: una misma columna de catálogo contiene URLs de tres buckets; `website_items.image_url` reutiliza `pass-satellite-logos`; y varias fuentes guardan URL pública completa en vez de bucket y ruta. Estos usos pueden ser válidos temporalmente, pero impiden gobernar privacidad, host, CDN, migración y sustitución como contrato estable.

#### 9. Límites, tipos y drift

- `documents` y `public-documents` no tienen límite ni allowlist de MIME en el bucket.
- Los objetos actuales coinciden con los tipos permitidos en los buckets que sí tienen allowlist.
- `product-images` conserva **15 objetos** por encima del límite actual de 5 MiB; el mayor mide aproximadamente 35,2 MB.
- No se detectaron propietarios Auth huérfanos en `owner` u `owner_id`.
- No existen cargas multipart activas.

Los objetos legacy sobre límite no deben borrarse. Deben clasificarse para optimización, excepción, reemplazo o migración, manteniendo referencias y calidad funcional.

#### 10. Ciclos de vida y automatización

No se encontraron rutinas empresariales, triggers propios ni jobs cron dedicados a:

- expiración de objetos temporales;
- limpieza de rutas draft;
- reconciliación de filas y objetos;
- disposición por baja laboral o eliminación de cuenta;
- retención de CV, documentos médicos o expedientes;
- detección de objetos sin referencia;
- propagación controlada de sustituciones.

Los triggers observados en `storage` son administrados por Supabase y protegen longitud, borrado directo y `updated_at`. No deben sustituirse ni utilizarse como lugar para lógica empresarial.

El flujo ANIMA de carga intenta compensar borrando el objeto cuando falla la inserción de la fila. En eliminación hace lo inverso: borra primero la fila y considera no crítico un fallo posterior al borrar el objeto. Ese orden puede dejar un archivo laboral público sin fila empresarial ni mecanismo de reintento. La arquitectura objetivo deberá usar saga, tombstone o servicio de disposición auditable.

#### 11. Modelo canónico mínimo requerido

Cada clase de archivo deberá resolver:

```text
bucket_id
+ object_path estable
+ owner_subject_type y owner_subject_id
+ business_entity_type y business_entity_id
+ sensitivity
+ visibility
+ created_by_actor
+ created_at
+ replacement/version policy
+ retention_class
+ disposition_state
+ disposed_at y disposed_by
+ checksum o ETag cuando aplique
```

La URL será una representación derivada. Para contenido privado se generará bajo autorización y expiración; para contenido público podrá derivarse mediante infraestructura de distribución, sin convertir la URL persistida en identidad del objeto.

#### 12. Brechas y enrutamiento obligatorio

| ID local           | Hallazgo                                                                      | Riesgo                                          | Resolución obligatoria                                     |
| ------------------ | ----------------------------------------------------------------------------- | ----------------------------------------------- | ---------------------------------------------------------- |
| `SUPA-AUD-012-B01` | `documents` es público pese a políticas y enlaces firmados                    | exposición de expedientes laborales             | `SUPA-ARC-010`; `SUPA-TRANS-*`; paquetes ANIMA y VISO      |
| `SUPA-AUD-012-B02` | `documents` y `public-documents` carecen de límite y MIME allowlist           | carga no acotada o tipo no previsto             | `SUPA-ARC-010`; `SUPA-AUD-015`; transición Storage         |
| `SUPA-AUD-012-B03` | 15 objetos de `product-images` exceden 5 MiB                                  | drift y reemplazo incompatible                  | `SUPA-AUD-018`; `SUPA-ARC-010`; `SUPA-TRANS-*`             |
| `SUPA-AUD-012-B04` | `recipe-step-photos` permite mutaciones a todo authenticated                  | alteración no autorizada                        | `SUPA-ARC-010`; `AUTH-DB-*`; paquete FOGO                  |
| `SUPA-AUD-012-B05` | acciones de `product-images` usan capacidades asimétricas                     | autorización incoherente                        | `SUPA-ARC-010`; `AUTH-CAT-*`; paquetes VISO/PASS           |
| `SUPA-AUD-012-B06` | buckets TALENTO privados no poseen disposición DELETE                         | retención indefinida o ciclo incompleto         | `SUPA-ARC-011`; paquete TALENTO; `SUPA-TRANS-*`            |
| `SUPA-AUD-012-B07` | URL completa, ruta desnuda y múltiples buckets coexisten como referencias     | acoplamiento a host y migración riesgosa        | `SUPA-ARC-010`; `SUPA-TRANS-*`; paquetes consumidores      |
| `SUPA-AUD-012-B08` | rutas raíz, UUID, draft, optimized y prefijos funcionales sin gramática única | limpieza y propiedad no deterministas           | `SUPA-ARC-010`; `SUPA-ARC-011`; `SUPA-TRANS-*`             |
| `SUPA-AUD-012-B09` | no hay automatización empresarial de retención o reconciliación               | objetos residuales y disposición no verificable | `SUPA-AUD-014`; `SUPA-ARC-011`; paquetes de ciclo de vida  |
| `SUPA-AUD-012-B10` | eliminación ANIMA borra fila antes de Storage y tolera fallo                  | archivo laboral huérfano y aún accesible        | `SUPA-ARC-011`; paquete documental ANIMA                   |
| `SUPA-AUD-012-B11` | `employee-photos` es público sin contrato de finalidad documentado            | exposición de dato personal                     | `SUPA-ARC-010`; paquete ANIMA/VISO; revisión de privacidad |

No quedan pendientes narrativos sin tarea.

#### 13. Huellas de integridad

| Registro                              | SHA-256                                                            |
| ------------------------------------- | ------------------------------------------------------------------ |
| configuración de buckets              | `e979a402b1d6fb4c64f8db2144bb362a68439e38841fe98e434c77a06258d3f4` |
| uso agregado por bucket               | `846a0c19e05cdf31d1f29a6511f2a2e8bb2c2793f1324cf15a2cd5281efbaa69` |
| políticas de Storage                  | `fef34dc7291ed2a4c63036f1ef03a48d092657e6a2390c143e9a53e8fc14b4d1` |
| referencias empresariales verificadas | `8f4fed16f2a3fbb177200a8dc48d265eec1bf08543bca42231cb8c7a21b5efdf` |

Las huellas excluyen contenido de archivos, nombres personales, URLs completas y secretos. El registro de referencias se compone de fuente, bucket, conteo, coincidencias y faltantes.

#### 14. Requisitos de prueba incorporados

Se incorporan `TREQ-SUPABASE-154` a `TREQ-SUPABASE-169` al registro canónico completo. Cubren inventario, contrato de bucket, privacidad documental, saga de archivos, buckets privados, TALENTO, autorización FOGO y VISO, límites, drift, rutas, referencias y validador integral.

#### 15. Cierre

La auditoría demuestra que el estado físico es consistente: no hay objetos en buckets inexistentes, rutas duplicadas ni referencias verificadas rotas. El problema principal es de gobierno:

1. un bucket laboral sensible está públicamente expuesto;
2. existen políticas de mutación demasiado amplias o asimétricas;
3. rutas y referencias no siguen un contrato único;
4. no existe ciclo empresarial automatizado de retención, reconciliación y disposición;
5. contenido legacy excede límites actuales.

No se modificó el remoto. La siguiente tarea canónica es:

```text
SUPA-AUD-013 — Auditar publicaciones, canales y consumidores de Realtime
```


### ✅ SUPA-AUD-013 — Auditar publicaciones, canales y consumidores de Realtime

**Estado:** APROBADA  
**Fecha de preparación documental:** 2026-07-29  
**Bloque propietario:** BLOQUE E3 — Arquitectura canónica de datos y gobierno integral de Supabase  
**Marcador exacto que reemplaza:** `### [ ] SUPA-AUD-013 — Auditar publicaciones, canales y consumidores de Realtime`  
**Tarea anterior:** `SUPA-AUD-012 — Auditar buckets, rutas, políticas y ciclos de vida de Storage` — APROBADA  
**Siguiente tarea:** `SUPA-AUD-014 — Auditar Edge Functions, webhooks, cron, colas y automatizaciones`  
**Proyecto observado:** `vento-os-dev` — `clzdpinthhtknkmefsxx`  
**Tipo de tarea:** auditoría documental, consultas remotas read-only, inspección de logs y repositorios; sin DDL, DML, cambios de publicaciones, RLS, slots, canales, despliegues ni código remoto

#### 1. Objetivo

Establecer una línea base verificable de la arquitectura Realtime vigente: publicaciones lógicas, tablas y columnas replicadas, controles RLS, replica identity, consumidores declarados en código, canales, filtros, recuperación, Broadcast, Presence, slots y señales operativas. La auditoría diferencia disponibilidad técnica, publicación efectiva y consumo funcional; ninguno de esos tres hechos se presume por la existencia de los otros.

#### 2. Regla canónica derivada

```text
Una capacidad solo podrá declararse en tiempo real cuando exista un contrato trazable entre productor, relación o evento publicable, autorización, canal, consumidor, filtro, semántica de entrega, recuperación y evidencia. Consumidor sin publicación, publicación sin finalidad o suscripción a una vista constituyen drift y no cobertura Realtime.
```

#### 3. Alcance y método

Se inspeccionaron, sin mutación:

- `pg_publication`, `pg_publication_tables` y `pg_replication_slots`;
- configuración de replicación lógica;
- relaciones y particiones administradas del esquema `realtime`;
- RLS, políticas, grants, PK y replica identity de las tablas publicadas;
- funciones y triggers que podrían emitir Broadcast;
- logs Realtime de las últimas veinticuatro horas;
- consumidores `postgres_changes` en Vento PASS, PULSO y ANIMA;
- carga inicial, filtros, limpieza, estado de conexión, polling y reconciliación observables.

No se emitieron mensajes, no se abrieron canales de prueba y no se modificó la publicación.

#### 4. Línea base de PostgreSQL y publicaciones

| Elemento                                        | Resultado |
| ----------------------------------------------- | --------: |
| `wal_level`                                     | `logical` |
| `max_replication_slots`                         |         5 |
| `max_wal_senders`                               |         5 |
| `max_logical_replication_workers`               |         4 |
| `max_worker_processes`                          |         6 |
| Publicaciones totales                           |         2 |
| Relaciones empresariales en `supabase_realtime` |         6 |
| Tablas empresariales con RLS                    |    6 de 6 |
| Tablas empresariales con PK                     |    6 de 6 |
| Tablas con `REPLICA IDENTITY FULL`              |         0 |
| Filtros de fila de publicación                  |         0 |
| Filas actuales en las seis tablas               |       100 |

La segunda publicación, `supabase_realtime_messages_publication`, es administrada por Supabase y contiene las particiones diarias de `realtime.messages`; no se clasifica como publicación empresarial de Vento.

#### 5. Tablas empresariales publicadas

| Tabla                            | Filas | Políticas | Observación                                                     |
| -------------------------------- | ----: | --------: | --------------------------------------------------------------- |
| `public.order_conversations`     |     4 |         2 | Chat de pedidos; dos políticas SELECT.                          |
| `public.order_delivery_sessions` |     0 |         2 | Publica hashes, notas y metadata aunque la tabla está vacía.    |
| `public.order_messages`          |     4 |         4 | Mensajería; políticas SELECT e INSERT.                          |
| `public.order_status_events`     |     5 |         3 | Eventos operativos con referencias y metadata.                  |
| `public.orders`                  |     7 |         6 | Publica datos de cliente, dirección, pago, despacho y regalo.   |
| `public.users`                   |    80 |         9 | Publica identidad, contacto, rol, puntos y fecha de nacimiento. |

Las seis relaciones publican todas sus columnas, permiten INSERT, UPDATE, DELETE y TRUNCATE en la publicación y no aplican row filter. RLS continúa controlando qué filas puede recibir cada suscriptor, pero no resuelve la minimización de columnas, la finalidad ni el costo de replicar datos innecesarios.

#### 6. Conciliación con consumidores observados

Se identificaron trece objetivos técnicos distintos en consumidores inspeccionados. Cinco tablas están publicadas; seis tablas no lo están; dos objetivos de PULSO son vistas.

##### 6.1 Suscripciones a tablas no publicadas

| Consumidor                    | Relación declarada              | Resultado remoto |
| ----------------------------- | ------------------------------- | ---------------- |
| ANIMA — contexto laboral      | `public.employee_sites`         | no publicada     |
| ANIMA — soporte               | `public.support_tickets`        | no publicada     |
| ANIMA — soporte               | `public.support_messages`       | no publicada     |
| ANIMA — soporte               | `public.support_ticket_reads`   | no publicada     |
| PASS — facturación de pedidos | `public.order_billing_requests` | no publicada     |
| PASS — redenciones            | `pass.loyalty_redemptions`      | no publicada     |

Las seis relaciones tienen RLS, clave primaria y política de lectura, pero no pertenecen a `supabase_realtime`; por tanto, las suscripciones no pueden recibir Postgres Changes en el estado observado.

##### 6.2 Suscripciones a vistas no publicables

El salón de PULSO se suscribe a `public.pos_table_service_calls` y `public.pos_sessions`. Ambas son vistas `security_invoker=true` sobre tablas del esquema `pos`. Ni las vistas ni las tablas base están en la publicación. PostgreSQL logical replication publica tablas, no esas vistas; el diseño actual del salón no constituye una ruta Realtime funcional.

##### 6.3 Consumidores sobre tablas publicadas

PASS y PULSO consumen `orders`, `order_messages`, `order_conversations`, `order_status_events` y `order_delivery_sessions`. Existen filtros útiles por cliente, sede, pedido o conversación, pero también suscripciones sin filtro que descartan datos después en memoria. RLS evita acceso a filas no autorizadas; aun así, el fan-out y el procesamiento son más amplios de lo necesario.

#### 7. Hallazgo de replica identity

Todas las tablas empresariales publicadas usan `REPLICA IDENTITY DEFAULT`. PULSO compara `payload.old.payment_status` para detectar el paso a pago aprobado. Los valores anteriores no pertenecientes a la PK no deben asumirse disponibles bajo ese contrato. La solución no se decide en esta auditoría: `SUPA-ARC-019` deberá optar entre refetch, evento explícito, Broadcast o `REPLICA IDENTITY FULL`, evaluando costo y privacidad.

#### 8. Canales y recuperación

Se inventariaron diecisiete patrones de canal definidos localmente. La mayoría limpia el canal al desmontar, pero no todos procesan estados de suscripción. Existen recuperaciones parciales:

- polling cada 8 segundos en inbox de chat PULSO;
- polling cada 15 segundos en seguimiento PASS;
- recarga al volver a foco, visibilidad u online en varios consumidores;
- callbacks que recargan snapshots o inboxes completos.

No existe un contrato transversal que defina frescura, backoff, deduplicación, reconciliación, presupuesto de consultas o señal visible de degradación.

#### 9. Broadcast, Presence y esquema administrado

| Control                                              | Resultado |
| ---------------------------------------------------- | --------: |
| Filas actuales en `realtime.messages`                |         0 |
| Suscripciones persistidas en `realtime.subscription` |         0 |
| Políticas sobre `realtime.messages`                  |         0 |
| Triggers empresariales Broadcast                     |         0 |
| Funciones administradas disponibles                  |         3 |
| Uso de Presence observado en repositorios            |         0 |

Las funciones `realtime.broadcast_changes`, `realtime.send` y `realtime.send_binary` son primitivas administradas; no existe productor empresarial que las invoque. Broadcast o Presence futuros deberán utilizar canales privados y políticas explícitas antes de habilitarse.

#### 10. Slots y logs

Se observó un slot lógico temporal activo administrado por Realtime, con plugin `pgoutput` y aproximadamente 16 MiB de WAL retenido al corte. Los logs muestran ciclos de inicialización, validación de publicación, streaming y cierre del tenant cuando no hay usuarios conectados. No se encontraron errores en la muestra; el cierre por inactividad no se clasifica como brecha.

#### 11. Brechas y resolución obligatoria

| ID                   | Brecha                                                            | Resolución asignada                                                         |
| -------------------- | ----------------------------------------------------------------- | --------------------------------------------------------------------------- |
| `B-SUPA-AUD-013-001` | Seis suscripciones apuntan a tablas no publicadas.                | `SUPA-ARC-019`; paquetes E5 ANIMA/PASS; `TREQ-SUPABASE-170`, `171`.         |
| `B-SUPA-AUD-013-002` | El salón se suscribe a dos vistas no publicables.                 | `SUPA-ARC-005`; `SUPA-ARC-019`; paquete E5 PULSO; `TREQ-SUPABASE-172`.      |
| `B-SUPA-AUD-013-003` | No existe catálogo publicación–consumidor.                        | `SUPA-ARC-019`; `SHELL-CI-017`; `TREQ-SUPABASE-173`, `186`.                 |
| `B-SUPA-AUD-013-004` | Todas las columnas y cero row filters.                            | `SUPA-ARC-015`, `016`, `019`; `TREQ-SUPABASE-174`.                          |
| `B-SUPA-AUD-013-005` | `users` está publicada sin consumidor observado.                  | `SUPA-AUD-019`; `SUPA-ARC-019`; transición controlada; `TREQ-SUPABASE-175`. |
| `B-SUPA-AUD-013-006` | Consumidor depende de `payload.old` con replica identity DEFAULT. | `SUPA-ARC-019`, `021`; paquete E5 PULSO; `TREQ-SUPABASE-176`.               |
| `B-SUPA-AUD-013-007` | Diecisiete nombres de canal locales sin registro.                 | `SUPA-ARC-011`, `019`; `TREQ-SUPABASE-177`.                                 |
| `B-SUPA-AUD-013-008` | Manejo desigual de error y reconexión.                            | `SUPA-ARC-019`; continuidad y E5; `TREQ-SUPABASE-178`, `179`.               |
| `B-SUPA-AUD-013-009` | No hay semántica común de duplicado, orden o replay.              | `SUPA-ARC-019`; `TREQ-SUPABASE-180`.                                        |
| `B-SUPA-AUD-013-010` | Recargas completas y polling pueden amplificar carga.             | `SUPA-ARC-021`; NFR; `TREQ-SUPABASE-181`, `185`.                            |
| `B-SUPA-AUD-013-011` | Suscripciones amplias filtran después en cliente.                 | `SUPA-ARC-015`, `019`; `TREQ-SUPABASE-182`.                                 |
| `B-SUPA-AUD-013-012` | Broadcast/Presence carecen de política y contrato.                | `SUPA-ARC-019`; `SUPA-AUD-014`; `TREQ-SUPABASE-183`, `184`.                 |
| `B-SUPA-AUD-013-013` | No existe prueba de capacidad Realtime.                           | `SUPA-ARC-021`; `DELIV-PKG-013`; `TREQ-SUPABASE-185`.                       |
| `B-SUPA-AUD-013-014` | No existe validador automático de drift.                          | `SUPA-AUD-016`, `017`; `SHELL-CI-017`; `TREQ-SUPABASE-186`, `187`.          |

No queda pendiente narrativo sin tarea o requisito responsable.

#### 12. Requisitos de prueba incorporados

Se incorporan en el registro canónico completo:

```text
TREQ-SUPABASE-170 a TREQ-SUPABASE-187
```

#### 13. Huellas reproducibles

| Registro                             | SHA-256                                                            |
| ------------------------------------ | ------------------------------------------------------------------ |
| Publicación empresarial observada    | `bdc3ed59d4f8d9325a212208277f74f1b8fa7dcbb2138f42218d221e62f0e1da` |
| Objetivos consumidor–publicación     | `2dc1fa9be3a6f11642d1e4b507f91234f48dca5f469d7bd9f1ef8865c674f632` |
| Patrones de canal inventariados      | `c3464f36e7e3d4349316e1cd950a81966006d87871dd4d324043ea9b907dd56c` |
| Controles agregados de publicación   | `655527e17c7dec0164b82a065ec0b2f7c61214c317c387557a32e940471a803f` |
| Archivo base aportado por el usuario | `6c938a3c0ee0eeeabfcd2ba5090e8892ae51b86b579eceeb113a81dc06164677` |

#### 14. Criterios de aceptación cumplidos

- inventario remoto de publicaciones y slots obtenido;
- tablas, columnas, RLS, políticas, PK y replica identity conciliados;
- consumidores actuales inspeccionados en repositorios;
- relaciones no publicadas y vistas imposibles identificadas;
- Broadcast, Presence, triggers y políticas auditados;
- recuperación y carga potencial clasificadas;
- cada brecha vinculada a resolución concreta;
- registro `04A` regenerado desde el archivo aportado por el usuario;
- cero cambios remotos.

#### 15. Cierre

`SUPA-AUD-013` queda **APROBADA** como línea base documental. La auditoría no autoriza agregar o retirar tablas de publicaciones, cambiar replica identity, crear políticas Realtime ni modificar consumidores. Esas decisiones pertenecen a `SUPA-ARC-019`, paquetes E5 y transición controlada.


### ✅ SUPA-AUD-014 — Auditar Edge Functions, webhooks, cron, colas y automatizaciones

**Estado:** APROBADA  
**Fecha de preparación documental:** 2026-07-29  
**Bloque propietario:** BLOQUE E3 — Arquitectura canónica de datos y gobierno integral de Supabase  
**Marcador exacto que reemplaza:** `### [ ] SUPA-AUD-014 — Auditar Edge Functions, webhooks, cron, colas y automatizaciones`  
**Tarea anterior:** `SUPA-AUD-013 — Auditar publicaciones, canales y consumidores de Realtime` — APROBADA  
**Siguiente tarea:** `SUPA-AUD-015 — Auditar extensiones, secretos, variables y configuración del proyecto`  
**Proyecto observado:** `vento-os-dev` — `clzdpinthhtknkmefsxx`  
**Tipo de tarea:** auditoría documental, consultas remotas read-only, inspección de funciones desplegadas, logs, catálogos PostgreSQL, migraciones y consumidores; sin DDL, DML, despliegues, invocaciones de prueba, cambios de cron, secretos, colas, webhooks ni código remoto

#### 1. Objetivo

Establecer una línea base reproducible de toda automatización observada en Vento OS: Edge Functions, webhooks externos e internos, funciones privilegiadas, triggers, `pg_cron`, `pg_net`, workflows externos, notificaciones, workers y mecanismos de cola. La auditoría diferencia cuatro hechos que no son equivalentes:

```text
FUNCIÓN DESPLEGADA
        ≠
PRODUCTOR CORRECTAMENTE AUTENTICADO
        ≠
EJECUCIÓN HTTP EXITOSA
        ≠
EFECTO EMPRESARIAL CONFIRMADO Y CONCILIABLE
```

#### 2. Regla canónica derivada

```text
Toda automatización deberá tener productor, autorización, contrato de entrada, efecto idempotente, correlación, timeout, retry, estado terminal, observabilidad, propietario, fuente versionada y mecanismo de recuperación. Un cron succeeded, una petición encolada o un HTTP 2xx no demostrarán por sí solos que el efecto empresarial quedó aplicado.
```

#### 3. Alcance y método

Se inspeccionaron sin mutación:

- metadatos y código desplegado de las 24 Edge Functions activas;
- `verify_jwt`, versión, estado, SHA y entrypoint observado;
- `pg_extension`, `cron.job`, `cron.job_run_details`, `net.http_request_queue` y `net._http_response`;
- funciones `SECURITY DEFINER`, triggers y rutas `pg_net` relacionadas con notificaciones, pagos, asistencia, delivery y limpieza;
- políticas y grants de `app_config` e `internal_job_secrets`, sin extraer valores;
- índices de idempotencia y concurrencia de eventos, entregas, runtime y eliminación de cuentas;
- logs de Edge Functions de las últimas veinticuatro horas;
- migraciones de `vento-shell`, consumidores en aplicaciones y el workflow GitHub Actions de eliminación de cuentas;
- presencia o ausencia de `pgmq`, `pgmq_public`, Vault y colas.

Se aplicó redacción obligatoria: ningún token, bearer, secreto, hash de secreto ni valor sensible observado se reproduce en este artefacto.

#### 4. Línea base ejecutiva

| Métrica                                                 |                             Resultado |
| ------------------------------------------------------- | ------------------------------------: |
| Edge Functions activas                                  |                                **24** |
| Con `verify_jwt=true`                                   |                                **12** |
| Con `verify_jwt=false`                                  |                                **12** |
| Cron jobs activos                                       |                                 **7** |
| Jobs con fallos históricos observados                   |                                 **1** |
| Fallos históricos del job afectado                      |                                 **2** |
| Extensiones relevantes instaladas                       | `pg_cron`, `pg_net`, `supabase_vault` |
| Extensión `pgmq`                                        |                      **no instalada** |
| Esquemas `pgmq` o `pgmq_public`                         |                                 **0** |
| Secretos en `vault.secrets`                             |                                 **0** |
| Requests pendientes en `net.http_request_queue`         |                                 **0** |
| Respuestas `pg_net` en la muestra retenida              |                                **72** |
| Respuestas 2xx                                          |                                **65** |
| Timeouts o errores de transporte                        |                                 **7** |
| Trigger HTTP empresarial activo                         |                                 **1** |
| Trigger de notificación de turnos esperado pero ausente |                                 **1** |
| Claves técnicas localizadas en tablas de configuración  |                                 **5** |
| Brechas documentadas y asignadas                        |                                **20** |

#### 5. Inventario de Edge Functions

| Función                     | Versión | `verify_jwt` | Clase observada                                                | Bundle SHA-256                                                     |
| --------------------------- | ------: | :----------: | -------------------------------------------------------------- | ------------------------------------------------------------------ |
| `wallet-pass`               |      33 |      sí      | `usuario autenticado`                                          | `fb5a0fea13f47c95b1895079169c2b87cce8a0646f53b32c008ea45f15988aef` |
| `attendance-report`         |      50 |      sí      | `usuario autenticado`                                          | `16d27070f2307e2b07f36f1479d32f6f461cf41e9a8b5503cc7864b4ec69aa59` |
| `staff-invitations-create`  |      46 |      sí      | `usuario autenticado`                                          | `a4423e51da0764248b7f86d4af486993a84d40cb1dc9b1a5779e44ee6eeb10cd` |
| `request-account-deletion`  |      28 |      sí      | `usuario autenticado`                                          | `ef78e5a385d3a14ee896e363d57c33630f20d374a02876fdd8cb53f2c2d4ed9e` |
| `account-deletion`          |      29 |      sí      | `usuario autenticado`                                          | `280d6688351108e6d6fe1ccaa87c3b7c88f486bde99f10c1dacd7e6a7a543a79` |
| `payments-create-intent`    |      21 |      sí      | `usuario autenticado`                                          | `9942cced9b99dc3a45b4f7f690b5629135ca60bd1fa94a72e8a9307c1d595671` |
| `shift-publish-notify`      |      14 |      sí      | `usuario o llamada interna declarada`                          | `84924db92fe82654a7cce974523449e9696049fd798cac53c29dbee3d2250712` |
| `pass-delivery-quote`       |      15 |      sí      | `usuario autenticado`                                          | `8b97ebc07c840069702ab25f061abca3bc3c666135627369b4dd87a2e54263f3` |
| `pass-address-search`       |      11 |      sí      | `usuario autenticado`                                          | `bab2f9ade92f9481762a4c653af376b821e4a0ff1e00c4f791fe482e651b9fa1` |
| `support-message-notify`    |       3 |      sí      | `llamada interna con configuración incompatible`               | `4186887297bbf32076d7cfb58f51323e45d491f6a3d96ffb424ee024a5dbedb8` |
| `pass-register-push-token`  |       3 |      sí      | `usuario autenticado`                                          | `0411843c25d5f2a5b117280b721cd8686a831bbd1a56997e9a59bb99d2261d26` |
| `order-message-notify`      |       3 |      sí      | `usuario autenticado`                                          | `a9fa8f44d6dae85f530384d8fb6ff5d01b5b44312d646bdd3066a6b43206d214` |
| `staff-invitations-accept`  |      36 |      no      | `bearer validado manualmente; autorización crítica defectuosa` | `84e615a9840e5015442ebac7688770c341b3012a4598cab88cbc7b178118194d` |
| `document-alerts`           |      33 |      no      | `cron con secreto personalizado fail-open`                     | `392815742821484a01ba9c1f5af6f610779e2085c131b349a856d0cc8f7d82e6` |
| `process-account-deletions` |      29 |      no      | `worker con bearer secreto fail-closed`                        | `60fbb0eb24eff4a3115e28e7e984c2b96675f38ef85e58d16f31dbd323a4afcb` |
| `register-push-token`       |      24 |      no      | `bearer de usuario validado manualmente`                       | `33e3c2f3d1760746f842f328e94f7ea71bffe1bff4e3dd7e348fbe81b7c6ec37` |
| `announcement-notify`       |      23 |      no      | `bearer manual; roles hardcoded`                               | `ad8b25228ae0532b8b687bc01b18ad735b5fe3edeabe52df416195c7e4576925` |
| `employee-delete`           |      15 |      no      | `bearer manual; UID fijo de autoridad`                         | `418165e003e593dd6dc171344d97ecfb016d6b84a8d1860eb4722f1be5654285` |
| `payments-webhook`          |      19 |      no      | `webhook público con checksum Wompi`                           | `6d1c50bb097eadaff6d9d92c20b09f8fefa68125a45d7edaf367aaf099ea145b` |
| `staff-invitations-resend`  |      15 |      no      | `bearer manual; roles hardcoded`                               | `1092ebdf95196b3042ed8678d2138e78cf66aff3f6de04d29dfca694dcaa1488` |
| `staff-invitations-cancel`  |      14 |      no      | `bearer manual; roles hardcoded`                               | `5ceef28ee60bba7a2debd7df96c430259790652c022b5831e084b186e727c7dd` |
| `shift-runtime-processor`   |      21 |      no      | `cron con secreto personalizado fail-open`                     | `0e61882b535592baf9dbb83194d1d0e8212e5d7cfa5772d6399feb4fc79e95f1` |
| `payments-return`           |       3 |      no      | `adaptador público de retorno a deep link`                     | `253b7a39ac76ecb2b0c8ca632bcfd11dd754e13b7bd5a947224afed54bf7d641` |
| `delivery-portal`           |       1 |      no      | `portal público por token de capacidad`                        | `316e21a30709e9b25778313bdf8172aba72ad1d4bd2b26679964279b932934dc` |

La distribución 12/12 no se interpreta como buena o mala por sí sola. `verify_jwt=false` es adecuado para webhooks firmados, workers con secreto o endpoints deliberadamente públicos; se vuelve riesgoso cuando la autorización manual es incompleta, fail-open o depende de datos controlables por el usuario.

#### 6. Hallazgo crítico: escalamiento en `staff-invitations-accept`

El código desplegado:

1. valida un bearer de usuario;
2. toma `role` y `site_id` primero del payload y luego de `user_metadata`;
3. comprueba únicamente que el rol y la sede existan y estén activos;
4. usa `service_role` para actualizar contraseña y metadata de Auth;
5. hace `upsert` del trabajador y su sede primaria;
6. intenta marcar alguna invitación compatible después de materializar la identidad.

No exige que una invitación vigente, no cancelada, de un solo uso y vinculada al usuario autorice previamente esos valores. Por tanto, el endpoint constituye una ruta de escalamiento potencial a cualquier rol y sede activos, incluido un rol administrativo máximo. La resolución se asigna a `TREQ-SUPABASE-190`, `191`, `205`, `AUTH-SRV-*`, `AUTH-DB-*` y al paquete de onboarding ANIMA.

#### 7. Hallazgo crítico: secretos expuestos y persistidos

`public.app_config` tiene RLS habilitado, pero sus políticas `app_config_select_anon` y `app_config_select_authenticated` permiten `SELECT` con condición `true`. Dentro de esa tabla se identificó la clave `shift_notify_internal_secret`. No se leyó ni se conserva su valor en este artefacto.

Además, `document-alerts-daily` contiene en `cron.job.command` un bearer y un `x-cron-key` literales. Los valores se consideran expuestos y fueron deliberadamente omitidos. La tarea no rota credenciales por ser read-only; la rotación y migración a custodia privada quedan obligatoriamente asignadas a `SUPA-AUD-015`, `SUPA-ARC-020`, `SUPA-TRANS-*` y `TREQ-SUPABASE-192`, `193`.

`internal_job_secrets` presenta una política denegatoria para `anon` y `authenticated`, pero almacena secreto en texto y no sustituye una arquitectura canónica de secret keys o Vault. `vault.secrets` estaba vacío al corte.

#### 8. Compatibilidad entre productor y gateway

La documentación vigente de Supabase establece que `verify_jwt=true` ejecuta una validación de plataforma antes del handler y requiere un JWT válido en `Authorization`. La ruta activa de soporte contradice ese contrato:

```text
AFTER INSERT public.support_messages
        ↓
notify_support_message_inserted()
        ↓
pg_net con x-internal-secret, sin Authorization
        ↓
support-message-notify con verify_jwt=true
```

El gateway puede responder 401 antes de que la función compare `x-internal-secret`. La ruta deberá corregirse y probarse extremo a extremo; no basta con revisar el handler.

Para turnos ocurre el drift inverso: la migración define `trg_employee_shifts_notify_published`, pero ese trigger no existe remoto. ANIMA invoca `shift-publish-notify` desde cliente con JWT después de crear o editar turnos, por lo que existe una compensación local no equivalente al diseño server-side original.

#### 9. Cron jobs y semántica temporal

| Job ID | Nombre                                               | Schedule UTC  | Objetivo                                               |   Runs | Fallos | Observación                                                                                  |
| -----: | ---------------------------------------------------- | ------------- | ------------------------------------------------------ | -----: | -----: | -------------------------------------------------------------------------------------------- |
|      1 | `document-alerts-daily`                              | `0 14 * * *`  | Edge Function document-alerts por pg_net               |    183 |      0 | Authorization y x-cron-key literales presentes en cron.job.command; valores REDACTADOS       |
|      2 | `auto-close-attendance`                              | `59 4 * * *`  | public.close_open_attendance_day_end('America/Bogota') |    181 |      2 | equivale a 23:59 America/Bogota del día anterior; dos fallos por empleado inactivo           |
|      3 | `anima_shift_runtime_processor_every_5m`             | `*/5 * * * *` | public.run_shift_runtime_processor()                   | 39.513 |      0 | éxito de cron significa despacho de pg_net. no resultado final de la Edge Function           |
|      5 | `pass_delivery_quotes_cleanup_hourly`                | `17 * * * *`  | pass.cleanup_delivery_quotes()                         |  1.510 |      0 | elimina cotizaciones expiradas y usadas antiguas                                             |
|      6 | `anima_attendance_day_end_close_0005`                | `5 0 * * *`   | public.close_open_attendance_day_end('America/Bogota') |     31 |      0 | equivale a 19:05 America/Bogota; duplica función del job 2 y contradice el nombre 0005 local |
|      9 | `attendance_stale_open_shift_autoclose_daily_bogota` | `10 5 * * *`  | public.close_stale_open_attendance_shifts()            |     24 |      0 | equivale a 00:10 America/Bogota                                                              |
|     10 | `pass_payment_checkout_expiry_reconciliation`        | `*/5 * * * *` | public.reconcile_expired_payment_checkouts()           |  5.564 |      0 | actualiza transacción y pedido en una misma función SQL                                      |

Los dos fallos de `auto-close-attendance`, ocurridos el 27 y 28 de junio de 2026, fueron causados por `Empleado inactivo` dentro del trigger de asistencia. La función remota fue corregida posteriormente para filtrar empleados activos, pero no existe prueba canónica que demuestre la regresión cerrada.

La mayor contradicción temporal es `anima_attendance_day_end_close_0005`: su expresión `5 0 * * *` corre a las **19:05 de Bogotá**, no a las 00:05 locales. El job `auto-close-attendance` corre a las **23:59 de Bogotá** y ejecuta la misma función. Aunque la función es esencialmente idempotente frente a cierres ya existentes, mantener ambos jobs carece de contrato y puede cerrar turnos de días anteriores varias horas antes de la supuesta ventana local.

#### 10. `pg_net`, timeouts y falso éxito

En la muestra retenida entre `2026-07-29T15:50:00Z` y `2026-07-29T21:45:00Z`:

| Resultado                                | Cantidad |
| ---------------------------------------- | -------: |
| respuestas 200                           |       65 |
| respuestas 4xx                           |        0 |
| respuestas 5xx                           |        0 |
| errores de transporte por timeout de 5 s |        7 |
| requests todavía pendientes              |        0 |

Los siete errores ocurrieron en cadencia de cinco minutos. Los logs de Edge Functions mostraron ejecuciones de `shift-runtime-processor` que podían superar cinco segundos; por coincidencia temporal, es razonable inferir que parte o toda la muestra de timeouts pertenece a ese flujo, aunque `net._http_response` no conserva URL para probarlo. La inferencia no se presenta como atribución definitiva.

`cron.job_run_details.status='succeeded'` solo demuestra que la sentencia SQL terminó. En jobs que llaman `net.http_post`, eso normalmente significa que la petición obtuvo un `request_id`; no demuestra HTTP 2xx ni efecto empresarial. Se requieren correlación y reconciliación conforme a `TREQ-SUPABASE-198` a `200`.

#### 11. Registro productor–consumidor

| Productor                | Transporte           | Consumidor                  | Autenticación                            | Estado contractual observado                                                |
| ------------------------ | -------------------- | --------------------------- | ---------------------------------------- | --------------------------------------------------------------------------- |
| cron.job 1               | pg_net               | `document-alerts`           | bearer y x-cron-key literales en comando | sin correlación durable del resultado                                       |
| cron.job 3               | función SQL + pg_net | `shift-runtime-processor`   | x-cron-key desde internal_job_secrets    | respuesta pg_net expira a 5 s en parte de la muestra                        |
| trigger support_messages | pg_net               | `support-message-notify`    | solo x-internal-secret                   | verify_jwt=true requiere Authorization antes del handler; ruta incompatible |
| cliente ANIMA            | functions.invoke     | `shift-publish-notify`      | JWT de usuario                           | ruta observable; trigger DB esperado no existe remoto                       |
| GitHub Actions diario    | curl HTTPS           | `process-account-deletions` | bearer secreto                           | worker no reclama filas con lease atómico                                   |
| Wompi                    | webhook HTTPS        | `payments-webhook`          | checksum de proveedor                    | idempotencia por provider y event_id; mutación y registro no atómicos       |
| repartidor externo       | URL de capacidad     | `delivery-portal`           | token en URL/cuerpo                      | expiración e intentos en RPC; sin rate limit explícito                      |

#### 12. Webhook interno de soporte

`notify_support_message_inserted`:

- envía `ticket_id`, `message_id`, `author_id` y el cuerpo completo del mensaje;
- reutiliza `shift_notify_internal_secret` en un dominio distinto;
- captura `when others` y retorna `NEW`, sin persistir el fallo;
- no conserva outbox, retry, correlation id, resultado ni deduplicación;
- llama una función cuya configuración `verify_jwt` no coincide con los headers enviados.

El diseño deberá cambiar a un evento mínimo, normalmente identificadores y correlación, para que la Edge Function recupere el contenido mediante autorización server-side. El cuerpo laboral no deberá viajar por el trigger si no es estrictamente necesario.

#### 13. Pagos y webhooks externos

`payments-webhook` presenta controles positivos:

- checksum Wompi obligatorio;
- clave única `(provider, provider_event_id)`;
- lookup de duplicado procesado;
- RPC privadas limitadas a `service_role`;
- bloqueo de transacción antes de actualizar pago y pedido.

Persisten brechas:

- la transición de pago y el registro del webhook son llamadas separadas;
- si el registro falla después del cambio de estado, la función registra el error pero puede responder éxito;
- cuando el proveedor no entrega un event ID, se genera UUID aleatorio y se pierde idempotencia entre reintentos equivalentes;
- se persiste el payload completo sin contrato aprobado de redacción y retención.

`payments-return` no modifica datos y escapa el HTML; sin embargo, construye el deep link desde query params no confiables. PASS deberá revalidar pedido, transacción y autorización server-side.

#### 14. Eliminación de cuentas

El workflow `vento-pass/.github/workflows/process-account-deletions.yml` ejecuta diariamente a las `03:00 UTC` y también admite ejecución manual. Llama `process-account-deletions` mediante un bearer secreto.

El worker está protegido de forma fail-closed, pero selecciona hasta 200 solicitudes `pending`, luego cambia cada una a `processing`. No existe claim atómico, lease, `SKIP LOCKED`, heartbeat, contador de reintentos o dead-letter. Dos ejecuciones concurrentes pueden leer la misma fila antes del cambio de estado y comenzar el mismo trabajo. La corrección pertenece a `TREQ-SUPABASE-202` y a la decisión de colas/outbox de `TREQ-SUPABASE-203`.

#### 15. Colas

No existen la extensión `pgmq`, los esquemas `pgmq` o `pgmq_public`, tablas de queue ni consumidores PGMQ. Esta ausencia no se declara automáticamente como error: la arquitectura puede elegir outbox transaccional u otro mecanismo. Sin embargo, la decisión es obligatoria porque existen trabajos críticos que necesitan persistencia, backpressure, retry y replay:

- eliminación de cuentas;
- notificaciones de soporte, turnos, documentos y pedidos;
- recepción de webhooks de pago;
- conciliaciones y retenciones;
- futuros ciclos de vida de Storage.

#### 16. Portales y tokens de capacidad

`delivery-portal` usa un token aleatorio cuyo hash se almacena con índice único; los RPC aplican expiración, estados, bloqueo de fila, límite de intentos de PIN y eventos operativos. Esos controles son positivos.

El token viaja en query string, por lo que puede persistir en historial, logs, capturas o referers si no se aplican controles adicionales. El portal expone dirección, teléfono, instrucciones y datos de regalo al poseedor. No se observó rate limiting explícito en Edge Function. La protección definitiva se asigna a `TREQ-SUPABASE-206`.

#### 17. Autorización administrativa y proveedores

Se observaron decisiones locales que deben converger al modelo canónico:

- `employee-delete` autoriza exclusivamente por un UID de entorno;
- `announcement-notify`, `staff-invitations-resend` y `staff-invitations-cancel` usan sets de roles hardcoded;
- notificaciones Expo y correos Resend no comparten política uniforme de timeout, retry, receipts, idempotencia o rate limiting;
- varias funciones usan `service_role`, por lo que el control previo debe ser explícito, mínimo y auditable.

#### 18. Procedencia y reproducibilidad

Los metadatos de despliegue contienen:

- rutas temporales bajo `/tmp/user_fn_*`;
- rutas absolutas de equipos personales bajo `/Users/User/...`;
- una ruta bajo OneDrive de otro equipo;
- funciones originadas en repositorios de aplicación y otras en `vento-shell`.

El entrypoint remoto no sustituye un manifiesto reproducible. Debe existir una conciliación `slug → repositorio → ruta relativa → commit → configuración → bundle SHA`, protegida por `TREQ-SUPABASE-188`, `209` y `211`.

#### 19. Evidencia positiva observada

La auditoría también preserva controles válidos:

- `payments-webhook` verifica checksum y dispone de índice único de idempotencia;
- `shift_runtime_events` tiene índice único `(shift_id, event_type)`;
- los RPC del portal de entrega solo son ejecutables por `postgres` y `service_role`;
- `internal_job_secrets` deniega clientes mediante RLS;
- `process-account-deletions` exige secreto y falla cerrado;
- las funciones SQL de limpieza, asistencia y pagos inspeccionadas limitan `EXECUTE` a `postgres` y `service_role`;
- `net.http_request_queue` estaba vacía al corte.

Estos controles reducen riesgo, pero no cierran las brechas de autorización, secreto, correlación y resiliencia identificadas.

#### 20. Brechas y resolución obligatoria

| ID                   | Severidad   | Brecha                                                                                                                                                                                                        | Resolución asignada                                                             |
| -------------------- | ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- |
| `B-SUPA-AUD-014-001` | **CRÍTICA** | staff-invitations-accept permite que el usuario autenticado suministre role y site_id desde el cuerpo o user_metadata y luego los materializa con service_role sin exigir una invitación válida y vinculante. | SUPA-ARC-020; AUTH-SRV-*; AUTH-DB-*; paquete ANIMA; TREQ-SUPABASE-190 y 191     |
| `B-SUPA-AUD-014-002` | **CRÍTICA** | app_config contiene un secreto interno y sus políticas SELECT permiten lectura total a anon y authenticated.                                                                                                  | SUPA-AUD-015; SUPA-ARC-015 y 020; transición urgente; TREQ-SUPABASE-192 y 193   |
| `B-SUPA-AUD-014-003` | **CRÍTICA** | document-alerts-daily conserva un bearer y un x-cron-key literales dentro de cron.job.command.                                                                                                                | SUPA-AUD-015; SUPA-ARC-020; rotación inmediata en transición; TREQ-SUPABASE-193 |
| `B-SUPA-AUD-014-004` | **CRÍTICA** | support-message-notify tiene verify_jwt=true, pero el trigger PostgreSQL solo envía x-internal-secret y no Authorization; el gateway puede rechazar la solicitud antes del handler.                           | SUPA-ARC-020; paquete ANIMA soporte; TREQ-SUPABASE-195 y 200                    |
| `B-SUPA-AUD-014-005` | **ALTA**    | document-alerts y shift-runtime-processor aplican autorización personalizada de forma fail-open si su secreto esperado no existe.                                                                             | SUPA-AUD-015; SUPA-ARC-020; TREQ-SUPABASE-194                                   |
| `B-SUPA-AUD-014-006` | **ALTA**    | dos cron jobs ejecutan close_open_attendance_day_end con horarios UTC que representan 19:05 y 23:59 en Bogotá; el nombre 0005 induce una semántica local incorrecta.                                          | SUPA-ARC-020; paquete ANIMA asistencia; TREQ-SUPABASE-196 y 197                 |
| `B-SUPA-AUD-014-007` | **ALTA**    | pg_cron marca como succeeded el encolado pg_net y no demuestra resultado HTTP; la muestra net contiene 65 respuestas 2xx y siete timeouts de transporte.                                                      | SUPA-ARC-020 y 021; observabilidad; TREQ-SUPABASE-198 y 199                     |
| `B-SUPA-AUD-014-008` | **ALTA**    | notify_support_message_inserted transmite el cuerpo completo, reutiliza el secreto de turnos y silencia toda excepción sin outbox, retry o conciliación.                                                      | SUPA-ARC-020; paquete ANIMA soporte; TREQ-SUPABASE-199 y 200                    |
| `B-SUPA-AUD-014-009` | **ALTA**    | process-account-deletions procesa filas por lote sin claim, lease, SKIP LOCKED, retry counter ni dead-letter; ejecuciones concurrentes pueden duplicar trabajo.                                               | SUPA-ARC-020 y 022; paquete PASS privacidad; TREQ-SUPABASE-202 y 203            |
| `B-SUPA-AUD-014-010` | **ALTA**    | payments-webhook actualiza el pago y registra el evento en operaciones separadas; un fallo de registro puede dejar el estado aplicado sin evidencia transaccional equivalente.                                | SUPA-ARC-020; paquete PASS pagos; TREQ-SUPABASE-201                             |
| `B-SUPA-AUD-014-011` | **ALTA**    | no están instalados pgmq ni Supabase Queues y varios flujos asíncronos críticos dependen de HTTP directo, cron o workflows sin una frontera durable común.                                                    | SUPA-ARC-020 y 022; decisión arquitectónica; TREQ-SUPABASE-203                  |
| `B-SUPA-AUD-014-012` | **ALTA**    | employee-delete usa un UID humano fijo y announcement-notify e invitaciones usan sets de roles hardcoded en lugar de capacidades canónicas.                                                                   | AUTH-CAT-*; AUTH-SRV-*; SUPA-ARC-020; TREQ-SUPABASE-205                         |
| `B-SUPA-AUD-014-013` | **ALTA**    | delivery-portal expone dirección, contacto e instrucciones mediante token de capacidad en URL; no se observó rate limiting explícito ni contrato de privacidad de logs.                                       | SUPA-ARC-020 y 022; paquete PULSO/PASS; TREQ-SUPABASE-206                       |
| `B-SUPA-AUD-014-014` | **MEDIA**   | payments-return construye el deep link con identificadores de query string sin comprobar su relación; la app receptora debe tratarlos solo como pistas y revalidar servidor-side.                             | SUPA-ARC-020; paquete PASS pagos; TREQ-SUPABASE-207                             |
| `B-SUPA-AUD-014-015` | **ALTA**    | envíos Expo y Resend tienen manejo desigual de timeout, códigos no 2xx, retry, receipt y deduplicación.                                                                                                       | SUPA-ARC-020 y 021; paquetes ANIMA/PASS/PULSO; TREQ-SUPABASE-204 y 208          |
| `B-SUPA-AUD-014-016` | **ALTA**    | el trigger de notificación de turnos previsto en migración no existe remoto; ANIMA compensa con llamada cliente directa, generando doble diseño y drift.                                                      | SUPA-AUD-016 y 017; SUPA-ARC-020; TREQ-SUPABASE-195 y 209                       |
| `B-SUPA-AUD-014-017` | **MEDIA**   | metadatos de despliegue mezclan rutas temporales con rutas absolutas de equipos de desarrollo y no existe manifiesto único que concilie fuente, versión y SHA desplegado.                                     | SUPA-AUD-016 y 017; SHELL-CI-017; TREQ-SUPABASE-209                             |
| `B-SUPA-AUD-014-018` | **ALTA**    | no existe panel canónico que una cron run, request_id pg_net, invocación Edge, efecto empresarial, retry y alerta.                                                                                            | SUPA-ARC-007 y 020; NFR; TREQ-SUPABASE-210                                      |
| `B-SUPA-AUD-014-019` | **ALTA**    | no se observaron automatizaciones empresariales de retención, reconciliación de objetos Storage u orphans; la brecha de SUPA-AUD-012 permanece asignada.                                                      | SUPA-ARC-018 y 022; SUPA-TRANS-*; TREQ-SUPABASE-157 y 158                       |
| `B-SUPA-AUD-014-020` | **ALTA**    | no existe validador automático del inventario de funciones, jobs, rutas, secretos expuestos, colas y productores.                                                                                             | SUPA-AUD-016 y 017; SHELL-CI-017; TREQ-SUPABASE-211                             |

No queda hallazgo narrativo sin tarea o requisito responsable.

#### 21. Requisitos de prueba incorporados

Se añadieron 24 requisitos consecutivos:

```text
TREQ-SUPABASE-188 a TREQ-SUPABASE-211
```

Cubren inventario, autorización, invitaciones, secretos, gateway, cron, timezone, `pg_net`, soporte, pagos, eliminación de cuenta, colas, push, acciones destructivas, capability URLs, proveedores, procedencia, observabilidad y drift.

Rango incorporado: `TREQ-SUPABASE-188`, `TREQ-SUPABASE-189`, `TREQ-SUPABASE-190`, `TREQ-SUPABASE-191`, `TREQ-SUPABASE-192`, `TREQ-SUPABASE-193`, `TREQ-SUPABASE-194`, `TREQ-SUPABASE-195`, `TREQ-SUPABASE-196`, `TREQ-SUPABASE-197`, `TREQ-SUPABASE-198`, `TREQ-SUPABASE-199`, `TREQ-SUPABASE-200`, `TREQ-SUPABASE-201`, `TREQ-SUPABASE-202`, `TREQ-SUPABASE-203`, `TREQ-SUPABASE-204`, `TREQ-SUPABASE-205`, `TREQ-SUPABASE-206`, `TREQ-SUPABASE-207`, `TREQ-SUPABASE-208`, `TREQ-SUPABASE-209`, `TREQ-SUPABASE-210`, `TREQ-SUPABASE-211`.

#### 22. Huellas de integridad de la evidencia

| Registro                       | SHA-256                                                            |
| ------------------------------ | ------------------------------------------------------------------ |
| `edge_function_registry`       | `4d1ee07c3c5c659e06acb9687db27690c8df1c5fab9318d459617b2175ad685f` |
| `cron_registry`                | `c24271f32da5a81094be38f67c497fb48e28f77e8db82e2e8233183e9ee2ad04` |
| `automation_contract_registry` | `93a525281a8d54731ba33460c6b806ad6220cff6a28b7e4edac32251ec214f34` |
| `breach_register`              | `d11fc061f0f054790b20e50c0e23d90f35f89bf2b7c0843813ec02dfaf833ab0` |

Las huellas excluyen cualquier secreto o credencial. El registro cron sustituye el contenido sensible por una indicación redactada.

#### 23. Límites de esta auditoría

Esta tarea no:

- rota secretos ni cambia políticas;
- modifica `verify_jwt`;
- reprograma o elimina cron jobs;
- crea colas, outbox o workers;
- invoca funciones para pruebas destructivas;
- cambia código o despliegues;
- decide todavía el inventario completo de variables de entorno, API keys, Vault y configuración del proyecto, reservado para `SUPA-AUD-015`;
- ejecuta la comparación exhaustiva remoto–migraciones, reservada para `SUPA-AUD-016` y `SUPA-AUD-017`.

#### 24. Cierre

`SUPA-AUD-014` queda **APROBADA** como línea base documental de Edge Functions, webhooks, cron, colas y automatizaciones. Ningún hallazgo autoriza un cambio directo en producción; las correcciones deberán diseñarse en `SUPA-ARC-020`, incorporarse a transición controlada y probarse mediante `TREQ-SUPABASE-188` a `211`.

La continuidad canónica queda fijada en:

```text
SUPA-AUD-015 — Auditar extensiones, secretos, variables y configuración del proyecto
```


### ✅ SUPA-AUD-015 — Auditar extensiones, secretos, variables y configuración del proyecto

**Estado:** APROBADA  
**Fecha de preparación documental:** 2026-07-29  
**Bloque propietario:** BLOQUE E3 — Arquitectura canónica de datos y gobierno integral de Supabase  
**Marcador exacto que reemplaza:** `### [ ] SUPA-AUD-015 — Auditar extensiones, secretos, variables y configuración del proyecto`  
**Tarea anterior:** `SUPA-AUD-014 — Auditar Edge Functions, webhooks, cron, colas y automatizaciones` — APROBADA  
**Siguiente tarea:** `SUPA-AUD-016 — Comparar Supabase remoto con migraciones y configuración de vento-shell`  
**Proyecto observado:** `vento-os-dev` — `clzdpinthhtknkmefsxx`  
**Tipo de tarea:** auditoría documental, consultas remotas read-only, inspección de metadatos de proyecto, extensiones, settings PostgreSQL, ACL, advisors, bundles desplegados y repositorios; sin DDL, DML, lectura o copia de valores secretos, rotaciones, cambios de Auth, claves, configuración, funciones ni código remoto

#### 1. Objetivo

Establecer una línea base reproducible de la configuración técnica que determina el comportamiento y la seguridad de Vento OS en Supabase:

```text
EXTENSIONES Y OBJETOS ADMINISTRADOS
        +
CLAVES API Y SECRETOS
        +
VARIABLES DE EDGE FUNCTIONS
        +
CONFIGURACIÓN DE POSTGRES, AUTH Y GATEWAY
        +
PARIDAD ENTRE REPOSITORIO Y REMOTO
        ↓
CONFIGURACIÓN CANÓNICA, MÍNIMA, ROTABLE Y REPRODUCIBLE
```

La existencia de una extensión, una variable o una clave no demuestra que sea necesaria, esté bien ubicada, tenga mínimo privilegio, pertenezca al ambiente correcto o pueda rotarse sin interrupción.

#### 2. Regla canónica derivada

```text
Ningún secreto podrá residir en una superficie accesible por cliente, catálogo operativo, código, log o artefacto. Toda extensión, clave, variable y setting deberá tener propietario, finalidad, ambiente, consumidores, mínimo privilegio, fuente versionada, validación, rotación o actualización, evidencia de drift y rollback.
```

#### 3. Alcance, método y redacción

Se inspeccionaron sin mutación:

- proyecto, región, estado, versión de PostgreSQL y claves públicas activas;
- extensiones instaladas, versiones disponibles, esquema, propietario y referencias específicas;
- `pg_settings`, settings por rol y base, configuración de cron, TLS, WAL, logging y timeouts;
- ACL efectivas de schemas y objetos técnicos para `anon`, `authenticated` y `service_role`;
- metadata de `app_config`, `internal_job_secrets`, `app_runtime_settings` y Vault;
- 24 Edge Functions activas, bundles, variables referenciadas, import maps y `verify_jwt`;
- `supabase/config.toml`, `.gitignore` y búsquedas de código en repositorios Vento;
- advisor de seguridad remoto;
- línea base previa de schemas expuestos de `SUPA-AUD-003` para diferenciar privilegio directo de exposición Data API.

No se extrajeron, reprodujeron ni hashearon valores de API keys, secretos, private keys, bearer, JWT privados, payloads SQL, coordenadas o credenciales. Solo se conservaron nombres, tipos, conteos, longitudes, estado, localización y huellas de conjuntos redactados.

#### 4. Fuentes de verdad congeladas

| Fuente                                             | Corte                                                                                  | Responsabilidad                                          |
| -------------------------------------------------- | -------------------------------------------------------------------------------------- | -------------------------------------------------------- |
| `SUPA-AUD-014.md` local aprobado                   | SHA-256 `2268180383cbf2eac90d61379c4c4a6fd4506df0823cdecfe1cf9c47a5407ed1`             | continuidad documental inmediata                         |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` | SHA-256 `21eff81ffa0fe86fe491357ec20c5a3a8f807b5073c01538227e7cc5ce35bcdf`; 4506 filas | base canónica hasta `TREQ-SUPABASE-211`                  |
| Supabase `vento-os-dev`                            | consultas entre `2026-07-29T22:03Z` y `22:20Z`                                         | estado remoto de extensiones, ACL, settings y metadatos  |
| Edge Functions remotas                             | 24 bundles `ACTIVE`                                                                    | código y configuración realmente desplegados             |
| `supabase/config.toml`                             | blob `cc013305bf617ba469cde361bc57d035b423847f`                                        | configuración local declarada                            |
| `.gitignore`                                       | blob `3e8103e64e74c79cb7734f0a67bd7b80037b4274`                                        | exclusión estática de `.env*` y PEM                      |
| Supabase Security Advisor                          | corte del 2026-07-29                                                                   | señales administradas de Auth, extensión y superficie DB |
| Documentación oficial Supabase                     | consultada el 2026-07-29                                                               | semántica de keys, secretos, extensiones, Auth y linter  |

#### 5. Línea base ejecutiva

| Métrica                                                     |                                  Resultado |
| ----------------------------------------------------------- | -----------------------------------------: |
| Extensiones instaladas                                      |                                      **8** |
| Extensiones instaladas con upgrade pendiente                |                                      **0** |
| Extensiones relevantes disponibles no instaladas            |                                      **9** |
| Extensiones instaladas fuera de schema técnico recomendado  |              **1**: `unaccent` en `public` |
| Extensiones sin referencia empresarial específica observada |                         **1**: `uuid-ossp` |
| Secretos en Vault                                           |                                      **0** |
| Claves públicas activas observadas                          | **2**: una `anon` legacy y una publishable |
| Edge Functions activas                                      |                                     **24** |
| Distribución `verify_jwt`                                   |                     **12 true / 12 false** |
| Funciones con import map declarado                          |                                      **1** |
| Claves en `app_config`                                      |                        **7**, una sensible |
| Secretos en `internal_job_secrets`                          |                             **1** en texto |
| Runtime flags                                               |         **6**, ninguno con nombre sensible |
| Cron jobs con literal secreto                               |                                      **1** |
| Respuestas retenidas en `net._http_response`                |                                     **72** |
| Entradas `pg_stat_statements`                               |                                   **4858** |
| Queries con términos sensibles por patrón                   |                                    **146** |
| Queries con patrón de correo                                |                                      **7** |
| Brechas asignadas                                           |                                     **28** |
| Requisitos nuevos                                           |                                     **31** |

#### 6. Inventario de extensiones

| Extensión            |  Versión | Schema       | Owner            | Upgrade pendiente |
| -------------------- | -------: | ------------ | ---------------- | :---------------: |
| `pg_cron`            |  `1.6.4` | `pg_catalog` | `supabase_admin` |        no         |
| `pg_net`             | `0.19.5` | `extensions` | `supabase_admin` |        no         |
| `pg_stat_statements` |   `1.11` | `extensions` | `postgres`       |        no         |
| `pgcrypto`           |    `1.3` | `extensions` | `postgres`       |        no         |
| `plpgsql`            |    `1.0` | `pg_catalog` | `supabase_admin` |        no         |
| `supabase_vault`     |  `0.3.1` | `vault`      | `supabase_admin` |        no         |
| `unaccent`           |    `1.1` | `public`     | `supabase_admin` |        no         |
| `uuid-ossp`          |    `1.1` | `extensions` | `postgres`       |        no         |

Disponibles pero no instaladas en la selección de interés: `http`, `pg_jsonschema`, `pgaudit`, `pgjwt`, `pgmq`, `pgsodium`, `postgis`, `vector`, `wrappers`.

Interpretación:

- ninguna extensión instalada requería upgrade según el catálogo observado;
- `pg_cron` y `pg_net` tienen consumidores empresariales comprobados;
- `unaccent` es consumida por `public.normalize_text`, pero está ubicada en `public` y el advisor la marca como extensión en schema público;
- `uuid-ossp` no mostró llamadas `uuid_generate_*` en funciones, vistas o defaults inspeccionados; esto obliga a evaluar, no a retirar automáticamente;
- `supabase_vault` está instalada, pero `vault.secrets` no contiene filas y no se observaron referencias empresariales.

#### 7. Claves API y transición de modelo

La API de gestión retornó dos claves públicas activas:

| Clase                   |                                 Cantidad | Estado documental                             |
| ----------------------- | ---------------------------------------: | --------------------------------------------- |
| `anon` legacy JWT       |                                    **1** | activa; consumidores aún usan nombres legacy  |
| publishable key moderna |                                    **1** | activa                                        |
| secret keys privadas    | no enumerables por el conector utilizado | requieren evidencia administrativa controlada |

No se conserva ningún valor. La coexistencia no constituye por sí sola un incidente, pero prueba que la migración de consumidores no está cerrada. Los nombres `SUPABASE_ANON_KEY` y `SUPABASE_SERVICE_ROLE_KEY` siguen presentes en bundles y código server-side; deberá diferenciarse publicación cliente, secreto backend y credenciales administradas por plataforma.

#### 8. Matriz de custodia de secretos

| Ubicación                     |               Conteo observado | Acceso cliente                       | Custodia                   | Dictamen                                |
| ----------------------------- | -----------------------------: | ------------------------------------ | -------------------------- | --------------------------------------- |
| `public.app_config`           |           7 claves; 1 sensible | `anon` y `authenticated` pueden leer | JSONB en tabla empresarial | **exposición confirmada**               |
| `public.internal_job_secrets` |                      1 secreto | denegado por RLS a clientes          | texto en tabla empresarial | privada, pero no custodia canónica      |
| `vault.secrets`               |                              0 | sin acceso cliente                   | Vault                      | instalada y no adoptada                 |
| `cron.job.command`            | 7 comandos; 1 con credenciales | no expuesto por Data API             | texto de catálogo          | **credencial literal confirmada**       |
| Edge Function secrets         |          valores no enumerados | inyectados al runtime                | servicio administrado      | requiere inventario y rotación externos |
| GitHub Actions secrets        |          valores no enumerados | runtime de workflow                  | GitHub                     | requiere reconciliación por consumidor  |

El valor de `shift_notify_internal_secret` en `app_config` y los literales de `document-alerts-daily` deberán considerarse comprometidos hasta completar rotación y prueba de rechazo del valor anterior.

#### 9. Privilegios críticos de schemas técnicos

##### 9.1 `net`

- `anon` y `authenticated` tienen `USAGE` en schema `net`;
- ambos poseen `SELECT`, `INSERT`, `UPDATE` y `DELETE` sobre `net.http_request_queue` y `net._http_response`;
- las tablas no tienen RLS;
- había cero requests pendientes y 72 respuestas retenidas: 65 con respuesta útil y siete con error de transporte;
- `net` no pertenece a la lista Data API expuesta congelada en `SUPA-AUD-003`.

La ausencia de exposición REST reduce el vector actual, pero no elimina la capacidad otorgada a los roles DB ni protege contra una futura ampliación de schemas. Se clasifica como privilegio crítico latente y drift-sensitive.

##### 9.2 `extensions.pg_stat_statements`

- `anon` y `authenticated` tienen `USAGE` en `extensions` y `SELECT` sobre la vista;
- se observaron 4858 filas, 4644 con texto SQL;
- 146 textos coincidieron con términos sensibles y siete con patrón de correo; estas coincidencias pueden incluir SQL administrativo o de auditoría y no prueban por sí solas que exista un secreto real;
- no se reprodujo ninguna consulta;
- `extensions` no pertenece a la lista Data API expuesta vigente.

El control requerido es revocar acceso cliente no justificado y evitar que SQL, PII o credenciales aparezcan como literales en consultas.

#### 10. Variables de Edge Functions

La inspección de bundles mostró grupos representativos:

| Función                     | Variables referenciadas | Variables sensibles o de credencial                                                                   |
| --------------------------- | ----------------------: | ----------------------------------------------------------------------------------------------------- |
| `account-deletion`          |                       3 | `SUPABASE_ANON_KEY`, `SUPABASE_SERVICE_ROLE_KEY`                                                      |
| `attendance-report`         |                       3 | `SUPABASE_SERVICE_ROLE_KEY`                                                                           |
| `document-alerts`           |                       4 | `DOCUMENT_ALERTS_CRON_SECRET`, `SUPABASE_SERVICE_ROLE_KEY`                                            |
| `order-message-notify`      |                       3 | `SUPABASE_SERVICE_ROLE_KEY`, `INTERNAL_NOTIFY_SECRET`                                                 |
| `pass-address-search`       |                       4 | `GOOGLE_MAPS_SERVER_API_KEY`, `GOOGLE_MAPS_API_KEY`, `SUPABASE_ANON_KEY`                              |
| `pass-delivery-quote`       |                       5 | `GOOGLE_MAPS_SERVER_API_KEY`, `GOOGLE_MAPS_API_KEY`, `SUPABASE_ANON_KEY`, `SUPABASE_SERVICE_ROLE_KEY` |
| `payments-create-intent`    |                       9 | `SUPABASE_ANON_KEY`, `SUPABASE_SERVICE_ROLE_KEY`, `WOMPI_PUBLIC_KEY`, `WOMPI_INTEGRITY_SECRET`        |
| `payments-webhook`          |                       4 | `SUPABASE_SERVICE_ROLE_KEY`, `WOMPI_EVENTS_SECRET`, `WOMPI_WEBHOOK_SECRET`                            |
| `process-account-deletions` |                       3 | `SUPABASE_SERVICE_ROLE_KEY`, `ACCOUNT_DELETION_WORKER_SECRET`                                         |
| `request-account-deletion`  |                       2 | `SUPABASE_SERVICE_ROLE_KEY`                                                                           |
| `shift-runtime-processor`   |                       5 | `SUPABASE_SERVICE_ROLE_KEY`, `SHIFT_RUNTIME_CRON_SECRET`                                              |
| `staff-invitations-create`  |                       8 | `SUPABASE_SERVICE_ROLE_KEY`, `RESEND_API_KEY`                                                         |
| `support-message-notify`    |                       4 | `SUPABASE_SERVICE_ROLE_KEY`, `INTERNAL_NOTIFY_SECRET`                                                 |
| `wallet-pass`               |                       5 | `GOOGLE_WALLET_SERVICE_ACCOUNT_JSON`, `SUPABASE_ANON_KEY`                                             |

Patrones detectados:

1. aliases de la misma semántica: `SUPABASE_URL` frente a `EXPO_PUBLIC_SUPABASE_URL`, `WOMPI_EVENTS_SECRET` frente a `WOMPI_WEBHOOK_SECRET`, `GOOGLE_MAPS_SERVER_API_KEY` frente a `GOOGLE_MAPS_API_KEY`;
2. múltiples redirects alternativos en invitaciones;
3. defaults de proveedor o URLs cuando falta configuración;
4. funciones fail-open si el secreto esperado está vacío;
5. service account completa de Google Wallet en una variable JSON;
6. ausencia de manifiesto común que declare obligatoriedad, tipo, ambiente, owner y rotación.

#### 11. Configuración PostgreSQL observada

| Área                  | Valor observado                                                                      |
| --------------------- | ------------------------------------------------------------------------------------ |
| Servidor              | PostgreSQL 17.6; proyecto `vento-os-dev`; región `us-east-2`                         |
| Conexiones            | `max_connections=60`; reservadas `3`                                                 |
| Cifrado de contraseña | `scram-sha-256`                                                                      |
| TLS                   | habilitado; mínimo `TLSv1.2`                                                         |
| RLS global            | `row_security=on`                                                                    |
| Statement timeout     | global `120 s`; `anon 3 s`; `authenticated 8 s`                                      |
| Locks y sesiones      | lock global `0`; idle transaction `0`; idle session `0`                              |
| WAL                   | `logical`; cinco slots; cinco senders                                                |
| Logging               | `log_statement=ddl`; slow query desactivado; conexiones y desconexiones desactivadas |
| Auditoría             | `pgaudit.log=none`; extensión `pgaudit` no instalada                                 |
| Cron                  | base `postgres`; log de runs y statements habilitado                                 |
| JWT                   | expiración observada `3600 s`; secreto no extraído                                   |

Controles positivos:

- TLS habilitado con mínimo TLS 1.2;
- contraseñas PostgreSQL con SCRAM-SHA-256;
- `row_security=on`;
- statement timeouts finitos y más restrictivos para roles cliente;
- WAL lógico y capacidad de replicación coherentes con Realtime;
- cero settings inspeccionados con `pending_restart`.

Brechas de gobierno:

- no existe baseline aprobado que justifique límites de conexiones, workers y timeouts por ambiente;
- `lock_timeout`, `idle_in_transaction_session_timeout` e `idle_session_timeout` globales permanecen ilimitados;
- slow-query logging, connection logging y `pgaudit` están desactivados;
- `track_io_timing` está apagado, por lo que la decisión de observabilidad y costo debe quedar explícita, no asumirse como defecto automático.

#### 12. Configuración Auth y advisor

El advisor remoto confirmó `Leaked Password Protection Disabled`. Esta auditoría no cambió Auth ni intentó contraseñas. El control deberá habilitarse o quedar excepcionalmente diferido con riesgo, responsable, fecha y prueba de rechazo de contraseñas comprometidas.

Otros hallazgos del advisor sobre RLS, vistas `SECURITY DEFINER` y RPC expuestas ya tienen propietarios en `SUPA-AUD-009`, `SUPA-AUD-016`, `SUPA-AUD-017` y arquitectura de exposición; no se duplican como hallazgos nuevos de esta tarea.

#### 13. Runtime settings y feature flags

`public.app_runtime_settings` contiene seis flags:

- `anima.notifications.enabled`;
- `pass.checkout.enabled`;
- `pass.loyalty.enabled`;
- `pass.orders.enabled`;
- `pass.profile.enabled`;
- `pulso.billing.enabled`.

No se detectaron nombres sensibles. RLS está habilitado; `authenticated` puede leer y la política de actualización exige `has_platform_permission('platform.settings.manage')`. Sin embargo, la tabla concede privilegios SQL amplios al rol y no demuestra por sí sola historial inmutable, aprobación, motivo, vigencia, rollback ni propagación segura. Se asigna a `TREQ-SUPABASE-240`.

#### 14. Configuración local frente al remoto

`supabase/config.toml` es configuración local de CLI, no evidencia automática del remoto. El corte muestra:

| Objeto                    | `config.toml`              | Remoto                                                              |
| ------------------------- | -------------------------- | ------------------------------------------------------------------- |
| `club-revenuecat-webhook` | entrada `verify_jwt=false` | no desplegada                                                       |
| `payments-return`         | sin entrada explícita      | activa con `verify_jwt=false`                                       |
| `delivery-portal`         | sin entrada explícita      | activa con `verify_jwt=false`                                       |
| schemas API local         | `public`, `graphql_public` | remoto posee una lista más amplia ya inventariada en `SUPA-AUD-003` |
| Auth local                | defaults de desarrollo     | remoto solo parcialmente observable mediante settings y advisor     |

Esta tarea registra el drift; `SUPA-AUD-016` y `SUPA-AUD-017` deberán reconciliarlo objeto por objeto y distinguir diferencia legítima de cambio manual.

#### 15. Procedencia de código y supply chain

Se observaron:

- copias de Edge Functions en `vento-shell` y repositorios de aplicaciones;
- funciones presentes en código que no están desplegadas en el remoto;
- entrypoints remotos que contienen rutas temporales o absolutas de equipos;
- imports desde Deno std, JSR, npm y esm.sh con políticas heterogéneas;
- una sola función con import map declarado;
- `.env*` y `*.pem` correctamente ignorados en `vento-shell`;
- ninguna coincidencia en la búsqueda específica de variables públicas con nombre de service role, sin que esto pruebe ausencia total de secretos comprometidos.

La fuente de verdad de cada bundle deberá convertirse en un manifiesto verificable de commit, ruta, dependencias, bundle SHA, configuración y rollback.

#### 16. Hallazgos funcionales dependientes de configuración

##### 16.1 Eliminación de cuentas

- `request-account-deletion` acepta un correo del payload y opera con service role sin exigir que sea el correo del usuario autenticado;
- `account-deletion` confía en `otp_verified` y `phrase_verified` aportados por el cliente;
- `process-account-deletions` implementa un worker diferido;
- los tres caminos representan políticas y estados distintos.

La resolución deberá unificar identidad, reautenticación server-side, plazo, cancelación, claim, anonimización, Auth, Storage, retries y auditoría.

##### 16.2 Observabilidad de ubicación

`pass-delivery-quote` imprime coordenadas precisas de origen y destino. Aunque la función necesita ubicación para cotizar, la persistencia en logs no es necesaria por defecto y requiere redacción, precisión reducida o correlación no reversible.

##### 16.3 Credencial de ejemplo en bundle

El bundle remoto de `wallet-pass` conserva un JWT demostrativo en un comentario. No se afirma que pertenezca al proyecto vigente, pero ningún token con forma válida debe formar parte de código desplegable.

#### 17. Evidencia positiva observada

- las ocho extensiones instaladas coinciden con su versión default disponible;
- Vault niega acceso a roles cliente;
- `internal_job_secrets` aplica política denegatoria a `anon` y `authenticated`;
- `app_runtime_settings` no contiene nombres de secreto;
- `.gitignore` excluye `.env*` y PEM;
- Wompi valida coherencia parcial entre key y ambiente en `payments-create-intent`;
- `payments-webhook` falla cerrado cuando no existe secreto de eventos;
- `net` y `extensions` no están actualmente en la lista Data API expuesta;
- los valores sensibles nunca se copiaron a este documento.

Estos controles reducen riesgo, pero no sustituyen inventario, mínimo privilegio, rotación, drift ni pruebas de ambiente.

#### 18. Brechas y resolución obligatoria

| Brecha               | Hallazgo                                                                                                                        | Riesgo                                                                                                | Requisitos                                                    |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ------------------------------------------------------------- |
| `B-SUPA-AUD-015-001` | Una clave secreta reside en `public.app_config` y la tabla permite lectura a `anon` y `authenticated`.                          | Exposición directa de credencial interna.                                                             | `TREQ-SUPABASE-217`; `TREQ-SUPABASE-218`; `TREQ-SUPABASE-220` |
| `B-SUPA-AUD-015-002` | `anon` y `authenticated` tienen USAGE y DML amplio sobre las tablas `net`, sin RLS.                                             | Emisión HTTP arbitraria, lectura de respuestas o activación futura por drift de Data API.             | `TREQ-SUPABASE-214`; `TREQ-SUPABASE-215`                      |
| `B-SUPA-AUD-015-003` | `anon` y `authenticated` pueden consultar `extensions.pg_stat_statements`.                                                      | Exposición de SQL, identificadores o literales sensibles mediante sesión directa o exposición futura. | `TREQ-SUPABASE-214`; `TREQ-SUPABASE-216`                      |
| `B-SUPA-AUD-015-004` | Un cron conserva bearer y clave personalizada como literales en `cron.job.command`.                                             | Credencial persistida en catálogo y respaldos.                                                        | `TREQ-SUPABASE-218`; `TREQ-SUPABASE-220`                      |
| `B-SUPA-AUD-015-005` | `internal_job_secrets` almacena un secreto en texto mientras Vault está vacío.                                                  | Custodia fragmentada, sin cifrado de aplicación ni rotación uniforme.                                 | `TREQ-SUPABASE-217`; `TREQ-SUPABASE-219`                      |
| `B-SUPA-AUD-015-006` | No existe registro canónico de secretos con propietario, consumidor, ambiente, fecha y rotación.                                | Secretos huérfanos, duplicados o imposibles de revocar coordinadamente.                               | `TREQ-SUPABASE-217`; `TREQ-SUPABASE-222`; `TREQ-SUPABASE-227` |
| `B-SUPA-AUD-015-007` | Coexisten clave `anon` legacy y clave publishable moderna.                                                                      | Migración incompleta y consumidores atados a credenciales heredadas.                                  | `TREQ-SUPABASE-221`                                           |
| `B-SUPA-AUD-015-008` | El conector no expone inventario de secret keys privadas ni sus rotaciones.                                                     | No se puede certificar número, edad, alcance o revocación de claves privilegiadas.                    | `TREQ-SUPABASE-222`                                           |
| `B-SUPA-AUD-015-009` | Las 24 funciones no tienen manifiesto versionado común de variables obligatorias y opcionales.                                  | Despliegue parcialmente configurado o comportamiento divergente por ambiente.                         | `TREQ-SUPABASE-223`                                           |
| `B-SUPA-AUD-015-010` | Varias funciones admiten aliases, defaults y rutas fail-open cuando falta un secreto.                                           | La ausencia o divergencia de configuración no bloquea de forma uniforme.                              | `TREQ-SUPABASE-224`; `TREQ-SUPABASE-225`                      |
| `B-SUPA-AUD-015-011` | Credenciales de Google, Maps, Resend, Wompi, Expo y workers carecen de matriz transversal de propiedad y rotación.              | Privilegio excesivo o recuperación incompleta ante compromiso.                                        | `TREQ-SUPABASE-226`; `TREQ-SUPABASE-227`                      |
| `B-SUPA-AUD-015-012` | `wallet-pass` depende de un JSON completo de service account en una sola variable.                                              | Clave privada extensa, difícil de rotar y validar por campos mínimos.                                 | `TREQ-SUPABASE-219`; `TREQ-SUPABASE-227`                      |
| `B-SUPA-AUD-015-013` | Un bundle desplegado conserva un JWT demostrativo dentro de un comentario.                                                      | Normalización de credenciales de ejemplo y riesgo de reutilización accidental.                        | `TREQ-SUPABASE-241`                                           |
| `B-SUPA-AUD-015-014` | `pass-delivery-quote` registra coordenadas precisas en logs.                                                                    | Exposición de ubicación personal u operativa en observabilidad.                                       | `TREQ-SUPABASE-230`                                           |
| `B-SUPA-AUD-015-015` | `request-account-deletion` no vincula el correo solicitado con la identidad autenticada.                                        | Solicitud de borrado sobre otra cuenta.                                                               | `TREQ-SUPABASE-233`                                           |
| `B-SUPA-AUD-015-016` | `account-deletion` confía en booleanos de verificación aportados por el cliente.                                                | Eliminación o anonimización sin prueba server-side de reautenticación.                                | `TREQ-SUPABASE-234`                                           |
| `B-SUPA-AUD-015-017` | Coexisten tres rutas de eliminación con semánticas inmediata, diferida y worker.                                                | Estados competidores, doble procesamiento y política de privacidad incoherente.                       | `TREQ-SUPABASE-235`                                           |
| `B-SUPA-AUD-015-018` | No existe clasificación CORS por consumidor y función; se observan allowlists abiertas repetidas.                               | Invocación cross-origin no gobernada y configuración duplicada.                                       | `TREQ-SUPABASE-228`                                           |
| `B-SUPA-AUD-015-019` | Versiones de Deno, JSR, npm y ESM no siguen una política única; solo una función usa import map.                                | Build no reproducible y actualización desigual de dependencias.                                       | `TREQ-SUPABASE-229`                                           |
| `B-SUPA-AUD-015-020` | `config.toml` y el remoto difieren en funciones con `verify_jwt=false`.                                                         | Configuración local que no reproduce el gateway desplegado.                                           | `TREQ-SUPABASE-236`                                           |
| `B-SUPA-AUD-015-021` | Hay copias de funciones en varios repositorios y fuentes adicionales no desplegadas.                                            | Fuente canónica, commit y rollback ambiguos.                                                          | `TREQ-SUPABASE-237`                                           |
| `B-SUPA-AUD-015-022` | `unaccent` está instalado en `public` y `uuid-ossp` no mostró referencias empresariales.                                        | Contaminación de namespace y extensiones sin decisión de ciclo de vida.                               | `TREQ-SUPABASE-212`; `TREQ-SUPABASE-213`                      |
| `B-SUPA-AUD-015-023` | `pgaudit.log=none`, no hay umbral de slow query y el logging de conexiones está desactivado.                                    | Investigación y detección insuficientes ante abuso o degradación.                                     | `TREQ-SUPABASE-231`                                           |
| `B-SUPA-AUD-015-024` | Timeouts de sesión, transacción inactiva y lock no tienen baseline empresarial aprobado.                                        | Bloqueos o sesiones abandonadas sin política verificable.                                             | `TREQ-SUPABASE-232`                                           |
| `B-SUPA-AUD-015-025` | El advisor remoto indica protección contra contraseñas filtradas deshabilitada.                                                 | Aceptación de credenciales conocidas como comprometidas.                                              | `TREQ-SUPABASE-238`                                           |
| `B-SUPA-AUD-015-026` | La consulta de branches no pudo certificarse y no existe inventario probado local, staging y producción.                        | Cambios o secretos mezclados entre ambientes.                                                         | `TREQ-SUPABASE-239`                                           |
| `B-SUPA-AUD-015-027` | `app_runtime_settings` permite cambios a usuarios con permiso, pero no demuestra versionado, aprobación ni auditoría inmutable. | Feature flags alteradas sin historial suficiente o rollback.                                          | `TREQ-SUPABASE-240`                                           |
| `B-SUPA-AUD-015-028` | No existe validador automático conjunto para extensiones, claves, secretos, variables y configuración.                          | Drift silencioso y reintroducción de exposición.                                                      | `TREQ-SUPABASE-242`                                           |

No queda hallazgo narrativo sin requisito y tarea responsable.

#### 19. Requisitos de prueba incorporados

Se incorporan 31 filas canónicas en el registro 04A:

- `TREQ-SUPABASE-212` — Todo proyecto deberá mantener un inventario versionado de extensiones instaladas con versión, esquema, propietario, disponibilidad de actualización, dependencias, consumidores, grants y decisión conservar, mover o retirar.
- `TREQ-SUPABASE-213` — Cada extensión deberá tener esquema aprobado, política de actualización, prueba de compatibilidad, rollback y evidencia de uso
- `TREQ-SUPABASE-214` — Los objetos creados por extensiones deberán aplicar mínimo privilegio a PUBLIC, anon, authenticated y service_role
- `TREQ-SUPABASE-215` — Los roles anon y authenticated no podrán leer ni mutar net.http_request_queue ni net._http_response, ni invocar HTTP por pg_net, salvo contrato explícito, aislado y probado
- `TREQ-SUPABASE-216` — Las estadísticas SQL solo serán accesibles a roles administrativos aprobados
- `TREQ-SUPABASE-217` — Deberá existir un registro canónico de secretos con identificador no sensible, propietario, finalidad, proveedor, consumidores, ambientes, ubicación de custodia, fecha de creación, última rotación, próxima rotación, alcance y procedimiento de revocación.
- `TREQ-SUPABASE-218` — Ningún secreto, bearer, service-role key, private key o token operativo podrá persistirse en tablas legibles por cliente, cron.job.command, migraciones, código, comentarios, logs, fixtures o artefactos
- `TREQ-SUPABASE-219` — Los secretos server-side deberán residir en una custodia aprobada y cifrada, separada de tablas empresariales
- `TREQ-SUPABASE-220` — Toda credencial expuesta, duplicada o almacenada fuera de custodia aprobada deberá rotarse coordinadamente, invalidarse en el origen, actualizar consumidores, probar rechazo del valor anterior y conservar evidencia sin revelar el nuevo valor.
- `TREQ-SUPABASE-221` — Los consumidores deberán migrar de claves legacy anon y service_role JWT a publishable y secret keys modernas según su superficie
- `TREQ-SUPABASE-222` — El inventario de API keys privadas deberá registrar tipo, estado, ambiente, consumidores, fecha, última rotación y revocación sin almacenar el valor
- `TREQ-SUPABASE-223` — Cada Edge Function deberá declarar un manifiesto versionado de variables obligatorias, opcionales, sensibles y públicas, tipo, formato, consumidor, ambiente, default permitido, validación de arranque y propietario.
- `TREQ-SUPABASE-224` — Toda función deberá fallar cerrada cuando falte una credencial, URL, audience, issuer, ambiente o configuración crítica
- `TREQ-SUPABASE-225` — Cada dato de configuración tendrá un único nombre canónico
- `TREQ-SUPABASE-226` — La configuración deberá declarar y validar proyecto, ambiente, proveedor, endpoint, redirect, issuer, audience y modo test o producción como una combinación coherente
- `TREQ-SUPABASE-227` — Cada credencial de tercero deberá aplicar mínimo privilegio, restricción por API, dominio, IP o aplicación cuando el proveedor lo permita, cuota, propietario, rotación, revocación, datos autorizados y prueba de ambiente.
- `TREQ-SUPABASE-228` — Cada endpoint HTTP deberá declarar consumidores y política CORS
- `TREQ-SUPABASE-229` — Los runtimes, paquetes y fuentes de importación de Edge Functions deberán fijarse mediante versiones o lockfile aprobado, import map canónico, política de actualización, SBOM, prueba de build y rollback reproducible.
- `TREQ-SUPABASE-230` — Logs, métricas y trazas deberán redactar claves, headers, payloads, SQL sensible, coordenadas precisas, correos y PII
- `TREQ-SUPABASE-231` — La configuración PostgreSQL deberá definir auditoría y observabilidad aprobadas para DDL, accesos privilegiados, consultas lentas, conexiones y cambios de configuración, con alertas, retención y costo medido.
- `TREQ-SUPABASE-232` — Timeouts de statement, lock, sesión e idle in transaction deberán tener valores por rol y ambiente, justificación, prueba de carga y alerta
- `TREQ-SUPABASE-233` — Una solicitud de eliminación de cuenta deberá derivar la identidad y correo exclusivamente de la sesión validada
- `TREQ-SUPABASE-234` — La eliminación o anonimización de cuenta deberá exigir prueba server-side fresca de reautenticación, OTP o mecanismo aprobado
- `TREQ-SUPABASE-235` — Deberá existir un único proceso canónico de eliminación con estados, plazo, cancelación, identidad, reautenticación, claim, retry, anonimización, borrado Auth, Storage, auditoría y conciliación
- `TREQ-SUPABASE-236` — CI deberá reconciliar config.toml, metadatos remotos y manifiesto de funciones para nombre, verify_jwt, entrypoint, import map, variables, bundle SHA y estado
- `TREQ-SUPABASE-237` — Cada Edge Function tendrá un repositorio y ruta canónicos, commit de origen, proceso de build, bundle SHA, configuración, actor de despliegue y rollback
- `TREQ-SUPABASE-238` — Supabase Auth deberá habilitar protección contra contraseñas filtradas o documentar excepción temporal con riesgo, fecha de cierre y prueba
- `TREQ-SUPABASE-239` — Los ambientes local, pruebas, staging y producción deberán tener proyectos, branches, claves, secretos, redirects, proveedores, datos y permisos separados
- `TREQ-SUPABASE-240` — Los runtime settings y feature flags deberán tener catálogo tipado, propietario, autorización server-side, razón, actor, versión, vigencia, historial inmutable, rollback y notificación
- `TREQ-SUPABASE-241` — Código, comentarios, documentación desplegable, ejemplos y fixtures no podrán contener JWT, claves, tokens o credenciales con forma válida
- `TREQ-SUPABASE-242` — El validador integral deberá comprobar ocho extensiones instaladas sin upgrade pendiente, nueve relevantes no instaladas, unaccent en public, cero secretos Vault, dos claves públicas activas, 24 funciones con distribución 12 y 12 de verify_jwt, seis runtime flags, privilegios net y pg_stat_statements, configuración PostgreSQL aprobada, ausencia de secretos literales y todas las huellas SUPA-AUD-015.

El detalle completo de las catorce columnas reside únicamente en el archivo 04A regenerado.

#### 20. Huellas de integridad de la evidencia

| Conjunto                    | SHA-256                                                            |
| --------------------------- | ------------------------------------------------------------------ |
| `extension_inventory`       | `fb10265743f57cff487756fdc024cf1e45be33093af365c4a76444fa4502d4b0` |
| `database_settings`         | `0cf74785d8d3b46e9a5d464cb15ec373bc8867a35836aced2bef775d1cf8852a` |
| `secret_custody`            | `12c8cadc40230ae42b331fd157b15a1370aa12d15267f7b12d54c49f621caf11` |
| `privilege_surface`         | `0a67be8f3f05c3f0ae84491ee6fb7e3cb89cc770d96446b671f8ac08d72929af` |
| `edge_environment_manifest` | `fe59183ff7d1e3f782bc8badbb6a49f836d9e7beb46ab42ad2f4a0d9e7f0ee8a` |
| `configuration_drift`       | `13daa5d06f97ffee4dee9121f75cce1f8691bb1c2a127ed9df528a96b5a3cec8` |
| `breach_register`           | `08d1319c964b3d4413c102a52b37b17660f5c6a2e2e8d5b30653caad38f749f2` |

Las huellas se calculan sobre JSON canónico redactado, con claves ordenadas, UTF-8 y sin valores secretos.

#### 21. Criterios de aceptación de `SUPA-AUD-015`

La tarea queda aceptada porque:

1. preserva la línea base exacta aprobada de `SUPA-AUD-014` y 04A;
2. inventaría las ocho extensiones instaladas y las nueve relevantes no instaladas;
3. diferencia ubicación, uso observado, versión y ACL;
4. registra claves públicas sin revelar valores;
5. clasifica custodia de secretos sin leerlos ni reproducirlos;
6. prueba los privilegios críticos de `net` y `pg_stat_statements`;
7. inventaría settings PostgreSQL y configuración de Auth observable;
8. identifica variables y aliases de Edge Functions;
9. compara configuración local y metadatos remotos sin anticipar el cierre de drift;
10. formaliza 28 brechas en 31 requisitos;
11. no ejecuta ninguna mutación ni prueba activa contra proveedores;
12. deja como siguiente tarea exacta `SUPA-AUD-016`.

#### 22. Límites de la auditoría

No pudo certificarse mediante las herramientas disponibles:

- inventario y edad de secret keys privadas;
- valores ni fechas de rotación de Edge Function secrets o GitHub Actions secrets;
- branches de Supabase, porque la acción de listado no pudo resolver permisos del project ref;
- configuración completa de Auth, SMTP, redirects y rate limits administrados;
- exposición REST mediante invocación pública directa, por lo que se reutilizó la línea base aprobada de `SUPA-AUD-003`;
- ausencia global de secretos en todos los commits históricos;
- necesidad empresarial definitiva de retirar `uuid-ossp` o mover `unaccent`.

Cada límite tiene requisito de cierre en `TREQ-SUPABASE-212` a `TREQ-SUPABASE-242`; no se interpreta ausencia de evidencia como configuración segura.

#### 23. Declaración de no mutación

No se ejecutaron:

- `CREATE`, `ALTER`, `DROP`, `GRANT`, `REVOKE`, DML ni migraciones;
- rotación, revelado, descarga o modificación de claves y secretos;
- cambios de Auth, API, Storage, Realtime, PostgreSQL o Edge Functions;
- invocaciones de prueba a funciones, webhooks o proveedores;
- cambios de repositorio, commits, branches o workflows.

#### 24. Cierre

`SUPA-AUD-015` queda **APROBADA** como línea base documental de extensiones, secretos, variables y configuración. No autoriza hardening, retiro de extensiones, migración de keys, rotación, cambio de Auth, modificación de ACL ni despliegue. Las decisiones objetivo pertenecen a `SUPA-ARC-001`, `SUPA-ARC-003`, `SUPA-ARC-005`, `SUPA-ARC-006`, `SUPA-ARC-007`, `SUPA-ARC-008`, `SUPA-ARC-010`, `SUPA-ARC-011`, `SUPA-ARC-015`, `SUPA-ARC-020`, `SUPA-ARC-021`, `SUPA-ARC-022` y `SUPA-ARC-024`; la implementación deberá pasar por `SUPA-TRANS-*` y paquetes E5.

La siguiente tarea canónica es:

```text
SUPA-AUD-016 — Comparar Supabase remoto con migraciones y configuración de vento-shell
```


### ✅ SUPA-AUD-016 — Comparar Supabase remoto con migraciones y configuración de `vento-shell`

**Estado:** APROBADA
**Fecha de preparación documental:** 2026-07-29
**Bloque propietario:** BLOQUE E3 — Arquitectura canónica de datos y gobierno integral de Supabase
**Marcador exacto que reemplaza:** `### [ ] SUPA-AUD-016 — Comparar Supabase remoto con migraciones y configuración de vento-shell`
**Tarea anterior:** `SUPA-AUD-015 — Auditar extensiones, secretos, variables y configuración del proyecto` — APROBADA
**Siguiente tarea:** `SUPA-AUD-017 — Detectar drift, cambios manuales y objetos sin migración`
**Proyecto observado:** `vento-os-dev` — `clzdpinthhtknkmefsxx`
**Repositorio canónico declarado:** `devVentoGroup/vento-shell` — rama `main` — commit `d7515ec3a4b1229fcd36c1461467f8e3316a85df`
**Tipo de tarea:** auditoría documental y técnica read-only de historia de migraciones, catálogo remoto, configuración local, recursos administrados y Edge Functions; sin ejecutar `db push`, `db pull`, `db diff`, replay, repair, DDL, DML, despliegues ni cambios remotos

#### 1. Objetivo

Determinar qué parte del estado remoto puede atribuirse de forma verificable a `vento-shell`, qué diferencias ya están confirmadas y qué paridad permanece no certificable hasta ejecutar replay y validadores automatizados:

```text
ARCHIVOS VERSIONADOS EN VENTO-SHELL
        +
HISTORIA REMOTA DE MIGRACIONES
        +
CATÁLOGO POSTGRESQL Y RECURSOS ADMINISTRADOS
        +
CONFIG.TOML Y EDGE FUNCTIONS
        ↓
PARIDAD POR VERSIÓN, CONTENIDO, CONFIGURACIÓN Y PROCEDENCIA
```

Coincidir en timestamp no demuestra igualdad de SQL. Coincidir en estructura PostgreSQL tampoco demuestra paridad de publicaciones, buckets, cron, secretos, Auth o bundles Edge.

#### 2. Regla canónica derivada

```text
Ningún estado remoto se considerará reproducible por existir en schema_migrations. La paridad exige archivo local, versión válida, contenido inmutable, procedencia, replay limpio, fingerprint estructural, configuración por ambiente y registros complementarios para recursos que el diff no cubre completamente.
```

#### 3. Alcance y método

Se inspeccionaron sin mutación:

- las 549 filas de `supabase_migrations.schema_migrations`, incluyendo nombre, conteo de statements, actor y metadatos disponibles;
- hashes server-side del SQL almacenado, sin copiar secretos ni comandos sensibles al artefacto;
- archivos puntuales de `vento-shell` para confirmar la entrada vacía, duplicados exactos, versiones inválidas y última migración;
- `README.md`, la guía de migraciones centralizadas, `package.json` y `supabase/config.toml`;
- las 24 Edge Functions activas, `verify_jwt`, versión, entrypoint y bundle SHA;
- catálogo remoto de relaciones, columnas, constraints, índices, funciones, triggers, políticas, publicaciones, buckets, extensiones y cron;
- documentación oficial de Supabase sobre `migration list`, `db diff`, configuración local, buckets y Edge Functions.

No se ejecutó el replay de las migraciones ni un `db diff --linked`. Por tanto, esta tarea no declara que los 549 archivos locales existan o que reconstruyan exactamente el remoto; formaliza la evidencia comprobada y el gate que deberá certificarlo.

#### 4. Fuentes congeladas

| Fuente                         | Corte                                                                                  | Responsabilidad                                |
| ------------------------------ | -------------------------------------------------------------------------------------- | ---------------------------------------------- |
| `SUPA-AUD-015.md` aprobado     | SHA-256 `f28c712163ed7d02d2d12265f5e8df223084a19b0638210b29f4f045e7a8fdaf`             | continuidad documental                         |
| 04A aprobado                   | SHA-256 `5724d6b016b0eb41d88b3da8f83cfb78006ad66afae40eda30e21a522190cba5`; 4537 filas | requisitos hasta `TREQ-SUPABASE-242`           |
| Supabase `vento-os-dev`        | 2026-07-29                                                                             | historia, catálogo y recursos administrados    |
| `vento-shell` rama `main`      | commit `d7515ec3a4b1229fcd36c1461467f8e3316a85df`                                      | archivos y configuración declarados            |
| `supabase/config.toml`         | blob `cc013305bf617ba469cde361bc57d035b423847f`                                        | configuración local y reglas Edge declaradas   |
| `package.json`                 | blob `e4678a38f43183b8218e7598f1c9a48f392b159e`                                        | scripts y versiones de toolchain               |
| Documentación oficial Supabase | consultada 2026-07-29                                                                  | semántica de migraciones, diff y configuración |

#### 5. Resultado ejecutivo

| Métrica                                                |                      Resultado |
| ------------------------------------------------------ | -----------------------------: |
| Migraciones remotas                                    |                        **549** |
| Versiones remotas únicas                               |                        **549** |
| Nombres únicos                                         |                        **533** |
| Nombres reutilizados                                   |                         **16** |
| Migraciones remotas sin statements                     |                          **1** |
| Pares de payload SQL idéntico bajo versiones distintas |                          **2** |
| Versiones con timestamp no válido                      | **3** más baseline intencional |
| Filas con rollback                                     |                          **0** |
| Filas con idempotency key                              |                          **0** |
| Filas con actor `created_by`                           |                         **85** |
| Filas sin actor                                        |                        **464** |
| Última versión remota                                  |               `20260716170000` |
| Edge Functions remotas activas                         |                         **24** |
| Distribución remota `verify_jwt`                       |         **12 true / 12 false** |
| Entradas `verify_jwt=false` en config                  |                         **11** |
| Buckets remotos                                        |                         **14** |
| Publicaciones remotas                                  |                          **2** |
| Cron jobs activos                                      |                          **7** |
| Brechas formalizadas                                   |                         **28** |
| Requisitos nuevos                                      |                         **30** |

#### 6. Historia de migraciones

##### 6.1 Integridad básica

La historia remota contiene 549 versiones distintas entre `00000000000000` y `20260716170000`. La última migración remota tiene archivo correspondiente en `vento-shell`:

```text
supabase/migrations/20260716170000_add_route_snapshot_to_restock_item_fulfillments.sql
```

Esto es evidencia positiva puntual, no certificación de que las otras 548 versiones estén presentes y sean idénticas.

##### 6.2 Entrada vacía confirmada

La versión `20260707173357_employees_document_identity` tiene cero statements en remoto. El archivo Git correspondiente existe y está vacío. La versión inmediata `20260707173408` reutiliza el mismo nombre y contiene la implementación real de siete statements.

Dictamen: la fila vacía no produjo esquema, pero contamina el historial y demuestra que el control actual permite archivos sin contenido.

##### 6.3 Duplicados exactos

Se verificaron dos pares con mismo nombre, mismo blob Git y mismo hash SQL remoto:

| Nombre                                        | Versiones                          | Dictamen         |
| --------------------------------------------- | ---------------------------------- | ---------------- |
| `human_permission_catalog_configured_flag_v2` | `20260709134106`, `20260709143932` | duplicado exacto |
| `shared_operational_devices_base`             | `20260709145349`, `20260709160904` | duplicado exacto |

Otros catorce nombres también se repiten, pero con payload distinto; requieren clasificación como corrección, reimportación, reconciliación o colisión semántica.

##### 6.4 Versiones no temporales

Tres archivos y filas remotas usan catorce dígitos, pero no representan una hora válida:

- `20260531265000_product_master_review_requests`;
- `20260602555555_add_product_site_production_routes`;
- `20260602600000_update_fogo_real_production_batch_routes`.

El orden lexicográfico funciona, pero la columna de tiempo y las herramientas que interpretan UTC quedan semánticamente rotas.

##### 6.5 Procedencia y reversibilidad

- 85 filas registran `created_by`; 464 no;
- ninguna fila registra `idempotency_key`;
- ninguna fila conserva arreglo `rollback`;
- existen dos snapshots `remote_schema` con 1156 y 2412 statements;
- existen 10 nombres `preview`, tres `from_dev`, nueve `reconcile`, cuatro `manual` y dos nombres con punto.

No se concluye automáticamente que las filas sin actor sean manuales. Sí se concluye que la historia no permite reconstruir de manera uniforme quién, cómo y desde qué commit aplicó cada cambio.

#### 7. Fuente canónica declarada y artefactos ausentes

`README.md` y `docs/ARQUITECTURA-MIGRACIONES-CENTRALIZADAS.md` declaran que `vento-shell/supabase/migrations` es la fuente canónica. Ambos referencian `supabase/MIGRATION_MANIFEST.md`, pero el archivo no existe en `main`. La guía también referencia `supabase/schema.sql`, igualmente ausente.

Consecuencias:

1. no hay inventario legible y validable de versiones, hashes y estado remoto;
2. la documentación de aplicación y troubleshooting apunta a artefactos inexistentes;
3. la comparación exacta depende hoy de recorrer archivos y consultar el remoto de forma ad hoc;
4. no existe snapshot estructural canónico complementario para revisión humana.

#### 8. Configuración local frente al remoto

##### 8.1 Controles compatibles

| Control          | Local       | Remoto                | Resultado                  |
| ---------------- | ----------- | --------------------- | -------------------------- |
| PostgreSQL major | `17`        | `17`                  | compatible                 |
| Edge runtime     | habilitado  | 24 funciones activas  | compatible a nivel general |
| Deno major       | `2`         | plataforma Deno 2     | compatible a nivel mayor   |
| Migrations       | habilitadas | history activa        | compatible                 |
| Realtime         | habilitado  | publicaciones activas | compatible a nivel general |

##### 8.2 Diferencias confirmadas de Edge Functions

| Función                   | Fuente                                                    | config.toml        | Remoto                     | Dictamen                                   |
| ------------------------- | --------------------------------------------------------- | ------------------ | -------------------------- | ------------------------------------------ |
| `club-revenuecat-webhook` | existe en `vento-shell`                                   | `verify_jwt=false` | no desplegada              | fuente/config sin remoto                   |
| `payments-return`         | existe en `vento-shell`                                   | sin entrada        | activa, `verify_jwt=false` | configuración implícita                    |
| `delivery-portal`         | no localizada en `vento-shell` ni búsqueda organizacional | sin entrada        | activa, `verify_jwt=false` | función remota huérfana de fuente canónica |

Diez entradas `verify_jwt=false` coinciden entre config y remoto. Las doce funciones remotas con `verify_jwt=true` dependen del default al no estar declaradas individualmente. El contrato canónico deberá ser explícito para las 24.

##### 8.3 Configuración que no puede compararse por equivalencia directa

`config.toml` es configuración del stack local. Contiene localhost, parámetros de desarrollo, Auth local y red local sin restricciones. No prueba la configuración hosted. Debe dividirse entre:

- configuración estrictamente local;
- contrato deseado por ambiente;
- snapshot redactado del remoto;
- diferencias justificadas y aprobadas.

#### 9. Recursos no cubiertos por historia de migraciones

##### 9.1 Storage

El remoto contiene 14 buckets; `config.toml` no declara ninguna sección `storage.buckets.*`. Algunos buckets se crearon por SQL y políticas versionadas, pero la existencia, privacidad, límite y MIME types son filas de configuración que no quedan cubiertas completamente por un schema diff.

##### 9.2 Realtime

Existen dos publicaciones:

- `supabase_realtime`, con seis relaciones empresariales enumeradas;
- `supabase_realtime_messages_publication`, con `realtime.messages`.

`config.toml` solo habilita Realtime y no declara miembros de publicación ni replica identity.

##### 9.3 Cron y automatizaciones

Existen siete cron jobs activos. Su schedule, comando redactado y autenticación no forman parte de `config.toml`; además, un squash puede omitir DML que crea cron, buckets o secretos.

##### 9.4 Auth, API y red

No pudo obtenerse un snapshot administrativo completo de Auth hosted, redirects, SMTP, rate limits, restricciones de red o branches. La sesión SQL tampoco expone la lista runtime de schemas PostgREST. Estas superficies quedan como paridad no certificada, no como configuración segura.

#### 10. Fingerprint remoto congelado

| Componente                      | Objetos o filas | SHA-256                                                            |
| ------------------------------- | --------------: | ------------------------------------------------------------------ |
| relaciones                      |             436 | `ead1df32ff00152fcfe5091c2b622dd2c822a6e21222f0a1a9da5d9e84b05539` |
| columnas                        |            5116 | `4e91e7c536c45279e9f56800e3423abe5adc616dc6cdbbe1e8c6da7d44f0ddbc` |
| constraints                     |            1944 | `d0c802e2a4bd66a30a14d899a639c3fc65f7715406f5c993c27cdf0ff848cf74` |
| índices                         |            1122 | `4fed1d7a3c103e086abbd989c56dfe79deefdf6ec6735ec36c51025f2f472262` |
| funciones                       |             464 | `3d1cbc83ae80c4620ce0c921fbda4113238a97e9cd939344b457a0b216613c32` |
| triggers no internos            |             203 | `dfc8e9a8c1c7fc138113e6fba59addf7e27dcea95ebcbf2840d537d58f63f67d` |
| políticas                       |             831 | `c89dea757962f10aa122f07e6d91cfca1b0878f844b9917683edae3cca430077` |
| filas expandidas de publicación |              13 | `1b203aae88af0d4e903c490e331db4354d0b01eb2b0bd4bed67de1bb666ece1d` |
| buckets                         |              14 | `e979a402b1d6fb4c64f8db2144bb362a68439e38841fe98e434c77a06258d3f4` |
| extensiones                     |               8 | `1b9c3ddec4d084cd75bc4ff8e3e90ee2fa5cfa6a2b6db5e057ba6dbfa56c040a` |
| cron jobs                       |               7 | `15ad00af7d4d673d74ce10a69203013da31bd93e573bf12c4256f03045c1cb52` |

Las huellas permiten detectar cambios posteriores. No demuestran por sí solas que el repositorio reproduzca esos objetos.

#### 11. Límites técnicos relevantes

La semántica oficial usada para interpretar resultados es:

- `migration list` compara timestamps locales y remotos, no contenido;
- `db diff` construye un shadow database aplicando migraciones locales y compara estructura;
- el diff tiene limitaciones conocidas para publicaciones, buckets y vistas con `security_invoker`;
- el squash omite DML, incluidos cron, buckets y secretos Vault;
- `config.toml` configura principalmente el stack local y reglas usadas por despliegues, no constituye snapshot automático del hosted;
- `verify_jwt` default es true, pero el flag de despliegue puede sobrescribir la configuración;
- desde 2026-08-05 la plataforma ignora el pin explícito de versiones de extensiones y usa la versión default.

Por ello, el cierre de paridad requiere varios validadores complementarios, no un único comando.

#### 12. Evidencia positiva

- la última versión remota observada tiene archivo local correspondiente;
- PostgreSQL major 17 coincide;
- la distribución Edge remota permanece estable en 12 true y 12 false;
- diez funciones false coinciden entre config y remoto;
- las anomalías de migración pudieron confirmarse tanto en remoto como en archivos Git puntuales;
- los objetos remotos tienen fingerprints reproducibles sin revelar secretos;
- `vento-shell` sí contiene una política documental explícita de centralización.

#### 13. Brechas y resolución obligatoria

| Brecha               | Hallazgo                                                                                                              | Requisitos                                              |
| -------------------- | --------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------- |
| `B-SUPA-AUD-016-001` | MIGRATION_MANIFEST.md declarado como canónico pero ausente.                                                           | TREQ-SUPABASE-243; TREQ-SUPABASE-270                    |
| `B-SUPA-AUD-016-002` | schema.sql referenciado por la guía pero ausente.                                                                     | TREQ-SUPABASE-251; TREQ-SUPABASE-270                    |
| `B-SUPA-AUD-016-003` | No existe evidencia automática de correspondencia exacta entre archivos locales y 549 versiones remotas.              | TREQ-SUPABASE-244; TREQ-SUPABASE-269                    |
| `B-SUPA-AUD-016-004` | migration list solo compara timestamps y no detecta contenido editado.                                                | TREQ-SUPABASE-245                                       |
| `B-SUPA-AUD-016-005` | Dieciséis nombres de migración se reutilizan.                                                                         | TREQ-SUPABASE-247                                       |
| `B-SUPA-AUD-016-006` | Dos pares remotos y locales son duplicados exactos de contenido.                                                      | TREQ-SUPABASE-247                                       |
| `B-SUPA-AUD-016-007` | Una migración remota y su archivo Git están vacíos.                                                                   | TREQ-SUPABASE-247                                       |
| `B-SUPA-AUD-016-008` | Tres versiones no constituyen timestamps UTC válidos.                                                                 | TREQ-SUPABASE-246                                       |
| `B-SUPA-AUD-016-009` | Ninguna migración remota conserva rollback.                                                                           | TREQ-SUPABASE-250                                       |
| `B-SUPA-AUD-016-010` | Ninguna migración remota conserva idempotency_key.                                                                    | TREQ-SUPABASE-249                                       |
| `B-SUPA-AUD-016-011` | La procedencia created_by es heterogénea y falta en 464 filas.                                                        | TREQ-SUPABASE-248                                       |
| `B-SUPA-AUD-016-012` | Dos snapshots remote_schema acumulan 3568 statements y coexisten con reconciliaciones posteriores.                    | TREQ-SUPABASE-252                                       |
| `B-SUPA-AUD-016-013` | La historia contiene preview, from_dev, manual y artefactos de reconciliación sin clasificación canónica de ambiente. | TREQ-SUPABASE-253                                       |
| `B-SUPA-AUD-016-014` | No existe registro operativo de cambios fuera de banda y repairs.                                                     | TREQ-SUPABASE-254                                       |
| `B-SUPA-AUD-016-015` | No existe fingerprint local-remoto automatizado de todo el catálogo.                                                  | TREQ-SUPABASE-255; TREQ-SUPABASE-269                    |
| `B-SUPA-AUD-016-016` | db diff no cubre por completo publicaciones, buckets y security_invoker.                                              | TREQ-SUPABASE-256                                       |
| `B-SUPA-AUD-016-017` | La exposición Data API declarada localmente no certifica la configuración hosted.                                     | TREQ-SUPABASE-257; TREQ-SUPABASE-258                    |
| `B-SUPA-AUD-016-018` | config.toml mezcla defaults locales con contratos que no tienen overlay por ambiente.                                 | TREQ-SUPABASE-258                                       |
| `B-SUPA-AUD-016-019` | club-revenuecat-webhook está en fuente/config pero no desplegada.                                                     | TREQ-SUPABASE-259; TREQ-SUPABASE-261                    |
| `B-SUPA-AUD-016-020` | payments-return está desplegada con verify_jwt=false sin entrada explícita en config.toml.                            | TREQ-SUPABASE-259; TREQ-SUPABASE-262                    |
| `B-SUPA-AUD-016-021` | delivery-portal está desplegada, no aparece en config.toml y no se localizó su fuente canónica.                       | TREQ-SUPABASE-259; TREQ-SUPABASE-261; TREQ-SUPABASE-262 |
| `B-SUPA-AUD-016-022` | Los bundles remotos no se vinculan a commit y ruta canónicos mediante un manifiesto.                                  | TREQ-SUPABASE-260                                       |
| `B-SUPA-AUD-016-023` | Los 14 buckets remotos no están declarados en config.toml.                                                            | TREQ-SUPABASE-264                                       |
| `B-SUPA-AUD-016-024` | Las dos publicaciones Realtime no tienen registro declarativo en vento-shell.                                         | TREQ-SUPABASE-265                                       |
| `B-SUPA-AUD-016-025` | Los siete cron jobs no forman parte de una comparación declarativa versionada.                                        | TREQ-SUPABASE-266                                       |
| `B-SUPA-AUD-016-026` | Auth hosted, restricciones de red y branches no pudieron certificarse contra overlays de ambiente.                    | TREQ-SUPABASE-263; TREQ-SUPABASE-268                    |
| `B-SUPA-AUD-016-027` | No existe prueba clean-room de replay integral desde PostgreSQL 17.                                                   | TREQ-SUPABASE-251                                       |
| `B-SUPA-AUD-016-028` | No existe pipeline único que ejecute paridad, replay, diff, lint, advisors y funciones.                               | TREQ-SUPABASE-269; TREQ-SUPABASE-272                    |

No queda hallazgo narrativo sin requisito y tarea responsable.

#### 14. Requisitos de prueba incorporados

Se incorporan 30 filas canónicas en el registro 04A:

- `TREQ-SUPABASE-243` — Todo archivo de migración deberá registrarse en un manifiesto canónico con versión, nombre, ruta, tamaño, hash del archivo, hash SQL normalizado, commit, autor, ambiente, estado local y estado remoto.
- `TREQ-SUPABASE-244` — CI deberá exigir correspondencia uno a uno entre versiones locales y supabase_migrations.schema_migrations, sin versiones solo locales, solo remotas, repetidas ni fuera del orden aprobado.
- `TREQ-SUPABASE-245` — La paridad de migraciones deberá comparar contenido inmutable además de timestamps; una versión aplicada conservará hash SQL canónico y cualquier diferencia local-remota bloqueará el despliegue.
- `TREQ-SUPABASE-246` — Toda versión de migración deberá usar catorce dígitos que formen un timestamp UTC válido y un nombre normalizado sin puntos, sufijos ambiguos ni colisiones semánticas.
- `TREQ-SUPABASE-247` — No se admitirán migraciones vacías, archivos distintos con payload SQL idéntico ni reutilización de nombre sin una razón de continuidad explícita y verificable.
- `TREQ-SUPABASE-248` — Cada migración remota deberá conservar actor técnico o humano, commit, pull request o decisión, método de aplicación, hora, resultado y ambiente; los registros sin procedencia deberán clasificarse y reconciliarse.
- `TREQ-SUPABASE-249` — Cada migración deberá declarar límites transaccionales, lock_timeout, precondiciones, postcondiciones, estrategia idempotente y validación de datos antes de imponer constraints o mutaciones irreversibles.
- `TREQ-SUPABASE-250` — Cada paquete de cambio deberá tener forward-fix, rollback o restauración aprobada, punto de recuperación, criterios de abandono y prueba de reversión compatible con datos reales.
- `TREQ-SUPABASE-251` — La cadena completa de migraciones deberá reconstruir desde cero una base PostgreSQL 17 limpia y producir la misma estructura, configuración declarable y datos de referencia aprobados que el ambiente objetivo.
- `TREQ-SUPABASE-252` — La estrategia de baseline y squash deberá reducir snapshots remote_schema y repeticiones sin perder DML, cron, buckets, publicaciones, secretos cifrados, grants, políticas ni historia necesaria para auditoría.
- `TREQ-SUPABASE-253` — Migraciones con nombres preview, from_dev, sandbox, manual o equivalente deberán llevar clasificación de ambiente, evidencia de promoción, limpieza y prohibición expresa de efectos temporales en producción.
- `TREQ-SUPABASE-254` — Todo cambio realizado mediante Dashboard, SQL Editor, API administrativa, repair o sesión directa deberá capturarse inmediatamente en una migración nueva, registrar la excepción y quedar reconciliado antes del siguiente despliegue.
- `TREQ-SUPABASE-255` — La detección de drift deberá comparar huellas canónicas de schemas, relaciones, columnas, constraints, índices, funciones, triggers, políticas, grants, RLS, publicaciones, extensiones y objetos administrados.
- `TREQ-SUPABASE-256` — Recursos no cubiertos completamente por db diff deberán tener registros declarativos separados: publicaciones Realtime, buckets, atributos security_invoker, cron, secretos, configuración Auth, API, Storage y Edge Functions.
- `TREQ-SUPABASE-257` — La lista de schemas expuestos por Data API, extra_search_path, grants de schema y objetos, roles cliente y funciones RPC deberá declararse por ambiente y compararse con el gateway remoto.
- `TREQ-SUPABASE-258` — config.toml deberá distinguir valores locales de contratos desplegables y usar overlays o manifiestos por ambiente; ningún default local se aceptará como evidencia de configuración hosted.
- `TREQ-SUPABASE-259` — Cada Edge Function deberá existir exactamente una vez en la fuente canónica, en config.toml y en el remoto esperado, con estado enabled, verify_jwt, entrypoint e import map explícitos.
- `TREQ-SUPABASE-260` — Todo bundle desplegado deberá corresponder a commit, ruta relativa, blob SHA, dependencias, bundle SHA remoto, actor, fecha, configuración y mecanismo de rollback verificables.
- `TREQ-SUPABASE-261` — Una función desplegada sin fuente canónica o una fuente configurada sin despliegue deberá bloquear releases hasta ser adoptada, retirada o clasificada explícitamente por ambiente.
- `TREQ-SUPABASE-262` — verify_jwt deberá declararse explícitamente para las 24 funciones y no depender del default ni de flags de despliegue; la configuración remota deberá coincidir con el contrato de invocación aprobado.
- `TREQ-SUPABASE-263` — Auth deberá tener manifiesto por ambiente para site URL, redirects, signup, confirmaciones, recuperación, requisitos de contraseña, MFA, rate limits, SMTP, proveedores y claves de firma, con comparación remota redactada.
- `TREQ-SUPABASE-264` — Los buckets deberán declararse con privacidad, límite, MIME types, políticas, propietario, retención y datos iniciales; CI comparará el registro con storage.buckets y sus políticas.
- `TREQ-SUPABASE-265` — Las publicaciones Realtime deberán declarar publicación, tablas, operaciones, replica identity, consumidor, volumen esperado y política de incorporación o retiro; CI comparará el remoto.
- `TREQ-SUPABASE-266` — Cron, pg_net, webhooks y automatizaciones deberán compararse por nombre, schedule, comando redactado, función objetivo, autenticación, timeout, estado y hash, sin depender del schema diff.
- `TREQ-SUPABASE-267` — PostgreSQL, Supabase CLI, Edge Runtime, Deno y extensiones deberán fijarse o acotarse mediante versiones compatibles, política de actualización y prueba de replay; no se usarán versiones de extensión explícitas cuando la plataforma las ignore.
- `TREQ-SUPABASE-268` — Cada ambiente deberá mapear nombre, project ref, región, branch, propósito, datos permitidos, configuración, secretos, dominio, proveedores y promoción; ninguna prueba podrá asumir que vento-os-dev representa staging o producción.
- `TREQ-SUPABASE-269` — El pipeline deberá ejecutar lint de nombres, secret scan, migration list, replay limpio, db diff por schemas, db lint, advisors, fingerprints complementarios y comparación de Edge Functions antes de permitir merge o despliegue.
- `TREQ-SUPABASE-270` — Toda documentación que declare un artefacto canónico deberá comprobar su existencia y hash; referencias a archivos ausentes deberán restaurarse o corregirse en el mismo paquete documental.
- `TREQ-SUPABASE-271` — Cada auditoría de paridad deberá producir evidencia inmutable con commit, project ref, corte temporal, hashes de historia, catálogo, configuración, funciones y recursos administrados, sin incluir secretos.
- `TREQ-SUPABASE-272` — El validador integral deberá comprobar 549 versiones remotas únicas, 533 nombres, 16 nombres repetidos, una migración vacía, dos pares de payload idéntico, tres timestamps inválidos, cero rollback, cero idempotency_key, commit y config esperados, 24 Edge Functions, 14 buckets, dos publicaciones y todas las huellas SUPA-AUD-016.

El detalle completo de las catorce columnas reside únicamente en el archivo 04A regenerado.

#### 15. Huellas de integridad

| Conjunto                   | SHA-256                                                            |
| -------------------------- | ------------------------------------------------------------------ |
| `migration_history_remote` | `c728bc62b92f0d53fa229f6c184f3b85b71a1047492ebcd7282e433bfebb2f31` |
| `migration_anomalies`      | `dfb629144195b4b3e2fc9c5d9bc626eab64291b2654b7e2257a8524a554f42a7` |
| `edge_config_parity`       | `82db527fc2c5f58341c1e4ab85890ddcaeeb9b17d260204a88b44741d1377be3` |
| `managed_resources`        | `b44176eb82186493288613f58af10a4e2d27bc4c82f0f92daf613a89cd00901e` |
| `relations`                | `ead1df32ff00152fcfe5091c2b622dd2c822a6e21222f0a1a9da5d9e84b05539` |
| `columns`                  | `4e91e7c536c45279e9f56800e3423abe5adc616dc6cdbbe1e8c6da7d44f0ddbc` |
| `constraints`              | `d0c802e2a4bd66a30a14d899a639c3fc65f7715406f5c993c27cdf0ff848cf74` |
| `indexes`                  | `4fed1d7a3c103e086abbd989c56dfe79deefdf6ec6735ec36c51025f2f472262` |
| `functions`                | `3d1cbc83ae80c4620ce0c921fbda4113238a97e9cd939344b457a0b216613c32` |
| `triggers`                 | `dfc8e9a8c1c7fc138113e6fba59addf7e27dcea95ebcbf2840d537d58f63f67d` |
| `policies`                 | `c89dea757962f10aa122f07e6d91cfca1b0878f844b9917683edae3cca430077` |
| `publications`             | `1b203aae88af0d4e903c490e331db4354d0b01eb2b0bd4bed67de1bb666ece1d` |
| `buckets`                  | `e979a402b1d6fb4c64f8db2144bb362a68439e38841fe98e434c77a06258d3f4` |
| `extensions`               | `1b9c3ddec4d084cd75bc4ff8e3e90ee2fa5cfa6a2b6db5e057ba6dbfa56c040a` |
| `cron_jobs`                | `15ad00af7d4d673d74ce10a69203013da31bd93e573bf12c4256f03045c1cb52` |
| `breach_register`          | `24b1e58457c94a025a53202a183667bd0a3a71d3595ef44d434d3e047fc7713f` |

La huella de historia remota concatena versión, nombre y SHA-256 de statements en orden. Las demás huellas se calculan sobre catálogo o JSON canónico redactado.

#### 16. Criterios de aceptación de `SUPA-AUD-016`

La tarea queda aceptada porque:

1. preserva exactamente la línea base aprobada de `SUPA-AUD-015` y 04A;
2. inventaría y fingerprinta las 549 versiones remotas;
3. confirma la entrada vacía, duplicados exactos y timestamps inválidos en remoto y Git;
4. distingue paridad de timestamp, contenido, estructura, recursos administrados y bundles;
5. compara `config.toml` con las 24 Edge Functions y clasifica tres diferencias concretas;
6. congela fingerprints de once componentes del remoto;
7. identifica artefactos canónicos referenciados pero inexistentes;
8. formaliza 28 brechas en 30 requisitos;
9. no afirma replay ni paridad completa sin haberlos ejecutado;
10. no realiza cambios remotos;
11. deja `SUPA-AUD-017` como responsable exacto del drift objeto por objeto.

#### 17. Límites de la auditoría

No pudo certificarse en esta tarea:

- inventario byte a byte de los 549 archivos locales mediante una ejecución del CLI;
- replay completo en una base limpia;
- `db diff --linked` y clasificación de sus diferencias;
- estado hosted completo de Auth, API gateway, red y branches;
- correspondencia commit a bundle SHA de las 24 funciones;
- procedencia exacta de cada una de las 464 migraciones sin `created_by`;
- si cada diferencia es cambio manual, repair, importación, dashboard o despliegue por CLI;
- datos y objetos físicos de Storage, que no deben manipularse mediante SQL.

Cada límite queda vinculado a `TREQ-SUPABASE-243` a `TREQ-SUPABASE-272` y a `SUPA-AUD-017`; no se interpreta ausencia de evidencia como paridad.

#### 18. Declaración de no mutación

No se ejecutaron:

- `supabase db push`, `db pull`, `db diff`, `db reset`, `migration repair`, `migration squash` ni replay;
- DDL, DML, grants, revokes o cambios de historia;
- despliegue, eliminación o invocación de Edge Functions;
- cambios de Auth, Storage, Realtime, cron, extensiones, secretos o configuración;
- commits, branches, pull requests o workflows.

Las consultas SQL fueron exclusivamente de catálogo, agregación y hashing read-only.

#### 19. Cierre

`SUPA-AUD-016` queda **APROBADA** como línea base de comparación entre Supabase remoto y la fuente declarada en `vento-shell`. No certifica paridad total ni autoriza reparar historia, renombrar migraciones aplicadas, eliminar duplicados, reconstruir entornos o desplegar funciones.

La siguiente tarea canónica es:

```text
SUPA-AUD-017 — Detectar drift, cambios manuales y objetos sin migración
```


### ✅ SUPA-AUD-017 — Detectar drift, cambios manuales y objetos sin migración

**Estado:** APROBADA
**Fecha de preparación documental:** 2026-07-29
**Bloque propietario:** BLOQUE E3 — Arquitectura canónica de datos y gobierno integral de Supabase
**Marcador exacto que reemplaza:** `### [ ] SUPA-AUD-017 — Detectar drift, cambios manuales y objetos sin migración`
**Tarea anterior:** `SUPA-AUD-016 — Comparar Supabase remoto con migraciones y configuración de vento-shell` — APROBADA
**Siguiente tarea:** `SUPA-AUD-018 — Identificar tablas, columnas, funciones y políticas legacy`
**Proyecto observado:** `vento-os-dev` — `clzdpinthhtknkmefsxx`
**Repositorio canónico declarado:** `devVentoGroup/vento-shell` — rama `main` — commit observado `0eefe75bae095a8023098341b1ae474ed2c52870`
**Tipo de tarea:** auditoría documental y técnica read-only de drift estructural, DDL fuera de banda, procedencia migratoria y recursos no SQL; sin DDL, DML, migration repair, despliegues ni cambios remotos

#### 1. Objetivo

Detectar y clasificar diferencias entre el estado remoto y la historia de migraciones, distinguiendo con precisión:

```text
DRIFT CONFIRMADO FUERA DE BANDA
        ≠
OBJETO REMOTO SIN PROCEDENCIA IDENTIFICABLE
        ≠
DIFERENCIA DECLARATIVA
        ≠
DDL GESTIONADO POR LA PLATAFORMA
        ≠
FALSO POSITIVO DE BÚSQUEDA TEXTUAL
```

La tarea no convierte la ausencia de un nombre en prueba automática de creación manual. Solo clasifica como fuera de banda confirmado cuando existe telemetría DDL o evidencia equivalente y no existe statement migratorio correspondiente.

#### 2. Regla canónica derivada

```text
Todo objeto empresarial remoto deberá poder trazarse a una migración, commit y definición reproducible. Un objeto sin procedencia se bloquea y se adopta mediante una migración forward-only; nunca se corrige editando historia aplicada. La evidencia debe separar certeza comprobada, inferencia y límite técnico.
```

#### 3. Fuentes congeladas

| Fuente                     | Corte                                                                                  | Responsabilidad                                                                  |
| -------------------------- | -------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| `SUPA-AUD-016.md` aprobado | SHA-256 `7d56aca40b99f3c2667c66207ee87609ff7c186866c3efa574a864870b96c9a9`             | línea base de paridad                                                            |
| 04A aprobado               | SHA-256 `dce38706a25a382663297a0990d4a88fbc2abec88762df5dd159838b0385f5db`; 4567 filas | requisitos hasta `TREQ-SUPABASE-272`                                             |
| Supabase `vento-os-dev`    | 2026-07-29                                                                             | catálogo, historia y telemetría SQL                                              |
| `vento-shell` rama `main`  | commit `0eefe75bae095a8023098341b1ae474ed2c52870`                                      | fuente declarada y búsqueda de código                                            |
| `pg_stat_statements`       | snapshot disponible al corte                                                           | evidencia agregada de DDL; no representa necesariamente hora exacta de ejecución |

#### 4. Método y límites de certeza

Se inspeccionaron sin mutación:

- las 549 migraciones remotas y sus statements;
- nombres actuales de tablas, columnas, funciones, triggers y políticas empresariales;
- coincidencia nominal objeto → statement migratorio;
- telemetría DDL agregada por rol, operación, queryid y hash redactado;
- funciones SECURITY DEFINER, grants efectivos y dependencias de triggers;
- índices actuales y nombres de columnas candidatos;
- búsqueda conectada sobre `vento-shell` y commit actual;
- continuidad de drift no SQL detectado en SUPA-AUD-016.

La detección textual es un filtro de candidatos, no una prueba de equivalencia. Puede fallar ante SQL dinámico, renombres, `CREATE TABLE AS`, definiciones generadas o archivos no indexados. El cierre definitivo exige parser SQL, inventario Git completo y replay limpio.

#### 5. Resultado ejecutivo

| Métrica                                            |        Resultado |
| -------------------------------------------------- | ---------------: |
| Migraciones remotas                                |          **549** |
| Versión máxima                                     | `20260716170000` |
| Objetos actuales sin mención nominal en statements |            **8** |
| Objetos o grupos con DDL fuera de banda confirmado |            **5** |
| Columnas de nombre único sin mención migratoria    |            **3** |
| Índices RBAC actuales sin migración                |            **4** |
| Funciones SECURITY DEFINER sin procedencia         |            **2** |
| Políticas actuales sin nombre migratorio           |            **4** |
| Brechas formalizadas                               |           **23** |
| Requisitos nuevos                                  |           **30** |

#### 6. Taxonomía aplicada

| Clasificación                         | Criterio                                                                               | Resultado                                                             |
| ------------------------------------- | -------------------------------------------------------------------------------------- | --------------------------------------------------------------------- |
| Fuera de banda confirmado             | DDL observado como `postgres`, objeto actual y ausencia en statements                  | `app_runtime_settings`; cuatro índices de `role_permissions`          |
| Sin procedencia migratoria            | objeto actual sin mención en historia ni fuente localizada, sin telemetría concluyente | dos funciones de asistencia, un trigger y tres columnas               |
| Política sin definición identificable | nombre actual ausente del corpus                                                       | dos políticas de `app_runtime_settings`; dos de `product_images`      |
| Drift declarativo no SQL              | fuente, config y remoto no coinciden                                                   | Edge Functions y recursos administrados heredados de SUPA-AUD-016     |
| Plataforma o tooling                  | DDL de `supabase_admin`, `pg_temp`, extensiones y metadatos internos                   | se excluye del conteo empresarial salvo efecto sobre superficie VENTO |

#### 7. Drift fuera de banda confirmado

##### 7.1 `public.app_runtime_settings`

La tabla remota existe con siete columnas, RLS habilitado y dos políticas. Ninguno de estos nombres aparece en los statements de las 549 migraciones:

- `public.app_runtime_settings`;
- `app_runtime_settings_read_authenticated`;
- `app_runtime_settings_write_admins`.

`pg_stat_statements` conserva seis formas DDL ejecutadas como `postgres` desde el snapshot iniciado el 2026-05-28:

- `CREATE TABLE`;
- `ALTER TABLE` para RLS;
- `DROP POLICY` y `CREATE POLICY` de lectura;
- `DROP POLICY` y `CREATE POLICY` administrativa.

Se conservaron únicamente hashes, rol, calls y `stats_since`; no se copió SQL completo. `stats_since` es inicio de acumulación estadística, no prueba exacta de la hora de ejecución.

**Dictamen:** cambio fuera de banda confirmado y no reconciliado mediante migración.

##### 7.2 Índices de alcance de `role_permissions`

Están activos, válidos y listos:

- `role_permissions_scope_site_id_idx`;
- `role_permissions_scope_area_id_idx`;
- `role_permissions_scope_site_type_idx`;
- `role_permissions_scope_area_kind_idx`.

Sus cuatro `CREATE INDEX` aparecen en telemetría como `postgres`, con dos llamadas por forma, y ninguno de los nombres aparece en statements migratorios.

**Dictamen:** cuatro índices fuera de banda confirmados. Su utilidad se evaluará en SUPA-AUD-020; en esta tarea solo se exige adopción o retiro controlado.

#### 8. Objetos sin procedencia migratoria identificable

##### 8.1 Resolver de turno de asistencia

Existen remoto:

- `public.resolve_attendance_shift_before_insert()` — `SECURITY DEFINER`, `search_path=public`;
- trigger `attendance_logs_01_resolve_shift` sobre `public.attendance_logs`.

La función solo conserva EXECUTE para roles administrativos y service role en la evidencia consultada. El trigger la referencia directamente. Ningún nombre aparece en statements migratorios ni en la búsqueda conectada de `vento-shell`.

**Dictamen:** objeto remoto sin procedencia identificable. No se afirma creación manual porque la telemetría DDL específica ya no está disponible.

##### 8.2 `public.anima_is_active_owner()`

La función es `SECURITY DEFINER`, `STABLE`, con `search_path=public, auth`. `authenticated` conserva EXECUTE además de roles administrativos. No se encontraron dependencias directas en policies, triggers, views o funciones dentro de las consultas ejecutadas, pero esto no demuestra ausencia total de consumidores externos.

**Dictamen:** función privilegiada sin procedencia migratoria identificable y candidata a revisión legacy en SUPA-AUD-018.

#### 9. Políticas sin definición migratoria identificable

Las siguientes políticas actuales no aparecen por nombre en la historia:

| Tabla                  | Política                                  | Comando |
| ---------------------- | ----------------------------------------- | ------- |
| `app_runtime_settings` | `app_runtime_settings_read_authenticated` | SELECT  |
| `app_runtime_settings` | `app_runtime_settings_write_admins`       | ALL     |
| `product_images`       | `product_images_read_authenticated`       | SELECT  |
| `product_images`       | `product_images_write_inventory_managers` | ALL     |

Los dos pares comparten hashes de predicado entre sí. Esto sugiere reutilización de una plantilla, pero no prueba que las políticas sean correctas para ambas tablas.

**Dictamen:** las políticas de `app_runtime_settings` forman parte del drift confirmado; las de `product_images` requieren adopción o reemplazo explícito.

#### 10. Columnas sin procedencia identificable

La búsqueda de nombres únicos en la historia aisló:

| Columna                                         | Estado remoto                    | Dictamen                                 |
| ----------------------------------------------- | -------------------------------- | ---------------------------------------- |
| `pass.site_schedule_exceptions.internal_reason` | `text`, nullable                 | sin procedencia migratoria identificable |
| `public.suppliers.credit_days`                  | `integer`, nullable              | sin procedencia migratoria identificable |
| `public.suppliers.payment_type`                 | `text`, NOT NULL, default `cash` | sin procedencia migratoria identificable |

No se observaron formas DDL retenidas para estos nombres y la búsqueda de `vento-shell` no devolvió coincidencias. Por ello no se clasifican como manuales confirmadas.

La comparación contextual tabla-columna produjo otros candidatos, incluidos objetos backup y `product_images`, pero se excluyeron del resultado firme porque pueden provenir de snapshots, `SELECT *`, SQL dinámico o coincidencias indirectas. Solo replay y parser pueden resolverlos.

#### 11. Drift no SQL que permanece abierto

SUPA-AUD-016 ya confirmó:

- `delivery-portal` desplegada sin fuente canónica localizada ni entrada en `config.toml`;
- `payments-return` desplegada con `verify_jwt=false` sin declaración explícita;
- `club-revenuecat-webhook` versionada y configurada, pero no desplegada;
- buckets, publicaciones, cron, Auth y configuración hosted sin comparación declarativa recurrente.

Estos hallazgos no se duplican como objetos SQL; se incorporan al ledger unificado exigido por `TREQ-SUPABASE-296` y `297`.

#### 12. Lo que no se considera prueba de cambio manual

No se clasificó automáticamente como manual:

- toda forma DDL sin match exacto, porque el CLI puede normalizar o dividir statements;
- DDL de `supabase_admin`, extensiones, `pg_temp`, Auth, Storage o Realtime;
- objetos presentes en una migración bajo otra forma textual;
- nombres genéricos de columnas como `created_at` o `id`;
- ausencia en búsqueda GitHub sin inventario completo del árbol;
- diferencias de config hosted no accesibles por SQL.

#### 13. Brechas y resolución obligatoria

| Brecha               | Hallazgo                                                                                                                   | Requisitos                                              |
| -------------------- | -------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------- |
| `B-SUPA-AUD-017-001` | app_runtime_settings y sus dos políticas no aparecen en la historia; seis DDL fuera de banda quedan confirmados.           | TREQ-SUPABASE-275; TREQ-SUPABASE-276; TREQ-SUPABASE-277 |
| `B-SUPA-AUD-017-002` | resolve_attendance_shift_before_insert y attendance_logs_01_resolve_shift carecen de procedencia migratoria identificable. | TREQ-SUPABASE-278; TREQ-SUPABASE-279                    |
| `B-SUPA-AUD-017-003` | anima_is_active_owner es SECURITY DEFINER sin mención migratoria.                                                          | TREQ-SUPABASE-280                                       |
| `B-SUPA-AUD-017-004` | Dos políticas de product_images no aparecen por nombre en el corpus migratorio.                                            | TREQ-SUPABASE-281; TREQ-SUPABASE-282                    |
| `B-SUPA-AUD-017-005` | suppliers.payment_type y suppliers.credit_days no aparecen en statements migratorios.                                      | TREQ-SUPABASE-283; TREQ-SUPABASE-284                    |
| `B-SUPA-AUD-017-006` | pass.site_schedule_exceptions.internal_reason no aparece en statements migratorios.                                        | TREQ-SUPABASE-283; TREQ-SUPABASE-285                    |
| `B-SUPA-AUD-017-007` | Cuatro índices de alcance de role_permissions fueron creados como postgres y no aparecen en migraciones.                   | TREQ-SUPABASE-275; TREQ-SUPABASE-286                    |
| `B-SUPA-AUD-017-008` | No existe detector parser/replay objeto a migración; la búsqueda textual no certifica paridad.                             | TREQ-SUPABASE-287; TREQ-SUPABASE-295                    |
| `B-SUPA-AUD-017-009` | La telemetría DDL disponible no es un ledger canónico y su texto puede ser sensible.                                       | TREQ-SUPABASE-288                                       |
| `B-SUPA-AUD-017-010` | DDL de plataforma y DDL empresarial comparten la misma fuente de telemetría sin clasificación automática.                  | TREQ-SUPABASE-289                                       |
| `B-SUPA-AUD-017-011` | No existe gate que bloquee releases por drift crítico confirmado.                                                          | TREQ-SUPABASE-290                                       |
| `B-SUPA-AUD-017-012` | app_runtime_settings carece de comentario de tabla y ownership funcional declarativo.                                      | TREQ-SUPABASE-291                                       |
| `B-SUPA-AUD-017-013` | Grants y revokes fuera de match exacto no tienen procedencia uniforme.                                                     | TREQ-SUPABASE-292                                       |
| `B-SUPA-AUD-017-014` | La adopción RLS puede quedar parcial si solo se migra la tabla.                                                            | TREQ-SUPABASE-293                                       |
| `B-SUPA-AUD-017-015` | No existe paquete estructural único para reconciliar columnas, policies, functions, triggers e índices.                    | TREQ-SUPABASE-294                                       |
| `B-SUPA-AUD-017-016` | La búsqueda Git conectada no sustituye inventario completo del árbol y replay.                                             | TREQ-SUPABASE-295                                       |
| `B-SUPA-AUD-017-017` | delivery-portal continúa sin fuente localizada y dos funciones conservan diferencias fuente-config-remoto.                 | TREQ-SUPABASE-296                                       |
| `B-SUPA-AUD-017-018` | Recursos administrados no tienen ledger recurrente de drift.                                                               | TREQ-SUPABASE-297                                       |
| `B-SUPA-AUD-017-019` | No existe ledger separado para DML de configuración y datos de referencia fuera de banda.                                  | TREQ-SUPABASE-298                                       |
| `B-SUPA-AUD-017-020` | No existe registro operativo de excepciones de drift con expiración.                                                       | TREQ-SUPABASE-299                                       |
| `B-SUPA-AUD-017-021` | No está formalizado el uso exclusivo de migraciones forward-only para adoptar drift.                                       | TREQ-SUPABASE-300                                       |
| `B-SUPA-AUD-017-022` | La evidencia de drift no tiene aún retención y acceso canónicos.                                                           | TREQ-SUPABASE-301                                       |
| `B-SUPA-AUD-017-023` | No existe validador integral automatizado de SUPA-AUD-017.                                                                 | TREQ-SUPABASE-302                                       |

No queda hallazgo narrativo sin requisito y tarea responsable.

#### 14. Requisitos de prueba incorporados

Se incorporan 30 filas canónicas en el registro 04A:

- `TREQ-SUPABASE-273` — Todo hallazgo de drift deberá clasificarse como cambio fuera de banda confirmado, objeto sin procedencia, diferencia declarativa, componente gestionado por plataforma, deuda legacy o falso positivo, con evidencia y nivel de certeza explícitos.
- `TREQ-SUPABASE-274` — Cada objeto empresarial remoto deberá tener identidad canónica estable, tipo, schema, propietario, definición normalizada, hash, migración de origen, commit, estado y clasificación de procedencia.
- `TREQ-SUPABASE-275` — Toda operación DDL fuera de una migración deberá generar evento de auditoría con actor, canal, hora, query hash redactado, objetos afectados, ticket, razón, ambiente y migración de reconciliación.
- `TREQ-SUPABASE-276` — public.app_runtime_settings, sus políticas, grants, restricciones, comentarios y datos base deberán adoptarse mediante una migración canónica nueva que reproduzca el estado aprobado sin editar historia aplicada.
- `TREQ-SUPABASE-277` — Los valores de app_runtime_settings deberán separarse entre definición estructural, seed por ambiente y cambios operativos; cada modificación conservará historial inmutable, actor, razón, vigencia y rollback.
- `TREQ-SUPABASE-278` — public.resolve_attendance_shift_before_insert() y el trigger attendance_logs_01_resolve_shift deberán tener una migración de adopción con definición exacta, orden de trigger, grants, pruebas de concurrencia y rollback.
- `TREQ-SUPABASE-279` — El orden relativo de triggers sobre attendance_logs deberá declararse y probarse; el prefijo nominal no será el único mecanismo para garantizar precedencia, idempotencia y compatibilidad con otros triggers.
- `TREQ-SUPABASE-280` — Toda función SECURITY DEFINER sin migración de origen deberá bloquear releases hasta tener adopción, propietario, search_path fijo, validación de identidad, grants mínimos y prueba negativa por anon y authenticated.
- `TREQ-SUPABASE-281` — Toda política RLS remota deberá corresponder a una definición migratoria identificable por tabla, nombre, comando, roles, USING, WITH CHECK y hash normalizado; coincidencias semánticas parciales no bastarán.
- `TREQ-SUPABASE-282` — Las políticas product_images_read_authenticated y product_images_write_inventory_managers deberán adoptarse o reemplazarse mediante migración explícita y probar lectura, escritura, ownership, borrado y denegación por rol.
- `TREQ-SUPABASE-283` — El validador de columnas deberá exigir que cada columna actual aparezca en el contexto de su tabla dentro de una migración o baseline aprobado, incluyendo tipo, nulabilidad, default, identidad, generación, comentario y orden lógico.
- `TREQ-SUPABASE-284` — suppliers.payment_type y suppliers.credit_days deberán tener una migración de adopción con constraints, catálogo de valores, semántica de nulos, backfill, consumidores y pruebas de compras y pagos.
- `TREQ-SUPABASE-285` — pass.site_schedule_exceptions.internal_reason deberá adoptarse mediante migración y definir clasificación, privacidad, obligatoriedad, retención, redacción y consumidores autorizados.
- `TREQ-SUPABASE-286` — Los índices role_permissions_scope_site_id_idx, scope_area_id_idx, scope_site_type_idx y scope_area_kind_idx deberán declararse en una migración canónica y validarse contra consultas, selectividad, tamaño y redundancia.
- `TREQ-SUPABASE-287` — CI deberá comparar el catálogo actual con el corpus de migraciones mediante parser SQL y replay, no solo búsqueda textual; cada objeto o columna sin procedencia generará un hallazgo bloqueante o excepción aprobada.
- `TREQ-SUPABASE-288` — La telemetría DDL deberá retener actor, queryid, hash, primera y última observación, llamadas y objeto, pero nunca SQL completo cuando pueda contener datos o secretos; la retención deberá superar el ciclo de auditoría.
- `TREQ-SUPABASE-289` — El detector de drift deberá excluir o clasificar explícitamente DDL gestionado por Supabase, extensiones, pg_temp, auth, storage, realtime y supabase_migrations, sin ocultar cambios empresariales ejecutados por roles administrativos.
- `TREQ-SUPABASE-290` — Ningún despliegue posterior podrá ejecutarse mientras exista drift crítico confirmado sin una migración de reconciliación, prueba de replay, fingerprint posterior y decisión documentada de conservar o retirar.
- `TREQ-SUPABASE-291` — Cada objeto empresarial deberá tener COMMENT ON canónico con finalidad, propietario funcional, sensibilidad, consumidores y tarea de retiro; la ausencia de comentario será brecha de gobierno, no prueba de objeto manual.
- `TREQ-SUPABASE-292` — Grants y revokes deberán versionarse y compararse por objeto, firma, rol, privilegio y grantor; ninguna concesión actual podrá justificarse únicamente por ownership o defaults de PostgreSQL.
- `TREQ-SUPABASE-293` — La adopción de objetos con RLS deberá incluir relrowsecurity, relforcerowsecurity, políticas, grants de tabla y columna, funciones auxiliares y pruebas negativas; adoptar solo CREATE TABLE será incompleto.
- `TREQ-SUPABASE-294` — La reconciliación estructural deberá cubrir tablas, columnas, tipos, defaults, constraints, índices, funciones, triggers, comentarios, owners, grants y RLS como una unidad; no se aceptarán parches aislados sin fingerprint completo.
- `TREQ-SUPABASE-295` — La ausencia de resultados en búsqueda de código no se considerará prueba definitiva de ausencia; deberá complementarse con inventario del árbol Git, hashes, parser SQL, historial, ramas aprobadas y replay.
- `TREQ-SUPABASE-296` — Las Edge Functions y recursos administrados identificados como huérfanos en SUPA-AUD-016 deberán entrar al mismo registro de drift con fuente, config, remoto, bundle, ambiente, adopción o retiro y fecha límite.
- `TREQ-SUPABASE-297` — Buckets, publicaciones, cron, extensiones, Auth, API y configuración hosted deberán producir snapshots declarativos versionados y diferencias clasificadas con la misma taxonomía, severidad, dueño y fecha de cierre del drift SQL.
- `TREQ-SUPABASE-298` — Cambios DML operativos o de configuración ejecutados fuera de flujos aprobados deberán registrarse con tabla, clave lógica redactada, actor, razón, before/after protegido, ambiente y mecanismo de reversión; no se mezclarán con migraciones estructurales.
- `TREQ-SUPABASE-299` — Todo drift aceptado temporalmente deberá tener identificador, riesgo residual, propietario, compensación, ambiente, fecha de expiración, criterio de cierre y tarea concreta; las excepciones vencidas bloquearán releases.
- `TREQ-SUPABASE-300` — La remediación de drift deberá usar migraciones forward-only de adopción o corrección; no se editarán, renombrarán ni repararán versiones aplicadas salvo procedimiento excepcional aprobado y evidenciado.
- `TREQ-SUPABASE-301` — La evidencia de drift deberá conservar consultas de catálogo, hashes redactados, commit, project ref, corte temporal, resultados y limitaciones durante la retención aprobada, con acceso restringido y verificación de integridad.
- `TREQ-SUPABASE-302` — El validador integral deberá comprobar 549 migraciones sin cambio de versión máxima, ocho objetos sin mención nominal, cinco grupos de drift fuera de banda confirmados, tres columnas únicas sin procedencia, cuatro índices RBAC no migrados, clasificación de plataforma y todas las huellas SUPA-AUD-017.

El detalle completo de las catorce columnas reside únicamente en el archivo 04A regenerado.

#### 15. Huellas de integridad

| Conjunto                                 | SHA-256                                                            |
| ---------------------------------------- | ------------------------------------------------------------------ |
| `objects_without_name_in_history`        | `ec89e7e333b0182edba3ad99a5022555aefe2f06eca9321fa4965c6d38f07364` |
| `confirmed_out_of_band`                  | `48ecc1fe1a1fef57f8c452ef3db8d4d46e86e8e20b038feb44f81e189c2b0c87` |
| `columns_without_unique_name_in_history` | `b0b88bf388d31a1183f3f764f5073c88e080ca8d9f8f56de9357320359e93d03` |
| `classification_manifest`                | `3774bf4144924855ebcb5af6041a004ac47b46282bc25c1c62f98a0d6a2070ce` |
| `breach_register`                        | `e00b12f3dce8e67f42413a298a5789676d1ba24f1aaf24c9da2b198b61856cad` |

Las huellas se calculan sobre JSON o Markdown canónico redactado. No incluyen SQL completo, datos personales ni valores de secretos.

#### 16. Criterios de aceptación de `SUPA-AUD-017`

La tarea queda aceptada porque:

1. preserva exactamente SUPA-AUD-016 y las 4567 filas anteriores del 04A;
2. mantiene la historia remota en 549 versiones y no confunde cambio de commit documental con cambio de schema;
3. clasifica fuera de banda confirmado solo cuando hay evidencia DDL suficiente;
4. identifica ocho objetos sin mención nominal, cinco grupos confirmados y tres columnas sin procedencia;
5. separa DDL empresarial, tooling y componentes gestionados por plataforma;
6. documenta límites de búsqueda textual, telemetría y Git;
7. vincula 23 brechas a 30 requisitos concretos;
8. no ejecuta correcciones, repairs ni mutaciones;
9. deja la remediación forward-only para la fase de transición;
10. entrega un validador contractual verificable mediante `TREQ-SUPABASE-302`.

#### 17. Límites de la auditoría

No pudo certificarse:

- inventario completo byte a byte del árbol Git mediante clone local, porque el entorno no resolvió DNS de GitHub;
- replay de las 549 migraciones;
- equivalencia semántica de cada statement normalizado;
- hora exacta de ejecución de DDL a partir de `pg_stat_statements`;
- historia borrada por resets de estadísticas;
- procedencia de columnas para las que no existe telemetría retenida;
- configuración hosted completa de Auth, API, red y branches;
- cambios DML históricos o ediciones desde Dashboard sin auditoría propia.

Cada límite queda vinculado a `TREQ-SUPABASE-287` a `302`; no se interpreta ausencia de telemetría como ausencia de cambio.

#### 18. Declaración de no mutación

No se ejecutaron:

- DDL, DML, GRANT, REVOKE, TRUNCATE o cambios de configuración;
- `db push`, `db pull`, `db diff`, replay, squash o migration repair;
- creación, edición o eliminación de objetos remotos;
- despliegues o invocaciones de Edge Functions;
- cambios de Auth, Storage, Realtime, cron, secretos o extensiones;
- commits, branches, pull requests o workflows.

Las consultas fueron exclusivamente de catálogo, estadísticas agregadas, hashing y búsqueda read-only.

#### 19. Cierre

`SUPA-AUD-017` queda **APROBADA** como registro canónico de drift confirmado, objetos sin procedencia y límites de detección. No autoriza adoptar objetos, eliminar funciones, recrear políticas, reparar historia ni desplegar cambios.

La siguiente tarea canónica es:

```text
SUPA-AUD-018 — Identificar tablas, columnas, funciones y políticas legacy
```


### [ ] SUPA-AUD-018 — Identificar tablas, columnas, funciones y políticas legacy
### [ ] SUPA-AUD-019 — Detectar duplicidades, datos huérfanos y fuentes de verdad competidoras
### [ ] SUPA-AUD-020 — Auditar índices, consultas, planes, crecimiento y retención
### [ ] SUPA-AUD-021 — Auditar generación y consumo de tipos de base de datos
### [ ] SUPA-AUD-022 — Crear mapa objeto → capacidad empresarial preliminar → propietario actual → consumidores actuales
### [ ] SUPA-AUD-023 — Crear mapa proceso → datos → RPC → eventos → aplicaciones
### [ ] SUPA-AUD-024 — Clasificar riesgos críticos, altos, medios y deuda técnica
