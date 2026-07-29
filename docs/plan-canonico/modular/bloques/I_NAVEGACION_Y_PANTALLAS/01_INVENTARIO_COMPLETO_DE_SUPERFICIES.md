### MINI-BLOQUE — INVENTARIO COMPLETO DE SUPERFICIES

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **inventario completo de superficies** dentro de **I NAVEGACIÓN Y PANTALLAS**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `AUTH-UI-001` a `AUTH-UI-010` — 10 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Límites funcionales:** comienza con “Inventariar todas las rutas de NEXO” y concluye con “Auditar rutas y superficies actuales de AURA”.
<!-- PLAN-SECTION-META:END -->

### ✅ AUTH-UI-001 — Inventariar todas las rutas de NEXO

**Estado:** APROBADA
**Bloque:** BLOQUE I — Navegación, pantallas y autorización de vistas
**Marcador exacto que reemplaza:** `### [ ] AUTH-UI-001 — Inventariar todas las rutas de NEXO`
**Cierre canónico anterior:** `NFR-REQ-012 — Aprobar requisitos no funcionales antes de E5` — APROBADA; BLOQUE E2 cerrado documentalmente
**Siguiente tarea reservada:** `AUTH-UI-002 — Inventariar todas las rutas de FOGO` — NO INICIADA
**Archivo propietario:** `docs/plan-canonico/modular/bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md`
**Repositorio fuente:** `devVentoGroup/vento-nexo`
**Rama inspeccionada:** `main`
**Commit inspeccionado:** `142c4d696221e3ce3fda4ed3b62f3d1fe5b58799`
**Fecha de inspección:** `2026-07-28`
**Cambios en código, Supabase, navegación runtime, rutas o despliegues:** no autorizados ni ejecutados

**Artefactos aprobados:**

- `NEXO-ROUTE-INVENTORY-001`;
- `NEXO-ROUTE-SOURCE-MAP-001`;
- `NEXO-REDIRECT-AND-DEEP-LINK-REGISTER-001`;
- `NEXO-TECHNICAL-ROUTE-HANDLER-REGISTER-001`;
- `NEXO-ROUTE-INVENTORY-CARRYOVER-001`.

---

#### 1. Propósito

Inventariar de forma exhaustiva y reproducible todas las rutas de página que existen actualmente en NEXO, conservando el patrón visible, el archivo fuente, la parametrización y las redirecciones reales sin confundir rutas con pantallas canónicas futuras, procesos, permisos, elementos de menú o endpoints técnicos.

```text
ARCHIVO page.* EXISTENTE
→ PATRÓN DE URL REAL
→ REGISTRO DE RUTA ACTUAL

RUTA ACTUAL
≠ PANTALLA CANÓNICA TO-BE
≠ ELEMENTO DE MENÚ ACTIVO
≠ PERMISO
≠ PROCESO
≠ IMPLEMENTACIÓN COMPLETA
```

---

#### 2. Alcance y límites

Esta tarea registra evidencia de código existente. No decide todavía:

- `process_id` o `process_step`, reservados para `AUTH-UI-011` y `AUTH-UI-012`;
- aplicación propietaria o consumidora, reservada para `AUTH-UI-013` y `AUTH-UI-014`;
- clasificación operativa, administrativa, de supervisión, configuración, auditoría o cliente, reservada para `AUTH-UI-015` a `AUTH-UI-020`;
- actores, dispositivos, frecuencia y acciones, reservados para `AUTH-UI-021` a `AUTH-UI-025`;
- duplicación, legado o retiro, reservados para `AUTH-UI-026` a `AUTH-UI-029`;
- permisos de lectura, acciones y protección de servidor, reservados para `AUTH-UI-030` a `AUTH-UI-045`;
- rediseño de NEXO, reservado para el subbloque `NEXO-UX-*`.

Por tanto, una ruta de redirección se registra como ruta real, pero no se declara duplicada, legacy o candidata a retiro en esta tarea.

---

#### 3. Método de inventario

La unidad primaria es cada archivo activo `src/app/**/page.tsx` del App Router. Para cada archivo:

1. se elimina el prefijo `src/app`;
2. se elimina el sufijo `/page.tsx`;
3. se conserva cada segmento dinámico;
4. los route groups, slots paralelos y segmentos privados no formarían parte de la URL visible;
5. la raíz `src/app/page.tsx` se materializa como `/`;
6. `src/app/api/**/route.ts` se registra por separado y nunca como pantalla;
7. `layout.tsx`, `loading.tsx`, `error.tsx` y archivos auxiliares no se cuentan como rutas.

La línea base se contrastó por conjuntos contra el inventario técnico del `2026-07-23`. Ambos conjuntos contienen las mismas 64 rutas.

---

#### 4. Resultado cuantitativo

| Métrica                                                 | Resultado |
| ------------------------------------------------------- | --------: |
| Rutas de página                                         |    **64** |
| Rutas bajo `/inventory`                                 |    **55** |
| Rutas bajo `/printing`                                  |     **3** |
| Raíz, acceso y utilidades                               |     **6** |
| Patrones estáticos                                      |    **47** |
| Patrones dinámicos                                      |    **17** |
| Rutas que producen vista                                |    **60** |
| Rutas de redirección                                    |     **4** |
| Route handlers API separados                            |    **11** |
| Patrones App Router combinados, sin llamarlos pantallas |    **75** |
| Altas frente a 2026-07-23                               |     **0** |
| Retiros frente a 2026-07-23                             |     **0** |
| Decisiones de permiso o rediseño tomadas                |     **0** |

---

#### 5. `NEXO-ROUTE-INVENTORY-001`

| ID               | Patrón URL                                   | Archivo fuente                                               | Superficie actual      | Parámetros       | Familia estructural            | Sincronización de registro    | Evidencia de sesión             | Observación                                                                                                   |
| ---------------- | -------------------------------------------- | ------------------------------------------------------------ | ---------------------- | ---------------- | ------------------------------ | ----------------------------- | ------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| `NEXO-ROUTE-001` | `/`                                          | `src/app/page.tsx`                                           | `VIEW`                 | `STATIC`         | `root`                         | `EXCLUDED_ROOT_BY_SCRIPT`     | `SESSION_GUARDED_BY_MIDDLEWARE` | Inicio operativo real de NEXO; el script de sincronización omite la raíz.                                     |
| `NEXO-ROUTE-002` | `/inventory/adjust`                          | `src/app/inventory/adjust/page.tsx`                          | `VIEW`                 | `STATIC`         | `inventory/adjust`             | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-003` | `/inventory/assets`                          | `src/app/inventory/assets/page.tsx`                          | `VIEW`                 | `STATIC`         | `inventory/assets`             | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-004` | `/inventory/assets/counts`                   | `src/app/inventory/assets/counts/page.tsx`                   | `VIEW`                 | `STATIC`         | `inventory/assets`             | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-005` | `/inventory/assets/counts/[id]`              | `src/app/inventory/assets/counts/[id]/page.tsx`              | `VIEW`                 | `DYNAMIC:[id]`   | `inventory/assets`             | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-006` | `/inventory/assets/groups/[id]`              | `src/app/inventory/assets/groups/[id]/page.tsx`              | `VIEW`                 | `DYNAMIC:[id]`   | `inventory/assets`             | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-007` | `/inventory/assets/items/[id]`               | `src/app/inventory/assets/items/[id]/page.tsx`               | `VIEW`                 | `DYNAMIC:[id]`   | `inventory/assets`             | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-008` | `/inventory/assets/new`                      | `src/app/inventory/assets/new/page.tsx`                      | `VIEW`                 | `STATIC`         | `inventory/assets`             | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-009` | `/inventory/assets/quick`                    | `src/app/inventory/assets/quick/page.tsx`                    | `VIEW`                 | `STATIC`         | `inventory/assets`             | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-010` | `/inventory/catalog`                         | `src/app/inventory/catalog/page.tsx`                         | `VIEW`                 | `STATIC`         | `inventory/catalog`            | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-011` | `/inventory/catalog/[id]`                    | `src/app/inventory/catalog/[id]/page.tsx`                    | `VIEW`                 | `DYNAMIC:[id]`   | `inventory/catalog`            | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-012` | `/inventory/catalog/[id]/ficha`              | `src/app/inventory/catalog/[id]/ficha/page.tsx`              | `VIEW`                 | `DYNAMIC:[id]`   | `inventory/catalog`            | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-013` | `/inventory/catalog/[id]/presentations`      | `src/app/inventory/catalog/[id]/presentations/page.tsx`      | `VIEW`                 | `DYNAMIC:[id]`   | `inventory/catalog`            | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-014` | `/inventory/catalog/new`                     | `src/app/inventory/catalog/new/page.tsx`                     | `VIEW`                 | `STATIC`         | `inventory/catalog`            | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-015` | `/inventory/catalog/presentations`           | `src/app/inventory/catalog/presentations/page.tsx`           | `VIEW`                 | `STATIC`         | `inventory/catalog`            | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-016` | `/inventory/cost-center`                     | `src/app/inventory/cost-center/page.tsx`                     | `VIEW`                 | `STATIC`         | `inventory/cost-center`        | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-017` | `/inventory/count-initial`                   | `src/app/inventory/count-initial/page.tsx`                   | `VIEW`                 | `STATIC`         | `inventory/count-initial`      | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-018` | `/inventory/count-initial/session/[id]`      | `src/app/inventory/count-initial/session/[id]/page.tsx`      | `VIEW`                 | `DYNAMIC:[id]`   | `inventory/count-initial`      | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-019` | `/inventory/entries`                         | `src/app/inventory/entries/page.tsx`                         | `VIEW`                 | `STATIC`         | `inventory/entries`            | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-020` | `/inventory/locations`                       | `src/app/inventory/locations/page.tsx`                       | `VIEW`                 | `STATIC`         | `inventory/locations`          | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-021` | `/inventory/locations/[id]`                  | `src/app/inventory/locations/[id]/page.tsx`                  | `VIEW`                 | `DYNAMIC:[id]`   | `inventory/locations`          | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-022` | `/inventory/locations/[id]/board`            | `src/app/inventory/locations/[id]/board/page.tsx`            | `VIEW`                 | `DYNAMIC:[id]`   | `inventory/locations`          | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-023` | `/inventory/locations/[id]/kiosk-withdraw`   | `src/app/inventory/locations/[id]/kiosk-withdraw/page.tsx`   | `VIEW`                 | `DYNAMIC:[id]`   | `inventory/locations`          | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-024` | `/inventory/locations/[id]/positions`        | `src/app/inventory/locations/[id]/positions/page.tsx`        | `VIEW`                 | `DYNAMIC:[id]`   | `inventory/locations`          | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-025` | `/inventory/locations/open`                  | `src/app/inventory/locations/open/page.tsx`                  | `VIEW`                 | `STATIC`         | `inventory/locations`          | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-026` | `/inventory/locations/zone`                  | `src/app/inventory/locations/zone/page.tsx`                  | `VIEW`                 | `STATIC`         | `inventory/locations`          | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Vista real parametrizada por site_id y zone; admite modo kiosk.                                               |
| `NEXO-ROUTE-027` | `/inventory/locations/zones`                 | `src/app/inventory/locations/zones/page.tsx`                 | `VIEW`                 | `STATIC`         | `inventory/locations`          | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-028` | `/inventory/lpns`                            | `src/app/inventory/lpns/page.tsx`                            | `VIEW`                 | `STATIC`         | `inventory/lpns`               | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-029` | `/inventory/movements`                       | `src/app/inventory/movements/page.tsx`                       | `VIEW`                 | `STATIC`         | `inventory/movements`          | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-030` | `/inventory/production-batches`              | `src/app/inventory/production-batches/page.tsx`              | `VIEW`                 | `STATIC`         | `inventory/production-batches` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-031` | `/inventory/remissions`                      | `src/app/inventory/remissions/page.tsx`                      | `VIEW`                 | `STATIC`         | `inventory/remissions`         | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-032` | `/inventory/remissions/[id]`                 | `src/app/inventory/remissions/[id]/page.tsx`                 | `VIEW`                 | `DYNAMIC:[id]`   | `inventory/remissions`         | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-033` | `/inventory/remissions/[id]/edit`            | `src/app/inventory/remissions/[id]/edit/page.tsx`            | `VIEW`                 | `DYNAMIC:[id]`   | `inventory/remissions`         | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-034` | `/inventory/remissions/conductor`            | `src/app/inventory/remissions/conductor/page.tsx`            | `VIEW`                 | `STATIC`         | `inventory/remissions`         | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-035` | `/inventory/remissions/fulfillment`          | `src/app/inventory/remissions/fulfillment/page.tsx`          | `VIEW`                 | `STATIC`         | `inventory/remissions`         | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-036` | `/inventory/remissions/prepare`              | `src/app/inventory/remissions/prepare/page.tsx`              | `VIEW`                 | `STATIC`         | `inventory/remissions`         | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-037` | `/inventory/remissions/receive`              | `src/app/inventory/remissions/receive/page.tsx`              | `VIEW`                 | `STATIC`         | `inventory/remissions`         | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-038` | `/inventory/remissions/transit`              | `src/app/inventory/remissions/transit/page.tsx`              | `VIEW`                 | `STATIC`         | `inventory/remissions`         | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-039` | `/inventory/settings`                        | `src/app/inventory/settings/page.tsx`                        | `VIEW`                 | `STATIC`         | `inventory/settings`           | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Hub real de configuración; no sustituye las vistas enlazadas.                                                 |
| `NEXO-ROUTE-040` | `/inventory/settings/categories`             | `src/app/inventory/settings/categories/page.tsx`             | `VIEW`                 | `STATIC`         | `inventory/settings`           | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-041` | `/inventory/settings/fulfillment-routes`     | `src/app/inventory/settings/fulfillment-routes/page.tsx`     | `VIEW`                 | `STATIC`         | `inventory/settings`           | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-042` | `/inventory/settings/internal-prices`        | `src/app/inventory/settings/internal-prices/page.tsx`        | `VIEW`                 | `STATIC`         | `inventory/settings`           | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-043` | `/inventory/settings/locations/[id]/catalog` | `src/app/inventory/settings/locations/[id]/catalog/page.tsx` | `VIEW`                 | `DYNAMIC:[id]`   | `inventory/settings`           | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-044` | `/inventory/settings/products`               | `src/app/inventory/settings/products/page.tsx`               | `VIEW`                 | `STATIC`         | `inventory/settings`           | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-045` | `/inventory/settings/remissions`             | `src/app/inventory/settings/remissions/page.tsx`             | `VIEW`                 | `STATIC`         | `inventory/settings`           | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-046` | `/inventory/settings/remissions/products`    | `src/app/inventory/settings/remissions/products/page.tsx`    | `VIEW`                 | `STATIC`         | `inventory/settings`           | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-047` | `/inventory/settings/request-policies`       | `src/app/inventory/settings/request-policies/page.tsx`       | `VIEW`                 | `STATIC`         | `inventory/settings`           | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-048` | `/inventory/settings/sites`                  | `src/app/inventory/settings/sites/page.tsx`                  | `VIEW`                 | `STATIC`         | `inventory/settings`           | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-049` | `/inventory/settings/sites/[id]/operations`  | `src/app/inventory/settings/sites/[id]/operations/page.tsx`  | `VIEW`                 | `DYNAMIC:[id]`   | `inventory/settings`           | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-050` | `/inventory/settings/supply-routes`          | `src/app/inventory/settings/supply-routes/page.tsx`          | `VIEW`                 | `STATIC`         | `inventory/settings`           | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-051` | `/inventory/settings/units`                  | `src/app/inventory/settings/units/page.tsx`                  | `VIEW`                 | `STATIC`         | `inventory/settings`           | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-052` | `/inventory/stock`                           | `src/app/inventory/stock/page.tsx`                           | `VIEW`                 | `STATIC`         | `inventory/stock`              | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-053` | `/inventory/stock/assign-location`           | `src/app/inventory/stock/assign-location/page.tsx`           | `VIEW`                 | `STATIC`         | `inventory/stock`              | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-054` | `/inventory/transfers`                       | `src/app/inventory/transfers/page.tsx`                       | `VIEW`                 | `STATIC`         | `inventory/transfers`          | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-055` | `/inventory/warehouse`                       | `src/app/inventory/warehouse/page.tsx`                       | `REDIRECT_ALIAS`       | `STATIC`         | `inventory/warehouse`          | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Alias técnico; no renderiza una vista propia.                                                                 |
| `NEXO-ROUTE-056` | `/inventory/withdraw`                        | `src/app/inventory/withdraw/page.tsx`                        | `VIEW`                 | `STATIC`         | `inventory/withdraw`           | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-057` | `/kiosk/[slug]`                              | `src/app/kiosk/[slug]/page.tsx`                              | `KIOSK_ENTRY_REDIRECT` | `DYNAMIC:[slug]` | `kiosk`                        | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Resuelve únicamente slugs declarados; un slug desconocido produce notFound.                                   |
| `NEXO-ROUTE-058` | `/l/[code]`                                  | `src/app/l/[code]/page.tsx`                                  | `DEEP_LINK_REDIRECT`   | `DYNAMIC:[code]` | `deep-link`                    | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Normaliza el código LOC a mayúsculas y abre el flujo de ubicación.                                            |
| `NEXO-ROUTE-059` | `/login`                                     | `src/app/login/page.tsx`                                     | `AUTH_VIEW`            | `STATIC`         | `access`                       | `DISCOVERABLE_BY_SYNC_SCRIPT` | `MIDDLEWARE_EXCLUDED_LOGIN`     | Entrada de autenticación; excluida del matcher del middleware.                                                |
| `NEXO-ROUTE-060` | `/no-access`                                 | `src/app/no-access/page.tsx`                                 | `ACCESS_STATE`         | `STATIC`         | `access`                       | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Estado de acceso denegado; conserva returnTo local saneado.                                                   |
| `NEXO-ROUTE-061` | `/printing/designer`                         | `src/app/printing/designer/page.tsx`                         | `VIEW`                 | `STATIC`         | `printing`                     | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-062` | `/printing/jobs`                             | `src/app/printing/jobs/page.tsx`                             | `VIEW`                 | `STATIC`         | `printing`                     | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-063` | `/printing/setup`                            | `src/app/printing/setup/page.tsx`                            | `VIEW`                 | `STATIC`         | `printing`                     | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Utilidad técnica de preparación de impresión; no equivale a un endpoint API.                                  |
| `NEXO-ROUTE-064` | `/scanner`                                   | `src/app/scanner/page.tsx`                                   | `REDIRECT_ALIAS`       | `STATIC`         | `utility`                      | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Alias técnico; no renderiza una vista propia.                                                                 |

