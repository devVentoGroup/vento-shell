### MINI-BLOQUE — INVENTARIO DE SUPERFICIES DE SERVIDOR

<!-- PLAN-SECTION-META:START -->
**Cobertura canónica:** `AUTH-SRV-001` a `AUTH-SRV-003` — 3 tareas.
<!-- PLAN-SECTION-META:END -->

### ✅ AUTH-SRV-001 — Inventariar Server Actions de todos los repositorios

**Estado:** APROBADA
**Tarea anterior:** SHELL-CI-024 — Certificar cierre del paquete y transferencia a soporte
**Tarea siguiente:** AUTH-SRV-002 — Inventariar API routes
**Tipo de tarea:** Contrato global con materialización por unidad (`PER_IMPLEMENTATION_UNIT`) — inventario técnico transversal y reproducible de superficies Server Action existentes, su identidad de código, sus efectos observables y el lineage requerido para futuras unidades de implementación
**Bloque:** BLOQUE J — Protección de acciones de servidor
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/J_ACCIONES_DE_SERVIDOR/01_INVENTARIO_DE_SUPERFICIES_DE_SERVIDOR.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** 0 durante el marcador global; las futuras materializaciones ocurren únicamente por `AUTH-SRV-001::<implementation_unit_id>` después de asignación de `implementation_unit_id` por `DELIV-PKG-025::<package_id>` y `E5-GATE-008::<package_id>` aplicable
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Establecer un inventario canónico, reproducible y trazable de las superficies Server Action observables en los repositorios actuales relacionados con Vento OS, sin convertir su mera existencia en aprobación de seguridad, autorización, territorio, auditoría o aptitud productiva.

La unidad de identidad mínima queda:

```text
repository
+ commit
+ source_path
+ action_name
= server_action_identity
```

La unidad física futura queda:

```text
AUTH-SRV-001::<implementation_unit_id>
```

y puede ser consumida por uno o varios `package_id` mediante lineage explícito sin repetir la misma implementación por paquete.

#### 2. Frontera de responsabilidad

`AUTH-SRV-001` inventaría superficies Server Action.

No decide todavía:

- si una acción confía en la interfaz;
- si revalida el permiso correcto;
- si valida sede;
- si valida área;
- si valida turno;
- si valida rol;
- si valida dispositivo compartido;
- si revalida estado actual;
- si permite operaciones cross-site o cross-area;
- si audita correctamente;
- si su manejo de errores es seguro;
- si usa helpers compartidos aprobados.

Esas decisiones pertenecen a `AUTH-SRV-004..018`.

`AUTH-SRV-002` conserva API routes y endpoints internos.
`AUTH-SRV-003` conserva RPC usadas desde servidor.

Una misma pieza puede aparecer como dependencia de varias superficies sin cambiar de owner.

#### 3. Regla de inclusión

Se incluye como superficie Server Action toda función o contenedor fuente que cumpla al menos una de estas condiciones verificables:

1. módulo con directiva de archivo `"use server"`;
2. función inline que contiene directiva `"use server"`;
3. función exportada desde un módulo `"use server"` y, por tanto, expuesta por el modelo Server Action del framework;
4. acción ya identificada explícitamente por una fuente canónica previa y confirmada contra el código del snapshot.

No se clasifica como Server Action solo por:

- ejecutar en servidor;
- usar Supabase;
- ser `async`;
- vivir en un archivo `actions.ts`;
- ser route handler;
- invocar RPC;
- usar service role;
- aparecer en un test o fixture.

#### 4. Regla de exclusión y clasificación vecina

Quedan fuera del inventario Server Action de esta tarea:

- route handlers `route.ts` como identidad primaria, reservados a `AUTH-SRV-002`;
- RPC como identidad primaria, reservadas a `AUTH-SRV-003`;
- Edge Functions;
- triggers;
- funciones SQL;
- scripts CLI;
- helpers server-only no expuestos como Server Action;
- coincidencias de `"use server"` dentro de fixtures, tests o scripts de calidad cuando no definen una superficie real.

Una Server Action puede consumir una RPC o un helper; esa relación se registra como dependencia y no fusiona las identidades.

#### 5. Corte de auditoría

El baseline remoto se fija a las revisiones observadas en la rama principal de cada repositorio durante el desarrollo de este marcador.

