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


### ✅ SHELL-AUD-007 — Comparar componentes UI base

**Estado:** APROBADA
**Bloque:** H — Fundación compartida
**Tipo:** auditoría documental comparativa de primitivas UI, tokens, componentes estructurales y políticas globales de interacción
**Entrada de continuidad:** `SHELL-AUD-006 — Comparar AppShell y navegación`
**Continuidad inmediata reservada:** `SHELL-AUD-008 — Comparar clientes Supabase`
**Handoff posterior al segmento `SHELL-AUD-001..011`:** `SHELL-PKG-001 — Elegir mecanismo de distribución`
**Fecha de corte:** 2026-08-01
**Cambios en código, CSS, configuración, paquetes, CI, despliegues o Supabase:** no autorizados ni realizados

---

#### 1. Resultado de esta tarea

Esta tarea compara los componentes UI base actualmente distribuidos entre la plantilla de `vento-shell`, el runtime del Hub y las seis aplicaciones web consumidoras. La comparación separa identidad física, API ejecutable, contrato de clases CSS, tematización legítima y deriva funcional.

| Métrica                                             |  Resultado |
| --------------------------------------------------- | ---------: |
| Superficies UI comparadas                           |      **8** |
| Familias físicas comparadas                         |      **5** |
| Ocurrencias físicas materializadas                  |     **30** |
| Blobs únicos entre las cinco familias               |     **21** |
| Copias de `ui.tsx`                                  |      **7** |
| Contratos ejecutables de `ui.tsx`                   |      **1** |
| Copias de `table.tsx`                               |      **7** |
| Contratos ejecutables de `table.tsx`                |      **1** |
| Variantes semánticas de `PageHeader`                |      **2** |
| Copias runtime de `VentoLogo`                       |      **6** |
| Algoritmos de fallback de `VentoLogo`               |      **2** |
| Superficies `globals.css`                           |      **8** |
| Políticas globales adicionales localizadas en PULSO |      **2** |
| Decisiones por superficie materializadas            | **8 de 8** |
| Hallazgos con destino exacto                        |     **24** |
| Cambios `TREQ-*`                                    |      **0** |

Resultado central:

```text
MISMO NOMBRE DE ARCHIVO
≠ MISMO CONTRATO UI COMPLETO

ui.tsx Y table.tsx
→ VARIOS BLOBS
→ UNA SOLA API EJECUTABLE
→ DERIVA PRINCIPALMENTE DE FORMATO

globals.css, PageHeader Y VentoLogo
→ DIFERENCIAS SEMÁNTICAS REALES
→ TOKENS, RESPONSIVIDAD, FALLBACKS Y POLÍTICAS LOCALES

PLANTILLA OFICIAL
→ NO REPRESENTA EL ESTADO ACTUAL DE LOS CONSUMIDORES
```

La paridad integral de la fundación UI queda **NO DEMOSTRADA**. Existe una base reutilizable reconocible, pero no una fuente versionada única ni pruebas de compatibilidad que distingan núcleo compartido, tema por aplicación y extensiones de dominio.

---

#### 2. Fuentes y corte reproducible

| Fuente                                              | Uso                                                    |
| --------------------------------------------------- | ------------------------------------------------------ |
| `docs/plan-canonico/modular/01_PROTOCOLO.md`        | alcance, continuidad, evidencia y entrega              |
| `docs/plan-canonico/modular/delivery-contract.json` | contrato físico del artefacto                          |
| `docs/plan-canonico/modular/active-sequence.json`   | segmento activo y handoff posterior                    |
| `00_CABECERA_Y_ESTADO.md`                           | estado vigente de la tarea                             |
| `01_AUDITORIA_DE_COMPONENTES_COMPARTIDOS.md`        | propietario, dependencias y marcador actual            |
| `SHELL-AUD-001`                                     | inventario de familias, ocurrencias y hashes           |
| `SHELL-AUD-006`                                     | AppShell, navegación, launcher y extensiones delegadas |
| `07_COMPONENTES_WEB_COMPARTIDOS.md`                 | tareas propietarias de la futura biblioteca UI         |
| `02_DISTRIBUCION_Y_PAQUETES_COMPARTIDOS.md`         | versionado, CI, pinning y pruebas contractuales        |
| `docs/APP-SHELL-ESTANDARES.md`                      | estándar histórico de copia y personalización          |
| plantilla `templates/app-shell-standard`            | fuente física histórica                                |
| código runtime de las siete superficies web         | comportamiento actual                                  |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`  | cobertura `TREQ-*` vigente                             |

Corte documental canónico vigente: `d21b7221290fa043d1000349af9101d000c0735e`.

El runtime de SHELL se inspeccionó en `73c429adf42124b8529d18cebf18c607ab61638c`. El commit documental posterior `d21b7221290fa043d1000349af9101d000c0735e` modifica únicamente fuentes documentales y artefactos derivados; no cambia las familias UI runtime comparadas.

Commits runtime inspeccionados:

| Superficie | Repositorio                  | Commit                                     |
| ---------- | ---------------------------- | ------------------------------------------ |
| SHELL      | `devVentoGroup/vento-shell`  | `73c429adf42124b8529d18cebf18c607ab61638c` |
| VISO       | `devVentoGroup/vento-viso`   | `47322403f3c64e83ae0c4a2f68c05d47093e5bb4` |
| NEXO       | `devVentoGroup/vento-nexo`   | `142c4d696221e3ce3fda4ed3b62f3d1fe5b58799` |
| FOGO       | `devVentoGroup/vento-fogo`   | `b6b9ed00e5267cabaac1a5a1090d93d5f60e86f2` |
| ORIGO      | `devVentoGroup/vento-origo`  | `b7a8303fa078ef087f522b6c99059ababfc27472` |
| PULSO      | `devVentoGroup/vento-pulso`  | `71e0184486b5fe11e0a42435baf4024807a80efd` |
| NUMERA     | `devVentoGroup/vento-numera` | `1b48a5da425d92e19ed89cf175b1dccc4cd960e1` |

La plantilla se contabiliza como fuente adicional dentro de `vento-shell`, no como runtime independiente.

---

#### 3. Continuidad interpretada

La secuencia vigente define:

```text
SHELL-AUD-001..011
→ segmento activo completo

