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


### ✅ AUTH-UI-007 — Inventariar todas las pantallas de ANIMA

**Estado:** APROBADA
**Fecha de aprobación documental:** 2026-07-28
**Bloque propietario:** BLOQUE I — Navegación, pantallas y autorización de vistas
**Tipo de tarea:** inventario técnico-documental de aplicación móvil y superficies auxiliares; sin cambios de código, Supabase, despliegue ni navegación runtime

#### 1. Objetivo

Inventariar de forma exhaustiva, reproducible y sin reducir silenciosamente el alcance todas las pantallas activas de ANIMA en el snapshot inspeccionado, distinguiendo rutas móviles de Expo Router, layouts, pestañas, superficies interactivas internas, estados globales y superficies web auxiliares que viven en el mismo repositorio pero no forman parte de la aplicación móvil.

La tarea fija una línea base de existencia y topología. No rediseña ANIMA, no asigna todavía `process_id` o `process_step`, no aprueba permisos definitivos, no acredita protección de servidor, no modifica navegación runtime y no declara ninguna pantalla apta para retiro, piloto, cutover o producción.

#### 2. Fuente inspeccionada

| Campo                     | Valor                                                                                                           |
| ------------------------- | --------------------------------------------------------------------------------------------------------------- |
| Repositorio operativo     | `devVentoGroup/vento-anima`                                                                                     |
| Rama                      | `main`                                                                                                          |
| Commit                    | `50b77742cc0ae85f873d42152108a50acc9d6964`                                                                      |
| Aplicación                | ANIMA — Control de Asistencia                                                                                   |
| Framework observado       | Expo 54, React Native 0.81.5 y Expo Router 6                                                                    |
| Raíz de rutas móviles     | `app/`                                                                                                          |
| Plataformas declaradas    | `ios` y `android`                                                                                               |
| Soporte de tablet iOS     | `false`                                                                                                         |
| Evidencia complementaria  | `app.config.js`, `package.json`, layouts, componentes de pantalla, hooks de navegación y `web-auth/vercel.json` |
| Estado del snapshot       | `SOURCE_INVENTORY_APPROVED`                                                                                     |
| Base documental utilizada | `AUTH-UI-006` y registro `04A` con 3.398 requisitos y última tarea `AUTH-UI-006`                                |

#### 3. Frontera obligatoria

```text
PANTALLA MÓVIL EN CÓDIGO
≠ LAYOUT
≠ PESTAÑA
≠ MODAL O FLUJO EMBEBIDO
≠ SUPERFICIE WEB AUXILIAR
≠ FILA EN app_screen_registry
≠ ELEMENTO EN app_navigation_items
≠ PROCESS_ID
≠ PERMISO DEFINITIVO
≠ ACCIÓN AUTORIZADA
≠ DISPONIBILIDAD PRODUCTIVA
```

| Decisión pendiente                                                        | Tarea propietaria                    |
| ------------------------------------------------------------------------- | ------------------------------------ |
| Asignar proceso y paso                                                    | `AUTH-UI-011` y `AUTH-UI-012`        |
| Definir propietaria y consumidores                                        | `AUTH-UI-013` y `AUTH-UI-014`        |
| Clasificar intención, actores, dispositivo, frecuencia y acciones         | `AUTH-UI-015` a `AUTH-UI-025`        |
| Resolver solapamientos, legacy, retiro y superficies técnicas             | `AUTH-UI-026` a `AUTH-UI-029`        |
| Aprobar lectura, mutación, contexto, URL directa y protección de servidor | `AUTH-UI-030` a `AUTH-UI-044`        |
| Reconciliar registro y navegación unificada                               | `AUTH-UI-045`                        |
| Rediseñar experiencia de ANIMA                                            | subbloque `ANIMA-UX` correspondiente |

#### 4. Contrato de inventario

1. Cada archivo de ruta activo bajo `app/` distinto de `_layout.tsx` se registra como una pantalla móvil.
2. Los grupos `(auth)` y `(app)` organizan archivos, pero no crean segmentos URL.
3. Los query parameters, hashes, estados de modal y entidades seleccionadas no crean patrones adicionales.
4. Los tres `_layout.tsx` se registran por separado y no se cuentan como pantallas.
5. Modales y flujos embebidos con interacción propia se registran como superficies subordinadas `NO_ROUTE`.
6. `ErrorBoundary` y `AppUpdateGate` se registran como superficies globales y no como rutas.
7. Las páginas y handlers de `web-auth` se preservan como superficies auxiliares separadas; no convierten ANIMA en aplicación web operativa.
8. La existencia de un rol, capability, permiso o allowlist en cliente se registra como evidencia observada y no como aprobación de autorización definitiva.
9. Ocultar una pestaña no protege por sí solo la URL directa, los datos ni las mutaciones.
10. Todo cambio de árbol, patrón, layout, deep link, guard, plataforma, superficie auxiliar o commit invalida la huella afectada.

#### 5. Resumen reconciliado

| Métrica                                        |                           Resultado |
| ---------------------------------------------- | ----------------------------------: |
| Pantallas móviles con ruta                     |                              **14** |
| Patrones estáticos                             |                              **14** |
| Patrones dinámicos                             |                               **0** |
| Rutas de arranque y acceso                     |                               **3** |
| Rutas autenticadas de aplicación               |                              **11** |
| Pestañas registradas                           |                               **9** |
| Pestañas generales                             |                               **7** |
| Pestañas condicionadas por rol observado       |                               **2** |
| Rutas fuera de pestañas                        | **5** — 3 de acceso + 2 utilitarias |
| Layouts                                        |                               **3** |
| Superficies internas subordinadas              |                              **16** |
| Superficies globales                           |                               **2** |
| Tipos de notificación con navegación explícita |                               **5** |
| Destinos de deep link por notificación         |                               **2** |
| Route handlers Expo `+api` observados          |                               **0** |
| Superficies fuente de `web-auth`               |                               **5** |
| Patrones web auxiliares declarados             |                               **5** |
| Patrones URL móviles duplicados                |                               **0** |
| Archivos de pantalla móviles duplicados        |                               **0** |

#### 6. `ANIMA-SCREEN-INVENTORY-001`

| ID                 | Patrón               | Archivo fuente                | Tipo       | Comportamiento                     | Superficie observada                                                   | Evidencia de acceso observada                                                                    | Navegación             | Límite documental                                                      |
| ------------------ | -------------------- | ----------------------------- | ---------- | ---------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ | ---------------------- | ---------------------------------------------------------------------- |
| `ANIMA-SCREEN-001` | `/`                  | `app/index.tsx`               | `ESTATICA` | `REDIRECT_BOOT`                    | Puente de entrada hacia /splash                                        | Pública controlada; redirección incondicional                                                    | `ROOT_STACK`           | No inferir permiso, proceso, completitud ni disponibilidad productiva. |
| `ANIMA-SCREEN-002` | `/splash`            | `app/(auth)/splash.tsx`       | `ESTATICA` | `BOOTSTRAP_AND_REDIRECT`           | Arranque, carga de asistencia y geocerca                               | Pública controlada; decide /home o /login según sesión                                           | `AUTH_STACK`           | No inferir permiso, proceso, completitud ni disponibilidad productiva. |
| `ANIMA-SCREEN-003` | `/login`             | `app/(auth)/login.tsx`        | `ESTATICA` | `AUTHENTICATION_VIEW`              | Inicio y recuperación de acceso                                        | Pública controlada; autenticación Supabase                                                       | `AUTH_STACK`           | No inferir permiso, proceso, completitud ni disponibilidad productiva. |
| `ANIMA-SCREEN-004` | `/home`              | `app/(app)/home.tsx`          | `ESTATICA` | `ATTENDANCE_OPERATION`             | Check-in, check-out, geocerca, cola offline y resumen diario           | Sesión consumida; autoridad definitiva pendiente                                                 | `TAB_ALWAYS`           | No inferir permiso, proceso, completitud ni disponibilidad productiva. |
| `ANIMA-SCREEN-005` | `/shifts`            | `app/(app)/shifts.tsx`        | `ESTATICA` | `SHIFT_VIEW_AND_MANAGEMENT`        | Turnos personales, semana de sede y gestión gerencial                  | Lectura con sesión; gestión por capability shift.create o fallback de rol                        | `TAB_ALWAYS`           | No inferir permiso, proceso, completitud ni disponibilidad productiva. |
| `ANIMA-SCREEN-006` | `/history`           | `app/(app)/history.tsx`       | `ESTATICA` | `ATTENDANCE_HISTORY`               | Historial propio, detalle y reporte de incidencia                      | Consulta asociada al user.id observado                                                           | `TAB_ALWAYS`           | No inferir permiso, proceso, completitud ni disponibilidad productiva. |
| `ANIMA-SCREEN-007` | `/documents`         | `app/(app)/documents.tsx`     | `ESTATICA` | `DOCUMENT_VIEW_AND_MANAGEMENT`     | Documentos laborales, alertas, carga, apertura y eliminación           | Permisos anima.documents.* con fallback de roles observado                                       | `TAB_ALWAYS`           | No inferir permiso, proceso, completitud ni disponibilidad productiva. |
| `ANIMA-SCREEN-008` | `/carnet`            | `app/(app)/carnet.tsx`        | `ESTATICA` | `LABOR_ID_VIEW`                    | Carné laboral y estado de elegibilidad                                 | Identidad laboral del usuario autenticado                                                        | `TAB_ALWAYS`           | No inferir permiso, proceso, completitud ni disponibilidad productiva. |
| `ANIMA-SCREEN-009` | `/announcements`     | `app/(app)/announcements.tsx` | `ESTATICA` | `ANNOUNCEMENT_VIEW_AND_MANAGEMENT` | Novedades y formulario de administración de audiencia                  | Lectura con sesión; gestión por roles locales observados                                         | `TAB_ALWAYS`           | No inferir permiso, proceso, completitud ni disponibilidad productiva. |
| `ANIMA-SCREEN-010` | `/operativo`         | `app/(app)/operativo.tsx`     | `ESTATICA` | `OPERATIONS_SUMMARY`               | Resumen operativo gerencial                                            | Propietario, gerente_general o gerente por rol local                                             | `TAB_ROLE_GATED`       | No inferir permiso, proceso, completitud ni disponibilidad productiva. |
| `ANIMA-SCREEN-011` | `/team`              | `app/(app)/team.tsx`          | `ESTATICA` | `TEAM_VIEW_AND_MANAGEMENT`         | Equipo, invitaciones, edición y eliminación                            | Capabilities team.view/team.invite con fallback de roles observado                               | `TAB_ROLE_GATED`       | No inferir permiso, proceso, completitud ni disponibilidad productiva. |
| `ANIMA-SCREEN-012` | `/support`           | `app/(app)/support.tsx`       | `ESTATICA` | `SUPPORT_AND_MESSAGING`            | Tickets, mensajes, contacto laboral y preguntas frecuentes             | Sesión; contacto a trabajadores limitado a roles gerenciales observados                          | `TAB_ALWAYS`           | No inferir permiso, proceso, completitud ni disponibilidad productiva. |
| `ANIMA-SCREEN-013` | `/account-settings`  | `app/account-settings.tsx`    | `ESTATICA` | `ACCOUNT_AND_PRIVACY_SETTINGS`     | Permisos del dispositivo, privacidad, limpieza y eliminación de cuenta | Sesión consumida; acceso directo pendiente de guard canónico                                     | `ROOT_STACK_UTILITY`   | No inferir permiso, proceso, completitud ni disponibilidad productiva. |
| `ANIMA-SCREEN-014` | `/anima-diagnostics` | `app/anima-diagnostics.tsx`   | `ESTATICA` | `TECHNICAL_DIAGNOSTICS`            | Diagnóstico de empleados, turnos, geocercas y push tokens              | Allowlist local de correos y estado de denegación; protección de servidor pendiente de auditoría | `ROOT_STACK_TECHNICAL` | No inferir permiso, proceso, completitud ni disponibilidad productiva. |

#### 7. Layouts y topología de navegación

##### 7.1 Layouts

| ID                 | Archivo                  | Tipo         | Alcance observado                                                  |
| ------------------ | ------------------------ | ------------ | ------------------------------------------------------------------ |
| `ANIMA-LAYOUT-001` | `app/_layout.tsx`        | `ROOT_STACK` | Providers Auth/AppConfig/Attendance, ErrorBoundary y AppUpdateGate |
| `ANIMA-LAYOUT-002` | `app/(auth)/_layout.tsx` | `AUTH_STACK` | splash y login; header oculto                                      |
| `ANIMA-LAYOUT-003` | `app/(app)/_layout.tsx`  | `TAB_LAYOUT` | nueve pestañas, badge de soporte y deep links de notificaciones    |

##### 7.2 Pestañas

```text
Check-in     /home             GENERAL
Turnos       /shifts           GENERAL
Historial    /history          GENERAL
Documentos   /documents        GENERAL
Carnet       /carnet           GENERAL
Novedades    /announcements    GENERAL
Resumen      /operativo        ROL_LOCAL_CONDICIONADO
Equipo       /team             ROL_LOCAL_CONDICIONADO
Soporte      /support          GENERAL + BADGE_NO_LEÍDOS
```

La visibilidad de `Resumen` y `Equipo` se calcula en el layout con `propietario`, `gerente_general` o `gerente`. Esa evidencia no aprueba la matriz definitiva y no sustituye los controles de cada pantalla o del servidor.

##### 7.3 Navegación por notificación

| Tipo recibido         | Destino observado |
| --------------------- | ----------------- |
| `shift_update`        | `/shifts`         |
| `shift`               | `/shifts`         |
| `shift_end_reminder`  | `/shifts`         |
| `shift_auto_checkout` | `/shifts`         |
| `support_message`     | `/support`        |

No se observó un destino genérico controlado por datos remotos. Los tipos desconocidos no tienen navegación explícita en el snapshot.

#### 8. Superficies internas subordinadas

| ID                  | Superficie              | Pantalla propietaria          | Propósito                                        | Clasificación |
| ------------------- | ----------------------- | ----------------------------- | ------------------------------------------------ | ------------- |
| `ANIMA-SURFACE-001` | `SitePickerModal`       | `app/(app)/home.tsx`          | Selección de sede para marcación                 | `NO_ROUTE`    |
| `ANIMA-SURFACE-002` | `UserMenuModal`         | `app/(app)/home.tsx`          | Menú de usuario y acceso a configuración         | `NO_ROUTE`    |
| `ANIMA-SURFACE-003` | `CreateShiftModal`      | `app/(app)/shifts.tsx`        | Creación de turno                                | `NO_ROUTE`    |
| `ANIMA-SURFACE-004` | `EditShiftModal`        | `app/(app)/shifts.tsx`        | Edición de turno                                 | `NO_ROUTE`    |
| `ANIMA-SURFACE-005` | `HistoryDetailModal`    | `app/(app)/history.tsx`       | Detalle de registro                              | `NO_ROUTE`    |
| `ANIMA-SURFACE-006` | `HistoryIncidentModal`  | `app/(app)/history.tsx`       | Reporte de incidencia                            | `NO_ROUTE`    |
| `ANIMA-SURFACE-007` | `UploadDocumentModal`   | `app/(app)/documents.tsx`     | Carga de documento                               | `NO_ROUTE`    |
| `ANIMA-SURFACE-008` | `DocumentPickerModal`   | `app/(app)/documents.tsx`     | Selección de tipo, sede o trabajador             | `NO_ROUTE`    |
| `ANIMA-SURFACE-009` | `AnnouncementFormModal` | `app/(app)/announcements.tsx` | Crear o editar novedad y audiencia               | `NO_ROUTE`    |
| `ANIMA-SURFACE-010` | `TeamEditModal`         | `app/(app)/team.tsx`          | Edición de trabajador                            | `NO_ROUTE`    |
| `ANIMA-SURFACE-011` | `TeamInviteModal`       | `app/(app)/team.tsx`          | Invitación laboral                               | `NO_ROUTE`    |
| `ANIMA-SURFACE-012` | `TeamDeleteModal`       | `app/(app)/team.tsx`          | Confirmación de eliminación de trabajador        | `NO_ROUTE`    |
| `ANIMA-SURFACE-013` | `SupportTicketModal`    | `app/(app)/support.tsx`       | Creación de ticket                               | `NO_ROUTE`    |
| `ANIMA-SURFACE-014` | `ContactWorkerModal`    | `app/(app)/support.tsx`       | Aviso o conversación con trabajador              | `NO_ROUTE`    |
| `ANIMA-SURFACE-015` | `DataCleanupFlow`       | `app/account-settings.tsx`    | Solicitud de limpieza de datos                   | `NO_ROUTE`    |
| `ANIMA-SURFACE-016` | `DeleteAccountFlow`     | `app/account-settings.tsx`    | Solicitud y cancelación de eliminación de cuenta | `NO_ROUTE`    |

