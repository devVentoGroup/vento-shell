## BLOQUE I

**Navegación, pantallas y autorización de vistas**

Relación con los demás bloques:

BLOQUE E2
→ define el contrato transversal que toda pantalla deberá cumplir

BLOQUE I
→ aplica ese contrato a las rutas y pantallas reales del ecosistema

SUBBLOQUES UX DE CADA APLICACIÓN
→ rediseñan los procesos y la experiencia concreta de cada producto

Por tanto:

PROC-SCREEN
≠ inventario de pantallas reales

AUTH-UI
≠ rediseño completo de una aplicación

NEXO-UX / FOGO-UX / ORIGO-UX / PULSO-UX / NUMERA-UX
→ utilizan las decisiones transversales y las aplican al dominio

INVENTARIO COMPLETO

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

| Métrica | Resultado |
| --- | ---: |
| Rutas de página | **64** |
| Rutas bajo `/inventory` | **55** |
| Rutas bajo `/printing` | **3** |
| Raíz, acceso y utilidades | **6** |
| Patrones estáticos | **47** |
| Patrones dinámicos | **17** |
| Rutas que producen vista | **60** |
| Rutas de redirección | **4** |
| Route handlers API separados | **11** |
| Patrones App Router combinados, sin llamarlos pantallas | **75** |
| Altas frente a 2026-07-23 | **0** |
| Retiros frente a 2026-07-23 | **0** |
| Decisiones de permiso o rediseño tomadas | **0** |

---

#### 5. `NEXO-ROUTE-INVENTORY-001`

