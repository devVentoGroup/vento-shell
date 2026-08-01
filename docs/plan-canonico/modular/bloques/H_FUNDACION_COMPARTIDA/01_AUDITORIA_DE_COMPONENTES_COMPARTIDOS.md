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

| ID        | Repositorio       | Remoto                        | Commit inspeccionado                       | Estado en esta tarea | Decisión                                                                                                 |
| --------- | ----------------- | ----------------------------- | ------------------------------------------ | -------------------- | -------------------------------------------------------------------------------------------------------- |
| `REPO-01` | `vento-shell`     | `devVentoGroup/vento-shell`   | `d07dedba8842bf95b240686c2177483495a78ad8` | `FUENTE_Y_RUNTIME`   | Plantilla y bootstrap; su runtime aporta además layout, estilos, middleware y clientes Supabase propios. |
| `REPO-02` | `vento-viso`      | `devVentoGroup/vento-viso`    | `47322403f3c64e83ae0c4a2f68c05d47093e5bb4` | `CONSUMIDOR_RUNTIME` | Aplicación web consumidora de la fundación copiada.                                                      |
| `REPO-03` | `vento-nexo`      | `devVentoGroup/vento-nexo`    | `142c4d696221e3ce3fda4ed3b62f3d1fe5b58799` | `CONSUMIDOR_RUNTIME` | Aplicación web consumidora y referencia histórica de varios helpers.                                     |
| `REPO-04` | `vento-fogo`      | `devVentoGroup/vento-fogo`    | `b6b9ed00e5267cabaac1a5a1090d93d5f60e86f2` | `CONSUMIDOR_RUNTIME` | Aplicación web consumidora de la fundación copiada.                                                      |
| `REPO-05` | `vento-origo`     | `devVentoGroup/vento-origo`   | `b7a8303fa078ef087f522b6c99059ababfc27472` | `CONSUMIDOR_RUNTIME` | Aplicación web consumidora de la fundación copiada.                                                      |
| `REPO-06` | `vento-pulso`     | `devVentoGroup/vento-pulso`   | `71e0184486b5fe11e0a42435baf4024807a80efd` | `CONSUMIDOR_RUNTIME` | Aplicación web consumidora con distribución parcial de middleware/proxy.                                 |
| `REPO-07` | `vento-numera`    | `devVentoGroup/vento-numera`  | `1b48a5da425d92e19ed89cf175b1dccc4cd960e1` | `CONSUMIDOR_RUNTIME` | Aplicación web consumidora de la fundación copiada.                                                      |
| `REPO-08` | `vento-group-web` | `devVentoGroup/Vento-Group`   | `604227aa0c36eda7bb7cf55f66369aa664f4290f` | `NO_APLICA_AL_CORTE` | Web pública; no es consumidora del AppShell operativo evaluado.                                          |
| `REPO-09` | `vento-anima`     | `devVentoGroup/vento-anima`   | `50b77742cc0ae85f873d42152108a50acc9d6964` | `NO_APLICA_AL_CORTE` | Aplicación Expo móvil con superficies web auxiliares; requiere contrato móvil propio.                    |
| `REPO-10` | `vento-pass`      | `devVentoGroup/vento-pass`    | `b5a4aec908ef12226f798078577ab089a29ccda2` | `NO_APLICA_AL_CORTE` | Aplicación Expo móvil de cliente; no consume el AppShell web operativo.                                  |
| `REPO-11` | `vento-talento`   | `devVentoGroup/vento-talento` | `dd39071daf587e3f006df62b646f8ad4b1b8de2c` | `NO_APLICA_AL_CORTE` | Base Expo futura sin despliegue; no consume el AppShell web operativo.                                   |
| `REPO-12` | `vento-vital`     | `devVentoGroup/vento-vital`   | `92d43bfac1f42d379928608005375a4b09bb04a4` | `FUERA_DE_VENTO_OS`  | Proyecto separado según el inventario canónico.                                                          |

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

| ID        | Fuente SHELL                                                                                     | VISO                                       | NEXO                                       | FOGO                                       | ORIGO                                      | PULSO                                      | NUMERA                                     |
| --------- | ------------------------------------------------------------------------------------------------ | ------------------------------------------ | ------------------------------------------ | ------------------------------------------ | ------------------------------------------ | ------------------------------------------ | ------------------------------------------ |
| `FAM-001` | TPL `58e2f2138d6d5bce7ad77f6f84a15f2f876862a9`<br>RUN `88f1dfdd36a831fd54a96ac0c047508f3e2b6013` | `5c0037c7a978a296161cc4d3b10deeda9461870b` | `85d9d8ec27bd8c81c2c03e8fb2368d012425bf93` | `8ab0fe774fba797cd88d30d94d7d46b314258776` | `408e33b3bb3901d84f1720ddcf295c8a1e2ba71c` | `edca10a3f71e3f6fad6b3801b33b883d4bf79416` | `e0e015ebd8b1342fd495d67c7cb550fcefce73d2` |
| `FAM-002` | TPL `a1bf4bea91e6a71188aa8c6f4c3dea1d838a372a`<br>RUN `ab981cbab29fba2bec954aa505a70235cabb3418` | `c8c2d74f60fe8f7e7ba8870944d0ab2959980a4c` | `f920142e5a23b2dc88cd3b0c4658481bc0bcef6e` | `017160673ca45cdff061bfb0aeff41b46847c32c` | `dbd3f044bd42124b5a2364b737d56f2a790476da` | `27562fde94c9b41585f2312a4ca49b80dc27ccc1` | `83d60962927a9e7b097c8f1075a7467850378f5b` |
| `FAM-003` | TPL `c9d4c7089c5369674c7e97d6c2c4531ec11b7522`<br>RUN AUSENTE                                    | `8521d979bdc1626fb06946aa93067d67fdc35201` | `7d3da0dbbbbcd61def1f3d102fd3d2d62d9afcae` | `01728247836b8298609969fefa57fd04dc8359dc` | `9c462f9e7d9d86b177d7f7065c5a791ad1eb3ce9` | `b0bb653786919a88fa28e12f8d12194b92ea727e` | `1344d13b6487616fb6ee2ec06a81f61fc92b44c0` |
| `FAM-004` | TPL `7d5f7c119acdd819ff43c99333db24f99946adfa`<br>RUN AUSENTE                                    | `0383159f207eaba9ae02f3dae5b597a77f991b09` | `c125fa99bb6733a31f3e6f788e09a9e94ff4845f` | `be3959756312537ca825ce6f3204fadd0f8735ed` | `95871809734b212b96b833b56dad0a93111f291d` | `23fe993deb97e7cbf30f2e5ac5bf341ff8111fc7` | `f83fb0f8d9ee168b9b3eaa666aef19c063267590` |
| `FAM-005` | TPL `073c2cf37cb3a12a68e9bfd844ab1e7a78e0be49`<br>RUN AUSENTE                                    | `bf38c12d65dd7bcdad3750da6d75bda4392f329a` | `073c2cf37cb3a12a68e9bfd844ab1e7a78e0be49` | `073c2cf37cb3a12a68e9bfd844ab1e7a78e0be49` | `073c2cf37cb3a12a68e9bfd844ab1e7a78e0be49` | `073c2cf37cb3a12a68e9bfd844ab1e7a78e0be49` | `4e66b1768075114ac23c05c941b83e0ba78f6887` |
| `FAM-006` | TPL `0754a74221ee5441e0c2624c177865354586fd4b`<br>RUN AUSENTE                                    | `e9c5286da9d73c828ef9931dca730afd1b43fc57` | `0754a74221ee5441e0c2624c177865354586fd4b` | `0754a74221ee5441e0c2624c177865354586fd4b` | `0754a74221ee5441e0c2624c177865354586fd4b` | `0754a74221ee5441e0c2624c177865354586fd4b` | `3cdf3dd9e1df9c364f4e8b549a660038d6b4a15e` |
| `FAM-007` | TPL `11d786b6327b4016fdd6e2354e0e6283cb8334e6`<br>RUN AUSENTE                                    | `888f3d20bd317ff4234861c11237b1144e3a8ad8` | `ea05dd60eef2e23427a4ee421aa279a88c5f4739` | `839d6cc9dc984f526ced166611af6b47ca8c6f23` | `ea05dd60eef2e23427a4ee421aa279a88c5f4739` | `ea05dd60eef2e23427a4ee421aa279a88c5f4739` | `ee23b7a3e2cceb8f61e6b86faf80f3ece19f3d87` |
| `FAM-008` | TPL `622a64f92c649f1d90d51b7122b92dbb99441d28`<br>RUN AUSENTE                                    | `278bb9b9f36ff83c881a699292968556f8325813` | `d9958714181dd8b833952455507f5fec7365adb3` | `86f0057ae64ed6a8691c5dd9ecddfad644061743` | `4f54cdb3a2987c474e71392889545b0c2690d2d9` | `b25e6ca1d6fead9cbc388c31df0551cdab518756` | `bf0d1c7c34aedbd3b410807e1a9d20ec71c4f277` |
| `FAM-009` | AUSENTE                                                                                          | `2b580475c7d37842c225418c6696fbddb3887407` | `d7678139cb7061a3b58d7da87ac0a7ad91b296c3` | `d7678139cb7061a3b58d7da87ac0a7ad91b296c3` | `d7678139cb7061a3b58d7da87ac0a7ad91b296c3` | `ae708911c06e0bae35dead2343879d69ec23ee5b` | `d7678139cb7061a3b58d7da87ac0a7ad91b296c3` |
| `FAM-010` | AUSENTE                                                                                          | `fa81328fe4fd5ec2dd8ffd67f09b0e76578c99cd` | `a5a2b7e6f914075d78cc72a9b016994f5a102dde` | `a5a2b7e6f914075d78cc72a9b016994f5a102dde` | `a5a2b7e6f914075d78cc72a9b016994f5a102dde` | `8087fbe3b949c9b8fe553f1d1d76ef4da169bd22` | `a5b1debdfbc30c5d302f1bdc933cd832b759f856` |
| `FAM-011` | AUSENTE                                                                                          | `ea2310bfda5b6981dba2f2549a69f18229af76ac` | `ea2310bfda5b6981dba2f2549a69f18229af76ac` | `ea2310bfda5b6981dba2f2549a69f18229af76ac` | `ea2310bfda5b6981dba2f2549a69f18229af76ac` | `ea2310bfda5b6981dba2f2549a69f18229af76ac` | `ea2310bfda5b6981dba2f2549a69f18229af76ac` |
| `FAM-012` | AUSENTE                                                                                          | `e05084310ca54b2371f5bdb341734de25141609a` | `8a7556f84020b687cccee116ab4dbe97f40d915e` | `e58e16acf0d913a08359c74a002ca4e1776c2e1b` | `e58e16acf0d913a08359c74a002ca4e1776c2e1b` | `385382cf161bfd19071511dac65c3faa298b95e4` | `5b8515a7db9cebe8dd8c63ff3116762ecd0e26e7` |
| `FAM-013` | AUSENTE                                                                                          | `c69bf0ff337183280ebf223905e5a586dc589285` | `86efeea41d7eb822364758adaef047d6dec929fb` | `850f96098daa3dc917689524f14469968b2d4a19` | `199add73d195739f9a3b4816ad4281530b1e520e` | `a2c92a2020d5bae530d66f316c24de5f2a1224a7` | `61f4041e5bfbf05b85ccc78597cce0119ecf10d2` |
| `FAM-014` | `1bc24c115914ffae21ddfcaecf1876d8fb8b6f14`                                                       | `dfed99c57cf1772c561b1f979cb948e564ad973a` | `eae6ae4a4ee970ab760ed771b0dc4a5d79ca7b22` | `eae6ae4a4ee970ab760ed771b0dc4a5d79ca7b22` | `eae6ae4a4ee970ab760ed771b0dc4a5d79ca7b22` | `1306e2e4ef77265722d983f28e123bbac320d9f5` | `23215c75eea9b51fa5b8e920a84d3ed20bda48ba` |
| `FAM-015` | `cffa5fd4faf351a44a382cfc4319617ec953341a`                                                       | `f01589daefdd141a496d0d81a34ecdd7bf1e09fa` | `87d3638e1ce1d9751800def61f14dd7945d601a2` | `a5da4960b0d50c5436ffdf9ff1e7f199f4d98bdb` | `a5da4960b0d50c5436ffdf9ff1e7f199f4d98bdb` | `05743f75577d79c4ebe3bd5b81c944627e00fc35` | `46d1ad65d091e9a204bee938e37193178dc80c5d` |
| `FAM-016` | `862d185fd1bbc8101ed87db5e286d6b0b0dde659`                                                       | `3099628a445dca9c401b87441b3c05c24894161d` | `3db2c7e31dcada218a8e8cd1efc41db8c899b1d7` | `596e62e2716a32e3acea3e79c79b60c7762271f2` | `0420a23343af1ab60055f090891823f6860afc00` | AUSENTE                                    | `499444d0e05d0beb0824b0e6a964fa1d199cdbb7` |
| `FAM-017` | AUSENTE                                                                                          | `d02cbb7582f711f5d8e8ac535885faa548bf995e` | `924419c77afff452ed3b13385fbf1c6016e4a34a` | AUSENTE                                    | AUSENTE                                    | `759477c537f3dc3e247d427418027affce07b707` | AUSENTE                                    |
| `FAM-018` | AUSENTE                                                                                          | AUSENTE                                    | `d4355b544a5d9f37eb77b8bf56ff4e281dd73840` | AUSENTE                                    | AUSENTE                                    | AUSENTE                                    | AUSENTE                                    |
| `FAM-019` | AUSENTE                                                                                          | `d171b312fab0794470ff18965b88e6452695fb19` | `f7af0dc287f458ff26a91711442bedfb823a6542` | AUSENTE                                    | AUSENTE                                    | AUSENTE                                    | AUSENTE                                    |
| `FAM-020` | AUSENTE                                                                                          | `9c05cd4f6467f1f956a8d57f23a68a0a46df012e` | `a9f31cee67e90bf5f494708aba7d1a0b9339b18f` | `eb36c210a098db84d80856e2def237fa0c625074` | `1d041cfa3678bc5372bbed4b60f0bf9a2171334c` | `a9f31cee67e90bf5f494708aba7d1a0b9339b18f` | `83e22703ad5a28a5498a1232aaf6bafe3eaaf12c` |
| `FAM-021` | AUSENTE                                                                                          | AUSENTE                                    | `bcdc389773d032b6b3e5bebc5bdbf2606daa3e7c` | AUSENTE                                    | AUSENTE                                    | AUSENTE                                    | AUSENTE                                    |
| `FAM-022` | AUSENTE                                                                                          | AUSENTE                                    | `89610936608eaa667a79c7739f72e968397d211c` | `89610936608eaa667a79c7739f72e968397d211c` | `89610936608eaa667a79c7739f72e968397d211c` | `89610936608eaa667a79c7739f72e968397d211c` | AUSENTE                                    |
| `FAM-023` | AUSENTE                                                                                          | `b328a8334d8d3dfe996c027b030cb783cce265ed` | `60faf6ceb4015a1cf8a67aedad9bfeeacb6ec95b` | `02e431fffa211166224d5f2125b5e5cacc276b12` | `02e431fffa211166224d5f2125b5e5cacc276b12` | `f50fbe3df2c7b49487eba7e1aa5acf2bc8aef427` | `dcfaec37d95c0d5e85fb69ca5282c7430fd03abb` |
| `FAM-024` | AUSENTE                                                                                          | `0c46abd8a9e9a1e17fa3077cf83a883085484850` | AUSENTE                                    | AUSENTE                                    | AUSENTE                                    | AUSENTE                                    | AUSENTE                                    |
| `FAM-025` | AUSENTE                                                                                          | AUSENTE                                    | AUSENTE                                    | `d192e36a34afc313dc403348a36f17fefafb33f3` | `d192e36a34afc313dc403348a36f17fefafb33f3` | AUSENTE                                    | `fd925fa50a6400736100067de4114d1f2c6dc62e` |
| `FAM-026` | AUSENTE                                                                                          | AUSENTE                                    | AUSENTE                                    | AUSENTE                                    | AUSENTE                                    | `34f32531942ea177f5a8f6bb1990ebc303855626` | AUSENTE                                    |

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
| `OBS-008` | El runtime de `vento-shell` contiene clientes Supabase y middleware propios, con blobs distintos de los consumidores.     | SHELL participa en la comparación de frontera y cliente; su condición de fuente de plantilla no lo excluye como runtime.   | `SHELL-AUD-002`, `SHELL-AUD-008`, `SHELL-AUD-010`                  |
| `OBS-009` | `shared-device-signature.ts` es byte-idéntico en NEXO, FOGO, ORIGO y PULSO.                                               | Duplicación parcial idéntica confirmada y candidata a contrato compartido, sin decidir todavía su distribución.            | `SHELL-AUD-004`, `SHELL-AUD-009`, `SHELL-AUD-010`                  |
| `OBS-010` | PULSO conserva un segundo cliente en `src/utils/supabase/client.ts` además de `src/lib/supabase/client.ts`.               | Se confirma una frontera local paralela; su consumo y disposición deben resolverse antes de retirar o centralizar.         | `SHELL-AUD-008`, `SHELL-AUD-010`, `SHELL-AUD-011`                  |

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


### ✅ SHELL-AUD-002 — Comparar guards de autenticación

**Estado:** APROBADA
**Bloque:** H — Fundación compartida
**Tipo:** auditoría documental comparativa de autenticación, fronteras de sesión y redirección SSO
**Dependencia anterior:** `SHELL-AUD-001`
**Continuidad reservada:** `SHELL-AUD-003`
**Fecha de corte:** 2026-08-01
**Commit documental canónico:** `c0444434ae67061e15bd2d698a3ae4d67985b530`
**Cambios en código, configuración, despliegues o Supabase:** no autorizados ni realizados

---

#### 1. Resultado de la tarea

Esta tarea compara la autenticación efectiva de las siete superficies web runtime inventariadas en `SHELL-AUD-001`. La comparación separa cuatro responsabilidades que actualmente se encuentran distribuidas:

1. autenticación global de rutas mediante `middleware.ts`;
2. autenticación y puerta de aplicación mediante `src/lib/auth/guard.ts`;
3. construcción y preservación del destino de acceso mediante `/login` y `src/lib/auth/sso.ts`;
4. refresco auxiliar de sesión mediante `src/lib/supabase/proxy.ts`.

Resultado material:

- **7** repositorios runtime comparados;
- **6** implementaciones de `guard.ts`, agrupadas en **3** contratos de comportamiento;
- **6** middlewares globales, todos con blob diferente;
- **1** repositorio runtime, PULSO, sin `middleware.ts`;
- **3** helpers `src/lib/supabase/proxy.ts`, sin consumidor externo confirmado en el corte;
- **6** helpers `src/lib/auth/sso.ts`, agrupados en **5** blobs;
- **4** consumidores comparten byte a byte el guard base: NEXO, FOGO, ORIGO y NUMERA;
- VISO y PULSO alteran el contrato de entrada, redirección o puerta general;
- la paridad contractual de autenticación queda **NO DEMOSTRADA**;
- no se modifica código ni se decide todavía compartir, generar o mantener local; esa disposición pertenece a `SHELL-AUD-010`.

---

#### 2. Alcance exacto

##### 2.1. Incluido

- presencia, hash y comportamiento observable de `src/lib/auth/guard.ts`;
- autenticación global de rutas en `middleware.ts`;
- matchers, exclusiones y excepciones explícitas del middleware;
- validación de usuario mediante `supabase.auth.getUser()`;
- tratamiento de ausencia de cookies, configuración, usuario y errores de autenticación;
- redirección a `/login` o al acceso central;
- normalización y propagación de `returnTo`;
- puerta general de aplicación y su relación con permisos específicos;
- comportamiento de dispositivos compartidos visto desde el guard;
- invocación del role override vista desde el guard;
- presencia y consumo confirmado de `src/lib/supabase/proxy.ts`, `src/lib/auth/sso.ts` y `src/lib/auth/request-host.ts`;
- extensiones locales incrustadas dentro de la frontera de autenticación cuando alteran el flujo de entrada.

##### 2.2. Excluido y conservado para tareas posteriores

| Materia                                                                 | Tarea propietaria |
| ----------------------------------------------------------------------- | ----------------- |
| corrección interna de `checkPermission`, RPC y normalización de códigos | `SHELL-AUD-003`   |
| resolución semántica de sesión y contexto operativo                     | `SHELL-AUD-004`   |
| contrato interno y cookies de role override                             | `SHELL-AUD-005`   |
| clientes Supabase y arquitectura definitiva de proxy                    | `SHELL-AUD-008`   |
| tipos y contratos compartidos consumidos por los guards                 | `SHELL-AUD-009`   |
| decisión compartir / generar / mantener local                           | `SHELL-AUD-010`   |
| retiro o conservación de helpers sin consumidor confirmado              | `SHELL-AUD-011`   |

Esta tarea registra las diferencias necesarias para esos handoffs, pero no absorbe su decisión sustantiva.

---

#### 3. Fuentes y cortes técnicos

| ID                | Repositorio    | Commit runtime inspeccionado               | Rol en la comparación                          |
| ----------------- | -------------- | ------------------------------------------ | ---------------------------------------------- |
| `AUTH-SURFACE-01` | `vento-shell`  | `d07dedba8842bf95b240686c2177483495a78ad8` | acceso central y middleware global             |
| `AUTH-SURFACE-02` | `vento-viso`   | `47322403f3c64e83ae0c4a2f68c05d47093e5bb4` | consumidor web                                 |
| `AUTH-SURFACE-03` | `vento-nexo`   | `142c4d696221e3ce3fda4ed3b62f3d1fe5b58799` | consumidor web y variante local                |
| `AUTH-SURFACE-04` | `vento-fogo`   | `b6b9ed00e5267cabaac1a5a1090d93d5f60e86f2` | consumidor web                                 |
| `AUTH-SURFACE-05` | `vento-origo`  | `b7a8303fa078ef087f522b6c99059ababfc27472` | consumidor web con excepción pública explícita |
| `AUTH-SURFACE-06` | `vento-pulso`  | `71e0184486b5fe11e0a42435baf4024807a80efd` | consumidor web sin middleware global           |
| `AUTH-SURFACE-07` | `vento-numera` | `1b48a5da425d92e19ed89cf175b1dccc4cd960e1` | consumidor web                                 |

**Conciliación:** 7 superficies runtime esperadas, 7 materializadas, 0 omitidas y 0 duplicadas.

La documentación canónica vigente se leyó en `c0444434ae67061e15bd2d698a3ae4d67985b530`. Entre el corte runtime de SHELL y ese commit existe un único commit documental que materializa `SHELL-AUD-001`, actualiza continuidad y ajusta validadores; no introduce un cambio runtime en los archivos de autenticación comparados.

---

#### 4. Inventario de superficies de autenticación

| ID                | Repositorio | `guard.ts`  | `middleware.ts` | `supabase/proxy.ts`                  | `/login` local             | `auth/sso.ts`                        | Clasificación actual                    |
| ----------------- | ----------- | ----------- | --------------- | ------------------------------------ | -------------------------- | ------------------------------------ | --------------------------------------- |
| `AUTH-SURFACE-01` | SHELL       | `NO_APLICA` | `PRESENTE`      | `AUSENTE`                            | acceso central propietario | `AUSENTE`                            | `FRONTERA_GLOBAL_CENTRAL`               |
| `AUTH-SURFACE-02` | VISO        | `PRESENTE`  | `PRESENTE`      | `PRESENTE_SIN_CONSUMIDOR_CONFIRMADO` | `PRESENTE`                 | `PRESENTE_SIN_CONSUMIDOR_CONFIRMADO` | `GUARD_DIVERGENTE_CON_MIDDLEWARE`       |
| `AUTH-SURFACE-03` | NEXO        | `PRESENTE`  | `PRESENTE`      | `PRESENTE_SIN_CONSUMIDOR_CONFIRMADO` | `PRESENTE_CON_MODO_LOCAL`  | `PRESENTE_CON_CONSUMIDORES`          | `BASE_COMPARTIDA_MAS_EXTENSION_LOCAL`   |
| `AUTH-SURFACE-04` | FOGO        | `PRESENTE`  | `PRESENTE`      | `AUSENTE`                            | `PRESENTE`                 | `PRESENTE_SIN_CONSUMIDOR_CONFIRMADO` | `BASE_COMPARTIDA_CON_MIDDLEWARE`        |
| `AUTH-SURFACE-05` | ORIGO       | `PRESENTE`  | `PRESENTE`      | `AUSENTE`                            | `PRESENTE`                 | `PRESENTE_SIN_CONSUMIDOR_CONFIRMADO` | `BASE_COMPARTIDA_MAS_EXCEPCION_PUBLICA` |
| `AUTH-SURFACE-06` | PULSO       | `PRESENTE`  | `AUSENTE`       | `PRESENTE_SIN_CONSUMIDOR_CONFIRMADO` | `AUSENTE`                  | `PRESENTE_CON_CONSUMIDOR_EN_GUARD`   | `GUARD_DE_PAGINA_SIN_FRONTERA_GLOBAL`   |
| `AUTH-SURFACE-07` | NUMERA      | `PRESENTE`  | `PRESENTE`      | `AUSENTE`                            | `PRESENTE`                 | `PRESENTE_SIN_CONSUMIDOR_CONFIRMADO` | `BASE_COMPARTIDA_CON_MIDDLEWARE`        |

`PRESENTE_SIN_CONSUMIDOR_CONFIRMADO` significa que la búsqueda de referencias localizó la declaración, pero no una invocación externa. No equivale a autorización de retiro.

---

#### 5. Matriz de hashes