Estas dieciséis superficies se preservan porque contienen decisiones, formularios o confirmaciones propias, pero no incrementan el conteo de rutas móviles.

#### 9. Superficies globales

| ID                 | Superficie      | Archivo propietario | Propósito                                             |
| ------------------ | --------------- | ------------------- | ----------------------------------------------------- |
| `ANIMA-GLOBAL-001` | `ErrorBoundary` | `app/_layout.tsx`   | Estado global de error y reintento                    |
| `ANIMA-GLOBAL-002` | `AppUpdateGate` | `app/_layout.tsx`   | Actualización obligatoria u opcional de la aplicación |

#### 10. Superficies web auxiliares separadas

| ID                  | Patrón observado                      | Archivo fuente                        | Propósito                                                   | Estado de exposición           |
| ------------------- | ------------------------------------- | ------------------------------------- | ----------------------------------------------------------- | ------------------------------ |
| `ANIMA-WEB-AUX-001` | `/api/request-password`               | `web-auth/api/request-password.js`    | Formulario web para solicitar enlace de contraseña          | `DECLARADA`                    |
| `ANIMA-WEB-AUX-002` | `/api/set-password`                   | `web-auth/api/set-password.js`        | Formulario web de creación o restablecimiento de contraseña | `DECLARADA`                    |
| `ANIMA-WEB-AUX-003` | `/privacy-policy`                     | `web-auth/public/privacy-policy.html` | Política de privacidad                                      | `DECLARADA`                    |
| `ANIMA-WEB-AUX-004` | `/delete-account; /eliminar-cuenta`   | `web-auth/public/delete-account.html` | Información de eliminación de cuenta con alias              | `DECLARADA_DOS_PATRONES`       |
| `ANIMA-WEB-AUX-005` | `sin patrón explícito en vercel.json` | `web-auth/public/index.html`          | Índice mínimo de ANIMA Auth                                 | `EXPOSICION_RUNTIME_PENDIENTE` |

`web-auth` es un despliegue auxiliar para contraseña, privacidad y eliminación de cuenta. La aplicación principal mantiene `platforms: ["ios", "android"]` y `supportsTablet: false`. Por tanto:

```text
14 PANTALLAS MÓVILES
≠ 5 SUPERFICIES FUENTE WEB-AUTH
≠ ANIMA WEB OPERATIVA
```

#### 11. Evidencia de acceso observada

- `/`, `/splash` y `/login` forman el circuito de entrada y bootstrap.
- El layout autenticado consume `user`, `employee`, rol y contador de soporte, pero no contiene un guard canónico central explícito para las once rutas de aplicación.
- `/operativo` vuelve a comprobar tres roles locales y muestra denegación cuando no coinciden.
- `/team` utiliza `team.view` y `team.invite` cuando las capabilities están cargadas, con fallback a roles gerenciales.
- `/documents` utiliza `anima.documents.view_all`, `upload` y `delete`, también con fallback de roles.
- `/shifts` utiliza `shift.create` cuando las capabilities están cargadas, con fallback de roles gerenciales.
- `/announcements` decide administración mediante una lista local de roles.
- `/anima-diagnostics` usa una allowlist local de correos; la pantalla de configuración y la pantalla diagnóstica no declaran la misma lista.
- La evidencia anterior describe el snapshot y no concede, revoca ni normaliza permisos en esta tarea.

#### 12. Route handlers móviles y servicios auxiliares

No se observaron archivos Expo Router `+api.ts`, `+api.tsx`, `+api.js` o `+api.jsx` bajo `app/`.

```text
EXPO_ROUTE_HANDLERS = 0
```

Los handlers `web-auth/api/request-password.js` y `web-auth/api/set-password.js` generan HTML y pertenecen al servicio auxiliar. No se cuentan como rutas móviles ni autorizan por sí solos operaciones laborales.

#### 13. Hallazgos y carryover obligatorio

| ID                         | Hallazgo                                                                                                                | Tratamiento inmediato                                                                                         | Propietario y momento de resolución                                                         |
| -------------------------- | ----------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| `ANIMA-SCREEN-FINDING-001` | La aplicación móvil declara solo iOS y Android, mientras el repositorio conserva un servicio web auxiliar.              | Mantener fronteras y despliegues separados; no registrar web-auth como navegación móvil.                      | `AUTH-UI-013`, `AUTH-UI-014`, `AUTH-UI-020` y `AUTH-UI-045`, antes de navegación unificada. |
| `ANIMA-SCREEN-FINDING-002` | No existe un guard canónico único visible en el layout para todas las rutas autenticadas.                               | No concluir bypass; exigir reconciliación por URL directa y protección de servidor.                           | `AUTH-UI-030` a `AUTH-UI-044`, antes de implementación.                                     |
| `ANIMA-SCREEN-FINDING-003` | Visibilidad de pestañas y controles combina roles locales, capabilities y permisos con fallbacks diferentes.            | Preservar evidencia y prohibir normalización prematura.                                                       | `AUTH-UI-030` a `AUTH-UI-038` y `AUTH-UI-045`.                                              |
| `ANIMA-SCREEN-FINDING-004` | La allowlist de acceso al diagnóstico difiere entre `/account-settings` y `/anima-diagnostics`.                         | Clasificar la superficie como técnica y reemplazar allowlists por capacidad canónica en su tarea propietaria. | `AUTH-UI-029`, `AUTH-UI-030`, `AUTH-UI-041` y `AUTH-SRV-*` aplicable.                       |
| `ANIMA-SCREEN-FINDING-005` | `OperativoReportScreen` aparece como ruta `/operativo` y también embebida en `/home` para roles gerenciales.            | Conservar ambas exposiciones hasta decidir si son vistas complementarias o solapadas.                         | `AUTH-UI-026` a `AUTH-UI-028`.                                                              |
| `ANIMA-SCREEN-FINDING-006` | `/documents` elimina fila y luego intenta eliminar Storage directamente.                                                | No corregir aquí; mantener vinculación con ciclo documental, retención y disposición.                         | `TREQ-ANIMA-005`, tareas `INFO-*`, `EVID-ARC-*` y paquete ANIMA/VISO correspondiente.       |
| `ANIMA-SCREEN-FINDING-007` | No se observó un sincronizador local de pantallas ANIMA hacia registros runtime de SHELL.                               | No inferir ausencia de filas remotas ni crear navegación en esta tarea.                                       | `AUTH-UI-045`, antes de aprobar navegación unificada.                                       |
| `ANIMA-SCREEN-FINDING-008` | `web-auth/public/index.html` existe, pero `vercel.json` no declara un patrón explícito para ese archivo.                | Verificar exposición efectiva sin asumir `/`; conservarlo fuera del conteo móvil.                             | `AUTH-UI-029` y paquete de autenticación auxiliar antes de despliegue.                      |
| `ANIMA-SCREEN-FINDING-009` | `/delete-account` y `/eliminar-cuenta` comparten una única superficie fuente.                                           | Mantener ambos patrones como alias y una sola identidad de superficie.                                        | `AUTH-UI-026`, `AUTH-UI-045` y contrato externo de enlaces.                                 |
| `ANIMA-SCREEN-FINDING-010` | No existen rutas dinámicas móviles; selección de trabajador, turno, sede o ticket ocurre dentro de pantallas estáticas. | No expandir el inventario por entidad ni por estado de modal.                                                 | Regla permanente de `AUTH-UI-007`; validar drift en CI.                                     |

No queda un hallazgo detectado como pendiente narrativo sin tarea o requisito propietario.

#### 14. Requisitos de prueba derivados

Se incorporan al registro canónico completo:

```text
TREQ-ANIMA-006 a TREQ-ANIMA-025
```

| ID               | Regla protegida                                                                                                                                                                                                                                                              |
| ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `TREQ-ANIMA-006` | El inventario móvil de ANIMA deberá detectar exactamente catorce módulos de pantalla activos bajo app, excluyendo los tres layouts, componentes internos, superficies globales y el subproyecto web-auth.                                                                    |
| `TREQ-ANIMA-007` | Cada pantalla móvil deberá conservar un identificador estable ANIMA-SCREEN-001 a ANIMA-SCREEN-014, un patrón único y un archivo fuente único; ningún route group de Expo Router formará parte de la URL.                                                                     |
| `TREQ-ANIMA-008` | El snapshot aprobado deberá conservar catorce patrones estáticos y cero patrones dinámicos; parámetros de consulta, fragmentos, estados de modal y entidades seleccionadas no crearán pantallas adicionales.                                                                 |
| `TREQ-ANIMA-009` | Pantallas, layouts, pestañas, modales, flujos embebidos, ErrorBoundary, AppUpdateGate, handlers auxiliares y páginas web de autenticación deberán clasificarse por separado y no inflar el conteo móvil.                                                                     |
| `TREQ-ANIMA-010` | La raíz / deberá redirigir a /splash; /splash deberá completar o agotar de forma segura el bootstrap y conducir a /home con sesión o a /login sin sesión, sin bucles ni exposición intermedia de una pantalla protegida.                                                     |
| `TREQ-ANIMA-011` | La aplicación principal deberá permanecer configurada únicamente para iOS y Android, sin soporte de tablet aprobado; web-auth será un servicio auxiliar separado y no convertirá ANIMA en una aplicación web de operación laboral.                                           |
| `TREQ-ANIMA-012` | El layout raíz deberá conservar AuthProvider, AppConfigProvider y AttendanceProvider, manejar errores globales y aplicar la puerta de actualización sin contar esos elementos como rutas ni omitirlos del inventario de superficies transversales.                           |
| `TREQ-ANIMA-013` | La navegación autenticada deberá reconciliar exactamente nueve pestañas: siete visibles de forma general y Resumen y Equipo condicionadas; ocultar una pestaña no sustituirá el control de acceso de la pantalla ni del servidor.                                            |
| `TREQ-ANIMA-014` | Las respuestas de notificación solo podrán navegar a /shifts para shift_update, shift, shift_end_reminder o shift_auto_checkout, y a /support para support_message; tipos desconocidos no deberán abrir destinos arbitrarios.                                                |
| `TREQ-ANIMA-015` | La pantalla /home deberá mantener separados estado de asistencia, geocerca, selección de sede, conectividad, cola offline, sincronización y diagnóstico; una marcación no se mostrará como aplicada cuando solo esté pendiente o fallida.                                    |
| `TREQ-ANIMA-016` | La pantalla /shifts deberá separar lectura personal, semana de sede y gestión; crear, editar, confirmar o cancelar turnos requerirá capacidad efectiva y validación de servidor, sin depender exclusivamente del rol o de la visibilidad del botón.                          |
| `TREQ-ANIMA-017` | La pantalla /history deberá consultar únicamente el historial permitido del actor, conservar estados de carga y vacío, y separar detalle de registro y reporte de incidencia sin permitir acceso a registros de terceros por manipulación local.                             |
| `TREQ-ANIMA-018` | La pantalla /documents deberá respetar alcance personal, de sede o global y permisos de lectura, carga y eliminación; abrir, sustituir o eliminar fila y Storage deberá cumplir el ciclo documental, retención y evidencia definido por TREQ-ANIMA-005.                      |
| `TREQ-ANIMA-019` | La pantalla /carnet deberá presentar únicamente la identidad laboral y elegibilidad del trabajador autenticado, diferenciar empleo, contrato y documentos y no declarar un carné válido cuando falte una condición requerida.                                                |
| `TREQ-ANIMA-020` | La pantalla /announcements deberá conservar coherencia entre audiencia persistida, audiencia notificada y visibilidad al leer; crear, editar y eliminar deberán estar ocultos y bloqueados cuando la operación no sea autorizada o esté en modo solo lectura.                |
| `TREQ-ANIMA-021` | Las pantallas /operativo y /team deberán aplicar en acceso directo la misma decisión efectiva que sus pestañas; la divergencia entre listas locales de rol, capabilities y permisos canónicos deberá detectarse y bloquearse antes de cualquier acción.                      |
| `TREQ-ANIMA-022` | La pantalla /support deberá limitar tickets, mensajes y contacto con trabajadores al actor y territorio autorizados, conservar estados y no leídos, y resolver deep links sin exponer conversaciones ajenas.                                                                 |
| `TREQ-ANIMA-023` | La pantalla /account-settings deberá operar únicamente sobre la cuenta autenticada, reflejar permisos reales del dispositivo y separar limpieza de datos, eliminación de cuenta y cierre de sesión; las solicitudes deberán conservar estado y trazabilidad.                 |
| `TREQ-ANIMA-024` | La pantalla /anima-diagnostics deberá usar una capacidad técnica canónica y protección de servidor; la allowlist de navegación y la de la pantalla deberán ser consistentes, y ningún correo hardcodeado concederá por sí solo acceso a datos laborales.                     |
| `TREQ-ANIMA-025` | Las superficies auxiliares web-auth deberán permanecer separadas del inventario móvil, conservar patrones y alias explícitos, validar de forma segura tokens de recuperación y producir un delta ante cualquier alta, retiro, movimiento o cambio frente al commit aprobado. |

El registro resultante deberá pasar de **3.398** a **3.418** requisitos, y el dominio ANIMA de **5** a **25**, sin modificar las 3.398 filas históricas.

#### 15. Huellas de la línea base

```text
ROUTE_REGISTRY_SHA256 = 1e8497684e54cf0d77d2937ae24c42293bb547f58c51582e7f2c61c87bfd6988
LAYOUT_REGISTRY_SHA256 = 176e4156d8924d1d469074de2b500008c7dd73fe1e22a01d4813b5ffca65eb09
INTERNAL_SURFACES_SHA256 = 8148ffaa1cc3511cf5a48764c488a5895744774bde93b5fa48e133b8f1517b68
WEB_AUX_REGISTRY_SHA256 = a2bc72cee0ee9984979747d387e21d8e4317482dca5ece6037a5a6607688b599
COMBINED_INVENTORY_SHA256 = c65ba8c4f9e138924f567e853ccd6774708685fdfdd2ffdbaa6d30cf85c38ee5
```

#### 16. Criterios de aceptación

- [x] El inventario contiene exactamente catorce pantallas móviles únicas.
- [x] Los IDs `ANIMA-SCREEN-001` a `ANIMA-SCREEN-014` son consecutivos.
- [x] Las catorce rutas son estáticas y no existen patrones dinámicos.
- [x] Tres layouts están separados del conteo de pantallas.
- [x] Nueve pestañas se reconcilian con siete generales y dos condicionadas.
- [x] Dieciséis superficies internas y dos globales están identificadas sin contarlas como rutas.
- [x] Cinco superficies fuente de `web-auth` permanecen separadas de la aplicación móvil.
- [x] Se registran cero handlers Expo `+api`.
- [x] Los roles, capabilities, permisos y allowlists observados no se presentan como matriz definitiva.
- [x] Todos los hallazgos tienen propietario y momento de resolución.
- [x] Se definen `TREQ-ANIMA-006` a `TREQ-ANIMA-025` sin modificar requisitos históricos.
- [x] No se implementa código, navegación runtime, migración, Supabase ni despliegue.

#### 17. Continuidad

```text
AUTH-UI-006 — APROBADA
        ↓
AUTH-UI-007 — APROBADA
```

APROBADA


### ✅ AUTH-UI-008 — Inventariar todas las superficies de SHELL

**Estado:** APROBADA
**Fecha de aprobación documental:** 2026-07-28
**Bloque propietario:** BLOQUE I — Navegación, pantallas y autorización de vistas
**Tipo de tarea:** inventario técnico-documental de superficies runtime, embebidas, transversales y template; sin cambios de código, Supabase, navegación runtime ni despliegue
**Marcador exacto que reemplaza:** `### [ ] AUTH-UI-008 — Inventariar todas las superficies de SHELL`
**Última tarea aprobada:** `AUTH-UI-007 — Inventariar todas las pantallas de ANIMA`
**Siguiente tarea reservada:** `AUTH-UI-009 — Inventariar todas las superficies de PASS y sus fronteras laborales`

