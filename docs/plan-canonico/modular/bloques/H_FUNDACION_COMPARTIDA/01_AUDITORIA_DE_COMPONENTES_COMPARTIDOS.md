### MINI-BLOQUE — AUDITORÍA DE COMPONENTES COMPARTIDOS

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **auditoría de componentes compartidos** dentro de **H FUNDACION COMPARTIDA**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `SHELL-AUD-001` a `SHELL-AUD-011` — 11 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Límites funcionales:** comienza con “Buscar código duplicado entre repositorios” y concluye con “Clasificar y retirar rutas, componentes, funciones, scripts y endpoints sin consumidores confirmados”.
<!-- PLAN-SECTION-META:END -->

### ✅ SHELL-AUD-001 — Buscar código duplicado entre repositorios

**Estado:** APROBADA
**Bloque:** H — Fundación compartida
**Tipo:** auditoría transversal de identidad, distribución y deriva de la fundación compartida
**Entrada de continuidad:** `H-SHARED-AUDIT-001`
**Continuidad reservada:** `SHELL-AUD-002 — Comparar guards de autenticación`
**Fecha de corte:** 2026-08-01
**Cambios en código, CI, despliegues o Supabase:** no autorizados ni realizados

---

#### 1. Resultado de esta tarea

Esta tarea materializa el inventario reproducible de código candidato a fundación compartida antes de comparar su comportamiento o decidir su arquitectura final.

| Métrica                                                |      Resultado |
| ------------------------------------------------------ | -------------: |
| Repositorios canónicos evaluados                       |         **12** |
| Repositorios fuente o consumidores runtime del alcance |          **7** |
| Fuentes físicas adicionales de plantilla               |          **1** |
| Familias de archivo candidatas                         |         **26** |
| Familias con duplicación confirmada                    |         **22** |
| Familias localizadas en un solo consumidor             |          **4** |
| Decisiones de presencia materializadas                 | **190 de 190** |
| Ocurrencias presentes en la matriz                     |        **136** |
| Ausencias runtime explícitas en la matriz              |         **54** |
| Familias duplicadas idénticas                          |          **1** |
| Familias duplicadas mixtas                             |          **8** |
| Familias duplicadas divergentes                        |          **6** |
| Familias con distribución parcial divergente           |          **3** |
| Familias con distribución parcial mixta                |          **3** |
| Familias con distribución parcial idéntica             |          **1** |

La tarea no declara que una variante sea correcta ni ordena centralizarla. La comparación semántica y la decisión `compartir / generar / mantener local` permanecen reservadas a las tareas posteriores del mismo mini-bloque.

---

#### 2. Fuentes canónicas y corte reproducible

La auditoría usa como fuente documental `vento-shell` en el commit `d07dedba8842bf95b240686c2177483495a78ad8` y conserva el commit exacto de cada repositorio inspeccionado.

