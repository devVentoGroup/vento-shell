### MINI-BLOQUE — VINCULACIÓN CON PROCESOS Y APLICACIONES

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **vinculación con procesos y aplicaciones** dentro de **I NAVEGACIÓN Y PANTALLAS**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `AUTH-UI-011` a `AUTH-UI-014` — 4 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `AUTH-UI-011`: Asignar process_id a cada vista
- `AUTH-UI-012`: Asignar process_step a cada vista
- `AUTH-UI-013`: Definir aplicación propietaria
- `AUTH-UI-014`: Definir si la aplicación solo consume la capacidad
<!-- PLAN-SECTION-META:END -->

### ✅ AUTH-UI-011 — Asignar process_id a cada vista

**Estado:** APROBADA
**Fecha de aprobación documental:** 2026-07-28
**Bloque propietario:** BLOQUE I — Navegación, pantallas y autorización de vistas
**Marcador exacto que reemplaza:** `### [ ] AUTH-UI-011 — Asignar process_id a cada vista`
**Tarea anterior:** `AUTH-UI-010 — Auditar rutas y superficies actuales de AURA` — APROBADA
**Siguiente tarea reservada:** `AUTH-UI-012 — Asignar process_step a cada vista` — NO INICIADA
**Tipo de tarea:** reconciliación documental AS-IS entre vistas inventariadas y procesos `VPROC-*`; sin cambios de código, Supabase, navegación runtime ni despliegue

#### 1. Objetivo

Asignar un `primary_process_id` único, existente y justificable a cada vista o superficie interactiva identificada durante `AUTH-UI-001` a `AUTH-UI-010`, utilizando exclusivamente el catálogo estable `VPROC-0001` a `VPROC-0069`.

Esta tarea aplica el contrato de `PROC-SCREEN-003` al inventario técnico AS-IS. No modifica los 177 vínculos canónicos `VSCREEN-*` ya aprobados y no convierte una ruta actual en pantalla canónica.

#### 2. Frontera obligatoria

```text
VIEW_ID AS-IS
≠ VSCREEN_ID CANÓNICO

PROCESS_ID
≠ PROCESS_STEP
≠ APLICACIÓN PROPIETARIA
≠ PERMISO
≠ ELEMENTO DE MENÚ

MISMO PROCESO
≠ MISMA VISTA

ALIAS O REDIRECT
≠ NUEVA VISTA ÚNICA
```

| Decisión                                                          | Tarea propietaria             |
| ----------------------------------------------------------------- | ----------------------------- |
| Asignar `process_step`                                            | `AUTH-UI-012`                 |
| Definir aplicación propietaria                                    | `AUTH-UI-013`                 |
| Definir aplicación consumidora                                    | `AUTH-UI-014`                 |
| Clasificar intención, actores, dispositivo, frecuencia y acciones | `AUTH-UI-015` a `AUTH-UI-025` |
| Resolver duplicidad, legacy, retiro y superficies técnicas        | `AUTH-UI-026` a `AUTH-UI-029` |
| Asignar permisos, contexto y protección de servidor               | `AUTH-UI-030` a `AUTH-UI-045` |
| Mapear rutas legacy a identidades `VSCREEN-*`                     | `PROC-SCREEN-026`             |

#### 3. Fuentes consumidas

- inventarios aprobados `AUTH-UI-001` a `AUTH-UI-010`;
- catálogo estable de procesos `VPROC-0001` a `VPROC-0069`;
- `PROC-SCREEN-003` y su contrato de selección de proceso primario;
- catálogo de 177 pantallas canónicas como referencia de frontera, no como sustituto del inventario AS-IS;
- archivos locales aprobados de ANIMA, SHELL, PASS y AURA entregados en esta continuidad.

#### 4. Contrato `VIEW-PROCESS-BINDING-001`

Cada fila contiene:

| Campo                | Regla                                                  |
| -------------------- | ------------------------------------------------------ |
| `view_id`            | identificador exacto aprobado por el inventario fuente |
| `primary_process_id` | exactamente un `VPROC-*` existente                     |
| `binding_mode`       | naturaleza de la relación AS-IS                        |
| `binding_status`     | `BOUND`, `ALIAS_INHERITED` o `LEGACY_AS_IS_BOUND`      |
| `binding_reason`     | fundamento basado en intención y resultado principal   |
| `source_task`        | tarea `AUTH-UI-*` que inventarió la vista              |

No se incorpora `process_step` en esta tarea.

#### 5. Modalidades aprobadas

| Modalidad                 | Uso                                                                   |
| ------------------------- | --------------------------------------------------------------------- |
| `DIRECT_ROUTE_VIEW`       | ruta que renderiza una vista                                          |
| `DIRECT_MOBILE_SCREEN`    | pantalla móvil declarada                                              |
| `SUBORDINATE_SURFACE`     | modal, formulario, modo o estado interactivo con intención propia     |
| `EMBEDDED_VIEW`           | superficie interactiva embebida en otra vista                         |
| `ACCESS_SURFACE`          | login, recuperación, cuenta o denegación                              |
| `REDIRECT_ALIAS`          | ruta real que hereda el proceso de su destino                         |
| `GLOBAL_RECOVERY_SURFACE` | error, actualización o recuperación transversal                       |
| `WEB_AUXILIARY_VIEW`      | superficie web auxiliar que presenta interacción o información propia |
| `PLACEHOLDER_REFERENCE`   | representación visible de una aplicación aún no disponible            |
| `PUBLIC_CONSUMER_VIEW`    | vista pública que consume datos de otra aplicación                    |
| `ALIAS_OF_EXISTING_VIEW`  | segunda referencia documental a una vista ya vinculada                |

#### 6. Resultado cuantitativo

| Métrica                                 |                   Resultado |
| --------------------------------------- | --------------------------: |
| Filas de vínculo                        |                     **243** |
| Unidades de vista únicas                |                     **236** |
| Aliases documentales sin nueva vista    |                       **7** |
| Identificadores de vista duplicados     |                       **0** |
| Vistas únicas sin `primary_process_id`  |                       **0** |
| `process_id` desconocidos               |                       **0** |
| Procesos representados por vistas AS-IS |                      **38** |
| Namespace permitido                     | **VPROC-0001 a VPROC-0069** |
| Process steps asignados                 |                       **0** |
| Vistas standalone AURA                  |                       **0** |
| Requisitos nuevos                       |                      **24** |

| Inventario fuente | Filas de vínculo | Vistas únicas | Aliases |
| ----------------- | ---------------- | ------------- | ------- |
| `NEXO`            | 64               | 64            | 0       |
| `FOGO`            | 9                | 9             | 0       |
| `ORIGO`           | 13               | 13            | 0       |
| `PULSO`           | 6                | 6             | 0       |
| `VISO`            | 60               | 60            | 0       |
| `NUMERA`          | 7                | 7             | 0       |
| `ANIMA`           | 37               | 37            | 0       |
| `SHELL`           | 7                | 7             | 0       |
| `PASS`            | 10               | 10            | 0       |
| `AURA`            | 30               | 23            | 7       |

#### 7. Matriz completa `VIEW-PROCESS-BINDING-001`

##### NEXO

| View ID          | Vista o superficie                           | process_id   | Proceso                                              | Modalidad           | Estado  | Fundamento                                                                                 |
| ---------------- | -------------------------------------------- | ------------ | ---------------------------------------------------- | ------------------- | ------- | ------------------------------------------------------------------------------------------ |
| `NEXO-ROUTE-001` | `/`                                          | `VPROC-0028` | Gestionar abastecimiento interno y remisiones        | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar abastecimiento interno y remisiones.        |
| `NEXO-ROUTE-002` | `/inventory/adjust`                          | `VPROC-0026` | Gestionar conteos y ajustes de inventario            | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar conteos y ajustes de inventario.            |
| `NEXO-ROUTE-003` | `/inventory/assets`                          | `VPROC-0029` | Gestionar activos, custodia y transferencias         | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar activos, custodia y transferencias.         |
| `NEXO-ROUTE-004` | `/inventory/assets/counts`                   | `VPROC-0029` | Gestionar activos, custodia y transferencias         | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar activos, custodia y transferencias.         |
| `NEXO-ROUTE-005` | `/inventory/assets/counts/[id]`              | `VPROC-0029` | Gestionar activos, custodia y transferencias         | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar activos, custodia y transferencias.         |
| `NEXO-ROUTE-006` | `/inventory/assets/groups/[id]`              | `VPROC-0029` | Gestionar activos, custodia y transferencias         | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar activos, custodia y transferencias.         |
| `NEXO-ROUTE-007` | `/inventory/assets/items/[id]`               | `VPROC-0029` | Gestionar activos, custodia y transferencias         | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar activos, custodia y transferencias.         |
| `NEXO-ROUTE-008` | `/inventory/assets/new`                      | `VPROC-0029` | Gestionar activos, custodia y transferencias         | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar activos, custodia y transferencias.         |
| `NEXO-ROUTE-009` | `/inventory/assets/quick`                    | `VPROC-0029` | Gestionar activos, custodia y transferencias         | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar activos, custodia y transferencias.         |
| `NEXO-ROUTE-010` | `/inventory/catalog`                         | `VPROC-0015` | Gestionar ciclo de vida del catálogo de productos    | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar ciclo de vida del catálogo de productos.    |
| `NEXO-ROUTE-011` | `/inventory/catalog/[id]`                    | `VPROC-0015` | Gestionar ciclo de vida del catálogo de productos    | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar ciclo de vida del catálogo de productos.    |
| `NEXO-ROUTE-012` | `/inventory/catalog/[id]/ficha`              | `VPROC-0018` | Gestionar especificaciones y criterios de calidad    | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar especificaciones y criterios de calidad.    |
| `NEXO-ROUTE-013` | `/inventory/catalog/[id]/presentations`      | `VPROC-0015` | Gestionar ciclo de vida del catálogo de productos    | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar ciclo de vida del catálogo de productos.    |
| `NEXO-ROUTE-014` | `/inventory/catalog/new`                     | `VPROC-0015` | Gestionar ciclo de vida del catálogo de productos    | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar ciclo de vida del catálogo de productos.    |
| `NEXO-ROUTE-015` | `/inventory/catalog/presentations`           | `VPROC-0015` | Gestionar ciclo de vida del catálogo de productos    | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar ciclo de vida del catálogo de productos.    |
| `NEXO-ROUTE-016` | `/inventory/cost-center`                     | `VPROC-0054` | Gestionar costos, presupuesto, cierre y rentabilidad | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar costos, presupuesto, cierre y rentabilidad. |
| `NEXO-ROUTE-017` | `/inventory/count-initial`                   | `VPROC-0026` | Gestionar conteos y ajustes de inventario            | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar conteos y ajustes de inventario.            |
| `NEXO-ROUTE-018` | `/inventory/count-initial/session/[id]`      | `VPROC-0026` | Gestionar conteos y ajustes de inventario            | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar conteos y ajustes de inventario.            |
| `NEXO-ROUTE-019` | `/inventory/entries`                         | `VPROC-0024` | Gestionar entradas, existencia y movimientos físicos | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar entradas, existencia y movimientos físicos. |
| `NEXO-ROUTE-020` | `/inventory/locations`                       | `VPROC-0023` | Gestionar ubicaciones físicas                        | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar ubicaciones físicas.                        |
| `NEXO-ROUTE-021` | `/inventory/locations/[id]`                  | `VPROC-0023` | Gestionar ubicaciones físicas                        | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar ubicaciones físicas.                        |
| `NEXO-ROUTE-022` | `/inventory/locations/[id]/board`            | `VPROC-0024` | Gestionar entradas, existencia y movimientos físicos | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar entradas, existencia y movimientos físicos. |
| `NEXO-ROUTE-023` | `/inventory/locations/[id]/kiosk-withdraw`   | `VPROC-0025` | Gestionar retiros, transferencias y consumos         | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar retiros, transferencias y consumos.         |
| `NEXO-ROUTE-024` | `/inventory/locations/[id]/positions`        | `VPROC-0023` | Gestionar ubicaciones físicas                        | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar ubicaciones físicas.                        |
| `NEXO-ROUTE-025` | `/inventory/locations/open`                  | `VPROC-0023` | Gestionar ubicaciones físicas                        | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar ubicaciones físicas.                        |
| `NEXO-ROUTE-026` | `/inventory/locations/zone`                  | `VPROC-0024` | Gestionar entradas, existencia y movimientos físicos | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar entradas, existencia y movimientos físicos. |
| `NEXO-ROUTE-027` | `/inventory/locations/zones`                 | `VPROC-0023` | Gestionar ubicaciones físicas                        | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar ubicaciones físicas.                        |
| `NEXO-ROUTE-028` | `/inventory/lpns`                            | `VPROC-0032` | Gestionar contenedores y reutilizables               | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar contenedores y reutilizables.               |
| `NEXO-ROUTE-029` | `/inventory/movements`                       | `VPROC-0024` | Gestionar entradas, existencia y movimientos físicos | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar entradas, existencia y movimientos físicos. |
| `NEXO-ROUTE-030` | `/inventory/production-batches`              | `VPROC-0034` | Ejecutar producción                                  | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a ejecutar producción.                                  |
| `NEXO-ROUTE-031` | `/inventory/remissions`                      | `VPROC-0028` | Gestionar abastecimiento interno y remisiones        | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar abastecimiento interno y remisiones.        |
| `NEXO-ROUTE-032` | `/inventory/remissions/[id]`                 | `VPROC-0028` | Gestionar abastecimiento interno y remisiones        | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar abastecimiento interno y remisiones.        |
| `NEXO-ROUTE-033` | `/inventory/remissions/[id]/edit`            | `VPROC-0028` | Gestionar abastecimiento interno y remisiones        | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar abastecimiento interno y remisiones.        |
| `NEXO-ROUTE-034` | `/inventory/remissions/conductor`            | `VPROC-0028` | Gestionar abastecimiento interno y remisiones        | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar abastecimiento interno y remisiones.        |
| `NEXO-ROUTE-035` | `/inventory/remissions/fulfillment`          | `VPROC-0028` | Gestionar abastecimiento interno y remisiones        | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar abastecimiento interno y remisiones.        |
| `NEXO-ROUTE-036` | `/inventory/remissions/prepare`              | `VPROC-0028` | Gestionar abastecimiento interno y remisiones        | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar abastecimiento interno y remisiones.        |
| `NEXO-ROUTE-037` | `/inventory/remissions/receive`              | `VPROC-0028` | Gestionar abastecimiento interno y remisiones        | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar abastecimiento interno y remisiones.        |
| `NEXO-ROUTE-038` | `/inventory/remissions/transit`              | `VPROC-0028` | Gestionar abastecimiento interno y remisiones        | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar abastecimiento interno y remisiones.        |
| `NEXO-ROUTE-039` | `/inventory/settings`                        | `VPROC-0003` | Gobernar políticas, delegaciones y límites           | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gobernar políticas, delegaciones y límites.           |
| `NEXO-ROUTE-040` | `/inventory/settings/categories`             | `VPROC-0015` | Gestionar ciclo de vida del catálogo de productos    | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar ciclo de vida del catálogo de productos.    |
| `NEXO-ROUTE-041` | `/inventory/settings/fulfillment-routes`     | `VPROC-0028` | Gestionar abastecimiento interno y remisiones        | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar abastecimiento interno y remisiones.        |
| `NEXO-ROUTE-042` | `/inventory/settings/internal-prices`        | `VPROC-0054` | Gestionar costos, presupuesto, cierre y rentabilidad | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar costos, presupuesto, cierre y rentabilidad. |
| `NEXO-ROUTE-043` | `/inventory/settings/locations/[id]/catalog` | `VPROC-0023` | Gestionar ubicaciones físicas                        | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar ubicaciones físicas.                        |
| `NEXO-ROUTE-044` | `/inventory/settings/products`               | `VPROC-0015` | Gestionar ciclo de vida del catálogo de productos    | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar ciclo de vida del catálogo de productos.    |
| `NEXO-ROUTE-045` | `/inventory/settings/remissions`             | `VPROC-0028` | Gestionar abastecimiento interno y remisiones        | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar abastecimiento interno y remisiones.        |
| `NEXO-ROUTE-046` | `/inventory/settings/remissions/products`    | `VPROC-0028` | Gestionar abastecimiento interno y remisiones        | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar abastecimiento interno y remisiones.        |
| `NEXO-ROUTE-047` | `/inventory/settings/request-policies`       | `VPROC-0028` | Gestionar abastecimiento interno y remisiones        | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar abastecimiento interno y remisiones.        |
| `NEXO-ROUTE-048` | `/inventory/settings/sites`                  | `VPROC-0002` | Gobernar estructura organizativa                     | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gobernar estructura organizativa.                     |
| `NEXO-ROUTE-049` | `/inventory/settings/sites/[id]/operations`  | `VPROC-0002` | Gobernar estructura organizativa                     | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gobernar estructura organizativa.                     |
| `NEXO-ROUTE-050` | `/inventory/settings/supply-routes`          | `VPROC-0028` | Gestionar abastecimiento interno y remisiones        | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar abastecimiento interno y remisiones.        |
| `NEXO-ROUTE-051` | `/inventory/settings/units`                  | `VPROC-0015` | Gestionar ciclo de vida del catálogo de productos    | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar ciclo de vida del catálogo de productos.    |
| `NEXO-ROUTE-052` | `/inventory/stock`                           | `VPROC-0024` | Gestionar entradas, existencia y movimientos físicos | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar entradas, existencia y movimientos físicos. |
| `NEXO-ROUTE-053` | `/inventory/stock/assign-location`           | `VPROC-0024` | Gestionar entradas, existencia y movimientos físicos | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar entradas, existencia y movimientos físicos. |
| `NEXO-ROUTE-054` | `/inventory/transfers`                       | `VPROC-0025` | Gestionar retiros, transferencias y consumos         | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar retiros, transferencias y consumos.         |
| `NEXO-ROUTE-055` | `/inventory/warehouse`                       | `VPROC-0023` | Gestionar ubicaciones físicas                        | `REDIRECT_ALIAS`    | `BOUND` | Hereda el proceso de la vista destino sin crear otro proceso.                              |
| `NEXO-ROUTE-056` | `/inventory/withdraw`                        | `VPROC-0025` | Gestionar retiros, transferencias y consumos         | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar retiros, transferencias y consumos.         |
| `NEXO-ROUTE-057` | `/kiosk/[slug]`                              | `VPROC-0024` | Gestionar entradas, existencia y movimientos físicos | `REDIRECT_ALIAS`    | `BOUND` | Hereda el proceso de la vista destino sin crear otro proceso.                              |
| `NEXO-ROUTE-058` | `/l/[code]`                                  | `VPROC-0023` | Gestionar ubicaciones físicas                        | `REDIRECT_ALIAS`    | `BOUND` | Hereda el proceso de la vista destino sin crear otro proceso.                              |
| `NEXO-ROUTE-059` | `/login`                                     | `VPROC-0059` | Gestionar ciclo de acceso tecnológico                | `ACCESS_SURFACE`    | `BOUND` | La intención principal corresponde a gestionar ciclo de acceso tecnológico.                |
| `NEXO-ROUTE-060` | `/no-access`                                 | `VPROC-0059` | Gestionar ciclo de acceso tecnológico                | `ACCESS_SURFACE`    | `BOUND` | La intención principal corresponde a gestionar ciclo de acceso tecnológico.                |
| `NEXO-ROUTE-061` | `/printing/designer`                         | `VPROC-0015` | Gestionar ciclo de vida del catálogo de productos    | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar ciclo de vida del catálogo de productos.    |
| `NEXO-ROUTE-062` | `/printing/jobs`                             | `VPROC-0024` | Gestionar entradas, existencia y movimientos físicos | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar entradas, existencia y movimientos físicos. |
| `NEXO-ROUTE-063` | `/printing/setup`                            | `VPROC-0024` | Gestionar entradas, existencia y movimientos físicos | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar entradas, existencia y movimientos físicos. |
| `NEXO-ROUTE-064` | `/scanner`                                   | `VPROC-0023` | Gestionar ubicaciones físicas                        | `REDIRECT_ALIAS`    | `BOUND` | Hereda el proceso de la vista destino sin crear otro proceso.                              |

##### FOGO

| View ID          | Vista o superficie        | process_id   | Proceso                               | Modalidad           | Estado  | Fundamento                                                                  |
| ---------------- | ------------------------- | ------------ | ------------------------------------- | ------------------- | ------- | --------------------------------------------------------------------------- |
| `FOGO-ROUTE-001` | `/`                       | `VPROC-0033` | Planear producción                    | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a planear producción.                    |
| `FOGO-ROUTE-002` | `/login`                  | `VPROC-0059` | Gestionar ciclo de acceso tecnológico | `ACCESS_SURFACE`    | `BOUND` | La intención principal corresponde a gestionar ciclo de acceso tecnológico. |
| `FOGO-ROUTE-003` | `/no-access`              | `VPROC-0059` | Gestionar ciclo de acceso tecnológico | `ACCESS_SURFACE`    | `BOUND` | La intención principal corresponde a gestionar ciclo de acceso tecnológico. |
| `FOGO-ROUTE-004` | `/recipe-book`            | `VPROC-0016` | Gestionar ciclo de vida de recetas    | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar ciclo de vida de recetas.    |
| `FOGO-ROUTE-005` | `/recipes`                | `VPROC-0016` | Gestionar ciclo de vida de recetas    | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar ciclo de vida de recetas.    |
| `FOGO-ROUTE-006` | `/recipes/new`            | `VPROC-0016` | Gestionar ciclo de vida de recetas    | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar ciclo de vida de recetas.    |
| `FOGO-ROUTE-007` | `/recipes/[id]/edit`      | `VPROC-0016` | Gestionar ciclo de vida de recetas    | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar ciclo de vida de recetas.    |
| `FOGO-ROUTE-008` | `/production-batches`     | `VPROC-0034` | Ejecutar producción                   | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a ejecutar producción.                   |
| `FOGO-ROUTE-009` | `/production-batches/new` | `VPROC-0034` | Ejecutar producción                   | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a ejecutar producción.                   |

##### ORIGO

| View ID           | Vista o superficie           | process_id   | Proceso                                           | Modalidad           | Estado  | Fundamento                                                                              |
| ----------------- | ---------------------------- | ------------ | ------------------------------------------------- | ------------------- | ------- | --------------------------------------------------------------------------------------- |
| `ORIGO-ROUTE-001` | `/`                          | `VPROC-0019` | Gestionar necesidades y solicitudes de compra     | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar necesidades y solicitudes de compra.     |
| `ORIGO-ROUTE-002` | `/login`                     | `VPROC-0059` | Gestionar ciclo de acceso tecnológico             | `ACCESS_SURFACE`    | `BOUND` | La intención principal corresponde a gestionar ciclo de acceso tecnológico.             |
| `ORIGO-ROUTE-003` | `/no-access`                 | `VPROC-0059` | Gestionar ciclo de acceso tecnológico             | `ACCESS_SURFACE`    | `BOUND` | La intención principal corresponde a gestionar ciclo de acceso tecnológico.             |
| `ORIGO-ROUTE-004` | `/product-master-review`     | `VPROC-0015` | Gestionar ciclo de vida del catálogo de productos | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar ciclo de vida del catálogo de productos. |
| `ORIGO-ROUTE-005` | `/purchase-orders`           | `VPROC-0021` | Aprobar y emitir órdenes de compra                | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a aprobar y emitir órdenes de compra.                |
| `ORIGO-ROUTE-006` | `/purchase-orders/[id]`      | `VPROC-0021` | Aprobar y emitir órdenes de compra                | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a aprobar y emitir órdenes de compra.                |
| `ORIGO-ROUTE-007` | `/purchase-orders/[id]/edit` | `VPROC-0021` | Aprobar y emitir órdenes de compra                | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a aprobar y emitir órdenes de compra.                |
| `ORIGO-ROUTE-008` | `/purchase-orders/new`       | `VPROC-0021` | Aprobar y emitir órdenes de compra                | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a aprobar y emitir órdenes de compra.                |
| `ORIGO-ROUTE-009` | `/receipts`                  | `VPROC-0022` | Gestionar recepción de compra y diferencias       | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar recepción de compra y diferencias.       |
| `ORIGO-ROUTE-010` | `/receipts/new`              | `VPROC-0022` | Gestionar recepción de compra y diferencias       | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar recepción de compra y diferencias.       |
| `ORIGO-ROUTE-011` | `/suppliers`                 | `VPROC-0020` | Gestionar proveedores, cotizaciones y condiciones | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar proveedores, cotizaciones y condiciones. |
| `ORIGO-ROUTE-012` | `/suppliers/[id]/edit`       | `VPROC-0020` | Gestionar proveedores, cotizaciones y condiciones | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar proveedores, cotizaciones y condiciones. |
| `ORIGO-ROUTE-013` | `/suppliers/new`             | `VPROC-0020` | Gestionar proveedores, cotizaciones y condiciones | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar proveedores, cotizaciones y condiciones. |

##### PULSO

