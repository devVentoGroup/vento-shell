### MINI-BLOQUE — DISTRIBUCION Y PAQUETES COMPARTIDOS

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **distribucion y paquetes compartidos** dentro de **H FUNDACION COMPARTIDA**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `SHELL-PKG-001` a `SHELL-PKG-008` — 8 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Límites funcionales:** comienza con “Elegir mecanismo de distribución” y concluye con “Evitar actualizaciones automáticas sin pruebas”.
<!-- PLAN-SECTION-META:END -->

### ✅ SHELL-PKG-001 — Elegir mecanismo de distribución

**Estado:** APROBADA
**Bloque:** H — Fundación compartida
**Tipo:** decisión documental vinculante de arquitectura de distribución de paquetes compartidos
**Entrada de continuidad:** `SHELL-AUD-011 — Clasificar y retirar rutas, componentes, funciones, scripts y endpoints sin consumidores confirmados`
**Continuidad inmediata reservada:** `SHELL-PKG-002 — Elegir ownership por package`
**Fecha de corte:** 2026-08-01
**Repositorio propietario de la distribución:** `devVentoGroup/vento-shell`
**Cambios en código, paquetes publicados, configuración de registry, CI, secretos, despliegues, consumidores o Supabase:** no autorizados ni realizados

---

#### 1. Resultado material de esta tarea

Se adopta como mecanismo canónico de distribución de la fundación compartida de Vento OS:

```text
PAQUETES NPM PRIVADOS E INMUTABLES
PUBLICADOS EN UN REGISTRO PRIVADO COMPATIBLE CON NPM
DESDE VENTO-SHELL
CON VERSIONES EXACTAS Y LOCKFILE EN CADA CONSUMIDOR
```

La decisión separa tres mecanismos que cumplen funciones distintas:

```text
npm workspaces en vento-shell
→ autoría, integración y pruebas locales

registry privado compatible con npm
→ distribución oficial entre repositorios

paquete .tgz con checksum y procedencia
→ artefacto reproducible de publicación, evidencia y recuperación
```

El workspace local no constituye el canal de distribución entre repositorios. El archivo `.tgz` no constituye el canal ordinario de instalación. La copia de código, la plantilla, los Git submodules, los Git subtrees y las dependencias directas por URL Git quedan excluidos como mecanismo canónico de distribución de código compartido.

| Métrica                                          |           Resultado |
| ------------------------------------------------ | ------------------: |
| Mecanismos evaluados                             |               **6** |
| Mecanismo canónico seleccionado                  |               **1** |
| Mecanismos rechazados como canal primario        |               **5** |
| Protocolos ordinarios de instalación             |         **1 — npm** |
| Repositorio fuente de publicación                | **1 — vento-shell** |
| Familias iniciales alcanzadas por la decisión    |               **4** |
| Repositorios runtime consumidores previstos      |               **7** |
| Actualizaciones automáticas directas autorizadas |               **0** |
| Cambios `TREQ-*`                                 |               **0** |

---

#### 2. Fuentes y corte reproducible