| Repositorio                       | Commit del snapshot                        | Directiva Server Action detectada | Observación                                                               |
| --------------------------------- | ------------------------------------------ | --------------------------------- | ------------------------------------------------------------------------- |
| `vento-group-sas/vento-shell`     | `2e12490a1d159a6152032d5472b937c05fa4b2bb` | Sí                                | baseline estable después del cierre de BLOQUE T                           |
| `vento-group-sas/vento-viso`      | `8cf7c49a593c748cb6c99dd9b919b6947bcfec14` | Sí                                | administración, horarios, CMS, comercial y configuración                  |
| `vento-group-sas/vento-nexo`      | `250097e3f615e895dbcc7236c5262f72c406235a` | Sí                                | inventario, activos, remisiones, configuración y solicitudes              |
| `vento-group-sas/vento-fogo`      | `9bc068d3c5afb7f34ae58c8664685feb5aad812a` | Sí                                | recetas y lotes de producción                                             |
| `vento-group-sas/vento-origo`     | `131205837d1b08ded1cb51bb4c9ec914fa00afd6` | Sí                                | proveedores, OC, recepciones y revisión de maestro                        |
| `vento-group-sas/vento-pulso`     | `383d52b20c6af10066d8f2f1f2b137e90b588173` | Sí                                | POS, lealtad, pedidos e importaciones                                     |
| `vento-group-sas/vento-numera`    | `41050e3387db4e74216e4e42bc575490cc40fbb1` | No detectada                      | no se promueve el inventario histórico antiguo sobre el código actual     |
| `vento-group-sas/vento-anima`     | `8bcfaaa3b6ab79d5839c03719edec7b50fd97d2d` | No detectada                      | aplicación móvil; conserva otras fronteras server/RPC                     |
| `carlosibarraariza/Vento-Group`   | `aa5290cb2336681bf0a84bcf6dc03faca10c7c0d` | No detectada                      | web pública                                                               |
| `carlosibarraariza/vento-pass`    | `b5a4aec908ef12226f798078577ab089a29ccda2` | No detectada                      | aplicación móvil; conserva otras fronteras server/RPC                     |
| `carlosibarraariza/vento-talento` | `dd39071daf587e3f006df62b646f8ad4b1b8de2c` | No detectada                      | base técnica no desplegada en la línea operativa actual                   |
| `carlosibarraariza/vento-vital`   | `92d43bfac1f42d379928608005375a4b09bb04a4` | No detectada                      | repositorio reconciliado, fuera de cobertura operativa actual de Vento OS |

Resultado del universo:

```text
REPOSITORIOS_RECONCILIADOS = 12
CON_DIRECTIVA_SERVER_ACTION = 6
SIN_DIRECTIVA_DETECTADA = 6
ARCHIVOS_FUENTE_CON_DIRECTIVA_RELEVANTE = 103
```

AURA no se agrega como repositorio porque la línea canónica no dispone de un repositorio AURA confirmado.

#### 6. Regla de snapshot y drift

Los conteos anteriores pertenecen exclusivamente a los commits declarados.

Si cambia el commit:

```text
snapshot anterior
≠ inventario actual automático
```

La futura instancia por `implementation_unit_id` deberá reconciliar delta:

```text
added
removed
renamed
moved
changed
unchanged
```

sin renumerar o borrar historia silenciosamente.

#### 7. Inventario fuente — SHELL

Snapshot:

```text
vento-group-sas/vento-shell
2e12490a1d159a6152032d5472b937c05fa4b2bb
```

Superficie detectada:

- `src/app/page.tsx`

Acción confirmada:

| Acción          | Estilo                | Entrada observable      | Dependencia / efecto | Acceso observado | Resultado                    |
| --------------- | --------------------- | ----------------------- | -------------------- | ---------------- | ---------------------------- |
| `signOutAction` | inline `"use server"` | sin payload empresarial | cierre de sesión     | sesión Supabase  | redirect posterior al logout |

La presencia de la acción no declara correcto su gobierno; las tareas posteriores evalúan su contrato de autorización y error cuando corresponda.

#### 8. Inventario fuente — VISO

Snapshot:

```text
vento-group-sas/vento-viso
8cf7c49a593c748cb6c99dd9b919b6947bcfec14
```

Se detectan **45 contenedores fuente reales** con directiva, excluyendo la coincidencia observada en el script de calidad que no constituye una Server Action productiva:

- `src/app/products/[id]/page.tsx`
- `src/app/sites/[id]/page.tsx`
- `src/app/staff/schedule/month/visibility-actions.ts`
- `src/app/vacancies/new/page.tsx`
- `src/app/products/new/page.tsx`
- `src/app/sites/[id]/documentos/page.tsx`
- `src/app/pass-users/[id]/page.tsx`
- `src/app/pass-users/new/page.tsx`
- `src/app/vacancies/[id]/page.tsx`
- `src/app/staff/[id]/page.tsx`
- `src/app/businesses/[id]/page.tsx`
- `src/app/businesses/new/page.tsx`
- `src/app/delivery-rates/page.tsx`
- `src/app/staff/schedule/actions.ts`
- `src/app/staff/schedule/settings/page.tsx`
- `src/app/menu/new/page.tsx`
- `src/app/operations-map/page.tsx`
- `src/app/app-navigation/page.tsx`
- `src/app/roles-permissions/page.tsx`
- `src/app/menu/[id]/page.tsx`
- `src/app/content-blocks/[id]/page.tsx`
- `src/components/viso/business-hours.tsx`
- `src/app/commercial-categories/page.tsx`
- `src/app/website-cms/venues/page.tsx`
- `src/app/website-cms/items/[id]/page.tsx`
- `src/app/website-cms/blocks/new/page.tsx`
- `src/app/commercial-collections/page.tsx`
- `src/app/website-cms/blocks/[id]/page.tsx`
- `src/app/staff/calendar/page.tsx`
- `src/app/commercial-availability/page.tsx`
- `src/app/operations/site-roles/page.tsx`
- `src/app/website-cms/items/new/page.tsx`
- `src/components/viso/site-operation-panel.tsx`
- `src/app/staff/shared-devices/new/page.tsx`
- `src/app/staff/schedule/month/actions.ts`
- `src/components/viso/business-schedule-exceptions.tsx`
- `src/app/staff/schedule/global/page.tsx`
- `src/app/operations/checkin-points/page.tsx`
- `src/app/website-cms/venues/[slug]/page.tsx`
- `src/components/viso/scheduled-order-rescheduler.tsx`
- `src/app/staff/schedule/month/block-actions.ts`
- `src/app/operations/employee-profiles/page.tsx`
- `src/app/staff/schedule/month/operational-view-actions.ts`
- `src/components/viso/scheduled-order-conflicts.tsx`
- `src/components/viso/scheduled-order-contact-resolution.tsx`

Este conjunto cubre administración de productos, sedes, documentos, PASS users, vacantes, trabajadores, empresas, tarifas, horarios, menú, navegación, roles, CMS, comercial, operación, dispositivos compartidos y utilidades de interacción server.

#### 9. Matriz individual obligatoria — VISO mensual

El contrato mensual ya reservado se fija a:

```text
src/app/staff/schedule/month/actions.ts
```

y contiene las cuatro identidades:

| Acción                          | Entrada primaria                                        | Persistencia / efecto observado                                       | Control observado                                                                     | Revalidación / salida                               |
| ------------------------------- | ------------------------------------------------------- | --------------------------------------------------------------------- | ------------------------------------------------------------------------------------- | --------------------------------------------------- |
| `createMonthlyShiftsAction`     | `FormData` con trabajador, sede, mes, bloques y retorno | inserción y consulta de `employee_shifts`; consumo de matriz/perfiles | `requireStaffScheduleAccess`; vínculo trabajador-sede; validación de matriz operativa | revalidación de calendario y redirect con resultado |
| `deleteMonthlyDraftShiftAction` | `FormData` con shift, sede, mes y retorno               | eliminación/control de borrador mensual                               | `requireStaffScheduleAccess` y estado del turno                                       | revalidación de programación y redirect             |
| `deleteMonthlyDraftsAction`     | `FormData` con sede, mes y retorno                      | eliminación de borradores elegibles del mes                           | `requireStaffScheduleAccess` y filtros de estado/mes                                  | revalidación de programación y redirect             |
| `publishMonthAction`            | `FormData` con sede, mes y retorno                      | publicación de turnos del mes y efectos asociados                     | `requireStaffScheduleAccess` y validaciones de programación                           | revalidación y redirect                             |

`requireStaffScheduleAccess` queda registrado como evidencia de control existente, no como permiso atómico automáticamente aprobado.

#### 10. Inventario fuente — NEXO

Snapshot:

```text
vento-group-sas/vento-nexo
250097e3f615e895dbcc7236c5262f72c406235a
```

Se detectan **42 contenedores fuente** con directiva relevante:

- `src/app/inventory/stock/actions.ts`
- `src/app/inventory/catalog/actions.ts`
- `src/app/inventory/assets/items/[id]/actions.ts`
- `src/app/inventory/remissions/receive/actions.ts`
- `src/app/inventory/settings/categories/actions.ts`
- `src/app/inventory/remissions/conductor/actions.ts`
- `src/app/inventory/settings/internal-prices/actions.ts`
- `src/app/inventory/settings/units/page.tsx`
- `src/app/inventory/settings/supply-routes/page.tsx`
- `src/app/inventory/settings/sites/page.tsx`
- `src/app/inventory/locations/page.tsx`
- `src/app/inventory/settings/remissions/page.tsx`
- `src/app/inventory/entries/actions.ts`
- `src/app/inventory/cost-center/page.tsx`
- `src/app/inventory/remissions/actions.ts`
- `src/app/inventory/catalog/new/actions.ts`
- `src/app/inventory/withdraw/page.tsx`
- `src/app/inventory/assets/new/page.tsx`
- `src/app/inventory/transfers/page.tsx`
- `src/app/inventory/assets/quick/page.tsx`
- `src/app/inventory/settings/locations/[id]/catalog/page.tsx`
- `src/app/inventory/settings/products/actions.ts`
- `src/app/inventory/catalog/presentations/page.tsx`
- `src/app/inventory/assets/counts/page.tsx`
- `src/app/inventory/assets/counts/[id]/page.tsx`
- `src/app/inventory/locations/[id]/page.tsx`
- `src/app/inventory/settings/remissions/products/actions.ts`
- `src/app/inventory/catalog/[id]/actions.ts`
- `src/app/inventory/settings/request-policies/measurement-actions.ts`
- `src/app/inventory/locations/[id]/positions/page.tsx`
- `src/app/inventory/assets/groups/[id]/page.tsx`
- `src/app/inventory/stock/assign-location/page.tsx`
- `src/app/inventory/remissions/fulfillment/actions.ts`
- `src/app/inventory/count-initial/session/[id]/page.tsx`
- `src/app/inventory/remissions/[id]/edit/page.tsx`
- `src/app/inventory/locations/[id]/board/page.tsx`
- `src/app/inventory/settings/sites/[id]/operations/page.tsx`
- `src/app/inventory/settings/request-policies/actions.ts`
- `src/app/inventory/catalog/[id]/presentations/page.tsx`
- `src/app/inventory/settings/fulfillment-routes/page.tsx`
- `src/app/inventory/locations/[id]/kiosk-withdraw/actions.ts`
- `src/app/inventory/remissions/[id]/detail-actions.ts`

El inventario demuestra una concentración material de Server Actions en inventario, activos, catálogo, stock, recepciones, remisiones, transferencias, conteos, políticas y configuración territorial.

Esta tarea no concluye que los 42 contenedores estén autorizados correctamente; únicamente fija su existencia y ubicación.

#### 11. Inventario fuente — FOGO

Snapshot:

```text
vento-group-sas/vento-fogo
9bc068d3c5afb7f34ae58c8664685feb5aad812a
```

Contenedores:

- `src/app/recipes/new/page.tsx`
- `src/app/recipes/[id]/edit/page.tsx`
- `src/app/production-batches/new/page.tsx`

Acciones confirmadas:

| Ruta                                      | Acción        | Entrada    | Efecto observado                                                                           | Control observado                                                          |
| ----------------------------------------- | ------------- | ---------- | ------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------- |
| `src/app/recipes/new/page.tsx`            | `saveRecipe`  | `FormData` | creación de receta, relaciones y configuración                                             | `requireAppAccess`; permiso de gestión de recetas                          |
| `src/app/recipes/[id]/edit/page.tsx`      | `saveRecipe`  | `FormData` | actualización de receta y relaciones                                                       | `requireAppAccess`; permiso de gestión de recetas                          |
| `src/app/production-batches/new/page.tsx` | `createBatch` | `FormData` | creación de lote real mediante `fogo_create_real_production_batch` y trazabilidad asociada | `requireAppAccess`; firma de actor en dispositivo compartido cuando aplica |

Las dos funciones `saveRecipe` son identidades distintas porque su `source_path` es distinto.

#### 12. Inventario fuente — ORIGO

Snapshot:

```text
vento-group-sas/vento-origo
131205837d1b08ded1cb51bb4c9ec914fa00afd6
```

Contenedores:

- `src/app/suppliers/actions.ts`
- `src/app/purchase-orders/actions.ts`
- `src/app/receipts/page.tsx`
- `src/app/receipts/new/page.tsx`
- `src/app/product-master-review/page.tsx`

Acciones individualmente confirmadas:

| Ruta                                     | Acción                       |
| ---------------------------------------- | ---------------------------- |
| `src/app/suppliers/actions.ts`           | `createSupplier`             |
| `src/app/suppliers/actions.ts`           | `updateSupplier`             |
| `src/app/suppliers/actions.ts`           | `deleteSupplier`             |
| `src/app/purchase-orders/actions.ts`     | `createPurchaseOrder`        |
| `src/app/purchase-orders/actions.ts`     | `setPurchaseOrderSent`       |
| `src/app/purchase-orders/actions.ts`     | `updatePurchaseOrder`        |
| `src/app/purchase-orders/actions.ts`     | `deletePurchaseOrder`        |
| `src/app/receipts/page.tsx`              | `reverseReceipt`             |
| `src/app/receipts/new/page.tsx`          | `createReceipt`              |
| `src/app/product-master-review/page.tsx` | `approvePresentationRequest` |
| `src/app/product-master-review/page.tsx` | `approveNewProductRequest`   |
| `src/app/product-master-review/page.tsx` | `rejectReviewRequest`        |

Se observan mutaciones sobre proveedores, órdenes, entradas de inventario, maestro de productos/presentaciones y RPC relacionadas. Su seguridad y territorialidad quedan pendientes de las tareas posteriores del bloque.

#### 13. Inventario fuente — PULSO

Snapshot:

```text
vento-group-sas/vento-pulso
383d52b20c6af10066d8f2f1f2b137e90b588173
```

Contenedores:

- `src/modules/pos/api/loyalty-award.api.ts`
- `src/modules/pos/actions/award-loyalty.action.ts`
- `src/modules/pos/api/redemption.api.ts`
- `src/modules/pos/actions/identify-client.action.ts`
- `src/modules/pos/actions/validate-redemption.action.ts`
- `src/app/orders/page.tsx`
- `src/app/sales-imports/page.tsx`

Acciones individualmente confirmadas en el muestreo íntegro de esos contenedores:

| Ruta                                                    | Acción                         |
| ------------------------------------------------------- | ------------------------------ |
| `src/modules/pos/api/loyalty-award.api.ts`              | `awardExternalLoyaltyPoints`   |
| `src/modules/pos/actions/award-loyalty.action.ts`       | `awardLoyaltyPointsAction`     |
| `src/modules/pos/api/redemption.api.ts`                 | `validateRedemption`           |
| `src/modules/pos/api/redemption.api.ts`                 | `markRedemptionAsUsed`         |
| `src/modules/pos/actions/identify-client.action.ts`     | `identifyClientAction`         |
| `src/modules/pos/actions/validate-redemption.action.ts` | `processRedemptionAction`      |
| `src/app/orders/page.tsx`                               | `updateOperationalOrderAction` |
| `src/app/orders/page.tsx`                               | `assignDispatchOrderAction`    |
| `src/app/orders/page.tsx`                               | `sendOrderMessageLiveAction`   |
| `src/app/sales-imports/page.tsx`                        | `saveMakosMapping`             |
| `src/app/sales-imports/page.tsx`                        | `importDailySales`             |
| `src/app/sales-imports/page.tsx`                        | `postDailySalesImport`         |

El nombre de carpeta `api` dentro de `src/modules/pos/api` no convierte esas funciones en route handlers: en el snapshot son módulos con directiva `"use server"` y por ello permanecen inventariados aquí. Cualquier endpoint HTTP real continúa perteneciendo a `AUTH-SRV-002`.

#### 14. Repositorios sin directiva detectada

En los snapshots fijados no se detecta directiva Server Action en:

- `vento-group-sas/vento-numera`;
- `vento-group-sas/vento-anima`;
- `carlosibarraariza/Vento-Group`;
- `carlosibarraariza/vento-pass`;
- `carlosibarraariza/vento-talento`;
- `carlosibarraariza/vento-vital`.

`SIN_DIRECTIVA_DETECTADA` no significa:

- ausencia de backend;
- ausencia de mutaciones;
- ausencia de RPC;
- ausencia de Edge Functions;
- seguridad aprobada;
- repositorio fuera de auditoría futura.

Solo significa que el patrón Server Action de esta tarea no fue observado en el snapshot declarado.

#### 15. NUMERA y reconciliación con inventarios históricos

Inventarios E1 anteriores describieron al menos una operación NUMERA como Server Action.

El snapshot actual no devuelve directiva `"use server"` en `vento-group-sas/vento-numera`.

Por tanto:

```text
inventario histórico
+ snapshot actual divergente
→ DRIFT A RECONCILIAR
```

No se fuerza el hallazgo antiguo sobre el código actual ni se borra la historia.

La futura instancia propietaria deberá resolver si la capacidad:

- migró a otra frontera;
- fue retirada;
- cambió de repositorio;
- quedó indirecta;
- o el patrón actual requiere una técnica de descubrimiento complementaria.

#### 16. TALENTO

TALENTO permanece inventariado como repositorio técnico existente pero sin directiva Server Action detectada en el snapshot actual.

La ausencia de despliegue/readiness impide presentar TALENTO como capacidad operativa.

Las obligaciones de protección server vinculadas a TALENTO permanecen como cobertura futura y no crean acciones inexistentes.

#### 17. VITAL

VITAL se conserva como fila reconciliada por pertenecer al inventario histórico de repositorios, pero permanece fuera de la cobertura operativa actual de Vento OS.

No se crean tareas, paquetes o acciones VENTO para VITAL por inferencia.

#### 18. AURA

AURA no dispone de repositorio confirmado en la línea actual.

Resultado:

```text
AURA
→ NO ES FILA DE REPOSITORIO
→ NO SE INVENTAN SERVER ACTIONS
→ conserva su gate propietario
```

#### 19. Identidad canónica de cada acción

Toda acción futura deberá materializar una identidad estable:

```text
server_action_id
repository
commit
source_path
action_name
definition_style
implementation_unit_id
owner_package_id
consumer_package_ids
```

`server_action_id` no se inventa en este marcador para acciones que todavía no tienen identificador canónico.

La identidad física se resolverá al materializar la unidad.

#### 20. Campos mínimos del manifiesto por acción

Cada `AUTH-SRV-001::<implementation_unit_id>` deberá registrar, por acción aplicable:

```text
repository
commit
source_path
action_name
definition_style
input_shape
return_shape
tables_or_resources
rpc_dependencies
storage_dependencies
external_effects
authn_observed
authz_guard_observed
site_context_observed
area_context_observed
shift_context_observed
role_context_observed
shared_device_observed
entity_state_revalidation_observed
audit_observed
revalidation_or_redirect
error_surface
callers_or_consumers
owner_package_id
consumer_package_ids
evidence
```

Los campos `*_observed` describen evidencia, no aprobación.

#### 21. Estilos de definición

Se distinguen:

```text
MODULE_DIRECTIVE
INLINE_FUNCTION_DIRECTIVE
```

Una acción inline puede vivir dentro de `page.tsx` o componente server.

Un módulo con `"use server"` expone sus exports server, pero helpers no exportados que solo asisten a la acción no adquieren una identidad pública separada salvo que también sean superficie invocable.

#### 22. Entradas

El inventario registra la forma real de entrada:

- `FormData`;
- parámetros escalares;
- objetos tipados;
- identificadores;
- payloads compuestos;
- archivos;
- parámetros opcionales;
- valores de contexto recibidos del caller.

Registrar un campo no concede autoridad a ese campo.

Especialmente:

```text
siteId recibido
≠ sede autorizada
role recibido
≠ rol efectivo
permission recibido
≠ permiso válido
```

#### 23. Persistencia y efectos

Por cada acción se registran las tablas, RPC, Storage, colas, integraciones y efectos externos observables.

Esto permite separar:

```text
ACTION
→ DEPENDENCIA
```

sin convertir la dependencia en la misma superficie.

`AUTH-SRV-003` conserva el inventario propio de RPC.

#### 24. Autenticación y autorización observadas

El inventario registra controles existentes como evidencia literal:

- `requireAppAccess`;
- `requireStaffScheduleAccess`;
- `requireCanManageSuppliers`;
- `has_permission`;
- firma de actor en dispositivo compartido;
- sesión Supabase;
- otros guards encontrados.

No se asigna estado de seguridad positivo en `AUTH-SRV-001`.

La suficiencia de esos controles se decide después.

#### 25. Territorio observado

Cuando una acción recibe, calcula o consulta sede/área se registra el dato.

No se concluye:

```text
consulta de site_id
= validación territorial suficiente
```

Las tareas `AUTH-SRV-006`, `AUTH-SRV-007`, `AUTH-SRV-012` y `AUTH-SRV-013` conservan esa decisión.

#### 26. Estado actual de la entidad

Una comprobación local sobre status, existencia o versión se registra como evidencia de estado.

La suficiencia frente a race conditions, stale state o TOCTOU pertenece a `AUTH-SRV-011` y tareas posteriores aplicables.

#### 27. Auditoría

El inventario registra si existen señales de auditoría:

- actor;
- user id;
- firmas;
- eventos;
- metadata;
- timestamps;
- logs estructurados;
- tablas de auditoría.

No se concluye que una `console.*` constituya auditoría suficiente.