| View ID           | Vista o superficie | process_id   | Proceso                                       | Modalidad           | Estado  | Fundamento                                                                                                              |
| ----------------- | ------------------ | ------------ | --------------------------------------------- | ------------------- | ------- | ----------------------------------------------------------------------------------------------------------------------- |
| `PULSO-ROUTE-001` | `/`                | `VPROC-0045` | Gestionar identidad de cliente y fidelización | `DIRECT_ROUTE_VIEW` | `BOUND` | Comparte intención e implementación con la otra entrada del escáner, pero conserva identidad de ruta hasta AUTH-UI-026. |
| `PULSO-ROUTE-002` | `/no-access`       | `VPROC-0059` | Gestionar ciclo de acceso tecnológico         | `ACCESS_SURFACE`    | `BOUND` | La intención principal corresponde a gestionar ciclo de acceso tecnológico.                                             |
| `PULSO-ROUTE-003` | `/orders`          | `VPROC-0039` | Gestionar venta de mostrador o para llevar    | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar venta de mostrador o para llevar.                                        |
| `PULSO-ROUTE-004` | `/sales-imports`   | `VPROC-0051` | Registrar y conciliar hechos económicos       | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a registrar y conciliar hechos económicos.                                           |
| `PULSO-ROUTE-005` | `/salon`           | `VPROC-0038` | Gestionar servicio en mesa                    | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar servicio en mesa.                                                        |
| `PULSO-ROUTE-006` | `/scanner`         | `VPROC-0045` | Gestionar identidad de cliente y fidelización | `DIRECT_ROUTE_VIEW` | `BOUND` | Comparte intención e implementación con la otra entrada del escáner, pero conserva identidad de ruta hasta AUTH-UI-026. |

##### VISO

| View ID          | Vista o superficie                   | process_id   | Proceso                                             | Modalidad           | Estado               | Fundamento                                                                                      |
| ---------------- | ------------------------------------ | ------------ | --------------------------------------------------- | ------------------- | -------------------- | ----------------------------------------------------------------------------------------------- |
| `VISO-ROUTE-001` | `/`                                  | `VPROC-0001` | Gobernar decisiones empresariales                   | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gobernar decisiones empresariales.                         |
| `VISO-ROUTE-002` | `/login`                             | `VPROC-0059` | Gestionar ciclo de acceso tecnológico               | `ACCESS_SURFACE`    | `BOUND`              | La intención principal corresponde a gestionar ciclo de acceso tecnológico.                     |
| `VISO-ROUTE-003` | `/no-access`                         | `VPROC-0059` | Gestionar ciclo de acceso tecnológico               | `ACCESS_SURFACE`    | `BOUND`              | La intención principal corresponde a gestionar ciclo de acceso tecnológico.                     |
| `VISO-ROUTE-004` | `/accounting`                        | `VPROC-0051` | Registrar y conciliar hechos económicos             | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a registrar y conciliar hechos económicos.                   |
| `VISO-ROUTE-005` | `/app-navigation`                    | `VPROC-0059` | Gestionar ciclo de acceso tecnológico               | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar ciclo de acceso tecnológico.                     |
| `VISO-ROUTE-006` | `/app-updates`                       | `VPROC-0058` | Gestionar solicitudes e incidentes tecnológicos     | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar solicitudes e incidentes tecnológicos.           |
| `VISO-ROUTE-007` | `/businesses`                        | `VPROC-0002` | Gobernar estructura organizativa                    | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gobernar estructura organizativa.                          |
| `VISO-ROUTE-008` | `/businesses/new`                    | `VPROC-0002` | Gobernar estructura organizativa                    | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gobernar estructura organizativa.                          |
| `VISO-ROUTE-009` | `/businesses/[id]`                   | `VPROC-0002` | Gobernar estructura organizativa                    | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gobernar estructura organizativa.                          |
| `VISO-ROUTE-010` | `/commercial-audit`                  | `VPROC-0061` | Gestionar medición, análisis y mejora               | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar medición, análisis y mejora.                     |
| `VISO-ROUTE-011` | `/commercial-audit/structure`        | `VPROC-0061` | Gestionar medición, análisis y mejora               | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar medición, análisis y mejora.                     |
| `VISO-ROUTE-012` | `/commercial-availability`           | `VPROC-0017` | Gestionar oferta, precio y disponibilidad comercial | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar oferta, precio y disponibilidad comercial.       |
| `VISO-ROUTE-013` | `/commercial-categories`             | `VPROC-0017` | Gestionar oferta, precio y disponibilidad comercial | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar oferta, precio y disponibilidad comercial.       |
| `VISO-ROUTE-014` | `/commercial-collections`            | `VPROC-0017` | Gestionar oferta, precio y disponibilidad comercial | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar oferta, precio y disponibilidad comercial.       |
| `VISO-ROUTE-015` | `/commercial-collections/overview`   | `VPROC-0017` | Gestionar oferta, precio y disponibilidad comercial | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar oferta, precio y disponibilidad comercial.       |
| `VISO-ROUTE-016` | `/commercial-menu`                   | `VPROC-0017` | Gestionar oferta, precio y disponibilidad comercial | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar oferta, precio y disponibilidad comercial.       |
| `VISO-ROUTE-017` | `/content-blocks`                    | `VPROC-0056` | Gestionar contenido y promociones                   | `DIRECT_ROUTE_VIEW` | `LEGACY_AS_IS_BOUND` | Vinculación AS-IS a contenido y promociones; no activa AURA ni crea una pantalla canónica AURA. |
| `VISO-ROUTE-018` | `/content-blocks/[id]`               | `VPROC-0056` | Gestionar contenido y promociones                   | `DIRECT_ROUTE_VIEW` | `LEGACY_AS_IS_BOUND` | Vinculación AS-IS a contenido y promociones; no activa AURA ni crea una pantalla canónica AURA. |
| `VISO-ROUTE-019` | `/delivery-rates`                    | `VPROC-0050` | Gestionar entrega mediante tercero                  | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar entrega mediante tercero.                        |
| `VISO-ROUTE-020` | `/menu`                              | `VPROC-0017` | Gestionar oferta, precio y disponibilidad comercial | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar oferta, precio y disponibilidad comercial.       |
| `VISO-ROUTE-021` | `/menu/new`                          | `VPROC-0017` | Gestionar oferta, precio y disponibilidad comercial | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar oferta, precio y disponibilidad comercial.       |
| `VISO-ROUTE-022` | `/menu/[id]`                         | `VPROC-0017` | Gestionar oferta, precio y disponibilidad comercial | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar oferta, precio y disponibilidad comercial.       |
| `VISO-ROUTE-023` | `/menu/[id]/personalizations/manage` | `VPROC-0017` | Gestionar oferta, precio y disponibilidad comercial | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar oferta, precio y disponibilidad comercial.       |
| `VISO-ROUTE-024` | `/operations`                        | `VPROC-0007` | Gestionar asignación y programación laboral         | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar asignación y programación laboral.               |
| `VISO-ROUTE-025` | `/operations/checkin-points`         | `VPROC-0008` | Gestionar asistencia y marcaciones                  | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar asistencia y marcaciones.                        |
| `VISO-ROUTE-026` | `/operations/employee-profiles`      | `VPROC-0007` | Gestionar asignación y programación laboral         | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar asignación y programación laboral.               |
| `VISO-ROUTE-027` | `/operations/preview`                | `VPROC-0059` | Gestionar ciclo de acceso tecnológico               | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar ciclo de acceso tecnológico.                     |
| `VISO-ROUTE-028` | `/operations/site-roles`             | `VPROC-0007` | Gestionar asignación y programación laboral         | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar asignación y programación laboral.               |
| `VISO-ROUTE-029` | `/operations-map`                    | `VPROC-0002` | Gobernar estructura organizativa                    | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gobernar estructura organizativa.                          |
| `VISO-ROUTE-030` | `/ops/audit`                         | `VPROC-0061` | Gestionar medición, análisis y mejora               | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar medición, análisis y mejora.                     |
| `VISO-ROUTE-031` | `/pass-users`                        | `VPROC-0045` | Gestionar identidad de cliente y fidelización       | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar identidad de cliente y fidelización.             |
| `VISO-ROUTE-032` | `/pass-users/new`                    | `VPROC-0045` | Gestionar identidad de cliente y fidelización       | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar identidad de cliente y fidelización.             |
| `VISO-ROUTE-033` | `/pass-users/[id]`                   | `VPROC-0045` | Gestionar identidad de cliente y fidelización       | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar identidad de cliente y fidelización.             |
| `VISO-ROUTE-034` | `/products`                          | `VPROC-0015` | Gestionar ciclo de vida del catálogo de productos   | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar ciclo de vida del catálogo de productos.         |
| `VISO-ROUTE-035` | `/products/new`                      | `VPROC-0015` | Gestionar ciclo de vida del catálogo de productos   | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar ciclo de vida del catálogo de productos.         |
| `VISO-ROUTE-036` | `/products/[id]`                     | `VPROC-0015` | Gestionar ciclo de vida del catálogo de productos   | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar ciclo de vida del catálogo de productos.         |
| `VISO-ROUTE-037` | `/roles-permissions`                 | `VPROC-0059` | Gestionar ciclo de acceso tecnológico               | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar ciclo de acceso tecnológico.                     |
| `VISO-ROUTE-038` | `/sites`                             | `VPROC-0002` | Gobernar estructura organizativa                    | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gobernar estructura organizativa.                          |
| `VISO-ROUTE-039` | `/sites/[id]`                        | `VPROC-0002` | Gobernar estructura organizativa                    | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gobernar estructura organizativa.                          |
| `VISO-ROUTE-040` | `/sites/[id]/documentos`             | `VPROC-0060` | Gestionar documentos y evidencia                    | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar documentos y evidencia.                          |
| `VISO-ROUTE-041` | `/staff`                             | `VPROC-0006` | Gestionar vinculación e incorporación laboral       | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar vinculación e incorporación laboral.             |
| `VISO-ROUTE-042` | `/staff/new`                         | `VPROC-0006` | Gestionar vinculación e incorporación laboral       | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar vinculación e incorporación laboral.             |
| `VISO-ROUTE-043` | `/staff/[id]`                        | `VPROC-0006` | Gestionar vinculación e incorporación laboral       | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar vinculación e incorporación laboral.             |
| `VISO-ROUTE-044` | `/staff/attendance`                  | `VPROC-0008` | Gestionar asistencia y marcaciones                  | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar asistencia y marcaciones.                        |
| `VISO-ROUTE-045` | `/staff/calendar`                    | `VPROC-0007` | Gestionar asignación y programación laboral         | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar asignación y programación laboral.               |
| `VISO-ROUTE-046` | `/staff/schedule`                    | `VPROC-0007` | Gestionar asignación y programación laboral         | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar asignación y programación laboral.               |
| `VISO-ROUTE-047` | `/staff/schedule/global`             | `VPROC-0007` | Gestionar asignación y programación laboral         | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar asignación y programación laboral.               |
| `VISO-ROUTE-048` | `/staff/schedule/metrics`            | `VPROC-0061` | Gestionar medición, análisis y mejora               | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar medición, análisis y mejora.                     |
| `VISO-ROUTE-049` | `/staff/schedule/settings`           | `VPROC-0007` | Gestionar asignación y programación laboral         | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar asignación y programación laboral.               |
| `VISO-ROUTE-050` | `/staff/shared-devices/new`          | `VPROC-0059` | Gestionar ciclo de acceso tecnológico               | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar ciclo de acceso tecnológico.                     |
| `VISO-ROUTE-051` | `/vacancies`                         | `VPROC-0005` | Gestionar reclutamiento y selección                 | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar reclutamiento y selección.                       |
| `VISO-ROUTE-052` | `/vacancies/new`                     | `VPROC-0005` | Gestionar reclutamiento y selección                 | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar reclutamiento y selección.                       |
| `VISO-ROUTE-053` | `/vacancies/[id]`                    | `VPROC-0005` | Gestionar reclutamiento y selección                 | `DIRECT_ROUTE_VIEW` | `BOUND`              | La intención principal corresponde a gestionar reclutamiento y selección.                       |
| `VISO-ROUTE-054` | `/website-cms`                       | `VPROC-0056` | Gestionar contenido y promociones                   | `DIRECT_ROUTE_VIEW` | `LEGACY_AS_IS_BOUND` | Vinculación AS-IS a contenido y promociones; no activa AURA ni crea una pantalla canónica AURA. |
| `VISO-ROUTE-055` | `/website-cms/blocks/new`            | `VPROC-0056` | Gestionar contenido y promociones                   | `DIRECT_ROUTE_VIEW` | `LEGACY_AS_IS_BOUND` | Vinculación AS-IS a contenido y promociones; no activa AURA ni crea una pantalla canónica AURA. |
| `VISO-ROUTE-056` | `/website-cms/blocks/[id]`           | `VPROC-0056` | Gestionar contenido y promociones                   | `DIRECT_ROUTE_VIEW` | `LEGACY_AS_IS_BOUND` | Vinculación AS-IS a contenido y promociones; no activa AURA ni crea una pantalla canónica AURA. |
| `VISO-ROUTE-057` | `/website-cms/items/new`             | `VPROC-0056` | Gestionar contenido y promociones                   | `DIRECT_ROUTE_VIEW` | `LEGACY_AS_IS_BOUND` | Vinculación AS-IS a contenido y promociones; no activa AURA ni crea una pantalla canónica AURA. |
| `VISO-ROUTE-058` | `/website-cms/items/[id]`            | `VPROC-0056` | Gestionar contenido y promociones                   | `DIRECT_ROUTE_VIEW` | `LEGACY_AS_IS_BOUND` | Vinculación AS-IS a contenido y promociones; no activa AURA ni crea una pantalla canónica AURA. |
| `VISO-ROUTE-059` | `/website-cms/venues`                | `VPROC-0056` | Gestionar contenido y promociones                   | `DIRECT_ROUTE_VIEW` | `LEGACY_AS_IS_BOUND` | Vinculación AS-IS a contenido y promociones; no activa AURA ni crea una pantalla canónica AURA. |
| `VISO-ROUTE-060` | `/website-cms/venues/[slug]`         | `VPROC-0056` | Gestionar contenido y promociones                   | `DIRECT_ROUTE_VIEW` | `LEGACY_AS_IS_BOUND` | Vinculación AS-IS a contenido y promociones; no activa AURA ni crea una pantalla canónica AURA. |

##### NUMERA

| View ID            | Vista o superficie | process_id   | Proceso                                              | Modalidad           | Estado  | Fundamento                                                                                 |
| ------------------ | ------------------ | ------------ | ---------------------------------------------------- | ------------------- | ------- | ------------------------------------------------------------------------------------------ |
| `NUMERA-ROUTE-001` | `/`                | `VPROC-0061` | Gestionar medición, análisis y mejora                | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar medición, análisis y mejora.                |
| `NUMERA-ROUTE-002` | `/login`           | `VPROC-0059` | Gestionar ciclo de acceso tecnológico                | `ACCESS_SURFACE`    | `BOUND` | La intención principal corresponde a gestionar ciclo de acceso tecnológico.                |
| `NUMERA-ROUTE-003` | `/no-access`       | `VPROC-0059` | Gestionar ciclo de acceso tecnológico                | `ACCESS_SURFACE`    | `BOUND` | La intención principal corresponde a gestionar ciclo de acceso tecnológico.                |
| `NUMERA-ROUTE-004` | `/cost-centers`    | `VPROC-0054` | Gestionar costos, presupuesto, cierre y rentabilidad | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar costos, presupuesto, cierre y rentabilidad. |
| `NUMERA-ROUTE-005` | `/expenses`        | `VPROC-0051` | Registrar y conciliar hechos económicos              | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a registrar y conciliar hechos económicos.              |
| `NUMERA-ROUTE-006` | `/break-even`      | `VPROC-0054` | Gestionar costos, presupuesto, cierre y rentabilidad | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar costos, presupuesto, cierre y rentabilidad. |
| `NUMERA-ROUTE-007` | `/profitability`   | `VPROC-0054` | Gestionar costos, presupuesto, cierre y rentabilidad | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar costos, presupuesto, cierre y rentabilidad. |

##### ANIMA

| View ID             | Vista o superficie                    | process_id   | Proceso                                         | Modalidad                 | Estado  | Fundamento                                                                            |
| ------------------- | ------------------------------------- | ------------ | ----------------------------------------------- | ------------------------- | ------- | ------------------------------------------------------------------------------------- |
| `ANIMA-SCREEN-001`  | `/`                                   | `VPROC-0059` | Gestionar ciclo de acceso tecnológico           | `DIRECT_MOBILE_SCREEN`    | `BOUND` | La intención principal corresponde a gestionar ciclo de acceso tecnológico.           |
| `ANIMA-SCREEN-002`  | `/splash`                             | `VPROC-0059` | Gestionar ciclo de acceso tecnológico           | `DIRECT_MOBILE_SCREEN`    | `BOUND` | La intención principal corresponde a gestionar ciclo de acceso tecnológico.           |
| `ANIMA-SCREEN-003`  | `/login`                              | `VPROC-0059` | Gestionar ciclo de acceso tecnológico           | `DIRECT_MOBILE_SCREEN`    | `BOUND` | La intención principal corresponde a gestionar ciclo de acceso tecnológico.           |
| `ANIMA-SCREEN-004`  | `/home`                               | `VPROC-0008` | Gestionar asistencia y marcaciones              | `DIRECT_MOBILE_SCREEN`    | `BOUND` | La intención principal corresponde a gestionar asistencia y marcaciones.              |
| `ANIMA-SCREEN-005`  | `/shifts`                             | `VPROC-0007` | Gestionar asignación y programación laboral     | `DIRECT_MOBILE_SCREEN`    | `BOUND` | La intención principal corresponde a gestionar asignación y programación laboral.     |
| `ANIMA-SCREEN-006`  | `/history`                            | `VPROC-0008` | Gestionar asistencia y marcaciones              | `DIRECT_MOBILE_SCREEN`    | `BOUND` | La intención principal corresponde a gestionar asistencia y marcaciones.              |
| `ANIMA-SCREEN-007`  | `/documents`                          | `VPROC-0060` | Gestionar documentos y evidencia                | `DIRECT_MOBILE_SCREEN`    | `BOUND` | La intención principal corresponde a gestionar documentos y evidencia.                |
| `ANIMA-SCREEN-008`  | `/carnet`                             | `VPROC-0006` | Gestionar vinculación e incorporación laboral   | `DIRECT_MOBILE_SCREEN`    | `BOUND` | La intención principal corresponde a gestionar vinculación e incorporación laboral.   |
| `ANIMA-SCREEN-009`  | `/announcements`                      | `VPROC-0004` | Gestionar compromisos y comunicaciones internas | `DIRECT_MOBILE_SCREEN`    | `BOUND` | La intención principal corresponde a gestionar compromisos y comunicaciones internas. |
| `ANIMA-SCREEN-010`  | `/operativo`                          | `VPROC-0061` | Gestionar medición, análisis y mejora           | `DIRECT_MOBILE_SCREEN`    | `BOUND` | La intención principal corresponde a gestionar medición, análisis y mejora.           |
| `ANIMA-SCREEN-011`  | `/team`                               | `VPROC-0006` | Gestionar vinculación e incorporación laboral   | `DIRECT_MOBILE_SCREEN`    | `BOUND` | La intención principal corresponde a gestionar vinculación e incorporación laboral.   |
| `ANIMA-SCREEN-012`  | `/support`                            | `VPROC-0058` | Gestionar solicitudes e incidentes tecnológicos | `DIRECT_MOBILE_SCREEN`    | `BOUND` | La intención principal corresponde a gestionar solicitudes e incidentes tecnológicos. |
| `ANIMA-SCREEN-013`  | `/account-settings`                   | `VPROC-0059` | Gestionar ciclo de acceso tecnológico           | `DIRECT_MOBILE_SCREEN`    | `BOUND` | La intención principal corresponde a gestionar ciclo de acceso tecnológico.           |
| `ANIMA-SCREEN-014`  | `/anima-diagnostics`                  | `VPROC-0058` | Gestionar solicitudes e incidentes tecnológicos | `DIRECT_MOBILE_SCREEN`    | `BOUND` | La intención principal corresponde a gestionar solicitudes e incidentes tecnológicos. |
| `ANIMA-SURFACE-001` | `SitePickerModal`                     | `VPROC-0008` | Gestionar asistencia y marcaciones              | `SUBORDINATE_SURFACE`     | `BOUND` | La intención principal corresponde a gestionar asistencia y marcaciones.              |
| `ANIMA-SURFACE-002` | `UserMenuModal`                       | `VPROC-0059` | Gestionar ciclo de acceso tecnológico           | `SUBORDINATE_SURFACE`     | `BOUND` | La intención principal corresponde a gestionar ciclo de acceso tecnológico.           |
| `ANIMA-SURFACE-003` | `CreateShiftModal`                    | `VPROC-0007` | Gestionar asignación y programación laboral     | `SUBORDINATE_SURFACE`     | `BOUND` | La intención principal corresponde a gestionar asignación y programación laboral.     |
| `ANIMA-SURFACE-004` | `EditShiftModal`                      | `VPROC-0007` | Gestionar asignación y programación laboral     | `SUBORDINATE_SURFACE`     | `BOUND` | La intención principal corresponde a gestionar asignación y programación laboral.     |
| `ANIMA-SURFACE-005` | `HistoryDetailModal`                  | `VPROC-0008` | Gestionar asistencia y marcaciones              | `SUBORDINATE_SURFACE`     | `BOUND` | La intención principal corresponde a gestionar asistencia y marcaciones.              |
| `ANIMA-SURFACE-006` | `HistoryIncidentModal`                | `VPROC-0008` | Gestionar asistencia y marcaciones              | `SUBORDINATE_SURFACE`     | `BOUND` | La intención principal corresponde a gestionar asistencia y marcaciones.              |
| `ANIMA-SURFACE-007` | `UploadDocumentModal`                 | `VPROC-0060` | Gestionar documentos y evidencia                | `SUBORDINATE_SURFACE`     | `BOUND` | La intención principal corresponde a gestionar documentos y evidencia.                |
| `ANIMA-SURFACE-008` | `DocumentPickerModal`                 | `VPROC-0060` | Gestionar documentos y evidencia                | `SUBORDINATE_SURFACE`     | `BOUND` | La intención principal corresponde a gestionar documentos y evidencia.                |
| `ANIMA-SURFACE-009` | `AnnouncementFormModal`               | `VPROC-0004` | Gestionar compromisos y comunicaciones internas | `SUBORDINATE_SURFACE`     | `BOUND` | La intención principal corresponde a gestionar compromisos y comunicaciones internas. |
| `ANIMA-SURFACE-010` | `TeamEditModal`                       | `VPROC-0006` | Gestionar vinculación e incorporación laboral   | `SUBORDINATE_SURFACE`     | `BOUND` | La intención principal corresponde a gestionar vinculación e incorporación laboral.   |
| `ANIMA-SURFACE-011` | `TeamInviteModal`                     | `VPROC-0006` | Gestionar vinculación e incorporación laboral   | `SUBORDINATE_SURFACE`     | `BOUND` | La intención principal corresponde a gestionar vinculación e incorporación laboral.   |
| `ANIMA-SURFACE-012` | `TeamDeleteModal`                     | `VPROC-0011` | Gestionar retiro y revocación coordinada        | `SUBORDINATE_SURFACE`     | `BOUND` | La intención principal corresponde a gestionar retiro y revocación coordinada.        |
| `ANIMA-SURFACE-013` | `SupportTicketModal`                  | `VPROC-0058` | Gestionar solicitudes e incidentes tecnológicos | `SUBORDINATE_SURFACE`     | `BOUND` | La intención principal corresponde a gestionar solicitudes e incidentes tecnológicos. |
| `ANIMA-SURFACE-014` | `ContactWorkerModal`                  | `VPROC-0004` | Gestionar compromisos y comunicaciones internas | `SUBORDINATE_SURFACE`     | `BOUND` | La intención principal corresponde a gestionar compromisos y comunicaciones internas. |
| `ANIMA-SURFACE-015` | `DataCleanupFlow`                     | `VPROC-0060` | Gestionar documentos y evidencia                | `SUBORDINATE_SURFACE`     | `BOUND` | La intención principal corresponde a gestionar documentos y evidencia.                |
| `ANIMA-SURFACE-016` | `DeleteAccountFlow`                   | `VPROC-0059` | Gestionar ciclo de acceso tecnológico           | `SUBORDINATE_SURFACE`     | `BOUND` | La intención principal corresponde a gestionar ciclo de acceso tecnológico.           |
| `ANIMA-GLOBAL-001`  | `ErrorBoundary`                       | `VPROC-0062` | Gestionar continuidad y recuperación            | `GLOBAL_RECOVERY_SURFACE` | `BOUND` | La intención principal corresponde a gestionar continuidad y recuperación.            |
| `ANIMA-GLOBAL-002`  | `AppUpdateGate`                       | `VPROC-0058` | Gestionar solicitudes e incidentes tecnológicos | `GLOBAL_RECOVERY_SURFACE` | `BOUND` | La intención principal corresponde a gestionar solicitudes e incidentes tecnológicos. |
| `ANIMA-WEB-AUX-001` | `/api/request-password`               | `VPROC-0059` | Gestionar ciclo de acceso tecnológico           | `WEB_AUXILIARY_VIEW`      | `BOUND` | La intención principal corresponde a gestionar ciclo de acceso tecnológico.           |
| `ANIMA-WEB-AUX-002` | `/api/set-password`                   | `VPROC-0059` | Gestionar ciclo de acceso tecnológico           | `WEB_AUXILIARY_VIEW`      | `BOUND` | La intención principal corresponde a gestionar ciclo de acceso tecnológico.           |
| `ANIMA-WEB-AUX-003` | `/privacy-policy`                     | `VPROC-0060` | Gestionar documentos y evidencia                | `WEB_AUXILIARY_VIEW`      | `BOUND` | La intención principal corresponde a gestionar documentos y evidencia.                |
| `ANIMA-WEB-AUX-004` | `/delete-account; /eliminar-cuenta`   | `VPROC-0059` | Gestionar ciclo de acceso tecnológico           | `WEB_AUXILIARY_VIEW`      | `BOUND` | La intención principal corresponde a gestionar ciclo de acceso tecnológico.           |
| `ANIMA-WEB-AUX-005` | `web-auth index sin patrón explícito` | `VPROC-0059` | Gestionar ciclo de acceso tecnológico           | `WEB_AUXILIARY_VIEW`      | `BOUND` | La intención principal corresponde a gestionar ciclo de acceso tecnológico.           |