| Superficie                     | SHELL                                      | VISO                                       | NEXO                                       | FOGO                                       | ORIGO                                      | PULSO                                      | NUMERA                                     |
| ------------------------------ | ------------------------------------------ | ------------------------------------------ | ------------------------------------------ | ------------------------------------------ | ------------------------------------------ | ------------------------------------------ | ------------------------------------------ |
| `src/lib/auth/guard.ts`        | `AUSENTE`                                  | `2b580475c7d37842c225418c6696fbddb3887407` | `d7678139cb7061a3b58d7da87ac0a7ad91b296c3` | `d7678139cb7061a3b58d7da87ac0a7ad91b296c3` | `d7678139cb7061a3b58d7da87ac0a7ad91b296c3` | `ae708911c06e0bae35dead2343879d69ec23ee5b` | `d7678139cb7061a3b58d7da87ac0a7ad91b296c3` |
| `middleware.ts`                | `862d185fd1bbc8101ed87db5e286d6b0b0dde659` | `3099628a445dca9c401b87441b3c05c24894161d` | `3db2c7e31dcada218a8e8cd1efc41db8c899b1d7` | `596e62e2716a32e3acea3e79c79b60c7762271f2` | `0420a23343af1ab60055f090891823f6860afc00` | `AUSENTE`                                  | `499444d0e05d0beb0824b0e6a964fa1d199cdbb7` |
| `src/lib/supabase/proxy.ts`    | `AUSENTE`                                  | `d02cbb7582f711f5d8e8ac535885faa548bf995e` | `924419c77afff452ed3b13385fbf1c6016e4a34a` | `AUSENTE`                                  | `AUSENTE`                                  | `759477c537f3dc3e247d427418027affce07b707` | `AUSENTE`                                  |
| `src/lib/auth/sso.ts`          | `AUSENTE`                                  | `b328a8334d8d3dfe996c027b030cb783cce265ed` | `60faf6ceb4015a1cf8a67aedad9bfeeacb6ec95b` | `02e431fffa211166224d5f2125b5e5cacc276b12` | `02e431fffa211166224d5f2125b5e5cacc276b12` | `f50fbe3df2c7b49487eba7e1aa5acf2bc8aef427` | `dcfaec37d95c0d5e85fb69ca5282c7430fd03abb` |
| `src/lib/auth/request-host.ts` | `AUSENTE`                                  | `AUSENTE`                                  | `bcdc389773d032b6b3e5bebc5bdbf2606daa3e7c` | `AUSENTE`                                  | `AUSENTE`                                  | `AUSENTE`                                  | `AUSENTE`                                  |

Conclusiones de identidad:

- `guard.ts`: 6 ocurrencias, 3 blobs, un grupo idéntico de 4 aplicaciones;
- `middleware.ts`: 6 ocurrencias, 6 blobs;
- `supabase/proxy.ts`: 3 ocurrencias, 3 blobs, aunque VISO y NEXO son semánticamente equivalentes salvo codificación o formato;
- `auth/sso.ts`: 6 ocurrencias, 5 blobs; FOGO y ORIGO son byte-idénticos;
- `request-host.ts`: una sola ocurrencia en NEXO.

---

#### 6. Contratos actuales de `requireAppAccess`

##### 6.1. Variante `GUARD-A` — NEXO, FOGO, ORIGO y NUMERA

Las cuatro aplicaciones comparten el mismo blob. El flujo es:

```text
crear o reutilizar cliente Supabase
→ auth.getUser()
→ si no hay usuario, /login?returnTo=...
→ resolveOperationalSession(...)
→ dispositivo compartido: validar aplicación permitida
→ sesión personal: RPC has_permission(<app>.access)
→ normalizar permisos específicos
→ dispositivo compartido: checkOperationalSessionPermission
→ sesión personal simulada: isPermissionAllowedForRole
→ sesión personal normal: RPC has_permission por cada código
→ devolver usuario, cliente, sede, sesión y descriptor de dispositivo
```

Propiedades comprobadas:

- los arreglos de permisos usan semántica **todos deben permitir**;
- los errores de RPC y las denegaciones fallan cerrado;
- una denegación simple de `<app>.access` no agrega `reason`, mientras un error de RPC agrega `reason=no_access`;
- el guard local no construye por sí mismo una URL SSO absoluta; depende de la ruta `/login`;
- role override se evalúa solo para sesión personal y permisos específicos;
- el detalle semántico de permisos, contexto y role override pertenece respectivamente a `SHELL-AUD-003`, `SHELL-AUD-004` y `SHELL-AUD-005`.

##### 6.2. Variante `GUARD-B` — VISO

VISO mantiene el contrato base, pero introduce `allowPermissionAccess`, con valor predeterminado `false`. Cuando vale `true`:

- una sesión personal sin `viso.access` puede superar la puerta general si todos los permisos específicos solicitados son concedidos;
- un dispositivo compartido no incluido en la lista de aplicaciones puede superar la puerta general si todos los permisos específicos son concedidos por la sesión operativa;
- después de superar la puerta alternativa, los mismos permisos específicos vuelven a evaluarse en la etapa ordinaria;
- el consumidor confirmado es el acceso de horarios, mediante `staff.schedule.view`.

Esta variante no es equivalente a `GUARD-A`: define una relación distinta entre permiso general de aplicación y permiso funcional específico.

##### 6.3. Variante `GUARD-C` — PULSO

PULSO mantiene la evaluación base, pero:

- redirige al acceso central mediante `buildShellLoginUrl(returnTo)` sin pasar por una página `/login` local;
- introduce `requireAppAccessPermission`, con valor predeterminado `true`;
- si esa bandera fuera `false`, omitiría tanto la lista de aplicaciones del dispositivo compartido como el permiso `<app>.access`, pero conservaría la evaluación de permisos específicos;
- los consumidores localizados en raíz, scanner, salón, órdenes y carga de ventas usan expresamente `true`;
- no se confirmó un consumidor que invoque el valor `false` en el corte.

La opción se clasifica como **capacidad latente**, no como bypass runtime demostrado.

---

#### 7. Comparación dimensional del guard de aplicación

| Dimensión                              | `GUARD-A`                                    | VISO `GUARD-B`                                                | PULSO `GUARD-C`                                         | Estado de paridad                   |
| -------------------------------------- | -------------------------------------------- | ------------------------------------------------------------- | ------------------------------------------------------- | ----------------------------------- |
| sesión autenticada                     | `auth.getUser()`                             | igual                                                         | igual                                                   | `EQUIVALENTE`                       |
| destino sin usuario                    | `/login` local                               | `/login` local                                                | login central directo                                   | `DIVERGENTE`                        |
| sesión operativa                       | `resolveOperationalSession`                  | igual                                                         | igual                                                   | `EQUIVALENTE_EN_LA_INVOCACION`      |
| puerta de aplicación personal          | RPC `has_permission`                         | helper `checkPermission` y alternativa por permiso específico | RPC, opcional mediante bandera                          | `DIVERGENTE`                        |
| puerta de aplicación compartida        | allowlist obligatoria                        | allowlist o alternativa por permiso específico                | allowlist opcional mediante bandera                     | `DIVERGENTE`                        |
| permisos específicos                   | todos los códigos deben permitir             | igual, con posible evaluación repetida                        | igual                                                   | `EQUIVALENTE_EN_RESULTADO_ESPERADO` |
| role override                          | personal, solo permisos específicos          | igual en la estructura                                        | igual en la estructura                                  | `PENDIENTE_DE_SHELL_AUD_005`        |
| motivo de denegación de acceso general | inconsistente entre error y resultado falso  | siempre `no_access`                                           | igual a `GUARD-A`                                       | `DIVERGENTE`                        |
| objeto retornado                       | cliente, usuario, sede, sesión y dispositivo | igual                                                         | igual                                                   | `EQUIVALENTE`                       |
| cobertura de rutas                     | depende de middleware y consumidores         | depende de middleware y consumidores                          | solo consumidores confirmados; no hay middleware global | `NO_DEMOSTRADA`                     |

La coincidencia estructural de varias etapas no demuestra equivalencia de autorización porque los helpers internos se comparan en `SHELL-AUD-003` a `SHELL-AUD-005`.

---

#### 8. Comparación de middleware global

| Repositorio | Destino sin sesión         | Exclusiones principales                      | Comportamiento adicional                                                                   | Clasificación                    |
| ----------- | -------------------------- | -------------------------------------------- | ------------------------------------------------------------------------------------------ | -------------------------------- |
| SHELL       | login central configurable | `_next`, `login`, estáticos, `api`           | headers de diagnóstico; cookie domain configurable                                         | `GLOBAL_CENTRAL`                 |
| VISO        | `/login` local             | `_next`, `login`, estáticos, `api`           | implementación base                                                                        | `GLOBAL_LOCAL_BASE`              |
| NEXO        | `/login` local             | agrega `manifest.webmanifest`; excluye `api` | no-store; dominio de cookie sensible a localhost; restricción especial de kiosco de bodega | `GLOBAL_LOCAL_CON_EXTENSION`     |
| FOGO        | `/login` local             | agrega `no-access`; excluye `api`            | implementación base                                                                        | `GLOBAL_LOCAL_BASE`              |
| ORIGO       | `/login` local             | agrega `no-access`; excluye `api`            | excepción pública para PDF de orden de compra                                              | `GLOBAL_LOCAL_CON_EXCEPCION`     |
| PULSO       | `NO_APLICA`                | `NO_APLICA`                                  | no existe middleware global                                                                | `SIN_FRONTERA_GLOBAL_CONFIRMADA` |
| NUMERA      | `/login` local             | agrega `no-access`; excluye `api`            | implementación base                                                                        | `GLOBAL_LOCAL_BASE`              |

##### 8.1. Invariantes comunes de los seis middlewares presentes

- comprueban la existencia de cookies `sb-*` antes de consultar Supabase;
- resuelven URL y clave desde variables públicas o de servidor;
- validan el usuario mediante `auth.getUser()`;
- fallan cerrado ante ausencia de cookies, configuración, error de autenticación o usuario inválido;
- limpian cookies Supabase ante error de autenticación o usuario inválido;
- excluyen `/api`, por lo que cada route handler requiere protección propia;
- pueden emitir headers de diagnóstico cuando `NEXT_PUBLIC_DEBUG_AUTH === "1"`.

##### 8.2. Extensión NEXO

Después de autenticar, NEXO identifica un usuario por correo fijo, consulta una ubicación por código fijo y restringe sus rutas a entradas de kiosco o a dos superficies de una ubicación concreta. Esta lógica combina autenticación global con una excepción de navegación y autorización propia de NEXO.

La comparación no la declara incorrecta. La clasifica como **extensión local inseparable del middleware actual**, que deberá recibir disposición explícita en `SHELL-AUD-010`.

##### 8.3. Excepción ORIGO

ORIGO permite que `/purchase-orders/<id>/pdf` atraviese el middleware sin cookies. El route handler correspondiente:

- verifica el token `t` mediante `verifyPurchaseOrderPdfToken`;
- cuando el token no es válido, exige sesión mediante el cliente Supabase de servidor;
- utiliza cliente privilegiado únicamente después de esa decisión de entrada.

La excepción queda clasificada como **pública condicionada con protección en destino**, no como ruta anónima sin control. Su paridad debe probarse por URL directa y token inválido, expirado o ausente.

##### 8.4. Ausencia global en PULSO

PULSO protege los consumidores localizados mediante `requireAppAccess`, pero no posee una frontera que cubra automáticamente toda ruta. Por tanto:

- la existencia de page guards no demuestra cobertura exhaustiva;
- una ruta nueva puede quedar fuera si no invoca el guard;
- los route handlers y server actions requieren comprobación propia;
- no se declara una vulnerabilidad concreta sin inventario de rutas y pruebas de URL directa;
- el estado de cobertura es `PENDIENTE_DE_EVIDENCIA`, no `VALIDADO`.

---

#### 9. Redirección, `/login`, SSO y `returnTo`

| Repositorio | Cadena actual                                                   | Particularidad                                                                           | Estado          |
| ----------- | --------------------------------------------------------------- | ---------------------------------------------------------------------------------------- | --------------- |
| SHELL       | middleware → `/login` central propietario                       | `safeReturnTo` admite rutas y URLs HTTP/HTTPS                                            | `CENTRAL`       |
| VISO        | middleware/guard → `/login` local → login central desde cliente | convierte ruta relativa con `window.location.origin`                                     | `DOBLE_SALTO`   |
| NEXO        | middleware/guard → `/login` local                               | en localhost conserva formulario local; en producción redirige al central desde servidor | `DOBLE_MODO`    |
| FOGO        | middleware/guard → `/login` local → login central desde cliente | helper `sso.ts` no tiene consumidor externo confirmado                                   | `DOBLE_SALTO`   |
| ORIGO       | middleware/guard → `/login` local → login central desde cliente | helper `sso.ts` no tiene consumidor externo confirmado                                   | `DOBLE_SALTO`   |
| PULSO       | guard → login central directo                                   | no existe `/login` local                                                                 | `SALTO_DIRECTO` |
| NUMERA      | middleware/guard → `/login` local → login central desde cliente | helper `sso.ts` sin consumidor confirmado                                                | `DOBLE_SALTO`   |

Hallazgos específicos:

1. Los helpers permiten propagar URLs absolutas HTTP/HTTPS; la lista de orígenes aprobados no se aplica en estos helpers.
2. El helper activo de PULSO utiliza `nexo.ventogroup.co` como host de respaldo cuando no existe header de host.
3. El helper de FOGO es byte-idéntico al de ORIGO y también contiene `origo.ventogroup.co`; no se localizó un consumidor externo en FOGO.
4. NEXO es la única aplicación con `request-host.ts`, protocolo local explícito y formulario de login local.
5. La preservación segura de `returnTo` ya está cubierta por requisitos vigentes; esta tarea no crea una regla nueva.

---

#### 10. Helpers `src/lib/supabase/proxy.ts`

Los tres archivos denominados `proxy.ts` no constituyen una frontera global por su sola existencia:

- VISO y NEXO implementan el mismo flujo semántico, aunque sus blobs difieren;
- PULSO agrega extracción defensiva del código de error;
- ante ausencia de configuración o cookies, permiten continuar;
- ante `refresh_token_not_found`, limpian cookies Supabase;
- ante otros errores de autenticación, permiten continuar;
- la búsqueda de `updateSession(` solo localizó la declaración dentro de cada archivo;
- en PULSO no existe `proxy.ts` raíz ni `src/proxy.ts`; en los tres repositorios no se confirmó una invocación externa de `updateSession`.

Por tanto, se clasifican como `HELPER_DE_REFRESCO_SIN_CONSUMIDOR_CONFIRMADO`. No se contabilizan como protección de rutas y no se autoriza su retiro durante esta tarea.

Destinos:

- arquitectura y clientes Supabase: `SHELL-AUD-008`;
- disposición compartir / generar / mantener local: `SHELL-AUD-010`;
- conservación o retiro por consumo: `SHELL-AUD-011`.

---

#### 11. Hallazgos y destinos obligatorios

| ID                | Hallazgo materializado                                                                                          | Estado                             | Destino exacto                                                        |
| ----------------- | --------------------------------------------------------------------------------------------------------------- | ---------------------------------- | --------------------------------------------------------------------- |
| `H-SHELL-002-001` | seis `guard.ts` están divididos en tres contratos de comportamiento                                             | `CONFIRMADO`                       | `SHELL-AUD-003` a `SHELL-AUD-005`; `SHELL-AUD-009`; `SHELL-AUD-010`   |
| `H-SHELL-002-002` | VISO permite que un permiso funcional sustituya la puerta general cuando el consumidor habilita la opción       | `IMPLEMENTADO_ACTIVO`              | `SHELL-AUD-003`; `SHELL-AUD-010`                                      |
| `H-SHELL-002-003` | PULSO declara una opción para omitir la puerta general, pero no se confirmó un consumidor con valor falso       | `CAPACIDAD_LATENTE`                | `SHELL-AUD-010`; `SHELL-AUD-011`                                      |
| `H-SHELL-002-004` | la cadena de login alterna entre salto central directo, página local cliente y página local con modo desarrollo | `CONFIRMADO`                       | `SHELL-AUD-009`; `SHELL-AUD-010`                                      |
| `H-SHELL-002-005` | PULSO usa activamente un helper SSO cuyo host de respaldo pertenece a NEXO                                      | `IMPLEMENTADO_ACTIVO`              | `SHELL-AUD-009`; `SHELL-AUD-010`                                      |
| `H-SHELL-002-006` | FOGO conserva un helper SSO con host de ORIGO, sin consumidor externo confirmado                                | `SIN_CONSUMIDOR_CONFIRMADO`        | `SHELL-AUD-011`                                                       |
| `H-SHELL-002-007` | seis repositorios tienen middleware global y PULSO no                                                           | `CONFIRMADO`                       | `SHELL-AUD-010`; `SHELL-AUTH-001`; `SHELL-AUTH-005`                   |
| `H-SHELL-002-008` | los matchers no son equivalentes y todos los presentes excluyen `/api`                                          | `CONFIRMADO`                       | `SHELL-AUD-010`; `SHELL-AUTH-002`; `SHELL-AUTH-004`; `SHELL-AUTH-005` |
| `H-SHELL-002-009` | NEXO incrusta una restricción operativa de kiosco dentro del middleware de autenticación                        | `EXTENSION_LOCAL_CONFIRMADA`       | `SHELL-AUD-004`; `SHELL-AUD-009`; `SHELL-AUD-010`                     |
| `H-SHELL-002-010` | ORIGO posee una excepción pública explícita con validación de token o sesión en el route handler                | `PROTECCION_EN_DESTINO_CONFIRMADA` | `SHELL-AUD-010`                                                       |
| `H-SHELL-002-011` | tres helpers `supabase/proxy.ts` no tienen invocación externa confirmada                                        | `SIN_CONSUMIDOR_CONFIRMADO`        | `SHELL-AUD-008`; `SHELL-AUD-011`                                      |
| `H-SHELL-002-012` | los motivos de denegación no son uniformes entre resultado falso, error RPC y variante VISO                     | `CONFIRMADO`                       | `SHELL-AUD-009`; `SHELL-AUD-010`                                      |
| `H-SHELL-002-013` | la cobertura completa de rutas PULSO no puede probarse por ausencia de middleware global                        | `PENDIENTE_DE_EVIDENCIA`           | `SHELL-AUD-010`; `SHELL-AUTH-004`; `SHELL-AUTH-005`                   |

Ningún hallazgo queda asignado a una fase genérica. Cada uno tiene una tarea documental existente y, cuando requiere materialización técnica, un destino exacto entre `SHELL-CON-002`, `SHELL-AUTH-001`, `SHELL-AUTH-002`, `SHELL-AUTH-004` y `SHELL-AUTH-005`.

---

#### 12. Decisiones de esta tarea

1. `guard.ts`, `middleware.ts`, `/login`, `sso.ts` y `supabase/proxy.ts` no se tratarán como una única pieza: representan fronteras distintas.
2. La paridad de autenticación no se inferirá por compartir el nombre `requireAppAccess`.
3. NEXO, FOGO, ORIGO y NUMERA forman el único grupo byte-idéntico de guard de aplicación.
4. VISO conserva una excepción activa por permiso específico que deberá declararse como regla canónica o eliminarse en `SHELL-AUD-010`.
5. La bandera PULSO no se clasificará como bypass activo mientras no exista un consumidor con valor falso.
6. PULSO no se considerará cubierto globalmente por poseer guards en páginas conocidas.
7. Los helpers `supabase/proxy.ts` no se contarán como middleware ni como evidencia de protección hasta confirmar su invocación.
8. La excepción pública ORIGO se conservará como excepción explícita sujeta a prueba, no como exclusión accidental.
9. La restricción de kiosco NEXO se conservará como extensión local candidata, no como comportamiento transversal del guard.
10. Los helpers SSO sin consumidor confirmado no se retirarán antes de `SHELL-AUD-011`.
11. El host de respaldo activo de PULSO deberá corregirse o parametrizarse mediante `SHELL-CON-002` y adoptarse durante `SHELL-AUTH-005`; esta tarea solo registra el estado actual.
12. La lista de orígenes permitidos para `returnTo` deberá provenir del contrato canónico vigente, no de aceptación genérica de HTTP/HTTPS.
13. La equivalencia de decisiones de permisos y simulación se resolverá en `SHELL-AUD-003` a `SHELL-AUD-005`.
14. La clasificación final de cada pieza se resolverá únicamente en `SHELL-AUD-010`.
15. No se modifica `active-sequence.json`.
16. No se crea ninguna tarea nueva.
17. No se modifica código, Supabase, configuración ni despliegues.
18. `SHELL-AUD-003` permanece como única continuidad reservada.

---

#### 13. Trazabilidad con requisitos vigentes

Los hallazgos no introducen una regla verificable nueva. Permanecen cubiertos por:

- `TREQ-SHELL-002`: paridad y clasificación de responsabilidades compartidas;
- `TREQ-SHELL-004`: evidencia obligatoria antes de retirar artefactos sin consumidor;
- `TREQ-SHELL-018`: validación y restricción de `returnTo`;
- `TREQ-SHELL-023`: cobertura de rutas y exclusiones explícitas de middleware;
- `TREQ-SHELL-024`: fallo cerrado, cookies y redirección sin bucles;
- `TREQ-SHELL-034`: correspondencia entre destinos absolutos y aplicaciones aprobadas;
- `TREQ-AUTH-001`: autorización canónica sin listas locales de rol;
- `TREQ-AUTH-004`: equivalencia entre evaluadores;
- `TREQ-AUTH-013`: protección de URL directa, API, RPC y mutaciones en servidor;
- `TREQ-AUTH-014`: invalidación de sesión, contexto y decisiones derivadas;
- `TREQ-AUTH-015`: evidencia correlacionable de decisiones y denegaciones.

Esta tarea no altera identificador, regla, estado, responsable, paquete, evidencia ni relación de ninguna fila del registro canónico.

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la comparación materializa variantes, excepciones y límites de cobertura ya protegidos por requisitos vigentes de paridad, URL directa, middleware, redirección, cookies, autorización y conservación de artefactos. No introduce comportamiento nuevo ni modifica contratos ejecutables.

---

#### 14. Criterios de aceptación

`SHELL-AUD-002` se considera materialmente completa porque:

- las siete superficies web runtime estén representadas una sola vez;
- las seis copias de `guard.ts` estén agrupadas por identidad y contrato;
- la variante base, la variante VISO y la variante PULSO estén comparadas por dimensión;
- la excepción activa de VISO y la capacidad latente de PULSO estén diferenciadas;
- los seis middlewares presentes y la ausencia PULSO estén registrados;
- matchers, fallo cerrado, limpieza de cookies y destinos de login estén contrastados;
- las extensiones de kiosco NEXO y PDF público ORIGO tengan clasificación y destino;
- la cadena `/login` y SSO esté comparada por repositorio;
- los hosts de respaldo literales estén documentados sin confundir código consumido y no consumido;
- los tres helpers `supabase/proxy.ts` estén separados de la frontera global y tengan destino;
- la cobertura PULSO permanezca como evidencia pendiente, sin declararse segura ni vulnerable por inferencia;
- cada hallazgo tenga una tarea existente responsable;
- se declaren cero cambios de requisitos de prueba;
- no se modifique código, configuración, Supabase, despliegues ni continuidad;
- `SHELL-AUD-003` permanezca como única tarea reservada.

---

#### 15. Resultado y continuidad

La comparación deja establecida la cadena:

```text
ruta solicitada
→ frontera global disponible o ausente
→ sesión autenticada
→ destino de login y returnTo
→ sesión operativa
→ puerta general de aplicación
→ permiso específico
→ excepción local explícita
→ decisión y motivo
```

La única continuidad reservada es:

```text
SHELL-AUD-003 — Comparar helpers de permisos
```

No se inicia, desarrolla ni modifica esa tarea dentro de este artefacto.


### ✅ SHELL-AUD-003 — Comparar helpers de permisos

**Estado:** APROBADA
**Bloque:** H — Fundación compartida
**Tipo:** auditoría transversal de paridad, consumidores y deuda contractual de permisos
**Entradas aprobadas:** `SHELL-AUD-001`; `SHELL-AUD-002`
**Continuidad reservada:** `SHELL-AUD-004 — Comparar contexto operativo`
**Fecha de corte:** 2026-08-01
**Corte documental de `vento-shell`:** `dfec6771ec3cee58144c5672a8f853d534bbeaba`
**Cambios en código, CI, despliegues o Supabase:** no autorizados ni realizados

---

#### 1. Resultado de esta tarea

Esta tarea compara la implementación real de los helpers de permisos en las siete superficies web runtime de Vento OS, identifica sus variantes físicas y semánticas, materializa sus consumidores y separa la construcción de claves, la evaluación de permisos, la compatibilidad RPC y las excepciones locales.

| Métrica                                                                                     |    Resultado |
| ------------------------------------------------------------------------------------------- | -----------: |
| Superficies web runtime evaluadas                                                           |        **7** |
| Copias de `src/lib/auth/permissions.ts`                                                     |        **6** |
| Variantes físicas por blob SHA                                                              |        **4** |
| Algoritmos runtime distintos dentro de `permissions.ts`                                     |        **1** |
| Contratos TypeScript de cliente dentro de `permissions.ts`                                  |        **2** |
| Superficies sin `permissions.ts`                                                            | **1: SHELL** |
| Evaluadores locales de launcher                                                             |        **1** |
| Archivos de negocio o launcher con llamadas directas confirmadas fuera de las familias auth |       **11** |
| Referencias literales de permisos en esos 11 archivos                                       |       **18** |
| Claves literales únicas en esos 11 archivos                                                 |       **16** |
| Fallbacks locales de autorización por rol detectados                                        |        **1** |
| Firmas RPC consumidas por el launcher de SHELL                                              |        **2** |
| Firmas RPC localizadas en migraciones versionadas inspeccionadas                            |        **1** |
| Artefactos de prueba dedicados al helper localizados                                        |        **0** |
| Hallazgos materializados                                                                    |       **14** |

Resultado central:

```text
SEIS COPIAS DE permissions.ts
→ CUATRO BLOBS
→ UN MISMO ALGORITMO RUNTIME
→ DOS SUPERFICIES DE TIPADO

PERO

EVALUACIÓN DE PERMISOS REAL
→ HELPER COMPARTIDO
+ GUARDS CON RPC DIRECTA
+ ROLE OVERRIDE
+ CONTEXTO OPERATIVO
+ LLAMADAS LOCALES DE NEGOCIO
+ FALLBACK DEL LAUNCHER SHELL
```

La identidad semántica de `permissions.ts` no demuestra paridad integral de autorización. La decisión final sigue distribuida entre múltiples rutas y algunos consumidores incorporan fallbacks o contratos distintos.

---

#### 2. Fuentes y corte reproducible