| ID | Patrón URL | Archivo fuente | Superficie actual | Parámetros | Familia estructural | Sincronización de registro | Evidencia de sesión | Observación |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `NEXO-ROUTE-001` | `/` | `src/app/page.tsx` | `VIEW` | `STATIC` | `root` | `EXCLUDED_ROOT_BY_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Inicio operativo real de NEXO; el script de sincronización omite la raíz. |
| `NEXO-ROUTE-002` | `/inventory/adjust` | `src/app/inventory/adjust/page.tsx` | `VIEW` | `STATIC` | `inventory/adjust` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-003` | `/inventory/assets` | `src/app/inventory/assets/page.tsx` | `VIEW` | `STATIC` | `inventory/assets` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-004` | `/inventory/assets/counts` | `src/app/inventory/assets/counts/page.tsx` | `VIEW` | `STATIC` | `inventory/assets` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-005` | `/inventory/assets/counts/[id]` | `src/app/inventory/assets/counts/[id]/page.tsx` | `VIEW` | `DYNAMIC:[id]` | `inventory/assets` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-006` | `/inventory/assets/groups/[id]` | `src/app/inventory/assets/groups/[id]/page.tsx` | `VIEW` | `DYNAMIC:[id]` | `inventory/assets` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-007` | `/inventory/assets/items/[id]` | `src/app/inventory/assets/items/[id]/page.tsx` | `VIEW` | `DYNAMIC:[id]` | `inventory/assets` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-008` | `/inventory/assets/new` | `src/app/inventory/assets/new/page.tsx` | `VIEW` | `STATIC` | `inventory/assets` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-009` | `/inventory/assets/quick` | `src/app/inventory/assets/quick/page.tsx` | `VIEW` | `STATIC` | `inventory/assets` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-010` | `/inventory/catalog` | `src/app/inventory/catalog/page.tsx` | `VIEW` | `STATIC` | `inventory/catalog` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-011` | `/inventory/catalog/[id]` | `src/app/inventory/catalog/[id]/page.tsx` | `VIEW` | `DYNAMIC:[id]` | `inventory/catalog` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-012` | `/inventory/catalog/[id]/ficha` | `src/app/inventory/catalog/[id]/ficha/page.tsx` | `VIEW` | `DYNAMIC:[id]` | `inventory/catalog` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-013` | `/inventory/catalog/[id]/presentations` | `src/app/inventory/catalog/[id]/presentations/page.tsx` | `VIEW` | `DYNAMIC:[id]` | `inventory/catalog` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-014` | `/inventory/catalog/new` | `src/app/inventory/catalog/new/page.tsx` | `VIEW` | `STATIC` | `inventory/catalog` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-015` | `/inventory/catalog/presentations` | `src/app/inventory/catalog/presentations/page.tsx` | `VIEW` | `STATIC` | `inventory/catalog` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-016` | `/inventory/cost-center` | `src/app/inventory/cost-center/page.tsx` | `VIEW` | `STATIC` | `inventory/cost-center` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-017` | `/inventory/count-initial` | `src/app/inventory/count-initial/page.tsx` | `VIEW` | `STATIC` | `inventory/count-initial` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-018` | `/inventory/count-initial/session/[id]` | `src/app/inventory/count-initial/session/[id]/page.tsx` | `VIEW` | `DYNAMIC:[id]` | `inventory/count-initial` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-019` | `/inventory/entries` | `src/app/inventory/entries/page.tsx` | `VIEW` | `STATIC` | `inventory/entries` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-020` | `/inventory/locations` | `src/app/inventory/locations/page.tsx` | `VIEW` | `STATIC` | `inventory/locations` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-021` | `/inventory/locations/[id]` | `src/app/inventory/locations/[id]/page.tsx` | `VIEW` | `DYNAMIC:[id]` | `inventory/locations` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-022` | `/inventory/locations/[id]/board` | `src/app/inventory/locations/[id]/board/page.tsx` | `VIEW` | `DYNAMIC:[id]` | `inventory/locations` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-023` | `/inventory/locations/[id]/kiosk-withdraw` | `src/app/inventory/locations/[id]/kiosk-withdraw/page.tsx` | `VIEW` | `DYNAMIC:[id]` | `inventory/locations` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-024` | `/inventory/locations/[id]/positions` | `src/app/inventory/locations/[id]/positions/page.tsx` | `VIEW` | `DYNAMIC:[id]` | `inventory/locations` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-025` | `/inventory/locations/open` | `src/app/inventory/locations/open/page.tsx` | `VIEW` | `STATIC` | `inventory/locations` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-026` | `/inventory/locations/zone` | `src/app/inventory/locations/zone/page.tsx` | `VIEW` | `STATIC` | `inventory/locations` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Vista real parametrizada por site_id y zone; admite modo kiosk. |
| `NEXO-ROUTE-027` | `/inventory/locations/zones` | `src/app/inventory/locations/zones/page.tsx` | `VIEW` | `STATIC` | `inventory/locations` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-028` | `/inventory/lpns` | `src/app/inventory/lpns/page.tsx` | `VIEW` | `STATIC` | `inventory/lpns` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-029` | `/inventory/movements` | `src/app/inventory/movements/page.tsx` | `VIEW` | `STATIC` | `inventory/movements` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-030` | `/inventory/production-batches` | `src/app/inventory/production-batches/page.tsx` | `VIEW` | `STATIC` | `inventory/production-batches` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-031` | `/inventory/remissions` | `src/app/inventory/remissions/page.tsx` | `VIEW` | `STATIC` | `inventory/remissions` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-032` | `/inventory/remissions/[id]` | `src/app/inventory/remissions/[id]/page.tsx` | `VIEW` | `DYNAMIC:[id]` | `inventory/remissions` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-033` | `/inventory/remissions/[id]/edit` | `src/app/inventory/remissions/[id]/edit/page.tsx` | `VIEW` | `DYNAMIC:[id]` | `inventory/remissions` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-034` | `/inventory/remissions/conductor` | `src/app/inventory/remissions/conductor/page.tsx` | `VIEW` | `STATIC` | `inventory/remissions` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-035` | `/inventory/remissions/fulfillment` | `src/app/inventory/remissions/fulfillment/page.tsx` | `VIEW` | `STATIC` | `inventory/remissions` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-036` | `/inventory/remissions/prepare` | `src/app/inventory/remissions/prepare/page.tsx` | `VIEW` | `STATIC` | `inventory/remissions` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-037` | `/inventory/remissions/receive` | `src/app/inventory/remissions/receive/page.tsx` | `VIEW` | `STATIC` | `inventory/remissions` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-038` | `/inventory/remissions/transit` | `src/app/inventory/remissions/transit/page.tsx` | `VIEW` | `STATIC` | `inventory/remissions` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-039` | `/inventory/settings` | `src/app/inventory/settings/page.tsx` | `VIEW` | `STATIC` | `inventory/settings` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Hub real de configuración; no sustituye las vistas enlazadas. |
| `NEXO-ROUTE-040` | `/inventory/settings/categories` | `src/app/inventory/settings/categories/page.tsx` | `VIEW` | `STATIC` | `inventory/settings` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-041` | `/inventory/settings/fulfillment-routes` | `src/app/inventory/settings/fulfillment-routes/page.tsx` | `VIEW` | `STATIC` | `inventory/settings` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-042` | `/inventory/settings/internal-prices` | `src/app/inventory/settings/internal-prices/page.tsx` | `VIEW` | `STATIC` | `inventory/settings` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-043` | `/inventory/settings/locations/[id]/catalog` | `src/app/inventory/settings/locations/[id]/catalog/page.tsx` | `VIEW` | `DYNAMIC:[id]` | `inventory/settings` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-044` | `/inventory/settings/products` | `src/app/inventory/settings/products/page.tsx` | `VIEW` | `STATIC` | `inventory/settings` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-045` | `/inventory/settings/remissions` | `src/app/inventory/settings/remissions/page.tsx` | `VIEW` | `STATIC` | `inventory/settings` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-046` | `/inventory/settings/remissions/products` | `src/app/inventory/settings/remissions/products/page.tsx` | `VIEW` | `STATIC` | `inventory/settings` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-047` | `/inventory/settings/request-policies` | `src/app/inventory/settings/request-policies/page.tsx` | `VIEW` | `STATIC` | `inventory/settings` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-048` | `/inventory/settings/sites` | `src/app/inventory/settings/sites/page.tsx` | `VIEW` | `STATIC` | `inventory/settings` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-049` | `/inventory/settings/sites/[id]/operations` | `src/app/inventory/settings/sites/[id]/operations/page.tsx` | `VIEW` | `DYNAMIC:[id]` | `inventory/settings` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-050` | `/inventory/settings/supply-routes` | `src/app/inventory/settings/supply-routes/page.tsx` | `VIEW` | `STATIC` | `inventory/settings` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-051` | `/inventory/settings/units` | `src/app/inventory/settings/units/page.tsx` | `VIEW` | `STATIC` | `inventory/settings` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-052` | `/inventory/stock` | `src/app/inventory/stock/page.tsx` | `VIEW` | `STATIC` | `inventory/stock` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-053` | `/inventory/stock/assign-location` | `src/app/inventory/stock/assign-location/page.tsx` | `VIEW` | `STATIC` | `inventory/stock` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-054` | `/inventory/transfers` | `src/app/inventory/transfers/page.tsx` | `VIEW` | `STATIC` | `inventory/transfers` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-055` | `/inventory/warehouse` | `src/app/inventory/warehouse/page.tsx` | `REDIRECT_ALIAS` | `STATIC` | `inventory/warehouse` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Alias técnico; no renderiza una vista propia. |
| `NEXO-ROUTE-056` | `/inventory/withdraw` | `src/app/inventory/withdraw/page.tsx` | `VIEW` | `STATIC` | `inventory/withdraw` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-057` | `/kiosk/[slug]` | `src/app/kiosk/[slug]/page.tsx` | `KIOSK_ENTRY_REDIRECT` | `DYNAMIC:[slug]` | `kiosk` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Resuelve únicamente slugs declarados; un slug desconocido produce notFound. |
| `NEXO-ROUTE-058` | `/l/[code]` | `src/app/l/[code]/page.tsx` | `DEEP_LINK_REDIRECT` | `DYNAMIC:[code]` | `deep-link` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Normaliza el código LOC a mayúsculas y abre el flujo de ubicación. |
| `NEXO-ROUTE-059` | `/login` | `src/app/login/page.tsx` | `AUTH_VIEW` | `STATIC` | `access` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `MIDDLEWARE_EXCLUDED_LOGIN` | Entrada de autenticación; excluida del matcher del middleware. |
| `NEXO-ROUTE-060` | `/no-access` | `src/app/no-access/page.tsx` | `ACCESS_STATE` | `STATIC` | `access` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Estado de acceso denegado; conserva returnTo local saneado. |
| `NEXO-ROUTE-061` | `/printing/designer` | `src/app/printing/designer/page.tsx` | `VIEW` | `STATIC` | `printing` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-062` | `/printing/jobs` | `src/app/printing/jobs/page.tsx` | `VIEW` | `STATIC` | `printing` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Ruta de página existente; clasificación funcional y permiso exacto quedan reservados para tareas posteriores. |
| `NEXO-ROUTE-063` | `/printing/setup` | `src/app/printing/setup/page.tsx` | `VIEW` | `STATIC` | `printing` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Utilidad técnica de preparación de impresión; no equivale a un endpoint API. |
| `NEXO-ROUTE-064` | `/scanner` | `src/app/scanner/page.tsx` | `REDIRECT_ALIAS` | `STATIC` | `utility` | `DISCOVERABLE_BY_SYNC_SCRIPT` | `SESSION_GUARDED_BY_MIDDLEWARE` | Alias técnico; no renderiza una vista propia. |