---

#### 6. `NEXO-REDIRECT-AND-DEEP-LINK-REGISTER-001`

| ID                  | Ruta origen            | Destino o resolución                                                              | Evidencia de comportamiento                                                      | Tratamiento actual                                                                              |
| ------------------- | ---------------------- | --------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| `NEXO-REDIRECT-001` | `/scanner`             | `/inventory/locations`                                                            | La función de página ejecuta `redirect` sin renderizar contenido.                | Conservar como arista de redirección; clasificación posterior en `AUTH-UI-026` a `AUTH-UI-029`. |
| `NEXO-REDIRECT-002` | `/inventory/warehouse` | `/inventory/locations`                                                            | La función de página ejecuta `redirect` sin renderizar contenido.                | Conservar como arista de redirección; clasificación posterior en `AUTH-UI-026` a `AUTH-UI-029`. |
| `NEXO-REDIRECT-003` | `/l/[code]`            | `/inventory/locations/open?loc={CODE}`                                            | Normaliza el código a mayúsculas; un valor vacío vuelve a ubicaciones con error. | Conservar como deep link técnico; seguridad y permiso se auditan después.                       |
| `NEXO-REDIRECT-004` | `/kiosk/[slug]`        | `/inventory/locations/[id]/board?kiosk=1 o /inventory/locations/zone?...&kiosk=1` | Resuelve un catálogo explícito de slugs; el desconocido produce `notFound`.      | Conservar como entrada de kiosco; no asumir que cada slug es una pantalla distinta.             |

Slugs observados en la ruta de kiosco: `bodega`, `bodega-principal`, `nevera-produccion`, `nevera-preparaciones`, `nevera-despacho`, `empaques` y `zona-empaques`. Estos valores son targets de entrada, no siete rutas adicionales.

---

#### 7. `NEXO-TECHNICAL-ROUTE-HANDLER-REGISTER-001`

Los siguientes route handlers existen bajo `src/app/api`. No forman parte de las 64 rutas de página ni pueden promoverse como pantallas:

| ID             | Patrón técnico                            | Archivo fuente                                            | Tratamiento                          |
| -------------- | ----------------------------------------- | --------------------------------------------------------- | ------------------------------------ |
| `NEXO-API-001` | `/api/labelary`                           | `src/app/api/labelary/route.ts`                           | `TECHNICAL_ROUTE_HANDLER_NOT_A_VIEW` |
| `NEXO-API-002` | `/api/inventory/lpns`                     | `src/app/api/inventory/lpns/route.ts`                     | `TECHNICAL_ROUTE_HANDLER_NOT_A_VIEW` |
| `NEXO-API-003` | `/api/inventory/adjust`                   | `src/app/api/inventory/adjust/route.ts`                   | `TECHNICAL_ROUTE_HANDLER_NOT_A_VIEW` |
| `NEXO-API-004` | `/api/printing/layouts`                   | `src/app/api/printing/layouts/route.ts`                   | `TECHNICAL_ROUTE_HANDLER_NOT_A_VIEW` |
| `NEXO-API-005` | `/api/inventory/locations`                | `src/app/api/inventory/locations/route.ts`                | `TECHNICAL_ROUTE_HANDLER_NOT_A_VIEW` |
| `NEXO-API-006` | `/api/inventory/count-initial`            | `src/app/api/inventory/count-initial/route.ts`            | `TECHNICAL_ROUTE_HANDLER_NOT_A_VIEW` |
| `NEXO-API-007` | `/api/inventory/movements/export`         | `src/app/api/inventory/movements/export/route.ts`         | `TECHNICAL_ROUTE_HANDLER_NOT_A_VIEW` |
| `NEXO-API-008` | `/api/inventory/stock/export-by-loc`      | `src/app/api/inventory/stock/export-by-loc/route.ts`      | `TECHNICAL_ROUTE_HANDLER_NOT_A_VIEW` |
| `NEXO-API-009` | `/api/inventory/catalog/upload-image`     | `src/app/api/inventory/catalog/upload-image/route.ts`     | `TECHNICAL_ROUTE_HANDLER_NOT_A_VIEW` |
| `NEXO-API-010` | `/api/inventory/count-initial/approve`    | `src/app/api/inventory/count-initial/approve/route.ts`    | `TECHNICAL_ROUTE_HANDLER_NOT_A_VIEW` |
| `NEXO-API-011` | `/api/inventory/catalog/export-suppliers` | `src/app/api/inventory/catalog/export-suppliers/route.ts` | `TECHNICAL_ROUTE_HANDLER_NOT_A_VIEW` |

El middleware de páginas excluye `/api`. La autenticación, autorización, validación de payload, rate limit y protección de servidor de cada handler deberán auditarse mediante `AUTH-UI-043` y las tareas `AUTH-SRV-*` o de dominio correspondientes. Esta tarea no los declara protegidos ni desprotegidos.

---

#### 8. Superficies auxiliares no contabilizadas como rutas

| ID              | Ruta asistida                              | Archivo                                                       | Tratamiento                    |
| --------------- | ------------------------------------------ | ------------------------------------------------------------- | ------------------------------ |
| `NEXO-LOAD-001` | `/inventory/locations/[id]/board`          | `src/app/inventory/locations/[id]/board/loading.tsx`          | `LOADING_BOUNDARY_NOT_A_ROUTE` |
| `NEXO-LOAD-002` | `/inventory/locations/[id]/kiosk-withdraw` | `src/app/inventory/locations/[id]/kiosk-withdraw/loading.tsx` | `LOADING_BOUNDARY_NOT_A_ROUTE` |

NEXO conserva además un `src/app/layout.tsx` raíz. El layout y los boundaries forman parte de la experiencia, pero no crean patrones URL adicionales.

---

#### 9. Sincronización y navegación runtime

El repositorio ejecuta `scripts/sync-navigation.mjs` antes del build. El script:

- descubre recursivamente archivos `page.*`;
- excluye rutas bajo `api`;
- conserva segmentos dinámicos;
- registra pantallas en `app_screen_registry`;
- no agrega directamente elementos al sidebar; la promoción hacia `app_navigation_items` ocurre posteriormente;
- omite la raíz `/` porque `routeFromPageFile` devuelve `null` para ese patrón.

Por tanto:

```text
RUTA PRESENTE EN CÓDIGO
≠ FILA REGISTRADA EN RUNTIME
≠ ELEMENTO DE NAVEGACIÓN VISIBLE
≠ RUTA AUTORIZADA PARA UN ACTOR
```

La reconciliación entre las 64 rutas fuente, `app_screen_registry` y `app_navigation_items` queda asignada a `AUTH-UI-045 — Unificar navegación y autorización`. La exclusión de `/` deberá resolverse conscientemente allí; no puede quedar como diferencia implícita.

---

#### 10. Evidencia de acceso observada

El matcher del middleware cubre las páginas excepto `/login` y recursos técnicos excluidos. Sin sesión válida, redirige a login. Para el usuario de kiosco de bodega aplica además una restricción de rutas y el parámetro `kiosk=1`.

`requireAppAccess` añade, cuando cada página lo invoca, verificación de `nexo.access`, sesión operativa, dispositivo compartido, permiso exacto opcional, sede, área y simulación de rol. La existencia del helper no prueba que todas las rutas declaren el permiso funcional correcto.

La asignación exacta de lectura y acciones permanece reservada para `AUTH-UI-030` a `AUTH-UI-045`. Ninguna ruta queda aprobada por permiso en esta tarea.

---

#### 11. `NEXO-ROUTE-INVENTORY-CARRYOVER-001`

| Hallazgo o decisión pendiente                                                                   | Propietario documental                         | Momento de resolución                                               | Estado   |
| ----------------------------------------------------------------------------------------------- | ---------------------------------------------- | ------------------------------------------------------------------- | -------- |
| Asignar proceso y paso a cada ruta que represente una vista.                                    | `AUTH-UI-011` y `AUTH-UI-012`                  | Después de completar los inventarios `AUTH-UI-001` a `AUTH-UI-010`. | `ROUTED` |
| Distinguir propiedad de aplicación y consumo transversal.                                       | `AUTH-UI-013` y `AUTH-UI-014`                  | Durante clasificación funcional.                                    | `ROUTED` |
| Clasificar tipo de vista, actores, dispositivo, frecuencia y acciones.                          | `AUTH-UI-015` a `AUTH-UI-025`                  | Después del inventario completo.                                    | `ROUTED` |
| Decidir si aliases, redirects o vistas superpuestas son duplicadas, legacy o retirables.        | `AUTH-UI-026` a `AUTH-UI-029`                  | Después de asignar proceso, paso y consumidores.                    | `ROUTED` |
| Asignar permiso de lectura y permisos exactos por acción.                                       | `AUTH-UI-030` a `AUTH-UI-039`                  | Durante el subbloque de autorización.                               | `ROUTED` |
| Reconciliar rutas fuente, registro de pantallas y navegación runtime, incluida la raíz omitida. | `AUTH-UI-045`                                  | Antes de aprobar navegación unificada.                              | `ROUTED` |
| Estandarizar los dos loading boundaries y demás estados de carga.                               | `AUTH-UI-049`                                  | Durante experiencia transversal de vistas.                          | `ROUTED` |
| Auditar protección real de los 11 route handlers API.                                           | `AUTH-UI-043` y tareas `AUTH-SRV-*` aplicables | Antes de implementación o certificación de sus consumidores.        | `ROUTED` |
| Rediseñar las rutas y flujos concretos de NEXO.                                                 | Subbloque `NEXO-UX-*`                          | Después de aplicar la clasificación y autorización transversal.     | `ROUTED` |

No queda una diferencia detectada como pendiente narrativo sin tarea propietaria.

---

#### 12. Requisitos de prueba derivados

Se incorporan al registro canónico completo los siguientes identificadores:

```text
TREQ-NEXO-020 a TREQ-NEXO-039
```

| ID              | Regla protegida                                                                                    | Tipo inicial                  |
| --------------- | -------------------------------------------------------------------------------------------------- | ----------------------------- |
| `TREQ-NEXO-020` | Detectar exactamente todas las rutas de página activas bajo src/app sin depender del menú runtime. | `contractual + regresión`     |
| `TREQ-NEXO-021` | Asignar un identificador estable y único a cada patrón de ruta inventariado.                       | `contractual`                 |
| `TREQ-NEXO-022` | Preservar segmentos dinámicos como [id], [slug] y [code] sin expandir instancias de datos.         | `contractual + regresión`     |
| `TREQ-NEXO-023` | Distinguir rutas de página, route handlers API, layouts y boundaries de carga.                     | `contractual + estática`      |
| `TREQ-NEXO-024` | Excluir segmentos de grupos, paralelos y privados de la URL visible cuando aparezcan.              | `contractual + regresión`     |
| `TREQ-NEXO-025` | Incluir la ruta raíz en el inventario aunque el sincronizador de navegación la omita.              | `regresión`                   |
| `TREQ-NEXO-026` | Registrar cada redirección con origen, destino y comportamiento ante parámetros inválidos.         | `E2E + regresión`             |
| `TREQ-NEXO-027` | Comprobar que /scanner y /inventory/warehouse redirigen a /inventory/locations.                    | `E2E + regresión`             |
| `TREQ-NEXO-028` | Comprobar que /l/[code] normaliza el LOC y construye un destino local seguro.                      | `E2E + seguridad`             |
| `TREQ-NEXO-029` | Comprobar que /kiosk/[slug] acepta solo targets declarados y rechaza slugs desconocidos.           | `E2E + seguridad`             |
| `TREQ-NEXO-030` | Verificar la cobertura del middleware sobre todas las páginas salvo exclusiones explícitas.        | `seguridad + regresión`       |
| `TREQ-NEXO-031` | Verificar que /login permanece fuera del matcher y que las rutas protegidas redirigen sin sesión.  | `seguridad + E2E`             |
| `TREQ-NEXO-032` | Impedir que un route handler API sea contabilizado o promovido como pantalla.                      | `contractual + regresión`     |
| `TREQ-NEXO-033` | Verificar que sync-navigation detecta page files y excluye rutas api.                              | `integración + regresión`     |
| `TREQ-NEXO-034` | Detectar explícitamente la exclusión de / por el sincronizador y exigir tratamiento consciente.    | `contractual + regresión`     |
| `TREQ-NEXO-035` | Reconciliar inventario fuente, app_screen_registry y app_navigation_items sin asumir equivalencia. | `integración + base de datos` |
| `TREQ-NEXO-036` | Conservar los boundaries de carga como superficies auxiliares y no como rutas independientes.      | `interfaz + regresión`        |
| `TREQ-NEXO-037` | Fijar repositorio, rama, commit y fuente física para reproducir el inventario.                     | `contractual + regresión`     |
| `TREQ-NEXO-038` | Detectar archivos page sin URL única o URLs duplicadas antes de aprobar el inventario.             | `contractual + estática`      |
| `TREQ-NEXO-039` | Detectar altas, retiros o cambios de patrón de ruta respecto de la línea base aprobada.            | `regresión + integración`     |

El `04A` regenerado queda con:

- **3.298** requisitos vigentes;
- rango NEXO `TREQ-NEXO-001` a `TREQ-NEXO-039`;
- **39** requisitos del dominio NEXO;
- última tarea incorporada `AUTH-UI-001`;
- **3.278** filas históricas preservadas sin cambios de contenido.

---

#### 13. Criterios de aceptación

- [ ] El inventario contiene exactamente 64 rutas de página únicas.
- [ ] Cada ruta conserva un ID `NEXO-ROUTE-001` a `NEXO-ROUTE-064` consecutivo.
- [ ] Cada patrón URL tiene un único archivo `page.tsx` fuente.
- [ ] La raíz `/` está incluida aunque el sincronizador la omita.
- [ ] Los 17 patrones dinámicos conservan sus segmentos.
- [ ] Las cuatro rutas de redirección están identificadas sin declararlas duplicadas o legacy.
- [ ] Los 11 route handlers API están separados y no se cuentan como vistas.
- [ ] Layout y loading boundaries no se cuentan como rutas.
- [ ] La línea base actual coincide con el inventario del 2026-07-23 sin altas ni retiros.
- [ ] La protección de sesión observada no se presenta como permiso funcional completo.
- [ ] La navegación runtime no se presume desde el código fuente.
- [ ] Cada decisión posterior tiene tarea propietaria y momento de resolución.
- [ ] No se modifica código, Supabase, navegación, rutas ni despliegues.
- [ ] `AUTH-UI-002` permanece no iniciada.
- [ ] `TREQ-NEXO-020` a `TREQ-NEXO-039` quedan incorporados en el `04A` completo.

---

#### 14. Estado y continuidad

```text
NFR-REQ-012  APROBADA
BLOQUE E2     CERRADO DOCUMENTALMENTE
AUTH-UI-001   APROBADA
AUTH-UI-002   NO INICIADA
```