#### 1. Objetivo

Inventariar de forma exhaustiva, reproducible y sin mezclar categorías todas las superficies actuales de SHELL en el snapshot inspeccionado: páginas runtime, superficies interactivas embebidas, layout, middleware, metadata generada, componentes UI fuente y el template `app-shell-standard` conservado en el mismo repositorio.

La tarea fija existencia, topología y evidencia. No asigna todavía procesos, actores, permisos definitivos, propiedad funcional, candidatura de retiro ni disponibilidad productiva adicional.

#### 2. Fuente inspeccionada

| Campo                                | Valor                                                            |
| ------------------------------------ | ---------------------------------------------------------------- |
| Repositorio                          | `devVentoGroup/vento-shell`                                      |
| Rama                                 | `main`                                                           |
| Commit de código inspeccionado       | `8f26161e9dbdbabc55e700d4a20d3d358146eef4`                       |
| Commit documental vigente al iniciar | `0f3aa70407ecc5de5fa4ff601b1976c1bd29375b`                       |
| Framework                            | Next.js 16.1.1, React 19.2.3 y App Router                        |
| Raíz runtime                         | `src/app/`                                                       |
| Puerta transversal                   | `middleware.ts`                                                  |
| Template fuente                      | `templates/app-shell-standard/`                                  |
| Base TREQ                            | registro `04A` con 3.418 requisitos y última tarea `AUTH-UI-007` |
| Cambios ejecutados                   | ninguno en código, Supabase, rutas, despliegues o GitHub         |

#### 3. Frontera obligatoria

```text
RUTA RUNTIME
≠ SUPERFICIE EMBEBIDA
≠ LAYOUT
≠ MIDDLEWARE
≠ METADATA GENERADA
≠ PRIMITIVA UI
≠ TEMPLATE FUENTE
≠ SUPERFICIE DESPLEGADA EN UNA APP CONSUMIDORA
≠ PERMISO DEFINITIVO
≠ PROCESO
≠ CAPACIDAD COMPLETA
```

#### 4. Método de inventario

1. Cada `src/app/**/page.tsx` activo se registra como ruta de página.
2. `layout.tsx`, `icon.tsx`, middleware y componentes embebidos se registran por separado.
3. Query parameters, estados de modal y tarjetas repetidas no crean rutas nuevas.
4. `templates/app-shell-standard` se registra como plantilla fuente, no como runtime de SHELL.
5. Las primitivas de `src/components/ui` se registran como componentes fuente, no como superficies empresariales.
6. La ausencia de `src/app/api` se registra como cero handlers, sin impedir que futuras altas deban inventariarse y protegerse.
7. Ocultar o deshabilitar un enlace no sustituye autorización en el destino.
8. Todo hallazgo queda ligado a tarea y requisito, sin pendientes narrativos.

#### 5. Resumen reconciliado

| Métrica                                        | Resultado |
| ---------------------------------------------- | --------: |
| Rutas de página runtime                        |     **2** |
| Patrones estáticos                             |     **2** |
| Patrones dinámicos                             |     **0** |
| Layouts runtime                                |     **1** |
| Puertas middleware                             |     **1** |
| Superficies metadata generadas                 |     **1** |
| Superficies interactivas embebidas             |     **5** |
| Aplicaciones mostradas por el launcher runtime |     **5** |
| Hosts reconocidos por metadata de login        |     **7** |
| Route handlers bajo `src/app/api`              |     **0** |
| Módulos del template AppShell                  |     **7** |
| Primitivas UI fuente fuera del template        |     **5** |
| Enlaces placeholder de perfil/configuración    |     **2** |
| Requisitos nuevos                              |    **24** |

#### 6. `SHELL-RUNTIME-SURFACE-INVENTORY-001`

| ID                  | Tipo                 | Patrón / exposición   | Archivo fuente                     | Propósito observado                                                    | Evidencia de acceso                                                          | Límite                                                                                   |
| ------------------- | -------------------- | --------------------- | ---------------------------------- | ---------------------------------------------------------------------- | ---------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| `SHELL-SURFACE-001` | `PAGE`               | `/`                   | `src/app/page.tsx`                 | Hub y launcher central de aplicaciones                                 | Sesión exigida en servidor y middleware; disponibilidad por `has_permission` | No implica que cada aplicación destino esté completa ni que el permiso esté normalizado. |
| `SHELL-SURFACE-002` | `PAGE`               | `/login`              | `src/app/login/page.tsx`           | Acceso central, metadata por destino y redirección de sesión existente | Pública controlada; redirige si ya existe usuario                            | `returnTo` requiere endurecimiento y allowlist.                                          |
| `SHELL-SURFACE-003` | `EMBEDDED`           | tarjetas del launcher | `src/app/page.tsx`                 | Cinco tarjetas para VISO, NEXO, FOGO, ORIGO y PULSO                    | Estado habilitado o bloqueado por RPC                                        | Visibilidad no reemplaza autorización del destino.                                       |
| `SHELL-SURFACE-004` | `EMBEDDED`           | rail de logos         | `src/app/page.tsx`                 | Resumen visual de las cinco aplicaciones                               | Deriva del mismo catálogo local                                              | No es una ruta ni un catálogo canónico independiente.                                    |
| `SHELL-SURFACE-005` | `EMBEDDED`           | menú de sesión        | `src/app/page.tsx`                 | Email, perfil, configuración y cierre de sesión                        | Solo aparece dentro de `/` autenticado                                       | Perfil y configuración son placeholders hacia `/`.                                       |
| `SHELL-SURFACE-006` | `EMBEDDED`           | formulario de acceso  | `src/features/auth/login-form.tsx` | Email, contraseña, mostrar/ocultar, errores, cooldown y envío          | Supabase Auth en cliente                                                     | No constituye autorización empresarial.                                                  |
| `SHELL-SURFACE-007` | `EMBEDDED`           | modal de recuperación | `src/features/auth/login-form.tsx` | Solicitud de enlace de restablecimiento                                | Supabase Auth y destino web-auth                                             | Accesibilidad y contrato transversal pendientes.                                         |
| `SHELL-SURFACE-008` | `GLOBAL`             | raíz HTML             | `src/app/layout.tsx`               | Metadata, fuentes y guard global de rueda en inputs numéricos          | Envuelve toda página                                                         | `metadataBase` usa `hub.ventogroup.co`; reconciliación pendiente.                        |
| `SHELL-SURFACE-009` | `GLOBAL_SECURITY`    | matcher transversal   | `middleware.ts`                    | Renovación y validación de sesión, cookies y redirección               | Protege rutas no excluidas                                                   | `/api` está excluido de forma global.                                                    |
| `SHELL-SURFACE-010` | `GENERATED_METADATA` | icono App Router      | `src/app/icon.tsx`                 | PNG 32×32 generado con `ImageResponse`                                 | Expuesto por convención de Next.js                                           | No es página ni capacidad empresarial.                                                   |

#### 7. Catálogo runtime observado

| Aplicación | Destino                       | Permiso local  | Estado calculado                                      |
| ---------- | ----------------------------- | -------------- | ----------------------------------------------------- |
| VISO       | `https://viso.ventogroup.co`  | `viso.access`  | RPC canónica o fallback; fail-closed ante error final |
| NEXO       | `https://nexo.ventogroup.co`  | `nexo.access`  | RPC canónica o fallback; fail-closed ante error final |
| FOGO       | `https://fogo.ventogroup.co`  | `fogo.access`  | RPC canónica o fallback; fail-closed ante error final |
| ORIGO      | `https://origo.ventogroup.co` | `origo.access` | RPC canónica o fallback; fail-closed ante error final |
| PULSO      | `https://pulso.ventogroup.co` | `pulso.access` | RPC canónica o fallback; fail-closed ante error final |

La lista anterior es evidencia local del snapshot. No se aprueba como catálogo definitivo porque difiere de otras listas del mismo repositorio.

#### 8. Topología de acceso

```text
Solicitud a ruta protegida
→ middleware valida cookies/configuración/usuario
→ sin sesión: /login?returnTo=<URL>
→ sesión válida y ruta /
→ servidor vuelve a comprobar usuario
→ resuelve cinco permisos de aplicación
→ habilita o bloquea cada tarjeta
```

Exclusiones actuales del middleware:

```text
_next | login | favicon.ico | logos | images | fonts | api
```

No existen handlers bajo `src/app/api` en el snapshot. La exclusión sigue siendo una frontera de seguridad obligatoria para cualquier alta futura.

#### 9. Login y recuperación

- `/login` reconoce metadata para NEXO, ORIGO, FOGO, VISO, PULSO, ANIMA y AURA.
- `safeReturnTo` conserva rutas relativas, pero también admite cualquier URL absoluta `http` o `https`.
- El formulario utiliza `signInWithPassword`, muestra error, evita doble envío mientras carga y aplica cooldown local de 30 segundos cuando el mensaje contiene `rate limit`.
- La recuperación usa `NEXT_PUBLIC_SET_PASSWORD_URL` o el fallback `https://anima.ventogroup.co/api/set-password`.
- El modal de recuperación es una superficie embebida y no una ruta adicional.

#### 10. `SHELL-TEMPLATE-SURFACE-INVENTORY-001`

| ID                   | Módulo fuente   | Archivo                                                                       | Clasificación                | Estado runtime en SHELL                                           |
| -------------------- | --------------- | ----------------------------------------------------------------------------- | ---------------------------- | ----------------------------------------------------------------- |
| `SHELL-TEMPLATE-001` | layout estándar | `templates/app-shell-standard/src/app/layout.tsx`                             | `TEMPLATE_LAYOUT`            | No importado por `src/app/layout.tsx`                             |
| `SHELL-TEMPLATE-002` | VentoShell      | `templates/app-shell-standard/src/components/vento/standard/vento-shell.tsx`  | `TEMPLATE_SERVER_SHELL`      | No runtime en SHELL                                               |
| `SHELL-TEMPLATE-003` | VentoChrome     | `templates/app-shell-standard/src/components/vento/standard/vento-chrome.tsx` | `TEMPLATE_NAVIGATION_CHROME` | No runtime en SHELL; acoplado a NEXO                              |
| `SHELL-TEMPLATE-004` | AppSwitcher     | `templates/app-shell-standard/src/components/vento/standard/app-switcher.tsx` | `TEMPLATE_APP_SWITCHER`      | No runtime en SHELL; catálogo local divergente                    |
| `SHELL-TEMPLATE-005` | ProfileMenu     | `templates/app-shell-standard/src/components/vento/standard/profile-menu.tsx` | `TEMPLATE_PROFILE_CONTEXT`   | No runtime en SHELL; override de rol y sede pendiente de gobierno |
| `SHELL-TEMPLATE-006` | UI kit          | `templates/app-shell-standard/src/components/vento/standard/ui.tsx`           | `TEMPLATE_UI_KIT`            | Fuente para copiar; no ruta                                       |
| `SHELL-TEMPLATE-007` | Table kit       | `templates/app-shell-standard/src/components/vento/standard/table.tsx`        | `TEMPLATE_TABLE_KIT`         | Fuente para copiar; no ruta                                       |

El README ordena copiar estos archivos a repositorios nuevos. Por tanto, el template es una fuente de propagación transversal y debe conservar versión, linaje y pruebas, pero no incrementa el conteo de rutas runtime de SHELL.

#### 11. Primitivas UI fuente

| ID                    | Archivo                        | Exportación principal | Clasificación               |
| --------------------- | ------------------------------ | --------------------- | --------------------------- |
| `SHELL-UI-SOURCE-001` | `src/components/ui/Button.tsx` | `Button`              | primitiva fuente            |
| `SHELL-UI-SOURCE-002` | `src/components/ui/Card.tsx`   | `Card`                | primitiva fuente            |
| `SHELL-UI-SOURCE-003` | `src/components/ui/Chip.tsx`   | `Chip`                | primitiva fuente            |
| `SHELL-UI-SOURCE-004` | `src/components/ui/Input.tsx`  | `Input`               | primitiva fuente            |
| `SHELL-UI-SOURCE-005` | `src/components/ui/Modal.tsx`  | `Modal`               | primitiva fuente con portal |

No se confirmó un consumidor runtime dentro de las dos páginas actuales. Su clasificación definitiva como activa, compartida, duplicada, legacy o retirable corresponde a `AUTH-UI-026` a `AUTH-UI-029` y `SHELL-AUD-011`.

#### 12. Hallazgos y carryover obligatorio

| ID                          | Hallazgo                                                                                                                  | Tratamiento                                                                        | Propietario y momento                                             |
| --------------------------- | ------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| `SHELL-SURFACE-FINDING-001` | El launcher runtime, la metadata de login y el AppSwitcher template mantienen listas distintas de aplicaciones y estados. | No consolidar aquí; exigir catálogo único versionado.                              | `AUTH-UI-026`, `AUTH-UI-045`, `SHELL-CON-002`; `TREQ-SHELL-028`.  |
| `SHELL-SURFACE-FINDING-002` | `safeReturnTo` admite cualquier URL absoluta HTTP o HTTPS.                                                                | Clasificar como frontera de redirección crítica; permitir solo destinos aprobados. | `AUTH-UI-041`, `AUTH-UI-044`, `AUTH-SRV-*`; `TREQ-SHELL-018`.     |
| `SHELL-SURFACE-FINDING-003` | El middleware excluye todo `/api`, aunque no existen handlers actuales.                                                   | Toda alta futura deberá autoautorizarse y actualizar inventario.                   | `AUTH-UI-042` a `AUTH-UI-045`; `TREQ-SHELL-025`.                  |
| `SHELL-SURFACE-FINDING-004` | “Mi perfil” y “Configuración de usuario” apuntan ambos a `/`.                                                             | No contarlos como pantallas implementadas; resolver o retirar placeholders.        | `AUTH-UI-026` a `AUTH-UI-029`; `TREQ-SHELL-027`.                  |
| `SHELL-SURFACE-FINDING-005` | `metadataBase` usa `hub.ventogroup.co` mientras la superficie productiva canónica es `os.ventogroup.co`.                  | Reconciliar dominio o aprobar alias explícito.                                     | `AUTH-UI-026`, `AUTH-UI-045`; `TREQ-SHELL-026`.                   |
| `SHELL-SURFACE-FINDING-006` | El launcher soporta dos firmas de `has_permission`.                                                                       | Mantener como compatibilidad temporal, no como doble contrato permanente.          | `AUTH-UI-030` a `AUTH-UI-044`, `AUTH-DB-034`; `TREQ-SHELL-015`.   |
| `SHELL-SURFACE-FINDING-007` | La recuperación de SHELL depende del handler web-auth de ANIMA.                                                           | Formalizar contrato, disponibilidad, token y rollback.                             | `AUTH-UI-041`, `AUTH-UI-045`; `TREQ-SHELL-021`, `TREQ-ANIMA-025`. |
| `SHELL-SURFACE-FINDING-008` | El template estándar está acoplado a rutas, permisos y textos de NEXO.                                                    | No tratarlo como estándar transversal sin parametrización.                         | `SHELL-AUD-001` a `SHELL-AUD-011`; `TREQ-SHELL-030`.              |
| `SHELL-SURFACE-FINDING-009` | ProfileMenu template persiste override de rol y sede desde cliente.                                                       | La simulación no concederá autoridad y deberá validarse en servidor.               | `AUTH-SIM-*`, `AUTH-SRV-*`; `TREQ-SHELL-031`.                     |
| `SHELL-SURFACE-FINDING-010` | AppSwitcher template contiene caracteres de reemplazo y estados divergentes.                                              | Bloquear adopción hasta normalizar UTF-8 y catálogo.                               | `SHELL-AUD-001`, `UX-QA-022`; `TREQ-SHELL-035`.                   |
| `SHELL-SURFACE-FINDING-011` | Existen dos familias de primitivas UI dentro del repositorio.                                                             | Clasificar consumidores y duplicación antes de copiar o retirar.                   | `AUTH-UI-026` a `AUTH-UI-029`, `SHELL-AUD-011`; `TREQ-SHELL-032`. |

No queda hallazgo detectado sin requisito, tarea propietaria y momento de resolución.

#### 13. Requisitos de prueba derivados

Se incorporan al registro canónico completo:

```text
TREQ-SHELL-012 a TREQ-SHELL-035
```

| ID               | Regla protegida                                                                                                                                                                                                                                                                                                                        |
| ---------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `TREQ-SHELL-012` | El inventario de SHELL deberá detectar exactamente dos rutas de página runtime, una raíz de layout, una puerta middleware, una superficie de icono generado, cinco superficies interactivas embebidas, siete módulos del template AppShell y cinco primitivas UI fuente, sin confundir componentes o plantillas con rutas desplegadas. |
| `TREQ-SHELL-013` | Cada superficie inventariada deberá conservar identificador estable, categoría, archivo fuente, patrón o condición de exposición y estado runtime o template. Un cambio de archivo, categoría, exposición o commit deberá producir delta explícito.                                                                                    |
| `TREQ-SHELL-014` | La ruta `/` deberá exigir sesión válida, resolver únicamente las aplicaciones declaradas para el launcher y mostrar exactamente cinco tarjetas runtime para VISO, NEXO, FOGO, ORIGO y PULSO en el snapshot aprobado.                                                                                                                   |
| `TREQ-SHELL-015` | La disponibilidad de cada tarjeta del launcher deberá derivarse de una decisión canónica de permiso. La compatibilidad temporal entre las firmas `has_permission(p_permission_code,...)` y `has_permission(p_app_id,p_code,...)` deberá ser explícita, fallar cerrada y retirarse mediante transición versionada.                      |
| `TREQ-SHELL-016` | Una aplicación sin acceso efectivo deberá permanecer no navegable y mostrar estado bloqueado. Alterar HTML, href, estado local o interfaz no deberá permitir la operación protegida en la aplicación destino.                                                                                                                          |
| `TREQ-SHELL-017` | Cerrar sesión desde SHELL deberá invalidar la sesión central aplicable, redirigir al acceso aprobado y evitar que caché, historial, cookies derivadas o aplicaciones consumidoras continúen autorizando con contexto anterior.                                                                                                         |
| `TREQ-SHELL-018` | El parámetro `returnTo` de `/login` deberá aceptar únicamente rutas internas o orígenes Vento OS explícitamente aprobados, normalizados y vinculados al flujo solicitado. URLs absolutas arbitrarias, esquemas no permitidos, credenciales embebidas y dominios no registrados deberán rechazarse.                                     |
| `TREQ-SHELL-019` | La ruta `/login` deberá redirigir una sesión ya válida al destino permitido, conservar metadata coherente con el host aprobado y no exponer formularios ni estados de autenticación cuando el usuario ya esté autenticado.                                                                                                             |
| `TREQ-SHELL-020` | El formulario de acceso deberá manejar envío, espera, errores, límite de intentos y visibilidad de contraseña sin duplicar solicitudes, revelar datos sensibles ni representar como autenticada una sesión fallida.                                                                                                                    |
| `TREQ-SHELL-021` | La recuperación de contraseña iniciada en SHELL deberá usar un destino versionado y aprobado, conservar vínculo con ANIMA web-auth sin dependencia oculta y validar token, expiración, usuario y resultado antes de permitir establecer contraseña.                                                                                    |
| `TREQ-SHELL-022` | El modal de recuperación deberá gestionar apertura, cierre, foco, teclado, envío, confirmación y error de forma accesible; cerrar o reintentar no deberá perder silenciosamente una solicitud confirmada ni duplicar correos.                                                                                                          |
| `TREQ-SHELL-023` | El middleware deberá proteger todas las rutas runtime salvo exclusiones aprobadas y explícitas. Cambios en matcher, prefijos estáticos, login o API deberán producir delta y no podrán abrir una superficie protegida por coincidencia accidental.                                                                                     |
| `TREQ-SHELL-024` | Ante ausencia de cookies Supabase, configuración incompleta, error de autenticación o usuario inválido, el middleware deberá fallar cerrado, limpiar únicamente cookies aplicables y redirigir al acceso central sin bucles ni pérdida de cookies ajenas.                                                                              |
| `TREQ-SHELL-025` | El snapshot aprobado deberá conservar cero route handlers bajo `src/app/api`. Cualquier handler futuro deberá incorporarse al inventario y aplicar autenticación y autorización propias porque el matcher actual excluye `/api`.                                                                                                       |
| `TREQ-SHELL-026` | El layout raíz, metadata, dominio canónico e icono generado deberán identificar la misma aplicación SHELL. `metadataBase`, títulos, iconos y dominio productivo no podrán divergir entre `hub.ventogroup.co` y `os.ventogroup.co` sin alias aprobado.                                                                                  |
| `TREQ-SHELL-027` | Las opciones “Mi perfil” y “Configuración de usuario” no podrán presentarse como capacidades implementadas mientras ambas resuelvan a `/`. Deberán recibir destinos y contratos propios o quedar explícitamente no disponibles.                                                                                                        |
| `TREQ-SHELL-028` | El catálogo de aplicaciones usado por el launcher, metadata de login, template AppSwitcher, navegación runtime y registros canónicos deberá provenir de una única fuente versionada. Cantidades, destinos, estado activo o próximo y nombres no podrán divergir entre listas locales.                                                  |
| `TREQ-SHELL-029` | Los siete módulos de `templates/app-shell-standard` deberán permanecer clasificados como plantilla fuente y no como superficies runtime de SHELL hasta que un consumidor los copie o adopte mediante versión, procedencia y validación explícitas.                                                                                     |
| `TREQ-SHELL-030` | La visibilidad de enlaces del template VentoChrome y AppSwitcher deberá derivarse de permisos y contexto canónicos, pero nunca sustituirá autorización de servidor. Rutas hardcodeadas para NEXO no podrán presentarse como estándar transversal sin parametrización.                                                                  |
| `TREQ-SHELL-031` | La simulación de rol y selección de sede del ProfileMenu template deberán estar separadas de la autoridad real, limitarse a actores permitidos, expirar, auditarse y validarse en servidor. Cookies o escrituras cliente no podrán conceder rol, sede ni permiso efectivo.                                                             |
| `TREQ-SHELL-032` | Las cinco primitivas de `src/components/ui` y los kits `ui.tsx` y `table.tsx` del template deberán reconciliarse como componentes activos, compartidos, duplicados, legacy o sin consumidor antes de retiro o adopción. No se contarán como rutas ni capacidades empresariales.                                                        |
| `TREQ-SHELL-033` | El snapshot aprobado deberá conservar dos patrones estáticos y cero dinámicos. Query parameters como `returnTo`, `email` o `site_id`, estados de modal y tarjetas repetidas no crearán rutas o pantallas adicionales.                                                                                                                  |
| `TREQ-SHELL-034` | Todo enlace absoluto desde SHELL hacia una aplicación deberá corresponder a un dominio y aplicación activos del catálogo canónico, usar transporte seguro y conservar el destino solicitado sin aceptar sustitución por datos del cliente o configuración no gobernada.                                                                |
| `TREQ-SHELL-035` | Textos, etiquetas y estados de las superficies template deberán conservar codificación UTF-8 válida, nombres aprobados y significado consistente. Caracteres corruptos o estados “próximamente” divergentes bloquearán la adopción del template.                                                                                       |

#### 14. Validaciones documentales realizadas

| Control                       | Resultado                                           |
| ----------------------------- | --------------------------------------------------- |
| Base 04A leída completa       | **3.418 requisitos**                                |
| Nuevos requisitos             | **24**                                              |
| Total regenerado              | **3.442**                                           |
| Dominio SHELL                 | **35 requisitos — TREQ-SHELL-001 a TREQ-SHELL-035** |
| Identificadores duplicados    | **0**                                               |
| Filas con catorce columnas    | **3.442 de 3.442**                                  |
| Relaciones TREQ no resolubles | **0**                                               |
| Secuencia SHELL               | **continua, sin saltos**                            |
| Código o Supabase modificado  | **no**                                              |

#### 15. Instrucción de reemplazo

1. Reemplazar exactamente `### [ ] AUTH-UI-008 — Inventariar todas las superficies de SHELL` por este documento completo.
2. Reemplazar completamente `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` por el archivo regenerado entregado con esta tarea.
3. No insertar filas TREQ manualmente.

#### 16. Continuidad aprobada

```text
ÚLTIMA TAREA APROBADA
AUTH-UI-008 — Inventariar todas las superficies de SHELL
        ↓
TAREA ACTUAL
AUTH-UI-009 — Inventariar todas las superficies de PASS y sus fronteras laborales
        ↓
SIGUIENTE TAREA RESERVADA
AUTH-UI-010 — Auditar rutas y superficies actuales de AURA
```

### ✅ AUTH-UI-009 — Inventariar todas las superficies de PASS y sus fronteras laborales

**Estado:** APROBADA
**Fecha de aprobación documental:** 2026-07-28
**Bloque propietario:** BLOQUE I — Navegación, pantallas y autorización de vistas
**Tipo de tarea:** inventario técnico-documental integral de pantallas de cliente, superficies transversales y fronteras laborales relacionadas con PASS; sin cambios de código, Supabase, navegación runtime ni despliegue
**Marcador exacto que reemplaza:** `### [ ] AUTH-UI-009 — Inventariar todas las superficies de PASS y sus fronteras laborales`
**Última tarea aprobada:** `AUTH-UI-008 — Inventariar todas las superficies de SHELL`
**Siguiente tarea reservada:** `AUTH-UI-010 — Auditar rutas y superficies actuales de AURA`

#### 1. Objetivo

Inventariar de forma exhaustiva, reproducible y sin confundir audiencias todas las superficies actuales de PASS. La revisión cubre tres fronteras distintas:

1. las pantallas, gates y superficies globales de la aplicación móvil de cliente `vento-pass`;
2. las superficies laborales embebidas dentro de PASS, separadas de la experiencia de cliente;
3. la superficie operativa de trabajadores en `vento-pulso`, donde caja identifica clientes, otorga puntos y valida redenciones de Vento Pass.

La tarea registra existencia, topología, montaje y evidencia. No convierte PASS en aplicación laboral, no asigna todavía procesos ni propiedad funcional definitiva, no aprueba permisos, no valida RLS o acciones de servidor y no declara una superficie apta para retiro o producción adicional.

#### 2. Fuentes inspeccionadas

| Campo                        | PASS                                                             | PULSO                                      |
| ---------------------------- | ---------------------------------------------------------------- | ------------------------------------------ |
| Repositorio                  | `devVentoGroup/vento-pass`                                       | `devVentoGroup/vento-pulso`                |
| Rama                         | `main`                                                           | `main`                                     |
| Commit inspeccionado         | `b5a4aec908ef12226f798078577ab089a29ccda2`                       | `71e0184486b5fe11e0a42435baf4024807a80efd` |
| Framework                    | Expo 54, React Native 0.81.5 y React Navigation Native Stack     | Next.js 16 y App Router                    |
| Entrada principal            | `App.js`                                                         | `src/app/`                                 |
| Superficie laboral principal | bloques embebidos de `Header.tsx`                                | `/scanner`                                 |
| Base TREQ                    | registro `04A` con 3.442 requisitos y última tarea `AUTH-UI-008` | mismo registro canónico                    |
| Cambios ejecutados           | ninguno                                                          | ninguno                                    |

#### 3. Frontera obligatoria

```text
PANTALLA DE CLIENTE PASS
≠ SUPERFICIE LABORAL EMBEBIDA
≠ PERFIL LABORAL
≠ SIMULACIÓN DE ROL O SEDE
≠ AUTORIDAD REAL

RUTA PULSO /scanner
≠ PANTALLA MÓVIL PASS
≠ MODO IDENTIFICACIÓN
≠ MODO REDENCIÓN
≠ ACCIÓN DE SERVIDOR
≠ COMPONENTE DE CÁMARA NO MONTADO
```

| Decisión posterior                                                        | Tarea propietaria             |
| ------------------------------------------------------------------------- | ----------------------------- |
| Asignar `process_id` y `process_step`                                     | `AUTH-UI-011` y `AUTH-UI-012` |
| Definir propietaria y consumidoras                                        | `AUTH-UI-013` y `AUTH-UI-014` |
| Clasificar audiencia, actor, dispositivo, frecuencia y acciones           | `AUTH-UI-015` a `AUTH-UI-025` |
| Resolver duplicación, legacy, componentes dormantes y retiro              | `AUTH-UI-026` a `AUTH-UI-029` |
| Aprobar lectura, mutación, contexto, URL directa y protección de servidor | `AUTH-UI-030` a `AUTH-UI-044` |
| Reconciliar registro y navegación unificada                               | `AUTH-UI-045`                 |

#### 4. Método de inventario

1. `App.js`, sus retornos previos a navegación, el stack, modales globales y límites de error se inventarían por separado; el stack también permite comprobar si existe una ruta laboral dedicada.
2. Un bloque visual solo se clasifica como laboral cuando depende del perfil, rol, sede o actuación de un trabajador.
3. Hooks, contextos y catálogos se registran como soporte no visual y no incrementan el conteo de superficies runtime.
4. En PULSO, `/scanner` se registra como una ruta y sus modos, formularios y estados como superficies subordinadas de la misma página.
5. Las acciones de servidor se registran como fronteras técnicas, no como vistas.
6. Un componente presente en código pero no importado por la ruta activa se clasifica como dormante.
7. Ocultar un control, seleccionar un rol en cliente o exigir un PIN visual no se presenta como autorización definitiva.
8. Todo hallazgo queda ligado a un requisito y a tareas posteriores; no quedan pendientes narrativos sin propietario.

#### 5. Resumen reconciliado

| Métrica                                           | Resultado |
| ------------------------------------------------- | --------: |
| Pantallas declaradas en el stack de PASS          |    **15** |
| Superficies de cliente y transversales de PASS    |    **21** |
| Rutas exclusivamente laborales dentro de PASS     |     **0** |
| Superficies laborales runtime embebidas en PASS   |     **3** |
| Módulos laborales de soporte no visual en PASS    |     **4** |
| Rutas PULSO activas relacionadas con PASS         |     **1** |
| Superficies runtime dentro de `/scanner`          |     **7** |
| Modos funcionales dentro de `/scanner`            |     **2** |
| Fronteras de acción de servidor relacionadas      |     **3** |
| Componentes de cámara presentes pero no montados  |     **1** |
| Superficies laborales runtime relacionadas, total |    **10** |
| Superficies AS-IS incorporadas a AUTH-UI-011      |    **31** |
| Requisitos nuevos                                 |    **30** |

#### 6. `PASS-CUSTOMER-SURFACE-INVENTORY-001`

Las siguientes 21 unidades son superficies lógicas AS-IS. Las primeras quince corresponden exactamente a los `Stack.Screen` montados por `App.js`; las restantes cubren acceso, perfil, QR, actualización, gates de runtime y recuperación. Los estados puramente decorativos internos no se convierten en vistas adicionales.

