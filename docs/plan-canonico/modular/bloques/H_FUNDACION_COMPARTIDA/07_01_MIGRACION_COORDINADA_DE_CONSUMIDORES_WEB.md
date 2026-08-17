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


### ✅ SHELL-MIG-003 — Preparar compatibilidad y bloqueo de nuevos consumidores legacy

**Estado:** APROBADA
**Tarea anterior:** SHELL-MIG-002 — Definir lotes reversibles por repositorio
**Tarea siguiente:** SHELL-MIG-004 — Sustituir la plantilla histórica por scaffold versionado
**Tipo de tarea:** Documental; definición vinculante y materializada de compatibilidad temporal, observabilidad de deprecación y gate fail-closed contra nuevos consumidores legacy, sin implementar adapters, packages, workflows ni migraciones físicas
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/07_01_MIGRACION_COORDINADA_DE_CONSUMIDORES_WEB.md`
**Estado físico resultante:** ESPECIFICADO_NO_MATERIALIZADO; 1 lote NEXO de compatibilidad legacy delimitado; 2 artefactos legacy reales congelados como baseline; 0 adapters físicos; 0 gates físicos; 0 migraciones ejecutadas
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`SHELL-MIG-003` convierte la compatibilidad temporal de legacy en una excepción controlada y no en una licencia para seguir copiando implementaciones antiguas.

La tarea toma el inventario ejecutable de `SHELL-MIG-001` y el lote reversible ya cerrado por `SHELL-MIG-002` y fija tres resultados inseparables:

1. compatibilidad temporal únicamente para consumidores legacy reales, inventariados y con propietario;
2. observabilidad de la deprecación o transición sin convertir archivos privados en superficies públicas ficticias;
3. un gate automático fail-closed que impida crear, ampliar o regenerar nuevos consumidores legacy.

La regla raíz es:

```text
legacy ya inventariado
→ puede conservarse temporalmente bajo frontera exacta
→ queda ligado a consumidor, commit, contrato objetivo, evidencia y rollback
→ no puede crecer
→ no puede convertirse en fuente de verdad
→ no puede crear nuevos consumidores
→ debe desaparecer cuando su lote propietario cierre la migración
```

La compatibilidad temporal no cambia autoridad, no introduce aliases implícitos y no habilita fallbacks permisivos.

---

#### 2. Resultado material

La única instancia material asignada a `SHELL-MIG-003` por `SHELL-MIG-002` es:

```text
devVentoGroup/vento-nexo / SHELL-MIG-003
```

La instancia contiene exactamente dos consumidores legacy confirmados:

| Repositorio                | Artefacto                                                 | Clase    | Estado heredado | Decisión de `SHELL-MIG-003`                                                                                                                     |
| -------------------------- | --------------------------------------------------------- | -------- | --------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `devVentoGroup/vento-nexo` | `.github/workflows/tmp-apply-privileged-request-area.yml` | `CI`     | `LEGACY_ACTIVO` | conservar únicamente como baseline transitorio exacto; cualquier expansión o recreación legacy bloquea                                          |
| `devVentoGroup/vento-nexo` | `scripts/tmp-apply-privileged-request-area.mjs`           | `SCRIPT` | `LEGACY_ACTIVO` | conservar únicamente como baseline transitorio exacto; adaptar o retirar solo cuando exista frontera canónica consumible y rollback certificado |

Conciliación:

| Métrica                                                       | Resultado |
| ------------------------------------------------------------- | --------: |
| repositorios con lote propio `SHELL-MIG-003`                  |     **1** |
| consumidores legacy CI/script del lote                        |     **2** |
| consumidores legacy adicionales autorizados por esta tarea    |     **0** |
| adapters especulativos autorizados                            |     **0** |
| nuevas copias legacy permitidas                               |     **0** |
| releases estables de compatibilidad declaradas por esta tarea |     **0** |
| deprecaciones públicas iniciadas por esta tarea               |     **0** |
| cambios físicos ejecutados                                    |     **0** |

Los targets actuales `src/app/inventory/remissions/page.tsx` y `src/app/inventory/remissions/actions.ts` no se convierten en un lote nuevo de `SHELL-MIG-003`. Permanecen como superficies consumidoras vigiladas y su migración de autorización/contexto conserva la propiedad ya asignada a `SHELL-AUTH-005` y tareas propietarias relacionadas.

---

#### 3. Fuentes, dependencias y corte verificable

##### 3.1. Dependencias vinculantes

| Fuente            | Decisión heredada                                                                                                                     |
| ----------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| `SHELL-MIG-001`   | inventario de 142 filas, clasificación de CI/script y lote base exacto para los dos artefactos NEXO                                   |
| `SHELL-MIG-002`   | 22 lotes reversibles, un único lote `SHELL-MIG-003`, suspensión y rollback por snapshot consumidor                                    |
| `SHELL-PKG-003`   | identidad inmutable de package, versión, tag, release, commit, artefacto y canal                                                      |
| `SHELL-PKG-005`   | deprecación separada de retiro, señales observables, ventana y prohibición de nuevas adopciones de líneas deprecadas                  |
| `SHELL-CON-003`   | `PermissionKey` canónica; aliases y permisos legacy fuera del conjunto activo; no nuevas asignaciones legacy                          |
| `SHELL-CON-004`   | ocho `BaseRoleCode`; oficios base legacy y conversiones silenciosas prohibidos                                                        |
| `SHELL-CON-005`   | doce `OperationalRoleCode`; `propietario_admin`, roles base y aliases/fallbacks fuera del catálogo operativo                          |
| `SHELL-CON-006`   | scopes contractuales separados de rol, permiso y contexto; entradas desconocidas fallan cerrado                                       |
| `SHELL-CON-007`   | tipos de contexto compartidos y separación de contexto, simulación y decisión                                                         |
| `SHELL-AUTH-001`  | `@vento/os-context` como único SDK compartido de contexto/autorización                                                                |
| `SHELL-AUTH-002`  | adapters canónicos de servidor, cliente y proyecciones seguras                                                                        |
| `SHELL-AUTH-004`  | implementación futura de lint, métricas y gates contra consumidores legacy                                                            |
| `SHELL-AUTH-005`  | migración posterior de consumidores de autorización en todos los repositorios                                                         |
| `04A_04_SHELL.md` | cobertura vigente de copias compartidas, CI reproducible, compatibilidad, rollback, releases, deprecación y contratos de autorización |

##### 3.2. Corte físico inspeccionado

| Superficie                  | Identidad verificada                                      | Resultado relevante                                                                             |
| --------------------------- | --------------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| `devVentoGroup/vento-shell` | `2750dd5fc30cb951e51d0dab0405d72396584f91`                | continuidad documental ya actualizada hasta `SHELL-MIG-002`; `SHELL-MIG-003` es la tarea actual |
| `devVentoGroup/vento-nexo`  | `142c4d696221e3ce3fda4ed3b62f3d1fe5b58799`                | mismo corte runtime usado por `SHELL-MIG-001`; los dos artefactos CI/script siguen presentes    |
| workflow NEXO               | `.github/workflows/tmp-apply-privileged-request-area.yml` | parchea script y targets, ejecuta instalación/build y puede escribir sobre `preview`            |
| script NEXO                 | `scripts/tmp-apply-privileged-request-area.mjs`           | parchea `page.tsx` y `actions.ts` usando formas locales de rol, permiso, sesión y contexto      |
| target NEXO                 | `src/app/inventory/remissions/page.tsx`                   | consume helpers locales de guard, role override y sesión operacional                            |
| target NEXO                 | `src/app/inventory/remissions/actions.ts`                 | consume helpers locales de role override, operational session/context y cliente Supabase server |

La inspección confirma consumo real. Por ello el lote NEXO cumple la condición de entrada para compatibilidad temporal. No existe base para crear adapters equivalentes en otro repositorio desde esta tarea.

---

#### 4. Clasificación vinculante de consumo legacy

Para esta migración, una dependencia se trata como legacy cuando existe una decisión canónica propietaria que exige converger a una frontera compartida, generada o local explícitamente clasificada y el consumidor todavía depende de una forma anterior.

El gate deberá cubrir como mínimo estas clases ya aprobadas por `SHELL-MIG-001`:

| Clase       | Forma de consumo que debe detectar                                                                |
| ----------- | ------------------------------------------------------------------------------------------------- |
| `STATIC`    | import, llamada, tipo, constante o referencia directa a una copia o helper legacy                 |
| `DYNAMIC`   | importación dinámica, registry, lookup o resolución indirecta que introduzca una forma legacy     |
| `FRAMEWORK` | layout, middleware, page o route que use una forma legacy aunque no tenga importadores explícitos |
| `CI`        | workflow que copie, modifique, regenere o valide código dependiente de una forma legacy           |
| `SCRIPT`    | script que copie, parchee, genere o reintroduzca una forma legacy                                 |
| `MANUAL`    | herramienta operativa que materialice código o configuración legacy                               |

También se considera nuevo consumo legacy:

- un archivo nuevo que introduce una identidad legacy;
- una nueva arista desde un archivo existente hacia una identidad legacy;
- una nueva referencia dentro de un consumidor grandfathered que amplía su superficie legacy;
- un generador, patch o workflow que escriba una nueva forma legacy en otro archivo;
- un alias, cast, fallback, concatenación o parser que convierta una identidad no canónica en autoridad actual;
- una copia de implementación que evita el package, contrato o adapter propietario ya aprobado;
- una forma no clasificable cuya seguridad o propiedad no pueda demostrarse.

Modificar un consumidor grandfathered no renueva su excepción. Solo puede mantenerla sin crecimiento, reducirla o sustituirla por una frontera canónica compatible.

---

#### 5. Contrato de compatibilidad temporal versionada

La compatibilidad temporal solo es admisible cuando todas estas condiciones se cumplen simultáneamente:

1. el consumidor existe en el inventario aprobado;
2. el repositorio y commit consumidor son verificables;
3. la identidad legacy exacta está clasificada y tiene propietario canónico;
4. el reemplazo contractual está identificado;
5. la compatibilidad no amplía permisos, roles, scopes, sedes, áreas, sesiones ni autoridad efectiva;
6. entradas desconocidas, deprecadas o fuera de catálogo fallan cerrado;
7. no se crea una segunda fuente editable de contratos;
8. la compatibilidad puede eliminarse sin obligar a migrar simultáneamente los demás repositorios;
9. existe rollback hacia un snapshot previo certificado;
10. la evidencia está ligada al commit, manifest, lockfile y versiones aplicables cuando existan packages publicados.

La identidad contractual aplicable al lote NEXO queda fijada así:

| Materia              | Versión o identidad contractual                     | Regla de compatibilidad                                                                                     |
| -------------------- | --------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| catálogo de permisos | `vento.authorization@1.0.0`                         | solo claves activas se convierten en `PermissionKey`; legacy/retiradas no adquieren autoridad actual        |
| roles base           | `vento.authorization.base-role-grants@1.1.0`        | ocho `BaseRoleCode`; oficios legacy no reciben alias automático                                             |
| roles operativos     | `vento.authorization.operational-role-grants@1.0.0` | doce `OperationalRoleCode`; `propietario_admin` y roles base no se convierten por fallback                  |
| SDK runtime objetivo | `@vento/os-context`                                 | no existe release estable confirmada; no puede declararse compatibilidad estable ni adopción física todavía |
| consumidor NEXO      | commit `142c4d696221e3ce3fda4ed3b62f3d1fe5b58799`   | baseline exacto para la excepción transitoria de los dos artefactos CI/script                               |

`@vento/os-context@0.1.0` no se eleva a release estable por esta tarea. Una futura compatibilidad distribuible deberá usar una versión publicada e inmutable conforme a `SHELL-PKG-003` y superar la matriz de compatibilidad antes de adopción.

---

#### 6. Aplicabilidad por repositorio

`SHELL-MIG-002` asignó un solo lote a esta tarea. La decisión por repositorio queda explícita:

| Repositorio                  | Lote propio `SHELL-MIG-003` | Excepción temporal materializada | Decisión                                                                                                |
| ---------------------------- | --------------------------- | -------------------------------: | ------------------------------------------------------------------------------------------------------- |
| `devVentoGroup/vento-shell`  | no                          |                                0 | no crear adapter desde esta tarea; cualquier legacy se conserva bajo su lote propietario                |
| `devVentoGroup/vento-numera` | no                          |                                0 | no crear adapter desde esta tarea; cualquier legacy se conserva bajo su lote propietario                |
| `devVentoGroup/vento-fogo`   | no                          |                                0 | no crear adapter desde esta tarea; cualquier legacy se conserva bajo su lote propietario                |
| `devVentoGroup/vento-origo`  | no                          |                                0 | no crear adapter desde esta tarea; cualquier legacy se conserva bajo su lote propietario                |
| `devVentoGroup/vento-viso`   | no                          |                                0 | no crear adapter desde esta tarea; cualquier legacy se conserva bajo su lote propietario                |
| `devVentoGroup/vento-pulso`  | no                          |                                0 | no crear adapter desde esta tarea; cualquier legacy se conserva bajo su lote propietario                |
| `devVentoGroup/vento-nexo`   | sí                          |                                2 | permitir exclusivamente la excepción transitoria inventariada del workflow y script; bloquear expansión |

Esta tabla no afirma ausencia de legacy runtime en los otros repositorios. Solo materializa la propiedad exacta de `SHELL-MIG-003`; los demás consumidores conservan los lotes ya asignados por `SHELL-MIG-002`.

---

#### 7. Delimitación del lote NEXO

##### 7.1. Workflow temporal

`.github/workflows/tmp-apply-privileged-request-area.yml` permanece clasificado como consumidor `CI` porque modifica el script, ejecuta el patch, valida instalación/build y puede escribir el resultado sobre `preview`.

Su compatibilidad temporal no autoriza:

- introducir otra ruta, helper, rol, permiso o fallback legacy;
- modificar el catálogo canónico mediante patch;
- convertir strings locales en contratos compartidos;
- aceptar una forma legacy desconocida para evitar un error del patch;
- extender sus targets más allá del alcance aprobado sin reclasificación;
- considerar un build exitoso como prueba de paridad de autorización.

##### 7.2. Script temporal

`scripts/tmp-apply-privileged-request-area.mjs` permanece clasificado como consumidor `SCRIPT` porque modifica directamente `page.tsx` y `actions.ts`.

Las formas que el gate deberá reconocer en su baseline incluyen las dependencias locales actualmente usadas por el patch, entre ellas:

- role override local;
- operational session local;
- operational context local;
- evaluadores de permisos locales;
- consulta directa del rol de empleado usada por el patch;
- códigos textuales de rol base usados para decidir comportamiento;
- resolución local de área operacional asociada al flujo de remisiones.

La enumeración anterior describe el baseline que debe congelarse; no lo convierte en API permitida para nuevos consumidores.

##### 7.3. Targets vigilados

`src/app/inventory/remissions/page.tsx` y `src/app/inventory/remissions/actions.ts` se incluyen en el análisis de salida del gate porque el workflow/script puede modificarlos.

La tarea propietaria de su migración de autorización/contexto sigue siendo `SHELL-AUTH-005`. `SHELL-MIG-003` únicamente impide que el mecanismo temporal aumente la deuda legacy mientras esa migración no ha ocurrido.

---

#### 8. Deprecación y observabilidad

La observabilidad distingue dos objetos:

##### 8.1. Superficie pública estable

Si una compatibilidad temporal se incorpora posteriormente a una superficie pública estable de `@vento/contracts`, `@vento/os-context`, `@vento/supabase` o `@vento/ui-web`, deberá seguir `SHELL-PKG-005`:

- expediente `DEP-*` cuando exista deprecación real de una superficie estable;
- señal `@deprecated` cuando aplique;
- documentación pública;
- changelog;
- release notes;
- guía de migración;
- matriz de consumidores;
- evidencia de compatibilidad y rollback;
- ventana y retiro gobernados por la política de deprecación.

##### 8.2. Artefacto privado de migración

El workflow y el script NEXO son artefactos privados de migración, no APIs públicas estables. Por tanto:

- no se inventa un expediente `DEP-*` para ellos;
- su observabilidad proviene del inventario `SHELL-MIG-001`, el lote `SHELL-MIG-002`, la identidad de commit, el resultado del gate y la evidencia del patch/build;
- su estado legacy debe seguir visible hasta que se adapten o retiren;
- su retiro exige revalidar consumidores y rollback conforme a `SHELL-MIG-008`.

Un warning de runtime no es obligatorio ni suficiente. Si una tarea propietaria lo adopta posteriormente, deberá ser deduplicado, seguro, no sensible, atribuible y no modificar el control de autorización.

---

#### 9. Gate automático contra nuevos consumidores legacy

El gate queda especificado como una comparación fail-closed entre el baseline aprobado y el estado propuesto del consumidor.

##### 9.1. Entradas mínimas

El gate deberá recibir o resolver:

1. repositorio consumidor;
2. commit base;
3. commit de propuesta;
4. inventario legacy aprobado de `SHELL-MIG-001` y lotes de `SHELL-MIG-002`;
5. archivos cambiados;
6. contenido completo de los archivos legacy grandfathered afectados;
7. targets que un workflow, script o generador pueda escribir;
8. catálogo de identidades canónicas y legacy de las tareas propietarias;
9. manifest y lockfile cuando el cambio involucre packages;
10. versiones de contratos o packages objetivo;
11. declaración de requisitos `TREQ-*` afectados;
12. referencia de rollback.

##### 9.2. Regla de comparación

El resultado solo puede ser favorable cuando se cumplen simultáneamente:

```text
nuevas aristas legacy = 0
crecimiento del baseline grandfathered = 0
nuevos archivos legacy = 0
nuevos generators o patches legacy = 0
identidades sin clasificar = 0
fallbacks o aliases no autorizados = 0
bypasses de autoridad = 0
```

Además, cualquier modificación de una entrada material invalida la evidencia anterior y exige reejecución.

##### 9.3. Condiciones de fallo

El gate debe bloquear al menos cuando:

- aparece una referencia legacy fuera del baseline exacto;
- un consumidor grandfathered añade otra identidad legacy;
- un workflow o script empieza a parchear un target nuevo con una forma legacy;
- una copia local se presenta como sustituto de una frontera compartida aprobada;
- se agrega un alias o fallback no aprobado;
- se acepta un rol, permiso, scope, app code o razón desconocidos por cast o semejanza;
- se restaura una identidad retirada o deprecada como autoridad actual;
- la clasificación del hallazgo no es determinista;
- el baseline, commit o versión usados por la evidencia ya no coinciden con la propuesta;
- falta el propietario, condición de salida o rollback de una excepción temporal.

##### 9.4. Estados de resultado

El gate reutiliza la semántica fail-closed ya aprobada por `SHELL-PKG-008`:

| Estado           | Aplicación en `SHELL-MIG-003`                                                                                                       |
| ---------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| `PASS`           | cero crecimiento legacy y todas las excepciones observadas coinciden con el baseline autorizado                                     |
| `FAIL`           | se detectó una nueva arista, copia, patch, alias, fallback o uso legacy no autorizado                                               |
| `BLOCKED`        | la clasificación o evidencia necesaria no puede resolverse de forma segura                                                          |
| `STALE`          | evidencia ligada a otro commit, baseline, manifest, lockfile o versión                                                              |
| `NOT_APPLICABLE` | solo para una comprobación condicional cuya no aplicabilidad esté demostrada; nunca sustituye la búsqueda universal de nuevo legacy |

Ausencia de resultado, omisión, cancelación o análisis parcial no equivalen a `PASS`.

---

#### 10. Propiedad de implementación del gate

La tarea actual define el contrato del gate; no lo implementa físicamente.

La materialización queda distribuida sin crear tareas nuevas:

| Materia                                                           | Propietario existente                               |
| ----------------------------------------------------------------- | --------------------------------------------------- |
| lint, métricas y gate contra legacy de autorización/contexto      | `SHELL-AUTH-004`                                    |
| adapters canónicos requeridos para sustituir legacy               | `SHELL-AUTH-002` y módulos `SHELL-CTX-*` aplicables |
| migración de consumidores auth/context                            | `SHELL-AUTH-005`                                    |
| gate universal de packages y evidencia de actualización           | `SHELL-PKG-008` y tareas CI propietarias aplicables |
| compatibilidad de datos/factories si un hallazgo futuro la activa | `SHELL-DB-*` correspondiente                        |
| compatibilidad UI si un hallazgo futuro la activa                 | `SHELL-UI-*` correspondiente                        |
| retiro final de copias legacy                                     | `SHELL-MIG-008`                                     |

En el lote NEXO actual no se autoriza una modificación de factories Supabase ni de contratos de UI compartida; por ello `SHELL-DB-*` y `SHELL-UI-*` no reciben una instancia material adicional desde esta tarea.

---

#### 11. Reglas de adapter y frontera temporal

Cuando una tarea propietaria materialice un adapter temporal, deberá cumplir:

1. estar ligado a consumidores reales enumerados;
2. existir en la frontera propietaria, no replicado por cada aplicación;
3. aceptar solo las formas legacy expresamente clasificadas;
4. traducir a una única identidad canónica cuando esa relación exista;
5. rechazar relaciones uno-a-muchos que requieran decisión de negocio no declarada;
6. no inferir permisos por rol, prefijo, ruta o similitud textual;
7. no convertir `propietario_admin` ni oficios legacy en roles canónicos por fallback;
8. no ampliar scope, territorio, sesión, dispositivo o contexto;
9. no usar el cliente como autoridad para rol, sede, área o permiso efectivo;
10. conservar razón estructurada de rechazo cuando el contrato propietario la defina;
11. conservar una condición de salida medible;
12. ser eliminable sin modificar el significado del contrato canónico.

La existencia del adapter no vuelve soportada la forma legacy para consumidores nuevos.

---

#### 12. Rollback y suspensión

El lote `devVentoGroup/vento-nexo / SHELL-MIG-003` conserva el rollback aprobado por `SHELL-MIG-002`:

```text
restaurar workflow, script y targets
→ al snapshot previo certificado de NEXO
→ sin reescribir historia
→ sin ampliar la superficie legacy
```

La adaptación o retiro debe suspenderse si ocurre cualquiera de estas condiciones:

- el target esperado no coincide con el commit inspeccionado;
- el patch deja de ser determinista;
- instalación, typecheck, pruebas o build aplicables fallan;
- la compatibilidad amplía autoridad;
- aparece una identidad legacy no clasificada;
- el cambio toca una forma contractual fuera del propietario aprobado;
- no existe snapshot previo seguro;
- el gate contra nuevo legacy no produce evidencia vigente;
- el rollback requeriría restaurar un bypass o una identidad expresamente retirada.

Una suspensión conserva abierto el lote; no autoriza a deshabilitar el gate.

---

#### 13. Decisiones vinculantes

1. `SHELL-MIG-003` conserva un único lote material: `devVentoGroup/vento-nexo / SHELL-MIG-003`.
2. El lote contiene exactamente dos consumidores legacy CI/script inventariados.
3. Ningún otro repositorio recibe un adapter por inferencia.
4. Compatibilidad temporal exige consumo real e inventariado.
5. Un consumidor grandfathered no puede crecer en superficie legacy.
6. Una nueva referencia legacy fuera del baseline queda bloqueada.
7. CI, scripts, generators, patches y entrypoints framework cuentan como consumidores.
8. Un mecanismo que escribe legacy en otro archivo cuenta como nueva arista aunque el archivo generador ya existiera.
9. Toda forma no clasificable falla cerrado.
10. `PermissionKey`, `BaseRoleCode`, `OperationalRoleCode`, scopes y contexto conservan sus fuentes contractuales propietarias.
11. Aliases y fallbacks no crean autoridad ni compatibilidad implícita.
12. La compatibilidad no amplía rol, permiso, territorio, sesión, dispositivo ni contexto.
13. El catálogo `vento.authorization@1.0.0` es la identidad de permisos aplicable al baseline NEXO.
14. `base-role-grants@1.1.0` y `operational-role-grants@1.0.0` son las identidades contractuales de rol aplicables.
15. `@vento/os-context@0.1.0` no se declara release estable ni objetivo de adopción certificada.
16. Una futura compatibilidad distribuible deberá tener versión publicada inmutable y matriz de compatibilidad.
17. Los dos artefactos NEXO privados no reciben expedientes `DEP-*` ficticios.
18. Una deprecación pública futura sí deberá cumplir íntegramente `SHELL-PKG-005`.
19. El gate automático reutiliza semántica fail-closed y no permite omisión como éxito.
20. `SHELL-AUTH-004` permanece propietario de materializar lint, métricas y gates auth/context.
21. `SHELL-AUTH-005` permanece propietario de migrar los targets consumidores.
22. `SHELL-MIG-008` permanece propietario del retiro final.
23. La tarea actual no modifica workflow, script, target, package, lockfile, CI, datos ni Supabase.
24. La tarea actual no publica tags, releases ni deprecaciones.
25. La tarea actual crea cero requisitos de prueba por cobertura canónica existente.
26. `SHELL-MIG-004` permanece como única tarea siguiente reservada.

---

#### 14. Hallazgos y destinos exactos

| Hallazgo                                                                                     | Estado                          | Destino o condición de salida                                                               |
| -------------------------------------------------------------------------------------------- | ------------------------------- | ------------------------------------------------------------------------------------------- |
| workflow NEXO puede modificar script y targets que usan formas auth/context legacy           | `LEGACY_ACTIVO`                 | gate especificado aquí; materialización en `SHELL-AUTH-004`; migración en `SHELL-AUTH-005`  |
| script NEXO parchea roles, permisos, sesión y contexto locales                               | `LEGACY_ACTIVO`                 | adapter o sustitución solo tras frontera canónica consumible; migración en `SHELL-AUTH-005` |
| targets NEXO siguen usando helpers locales de auth/context                                   | `LEGACY_ACTIVO`                 | lote `devVentoGroup/vento-nexo / SHELL-AUTH-005` ya definido por `SHELL-MIG-002`            |
| `@vento/os-context` no tiene release estable confirmada                                      | `NO_RELEASE_ESTABLE_CONFIRMADA` | publicación y compatibilidad según tareas propietarias antes de adopción física             |
| no existe gate físico confirmado que bloquee nuevos consumidores legacy                      | `PENDIENTE_DE_IMPLEMENTACION`   | `SHELL-AUTH-004` para auth/context y gates de package/CI aplicables                         |
| no existen deprecaciones públicas estables activas de los packages compartidos en este corte | `NO_APLICA_EN_LINEA_BASE`       | primer expediente real futuro bajo `SHELL-PKG-005`                                          |
| el lote actual no requiere modificar factories Supabase                                      | `NO_APLICA`                     | conservar propiedad `SHELL-DB-*`; reabrir solo ante hallazgo material futuro                |
| el lote actual no requiere modificar contrato UI compartido                                  | `NO_APLICA`                     | conservar propiedad `SHELL-UI-*`; reabrir solo ante hallazgo material futuro                |

No queda un pendiente narrativo sin propietario o condición de salida.

---

#### 15. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** `SHELL-MIG-003` materializa el mecanismo de enforcement de obligaciones ya registradas y no crea una regla de negocio o seguridad independiente. El fragmento canónico `04A_04_SHELL.md` ya protege la prohibición de copias compartidas divergentes, la clasificación y retiro seguro de consumidores, los comandos y gates reproducibles con bloqueo de merge, la compatibilidad por consumidor, el rollback independiente, la evidencia por package y PR, la identidad inmutable de release, el ciclo observable de deprecación, el bloqueo de retiro con consumo residual y los contratos específicos de roles, scopes y contexto. Esta tarea especializa esas obligaciones para el lote NEXO sin alterar su contenido ni estado.

| Operación sobre `TREQ-*` | Cantidad |
| ------------------------ | -------: |
| creados                  |    **0** |
| modificados              |    **0** |
| diferidos                |    **0** |
| descartados              |    **0** |
| obsoletos                |    **0** |

No corresponde modificar el registro 04A.

---

#### 16. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                                                                                |
| --------- | -------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | La tarea es documental y no existe un checkout local completo de `vento-shell` en este entorno para ejecutar el build canónico del plan.                                                                 |
| LOCAL     | PASS           | El artefacto independiente fue comprobado estructuralmente contra cabecera obligatoria, secciones requeridas, continuidad, cinco clases de evidencia, conteo TREQ cero y ausencia de placeholders.       |
| REMOTA    | PASS           | Se verificaron en GitHub la continuidad actual, `SHELL-MIG-002`, `SHELL-PKG-003`, `SHELL-PKG-005`, contratos propietarios, 04A, commit NEXO y contenido actual del workflow, script y targets vigilados. |
| OPERATIVA | NOT_APPLICABLE | No se ejecuta el workflow, patch, migración ni prueba operativa durante la fase documental.                                                                                                              |
| FÍSICA    | NOT_APPLICABLE | No se materializa adapter, package, gate, cambio de consumidor, Supabase ni despliegue en esta tarea.                                                                                                    |

---

#### 17. Criterios de aceptación

`SHELL-MIG-003` queda materialmente completa porque:

- conserva exactamente el único lote que `SHELL-MIG-002` asignó a esta tarea;
- materializa exactamente dos consumidores CI/script NEXO y cero consumidores adicionales;
- distingue los artefactos del lote de los targets cuya migración pertenece a `SHELL-AUTH-005`;
- impide crear adapters por inferencia en repositorios sin lote propio `SHELL-MIG-003`;
- fija las condiciones acumulativas que hacen admisible una compatibilidad temporal;
- liga la compatibilidad NEXO a contratos versionados y al commit consumidor exacto;
- impide declarar `@vento/os-context@0.1.0` como release estable;
- define qué constituye una nueva arista legacy en consumo estático, dinámico, framework, CI, script y manual;
- congela el baseline grandfathered y prohíbe su crecimiento;
- trata generators y patches que escriben legacy como consumidores efectivos;
- especifica entradas, comparación, condiciones de fallo y estados del gate automático;
- conserva comportamiento fail-closed ante formas no clasificables;
- separa deprecación pública estable de artefactos privados de migración;
- mantiene observables el workflow y script mediante inventario, commit, gate y evidencia sin inventar expedientes `DEP-*`;
- preserva rollback por snapshot de NEXO y criterios explícitos de suspensión;
- asigna la implementación física del gate a `SHELL-AUTH-004` sin adelantarla;
- conserva la migración de consumidores en `SHELL-AUTH-005` y el retiro en `SHELL-MIG-008`;
- declara cero cambios `TREQ-*` con cobertura existente explícita;
- no modifica código, workflows, scripts, packages, CI, datos, Supabase ni continuidad;
- deja `SHELL-MIG-004` únicamente reservada.

---

#### 18. Límites

Esta tarea no:

- crea adapters físicos;
- materializa `@vento/contracts`, `@vento/os-context`, `@vento/supabase` o `@vento/ui-web`;
- publica versions, tags, releases o artefactos npm;
- inicia una ventana real de deprecación;
- crea expedientes `DEP-*` para archivos privados;
- modifica el workflow o script temporal de NEXO;
- modifica `page.tsx`, `actions.ts` ni helpers de autorización/contexto;
- implementa el lint o gate físico reservado a `SHELL-AUTH-004`;
- migra consumidores reservados a `SHELL-AUTH-005`;
- retira copias legacy reservadas a `SHELL-MIG-008`;
- ejecuta workflows, patches, builds de consumidor, despliegues o validaciones operativas;
- cambia tablas, datos, RLS, RPC, funciones, triggers, Storage, Realtime, Edge Functions, tipos generados, secretos o configuración de Supabase;
- cambia `active-sequence.json` ni desarrolla `SHELL-MIG-004`.

---

#### 19. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-MIG-002 — Definir lotes reversibles por repositorio`