##### SHELL

| View ID             | Vista o superficie        | process_id   | Proceso                               | Modalidad           | Estado  | Fundamento                                                                  |
| ------------------- | ------------------------- | ------------ | ------------------------------------- | ------------------- | ------- | --------------------------------------------------------------------------- |
| `SHELL-SURFACE-001` | `/ — Hub y launcher`      | `VPROC-0059` | Gestionar ciclo de acceso tecnológico | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar ciclo de acceso tecnológico. |
| `SHELL-SURFACE-002` | `/login — Acceso central` | `VPROC-0059` | Gestionar ciclo de acceso tecnológico | `DIRECT_ROUTE_VIEW` | `BOUND` | La intención principal corresponde a gestionar ciclo de acceso tecnológico. |
| `SHELL-SURFACE-003` | `Tarjetas del launcher`   | `VPROC-0059` | Gestionar ciclo de acceso tecnológico | `EMBEDDED_VIEW`     | `BOUND` | La intención principal corresponde a gestionar ciclo de acceso tecnológico. |
| `SHELL-SURFACE-004` | `Rail de logos`           | `VPROC-0059` | Gestionar ciclo de acceso tecnológico | `EMBEDDED_VIEW`     | `BOUND` | La intención principal corresponde a gestionar ciclo de acceso tecnológico. |
| `SHELL-SURFACE-005` | `Menú de sesión`          | `VPROC-0059` | Gestionar ciclo de acceso tecnológico | `EMBEDDED_VIEW`     | `BOUND` | La intención principal corresponde a gestionar ciclo de acceso tecnológico. |
| `SHELL-SURFACE-006` | `Formulario de acceso`    | `VPROC-0059` | Gestionar ciclo de acceso tecnológico | `EMBEDDED_VIEW`     | `BOUND` | La intención principal corresponde a gestionar ciclo de acceso tecnológico. |
| `SHELL-SURFACE-007` | `Modal de recuperación`   | `VPROC-0059` | Gestionar ciclo de acceso tecnológico | `EMBEDDED_VIEW`     | `BOUND` | La intención principal corresponde a gestionar ciclo de acceso tecnológico. |

##### PASS

| View ID                  | Vista o superficie                                    | process_id   | Proceso                                       | Modalidad             | Estado  | Fundamento                                                                          |
| ------------------------ | ----------------------------------------------------- | ------------ | --------------------------------------------- | --------------------- | ------- | ----------------------------------------------------------------------------------- |
| `PASS-LABOR-SURFACE-001` | `Contexto laboral en Header`                          | `VPROC-0059` | Gestionar ciclo de acceso tecnológico         | `EMBEDDED_VIEW`       | `BOUND` | La intención principal corresponde a gestionar ciclo de acceso tecnológico.         |
| `PASS-LABOR-SURFACE-002` | `Acciones de cambio o restablecimiento de rol y sede` | `VPROC-0059` | Gestionar ciclo de acceso tecnológico         | `EMBEDDED_VIEW`       | `BOUND` | La intención principal corresponde a gestionar ciclo de acceso tecnológico.         |
| `PASS-LABOR-SURFACE-003` | `Modal Modo de prueba`                                | `VPROC-0059` | Gestionar ciclo de acceso tecnológico         | `EMBEDDED_VIEW`       | `BOUND` | La intención principal corresponde a gestionar ciclo de acceso tecnológico.         |
| `PULSO-PASS-SURFACE-001` | `/scanner — contenedor PASS`                          | `VPROC-0045` | Gestionar identidad de cliente y fidelización | `SUBORDINATE_SURFACE` | `BOUND` | La intención principal corresponde a gestionar identidad de cliente y fidelización. |
| `PULSO-PASS-SURFACE-002` | `Modo identificación`                                 | `VPROC-0045` | Gestionar identidad de cliente y fidelización | `SUBORDINATE_SURFACE` | `BOUND` | La intención principal corresponde a gestionar identidad de cliente y fidelización. |
| `PULSO-PASS-SURFACE-003` | `Tarjeta de cliente seleccionado`                     | `VPROC-0045` | Gestionar identidad de cliente y fidelización | `SUBORDINATE_SURFACE` | `BOUND` | La intención principal corresponde a gestionar identidad de cliente y fidelización. |
| `PULSO-PASS-SURFACE-004` | `Formulario para otorgar puntos`                      | `VPROC-0045` | Gestionar identidad de cliente y fidelización | `SUBORDINATE_SURFACE` | `BOUND` | La intención principal corresponde a gestionar identidad de cliente y fidelización. |
| `PULSO-PASS-SURFACE-005` | `Modo redención`                                      | `VPROC-0045` | Gestionar identidad de cliente y fidelización | `SUBORDINATE_SURFACE` | `BOUND` | La intención principal corresponde a gestionar identidad de cliente y fidelización. |
| `PULSO-PASS-SURFACE-006` | `Firma por PIN en dispositivo compartido`             | `VPROC-0059` | Gestionar ciclo de acceso tecnológico         | `SUBORDINATE_SURFACE` | `BOUND` | La intención principal corresponde a gestionar ciclo de acceso tecnológico.         |
| `PULSO-PASS-SURFACE-007` | `Estados de carga, éxito y error`                     | `VPROC-0045` | Gestionar identidad de cliente y fidelización | `SUBORDINATE_SURFACE` | `BOUND` | La intención principal corresponde a gestionar identidad de cliente y fidelización. |

##### AURA

| View ID                        | Vista o superficie                                | process_id   | Proceso                                             | Modalidad                | Estado               | Fundamento                                                                                         |
| ------------------------------ | ------------------------------------------------- | ------------ | --------------------------------------------------- | ------------------------ | -------------------- | -------------------------------------------------------------------------------------------------- |
| `AURA-PLACEHOLDER-001`         | `AppSwitcher AURA soon en aplicación consumidora` | `VPROC-0059` | Gestionar ciclo de acceso tecnológico               | `PLACEHOLDER_REFERENCE`  | `BOUND`              | La representación pertenece a navegación o acceso; no ejecuta contenido ni activa AURA.            |
| `AURA-PLACEHOLDER-002`         | `AppSwitcher AURA soon en aplicación consumidora` | `VPROC-0059` | Gestionar ciclo de acceso tecnológico               | `PLACEHOLDER_REFERENCE`  | `BOUND`              | La representación pertenece a navegación o acceso; no ejecuta contenido ni activa AURA.            |
| `AURA-PLACEHOLDER-003`         | `AppSwitcher AURA soon en aplicación consumidora` | `VPROC-0059` | Gestionar ciclo de acceso tecnológico               | `PLACEHOLDER_REFERENCE`  | `BOUND`              | La representación pertenece a navegación o acceso; no ejecuta contenido ni activa AURA.            |
| `AURA-PLACEHOLDER-004`         | `AppSwitcher AURA soon en aplicación consumidora` | `VPROC-0059` | Gestionar ciclo de acceso tecnológico               | `PLACEHOLDER_REFERENCE`  | `BOUND`              | La representación pertenece a navegación o acceso; no ejecuta contenido ni activa AURA.            |
| `AURA-PLACEHOLDER-005`         | `AppSwitcher AURA soon en aplicación consumidora` | `VPROC-0059` | Gestionar ciclo de acceso tecnológico               | `PLACEHOLDER_REFERENCE`  | `BOUND`              | La representación pertenece a navegación o acceso; no ejecuta contenido ni activa AURA.            |
| `AURA-PLACEHOLDER-006`         | `Metadata AURA por returnTo en login`             | `VPROC-0059` | Gestionar ciclo de acceso tecnológico               | `PLACEHOLDER_REFERENCE`  | `BOUND`              | La representación pertenece a navegación o acceso; no ejecuta contenido ni activa AURA.            |
| `AURA-PLACEHOLDER-007`         | `Chip visible AURA en login central`              | `VPROC-0059` | Gestionar ciclo de acceso tecnológico               | `PLACEHOLDER_REFERENCE`  | `BOUND`              | La representación pertenece a navegación o acceso; no ejecuta contenido ni activa AURA.            |
| `AURA-CURRENT-ADMIN-ROUTE-001` | `Alias documental de VISO-ROUTE-054`              | `VPROC-0056` | Gestionar contenido y promociones                   | `ALIAS_OF_EXISTING_VIEW` | `ALIAS_INHERITED`    | Reutiliza el vínculo de la ruta VISO existente; no crea otra vista ni transfiere propiedad a AURA. |
| `AURA-CURRENT-ADMIN-ROUTE-002` | `Alias documental de VISO-ROUTE-059`              | `VPROC-0056` | Gestionar contenido y promociones                   | `ALIAS_OF_EXISTING_VIEW` | `ALIAS_INHERITED`    | Reutiliza el vínculo de la ruta VISO existente; no crea otra vista ni transfiere propiedad a AURA. |
| `AURA-CURRENT-ADMIN-ROUTE-003` | `Alias documental de VISO-ROUTE-057`              | `VPROC-0056` | Gestionar contenido y promociones                   | `ALIAS_OF_EXISTING_VIEW` | `ALIAS_INHERITED`    | Reutiliza el vínculo de la ruta VISO existente; no crea otra vista ni transfiere propiedad a AURA. |
| `AURA-CURRENT-ADMIN-ROUTE-004` | `Alias documental de VISO-ROUTE-055`              | `VPROC-0056` | Gestionar contenido y promociones                   | `ALIAS_OF_EXISTING_VIEW` | `ALIAS_INHERITED`    | Reutiliza el vínculo de la ruta VISO existente; no crea otra vista ni transfiere propiedad a AURA. |
| `AURA-CURRENT-ADMIN-ROUTE-005` | `Alias documental de VISO-ROUTE-058`              | `VPROC-0056` | Gestionar contenido y promociones                   | `ALIAS_OF_EXISTING_VIEW` | `ALIAS_INHERITED`    | Reutiliza el vínculo de la ruta VISO existente; no crea otra vista ni transfiere propiedad a AURA. |
| `AURA-CURRENT-ADMIN-ROUTE-006` | `Alias documental de VISO-ROUTE-056`              | `VPROC-0056` | Gestionar contenido y promociones                   | `ALIAS_OF_EXISTING_VIEW` | `ALIAS_INHERITED`    | Reutiliza el vínculo de la ruta VISO existente; no crea otra vista ni transfiere propiedad a AURA. |
| `AURA-CURRENT-ADMIN-ROUTE-007` | `Alias documental de VISO-ROUTE-060`              | `VPROC-0056` | Gestionar contenido y promociones                   | `ALIAS_OF_EXISTING_VIEW` | `ALIAS_INHERITED`    | Reutiliza el vínculo de la ruta VISO existente; no crea otra vista ni transfiere propiedad a AURA. |
| `AURA-CURRENT-SURFACE-001`     | `Panel, filtros, accesos rápidos y listados`      | `VPROC-0056` | Gestionar contenido y promociones                   | `SUBORDINATE_SURFACE`    | `LEGACY_AS_IS_BOUND` | Superficie AS-IS de VISO para contenido y promociones; no constituye pantalla standalone AURA.     |
| `AURA-CURRENT-SURFACE-002`     | `Creación de tarjetas de contenido`               | `VPROC-0056` | Gestionar contenido y promociones                   | `SUBORDINATE_SURFACE`    | `LEGACY_AS_IS_BOUND` | Superficie AS-IS de VISO para contenido y promociones; no constituye pantalla standalone AURA.     |
| `AURA-CURRENT-SURFACE-003`     | `Edición, completitud y publicación de tarjetas`  | `VPROC-0056` | Gestionar contenido y promociones                   | `SUBORDINATE_SURFACE`    | `LEGACY_AS_IS_BOUND` | Superficie AS-IS de VISO para contenido y promociones; no constituye pantalla standalone AURA.     |
| `AURA-CURRENT-SURFACE-004`     | `Control de eliminación de tarjeta`               | `VPROC-0056` | Gestionar contenido y promociones                   | `SUBORDINATE_SURFACE`    | `LEGACY_AS_IS_BOUND` | Superficie AS-IS de VISO para contenido y promociones; no constituye pantalla standalone AURA.     |
| `AURA-CURRENT-SURFACE-005`     | `Creación de bloque editorial`                    | `VPROC-0056` | Gestionar contenido y promociones                   | `SUBORDINATE_SURFACE`    | `LEGACY_AS_IS_BOUND` | Superficie AS-IS de VISO para contenido y promociones; no constituye pantalla standalone AURA.     |
| `AURA-CURRENT-SURFACE-006`     | `Edición y publicación de bloque`                 | `VPROC-0056` | Gestionar contenido y promociones                   | `SUBORDINATE_SURFACE`    | `LEGACY_AS_IS_BOUND` | Superficie AS-IS de VISO para contenido y promociones; no constituye pantalla standalone AURA.     |
| `AURA-CURRENT-SURFACE-007`     | `Importación y listado de restaurantes`           | `VPROC-0056` | Gestionar contenido y promociones                   | `SUBORDINATE_SURFACE`    | `LEGACY_AS_IS_BOUND` | Superficie AS-IS de VISO para contenido y promociones; no constituye pantalla standalone AURA.     |
| `AURA-CURRENT-SURFACE-008`     | `Editor y previsualización de detalle`            | `VPROC-0056` | Gestionar contenido y promociones                   | `SUBORDINATE_SURFACE`    | `LEGACY_AS_IS_BOUND` | Superficie AS-IS de VISO para contenido y promociones; no constituye pantalla standalone AURA.     |
| `AURA-CURRENT-SURFACE-009`     | `Carga de imagen o video`                         | `VPROC-0056` | Gestionar contenido y promociones                   | `SUBORDINATE_SURFACE`    | `LEGACY_AS_IS_BOUND` | Superficie AS-IS de VISO para contenido y promociones; no constituye pantalla standalone AURA.     |
| `AURA-CURRENT-PUBLIC-001`      | `/ — sitio público`                               | `VPROC-0017` | Gestionar oferta, precio y disponibilidad comercial | `PUBLIC_CONSUMER_VIEW`   | `BOUND`              | La intención principal corresponde a gestionar oferta, precio y disponibilidad comercial.          |
| `AURA-CURRENT-PUBLIC-002`      | `/restaurantes`                                   | `VPROC-0017` | Gestionar oferta, precio y disponibilidad comercial | `PUBLIC_CONSUMER_VIEW`   | `BOUND`              | La intención principal corresponde a gestionar oferta, precio y disponibilidad comercial.          |
| `AURA-CURRENT-PUBLIC-003`      | `/restaurantes/[slug]`                            | `VPROC-0017` | Gestionar oferta, precio y disponibilidad comercial | `PUBLIC_CONSUMER_VIEW`   | `BOUND`              | La intención principal corresponde a gestionar oferta, precio y disponibilidad comercial.          |
| `AURA-CURRENT-PUBLIC-004`      | `/empleos`                                        | `VPROC-0005` | Gestionar reclutamiento y selección                 | `PUBLIC_CONSUMER_VIEW`   | `BOUND`              | La intención principal corresponde a gestionar reclutamiento y selección.                          |
| `AURA-CURRENT-PUBLIC-005`      | `/servicios`                                      | `VPROC-0017` | Gestionar oferta, precio y disponibilidad comercial | `PUBLIC_CONSUMER_VIEW`   | `BOUND`              | La intención principal corresponde a gestionar oferta, precio y disponibilidad comercial.          |
| `AURA-CURRENT-PUBLIC-006`      | `/ecosistema`                                     | `VPROC-0017` | Gestionar oferta, precio y disponibilidad comercial | `PUBLIC_CONSUMER_VIEW`   | `BOUND`              | La intención principal corresponde a gestionar oferta, precio y disponibilidad comercial.          |
| `AURA-CURRENT-PUBLIC-007`      | `/eventos → /restaurantes`                        | `VPROC-0017` | Gestionar oferta, precio y disponibilidad comercial | `REDIRECT_ALIAS`         | `BOUND`              | Hereda el proceso de la oferta pública de destino; no materializa gestión de eventos.              |

#### 8. Distribución por proceso

| process_id   | Proceso                                              | Vistas únicas vinculadas |
| ------------ | ---------------------------------------------------- | ------------------------ |
| `VPROC-0001` | Gobernar decisiones empresariales                    | 1                        |
| `VPROC-0002` | Gobernar estructura organizativa                     | 8                        |
| `VPROC-0003` | Gobernar políticas, delegaciones y límites           | 1                        |
| `VPROC-0004` | Gestionar compromisos y comunicaciones internas      | 3                        |
| `VPROC-0005` | Gestionar reclutamiento y selección                  | 4                        |
| `VPROC-0006` | Gestionar vinculación e incorporación laboral        | 7                        |
| `VPROC-0007` | Gestionar asignación y programación laboral          | 10                       |
| `VPROC-0008` | Gestionar asistencia y marcaciones                   | 7                        |
| `VPROC-0011` | Gestionar retiro y revocación coordinada             | 1                        |
| `VPROC-0015` | Gestionar ciclo de vida del catálogo de productos    | 13                       |
| `VPROC-0016` | Gestionar ciclo de vida de recetas                   | 4                        |
| `VPROC-0017` | Gestionar oferta, precio y disponibilidad comercial  | 15                       |
| `VPROC-0018` | Gestionar especificaciones y criterios de calidad    | 1                        |
| `VPROC-0019` | Gestionar necesidades y solicitudes de compra        | 1                        |
| `VPROC-0020` | Gestionar proveedores, cotizaciones y condiciones    | 3                        |
| `VPROC-0021` | Aprobar y emitir órdenes de compra                   | 4                        |
| `VPROC-0022` | Gestionar recepción de compra y diferencias          | 2                        |
| `VPROC-0023` | Gestionar ubicaciones físicas                        | 9                        |
| `VPROC-0024` | Gestionar entradas, existencia y movimientos físicos | 9                        |
| `VPROC-0025` | Gestionar retiros, transferencias y consumos         | 3                        |
| `VPROC-0026` | Gestionar conteos y ajustes de inventario            | 3                        |
| `VPROC-0028` | Gestionar abastecimiento interno y remisiones        | 14                       |
| `VPROC-0029` | Gestionar activos, custodia y transferencias         | 7                        |
| `VPROC-0032` | Gestionar contenedores y reutilizables               | 1                        |
| `VPROC-0033` | Planear producción                                   | 1                        |
| `VPROC-0034` | Ejecutar producción                                  | 3                        |
| `VPROC-0038` | Gestionar servicio en mesa                           | 1                        |
| `VPROC-0039` | Gestionar venta de mostrador o para llevar           | 1                        |
| `VPROC-0045` | Gestionar identidad de cliente y fidelización        | 11                       |
| `VPROC-0050` | Gestionar entrega mediante tercero                   | 1                        |
| `VPROC-0051` | Registrar y conciliar hechos económicos              | 3                        |
| `VPROC-0054` | Gestionar costos, presupuesto, cierre y rentabilidad | 5                        |
| `VPROC-0056` | Gestionar contenido y promociones                    | 18                       |
| `VPROC-0058` | Gestionar solicitudes e incidentes tecnológicos      | 5                        |
| `VPROC-0059` | Gestionar ciclo de acceso tecnológico                | 43                       |
| `VPROC-0060` | Gestionar documentos y evidencia                     | 6                        |
| `VPROC-0061` | Gestionar medición, análisis y mejora                | 6                        |
| `VPROC-0062` | Gestionar continuidad y recuperación                 | 1                        |

La distribución no expresa cobertura suficiente, volumen operativo, prioridad, permiso ni madurez. Varias vistas pueden servir al mismo proceso y una vista puede proyectar información relacionada sin cambiar su proceso primario.

#### 9. Exclusiones explícitas

No reciben `process_id` como vistas:

- once handlers API de NEXO;
- el handler PDF de FOGO;
- el handler PDF de ORIGO;
- diez handlers de VISO;
- layouts, loading boundaries, middleware, iconos y metadata técnica;
- server actions y módulos de soporte no visual;
- templates y primitivas UI de SHELL;
- componentes dormantes no montados;
- el template AURA no runtime.

#### 10. Reconciliaciones críticas

##### 10.1 Catálogo canónico frente a inventario AS-IS

`PROC-SCREEN-003` mantiene 177 vínculos canónicos `VSCREEN-*`. Esta tarea no los modifica. El registro actual vincula IDs técnicos inventariados y conserva pendiente el mapeo ruta–pantalla canónica para `PROC-SCREEN-026`.

##### 10.2 Contenido actual y AURA diferida

Las superficies actuales de contenido en VISO se vinculan AS-IS con `VPROC-0056` mediante estado `LEGACY_AS_IS_BOUND`. Esto reconoce el comportamiento existente sin:

- crear una pantalla canónica AURA;
- transferir propiedad a AURA;
- habilitar `aura.access`;
- desbloquear el BLOQUE W;
- aprobar continuidad de AURA.

La decisión de continuidad y propiedad permanece en `AURA-AUD-007` a `AURA-AUD-012`, `AUTH-UI-013`, `AUTH-UI-014` y `PROC-SCREEN-026`.

##### 10.3 VPROC-0057

No se identifica una vista AS-IS que convierta consultas digitales en oportunidades trazables. `VPROC-0057` permanece sin vista actual; enlaces, correos o formularios externos no materializan por sí solos el proceso.

##### 10.4 PASS laboral

Las tres superficies laborales embebidas en PASS se vinculan con `VPROC-0059`. Las superficies de identificación, puntos y redención servidas por PULSO se vinculan principalmente con `VPROC-0045`; la firma por PIN conserva `VPROC-0059` por su intención de identificar al actor efectivo.

#### 11. Validaciones obligatorias

La compilación deberá fallar cuando:

1. el registro no contenga exactamente 243 filas;
2. el conjunto no contenga exactamente 236 vistas únicas y siete aliases;
3. un `view_id` aparezca más de una vez;
4. una vista única carezca de `primary_process_id`;
5. un `process_id` no exista entre `VPROC-0001` y `VPROC-0069`;
6. un alias no pueda heredar el proceso de una vista existente;
7. un handler, action, layout, middleware, template o componente dormante se contabilice como vista;
8. se introduzca `process_step` antes de `AUTH-UI-012`;
9. el vínculo implique propiedad, consumo, permiso, menú o retiro;
10. una representación AURA se presente como aplicación standalone;
11. `VPROC-0057` reciba una vista artificial;
12. los conteos declarados difieran de la matriz física.

#### 12. Requisitos de prueba derivados

Se incorporan al registro canónico completo:

```text
TREQ-UX-1483 a TREQ-UX-1506
```

| ID             | Regla protegida                                                                                                                                                                                                              |
| -------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `TREQ-UX-1483` | El registro AS-IS deberá contener exactamente 243 filas de vínculo: 236 unidades de vista únicas y siete aliases documentales, sin IDs repetidos ni omisiones respecto de AUTH-UI-001 a AUTH-UI-010.                         |
| `TREQ-UX-1484` | Cada unidad de vista única deberá resolver exactamente un primary_process_id existente en el rango VPROC-0001 a VPROC-0069.                                                                                                  |
| `TREQ-UX-1485` | Una ruta, modal, panel, estado o superficie no podrá recibir process_id por repositorio, componente, tabla, rol o nombre; deberá usarse la intención y el resultado empresarial principal.                                   |
| `TREQ-UX-1486` | Los aliases y redirects deberán conservar identificador propio cuando exista ruta real, heredar el process_id del destino funcional y no incrementar el conteo de vistas únicas.                                             |
| `TREQ-UX-1487` | Route handlers, server actions, middleware, layouts, loading boundaries, módulos de soporte, templates, primitivas UI e iconos no deberán recibir process_id como vistas.                                                    |
| `TREQ-UX-1488` | AUTH-UI-011 no deberá asignar process_step, aplicación propietaria, condición de consumidor, permiso, actor, dispositivo, menú, duplicidad, legacy o retiro.                                                                 |
| `TREQ-UX-1489` | Las vistas de inicio de sesión, recuperación, resolución de acceso, denegación y cuenta deberán vincularse con VPROC-0059 sin que ello conceda autoridad empresarial.                                                        |
| `TREQ-UX-1490` | Las vistas de soporte y diagnóstico deberán vincularse con VPROC-0058 y las superficies de continuidad o error global con VPROC-0062 cuando esa sea su intención principal.                                                  |
| `TREQ-UX-1491` | Las 64 rutas NEXO deberán conservar exactamente un process_id; las cuatro rutas de redirección heredarán el proceso de su destino y los once handlers permanecerán excluidos.                                                |
| `TREQ-UX-1492` | Las nueve rutas FOGO deberán conservar exactamente un process_id y el handler de PDF permanecerá fuera del registro de vistas.                                                                                               |
| `TREQ-UX-1493` | Las trece rutas ORIGO deberán conservar exactamente un process_id y el handler PDF firmado permanecerá fuera del registro de vistas.                                                                                         |
| `TREQ-UX-1494` | Las seis rutas PULSO deberán conservar exactamente un process_id; / y /scanner mantendrán identidades separadas pero el mismo proceso mientras no exista decisión de consolidación.                                          |
| `TREQ-UX-1495` | Las sesenta rutas VISO deberán conservar exactamente un process_id y sus diez handlers permanecerán excluidos.                                                                                                               |
| `TREQ-UX-1496` | Las siete rutas NUMERA deberán conservar exactamente un process_id y diferenciar análisis, hechos económicos, costos y superficies de acceso.                                                                                |
| `TREQ-UX-1497` | ANIMA deberá conservar process_id para catorce pantallas móviles, dieciséis superficies subordinadas, dos superficies globales y cinco superficies web auxiliares, sin convertir layouts en vistas.                          |
| `TREQ-UX-1498` | SHELL deberá conservar siete unidades interactivas vinculadas a VPROC-0059 y excluir layout, middleware, icono, templates y primitivas fuente del conteo de vistas.                                                          |
| `TREQ-UX-1499` | Las diez superficies laborales runtime relacionadas con PASS deberán conservar process_id: tres de acceso o simulación y siete de identificación, fidelización o firma operativa en PULSO.                                   |
| `TREQ-UX-1500` | AURA deberá conservar cero vistas standalone; sus siete placeholders se vincularán con VPROC-0059 como referencias de navegación y no como ejecución de marketing.                                                           |
| `TREQ-UX-1501` | Las siete referencias administrativas AURA deberán heredar los vínculos de VISO-ROUTE-054 a VISO-ROUTE-060 y no crear vistas, procesos ni propiedad duplicados.                                                              |
| `TREQ-UX-1502` | Las nueve superficies CMS actuales de VISO deberán quedar vinculadas AS-IS con VPROC-0056, con estado LEGACY_AS_IS_BOUND, sin admitir pantalla canónica AURA ni desbloquear su roadmap.                                      |
| `TREQ-UX-1503` | Las siete rutas públicas relacionadas deberán vincular su intención visible: oferta comercial con VPROC-0017, empleos con VPROC-0005 y /eventos como alias del destino actual, sin asignarlas a AURA por consumir datos CMS. |
| `TREQ-UX-1504` | VPROC-0057 deberá permanecer sin vista AS-IS asignada mientras no exista un caso trazable de oportunidad digital; un enlace, correo o formulario externo no bastará para materializarlo.                                     |
| `TREQ-UX-1505` | Todo cambio futuro de view_id, patrón, intención, destino, proceso o estado de alias deberá producir delta, nueva huella y revisión de impactos antes de reemplazar el vínculo vigente.                                      |
| `TREQ-UX-1506` | La compilación documental deberá fallar ante view_id duplicado, process_id desconocido, vista única sin vínculo, alias sin destino heredable, conteo distinto de 243 o introducción prematura de process_step.               |

