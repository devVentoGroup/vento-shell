### MINI-BLOQUE — MIGRACIÓN COORDINADA DE CONSUMIDORES WEB

<!-- PLAN-SECTION-META:START -->
Esta sección organiza la adopción progresiva de contratos, componentes y paquetes compartidos por los consumidores web. No autoriza una migración masiva ni simultánea: cada aplicación conserva su lote, evidencia, compatibilidad y rollback.

**Cobertura canónica:** `SHELL-MIG-001` a `SHELL-MIG-008` — 8 tareas.

**Resultado esperado:** los consumidores web abandonan copias legacy mediante lotes reversibles, conservan extensiones locales válidas y demuestran paridad antes de retirar artefactos anteriores.

**Puerta de entrada del mini-bloque:** contratos, paquetes y componentes involucrados aprobados; inventario de consumidores vigente; paquete de cambio identificado.

**Puerta de salida del mini-bloque:** cero consumidores legacy no autorizados, evidencia por repositorio, rollback probado y retiro ejecutado únicamente para identidades aprobadas.
<!-- PLAN-SECTION-META:END -->

### ✅ SHELL-MIG-001 — Consolidar inventario ejecutable de consumidores

**Estado:** APROBADA
**Tarea anterior:** SHELL-UI-020 — Incorporar Skeleton, listas y paginación
**Tarea siguiente:** SHELL-MIG-002 — Definir lotes reversibles por repositorio
**Tipo de tarea:** documental; consolidación ejecutable y trazable de consumidores web, extensiones, entrypoints, scripts y CI que deberán migrarse, conservarse o retirarse mediante paquetes de cambio reversibles, sin ejecutar migraciones físicas
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/07_01_MIGRACION_COORDINADA_DE_CONSUMIDORES_WEB.md`
**Estado físico resultante:** INVENTARIO EJECUTABLE CONSOLIDADO; CERO MIGRACIONES RUNTIME EJECUTADAS; CERO PAQUETES COMPARTIDOS ADOPTADOS POR CONSUMIDORES EN ESTA TAREA
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`SHELL-MIG-001` transforma la auditoría cerrada en `SHELL-AUD-001..011` y la decisión de distribución de `SHELL-PKG-001` en una matriz ejecutable por repositorio, identidad física, clase de consumidor, disposición, propietario, paquete de cambio, lote base, evidencia esperada y rollback.

La tarea no ejecuta migraciones ni decide el orden reversible entre repositorios. `SHELL-MIG-002` permanece propietario de la definición final de lotes y orden. Para no dejar destinos genéricos, cada fila de esta tarea usa como **lote base** la combinación exacta `repositorio / tarea propietaria de ejecución`; esa dirección se convertirá en lote reversible y ordenado en `SHELL-MIG-002`.

Regla raíz:

```text
CONSUMIDOR O EXTENSIÓN FÍSICA
→ REPOSITORIO Y COMMIT
→ IDENTIDAD FAM / CONTRATO / ARCHIVO
→ CLASE DE CONSUMO
→ KEEP LOCAL / MIGRATE / RETIRE
→ PAQUETE O REPOSITORIO PROPIETARIO
→ LOTE BASE REPOSITORIO / TAREA
→ EVIDENCIA ESPERADA
→ ROLLBACK
→ SHELL-MIG-002
```

---

#### 2. Resultado material

| Métrica                                                                 | Resultado |
| ----------------------------------------------------------------------- | --------: |
| repositorios runtime reconciliados                                      |     **7** |
| ocurrencias runtime de familias `FAM-*`                                 |   **128** |
| ocurrencias runtime con consumo, entrypoint o conservación vigente      |   **117** |
| archivos sin consumidor confirmado ya autorizados para retiro bajo gate |    **11** |
| consumidores directos de permisos fuera de familias auth                |    **11** |
| consumidores `CI` de legacy compartido materializados                   |     **1** |
| consumidores `SCRIPT` adicionales materializados                        |     **2** |
| filas ejecutables totales del inventario                                |   **142** |
| consumidores dinámicos confirmados                                      |     **0** |
| dependencias runtime `@vento/*` ya adoptadas por los siete repositorios |     **0** |
| cambios físicos realizados                                              |     **0** |
| cambios `TREQ-*`                                                        |     **0** |

Las 142 filas no significan 142 archivos únicos: las 128 ocurrencias de familia modelan nodos físicos de migración y las filas adicionales modelan aristas de consumo directo, CI o script que requieren una disposición propia. Esta separación evita ocultar consumidores que sobreviven aunque una familia sea sustituida.

---

#### 3. Fuentes canónicas y corte físico vigente

| Fuente                                       | Decisión usada                                                                                   |
| -------------------------------------------- | ------------------------------------------------------------------------------------------------ |
| `SHELL-AUD-001..011`                         | universo de familias, ocurrencias, consumidores, candidatos sin consumidor y gates de retiro     |
| `SHELL-PKG-001..008`                         | cuatro unidades de paquete, SemVer independiente, compatibilidad, rollback y adopción controlada |
| `SHELL-CON-001..016`                         | contratos y artefactos generados propietarios                                                    |
| `SHELL-DB-001..005`                          | `@vento/supabase`, `Database`, RPC y factories browser/server/privileged                         |
| `SHELL-UI-001..020`                          | `@vento/ui-web`, componentes, AppShell, estados y patrones web                                   |
| `SHELL-AUTH-001..005` / `SHELL-CTX-001..006` | SDK, adapters, autorización, contexto y migración de legacy auth/context                         |
| `04A_04_SHELL.md`                            | requisitos vigentes de clasificación, paquete de cambio, compatibilidad, rollback y evidencia    |

| Superficie | Commit vigente verificado                  | Relación con el corte de auditoría                                                                        |
| ---------- | ------------------------------------------ | --------------------------------------------------------------------------------------------------------- |
| SHELL      | `c0bd10325a9942fd8fca4f272d2ed1842891a59b` | HEAD documental/tooling posterior; `src/` y `middleware.ts` sin delta runtime respecto de `SHELL-AUD-011` |
| VISO       | `47322403f3c64e83ae0c4a2f68c05d47093e5bb4` | idéntico al commit runtime auditado                                                                       |
| NEXO       | `142c4d696221e3ce3fda4ed3b62f3d1fe5b58799` | idéntico al commit runtime auditado                                                                       |
| FOGO       | `b6b9ed00e5267cabaac1a5a1090d93d5f60e86f2` | idéntico al commit runtime auditado                                                                       |
| ORIGO      | `b7a8303fa078ef087f522b6c99059ababfc27472` | idéntico al commit runtime auditado                                                                       |
| PULSO      | `71e0184486b5fe11e0a42435baf4024807a80efd` | idéntico al commit runtime auditado                                                                       |
| NUMERA     | `1b48a5da425d92e19ed89cf175b1dccc4cd960e1` | idéntico al commit runtime auditado                                                                       |

La revisión física adicional materializa una arista no separada previamente como fila ejecutable: el workflow temporal de NEXO y su script de patch dependen de la forma legacy de `operationalSession` y de evaluadores de permisos. Es evidencia nueva de clasificación, no un cambio de código posterior al corte: el commit de NEXO permanece idéntico al auditado.

---

#### 4. Clases de consumidor aplicadas

| Clase                   | Criterio en este inventario                                                                         | Disposición mínima                                                          |
| ----------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| `STATIC`                | importación, llamada o dependencia de módulo confirmada o heredada por la topología auditada        | migrar o conservar explícitamente                                           |
| `DYNAMIC`               | `import()`, registry o resolución dinámica confirmada                                               | ninguna confirmada en el corte; cualquier hallazgo posterior reabre el lote |
| `FRAMEWORK`             | `layout.tsx`, `middleware.ts`, `page.tsx` o `route.ts` ejecutado por convención                     | nunca retirar por ausencia de import                                        |
| `CI`                    | workflow que modifica o valida código dependiente de una forma legacy                               | adaptar o bloquear antes de cambiar esa forma                               |
| `SCRIPT`                | script que copia, parchea o genera consumidores                                                     | migrar o conservar con dependencia exacta                                   |
| `MANUAL`                | herramienta operativa ejecutada por un operador                                                     | conservar hasta sustitución reproducible                                    |
| `NO_CONSUMER_CONFIRMED` | archivo cuya ausencia de consumidores fue auditada y cuyo retiro posterior fue autorizado bajo gate | retirar solo tras revalidar cero consumidores                               |

No se localizó un consumidor `DYNAMIC` confirmado en `SHELL-AUD-001..011`; los seis repositorios externos permanecen en los mismos commits, por lo que esa conclusión no cambia. La ausencia de consumidor dinámico no permite omitir su búsqueda antes de un retiro físico.

---

#### 5. Fronteras de paquete y propiedad

| Frontera                | Responsabilidad de migración                                                       | Estado de adopción al corte                                     |
| ----------------------- | ---------------------------------------------------------------------------------- | --------------------------------------------------------------- |
| `@vento/contracts`      | catálogos, códigos, tipos generados, contratos y manifiestos                       | ningún runtime consumidor confirmado                            |
| `@vento/os-context`     | guards, permisos, contexto, role override, SSO, firma y adapters compartidos       | package parcial existente; ningún runtime consumidor confirmado |
| `@vento/supabase`       | factories browser/server/privileged y frontera técnica Supabase                    | package no adoptado por runtimes                                |
| `@vento/ui-web`         | primitivas, Chrome, AppSwitcher, ProfileMenu, PageHeader, VentoLogo y contrato CSS | package no materializado/adoptado por runtimes                  |
| repositorio propietario | layouts, middleware, compositor server, tema y extensiones empresariales           | permanecen locales                                              |

Una fila `KEEP LOCAL` no autoriza duplicar una fuente de verdad. Significa que el entrypoint o la extensión permanece en el repositorio y debe consumir contratos, paquetes o adapters compartidos cuando estos estén disponibles.

---

#### 6. Disposición canónica de las 26 familias heredadas

La disposición arquitectónica preserva `SHELL-AUD-010`; la acción de `MIG-001` describe qué debe ocurrir con la ocurrencia consumidora. `COMPARTIR` o `GENERAR` no significa que el consumidor ya use el destino: por eso su acción actual es `MIGRATE`. Las cuarentenas `FAM-017` y `FAM-026` mantienen la disposición histórica `MANTENER_LOCAL`, pero `SHELL-AUD-011` ya autorizó su retiro físico posterior bajo gate.

| Familia   | Identidad                                        | Disposición `SHELL-AUD-010` | Acción `SHELL-MIG-001` | Frontera objetivo                                            | Propietario                      |
| --------- | ------------------------------------------------ | --------------------------- | ---------------------- | ------------------------------------------------------------ | -------------------------------- |
| `FAM-001` | `src/app/layout.tsx`                             | `MANTENER_LOCAL`            | `KEEP LOCAL`           | LOCAL + @vento/ui-web                                        | `SHELL-UI-010`                   |
| `FAM-002` | `src/app/globals.css`                            | `MANTENER_LOCAL`            | `KEEP LOCAL`           | LOCAL + @vento/ui-web                                        | `SHELL-UI-001`                   |
| `FAM-003` | `src/components/vento/standard/vento-shell.tsx`  | `MANTENER_LOCAL`            | `KEEP LOCAL`           | LOCAL + @vento/ui-web + @vento/contracts + @vento/os-context | `SHELL-UI-010`                   |
| `FAM-004` | `src/components/vento/standard/vento-chrome.tsx` | `COMPARTIR`                 | `MIGRATE`              | @vento/ui-web                                                | `SHELL-UI-010`                   |
| `FAM-005` | `src/components/vento/standard/ui.tsx`           | `COMPARTIR`                 | `MIGRATE`              | @vento/ui-web                                                | `SHELL-UI-001`                   |
| `FAM-006` | `src/components/vento/standard/table.tsx`        | `COMPARTIR`                 | `MIGRATE`              | @vento/ui-web                                                | `SHELL-UI-001`                   |
| `FAM-007` | `src/components/vento/standard/app-switcher.tsx` | `COMPARTIR`                 | `MIGRATE`              | @vento/ui-web + @vento/contracts                             | `SHELL-UI-007`                   |
| `FAM-008` | `src/components/vento/standard/profile-menu.tsx` | `COMPARTIR`                 | `MIGRATE`              | @vento/ui-web + @vento/os-context                            | `SHELL-UI-010`                   |
| `FAM-009` | `src/lib/auth/guard.ts`                          | `COMPARTIR`                 | `MIGRATE`              | @vento/os-context + @vento/contracts                         | `SHELL-AUTH-002`                 |
| `FAM-010` | `src/lib/auth/permissions.ts`                    | `COMPARTIR`                 | `MIGRATE`              | @vento/os-context + @vento/contracts                         | `SHELL-AUTH-002`                 |
| `FAM-011` | `src/lib/auth/operational-session.ts`            | `COMPARTIR`                 | `MIGRATE`              | @vento/os-context + @vento/contracts                         | `SHELL-CTX-001`                  |
| `FAM-012` | `src/lib/auth/role-override.ts`                  | `COMPARTIR`                 | `MIGRATE`              | @vento/os-context + @vento/contracts                         | `SHELL-AUTH-001`                 |
| `FAM-013` | `src/lib/auth/role-override-config.ts`           | `GENERAR`                   | `MIGRATE`              | @vento/contracts                                             | `SHELL-CON-004 / SHELL-CON-005`  |
| `FAM-014` | `src/lib/supabase/client.ts`                     | `COMPARTIR`                 | `MIGRATE`              | @vento/supabase                                              | `SHELL-DB-001`                   |
| `FAM-015` | `src/lib/supabase/server.ts`                     | `COMPARTIR`                 | `MIGRATE`              | @vento/supabase                                              | `SHELL-DB-001`                   |
| `FAM-016` | `middleware.ts`                                  | `MANTENER_LOCAL`            | `KEEP LOCAL`           | LOCAL + @vento/os-context + @vento/supabase                  | `SHELL-AUTH-002`                 |
| `FAM-017` | `src/lib/supabase/proxy.ts`                      | `MANTENER_LOCAL`            | `RETIRE`               | LOCAL; retiro bajo `SHELL-AUD-011`                           | `SHELL-AUD-011 / SHELL-MIG-008`  |
| `FAM-018` | `src/lib/auth/operational-context.ts`            | `MANTENER_LOCAL`            | `KEEP LOCAL`           | devVentoGroup/vento-nexo + @vento/os-context                 | `SHELL-CTX-001`                  |
| `FAM-019` | `src/components/vento/standard/page-header.tsx`  | `COMPARTIR`                 | `MIGRATE`              | @vento/ui-web                                                | `SHELL-UI-001`                   |
| `FAM-020` | `src/components/vento/standard/vento-logo.tsx`   | `COMPARTIR`                 | `MIGRATE`              | @vento/ui-web + @vento/contracts                             | `SHELL-UI-001`                   |
| `FAM-021` | `src/lib/auth/request-host.ts`                   | `COMPARTIR`                 | `MIGRATE`              | @vento/os-context                                            | `SHELL-AUTH-002`                 |
| `FAM-022` | `src/lib/auth/shared-device-signature.ts`        | `COMPARTIR`                 | `MIGRATE`              | @vento/os-context + @vento/contracts                         | `SHELL-AUTH-002`                 |
| `FAM-023` | `src/lib/auth/sso.ts`                            | `COMPARTIR`                 | `MIGRATE`              | @vento/os-context + @vento/contracts                         | `SHELL-AUTH-002`                 |
| `FAM-024` | `src/lib/supabase/admin.ts`                      | `COMPARTIR`                 | `MIGRATE`              | @vento/supabase                                              | `SHELL-DB-001`                   |
| `FAM-025` | `src/lib/supabase/employee-sites.ts`             | `COMPARTIR`                 | `MIGRATE`              | @vento/contracts + @vento/os-context                         | `SHELL-CON-007 / SHELL-AUTH-002` |
| `FAM-026` | `src/utils/supabase/client.ts`                   | `MANTENER_LOCAL`            | `RETIRE`               | devVentoGroup/vento-pulso; retiro bajo `SHELL-AUD-011`       | `SHELL-AUD-011 / SHELL-MIG-008`  |

**Conciliación arquitectónica:** 18 `COMPARTIR`, 1 `GENERAR` y 7 `MANTENER_LOCAL`, exactamente como `SHELL-AUD-010`. **Conciliación de acción:** las ocurrencias concretas se refinan en la matriz siguiente según consumo; `PageHeader` NEXO, `sso.ts` sin consumidor y `employee-sites` FOGO/NUMERA pasan a `RETIRE` por la decisión posterior de `SHELL-AUD-011`, mientras sus equivalentes consumidos permanecen `MIGRATE`.

---

#### 7. Matriz ejecutable de 128 ocurrencias runtime

| Repositorio                  | Familia   | Archivo                                          | Clase                   | Disposición  | Frontera objetivo                                                                 | Propietario                       | Lote base                                     | Evidencia esperada                                                                                                                       | Rollback                                                                                                     |
| ---------------------------- | --------- | ------------------------------------------------ | ----------------------- | ------------ | --------------------------------------------------------------------------------- | --------------------------------- | --------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| `devVentoGroup/vento-shell`  | `FAM-001` | `src/app/layout.tsx`                             | `FRAMEWORK`             | `KEEP LOCAL` | devVentoGroup/vento-shell + @vento/ui-web                                         | `SHELL-UI-010`                    | `devVentoGroup/vento-shell / SHELL-MIG-005`   | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar archivo local anterior y la versión/configuración compartida previa compatible.                    |
| `devVentoGroup/vento-shell`  | `FAM-002` | `src/app/globals.css`                            | `STATIC`                | `KEEP LOCAL` | devVentoGroup/vento-shell + @vento/ui-web                                         | `SHELL-UI-001`                    | `devVentoGroup/vento-shell / SHELL-MIG-005`   | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar archivo local anterior y la versión/configuración compartida previa compatible.                    |
| `devVentoGroup/vento-shell`  | `FAM-014` | `src/lib/supabase/client.ts`                     | `STATIC`                | `MIGRATE`    | @vento/supabase                                                                   | `SHELL-DB-001`                    | `devVentoGroup/vento-shell / SHELL-AUTH-005`  | BUILD + LOCAL + REMOTA + OPERATIVA; sesión, cookies, host, errores y frontera privilegiada equivalentes según aplique.                   | Restaurar factory local anterior, política de cookies/configuración y pin previo de @vento/supabase.         |
| `devVentoGroup/vento-shell`  | `FAM-015` | `src/lib/supabase/server.ts`                     | `STATIC`                | `MIGRATE`    | @vento/supabase                                                                   | `SHELL-DB-001`                    | `devVentoGroup/vento-shell / SHELL-AUTH-005`  | BUILD + LOCAL + REMOTA + OPERATIVA; sesión, cookies, host, errores y frontera privilegiada equivalentes según aplique.                   | Restaurar factory local anterior, política de cookies/configuración y pin previo de @vento/supabase.         |
| `devVentoGroup/vento-shell`  | `FAM-016` | `middleware.ts`                                  | `FRAMEWORK`             | `KEEP LOCAL` | devVentoGroup/vento-shell + @vento/os-context + @vento/supabase                   | `SHELL-AUTH-002`                  | `devVentoGroup/vento-shell / SHELL-AUTH-005`  | BUILD + LOCAL + REMOTA + OPERATIVA; sesión, cookies, host, errores y frontera privilegiada equivalentes según aplique.                   | Restaurar archivo local anterior y la versión/configuración compartida previa compatible.                    |
| `devVentoGroup/vento-viso`   | `FAM-001` | `src/app/layout.tsx`                             | `FRAMEWORK`             | `KEEP LOCAL` | devVentoGroup/vento-viso + @vento/ui-web                                          | `SHELL-UI-010`                    | `devVentoGroup/vento-viso / SHELL-MIG-005`    | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar archivo local anterior y la versión/configuración compartida previa compatible.                    |
| `devVentoGroup/vento-viso`   | `FAM-002` | `src/app/globals.css`                            | `STATIC`                | `KEEP LOCAL` | devVentoGroup/vento-viso + @vento/ui-web                                          | `SHELL-UI-001`                    | `devVentoGroup/vento-viso / SHELL-MIG-005`    | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar archivo local anterior y la versión/configuración compartida previa compatible.                    |
| `devVentoGroup/vento-viso`   | `FAM-003` | `src/components/vento/standard/vento-shell.tsx`  | `STATIC`                | `KEEP LOCAL` | devVentoGroup/vento-viso + @vento/ui-web + @vento/contracts + @vento/os-context   | `SHELL-UI-010`                    | `devVentoGroup/vento-viso / SHELL-MIG-005`    | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar archivo local anterior y la versión/configuración compartida previa compatible.                    |
| `devVentoGroup/vento-viso`   | `FAM-004` | `src/components/vento/standard/vento-chrome.tsx` | `STATIC`                | `MIGRATE`    | @vento/ui-web                                                                     | `SHELL-UI-010`                    | `devVentoGroup/vento-viso / SHELL-MIG-005`    | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar componente/CSS local anterior y el pin previo de @vento/ui-web.                                    |
| `devVentoGroup/vento-viso`   | `FAM-005` | `src/components/vento/standard/ui.tsx`           | `STATIC`                | `MIGRATE`    | @vento/ui-web                                                                     | `SHELL-UI-001`                    | `devVentoGroup/vento-viso / SHELL-MIG-005`    | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar componente/CSS local anterior y el pin previo de @vento/ui-web.                                    |
| `devVentoGroup/vento-viso`   | `FAM-006` | `src/components/vento/standard/table.tsx`        | `STATIC`                | `MIGRATE`    | @vento/ui-web                                                                     | `SHELL-UI-001`                    | `devVentoGroup/vento-viso / SHELL-MIG-005`    | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar componente/CSS local anterior y el pin previo de @vento/ui-web.                                    |
| `devVentoGroup/vento-viso`   | `FAM-007` | `src/components/vento/standard/app-switcher.tsx` | `STATIC`                | `MIGRATE`    | @vento/ui-web + @vento/contracts                                                  | `SHELL-UI-007`                    | `devVentoGroup/vento-viso / SHELL-MIG-005`    | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar componente/CSS local anterior y el pin previo de @vento/ui-web.                                    |
| `devVentoGroup/vento-viso`   | `FAM-008` | `src/components/vento/standard/profile-menu.tsx` | `STATIC`                | `MIGRATE`    | @vento/ui-web + @vento/os-context                                                 | `SHELL-UI-010`                    | `devVentoGroup/vento-viso / SHELL-MIG-005`    | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar componente/CSS local anterior y el pin previo de @vento/ui-web.                                    |
| `devVentoGroup/vento-viso`   | `FAM-009` | `src/lib/auth/guard.ts`                          | `STATIC`                | `MIGRATE`    | @vento/os-context + @vento/contracts                                              | `SHELL-AUTH-002`                  | `devVentoGroup/vento-viso / SHELL-AUTH-005`   | BUILD + LOCAL + REMOTA + OPERATIVA; decisión, razones, contexto, SSO o firma mantienen paridad y protección en servidor.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-viso`   | `FAM-010` | `src/lib/auth/permissions.ts`                    | `STATIC`                | `MIGRATE`    | @vento/os-context + @vento/contracts                                              | `SHELL-AUTH-002`                  | `devVentoGroup/vento-viso / SHELL-AUTH-005`   | BUILD + LOCAL + REMOTA + OPERATIVA; decisión, razones, contexto, SSO o firma mantienen paridad y protección en servidor.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-viso`   | `FAM-011` | `src/lib/auth/operational-session.ts`            | `STATIC`                | `MIGRATE`    | @vento/os-context + @vento/contracts                                              | `SHELL-CTX-001`                   | `devVentoGroup/vento-viso / SHELL-AUTH-005`   | BUILD + LOCAL + REMOTA + OPERATIVA; decisión, razones, contexto, SSO o firma mantienen paridad y protección en servidor.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-viso`   | `FAM-012` | `src/lib/auth/role-override.ts`                  | `STATIC`                | `MIGRATE`    | @vento/os-context + @vento/contracts                                              | `SHELL-AUTH-001`                  | `devVentoGroup/vento-viso / SHELL-AUTH-005`   | BUILD + LOCAL + REMOTA + OPERATIVA; decisión, razones, contexto, SSO o firma mantienen paridad y protección en servidor.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-viso`   | `FAM-013` | `src/lib/auth/role-override-config.ts`           | `STATIC`                | `MIGRATE`    | @vento/contracts                                                                  | `SHELL-CON-004 / SHELL-CON-005`   | `devVentoGroup/vento-viso / SHELL-AUTH-005`   | BUILD + LOCAL + REMOTA; tipos/artefactos generados reproducibles y consumidor sin strings o casts legacy no autorizados.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-viso`   | `FAM-014` | `src/lib/supabase/client.ts`                     | `STATIC`                | `MIGRATE`    | @vento/supabase                                                                   | `SHELL-DB-001`                    | `devVentoGroup/vento-viso / SHELL-AUTH-005`   | BUILD + LOCAL + REMOTA + OPERATIVA; sesión, cookies, host, errores y frontera privilegiada equivalentes según aplique.                   | Restaurar factory local anterior, política de cookies/configuración y pin previo de @vento/supabase.         |
| `devVentoGroup/vento-viso`   | `FAM-015` | `src/lib/supabase/server.ts`                     | `STATIC`                | `MIGRATE`    | @vento/supabase                                                                   | `SHELL-DB-001`                    | `devVentoGroup/vento-viso / SHELL-AUTH-005`   | BUILD + LOCAL + REMOTA + OPERATIVA; sesión, cookies, host, errores y frontera privilegiada equivalentes según aplique.                   | Restaurar factory local anterior, política de cookies/configuración y pin previo de @vento/supabase.         |
| `devVentoGroup/vento-viso`   | `FAM-016` | `middleware.ts`                                  | `FRAMEWORK`             | `KEEP LOCAL` | devVentoGroup/vento-viso + @vento/os-context + @vento/supabase                    | `SHELL-AUTH-002`                  | `devVentoGroup/vento-viso / SHELL-AUTH-005`   | BUILD + LOCAL + REMOTA + OPERATIVA; sesión, cookies, host, errores y frontera privilegiada equivalentes según aplique.                   | Restaurar archivo local anterior y la versión/configuración compartida previa compatible.                    |
| `devVentoGroup/vento-viso`   | `FAM-017` | `src/lib/supabase/proxy.ts`                      | `NO_CONSUMER_CONFIRMED` | `RETIRE`     | devVentoGroup/vento-viso                                                          | `SHELL-AUD-011 / SHELL-MIG-008`   | `devVentoGroup/vento-viso / SHELL-MIG-008`    | LOCAL + BUILD; cero consumidores STATIC/DYNAMIC/FRAMEWORK/CI/SCRIPT revalidado; exports y aliases sin referencias; rollback restaurable. | Restaurar último blob/export conocido del artefacto y revertir el cambio de retiro; repetir build y pruebas. |
| `devVentoGroup/vento-viso`   | `FAM-019` | `src/components/vento/standard/page-header.tsx`  | `STATIC`                | `MIGRATE`    | @vento/ui-web                                                                     | `SHELL-UI-001`                    | `devVentoGroup/vento-viso / SHELL-MIG-005`    | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar componente/CSS local anterior y el pin previo de @vento/ui-web.                                    |
| `devVentoGroup/vento-viso`   | `FAM-020` | `src/components/vento/standard/vento-logo.tsx`   | `STATIC`                | `MIGRATE`    | @vento/ui-web + @vento/contracts                                                  | `SHELL-UI-001`                    | `devVentoGroup/vento-viso / SHELL-MIG-005`    | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar componente/CSS local anterior y el pin previo de @vento/ui-web.                                    |
| `devVentoGroup/vento-viso`   | `FAM-023` | `src/lib/auth/sso.ts`                            | `NO_CONSUMER_CONFIRMED` | `RETIRE`     | devVentoGroup/vento-viso                                                          | `SHELL-AUD-011 / SHELL-MIG-008`   | `devVentoGroup/vento-viso / SHELL-MIG-008`    | LOCAL + BUILD; cero consumidores STATIC/DYNAMIC/FRAMEWORK/CI/SCRIPT revalidado; exports y aliases sin referencias; rollback restaurable. | Restaurar último blob/export conocido del artefacto y revertir el cambio de retiro; repetir build y pruebas. |
| `devVentoGroup/vento-viso`   | `FAM-024` | `src/lib/supabase/admin.ts`                      | `STATIC`                | `MIGRATE`    | @vento/supabase                                                                   | `SHELL-DB-001`                    | `devVentoGroup/vento-viso / SHELL-AUTH-005`   | BUILD + LOCAL + REMOTA + OPERATIVA; sesión, cookies, host, errores y frontera privilegiada equivalentes según aplique.                   | Restaurar factory local anterior, política de cookies/configuración y pin previo de @vento/supabase.         |
| `devVentoGroup/vento-nexo`   | `FAM-001` | `src/app/layout.tsx`                             | `FRAMEWORK`             | `KEEP LOCAL` | devVentoGroup/vento-nexo + @vento/ui-web                                          | `SHELL-UI-010`                    | `devVentoGroup/vento-nexo / SHELL-MIG-005`    | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar archivo local anterior y la versión/configuración compartida previa compatible.                    |
| `devVentoGroup/vento-nexo`   | `FAM-002` | `src/app/globals.css`                            | `STATIC`                | `KEEP LOCAL` | devVentoGroup/vento-nexo + @vento/ui-web                                          | `SHELL-UI-001`                    | `devVentoGroup/vento-nexo / SHELL-MIG-005`    | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar archivo local anterior y la versión/configuración compartida previa compatible.                    |
| `devVentoGroup/vento-nexo`   | `FAM-003` | `src/components/vento/standard/vento-shell.tsx`  | `STATIC`                | `KEEP LOCAL` | devVentoGroup/vento-nexo + @vento/ui-web + @vento/contracts + @vento/os-context   | `SHELL-UI-010`                    | `devVentoGroup/vento-nexo / SHELL-MIG-005`    | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar archivo local anterior y la versión/configuración compartida previa compatible.                    |
| `devVentoGroup/vento-nexo`   | `FAM-004` | `src/components/vento/standard/vento-chrome.tsx` | `STATIC`                | `MIGRATE`    | @vento/ui-web                                                                     | `SHELL-UI-010`                    | `devVentoGroup/vento-nexo / SHELL-MIG-005`    | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar componente/CSS local anterior y el pin previo de @vento/ui-web.                                    |
| `devVentoGroup/vento-nexo`   | `FAM-005` | `src/components/vento/standard/ui.tsx`           | `STATIC`                | `MIGRATE`    | @vento/ui-web                                                                     | `SHELL-UI-001`                    | `devVentoGroup/vento-nexo / SHELL-MIG-005`    | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar componente/CSS local anterior y el pin previo de @vento/ui-web.                                    |
| `devVentoGroup/vento-nexo`   | `FAM-006` | `src/components/vento/standard/table.tsx`        | `STATIC`                | `MIGRATE`    | @vento/ui-web                                                                     | `SHELL-UI-001`                    | `devVentoGroup/vento-nexo / SHELL-MIG-005`    | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar componente/CSS local anterior y el pin previo de @vento/ui-web.                                    |
| `devVentoGroup/vento-nexo`   | `FAM-007` | `src/components/vento/standard/app-switcher.tsx` | `STATIC`                | `MIGRATE`    | @vento/ui-web + @vento/contracts                                                  | `SHELL-UI-007`                    | `devVentoGroup/vento-nexo / SHELL-MIG-005`    | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar componente/CSS local anterior y el pin previo de @vento/ui-web.                                    |
| `devVentoGroup/vento-nexo`   | `FAM-008` | `src/components/vento/standard/profile-menu.tsx` | `STATIC`                | `MIGRATE`    | @vento/ui-web + @vento/os-context                                                 | `SHELL-UI-010`                    | `devVentoGroup/vento-nexo / SHELL-MIG-005`    | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar componente/CSS local anterior y el pin previo de @vento/ui-web.                                    |
| `devVentoGroup/vento-nexo`   | `FAM-009` | `src/lib/auth/guard.ts`                          | `STATIC`                | `MIGRATE`    | @vento/os-context + @vento/contracts                                              | `SHELL-AUTH-002`                  | `devVentoGroup/vento-nexo / SHELL-AUTH-005`   | BUILD + LOCAL + REMOTA + OPERATIVA; decisión, razones, contexto, SSO o firma mantienen paridad y protección en servidor.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-nexo`   | `FAM-010` | `src/lib/auth/permissions.ts`                    | `STATIC`                | `MIGRATE`    | @vento/os-context + @vento/contracts                                              | `SHELL-AUTH-002`                  | `devVentoGroup/vento-nexo / SHELL-AUTH-005`   | BUILD + LOCAL + REMOTA + OPERATIVA; decisión, razones, contexto, SSO o firma mantienen paridad y protección en servidor.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-nexo`   | `FAM-011` | `src/lib/auth/operational-session.ts`            | `STATIC`                | `MIGRATE`    | @vento/os-context + @vento/contracts                                              | `SHELL-CTX-001`                   | `devVentoGroup/vento-nexo / SHELL-AUTH-005`   | BUILD + LOCAL + REMOTA + OPERATIVA; decisión, razones, contexto, SSO o firma mantienen paridad y protección en servidor.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-nexo`   | `FAM-012` | `src/lib/auth/role-override.ts`                  | `STATIC`                | `MIGRATE`    | @vento/os-context + @vento/contracts                                              | `SHELL-AUTH-001`                  | `devVentoGroup/vento-nexo / SHELL-AUTH-005`   | BUILD + LOCAL + REMOTA + OPERATIVA; decisión, razones, contexto, SSO o firma mantienen paridad y protección en servidor.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-nexo`   | `FAM-013` | `src/lib/auth/role-override-config.ts`           | `STATIC`                | `MIGRATE`    | @vento/contracts                                                                  | `SHELL-CON-004 / SHELL-CON-005`   | `devVentoGroup/vento-nexo / SHELL-AUTH-005`   | BUILD + LOCAL + REMOTA; tipos/artefactos generados reproducibles y consumidor sin strings o casts legacy no autorizados.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-nexo`   | `FAM-014` | `src/lib/supabase/client.ts`                     | `STATIC`                | `MIGRATE`    | @vento/supabase                                                                   | `SHELL-DB-001`                    | `devVentoGroup/vento-nexo / SHELL-AUTH-005`   | BUILD + LOCAL + REMOTA + OPERATIVA; sesión, cookies, host, errores y frontera privilegiada equivalentes según aplique.                   | Restaurar factory local anterior, política de cookies/configuración y pin previo de @vento/supabase.         |
| `devVentoGroup/vento-nexo`   | `FAM-015` | `src/lib/supabase/server.ts`                     | `STATIC`                | `MIGRATE`    | @vento/supabase                                                                   | `SHELL-DB-001`                    | `devVentoGroup/vento-nexo / SHELL-AUTH-005`   | BUILD + LOCAL + REMOTA + OPERATIVA; sesión, cookies, host, errores y frontera privilegiada equivalentes según aplique.                   | Restaurar factory local anterior, política de cookies/configuración y pin previo de @vento/supabase.         |
| `devVentoGroup/vento-nexo`   | `FAM-016` | `middleware.ts`                                  | `FRAMEWORK`             | `KEEP LOCAL` | devVentoGroup/vento-nexo + @vento/os-context + @vento/supabase                    | `SHELL-AUTH-002`                  | `devVentoGroup/vento-nexo / SHELL-AUTH-005`   | BUILD + LOCAL + REMOTA + OPERATIVA; sesión, cookies, host, errores y frontera privilegiada equivalentes según aplique.                   | Restaurar archivo local anterior y la versión/configuración compartida previa compatible.                    |
| `devVentoGroup/vento-nexo`   | `FAM-017` | `src/lib/supabase/proxy.ts`                      | `NO_CONSUMER_CONFIRMED` | `RETIRE`     | devVentoGroup/vento-nexo                                                          | `SHELL-AUD-011 / SHELL-MIG-008`   | `devVentoGroup/vento-nexo / SHELL-MIG-008`    | LOCAL + BUILD; cero consumidores STATIC/DYNAMIC/FRAMEWORK/CI/SCRIPT revalidado; exports y aliases sin referencias; rollback restaurable. | Restaurar último blob/export conocido del artefacto y revertir el cambio de retiro; repetir build y pruebas. |
| `devVentoGroup/vento-nexo`   | `FAM-018` | `src/lib/auth/operational-context.ts`            | `STATIC`                | `KEEP LOCAL` | devVentoGroup/vento-nexo + @vento/os-context                                      | `SHELL-CTX-001`                   | `devVentoGroup/vento-nexo / SHELL-AUTH-005`   | BUILD + LOCAL + REMOTA + OPERATIVA; decisión, razones, contexto, SSO o firma mantienen paridad y protección en servidor.                 | Restaurar archivo local anterior y la versión/configuración compartida previa compatible.                    |
| `devVentoGroup/vento-nexo`   | `FAM-019` | `src/components/vento/standard/page-header.tsx`  | `NO_CONSUMER_CONFIRMED` | `RETIRE`     | devVentoGroup/vento-nexo                                                          | `SHELL-AUD-011 / SHELL-MIG-008`   | `devVentoGroup/vento-nexo / SHELL-MIG-008`    | LOCAL + BUILD; cero consumidores STATIC/DYNAMIC/FRAMEWORK/CI/SCRIPT revalidado; exports y aliases sin referencias; rollback restaurable. | Restaurar último blob/export conocido del artefacto y revertir el cambio de retiro; repetir build y pruebas. |
| `devVentoGroup/vento-nexo`   | `FAM-020` | `src/components/vento/standard/vento-logo.tsx`   | `STATIC`                | `MIGRATE`    | @vento/ui-web + @vento/contracts                                                  | `SHELL-UI-001`                    | `devVentoGroup/vento-nexo / SHELL-MIG-005`    | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar componente/CSS local anterior y el pin previo de @vento/ui-web.                                    |
| `devVentoGroup/vento-nexo`   | `FAM-021` | `src/lib/auth/request-host.ts`                   | `STATIC`                | `MIGRATE`    | @vento/os-context                                                                 | `SHELL-AUTH-002`                  | `devVentoGroup/vento-nexo / SHELL-AUTH-005`   | BUILD + LOCAL + REMOTA + OPERATIVA; decisión, razones, contexto, SSO o firma mantienen paridad y protección en servidor.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-nexo`   | `FAM-022` | `src/lib/auth/shared-device-signature.ts`        | `STATIC`                | `MIGRATE`    | @vento/os-context + @vento/contracts                                              | `SHELL-AUTH-002`                  | `devVentoGroup/vento-nexo / SHELL-AUTH-005`   | BUILD + LOCAL + REMOTA + OPERATIVA; decisión, razones, contexto, SSO o firma mantienen paridad y protección en servidor.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-nexo`   | `FAM-023` | `src/lib/auth/sso.ts`                            | `STATIC`                | `MIGRATE`    | @vento/os-context + @vento/contracts                                              | `SHELL-AUTH-002 / SHELL-AUTH-005` | `devVentoGroup/vento-nexo / SHELL-AUTH-005`   | BUILD + LOCAL + REMOTA + OPERATIVA; decisión, razones, contexto, SSO o firma mantienen paridad y protección en servidor.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-fogo`   | `FAM-001` | `src/app/layout.tsx`                             | `FRAMEWORK`             | `KEEP LOCAL` | devVentoGroup/vento-fogo + @vento/ui-web                                          | `SHELL-UI-010`                    | `devVentoGroup/vento-fogo / SHELL-MIG-005`    | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar archivo local anterior y la versión/configuración compartida previa compatible.                    |
| `devVentoGroup/vento-fogo`   | `FAM-002` | `src/app/globals.css`                            | `STATIC`                | `KEEP LOCAL` | devVentoGroup/vento-fogo + @vento/ui-web                                          | `SHELL-UI-001`                    | `devVentoGroup/vento-fogo / SHELL-MIG-005`    | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar archivo local anterior y la versión/configuración compartida previa compatible.                    |
| `devVentoGroup/vento-fogo`   | `FAM-003` | `src/components/vento/standard/vento-shell.tsx`  | `STATIC`                | `KEEP LOCAL` | devVentoGroup/vento-fogo + @vento/ui-web + @vento/contracts + @vento/os-context   | `SHELL-UI-010`                    | `devVentoGroup/vento-fogo / SHELL-MIG-005`    | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar archivo local anterior y la versión/configuración compartida previa compatible.                    |
| `devVentoGroup/vento-fogo`   | `FAM-004` | `src/components/vento/standard/vento-chrome.tsx` | `STATIC`                | `MIGRATE`    | @vento/ui-web                                                                     | `SHELL-UI-010`                    | `devVentoGroup/vento-fogo / SHELL-MIG-005`    | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar componente/CSS local anterior y el pin previo de @vento/ui-web.                                    |
| `devVentoGroup/vento-fogo`   | `FAM-005` | `src/components/vento/standard/ui.tsx`           | `STATIC`                | `MIGRATE`    | @vento/ui-web                                                                     | `SHELL-UI-001`                    | `devVentoGroup/vento-fogo / SHELL-MIG-005`    | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar componente/CSS local anterior y el pin previo de @vento/ui-web.                                    |
| `devVentoGroup/vento-fogo`   | `FAM-006` | `src/components/vento/standard/table.tsx`        | `STATIC`                | `MIGRATE`    | @vento/ui-web                                                                     | `SHELL-UI-001`                    | `devVentoGroup/vento-fogo / SHELL-MIG-005`    | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar componente/CSS local anterior y el pin previo de @vento/ui-web.                                    |
| `devVentoGroup/vento-fogo`   | `FAM-007` | `src/components/vento/standard/app-switcher.tsx` | `STATIC`                | `MIGRATE`    | @vento/ui-web + @vento/contracts                                                  | `SHELL-UI-007`                    | `devVentoGroup/vento-fogo / SHELL-MIG-005`    | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar componente/CSS local anterior y el pin previo de @vento/ui-web.                                    |
| `devVentoGroup/vento-fogo`   | `FAM-008` | `src/components/vento/standard/profile-menu.tsx` | `STATIC`                | `MIGRATE`    | @vento/ui-web + @vento/os-context                                                 | `SHELL-UI-010`                    | `devVentoGroup/vento-fogo / SHELL-MIG-005`    | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar componente/CSS local anterior y el pin previo de @vento/ui-web.                                    |
| `devVentoGroup/vento-fogo`   | `FAM-009` | `src/lib/auth/guard.ts`                          | `STATIC`                | `MIGRATE`    | @vento/os-context + @vento/contracts                                              | `SHELL-AUTH-002`                  | `devVentoGroup/vento-fogo / SHELL-AUTH-005`   | BUILD + LOCAL + REMOTA + OPERATIVA; decisión, razones, contexto, SSO o firma mantienen paridad y protección en servidor.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-fogo`   | `FAM-010` | `src/lib/auth/permissions.ts`                    | `STATIC`                | `MIGRATE`    | @vento/os-context + @vento/contracts                                              | `SHELL-AUTH-002`                  | `devVentoGroup/vento-fogo / SHELL-AUTH-005`   | BUILD + LOCAL + REMOTA + OPERATIVA; decisión, razones, contexto, SSO o firma mantienen paridad y protección en servidor.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-fogo`   | `FAM-011` | `src/lib/auth/operational-session.ts`            | `STATIC`                | `MIGRATE`    | @vento/os-context + @vento/contracts                                              | `SHELL-CTX-001`                   | `devVentoGroup/vento-fogo / SHELL-AUTH-005`   | BUILD + LOCAL + REMOTA + OPERATIVA; decisión, razones, contexto, SSO o firma mantienen paridad y protección en servidor.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-fogo`   | `FAM-012` | `src/lib/auth/role-override.ts`                  | `STATIC`                | `MIGRATE`    | @vento/os-context + @vento/contracts                                              | `SHELL-AUTH-001`                  | `devVentoGroup/vento-fogo / SHELL-AUTH-005`   | BUILD + LOCAL + REMOTA + OPERATIVA; decisión, razones, contexto, SSO o firma mantienen paridad y protección en servidor.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-fogo`   | `FAM-013` | `src/lib/auth/role-override-config.ts`           | `STATIC`                | `MIGRATE`    | @vento/contracts                                                                  | `SHELL-CON-004 / SHELL-CON-005`   | `devVentoGroup/vento-fogo / SHELL-AUTH-005`   | BUILD + LOCAL + REMOTA; tipos/artefactos generados reproducibles y consumidor sin strings o casts legacy no autorizados.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-fogo`   | `FAM-014` | `src/lib/supabase/client.ts`                     | `STATIC`                | `MIGRATE`    | @vento/supabase                                                                   | `SHELL-DB-001`                    | `devVentoGroup/vento-fogo / SHELL-AUTH-005`   | BUILD + LOCAL + REMOTA + OPERATIVA; sesión, cookies, host, errores y frontera privilegiada equivalentes según aplique.                   | Restaurar factory local anterior, política de cookies/configuración y pin previo de @vento/supabase.         |
| `devVentoGroup/vento-fogo`   | `FAM-015` | `src/lib/supabase/server.ts`                     | `STATIC`                | `MIGRATE`    | @vento/supabase                                                                   | `SHELL-DB-001`                    | `devVentoGroup/vento-fogo / SHELL-AUTH-005`   | BUILD + LOCAL + REMOTA + OPERATIVA; sesión, cookies, host, errores y frontera privilegiada equivalentes según aplique.                   | Restaurar factory local anterior, política de cookies/configuración y pin previo de @vento/supabase.         |
| `devVentoGroup/vento-fogo`   | `FAM-016` | `middleware.ts`                                  | `FRAMEWORK`             | `KEEP LOCAL` | devVentoGroup/vento-fogo + @vento/os-context + @vento/supabase                    | `SHELL-AUTH-002`                  | `devVentoGroup/vento-fogo / SHELL-AUTH-005`   | BUILD + LOCAL + REMOTA + OPERATIVA; sesión, cookies, host, errores y frontera privilegiada equivalentes según aplique.                   | Restaurar archivo local anterior y la versión/configuración compartida previa compatible.                    |
| `devVentoGroup/vento-fogo`   | `FAM-020` | `src/components/vento/standard/vento-logo.tsx`   | `STATIC`                | `MIGRATE`    | @vento/ui-web + @vento/contracts                                                  | `SHELL-UI-001`                    | `devVentoGroup/vento-fogo / SHELL-MIG-005`    | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar componente/CSS local anterior y el pin previo de @vento/ui-web.                                    |
| `devVentoGroup/vento-fogo`   | `FAM-022` | `src/lib/auth/shared-device-signature.ts`        | `STATIC`                | `MIGRATE`    | @vento/os-context + @vento/contracts                                              | `SHELL-AUTH-002`                  | `devVentoGroup/vento-fogo / SHELL-AUTH-005`   | BUILD + LOCAL + REMOTA + OPERATIVA; decisión, razones, contexto, SSO o firma mantienen paridad y protección en servidor.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-fogo`   | `FAM-023` | `src/lib/auth/sso.ts`                            | `NO_CONSUMER_CONFIRMED` | `RETIRE`     | devVentoGroup/vento-fogo                                                          | `SHELL-AUD-011 / SHELL-MIG-008`   | `devVentoGroup/vento-fogo / SHELL-MIG-008`    | LOCAL + BUILD; cero consumidores STATIC/DYNAMIC/FRAMEWORK/CI/SCRIPT revalidado; exports y aliases sin referencias; rollback restaurable. | Restaurar último blob/export conocido del artefacto y revertir el cambio de retiro; repetir build y pruebas. |
| `devVentoGroup/vento-fogo`   | `FAM-025` | `src/lib/supabase/employee-sites.ts`             | `NO_CONSUMER_CONFIRMED` | `RETIRE`     | devVentoGroup/vento-fogo                                                          | `SHELL-AUD-011 / SHELL-MIG-008`   | `devVentoGroup/vento-fogo / SHELL-MIG-008`    | LOCAL + BUILD; cero consumidores STATIC/DYNAMIC/FRAMEWORK/CI/SCRIPT revalidado; exports y aliases sin referencias; rollback restaurable. | Restaurar último blob/export conocido del artefacto y revertir el cambio de retiro; repetir build y pruebas. |
| `devVentoGroup/vento-origo`  | `FAM-001` | `src/app/layout.tsx`                             | `FRAMEWORK`             | `KEEP LOCAL` | devVentoGroup/vento-origo + @vento/ui-web                                         | `SHELL-UI-010`                    | `devVentoGroup/vento-origo / SHELL-MIG-005`   | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar archivo local anterior y la versión/configuración compartida previa compatible.                    |
| `devVentoGroup/vento-origo`  | `FAM-002` | `src/app/globals.css`                            | `STATIC`                | `KEEP LOCAL` | devVentoGroup/vento-origo + @vento/ui-web                                         | `SHELL-UI-001`                    | `devVentoGroup/vento-origo / SHELL-MIG-005`   | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar archivo local anterior y la versión/configuración compartida previa compatible.                    |
| `devVentoGroup/vento-origo`  | `FAM-003` | `src/components/vento/standard/vento-shell.tsx`  | `STATIC`                | `KEEP LOCAL` | devVentoGroup/vento-origo + @vento/ui-web + @vento/contracts + @vento/os-context  | `SHELL-UI-010`                    | `devVentoGroup/vento-origo / SHELL-MIG-005`   | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar archivo local anterior y la versión/configuración compartida previa compatible.                    |
| `devVentoGroup/vento-origo`  | `FAM-004` | `src/components/vento/standard/vento-chrome.tsx` | `STATIC`                | `MIGRATE`    | @vento/ui-web                                                                     | `SHELL-UI-010`                    | `devVentoGroup/vento-origo / SHELL-MIG-005`   | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar componente/CSS local anterior y el pin previo de @vento/ui-web.                                    |
| `devVentoGroup/vento-origo`  | `FAM-005` | `src/components/vento/standard/ui.tsx`           | `STATIC`                | `MIGRATE`    | @vento/ui-web                                                                     | `SHELL-UI-001`                    | `devVentoGroup/vento-origo / SHELL-MIG-005`   | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar componente/CSS local anterior y el pin previo de @vento/ui-web.                                    |
| `devVentoGroup/vento-origo`  | `FAM-006` | `src/components/vento/standard/table.tsx`        | `STATIC`                | `MIGRATE`    | @vento/ui-web                                                                     | `SHELL-UI-001`                    | `devVentoGroup/vento-origo / SHELL-MIG-005`   | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar componente/CSS local anterior y el pin previo de @vento/ui-web.                                    |
| `devVentoGroup/vento-origo`  | `FAM-007` | `src/components/vento/standard/app-switcher.tsx` | `STATIC`                | `MIGRATE`    | @vento/ui-web + @vento/contracts                                                  | `SHELL-UI-007`                    | `devVentoGroup/vento-origo / SHELL-MIG-005`   | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar componente/CSS local anterior y el pin previo de @vento/ui-web.                                    |
| `devVentoGroup/vento-origo`  | `FAM-008` | `src/components/vento/standard/profile-menu.tsx` | `STATIC`                | `MIGRATE`    | @vento/ui-web + @vento/os-context                                                 | `SHELL-UI-010`                    | `devVentoGroup/vento-origo / SHELL-MIG-005`   | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar componente/CSS local anterior y el pin previo de @vento/ui-web.                                    |
| `devVentoGroup/vento-origo`  | `FAM-009` | `src/lib/auth/guard.ts`                          | `STATIC`                | `MIGRATE`    | @vento/os-context + @vento/contracts                                              | `SHELL-AUTH-002`                  | `devVentoGroup/vento-origo / SHELL-AUTH-005`  | BUILD + LOCAL + REMOTA + OPERATIVA; decisión, razones, contexto, SSO o firma mantienen paridad y protección en servidor.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-origo`  | `FAM-010` | `src/lib/auth/permissions.ts`                    | `STATIC`                | `MIGRATE`    | @vento/os-context + @vento/contracts                                              | `SHELL-AUTH-002`                  | `devVentoGroup/vento-origo / SHELL-AUTH-005`  | BUILD + LOCAL + REMOTA + OPERATIVA; decisión, razones, contexto, SSO o firma mantienen paridad y protección en servidor.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-origo`  | `FAM-011` | `src/lib/auth/operational-session.ts`            | `STATIC`                | `MIGRATE`    | @vento/os-context + @vento/contracts                                              | `SHELL-CTX-001`                   | `devVentoGroup/vento-origo / SHELL-AUTH-005`  | BUILD + LOCAL + REMOTA + OPERATIVA; decisión, razones, contexto, SSO o firma mantienen paridad y protección en servidor.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-origo`  | `FAM-012` | `src/lib/auth/role-override.ts`                  | `STATIC`                | `MIGRATE`    | @vento/os-context + @vento/contracts                                              | `SHELL-AUTH-001`                  | `devVentoGroup/vento-origo / SHELL-AUTH-005`  | BUILD + LOCAL + REMOTA + OPERATIVA; decisión, razones, contexto, SSO o firma mantienen paridad y protección en servidor.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-origo`  | `FAM-013` | `src/lib/auth/role-override-config.ts`           | `STATIC`                | `MIGRATE`    | @vento/contracts                                                                  | `SHELL-CON-004 / SHELL-CON-005`   | `devVentoGroup/vento-origo / SHELL-AUTH-005`  | BUILD + LOCAL + REMOTA; tipos/artefactos generados reproducibles y consumidor sin strings o casts legacy no autorizados.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-origo`  | `FAM-014` | `src/lib/supabase/client.ts`                     | `STATIC`                | `MIGRATE`    | @vento/supabase                                                                   | `SHELL-DB-001`                    | `devVentoGroup/vento-origo / SHELL-AUTH-005`  | BUILD + LOCAL + REMOTA + OPERATIVA; sesión, cookies, host, errores y frontera privilegiada equivalentes según aplique.                   | Restaurar factory local anterior, política de cookies/configuración y pin previo de @vento/supabase.         |
| `devVentoGroup/vento-origo`  | `FAM-015` | `src/lib/supabase/server.ts`                     | `STATIC`                | `MIGRATE`    | @vento/supabase                                                                   | `SHELL-DB-001`                    | `devVentoGroup/vento-origo / SHELL-AUTH-005`  | BUILD + LOCAL + REMOTA + OPERATIVA; sesión, cookies, host, errores y frontera privilegiada equivalentes según aplique.                   | Restaurar factory local anterior, política de cookies/configuración y pin previo de @vento/supabase.         |
| `devVentoGroup/vento-origo`  | `FAM-016` | `middleware.ts`                                  | `FRAMEWORK`             | `KEEP LOCAL` | devVentoGroup/vento-origo + @vento/os-context + @vento/supabase                   | `SHELL-AUTH-002`                  | `devVentoGroup/vento-origo / SHELL-AUTH-005`  | BUILD + LOCAL + REMOTA + OPERATIVA; sesión, cookies, host, errores y frontera privilegiada equivalentes según aplique.                   | Restaurar archivo local anterior y la versión/configuración compartida previa compatible.                    |
| `devVentoGroup/vento-origo`  | `FAM-020` | `src/components/vento/standard/vento-logo.tsx`   | `STATIC`                | `MIGRATE`    | @vento/ui-web + @vento/contracts                                                  | `SHELL-UI-001`                    | `devVentoGroup/vento-origo / SHELL-MIG-005`   | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar componente/CSS local anterior y el pin previo de @vento/ui-web.                                    |
| `devVentoGroup/vento-origo`  | `FAM-022` | `src/lib/auth/shared-device-signature.ts`        | `STATIC`                | `MIGRATE`    | @vento/os-context + @vento/contracts                                              | `SHELL-AUTH-002`                  | `devVentoGroup/vento-origo / SHELL-AUTH-005`  | BUILD + LOCAL + REMOTA + OPERATIVA; decisión, razones, contexto, SSO o firma mantienen paridad y protección en servidor.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-origo`  | `FAM-023` | `src/lib/auth/sso.ts`                            | `NO_CONSUMER_CONFIRMED` | `RETIRE`     | devVentoGroup/vento-origo                                                         | `SHELL-AUD-011 / SHELL-MIG-008`   | `devVentoGroup/vento-origo / SHELL-MIG-008`   | LOCAL + BUILD; cero consumidores STATIC/DYNAMIC/FRAMEWORK/CI/SCRIPT revalidado; exports y aliases sin referencias; rollback restaurable. | Restaurar último blob/export conocido del artefacto y revertir el cambio de retiro; repetir build y pruebas. |
| `devVentoGroup/vento-origo`  | `FAM-025` | `src/lib/supabase/employee-sites.ts`             | `STATIC`                | `MIGRATE`    | @vento/contracts + @vento/os-context                                              | `SHELL-CON-007 / SHELL-AUTH-002`  | `devVentoGroup/vento-origo / SHELL-AUTH-005`  | BUILD + LOCAL + REMOTA + OPERATIVA; decisión, razones, contexto, SSO o firma mantienen paridad y protección en servidor.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-pulso`  | `FAM-001` | `src/app/layout.tsx`                             | `FRAMEWORK`             | `KEEP LOCAL` | devVentoGroup/vento-pulso + @vento/ui-web                                         | `SHELL-UI-010`                    | `devVentoGroup/vento-pulso / SHELL-MIG-005`   | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar archivo local anterior y la versión/configuración compartida previa compatible.                    |
| `devVentoGroup/vento-pulso`  | `FAM-002` | `src/app/globals.css`                            | `STATIC`                | `KEEP LOCAL` | devVentoGroup/vento-pulso + @vento/ui-web                                         | `SHELL-UI-001`                    | `devVentoGroup/vento-pulso / SHELL-MIG-005`   | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar archivo local anterior y la versión/configuración compartida previa compatible.                    |
| `devVentoGroup/vento-pulso`  | `FAM-003` | `src/components/vento/standard/vento-shell.tsx`  | `STATIC`                | `KEEP LOCAL` | devVentoGroup/vento-pulso + @vento/ui-web + @vento/contracts + @vento/os-context  | `SHELL-UI-010`                    | `devVentoGroup/vento-pulso / SHELL-MIG-005`   | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar archivo local anterior y la versión/configuración compartida previa compatible.                    |
| `devVentoGroup/vento-pulso`  | `FAM-004` | `src/components/vento/standard/vento-chrome.tsx` | `STATIC`                | `MIGRATE`    | @vento/ui-web                                                                     | `SHELL-UI-010`                    | `devVentoGroup/vento-pulso / SHELL-MIG-005`   | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar componente/CSS local anterior y el pin previo de @vento/ui-web.                                    |
| `devVentoGroup/vento-pulso`  | `FAM-005` | `src/components/vento/standard/ui.tsx`           | `STATIC`                | `MIGRATE`    | @vento/ui-web                                                                     | `SHELL-UI-001`                    | `devVentoGroup/vento-pulso / SHELL-MIG-005`   | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar componente/CSS local anterior y el pin previo de @vento/ui-web.                                    |
| `devVentoGroup/vento-pulso`  | `FAM-006` | `src/components/vento/standard/table.tsx`        | `STATIC`                | `MIGRATE`    | @vento/ui-web                                                                     | `SHELL-UI-001`                    | `devVentoGroup/vento-pulso / SHELL-MIG-005`   | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar componente/CSS local anterior y el pin previo de @vento/ui-web.                                    |
| `devVentoGroup/vento-pulso`  | `FAM-007` | `src/components/vento/standard/app-switcher.tsx` | `STATIC`                | `MIGRATE`    | @vento/ui-web + @vento/contracts                                                  | `SHELL-UI-007`                    | `devVentoGroup/vento-pulso / SHELL-MIG-005`   | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar componente/CSS local anterior y el pin previo de @vento/ui-web.                                    |
| `devVentoGroup/vento-pulso`  | `FAM-008` | `src/components/vento/standard/profile-menu.tsx` | `STATIC`                | `MIGRATE`    | @vento/ui-web + @vento/os-context                                                 | `SHELL-UI-010`                    | `devVentoGroup/vento-pulso / SHELL-MIG-005`   | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar componente/CSS local anterior y el pin previo de @vento/ui-web.                                    |
| `devVentoGroup/vento-pulso`  | `FAM-009` | `src/lib/auth/guard.ts`                          | `STATIC`                | `MIGRATE`    | @vento/os-context + @vento/contracts                                              | `SHELL-AUTH-002`                  | `devVentoGroup/vento-pulso / SHELL-AUTH-005`  | BUILD + LOCAL + REMOTA + OPERATIVA; decisión, razones, contexto, SSO o firma mantienen paridad y protección en servidor.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-pulso`  | `FAM-010` | `src/lib/auth/permissions.ts`                    | `STATIC`                | `MIGRATE`    | @vento/os-context + @vento/contracts                                              | `SHELL-AUTH-002`                  | `devVentoGroup/vento-pulso / SHELL-AUTH-005`  | BUILD + LOCAL + REMOTA + OPERATIVA; decisión, razones, contexto, SSO o firma mantienen paridad y protección en servidor.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-pulso`  | `FAM-011` | `src/lib/auth/operational-session.ts`            | `STATIC`                | `MIGRATE`    | @vento/os-context + @vento/contracts                                              | `SHELL-CTX-001`                   | `devVentoGroup/vento-pulso / SHELL-AUTH-005`  | BUILD + LOCAL + REMOTA + OPERATIVA; decisión, razones, contexto, SSO o firma mantienen paridad y protección en servidor.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-pulso`  | `FAM-012` | `src/lib/auth/role-override.ts`                  | `STATIC`                | `MIGRATE`    | @vento/os-context + @vento/contracts                                              | `SHELL-AUTH-001`                  | `devVentoGroup/vento-pulso / SHELL-AUTH-005`  | BUILD + LOCAL + REMOTA + OPERATIVA; decisión, razones, contexto, SSO o firma mantienen paridad y protección en servidor.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-pulso`  | `FAM-013` | `src/lib/auth/role-override-config.ts`           | `STATIC`                | `MIGRATE`    | @vento/contracts                                                                  | `SHELL-CON-004 / SHELL-CON-005`   | `devVentoGroup/vento-pulso / SHELL-AUTH-005`  | BUILD + LOCAL + REMOTA; tipos/artefactos generados reproducibles y consumidor sin strings o casts legacy no autorizados.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-pulso`  | `FAM-014` | `src/lib/supabase/client.ts`                     | `STATIC`                | `MIGRATE`    | @vento/supabase                                                                   | `SHELL-DB-001`                    | `devVentoGroup/vento-pulso / SHELL-AUTH-005`  | BUILD + LOCAL + REMOTA + OPERATIVA; sesión, cookies, host, errores y frontera privilegiada equivalentes según aplique.                   | Restaurar factory local anterior, política de cookies/configuración y pin previo de @vento/supabase.         |
| `devVentoGroup/vento-pulso`  | `FAM-015` | `src/lib/supabase/server.ts`                     | `STATIC`                | `MIGRATE`    | @vento/supabase                                                                   | `SHELL-DB-001`                    | `devVentoGroup/vento-pulso / SHELL-AUTH-005`  | BUILD + LOCAL + REMOTA + OPERATIVA; sesión, cookies, host, errores y frontera privilegiada equivalentes según aplique.                   | Restaurar factory local anterior, política de cookies/configuración y pin previo de @vento/supabase.         |
| `devVentoGroup/vento-pulso`  | `FAM-017` | `src/lib/supabase/proxy.ts`                      | `NO_CONSUMER_CONFIRMED` | `RETIRE`     | devVentoGroup/vento-pulso                                                         | `SHELL-AUD-011 / SHELL-MIG-008`   | `devVentoGroup/vento-pulso / SHELL-MIG-008`   | LOCAL + BUILD; cero consumidores STATIC/DYNAMIC/FRAMEWORK/CI/SCRIPT revalidado; exports y aliases sin referencias; rollback restaurable. | Restaurar último blob/export conocido del artefacto y revertir el cambio de retiro; repetir build y pruebas. |
| `devVentoGroup/vento-pulso`  | `FAM-020` | `src/components/vento/standard/vento-logo.tsx`   | `STATIC`                | `MIGRATE`    | @vento/ui-web + @vento/contracts                                                  | `SHELL-UI-001`                    | `devVentoGroup/vento-pulso / SHELL-MIG-005`   | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar componente/CSS local anterior y el pin previo de @vento/ui-web.                                    |
| `devVentoGroup/vento-pulso`  | `FAM-022` | `src/lib/auth/shared-device-signature.ts`        | `STATIC`                | `MIGRATE`    | @vento/os-context + @vento/contracts                                              | `SHELL-AUTH-002`                  | `devVentoGroup/vento-pulso / SHELL-AUTH-005`  | BUILD + LOCAL + REMOTA + OPERATIVA; decisión, razones, contexto, SSO o firma mantienen paridad y protección en servidor.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-pulso`  | `FAM-023` | `src/lib/auth/sso.ts`                            | `STATIC`                | `MIGRATE`    | @vento/os-context + @vento/contracts                                              | `SHELL-AUTH-002 / SHELL-AUTH-005` | `devVentoGroup/vento-pulso / SHELL-AUTH-005`  | BUILD + LOCAL + REMOTA + OPERATIVA; decisión, razones, contexto, SSO o firma mantienen paridad y protección en servidor.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-pulso`  | `FAM-026` | `src/utils/supabase/client.ts`                   | `NO_CONSUMER_CONFIRMED` | `RETIRE`     | devVentoGroup/vento-pulso                                                         | `SHELL-AUD-011 / SHELL-MIG-008`   | `devVentoGroup/vento-pulso / SHELL-MIG-008`   | LOCAL + BUILD; cero consumidores STATIC/DYNAMIC/FRAMEWORK/CI/SCRIPT revalidado; exports y aliases sin referencias; rollback restaurable. | Restaurar último blob/export conocido del artefacto y revertir el cambio de retiro; repetir build y pruebas. |
| `devVentoGroup/vento-numera` | `FAM-001` | `src/app/layout.tsx`                             | `FRAMEWORK`             | `KEEP LOCAL` | devVentoGroup/vento-numera + @vento/ui-web                                        | `SHELL-UI-010`                    | `devVentoGroup/vento-numera / SHELL-MIG-005`  | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar archivo local anterior y la versión/configuración compartida previa compatible.                    |
| `devVentoGroup/vento-numera` | `FAM-002` | `src/app/globals.css`                            | `STATIC`                | `KEEP LOCAL` | devVentoGroup/vento-numera + @vento/ui-web                                        | `SHELL-UI-001`                    | `devVentoGroup/vento-numera / SHELL-MIG-005`  | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar archivo local anterior y la versión/configuración compartida previa compatible.                    |
| `devVentoGroup/vento-numera` | `FAM-003` | `src/components/vento/standard/vento-shell.tsx`  | `STATIC`                | `KEEP LOCAL` | devVentoGroup/vento-numera + @vento/ui-web + @vento/contracts + @vento/os-context | `SHELL-UI-010`                    | `devVentoGroup/vento-numera / SHELL-MIG-005`  | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar archivo local anterior y la versión/configuración compartida previa compatible.                    |
| `devVentoGroup/vento-numera` | `FAM-004` | `src/components/vento/standard/vento-chrome.tsx` | `STATIC`                | `MIGRATE`    | @vento/ui-web                                                                     | `SHELL-UI-010`                    | `devVentoGroup/vento-numera / SHELL-MIG-005`  | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar componente/CSS local anterior y el pin previo de @vento/ui-web.                                    |
| `devVentoGroup/vento-numera` | `FAM-005` | `src/components/vento/standard/ui.tsx`           | `STATIC`                | `MIGRATE`    | @vento/ui-web                                                                     | `SHELL-UI-001`                    | `devVentoGroup/vento-numera / SHELL-MIG-005`  | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar componente/CSS local anterior y el pin previo de @vento/ui-web.                                    |
| `devVentoGroup/vento-numera` | `FAM-006` | `src/components/vento/standard/table.tsx`        | `STATIC`                | `MIGRATE`    | @vento/ui-web                                                                     | `SHELL-UI-001`                    | `devVentoGroup/vento-numera / SHELL-MIG-005`  | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar componente/CSS local anterior y el pin previo de @vento/ui-web.                                    |
| `devVentoGroup/vento-numera` | `FAM-007` | `src/components/vento/standard/app-switcher.tsx` | `STATIC`                | `MIGRATE`    | @vento/ui-web + @vento/contracts                                                  | `SHELL-UI-007`                    | `devVentoGroup/vento-numera / SHELL-MIG-005`  | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar componente/CSS local anterior y el pin previo de @vento/ui-web.                                    |
| `devVentoGroup/vento-numera` | `FAM-008` | `src/components/vento/standard/profile-menu.tsx` | `STATIC`                | `MIGRATE`    | @vento/ui-web + @vento/os-context                                                 | `SHELL-UI-010`                    | `devVentoGroup/vento-numera / SHELL-MIG-005`  | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar componente/CSS local anterior y el pin previo de @vento/ui-web.                                    |
| `devVentoGroup/vento-numera` | `FAM-009` | `src/lib/auth/guard.ts`                          | `STATIC`                | `MIGRATE`    | @vento/os-context + @vento/contracts                                              | `SHELL-AUTH-002`                  | `devVentoGroup/vento-numera / SHELL-AUTH-005` | BUILD + LOCAL + REMOTA + OPERATIVA; decisión, razones, contexto, SSO o firma mantienen paridad y protección en servidor.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-numera` | `FAM-010` | `src/lib/auth/permissions.ts`                    | `STATIC`                | `MIGRATE`    | @vento/os-context + @vento/contracts                                              | `SHELL-AUTH-002`                  | `devVentoGroup/vento-numera / SHELL-AUTH-005` | BUILD + LOCAL + REMOTA + OPERATIVA; decisión, razones, contexto, SSO o firma mantienen paridad y protección en servidor.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-numera` | `FAM-011` | `src/lib/auth/operational-session.ts`            | `STATIC`                | `MIGRATE`    | @vento/os-context + @vento/contracts                                              | `SHELL-CTX-001`                   | `devVentoGroup/vento-numera / SHELL-AUTH-005` | BUILD + LOCAL + REMOTA + OPERATIVA; decisión, razones, contexto, SSO o firma mantienen paridad y protección en servidor.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-numera` | `FAM-012` | `src/lib/auth/role-override.ts`                  | `STATIC`                | `MIGRATE`    | @vento/os-context + @vento/contracts                                              | `SHELL-AUTH-001`                  | `devVentoGroup/vento-numera / SHELL-AUTH-005` | BUILD + LOCAL + REMOTA + OPERATIVA; decisión, razones, contexto, SSO o firma mantienen paridad y protección en servidor.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-numera` | `FAM-013` | `src/lib/auth/role-override-config.ts`           | `STATIC`                | `MIGRATE`    | @vento/contracts                                                                  | `SHELL-CON-004 / SHELL-CON-005`   | `devVentoGroup/vento-numera / SHELL-AUTH-005` | BUILD + LOCAL + REMOTA; tipos/artefactos generados reproducibles y consumidor sin strings o casts legacy no autorizados.                 | Restaurar helper/contrato local anterior y los pins previos compatibles de contratos/SDK.                    |
| `devVentoGroup/vento-numera` | `FAM-014` | `src/lib/supabase/client.ts`                     | `STATIC`                | `MIGRATE`    | @vento/supabase                                                                   | `SHELL-DB-001`                    | `devVentoGroup/vento-numera / SHELL-AUTH-005` | BUILD + LOCAL + REMOTA + OPERATIVA; sesión, cookies, host, errores y frontera privilegiada equivalentes según aplique.                   | Restaurar factory local anterior, política de cookies/configuración y pin previo de @vento/supabase.         |
| `devVentoGroup/vento-numera` | `FAM-015` | `src/lib/supabase/server.ts`                     | `STATIC`                | `MIGRATE`    | @vento/supabase                                                                   | `SHELL-DB-001`                    | `devVentoGroup/vento-numera / SHELL-AUTH-005` | BUILD + LOCAL + REMOTA + OPERATIVA; sesión, cookies, host, errores y frontera privilegiada equivalentes según aplique.                   | Restaurar factory local anterior, política de cookies/configuración y pin previo de @vento/supabase.         |
| `devVentoGroup/vento-numera` | `FAM-016` | `middleware.ts`                                  | `FRAMEWORK`             | `KEEP LOCAL` | devVentoGroup/vento-numera + @vento/os-context + @vento/supabase                  | `SHELL-AUTH-002`                  | `devVentoGroup/vento-numera / SHELL-AUTH-005` | BUILD + LOCAL + REMOTA + OPERATIVA; sesión, cookies, host, errores y frontera privilegiada equivalentes según aplique.                   | Restaurar archivo local anterior y la versión/configuración compartida previa compatible.                    |
| `devVentoGroup/vento-numera` | `FAM-020` | `src/components/vento/standard/vento-logo.tsx`   | `STATIC`                | `MIGRATE`    | @vento/ui-web + @vento/contracts                                                  | `SHELL-UI-001`                    | `devVentoGroup/vento-numera / SHELL-MIG-005`  | BUILD + LOCAL + REMOTA; API, CSS, tema, responsive, navegación y accesibilidad equivalentes en el consumidor.                            | Restaurar componente/CSS local anterior y el pin previo de @vento/ui-web.                                    |
| `devVentoGroup/vento-numera` | `FAM-023` | `src/lib/auth/sso.ts`                            | `NO_CONSUMER_CONFIRMED` | `RETIRE`     | devVentoGroup/vento-numera                                                        | `SHELL-AUD-011 / SHELL-MIG-008`   | `devVentoGroup/vento-numera / SHELL-MIG-008`  | LOCAL + BUILD; cero consumidores STATIC/DYNAMIC/FRAMEWORK/CI/SCRIPT revalidado; exports y aliases sin referencias; rollback restaurable. | Restaurar último blob/export conocido del artefacto y revertir el cambio de retiro; repetir build y pruebas. |
| `devVentoGroup/vento-numera` | `FAM-025` | `src/lib/supabase/employee-sites.ts`             | `NO_CONSUMER_CONFIRMED` | `RETIRE`     | devVentoGroup/vento-numera                                                        | `SHELL-AUD-011 / SHELL-MIG-008`   | `devVentoGroup/vento-numera / SHELL-MIG-008`  | LOCAL + BUILD; cero consumidores STATIC/DYNAMIC/FRAMEWORK/CI/SCRIPT revalidado; exports y aliases sin referencias; rollback restaurable. | Restaurar último blob/export conocido del artefacto y revertir el cambio de retiro; repetir build y pruebas. |

**Conciliación:** 128 ocurrencias esperadas, 128 materializadas; 11 quedan como `RETIRE` bajo gate de cero consumidores y 117 como nodos consumidos, entrypoints o compatibilidad vigente.

---

#### 8. Consumidores directos de autorización fuera de las familias auth

`SHELL-AUD-003` materializó once archivos de negocio o launcher con llamadas directas a permisos fuera de `guard.ts`, `permissions.ts`, `operational-session.ts` y `role-override.ts`. Todos deben migrar a la frontera compartida; ocultarlos detrás de la migración de los helpers dejaría bypasses o evaluadores paralelos.

| Repositorio                 | Archivo                                                  | Clase       | Disposición | Frontera objetivo                    | Propietario                       | Lote base                                    | Evidencia esperada                                                                                                         | Rollback                                                                    |
| --------------------------- | -------------------------------------------------------- | ----------- | ----------- | ------------------------------------ | --------------------------------- | -------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| `devVentoGroup/vento-shell` | `src/app/page.tsx`                                       | `FRAMEWORK` | `MIGRATE`   | @vento/contracts + @vento/os-context | `SHELL-AUTH-002 / SHELL-AUTH-005` | `devVentoGroup/vento-shell / SHELL-AUTH-005` | BUILD + LOCAL + REMOTA + OPERATIVA; misma decisión y razones para el mismo actor/contexto; rutas server siguen protegidas. | Restaurar llamada/evaluador local anterior y pins previos de contratos/SDK. |
| `devVentoGroup/vento-viso`  | `src/app/api/viso/upload-product-image/route.ts`         | `FRAMEWORK` | `MIGRATE`   | @vento/contracts + @vento/os-context | `SHELL-AUTH-002 / SHELL-AUTH-005` | `devVentoGroup/vento-viso / SHELL-AUTH-005`  | BUILD + LOCAL + REMOTA + OPERATIVA; misma decisión y razones para el mismo actor/contexto; rutas server siguen protegidas. | Restaurar llamada/evaluador local anterior y pins previos de contratos/SDK. |
| `devVentoGroup/vento-viso`  | `src/app/api/viso/upload-commercial-menu-image/route.ts` | `FRAMEWORK` | `MIGRATE`   | @vento/contracts + @vento/os-context | `SHELL-AUTH-002 / SHELL-AUTH-005` | `devVentoGroup/vento-viso / SHELL-AUTH-005`  | BUILD + LOCAL + REMOTA + OPERATIVA; misma decisión y razones para el mismo actor/contexto; rutas server siguen protegidas. | Restaurar llamada/evaluador local anterior y pins previos de contratos/SDK. |
| `devVentoGroup/vento-viso`  | `src/app/api/viso/attendance-report/route.ts`            | `FRAMEWORK` | `MIGRATE`   | @vento/contracts + @vento/os-context | `SHELL-AUTH-002 / SHELL-AUTH-005` | `devVentoGroup/vento-viso / SHELL-AUTH-005`  | BUILD + LOCAL + REMOTA + OPERATIVA; misma decisión y razones para el mismo actor/contexto; rutas server siguen protegidas. | Restaurar llamada/evaluador local anterior y pins previos de contratos/SDK. |
| `devVentoGroup/vento-viso`  | `src/app/staff/[id]/page.tsx`                            | `FRAMEWORK` | `MIGRATE`   | @vento/contracts + @vento/os-context | `SHELL-AUTH-002 / SHELL-AUTH-005` | `devVentoGroup/vento-viso / SHELL-AUTH-005`  | BUILD + LOCAL + REMOTA + OPERATIVA; misma decisión y razones para el mismo actor/contexto; rutas server siguen protegidas. | Restaurar llamada/evaluador local anterior y pins previos de contratos/SDK. |
| `devVentoGroup/vento-origo` | `src/lib/suppliers.ts`                                   | `STATIC`    | `MIGRATE`   | @vento/contracts + @vento/os-context | `SHELL-AUTH-002 / SHELL-AUTH-005` | `devVentoGroup/vento-origo / SHELL-AUTH-005` | BUILD + LOCAL + REMOTA + OPERATIVA; misma decisión y razones para el mismo actor/contexto; rutas server siguen protegidas. | Restaurar llamada/evaluador local anterior y pins previos de contratos/SDK. |
| `devVentoGroup/vento-origo` | `src/app/receipts/new/page.tsx`                          | `FRAMEWORK` | `MIGRATE`   | @vento/contracts + @vento/os-context | `SHELL-AUTH-002 / SHELL-AUTH-005` | `devVentoGroup/vento-origo / SHELL-AUTH-005` | BUILD + LOCAL + REMOTA + OPERATIVA; misma decisión y razones para el mismo actor/contexto; rutas server siguen protegidas. | Restaurar llamada/evaluador local anterior y pins previos de contratos/SDK. |
| `devVentoGroup/vento-origo` | `src/app/product-master-review/page.tsx`                 | `FRAMEWORK` | `MIGRATE`   | @vento/contracts + @vento/os-context | `SHELL-AUTH-002 / SHELL-AUTH-005` | `devVentoGroup/vento-origo / SHELL-AUTH-005` | BUILD + LOCAL + REMOTA + OPERATIVA; misma decisión y razones para el mismo actor/contexto; rutas server siguen protegidas. | Restaurar llamada/evaluador local anterior y pins previos de contratos/SDK. |
| `devVentoGroup/vento-origo` | `src/app/purchase-orders/[id]/pdf/route.ts`              | `FRAMEWORK` | `MIGRATE`   | @vento/contracts + @vento/os-context | `SHELL-AUTH-002 / SHELL-AUTH-005` | `devVentoGroup/vento-origo / SHELL-AUTH-005` | BUILD + LOCAL + REMOTA + OPERATIVA; misma decisión y razones para el mismo actor/contexto; rutas server siguen protegidas. | Restaurar llamada/evaluador local anterior y pins previos de contratos/SDK. |
| `devVentoGroup/vento-pulso` | `src/modules/pos/actions/identify-client.action.ts`      | `STATIC`    | `MIGRATE`   | @vento/contracts + @vento/os-context | `SHELL-AUTH-002 / SHELL-AUTH-005` | `devVentoGroup/vento-pulso / SHELL-AUTH-005` | BUILD + LOCAL + REMOTA + OPERATIVA; misma decisión y razones para el mismo actor/contexto; rutas server siguen protegidas. | Restaurar llamada/evaluador local anterior y pins previos de contratos/SDK. |
| `devVentoGroup/vento-pulso` | `src/app/orders/delivery-override-bridge.tsx`            | `STATIC`    | `MIGRATE`   | @vento/contracts + @vento/os-context | `SHELL-AUTH-002 / SHELL-AUTH-005` | `devVentoGroup/vento-pulso / SHELL-AUTH-005` | BUILD + LOCAL + REMOTA + OPERATIVA; misma decisión y razones para el mismo actor/contexto; rutas server siguen protegidas. | Restaurar llamada/evaluador local anterior y pins previos de contratos/SDK. |

**Conciliación:** 11 archivos, 11 filas, 0 destinos genéricos.

---

#### 9. Consumidores CI, script y manual

| Repositorio                 | Archivo                                                   | Clase             | Disposición  | Frontera objetivo                                                      | Propietario     | Lote base                                   | Evidencia esperada                                                                                                      | Rollback                                                                                           |
| --------------------------- | --------------------------------------------------------- | ----------------- | ------------ | ---------------------------------------------------------------------- | --------------- | ------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- |
| `devVentoGroup/vento-nexo`  | `.github/workflows/tmp-apply-privileged-request-area.yml` | `CI`              | `KEEP LOCAL` | devVentoGroup/vento-nexo + @vento/os-context + @vento/contracts        | `SHELL-MIG-003` | `devVentoGroup/vento-nexo / SHELL-MIG-003`  | Workflow no parchea una forma legacy incompatible; build de preview y targets del patch verificados.                    | Revertir el cambio del workflow y restaurar el script/targets previos en NEXO.                     |
| `devVentoGroup/vento-nexo`  | `scripts/tmp-apply-privileged-request-area.mjs`           | `SCRIPT`          | `KEEP LOCAL` | devVentoGroup/vento-nexo + @vento/os-context + @vento/contracts        | `SHELL-MIG-003` | `devVentoGroup/vento-nexo / SHELL-MIG-003`  | Patch reproducible contra los archivos exactos; no introduce nuevo consumo legacy tras el gate.                         | Restaurar script y archivos objetivo al commit previo del parche.                                  |
| `devVentoGroup/vento-shell` | `tools/bootstrap-app-shell.ps1`                           | `SCRIPT / MANUAL` | `MIGRATE`    | @vento/ui-web + @vento/contracts + @vento/os-context + @vento/supabase | `SHELL-MIG-004` | `devVentoGroup/vento-shell / SHELL-MIG-004` | Scaffold sustituto reproduce configuración sin copiar implementación runtime; versiones fijadas y rollback comprobable. | Restaurar bootstrap/template legacy controlados hasta que el scaffold sustituto quede certificado. |

Reconciliación de CI actual:

| Repositorio                  | Estado CI relevante para fundación compartida                                                                                             | Resultado                                            |
| ---------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------- |
| `devVentoGroup/vento-shell`  | `.github/workflows/validate-canonical-plan.yml` valida documentación y derivados canónicos                                                | no es consumidor runtime de los paquetes compartidos |
| `devVentoGroup/vento-viso`   | `apply-guided-product-form.yml` modifica `src/components/viso/menu-item-form.tsx`                                                         | fuera del inventario de fundación compartida         |
| `devVentoGroup/vento-nexo`   | `tmp-apply-privileged-request-area.yml` parchea remisiones y depende de `operationalSession`/evaluadores legacy                           | consumidor `CI` incluido                             |
| `devVentoGroup/vento-fogo`   | no existe `.github/workflows` en el corte consultado                                                                                      | sin consumidor CI confirmado                         |
| `devVentoGroup/vento-origo`  | no existe `.github/workflows` en el corte consultado                                                                                      | sin consumidor CI confirmado                         |
| `devVentoGroup/vento-pulso`  | `apply-electronic-billing-ui.yml` está deshabilitado y solo remite a `predev/prebuild`; el `package.json` vigente no declara esos scripts | sin consumidor de fundación compartida confirmado    |
| `devVentoGroup/vento-numera` | no existe `.github/workflows` en el corte consultado                                                                                      | sin consumidor CI confirmado                         |

El workflow/script temporal de NEXO no recibe autorización de retiro en esta tarea. Se conserva local y debe quedar bloqueado contra nuevas dependencias legacy en `SHELL-MIG-003`; `SHELL-MIG-002` decidirá si su lote lo adapta o lo elimina después de comprobar que su propósito temporal ya terminó.

---

#### 10. Candidatos sin consumidor confirmado y legacy consumido

La separación es vinculante: un archivo sin consumidor confirmado no exige sustituto funcional; un legacy consumido sí exige reemplazo, migración, paridad y rollback antes del retiro.

| Identidad                                       | Repositorio                  | Estado de consumo         | Disposición | Lote base                                    | Condición de salida                                                                                          |
| ----------------------------------------------- | ---------------------------- | ------------------------- | ----------- | -------------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| `src/lib/supabase/proxy.ts`                     | `devVentoGroup/vento-viso`   | sin consumidor confirmado | `RETIRE`    | `devVentoGroup/vento-viso / SHELL-MIG-008`   | cero consumidores STATIC/DYNAMIC/FRAMEWORK/CI/SCRIPT revalidado; build y rollback aprobados                  |
| `src/lib/auth/sso.ts`                           | `devVentoGroup/vento-viso`   | sin consumidor confirmado | `RETIRE`    | `devVentoGroup/vento-viso / SHELL-MIG-008`   | cero consumidores STATIC/DYNAMIC/FRAMEWORK/CI/SCRIPT revalidado; build y rollback aprobados                  |
| `src/lib/supabase/proxy.ts`                     | `devVentoGroup/vento-nexo`   | sin consumidor confirmado | `RETIRE`    | `devVentoGroup/vento-nexo / SHELL-MIG-008`   | cero consumidores STATIC/DYNAMIC/FRAMEWORK/CI/SCRIPT revalidado; build y rollback aprobados                  |
| `src/components/vento/standard/page-header.tsx` | `devVentoGroup/vento-nexo`   | sin consumidor confirmado | `RETIRE`    | `devVentoGroup/vento-nexo / SHELL-MIG-008`   | cero consumidores STATIC/DYNAMIC/FRAMEWORK/CI/SCRIPT revalidado; build y rollback aprobados                  |
| `src/lib/auth/sso.ts`                           | `devVentoGroup/vento-fogo`   | sin consumidor confirmado | `RETIRE`    | `devVentoGroup/vento-fogo / SHELL-MIG-008`   | cero consumidores STATIC/DYNAMIC/FRAMEWORK/CI/SCRIPT revalidado; build y rollback aprobados                  |
| `src/lib/supabase/employee-sites.ts`            | `devVentoGroup/vento-fogo`   | sin consumidor confirmado | `RETIRE`    | `devVentoGroup/vento-fogo / SHELL-MIG-008`   | cero consumidores STATIC/DYNAMIC/FRAMEWORK/CI/SCRIPT revalidado; build y rollback aprobados                  |
| `src/lib/auth/sso.ts`                           | `devVentoGroup/vento-origo`  | sin consumidor confirmado | `RETIRE`    | `devVentoGroup/vento-origo / SHELL-MIG-008`  | cero consumidores STATIC/DYNAMIC/FRAMEWORK/CI/SCRIPT revalidado; build y rollback aprobados                  |
| `src/lib/supabase/proxy.ts`                     | `devVentoGroup/vento-pulso`  | sin consumidor confirmado | `RETIRE`    | `devVentoGroup/vento-pulso / SHELL-MIG-008`  | cero consumidores STATIC/DYNAMIC/FRAMEWORK/CI/SCRIPT revalidado; build y rollback aprobados                  |
| `src/utils/supabase/client.ts`                  | `devVentoGroup/vento-pulso`  | sin consumidor confirmado | `RETIRE`    | `devVentoGroup/vento-pulso / SHELL-MIG-008`  | cero consumidores STATIC/DYNAMIC/FRAMEWORK/CI/SCRIPT revalidado; build y rollback aprobados                  |
| `src/lib/auth/sso.ts`                           | `devVentoGroup/vento-numera` | sin consumidor confirmado | `RETIRE`    | `devVentoGroup/vento-numera / SHELL-MIG-008` | cero consumidores STATIC/DYNAMIC/FRAMEWORK/CI/SCRIPT revalidado; build y rollback aprobados                  |
| `src/lib/supabase/employee-sites.ts`            | `devVentoGroup/vento-numera` | sin consumidor confirmado | `RETIRE`    | `devVentoGroup/vento-numera / SHELL-MIG-008` | cero consumidores STATIC/DYNAMIC/FRAMEWORK/CI/SCRIPT revalidado; build y rollback aprobados                  |
| `src/lib/auth/sso.ts`                           | `devVentoGroup/vento-nexo`   | consumidor confirmado     | `MIGRATE`   | `devVentoGroup/vento-nexo / SHELL-AUTH-005`  | reemplazo disponible, consumidores migrados, paridad demostrada y rollback probado antes de retirar la copia |
| `src/lib/auth/sso.ts`                           | `devVentoGroup/vento-pulso`  | consumidor confirmado     | `MIGRATE`   | `devVentoGroup/vento-pulso / SHELL-AUTH-005` | reemplazo disponible, consumidores migrados, paridad demostrada y rollback probado antes de retirar la copia |
| `src/lib/supabase/employee-sites.ts`            | `devVentoGroup/vento-origo`  | consumidor confirmado     | `MIGRATE`   | `devVentoGroup/vento-origo / SHELL-AUTH-005` | reemplazo disponible, consumidores migrados, paridad demostrada y rollback probado antes de retirar la copia |
| `src/components/vento/standard/page-header.tsx` | `devVentoGroup/vento-viso`   | consumidor confirmado     | `MIGRATE`   | `devVentoGroup/vento-viso / SHELL-MIG-005`   | reemplazo disponible, consumidores migrados, paridad demostrada y rollback probado antes de retirar la copia |

**Conciliación:** 11 archivos sin consumidor confirmado quedan separados de 4 ejemplos críticos de legacy consumido que no puede retirarse anticipadamente.

---

#### 11. Miembros internos y placeholders heredados de `SHELL-AUD-011`

| Identidad                                                  | Disposición                                                                         | Propietario                    | Lote base                                                                                                                                                                                    | Evidencia esperada                                                          | Rollback                                                             |
| ---------------------------------------------------------- | ----------------------------------------------------------------------------------- | ------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------- | -------------------------------------------------------------------- |
| `GuardOptions.requireAppAccessPermission = false` en PULSO | `RETIRE` o sustituir por política discriminada                                      | `SHELL-AUTH-005`               | `devVentoGroup/vento-pulso / SHELL-MIG-008`                                                                                                                                                  | cero consumidores del valor `false`; typecheck, pruebas de guard y rollback | restaurar la rama previa si aparece una regresión                    |
| `AppSwitcherItem.brandColor`                               | `RETIRE` como miembro local inerte; color futuro se deriva de presentación canónica | `SHELL-CON-002 / SHELL-UI-001` | `devVentoGroup/vento-viso`; `devVentoGroup/vento-nexo`; `devVentoGroup/vento-fogo`; `devVentoGroup/vento-origo`; `devVentoGroup/vento-pulso`; `devVentoGroup/vento-numera` / `SHELL-MIG-008` | cero lecturas legacy; typecheck y render equivalentes                       | restaurar miembro y proyección anterior                              |
| `AppSwitcherProps.sites`                                   | `RETIRE`                                                                            | `SHELL-CTX-003 / SHELL-UI-007` | `devVentoGroup/vento-viso`; `devVentoGroup/vento-nexo`; `devVentoGroup/vento-fogo`; `devVentoGroup/vento-origo`; `devVentoGroup/vento-pulso`; `devVentoGroup/vento-numera` / `SHELL-MIG-008` | cero consumidores; selector de sede propietario preservado                  | restaurar prop y caller anterior                                     |
| `AppSwitcherProps.activeSiteId`                            | `RETIRE`                                                                            | `SHELL-CTX-003 / SHELL-UI-007` | `devVentoGroup/vento-viso`; `devVentoGroup/vento-nexo`; `devVentoGroup/vento-fogo`; `devVentoGroup/vento-origo`; `devVentoGroup/vento-pulso`; `devVentoGroup/vento-numera` / `SHELL-MIG-008` | cero consumidores; contexto activo preservado fuera del componente          | restaurar prop y caller anterior                                     |
| acceso SHELL `Mi perfil` → `/`                             | `RETIRE`                                                                            | `SHELL-UI-010 / SHELL-APP-021` | `devVentoGroup/vento-shell / SHELL-APP-021`                                                                                                                                                  | acción ausente y navegación del Hub verificada                              | restaurar entrada únicamente si existe capacidad aprobada compatible |
| acceso SHELL `Configuración` → `/`                         | `RETIRE`                                                                            | `SHELL-UI-010 / SHELL-APP-021` | `devVentoGroup/vento-shell / SHELL-APP-021`                                                                                                                                                  | acción ausente y navegación del Hub verificada                              | restaurar entrada únicamente si existe capacidad aprobada compatible |

Estos elementos no se cuentan dentro de las 142 filas de archivos/consumidores porque son miembros contractuales o entradas de navegación, no archivos físicos adicionales.

---

#### 12. Inventario por repositorio

| Repositorio                  | Ocurrencias `FAM-*` | Candidatos sin consumidor | Consumidores directos adicionales | CI/script/manual relevante | Resultado de preparación                                                              |
| ---------------------------- | ------------------: | ------------------------: | --------------------------------: | -------------------------: | ------------------------------------------------------------------------------------- |
| `devVentoGroup/vento-shell`  |               **5** |                     **0** |                             **1** |                      **1** | inventario direccionado; orden reversible pendiente exclusivamente de `SHELL-MIG-002` |
| `devVentoGroup/vento-viso`   |              **21** |                     **2** |                             **4** |                      **0** | inventario direccionado; orden reversible pendiente exclusivamente de `SHELL-MIG-002` |
| `devVentoGroup/vento-nexo`   |              **23** |                     **2** |                             **0** |                      **2** | inventario direccionado; orden reversible pendiente exclusivamente de `SHELL-MIG-002` |
| `devVentoGroup/vento-fogo`   |              **20** |                     **2** |                             **0** |                      **0** | inventario direccionado; orden reversible pendiente exclusivamente de `SHELL-MIG-002` |
| `devVentoGroup/vento-origo`  |              **20** |                     **1** |                             **4** |                      **0** | inventario direccionado; orden reversible pendiente exclusivamente de `SHELL-MIG-002` |
| `devVentoGroup/vento-pulso`  |              **20** |                     **2** |                             **2** |                      **0** | inventario direccionado; orden reversible pendiente exclusivamente de `SHELL-MIG-002` |
| `devVentoGroup/vento-numera` |              **19** |                     **2** |                             **0** |                      **0** | inventario direccionado; orden reversible pendiente exclusivamente de `SHELL-MIG-002` |

**Conciliación:** 128 ocurrencias + 11 consumidores directos + 3 consumidores CI/script/manual = 142 filas ejecutables.

---

#### 13. Dependencias internas antes de cada lote

Sin fijar todavía el orden entre repositorios, cada lote reversible definido por `SHELL-MIG-002` deberá respetar esta precedencia interna:

1. contratos o artefactos generados requeridos disponibles y versionados;
2. paquete compartido propietario disponible y compatible;
3. consumidor local modificado para importar/adaptar la frontera compartida;
4. extensiones locales preservadas mediante configuración, slot, adapter o entrypoint;
5. pruebas de paridad y observabilidad;
6. retiro de la copia legacy únicamente si su consumo es cero o todos sus consumidores ya migraron;
7. rollback probado antes de cerrar el lote.

No se fija aquí qué repositorio migra primero. Esa decisión pertenece exclusivamente a `SHELL-MIG-002`.

---

#### 14. Evidencia mínima que deberá producir cada lote posterior

| Clase     | Evidencia mínima                                                                                         |
| --------- | -------------------------------------------------------------------------------------------------------- |
| BUILD     | build/typecheck/lint del repositorio propietario cuando existan scripts aplicables                       |
| LOCAL     | imports, exports, aliases, paquete fijado, archivos cambiados y cero referencias legacy no autorizadas   |
| REMOTA    | commit base, commit resultante, versión de paquete y estado del repositorio remoto                       |
| OPERATIVA | paridad de autorización, sesión, contexto, rutas, navegación o interacción según la familia              |
| FÍSICA    | archivo/entrypoint/package realmente presente o retirado conforme a la disposición y al commit declarado |

Para `RETIRE`, además se exige la búsqueda de consumidores `STATIC`, `DYNAMIC`, `FRAMEWORK`, `CI` y `SCRIPT` en el commit exacto que se modificará. Para legacy consumido se exige reemplazo y migración antes del retiro.

---

#### 15. Rollback mínimo por tipo de cambio

| Tipo                                                 | Rollback obligatorio                                                                   |
| ---------------------------------------------------- | -------------------------------------------------------------------------------------- |
| adopción de `@vento/ui-web`                          | restaurar componente/CSS local y pin compatible anterior                               |
| adopción de `@vento/os-context` / `@vento/contracts` | restaurar helper, tipo o evaluador local y pins anteriores                             |
| adopción de `@vento/supabase`                        | restaurar factory, cookies/configuración y pin anterior                                |
| entrypoint `KEEP LOCAL`                              | restaurar archivo local anterior y composición previa                                  |
| artefacto `RETIRE`                                   | restaurar último blob/export conocido y repetir build/pruebas                          |
| CI/script                                            | restaurar workflow/script y archivos objetivo al commit previo                         |
| bootstrap/scaffold                                   | conservar bootstrap/template legacy controlados hasta certificar el scaffold sustituto |

El rollback es por repositorio; ninguna aplicación queda obligada a revertir junto con otra.

---

#### 16. Delta y compatibilidad desde `SHELL-AUD-011`

1. VISO, NEXO, FOGO, ORIGO, PULSO y NUMERA permanecen exactamente en los commits auditados.
2. `vento-shell` avanzó en documentación, políticas, validadores y CI del plan; no se detectó delta runtime en `src/` ni `middleware.ts` respecto del corte de `SHELL-AUD-011`.
3. La arista workflow/script temporal de NEXO se materializa ahora como consumidor `CI/SCRIPT`; no es un cambio físico posterior al audit, sino una dependencia que debía quedar explícita para cumplir la puerta de `MIG-001`.
4. El workflow PULSO que menciona `predev/prebuild` está deshabilitado y el `package.json` actual no declara esos scripts; no se inventa un consumidor inexistente.
5. No se confirmó adopción runtime de `@vento/contracts`, `@vento/os-context`, `@vento/supabase` o `@vento/ui-web` en ninguno de los siete repositorios.
6. Cualquier cambio de HEAD antes de ejecutar un lote obliga a regenerar la fila afectada antes de modificar código.

---

#### 17. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** `SHELL-MIG-001` materializa el inventario exigido por requisitos vigentes de clasificación, paquete de cambio, compatibilidad, rollback y evidencia —incluidos `TREQ-SHELL-002`, `TREQ-SHELL-004`, `TREQ-SHELL-005`, `TREQ-SHELL-006`, `TREQ-SHELL-007`, `TREQ-SHELL-008`, `TREQ-SHELL-009`, `TREQ-SHELL-029` y `TREQ-SHELL-032`— sin introducir comportamiento ejecutable ni una obligación verificable nueva independiente.

| Operación sobre `TREQ-*` | Cantidad |
| ------------------------ | -------: |
| creados                  |    **0** |
| modificados              |    **0** |
| diferidos                |    **0** |
| descartados              |    **0** |
| obsoletos                |    **0** |

---

#### 18. Evidencia de validación

| Clase     | Estado           | Evidencia                                                                                                                                                                             |
| --------- | ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | `NOT_EXECUTED`   | tarea documental; no se modificó código ni se ejecutó build de consumidores                                                                                                           |
| LOCAL     | `PASS`           | matriz generada y conciliada por conteo; 128 ocurrencias, 11 directos, 3 CI/script/manual y 11 candidatos de retiro sin duplicar la semántica de sus filas                            |
| REMOTA    | `PASS`           | fuentes canónicas, HEAD de los siete repositorios, workflow de NEXO, workflow de VISO, workflow de PULSO y bootstrap SHELL verificados mediante GitHub                                |
| OPERATIVA | `NOT_APPLICABLE` | no se ejecutaron autenticación, rutas, migraciones, despliegues ni procesos de negocio                                                                                                |
| FÍSICA    | `PASS`           | seis consumidores externos conservan el commit auditado; SHELL no presenta delta runtime desde `SHELL-AUD-011`; los artefactos CI/script clasificados existen en los paths declarados |

---

#### 19. Criterios de aceptación

`SHELL-MIG-001` queda materialmente completa porque:

- los siete repositorios tienen commit vigente y resultado de conciliación;
- las 128 ocurrencias runtime heredadas tienen disposición, frontera objetivo, propietario, lote base, evidencia y rollback;
- los once consumidores directos de permisos fuera de familias auth están separados y direccionados;
- el workflow y script temporales de NEXO quedan inventariados como consumidores `CI/SCRIPT` del legacy contextual;
- el bootstrap SHELL queda inventariado como consumidor `SCRIPT/MANUAL` de la plantilla histórica;
- los once archivos sin consumidor confirmado están separados del legacy consumido y solo pueden retirarse bajo el gate de `SHELL-AUD-011`;
- `PageHeader` VISO, SSO NEXO/PULSO y `employee-sites` ORIGO permanecen protegidos como legacy consumido;
- los miembros internos y placeholders heredados tienen propietario y lote base exactos;
- no se confirmó ningún consumidor dinámico y la búsqueda dinámica permanece obligatoria antes de cualquier retiro;
- CI de los siete repositorios fue reconciliado sin convertir workflows ajenos en consumidores ficticios;
- ninguna fila usa un destino genérico como “migrar después” o “equipo correspondiente”;
- no se inventa un orden entre repositorios ni lotes numéricos antes de `SHELL-MIG-002`;
- no se modifica código, packages, CI, Supabase, despliegues ni continuidad;
- se declaran cero cambios `TREQ-*`;
- `SHELL-MIG-002` permanece como única continuidad inmediata reservada.

---

#### 20. Límites y fuera de alcance

Esta tarea no:

- define el orden reversible entre repositorios;
- crea lotes numerados o una secuencia de despliegue;
- instala paquetes `@vento/*`;
- crea o modifica `package.json` de consumidores;
- modifica imports, exports, aliases, CSS, guards, middleware, scripts o workflows;
- retira artefactos;
- crea el scaffold sustituto;
- ejecuta builds, pruebas operativas o despliegues;
- modifica Supabase, SQL, RLS, RPC, datos o secretos;
- cambia requisitos `TREQ-*`;
- adelanta `SHELL-MIG-002..008`, `SHELL-AUTH-*` o `SHELL-CTX-*`.

---

#### 21. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-UI-020 — Incorporar Skeleton, listas y paginación`

**TAREA ACTUAL APROBADA**
`SHELL-MIG-001 — Consolidar inventario ejecutable de consumidores`

**SIGUIENTE TAREA RESERVADA**
`SHELL-MIG-002 — Definir lotes reversibles por repositorio`


### ✅ SHELL-MIG-002 — Definir lotes reversibles por repositorio

**Estado:** APROBADA
**Tarea anterior:** SHELL-MIG-001 — Consolidar inventario ejecutable de consumidores
**Tarea siguiente:** SHELL-MIG-003 — Preparar compatibilidad y bloqueo de nuevos consumidores legacy
**Tipo de tarea:** Documental; definición vinculante y materializada de lotes reversibles por repositorio, orden de adopción, precondiciones, cambios, consumidores, pruebas, observabilidad, rollback y criterios de suspensión, sin ejecutar migraciones ni modificar consumidores
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/07_01_MIGRACION_COORDINADA_DE_CONSUMIDORES_WEB.md`
**Estado físico resultante:** ESPECIFICADO; 22 lotes base reversibles definidos; 0 migraciones ejecutadas; 0 adopciones de packages ejecutadas; 0 retiros ejecutados
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`SHELL-MIG-002` transforma los `Lote base` ya asignados por `SHELL-MIG-001` en unidades de cambio reversibles y ordenadas por repositorio.

La tarea no vuelve a clasificar consumidores ni mueve identidades entre propietarios. Su función es fijar, para cada lote ya identificado:

- precondiciones de entrada;
- alcance exacto del cambio;
- consumidores alcanzados;
- pruebas obligatorias;
- observabilidad mínima;
- snapshot de rollback;
- criterio de suspensión;
- relación con las tareas propietarias que materializarán el cambio.

La regla raíz queda:

```text
una identidad de SHELL-MIG-001
→ conserva su Lote base
→ entra en un solo cambio atribuible
→ se valida sobre un commit consumidor exacto
→ se observa de forma independiente
→ puede revertirse sin desplegar simultáneamente los otros consumidores
```

No existe una oleada que obligue a actualizar conjuntamente SHELL, VISO, NEXO, FOGO, ORIGO, PULSO y NUMERA.

---

#### 2. Resultado material

Quedan definidos **22 lotes base reversibles**:

| Propietario de ejecución | Lotes por repositorio                         | Cantidad |
| ------------------------ | --------------------------------------------- | -------: |
| `SHELL-MIG-003`          | NEXO                                          |    **1** |
| `SHELL-MIG-004`          | SHELL                                         |    **1** |
| `SHELL-MIG-005`          | SHELL, NUMERA, FOGO, ORIGO, VISO, PULSO, NEXO |    **7** |
| `SHELL-MIG-008`          | NUMERA, FOGO, ORIGO, VISO, PULSO, NEXO        |    **6** |
| `SHELL-AUTH-005`         | SHELL, NUMERA, FOGO, ORIGO, VISO, PULSO, NEXO |    **7** |
| **Total**                |                                               |   **22** |

La distribución no crea un identificador paralelo. La identidad material de cada lote sigue siendo exactamente la clave:

```text
repositorio consumidor / tarea propietaria
```

Las **142 filas ejecutables** de `SHELL-MIG-001` conservan sin cambios su `Lote base`. Esta tarea añade el contrato de ejecución a las 22 claves distintas resultantes.

Los elementos internos de AppSwitcher y `GuardOptions.requireAppAccessPermission = false` conservan los lotes `SHELL-MIG-008` ya asignados. Las dos entradas de navegación SHELL cuyo propietario es `SHELL-APP-021` permanecen fuera de estos 22 lotes porque no pertenecen a una fila física del inventario ejecutable ni al mini-bloque de migración compartida.

---

#### 3. Fuentes, dependencias y corte verificable

##### 3.1. Dependencias vinculantes

| Fuente           | Decisión heredada                                                                                                                           |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `SHELL-MIG-001`  | 142 filas ejecutables, `Lote base` exacto por consumidor, 11 candidatos físicos sin consumidor y separación entre legacy consumido e inerte |
| `SHELL-PKG-004`  | compatibilidad atribuible a package, versión, consumidor, commit, manifest, lockfile, toolchain, ambiente y evidencia exactos               |
| `SHELL-PKG-006`  | rollback por snapshot de aplicación, independiente de los demás consumidores y sin inferir rollback de datos o Supabase                     |
| `SHELL-PKG-008`  | dieciséis gates fail-closed, evidencia vigente por commit y prohibición de auto-merge, auto-deploy y bypass                                 |
| `TREQ-SHELL-004` | retiro únicamente con búsqueda reproducible de consumidores y validaciones aplicables                                                       |
| `TREQ-SHELL-005` | comandos reproducibles para instalación, lint, typecheck, build o export y pruebas                                                          |
| `TREQ-SHELL-006` | pruebas propias y compatibilidad por consumidor sin despliegue simultáneo obligatorio                                                       |
| `TREQ-SHELL-007` | rollback independiente probado antes de release o cutover                                                                                   |
| `TREQ-SHELL-008` | declaración de requisitos y resultados reproducibles por package y cambio                                                                   |
| `TREQ-SHELL-009` | identidad verificable de repositorio, commit, ambiente y superficie                                                                         |
| `TREQ-SHELL-038` | migración y deprecación con inventario y evidencia atribuible                                                                               |
| `TREQ-SHELL-039` | retiro bloqueado hasta resolver consumidores, pruebas, compatibilidad y rollback                                                            |

##### 3.2. Corte remoto de los consumidores

| Repositorio                  | Commit de `main` verificado para esta tarea | Relación con el corte de `SHELL-MIG-001`                                                                                     |
| ---------------------------- | ------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| `devVentoGroup/vento-shell`  | `c5d53c7b6c643ed655bf4dfa6946794150a965d7`  | avanzó únicamente para incorporar documentalmente `SHELL-MIG-001`; el parent es el corte inspeccionado por la tarea anterior |
| `devVentoGroup/vento-viso`   | `47322403f3c64e83ae0c4a2f68c05d47093e5bb4`  | sin cambio                                                                                                                   |
| `devVentoGroup/vento-nexo`   | `142c4d696221e3ce3fda4ed3b62f3d1fe5b58799`  | sin cambio                                                                                                                   |
| `devVentoGroup/vento-fogo`   | `b6b9ed00e5267cabaac1a5a1090d93d5f60e86f2`  | sin cambio                                                                                                                   |
| `devVentoGroup/vento-origo`  | `b7a8303fa078ef087f522b6c99059ababfc27472`  | sin cambio                                                                                                                   |
| `devVentoGroup/vento-pulso`  | `71e0184486b5fe11e0a42435baf4024807a80efd`  | sin cambio                                                                                                                   |
| `devVentoGroup/vento-numera` | `1b48a5da425d92e19ed89cf175b1dccc4cd960e1`  | sin cambio                                                                                                                   |

No existe un delta de consumidor que obligue a invalidar el inventario aprobado.

##### 3.3. Estado técnico que bloquea ejecución física

En el corte actual:

- no existe una release estable adoptada de `@vento/contracts`, `@vento/os-context`, `@vento/supabase` o `@vento/ui-web`;
- las 28 relaciones package–consumidor de `SHELL-PKG-004` permanecen pendientes de evidencia;
- no existe un snapshot anterior de package compartido certificado que permita declarar una adopción `ROLLBACK_READY`;
- los siete `package.json` inspeccionados declaran `build` y `lint`, pero ninguno declara un script `typecheck` ni un script `test`;
- la fase canónica vigente es exclusivamente documental y prohíbe migraciones, cambios de código y modificaciones de Supabase.

Por tanto, los 22 lotes quedan **ESPECIFICADOS** y **NO EJECUTABLES EN ESTE CORTE**. Esto no impide cerrar documentalmente `SHELL-MIG-002`; impide presentar una definición como migración ya realizada.

---

#### 4. Invariantes de un lote reversible

Todo lote materializado por esta tarea conserva estas reglas:

1. Un lote afecta un solo repositorio consumidor.
2. Un lote no obliga a desplegar ningún otro consumidor.
3. Todo cambio de package usa versión exacta y conserva manifest y lockfile como unidad.
4. El commit base y el commit de propuesta forman parte de la evidencia.
5. Un cambio posterior al commit evaluado invalida pruebas y aprobaciones técnicas aplicables.
6. Todo package compartido aplicable debe tener release identificable, integridad y compatibilidad para el consumidor exacto.
7. Todo lote conserva un snapshot previo certificado antes de cualquier cutover.
8. El rollback se ejecuta por historia auditable del consumidor y no modificando manualmente dependencias instaladas.
9. Un rollback de package no revierte por inferencia datos, schema, migraciones, configuración remota, cachés ni secretos.
10. Todo impacto Supabase que requiera materialización se resuelve exclusivamente desde `vento-shell` y mediante su tarea propietaria.
11. Los candidatos inertes no se mezclan en el mismo cambio con una migración funcional.
12. Un archivo consumido no puede pasar al lote de retiro porque su sustituto esté planificado.
13. La aparición de un consumidor nuevo invalida la elegibilidad de retiro.
14. Una regresión de autorización, contexto, sesión o denegación cerrada detiene la expansión de la oleada.
15. Un lote fallido no produce despliegue compensatorio automático en los otros repositorios.
16. Cualquier dependencia simultánea entre dos consumidores que no haya sido demostrada como compatible bloquea el lote y exige resolver la dependencia antes de continuar.

---

#### 5. Orden canónico entre tareas y oleadas

La secuencia entre propietarios no se altera:

```text
SHELL-MIG-003
→ SHELL-MIG-004
→ SHELL-MIG-005
→ SHELL-MIG-006
→ SHELL-MIG-007
→ SHELL-MIG-008
→ continuidad posterior del BLOQUE H
→ SHELL-AUTH-005 cuando alcance su turno canónico
```

`SHELL-MIG-006` y `SHELL-MIG-007` no crean lotes de cambio nuevos: son puertas de accesibilidad, paridad y evidencia para los lotes de `SHELL-MIG-005`.

`SHELL-AUTH-005` ya es propietario de las filas de autorización, contexto y acceso compartido que `SHELL-MIG-001` le asignó. `SHELL-MIG-002` define esos siete lotes ahora, pero no adelanta ni desarrolla `SHELL-AUTH-005`.

---

#### 6. Orden serial de repositorios

Cuando una tarea propietaria deba materializar el mismo tipo de adopción en más de un repositorio, se utiliza esta secuencia:

**Secuencia:** SHELL → NUMERA → FOGO → ORIGO → VISO → PULSO → NEXO.

| Orden | Repositorio                  | Base verificable del orden                                                                                                          |
| ----: | ---------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| **1** | `devVentoGroup/vento-shell`  | repositorio productor de la fundación y menor superficie runtime del inventario: 5 familias, 1 consumidor directo y 1 script/manual |
| **2** | `devVentoGroup/vento-numera` | menor superficie externa: 19 familias, 0 consumidores directos de autorización y 0 consumidores CI/script                           |
| **3** | `devVentoGroup/vento-fogo`   | 20 familias, 0 consumidores directos de autorización y 0 consumidores CI/script                                                     |
| **4** | `devVentoGroup/vento-origo`  | 20 familias y 4 consumidores directos de autorización                                                                               |
| **5** | `devVentoGroup/vento-viso`   | 21 familias y 4 consumidores directos de autorización                                                                               |
| **6** | `devVentoGroup/vento-pulso`  | 20 familias, 2 consumidores directos y excepciones heredadas de cliente Supabase alterno y rama de guard                            |
| **7** | `devVentoGroup/vento-nexo`   | 23 familias, 2 consumidores CI/script y excepción local de contexto operativo                                                       |

Reglas de aplicación:

- el orden solo se usa entre repositorios alcanzados por la misma tarea propietaria;
- un repositorio no aplicable se omite sin alterar la identidad de los demás lotes;
- no se inician dos despliegues de consumidor en paralelo;
- el siguiente consumidor no avanza mientras el anterior permanezca en observación, rollback o investigación de un gate;
- SHELL sirve como verificación del productor y su superficie local; NUMERA es el primer piloto externo completo cuando el lote aplique;
- NEXO queda al final de las oleadas multi-repositorio por sus consumidores CI/script y su extensión local adicional, no por una prioridad empresarial.

---

#### 7. Contrato común de entrada y cierre

Cada una de las 22 instancias de lote hereda obligatoriamente estas precondiciones antes de cualquier cambio físico:

1. tarea propietaria del lote aprobada y en fase autorizada para materialización;
2. commit base del consumidor revalidado contra el inventario de `SHELL-MIG-001`;
3. cero delta no clasificado en los archivos consumidores del lote;
4. release exacta del package objetivo disponible cuando el lote migra a package compartido;
5. identidad, integridad y procedencia de la release verificadas;
6. relación package–consumidor evaluable en la matriz de compatibilidad;
7. manifest y lockfile base conservados;
8. instalación reproducible disponible;
9. lint, typecheck, build o export y pruebas automatizadas aplicables ejecutables;
10. perfil especializado de `SHELL-PKG-008` aplicable definido;
11. requisitos `TREQ-*` afectados declarados;
12. snapshot previo certificado y restaurable;
13. impacto de datos, configuración, caché y Supabase explícitamente clasificado;
14. revisores y autoridad de despliegue del consumidor identificados;
15. cero cambios ajenos mezclados en el mismo lote.

Un lote solo puede considerarse cerrado cuando:

- todos los gates universales aplicables están en `PASS`;
- el gate de riesgo está en `PASS` o en no aplicabilidad justificada;
- la evidencia corresponde al commit, manifest, lockfile y versiones exactas;
- las pruebas específicas del lote son correctas;
- la observación posterior al despliegue no presenta regresión bloqueante;
- el rollback sigue siendo reproducible;
- no existe un consumidor legacy nuevo o no clasificado;
- el resultado queda atribuible al repositorio y lote exactos.

---

#### 8. Lote de compatibilidad CI/script de NEXO

| Campo                          | Decisión materializada                                                                                                                                                                                    |
| ------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Lote base**                  | `devVentoGroup/vento-nexo / SHELL-MIG-003`                                                                                                                                                                |
| **Consumidores**               | `.github/workflows/tmp-apply-privileged-request-area.yml`; `scripts/tmp-apply-privileged-request-area.mjs`                                                                                                |
| **Precondiciones específicas** | commit NEXO revalidado; forma contractual objetivo de autorización/contexto aprobada; targets del patch identificados; gate contra nuevo consumo legacy disponible                                        |
| **Cambios permitidos**         | adaptar o retirar únicamente la dependencia del workflow/script respecto de la forma legacy; impedir que vuelva a crear consumidores legacy; conservar el comportamiento empresarial de los targets       |
| **Pruebas**                    | gates `PKG-GATE-003..014` aplicables; ejecución reproducible del patch; build y validación de targets; evidencia de que el script no introduce una forma legacy nueva                                     |
| **Observabilidad**             | resultado del workflow, identidad del commit, archivos objetivo modificados, errores del patch y build atribuibles al mismo intento                                                                       |
| **Rollback**                   | restaurar workflow, script y targets al snapshot NEXO previo certificado; no tocar otros consumidores                                                                                                     |
| **Suspensión**                 | target no coincide, patch deja de ser determinista, build falla, aparece ampliación de autoridad, el workflow intenta modificar una forma contractual no aprobada o el snapshot previo deja de ser seguro |
| **Estado actual**              | ESPECIFICADO; BLOQUEADO PARA EJECUCIÓN por fase documental y por no estar desarrollada/aprobada `SHELL-MIG-003`                                                                                           |

---

#### 9. Lote de scaffold de SHELL

| Campo                          | Decisión materializada                                                                                                                                                                                        |
| ------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Lote base**                  | `devVentoGroup/vento-shell / SHELL-MIG-004`                                                                                                                                                                   |
| **Consumidor**                 | `tools/bootstrap-app-shell.ps1` y la plantilla histórica `templates/app-shell-standard` como fuente de scaffold                                                                                               |
| **Precondiciones específicas** | contratos, packages y AppShell requeridos aprobados; versiones exactas disponibles; procedencia del scaffold definida; bootstrap legacy conservado como recuperación controlada hasta certificar el sustituto |
| **Cambios permitidos**         | reemplazar la copia de implementación runtime por un scaffold versionado que instale o genere únicamente dependencias y configuración aprobadas                                                               |
| **Pruebas**                    | generación reproducible; identidad de versiones; ausencia de fuente runtime duplicada; build de un consumidor de prueba autorizado; comparación de configuración y archivos generados                         |
| **Observabilidad**             | versión del scaffold, versions de packages resueltas, commit fuente, conjunto de archivos generados y diferencias respecto del baseline                                                                       |
| **Rollback**                   | restaurar bootstrap y plantilla legacy controlados al snapshot previo certificado sin presentar esa restauración como distribución canónica                                                                   |
| **Suspensión**                 | el scaffold vuelve a copiar implementación runtime, usa versiones no fijadas, genera archivos fuera del contrato, no reproduce configuración o requiere package sin release/evidencia compatible              |
| **Estado actual**              | ESPECIFICADO; BLOQUEADO PARA EJECUCIÓN por fase documental y por precondiciones de package/scaffold aún no materializadas                                                                                     |

---

#### 10. Lotes de adopción UI — `SHELL-MIG-005`

La membresía de cada fila es exacta: pertenecen al lote todas y solo las filas de `SHELL-MIG-001` cuyo `Lote base` coincide con la clave indicada.

| Orden de oleada | Lote base                                    | Consumidores                                       | Precondiciones específicas                                                                                                                            | Cambios permitidos                                                                                 | Pruebas y observabilidad                                                                                                    | Rollback                                                | Suspensión específica                                                                       |
| --------------: | -------------------------------------------- | -------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
|               1 | `devVentoGroup/vento-shell / SHELL-MIG-005`  | todas las filas UI de SHELL asignadas a esta clave | release canónica de `@vento/ui-web`; combinación compatible; snapshot SHELL previo certificado; `layout.tsx` y `globals.css` confirmados como locales | adoptar superficies aprobadas conservando composición y estilos locales propietarios               | perfil `GATE-PROFILE-UI-WEB`; render, navegación, CSS, accesibilidad e hidratación cuando aplique; commit y versión exactos | restaurar archivos locales y pin/configuración previa   | pérdida de layout, navegación, identidad visual, accesibilidad o dependencia no pública     |
|               2 | `devVentoGroup/vento-numera / SHELL-MIG-005` | todas las filas NUMERA asignadas a esta clave      | release UI elegible; combinación NUMERA compatible; extensiones locales inventariadas; snapshot previo certificado                                    | sustituir copias UI consumidas por APIs públicas aprobadas; conservar extensiones locales          | perfil UI, build, render, navegación, CSS, accesibilidad y regresión visual aplicable                                       | restaurar copias locales consumidas y versiones previas | cualquier diferencia funcional o visual no aprobada                                         |
|               3 | `devVentoGroup/vento-fogo / SHELL-MIG-005`   | todas las filas FOGO asignadas a esta clave        | release UI elegible; combinación FOGO compatible; candidatos inertes excluidos del cambio; snapshot previo certificado                                | adoptar UI compartida sin retirar candidatos inertes                                               | perfil UI y evidencia por commit FOGO                                                                                       | restaurar snapshot FOGO previo                          | consumidor oculto, paridad incompleta o gate no `PASS`                                      |
|               4 | `devVentoGroup/vento-origo / SHELL-MIG-005`  | todas las filas ORIGO asignadas a esta clave       | release UI elegible; combinación ORIGO compatible; extensiones empresariales identificadas; snapshot previo certificado                               | adopción UI conservando extensiones empresariales ORIGO locales                                    | perfil UI; navegación, render, CSS, accesibilidad y regresión aplicables                                                    | restaurar snapshot ORIGO previo                         | ruptura de extensión local o del contrato público                                           |
|               5 | `devVentoGroup/vento-viso / SHELL-MIG-005`   | todas las filas VISO asignadas a esta clave        | release UI elegible; combinación VISO compatible; composición de dominio identificada; snapshot previo certificado                                    | adopción UI preservando componentes y composición de dominio VISO                                  | perfil UI; build, render, rutas, CSS, accesibilidad y evidencia visual aplicable                                            | restaurar snapshot VISO previo                          | regresión visual/funcional, import interno o estilo global no declarado                     |
|               6 | `devVentoGroup/vento-pulso / SHELL-MIG-005`  | todas las filas PULSO asignadas a esta clave       | release UI elegible; combinación PULSO compatible; variante Supabase y rama de guard excluidas del lote; snapshot previo certificado                  | adopción UI sin mezclar retiro del cliente Supabase alterno ni cambios de autorización             | perfil UI; navegación, hidratación, CSS, accesibilidad y regresión                                                          | restaurar snapshot PULSO previo                         | mezcla de cambios de datos/auth, regresión UI o dependencia en artefacto reservado a retiro |
|               7 | `devVentoGroup/vento-nexo / SHELL-MIG-005`   | todas las filas NEXO asignadas a esta clave        | release UI elegible; combinación NEXO compatible; extensión local de contexto identificada; lote CI/script no mezclado; snapshot previo certificado   | adopción UI preservando composición empresarial y extensión local de contexto fuera del package UI | perfil UI; build, render, navegación, CSS, accesibilidad, regresión y trazabilidad de extensiones locales                   | restaurar snapshot NEXO previo                          | acoplamiento del package a NEXO, pérdida de extensión local o regresión de navegación       |

Para los siete lotes:

- `SHELL-MIG-006` debe demostrar accesibilidad, tema, movimiento reducido, densidad y responsive aplicables;
- `SHELL-MIG-007` debe demostrar paridad contractual y operativa atribuible;
- ningún retiro de copia consumida ocurre dentro de `SHELL-MIG-005` si la paridad y el rollback no están certificados.

---

#### 11. Lotes de retiro inerte — `SHELL-MIG-008`

Estos lotes están deliberadamente separados de la adopción funcional. La ausencia de sustituto solo es válida cuando se confirma **cero consumo**.

| Orden de oleada | Lote base                                    | Identidades candidatas                                                                                                                          | Precondiciones específicas                                                                                                | Pruebas y observabilidad                                                                             | Rollback                                                | Suspensión específica                                                                                |
| --------------: | -------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- | ------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- |
|               1 | `devVentoGroup/vento-numera / SHELL-MIG-008` | `src/lib/auth/sso.ts`; `src/lib/supabase/employee-sites.ts`; miembros inertes de AppSwitcher ya clasificados                                    | revalidar cero consumo STATIC, DYNAMIC, FRAMEWORK, CI y SCRIPT; paridad UI previa cuando afecte miembros AppSwitcher      | búsquedas reproducibles, typecheck, lint, build, pruebas aplicables y ausencia de import/uso runtime | restaurar blobs y miembros desde snapshot NUMERA previo | aparece cualquier consumidor, falla build o el miembro conserva función observable                   |
|               2 | `devVentoGroup/vento-fogo / SHELL-MIG-008`   | `src/lib/auth/sso.ts`; `src/lib/supabase/employee-sites.ts`; miembros inertes de AppSwitcher                                                    | mismas precondiciones de cero consumo                                                                                     | mismas clases de evidencia sobre commit FOGO                                                         | restaurar snapshot FOGO previo                          | nuevo consumidor o regresión atribuible                                                              |
|               3 | `devVentoGroup/vento-origo / SHELL-MIG-008`  | `src/lib/auth/sso.ts`; miembros inertes de AppSwitcher                                                                                          | cero consumo y conservación del `employee-sites` consumido fuera del lote                                                 | búsqueda de consumo, build y pruebas; verificación explícita de que `employee-sites` no se retira    | restaurar snapshot ORIGO previo                         | el cambio toca `employee-sites` consumido o aparece consumidor del SSO                               |
|               4 | `devVentoGroup/vento-viso / SHELL-MIG-008`   | `src/lib/supabase/proxy.ts`; `src/lib/auth/sso.ts`; miembros inertes de AppSwitcher                                                             | cero consumo en cinco clases y UI migrada cuando el retiro interno dependa de ella                                        | búsqueda, build, typecheck, lint, pruebas y render aplicable                                         | restaurar snapshot VISO previo                          | consumo indirecto, fallo de build o regresión de AppSwitcher                                         |
|               5 | `devVentoGroup/vento-pulso / SHELL-MIG-008`  | `src/lib/supabase/proxy.ts`; `src/utils/supabase/client.ts`; `GuardOptions.requireAppAccessPermission = false`; miembros inertes de AppSwitcher | cero consumo de archivos y rama `false`; si la rama sigue consumida, no se retira y conserva propietario `SHELL-AUTH-005` | búsqueda de consumo, pruebas de guard, build, typecheck, lint y comportamiento de AppSwitcher        | restaurar archivos, rama y miembros previos             | cualquier consumo real, cambio de autoridad, dependencia de la variante Supabase o falta de rollback |
|               6 | `devVentoGroup/vento-nexo / SHELL-MIG-008`   | `src/lib/supabase/proxy.ts`; `src/components/vento/standard/page-header.tsx`; miembros inertes de AppSwitcher                                   | cero consumo en cinco clases; cierre previo de la migración/paridad UI aplicable                                          | búsquedas, build, typecheck, lint, pruebas, render y navegación aplicables                           | restaurar snapshot NEXO previo                          | aparece consumidor, la cabecera sigue siendo necesaria o se cruza con el patch CI/script pendiente   |

**Candidatos físicos conciliados:** 11 archivos.
**Archivos consumidos autorizados para retiro por simple pertenencia a este lote:** 0.

Un candidato que deje de cumplir cero consumo sale del conjunto ejecutable de retiro y vuelve a estado bloqueado; no se elimina para preservar el conteo.

---

#### 12. Lotes de autorización, contexto y acceso compartido — `SHELL-AUTH-005`

Estos siete lotes quedan definidos por `SHELL-MIG-002`, pero su materialización permanece reservada a `SHELL-AUTH-005` cuando alcance su turno canónico.

La membresía es exacta: pertenecen a cada lote todas y solo las filas de `SHELL-MIG-001` cuyo `Lote base` coincide con la clave indicada, incluidos los once consumidores directos de autorización.

| Orden de oleada | Lote base                                     | Consumidores                                                                             | Precondiciones específicas                                                                                                                                       | Cambio permitido                                                                                                     | Pruebas y observabilidad                                                                                                 | Rollback                                                       | Suspensión específica                                                                                                        |
| --------------: | --------------------------------------------- | ---------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
|               1 | `devVentoGroup/vento-shell / SHELL-AUTH-005`  | todas las filas SHELL de esta clave, incluido 1 consumidor directo del launcher          | `SHELL-AUTH-005` habilitada por continuidad; releases exactas elegibles; compatibilidad SHELL; snapshot previo certificado                                       | migrar factories Supabase y consumidor directo del launcher a contratos/SDK aprobados, preservando fronteras locales | perfiles `OS-CONTEXT`, `SUPABASE` y `CONTRACTS`; sesión, cookies, decisiones, razones y errores                          | restaurar helpers/factories/evaluadores locales y pins previos | ampliación de autoridad, error de sesión/cookies, incompatibilidad de schema o snapshot inseguro                             |
|               2 | `devVentoGroup/vento-numera / SHELL-AUTH-005` | todas las filas NUMERA de esta clave; 0 consumidores directos adicionales                | releases elegibles; compatibilidad NUMERA; middleware local preservado; snapshot previo certificado                                                              | migrar legacy consumido de autorización/contexto/datos; conservar middleware local                                   | perfiles aplicables, decisiones permitidas/denegadas, SSR, Supabase, build y evidencia                                   | snapshot NUMERA previo completo                                | diferencia de decisión, redirect, contexto o acceso a datos                                                                  |
|               3 | `devVentoGroup/vento-fogo / SHELL-AUTH-005`   | todas las filas FOGO de esta clave; 0 consumidores directos adicionales                  | releases elegibles; compatibilidad FOGO; retiros inertes previos no reintroducidos; snapshot previo certificado                                                  | migrar legacy consumido sin restaurar archivos retirados por cero consumo                                            | perfiles aplicables y paridad de autorización/datos                                                                      | snapshot FOGO previo                                           | fallback que amplíe autoridad o dependencia en legacy retirado                                                               |
|               4 | `devVentoGroup/vento-origo / SHELL-AUTH-005`  | todas las filas ORIGO de esta clave, incluidos 4 consumidores directos                   | releases elegibles; compatibilidad ORIGO; cuatro consumidores directos identificados; extensión empresarial local preservada; snapshot previo certificado        | migrar legacy y los cuatro consumidores directos; mantener extensión empresarial local                               | perfiles aplicables, cuatro consumidores directos, sesión/contexto/Supabase                                              | snapshot ORIGO previo                                          | cualquier consumidor directo queda fuera, decisión diverge o extensión local se pierde                                       |
|               5 | `devVentoGroup/vento-viso / SHELL-AUTH-005`   | todas las filas VISO de esta clave, incluidos 4 consumidores directos en rutas framework | releases elegibles; compatibilidad VISO; cuatro rutas/consumidores directos revalidados; snapshot previo certificado                                             | migrar legacy y cuatro consumidores directos de autorización, incluidas rutas framework                              | perfiles aplicables; rutas server protegidas; misma decisión y razones por actor/contexto                                | snapshot VISO previo                                           | ruta pierde autorización de servidor, aparece bypass o consumidor directo no migrado                                         |
|               6 | `devVentoGroup/vento-pulso / SHELL-AUTH-005`  | todas las filas PULSO de esta clave, incluidos 2 consumidores directos                   | releases elegibles; compatibilidad PULSO; excepciones de guard y cliente alterno clasificadas; snapshot previo certificado                                       | migrar legacy consumido y dos consumidores directos; resolver solo excepciones autorizadas por su propietario        | perfiles aplicables; guard, contexto, datos, dos consumidores directos y ausencia de cliente alterno no autorizado       | snapshot PULSO previo                                          | rama de guard amplía acceso, reaparece cliente alterno o se requiere cambio Supabase no materializado                        |
|               7 | `devVentoGroup/vento-nexo / SHELL-AUTH-005`   | todas las filas NEXO de esta clave; 0 consumidores directos adicionales                  | releases elegibles; compatibilidad NEXO; `operational-context` preservado como extensión local; lote CI/script cerrado o compatible; snapshot previo certificado | migrar legacy consumido preservando `operational-context` como extensión local explícita                             | perfiles aplicables; sesión/contexto, autorización, Supabase y compatibilidad con extensión local; CI/script conciliados | snapshot NEXO previo                                           | la extensión local queda absorbida indebidamente, el patch CI/script vuelve a depender de legacy o cambia autoridad efectiva |

Reglas adicionales:

- `middleware.ts` permanece local cuando así lo clasificó `SHELL-MIG-001`;
- `operational-context` de NEXO permanece local y consume la fundación en vez de convertirse automáticamente en API compartida;
- una actualización de `@vento/supabase` no autoriza cambios de schema, datos, RLS, RPC, Realtime, Storage, Edge Functions, secretos o configuración;
- cualquier cambio Supabase físico se materializa únicamente desde `vento-shell` mediante su tarea propietaria.

---

#### 13. Separación entre legacy consumido e inerte

La división es vinculante:

| Clase                                           | Tratamiento                                                                                                    |
| ----------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `legacy consumido`                              | permanece hasta que su lote de migración tenga sustituto aprobado, compatibilidad, paridad, pruebas y rollback |
| `KEEP LOCAL`                                    | permanece en el repositorio y se adapta a la fundación compartida sin perder propiedad local                   |
| `GENERAR`                                       | se sustituye únicamente por artefacto determinista aprobado; no por copia manual                               |
| `sin consumidor confirmado`                     | puede entrar en `SHELL-MIG-008` únicamente después de revalidar cero consumo                                   |
| miembro interno inerte                          | puede retirarse solo si cero lecturas/consumidores y comportamiento equivalente están demostrados              |
| navegación SHELL propietaria de `SHELL-APP-021` | queda fuera de `SHELL-MIG-002`; conserva su propietario exacto                                                 |

No se permite convertir un `MIGRATE` en `RETIRE` para simplificar un lote.

---

#### 14. Pruebas obligatorias por clase de lote

Todos los lotes usan los gates de `SHELL-PKG-008` que correspondan. La siguiente tabla especializa la evidencia sin crear un sistema paralelo:

| Clase de lote            | Pruebas mínimas                                                                                                                                                                       |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| compatibilidad CI/script | identidad del target, ejecución reproducible, no creación de nuevo legacy, build y validación de archivos objetivo                                                                    |
| scaffold                 | procedencia, versiones exactas, generación reproducible, ausencia de fuente runtime copiada, build del resultado autorizado                                                           |
| UI                       | package tests, lint/análisis estático, typecheck, build, pruebas automatizadas, compatibilidad, render, hidratación, navegación, CSS, accesibilidad y regresión visual cuando aplique |
| autorización/contexto    | package tests, lint, typecheck, build, integración, casos allow/deny, SSR/cookies/redirects, razones estructuradas y denegación cerrada                                               |
| Supabase SDK             | factories, tipos, wrappers, parámetros/resultados/errores, compatibilidad con schema/tipos y ausencia de bypass de RLS o privilegio                                                   |
| retiro                   | búsqueda STATIC/DYNAMIC/FRAMEWORK/CI/SCRIPT, typecheck, lint, build, pruebas aplicables y comprobación de cero comportamiento perdido                                                 |

Un resultado omitido, cancelado, vencido, intermitente, ligado a otro commit o no ejecutado no cierra el lote.

---

#### 15. Observabilidad obligatoria

La observabilidad de cada lote registra, como mínimo:

- repositorio y commit base;
- commit de propuesta o cambio;
- package y versión exacta cuando aplique;
- hash/identidad del manifest y lockfile;
- conjunto de packages resuelto;
- resultado individual de gates;
- evidencia de compatibilidad;
- eventos o errores de build/runtime relevantes al lote;
- resultado de smoke o prueba operativa aplicable;
- estado de rollback;
- inicio y final de la ventana de observación definida por el paquete de implementación propietario;
- causa y propietario de cualquier suspensión.

Por clase:

- UI observa render, navegación, hidratación, CSS, foco/accesibilidad y errores del cliente/servidor aplicables;
- autorización/contexto observa decisiones, razones, redirects, sesión y denegaciones sin registrar secretos ni datos sensibles;
- Supabase observa errores normalizados, contratos de cliente/RPC y compatibilidad de schema, sin convertir telemetría en autorización;
- retiro observa ausencia sostenida de referencias y fallos atribuibles a la eliminación;
- CI/script observa ejecución, targets y resultado completo del patch;
- scaffold observa procedencia, versiones y diff del resultado generado.

No se inventan umbrales numéricos globales. Los umbrales operativos pertenecen al paquete E5 o al proceso de despliegue propietario.

---

#### 16. Rollback de los lotes

Todo lote adopta el snapshot de aplicación definido por `SHELL-PKG-006`:

```text
commit consumidor
+ manifest
+ lockfile
+ versiones exactas de packages
+ configuración compatible identificada
+ artefacto desplegado
+ evidencia de compatibilidad
```

Reglas:

1. El snapshot previo debe existir y estar certificado antes del cutover.
2. El rollback restaura código, manifest y lockfile coherentes.
3. Los packages publicados no se mutan ni se sobrescriben.
4. Si varias familias `@vento/*` forman un conjunto cerrado de dependencias, retroceden juntas dentro del mismo consumidor.
5. Otro consumidor no se despliega ni retrocede por inferencia.
6. Datos y migraciones usan un plan propietario separado.
7. Si el schema, servicio o contrato vigente ya no acepta el snapshot previo, el rollback queda bloqueado y se exige corrección hacia adelante o transición coordinada.
8. Una versión previa con vulnerabilidad o bypass conocido no es objetivo válido.
9. Después de restaurar se repiten las validaciones aplicables antes de declarar el rollback cerrado.
10. Un fallo previo al despliegue se aborta o revierte; no se registra como rollback productivo.

---

#### 17. Criterios de suspensión y detención de expansión

Cualquier lote se suspende cuando ocurra al menos una de estas condiciones:

- un gate universal no está en `PASS`;
- evidencia `STALE`, incompleta, contradictoria o intermitente;
- cambia el commit base, manifest, lockfile, package, versión o matriz después de probar;
- aparece un consumidor no inventariado;
- se detecta import interno, copia manual o dependencia legacy nueva;
- una decisión de autorización se amplía o diverge;
- la denegación cerrada deja de cumplirse;
- una ruta, sesión, cookie, redirect, contrato, RPC, UI o comportamiento de dominio pierde paridad;
- un cambio requiere schema, datos o configuración Supabase no materializados desde `vento-shell`;
- el snapshot previo no es reproducible o seguro;
- el rollback falla;
- el lote mezcla cambios ajenos que impiden atribuir riesgo y evidencia;
- se descubre necesidad de despliegue simultáneo de dos consumidores no cubierta por compatibilidad aprobada;
- el consumidor anterior de la oleada sigue bajo observación o incidente.

Al suspender:

1. no avanza el siguiente repositorio de la misma oleada;
2. los consumidores no afectados permanecen en su snapshot actual;
3. se conserva toda evidencia fallida;
4. se ejecuta rollback solo si el snapshot previo sigue siendo seguro;
5. si el rollback no es viable, el lote queda bloqueado para corrección hacia adelante bajo su propietario exacto.

---

#### 18. Estado de preparación de los 22 lotes

| Condición                                                            | Estado actual                                       | Propietario de salida                                       |
| -------------------------------------------------------------------- | --------------------------------------------------- | ----------------------------------------------------------- |
| fase física autorizada                                               | no                                                  | continuidad canónica posterior; tarea propietaria aplicable |
| releases estables compartidas adoptables                             | no confirmadas                                      | `SHELL-CI-001..003` y propietarios de packages              |
| matriz ejecutada de compatibilidad                                   | 28 relaciones pendientes de evidencia               | `SHELL-CI-002`; `SHELL-CI-005`                              |
| gates ejecutables de actualización                                   | política definida; implementación posterior         | `SHELL-CI-001..006`                                         |
| scripts reproducibles `typecheck` y `test` declarados por consumidor | no declarados en los siete manifests inspeccionados | `SHELL-CI-016`; `SHELL-CI-018`; `SHELL-CI-019`              |
| snapshot previo de package compartido certificado                    | no existe adopción estable previa                   | `SHELL-CI-014`; `SHELL-CI-015`                              |
| bloqueo de nuevos consumidores legacy                                | reservado                                           | `SHELL-MIG-003`                                             |
| retiro de candidatos inertes                                         | no ejecutado                                        | `SHELL-MIG-008`                                             |
| adopción auth/context/data                                           | no ejecutada                                        | `SHELL-AUTH-005`                                            |

Todos los bloqueos tienen propietario y condición de salida. Ninguno modifica la definición documental de los lotes.

---

#### 19. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

**Justificación:** `SHELL-MIG-002` no introduce una obligación verificable nueva. Materializa, por repositorio y lote, obligaciones vigentes ya registradas para retiro seguro, comandos reproducibles, compatibilidad por consumidor, rollback independiente, evidencia atribuible, deprecación y retiro. No altera su contenido, alcance, responsable, estado, relación ni evidencia.

| Operación sobre el registro de pruebas | Cantidad |
| -------------------------------------- | -------: |
| creados                                |    **0** |
| modificados                            |    **0** |
| diferidos                              |    **0** |
| descartados                            |    **0** |
| obsoletos                              |    **0** |

No se modifica ningún fragmento del registro canónico de requisitos de prueba.

---

#### 20. Evidencia de validación

| Clase       | Estado           | Evidencia de esta tarea                                                                                                                                                         |
| ----------- | ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `BUILD`     | `NOT_EXECUTED`   | no se ejecutó build del repositorio ni de consumidores; la tarea es documental y no existe checkout integrado autorizado en esta entrega                                        |
| `LOCAL`     | `PASS`           | artefacto de tarea comprobado estructuralmente contra metadata, secciones obligatorias, continuidad, cardinalidad de 22 lotes y ausencia de instrucciones operativas de entrega |
| `REMOTA`    | `PASS`           | continuidad, propietario, dependencias, 04A, políticas, manifests y commits `main` de los siete repositorios fueron inspeccionados en GitHub                                    |
| `OPERATIVA` | `NOT_APPLICABLE` | no se ejecuta migración, despliegue, smoke productivo ni rollback durante la fase documental                                                                                    |
| `FÍSICA`    | `NOT_APPLICABLE` | la tarea es exclusivamente documental y no requiere validación de hardware, dispositivo ni intervención física                                                                  |

---

#### 21. Criterios de aceptación

`SHELL-MIG-002` queda materialmente completa cuando se cumple todo lo siguiente:

- conserva las 142 filas de `SHELL-MIG-001` y sus `Lote base`;
- materializa exactamente 22 claves de lote distintas dentro del alcance compartido;
- define un solo repositorio por lote;
- define orden de repositorios para toda tarea multi-consumidor;
- conserva `SHELL-MIG-003`, `004`, `005`, `008` y `SHELL-AUTH-005` como propietarios ya asignados;
- no adelanta el desarrollo de esos propietarios;
- separa los 11 archivos sin consumidor confirmado del legacy consumido;
- conserva fuera del catálogo MIG las dos entradas de navegación propietarias de `SHELL-APP-021`;
- declara precondiciones, cambios, consumidores, pruebas, observabilidad, rollback y suspensión para cada lote;
- exige manifest y lockfile coherentes;
- exige compatibilidad por combinación exacta;
- exige gates fail-closed;
- exige snapshot previo certificado;
- impide despliegue simultáneo obligatorio de consumidores;
- detiene expansión cuando un lote falla o sigue en observación;
- impide retirar un artefacto consumido por tratarlo como inerte;
- preserva extensiones locales válidas;
- separa `@vento/supabase` del estado físico de Supabase;
- identifica los bloqueos actuales y su tarea de salida;
- declara cero cambios `TREQ-*`;
- no ejecuta código, migraciones, despliegues, retiros, publicación de packages ni cambios Supabase.

---

#### 22. Límites y fuera de alcance

`SHELL-MIG-002` no:

- implementa adapters ni gates de nuevo legacy;
- sustituye físicamente la plantilla;
- modifica componentes, imports, manifests o lockfiles;
- publica packages, tags o releases;
- abre pull requests de consumidor;
- ejecuta pruebas de compatibilidad;
- ejecuta despliegues;
- retira archivos o miembros;
- modifica código de autorización, contexto o Supabase;
- crea migraciones o modifica datos;
- configura CI, secretos o protección de ramas;
- desarrolla `SHELL-MIG-003` ni ninguna tarea posterior;
- modifica `active-sequence.json`;
- modifica el registro `04A`.

Los umbrales operativos, ambientes concretos de despliegue y ventanas temporales pertenecen a los paquetes E5 y tareas de implementación propietarias; no se inventan en esta definición.

---

#### 23. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-MIG-001 — Consolidar inventario ejecutable de consumidores`

**TAREA ACTUAL APROBADA**
`SHELL-MIG-002 — Definir lotes reversibles por repositorio`

**SIGUIENTE TAREA RESERVADA**
`SHELL-MIG-003 — Preparar compatibilidad y bloqueo de nuevos consumidores legacy`


### [ ] SHELL-MIG-003 — Preparar compatibilidad y bloqueo de nuevos consumidores legacy

**Propósito:** habilitar adapters o compatibilidad temporal solo donde exista consumo real y evitar nuevas dependencias sobre copias deprecadas.

**Dependencias:** `SHELL-MIG-002`; `SHELL-PKG-003`; `SHELL-PKG-005`; tareas `SHELL-CON-*`, `SHELL-DB-*`, `SHELL-UI-*` o `SHELL-AUTH-*` propietarias.

**Puerta de cierre:** compatibilidad versionada, deprecaciones observables y gate automático contra nuevos consumidores legacy.

### [ ] SHELL-MIG-004 — Sustituir la plantilla histórica por scaffold versionado

**Propósito:** impedir que la plantilla AppShell vuelva a copiar implementaciones desfasadas y hacer que instale o genere dependencias aprobadas.

**Dependencias:** `SHELL-MIG-003`; `SHELL-PKG-001`; `SHELL-PKG-003`; `SHELL-PKG-004`; `SHELL-UI-010`.

**Puerta de cierre:** scaffold reproducible, sin fuente runtime duplicada, con versiones fijadas, configuración explícita y rollback documentado.

### [ ] SHELL-MIG-005 — Migrar componentes, Chrome y estilos por aplicación

**Propósito:** adoptar componentes compartidos preservando navegación, responsividad, tema y extensiones empresariales legítimas de cada consumidor.

**Dependencias:** `SHELL-MIG-003`; `SHELL-UI-001`; `SHELL-UI-010`; `SHELL-UI-011`; contratos requeridos aprobados.

**Puerta de cierre:** cada aplicación usa APIs compartidas aprobadas, mantiene locales únicamente sus extensiones declaradas y conserva rollback por repositorio.

### [ ] SHELL-MIG-006 — Verificar accesibilidad, tema y movimiento reducido

**Propósito:** demostrar que la migración conserva tokens, contraste, foco, teclado, motion-reduction, densidad y comportamiento responsive aplicables.

**Dependencias:** `SHELL-MIG-005`; `SHELL-PKG-006`; `SHELL-PKG-008`.

**Puerta de cierre:** matriz de accesibilidad y paridad visual aprobada por aplicación, sin depender de CSS legacy no declarado.

### [ ] SHELL-MIG-007 — Ejecutar pruebas de paridad de consumidores

**Propósito:** comparar API TypeScript, comportamiento, rutas, clases, estados y fallos antes y después de cada lote.

**Dependencias:** `SHELL-MIG-005`; `SHELL-MIG-006`; `SHELL-CI-001`; `SHELL-CI-007` a `SHELL-CI-013`.

**Puerta de cierre:** pruebas contractuales y operativas aprobadas, evidencia atribuible al commit y paquete de cambio, y rollback ensayado.

### [ ] SHELL-MIG-008 — Retirar copias legacy y certificar adopción

**Propósito:** retirar únicamente artefactos aprobados cuyo consumo sea cero o cuyos consumidores ya hayan migrado con paridad demostrada.

**Dependencias:** `SHELL-MIG-007`; `SHELL-PKG-007`; `SHELL-PKG-008`; decisiones de `SHELL-AUD-011`.

**Puerta de cierre:** cero consumidores legacy no autorizados, artefactos retirados registrados, builds aprobados y rollback reproducible por repositorio.