---

#### 6. `NEXO-REDIRECT-AND-DEEP-LINK-REGISTER-001`

| ID | Ruta origen | Destino o resolución | Evidencia de comportamiento | Tratamiento actual |
| --- | --- | --- | --- | --- |
| `NEXO-REDIRECT-001` | `/scanner` | `/inventory/locations` | La función de página ejecuta `redirect` sin renderizar contenido. | Conservar como arista de redirección; clasificación posterior en `AUTH-UI-026` a `AUTH-UI-029`. |
| `NEXO-REDIRECT-002` | `/inventory/warehouse` | `/inventory/locations` | La función de página ejecuta `redirect` sin renderizar contenido. | Conservar como arista de redirección; clasificación posterior en `AUTH-UI-026` a `AUTH-UI-029`. |
| `NEXO-REDIRECT-003` | `/l/[code]` | `/inventory/locations/open?loc={CODE}` | Normaliza el código a mayúsculas; un valor vacío vuelve a ubicaciones con error. | Conservar como deep link técnico; seguridad y permiso se auditan después. |
| `NEXO-REDIRECT-004` | `/kiosk/[slug]` | `/inventory/locations/[id]/board?kiosk=1 o /inventory/locations/zone?...&kiosk=1` | Resuelve un catálogo explícito de slugs; el desconocido produce `notFound`. | Conservar como entrada de kiosco; no asumir que cada slug es una pantalla distinta. |