| ID | Tipo | Superficie | Archivo fuente | Comportamiento observado | Frontera | Límite documental |
| --- | --- | --- | --- | --- | --- | --- |
| `PASS-CUSTOMER-SURFACE-001` | `PRE_NAVIGATION_GATE` | `Auth — acceso del cliente` | `src/components/Auth.tsx` | Autenticar o recuperar la sesión del cliente | Frontera transversal de SHELL | Existencia AS-IS; proceso, propiedad y clasificación se fijan en AUTH-UI-011 a AUTH-UI-015. |
| `PASS-CUSTOMER-SURFACE-002` | `PRE_NAVIGATION_GATE` | `CompleteProfile — completar perfil` | `src/components/CompleteProfile.tsx` | Completar el perfil personal requerido | Experiencia personal del cliente | Existencia AS-IS; proceso, propiedad y clasificación se fijan en AUTH-UI-011 a AUTH-UI-015. |
| `PASS-CUSTOMER-SURFACE-003` | `STACK_SCREEN` | `Home — inicio del cliente` | `src/components/Home.tsx` | Presentar inicio, identidad, puntos, beneficios y accesos personales | Experiencia personal del cliente | Existencia AS-IS; proceso, propiedad y clasificación se fijan en AUTH-UI-011 a AUTH-UI-015. |
| `PASS-CUSTOMER-SURFACE-004` | `STACK_SCREEN_FEATURE_FLAG` | `Club — beneficios y recompensas` | `src/components/ClubScreen.tsx` | Consultar beneficios, recompensas y condiciones vigentes | Experiencia personal del cliente | Existencia AS-IS; proceso, propiedad y clasificación se fijan en AUTH-UI-011 a AUTH-UI-015. |
| `PASS-CUSTOMER-SURFACE-005` | `STACK_SCREEN_FEATURE_FLAG` | `MyOrders — pedidos propios` | `src/components/MyOrdersScreen.tsx` | Consultar pedidos propios y sus estados | Experiencia personal del cliente | Existencia AS-IS; proceso, propiedad y clasificación se fijan en AUTH-UI-011 a AUTH-UI-015. |
| `PASS-CUSTOMER-SURFACE-006` | `STACK_SCREEN_FEATURE_FLAG` | `ChooseSatellite — selección de marca o sede` | `src/components/ChooseSatelliteScreen.tsx` | Seleccionar el contexto de compra del cliente | Experiencia personal del cliente | Existencia AS-IS; proceso, propiedad y clasificación se fijan en AUTH-UI-011 a AUTH-UI-015. |
| `PASS-CUSTOMER-SURFACE-007` | `STACK_SCREEN_FEATURE_FLAG` | `DeliveryAddresses — direcciones de entrega` | `src/components/DeliveryAddressesScreen.tsx` | Gestionar direcciones y seleccionar modalidad de entrega | Experiencia personal del cliente | Existencia AS-IS; proceso, propiedad y clasificación se fijan en AUTH-UI-011 a AUTH-UI-015. |
| `PASS-CUSTOMER-SURFACE-008` | `STACK_SCREEN` | `AccountSettings — cuenta y privacidad` | `src/components/settings/AccountSettings.tsx` | Gestionar perfil, preferencias y datos personales | Experiencia personal del cliente | Existencia AS-IS; proceso, propiedad y clasificación se fijan en AUTH-UI-011 a AUTH-UI-015. |
| `PASS-CUSTOMER-SURFACE-009` | `STACK_SCREEN_FEATURE_FLAG` | `VentoCafe — experiencia de marca` | `src/components/VentoCafe.tsx` | Consultar experiencia, oferta y contenido comercial publicado | Experiencia personal del cliente | Existencia AS-IS; proceso, propiedad y clasificación se fijan en AUTH-UI-011 a AUTH-UI-015. |
| `PASS-CUSTOMER-SURFACE-010` | `STACK_SCREEN_FEATURE_FLAG` | `Saudo — experiencia de marca` | `src/components/Saudo.tsx` | Consultar experiencia, oferta y contenido comercial publicado | Experiencia personal del cliente | Existencia AS-IS; proceso, propiedad y clasificación se fijan en AUTH-UI-011 a AUTH-UI-015. |
| `PASS-CUSTOMER-SURFACE-011` | `STACK_SCREEN` | `SatelliteExperience — hub de experiencias` | `src/components/SatelliteHub.tsx` | Consultar experiencia, oferta y contenido comercial publicado | Experiencia personal del cliente | Existencia AS-IS; proceso, propiedad y clasificación se fijan en AUTH-UI-011 a AUTH-UI-015. |
| `PASS-CUSTOMER-SURFACE-012` | `STACK_SCREEN` | `SatellitePass — experiencia de sede` | `src/components/SatelliteExperience.tsx` | Consultar experiencia, oferta y contenido comercial publicado | Experiencia personal del cliente | Existencia AS-IS; proceso, propiedad y clasificación se fijan en AUTH-UI-011 a AUTH-UI-015. |
| `PASS-CUSTOMER-SURFACE-013` | `STACK_SCREEN_FEATURE_FLAG` | `OrderHome — entrada al portal de compras` | `src/components/OrderHome.tsx` | Entrar al portal de compras y seleccionar contexto | Experiencia personal del cliente | Existencia AS-IS; proceso, propiedad y clasificación se fijan en AUTH-UI-011 a AUTH-UI-015. |
| `PASS-CUSTOMER-SURFACE-014` | `STACK_SCREEN_FEATURE_FLAG` | `OrderMenu — menú y configuración del pedido` | `src/components/OrderMenu.tsx` | Consultar oferta y configurar el carrito del pedido | Experiencia personal del cliente | Existencia AS-IS; proceso, propiedad y clasificación se fijan en AUTH-UI-011 a AUTH-UI-015. |
| `PASS-CUSTOMER-SURFACE-015` | `STACK_SCREEN_FEATURE_FLAG` | `OrderCheckout — revisión e inicio de pago` | `src/components/OrderCheckout.tsx` | Revisar el pedido e iniciar el pago | Experiencia personal del cliente | Existencia AS-IS; proceso, propiedad y clasificación se fijan en AUTH-UI-011 a AUTH-UI-015. |
| `PASS-CUSTOMER-SURFACE-016` | `STACK_SCREEN_FEATURE_FLAG_DEEP_LINK` | `OrderPlaced — confirmación y retorno de pago` | `src/components/OrderPlacedScreen.tsx` | Presentar confirmación del pedido y resultado de pago | Experiencia personal del cliente | Existencia AS-IS; proceso, propiedad y clasificación se fijan en AUTH-UI-011 a AUTH-UI-015. |
| `PASS-CUSTOMER-SURFACE-017` | `STACK_SCREEN_FEATURE_FLAG` | `OrderChat — comunicación del pedido` | `src/components/OrderChatScreen.tsx` | Intercambiar mensajes vinculados con un pedido | Experiencia personal del cliente | Existencia AS-IS; proceso, propiedad y clasificación se fijan en AUTH-UI-011 a AUTH-UI-015. |
| `PASS-CUSTOMER-SURFACE-018` | `GLOBAL_MODAL` | `QrModal — identificación personal` | `src/components/home/QrModal.tsx` | Presentar identificación QR personal del cliente | Experiencia personal del cliente | Existencia AS-IS; proceso, propiedad y clasificación se fijan en AUTH-UI-011 a AUTH-UI-015. |
| `PASS-CUSTOMER-SURFACE-019` | `GLOBAL_RECOVERY_SURFACE` | `AppUpdateGate — compatibilidad de versión` | `src/components/AppUpdateGate.js` | Bloquear o advertir actualización de la aplicación | Frontera transversal de SHELL | Existencia AS-IS; proceso, propiedad y clasificación se fijan en AUTH-UI-011 a AUTH-UI-015. |
| `PASS-CUSTOMER-SURFACE-020` | `GLOBAL_STATE_SURFACE` | `App runtime gates — carga, configuración y perfil` | `App.js` | Presentar carga, configuración incompleta, validación o error de perfil | Frontera transversal de SHELL | Existencia AS-IS; proceso, propiedad y clasificación se fijan en AUTH-UI-011 a AUTH-UI-015. |
| `PASS-CUSTOMER-SURFACE-021` | `GLOBAL_RECOVERY_SURFACE` | `AppErrorBoundary — recuperación de error` | `src/components/AppErrorBoundary.js` | Recuperar la experiencia después de un error no controlado | Frontera transversal de SHELL | Existencia AS-IS; proceso, propiedad y clasificación se fijan en AUTH-UI-011 a AUTH-UI-015. |

Los quince nombres de stack quedan congelados por el validador local contra `vento-pass/App.js`. Agregar, retirar o renombrar un `Stack.Screen` obliga a actualizar este inventario y las matrices `AUTH-UI-011` a `AUTH-UI-015`.

#### 7. `PASS-LABOR-SURFACE-INVENTORY-001`

| ID                       | Tipo               | Archivo fuente                   | Exposición                        | Comportamiento observado                                 | Condición observada                                                 | Límite documental                                                          |
| ------------------------ | ------------------ | -------------------------------- | --------------------------------- | -------------------------------------------------------- | ------------------------------------------------------------------- | -------------------------------------------------------------------------- |
| `PASS-LABOR-SURFACE-001` | `EMBEDDED_CONTEXT` | `src/components/home/Header.tsx` | bloque dentro del menú de usuario | muestra rol activo y sede activa                         | existe perfil laboral y el rol local pertenece a `PRIVILEGED_ROLES` | No prueba autorización, vigencia laboral ni contexto efectivo de servidor. |
| `PASS-LABOR-SURFACE-002` | `EMBEDDED_ACTIONS` | `src/components/home/Header.tsx` | acciones del menú                 | abre cambio de rol o sede y permite restablecer rol real | misma condición privilegiada local                                  | No es una ruta ni una capacidad laboral autónoma.                          |
| `PASS-LABOR-SURFACE-003` | `MODAL_SIMULATION` | `src/components/home/Header.tsx` | modal “Modo de prueba”            | selecciona rol y sede y muestra estado simulado          | `canSwitchRole` calculado en cliente                                | La simulación local no puede conceder autoridad real.                      |

El stack principal registra quince pantallas de cliente y comercio inventariadas en `PASS-CUSTOMER-SURFACE-INVENTORY-001`, pero no una pantalla dedicada a trabajo, administración laboral o caja. `Home` sigue siendo una pantalla de cliente aunque incorpore estos tres bloques condicionales.

#### 8. `PASS-LABOR-SUPPORT-REGISTER-001`

| ID                       | Clasificación    | Archivo                                | Función observada                                                         | Estado                                             |
| ------------------------ | ---------------- | -------------------------------------- | ------------------------------------------------------------------------- | -------------------------------------------------- |
| `PASS-LABOR-SUPPORT-001` | `DATA_RESOLVER`  | `src/hooks/useEmployeeProfile.ts`      | consulta `employees` para el usuario autenticado                          | soporte no visual activo                           |
| `PASS-LABOR-SUPPORT-002` | `DATA_RESOLVER`  | `src/hooks/useEmployeeSites.ts`        | consulta asignaciones activas y sede fallback                             | soporte no visual activo                           |
| `PASS-LABOR-SUPPORT-003` | `CLIENT_CONTEXT` | `src/contexts/RoleOverrideContext.tsx` | persiste rol y sede simulados en `AsyncStorage` bajo `vento.roleOverride` | soporte no visual activo                           |
| `PASS-LABOR-SUPPORT-004` | `LOCAL_CATALOG`  | `src/constants/roles.ts`               | mantiene etiquetas, opciones y roles privilegiados locales                | soporte no visual activo; reconciliación pendiente |

Estos módulos no son vistas. Su existencia explica cómo aparecen las superficies laborales de `Header`, pero no incrementa el conteo de rutas ni autoriza operaciones.

#### 9. Topología móvil de PASS y ausencia de ruta laboral dedicada

`App.js` utiliza React Navigation Native Stack, no Expo Router. El stack contiene `Home`, `AccountSettings`, experiencias de marca y pantallas de compra condicionadas por feature flags. Los deep links explícitos son raíz, `orders` y `payment-return`.

```text
sesión válida + perfil cliente completo
→ Home
→ Home consulta opcionalmente employees y employee_sites
→ si existe rol local privilegiado
→ Header expone contexto y simulación laboral embebidos
```

No se registra una ruta laboral independiente porque el contexto laboral aparece dentro de `Home` y no como `Stack.Screen` propio.

#### 10. `PULSO-PASS-LABOR-SURFACE-INVENTORY-001`

| ID                       | Tipo                      | Patrón o estado      | Archivo fuente                              | Comportamiento observado                           | Protección observada                             | Límite documental                                         |
| ------------------------ | ------------------------- | -------------------- | ------------------------------------------- | -------------------------------------------------- | ------------------------------------------------ | --------------------------------------------------------- |
| `PULSO-PASS-SURFACE-001` | `PAGE`                    | `/scanner`           | `src/app/scanner/page.tsx`                  | contenedor de identificación, puntos y redenciones | sesión, `pulso`, sede y permiso local `pos.main` | El permiso exacto por acción queda pendiente.             |
| `PULSO-PASS-SURFACE-002` | `MODE`                    | `identification`     | `src/modules/pos/components/qr-scanner.tsx` | procesa Vento ID o UUID para identificar cliente   | acción de servidor y sede recibida               | No autoriza automáticamente otorgar puntos.               |
| `PULSO-PASS-SURFACE-003` | `STATE_CARD`              | cliente seleccionado | `src/modules/pos/components/qr-scanner.tsx` | muestra nombre, correo y saldo de puntos           | resultado de identificación                      | Proyección y minimización quedan pendientes.              |
| `PULSO-PASS-SURFACE-004` | `MUTATION_FORM`           | otorgar puntos       | `src/modules/pos/components/qr-scanner.tsx` | captura monto, estima puntos y confirma            | cliente identificado y acción de servidor        | La estimación de interfaz no es resultado contable.       |
| `PULSO-PASS-SURFACE-005` | `MODE`                    | `redemption`         | `src/modules/pos/components/qr-scanner.tsx` | valida un código de canje                          | acción de servidor                               | Debe diferenciar pendiente, usado, cancelado y vencido.   |
| `PULSO-PASS-SURFACE-006` | `SHARED_DEVICE_SIGNATURE` | `sharedActorPin`     | `src/modules/pos/components/qr-scanner.tsx` | solicita PIN cuando la sesión es compartida        | `operationalSession.isSharedDevice`              | El campo visual no acredita validación integral.          |
| `PULSO-PASS-SURFACE-007` | `FEEDBACK_STATE`          | carga, éxito y error | `src/modules/pos/components/qr-scanner.tsx` | comunica procesamiento y resultado                 | estado local derivado de respuestas              | No debe anticipar éxito ni ocultar duplicado o conflicto. |

Identificación y redención son modos de una misma ruta. No se contabilizan como páginas separadas.

#### 11. Fronteras técnicas relacionadas

| ID                       | Función                    | Archivo                                                 | Clasificación                                   |
| ------------------------ | -------------------------- | ------------------------------------------------------- | ----------------------------------------------- |
| `PULSO-PASS-ACTION-001`  | `identifyClientAction`     | `src/modules/pos/actions/identify-client.action.ts`     | acción de servidor, no superficie               |
| `PULSO-PASS-ACTION-002`  | `awardLoyaltyPointsAction` | `src/modules/pos/actions/award-loyalty.action.ts`       | acción de servidor, no superficie               |
| `PULSO-PASS-ACTION-003`  | `processRedemptionAction`  | `src/modules/pos/actions/validate-redemption.action.ts` | acción de servidor, no superficie               |
| `PULSO-PASS-DORMANT-001` | `CameraQRScanner`          | `src/modules/pos/components/camera-qr-scanner.tsx`      | componente fuente no montado por la ruta actual |

El flujo runtime comprobado usa ingreso manual o lector USB. La existencia del componente de cámara no permite declarar que la cámara esté disponible en la superficie actual.

#### 12. Hallazgos y cierre de brechas

| ID                       | Hallazgo                                                                            | Tratamiento obligatorio                                                                          | Propietario documental                                                                          |
| ------------------------ | ----------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------- |
| `PASS-LABOR-FINDING-001` | Una aplicación de cliente consulta identidad y sedes laborales.                     | Mantener separación de audiencias, proyección mínima y fallback no privilegiado.                 | `AUTH-UI-014`, `AUTH-UI-020`, `AUTH-UI-030` a `AUTH-UI-044`; `TREQ-PASS-015` a `TREQ-PASS-018`. |
| `PASS-LABOR-FINDING-002` | PASS persiste simulación de rol y sede en AsyncStorage.                             | Tratarla como simulación sin autoridad, con expiración, auditoría y limpieza.                    | `AUTH-SIM-*`; `TREQ-PASS-019`, `TREQ-PASS-020`.                                                 |
| `PASS-LABOR-FINDING-003` | El catálogo local de roles usa claves legacy inglesas y una lista propia.           | Reconciliarlo con el catálogo canónico antes de usarlo para autorización.                        | `AUTH-CAT-*`, `AUTH-UI-026`, `AUTH-UI-045`; `TREQ-PASS-021`.                                    |
| `PASS-LABOR-FINDING-004` | `/scanner` protege el conjunto con `pos.main`.                                      | Descomponer permisos exactos para identificar, otorgar puntos y validar redención.               | `AUTH-UI-030` a `AUTH-UI-044`, `PULSO-AUTH-016`; `TREQ-PASS-022`.                               |
| `PASS-LABOR-FINDING-005` | La tarjeta operativa muestra nombre, email y puntos.                                | Aprobar una proyección mínima por finalidad y limpiar estado al terminar.                        | `PASS-INT-004`, `AUTH-QA-030`; `TREQ-PASS-023`, `TREQ-PASS-024`.                                |
| `PASS-LABOR-FINDING-006` | La referencia de acumulación se genera con timestamp y aleatoriedad en la interfaz. | Sustituirla por idempotencia empresarial estable y validada por servidor.                        | `PASS-INT-005`, `QUEUE-ARC-*`; `TREQ-PASS-025`, `TREQ-PASS-026`.                                |
| `PASS-LABOR-FINDING-007` | El PIN aparece solo para dispositivo compartido.                                    | Vincular actor humano, principal técnico, dispositivo, sede y resultado; proteger el secreto.    | `AUTH-DEV-*`, `AUTH-SRV-*`; `TREQ-PASS-029`, `TREQ-PASS-030`.                                   |
| `PASS-LABOR-FINDING-008` | Existe un componente de cámara que no participa en la ruta actual.                  | Mantenerlo como dormante hasta montaje, permiso, pruebas físicas y actualización del inventario. | `AUTH-UI-026` a `AUTH-UI-029`, `UX-STATION-*`; `TREQ-PASS-031`.                                 |