| Fuente                                                   | Uso                                                                    |
| -------------------------------------------------------- | ---------------------------------------------------------------------- |
| `docs/plan-canonico/modular/01_PROTOCOLO.md`             | continuidad, alcance, entrega y trazabilidad                           |
| `docs/plan-canonico/modular/delivery-contract.json`      | contrato físico del artefacto                                          |
| `docs/plan-canonico/modular/active-sequence.json`        | secuencia `H-SHARED-AUDIT-001`                                         |
| `01_AUDITORIA_DE_COMPONENTES_COMPARTIDOS.md`             | propietario, `SHELL-AUD-001`, `SHELL-AUD-002` y marcador actual        |
| `SHELL-AUD-001`                                          | universo de repositorios, familias y hashes                            |
| `SHELL-AUD-002`                                          | frontera de guards y separación de autenticación frente a autorización |
| `AUTH-CAT-017` a `AUTH-CAT-019`                          | fuente técnica, tipos derivados y prohibición de cadenas manuales      |
| `03_AUTORIZACION_Y_CONTEXTO_COMPARTIDOS.md`              | arquitectura obligatoria de contratos, SDK y Supabase                  |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`       | cobertura vigente de paridad, claves y compatibilidad RPC              |
| `20260117130000_permissions_core.sql`                    | firma versionada de `public.has_permission`                            |
| Código de SHELL, VISO, NEXO, FOGO, ORIGO, PULSO y NUMERA | implementación y consumidores reales                                   |

Commits de consumidores:

| Superficie | Repositorio                  | Commit inspeccionado                       |
| ---------- | ---------------------------- | ------------------------------------------ |
| SHELL      | `devVentoGroup/vento-shell`  | `dfec6771ec3cee58144c5672a8f853d534bbeaba` |
| VISO       | `devVentoGroup/vento-viso`   | `47322403f3c64e83ae0c4a2f68c05d47093e5bb4` |
| NEXO       | `devVentoGroup/vento-nexo`   | `142c4d696221e3ce3fda4ed3b62f3d1fe5b58799` |
| FOGO       | `devVentoGroup/vento-fogo`   | `b6b9ed00e5267cabaac1a5a1090d93d5f60e86f2` |
| ORIGO      | `devVentoGroup/vento-origo`  | `b7a8303fa078ef087f522b6c99059ababfc27472` |
| PULSO      | `devVentoGroup/vento-pulso`  | `71e0184486b5fe11e0a42435baf4024807a80efd` |
| NUMERA     | `devVentoGroup/vento-numera` | `1b48a5da425d92e19ed89cf175b1dccc4cd960e1` |

---

#### 3. Límite exacto

Se comparan:

1. `src/lib/auth/permissions.ts` en los seis consumidores que lo contienen;
2. construcción y normalización de claves;
3. firma de `checkPermission`;
4. parámetros enviados a `has_permission`;
5. comportamiento ante concesión, denegación y error;
6. consumidores dentro de guards y role override;
7. llamadas directas a `has_permission` fuera de las familias auth;
8. evaluador local del launcher de SHELL;
9. firmas RPC consumidas y evidencia de migraciones versionadas;
10. presencia de pruebas específicas del helper.

Se excluyen de la decisión sustantiva de esta tarea:

- resolución completa de turno, check-in, sesión y dispositivo compartido, reservada a `SHELL-AUD-004`;
- validez y precedencia de role override, reservada a `SHELL-AUD-005`;
- AppShell y navegación, reservadas a `SHELL-AUD-006`;
- clientes Supabase, reservados a `SHELL-AUD-008`;
- tipos y contratos definitivos, reservados a `SHELL-AUD-009`;
- decisión final `compartir / generar / mantener local`, reservada a `SHELL-AUD-010`;
- retiro de código sin consumidor, reservado a `SHELL-AUD-011`;
- implementación del catálogo, SDK, RPC, RLS, migraciones o consumidores.

---

#### 4. Criterios de comparación

| Dimensión           | Pregunta                                                    |
| ------------------- | ----------------------------------------------------------- |
| Identidad física    | ¿Los archivos son byte a byte iguales?                      |
| Identidad semántica | ¿Producen la misma llamada y el mismo resultado observable? |
| Entrada             | ¿Reciben una clave canónica o strings libres?               |
| Normalización       | ¿Validan, resuelven o solo concatenan?                      |
| Contexto            | ¿Qué dimensiones transmiten al evaluador?                   |
| Backend             | ¿Qué RPC y firma consumen?                                  |
| Fallo               | ¿Distinguen error técnico de denegación?                    |
| Resultado           | ¿Retornan booleano o decisión estructurada?                 |
| Compatibilidad      | ¿Gestionan aliases, legacy, retirados y versiones?          |
| Consumo             | ¿Todos los consumidores usan la misma frontera?             |
| Excepciones         | ¿Existe lógica local que amplíe o sustituya el evaluador?   |
| Prueba              | ¿Hay evidencia automatizada de paridad y regresión?         |

Un blob distinto por BOM, CRLF o salto final no se clasifica como divergencia funcional cuando el programa ejecutable permanece equivalente.

---

#### 5. Inventario de `permissions.ts`

| ID             | Aplicación | Blob SHA                                   | Contrato de cliente                                | Algoritmo runtime                     | Clasificación                        |
| -------------- | ---------- | ------------------------------------------ | -------------------------------------------------- | ------------------------------------- | ------------------------------------ |
| `PERM-COPY-01` | VISO       | `fa81328fe4fd5ec2dd8ffd67f09b0e76578c99cd` | cliente derivado de `createClient` del repositorio | común                                 | `SEMANTICA_COMUN_FORMATO_DIVERGENTE` |
| `PERM-COPY-02` | NEXO       | `a5a2b7e6f914075d78cc72a9b016994f5a102dde` | cliente derivado de `createClient` del repositorio | común                                 | `COPIA_BASE`                         |
| `PERM-COPY-03` | FOGO       | `a5a2b7e6f914075d78cc72a9b016994f5a102dde` | cliente derivado de `createClient` del repositorio | común                                 | `COPIA_BASE`                         |
| `PERM-COPY-04` | ORIGO      | `a5a2b7e6f914075d78cc72a9b016994f5a102dde` | cliente derivado de `createClient` del repositorio | común                                 | `COPIA_BASE`                         |
| `PERM-COPY-05` | PULSO      | `8087fbe3b949c9b8fe553f1d1d76ef4da169bd22` | `Pick<SupabaseClient, "rpc">`                      | común                                 | `VARIANTE_DE_TIPO_COMPATIBLE`        |
| `PERM-COPY-06` | NUMERA     | `a5b1debdfbc30c5d302f1bdc933cd832b759f856` | cliente derivado de `createClient` del repositorio | común                                 | `SEMANTICA_COMUN_FORMATO_DIVERGENTE` |
| `PERM-COPY-07` | SHELL      | no existe                                  | no aplica                                          | evaluador local en `src/app/page.tsx` | `FRONTERA_LOCAL_DISTINTA`            |

Conciliación:

- 7 superficies esperadas;
- 7 decisiones materializadas;
- 6 archivos presentes;
- 1 ausencia explícita;
- 4 blobs únicos;
- 1 algoritmo runtime dentro de las seis copias;
- 2 contratos TypeScript de cliente;
- 0 identidades omitidas.

La variante de PULSO reduce correctamente la dependencia estática a la capacidad `rpc`. No cambia los parámetros, la normalización, el tratamiento del error ni el resultado runtime.

---

#### 6. Contrato ejecutado por las seis copias

Las seis copias materializan este comportamiento equivalente:

```text
normalizePermissionCode(appId, code)
    si code comienza por appId + "."
        devolver code
    en otro caso
        devolver appId + "." + code

checkPermission(client, appId, code, context)
    llamar has_permission(
        p_permission_code = normalizePermissionCode(appId, code),
        p_site_id = context.siteId o null,
        p_area_id = context.areaId o null
    )

    si RPC produce error
        devolver false

    devolver Boolean(data)
```

Matriz contractual:

| Dimensión                               | Resultado actual                                          |
| --------------------------------------- | --------------------------------------------------------- |
| `appId`                                 | `string` libre                                            |
| `code`                                  | `string` libre                                            |
| `PermissionContext.siteId`              | `string                                                   | null | undefined` |
| `PermissionContext.areaId`              | `string                                                   | null | undefined` |
| Validación contra catálogo              | inexistente                                               |
| Validación de aplicación                | inexistente                                               |
| Resolución de alias                     | inexistente                                               |
| Rechazo explícito de legacy o retirados | inexistente                                               |
| Versión y hash contractual              | no transmitidos                                           |
| Firma RPC                               | `has_permission(p_permission_code, p_site_id, p_area_id)` |
| Error RPC                               | convertido a `false`                                      |
| Denegación                              | `false`                                                   |
| Resultado                               | `boolean`                                                 |
| Razón estructurada                      | inexistente                                               |
| Evidencia de decisión                   | no producida por el helper                                |

La función llamada `normalizePermissionCode` no normaliza contra el catálogo. Solo evita repetir el prefijo cuando la cadena ya comienza exactamente por la aplicación recibida.

Casos permitidos por su firma actual:

| Entrada                                   | Salida construida   |
| ----------------------------------------- | ------------------- |
| `appId = "nexo"`, `code = "access"`       | `nexo.access`       |
| `appId = "nexo"`, `code = "nexo.access"`  | `nexo.access`       |
| `appId = "nexo"`, `code = "origo.access"` | `nexo.origo.access` |
| `appId = "nexo"`, `code = ""`             | `nexo.`             |
| `appId = ""`, `code = "access"`           | `.access`           |
| espacios en cualquiera de los parámetros  | se conservan        |

La construcción determinista no equivale a validación canónica.

---

#### 7. Topología de consumo dentro de autenticación y autorización

| Aplicación | `normalizePermissionCode` | `checkPermission`   | RPC directa en guard                 | Fallback desde role override | Evaluador operativo separado |
| ---------- | ------------------------- | ------------------- | ------------------------------------ | ---------------------------- | ---------------------------- |
| VISO       | sí                        | sí                  | no para el carril personal principal | sí                           | sí                           |
| NEXO       | sí                        | no en el guard base | sí                                   | sí                           | sí                           |
| FOGO       | sí                        | no en el guard base | sí                                   | sí                           | sí                           |
| ORIGO      | sí                        | no en el guard base | sí                                   | sí                           | sí                           |
| PULSO      | sí                        | no en el guard      | sí                                   | sí                           | sí                           |
| NUMERA     | sí                        | no en el guard base | sí                                   | sí                           | sí                           |
| SHELL      | no consume la copia       | no consume la copia | evaluador local                      | no aplica                    | no aplica                    |

Consecuencias:

1. `normalizePermissionCode` forma parte de las seis rutas de guard.
2. `checkPermission` no es la única frontera de evaluación personal.
3. VISO usa `checkPermission` dentro de su guard; las demás variantes de guard llaman la RPC directamente.
4. Los módulos de role override reutilizan `checkPermission` como fallback cuando no existe simulación válida.
5. El dispositivo compartido usa otra función, `checkOperationalSessionPermission`, cuyo contrato se resolverá en `SHELL-AUD-004`.
6. La misma RPC puede alcanzarse por helpers, guards y llamadas locales sin un adapter único que concentre telemetría, versión, error y razones.

Las listas de permisos de los guards se evalúan actualmente con semántica `ALL`: cada elemento debe retornar verdadero. No existe en el helper una entrada estructurada que declare `ALL` o `ANY`.

---

#### 8. Evaluador local de SHELL

SHELL no contiene `src/lib/auth/permissions.ts`. Su launcher implementa en `src/app/page.tsx` un evaluador local con cinco aplicaciones y cinco claves escritas manualmente:

```text
viso.access
nexo.access
fogo.access
origo.access
pulso.access
```

Flujo comprobado:

```text
1. llamar has_permission con p_permission_code completo;
2. si la llamada no produce error, usar su booleano;
3. solo si produce error, dividir la clave por el primer punto;
4. llamar has_permission con p_app_id y p_code;
5. si la segunda llamada produce error, deshabilitar la tarjeta.
```

La migración versionada `20260117130000_permissions_core.sql` contiene la firma:

```text
has_permission(
    p_permission_code text,
    p_site_id uuid default null,
    p_area_id uuid default null
)
```

No se localizó en el historial versionado inspeccionado una definición de `has_permission(p_app_id, p_code, ...)`. La existencia o ausencia de esa firma en el ambiente desplegado no se infiere desde el repositorio y permanece `PENDIENTE_DE_EVIDENCIA_REMOTA` para `AUTH-DB-034`.

La compatibilidad está cubierta por `TREQ-SHELL-015`; no constituye un requisito nuevo.

---

#### 9. Llamadas directas fuera de las familias auth

El siguiente inventario excluye `guard.ts`, `permissions.ts`, `operational-session.ts` y `role-override.ts`. Registra superficies de negocio o launcher que llaman directamente la RPC o mantienen su propia decisión.

| Aplicación | Archivos | Referencias literales | Claves únicas | Comportamiento relevante                                                     |
| ---------- | -------: | --------------------: | ------------: | ---------------------------------------------------------------------------- |
| SHELL      |        1 |                     5 |             5 | launcher con fallback entre dos firmas                                       |
| VISO       |        4 |                     7 |             6 | rutas server y flags de interfaz; error se trata como denegación             |
| NEXO       |        0 |                     0 |             0 | no se localizaron llamadas de negocio fuera de las familias auth en el corte |
| FOGO       |        0 |                     0 |             0 | no se localizaron llamadas de negocio fuera de las familias auth en el corte |
| ORIGO      |        4 |                     4 |             3 | rutas server y helper local; incluye fallback por rol                        |
| PULSO      |        2 |                     2 |             2 | una Server Action y una comprobación cliente de visibilidad                  |
| NUMERA     |        0 |                     0 |             0 | no se localizaron llamadas de negocio fuera de las familias auth en el corte |
| **Total**  |   **11** |                **18** |        **16** | —                                                                            |

##### 9.1. VISO

Superficies confirmadas:

- `src/app/api/viso/upload-product-image/route.ts`;
- `src/app/api/viso/upload-commercial-menu-image/route.ts`;
- `src/app/api/viso/attendance-report/route.ts`;
- `src/app/staff/[id]/page.tsx`.

Claves:

```text
viso.menu.images.manage
viso.access
viso.staff.documents.manage
viso.staff.employee_photos.manage
viso.staff.permissions.manage
viso.staff.manage
```

`viso.menu.images.manage` aparece en dos rutas. Los errores se convierten en `403` o en flags falsos.

##### 9.2. ORIGO

Superficies confirmadas:

- `src/lib/suppliers.ts`;
- `src/app/receipts/new/page.tsx`;
- `src/app/product-master-review/page.tsx`;
- `src/app/purchase-orders/[id]/pdf/route.ts`.

Claves:

```text
origo.suppliers.manage
origo.procurement.receipts
origo.access
```

`origo.procurement.receipts` aparece en dos páginas.

`src/lib/suppliers.ts` amplía localmente el resultado: si `has_permission("origo.suppliers.manage")` no concede, consulta `employees.role` y concede a `propietario`, `gerente_general` o `gerente`. La función no conserva el error de la RPC y no demuestra que esa ampliación pertenezca al contrato canónico. Su validez corresponde a `SHELL-AUD-005`; su disposición corresponde a `SHELL-AUD-010` y su migración a `SHELL-AUTH-005`.

##### 9.3. PULSO

Superficies confirmadas:

- `src/modules/pos/actions/identify-client.action.ts` con `pulso.pos.main`;
- `src/app/orders/delivery-override-bridge.tsx` con `pulso.delivery.override`.

La Server Action trata error o falso como denegación. El bridge cliente extrae únicamente `data`; un error produce un valor no concedido sin diagnóstico y la comprobación solo controla la interfaz. La autoridad final deberá permanecer en servidor y en la RPC protegida.

---

#### 10. Comparación con el contrato canónico aprobado

| Obligación canónica                                      | Estado actual                                      | Brecha        |
| -------------------------------------------------------- | -------------------------------------------------- | ------------- |
| Clave activa representada por `PermissionKey`            | `string` libre                                     | confirmada    |
| Constantes derivadas de `@vento/contracts/authorization` | literales y concatenación                          | confirmada    |
| Parser de frontera para valores externos                 | no existe en estos helpers                         | confirmada    |
| Rechazo explícito de clave desconocida                   | depende de la RPC y se reduce a `false`            | confirmada    |
| Alias resuelto explícitamente y con telemetría           | no modelado                                        | confirmada    |
| Legacy y retirados separados de activos                  | no modelado                                        | confirmada    |
| Versión y hash contractual conocidos                     | no modelados                                       | confirmada    |
| Error técnico distinguible de denegación                 | ambos terminan como falso en el helper             | confirmada    |
| Razones estructuradas                                    | no modeladas                                       | confirmada    |
| Una frontera compartida para consumidores                | existen helpers, RPC directa y evaluadores locales | no demostrada |
| Excepciones locales declaradas                           | existe fallback por rol en ORIGO                   | no demostrada |
| Paridad automatizada entre evaluadores                   | no se localizó prueba dedicada                     | no demostrada |

Arquitectura obligatoria aplicable:

```text
@vento/contracts/authorization
→ PermissionKey, catálogo, constantes, aliases, estados y metadatos

@vento/os-context
→ adapter compartido, scope por solicitud, deduplicación y proyecciones seguras