SHELL-PKG-001
→ handoff posterior al cierre de SHELL-AUD-011
```

Por tanto:

```text
SHELL-AUD-006 aprobada
→ SHELL-AUD-007 actual
→ SHELL-AUD-008 inmediata reservada
→ ...
→ SHELL-AUD-011
→ SHELL-PKG-001
```

No existe salto de continuidad. Esta tarea no modifica `active-sequence.json`.

---

#### 4. Alcance exacto

Se comparan:

1. `src/app/globals.css` del runtime de SHELL y de las seis aplicaciones;
2. `templates/app-shell-standard/src/app/globals.css`;
3. `src/components/vento/standard/ui.tsx` y su copia de plantilla;
4. `src/components/vento/standard/table.tsx` y su copia de plantilla;
5. `src/components/vento/standard/page-header.tsx` donde existe;
6. `src/components/vento/standard/vento-logo.tsx` donde existe;
7. tokens, clases públicas, variantes, props, defaults y comportamiento responsive;
8. estados visuales y políticas de interacción incorporadas globalmente;
9. compatibilidad entre componente TypeScript y contrato CSS;
10. diferencias legítimas de tema frente a diferencias que alteran la API o el comportamiento;
11. adopción observable y condición de migración o retiro.

Se excluyen:

| Materia                                                   | Tarea propietaria                       |
| --------------------------------------------------------- | --------------------------------------- |
| comparación de clientes Supabase                          | `SHELL-AUD-008`                         |
| tipos y contratos públicos definitivos                    | `SHELL-AUD-009`                         |
| clasificación final compartir / generar / mantener local  | `SHELL-AUD-010`                         |
| retiro de componentes o estilos sin consumidor confirmado | `SHELL-AUD-011`                         |
| implementación de la biblioteca UI                        | `SHELL-UI-001`                          |
| implementación del AppShell y launcher compartidos        | `SHELL-UI-002`; `SHELL-UI-003`          |
| mecanismo físico de distribución                          | `SHELL-PKG-001` a `SHELL-PKG-008`       |
| migración coordinada de consumidores                      | `SHELL-MIG-001` a `SHELL-MIG-008`       |
| rediseño funcional de pantallas de negocio                | bloques propietarios de cada aplicación |

Esta auditoría no elige todavía un framework, paquete, sistema de variantes ni estrategia de CSS final.

---

#### 5. Taxonomía de comparación

| Estado                          | Criterio                                                               |
| ------------------------------- | ---------------------------------------------------------------------- |
| `PARIDAD_BYTE`                  | mismo blob Git                                                         |
| `PARIDAD_SEMANTICA`             | misma API, defaults, clases y comportamiento observable                |
| `DERIVA_DE_FORMATO`             | cambia BOM, fin de línea, espaciado o formato sin alterar ejecución    |
| `TEMA_LOCAL_VALIDO`             | cambia valor visual por aplicación sin alterar el contrato público     |
| `EXTENSION_LOCAL_VALIDA`        | comportamiento propio de dominio, separado y explícito                 |
| `DIVERGENCIA_DE_API`            | cambia props, variantes, defaults o superficie pública                 |
| `DIVERGENCIA_DE_COMPORTAMIENTO` | misma forma aparente, distinto efecto observable                       |
| `ACOPLAMIENTO_CSS`              | el componente depende de clases o tokens no declarados como contrato   |
| `MEZCLA_BASE_DOMINIO`           | un archivo común contiene estilos de negocio propios de una aplicación |
| `FUENTE_HISTORICA_DESFASADA`    | plantilla o estándar que ya no representa a los runtimes               |
| `CONTRATO_NO_DEMOSTRADO`        | no existe prueba o manifiesto suficiente para afirmar compatibilidad   |
| `PENDIENTE_DE_EVIDENCIA`        | requiere inventario de consumidores o ejecución posterior              |

Un hash distinto no se tratará automáticamente como diferencia funcional. Del mismo modo, una API TypeScript idéntica no demostrará compatibilidad si las clases CSS asociadas producen semánticas incompatibles.

---

#### 6. Inventario de familias

| ID           | Familia                                         | Ocurrencias | Blobs | Clasificación de esta tarea                   | Destino principal                                |
| ------------ | ----------------------------------------------- | ----------: | ----: | --------------------------------------------- | ------------------------------------------------ |
| `UI-FAM-001` | `src/app/globals.css`                           |       **8** | **8** | `DIVERGENTE_CON_NUCLEO_RECONOCIBLE`           | `SHELL-AUD-010`; `SHELL-UI-001`; `SHELL-PKG-008` |
| `UI-FAM-002` | `src/components/vento/standard/ui.tsx`          |       **7** | **3** | `PARIDAD_SEMANTICA_CON_DERIVA_DE_FORMATO`     | `SHELL-AUD-010`; `SHELL-UI-001`                  |
| `UI-FAM-003` | `src/components/vento/standard/table.tsx`       |       **7** | **3** | `PARIDAD_SEMANTICA_CON_DERIVA_DE_FORMATO`     | `SHELL-AUD-010`; `SHELL-UI-001`                  |
| `UI-FAM-004` | `src/components/vento/standard/page-header.tsx` |       **2** | **2** | `DISTRIBUCION_PARCIAL_CON_DIVERGENCIA_DE_API` | `SHELL-AUD-009`; `SHELL-AUD-010`; `SHELL-UI-001` |
| `UI-FAM-005` | `src/components/vento/standard/vento-logo.tsx`  |       **6** | **5** | `DISTRIBUCION_PARCIAL_CON_DERIVA_SEMANTICA`   | `SHELL-AUD-009`; `SHELL-AUD-010`; `SHELL-UI-002` |

**Conciliación:** 5 familias esperadas, 5 materializadas, 30 ocurrencias, 21 blobs únicos, 0 familias omitidas y 0 identificadores duplicados.

---

#### 7. Matriz física de hashes

##### 7.1. `globals.css`

| Fuente        | Blob SHA                                   |
| ------------- | ------------------------------------------ |
| plantilla     | `a1bf4bea91e6a71188aa8c6f4c3dea1d838a372a` |
| SHELL runtime | `ab981cbab29fba2bec954aa505a70235cabb3418` |
| VISO          | `c8c2d74f60fe8f7e7ba8870944d0ab2959980a4c` |
| NEXO          | `f920142e5a23b2dc88cd3b0c4658481bc0bcef6e` |
| FOGO          | `017160673ca45cdff061bfb0aeff41b46847c32c` |
| ORIGO         | `dbd3f044bd42124b5a2364b737d56f2a790476da` |
| PULSO         | `27562fde94c9b41585f2312a4ca49b80dc27ccc1` |
| NUMERA        | `83d60962927a9e7b097c8f1075a7467850378f5b` |

##### 7.2. `ui.tsx`

| Fuente                               | Blob SHA                                   | Grupo                 |
| ------------------------------------ | ------------------------------------------ | --------------------- |
| plantilla, NEXO, FOGO, ORIGO y PULSO | `073c2cf37cb3a12a68e9bfd844ab1e7a78e0be49` | `UI-BASE-A`           |
| VISO                                 | `bf38c12d65dd7bcdad3750da6d75bda4392f329a` | `UI-BASE-A_FORMATO_2` |
| NUMERA                               | `4e66b1768075114ac23c05c941b83e0ba78f6887` | `UI-BASE-A_FORMATO_3` |

##### 7.3. `table.tsx`

| Fuente                               | Blob SHA                                   | Grupo                    |
| ------------------------------------ | ------------------------------------------ | ------------------------ |
| plantilla, NEXO, FOGO, ORIGO y PULSO | `0754a74221ee5441e0c2624c177865354586fd4b` | `TABLE-BASE-A`           |
| VISO                                 | `e9c5286da9d73c828ef9931dca730afd1b43fc57` | `TABLE-BASE-A_FORMATO_2` |
| NUMERA                               | `3cdf3dd9e1df9c364f4e8b549a660038d6b4a15e` | `TABLE-BASE-A_FORMATO_3` |

##### 7.4. `page-header.tsx`

| Fuente | Blob SHA                                   | Variante                 |
| ------ | ------------------------------------------ | ------------------------ |
| VISO   | `d171b312fab0794470ff18965b88e6452695fb19` | `PAGE-HEADER-ACCENT`     |
| NEXO   | `f7af0dc287f458ff26a91711442bedfb823a6542` | `PAGE-HEADER-RESPONSIVE` |

##### 7.5. `vento-logo.tsx`

| Fuente       | Blob SHA                                   | Familia de fallback |
| ------------ | ------------------------------------------ | ------------------- |
| VISO         | `9c05cd4f6467f1f956a8d57f23a68a0a46df012e` | `NEXO_CENTRIC`      |
| NEXO y PULSO | `a9f31cee67e90bf5f494708aba7d1a0b9339b18f` | `NEXO_CENTRIC`      |
| FOGO         | `eb36c210a098db84d80856e2def237fa0c625074` | `ORIGO_CENTRIC`     |
| ORIGO        | `1d041cfa3678bc5372bbed4b60f0bf9a2171334c` | `ORIGO_CENTRIC`     |
| NUMERA       | `83e22703ad5a28a5498a1232aaf6bafe3eaaf12c` | `ORIGO_CENTRIC`     |

La matriz preserva identidad física y no confunde los cinco blobs de `VentoLogo` con cinco contratos necesariamente diferentes.

---

#### 8. Contrato ejecutable de `ui.tsx`

Las siete ocurrencias exponen la misma API observable:

| Componente | Contrato actual                                              |
| ---------- | ------------------------------------------------------------ |
| `Button`   | botón nativo con `variant`, `size`, `className` y props HTML |
| `Card`     | contenedor `div` con clase base y `className`                |
| `Input`    | `input` nativo con clase base y props HTML                   |
| `Select`   | `select` nativo con clase base y props HTML                  |
| `Badge`    | `span` con clase base y props HTML                           |

Variantes de `Button`:

```text
primary
secondary
ghost
brand
```

Tamaños:

```text
sm
md
lg
```

Defaults confirmados:

```text
variant = primary
size = md
```

Conclusiones:

1. los tres blobs implementan la misma composición de clases;
2. las diferencias observadas son de formato, fin de línea o serialización;
3. el archivo puede clasificarse como un único núcleo semántico;
4. la compatibilidad visual depende de que cada `globals.css` defina de forma compatible `ui-btn`, sus variantes, tamaños y las demás clases primitivas;
5. la API no expone actualmente estado de carga, iconos, ancho completo, intención destructiva, enlace polimórfico, descripción accesible ni composición mediante `asChild`;
6. la ausencia de esas capacidades no es un defecto por sí sola, pero impide presentar el archivo actual como biblioteca UI completa.

Decisión de esta tarea:

```text
ui.tsx
→ NÚCLEO COMPARTIBLE CANDIDATO
→ CONTRATO CSS TODAVÍA IMPLÍCITO
→ NO CENTRALIZAR SIN PRUEBA DE TOKENS Y CLASES
```

---

#### 9. Contrato ejecutable de `table.tsx`

Las siete ocurrencias exponen la misma API observable:

```text
Table
Thead
Tbody
Tr
Th
Td
```

Cada exportación es un wrapper del elemento HTML equivalente y agrega una clase `ui-table*`.

| Dimensión                   | Estado actual                          |
| --------------------------- | -------------------------------------- |
| semántica HTML básica       | presente                               |
| forwarding de props nativas | presente                               |
| caption                     | no modelado como componente propio     |
| ordenamiento                | no modelado                            |
| selección de fila           | no modelada                            |
| loading                     | no modelado                            |
| error                       | no modelado                            |
| estado vacío                | no modelado                            |
| paginación                  | no modelada                            |
| densidad                    | depende de CSS local                   |
| responsive / overflow       | depende del consumidor y CSS           |
| sticky header               | no forma parte del contrato TypeScript |
| virtualización              | no aplica al wrapper actual            |

Conclusiones:

1. los tres blobs constituyen una sola API semántica;
2. el núcleo actual es un set de wrappers, no un sistema de tabla de datos;
3. la futura biblioteca deberá conservar la semántica HTML y decidir expresamente si las capacidades superiores permanecen en componentes separados;
4. no se debe inflar este wrapper con lógica de dominio ni asumir que todas las tablas requieren el mismo modelo de interacción.

---

#### 10. Comparación de `PageHeader`

`PageHeader` existe únicamente en VISO y NEXO.

| Dimensión               | VISO                     | NEXO                              | Resultado            |
| ----------------------- | ------------------------ | --------------------------------- | -------------------- |
| `title`                 | requerido                | requerido                         | equivalente          |
| `subtitle`              | opcional                 | opcional                          | equivalente          |
| `actions`               | opcional                 | opcional                          | equivalente          |
| `accent`                | opcional, default `true` | inexistente                       | divergente           |
| título acentuado        | `ui-h1-accent`           | no                                | divergente           |
| mobile layout           | fila principal           | columna y salto a fila desde `sm` | divergente           |
| contenedor de acciones  | fila simple              | ancho completo y wrap en móvil    | divergente           |
| presencia en plantilla  | no                       | no                                | ausencia común       |
| presencia en otras apps | no localizada            | no localizada                     | distribución parcial |

Interpretación:

- VISO añade una decisión visual de énfasis mediante API pública.
- NEXO prioriza robustez responsive para acciones múltiples.
- Ninguna variante contiene lógica empresarial y ambas son candidatas a reconciliación.
- La API final deberá combinar las capacidades válidas sin elegir una copia únicamente por antigüedad o cantidad de consumidores.

Decisión:

```text
PageHeader
→ COMPONENTE BASE CANDIDATO
→ API PÚBLICA A RECONCILIAR
→ RESPONSIVIDAD NEXO Y ÉNFASIS VISO DEBEN SER DECISIONES EXPLÍCITAS
```

---

#### 11. Comparación de `VentoLogo`

Las seis aplicaciones runtime contienen `VentoLogo`; la plantilla no lo contiene.

Contrato común observado:

| Prop       | Uso                                 |
| ---------- | ----------------------------------- |
| `entity`   | selecciona marca, color y etiqueta  |
| `title`    | texto principal opcional            |
| `subtitle` | texto secundario opcional           |
| `showText` | permite representación solo gráfica |

Elementos duplicados localmente:

- unión de códigos de aplicación;
- mapa de labels por aplicación;
- mapa de color de marca;
- SVG y nodos animados;
- selección de fallback textual;
- clases `ui-vento-logo-*`.

Existen dos algoritmos de fallback:

```text
FAMILIA NEXO_CENTRIC
si entity = nexo
→ PRODUCT_LABELS.nexo
si no
→ VENTO_GROUP_LABEL
```

```text
FAMILIA ORIGO_CENTRIC
si entity = origo
→ PRODUCT_LABELS.origo
si no
→ VENTO_GROUP_LABEL
```

Consecuencias:

1. el fallback depende accidentalmente de la aplicación desde la que fue copiado;
2. FOGO y NUMERA pueden mostrar el label general cuando el caller omite `subtitle`, aunque la entidad sea propia;
3. VISO y PULSO mantienen la variante centrada en NEXO;
4. ORIGO conserva el único caso donde la variante `ORIGO_CENTRIC` coincide naturalmente con su aplicación;
5. los códigos, labels y colores no proceden de un contrato compartido;
6. `showText=false` no materializa dentro del componente un contrato explícito común de nombre accesible o decoración silenciosa;
7. el movimiento de nodos y líneas depende de reglas CSS locales.

Decisión:

```text
VentoLogo
→ COMPONENTE ESTRUCTURAL COMPARTIBLE
→ DATOS DE MARCA DEBEN PROVENIR DE CONTRATO CENTRAL
→ FALLBACKS APP-CENTRIC NO SON REGLA CANÓNICA
→ ACCESIBILIDAD Y REDUCCIÓN DE MOVIMIENTO DEBEN SER PARTE DEL CONTRATO
```

---

#### 12. Arquitectura actual de `globals.css`

Las ocho superficies físicas no forman una sola familia semántica.

| Superficie    | Rol actual                                                  | Clasificación                     |
| ------------- | ----------------------------------------------------------- | --------------------------------- |
| plantilla     | base histórica con directivas y tokens mínimos              | `FUENTE_HISTORICA_DESFASADA`      |
| SHELL runtime | estilos propios del Hub                                     | `SUPERFICIE_PROPIETARIA_DISTINTA` |
| VISO          | contrato UI amplio y extensiones administrativas            | `BASE_MAS_EXTENSION_LOCAL`        |
| NEXO          | contrato UI amplio y extensiones operativas                 | `BASE_MAS_EXTENSION_LOCAL`        |
| FOGO          | base compartida con tema de producción                      | `BASE_TEMATIZADA`                 |
| ORIGO         | base compartida con tema de compras                         | `BASE_TEMATIZADA`                 |
| PULSO         | base compartida con tema POS y políticas globales en layout | `BASE_TEMATIZADA_MAS_POLITICAS`   |
| NUMERA        | base compartida con densidad y semántica financiera         | `BASE_MAS_EXTENSION_LOCAL`        |

Diferencias de generación:

- la plantilla conserva directivas históricas `@tailwind base`, `@tailwind components` y `@tailwind utilities`;
- los runtimes consumidores usan la generación actual basada en `@import "tailwindcss"`;
- el runtime de SHELL utiliza su propia composición de Hub y no expone la misma colección de primitivas `ui-*`;
- los consumidores agregaron tokens, sombras, densidad, launcher, sidebar, logo y estilos de dominio que la plantilla no representa.

La plantilla no puede considerarse fuente normativa del CSS actual sin una reconciliación explícita.

---

#### 13. Núcleo reconocible de tokens y clases

Los seis consumidores runtime comparten una convención nominal suficiente para identificar un núcleo candidato:

##### 13.1. Categorías de tokens

| Categoría  | Ejemplos de identidad compartida                   |
| ---------- | -------------------------------------------------- |
| superficie | fondo, superficie principal, superficie secundaria |
| texto      | texto principal, muted, contraste                  |
| borde      | borde base y énfasis                               |
| marca      | primary, brand, accent y variantes suaves          |
| geometría  | radios de card, control y badge                    |
| elevación  | sombras base y elevadas                            |
| densidad   | alturas y paddings de controles                    |
| layout     | anchos y comportamiento de sidebar/header          |

##### 13.2. Clases primitivas compartidas

```text
ui-btn
ui-btn--primary
ui-btn--secondary
ui-btn--ghost
ui-btn--brand
ui-btn--sm
ui-btn--md
ui-btn--lg
ui-card
ui-input
ui-select
ui-badge
ui-empty
ui-table
ui-table-head
ui-table-body
ui-table-row
ui-table-th
ui-table-td
```

##### 13.3. Clases estructurales recurrentes

```text
ui-sidebar
ui-sidebar-item
ui-header
ui-app-launcher
ui-app-glyph
ui-app-status
ui-vento-logo
```

La coincidencia nominal permite extraer un contrato. No prueba todavía:

- que todas las variables existan en todas las aplicaciones;
- que sus valores respeten los mismos estados y contrastes;
- que cada clase produzca la misma geometría;
- que una actualización de clase sea compatible con todos los consumidores;
- que estilos de dominio no dependan de detalles internos de la base.

---

#### 14. Tema legítimo frente a deriva funcional

| Cambio                                                           | Clasificación                   |
| ---------------------------------------------------------------- | ------------------------------- |
| color de marca por aplicación                                    | `TEMA_LOCAL_VALIDO`             |
| tipografía autorizada por producto                               | decisión contractual pendiente  |
| densidad financiera de NUMERA                                    | `EXTENSION_LOCAL_CANDIDATA`     |
| layouts táctiles u operativos de NEXO/PULSO                      | `EXTENSION_LOCAL_CANDIDATA`     |
| textos, labels o app codes copiados desde otra aplicación        | `DERIVA_DE_CONFIGURACION`       |
| ausencia de token requerido por un componente base               | `INCOMPATIBILIDAD_CONTRACTUAL`  |
| redefinir una clase base con distinta semántica de interacción   | `DIVERGENCIA_DE_COMPORTAMIENTO` |
| estilos de una pantalla empresarial dentro del núcleo compartido | `MEZCLA_BASE_DOMINIO`           |
| política global de submit fuera del contrato del componente      | `POLITICA_LOCAL_NO_DECLARADA`   |

Regla resultante:

```text
EL TEMA PUEDE CAMBIAR VALORES
NO PUEDE CAMBIAR SILENCIOSAMENTE EL SIGNIFICADO DE LA API
```

---

#### 15. Mezcla entre base y dominio

Los `globals.css` más evolucionados contienen, junto al núcleo UI, clases propias de rutas o flujos empresariales.

Ejemplos de categorías localizadas:

- remisiones, scanner, conteo, ubicaciones y operación en NEXO;
- paneles, estados y superficies administrativas en VISO;
- densidad, cifras y presentación financiera en NUMERA;
- launcher, sidebar y chrome dentro del mismo archivo que primitivas;
- ajustes visuales particulares de páginas o formularios en aplicaciones consumidoras.

Esta mezcla produce tres problemas de distribución:

1. copiar todo el archivo arrastra estilos que no pertenecen a otras aplicaciones;
2. extraer solo los componentes TypeScript rompe su contrato CSS implícito;
3. actualizar una clase base puede alterar selectores de dominio sin una prueba contractual.

La solución posterior deberá separar, como mínimo:

```text
TOKENS BASE
+
PRIMITIVAS
+
ESTRUCTURA APP SHELL
+
TEMA DE APLICACIÓN
+
EXTENSIONES DE DOMINIO LOCALES
```

Esta tarea no decide si esa separación se implementará mediante paquetes CSS, capas, módulos, presets o generación.

---

#### 16. Políticas globales adicionales de PULSO

El layout de PULSO contiene dos scripts globales de interacción que no aparecen en `ui.tsx`.

##### 16.1. Protección de rueda en inputs numéricos

Flujo observado:

```text
wheel sobre input[type=number] enfocado
→ blur del input
→ preventDefault
```

Propósito observable: impedir cambios accidentales por rueda. Su alcance es todo el documento y no está expresado como prop, hook ni componente.

##### 16.2. Protección de doble submit

Flujo observado:

```text
submit válido
→ marcar form como submitting
→ deshabilitar botones submit
→ establecer aria-disabled
→ cambiar texto a Guardando... o pendingLabel
→ restaurar durante pageshow
```

Propósito observable: impedir envíos repetidos y ofrecer feedback. Su alcance también es global y utiliza convenciones `data-*` no declaradas por la biblioteca base.

Conclusiones:

1. ambas reglas resuelven necesidades transversales plausibles;
2. no se confirmó paridad en las demás aplicaciones;
3. no deben elevarse a estándar únicamente porque existen en PULSO;
4. tampoco deben eliminarse antes de identificar consumidores y casos de uso;
5. su contrato, opt-out, accesibilidad, reanudación y convivencia con Server Actions deberán definirse en `SHELL-UI-001` y probarse mediante `SHELL-PKG-008`.

---

#### 17. Accesibilidad, foco y movimiento

| Dimensión                            | Estado observado                          | Resultado                                       |
| ------------------------------------ | ----------------------------------------- | ----------------------------------------------- |
| elementos HTML nativos en primitivas | presente                                  | base favorable                                  |
| forwarding de atributos ARIA nativos | presente mediante props                   | favorable                                       |
| foco                                 | depende de clases CSS locales             | paridad no demostrada                           |
| contraste                            | depende del tema por aplicación           | paridad no demostrada                           |
| `PageHeader` responsive              | explícito solo en variante NEXO           | distribución parcial                            |
| nombre accesible de logo icon-only   | no contractualizado dentro del componente | pendiente de decisión                           |
| animaciones de logo                  | presentes                                 | comportamiento compartido físicamente duplicado |
| `prefers-reduced-motion`             | localizado en VISO y NEXO                 | cobertura parcial                               |
| formularios en estado pendiente      | política global solo confirmada en PULSO  | cobertura parcial                               |
| errores y loading                    | no forman parte del núcleo actual         | delegados a consumidores                        |

No se declara una certificación de accesibilidad ni un incumplimiento integral. El estado correcto es `CONTRATO_NO_DEMOSTRADO` porque la misma API puede recibir foco, contraste y movimiento diferentes según el CSS local.

---

#### 18. Plantilla frente a runtimes

| Dimensión                         | Plantilla                      | Runtimes actuales                  |
| --------------------------------- | ------------------------------ | ---------------------------------- |
| Tailwind                          | directivas históricas          | importación actual en consumidores |
| `ui.tsx`                          | núcleo base                    | mismo núcleo semántico             |
| `table.tsx`                       | núcleo base                    | mismo núcleo semántico             |
| `PageHeader`                      | ausente                        | VISO y NEXO                        |
| `VentoLogo`                       | ausente                        | seis aplicaciones                  |
| tokens                            | mínimos                        | ampliados y tematizados            |
| launcher/sidebar/logo             | versión histórica o incompleta | contratos runtime más amplios      |
| reducción de movimiento           | no demostrada                  | parcial                            |
| políticas globales de formularios | ausentes                       | PULSO local                        |
| estilos de dominio                | mínimos                        | extensos en varias apps            |

Decisión:

```text
LA PLANTILLA ES EVIDENCIA DE ORIGEN
NO ES LA FUENTE DE VERDAD ACTUAL
```

No deberá volver a copiarse como estándar vigente hasta que `SHELL-AUD-010`, `SHELL-PKG-001..008` y `SHELL-MIG-001..008` definan fuente, versión, compatibilidad y adopción.

---

#### 19. Decisión por superficie

| ID            | Superficie    | Estado actual                                                   | Decisión de esta tarea                                                                                                   | Destino                                           |
| ------------- | ------------- | --------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------- |
| `UI-SURF-001` | SHELL runtime | Hub con contrato visual propio                                  | mantener separado como superficie propietaria; comparar integración futura, no usar como fuente automática de primitivas | `SHELL-AUD-010`; `SHELL-UI-001`; `SHELL-UI-002`   |
| `UI-SURF-002` | plantilla     | origen histórico desfasado                                      | congelar como evidencia hasta decidir reemplazo o generación; no propagar nuevas copias                                  | `SHELL-AUD-010`; `SHELL-PKG-001`; `SHELL-MIG-004` |
| `UI-SURF-003` | VISO          | núcleo común más extensiones administrativas                    | conservar extensiones válidas y separar dominio de base durante migración                                                | `SHELL-UI-001`; `SHELL-AUD-010`; `SHELL-MIG-005`  |
| `UI-SURF-004` | NEXO          | núcleo común más extensiones operativas y responsive            | conservar capacidades operativas; no elevar clases de dominio al núcleo                                                  | `SHELL-UI-001`; `SHELL-AUD-010`; `SHELL-MIG-005`  |
| `UI-SURF-005` | FOGO          | núcleo común tematizado y logo con fallback copiado             | mantener hasta migración; corregir procedencia mediante contrato compartido, no parche local en esta fase                | `SHELL-UI-001`; `SHELL-UI-002`; `SHELL-MIG-005`   |
| `UI-SURF-006` | ORIGO         | núcleo común tematizado                                         | mantener como consumidor; no usar como plantilla universal por coincidencia del fallback                                 | `SHELL-UI-001`; `SHELL-UI-002`; `SHELL-MIG-005`   |
| `UI-SURF-007` | PULSO         | núcleo común, logo compartido con NEXO y dos políticas globales | mantener políticas como extensiones explícitas hasta decisión contractual                                                | `SHELL-UI-001`; `SHELL-AUD-010`; `SHELL-MIG-005`  |
| `UI-SURF-008` | NUMERA        | núcleo común más densidad financiera y fallback copiado         | preservar densidad como extensión local; migrar datos de marca a contrato común                                          | `SHELL-UI-001`; `SHELL-UI-002`; `SHELL-MIG-005`   |

**Conciliación:** 8 superficies esperadas, 8 decisiones materializadas, 0 faltantes y 0 duplicadas.

---

#### 20. Contrato mínimo que deberá preservar la solución posterior

| Dimensión      | Requisito mínimo                                                  |
| -------------- | ----------------------------------------------------------------- |
| fuente         | una identidad de origen versionada y reproducible                 |
| primitivas     | API pública tipada y estable                                      |
| CSS            | contrato explícito de clases, tokens y capas                      |
| tema           | valores por aplicación sin alterar semántica                      |
| dominio        | extensiones locales fuera del núcleo compartido                   |
| responsive     | comportamiento definido por componente y no por accidente local   |
| accesibilidad  | foco, nombre, contraste, estados y movimiento verificables        |
| interacción    | políticas globales declaradas, configurables y probadas           |
| marca          | códigos, labels, logos y colores derivados de contrato compartido |
| tablas         | separación entre wrappers semánticos y tabla de datos avanzada    |
| errores        | estados y mensajes sin depender de convenciones ocultas           |
| compatibilidad | política semántica de versiones y migración                       |
| adopción       | inventario de consumidores y pinning por aplicación               |
| pruebas        | matriz contractual entre paquete, CSS, tema y consumidores        |
| rollback       | restauración por aplicación sin mezclar versiones incompatibles   |

Esta tabla no implementa la solución; materializa las condiciones que deberán conservar las tareas posteriores.

---

#### 21. Hallazgos y destinos obligatorios

| ID                | Hallazgo materializado                                                                                            | Estado                          | Destino exacto                                                     |
| ----------------- | ----------------------------------------------------------------------------------------------------------------- | ------------------------------- | ------------------------------------------------------------------ |
| `H-SHELL-007-001` | existen ocho superficies `globals.css` y ocho blobs distintos                                                     | `CONFIRMADO`                    | `SHELL-AUD-010`; `SHELL-UI-001`; `SHELL-PKG-008`                   |
| `H-SHELL-007-002` | los seis consumidores comparten nombres de tokens y clases, pero no un manifiesto contractual                     | `CONTRATO_NO_DEMOSTRADO`        | `SHELL-AUD-009`; `SHELL-UI-001`; `SHELL-PKG-008`                   |
| `H-SHELL-007-003` | el runtime de SHELL mantiene una superficie visual distinta del contrato de primitivas consumidor                 | `CONFIRMADO`                    | `SHELL-AUD-010`; `SHELL-UI-001`; `SHELL-UI-002`                    |
| `H-SHELL-007-004` | la plantilla usa una generación CSS histórica y no representa los runtimes actuales                               | `FUENTE_HISTORICA_DESFASADA`    | `SHELL-AUD-010`; `SHELL-PKG-001`; `SHELL-PKG-004`; `SHELL-MIG-004` |
| `H-SHELL-007-005` | `ui.tsx` tiene tres blobs, pero una sola API ejecutable                                                           | `PARIDAD_SEMANTICA`             | `SHELL-AUD-010`; `SHELL-UI-001`; `SHELL-PKG-006`                   |
| `H-SHELL-007-006` | la API de primitivas depende de clases CSS no tipadas ni versionadas junto al componente                          | `ACOPLAMIENTO_CSS`              | `SHELL-AUD-009`; `SHELL-UI-001`; `SHELL-PKG-003`; `SHELL-PKG-008`  |
| `H-SHELL-007-007` | el núcleo `Button/Card/Input/Select/Badge` no constituye todavía una biblioteca completa de estados y composición | `ESPECIFICADO`                  | `SHELL-UI-001`                                                     |
| `H-SHELL-007-008` | `table.tsx` tiene tres blobs, pero una sola API ejecutable                                                        | `PARIDAD_SEMANTICA`             | `SHELL-AUD-010`; `SHELL-UI-001`; `SHELL-PKG-006`                   |
| `H-SHELL-007-009` | la tabla actual es un wrapper semántico y no un sistema de datos                                                  | `CONFIRMADO`                    | `SHELL-UI-001`                                                     |
| `H-SHELL-007-010` | `PageHeader` existe solo en VISO y NEXO                                                                           | `DISTRIBUCION_PARCIAL`          | `SHELL-AUD-010`; `SHELL-UI-001`; `SHELL-AUD-011`                   |
| `H-SHELL-007-011` | VISO y NEXO exponen APIs distintas de acento y responsive                                                         | `DIVERGENCIA_DE_API`            | `SHELL-AUD-009`; `SHELL-AUD-010`; `SHELL-UI-001`                   |
| `H-SHELL-007-012` | `VentoLogo` está duplicado en seis runtimes y ausente de la plantilla                                             | `CONFIRMADO`                    | `SHELL-AUD-010`; `SHELL-UI-002`; `SHELL-PKG-001`                   |
| `H-SHELL-007-013` | códigos, labels y colores de aplicación se repiten dentro de `VentoLogo`                                          | `DERIVA_DE_CONFIGURACION`       | `SHELL-CON-002`; `SHELL-AUD-009`; `SHELL-UI-002`                   |
| `H-SHELL-007-014` | existen dos algoritmos app-centric de fallback textual                                                            | `DIVERGENCIA_DE_COMPORTAMIENTO` | `SHELL-AUD-010`; `SHELL-UI-002`; `SHELL-PKG-008`                   |
| `H-SHELL-007-015` | FOGO y NUMERA heredan el fallback centrado en ORIGO                                                               | `DERIVA_DE_CONFIGURACION`       | `SHELL-AUD-010`; `SHELL-UI-002`; `SHELL-MIG-005`                   |
| `H-SHELL-007-016` | la representación icon-only del logo no tiene un contrato accesible común explícito                               | `CONTRATO_NO_DEMOSTRADO`        | `SHELL-AUD-009`; `SHELL-UI-001`; `SHELL-UI-002`                    |
| `H-SHELL-007-017` | las animaciones del logo dependen de CSS local y la reducción de movimiento solo se localizó en VISO y NEXO       | `COBERTURA_PARCIAL`             | `SHELL-UI-001`; `SHELL-PKG-008`; `SHELL-MIG-006`                   |
| `H-SHELL-007-018` | varios `globals.css` mezclan núcleo UI, AppShell y estilos de dominio                                             | `MEZCLA_BASE_DOMINIO`           | `SHELL-AUD-010`; `SHELL-UI-001`; `SHELL-UI-002`; `SHELL-MIG-005`   |
| `H-SHELL-007-019` | la tematización por aplicación no está separada físicamente del núcleo compartido                                 | `CONFIRMADO`                    | `SHELL-AUD-009`; `SHELL-AUD-010`; `SHELL-UI-001`; `SHELL-PKG-004`  |
| `H-SHELL-007-020` | PULSO aplica una política global para impedir cambios accidentales por rueda en inputs numéricos                  | `EXTENSION_LOCAL_ACTIVA`        | `SHELL-AUD-010`; `SHELL-UI-001`; `SHELL-PKG-008`                   |
| `H-SHELL-007-021` | PULSO aplica una política global de doble submit y feedback mediante `data-*`                                     | `EXTENSION_LOCAL_ACTIVA`        | `SHELL-AUD-009`; `SHELL-AUD-010`; `SHELL-UI-001`; `SHELL-PKG-008`  |
| `H-SHELL-007-022` | las dos políticas PULSO no forman parte del contrato público de las primitivas                                    | `CONTRATO_NO_DEMOSTRADO`        | `SHELL-AUD-009`; `SHELL-UI-001`; `SHELL-PKG-004`; `SHELL-PKG-008`  |
| `H-SHELL-007-023` | no existe versión, procedencia y pinning común para la familia UI                                                 | `CONFIRMADO`                    | `SHELL-PKG-003`; `SHELL-PKG-005`; `SHELL-PKG-007`                  |
| `H-SHELL-007-024` | no se confirmó una suite que pruebe API TypeScript, clases CSS, tokens, tema y consumidores como una unidad       | `PENDIENTE_DE_EVIDENCIA`        | `SHELL-PKG-006`; `SHELL-PKG-008`; `SHELL-MIG-006`; `SHELL-MIG-007` |

**Conciliación:** 24 hallazgos esperados, 24 materializados, 0 IDs duplicados y 0 hallazgos sin tarea responsable.

---

#### 22. Decisiones documentales resultantes

1. `ui.tsx` y `table.tsx` se clasifican como núcleos semánticos comunes con deriva física de formato.
2. Ninguno se distribuirá aisladamente de su contrato CSS.
3. `PageHeader` se clasifica como componente parcial candidato a reconciliación, no como copia canónica existente.
4. La responsividad de NEXO y el acento de VISO se conservarán como entradas de diseño, no como variantes rivales sin decisión.
5. `VentoLogo` se clasifica como componente estructural compartible con datos de marca incorrectamente embebidos y duplicados.
6. Los fallbacks centrados en NEXO u ORIGO no se convertirán en regla común.
7. El tema por aplicación seguirá siendo permitido, pero deberá quedar separado de la semántica de la API.
8. Los estilos de dominio permanecerán locales y no se incorporarán automáticamente al paquete base.
9. El runtime de SHELL no se usará como fuente universal de primitivas por ser propietario del Hub.
10. La plantilla histórica no se reutilizará como fuente normativa antes de su disposición final.
11. Las políticas globales PULSO se conservarán como extensiones activas hasta que se defina su contrato o retiro.
12. La futura solución deberá cubrir accesibilidad, foco, movimiento y estados sin depender de coincidencias locales.
13. No se retira ninguna ocurrencia con consumidores posibles antes de `SHELL-AUD-011` y de una migración comprobada.
14. No se crea un segundo sistema UI paralelo al definido por `SHELL-UI-001`.
15. No se modifica código, CSS, paquetes, configuración, CI, despliegues ni Supabase.
16. No se modifica `active-sequence.json`.
17. `SHELL-AUD-008` permanece como única continuidad inmediata reservada.
18. `SHELL-PKG-001` permanece como handoff exclusivo posterior a `SHELL-AUD-011`.

---

#### 23. Trazabilidad con requisitos vigentes

La auditoría reutiliza, sin modificar, requisitos canónicos existentes relacionados con:

- paridad y clasificación de responsabilidades compartidas;
- evidencia antes de retirar artefactos o compatibilidad consumida;
- separación entre fuente compartida, plantilla y runtime;
- integridad de nombres, textos, estados y configuraciones propagadas;
- adopción y compatibilidad comprobable entre paquete y consumidor.

Identidades vigentes relacionadas:

- `TREQ-SHELL-002`;
- `TREQ-SHELL-004`;
- `TREQ-SHELL-029`;
- `TREQ-SHELL-035`.

Esta tarea aporta evidencia comparativa, pero no cambia identificador, regla, prioridad, responsable, paquete, repositorio, estado, artefacto, evidencia ni relaciones de ninguna fila del registro canónico.

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea compara implementaciones existentes y materializa divergencias ya cubiertas por requisitos vigentes de paridad, conservación de consumidores, separación entre fuente y runtime e integridad de artefactos compartidos. No introduce comportamiento ejecutable, no modifica un contrato canónico y no descubre una regla verificable sin cobertura previa.

Se generan:

- **0** altas `TREQ-*`;
- **0** modificaciones;
- **0** diferimientos;
- **0** descartes;
- **0** obsolescencias.

No corresponde generar una copia del registro `04A`.

---

#### 24. Criterios de aceptación

`SHELL-AUD-007` se considera materialmente completa porque:

- las ocho superficies UI están representadas una sola vez;
- las cinco familias y treinta ocurrencias están conciliadas;
- los hashes físicos se preservan sin confundir diferencia de blob con diferencia funcional;
- `ui.tsx` y `table.tsx` están comparados por API, defaults, clases y capacidades;
- la deriva de formato queda separada de la deriva semántica;
- las dos variantes de `PageHeader` están contrastadas por props y responsive;
- las seis copias de `VentoLogo` están comparadas por API, datos, fallback, accesibilidad y movimiento;
- las ocho superficies CSS están clasificadas por función y generación;
- el núcleo nominal de tokens y clases está materializado sin declarar paridad no demostrada;
- tema, estructura y dominio están separados conceptualmente;
- las dos políticas globales PULSO están inventariadas y asignadas;
- accesibilidad, foco, movimiento y estados tienen clasificación explícita;
- plantilla, Hub y consumidores tienen decisión propia;
- las ocho superficies tienen destino de migración o conservación;
- los veinticuatro hallazgos tienen estado y tarea responsable;
- no se crea ninguna tarea nueva ni queda un pendiente narrativo;
- se declaran cero cambios `TREQ-*`;
- no se modifica código, CSS, configuración, paquetes, CI, despliegues ni continuidad;
- `SHELL-AUD-008` permanece como única tarea reservada.

---

#### 25. Resultado y continuidad

La cadena comparativa resultante es:

```text
archivo y blob
→ API TypeScript
→ clases y tokens consumidos
→ comportamiento visual e interacción
→ tema o extensión de dominio
→ consumidor runtime
→ hallazgo de paridad
→ contrato UI y estrategia de distribución
→ migración y prueba contractual
```

La única continuidad inmediata reservada es:

```text
SHELL-AUD-008 — Comparar clientes Supabase
```

El handoff `SHELL-PKG-001` permanece reservado exclusivamente para después de completar `SHELL-AUD-011`.


### ✅ SHELL-AUD-008 — Comparar clientes Supabase

**Estado:** APROBADA
**Bloque:** H — Fundación compartida
**Tipo:** auditoría documental comparativa de clientes Supabase, políticas de sesión, fronteras de middleware y helpers asociados
**Entrada de continuidad:** `SHELL-AUD-007 — Comparar componentes UI base`
**Continuidad inmediata reservada:** `SHELL-AUD-009 — Comparar tipos y contratos`
**Handoff posterior al segmento `SHELL-AUD-001..011`:** `SHELL-PKG-001 — Elegir mecanismo de distribución`
**Fecha de corte:** 2026-08-01
**Cambios en código, migraciones, configuración, datos, CI, despliegues o Supabase:** no autorizados ni realizados

---

#### 1. Resultado de esta tarea

Esta tarea materializa la comparación completa de las fronteras Supabase actualmente distribuidas entre SHELL, VISO, NEXO, FOGO, ORIGO, PULSO y NUMERA. La comparación distingue identidad física, contrato ejecutable, ciclo de vida del cliente, precedencia de configuración, política de cookies, tratamiento de errores, privilegio administrativo, consumo y papel real dentro de la frontera de autenticación.

| Métrica                                             |  Resultado |
| --------------------------------------------------- | ---------: |
| Superficies runtime comparadas                      |      **7** |
| Familias canónicas reconciliadas                    |      **7** |
| Ocurrencias físicas materializadas                  |     **28** |
| Blobs físicos distintos dentro del alcance          |     **24** |
| Variantes semánticas materializadas                 |     **16** |
| Clientes browser primarios                          |      **7** |
| Clientes server                                     |      **7** |
| Middleware globales presentes                       |      **6** |
| Helpers proxy presentes                             |      **3** |
| Helpers proxy con consumidor externo confirmado     |      **0** |
| Clientes administrativos service-role               |      **1** |
| Normalizadores `employee-sites`                     |      **3** |
| Clientes browser alternos                           |      **1** |
| Clientes browser alternos con consumidor confirmado |      **0** |
| Superficies con decisión explícita                  | **7 de 7** |
| Hallazgos con destino exacto                        |     **27** |
| Cambios `TREQ-*`                                    |      **0** |

Resultado central:

```text
MISMA DEPENDENCIA SUPABASE DECLARADA
≠ MISMA FRONTERA DE SESIÓN

CLIENTE BROWSER
→ SINGLETON EN CINCO RUNTIMES
→ POR LLAMADA EN SHELL Y PULSO
→ DOMINIO EXPLÍCITO SOLO EN SHELL

CLIENTE SERVER
→ TRES POLÍTICAS DE DOMINIO
→ NEXO ES EL ÚNICO SENSIBLE AL HOST LOCAL

MIDDLEWARE
→ SEIS FRONTERAS ACTIVAS
→ CINCO CONTRATOS SEMÁNTICOS
→ PULSO SIN FRONTERA GLOBAL CONFIRMADA

PROXY
→ TRES HELPERS
→ NINGÚN CONSUMIDOR EXTERNO CONFIRMADO
→ NO CONSTITUYEN PROTECCIÓN ACTIVA
```

La paridad de clientes Supabase queda **NO DEMOSTRADA**. Existe un núcleo repetido de resolución de URL, clave y cookies, pero el ciclo de vida, la frontera de sesión, la semántica de fallo, el manejo de localhost y las extensiones de dominio no están gobernados por un contrato único ni por pruebas multi-repositorio.

---

#### 2. Fuentes y corte reproducible

| Fuente                                              | Uso                                                                                   |
| --------------------------------------------------- | ------------------------------------------------------------------------------------- |
| `docs/plan-canonico/modular/01_PROTOCOLO.md`        | continuidad, evidencia, alcance y forma de entrega                                    |
| `docs/plan-canonico/modular/delivery-contract.json` | contrato físico del artefacto                                                         |
| `docs/plan-canonico/modular/active-sequence.json`   | segmento activo y handoff posterior                                                   |
| `00_CABECERA_Y_ESTADO.md`                           | estado vigente de `SHELL-AUD-008`                                                     |
| `01_AUDITORIA_DE_COMPONENTES_COMPARTIDOS.md`        | archivo propietario, inventario y dependencias aprobadas                              |
| `SHELL-AUD-001`                                     | familias `FAM-014`, `FAM-015`, `FAM-016`, `FAM-017`, `FAM-024`, `FAM-025` y `FAM-026` |
| `SHELL-AUD-002`                                     | frontera de autenticación, middleware, proxy y rutas sin consumidor confirmado        |
| `SHELL-AUD-003` a `SHELL-AUD-007`                   | permisos, contexto, role override, AppShell y UI ya comparados                        |
| `02_DISTRIBUCION_Y_PAQUETES_COMPARTIDOS.md`         | destinos de distribución, compatibilidad y gates                                      |
| `03_CONTRATOS_COMPARTIDOS.md`                       | destinos de tipos y códigos de error                                                  |
| `03_AUTORIZACION_Y_CONTEXTO_COMPARTIDOS.md`         | SDK, adapters y migración multi-repositorio                                           |
| `package.json` de los siete runtimes                | versiones declaradas y scripts aplicables                                             |
| código de los siete repositorios runtime            | implementación y consumo actuales                                                     |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`  | cobertura `TREQ-*` vigente                                                            |

Commits runtime inspeccionados:

| Superficie | Repositorio                  | Commit                                     |
| ---------- | ---------------------------- | ------------------------------------------ |
| SHELL      | `devVentoGroup/vento-shell`  | `7e7338ecef1c6723a0269d15c33adceec44e744d` |
| VISO       | `devVentoGroup/vento-viso`   | `47322403f3c64e83ae0c4a2f68c05d47093e5bb4` |
| NEXO       | `devVentoGroup/vento-nexo`   | `142c4d696221e3ce3fda4ed3b62f3d1fe5b58799` |
| FOGO       | `devVentoGroup/vento-fogo`   | `b6b9ed00e5267cabaac1a5a1090d93d5f60e86f2` |
| ORIGO      | `devVentoGroup/vento-origo`  | `b7a8303fa078ef087f522b6c99059ababfc27472` |
| PULSO      | `devVentoGroup/vento-pulso`  | `71e0184486b5fe11e0a42435baf4024807a80efd` |
| NUMERA     | `devVentoGroup/vento-numera` | `1b48a5da425d92e19ed89cf175b1dccc4cd960e1` |

El commit de `vento-shell` contiene la cabecera que registra `SHELL-AUD-007` como última tarea aprobada y `SHELL-AUD-008` como tarea actual. No se usaron artefactos generados como fuente de decisión.

---

#### 3. Continuidad interpretada

La secuencia vigente conserva un solo segmento activo:

```text
SHELL-AUD-001
→ ...
→ SHELL-AUD-007 aprobada
→ SHELL-AUD-008 actual
→ SHELL-AUD-009 inmediata reservada
→ SHELL-AUD-010
→ SHELL-AUD-011
→ SHELL-PKG-001
```

`SHELL-PKG-001` es el handoff posterior al cierre completo de `SHELL-AUD-011`; no es la tarea inmediata. Esta tarea no modifica `active-sequence.json`.

---

#### 4. Alcance exacto

Se comparan:

1. las siete copias de `src/lib/supabase/client.ts`;
2. las siete copias de `src/lib/supabase/server.ts`;
3. los seis `middleware.ts` presentes;
4. los tres `src/lib/supabase/proxy.ts` presentes;
5. el único `src/lib/supabase/admin.ts`;
6. las tres copias de `src/lib/supabase/employee-sites.ts`;
7. el cliente alterno `src/utils/supabase/client.ts` de PULSO;
8. ciclo de vida, configuración, claves, cookies, errores, privilegios y consumo;
9. relación entre cliente, frontera de sesión y reglas locales de cada aplicación;
10. compatibilidad declarada de `@supabase/ssr`, `@supabase/supabase-js` y Next;
11. destino documental exacto de cada brecha.

Se excluyen:

| Materia                                                  | Tarea propietaria                                      |
| -------------------------------------------------------- | ------------------------------------------------------ |
| tipos públicos, generics y contratos definitivos         | `SHELL-AUD-009`; `SHELL-CON-007`; `SHELL-CON-008`      |
| decisión final compartir / generar / mantener local      | `SHELL-AUD-010`                                        |
| retiro de helpers o clientes sin consumidor confirmado   | `SHELL-AUD-011`                                        |
| mecanismo físico de distribución y versionado            | `SHELL-PKG-001` a `SHELL-PKG-008`                      |
| implementación de adapters server y client               | `SHELL-AUTH-002`                                       |
| gates contra consumidores legacy                         | `SHELL-AUTH-004`                                       |
| migración multi-repositorio                              | `SHELL-AUTH-005`                                       |
| cambios de esquema, RLS, RPC, funciones o datos Supabase | bloques propietarios de Supabase                       |
| validación remota, productiva o de dispositivo           | fase de implementación y certificación correspondiente |

Esta auditoría no elige todavía el paquete, la API pública ni el mecanismo de actualización.

---

#### 5. Taxonomía de comparación

| Estado                       | Criterio                                                                  |
| ---------------------------- | ------------------------------------------------------------------------- |
| `PARIDAD_BYTE`               | mismo blob Git                                                            |
| `PARIDAD_SEMANTICA`          | misma entrada, salida, ciclo de vida y efecto observable                  |
| `DERIVA_DE_FORMATO`          | BOM, fin de línea, comentarios, espaciado o formato sin cambio ejecutable |
| `DIVERGENCIA_DE_CICLO`       | singleton frente a nueva instancia por llamada                            |
| `DIVERGENCIA_DE_COOKIE`      | cambia dominio, propagación, borrado o tratamiento por host               |
| `DIVERGENCIA_DE_FALLO`       | cambia fail-open, redirección, limpieza o silenciamiento de error         |
| `EXTENSION_LOCAL_CONFIRMADA` | comportamiento propio de una aplicación con evidencia actual              |
| `MEZCLA_BASE_DOMINIO`        | una frontera compartida contiene reglas empresariales locales             |
| `SIN_CONSUMIDOR_CONFIRMADO`  | solo se localizó declaración; no una invocación externa                   |
| `FRONTERA_PRIVILEGIADA`      | usa service role o bypass de sesión de usuario                            |
| `PENDIENTE_DE_EVIDENCIA`     | la fuente actual no demuestra comportamiento operativo o remoto           |

Un hash distinto no implica automáticamente un contrato distinto. Un mismo helper tampoco se contabiliza como frontera activa si no existe un consumidor confirmado.

---

#### 6. Conciliación de familias canónicas

| ID canónico | Ruta o responsabilidad               | Ocurrencias | Blobs | Variantes semánticas | Clasificación                                    | Destino                                             |
| ----------- | ------------------------------------ | ----------: | ----: | -------------------: | ------------------------------------------------ | --------------------------------------------------- |
| `FAM-014`   | `src/lib/supabase/client.ts`         |       **7** | **5** |                **3** | `DUPLICADA_MIXTA_CON_DERIVA_DE_CICLO_Y_COOKIE`   | `SHELL-AUD-010`; `SHELL-AUTH-002`                   |
| `FAM-015`   | `src/lib/supabase/server.ts`         |       **7** | **6** |                **3** | `DUPLICADA_MIXTA_CON_DERIVA_DE_COOKIE`           | `SHELL-AUD-009`; `SHELL-AUD-010`; `SHELL-AUTH-002`  |
| `FAM-016`   | `middleware.ts`                      |       **6** | **6** |                **5** | `DISTRIBUCION_PARCIAL_DIVERGENTE`                | `SHELL-AUD-010`; `SHELL-AUTH-002`; `SHELL-AUTH-005` |
| `FAM-017`   | `src/lib/supabase/proxy.ts`          |       **3** | **3** |                **2** | `DISTRIBUCION_PARCIAL_SIN_CONSUMIDOR_CONFIRMADO` | `SHELL-AUD-010`; `SHELL-AUD-011`                    |
| `FAM-024`   | `src/lib/supabase/admin.ts`          |       **1** | **1** |                **1** | `UNICA_PRIVILEGIADA_CONSUMIDA`                   | `SHELL-AUD-009`; `SHELL-AUD-010`; `SHELL-AUTH-002`  |
| `FAM-025`   | `src/lib/supabase/employee-sites.ts` |       **3** | **2** |                **1** | `PARIDAD_SEMANTICA_CON_DERIVA_DE_FORMATO`        | `SHELL-AUD-009`; `SHELL-AUD-010`                    |
| `FAM-026`   | `src/utils/supabase/client.ts`       |       **1** | **1** |                **1** | `UNICA_SIN_CONSUMIDOR_CONFIRMADO`                | `SHELL-AUD-010`; `SHELL-AUD-011`                    |

**Conciliación:** 7 familias esperadas, 7 materializadas, 28 ocurrencias, 24 blobs, 16 variantes semánticas, 0 familias omitidas y 0 identificadores duplicados.

---

#### 7. Dependencias y compatibilidad declarada

| Superficie | `@supabase/ssr` | `@supabase/supabase-js` | Next declarado |
| ---------- | --------------- | ----------------------- | -------------- |
| SHELL      | `^0.8.0`        | `^2.90.1`               | `16.1.1`       |
| VISO       | `^0.8.0`        | `^2.90.1`               | `^16.1.6`      |
| NEXO       | `^0.8.0`        | `^2.90.1`               | `^16.2.3`      |
| FOGO       | `^0.8.0`        | `^2.90.1`               | `^16.2.4`      |
| ORIGO      | `^0.8.0`        | `^2.90.1`               | `^16.2.1`      |
| PULSO      | `^0.8.0`        | `^2.90.1`               | `16.1.1`       |
| NUMERA     | `^0.8.0`        | `^2.90.1`               | `^16.2.1`      |

Conclusiones permitidas:

- las restricciones declaradas de Supabase son iguales en las siete superficies;
- la deriva observada proviene del código local, no de restricciones Supabase diferentes en `package.json`;
- existen cinco bandas declaradas de Next;
- esta tarea no resolvió lockfiles, despliegues ni comportamiento remoto y no declara paridad operativa multi-versión.

---

#### 8. Clientes browser primarios

##### 8.1. Contrato común

Los siete clientes primarios:

- usan `createBrowserClient` de `@supabase/ssr`;
- resuelven URL en el orden `NEXT_PUBLIC_SUPABASE_URL` y luego `SUPABASE_URL`;
- resuelven clave en el orden `NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY`, `NEXT_PUBLIC_SUPABASE_ANON_KEY` y `SUPABASE_ANON_KEY`;
- fallan explícitamente cuando falta URL o clave;
- no están parametrizados por un tipo compartido `Database`.

La presencia de fallbacks server-only dentro de código browser no demuestra que esas variables estén disponibles en el bundle. Esa disponibilidad queda como evidencia pendiente, no como defecto confirmado.

##### 8.2. Matriz semántica

| Superficie | Ciclo de vida      | Fallbacks comunes | Dominio de cookie browser    | Variante                        |
| ---------- | ------------------ | ----------------- | ---------------------------- | ------------------------------- |
| SHELL      | `POR_LLAMADA`      | sí                | sí, mediante `cookieOptions` | `BROWSER-SHELL-DOMAIN-PER_CALL` |
| VISO       | `SINGLETON_MODULO` | sí                | no                           | `BROWSER-SINGLETON-BASE`        |
| NEXO       | `SINGLETON_MODULO` | sí                | no                           | `BROWSER-SINGLETON-BASE`        |
| FOGO       | `SINGLETON_MODULO` | sí                | no                           | `BROWSER-SINGLETON-BASE`        |
| ORIGO      | `SINGLETON_MODULO` | sí                | no                           | `BROWSER-SINGLETON-BASE`        |
| PULSO      | `POR_LLAMADA`      | sí                | no                           | `BROWSER-PULSO-PER_CALL`        |
| NUMERA     | `SINGLETON_MODULO` | sí                | no                           | `BROWSER-SINGLETON-BASE`        |

La familia singleton conserva una sola instancia por módulo. SHELL y PULSO crean instancias nuevas por llamada, pero solo SHELL configura explícitamente dominio de cookie desde el cliente browser.

##### 8.3. Cliente alterno de PULSO

`src/utils/supabase/client.ts`:

- usa únicamente `NEXT_PUBLIC_SUPABASE_URL` y `NEXT_PUBLIC_SUPABASE_ANON_KEY`;
- valida que la URL comience por `http`;
- crea una instancia nueva por llamada;
- no aplica dominio de cookie;
- contiene BOM;
- no tuvo consumidor externo confirmado en la búsqueda actual.

No se autoriza retirarlo aquí. Su disposición pertenece a `SHELL-AUD-011`.

---

#### 9. Clientes server

##### 9.1. Contrato común

Los siete clientes server:

- usan `createServerClient`;
- leen `cookies()` de Next;
- conservan la misma precedencia de URL y clave que los clientes browser primarios;
- exponen `getAll` y `setAll`;
- silencian la excepción producida cuando un Server Component no puede escribir cookies;
- no exponen razón estructurada ni telemetría cuando esa escritura falla;
- no están parametrizados por un tipo compartido `Database`.

##### 9.2. Matriz de política de cookies

| Superficie | Mecanismo de dominio               | Sensibilidad al host                    | Variante                      |
| ---------- | ---------------------------------- | --------------------------------------- | ----------------------------- |
| SHELL      | `cookieOptions` global del cliente | no depende del host de la solicitud     | `SERVER-SHELL-COOKIE_OPTIONS` |
| VISO       | mezcla dominio en cada `set`       | dominio configurado estático            | `SERVER-STATIC-DOMAIN`        |
| NEXO       | mezcla dominio en cada `set`       | suprime dominio cuando el host es local | `SERVER-NEXO-HOST_AWARE`      |
| FOGO       | mezcla dominio en cada `set`       | dominio configurado estático            | `SERVER-STATIC-DOMAIN`        |
| ORIGO      | mezcla dominio en cada `set`       | dominio configurado estático            | `SERVER-STATIC-DOMAIN`        |
| PULSO      | mezcla dominio en cada `set`       | dominio configurado estático            | `SERVER-STATIC-DOMAIN`        |
| NUMERA     | mezcla dominio en cada `set`       | dominio configurado estático            | `SERVER-STATIC-DOMAIN`        |

La diferencia de NEXO es sustantiva: inspecciona `x-forwarded-host` o `host` y elimina el dominio configurado cuando la solicitud es local. SHELL usa un mecanismo distinto, mediante `cookieOptions` del cliente. Los otros cinco runtimes aplican un dominio estático en cada escritura.

---

#### 10. Middleware y frontera activa de sesión

| Superficie | Destino sin sesión         | Matcher o exclusiones                        | Extensión local                                                      | Variante                         |
| ---------- | -------------------------- | -------------------------------------------- | -------------------------------------------------------------------- | -------------------------------- |
| SHELL      | login central configurable | `_next`, `login`, estáticos, `api`           | headers de diagnóstico; dominio configurable                         | `MW-SHELL-CENTRAL`               |
| VISO       | `/login` local             | `_next`, `login`, estáticos, `api`           | flujo local base                                                     | `MW-VISO-LOCAL_BASE`             |
| NEXO       | `/login` local             | agrega `manifest.webmanifest`; excluye `api` | no-store; localhost-aware; lógica de kiosco y consulta de inventario | `MW-NEXO-KIOSK`                  |
| FOGO       | `/login` local             | agrega `no-access`; excluye `api`            | flujo local base                                                     | `MW-FOGO_NUMERA-LOCAL_NO_ACCESS` |
| ORIGO      | `/login` local             | agrega `no-access`; excluye `api`            | excepción pública de PDF de orden de compra                          | `MW-ORIGO-PDF_EXCEPTION`         |
| PULSO      | `NO_APLICA`                | `NO_APLICA`                                  | no existe `middleware.ts` raíz                                       | `SIN_FRONTERA_GLOBAL_CONFIRMADA` |
| NUMERA     | `/login` local             | agrega `no-access`; excluye `api`            | flujo local base                                                     | `MW-FOGO_NUMERA-LOCAL_NO_ACCESS` |

Invariantes de los seis middleware presentes:

1. detectan cookies Supabase por prefijo `sb-`;
2. construyen un `createServerClient` por solicitud;
3. ejecutan `auth.getUser()`;
4. limpian cookies Supabase ante error de autenticación o usuario ausente;
5. redirigen cuando falta configuración;
6. excluyen `/api` de su matcher global.

La exclusión de `/api` significa que la protección de route handlers no queda demostrada por middleware y debe depender de guards en destino y gates de migración.

NEXO no es una variante base pura: incorpora no-store, resolución de dominio por host, identidad fija de kiosco, consulta a `inventory_locations` y redirecciones de negocio. ORIGO conserva una excepción pública de PDF cuya validación se delega al route handler. Ambas diferencias deben permanecer explícitas durante cualquier convergencia.

---

#### 11. Helpers proxy

| Superficie | Blob                                       | Semántica de fallo                                                                         | Dominio                                                       | Variante                 |
| ---------- | ------------------------------------------ | ------------------------------------------------------------------------------------------ | ------------------------------------------------------------- | ------------------------ |
| VISO       | `d02cbb7582f711f5d8e8ac535885faa548bf995e` | continúa sin configuración, sin cookies o ante error distinto de `refresh_token_not_found` | estático                                                      | `PROXY-BASE-UNCONSUMED`  |
| NEXO       | `924419c77afff452ed3b13385fbf1c6016e4a34a` | mismo flujo ejecutable de VISO                                                             | estático; no replica la excepción local del server/middleware | `PROXY-BASE-UNCONSUMED`  |
| PULSO      | `759477c537f3dc3e247d427418027affce07b707` | agrega extracción defensiva del código de error                                            | estático                                                      | `PROXY-PULSO-UNCONSUMED` |

La búsqueda de `updateSession(` localizó la declaración en cada helper, pero no una invocación externa. Por tanto:

```text
proxy.ts PRESENTE
≠ proxy.ts ACTIVO
≠ middleware GLOBAL
```

Los helpers son fail-open cuando faltan variables, faltan cookies o ocurre un error distinto de `refresh_token_not_found`. En ese código específico limpian cookies solo para ese código. Esta semántica difiere del middleware activo, que redirige y limpia ante error o ausencia de usuario.

NEXO tiene además una inconsistencia interna: su cliente server y middleware activos son sensibles al host local, mientras su proxy sin consumidor usa el dominio estático.

---

#### 12. Cliente administrativo privilegiado

VISO contiene el único `src/lib/supabase/admin.ts` del alcance:

- declara `server-only`;
- usa `createClient` de `@supabase/supabase-js`;
- requiere `SUPABASE_SERVICE_ROLE_KEY`;
- desactiva `autoRefreshToken` y `persistSession`;
- tiene consumidores confirmados en vacantes, usuarios, horarios y otras superficies administrativas;
- no está tipado mediante un contrato compartido `Database`.

Se clasifica como `FRONTERA_PRIVILEGIADA_LOCAL_CONSUMIDA`. No debe incorporarse sin distinción a un cliente de sesión de usuario. Su adapter, propiedad y migración corresponden a `SHELL-AUTH-002`, `SHELL-AUTH-005` y la decisión de `SHELL-AUD-010`.

---

#### 13. Normalizador `employee-sites`

FOGO y ORIGO son byte-idénticos. NUMERA cambia comentarios y formato, pero conserva la misma API ejecutable:

```ts
normalizeSitesFromEmployeeSites(rows) => SiteOption[]
```

El helper acepta que la relación `sites` llegue como objeto, arreglo o `null`, toma el primer elemento cuando es arreglo y elimina resultados nulos. Se clasifica como una sola variante semántica. La decisión sobre su contrato tipado pertenece a `SHELL-AUD-009`; su disposición física pertenece a `SHELL-AUD-010`.

---

#### 14. Matriz completa de ocurrencias

| ID             | Familia   | Superficie | Ruta                                 | Blob SHA                                   | Variante semántica               | Evidencia de uso               | Decisión de esta tarea                                 |
| -------------- | --------- | ---------- | ------------------------------------ | ------------------------------------------ | -------------------------------- | ------------------------------ | ------------------------------------------------------ |
| `SUPA-CLI-001` | `FAM-014` | SHELL      | `src/lib/supabase/client.ts`         | `1bc24c115914ffae21ddfcaecf1876d8fb8b6f14` | `BROWSER-SHELL-DOMAIN-PER_CALL`  | `IMPORTACIONES_CONFIRMADAS`    | conservar como variante hasta decisión de arquitectura |
| `SUPA-CLI-002` | `FAM-014` | VISO       | `src/lib/supabase/client.ts`         | `dfed99c57cf1772c561b1f979cb948e564ad973a` | `BROWSER-SINGLETON-BASE`         | `IMPORTACIONES_CONFIRMADAS`    | paridad semántica con grupo singleton                  |
| `SUPA-CLI-003` | `FAM-014` | NEXO       | `src/lib/supabase/client.ts`         | `eae6ae4a4ee970ab760ed771b0dc4a5d79ca7b22` | `BROWSER-SINGLETON-BASE`         | `IMPORTACIONES_CONFIRMADAS`    | paridad byte con FOGO y ORIGO                          |
| `SUPA-CLI-004` | `FAM-014` | FOGO       | `src/lib/supabase/client.ts`         | `eae6ae4a4ee970ab760ed771b0dc4a5d79ca7b22` | `BROWSER-SINGLETON-BASE`         | `IMPORTACIONES_CONFIRMADAS`    | paridad byte con NEXO y ORIGO                          |
| `SUPA-CLI-005` | `FAM-014` | ORIGO      | `src/lib/supabase/client.ts`         | `eae6ae4a4ee970ab760ed771b0dc4a5d79ca7b22` | `BROWSER-SINGLETON-BASE`         | `IMPORTACIONES_CONFIRMADAS`    | paridad byte con NEXO y FOGO                           |
| `SUPA-CLI-006` | `FAM-014` | PULSO      | `src/lib/supabase/client.ts`         | `1306e2e4ef77265722d983f28e123bbac320d9f5` | `BROWSER-PULSO-PER_CALL`         | `IMPORTACIONES_CONFIRMADAS`    | cliente browser principal de PULSO                     |
| `SUPA-CLI-007` | `FAM-014` | NUMERA     | `src/lib/supabase/client.ts`         | `23215c75eea9b51fa5b8e920a84d3ed20bda48ba` | `BROWSER-SINGLETON-BASE`         | `IMPORTACIONES_CONFIRMADAS`    | misma API ejecutable; deriva física de formato         |
| `SUPA-CLI-008` | `FAM-015` | SHELL      | `src/lib/supabase/server.ts`         | `cffa5fd4faf351a44a382cfc4319617ec953341a` | `SERVER-SHELL-COOKIE_OPTIONS`    | `IMPORTACIONES_CONFIRMADAS`    | política global de cookie distinta                     |
| `SUPA-CLI-009` | `FAM-015` | VISO       | `src/lib/supabase/server.ts`         | `f01589daefdd141a496d0d81a34ecdd7bf1e09fa` | `SERVER-STATIC-DOMAIN`           | `IMPORTACIONES_CONFIRMADAS`    | dominio estático por cookie                            |
| `SUPA-CLI-010` | `FAM-015` | NEXO       | `src/lib/supabase/server.ts`         | `87d3638e1ce1d9751800def61f14dd7945d601a2` | `SERVER-NEXO-HOST_AWARE`         | `IMPORTACIONES_CONFIRMADAS`    | única variante sensible al host local                  |
| `SUPA-CLI-011` | `FAM-015` | FOGO       | `src/lib/supabase/server.ts`         | `a5da4960b0d50c5436ffdf9ff1e7f199f4d98bdb` | `SERVER-STATIC-DOMAIN`           | `IMPORTACIONES_CONFIRMADAS`    | paridad byte con ORIGO                                 |
| `SUPA-CLI-012` | `FAM-015` | ORIGO      | `src/lib/supabase/server.ts`         | `a5da4960b0d50c5436ffdf9ff1e7f199f4d98bdb` | `SERVER-STATIC-DOMAIN`           | `IMPORTACIONES_CONFIRMADAS`    | paridad byte con FOGO                                  |
| `SUPA-CLI-013` | `FAM-015` | PULSO      | `src/lib/supabase/server.ts`         | `05743f75577d79c4ebe3bd5b81c944627e00fc35` | `SERVER-STATIC-DOMAIN`           | `IMPORTACIONES_CONFIRMADAS`    | misma semántica de dominio estático                    |
| `SUPA-CLI-014` | `FAM-015` | NUMERA     | `src/lib/supabase/server.ts`         | `46d1ad65d091e9a204bee938e37193178dc80c5d` | `SERVER-STATIC-DOMAIN`           | `IMPORTACIONES_CONFIRMADAS`    | misma semántica; deriva física de formato              |
| `SUPA-CLI-015` | `FAM-016` | SHELL      | `middleware.ts`                      | `862d185fd1bbc8101ed87db5e286d6b0b0dde659` | `MW-SHELL-CENTRAL`               | `EJECUCION_POR_FRAMEWORK`      | frontera global central                                |
| `SUPA-CLI-016` | `FAM-016` | VISO       | `middleware.ts`                      | `3099628a445dca9c401b87441b3c05c24894161d` | `MW-VISO-LOCAL_BASE`             | `EJECUCION_POR_FRAMEWORK`      | frontera global local base                             |
| `SUPA-CLI-017` | `FAM-016` | NEXO       | `middleware.ts`                      | `3db2c7e31dcada218a8e8cd1efc41db8c899b1d7` | `MW-NEXO-KIOSK`                  | `EJECUCION_POR_FRAMEWORK`      | mezcla autenticación y política de kiosco              |
| `SUPA-CLI-018` | `FAM-016` | FOGO       | `middleware.ts`                      | `596e62e2716a32e3acea3e79c79b60c7762271f2` | `MW-FOGO_NUMERA-LOCAL_NO_ACCESS` | `EJECUCION_POR_FRAMEWORK`      | frontera local con exclusión `no-access`               |
| `SUPA-CLI-019` | `FAM-016` | ORIGO      | `middleware.ts`                      | `0420a23343af1ab60055f090891823f6860afc00` | `MW-ORIGO-PDF_EXCEPTION`         | `EJECUCION_POR_FRAMEWORK`      | excepción pública explícita de PDF                     |
| `SUPA-CLI-020` | `FAM-016` | NUMERA     | `middleware.ts`                      | `499444d0e05d0beb0824b0e6a964fa1d199cdbb7` | `MW-FOGO_NUMERA-LOCAL_NO_ACCESS` | `EJECUCION_POR_FRAMEWORK`      | misma semántica que FOGO; formato distinto             |
| `SUPA-CLI-021` | `FAM-017` | VISO       | `src/lib/supabase/proxy.ts`          | `d02cbb7582f711f5d8e8ac535885faa548bf995e` | `PROXY-BASE-UNCONSUMED`          | `SOLO_DECLARACION_LOCALIZADA`  | no contabilizar como frontera activa                   |
| `SUPA-CLI-022` | `FAM-017` | NEXO       | `src/lib/supabase/proxy.ts`          | `924419c77afff452ed3b13385fbf1c6016e4a34a` | `PROXY-BASE-UNCONSUMED`          | `SOLO_DECLARACION_LOCALIZADA`  | no replica política host-aware                         |
| `SUPA-CLI-023` | `FAM-017` | PULSO      | `src/lib/supabase/proxy.ts`          | `759477c537f3dc3e247d427418027affce07b707` | `PROXY-PULSO-UNCONSUMED`         | `SOLO_DECLARACION_LOCALIZADA`  | no suple la ausencia de middleware                     |
| `SUPA-CLI-024` | `FAM-024` | VISO       | `src/lib/supabase/admin.ts`          | `0c46abd8a9e9a1e17fa3077cf83a883085484850` | `ADMIN-VISO-SERVICE_ROLE`        | `IMPORTACIONES_CONFIRMADAS`    | frontera privilegiada local y server-only              |
| `SUPA-CLI-025` | `FAM-025` | FOGO       | `src/lib/supabase/employee-sites.ts` | `d192e36a34afc313dc403348a36f17fefafb33f3` | `EMPLOYEE-SITES-NORMALIZER`      | `PRESENCIA_RUNTIME_CONFIRMADA` | paridad byte con ORIGO                                 |
| `SUPA-CLI-026` | `FAM-025` | ORIGO      | `src/lib/supabase/employee-sites.ts` | `d192e36a34afc313dc403348a36f17fefafb33f3` | `EMPLOYEE-SITES-NORMALIZER`      | `IMPORTACIONES_CONFIRMADAS`    | paridad byte con FOGO                                  |
| `SUPA-CLI-027` | `FAM-025` | NUMERA     | `src/lib/supabase/employee-sites.ts` | `fd925fa50a6400736100067de4114d1f2c6dc62e` | `EMPLOYEE-SITES-NORMALIZER`      | `PRESENCIA_RUNTIME_CONFIRMADA` | misma API ejecutable; comentarios/formato distintos    |
| `SUPA-CLI-028` | `FAM-026` | PULSO      | `src/utils/supabase/client.ts`       | `34f32531942ea177f5a8f6bb1990ebc303855626` | `BROWSER-PULSO-ALT-UNCONSUMED`   | `SOLO_DECLARACION_LOCALIZADA`  | cliente paralelo sin consumidor confirmado             |