Slugs observados en la ruta de kiosco: `bodega`, `bodega-principal`, `nevera-produccion`, `nevera-preparaciones`, `nevera-despacho`, `empaques` y `zona-empaques`. Estos valores son targets de entrada, no siete rutas adicionales.

---

#### 7. `NEXO-TECHNICAL-ROUTE-HANDLER-REGISTER-001`

Los siguientes route handlers existen bajo `src/app/api`. No forman parte de las 64 rutas de página ni pueden promoverse como pantallas:

| ID | Patrón técnico | Archivo fuente | Tratamiento |
| --- | --- | --- | --- |
| `NEXO-API-001` | `/api/labelary` | `src/app/api/labelary/route.ts` | `TECHNICAL_ROUTE_HANDLER_NOT_A_VIEW` |
| `NEXO-API-002` | `/api/inventory/lpns` | `src/app/api/inventory/lpns/route.ts` | `TECHNICAL_ROUTE_HANDLER_NOT_A_VIEW` |
| `NEXO-API-003` | `/api/inventory/adjust` | `src/app/api/inventory/adjust/route.ts` | `TECHNICAL_ROUTE_HANDLER_NOT_A_VIEW` |
| `NEXO-API-004` | `/api/printing/layouts` | `src/app/api/printing/layouts/route.ts` | `TECHNICAL_ROUTE_HANDLER_NOT_A_VIEW` |
| `NEXO-API-005` | `/api/inventory/locations` | `src/app/api/inventory/locations/route.ts` | `TECHNICAL_ROUTE_HANDLER_NOT_A_VIEW` |
| `NEXO-API-006` | `/api/inventory/count-initial` | `src/app/api/inventory/count-initial/route.ts` | `TECHNICAL_ROUTE_HANDLER_NOT_A_VIEW` |
| `NEXO-API-007` | `/api/inventory/movements/export` | `src/app/api/inventory/movements/export/route.ts` | `TECHNICAL_ROUTE_HANDLER_NOT_A_VIEW` |
| `NEXO-API-008` | `/api/inventory/stock/export-by-loc` | `src/app/api/inventory/stock/export-by-loc/route.ts` | `TECHNICAL_ROUTE_HANDLER_NOT_A_VIEW` |
| `NEXO-API-009` | `/api/inventory/catalog/upload-image` | `src/app/api/inventory/catalog/upload-image/route.ts` | `TECHNICAL_ROUTE_HANDLER_NOT_A_VIEW` |
| `NEXO-API-010` | `/api/inventory/count-initial/approve` | `src/app/api/inventory/count-initial/approve/route.ts` | `TECHNICAL_ROUTE_HANDLER_NOT_A_VIEW` |
| `NEXO-API-011` | `/api/inventory/catalog/export-suppliers` | `src/app/api/inventory/catalog/export-suppliers/route.ts` | `TECHNICAL_ROUTE_HANDLER_NOT_A_VIEW` |