#### 13. Huellas de la línea base

```text
BINDING_REGISTRY_SHA256 = ae8df51702fb8de5642cabfdf95bd9c27fe94463b6ebd99d4d3721d2d11fb4f9
UNIQUE_VIEW_REGISTRY_SHA256 = f243f3d36388fa362589f47cfd3de33e530175941663de4b8060a66a30fdad7f
ALIAS_REGISTRY_SHA256 = df0b582cfa447bc278b0fcb8c1f2bbaf7c1016cc83ffb399ec4b469817854b4c
PROCESS_DISTRIBUTION_SHA256 = b34135213cd8b9a0a5f05485e539c68d0811795f3cca32db50888ca366440321
```

#### 14. Criterios de aceptación

- [x] Se consumen únicamente procesos `VPROC-0001` a `VPROC-0069`.
- [x] Se materializan 243 filas de vínculo sin IDs repetidos.
- [x] Se distinguen 236 vistas únicas y siete aliases.
- [x] Cada vista única tiene exactamente un `primary_process_id`.
- [x] Los aliases heredan proceso sin crear otra vista.
- [x] Los artefactos técnicos no visuales quedan excluidos.
- [x] No se asigna ningún `process_step`.
- [x] No se anticipa propiedad, consumo, permiso, menú, duplicidad, legacy definitivo ni retiro.
- [x] AURA conserva cero vistas standalone.
- [x] Las superficies de contenido existentes quedan documentadas como AS-IS sin activar AURA.
- [x] `VPROC-0057` permanece sin vista artificial.
- [x] Se incorporan `TREQ-UX-1483` a `TREQ-UX-1506` sin modificar filas históricas.
- [x] No se modifica código, Supabase, navegación runtime ni despliegue.

#### 15. Validaciones documentales realizadas

| Control                         | Resultado                                         |
| ------------------------------- | ------------------------------------------------- |
| Base 04A leída completa         | **3.488 requisitos**                              |
| Nuevos requisitos               | **24**                                            |
| Total regenerado                | **3.512**                                         |
| Dominio UX                      | **1.506 requisitos — TREQ-UX-001 a TREQ-UX-1506** |
| Filas con catorce columnas      | **3.512 de 3.512**                                |
| Identificadores TREQ duplicados | **0**                                             |
| Relaciones TREQ no resolubles   | **0**                                             |
| Filas históricas modificadas    | **0**                                             |
| Filas de vínculo vista–proceso  | **243**                                           |
| Vistas únicas sin proceso       | **0**                                             |
| Código o Supabase modificado    | **no**                                            |

#### 16. Instrucción de reemplazo

1. Reemplazar exactamente `### [ ] AUTH-UI-011 — Asignar process_id a cada vista` por este documento completo.
2. Reemplazar completamente `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` por el archivo regenerado entregado con esta tarea.
3. No insertar filas TREQ manualmente.

#### 17. Continuidad aprobada

```text
ÚLTIMA TAREA APROBADA
AUTH-UI-011 — Asignar process_id a cada vista
        ↓
TAREA ACTUAL
AUTH-UI-012 — Asignar process_step a cada vista
        ↓
SIGUIENTE TAREA RESERVADA
AUTH-UI-013 — Definir aplicación propietaria
```

APROBADA


### ✅ AUTH-UI-012 — Asignar process_step a cada vista

**Estado:** APROBADA
**Fecha de aprobación documental:** 2026-07-28
**Bloque propietario:** BLOQUE I — Navegación, pantallas y autorización de vistas
**Marcador exacto que reemplaza:** `### [ ] AUTH-UI-012 — Asignar process_step a cada vista`
**Tarea anterior:** `AUTH-UI-011 — Asignar process_id a cada vista` — APROBADA
**Siguiente tarea:** `AUTH-UI-013 — Definir aplicación propietaria`
**Tipo de tarea:** reconciliación documental AS-IS entre vistas inventariadas, procesos `VPROC-*` y pasos dominantes; sin cambios de código, Supabase, navegación runtime ni despliegue

#### 1. Objetivo

Asignar un `primary_process_step_ref` único, estable, namespaced y funcionalmente justificable a cada vista o superficie interactiva vinculada con proceso en `AUTH-UI-011`.

La tarea aplica el contrato aprobado por `PROC-SCREEN-004` al inventario AS-IS. Conserva intactos los `primary_process_id`, no modifica los 177 vínculos canónicos `VSCREEN-*` y no convierte rutas actuales en pantallas canónicas.

#### 2. Frontera obligatoria

```text
VIEW_ID AS-IS
        +
PRIMARY_PROCESS_ID APROBADO
        +
PASO DOMINANTE DEL PROCESO
        =
PRIMARY_PROCESS_STEP_REF

PROCESS_STEP
≠ ESTADO
≠ TRANSICIÓN
≠ ACCIÓN
≠ API
≠ PERMISO
≠ RUTA
≠ APLICACIÓN PROPIETARIA
```

| Decisión                                                          | Tarea propietaria             |
| ----------------------------------------------------------------- | ----------------------------- |
| Definir aplicación propietaria                                    | `AUTH-UI-013`                 |
| Definir si la aplicación solo consume la capacidad                | `AUTH-UI-014`                 |
| Clasificar intención, actores, dispositivo, frecuencia y acciones | `AUTH-UI-015` a `AUTH-UI-025` |
| Resolver duplicidad, legacy, retiro y superficies técnicas        | `AUTH-UI-026` a `AUTH-UI-029` |
| Asignar permisos, contexto y protección de servidor               | `AUTH-UI-030` a `AUTH-UI-045` |
| Mapear rutas legacy a identidades `VSCREEN-*`                     | `PROC-SCREEN-026`             |

#### 3. Fuentes consumidas

- `AUTH-UI-001` a `AUTH-UI-010` y sus inventarios aprobados;
- `AUTH-UI-011` y `VIEW-PROCESS-BINDING-001`;
- `PROC-SCREEN-004`, `PROCESS-STEP-ANCHOR-VOCABULARY-001` y su registro de 177 vínculos canónicos;
- procesos `VPROC-0001` a `VPROC-0069` y sus contratos de estados, transiciones y excepciones;
- referencias canónicas `VSCREEN-*` únicamente como guía semántica, no como sustituto del inventario AS-IS.

#### 4. Contrato `VIEW-PROCESS-STEP-BINDING-001`

| Campo                      | Regla                                           |
| -------------------------- | ----------------------------------------------- |
| `view_id`                  | identificador exacto del inventario aprobado    |
| `primary_process_id`       | valor aprobado y congelado por `AUTH-UI-011`    |
| `primary_process_step_ref` | referencia `VPROC-*::STEP-*` del paso dominante |
| `process_step_role`        | uno de los 23 roles aprobados                   |
| `lifecycle_position`       | una de las seis posiciones aprobadas            |
| `process_step_label`       | etiqueta humana mutable                         |
| `step_binding_status`      | estado documental del vínculo                   |
| `step_binding_version`     | `1.0.0` para esta admisión inicial              |
| `step_binding_task`        | `AUTH-UI-012`                                   |
| `step_binding_reason`      | fundamento funcional verificable                |

Formato obligatorio:

```text
^VPROC-[0-9]{4}::STEP-[A-Z0-9_]+$
```

El prefijo de `primary_process_step_ref` debe coincidir exactamente con `primary_process_id`.

#### 5. Vocabularios aprobados

##### 5.1 Roles de paso

`ENTRY`, `IDENTIFY`, `INITIATE`, `TRIAGE`, `CAPTURE`, `CONFIGURE`, `PLAN`, `VALIDATE`, `REVIEW`, `SIMULATE`, `APPROVE`, `DECIDE`, `EXECUTE`, `MONITOR`, `RECONCILE`, `CORRECT`, `CLOSE`, `AUDIT`, `ANALYZE`, `PUBLISH`, `RECEIPT`, `RECOVER`, `SELF_SERVICE`.

##### 5.2 Posiciones del ciclo

`PRECONDITION`, `INITIAL`, `IN_PROGRESS`, `DECISION`, `TERMINAL`, `CROSS_CUTTING`.

Estas posiciones no son estados persistidos. Solo ubican la vista en un tramo coherente del proceso.

#### 6. Resultado cuantitativo

| Métrica                                           |    Resultado |
| ------------------------------------------------- | -----------: |
| Filas de vínculo vista–proceso–paso               |      **243** |
| Unidades de vista únicas                          |      **236** |
| Aliases documentales sin nueva vista              |        **7** |
| Vistas únicas sin `process_step`                  |        **0** |
| Referencias con prefijo distinto del `process_id` |        **0** |
| Roles inválidos                                   |        **0** |
| Posiciones inválidas                              |        **0** |
| Procesos representados                            |       **38** |
| Anclas distintas utilizadas                       |      **117** |
| Roles de paso utilizados                          | **22 de 23** |
| Posiciones utilizadas                             |   **6 de 6** |
| Requisitos nuevos                                 |       **24** |

| Inventario fuente | Filas de vínculo | Vistas únicas | Aliases |
| ----------------- | ---------------- | ------------- | ------- |
| `NEXO`            | 64               | 64            | 0       |
| `FOGO`            | 9                | 9             | 0       |
| `ORIGO`           | 13               | 13            | 0       |
| `PULSO`           | 6                | 6             | 0       |
| `VISO`            | 60               | 60            | 0       |
| `NUMERA`          | 7                | 7             | 0       |
| `ANIMA`           | 37               | 37            | 0       |
| `SHELL`           | 7                | 7             | 0       |
| `PASS`            | 10               | 10            | 0       |
| `AURA`            | 30               | 23            | 7       |

#### 7. Matriz completa `VIEW-PROCESS-STEP-BINDING-001`

##### NEXO

| View ID          | Vista o superficie                           | process_id   | process_step                                         | Etiqueta                                         | Rol         | Posición        | Estado                    | Fundamento                                                                                                                                            |
| ---------------- | -------------------------------------------- | ------------ | ---------------------------------------------------- | ------------------------------------------------ | ----------- | --------------- | ------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| `NEXO-ROUTE-001` | `/`                                          | `VPROC-0028` | `VPROC-0028::STEP-MONITOR_INTERNAL_SUPPLY`           | Monitorear inventario y abastecimiento interno   | `MONITOR`   | `CROSS_CUTTING` | `STEP_BOUND`              | El propósito dominante de la vista es «monitorear inventario y abastecimiento interno» dentro de gestionar abastecimiento interno y remisiones.       |
| `NEXO-ROUTE-002` | `/inventory/adjust`                          | `VPROC-0026` | `VPROC-0026::STEP-DECIDE_INVENTORY_ADJUSTMENT`       | Decidir ajuste de inventario                     | `DECIDE`    | `DECISION`      | `STEP_BOUND`              | El propósito dominante de la vista es «decidir ajuste de inventario» dentro de gestionar conteos y ajustes de inventario.                             |
| `NEXO-ROUTE-003` | `/inventory/assets`                          | `VPROC-0029` | `VPROC-0029::STEP-MANAGE_ASSET_CUSTODY`              | Gestionar activo y custodia                      | `EXECUTE`   | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «gestionar activo y custodia» dentro de gestionar activos, custodia y transferencias.                           |
| `NEXO-ROUTE-004` | `/inventory/assets/counts`                   | `VPROC-0029` | `VPROC-0029::STEP-AUDIT_ASSET_CUSTODY`               | Auditar conteo y custodia de activos             | `AUDIT`     | `CROSS_CUTTING` | `STEP_BOUND`              | El propósito dominante de la vista es «auditar conteo y custodia de activos» dentro de gestionar activos, custodia y transferencias.                  |
| `NEXO-ROUTE-005` | `/inventory/assets/counts/[id]`              | `VPROC-0029` | `VPROC-0029::STEP-AUDIT_ASSET_CUSTODY`               | Auditar conteo y custodia de activos             | `AUDIT`     | `CROSS_CUTTING` | `STEP_BOUND`              | El propósito dominante de la vista es «auditar conteo y custodia de activos» dentro de gestionar activos, custodia y transferencias.                  |
| `NEXO-ROUTE-006` | `/inventory/assets/groups/[id]`              | `VPROC-0029` | `VPROC-0029::STEP-MANAGE_ASSET_CUSTODY`              | Gestionar activo y custodia                      | `EXECUTE`   | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «gestionar activo y custodia» dentro de gestionar activos, custodia y transferencias.                           |
| `NEXO-ROUTE-007` | `/inventory/assets/items/[id]`               | `VPROC-0029` | `VPROC-0029::STEP-MANAGE_ASSET_CUSTODY`              | Gestionar activo y custodia                      | `EXECUTE`   | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «gestionar activo y custodia» dentro de gestionar activos, custodia y transferencias.                           |
| `NEXO-ROUTE-008` | `/inventory/assets/new`                      | `VPROC-0029` | `VPROC-0029::STEP-REGISTER_ASSET`                    | Registrar activo y condición inicial             | `CONFIGURE` | `INITIAL`       | `STEP_BOUND`              | El propósito dominante de la vista es «registrar activo y condición inicial» dentro de gestionar activos, custodia y transferencias.                  |
| `NEXO-ROUTE-009` | `/inventory/assets/quick`                    | `VPROC-0029` | `VPROC-0029::STEP-CAPTURE_ASSET_CUSTODY`             | Capturar custodia rápida de activo               | `CAPTURE`   | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «capturar custodia rápida de activo» dentro de gestionar activos, custodia y transferencias.                    |
| `NEXO-ROUTE-010` | `/inventory/catalog`                         | `VPROC-0015` | `VPROC-0015::STEP-CONSULT_PHYSICAL_PRODUCT_CATALOG`  | Consultar catálogo físico                        | `MONITOR`   | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «consultar catálogo físico» dentro de gestionar ciclo de vida del catálogo de productos.                        |
| `NEXO-ROUTE-011` | `/inventory/catalog/[id]`                    | `VPROC-0015` | `VPROC-0015::STEP-CONSULT_PHYSICAL_PRODUCT_CATALOG`  | Consultar catálogo físico                        | `MONITOR`   | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «consultar catálogo físico» dentro de gestionar ciclo de vida del catálogo de productos.                        |
| `NEXO-ROUTE-012` | `/inventory/catalog/[id]/ficha`              | `VPROC-0018` | `VPROC-0018::STEP-MAINTAIN_QUALITY_SPECIFICATION`    | Mantener especificaciones y criterios de calidad | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «mantener especificaciones y criterios de calidad» dentro de gestionar especificaciones y criterios de calidad. |
| `NEXO-ROUTE-013` | `/inventory/catalog/[id]/presentations`      | `VPROC-0015` | `VPROC-0015::STEP-MAINTAIN_PRODUCT_PRESENTATION`     | Mantener producto, unidad y presentación         | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «mantener producto, unidad y presentación» dentro de gestionar ciclo de vida del catálogo de productos.         |
| `NEXO-ROUTE-014` | `/inventory/catalog/new`                     | `VPROC-0015` | `VPROC-0015::STEP-MAINTAIN_PRODUCT_PRESENTATION`     | Mantener producto, unidad y presentación         | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «mantener producto, unidad y presentación» dentro de gestionar ciclo de vida del catálogo de productos.         |
| `NEXO-ROUTE-015` | `/inventory/catalog/presentations`           | `VPROC-0015` | `VPROC-0015::STEP-MAINTAIN_PRODUCT_PRESENTATION`     | Mantener producto, unidad y presentación         | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «mantener producto, unidad y presentación» dentro de gestionar ciclo de vida del catálogo de productos.         |
| `NEXO-ROUTE-016` | `/inventory/cost-center`                     | `VPROC-0054` | `VPROC-0054::STEP-ALLOCATE_COSTS`                    | Distribuir y asignar costos                      | `EXECUTE`   | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «distribuir y asignar costos» dentro de gestionar costos, presupuesto, cierre y rentabilidad.                   |
| `NEXO-ROUTE-017` | `/inventory/count-initial`                   | `VPROC-0026` | `VPROC-0026::STEP-CAPTURE_PHYSICAL_COUNT`            | Capturar conteo físico                           | `CAPTURE`   | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «capturar conteo físico» dentro de gestionar conteos y ajustes de inventario.                                   |
| `NEXO-ROUTE-018` | `/inventory/count-initial/session/[id]`      | `VPROC-0026` | `VPROC-0026::STEP-REVIEW_COUNT_VARIANCE`             | Revisar diferencias de conteo                    | `REVIEW`    | `DECISION`      | `STEP_BOUND`              | El propósito dominante de la vista es «revisar diferencias de conteo» dentro de gestionar conteos y ajustes de inventario.                            |
| `NEXO-ROUTE-019` | `/inventory/entries`                         | `VPROC-0024` | `VPROC-0024::STEP-CONFIRM_STOCK_ENTRY`               | Confirmar entrada física                         | `EXECUTE`   | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «confirmar entrada física» dentro de gestionar entradas, existencia y movimientos físicos.                      |
| `NEXO-ROUTE-020` | `/inventory/locations`                       | `VPROC-0023` | `VPROC-0023::STEP-CONSULT_LOCATION_CATALOG`          | Consultar catálogo de ubicaciones                | `MONITOR`   | `CROSS_CUTTING` | `STEP_BOUND`              | El propósito dominante de la vista es «consultar catálogo de ubicaciones» dentro de gestionar ubicaciones físicas.                                    |
| `NEXO-ROUTE-021` | `/inventory/locations/[id]`                  | `VPROC-0023` | `VPROC-0023::STEP-IDENTIFY_LOCATION_AND_CONTENT`     | Identificar ubicación y contenido                | `IDENTIFY`  | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «identificar ubicación y contenido» dentro de gestionar ubicaciones físicas.                                    |
| `NEXO-ROUTE-022` | `/inventory/locations/[id]/board`            | `VPROC-0024` | `VPROC-0024::STEP-CONSULT_STOCK_POSITION`            | Consultar posición de existencias                | `MONITOR`   | `CROSS_CUTTING` | `STEP_BOUND`              | El propósito dominante de la vista es «consultar posición de existencias» dentro de gestionar entradas, existencia y movimientos físicos.             |
| `NEXO-ROUTE-023` | `/inventory/locations/[id]/kiosk-withdraw`   | `VPROC-0025` | `VPROC-0025::STEP-EXECUTE_STOCK_WITHDRAWAL`          | Ejecutar retiro o consumo                        | `EXECUTE`   | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «ejecutar retiro o consumo» dentro de gestionar retiros, transferencias y consumos.                             |
| `NEXO-ROUTE-024` | `/inventory/locations/[id]/positions`        | `VPROC-0023` | `VPROC-0023::STEP-MAINTAIN_LOCATION_CATALOG`         | Mantener posiciones de ubicación                 | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «mantener posiciones de ubicación» dentro de gestionar ubicaciones físicas.                                     |
| `NEXO-ROUTE-025` | `/inventory/locations/open`                  | `VPROC-0023` | `VPROC-0023::STEP-IDENTIFY_LOCATION_AND_CONTENT`     | Identificar ubicación y contenido                | `IDENTIFY`  | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «identificar ubicación y contenido» dentro de gestionar ubicaciones físicas.                                    |
| `NEXO-ROUTE-026` | `/inventory/locations/zone`                  | `VPROC-0024` | `VPROC-0024::STEP-CONSULT_STOCK_POSITION`            | Consultar posición de existencias por zona       | `MONITOR`   | `CROSS_CUTTING` | `STEP_BOUND`              | El propósito dominante de la vista es «consultar posición de existencias por zona» dentro de gestionar entradas, existencia y movimientos físicos.    |
| `NEXO-ROUTE-027` | `/inventory/locations/zones`                 | `VPROC-0023` | `VPROC-0023::STEP-MAINTAIN_LOCATION_CATALOG`         | Mantener catálogo de zonas                       | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «mantener catálogo de zonas» dentro de gestionar ubicaciones físicas.                                           |
| `NEXO-ROUTE-028` | `/inventory/lpns`                            | `VPROC-0032` | `VPROC-0032::STEP-MANAGE_LPN_AND_REUSABLES`          | Gestionar LPN, contenedores y reutilizables      | `EXECUTE`   | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «gestionar lpn, contenedores y reutilizables» dentro de gestionar contenedores y reutilizables.                 |
| `NEXO-ROUTE-029` | `/inventory/movements`                       | `VPROC-0024` | `VPROC-0024::STEP-AUDIT_STOCK_MOVEMENTS`             | Auditar movimientos de inventario                | `AUDIT`     | `CROSS_CUTTING` | `STEP_BOUND`              | El propósito dominante de la vista es «auditar movimientos de inventario» dentro de gestionar entradas, existencia y movimientos físicos.             |
| `NEXO-ROUTE-030` | `/inventory/production-batches`              | `VPROC-0034` | `VPROC-0034::STEP-MONITOR_BATCH_EXECUTION`           | Monitorear ejecución y efecto de lotes           | `MONITOR`   | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «monitorear ejecución y efecto de lotes» dentro de ejecutar producción.                                         |
| `NEXO-ROUTE-031` | `/inventory/remissions`                      | `VPROC-0028` | `VPROC-0028::STEP-MONITOR_INTERNAL_SUPPLY`           | Monitorear remisiones y abastecimiento interno   | `MONITOR`   | `CROSS_CUTTING` | `STEP_BOUND`              | El propósito dominante de la vista es «monitorear remisiones y abastecimiento interno» dentro de gestionar abastecimiento interno y remisiones.       |
| `NEXO-ROUTE-032` | `/inventory/remissions/[id]`                 | `VPROC-0028` | `VPROC-0028::STEP-MONITOR_REPLENISHMENT_TRANSIT`     | Monitorear detalle y avance de remisión          | `MONITOR`   | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «monitorear detalle y avance de remisión» dentro de gestionar abastecimiento interno y remisiones.              |
| `NEXO-ROUTE-033` | `/inventory/remissions/[id]/edit`            | `VPROC-0028` | `VPROC-0028::STEP-SUBMIT_REPLENISHMENT_REQUEST`      | Crear o corregir solicitud de remisión           | `INITIATE`  | `INITIAL`       | `STEP_BOUND`              | El propósito dominante de la vista es «crear o corregir solicitud de remisión» dentro de gestionar abastecimiento interno y remisiones.               |
| `NEXO-ROUTE-034` | `/inventory/remissions/conductor`            | `VPROC-0028` | `VPROC-0028::STEP-MONITOR_REPLENISHMENT_TRANSIT`     | Monitorear remisión asignada a conductor         | `MONITOR`   | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «monitorear remisión asignada a conductor» dentro de gestionar abastecimiento interno y remisiones.             |
| `NEXO-ROUTE-035` | `/inventory/remissions/fulfillment`          | `VPROC-0028` | `VPROC-0028::STEP-PREPARE_REPLENISHMENT`             | Preparar cumplimiento de remisión                | `EXECUTE`   | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «preparar cumplimiento de remisión» dentro de gestionar abastecimiento interno y remisiones.                    |
| `NEXO-ROUTE-036` | `/inventory/remissions/prepare`              | `VPROC-0028` | `VPROC-0028::STEP-PREPARE_REPLENISHMENT`             | Preparar remisión                                | `EXECUTE`   | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «preparar remisión» dentro de gestionar abastecimiento interno y remisiones.                                    |
| `NEXO-ROUTE-037` | `/inventory/remissions/receive`              | `VPROC-0028` | `VPROC-0028::STEP-RECEIVE_REPLENISHMENT`             | Recibir y conciliar remisión                     | `RECONCILE` | `DECISION`      | `STEP_BOUND`              | El propósito dominante de la vista es «recibir y conciliar remisión» dentro de gestionar abastecimiento interno y remisiones.                         |
| `NEXO-ROUTE-038` | `/inventory/remissions/transit`              | `VPROC-0028` | `VPROC-0028::STEP-MONITOR_REPLENISHMENT_TRANSIT`     | Monitorear remisión en tránsito                  | `MONITOR`   | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «monitorear remisión en tránsito» dentro de gestionar abastecimiento interno y remisiones.                      |
| `NEXO-ROUTE-039` | `/inventory/settings`                        | `VPROC-0003` | `VPROC-0003::STEP-AUTHOR_POLICIES_AND_LIMITS`        | Definir políticas y límites de inventario        | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «definir políticas y límites de inventario» dentro de gobernar políticas, delegaciones y límites.               |
| `NEXO-ROUTE-040` | `/inventory/settings/categories`             | `VPROC-0015` | `VPROC-0015::STEP-MAINTAIN_PRODUCT_PRESENTATION`     | Mantener producto, unidad y presentación         | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «mantener producto, unidad y presentación» dentro de gestionar ciclo de vida del catálogo de productos.         |
| `NEXO-ROUTE-041` | `/inventory/settings/fulfillment-routes`     | `VPROC-0028` | `VPROC-0028::STEP-CONFIGURE_REPLENISHMENT_POLICY`    | Configurar políticas y rutas de abastecimiento   | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «configurar políticas y rutas de abastecimiento» dentro de gestionar abastecimiento interno y remisiones.       |
| `NEXO-ROUTE-042` | `/inventory/settings/internal-prices`        | `VPROC-0054` | `VPROC-0054::STEP-MAINTAIN_INTERNAL_COST_RULES`      | Mantener reglas de precios internos              | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «mantener reglas de precios internos» dentro de gestionar costos, presupuesto, cierre y rentabilidad.           |
| `NEXO-ROUTE-043` | `/inventory/settings/locations/[id]/catalog` | `VPROC-0023` | `VPROC-0023::STEP-MAINTAIN_LOCATION_CATALOG`         | Mantener catálogo permitido por ubicación        | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «mantener catálogo permitido por ubicación» dentro de gestionar ubicaciones físicas.                            |
| `NEXO-ROUTE-044` | `/inventory/settings/products`               | `VPROC-0015` | `VPROC-0015::STEP-MAINTAIN_PRODUCT_PRESENTATION`     | Mantener producto, unidad y presentación         | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «mantener producto, unidad y presentación» dentro de gestionar ciclo de vida del catálogo de productos.         |
| `NEXO-ROUTE-045` | `/inventory/settings/remissions`             | `VPROC-0028` | `VPROC-0028::STEP-CONFIGURE_REPLENISHMENT_POLICY`    | Configurar políticas y rutas de abastecimiento   | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «configurar políticas y rutas de abastecimiento» dentro de gestionar abastecimiento interno y remisiones.       |
| `NEXO-ROUTE-046` | `/inventory/settings/remissions/products`    | `VPROC-0028` | `VPROC-0028::STEP-CONFIGURE_REPLENISHMENT_POLICY`    | Configurar políticas y rutas de abastecimiento   | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «configurar políticas y rutas de abastecimiento» dentro de gestionar abastecimiento interno y remisiones.       |
| `NEXO-ROUTE-047` | `/inventory/settings/request-policies`       | `VPROC-0028` | `VPROC-0028::STEP-CONFIGURE_REPLENISHMENT_POLICY`    | Configurar políticas y rutas de abastecimiento   | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «configurar políticas y rutas de abastecimiento» dentro de gestionar abastecimiento interno y remisiones.       |
| `NEXO-ROUTE-048` | `/inventory/settings/sites`                  | `VPROC-0002` | `VPROC-0002::STEP-MAINTAIN_ORGANIZATIONAL_STRUCTURE` | Mantener estructura operativa por sede           | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «mantener estructura operativa por sede» dentro de gobernar estructura organizativa.                            |
| `NEXO-ROUTE-049` | `/inventory/settings/sites/[id]/operations`  | `VPROC-0002` | `VPROC-0002::STEP-MAINTAIN_ORGANIZATIONAL_STRUCTURE` | Mantener estructura operativa por sede           | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «mantener estructura operativa por sede» dentro de gobernar estructura organizativa.                            |
| `NEXO-ROUTE-050` | `/inventory/settings/supply-routes`          | `VPROC-0028` | `VPROC-0028::STEP-CONFIGURE_REPLENISHMENT_POLICY`    | Configurar políticas y rutas de abastecimiento   | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «configurar políticas y rutas de abastecimiento» dentro de gestionar abastecimiento interno y remisiones.       |
| `NEXO-ROUTE-051` | `/inventory/settings/units`                  | `VPROC-0015` | `VPROC-0015::STEP-MAINTAIN_PRODUCT_PRESENTATION`     | Mantener producto, unidad y presentación         | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «mantener producto, unidad y presentación» dentro de gestionar ciclo de vida del catálogo de productos.         |
| `NEXO-ROUTE-052` | `/inventory/stock`                           | `VPROC-0024` | `VPROC-0024::STEP-CONSULT_STOCK_POSITION`            | Consultar posición de existencias                | `MONITOR`   | `CROSS_CUTTING` | `STEP_BOUND`              | El propósito dominante de la vista es «consultar posición de existencias» dentro de gestionar entradas, existencia y movimientos físicos.             |
| `NEXO-ROUTE-053` | `/inventory/stock/assign-location`           | `VPROC-0024` | `VPROC-0024::STEP-CONFIRM_STOCK_ENTRY`               | Asignar ubicación y confirmar entrada física     | `EXECUTE`   | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «asignar ubicación y confirmar entrada física» dentro de gestionar entradas, existencia y movimientos físicos.  |
| `NEXO-ROUTE-054` | `/inventory/transfers`                       | `VPROC-0025` | `VPROC-0025::STEP-EXECUTE_INTERNAL_TRANSFER`         | Ejecutar traslado interno                        | `EXECUTE`   | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «ejecutar traslado interno» dentro de gestionar retiros, transferencias y consumos.                             |
| `NEXO-ROUTE-055` | `/inventory/warehouse`                       | `VPROC-0023` | `VPROC-0023::STEP-CONSULT_LOCATION_CATALOG`          | Consultar catálogo de ubicaciones                | `MONITOR`   | `CROSS_CUTTING` | `REDIRECT_STEP_INHERITED` | La ruta de redirección hereda el paso dominante de `NEXO-ROUTE-020` sin crear un paso adicional.                                                      |
| `NEXO-ROUTE-056` | `/inventory/withdraw`                        | `VPROC-0025` | `VPROC-0025::STEP-EXECUTE_STOCK_WITHDRAWAL`          | Ejecutar retiro o consumo                        | `EXECUTE`   | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «ejecutar retiro o consumo» dentro de gestionar retiros, transferencias y consumos.                             |
| `NEXO-ROUTE-057` | `/kiosk/[slug]`                              | `VPROC-0024` | `VPROC-0024::STEP-CONSULT_STOCK_POSITION`            | Consultar posición de existencias                | `MONITOR`   | `CROSS_CUTTING` | `REDIRECT_STEP_INHERITED` | La ruta de redirección hereda el paso dominante de `NEXO-ROUTE-022` sin crear un paso adicional.                                                      |
| `NEXO-ROUTE-058` | `/l/[code]`                                  | `VPROC-0023` | `VPROC-0023::STEP-IDENTIFY_LOCATION_AND_CONTENT`     | Identificar ubicación y contenido                | `IDENTIFY`  | `IN_PROGRESS`   | `REDIRECT_STEP_INHERITED` | La ruta de redirección hereda el paso dominante de `NEXO-ROUTE-025` sin crear un paso adicional.                                                      |
| `NEXO-ROUTE-059` | `/login`                                     | `VPROC-0059` | `VPROC-0059::STEP-AUTHENTICATE_OR_RECOVER`           | Autenticar o recuperar la sesión                 | `VALIDATE`  | `INITIAL`       | `STEP_BOUND`              | El propósito dominante de la vista es «autenticar o recuperar la sesión» dentro de gestionar ciclo de acceso tecnológico.                             |
| `NEXO-ROUTE-060` | `/no-access`                                 | `VPROC-0059` | `VPROC-0059::STEP-RESOLVE_EFFECTIVE_CONTEXT`         | Explicar denegación y contexto efectivo          | `VALIDATE`  | `INITIAL`       | `STEP_BOUND`              | El propósito dominante de la vista es «explicar denegación y contexto efectivo» dentro de gestionar ciclo de acceso tecnológico.                      |
| `NEXO-ROUTE-061` | `/printing/designer`                         | `VPROC-0015` | `VPROC-0015::STEP-AUTHOR_LOGISTICS_LABEL_TEMPLATE`   | Diseñar etiqueta logística                       | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «diseñar etiqueta logística» dentro de gestionar ciclo de vida del catálogo de productos.                       |
| `NEXO-ROUTE-062` | `/printing/jobs`                             | `VPROC-0024` | `VPROC-0024::STEP-OPERATE_PRINT_QUEUE`               | Operar cola y trabajos de impresión              | `EXECUTE`   | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «operar cola y trabajos de impresión» dentro de gestionar entradas, existencia y movimientos físicos.           |
| `NEXO-ROUTE-063` | `/printing/setup`                            | `VPROC-0024` | `VPROC-0024::STEP-CONFIGURE_LOGISTICS_PRINTERS`      | Configurar impresoras logísticas                 | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «configurar impresoras logísticas» dentro de gestionar entradas, existencia y movimientos físicos.              |
| `NEXO-ROUTE-064` | `/scanner`                                   | `VPROC-0023` | `VPROC-0023::STEP-CONSULT_LOCATION_CATALOG`          | Consultar catálogo de ubicaciones                | `MONITOR`   | `CROSS_CUTTING` | `REDIRECT_STEP_INHERITED` | La ruta de redirección hereda el paso dominante de `NEXO-ROUTE-020` sin crear un paso adicional.                                                      |