Esta aprobación congela únicamente el inventario fuente de rutas de NEXO para la fecha y commit indicados. No aprueba ninguna ruta como pantalla objetivo, menú, permiso, proceso completo o diseño definitivo.


### ✅ AUTH-UI-002 — Inventariar todas las rutas de FOGO

**Estado:** APROBADA
**Fecha de aprobación documental:** 2026-07-28
**Bloque propietario:** BLOQUE I — Navegación, pantallas y autorización de vistas
**Tipo de tarea:** inventario técnico-documental; sin cambios de código, Supabase, despliegue ni navegación runtime

#### 1. Objetivo

Inventariar de forma exhaustiva y reproducible las rutas reales expuestas por FOGO en el snapshot inspeccionado, distinguiendo páginas, patrones dinámicos, puentes de acceso, estados de denegación y route handlers técnicos.

La tarea establece una línea base de existencia y topología. No rediseña FOGO, no asigna todavía `process_id` o `process_step`, no aprueba permisos definitivos y no declara una ruta apta para menú, piloto, cutover o producción.

#### 2. Fuente inspeccionada

| Campo                    | Valor                                                                           |
| ------------------------ | ------------------------------------------------------------------------------- |
| Repositorio operativo    | `devVentoGroup/vento-fogo`                                                      |
| Rama                     | `main`                                                                          |
| Commit                   | `b6b9ed00e5267cabaac1a5a1090d93d5f60e86f2`                                      |
| Framework observado      | Next.js App Router                                                              |
| Raíz de páginas          | `src/app`                                                                       |
| Evidencia complementaria | `middleware.ts`, `src/lib/auth/guard.ts`, `package.json` y route handler de PDF |
| Estado del snapshot      | `SOURCE_INVENTORY_APPROVED`                                                     |

La rama `main` fue contrastada contra el commit anterior y no presentó diferencias al momento de la inspección.

#### 3. Frontera obligatoria

```text
RUTA EN CÓDIGO
≠ REGISTRO RUNTIME
≠ ELEMENTO DE MENÚ
≠ PROCESS_ID
≠ PERMISO DEFINITIVO
≠ PROCESO COMPLETO
```

Las tareas posteriores conservan estas responsabilidades:

| Decisión pendiente                       | Tarea propietaria                   |
| ---------------------------------------- | ----------------------------------- |
| Asignar proceso y paso                   | `AUTH-UI-011` y `AUTH-UI-012`       |
| Definir propietaria y consumo            | `AUTH-UI-013` y `AUTH-UI-014`       |
| Clasificar intención de vista            | `AUTH-UI-015` a `AUTH-UI-029`       |
| Asignar permisos y contexto              | `AUTH-UI-030` a `AUTH-UI-045`       |
| Diseñar experiencia y validar usabilidad | `AUTH-UI-046` a `AUTH-UI-060`       |
| Rediseñar experiencia propia de FOGO     | subbloque `FOGO-UX` correspondiente |

#### 4. Contrato de inventario

1. Se inventaría cada archivo `page.tsx` como un patrón de ruta, no una fila por combinación de parámetros.
2. Los segmentos dinámicos se conservan literalmente, por ejemplo `[id]`.
3. Layouts, loading states, componentes, server actions y helpers no se cuentan como rutas.
4. Los route handlers se registran aparte y no se cuentan como pantallas.
5. Una redirección o puente de acceso sigue siendo una ruta real, pero no una vista de negocio independiente.
6. La existencia de middleware o de `requireAppAccess` no demuestra que el permiso funcional exacto sea correcto para cada acción.
7. No se declara una ruta como duplicada, legacy o candidata a retiro sin ejecutar las tareas `AUTH-UI-026` a `AUTH-UI-028`.
8. Cambios futuros de archivos, patrones, métodos o guards invalidan la huella afectada y exigen reejecutar este inventario.

#### 5. Resumen reconciliado

| Métrica                                         |  Resultado |
| ----------------------------------------------- | ---------: |
| Rutas de página                                 |      **9** |
| Patrones estáticos                              |      **8** |
| Patrones dinámicos                              |      **1** |
| Rutas que renderizan vista o estado             |      **8** |
| Puentes de redirección                          |      **1** |
| Route handlers técnicos separados               |      **1** |
| Patrones App Router totales, incluyendo handler |     **10** |
| IDs de ruta únicos                              | **9 de 9** |
| Patrones URL duplicados                         |      **0** |
| Archivos fuente duplicados                      |      **0** |

#### 6. Matriz canónica de rutas

| ID               | Patrón                    | Archivo fuente                            | Patrón     | Comportamiento    | Familia observada | Evidencia de acceso observada                                                                                                  | Límite documental                                                                              |
| ---------------- | ------------------------- | ----------------------------------------- | ---------- | ----------------- | ----------------- | ------------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------- |
| `FOGO-ROUTE-001` | `/`                       | `src/app/page.tsx`                        | `ESTATICA` | `VISTA`           | `INICIO`          | `requireAppAccess` para `fogo`; acceso de aplicación                                                                           | Inicio FOGO; enlaza recetario y lotes sin convertirlos en una única pantalla de proceso.       |
| `FOGO-ROUTE-002` | `/login`                  | `src/app/login/page.tsx`                  | `ESTATICA` | `REDIRECT_BRIDGE` | `ACCESO`          | Excluida del middleware; normaliza `returnTo` y delega autenticación al SHELL                                                  | Puente de acceso; no es una pantalla operativa de FOGO.                                        |
| `FOGO-ROUTE-003` | `/no-access`              | `src/app/no-access/page.tsx`              | `ESTATICA` | `VISTA_ESTADO`    | `ACCESO`          | Excluida del middleware; muestra denegación, motivo, permiso y ruta solicitada                                                 | Estado de acceso denegado; no concede ni repara permisos.                                      |
| `FOGO-ROUTE-004` | `/recipe-book`            | `src/app/recipe-book/page.tsx`            | `ESTATICA` | `VISTA`           | `OPERACION`       | `requireAppAccess` para `fogo`; filtros y contexto se resuelven dentro de la superficie                                        | Libro operativo de recetas; el permiso exacto por acción se audita después.                    |
| `FOGO-ROUTE-005` | `/recipes`                | `src/app/recipes/page.tsx`                | `ESTATICA` | `VISTA`           | `ADMINISTRACION`  | `requireAppAccess` con `production.recipes.manage`                                                                             | Administración del catálogo de recetas y acceso al PDF técnico.                                |
| `FOGO-ROUTE-006` | `/recipes/new`            | `src/app/recipes/new/page.tsx`            | `ESTATICA` | `VISTA`           | `ADMINISTRACION`  | `requireAppAccess`; uso explícito de `production.recipes.manage` confirmado en la superficie                                   | Creación de receta; no prueba por sí sola publicación, versionado o completitud del proceso.   |
| `FOGO-ROUTE-007` | `/recipes/[id]/edit`      | `src/app/recipes/[id]/edit/page.tsx`      | `DINAMICA` | `VISTA`           | `ADMINISTRACION`  | `requireAppAccess`; uso explícito de `production.recipes.manage` confirmado en la superficie                                   | Edición por identificador; `[id]` es parte contractual del patrón y no una ruta por instancia. |
| `FOGO-ROUTE-008` | `/production-batches`     | `src/app/production-batches/page.tsx`     | `ESTATICA` | `VISTA`           | `OPERACION`       | `requireAppAccess` con `production.batches.view`                                                                               | Consulta y seguimiento de lotes de producción.                                                 |
| `FOGO-ROUTE-009` | `/production-batches/new` | `src/app/production-batches/new/page.tsx` | `ESTATICA` | `VISTA`           | `OPERACION`       | `requireAppAccess` para `fogo`; la acción de creación revalida `production.recipe_book.view` y actor de dispositivo compartido | Inicio de lote; la autorización de la acción no se infiere únicamente de poder abrir la ruta.  |

#### 7. Superficie técnica separada

| ID                 | Patrón         | Archivo fuente                  | Método | Runtime  | Evidencia de acceso                                | Tratamiento                                                                            |
| ------------------ | -------------- | ------------------------------- | ------ | -------- | -------------------------------------------------- | -------------------------------------------------------------------------------------- |
| `FOGO-HANDLER-001` | `/recipes/pdf` | `src/app/recipes/pdf/route.tsx` | `GET`  | `NODEJS` | `requireAppAccess` con `production.recipes.manage` | Route handler que genera PDF; se inventaría como superficie técnica, no como pantalla. |

El handler `/recipes/pdf` queda excluido de las nueve rutas de pantalla. El middleware general excluye rutas API, por lo que este handler debe conservar su protección propia en servidor.

#### 8. Topología de acceso observada

##### 8.1 Middleware

El middleware exige sesión para las superficies ordinarias y excluye explícitamente `login`, `no-access`, recursos estáticos y `api`. Esta observación es de topología técnica; no sustituye el análisis de autorización de las tareas `AUTH-UI-030` a `AUTH-UI-045`.

##### 8.2 Guard compartido

`requireAppAccess` resuelve usuario, sesión operativa, acceso a aplicación, restricciones de dispositivo compartido, sede, área, simulación y permisos opcionales. El inventario registra solamente los códigos explícitos observados; no inventa un permiso para las rutas que solo declaran acceso a la aplicación.

##### 8.3 Acciones dentro de la ruta

Abrir una página no equivale a estar autorizado para ejecutar todas sus acciones. El caso visible de `/production-batches/new` demuestra esta separación: la superficie entra con acceso a FOGO y la acción de creación vuelve a verificar capacidad y actor efectivo.

#### 9. Hallazgos y carryover obligatorio

| ID                       | Hallazgo                                                                                                                                     | Tratamiento inmediato                                                                                   | Propietario y momento de resolución                                         |
| ------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| `FOGO-ROUTE-FINDING-001` | FOGO no expone en `package.json` un sincronizador local equivalente al de NEXO para registrar automáticamente páginas en navegación runtime. | No inferir ausencia ni presencia en menú desde el árbol de archivos.                                    | `AUTH-UI-045`, al unificar navegación y autorización.                       |
| `FOGO-ROUTE-FINDING-002` | `/login` es un puente cliente hacia SHELL, no una pantalla autónoma de autenticación FOGO.                                                   | Conservar como ruta real de acceso y excluirla de conteos operativos.                                   | `AUTH-UI-040`, `AUTH-UI-041` y `AUTH-UI-045`.                               |
| `FOGO-ROUTE-FINDING-003` | `/recipes/pdf` es un handler técnico protegido en la propia ruta.                                                                            | Mantener separado del inventario de pantallas y auditar su permiso de descarga/exportación.             | `AUTH-UI-029`, `AUTH-UI-031`, `AUTH-UI-038`, `AUTH-UI-039` y `AUTH-UI-043`. |
| `FOGO-ROUTE-FINDING-004` | Algunas páginas declaran permiso exacto y otras solo acceso a la aplicación antes de resolver controles internos.                            | No concluir que exista autorización uniforme ni que falte autorización; clasificar cada acción después. | `AUTH-UI-030` a `AUTH-UI-045`, antes de aprobar vistas.                     |
| `FOGO-ROUTE-FINDING-005` | El inventario está anclado a un commit y puede quedar obsoleto.                                                                              | Comparar árbol, patrón, método y guard en cada cambio material.                                         | `SHELL-CI-017` y paquete E5 propietario antes de implementación o retiro.   |

No queda ningún hallazgo narrativo sin una tarea y momento de resolución.

#### 10. Reglas de cambio

Un cambio material incluye:

- agregar, retirar o mover un archivo `page.*`;
- convertir una página estática en dinámica o cambiar el nombre de su parámetro;
- reemplazar vista por redirección o redirección por vista;
- agregar o retirar un route handler;
- cambiar método HTTP, runtime, guard, permiso o exclusión de middleware;
- introducir un registro runtime o sincronizador de navegación;
- mantener dos patrones equivalentes hacia la misma intención sin clasificación posterior.

Todo cambio deberá regenerar la matriz y registrar el impacto en las tareas posteriores, sin reescribir silenciosamente esta línea base.

#### 11. Criterios de aceptación

- [x] Se inspeccionó el repositorio operativo de FOGO y no `vento-shell` como sustituto.
- [x] Se fijaron repositorio, rama y commit.
- [x] Se registraron nueve archivos de página con IDs consecutivos.
- [x] Se preservó el patrón dinámico `/recipes/[id]/edit`.
- [x] Se separó el handler `/recipes/pdf` del inventario de pantallas.
- [x] Se distinguieron vistas, estado de denegación y puente de acceso.
- [x] Se documentó evidencia de acceso sin convertirla en permiso definitivo.
- [x] Se asignó cada hallazgo a una tarea y momento de resolución.
- [x] No se modificó código, Supabase, navegación runtime ni despliegue.
- [x] No se inició `AUTH-UI-003`.

#### 12. Decisión aprobada

```text
FOGO_ROUTE_SOURCE_INVENTORY = APPROVED
PAGE_ROUTES = 9
TECHNICAL_ROUTE_HANDLERS = 1
RUNTIME_MENU_STATUS = NOT_EVALUATED
PERMISSION_COMPLETENESS = NOT_EVALUATED
RETIREMENT_DECISIONS = NONE
NEXT_TASK = AUTH-UI-003
```

#### Requisitos de prueba derivados

La actualización canónica completa del registro `04A` incorpora:

`TREQ-FOGO-005` a `TREQ-FOGO-024`.

Los requisitos protegen el descubrimiento exhaustivo, la identidad estable de rutas, la separación entre páginas y handlers, los patrones dinámicos, el puente de acceso, los guards, el drift del snapshot y la prohibición de inferir navegación, autorización o completitud desde la sola existencia de archivos.

#### 13. Continuidad

```text
AUTH-UI-002 — APROBADA
        ↓
AUTH-UI-003 — Inventariar todas las rutas de ORIGO
```


### ✅ AUTH-UI-003 — Inventariar todas las rutas de ORIGO

**Estado:** APROBADA
**Fecha de aprobación documental:** 2026-07-28
**Bloque propietario:** BLOQUE I — Navegación, pantallas y autorización de vistas
**Tipo de tarea:** inventario técnico-documental; sin cambios de código, Supabase, despliegue ni navegación runtime

#### 1. Objetivo

Inventariar de forma exhaustiva y reproducible las rutas reales expuestas por ORIGO en el snapshot inspeccionado, distinguiendo páginas, patrones dinámicos, puentes de acceso, estados de denegación, registro de navegación y route handlers técnicos.

La tarea establece una línea base de existencia y topología. No rediseña ORIGO, no asigna todavía `process_id` o `process_step`, no aprueba permisos definitivos y no declara una ruta apta para piloto, cutover, producción o completitud de proceso.

#### 2. Fuente inspeccionada

| Campo                    | Valor                                                                                                                         |
| ------------------------ | ----------------------------------------------------------------------------------------------------------------------------- |
| Repositorio operativo    | `devVentoGroup/vento-origo`                                                                                                   |
| Rama                     | `main`                                                                                                                        |
| Commit                   | `b7a8303fa078ef087f522b6c99059ababfc27472`                                                                                    |
| Framework observado      | Next.js App Router                                                                                                            |
| Raíz de páginas          | `src/app`                                                                                                                     |
| Evidencia complementaria | `middleware.ts`, `src/lib/auth/guard.ts`, `src/lib/suppliers.ts`, `scripts/sync-navigation.mjs`, `package.json` y handler PDF |
| Estado del snapshot      | `SOURCE_INVENTORY_APPROVED`                                                                                                   |

#### 3. Frontera obligatoria

```text
RUTA EN CÓDIGO
≠ REGISTRO RUNTIME
≠ ELEMENTO DE MENÚ
≠ PROCESS_ID
≠ PERMISO DEFINITIVO
≠ PROCESO COMPLETO
```

| Decisión pendiente                       | Tarea propietaria                    |
| ---------------------------------------- | ------------------------------------ |
| Asignar proceso y paso                   | `AUTH-UI-011` y `AUTH-UI-012`        |
| Definir propietaria y consumo            | `AUTH-UI-013` y `AUTH-UI-014`        |
| Clasificar intención de vista            | `AUTH-UI-015` a `AUTH-UI-029`        |
| Asignar permisos y contexto              | `AUTH-UI-030` a `AUTH-UI-045`        |
| Diseñar experiencia y validar usabilidad | `AUTH-UI-046` a `AUTH-UI-060`        |
| Rediseñar experiencia propia de ORIGO    | subbloque `ORIGO-UX` correspondiente |

#### 4. Contrato de inventario