El middleware de páginas excluye `/api`. La autenticación, autorización, validación de payload, rate limit y protección de servidor de cada handler deberán auditarse mediante `AUTH-UI-043` y las tareas `AUTH-SRV-*` o de dominio correspondientes. Esta tarea no los declara protegidos ni desprotegidos.

---

#### 8. Superficies auxiliares no contabilizadas como rutas

| ID | Ruta asistida | Archivo | Tratamiento |
| --- | --- | --- | --- |
| `NEXO-LOAD-001` | `/inventory/locations/[id]/board` | `src/app/inventory/locations/[id]/board/loading.tsx` | `LOADING_BOUNDARY_NOT_A_ROUTE` |
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

| Hallazgo o decisión pendiente | Propietario documental | Momento de resolución | Estado |
| --- | --- | --- | --- |
| Asignar proceso y paso a cada ruta que represente una vista. | `AUTH-UI-011` y `AUTH-UI-012` | Después de completar los inventarios `AUTH-UI-001` a `AUTH-UI-010`. | `ROUTED` |
| Distinguir propiedad de aplicación y consumo transversal. | `AUTH-UI-013` y `AUTH-UI-014` | Durante clasificación funcional. | `ROUTED` |
| Clasificar tipo de vista, actores, dispositivo, frecuencia y acciones. | `AUTH-UI-015` a `AUTH-UI-025` | Después del inventario completo. | `ROUTED` |
| Decidir si aliases, redirects o vistas superpuestas son duplicadas, legacy o retirables. | `AUTH-UI-026` a `AUTH-UI-029` | Después de asignar proceso, paso y consumidores. | `ROUTED` |
| Asignar permiso de lectura y permisos exactos por acción. | `AUTH-UI-030` a `AUTH-UI-039` | Durante el subbloque de autorización. | `ROUTED` |
| Reconciliar rutas fuente, registro de pantallas y navegación runtime, incluida la raíz omitida. | `AUTH-UI-045` | Antes de aprobar navegación unificada. | `ROUTED` |
| Estandarizar los dos loading boundaries y demás estados de carga. | `AUTH-UI-049` | Durante experiencia transversal de vistas. | `ROUTED` |
| Auditar protección real de los 11 route handlers API. | `AUTH-UI-043` y tareas `AUTH-SRV-*` aplicables | Antes de implementación o certificación de sus consumidores. | `ROUTED` |
| Rediseñar las rutas y flujos concretos de NEXO. | Subbloque `NEXO-UX-*` | Después de aplicar la clasificación y autorización transversal. | `ROUTED` |