| Fuente                                                            | Uso                                                                                       |
| ----------------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| `docs/plan-canonico/modular/01_PROTOCOLO.md`                      | continuidad, trazabilidad, evidencia, aprobación y prohibición de inferencias             |
| `docs/plan-canonico/modular/delivery-contract.json`               | contrato físico del artefacto de tarea                                                    |
| `docs/plan-canonico/modular/active-sequence.json`                 | handoff vigente desde auditoría hacia `SHELL-PKG-001`                                     |
| `docs/plan-canonico/modular/00_CABECERA_Y_ESTADO.md`              | confirmación de tarea actual, última aprobada y siguiente reservada                       |
| `02_DISTRIBUCION_Y_PAQUETES_COMPARTIDOS.md`                       | propietario y cobertura `SHELL-PKG-001..008`                                              |
| `SHELL-AUD-001..011`                                              | inventario, consumidores, disposición y fronteras compartidas aprobadas                   |
| `07_COMPONENTES_WEB_COMPARTIDOS.md`                               | familias UI que requerirán distribución compartida                                        |
| `06_ACCESO_COMPARTIDO_A_DATOS.md`                                 | familias de acceso a datos que requerirán distribución compartida                         |
| `07_01_MIGRACION_COORDINADA_DE_CONSUMIDORES_WEB.md`               | migración, paridad y retiro de consumidores legacy                                        |
| `T_CALIDAD_Y_DESPLIEGUE/01_PAQUETES_RELEASES_Y_COMPATIBILIDAD.md` | pruebas, build, releases, changelog, compatibilidad y PRs de consumidores                 |
| `package.json` de `vento-shell`                                   | workspace npm `packages/*` y scripts documentales actuales                                |
| `packages/os-context/package.json`                                | evidencia del paquete workspace privado existente y de su estado no publicable definitivo |
| `packages/os-context/README.md`                                   | alcance transitorio de `@vento/os-context` y centralización de Supabase en `vento-shell`  |
| repositorios runtime VISO, NEXO, FOGO, ORIGO, PULSO y NUMERA      | ausencia de adopción confirmada del paquete compartido en el corte auditado               |
| documentación oficial de npm y del proveedor candidato            | contrato de instalación, lockfile, autenticación y publicación                            |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`                | cobertura vigente de integridad, compatibilidad, rollback y consumidores                  |

**Commit documental inspeccionado de `vento-shell`:** `2186f4f21b0301b7830db68cbcafbcd3eab45c09`.

La evidencia actual demuestra un monorepo de autoría con npm workspaces y un paquete privado local `@vento/os-context`, pero no demuestra todavía:

- un registry configurado;
- un namespace remoto `@vento` certificado;
- paquetes publicados;
- permisos de lectura desde los siete repositorios consumidores;
- un pipeline de release;
- consumidores runtime instalando paquetes compartidos.

Por tanto, esta tarea elige el mecanismo y sus invariantes, pero no declara implementada su infraestructura.

---

#### 3. Alcance exacto

Esta tarea decide:

1. la unidad de distribución;
2. el protocolo de instalación;
3. la relación entre workspace, registry y artefacto de publicación;
4. el repositorio desde el cual se publicará;
5. las reglas mínimas de inmutabilidad, procedencia e integridad;
6. la forma de consumo en repositorios separados;
7. la regla de autenticación y separación de privilegios;
8. la forma mínima de rollback de una actualización;
9. los mecanismos expresamente rechazados;
10. las condiciones que debe satisfacer el proveedor concreto del registry.

Esta tarea no decide:

| Materia                                                           | Tarea propietaria                                                                          |
| ----------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| propietario funcional y mantenedor de cada package                | `SHELL-PKG-002`                                                                            |
| semver, prereleases, canales o reglas de incremento               | `SHELL-PKG-003`                                                                            |
| matriz de compatibilidad por Next, React, Supabase y consumidores | `SHELL-PKG-004`                                                                            |
| formato y obligatoriedad de changelog                             | `SHELL-PKG-005`                                                                            |
| oleadas y procedimiento de migración de consumidores              | `SHELL-PKG-006`; `SHELL-MIG-001..008`                                                      |
| automatización de actualizaciones mediante PR                     | `SHELL-PKG-007`                                                                            |
| gates que impiden actualizaciones automáticas sin pruebas         | `SHELL-PKG-008`                                                                            |
| API pública y exports de cada paquete                             | tareas `SHELL-CON-*`, `SHELL-AUTH-*`, `SHELL-DB-*` y `SHELL-UI-*` propietarias             |
| creación física del registry, secretos o workflows                | `SHELL-CI-002`; `SHELL-CI-003`, después de la puerta `E5-GATE-008::<package_id>` aplicable |
| publicación o migración real de consumidores                      | `SHELL-CI-003`; `SHELL-CI-006`; `SHELL-MIG-001..008`, después de la puerta aplicable       |

---

#### 4. Criterios vinculantes de selección

| ID             | Criterio                  | Obligación                                                                        |
| -------------- | ------------------------- | --------------------------------------------------------------------------------- |
| `DIST-CRT-001` | repositorios separados    | instalar sin copiar fuente ni requerir checkout del repositorio productor         |
| `DIST-CRT-002` | versión reproducible      | resolver una versión identificable y repetible mediante manifiesto y lockfile     |
| `DIST-CRT-003` | inmutabilidad             | una versión publicada no puede cambiar de contenido                               |
| `DIST-CRT-004` | integridad                | conservar checksum o integridad del artefacto resuelto                            |
| `DIST-CRT-005` | procedencia               | vincular paquete, versión, commit fuente y ejecución de publicación               |
| `DIST-CRT-006` | acceso privado            | impedir publicación o lectura anónima no autorizada                               |
| `DIST-CRT-007` | privilegio mínimo         | separar credenciales de publicación y credenciales de lectura                     |
| `DIST-CRT-008` | rollback                  | volver a una versión y lockfile anteriores sin reconstruir manualmente la fuente  |
| `DIST-CRT-009` | compatibilidad            | permitir declarar peer dependencies y bandas soportadas                           |
| `DIST-CRT-010` | adopción gradual          | permitir que cada aplicación migre en una oleada independiente                    |
| `DIST-CRT-011` | automatización controlada | permitir PRs de actualización, sin modificar consumidores directamente            |
| `DIST-CRT-012` | ecosistema actual         | funcionar con npm, `package.json`, `package-lock.json` y `npm ci`                 |
| `DIST-CRT-013` | independencia del runtime | no requerir ejecución de código desde `vento-shell` en producción                 |
| `DIST-CRT-014` | auditoría                 | permitir demostrar qué versión consume cada repositorio                           |
| `DIST-CRT-015` | continuidad de desarrollo | conservar workspaces para desarrollo y pruebas integradas dentro de `vento-shell` |

---

#### 5. Matriz de mecanismos evaluados

| ID              | Mecanismo                                            | Reproducible                                   | Versionable                                           | Consumo entre repos                | Seguridad y acceso                                 | Rollback                                | Decisión                                 |
| --------------- | ---------------------------------------------------- | ---------------------------------------------- | ----------------------------------------------------- | ---------------------------------- | -------------------------------------------------- | --------------------------------------- | ---------------------------------------- |
| `DIST-MECH-001` | copiar archivos, bootstrap o plantilla               | bajo; deriva después de copiar                 | no gobierna la copia ya creada                        | sí, mediante duplicación           | no existe control de lectura por paquete           | manual y propenso a pérdida             | `RECHAZADO_COMO_DISTRIBUCION`            |
| `DIST-MECH-002` | Git submodule o subtree                              | fija commit, pero acopla árbol y operación Git | versión de repositorio, no de package                 | posible con fricción operativa     | acceso Git amplio                                  | revert de commit, no de package aislado | `RECHAZADO_COMO_DISTRIBUCION`            |
| `DIST-MECH-003` | dependencia npm mediante URL o commit Git            | parcialmente reproducible                      | carece de release package gobernado                   | sí                                 | exige acceso Git y ciclo de instalación particular | revert de referencia                    | `RECHAZADO_COMO_CANAL_CANONICO`          |
| `DIST-MECH-004` | `.tgz` manual o release asset instalado por ruta/URL | puede ser reproducible con checksum            | posible, pero distribución y permisos quedan manuales | sí                                 | depende de transporte externo                      | posible, con alta carga manual          | `RESERVADO_COMO_ARTEFACTO_DE_EVIDENCIA`  |
| `DIST-MECH-005` | npm workspace monorepo únicamente                    | alto dentro de un checkout                     | sí dentro del monorepo                                | no resuelve repositorios separados | no define acceso remoto                            | local                                   | `CONSERVAR_PARA_AUTORIA_NO_DISTRIBUCION` |
| `DIST-MECH-006` | registry privado compatible con npm                  | alto con versión exacta y lockfile             | sí, por package                                       | sí, mediante npm                   | permisos de lectura/publicación separados          | versión y lockfile anteriores           | `SELECCIONADO`                           |

**Conciliación:** 6 mecanismos esperados, 6 materializados, 1 seleccionado, 5 no seleccionados como canal primario y 0 decisiones omitidas.

---

#### 6. Decisión arquitectónica vinculante

##### 6.1. Unidad de distribución

La unidad canónica será un **paquete npm privado por responsabilidad acotada**, no una carpeta compartida, un repositorio completo ni una plantilla copiada.

Las primeras familias ya aprobadas por las auditorías son:

| Familia             | Propósito distributivo                                                    | Estado en este corte                                            |
| ------------------- | ------------------------------------------------------------------------- | --------------------------------------------------------------- |
| `@vento/contracts`  | contratos, catálogos, schemas, tipos derivados y diagnósticos compartidos | planificado, no publicado                                       |
| `@vento/os-context` | SDK de contexto y autorización                                            | workspace parcial existente, no publicado como release canónico |
| `@vento/supabase`   | factories, tipos generados, wrappers RPC y errores de acceso a datos      | planificado, no publicado                                       |
| `@vento/ui-web`     | componentes, AppShell, navegación, marca y contrato CSS compartidos       | planificado, no publicado                                       |

Esta enumeración no decide ownership interno, orden de publicación ni API final. Esas decisiones permanecen en sus tareas propietarias.

##### 6.2. Canal ordinario

El canal ordinario será un **registry privado compatible con el protocolo npm**.

El proveedor concreto solo será aceptable si cumple todos estos requisitos:

1. admite paquetes privados con el scope canónico aprobado;
2. permite permisos separados de publicación y lectura;
3. permite lectura desde todos los repositorios consumidores;
4. integra autenticación no interactiva en CI;
5. preserva versiones inmutables o bloquea su sobrescritura;
6. expone metadata e integridad suficiente para auditoría;
7. soporta revocación de credenciales sin reconstruir los paquetes;
8. no obliga a copiar secretos de escritura en consumidores;
9. permite retirar acceso de un repositorio sin afectar a los demás;
10. no cambia el namespace público de los imports aprobados.

##### 6.3. Proveedor preferente y gate

**GitHub Packages es el primer proveedor candidato** porque el código fuente y los consumidores están alojados en GitHub y permite integrar publicación y acceso por repositorio. No se declara elegido de forma irreversible en este corte porque no existe evidencia canónica de que el namespace npm `@vento` esté habilitado y controlado por la cuenta u organización publicadora actual.

La aceptación del proveedor requiere una evidencia de configuración que demuestre:

```text
scope npm aprobado
→ owner remoto compatible
→ package privado de prueba
→ lectura desde un repositorio consumidor
→ publicación desde CI de vento-shell
→ credenciales separadas
→ instalación exacta mediante npm ci
→ rollback a versión anterior
```

Si GitHub Packages no puede conservar el scope canónico sin renombrar imports ni introducir un owner incorrecto, deberá seleccionarse otro registry npm privado que sí lo permita. Esto no cambia el mecanismo elegido; cambia únicamente su proveedor.

---

#### 7. Relación entre autoría, build y distribución

```text
VENTO-SHELL
→ fuente única de cada package
→ npm workspaces para desarrollo integrado
→ pruebas, typecheck, build y empaquetado
→ npm pack produce artefacto verificable
→ CI publica versión inmutable al registry privado