No queda hallazgo detectado sin requisito, tarea propietaria y momento de resolución.

#### 13. Requisitos de prueba derivados

Se incorporan al registro canónico completo:

```text
TREQ-PASS-013 a TREQ-PASS-042
```

| ID              | Regla protegida                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `TREQ-PASS-013` | El inventario laboral relacionado con PASS deberá detectar exactamente tres superficies laborales embebidas activas en la aplicación móvil PASS, siete superficies runtime en la operación PULSO asociada a PASS, cuatro módulos de soporte no visuales, tres fronteras de acción de servidor y un componente de cámara presente pero no montado, sin convertir pantallas de cliente, hooks, acciones o código dormante en rutas laborales adicionales. |
| `TREQ-PASS-014` | Cada superficie laboral relacionada con PASS deberá conservar identificador estable, repositorio, archivo fuente, categoría, condición de exposición, actor observado y estado runtime, soporte o dormante. Un cambio de archivo, montaje, feature flag, condición de rol, ruta, deep link o commit deberá generar un delta explícito.                                                                                                                  |
| `TREQ-PASS-015` | PASS deberá conservar cero rutas de navegación exclusivamente laborales en el stack móvil mientras el snapshot aprobado no incorpore una. La presencia de perfil de empleado, rol, sede o simulación dentro de Home no convertirá una pantalla de cliente en aplicación laboral ni habilitará acciones operativas no declaradas.                                                                                                                        |
| `TREQ-PASS-016` | El bloque laboral del menú de PASS solo deberá mostrarse cuando el principal autenticado resuelva un perfil laboral vigente y una capacidad aprobada para consultar contexto. La ausencia, error o retiro del perfil deberá ocultar controles laborales sin afectar la experiencia normal de cliente.                                                                                                                                                   |
| `TREQ-PASS-017` | La consulta de perfil laboral desde PASS deberá estar vinculada al usuario autenticado y devolver únicamente identificador, rol necesario, sede base y nombre mínimo. No podrá consultar perfiles de terceros, usar datos cliente para elevar rol ni tratar una fila ausente como autorización laboral.                                                                                                                                                 |
| `TREQ-PASS-018` | La lista de sedes laborales visible en PASS deberá contener únicamente asignaciones activas y autorizadas del trabajador, identificar la primaria y resolver cualquier fallback contra una sede permitida. Una sede inactiva, ajena o enviada por el cliente no podrá incorporarse al selector ni convertirse en contexto efectivo.                                                                                                                     |
| `TREQ-PASS-019` | El cambio de rol o sede almacenado por PASS deberá ser exclusivamente una simulación visible y separada de la autoridad real. AsyncStorage, estado React, selección local, texto de rol o sede y navegación cliente no podrán conceder permisos, ampliar datos, firmar acciones ni modificar contexto de servidor.                                                                                                                                      |
| `TREQ-PASS-020` | Toda simulación laboral en PASS deberá exigir actor autorizado, mostrar aviso persistente, registrar rol y sede reales y simulados, tener expiración y salida explícita, limpiarse al cerrar sesión o perder vínculo y bloquear mutaciones críticas. Una reinstalación, actualización, cambio de usuario o recuperación de caché no podrá reactivar una simulación perteneciente a otro contexto.                                                       |
| `TREQ-PASS-021` | Los roles locales de PASS deberán reconciliarse con el catálogo canónico de Vento OS. Alias ingleses, opciones omitidas, roles legacy y etiquetas humanas no podrán utilizarse como claves definitivas de autorización ni permitir simulaciones incompatibles con sede, área o modalidad laboral.                                                                                                                                                       |
| `TREQ-PASS-022` | La superficie PULSO `/scanner` relacionada con PASS deberá exigir sesión válida, acceso a PULSO, sede efectiva y permisos exactos por acción. El permiso general `pos.main` no podrá autorizar por sí solo identificación de cliente, otorgamiento de puntos y validación de redenciones cuando estas acciones requieran capacidades distintas.                                                                                                         |
| `TREQ-PASS-023` | La identificación de cliente en PULSO deberá aceptar únicamente formatos canónicos de Vento ID, resolver la identidad en servidor, limitarse a la sede y finalidad operativa y devolver una proyección mínima. Códigos desconocidos, manipulados, reutilizados con otra semántica o pertenecientes a otra entidad deberán fallar cerrados.                                                                                                              |
| `TREQ-PASS-024` | La tarjeta operativa de cliente en PULSO deberá mostrar solo los campos necesarios para la acción autorizada. Nombre, correo y saldo de puntos tendrán finalidad, enmascaramiento, territorio y retención definidos; no se permitirá búsqueda masiva, copia lateral ni persistencia del perfil después de limpiar, cambiar de cliente, cerrar sesión o expirar la operación.                                                                            |
| `TREQ-PASS-025` | Otorgar puntos desde PULSO deberá ejecutarse mediante comando de servidor autorizado, territorial, atómico e idempotente que valide cliente, compra elegible, monto, moneda, reglas vigentes, actor, dispositivo y referencia externa. El saldo y ledger deberán confirmarse juntos y una respuesta perdida o reintento no podrá duplicar puntos.                                                                                                       |
| `TREQ-PASS-026` | La idempotency key o referencia externa para otorgar puntos no podrá depender únicamente de `Date.now`, `Math.random`, identificadores truncados ni estado de interfaz. Deberá provenir de la transacción empresarial o de un identificador estable emitido y validado por servidor, y reutilizarse ante reintento del mismo hecho.                                                                                                                     |
| `TREQ-PASS-027` | Validar una redención desde PULSO deberá comprobar código, usuario, recompensa, sede, estado pendiente, vigencia, saldo ya debitado o reservado, actor efectivo y no utilización previa. La transición a usada deberá ser atómica e idempotente y conservar evidencia; códigos usados, cancelados, vencidos o de otra sede deberán rechazarse sin efectos.                                                                                              |
| `TREQ-PASS-028` | Identificación y redención deberán permanecer registradas como dos modos subordinados de una sola ruta `/scanner` mientras compartan el mismo contenedor runtime. Cambiar de modo deberá limpiar código, cliente, monto y mensajes incompatibles sin crear rutas ficticias ni conservar estado de la operación anterior.                                                                                                                                |
| `TREQ-PASS-029` | En dispositivo compartido, toda mutación de puntos o redención deberá exigir firma del trabajador real antes del comando y vincular principal técnico, actor humano, dispositivo, sede, permiso y resultado. La sesión administrativa del dispositivo no podrá transferir sus privilegios al cajero que firma.                                                                                                                                          |
| `TREQ-PASS-030` | La firma o PIN del trabajador en PULSO deberá capturarse como secreto efímero, no mostrarse, persistirse, reutilizarse ni incluirse en logs, métricas o mensajes. Deberá aplicar límites de intentos, bloqueo, rotación y respuesta uniforme, y limpiarse después de éxito, error, cambio de cliente, cambio de modo o expiración.                                                                                                                      |
| `TREQ-PASS-031` | El componente `CameraQRScanner` deberá permanecer clasificado como fuente no montada y no como superficie runtime mientras `/scanner` no lo importe ni exponga. Su futura activación exigirá inventario, permiso de cámara, selección de dispositivo, privacidad, fallback, pruebas físicas y actualización de conteos antes de presentarse como disponible.                                                                                            |
| `TREQ-PASS-032` | Los estados de procesamiento, éxito y error de la superficie PULSO-PASS deberán corresponder al resultado confirmado de servidor. La interfaz no mostrará cliente identificado, puntos otorgados o canje validado antes de confirmar el efecto, y distinguirá error recuperable, duplicado, conflicto, denegación y resultado ya aplicado.                                                                                                              |
| `TREQ-PASS-033` | Los módulos laborales de soporte dentro de PASS deberán fallar cerrados y aislarse de la experiencia de cliente. Un error al leer `employees`, `employee_sites`, rol local o override no podrá impedir acceso de cliente válido, exponer datos laborales, conservar simulación obsoleta ni degradarse a privilegios por defecto.                                                                                                                        |
| `TREQ-PASS-034` | El registro unificado deberá reconciliar las superficies laborales embebidas de PASS con la ruta operativa PULSO `/scanner`, sus modos y acciones, sin duplicarlas como pantallas PASS ni atribuir a PASS mutaciones propietarias de PULSO. Propiedad, consumo, procesos, actores, permisos y protección de servidor se completarán en las tareas posteriores del BLOQUE I.                                                                             |
| `TREQ-PASS-035` | El inventario integral de PASS deberá contener exactamente quince pantallas declaradas en `App.js` y veintiuna superficies lógicas de cliente o transversales, además de las diez superficies laborales relacionadas ya registradas, sin confundir rutas de cliente, gates, modales, estados globales ni operación PULSO.                                                                                                                        |
| `TREQ-PASS-036` | Los nombres `Home`, `Club`, `MyOrders`, `ChooseSatellite`, `DeliveryAddresses`, `AccountSettings`, `VentoCafe`, `Saudo`, `SatelliteExperience`, `SatellitePass`, `OrderHome`, `OrderMenu`, `OrderCheckout`, `OrderPlaced` y `OrderChat` deberán coincidir con los `Stack.Screen` reales; agregar, retirar o renombrar uno obligará a reconciliar AUTH-UI-009 a AUTH-UI-015 antes de compilar. |
| `TREQ-PASS-037` | El portal de compras de PASS deberá conservar inventariadas selección de marca o sede, direcciones, entrada de compra, menú, checkout, confirmación, pedidos y chat aunque su montaje dependa de `SHOW_PURCHASE_FEATURES`; un feature flag desactivado no autoriza borrar la superficie ni presentarla como inexistente.                                                                                                                          |
| `TREQ-PASS-038` | `Auth`, `CompleteProfile`, `QrModal`, `AppUpdateGate`, los gates de runtime y `AppErrorBoundary` deberán registrarse como superficies lógicas distintas de los quince `Stack.Screen`, sin convertir indicadores decorativos, hooks, providers o estados internos sin interacción propia en vistas adicionales.                                                                                                                                    |
| `TREQ-PASS-039` | `QrModal` deberá permanecer vinculada a la identificación personal gobernada por PASS y no confundirse con la identificación o redención operativa ejecutada por PULSO; presentar un QR personal no autoriza acumulación, canje, venta ni acceso laboral.                                                                                                                                                                                            |
| `TREQ-PASS-040` | Las veintiuna superficies de cliente o transversales de PASS deberán permanecer fuera de la clasificación de operación interna de primera línea; compra, autoservicio y seguimiento del cliente no deberán inferir turno, rol operativo, dispositivo compartido ni permiso laboral.                                                                                                                                                                  |
| `TREQ-PASS-041` | Las superficies AS-IS de PASS podrán reconciliarse con una o varias identidades canónicas `VSCREEN-*`, pero no se asumirá equivalencia uno a uno: las identidades futuras de reclamos, reservas, satisfacción, notificaciones o seguimiento no se presentarán como implementadas mientras no exista superficie runtime verificable.                                                                                                                   |
| `TREQ-PASS-042` | La validación local deberá comparar `vento-pass/App.js` con el inventario congelado cuando el repositorio hermano esté disponible y fallar ante deriva; en CI aislado deberá validar matrices, identificadores, conteos, invariantes y huellas sin depender de checkouts externos.                                                                                                                                                                     |

#### 14. Huellas de la línea base

```text
PASS_RUNTIME_SHA256 = 79a1806c023ad40a43161884aaeb38351372c20e600cda637d9aca06c2d03123
PASS_SUPPORT_SHA256 = 02c40c84ee81a1bd400c9e6960f671144fcc72bddf5fc13125e7e96b4b57eb6d
PULSO_RUNTIME_SHA256 = b549d14f061aa669c1344d8f768a01e27922e4468f1302112dd425886c5a4e2f
ACTION_BOUNDARIES_SHA256 = 0bb048b3bdc03fcf27aaaf473ad0b97e5ed51966b26eb123a4ed8740a988eb36
DORMANT_COMPONENT_SHA256 = efcd1c55d707ac985ce8fbc06b28137db069f0995ea393da29ad1524bd3e9d32
COMBINED_INVENTORY_SHA256 = bafeda6f59649ebebba4708be132c0555b8ecd48b625781ac0355521b6efc737
```

#### 15. Criterios de aceptación

- [x] PASS conserva cero rutas exclusivamente laborales y tres superficies laborales embebidas.
- [x] Los cuatro módulos de soporte laboral de PASS están separados del conteo runtime.
- [x] PULSO conserva una ruta relacionada con PASS y siete superficies subordinadas dentro de ella.
- [x] Identificación y redención se registran como modos, no como rutas duplicadas.
- [x] Las tres acciones de servidor están registradas como fronteras técnicas, no como vistas.
- [x] `CameraQRScanner` permanece clasificado como componente no montado.
- [x] La simulación local no se presenta como autoridad real.
- [x] Los hallazgos tienen requisito, tarea propietaria y momento de resolución.
- [x] Se incorporan `TREQ-PASS-013` a `TREQ-PASS-042` sin modificar requisitos históricos.
- [x] No se implementa código, navegación runtime, migración, Supabase ni despliegue.

#### 16. Validaciones documentales realizadas

| Control                       | Resultado                                         |
| ----------------------------- | ------------------------------------------------- |
| Base 04A leída completa       | **3.442 requisitos**                              |
| Nuevos requisitos             | **30**                                            |
| Total regenerado              | **3.472**                                         |
| Dominio PASS                  | **42 requisitos — TREQ-PASS-001 a TREQ-PASS-042** |
| Identificadores duplicados    | **0**                                             |
| Filas con catorce columnas    | **3.472 de 3.472**                                |
| Relaciones TREQ no resolubles | **0**                                             |
| Secuencia PASS                | **continua, sin saltos**                          |
| Código o Supabase modificado  | **no**                                            |

#### 17. Instrucción de reemplazo

1. Reemplazar exactamente `### [ ] AUTH-UI-009 — Inventariar todas las superficies de PASS y sus fronteras laborales` por este documento completo.
2. Reemplazar completamente `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` por el archivo regenerado entregado con esta tarea.
3. No insertar filas TREQ manualmente.

#### 18. Continuidad aprobada

```text
ÚLTIMA TAREA APROBADA
AUTH-UI-009 — Inventariar todas las superficies de PASS y sus fronteras laborales
        ↓
TAREA ACTUAL
AUTH-UI-010 — Auditar rutas y superficies actuales de AURA
        ↓
SIGUIENTE TAREA RESERVADA
AUTH-UI-011 — Asignar process_id a cada vista
```


### ✅ AUTH-UI-010 — Auditar rutas y superficies actuales de AURA

**Estado:** APROBADA  
**Fecha de aprobación documental:** 2026-07-28  
**Bloque propietario:** BLOQUE I — Navegación, pantallas y autorización de vistas  
**Tipo de tarea:** auditoría técnico-documental de existencia, rutas y superficies actuales; sin cambios de código, Supabase, despliegue, DNS ni navegación runtime  
**Marcador exacto que reemplaza:** `### [ ] AUTH-UI-010 — Auditar rutas y superficies actuales de AURA`  
**Archivo propietario:** `docs/plan-canonico/modular/bloques/I_NAVEGACION_Y_PANTALLAS/01_INVENTARIO_COMPLETO_DE_SUPERFICIES.md`  
**Siguiente tarea:** `AUTH-UI-011 — Asignar process_id a cada vista`