1. Cada archivo `page.tsx` se registra como un patrón de ruta, no como una fila por instancia o query string.
2. Los segmentos dinámicos `[id]` se conservan literalmente.
3. Layouts, componentes, server actions, helpers y loading states no se cuentan como rutas.
4. Los route handlers se registran aparte y nunca como pantallas.
5. Una redirección o estado de denegación sigue siendo ruta real, pero no vista de negocio independiente.
6. La existencia de middleware, `requireAppAccess`, un permiso sugerido por sincronización o un enlace no demuestra autorización funcional completa.
7. No se declara una ruta duplicada, legacy o candidata a retiro antes de `AUTH-UI-026` a `AUTH-UI-028`.
8. Todo cambio de árbol, patrón, método, guard o sincronización invalida la huella afectada.

#### 5. Resumen reconciliado

| Métrica                                  |   Resultado |
| ---------------------------------------- | ----------: |
| Rutas de página                          |      **13** |
| Patrones estáticos                       |      **10** |
| Patrones dinámicos                       |       **3** |
| Rutas que renderizan vista o estado      |      **12** |
| Puentes de redirección                   |       **1** |
| Route handlers técnicos separados        |       **1** |
| Patrones App Router totales              |      **14** |
| Rutas descubiertas por `sync-navigation` |      **12** |
| Rutas excluidas del sincronizador        | **1** — `/` |
| Candidatas explícitas de menú            |       **4** |
| Patrones URL duplicados                  |       **0** |
| Archivos fuente duplicados               |       **0** |

#### 6. Matriz canónica de rutas

| ID                | Patrón                       | Archivo fuente                               | Tipo       | Comportamiento    | Familia observada | Clasificación de sincronización | Evidencia de acceso observada                                                   | Límite documental                                                                                      |
| ----------------- | ---------------------------- | -------------------------------------------- | ---------- | ----------------- | ----------------- | ------------------------------- | ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `ORIGO-ROUTE-001` | `/`                          | `src/app/page.tsx`                           | `ESTATICA` | `VISTA`           | `INICIO`          | `EXCLUDED_ROOT_BY_SYNC_SCRIPT`  | requireAppAccess para origo; acceso de aplicación                               | Inicio real de ORIGO; la raíz no se registra por el sincronizador.                                     |
| `ORIGO-ROUTE-002` | `/login`                     | `src/app/login/page.tsx`                     | `ESTATICA` | `REDIRECT_BRIDGE` | `ACCESO`          | `AUTH_NOT_MENU`                 | Excluida del middleware; normaliza returnTo y delega el login al SHELL          | Puente de acceso, no pantalla operativa.                                                               |
| `ORIGO-ROUTE-003` | `/no-access`                 | `src/app/no-access/page.tsx`                 | `ESTATICA` | `VISTA_ESTADO`    | `ACCESO`          | `AUTH_NOT_MENU`                 | Excluida del middleware; muestra razón, permiso y ruta solicitada               | Estado de denegación; no concede ni repara autoridad.                                                  |
| `ORIGO-ROUTE-004` | `/product-master-review`     | `src/app/product-master-review/page.tsx`     | `ESTATICA` | `VISTA`           | `CATALOGO`        | `MENU_CANDIDATE`                | requireAppAccess con procurement.receipts y sede activa                         | Revisión administrativa de solicitudes de producto o presentación; clasificación definitiva posterior. |
| `ORIGO-ROUTE-005` | `/purchase-orders`           | `src/app/purchase-orders/page.tsx`           | `ESTATICA` | `VISTA`           | `COMPRAS`         | `MENU_CANDIDATE`                | requireAppAccess para origo; filtros por estado y sede                          | Listado de órdenes; permiso definitivo de lectura queda pendiente.                                     |
| `ORIGO-ROUTE-006` | `/purchase-orders/[id]`      | `src/app/purchase-orders/[id]/page.tsx`      | `DINAMICA` | `VISTA`           | `COMPRAS`         | `DETAIL_NOT_MENU`               | requireAppAccess para origo; carga por id                                       | Detalle dinámico; conocer un id no concede relación ni acción.                                         |
| `ORIGO-ROUTE-007` | `/purchase-orders/[id]/edit` | `src/app/purchase-orders/[id]/edit/page.tsx` | `DINAMICA` | `VISTA`           | `COMPRAS`         | `DETAIL_NOT_MENU`               | requireAppAccess para origo; la página limita edición a draft                   | Edición dinámica; estado visible no sustituye protección de mutaciones.                                |
| `ORIGO-ROUTE-008` | `/purchase-orders/new`       | `src/app/purchase-orders/new/page.tsx`       | `ESTATICA` | `VISTA`           | `COMPRAS`         | `SUBMENU_NOT_MENU`              | requireAppAccess para origo                                                     | Creación de orden; abrir la ruta no autoriza todos los efectos del formulario.                         |
| `ORIGO-ROUTE-009` | `/receipts`                  | `src/app/receipts/page.tsx`                  | `ESTATICA` | `VISTA`           | `RECEPCIONES`     | `MENU_CANDIDATE`                | requireAppAccess con procurement.receipts y sede activa                         | Histórico de recepciones y compras solo registro; acciones se protegen por separado.                   |
| `ORIGO-ROUTE-010` | `/receipts/new`              | `src/app/receipts/new/page.tsx`              | `ESTATICA` | `VISTA`           | `RECEPCIONES`     | `SUBMENU_NOT_MENU`              | requireAppAccess con procurement.receipts, sede y controles de sesión operativa | Nueva recepción, corrección y solo registro; query params no crean rutas adicionales.                  |
| `ORIGO-ROUTE-011` | `/suppliers`                 | `src/app/suppliers/page.tsx`                 | `ESTATICA` | `VISTA`           | `PROVEEDORES`     | `MENU_CANDIDATE`                | requireAppAccess para origo; calcula capacidad de gestión para acciones         | Listado de proveedores; visibilidad y gestión permanecen separadas.                                    |
| `ORIGO-ROUTE-012` | `/suppliers/[id]/edit`       | `src/app/suppliers/[id]/edit/page.tsx`       | `DINAMICA` | `VISTA`           | `PROVEEDORES`     | `DETAIL_NOT_MENU`               | requireAppAccess y requireCanManageSuppliers                                    | Edición dinámica; el helper observado será reconciliado con autorización canónica.                     |
| `ORIGO-ROUTE-013` | `/suppliers/new`             | `src/app/suppliers/new/page.tsx`             | `ESTATICA` | `VISTA`           | `PROVEEDORES`     | `SUBMENU_NOT_MENU`              | requireAppAccess y requireCanManageSuppliers                                    | Creación de proveedor; la acción de servidor requiere auditoría posterior.                             |

#### 7. Superficie técnica separada

| ID                  | Patrón                      | Archivo fuente                              | Método | Runtime  | Evidencia de acceso                                                                                                          | Tratamiento                                         |
| ------------------- | --------------------------- | ------------------------------------------- | ------ | -------- | ---------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------- |
| `ORIGO-HANDLER-001` | `/purchase-orders/[id]/pdf` | `src/app/purchase-orders/[id]/pdf/route.ts` | `GET`  | `NODEJS` | Token firmado válido para la orden o sesión autenticada con `origo.access`; responde `401`, `403` o `404` cuando corresponde | Generación de PDF; superficie técnica, no pantalla. |

El middleware deja pasar este patrón para permitir el enlace firmado. La protección efectiva permanece dentro del handler y no puede trasladarse al frontend.

#### 8. Topología de navegación observada

El script `sync-navigation.mjs` descubre páginas `page.tsx` o `page.ts`, excluye carpetas técnicas y omite expresamente `/`. Para las doce rutas restantes:

| Clasificación                 | Cantidad | Rutas                                                                         |
| ----------------------------- | -------: | ----------------------------------------------------------------------------- |
| `auth`                        |    **2** | `/login`, `/no-access`                                                        |
| `menu`                        |    **4** | `/purchase-orders`, `/receipts`, `/suppliers`, `/product-master-review`       |
| `detail`                      |    **3** | `/purchase-orders/[id]`, `/purchase-orders/[id]/edit`, `/suppliers/[id]/edit` |
| `submenu`                     |    **3** | `/purchase-orders/new`, `/receipts/new`, `/suppliers/new`                     |
| Excluida antes de sincronizar |    **1** | `/`                                                                           |

Los permisos escritos por el sincronizador son metadatos sugeridos para registro. No sustituyen la comprobación del guard y de cada acción. En particular:

- compras recibe la sugerencia `origo.procurement.purchase_orders`, pero las páginas inspeccionadas declaran acceso general a ORIGO;
- recepciones declara `procurement.receipts` en las páginas y el guard lo normaliza al espacio ORIGO;
- revisión de maestro se registra con una sugerencia propia, mientras la superficie real usa `procurement.receipts`;
- proveedores separa lectura de acciones de gestión y conserva un helper adicional que deberá reconciliarse con el modelo canónico.

#### 9. Topología de acceso observada

##### 9.1 Middleware

El middleware protege las páginas ordinarias y excluye `login`, `no-access`, recursos estáticos y APIs. También exceptúa el PDF dinámico de orden, cuya validación ocurre dentro del handler.

##### 9.2 Guard compartido

`requireAppAccess` resuelve usuario, acceso a aplicación, sesión operativa, dispositivo compartido, sede, área, simulación y permisos opcionales. Este inventario registra únicamente controles observados; no evalúa todavía si cada permiso es el definitivo.

##### 9.3 Acciones y recursos

Abrir una ruta no autoriza todas sus mutaciones. Los identificadores dinámicos, la sede solicitada, el estado `draft`, las ventanas de corrección, las firmas de dispositivo compartido y la relación con el recurso deben volver a verificarse en servidor.

#### 10. Hallazgos y carryover obligatorio

| ID                        | Hallazgo                                                                                                  | Tratamiento inmediato                                                                                  | Propietario y momento de resolución                                         |
| ------------------------- | --------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------- |
| `ORIGO-ROUTE-FINDING-001` | La raíz `/` existe, pero el sincronizador la excluye antes del upsert.                                    | Mantenerla en el inventario fuente y no fingir que existe en el registro runtime.                      | `AUTH-UI-045`, al reconciliar código, registro y navegación.                |
| `ORIGO-ROUTE-FINDING-002` | Solo cuatro de las doce rutas sincronizadas son candidatas de menú.                                       | No interpretar el resto como inaccesible ni convertir cada página en enlace principal.                 | `AUTH-UI-040`, `AUTH-UI-045`, `AUTH-UI-052` y `AUTH-UI-053`.                |
| `ORIGO-ROUTE-FINDING-003` | Los permisos sugeridos por sincronización y los guards explícitos no son uniformes.                       | Conservar ambos como evidencia separada; no elegir uno por inferencia.                                 | `AUTH-UI-030`, `AUTH-UI-031`, `AUTH-UI-043` y `AUTH-UI-044`.                |
| `ORIGO-ROUTE-FINDING-004` | El helper de proveedores admite permiso explícito y una compatibilidad por roles observada.               | No aprobar ese fallback como autorización canónica dentro de esta tarea.                               | `AUTH-UI-031`, `AUTH-UI-043` y `AUTH-UI-044`, antes de aprobar acciones.    |
| `ORIGO-ROUTE-FINDING-005` | El PDF admite token firmado externo o sesión interna y usa service role únicamente tras validar el token. | Mantenerlo fuera del catálogo de pantallas y auditar alcance, expiración, datos visibles y revocación. | `AUTH-UI-029`, `AUTH-UI-031`, `AUTH-UI-038`, `AUTH-UI-039` y `AUTH-UI-043`. |
| `ORIGO-ROUTE-FINDING-006` | El inventario está anclado a un commit y puede quedar obsoleto.                                           | Comparar árbol, patrones, handlers y guards en cada cambio material.                                   | `SHELL-CI-017` y paquete E5 propietario.                                    |

No queda ningún hallazgo narrativo sin tarea y momento de resolución.

#### 11. Reglas de cambio

Obligan a regenerar este inventario:

- alta, retiro o movimiento de un archivo `page.*`;
- cambio de patrón o parámetro dinámico;
- conversión entre vista, estado y redirección;
- alta, retiro o cambio de método de un route handler;
- cambio de middleware, guard, permiso o compatibilidad por rol;
- cambio de las cuatro rutas candidatas de menú;
- inclusión o exclusión de la raíz en el registro runtime;
- coexistencia de patrones equivalentes sin clasificación posterior.

#### 12. Criterios de aceptación

- [x] Se inspeccionó `devVentoGroup/vento-origo` como repositorio operativo.
- [x] Se fijaron rama y commit.
- [x] Se registraron trece páginas con IDs consecutivos.
- [x] Se preservaron tres patrones dinámicos.
- [x] Se separó el handler PDF.
- [x] Se reconciliaron trece páginas fuente, doce sincronizadas y cuatro candidatas de menú.
- [x] Se distinguieron guard real y permiso sugerido por sincronización.
- [x] Cada hallazgo tiene propietario y momento de resolución.
- [x] No se modificó código, Supabase, navegación runtime ni despliegue.
- [x] No se inició `AUTH-UI-004`.

#### 13. Decisión aprobada

```text
ORIGO_ROUTE_SOURCE_INVENTORY = APPROVED
PAGE_ROUTES = 13
STATIC_PATTERNS = 10
DYNAMIC_PATTERNS = 3
SYNCED_SOURCE_ROUTES = 12
MENU_CANDIDATES = 4
TECHNICAL_ROUTE_HANDLERS = 1
PERMISSION_COMPLETENESS = NOT_EVALUATED
RETIREMENT_DECISIONS = NONE
NEXT_TASK = AUTH-UI-004
```

#### Requisitos de prueba derivados

La actualización canónica completa del registro `04A` incorpora:

`TREQ-ORIGO-006` a `TREQ-ORIGO-025`.

Los requisitos protegen descubrimiento exhaustivo, identidad estable, patrones dinámicos, separación de handler, raíz excluida del sincronizador, candidatas de menú, guards, token firmado, deriva del snapshot y prohibición de inferir autorización o completitud desde infraestructura existente.

#### 14. Continuidad

```text
AUTH-UI-003 — APROBADA
        ↓
AUTH-UI-004 — Inventariar todas las rutas de PULSO
```


### ✅ AUTH-UI-004 — Inventariar todas las rutas de PULSO

**Estado:** APROBADA
**Fecha de aprobación documental:** 2026-07-28
**Bloque propietario:** BLOQUE I — Navegación, pantallas y autorización de vistas
**Tipo de tarea:** inventario técnico-documental; sin cambios de código, Supabase, despliegue ni navegación runtime

#### 1. Objetivo

Inventariar de forma exhaustiva y reproducible las rutas reales expuestas por PULSO en el snapshot inspeccionado, distinguiendo páginas de negocio, estado de denegación, uso de parámetros de consulta, protección observada y superficies técnicas que no constituyen rutas.

La tarea establece una línea base de existencia y topología. No rediseña PULSO, no asigna todavía `process_id` o `process_step`, no aprueba permisos definitivos y no declara ninguna ruta apta para menú, piloto, cutover, producción o completitud de proceso.

#### 2. Fuente inspeccionada

| Campo                    | Valor                                                                                                                                      |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------ |
| Repositorio operativo    | `devVentoGroup/vento-pulso`                                                                                                                |
| Rama                     | `main`                                                                                                                                     |
| Commit                   | `71e0184486b5fe11e0a42435baf4024807a80efd`                                                                                                 |
| Framework observado      | Next.js App Router                                                                                                                         |
| Raíz de páginas          | `src/app`                                                                                                                                  |
| Evidencia complementaria | `src/lib/auth/guard.ts`, `src/lib/auth/permissions.ts`, `src/lib/supabase/proxy.ts`, `package.json` y componentes servidos por las páginas |
| Estado del snapshot      | `SOURCE_INVENTORY_APPROVED`                                                                                                                |

#### 3. Frontera obligatoria

```text
RUTA EN CÓDIGO
≠ ELEMENTO DE MENÚ
≠ REGISTRO RUNTIME
≠ PROCESS_ID
≠ PERMISO DEFINITIVO
≠ PROCESO COMPLETO
```

| Decisión pendiente                       | Tarea propietaria                    |
| ---------------------------------------- | ------------------------------------ |
| Asignar proceso y paso                   | `AUTH-UI-011` y `AUTH-UI-012`        |
| Definir propietaria y consumo            | `AUTH-UI-013` y `AUTH-UI-014`        |
| Clasificar intención de vista            | `AUTH-UI-015` a `AUTH-UI-029`        |
| Asignar permisos y contexto              | `AUTH-UI-030` a `AUTH-UI-045`        |
| Diseñar experiencia y validar usabilidad | `AUTH-UI-046` a `AUTH-UI-060`        |
| Rediseñar experiencia propia de PULSO    | subbloque `PULSO-UX` correspondiente |