Supabase
→ evaluate_authorization, contexto autoritativo, resolutores y persistencia
```

No se crea ni se propone un paquete paralelo `@vento/auth`.

---

#### 11. Hallazgos materializados

| ID                    | Hallazgo                                                                                                               | Estado                          | Riesgo                                                          | Destino exacto                                                                                 |
| --------------------- | ---------------------------------------------------------------------------------------------------------------------- | ------------------------------- | --------------------------------------------------------------- | ---------------------------------------------------------------------------------------------- |
| `H-SHELL-AUD-003-001` | Seis copias de `permissions.ts` producen un algoritmo runtime equivalente, pero conservan cuatro blobs.                | `CONFIRMADO`                    | deriva física sin control de versión                            | `SHELL-AUD-010`; `SHELL-PKG-001` a `SHELL-PKG-008`                                             |
| `H-SHELL-AUD-003-002` | PULSO usa una interfaz mínima `Pick<SupabaseClient, "rpc">`; las otras cinco copias dependen del cliente server local. | `CONFIRMADO`                    | acoplamiento de tipos y adapters incompatibles                  | `SHELL-AUD-009`; `SHELL-AUD-010`; `SHELL-AUTH-002`                                             |
| `H-SHELL-AUD-003-003` | `appId` y `code` son strings libres.                                                                                   | `CONFIRMADO`                    | claves huérfanas, mal escritas o construidas dinámicamente      | `SHELL-CON-003`; `SHELL-AUTH-004`; `SHELL-AUTH-005`                                            |
| `H-SHELL-AUD-003-004` | `normalizePermissionCode` concatena, pero no valida aplicación, formato, catálogo ni pertenencia.                      | `CONFIRMADO`                    | identidades inválidas tratadas como permisos solicitables       | `SHELL-CON-003`; `SHELL-AUD-009`; `SHELL-AUD-010`                                              |
| `H-SHELL-AUD-003-005` | Los helpers no distinguen permiso activo, alias, legacy o retirado.                                                    | `CONFIRMADO`                    | compatibilidad silenciosa o reactivación accidental             | `SHELL-AUD-009`; `SHELL-CON-003`; `SHELL-AUTH-001`; `SHELL-AUTH-004`                           |
| `H-SHELL-AUD-003-006` | Error técnico y denegación retornan el mismo `false`.                                                                  | `CONFIRMADO`                    | diagnóstico incompleto y decisiones no reproducibles            | `SHELL-AUD-009`; `SHELL-AUD-010`; `SHELL-AUTH-002`; `AUTH-DB-034`                              |
| `H-SHELL-AUD-003-007` | El resultado no conserva razón, versión, hash ni evidencia de decisión.                                                | `CONFIRMADO`                    | paridad y auditoría no demostrables                             | `SHELL-AUD-009`; `SHELL-AUTH-002`; `SHELL-AUTH-003`; `AUTH-DB-032`                             |
| `H-SHELL-AUD-003-008` | Guards, role override, contexto operativo y código de negocio no consumen una única frontera.                          | `CONFIRMADO`                    | misma solicitud evaluada por rutas distintas                    | `SHELL-AUD-004`; `SHELL-AUD-005`; `SHELL-AUD-010`; `SHELL-AUTH-005`                            |
| `H-SHELL-AUD-003-009` | SHELL implementa un evaluador local y un fallback entre dos firmas RPC.                                                | `CONFIRMADO`                    | transición permanente o divergencia de launcher                 | `SHELL-AUD-009`; `SHELL-AUD-010`; `AUTH-DB-034`; `SHELL-AUTH-005`                              |
| `H-SHELL-AUD-003-010` | La firma dividida consumida por SHELL no fue localizada en las migraciones versionadas inspeccionadas.                 | `PENDIENTE_DE_EVIDENCIA_REMOTA` | dependencia desplegada no reproducible desde repositorio        | `AUTH-DB-034`; condición de salida: inventario remoto autorizado y comparación con migraciones |
| `H-SHELL-AUD-003-011` | Once archivos de negocio o launcher conservan 18 referencias literales fuera de las familias auth.                     | `CONFIRMADO`                    | deuda transversal y bypass del adapter                          | `SHELL-CON-003`; `SHELL-AUTH-004`; `SHELL-AUTH-005`                                            |
| `H-SHELL-AUD-003-012` | ORIGO concede gestión de proveedores por una lista local de roles cuando la RPC no concede.                            | `CONFIRMADO`                    | excepción local que puede ampliar capacidad                     | `SHELL-AUD-005`; `SHELL-AUD-010`; `SHELL-AUTH-005`                                             |
| `H-SHELL-AUD-003-013` | PULSO consulta `pulso.delivery.override` desde cliente para visibilidad y no conserva el error.                        | `CONFIRMADO`                    | interfaz divergente si no coincide con la autoridad de servidor | `SHELL-AUD-010`; `SHELL-AUTH-002`; `SHELL-AUTH-005`                                            |
| `H-SHELL-AUD-003-014` | No se localizó una prueba dedicada que compare normalización, parámetros, errores y paridad de las variantes.          | `CONFIRMADO`                    | regresión entre copias o consumidores                           | `SHELL-AUTH-004`; `AUTH-QA-027`; cobertura por `TREQ-AUTH-004`                                 |

Todos los hallazgos tienen propietario y condición de resolución. No se crea una tarea nueva.

---

#### 12. Decisiones de esta auditoría

1. Las seis copias de `permissions.ts` se consideran una sola familia semántica con deriva física.
2. La variante de PULSO se conserva como evidencia de una necesidad válida: el adapter canónico no deberá exigir un cliente concreto cuando solo necesita `rpc`.
3. `normalizePermissionCode` se clasifica como constructor legacy, no como parser ni validador canónico.
4. `checkPermission` se clasifica como candidato de migración hacia un adapter compartido, pero su firma y su resultado actuales son insuficientes para convertirse sin cambios en contrato canónico.
5. Las llamadas directas no se declaran incorrectas únicamente por ser directas; sí quedan registradas como consumidores que deberán migrar o justificar su localidad.
6. El fallback de SHELL se conserva como compatibilidad temporal hasta que `AUTH-DB-034` determine la firma autoritativa y su transición.
7. La lista local de roles de ORIGO no se acepta como regla transversal ni se elimina en esta tarea; requiere comparación de role override y decisión final.
8. La comprobación cliente de PULSO se considera ayuda de interfaz y nunca autoridad final.
9. La semántica `ALL` de arrays se conserva como comportamiento observado; cualquier necesidad `ANY` deberá expresarse mediante contrato explícito y no por inferencia local.
10. No se mueve, elimina, centraliza ni modifica código durante esta auditoría.
11. `active-sequence.json` permanece sin cambios.
12. `SHELL-AUD-004` permanece como única continuidad reservada.

---

#### 13. Requisitos mínimos que deberá preservar la solución posterior

La futura frontera compartida deberá preservar o materializar, como mínimo:

| Dimensión      | Requisito                                                                               |
| -------------- | --------------------------------------------------------------------------------------- |
| Identidad      | recibir `PermissionKey` canónica, no `string` libre                                     |
| Serialización  | aceptar texto externo solo después de `parsePermissionKey` o resolución equivalente     |
| Catálogo       | conocer versión, schema y hash resueltos                                                |
| Compatibilidad | separar activo, alias, legacy y retirado                                                |
| Cliente        | depender de una capacidad mínima tipada y no de una implementación concreta innecesaria |
| Contexto       | consumir el contexto canónico sin reconstruirlo localmente                              |
| Backend        | usar la decisión autoritativa versionada definida por `AUTH-DB-034`                     |
| Resultado      | distinguir concesión, denegación, incompatibilidad y fallo técnico                      |
| Razones        | conservar códigos estructurados equivalentes entre consumidores                         |
| Auditoría      | permitir correlación con actor, permiso, contexto y versión contractual                 |
| Composición    | declarar `ALL`, `ANY` u otra política admitida de forma explícita                       |
| Localidad      | toda excepción local deberá existir en el contrato o quedar rechazada                   |
| Migración      | permitir convivencia temporal sin fallback indefinido                                   |
| Pruebas        | comparar cada adapter y consumidor contra la misma matriz de casos                      |

Esta tabla no implementa la solución ni modifica la arquitectura aprobada. Materializa los criterios que `SHELL-AUD-009`, `SHELL-AUD-010`, `SHELL-CON-003`, `SHELL-AUTH-001` a `SHELL-AUTH-005` y `AUTH-DB-034` deberán respetar.

---

#### 14. Trazabilidad con requisitos vigentes

La auditoría reutiliza sin modificación:

| Requisito        | Cobertura aplicada                                                                                          |
| ---------------- | ----------------------------------------------------------------------------------------------------------- |
| `TREQ-AUTH-002`  | claves canónicas, strings huérfanos, duplicados o mal escritos                                              |
| `TREQ-AUTH-004`  | paridad de decisión y razones entre todos los evaluadores; prohibición de excepciones locales no declaradas |
| `TREQ-SHELL-002` | paridad y clasificación de responsabilidades compartidas                                                    |
| `TREQ-SHELL-015` | compatibilidad explícita y temporal entre las dos firmas de `has_permission` consumidas por SHELL           |

La tarea no cambia regla, riesgo, prioridad, tipo, responsable, paquete, repositorio, estado, evidencia ni relaciones de esos requisitos.

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** todos los comportamientos verificables y riesgos detectados ya están cubiertos por `TREQ-AUTH-002`, `TREQ-AUTH-004`, `TREQ-SHELL-002` y `TREQ-SHELL-015`. La tarea materializa variantes, consumidores, fallos y destinos sin crear ni modificar comportamiento ejecutable ni alterar el ciclo de vida de esos requisitos. Por tanto, genera cero cambios en el registro canónico `04A`.

---

#### 15. Criterios de aceptación

`SHELL-AUD-003` queda materialmente completa cuando:

- las siete superficies web runtime estén representadas una sola vez;
- las seis copias de `permissions.ts` conserven ruta, hash, contrato de cliente y clasificación;
- se distinga identidad byte a byte de identidad semántica;
- se documente el algoritmo runtime común;
- se registren las dos superficies TypeScript sin convertirlas en divergencia funcional;
- se compruebe que `normalizePermissionCode` construye y no valida;
- se documente la firma RPC consumida por las seis copias;
- se distinga error técnico de denegación como brecha del contrato actual;
- se identifiquen guards, role override y contexto operativo como rutas consumidoras distintas;
- el evaluador local y el fallback de SHELL queden materializados;
- la firma dividida quede marcada con evidencia remota faltante y propietario exacto;
- los 11 archivos y 18 referencias literales fuera de las familias auth queden reconciliados;
- la excepción por rol de ORIGO y la comprobación cliente de PULSO tengan destino exacto;
- todos los hallazgos estén asignados a tareas existentes;
- no se absorba el alcance de `SHELL-AUD-004`, `SHELL-AUD-005`, `SHELL-AUD-009`, `SHELL-AUD-010` ni `SHELL-AUD-011`;
- se reutilicen los requisitos vigentes sin modificar `04A`;
- no se modifique código, CI, Supabase, despliegues ni continuidad;
- `SHELL-AUD-004` permanezca como única continuidad reservada.

---

#### 16. Resultado y continuidad

Cadena resultante:

```text
clave solicitada
→ constructor o literal local
→ adapter, guard o llamada directa
→ contexto transmitido
→ firma RPC
→ booleano, fallback o excepción local
→ hallazgo de paridad
→ contrato y adapter objetivo
→ migración de consumidores
```

La única continuidad reservada es:

```text
SHELL-AUD-004
— Comparar contexto operativo
```


### ✅ SHELL-AUD-004 — Comparar contexto operativo

**Estado:** APROBADA
**Bloque:** H — Fundación compartida
**Tipo:** auditoría documental comparativa de resolución, precedencia y consumo del contexto operativo
**Dependencia anterior aprobada:** `SHELL-AUD-003 — Comparar helpers de permisos`
**Base inmediata:** artefacto aprobado `SHELL-AUD-003_APROBADA_PARA_REEMPLAZAR.md` — SHA-256 `424da9a546a76833890649d8c2b96d1b056cb2ea3ce6023f0eb41a3ce273782c`
**Continuidad reservada:** `SHELL-AUD-005 — Comparar role override`
**Fecha de corte:** 2026-08-01
**Commit documental remoto inspeccionado:** `dfec6771ec3cee58144c5672a8f853d534bbeaba`
**Cambios en código, SQL, configuración, despliegues o Supabase:** no autorizados ni realizados

---

#### 1. Resultado de la tarea

Esta tarea materializa la comparación del contexto operativo actualmente resuelto por las aplicaciones web, los adapters locales, las RPC transitorias y el contrato canónico aprobado. La comparación conserva separadas la descripción del estado físico y la arquitectura objetivo: no presenta una implementación legacy como fuente normativa ni convierte un diseño futuro en comportamiento ya desplegado.

Resultado material:

- **7** superficies runtime comparadas: SHELL, VISO, NEXO, FOGO, ORIGO, PULSO y NUMERA;
- **10** familias de resolución o contrato materializadas con identidad estable;
- **4** carriles coexistentes de contexto: sesión local copiada, contexto operacional NEXO, contexto efectivo v1 y `AccessContext` canónico;
- **6** copias byte-idénticas de `src/lib/auth/operational-session.ts`;
- **1** adapter adicional de contexto operacional localizado únicamente en NEXO;
- **3** RPC o resolvers SQL de contexto comparados: `get_operational_context`, `get_effective_context_v1` y `current_shared_operational_device_v1`;
- **1** paquete compartido `@vento/os-context` existente, sin adopción runtime confirmada;
- **20** nodos o dimensiones contractuales contrastados;
- **7** decisiones de adopción materializadas por superficie;
- **18** hallazgos reconciliados con tareas responsables existentes;
- **0** archivos runtime, migraciones, datos, configuración o despliegues modificados;
- **0** requisitos de prueba creados, modificados, diferidos, descartados u obsoletos.

**Resultado de paridad:** `NO_DEMOSTRADA`.

La coincidencia byte a byte de las seis copias de `operational-session.ts` no demuestra un contexto operativo común. Ese helper no resuelve turno, check-in, rol operativo desde turno, readiness, simulación ni actor humano de dispositivo compartido; además permite que sede y área suministradas por el caller sustituyan sus valores locales. NEXO agrega un segundo carril con semántica distinta, y `get_effective_context_v1` agrega un tercero que tampoco implementa todavía `AccessContext@1.0.0`.

---

#### 2. Alcance exacto

##### 2.1. Incluido

- resolución local de sesión operativa en las seis aplicaciones consumidoras;
- ramas de empleado y dispositivo compartido;
- precedencia de sede y área en adapters y RPC;
- resolución de turno, check-in, rol operativo, sede y área activas;
- políticas por aplicación y su cobertura física;
- bypass administrativo que afecta `can_operate`;
- contexto efectivo de dispositivo, simulación y sesión real;
- forma, razones, readiness, metadata y frescura de cada carril;
- adopción efectiva por SHELL, VISO, NEXO, FOGO, ORIGO, PULSO y NUMERA;
- comparación con `AccessContext@1.0.0`, `get_access_context` y la arquitectura aprobada de `@vento/os-context`;
- trazabilidad de cada divergencia hacia una tarea existente.

##### 2.2. Excluido y conservado para tareas posteriores

| Materia                                                                     | Tarea propietaria                                                      |
| --------------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| legitimidad, firma, expiración y uso de cookies o sesiones de role override | `SHELL-AUD-005`                                                        |
| forma definitiva de AppShell y navegación contextual                        | `SHELL-AUD-006`                                                        |
| tipos y contratos públicos compartidos                                      | `SHELL-AUD-009`                                                        |
| decisión compartir / generar / mantener local                               | `SHELL-AUD-010`                                                        |
| retiro de declaraciones o adapters sin consumidor                           | `SHELL-AUD-011`                                                        |
| contratos de roles base, roles operativos, scopes, contexto y errores       | `SHELL-CON-004` a `SHELL-CON-008`                                      |
| consolidación del SDK único de autorización y contexto                      | `SHELL-AUTH-001` a `SHELL-AUTH-005`; `SHELL-CTX-001` a `SHELL-CTX-006` |
| implementación autoritativa de contexto, decisión, frescura y retiro legacy | `AUTH-DB-033`, `AUTH-DB-034`, `AUTH-DB-035` y `AUTH-DB-030`            |

La tarea compara el efecto observable de simulación y override sobre el contexto, pero no decide su autorización ni desarrolla `SHELL-AUD-005`.

---

#### 3. Fuentes, cortes y continuidad

| ID                | Repositorio o fuente                      | Commit / identidad                              | Rol en la comparación                                               |
| ----------------- | ----------------------------------------- | ----------------------------------------------- | ------------------------------------------------------------------- |
| `CTX-SURFACE-01`  | `vento-shell`                             | `dfec6771ec3cee58144c5672a8f853d534bbeaba`      | propietario documental, migraciones de contexto y paquete candidato |
| `CTX-SURFACE-02`  | `vento-viso`                              | `47322403f3c64e83ae0c4a2f68c05d47093e5bb4`      | consumidor de sesión local mediante guard                           |
| `CTX-SURFACE-03`  | `vento-nexo`                              | `142c4d696221e3ce3fda4ed3b62f3d1fe5b58799`      | consumidor de sesión local y del carril operacional adicional       |
| `CTX-SURFACE-04`  | `vento-fogo`                              | `b6b9ed00e5267cabaac1a5a1090d93d5f60e86f2`      | consumidor de sesión local mediante guard                           |
| `CTX-SURFACE-05`  | `vento-origo`                             | `b7a8303fa078ef087f522b6c99059ababfc27472`      | consumidor de sesión local y uso funcional directo                  |
| `CTX-SURFACE-06`  | `vento-pulso`                             | `71e0184486b5fe11e0a42435baf4024807a80efd`      | consumidor de sesión local mediante guard                           |
| `CTX-SURFACE-07`  | `vento-numera`                            | `1b48a5da425d92e19ed89cf175b1dccc4cd960e1`      | consumidor de sesión local mediante guard                           |
| `CTX-CONTRACT-01` | `AccessContext@1.0.0`                     | `AUTH-CTX-001`, `AUTH-CTX-009` a `AUTH-CTX-015` | fuente normativa del contexto canónico                              |
| `CTX-CONTRACT-02` | diseño `get_access_context(text) → jsonb` | `AUTH-CTX-025`                                  | frontera SQL canónica futura                                        |
| `CTX-CONTRACT-03` | arquitectura compartida                   | `03_AUTORIZACION_Y_CONTEXTO_COMPARTIDOS.md`     | define `@vento/os-context` como único SDK                           |

**Conciliación:** 7 superficies runtime esperadas, 7 materializadas, 0 omitidas y 0 duplicadas.

El remoto inspeccionado conserva una contradicción administrativa: `00_CABECERA_Y_ESTADO.md` todavía declara `SHELL-AUD-003` como tarea actual, mientras `active-sequence.json` apunta a `SHELL-PKG-001`. Conforme al protocolo, el artefacto local de `SHELL-AUD-003` aprobado expresamente por el usuario es la base inmediata de continuidad. Esta tarea no modifica archivos de continuidad ni interpreta el salto de `active-sequence.json` como autorización para abandonar el mini-bloque de auditoría.

---

#### 4. Taxonomía de comparación

| Estado                              | Criterio                                                                              |
| ----------------------------------- | ------------------------------------------------------------------------------------- |
| `PARIDAD_BYTE`                      | misma ruta y mismo blob Git                                                           |
| `PARIDAD_SEMANTICA`                 | mismas fuentes, precedencia, invariantes, salida y razones                            |
| `CONTEXTO_LOCAL_LEGACY`             | resolver copiado que produce una proyección local, no el snapshot canónico            |
| `CONTEXTO_OPERACIONAL_LOCAL`        | resolver especializado en una aplicación o proceso                                    |
| `CONTEXTO_EFECTIVO_TRANSITORIO`     | unifica varios carriles, pero conserva forma o reglas anteriores al contrato canónico |
| `CONTRATO_CANONICO_NO_IMPLEMENTADO` | contrato aprobado cuya implementación física final todavía no existe                  |
| `DIVERGENCIA_DE_FUENTE`             | el mismo nodo procede de fuentes distintas                                            |
| `DIVERGENCIA_DE_PRECEDENCIA`        | cambia el orden entre fuentes o carriles                                              |
| `DIVERGENCIA_DE_ATRIBUCION`         | principal, actor o dispositivo se representan de forma incompatible                   |
| `DIVERGENCIA_DE_READINESS`          | cambia la condición para considerar operable un carril                                |
| `CANDIDATO_SIN_ADOPCION`            | existe implementación compartida sin consumidor runtime confirmado                    |
| `NO_DEMOSTRADA`                     | no existe evidencia suficiente para afirmar equivalencia                              |

La comparación exige equivalencia de identidad, actor, rol, turno, check-in, territorio, dispositivo, simulación, readiness, razones, timestamp y frescura. La igualdad de un booleano `can_operate` no demuestra paridad contextual.

---

#### 5. Inventario de familias de contexto

| ID             | Familia                                                    |                     Ocurrencias | Estado actual                                                                   | Clasificación                       | Destino                                                                               |
| -------------- | ---------------------------------------------------------- | ------------------------------: | ------------------------------------------------------------------------------- | ----------------------------------- | ------------------------------------------------------------------------------------- |
| `CTX-IMPL-001` | `resolveOperationalSession` copiado                        |                           **6** | misma implementación en VISO, NEXO, FOGO, ORIGO, PULSO y NUMERA                 | `CONTEXTO_LOCAL_LEGACY`             | `SHELL-AUD-009`; `SHELL-AUD-010`; `SHELL-CTX-001`; `SHELL-AUTH-005`                   |
| `CTX-IMPL-002` | rama de empleado de `operational-session.ts`               |                           **6** | rol base y navegación colapsados; sede preferida o asignación/legacy            | `DIVERGENCIA_DE_FUENTE`             | `SHELL-CON-004`; `SHELL-CON-005`; `SHELL-CTX-002`; `SHELL-CTX-003`; `AUTH-DB-033`     |
| `CTX-IMPL-003` | rama de dispositivo compartido de `operational-session.ts` |                           **6** | `navigation_role` se trata como rol; sede y área admiten preferencia del caller | `DIVERGENCIA_DE_ATRIBUCION`         | `SHELL-CTX-001` a `SHELL-CTX-005`; `AUTH-DEV-007` a `AUTH-DEV-016`                    |
| `CTX-IMPL-004` | `nexo/src/lib/auth/operational-context.ts`                 |                           **1** | adapter de `get_operational_context`, mensajes y mutación por override          | `CONTEXTO_OPERACIONAL_LOCAL`        | `SHELL-AUD-005`; `SHELL-AUD-010`; `SHELL-CTX-001` a `SHELL-CTX-005`                   |
| `CTX-IMPL-005` | RPC `get_operational_context`                              |                           **1** | resuelve turno, check-in, rol, sitio, área, bypass y `can_operate`              | `CONTEXTO_OPERACIONAL_LEGACY`       | `AUTH-DB-033`; `AUTH-DB-030`; `SHELL-AUTH-005`                                        |
| `CTX-IMPL-006` | `app_operation_policies`                                   | **1 tabla / 1 fila confirmada** | solo NEXO exige turno, check-in y coincidencia de sede                          | `COBERTURA_PARCIAL_POR_APLICACION`  | `SHELL-AUD-010`; `SHELL-CTX-002`; `SHELL-CTX-004`; `AUTH-DB-033`; `AUTH-DB-034`       |
| `CTX-IMPL-007` | RPC `get_effective_context_v1`                             |                           **1** | precedencia dispositivo → simulación → contexto real                            | `CONTEXTO_EFECTIVO_TRANSITORIO`     | `AUTH-DB-033`; `AUTH-DB-034`; `AUTH-DB-030`; `SHELL-AUTH-001`                         |
| `CTX-IMPL-008` | RPC `current_shared_operational_device_v1`                 |                           **1** | devuelve dispositivo, restricciones y apps; consumidores usan subconjunto       | `PROYECCION_DE_DISPOSITIVO_PARCIAL` | `SHELL-CTX-001`; `SHELL-CTX-003`; `AUTH-DEV-007` a `AUTH-DEV-016`                     |
| `CTX-IMPL-009` | `@vento/os-context` client y tipos                         |                   **1 paquete** | expone contexto efectivo v1; no tiene consumidor runtime confirmado             | `CANDIDATO_SIN_ADOPCION`            | `SHELL-AUD-010`; `SHELL-AUD-011`; `SHELL-AUTH-001` a `SHELL-AUTH-005`                 |
| `CTX-IMPL-010` | `AccessContext@1.0.0` + `get_access_context`               |                  **1 contrato** | snapshot normativo aprobado, implementación física pendiente                    | `CONTRATO_CANONICO_NO_IMPLEMENTADO` | `AUTH-DB-033`; `SHELL-CTX-001` a `SHELL-CTX-006`; `SHELL-AUTH-001` a `SHELL-AUTH-005` |

**Conciliación:** 10 familias esperadas, 10 materializadas, 0 identificadores duplicados y 0 familias sin destino.

---

#### 6. Identidad física de las fronteras principales

| Frontera                                                     | Identidad física                                                                                                                     | Distribución                       |
| ------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------ | ---------------------------------- |
| `src/lib/auth/operational-session.ts`                        | blob `ea2310bfda5b6981dba2f2549a69f18229af76ac`                                                                                      | 6 copias byte-idénticas            |
| `nexo/src/lib/auth/operational-context.ts`                   | blob `d4355b544a5d9f37eb77b8bf56ff4e281dd73840`                                                                                      | solo NEXO                          |
| `get_operational_context` vigente en el historial versionado | migración `20260701194950_validate_operational_context_role_matrix.sql`; blob `a0d151fbc98332d76c9364d3bb3061165a0a50e7`             | Supabase VENTO desde `vento-shell` |
| `get_effective_context_v1` con sesiones                      | migración `20260713214153_effective_context_sessions_v1.sql`; blob `fbd4524da808dc9dc6ba96251c25d319677862fb`                        | Supabase VENTO desde `vento-shell` |
| `current_shared_operational_device_v1`                       | migración `20260709220249_include_navigation_role_in_current_shared_device_rpc.sql`; blob `22f768e7cfcb05e3e194b341486ee0aa67bb915a` | Supabase VENTO desde `vento-shell` |
| `packages/os-context/src/client.ts`                          | blob `43fab8004617175ae22e378032a69e92e4a922d1`                                                                                      | solo paquete SHELL                 |
| `packages/os-context/src/types.ts`                           | blob `fa465800403f7b83fae9899c5799dc072e3c2ce4`                                                                                      | solo paquete SHELL                 |

La identidad byte de las copias locales permite tratarlas como una sola clase de implementación. No elimina su divergencia respecto de las RPC ni del contrato canónico.

---

#### 7. Los cuatro carriles coexistentes

| Carril                             | Entrada principal                       | Fuentes                                                       | Salida                                            | Consumidores confirmados                                       | Resultado                   |
| ---------------------------------- | --------------------------------------- | ------------------------------------------------------------- | ------------------------------------------------- | -------------------------------------------------------------- | --------------------------- |
| `CTX-LANE-01` sesión local copiada | `userId`, `appId`, sede/área preferidas | dispositivo o empleado, `employee_sites`, `employees.site_id` | `OperationalSession` plano                        | guards de las seis aplicaciones y usos funcionales adicionales | `LEGACY_ACTIVO`             |
| `CTX-LANE-02` operacional NEXO     | empleado, sede y app                    | turno, asistencia, políticas, rol operativo, matrices         | fila `OperationalContextRow` + booleano y razones | flujos de remisiones NEXO                                      | `LOCAL_ESPECIALIZADO`       |
| `CTX-LANE-03` efectivo v1          | `auth.uid()` y app                      | dispositivo, simulación o carril operacional                  | `EffectiveContext` plano                          | cliente del paquete sin consumo runtime confirmado             | `TRANSITORIO_SIN_ADOPCION`  |
| `CTX-LANE-04` canónico             | principal autenticado y app             | fuentes empresariales autoritativas validadas                 | `AccessContext@1.0.0` inmutable                   | implementación futura                                          | `NORMATIVO_NO_IMPLEMENTADO` |

**Conciliación:** 4 carriles identificados, 4 comparados y 0 carriles presentados como equivalentes sin evidencia.

---

#### 8. Comparación nodo por nodo con `AccessContext@1.0.0`

| ID              | Nodo o dimensión                   | Sesión local copiada            | Contexto operacional NEXO                    | Contexto efectivo v1                                                   | Resultado            |
| --------------- | ---------------------------------- | ------------------------------- | -------------------------------------------- | ---------------------------------------------------------------------- | -------------------- |
| `CTX-FIELD-001` | principal autenticado              | solo `userId`                   | `employee_id` suministrado o `auth.uid()`    | `user_id = auth.uid()`                                                 | `PARCIAL`            |
| `CTX-FIELD-002` | actor efectivo                     | no existe                       | empleado asumido                             | no existe nodo de atribución                                           | `AUSENTE`            |
| `CTX-FIELD-003` | identidad de dominio               | no existe                       | no existe                                    | no existe                                                              | `AUSENTE`            |
| `CTX-FIELD-004` | empleado válido y estado laboral   | fila opcional sin estado        | ID y rol sin contrato laboral completo       | rol real opcional                                                      | `PARCIAL`            |
| `CTX-FIELD-005` | rol base                           | `role` de empleado              | `employee.role` usado también para bypass    | `real_administrative_role`                                             | `PARCIAL_DIVERGENTE` |
| `CTX-FIELD-006` | sedes asignadas                    | toma una sede primaria o legacy | no expone lista                              | no expone lista                                                        | `AUSENTE`            |
| `CTX-FIELD-007` | áreas asignadas                    | no existe                       | no expone lista                              | no expone lista                                                        | `AUSENTE`            |
| `CTX-FIELD-008` | cobertura administrativa           | no existe                       | se reemplaza por bypass/permiso              | no existe nodo explícito                                               | `AUSENTE`            |
| `CTX-FIELD-009` | turno activo                       | no existe                       | ID, sede, área y rol del turno               | ID del turno real; nulo en dispositivo/simulación                      | `PARCIAL`            |
| `CTX-FIELD-010` | check-in activo                    | no existe                       | ID y sede; área no resuelta                  | no expone check-in                                                     | `PARCIAL_INCOMPLETO` |
| `CTX-FIELD-011` | rol operativo                      | `navigationRole = role`         | rol del turno o override local               | rol del dispositivo, simulación o turno                                | `DIVERGENTE`         |
| `CTX-FIELD-012` | sede operativa                     | sede preferida/asignada/legacy  | precedencia configurable distinta al turno   | sede del carril elegido                                                | `DIVERGENTE`         |
| `CTX-FIELD-013` | área operativa                     | área preferida o dispositivo    | turno; check-in no aporta área               | área del carril elegido                                                | `DIVERGENTE`         |
| `CTX-FIELD-014` | dispositivo                        | proyección mínima               | no pertenece al resolver base                | ID y bandera, sin actor humano                                         | `PARCIAL_DIVERGENTE` |
| `CTX-FIELD-015` | simulación                         | no existe                       | mutación local por cookie en NEXO            | sesión separada en precedencia, pero proyectada como contexto efectivo | `DIVERGENTE`         |
| `CTX-FIELD-016` | readiness por carril               | no existe                       | booleano único `can_operate`                 | booleano único `can_operate`                                           | `NO_EQUIVALENTE`     |
| `CTX-FIELD-017` | problemas estructurales            | no existen                      | códigos planos en `blocked_reasons`          | mismos códigos planos                                                  | `PARCIAL`            |
| `CTX-FIELD-018` | `context_id` y `resolved_at`       | ausentes                        | ausentes                                     | ausentes                                                               | `AUSENTE`            |
| `CTX-FIELD-019` | metadata, versiones y fingerprints | ausentes                        | ausentes                                     | `metadata` libre sin versiones/fingerprints                            | `AUSENTE`            |
| `CTX-FIELD-020` | frescura e invalidación            | no representadas                | resolución por llamada sin token de frescura | resolución por llamada sin token contractual                           | `NO_DEMOSTRADA`      |

**Conciliación:** 20 dimensiones esperadas, 20 materializadas y 0 duplicadas.

El carril más completo físicamente es `get_effective_context_v1`, pero su forma continúa siendo una proyección plana y mutable por precedencia. No contiene principal tipado, actor efectivo, asignaciones, cobertura administrativa, readiness separado, structural issues estructurados, identidad del snapshot ni evidencia de versión.

---

#### 9. Precedencia de sede y área

| Resolver                    | Precedencia de sede                                                                       | Precedencia de área                                                        | Consecuencia                                                                                    |
| --------------------------- | ----------------------------------------------------------------------------------------- | -------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| sesión local de empleado    | `preferredSiteId` → `employee_sites` primaria activa → `employees.site_id`                | `preferredAreaId` → `null`                                                 | el caller puede sustituir territorio; el área no deriva de turno                                |
| sesión local de dispositivo | `preferredSiteId` → `device.site_id`                                                      | `preferredAreaId` → `device.area_id`                                       | el caller puede sustituir la configuración del dispositivo                                      |
| `get_operational_context`   | `p_site_id` → sede seleccionada → sede de check-in → sede de turno → `employees.site_id`  | área de check-in → área de turno                                           | selección y parámetro preceden al turno; el check-in no aporta área en la implementación actual |
| `get_effective_context_v1`  | dispositivo → simulación → resultado real                                                 | dispositivo → simulación → resultado real                                  | el tipo de fuente cambia completamente la semántica territorial                                 |
| `AccessContext@1.0.0`       | sede administrativa y sede operativa separadas; la sede operativa deriva del turno válido | área operativa derivada del turno y confirmada por check-in cuando aplique | ninguna selección visual ni parámetro del caller se vuelve autoridad                            |

Divergencias demostradas:

1. la sede preferida del guard tiene mayor precedencia que las fuentes laborales del helper local;
2. `p_site_id` y `employee_settings.selected_site_id` preceden a la sede del turno en SQL;
3. `employees.site_id` permanece como fallback legacy en dos carriles;
4. `preferredAreaId` puede convertirse directamente en área del contexto local;
5. `attendance_logs` no aporta `area_id` al resolver actual, porque la consulta proyecta `null::uuid`;
6. el contexto canónico prohíbe que navegación, selección o dato legacy sustituyan la sede y el área operativas.

---

#### 10. Turno, check-in y cobertura por aplicación

La tabla `app_operation_policies` tiene una única fila versionada confirmada:

| App    |    `requires_shift` |  `requires_checkin` | `requires_site_match` | bypass configurado                    | Estado                    |
| ------ | ------------------: | ------------------: | --------------------: | ------------------------------------- | ------------------------- |
| NEXO   |              `true` |              `true` |                `true` | `nexo.inventory.remissions.all_sites` | `POLITICA_CONFIRMADA`     |
| SHELL  | sin fila confirmada | sin fila confirmada |   sin fila confirmada | sin fila confirmada                   | `SIN_POLITICA_CONFIRMADA` |
| VISO   | sin fila confirmada | sin fila confirmada |   sin fila confirmada | sin fila confirmada                   | `SIN_POLITICA_CONFIRMADA` |
| FOGO   | sin fila confirmada | sin fila confirmada |   sin fila confirmada | sin fila confirmada                   | `SIN_POLITICA_CONFIRMADA` |
| ORIGO  | sin fila confirmada | sin fila confirmada |   sin fila confirmada | sin fila confirmada                   | `SIN_POLITICA_CONFIRMADA` |
| PULSO  | sin fila confirmada | sin fila confirmada |   sin fila confirmada | sin fila confirmada                   | `SIN_POLITICA_CONFIRMADA` |
| NUMERA | sin fila confirmada | sin fila confirmada |   sin fila confirmada | sin fila confirmada                   | `SIN_POLITICA_CONFIRMADA` |

Para un `app_code` sin política activa, `get_operational_context` aplica `false` a los tres requisitos mediante `coalesce`. En ausencia de otra razón, `can_operate` permanece verdadero. Por tanto, la RPC no demuestra una política operacional transversal: el comportamiento estricto está materializado únicamente para NEXO.

El resolver NEXO valida además que el turno traiga un rol operativo permitido para la sede/área. La razón `invalid_operational_role` existe en SQL, pero `buildOperationalBlockMessage` no tiene un mensaje específico y cae en el fallback genérico.

---

#### 11. Dispositivo compartido

| Dimensión             | Sesión local copiada                   | Contexto efectivo v1                             | Contrato canónico                                                | Resultado             |
| --------------------- | -------------------------------------- | ------------------------------------------------ | ---------------------------------------------------------------- | --------------------- |
| identidad técnica     | usuario Auth asociado al dispositivo   | `user_id` y `shared_device_id`                   | principal `SHARED_DEVICE` separado del actor                     | `PARCIAL`             |
| rol                   | `role = navigation_role`               | `effective_operational_role = navigation_role`   | el dispositivo no posee rol operativo propio                     | `DIVERGENTE`          |
| sede/área             | configuración o preferencia del caller | configuración del dispositivo                    | configuración validada, sin ampliación por caller                | `DIVERGENTE`          |
| aplicaciones          | lista `allowedAppCodes`                | lista del RPC                                    | límite técnico de la intersección                                | `PARCIAL`             |
| actor humano          | no resuelto                            | no resuelto                                      | sesión de actor humano o estado explícito ausente                | `AUSENTE`             |
| PIN y turno del actor | no evaluados por el contexto           | campos del dispositivo no aplicados al readiness | aplicados cuando la operación los requiere                       | `AUSENTE_EN_CONTEXTO` |
| autoridad             | rol de navegación + matriz operacional | rol de navegación + matriz operacional           | autoridad del actor ∩ límites del dispositivo                    | `NO_EQUIVALENTE`      |
| auditoría             | proyección mínima                      | metadata libre                                   | principal, actor, dispositivo, sede, área y cambio de trabajador | `PARCIAL`             |

`current_shared_operational_device_v1` devuelve `requires_actor_pin`, `requires_active_actor_shift`, `allow_actor_without_pin` y `allow_actions_without_actor`. `get_effective_context_v1` no integra esos campos en `can_operate`; solo comprueba que la aplicación esté permitida. Existen firmas de actor en acciones concretas, pero no forman una resolución contextual común y no demuestran paridad transversal.

---

#### 12. Simulación y alteración del contexto

Se observan dos mecanismos con efectos contextuales diferentes:

##### 12.1. Sesión de simulación v1

- tiene fila persistida, expiración y validación de sede/área/rol;
- solo puede gestionarla un propietario o gerente general según nombre de rol;
- precede al contexto real cuando no hay dispositivo compartido;
- produce `can_operate = true`;
- deja turno nulo y usa directamente sede, área y roles simulados;
- no produce `AccessContext` real ni `SimulationContext` canónico separado.

##### 12.2. Override local NEXO

- se lee desde cookie mediante el adapter de role override;
- mapea `cocinero → cocina`, `barista → bar` y `cajero → mostrador`;
- busca un área de ese tipo en la sede;
- sobrescribe `active_area_id`, `active_area_kind` y `active_operational_role` sobre el resultado real;
- no cambia la fila SQL original ni produce una identidad de snapshot distinta.

El contrato canónico exige que `AccessContext` real permanezca separado de `SimulationContext`. La legitimidad y ciclo de vida de ambos mecanismos se comparará en `SHELL-AUD-005`; esta tarea registra que actualmente alteran la fuente, precedencia y forma del contexto de manera no equivalente.

---

#### 13. Adopción por superficie

| ID              | Superficie | Sesión local              | Contexto NEXO                  | Contexto efectivo / SDK            | Decisión                         |
| --------------- | ---------- | ------------------------- | ------------------------------ | ---------------------------------- | -------------------------------- |
| `CTX-ADOPT-001` | SHELL      | no usa la copia           | no aplica                      | paquete alojado, Hub no lo consume | `SIN_ADOPCION_RUNTIME`           |
| `CTX-ADOPT-002` | VISO       | guard activo              | no                             | no consumido                       | `LOCAL_LEGACY`                   |
| `CTX-ADOPT-003` | NEXO       | guard activo              | múltiples flujos de remisiones | no consumido                       | `DOBLE_CARRIL_ACTIVO`            |
| `CTX-ADOPT-004` | FOGO       | guard activo              | no                             | no consumido                       | `LOCAL_LEGACY`                   |
| `CTX-ADOPT-005` | ORIGO      | guard y recepción activos | no                             | no consumido                       | `LOCAL_LEGACY_CON_USO_FUNCIONAL` |
| `CTX-ADOPT-006` | PULSO      | guard activo              | no                             | no consumido                       | `LOCAL_LEGACY`                   |
| `CTX-ADOPT-007` | NUMERA     | guard activo              | no                             | no consumido                       | `LOCAL_LEGACY`                   |

**Conciliación:** 7 superficies esperadas, 7 decisiones materializadas, 0 omitidas y 0 duplicadas.

Ninguna superficie runtime importa `@vento/os-context`. NEXO es la única que combina de forma activa el helper copiado con el adapter de `get_operational_context`. Esta distribución impide afirmar que existe una única fuente de contexto operativo para Vento OS.

---

#### 14. Readiness, razones y frescura

| Dimensión        | Estado físico                                           | Brecha respecto del contrato                                                                                 |
| ---------------- | ------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| readiness        | booleano único `can_operate` en RPC                     | no separa carril base y operacional ni capacidades de check-in/área                                          |
| razones          | array de strings planas                                 | no incluye severidad, sujeto, fuente ni mensaje seguro contractual                                           |
| razón no mapeada | `invalid_operational_role` cae en mensaje genérico      | diagnóstico desigual entre SQL y UI                                                                          |
| snapshot         | no existe `context_id`                                  | no puede correlacionarse una decisión con un snapshot exacto                                                 |
| tiempo           | no existe `resolved_at` en la salida                    | no se conserva el instante contractual de resolución                                                         |
| versiones        | no se publican resolver, catálogo ni fuentes            | no puede reproducirse la resolución con versiones exactas                                                    |
| fingerprints     | ausentes                                                | no existe evidencia de las filas fuente observadas                                                           |
| frescura         | cada llamada vuelve a resolver, sin token transaccional | no existe garantía explícita contra contexto obsoleto entre lectura y acción                                 |
| invalidación     | no existe registro común de consumidores                | no se demuestra invalidación transversal por checkout, cambio de turno, actor, dispositivo, rol o asignación |

La resolución por llamada reduce algunos riesgos de caché persistente, pero no sustituye el token de frescura, el registro de consumidores ni la evidencia exigidos por `AUTH-DB-035`, `SHELL-CTX-006` y `TREQ-AUTH-014`.

---

#### 15. Hallazgos y destinos obligatorios

| ID                | Hallazgo comprobado                                                                                                               | Estado                   | Destino exacto                                                                                                     |
| ----------------- | --------------------------------------------------------------------------------------------------------------------------------- | ------------------------ | ------------------------------------------------------------------------------------------------------------------ |
| `H-SHELL-004-001` | Coexisten cuatro carriles de contexto sin prueba de paridad.                                                                      | `ESPECIFICADO`           | `SHELL-AUD-009`; `SHELL-AUD-010`; `SHELL-CTX-001`; `SHELL-AUTH-001`; `AUTH-DB-033`; `AUTH-DB-034`                  |
| `H-SHELL-004-002` | Las seis copias de `operational-session.ts` son idénticas, pero `appId` se ignora durante la resolución.                          | `ESPECIFICADO`           | `SHELL-AUD-009`; `SHELL-AUD-010`; `SHELL-CTX-001`; `SHELL-AUTH-003`; `SHELL-AUTH-005`                              |
| `H-SHELL-004-003` | Sede y área preferidas del caller sustituyen valores de empleado o dispositivo en el helper local.                                | `BLOQUEADO`              | `SHELL-CON-006`; `SHELL-CON-007`; `SHELL-CTX-003`; `SHELL-AUTH-003`; `AUTH-DB-033`                                 |
| `H-SHELL-004-004` | El helper local usa el rol base como `role` y `navigationRole`, sin rol operativo derivado del turno.                             | `ESPECIFICADO`           | `SHELL-CON-004`; `SHELL-CON-005`; `SHELL-CTX-001`; `SHELL-CTX-002`; `AUTH-DB-033`                                  |
| `H-SHELL-004-005` | La sede del empleado puede resolverse desde una asignación primaria o `employees.site_id`, sin publicar todas las asignaciones.   | `ESPECIFICADO`           | `SHELL-CTX-003`; `AUTH-DB-033`; `AUTH-DB-030`                                                                      |
| `H-SHELL-004-006` | `get_operational_context` prioriza `p_site_id` y sede seleccionada antes de check-in y turno.                                     | `BLOQUEADO`              | `SHELL-CTX-003`; `SHELL-AUTH-003`; `AUTH-DB-033`; `AUTH-DB-030`                                                    |
| `H-SHELL-004-007` | Solo NEXO tiene política versionada que exige turno, check-in y coincidencia de sede.                                             | `ESPECIFICADO`           | `SHELL-AUD-010`; `SHELL-CTX-002`; `SHELL-CTX-004`; `AUTH-DB-033`; `AUTH-DB-034`                                    |
| `H-SHELL-004-008` | El check-in activo no aporta área porque la consulta proyecta `null::uuid`.                                                       | `ESPECIFICADO`           | `SHELL-CTX-002`; `SHELL-CTX-003`; `AUTH-DB-033`                                                                    |
| `H-SHELL-004-009` | Propietario y gerente general reciben bypass operacional por nombre de rol; también existe bypass por permiso.                    | `BLOQUEADO`              | `SHELL-AUD-010`; `AUTH-DB-033`; `AUTH-DB-034`; `AUTH-DB-030`                                                       |
| `H-SHELL-004-010` | La RPC `SECURITY DEFINER` acepta `p_employee_id` y `p_site_id` del caller y usa `search_path = public`.                           | `BLOQUEADO`              | `AUTH-DB-033`; `AUTH-DB-030`; `SHELL-AUTH-002`                                                                     |
| `H-SHELL-004-011` | Dispositivo compartido convierte `navigation_role` en rol operativo y no integra actor humano, PIN o turno en el readiness común. | `BLOQUEADO`              | `SHELL-CTX-001` a `SHELL-CTX-005`; `AUTH-DEV-007` a `AUTH-DEV-016`; `AUTH-DB-033`; `AUTH-DB-034`                   |
| `H-SHELL-004-012` | La sesión de simulación precede al contexto real y establece `can_operate = true` sin turno ni check-in.                          | `ESPECIFICADO`           | `SHELL-AUD-005`; `SHELL-CTX-001`; `AUTH-SIM-001` a `AUTH-SIM-014`; `AUTH-DB-033`; `AUTH-DB-034`                    |
| `H-SHELL-004-013` | El override local NEXO sobrescribe área y rol operativos sobre el contexto real.                                                  | `BLOQUEADO`              | `SHELL-AUD-005`; `SHELL-AUD-010`; `AUTH-DB-033`; `AUTH-DB-034`                                                     |
| `H-SHELL-004-014` | Los contextos físicos son proyecciones planas sin snapshot inmutable, readiness por carril ni evidencia versionada.               | `ESPECIFICADO`           | `SHELL-AUD-009`; `SHELL-CON-007`; `SHELL-CON-008`; `SHELL-CTX-004` a `SHELL-CTX-006`; `AUTH-DB-033`; `AUTH-DB-035` |
| `H-SHELL-004-015` | `@vento/os-context` existe y refleja `EffectiveContext` legacy, pero ningún runtime lo consume.                                   | `PENDIENTE_DE_EVIDENCIA` | `SHELL-AUD-010`; `SHELL-AUD-011`; `SHELL-AUTH-001`; `SHELL-AUTH-005`                                               |
| `H-SHELL-004-016` | `invalid_operational_role` no tiene traducción específica en el adapter NEXO.                                                     | `ESPECIFICADO`           | `SHELL-CON-008`; `SHELL-CTX-005`                                                                                   |
| `H-SHELL-004-017` | La aplicación solicitante no condiciona el helper local y las apps sin política SQL reciben requisitos operativos en falso.       | `ESPECIFICADO`           | `SHELL-CTX-001`; `SHELL-CTX-002`; `SHELL-AUTH-003`; `AUTH-DB-033`                                                  |
| `H-SHELL-004-018` | No existe evidencia de token de frescura, invalidación común ni registro completo de consumidores contextuales.                   | `PENDIENTE_DE_EVIDENCIA` | `AUTH-DB-035`; `SHELL-CTX-006`; `SHELL-AUTH-003`; `SHELL-AUTH-004`                                                 |

**Conciliación:** 18 hallazgos esperados, 18 materializados, 0 identificadores duplicados y 0 hallazgos sin tarea responsable.

`BLOQUEADO` significa que la variante no puede declararse equivalente ni incorporarse como estándar mientras su tarea responsable no determine y materialice la regla canónica. No significa que esta auditoría haya desactivado el comportamiento actual.

---

#### 16. Decisiones documentales resultantes

1. `operational-session.ts` se clasifica como proyección local legacy uniforme, no como implementación de `AccessContext`.
2. La igualdad byte de sus seis copias permite una migración coordinada, pero no certifica corrección semántica.
3. `appId` deberá participar en la resolución canónica; no podrá permanecer como parámetro ignorado.
4. Sede o área preferidas podrán ser solicitudes de vista, nunca hechos operativos autoritativos.
5. Rol base, rol de navegación y rol operativo permanecerán separados.
6. La sede operativa y el área operativa deberán derivarse de fuentes laborales validadas, no de selección visual ni fallback legacy silencioso.
7. `get_operational_context` se conserva como resolver legacy activo hasta migración y retiro controlado; no se eleva a contrato final.
8. La única política operacional físicamente confirmada es la de NEXO; no se infiere una política para otras aplicaciones.
9. El bypass por nombres de rol no se incorpora al contrato canónico.
10. El dispositivo compartido no tendrá rol empresarial propio ni ampliará la autoridad del actor.
11. Las restricciones de actor, PIN, turno y aplicación del dispositivo deberán integrarse en un contexto común o una decisión posterior, sin quedar dispersas por acción.
12. La simulación no modificará el `AccessContext` real ni producirá autoridad real.
13. `get_effective_context_v1` se clasifica como contexto efectivo transitorio, no como sustituto final de `get_access_context`.
14. `@vento/os-context` se conserva como candidato de consolidación sin declarar adopción o retiro antes de `SHELL-AUD-010` y `SHELL-AUD-011`.
15. La frontera canónica deberá producir snapshot, instante, readiness por carril, structural issues y metadata reproducible.
16. Ninguna razón SQL podrá perderse o degradarse a un mensaje genérico sin contrato explícito de errores.
17. No se crea ninguna tarea nueva: todos los hallazgos tienen propietario documental e implementación existentes.
18. No se modifica `active-sequence.json` ni se avanza fuera de `SHELL-AUD-005`.

---

#### 17. Trazabilidad con requisitos vigentes

Los hallazgos están cubiertos por requisitos canónicos existentes:

- `TREQ-AUTH-004`: exige la misma decisión y razones para igual principal, actor, simulación, permiso y territorio, e incluye expresamente `SHELL-AUD-004`;
- `TREQ-AUTH-008`: separa capacidades administrativas y operativas y exige turno, check-in, rol, sede y área cuando corresponda;
- `TREQ-AUTH-009`: exige resolución territorial determinista y denegación de cruces;
- `TREQ-AUTH-011`: define la autoridad de dispositivo como intersección con el trabajador identificado;
- `TREQ-AUTH-012`: mantiene la simulación separada de la autoridad real;
- `TREQ-AUTH-014`: exige invalidación por checkout, sesión, turno, área, trabajador, dispositivo, rol o asignación;
- `TREQ-AUTH-015`: exige evidencia correlacionable de principal, actor, contexto, dispositivo, decisión, versión y timestamp;
- `TREQ-SHELL-002`: protege paridad y clasificación de responsabilidades compartidas;
- `TREQ-SHELL-004`: impide retirar adapters o candidatos sin evidencia reproducible;
- `TREQ-SHELL-029`: conserva la distinción entre fuente compartida y consumidor runtime.

La auditoría aporta evidencia para esos requisitos, pero no cambia identificador, regla, riesgo, tipo, responsable, paquete, repositorio, estado, artefacto, evidencia ni relaciones de ninguna fila del registro canónico.

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** las divergencias de contexto, territorio, turno, check-in, roles, dispositivo, simulación, readiness, frescura, invalidación y evidencia ya están cubiertas por `TREQ-AUTH-004`, `TREQ-AUTH-008`, `TREQ-AUTH-009`, `TREQ-AUTH-011`, `TREQ-AUTH-012`, `TREQ-AUTH-014`, `TREQ-AUTH-015`, `TREQ-SHELL-002`, `TREQ-SHELL-004` y `TREQ-SHELL-029`. Esta tarea no introduce comportamiento ejecutable ni descubre una regla verificable sin cobertura previa.

---

#### 18. Criterios de aceptación

`SHELL-AUD-004` queda materialmente completa cuando:

- las siete superficies runtime estén representadas una sola vez;
- las diez familias de contexto tengan identidad, ocurrencias, clasificación y destino;
- los cuatro carriles coexistentes estén diferenciados sin declarar equivalencia no demostrada;
- las seis copias de `operational-session.ts` estén reconciliadas como una clase byte-idéntica;
- el adapter NEXO y las tres RPC relacionadas estén comparados por fuente, precedencia y salida;
- las veinte dimensiones de `AccessContext@1.0.0` estén materializadas sin faltantes ni duplicados;
- la precedencia de sede y área esté descrita para cada resolver;
- la política operacional NEXO y la ausencia de filas confirmadas para las otras aplicaciones estén diferenciadas;
- turno, check-in, rol operativo y `invalid_operational_role` estén contrastados;
- el dispositivo compartido se compare por identidad, actor, rol, territorio, aplicación y restricciones;
- simulación v1 y override local NEXO se registren como mecanismos distintos sin desarrollar su legitimidad;
- las siete superficies tengan decisión explícita de adopción actual;
- readiness, razones, snapshot, versiones, fingerprints, frescura e invalidación estén evaluados;
- los dieciocho hallazgos tengan estado, destino exacto y condición de resolución;
- no se cree ninguna tarea nueva ni se deje un pendiente narrativo;
- se declaren cero cambios del registro de requisitos de prueba;
- no se modifique código, SQL, configuración, Supabase, despliegues ni continuidad;
- `SHELL-AUD-005` permanezca como única tarea reservada.

---

#### 19. Resultado y continuidad

La cadena comparativa resultante es:

```text
principal técnico
→ resolver local, operacional, efectivo o canónico
→ fuente y precedencia de actor, rol, turno, check-in, sede, área y dispositivo
→ readiness y razones
→ snapshot, evidencia y frescura
→ consumidor runtime
→ hallazgo de paridad
→ tarea exacta de contrato, implementación, migración o retiro
```

La única continuidad reservada es:

```text
SHELL-AUD-005
— Comparar role override
```

No se inicia, desarrolla ni modifica esa tarea.


### ✅ SHELL-AUD-005 — Comparar role override

**Estado:** APROBADA
**Bloque:** H — Fundación compartida
**Tipo:** auditoría transversal de simulación de rol, sustitución de evaluadores y propagación de contexto
**Entrada de continuidad:** `SHELL-AUD-004 — Comparar contexto operativo`
**Continuidad inmediata reservada:** `SHELL-AUD-006 — Comparar AppShell y navegación`
**Handoff posterior al segmento `SHELL-AUD-001..011`:** `SHELL-PKG-001 — Elegir mecanismo de distribución`
**Fecha de corte:** 2026-08-01
**Cambios en código, SQL, Supabase, configuración, CI o despliegues:** no autorizados ni realizados

---

#### 1. Resultado de esta tarea

Esta tarea materializa la comparación completa del `role override` existente en las aplicaciones web de Vento OS y lo contrasta con la simulación persistida de contexto ya versionada en `vento-shell` y con los contratos canónicos aprobados de identidad, contexto y autorización.

| Métrica                                                        |  Resultado |
| -------------------------------------------------------------- | ---------: |
| Superficies web evaluadas                                      |      **7** |
| Aplicaciones con helper local de `role override`               |      **6** |
| Superficies sin cookie local de override                       |      **1** |
| Familias semánticas de helper local                            |      **2** |
| Catálogos locales de roles simulables                          |      **6** |
| Identificadores de cookie pertenecientes a otra aplicación     |      **2** |
| Mecanismos de simulación coexistentes                          |      **2** |
| Aplicaciones que inyectan el override en el contexto operativo |      **1** |
| Concesiones locales fuera de `role_permissions`                |      **1** |
| Decisiones por superficie materializadas                       | **7 de 7** |
| Hallazgos con destino documental exacto                        |     **22** |
| Cambios `TREQ-*`                                               |      **0** |

La comparación demuestra que el nombre común `role override` agrupa actualmente dos mecanismos distintos:

```text
COOKIE LOCAL POR APLICACIÓN
→ cambia el rol utilizado por evaluadores locales de permisos
→ persiste en el navegador durante 30 días
→ no crea una sesión central ni evidencia estructurada

