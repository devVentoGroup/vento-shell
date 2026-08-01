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