#### 4. Contrato de inventario

1. Cada archivo `page.tsx`, `page.ts`, `page.jsx` o `page.js` se registra como un patrón de ruta.
2. Los query parameters no crean rutas adicionales; `site_id`, filtros, mensajes y estados pertenecen al contrato de la vista que los consume.
3. Layouts, componentes, server actions, helpers, módulos y estados de carga no se cuentan como rutas.
4. Los route handlers se registran aparte y nunca como pantallas; en el snapshot no se identificó ninguno bajo `src/app`.
5. Una ruta que renderiza el mismo componente que otra conserva identidad separada hasta que `AUTH-UI-026` determine si existe duplicidad funcional.
6. La ausencia de una ruta local de login no implica ausencia de autenticación; el guard puede delegarla al SHELL.
7. La existencia de `requireAppAccess`, `pos.main` o un enlace no demuestra que la autorización exacta por acción ya sea definitiva.
8. Todo cambio de árbol, patrón, guard, permiso o navegación invalida la huella afectada y exige reejecutar el inventario.

#### 5. Resumen reconciliado

| Métrica                                      |                Resultado |
| -------------------------------------------- | -----------------------: |
| Rutas de página                              |                    **6** |
| Patrones estáticos                           |                    **6** |
| Patrones dinámicos                           |                    **0** |
| Vistas de negocio u operación                |                    **5** |
| Estados de denegación                        |                    **1** |
| Puentes locales de redirección               |                    **0** |
| Route handlers técnicos                      |                    **0** |
| Patrones App Router totales                  |                    **6** |
| Rutas con guard explícito                    |                    **5** |
| Rutas sin guard por ser estado de denegación |                    **1** |
| Pares que renderizan el mismo componente     | **1** — `/` y `/scanner` |
| Patrones URL duplicados                      |                    **0** |
| Archivos fuente duplicados                   |                    **0** |
| Sincronizador local de navegación observado  |                    **0** |

#### 6. Matriz canónica de rutas

| ID                | Patrón           | Archivo fuente                   | Tipo       | Comportamiento | Familia observada    | Evidencia de acceso observada                                                                                                                               | Límite documental                                                                                                              |
| ----------------- | ---------------- | -------------------------------- | ---------- | -------------- | -------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| `PULSO-ROUTE-001` | `/`              | `src/app/page.tsx`               | `ESTATICA` | `VISTA`        | `POS_SCANNER`        | `requireAppAccess` para `pulso`, `pos.main`, acceso de aplicación, sede y sesión operativa; informa si el dispositivo es compartido al componente           | Raíz operativa actual; comparte implementación con `/scanner`, sin declarar todavía duplicidad.                                |
| `PULSO-ROUTE-002` | `/no-access`     | `src/app/no-access/page.tsx`     | `ESTATICA` | `VISTA_ESTADO` | `ACCESO`             | No ejecuta guard; presenta denegación genérica y enlace a `/`                                                                                               | Estado de denegación; no concede ni repara permisos y no constituye vista de negocio.                                          |
| `PULSO-ROUTE-003` | `/orders`        | `src/app/orders/page.tsx`        | `ESTATICA` | `VISTA`        | `PEDIDOS_OPERACION`  | `requireAppAccess` para `pulso`, `pos.main`, acceso de aplicación y sede; las acciones de estado, despacho y chat vuelven a ejecutar protección de servidor | Tablero agregado de pedidos, despacho, conversación, facturación y eventos; las acciones exactas se clasifican después.        |
| `PULSO-ROUTE-004` | `/sales-imports` | `src/app/sales-imports/page.tsx` | `ESTATICA` | `VISTA`        | `IMPORTACION_VENTAS` | `requireAppAccess` para `pulso`, `pos.main`, acceso de aplicación y sede; importar, mapear y publicar usan acciones de servidor protegidas                  | Superficie administrativa y de integración; su permiso definitivo no se infiere de `pos.main`.                                 |
| `PULSO-ROUTE-005` | `/salon`         | `src/app/salon/page.tsx`         | `ESTATICA` | `VISTA`        | `SALON`              | `requireAppAccess` para `pulso`, `pos.main`, acceso de aplicación y sede                                                                                    | Vista operativa de zonas, mesas, sesiones y llamados; mutaciones y roles exactos permanecen pendientes.                        |
| `PULSO-ROUTE-006` | `/scanner`       | `src/app/scanner/page.tsx`       | `ESTATICA` | `VISTA`        | `POS_SCANNER`        | `requireAppAccess` para `pulso`, `pos.main`, acceso de aplicación, sede y sesión operativa; informa si el dispositivo es compartido al componente           | Alias o segunda entrada técnica hacia `ScannerPage`; la decisión de consolidación corresponde a `AUTH-UI-026` a `AUTH-UI-028`. |

#### 7. Superficie técnica separada

No se identificaron archivos `route.ts`, `route.tsx`, `route.js` o `route.jsx` bajo `src/app` en el snapshot aprobado.

Las acciones de servidor embebidas en páginas y componentes no se contabilizan como rutas. Entre las superficies técnicas observadas se encuentran:

- cambios de estado operativo de pedidos;
- asignación de despacho;
- envío y archivo de conversaciones;
- importación XLSX de ventas;
- mapeo de identificadores externos;
- publicación de lotes de venta;
- acciones de escaneo, identificación, fidelización y redención servidas por módulos internos.

Su clasificación como acciones protegidas, APIs internas o capacidades técnicas corresponde a `AUTH-UI-029`, `AUTH-UI-031`, `AUTH-UI-042` y `AUTH-UI-043`.

#### 8. Topología de acceso y navegación observada

##### 8.1 Autenticación

PULSO no expone una ruta local `/login` en el snapshot. Cuando no existe usuario autenticado, `requireAppAccess` construye el destino de autenticación mediante el contrato SSO del SHELL. Esta delegación no se cuenta como ruta PULSO.

##### 8.2 Guard compartido

Las cinco rutas de negocio ejecutan `requireAppAccess` con:

- aplicación `pulso`;
- acceso de aplicación obligatorio;
- permiso local declarado `pos.main`, normalizado como `pulso.pos.main`;
- sede y área resueltas desde la sesión operativa;
- tratamiento específico para dispositivo compartido y simulación de rol.

El inventario registra esta uniformidad como evidencia técnica, no como aprobación del permiso definitivo para pedidos, importaciones, salón o escáner.

##### 8.3 Navegación runtime

`package.json` no expone `sync:navigation`, `prebuild` de registro ni otro sincronizador local equivalente al observado en NEXO u ORIGO. Por tanto:

```text
RUNTIME_REGISTRY_STATUS = NOT_EVALUATED
MENU_STATUS = NOT_EVALUATED
```

La existencia de enlaces o accesos internos no se convierte en menú aprobado. La reconciliación con `app_screen_registry`, `app_navigation_items` y SHELL queda reservada para `AUTH-UI-045`.

##### 8.4 Parámetros de consulta

Los parámetros observados, entre ellos `site_id`, `view`, `fulfillment`, `message`, `error` y `ok`, modifican contexto, filtros o retroalimentación. No crean rutas nuevas ni autorizan otra sede por sí mismos.

#### 9. Hallazgos y carryover obligatorio

| ID                        | Hallazgo                                                                                                                  | Tratamiento inmediato                                                          | Propietario y momento de resolución                                                                       |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------- |
| `PULSO-ROUTE-FINDING-001` | `/` y `/scanner` renderizan `ScannerPage` mediante archivos fuente distintos.                                             | Conservar ambas rutas en el inventario y no retirar ninguna por inferencia.    | `AUTH-UI-026` a `AUTH-UI-028`, antes de decidir consolidación o retiro.                                   |
| `PULSO-ROUTE-FINDING-002` | Las cinco rutas de negocio declaran el mismo permiso local `pos.main` pese a cubrir intenciones materialmente diferentes. | Registrar el permiso observado sin declararlo definitivo ni suficiente.        | `AUTH-UI-030` a `AUTH-UI-045` y subbloque `PULSO-AUTH`, antes de implementar la matriz final.             |
| `PULSO-ROUTE-FINDING-003` | `/orders` concentra lectura, transiciones, despacho, chat, facturación y eventos.                                         | Separar apertura de vista de cada acción y efecto de servidor.                 | `AUTH-UI-024`, `AUTH-UI-025`, `AUTH-UI-031`, `AUTH-UI-042` y `AUTH-UI-043`.                               |
| `PULSO-ROUTE-FINDING-004` | `/sales-imports` concentra carga de archivo, mapeo MID y publicación con impacto de inventario.                           | No tratar `pos.main` como autorización suficiente para todas las acciones.     | `AUTH-UI-016`, `AUTH-UI-024`, `AUTH-UI-025`, `AUTH-UI-031`, `AUTH-UI-038`, `AUTH-UI-042` y `AUTH-UI-043`. |
| `PULSO-ROUTE-FINDING-005` | No existe `/login` local; el acceso no autenticado se delega al SHELL.                                                    | Conservar la frontera SSO y no inventariar el destino externo como ruta PULSO. | `AUTH-UI-040`, `AUTH-UI-041` y `AUTH-UI-045`.                                                             |
| `PULSO-ROUTE-FINDING-006` | No se observó sincronizador local de navegación ni evidencia runtime en esta tarea.                                       | Mantener registro y menú como `NOT_EVALUATED`.                                 | `AUTH-UI-045` y `SHELL-CI-017`, antes de aprobar navegación.                                              |
| `PULSO-ROUTE-FINDING-007` | `/no-access` presenta una denegación genérica y no muestra razón, permiso o contexto activo.                              | No ampliar información sensible; estandarizar el estado posteriormente.        | `AUTH-UI-048`, durante diseño transversal de estados sin acceso.                                          |
| `PULSO-ROUTE-FINDING-008` | No existen route handlers App Router, pero sí múltiples server actions y módulos técnicos.                                | Mantenerlos fuera del conteo de pantallas y auditar protección por acción.     | `AUTH-UI-029`, `AUTH-UI-031`, `AUTH-UI-042` y `AUTH-UI-043`.                                              |
| `PULSO-ROUTE-FINDING-009` | El inventario queda anclado a un commit y puede quedar obsoleto.                                                          | Comparar árbol, patrón, guard y permiso en todo cambio material.               | `SHELL-CI-017` y paquete E5 propietario antes de implementación o retiro.                                 |

No queda ningún hallazgo narrativo sin tarea, bloque y momento de resolución.

#### 10. Reglas de cambio

Un cambio material incluye:

- agregar, retirar o mover un archivo `page.*`;
- introducir segmentos dinámicos, grupos de ruta o rutas paralelas;
- hacer que una vista renderice otro componente principal;
- agregar o retirar un route handler;
- cambiar el guard, permiso, sede, área o tratamiento de dispositivo compartido;
- introducir un login local, una redirección o un sincronizador de navegación;
- convertir parámetros de consulta en segmentos de ruta;
- mantener dos rutas equivalentes sin clasificación posterior.

Todo cambio deberá regenerar la matriz y registrar su impacto sin reescribir silenciosamente esta línea base.

#### 11. Criterios de aceptación

- [x] Se inspeccionó `devVentoGroup/vento-pulso` y no otro repositorio como sustituto.
- [x] Se fijaron rama y commit.
- [x] Se registraron seis archivos de página con IDs consecutivos.
- [x] Se comprobó que los seis patrones son estáticos.
- [x] Se distinguieron cinco vistas de negocio y un estado de denegación.
- [x] Se registró que `/` y `/scanner` usan el mismo componente sin declarar todavía duplicidad.
- [x] Se confirmó la ausencia de route handlers App Router.
- [x] Se documentó la delegación de autenticación al SHELL sin inventar una ruta `/login`.
- [x] Se documentó `pos.main` como permiso observado, no definitivo.
- [x] Se asignó cada hallazgo a una tarea y momento de resolución.
- [x] No se modificó código, Supabase, navegación runtime ni despliegue.
- [x] No se inició `AUTH-UI-005`.

#### 12. Decisión aprobada

```text
PULSO_ROUTE_SOURCE_INVENTORY = APPROVED
PAGE_ROUTES = 6
STATIC_ROUTES = 6
DYNAMIC_ROUTES = 0
TECHNICAL_ROUTE_HANDLERS = 0
LOCAL_LOGIN_ROUTE = ABSENT
RUNTIME_MENU_STATUS = NOT_EVALUATED
PERMISSION_COMPLETENESS = NOT_EVALUATED
RETIREMENT_DECISIONS = NONE
NEXT_TASK = AUTH-UI-005
```

#### Requisitos de prueba derivados

La actualización canónica completa del registro `04A` incorpora:

`TREQ-PULSO-008` a `TREQ-PULSO-027`.

Los requisitos protegen descubrimiento exhaustivo, identidad estable, separación entre rutas y acciones, estado de denegación, delegación SSO, autorización territorial, paridad entre `/` y `/scanner`, ausencia de handlers, parámetros de consulta, deriva del snapshot y prohibición de inferir navegación, permiso o completitud desde la sola existencia de archivos.

#### 13. Huella de archivos fuente

| Evidencia                        | Git blob                                   |
| -------------------------------- | ------------------------------------------ |
| `src/app/page.tsx`               | `40431b2e8d160c9f1af81e870e0e41b401b87018` |
| `src/app/no-access/page.tsx`     | `0fdd5fdef9f5cca7bd2789443969a63b817c2061` |
| `src/app/orders/page.tsx`        | `abcaefaec16a42e4ece18575addb93e25b1a1228` |
| `src/app/sales-imports/page.tsx` | `cdc69eeab9229e4e23069969e4192395291b364b` |
| `src/app/salon/page.tsx`         | `4e47a7b4a7e569d05013c0c351ca7fc7d51e6d99` |
| `src/app/scanner/page.tsx`       | `ace214820e9aaa93a4524731202924719d743ee6` |
| `src/lib/auth/guard.ts`          | `ae708911c06e0bae35dead2343879d69ec23ee5b` |
| `src/lib/auth/permissions.ts`    | `8087fbe3b949c9b8fe553f1d1d76ef4da169bd22` |
| `package.json`                   | `83d1340544f209df7f53b37551b6f71dd2c668a6` |

#### 14. Continuidad

```text
AUTH-UI-003 — APROBADA POR EL USUARIO
        ↓
AUTH-UI-004 — APROBADA
        ↓
AUTH-UI-005 — Inventariar todas las rutas de VISO
```


### ✅ AUTH-UI-005 — Inventariar todas las rutas de VISO

**Estado:** APROBADA
**Fecha de aprobación documental:** 2026-07-28
**Bloque propietario:** BLOQUE I — Navegación, pantallas y autorización de vistas
**Tipo de tarea:** inventario técnico-documental; sin cambios de código, Supabase, despliegue ni navegación runtime

#### 1. Objetivo

Inventariar de forma exhaustiva y reproducible las rutas reales expuestas por VISO en el snapshot inspeccionado, distinguiendo páginas administrativas, patrones dinámicos, superficies públicas controladas, guards observados y route handlers que no constituyen pantallas.

La tarea establece una línea base de existencia y topología. No rediseña VISO, no asigna todavía `process_id` o `process_step`, no aprueba permisos definitivos, no clasifica solapamientos como duplicados o legacy y no declara ninguna ruta apta para menú, piloto, cutover, producción o completitud de proceso.

#### 2. Fuente inspeccionada

| Campo                     | Valor                                                                                                          |
| ------------------------- | -------------------------------------------------------------------------------------------------------------- |
| Repositorio operativo     | `devVentoGroup/vento-viso`                                                                                     |
| Rama                      | `main`                                                                                                         |
| Commit                    | `776a5b01008b342cdc9fbcc046a185a82d93f7f5`                                                                     |
| Framework observado       | Next.js App Router                                                                                             |
| Raíz de páginas           | `src/app`                                                                                                      |
| Evidencia complementaria  | `middleware.ts`, `src/lib/auth/guard.ts`, `src/app/staff/schedule/helpers.ts`, route handlers y `package.json` |
| Estado del snapshot       | `SOURCE_INVENTORY_APPROVED`                                                                                    |
| Base documental utilizada | `AUTH-UI-004` y `04A_TREQ_AUTH-UI-004_2026-07-28_R01.md` aprobados localmente                                  |

#### 3. Frontera obligatoria

```text
RUTA EN CÓDIGO
≠ ELEMENTO DE MENÚ
≠ REGISTRO RUNTIME
≠ PROCESS_ID
≠ PERMISO DEFINITIVO
≠ PROCESO COMPLETO
```