SESIÓN PERSISTIDA DE SIMULACIÓN
→ se almacena y valida en Supabase
→ alimenta get_effective_context_v1
→ tiene vigencia, identidad, sede, área y cierre explícitos
```

No se declara ninguno de los dos como arquitectura final dentro de esta tarea. La disposición definitiva permanece reservada a `SHELL-AUD-010`, y su materialización técnica a `SHELL-AUTH-001..005` y `SHELL-CTX-001..006`.

---

#### 2. Fuentes canónicas y corte reproducible

La fuente documental propietaria se inspeccionó en `vento-shell` commit `6bd79d0c44163fdbfa86143626e17bf13f2c2c49`.

| Fuente                                              | Uso                                                             |
| --------------------------------------------------- | --------------------------------------------------------------- |
| `docs/plan-canonico/modular/01_PROTOCOLO.md`        | continuidad, alcance, evidencia, entrega y requisitos de prueba |
| `docs/plan-canonico/modular/delivery-contract.json` | contrato físico del artefacto                                   |
| `docs/plan-canonico/modular/active-sequence.json`   | segmento activo `SHELL-AUD-001..011` y handoff posterior        |
| `01_AUDITORIA_DE_COMPONENTES_COMPARTIDOS.md`        | propietario, tareas aprobadas y marcador actual                 |
| `SHELL-AUD-001`                                     | universo de repositorios y familias duplicadas                  |
| `SHELL-AUD-002`                                     | guards, middleware, login y separación de fronteras             |
| `SHELL-AUD-003`                                     | helpers de permisos, firmas RPC y consumidores directos         |
| `SHELL-AUD-004`                                     | contexto operativo, sesión local y contexto efectivo            |
| `AccessContext@1.0.0` y contratos relacionados      | invariantes de identidad, simulación, territorio y carriles     |
| `03_AUTORIZACION_Y_CONTEXTO_COMPARTIDOS.md`         | arquitectura objetivo de contratos, SDK y Supabase              |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`  | cobertura vigente de paridad, sesión, contexto y simulación     |
| Código y migraciones de los siete repositorios      | comportamiento técnico actual                                   |

Commits de runtime:

| Superficie | Repositorio                  | Commit inspeccionado                       |
| ---------- | ---------------------------- | ------------------------------------------ |
| SHELL      | `devVentoGroup/vento-shell`  | `6bd79d0c44163fdbfa86143626e17bf13f2c2c49` |
| VISO       | `devVentoGroup/vento-viso`   | `47322403f3c64e83ae0c4a2f68c05d47093e5bb4` |
| NEXO       | `devVentoGroup/vento-nexo`   | `142c4d696221e3ce3fda4ed3b62f3d1fe5b58799` |
| FOGO       | `devVentoGroup/vento-fogo`   | `b6b9ed00e5267cabaac1a5a1090d93d5f60e86f2` |
| ORIGO      | `devVentoGroup/vento-origo`  | `b7a8303fa078ef087f522b6c99059ababfc27472` |
| PULSO      | `devVentoGroup/vento-pulso`  | `71e0184486b5fe11e0a42435baf4024807a80efd` |
| NUMERA     | `devVentoGroup/vento-numera` | `1b48a5da425d92e19ed89cf175b1dccc4cd960e1` |

---

#### 3. Continuidad interpretada

`active-sequence.json` define:

```text
segmento activo
SHELL-AUD-001..011

handoff_task_id
SHELL-PKG-001
```

Por tanto:

```text
SHELL-AUD-004 aprobada
→ SHELL-AUD-005 actual
→ SHELL-AUD-006 inmediata reservada
→ ...
→ SHELL-AUD-011
→ SHELL-PKG-001 como salida completa del segmento
```

`handoff_task_id` no representa la siguiente tarea inmediata. No existe salto de continuidad ni bloqueo para esta auditoría.

---

#### 4. Límite exacto

Se comparan:

1. `src/lib/auth/role-override.ts` en VISO, NEXO, FOGO, ORIGO, PULSO y NUMERA;
2. `src/lib/auth/role-override-config.ts` en las seis aplicaciones;
3. escritura, lectura, expiración y eliminación de la cookie local;
4. elegibilidad del actor real para activar simulación;
5. catálogo de roles presentado por cada aplicación;
6. evaluación de `role_permissions`, scopes, allows y denies;
7. integración con guards y consumidores funcionales;
8. exclusión o inclusión del dispositivo compartido;
9. propagación del override al contexto operativo de NEXO;
10. sesión central `context_simulation_sessions` y RPC relacionadas;
11. consumo por `get_effective_context_v1` y `has_effective_permission_v1`;
12. compatibilidad con las decisiones canónicas de `AccessContext` y `SimulationContext`.

Se excluyen:

- la decisión final de compartir, generar o mantener local, reservada a `SHELL-AUD-010`;
- el retiro de artefactos sin consumidor, reservado a `SHELL-AUD-011`;
- la implementación del SDK compartido, reservada a `SHELL-AUTH-001..005`;
- la implementación del módulo contextual, reservada a `SHELL-CTX-001..006`;
- cambios de permisos, roles, scopes, migraciones, RLS, cookies, guards o UI;
- pruebas contra un ambiente desplegado no accesible desde esta auditoría.