##### FOGO

| View ID          | Vista o superficie        | process_id   | process_step                                 | Etiqueta                                | Rol         | Posición      | Estado       | Fundamento                                                                                                                       |
| ---------------- | ------------------------- | ------------ | -------------------------------------------- | --------------------------------------- | ----------- | ------------- | ------------ | -------------------------------------------------------------------------------------------------------------------------------- |
| `FOGO-ROUTE-001` | `/`                       | `VPROC-0033` | `VPROC-0033::STEP-TRIAGE_PRODUCTION_QUEUE`   | Priorizar cola de producción            | `TRIAGE`    | `INITIAL`     | `STEP_BOUND` | El propósito dominante de la vista es «priorizar cola de producción» dentro de planear producción.                               |
| `FOGO-ROUTE-002` | `/login`                  | `VPROC-0059` | `VPROC-0059::STEP-AUTHENTICATE_OR_RECOVER`   | Autenticar o recuperar la sesión        | `VALIDATE`  | `INITIAL`     | `STEP_BOUND` | El propósito dominante de la vista es «autenticar o recuperar la sesión» dentro de gestionar ciclo de acceso tecnológico.        |
| `FOGO-ROUTE-003` | `/no-access`              | `VPROC-0059` | `VPROC-0059::STEP-RESOLVE_EFFECTIVE_CONTEXT` | Explicar denegación y contexto efectivo | `VALIDATE`  | `INITIAL`     | `STEP_BOUND` | El propósito dominante de la vista es «explicar denegación y contexto efectivo» dentro de gestionar ciclo de acceso tecnológico. |
| `FOGO-ROUTE-004` | `/recipe-book`            | `VPROC-0016` | `VPROC-0016::STEP-CONSULT_APPLICABLE_RECIPE` | Consultar receta aplicable              | `MONITOR`   | `IN_PROGRESS` | `STEP_BOUND` | El propósito dominante de la vista es «consultar receta aplicable» dentro de gestionar ciclo de vida de recetas.                 |
| `FOGO-ROUTE-005` | `/recipes`                | `VPROC-0016` | `VPROC-0016::STEP-CONSULT_APPLICABLE_RECIPE` | Consultar catálogo de recetas           | `MONITOR`   | `IN_PROGRESS` | `STEP_BOUND` | El propósito dominante de la vista es «consultar catálogo de recetas» dentro de gestionar ciclo de vida de recetas.              |
| `FOGO-ROUTE-006` | `/recipes/new`            | `VPROC-0016` | `VPROC-0016::STEP-AUTHOR_RECIPE`             | Crear o editar receta                   | `CONFIGURE` | `IN_PROGRESS` | `STEP_BOUND` | El propósito dominante de la vista es «crear o editar receta» dentro de gestionar ciclo de vida de recetas.                      |
| `FOGO-ROUTE-007` | `/recipes/[id]/edit`      | `VPROC-0016` | `VPROC-0016::STEP-AUTHOR_RECIPE`             | Crear o editar receta                   | `CONFIGURE` | `IN_PROGRESS` | `STEP_BOUND` | El propósito dominante de la vista es «crear o editar receta» dentro de gestionar ciclo de vida de recetas.                      |
| `FOGO-ROUTE-008` | `/production-batches`     | `VPROC-0034` | `VPROC-0034::STEP-MONITOR_BATCH_EXECUTION`   | Monitorear lotes de producción          | `MONITOR`   | `IN_PROGRESS` | `STEP_BOUND` | El propósito dominante de la vista es «monitorear lotes de producción» dentro de ejecutar producción.                            |
| `FOGO-ROUTE-009` | `/production-batches/new` | `VPROC-0034` | `VPROC-0034::STEP-PREPARE_AND_START_BATCH`   | Preparar e iniciar lote                 | `EXECUTE`   | `INITIAL`     | `STEP_BOUND` | El propósito dominante de la vista es «preparar e iniciar lote» dentro de ejecutar producción.                                   |

##### ORIGO