| Decisión pendiente                                                | Tarea propietaria                   |
| ----------------------------------------------------------------- | ----------------------------------- |
| Asignar proceso y paso                                            | `AUTH-UI-011` y `AUTH-UI-012`       |
| Definir propietaria y consumo                                     | `AUTH-UI-013` y `AUTH-UI-014`       |
| Clasificar intención, actores, dispositivo, frecuencia y acciones | `AUTH-UI-015` a `AUTH-UI-025`       |
| Resolver solapamientos, legacy y retiro                           | `AUTH-UI-026` a `AUTH-UI-029`       |
| Asignar permisos y contexto                                       | `AUTH-UI-030` a `AUTH-UI-045`       |
| Diseñar experiencia propia de VISO                                | subbloque `VISO-UX` correspondiente |

#### 4. Contrato de inventario

1. Cada archivo `page.tsx`, `page.ts`, `page.jsx` o `page.js` se registra como un patrón de ruta.
2. Los segmentos `[id]` y `[slug]` permanecen literales; no se crea una fila por entidad.
3. Los query parameters no crean rutas adicionales.
4. Layouts, componentes, server actions, helpers, error boundaries y estados de carga no se cuentan como rutas.
5. Los route handlers se registran aparte y nunca como pantallas.
6. `/login` y `/no-access` se conservan como superficies públicas controladas, no como vistas administrativas.
7. Un solapamiento nominal o funcional no autoriza retirada ni consolidación antes de `AUTH-UI-026` a `AUTH-UI-028`.
8. Todo cambio de árbol, patrón, guard o handler invalida la huella afectada y exige reejecutar el inventario.

#### 5. Resumen reconciliado

| Métrica                                        |            Resultado |
| ---------------------------------------------- | -------------------: |
| Rutas de página                                |               **60** |
| Patrones estáticos                             |               **47** |
| Patrones dinámicos                             |               **13** |
| Vistas administrativas u operativas protegidas |               **58** |
| Puentes de redirección                         |     **1** — `/login` |
| Estados de denegación                          | **1** — `/no-access` |
| Rutas con `requireAppAccess`                   |               **56** |
| Rutas con `requireStaffScheduleAccess`         |                **2** |
| Superficies públicas controladas               |                **2** |
| Route handlers técnicos                        |               **10** |
| Patrones App Router totales                    |               **70** |
| Patrones URL duplicados                        |                **0** |
| Archivos fuente duplicados                     |                **0** |
| Sincronizador local de navegación observado    |                **0** |

#### 6. Matriz canónica de rutas

| ID               | Patrón                               | Archivo fuente                                       | Tipo       | Comportamiento    | Familia observada              | Evidencia de acceso observada                                                                                   | Límite documental                                                                                      |
| ---------------- | ------------------------------------ | ---------------------------------------------------- | ---------- | ----------------- | ------------------------------ | --------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `VISO-ROUTE-001` | `/`                                  | `src/app/page.tsx`                                   | `ESTATICA` | `VISTA`           | `INICIO`                       | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Panel agregado; sus enlaces no equivalen a autorización definitiva de las superficies destino.         |
| `VISO-ROUTE-002` | `/login`                             | `src/app/login/page.tsx`                             | `ESTATICA` | `REDIRECT_BRIDGE` | `ACCESO`                       | Puente público hacia login central de SHELL; normaliza `returnTo`.                                              | No constituye vista administrativa ni concede acceso.                                                  |
| `VISO-ROUTE-003` | `/no-access`                         | `src/app/no-access/page.tsx`                         | `ESTATICA` | `VISTA_ESTADO`    | `ACCESO`                       | Estado público/controlado de denegación; solo acepta `returnTo` local.                                          | No concede, repara ni amplía permisos.                                                                 |
| `VISO-ROUTE-004` | `/accounting`                        | `src/app/accounting/page.tsx`                        | `ESTATICA` | `VISTA`           | `CONTABILIDAD`                 | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Existencia y guard observados; proceso, acciones, menú, permiso exacto y retiro permanecen pendientes. |
| `VISO-ROUTE-005` | `/app-navigation`                    | `src/app/app-navigation/page.tsx`                    | `ESTATICA` | `VISTA`           | `NAVEGACION`                   | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Existencia y guard observados; proceso, acciones, menú, permiso exacto y retiro permanecen pendientes. |
| `VISO-ROUTE-006` | `/app-updates`                       | `src/app/app-updates/page.tsx`                       | `ESTATICA` | `VISTA`           | `ACTUALIZACIONES`              | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Existencia y guard observados; proceso, acciones, menú, permiso exacto y retiro permanecen pendientes. |
| `VISO-ROUTE-007` | `/businesses`                        | `src/app/businesses/page.tsx`                        | `ESTATICA` | `VISTA`           | `NEGOCIOS`                     | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Existencia y guard observados; proceso, acciones, menú, permiso exacto y retiro permanecen pendientes. |
| `VISO-ROUTE-008` | `/businesses/new`                    | `src/app/businesses/new/page.tsx`                    | `ESTATICA` | `VISTA`           | `NEGOCIOS`                     | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Formulario de alta separado; la acción de guardar exige protección de servidor propia.                 |
| `VISO-ROUTE-009` | `/businesses/[id]`                   | `src/app/businesses/[id]/page.tsx`                   | `DINAMICA` | `VISTA`           | `NEGOCIOS`                     | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | El segmento dinámico conserva un único patrón contractual; no se expande por instancia de datos.       |
| `VISO-ROUTE-010` | `/commercial-audit`                  | `src/app/commercial-audit/page.tsx`                  | `ESTATICA` | `VISTA`           | `COMERCIAL_AUDITORIA`          | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Existencia y guard observados; proceso, acciones, menú, permiso exacto y retiro permanecen pendientes. |
| `VISO-ROUTE-011` | `/commercial-audit/structure`        | `src/app/commercial-audit/structure/page.tsx`        | `ESTATICA` | `VISTA`           | `COMERCIAL_AUDITORIA`          | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Existencia y guard observados; proceso, acciones, menú, permiso exacto y retiro permanecen pendientes. |
| `VISO-ROUTE-012` | `/commercial-availability`           | `src/app/commercial-availability/page.tsx`           | `ESTATICA` | `VISTA`           | `COMERCIAL_DISPONIBILIDAD`     | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Existencia y guard observados; proceso, acciones, menú, permiso exacto y retiro permanecen pendientes. |
| `VISO-ROUTE-013` | `/commercial-categories`             | `src/app/commercial-categories/page.tsx`             | `ESTATICA` | `VISTA`           | `COMERCIAL_CATEGORIAS`         | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Existencia y guard observados; proceso, acciones, menú, permiso exacto y retiro permanecen pendientes. |
| `VISO-ROUTE-014` | `/commercial-collections`            | `src/app/commercial-collections/page.tsx`            | `ESTATICA` | `VISTA`           | `COMERCIAL_COLECCIONES`        | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Existencia y guard observados; proceso, acciones, menú, permiso exacto y retiro permanecen pendientes. |
| `VISO-ROUTE-015` | `/commercial-collections/overview`   | `src/app/commercial-collections/overview/page.tsx`   | `ESTATICA` | `VISTA`           | `COMERCIAL_COLECCIONES`        | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Existencia y guard observados; proceso, acciones, menú, permiso exacto y retiro permanecen pendientes. |
| `VISO-ROUTE-016` | `/commercial-menu`                   | `src/app/commercial-menu/page.tsx`                   | `ESTATICA` | `VISTA`           | `COMERCIAL_MENU`               | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Existencia y guard observados; proceso, acciones, menú, permiso exacto y retiro permanecen pendientes. |
| `VISO-ROUTE-017` | `/content-blocks`                    | `src/app/content-blocks/page.tsx`                    | `ESTATICA` | `VISTA`           | `CONTENIDO_PASS`               | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Existencia y guard observados; proceso, acciones, menú, permiso exacto y retiro permanecen pendientes. |
| `VISO-ROUTE-018` | `/content-blocks/[id]`               | `src/app/content-blocks/[id]/page.tsx`               | `DINAMICA` | `VISTA`           | `CONTENIDO_PASS`               | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | El segmento dinámico conserva un único patrón contractual; no se expande por instancia de datos.       |
| `VISO-ROUTE-019` | `/delivery-rates`                    | `src/app/delivery-rates/page.tsx`                    | `ESTATICA` | `VISTA`           | `TARIFAS_ENTREGA`              | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Existencia y guard observados; proceso, acciones, menú, permiso exacto y retiro permanecen pendientes. |
| `VISO-ROUTE-020` | `/menu`                              | `src/app/menu/page.tsx`                              | `ESTATICA` | `VISTA`           | `MENU_LEGACY_O_COMPLEMENTARIO` | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Existencia y guard observados; proceso, acciones, menú, permiso exacto y retiro permanecen pendientes. |
| `VISO-ROUTE-021` | `/menu/new`                          | `src/app/menu/new/page.tsx`                          | `ESTATICA` | `VISTA`           | `MENU_LEGACY_O_COMPLEMENTARIO` | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Formulario de alta separado; la acción de guardar exige protección de servidor propia.                 |
| `VISO-ROUTE-022` | `/menu/[id]`                         | `src/app/menu/[id]/page.tsx`                         | `DINAMICA` | `VISTA`           | `MENU_LEGACY_O_COMPLEMENTARIO` | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | El segmento dinámico conserva un único patrón contractual; no se expande por instancia de datos.       |
| `VISO-ROUTE-023` | `/menu/[id]/personalizations/manage` | `src/app/menu/[id]/personalizations/manage/page.tsx` | `DINAMICA` | `VISTA`           | `MENU_LEGACY_O_COMPLEMENTARIO` | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | El segmento dinámico conserva un único patrón contractual; no se expande por instancia de datos.       |
| `VISO-ROUTE-024` | `/operations`                        | `src/app/operations/page.tsx`                        | `ESTATICA` | `VISTA`           | `OPERACION`                    | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Existencia y guard observados; proceso, acciones, menú, permiso exacto y retiro permanecen pendientes. |
| `VISO-ROUTE-025` | `/operations/checkin-points`         | `src/app/operations/checkin-points/page.tsx`         | `ESTATICA` | `VISTA`           | `OPERACION`                    | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Existencia y guard observados; proceso, acciones, menú, permiso exacto y retiro permanecen pendientes. |
| `VISO-ROUTE-026` | `/operations/employee-profiles`      | `src/app/operations/employee-profiles/page.tsx`      | `ESTATICA` | `VISTA`           | `OPERACION`                    | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Existencia y guard observados; proceso, acciones, menú, permiso exacto y retiro permanecen pendientes. |
| `VISO-ROUTE-027` | `/operations/preview`                | `src/app/operations/preview/page.tsx`                | `ESTATICA` | `VISTA`           | `OPERACION`                    | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Existencia y guard observados; proceso, acciones, menú, permiso exacto y retiro permanecen pendientes. |
| `VISO-ROUTE-028` | `/operations/site-roles`             | `src/app/operations/site-roles/page.tsx`             | `ESTATICA` | `VISTA`           | `OPERACION`                    | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Existencia y guard observados; proceso, acciones, menú, permiso exacto y retiro permanecen pendientes. |
| `VISO-ROUTE-029` | `/operations-map`                    | `src/app/operations-map/page.tsx`                    | `ESTATICA` | `VISTA`           | `MAPA_OPERATIVO`               | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Existencia y guard observados; proceso, acciones, menú, permiso exacto y retiro permanecen pendientes. |
| `VISO-ROUTE-030` | `/ops/audit`                         | `src/app/ops/audit/page.tsx`                         | `ESTATICA` | `VISTA`           | `AUDITORIA_OPERATIVA`          | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Existencia y guard observados; proceso, acciones, menú, permiso exacto y retiro permanecen pendientes. |
| `VISO-ROUTE-031` | `/pass-users`                        | `src/app/pass-users/page.tsx`                        | `ESTATICA` | `VISTA`           | `USUARIOS_PASS`                | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Existencia y guard observados; proceso, acciones, menú, permiso exacto y retiro permanecen pendientes. |
| `VISO-ROUTE-032` | `/pass-users/new`                    | `src/app/pass-users/new/page.tsx`                    | `ESTATICA` | `VISTA`           | `USUARIOS_PASS`                | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Formulario de alta separado; la acción de guardar exige protección de servidor propia.                 |
| `VISO-ROUTE-033` | `/pass-users/[id]`                   | `src/app/pass-users/[id]/page.tsx`                   | `DINAMICA` | `VISTA`           | `USUARIOS_PASS`                | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | El segmento dinámico conserva un único patrón contractual; no se expande por instancia de datos.       |
| `VISO-ROUTE-034` | `/products`                          | `src/app/products/page.tsx`                          | `ESTATICA` | `VISTA`           | `PRODUCTOS`                    | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Existencia y guard observados; proceso, acciones, menú, permiso exacto y retiro permanecen pendientes. |
| `VISO-ROUTE-035` | `/products/new`                      | `src/app/products/new/page.tsx`                      | `ESTATICA` | `VISTA`           | `PRODUCTOS`                    | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Formulario de alta separado; la acción de guardar exige protección de servidor propia.                 |
| `VISO-ROUTE-036` | `/products/[id]`                     | `src/app/products/[id]/page.tsx`                     | `DINAMICA` | `VISTA`           | `PRODUCTOS`                    | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | El segmento dinámico conserva un único patrón contractual; no se expande por instancia de datos.       |
| `VISO-ROUTE-037` | `/roles-permissions`                 | `src/app/roles-permissions/page.tsx`                 | `ESTATICA` | `VISTA`           | `ROLES_PERMISOS`               | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Existencia y guard observados; proceso, acciones, menú, permiso exacto y retiro permanecen pendientes. |
| `VISO-ROUTE-038` | `/sites`                             | `src/app/sites/page.tsx`                             | `ESTATICA` | `VISTA`           | `SEDES`                        | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Existencia y guard observados; proceso, acciones, menú, permiso exacto y retiro permanecen pendientes. |
| `VISO-ROUTE-039` | `/sites/[id]`                        | `src/app/sites/[id]/page.tsx`                        | `DINAMICA` | `VISTA`           | `SEDES`                        | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | El segmento dinámico conserva un único patrón contractual; no se expande por instancia de datos.       |
| `VISO-ROUTE-040` | `/sites/[id]/documentos`             | `src/app/sites/[id]/documentos/page.tsx`             | `DINAMICA` | `VISTA`           | `SEDES`                        | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | El segmento dinámico conserva un único patrón contractual; no se expande por instancia de datos.       |
| `VISO-ROUTE-041` | `/staff`                             | `src/app/staff/page.tsx`                             | `ESTATICA` | `VISTA`           | `PERSONAL`                     | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Existencia y guard observados; proceso, acciones, menú, permiso exacto y retiro permanecen pendientes. |
| `VISO-ROUTE-042` | `/staff/new`                         | `src/app/staff/new/page.tsx`                         | `ESTATICA` | `VISTA`           | `PERSONAL`                     | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Formulario de alta separado; la acción de guardar exige protección de servidor propia.                 |
| `VISO-ROUTE-043` | `/staff/[id]`                        | `src/app/staff/[id]/page.tsx`                        | `DINAMICA` | `VISTA`           | `PERSONAL`                     | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | El segmento dinámico conserva un único patrón contractual; no se expande por instancia de datos.       |
| `VISO-ROUTE-044` | `/staff/attendance`                  | `src/app/staff/attendance/page.tsx`                  | `ESTATICA` | `VISTA`           | `PERSONAL`                     | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Existencia y guard observados; proceso, acciones, menú, permiso exacto y retiro permanecen pendientes. |
| `VISO-ROUTE-045` | `/staff/calendar`                    | `src/app/staff/calendar/page.tsx`                    | `ESTATICA` | `VISTA`           | `PERSONAL`                     | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Existencia y guard observados; proceso, acciones, menú, permiso exacto y retiro permanecen pendientes. |
| `VISO-ROUTE-046` | `/staff/schedule`                    | `src/app/staff/schedule/page.tsx`                    | `ESTATICA` | `VISTA`           | `PERSONAL`                     | `requireStaffScheduleAccess`; permite acceso VISO o permiso de consulta de horarios según contexto.             | Existencia y guard observados; proceso, acciones, menú, permiso exacto y retiro permanecen pendientes. |
| `VISO-ROUTE-047` | `/staff/schedule/global`             | `src/app/staff/schedule/global/page.tsx`             | `ESTATICA` | `VISTA`           | `PERSONAL`                     | `requireStaffScheduleAccess`; permite acceso VISO o permiso de consulta de horarios según contexto.             | Existencia y guard observados; proceso, acciones, menú, permiso exacto y retiro permanecen pendientes. |
| `VISO-ROUTE-048` | `/staff/schedule/metrics`            | `src/app/staff/schedule/metrics/page.tsx`            | `ESTATICA` | `VISTA`           | `PERSONAL`                     | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Existencia y guard observados; proceso, acciones, menú, permiso exacto y retiro permanecen pendientes. |
| `VISO-ROUTE-049` | `/staff/schedule/settings`           | `src/app/staff/schedule/settings/page.tsx`           | `ESTATICA` | `VISTA`           | `PERSONAL`                     | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Existencia y guard observados; proceso, acciones, menú, permiso exacto y retiro permanecen pendientes. |
| `VISO-ROUTE-050` | `/staff/shared-devices/new`          | `src/app/staff/shared-devices/new/page.tsx`          | `ESTATICA` | `VISTA`           | `PERSONAL`                     | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Formulario de alta separado; la acción de guardar exige protección de servidor propia.                 |
| `VISO-ROUTE-051` | `/vacancies`                         | `src/app/vacancies/page.tsx`                         | `ESTATICA` | `VISTA`           | `VACANTES`                     | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Existencia y guard observados; proceso, acciones, menú, permiso exacto y retiro permanecen pendientes. |
| `VISO-ROUTE-052` | `/vacancies/new`                     | `src/app/vacancies/new/page.tsx`                     | `ESTATICA` | `VISTA`           | `VACANTES`                     | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Formulario de alta separado; la acción de guardar exige protección de servidor propia.                 |
| `VISO-ROUTE-053` | `/vacancies/[id]`                    | `src/app/vacancies/[id]/page.tsx`                    | `DINAMICA` | `VISTA`           | `VACANTES`                     | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | El segmento dinámico conserva un único patrón contractual; no se expande por instancia de datos.       |
| `VISO-ROUTE-054` | `/website-cms`                       | `src/app/website-cms/page.tsx`                       | `ESTATICA` | `VISTA`           | `WEBSITE_CMS`                  | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Existencia y guard observados; proceso, acciones, menú, permiso exacto y retiro permanecen pendientes. |
| `VISO-ROUTE-055` | `/website-cms/blocks/new`            | `src/app/website-cms/blocks/new/page.tsx`            | `ESTATICA` | `VISTA`           | `WEBSITE_CMS`                  | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Formulario de alta separado; la acción de guardar exige protección de servidor propia.                 |
| `VISO-ROUTE-056` | `/website-cms/blocks/[id]`           | `src/app/website-cms/blocks/[id]/page.tsx`           | `DINAMICA` | `VISTA`           | `WEBSITE_CMS`                  | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | El segmento dinámico conserva un único patrón contractual; no se expande por instancia de datos.       |
| `VISO-ROUTE-057` | `/website-cms/items/new`             | `src/app/website-cms/items/new/page.tsx`             | `ESTATICA` | `VISTA`           | `WEBSITE_CMS`                  | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Formulario de alta separado; la acción de guardar exige protección de servidor propia.                 |
| `VISO-ROUTE-058` | `/website-cms/items/[id]`            | `src/app/website-cms/items/[id]/page.tsx`            | `DINAMICA` | `VISTA`           | `WEBSITE_CMS`                  | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | El segmento dinámico conserva un único patrón contractual; no se expande por instancia de datos.       |
| `VISO-ROUTE-059` | `/website-cms/venues`                | `src/app/website-cms/venues/page.tsx`                | `ESTATICA` | `VISTA`           | `WEBSITE_CMS`                  | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | Existencia y guard observados; proceso, acciones, menú, permiso exacto y retiro permanecen pendientes. |
| `VISO-ROUTE-060` | `/website-cms/venues/[slug]`         | `src/app/website-cms/venues/[slug]/page.tsx`         | `DINAMICA` | `VISTA`           | `WEBSITE_CMS`                  | `requireAppAccess` para `viso`, sesión operativa, sede/área, dispositivo compartido y simulación cuando aplica. | El segmento dinámico conserva un único patrón contractual; no se expande por instancia de datos.       |