No queda una diferencia detectada como pendiente narrativo sin tarea propietaria.

---

#### 12. Requisitos de prueba derivados

Se incorporan al registro canónico completo los siguientes identificadores:

```text
TREQ-NEXO-020 a TREQ-NEXO-039
```

| ID | Regla protegida | Tipo inicial |
| --- | --- | --- |
| `TREQ-NEXO-020` | Detectar exactamente todas las rutas de página activas bajo src/app sin depender del menú runtime. | `contractual + regresión` |
| `TREQ-NEXO-021` | Asignar un identificador estable y único a cada patrón de ruta inventariado. | `contractual` |
| `TREQ-NEXO-022` | Preservar segmentos dinámicos como [id], [slug] y [code] sin expandir instancias de datos. | `contractual + regresión` |
| `TREQ-NEXO-023` | Distinguir rutas de página, route handlers API, layouts y boundaries de carga. | `contractual + estática` |
| `TREQ-NEXO-024` | Excluir segmentos de grupos, paralelos y privados de la URL visible cuando aparezcan. | `contractual + regresión` |
| `TREQ-NEXO-025` | Incluir la ruta raíz en el inventario aunque el sincronizador de navegación la omita. | `regresión` |
| `TREQ-NEXO-026` | Registrar cada redirección con origen, destino y comportamiento ante parámetros inválidos. | `E2E + regresión` |
| `TREQ-NEXO-027` | Comprobar que /scanner y /inventory/warehouse redirigen a /inventory/locations. | `E2E + regresión` |
| `TREQ-NEXO-028` | Comprobar que /l/[code] normaliza el LOC y construye un destino local seguro. | `E2E + seguridad` |
| `TREQ-NEXO-029` | Comprobar que /kiosk/[slug] acepta solo targets declarados y rechaza slugs desconocidos. | `E2E + seguridad` |
| `TREQ-NEXO-030` | Verificar la cobertura del middleware sobre todas las páginas salvo exclusiones explícitas. | `seguridad + regresión` |
| `TREQ-NEXO-031` | Verificar que /login permanece fuera del matcher y que las rutas protegidas redirigen sin sesión. | `seguridad + E2E` |
| `TREQ-NEXO-032` | Impedir que un route handler API sea contabilizado o promovido como pantalla. | `contractual + regresión` |
| `TREQ-NEXO-033` | Verificar que sync-navigation detecta page files y excluye rutas api. | `integración + regresión` |
| `TREQ-NEXO-034` | Detectar explícitamente la exclusión de / por el sincronizador y exigir tratamiento consciente. | `contractual + regresión` |
| `TREQ-NEXO-035` | Reconciliar inventario fuente, app_screen_registry y app_navigation_items sin asumir equivalencia. | `integración + base de datos` |
| `TREQ-NEXO-036` | Conservar los boundaries de carga como superficies auxiliares y no como rutas independientes. | `interfaz + regresión` |
| `TREQ-NEXO-037` | Fijar repositorio, rama, commit y fuente física para reproducir el inventario. | `contractual + regresión` |
| `TREQ-NEXO-038` | Detectar archivos page sin URL única o URLs duplicadas antes de aprobar el inventario. | `contractual + estática` |
| `TREQ-NEXO-039` | Detectar altas, retiros o cambios de patrón de ruta respecto de la línea base aprobada. | `regresión + integración` |

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


### [ ] AUTH-UI-002 — Inventariar todas las rutas de FOGO
### [ ] AUTH-UI-003 — Inventariar todas las rutas de ORIGO
### [ ] AUTH-UI-004 — Inventariar todas las rutas de PULSO
### [ ] AUTH-UI-005 — Inventariar todas las rutas de VISO
### [ ] AUTH-UI-006 — Inventariar todas las rutas de NUMERA
### [ ] AUTH-UI-007 — Inventariar todas las pantallas de ANIMA
### [ ] AUTH-UI-008 — Inventariar todas las superficies de SHELL
### [ ] AUTH-UI-009 — Inventariar superficies laborales relacionadas con PASS
### [ ] AUTH-UI-010 — Auditar rutas y superficies actuales de AURA