---

#### 5. Conceptos que no se tratarán como equivalentes

| Concepto                  | Fuente actual                 | Autoridad representada                              |
| ------------------------- | ----------------------------- | --------------------------------------------------- |
| Rol administrativo real   | relación laboral del empleado | hecho real de identidad laboral                     |
| Rol operativo real        | turno publicado y vigente     | hecho operativo temporal                            |
| Cookie de `role override` | navegador de una aplicación   | solicitud local de simulación                       |
| Rol evaluado por override | string leído desde cookie     | entrada del evaluador local                         |
| Sesión de simulación v1   | `context_simulation_sessions` | sesión persistida y validada en servidor            |
| Contexto operativo legacy | `get_operational_context`     | mezcla de turno, check-in, políticas y bypass       |
| Contexto efectivo v1      | `get_effective_context_v1`    | proyección central que puede seleccionar simulación |
| `AccessContext` canónico  | contrato documental aprobado  | snapshot real de identidad y contexto               |
| `SimulationContext`       | contrato separado             | evaluación hipotética sin alterar el contexto real  |

Reglas conservadas:

```text
ROL REAL ≠ ROL SIMULADO
COOKIE ≠ SESIÓN AUTORITATIVA
SIMULACIÓN ≠ MUTACIÓN DEL ACTOR REAL
ROL DE NAVEGACIÓN ≠ PERMISO
SELECCIÓN VISUAL ≠ AUTORIDAD
```

---

#### 6. Inventario completo por superficie

| ID           | Superficie | Helper local | Config local | Escritura UI | Integración principal                      | Clasificación                        |
| ------------ | ---------- | ------------ | ------------ | ------------ | ------------------------------------------ | ------------------------------------ |
| `RO-SURF-01` | SHELL      | no           | no           | no           | migraciones de simulación y SDK contextual | `FRONTERA_CENTRAL_DISTINTA`          |
| `RO-SURF-02` | VISO       | sí           | sí           | sí           | guard y consumidores de autorización       | `LEGACY_LOCAL_BASELINE`              |
| `RO-SURF-03` | NEXO       | sí           | sí           | sí           | guard, consumidores y contexto operativo   | `LEGACY_LOCAL_DIVERGENTE`            |
| `RO-SURF-04` | FOGO       | sí           | sí           | sí           | guard y consumidores funcionales           | `LEGACY_LOCAL_BASELINE_COOKIE_AJENA` |
| `RO-SURF-05` | ORIGO      | sí           | sí           | sí           | guard y servicios funcionales              | `LEGACY_LOCAL_BASELINE`              |
| `RO-SURF-06` | PULSO      | sí           | sí           | sí           | guard y permisos funcionales               | `LEGACY_LOCAL_BASELINE_COOKIE_AJENA` |
| `RO-SURF-07` | NUMERA     | sí           | sí           | sí           | guard y selector visual                    | `LEGACY_LOCAL_BASELINE`              |

**Conciliación:** 7 superficies esperadas, 7 decisiones materializadas, 0 faltantes, 0 duplicadas.

---

#### 7. Familias semánticas de `role-override.ts`

##### 7.1. Familia base

VISO, FOGO, ORIGO, PULSO y NUMERA implementan el mismo contrato semántico:

```text
leer cookie local
→ comprobar que el rol real pertenece a PRIVILEGED_ROLES
→ consultar role_permissions para el rol simulado
→ filtrar scopes localmente
→ DENY coincidente prevalece
→ se exige al menos un ALLOW coincidente
→ retornar booleano
```

Las diferencias físicas de formato o tipado no cambian el algoritmo observable de esta familia.

##### 7.2. Variante NEXO

NEXO conserva la estructura general, pero modifica tres reglas sustantivas:

1. obtiene una colección de sedes accesibles desde `employee_sites`;
2. no carga `scope_site_id` ni `scope_area_id` desde `role_permissions` y los representa internamente como `null`;
3. concede localmente `nexo.inventory.remissions.transit` al rol `conductor` sin requerir una fila coincidente en `role_permissions`.

Por ello NEXO no es semánticamente equivalente a la familia base.

---

#### 8. Catálogos locales de configuración

| Aplicación | Cookie configurada     | Roles reales privilegiados       | Roles simulables publicados                                                                                      | Cantidad | Propiedad del identificador |
| ---------- | ---------------------- | -------------------------------- | ---------------------------------------------------------------------------------------------------------------- | -------: | --------------------------- |
| VISO       | `viso_role_override`   | `propietario`, `gerente_general` | propietario, gerente_general, gerente, administrador, cajero, mesero, domiciliario, barista, cocinero, bodeguero |   **10** | propia                      |
| NEXO       | `nexo_role_override`   | `propietario`, `gerente_general` | propietario, gerente_general, gerente, administrador, bodeguero, conductor, cocinero, barista, cajero            |    **9** | propia                      |
| FOGO       | `origo_role_override`  | `propietario`, `gerente_general` | propietario, gerente_general, gerente, administrador, cocinero, bodeguero                                        |    **6** | ajena: ORIGO                |
| ORIGO      | `origo_role_override`  | `propietario`, `gerente_general` | propietario, gerente_general, gerente, administrador, bodeguero                                                  |    **5** | propia                      |
| PULSO      | `nexo_role_override`   | `propietario`, `gerente_general` | propietario, gerente_general, gerente, administrador, cajero, mesero, domiciliario, barista                      |    **8** | ajena: NEXO                 |
| NUMERA     | `numera_role_override` | `propietario`, `gerente_general` | propietario, gerente_general, gerente                                                                            |    **3** | propia                      |

Conclusiones:

- los seis repositorios limitan la activación visual a `propietario` y `gerente_general`;
- no existe un catálogo compartido de roles simulables;
- el mismo rol puede estar disponible en una aplicación y ausente en otra;
- FOGO y PULSO contienen identificadores de cookie copiados desde otra aplicación;
- las cookies no declaran `Domain`, por lo que actualmente son host-only y no se infiere una colisión automática entre hosts distintos;
- la identidad ajena sigue siendo deriva de configuración y debe resolverse antes de cualquier distribución compartida.

---

#### 9. Ciclo de vida de la cookie local

Las seis interfaces escriben la cookie con el patrón equivalente a:

```text
nombre=<rol>; path=/; max-age=2592000
```

Matriz:

| Propiedad                             | Estado actual                                |
| ------------------------------------- | -------------------------------------------- |
| Escritura                             | JavaScript del cliente                       |
| Lectura de servidor                   | `cookies()` de Next.js                       |
| Duración                              | 30 días                                      |
| Path                                  | `/`                                          |
| Domain explícito                      | no                                           |
| `HttpOnly`                            | no disponible al escribirse desde JavaScript |
| `Secure` explícito                    | no                                           |
| `SameSite` explícito                  | no                                           |
| Firma o MAC                           | no                                           |
| Cifrado                               | no                                           |
| Identidad de usuario incorporada      | no                                           |
| ID de sesión incorporado              | no                                           |
| Timestamp de creación incorporado     | no                                           |
| Expiración ligada a sesión Supabase   | no                                           |
| Revocación central                    | no                                           |
| Eliminación manual                    | sí, al elegir el rol real                    |
| Eliminación confirmada durante logout | no localizada                                |

Consecuencia observable:

```text
logout local
→ termina la sesión Supabase local
→ no se confirmó eliminación de la cookie de override
→ la cookie puede permanecer en el mismo navegador
→ un login posterior vuelve a someter su valor al control del rol real
```

La permanencia no concede autoridad por sí sola porque `canUseRoleOverride` exige que el actor autenticado real sea privilegiado. Sí demuestra que la vigencia del override no está ligada a la vigencia de la sesión que lo creó.

---

#### 10. Elegibilidad y validación del rol solicitado

##### 10.1. Actor real

Las seis aplicaciones aplican una comparación directa contra:

```text
propietario
gerente_general
```

No se confirmó normalización central, alias, versión de catálogo ni resolución contractual del rol real dentro del helper.

##### 10.2. Valor de la cookie

El servidor acepta como candidato cualquier string no vacío leído desde la cookie.

La lista `ROLE_OPTIONS` restringe la selección ofrecida por la UI, pero no constituye validación de servidor. Un valor fuera de la lista:

- llega al evaluador local;
- se usa como `role_code` de consulta;
- normalmente queda sin grants coincidentes y falla cerrado;
- no queda registrado como intento estructurado;
- en NEXO, el valor exacto `conductor` activa además la concesión local específica.

##### 10.3. Shared device

Los guards separan el carril de dispositivo compartido del carril personal. La cookie de role override no sustituye el rol operativo de un dispositivo compartido dentro de esos guards.

---

#### 11. Evaluación de permisos de la familia base

La familia base consulta `role_permissions` y su relación con `permissions` usando:

- `role_code` igual al rol simulado;
- `is_active = true`;
- `permissions.app_id` igual a la aplicación;
- `permissions.code` igual al permiso normalizado.

Después aplica localmente:

| `scope_type`      | Comprobación local                                        |
| ----------------- | --------------------------------------------------------- |
| `global`          | coincide sin territorio adicional                         |
| `site_type`       | compara `scope_site_type` con el tipo de la sede recibida |
| `area_type`       | compara `scope_area_kind` con el tipo del área recibida   |
| `site`            | compara `scope_site_id` con `siteId`                      |
| `area`            | compara `scope_area_id` con `areaId`                      |
| otro o incompleto | no coincide                                               |

Precedencia:

```text
si existe DENY coincidente
→ false

si no existe DENY y existe ALLOW coincidente
→ true

en otro caso
→ false
```

Propiedades:

| Dimensión                               | Resultado                                         |
| --------------------------------------- | ------------------------------------------------- |
| Backend autoritativo único              | no; la decisión se reconstruye en cada aplicación |
| Resultado estructurado                  | no; retorna booleano                              |
| Razón de denegación                     | no disponible                                     |
| ID de decisión                          | no disponible                                     |
| Evidencia de grants/denies              | no retornada                                      |
| Versión de catálogo                     | no transmitida                                    |
| Actor real auditado                     | no incorporado por el helper                      |
| Rol simulado auditado                   | no persistido por el helper                       |
| Paridad automatizada entre repositorios | no confirmada                                     |

---

#### 12. Divergencia territorial de NEXO

NEXO no conserva en su selección local los campos exactos:

```text
scope_site_id
scope_area_id
```

Su comparación materializa:

| Scope       | Regla NEXO                                                      |
| ----------- | --------------------------------------------------------------- |
| `global`    | coincide                                                        |
| `site_type` | compara tipo de sede                                            |
| `area_type` | compara tipo de área                                            |
| `site`      | exige `siteId` y que la sede aparezca en la colección accesible |
| `area`      | exige `areaId` y, cuando existe, compara `scope_area_kind`      |

Consecuencias:

1. una fila `site` no se confronta con su `scope_site_id` exacto;
2. una fila `area` no se confronta con su `scope_area_id` exacto;
3. la pertenencia del usuario a una sede sustituye la identidad territorial del grant;
4. la presencia de un área sustituye la identidad territorial exacta del grant;
5. no existe equivalencia demostrada con la familia base para grants específicos de sede o área.

La consulta de `employee_sites` no incorpora un filtro de empleado dentro del helper. Esta tarea no infiere exposición de datos porque la efectividad de su aislamiento depende también de RLS y grants, que no forman parte de la decisión de este artefacto.

---

#### 13. Concesión local de `conductor` en NEXO

NEXO contiene esta regla fuera de `role_permissions`:

```text
rol simulado = conductor
AND
permiso = nexo.inventory.remissions.transit
→ ALLOW
```

Características:

- no existe en las otras cinco copias;
- se evalúa antes de consultar grants y denies de la matriz local;
- no requiere una fila allow;
- no permite que un deny de `role_permissions` la revoque dentro de ese helper;
- no produce evidencia de la regla aplicada;
- transforma una decisión de catálogo o matriz en una excepción escrita en código.

La tarea no decide conservarla ni retirarla. Su contrato deberá resolverse mediante `SHELL-CON-003`, `SHELL-CON-005`, `SHELL-AUD-010` y `SHELL-AUTH-005`.

---

#### 14. Sustitución del evaluador real

Cuando existe un override elegible, `checkPermissionWithRoleOverride` no combina la autoridad real y la simulada.

Flujo:

```text
sin override elegible
→ checkPermission del usuario real

con override elegible
→ isPermissionAllowedForRole del rol simulado
→ no se consulta el permiso real como fallback
```

Por tanto:

```text
DECISIÓN SIMULADA
≠
PERMISOS REALES ∪ PERMISOS SIMULADOS
```

La semántica actual es de sustitución del evaluador para esa comprobación. Los guards conservan separadamente autenticación, dispositivo compartido y, según la variante, la puerta general de aplicación.

---

#### 15. Propagación al contexto operativo

NEXO es la única aplicación que conecta la cookie local con `operational-context.ts`.

Para overrides concretos aplica:

| Rol simulado | `area_kind` buscado |
| ------------ | ------------------- |
| `cocinero`   | `cocina`            |
| `barista`    | `bar`               |
| `cajero`     | `mostrador`         |

Si localiza un área activa dentro de la sede resuelta, reemplaza en memoria:

```text
active_operational_role
active_area_id
active_area_kind
```

No modifica físicamente el turno ni el check-in, pero sí cambia el contexto operativo devuelto al consumidor.

Las otras cinco aplicaciones:

- usan el override para evaluar permisos o presentación visual;
- no contienen esta adaptación específica dentro de su contexto operativo local;
- no demuestran paridad con NEXO para una misma simulación.

Esta divergencia entra en conflicto con la separación canónica según la cual el rol operativo real deriva del turno válido y la simulación debe permanecer en un contrato separado.

---

#### 16. Consumidores comprobados

| Aplicación | Guard     | Helper funcional directo           | Selector visual | Mutación de contexto operativo | Estado de consumo             |
| ---------- | --------- | ---------------------------------- | --------------- | ------------------------------ | ----------------------------- |
| VISO       | sí        | sí                                 | sí              | no                             | `CONSUMIDO`                   |
| NEXO       | sí        | sí, en múltiples flujos operativos | sí              | sí                             | `CONSUMIDO_DIVERGENTE`        |
| FOGO       | sí        | sí                                 | sí              | no                             | `CONSUMIDO`                   |
| ORIGO      | sí        | sí, en servicios funcionales       | sí              | no                             | `CONSUMIDO`                   |
| PULSO      | sí        | guard y comprobaciones funcionales | sí              | no                             | `CONSUMIDO`                   |
| NUMERA     | sí        | guard                              | sí              | no                             | `CONSUMIDO`                   |
| SHELL      | no aplica | SDK y RPC centrales distintos      | no              | contexto efectivo v1           | `FRONTERA_CENTRAL_CONSUMIBLE` |

No se clasifica ninguno de los seis helpers locales como artefacto sin consumidor. Su retiro no puede realizarse por `SHELL-AUD-011` sin una migración previa y evidencia de paridad.

---

#### 17. Simulación central persistida en Supabase

`vento-shell` contiene una segunda familia de simulación:

```text
context_simulation_sessions
start_context_simulation_v1
stop_context_simulation_v1
get_active_context_simulation_v1
get_effective_context_v1
has_effective_permission_v1
```

Propiedades comprobadas:

| Dimensión                     | Sesión central v1                                                         |
| ----------------------------- | ------------------------------------------------------------------------- |
| Persistencia                  | tabla en Supabase                                                         |
| Propietario técnico           | `vento-shell`                                                             |
| Actor autorizado para iniciar | `propietario` o `gerente_general`                                         |
| Sesiones activas por usuario  | máximo una                                                                |
| Sede                          | obligatoria y validada                                                    |
| Área                          | opcional y validada contra la sede                                        |
| Rol operativo                 | validado contra `site_operational_roles`                                  |
| Rol administrativo            | aceptado como campo separado                                              |
| Duración                      | 15 a 720 minutos; 240 por defecto                                         |
| Expiración                    | explícita                                                                 |
| Cierre                        | RPC explícita                                                             |
| Identidad del usuario         | almacenada                                                                |
| Creador                       | almacenado                                                                |
| Metadata                      | persistida                                                                |
| Consumo                       | `get_effective_context_v1` y `has_effective_permission_v1`                |
| Fuente devuelta               | `simulation`                                                              |
| Evidencia estructurada        | superior a la cookie local, aunque no certificada como arquitectura final |

La existencia física de este mecanismo no demuestra adopción por las seis aplicaciones ni conformidad completa con el contrato canónico. Ninguna de las seis copias locales de role override se apoya en esta sesión para leer el rol simulado.

---

#### 18. Comparación de los dos mecanismos

| Dimensión                                         | Cookie local                      | Sesión central v1                           |
| ------------------------------------------------- | --------------------------------- | ------------------------------------------- |
| Ubicación                                         | navegador y código por aplicación | Supabase y `vento-shell`                    |
| Fuente del rol                                    | string escrito por cliente        | parámetros validados por RPC                |
| Persistencia                                      | cookie host-only                  | fila versionada                             |
| Duración                                          | 30 días                           | 15 a 720 minutos                            |
| Usuario vinculado                                 | no en la cookie                   | sí                                          |
| Sesión vinculada                                  | no                                | sesión activa por usuario                   |
| Sede validada                                     | depende del evaluador local       | sí                                          |
| Área validada                                     | depende del evaluador local       | sí                                          |
| Rol operativo validado                            | no de forma común                 | sí, contra matriz de sede/área              |
| Rol administrativo validado contra catálogo común | no demostrado                     | no demostrado por esta auditoría            |
| Auditoría                                         | no persistida por el helper       | creador, timestamps y metadata              |
| Revocación                                        | eliminación local                 | cierre central                              |
| Expiración automática                             | navegador por `max-age`           | consulta por `expires_at`                   |
| Una sesión activa                                 | no                                | sí                                          |
| Decisión de permiso                               | reconstruida localmente           | `has_effective_permission_v1`               |
| Resultado estructurado                            | no                                | contexto estructurado; permiso aún booleano |
| Adopción multi-repo                               | seis copias legacy                | no confirmada en consumidores               |
| Integración con contexto real                     | NEXO lo muta localmente           | lo sustituye dentro de contexto efectivo v1 |

No existe una capa de compatibilidad que mantenga ambas fuentes sincronizadas. Cada mecanismo puede representar una simulación distinta para el mismo usuario y momento.

---

#### 19. Compatibilidad con contratos canónicos

| Invariante canónico                        | Cookie local              | NEXO con propagación                  | Sesión central v1                                                 |
| ------------------------------------------ | ------------------------- | ------------------------------------- | ----------------------------------------------------------------- |
| El actor real permanece identificable      | parcial                   | parcial                               | sí, conserva rol real                                             |
| La simulación usa contrato separado        | no tipado                 | no; altera proyección operativa local | parcial; fuente `simulation` explícita                            |
| El rol operativo real deriva del turno     | no lo resuelve            | no, puede reemplazarlo en memoria     | separa campo efectivo, pero lo usa para autorización simulada     |
| La selección del cliente no es autoridad   | no cumple por sí sola     | no cumple por sí sola                 | validación de servidor                                            |
| Sede y área se validan en servidor         | depende de cada copia     | semántica local divergente            | sí                                                                |
| La simulación no modifica RLS              | no demostrado             | no demostrado                         | no demostrado dentro de esta tarea                                |
| La simulación no modifica el contexto real | cinco apps no lo mutan    | no cumple                             | mantiene fuente separada, pero produce contexto efectivo simulado |
| Vigencia explícita                         | 30 días sin sesión propia | 30 días sin sesión propia             | sí                                                                |
| Revocación explícita                       | solo local/manual         | solo local/manual                     | sí                                                                |
| Evidencia y correlación                    | no                        | no                                    | parcial                                                           |
| Decisión estructurada de autorización      | no                        | no                                    | no; retorna booleano de permiso                                   |
| Paridad entre aplicaciones                 | no demostrada             | divergente                            | adopción no demostrada                                            |

La tabla identifica compatibilidad técnica observada; no convierte el mecanismo central v1 en contrato aprobado definitivo.

---

#### 20. Decisión por superficie

| Superficie | Estado actual                   | Decisión de esta auditoría                                                | Destino obligatorio                                                 |
| ---------- | ------------------------------- | ------------------------------------------------------------------------- | ------------------------------------------------------------------- |
| SHELL      | mecanismo central existente     | conservar como evidencia y candidato; no declarar canónico por existencia | `SHELL-AUD-009`, `SHELL-AUD-010`, `SHELL-AUTH-001`                  |
| VISO       | helper base consumido           | mantener hasta migración con paridad                                      | `SHELL-AUD-010`, `SHELL-AUTH-005`                                   |
| NEXO       | helper y contexto divergentes   | aislar como variante explícita; prohibido asumir equivalencia             | `SHELL-AUD-009`, `SHELL-AUD-010`, `SHELL-CTX-001`, `SHELL-AUTH-005` |
| FOGO       | helper base con cookie de ORIGO | mantener como deriva explícita hasta definir su disposición y migración   | `SHELL-AUD-010`, `SHELL-AUTH-005`                                   |
| ORIGO      | helper base consumido           | mantener hasta migración con paridad                                      | `SHELL-AUD-010`, `SHELL-AUTH-005`                                   |
| PULSO      | helper base con cookie de NEXO  | mantener como deriva explícita hasta definir su disposición y migración   | `SHELL-AUD-010`, `SHELL-AUTH-005`                                   |
| NUMERA     | helper base consumido           | mantener hasta migración con paridad                                      | `SHELL-AUD-010`, `SHELL-AUTH-005`                                   |

Ninguna fila ordena retirar o modificar código durante esta fase documental.

---

#### 21. Hallazgos y destinos obligatorios

| ID                | Hallazgo materializado                                                                     | Estado                               | Destino exacto                                                                        |
| ----------------- | ------------------------------------------------------------------------------------------ | ------------------------------------ | ------------------------------------------------------------------------------------- |
| `H-SHELL-005-001` | seis aplicaciones mantienen implementaciones locales de role override                      | `CONFIRMADO`                         | `SHELL-AUD-010`; `SHELL-AUTH-001`; `SHELL-AUTH-005`                                   |
| `H-SHELL-005-002` | SHELL contiene un mecanismo central distinto y no una séptima copia de cookie              | `CONFIRMADO`                         | `SHELL-AUD-009`; `SHELL-AUD-010`; `SHELL-AUTH-001`                                    |
| `H-SHELL-005-003` | VISO, FOGO, ORIGO, PULSO y NUMERA forman una familia semántica base                        | `CONFIRMADO`                         | `SHELL-AUD-010`; `SHELL-AUTH-005`                                                     |
| `H-SHELL-005-004` | NEXO constituye una familia divergente                                                     | `CONFIRMADO`                         | `SHELL-AUD-009`; `SHELL-AUD-010`; `SHELL-AUTH-005`                                    |
| `H-SHELL-005-005` | `ROLE_OPTIONS` limita la UI, pero no valida el valor en servidor                           | `IMPLEMENTADO_ACTIVO`                | `SHELL-CON-004`; `SHELL-CON-005`; `SHELL-AUTH-002`; `SHELL-AUTH-005`                  |
| `H-SHELL-005-006` | las cookies son client-writable, sin firma y con vigencia de 30 días                       | `IMPLEMENTADO_ACTIVO`                | `SHELL-AUTH-002`; `SHELL-AUTH-003`; `SHELL-AUTH-004`; `SHELL-AUTH-005`                |
| `H-SHELL-005-007` | no se confirmó eliminación de la cookie durante logout                                     | `CONFIRMADO_EN_CODIGO_INSPECCIONADO` | `SHELL-AUTH-002`; `SHELL-AUTH-004`; `SHELL-AUTH-005`                                  |
| `H-SHELL-005-008` | la cookie no está ligada al usuario ni a la sesión que la creó                             | `CONFIRMADO`                         | `SHELL-AUTH-002`; `SHELL-AUTH-003`; `SHELL-AUTH-005`                                  |
| `H-SHELL-005-009` | FOGO utiliza el identificador `origo_role_override`                                        | `DERIVA_DE_CONFIGURACION`            | `SHELL-AUD-010`; `SHELL-AUTH-005`                                                     |
| `H-SHELL-005-010` | PULSO utiliza el identificador `nexo_role_override`                                        | `DERIVA_DE_CONFIGURACION`            | `SHELL-AUD-010`; `SHELL-AUTH-005`                                                     |
| `H-SHELL-005-011` | el alcance host-only actual evita inferir colisión automática entre hosts                  | `LIMITACION_EXPLICITA`               | `SHELL-AUD-010`                                                                       |
| `H-SHELL-005-012` | los seis catálogos de roles simulables no son equivalentes                                 | `CONFIRMADO`                         | `SHELL-CON-004`; `SHELL-CON-005`; `SHELL-AUD-009`; `SHELL-AUD-010`                    |
| `H-SHELL-005-013` | solo `propietario` y `gerente_general` pueden activar el override local                    | `CONFIRMADO`                         | `SHELL-CON-004`; `SHELL-AUD-009`; `SHELL-AUD-010`                                     |
| `H-SHELL-005-014` | el override sustituye el evaluador real para la comprobación solicitada                    | `CONFIRMADO`                         | `SHELL-AUD-009`; `SHELL-AUD-010`; `SHELL-AUTH-001`; `SHELL-AUTH-005`                  |
| `H-SHELL-005-015` | la precedencia allow/deny se reconstruye localmente en seis repositorios                   | `CONFIRMADO`                         | `SHELL-CON-006`; `SHELL-AUTH-001`; `SHELL-AUTH-005`                                   |
| `H-SHELL-005-016` | NEXO no conserva `scope_site_id` ni `scope_area_id` al evaluar la simulación               | `DIVERGENCIA_ACTIVA`                 | `SHELL-CON-006`; `SHELL-AUD-009`; `SHELL-AUD-010`; `SHELL-AUTH-005`                   |
| `H-SHELL-005-017` | NEXO concede localmente tránsito de remisiones al rol `conductor`                          | `EXCEPCION_LOCAL_ACTIVA`             | `SHELL-CON-003`; `SHELL-CON-005`; `SHELL-AUD-010`; `SHELL-AUTH-005`                   |
| `H-SHELL-005-018` | NEXO inyecta rol y área simulados en el contexto operativo local                           | `DIVERGENCIA_ACTIVA`                 | `SHELL-CON-007`; `SHELL-CTX-001`; `SHELL-CTX-003`; `SHELL-AUTH-005`                   |
| `H-SHELL-005-019` | las otras cinco aplicaciones no propagan la cookie al contexto operativo de la misma forma | `PARIDAD_NO_DEMOSTRADA`              | `SHELL-AUD-009`; `SHELL-AUD-010`; `SHELL-CTX-001`                                     |
| `H-SHELL-005-020` | el carril de dispositivo compartido queda fuera del role override local                    | `SEPARACION_CONFIRMADA`              | `SHELL-AUTH-002`; `SHELL-AUTH-005`                                                    |
| `H-SHELL-005-021` | cookie local y sesión central pueden coexistir con valores incompatibles                   | `DOBLE_FUENTE_ACTIVA`                | `SHELL-AUD-009`; `SHELL-AUD-010`; `SHELL-AUTH-001`; `SHELL-AUTH-005`; `SHELL-CTX-001` |
| `H-SHELL-005-022` | no se confirmó una suite automatizada que pruebe paridad entre evaluadores y consumidores  | `PENDIENTE_DE_EVIDENCIA`             | `SHELL-AUTH-004`; `SHELL-AUTH-005`                                                    |