#### 7. Route handlers separados

| ID                 | Método | Patrón técnico                              | Archivo fuente                                              | Alcance observado                                                   |
| ------------------ | ------ | ------------------------------------------- | ----------------------------------------------------------- | ------------------------------------------------------------------- |
| `VISO-HANDLER-001` | `GET`  | `/api/health`                               | `src/app/api/health/route.ts`                               | Diagnóstico de variables de entorno; no revela valores.             |
| `VISO-HANDLER-002` | `GET`  | `/api/viso/attendance-report`               | `src/app/api/viso/attendance-report/route.ts`               | Generación o consulta técnica del reporte de asistencia.            |
| `VISO-HANDLER-003` | `POST` | `/api/viso/menu/reorder`                    | `src/app/api/viso/menu/reorder/route.ts`                    | Reordena ítems comerciales; ejecuta protección de aplicación.       |
| `VISO-HANDLER-004` | `POST` | `/api/viso/staff-schedule-hidden-employees` | `src/app/api/viso/staff-schedule-hidden-employees/route.ts` | Administra exclusiones de trabajadores en horario global.           |
| `VISO-HANDLER-005` | `POST` | `/api/viso/staff-schedule-shifts`           | `src/app/api/viso/staff-schedule-shifts/route.ts`           | Administra turnos con comprobación de acceso o permiso de horarios. |
| `VISO-HANDLER-006` | `POST` | `/api/viso/upload-commercial-menu-image`    | `src/app/api/viso/upload-commercial-menu-image/route.ts`    | Carga imágenes del menú comercial.                                  |
| `VISO-HANDLER-007` | `POST` | `/api/viso/upload-logo`                     | `src/app/api/viso/upload-logo/route.ts`                     | Carga logos administrativos.                                        |
| `VISO-HANDLER-008` | `POST` | `/api/viso/upload-product-image`            | `src/app/api/viso/upload-product-image/route.ts`            | Carga imágenes de producto.                                         |
| `VISO-HANDLER-009` | `POST` | `/api/viso/upload-website-media`            | `src/app/api/viso/upload-website-media/route.ts`            | Carga medios del website CMS.                                       |
| `VISO-HANDLER-010` | `POST` | `/menu/[id]/personalizaciones`              | `src/app/menu/[id]/personalizaciones/route.ts`              | Gestiona personalizaciones de un ítem comercial; no es página.      |

Estos diez patrones no son pantallas. El middleware excluye `/api`, por lo que cada handler deberá demostrar protección propia. La auditoría exhaustiva de autorización de servidor corresponde a `AUTH-UI-043` y a las tareas `AUTH-SRV-*` aplicables.

#### 8. Topología de acceso observada

##### 8.1 Middleware

El matcher protege las páginas salvo `login`, `/api` y recursos estáticos. Sin cookies, configuración o usuario válido redirige a `/login` y conserva `returnTo`.

##### 8.2 Guard compartido

`requireAppAccess` resuelve usuario, sesión operativa, acceso a VISO, sede, área, dispositivo compartido, permiso opcional y simulación de rol. Su existencia no prueba que cada ruta o acción tenga el permiso atómico definitivo.

##### 8.3 Guard especializado de horarios

`/staff/schedule` y `/staff/schedule/global` usan `requireStaffScheduleAccess`. Estas rutas permanecen dentro del inventario protegido aunque no invoquen directamente el helper general.

##### 8.4 Navegación runtime

`package.json` no expone un sincronizador local de navegación. Por tanto:

```text
RUNTIME_REGISTRY_STATUS = NOT_EVALUATED
MENU_STATUS = NOT_EVALUATED
```

La reconciliación con `app_screen_registry`, `app_navigation_items` y SHELL queda reservada para `AUTH-UI-045`.

#### 9. Solapamientos preservados sin decisión prematura

| Grupo           | Superficies observadas                                                             | Tratamiento                                                        |
| --------------- | ---------------------------------------------------------------------------------- | ------------------------------------------------------------------ |
| Menú y comercio | `/menu*`, `/commercial-menu`, `/commercial-categories`, `/commercial-collections*` | Conservar; clasificar en `AUTH-UI-026` a `AUTH-UI-028`.            |
| Contenido       | `/content-blocks*`, `/website-cms/blocks*`                                         | Conservar; verificar consumidores antes de cualquier retiro.       |
| Operación       | `/operations`, `/operations-map`, `/operations/*`, `/ops/audit`                    | Conservar; asignar proceso, actor y propósito antes de consolidar. |

#### 10. Carryover obligatorio

| ID                       | Hallazgo                                                             | Tratamiento inmediato                                                            | Propietario y momento de resolución                                                    |
| ------------------------ | -------------------------------------------------------------------- | -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| `VISO-ROUTE-FINDING-001` | VISO concentra 60 rutas en dominios administrativos distintos.       | Preservar identidad individual y no reducir el inventario por agrupación visual. | `AUTH-UI-011` a `AUTH-UI-025`, después de completar inventarios.                       |
| `VISO-ROUTE-FINDING-002` | Existen tres grupos de solapamiento potencial.                       | No declarar duplicidad, legacy ni retiro.                                        | `AUTH-UI-026` a `AUTH-UI-028`, después de asignar proceso y consumidores.              |
| `VISO-ROUTE-FINDING-003` | Diez handlers quedan fuera del matcher de páginas.                   | Mantener registro técnico y exigir protección propia.                            | `AUTH-UI-043` y `AUTH-SRV-*`, antes de implementación o certificación.                 |
| `VISO-ROUTE-FINDING-004` | No se observó sincronizador local de navegación.                     | No inferir ausencia de registros runtime.                                        | `AUTH-UI-045`, antes de aprobar navegación unificada.                                  |
| `VISO-ROUTE-FINDING-005` | La reorganización documental de `vento-shell` aún no está publicada. | Mantener esta entrega sobre la continuidad local aprobada de `AUTH-UI-004`.      | Reconciliación por Codex al terminar la partición; antes del siguiente build canónico. |

No queda un hallazgo detectado como pendiente narrativo sin tarea propietaria.

#### 11. Requisitos de prueba derivados

Se incorporan al registro canónico completo:

```text
TREQ-VISO-004 a TREQ-VISO-023
```

| ID              | Regla protegida                                                                                                                                                                                                                  |
| --------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `TREQ-VISO-004` | El inventario de VISO deberá detectar exactamente 60 archivos de página en el snapshot aprobado, aunque una ruta no aparezca en menú o registro runtime.                                                                         |
| `TREQ-VISO-005` | Cada ruta VISO deberá conservar un identificador estable VISO-ROUTE-001 a VISO-ROUTE-060, un patrón URL único y un archivo fuente único.                                                                                         |
| `TREQ-VISO-006` | El inventario deberá conservar 47 rutas estáticas y 13 dinámicas; los parámetros de consulta no crearán rutas adicionales.                                                                                                       |
| `TREQ-VISO-007` | La raíz `/` deberá permanecer incluida como página aunque un sincronizador futuro la omita o la navegación no la muestre.                                                                                                        |
| `TREQ-VISO-008` | Páginas, route handlers, layouts, boundaries, componentes, server actions y helpers deberán clasificarse por separado.                                                                                                           |
| `TREQ-VISO-009` | La ruta `/login` deberá seguir siendo un puente hacia SHELL, normalizar `returnTo` y no presentarse como autenticación local independiente.                                                                                      |
| `TREQ-VISO-010` | La ruta `/no-access` deberá rechazar destinos externos, mostrar solo contexto permitido y nunca conceder o reparar autoridad.                                                                                                    |
| `TREQ-VISO-011` | El middleware deberá proteger todas las páginas salvo exclusiones explícitas y redirigir a `/login` cuando falten cookies, configuración o usuario válido.                                                                       |
| `TREQ-VISO-012` | La línea base deberá reconciliar exactamente 58 rutas protegidas y dos superficies públicas controladas: `/login` y `/no-access`.                                                                                                |
| `TREQ-VISO-013` | `/staff/schedule` y `/staff/schedule/global` deberán conservar su guard especializado y no quedar fuera del conteo por no invocar directamente `requireAppAccess`.                                                               |
| `TREQ-VISO-014` | Toda ruta protegida deberá resolver usuario, sesión operativa, acceso a VISO, contexto territorial, dispositivo compartido y simulación según el guard aplicable.                                                                |
| `TREQ-VISO-015` | Cualquier alta, retiro, movimiento, cambio de patrón, guard o handler frente al commit aprobado deberá producir un delta explícito antes de clasificación o retiro.                                                              |
| `TREQ-VISO-016` | Los diez route handlers observados deberán permanecer separados de las 60 páginas y conservar identificador técnico propio.                                                                                                      |
| `TREQ-VISO-017` | Como `/api` queda fuera del matcher, cada handler deberá demostrar autenticación, autorización, contexto y validación de entrada propios antes de cualquier efecto.                                                              |
| `TREQ-VISO-018` | `GET /api/health` deberá exponer únicamente presencia o ausencia de configuración y nunca secretos, valores ni metadatos sensibles.                                                                                              |
| `TREQ-VISO-019` | `POST /api/viso/menu/reorder` deberá comprobar acceso, pertenencia a colección y categoría, límites de movimiento y persistencia consistente del orden.                                                                          |
| `TREQ-VISO-020` | Los handlers de carga deberán validar sesión, permiso, tipo, tamaño, destino, nombre y respuesta antes de almacenar o publicar medios.                                                                                           |
| `TREQ-VISO-021` | Los 13 patrones dinámicos deberán conservar sus segmentos `[id]` o `[slug]` y no expandirse en una fila por entidad existente.                                                                                                   |
| `TREQ-VISO-022` | Los solapamientos entre `/menu*` y superficies comerciales, entre bloques de contenido y website CMS, y entre rutas de operación deberán conservarse sin declararse duplicados o legacy antes de AUTH-UI-026 a AUTH-UI-028.      |
| `TREQ-VISO-023` | Las 60 rutas fuente deberán reconciliarse posteriormente contra `app_screen_registry`, `app_navigation_items` y menú SHELL mediante AUTH-UI-045; la ausencia de sincronizador local no demostrará ausencia de registros runtime. |

#### 12. Huellas de la línea base

```text
ROUTE_REGISTRY_SHA256 = df5eee3eb0bc21b760853b252f3c8015c9a383a5c46f79adfaa4398f5457a0d6
HANDLER_REGISTRY_SHA256 = 683d24634fdbc0630d0bb5fea2f3b37203f7cd688f01f3cd94dfcb59013096af
COMBINED_INVENTORY_SHA256 = 7577755c1f536811fb3957214cb50acec819a720d700784bf3dc71fde20615eb
```

#### 13. Criterios de aceptación

- [x] El inventario contiene exactamente 60 rutas de página únicas.
- [x] Los IDs `VISO-ROUTE-001` a `VISO-ROUTE-060` son consecutivos.
- [x] Existen 47 rutas estáticas y 13 dinámicas.
- [x] Cada patrón tiene un único archivo fuente.
- [x] `/login` y `/no-access` están separados de las vistas protegidas.
- [x] Las 58 rutas protegidas están reconciliadas por guard observado.
- [x] Los diez handlers están separados del inventario de pantallas.
- [x] Los solapamientos conservan tarea y momento de resolución.
- [x] Se generan `TREQ-VISO-004` a `TREQ-VISO-023` sin modificar filas históricas.
- [x] No se implementa código, navegación runtime, migración, Supabase ni despliegue.

#### 14. Continuidad

```text
AUTH-UI-005 — APROBADA
        ↓
AUTH-UI-006 — Inventariar todas las rutas de NUMERA
```


### ✅ AUTH-UI-006 — Inventariar todas las rutas de NUMERA

**Estado:** APROBADA
**Fecha de aprobación documental:** 2026-07-28
**Bloque propietario:** BLOQUE I — Navegación, pantallas y autorización de vistas
**Tipo de tarea:** inventario técnico-documental; sin cambios de código, Supabase, despliegue ni navegación runtime

#### 1. Objetivo

Inventariar de forma exhaustiva y reproducible las rutas reales expuestas por NUMERA en el snapshot inspeccionado, distinguiendo páginas económicas, superficies públicas controladas, acciones de servidor, permisos observados, navegación declarativa y route handlers que no constituyen pantallas.

La tarea establece una línea base de existencia y topología. No rediseña NUMERA, no asigna todavía `process_id` o `process_step`, no aprueba permisos definitivos, no acredita completitud financiera o contable y no declara ninguna ruta apta para retiro, piloto, cutover o producción.

#### 2. Fuente inspeccionada

| Campo                     | Valor                                                                                                                         |
| ------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| Repositorio operativo     | `devVentoGroup/vento-numera`                                                                                                  |
| Rama                      | `main`                                                                                                                        |
| Commit                    | `1b48a5da425d92e19ed89cf175b1dccc4cd960e1`                                                                                    |
| Framework observado       | Next.js App Router                                                                                                            |
| Raíz de páginas           | `src/app`                                                                                                                     |
| Evidencia complementaria  | `middleware.ts`, `src/lib/auth/guard.ts`, `scripts/sync-navigation.mjs`, `package.json` y server actions embebidas en páginas |
| Estado del snapshot       | `SOURCE_INVENTORY_APPROVED`                                                                                                   |
| Base documental utilizada | `AUTH-UI-005` y `04A_TREQ_AUTH-UI-005_2026-07-28_R01.md` aprobados localmente                                                 |