REPOSITORIO CONSUMIDOR
→ declara versión exacta
→ conserva package-lock.json
→ instala mediante npm ci
→ ejecuta validaciones propias
→ despliega su aplicación, no la fuente de vento-shell
```

Reglas:

1. `vento-shell` conserva la fuente y la configuración de build de los paquetes.
2. Los consumidores no compilan directamente una ruta Git de `vento-shell`.
3. Los paquetes publicados no exportarán archivos TypeScript crudos desde `src` como contrato de release definitivo.
4. Cada paquete publicará outputs construidos, declaraciones de tipos y un mapa `exports` explícito.
5. Los source maps, licencias internas, metadata, checksum y procedencia se conservarán según la política posterior.
6. Una dependencia interna de workspace deberá convertirse en una dependencia de package resoluble al publicar.
7. El paquete publicado será autocontenido dentro de su contrato y no dependerá de rutas relativas fuera de su tarball.
8. Los repositorios consumidores no modificarán archivos instalados dentro de `node_modules`.

El `packages/os-context/package.json` actual, con `private: true` y exports directos hacia `src/index.ts`, se clasifica como **workspace de autoría transitorio**, no como manifiesto final de publicación.

---

#### 8. Consumo reproducible

Cada repositorio consumidor deberá cumplir:

| ID              | Regla                                                                                                                              |
| --------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| `DIST-CONS-001` | declarar dependencias compartidas con una versión exacta, sin `*`, `latest`, URL Git o rango flotante en la instalación productiva |
| `DIST-CONS-002` | versionar `package-lock.json`                                                                                                      |
| `DIST-CONS-003` | instalar en CI y builds reproducibles mediante `npm ci`                                                                            |
| `DIST-CONS-004` | fallar si manifiesto y lockfile no coinciden                                                                                       |
| `DIST-CONS-005` | no regenerar silenciosamente el lockfile durante despliegue                                                                        |
| `DIST-CONS-006` | registrar paquete y versión efectiva en evidencia de build                                                                         |
| `DIST-CONS-007` | ejecutar pruebas del consumidor antes de aceptar una actualización                                                                 |
| `DIST-CONS-008` | revertir manifiesto y lockfile juntos                                                                                              |
| `DIST-CONS-009` | no instalar desde un workspace local durante una build de release del consumidor                                                   |
| `DIST-CONS-010` | no usar overrides permanentes para ocultar incompatibilidades sin tarea propietaria                                                |

La política de versión exacta no define todavía cómo se incrementan las versiones. Esa materia corresponde a `SHELL-PKG-003`.

---

#### 9. Publicación y promoción

El flujo mínimo futuro será:

```text
cambio en package dentro de vento-shell
→ validaciones del package y dependientes
→ construcción reproducible
→ npm pack
→ inspección del contenido publicable
→ checksum e identidad del commit
→ publicación autenticada de versión nueva
→ evidencia de release
→ PR explícito en cada consumidor
```

Decisiones:

1. solo `vento-shell` publica paquetes VENTO;
2. ningún runtime publica una variante local con el mismo nombre;
3. una versión ya publicada no se sobrescribe;
4. cualquier corrección genera una versión nueva;
5. la publicación no modifica automáticamente repositorios consumidores;
6. el tag o canal no sustituye la versión exacta en el consumidor;
7. la promoción entre canales no cambia los bytes de una versión;
8. los artefactos de build se producirán desde un commit identificable y un entorno controlado;
9. el contenido de `npm pack` deberá validarse para impedir secretos, fuentes no previstas o archivos de dominio ajeno;
10. el workflow de publicación deberá ser protegido y auditable.

La implementación de workflows, tags, changelog y PRs no se realiza en esta tarea.

---

#### 10. Autenticación y privilegio mínimo

| Actor                          | Permiso permitido                                | Prohibición                                         |
| ------------------------------ | ------------------------------------------------ | --------------------------------------------------- |
| CI publicador de `vento-shell` | publicar paquetes aprobados y consultar metadata | no reutilizar su token de escritura en consumidores |
| CI de repositorio consumidor   | leer paquetes privados requeridos                | no publicar, borrar o cambiar permisos de paquetes  |
| desarrollador autorizado       | leer packages necesarios para desarrollo         | no conservar credenciales en archivos versionados   |
| servicio de actualización      | crear o actualizar ramas/PRs autorizados         | no fusionar ni desplegar automáticamente            |

Reglas obligatorias:

- ningún token se almacena en `package.json`, `package-lock.json`, código o documentación canónica;
- `.npmrc` versionado solo puede contener registry y variables de entorno, nunca un secreto literal;
- las credenciales de lectura se conceden por repositorio o identidad con alcance mínimo;
- la publicación debe usar una identidad de CI protegida y trazable;
- la rotación o revocación de un token no debe invalidar versiones ya publicadas;
- el registry no será usado para distribuir secretos, configuración de entorno o datos operativos.

---

#### 11. Integridad, procedencia y evidencia

Cada release futura deberá producir o conservar como mínimo:

| Campo                | Evidencia requerida                     |
| -------------------- | --------------------------------------- |
| `package_name`       | nombre npm completo                     |
| `package_version`    | versión publicada                       |
| `source_repository`  | `devVentoGroup/vento-shell`             |
| `source_commit`      | commit exacto                           |
| `workflow_run`       | ejecución publicadora                   |
| `artifact_checksum`  | checksum del `.tgz`                     |
| `registry_integrity` | integridad resuelta por npm/lockfile    |
| `package_manifest`   | `package.json` incluido en el artefacto |
| `published_files`    | inventario validado de archivos         |
| `test_evidence`      | validaciones previas a publicar         |
| `compatibility_ref`  | matriz aplicable cuando exista          |
| `changelog_ref`      | cambio documentado cuando exista        |
| `rollback_version`   | versión previa restituible              |

Una publicación sin vínculo demostrable con un commit y una ejecución autorizada no será una release canónica de VENTO.

---

#### 12. Rollback

El rollback de una actualización de package se realizará por consumidor:

```text
identificar última versión estable
→ restaurar package.json
→ restaurar package-lock.json
→ npm ci
→ ejecutar pruebas y build
→ desplegar mediante el proceso del consumidor
→ registrar causa y evidencia
```

No se resolverá rollback mediante:

- sobrescribir una versión publicada;
- editar manualmente `node_modules`;
- copiar archivos desde otro repositorio;
- forzar un tag flotante hacia bytes distintos sin cambiar la versión;
- eliminar una versión mientras existan consumidores activos;
- regenerar el lockfile sin revisión.

La política completa de compatibilidad y deprecación se define en `SHELL-PKG-004`; la migración de consumidores se define en `SHELL-PKG-006`.

---

#### 13. Decisiones por identidad

| ID             | Decisión                                                                                 | Estado                   | Destino de materialización                                                                     |
| -------------- | ---------------------------------------------------------------------------------------- | ------------------------ | ---------------------------------------------------------------------------------------------- |
| `PKG-DIST-001` | usar package npm como unidad distribuible                                                | `DECIDIDO`               | `SHELL-PKG-002`; tareas propietarias de cada package                                           |
| `PKG-DIST-002` | usar registry privado compatible con npm como canal ordinario                            | `DECIDIDO`               | `SHELL-CI-002`; `SHELL-CI-003`                                                                 |
| `PKG-DIST-003` | conservar npm workspaces para autoría local                                              | `DECIDIDO`               | configuración de `vento-shell`                                                                 |
| `PKG-DIST-004` | usar `.tgz` como artefacto verificable, no como canal manual ordinario                   | `DECIDIDO`               | `SHELL-CI-002`; `SHELL-CI-003`                                                                 |
| `PKG-DIST-005` | publicar únicamente desde `vento-shell`                                                  | `DECIDIDO`               | `SHELL-PKG-002`; `SHELL-CI-003`                                                                |
| `PKG-DIST-006` | consumir mediante npm con versión exacta y lockfile                                      | `DECIDIDO`               | `SHELL-PKG-003`; `SHELL-PKG-006`                                                               |
| `PKG-DIST-007` | instalar builds reproducibles mediante `npm ci`                                          | `DECIDIDO`               | `SHELL-PKG-004`; `SHELL-PKG-008`                                                               |
| `PKG-DIST-008` | impedir sobrescritura de versiones publicadas                                            | `DECIDIDO`               | `SHELL-PKG-003`; `SHELL-CI-003`                                                                |
| `PKG-DIST-009` | separar credenciales de lectura y publicación                                            | `DECIDIDO`               | `SHELL-CI-003`; configuración protegida del release                                            |
| `PKG-DIST-010` | actualizar consumidores solo mediante PR revisable                                       | `DECIDIDO`               | `SHELL-PKG-007`; `SHELL-PKG-008`                                                               |
| `PKG-DIST-011` | rechazar copia de fuente y bootstrap como distribución de shared code                    | `DECIDIDO`               | `SHELL-MIG-004`; `SHELL-MIG-007`                                                               |
| `PKG-DIST-012` | rechazar submodule, subtree y Git URL como canal canónico                                | `DECIDIDO`               | gates de publicación y consumidores                                                            |
| `PKG-DIST-013` | exigir build, declarations y exports publicables                                         | `DECIDIDO`               | tareas propietarias de cada package; `SHELL-CI-001`; `SHELL-CI-002`                            |
| `PKG-DIST-014` | conservar procedencia de commit, workflow y checksum                                     | `DECIDIDO`               | `SHELL-PKG-003`; `SHELL-PKG-005`; `SHELL-CI-003`; `SHELL-CI-004`                               |
| `PKG-DIST-015` | tratar GitHub Packages como proveedor preferente condicionado                            | `PENDIENTE_DE_EVIDENCIA` | `SHELL-CI-003`, mediante certificación del namespace, permisos y prueba de lectura/publicación |
| `PKG-DIST-016` | usar otro registry npm privado si el proveedor preferente exige romper el scope canónico | `FALLBACK_AUTORIZADO`    | `SHELL-CI-003`, conservando el protocolo npm y el scope aprobado                               |
| `PKG-DIST-017` | no publicar ni migrar consumidores durante esta fase documental                          | `RESTRICCION_CANONICA`   | `SHELL-CI-003`; `SHELL-CI-006`; `SHELL-MIG-001..008` después de la puerta aplicable            |
| `PKG-DIST-018` | no cambiar `active-sequence.json` por inferencia                                         | `RESTRICCION_CANONICA`   | continuidad canónica                                                                           |

**Conciliación:** 18 decisiones esperadas, 18 materializadas, 18 identificadores únicos, 0 faltantes y 0 duplicados.

---

#### 14. Hallazgos y destinos exactos

| ID                    | Hallazgo                                                         | Estado                             | Tarea responsable                                                |
| --------------------- | ---------------------------------------------------------------- | ---------------------------------- | ---------------------------------------------------------------- |
| `H-SHELL-PKG-001-001` | `vento-shell` ya usa npm workspaces `packages/*`                 | `IMPLEMENTADO_COMO_AUTORIA_LOCAL`  | conservar bajo el mecanismo elegido                              |
| `H-SHELL-PKG-001-002` | `@vento/os-context` existe con `private: true`                   | `WORKSPACE_TRANSITORIO`            | `SHELL-PKG-002`; `SHELL-AUTH-001`                                |
| `H-SHELL-PKG-001-003` | `@vento/os-context` exporta actualmente `src/index.ts`           | `NO_PUBLICABLE_COMO_RELEASE_FINAL` | `SHELL-AUTH-001`; política de build posterior                    |
| `H-SHELL-PKG-001-004` | no se confirmó registry npm configurado                          | `PENDIENTE_DE_IMPLEMENTACION`      | `SHELL-CI-002`; `SHELL-CI-003`                                   |
| `H-SHELL-PKG-001-005` | no se confirmó publicación de paquetes `@vento/*`                | `PENDIENTE_DE_IMPLEMENTACION`      | `SHELL-CI-003`                                                   |
| `H-SHELL-PKG-001-006` | no se confirmó lectura de packages desde repositorios runtime    | `PENDIENTE_DE_EVIDENCIA`           | `SHELL-PKG-006`; `SHELL-MIG-001`                                 |
| `H-SHELL-PKG-001-007` | no se confirmó control remoto del namespace npm `@vento`         | `PENDIENTE_DE_EVIDENCIA`           | gate de proveedor previo a implementación                        |
| `H-SHELL-PKG-001-008` | la copia y plantilla produjeron deriva multi-repositorio         | `CONFIRMADO_POR_AUDITORIA`         | `SHELL-MIG-004`; `SHELL-MIG-007`                                 |
| `H-SHELL-PKG-001-009` | los repositorios consumidores usan npm y lockfiles               | `COMPATIBLE_CON_MECANISMO`         | `SHELL-PKG-004`; `SHELL-PKG-006`                                 |
| `H-SHELL-PKG-001-010` | los packages requieren permisos privados y no lectura pública    | `REQUISITO_DE_DISTRIBUCION`        | `SHELL-CI-003`                                                   |
| `H-SHELL-PKG-001-011` | una actualización no debe modificar consumidores sin revisión    | `DECISION_CANONICA`                | `SHELL-PKG-007`; `SHELL-PKG-008`                                 |
| `H-SHELL-PKG-001-012` | el rollback debe restaurar manifiesto y lockfile                 | `DECISION_CANONICA`                | `SHELL-PKG-004`; `SHELL-PKG-006`                                 |
| `H-SHELL-PKG-001-013` | el artefacto publicado debe corresponder a un commit verificable | `DECISION_CANONICA`                | `SHELL-PKG-003`; `SHELL-PKG-005`; `SHELL-CI-003`; `SHELL-CI-004` |
| `H-SHELL-PKG-001-014` | workspaces por sí solos no distribuyen entre repositorios        | `CONFIRMADO`                       | registry privado compatible con npm                              |
| `H-SHELL-PKG-001-015` | el proveedor puede cambiar sin cambiar el protocolo de consumo   | `DECISION_ARQUITECTONICA`          | gate de proveedor y configuración posterior                      |
| `H-SHELL-PKG-001-016` | el alcance no autoriza publicación, secretos o CI                | `RESTRICCION_CANONICA`             | `SHELL-CI-001..006` después de la puerta aplicable               |

**Conciliación:** 16 hallazgos, 16 destinos exactos y 0 pendientes sin propietario o condición de salida.

---

#### 15. Handoffs obligatorios

| Materia                                                | Destino                                                                       | Resultado requerido                                   |
| ------------------------------------------------------ | ----------------------------------------------------------------------------- | ----------------------------------------------------- |
| ownership y mantenedores por package                   | `SHELL-PKG-002`                                                               | propietario, aprobadores y fronteras por package      |
| versionado y canales                                   | `SHELL-PKG-003`                                                               | reglas deterministas de versión y publicación         |
| compatibilidad y rollback                              | `SHELL-PKG-004`                                                               | matriz verificable y política de soporte              |
| changelog y procedencia visible                        | `SHELL-PKG-005`                                                               | cambio trazable por versión                           |
| migración de consumidores                              | `SHELL-PKG-006`; `SHELL-MIG-001..008`                                         | oleadas, paridad, rollback y retiro de legacy         |
| PRs automáticos                                        | `SHELL-PKG-007`                                                               | actualizaciones propuestas, no aplicadas directamente |
| gates contra actualización sin pruebas                 | `SHELL-PKG-008`                                                               | bloqueo ejecutable antes de merge o release           |
| contratos y outputs de build                           | tareas propietarias `SHELL-CON-*`, `SHELL-AUTH-*`, `SHELL-DB-*`, `SHELL-UI-*` | package publicable y acotado                          |
| registry, permisos, secretos y workflow de publicación | `SHELL-CI-002`; `SHELL-CI-003` después de la puerta E5 aplicable              | distribución realmente operativa                      |

Ningún handoff sustituye el resultado de esta tarea: el mecanismo ya queda elegido.

---

#### 16. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea elige una arquitectura de distribución y asigna sus aspectos verificables a tareas ya existentes de versionado, compatibilidad, migración, PRs, gates, integridad y rollback. No introduce una obligación de prueba independiente que carezca de cobertura en el registro canónico vigente. La publicación de prueba, instalación desde un consumidor, rollback y validaciones de packages deberán materializarse en sus tareas propietarias antes de declarar implementado el mecanismo.

| Operación sobre `TREQ-*` | Cantidad |
| ------------------------ | -------: |
| creados                  |    **0** |
| modificados              |    **0** |
| diferidos                |    **0** |
| descartados              |    **0** |
| obsoletos                |    **0** |

No corresponde generar una copia de `04A`.

---

#### 17. Criterios de aceptación

`SHELL-PKG-001` queda materialmente completa porque:

- compara seis mecanismos de distribución;
- elige uno de forma vinculante;
- distingue autoría local, distribución remota y artefacto de evidencia;
- define npm como protocolo ordinario;
- establece registry privado como canal canónico;
- conserva `vento-shell` como única fuente y publicador;
- define consumo con versión exacta, lockfile y `npm ci`;
- rechaza copia, plantilla, submodule, subtree y Git URL como distribución canónica;
- define inmutabilidad, integridad, procedencia, acceso y privilegio mínimo;
- define rollback por versión y lockfile;
- identifica cuatro familias iniciales sin decidir todavía su ownership;
- deja al proveedor concreto sujeto a evidencia sin reabrir el mecanismo elegido;
- materializa 18 decisiones y 16 hallazgos sin faltantes;
- asigna cada pendiente a una tarea existente o a un gate de implementación explícito;
- declara cero cambios `TREQ-*`;
- no publica packages ni modifica consumidores, secretos, CI, Supabase o continuidad.

---

#### 18. Resultado y continuidad

La arquitectura resultante es:

```text
fuente única en vento-shell
→ workspace local
→ package construido
→ tarball verificable
→ registry npm privado
→ versión exacta
→ package-lock.json
→ npm ci
→ pruebas del consumidor
→ despliegue independiente
→ rollback por versión y lockfile
```

La única continuidad inmediata reservada es:

```text
SHELL-PKG-002 — Elegir ownership por package
```

No se inicia, desarrolla ni modifica dentro de esta tarea.


### [ ] SHELL-PKG-002 — Definir versionado semántico
### [ ] SHELL-PKG-003 — Definir tags y releases
### [ ] SHELL-PKG-004 — Definir política de compatibilidad
### [ ] SHELL-PKG-005 — Definir política de deprecación
### [ ] SHELL-PKG-006 — Definir rollback por aplicación
### [ ] SHELL-PKG-007 — Definir actualizaciones mediante PR
### [ ] SHELL-PKG-008 — Evitar actualizaciones automáticas sin pruebas
Paquetes candidatos