| View ID           | Vista o superficie           | process_id   | process_step                                     | Etiqueta                                     | Rol         | Posición      | Estado       | Fundamento                                                                                                                                        |
| ----------------- | ---------------------------- | ------------ | ------------------------------------------------ | -------------------------------------------- | ----------- | ------------- | ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ORIGO-ROUTE-001` | `/`                          | `VPROC-0019` | `VPROC-0019::STEP-TRIAGE_PURCHASE_NEEDS`         | Priorizar necesidades de compra              | `TRIAGE`    | `INITIAL`     | `STEP_BOUND` | El propósito dominante de la vista es «priorizar necesidades de compra» dentro de gestionar necesidades y solicitudes de compra.                  |
| `ORIGO-ROUTE-002` | `/login`                     | `VPROC-0059` | `VPROC-0059::STEP-AUTHENTICATE_OR_RECOVER`       | Autenticar o recuperar la sesión             | `VALIDATE`  | `INITIAL`     | `STEP_BOUND` | El propósito dominante de la vista es «autenticar o recuperar la sesión» dentro de gestionar ciclo de acceso tecnológico.                         |
| `ORIGO-ROUTE-003` | `/no-access`                 | `VPROC-0059` | `VPROC-0059::STEP-RESOLVE_EFFECTIVE_CONTEXT`     | Explicar denegación y contexto efectivo      | `VALIDATE`  | `INITIAL`     | `STEP_BOUND` | El propósito dominante de la vista es «explicar denegación y contexto efectivo» dentro de gestionar ciclo de acceso tecnológico.                  |
| `ORIGO-ROUTE-004` | `/product-master-review`     | `VPROC-0015` | `VPROC-0015::STEP-REVIEW_PRODUCT_MASTER_REQUEST` | Revisar solicitud de producto o presentación | `REVIEW`    | `DECISION`    | `STEP_BOUND` | El propósito dominante de la vista es «revisar solicitud de producto o presentación» dentro de gestionar ciclo de vida del catálogo de productos. |
| `ORIGO-ROUTE-005` | `/purchase-orders`           | `VPROC-0021` | `VPROC-0021::STEP-MONITOR_PURCHASE_ORDER`        | Monitorear órdenes de compra                 | `MONITOR`   | `IN_PROGRESS` | `STEP_BOUND` | El propósito dominante de la vista es «monitorear órdenes de compra» dentro de aprobar y emitir órdenes de compra.                                |
| `ORIGO-ROUTE-006` | `/purchase-orders/[id]`      | `VPROC-0021` | `VPROC-0021::STEP-MONITOR_PURCHASE_ORDER`        | Monitorear detalle de orden de compra        | `MONITOR`   | `IN_PROGRESS` | `STEP_BOUND` | El propósito dominante de la vista es «monitorear detalle de orden de compra» dentro de aprobar y emitir órdenes de compra.                       |
| `ORIGO-ROUTE-007` | `/purchase-orders/[id]/edit` | `VPROC-0021` | `VPROC-0021::STEP-PREPARE_PURCHASE_ORDER`        | Preparar orden de compra                     | `CONFIGURE` | `IN_PROGRESS` | `STEP_BOUND` | El propósito dominante de la vista es «preparar orden de compra» dentro de aprobar y emitir órdenes de compra.                                    |
| `ORIGO-ROUTE-008` | `/purchase-orders/new`       | `VPROC-0021` | `VPROC-0021::STEP-PREPARE_PURCHASE_ORDER`        | Preparar orden de compra                     | `CONFIGURE` | `IN_PROGRESS` | `STEP_BOUND` | El propósito dominante de la vista es «preparar orden de compra» dentro de aprobar y emitir órdenes de compra.                                    |
| `ORIGO-ROUTE-009` | `/receipts`                  | `VPROC-0022` | `VPROC-0022::STEP-TRIAGE_RECEIPT_QUEUE`          | Priorizar recepciones pendientes             | `TRIAGE`    | `INITIAL`     | `STEP_BOUND` | El propósito dominante de la vista es «priorizar recepciones pendientes» dentro de gestionar recepción de compra y diferencias.                   |
| `ORIGO-ROUTE-010` | `/receipts/new`              | `VPROC-0022` | `VPROC-0022::STEP-RECEIVE_PURCHASE`              | Registrar recepción total o parcial          | `EXECUTE`   | `IN_PROGRESS` | `STEP_BOUND` | El propósito dominante de la vista es «registrar recepción total o parcial» dentro de gestionar recepción de compra y diferencias.                |
| `ORIGO-ROUTE-011` | `/suppliers`                 | `VPROC-0020` | `VPROC-0020::STEP-CONSULT_SUPPLIER_CATALOG`      | Consultar proveedores                        | `MONITOR`   | `IN_PROGRESS` | `STEP_BOUND` | El propósito dominante de la vista es «consultar proveedores» dentro de gestionar proveedores, cotizaciones y condiciones.                        |
| `ORIGO-ROUTE-012` | `/suppliers/[id]/edit`       | `VPROC-0020` | `VPROC-0020::STEP-ONBOARD_SUPPLIER`              | Dar de alta y mantener proveedor             | `CONFIGURE` | `IN_PROGRESS` | `STEP_BOUND` | El propósito dominante de la vista es «dar de alta y mantener proveedor» dentro de gestionar proveedores, cotizaciones y condiciones.             |
| `ORIGO-ROUTE-013` | `/suppliers/new`             | `VPROC-0020` | `VPROC-0020::STEP-ONBOARD_SUPPLIER`              | Dar de alta y mantener proveedor             | `CONFIGURE` | `IN_PROGRESS` | `STEP_BOUND` | El propósito dominante de la vista es «dar de alta y mantener proveedor» dentro de gestionar proveedores, cotizaciones y condiciones.             |

##### PULSO

| View ID           | Vista o superficie | process_id   | process_step                                    | Etiqueta                                        | Rol        | Posición      | Estado       | Fundamento                                                                                                                                 |
| ----------------- | ------------------ | ------------ | ----------------------------------------------- | ----------------------------------------------- | ---------- | ------------- | ------------ | ------------------------------------------------------------------------------------------------------------------------------------------ |
| `PULSO-ROUTE-001` | `/`                | `VPROC-0045` | `VPROC-0045::STEP-IDENTIFY_CUSTOMER_AND_ACCRUE` | Identificar cliente y operar fidelización       | `EXECUTE`  | `IN_PROGRESS` | `STEP_BOUND` | El propósito dominante de la vista es «identificar cliente y operar fidelización» dentro de gestionar identidad de cliente y fidelización. |
| `PULSO-ROUTE-002` | `/no-access`       | `VPROC-0059` | `VPROC-0059::STEP-RESOLVE_EFFECTIVE_CONTEXT`    | Explicar denegación y contexto efectivo         | `VALIDATE` | `INITIAL`     | `STEP_BOUND` | El propósito dominante de la vista es «explicar denegación y contexto efectivo» dentro de gestionar ciclo de acceso tecnológico.           |
| `PULSO-ROUTE-003` | `/orders`          | `VPROC-0039` | `VPROC-0039::STEP-MONITOR_ORDER_FULFILLMENT`    | Monitorear pedidos y cumplimiento               | `MONITOR`  | `IN_PROGRESS` | `STEP_BOUND` | El propósito dominante de la vista es «monitorear pedidos y cumplimiento» dentro de gestionar venta de mostrador o para llevar.            |
| `PULSO-ROUTE-004` | `/sales-imports`   | `VPROC-0051` | `VPROC-0051::STEP-CAPTURE_EXTERNAL_SALES_FACTS` | Capturar y publicar hechos de ventas importadas | `CAPTURE`  | `INITIAL`     | `STEP_BOUND` | El propósito dominante de la vista es «capturar y publicar hechos de ventas importadas» dentro de registrar y conciliar hechos económicos. |
| `PULSO-ROUTE-005` | `/salon`           | `VPROC-0038` | `VPROC-0038::STEP-MANAGE_TABLE_SERVICE`         | Gestionar mesa y servicio                       | `EXECUTE`  | `IN_PROGRESS` | `STEP_BOUND` | El propósito dominante de la vista es «gestionar mesa y servicio» dentro de gestionar servicio en mesa.                                    |
| `PULSO-ROUTE-006` | `/scanner`         | `VPROC-0045` | `VPROC-0045::STEP-IDENTIFY_CUSTOMER_AND_ACCRUE` | Identificar cliente y operar fidelización       | `EXECUTE`  | `IN_PROGRESS` | `STEP_BOUND` | El propósito dominante de la vista es «identificar cliente y operar fidelización» dentro de gestionar identidad de cliente y fidelización. |

##### VISO

| View ID          | Vista o superficie                   | process_id   | process_step                                             | Etiqueta                                           | Rol         | Posición        | Estado                    | Fundamento                                                                                                                                                |
| ---------------- | ------------------------------------ | ------------ | -------------------------------------------------------- | -------------------------------------------------- | ----------- | --------------- | ------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VISO-ROUTE-001` | `/`                                  | `VPROC-0001` | `VPROC-0001::STEP-REVIEW_EXECUTIVE_WORK`                 | Revisar prioridades y decisiones ejecutivas        | `MONITOR`   | `CROSS_CUTTING` | `STEP_BOUND`              | El propósito dominante de la vista es «revisar prioridades y decisiones ejecutivas» dentro de gobernar decisiones empresariales.                          |
| `VISO-ROUTE-002` | `/login`                             | `VPROC-0059` | `VPROC-0059::STEP-AUTHENTICATE_OR_RECOVER`               | Autenticar o recuperar la sesión                   | `VALIDATE`  | `INITIAL`       | `STEP_BOUND`              | El propósito dominante de la vista es «autenticar o recuperar la sesión» dentro de gestionar ciclo de acceso tecnológico.                                 |
| `VISO-ROUTE-003` | `/no-access`                         | `VPROC-0059` | `VPROC-0059::STEP-RESOLVE_EFFECTIVE_CONTEXT`             | Explicar denegación y contexto efectivo            | `VALIDATE`  | `INITIAL`       | `STEP_BOUND`              | El propósito dominante de la vista es «explicar denegación y contexto efectivo» dentro de gestionar ciclo de acceso tecnológico.                          |
| `VISO-ROUTE-004` | `/accounting`                        | `VPROC-0051` | `VPROC-0051::STEP-RECONCILE_ECONOMIC_FACTS`              | Revisar y conciliar hechos contables               | `RECONCILE` | `DECISION`      | `STEP_BOUND`              | El propósito dominante de la vista es «revisar y conciliar hechos contables» dentro de registrar y conciliar hechos económicos.                           |
| `VISO-ROUTE-005` | `/app-navigation`                    | `VPROC-0059` | `VPROC-0059::STEP-MAINTAIN_ACCESS_CATALOG`               | Mantener catálogo de navegación y acceso           | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «mantener catálogo de navegación y acceso» dentro de gestionar ciclo de acceso tecnológico.                         |
| `VISO-ROUTE-006` | `/app-updates`                       | `VPROC-0058` | `VPROC-0058::STEP-RESOLVE_TECH_SERVICE_CASE`             | Gestionar actualización y compatibilidad técnica   | `RECOVER`   | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «gestionar actualización y compatibilidad técnica» dentro de gestionar solicitudes e incidentes tecnológicos.       |
| `VISO-ROUTE-007` | `/businesses`                        | `VPROC-0002` | `VPROC-0002::STEP-MAINTAIN_ORGANIZATIONAL_STRUCTURE`     | Mantener estructura organizativa                   | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «mantener estructura organizativa» dentro de gobernar estructura organizativa.                                      |
| `VISO-ROUTE-008` | `/businesses/new`                    | `VPROC-0002` | `VPROC-0002::STEP-MAINTAIN_ORGANIZATIONAL_STRUCTURE`     | Mantener estructura organizativa                   | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «mantener estructura organizativa» dentro de gobernar estructura organizativa.                                      |
| `VISO-ROUTE-009` | `/businesses/[id]`                   | `VPROC-0002` | `VPROC-0002::STEP-MAINTAIN_ORGANIZATIONAL_STRUCTURE`     | Mantener estructura organizativa                   | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «mantener estructura organizativa» dentro de gobernar estructura organizativa.                                      |
| `VISO-ROUTE-010` | `/commercial-audit`                  | `VPROC-0061` | `VPROC-0061::STEP-ANALYZE_AND_PLAN_IMPROVEMENT`          | Analizar indicadores y gestionar mejora            | `ANALYZE`   | `CROSS_CUTTING` | `STEP_BOUND`              | El propósito dominante de la vista es «analizar indicadores y gestionar mejora» dentro de gestionar medición, análisis y mejora.                          |
| `VISO-ROUTE-011` | `/commercial-audit/structure`        | `VPROC-0061` | `VPROC-0061::STEP-ANALYZE_AND_PLAN_IMPROVEMENT`          | Analizar indicadores y gestionar mejora            | `ANALYZE`   | `CROSS_CUTTING` | `STEP_BOUND`              | El propósito dominante de la vista es «analizar indicadores y gestionar mejora» dentro de gestionar medición, análisis y mejora.                          |
| `VISO-ROUTE-012` | `/commercial-availability`           | `VPROC-0017` | `VPROC-0017::STEP-PUBLISH_COMMERCIAL_OFFER`              | Publicar disponibilidad comercial                  | `PUBLISH`   | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «publicar disponibilidad comercial» dentro de gestionar oferta, precio y disponibilidad comercial.                  |
| `VISO-ROUTE-013` | `/commercial-categories`             | `VPROC-0017` | `VPROC-0017::STEP-MAINTAIN_COMMERCIAL_OFFER`             | Mantener oferta, categoría, menú y personalización | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «mantener oferta, categoría, menú y personalización» dentro de gestionar oferta, precio y disponibilidad comercial. |
| `VISO-ROUTE-014` | `/commercial-collections`            | `VPROC-0017` | `VPROC-0017::STEP-MAINTAIN_COMMERCIAL_OFFER`             | Mantener oferta, categoría, menú y personalización | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «mantener oferta, categoría, menú y personalización» dentro de gestionar oferta, precio y disponibilidad comercial. |
| `VISO-ROUTE-015` | `/commercial-collections/overview`   | `VPROC-0017` | `VPROC-0017::STEP-ANALYZE_COMMERCIAL_OFFER`              | Analizar colecciones y oferta comercial            | `ANALYZE`   | `CROSS_CUTTING` | `STEP_BOUND`              | El propósito dominante de la vista es «analizar colecciones y oferta comercial» dentro de gestionar oferta, precio y disponibilidad comercial.            |
| `VISO-ROUTE-016` | `/commercial-menu`                   | `VPROC-0017` | `VPROC-0017::STEP-MAINTAIN_COMMERCIAL_OFFER`             | Mantener oferta, categoría, menú y personalización | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «mantener oferta, categoría, menú y personalización» dentro de gestionar oferta, precio y disponibilidad comercial. |
| `VISO-ROUTE-017` | `/content-blocks`                    | `VPROC-0056` | `VPROC-0056::STEP-TRIAGE_CONTENT_PORTFOLIO`              | Clasificar bloques de contenido                    | `TRIAGE`    | `IN_PROGRESS`   | `LEGACY_AS_IS_STEP_BOUND` | Ubica la superficie actual en el tramo editorial AS-IS sin admitir una pantalla canónica de AURA.                                                         |
| `VISO-ROUTE-018` | `/content-blocks/[id]`               | `VPROC-0056` | `VPROC-0056::STEP-EDIT_AND_PUBLISH_CONTENT`              | Editar y publicar bloque de contenido              | `PUBLISH`   | `DECISION`      | `LEGACY_AS_IS_STEP_BOUND` | Ubica la superficie actual en el tramo editorial AS-IS sin admitir una pantalla canónica de AURA.                                                         |
| `VISO-ROUTE-019` | `/delivery-rates`                    | `VPROC-0050` | `VPROC-0050::STEP-CONFIGURE_FULFILLMENT_RATE`            | Configurar tarifa y condición de entrega           | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «configurar tarifa y condición de entrega» dentro de gestionar entrega mediante tercero.                            |
| `VISO-ROUTE-020` | `/menu`                              | `VPROC-0017` | `VPROC-0017::STEP-MAINTAIN_COMMERCIAL_OFFER`             | Mantener oferta, categoría, menú y personalización | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «mantener oferta, categoría, menú y personalización» dentro de gestionar oferta, precio y disponibilidad comercial. |
| `VISO-ROUTE-021` | `/menu/new`                          | `VPROC-0017` | `VPROC-0017::STEP-MAINTAIN_COMMERCIAL_OFFER`             | Mantener oferta, categoría, menú y personalización | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «mantener oferta, categoría, menú y personalización» dentro de gestionar oferta, precio y disponibilidad comercial. |
| `VISO-ROUTE-022` | `/menu/[id]`                         | `VPROC-0017` | `VPROC-0017::STEP-MAINTAIN_COMMERCIAL_OFFER`             | Mantener oferta, categoría, menú y personalización | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «mantener oferta, categoría, menú y personalización» dentro de gestionar oferta, precio y disponibilidad comercial. |
| `VISO-ROUTE-023` | `/menu/[id]/personalizations/manage` | `VPROC-0017` | `VPROC-0017::STEP-MAINTAIN_COMMERCIAL_OFFER`             | Mantener oferta, categoría, menú y personalización | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «mantener oferta, categoría, menú y personalización» dentro de gestionar oferta, precio y disponibilidad comercial. |
| `VISO-ROUTE-024` | `/operations`                        | `VPROC-0007` | `VPROC-0007::STEP-REVIEW_WORKFORCE_OPERATIONS`           | Revisar operación laboral                          | `MONITOR`   | `CROSS_CUTTING` | `STEP_BOUND`              | El propósito dominante de la vista es «revisar operación laboral» dentro de gestionar asignación y programación laboral.                                  |
| `VISO-ROUTE-025` | `/operations/checkin-points`         | `VPROC-0008` | `VPROC-0008::STEP-CONFIGURE_ATTENDANCE_POINT`            | Configurar punto de marcación                      | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «configurar punto de marcación» dentro de gestionar asistencia y marcaciones.                                       |
| `VISO-ROUTE-026` | `/operations/employee-profiles`      | `VPROC-0007` | `VPROC-0007::STEP-MAINTAIN_WORK_ASSIGNMENT`              | Mantener asignaciones y roles operativos           | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «mantener asignaciones y roles operativos» dentro de gestionar asignación y programación laboral.                   |
| `VISO-ROUTE-027` | `/operations/preview`                | `VPROC-0059` | `VPROC-0059::STEP-SIMULATE_ACCESS_DECISION`              | Simular contexto y capacidad efectiva              | `SIMULATE`  | `DECISION`      | `STEP_BOUND`              | El propósito dominante de la vista es «simular contexto y capacidad efectiva» dentro de gestionar ciclo de acceso tecnológico.                            |
| `VISO-ROUTE-028` | `/operations/site-roles`             | `VPROC-0007` | `VPROC-0007::STEP-MAINTAIN_WORK_ASSIGNMENT`              | Mantener asignaciones y roles operativos           | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «mantener asignaciones y roles operativos» dentro de gestionar asignación y programación laboral.                   |
| `VISO-ROUTE-029` | `/operations-map`                    | `VPROC-0002` | `VPROC-0002::STEP-REVIEW_ORGANIZATIONAL_MAP`             | Revisar mapa organizativo y operativo              | `MONITOR`   | `CROSS_CUTTING` | `STEP_BOUND`              | El propósito dominante de la vista es «revisar mapa organizativo y operativo» dentro de gobernar estructura organizativa.                                 |
| `VISO-ROUTE-030` | `/ops/audit`                         | `VPROC-0061` | `VPROC-0061::STEP-ANALYZE_AND_PLAN_IMPROVEMENT`          | Analizar indicadores y gestionar mejora            | `ANALYZE`   | `CROSS_CUTTING` | `STEP_BOUND`              | El propósito dominante de la vista es «analizar indicadores y gestionar mejora» dentro de gestionar medición, análisis y mejora.                          |
| `VISO-ROUTE-031` | `/pass-users`                        | `VPROC-0045` | `VPROC-0045::STEP-MONITOR_LOYALTY_ACCOUNTS`              | Consultar cuentas de fidelización                  | `MONITOR`   | `CROSS_CUTTING` | `STEP_BOUND`              | El propósito dominante de la vista es «consultar cuentas de fidelización» dentro de gestionar identidad de cliente y fidelización.                        |
| `VISO-ROUTE-032` | `/pass-users/new`                    | `VPROC-0045` | `VPROC-0045::STEP-MAINTAIN_CUSTOMER_PROFILE_AND_CONSENT` | Gestionar perfil de fidelización y consentimiento  | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «gestionar perfil de fidelización y consentimiento» dentro de gestionar identidad de cliente y fidelización.        |
| `VISO-ROUTE-033` | `/pass-users/[id]`                   | `VPROC-0045` | `VPROC-0045::STEP-MAINTAIN_CUSTOMER_PROFILE_AND_CONSENT` | Gestionar perfil de fidelización y consentimiento  | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «gestionar perfil de fidelización y consentimiento» dentro de gestionar identidad de cliente y fidelización.        |
| `VISO-ROUTE-034` | `/products`                          | `VPROC-0015` | `VPROC-0015::STEP-CONSULT_PHYSICAL_PRODUCT_CATALOG`      | Consultar catálogo físico                          | `MONITOR`   | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «consultar catálogo físico» dentro de gestionar ciclo de vida del catálogo de productos.                            |
| `VISO-ROUTE-035` | `/products/new`                      | `VPROC-0015` | `VPROC-0015::STEP-MAINTAIN_PRODUCT_PRESENTATION`         | Mantener producto, unidad y presentación           | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «mantener producto, unidad y presentación» dentro de gestionar ciclo de vida del catálogo de productos.             |
| `VISO-ROUTE-036` | `/products/[id]`                     | `VPROC-0015` | `VPROC-0015::STEP-MAINTAIN_PRODUCT_PRESENTATION`         | Mantener producto, unidad y presentación           | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «mantener producto, unidad y presentación» dentro de gestionar ciclo de vida del catálogo de productos.             |
| `VISO-ROUTE-037` | `/roles-permissions`                 | `VPROC-0059` | `VPROC-0059::STEP-MAINTAIN_ACCESS_CATALOG`               | Mantener catálogo de roles y permisos              | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «mantener catálogo de roles y permisos» dentro de gestionar ciclo de acceso tecnológico.                            |
| `VISO-ROUTE-038` | `/sites`                             | `VPROC-0002` | `VPROC-0002::STEP-MAINTAIN_ORGANIZATIONAL_STRUCTURE`     | Mantener estructura organizativa                   | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «mantener estructura organizativa» dentro de gobernar estructura organizativa.                                      |
| `VISO-ROUTE-039` | `/sites/[id]`                        | `VPROC-0002` | `VPROC-0002::STEP-MAINTAIN_ORGANIZATIONAL_STRUCTURE`     | Mantener estructura organizativa                   | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «mantener estructura organizativa» dentro de gobernar estructura organizativa.                                      |
| `VISO-ROUTE-040` | `/sites/[id]/documentos`             | `VPROC-0060` | `VPROC-0060::STEP-GOVERN_DOCUMENT_EVIDENCE`              | Gobernar documentos y evidencia de sede            | `CONFIGURE` | `CROSS_CUTTING` | `STEP_BOUND`              | El propósito dominante de la vista es «gobernar documentos y evidencia de sede» dentro de gestionar documentos y evidencia.                               |
| `VISO-ROUTE-041` | `/staff`                             | `VPROC-0006` | `VPROC-0006::STEP-MAINTAIN_EMPLOYMENT_RECORD`            | Consultar directorio y expediente laboral          | `MONITOR`   | `CROSS_CUTTING` | `STEP_BOUND`              | El propósito dominante de la vista es «consultar directorio y expediente laboral» dentro de gestionar vinculación e incorporación laboral.                |
| `VISO-ROUTE-042` | `/staff/new`                         | `VPROC-0006` | `VPROC-0006::STEP-ORCHESTRATE_ONBOARDING`                | Orquestar vinculación e incorporación              | `EXECUTE`   | `INITIAL`       | `STEP_BOUND`              | El propósito dominante de la vista es «orquestar vinculación e incorporación» dentro de gestionar vinculación e incorporación laboral.                    |
| `VISO-ROUTE-043` | `/staff/[id]`                        | `VPROC-0006` | `VPROC-0006::STEP-MAINTAIN_EMPLOYMENT_RECORD`            | Mantener expediente laboral                        | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «mantener expediente laboral» dentro de gestionar vinculación e incorporación laboral.                              |
| `VISO-ROUTE-044` | `/staff/attendance`                  | `VPROC-0008` | `VPROC-0008::STEP-REVIEW_ATTENDANCE_EXCEPTION`           | Revisar asistencia y excepciones                   | `REVIEW`    | `DECISION`      | `STEP_BOUND`              | El propósito dominante de la vista es «revisar asistencia y excepciones» dentro de gestionar asistencia y marcaciones.                                    |
| `VISO-ROUTE-045` | `/staff/calendar`                    | `VPROC-0007` | `VPROC-0007::STEP-PLAN_AND_PUBLISH_SCHEDULE`             | Planear y publicar programación laboral            | `PLAN`      | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «planear y publicar programación laboral» dentro de gestionar asignación y programación laboral.                    |
| `VISO-ROUTE-046` | `/staff/schedule`                    | `VPROC-0007` | `VPROC-0007::STEP-PLAN_AND_PUBLISH_SCHEDULE`             | Planear y publicar programación laboral            | `PLAN`      | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «planear y publicar programación laboral» dentro de gestionar asignación y programación laboral.                    |
| `VISO-ROUTE-047` | `/staff/schedule/global`             | `VPROC-0007` | `VPROC-0007::STEP-PLAN_AND_PUBLISH_SCHEDULE`             | Planear y publicar programación laboral            | `PLAN`      | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «planear y publicar programación laboral» dentro de gestionar asignación y programación laboral.                    |
| `VISO-ROUTE-048` | `/staff/schedule/metrics`            | `VPROC-0061` | `VPROC-0061::STEP-ANALYZE_AND_PLAN_IMPROVEMENT`          | Analizar indicadores y gestionar mejora            | `ANALYZE`   | `CROSS_CUTTING` | `STEP_BOUND`              | El propósito dominante de la vista es «analizar indicadores y gestionar mejora» dentro de gestionar medición, análisis y mejora.                          |
| `VISO-ROUTE-049` | `/staff/schedule/settings`           | `VPROC-0007` | `VPROC-0007::STEP-CONFIGURE_SCHEDULE_POLICY`             | Configurar reglas de programación laboral          | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «configurar reglas de programación laboral» dentro de gestionar asignación y programación laboral.                  |
| `VISO-ROUTE-050` | `/staff/shared-devices/new`          | `VPROC-0059` | `VPROC-0059::STEP-GOVERN_SHARED_DEVICES`                 | Gobernar dispositivos compartidos                  | `CONFIGURE` | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «gobernar dispositivos compartidos» dentro de gestionar ciclo de acceso tecnológico.                                |
| `VISO-ROUTE-051` | `/vacancies`                         | `VPROC-0005` | `VPROC-0005::STEP-MANAGE_VACANCY_PIPELINE`               | Gestionar vacantes y candidatos                    | `TRIAGE`    | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «gestionar vacantes y candidatos» dentro de gestionar reclutamiento y selección.                                    |
| `VISO-ROUTE-052` | `/vacancies/new`                     | `VPROC-0005` | `VPROC-0005::STEP-INITIATE_RECRUITMENT_NEED`             | Crear vacante o necesidad de selección             | `INITIATE`  | `INITIAL`       | `STEP_BOUND`              | El propósito dominante de la vista es «crear vacante o necesidad de selección» dentro de gestionar reclutamiento y selección.                             |
| `VISO-ROUTE-053` | `/vacancies/[id]`                    | `VPROC-0005` | `VPROC-0005::STEP-MANAGE_VACANCY_PIPELINE`               | Revisar vacante y candidaturas                     | `REVIEW`    | `IN_PROGRESS`   | `STEP_BOUND`              | El propósito dominante de la vista es «revisar vacante y candidaturas» dentro de gestionar reclutamiento y selección.                                     |
| `VISO-ROUTE-054` | `/website-cms`                       | `VPROC-0056` | `VPROC-0056::STEP-TRIAGE_CONTENT_PORTFOLIO`              | Clasificar contenido y publicaciones               | `TRIAGE`    | `IN_PROGRESS`   | `LEGACY_AS_IS_STEP_BOUND` | Ubica la superficie actual en el tramo editorial AS-IS sin admitir una pantalla canónica de AURA.                                                         |
| `VISO-ROUTE-055` | `/website-cms/blocks/new`            | `VPROC-0056` | `VPROC-0056::STEP-AUTHOR_CONTENT`                        | Crear bloque editorial                             | `CONFIGURE` | `IN_PROGRESS`   | `LEGACY_AS_IS_STEP_BOUND` | Ubica la superficie actual en el tramo editorial AS-IS sin admitir una pantalla canónica de AURA.                                                         |
| `VISO-ROUTE-056` | `/website-cms/blocks/[id]`           | `VPROC-0056` | `VPROC-0056::STEP-EDIT_AND_PUBLISH_CONTENT`              | Editar y publicar bloque editorial                 | `PUBLISH`   | `DECISION`      | `LEGACY_AS_IS_STEP_BOUND` | Ubica la superficie actual en el tramo editorial AS-IS sin admitir una pantalla canónica de AURA.                                                         |
| `VISO-ROUTE-057` | `/website-cms/items/new`             | `VPROC-0056` | `VPROC-0056::STEP-AUTHOR_CONTENT`                        | Crear tarjeta de contenido                         | `CONFIGURE` | `IN_PROGRESS`   | `LEGACY_AS_IS_STEP_BOUND` | Ubica la superficie actual en el tramo editorial AS-IS sin admitir una pantalla canónica de AURA.                                                         |
| `VISO-ROUTE-058` | `/website-cms/items/[id]`            | `VPROC-0056` | `VPROC-0056::STEP-EDIT_AND_PUBLISH_CONTENT`              | Editar y publicar tarjeta de contenido             | `PUBLISH`   | `DECISION`      | `LEGACY_AS_IS_STEP_BOUND` | Ubica la superficie actual en el tramo editorial AS-IS sin admitir una pantalla canónica de AURA.                                                         |
| `VISO-ROUTE-059` | `/website-cms/venues`                | `VPROC-0056` | `VPROC-0056::STEP-TRIAGE_VENUE_CONTENT`                  | Clasificar contenido de restaurantes               | `TRIAGE`    | `IN_PROGRESS`   | `LEGACY_AS_IS_STEP_BOUND` | Ubica la superficie actual en el tramo editorial AS-IS sin admitir una pantalla canónica de AURA.                                                         |
| `VISO-ROUTE-060` | `/website-cms/venues/[slug]`         | `VPROC-0056` | `VPROC-0056::STEP-EDIT_AND_PUBLISH_VENUE_CONTENT`        | Editar y publicar detalle de restaurante           | `PUBLISH`   | `DECISION`      | `LEGACY_AS_IS_STEP_BOUND` | Ubica la superficie actual en el tramo editorial AS-IS sin admitir una pantalla canónica de AURA.                                                         |

##### NUMERA

| View ID            | Vista o superficie | process_id   | process_step                                      | Etiqueta                                  | Rol        | Posición        | Estado       | Fundamento                                                                                                                                        |
| ------------------ | ------------------ | ------------ | ------------------------------------------------- | ----------------------------------------- | ---------- | --------------- | ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| `NUMERA-ROUTE-001` | `/`                | `VPROC-0061` | `VPROC-0061::STEP-REVIEW_FINANCIAL_POSITION`      | Revisar posición financiera               | `MONITOR`  | `CROSS_CUTTING` | `STEP_BOUND` | El propósito dominante de la vista es «revisar posición financiera» dentro de gestionar medición, análisis y mejora.                              |
| `NUMERA-ROUTE-002` | `/login`           | `VPROC-0059` | `VPROC-0059::STEP-AUTHENTICATE_OR_RECOVER`        | Autenticar o recuperar la sesión          | `VALIDATE` | `INITIAL`       | `STEP_BOUND` | El propósito dominante de la vista es «autenticar o recuperar la sesión» dentro de gestionar ciclo de acceso tecnológico.                         |
| `NUMERA-ROUTE-003` | `/no-access`       | `VPROC-0059` | `VPROC-0059::STEP-RESOLVE_EFFECTIVE_CONTEXT`      | Explicar denegación y contexto efectivo   | `VALIDATE` | `INITIAL`       | `STEP_BOUND` | El propósito dominante de la vista es «explicar denegación y contexto efectivo» dentro de gestionar ciclo de acceso tecnológico.                  |
| `NUMERA-ROUTE-004` | `/cost-centers`    | `VPROC-0054` | `VPROC-0054::STEP-ALLOCATE_COSTS`                 | Distribuir y asignar costos por centro    | `EXECUTE`  | `IN_PROGRESS`   | `STEP_BOUND` | El propósito dominante de la vista es «distribuir y asignar costos por centro» dentro de gestionar costos, presupuesto, cierre y rentabilidad.    |
| `NUMERA-ROUTE-005` | `/expenses`        | `VPROC-0051` | `VPROC-0051::STEP-CAPTURE_EXPENSE_AND_EVIDENCE`   | Registrar gasto y soporte                 | `CAPTURE`  | `IN_PROGRESS`   | `STEP_BOUND` | El propósito dominante de la vista es «registrar gasto y soporte» dentro de registrar y conciliar hechos económicos.                              |
| `NUMERA-ROUTE-006` | `/break-even`      | `VPROC-0054` | `VPROC-0054::STEP-ANALYZE_COST_AND_PROFITABILITY` | Analizar costo, equilibrio y rentabilidad | `ANALYZE`  | `CROSS_CUTTING` | `STEP_BOUND` | El propósito dominante de la vista es «analizar costo, equilibrio y rentabilidad» dentro de gestionar costos, presupuesto, cierre y rentabilidad. |
| `NUMERA-ROUTE-007` | `/profitability`   | `VPROC-0054` | `VPROC-0054::STEP-ANALYZE_COST_AND_PROFITABILITY` | Analizar costo, equilibrio y rentabilidad | `ANALYZE`  | `CROSS_CUTTING` | `STEP_BOUND` | El propósito dominante de la vista es «analizar costo, equilibrio y rentabilidad» dentro de gestionar costos, presupuesto, cierre y rentabilidad. |

##### ANIMA