CLASIFICACIÓN FUNCIONAL

### [ ] AUTH-UI-011 — Asignar process_id a cada vista
### [ ] AUTH-UI-012 — Asignar process_step a cada vista
### [ ] AUTH-UI-013 — Definir aplicación propietaria
### [ ] AUTH-UI-014 — Definir si la aplicación solo consume la capacidad
### [ ] AUTH-UI-015 — Clasificar vista operativa
### [ ] AUTH-UI-016 — Clasificar vista administrativa
### [ ] AUTH-UI-017 — Clasificar vista de supervisión
### [ ] AUTH-UI-018 — Clasificar vista de configuración
### [ ] AUTH-UI-019 — Clasificar vista de auditoría
### [ ] AUTH-UI-020 — Clasificar vista personal o de cliente
### [ ] AUTH-UI-021 — Definir actores objetivo
### [ ] AUTH-UI-022 — Definir dispositivo de uso
### [ ] AUTH-UI-023 — Definir frecuencia de uso
### [ ] AUTH-UI-024 — Definir acción principal
### [ ] AUTH-UI-025 — Definir acciones secundarias
### [ ] AUTH-UI-026 — Identificar vistas duplicadas
### [ ] AUTH-UI-027 — Identificar vistas legacy
### [ ] AUTH-UI-028 — Identificar vistas candidatas a retiro
### [ ] AUTH-UI-029 — Identificar vistas técnicas que no deben ser permisos

AUTORIZACIÓN

### [ ] AUTH-UI-030 — Asignar permiso de lectura a cada vista
### [ ] AUTH-UI-031 — Asignar permiso exacto a cada acción
### [ ] AUTH-UI-032 — Definir si requiere turno
### [ ] AUTH-UI-033 — Definir si requiere check-in
### [ ] AUTH-UI-034 — Definir si requiere sede
### [ ] AUTH-UI-035 — Definir si requiere área
### [ ] AUTH-UI-036 — Definir si admite dispositivo compartido
### [ ] AUTH-UI-037 — Definir si admite simulación
### [ ] AUTH-UI-038 — Definir campos sensibles visibles
### [ ] AUTH-UI-039 — Definir masking según permiso
### [ ] AUTH-UI-040 — Ocultar enlaces no autorizados
### [ ] AUTH-UI-041 — Bloquear acceso directo por URL
### [ ] AUTH-UI-042 — Bloquear acciones aunque el botón sea visible
### [ ] AUTH-UI-043 — Vincular cada acción con protección de servidor
### [ ] AUTH-UI-044 — Evitar permisos derivados de nombres de rutas
### [ ] AUTH-UI-045 — Unificar navegación y autorización

EXPERIENCIA

### [ ] AUTH-UI-046 — Mostrar contexto activo en cada aplicación
### [ ] AUTH-UI-047 — Mostrar rol simulado claramente
### [ ] AUTH-UI-048 — Estandarizar estados sin acceso
### [ ] AUTH-UI-049 — Estandarizar estados de carga
### [ ] AUTH-UI-050 — Estandarizar estados vacíos
### [ ] AUTH-UI-051 — Estandarizar errores recuperables
### [ ] AUTH-UI-052 — Diseñar página inicial según actor
### [ ] AUTH-UI-053 — Diseñar navegación según tareas frecuentes
### [ ] AUTH-UI-054 — Reducir opciones irrelevantes
### [ ] AUTH-UI-055 — Crear prototipo por rol
### [ ] AUTH-UI-056 — Validar prototipo antes de implementar
### [ ] AUTH-UI-057 — Definir criterio de usabilidad por pantalla
### [ ] AUTH-UI-058 — Probar con usuarios reales
### [ ] AUTH-UI-059 — Registrar problemas encontrados
### [ ] AUTH-UI-060 — Aprobar la pantalla antes de retirarla del roadmap