#### 1. Objetivo

Auditar de forma exhaustiva y reproducible las rutas y superficies que existen actualmente alrededor del dominio funcional previsto para AURA, diferenciando con precisión:

1. la aplicación AURA standalone, que no existe en el snapshot inspeccionado;
2. la reserva de catálogo y launcher de AURA;
3. las superficies administrativas de contenido web que hoy pertenecen a VISO;
4. las superficies públicas de `ventogroup.co` que consumen ese contenido;
5. las acciones de servidor, el handler de media, las tablas y los contratos cross-repo relacionados.

La tarea registra realidad actual. No decide todavía continuidad, reemplazo o retiro de AURA; no transfiere propiedad desde VISO; no crea una aplicación; no aprueba permisos definitivos; no modifica rutas, base de datos ni despliegues.

#### 2. Fuentes inspeccionadas

| Fuente                                                   | Rama o commit                              | Alcance                                                                                             |
| -------------------------------------------------------- | ------------------------------------------ | --------------------------------------------------------------------------------------------------- |
| `devVentoGroup/vento-shell`                              | `0f3aa70407ecc5de5fa4ff601b1976c1bd29375b` | plan canónico, login central, template, reserva AURA, esquema website CMS y políticas RLS           |
| `devVentoGroup/vento-viso`                               | `776a5b01008b342cdc9fbcc046a185a82d93f7f5` | AppSwitcher AURA, siete rutas CMS, nueve superficies internas, siete acciones y un handler de media |
| `vento-nexo`, `vento-fogo`, `vento-origo`, `vento-pulso` | snapshots canónicos vigentes               | cuatro AppSwitchers adicionales con AURA `soon`                                                     |
| `devVentoGroup/Vento-Group`                              | `604227aa0c36eda7bb7cf55f66369aa664f4290f` | siete patrones públicos relacionados y adaptador de contenido                                       |
| Registro 04A base                                        | `AUTH-UI-009`                              | 3.464 requisitos antes de esta tarea                                                                |

#### 3. Frontera obligatoria

```text
AURA RESERVADA EN CATÁLOGO
≠ AURA IMPLEMENTADA

CMS ACTUAL EN VISO
≠ AURA STANDALONE

RUTA PÚBLICA EN ventogroup.co
≠ RUTA ADMINISTRATIVA

SERVER ACTION O API
≠ PANTALLA

TABLA website_*
≠ PROPIETARIO FUNCIONAL DEFINITIVO

PUBLICADO
≠ APROBADO
≠ VIGENTE
```

| Decisión                                                         | Tarea propietaria               |
| ---------------------------------------------------------------- | ------------------------------- |
| Confirmar repositorio, producto, usuarios, datos y permisos AURA | `AURA-AUD-001` a `AURA-AUD-006` |
| Definir relación con VISO, PASS y PULSO                          | `AURA-AUD-007` a `AURA-AUD-009` |
| Decidir continuidad, reemplazo o retiro                          | `AURA-AUD-010`                  |
| Registrar ADR y desbloquear o mantener bloqueado el roadmap      | `AURA-AUD-011` y `AURA-AUD-012` |
| Asignar proceso, paso, propietaria y consumidores a las vistas   | `AUTH-UI-011` a `AUTH-UI-014`   |
| Aprobar permisos, acceso directo y protección de servidor        | `AUTH-UI-030` a `AUTH-UI-044`   |

#### 4. Método de auditoría

1. Se enumeraron todos los repositorios accesibles de Vento Group y se confirmó la ausencia de un repositorio AURA.
2. Se contrastó la auditoría técnica previa de AURA con cinco AppSwitchers, el login central, el template y el plan canónico.
3. Se buscaron todas las páginas bajo `src/app/website-cms` en VISO y se abrió cada archivo de ruta.
4. Se separaron rutas, superficies subordinadas, server actions y route handlers.
5. Se inspeccionó el consumidor público de `website_blocks` y `website_items` en `Vento-Group`.
6. Se reconciliaron categorías, page slugs, block keys, publicación, fallbacks, políticas RLS y credenciales de servidor.
7. Cada brecha quedó vinculada a requisito y tarea propietaria.

#### 5. Resultado cuantitativo reconciliado

| Métrica                                             |                           Resultado |
| --------------------------------------------------- | ----------------------------------: |
| Repositorios standalone AURA                        |                               **0** |
| Rutas standalone AURA                               |                               **0** |
| Pantallas standalone AURA                           |                               **0** |
| Representaciones runtime AURA sin aplicación propia | **7 — 5 AppSwitchers + 2 en login** |
| Referencias de template no runtime                  |                               **1** |
| Rutas administrativas actuales relacionadas en VISO |                               **7** |
| Rutas VISO estáticas                                |                               **4** |
| Rutas VISO dinámicas                                |                               **3** |
| Superficies subordinadas VISO inventariadas         |                               **9** |
| Server actions relacionadas                         |                               **7** |
| Route handlers relacionados                         |                               **1** |
| Patrones públicos consumidores en Vento-Group       |                               **7** |
| Patrones públicos que renderizan contenido          |                               **6** |
| Patrones públicos de redirección                    |                               **1** |
| Patrones públicos estáticos                         |                               **6** |
| Patrones públicos dinámicos                         |                               **1** |
| Categorías del modelo website_items                 |                               **5** |
| Tablas maestras actuales del CMS                    |                               **2** |
| Hallazgos con propietario documental                |                              **10** |
| Decisiones de continuidad tomadas por esta tarea    |                               **0** |

#### 6. `AURA-CURRENT-EXISTENCE-REGISTER-001`

| Elemento                   | Resultado                                                     | Evidencia                                | Interpretación aprobada               |
| -------------------------- | ------------------------------------------------------------- | ---------------------------------------- | ------------------------------------- |
| Repositorio AURA           | `ABSENT`                                                      | listado completo de repositorios VENTO   | no existe aplicación standalone       |
| Rutas o pantallas AURA     | `0`                                                           | auditoría técnica y búsqueda transversal | no existe inventario runtime propio   |
| Navegación registrada AURA | `0` en la auditoría técnica base                              | `app_navigation_items` auditado          | no existe menú funcional AURA         |
| Pantallas registradas AURA | `0` en la auditoría técnica base                              | `app_screen_registry` auditado           | no existe superficie registrada       |
| Permiso base               | `aura.access` reservado                                       | catálogo canónico                        | no concede capacidades funcionales    |
| AppSwitchers               | cinco entradas AURA `soon` hacia `https://aura.ventogroup.co` | NEXO, FOGO, ORIGO, PULSO y VISO          | placeholders, no disponibilidad       |
| Login central              | metadata por host y chip visible AURA                         | `vento-shell/src/app/login/page.tsx`     | referencia activa, no aplicación      |
| Template                   | una entrada AURA `soon`                                       | template AppShell de `vento-shell`       | fuente no runtime                     |
| Roadmap AURA               | bloqueado                                                     | BLOQUE W                                 | no autoriza implementación ni canales |

#### 7. `AURA-CURRENT-PLACEHOLDER-SURFACE-INVENTORY-001`

| ID                   | Repositorio | Archivo fuente                                | Representación                                | Estado observado |
| -------------------- | ----------- | --------------------------------------------- | --------------------------------------------- | ---------------- |
| AURA-PLACEHOLDER-001 | vento-nexo  | src/components/vento/standard/vento-shell.tsx | AppSwitcher tile                              | soon             |
| AURA-PLACEHOLDER-002 | vento-fogo  | src/components/vento/standard/vento-shell.tsx | AppSwitcher tile                              | soon             |
| AURA-PLACEHOLDER-003 | vento-origo | src/components/vento/standard/vento-shell.tsx | AppSwitcher tile                              | soon             |
| AURA-PLACEHOLDER-004 | vento-pulso | src/components/vento/standard/vento-shell.tsx | AppSwitcher tile                              | soon             |
| AURA-PLACEHOLDER-005 | vento-viso  | src/components/vento/standard/vento-shell.tsx | AppSwitcher tile                              | soon             |
| AURA-PLACEHOLDER-006 | vento-shell | src/app/login/page.tsx                        | Login metadata selected by aura returnTo host | active reference |
| AURA-PLACEHOLDER-007 | vento-shell | src/app/login/page.tsx                        | Visible AURA chip in connected apps           | active reference |

Referencia reutilizable no runtime:

| ID                | Repositorio | Archivo fuente                                                              | Referencia                             | Estado |
| ----------------- | ----------- | --------------------------------------------------------------------------- | -------------------------------------- | ------ |
| AURA-TEMPLATE-001 | vento-shell | templates/app-shell-standard/src/components/vento/standard/app-switcher.tsx | Non-runtime AppSwitcher template entry | soon   |

Estas representaciones anuncian o tematizan AURA, pero no son rutas internas de una aplicación AURA.

#### 8. `AURA-CURRENT-ADMIN-ROUTE-INVENTORY-001`

| ID                           | Patrón                     | Tipo    | Archivo fuente                             | Superficie observada                                | Propietario actual |
| ---------------------------- | -------------------------- | ------- | ------------------------------------------ | --------------------------------------------------- | ------------------ |
| AURA-CURRENT-ADMIN-ROUTE-001 | /website-cms               | STATIC  | src/app/website-cms/page.tsx               | Panel CMS, filtros, tarjetas y bloques              | VISO               |
| AURA-CURRENT-ADMIN-ROUTE-002 | /website-cms/venues        | STATIC  | src/app/website-cms/venues/page.tsx        | Restaurantes, completitud e importación desde PASS  | VISO               |
| AURA-CURRENT-ADMIN-ROUTE-003 | /website-cms/items/new     | STATIC  | src/app/website-cms/items/new/page.tsx     | Alta de restaurante, empleo, servicio, evento o app | VISO               |
| AURA-CURRENT-ADMIN-ROUTE-004 | /website-cms/blocks/new    | STATIC  | src/app/website-cms/blocks/new/page.tsx    | Alta de bloque editorial                            | VISO               |
| AURA-CURRENT-ADMIN-ROUTE-005 | /website-cms/items/[id]    | DYNAMIC | src/app/website-cms/items/[id]/page.tsx    | Edición y eliminación de tarjeta                    | VISO               |
| AURA-CURRENT-ADMIN-ROUTE-006 | /website-cms/blocks/[id]   | DYNAMIC | src/app/website-cms/blocks/[id]/page.tsx   | Edición de bloque editorial                         | VISO               |
| AURA-CURRENT-ADMIN-ROUTE-007 | /website-cms/venues/[slug] | DYNAMIC | src/app/website-cms/venues/[slug]/page.tsx | Editor y previsualización de detalle de restaurante | VISO               |

Las siete rutas pertenecen actualmente a `appId: viso`. No se renombran ni se contabilizan como rutas AURA.

#### 9. `AURA-CURRENT-INTERNAL-SURFACE-INVENTORY-001`

| ID                       | Tipo                  | Archivo fuente                                     | Comportamiento                                            |
| ------------------------ | --------------------- | -------------------------------------------------- | --------------------------------------------------------- |
| AURA-CURRENT-SURFACE-001 | DASHBOARD             | src/app/website-cms/page.tsx                       | panel, filtros, accesos rápidos y listados                |
| AURA-CURRENT-SURFACE-002 | CREATE_FORM           | src/app/website-cms/items/new/page.tsx             | creación de tarjetas de contenido                         |
| AURA-CURRENT-SURFACE-003 | EDIT_FORM             | src/app/website-cms/items/[id]/page.tsx            | edición, completitud y publicación de tarjetas            |
| AURA-CURRENT-SURFACE-004 | DELETE_CONTROL        | src/app/website-cms/items/[id]/page.tsx            | eliminación física de tarjeta                             |
| AURA-CURRENT-SURFACE-005 | CREATE_FORM           | src/app/website-cms/blocks/new/page.tsx            | creación de bloque editorial                              |
| AURA-CURRENT-SURFACE-006 | EDIT_FORM             | src/app/website-cms/blocks/[id]/page.tsx           | edición y publicación de bloque                           |
| AURA-CURRENT-SURFACE-007 | IMPORT_AND_LIST       | src/app/website-cms/venues/page.tsx                | importación idempotente parcial y listado de restaurantes |
| AURA-CURRENT-SURFACE-008 | DETAIL_EDITOR_PREVIEW | src/app/website-cms/venues/[slug]/page.tsx         | tarjeta, hero, galería y vista pública                    |
| AURA-CURRENT-SURFACE-009 | MEDIA_UPLOAD          | src/components/viso/website-media-upload-field.tsx | carga de imagen o video y captura de URL pública          |

Las nueve superficies son unidades interactivas dentro de las siete rutas. No aumentan el conteo de páginas.

#### 10. Fronteras técnicas actuales

##### 10.1 Server actions

| ID                      | Acción                 | Archivo fuente                             |
| ----------------------- | ---------------------- | ------------------------------------------ |
| AURA-CURRENT-ACTION-001 | importBusinesses       | src/app/website-cms/venues/page.tsx        |
| AURA-CURRENT-ACTION-002 | createWebsiteItem      | src/app/website-cms/items/new/page.tsx     |
| AURA-CURRENT-ACTION-003 | updateWebsiteItem      | src/app/website-cms/items/[id]/page.tsx    |
| AURA-CURRENT-ACTION-004 | deleteWebsiteItem      | src/app/website-cms/items/[id]/page.tsx    |
| AURA-CURRENT-ACTION-005 | createWebsiteBlock     | src/app/website-cms/blocks/new/page.tsx    |
| AURA-CURRENT-ACTION-006 | updateBlock            | src/app/website-cms/blocks/[id]/page.tsx   |
| AURA-CURRENT-ACTION-007 | updateRestaurantDetail | src/app/website-cms/venues/[slug]/page.tsx |

##### 10.2 Route handler

| ID                   | Patrón                         | Método | Archivo fuente                                 |
| -------------------- | ------------------------------ | ------ | ---------------------------------------------- |
| AURA-CURRENT-API-001 | /api/viso/upload-website-media | POST   | src/app/api/viso/upload-website-media/route.ts |

El handler de media es una frontera API y no una pantalla. En el snapshot observado autentica usuario, restringe por dos roles locales, acepta imagen o video hasta el límite configurado, carga al bucket y devuelve URL pública.

#### 11. `AURA-CURRENT-PUBLIC-CONSUMER-INVENTORY-001`

| ID                      | Patrón               | Tipo    | Comportamiento            | Archivo fuente                       | Consumo                                             |
| ----------------------- | -------------------- | ------- | ------------------------- | ------------------------------------ | --------------------------------------------------- |
| AURA-CURRENT-PUBLIC-001 | /                    | STATIC  | RENDER                    | src/app/page.tsx                     | home blocks; restaurant, job, service and app items |
| AURA-CURRENT-PUBLIC-002 | /restaurantes        | STATIC  | RENDER                    | src/app/restaurantes/page.tsx        | restaurant items and restaurantes blocks            |
| AURA-CURRENT-PUBLIC-003 | /restaurantes/[slug] | DYNAMIC | RENDER                    | src/app/restaurantes/[slug]/page.tsx | restaurant item and detail blocks                   |
| AURA-CURRENT-PUBLIC-004 | /empleos             | STATIC  | RENDER                    | src/app/empleos/page.tsx             | job items                                           |
| AURA-CURRENT-PUBLIC-005 | /servicios           | STATIC  | RENDER                    | src/app/servicios/page.tsx           | service items and servicios blocks                  |
| AURA-CURRENT-PUBLIC-006 | /ecosistema          | STATIC  | RENDER                    | src/app/ecosistema/page.tsx          | app items                                           |
| AURA-CURRENT-PUBLIC-007 | /eventos             | STATIC  | REDIRECT_TO_/restaurantes | src/app/eventos/page.tsx             | none                                                |

La ruta `/eventos` existe, pero no consume eventos: redirige a `/restaurantes`. Por tanto, la categoría `event` del CMS no tiene actualmente una superficie pública equivalente a la promesa de la interfaz administrativa.

#### 12. Contrato de datos y consumo observado