| Fuente                                              | Uso                                                    |
| --------------------------------------------------- | ------------------------------------------------------ |
| `docs/plan-canonico/modular/01_PROTOCOLO.md`        | reglas de continuidad, entrega, trazabilidad y pruebas |
| `docs/plan-canonico/modular/delivery-contract.json` | contrato físico del artefacto                          |
| `docs/plan-canonico/modular/active-sequence.json`   | handoff vigente hacia `SHELL-AUD-001`                  |
| `01_AUDITORIA_DE_COMPONENTES_COMPARTIDOS.md`        | propietario y límites del mini-bloque                  |
| `CODE-AUD-001`                                      | universo de doce repositorios                          |
| `CODE-AUD-013` y `CODE-AUD-014`                     | evidencia previa de copias, legacy y divergencia       |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`  | requisitos vigentes y cobertura preexistente           |
| `templates/app-shell-standard/README.md`            | identidad declarada de la plantilla                    |
| `tools/bootstrap-app-shell.ps1`                     | lista física de archivos copiados                      |
| `docs/APP-SHELL-ESTANDARES.md`                      | estándar histórico de adopción por copia               |

---

#### 3. Límite exacto de la auditoría

Se incluye código que cumple al menos una de estas condiciones:

1. forma parte de los ocho archivos administrados por el bootstrap oficial;
2. es una dependencia esperada por la plantilla;
3. fue identificado por `CODE-AUD-013` o `CODE-AUD-014` como responsabilidad transversal copiada;
4. implementa autenticación, permisos, contexto operativo, role override, AppShell, UI base, cliente Supabase o frontera middleware/proxy en `vento-shell` o en los seis consumidores web operativos.

Se excluyen de esta tarea:

- duplicación interna de lógica de negocio propia de una sola aplicación;
- dependencias de terceros, archivos generados, lockfiles y boilerplate del framework;
- similitud visual sin responsabilidad compartida;
- código móvil que requiera un contrato distinto del AppShell web;
- evaluación de corrección semántica, seguridad o destino arquitectónico final.

---

#### 4. Método de clasificación

| Estado                            | Criterio                                                                                 |
| --------------------------------- | ---------------------------------------------------------------------------------------- |
| `DUPLICADA_IDENTICA`              | dos o más ocurrencias con un solo blob SHA                                               |
| `DUPLICADA_MIXTA`                 | existen grupos byte-idénticos y también variantes distintas                              |
| `DUPLICADA_DIVERGENTE`            | todas las ocurrencias inspeccionadas tienen blob SHA diferente                           |
| `DISTRIBUCION_PARCIAL_DIVERGENTE` | el archivo existe solo en parte de los consumidores y las ocurrencias presentes difieren |
| `DISTRIBUCION_PARCIAL_MIXTA`      | existe solo en parte del universo y combina grupos idénticos con variantes distintas     |
| `DISTRIBUCION_PARCIAL_IDENTICA`   | existe solo en parte del universo y todas las ocurrencias presentes son idénticas        |
| `UNICA_EN_EL_CORTE`               | una sola ocurrencia confirmada; no constituye duplicación exacta de ruta                 |

La igualdad de blob demuestra identidad byte a byte. La diferencia de blob demuestra únicamente diferencia de contenido; no determina por sí sola si la diferencia es válida.

La búsqueda se ejecutó en dos pasadas reproducibles sobre los commits de la matriz:

1. enumeración de archivos versionados con `git ls-tree -r --name-only <commit>` dentro de `src/components/vento/standard`, `src/lib/auth`, `src/lib/supabase`, `src/utils/supabase`, `middleware.ts`, `src/app/layout.tsx` y `src/app/globals.css`;
2. búsqueda de responsabilidades con `git grep -l -E` para `VentoShell`, `ROLE_OVERRIDE_COOKIE`, `createBrowserClient`, `createServerClient`, `checkOperationalPermission`, `operational-session` y `updateSession`.

La segunda pasada localizó ocho familias que el inventario inicial no contenía: `page-header`, `vento-logo`, `request-host`, `shared-device-signature`, `sso`, `admin`, `employee-sites` y el cliente alterno `src/utils/supabase/client.ts`. Los archivos de rutas empresariales que coinciden únicamente por consumir `createServerClient` no se clasifican como fundación compartida; permanecen en su dominio propietario.

---

#### 5. Matriz completa de repositorios

| ID        | Repositorio       | Remoto                        | Commit inspeccionado                       | Estado en esta tarea  | Decisión                                                                                    |
| --------- | ----------------- | ----------------------------- | ------------------------------------------ | --------------------- | ------------------------------------------------------------------------------------------- |
| `REPO-01` | `vento-shell`     | `devVentoGroup/vento-shell`   | `d07dedba8842bf95b240686c2177483495a78ad8` | `FUENTE_Y_RUNTIME`    | Plantilla y bootstrap; su runtime aporta además layout, estilos, middleware y clientes Supabase propios. |
| `REPO-02` | `vento-viso`      | `devVentoGroup/vento-viso`    | `47322403f3c64e83ae0c4a2f68c05d47093e5bb4` | `CONSUMIDOR_RUNTIME`  | Aplicación web consumidora de la fundación copiada.                                         |
| `REPO-03` | `vento-nexo`      | `devVentoGroup/vento-nexo`    | `142c4d696221e3ce3fda4ed3b62f3d1fe5b58799` | `CONSUMIDOR_RUNTIME`  | Aplicación web consumidora y referencia histórica de varios helpers.                        |
| `REPO-04` | `vento-fogo`      | `devVentoGroup/vento-fogo`    | `b6b9ed00e5267cabaac1a5a1090d93d5f60e86f2` | `CONSUMIDOR_RUNTIME`  | Aplicación web consumidora de la fundación copiada.                                         |
| `REPO-05` | `vento-origo`     | `devVentoGroup/vento-origo`   | `b7a8303fa078ef087f522b6c99059ababfc27472` | `CONSUMIDOR_RUNTIME`  | Aplicación web consumidora de la fundación copiada.                                         |
| `REPO-06` | `vento-pulso`     | `devVentoGroup/vento-pulso`   | `71e0184486b5fe11e0a42435baf4024807a80efd` | `CONSUMIDOR_RUNTIME`  | Aplicación web consumidora con distribución parcial de middleware/proxy.                    |
| `REPO-07` | `vento-numera`    | `devVentoGroup/vento-numera`  | `1b48a5da425d92e19ed89cf175b1dccc4cd960e1` | `CONSUMIDOR_RUNTIME`  | Aplicación web consumidora de la fundación copiada.                                         |
| `REPO-08` | `vento-group-web` | `devVentoGroup/Vento-Group`   | `604227aa0c36eda7bb7cf55f66369aa664f4290f` | `NO_APLICA_AL_CORTE`  | Web pública; no es consumidora del AppShell operativo evaluado.                             |
| `REPO-09` | `vento-anima`     | `devVentoGroup/vento-anima`   | `50b77742cc0ae85f873d42152108a50acc9d6964` | `NO_APLICA_AL_CORTE`  | Aplicación Expo móvil con superficies web auxiliares; requiere contrato móvil propio.       |
| `REPO-10` | `vento-pass`      | `devVentoGroup/vento-pass`    | `b5a4aec908ef12226f798078577ab089a29ccda2` | `NO_APLICA_AL_CORTE`  | Aplicación Expo móvil de cliente; no consume el AppShell web operativo.                     |
| `REPO-11` | `vento-talento`   | `devVentoGroup/vento-talento` | `dd39071daf587e3f006df62b646f8ad4b1b8de2c` | `NO_APLICA_AL_CORTE`  | Base Expo futura sin despliegue; no consume el AppShell web operativo.                      |
| `REPO-12` | `vento-vital`     | `devVentoGroup/vento-vital`   | `92d43bfac1f42d379928608005375a4b09bb04a4` | `FUERA_DE_VENTO_OS`   | Proyecto separado según el inventario canónico.                                             |

**Conciliación:** 12 repositorios esperados, 12 materializados, 0 omitidos y 0 duplicados.

---

#### 6. Origen comprobado del bundle copiado

El bootstrap oficial administra ocho archivos físicos:

- `src/app/layout.tsx`;
- `src/app/globals.css`;
- `src/components/vento/standard/vento-shell.tsx`;
- `src/components/vento/standard/vento-chrome.tsx`;
- `src/components/vento/standard/ui.tsx`;
- `src/components/vento/standard/table.tsx`;
- `src/components/vento/standard/app-switcher.tsx`;
- `src/components/vento/standard/profile-menu.tsx`;

El script copia esos archivos desde `templates/app-shell-standard` hacia cada consumidor y después modifica paleta, metadata, nombre de aplicación, permisos, rutas y estado activo. Por tanto, la existencia de variantes es una consecuencia prevista del mecanismo de copia; la ausencia actual de un mecanismo automático de paridad deja la convergencia sin comprobar.

La plantilla se registra como **fuente**, no como superficie runtime de SHELL. En el corte no existe `src/components/vento/standard/vento-shell.tsx` dentro del runtime de `vento-shell`; la copia fuente vive bajo `templates/app-shell-standard`. Esto no excluye del inventario el runtime real de `vento-shell`: sus `layout.tsx`, `globals.css`, `middleware.ts` y clientes Supabase se contabilizan como ocurrencias separadas.

---

#### 7. Inventario de familias

| ID        | Ruta o responsabilidad                           | Ocurrencias | Variantes SHA | Clasificación                     | Destino obligatorio                                                                 |
| --------- | ------------------------------------------------ | ----------: | ------------: | --------------------------------- | ----------------------------------------------------------------------------------- |
| `FAM-001` | `src/app/layout.tsx`                             |       **8** |         **8** | `DUPLICADA_DIVERGENTE`            | `SHELL-AUD-006`; `SHELL-AUD-009`; `SHELL-AUD-010`                                   |
| `FAM-002` | `src/app/globals.css`                            |       **8** |         **8** | `DUPLICADA_DIVERGENTE`            | `SHELL-AUD-007`; `SHELL-AUD-010`                                                    |
| `FAM-003` | `src/components/vento/standard/vento-shell.tsx`  |       **7** |         **7** | `DUPLICADA_DIVERGENTE`            | `SHELL-AUD-004`; `SHELL-AUD-006`; `SHELL-AUD-009`; `SHELL-AUD-010`                  |
| `FAM-004` | `src/components/vento/standard/vento-chrome.tsx` |       **7** |         **7** | `DUPLICADA_DIVERGENTE`            | `SHELL-AUD-006`; `SHELL-AUD-009`; `SHELL-AUD-010`                                   |
| `FAM-005` | `src/components/vento/standard/ui.tsx`           |       **7** |         **3** | `DUPLICADA_MIXTA`                 | `SHELL-AUD-007`; `SHELL-AUD-010`                                                    |
| `FAM-006` | `src/components/vento/standard/table.tsx`        |       **7** |         **3** | `DUPLICADA_MIXTA`                 | `SHELL-AUD-007`; `SHELL-AUD-010`                                                    |
| `FAM-007` | `src/components/vento/standard/app-switcher.tsx` |       **7** |         **5** | `DUPLICADA_MIXTA`                 | `SHELL-AUD-006`; `SHELL-AUD-009`; `SHELL-AUD-010`                                   |
| `FAM-008` | `src/components/vento/standard/profile-menu.tsx` |       **7** |         **7** | `DUPLICADA_DIVERGENTE`            | `SHELL-AUD-004`; `SHELL-AUD-005`; `SHELL-AUD-006`; `SHELL-AUD-009`; `SHELL-AUD-010` |
| `FAM-009` | `src/lib/auth/guard.ts`                          |       **6** |         **3** | `DUPLICADA_MIXTA`                 | `SHELL-AUD-002`; `SHELL-AUD-009`; `SHELL-AUD-010`                                   |
| `FAM-010` | `src/lib/auth/permissions.ts`                    |       **6** |         **4** | `DUPLICADA_MIXTA`                 | `SHELL-AUD-003`; `SHELL-AUD-009`; `SHELL-AUD-010`                                   |
| `FAM-011` | `src/lib/auth/operational-session.ts`            |       **6** |         **1** | `DUPLICADA_IDENTICA`              | `SHELL-AUD-004`; `SHELL-AUD-009`; `SHELL-AUD-010`                                   |
| `FAM-012` | `src/lib/auth/role-override.ts`                  |       **6** |         **5** | `DUPLICADA_MIXTA`                 | `SHELL-AUD-003`; `SHELL-AUD-004`; `SHELL-AUD-005`; `SHELL-AUD-009`; `SHELL-AUD-010` |
| `FAM-013` | `src/lib/auth/role-override-config.ts`           |       **6** |         **6** | `DUPLICADA_DIVERGENTE`            | `SHELL-AUD-005`; `SHELL-AUD-009`; `SHELL-AUD-010`                                   |
| `FAM-014` | `src/lib/supabase/client.ts`                     |       **7** |         **5** | `DUPLICADA_MIXTA`                 | `SHELL-AUD-008`; `SHELL-AUD-010`                                                    |
| `FAM-015` | `src/lib/supabase/server.ts`                     |       **7** |         **6** | `DUPLICADA_MIXTA`                 | `SHELL-AUD-008`; `SHELL-AUD-010`                                                    |
| `FAM-016` | `middleware.ts`                                  |       **6** |         **6** | `DISTRIBUCION_PARCIAL_DIVERGENTE` | `SHELL-AUD-002`; `SHELL-AUD-008`; `SHELL-AUD-010`                                   |
| `FAM-017` | `src/lib/supabase/proxy.ts`                      |       **3** |         **3** | `DISTRIBUCION_PARCIAL_DIVERGENTE` | `SHELL-AUD-002`; `SHELL-AUD-008`; `SHELL-AUD-010`                                   |
| `FAM-018` | `src/lib/auth/operational-context.ts`            |       **1** |         **1** | `UNICA_EN_EL_CORTE`               | `SHELL-AUD-004`; `SHELL-AUD-009`; `SHELL-AUD-010`                                   |
| `FAM-019` | `src/components/vento/standard/page-header.tsx`  |       **2** |         **2** | `DISTRIBUCION_PARCIAL_DIVERGENTE` | `SHELL-AUD-007`; `SHELL-AUD-010`                                                    |
| `FAM-020` | `src/components/vento/standard/vento-logo.tsx`   |       **6** |         **5** | `DISTRIBUCION_PARCIAL_MIXTA`      | `SHELL-AUD-007`; `SHELL-AUD-010`                                                    |
| `FAM-021` | `src/lib/auth/request-host.ts`                   |       **1** |         **1** | `UNICA_EN_EL_CORTE`               | `SHELL-AUD-002`; `SHELL-AUD-009`; `SHELL-AUD-010`                                   |
| `FAM-022` | `src/lib/auth/shared-device-signature.ts`        |       **4** |         **1** | `DISTRIBUCION_PARCIAL_IDENTICA`   | `SHELL-AUD-004`; `SHELL-AUD-009`; `SHELL-AUD-010`                                   |
| `FAM-023` | `src/lib/auth/sso.ts`                            |       **6** |         **5** | `DISTRIBUCION_PARCIAL_MIXTA`      | `SHELL-AUD-002`; `SHELL-AUD-009`; `SHELL-AUD-010`                                   |
| `FAM-024` | `src/lib/supabase/admin.ts`                      |       **1** |         **1** | `UNICA_EN_EL_CORTE`               | `SHELL-AUD-008`; `SHELL-AUD-010`                                                    |
| `FAM-025` | `src/lib/supabase/employee-sites.ts`             |       **3** |         **2** | `DISTRIBUCION_PARCIAL_MIXTA`      | `SHELL-AUD-008`; `SHELL-AUD-009`; `SHELL-AUD-010`                                   |
| `FAM-026` | `src/utils/supabase/client.ts`                   |       **1** |         **1** | `UNICA_EN_EL_CORTE`               | `SHELL-AUD-008`; `SHELL-AUD-010`                                                    |

**Conciliación:** 26 identidades de familia, 26 materializadas, 0 omitidas y 0 duplicadas.

---

#### 8. Matriz de presencia y hashes

Se conservan los blob SHA completos de cada archivo presente. En la columna SHELL, `TPL` identifica la fuente bajo `templates/app-shell-standard` y `RUN` el runtime de `vento-shell`. Para `FAM-009` en adelante la plantilla es `NO_APLICA` y la celda representa `RUN`.

| ID        | Fuente SHELL                               | VISO                                       | NEXO                                       | FOGO                                       | ORIGO                                      | PULSO                                      | NUMERA                                     |
| --------- | ------------------------------------------ | ------------------------------------------ | ------------------------------------------ | ------------------------------------------ | ------------------------------------------ | ------------------------------------------ | ------------------------------------------ |
| `FAM-001` | TPL `58e2f2138d6d5bce7ad77f6f84a15f2f876862a9`<br>RUN `88f1dfdd36a831fd54a96ac0c047508f3e2b6013` | `5c0037c7a978a296161cc4d3b10deeda9461870b` | `85d9d8ec27bd8c81c2c03e8fb2368d012425bf93` | `8ab0fe774fba797cd88d30d94d7d46b314258776` | `408e33b3bb3901d84f1720ddcf295c8a1e2ba71c` | `edca10a3f71e3f6fad6b3801b33b883d4bf79416` | `e0e015ebd8b1342fd495d67c7cb550fcefce73d2` |
| `FAM-002` | TPL `a1bf4bea91e6a71188aa8c6f4c3dea1d838a372a`<br>RUN `ab981cbab29fba2bec954aa505a70235cabb3418` | `c8c2d74f60fe8f7e7ba8870944d0ab2959980a4c` | `f920142e5a23b2dc88cd3b0c4658481bc0bcef6e` | `017160673ca45cdff061bfb0aeff41b46847c32c` | `dbd3f044bd42124b5a2364b737d56f2a790476da` | `27562fde94c9b41585f2312a4ca49b80dc27ccc1` | `83d60962927a9e7b097c8f1075a7467850378f5b` |
| `FAM-003` | TPL `c9d4c7089c5369674c7e97d6c2c4531ec11b7522`<br>RUN AUSENTE | `8521d979bdc1626fb06946aa93067d67fdc35201` | `7d3da0dbbbbcd61def1f3d102fd3d2d62d9afcae` | `01728247836b8298609969fefa57fd04dc8359dc` | `9c462f9e7d9d86b177d7f7065c5a791ad1eb3ce9` | `b0bb653786919a88fa28e12f8d12194b92ea727e` | `1344d13b6487616fb6ee2ec06a81f61fc92b44c0` |
| `FAM-004` | TPL `7d5f7c119acdd819ff43c99333db24f99946adfa`<br>RUN AUSENTE | `0383159f207eaba9ae02f3dae5b597a77f991b09` | `c125fa99bb6733a31f3e6f788e09a9e94ff4845f` | `be3959756312537ca825ce6f3204fadd0f8735ed` | `95871809734b212b96b833b56dad0a93111f291d` | `23fe993deb97e7cbf30f2e5ac5bf341ff8111fc7` | `f83fb0f8d9ee168b9b3eaa666aef19c063267590` |
| `FAM-005` | TPL `073c2cf37cb3a12a68e9bfd844ab1e7a78e0be49`<br>RUN AUSENTE | `bf38c12d65dd7bcdad3750da6d75bda4392f329a` | `073c2cf37cb3a12a68e9bfd844ab1e7a78e0be49` | `073c2cf37cb3a12a68e9bfd844ab1e7a78e0be49` | `073c2cf37cb3a12a68e9bfd844ab1e7a78e0be49` | `073c2cf37cb3a12a68e9bfd844ab1e7a78e0be49` | `4e66b1768075114ac23c05c941b83e0ba78f6887` |
| `FAM-006` | TPL `0754a74221ee5441e0c2624c177865354586fd4b`<br>RUN AUSENTE | `e9c5286da9d73c828ef9931dca730afd1b43fc57` | `0754a74221ee5441e0c2624c177865354586fd4b` | `0754a74221ee5441e0c2624c177865354586fd4b` | `0754a74221ee5441e0c2624c177865354586fd4b` | `0754a74221ee5441e0c2624c177865354586fd4b` | `3cdf3dd9e1df9c364f4e8b549a660038d6b4a15e` |
| `FAM-007` | TPL `11d786b6327b4016fdd6e2354e0e6283cb8334e6`<br>RUN AUSENTE | `888f3d20bd317ff4234861c11237b1144e3a8ad8` | `ea05dd60eef2e23427a4ee421aa279a88c5f4739` | `839d6cc9dc984f526ced166611af6b47ca8c6f23` | `ea05dd60eef2e23427a4ee421aa279a88c5f4739` | `ea05dd60eef2e23427a4ee421aa279a88c5f4739` | `ee23b7a3e2cceb8f61e6b86faf80f3ece19f3d87` |
| `FAM-008` | TPL `622a64f92c649f1d90d51b7122b92dbb99441d28`<br>RUN AUSENTE | `278bb9b9f36ff83c881a699292968556f8325813` | `d9958714181dd8b833952455507f5fec7365adb3` | `86f0057ae64ed6a8691c5dd9ecddfad644061743` | `4f54cdb3a2987c474e71392889545b0c2690d2d9` | `b25e6ca1d6fead9cbc388c31df0551cdab518756` | `bf0d1c7c34aedbd3b410807e1a9d20ec71c4f277` |
| `FAM-009` | AUSENTE                                    | `2b580475c7d37842c225418c6696fbddb3887407` | `d7678139cb7061a3b58d7da87ac0a7ad91b296c3` | `d7678139cb7061a3b58d7da87ac0a7ad91b296c3` | `d7678139cb7061a3b58d7da87ac0a7ad91b296c3` | `ae708911c06e0bae35dead2343879d69ec23ee5b` | `d7678139cb7061a3b58d7da87ac0a7ad91b296c3` |
| `FAM-010` | AUSENTE                                    | `fa81328fe4fd5ec2dd8ffd67f09b0e76578c99cd` | `a5a2b7e6f914075d78cc72a9b016994f5a102dde` | `a5a2b7e6f914075d78cc72a9b016994f5a102dde` | `a5a2b7e6f914075d78cc72a9b016994f5a102dde` | `8087fbe3b949c9b8fe553f1d1d76ef4da169bd22` | `a5b1debdfbc30c5d302f1bdc933cd832b759f856` |
| `FAM-011` | AUSENTE                                    | `ea2310bfda5b6981dba2f2549a69f18229af76ac` | `ea2310bfda5b6981dba2f2549a69f18229af76ac` | `ea2310bfda5b6981dba2f2549a69f18229af76ac` | `ea2310bfda5b6981dba2f2549a69f18229af76ac` | `ea2310bfda5b6981dba2f2549a69f18229af76ac` | `ea2310bfda5b6981dba2f2549a69f18229af76ac` |
| `FAM-012` | AUSENTE                                    | `e05084310ca54b2371f5bdb341734de25141609a` | `8a7556f84020b687cccee116ab4dbe97f40d915e` | `e58e16acf0d913a08359c74a002ca4e1776c2e1b` | `e58e16acf0d913a08359c74a002ca4e1776c2e1b` | `385382cf161bfd19071511dac65c3faa298b95e4` | `5b8515a7db9cebe8dd8c63ff3116762ecd0e26e7` |
| `FAM-013` | AUSENTE                                    | `c69bf0ff337183280ebf223905e5a586dc589285` | `86efeea41d7eb822364758adaef047d6dec929fb` | `850f96098daa3dc917689524f14469968b2d4a19` | `199add73d195739f9a3b4816ad4281530b1e520e` | `a2c92a2020d5bae530d66f316c24de5f2a1224a7` | `61f4041e5bfbf05b85ccc78597cce0119ecf10d2` |
| `FAM-014` | `1bc24c115914ffae21ddfcaecf1876d8fb8b6f14` | `dfed99c57cf1772c561b1f979cb948e564ad973a` | `eae6ae4a4ee970ab760ed771b0dc4a5d79ca7b22` | `eae6ae4a4ee970ab760ed771b0dc4a5d79ca7b22` | `eae6ae4a4ee970ab760ed771b0dc4a5d79ca7b22` | `1306e2e4ef77265722d983f28e123bbac320d9f5` | `23215c75eea9b51fa5b8e920a84d3ed20bda48ba` |
| `FAM-015` | `cffa5fd4faf351a44a382cfc4319617ec953341a` | `f01589daefdd141a496d0d81a34ecdd7bf1e09fa` | `87d3638e1ce1d9751800def61f14dd7945d601a2` | `a5da4960b0d50c5436ffdf9ff1e7f199f4d98bdb` | `a5da4960b0d50c5436ffdf9ff1e7f199f4d98bdb` | `05743f75577d79c4ebe3bd5b81c944627e00fc35` | `46d1ad65d091e9a204bee938e37193178dc80c5d` |
| `FAM-016` | `862d185fd1bbc8101ed87db5e286d6b0b0dde659` | `3099628a445dca9c401b87441b3c05c24894161d` | `3db2c7e31dcada218a8e8cd1efc41db8c899b1d7` | `596e62e2716a32e3acea3e79c79b60c7762271f2` | `0420a23343af1ab60055f090891823f6860afc00` | AUSENTE                                    | `499444d0e05d0beb0824b0e6a964fa1d199cdbb7` |
| `FAM-017` | AUSENTE                                    | `d02cbb7582f711f5d8e8ac535885faa548bf995e` | `924419c77afff452ed3b13385fbf1c6016e4a34a` | AUSENTE                                    | AUSENTE                                    | `759477c537f3dc3e247d427418027affce07b707` | AUSENTE                                    |
| `FAM-018` | AUSENTE                                    | AUSENTE                                    | `d4355b544a5d9f37eb77b8bf56ff4e281dd73840` | AUSENTE                                    | AUSENTE                                    | AUSENTE                                    | AUSENTE                                    |
| `FAM-019` | AUSENTE                                    | `d171b312fab0794470ff18965b88e6452695fb19` | `f7af0dc287f458ff26a91711442bedfb823a6542` | AUSENTE                                    | AUSENTE                                    | AUSENTE                                    | AUSENTE                                    |
| `FAM-020` | AUSENTE                                    | `9c05cd4f6467f1f956a8d57f23a68a0a46df012e` | `a9f31cee67e90bf5f494708aba7d1a0b9339b18f` | `eb36c210a098db84d80856e2def237fa0c625074` | `1d041cfa3678bc5372bbed4b60f0bf9a2171334c` | `a9f31cee67e90bf5f494708aba7d1a0b9339b18f` | `83e22703ad5a28a5498a1232aaf6bafe3eaaf12c` |
| `FAM-021` | AUSENTE                                    | AUSENTE                                    | `bcdc389773d032b6b3e5bebc5bdbf2606daa3e7c` | AUSENTE                                    | AUSENTE                                    | AUSENTE                                    | AUSENTE                                    |
| `FAM-022` | AUSENTE                                    | AUSENTE                                    | `89610936608eaa667a79c7739f72e968397d211c` | `89610936608eaa667a79c7739f72e968397d211c` | `89610936608eaa667a79c7739f72e968397d211c` | `89610936608eaa667a79c7739f72e968397d211c` | AUSENTE                                    |
| `FAM-023` | AUSENTE                                    | `b328a8334d8d3dfe996c027b030cb783cce265ed` | `60faf6ceb4015a1cf8a67aedad9bfeeacb6ec95b` | `02e431fffa211166224d5f2125b5e5cacc276b12` | `02e431fffa211166224d5f2125b5e5cacc276b12` | `f50fbe3df2c7b49487eba7e1aa5acf2bc8aef427` | `dcfaec37d95c0d5e85fb69ca5282c7430fd03abb` |
| `FAM-024` | AUSENTE                                    | `0c46abd8a9e9a1e17fa3077cf83a883085484850` | AUSENTE                                    | AUSENTE                                    | AUSENTE                                    | AUSENTE                                    | AUSENTE                                    |
| `FAM-025` | AUSENTE                                    | AUSENTE                                    | AUSENTE                                    | `d192e36a34afc313dc403348a36f17fefafb33f3` | `d192e36a34afc313dc403348a36f17fefafb33f3` | AUSENTE                                    | `fd925fa50a6400736100067de4114d1f2c6dc62e` |
| `FAM-026` | AUSENTE                                    | AUSENTE                                    | AUSENTE                                    | AUSENTE                                    | AUSENTE                                    | `34f32531942ea177f5a8f6bb1990ebc303855626` | AUSENTE                                    |

Conciliación de presencia:

- plantilla oficial: 8 decisiones, 8 presentes y 0 ausentes;
- runtime de los siete repositorios: 182 decisiones, 128 presentes y 54 ausentes;
- total: 190 decisiones, 136 presentes y 54 ausencias runtime;
- cada ausencia está materializada como `AUSENTE`, no como celda desconocida.

---

#### 9. Grupos de identidad byte a byte

| Familia   | Grupo idéntico confirmado               |
| --------- | --------------------------------------- |
| `FAM-005` | plantilla, NEXO, FOGO, ORIGO y PULSO    |
| `FAM-006` | plantilla, NEXO, FOGO, ORIGO y PULSO    |
| `FAM-007` | NEXO, ORIGO y PULSO                     |
| `FAM-009` | NEXO, FOGO, ORIGO y NUMERA              |
| `FAM-010` | NEXO, FOGO y ORIGO                      |
| `FAM-011` | VISO, NEXO, FOGO, ORIGO, PULSO y NUMERA |
| `FAM-012` | FOGO y ORIGO                            |
| `FAM-014` | NEXO, FOGO y ORIGO                      |
| `FAM-015` | FOGO y ORIGO                            |
| `FAM-020` | NEXO y PULSO                            |
| `FAM-022` | NEXO, FOGO, ORIGO y PULSO               |
| `FAM-023` | FOGO y ORIGO                            |
| `FAM-025` | FOGO y ORIGO                            |

Las demás coincidencias de nombre de archivo tienen contenido diferente en todas sus ocurrencias o están distribuidas parcialmente.

---

#### 10. Observaciones que requieren comparación posterior

| ID        | Observación comprobada                                                                                                    | Conclusión permitida en esta tarea                                                                                         | Destino                                                            |
| --------- | ------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------ |
| `OBS-001` | `operational-session.ts` conserva el mismo blob en los seis consumidores.                                                 | Duplicación idéntica confirmada; no se decide todavía su forma de distribución.                                            | `SHELL-AUD-004`, `SHELL-AUD-009`, `SHELL-AUD-010`                  |
| `OBS-002` | `ui.tsx` y `table.tsx` conservan un grupo idéntico entre plantilla, NEXO, FOGO, ORIGO y PULSO; VISO y NUMERA divergen.    | Duplicación mixta confirmada.                                                                                              | `SHELL-AUD-007`, `SHELL-AUD-010`                                   |
| `OBS-003` | FOGO declara `ROLE_OVERRIDE_COOKIE = "origo_role_override"`; PULSO declara `ROLE_OVERRIDE_COOKIE = "nexo_role_override"`. | Se registra la diferencia literal; esta tarea no determina si es defecto, compatibilidad deliberada o código no consumido. | `SHELL-AUD-005`, `SHELL-AUD-009`, `SHELL-AUD-010`                  |
| `OBS-004` | PULSO no contiene `middleware.ts` en el commit inspeccionado.                                                             | Distribución parcial confirmada; no se infiere ausencia de protección sin comparar su frontera real.                       | `SHELL-AUD-002`, `SHELL-AUD-008`, `SHELL-AUD-010`                  |
| `OBS-005` | `src/lib/supabase/proxy.ts` existe en VISO, NEXO y PULSO, y no existe en FOGO, ORIGO ni NUMERA.                           | Distribución parcial confirmada.                                                                                           | `SHELL-AUD-002`, `SHELL-AUD-008`, `SHELL-AUD-010`                  |
| `OBS-006` | `src/lib/auth/operational-context.ts` existe únicamente en NEXO.                                                          | No es duplicación exacta de ruta; su responsabilidad transversal debe compararse con contexto embebido en otros archivos.  | `SHELL-AUD-004`, `SHELL-AUD-009`, `SHELL-AUD-010`                  |
| `OBS-007` | Las seis copias de `vento-shell.tsx` y la plantilla tienen blobs distintos.                                               | La familia está distribuida y divergente; no se presume que toda diferencia sea incorrecta.                                | `SHELL-AUD-004`, `SHELL-AUD-006`, `SHELL-AUD-009`, `SHELL-AUD-010` |
| `OBS-008` | El runtime de `vento-shell` contiene clientes Supabase y middleware propios, con blobs distintos de los consumidores.      | SHELL participa en la comparación de frontera y cliente; su condición de fuente de plantilla no lo excluye como runtime.   | `SHELL-AUD-002`, `SHELL-AUD-008`, `SHELL-AUD-010`                  |
| `OBS-009` | `shared-device-signature.ts` es byte-idéntico en NEXO, FOGO, ORIGO y PULSO.                                                | Duplicación parcial idéntica confirmada y candidata a contrato compartido, sin decidir todavía su distribución.             | `SHELL-AUD-004`, `SHELL-AUD-009`, `SHELL-AUD-010`                  |
| `OBS-010` | PULSO conserva un segundo cliente en `src/utils/supabase/client.ts` además de `src/lib/supabase/client.ts`.                 | Se confirma una frontera local paralela; su consumo y disposición deben resolverse antes de retirar o centralizar.          | `SHELL-AUD-008`, `SHELL-AUD-010`, `SHELL-AUD-011`                  |

Todos los puntos abiertos tienen una tarea existente y un momento de resolución: las comparaciones se ejecutarán en `SHELL-AUD-002` a `SHELL-AUD-009`, y la disposición final se decidirá en `SHELL-AUD-010`.

---

#### 11. Reglas resultantes

1. Un mismo nombre de archivo no prueba paridad; deberá conservarse el hash y compararse el contrato.
2. Un hash diferente no prueba defecto; deberá distinguirse núcleo compartido de extensión local.
3. La plantilla de `vento-shell` no se contará como runtime desplegado.
4. El runtime de `vento-shell` sí se contará cuando implemente una familia compartida, aunque el repositorio también sea fuente de plantilla.
5. La copia física sin versión, procedencia y prueba de paridad no se considerará distribución controlada.
6. Las ausencias de middleware o proxy no se interpretarán como vulnerabilidad antes de comparar la frontera real.
7. Los tipos, constantes y contratos embebidos se compararán dentro de su familia propietaria y en `SHELL-AUD-009`; no se inflará el inventario creando una familia por cada símbolo.
8. No se eliminará, moverá, centralizará ni reemplazará ningún archivo durante esta tarea.
9. No se crea ninguna tarea nueva: todas las comparaciones y decisiones tienen propietario existente.
10. `active-sequence.json` no se modifica por inferencia.
11. `SHELL-AUD-002` permanece como única continuidad inmediata.

---

#### 12. Trazabilidad con requisitos vigentes

El registro vigente ya protege:

- la clasificación y paridad de responsabilidades compartidas mediante `TREQ-SHELL-002`;
- la separación entre plantilla fuente y superficies runtime mediante `TREQ-SHELL-029`;
- la integridad de textos, nombres y estados propagados por el template mediante `TREQ-SHELL-035`.

Esta tarea materializa el inventario exigido por esos requisitos, pero no cambia su regla, estado, responsable, paquete, evidencia ni relación.

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea inventaría presencia, identidad byte a byte y destinos documentales de familias ya cubiertas por requisitos vigentes. No introduce comportamiento ejecutable, no modifica contratos y no detecta una regla verificable sin cobertura previa.

---

#### 13. Criterios de aceptación

`SHELL-AUD-001` podrá considerarse materialmente completa cuando:

- los doce repositorios canónicos estén representados una sola vez;
- la plantilla fuente se distinga de los seis consumidores runtime;
- los ocho archivos administrados por bootstrap y sus ocurrencias runtime estén identificados por separado;
- los módulos externos de auth, contexto, role override, Supabase y middleware estén inventariados;
- las 26 familias y 190 decisiones de presencia tengan valor explícito;
- la enumeración de rutas y la búsqueda por responsabilidades puedan repetirse contra los commits declarados;
- cada familia tenga identificador estable, ruta, cantidad, variantes, clasificación y destino;
- igualdad y diferencia de hashes no se confundan con corrección funcional;
- las observaciones de role override, middleware, proxy y contexto tengan destino exacto;
- no se absorba el alcance de `SHELL-AUD-002` a `SHELL-AUD-010`;
- no se cree ninguna tarea ni requisito nuevo;
- no se modifique código, CI, despliegues, Supabase ni `active-sequence.json`;
- `SHELL-AUD-002` permanezca como única continuidad inmediata.

---

#### 14. Resultado y continuidad

La cadena resultante es:

```text
repositorio y commit
→ familia y ruta estable
→ presencia o ausencia explícita
→ blob SHA y grupo de identidad
→ clasificación de duplicación
→ tarea comparativa propietaria
→ disposición posterior en SHELL-AUD-010
```

La única continuidad reservada es:

```text
SHELL-AUD-002
— Comparar guards de autenticación
```


### [ ] SHELL-AUD-002 — Comparar guards de autenticación
### [ ] SHELL-AUD-003 — Comparar helpers de permisos
### [ ] SHELL-AUD-004 — Comparar contexto operativo
### [ ] SHELL-AUD-005 — Comparar role override
### [ ] SHELL-AUD-006 — Comparar AppShell y navegación
### [ ] SHELL-AUD-007 — Comparar componentes UI base
### [ ] SHELL-AUD-008 — Comparar clientes Supabase
### [ ] SHELL-AUD-009 — Comparar tipos y contratos
### [ ] SHELL-AUD-010 — Clasificar compartir / generar / mantener local
### [ ] SHELL-AUD-011 — Clasificar y retirar rutas, componentes, funciones, scripts y endpoints sin consumidores confirmados
Arquitectura de paquetes