**Conciliación de ocurrencias:** 28 esperadas, 28 materializadas, 28 identificadores únicos, 0 faltantes y 0 duplicados.

---

#### 15. Catálogo de variantes semánticas

| Variante                         | Familia      | Superficies                      | Contrato distintivo                                                         | Destino                                            |
| -------------------------------- | ------------ | -------------------------------- | --------------------------------------------------------------------------- | -------------------------------------------------- |
| `BROWSER-SHELL-DOMAIN-PER_CALL`  | browser      | SHELL                            | nuevo cliente por llamada; `cookieOptions.domain` configurable              | `SHELL-AUD-010`; `SHELL-AUTH-002`                  |
| `BROWSER-SINGLETON-BASE`         | browser      | VISO, NEXO, FOGO, ORIGO, NUMERA  | singleton de módulo; sin `cookieOptions` explícito                          | `SHELL-AUD-010`; `SHELL-AUTH-002`                  |
| `BROWSER-PULSO-PER_CALL`         | browser      | PULSO                            | nuevo cliente por llamada; sin dominio explícito                            | `SHELL-AUD-010`; `SHELL-AUTH-002`                  |
| `BROWSER-PULSO-ALT-UNCONSUMED`   | browser      | PULSO                            | variables públicas estrictas; valida URL; sin consumidor confirmado         | `SHELL-AUD-011`                                    |
| `SERVER-SHELL-COOKIE_OPTIONS`    | server       | SHELL                            | dominio mediante opciones globales del cliente                              | `SHELL-AUD-009`; `SHELL-AUD-010`; `SHELL-AUTH-002` |
| `SERVER-NEXO-HOST_AWARE`         | server       | NEXO                             | dominio por cookie y supresión en host local                                | `SHELL-AUD-009`; `SHELL-AUD-010`; `SHELL-AUTH-002` |
| `SERVER-STATIC-DOMAIN`           | server       | VISO, FOGO, ORIGO, PULSO, NUMERA | dominio configurado estático aplicado en `setAll`                           | `SHELL-AUD-010`; `SHELL-AUTH-002`                  |
| `MW-SHELL-CENTRAL`               | middleware   | SHELL                            | login central configurable y headers de diagnóstico                         | `SHELL-AUD-010`; `SHELL-AUTH-002`                  |
| `MW-VISO-LOCAL_BASE`             | middleware   | VISO                             | login local y autenticación global base                                     | `SHELL-AUD-010`; `SHELL-AUTH-005`                  |
| `MW-NEXO-KIOSK`                  | middleware   | NEXO                             | auth, no-store, política local de cookie y routing de kiosco                | `SHELL-AUD-009`; `SHELL-AUD-010`                   |
| `MW-FOGO_NUMERA-LOCAL_NO_ACCESS` | middleware   | FOGO, NUMERA                     | login local con exclusión `no-access`                                       | `SHELL-AUD-010`; `SHELL-AUTH-005`                  |
| `MW-ORIGO-PDF_EXCEPTION`         | middleware   | ORIGO                            | login local y excepción pública de PDF                                      | `SHELL-AUD-010`; `SHELL-AUTH-005`                  |
| `PROXY-BASE-UNCONSUMED`          | proxy        | VISO, NEXO                       | renovación fail-open; solo limpia `refresh_token_not_found`; sin invocación | `SHELL-AUD-011`                                    |
| `PROXY-PULSO-UNCONSUMED`         | proxy        | PULSO                            | misma base con extracción defensiva de código; sin invocación               | `SHELL-AUD-011`                                    |
| `ADMIN-VISO-SERVICE_ROLE`        | admin        | VISO                             | cliente server-only con service role y sesión no persistente                | `SHELL-AUD-009`; `SHELL-AUD-010`; `SHELL-AUTH-002` |
| `EMPLOYEE-SITES-NORMALIZER`      | normalizador | FOGO, ORIGO, NUMERA              | normaliza relación objeto/arreglo a `SiteOption[]`                          | `SHELL-AUD-009`; `SHELL-AUD-010`                   |

**Conciliación semántica:** 16 variantes esperadas, 16 materializadas y 0 códigos duplicados.

---

#### 16. Decisión por superficie runtime

| Superficie | Browser                       | Server               | Frontera activa            | Extensiones o helpers                              | Clasificación                            | Decisión                                                      |
| ---------- | ----------------------------- | -------------------- | -------------------------- | -------------------------------------------------- | ---------------------------------------- | ------------------------------------------------------------- |
| SHELL      | por llamada + dominio browser | cookieOptions global | central                    | sin cliente admin local                            | `DIVERGENTE_CONTROLADA`                  | preservar evidencia; decidir adapter común en `SHELL-AUD-010` |
| VISO       | singleton                     | dominio estático     | local base                 | admin service-role consumido; proxy sin consumidor | `DIVERGENTE_PRIVILEGIADA`                | separar adapter común de frontera admin local                 |
| NEXO       | singleton                     | host-aware           | local con kiosco           | proxy estático sin consumidor                      | `DIVERGENTE_POR_HOST_Y_DOMINIO`          | no mezclar auth compartida con política de kiosco             |
| FOGO       | singleton                     | dominio estático     | local base con `no-access` | normalizador employee-sites                        | `BASE_REUTILIZABLE`                      | candidato a adapter común con extensión local explícita       |
| ORIGO      | singleton                     | dominio estático     | local con PDF público      | normalizador employee-sites                        | `BASE_MAS_EXCEPCION_LOCAL`               | mantener excepción como política declarada, no fork implícito |
| PULSO      | por llamada                   | dominio estático     | sin middleware global      | proxy y cliente alterno sin consumidor confirmado  | `BRECHA_DE_FRONTERA`                     | no asumir protección global; resolver migración y retiro      |
| NUMERA     | singleton                     | dominio estático     | local base con `no-access` | normalizador employee-sites                        | `PARIDAD_SEMANTICA_CON_FORMATO_DISTINTO` | converger sin perder política local documentada               |

**Conciliación:** 7 superficies esperadas, 7 decisiones materializadas, 0 superficies omitidas.

---

#### 17. Reglas de convergencia derivadas

Cualquier diseño posterior deberá conservar simultáneamente estas reglas:

1. distinguir cliente browser, cliente server y cliente administrativo privilegiado;
2. definir explícitamente si el cliente browser es singleton o por llamada;
3. definir una sola precedencia de URL y clave por entorno;
4. no depender de variables server-only dentro del browser sin prueba de disponibilidad;
5. formalizar dominio, path, borrado y excepción de localhost para cookies Supabase;
6. no silenciar fallos de escritura sin una salida observable o razón estructurada;
7. separar renovación de sesión de reglas empresariales de kiosco, inventario o documentos públicos;
8. preservar extensiones locales mediante configuración o adapters, no mediante forks opacos;
9. no contabilizar un helper sin invocación como protección activa;
10. proteger route handlers excluidos del middleware mediante guards verificables;
11. mantener service role fuera del browser y de clientes de sesión de usuario;
12. tipar clientes y helpers contra contratos compartidos antes de migrar consumidores;
13. comprobar compatibilidad en las bandas de Next realmente soportadas;
14. aplicar gates antes de retirar clientes o rutas legacy.

Estas reglas no deciden el mecanismo físico de distribución.

---

#### 18. Registro de hallazgos y destinos

| ID                | Hallazgo                                                                                                                 | Estado                            | Tarea responsable                                   |
| ----------------- | ------------------------------------------------------------------------------------------------------------------------ | --------------------------------- | --------------------------------------------------- |
| `H-SHELL-008-001` | siete clientes browser primarios producen cinco blobs y tres contratos semánticos                                        | `CONFIRMADO`                      | `SHELL-AUD-010`; `SHELL-PKG-001`                    |
| `H-SHELL-008-002` | VISO, NEXO, FOGO, ORIGO y NUMERA comparten el patrón singleton                                                           | `CONFIRMADO`                      | `SHELL-AUD-010`; `SHELL-AUTH-002`                   |
| `H-SHELL-008-003` | SHELL crea cliente browser por llamada y aplica dominio de cookie explícito                                              | `CONFIRMADO`                      | `SHELL-AUD-010`; `SHELL-AUTH-002`                   |
| `H-SHELL-008-004` | PULSO crea el cliente browser principal por llamada sin dominio explícito                                                | `CONFIRMADO`                      | `SHELL-AUD-010`; `SHELL-AUTH-002`                   |
| `H-SHELL-008-005` | PULSO conserva un segundo cliente browser sin consumidor confirmado                                                      | `SIN_CONSUMIDOR_CONFIRMADO`       | `SHELL-AUD-011`                                     |
| `H-SHELL-008-006` | los clientes primarios comparten la misma precedencia de URL y clave                                                     | `CONFIRMADO`                      | `SHELL-AUD-009`; `SHELL-AUD-010`                    |
| `H-SHELL-008-007` | el fallback browser a variables no públicas existe en código, pero su disponibilidad efectiva en bundles no fue validada | `PENDIENTE_DE_EVIDENCIA`          | `SHELL-AUD-009`; `SHELL-AUTH-002`                   |
| `H-SHELL-008-008` | siete clientes server producen seis blobs y tres contratos semánticos                                                    | `CONFIRMADO`                      | `SHELL-AUD-010`; `SHELL-PKG-001`                    |
| `H-SHELL-008-009` | cinco runtimes aplican dominio estático dentro de `setAll`                                                               | `CONFIRMADO`                      | `SHELL-AUD-010`; `SHELL-AUTH-002`                   |
| `H-SHELL-008-010` | NEXO es el único cliente server que elimina dominio en hosts locales                                                     | `EXTENSION_LOCAL_CONFIRMADA`      | `SHELL-AUD-009`; `SHELL-AUD-010`; `SHELL-AUTH-002`  |
| `H-SHELL-008-011` | SHELL delega el dominio a `cookieOptions` global del cliente                                                             | `CONFIRMADO`                      | `SHELL-AUD-009`; `SHELL-AUD-010`; `SHELL-AUTH-002`  |
| `H-SHELL-008-012` | los siete clientes server silencian errores de escritura de cookies en Server Components                                 | `CONFIRMADO`                      | `SHELL-AUD-009`; `SHELL-CON-008`; `SHELL-AUTH-002`  |
| `H-SHELL-008-013` | seis repositorios tienen middleware global y PULSO no                                                                    | `CONFIRMADO`                      | `SHELL-AUD-010`; `SHELL-AUTH-001`; `SHELL-AUTH-005` |
| `H-SHELL-008-014` | los seis middleware físicos representan cinco contratos semánticos                                                       | `CONFIRMADO`                      | `SHELL-AUD-010`; `SHELL-AUTH-002`; `SHELL-AUTH-005` |
| `H-SHELL-008-015` | NEXO mezcla renovación de sesión con routing y consulta de dominio de kiosco                                             | `MEZCLA_BASE_DOMINIO_CONFIRMADA`  | `SHELL-AUD-009`; `SHELL-AUD-010`                    |
| `H-SHELL-008-016` | ORIGO conserva una excepción pública explícita para PDF con protección delegada al destino                               | `EXTENSION_LOCAL_CONFIRMADA`      | `SHELL-AUD-010`; `SHELL-AUTH-005`                   |
| `H-SHELL-008-017` | todos los middleware presentes excluyen `/api` del matcher global                                                        | `CONFIRMADO`                      | `SHELL-AUTH-004`; `SHELL-AUTH-005`                  |
| `H-SHELL-008-018` | los tres helpers proxy representan dos contratos y carecen de invocación externa confirmada                              | `SIN_CONSUMIDOR_CONFIRMADO`       | `SHELL-AUD-011`                                     |
| `H-SHELL-008-019` | proxy permite continuar ante varios fallos mientras middleware redirige y limpia cookies                                 | `DIVERGENCIA_DE_FALLO_CONFIRMADA` | `SHELL-AUD-010`; `SHELL-AUTH-002`                   |
| `H-SHELL-008-020` | el proxy de NEXO usa dominio estático y no replica su política host-aware activa                                         | `INCONSISTENCIA_LOCAL_CONFIRMADA` | `SHELL-AUD-010`; `SHELL-AUTH-002`                   |
| `H-SHELL-008-021` | el proxy sin consumidor de PULSO no compensa la ausencia de middleware global                                            | `CONFIRMADO`                      | `SHELL-AUD-010`; `SHELL-AUD-011`; `SHELL-AUTH-005`  |
| `H-SHELL-008-022` | VISO posee el único cliente service-role encapsulado como server-only y tiene consumidores confirmados                   | `CONFIRMADO`                      | `SHELL-AUD-010`; `SHELL-AUTH-002`; `SHELL-AUTH-005` |
| `H-SHELL-008-023` | el cliente admin no está parametrizado por un contrato compartido de base de datos                                       | `CONFIRMADO`                      | `SHELL-AUD-009`; `SHELL-CON-007`; `SHELL-AUTH-002`  |
| `H-SHELL-008-024` | los tres helpers employee-sites implementan un solo contrato ejecutable                                                  | `PARIDAD_SEMANTICA_CONFIRMADA`    | `SHELL-AUD-009`; `SHELL-AUD-010`                    |
| `H-SHELL-008-025` | ninguna fábrica auditada declara un genérico compartido `Database`                                                       | `CONFIRMADO`                      | `SHELL-AUD-009`; `SHELL-CON-007`; `SHELL-AUTH-002`  |
| `H-SHELL-008-026` | los siete runtimes declaran las mismas restricciones de versión Supabase                                                 | `CONFIRMADO`                      | `SHELL-PKG-004`                                     |
| `H-SHELL-008-027` | los runtimes declaran cinco bandas de Next y no existe evidencia operativa multi-versión en esta tarea                   | `PENDIENTE_DE_EVIDENCIA`          | `SHELL-PKG-004`; `SHELL-PKG-008`; `SHELL-AUTH-005`  |

Ningún hallazgo queda asignado a una fase genérica. Cada brecha tiene un propietario documental o de implementación existente.

---

#### 19. Handoffs obligatorios

| Materia                                                  | Destino                                           | Condición de salida                                                  |
| -------------------------------------------------------- | ------------------------------------------------- | -------------------------------------------------------------------- |
| tipos `Database`, errores, opciones y contratos públicos | `SHELL-AUD-009`; `SHELL-CON-007`; `SHELL-CON-008` | contrato materializado por identidad y sin tipos locales ambiguos    |
| clasificación compartir / generar / mantener local       | `SHELL-AUD-010`                                   | decisión explícita para las 7 familias y 16 variantes                |
| retiro de proxy y cliente alterno sin consumidor         | `SHELL-AUD-011`                                   | búsqueda de consumidores, pruebas, rollback y eliminación controlada |
| mecanismo de distribución                                | `SHELL-PKG-001`                                   | forma de entrega elegida después de cerrar el segmento de auditoría  |
| compatibilidad por versiones                             | `SHELL-PKG-004`; `SHELL-PKG-008`                  | matriz de versiones soportadas y gates ejecutables                   |
| adapters canónicos server/client/admin                   | `SHELL-AUTH-002`                                  | implementación sobre contratos y política de cookie aprobados        |
| bloqueo de nuevos consumidores legacy                    | `SHELL-AUTH-004`                                  | lint, métricas y gates activos                                       |
| migración multi-repositorio                              | `SHELL-AUTH-005`                                  | consumidores migrados con paridad y rollback                         |

---

#### 20. Criterios de aceptación materializados

| Criterio                                  | Resultado    | Estado     |
| ----------------------------------------- | ------------ | ---------- |
| familias canónicas del alcance            | **7 de 7**   | `CUMPLIDO` |
| ocurrencias físicas esperadas             | **28 de 28** | `CUMPLIDO` |
| identificadores de ocurrencia únicos      | **28 de 28** | `CUMPLIDO` |
| variantes semánticas reconciliadas        | **16 de 16** | `CUMPLIDO` |
| decisiones por superficie runtime         | **7 de 7**   | `CUMPLIDO` |
| helpers sin consumidor con destino exacto | **4 de 4**   | `CUMPLIDO` |
| hallazgos con tarea responsable           | **27 de 27** | `CUMPLIDO` |
| cambios físicos en código o Supabase      | **0**        | `CUMPLIDO` |
| cambios `TREQ-*`                          | **0**        | `CUMPLIDO` |

La tarea queda documentalmente completa sin ejecutar código ni modificar los repositorios runtime.

---

#### 21. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea reconcilia implementación y consumo actuales, clasifica variantes y asigna cada brecha a tareas ya existentes. No introduce una nueva obligación verificable independiente, no modifica el alcance de un `TREQ-*` vigente y no difiere, descarta ni vuelve obsoleto ningún requisito. Las pruebas de adapters, cookies, middleware, migración, compatibilidad y retiro deberán materializarse en las tareas propietarias indicadas.

| Operación sobre `TREQ-*` | Cantidad |
| ------------------------ | -------: |
| creados                  |    **0** |
| modificados              |    **0** |
| diferidos                |    **0** |
| descartados              |    **0** |
| obsoletos                |    **0** |

No corresponde generar una copia del registro `04A`.

---

#### 22. Cierre y continuidad

Queda establecido que la fundación Supabase actual combina un núcleo repetido con diferencias reales de ciclo de vida, cookies, frontera de sesión, privilegio y reglas locales. La centralización física no puede decidirse únicamente por nombre de archivo o hash.

La única continuidad inmediata reservada es `SHELL-AUD-009 — Comparar tipos y contratos`. No se desarrolla ni modifica dentro de esta tarea. El handoff `SHELL-PKG-001` permanece reservado para después de completar `SHELL-AUD-011`.


### ✅ SHELL-AUD-009 — Comparar tipos y contratos

**Estado:** APROBADA
**Bloque:** H — Fundación compartida
**Tipo:** auditoría documental comparativa de tipos TypeScript, contratos runtime, esquemas de identidad y fronteras compartidas
**Entrada de continuidad:** `SHELL-AUD-008 — Comparar clientes Supabase`
**Continuidad inmediata reservada:** `SHELL-AUD-010 — Clasificar compartir / generar / mantener local`
**Handoff posterior al segmento `SHELL-AUD-001..011`:** `SHELL-PKG-001 — Elegir mecanismo de distribución`
**Fecha de corte:** 2026-08-01
**Commit documental canónico:** `f66c6d8ed7b743926991f134a7b92dbd03f88991`
**Cambios en código, tipos, contratos, paquetes, configuración, CI, despliegues, datos o Supabase:** no autorizados ni realizados

---

#### 1. Resultado de esta tarea

Esta tarea materializa la comparación de los tipos y contratos que actualmente sostienen AppShell, navegación, autenticación, permisos, contexto operativo, simulación, dispositivos compartidos y clientes Supabase en las superficies web de Vento OS.

La auditoría distingue cuatro niveles que no pueden tratarse como equivalentes:

1. contratos normativos aprobados pero todavía no implementados;
2. un paquete compartido parcial y transitorio;
3. tipos locales copiados o redeclarados entre repositorios;
4. estructuras inferidas mediante casts desde consultas, RPC y datos ambientales.

| Métrica                                                       |  Resultado |
| ------------------------------------------------------------- | ---------: |
| Repositorios runtime comparados                               |      **7** |
| Fuentes físicas de plantilla comparadas                       |      **1** |
| Paquetes compartidos parciales comparados                     |      **1** |
| Superficies contractuales con decisión explícita              | **9 de 9** |
| Identidades contractuales materializadas                      |     **34** |
| Modelos de contexto coexistentes                              |      **4** |
| Variantes de entrada de `requireAppAccess`                    |      **3** |
| Copias runtime de `OperationalSession`                        |      **6** |
| Blobs de `OperationalSession`                                 |      **1** |
| Declaraciones runtime locales de `AppSwitcherItem`            |     **18** |
| Paquetes `@vento/contracts` existentes                        |      **0** |
| Paquetes `@vento/os-context` existentes                       |      **1** |
| Consumidores runtime confirmados de `@vento/os-context`       |      **0** |
| Tipos `Database` generados localizados en las siete fronteras |      **0** |
| Clientes Supabase parametrizados con `Database`               |      **0** |
| Hallazgos con destino exacto                                  |     **32** |
| Cambios `TREQ-*`                                              |      **0** |

Resultado central:

```text
CONTRATO CANÓNICO DOCUMENTAL
→ DEFINIDO PARCIALMENTE EN AUTH-CAT Y BLOQUE H
→ @vento/contracts TODAVÍA AUSENTE

CONTRATO COMPARTIDO FÍSICO
→ @vento/os-context 0.1.0 PRIVADO
→ TRES TIPOS EXPORTADOS
→ SIN CONSUMO RUNTIME CONFIRMADO
→ SIN VALIDACIÓN RUNTIME DE SUS PAYLOADS

CONTRATOS RUNTIME
→ TYPES LOCALES COPIADOS
→ STRINGS ABIERTOS PARA APPS, PERMISOS, ROLES, SCOPES Y RAZONES
→ ROW TYPES MANUALES Y CASTS DE RPC
→ RESULTADOS BOOLEANOS O INFERIDOS

PARIDAD CONTRACTUAL
→ NO DEMOSTRADA
```

La tarea no decide todavía qué contrato se comparte, se genera o permanece local. Esa disposición corresponde exclusivamente a `SHELL-AUD-010`.

---

#### 2. Fuentes y corte reproducible