**TAREA ACTUAL APROBADA**
`SHELL-MIG-003 — Preparar compatibilidad y bloqueo de nuevos consumidores legacy`

**SIGUIENTE TAREA RESERVADA**
`SHELL-MIG-004 — Sustituir la plantilla histórica por scaffold versionado`


### ✅ SHELL-MIG-004 — Sustituir la plantilla histórica por scaffold versionado

**Estado:** APROBADA
**Tarea anterior:** SHELL-MIG-003 — Preparar compatibilidad y bloqueo de nuevos consumidores legacy
**Tarea siguiente:** SHELL-MIG-005 — Migrar componentes, Chrome y estilos por aplicación
**Tipo de tarea:** Documental; definición vinculante y materializada del scaffold versionado que sustituirá el mecanismo histórico de copia de AppShell, con contrato de entradas, salidas, versiones exactas, configuración explícita, procedencia, reproducibilidad, rollback y gate de ejecución, sin crear todavía el scaffold físico ni modificar consumidores
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/07_01_MIGRACION_COORDINADA_DE_CONSUMIDORES_WEB.md`
**Estado físico resultante:** ESPECIFICADO; 1 lote de scaffold cerrado documentalmente; 8 artefactos legacy reconciliados; 3 salidas locales permitidas; 5 copias runtime compartidas prohibidas; 0 scaffold físico creado; 0 consumidores migrados
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`SHELL-MIG-004` sustituye documentalmente el modelo histórico de distribución del AppShell basado en copiar archivos por un scaffold versionado, reproducible y trazable.

La tarea materializa el contrato completo que deberá cumplir el sustituto físico antes de poder usarse sobre un repositorio consumidor.

La regla raíz queda:

```text
FUENTE CANÓNICA VERSIONADA
+
RELEASES EXACTAS Y COMPATIBLES
+
CONFIGURACIÓN EXPLÍCITA DEL CONSUMIDOR
+
SCAFFOLD IDENTIFICABLE E INMUTABLE
→ DEPENDENCIAS INSTALADAS
→ ENTRYPOINTS Y COMPOSICIÓN LOCAL MÍNIMA
→ MANIFEST DE RESULTADO Y PROCEDENCIA
```

Y queda descartado como mecanismo futuro:

```text
TEMPLATE HISTÓRICO
→ COPIAR IMPLEMENTACIÓN RUNTIME
→ CAMBIAR TEXTO, RUTAS, PERMISOS O COLORES POR SUSTITUCIÓN
→ CREAR OTRA COPIA INDEPENDIENTE
```

El objetivo no es ocultar la plantilla histórica detrás de otro script. El objetivo es eliminar la duplicación como mecanismo de distribución.

---

#### 2. Resultado material

Queda cerrado un único lote documental heredado de `SHELL-MIG-002`:

```text
devVentoGroup/vento-shell / SHELL-MIG-004
```

Su resultado se materializa así:

| Dimensión                                                                     | Resultado |
| ----------------------------------------------------------------------------- | --------: |
| lotes de `SHELL-MIG-004`                                                      |     **1** |
| mecanismos legacy directos gobernados                                         |     **2** |
| archivo bootstrap histórico                                                   |     **1** |
| árbol de plantilla histórica                                                  |     **1** |
| archivos físicos administrados por el bootstrap actual                        |     **8** |
| módulos TypeScript/TSX de la plantilla                                        |     **7** |
| hojas de estilo adicionales                                                   |     **1** |
| archivos locales que el scaffold podrá generar o actualizar                   |     **3** |
| archivos de implementación compartida que el scaffold tendrá prohibido copiar |     **5** |
| packages compartidos de frontera reconocidos                                  |     **4** |
| versiones concretas de packages inventadas por esta tarea                     |     **0** |
| scaffold físico creado                                                        |     **0** |
| consumidores migrados                                                         |     **0** |
| cambios Supabase                                                              |     **0** |
| cambios `TREQ-*`                                                              |     **0** |

Los dos mecanismos legacy gobernados son:

1. `tools/bootstrap-app-shell.ps1`;
2. `templates/app-shell-standard`.

Los ocho archivos físicos administrados actualmente son:

1. `src/app/globals.css`;
2. `src/app/layout.tsx`;
3. `src/components/vento/standard/vento-shell.tsx`;
4. `src/components/vento/standard/vento-chrome.tsx`;
5. `src/components/vento/standard/ui.tsx`;
6. `src/components/vento/standard/table.tsx`;
7. `src/components/vento/standard/app-switcher.tsx`;
8. `src/components/vento/standard/profile-menu.tsx`.

La diferencia entre ocho archivos físicos y siete módulos del registro de pruebas es coherente: `globals.css` es la hoja de estilo adicional; los otros siete son módulos TSX.

---

#### 3. Fuentes, dependencias y corte verificable

##### 3.1. Dependencias vinculantes

| Fuente                | Decisión heredada                                                                                                          |
| --------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| `SHELL-MIG-003`       | bloquear crecimiento de legacy y fallar cerrado ante nuevas aristas o copias no inventariadas                              |
| `SHELL-PKG-001`       | registry npm privado, versiones exactas, lockfile, `npm ci`, procedencia y prohibición de distribución por copia           |
| `SHELL-PKG-003`       | releases y artefactos inmutables; una identidad publicada no se corrige en sitio                                           |
| `SHELL-PKG-004`       | compatibilidad atribuible a package, versión, consumidor, commit, lockfile, toolchain y evidencia exactos                  |
| `SHELL-UI-010`        | `AppShell` es composición presentacional; datos, permisos, contexto, Supabase y navegación empresarial permanecen fuera    |
| `SHELL-MIG-002`       | lote exacto de scaffold, pruebas, observabilidad, rollback y criterio de suspensión                                        |
| `TREQ-SHELL-002`      | una responsabilidad compartida no se propaga mediante copias manuales sin paridad contractual                              |
| `TREQ-SHELL-006`      | packages compartidos requieren pruebas y compatibilidad por consumidor                                                     |
| `TREQ-SHELL-007`      | rollback independiente antes de release o cutover                                                                          |
| `TREQ-SHELL-029`      | la plantilla histórica es fuente y no runtime por su sola existencia                                                       |
| `TREQ-SHELL-030..032` | navegación, autorización, simulación, componentes y copias del template deben reconciliarse sin autoridad local divergente |
| `TREQ-SHELL-035`      | textos y estados de template no pueden propagar codificación o significado defectuosos                                     |
| `TREQ-SHELL-036..039` | identidad de release, compatibilidad, deprecación y retiro controlado                                                      |

##### 3.2. Estado remoto observado

La línea base remota consultada mantiene:

- `packages/*` como workspace de autoría;
- únicamente `packages/os-context` materializado bajo `packages/`;
- `@vento/os-context@0.1.0` con `private: true` y exports directos a `src/index.ts`, por lo que no constituye una release estable de distribución;
- `@vento/contracts`, `@vento/supabase` y `@vento/ui-web` sin package físico publicado confirmado;
- cero evidencia de releases estables adoptables de las cuatro familias para ejecutar el scaffold;
- `tools/bootstrap-app-shell.ps1` como único archivo bajo `tools/`;
- `templates/app-shell-standard` como plantilla histórica vigente.

Por tanto, el scaffold queda **ESPECIFICADO** pero **BLOQUEADO PARA EJECUCIÓN FÍSICA** hasta que existan releases exactas, compatibles y autorizadas de las dependencias que cada ejecución requiera.

---

#### 4. Línea base física del mecanismo histórico

El bootstrap actual recibe configuración de aplicación y luego copia recursivamente la implementación de `templates/app-shell-standard` al repositorio destino.

Después de copiar:

- reescribe variables CSS mediante una tabla de paletas embebida;
- reescribe metadata de `layout.tsx`;
- sustituye `NEXO` y prefijos de permisos dentro de `vento-chrome.tsx`;
- modifica texto de `profile-menu.tsx`;
- puede alterar el estado local del AppSwitcher;
- permite sobrescribir los ocho archivos administrados mediante una opción de fuerza.

El README histórico amplía el riesgo: si faltan helpers de Supabase o autenticación, indica copiarlos desde NEXO o adaptar imports.

Ese modelo viola la arquitectura objetivo porque distribuye fuente mutable por duplicación en lugar de consumir una identidad versionada.

La plantilla también conserva evidencia de defectos que no deben propagarse, incluidos textos con codificación corrupta y listas locales de aplicaciones, navegación y permisos.

---

#### 5. Decisión principal

Se aprueba el siguiente modelo de sustitución:

```text
SCAFFOLD VERSIONADO
→ NO CONTIENE UNA COPIA CANÓNICA DE LA IMPLEMENTACIÓN RUNTIME COMPARTIDA
→ INSTALA DEPENDENCIAS APROBADAS MEDIANTE VERSIONES EXACTAS
→ GENERA SOLO COMPOSICIÓN Y CONFIGURACIÓN LOCAL PROPIETARIA
→ REGISTRA PROCEDENCIA Y RESULTADO
→ FALLA SI NO PUEDE DEMOSTRAR COMPATIBILIDAD O REPRODUCIBILIDAD
```

El scaffold no será un segundo package de UI ni una segunda fuente de contratos.

No podrá convertirse en propietario semántico de:

- catálogos de aplicaciones;
- permisos;
- roles;
- scopes;
- contexto operativo;
- clientes Supabase;
- navegación empresarial;
- AppSwitcher;
- ProfileMenu;
- componentes visuales compartidos;
- contratos CSS compartidos.

Es una herramienta de materialización controlada de un consumidor, no una fuente alternativa de verdad.

---

#### 6. Fronteras de package

El scaffold reconoce exactamente las cuatro familias compartidas ya aprobadas:

| Package             | Responsabilidad que puede consumir el scaffold                                  | Regla                                                            |
| ------------------- | ------------------------------------------------------------------------------- | ---------------------------------------------------------------- |
| `@vento/contracts`  | identidades, catálogos, tipos y contratos estáticos                             | nunca generar una copia local editable del contrato              |
| `@vento/os-context` | adapters y runtime compartido de contexto/autorización                          | nunca copiar helpers auth desde NEXO u otra aplicación           |
| `@vento/supabase`   | factories y frontera técnica de acceso a Supabase                               | nunca copiar factories browser/server desde otra aplicación      |
| `@vento/ui-web`     | AppShell, Chrome presentacional, primitivas y componentes compartidos aprobados | nunca copiar la implementación de esos componentes al consumidor |

Una ejecución concreta instala únicamente packages que realmente formen parte del grafo aprobado de esa composición, pero toda dependencia instalada deberá tener versión exacta y compatibilidad demostrada.

La omisión de una familia es válida solo cuando el resultado no importa ni duplica su responsabilidad y la matriz aplicable la clasifica como no requerida para esa composición. El scaffold no instala packages sin uso para aparentar cumplimiento.

---

#### 7. Identidad y versionado del scaffold

Toda implementación física futura del scaffold deberá poseer una identidad de versión inmutable y verificable.

Su procedencia mínima queda definida por esta tupla:

```text
versión del scaffold
+
repositorio fuente
+
commit fuente
+
huella del artefacto ejecutado
+
contrato de entradas
+
versiones exactas de packages requeridos
```

Reglas:

1. una misma versión del scaffold no podrá cambiar de lógica o bytes sin crear una versión nueva;
2. la versión deberá quedar registrada en cada ejecución y en su manifest de resultado;
3. un cambio que modifique archivos generados, semántica de configuración, dependencias requeridas o reglas de validación exige una nueva versión del scaffold;
4. una corrección no podrá sustituir silenciosamente el artefacto de una versión ya utilizada;
5. el commit fuente y la huella del ejecutable son evidencia obligatoria aun cuando exista una versión humana;
6. esta tarea no asigna un número inicial, tag ni ruta de publicación porque todavía no existe el artefacto físico autorizado;
7. la primera identidad física solo podrá declararse cuando el scaffold real supere sus gates de implementación y evidencia.

No se reutilizan los tags `pkg/...` de `SHELL-PKG-003` para fingir que el scaffold es uno de los cuatro packages.

---

#### 8. Contrato de entrada obligatorio

Una ejecución válida deberá resolver explícitamente, como mínimo:

| Entrada                         | Obligación                                                                                                |
| ------------------------------- | --------------------------------------------------------------------------------------------------------- |
| repositorio consumidor          | identidad exacta del repositorio objetivo                                                                 |
| commit base                     | commit exacto sobre el que se calcula la salida                                                           |
| aplicación                      | `AppCode` canónico validado; no derivado del nombre visible                                               |
| nombre visible                  | copy de presentación explícito                                                                            |
| metadata web                    | valores aprobados de título, descripción y origen cuando apliquen                                         |
| configuración visual            | tokens o configuración de tema admitidos por el contrato UI vigente                                       |
| dependencias compartidas        | nombre y versión exacta de cada package requerido                                                         |
| integridad de dependencias      | resolución verificable mediante lockfile/registry                                                         |
| compatibilidad                  | relación aprobada para package, versión y consumidor aplicables                                           |
| composición AppShell            | contenido preparado para `brand`, `navigation`, `context`, `notices` y `headerActions` cuando corresponda |
| política de archivos existentes | baseline y procedencia de cada archivo local administrado                                                 |
| rollback                        | snapshot previo restituible del consumidor                                                                |

Queda prohibido inferir `AppCode` desde `AppName`, nombre de carpeta, nombre de repositorio o dominio.

---

#### 9. Versiones fijadas y lockfile

La regla de dependencias es estricta:

```text
package requerido
→ release canónica existente
→ versión exacta
→ integridad resoluble
→ combinación compatible con el consumidor
→ package.json
→ package-lock.json
→ npm ci reproducible
```

Queda prohibido para una ejecución certificable:

- `latest`;
- `*`;
- rangos flotantes;
- `file:`;
- `link:`;
- dependencia Git por branch o commit como canal ordinario;
- workspace local como evidencia de release externa;
- regeneración silenciosa del lockfile;
- override permanente para ocultar incompatibilidad;
- uso de `@vento/os-context@0.1.0` privado como si fuera release estable.

Si una dependencia requerida no tiene una release exacta y compatible, el scaffold **no ejecuta** la materialización certificable.

---

#### 10. Contrato de salida

El scaffold podrá producir únicamente estas clases de resultado:

1. actualización controlada de `package.json` para dependencias compartidas exactas;
2. actualización reproducible de `package-lock.json`;
3. composición local de aplicación;
4. configuración local explícita;
5. metadata y tema propios del consumidor;
6. manifest de resultado y procedencia de la ejecución;
7. evidencia necesaria para comparar la salida con su baseline.

No podrá generar una copia local de la implementación fuente de un package compartido.

La salida deberá poder clasificarse completamente como:

```text
DEPENDENCIA VERSIONADA
+
COMPOSICIÓN LOCAL
+
CONFIGURACIÓN LOCAL
```

Nunca como:

```text
FORK LOCAL DEL PACKAGE
```

---

#### 11. Reconciliación exacta de los ocho archivos históricos

| Archivo histórico                                | Disposición del scaffold     | Motivo                                                                                                                |
| ------------------------------------------------ | ---------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| `src/app/layout.tsx`                             | `GENERAR_O_ACTUALIZAR_LOCAL` | entrypoint de aplicación; metadata, fuentes y composición raíz permanecen locales                                     |
| `src/app/globals.css`                            | `GENERAR_O_ACTUALIZAR_LOCAL` | entrypoint CSS local; tema y overrides de aplicación permanecen locales                                               |
| `src/components/vento/standard/vento-shell.tsx`  | `GENERAR_O_ACTUALIZAR_LOCAL` | compositor server de la aplicación; ensambla dependencias sin convertirse en fuente compartida                        |
| `src/components/vento/standard/vento-chrome.tsx` | `NO_COPIAR`                  | estructura compartible pertenece a `@vento/ui-web`; navegación, permisos y Supabase históricos deben salir del chrome |
| `src/components/vento/standard/ui.tsx`           | `NO_COPIAR`                  | primitivas compartidas deben consumirse desde `@vento/ui-web`                                                         |
| `src/components/vento/standard/table.tsx`        | `NO_COPIAR`                  | los seis wrappers semánticos pertenecen a la superficie UI compartida aprobada                                        |
| `src/components/vento/standard/app-switcher.tsx` | `NO_COPIAR`                  | metadata viene de contratos; acceso se resuelve fuera de UI; el componente visual no mantiene catálogo local          |
| `src/components/vento/standard/profile-menu.tsx` | `NO_COPIAR`                  | estructura visual puede compartirse, pero sesión, simulación, sede y autoridad permanecen fuera del componente        |

Conciliación:

```text
8 archivos históricos
= 3 locales permitidos
+ 5 copias compartidas prohibidas
```

No hay archivo sin disposición.

---

#### 12. Contrato de `src/app/layout.tsx`

El scaffold podrá crear o actualizar el layout local únicamente para:

- metadata de aplicación;
- configuración de fuentes aprobada;
- import del entrypoint CSS local;
- composición raíz hacia el compositor local o superficie compartida aprobada;
- atributos estructurales del documento que sigan siendo responsabilidad del consumidor.

No podrá insertar en el layout:

- catálogos locales de permisos;
- datos de sesión como fuente de autoridad;
- listas copiadas de aplicaciones;
- lógica de Supabase de dominio;
- rutas específicas heredadas de NEXO como estándar transversal.

La metadata deberá usar identidad y configuración explícitas; no se obtendrá por sustitución textual sobre un archivo NEXO.

---

#### 13. Contrato de `src/app/globals.css`

`globals.css` permanece local porque cada consumidor conserva su entrypoint CSS y configuración visual propia.

El scaffold podrá generar o actualizar:

- importaciones públicas requeridas por el contrato CSS compartido cuando esas superficies existan;
- tokens u overrides explícitamente permitidos;
- configuración local de fondo, tipografía o marca que pertenezca al consumidor.

Queda prohibido:

- copiar íntegramente el CSS histórico como implementación base compartida;
- mantener una segunda definición local de tokens cuyo propietario sea `@vento/ui-web`;
- inventar variables públicas no aprobadas;
- derivar paleta desde el nombre de la aplicación;
- propagar texto o bytes corruptos desde el template histórico.

---

#### 14. Contrato de `src/components/vento/standard/vento-shell.tsx`

El compositor local permanece porque `SHELL-UI-010` separa la composición de aplicación de la implementación visual compartida.

Su responsabilidad máxima será:

```text
RESOLVER MEDIANTE FRONTERAS APROBADAS
→ identidad de aplicación
→ sesión/contexto que realmente corresponda
→ navegación ya preparada
→ contexto presentacional
→ avisos
→ utilidades de header

COMPONER
→ AppShell compartido
→ children de la aplicación
```

No podrá reimplementar dentro del archivo:

- factories Supabase compartidas;
- algoritmo de autorización compartido;
- catálogos de roles o permisos;
- AppShell visual completo;
- primitivas UI compartidas;
- AppSwitcher compartido;
- ProfileMenu compartido.

La existencia del compositor local no equivale a mantener una copia del package.

---

#### 15. Superficies que dejan de generarse como fuente runtime

El scaffold prohíbe materializar como copia los cinco archivos compartibles siguientes:

```text
vento-chrome.tsx
ui.tsx
table.tsx
app-switcher.tsx
profile-menu.tsx
```

Su sustitución será mediante imports públicos de releases exactas cuando las superficies físicas correspondientes existan y estén aprobadas.

Si una API pública necesaria todavía no existe, el scaffold se bloquea. No reconstruye esa API copiando el template histórico.

Un wrapper local legítimo solo podrá existir cuando tenga responsabilidad de aplicación propia, nombre y alcance explícitos y no reproduzca la implementación compartida. El scaffold no crea wrappers vacíos para conservar rutas legacy.

---

#### 16. Reconciliación de los parámetros del bootstrap histórico

| Entrada histórica | Decisión del scaffold versionado                                                                                               |
| ----------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| `TargetPath`      | se conserva únicamente como destino operacional de una ejecución; no define identidad semántica                                |
| `AppName`         | se conserva como copy explícito de presentación; no genera `AppCode`                                                           |
| `AppCode`         | pasa a ser obligatorio y debe validar contra el contrato canónico aplicable                                                    |
| `Palette`         | se elimina como tabla hardcodeada del generador; se sustituye por configuración visual explícita compatible con el contrato UI |
| `Domain`          | se conserva como metadata explícita solo cuando el consumidor tenga un origen aprobado                                         |
| `Description`     | se conserva como copy local explícito                                                                                          |
| `Tagline`         | se conserva como copy local explícito si la composición lo utiliza                                                             |
| `SetActiveApp`    | se elimina; el scaffold no cambia ciclo de vida, disponibilidad ni estado de una aplicación                                    |
| `Force`           | se elimina como sobrescritura ciega; un cambio sobre archivos existentes exige baseline reconocible y diff controlado          |

No se mantiene compatibilidad por nombre con parámetros cuya semántica sea insegura.

---

#### 17. Configuración explícita

La configuración de una ejecución deberá ser declarativa, resoluble y suficiente para regenerar el mismo resultado bajo el mismo estado de entrada.

Como mínimo deberá registrar:

- aplicación canónica;
- consumidor exacto;
- commit base;
- metadata de aplicación utilizada;
- tema/tokens configurados;
- packages requeridos y versiones exactas;
- referencias de compatibilidad aplicables;
- decisiones de composición por slot de AppShell;
- archivos locales administrados;
- política de conflicto;
- snapshot de rollback.

La representación física de esa configuración no se asigna en esta fase para no inventar una ruta o formato que todavía no existe en el repositorio.

La futura implementación podrá elegir una serialización concreta únicamente si conserva todos estos campos e invariantes.

---

#### 18. Relación con el catálogo de aplicaciones

El scaffold no mantiene una lista propia de aplicaciones.

Reglas:

1. `AppCode` se valida contra el contrato compartido aplicable.
2. nombre, destino y ciclo de vida no se reconstruyen desde arrays embebidos.
3. `hub` no se convierte por inferencia en un `AppCode` alternativo.
4. el scaffold no marca una aplicación como activa o próxima.
5. la disponibilidad para un actor no se determina en generación.
6. URLs y dominios solo se usan como configuración explícita gobernada.

Esto elimina el comportamiento actual de AppSwitcher que transporta una lista local como fuente propia.

---

#### 19. Relación con `AppShell` de `SHELL-UI-010`

El scaffold deberá preparar el consumidor para la composición conceptual aprobada:

```text
AppShell
├─ brand
├─ navigation
├─ context
├─ notices
├─ headerActions
└─ children
```

El scaffold no resuelve el contenido autoritativo de esos slots.

| Slot            | Propiedad del scaffold                                                     |
| --------------- | -------------------------------------------------------------------------- |
| `brand`         | cablear identidad visual explícita del consumidor                          |
| `navigation`    | aceptar navegación ya preparada por la aplicación; no calcular permisos    |
| `context`       | aceptar proyección visual ya resuelta; no decidir sede, área, turno o rol  |
| `notices`       | aceptar avisos preparados; no iniciar ni terminar simulación               |
| `headerActions` | componer utilidades aprobadas; no resolver sesión o catálogo por su cuenta |
| `children`      | preservar la superficie empresarial local                                  |

No se introducen props alternativas para conservar acoplamientos del `VentoChrome` histórico.

---

#### 20. Frontera con autorización y contexto

El scaffold no genera:

- matrices de permisos;
- `NAV_GROUPS` con permisos hardcodeados;
- role overrides cliente;
- cookies de autoridad;
- resolución de sede desde query parameters;
- `canOperate` local;
- `OperatingGate` como autoridad del AppShell;
- casts de strings legacy a contratos canónicos.

Cuando la composición necesite contexto o autorización compartidos, se consumirá la release exacta de `@vento/os-context` y los contratos exactos aplicables.

La aplicación conserva sus adapters y composición locales cuando su responsabilidad así lo exige, pero no reimplementa el SDK compartido.

---

#### 21. Frontera con Supabase

El scaffold no copia:

```text
src/lib/supabase/client
src/lib/supabase/server
```

ni otros helpers desde NEXO.

La frontera futura utiliza `@vento/supabase` cuando la composición requiera capacidades compartidas de acceso técnico.

`@vento/ui-web` y `AppShell` no reciben dependencia directa de Supabase.

Cualquier cambio de esquema, RPC, RLS, datos, Storage, Realtime, Edge Functions, configuración o secretos permanece fuera de `SHELL-MIG-004` y, si pertenece a VENTO, se materializa exclusivamente desde `vento-shell` mediante su tarea propietaria.

---

#### 22. Frontera con navegación

La navegación del template histórico no se usa como seed de nuevos consumidores.

El scaffold no genera:

- rutas NEXO;
- grupos NEXO;
- permisos NEXO;
- descripciones NEXO;
- lógica `required` / `anyOf` heredada;
- acceso calculado desde RPC dentro del chrome.

La futura composición consume la superficie de navegación aprobada por su tarea propietaria y recibe únicamente la proyección que la aplicación esté autorizada a presentar.

---

#### 23. Política de archivos existentes

La sustitución elimina el comportamiento de sobrescritura ciega.

Reglas:

1. un archivo existente no se modifica si el scaffold no puede demostrar su baseline;
2. una salida creada por una versión anterior del scaffold debe poder vincularse a esa versión y a su configuración;
3. una actualización calcula diferencias antes de modificar;
4. un archivo con cambios locales no atribuibles al scaffold bloquea la actualización automática;
5. la ejecución no borra extensiones locales para forzar convergencia;
6. un conflicto produce estado bloqueado y no una sobrescritura parcial;
7. un resultado parcial no se considera scaffold válido;
8. el scaffold no utiliza una opción equivalente a `Force` para saltar estas reglas.

---

#### 24. Reproducibilidad e idempotencia

Bajo las mismas entradas exactas:

```text
mismo scaffold
+
mismo commit base
+
misma configuración
+
mismas versiones e integridades de packages
→ mismo conjunto lógico de salidas
→ mismas dependencias
→ mismos archivos generados
→ mismas huellas de archivos generados
```

Una segunda ejecución sobre una salida intacta deberá producir diff vacío o una confirmación equivalente de convergencia.

Se considera fallo de reproducibilidad si:

- cambia una salida sin cambiar entrada o versión del scaffold;
- resuelve otra versión de package;
- depende de hora, red no versionada o contenido flotante;
- el orden de ejecución altera el resultado;
- genera archivos adicionales no declarados;
- muta datos externos como efecto lateral.

---

#### 25. Manifest de resultado y procedencia

Cada ejecución física futura deberá emitir evidencia resoluble con, como mínimo:

| Campo lógico         | Evidencia requerida                                         |
| -------------------- | ----------------------------------------------------------- |
| versión del scaffold | identidad exacta utilizada                                  |
| repositorio fuente   | `devVentoGroup/vento-shell`                                 |
| commit fuente        | commit exacto del scaffold                                  |
| huella del scaffold  | integridad del artefacto ejecutado                          |
| consumidor           | repositorio objetivo                                        |
| commit base          | baseline previo del consumidor                              |
| aplicación           | `AppCode` validado                                          |
| packages             | nombres y versiones exactas utilizadas                      |
| integridades         | valores resueltos por registry/lockfile                     |
| compatibilidad       | referencias de matriz aplicables                            |
| configuración        | huella de la configuración efectiva                         |
| archivos generados   | conjunto exacto de paths afectados                          |
| huellas de salida    | integridad de archivos generados o actualizados             |
| manifest/lockfile    | huellas resultantes de `package.json` y `package-lock.json` |
| rollback             | snapshot previo restituible                                 |

Esta tarea define el contenido mínimo, no inventa el nombre o ubicación física de ese manifest.

---

#### 26. Gates previos a una ejecución certificable

El scaffold solo podrá materializar un consumidor cuando se cumplan acumulativamente:

1. scaffold físico autorizado y versionado;
2. artefacto de scaffold inmutable e identificable;
3. commit base exacto del consumidor;
4. `AppCode` válido;
5. configuración completa;
6. APIs públicas requeridas materializadas;
7. releases exactas de packages disponibles;
8. integridad de esas releases verificable;
9. matriz de compatibilidad aplicable sin estado pendiente o incompatible;
10. snapshot de rollback disponible;
11. ausencia de archivos legacy nuevos fuera del inventario;
12. posibilidad de producir la salida sin copiar implementación runtime compartida;
13. `package.json` y lockfile reconciliables;
14. validaciones del consumidor definidas;
15. ningún conflicto local no resuelto en archivos administrados.

Fallar una condición bloquea la ejecución; no activa un modo degradado de copia.

---

#### 27. Observabilidad del lote

La ejecución deberá permitir reconstruir:

- versión y commit del scaffold;
- repositorio y commit base del consumidor;
- packages y versiones efectivas;
- integridades de resolución;
- configuración efectiva;
- archivos creados, modificados u omitidos;
- razones de omisión o bloqueo;
- diff respecto al baseline;
- resultado de instalación y validaciones aplicables;
- snapshot de rollback;
- resultado de una segunda ejecución de idempotencia.

No se utilizará telemetría sensible para demostrar estas propiedades. La evidencia puede basarse en manifests, lockfile, hashes, logs técnicos seguros y resultados de CI.

---

#### 28. Estado y ciclo de vida del bootstrap/template legacy

La clasificación queda:

| Elemento                                     | Estado documental después de `SHELL-MIG-004` | Regla                                                               |
| -------------------------------------------- | -------------------------------------------- | ------------------------------------------------------------------- |
| `tools/bootstrap-app-shell.ps1`              | `LEGACY_FROZEN`                              | no evoluciona como mecanismo ordinario de distribución              |
| `templates/app-shell-standard`               | `LEGACY_FROZEN`                              | fuente histórica y rollback controlado; no canon runtime            |
| README de copia                              | `LEGACY_FROZEN`                              | sus instrucciones de copiar fuente no gobiernan nuevos consumidores |
| futuras copias creadas desde esos artefactos | `PROHIBIDAS_COMO_NUEVA_ADOPCION`             | un nuevo consumidor debe usar el scaffold certificado cuando exista |
| scaffold sustituto                           | `ESPECIFICADO_NO_MATERIALIZADO`              | no puede declararse operativo hasta superar los gates de esta tarea |

Mientras el scaffold no exista físicamente, conservar los artefactos legacy en Git no constituye aprobación para crear nuevos consumidores con ellos.

Su conservación permite evidencia histórica y rollback del lote hasta que el sustituto esté certificado.

---

#### 29. Rollback

El rollback se define en dos momentos.

##### 29.1. Antes de certificar el scaffold sustituto

Si la materialización física del scaffold falla durante su desarrollo, se restaura el snapshot previo del repositorio productor que contiene el bootstrap y la plantilla históricos.

Esa restauración:

- recupera la capacidad previa para diagnóstico;
- no convierte la copia histórica en canal canónico;
- no autoriza nuevos consumidores;
- conserva la evidencia de la falla.

##### 29.2. Después de una adopción certificada por consumidor

El rollback de un consumidor restaura conjuntamente:

```text
commit previo del consumidor
+
package.json previo
+
package-lock.json previo
+
configuración local previa
+
entrypoints locales previos
```

No se reconstruye el estado copiando archivos desde el template histórico.

No se mueve una versión publicada ni se edita `node_modules`.

---

#### 30. Criterios de suspensión

El lote se suspende inmediatamente cuando ocurra cualquiera de estos casos:

1. el scaffold copia `vento-chrome.tsx`, `ui.tsx`, `table.tsx`, `app-switcher.tsx` o `profile-menu.tsx` como implementación runtime;
2. copia helpers auth o Supabase desde NEXO u otro consumidor;
3. resuelve un package con rango flotante o identidad no estable;
4. usa un package privado/transitorio como si fuera release estable;
5. genera una ruta, permiso, app list, role override o sede autoritativa desde el template;
6. necesita una API pública que todavía no existe;
7. no existe compatibilidad verificable con el consumidor exacto;
8. cambia archivos no declarados;
9. sobrescribe un archivo local con cambios no atribuibles al scaffold;
10. una segunda ejecución cambia la salida sin cambio de entradas;
11. el build o las pruebas aplicables del consumidor fallan por el cambio;
12. el rollback no puede restaurar el snapshot anterior;
13. aparece una nueva fuente runtime duplicada;
14. la configuración efectiva no puede reconstruirse desde evidencia;
15. se requiere una modificación Supabase no materializada por su tarea propietaria.

No existe bypass documental para estas condiciones.

---

#### 31. Handoff hacia adopción de UI

`SHELL-MIG-004` prepara el mecanismo, pero no migra las siete aplicaciones.

`SHELL-MIG-005` conserva la responsabilidad de adoptar las superficies UI compartidas por aplicación.

Antes de esa adopción, el scaffold deberá permitir que cada consumidor:

- conserve `layout.tsx` y `globals.css` como entrypoints locales;
- conserve un compositor local cuando corresponda;
- instale `@vento/ui-web` y demás packages requeridos mediante versiones exactas;
- componga AppShell sin copiar su implementación;
- mantenga navegación, contexto, avisos y acciones empresariales en sus propietarios;
- conserve rollback por repositorio.

La existencia documental de este contrato no adelanta `SHELL-MIG-005`.

---

#### 32. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Justificación:** el scaffold especializa obligaciones ya cubiertas: evitar copias manuales y deriva (`TREQ-SHELL-002`), exigir instalación y validación reproducibles (`TREQ-SHELL-005`), compatibilidad por consumidor (`TREQ-SHELL-006`), rollback independiente (`TREQ-SHELL-007`), preservar la plantilla como fuente y no runtime (`TREQ-SHELL-029`), impedir que navegación, autorización y componentes legacy se conviertan en estándar (`TREQ-SHELL-030..032`), evitar propagación de contenido defectuoso (`TREQ-SHELL-035`) y conservar identidad, deprecación y retiro controlados (`TREQ-SHELL-036..039`). No aparece una regla de comportamiento nueva que carezca de cobertura canónica.

---

#### 33. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                                                                                         |
| --------- | -------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | La tarea no materializa scaffold ni consumidor; no existe cambio físico sobre el que ejecutar un build atribuible.                                                                                                |
| LOCAL     | PASS           | La especificación reconcilia 8 de 8 archivos históricos, 3 salidas locales permitidas y 5 copias compartidas prohibidas, sin faltantes ni duplicados.                                                             |
| REMOTA    | PASS           | Se verificaron en `main` el bootstrap, el árbol completo de la plantilla, su README, `package.json`, el único workspace físico `packages/os-context`, las dependencias canónicas y el registro `04A_04_SHELL.md`. |
| OPERATIVA | NOT_APPLICABLE | No existe scaffold físico autorizado ni ejecución sobre un consumidor en esta fase documental.                                                                                                                    |
| FÍSICA    | NOT_APPLICABLE | No se crean, modifican o retiran archivos runtime, packages, consumidores, despliegues ni objetos Supabase.                                                                                                       |

---

#### 34. Criterios de aceptación

`SHELL-MIG-004` queda documentalmente completa porque:

- [x] conserva exactamente el lote `devVentoGroup/vento-shell / SHELL-MIG-004`;
- [x] reconcilia `tools/bootstrap-app-shell.ps1` y `templates/app-shell-standard` como el mecanismo legacy gobernado;
- [x] reconcilia los ocho archivos físicos actuales sin faltantes;
- [x] aclara la relación entre ocho archivos y siete módulos TSX más una hoja de estilo;
- [x] sustituye el modelo de copia por dependencias versionadas y composición local;
- [x] fija versión e identidad inmutables para el scaffold sin inventar una release física inexistente;
- [x] exige versiones exactas e integridad de cada package requerido;
- [x] exige compatibilidad del consumidor antes de una ejecución certificable;
- [x] prohíbe ranges flotantes, Git, `file:`, `link:` y workspace como canal de release del consumidor;
- [x] mantiene `layout.tsx`, `globals.css` y `vento-shell.tsx` como salidas locales propietarias;
- [x] prohíbe copiar `vento-chrome.tsx`, `ui.tsx`, `table.tsx`, `app-switcher.tsx` y `profile-menu.tsx`;
- [x] prohíbe copiar helpers auth y Supabase desde NEXO;
- [x] elimina la derivación automática de `AppCode` desde nombre de aplicación;
- [x] elimina la tabla de paletas como fuente del generador;
- [x] elimina `SetActiveApp` como operación del scaffold;
- [x] elimina la sobrescritura ciega equivalente a `Force`;
- [x] define configuración explícita sin inventar un path físico para ella;
- [x] define manifest de resultado y procedencia sin inventar nombre de archivo;
- [x] define reproducibilidad e idempotencia;
- [x] define gate fail-closed antes de materialización;
- [x] define observabilidad suficiente para reconstruir cada ejecución;
- [x] congela bootstrap/template legacy como recuperación controlada y no como distribución canónica;
- [x] define rollback antes y después de adopción;
- [x] define criterios concretos de suspensión;
- [x] no ejecuta migraciones ni adelanta `SHELL-MIG-005`;
- [x] no crea ni modifica `TREQ-*`;
- [x] no modifica Supabase ni ningún repositorio consumidor.

---

#### 35. Límites y fuera de alcance

Esta tarea no:

- crea físicamente el scaffold;
- asigna una ruta nueva al scaffold;
- asigna un nombre de archivo nuevo al scaffold;
- asigna su primera versión concreta o tag;
- materializa `@vento/contracts`, `@vento/supabase` o `@vento/ui-web`;
- convierte `@vento/os-context@0.1.0` en release estable;
- publica packages;
- modifica `package.json` o `package-lock.json` de consumidores;
- genera los tres entrypoints locales;
- elimina el bootstrap o la plantilla históricos;
- modifica las seis copias runtime existentes;
- migra SHELL, VISO, NEXO, FOGO, ORIGO, PULSO o NUMERA;
- define la API física de exports de los packages;
- define rutas o navegación empresarial de una aplicación;
- modifica autenticación, autorización, simulación, contexto o sesiones;
- modifica SQL, migraciones, RLS, RPC, Realtime, Storage, Edge Functions, datos, configuración o secretos de Supabase;
- ejecuta builds, despliegues o pruebas operativas de un scaffold inexistente;
- crea nuevos requisitos de prueba;
- inicia `SHELL-MIG-005`.

---

#### 36. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-MIG-003 — Preparar compatibilidad y bloqueo de nuevos consumidores legacy`

**TAREA ACTUAL APROBADA**
`SHELL-MIG-004 — Sustituir la plantilla histórica por scaffold versionado`

**SIGUIENTE TAREA RESERVADA**
`SHELL-MIG-005 — Migrar componentes, Chrome y estilos por aplicación`


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