#### 28. Revalidación, redirect y resultado

La presencia de:

- `revalidatePath`;
- `redirect`;
- retorno tipado;
- error tipado;
- `throw`;
- mensaje público;

se registra porque forma parte de la frontera observable de la acción.

La seguridad de la superficie de error pertenece a `AUTH-SRV-015`.

#### 29. Consumidores

Una acción puede ser consumida por:

- formularios server/client;
- componentes;
- páginas;
- otros helpers server;
- acciones compuestas.

El inventario conserva consumidores observables cuando sean relevantes para una unidad.

No se infiere consumidor solo por similitud de nombre.

#### 30. Lineage por implementation unit

La topología vinculante queda:

```text
GLOBAL AUTH-SRV-001
→ define inventario y contrato

DELIV-PKG-025::<package_id>
→ asigna implementation_unit_id

E5-GATE-008::<package_id> = PASS
→ habilita elegibilidad física

AUTH-SRV-001::<implementation_unit_id>
→ materializa el inventario exacto una sola vez

package A ─┐
package B ─┼→ consume la misma unidad mediante lineage
package C ─┘
```

No se repite el mismo escaneo físico por cada paquete consumidor cuando la unidad es idéntica.

#### 31. Staleness de evidencia

La evidencia queda stale si cambia cualquiera de:

```text
repository
commit
source_path
action_name
implementation_unit_id
owner package
dependency set material
```

Una evidencia de otro commit puede servir como historia, pero no certifica el snapshot nuevo.

#### 32. Renombres y movimientos

Un movimiento de ruta no se trata automáticamente como acción nueva.

Debe reconciliar:

- contenido;
- nombre;
- consumidores;
- efectos;
- historia Git cuando sea necesaria;
- owner.

Solo una identidad materialmente distinta recibe una identidad física diferente conforme al carril propietario.

#### 33. Eliminaciones

Una acción ausente en un snapshot posterior no se declara retirada únicamente por búsqueda negativa.

Debe reconciliarse con:

- imports;
- consumidores;
- rutas;
- framework conventions;
- scripts;
- paquetes;
- despliegues;
- evidencia de retiro.

La política de retiro vigente permanece separada.

#### 34. Duplicados funcionales

Dos acciones con nombres distintos pero efecto equivalente no se fusionan durante el inventario.

Dos acciones con el mismo nombre en rutas diferentes tampoco se fusionan.

La deduplicación o consolidación corresponde a una tarea con autoridad para cambiar arquitectura.

#### 35. Riesgos observados sin corrección anticipada

El inventario deja explícitamente para etapas posteriores riesgos como:

- permisos derivados de helpers monolíticos;
- `siteId` recibido desde formulario;
- operaciones cross-site;
- uso de service role/admin client;
- estados leídos antes de mutar;
- doble escritura;
- RPC con autoridad propia;
- efectos externos;
- redirecciones con mensajes crudos;
- `console.error` como única señal;
- shared-device actor attribution;
- mutaciones de maestro e inventario.

Detectar un riesgo no autoriza corregirlo en esta tarea.

#### 36. Relación con BLOQUE J posterior

Handoff:

```text
AUTH-SRV-001 inventario de Server Actions
→ AUTH-SRV-002 API routes
→ AUTH-SRV-003 RPC usadas desde servidor
→ AUTH-SRV-004..013 autorización y territorio
→ AUTH-SRV-014 auditoría
→ AUTH-SRV-015 errores
→ AUTH-SRV-016 tipado
→ AUTH-SRV-017 helpers compartidos
→ AUTH-SRV-018 auditContext
```

Cada tarea consume el inventario sin reescribir su historia.

#### 37. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0
**Fragmentos 04A afectados:** 0

**Justificación:** esta tarea materializa un inventario técnico y el contrato de identidad/lineage de superficies existentes. No introduce una regla funcional nueva, una autorización nueva, una transición de datos nueva, un algoritmo empresarial nuevo ni una integración nueva. Las obligaciones de seguridad y regresión ya existentes continúan bajo sus requisitos y tareas propietarias.

#### 38. Cobertura de prueba vigente reutilizada

Se conserva como cobertura heredada, sin modificar el registro:

- la obligación VISO de registrar cualquier delta de Server Actions antes del paquete mensual;
- la obligación transversal de `requireAuthorization` y protección fail-closed para consumidores server;
- las obligaciones TALENTO de protección server cuando esa línea futura se materialice;
- los requisitos ya vinculados a rutas, contexto, autorización, territorio, evidencia y regresión de los repositorios afectados.