| Fuente                                              | Uso                                                                                    |
| --------------------------------------------------- | -------------------------------------------------------------------------------------- |
| `docs/plan-canonico/modular/01_PROTOCOLO.md`        | continuidad, alcance, trazabilidad y forma de entrega                                  |
| `docs/plan-canonico/modular/delivery-contract.json` | contrato físico del artefacto                                                          |
| `docs/plan-canonico/modular/active-sequence.json`   | secuencia vigente y handoff posterior                                                  |
| `00_CABECERA_Y_ESTADO.md`                           | confirmación de tarea actual y siguiente reservada                                     |
| `01_AUDITORIA_DE_COMPONENTES_COMPARTIDOS.md`        | propietario, dependencias y hallazgos heredados                                        |
| `SHELL-AUD-001` a `SHELL-AUD-008`                   | inventario físico y comparaciones previas de auth, contexto, UI, navegación y Supabase |
| `AUTH-CAT-017` y `AUTH-CAT-018`                     | destino normativo de contratos de autorización y tipos derivados                       |
| `03_CONTRATOS_COMPARTIDOS.md`                       | tareas `SHELL-CON-001` a `SHELL-CON-016`                                               |
| `03_AUTORIZACION_Y_CONTEXTO_COMPARTIDOS.md`         | frontera entre `@vento/contracts`, `@vento/os-context` y Supabase                      |
| `02_DISTRIBUCION_Y_PAQUETES_COMPARTIDOS.md`         | versionado, compatibilidad, rollback y distribución posteriores                        |
| `packages/os-context`                               | paquete compartido parcial actualmente versionado                                      |
| código runtime de los siete repositorios            | tipos, casts, firmas, consumidores y resultados actuales                               |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`  | cobertura de pruebas vigente                                                           |
| `package.json` y scripts documentales               | validadores aplicables y dependencias declaradas                                       |

Commits runtime inspeccionados:

| Superficie | Repositorio                  | Commit                                     |
| ---------- | ---------------------------- | ------------------------------------------ |
| SHELL      | `devVentoGroup/vento-shell`  | `f66c6d8ed7b743926991f134a7b92dbd03f88991` |
| VISO       | `devVentoGroup/vento-viso`   | `47322403f3c64e83ae0c4a2f68c05d47093e5bb4` |
| NEXO       | `devVentoGroup/vento-nexo`   | `142c4d696221e3ce3fda4ed3b62f3d1fe5b58799` |
| FOGO       | `devVentoGroup/vento-fogo`   | `b6b9ed00e5267cabaac1a5a1090d93d5f60e86f2` |
| ORIGO      | `devVentoGroup/vento-origo`  | `b7a8303fa078ef087f522b6c99059ababfc27472` |
| PULSO      | `devVentoGroup/vento-pulso`  | `71e0184486b5fe11e0a42435baf4024807a80efd` |
| NUMERA     | `devVentoGroup/vento-numera` | `1b48a5da425d92e19ed89cf175b1dccc4cd960e1` |

La fuente de plantilla se inspeccionó dentro de `vento-shell`; no se trató como un octavo runtime. El paquete `@vento/os-context` se trató como superficie contractual adicional, no como aplicación.

---

#### 3. Continuidad interpretada

La secuencia vigente es:

```text
SHELL-AUD-001
→ ...
→ SHELL-AUD-008 aprobada
→ SHELL-AUD-009 actual
→ SHELL-AUD-010 inmediata reservada
→ SHELL-AUD-011
→ SHELL-PKG-001
```

`SHELL-PKG-001` permanece como handoff posterior al cierre de todo el segmento `SHELL-AUD-001..011`. Esta tarea no modifica `active-sequence.json`.

---

#### 4. Alcance exacto

Se comparan:

1. identificadores de aplicación y metadatos de presentación;
2. tipos de AppSwitcher, logo, encabezado, navegación y gate operativo;
3. contratos de entrada y salida de `requireAppAccess`;
4. contratos de permisos, códigos, contexto y resultados de autorización;
5. contratos de sesión operativa, contexto operacional y simulación;
6. contratos de roles, scopes y role override;
7. tipos de dispositivos compartidos y firma de actor;
8. tipos de cliente Supabase, filas, consultas y RPC;
9. contratos de SSO, retorno seguro, errores y razones;
10. contratos normativos ya aprobados para `@vento/contracts/authorization`;
11. el paquete físico `@vento/os-context` y su adopción actual;
12. destinos exactos de migración, validación y compatibilidad.

Se excluyen:

| Materia                                                      | Tarea propietaria                                           |
| ------------------------------------------------------------ | ----------------------------------------------------------- |
| decisión final compartir / generar / mantener local          | `SHELL-AUD-010`                                             |
| retiro de tipos o helpers sin consumidor confirmado          | `SHELL-AUD-011`                                             |
| creación física de `@vento/contracts`                        | `SHELL-CON-001`                                             |
| implementación de códigos, roles, scopes, contexto y errores | `SHELL-CON-002` a `SHELL-CON-008`                           |
| implementación de SDK, adapters, scopes y migración          | `SHELL-AUTH-001` a `SHELL-AUTH-005`                         |
| consolidación del contexto compartido                        | `SHELL-CTX-001` a `SHELL-CTX-006`                           |
| definición de distribución, versionado y rollback            | `SHELL-PKG-001` a `SHELL-PKG-008`                           |
| cambios de RPC, esquema, RLS, grants o datos                 | tareas propietarias de Supabase y autorización              |
| implementación de UI compartida y AppShell                   | `SHELL-UI-001` a `SHELL-UI-003`                             |
| ejecución de pruebas operativas o remotas                    | paquetes de implementación y certificación correspondientes |

---

#### 5. Taxonomía de comparación

| Estado                       | Criterio                                                                |
| ---------------------------- | ----------------------------------------------------------------------- |
| `NORMATIVO_NO_IMPLEMENTADO`  | contrato aprobado documentalmente, sin artefacto runtime consumible     |
| `COMPARTIDO_PARCIAL`         | paquete físico común con cobertura o adopción incompleta                |
| `LOCAL_DUPLICADO`            | mismo contrato repetido en varios archivos o repositorios               |
| `LOCAL_DIVERGENTE`           | contratos con propósito común y firmas o semántica distintas            |
| `INFERIDO_NO_EXPORTADO`      | forma observable solo por inferencia del retorno o del consumidor       |
| `STRING_ABIERTO`             | identidad o estado representado por `string` sin validación de catálogo |
| `CAST_NO_VALIDADO`           | payload convertido con `as` sin parser o schema runtime                 |
| `TIPADO_ESTRUCTURAL_MINIMO`  | interfaz local suficiente para compilar una operación puntual           |
| `UNION_DISCRIMINADA_LOCAL`   | contrato local con discriminante correcto, no compartido ni versionado  |
| `SIN_DATABASE_GENERADO`      | cliente y consultas sin tipo de esquema Supabase generado               |
| `SIN_VERSION_CONTRACTUAL`    | resultado no conserva versión o hash del contrato aplicado              |
| `PENDIENTE_DE_CLASIFICACION` | disposición reservada a `SHELL-AUD-010`                                 |

La compatibilidad estructural TypeScript no demuestra equivalencia empresarial. Dos tipos pueden ser asignables y seguir representando roles, permisos, estados o razones con significado distinto.

---

#### 6. Matriz maestra de identidades contractuales

| ID             | Contrato o tipo                              | Superficie actual                                  | Estado                      | Brecha principal                                                                       | Destino exacto                                                                      |
| -------------- | -------------------------------------------- | -------------------------------------------------- | --------------------------- | -------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| `TYPE-CON-001` | `AppCode`                                    | uniones y strings locales                          | `NORMATIVO_NO_IMPLEMENTADO` | no existe export runtime del catálogo de diez aplicaciones                             | `SHELL-CON-002`; `AUTH-CAT-018`                                                     |
| `TYPE-CON-002` | definición de aplicación / `AppSwitcherItem` | tres redeclaraciones por cada uno de seis runtimes | `LOCAL_DUPLICADO`           | datos, estado, acceso, grupo, URL y marca no proceden de una fuente única              | `SHELL-CON-002`; `SHELL-UI-002`; `SHELL-AUTH-005`                                   |
| `TYPE-CON-003` | `VentoEntity`                                | `vento-logo.tsx` locales                           | `LOCAL_DIVERGENTE`          | incluye `default`, omite identidades canónicas y duplica colores                       | `SHELL-CON-002`; `SHELL-UI-002`                                                     |
| `TYPE-CON-004` | `IconName`                                   | AppShell y Chrome locales                          | `LOCAL_DIVERGENTE`          | vocabularios de iconos no versionados ni validados contra navegación                   | `SHELL-UI-001`; `SHELL-AUD-010`                                                     |
| `TYPE-CON-005` | `NavigationRow`                              | seis `vento-shell.tsx`                             | `TIPADO_ESTRUCTURAL_MINIMO` | solo modela ocho de catorce campos funcionales del esquema                             | `SHELL-CON-011`; `SHELL-UI-002`; `SHELL-AUTH-005`                                   |
| `TYPE-CON-006` | `NavItem`                                    | `vento-shell.tsx` y `vento-chrome.tsx`             | `LOCAL_DUPLICADO`           | `href` reemplaza identidad estable; permiso es string libre                            | `SHELL-CON-003`; `SHELL-CON-011`; `SHELL-UI-002`                                    |
| `TYPE-CON-007` | `NavGroup`                                   | AppShell y Chrome locales                          | `LOCAL_DUPLICADO`           | label visible funciona como identidad de agrupación                                    | `SHELL-CON-011`; `SHELL-UI-002`                                                     |
| `TYPE-CON-008` | `OperatingGate`                              | AppShell y Chrome locales                          | `LOCAL_DUPLICADO`           | modos, bloqueo, textos y acción no están versionados                                   | `SHELL-CON-007`; `SHELL-CON-008`; `SHELL-CTX-005`; `SHELL-UI-002`                   |
| `TYPE-CON-009` | `PageHeaderProps`                            | VISO y NEXO                                        | `LOCAL_DIVERGENTE`          | VISO añade `accent`; NEXO aporta comportamiento responsive distinto                    | `SHELL-UI-001`; `SHELL-AUD-010`                                                     |
| `TYPE-CON-010` | `VentoLogoProps` / `VentoIconProps`          | seis runtimes                                      | `LOCAL_DIVERGENTE`          | entidad, colores, labels, fallback y accesibilidad permanecen locales                  | `SHELL-CON-002`; `SHELL-UI-002`; `SHELL-AUD-010`                                    |
| `TYPE-CON-011` | `SiteOption`                                 | AppShell, Chrome, perfil y helper Supabase         | `LOCAL_DIVERGENTE`          | `name` y `site_type` cambian en nulabilidad y presencia                                | `SHELL-CON-007`; `SHELL-CTX-003`; `SHELL-AUTH-005`                                  |
| `TYPE-CON-012` | `EmployeeSiteRow`                            | FOGO, ORIGO y NUMERA                               | `LOCAL_DUPLICADO`           | relación `sites` admite objeto o array mediante tipo manual                            | `SHELL-CON-007`; `SHELL-AUTH-002`; `SHELL-AUTH-005`                                 |
| `TYPE-CON-013` | `GuardOptions` base                          | NEXO, FOGO, ORIGO y NUMERA                         | `LOCAL_DUPLICADO`           | app, permiso, sede y área son strings abiertas                                         | `SHELL-CON-002`; `SHELL-CON-003`; `SHELL-CON-007`; `SHELL-AUTH-002`                 |
| `TYPE-CON-014` | `GuardOptions` VISO                          | VISO                                               | `LOCAL_DIVERGENTE`          | `allowPermissionAccess` altera la puerta general                                       | `SHELL-AUTH-002`; `SHELL-AUTH-005`; `SHELL-AUD-010`                                 |
| `TYPE-CON-015` | `GuardOptions` PULSO                         | PULSO                                              | `LOCAL_DIVERGENTE`          | `requireAppAccessPermission` usa otra bandera y default                                | `SHELL-AUTH-002`; `SHELL-AUTH-005`; `SHELL-AUD-010`                                 |
| `TYPE-CON-016` | resultado de `requireAppAccess`              | seis guards                                        | `INFERIDO_NO_EXPORTADO`     | no existe tipo público para usuario, sesión, sede y dispositivo devueltos              | `SHELL-CON-007`; `SHELL-CON-008`; `SHELL-AUTH-002`                                  |
| `TYPE-CON-017` | `PermissionContext`                          | seis helpers de permisos                           | `LOCAL_DUPLICADO`           | sede y área son strings opcionales, sin fuente ni frescura                             | `SHELL-CON-006`; `SHELL-CON-007`; `SHELL-AUTH-002`                                  |
| `TYPE-CON-018` | `PermissionKey` / entrada de permiso         | helpers, guards y role override                    | `STRING_ABIERTO`            | concatena prefijo; no valida activo, alias, legacy o retirado                          | `SHELL-CON-003`; `AUTH-CAT-018`; `AUTH-CAT-019`; `SHELL-AUTH-004`                   |
| `TYPE-CON-019` | resultado de evaluación de permiso           | helpers y RPC directas                             | `TIPADO_ESTRUCTURAL_MINIMO` | `boolean` fusiona denegación y error técnico                                           | `SHELL-CON-008`; `SHELL-AUTH-002`; `AUTH-DB-034`                                    |
| `TYPE-CON-020` | `OperationalSession`                         | seis copias idénticas                              | `LOCAL_DUPLICADO`           | objeto plano combina `mode` e `isSharedDevice`; no estrecha campos por modo            | `SHELL-CON-007`; `SHELL-CTX-001`; `SHELL-AUTH-005`                                  |
| `TYPE-CON-021` | `OperationalContextRow`                      | NEXO                                               | `CAST_NO_VALIDADO`          | veintidós campos planos, booleanos nulos y razones string                              | `SHELL-CON-007`; `SHELL-CON-008`; `SHELL-CTX-001`; `SHELL-CTX-005`                  |
| `TYPE-CON-022` | `EffectiveContext`                           | `@vento/os-context`                                | `COMPARTIDO_PARCIAL`        | `session_mode`, roles, app, área y razones siguen abiertos                             | `SHELL-CON-004` a `SHELL-CON-008`; `SHELL-CTX-001`                                  |
| `TYPE-CON-023` | `ContextSimulationInput`                     | `@vento/os-context`                                | `COMPARTIDO_PARCIAL`        | ids y roles son strings; no conserva versión, actor ni autorización para simular       | `SHELL-CON-004`; `SHELL-CON-005`; `SHELL-CON-007`; `SHELL-AUTH-002`                 |
| `TYPE-CON-024` | `AccessContext@1.0.0`                        | contrato normativo                                 | `NORMATIVO_NO_IMPLEMENTADO` | no existe payload runtime canónico consumido por los repositorios                      | `SHELL-CON-007`; `SHELL-AUTH-001`; `SHELL-CTX-001`; `AUTH-DB-033`                   |
| `TYPE-CON-025` | rol base, rol operativo y `ROLE_OPTIONS`     | seis configuraciones locales                       | `LOCAL_DIVERGENTE`          | listas distintas; UI restringe selección pero servidor acepta strings                  | `SHELL-CON-004`; `SHELL-CON-005`; `SHELL-AUTH-004`; `SHELL-AUTH-005`                |
| `TYPE-CON-026` | `RolePermissionRow`                          | seis role overrides                                | `LOCAL_DIVERGENTE`          | forma de relación y campos de scope dependen de selección manual                       | `SHELL-CON-006`; `SHELL-AUTH-001`; `SHELL-AUTH-005`                                 |
| `TYPE-CON-027` | `RolePermissionEntry` y scope                | role override base y NEXO                          | `STRING_ABIERTO`            | `scope_type`, site type y area kind no usan unión canónica                             | `SHELL-CON-006`; `AUTH-CAT-018`; `SHELL-AUTH-001`                                   |
| `TYPE-CON-028` | adapter `SupabaseClient`                     | aliases locales y paquete                          | `LOCAL_DIVERGENTE`          | algunas firmas exigen cliente completo y PULSO usa `Pick<..., "rpc">`                  | `SHELL-AUTH-002`; `SHELL-AUTH-005`; `SHELL-AUD-010`                                 |
| `TYPE-CON-029` | `Database` generado                          | siete runtimes                                     | `SIN_DATABASE_GENERADO`     | clientes y queries no están parametrizados con esquema generado                        | `SHELL-CON-001`; `SHELL-AUTH-002`; `SHELL-AUTH-004`                                 |
| `TYPE-CON-030` | inputs y outputs RPC                         | contexto, permisos, firma y middleware             | `CAST_NO_VALIDADO`          | nombres, parámetros y filas se escriben manualmente y se castean                       | `SHELL-AUTH-002`; `AUTH-DB-032` a `AUTH-DB-035`                                     |
| `TYPE-CON-031` | `SignatureResult`                            | cuatro copias byte-idénticas                       | `UNION_DISCRIMINADA_LOCAL`  | buena discriminación local, pero códigos, targets, metadata y errores no son canónicos | `SHELL-CON-007`; `SHELL-CON-008`; `SHELL-AUTH-002`; `AUTH-DEV-007` a `AUTH-DEV-016` |
| `TYPE-CON-032` | destino SSO y `returnTo`                     | seis helpers y guards                              | `LOCAL_DIVERGENTE`          | string o URL sin tipo de origen, política, app destino ni validación uniforme          | `SHELL-CON-002`; `SHELL-CON-008`; `SHELL-AUTH-002`                                  |
| `TYPE-CON-033` | razones, errores y estados                   | query params, arrays y headers                     | `STRING_ABIERTO`            | no existe unión/versionado común de códigos y razones seguras                          | `SHELL-CON-008`; `SHELL-CTX-005`; `SHELL-AUTH-002`; `SHELL-AUTH-004`                |
| `TYPE-CON-034` | manifiesto, versión, hash y diagnóstico      | aprobado en `AUTH-CAT-018`                         | `NORMATIVO_NO_IMPLEMENTADO` | runtime no transporta `published_version`, hash ni diagnóstico estructurado            | `AUTH-CAT-017`; `AUTH-CAT-018`; `SHELL-CON-001`; `SHELL-AUTH-003`                   |

**Conciliación:** 34 identidades esperadas, 34 materializadas, 0 omitidas y 0 identificadores duplicados.

---

#### 7. Estado de la fuente canónica de contratos

La arquitectura documental aprobada separa responsabilidades:

```text
@vento/contracts/authorization
→ catálogos, códigos, schemas, tipos derivados y diagnósticos

@vento/os-context
→ adapters, scopes por solicitud, proyecciones seguras y compatibilidad