| View ID             | Vista o superficie                    | process_id   | process_step                                                | Etiqueta                                          | Rol            | Posición        | Estado       | Fundamento                                                                                                                                           |
| ------------------- | ------------------------------------- | ------------ | ----------------------------------------------------------- | ------------------------------------------------- | -------------- | --------------- | ------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ANIMA-SCREEN-001`  | `/`                                   | `VPROC-0059` | `VPROC-0059::STEP-ENTER_ECOSYSTEM`                          | Entrar al ecosistema laboral                      | `ENTRY`        | `PRECONDITION`  | `STEP_BOUND` | El propósito dominante de la vista es «entrar al ecosistema laboral» dentro de gestionar ciclo de acceso tecnológico.                                |
| `ANIMA-SCREEN-002`  | `/splash`                             | `VPROC-0059` | `VPROC-0059::STEP-VALIDATE_SESSION_BOOTSTRAP`               | Validar sesión y disponibilidad inicial           | `VALIDATE`     | `PRECONDITION`  | `STEP_BOUND` | El propósito dominante de la vista es «validar sesión y disponibilidad inicial» dentro de gestionar ciclo de acceso tecnológico.                     |
| `ANIMA-SCREEN-003`  | `/login`                              | `VPROC-0059` | `VPROC-0059::STEP-AUTHENTICATE_OR_RECOVER`                  | Autenticar o recuperar la sesión                  | `VALIDATE`     | `INITIAL`       | `STEP_BOUND` | El propósito dominante de la vista es «autenticar o recuperar la sesión» dentro de gestionar ciclo de acceso tecnológico.                            |
| `ANIMA-SCREEN-004`  | `/home`                               | `VPROC-0008` | `VPROC-0008::STEP-ENTER_ATTENDANCE_WORKSPACE`               | Entrar al espacio personal de asistencia          | `ENTRY`        | `PRECONDITION`  | `STEP_BOUND` | El propósito dominante de la vista es «entrar al espacio personal de asistencia» dentro de gestionar asistencia y marcaciones.                       |
| `ANIMA-SCREEN-005`  | `/shifts`                             | `VPROC-0007` | `VPROC-0007::STEP-CONSULT_PUBLISHED_SCHEDULE`               | Consultar programación publicada                  | `MONITOR`      | `IN_PROGRESS`   | `STEP_BOUND` | El propósito dominante de la vista es «consultar programación publicada» dentro de gestionar asignación y programación laboral.                      |
| `ANIMA-SCREEN-006`  | `/history`                            | `VPROC-0008` | `VPROC-0008::STEP-CONSULT_OR_REQUEST_ATTENDANCE_CORRECTION` | Consultar asistencia o solicitar corrección       | `SELF_SERVICE` | `IN_PROGRESS`   | `STEP_BOUND` | El propósito dominante de la vista es «consultar asistencia o solicitar corrección» dentro de gestionar asistencia y marcaciones.                    |
| `ANIMA-SCREEN-007`  | `/documents`                          | `VPROC-0060` | `VPROC-0060::STEP-CONSULT_OR_SUBMIT_EMPLOYMENT_DOCUMENT`    | Consultar o aportar documento laboral             | `SELF_SERVICE` | `IN_PROGRESS`   | `STEP_BOUND` | El propósito dominante de la vista es «consultar o aportar documento laboral» dentro de gestionar documentos y evidencia.                            |
| `ANIMA-SCREEN-008`  | `/carnet`                             | `VPROC-0006` | `VPROC-0006::STEP-PRESENT_EMPLOYEE_CREDENTIAL`              | Presentar carnet laboral                          | `IDENTIFY`     | `IN_PROGRESS`   | `STEP_BOUND` | El propósito dominante de la vista es «presentar carnet laboral» dentro de gestionar vinculación e incorporación laboral.                            |
| `ANIMA-SCREEN-009`  | `/announcements`                      | `VPROC-0004` | `VPROC-0004::STEP-CONSULT_AND_ACKNOWLEDGE_COMMUNICATION`    | Consultar y acusar comunicado laboral             | `SELF_SERVICE` | `IN_PROGRESS`   | `STEP_BOUND` | El propósito dominante de la vista es «consultar y acusar comunicado laboral» dentro de gestionar compromisos y comunicaciones internas.             |
| `ANIMA-SCREEN-010`  | `/operativo`                          | `VPROC-0061` | `VPROC-0061::STEP-REVIEW_OPERATIONAL_METRICS`               | Revisar indicadores operativos                    | `MONITOR`      | `CROSS_CUTTING` | `STEP_BOUND` | El propósito dominante de la vista es «revisar indicadores operativos» dentro de gestionar medición, análisis y mejora.                              |
| `ANIMA-SCREEN-011`  | `/team`                               | `VPROC-0006` | `VPROC-0006::STEP-CONSULT_WORKFORCE_DIRECTORY`              | Consultar directorio laboral permitido            | `MONITOR`      | `CROSS_CUTTING` | `STEP_BOUND` | El propósito dominante de la vista es «consultar directorio laboral permitido» dentro de gestionar vinculación e incorporación laboral.              |
| `ANIMA-SCREEN-012`  | `/support`                            | `VPROC-0058` | `VPROC-0058::STEP-SUBMIT_AND_TRACK_SUPPORT_REQUEST`         | Solicitar y seguir soporte                        | `SELF_SERVICE` | `INITIAL`       | `STEP_BOUND` | El propósito dominante de la vista es «solicitar y seguir soporte» dentro de gestionar solicitudes e incidentes tecnológicos.                        |
| `ANIMA-SCREEN-013`  | `/account-settings`                   | `VPROC-0059` | `VPROC-0059::STEP-MANAGE_ACCOUNT_SECURITY`                  | Gestionar seguridad de cuenta y sesiones          | `RECOVER`      | `CROSS_CUTTING` | `STEP_BOUND` | El propósito dominante de la vista es «gestionar seguridad de cuenta y sesiones» dentro de gestionar ciclo de acceso tecnológico.                    |
| `ANIMA-SCREEN-014`  | `/anima-diagnostics`                  | `VPROC-0058` | `VPROC-0058::STEP-DIAGNOSE_AND_ROUTE_SUPPORT`               | Diagnosticar y derivar soporte                    | `RECOVER`      | `IN_PROGRESS`   | `STEP_BOUND` | El propósito dominante de la vista es «diagnosticar y derivar soporte» dentro de gestionar solicitudes e incidentes tecnológicos.                    |
| `ANIMA-SURFACE-001` | `SitePickerModal`                     | `VPROC-0008` | `VPROC-0008::STEP-RESOLVE_ATTENDANCE_SITE`                  | Seleccionar sede válida para asistencia           | `IDENTIFY`     | `PRECONDITION`  | `STEP_BOUND` | El propósito dominante de la vista es «seleccionar sede válida para asistencia» dentro de gestionar asistencia y marcaciones.                        |
| `ANIMA-SURFACE-002` | `UserMenuModal`                       | `VPROC-0059` | `VPROC-0059::STEP-MANAGE_ACCOUNT_SECURITY`                  | Gestionar cuenta y sesión personal                | `RECOVER`      | `CROSS_CUTTING` | `STEP_BOUND` | El propósito dominante de la vista es «gestionar cuenta y sesión personal» dentro de gestionar ciclo de acceso tecnológico.                          |
| `ANIMA-SURFACE-003` | `CreateShiftModal`                    | `VPROC-0007` | `VPROC-0007::STEP-PLAN_AND_PUBLISH_SCHEDULE`                | Crear programación laboral                        | `PLAN`         | `IN_PROGRESS`   | `STEP_BOUND` | El propósito dominante de la vista es «crear programación laboral» dentro de gestionar asignación y programación laboral.                            |
| `ANIMA-SURFACE-004` | `EditShiftModal`                      | `VPROC-0007` | `VPROC-0007::STEP-PLAN_AND_PUBLISH_SCHEDULE`                | Editar programación laboral                       | `PLAN`         | `IN_PROGRESS`   | `STEP_BOUND` | El propósito dominante de la vista es «editar programación laboral» dentro de gestionar asignación y programación laboral.                           |
| `ANIMA-SURFACE-005` | `HistoryDetailModal`                  | `VPROC-0008` | `VPROC-0008::STEP-CONSULT_OR_REQUEST_ATTENDANCE_CORRECTION` | Consultar detalle de asistencia                   | `MONITOR`      | `IN_PROGRESS`   | `STEP_BOUND` | El propósito dominante de la vista es «consultar detalle de asistencia» dentro de gestionar asistencia y marcaciones.                                |
| `ANIMA-SURFACE-006` | `HistoryIncidentModal`                | `VPROC-0008` | `VPROC-0008::STEP-REPORT_ATTENDANCE_INCIDENT`               | Registrar incidencia de asistencia                | `SELF_SERVICE` | `INITIAL`       | `STEP_BOUND` | El propósito dominante de la vista es «registrar incidencia de asistencia» dentro de gestionar asistencia y marcaciones.                             |
| `ANIMA-SURFACE-007` | `UploadDocumentModal`                 | `VPROC-0060` | `VPROC-0060::STEP-CONSULT_OR_SUBMIT_EMPLOYMENT_DOCUMENT`    | Aportar documento laboral                         | `SELF_SERVICE` | `IN_PROGRESS`   | `STEP_BOUND` | El propósito dominante de la vista es «aportar documento laboral» dentro de gestionar documentos y evidencia.                                        |
| `ANIMA-SURFACE-008` | `DocumentPickerModal`                 | `VPROC-0060` | `VPROC-0060::STEP-SELECT_EMPLOYMENT_DOCUMENT`               | Seleccionar documento laboral                     | `IDENTIFY`     | `PRECONDITION`  | `STEP_BOUND` | El propósito dominante de la vista es «seleccionar documento laboral» dentro de gestionar documentos y evidencia.                                    |
| `ANIMA-SURFACE-009` | `AnnouncementFormModal`               | `VPROC-0004` | `VPROC-0004::STEP-PUBLISH_INTERNAL_COMMUNICATION`           | Publicar comunicación interna                     | `PUBLISH`      | `IN_PROGRESS`   | `STEP_BOUND` | El propósito dominante de la vista es «publicar comunicación interna» dentro de gestionar compromisos y comunicaciones internas.                     |
| `ANIMA-SURFACE-010` | `TeamEditModal`                       | `VPROC-0006` | `VPROC-0006::STEP-MAINTAIN_EMPLOYMENT_RECORD`               | Editar información laboral del equipo             | `CONFIGURE`    | `IN_PROGRESS`   | `STEP_BOUND` | El propósito dominante de la vista es «editar información laboral del equipo» dentro de gestionar vinculación e incorporación laboral.               |
| `ANIMA-SURFACE-011` | `TeamInviteModal`                     | `VPROC-0006` | `VPROC-0006::STEP-ORCHESTRATE_ONBOARDING`                   | Invitar e incorporar trabajador                   | `EXECUTE`      | `INITIAL`       | `STEP_BOUND` | El propósito dominante de la vista es «invitar e incorporar trabajador» dentro de gestionar vinculación e incorporación laboral.                     |
| `ANIMA-SURFACE-012` | `TeamDeleteModal`                     | `VPROC-0011` | `VPROC-0011::STEP-CLOSE_EMPLOYMENT_AND_REVOKE`              | Retirar trabajador y cerrar acceso                | `CLOSE`        | `TERMINAL`      | `STEP_BOUND` | El propósito dominante de la vista es «retirar trabajador y cerrar acceso» dentro de gestionar retiro y revocación coordinada.                       |
| `ANIMA-SURFACE-013` | `SupportTicketModal`                  | `VPROC-0058` | `VPROC-0058::STEP-SUBMIT_AND_TRACK_SUPPORT_REQUEST`         | Registrar solicitud de soporte                    | `SELF_SERVICE` | `INITIAL`       | `STEP_BOUND` | El propósito dominante de la vista es «registrar solicitud de soporte» dentro de gestionar solicitudes e incidentes tecnológicos.                    |
| `ANIMA-SURFACE-014` | `ContactWorkerModal`                  | `VPROC-0004` | `VPROC-0004::STEP-CONTACT_WORKER`                           | Contactar a un trabajador                         | `EXECUTE`      | `IN_PROGRESS`   | `STEP_BOUND` | El propósito dominante de la vista es «contactar a un trabajador» dentro de gestionar compromisos y comunicaciones internas.                         |
| `ANIMA-SURFACE-015` | `DataCleanupFlow`                     | `VPROC-0060` | `VPROC-0060::STEP-GOVERN_PRIVACY_AND_RETENTION`             | Gestionar limpieza, privacidad y conservación     | `CONFIGURE`    | `DECISION`      | `STEP_BOUND` | El propósito dominante de la vista es «gestionar limpieza, privacidad y conservación» dentro de gestionar documentos y evidencia.                    |
| `ANIMA-SURFACE-016` | `DeleteAccountFlow`                   | `VPROC-0059` | `VPROC-0059::STEP-CLOSE_ACCOUNT_ACCESS`                     | Cerrar cuenta y acceso personal                   | `CLOSE`        | `TERMINAL`      | `STEP_BOUND` | El propósito dominante de la vista es «cerrar cuenta y acceso personal» dentro de gestionar ciclo de acceso tecnológico.                             |
| `ANIMA-GLOBAL-001`  | `ErrorBoundary`                       | `VPROC-0062` | `VPROC-0062::STEP-ACTIVATE_AND_RECOVER_CONTINUITY`          | Recuperar operación después de error global       | `RECOVER`      | `IN_PROGRESS`   | `STEP_BOUND` | El propósito dominante de la vista es «recuperar operación después de error global» dentro de gestionar continuidad y recuperación.                  |
| `ANIMA-GLOBAL-002`  | `AppUpdateGate`                       | `VPROC-0058` | `VPROC-0058::STEP-RESTORE_APPLICATION_COMPATIBILITY`        | Restablecer compatibilidad mediante actualización | `RECOVER`      | `PRECONDITION`  | `STEP_BOUND` | El propósito dominante de la vista es «restablecer compatibilidad mediante actualización» dentro de gestionar solicitudes e incidentes tecnológicos. |
| `ANIMA-WEB-AUX-001` | `/api/request-password`               | `VPROC-0059` | `VPROC-0059::STEP-AUTHENTICATE_OR_RECOVER`                  | Solicitar recuperación de acceso                  | `RECOVER`      | `INITIAL`       | `STEP_BOUND` | El propósito dominante de la vista es «solicitar recuperación de acceso» dentro de gestionar ciclo de acceso tecnológico.                            |
| `ANIMA-WEB-AUX-002` | `/api/set-password`                   | `VPROC-0059` | `VPROC-0059::STEP-AUTHENTICATE_OR_RECOVER`                  | Establecer nueva credencial de acceso             | `RECOVER`      | `INITIAL`       | `STEP_BOUND` | El propósito dominante de la vista es «establecer nueva credencial de acceso» dentro de gestionar ciclo de acceso tecnológico.                       |
| `ANIMA-WEB-AUX-003` | `/privacy-policy`                     | `VPROC-0060` | `VPROC-0060::STEP-GOVERN_PRIVACY_AND_RETENTION`             | Consultar política de privacidad y conservación   | `MONITOR`      | `CROSS_CUTTING` | `STEP_BOUND` | El propósito dominante de la vista es «consultar política de privacidad y conservación» dentro de gestionar documentos y evidencia.                  |
| `ANIMA-WEB-AUX-004` | `/delete-account; /eliminar-cuenta`   | `VPROC-0059` | `VPROC-0059::STEP-CLOSE_ACCOUNT_ACCESS`                     | Solicitar cierre de cuenta y acceso               | `CLOSE`        | `TERMINAL`      | `STEP_BOUND` | El propósito dominante de la vista es «solicitar cierre de cuenta y acceso» dentro de gestionar ciclo de acceso tecnológico.                         |
| `ANIMA-WEB-AUX-005` | `web-auth index sin patrón explícito` | `VPROC-0059` | `VPROC-0059::STEP-ENTER_ECOSYSTEM`                          | Entrar al servicio web auxiliar                   | `ENTRY`        | `PRECONDITION`  | `STEP_BOUND` | El propósito dominante de la vista es «entrar al servicio web auxiliar» dentro de gestionar ciclo de acceso tecnológico.                             |

##### SHELL

| View ID             | Vista o superficie        | process_id   | process_step                               | Etiqueta                                              | Rol        | Posición        | Estado       | Fundamento                                                                                                                                     |
| ------------------- | ------------------------- | ------------ | ------------------------------------------ | ----------------------------------------------------- | ---------- | --------------- | ------------ | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| `SHELL-SURFACE-001` | `/ — Hub y launcher`      | `VPROC-0059` | `VPROC-0059::STEP-ENTER_ECOSYSTEM`         | Entrar al ecosistema y seleccionar trabajo disponible | `ENTRY`    | `PRECONDITION`  | `STEP_BOUND` | El propósito dominante de la vista es «entrar al ecosistema y seleccionar trabajo disponible» dentro de gestionar ciclo de acceso tecnológico. |
| `SHELL-SURFACE-002` | `/login — Acceso central` | `VPROC-0059` | `VPROC-0059::STEP-AUTHENTICATE_OR_RECOVER` | Autenticar o recuperar la sesión                      | `VALIDATE` | `INITIAL`       | `STEP_BOUND` | El propósito dominante de la vista es «autenticar o recuperar la sesión» dentro de gestionar ciclo de acceso tecnológico.                      |
| `SHELL-SURFACE-003` | `Tarjetas del launcher`   | `VPROC-0059` | `VPROC-0059::STEP-ENTER_ECOSYSTEM`         | Seleccionar aplicación disponible                     | `ENTRY`    | `PRECONDITION`  | `STEP_BOUND` | El propósito dominante de la vista es «seleccionar aplicación disponible» dentro de gestionar ciclo de acceso tecnológico.                     |
| `SHELL-SURFACE-004` | `Rail de logos`           | `VPROC-0059` | `VPROC-0059::STEP-ENTER_ECOSYSTEM`         | Seleccionar aplicación disponible                     | `ENTRY`    | `PRECONDITION`  | `STEP_BOUND` | El propósito dominante de la vista es «seleccionar aplicación disponible» dentro de gestionar ciclo de acceso tecnológico.                     |
| `SHELL-SURFACE-005` | `Menú de sesión`          | `VPROC-0059` | `VPROC-0059::STEP-MANAGE_ACCOUNT_SECURITY` | Gestionar cuenta y sesión                             | `RECOVER`  | `CROSS_CUTTING` | `STEP_BOUND` | El propósito dominante de la vista es «gestionar cuenta y sesión» dentro de gestionar ciclo de acceso tecnológico.                             |
| `SHELL-SURFACE-006` | `Formulario de acceso`    | `VPROC-0059` | `VPROC-0059::STEP-AUTHENTICATE_OR_RECOVER` | Autenticar la sesión                                  | `VALIDATE` | `INITIAL`       | `STEP_BOUND` | El propósito dominante de la vista es «autenticar la sesión» dentro de gestionar ciclo de acceso tecnológico.                                  |
| `SHELL-SURFACE-007` | `Modal de recuperación`   | `VPROC-0059` | `VPROC-0059::STEP-AUTHENTICATE_OR_RECOVER` | Recuperar acceso                                      | `RECOVER`  | `INITIAL`       | `STEP_BOUND` | El propósito dominante de la vista es «recuperar acceso» dentro de gestionar ciclo de acceso tecnológico.                                      |

##### PASS

| View ID                  | Vista o superficie                                    | process_id   | process_step                                        | Etiqueta                                         | Rol         | Posición       | Estado       | Fundamento                                                                                                                                        |
| ------------------------ | ----------------------------------------------------- | ------------ | --------------------------------------------------- | ------------------------------------------------ | ----------- | -------------- | ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| `PASS-LABOR-SURFACE-001` | `Contexto laboral en Header`                          | `VPROC-0059` | `VPROC-0059::STEP-RESOLVE_EFFECTIVE_CONTEXT`        | Resolver contexto laboral efectivo               | `VALIDATE`  | `PRECONDITION` | `STEP_BOUND` | El propósito dominante de la vista es «resolver contexto laboral efectivo» dentro de gestionar ciclo de acceso tecnológico.                       |
| `PASS-LABOR-SURFACE-002` | `Acciones de cambio o restablecimiento de rol y sede` | `VPROC-0059` | `VPROC-0059::STEP-ASSIGN_EFFECTIVE_ACCESS`          | Cambiar o restablecer rol y sede efectivos       | `CONFIGURE` | `IN_PROGRESS`  | `STEP_BOUND` | El propósito dominante de la vista es «cambiar o restablecer rol y sede efectivos» dentro de gestionar ciclo de acceso tecnológico.               |
| `PASS-LABOR-SURFACE-003` | `Modal Modo de prueba`                                | `VPROC-0059` | `VPROC-0059::STEP-SIMULATE_ACCESS_DECISION`         | Simular rol y sede sin alterar autoridad real    | `SIMULATE`  | `DECISION`     | `STEP_BOUND` | El propósito dominante de la vista es «simular rol y sede sin alterar autoridad real» dentro de gestionar ciclo de acceso tecnológico.            |
| `PULSO-PASS-SURFACE-001` | `/scanner — contenedor PASS`                          | `VPROC-0045` | `VPROC-0045::STEP-ENTER_LOYALTY_OPERATION`          | Entrar a la operación de fidelización            | `ENTRY`     | `PRECONDITION` | `STEP_BOUND` | El propósito dominante de la vista es «entrar a la operación de fidelización» dentro de gestionar identidad de cliente y fidelización.            |
| `PULSO-PASS-SURFACE-002` | `Modo identificación`                                 | `VPROC-0045` | `VPROC-0045::STEP-PRESENT_CUSTOMER_ID`              | Identificar cliente                              | `IDENTIFY`  | `IN_PROGRESS`  | `STEP_BOUND` | El propósito dominante de la vista es «identificar cliente» dentro de gestionar identidad de cliente y fidelización.                              |
| `PULSO-PASS-SURFACE-003` | `Tarjeta de cliente seleccionado`                     | `VPROC-0045` | `VPROC-0045::STEP-PRESENT_CUSTOMER_ID`              | Presentar cliente seleccionado                   | `IDENTIFY`  | `IN_PROGRESS`  | `STEP_BOUND` | El propósito dominante de la vista es «presentar cliente seleccionado» dentro de gestionar identidad de cliente y fidelización.                   |
| `PULSO-PASS-SURFACE-004` | `Formulario para otorgar puntos`                      | `VPROC-0045` | `VPROC-0045::STEP-IDENTIFY_CUSTOMER_AND_ACCRUE`     | Otorgar puntos a cliente identificado            | `EXECUTE`   | `IN_PROGRESS`  | `STEP_BOUND` | El propósito dominante de la vista es «otorgar puntos a cliente identificado» dentro de gestionar identidad de cliente y fidelización.            |
| `PULSO-PASS-SURFACE-005` | `Modo redención`                                      | `VPROC-0045` | `VPROC-0045::STEP-REDEEM_LOYALTY_VALUE`             | Redimir puntos o beneficios                      | `EXECUTE`   | `DECISION`     | `STEP_BOUND` | El propósito dominante de la vista es «redimir puntos o beneficios» dentro de gestionar identidad de cliente y fidelización.                      |
| `PULSO-PASS-SURFACE-006` | `Firma por PIN en dispositivo compartido`             | `VPROC-0059` | `VPROC-0059::STEP-VERIFY_SHARED_DEVICE_ACTOR`       | Verificar actor en dispositivo compartido        | `IDENTIFY`  | `PRECONDITION` | `STEP_BOUND` | El propósito dominante de la vista es «verificar actor en dispositivo compartido» dentro de gestionar ciclo de acceso tecnológico.                |
| `PULSO-PASS-SURFACE-007` | `Estados de carga, éxito y error`                     | `VPROC-0045` | `VPROC-0045::STEP-PRESENT_LOYALTY_OPERATION_RESULT` | Presentar resultado de operación de fidelización | `RECEIPT`   | `TERMINAL`     | `STEP_BOUND` | El propósito dominante de la vista es «presentar resultado de operación de fidelización» dentro de gestionar identidad de cliente y fidelización. |

##### AURA

| View ID                        | Vista o superficie                                | process_id   | process_step                                      | Etiqueta                                        | Rol         | Posición       | Estado                    | Fundamento                                                                                                                                  |
| ------------------------------ | ------------------------------------------------- | ------------ | ------------------------------------------------- | ----------------------------------------------- | ----------- | -------------- | ------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `AURA-PLACEHOLDER-001`         | `AppSwitcher AURA soon en aplicación consumidora` | `VPROC-0059` | `VPROC-0059::STEP-ENTER_ECOSYSTEM`                | Presentar entrada reservada de aplicación       | `ENTRY`     | `PRECONDITION` | `STEP_BOUND`              | El propósito dominante de la vista es «presentar entrada reservada de aplicación» dentro de gestionar ciclo de acceso tecnológico.          |
| `AURA-PLACEHOLDER-002`         | `AppSwitcher AURA soon en aplicación consumidora` | `VPROC-0059` | `VPROC-0059::STEP-ENTER_ECOSYSTEM`                | Presentar entrada reservada de aplicación       | `ENTRY`     | `PRECONDITION` | `STEP_BOUND`              | El propósito dominante de la vista es «presentar entrada reservada de aplicación» dentro de gestionar ciclo de acceso tecnológico.          |
| `AURA-PLACEHOLDER-003`         | `AppSwitcher AURA soon en aplicación consumidora` | `VPROC-0059` | `VPROC-0059::STEP-ENTER_ECOSYSTEM`                | Presentar entrada reservada de aplicación       | `ENTRY`     | `PRECONDITION` | `STEP_BOUND`              | El propósito dominante de la vista es «presentar entrada reservada de aplicación» dentro de gestionar ciclo de acceso tecnológico.          |
| `AURA-PLACEHOLDER-004`         | `AppSwitcher AURA soon en aplicación consumidora` | `VPROC-0059` | `VPROC-0059::STEP-ENTER_ECOSYSTEM`                | Presentar entrada reservada de aplicación       | `ENTRY`     | `PRECONDITION` | `STEP_BOUND`              | El propósito dominante de la vista es «presentar entrada reservada de aplicación» dentro de gestionar ciclo de acceso tecnológico.          |
| `AURA-PLACEHOLDER-005`         | `AppSwitcher AURA soon en aplicación consumidora` | `VPROC-0059` | `VPROC-0059::STEP-ENTER_ECOSYSTEM`                | Presentar entrada reservada de aplicación       | `ENTRY`     | `PRECONDITION` | `STEP_BOUND`              | El propósito dominante de la vista es «presentar entrada reservada de aplicación» dentro de gestionar ciclo de acceso tecnológico.          |
| `AURA-PLACEHOLDER-006`         | `Metadata AURA por returnTo en login`             | `VPROC-0059` | `VPROC-0059::STEP-ENTER_ECOSYSTEM`                | Presentar entrada reservada de aplicación       | `ENTRY`     | `PRECONDITION` | `STEP_BOUND`              | El propósito dominante de la vista es «presentar entrada reservada de aplicación» dentro de gestionar ciclo de acceso tecnológico.          |
| `AURA-PLACEHOLDER-007`         | `Chip visible AURA en login central`              | `VPROC-0059` | `VPROC-0059::STEP-ENTER_ECOSYSTEM`                | Presentar entrada reservada de aplicación       | `ENTRY`     | `PRECONDITION` | `STEP_BOUND`              | El propósito dominante de la vista es «presentar entrada reservada de aplicación» dentro de gestionar ciclo de acceso tecnológico.          |
| `AURA-CURRENT-ADMIN-ROUTE-001` | `Alias documental de VISO-ROUTE-054`              | `VPROC-0056` | `VPROC-0056::STEP-TRIAGE_CONTENT_PORTFOLIO`       | Clasificar contenido y publicaciones            | `TRIAGE`    | `IN_PROGRESS`  | `ALIAS_INHERITED`         | Hereda exactamente el paso de `VISO-ROUTE-054` y no crea otra vista ni otra ancla.                                                          |
| `AURA-CURRENT-ADMIN-ROUTE-002` | `Alias documental de VISO-ROUTE-059`              | `VPROC-0056` | `VPROC-0056::STEP-TRIAGE_VENUE_CONTENT`           | Clasificar contenido de restaurantes            | `TRIAGE`    | `IN_PROGRESS`  | `ALIAS_INHERITED`         | Hereda exactamente el paso de `VISO-ROUTE-059` y no crea otra vista ni otra ancla.                                                          |
| `AURA-CURRENT-ADMIN-ROUTE-003` | `Alias documental de VISO-ROUTE-057`              | `VPROC-0056` | `VPROC-0056::STEP-AUTHOR_CONTENT`                 | Crear tarjeta de contenido                      | `CONFIGURE` | `IN_PROGRESS`  | `ALIAS_INHERITED`         | Hereda exactamente el paso de `VISO-ROUTE-057` y no crea otra vista ni otra ancla.                                                          |
| `AURA-CURRENT-ADMIN-ROUTE-004` | `Alias documental de VISO-ROUTE-055`              | `VPROC-0056` | `VPROC-0056::STEP-AUTHOR_CONTENT`                 | Crear bloque editorial                          | `CONFIGURE` | `IN_PROGRESS`  | `ALIAS_INHERITED`         | Hereda exactamente el paso de `VISO-ROUTE-055` y no crea otra vista ni otra ancla.                                                          |
| `AURA-CURRENT-ADMIN-ROUTE-005` | `Alias documental de VISO-ROUTE-058`              | `VPROC-0056` | `VPROC-0056::STEP-EDIT_AND_PUBLISH_CONTENT`       | Editar y publicar tarjeta de contenido          | `PUBLISH`   | `DECISION`     | `ALIAS_INHERITED`         | Hereda exactamente el paso de `VISO-ROUTE-058` y no crea otra vista ni otra ancla.                                                          |
| `AURA-CURRENT-ADMIN-ROUTE-006` | `Alias documental de VISO-ROUTE-056`              | `VPROC-0056` | `VPROC-0056::STEP-EDIT_AND_PUBLISH_CONTENT`       | Editar y publicar bloque editorial              | `PUBLISH`   | `DECISION`     | `ALIAS_INHERITED`         | Hereda exactamente el paso de `VISO-ROUTE-056` y no crea otra vista ni otra ancla.                                                          |
| `AURA-CURRENT-ADMIN-ROUTE-007` | `Alias documental de VISO-ROUTE-060`              | `VPROC-0056` | `VPROC-0056::STEP-EDIT_AND_PUBLISH_VENUE_CONTENT` | Editar y publicar detalle de restaurante        | `PUBLISH`   | `DECISION`     | `ALIAS_INHERITED`         | Hereda exactamente el paso de `VISO-ROUTE-060` y no crea otra vista ni otra ancla.                                                          |
| `AURA-CURRENT-SURFACE-001`     | `Panel, filtros, accesos rápidos y listados`      | `VPROC-0056` | `VPROC-0056::STEP-TRIAGE_CONTENT_PORTFOLIO`       | Clasificar contenido y publicaciones            | `TRIAGE`    | `IN_PROGRESS`  | `LEGACY_AS_IS_STEP_BOUND` | Ubica la superficie actual en el tramo editorial AS-IS sin admitir una pantalla canónica de AURA.                                           |
| `AURA-CURRENT-SURFACE-002`     | `Creación de tarjetas de contenido`               | `VPROC-0056` | `VPROC-0056::STEP-AUTHOR_CONTENT`                 | Crear tarjeta de contenido                      | `CONFIGURE` | `IN_PROGRESS`  | `LEGACY_AS_IS_STEP_BOUND` | Ubica la superficie actual en el tramo editorial AS-IS sin admitir una pantalla canónica de AURA.                                           |
| `AURA-CURRENT-SURFACE-003`     | `Edición, completitud y publicación de tarjetas`  | `VPROC-0056` | `VPROC-0056::STEP-EDIT_AND_PUBLISH_CONTENT`       | Editar y publicar tarjeta de contenido          | `PUBLISH`   | `DECISION`     | `LEGACY_AS_IS_STEP_BOUND` | Ubica la superficie actual en el tramo editorial AS-IS sin admitir una pantalla canónica de AURA.                                           |
| `AURA-CURRENT-SURFACE-004`     | `Control de eliminación de tarjeta`               | `VPROC-0056` | `VPROC-0056::STEP-RETIRE_CONTENT`                 | Retirar tarjeta conservando evidencia           | `CORRECT`   | `DECISION`     | `LEGACY_AS_IS_STEP_BOUND` | Ubica la superficie actual en el tramo editorial AS-IS sin admitir una pantalla canónica de AURA.                                           |
| `AURA-CURRENT-SURFACE-005`     | `Creación de bloque editorial`                    | `VPROC-0056` | `VPROC-0056::STEP-AUTHOR_CONTENT`                 | Crear bloque editorial                          | `CONFIGURE` | `IN_PROGRESS`  | `LEGACY_AS_IS_STEP_BOUND` | Ubica la superficie actual en el tramo editorial AS-IS sin admitir una pantalla canónica de AURA.                                           |
| `AURA-CURRENT-SURFACE-006`     | `Edición y publicación de bloque`                 | `VPROC-0056` | `VPROC-0056::STEP-EDIT_AND_PUBLISH_CONTENT`       | Editar y publicar bloque editorial              | `PUBLISH`   | `DECISION`     | `LEGACY_AS_IS_STEP_BOUND` | Ubica la superficie actual en el tramo editorial AS-IS sin admitir una pantalla canónica de AURA.                                           |
| `AURA-CURRENT-SURFACE-007`     | `Importación y listado de restaurantes`           | `VPROC-0056` | `VPROC-0056::STEP-TRIAGE_VENUE_CONTENT`           | Importar y clasificar contenido de restaurantes | `TRIAGE`    | `IN_PROGRESS`  | `LEGACY_AS_IS_STEP_BOUND` | Ubica la superficie actual en el tramo editorial AS-IS sin admitir una pantalla canónica de AURA.                                           |
| `AURA-CURRENT-SURFACE-008`     | `Editor y previsualización de detalle`            | `VPROC-0056` | `VPROC-0056::STEP-EDIT_AND_PUBLISH_VENUE_CONTENT` | Editar y previsualizar detalle de restaurante   | `PUBLISH`   | `DECISION`     | `LEGACY_AS_IS_STEP_BOUND` | Ubica la superficie actual en el tramo editorial AS-IS sin admitir una pantalla canónica de AURA.                                           |
| `AURA-CURRENT-SURFACE-009`     | `Carga de imagen o video`                         | `VPROC-0056` | `VPROC-0056::STEP-CAPTURE_CONTENT_MEDIA`          | Cargar imagen o video de contenido              | `CAPTURE`   | `IN_PROGRESS`  | `LEGACY_AS_IS_STEP_BOUND` | Ubica la superficie actual en el tramo editorial AS-IS sin admitir una pantalla canónica de AURA.                                           |
| `AURA-CURRENT-PUBLIC-001`      | `/ — sitio público`                               | `VPROC-0017` | `VPROC-0017::STEP-BROWSE_COMMERCIAL_OFFER`        | Consultar oferta comercial publicada            | `MONITOR`   | `IN_PROGRESS`  | `STEP_BOUND`              | El propósito dominante de la vista es «consultar oferta comercial publicada» dentro de gestionar oferta, precio y disponibilidad comercial. |
| `AURA-CURRENT-PUBLIC-002`      | `/restaurantes`                                   | `VPROC-0017` | `VPROC-0017::STEP-BROWSE_COMMERCIAL_OFFER`        | Consultar oferta comercial publicada            | `MONITOR`   | `IN_PROGRESS`  | `STEP_BOUND`              | El propósito dominante de la vista es «consultar oferta comercial publicada» dentro de gestionar oferta, precio y disponibilidad comercial. |
| `AURA-CURRENT-PUBLIC-003`      | `/restaurantes/[slug]`                            | `VPROC-0017` | `VPROC-0017::STEP-BROWSE_COMMERCIAL_OFFER`        | Consultar oferta comercial publicada            | `MONITOR`   | `IN_PROGRESS`  | `STEP_BOUND`              | El propósito dominante de la vista es «consultar oferta comercial publicada» dentro de gestionar oferta, precio y disponibilidad comercial. |
| `AURA-CURRENT-PUBLIC-004`      | `/empleos`                                        | `VPROC-0005` | `VPROC-0005::STEP-CONSULT_OPEN_VACANCIES`         | Consultar vacantes publicadas                   | `MONITOR`   | `IN_PROGRESS`  | `STEP_BOUND`              | El propósito dominante de la vista es «consultar vacantes publicadas» dentro de gestionar reclutamiento y selección.                        |
| `AURA-CURRENT-PUBLIC-005`      | `/servicios`                                      | `VPROC-0017` | `VPROC-0017::STEP-BROWSE_COMMERCIAL_OFFER`        | Consultar oferta comercial publicada            | `MONITOR`   | `IN_PROGRESS`  | `STEP_BOUND`              | El propósito dominante de la vista es «consultar oferta comercial publicada» dentro de gestionar oferta, precio y disponibilidad comercial. |
| `AURA-CURRENT-PUBLIC-006`      | `/ecosistema`                                     | `VPROC-0017` | `VPROC-0017::STEP-BROWSE_COMMERCIAL_OFFER`        | Consultar oferta comercial publicada            | `MONITOR`   | `IN_PROGRESS`  | `STEP_BOUND`              | El propósito dominante de la vista es «consultar oferta comercial publicada» dentro de gestionar oferta, precio y disponibilidad comercial. |
| `AURA-CURRENT-PUBLIC-007`      | `/eventos → /restaurantes`                        | `VPROC-0017` | `VPROC-0017::STEP-BROWSE_COMMERCIAL_OFFER`        | Consultar oferta comercial publicada            | `MONITOR`   | `IN_PROGRESS`  | `REDIRECT_STEP_INHERITED` | La ruta de redirección hereda el paso dominante de `AURA-CURRENT-PUBLIC-002` sin crear un paso adicional.                                   |

#### 8. Distribuciones de control

##### 8.1 Por rol de paso

| Rol de paso    | Vistas únicas |
| -------------- | ------------- |
| `ANALYZE`      | 7             |
| `AUDIT`        | 3             |
| `CAPTURE`      | 5             |
| `CLOSE`        | 3             |
| `CONFIGURE`    | 61            |
| `CORRECT`      | 1             |
| `DECIDE`       | 1             |
| `ENTRY`        | 14            |
| `EXECUTE`      | 24            |
| `IDENTIFY`     | 9             |
| `INITIATE`     | 2             |
| `MONITOR`      | 41            |
| `PLAN`         | 5             |
| `PUBLISH`      | 9             |
| `RECEIPT`      | 1             |
| `RECONCILE`    | 2             |
| `RECOVER`      | 10            |
| `REVIEW`       | 4             |
| `SELF_SERVICE` | 7             |
| `SIMULATE`     | 2             |
| `TRIAGE`       | 9             |
| `VALIDATE`     | 16            |

##### 8.2 Por posición de ciclo

| Posición de ciclo | Vistas únicas |
| ----------------- | ------------- |
| `PRECONDITION`    | 20            |
| `INITIAL`         | 30            |
| `IN_PROGRESS`     | 132           |
| `DECISION`        | 18            |
| `TERMINAL`        | 4             |
| `CROSS_CUTTING`   | 32            |

##### 8.3 Por estado de vínculo

| Estado de vínculo         | Filas |
| ------------------------- | ----- |
| `ALIAS_INHERITED`         | 7     |
| `LEGACY_AS_IS_STEP_BOUND` | 18    |
| `REDIRECT_STEP_INHERITED` | 5     |
| `STEP_BOUND`              | 213   |

##### 8.4 Por proceso

| process_id   | Proceso                                              | Vistas únicas | Anclas distintas |
| ------------ | ---------------------------------------------------- | ------------- | ---------------- |
| `VPROC-0001` | Gobernar decisiones empresariales                    | 1             | 1                |
| `VPROC-0002` | Gobernar estructura organizativa                     | 8             | 2                |
| `VPROC-0003` | Gobernar políticas, delegaciones y límites           | 1             | 1                |
| `VPROC-0004` | Gestionar compromisos y comunicaciones internas      | 3             | 3                |
| `VPROC-0005` | Gestionar reclutamiento y selección                  | 4             | 3                |
| `VPROC-0006` | Gestionar vinculación e incorporación laboral        | 7             | 4                |
| `VPROC-0007` | Gestionar asignación y programación laboral          | 10            | 5                |
| `VPROC-0008` | Gestionar asistencia y marcaciones                   | 7             | 6                |
| `VPROC-0011` | Gestionar retiro y revocación coordinada             | 1             | 1                |
| `VPROC-0015` | Gestionar ciclo de vida del catálogo de productos    | 13            | 4                |
| `VPROC-0016` | Gestionar ciclo de vida de recetas                   | 4             | 2                |
| `VPROC-0017` | Gestionar oferta, precio y disponibilidad comercial  | 15            | 4                |
| `VPROC-0018` | Gestionar especificaciones y criterios de calidad    | 1             | 1                |
| `VPROC-0019` | Gestionar necesidades y solicitudes de compra        | 1             | 1                |
| `VPROC-0020` | Gestionar proveedores, cotizaciones y condiciones    | 3             | 2                |
| `VPROC-0021` | Aprobar y emitir órdenes de compra                   | 4             | 2                |
| `VPROC-0022` | Gestionar recepción de compra y diferencias          | 2             | 2                |
| `VPROC-0023` | Gestionar ubicaciones físicas                        | 9             | 3                |
| `VPROC-0024` | Gestionar entradas, existencia y movimientos físicos | 9             | 5                |
| `VPROC-0025` | Gestionar retiros, transferencias y consumos         | 3             | 2                |
| `VPROC-0026` | Gestionar conteos y ajustes de inventario            | 3             | 3                |
| `VPROC-0028` | Gestionar abastecimiento interno y remisiones        | 14            | 6                |
| `VPROC-0029` | Gestionar activos, custodia y transferencias         | 7             | 4                |
| `VPROC-0032` | Gestionar contenedores y reutilizables               | 1             | 1                |
| `VPROC-0033` | Planear producción                                   | 1             | 1                |
| `VPROC-0034` | Ejecutar producción                                  | 3             | 2                |
| `VPROC-0038` | Gestionar servicio en mesa                           | 1             | 1                |
| `VPROC-0039` | Gestionar venta de mostrador o para llevar           | 1             | 1                |
| `VPROC-0045` | Gestionar identidad de cliente y fidelización        | 11            | 7                |
| `VPROC-0050` | Gestionar entrega mediante tercero                   | 1             | 1                |
| `VPROC-0051` | Registrar y conciliar hechos económicos              | 3             | 3                |
| `VPROC-0054` | Gestionar costos, presupuesto, cierre y rentabilidad | 5             | 3                |
| `VPROC-0056` | Gestionar contenido y promociones                    | 18            | 7                |
| `VPROC-0058` | Gestionar solicitudes e incidentes tecnológicos      | 5             | 4                |
| `VPROC-0059` | Gestionar ciclo de acceso tecnológico                | 43            | 11               |
| `VPROC-0060` | Gestionar documentos y evidencia                     | 6             | 4                |
| `VPROC-0061` | Gestionar medición, análisis y mejora                | 6             | 3                |
| `VPROC-0062` | Gestionar continuidad y recuperación                 | 1             | 1                |

La cantidad de vistas o anclas no mide madurez, volumen, prioridad, permiso ni cobertura total del proceso. Un proceso puede contener pasos automáticos, externos o físicos sin pantalla.

#### 9. Reconciliaciones críticas

##### 9.1 Congelación de `AUTH-UI-011`

Los 243 valores `primary_process_id` se preservan sin cambios. Esta tarea agrega ubicación funcional; no reabre la selección de proceso.

##### 9.2 Aliases y redirecciones

- los siete aliases administrativos AURA heredan exactamente el paso de su ruta VISO fuente;
- `/eventos` hereda el paso público de `/restaurantes`;
- las redirecciones NEXO heredan el paso del destino funcional;
- heredar un paso no crea una nueva ancla empresarial ni otra pantalla canónica.

##### 9.3 AURA diferida y contenido AS-IS

AURA conserva cero pantallas standalone. Las superficies editoriales actuales de VISO reciben anclas AS-IS de `VPROC-0056` para triage, autoría, edición, publicación, retiro y carga de medios. Esto no:

- admite pantallas canónicas AURA;
- habilita `aura.access`;
- transfiere propiedad desde VISO;
- desbloquea BLOQUE W;
- materializa `VPROC-0057`.

##### 9.4 VPROC-0057

No existe una vista AS-IS que convierta consultas digitales en oportunidades trazables. El proceso permanece sin vista y sin `process_step` inventado.

##### 9.5 PASS laboral

Las superficies laborales relacionadas con PASS distinguen:

- resolución de contexto;
- cambio y simulación de rol o sede;
- identificación de cliente;
- acumulación y redención;
- verificación del actor efectivo mediante PIN;
- presentación del resultado confirmado.

#### 10. Exclusiones explícitas

No reciben `process_step` como vistas:

- route handlers y APIs;
- server actions y RPC;
- middleware;
- layouts y loading boundaries;
- templates, iconos y primitivas UI;
- módulos de soporte no visual;
- componentes dormantes no montados;
- el template AURA no runtime.

#### 11. Validaciones obligatorias

La compilación deberá fallar cuando:

1. el registro no contenga exactamente 243 filas;
2. no existan exactamente 236 vistas únicas y siete aliases;
3. un `view_id` aparezca más de una vez;
4. una vista única carezca de `primary_process_step_ref`;
5. el prefijo del paso no coincida con `primary_process_id`;
6. la referencia no cumpla el formato aprobado;
7. el rol o la posición no pertenezcan al vocabulario;
8. un alias difiera de su fuente;
9. un redirect cree un paso artificial;
10. se modifique un `process_id` aprobado en `AUTH-UI-011`;
11. se introduzca propiedad, consumo, permiso, actor, dispositivo, acción o menú;
12. AURA reciba una pantalla standalone o `VPROC-0057` reciba una vista artificial;
13. un artefacto técnico sea contado como vista;
14. los conteos declarados difieran de la matriz física.

#### 12. Requisitos de prueba derivados

Se incorporan al registro canónico completo:

```text
TREQ-UX-1507 a TREQ-UX-1530
```

| ID             | Regla protegida                                                                                                                                                                                       |
| -------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `TREQ-UX-1507` | El registro AS-IS de pasos deberá contener exactamente 243 filas: 236 vistas únicas y siete aliases documentales, sin omisiones respecto de VIEW-PROCESS-BINDING-001.                                 |
| `TREQ-UX-1508` | Cada vista única deberá resolver exactamente un primary_process_step_ref no vacío, estable y subordinado al primary_process_id aprobado en AUTH-UI-011.                                               |
| `TREQ-UX-1509` | Toda referencia de paso deberá cumplir ^VPROC-[0-9]{4}::STEP-[A-Z0-9_]+$ y su prefijo VPROC deberá coincidir exactamente con el process_id de la fila.                                                |
| `TREQ-UX-1510` | Cada vínculo deberá usar únicamente uno de los 23 roles de paso y una de las seis posiciones de ciclo aprobadas por PROC-SCREEN-004.                                                                  |
| `TREQ-UX-1511` | Los siete aliases administrativos AURA deberán heredar exactamente process_id, process_step_ref, rol y posición de la ruta VISO referenciada, sin crear otra vista o ancla.                           |
| `TREQ-UX-1512` | AUTH-UI-012 deberá preservar sin cambios los 243 vínculos process_id aprobados en AUTH-UI-011; asignar un paso no podrá cambiar el proceso de una vista.                                              |
| `TREQ-UX-1513` | La asignación de process_step no deberá conceder acceso, propiedad de aplicación, consumo, permiso, actor, dispositivo, acción, menú, duplicidad, legacy definitivo ni retiro.                        |
| `TREQ-UX-1514` | Las 64 rutas NEXO deberán conservar un paso dominante; sus cuatro redirecciones heredarán el paso del destino y los once handlers permanecerán excluidos.                                             |
| `TREQ-UX-1515` | Las nueve rutas FOGO deberán conservar un paso dominante coherente con receta, planeación o ejecución de lote; el handler PDF permanecerá excluido.                                                   |
| `TREQ-UX-1516` | Las trece rutas ORIGO deberán conservar un paso dominante y diferenciar priorización, preparación, seguimiento, recepción y gestión de proveedor.                                                     |
| `TREQ-UX-1517` | Las seis rutas PULSO deberán conservar un paso dominante; / y /scanner compartirán la misma ancla de fidelización mientras no exista decisión de consolidación.                                       |
| `TREQ-UX-1518` | Las sesenta rutas VISO deberán conservar un paso dominante y separar configuración, revisión, análisis, publicación, programación y acceso sin incluir sus diez handlers.                             |
| `TREQ-UX-1519` | Las siete rutas NUMERA deberán conservar un paso dominante y diferenciar captura de gasto, asignación de costos y análisis financiero.                                                                |
| `TREQ-UX-1520` | Las 37 superficies ANIMA deberán conservar un paso dominante y diferenciar bootstrap, asistencia, programación, documentos, comunicaciones, soporte, recuperación y cierre de cuenta.                 |
| `TREQ-UX-1521` | Las siete superficies interactivas SHELL deberán quedar ubicadas exclusivamente en entrada, autenticación, recuperación o seguridad de sesión de VPROC-0059.                                          |
| `TREQ-UX-1522` | Las diez superficies laborales relacionadas con PASS deberán diferenciar contexto, simulación, identificación, acumulación, redención, verificación de actor y receipt.                               |
| `TREQ-UX-1523` | Los siete placeholders AURA deberán conservar la ancla VPROC-0059::STEP-ENTER_ECOSYSTEM como entrada reservada y no recibir pasos de marketing.                                                       |
| `TREQ-UX-1524` | Las nueve superficies CMS actuales deberán usar anclas AS-IS de VPROC-0056 para triage, autoría, edición, publicación, retiro y carga de medios, sin admitir pantallas canónicas AURA.                |
| `TREQ-UX-1525` | Las siete superficies públicas relacionadas deberán conservar pasos de consulta de oferta o vacantes; /eventos heredará exactamente el paso de /restaurantes.                                         |
| `TREQ-UX-1526` | VPROC-0057 deberá permanecer sin vista y sin process_step AS-IS mientras no exista un caso trazable de oportunidad digital.                                                                           |
| `TREQ-UX-1527` | Toda redirección deberá conservar process_id y heredar una ancla del destino funcional, sin introducir un paso por el acto técnico de redirigir.                                                      |
| `TREQ-UX-1528` | Cambiar process_step_ref deberá exigir versión nueva, razón trazable, conservación del vínculo anterior y análisis de impacto sobre acciones, permisos, métricas, pruebas y navegación.               |
| `TREQ-UX-1529` | Route handlers, server actions, middleware, layouts, loading boundaries, templates, iconos y módulos no visuales deberán permanecer sin process_step como vistas.                                     |
| `TREQ-UX-1530` | La compilación deberá fallar ante vista sin paso, prefijo de paso distinto del process_id, rol o posición inválidos, alias divergente, conteo distinto de 243 o modificación de vínculos AUTH-UI-011. |

#### 13. Huellas de la línea base

```text
STEP_BINDING_REGISTRY_SHA256 = f761425ce238b8207db37c318cf74c169aa156055aa120887251a2b9b4e153fc
UNIQUE_VIEW_STEP_REGISTRY_SHA256 = 457dc9f49e1c9e1e73db89d3dd2ed4ee157d06fe8fb5da6c902e526ae8a32fda
ALIAS_STEP_REGISTRY_SHA256 = 7931d15f739fa748ad68761d3f76cfa450a4d772adc50f83c265f712a77c09e3
ROLE_DISTRIBUTION_SHA256 = 78275ad034587bfd23305f32a9bc5c281ff4a158e131f6ece75e3e112c34f9c6
LIFECYCLE_DISTRIBUTION_SHA256 = d6c0ad11ad27913869fcab43dad9d82e8be1351a2d0ae556547f22f71fc2552c
```

#### 14. Criterios de aceptación

- [x] Se preservan los 243 `process_id` aprobados en `AUTH-UI-011`.
- [x] Se materializan 243 filas de vínculo vista–proceso–paso.
- [x] Se distinguen 236 vistas únicas y siete aliases.
- [x] Cada vista única tiene exactamente un paso dominante.
- [x] Todas las referencias cumplen el formato namespaced.
- [x] El prefijo de cada paso coincide con su proceso.
- [x] Roles y posiciones utilizan únicamente vocabularios aprobados.
- [x] Aliases y redirects heredan sin crear pasos artificiales.
- [x] Los artefactos técnicos no visuales quedan excluidos.
- [x] No se anticipa propiedad, consumo, permisos, actores, dispositivos, acciones, menú o retiro.
- [x] AURA conserva cero pantallas standalone.
- [x] `VPROC-0057` permanece sin vista ni paso artificial.
- [x] Se incorporan `TREQ-UX-1507` a `TREQ-UX-1530` sin modificar filas históricas.
- [x] No se modifica código, Supabase, navegación runtime ni despliegue.

#### 15. Validaciones documentales realizadas

| Control                         | Resultado                                         |
| ------------------------------- | ------------------------------------------------- |
| Base 04A leída completa         | **3.512 requisitos**                              |
| Nuevos requisitos               | **24**                                            |
| Total regenerado                | **3.536**                                         |
| Dominio UX                      | **1.530 requisitos — TREQ-UX-001 a TREQ-UX-1530** |
| Filas con catorce columnas      | **3.536 de 3.536**                                |
| Identificadores TREQ duplicados | **0**                                             |
| Relaciones TREQ no resolubles   | **0**                                             |
| Filas históricas modificadas    | **0**                                             |
| Filas vista–proceso–paso        | **243**                                           |
| Vistas únicas sin paso          | **0**                                             |
| Prefijos de paso inconsistentes | **0**                                             |
| Código o Supabase modificado    | **no**                                            |

#### 16. Instrucción de reemplazo

1. Reemplazar exactamente `### [ ] AUTH-UI-012 — Asignar process_step a cada vista` por este documento completo.
2. Reemplazar completamente `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` por el archivo regenerado entregado con esta tarea.
3. No insertar filas TREQ manualmente.

#### 17. Continuidad aprobada

```text
ÚLTIMA TAREA APROBADA
AUTH-UI-012 — Asignar process_step a cada vista
        ↓
TAREA ACTUAL
AUTH-UI-013 — Definir aplicación propietaria
        ↓
SIGUIENTE TAREA RESERVADA
AUTH-UI-014 — Definir si la aplicación solo consume la capacidad
```

APROBADA

### [ ] AUTH-UI-013 — Definir aplicación propietaria
### [ ] AUTH-UI-014 — Definir si la aplicación solo consume la capacidad