Ningún hallazgo queda diferido a una fase genérica. Todos tienen una tarea existente y una condición de salida verificable.

---

#### 22. Decisiones de esta tarea

1. `role override` no se tratará como un único mecanismo mientras coexistan cookie local y sesión central.
2. Las seis cookies locales se clasifican como compatibilidad legacy consumida, no como contrato canónico compartido.
3. El mecanismo central v1 se clasifica como implementación existente y candidato de convergencia, no como arquitectura final aprobada por su sola existencia.
4. La lista visual de roles no sustituye validación de servidor.
5. Un valor desconocido de cookie debe permanecer fail closed; no se agregará fallback por rol real durante esta auditoría.
6. La semántica de sustitución del evaluador se conserva como hecho actual y deberá declararse explícitamente en el contrato definitivo.
7. La precedencia de denies no deberá seguir duplicada después de la migración a la frontera común.
8. NEXO no se considerará equivalente a la familia base mientras omita identidades exactas de scope.
9. La concesión local de `conductor` no se elevará a decisión canónica ni se retirará sin reconciliar catálogo y matrices.
10. La propagación NEXO hacia `active_operational_role` y `active_area_id` se mantiene como divergencia explícita, no como comportamiento compartido.
11. La identidad ajena de las cookies FOGO y PULSO deberá resolverse en `SHELL-AUD-010` y `SHELL-AUTH-005`, sin elegir aquí entre reemplazo, parametrización o retiro.
12. La ausencia de limpieza en logout queda cubierta por la migración del adapter y los gates contra consumidores legacy.
13. No se retirará ningún helper consumido antes de disponer de backend, adapters, pruebas de paridad y rollback.
14. No se crea un tercer mecanismo de simulación.
15. No se modifica `active-sequence.json`.
16. El `handoff_task_id` se conserva como salida posterior a `SHELL-AUD-011`.
17. No se modifica código, configuración, Supabase, CI ni despliegues.
18. `SHELL-AUD-006` permanece como única tarea inmediata reservada.

---

#### 23. Trazabilidad con requisitos vigentes

Los hallazgos permanecen cubiertos por requisitos ya existentes de:

- paridad y clasificación de responsabilidades compartidas;
- equivalencia entre evaluadores de autorización;
- separación entre rol real, rol operativo y simulación;
- resolución de contexto exclusivamente en servidor;
- validación de sede, área y scopes;
- invalidación de sesión, contexto y decisiones derivadas;
- fallo cerrado ante valores inválidos o fuentes incompletas;
- evidencia correlacionable de decisiones y denegaciones;
- protección de consumidores antes de retirar compatibilidad legacy.

Entre las identidades vigentes relacionadas se conservan:

- `TREQ-SHELL-002`;
- `TREQ-SHELL-004`;
- `TREQ-AUTH-001`;
- `TREQ-AUTH-004`;
- `TREQ-AUTH-008`;
- `TREQ-AUTH-009`;
- `TREQ-AUTH-011`;
- `TREQ-AUTH-012`;
- `TREQ-AUTH-014`;
- `TREQ-AUTH-015`.

Esta tarea no cambia identificadores, reglas, estados, responsables, momentos, evidencia ni relaciones del registro canónico.

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea compara implementaciones y divergencias ya existentes sin introducir ni modificar comportamiento ejecutable. Las reglas que requieren protección ya están cubiertas por requisitos vigentes de paridad, simulación, scopes, contexto, invalidación, fail closed y trazabilidad. Se generan **0** altas, **0** modificaciones, **0** diferimientos, **0** descartes y **0** obsolescencias `TREQ-*`.

---

#### 24. Criterios de aceptación

`SHELL-AUD-005` se considera materialmente completa porque:

- las siete superficies web están representadas una sola vez;
- las seis implementaciones locales están clasificadas por familia semántica;
- la ausencia de cookie local en SHELL está registrada;
- los seis catálogos de roles y cookies están conciliados;
- los dos identificadores de cookie ajenos están identificados sin inferir colisión entre hosts;
- el ciclo de vida de 30 días, escritura cliente y eliminación manual están documentados;
- la ausencia de limpieza de logout está diferenciada de la revocación manual;
- la elegibilidad del actor real y la falta de validación server-side del catálogo visual están separadas;
- la precedencia allow/deny de la familia base está materializada;
- NEXO está comparado por scopes exactos, sedes accesibles y concesión local;
- la inyección de override en el contexto operativo NEXO está materializada;
- los consumidores activos impiden clasificar los helpers como código retirables sin migración;
- cookie local y sesión central están comparadas por autoridad, vigencia, territorio, auditoría y consumo;
- la compatibilidad con `AccessContext` y `SimulationContext` está contrastada;
- cada hallazgo tiene un destino documental exacto;
- se declaran cero cambios de requisitos de prueba;
- no se modifica código, Supabase, configuración, CI, despliegues ni continuidad;
- `SHELL-AUD-006` permanece como única continuidad inmediata reservada;
- `SHELL-PKG-001` permanece como handoff posterior al cierre completo del segmento.

---

#### 25. Resultado y continuidad

La comparación deja establecida la cadena actual:

```text
actor real privilegiado
→ selector visual local
→ cookie local de 30 días
→ helper de role override por aplicación
→ evaluador local de role_permissions
→ sustitución del permiso real
→ divergencias NEXO de scope, concesión y contexto
```

Y, en paralelo:

```text
actor real privilegiado
→ start_context_simulation_v1
→ context_simulation_sessions
→ get_effective_context_v1
→ has_effective_permission_v1
```

La única continuidad inmediata reservada es:

```text
SHELL-AUD-006 — Comparar AppShell y navegación
```

El handoff `SHELL-PKG-001` se mantiene reservado exclusivamente para después de completar `SHELL-AUD-011`.


### ✅ SHELL-AUD-006 — Comparar AppShell y navegación

**Estado:** APROBADA
**Bloque:** H — Fundación compartida
**Tipo:** auditoría transversal de composición AppShell, catálogo de aplicaciones, navegación interna, contexto visible y transferencia entre aplicaciones
**Entrada de continuidad:** `SHELL-AUD-005 — Comparar role override`
**Continuidad inmediata reservada:** `SHELL-AUD-007 — Comparar componentes UI base`
**Handoff posterior al segmento `SHELL-AUD-001..011`:** `SHELL-PKG-001 — Elegir mecanismo de distribución`
**Fecha de corte:** 2026-08-01
**Cambios en código, SQL, Supabase, configuración, CI o despliegues:** no autorizados ni realizados

---

#### 1. Resultado de esta tarea

Esta tarea materializa la comparación del AppShell y la navegación actualmente presentes en SHELL, la plantilla fuente y las seis aplicaciones web consumidoras. La comparación separa el launcher central, la plantilla histórica, la navegación interna obtenida desde `app_navigation_items`, la visibilidad de aplicaciones, la selección visual de sede, el contexto mostrado y los contratos canónicos futuros.

| Métrica                                                             |  Resultado |
| ------------------------------------------------------------------- | ---------: |
| Superficies comparadas                                              |      **8** |
| Superficies runtime                                                 |      **7** |
| Plantillas fuente no runtime                                        |      **1** |
| Aplicaciones runtime que usan `VentoShell`                          |      **6** |
| Launcher central independiente                                      |      **1** |
| Familias físicas principales comparadas                             |      **5** |
| Carriles actuales de navegación diferenciados                       |      **4** |
| Catálogos locales de aplicaciones confirmados                       |      **8** |
| Aplicaciones mostradas por SHELL runtime                            |      **5** |
| Entradas de la plantilla AppSwitcher                                |      **7** |
| Entradas de cada AppSwitcher runtime actual                         |      **9** |
| Consumidores runtime de `app_navigation_items`                      |      **6** |
| Campos del esquema de navegación no propagados al `NavItem` runtime |      **4** |
| Decisiones por superficie materializadas                            | **8 de 8** |
| Hallazgos con destino exacto                                        |     **24** |
| Cambios `TREQ-*`                                                    |      **0** |

Resultado central:

```text
SHELL RUNTIME
→ launcher propio con cinco tarjetas y perfil propio

PLANTILLA FUENTE
→ navegación NEXO hardcodeada, siete aplicaciones y selector de sede en AppSwitcher

SEIS APPS RUNTIME
→ AppShell copiado
→ navegación consultada en app_navigation_items
→ visibilidad filtrada en servidor
→ catálogo local de nueve aplicaciones
→ Chrome cliente con sidebar, contexto y perfil
```

La paridad integral queda `NO_DEMOSTRADA`. Existe un pipeline runtime común, pero no una única fuente versionada para aplicaciones, pantallas, navegación, iconos, contexto visible, destinos o estados.

---

#### 2. Fuentes canónicas y corte reproducible

La fuente documental propietaria se inspeccionó en `vento-shell` commit `73c429adf42124b8529d18cebf18c607ab61638c`.

