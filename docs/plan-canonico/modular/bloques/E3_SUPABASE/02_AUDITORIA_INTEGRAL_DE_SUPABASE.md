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


### [ ] SUPA-AUD-002 — Clasificar esquemas administrados por Supabase y esquemas de Vento
### [ ] SUPA-AUD-003 — Identificar esquemas expuestos mediante Data API
### [ ] SUPA-AUD-004 — Inventariar tablas, particiones, vistas y vistas materializadas
### [ ] SUPA-AUD-005 — Inventariar claves primarias, foráneas, constraints, enums y secuencias
### [ ] SUPA-AUD-006 — Inventariar funciones, RPC, procedimientos y firmas públicas
### [ ] SUPA-AUD-007 — Inventariar funciones `SECURITY DEFINER` y `SECURITY INVOKER`
### [ ] SUPA-AUD-008 — Inventariar triggers y funciones ejecutadas por triggers
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