#### 3. Frontera obligatoria

```text
RUTA EN CÓDIGO
≠ FILA EN app_screen_registry
≠ ELEMENTO EN app_navigation_items
≠ PROCESS_ID
≠ PERMISO DEFINITIVO
≠ ACCIÓN AUTORIZADA
≠ PROCESO FINANCIERO COMPLETO
```

| Decisión pendiente                                                | Tarea propietaria                     |
| ----------------------------------------------------------------- | ------------------------------------- |
| Asignar proceso y paso                                            | `AUTH-UI-011` y `AUTH-UI-012`         |
| Definir propietaria y consumo                                     | `AUTH-UI-013` y `AUTH-UI-014`         |
| Clasificar intención, actores, dispositivo, frecuencia y acciones | `AUTH-UI-015` a `AUTH-UI-025`         |
| Resolver duplicidad, legacy, retiro y vistas técnicas             | `AUTH-UI-026` a `AUTH-UI-029`         |
| Aprobar permisos, contexto y protección de servidor               | `AUTH-UI-030` a `AUTH-UI-045`         |
| Rediseñar experiencia financiera                                  | subbloque `NUMERA-UX` correspondiente |

#### 4. Contrato de inventario

1. Cada archivo `page.tsx`, `page.ts`, `page.jsx` o `page.js` se registra como un patrón de ruta.
2. Los query parameters no crean rutas adicionales.
3. Layouts, componentes, server actions, helpers, middleware y scripts no se cuentan como rutas.
4. Los route handlers se registran aparte y nunca como pantallas.
5. `/login` y `/no-access` se conservan como superficies públicas controladas.
6. La existencia de un permiso en código se registra como evidencia observada, no como aprobación de la matriz definitiva.
7. La existencia de una fila sincronizada no acredita visibilidad efectiva para ningún actor.
8. Todo cambio de árbol, patrón, guard, permiso observado o sincronización invalida la huella afectada.

#### 5. Resumen reconciliado

| Métrica                                |            Resultado |
| -------------------------------------- | -------------------: |
| Rutas de página                        |                **7** |
| Patrones estáticos                     |                **7** |
| Patrones dinámicos                     |                **0** |
| Vistas de negocio protegidas           |                **5** |
| Puentes de redirección                 |     **1** — `/login` |
| Estados de denegación                  | **1** — `/no-access` |
| Superficies públicas controladas       |                **2** |
| Route handlers técnicos                |                **0** |
| Patrones App Router totales            |                **7** |
| Rutas declaradas por `sync-navigation` |                **4** |
| Rutas no sincronizadas                 |                **3** |
| Candidatas explícitas de menú          |                **4** |
| Patrones URL duplicados                |                **0** |
| Archivos fuente duplicados             |                **0** |

#### 6. `NUMERA-ROUTE-INVENTORY-001`

| ID                 | Patrón           | Archivo fuente                   | Tipo       | Comportamiento                  | Superficie observada                                | Evidencia de acceso observada                                                   | Navegación runtime | Límite documental                                        |
| ------------------ | ---------------- | -------------------------------- | ---------- | ------------------------------- | --------------------------------------------------- | ------------------------------------------------------------------------------- | ------------------ | -------------------------------------------------------- |
| `NUMERA-ROUTE-001` | `/`              | `src/app/page.tsx`               | `ESTATICA` | `RENDER_VIEW`                   | Panel económico inicial y acceso a cuatro módulos   | requireAppAccess(appId=numera); sin permissionCode específico                   | `NO_SINCRONIZADA`  | No inferir permiso definitivo ni condición de menú       |
| `NUMERA-ROUTE-002` | `/login`         | `src/app/login/page.tsx`         | `ESTATICA` | `REDIRECT_BRIDGE`               | Puente cliente hacia autenticación central de SHELL | Pública controlada; excluida del middleware                                     | `NO_SINCRONIZADA`  | No es autenticación local ni vista de negocio            |
| `NUMERA-ROUTE-003` | `/no-access`     | `src/app/no-access/page.tsx`     | `ESTATICA` | `RENDER_DENIAL_STATE`           | Estado de acceso denegado                           | Pública controlada; excluida del middleware                                     | `NO_SINCRONIZADA`  | No concede ni repara autoridad                           |
| `NUMERA-ROUTE-004` | `/cost-centers`  | `src/app/cost-centers/page.tsx`  | `ESTATICA` | `RENDER_VIEW_AND_SERVER_ACTION` | Metas económicas por centro de costo                | numera.access + numera.cost_centers.view; acción con numera.cost_centers.manage | `MENU_CANDIDATE`   | Permisos observados; matriz definitiva pendiente         |
| `NUMERA-ROUTE-005` | `/expenses`      | `src/app/expenses/page.tsx`      | `ESTATICA` | `RENDER_VIEW_AND_SERVER_ACTION` | Lectura y captura de gastos                         | numera.access + numera.expenses.view; acción con numera.expenses.manage         | `MENU_CANDIDATE`   | Permisos observados; matriz definitiva pendiente         |
| `NUMERA-ROUTE-006` | `/break-even`    | `src/app/break-even/page.tsx`    | `ESTATICA` | `RENDER_VIEW`                   | Punto de equilibrio por centro                      | numera.access + numera.break_even.view                                          | `MENU_CANDIDATE`   | Lectura observada; completitud financiera no acreditada  |
| `NUMERA-ROUTE-007` | `/profitability` | `src/app/profitability/page.tsx` | `ESTATICA` | `RENDER_VIEW`                   | Rentabilidad inicial por centro                     | numera.access + numera.profitability.view                                       | `MENU_CANDIDATE`   | Lectura observada; no equivale a ciclo contable completo |

#### 7. Navegación declarativa observada

| Ruta             | `item_key`      | Grupo        | Permiso declarado           | Destinos sincronizados                         |
| ---------------- | --------------- | ------------ | --------------------------- | ---------------------------------------------- |
| `/cost-centers`  | `cost_centers`  | `estructura` | `numera.cost_centers.view`  | `app_screen_registry` + `app_navigation_items` |
| `/expenses`      | `expenses`      | `gastos`     | `numera.expenses.view`      | `app_screen_registry` + `app_navigation_items` |
| `/break-even`    | `break_even`    | `analisis`   | `numera.break_even.view`    | `app_screen_registry` + `app_navigation_items` |
| `/profitability` | `profitability` | `analisis`   | `numera.profitability.view` | `app_screen_registry` + `app_navigation_items` |

`scripts/sync-navigation.mjs` utiliza service role cuando existe, ejecuta `upsert_app_screen_registry`, clasifica las cuatro rutas como `menu`, y hace `upsert` en `app_navigation_items`. El script está vinculado a `prebuild`.

Por tanto:

```text
7 RUTAS DE PÁGINA
≠ 4 RUTAS SINCRONIZADAS
≠ VISIBILIDAD EFECTIVA PARA UN ACTOR
```

La raíz `/`, `/login` y `/no-access` no forman parte del arreglo declarativo de sincronización. La reconciliación con SHELL y el registro runtime queda reservada para `AUTH-UI-045`.

#### 8. Evidencia de acceso observada

- El middleware excluye `login`, `no-access`, `api` y recursos técnicos; las demás páginas requieren sesión válida.
- `requireAppAccess` resuelve usuario, sesión operativa, sede, área, dispositivo compartido, acceso `numera.access`, permiso específico opcional y simulación de rol.
- `/cost-centers` separa `cost_centers.view` de la acción `cost_centers.manage`.
- `/expenses` separa `expenses.view` de la acción `expenses.manage`.
- `/break-even` exige `break_even.view`.
- `/profitability` exige `profitability.view`.
- La raíz exige acceso general a NUMERA, pero no declara un permiso de lectura específico.

Los permisos anteriores son evidencia del snapshot. Su aprobación definitiva permanece reservada para `AUTH-UI-030` a `AUTH-UI-045`.

#### 9. Route handlers técnicos

No se observaron archivos `route.ts`, `route.tsx`, `route.js` o `route.jsx` bajo `src/app` en el snapshot aprobado.

```text
TECHNICAL_ROUTE_HANDLERS = 0
```

Esto no permite asumir que las server actions embebidas carecen de protección. Las dos acciones mutantes observadas deberán conservar validación en servidor.

#### 10. Hallazgos y carryover obligatorio

| ID                         | Hallazgo                                                                                          | Tratamiento inmediato                                                                | Propietario y momento de resolución                                       |
| -------------------------- | ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------ | ------------------------------------------------------------------------- |
| `NUMERA-ROUTE-FINDING-001` | Siete rutas físicas se reducen a cuatro entradas declarativas de navegación.                      | Preservar ambos conteos y no inferir error por diferencia.                           | `AUTH-UI-045`, antes de aprobar navegación unificada.                     |
| `NUMERA-ROUTE-FINDING-002` | La raíz `/` no tiene permiso de lectura específico y no es sincronizada.                          | No ampliar ni restringir autoridad en esta tarea.                                    | `AUTH-UI-030` y `AUTH-UI-045`, durante la matriz de lectura y navegación. |
| `NUMERA-ROUTE-FINDING-003` | `sync-navigation` se ejecuta en `prebuild` y puede escribir registros cuando existe service role. | Exigir idempotencia, trazabilidad y control de drift.                                | `AUTH-UI-045` y `SHELL-CI-017`, antes del paquete de implementación.      |
| `NUMERA-ROUTE-FINDING-004` | La raíz pasa `returnTo=/login` al guard en lugar de su ruta de origen.                            | Verificar que el flujo SSO no produzca retorno incorrecto o bucle; no corregir aquí. | `AUTH-UI-041` y `AUTH-UI-048`, antes de certificar acceso directo.        |
| `NUMERA-ROUTE-FINDING-005` | La reorganización documental de `vento-shell` aún no está publicada.                              | Mantener esta entrega sobre la continuidad local aprobada de `AUTH-UI-005`.          | Reconciliación por Codex antes del siguiente build canónico.              |

No queda un hallazgo detectado como pendiente narrativo sin tarea propietaria.

#### 11. Requisitos de prueba derivados

Se incorporan al registro canónico completo:

```text
TREQ-NUMERA-005 a TREQ-NUMERA-024
```

| ID                | Regla protegida                                                                                                                                                                                                                                  |
| ----------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `TREQ-NUMERA-005` | El inventario de NUMERA deberá detectar exactamente siete archivos de página activos en el snapshot aprobado, aunque una ruta no aparezca en navegación runtime.                                                                                 |
| `TREQ-NUMERA-006` | Cada ruta NUMERA deberá conservar un identificador estable NUMERA-ROUTE-001 a NUMERA-ROUTE-007, un patrón URL único y un archivo fuente único.                                                                                                   |
| `TREQ-NUMERA-007` | El snapshot aprobado deberá conservar siete rutas estáticas y cero patrones dinámicos; los query parameters no crearán rutas adicionales.                                                                                                        |
| `TREQ-NUMERA-008` | La raíz / deberá permanecer incluida como página real aunque sync-navigation no la registre ni la publique como elemento de menú.                                                                                                                |
| `TREQ-NUMERA-009` | Páginas, route handlers, layouts, boundaries, componentes, server actions y scripts de sincronización deberán clasificarse por separado; el snapshot actual deberá conservar cero route handlers App Router.                                     |
| `TREQ-NUMERA-010` | La ruta /login deberá seguir siendo un puente hacia SHELL, normalizar returnTo y no presentarse como autenticación local independiente.                                                                                                          |
| `TREQ-NUMERA-011` | La ruta /no-access deberá aceptar únicamente destinos locales, mostrar contexto permitido y nunca conceder, simular ni reparar autoridad.                                                                                                        |
| `TREQ-NUMERA-012` | El middleware deberá proteger todas las páginas salvo login, no-access, API y recursos técnicos excluidos, y deberá redirigir a login cuando falten cookies, configuración o usuario válido.                                                     |
| `TREQ-NUMERA-013` | La línea base deberá reconciliar exactamente cinco rutas protegidas y dos superficies públicas controladas: /login y /no-access.                                                                                                                 |
| `TREQ-NUMERA-014` | La raíz / deberá exigir numera.access y su ausencia de permissionCode específico no deberá interpretarse como permiso definitivo de lectura para todas sus métricas.                                                                             |
| `TREQ-NUMERA-015` | La ruta /cost-centers deberá exigir numera.cost_centers.view para lectura y conservar separada la capacidad de administración.                                                                                                                   |
| `TREQ-NUMERA-016` | La acción de actualizar presupuesto en /cost-centers deberá revalidar numera.cost_centers.manage en servidor antes de persistir o revalidar vistas.                                                                                              |
| `TREQ-NUMERA-017` | La ruta /expenses deberá exigir numera.expenses.view para lectura y conservar separada la capacidad de registrar gastos.                                                                                                                         |
| `TREQ-NUMERA-018` | La acción de crear gastos deberá revalidar numera.expenses.manage en servidor, validar los campos económicos y persistir moneda y origen explícitos.                                                                                             |
| `TREQ-NUMERA-019` | La ruta /break-even deberá exigir numera.break_even.view y no presentar ausencia de margen o cálculo como valor económico confirmado.                                                                                                            |
| `TREQ-NUMERA-020` | La ruta /profitability deberá exigir numera.profitability.view y conservar separados ingreso esperado, gasto real, presupuesto y variación.                                                                                                      |
| `TREQ-NUMERA-021` | sync-navigation deberá declarar exactamente cuatro rutas de negocio: cost-centers, expenses, break-even y profitability, sin convertir la raíz ni las superficies de acceso en candidatos de menú.                                               |
| `TREQ-NUMERA-022` | Cada ruta sincronizada deberá conservar item_key, grupo, orden, permiso requerido, fuente y hash, y deberá reconciliar app_screen_registry con app_navigation_items de forma idempotente.                                                        |
| `TREQ-NUMERA-023` | La existencia de una ruta, una fila de registro o un elemento de menú no deberá implicar por sí sola process_id, actor, dispositivo, permiso definitivo, completitud ni autorización de acción.                                                  |
| `TREQ-NUMERA-024` | Cualquier alta, retiro, movimiento, cambio de patrón, guard, permiso observado, sincronización o handler frente al commit 1b48a5da425d92e19ed89cf175b1dccc4cd960e1 deberá producir un delta explícito antes de clasificación, rediseño o retiro. |

#### 12. Huellas de la línea base

```text
ROUTE_REGISTRY_SHA256 = 464ed4dd2720ecf55ebd39ab408deb2251eaaad6f237b38218a1ca733d317d89
NAVIGATION_REGISTRY_SHA256 = 3734d1ecb25cbe5edf66c1edadf82dc013dc60d3dfa36f161ef5a41a4ffa811e
HANDLER_REGISTRY_SHA256 = 4f53cda18c2baa0c0354bb5f9a3ecbe5ed12ab4d8e11ba873c2f11161202b945
COMBINED_INVENTORY_SHA256 = ee7c742c5a5f6801a2c15ad3209f7c63c2f4416de2f869c12bc055c7d1f9e037
```

#### 13. Criterios de aceptación

- [x] El inventario contiene exactamente siete rutas de página únicas.
- [x] Los IDs `NUMERA-ROUTE-001` a `NUMERA-ROUTE-007` son consecutivos.
- [x] Las siete rutas son estáticas y no existen patrones dinámicos.
- [x] Cinco rutas protegidas y dos superficies públicas controladas están diferenciadas.
- [x] Cuatro candidatas declarativas de menú están separadas de las siete páginas.
- [x] Se registran cero route handlers sin confundirlos con server actions.
- [x] Los permisos observados no se presentan como matriz definitiva.
- [x] Todos los hallazgos tienen tarea propietaria y momento de resolución.
- [x] Se incorporan `TREQ-NUMERA-005` a `TREQ-NUMERA-024` al registro completo.

#### 14. Continuidad

```text
AUTH-UI-006 — APROBADA
        ↓
AUTH-UI-007 — Inventariar todas las pantallas de ANIMA
```

APROBADA


### [ ] AUTH-UI-007 — Inventariar todas las pantallas de ANIMA
### [ ] AUTH-UI-008 — Inventariar todas las superficies de SHELL
### [ ] AUTH-UI-009 — Inventariar superficies laborales relacionadas con PASS
### [ ] AUTH-UI-010 — Auditar rutas y superficies actuales de AURA