| Elemento               | Productor o administrador actual | Consumidor actual  | Regla observada                                                           |
| ---------------------- | -------------------------------- | ------------------ | ------------------------------------------------------------------------- |
| `website_items`        | VISO CMS                         | `Vento-Group`      | categorías restaurant, job, service, event y app; `is_published` booleano |
| `website_blocks`       | VISO CMS                         | `Vento-Group`      | page_slug y block_key; `is_published` booleano                            |
| `pass.pass_satellites` | PASS                             | importador de VISO | fuente parcial de restaurantes activos                                    |
| bucket `website-media` | handler VISO                     | sitio público      | URLs públicas de imagen y video                                           |
| contenido fallback     | código de `Vento-Group`          | sitio público      | se usa ante credenciales ausentes, error o cero filas según cada consulta |

El cliente público usa service role cuando está disponible y cae a anon cuando no. La política endurecida observada permite lectura de filas publicadas únicamente a `authenticated`; por ello el despliegue sin service role puede fallar y activar fallbacks sin hacer visible la causa al usuario.

#### 13. Hallazgos y cierre documental

| ID                       | Hallazgo                                                                                                                                                                                   | Propietario documental                                                                               |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------- |
| AURA-CURRENT-FINDING-001 | No existe repositorio, aplicación, ruta ni pantalla standalone de AURA; cinco AppSwitchers y dos representaciones del login central la referencian, pero ninguna constituye producto AURA. | AURA-AUD-001 a AURA-AUD-004; TREQ-AURA-004 a TREQ-AURA-006                                           |
| AURA-CURRENT-FINDING-002 | Las capacidades actuales de contenido web viven en VISO y son consumidas por Vento-Group; no deben atribuirse silenciosamente a AURA.                                                      | AURA-AUD-007; AUTH-UI-013; AUTH-UI-014; TREQ-AURA-007                                                |
| AURA-CURRENT-FINDING-003 | Las páginas CMS exigen acceso general a VISO y luego usan cliente administrativo; no se observa permiso específico de lectura o mutación por acción.                                       | AUTH-UI-030 a AUTH-UI-044; AURA-AUTH-001; TREQ-AURA-008 a TREQ-AURA-010                              |
| AURA-CURRENT-FINDING-004 | El upload de media autoriza por una lista local de dos roles y no por el catálogo canónico de capacidades.                                                                                 | AURA-AUTH-001 a AURA-AUTH-004; AUTH-SRV-004 a AUTH-SRV-018; TREQ-AURA-018                            |
| AURA-CURRENT-FINDING-005 | Items y bloques nacen publicados por defecto y page_slug, block_key, CTA y URL admiten entradas amplias sin flujo de aprobación independiente.                                             | AURA-DOM-001 a AURA-DOM-005; AURA-UX-001 a AURA-UX-004; TREQ-AURA-011 a TREQ-AURA-016; TREQ-AURA-019 |
| AURA-CURRENT-FINDING-006 | VISO permite crear y anunciar eventos para ventogroup.co/eventos, pero la ruta pública redirige a restaurantes.                                                                            | AURA-AUD-004; AURA-AUD-007; TREQ-AURA-022                                                            |
| AURA-CURRENT-FINDING-007 | VISO escribe gallery_ y gallery_media, mientras el consumidor público busca galeria_ y galeria_media.                                                                                      | AURA-AUD-004; AURA-INT-001; TREQ-AURA-017; TREQ-AURA-023                                             |
| AURA-CURRENT-FINDING-008 | El sitio público prefiere service role y cae a anon; la política endurecida permite lectura autenticada, y ante error o ausencia se sirve contenido fallback.                              | AURA-INT-001; SUPABASE y seguridad; TREQ-AURA-020; TREQ-AURA-021; TREQ-AURA-024                      |
| AURA-CURRENT-FINDING-009 | La eliminación de items es física y no se observa versión, aprobación, rollback, historial editorial ni verificación de referencias públicas.                                              | AURA-DOM-001 a AURA-DOM-005; EVID-ARC; TREQ-AURA-013; TREQ-AURA-019; TREQ-AURA-026                   |
| AURA-CURRENT-FINDING-010 | El contrato cross-repo entre VISO, tablas website y Vento-Group carece de versión ejecutable y prueba de compatibilidad visible.                                                           | AURA-INT-001; SHELL-CI-017; TREQ-AURA-023 a TREQ-AURA-027                                            |

No queda hallazgo detectado sin requisito, tarea propietaria y momento de resolución.

#### 14. Requisitos de prueba derivados

Se incorporan al registro canónico completo:

```text
TREQ-AURA-004 a TREQ-AURA-027
```

| ID              | Regla protegida                                                                                                                                                                                                                                                                                                                                                                                          |
| --------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `TREQ-AURA-004` | El inventario actual de AURA deberá detectar cero repositorios standalone, cero rutas propias y cero pantallas propias, y deberá separar esa ausencia de la existencia de un código de aplicación reservado, un permiso base y siete representaciones runtime de acceso o launcher, además de una referencia de template no runtime. Ningún placeholder podrá contabilizarse como producto implementado. |
| `TREQ-AURA-005` | Cada alta, retiro o cambio de repositorio, dominio, ruta, pantalla, launcher, navegación, permiso reservado o commit relacionado con AURA deberá producir un delta explícito contra el inventario aprobado, con identificador estable, fuente y huella reproducible.                                                                                                                                     |
| `TREQ-AURA-006` | Las cinco tarjetas AppSwitcher, las dos representaciones del login central y cualquier catálogo de aplicaciones deberán mostrar AURA como no disponible mientras no exista repositorio, despliegue, rutas certificadas, autorización y decisión formal de continuidad. La URL reservada no deberá abrir una aplicación equivocada, vacía o no protegida.                                                 |
| `TREQ-AURA-007` | Las siete rutas administrativas actuales de contenido web deberán conservarse atribuidas a VISO y las siete rutas públicas consumidoras a Vento-Group hasta que una decisión aprobada transfiera propiedad. No se duplicarán como rutas AURA ni se declarará a AURA fuente de verdad por inferencia.                                                                                                     |
| `TREQ-AURA-008` | La lectura del CMS deberá exigir una capacidad específica de contenido web además del acceso general a VISO. Conocer o abrir directamente `/website-cms` o cualquiera de sus rutas hijas no deberá conceder lectura de borradores, contenido oculto, URLs, medios o datos editoriales.                                                                                                                   |
| `TREQ-AURA-009` | Crear, actualizar, publicar, ocultar, eliminar, importar y subir media deberán usar capacidades atómicas distintas y comprobarse en servidor para la ruta y la acción exactas. El permiso de lectura, el acceso general a VISO o la visibilidad del menú no autorizarán mutaciones.                                                                                                                      |
| `TREQ-AURA-010` | Toda operación que use `createAdminClient` o service role deberá autorizar actor, capacidad, recurso, sede o alcance y estado antes de consultar o mutar. La elevación técnica no podrá sustituir RLS, ampliar el conjunto de filas ni aceptar identificadores enviados por cliente sin resolución de servidor.                                                                                          |
| `TREQ-AURA-011` | Crear una tarjeta de contenido deberá validar categoría, título, slug normalizado, unicidad, fechas, URL de acción, media, orden, alcance y estado inicial. La colisión de slug deberá resolverse de manera determinista y la creación no deberá publicar por defecto sin política aprobada.                                                                                                             |
| `TREQ-AURA-012` | Actualizar una tarjeta deberá detectar edición concurrente, preservar identidad y versión, validar cambios de categoría o slug contra consumidores y registrar actor, antes, después y motivo. Un cambio de URL no deberá romper enlaces públicos, SEO, referencias o campañas sin redirección explícita.                                                                                                |
| `TREQ-AURA-013` | Eliminar una tarjeta deberá comprobar referencias, estado publicado, dependencias, URLs, campañas y evidencia antes de ejecutar. La operación deberá ser reversible o usar retiro lógico con retención y auditoría; una eliminación física directa no será el comportamiento canónico.                                                                                                                   |
| `TREQ-AURA-014` | Crear un bloque deberá aceptar únicamente page_slug, block_key y block_type registrados y compatibles con el consumidor público. Entradas libres, claves desconocidas o combinaciones no renderizadas deberán rechazarse o permanecer en borrador técnico sin publicación.                                                                                                                               |
| `TREQ-AURA-015` | Actualizar un bloque deberá preservar unicidad, validar compatibilidad del tipo y la clave, detectar concurrencia y registrar versión y actor. Cambiar page_slug o block_key no podrá crear contenido duplicado, huérfano o incompatible con el frontend.                                                                                                                                                |
| `TREQ-AURA-016` | Importar restaurantes desde PASS deberá ser idempotente, conservar vínculo estable con el satélite o sede origen, distinguir datos importados de datos editoriales, no sobreescribir curaduría y reportar altas, omitidos, conflictos y retiros. Comparar solo slugs no será suficiente para reconciliar identidad.                                                                                      |
| `TREQ-AURA-017` | El editor de detalle de restaurante deberá escribir exactamente las claves, tipos y page_slug que consume la página pública, y deberá probar hero, galería, tarjeta, CTA y publicación en conjunto antes de guardar. Una previsualización local no podrá ocultar incompatibilidades del consumidor real.                                                                                                 |
| `TREQ-AURA-018` | La carga de media deberá exigir capacidad canónica, validar firma real del archivo además de MIME declarado, tamaño, dimensiones, duración, derechos, malware, nombre, deduplicación, cuota y alcance. El scope enviado por cliente no decidirá por sí solo la ruta, y la URL pública solo se emitirá después de una carga íntegra y auditable.                                                          |
| `TREQ-AURA-019` | Borrador, revisión, aprobación, programación, publicación, ocultamiento, retiro y archivo deberán ser estados y transiciones distintas con segregación de funciones, vigencia, actor y evidencia. El booleano `is_published` no podrá representar por sí solo el ciclo editorial ni una aprobación equivaler a publicación.                                                                              |
| `TREQ-AURA-020` | El sitio público deberá consumir únicamente contenido publicado y vigente mediante una identidad técnica explícita, de mínimo privilegio y compatible con las políticas de lectura. La ausencia de service role, una política RLS incompatible o un error de consulta deberá producir estado observable y no una degradación silenciosa.                                                                 |
| `TREQ-AURA-021` | Los fallbacks editoriales deberán estar etiquetados como contenido de contingencia, versionados y gobernados. Un error, falta de credenciales o tabla vacía no podrá mostrar placeholders como si fueran contenido vigente de producción ni reintroducir promociones, vacantes, eventos o apps retirados.                                                                                                |
| `TREQ-AURA-022` | La categoría event, los filtros, formularios, textos y CTAs solo deberán presentarse como publicables cuando exista una ruta pública consumidora activa. Mientras `/eventos` redirija a `/restaurantes`, crear o publicar eventos deberá bloquearse, advertirse o dirigirse a un destino explícitamente aprobado.                                                                                        |
| `TREQ-AURA-023` | El contrato de bloques deberá definir una única convención versionada para page_slug, block_key y block_type. En particular, gallery y galeria no podrán coexistir sin alias explícito, migración y prueba que asegure que lo escrito por VISO es leído por Vento-Group.                                                                                                                                 |
| `TREQ-AURA-024` | El contrato entre esquema, políticas RLS, cliente administrativo de VISO y cliente público de Vento-Group deberá versionarse y probarse como una unidad. Una migración de políticas o columnas no podrá desplegarse si rompe lectura pública, edición, importación, publicación o fallback controlado.                                                                                                   |
| `TREQ-AURA-025` | Toda URL interna, CTA, canonical, preview y redirección producida por el CMS deberá validarse contra rutas activas y políticas de seguridad. No se admitirán `#`, destinos retirados, ciclos, redirecciones inesperadas, esquemas peligrosos ni enlaces a `/eventos` mientras ese destino no represente la acción anunciada.                                                                             |
| `TREQ-AURA-026` | Toda lectura y mutación editorial deberá generar auditoría correlacionable de actor, principal técnico, capacidad, recurso, versión, estado anterior, estado nuevo, origen, resultado y publicación afectada. Deberán existir métricas y reconciliación para filas sin consumidor, URLs rotas, medios faltantes, contenido publicado vencido y fallos de sincronización.                                 |
| `TREQ-AURA-027` | Una futura transferencia de las capacidades CMS desde VISO hacia AURA deberá depender de decisión formal y ADR, definir propietario y consumidores, migrar rutas y permisos sin duplicar maestros, preservar URLs y evidencia, ejecutar cutover y rollback, y retirar o redirigir las superficies anteriores solo después de reconciliación completa.                                                    |

#### 15. Huellas de la línea base

```text
STANDALONE_AURA_STATE_SHA256 = 27aa457c166115087c18174e4f95500b0a817152268f603e17f8a1e1dab0c16b
RUNTIME_PLACEHOLDER_SURFACES_SHA256 = 69483222be343ab33f14fa81f072d7d8f340d68d252dba9079ddb5585265643e
TEMPLATE_REFERENCES_SHA256 = d2a550ac87dec6c68d8a60a5ab2ef6f09ea1d827631e15f3e0c35e47a936d615
VISO_ADMIN_ROUTES_SHA256 = 1867bfd2e4c558227a33bc7354a150ab6c970c2a4cd0f5acb6310127884d58f3
VISO_INTERNAL_SURFACES_SHA256 = 219e621396fe48d5ff490cf9f04b0e5ba0344ee1d30ea3b68df5080235de8fa8
VISO_SERVER_ACTIONS_SHA256 = acd5b697f03f135baabda73466ad87032b7ce63a91f435911cc608428c6133ed
VISO_API_HANDLERS_SHA256 = 0eb8f26fc40349d3ccdafe94455457045cfd12965df75c1cb3b3250cd73f8b04
PUBLIC_CONSUMER_ROUTES_SHA256 = 3622a43fbabffa9da801f0a28a43240d4acacb960b5a7fff7bc60b402ac34149
FINDINGS_SHA256 = 6f9560efe9f65378a3649598d9789cde85c3c5c2c56792b7eb1b73deca067337
COMBINED_INVENTORY_SHA256 = b6dc17623bc1d6eaa93001c877157c6030d16f6df87e6628075d348f3ea5d386
```

#### 16. Criterios de aceptación

- [x] Se confirma cero repositorios, rutas y pantallas standalone de AURA.
- [x] Las siete representaciones runtime y la referencia de template se separan de una implementación real.
- [x] Se inventariaron exactamente siete rutas administrativas actuales en VISO.
- [x] Se separan nueve superficies subordinadas, siete server actions y un handler API.
- [x] Se inventariaron siete patrones públicos relacionados, con seis vistas y una redirección.
- [x] Las superficies actuales conservan su propietario observado y no se transfieren por inferencia a AURA.
- [x] Se documentan las incompatibilidades event, gallery o galeria, RLS, fallback y autorización.
- [x] Cada hallazgo tiene requisito y tarea propietaria.
- [x] Se incorporan `TREQ-AURA-004` a `TREQ-AURA-027` sin modificar filas históricas.
- [x] No se ejecuta código de producto, migración, cambio Supabase, DNS ni despliegue.

#### 17. Validaciones documentales realizadas

| Control                       | Resultado                                         |
| ----------------------------- | ------------------------------------------------- |
| Base 04A leída completa       | **3.472 requisitos**                              |
| Nuevos requisitos             | **24**                                            |
| Total regenerado              | **3.496**                                         |
| Dominio AURA                  | **27 requisitos — TREQ-AURA-001 a TREQ-AURA-027** |
| Identificadores duplicados    | **0**                                             |
| Filas con catorce columnas    | **3.496 de 3.496**                                |
| Relaciones TREQ no resolubles | **0**                                             |
| Secuencia AURA                | **continua, sin saltos**                          |
| Filas históricas modificadas  | **0**                                             |
| Código o Supabase modificado  | **no**                                            |

#### 18. Instrucción de reemplazo

1. Reemplazar exactamente `### [ ] AUTH-UI-010 — Auditar rutas y superficies actuales de AURA` por este documento completo.
2. Reemplazar completamente `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` por el archivo regenerado entregado con esta tarea.
3. No insertar filas TREQ manualmente.

#### 19. Continuidad aprobada

```text
ÚLTIMA TAREA APROBADA
AUTH-UI-010 — Auditar rutas y superficies actuales de AURA
        ↓
TAREA ACTUAL
AUTH-UI-011 — Asignar process_id a cada vista
        ↓
SIGUIENTE TAREA RESERVADA
AUTH-UI-012 — Asignar process_step a cada vista
```