Supabase
→ resolución autoritativa, persistencia y decisión
```

Estado físico actual:

| Artefacto                        | Estado físico               | Cobertura actual                                           | Resultado             |
| -------------------------------- | --------------------------- | ---------------------------------------------------------- | --------------------- |
| `@vento/contracts`               | ausente                     | ninguna exportación runtime                                | `NO_IMPLEMENTADO`     |
| `@vento/contracts/authorization` | ausente                     | contrato documental en `AUTH-CAT-017/018`                  | `NORMATIVO`           |
| `@vento/os-context`              | presente, privado, `0.1.0`  | `EffectiveContext`, `ContextSimulationInput` y cliente RPC | `PARCIAL_TRANSITORIO` |
| tipos `Database` generados       | no localizados              | ninguna parametrización de clientes                        | `AUSENTE_EN_EL_CORTE` |
| contratos locales                | presentes en siete runtimes | compilación y comportamiento actual                        | `LEGACY_ACTIVO`       |

`@vento/os-context` no constituye todavía la implementación completa del contrato canónico porque:

- exporta tres tipos principales, pero no catálogos o schemas;
- acepta un `SupabaseClient` sin tipo `Database`;
- convierte respuestas RPC mediante casts;
- usa strings abiertas para aplicaciones, roles, áreas, modos y razones;
- no expone versión o hash del contrato aplicado;
- la búsqueda de importaciones no confirmó consumidores runtime fuera del propio paquete y documentación.

No se autoriza retirar el paquete ni considerarlo muerto. Su conservación o absorción se decide en `SHELL-AUD-010` y su consumo se verifica antes de cualquier retiro en `SHELL-AUD-011`.

---

#### 8. Aplicaciones, marca y navegación

##### 8.1. Identidad de aplicación

El contrato documental futuro exige un `AppCode` derivado del catálogo. El runtime utiliza:

- strings en consultas y permisos;
- uniones locales en `APP_ENTITY` y `VentoEntity`;
- ids locales en listas de aplicación;
- casts de variables de entorno hacia uniones sin parser runtime.

La unión local observada en AppShell y logo incluye `default` y varias aplicaciones, pero no equivale al conjunto canónico de diez códigos. `default` es un fallback de presentación, no una aplicación empresarial.

Decisión:

```text
APP CODE LOCAL
→ NO ACEPTAR COMO CONTRATO CANÓNICO
→ PRESERVAR COMO COMPATIBILIDAD TEMPORAL
→ MIGRAR A SHELL-CON-002
```

##### 8.2. `AppSwitcherItem`

Cada uno de los seis runtimes redeclara el contrato en:

- `vento-shell.tsx`;
- `vento-chrome.tsx`;
- `app-switcher.tsx`.

Eso produce dieciocho declaraciones locales para la misma responsabilidad nominal. Los campos actuales combinan:

- identidad;
- presentación;
- URL;
- marca;
- estado de despliegue;
- acceso calculado;
- agrupación de interfaz.

La mezcla impide distinguir datos canónicos de aplicación, proyección de autorización y preferencias visuales. La futura forma deberá separar al menos:

```text
ApplicationDefinition
ApplicationPresentation
ApplicationAvailability
ApplicationAccessProjection
ApplicationDestination
```

Esta tarea no diseña esas interfaces finales; registra la separación obligatoria para `SHELL-CON-002`, `SHELL-UI-002` y `SHELL-AUD-010`.

##### 8.3. Navegación

El esquema `app_navigation_items` posee campos estables que no llegan al contrato runtime. `NavigationRow` selecciona ocho campos y `NavItem` conserva una proyección menor.

| Campo de esquema           | `NavigationRow` | `NavItem`        | Resultado                             |
| -------------------------- | --------------- | ---------------- | ------------------------------------- |
| `group_key`                | no              | no               | identidad de grupo perdida            |
| `group_label`              | sí              | indirecto        | label visible usado como clave        |
| `item_key`                 | no              | no               | identidad estable perdida             |
| `href`                     | sí              | sí               | usado como destino, key y ruta activa |
| `required_permission_code` | sí              | `permissionCode` | string libre                          |
| `opens_in_new_tab`         | no              | no               | comportamiento declarado ignorado     |
| `metadata`                 | no              | no               | extensión contractual descartada      |

El contrato de navegación actual es una proyección local incompleta. No puede declararse equivalente al esquema ni al futuro contrato de pantalla.

---

#### 9. Contratos de guard y permiso

##### 9.1. Tres contratos de entrada

| Variante        | Consumidores              | Campo diferencial            | Default                    | Efecto                                        |
| --------------- | ------------------------- | ---------------------------- | -------------------------- | --------------------------------------------- |
| `GUARD-INPUT-A` | NEXO, FOGO, ORIGO, NUMERA | ninguno                      | acceso general obligatorio | base copiada                                  |
| `GUARD-INPUT-B` | VISO                      | `allowPermissionAccess`      | `false`                    | un permiso específico puede habilitar entrada |
| `GUARD-INPUT-C` | PULSO                     | `requireAppAccessPermission` | `true`                     | permite omitir la puerta general              |

Los nombres y defaults no son equivalentes. Un adapter compartido no puede reducirlos a un booleano genérico sin conservar la intención semántica.

Los campos comunes siguen abiertos:

```text
appId: string
permissionCode?: string | string[]
siteId?: string | null
areaId?: string | null
returnTo: string
```

La firma futura deberá usar identidades canónicas, contexto explícito y una política de acceso discriminada, no múltiples booleanos de interpretación inversa.

##### 9.2. Resultado de guard

Los seis guards devuelven una forma estructural parecida, pero no exportan un tipo público. El consumidor infiere:

- cliente Supabase;
- usuario;
- sede;
- sesión operativa;
- descriptor de dispositivo compartido.

No se conservan en el resultado:

- versión contractual;
- permiso solicitado normalizado;
- decisión estructurada;
- razones;
- fuente del contexto;
- timestamp de resolución;
- evidencia o correlación.

El resultado actual es un agregado de conveniencia, no un `AccessContext` ni una `AuthorizationDecision` canónica.

##### 9.3. Permisos

`normalizePermissionCode` concatena `appId` y `code`. No valida:

- existencia en catálogo;
- aplicación propietaria;
- estado activo;
- alias;
- legacy;
- retiro;
- formato completo;
- versión del catálogo.

`checkPermission` y las RPC directas retornan booleanos. En varias rutas, un error técnico y una denegación producen el mismo `false`. La forma actual no es suficiente como contrato público de autorización.

Contrato mínimo requerido por las tareas futuras:

```text
PermissionRequest
→ PermissionKey canónica
→ AccessContext canónico
→ Resource / scope
→ AuthorizationDecision discriminada
→ reason codes seguras
→ version + hash + timestamp
```

Esta tarea registra la necesidad; no implementa la forma final.

---

#### 10. Cuatro modelos de contexto coexistentes

| Modelo                  | Ubicación                    | Naturaleza             | Consumidores confirmados  | Estado                      |
| ----------------------- | ---------------------------- | ---------------------- | ------------------------- | --------------------------- |
| `OperationalSession`    | seis runtimes                | sesión local copiada   | guards y lógica local     | `LEGACY_ACTIVO`             |
| `OperationalContextRow` | NEXO                         | fila RPC especializada | flujos operativos NEXO    | `LOCAL_ESPECIALIZADO`       |
| `EffectiveContext`      | `@vento/os-context`          | paquete parcial        | ninguno fuera del paquete | `TRANSITORIO_SIN_ADOPCION`  |
| `AccessContext@1.0.0`   | contrato canónico documental | objetivo autoritativo  | implementación futura     | `NORMATIVO_NO_IMPLEMENTADO` |

##### 10.1. `OperationalSession`

Las seis copias comparten un blob y una forma única, pero la forma no es una unión discriminada completa:

- `mode` discrimina `employee` o `shared_device`;
- `isSharedDevice` repite el mismo hecho;
- todos los campos de dispositivo admiten `null` en ambos modos;
- `role` y `navigationRole` son strings;
- `allowedAppCodes` es `string[]`;
- sede y área preferidas provienen del caller y no conservan fuente.

La identidad byte a byte demuestra una base compartida candidata; no demuestra corrección semántica ni autoridad.

##### 10.2. `OperationalContextRow`

NEXO modela una fila de veintidós campos provenientes de `get_operational_context`. La respuesta se convierte mediante cast y admite:

- booleanos nulos;
- razones como `string[]`;
- códigos de aplicación y rol como strings;
- ids sin marca;
- mutación local posterior por role override.

La forma representa un contrato RPC de hecho, pero no existe schema runtime que valide presencia, tipos, versión o compatibilidad.

##### 10.3. `EffectiveContext`

El paquete compartido aporta una forma más explícita, pero mantiene:

- `session_mode` abierto por incluir `string`;
- `app_code`, roles y área como strings;
- arrays de razones sin unión canónica;
- `metadata` libre;
- respuestas RPC casteadas.

No se declara obsoleto; se clasifica como transición parcial que debe reconciliarse con `AccessContext@1.0.0`.

##### 10.4. `AccessContext@1.0.0`

El contrato canónico futuro debe ser:

- inmutable;
- versionado;
- derivado de identidades canónicas;
- discriminado por carril y actor;
- explícito sobre sede, área, turno, check-in, dispositivo y simulación;
- acompañado de razones y frescura;
- validado en runtime.

No existe todavía una implementación consumida que satisfaga esas condiciones.

---

#### 11. Roles, scopes y simulación

Las seis configuraciones `role-override-config.ts` usan:

```text
ROLE_OPTIONS: Array<{ value: string; label: string }>
PRIVILEGED_ROLE_OVERRIDES: Set<string>
ROLE_OVERRIDE_COOKIE: string
```

Problemas contractuales confirmados:

1. las listas de roles difieren por aplicación;
2. FOGO y PULSO usan identificadores de cookie correspondientes a otra aplicación;
3. la lista UI no valida el valor recibido en servidor;
4. base role y operational role se representan con el mismo tipo primitivo;
5. no existe tipo distinto para rol elegible, simulado, efectivo o de navegación;
6. `scope_type`, `site_type` y `area_kind` son strings abiertas;
7. NEXO usa una forma distinta de `RolePermissionRow` y añade acceso a sedes;
8. los resultados de simulación vuelven a ser booleanos.

Decisión documental:

```text
BaseRoleCode
OperationalRoleCode
NavigationRoleCode
SimulationRoleCode
ScopeType
SiteType
AreaKind
```

son identidades distintas y no deberán colapsarse en `string` por conveniencia. Su implementación corresponde a `SHELL-CON-004`, `SHELL-CON-005`, `SHELL-CON-006` y los adapters posteriores.

---

#### 12. Supabase, filas y RPC

##### 12.1. Ausencia de `Database` generado

En las siete fronteras runtime inspeccionadas:

- no se localizó `database.types.ts` ni export equivalente;
- no se localizaron invocaciones `createBrowserClient<Database>`;
- no se localizaron invocaciones `createServerClient<Database>`;
- `@vento/os-context` acepta `SupabaseClient` sin parametrización de esquema.

Consecuencia:

```text
TABLAS, COLUMNAS, RELACIONES Y RPC
→ NO SE DERIVAN DE UN ESQUEMA TYPESCRIPT GENERADO
→ SE MODELAN MEDIANTE ROW TYPES LOCALES
→ SE COMPLETAN CON CASTS
```

La ausencia no demuestra que las consultas sean incorrectas. Sí impide que TypeScript detecte de forma centralizada deriva de nombres, nulabilidad, relaciones o firmas RPC.

##### 12.2. Row types manuales

Se observaron tipos locales como:

- `SiteRow`;
- `EmployeeSiteRow`;
- `AttendanceLogRow`;
- `ShiftContextRow`;
- `SharedOperationalDeviceRow`;
- `RolePermissionRow`;
- `SignatureRpcRow`;
- `OperationalContextRow`.

Estos tipos modelan proyecciones distintas y pueden ser válidos como DTOs locales. La brecha es que no existe una relación verificable con un `Database` generado ni un parser runtime.

##### 12.3. RPC

Las firmas de RPC se consumen mediante strings y objetos literales. Los resultados se transforman mediante:

- `Boolean(data)`;
- `String(...)`;
- `as OperationalContextRow`;
- `as SharedOperationalDeviceRow`;
- `as SignatureRpcRow`;
- comprobaciones parciales de propiedades.

No se conserva de forma transversal:

- versión de RPC;
- schema de entrada;
- schema de salida;
- código de error estructurado;
- versión o hash de contrato;
- correlación de decisión.

Esos elementos se resuelven en los adapters de `SHELL-AUTH-002` y en las tareas `AUTH-DB-032` a `AUTH-DB-035`.

---

#### 13. Contratos locales con diseño útil

La auditoría no clasifica todo contrato local como defecto.

##### 13.1. `SignatureResult`

`shared-device-signature.ts` usa una unión discriminada local:

```text
ok=true, required=false
ok=true, required=true
ok=false
```

Esta forma permite estrechamiento correcto y diferencia firma no requerida, firma creada y fallo. Se conserva como evidencia de una decisión útil.

Brechas restantes:

- `appId`, `actionCode` y `targetTable` son strings;
- el error es un mensaje humano, no un código;
- metadata es abierta;
- el tipo no es exportado desde un paquete canónico;
- no transporta versión contractual.

##### 13.2. `resolveRequestProtocol`

NEXO retorna la unión literal `"http" | "https"`, lo que es más preciso que `string`. Sin embargo, el helper es local y su política no está vinculada a un contrato común de host, destino o ambiente.

##### 13.3. `PageHeaderProps`

Las dos variantes modelan correctamente props de presentación, pero sus diferencias de API deben reconciliarse antes de compartir el componente. No pertenecen al contrato de autorización.

La regla resultante es:

```text
PRESERVAR DECISIONES LOCALES ÚTILES
≠ ADOPTAR SU ARCHIVO COMO CONTRATO CANÓNICO SIN RECONCILIACIÓN
```

---

#### 14. Errores, razones y estados

Actualmente coexisten strings en:

- query parameter `reason` de `/no-access`;
- `blocked_reasons` de contexto;
- status headers de middleware;
- mensajes de firma de dispositivo;
- mensajes de bloqueo operacional;
- errores de configuración Supabase;
- códigos de error de Auth;
- estados de aplicación y acceso;
- modos de gate operativo.

Ejemplos observados:

```text
no_access
no_permission
role_override
shared_device_app_not_allowed
shared_device_no_permission
out_of_shift
checkin_required
shift_site_mismatch
checkin_site_mismatch
unauthenticated
refresh_token_not_found
```

No todos representan el mismo nivel:

- algunos son causas de autorización;
- otros son fallos técnicos;
- otros son estados de sesión;
- otros son mensajes de interfaz.

`SHELL-CON-008` deberá separar al menos:

```text
AuthorizationReasonCode
ContextBlockReasonCode
AuthenticationFailureCode
ContractValidationCode
UserSafeMessageKey
DiagnosticCode
```

Esta tarea no asigna todavía el vocabulario final.

---

#### 15. Versionado y validación runtime

`AUTH-CAT-018` exige distinguir:

- fuente raw;
- datos validados por schema;
- datos validados por contrato;
- artefacto publicado;
- versión publicada;
- hash;
- diagnóstico de fallo.

El runtime actual no transporta esas capas. Las identidades locales se aceptan por compilación, cast o concatenación.

| Frontera                | Validación compile-time  | Validación runtime       | Versión / hash |
| ----------------------- | ------------------------ | ------------------------ | -------------- |
| uniones locales de app  | parcial                  | no                       | no             |
| `ROLE_OPTIONS`          | UI local                 | no en servidor           | no             |
| `PermissionContext`     | estructural              | no                       | no             |
| `OperationalSession`    | estructural              | no schema                | no             |
| `OperationalContextRow` | cast                     | no                       | no             |
| `EffectiveContext`      | estructural              | cast de RPC              | no             |
| row types Supabase      | estructural local        | comprobaciones parciales | no             |
| `SignatureResult`       | unión local              | comprobaciones parciales | no             |
| catálogo futuro         | definido documentalmente | pendiente                | requerido      |

La futura compatibilidad no podrá basarse solo en semver del paquete. Deberá validar versión de catálogo, schema, RPC y consumidores.

---

#### 16. Decisión por superficie

| ID                | Superficie          | Estado contractual                                     | Decisión de esta tarea                  | Bloqueo o condición de salida                                           |
| ----------------- | ------------------- | ------------------------------------------------------ | --------------------------------------- | ----------------------------------------------------------------------- |
| `TYPE-SURFACE-01` | SHELL runtime       | contratos propios y evaluador local                    | `MANTENER_COMO_EVIDENCIA`               | reconciliar app codes, decisiones y RPC en `SHELL-AUD-010`              |
| `TYPE-SURFACE-02` | VISO                | guard y role override extendidos; admin client         | `PRESERVAR_EXTENSIONES_EXPLICITAS`      | adapters y contratos deben conservar necesidades administrativas        |
| `TYPE-SURFACE-03` | NEXO                | mayor cantidad de contratos operativos locales         | `PRESERVAR_DOMINIO_SEPARADO`            | separar contexto y excepciones de logística de la base común            |
| `TYPE-SURFACE-04` | FOGO                | familia base con configuración local divergente        | `MIGRACION_REQUERIDA`                   | resolver roles, cookie y tipos compartidos sin asumir paridad           |
| `TYPE-SURFACE-05` | ORIGO               | familia base y excepción pública local                 | `PRESERVAR_EXTENSION_LOCAL`             | contrato común no debe absorber reglas de PDF o compras                 |
| `TYPE-SURFACE-06` | PULSO               | guard distinto, cliente alterno y adapter mínimo `rpc` | `PRESERVAR_NECESIDAD_DE_ADAPTER_MINIMO` | confirmar frontera y consumidores antes de migrar o retirar             |
| `TYPE-SURFACE-07` | NUMERA              | familia base con tipos y textos locales                | `MIGRACION_REQUERIDA`                   | normalizar identidades y contratos sin perder densidad financiera local |
| `TYPE-SURFACE-08` | plantilla AppShell  | tipos históricos copiados                              | `FUENTE_NO_AUTORITATIVA`                | clasificar en `SHELL-AUD-010`; no propagar automáticamente              |
| `TYPE-SURFACE-09` | `@vento/os-context` | paquete parcial sin adopción runtime                   | `TRANSICION_A_RECONCILIAR`              | definir compatibilidad, destino y consumidores antes de cambiarlo       |

**Conciliación:** 9 superficies esperadas, 9 decisiones materializadas, 0 omitidas y 0 identificadores duplicados.

---

#### 17. Handoffs contractuales obligatorios

| Materia                                           | Destino                                         |
| ------------------------------------------------- | ----------------------------------------------- |
| raíz física de contratos compartidos              | `SHELL-CON-001`                                 |
| códigos y metadata de aplicaciones                | `SHELL-CON-002`                                 |
| permisos, alias, legacy y retirados               | `SHELL-CON-003`; `AUTH-CAT-018`; `AUTH-CAT-019` |
| roles base y operativos                           | `SHELL-CON-004`; `SHELL-CON-005`                |
| scopes territoriales y funcionales                | `SHELL-CON-006`                                 |
| contexto, sesión, dispositivo y simulación        | `SHELL-CON-007`; `SHELL-CTX-001`                |
| errores, razones y diagnósticos                   | `SHELL-CON-008`; `SHELL-CTX-005`                |
| identificadores de pantalla y navegación          | `SHELL-CON-011`                                 |
| mecanismo de distribución                         | `SHELL-PKG-001` a `SHELL-PKG-008`               |
| adapters de servidor y cliente                    | `SHELL-AUTH-002`                                |
| scope por solicitud y versión aplicada            | `SHELL-AUTH-003`                                |
| gates contra strings, casts y consumidores legacy | `SHELL-AUTH-004`                                |
| migración multi-repositorio                       | `SHELL-AUTH-005`                                |
| RPC y contexto autoritativos                      | `AUTH-DB-032` a `AUTH-DB-035`                   |
| disposición de cada familia                       | `SHELL-AUD-010`                                 |
| retiro condicionado a consumidores                | `SHELL-AUD-011`                                 |

No se crea ninguna tarea nueva. Todos los destinos existen en el roadmap canónico.

---

#### 18. Hallazgos y asignación exacta

| ID                | Hallazgo                                                                   | Estado                      | Riesgo                                                | Destino exacto                                                      |
| ----------------- | -------------------------------------------------------------------------- | --------------------------- | ----------------------------------------------------- | ------------------------------------------------------------------- |
| `H-SHELL-009-001` | `@vento/contracts` no existe físicamente                                   | `CONFIRMADO`                | contratos normativos sin artefacto consumible         | `SHELL-CON-001`; `AUTH-CAT-017`                                     |
| `H-SHELL-009-002` | `@vento/os-context` existe como paquete privado parcial                    | `CONFIRMADO`                | adopción prematura como contrato completo             | `SHELL-AUTH-001`; `SHELL-CTX-001`                                   |
| `H-SHELL-009-003` | no se confirmaron consumidores runtime de `@vento/os-context`              | `SIN_CONSUMIDOR_CONFIRMADO` | paquete transitorio sin adopción o retiro inseguro    | `SHELL-AUTH-003`; `SHELL-AUTH-005`; `SHELL-AUD-011`                 |
| `H-SHELL-009-004` | los códigos de aplicación permanecen en strings y uniones locales          | `CONFIRMADO`                | catálogo divergente y destinos inválidos              | `SHELL-CON-002`; `SHELL-AUTH-004`                                   |
| `H-SHELL-009-005` | `AppSwitcherItem` se redeclara dieciocho veces en runtimes                 | `CONFIRMADO`                | deriva de campos, estados y marca                     | `SHELL-CON-002`; `SHELL-UI-002`; `SHELL-AUTH-005`                   |
| `H-SHELL-009-006` | `VentoEntity` no equivale al conjunto canónico de aplicaciones             | `CONFIRMADO`                | tipos aparentemente cerrados con cobertura incorrecta | `SHELL-CON-002`; `SHELL-UI-002`                                     |
| `H-SHELL-009-007` | colores y labels de marca están embebidos en logos y catálogos locales     | `CONFIRMADO`                | identidad visual divergente                           | `SHELL-CON-002`; `SHELL-UI-002`                                     |
| `H-SHELL-009-008` | `IconName` no está versionado ni unificado                                 | `CONFIRMADO`                | iconos omitidos o degradados silenciosamente          | `SHELL-UI-001`; `SHELL-AUD-010`                                     |
| `H-SHELL-009-009` | `NavigationRow` omite cuatro campos funcionales del esquema                | `CONFIRMADO`                | pérdida de identidad y comportamiento de navegación   | `SHELL-CON-011`; `SHELL-UI-002`; `SHELL-AUTH-005`                   |
| `H-SHELL-009-010` | `NavItem` usa `href` como destino e identidad y permiso como string        | `CONFIRMADO`                | keys inestables y permiso no validado                 | `SHELL-CON-003`; `SHELL-CON-011`; `SHELL-UI-002`                    |
| `H-SHELL-009-011` | `NavGroup` usa label visible como identidad                                | `CONFIRMADO`                | renombrar texto altera agrupación                     | `SHELL-CON-011`; `SHELL-UI-002`                                     |
| `H-SHELL-009-012` | `OperatingGate` mezcla estado contextual, bloqueo, texto y navegación      | `CONFIRMADO`                | UI convertida en fuente de decisión                   | `SHELL-CON-007`; `SHELL-CON-008`; `SHELL-CTX-005`                   |
| `H-SHELL-009-013` | las dos APIs `PageHeaderProps` no son equivalentes                         | `CONFIRMADO`                | centralización que pierde responsive o acento         | `SHELL-UI-001`; `SHELL-AUD-010`                                     |
| `H-SHELL-009-014` | props y datos de `VentoLogo` permanecen locales                            | `CONFIRMADO`                | fallback y accesibilidad inconsistentes               | `SHELL-CON-002`; `SHELL-UI-002`                                     |
| `H-SHELL-009-015` | `SiteOption` y `EmployeeSiteRow` tienen nulabilidad y relación variables   | `CONFIRMADO`                | supuestos distintos sobre sede y join                 | `SHELL-CON-007`; `SHELL-CTX-003`; `SHELL-AUTH-005`                  |
| `H-SHELL-009-016` | existen tres contratos de entrada para `requireAppAccess`                  | `CONFIRMADO`                | flags incompatibles y acceso divergente               | `SHELL-AUTH-002`; `SHELL-AUTH-005`; `SHELL-AUD-010`                 |
| `H-SHELL-009-017` | el resultado de guard es inferido y no exportado                           | `CONFIRMADO`                | consumidores acoplados a forma accidental             | `SHELL-CON-007`; `SHELL-CON-008`; `SHELL-AUTH-002`                  |
| `H-SHELL-009-018` | `PermissionKey` no existe como tipo runtime canónico                       | `CONFIRMADO`                | permisos huérfanos, alias o legacy aceptados          | `SHELL-CON-003`; `AUTH-CAT-018`; `SHELL-AUTH-004`                   |
| `H-SHELL-009-019` | evaluación booleana fusiona error técnico y denegación                     | `CONFIRMADO`                | diagnóstico y auditoría incompletos                   | `SHELL-CON-008`; `SHELL-AUTH-002`; `AUTH-DB-034`                    |
| `H-SHELL-009-020` | `OperationalSession` repite discriminante y no estrecha campos             | `CONFIRMADO`                | combinaciones inválidas representables                | `SHELL-CON-007`; `SHELL-CTX-001`; `SHELL-AUTH-005`                  |
| `H-SHELL-009-021` | `OperationalContextRow` se castea sin schema runtime                       | `CONFIRMADO`                | deriva RPC no detectada                               | `SHELL-CON-007`; `SHELL-CON-008`; `AUTH-DB-033`                     |
| `H-SHELL-009-022` | `EffectiveContext` mantiene strings abiertas y cast de RPC                 | `CONFIRMADO`                | paquete compartido con validación insuficiente        | `SHELL-CTX-001`; `SHELL-AUTH-002`                                   |
| `H-SHELL-009-023` | `ContextSimulationInput` no representa autorización ni versión             | `CONFIRMADO`                | simulación ambigua o no atribuible                    | `SHELL-CON-004`; `SHELL-CON-005`; `SHELL-CON-007`; `SHELL-AUTH-002` |
| `H-SHELL-009-024` | cuatro modelos de contexto coexisten sin equivalencia demostrada           | `CONFIRMADO`                | decisiones distintas para la misma sesión             | `SHELL-CTX-001`; `SHELL-AUTH-001`; `AUTH-DB-033`; `SHELL-AUTH-005`  |
| `H-SHELL-009-025` | roles UI y servidor no comparten validación canónica                       | `CONFIRMADO`                | rol desconocido o mezcla base/operativo               | `SHELL-CON-004`; `SHELL-CON-005`; `SHELL-AUTH-004`                  |
| `H-SHELL-009-026` | scopes y metadatos territoriales son strings locales                       | `CONFIRMADO`                | comparación de alcance inconsistente                  | `SHELL-CON-006`; `AUTH-CAT-018`; `SHELL-AUTH-001`                   |
| `H-SHELL-009-027` | no se localizó `Database` generado ni clientes parametrizados              | `CONFIRMADO_EN_EL_CORTE`    | deriva de esquema no detectada por TypeScript         | `SHELL-CON-001`; `SHELL-AUTH-002`; `SHELL-AUTH-004`                 |
| `H-SHELL-009-028` | inputs y outputs RPC se declaran manualmente y se castean                  | `CONFIRMADO`                | incompatibilidad silenciosa de backend                | `SHELL-AUTH-002`; `AUTH-DB-032` a `AUTH-DB-035`                     |
| `H-SHELL-009-029` | `SignatureResult` es una unión útil pero local y no versionada             | `CONFIRMADO`                | duplicación de un contrato valioso                    | `SHELL-CON-007`; `SHELL-CON-008`; `SHELL-AUTH-002`                  |
| `H-SHELL-009-030` | SSO, retorno y protocolo no usan contrato común de destino                 | `CONFIRMADO`                | redirecciones incompatibles o inseguras               | `SHELL-CON-002`; `SHELL-CON-008`; `SHELL-AUTH-002`                  |
| `H-SHELL-009-031` | razones, errores y estados se representan con strings de niveles mezclados | `CONFIRMADO`                | mensajes, telemetría y decisiones no correlacionables | `SHELL-CON-008`; `SHELL-CTX-005`; `SHELL-AUTH-004`                  |
| `H-SHELL-009-032` | runtime no transporta versión, hash ni diagnóstico contractual             | `CONFIRMADO`                | paridad y reproducción de decisiones no demostrables  | `AUTH-CAT-017`; `AUTH-CAT-018`; `SHELL-AUTH-003`; `SHELL-PKG-004`   |

**Conciliación:** 32 hallazgos esperados, 32 materializados, 0 duplicados y 0 pendientes sin propietario.

---

#### 19. Decisiones vinculantes de esta auditoría

1. `@vento/contracts` permanece como raíz canónica futura; no se crea un paquete paralelo.
2. `@vento/os-context` se clasifica como implementación parcial transitoria, no como sustituto de `@vento/contracts`.
3. Ninguna unión local de aplicaciones, roles, permisos, scopes o razones se eleva a contrato canónico por cantidad de copias.
4. `AppCode`, `PermissionKey`, roles, scopes y códigos de error deberán derivarse de fuentes canónicas, no mantenerse manualmente.
5. Los contratos de navegación deberán conservar identidades estables del esquema y separar label, destino, pantalla y permiso.
6. Los tres inputs de guard deberán conservarse como variantes hasta diseñar una política discriminada que no pierda semántica.
7. El resultado de autorización deberá separar permitido, denegado, error técnico y bloqueo contextual.
8. `OperationalSession`, `OperationalContextRow`, `EffectiveContext` y `AccessContext` no se tratarán como alias equivalentes.
9. El contexto canónico deberá representar carril, actor, sede, área, turno, check-in, dispositivo, simulación, fuente, frescura y versión.
10. Base role, operational role, navigation role y simulation role serán identidades distintas.
11. El código cliente no podrá usar `ROLE_OPTIONS` como validación de servidor.
12. Los scopes deberán usar vocabulario cerrado y validación runtime.
13. Los clientes Supabase compartidos deberán admitir tipado `Database` y adapters mínimos según la necesidad del consumidor.
14. Los DTOs locales podrán conservarse cuando representen proyecciones de dominio, pero deberán derivarse o validarse contra el esquema autoritativo.
15. Las respuestas RPC no se aceptarán únicamente mediante cast.
16. `SignatureResult` se conserva como evidencia de una unión discriminada útil.
17. Los códigos de razón deberán separarse de mensajes humanos y diagnósticos técnicos.
18. La versión y hash del contrato aplicado deberán estar disponibles para decisión, auditoría y compatibilidad.
19. No se retira ningún tipo, helper o paquete durante esta tarea.
20. No se implementa ningún contrato ni se modifica código.
21. La clasificación física definitiva permanece reservada a `SHELL-AUD-010`.
22. `SHELL-PKG-001` permanece reservado hasta completar `SHELL-AUD-011`.

---

#### 20. Carryovers obligatorios

| Carryover                                                     | Estado                       | Propietario                       | Condición de salida                                            |
| ------------------------------------------------------------- | ---------------------------- | --------------------------------- | -------------------------------------------------------------- |
| elegir qué identidades se comparten, generan o quedan locales | `PENDIENTE_DE_CLASIFICACION` | `SHELL-AUD-010`                   | matriz de disposición por las 34 identidades                   |
| confirmar consumidores antes de retirar contratos o paquetes  | `PENDIENTE_DE_EVIDENCIA`     | `SHELL-AUD-011`                   | inventario reproducible de imports, carga dinámica y framework |
| crear `@vento/contracts`                                      | `NO_IMPLEMENTADO`            | `SHELL-CON-001`                   | paquete, exports, schemas y versionado disponibles             |
| centralizar códigos y tipos de autorización                   | `NO_IMPLEMENTADO`            | `SHELL-CON-002` a `SHELL-CON-008` | contratos consumibles y validados                              |
| reconciliar `@vento/os-context`                               | `PARCIAL_TRANSITORIO`        | `SHELL-AUTH-001`; `SHELL-CTX-001` | SDK único y compatibilidad definida                            |
| implementar adapters y validación runtime                     | `NO_IMPLEMENTADO`            | `SHELL-AUTH-002`                  | adapters server/client con parsers y errores estructurados     |
| bloquear nuevos strings y casts legacy                        | `NO_IMPLEMENTADO`            | `SHELL-AUTH-004`                  | lint y gates multi-repositorio activos                         |
| migrar consumidores                                           | `NO_IMPLEMENTADO`            | `SHELL-AUTH-005`                  | adopción por repositorio con rollback y paridad                |
| alinear RPC y contexto autoritativo                           | `NO_IMPLEMENTADO`            | `AUTH-DB-032` a `AUTH-DB-035`     | firmas, decisión, frescura y evidencia implementadas           |

Ningún carryover queda expresado como “después” sin tarea, propietario y condición de salida.

---

#### 21. Trazabilidad con requisitos vigentes

La auditoría consume sin modificar requisitos existentes:

| Requisito        | Cobertura aplicada                                                  |
| ---------------- | ------------------------------------------------------------------- |
| `TREQ-AUTH-001`  | autorización mediante permisos, contexto y alcance canónicos        |
| `TREQ-AUTH-002`  | todo permiso consumido debe existir en el catálogo vigente          |
| `TREQ-AUTH-004`  | paridad entre evaluadores para el mismo actor y contexto            |
| `TREQ-AUTH-008`  | separación entre capacidad administrativa y operativa               |
| `TREQ-AUTH-009`  | sede y área efectivas deterministas                                 |
| `TREQ-AUTH-011`  | actor y dispositivo compartido con autoridad intersectada           |
| `TREQ-AUTH-012`  | simulación separada de autoridad real                               |
| `TREQ-AUTH-013`  | servidor, RPC y RLS revalidan la acción exacta                      |
| `TREQ-AUTH-014`  | invalidación por cambio de contexto o sesión                        |
| `TREQ-AUTH-015`  | evidencia de decisión, razones y versión contractual                |
| `TREQ-SHELL-002` | clasificación y paridad de responsabilidades compartidas            |
| `TREQ-SHELL-003` | catálogo único de aplicaciones y metadatos                          |
| `TREQ-SHELL-004` | retiro solo con evidencia completa de consumidores                  |
| `TREQ-SHELL-006` | compatibilidad de paquetes y consumidores                           |
| `TREQ-SHELL-007` | rollback independiente y compatibilidad entre versiones             |
| `TREQ-SHELL-008` | integridad del registro de pruebas y declaración de impacto         |
| `TREQ-SHELL-009` | evidencia reproducible por repositorio, commit y ambiente           |
| `TREQ-SHELL-028` | catálogo único entre launcher, template y runtimes                  |
| `TREQ-SHELL-029` | plantilla separada de runtime y con procedencia explícita           |
| `TREQ-SHELL-030` | visibilidad derivada de permisos y contexto                         |
| `TREQ-SHELL-031` | selección de sede y simulación no conceden autoridad                |
| `TREQ-SHELL-032` | reconciliación de primitivas compartidas antes de adopción o retiro |
| `TREQ-SHELL-034` | destinos absolutos gobernados por catálogo activo                   |
| `TREQ-SHELL-035` | integridad de nombres, estados y codificación                       |

Esta tarea aporta inventario, comparación y handoffs. No cambia identificador, regla, riesgo, modalidad, responsable, paquete, repositorio, estado, artefacto, resultado, evidencia ni relación de ninguna fila.

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** las brechas de catálogo, contratos compartidos, permisos, contexto, scopes, simulación, dispositivos, errores, compatibilidad, versionado, evidencia y retiro seguro ya están cubiertas por los requisitos vigentes enumerados en la sección anterior. La tarea no introduce comportamiento ejecutable ni descubre una regla verificable sin cobertura previa.

Se generan:

- **0** altas `TREQ-*`;
- **0** modificaciones;
- **0** diferimientos;
- **0** descartes;
- **0** obsolescencias.

No corresponde generar una copia del registro `04A`.

---

#### 22. Criterios de aceptación

`SHELL-AUD-009` se considera materialmente completa porque:

- los siete runtimes, la plantilla y el paquete parcial están representados una sola vez;
- las treinta y cuatro identidades contractuales tienen estado, brecha y destino;
- las identidades canónicas se separan de tipos locales y estructuras inferidas;
- `@vento/contracts` y `@vento/os-context` están diferenciados física y semánticamente;
- se documenta la ausencia de consumidores runtime confirmados del paquete parcial;
- se concilian las dieciocho redeclaraciones runtime de `AppSwitcherItem`;
- se comparan aplicación, marca, iconos, navegación, gate y componentes estructurales;
- se materializan las tres variantes de entrada del guard;
- se identifica el resultado de guard como contrato inferido;
- se compara el contrato de permisos, su entrada string y su salida booleana;
- los cuatro modelos de contexto se mantienen separados;
- `OperationalSession` se evalúa como copia idéntica sin asumir autoridad canónica;
- `OperationalContextRow` y `EffectiveContext` se registran con sus casts y strings abiertas;
- roles base, operativos, de navegación y simulación quedan separados conceptualmente;
- scopes, site type y area kind tienen destino canónico;
- se documenta la ausencia de `Database` generado y generics en clientes;
- los row types y contratos RPC manuales tienen handoff exacto;
- `SignatureResult` se preserva como contrato local útil;
- errores, razones, mensajes y diagnósticos se clasifican por nivel;
- versión, hash y diagnóstico contractual tienen destino explícito;
- las nueve superficies tienen decisión materializada;
- los treinta y dos hallazgos tienen propietario y condición de resolución;
- no se crea ninguna tarea ni requisito nuevo;
- se declaran cero cambios `TREQ-*`;
- no se modifica código, tipos, contratos, paquetes, Supabase, CI, despliegues ni continuidad;
- `SHELL-AUD-010` permanece como única continuidad inmediata reservada.

---

#### 23. Resultado y continuidad

La cadena comparativa resultante es:

```text
identidad empresarial
→ contrato normativo
→ tipo físico o forma inferida
→ consumidor runtime
→ validación compile-time
→ validación runtime
→ versión y hash
→ compatibilidad y error
→ disposición en SHELL-AUD-010
→ migración mediante contratos, SDK y paquetes
```

La única continuidad inmediata reservada es:

```text
SHELL-AUD-010 — Clasificar compartir / generar / mantener local
```

El handoff `SHELL-PKG-001` permanece reservado exclusivamente para después de completar `SHELL-AUD-011`.


### ✅ SHELL-AUD-010 — Clasificar compartir / generar / mantener local

**Estado:** APROBADA
**Bloque:** H — Fundación compartida
**Tipo:** decisión documental de disposición arquitectónica para familias físicas, contratos, tipos y variantes compartidas
**Entrada de continuidad:** `SHELL-AUD-009 — Comparar tipos y contratos`
**Continuidad inmediata reservada:** `SHELL-AUD-011 — Clasificar y retirar rutas, componentes, funciones, scripts y endpoints sin consumidores confirmados`
**Handoff posterior al segmento `SHELL-AUD-001..011`:** `SHELL-PKG-001 — Elegir mecanismo de distribución`
**Fecha de corte:** 2026-08-01
**Commit documental canónico:** `d42f9a1e6d74523c3cdf0a7aece870075d442d8c`
**Cambios en código, tipos, contratos, paquetes, configuración, CI, despliegues, datos o Supabase:** no autorizados ni realizados

---

#### 1. Resultado de esta tarea

Esta tarea convierte los inventarios y comparaciones de `SHELL-AUD-001` a `SHELL-AUD-009` en una decisión explícita por identidad. La disposición no se determina por nombre de archivo, cantidad de copias o igualdad de hash, sino por fuente de verdad, estabilidad transversal, necesidad de generación determinista y legitimidad de las extensiones locales.

| Métrica                                          |    Resultado |
| ------------------------------------------------ | -----------: |
| Familias físicas heredadas                       |       **26** |
| Familias clasificadas `COMPARTIR`                |       **18** |
| Familias clasificadas `GENERAR`                  |        **1** |
| Familias clasificadas `MANTENER_LOCAL`           |        **7** |
| Identidades contractuales heredadas              |       **34** |
| Contratos clasificados `COMPARTIR`               |       **20** |
| Contratos clasificados `GENERAR`                 |       **13** |
| Contratos clasificados `MANTENER_LOCAL`          |        **1** |
| Variantes Supabase heredadas                     |       **16** |
| Variantes Supabase clasificadas `COMPARTIR`      |        **8** |
| Variantes Supabase clasificadas `MANTENER_LOCAL` |        **8** |
| Superficies con rol de transición explícito      |   **9 de 9** |
| Decisiones de disposición materializadas         | **76 de 76** |
| Hallazgos con destino exacto                     |       **24** |
| Cambios `TREQ-*`                                 |        **0** |

Resultado central:

```text
COMPARTIR
→ comportamiento transversal estable
→ una implementación versionada
→ configuración y extensiones explícitas