Esta sección es trazabilidad, no una actualización de 04A.

#### 39. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                                                                                                                                                                               |
| --------- | -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | El marcador documental no ejecuta builds ni modifica código de los repositorios consumidores.                                                                                                                                                                                                           |
| LOCAL     | NOT_EXECUTED   | La validación estructural y documental del artefacto se ejecutará en el checkout actualizado antes de la aprobación canónica del usuario.                                                                                                                                                               |
| REMOTA    | PASS           | Se verificó continuidad desde `main`, owner de BLOQUE J, topología `PER_IMPLEMENTATION_UNIT`, universo histórico de repositorios, snapshots de las ramas principales, búsqueda exacta de directiva `"use server"` y contenido concreto en acciones representativas de SHELL, VISO, FOGO, ORIGO y PULSO. |
| OPERATIVA | NOT_EXECUTED   | No se invocó ninguna Server Action, RPC, mutación, login, flujo operativo o ambiente desplegado.                                                                                                                                                                                                        |
| FÍSICA    | NOT_APPLICABLE | No existe instancia `AUTH-SRV-001::<implementation_unit_id>` autorizada ni materializada durante el marcador global.                                                                                                                                                                                    |

#### 40. Criterios de aceptación

`AUTH-SRV-001` queda documentalmente completa cuando:

- identifica exactamente la tarea anterior y siguiente;
- conserva topología `PER_IMPLEMENTATION_UNIT`;
- reconcilia los doce repositorios del universo técnico actual;
- fija commit de snapshot por repositorio;
- distingue repositorios con y sin directiva detectada;
- no crea un repositorio AURA inexistente;
- conserva TALENTO como no desplegado;
- conserva VITAL fuera de cobertura operativa actual;
- separa Server Actions de API routes, RPC, Edge Functions y helpers;
- fija 103 contenedores fuente relevantes en el snapshot;
- excluye coincidencias de scripts/fixtures que no son superficies reales;
- materializa la matriz exacta del módulo mensual VISO;
- registra acciones concretas comprobadas en SHELL, FOGO, ORIGO y PULSO;
- exige identidad `repository + commit + source_path + action_name`;
- define el manifiesto mínimo por acción;
- registra entradas, efectos, controles, territorio, auditoría, error y consumidores como evidencia observada;
- no convierte evidencia observada en aprobación;
- no corrige seguridad o autorización en esta tarea;
- conserva lineage por `implementation_unit_id`;
- impide repetir implementación por cada package consumidor;
- define stale evidence;
- conserva renombres, movimientos y eliminaciones como reconciliaciones explícitas;
- no crea ni modifica requisitos;
- no modifica 04A;
- no materializa una instancia física;
- entrega un handoff cerrado a `AUTH-SRV-002`.

#### 41. Límites

Esta tarea documental no:

- crea `AUTH-SRV-001::<implementation_unit_id>`;
- modifica Server Actions;
- agrega guards;
- cambia permisos;
- cambia sede o área;
- cambia roles;
- cambia turnos;
- cambia reglas de dispositivo compartido;
- cambia Supabase;
- crea migraciones;
- ejecuta RPC;
- modifica RLS;
- modifica Storage;
- modifica datos;
- corrige errores;
- crea auditoría;
- consolida helpers;
- elimina acciones;
- renombra acciones;
- mueve archivos;
- crea API routes;
- inventaría en detalle API routes;
- inventaría en detalle RPC;
- aprueba TALENTO como desplegado;
- integra VITAL en Vento OS;
- crea repositorio AURA;
- crea requisitos de prueba;
- modifica requisitos de prueba;
- modifica 04A;
- desarrolla `AUTH-SRV-002`.

#### 42. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-CI-024 — Certificar cierre del paquete y transferencia a soporte`

**TAREA ACTUAL APROBADA**
`AUTH-SRV-001 — Inventariar Server Actions de todos los repositorios`

**SIGUIENTE TAREA RESERVADA**
`AUTH-SRV-002 — Inventariar API routes`


### [ ] AUTH-SRV-002 — Inventariar API routes
### [ ] AUTH-SRV-003 — Inventariar RPC utilizadas

### Package VISO mensual

`AUTH-SRV-001` registra `createMonthlyShiftsAction`, `deleteMonthlyDraftShiftAction`, `deleteMonthlyDraftsAction` y `publishMonthAction`, con entradas, tablas, cliente, acceso, mutación, revalidación, auditoría y error.

`AUTH-SRV-002` confirma que no hay API route nueva. `AUTH-SRV-003` no clasifica el trigger como RPC.