| Fuente                                              | Uso                                                          |
| --------------------------------------------------- | ------------------------------------------------------------ |
| `docs/plan-canonico/modular/01_PROTOCOLO.md`        | continuidad, alcance, evidencia, entrega y pruebas           |
| `docs/plan-canonico/modular/delivery-contract.json` | contrato físico del artefacto                                |
| `docs/plan-canonico/modular/active-sequence.json`   | segmento `SHELL-AUD-001..011` y handoff posterior            |
| `01_AUDITORIA_DE_COMPONENTES_COMPARTIDOS.md`        | propietario, entradas aprobadas y marcador actual            |
| `SHELL-AUD-001`                                     | inventario de familias, ocurrencias y hashes                 |
| `SHELL-AUD-002` a `SHELL-AUD-005`                   | fronteras de autenticación, permisos, contexto y simulación  |
| `docs/APP-SHELL-ESTANDARES.md`                      | estándar histórico de composición por copia                  |
| `templates/app-shell-standard/README.md`            | procedimiento y dependencias declaradas de la plantilla      |
| `templates/app-shell-standard/src/...`              | fuente física de AppShell, Chrome, switcher, perfil y layout |
| `app_navigation_items` y migraciones relacionadas   | catálogo físico versionado de navegación interna             |
| `UX-BASE-001` a `UX-BASE-005`                       | experiencia por actor, tarea y contexto visible              |
| `SHELL-APP-001` a `SHELL-APP-016`                   | continuidad del hub, visibilidad, contexto y retorno         |
| `SHELL-CON-001` a `SHELL-CON-016`                   | contratos futuros de aplicaciones, pantallas y handoffs      |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`  | cobertura vigente de AppShell, navegación y catálogo         |
| Código de los siete repositorios runtime            | comportamiento técnico actual                                |

Commits inspeccionados:

| Superficie    | Repositorio / fuente                                     | Commit                                     |
| ------------- | -------------------------------------------------------- | ------------------------------------------ |
| SHELL runtime | `devVentoGroup/vento-shell`                              | `73c429adf42124b8529d18cebf18c607ab61638c` |
| Plantilla     | `devVentoGroup/vento-shell/templates/app-shell-standard` | `73c429adf42124b8529d18cebf18c607ab61638c` |
| VISO          | `devVentoGroup/vento-viso`                               | `47322403f3c64e83ae0c4a2f68c05d47093e5bb4` |
| NEXO          | `devVentoGroup/vento-nexo`                               | `142c4d696221e3ce3fda4ed3b62f3d1fe5b58799` |
| FOGO          | `devVentoGroup/vento-fogo`                               | `b6b9ed00e5267cabaac1a5a1090d93d5f60e86f2` |
| ORIGO         | `devVentoGroup/vento-origo`                              | `b7a8303fa078ef087f522b6c99059ababfc27472` |
| PULSO         | `devVentoGroup/vento-pulso`                              | `71e0184486b5fe11e0a42435baf4024807a80efd` |
| NUMERA        | `devVentoGroup/vento-numera`                             | `1b48a5da425d92e19ed89cf175b1dccc4cd960e1` |

---

#### 3. Continuidad aplicable

`active-sequence.json` conserva el segmento completo:

```text
SHELL-AUD-001
→ ...
→ SHELL-AUD-005 aprobada
→ SHELL-AUD-006 actual
→ SHELL-AUD-007 inmediata reservada
→ ...
→ SHELL-AUD-011
→ SHELL-PKG-001 como handoff del segmento
```

`handoff_task_id` representa la salida posterior al segmento, no la tarea inmediata. No existe contradicción de continuidad.

---

#### 4. Alcance exacto

Se comparan:

1. `src/app/layout.tsx` en SHELL, la plantilla y las seis aplicaciones;
2. `vento-shell.tsx`, `vento-chrome.tsx`, `app-switcher.tsx` y `profile-menu.tsx` en la plantilla y los seis consumidores;
3. launcher runtime de SHELL en `src/app/page.tsx`;
4. catálogos locales de aplicaciones, estados, dominios, marcas y grupos;
5. carga y transformación de `app_navigation_items`;
6. agrupación, orden, iconos, rutas y permisos de navegación;
7. visibilidad para sesión personal, simulación y dispositivo compartido;
8. tratamiento de sede seleccionada y contexto operativo visible;
9. patrón de ruta activa, sidebar, header, bloqueo operacional y navegación móvil;
10. diferencias explícitas de VISO, NEXO, ORIGO y las demás aplicaciones;
11. correspondencia con UX base, H2 SHELL APP y contratos compartidos futuros;
12. cobertura de requisitos de prueba vigente.

Se excluyen:

- comparación visual y de primitivas UI, reservada a `SHELL-AUD-007`;
- clientes Supabase, reservados a `SHELL-AUD-008`;
- tipos públicos y contratos definitivos, reservados a `SHELL-AUD-009`;
- disposición `compartir / generar / mantener local`, reservada a `SHELL-AUD-010`;
- retiro de rutas, componentes o placeholders, reservado a `SHELL-AUD-011`;
- diseño detallado de cada pantalla, reservado a los bloques E2, I y H2;
- implementación de paquetes, navegación, catálogos o migraciones;
- validación visual o E2E contra ambientes desplegados.

---

#### 5. Conceptos que no se tratarán como equivalentes

| Concepto                 | Identidad                           | Regla                                                       |
| ------------------------ | ----------------------------------- | ----------------------------------------------------------- |
| SHELL runtime            | launcher central desplegable        | no es la plantilla AppShell                                 |
| Plantilla AppShell       | fuente copiable bajo `templates/`   | no es superficie runtime                                    |
| AppShell runtime         | composición de cada aplicación      | no es fuente normativa por existir en seis copias           |
| Catálogo de aplicaciones | identidad, estado, dominio y marca  | no equivale a la lista local de un switcher                 |
| Catálogo de navegación   | grupos e items de una aplicación    | no equivale al catálogo de pantallas canónicas              |
| Pantalla canónica        | identidad funcional estable         | no se demuestra solo con `href` o `item_key`                |
| Visibilidad              | decisión de presentación            | no sustituye autorización de servidor                       |
| Sede seleccionada        | filtro o preferencia de navegación  | no es sede operativa autoritativa                           |
| Contexto visible         | proyección para el usuario          | no es el snapshot canónico completo                         |
| Ruta activa              | coincidencia de URL                 | no demuestra tarea actual ni etapa del proceso              |
| Aplicación bloqueada     | estado de interfaz                  | no demuestra indisponibilidad técnica ni autorización final |
| Handoff entre apps       | transferencia de destino y contexto | no es un enlace absoluto sin contrato                       |

Reglas preservadas:

```text
PLANTILLA ≠ RUNTIME
VISIBILIDAD ≠ AUTORIZACIÓN
SELECCIÓN DE SEDE ≠ AUTORIDAD OPERATIVA
HREF ≠ IDENTIFICADOR CANÓNICO DE PANTALLA
RUTA ACTIVA ≠ TAREA ACTUAL
LISTA LOCAL DE APPS ≠ CATÁLOGO CANÓNICO
```

---

#### 6. Inventario completo por superficie

| ID            | Superficie    | Composición actual                                             | Fuente de navegación                                    | Catálogo de aplicaciones | Clasificación                       |
| ------------- | ------------- | -------------------------------------------------------------- | ------------------------------------------------------- | ------------------------ | ----------------------------------- |
| `NAV-SURF-01` | SHELL runtime | layout y página propia; no usa `VentoShell`                    | cinco tarjetas locales                                  | cinco entradas locales   | `LAUNCHER_CENTRAL_INDEPENDIENTE`    |
| `NAV-SURF-02` | plantilla     | layout + `VentoShell` + Chrome + switcher + perfil             | grupos NEXO hardcodeados                                | siete entradas locales   | `FUENTE_HISTORICA_DESFASADA`        |
| `NAV-SURF-03` | VISO          | AppShell runtime con sidebar y gate                            | `app_navigation_items` + agregación local `/operations` | nueve entradas locales   | `RUNTIME_CON_AGREGACION_LOCAL`      |
| `NAV-SURF-04` | NEXO          | AppShell runtime con contexto especializado                    | `app_navigation_items` + permisos operativos especiales | nueve entradas locales   | `RUNTIME_CON_EXTENSION_OPERATIVA`   |
| `NAV-SURF-05` | FOGO          | AppShell runtime base con vocabulario de iconos propio         | `app_navigation_items`                                  | nueve entradas locales   | `RUNTIME_BASE_DIVERGENTE`           |
| `NAV-SURF-06` | ORIGO         | AppShell runtime base con filtro local de sedes                | `app_navigation_items`                                  | nueve entradas locales   | `RUNTIME_CON_FILTRO_LOCAL`          |
| `NAV-SURF-07` | PULSO         | AppShell runtime con scripts globales adicionales en layout    | `app_navigation_items`                                  | nueve entradas locales   | `RUNTIME_BASE_CON_LAYOUT_EXTENDIDO` |
| `NAV-SURF-08` | NUMERA        | AppShell runtime con textos de catálogo parcialmente corruptos | `app_navigation_items`                                  | nueve entradas locales   | `RUNTIME_BASE_CON_DERIVA_TEXTUAL`   |

**Conciliación:** 8 superficies esperadas, 8 materializadas, 0 faltantes y 0 identificadores duplicados.

---

#### 7. Identidad física de las cinco familias principales

| Familia              | Ocurrencias | Variantes SHA | Grupos idénticos    | Resultado    |
| -------------------- | ----------: | ------------: | ------------------- | ------------ |
| `src/app/layout.tsx` |       **8** |         **8** | ninguno             | `DIVERGENTE` |
| `vento-shell.tsx`    |       **7** |         **7** | ninguno             | `DIVERGENTE` |
| `vento-chrome.tsx`   |       **7** |         **7** | ninguno             | `DIVERGENTE` |
| `app-switcher.tsx`   |       **7** |         **5** | NEXO, ORIGO y PULSO | `MIXTA`      |
| `profile-menu.tsx`   |       **7** |         **7** | ninguno             | `DIVERGENTE` |

Identidades de `app-switcher.tsx`:

| Fuente    | Blob SHA                                   |
| --------- | ------------------------------------------ |
| plantilla | `11d786b6327b4016fdd6e2354e0e6283cb8334e6` |
| VISO      | `888f3d20bd317ff4234861c11237b1144e3a8ad8` |
| NEXO      | `ea05dd60eef2e23427a4ee421aa279a88c5f4739` |
| FOGO      | `839d6cc9dc984f526ced166611af6b47ca8c6f23` |
| ORIGO     | `ea05dd60eef2e23427a4ee421aa279a88c5f4739` |
| PULSO     | `ea05dd60eef2e23427a4ee421aa279a88c5f4739` |
| NUMERA    | `ee23b7a3e2cceb8f61e6b86faf80f3ece19f3d87` |

La diferencia de blob no implica por sí sola diferencia funcional. En esta familia VISO conserva el mismo comportamiento observable principal con formato de línea distinto, mientras la plantilla sí implementa otro contrato y NUMERA conserva deriva textual.

---

#### 8. Los cuatro carriles actuales de navegación

| ID            | Carril                   | Fuente                                                                        | Consumidor                                   | Estado                      |
| ------------- | ------------------------ | ----------------------------------------------------------------------------- | -------------------------------------------- | --------------------------- |
| `NAV-LANE-01` | launcher SHELL           | arreglo `INTERNAL_APPS` en `src/app/page.tsx`                                 | usuario autenticado de SHELL                 | `ACTIVO_LOCAL`              |
| `NAV-LANE-02` | plantilla histórica      | arrays hardcodeados en Chrome y AppSwitcher                                   | futuros repositorios que copien la plantilla | `FUENTE_DESFASADA`          |
| `NAV-LANE-03` | AppShell runtime         | `app_navigation_items` + arrays locales de aplicaciones + evaluadores locales | seis aplicaciones web                        | `ACTIVO_DISTRIBUIDO`        |
| `NAV-LANE-04` | contrato canónico futuro | UX base, H2 SHELL APP, contratos de aplicaciones, pantallas y handoffs        | implementación pendiente                     | `NORMATIVO_NO_IMPLEMENTADO` |

**Conciliación:** 4 carriles identificados, 4 comparados y 0 declarados equivalentes sin evidencia.

---

#### 9. Catálogos de aplicaciones y estados

| Proyección                      |               Cantidad | Entradas confirmadas                                     | Fuente                        | Resolución de acceso                             |
| ------------------------------- | ---------------------: | -------------------------------------------------------- | ----------------------------- | ------------------------------------------------ |
| SHELL runtime                   |                  **5** | VISO, NEXO, FOGO, ORIGO, PULSO                           | arreglo local                 | RPC de permiso con fallback de firma             |
| plantilla AppSwitcher           |                  **7** | Hub, VISO, NEXO, FOGO, ORIGO, PULSO, AURA                | arreglo local                 | solo `active` o `soon`; sin decisión de permiso  |
| AppSwitcher de cada app runtime |                  **9** | Hub, ANIMA, NEXO, ORIGO, PULSO, NUMERA, VISO, FOGO, AURA | arreglo local por repositorio | servidor resuelve `enabled`, `disabled` o `soon` |
| `app_navigation_items`          | no es catálogo de apps | items internos por `app_code`                            | Supabase versionado           | permiso por item                                 |

Divergencias materiales:

1. NUMERA aparece activa en los seis AppSwitcher runtime y no existe en el launcher SHELL de cinco tarjetas.
2. ANIMA aparece en los AppSwitcher runtime, pero no en la plantilla histórica ni como tarjeta del launcher laboral.
3. FOGO permanece `soon` en la plantilla y `active` en los AppSwitcher runtime.
4. AURA permanece `soon` en plantilla y runtimes, pero sus textos, logos y grupos se duplican localmente.
5. SHELL usa `/logos/*.svg`; los AppSwitcher runtime usan `/apps/*.svg`; la identidad visual no proviene de un catálogo común.
6. Los seis `vento-shell.tsx` duplican dominio, nombre, descripción, color, logo, grupo y estado de las nueve entradas.
7. `brandColor` forma parte del tipo runtime, pero el `AppSwitcher` inspeccionado no lo usa para renderizar la tarjeta.
8. La cantidad distinta puede corresponder a proyecciones válidas, pero no está producida desde un catálogo canónico único.

Decisión:

```text
CATÁLOGO CANÓNICO ÚNICO
→ puede producir proyecciones distintas por superficie
→ no puede ser reemplazado por listas locales independientes
```

---

#### 10. Contrato físico de `app_navigation_items`

El esquema versionado contiene catorce campos funcionales o de comportamiento:

```text
app_code
 group_key
 group_label
 group_order
 item_key
 label
 description
 href
 icon
 required_permission_code
 sort_order
 is_active
 opens_in_new_tab
 metadata
```

Los seis AppShell runtime:

- filtran por `app_code`;
- filtran `is_active = true`;
- ordenan por `group_order` y `sort_order`;
- seleccionan `group_label`, `group_order`, `label`, `description`, `href`, `icon`, `required_permission_code` y `sort_order`;
- transforman cada fila al contrato local `NavItem`;
- descartan o no propagan cuatro campos: `group_key`, `item_key`, `opens_in_new_tab` y `metadata`.

Matriz:

| Dimensión               | Esquema                    | Runtime actual                          | Resultado                  |
| ----------------------- | -------------------------- | --------------------------------------- | -------------------------- |
| identidad de aplicación | `app_code`                 | filtro de consulta                      | `CONSUMIDA`                |
| identidad de grupo      | `group_key`                | no propagada                            | `PERDIDA`                  |
| etiqueta de grupo       | `group_label`              | clave de agrupación visible             | `CONSUMIDA_COMO_IDENTIDAD` |
| identidad de item       | `item_key`                 | no propagada                            | `PERDIDA`                  |
| destino                 | `href`                     | identidad de React, ruta y active match | `SOBRECARGADA`             |
| permiso                 | `required_permission_code` | decisión de visibilidad                 | `CONSUMIDA`                |
| pestaña nueva           | `opens_in_new_tab`         | no propagada                            | `IGNORADA`                 |
| metadata                | `metadata`                 | no propagada                            | `IGNORADA`                 |
| icono                   | string libre               | enum local por aplicación               | `PARCIAL_DIVERGENTE`       |
| estado                  | `is_active`                | filtro booleano                         | `CONSUMIDA`                |

Consecuencias:

1. `href` sustituye actualmente a una identidad canónica de pantalla dentro del render.
2. dos items con etiquetas iguales pueden quedar agrupados juntos aunque tengan `group_key` distinto.
3. cambiar la etiqueta del grupo puede alterar la agrupación visible.
4. `opens_in_new_tab` no produce el comportamiento declarado por el registro.
5. `metadata` no puede condicionar presentación o handoff aunque exista en la fila.
6. `item_key` no llega al cliente y no puede correlacionarse con una pantalla o telemetría estable.
7. el conjunto de iconos válidos depende del enum local de cada aplicación.

---

#### 11. Pipeline runtime de navegación interna

El patrón general de las seis aplicaciones es:

```text
usuario o dispositivo autenticado
→ resolver empleado, rol, sedes y contexto local
→ consultar app_navigation_items por app_code
→ evaluar required_permission_code por fila
→ conservar filas permitidas
→ convertir filas a NavGroup[]
→ pasar navGroups a VentoChrome
→ renderizar sidebar cliente
```

El pipeline común no constituye una implementación compartida porque está copiado dentro de seis `vento-shell.tsx` distintos.

Variantes explícitas:

| Aplicación | Variante                                                                           | Efecto                                                           |
| ---------- | ---------------------------------------------------------------------------------- | ---------------------------------------------------------------- |
| VISO       | colapsa las rutas que comienzan por `/operations` en una entrada `/operations`     | varias filas físicas pueden producir una sola opción visible     |
| NEXO       | usa evaluación operacional especial para permisos de remisiones seleccionados      | la fuente de decisión cambia según el permiso                    |
| ORIGO      | excluye localmente una sede cuyo nombre es `app review (demo)`                     | la colección visible no usa el mismo criterio que las otras apps |
| PULSO      | incorpora scripts globales de protección de formularios y rueda numérica en layout | el layout AppShell tiene responsabilidades adicionales           |
| NUMERA     | conserva mojibake en textos del catálogo y mensajes del gate                       | la misma identidad se presenta con texto divergente              |
| FOGO       | mantiene vocabulario local de iconos y shell propio                                | no existe paridad por versión con otros consumidores             |

Estas variantes no se clasifican todavía como correctas o incorrectas. Su disposición pertenece a `SHELL-AUD-010`.

---

#### 12. Visibilidad, autorización y estados de bloqueo

Los seis AppShell runtime resuelven visibilidad en servidor antes de entregar `navGroups` y `appSwitcherItems` al cliente. Esto evita depender únicamente de ocultamiento cliente, pero no sustituye los guards de ruta y servidor.

| Carril                    | Fuente de visibilidad               | Estado presentado   | Autoridad final                               |
| ------------------------- | ----------------------------------- | ------------------- | --------------------------------------------- |
| usuario personal real     | permisos y scopes locales           | enabled / disabled  | guard, RPC y servidor de destino              |
| usuario con role override | evaluador local de simulación       | navegación simulada | mecanismo legacy comparado en `SHELL-AUD-005` |
| dispositivo compartido    | apps permitidas + rol de navegación | enabled / disabled  | intersección aún no canónica                  |
| app futura                | `status = soon`                     | próximamente        | no navegable                                  |
| navegación interna        | permiso de cada fila                | visible u omitida   | ruta y operación de destino                   |

Brechas:

- la razón de bloqueo del AppSwitcher es genérica: “Tu rol no tiene acceso”; no conserva razón estructurada;
- SHELL muestra “Sin acceso” o “Bloqueada” sin explicar permiso, contexto, estado de despliegue o falta de superficie;
- una app `soon` y una app sin permiso terminan visualmente en clases similares;
- el launcher y los switchers no comparten el mismo modelo de estados;
- no existe evidencia de una prueba que compare las proyecciones para el mismo actor y contexto.

`SHELL-APP-010` conserva la responsabilidad de definir la explicación de bloqueo. Esta auditoría solo materializa el estado actual.

---

#### 13. Sede seleccionada y contexto mostrado

La plantilla histórica ubica el selector de sede dentro de `AppSwitcher` y modifica únicamente el query parameter `site_id`.

Los runtimes actuales movieron la selección al `ProfileMenu` y combinan:

```text
query parameter site_id
+ cookie local por aplicación
+ employee_settings.selected_site_id
+ activeSiteId resuelto por servidor
```

NEXO, por ejemplo:

- escribe `nexo_site_override_id` durante 30 días;
- hace `upsert` de `employee_settings.selected_site_id` desde cliente;
- actualiza `site_id` en la URL;
- refresca la navegación.

El Chrome presenta:

- tarjeta `Sede activa`;
- una tarjeta agregada `Contexto operativo` cuando existe una etiqueta;
- etiquetas como `Jornada activa`, `Dispositivo compartido`, `Acceso administrativo` o `Sin jornada activa`.

No presenta de forma separada y homogénea:

- identificador o franja del turno activo;
- área activa;
- rol operativo activo;
- origen del contexto;
- instante de resolución;
- tarea pendiente o tarea actual.

Decisión:

```text
site_id, cookie y employee_settings
→ preferencia o filtro de navegación
→ nunca autoridad operativa

turno, sede, área y rol visibles
→ deben provenir del contexto canónico resuelto en servidor
```

Los contratos detallados permanecen en `SHELL-APP-004` a `SHELL-APP-008`, `UX-BASE-002` a `UX-BASE-005` y `SHELL-CTX-001` a `SHELL-CTX-006`.

---

#### 14. Chrome, rutas activas y estructura de navegación

Los Chrome runtime comparten el patrón:

- sidebar fijo o sticky;
- drawer móvil;
- header sticky;
- sidebar colapsable persistido en `localStorage`;
- grupos e items recibidos del servidor;
- coincidencia activa por `pathname === href` o prefijo `href/`;
- AppSwitcher y ProfileMenu en el header;
- gate que puede sustituir el contenido principal;
- fallback “No hay pantallas disponibles”.

Comparación con el estándar histórico:

| Dimensión             | Estándar histórico           | Runtime actual                            | Resultado      |
| --------------------- | ---------------------------- | ----------------------------------------- | -------------- |
| navegación principal  | header                       | sidebar                                   | `DIVERGENTE`   |
| switcher              | incluye selector de sede     | selector ya no se renderiza allí          | `DIVERGENTE`   |
| perfil                | nombre, rol, email, logout   | agrega sede, simulación y limpieza de app | `EXTENDIDO`    |
| contenido             | full-width bajo header       | sidebar + contenido flexible              | `DIVERGENTE`   |
| fuente de nav         | rutas ajustadas por copia    | base de datos + filtros locales           | `EVOLUCIONADO` |
| visibilidad           | permissionCodes del template | evaluación servidor por item              | `EVOLUCIONADO` |
| identidad de pantalla | href local                   | continúa siendo href local                | `NO_RESUELTA`  |

El documento histórico sigue describiendo copiar desde NEXO y “evitar estilos por app fuera del estándar”. Ya no representa con precisión la topología runtime y no puede actuar como contrato vigente sin reconciliación.

---

#### 15. Launcher SHELL frente al AppSwitcher runtime

| Dimensión            | SHELL runtime                       | AppSwitcher runtime                             |
| -------------------- | ----------------------------------- | ----------------------------------------------- |
| propósito            | página central de acceso            | launcher contextual dentro de cada app          |
| aplicaciones         | 5                                   | 9                                               |
| grupos               | una cuadrícula principal            | Workspace, Operación, Próximamente              |
| acceso               | enabled / disabled                  | enabled / disabled / soon                       |
| perfil               | menú propio en `page.tsx`           | `ProfileMenu` por app                           |
| contexto laboral     | no se muestra                       | sede y estado agregado en Chrome                |
| tarea pendiente      | no se muestra                       | no se muestra transversalmente                  |
| fuente               | arreglo `INTERNAL_APPS`             | arreglo `APP_SWITCHER_ITEMS` copiado seis veces |
| permiso              | evaluador local con fallback de RPC | evaluadores de cada AppShell                    |
| destinos             | enlaces absolutos                   | enlaces absolutos                               |
| continuidad de tarea | no existe contrato                  | no existe contrato común                        |

SHELL contiene además dos enlaces de perfil —`Mi perfil` y `Configuración de usuario`— que apuntan ambos a `/`. Se mantienen como placeholders confirmados y no se presentan como capacidades terminadas.

---

#### 16. Correspondencia con UX y H2 SHELL APP

| Obligación canónica                            | Estado actual                                               | Resultado                                 |
| ---------------------------------------------- | ----------------------------------------------------------- | ----------------------------------------- |
| separar experiencia operativa y administrativa | el mismo sidebar puede contener ambas según registros       | `PENDIENTE_DE_CLASIFICACION_POR_PANTALLA` |
| mostrar primero la tarea actual                | no existe contrato transversal de tarea actual              | `AUSENTE`                                 |
| evitar nombres técnicos                        | etiquetas son libres y dependen de filas/migraciones        | `NO_DEMOSTRADO`                           |
| ocultar funciones irrelevantes                 | se filtran por permiso, pero no por tarea y etapa canónicas | `PARCIAL`                                 |
| mostrar sede activa                            | existe tarjeta y selector                                   | `IMPLEMENTADO_LEGACY`                     |
| mostrar área activa                            | no se muestra separadamente en todas las apps               | `AUSENTE_COMUN`                           |
| mostrar turno activo                           | etiqueta agregada “Jornada activa” sin identidad completa   | `PARCIAL`                                 |
| mostrar rol operativo                          | no se muestra separadamente en todas las apps               | `AUSENTE_COMUN`                           |
| mostrar tareas pendientes transversales        | no existe agregador                                         | `AUSENTE`                                 |
| página inicial por tipo de usuario             | launcher único con proyección por permiso                   | `NO_DEFINIDA`                             |
| explicar aplicación bloqueada                  | mensaje genérico                                            | `PARCIAL`                                 |
| retorno seguro entre apps                      | enlaces absolutos sin contrato de handoff                   | `NO_DEMOSTRADO`                           |
| conservar contexto al cambiar de app           | no existe payload o token común                             | `NO_DEMOSTRADO`                           |
| conservar tarea en curso                       | no existe contrato común                                    | `AUSENTE`                                 |

La tabla no implementa H2. Solo entrega el inventario y las diferencias que esas tareas deberán consumir.

---

#### 17. Decisión por superficie

| Superficie    | Decisión de esta auditoría                                                                                | Destino obligatorio                                                  |
| ------------- | --------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------- |
| SHELL runtime | conservar como launcher independiente; migrar su catálogo y estados a una fuente común                    | `SHELL-APP-001` a `SHELL-APP-003`; `SHELL-CON-002`; `SHELL-AUD-010`  |
| plantilla     | conservar como fuente histórica bloqueada para adopción hasta corregir parametrización, textos y contrato | `SHELL-AUD-007`; `SHELL-AUD-009`; `SHELL-AUD-010`; `SHELL-AUD-011`   |
| VISO          | conservar su agregación `/operations` como variante explícita hasta reconciliar pantallas                 | `SHELL-CON-011`; `SHELL-AUD-010`; bloque I                           |
| NEXO          | conservar su extensión operacional como variante explícita y probarla contra el contrato común            | `SHELL-AUD-009`; `SHELL-AUD-010`; `SHELL-AUTH-004`; `SHELL-AUTH-005` |
| FOGO          | conservar runtime; no usarlo como baseline implícita por similitud visual                                 | `SHELL-AUD-009`; `SHELL-AUD-010`                                     |
| ORIGO         | conservar filtro local como deuda explícita; no elevar el nombre demo a regla transversal                 | `SHELL-APP-003`; `SHELL-APP-005`; `SHELL-AUD-010`                    |
| PULSO         | conservar scripts de layout como extensión local separada del contrato AppShell                           | `SHELL-AUD-007`; `SHELL-AUD-010`                                     |
| NUMERA        | conservar runtime, bloquear propagación de textos corruptos y reconciliar catálogo                        | `SHELL-CON-002`; `SHELL-AUD-010`; `UX-QA-022`                        |

Ninguna decisión ordena editar o retirar código durante esta fase.

---

#### 18. Hallazgos y destinos obligatorios

| ID                | Hallazgo materializado                                                                                                     | Estado                         | Destino exacto                                                       |
| ----------------- | -------------------------------------------------------------------------------------------------------------------------- | ------------------------------ | -------------------------------------------------------------------- |
| `H-SHELL-006-001` | SHELL, plantilla y apps runtime implementan tres catálogos locales de aplicaciones con cantidades distintas                | `CONFIRMADO`                   | `SHELL-CON-002`; `SHELL-APP-001` a `SHELL-APP-003`; `SHELL-AUD-010`  |
| `H-SHELL-006-002` | el launcher SHELL contiene cinco apps y omite NUMERA, activa en los switchers runtime                                      | `CONFIRMADO`                   | `SHELL-APP-001`; `SHELL-APP-002`; `SHELL-CON-002`                    |
| `H-SHELL-006-003` | la plantilla conserva FOGO como `soon` mientras los runtimes la presentan activa                                           | `DERIVA_DE_ESTADO`             | `SHELL-CON-002`; `SHELL-AUD-010`; `SHELL-CI-017`                     |
| `H-SHELL-006-004` | los seis runtimes duplican nueve identidades, dominios, logos, textos, colores y estados                                   | `CONFIRMADO`                   | `SHELL-CON-002`; `SHELL-AUD-009`; `SHELL-AUD-010`                    |
| `H-SHELL-006-005` | la plantilla AppSwitcher contiene siete entradas, selector de sede y texto UTF-8 corrupto                                  | `FUENTE_DESFASADA`             | `SHELL-AUD-007`; `SHELL-AUD-010`; `UX-QA-022`                        |
| `H-SHELL-006-006` | la plantilla Chrome conserva navegación y permisos NEXO hardcodeados                                                       | `FUENTE_ACOPLADA`              | `SHELL-CON-002`; `SHELL-CON-003`; `SHELL-CON-011`; `SHELL-AUD-010`   |
| `H-SHELL-006-007` | el estándar histórico describe nav en header y selector de sede en switcher, pero runtime usa sidebar y ProfileMenu        | `DOCUMENTACION_DESFASADA`      | `SHELL-AUD-010`; `SHELL-PKG-001`; `SHELL-PKG-002`                    |
| `H-SHELL-006-008` | las cinco familias principales mantienen 36 ocurrencias y ninguna versión o procedencia runtime común                      | `PARIDAD_NO_DEMOSTRADA`        | `SHELL-AUD-009`; `SHELL-AUD-010`; `SHELL-PKG-001` a `SHELL-PKG-008`  |
| `H-SHELL-006-009` | NEXO, ORIGO y PULSO comparten el único blob idéntico de AppSwitcher runtime                                                | `CONFIRMADO`                   | `SHELL-AUD-010`                                                      |
| `H-SHELL-006-010` | `brandColor` existe en el contrato local del AppSwitcher y no altera el render inspeccionado                               | `CAMPO_SIN_CONSUMO_CONFIRMADO` | `SHELL-AUD-009`; `SHELL-AUD-011`                                     |
| `H-SHELL-006-011` | `sites` y `activeSiteId` permanecen en props del AppSwitcher runtime aunque el componente ya no los usa                    | `CONTRATO_RESIDUAL`            | `SHELL-AUD-009`; `SHELL-AUD-011`                                     |
| `H-SHELL-006-012` | seis AppShell consultan `app_navigation_items`, pero descartan `group_key`, `item_key`, `opens_in_new_tab` y `metadata`    | `CONFIRMADO`                   | `SHELL-CON-011`; `SHELL-AUD-009`; `SHELL-AUD-010`                    |
| `H-SHELL-006-013` | `href` actúa simultáneamente como destino, clave de render y base de active matching                                       | `IDENTIDAD_SOBRECARGADA`       | `SHELL-CON-011`; bloque I; `SHELL-AUD-009`                           |
| `H-SHELL-006-014` | la etiqueta visible de grupo sustituye a `group_key` al construir los grupos runtime                                       | `DIVERGENCIA_CON_ESQUEMA`      | `SHELL-CON-011`; `SHELL-AUD-010`                                     |
| `H-SHELL-006-015` | cada aplicación mantiene un enum local de iconos y descarta iconos desconocidos                                            | `PARIDAD_NO_DEMOSTRADA`        | `SHELL-AUD-007`; `SHELL-AUD-009`; `SHELL-AUD-010`                    |
| `H-SHELL-006-016` | VISO agrega localmente todas las rutas `/operations` en una sola entrada                                                   | `EXTENSION_LOCAL_ACTIVA`       | `SHELL-CON-011`; bloque I; `SHELL-AUD-010`                           |
| `H-SHELL-006-017` | NEXO cambia de evaluador para permisos operativos seleccionados de remisiones                                              | `EXTENSION_LOCAL_ACTIVA`       | `SHELL-AUD-009`; `SHELL-AUD-010`; `SHELL-AUTH-004`; `SHELL-AUTH-005` |
| `H-SHELL-006-018` | ORIGO excluye una sede demo mediante comparación literal de nombre                                                         | `EXTENSION_LOCAL_ACTIVA`       | `SHELL-APP-003`; `SHELL-APP-005`; `SHELL-AUD-010`                    |
| `H-SHELL-006-019` | la sede seleccionada se propaga por query, cookie y `employee_settings`, sin contrato transversal de preferencia           | `DOBLE_TRIPLE_FUENTE`          | `SHELL-APP-005`; `SHELL-CON-007`; `SHELL-CTX-003`; `SHELL-AUD-010`   |
| `H-SHELL-006-020` | Chrome muestra sede y estado agregado, pero no turno, área y rol operativo como nodos separados comunes                    | `COBERTURA_PARCIAL`            | `SHELL-APP-004` a `SHELL-APP-007`; `UX-BASE-005`                     |
| `H-SHELL-006-021` | no existe navegación transversal que coloque primero la tarea actual o pendientes                                          | `AUSENTE`                      | `UX-BASE-002`; `SHELL-CON-015`; `SHELL-APP-008`; `SHELL-APP-009`     |
| `H-SHELL-006-022` | el cambio de aplicación usa enlaces absolutos sin contrato común de retorno, contexto o tarea en curso                     | `PARIDAD_NO_DEMOSTRADA`        | `SHELL-CON-014`; `SHELL-APP-014` a `SHELL-APP-016`                   |
| `H-SHELL-006-023` | SHELL presenta dos enlaces de perfil que resuelven a `/`                                                                   | `PLACEHOLDER_CONFIRMADO`       | `AUTH-UI-026` a `AUTH-UI-029`; `SHELL-AUD-011`                       |
| `H-SHELL-006-024` | no se confirmó una suite automatizada que compare catálogo, nav, contexto visible, rutas y estados en las ocho superficies | `PENDIENTE_DE_EVIDENCIA`       | `SHELL-CI-017`; `SHELL-CI-018`; `AUTH-QA-027`; `UX-QA-022`           |

**Conciliación:** 24 hallazgos esperados, 24 materializados, 0 identificadores duplicados y 0 hallazgos sin destino.

---

#### 19. Decisiones documentales resultantes

1. SHELL runtime se conservará como launcher central distinto del AppShell de las aplicaciones.
2. La plantilla se conservará como fuente no runtime y no podrá seguir propagándose sin versión, parametrización y pruebas.
3. El catálogo de aplicaciones deberá centralizar identidad, dominio, nombre, marca, estado y disponibilidad; cada superficie podrá consumir una proyección autorizada.
4. La ausencia de una aplicación en una proyección no se tratará automáticamente como defecto si la proyección está definida por contrato.
5. `app_navigation_items` se conservará como fuente física legacy de navegación hasta que `SHELL-CON-011` y el bloque I definan la identidad canónica de pantalla.
6. `item_key` y `group_key` no deberán perderse si forman parte del contrato futuro.
7. `href` no será la identidad única de una pantalla.
8. `opens_in_new_tab` y `metadata` deberán consumirse o retirarse mediante decisión explícita; no permanecerán como campos decorativos sin contrato.
9. La visibilidad continuará resolviéndose en servidor, pero nunca sustituirá guards, autorización ni validación en destino.
10. La razón de bloqueo deberá distinguir falta de permiso, contexto, despliegue, superficie o estado futuro.
11. La sede seleccionada se clasificará como preferencia o filtro, no como sede operativa autoritativa.
12. La interfaz común deberá mostrar turno, sede, área y rol operativo desde contexto canónico cuando apliquen.
13. La tarea actual y los pendientes transversales no se inferirán desde la primera ruta del sidebar.
14. El cambio entre aplicaciones requerirá contrato de handoff, retorno seguro, contexto admisible y conservación de tarea cuando corresponda.
15. La agregación VISO, la evaluación NEXO, el filtro ORIGO y los scripts PULSO permanecerán como extensiones locales explícitas hasta `SHELL-AUD-010`.
16. Los textos corruptos de plantilla o runtime bloquearán su adopción como fuente compartida.
17. Los props o campos sin consumidor no se retirarán antes de `SHELL-AUD-011`.
18. No se crea un catálogo paralelo dentro de esta auditoría.
19. No se modifica `active-sequence.json`.
20. No se modifica código, Supabase, configuración, CI ni despliegues.
21. `SHELL-AUD-007` permanece como única continuidad inmediata reservada.

---

#### 20. Trazabilidad con requisitos vigentes

Los hallazgos ya están cubiertos por requisitos existentes:

| Requisito        | Cobertura aplicada                                                               |
| ---------------- | -------------------------------------------------------------------------------- |
| `TREQ-SHELL-001` | una app no es operativa por registro o permiso aislado                           |
| `TREQ-SHELL-002` | clasificación y paridad de AppShell y navegación compartidos                     |
| `TREQ-SHELL-003` | catálogo único de aplicación, dominio, estado y marca                            |
| `TREQ-SHELL-014` | snapshot de cinco tarjetas del launcher SHELL                                    |
| `TREQ-SHELL-015` | permiso canónico y transición de firmas RPC del launcher                         |
| `TREQ-SHELL-016` | app sin acceso no navegable y protección en destino                              |
| `TREQ-SHELL-027` | placeholders de perfil no presentados como capacidad real                        |
| `TREQ-SHELL-028` | catálogo único entre launcher, login, template y runtimes                        |
| `TREQ-SHELL-029` | plantilla separada de runtime y con procedencia explícita                        |
| `TREQ-SHELL-030` | visibilidad por permiso/contexto y prohibición de NEXO hardcodeado como estándar |
| `TREQ-SHELL-031` | selección de sede y simulación separadas de autoridad real                       |
| `TREQ-SHELL-034` | destinos absolutos gobernados por catálogo activo                                |
| `TREQ-SHELL-035` | UTF-8, nombres y estados consistentes                                            |
| `TREQ-AUTH-004`  | paridad entre evaluadores para mismo actor y contexto                            |
| `TREQ-AUTH-009`  | territorio determinista y sin ampliación por selección                           |
| `TREQ-AUTH-012`  | simulación separada de autoridad real                                            |

Esta tarea aporta evidencia y decisiones de clasificación, pero no cambia identificador, regla, riesgo, tipo, responsable, paquete, repositorio, estado, evidencia ni relaciones de ninguna fila.

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** las divergencias de catálogo, AppShell, navegación, visibilidad, destinos, sede seleccionada, plantilla, placeholders, codificación y paridad ya están cubiertas por `TREQ-SHELL-001` a `TREQ-SHELL-003`, `TREQ-SHELL-014` a `TREQ-SHELL-016`, `TREQ-SHELL-027` a `TREQ-SHELL-031`, `TREQ-SHELL-034`, `TREQ-SHELL-035`, `TREQ-AUTH-004`, `TREQ-AUTH-009` y `TREQ-AUTH-012`. La tarea no introduce comportamiento ejecutable ni una regla verificable sin cobertura previa. Genera **0** altas, **0** modificaciones, **0** diferimientos, **0** descartes y **0** obsolescencias `TREQ-*`.

---

#### 21. Criterios de aceptación

`SHELL-AUD-006` se considera materialmente completa porque:

- las ocho superficies están representadas una sola vez;
- SHELL runtime, plantilla y seis consumidores están separados;
- las cinco familias físicas conservan ocurrencias, variantes y grupos idénticos;
- los cuatro carriles de navegación están diferenciados;
- los catálogos de 5, 7 y 9 aplicaciones están reconciliados sin asumir que toda diferencia es un defecto;
- la fuente, estado y acceso de cada proyección están materializados;
- los catorce campos funcionales de `app_navigation_items` están contrastados con el consumo runtime;
- los cuatro campos no propagados tienen decisión y destino;
- el pipeline común de navegación y las variantes VISO, NEXO, ORIGO, PULSO y NUMERA están documentados;
- visibilidad y autorización permanecen separadas;
- selector de sede y contexto operativo están comparados sin convertir preferencia en autoridad;
- el estándar histórico está contrastado con la estructura runtime actual;
- el launcher SHELL y el AppSwitcher runtime están comparados por propósito, catálogo, perfil y contexto;
- las obligaciones UX y H2 tienen estado explícito;
- cada superficie tiene decisión y destino;
- los 24 hallazgos tienen propietario documental exacto;
- se declaran cero cambios del registro de requisitos de prueba;
- no se modifica código, SQL, Supabase, configuración, CI, despliegues ni continuidad;
- `SHELL-AUD-007` permanece como única tarea inmediata reservada;
- `SHELL-PKG-001` permanece como handoff posterior al cierre de `SHELL-AUD-011`.

---

#### 22. Resultado y continuidad

La cadena física actual queda materializada como:

```text
catálogo local de aplicaciones
→ launcher o AppSwitcher
→ usuario, simulación o dispositivo
→ estado enabled / disabled / soon
→ navegación interna desde app_navigation_items
→ evaluación local por item
→ NavGroup[]
→ Chrome y sidebar
→ ruta activa por href
→ guard y servidor de destino
```

La cadena objetivo que deberán resolver las tareas posteriores es:

```text
catálogo canónico de aplicaciones
+ contrato canónico de pantallas
+ contexto canónico
+ tarea o pendiente actual
+ autorización estructurada
→ proyección de navegación por actor y contexto
→ handoff seguro entre aplicaciones
→ evidencia y pruebas de paridad
```

La única continuidad inmediata reservada es:

```text
SHELL-AUD-007 — Comparar componentes UI base
```

El handoff `SHELL-PKG-001` se mantiene reservado exclusivamente para después de completar `SHELL-AUD-011`.


### [ ] SHELL-AUD-007 — Comparar componentes UI base
### [ ] SHELL-AUD-008 — Comparar clientes Supabase
### [ ] SHELL-AUD-009 — Comparar tipos y contratos
### [ ] SHELL-AUD-010 — Clasificar compartir / generar / mantener local
### [ ] SHELL-AUD-011 — Clasificar y retirar rutas, componentes, funciones, scripts y endpoints sin consumidores confirmados
Arquitectura de paquetes