GENERAR
→ identidad o forma derivada de catálogo, schema, migraciones o manifiesto
→ salida determinista
→ edición manual prohibida

MANTENER_LOCAL
→ entrypoint, orquestación, view model o regla de dominio propia
→ consume contratos compartidos y artefactos generados
→ no duplica fuentes de verdad
```

No se adopta ningún blob actual como fuente canónica completa. Los archivos mixtos se descomponen: el núcleo transversal se comparte o genera y la composición o extensión empresarial permanece local.

---

#### 2. Fuentes y corte reproducible

| Fuente                                              | Uso                                                                |
| --------------------------------------------------- | ------------------------------------------------------------------ |
| `docs/plan-canonico/modular/01_PROTOCOLO.md`        | continuidad, integridad, trazabilidad y requisitos de prueba       |
| `docs/plan-canonico/modular/delivery-contract.json` | contrato físico del artefacto                                      |
| `docs/plan-canonico/modular/active-sequence.json`   | segmento vigente y handoff posterior                               |
| `00_CABECERA_Y_ESTADO.md`                           | confirmación de tarea actual y siguiente reservada                 |
| `01_AUDITORIA_DE_COMPONENTES_COMPARTIDOS.md`        | propietario y tareas `SHELL-AUD-001..009` aprobadas                |
| `SHELL-AUD-001`                                     | 26 familias físicas y 190 decisiones de presencia                  |
| `SHELL-AUD-002` a `SHELL-AUD-005`                   | guards, permisos, contexto y role override                         |
| `SHELL-AUD-006` y `SHELL-AUD-007`                   | AppShell, navegación, UI, CSS y extensiones                        |
| `SHELL-AUD-008`                                     | 7 familias Supabase, 28 ocurrencias y 16 variantes                 |
| `SHELL-AUD-009`                                     | 34 identidades contractuales y 9 superficies                       |
| `02_DISTRIBUCION_Y_PAQUETES_COMPARTIDOS.md`         | tareas de distribución, versionado, compatibilidad y rollback      |
| `03_CONTRATOS_COMPARTIDOS.md`                       | destinos `SHELL-CON-001..016`                                      |
| `03_AUTORIZACION_Y_CONTEXTO_COMPARTIDOS.md`         | frontera de `@vento/contracts`, `@vento/os-context` y Supabase     |
| `07_COMPONENTES_WEB_COMPARTIDOS.md`                 | destino de componentes y patrones web                              |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`  | cobertura vigente; blob `fb8d32142299fd74619a7a8b63884cc735a11fbf` |
| `package.json` y `validate-task-delivery.mjs`       | scripts y reglas de validación aplicables                          |

Commits runtime heredados y no modificados por esta tarea:

| Superficie | Repositorio                  | Commit                                     |
| ---------- | ---------------------------- | ------------------------------------------ |
| SHELL      | `devVentoGroup/vento-shell`  | `d42f9a1e6d74523c3cdf0a7aece870075d442d8c` |
| VISO       | `devVentoGroup/vento-viso`   | `47322403f3c64e83ae0c4a2f68c05d47093e5bb4` |
| NEXO       | `devVentoGroup/vento-nexo`   | `142c4d696221e3ce3fda4ed3b62f3d1fe5b58799` |
| FOGO       | `devVentoGroup/vento-fogo`   | `b6b9ed00e5267cabaac1a5a1090d93d5f60e86f2` |
| ORIGO      | `devVentoGroup/vento-origo`  | `b7a8303fa078ef087f522b6c99059ababfc27472` |
| PULSO      | `devVentoGroup/vento-pulso`  | `71e0184486b5fe11e0a42435baf4024807a80efd` |
| NUMERA     | `devVentoGroup/vento-numera` | `1b48a5da425d92e19ed89cf175b1dccc4cd960e1` |

El commit documental actual incorpora `SHELL-AUD-009` y no cambia los archivos runtime clasificados.

---

#### 3. Continuidad interpretada

```text
SHELL-AUD-001
→ ...
→ SHELL-AUD-009 aprobada
→ SHELL-AUD-010 actual
→ SHELL-AUD-011 inmediata reservada
→ SHELL-PKG-001
```

`SHELL-AUD-011` es la única continuidad inmediata. `SHELL-PKG-001` continúa siendo el handoff posterior al cierre completo del segmento `SHELL-AUD-001..011`. Esta tarea no modifica `active-sequence.json`.

---

#### 4. Taxonomía vinculante de disposición

| Disposición      | Criterio positivo                                                                                         | Prohibición                                                                         | Resultado físico esperado                                                |
| ---------------- | --------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- | ------------------------------------------------------------------------ |
| `COMPARTIR`      | comportamiento transversal, estable y consumido por más de una superficie o requerido como frontera única | copiar el archivo a cada repositorio o permitir forks silenciosos                   | paquete versionado con API, configuración, pruebas y compatibilidad      |
| `GENERAR`        | identidad, unión, schema, manifest o DTO derivable de una fuente canónica                                 | editar manualmente la salida o mantener un enum paralelo                            | artefacto determinista, reproducible y verificado contra su fuente       |
| `MANTENER_LOCAL` | entrypoint, composición, view model o extensión empresarial propia de una aplicación                      | convertir la localidad en permiso para duplicar catálogos, autorización o contratos | archivo propietario que importa núcleo compartido y artefactos generados |

Subclasificaciones permitidas dentro de la disposición primaria:

- `COMPARTIR_CON_CONFIG_LOCAL`;
- `COMPARTIR_RESTRINGIDO_SERVER_ONLY`;
- `COMPARTIR_TRANSITORIO`;
- `GENERAR_CON_ADAPTER_LOCAL`;
- `MANTENER_LOCAL_CON_NUCLEO_COMPARTIDO`;
- `MANTENER_LOCAL_EN_CUARENTENA`.

Estas subclasificaciones no crean una cuarta disposición.

---

#### 5. Fronteras de propiedad resultantes

```text
@vento/contracts
→ catálogos, schemas, códigos, tipos derivados, manifest, hashes y diagnósticos

@vento/os-context
→ guards, adapters, contexto, autorización, SSO, firma y clientes Supabase compartidos

@vento/ui-web
→ primitivas, Chrome, AppSwitcher, ProfileMenu, PageHeader, VentoLogo y CSS base

REPOSITORIO DE CADA APLICACIÓN
→ layout, middleware, compositor server, tema, estilos de dominio, view models y extensiones empresariales

GENERADORES EN vento-shell
→ aplicaciones, permisos, roles, scopes, Database, RPC y artefactos de publicación
```

No se crean `@vento/auth`, `@vento/operational-context` ni otro núcleo paralelo.

---

#### 6. Matriz completa de las 26 familias físicas
| ID        | Familia                                          | Disposición    | Responsabilidad que conserva                                                                | Descomposición obligatoria                                                                                     | Destino                                                                               |
| --------- | ------------------------------------------------ | -------------- | ------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- |
| `FAM-001` | `src/app/layout.tsx`                             | MANTENER_LOCAL | Entrypoint de framework, metadata, fuentes y scripts propios por aplicación.                | Consumir políticas compartidas mediante imports; no copiar el layout completo.                                 | `SHELL-UI-010`; `SHELL-PKG-001`; `SHELL-AUTH-005`                                     |
| `FAM-002` | `src/app/globals.css`                            | MANTENER_LOCAL | Entrypoint CSS, tema y estilos de dominio permanecen por aplicación.                        | Importar tokens, reset, primitivas y capas base versionadas desde `@vento/ui-web`.                             | `SHELL-UI-001`; `SHELL-PKG-004`; `SHELL-PKG-008`                                      |
| `FAM-003` | `src/components/vento/standard/vento-shell.tsx`  | MANTENER_LOCAL | Compositor server por aplicación: consultas, navegación, contexto y extensiones de dominio. | Sustituir tipos, catálogos y componentes copiados por contratos y componentes compartidos.                     | `SHELL-UI-010`; `SHELL-CON-002`; `SHELL-CON-007`; `SHELL-CON-011`; `SHELL-AUTH-005`   |
| `FAM-004` | `src/components/vento/standard/vento-chrome.tsx` | COMPARTIR      | Chrome presentacional y estructura común del AppShell.                                      | Exponer slots y configuración tipada; textos, navegación y extensiones se inyectan.                            | `SHELL-UI-001`; `SHELL-UI-010`; `SHELL-UI-011`                                        |
| `FAM-005` | `src/components/vento/standard/ui.tsx`           | COMPARTIR      | Primitivas `Button`, `Card`, `Input`, `Select` y `Badge`.                                   | Publicar junto con su contrato CSS, estados, accesibilidad y compatibilidad.                                   | `SHELL-UI-001`; `SHELL-UI-003`; `SHELL-UI-004`; `SHELL-PKG-008`                       |
| `FAM-006` | `src/components/vento/standard/table.tsx`        | COMPARTIR      | Wrappers semánticos de tabla HTML.                                                          | Mantener separada la tabla semántica de componentes avanzados de datos.                                        | `SHELL-UI-001`; `SHELL-PKG-006`; `SHELL-PKG-008`                                      |
| `FAM-007` | `src/components/vento/standard/app-switcher.tsx` | COMPARTIR      | Componente de selección de aplicaciones.                                                    | Consumir metadata generada del catálogo y estado de acceso calculado; no contener catálogo manual.             | `SHELL-UI-001`; `SHELL-CON-002`; `SHELL-AUTH-005`                                     |
| `FAM-008` | `src/components/vento/standard/profile-menu.tsx` | COMPARTIR      | Estructura común de perfil, sesión, sede y acciones.                                        | Exponer acciones por slots o capacidades; placeholders y acciones locales permanecen fuera del núcleo.         | `SHELL-UI-001`; `SHELL-UI-010`; `SHELL-AUTH-005`; `SHELL-AUD-011`                     |
| `FAM-009` | `src/lib/auth/guard.ts`                          | COMPARTIR      | Adapter server de autenticación, contexto y autorización.                                   | Reemplazar tres firmas por una política discriminada; conservar extensiones como parámetros explícitos.        | `SHELL-AUTH-001`; `SHELL-AUTH-002`; `SHELL-AUTH-005`                                  |
| `FAM-010` | `src/lib/auth/permissions.ts`                    | COMPARTIR      | Adapter de evaluación y compatibilidad temporal.                                            | Aceptar `PermissionKey` generada y retornar decisión estructurada; el constructor string queda legacy.         | `SHELL-CON-003`; `SHELL-CON-008`; `SHELL-AUTH-002`; `SHELL-AUTH-004`                  |
| `FAM-011` | `src/lib/auth/operational-session.ts`            | COMPARTIR      | Adapter transitorio de sesión operativa repetido byte a byte.                               | Reconciliar con `AccessContext@1.0.0`; no declararlo fuente autoritativa.                                      | `SHELL-CTX-001`; `SHELL-CON-007`; `SHELL-AUTH-005`                                    |
| `FAM-012` | `src/lib/auth/role-override.ts`                  | COMPARTIR      | Módulo común de simulación/override y evaluación por rol.                                   | Extraer la excepción logística NEXO a una política local declarada; usar roles y scopes canónicos.             | `SHELL-AUTH-001`; `SHELL-CON-004`; `SHELL-CON-005`; `SHELL-CON-006`; `SHELL-AUTH-005` |
| `FAM-013` | `src/lib/auth/role-override-config.ts`           | GENERAR        | Roles, etiquetas, elegibilidad y metadata deben derivarse de fuentes canónicas.             | Eliminar listas manuales divergentes; la política de cookie queda en el SDK, no en catálogos por app.          | `SHELL-CON-002`; `SHELL-CON-004`; `SHELL-CON-005`; `AUTH-CAT-018`; `SHELL-AUTH-004`   |
| `FAM-014` | `src/lib/supabase/client.ts`                     | COMPARTIR      | Factory browser con ciclo de vida y política de cookies configurables.                      | La aplicación aporta configuración validada; el factory no incorpora lógica de dominio.                        | `SHELL-AUTH-002`; `SHELL-PKG-004`; `SHELL-AUTH-005`                                   |
| `FAM-015` | `src/lib/supabase/server.ts`                     | COMPARTIR      | Factory server con contrato único de cookies, host y errores.                               | Conservar host-aware como política configurable y producir diagnóstico observable.                             | `SHELL-AUTH-002`; `SHELL-CON-008`; `SHELL-AUTH-005`                                   |
| `FAM-016` | `middleware.ts`                                  | MANTENER_LOCAL | Entrypoint y matcher pertenecen a cada aplicación y a su superficie de rutas.               | Componer adapters compartidos; separar kiosco, PDF y otras políticas empresariales del refresco de sesión.     | `SHELL-AUTH-002`; `SHELL-AUTH-004`; `SHELL-AUTH-005`                                  |
| `FAM-017` | `src/lib/supabase/proxy.ts`                      | MANTENER_LOCAL | Artefacto en cuarentena sin invocación externa confirmada.                                  | No promover, compartir ni retirar hasta completar evidencia de imports, framework y carga dinámica.            | `SHELL-AUD-011`                                                                       |
| `FAM-018` | `src/lib/auth/operational-context.ts`            | MANTENER_LOCAL | Adapter especializado de NEXO y compatibilidad con su RPC actual.                           | Mantener como frontera legacy local hasta migrar al contexto autoritativo; no elevar su mutación local al SDK. | `SHELL-CTX-001`; `SHELL-CTX-002`; `SHELL-CTX-003`; `AUTH-DB-033`; `SHELL-AUTH-005`    |
| `FAM-019` | `src/components/vento/standard/page-header.tsx`  | COMPARTIR      | Componente base reconciliado a partir de responsividad NEXO y acento VISO.                  | Publicar una sola API; ningún blob actual se adopta sin reconciliación.                                        | `SHELL-UI-001`; `SHELL-PKG-006`; `SHELL-AUD-011`                                      |
| `FAM-020` | `src/components/vento/standard/vento-logo.tsx`   | COMPARTIR      | Componente de marca y representación gráfica común.                                         | Consumir aplicación, label, color y assets generados; eliminar fallbacks centrados en una app.                 | `SHELL-CON-002`; `SHELL-UI-001`; `SHELL-UI-002`; `SHELL-AUTH-005`                     |
| `FAM-021` | `src/lib/auth/request-host.ts`                   | COMPARTIR      | Utilidad de host local y protocolo requerida por SSO y cookies.                             | Publicar como utilidad server sin defaults de una aplicación.                                                  | `SHELL-AUTH-002`; `SHELL-CON-008`; `SHELL-PKG-004`                                    |
| `FAM-022` | `src/lib/auth/shared-device-signature.ts`        | COMPARTIR      | Adapter de firma de actor en dispositivo compartido.                                        | Conservar la unión discriminada, tipar app/acción/target y separar mensajes de códigos.                        | `SHELL-CON-007`; `SHELL-CON-008`; `SHELL-AUTH-002`; `AUTH-DEV-007` a `AUTH-DEV-016`   |
| `FAM-023` | `src/lib/auth/sso.ts`                            | COMPARTIR      | Constructor y validador común de destinos SSO y `returnTo`.                                 | URLs de aplicaciones provienen del catálogo; política local solo mediante configuración explícita.             | `SHELL-CON-002`; `SHELL-CON-008`; `SHELL-AUTH-002`; `SHELL-AUTH-005`                  |
| `FAM-024` | `src/lib/supabase/admin.ts`                      | COMPARTIR      | Factory restringido, `server-only`, para service role.                                      | Publicar como frontera privilegiada separada; consumidores y autorización administrativa siguen locales.       | `SHELL-AUTH-002`; `SHELL-AUTH-003`; `SHELL-AUTH-005`                                  |
| `FAM-025` | `src/lib/supabase/employee-sites.ts`             | COMPARTIR      | Normalizador semánticamente común de relación `employee_sites → sites`.                     | Mantenerlo transitorio y tipado contra `Database`; retirarlo solo si la generación elimina su necesidad.       | `SHELL-CON-007`; `SHELL-AUTH-002`; `SHELL-AUTH-005`; `SHELL-AUD-011`                  |
| `FAM-026` | `src/utils/supabase/client.ts`                   | MANTENER_LOCAL | Cliente alterno PULSO en cuarentena y sin consumidor confirmado.                            | No promover ni retirar antes del inventario de `SHELL-AUD-011`.                                                | `SHELL-AUD-011`                                                                       |

**Conciliación:** 26 familias esperadas, 26 materializadas, 0 faltantes y 0 duplicadas. Distribución: **18 COMPARTIR**, **1 GENERAR** y **7 MANTENER_LOCAL**.

---

#### 7. Matriz completa de las 34 identidades contractuales
| ID             | Contrato o tipo                              | Disposición    | Regla materializada                                                                                         | Destino                                                              |
| -------------- | -------------------------------------------- | -------------- | ----------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------- |
| `TYPE-CON-001` | `AppCode`                                    | GENERAR        | Catálogo publicado de aplicaciones.                                                                         | `SHELL-CON-002`; `AUTH-CAT-018`                                      |
| `TYPE-CON-002` | definición de aplicación / `AppSwitcherItem` | GENERAR        | Generar identidad, nombre, dominio, estado, URL y marca; derivar una proyección runtime de acceso.          | `SHELL-CON-002`; `SHELL-UI-002`; `SHELL-AUTH-005`                    |
| `TYPE-CON-003` | `VentoEntity`                                | GENERAR        | Derivar de `AppCode` y del registro de marca; `default` no es aplicación canónica.                          | `SHELL-CON-002`; `SHELL-UI-002`                                      |
| `TYPE-CON-004` | `IconName`                                   | COMPARTIR      | Vocabulario versionado y parser en `@vento/ui-web`; no depende de strings libres de navegación.             | `SHELL-UI-001`; `SHELL-CON-011`                                      |
| `TYPE-CON-005` | `NavigationRow`                              | GENERAR        | Generar tipo de esquema/RPC y mapearlo mediante adapter; no publicarlo como contrato manual.                | `SHELL-CON-011`; `SHELL-AUTH-002`; `SHELL-AUTH-005`                  |
| `TYPE-CON-006` | `NavItem`                                    | COMPARTIR      | Contrato UI con identidad estable, destino, icono y `PermissionKey` generada.                               | `SHELL-CON-003`; `SHELL-CON-011`; `SHELL-UI-002`                     |
| `TYPE-CON-007` | `NavGroup`                                   | COMPARTIR      | Agrupación por identificador estable; label es presentación.                                                | `SHELL-CON-011`; `SHELL-UI-002`                                      |
| `TYPE-CON-008` | `OperatingGate`                              | MANTENER_LOCAL | View model de presentación derivado de contexto compartido; textos y acciones pertenecen a cada superficie. | `SHELL-CTX-005`; `SHELL-UI-015`; `SHELL-UI-016`                      |
| `TYPE-CON-009` | `PageHeaderProps`                            | COMPARTIR      | API única que conserva acento y respuesta adaptable.                                                        | `SHELL-UI-001`                                                       |
| `TYPE-CON-010` | `VentoLogoProps` / `VentoIconProps`          | COMPARTIR      | API de componente; entidad y datos de marca se reciben como tipos generados.                                | `SHELL-CON-002`; `SHELL-UI-002`                                      |
| `TYPE-CON-011` | `SiteOption`                                 | COMPARTIR      | Proyección segura y estable para UI/contexto, con nulabilidad única.                                        | `SHELL-CON-007`; `SHELL-CTX-003`                                     |
| `TYPE-CON-012` | `EmployeeSiteRow`                            | GENERAR        | Derivar del tipo `Database` o resultado RPC; no mantener relación manual objeto/arreglo.                    | `SHELL-CON-007`; `SHELL-AUTH-002`; `SHELL-AUTH-005`                  |
| `TYPE-CON-013` | `GuardOptions` base                          | COMPARTIR      | Entrada canónica tipada por app, permisos, contexto y política.                                             | `SHELL-CON-002`; `SHELL-CON-003`; `SHELL-CON-007`; `SHELL-AUTH-002`  |
| `TYPE-CON-014` | `GuardOptions` VISO                          | COMPARTIR      | Absorber su semántica en una unión discriminada, no conservar un flag paralelo.                             | `SHELL-AUTH-002`; `SHELL-AUTH-005`                                   |
| `TYPE-CON-015` | `GuardOptions` PULSO                         | COMPARTIR      | Absorber su semántica en la misma política discriminada y conservar el default de forma explícita.          | `SHELL-AUTH-002`; `SHELL-AUTH-005`                                   |
| `TYPE-CON-016` | resultado de `requireAppAccess`              | COMPARTIR      | Resultado público con usuario, contexto, decisión, versión, razones y correlación.                          | `SHELL-CON-007`; `SHELL-CON-008`; `SHELL-AUTH-002`                   |
| `TYPE-CON-017` | `PermissionContext`                          | COMPARTIR      | Contexto de evaluación tipado, con fuente y frescura; no sustituye `AccessContext`.                         | `SHELL-CON-006`; `SHELL-CON-007`; `SHELL-AUTH-002`                   |
| `TYPE-CON-018` | `PermissionKey` / entrada de permiso         | GENERAR        | Unión literal derivada del catálogo publicado; aliases, legacy y retirados permanecen categorías distintas. | `SHELL-CON-003`; `AUTH-CAT-018`; `AUTH-CAT-019`; `SHELL-AUTH-004`    |
| `TYPE-CON-019` | resultado de evaluación de permiso           | COMPARTIR      | Unión de permitido, denegado, error técnico y bloqueo contextual.                                           | `SHELL-CON-008`; `SHELL-AUTH-002`; `AUTH-DB-034`                     |
| `TYPE-CON-020` | `OperationalSession`                         | COMPARTIR      | Contrato transitorio discriminado que deberá converger hacia `AccessContext`.                               | `SHELL-CON-007`; `SHELL-CTX-001`; `SHELL-AUTH-005`                   |
| `TYPE-CON-021` | `OperationalContextRow`                      | GENERAR        | Derivar del contrato RPC versionado; NEXO conserva un adapter local, no un tipo manual autoritativo.        | `SHELL-CON-007`; `SHELL-CON-008`; `AUTH-DB-033`                      |
| `TYPE-CON-022` | `EffectiveContext`                           | COMPARTIR      | Reconciliar dentro de `@vento/os-context` con enums cerrados, parser y versión.                             | `SHELL-CON-004` a `SHELL-CON-008`; `SHELL-CTX-001`; `SHELL-AUTH-002` |
| `TYPE-CON-023` | `ContextSimulationInput`                     | COMPARTIR      | Entrada de simulación con actor autorizante, versión, alcance y duración validados.                         | `SHELL-CON-004`; `SHELL-CON-005`; `SHELL-CON-007`; `SHELL-AUTH-002`  |
| `TYPE-CON-024` | `AccessContext@1.0.0`                        | COMPARTIR      | Contrato canónico inmutable y versionado del contexto efectivo.                                             | `SHELL-CON-007`; `SHELL-AUTH-001`; `SHELL-CTX-001`; `AUTH-DB-033`    |
| `TYPE-CON-025` | rol base, rol operativo y `ROLE_OPTIONS`     | GENERAR        | Derivar códigos y etiquetas desde fuentes canónicas separadas por clase de rol.                             | `SHELL-CON-004`; `SHELL-CON-005`; `AUTH-CAT-018`; `SHELL-AUTH-004`   |
| `TYPE-CON-026` | `RolePermissionRow`                          | GENERAR        | Derivar de `Database`/RPC; cada adapter puede proyectar solo campos necesarios.                             | `SHELL-CON-006`; `SHELL-AUTH-001`; `SHELL-AUTH-005`                  |
| `TYPE-CON-027` | `RolePermissionEntry` y scope                | GENERAR        | Derivar vocabulario de scopes y forma contractual; no aceptar `scope_type` abierto.                         | `SHELL-CON-006`; `AUTH-CAT-018`; `SHELL-AUTH-001`                    |
| `TYPE-CON-028` | adapter `SupabaseClient`                     | COMPARTIR      | Puerto mínimo por capacidad (`rpc`, auth, query, admin) y no cliente concreto obligatorio.                  | `SHELL-AUTH-002`; `SHELL-AUTH-005`                                   |
| `TYPE-CON-029` | `Database` generado                          | GENERAR        | Salida determinista del esquema versionado de Supabase mantenido en `vento-shell`.                          | `SHELL-CON-001`; `SHELL-AUTH-002`; `SHELL-AUTH-004`                  |
| `TYPE-CON-030` | inputs y outputs RPC                         | GENERAR        | Generar desde firmas versionadas y validar payloads en runtime.                                             | `SHELL-AUTH-002`; `AUTH-DB-032` a `AUTH-DB-035`                      |
| `TYPE-CON-031` | `SignatureResult`                            | COMPARTIR      | Conservar la unión discriminada y centralizar códigos, metadata y errores.                                  | `SHELL-CON-007`; `SHELL-CON-008`; `SHELL-AUTH-002`                   |
| `TYPE-CON-032` | destino SSO y `returnTo`                     | COMPARTIR      | Contrato de origen, destino, aplicación, ambiente y política de retorno seguro.                             | `SHELL-CON-002`; `SHELL-CON-008`; `SHELL-AUTH-002`                   |
| `TYPE-CON-033` | razones, errores y estados                   | COMPARTIR      | Vocabularios versionados y separados por nivel; mensajes humanos son proyecciones locales.                  | `SHELL-CON-008`; `SHELL-CTX-005`; `SHELL-AUTH-004`                   |
| `TYPE-CON-034` | manifiesto, versión, hash y diagnóstico      | GENERAR        | Generar al publicar catálogos, schemas y paquetes; nunca completar manualmente en consumidores.             | `AUTH-CAT-017`; `AUTH-CAT-018`; `SHELL-CON-001`; `SHELL-AUTH-003`    |

**Conciliación:** 34 identidades esperadas, 34 materializadas, 0 faltantes y 0 duplicadas. Distribución: **20 COMPARTIR**, **13 GENERAR** y **1 MANTENER_LOCAL**.

La clasificación `GENERAR` no implica que el dato nazca de Supabase. La fuente puede ser el catálogo publicado, JSON Schema, registro de aplicaciones, migraciones versionadas o manifiesto de paquete. La salida debe declarar su fuente exacta.

---

#### 8. Matriz de las 16 variantes Supabase
| Variante                         | Disposición    | Regla de convergencia                                                                     | Destino                                              |
| -------------------------------- | -------------- | ----------------------------------------------------------------------------------------- | ---------------------------------------------------- |
| `BROWSER-SHELL-DOMAIN-PER_CALL`  | COMPARTIR      | Opción de ciclo por llamada y dominio explícito dentro del factory browser.               | `SHELL-AUTH-002`                                     |
| `BROWSER-SINGLETON-BASE`         | COMPARTIR      | Opción singleton del mismo factory; debe ser una política documentada, no otro fork.      | `SHELL-AUTH-002`; `SHELL-AUTH-005`                   |
| `BROWSER-PULSO-PER_CALL`         | COMPARTIR      | Conservar como opción del factory mientras pruebas determinan el ciclo requerido.         | `SHELL-AUTH-002`; `SHELL-AUTH-005`                   |
| `BROWSER-PULSO-ALT-UNCONSUMED`   | MANTENER_LOCAL | Cuarentena sin consumidor confirmado; no se promueve como alternativa oficial.            | `SHELL-AUD-011`                                      |
| `SERVER-SHELL-COOKIE_OPTIONS`    | COMPARTIR      | Política de dominio global expresada mediante configuración tipada.                       | `SHELL-AUTH-002`; `SHELL-PKG-004`                    |
| `SERVER-NEXO-HOST_AWARE`         | COMPARTIR      | Política host-aware preservada como opción explícita del adapter server.                  | `SHELL-AUTH-002`; `SHELL-PKG-004`                    |
| `SERVER-STATIC-DOMAIN`           | COMPARTIR      | Política estática común con validación de dominio, path, borrado y errores.               | `SHELL-AUTH-002`; `SHELL-AUTH-005`                   |
| `MW-SHELL-CENTRAL`               | MANTENER_LOCAL | Composición del launcher y matcher del Hub; usa adapters compartidos.                     | `SHELL-AUTH-002`; `SHELL-AUTH-005`                   |
| `MW-VISO-LOCAL_BASE`             | MANTENER_LOCAL | Entrypoint de VISO; migra a composición común sin perder rutas locales.                   | `SHELL-AUTH-005`                                     |
| `MW-NEXO-KIOSK`                  | MANTENER_LOCAL | Separar autenticación compartida de routing, no-store e inventario de kiosco.             | `SHELL-AUTH-002`; `SHELL-AUTH-005`                   |
| `MW-FOGO_NUMERA-LOCAL_NO_ACCESS` | MANTENER_LOCAL | Matcher y exclusión local; comparte solo la frontera de sesión.                           | `SHELL-AUTH-005`                                     |
| `MW-ORIGO-PDF_EXCEPTION`         | MANTENER_LOCAL | Excepción documental explícita con protección obligatoria en destino.                     | `SHELL-AUTH-004`; `SHELL-AUTH-005`                   |
| `PROXY-BASE-UNCONSUMED`          | MANTENER_LOCAL | Cuarentena hasta demostrar importación, framework hook o ausencia real.                   | `SHELL-AUD-011`                                      |
| `PROXY-PULSO-UNCONSUMED`         | MANTENER_LOCAL | Cuarentena; no suple la ausencia de middleware activo.                                    | `SHELL-AUD-011`                                      |
| `ADMIN-VISO-SERVICE_ROLE`        | COMPARTIR      | Factory server-only restringido; autorización y casos administrativos permanecen en VISO. | `SHELL-AUTH-002`; `SHELL-AUTH-003`; `SHELL-AUTH-005` |
| `EMPLOYEE-SITES-NORMALIZER`      | COMPARTIR      | Normalizador transitorio tipado contra `Database`; su retiro requiere evidencia.          | `SHELL-AUTH-002`; `SHELL-AUTH-005`; `SHELL-AUD-011`  |

**Conciliación:** 16 variantes esperadas, 16 materializadas y 0 códigos duplicados. Distribución: **8 COMPARTIR**, **0 GENERAR** y **8 MANTENER_LOCAL**.

Las variantes locales de middleware no se convierten en forks de autenticación. Cada una deberá componer la misma frontera compartida y declarar únicamente matcher, rutas públicas y extensión empresarial local.

---

#### 9. Decisión por superficie de transición
| ID             | Superficie          | Rol objetivo   | Límite                                                                                      | Destino                                                           |
| -------------- | ------------------- | -------------- | ------------------------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| `SURF-010-001` | SHELL runtime       | MANTENER_LOCAL | Launcher central y Hub; consume contratos y componentes, pero no es plantilla universal.    | `SHELL-UI-010`; `SHELL-AUTH-005`                                  |
| `SURF-010-002` | VISO                | MANTENER_LOCAL | Composición administrativa y consumidores service-role locales; núcleo común compartido.    | `SHELL-AUTH-002`; `SHELL-AUTH-005`                                |
| `SURF-010-003` | NEXO                | MANTENER_LOCAL | Composición logística, kiosco y contexto especializado locales; núcleo común compartido.    | `SHELL-CTX-001`; `SHELL-AUTH-005`                                 |
| `SURF-010-004` | FOGO                | MANTENER_LOCAL | Tema y dominio de producción locales; adopta componentes, contratos y adapters compartidos. | `SHELL-UI-001`; `SHELL-AUTH-005`                                  |
| `SURF-010-005` | ORIGO               | MANTENER_LOCAL | Compras y excepción PDF locales; adopta núcleo común.                                       | `SHELL-AUTH-004`; `SHELL-AUTH-005`                                |
| `SURF-010-006` | PULSO               | MANTENER_LOCAL | POS, políticas globales y composición local; resolver frontera middleware antes de migrar.  | `SHELL-UI-001`; `SHELL-AUTH-005`                                  |
| `SURF-010-007` | NUMERA              | MANTENER_LOCAL | Densidad y semántica financiera locales; adopta núcleo común.                               | `SHELL-UI-001`; `SHELL-AUTH-005`                                  |
| `SURF-010-008` | plantilla AppShell  | GENERAR        | Scaffold futuro que instala/importa versiones, no fuente copiada de implementación.         | `SHELL-PKG-001`; `SHELL-PKG-003`; `SHELL-UI-010`; `SHELL-AUD-011` |
| `SURF-010-009` | `@vento/os-context` | COMPARTIR      | Único SDK de contexto/autorización; reconciliar el paquete parcial existente.               | `SHELL-AUTH-001`; `SHELL-CTX-001`; `SHELL-AUD-011`                |

**Conciliación:** 9 superficies esperadas, 9 decisiones materializadas y 0 superficies omitidas.

---

#### 10. Reglas para artefactos compartidos

1. Un artefacto `COMPARTIR` tendrá una única implementación fuente en `vento-shell`.
2. Su API pública no importará rutas, tablas, textos o reglas exclusivas de una aplicación.
3. Toda extensión se expresará mediante configuración tipada, adapter, slot o estrategia registrada.
4. El paquete y sus estilos, schemas o assets se versionarán como una unidad compatible.
5. El consumo utilizará una versión resuelta y reproducible; no una copia pegada.
6. Los adapters de seguridad fallarán cerrado y distinguirán denegación, bloqueo contextual y error técnico.
7. El factory administrativo será `server-only` y no formará parte de exports browser.
8. `@vento/os-context` será el único SDK de contexto y autorización; el paquete parcial actual se reconciliará, no se duplica.
9. `@vento/ui-web` no absorberá estilos de logística, compras, POS, producción o finanzas.
10. Los componentes compartidos consumirán contratos generados para aplicación, permiso, pantalla y marca.

---

#### 11. Reglas para artefactos generados

1. Cada salida declara `source`, versión de schema y versión contractual cuando aplique.
2. La generación es determinista: misma entrada normalizada produce los mismos bytes.
3. La salida generada no se edita manualmente.
4. El repositorio bloquea generación desactualizada mediante diff y checksum.
5. Los tipos de aplicación, permiso, rol y scope se derivan de catálogos publicados.
6. `Database` e inputs/outputs RPC se derivan del estado versionado de Supabase en `vento-shell`.
7. Manifest, hashes y diagnósticos se producen durante publicación, no en cada consumidor.
8. Los view models locales no se generan desde datos no validados.
9. Un cast TypeScript no sustituye parsing de runtime.
10. Una clave con formato válido no se trata como identidad publicada sin validación de catálogo.

---

#### 12. Reglas para artefactos locales

1. La localidad requiere repositorio propietario y responsabilidad explícita.
2. `layout.tsx` y `middleware.ts` permanecen entrypoints de cada aplicación.
3. `vento-shell.tsx` permanece compositor server y no duplica componentes o contratos.
4. El tema y los estilos de dominio pueden variar sin redefinir semántica de componentes.
5. Kiosco NEXO, PDF ORIGO, densidad NUMERA y políticas PULSO permanecen extensiones explícitas.
6. `OperatingGate` presenta una decisión; no la produce ni autoriza.
7. El adapter NEXO de contexto puede permanecer durante la transición, pero no define `AccessContext`.
8. Los artefactos en cuarentena no se consideran activos ni eliminables hasta `SHELL-AUD-011`.
9. Una app no puede mantener listas locales de aplicaciones, permisos, roles o scopes por alegar localidad.
10. Los cambios locales conservan compatibilidad con la versión compartida resuelta y su rollback.

---

#### 13. Estrategia de transición sin implementación

| Etapa | Propietario                                                          | Resultado exigido                                                         | Puerta                                   |
| ----- | -------------------------------------------------------------------- | ------------------------------------------------------------------------- | ---------------------------------------- |
| 1     | `SHELL-AUD-011`                                                      | evidencia final de consumidores y disposición de artefactos en cuarentena | segmento de auditoría cerrado            |
| 2     | `SHELL-PKG-001` a `SHELL-PKG-008`                                    | distribución, versionado, compatibilidad, deprecación y rollback          | no autoactualización sin pruebas         |
| 3     | `SHELL-CON-001` a `SHELL-CON-008` y `SHELL-CON-011`                  | contratos compartidos y generadores                                       | identidades sin copias manuales          |
| 4     | `SHELL-UI-001`, `SHELL-UI-002`, `SHELL-UI-010` y tareas dependientes | biblioteca UI, AppShell y proyecciones                                    | CSS, tema y consumidores probados        |
| 5     | `SHELL-AUTH-001`; `SHELL-CTX-001`                                    | SDK y módulo contextual consolidados                                      | un solo núcleo compartido                |
| 6     | `AUTH-DB-033`, `AUTH-DB-035`, `AUTH-DB-034`, `AUTH-DB-032`           | contexto, frescura, decisión y persistencia autoritativos                 | migraciones versionadas en `vento-shell` |
| 7     | `SHELL-AUTH-002` a `SHELL-AUTH-004`                                  | adapters, registro de consumidores y gates legacy                         | contratos y backend disponibles          |
| 8     | `SHELL-AUTH-005`                                                     | migración multi-repositorio con rollback y paridad                        | ninguna retirada anticipada              |

Esta tabla conserva el orden contractual aprobado y no inicia ninguna etapa.

---

#### 14. Compatibilidad y rollback obligatorios

- Cada aplicación podrá migrar y revertir de forma independiente.
- La configuración local deberá indicar versión compatible de contratos, UI y SDK.
- Una versión mayor incompatible bloqueará build o despliegue del consumidor.
- Las extensiones locales deberán conservar pruebas antes y después de migración.
- El rollback restaurará paquete, configuración y adapters compatibles como conjunto.
- La plantilla o bootstrap no actualizará consumidores automáticamente.
- Los artefactos generados se reproducirán desde la misma fuente versionada durante rollback.
- No se retirará una ruta legacy mientras exista un consumidor o una carga dinámica no descartada.

---

#### 15. Hallazgos y destinos obligatorios
| ID                | Hallazgo o decisión                                                                 | Estado                  | Propietario                                                      | Condición de salida                                                     |
| ----------------- | ----------------------------------------------------------------------------------- | ----------------------- | ---------------------------------------------------------------- | ----------------------------------------------------------------------- |
| `H-SHELL-010-001` | Las 26 familias físicas reciben una disposición primaria única.                     | DECIDIDO                | `SHELL-PKG-001`; `SHELL-AUD-011`                                 | mantener la matriz íntegra durante distribución y retiro                |
| `H-SHELL-010-002` | Las 34 identidades contractuales reciben una disposición primaria única.            | DECIDIDO                | `SHELL-CON-001` a `SHELL-CON-008`; `SHELL-CON-011`               | materializar contratos y generación sin redefinir identidades           |
| `H-SHELL-010-003` | Las 16 variantes Supabase reciben una disposición explícita.                        | DECIDIDO                | `SHELL-AUTH-002`; `SHELL-AUD-011`                                | adapters implementados y artefactos sin consumidor resueltos            |
| `H-SHELL-010-004` | Los layouts raíz permanecen locales y no se convierten en paquete.                  | DECIDIDO                | `SHELL-UI-010`; `SHELL-AUTH-005`                                 | cada app consume imports versionados sin copiar el layout               |
| `H-SHELL-010-005` | El CSS se divide en núcleo compartido, tema y dominio local.                        | DECIDIDO                | `SHELL-UI-001`; `SHELL-PKG-008`                                  | capas versionadas y pruebas paquete/tema/consumidor                     |
| `H-SHELL-010-006` | El compositor `vento-shell.tsx` permanece local; Chrome se comparte.                | DECIDIDO                | `SHELL-UI-010`; `SHELL-CON-011`                                  | orquestadores locales sin duplicar contratos ni Chrome                  |
| `H-SHELL-010-007` | Las primitivas UI y tabla se comparten junto con CSS y accesibilidad.               | DECIDIDO                | `SHELL-UI-001`; `SHELL-PKG-006`; `SHELL-PKG-008`                 | API y estilos publicados como una unidad compatible                     |
| `H-SHELL-010-008` | AppSwitcher, ProfileMenu, PageHeader y VentoLogo se comparten tras reconciliación.  | DECIDIDO                | `SHELL-UI-001`; `SHELL-UI-002`; `SHELL-UI-010`                   | una sola API y configuración generada                                   |
| `H-SHELL-010-009` | Aplicaciones, permisos, roles, scopes y metadata de marca se generan.               | DECIDIDO                | `SHELL-CON-002` a `SHELL-CON-006`; `AUTH-CAT-018`                | artefactos deterministas sin listas manuales                            |
| `H-SHELL-010-010` | Database, filas RPC y manifiestos se generan desde fuentes versionadas.             | DECIDIDO                | `SHELL-CON-001`; `SHELL-AUTH-002`; `AUTH-DB-032` a `AUTH-DB-035` | codegen y parsers reproducibles disponibles                             |
| `H-SHELL-010-011` | Guards, permisos, contexto y role override convergen en el SDK compartido.          | DECIDIDO                | `SHELL-AUTH-001`; `SHELL-CTX-001`; `SHELL-AUTH-002`              | API discriminada, errores estructurados y versión aplicada              |
| `H-SHELL-010-012` | Los entrypoints `middleware.ts` permanecen locales.                                 | DECIDIDO                | `SHELL-AUTH-002`; `SHELL-AUTH-005`                               | matchers locales compuestos sobre adapters comunes                      |
| `H-SHELL-010-013` | Kiosco NEXO, PDF ORIGO y políticas PULSO permanecen extensiones locales explícitas. | DECIDIDO                | `SHELL-AUTH-005`; `SHELL-UI-001`                                 | extensiones declaradas y probadas sin fork del núcleo                   |
| `H-SHELL-010-014` | Los clientes browser/server se comparten como factories configurables.              | DECIDIDO                | `SHELL-AUTH-002`; `SHELL-PKG-004`                                | ciclo, cookies, localhost y error formalizados                          |
| `H-SHELL-010-015` | El cliente admin se comparte solo como factory server-only restringido.             | DECIDIDO                | `SHELL-AUTH-002`; `SHELL-AUTH-003`                               | ningún export browser y consumidores privilegiados registrados          |
| `H-SHELL-010-016` | SSO y request-host se comparten sin defaults de aplicación.                         | DECIDIDO                | `SHELL-CON-002`; `SHELL-CON-008`; `SHELL-AUTH-002`               | destinos derivados del catálogo y retorno validado                      |
| `H-SHELL-010-017` | El contexto operacional especializado de NEXO permanece adapter local transitorio.  | DECIDIDO                | `SHELL-CTX-001`; `AUTH-DB-033`; `SHELL-AUTH-005`                 | migración a contexto canónico con paridad                               |
| `H-SHELL-010-018` | `OperatingGate` permanece view model local, no fuente de autorización.              | DECIDIDO                | `SHELL-CTX-005`; `SHELL-UI-015`; `SHELL-UI-016`                  | UI derivada de razones compartidas y decisión server                    |
| `H-SHELL-010-019` | La plantilla histórica deja de ser fuente normativa y pasa a scaffold generado.     | DECIDIDO                | `SHELL-PKG-001`; `SHELL-UI-010`; `SHELL-AUD-011`                 | bootstrap instala versiones y configuración sin copiar implementaciones |
| `H-SHELL-010-020` | Proxy y cliente alterno PULSO quedan en cuarentena local.                           | PENDIENTE_DE_EVIDENCIA  | `SHELL-AUD-011`                                                  | inventario reproducible de imports, hooks y carga dinámica              |
| `H-SHELL-010-021` | `@vento/os-context` se conserva y reconcilia; no se crea otro SDK paralelo.         | DECIDIDO                | `SHELL-AUTH-001`; `SHELL-CTX-001`                                | exports, versión, compatibilidad y consumidores canónicos               |
| `H-SHELL-010-022` | Ningún archivo actual se eleva completo a fuente canónica por número de copias.     | DECIDIDO                | `SHELL-PKG-001`; `SHELL-CON-001`; `SHELL-UI-001`                 | paquetes implementados desde contratos reconciliados                    |
| `H-SHELL-010-023` | La distribución y migración ocurren después de cerrar `SHELL-AUD-011`.              | BLOQUEADO_POR_SECUENCIA | `SHELL-AUD-011`; `SHELL-PKG-001`                                 | mini-bloque de auditoría cerrado y aprobado                             |
| `H-SHELL-010-024` | No se autoriza retiro, código, Supabase ni cambios de continuidad en esta tarea.    | FUERA_DE_ALCANCE        | `SHELL-AUD-011`; tareas de implementación propietarias           | aprobaciones y puertas posteriores cumplidas                            |

**Conciliación:** 24 hallazgos esperados, 24 materializados, 0 identificadores duplicados y 0 pendientes sin tarea responsable.

---

#### 16. Decisiones vinculantes

1. La matriz de 26 familias es exhaustiva y sustituye cualquier clasificación implícita por cantidad de copias.
2. La matriz de 34 identidades contractuales es exhaustiva para el alcance heredado de `SHELL-AUD-009`.
3. Las 16 variantes Supabase no se colapsan antes de representar explícitamente su política válida.
4. `COMPARTIR` significa una implementación fuente versionada, no sincronización manual de copias.
5. `GENERAR` significa salida determinista desde una fuente canónica, no código escrito una vez y copiado.
6. `MANTENER_LOCAL` no permite duplicar catálogos, autorización, contratos ni metadata canónica.
7. Los layouts, middlewares, compositores server, temas y estilos empresariales permanecen locales.
8. Chrome, primitivas, tabla, AppSwitcher, ProfileMenu, PageHeader y VentoLogo se comparten tras reconciliación.
9. Los códigos y tipos de aplicación, permiso, rol, scope, Database, RPC y publicación se generan.
10. Guards, permisos, contexto, SSO, firma y factories Supabase convergen en `@vento/os-context` y sus adapters.
11. `@vento/contracts` conserva la autoridad estática; `@vento/os-context` conserva ejecución y compatibilidad; Supabase conserva resolución autoritativa y persistencia.
12. El cliente service-role se comparte únicamente como factory server-only y no como sesión de usuario.
13. Las reglas NEXO, ORIGO, PULSO, VISO y NUMERA que responden a dominio permanecen locales mediante contratos explícitos.
14. La plantilla histórica no vuelve a ser fuente runtime; el scaffold futuro instalará imports y configuración versionados.
15. Proxy y cliente alterno PULSO permanecen en cuarentena hasta `SHELL-AUD-011`.
16. Esta tarea no autoriza eliminar, mover o modificar ningún archivo.
17. Esta tarea no crea paquete, código, SQL, migración, configuración ni cambio de Supabase.
18. No se modifica `active-sequence.json`.
19. `SHELL-AUD-011` permanece como única continuidad inmediata.
20. `SHELL-PKG-001` permanece reservado hasta aprobar el cierre de `SHELL-AUD-011`.

---

#### 17. Carryovers obligatorios

| Carryover                                                                          | Estado                   | Propietario                                        | Condición de salida                                         |
| ---------------------------------------------------------------------------------- | ------------------------ | -------------------------------------------------- | ----------------------------------------------------------- |
| confirmar y resolver proxies, cliente alterno, placeholders y tipos sin consumidor | `PENDIENTE_DE_EVIDENCIA` | `SHELL-AUD-011`                                    | inventario reproducible y decisión conservar/migrar/retirar |
| definir mecanismo físico de distribución                                           | `NO_IMPLEMENTADO`        | `SHELL-PKG-001`                                    | mecanismo aprobado para contratos, SDK y UI                 |
| implementar generación y contratos                                                 | `NO_IMPLEMENTADO`        | `SHELL-CON-001` a `SHELL-CON-008`; `SHELL-CON-011` | outputs deterministas y APIs públicas disponibles           |
| implementar biblioteca y AppShell                                                  | `NO_IMPLEMENTADO`        | `SHELL-UI-001`; `SHELL-UI-002`; `SHELL-UI-010`     | componentes, CSS, tema y extensiones probados               |
| reconciliar SDK parcial                                                            | `PARCIAL_TRANSITORIO`    | `SHELL-AUTH-001`; `SHELL-CTX-001`                  | único SDK con exports y compatibilidad definidos            |
| implementar backend autoritativo                                                   | `NO_IMPLEMENTADO`        | `AUTH-DB-032` a `AUTH-DB-035`                      | contexto y decisiones versionados, frescos y auditables     |
| implementar adapters y gates                                                       | `NO_IMPLEMENTADO`        | `SHELL-AUTH-002` a `SHELL-AUTH-004`                | fronteras tipadas y nuevos consumos legacy bloqueados       |
| migrar consumidores                                                                | `NO_IMPLEMENTADO`        | `SHELL-AUTH-005`                                   | adopción por repositorio, paridad y rollback certificados   |

Ningún carryover queda sin identificador, propietario y condición de salida.

---

#### 18. Trazabilidad con requisitos vigentes

La clasificación consume sin modificar requisitos existentes:

| Requisito        | Cobertura aplicada                                       |
| ---------------- | -------------------------------------------------------- |
| `TREQ-SHELL-002` | clasificación y paridad de responsabilidades compartidas |
| `TREQ-SHELL-003` | catálogo único de aplicaciones y metadata                |
| `TREQ-SHELL-004` | evidencia antes de retirar artefactos sin consumidor     |
| `TREQ-SHELL-006` | compatibilidad entre paquete y consumidores              |
| `TREQ-SHELL-007` | rollback independiente y compatibilidad entre versiones  |
| `TREQ-SHELL-008` | impacto explícito sobre el registro de requisitos        |
| `TREQ-SHELL-009` | evidencia reproducible por repositorio y commit          |
| `TREQ-SHELL-028` | catálogo único entre launcher, plantilla y runtimes      |
| `TREQ-SHELL-029` | plantilla separada de runtime y procedencia explícita    |
| `TREQ-SHELL-032` | reconciliación antes de adoptar o retirar primitivas     |
| `TREQ-SHELL-034` | destinos gobernados por catálogo activo                  |
| `TREQ-SHELL-035` | integridad de nombres, estados y codificación            |
| `TREQ-AUTH-004`  | paridad entre evaluadores para el mismo contexto         |
| `TREQ-AUTH-013`  | revalidación server, RPC y RLS                           |
| `TREQ-AUTH-015`  | evidencia, razones y versión de la decisión              |

La tarea no cambia identificador, regla, riesgo, tipo, prioridad, responsable, paquete, repositorio, estado, artefacto, evidencia ni relaciones de ninguna fila.

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea materializa la disposición arquitectónica de identidades ya inventariadas y comparadas. Las obligaciones de paridad, generación, compatibilidad, rollback, evidencia, adopción, separación entre plantilla y runtime, y retiro seguro ya están protegidas por los requisitos vigentes enumerados. No introduce comportamiento ejecutable ni descubre una regla verificable sin cobertura previa.

| Operación sobre `TREQ-*` | Cantidad |
| ------------------------ | -------: |
| creados                  |    **0** |
| modificados              |    **0** |
| diferidos                |    **0** |
| descartados              |    **0** |
| obsoletos                |    **0** |

No corresponde generar una copia del registro `04A`.

---

#### 19. Criterios de aceptación materializados

| Criterio                               |    Resultado | Estado     |
| -------------------------------------- | -----------: | ---------- |
| familias físicas clasificadas          | **26 de 26** | `CUMPLIDO` |
| identidades contractuales clasificadas | **34 de 34** | `CUMPLIDO` |
| variantes Supabase clasificadas        | **16 de 16** | `CUMPLIDO` |
| superficies de transición con decisión |   **9 de 9** | `CUMPLIDO` |
| disposiciones primarias válidas        | **76 de 76** | `CUMPLIDO` |
| familias o identidades faltantes       |        **0** | `CUMPLIDO` |
| identificadores duplicados             |        **0** | `CUMPLIDO` |
| hallazgos con propietario exacto       | **24 de 24** | `CUMPLIDO` |
| pendientes narrativos sin destino      |        **0** | `CUMPLIDO` |
| nuevas tareas creadas                  |        **0** | `CUMPLIDO` |
| cambios físicos en código o Supabase   |        **0** | `CUMPLIDO` |
| cambios `TREQ-*`                       |        **0** | `CUMPLIDO` |

La tarea queda documentalmente completa porque cada identidad heredada tiene una disposición primaria, una frontera de propiedad, un destino de implementación o evidencia y una condición de salida.

---

#### 20. Resultado y continuidad

La cadena de gobierno resultante es:

```text
familia o identidad auditada
→ fuente de verdad
→ COMPARTIR / GENERAR / MANTENER_LOCAL
→ paquete, generador o repositorio propietario
→ compatibilidad y rollback
→ migración por consumidor
→ evidencia de paridad
→ retiro condicionado de legacy
```

La única continuidad inmediata reservada es `SHELL-AUD-011 — Clasificar y retirar rutas, componentes, funciones, scripts y endpoints sin consumidores confirmados`. No se desarrolla ni modifica dentro de esta tarea.

El handoff `SHELL-PKG-001` permanece reservado exclusivamente para después de completar y aprobar `SHELL-AUD-011`.


### [ ] SHELL-AUD-011 — Clasificar y retirar rutas, componentes, funciones, scripts y endpoints sin consumidores confirmados
Arquitectura de paquetes
