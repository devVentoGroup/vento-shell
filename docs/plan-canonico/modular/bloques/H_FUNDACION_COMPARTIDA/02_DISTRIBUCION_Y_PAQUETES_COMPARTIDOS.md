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
**Continuidad inmediata reservada:** `SHELL-PKG-002 — Definir versionado semántico`
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
SHELL-PKG-002 — Definir versionado semántico
```

No se inicia, desarrolla ni modifica dentro de esta tarea.


### ✅ SHELL-PKG-002 — Definir versionado semántico

**Estado:** APROBADA
**Bloque:** H — Fundación compartida
**Tipo:** definición documental vinculante de versionado semántico para paquetes compartidos
**Entrada de continuidad:** `SHELL-PKG-001 — Elegir mecanismo de distribución`
**Continuidad inmediata reservada:** `SHELL-PKG-003 — Definir tags y releases`
**Fecha de corte:** 2026-08-01
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Estándar base:** Semantic Versioning 2.0.0
**Cambios en código, packages, registry, tags, releases, CI, consumidores, secretos o Supabase:** no autorizados ni realizados

---

#### 1. Resultado material de esta tarea

Los paquetes compartidos de VENTO utilizarán versionado semántico independiente por paquete:

```text
MAJOR.MINOR.PATCH
```

La versión comunica el impacto del cambio sobre el API público de cada paquete:

```text
MAJOR
→ cambio incompatible

MINOR
→ funcionalidad pública nueva y compatible

PATCH
→ corrección compatible sin ampliar ni romper el API público
```

La política se aplica inicialmente a:

1. `@vento/contracts`;
2. `@vento/os-context`;
3. `@vento/supabase`;
4. `@vento/ui-web`.

Cada paquete evoluciona de manera independiente. Compartir repositorio, commit, workflow o fecha de publicación no obliga a compartir número de versión.

| Métrica                                     |            Resultado |
| ------------------------------------------- | -------------------: |
| Paquetes iniciales clasificados             |                **4** |
| Esquemas de versión permitidos              | **1 — SemVer 2.0.0** |
| Componentes obligatorios de versión estable |                **3** |
| Niveles de incremento ordinario             |                **3** |
| Familias de prerelease admitidas            |                **3** |
| Versiones publicadas modificables           |                **0** |
| Versiones sincronizadas obligatoriamente    |                **0** |
| Decisiones vinculantes                      |               **24** |
| Hallazgos con destino exacto                |               **12** |
| Cambios `TREQ-*`                            |                **0** |

---

#### 2. Fuentes y corte reproducible

| Fuente                                                            | Uso                                                                                  |
| ----------------------------------------------------------------- | ------------------------------------------------------------------------------------ |
| `docs/plan-canonico/modular/01_PROTOCOLO.md`                      | continuidad, trazabilidad, tareas existentes y requisitos de prueba                  |
| `docs/plan-canonico/modular/delivery-contract.json`               | contrato físico del artefacto                                                        |
| `docs/plan-canonico/modular/active-sequence.json`                 | segmento `SHELL-PKG-001..008`                                                        |
| `02_DISTRIBUCION_Y_PAQUETES_COMPARTIDOS.md`                       | propietario y títulos canónicos del mini-bloque                                      |
| `SHELL-PKG-001`                                                   | paquetes npm privados, registry compatible con npm, versiones exactas y lockfiles    |
| `01_AUDITORIA_DE_COMPONENTES_COMPARTIDOS.md`                      | familias, contratos y consumidores que originan los paquetes                         |
| `03_CONTRATOS_COMPARTIDOS.md`                                     | propietario de `@vento/contracts`                                                    |
| `03_AUTORIZACION_Y_CONTEXTO_COMPARTIDOS.md`                       | propietario de `@vento/os-context`                                                   |
| `06_ACCESO_COMPARTIDO_A_DATOS.md`                                 | propietario de `@vento/supabase`                                                     |
| `07_COMPONENTES_WEB_COMPARTIDOS.md`                               | propietario de `@vento/ui-web`                                                       |
| `T_CALIDAD_Y_DESPLIEGUE/01_PAQUETES_RELEASES_Y_COMPATIBILIDAD.md` | pruebas, build, releases, changelog, compatibilidad y PRs                            |
| `package.json` de `vento-shell`                                   | workspace `packages/*` y versión privada del repositorio                             |
| `packages/os-context/package.json`                                | evidencia de `@vento/os-context@0.1.0`, `private: true` y export directo desde `src` |
| Semantic Versioning 2.0.0                                         | semántica normativa de `MAJOR.MINOR.PATCH`, prerelease e inmutabilidad               |
| documentación oficial de npm                                      | uso de SemVer en packages publicados                                                 |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`                | compatibilidad, rollback, evidencia y trazabilidad vigentes                          |

**Commit remoto inspeccionado:** `4424ab99b8b989d2a05580a437ca3eecb3fab3c9`.

La versión raíz `vento-shell@0.1.0` y la versión local `@vento/os-context@0.1.0` no constituyen releases canónicos publicados. El paquete existente permanece privado y exporta código fuente; por tanto, su número actual es metadata transitoria del workspace y no establece precedente para la primera versión estable.

---

#### 3. Alcance exacto

Esta tarea define:

1. formato canónico de versión;
2. unidad independiente de versionado;
3. significado de `MAJOR`, `MINOR` y `PATCH`;
4. tratamiento de prereleases;
5. punto de inicio de la primera versión estable;
6. clasificación de cambios por superficie pública;
7. reglas para dependencias internas entre packages;
8. reglas para tipos y artefactos generados;
9. relación entre versión, commit, contenido e inmutabilidad;
10. procedimiento determinista de decisión de incremento;
11. casos que no producen release;
12. evidencia mínima que deberá registrar la decisión.

Esta tarea no define:

| Materia                                      | Tarea propietaria                                                 |
| -------------------------------------------- | ----------------------------------------------------------------- |
| nombres, formato y movimiento de tags        | `SHELL-PKG-003`                                                   |
| creación y publicación de releases           | `SHELL-PKG-003`; `SHELL-CI-003`                                   |
| matriz concreta de compatibilidad soportada  | `SHELL-PKG-004`; `SHELL-CI-005`                                   |
| ventanas y retiro de APIs deprecadas         | `SHELL-PKG-005`                                                   |
| rollback operativo por aplicación            | `SHELL-PKG-006`                                                   |
| PRs de actualización de consumidores         | `SHELL-PKG-007`; `SHELL-CI-006`                                   |
| gates automáticos antes de actualizar        | `SHELL-PKG-008`; `SHELL-CI-001`                                   |
| API pública concreta de cada package         | tareas `SHELL-CON-*`, `SHELL-AUTH-*`, `SHELL-DB-*` y `SHELL-UI-*` |
| build, declarations y exports publicables    | `SHELL-CI-002` y tareas propietarias de cada package              |
| proveedor, credenciales o publicación física | `SHELL-CI-003` después de la puerta aplicable                     |

---

#### 4. Unidad canónica de versionado

La unidad de versión será cada package publicado:

| Package             | Propietario técnico de contenido                         | Serie de versión |
| ------------------- | -------------------------------------------------------- | ---------------- |
| `@vento/contracts`  | `SHELL-CON-001` y tareas `SHELL-CON-*`                   | independiente    |
| `@vento/os-context` | `SHELL-AUTH-001` y tareas `SHELL-AUTH-*` / `SHELL-CTX-*` | independiente    |
| `@vento/supabase`   | `SHELL-DB-001` y tareas `SHELL-DB-*`                     | independiente    |
| `@vento/ui-web`     | `SHELL-UI-001` y tareas `SHELL-UI-*`                     | independiente    |

Reglas vinculantes:

- no existe una versión global obligatoria para toda la fundación compartida;
- no se incrementará un package sin cambio material solo para igualar otro;
- un mismo commit puede publicar cero, uno o varios packages;
- cuando cambien varios packages, cada uno recibe su propia clasificación;
- la coordinación de publicación no convierte las versiones en lockstep;
- la versión raíz privada de `vento-shell` no sustituye las versiones de packages.

---

#### 5. Formato canónico

Una versión estable tendrá exactamente:

```text
X.Y.Z
```

Donde:

- `X`, `Y` y `Z` son enteros no negativos;
- no se permiten ceros iniciales;
- una versión publicada no puede cambiar de contenido;
- cualquier cambio en el artefacto publicado exige otra versión;
- el orden se calcula por `MAJOR`, luego `MINOR`, luego `PATCH` y finalmente prerelease;
- metadata de build no altera precedencia.

Patrón estructural aplicable:

```regex
^(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)(?:-([0-9A-Za-z-]+(?:\.[0-9A-Za-z-]+)*))?(?:\+([0-9A-Za-z-]+(?:\.[0-9A-Za-z-]+)*))?$
```

VENTO no utilizará metadata `+build` como identidad canónica de release. Commit, workflow, checksum, registry y artefacto se conservarán en metadata de procedencia separada. Esto evita tratar dos artefactos con igual precedencia SemVer como releases funcionalmente distintas.

---

#### 6. API público que gobierna el incremento

El API público de un package comprende todo lo que un consumidor soportado puede importar, instanciar, configurar, renderizar, recibir o interpretar:

| Superficie     | Ejemplos                                                          |
| -------------- | ----------------------------------------------------------------- |
| exports        | entrypoints y subpaths declarados en `exports`                    |
| tipos          | tipos, interfaces, unions, enums, generics y firmas exportadas    |
| funciones      | parámetros, retorno, errores, side effects y semántica observable |
| contratos      | schemas, códigos, catálogos, manifest, hashes y diagnósticos      |
| autorización   | decisiones, razones, scopes, guards y contexto efectivo           |
| acceso a datos | factories, adapters, tipos `Database`, RPC y errores normalizados |
| UI             | props, eventos, DOM/semántica accesible, tokens y CSS requeridos  |
| compatibilidad | peer dependencies, engines, módulos y entornos soportados         |

Un archivo interno no es público por su ubicación. Un elemento es público cuando se exporta o su efecto observable forma parte del contrato soportado.

La clasificación se realiza contra la última versión publicada estable del mismo package. Para prereleases se compara contra la base estable objetivo y contra la prerelease inmediatamente anterior.

---

#### 7. Reglas de incremento

##### 7.1. `PATCH`

Incrementa `Z` y conserva `X.Y` cuando el cambio es compatible y no amplía el API público:

- corrección de comportamiento defectuoso que restaura el contrato documentado;
- corrección de seguridad sin romper consumidores soportados;
- mejora interna de rendimiento sin alterar resultado, orden, errores ni API;
- actualización de dependencia interna que no cambia API ni compatibilidad;
- corrección de build, declarations o packaging sin cambiar imports soportados;
- ajuste de implementación privada no observable;
- corrección de documentación incluida en el package cuando el artefacto publicado cambia, pero el API no.

Ejemplo:

```text
1.4.2 → 1.4.3
```

##### 7.2. `MINOR`

Incrementa `Y`, reinicia `Z` a cero y conserva `X` cuando se añade funcionalidad pública compatible:

- nuevo export opcional y aditivo;
- nueva función que no modifica las existentes;
- nuevo parámetro o prop verdaderamente opcional con comportamiento por defecto compatible;
- ampliación compatible de un schema abierto;
- ampliación de plataformas o peer dependencies soportadas sin retirar soporte;
- nueva capacidad que consumidores anteriores pueden ignorar;
- marcación de una API pública como deprecada, sin retirarla ni cambiar su comportamiento soportado.

Ejemplo:

```text
1.4.3 → 1.5.0
```

##### 7.3. `MAJOR`

Incrementa `X` y reinicia `Y.Z` a cero cuando existe cualquier incompatibilidad para un consumidor soportado:

- eliminar, renombrar o mover un export o subpath;
- cambiar firma, tipo de retorno o semántica observable;
- convertir parámetro, campo o prop opcional en obligatorio;
- eliminar, renombrar o volver obligatorio un campo de schema;
- estrechar un tipo o validación de forma que rechace entradas antes válidas;
- agregar un miembro a una union o enum cerrado que obligue a actualizar exhaustividad;
- cambiar códigos, razones o significado de decisiones de autorización;
- cambiar estados, errores o contratos de RPC incompatiblemente;
- retirar o renombrar token, clase o requisito CSS público;
- cambiar DOM, accesibilidad o eventos cuando rompa el contrato soportado;
- eliminar una plataforma, engine o versión de peer dependency antes soportada;
- cambiar formato de módulo, entrypoint o estrategia de importación con migración requerida;
- retirar una API deprecada.

Ejemplo:

```text
1.5.0 → 2.0.0
```

La urgencia, severidad o tamaño del diff no determina el nivel. El nivel lo determina la compatibilidad del API público.

---

#### 8. Matriz materializada de cambios

| ID                | Cambio                                                       | Nivel mínimo                 | Justificación                             |
| ----------------- | ------------------------------------------------------------ | ---------------------------- | ----------------------------------------- |
| `SEMVER-CASE-001` | corrección interna sin salida observable distinta            | `PATCH`                      | restaura o conserva contrato              |
| `SEMVER-CASE-002` | corrección de seguridad compatible                           | `PATCH`                      | riesgo alto no implica ruptura            |
| `SEMVER-CASE-003` | nuevo export independiente                                   | `MINOR`                      | capacidad aditiva                         |
| `SEMVER-CASE-004` | nuevo parámetro opcional con default compatible              | `MINOR`                      | consumidores existentes siguen válidos    |
| `SEMVER-CASE-005` | marcar API como deprecada                                    | `MINOR`                      | aviso público aditivo antes del retiro    |
| `SEMVER-CASE-006` | eliminar API deprecada                                       | `MAJOR`                      | consumidor debe migrar                    |
| `SEMVER-CASE-007` | renombrar o mover export                                     | `MAJOR`                      | rompe import existente                    |
| `SEMVER-CASE-008` | agregar campo obligatorio                                    | `MAJOR`                      | entradas anteriores dejan de ser válidas  |
| `SEMVER-CASE-009` | agregar campo opcional a objeto abierto                      | `MINOR`                      | extensión compatible                      |
| `SEMVER-CASE-010` | agregar miembro a union cerrada                              | `MAJOR`                      | puede romper consumidores exhaustivos     |
| `SEMVER-CASE-011` | ampliar peer range soportado                                 | `MINOR`                      | soporte público adicional                 |
| `SEMVER-CASE-012` | retirar una versión antes soportada de peer/engine           | `MAJOR`                      | reduce compatibilidad declarada           |
| `SEMVER-CASE-013` | actualizar dependencia privada sin efecto público            | `PATCH`                      | artefacto cambia sin romper API           |
| `SEMVER-CASE-014` | cambiar dependencia y tipos públicos expuestos               | según impacto, hasta `MAJOR` | el contrato transitivo también es público |
| `SEMVER-CASE-015` | cambiar token o requisito CSS público                        | `MAJOR`                      | rompe composición visual soportada        |
| `SEMVER-CASE-016` | añadir componente o token sin alterar existentes             | `MINOR`                      | superficie aditiva                        |
| `SEMVER-CASE-017` | regenerar tipos con output idéntico                          | `NO_RELEASE`                 | no existe cambio distribuible             |
| `SEMVER-CASE-018` | regenerar tipos con adición compatible                       | `MINOR`                      | contrato generado aditivo                 |
| `SEMVER-CASE-019` | regenerar tipos con eliminación o estrechamiento             | `MAJOR`                      | contrato generado incompatible            |
| `SEMVER-CASE-020` | modificar solo documentación fuera del tarball               | `NO_RELEASE`                 | package publicado no cambia               |
| `SEMVER-CASE-021` | modificar tests sin cambiar output del package               | `NO_RELEASE`                 | no existe cambio distribuible             |
| `SEMVER-CASE-022` | cambiar package.json publicado sin impacto público adicional | `PATCH`                      | manifiesto del artefacto cambia           |

**Conciliación:** 22 casos esperados, 22 materializados, 0 faltantes y 0 duplicados.

---

#### 9. Primera versión estable y prereleases

##### 9.1. Versión estable inicial

La primera versión estable publicable de cada package será:

```text
1.0.0
```

`1.0.0` declara que el API público inicial está definido y gobernado. Las versiones `0.x` existentes dentro del workspace se consideran metadata de desarrollo y no releases estables canónicos.

No se publicará una versión estable inicial hasta que el package tenga:

1. API pública documentada;
2. exports y subpaths definitivos para esa serie mayor;
3. build distribuible sin export directo desde `src`;
4. declarations de TypeScript coherentes;
5. `private: false` solo durante la preparación autorizada de publicación;
6. pruebas propias aplicables;
7. matriz de compatibilidad con consumidores;
8. procedencia de commit y checksum;
9. política de rollback aplicable;
10. ausencia de placeholders o exports transitorios no declarados;
11. instalación reproducible desde el registry candidato;
12. puerta `E5-GATE-008::<package_id>` superada cuando corresponda.

##### 9.2. Prereleases

Antes de `1.0.0` estable podrán existir exclusivamente prereleases de la serie objetivo:

```text
1.0.0-alpha.N
1.0.0-beta.N
1.0.0-rc.N
```

Donde `N` es entero positivo sin ceros iniciales.

Semántica interna:

| Familia   | Uso                                                      |
| --------- | -------------------------------------------------------- |
| `alpha.N` | API y packaging todavía sujetos a cambios frecuentes     |
| `beta.N`  | API candidata con integración de consumidores en curso   |
| `rc.N`    | candidato de release sin cambios incompatibles previstos |

Las reglas de tags, canales, promoción y publicación pertenecen a `SHELL-PKG-003`. Esta tarea solo define sintaxis, precedencia y significado de compatibilidad.

Una prerelease tiene precedencia inferior a su versión estable asociada. No se promueve cambiando bytes bajo el mismo número: cada artefacto distinto recibe un identificador nuevo.

---

#### 10. Dependencias entre packages VENTO

Los packages publicados usarán versiones exactas para dependencias internas `@vento/*`.

Ejemplo:

```json
{
  "dependencies": {
    "@vento/contracts": "1.3.0"
  }
}
```

Reglas:

1. no se usarán `^`, `~`, `*`, `latest`, URLs Git ni rangos flotantes entre packages VENTO publicados;
2. actualizar una dependencia exacta modifica el artefacto dependiente y exige al menos `PATCH`;
3. si el cambio de dependencia amplía el API público del dependiente, será al menos `MINOR`;
4. si rompe su API público o compatibilidad, será `MAJOR`;
5. no se incrementarán todos los dependientes solo porque un package fue publicado;
6. se publicará un dependiente únicamente cuando cambie su manifiesto, output o contrato;
7. los consumidores aplicación conservarán versión exacta y lockfile conforme a `SHELL-PKG-001`;
8. peer dependencies externas podrán usar rangos explícitos soportados, gobernados por `SHELL-PKG-004`.

---

#### 11. Regla para cambios multi-package

Cada cambio se clasifica por package afectado:

```text
identificar packages con bytes o manifiesto distintos
→ comparar API pública por package
→ clasificar NO_RELEASE / PATCH / MINOR / MAJOR
→ propagar dependencias exactas cuando corresponda
→ recalcular el impacto del dependiente
→ registrar la versión propuesta por package
```

Ejemplo vinculante:

| Package             | Cambio                                       | Resultado    |
| ------------------- | -------------------------------------------- | ------------ |
| `@vento/contracts`  | nuevo schema opcional compatible             | `MINOR`      |
| `@vento/os-context` | actualiza dependencia exacta y no cambia API | `PATCH`      |
| `@vento/supabase`   | no cambia                                    | `NO_RELEASE` |
| `@vento/ui-web`     | no cambia                                    | `NO_RELEASE` |

No existe obligación de publicar los cuatro packages juntos.

---

#### 12. Procedimiento determinista de clasificación

Para cada package con cambio distribuible:

1. identificar la última versión publicada de referencia;
2. enumerar exports y comportamiento público antes y después;
3. identificar consumidores soportados y peer ranges vigentes;
4. clasificar cada cambio individual;
5. elegir el nivel más alto encontrado;
6. recalcular dependencias internas exactas;
7. confirmar que el número resultante no fue publicado previamente;
8. vincular versión propuesta con commit y artefacto construido;
9. ejecutar pruebas y matriz de compatibilidad antes de publicar;
10. registrar aprobación de la clasificación;
11. delegar tag y release a `SHELL-PKG-003`;
12. impedir publicación cuando exista discrepancia entre contenido, versión o evidencia.

Regla de precedencia:

```text
MAJOR > MINOR > PATCH > NO_RELEASE
```

La existencia de varios cambios no suma niveles. Se aplica el mayor impacto contractual.

---

#### 13. Registro obligatorio de decisión de versión

Toda propuesta de release deberá producir una instancia con:

| Campo                    | Obligación                                 |
| ------------------------ | ------------------------------------------ |
| `package_name`           | nombre exacto `@vento/*`                   |
| `current_version`        | última versión publicada de referencia     |
| `proposed_version`       | versión SemVer calculada                   |
| `change_class`           | `NO_RELEASE`, `PATCH`, `MINOR` o `MAJOR`   |
| `public_api_before`      | manifest o snapshot de API anterior        |
| `public_api_after`       | manifest o snapshot de API propuesta       |
| `breaking_changes`       | lista explícita o `NONE`                   |
| `dependency_changes`     | dependencias internas y externas afectadas |
| `consumer_impact`        | consumidores y migración requerida         |
| `source_commit`          | commit exacto                              |
| `artifact_integrity`     | checksum del tarball construido            |
| `compatibility_evidence` | matriz y pruebas aplicables                |
| `decision_owner`         | tarea propietaria del package              |
| `release_gate`           | resultado del gate correspondiente         |

El registro es entrada obligatoria para `SHELL-PKG-003`, `SHELL-CI-003` y el changelog automatizado de `SHELL-CI-004`.

---

#### 14. Prácticas prohibidas

Queda prohibido:

- reutilizar una versión publicada con contenido distinto;
- sobrescribir una versión para corregirla;
- incrementar por fecha, cantidad de commits o tamaño del diff;
- usar una versión global para forzar sincronización de packages independientes;
- publicar cambios incompatibles como `PATCH` o `MINOR`;
- usar `0.x` publicado como sustituto permanente de una política de compatibilidad;
- ocultar una ruptura mediante prerelease o metadata de build;
- omitir incremento cuando cambia el tarball o manifiesto publicado;
- publicar un dependiente con referencia interna inexistente;
- usar rangos flotantes para dependencias internas VENTO;
- considerar una rama, commit o tag como sustituto del número de package;
- declarar compatible un cambio sin revisar la superficie pública y los consumidores;
- convertir una corrección urgente en excepción a SemVer;
- deducir el incremento únicamente desde Conventional Commits o el texto del PR;
- publicar antes de que la clasificación y evidencia coincidan.

---

#### 15. Decisiones por identidad

| ID               | Decisión                                             | Estado                   | Destino                                |
| ---------------- | ---------------------------------------------------- | ------------------------ | -------------------------------------- |
| `PKG-SEMVER-001` | adoptar SemVer 2.0.0                                 | `DECIDIDO`               | todos los packages `@vento/*`          |
| `PKG-SEMVER-002` | versionar cada package independientemente            | `DECIDIDO`               | manifests y release pipeline           |
| `PKG-SEMVER-003` | usar `MAJOR.MINOR.PATCH` sin ceros iniciales         | `DECIDIDO`               | validador de versión                   |
| `PKG-SEMVER-004` | clasificar por API público, no por tamaño o urgencia | `DECIDIDO`               | registro de decisión                   |
| `PKG-SEMVER-005` | usar `PATCH` para corrección compatible              | `DECIDIDO`               | release classification                 |
| `PKG-SEMVER-006` | usar `MINOR` para capacidad pública aditiva          | `DECIDIDO`               | release classification                 |
| `PKG-SEMVER-007` | usar `MAJOR` para incompatibilidad                   | `DECIDIDO`               | release classification                 |
| `PKG-SEMVER-008` | usar como primera estable `1.0.0`                    | `DECIDIDO`               | primer release estable de cada package |
| `PKG-SEMVER-009` | tratar `0.1.0` actual como metadata transitoria      | `DECIDIDO`               | `@vento/os-context`                    |
| `PKG-SEMVER-010` | admitir `alpha.N`, `beta.N` y `rc.N`                 | `DECIDIDO`               | prereleases previas a estable          |
| `PKG-SEMVER-011` | no usar build metadata como identidad canónica       | `DECIDIDO`               | procedencia separada                   |
| `PKG-SEMVER-012` | prohibir mutación de versión publicada               | `DECIDIDO`               | registry y release gate                |
| `PKG-SEMVER-013` | usar versiones exactas entre packages VENTO          | `DECIDIDO`               | manifests publicados                   |
| `PKG-SEMVER-014` | exigir al menos PATCH al cambiar dependencia exacta  | `DECIDIDO`               | package dependiente                    |
| `PKG-SEMVER-015` | aplicar el mayor impacto de un conjunto de cambios   | `DECIDIDO`               | algoritmo de clasificación             |
| `PKG-SEMVER-016` | no publicar cuando no cambia el artefacto            | `DECIDIDO`               | `NO_RELEASE`                           |
| `PKG-SEMVER-017` | clasificar tipos y outputs generados por impacto     | `DECIDIDO`               | `@vento/contracts`; `@vento/supabase`  |
| `PKG-SEMVER-018` | considerar CSS y accesibilidad parte del API UI      | `DECIDIDO`               | `@vento/ui-web`                        |
| `PKG-SEMVER-019` | considerar razones y decisiones parte del API auth   | `DECIDIDO`               | `@vento/os-context`                    |
| `PKG-SEMVER-020` | considerar reducción de peer support como ruptura    | `DECIDIDO`               | compatibilidad y release               |
| `PKG-SEMVER-021` | registrar snapshots de API antes y después           | `DECIDIDO`               | `SHELL-CI-001`; `SHELL-CI-002`         |
| `PKG-SEMVER-022` | vincular versión con commit y checksum               | `DECIDIDO`               | `SHELL-PKG-003`; `SHELL-CI-003`        |
| `PKG-SEMVER-023` | dejar tags y promoción a la tarea siguiente          | `RESTRICCION_DE_ALCANCE` | `SHELL-PKG-003`                        |
| `PKG-SEMVER-024` | no publicar ni modificar packages en esta fase       | `RESTRICCION_CANONICA`   | implementación posterior               |

**Conciliación:** 24 decisiones esperadas, 24 materializadas, 24 identificadores únicos, 0 faltantes y 0 duplicados.

---

#### 16. Hallazgos y destinos exactos

| ID                    | Hallazgo                                                                   | Estado                        | Destino                                                  |
| --------------------- | -------------------------------------------------------------------------- | ----------------------------- | -------------------------------------------------------- |
| `H-SHELL-PKG-002-001` | `vento-shell` tiene versión raíz privada `0.1.0`                           | `METADATA_NO_DISTRIBUIBLE`    | no usar como versión de packages                         |
| `H-SHELL-PKG-002-002` | `@vento/os-context` declara `0.1.0` y `private: true`                      | `WORKSPACE_TRANSITORIO`       | `SHELL-AUTH-001`; `SHELL-CI-002`; primer release `1.0.0` |
| `H-SHELL-PKG-002-003` | el package actual exporta directamente `src/index.ts`                      | `NO_PUBLICABLE_COMO_ESTABLE`  | `SHELL-AUTH-001`; `SHELL-CI-002`                         |
| `H-SHELL-PKG-002-004` | no existe una release publicada de referencia                              | `PENDIENTE_DE_IMPLEMENTACION` | `SHELL-PKG-003`; `SHELL-CI-003`                          |
| `H-SHELL-PKG-002-005` | cuatro familias requieren series independientes                            | `DECISION_CANONICA`           | tareas propietarias y manifests                          |
| `H-SHELL-PKG-002-006` | contratos y tipos generados pueden romper consumidores sin cambiar runtime | `RIESGO_CONTRACTUAL`          | `SHELL-CI-001`; `SHELL-CI-005`; `SHELL-PKG-004`          |
| `H-SHELL-PKG-002-007` | CSS, tokens, DOM y accesibilidad pueden ser API público                    | `RIESGO_UI`                   | `SHELL-UI-*`; `SHELL-CI-001`; `SHELL-PKG-004`            |
| `H-SHELL-PKG-002-008` | decisiones y razones de autorización son contrato observable               | `RIESGO_DE_AUTORIZACION`      | `SHELL-AUTH-*`; `SHELL-CI-001`; `SHELL-PKG-004`          |
| `H-SHELL-PKG-002-009` | dependencias internas exactas requieren propagación controlada             | `DECISION_CANONICA`           | `SHELL-PKG-007`; `SHELL-CI-006`                          |
| `H-SHELL-PKG-002-010` | el incremento no puede depender solo del mensaje de commit                 | `DECISION_CANONICA`           | clasificador y revisión de API                           |
| `H-SHELL-PKG-002-011` | prerelease no equivale a release estable                                   | `DECISION_CANONICA`           | `SHELL-PKG-003`                                          |
| `H-SHELL-PKG-002-012` | la versión debe corresponder a bytes y procedencia inmutables              | `DECISION_CANONICA`           | `SHELL-PKG-003`; `SHELL-CI-003`; `SHELL-CI-004`          |

**Conciliación:** 12 hallazgos, 12 destinos exactos y 0 pendientes sin propietario o condición de salida.

---

#### 17. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea especializa la interpretación de versión de los packages ya protegidos por requisitos vigentes, sin introducir comportamiento runtime ni una nueva superficie ejecutable. La publicación y adopción de cada versión ya deben superar pruebas propias y matriz de consumidores por `TREQ-SHELL-006`; el rollback entre versiones permanece protegido por `TREQ-SHELL-007`; la declaración y evidencia por package/PR se conserva bajo `TREQ-SHELL-008`; y la procedencia verificable por repositorio y commit permanece bajo `TREQ-SHELL-009`. La futura automatización deberá consumir estas reglas en `SHELL-PKG-008` y `SHELL-CI-001..005`, sin crear en esta tarea una segunda obligación duplicada.

| Operación sobre `TREQ-*` | Cantidad |
| ------------------------ | -------: |
| creados                  |    **0** |
| modificados              |    **0** |
| diferidos                |    **0** |
| descartados              |    **0** |
| obsoletos                |    **0** |

No corresponde generar una copia de `04A`.

---

#### 18. Criterios de aceptación

`SHELL-PKG-002` queda materialmente completa porque:

- define SemVer 2.0.0 como único esquema canónico;
- define una serie independiente para cada package;
- materializa el significado de `PATCH`, `MINOR` y `MAJOR`;
- clasifica 22 casos concretos sin omisiones;
- identifica el API público por familia;
- fija `1.0.0` como primera versión estable;
- distingue metadata `0.1.0` de una release publicada;
- define `alpha.N`, `beta.N` y `rc.N` sin invadir tags/releases;
- prohíbe mutar una versión publicada;
- prohíbe rangos flotantes entre packages VENTO;
- define propagación de dependencias internas;
- define cambios multi-package sin lockstep;
- define `NO_RELEASE` cuando no cambia el artefacto;
- incorpora tipos generados, autorización, CSS y accesibilidad a la clasificación;
- exige snapshot de API, commit, checksum y evidencia;
- materializa 24 decisiones y 12 hallazgos;
- asigna cada pendiente a una tarea existente;
- declara cero cambios `TREQ-*` con cobertura vigente explícita;
- no publica, etiqueta ni modifica código, packages, CI, consumidores o Supabase.

---

#### 19. Resultado y continuidad

La decisión resultante es:

```text
cambio en package
→ identificar API público afectado
→ clasificar todos los cambios
→ elegir impacto máximo
→ recalcular dependencias exactas
→ proponer versión SemVer independiente
→ vincular commit y artefacto
→ ejecutar compatibilidad
→ crear tag y release en la tarea propietaria
```

La única continuidad inmediata reservada es:

```text
SHELL-PKG-003 — Definir tags y releases
```

No se inicia, desarrolla ni modifica dentro de este artefacto.

### ✅ SHELL-PKG-003 — Definir tags y releases

**Estado:** APROBADA
**Fecha:** 2026-08-01
**Tarea anterior:** SHELL-PKG-002 — Definir versionado semántico
**Tarea siguiente:** SHELL-PKG-004 — Definir política de compatibilidad
**Tipo de tarea:** Documental
**Fase:** Definición documental vinculante; implementación física no autorizada
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Ubicación canónica:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/02_DISTRIBUCION_Y_PAQUETES_COMPARTIDOS.md`

---

#### 1. Resultado material

Se establece la convención canónica de tags Git y releases para las cuatro familias de paquetes compartidos aprobadas:

1. `@vento/contracts`;
2. `@vento/os-context`;
3. `@vento/supabase`;
4. `@vento/ui-web`.

Cada versión publicada de una familia tendrá una identidad independiente, reproducible e inmutable:

```text
package_name
+ package_version SemVer exacta
+ package_manifest
+ tag Git anotado
+ release asociado
+ source_commit
+ artefacto publicado
+ checksum e integridad
+ canal de publicación
```

La relación vinculante será:

```text
una familia + una versión exacta
= un tag canónico
= un release canónico
= un commit de origen verificable
= un artefacto inmutable
```

No existirá un tag global que sustituya las versiones independientes de las cuatro familias. Un mismo commit podrá originar varios releases coordinados, pero cada familia conservará su nombre, versión, tag, release, artefacto y evidencia propios.

| Métrica                             |                         Resultado |
| ----------------------------------- | --------------------------------: |
| Familias canónicas                  |                             **4** |
| Patrones de tag estable             |                             **4** |
| Patrones de título de release       |                             **4** |
| Canales SemVer permitidos           | **4 — estable, alpha, beta y rc** |
| Estados documentales de release     |                             **5** |
| Decisiones vinculantes              |                            **30** |
| Hallazgos con destino exacto        |                            **10** |
| Requisitos `TREQ-*` creados         |                             **2** |
| Tags o releases creados físicamente |                             **0** |

#### 2. Fuentes y línea base

##### 2.1. Fuentes vinculantes

| Fuente                                                            | Uso                                                                                                |
| ----------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- |
| `01_PROTOCOLO.md`                                                 | continuidad, requisitos de prueba, evidencia y límites de fase                                     |
| `delivery-contract.json`                                          | estructura física del artefacto documental                                                         |
| `active-sequence.json` y `continuity-route.json`                  | ubicación de `SHELL-PKG-003` dentro de `SHELL-PKG-001..008`                                        |
| `SHELL-PKG-001 — Elegir mecanismo de distribución`                | paquetes npm privados, inmutabilidad, registry compatible con npm, versiones exactas y procedencia |
| `SHELL-PKG-002 — Definir versionado semántico`                    | cuatro familias, SemVer independiente, primera estable `1.0.0` y prereleases permitidas            |
| `03_CONTRATOS_COMPARTIDOS.md`                                     | identidad prevista de `@vento/contracts`                                                           |
| tareas propietarias `SHELL-AUTH-*` y `SHELL-CTX-*`                | identidad prevista de `@vento/os-context`                                                          |
| tareas propietarias `SHELL-DB-*`                                  | identidad prevista de `@vento/supabase`                                                            |
| tareas propietarias `SHELL-UI-*`                                  | identidad prevista de `@vento/ui-web`                                                              |
| `T_CALIDAD_Y_DESPLIEGUE/01_PAQUETES_RELEASES_Y_COMPATIBILIDAD.md` | implementación futura de pruebas, builds, releases, changelog, matriz y PRs                        |
| `package.json` de `vento-shell`                                   | workspace `packages/*` y estado privado del repositorio                                            |
| `packages/os-context/package.json`                                | workspace transitorio `@vento/os-context@0.1.0`, privado y no publicable como estable              |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`                | cobertura vigente y secuencia `TREQ-SHELL-*`                                                       |

##### 2.2. Línea base verificable

| ID            | Familia             | Estado técnico verificable                              | Estado de tag y release                                               |
| ------------- | ------------------- | ------------------------------------------------------- | --------------------------------------------------------------------- |
| `REL-FAM-001` | `@vento/contracts`  | familia aprobada; package estable aún no materializado  | sin tag ni release canónicos confirmados                              |
| `REL-FAM-002` | `@vento/os-context` | workspace privado `0.1.0` que exporta fuente TypeScript | `0.1.0` es metadata transitoria; sin tag ni release estable canónicos |
| `REL-FAM-003` | `@vento/supabase`   | familia aprobada; package estable aún no materializado  | sin tag ni release canónicos confirmados                              |
| `REL-FAM-004` | `@vento/ui-web`     | familia aprobada; package estable aún no materializado  | sin tag ni release canónicos confirmados                              |

**Conciliación:** cuatro familias esperadas, cuatro materializadas, cero faltantes, cero duplicadas y cero releases estables publicadas confirmadas.

El conjunto `@vento/os-telemetry`, `@vento/os-flags` y `@vento/os-errors` no pertenece al inventario aprobado por `SHELL-PKG-002` y no forma parte de esta tarea.

#### 3. Alcance

##### 3.1. Incluido

Esta tarea define:

1. identidad canónica de tags y releases;
2. patrones por cada una de las cuatro familias;
3. relación entre package, versión, manifest, tag, release, commit y artefacto;
4. tratamiento de releases estables y prereleases;
5. estados documentales de un release;
6. inmutabilidad y reglas de corrección;
7. cortes coordinados de varias familias;
8. contenido mínimo de release notes;
9. evidencia mínima previa a publicación;
10. requisitos de prueba que protegerán estas reglas.

##### 3.2. Excluido

Esta tarea no:

- crea tags Git ni releases;
- publica paquetes en un registry;
- modifica `package.json`, `package-lock.json`, código, exports o builds;
- crea workflows, credenciales, secrets, ramas o pull requests;
- configura alias de distribución como `latest`, `next` o equivalentes;
- define la matriz de compatibilidad, reservada a `SHELL-PKG-004`;
- define ventanas de deprecación, reservadas a `SHELL-PKG-005`;
- ejecuta rollback, actualizaciones o migraciones de consumidores;
- modifica datos, migraciones o configuración de Supabase.

#### 4. Convención canónica de tags y títulos

##### 4.1. Patrones materializados

| ID            | Package             | Slug canónico | Tag estable            | Ejemplo estable     | Ejemplo prerelease         | Título de release            |
| ------------- | ------------------- | ------------- | ---------------------- | ------------------- | -------------------------- | ---------------------------- |
| `REL-TAG-001` | `@vento/contracts`  | `contracts`   | `contracts-v{SEMVER}`  | `contracts-v1.0.0`  | `contracts-v1.0.0-rc.1`    | `@vento/contracts {SEMVER}`  |
| `REL-TAG-002` | `@vento/os-context` | `os-context`  | `os-context-v{SEMVER}` | `os-context-v1.0.0` | `os-context-v1.0.0-beta.1` | `@vento/os-context {SEMVER}` |
| `REL-TAG-003` | `@vento/supabase`   | `supabase`    | `supabase-v{SEMVER}`   | `supabase-v1.0.0`   | `supabase-v1.0.0-alpha.1`  | `@vento/supabase {SEMVER}`   |
| `REL-TAG-004` | `@vento/ui-web`     | `ui-web`      | `ui-web-v{SEMVER}`     | `ui-web-v1.0.0`     | `ui-web-v1.0.0-rc.1`       | `@vento/ui-web {SEMVER}`     |

**Conciliación:** cuatro familias, cuatro slugs, cuatro patrones de tag, cuatro patrones de título, cero faltantes y cero colisiones.

##### 4.2. Gramática obligatoria

Un tag canónico tendrá esta forma:

```text
<package-slug>-v<SEMVER>
```

Donde:

- `<package-slug>` será exactamente uno de `contracts`, `os-context`, `supabase` o `ui-web`;
- `v` será literal y minúscula;
- `<SEMVER>` conservará exactamente el número aprobado por `SHELL-PKG-002`;
- los sufijos permitidos serán exclusivamente `alpha.N`, `beta.N` y `rc.N`;
- `N` será entero positivo sin ceros iniciales;
- no se agregarán fechas, nombres de rama, hashes, ambientes ni canales fuera de SemVer al nombre del tag;
- metadata `+build` no será identidad canónica de release.

Patrón estructural:

```regex
^(contracts|os-context|supabase|ui-web)-v(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)(?:-(alpha|beta|rc)\.([1-9][0-9]*))?$
```

##### 4.3. Variantes prohibidas

No serán válidos:

- tags globales como `vento-v1.0.0` o `packages-v1.0.0`;
- tags sin familia o sin versión completa;
- slugs alternativos, abreviados o traducidos;
- mayúsculas o espacios;
- tags de una familia usando el nombre de otra;
- un tag estable asociado a un release marcado como prerelease;
- un tag prerelease asociado a un release estable;
- reutilizar `0.1.0` del workspace transitorio como primera estable;
- usar un alias mutable de registry como sustituto del tag Git.

#### 5. Relación entre package, versión, tag y release

##### 5.1. Unidad de identidad

Cada publicación deberá demostrar simultáneamente:

| Campo                | Regla                                                 |
| -------------------- | ----------------------------------------------------- |
| `package_name`       | coincide exactamente con una de las cuatro familias   |
| `package_version`    | coincide con `version` del manifest publicado         |
| `package_tag`        | usa el slug de la familia y la misma versión completa |
| `release_title`      | usa el nombre npm completo y la misma versión         |
| `source_commit`      | contiene el manifest y el código fuente del artefacto |
| `package_artifact`   | fue construido desde el commit identificado           |
| `artifact_integrity` | checksum o integridad verificable del tarball         |
| `registry_integrity` | resolución reproducible del artefacto publicado       |
| `release_channel`    | estable, alpha, beta o rc según el sufijo SemVer      |
| `test_evidence`      | resultados atribuibles al package, versión y commit   |

Una coincidencia parcial no constituye una release canónica. Si manifest, tag, título, commit o artefacto discrepan, la publicación queda bloqueada.

##### 5.2. Cardinalidad

Se aplican estas cardinalidades:

```text
1 package_version publicada → 1 tag canónico
1 tag canónico → 1 release canónico
1 release canónico → 1 package y 1 versión
1 tag canónico → 1 commit de origen
1 package_version → 1 contenido inmutable
```

Un commit podrá ser origen de varios tags de familias distintas. Esa posibilidad no altera la cardinalidad por familia y versión.

#### 6. Naturaleza e inmutabilidad

##### 6.1. Tag Git

El tag canónico será:

- anotado;
- único;
- asociado a una sola familia y versión;
- creado únicamente después de completar las puertas aplicables;
- inmutable una vez publicado;
- conservado como evidencia histórica aunque la versión sea superada o deprecada.

##### 6.2. Release

El release será el registro asociado al tag y contendrá notas, evidencia, dependencias, riesgos y recuperación. Un borrador no constituye release publicada ni identidad distribuible.

La publicación del tag y del release no sustituye la publicación del package en el registry, pero los tres elementos deberán resolver a la misma identidad y al mismo artefacto.

##### 6.3. Correcciones posteriores

Si se detecta un defecto después de publicar:

1. el tag no se moverá;
2. el release no se reasociará a otro tag o commit;
3. el manifest y el tarball existentes no se sobrescribirán;
4. se clasificará el cambio según SemVer;
5. se publicará una versión nueva;
6. se crearán un tag y un release nuevos;
7. la versión defectuosa conservará historial y evidencia;
8. cualquier aviso de deprecación se realizará sin alterar los bytes publicados.

Eliminar y recrear un tag o release para ocultar una corrección queda prohibido como flujo ordinario.

#### 7. Canales y ciclo de vida

##### 7.1. Correspondencia de canales

| Canal    | Sufijo del tag | Estado del release | Uso                                                       |
| -------- | -------------- | ------------------ | --------------------------------------------------------- |
| `alpha`  | `-alpha.N`     | prerelease         | API, packaging o integración sujetos a cambios frecuentes |
| `beta`   | `-beta.N`      | prerelease         | API candidata con integración de consumidores en curso    |
| `rc`     | `-rc.N`        | prerelease         | candidato sin rupturas previstas antes de la estable      |
| `stable` | sin sufijo     | release estable    | contrato aprobado y evidencia completa                    |

La promoción no modifica una prerelease existente. Cada artefacto diferente recibe una nueva versión y un nuevo tag. La release estable `1.0.0` es distinta de `1.0.0-rc.N` aunque derive del mismo proceso de estabilización.

##### 7.2. Estados documentales permitidos

| Estado                 | Significado                                                                     |
| ---------------------- | ------------------------------------------------------------------------------- |
| `BORRADOR`             | preparación no publicada; no otorga identidad canónica                          |
| `PRERELEASE_PUBLICADA` | tag y release publicados con sufijo prerelease coherente                        |
| `ESTABLE_PUBLICADA`    | tag y release publicados sin sufijo y con evidencia completa                    |
| `SUPERADA`             | existe una versión posterior; la identidad histórica permanece                  |
| `DEPRECADA`            | su consumo se desaconseja según la política propietaria; la identidad permanece |

Transiciones ordinarias:

```text
BORRADOR → PRERELEASE_PUBLICADA
BORRADOR → ESTABLE_PUBLICADA
PRERELEASE_PUBLICADA → SUPERADA | DEPRECADA
ESTABLE_PUBLICADA → SUPERADA | DEPRECADA
SUPERADA → DEPRECADA
```

No se permite convertir una release estable publicada en prerelease, ni cambiar su versión, tag, commit o package.

#### 8. Cortes coordinados de varias familias

##### 8.1. Reglas

Un corte coordinado podrá incluir de una a cuatro familias, sujeto a estas reglas:

1. solo reciben versión, tag y release las familias cuyo artefacto o manifest cambió;
2. cada familia calcula su incremento SemVer de forma independiente;
3. varios tags podrán apuntar al mismo commit de origen;
4. ningún tag podrá representar más de una familia;
5. cada release declarará los tags compañeros del corte o `NO_APLICA`;
6. las dependencias internas usarán versiones exactas existentes o publicadas en el mismo corte;
7. el orden de publicación respetará el grafo de dependencias;
8. una release estable no dependerá de una prerelease interna;
9. una familia sin cambios no recibirá una versión artificial para igualar números;
10. un fallo en una familia bloqueará su publicación y la de sus dependientes, pero no reescribirá releases ya publicadas.

##### 8.2. Matriz de ejemplo vinculante

| Familia             | Cambio del corte                                         | Clasificación | Tag y release | Resultado                    |
| ------------------- | -------------------------------------------------------- | ------------- | ------------- | ---------------------------- |
| `@vento/contracts`  | nuevo schema compatible                                  | `MINOR`       | sí            | publica su nueva versión     |
| `@vento/os-context` | actualiza dependencia exacta de contracts sin romper API | `PATCH`       | sí            | publica después de contracts |
| `@vento/supabase`   | sin cambios                                              | `NO_RELEASE`  | no            | conserva su versión vigente  |
| `@vento/ui-web`     | sin cambios                                              | `NO_RELEASE`  | no            | conserva su versión vigente  |

La tabla ilustra la regla; no constituye una publicación física ni asigna números reales de release.

#### 9. Contenido mínimo del release

Cada release publicada deberá incluir:

1. package y versión exactos;
2. tag canónico;
3. commit de origen;
4. canal y estado;
5. fecha y actor o workflow publicador;
6. resumen del propósito;
7. clasificación SemVer y razón;
8. cambios por categorías `Added`, `Changed`, `Deprecated`, `Removed`, `Fixed` y `Security`, usando `NONE` cuando corresponda;
9. cambios del API público y snapshots antes/después;
10. dependencias internas y externas modificadas;
11. tags compañeros del corte;
12. artefacto, checksum e integridad del registry;
13. matriz de compatibilidad aplicable;
14. resultados de pruebas propias del package;
15. resultados de consumidores afectados;
16. riesgos y restricciones conocidos;
17. instrucciones de migración cuando corresponda;
18. versión anterior restituible y referencia de rollback;
19. requisitos `TREQ-*` afectados y sus resultados;
20. conformidad del propietario y de los consumidores afectados.

Una nota de release no sustituye la evidencia. Los campos que afirmen una ejecución deberán enlazar o identificar un resultado reproducible.

#### 10. Condiciones previas a publicación

##### 10.1. Prerelease

Antes de publicar una prerelease deberán existir:

- manifest y versión coherentes;
- tag previsto válido y no utilizado;
- build distribuible del package;
- tarball inspeccionado;
- commit e integridad identificados;
- pruebas propias aplicables;
- dependencias internas resolubles;
- limitaciones y consumidores de prueba declarados;
- release notes mínimas del canal.

##### 10.2. Release estable

Además de lo anterior, una release estable exige:

- API pública aprobada para la serie mayor;
- exports y declarations publicables;
- matriz de compatibilidad aplicable;
- pruebas propias y de consumidores requeridas;
- evidencia de instalación reproducible;
- ausencia de dependencia interna hacia prereleases;
- rollback identificable;
- requisitos de prueba aplicables sin fallos bloqueantes;
- aprobación del propietario del package y conformidades exigidas.

##### 10.3. Bloqueos absolutos

La publicación queda bloqueada cuando:

- el tag ya existe;
- la versión ya existe con bytes distintos;
- package, manifest, tag o título no coinciden;
- el commit no corresponde al artefacto;
- el canal del release contradice el sufijo SemVer;
- falta una dependencia interna exacta;
- se intenta publicar una familia sin cambios;
- falta una prueba obligatoria;
- existe un fallo bloqueante de package o consumidor;
- la evidencia no es atribuible a la versión exacta.

#### 11. Decisiones vinculantes

| ID            | Decisión                                                       | Estado                 | Destino de materialización                 |
| ------------- | -------------------------------------------------------------- | ---------------------- | ------------------------------------------ |
| `PKG-REL-001` | gobernar exactamente cuatro familias aprobadas                 | `DECIDIDO`             | `SHELL-CI-003`                             |
| `PKG-REL-002` | usar tag independiente por package y versión                   | `DECIDIDO`             | `SHELL-CI-003`                             |
| `PKG-REL-003` | usar slugs `contracts`, `os-context`, `supabase` y `ui-web`    | `DECIDIDO`             | validador de release                       |
| `PKG-REL-004` | exigir prefijo literal `v` antes de SemVer                     | `DECIDIDO`             | validador de tag                           |
| `PKG-REL-005` | prohibir tags globales para varias familias                    | `DECIDIDO`             | `SHELL-CI-003`                             |
| `PKG-REL-006` | vincular package, manifest, tag, release, commit y artefacto   | `DECIDIDO`             | `SHELL-CI-002`; `SHELL-CI-003`             |
| `PKG-REL-007` | crear tags anotados                                            | `DECIDIDO`             | `SHELL-CI-003`                             |
| `PKG-REL-008` | conservar tags y releases publicados como inmutables           | `DECIDIDO`             | `SHELL-CI-003`                             |
| `PKG-REL-009` | corregir mediante nueva versión, tag y release                 | `DECIDIDO`             | `SHELL-CI-003`; `SHELL-CI-004`             |
| `PKG-REL-010` | conservar historial de versiones defectuosas o superadas       | `DECIDIDO`             | registry, Git y changelog                  |
| `PKG-REL-011` | admitir solo `alpha.N`, `beta.N` y `rc.N` como prerelease      | `DECIDIDO`             | `SHELL-CI-003`                             |
| `PKG-REL-012` | exigir coherencia entre sufijo y estado prerelease             | `DECIDIDO`             | validador de release                       |
| `PKG-REL-013` | tratar una estable sin sufijo como release estable             | `DECIDIDO`             | `SHELL-CI-003`                             |
| `PKG-REL-014` | impedir promoción mediante mutación de bytes                   | `DECIDIDO`             | pipeline de publicación                    |
| `PKG-REL-015` | permitir varios tags de familias distintas sobre un commit     | `DECIDIDO`             | cortes coordinados                         |
| `PKG-REL-016` | publicar solo familias con cambio distribuible                 | `DECIDIDO`             | clasificador SemVer y release              |
| `PKG-REL-017` | no forzar lockstep entre familias                              | `DECIDIDO`             | `SHELL-CI-003`                             |
| `PKG-REL-018` | respetar grafo de dependencias internas exactas                | `DECIDIDO`             | pipeline de publicación                    |
| `PKG-REL-019` | impedir release estable dependiente de prerelease interna      | `DECIDIDO`             | gate de release                            |
| `PKG-REL-020` | declarar tags compañeros o `NO_APLICA`                         | `DECIDIDO`             | release notes                              |
| `PKG-REL-021` | conservar checksum e integridad del artefacto                  | `DECIDIDO`             | `SHELL-CI-002`; `SHELL-CI-003`             |
| `PKG-REL-022` | exigir contenido mínimo de release notes                       | `DECIDIDO`             | `SHELL-CI-004`                             |
| `PKG-REL-023` | distinguir notas de evidencia ejecutada                        | `DECIDIDO`             | `SHELL-CI-001`; `SHELL-CI-004`             |
| `PKG-REL-024` | bloquear estable sin matriz de compatibilidad                  | `DECIDIDO`             | `SHELL-CI-005`                             |
| `PKG-REL-025` | bloquear release sin pruebas requeridas                        | `DECIDIDO`             | `SHELL-CI-001`; `SHELL-PKG-008`            |
| `PKG-REL-026` | vincular requisitos `TREQ-*` y resultados                      | `DECIDIDO`             | `SHELL-CI-003`; `SHELL-CI-004`             |
| `PKG-REL-027` | no usar alias de registry como identidad Git                   | `DECIDIDO`             | configuración de distribución              |
| `PKG-REL-028` | no reconocer `0.1.0` privado como primera estable              | `DECIDIDO`             | primera publicación de `@vento/os-context` |
| `PKG-REL-029` | no crear tags, releases ni publicaciones en esta fase          | `RESTRICCION_CANONICA` | fase documental                            |
| `PKG-REL-030` | no modificar consumidores, CI, datos ni Supabase en esta tarea | `RESTRICCION_CANONICA` | fase documental                            |

**Conciliación:** treinta decisiones, treinta identificadores únicos, cero faltantes y cero duplicados.

#### 12. Hallazgos y destinos

| ID                    | Hallazgo                                                                 | Estado                        | Destino o condición de salida                                        |
| --------------------- | ------------------------------------------------------------------------ | ----------------------------- | -------------------------------------------------------------------- |
| `H-SHELL-PKG-003-001` | la tarea anterior usó tres familias no aprobadas por `SHELL-PKG-002`     | `CORREGIDO_DOCUMENTALMENTE`   | este artefacto restituye las cuatro identidades aprobadas            |
| `H-SHELL-PKG-003-002` | no existen tags o releases estables confirmados para las cuatro familias | `PENDIENTE_DE_IMPLEMENTACION` | `SHELL-CI-003`                                                       |
| `H-SHELL-PKG-003-003` | `@vento/os-context@0.1.0` es privado y transitorio                       | `NO_PUBLICABLE_COMO_ESTABLE`  | build y primera estable en tareas propietarias y `SHELL-CI-002..003` |
| `H-SHELL-PKG-003-004` | no existe build independiente confirmado para las cuatro familias        | `PENDIENTE_DE_IMPLEMENTACION` | `SHELL-CI-002`                                                       |
| `H-SHELL-PKG-003-005` | no existe pipeline confirmado que bloquee tags duplicados o mutables     | `PENDIENTE_DE_IMPLEMENTACION` | `SHELL-CI-003` y `TREQ-SHELL-036`                                    |
| `H-SHELL-PKG-003-006` | no existe changelog automático confirmado por package                    | `PENDIENTE_DE_IMPLEMENTACION` | `SHELL-CI-004`                                                       |
| `H-SHELL-PKG-003-007` | no existe matriz ejecutable de compatibilidad confirmada                 | `PENDIENTE_DE_IMPLEMENTACION` | `SHELL-CI-005`                                                       |
| `H-SHELL-PKG-003-008` | no existe prueba confirmada de corte coordinado multi-package            | `PENDIENTE_DE_IMPLEMENTACION` | `SHELL-CI-003` y `TREQ-SHELL-037`                                    |
| `H-SHELL-PKG-003-009` | alias de registry y proveedor concreto todavía no están implementados    | `FUERA_DE_ALCANCE`            | `SHELL-CI-003` bajo la decisión de distribución aprobada             |
| `H-SHELL-PKG-003-010` | esta corrección no autoriza publicación ni cambio de continuidad         | `RESTRICCION_CANONICA`        | conservar hasta fase de implementación autorizada                    |

**Conciliación:** diez hallazgos, diez estados, diez destinos concretos y cero pendientes sin propietario.

#### 13. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

| ID               | Regla protegida                                                                                                                                                           | Tipo                                                 | Prioridad | Momento de implementación                         | Destino                                        |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------- | --------- | ------------------------------------------------- | ---------------------------------------------- |
| `TREQ-SHELL-036` | Correspondencia unívoca e inmutable entre package, versión, manifest, tag, release, commit, canal y artefacto; toda corrección exige una identidad nueva.                 | contractual + integración + regresión / automatizada | crítica   | antes de la primera publicación y en cada release | `SHELL-CI-002`; `SHELL-CI-003`; `SHELL-CI-004` |
| `TREQ-SHELL-037` | Un corte coordinado publica solo familias modificadas, conserva versiones independientes, respeta dependencias exactas y mantiene coherencia entre canal y sufijo SemVer. | contractual + integración + regresión / automatizada | crítica   | antes de habilitar releases multi-package         | `SHELL-CI-001`; `SHELL-CI-003`; `SHELL-CI-005` |

| Operación sobre `TREQ-*` | Cantidad |
| ------------------------ | -------: |
| creados                  |    **2** |
| modificados              |    **0** |
| diferidos                |    **0** |
| descartados              |    **0** |
| obsoletos                |    **0** |

Los requisitos se incorporan al dominio `SHELL` después de `TREQ-SHELL-035`, preservando la secuencia histórica y relacionándose con la cobertura existente de compatibilidad, registro y evidencia.

#### 14. Entregables

1. Inventario corregido de cuatro familias.
2. Cuatro slugs y cuatro patrones de tag.
3. Cuatro patrones de título de release.
4. Gramática exacta de tags estables y prereleases.
5. Contrato de identidad y cardinalidad.
6. Política de inmutabilidad y corrección.
7. Estados y canales de release.
8. Reglas para cortes coordinados.
9. Contenido mínimo de release notes y evidencia.
10. Condiciones y bloqueos previos a publicación.
11. Treinta decisiones materializadas.
12. Diez hallazgos con destino exacto.
13. Dos requisitos de prueba nuevos.

#### 15. Criterios de aceptación

`SHELL-PKG-003` queda materialmente completa cuando:

- aparecen exactamente las cuatro familias aprobadas por `SHELL-PKG-002`;
- no aparecen `@vento/os-telemetry`, `@vento/os-flags` ni `@vento/os-errors` como familias de esta tarea;
- cada familia tiene un slug, patrón de tag y título únicos;
- los ejemplos usan la primera serie estable `1.0.0` o sus prereleases;
- la relación entre package, manifest, versión, tag, release, commit y artefacto es inequívoca;
- tags y releases publicados son inmutables;
- las correcciones exigen nueva versión, tag y release;
- estable, alpha, beta y rc mantienen correspondencia de canal;
- los cortes coordinados no crean versiones artificiales;
- las dependencias internas exactas gobiernan el orden del corte;
- las notas de release contienen evidencia, riesgos y recuperación;
- una release estable queda bloqueada sin pruebas y compatibilidad aplicables;
- se crean `TREQ-SHELL-036` y `TREQ-SHELL-037` sin alterar requisitos históricos;
- no se materializan tags, releases, packages, consumidores, CI, datos o Supabase.

#### 16. Continuidad canónica del bloque

- **ÚLTIMA TAREA APROBADA:** SHELL-PKG-002 — Definir versionado semántico
- **TAREA ACTUAL APROBADA:** SHELL-PKG-003 — Definir tags y releases
- **SIGUIENTE TAREA RESERVADA:** SHELL-PKG-004 — Definir política de compatibilidad

### ✅ SHELL-PKG-004 — Definir política de compatibilidad

**Estado:** APROBADA
**Fecha:** 2026-08-01
**Tarea anterior:** SHELL-PKG-003 — Definir tags y releases
**Tarea siguiente:** SHELL-PKG-005 — Definir política de deprecación
**Tipo de tarea:** Documental
**Fase:** Definición documental vinculante; implementación física no autorizada
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Ubicación canónica:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/02_DISTRIBUCION_Y_PAQUETES_COMPARTIDOS.md`
**Corte remoto de `vento-shell`:** `6870a1fc171a0da58b636f477eb7bdacba4a8f4c`

---

#### 1. Resultado material

Se establece la política canónica de compatibilidad para las cuatro familias de paquetes compartidos aprobadas y los siete repositorios web que integran la fundación compartida de Vento OS.

La unidad de compatibilidad será una combinación verificable e intransferible:

```text
package_name
+ package_version exacta
+ artefacto e integridad
+ repositorio consumidor
+ commit consumidor
+ manifest consumidor
+ lockfile consumidor
+ versiones resueltas del toolchain
+ ambiente de prueba
+ evidencia ejecutada
```

Una banda declarada en `peerDependencies`, `engines` o documentación delimita combinaciones candidatas. Solo una ejecución reproducible contra un consumidor exacto permite declarar una combinación `COMPATIBLE`.

La política aplica inicialmente a:

1. `@vento/contracts`;
2. `@vento/os-context`;
3. `@vento/supabase`;
4. `@vento/ui-web`.

Y a estos repositorios web:

1. `vento-shell`;
2. `vento-viso`;
3. `vento-nexo`;
4. `vento-fogo`;
5. `vento-origo`;
6. `vento-pulso`;
7. `vento-numera`.

| Métrica                                      | Resultado |
| -------------------------------------------- | --------: |
| Familias de paquetes                         |     **4** |
| Repositorios web alcanzados                  |     **7** |
| Relaciones package–consumidor materializadas |    **28** |
| Ejes obligatorios de compatibilidad          |    **12** |
| Estados permitidos                           |     **6** |
| Bandas candidatas iniciales                  |     **4** |
| Decisiones vinculantes                       |    **32** |
| Hallazgos con destino exacto                 |    **12** |
| Combinaciones declaradas compatibles hoy     |     **0** |
| Requisitos `TREQ-*` creados o modificados    |     **0** |

#### 2. Fuentes y corte reproducible

##### 2.1. Fuentes vinculantes

| Fuente                                                            | Uso                                                                                    |
| ----------------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| `docs/plan-canonico/modular/01_PROTOCOLO.md`                      | continuidad, evidencia, fases y requisitos de prueba                                   |
| `docs/plan-canonico/modular/delivery-contract.json`               | estructura física del artefacto documental                                             |
| `docs/plan-canonico/modular/active-sequence.json`                 | segmento vigente `SHELL-PKG-001..008`                                                  |
| `docs/plan-canonico/modular/continuity-route.json`                | ruta documental normal del BLOQUE H                                                    |
| `docs/plan-canonico/modular/00_CABECERA_Y_ESTADO.md`              | última tarea aprobada, tarea actual y siguiente reservada                              |
| `02_DISTRIBUCION_Y_PAQUETES_COMPARTIDOS.md`                       | propietario, tareas `SHELL-PKG-001..004` y decisiones heredadas                        |
| `SHELL-PKG-001 — Elegir mecanismo de distribución`                | versiones exactas, lockfile, `npm ci`, adopción independiente y pruebas del consumidor |
| `SHELL-PKG-002 — Definir versionado semántico`                    | cuatro familias, SemVer independiente e impacto de ampliar o reducir soporte           |
| `SHELL-PKG-003 — Definir tags y releases`                         | identidad de release, cortes coordinados y bloqueo de estable sin compatibilidad       |
| `01_AUDITORIA_DE_COMPONENTES_COMPARTIDOS.md`                      | universo de siete repositorios web y deriva entre copias                               |
| `T_CALIDAD_Y_DESPLIEGUE/01_PAQUETES_RELEASES_Y_COMPATIBILIDAD.md` | implementación futura de pruebas, build, releases, changelog, matriz y PRs             |
| `package.json` de los siete repositorios                          | línea base declarada de Next, React, Supabase, TypeScript y Tailwind                   |
| `packages/os-context/package.json`                                | único package transitorio materializado y su peer de Supabase                          |
| `packages/os-context/README.md`                                   | responsabilidad actual del contexto compartido y exclusión de PASS                     |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`                | cobertura vigente `TREQ-SHELL-006..009` y `TREQ-SHELL-036..037`                        |

##### 2.2. Commits remotos inspeccionados

| ID              | Repositorio                  | Commit de `main` verificado                |
| --------------- | ---------------------------- | ------------------------------------------ |
| `COMP-REPO-001` | `devVentoGroup/vento-shell`  | `6870a1fc171a0da58b636f477eb7bdacba4a8f4c` |
| `COMP-REPO-002` | `devVentoGroup/vento-viso`   | `47322403f3c64e83ae0c4a2f68c05d47093e5bb4` |
| `COMP-REPO-003` | `devVentoGroup/vento-nexo`   | `142c4d696221e3ce3fda4ed3b62f3d1fe5b58799` |
| `COMP-REPO-004` | `devVentoGroup/vento-fogo`   | `b6b9ed00e5267cabaac1a5a1090d93d5f60e86f2` |
| `COMP-REPO-005` | `devVentoGroup/vento-origo`  | `b7a8303fa078ef087f522b6c99059ababfc27472` |
| `COMP-REPO-006` | `devVentoGroup/vento-pulso`  | `71e0184486b5fe11e0a42435baf4024807a80efd` |
| `COMP-REPO-007` | `devVentoGroup/vento-numera` | `1b48a5da425d92e19ed89cf175b1dccc4cd960e1` |

Cada SHA fue comparado contra `main` y resultó idéntico en el corte. La matriz de esta tarea no usa nombres de rama sin commit ni sustituye un commit inspeccionado por una referencia histórica.

##### 2.3. Estado vigente del registro de pruebas

La copia integral inspeccionada de `04A` coincide byte por byte con el blob vigente del remoto:

```text
Git blob SHA-1: 9fb66d61bff5cd86acd4a8b41f0dc933a80a5fa7
SHA-256: 48f4ddc8feffe94b291b7ba929fd775d68a19f51eaa272315d2465f8604c341d
```

El registro contiene 6.324 requisitos, 37 requisitos del dominio `SHELL`, catorce columnas en las 6.324 filas y tiene como última tarea incorporada `SHELL-PKG-003`.

#### 3. Alcance

##### 3.1. Incluido

Esta tarea define:

1. la unidad exacta de compatibilidad;
2. las dimensiones que deben evaluarse;
3. los estados permitidos y sus transiciones;
4. la línea base técnica declarada por cada consumidor;
5. las bandas candidatas iniciales por package;
6. la matriz package–consumidor de 28 relaciones;
7. los requisitos de evidencia para declarar compatibilidad;
8. las reglas de adopción independiente por repositorio;
9. la invalidación y revalidación de evidencia;
10. la relación entre compatibilidad, SemVer, release y lockfile;
11. el contrato mínimo del manifest de compatibilidad;
12. los bloqueos que impiden publicar o adoptar una versión.

##### 3.2. Excluido

Esta tarea no:

- implementa packages, builds, tests, workflows o matrices ejecutables;
- publica versiones, tags, releases o artefactos;
- modifica `package.json`, `package-lock.json`, código, configuración o secretos;
- declara compatible una combinación que no fue ejecutada;
- define períodos de soporte, ventanas de retiro o avisos de deprecación, reservados a `SHELL-PKG-005`;
- define el procedimiento operativo de rollback por aplicación, reservado a `SHELL-PKG-006`;
- crea actualizaciones mediante pull request, reservadas a `SHELL-PKG-007`;
- materializa gates automáticos, reservados a `SHELL-PKG-008`;
- implementa la matriz automatizada, reservada a `SHELL-CI-005`;
- cambia migraciones, datos, RLS, funciones, tipos generados o configuración de Supabase.

#### 4. Unidad y semántica de compatibilidad

##### 4.1. Unidad canónica

Una declaración de compatibilidad deberá referirse exactamente a:

```text
<package>@<version>
× <consumer_repository>@<consumer_commit>
× <consumer_lockfile_hash>
× <resolved_environment>
```

No será válido declarar solamente:

- “compatible con VENTO”;
- “compatible con Next 16” sin rango y evidencia;
- “compatible con todos los consumidores” sin enumerarlos;
- “compatible con main” sin commit;
- “compatible por compilar en vento-shell”;
- “compatible por compartir tipos”;
- “compatible porque el rango de peer dependency lo permite”.

##### 4.2. Banda declarada y combinación verificada

| Concepto                 | Significado                                                                           | Autoridad                                 |
| ------------------------ | ------------------------------------------------------------------------------------- | ----------------------------------------- |
| `BANDA_CANDIDATA`        | rango que el package pretende soportar y que deberá probarse                          | manifest y política de package            |
| `COMBINACION_VERIFICADA` | package, consumidor, commit, lockfile y ambiente que superaron la evidencia exigida   | matriz ejecutada y evidencia reproducible |
| `BANDA_SOPORTADA`        | conjunto de combinaciones verificadas que permite publicar una declaración de soporte | `SHELL-CI-005` y release aplicable        |

Una banda candidata no se convierte en soportada por inferencia. La primera banda soportada de cada package solo existirá cuando `SHELL-CI-005` ejecute y conserve la matriz correspondiente.

##### 4.3. Independencia por consumidor

Cada repositorio puede adoptar una versión compatible en una oleada independiente. La compatibilidad de un repositorio no obliga a actualizar los demás ni demuestra su compatibilidad.

La publicación podrá avanzar cuando todas las combinaciones declaradas obligatorias para ese release estén en estado permitido. La adopción de cada consumidor seguirá requiriendo su propio commit, lockfile, pruebas y aprobación.

#### 5. Línea base técnica declarada por consumidor

| ID              | Repositorio    | Next      | React / React DOM   | Supabase JS | Supabase SSR | TypeScript | Tailwind | `engines.node` | Packages `@vento/*` publicados |
| --------------- | -------------- | --------- | ------------------- | ----------- | ------------ | ---------- | -------- | -------------- | ------------------------------ |
| `COMP-BASE-001` | `vento-shell`  | `16.1.1`  | `19.2.3` / `19.2.3` | `^2.90.1`   | `^0.8.0`     | `^5`       | `^4`     | no declarado   | ninguno                        |
| `COMP-BASE-002` | `vento-viso`   | `^16.1.6` | `19.2.3` / `19.2.3` | `^2.90.1`   | `^0.8.0`     | `^5`       | `^4`     | no declarado   | ninguno                        |
| `COMP-BASE-003` | `vento-nexo`   | `^16.2.3` | `19.2.3` / `19.2.3` | `^2.90.1`   | `^0.8.0`     | `^5`       | `^4`     | no declarado   | ninguno                        |
| `COMP-BASE-004` | `vento-fogo`   | `^16.2.4` | `19.2.3` / `19.2.3` | `^2.90.1`   | `^0.8.0`     | `^5`       | `^4`     | no declarado   | ninguno                        |
| `COMP-BASE-005` | `vento-origo`  | `^16.2.1` | `19.2.3` / `19.2.3` | `^2.90.1`   | `^0.8.0`     | `^5`       | `^4`     | no declarado   | ninguno                        |
| `COMP-BASE-006` | `vento-pulso`  | `16.1.1`  | `19.2.3` / `19.2.3` | `^2.90.1`   | `^0.8.0`     | `^5`       | `^4`     | no declarado   | ninguno                        |
| `COMP-BASE-007` | `vento-numera` | `^16.2.1` | `19.2.3` / `19.2.3` | `^2.90.1`   | `^0.8.0`     | `^5`       | `^4`     | no declarado   | ninguno                        |

**Conciliación:** siete repositorios esperados, siete materializados, siete commits verificados, cero duplicados y cero adopciones publicadas de `@vento/*` confirmadas.

Esta tabla registra especificaciones declaradas en los manifests. No sustituye las versiones efectivamente resueltas por cada lockfile. La matriz ejecutable deberá registrar ambas.

#### 6. Perfiles de compatibilidad por package

Las bandas siguientes son bandas candidatas iniciales. No constituyen soporte verificado hasta superar la matriz ejecutable.

| ID             | Package             | Banda candidata inicial                                                                                                   | Ejes obligatorios                                                     | Dependencias que no deberá introducir                            | Estado actual            |
| -------------- | ------------------- | ------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------- | ---------------------------------------------------------------- | ------------------------ |
| `COMP-PKG-001` | `@vento/contracts`  | TypeScript `>=5 <6`; módulo ESM y declarations consumibles                                                                | exports, schemas, tipos, catálogos, códigos y serialización           | Next, React, Supabase, Tailwind o APIs de navegador              | `PENDIENTE_DE_EVIDENCIA` |
| `COMP-PKG-002` | `@vento/os-context` | TypeScript `>=5 <6`; `@supabase/supabase-js >=2.90.0 <3`                                                                  | contexto efectivo, autorización, browser/server, razones y errores    | React, UI, Tailwind o acoplamiento a una aplicación              | `PENDIENTE_DE_EVIDENCIA` |
| `COMP-PKG-003` | `@vento/supabase`   | TypeScript `>=5 <6`; Supabase JS `>=2.90.1 <3`; Supabase SSR `>=0.8.0 <0.9`; adaptador Next `>=16.1.1 <17` cuando aplique | tipos `Database`, cliente browser/server, cookies, RPC, errores y SSR | componentes UI o reglas de negocio de una aplicación             | `PENDIENTE_DE_EVIDENCIA` |
| `COMP-PKG-004` | `@vento/ui-web`     | TypeScript `>=5 <6`; Next `>=16.1.1 <17`; React y React DOM `>=19.2.3 <20`; Tailwind `>=4 <5`                             | SSR, hydration, props, eventos, DOM, accesibilidad, tokens y CSS      | acceso directo a datos, permisos efectivos o procesos de dominio | `PENDIENTE_DE_EVIDENCIA` |

Reglas:

1. React y React DOM deberán conservar una pareja compatible y resolverse de manera coherente en cada consumidor.
2. Una banda de Next no autoriza usar APIs privadas o experimentales no cubiertas por las pruebas.
3. Un adapter específico de framework deberá exponerse mediante un subpath explícito; el core del package no heredará innecesariamente ese peer.
4. Las dependencias internas `@vento/*` continuarán siendo exactas.
5. Los peers externos tendrán límite superior de major, o de minor cuando se trate de una dependencia `0.x`.
6. El rango actual `@supabase/supabase-js >=2.90.0` de `@vento/os-context` deberá recibir límite superior antes de una release estable.
7. Ninguna banda podrá certificarse mientras los repositorios consumidores no declaren y prueben un runtime Node reproducible.

#### 7. Ejes obligatorios de compatibilidad

| ID              | Eje                        | Evidencia mínima                                                                                                |
| --------------- | -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| `COMP-AXIS-001` | instalación reproducible   | instalación limpia con manifest y lockfile coherentes, sin regeneración silenciosa                              |
| `COMP-AXIS-002` | identidad del artefacto    | package, versión, tag, checksum, commit y contenido publicable coincidentes                                     |
| `COMP-AXIS-003` | exports y módulos          | imports públicos, subpaths, ESM, tree-shaking y ausencia de imports internos no soportados                      |
| `COMP-AXIS-004` | TypeScript                 | declarations consumibles, typecheck del package y del consumidor, sin `skipLibCheck` usado para ocultar ruptura |
| `COMP-AXIS-005` | runtime y Node             | `engines`, runtime real, APIs de plataforma y configuración del ambiente compatibles                            |
| `COMP-AXIS-006` | Next y SSR                 | build, server components, client boundaries, cookies, middleware o proxy y ejecución SSR aplicables             |
| `COMP-AXIS-007` | React e hidratación        | render server/client, hydration, hooks, contextos y pareja React/React DOM coherentes                           |
| `COMP-AXIS-008` | Supabase                   | clientes browser/server, sesión, cookies, tipos generados, RPC y errores normalizados                           |
| `COMP-AXIS-009` | contratos y comportamiento | schemas, catálogos, códigos, serialización, errores y semántica observable                                      |
| `COMP-AXIS-010` | contexto y autorización    | identidad real, contexto operativo, simulación, dispositivo compartido, razones y denegaciones                  |
| `COMP-AXIS-011` | UI, CSS y accesibilidad    | props, eventos, DOM, foco, teclado, lectores, tokens, estilos y composición visual                              |
| `COMP-AXIS-012` | consumidor                 | lint, typecheck, build, pruebas contractuales, integración, regresión y smoke/E2E aplicables                    |

Un eje podrá marcarse `NO_APLICA` únicamente con justificación por package y consumidor. La ausencia de una prueba implementada produce `PENDIENTE_DE_EVIDENCIA`, no `COMPATIBLE`.

#### 8. Estados y transiciones

##### 8.1. Estados permitidos

| Estado                         | Significado                                                                                               |
| ------------------------------ | --------------------------------------------------------------------------------------------------------- |
| `NO_APLICA`                    | el package o eje no forma parte del contrato del consumidor y existe justificación verificable            |
| `PENDIENTE_DE_EVIDENCIA`       | la relación es aplicable, pero falta package, build, adopción, prueba o evidencia atribuible              |
| `COMPATIBLE`                   | todos los ejes obligatorios superaron la matriz para la combinación exacta                                |
| `COMPATIBLE_CON_RESTRICCIONES` | la combinación superó los ejes autorizados y conserva restricciones explícitas, verificables y no ocultas |
| `INCOMPATIBLE`                 | existe una ruptura reproducible entre package y consumidor                                                |
| `BLOQUEADA`                    | no puede evaluarse por una precondición incumplida o un riesgo que impide ejecutar la matriz              |

##### 8.2. Transiciones permitidas

```text
PENDIENTE_DE_EVIDENCIA → COMPATIBLE
PENDIENTE_DE_EVIDENCIA → COMPATIBLE_CON_RESTRICCIONES
PENDIENTE_DE_EVIDENCIA → INCOMPATIBLE
PENDIENTE_DE_EVIDENCIA → BLOQUEADA
BLOQUEADA → PENDIENTE_DE_EVIDENCIA
INCOMPATIBLE → PENDIENTE_DE_EVIDENCIA
COMPATIBLE → PENDIENTE_DE_EVIDENCIA
COMPATIBLE_CON_RESTRICCIONES → PENDIENTE_DE_EVIDENCIA
NO_APLICA → PENDIENTE_DE_EVIDENCIA
```

Toda modificación de package, consumidor, lockfile, runtime o banda invalida la evidencia anterior y devuelve la combinación a `PENDIENTE_DE_EVIDENCIA` hasta revalidación.

##### 8.3. Restricciones permitidas

Una combinación solo podrá quedar `COMPATIBLE_CON_RESTRICCIONES` cuando se documenten:

- subpaths autorizados;
- capacidades excluidas;
- ambiente permitido;
- flags o configuración requeridos;
- limitación temporal con tarea propietaria;
- riesgo aceptado y condición de salida;
- pruebas que sí fueron ejecutadas;
- bloqueo de producción cuando corresponda.

No se usarán restricciones para ocultar fallos, omitir consumidores obligatorios o mantener indefinidamente una incompatibilidad.

#### 9. Matriz package–consumidor vigente

Las 28 relaciones son aplicables por diseño, pero ninguna puede declararse compatible en el corte porque no existen releases publicadas ni adopciones verificadas de las cuatro familias.

| ID                | Package             | Consumidor     | Aplicabilidad | Evidencia actual                                    | Estado                   |
| ----------------- | ------------------- | -------------- | ------------- | --------------------------------------------------- | ------------------------ |
| `PKG-COMP-MX-001` | `@vento/contracts`  | `vento-shell`  | `APLICA`      | package y adopción no materializados                | `PENDIENTE_DE_EVIDENCIA` |
| `PKG-COMP-MX-002` | `@vento/contracts`  | `vento-viso`   | `APLICA`      | package y adopción no materializados                | `PENDIENTE_DE_EVIDENCIA` |
| `PKG-COMP-MX-003` | `@vento/contracts`  | `vento-nexo`   | `APLICA`      | package y adopción no materializados                | `PENDIENTE_DE_EVIDENCIA` |
| `PKG-COMP-MX-004` | `@vento/contracts`  | `vento-fogo`   | `APLICA`      | package y adopción no materializados                | `PENDIENTE_DE_EVIDENCIA` |
| `PKG-COMP-MX-005` | `@vento/contracts`  | `vento-origo`  | `APLICA`      | package y adopción no materializados                | `PENDIENTE_DE_EVIDENCIA` |
| `PKG-COMP-MX-006` | `@vento/contracts`  | `vento-pulso`  | `APLICA`      | package y adopción no materializados                | `PENDIENTE_DE_EVIDENCIA` |
| `PKG-COMP-MX-007` | `@vento/contracts`  | `vento-numera` | `APLICA`      | package y adopción no materializados                | `PENDIENTE_DE_EVIDENCIA` |
| `PKG-COMP-MX-008` | `@vento/os-context` | `vento-shell`  | `APLICA`      | workspace privado sin release ni adopción publicada | `PENDIENTE_DE_EVIDENCIA` |
| `PKG-COMP-MX-009` | `@vento/os-context` | `vento-viso`   | `APLICA`      | no existe dependencia publicada ni matriz ejecutada | `PENDIENTE_DE_EVIDENCIA` |
| `PKG-COMP-MX-010` | `@vento/os-context` | `vento-nexo`   | `APLICA`      | no existe dependencia publicada ni matriz ejecutada | `PENDIENTE_DE_EVIDENCIA` |
| `PKG-COMP-MX-011` | `@vento/os-context` | `vento-fogo`   | `APLICA`      | no existe dependencia publicada ni matriz ejecutada | `PENDIENTE_DE_EVIDENCIA` |
| `PKG-COMP-MX-012` | `@vento/os-context` | `vento-origo`  | `APLICA`      | no existe dependencia publicada ni matriz ejecutada | `PENDIENTE_DE_EVIDENCIA` |
| `PKG-COMP-MX-013` | `@vento/os-context` | `vento-pulso`  | `APLICA`      | no existe dependencia publicada ni matriz ejecutada | `PENDIENTE_DE_EVIDENCIA` |
| `PKG-COMP-MX-014` | `@vento/os-context` | `vento-numera` | `APLICA`      | no existe dependencia publicada ni matriz ejecutada | `PENDIENTE_DE_EVIDENCIA` |
| `PKG-COMP-MX-015` | `@vento/supabase`   | `vento-shell`  | `APLICA`      | package y adopción no materializados                | `PENDIENTE_DE_EVIDENCIA` |
| `PKG-COMP-MX-016` | `@vento/supabase`   | `vento-viso`   | `APLICA`      | package y adopción no materializados                | `PENDIENTE_DE_EVIDENCIA` |
| `PKG-COMP-MX-017` | `@vento/supabase`   | `vento-nexo`   | `APLICA`      | package y adopción no materializados                | `PENDIENTE_DE_EVIDENCIA` |
| `PKG-COMP-MX-018` | `@vento/supabase`   | `vento-fogo`   | `APLICA`      | package y adopción no materializados                | `PENDIENTE_DE_EVIDENCIA` |
| `PKG-COMP-MX-019` | `@vento/supabase`   | `vento-origo`  | `APLICA`      | package y adopción no materializados                | `PENDIENTE_DE_EVIDENCIA` |
| `PKG-COMP-MX-020` | `@vento/supabase`   | `vento-pulso`  | `APLICA`      | package y adopción no materializados                | `PENDIENTE_DE_EVIDENCIA` |
| `PKG-COMP-MX-021` | `@vento/supabase`   | `vento-numera` | `APLICA`      | package y adopción no materializados                | `PENDIENTE_DE_EVIDENCIA` |
| `PKG-COMP-MX-022` | `@vento/ui-web`     | `vento-shell`  | `APLICA`      | package y adopción no materializados                | `PENDIENTE_DE_EVIDENCIA` |
| `PKG-COMP-MX-023` | `@vento/ui-web`     | `vento-viso`   | `APLICA`      | package y adopción no materializados                | `PENDIENTE_DE_EVIDENCIA` |
| `PKG-COMP-MX-024` | `@vento/ui-web`     | `vento-nexo`   | `APLICA`      | package y adopción no materializados                | `PENDIENTE_DE_EVIDENCIA` |
| `PKG-COMP-MX-025` | `@vento/ui-web`     | `vento-fogo`   | `APLICA`      | package y adopción no materializados                | `PENDIENTE_DE_EVIDENCIA` |
| `PKG-COMP-MX-026` | `@vento/ui-web`     | `vento-origo`  | `APLICA`      | package y adopción no materializados                | `PENDIENTE_DE_EVIDENCIA` |
| `PKG-COMP-MX-027` | `@vento/ui-web`     | `vento-pulso`  | `APLICA`      | package y adopción no materializados                | `PENDIENTE_DE_EVIDENCIA` |
| `PKG-COMP-MX-028` | `@vento/ui-web`     | `vento-numera` | `APLICA`      | package y adopción no materializados                | `PENDIENTE_DE_EVIDENCIA` |

**Conciliación:** 4 packages × 7 consumidores = 28 relaciones; 28 identificadores únicos; 28 aplicables; 28 pendientes de evidencia; 0 compatibles; 0 incompatibles declaradas; 0 faltantes.

PASS, ANIMA, TALENTO y las superficies móviles no pertenecen a esta matriz web. Su incorporación futura requerirá una tarea propietaria y un contrato de compatibilidad específico; no se infiere desde la matriz web.

#### 10. Política de publicación y adopción

##### 10.1. Publicación del package

Antes de publicar una versión estable deberán existir:

1. build reproducible del package;
2. identidad de release conforme a `SHELL-PKG-003`;
3. manifest de compatibilidad completo;
4. banda candidata declarada sin rangos flotantes ilimitados;
5. pruebas propias del package;
6. matriz de consumidores obligatorios;
7. cero relaciones obligatorias en `INCOMPATIBLE` o `BLOQUEADA`;
8. cero relaciones obligatorias en `PENDIENTE_DE_EVIDENCIA`;
9. restricciones explícitas y aprobadas para cualquier `COMPATIBLE_CON_RESTRICCIONES`;
10. referencia de rollback disponible conforme a la tarea propietaria;
11. requisitos de prueba aplicables con evidencia atribuible;
12. aprobación del propietario técnico del package.

Una prerelease podrá limitar su matriz a consumidores piloto declarados, pero no podrá presentarse como compatible con consumidores no ejecutados ni habilitar adopción productiva estable.

##### 10.2. Adopción por consumidor

Cada consumidor deberá:

1. instalar una versión exacta del package;
2. actualizar manifest y lockfile juntos;
3. ejecutar instalación bloqueada;
4. registrar versiones resueltas de peers y toolchain;
5. ejecutar los ejes aplicables;
6. conservar evidencia asociada al commit consumidor;
7. declarar restricciones o incompatibilidades encontradas;
8. evitar `overrides`, aliases o copias locales que oculten el resultado;
9. impedir merge y despliegue cuando falte evidencia obligatoria;
10. adoptar mediante un cambio revisable propio, sin actualización simultánea obligatoria de los demás repositorios.

##### 10.3. Prohibiciones

Queda prohibido:

- declarar compatibilidad por similitud de versiones;
- reutilizar evidencia de otro consumidor;
- reutilizar evidencia de otra versión del package;
- certificar un rango completo probando un solo extremo sin estrategia explícita;
- probar con un lockfile y desplegar con otro;
- omitir un consumidor obligatorio porque no tiene pruebas implementadas;
- usar `skipLibCheck`, casts globales, mocks permisivos o flags ocultos para producir un falso verde;
- convertir una incompatibilidad en `NO_APLICA` sin cambiar el contrato aprobado;
- ampliar automáticamente una banda porque una dependencia externa publicó una nueva versión;
- permitir que una release estable dependa de una prerelease interna;
- actualizar directamente los consumidores desde el pipeline de publicación.

#### 11. Reglas de bandas y cambios de framework

##### 11.1. Clasificación SemVer

| Cambio de compatibilidad                                                                             | Nivel mínimo del package |
| ---------------------------------------------------------------------------------------------------- | ------------------------ |
| ampliar una banda soportada sin retirar combinaciones existentes                                     | `MINOR`                  |
| añadir un consumidor soportado                                                                       | `MINOR`                  |
| corregir una incompatibilidad dentro de una banda ya prometida sin cambiar API                       | `PATCH`                  |
| reducir una banda soportada                                                                          | `MAJOR`                  |
| retirar un consumidor previamente soportado                                                          | `MAJOR`                  |
| exigir una versión mayor nueva de Next, React, Supabase, TypeScript o Tailwind y retirar la anterior | `MAJOR`                  |
| cambiar solo evidencia sin cambiar artefacto ni manifest                                             | `NO_RELEASE`             |

La clasificación respeta `SHELL-PKG-002`. La severidad del defecto o la urgencia no rebajan el nivel requerido.

##### 11.2. Revalidación por dependencias externas

Una combinación vuelve a `PENDIENTE_DE_EVIDENCIA` cuando cambia cualquiera de estos insumos:

- versión del package;
- commit o lockfile del consumidor;
- versión resuelta de Next;
- versión resuelta de React o React DOM;
- versión resuelta de Supabase JS o Supabase SSR;
- versión de TypeScript;
- runtime Node;
- formato de módulos o configuración de build;
- Tailwind, PostCSS o contrato CSS cuando aplique;
- tipos generados de Supabase;
- catálogo, schema, permiso, razón o contrato consumido;
- ambiente o configuración relevante;
- prueba o fixture que define el resultado esperado.

El tiempo por sí solo no invalida una evidencia. La evidencia se invalida cuando cambia una entrada o cuando un defecto reproducible demuestra que la declaración era incorrecta.

##### 11.3. Extremos de una banda

La matriz ejecutable deberá definir una estrategia de extremos:

- mínimo soportado;
- máximo probado dentro de la banda;
- versión efectiva de cada consumidor;
- combinación de peers relevante;
- escenarios de SSR y navegador cuando apliquen.

No se prometerá soporte para una banda más amplia que la efectivamente cubierta por la estrategia de prueba.

#### 12. Manifest de compatibilidad

Cada release deberá producir un registro consumible con al menos:

| Campo                    | Obligación                                                            |
| ------------------------ | --------------------------------------------------------------------- |
| `package_name`           | nombre exacto del package                                             |
| `package_version`        | versión SemVer exacta                                                 |
| `package_tag`            | tag canónico de `SHELL-PKG-003`                                       |
| `source_commit`          | commit de origen del artefacto                                        |
| `artifact_integrity`     | checksum o integridad del tarball                                     |
| `candidate_bands`        | rangos que se pretende soportar                                       |
| `supported_bands`        | rangos respaldados por evidencia o `NONE`                             |
| `consumer_repository`    | repositorio exacto                                                    |
| `consumer_commit`        | commit probado                                                        |
| `consumer_manifest_hash` | identidad del manifest probado                                        |
| `consumer_lockfile_hash` | identidad del lockfile probado                                        |
| `resolved_versions`      | Next, React, React DOM, Supabase, TypeScript, Node y otras aplicables |
| `applicable_axes`        | ejes evaluados y justificaciones `NO_APLICA`                          |
| `compatibility_state`    | uno de los seis estados permitidos                                    |
| `restrictions`           | restricciones o `NONE`                                                |
| `test_results`           | resultados por eje                                                    |
| `evidence_refs`          | ejecuciones y artefactos reproducibles                                |
| `environment`            | CI, staging u otro ambiente controlado                                |
| `evaluated_at`           | fecha y hora de la evaluación                                         |
| `decision_owner`         | propietario técnico y aprobadores requeridos                          |
| `invalidated_by`         | entrada que invalidó evidencia previa o `NONE`                        |

El manifest será inmutable para una versión y ejecución determinadas. Una revalidación genera una instancia nueva y conserva el historial anterior.

#### 13. Bloqueos de compatibilidad

Una publicación o adopción queda bloqueada cuando:

1. falta el package o su artefacto reproducible;
2. el package exporta directamente fuente transitoria no preparada para distribución;
3. falta `engines.node` o no se conoce el runtime realmente usado;
4. existe un peer sin límite superior que permite majors no evaluados;
5. package, tag, manifest, commit o checksum no coinciden;
6. el consumidor no tiene lockfile coherente;
7. el lockfile cambió después de la ejecución;
8. falta un eje obligatorio;
9. un consumidor obligatorio está `INCOMPATIBLE`, `BLOQUEADA` o `PENDIENTE_DE_EVIDENCIA`;
10. una restricción contradice el uso productivo previsto;
11. una estable depende de una prerelease interna;
12. el build o typecheck solo pasa ocultando errores de librerías;
13. no existe evidencia atribuible al commit y ambiente declarados;
14. el cambio reduce soporte sin incremento `MAJOR`;
15. se intenta presentar una banda candidata como banda soportada.

#### 14. Decisiones vinculantes

| ID             | Decisión                                                              | Estado                 | Destino de materialización               |
| -------------- | --------------------------------------------------------------------- | ---------------------- | ---------------------------------------- |
| `PKG-COMP-001` | gobernar exactamente cuatro familias aprobadas                        | `DECIDIDO`             | `SHELL-CI-005`                           |
| `PKG-COMP-002` | evaluar exactamente siete repositorios web                            | `DECIDIDO`             | `SHELL-CI-005`; paquetes E5 consumidores |
| `PKG-COMP-003` | usar package, versión, consumidor, commit y lockfile como unidad      | `DECIDIDO`             | manifest de compatibilidad               |
| `PKG-COMP-004` | diferenciar banda candidata, combinación verificada y banda soportada | `DECIDIDO`             | `SHELL-CI-005`                           |
| `PKG-COMP-005` | prohibir inferir compatibilidad desde un peer range                   | `DECIDIDO`             | gates de release y adopción              |
| `PKG-COMP-006` | exigir versiones exactas para packages VENTO                          | `DECIDIDO`             | manifests consumidores                   |
| `PKG-COMP-007` | conservar manifest y lockfile juntos                                  | `DECIDIDO`             | PR de consumidor                         |
| `PKG-COMP-008` | permitir adopción independiente por repositorio                       | `DECIDIDO`             | `SHELL-PKG-006`; `SHELL-PKG-007`         |
| `PKG-COMP-009` | materializar 28 relaciones package–consumidor                         | `DECIDIDO`             | matriz ejecutable                        |
| `PKG-COMP-010` | mantener las 28 relaciones pendientes hasta evidencia real            | `DECIDIDO`             | estado inicial de `SHELL-CI-005`         |
| `PKG-COMP-011` | evaluar doce ejes de compatibilidad                                   | `DECIDIDO`             | pruebas de package y consumidor          |
| `PKG-COMP-012` | exigir typecheck del consumidor sin ocultar errores                   | `DECIDIDO`             | CI consumidor                            |
| `PKG-COMP-013` | exigir build y SSR cuando aplique                                     | `DECIDIDO`             | CI consumidor                            |
| `PKG-COMP-014` | exigir pruebas de contexto y autorización para os-context             | `DECIDIDO`             | `SHELL-CI-001`; `AUTH-QA-027`            |
| `PKG-COMP-015` | exigir clientes browser/server y RPC para supabase                    | `DECIDIDO`             | `SHELL-DB-*`; `SHELL-CI-001`             |
| `PKG-COMP-016` | exigir DOM, hydration, CSS y accesibilidad para ui-web                | `DECIDIDO`             | `SHELL-UI-*`; pruebas de consumidor      |
| `PKG-COMP-017` | mantener contracts libre de dependencias de framework                 | `DECIDIDO`             | `SHELL-CON-*`                            |
| `PKG-COMP-018` | limitar peers externos por major o minor `0.x`                        | `DECIDIDO`             | manifests de packages                    |
| `PKG-COMP-019` | exigir límite `<3` para Supabase JS en os-context                     | `DECIDIDO`             | `SHELL-AUTH-001`; `SHELL-CI-002`         |
| `PKG-COMP-020` | exigir runtime Node declarado antes de estable                        | `DECIDIDO`             | repositorios y matriz CI                 |
| `PKG-COMP-021` | tratar la línea base actual como evidencia, no promesa permanente     | `DECIDIDO`             | manifest de compatibilidad               |
| `PKG-COMP-022` | usar seis estados canónicos                                           | `DECIDIDO`             | matriz y validadores                     |
| `PKG-COMP-023` | devolver a pendiente toda combinación cuyas entradas cambien          | `DECIDIDO`             | invalidación automática                  |
| `PKG-COMP-024` | impedir estable con relaciones obligatorias sin evidencia             | `DECIDIDO`             | `SHELL-PKG-008`; `SHELL-CI-003`          |
| `PKG-COMP-025` | permitir prerelease solo con pilotos explícitos                       | `DECIDIDO`             | release prerelease                       |
| `PKG-COMP-026` | clasificar ampliación de soporte como MINOR                           | `DECIDIDO`             | `SHELL-PKG-002`; changelog               |
| `PKG-COMP-027` | clasificar reducción de soporte como MAJOR                            | `DECIDIDO`             | `SHELL-PKG-002`; deprecación             |
| `PKG-COMP-028` | conservar historial de evaluaciones e invalidaciones                  | `DECIDIDO`             | evidencia CI                             |
| `PKG-COMP-029` | excluir móviles hasta contrato propietario                            | `DECIDIDO`             | tareas futuras de ANIMA, PASS y TALENTO  |
| `PKG-COMP-030` | no confundir lint o build aislado con matriz completa                 | `DECIDIDO`             | `SHELL-CI-005`                           |
| `PKG-COMP-031` | no implementar ni publicar en esta fase                               | `RESTRICCION_CANONICA` | implementación posterior                 |
| `PKG-COMP-032` | no modificar código, consumidores, CI, datos ni Supabase              | `RESTRICCION_CANONICA` | fase documental                          |

**Conciliación:** treinta y dos decisiones, treinta y dos identificadores únicos, cero faltantes y cero duplicados.

#### 15. Hallazgos y destinos exactos

| ID                    | Hallazgo                                                                                  | Estado                        | Destino o condición de salida                                       |
| --------------------- | ----------------------------------------------------------------------------------------- | ----------------------------- | ------------------------------------------------------------------- |
| `H-SHELL-PKG-004-001` | los siete repositorios usan Next 16, pero con especificaciones entre `16.1.1` y `^16.2.4` | `BANDA_NO_CERTIFICADA`        | `SHELL-CI-005` debe ejecutar mínimos, máximos y versiones efectivas |
| `H-SHELL-PKG-004-002` | React y React DOM están declarados en `19.2.3` en los siete repositorios                  | `LINEA_BASE_COMUN`            | conservar pareja coherente y validar hydration por consumidor       |
| `H-SHELL-PKG-004-003` | Supabase JS `^2.90.1` y Supabase SSR `^0.8.0` están declarados en los siete repositorios  | `LINEA_BASE_COMUN`            | `SHELL-CI-005` y `SHELL-DB-*` deben validar versiones resueltas     |
| `H-SHELL-PKG-004-004` | TypeScript `^5` y Tailwind `^4` están declarados en los siete repositorios                | `LINEA_BASE_COMUN`            | matriz de types y UI por consumidor                                 |
| `H-SHELL-PKG-004-005` | ningún repositorio declara `engines.node`                                                 | `BLOQUEO_DE_ESTABLE`          | declarar runtime y probarlo antes de primera estable                |
| `H-SHELL-PKG-004-006` | ningún consumidor declara dependencia publicada `@vento/*`                                | `PENDIENTE_DE_IMPLEMENTACION` | `SHELL-MIG-001..008`; `SHELL-CI-006`                                |
| `H-SHELL-PKG-004-007` | solo `@vento/os-context@0.1.0` existe como workspace privado y exporta `src/index.ts`     | `NO_PUBLICABLE_COMO_ESTABLE`  | `SHELL-AUTH-001`; `SHELL-CI-002`                                    |
| `H-SHELL-PKG-004-008` | el peer `@supabase/supabase-js >=2.90.0` de os-context no tiene límite superior           | `BLOQUEO_DE_ESTABLE`          | limitar a `<3` y validar antes de publicar                          |
| `H-SHELL-PKG-004-009` | no existe matriz ejecutable confirmada para las cuatro familias                           | `PENDIENTE_DE_IMPLEMENTACION` | `SHELL-CI-005`                                                      |
| `H-SHELL-PKG-004-010` | los manifests no demuestran versiones exactas resueltas por lockfile                      | `PENDIENTE_DE_EVIDENCIA`      | capturar lockfile hash y resolved versions en CI                    |
| `H-SHELL-PKG-004-011` | `eslint-config-next` permanece en `16.1.1` mientras Next varía por repositorio            | `RIESGO_DE_TOOLCHAIN`         | validar lint/build y alinear por política de cada consumidor        |
| `H-SHELL-PKG-004-012` | PASS, ANIMA y TALENTO no pertenecen al contrato web evaluado                              | `FUERA_DE_ALCANCE_ACTUAL`     | contrato móvil específico antes de incorporarlos                    |

**Conciliación:** doce hallazgos, doce destinos o condiciones de salida y cero pendientes narrativos sin propietario.

#### 16. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** `TREQ-SHELL-006` ya exige que toda versión de contrato, SDK o package supere pruebas propias y una matriz contra cada consumidor antes de publicarse o adoptarse; además exige adopción independiente y detección de incompatibilidades de tipos, comportamiento, catálogo, contexto y autorización. `TREQ-SHELL-007` protege rollback entre versiones distintas; `TREQ-SHELL-008` exige declarar requisitos y evidencia reproducible por package y PR; `TREQ-SHELL-009` exige identificar ambiente, repositorio y commit; `TREQ-SHELL-036` protege la identidad inmutable del release; y `TREQ-SHELL-037` protege cortes coordinados y dependencias internas. Esta tarea especializa cómo materializar esa cobertura sin crear una obligación nueva o duplicada.

| Operación sobre `TREQ-*` | Cantidad |
| ------------------------ | -------: |
| creados                  |    **0** |
| modificados              |    **0** |
| diferidos                |    **0** |
| descartados              |    **0** |
| obsoletos                |    **0** |

No corresponde producir una nueva copia del registro `04A`.

#### 17. Entregables

1. Unidad canónica de compatibilidad.
2. Línea base técnica de siete repositorios.
3. Cuatro perfiles de package con bandas candidatas.
4. Doce ejes obligatorios de evaluación.
5. Seis estados y transiciones permitidas.
6. Matriz completa de 28 relaciones package–consumidor.
7. Política de publicación y adopción.
8. Reglas SemVer para cambios de soporte.
9. Contrato del manifest de compatibilidad.
10. Quince bloqueos verificables.
11. Treinta y dos decisiones vinculantes.
12. Doce hallazgos con destino exacto.
13. Declaración de cero cambios `TREQ-*` con cobertura existente explícita.

#### 18. Criterios de aceptación

`SHELL-PKG-004` queda materialmente completa cuando:

- aparecen exactamente las cuatro familias aprobadas;
- aparecen exactamente los siete repositorios web del inventario compartido;
- existen 28 relaciones package–consumidor sin faltantes ni duplicados;
- ninguna relación sin ejecución se declara compatible;
- la línea base conserva los valores de los manifests inspeccionados;
- se distingue entre banda candidata, combinación verificada y banda soportada;
- se definen doce ejes aplicables a instalación, tipos, runtime, framework, Supabase, contexto, UI y consumidor;
- se definen seis estados y transiciones explícitas;
- cada publicación estable exige matriz completa y evidencia atribuible;
- cada adopción conserva versión exacta, commit y lockfile;
- la política permite despliegue independiente por repositorio;
- los cambios de soporte se clasifican conforme a SemVer;
- los peers externos quedan acotados y el runtime Node se vuelve precondición de estable;
- PASS, ANIMA y TALENTO no se incorporan por inferencia;
- la implementación ejecutable queda asignada a `SHELL-CI-005` y tareas consumidoras;
- se declaran cero cambios `TREQ-*` por cobertura directa de `TREQ-SHELL-006..009` y `TREQ-SHELL-036..037`;
- no se publican packages, tags, releases ni cambios de código, CI, consumidores, datos o Supabase.

#### 19. Continuidad canónica del bloque

- **ÚLTIMA TAREA APROBADA:** SHELL-PKG-003 — Definir tags y releases
- **TAREA ACTUAL APROBADA:** SHELL-PKG-004 — Definir política de compatibilidad
- **SIGUIENTE TAREA RESERVADA:** SHELL-PKG-005 — Definir política de deprecación


### ✅ SHELL-PKG-005 — Definir política de deprecación

**Estado:** APROBADA
**Fecha:** 2026-08-01
**Tarea anterior:** SHELL-PKG-004 — Definir política de compatibilidad
**Tarea siguiente:** SHELL-PKG-006 — Definir rollback por aplicación
**Tipo de tarea:** Documental
**Fase:** Definición documental vinculante; implementación física no autorizada
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Ubicación canónica:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/02_DISTRIBUCION_Y_PAQUETES_COMPARTIDOS.md`
**Corte remoto de `vento-shell`:** `477009f8c68cc9483f566eb6e8ba318739387071`

---

#### 1. Resultado material

Se establece la política canónica de deprecación, mantenimiento, fin de soporte y retiro para las cuatro familias de paquetes compartidos de Vento OS:

1. `@vento/contracts`;
2. `@vento/os-context`;
3. `@vento/supabase`;
4. `@vento/ui-web`.

La política distingue y gobierna dos objetos diferentes:

```text
superficie pública
→ export, tipo, schema, código, función, prop, evento, token, contrato o comportamiento observable

línea de soporte
→ serie MAJOR de un package y sus combinaciones de compatibilidad certificadas
```

Deprecar no equivale a eliminar. Una superficie o línea de soporte deprecada conservará identidad, documentación, historial, artefactos publicados y una ruta de migración verificable hasta superar su puerta de retiro.

| Métrica                                         |    Resultado |
| ----------------------------------------------- | -----------: |
| Familias de paquetes gobernadas                 |        **4** |
| Repositorios web consumidores gobernados        |        **7** |
| Relaciones package–consumidor materializadas    |       **28** |
| Modelos de ciclo de vida definidos              |        **2** |
| Estados de superficie pública                   |        **6** |
| Estados de línea de soporte                     |        **5** |
| Ventana ordinaria mínima de deprecación         |  **90 días** |
| Mantenimiento mínimo de la línea MAJOR anterior | **180 días** |
| Decisiones vinculantes                          |       **36** |
| Hallazgos con destino exacto                    |       **12** |
| Requisitos `TREQ-*` creados                     |        **2** |
| Deprecaciones o retiros físicos ejecutados      |        **0** |

---

#### 2. Fuentes y línea base verificable

##### 2.1. Fuentes vinculantes

| Fuente                                                            | Uso                                                                                          |
| ----------------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
| `docs/plan-canonico/modular/01_PROTOCOLO.md`                      | continuidad, alcance, evidencia, requisitos de prueba y límites de fase                      |
| `docs/plan-canonico/modular/delivery-contract.json`               | estructura física del artefacto documental                                                   |
| `docs/plan-canonico/modular/active-sequence.json`                 | segmento documental `SHELL-PKG-001..008`                                                     |
| `docs/plan-canonico/modular/continuity-route.json`                | ruta normal del BLOQUE H                                                                     |
| `docs/plan-canonico/modular/00_CABECERA_Y_ESTADO.md`              | última tarea aprobada, tarea actual y siguiente reservada                                    |
| `02_DISTRIBUCION_Y_PAQUETES_COMPARTIDOS.md`                       | decisiones aprobadas de distribución, SemVer, releases y compatibilidad                      |
| `SHELL-PKG-001 — Elegir mecanismo de distribución`                | artefactos inmutables, versiones exactas, lockfile y adopción independiente                  |
| `SHELL-PKG-002 — Definir versionado semántico`                    | clasificación `MINOR` de deprecación y `MAJOR` de retiro o reducción de soporte              |
| `SHELL-PKG-003 — Definir tags y releases`                         | identidad inmutable, estado `DEPRECADA`, changelog y release notes                           |
| `SHELL-PKG-004 — Definir política de compatibilidad`              | 28 relaciones, bandas soportadas, revalidación y reducción de soporte                        |
| `01_AUDITORIA_DE_COMPONENTES_COMPARTIDOS.md`                      | universo de siete consumidores web y riesgo de deriva                                        |
| `T_CALIDAD_Y_DESPLIEGUE/01_PAQUETES_RELEASES_Y_COMPATIBILIDAD.md` | pruebas, builds, releases, changelog, matriz de compatibilidad y PRs de consumidores         |
| `package.json` de `vento-shell` y consumidores                    | línea base técnica declarada                                                                 |
| `packages/os-context/package.json` y `README.md`                  | único package transitorio materializado, todavía privado y sin release estable               |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`                | cobertura vigente de retiro, compatibilidad, rollback, registro, procedencia e inmutabilidad |

##### 2.2. Corte remoto actual

| ID             | Repositorio                  | Commit de `main` usado como referencia     |
| -------------- | ---------------------------- | ------------------------------------------ |
| `DEP-REPO-001` | `devVentoGroup/vento-shell`  | `477009f8c68cc9483f566eb6e8ba318739387071` |
| `DEP-REPO-002` | `devVentoGroup/vento-viso`   | `47322403f3c64e83ae0c4a2f68c05d47093e5bb4` |
| `DEP-REPO-003` | `devVentoGroup/vento-nexo`   | `142c4d696221e3ce3fda4ed3b62f3d1fe5b58799` |
| `DEP-REPO-004` | `devVentoGroup/vento-fogo`   | `b6b9ed00e5267cabaac1a5a1090d93d5f60e86f2` |
| `DEP-REPO-005` | `devVentoGroup/vento-origo`  | `b7a8303fa078ef087f522b6c99059ababfc27472` |
| `DEP-REPO-006` | `devVentoGroup/vento-pulso`  | `71e0184486b5fe11e0a42435baf4024807a80efd` |
| `DEP-REPO-007` | `devVentoGroup/vento-numera` | `1b48a5da425d92e19ed89cf175b1dccc4cd960e1` |

La línea base no demuestra packages `@vento/*` publicados ni adopción mediante registry en los siete consumidores. `@vento/os-context@0.1.0` continúa como workspace privado que exporta fuente TypeScript. Por tanto, esta tarea define la política futura, pero no declara deprecaciones actuales ni ventanas ya iniciadas.

##### 2.3. Línea base del registro de pruebas

El registro canónico vigente en el corte contiene:

- 6.324 requisitos;
- 37 requisitos del dominio `SHELL`;
- rango `TREQ-SHELL-001` a `TREQ-SHELL-037`;
- última tarea incorporada `SHELL-PKG-004`;
- cero requisitos duplicados;
- catorce columnas en cada fila.

La cobertura existente protege el retiro genérico de código, las matrices de compatibilidad, el rollback, la trazabilidad del registro y la inmutabilidad de releases. No protege por sí sola la ventana temporal, el anuncio, el reemplazo, el inventario de consumidores y la puerta específica de retiro de una superficie pública deprecada.

---

#### 3. Alcance

##### 3.1. Incluido

Esta tarea define:

1. los objetos que pueden deprecarse;
2. los estados de una superficie pública y de una línea MAJOR;
3. la ventana ordinaria mínima antes del retiro;
4. el período mínimo de mantenimiento de la línea MAJOR anterior;
5. el contenido obligatorio de un registro de deprecación;
6. las señales documentales, de tipos, release y registry;
7. la relación con SemVer, compatibilidad, changelog y releases;
8. las obligaciones por cada una de las cuatro familias;
9. la trazabilidad de los 28 vínculos package–consumidor;
10. la puerta de retiro y fin de soporte;
11. el tratamiento de prereleases y excepciones críticas;
12. la conservación de artefactos e historia;
13. los requisitos de prueba que protegerán el ciclo completo.

##### 3.2. Excluido

Esta tarea no:

- depreca una API, package, versión o línea MAJOR concreta;
- elimina exports, tipos, schemas, componentes, props, tokens o wrappers;
- publica releases, tags, paquetes o mensajes de registry;
- modifica manifests, lockfiles, código, CI, secrets o configuración;
- ejecuta migraciones de consumidores;
- define el procedimiento operativo de rollback por aplicación, reservado a `SHELL-PKG-006`;
- crea PRs de actualización, reservados a `SHELL-PKG-007`;
- implementa gates automáticos, reservados a `SHELL-PKG-008` y `SHELL-CI-*`;
- modifica datos, migraciones o configuración de Supabase.

---

#### 4. Objetos y vocabulario canónico

##### 4.1. Superficie pública deprecable

Podrá deprecarse únicamente una identidad pública concreta y estable:

| Categoría            | Ejemplos gobernados                                                        |
| -------------------- | -------------------------------------------------------------------------- |
| package completo     | nombre npm y línea MAJOR                                                   |
| entrypoint o subpath | exports declarados en el manifest                                          |
| tipo o contrato      | interfaces, unions, enums, generics, schemas, códigos y catálogos          |
| comportamiento       | firmas, retornos, errores, decisiones, side effects y semántica observable |
| acceso a datos       | factories, adapters, wrappers RPC, tipos `Database` y errores normalizados |
| interfaz             | componentes, props, eventos, DOM, accesibilidad, tokens y requisitos CSS   |
| compatibilidad       | peer dependencies, engines, frameworks, runtimes y bandas soportadas       |

Una carpeta, archivo interno o implementación privada no se depreca por nombre: se refactoriza o retira conforme a su consumo real. Una superficie solo entra en esta política cuando forma parte del API público o del comportamiento soportado.

##### 4.2. Identificador estable de deprecación

Toda deprecación tendrá un identificador inmutable:

```text
DEP-<SLUG>-<SECUENCIA>
```

Slugs permitidos:

```text
CONTRACTS
OS-CONTEXT
SUPABASE
UI-WEB
```

Ejemplos estructurales:

```text
DEP-CONTRACTS-001
DEP-OS-CONTEXT-001
DEP-SUPABASE-001
DEP-UI-WEB-001
```

La secuencia identifica el expediente de deprecación y no se reutiliza después de cancelación, retiro o cierre.

##### 4.3. Términos vinculantes

| Término                | Significado                                                                                                    |
| ---------------------- | -------------------------------------------------------------------------------------------------------------- |
| deprecación            | aviso vinculante de que una superficie o línea continúa disponible temporalmente, pero debe dejar de adoptarse |
| reemplazo              | superficie, versión o patrón soportado al que deberá migrar el consumidor                                      |
| ventana de deprecación | período mínimo durante el cual la superficie anterior permanece disponible y soportada para migración          |
| mantenimiento          | período de correcciones compatibles y de seguridad, sin nuevas capacidades ordinarias                          |
| fin de soporte         | término de correcciones ordinarias para una línea, sin borrar ni mutar sus artefactos                          |
| retiro                 | eliminación de una superficie del API público en una versión nueva y compatible con las reglas de SemVer       |
| despublicación         | eliminación del artefacto del registry; no equivale a retiro y queda prohibida como mecanismo ordinario        |
| consumidor requerido   | repositorio incluido en la matriz de compatibilidad que usa o debe certificar la superficie                    |

---

#### 5. Ciclo de vida de superficies públicas

##### 5.1. Estados permitidos

| Estado                       | Definición                                                                                                  |
| ---------------------------- | ----------------------------------------------------------------------------------------------------------- |
| `ACTIVA`                     | superficie soportada, recomendada y disponible para adopción                                                |
| `DEPRECADA`                  | superficie disponible, con reemplazo, aviso, ventana y migración publicados                                 |
| `EN_MIGRACION`               | al menos un consumidor requerido tiene una migración abierta y trazable                                     |
| `BLOQUEADA_POR_CONSUMIDORES` | la ventana mínima terminó, pero existe uso, evidencia incompleta o consumidor no migrado                    |
| `ELEGIBLE_PARA_RETIRO`       | se cumplieron tiempo, releases, inventario, migración, pruebas y rollback                                   |
| `RETIRADA`                   | la superficie ya no existe en el API público de una nueva versión MAJOR; permanece en artefactos históricos |

##### 5.2. Transiciones permitidas

```text
ACTIVA → DEPRECADA
DEPRECADA → EN_MIGRACION
DEPRECADA → BLOQUEADA_POR_CONSUMIDORES
EN_MIGRACION → BLOQUEADA_POR_CONSUMIDORES
EN_MIGRACION → ELEGIBLE_PARA_RETIRO
BLOQUEADA_POR_CONSUMIDORES → EN_MIGRACION
BLOQUEADA_POR_CONSUMIDORES → ELEGIBLE_PARA_RETIRO
ELEGIBLE_PARA_RETIRO → RETIRADA
```

Una superficie `RETIRADA` no vuelve a `ACTIVA` con el mismo identificador. Restaurarla exige una nueva decisión de API y una nueva versión compatible con SemVer.

##### 5.3. Prohibiciones de estado

Queda prohibido:

- pasar de `ACTIVA` directamente a `RETIRADA` por flujo ordinario;
- declarar `ELEGIBLE_PARA_RETIRO` solo porque transcurrió tiempo;
- cerrar un expediente mientras un consumidor requerido siga usando la superficie;
- ocultar una ruptura marcándola únicamente como deprecación;
- reactivar silenciosamente una identidad retirada;
- tratar una anotación `@deprecated` aislada como política completa;
- usar ausencia de tráfico puntual como prueba suficiente de no consumo.

---

#### 6. Ciclo de vida de líneas MAJOR

##### 6.1. Estados permitidos

| Estado           | Definición                                                                                       |
| ---------------- | ------------------------------------------------------------------------------------------------ |
| `ACTIVA`         | línea MAJOR recomendada, con soporte funcional y de seguridad                                    |
| `MANTENIMIENTO`  | línea MAJOR anterior, con correcciones compatibles y de seguridad durante la ventana aprobada    |
| `DEPRECADA`      | línea no recomendada para nuevas adopciones y con fecha de fin de soporte publicada              |
| `FIN_DE_SOPORTE` | no recibe correcciones ordinarias; los consumidores remanentes constituyen una brecha bloqueante |
| `HISTORICA`      | línea preservada para reproducibilidad, auditoría y rollback controlado, sin adopciones nuevas   |

##### 6.2. Regla de coexistencia

Cuando se publique una nueva línea MAJOR estable `N`:

1. `N` pasa a `ACTIVA`;
2. `N-1` pasa a `MANTENIMIENTO` por un mínimo de 180 días calendario;
3. líneas anteriores a `N-1` no reciben soporte ordinario salvo extensión aprobada o incidente crítico;
4. ningún consumidor nuevo podrá adoptar una línea `DEPRECADA`, `FIN_DE_SOPORTE` o `HISTORICA`;
5. un consumidor que permanezca en `FIN_DE_SOPORTE` bloqueará su siguiente release o despliegue hasta migrar o contar con una excepción explícita y temporal;
6. los artefactos históricos permanecerán inmutables y localizables.

El período de 180 días es mínimo. Puede ampliarse por dependencia operativa demostrada, pero no reducirse por conveniencia de release.

##### 6.3. Alcance del mantenimiento

Durante `MANTENIMIENTO` se permiten:

- correcciones compatibles;
- correcciones de seguridad;
- ajustes de build o packaging que no rompan el API;
- documentación y guías de migración;
- observabilidad necesaria para el retiro.

No se permiten nuevas capacidades ordinarias que prolonguen artificialmente la línea anterior. Una capacidad imprescindible para migración deberá justificarse y clasificarse según SemVer.

---

#### 7. Ventana ordinaria de deprecación

##### 7.1. Condiciones acumulativas

Una superficie pública estable solo podrá llegar a `ELEGIBLE_PARA_RETIRO` cuando se cumplan simultáneamente:

1. la deprecación fue publicada en una release estable compatible;
2. transcurrieron al menos 90 días calendario desde esa publicación;
3. existió al menos una release estable posterior de la misma línea MAJOR que conservó la superficie deprecada;
4. se publicó un reemplazo soportado o una decisión explícita de eliminación sin reemplazo;
5. existe guía de migración completa;
6. los consumidores requeridos fueron inventariados;
7. cada relación package–consumidor está migrada, `NO_APLICA` con evidencia o amparada por una excepción temporal;
8. no quedan imports, llamadas, contratos, tipos, CSS, datos, cachés o configuraciones residuales conocidos;
9. la matriz de compatibilidad de la versión objetivo está completa;
10. pruebas, build y validaciones del package y de los consumidores afectados son correctos;
11. existe rollback operativo hacia una combinación soportada;
12. el propietario del package y los responsables de consumidores afectados aprobaron el cierre.

El retiro material se realizará exclusivamente en una nueva versión `MAJOR`, salvo que la identidad nunca haya pertenecido a una release estable.

##### 7.2. Inicio de la ventana

La ventana comienza únicamente cuando una release estable contiene todos estos elementos:

- identificador `DEP-*`;
- superficie exacta;
- primera versión deprecada;
- fecha de anuncio;
- motivo;
- reemplazo o `SIN_REEMPLAZO_JUSTIFICADO`;
- versión mínima del reemplazo;
- fecha más temprana de retiro;
- versión MAJOR mínima de retiro;
- consumidores conocidos;
- guía de migración;
- riesgos y rollback;
- propietario y aprobadores.

Un issue, comentario, mensaje de chat, PR no fusionado o anotación interna no inicia la ventana.

##### 7.3. Suspensión y reinicio

La ventana queda suspendida cuando:

- el reemplazo no es compatible con un consumidor requerido;
- la guía de migración es incompleta;
- aparece un consumidor no inventariado;
- se detecta pérdida de datos, autorización, accesibilidad o comportamiento;
- no existe rollback viable;
- la evidencia no corresponde a las versiones exactas.

Corregir el bloqueo no reinicia automáticamente los 90 días, salvo que cambie de forma incompatible el reemplazo, el alcance o la migración. En ese caso deberá emitirse una nueva versión del expediente y recalcularse la fecha más temprana de retiro.

---

#### 8. Política por familia de package

| ID            | Package             | Superficies gobernadas                                                                        | Señal mínima de deprecación                                                                | Riesgos específicos que deben probarse                                                   | Propietario documental principal                            |
| ------------- | ------------------- | --------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------- | ----------------------------------------------------------- |
| `DEP-FAM-001` | `@vento/contracts`  | schemas, tipos, códigos, catálogos, identificadores, estados, eventos y diagnósticos          | metadata contractual, `@deprecated` cuando aplique, changelog, release y guía de migración | serialización, exhaustividad, eventos, datos históricos y compatibilidad entre versiones | tareas `SHELL-CON-*`                                        |
| `DEP-FAM-002` | `@vento/os-context` | funciones, tipos de contexto, decisiones, razones, scopes, guards y semántica de autorización | `@deprecated`, documentación, changelog, release y reemplazo seguro                        | denegación cerrada, sesiones, dispositivos, simulación, auditoría y autoridad efectiva   | tareas `SHELL-AUTH-*` y `SHELL-CTX-*`                       |
| `DEP-FAM-003` | `@vento/supabase`   | factories, clientes, adapters, wrappers RPC, tipos generados y errores normalizados           | `@deprecated`, contrato de datos, changelog, release y plan de transición                  | RLS, RPC, migraciones, tipos, datos, transacciones, Realtime y rollback                  | tareas `SHELL-DB-*` y propietarias de arquitectura Supabase |
| `DEP-FAM-004` | `@vento/ui-web`     | componentes, props, eventos, slots, DOM, accesibilidad, tokens, estilos y requisitos CSS      | `@deprecated`, documentación visual, changelog, release y alternativa                      | render, hidratación, teclado, lector de pantalla, estilos, layout y comportamiento       | tareas `SHELL-UI-*`                                         |

**Conciliación:** cuatro familias esperadas, cuatro decisiones materializadas, cero faltantes y cero duplicados.

##### 8.1. Reglas para contratos y tipos

- eliminar o estrechar un schema estable requiere `MAJOR`;
- un campo deprecado deberá permanecer aceptado durante la ventana cuando el contrato lo permita;
- códigos, estados o identificadores históricos no se reutilizarán con otro significado;
- unions y enums cerrados deberán considerar consumidores exhaustivos;
- datos históricos conservarán interpretación y versión aun después del retiro del API de escritura.

##### 8.2. Reglas para contexto y autorización

- una razón, scope, guard o campo de contexto no podrá retirarse mientras un consumidor la use para autorizar, auditar o explicar decisiones;
- el reemplazo deberá mantener denegación cerrada y no ampliar autoridad por fallback;
- no se introducirá compatibilidad temporal que restaure bypasses prohibidos;
- sesiones y dispositivos con versiones distintas deberán probarse durante la ventana.

##### 8.3. Reglas para Supabase

- deprecar un wrapper o tipo no autoriza retirar tablas, columnas, funciones, triggers, policies o eventos;
- cualquier objeto de base de datos seguirá su tarea y migración propietaria;
- la compatibilidad entre package, schema remoto y tipos generados deberá quedar fijada por versión;
- no se retirará una interfaz mientras existan jobs, Edge Functions, RPC, Realtime o consumidores externos no migrados.

##### 8.4. Reglas para UI

- props, eventos, estructura accesible, tokens y CSS públicos forman parte de la superficie;
- una prop deprecada deberá conservar comportamiento compatible durante la ventana;
- el reemplazo deberá demostrar paridad funcional y accesibilidad igual o superior;
- warnings de desarrollo deberán ser deduplicados, no incluir datos sensibles y no degradar producción;
- un cambio visual incompatible no se ocultará como refactor interno.

---

#### 9. Matriz package–consumidor de deprecación

La política conserva las 28 relaciones aprobadas en `SHELL-PKG-004`. En la línea base actual todas permanecen sin una deprecación ejecutable porque no existe una versión estable publicada y adoptada de los packages.

| ID            | Package             | Consumidor     | Estado de deprecación actual    | Evidencia necesaria para cambiar de estado                          | Destino de materialización |
| ------------- | ------------------- | -------------- | ------------------------------- | ------------------------------------------------------------------- | -------------------------- |
| `DEP-REL-001` | `@vento/contracts`  | `vento-shell`  | `NO_APLICA_SIN_RELEASE_ESTABLE` | versión instalada, lockfile, inventario de uso y expediente `DEP-*` | `SHELL-CI-004..006`        |
| `DEP-REL-002` | `@vento/contracts`  | `vento-viso`   | `NO_APLICA_SIN_RELEASE_ESTABLE` | versión instalada, lockfile, inventario de uso y expediente `DEP-*` | `SHELL-CI-004..006`        |
| `DEP-REL-003` | `@vento/contracts`  | `vento-nexo`   | `NO_APLICA_SIN_RELEASE_ESTABLE` | versión instalada, lockfile, inventario de uso y expediente `DEP-*` | `SHELL-CI-004..006`        |
| `DEP-REL-004` | `@vento/contracts`  | `vento-fogo`   | `NO_APLICA_SIN_RELEASE_ESTABLE` | versión instalada, lockfile, inventario de uso y expediente `DEP-*` | `SHELL-CI-004..006`        |
| `DEP-REL-005` | `@vento/contracts`  | `vento-origo`  | `NO_APLICA_SIN_RELEASE_ESTABLE` | versión instalada, lockfile, inventario de uso y expediente `DEP-*` | `SHELL-CI-004..006`        |
| `DEP-REL-006` | `@vento/contracts`  | `vento-pulso`  | `NO_APLICA_SIN_RELEASE_ESTABLE` | versión instalada, lockfile, inventario de uso y expediente `DEP-*` | `SHELL-CI-004..006`        |
| `DEP-REL-007` | `@vento/contracts`  | `vento-numera` | `NO_APLICA_SIN_RELEASE_ESTABLE` | versión instalada, lockfile, inventario de uso y expediente `DEP-*` | `SHELL-CI-004..006`        |
| `DEP-REL-008` | `@vento/os-context` | `vento-shell`  | `NO_APLICA_SIN_RELEASE_ESTABLE` | versión instalada, lockfile, inventario de uso y expediente `DEP-*` | `SHELL-CI-004..006`        |
| `DEP-REL-009` | `@vento/os-context` | `vento-viso`   | `NO_APLICA_SIN_RELEASE_ESTABLE` | versión instalada, lockfile, inventario de uso y expediente `DEP-*` | `SHELL-CI-004..006`        |
| `DEP-REL-010` | `@vento/os-context` | `vento-nexo`   | `NO_APLICA_SIN_RELEASE_ESTABLE` | versión instalada, lockfile, inventario de uso y expediente `DEP-*` | `SHELL-CI-004..006`        |
| `DEP-REL-011` | `@vento/os-context` | `vento-fogo`   | `NO_APLICA_SIN_RELEASE_ESTABLE` | versión instalada, lockfile, inventario de uso y expediente `DEP-*` | `SHELL-CI-004..006`        |
| `DEP-REL-012` | `@vento/os-context` | `vento-origo`  | `NO_APLICA_SIN_RELEASE_ESTABLE` | versión instalada, lockfile, inventario de uso y expediente `DEP-*` | `SHELL-CI-004..006`        |
| `DEP-REL-013` | `@vento/os-context` | `vento-pulso`  | `NO_APLICA_SIN_RELEASE_ESTABLE` | versión instalada, lockfile, inventario de uso y expediente `DEP-*` | `SHELL-CI-004..006`        |
| `DEP-REL-014` | `@vento/os-context` | `vento-numera` | `NO_APLICA_SIN_RELEASE_ESTABLE` | versión instalada, lockfile, inventario de uso y expediente `DEP-*` | `SHELL-CI-004..006`        |
| `DEP-REL-015` | `@vento/supabase`   | `vento-shell`  | `NO_APLICA_SIN_RELEASE_ESTABLE` | versión instalada, lockfile, inventario de uso y expediente `DEP-*` | `SHELL-CI-004..006`        |
| `DEP-REL-016` | `@vento/supabase`   | `vento-viso`   | `NO_APLICA_SIN_RELEASE_ESTABLE` | versión instalada, lockfile, inventario de uso y expediente `DEP-*` | `SHELL-CI-004..006`        |
| `DEP-REL-017` | `@vento/supabase`   | `vento-nexo`   | `NO_APLICA_SIN_RELEASE_ESTABLE` | versión instalada, lockfile, inventario de uso y expediente `DEP-*` | `SHELL-CI-004..006`        |
| `DEP-REL-018` | `@vento/supabase`   | `vento-fogo`   | `NO_APLICA_SIN_RELEASE_ESTABLE` | versión instalada, lockfile, inventario de uso y expediente `DEP-*` | `SHELL-CI-004..006`        |
| `DEP-REL-019` | `@vento/supabase`   | `vento-origo`  | `NO_APLICA_SIN_RELEASE_ESTABLE` | versión instalada, lockfile, inventario de uso y expediente `DEP-*` | `SHELL-CI-004..006`        |
| `DEP-REL-020` | `@vento/supabase`   | `vento-pulso`  | `NO_APLICA_SIN_RELEASE_ESTABLE` | versión instalada, lockfile, inventario de uso y expediente `DEP-*` | `SHELL-CI-004..006`        |
| `DEP-REL-021` | `@vento/supabase`   | `vento-numera` | `NO_APLICA_SIN_RELEASE_ESTABLE` | versión instalada, lockfile, inventario de uso y expediente `DEP-*` | `SHELL-CI-004..006`        |
| `DEP-REL-022` | `@vento/ui-web`     | `vento-shell`  | `NO_APLICA_SIN_RELEASE_ESTABLE` | versión instalada, lockfile, inventario de uso y expediente `DEP-*` | `SHELL-CI-004..006`        |
| `DEP-REL-023` | `@vento/ui-web`     | `vento-viso`   | `NO_APLICA_SIN_RELEASE_ESTABLE` | versión instalada, lockfile, inventario de uso y expediente `DEP-*` | `SHELL-CI-004..006`        |
| `DEP-REL-024` | `@vento/ui-web`     | `vento-nexo`   | `NO_APLICA_SIN_RELEASE_ESTABLE` | versión instalada, lockfile, inventario de uso y expediente `DEP-*` | `SHELL-CI-004..006`        |
| `DEP-REL-025` | `@vento/ui-web`     | `vento-fogo`   | `NO_APLICA_SIN_RELEASE_ESTABLE` | versión instalada, lockfile, inventario de uso y expediente `DEP-*` | `SHELL-CI-004..006`        |
| `DEP-REL-026` | `@vento/ui-web`     | `vento-origo`  | `NO_APLICA_SIN_RELEASE_ESTABLE` | versión instalada, lockfile, inventario de uso y expediente `DEP-*` | `SHELL-CI-004..006`        |
| `DEP-REL-027` | `@vento/ui-web`     | `vento-pulso`  | `NO_APLICA_SIN_RELEASE_ESTABLE` | versión instalada, lockfile, inventario de uso y expediente `DEP-*` | `SHELL-CI-004..006`        |
| `DEP-REL-028` | `@vento/ui-web`     | `vento-numera` | `NO_APLICA_SIN_RELEASE_ESTABLE` | versión instalada, lockfile, inventario de uso y expediente `DEP-*` | `SHELL-CI-004..006`        |

**Conciliación:** 28 relaciones esperadas, 28 materializadas, siete por familia, cuatro por consumidor, cero faltantes y cero duplicadas.

El estado `NO_APLICA_SIN_RELEASE_ESTABLE` describe exclusivamente la línea base. No certifica ausencia futura de consumo ni permite omitir la relación cuando exista una versión publicada.

---

#### 10. Registro obligatorio de deprecación

Cada expediente `DEP-*` deberá contener:

| Campo                      | Obligación                                                                               |
| -------------------------- | ---------------------------------------------------------------------------------------- |
| `deprecation_id`           | identificador único e inmutable                                                          |
| `package_name`             | una de las cuatro familias aprobadas                                                     |
| `surface_kind`             | package, entrypoint, tipo, contrato, comportamiento, acceso a datos, UI o compatibilidad |
| `surface_identity`         | export, símbolo, schema, código, prop, evento, token, banda o identidad exacta           |
| `first_deprecated_version` | primera release estable que publica el aviso                                             |
| `announcement_date`        | fecha verificable del inicio de ventana                                                  |
| `reason`                   | causa técnica, funcional, de seguridad o de arquitectura                                 |
| `replacement`              | identidad soportada o `SIN_REEMPLAZO_JUSTIFICADO`                                        |
| `replacement_min_version`  | primera versión estable que contiene el reemplazo                                        |
| `earliest_removal_date`    | fecha no anterior a 90 días desde el anuncio                                             |
| `minimum_removal_major`    | primera línea MAJOR en la que podría retirarse                                           |
| `affected_consumers`       | 28 relaciones evaluadas con estado individual                                            |
| `migration_guide`          | pasos, equivalencias, riesgos, validaciones y ejemplos                                   |
| `compatibility_evidence`   | matriz exacta antes, durante y después de migración                                      |
| `rollback_reference`       | combinación soportada y procedimiento propietario                                        |
| `owner`                    | propietario del package                                                                  |
| `approvers`                | propietario y consumidores afectados                                                     |
| `exception`                | `NONE` o expediente crítico aprobado                                                     |
| `status`                   | estado permitido de superficie                                                           |
| `closure_evidence`         | pruebas, inventario cero residual y aprobaciones de cierre                               |

Los campos no podrán sustituirse por texto genérico. Fechas, versiones, consumidores, reemplazo y evidencia deberán ser resolubles.

---

#### 11. Señales obligatorias de deprecación

##### 11.1. Señales acumulativas

Cuando técnicamente apliquen, una deprecación estable deberá aparecer de forma coherente en:

1. API o types mediante `@deprecated` y referencia al reemplazo;
2. documentación pública del package;
3. changelog bajo `Deprecated`;
4. release notes de la primera versión deprecada;
5. manifest o catálogo de deprecaciones;
6. guía de migración;
7. matriz de compatibilidad y consumidores;
8. PRs de actualización o migración;
9. mensaje de registry para versiones completas cuando se depreque una línea o artefacto;
10. evidencia de pruebas y rollback.

La ausencia de una señal técnicamente imposible deberá justificarse en el expediente. No se permitirá omitir release, changelog, guía, matriz o evidencia.

##### 11.2. Warnings de runtime

Un warning de runtime solo se admitirá cuando:

- no exponga datos personales, secretos, tokens ni contexto sensible;
- no altere retorno, orden, timing o control de autorización;
- sea deduplicado y atribuible a una identidad `DEP-*`;
- pueda limitarse a desarrollo, CI o ambiente controlado cuando producción no aporte evidencia segura;
- no sustituya pruebas estáticas, inventario de consumidores ni telemetría aprobada.

No se añadirá telemetría nueva ni captura de uso en esta fase documental.

##### 11.3. Mensajes del registry

Marcar una versión como deprecada en el registry:

- no cambia sus bytes;
- no mueve tags Git ni releases;
- no modifica el lockfile del consumidor;
- no retira automáticamente el package;
- deberá indicar versión recomendada, motivo, expediente y fecha de soporte;
- no se utilizará como sustituto de una release segura disponible.

---

#### 12. Relación con SemVer, releases y compatibilidad

| Evento                                                                       | Clasificación mínima | Regla                                                                                          |
| ---------------------------------------------------------------------------- | -------------------- | ---------------------------------------------------------------------------------------------- |
| anunciar deprecación manteniendo API y comportamiento                        | `MINOR`              | capacidad documental y contractual aditiva                                                     |
| corregir texto o enlace de una deprecación sin cambiar alcance               | `PATCH`              | corrección compatible                                                                          |
| ampliar reemplazo compatible o guía sin retirar superficie                   | `MINOR` o `PATCH`    | según cambie o no el API publicado                                                             |
| retirar export, tipo, campo, prop, evento, token o banda antes soportada     | `MAJOR`              | ruptura para consumidores soportados                                                           |
| marcar una versión defectuosa como deprecada y publicar reemplazo compatible | nueva versión        | el artefacto defectuoso permanece inmutable                                                    |
| reducir peer, engine o framework soportado                                   | `MAJOR`              | además activa deprecación de la banda y migración de consumidores                              |
| cambiar únicamente una prerelease no estable                                 | prerelease nueva     | no inicia ventana ordinaria, pero exige release notes y no puede afectar consumidores estables |

Una deprecación no autoriza incumplir `SHELL-PKG-004`. Mientras la superficie exista, deberá permanecer dentro de las combinaciones soportadas declaradas o quedar explícitamente restringida con evidencia.

---

#### 13. Puerta de retiro y fin de soporte

##### 13.1. Gate por superficie

Antes de retirar una superficie, la evidencia deberá demostrar:

```text
expediente DEP completo
+ ventana de 90 días cumplida
+ release estable intermedia publicada
+ nueva versión MAJOR clasificada
+ 28 relaciones evaluadas
+ cero consumidores requeridos sin resolución
+ cero imports o usos residuales conocidos
+ compatibilidad del reemplazo
+ pruebas de package y consumidores
+ migración y datos conciliados cuando apliquen
+ rollback probado
+ aprobaciones de cierre
```

El gate fallará si una sola relación requerida permanece `PENDIENTE_DE_EVIDENCIA`, `INCOMPATIBLE`, sin inventario o sin responsable.

##### 13.2. Gate por línea MAJOR

Antes de declarar `FIN_DE_SOPORTE`:

- habrá transcurrido el mantenimiento mínimo de 180 días;
- existirá una línea MAJOR activa y certificada;
- cada consumidor tendrá una versión objetivo y plan de migración;
- se publicará fecha, impacto, última versión soportada y alternativa;
- no quedarán incidentes críticos sin una versión segura disponible;
- la matriz registrará consumidores remanentes como bloqueos, no como omisiones;
- cualquier excepción tendrá propietario, fecha de expiración y riesgo aceptado.

##### 13.3. Conservación histórica

El retiro o fin de soporte no permitirá:

- sobrescribir versiones;
- mover tags o releases;
- reutilizar identificadores;
- borrar changelog, guías o evidencia;
- eliminar artefactos ordinariamente;
- reescribir datos históricos;
- ocultar consumidores que no migraron;
- convertir una línea sin soporte en compatible por documentación.

---

#### 14. Prereleases y excepciones críticas

##### 14.1. Prereleases

Las superficies que solo existieron en `alpha`, `beta` o `rc` podrán cambiar o retirarse sin la ventana ordinaria de 90 días porque no constituyen API estable. Aun así:

- cada artefacto distinto tendrá nueva versión prerelease;
- release notes declararán la ruptura;
- no se mutarán tags, releases ni bytes;
- se evaluarán consumidores de prueba conocidos;
- una estable no dependerá de una prerelease interna;
- una identidad retirada antes de estable no se presentará como deprecación cumplida de una API estable.

##### 14.2. Excepción crítica

Una vulnerabilidad, incumplimiento legal, corrupción de datos o riesgo operativo crítico podrá exigir acortar la ventana, bloquear adopción o deshabilitar una superficie antes del plazo ordinario. La excepción deberá contener:

1. severidad y alcance comprobados;
2. razón por la que mantener la superficie es más riesgoso que retirarla;
3. versión segura o mitigación disponible;
4. consumidores afectados y responsable por cada uno;
5. plan urgente de migración;
6. pruebas de seguridad, compatibilidad y datos;
7. rollback o estrategia de recuperación segura;
8. aprobaciones del propietario técnico y autoridad empresarial aplicable;
9. fecha de expiración de cualquier bypass temporal;
10. informe posterior y cierre del expediente.

La excepción no autoriza mutar artefactos ni borrar historia. Cuando la ruptura afecte una release estable, se conservará la clasificación `MAJOR` aunque el calendario sea abreviado.

##### 14.3. Despublicación extraordinaria

La despublicación solo podrá considerarse ante artefacto comprometido, malware, secreto publicado, obligación legal o imposibilidad de mantenerlo accesible con seguridad. Requerirá una decisión de incidente independiente, inventario de consumidores, versión de reemplazo, preservación de evidencia y plan de recuperación. No forma parte del flujo ordinario de deprecación.

---

#### 15. Decisiones vinculantes

| ID            | Decisión                                                         | Estado                 | Destino de materialización                   |
| ------------- | ---------------------------------------------------------------- | ---------------------- | -------------------------------------------- |
| `PKG-DEP-001` | gobernar las cuatro familias aprobadas                           | `DECIDIDO`             | todos los packages compartidos               |
| `PKG-DEP-002` | distinguir superficie pública y línea MAJOR                      | `DECIDIDO`             | manifest de deprecaciones                    |
| `PKG-DEP-003` | usar identificadores `DEP-*` inmutables                          | `DECIDIDO`             | catálogo y changelog                         |
| `PKG-DEP-004` | impedir reutilización de identificadores cerrados                | `DECIDIDO`             | validador documental                         |
| `PKG-DEP-005` | separar deprecación de retiro                                    | `DECIDIDO`             | releases y migraciones                       |
| `PKG-DEP-006` | exigir reemplazo o eliminación sin reemplazo justificada         | `DECIDIDO`             | expediente `DEP-*`                           |
| `PKG-DEP-007` | iniciar ventana solo mediante release estable completa           | `DECIDIDO`             | `SHELL-CI-003`; `SHELL-CI-004`               |
| `PKG-DEP-008` | fijar ventana ordinaria mínima de 90 días                        | `DECIDIDO`             | gate de retiro                               |
| `PKG-DEP-009` | exigir una release estable intermedia que conserve la superficie | `DECIDIDO`             | pipeline de release                          |
| `PKG-DEP-010` | retirar API estable únicamente en nueva línea MAJOR              | `DECIDIDO`             | clasificación SemVer                         |
| `PKG-DEP-011` | evaluar las 28 relaciones antes del retiro                       | `DECIDIDO`             | `SHELL-CI-005`; `SHELL-CI-006`               |
| `PKG-DEP-012` | bloquear retiro por consumidor sin evidencia                     | `DECIDIDO`             | `SHELL-PKG-008`                              |
| `PKG-DEP-013` | exigir cero usos residuales conocidos                            | `DECIDIDO`             | análisis estático, pruebas y evidencia       |
| `PKG-DEP-014` | exigir guía de migración y rollback                              | `DECIDIDO`             | `SHELL-PKG-006`; `SHELL-CI-004`              |
| `PKG-DEP-015` | preservar la superficie durante la ventana                       | `DECIDIDO`             | package de la línea vigente                  |
| `PKG-DEP-016` | mantener N-1 por mínimo 180 días tras publicar N                 | `DECIDIDO`             | política de soporte de líneas MAJOR          |
| `PKG-DEP-017` | limitar mantenimiento a correcciones compatibles y seguridad     | `DECIDIDO`             | ramas y releases de mantenimiento            |
| `PKG-DEP-018` | bloquear nuevas adopciones de líneas no soportadas               | `DECIDIDO`             | PRs y gate de consumidor                     |
| `PKG-DEP-019` | conservar artefactos históricos inmutables                       | `DECIDIDO`             | registry, tags y releases                    |
| `PKG-DEP-020` | prohibir despublicación como retiro ordinario                    | `DECIDIDO`             | registry y respuesta a incidentes            |
| `PKG-DEP-021` | exigir `@deprecated` cuando la superficie TypeScript lo admita   | `DECIDIDO`             | packages y declarations                      |
| `PKG-DEP-022` | exigir changelog, release notes y catálogo coherentes            | `DECIDIDO`             | `SHELL-CI-004`                               |
| `PKG-DEP-023` | limitar warnings de runtime a usos seguros y deduplicados        | `DECIDIDO`             | implementación propietaria                   |
| `PKG-DEP-024` | no usar warnings como sustituto de inventario o pruebas          | `DECIDIDO`             | gate de deprecación                          |
| `PKG-DEP-025` | tratar reducción de soporte como ruptura MAJOR                   | `DECIDIDO`             | `SHELL-PKG-004`; clasificación SemVer        |
| `PKG-DEP-026` | no confundir fin de soporte con eliminación de bytes             | `DECIDIDO`             | registry y documentación                     |
| `PKG-DEP-027` | permitir cambios de prerelease sin ventana estable               | `DECIDIDO`             | `SHELL-CI-003`                               |
| `PKG-DEP-028` | documentar rupturas de prerelease y consumidores de prueba       | `DECIDIDO`             | release notes                                |
| `PKG-DEP-029` | permitir excepción crítica solo con expediente y aprobaciones    | `DECIDIDO`             | respuesta a incidentes y gate extraordinario |
| `PKG-DEP-030` | conservar SemVer MAJOR aun cuando se abrevie el calendario       | `DECIDIDO`             | release de emergencia                        |
| `PKG-DEP-031` | impedir que deprecación amplíe autoridad o restaure bypasses     | `DECIDIDO`             | `@vento/os-context`                          |
| `PKG-DEP-032` | separar deprecación del wrapper y retiro de objetos Supabase     | `DECIDIDO`             | `@vento/supabase` y tareas E3                |
| `PKG-DEP-033` | tratar accesibilidad, DOM, tokens y CSS como superficie UI       | `DECIDIDO`             | `@vento/ui-web`                              |
| `PKG-DEP-034` | crear dos requisitos de prueba específicos                       | `DECIDIDO`             | `TREQ-SHELL-038`; `TREQ-SHELL-039`           |
| `PKG-DEP-035` | no ejecutar deprecaciones, retiros ni publicaciones en esta fase | `RESTRICCION_CANONICA` | fase documental                              |
| `PKG-DEP-036` | no modificar consumidores, CI, datos ni Supabase en esta tarea   | `RESTRICCION_CANONICA` | fase documental                              |

**Conciliación:** 36 decisiones, 36 identificadores únicos, cero faltantes y cero duplicados.

---

#### 16. Hallazgos y destinos exactos

| ID                    | Hallazgo                                                                             | Estado                        | Destino o condición de salida                                        |
| --------------------- | ------------------------------------------------------------------------------------ | ----------------------------- | -------------------------------------------------------------------- |
| `H-SHELL-PKG-005-001` | no existen releases estables confirmados de las cuatro familias                      | `NO_APLICA_EN_LINEA_BASE`     | primera publicación en `SHELL-CI-003`                                |
| `H-SHELL-PKG-005-002` | no existen deprecaciones canónicas activas confirmadas                               | `NO_APLICA_EN_LINEA_BASE`     | primer expediente `DEP-*` futuro                                     |
| `H-SHELL-PKG-005-003` | `@vento/os-context@0.1.0` es privado y transitorio                                   | `NO_ES_LINEA_ESTABLE`         | build y release estable en tareas propietarias y `SHELL-CI-002..003` |
| `H-SHELL-PKG-005-004` | las 28 relaciones no tienen versión compartida publicada que deprecar                | `NO_APLICA_SIN_ADOPCION`      | `SHELL-CI-005`; adopción mediante `SHELL-CI-006`                     |
| `H-SHELL-PKG-005-005` | el changelog automático por package aún no está implementado                         | `PENDIENTE_DE_IMPLEMENTACION` | `SHELL-CI-004`                                                       |
| `H-SHELL-PKG-005-006` | la matriz ejecutable de compatibilidad aún no está implementada                      | `PENDIENTE_DE_IMPLEMENTACION` | `SHELL-CI-005`                                                       |
| `H-SHELL-PKG-005-007` | no existe catálogo ejecutable de expedientes `DEP-*`                                 | `PENDIENTE_DE_IMPLEMENTACION` | `SHELL-CI-004`; `SHELL-PKG-008`                                      |
| `H-SHELL-PKG-005-008` | no existe gate automático de ventana, consumidores y retiro                          | `PENDIENTE_DE_IMPLEMENTACION` | `SHELL-PKG-008`; `TREQ-SHELL-038..039`                               |
| `H-SHELL-PKG-005-009` | el procedimiento operativo de rollback por aplicación pertenece a la tarea siguiente | `RESERVADO`                   | `SHELL-PKG-006`                                                      |
| `H-SHELL-PKG-005-010` | la actualización de consumidores mediante PR todavía no está definida                | `PENDIENTE_DE_DEFINICION`     | `SHELL-PKG-007`; `SHELL-CI-006`                                      |
| `H-SHELL-PKG-005-011` | los artefactos históricos deberán conservarse aunque una superficie se retire        | `DECISION_CANONICA`           | registry, Git, releases y `TREQ-SHELL-036`                           |
| `H-SHELL-PKG-005-012` | la deprecación específica de un objeto Supabase no autoriza su retiro físico         | `RESTRICCION_CANONICA`        | tarea E3 y migración propietaria aplicable                           |

**Conciliación:** 12 hallazgos, 12 destinos exactos, cero pendientes sin propietario y cero decisiones fuera del alcance.

---

#### 17. Requisitos de prueba incorporados

Esta tarea crea dos requisitos nuevos y no modifica, difiere, descarta ni vuelve obsoleto ningún requisito histórico.

| ID               | Cobertura incorporada                                                                                                                                                                               | Estado inicial | Implementación responsable                                                                       |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ------------------------------------------------------------------------------------------------ |
| `TREQ-SHELL-038` | ciclo de deprecación con identidad, anuncio estable, reemplazo, ventana mínima, release intermedia, SemVer, changelog, migración, consumidores y evidencia antes de declarar elegibilidad de retiro | `IDENTIFICADO` | `SHELL-CI-001`; `SHELL-CI-004`; `SHELL-CI-005`; `SHELL-CI-006`; `SHELL-PKG-008`                  |
| `TREQ-SHELL-039` | gate de retiro y fin de soporte con 28 relaciones resueltas, cero uso residual, compatibilidad, pruebas, rollback, conservación de artefactos y control de excepciones críticas                     | `IDENTIFICADO` | `SHELL-CI-001`; `SHELL-CI-003`; `SHELL-CI-005`; `SHELL-CI-006`; `SHELL-PKG-006`; `SHELL-PKG-008` |

| Operación sobre `TREQ-*` | Cantidad |
| ------------------------ | -------: |
| creados                  |    **2** |
| modificados              |    **0** |
| diferidos                |    **0** |
| descartados              |    **0** |
| obsoletos                |    **0** |

Los requisitos se incorporan después de `TREQ-SHELL-037`, conservando secuencia, relaciones resolubles y catorce columnas.

---

#### 18. Entregables

1. Vocabulario canónico de deprecación, mantenimiento, fin de soporte, retiro y despublicación.
2. Identificador estable `DEP-*` por expediente.
3. Ciclo de vida de seis estados para superficies públicas.
4. Ciclo de vida de cinco estados para líneas MAJOR.
5. Ventana ordinaria mínima de 90 días con condiciones acumulativas.
6. Mantenimiento mínimo de 180 días para la línea MAJOR anterior.
7. Matriz de cuatro familias y superficies deprecables.
8. Matriz completa de 28 relaciones package–consumidor.
9. Contrato de veinte campos para cada expediente de deprecación.
10. Señales obligatorias en API, documentación, changelog, release, registry y migración.
11. Gate de retiro de superficie y gate de fin de soporte.
12. Política de prereleases, excepción crítica y despublicación extraordinaria.
13. 36 decisiones vinculantes.
14. 12 hallazgos con destino exacto.
15. Dos requisitos de prueba nuevos.

---

#### 19. Criterios de aceptación

`SHELL-PKG-005` queda materialmente completa cuando:

- gobierna exactamente las cuatro familias aprobadas;
- conserva los siete consumidores y las 28 relaciones de `SHELL-PKG-004`;
- no presenta como deprecado ningún package o consumidor sin release estable;
- distingue superficie pública, línea MAJOR, deprecación, retiro, fin de soporte y despublicación;
- define identificadores `DEP-*` únicos e inmutables;
- define los dos ciclos de vida y sus transiciones;
- fija una ventana ordinaria mínima de 90 días;
- exige una release estable intermedia antes del retiro;
- exige retiro de API estable únicamente mediante nueva versión MAJOR;
- fija mantenimiento mínimo de 180 días para la línea MAJOR anterior;
- materializa la política específica de contracts, contexto, Supabase y UI;
- exige reemplazo, guía, changelog, release, matriz, pruebas y rollback;
- bloquea el retiro mientras exista cualquier consumidor requerido sin resolución;
- conserva versiones, tags, releases y artefactos históricos;
- prohíbe la despublicación como mecanismo ordinario;
- regula prereleases sin presentarlas como API estable;
- regula excepciones críticas sin permitir mutación ni pérdida de historia;
- crea `TREQ-SHELL-038` y `TREQ-SHELL-039` sin alterar requisitos históricos;
- no ejecuta cambios físicos en packages, consumidores, CI, registry, datos o Supabase.

---

#### 20. Continuidad canónica del bloque

- **ÚLTIMA TAREA APROBADA:** SHELL-PKG-004 — Definir política de compatibilidad
- **TAREA ACTUAL APROBADA:** SHELL-PKG-005 — Definir política de deprecación
- **SIGUIENTE TAREA RESERVADA:** SHELL-PKG-006 — Definir rollback por aplicación


### ✅ SHELL-PKG-006 — Definir rollback por aplicación

**Estado:** APROBADA
**Tarea anterior:** `SHELL-PKG-005 — Definir política de deprecación`
**Tarea siguiente:** `SHELL-PKG-007 — Definir actualizaciones mediante PR`
**Tipo de tarea:** decisión documental vinculante de arquitectura operativa para rollback independiente de paquetes compartidos por aplicación

---

#### 1. Resultado material de esta tarea

Se adopta un contrato canónico de rollback por aplicación para las cuatro familias de paquetes compartidos y los siete consumidores web aprobados:

```text
ROLLBACK POR CONSUMIDOR
→ hacia un snapshot previo conocido y certificado
→ restaurando conjuntamente código, manifest y lockfile del consumidor
→ conservando la identidad inmutable de los packages publicados
→ sin exigir rollback simultáneo de las demás aplicaciones
→ sin revertir por inferencia datos, migraciones o configuración remota
→ con pruebas y evidencia antes de cerrar la recuperación
```

La unidad ordinaria de rollback no es el package publicado ni el conjunto completo de aplicaciones. Es el **snapshot verificable de una aplicación consumidora**, compuesto por el commit del consumidor, sus versiones exactas de packages, manifest, lockfile, configuración compatible y referencia del artefacto desplegado.

| Métrica                                             |         Resultado |
| --------------------------------------------------- | ----------------: |
| Familias de packages gobernadas                     |             **4** |
| Aplicaciones consumidoras gobernadas                |             **7** |
| Relaciones package–aplicación materializadas        |            **28** |
| Estados operativos definidos                        |             **8** |
| Capas de recuperación diferenciadas                 |             **7** |
| Decisiones vinculantes                              |            **36** |
| Hallazgos con destino explícito                     |            **12** |
| Releases estables compartidas adoptadas en el corte | **0 confirmadas** |
| Relaciones con rollback ejecutable en el corte      |             **0** |
| Cambios `TREQ-*`                                    |             **0** |

La ausencia actual de releases estables adoptadas impide ejecutar un rollback real de package, pero no impide definir completamente el contrato que cada adopción deberá satisfacer antes de desplegarse.

---

#### 2. Fuentes, dependencias y corte verificable

| Fuente                                                            | Uso en esta tarea                                                                  |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------------------- |
| `docs/plan-canonico/modular/01_PROTOCOLO.md`                      | continuidad, evidencia, aprobación y límites de la fase documental                 |
| `docs/plan-canonico/modular/delivery-contract.json`               | estructura física del artefacto documental                                         |
| `docs/plan-canonico/modular/active-sequence.json`                 | secuencia activa `SHELL-PKG-001..008` y handoff posterior                          |
| `docs/plan-canonico/modular/00_CABECERA_Y_ESTADO.md`              | confirmación de `SHELL-PKG-006` como tarea actual                                  |
| `02_DISTRIBUCION_Y_PAQUETES_COMPARTIDOS.md`                       | archivo propietario y decisiones `SHELL-PKG-001..005`                              |
| `SHELL-PKG-001`                                                   | distribución inmutable, versiones exactas, lockfile y rollback por consumidor      |
| `SHELL-PKG-002`                                                   | SemVer independiente y clasificación de cambios                                    |
| `SHELL-PKG-003`                                                   | tags, releases, procedencia, artefactos y versión restituible                      |
| `SHELL-PKG-004`                                                   | cuatro packages, siete consumidores, 28 relaciones y compatibilidad certificada    |
| `SHELL-PKG-005`                                                   | deprecación, mantenimiento, retiro y obligación de rollback soportado              |
| `T_CALIDAD_Y_DESPLIEGUE/01_PAQUETES_RELEASES_Y_COMPATIBILIDAD.md` | implementación posterior de pruebas, builds, releases y matriz                     |
| `T_CALIDAD_Y_DESPLIEGUE/02_PRUEBAS_DE_CONSUMIDORES_Y_ROLLBACK.md` | implementación posterior de pruebas por consumidor y rollback por repositorio      |
| `package.json` de `vento-shell`                                   | scripts documentales y workspace actual                                            |
| `packages/os-context/package.json` y `README.md`                  | package transitorio existente, todavía privado y no publicado como release estable |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`                | cobertura vigente de rollback, compatibilidad, evidencia, deprecación y retiro     |

**Commit documental remoto inspeccionado de `vento-shell`:** `477009f8c68cc9483f566eb6e8ba318739387071`.

La línea base aprobada conserva estas identidades:

| Tipo             | Identidades                                                                                           |
| ---------------- | ----------------------------------------------------------------------------------------------------- |
| Packages         | `@vento/contracts`; `@vento/os-context`; `@vento/supabase`; `@vento/ui-web`                           |
| Consumidores web | `vento-shell`; `vento-viso`; `vento-nexo`; `vento-fogo`; `vento-origo`; `vento-pulso`; `vento-numera` |

No existe evidencia canónica de una release estable publicada y adoptada de estas familias. `@vento/os-context@0.1.0` permanece como metadata transitoria de workspace privado y no constituye una versión estable restituible.

---

#### 3. Alcance exacto

Esta tarea decide:

1. la unidad de rollback por aplicación;
2. la composición mínima del snapshot restituible;
3. las capas que pueden requerir recuperación;
4. los estados y transiciones del rollback;
5. las precondiciones para declarar una adopción `ROLLBACK_READY`;
6. los disparadores que exigen abortar, revertir o ejecutar rollback;
7. el procedimiento canónico posterior al despliegue;
8. la regla de independencia entre aplicaciones;
9. el tratamiento de cortes coordinados entre packages;
10. las restricciones especiales de cada familia;
11. las 28 decisiones package–aplicación;
12. el expediente y la evidencia obligatoria;
13. los bloqueos que obligan a usar corrección hacia adelante;
14. la relación con deprecación, compatibilidad y retiro.

Esta tarea no:

- publica, despublica ni modifica packages, tags, releases o artefactos;
- cambia `package.json`, lockfiles, código, exports, builds o configuración;
- crea ramas, commits, pull requests, workflows, credenciales o secretos;
- ejecuta rollback en ningún consumidor;
- declara compatible una combinación no probada;
- crea o modifica migraciones, datos, RLS, funciones, triggers, Storage, Realtime o configuración de Supabase;
- revierte automáticamente datos o migraciones por retroceder una dependencia npm;
- define la automatización de PRs, reservada a `SHELL-PKG-007` y `SHELL-CI-006`;
- define los gates automáticos, reservados a `SHELL-PKG-008` y `SHELL-CI-*`;
- sustituye los planes de rollback de datos, infraestructura o despliegue propios de cada paquete E5.

---

#### 4. Definiciones canónicas

| Término                         | Definición vinculante                                                                                                                                   |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| snapshot desplegado             | identidad verificable de código, manifest, lockfile, packages, configuración compatible y artefacto de una aplicación en un ambiente                    |
| snapshot conocido y certificado | snapshot anterior con instalación reproducible, compatibilidad y validaciones satisfactorias atribuibles al mismo ambiente o a uno equivalente aprobado |
| actualización                   | transición de una aplicación desde un snapshot anterior hacia otro que cambia uno o más packages compartidos                                            |
| abortar                         | detener una actualización antes de que el nuevo snapshot sea fusionado o desplegado                                                                     |
| revertir                        | crear una nueva modificación auditable que deshace una actualización fusionada, sin reescribir historia                                                 |
| rollback                        | restaurar en un ambiente un snapshot anterior conocido y certificado después de haber desplegado el nuevo snapshot                                      |
| corrección hacia adelante       | desplegar una corrección nueva cuando volver al snapshot anterior es inseguro, incompatible o destructivo                                               |
| conjunto cerrado de rollback    | conjunto mínimo de packages cuyas versiones deben retroceder juntas para mantener resoluble el grafo exacto de dependencias internas                    |
| ventana de observación          | período definido por el paquete E5 o proceso de despliegue durante el cual se valida el snapshot restituido antes de cerrar el rollback                 |
| evidencia de cierre             | resultados atribuibles que demuestran instalación, build, pruebas, comportamiento, ambiente, versión y ausencia de regresión bloqueante                 |

El término rollback no autoriza reescribir tags, releases, versiones publicadas, commits compartidos ni artefactos inmutables.

---

#### 5. Invariantes obligatorios

1. Cada aplicación podrá adoptar y retroceder packages en una versión diferente a las demás aplicaciones.
2. El rollback restaurará una combinación completa y previamente certificada; no mezclará versiones por intuición.
3. El manifest y el lockfile del consumidor se restaurarán como una unidad coherente.
4. Las versiones publicadas permanecerán inmutables y disponibles conforme a la política de soporte aplicable.
5. El rollback se materializará mediante historia auditable del repositorio consumidor, nunca editando manualmente dependencias instaladas.
6. Un tag flotante, alias o canal no será suficiente para identificar el objetivo de rollback.
7. La versión exacta de cada package y la integridad resuelta deberán quedar registradas.
8. La restauración de una dependencia no implicará restauración automática de datos, migraciones, configuración remota, cachés o secretos.
9. Ningún rollback podrá reinstalar un bypass prohibido, una vulnerabilidad conocida o una semántica de autorización rechazada.
10. Una aplicación restituida deberá seguir siendo compatible con contratos, datos y servicios que permanezcan en versiones distintas.
11. Si esa compatibilidad no puede demostrarse, el rollback quedará bloqueado y se exigirá corrección hacia adelante o transición coordinada.
12. El cierre requerirá pruebas posteriores al despliegue y evidencia atribuible al ambiente real.
13. Un fallo previo al despliegue se resolverá abortando o revirtiendo la actualización; no se registrará falsamente como rollback productivo.
14. La ausencia de una versión previa certificada impedirá declarar una adopción lista para rollback.
15. La recuperación de una aplicación no obligará a desplegar simultáneamente los otros seis consumidores.

---

#### 6. Capas de recuperación

| ID            | Capa                           | Unidad que debe restaurarse                           | Regla                                                                                    |
| ------------- | ------------------------------ | ----------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| `RBK-LYR-001` | dependencia compartida         | versiones exactas del conjunto cerrado de packages    | restaurar únicamente packages necesarios, respetando dependencias internas exactas       |
| `RBK-LYR-002` | código consumidor              | commit anterior certificado de la aplicación          | incluir adapters, imports y cambios acoplados a la actualización                         |
| `RBK-LYR-003` | resolución de dependencias     | manifest y lockfile coherentes                        | no regenerar el lockfile para simular el snapshot anterior                               |
| `RBK-LYR-004` | configuración                  | versión o identidad de configuración compatible       | no restaurar secretos vencidos ni configuración insegura                                 |
| `RBK-LYR-005` | caché y artefactos derivados   | estrategia de invalidación o reconstrucción declarada | no asumir que un rollback de código limpia cachés incompatibles                          |
| `RBK-LYR-006` | contratos y servicios externos | banda compatible demostrada                           | impedir rollback si productores, RPC o eventos ya no aceptan la versión previa           |
| `RBK-LYR-007` | datos y migraciones            | plan propietario separado de datos                    | ningún retroceso npm ejecutará DDL, DML, backfill o restauración de datos por inferencia |

Un rollback puede abarcar varias capas, pero cada capa deberá conservar propietario, acción, validación y evidencia independientes.

---

#### 7. Estados y transiciones

##### 7.1. Estados permitidos

| Estado                           | Significado                                                                                   |
| -------------------------------- | --------------------------------------------------------------------------------------------- |
| `NO_APLICA_SIN_ADOPCION`         | la relación existe, pero no hay release estable adoptada que pueda retrocederse               |
| `ROLLBACK_BLOCKED`               | falta un snapshot, evidencia, compatibilidad o condición de seguridad necesaria               |
| `ROLLBACK_READY`                 | existe snapshot previo certificado y el procedimiento está probado para la combinación exacta |
| `ROLLBACK_REQUESTED`             | un disparador posterior al despliegue fue aceptado y se autorizó iniciar recuperación         |
| `ROLLBACK_IN_PROGRESS`           | la aplicación está siendo restaurada mediante su proceso normal y auditable                   |
| `ROLLED_BACK_PENDING_VALIDATION` | el snapshot previo fue desplegado, pero aún no supera las comprobaciones de cierre            |
| `ROLLBACK_VALIDATED`             | la aplicación restituida superó validaciones y quedó estable con evidencia atribuible         |
| `FORWARD_FIX_REQUIRED`           | el rollback es inseguro o imposible y existe un expediente de corrección hacia adelante       |

##### 7.2. Transiciones permitidas

```text
NO_APLICA_SIN_ADOPCION
→ ROLLBACK_BLOCKED
→ ROLLBACK_READY

ROLLBACK_READY
→ ROLLBACK_REQUESTED
→ ROLLBACK_IN_PROGRESS
→ ROLLED_BACK_PENDING_VALIDATION
→ ROLLBACK_VALIDATED

ROLLBACK_READY | ROLLBACK_REQUESTED | ROLLBACK_IN_PROGRESS
→ ROLLBACK_BLOCKED
→ FORWARD_FIX_REQUIRED

ROLLED_BACK_PENDING_VALIDATION
→ ROLLBACK_VALIDATED
   o
→ ROLLBACK_IN_PROGRESS
   o
→ FORWARD_FIX_REQUIRED
```

No se permitirá declarar `ROLLBACK_VALIDATED` directamente desde `ROLLBACK_READY` ni cerrar un rollback solo porque el despliegue terminó.

---

#### 8. Precondiciones de `ROLLBACK_READY`

Una relación package–aplicación solo podrá quedar `ROLLBACK_READY` cuando existan conjuntamente:

1. snapshot previo identificado por repositorio, commit y ambiente;
2. manifest y lockfile del snapshot previo;
3. versiones exactas e integridad de cada package compartido;
4. artefactos publicados todavía instalables e inmutables;
5. referencia de release y procedencia de cada package;
6. matriz de compatibilidad válida para la aplicación y sus dependencias externas;
7. instalación reproducible del snapshot previo;
8. pruebas propias del package y pruebas del consumidor aplicables;
9. build del consumidor cuando corresponda;
10. comprobaciones específicas de la familia de package;
11. estrategia declarada para configuración, caché y artefactos derivados;
12. evaluación explícita de migraciones y datos;
13. confirmación de que el snapshot previo no reinstala una vulnerabilidad o bypass prohibido;
14. responsable técnico y autoridad de ejecución identificados;
15. evidencia de un ensayo de rollback anterior al release o cutover productivo;
16. criterio de cierre y ventana de observación definidos por el paquete E5 propietario.

La compatibilidad histórica inferida, un lockfile aislado o la mera disponibilidad de una versión anterior no satisfacen estas precondiciones.

---

#### 9. Disparadores y respuesta obligatoria

| ID            | Momento                                | Disparador                                                                      | Respuesta inicial                                                                             |
| ------------- | -------------------------------------- | ------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| `RBK-TRG-001` | antes de merge                         | instalación, typecheck, pruebas o build fallidos                                | abortar la actualización                                                                      |
| `RBK-TRG-002` | después de merge y antes de despliegue | evidencia incompleta o gate bloqueante                                          | revertir la propuesta sin desplegar                                                           |
| `RBK-TRG-003` | después de despliegue                  | aplicación no inicia, no construye artefactos válidos o pierde rutas esenciales | evaluar rollback inmediato                                                                    |
| `RBK-TRG-004` | después de despliegue                  | incompatibilidad de tipos, contratos, eventos o RPC                             | bloquear expansión y evaluar conjunto cerrado                                                 |
| `RBK-TRG-005` | después de despliegue                  | regresión de contexto, sesión, permisos o denegación cerrada                    | detener expansión y recuperar solo si el snapshot previo es seguro                            |
| `RBK-TRG-006` | después de despliegue                  | pérdida funcional, navegación, render, hidratación o accesibilidad              | evaluar rollback de la aplicación afectada                                                    |
| `RBK-TRG-007` | después de despliegue                  | error de acceso a datos, RLS, RPC, transacción, Realtime o tipos generados      | separar rollback del SDK y plan de datos antes de actuar                                      |
| `RBK-TRG-008` | después de despliegue                  | corrupción, pérdida o transformación irreversible de datos                      | bloquear rollback automático y activar plan propietario de datos                              |
| `RBK-TRG-009` | cualquier momento                      | versión anterior contiene vulnerabilidad o bypass conocido                      | prohibir restauración y exigir corrección hacia adelante                                      |
| `RBK-TRG-010` | durante rollback                       | snapshot previo no instala, no despliega o no supera validaciones               | mantener incidente abierto y pasar a corrección hacia adelante o segundo snapshot certificado |

Los criterios cuantitativos de salud, tiempo y operación pertenecerán al paquete E5 y al proceso de despliegue de cada aplicación; esta tarea no inventa umbrales globales no aprobados.

---

#### 10. Procedimiento canónico posterior al despliegue

1. **Detectar y registrar:** identificar ambiente, aplicación, snapshot desplegado, síntoma, hora y evidencia inicial.
2. **Detener expansión:** impedir que la misma actualización avance a otros ambientes o consumidores mientras se clasifica el incidente.
3. **Clasificar la capa:** determinar si el fallo pertenece a dependencia, código, lockfile, configuración, caché, contrato externo o datos.
4. **Seleccionar objetivo:** elegir el último snapshot conocido y certificado compatible con el estado actual de contratos, servicios y datos.
5. **Verificar seguridad:** impedir restaurar vulnerabilidades, bypasses, permisos excesivos o semánticas expresamente retiradas.
6. **Determinar conjunto cerrado:** incluir todos los packages internos que deban retroceder juntos para resolver el grafo exacto.
7. **Autorizar:** obtener decisión del responsable técnico del consumidor y conformidad del propietario del package; toda acción sobre Supabase conservará autoridad separada en `vento-shell`.
8. **Materializar en historia:** restaurar el snapshot mediante una modificación auditable del repositorio consumidor, sin reescribir versiones ni artefactos publicados.
9. **Instalar reproduciblemente:** resolver exactamente el manifest y lockfile certificados del objetivo.
10. **Ejecutar validaciones previas:** comprobar instalación, tipos, pruebas, build y ejes específicos antes de promover el artefacto.
11. **Desplegar por el proceso normal:** utilizar el pipeline del consumidor y conservar identidad del artefacto y ambiente.
12. **Aplicar acciones separadas:** invalidar o reconstruir cachés y ajustar configuración únicamente cuando exista una acción aprobada y trazable.
13. **Validar después del despliegue:** ejecutar comprobaciones funcionales, contractuales, de autorización, datos, UI y operación aplicables.
14. **Observar:** mantener la relación en `ROLLED_BACK_PENDING_VALIDATION` hasta satisfacer el criterio de cierre.
15. **Cerrar o escalar:** declarar `ROLLBACK_VALIDATED` con evidencia, o `FORWARD_FIX_REQUIRED` con bloqueo, propietario y condición de salida.
16. **Prevenir recurrencia:** vincular la causa a pruebas, compatibilidad, release, deprecación o gate que deba corregirse antes de reintentar.

---

#### 11. Reglas específicas por familia

| ID            | Package             | Riesgo dominante de rollback                                                                 | Condiciones adicionales                                                                                                                                                                 |
| ------------- | ------------------- | -------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `RBK-FAM-001` | `@vento/contracts`  | consumidores y productores usando versiones distintas de schemas, eventos, códigos o estados | el snapshot previo deberá seguir interpretando datos y mensajes vigentes; si el productor ya emite únicamente el contrato nuevo, se requerirá puente compatible o corrección coordinada |
| `RBK-FAM-002` | `@vento/os-context` | restauración de decisiones de autorización, sesión o contexto obsoletas                      | deberá conservar denegación cerrada, auditoría, autoridad efectiva y ausencia de bypasses; una versión insegura nunca será objetivo válido                                              |
| `RBK-FAM-003` | `@vento/supabase`   | confundir rollback del cliente o wrapper con rollback del esquema y los datos                | la dependencia podrá retroceder solo si el esquema actual sigue siendo compatible; toda migración o cambio Supabase pertenecerá a `vento-shell` y tendrá plan separado                  |
| `RBK-FAM-004` | `@vento/ui-web`     | regresiones de render, hidratación, navegación, accesibilidad, tokens o contrato CSS         | el snapshot previo deberá validarse con el runtime del consumidor y conservar comportamiento, layout, interacción y accesibilidad esperados                                             |

##### 11.1. Supabase y datos

El rollback de `@vento/supabase`:

- puede restaurar factories, clients, adapters, wrappers, tipos o errores normalizados del consumidor;
- no ejecuta por sí mismo migraciones inversas;
- no elimina columnas, tablas, funciones, triggers, políticas, buckets, eventos ni datos;
- no revierte backfills ni transformaciones;
- exige compatibilidad hacia atrás del esquema mientras coexistan aplicaciones en versiones distintas;
- queda bloqueado cuando el snapshot previo no puede operar de forma segura contra el esquema vigente;
- requerirá corrección hacia adelante cuando una migración irreversible ya haya sido aplicada y no exista restauración segura.

Toda modificación Supabase perteneciente a VENTO se creará, versionará, documentará y ejecutará desde `vento-shell`, bajo su tarea propietaria y autorización aplicable.

---

#### 12. Cortes coordinados y conjunto cerrado

Los packages conservan versiones independientes. Sin embargo, una aplicación podrá necesitar retroceder más de uno cuando el release adoptado contenga dependencias internas exactas.

Reglas:

1. se construirá el grafo de packages realmente instalados por la aplicación;
2. se identificará la primera arista incompatible con el snapshot objetivo;
3. se calculará el conjunto mínimo cerrado que resuelva todas las dependencias internas;
4. no se retrocederán packages sin cambio o sin relación causal solo para igualar números de versión;
5. el conjunto seleccionado deberá corresponder a una combinación previamente certificada;
6. una aplicación podrá retroceder ese conjunto sin obligar a las otras seis aplicaciones;
7. si un contrato externo común impide la independencia, la relación quedará `ROLLBACK_BLOCKED` y se documentará la transición coordinada necesaria;
8. nunca se convertirá una prerelease en objetivo productivo por falta de una estable compatible.

---

#### 13. Matriz package–aplicación de rollback

La matriz conserva las 28 relaciones aprobadas. Todas comienzan en `NO_APLICA_SIN_ADOPCION` porque no existe una release estable compartida adoptada y certificada en el corte.

| ID            | Package             | Aplicación     | Unidad de rollback                                               | Validación específica mínima                                  | Estado inicial           |
| ------------- | ------------------- | -------------- | ---------------------------------------------------------------- | ------------------------------------------------------------- | ------------------------ |
| `RBK-REL-001` | `@vento/contracts`  | `vento-shell`  | snapshot previo certificado de `vento-shell` y conjunto cerrado  | schemas, tipos, códigos, eventos y compatibilidad histórica   | `NO_APLICA_SIN_ADOPCION` |
| `RBK-REL-002` | `@vento/contracts`  | `vento-viso`   | snapshot previo certificado de `vento-viso` y conjunto cerrado   | schemas, tipos, códigos, eventos y compatibilidad histórica   | `NO_APLICA_SIN_ADOPCION` |
| `RBK-REL-003` | `@vento/contracts`  | `vento-nexo`   | snapshot previo certificado de `vento-nexo` y conjunto cerrado   | schemas, tipos, códigos, eventos y compatibilidad histórica   | `NO_APLICA_SIN_ADOPCION` |
| `RBK-REL-004` | `@vento/contracts`  | `vento-fogo`   | snapshot previo certificado de `vento-fogo` y conjunto cerrado   | schemas, tipos, códigos, eventos y compatibilidad histórica   | `NO_APLICA_SIN_ADOPCION` |
| `RBK-REL-005` | `@vento/contracts`  | `vento-origo`  | snapshot previo certificado de `vento-origo` y conjunto cerrado  | schemas, tipos, códigos, eventos y compatibilidad histórica   | `NO_APLICA_SIN_ADOPCION` |
| `RBK-REL-006` | `@vento/contracts`  | `vento-pulso`  | snapshot previo certificado de `vento-pulso` y conjunto cerrado  | schemas, tipos, códigos, eventos y compatibilidad histórica   | `NO_APLICA_SIN_ADOPCION` |
| `RBK-REL-007` | `@vento/contracts`  | `vento-numera` | snapshot previo certificado de `vento-numera` y conjunto cerrado | schemas, tipos, códigos, eventos y compatibilidad histórica   | `NO_APLICA_SIN_ADOPCION` |
| `RBK-REL-008` | `@vento/os-context` | `vento-shell`  | snapshot previo certificado de `vento-shell` y conjunto cerrado  | contexto, sesión, autorización, denegación y auditoría        | `NO_APLICA_SIN_ADOPCION` |
| `RBK-REL-009` | `@vento/os-context` | `vento-viso`   | snapshot previo certificado de `vento-viso` y conjunto cerrado   | contexto, sesión, autorización, denegación y auditoría        | `NO_APLICA_SIN_ADOPCION` |
| `RBK-REL-010` | `@vento/os-context` | `vento-nexo`   | snapshot previo certificado de `vento-nexo` y conjunto cerrado   | contexto, sesión, autorización, denegación y auditoría        | `NO_APLICA_SIN_ADOPCION` |
| `RBK-REL-011` | `@vento/os-context` | `vento-fogo`   | snapshot previo certificado de `vento-fogo` y conjunto cerrado   | contexto, sesión, autorización, denegación y auditoría        | `NO_APLICA_SIN_ADOPCION` |
| `RBK-REL-012` | `@vento/os-context` | `vento-origo`  | snapshot previo certificado de `vento-origo` y conjunto cerrado  | contexto, sesión, autorización, denegación y auditoría        | `NO_APLICA_SIN_ADOPCION` |
| `RBK-REL-013` | `@vento/os-context` | `vento-pulso`  | snapshot previo certificado de `vento-pulso` y conjunto cerrado  | contexto, sesión, autorización, denegación y auditoría        | `NO_APLICA_SIN_ADOPCION` |
| `RBK-REL-014` | `@vento/os-context` | `vento-numera` | snapshot previo certificado de `vento-numera` y conjunto cerrado | contexto, sesión, autorización, denegación y auditoría        | `NO_APLICA_SIN_ADOPCION` |
| `RBK-REL-015` | `@vento/supabase`   | `vento-shell`  | snapshot previo certificado de `vento-shell`; datos separados    | clients, RPC, RLS, tipos, transacciones y esquema vigente     | `NO_APLICA_SIN_ADOPCION` |
| `RBK-REL-016` | `@vento/supabase`   | `vento-viso`   | snapshot previo certificado de `vento-viso`; datos separados     | clients, RPC, RLS, tipos, transacciones y esquema vigente     | `NO_APLICA_SIN_ADOPCION` |
| `RBK-REL-017` | `@vento/supabase`   | `vento-nexo`   | snapshot previo certificado de `vento-nexo`; datos separados     | clients, RPC, RLS, tipos, transacciones y esquema vigente     | `NO_APLICA_SIN_ADOPCION` |
| `RBK-REL-018` | `@vento/supabase`   | `vento-fogo`   | snapshot previo certificado de `vento-fogo`; datos separados     | clients, RPC, RLS, tipos, transacciones y esquema vigente     | `NO_APLICA_SIN_ADOPCION` |
| `RBK-REL-019` | `@vento/supabase`   | `vento-origo`  | snapshot previo certificado de `vento-origo`; datos separados    | clients, RPC, RLS, tipos, transacciones y esquema vigente     | `NO_APLICA_SIN_ADOPCION` |
| `RBK-REL-020` | `@vento/supabase`   | `vento-pulso`  | snapshot previo certificado de `vento-pulso`; datos separados    | clients, RPC, RLS, tipos, transacciones y esquema vigente     | `NO_APLICA_SIN_ADOPCION` |
| `RBK-REL-021` | `@vento/supabase`   | `vento-numera` | snapshot previo certificado de `vento-numera`; datos separados   | clients, RPC, RLS, tipos, transacciones y esquema vigente     | `NO_APLICA_SIN_ADOPCION` |
| `RBK-REL-022` | `@vento/ui-web`     | `vento-shell`  | snapshot previo certificado de `vento-shell` y conjunto cerrado  | render, hidratación, navegación, accesibilidad y contrato CSS | `NO_APLICA_SIN_ADOPCION` |
| `RBK-REL-023` | `@vento/ui-web`     | `vento-viso`   | snapshot previo certificado de `vento-viso` y conjunto cerrado   | render, hidratación, navegación, accesibilidad y contrato CSS | `NO_APLICA_SIN_ADOPCION` |
| `RBK-REL-024` | `@vento/ui-web`     | `vento-nexo`   | snapshot previo certificado de `vento-nexo` y conjunto cerrado   | render, hidratación, navegación, accesibilidad y contrato CSS | `NO_APLICA_SIN_ADOPCION` |
| `RBK-REL-025` | `@vento/ui-web`     | `vento-fogo`   | snapshot previo certificado de `vento-fogo` y conjunto cerrado   | render, hidratación, navegación, accesibilidad y contrato CSS | `NO_APLICA_SIN_ADOPCION` |
| `RBK-REL-026` | `@vento/ui-web`     | `vento-origo`  | snapshot previo certificado de `vento-origo` y conjunto cerrado  | render, hidratación, navegación, accesibilidad y contrato CSS | `NO_APLICA_SIN_ADOPCION` |
| `RBK-REL-027` | `@vento/ui-web`     | `vento-pulso`  | snapshot previo certificado de `vento-pulso` y conjunto cerrado  | render, hidratación, navegación, accesibilidad y contrato CSS | `NO_APLICA_SIN_ADOPCION` |
| `RBK-REL-028` | `@vento/ui-web`     | `vento-numera` | snapshot previo certificado de `vento-numera` y conjunto cerrado | render, hidratación, navegación, accesibilidad y contrato CSS | `NO_APLICA_SIN_ADOPCION` |

**Conciliación:** 4 packages × 7 aplicaciones = 28 relaciones; 28 identificadores únicos; siete relaciones por package; cuatro relaciones por aplicación; cero faltantes y cero duplicados.

PASS, ANIMA, TALENTO y otras superficies móviles no se incorporan por inferencia. Su rollback requerirá contratos propietarios y tareas aplicables a sus runtimes.

---

#### 14. Expediente canónico de rollback

Cada ejecución o ensayo conservará un expediente inmutable `RBK-*` con, como mínimo:

| Campo                   | Contenido obligatorio                                                                 |
| ----------------------- | ------------------------------------------------------------------------------------- |
| `rollback_id`           | identificador único del expediente                                                    |
| `status`                | uno de los ocho estados permitidos                                                    |
| `application`           | repositorio consumidor exacto                                                         |
| `environment`           | ambiente afectado y superficie desplegada                                             |
| `trigger`               | disparador, síntoma y evidencia inicial                                               |
| `package_set_from`      | packages y versiones exactas del snapshot fallido                                     |
| `package_set_to`        | conjunto cerrado y versiones exactas del objetivo                                     |
| `consumer_commit_from`  | commit desplegado antes del rollback                                                  |
| `consumer_commit_to`    | commit del snapshot conocido y certificado                                            |
| `manifest_ref`          | manifest restituido                                                                   |
| `lockfile_hash`         | hash del lockfile objetivo                                                            |
| `release_refs`          | tags, releases, commits e integridad de packages                                      |
| `compatibility_ref`     | matriz aplicable al objetivo y al ambiente                                            |
| `deployment_ref`        | identidad del artefacto y ejecución de despliegue                                     |
| `configuration_impact`  | configuración restaurada, preservada o bloqueada                                      |
| `cache_impact`          | invalidación, reconstrucción o no aplicabilidad                                       |
| `data_migration_impact` | `NO_APLICA` con evidencia o referencia al plan propietario                            |
| `security_assessment`   | confirmación de que no se restaura vulnerabilidad o bypass conocido                   |
| `authorities`           | responsable técnico del consumidor, propietario del package y aprobaciones aplicables |
| `validation_results`    | instalación, tipos, pruebas, build y verificaciones posteriores                       |
| `started_at`            | inicio atribuible de la recuperación                                                  |
| `finished_at`           | cierre o escalamiento atribuible                                                      |
| `outcome`               | resultado, impacto residual y condición de salida                                     |
| `follow_up`             | pruebas, gates, compatibilidad o correcciones exigidas antes de reintentar            |

El expediente no podrá marcarse cerrado si faltan identidad del objetivo, evidencia posterior o decisión sobre datos y seguridad.

---

#### 15. Autoridad y responsabilidades

| Rol                                  | Responsabilidad                                                                                         |
| ------------------------------------ | ------------------------------------------------------------------------------------------------------- |
| responsable técnico de la aplicación | clasificar impacto, seleccionar snapshot, autorizar ejecución y validar recuperación del consumidor     |
| propietario del package              | confirmar identidad, soporte, dependencias, riesgos y conjunto cerrado aplicable                        |
| responsable de release               | preservar procedencia, artefactos, versiones y evidencia de publicación                                 |
| responsables de compatibilidad       | confirmar que el objetivo pertenece a una combinación probada                                           |
| propietario de datos o Supabase      | decidir cualquier acción sobre esquema, datos, funciones, políticas o configuración desde `vento-shell` |
| paquete E5 de la aplicación          | definir operación, ambiente, ventana de observación, responsables locales y criterio de cierre          |

Un rollback de emergencia no elimina estas responsabilidades. Podrá abreviar la secuencia de aprobación solo cuando exista una autoridad de incidente previamente definida, pero deberá conservar la misma evidencia y revisión posterior.

---

#### 16. Bloqueos y corrección hacia adelante

| ID            | Bloqueo                                                                       | Estado                 | Propietario de resolución                              |
| ------------- | ----------------------------------------------------------------------------- | ---------------------- | ------------------------------------------------------ |
| `RBK-BLK-001` | no existe snapshot previo certificado                                         | `ROLLBACK_BLOCKED`     | `SHELL-CI-014`; paquete E5 consumidor                  |
| `RBK-BLK-002` | falta manifest o lockfile verificable                                         | `ROLLBACK_BLOCKED`     | repositorio consumidor; `SHELL-PKG-007..008`           |
| `RBK-BLK-003` | la versión anterior no está disponible o su integridad no coincide            | `ROLLBACK_BLOCKED`     | `SHELL-CI-003`; propietario del package                |
| `RBK-BLK-004` | el grafo interno no resuelve con la versión objetivo                          | `ROLLBACK_BLOCKED`     | `SHELL-CI-005`; propietario del conjunto cerrado       |
| `RBK-BLK-005` | el contrato o servicio vigente ya no acepta el snapshot previo                | `FORWARD_FIX_REQUIRED` | propietario contractual y consumidores afectados       |
| `RBK-BLK-006` | el esquema o los datos vigentes no son compatibles                            | `FORWARD_FIX_REQUIRED` | tareas `SHELL-DB-*`, Supabase y paquete E5 aplicable   |
| `RBK-BLK-007` | la versión previa restaura una vulnerabilidad o bypass                        | `FORWARD_FIX_REQUIRED` | propietario del package y seguridad                    |
| `RBK-BLK-008` | no existe evidencia de pruebas del objetivo                                   | `ROLLBACK_BLOCKED`     | `SHELL-CI-001`; `SHELL-CI-005`; pruebas del consumidor |
| `RBK-BLK-009` | configuración o secreto previo es inválido, vencido o inseguro                | `FORWARD_FIX_REQUIRED` | propietario de configuración del ambiente              |
| `RBK-BLK-010` | caché o artefacto derivado no puede reconciliarse sin pérdida                 | `ROLLBACK_BLOCKED`     | paquete E5 y propietario del servicio afectado         |
| `RBK-BLK-011` | la restauración exige despliegue simultáneo no probado de varios consumidores | `ROLLBACK_BLOCKED`     | `SHELL-CI-015`; propietarios afectados                 |
| `RBK-BLK-012` | no existe autoridad o ambiente claramente identificado                        | `ROLLBACK_BLOCKED`     | paquete E5 consumidor; trazabilidad de ambiente        |

Toda corrección hacia adelante deberá registrar el bloqueo exacto, riesgo de no restaurar, propietario, artefacto correctivo, pruebas, criterio de salida y relación con el expediente original.

---

#### 17. Relación con deprecación, retiro y soporte

1. Una superficie deprecada no podrá retirarse si alguno de sus consumidores carece de rollback hacia una combinación soportada.
2. Una línea en `MANTENIMIENTO` podrá ser objetivo de rollback mientras permanezca soportada, instalable, compatible y segura.
3. Una línea en `FIN_DE_SOPORTE` no será objetivo ordinario de nuevas adopciones; su uso de emergencia exigirá excepción trazable y no podrá restaurar riesgos conocidos.
4. Una línea `HISTORICA` preserva reproducibilidad y auditoría, pero no se presume operativamente restituible.
5. El gate de retiro evaluará las 28 relaciones y bloqueará el cierre si alguna requerida no está migrada, no aplica con evidencia o dispone de rollback válido.
6. La ventana temporal de deprecación no sustituye la preparación de rollback.
7. El retiro de una identidad no autoriza despublicar ni mutar artefactos históricos.

---

#### 18. Registro de decisiones vinculantes

| ID            | Decisión                                                                       | Estado                 | Materialización posterior           |
| ------------- | ------------------------------------------------------------------------------ | ---------------------- | ----------------------------------- |
| `PKG-RBK-001` | definir la aplicación como unidad ordinaria de rollback                        | `DECIDIDO`             | `SHELL-CI-014`                      |
| `PKG-RBK-002` | permitir rollback independiente por consumidor                                 | `DECIDIDO`             | `SHELL-CI-014..015`                 |
| `PKG-RBK-003` | usar snapshot previo conocido y certificado                                    | `DECIDIDO`             | evidencia de release y consumidor   |
| `PKG-RBK-004` | restaurar manifest y lockfile como unidad                                      | `DECIDIDO`             | PR y pipeline consumidor            |
| `PKG-RBK-005` | conservar versions exactas e integridad                                        | `DECIDIDO`             | registry, lockfile y manifest       |
| `PKG-RBK-006` | prohibir mutar tags, releases o bytes publicados                               | `DECIDIDO`             | `SHELL-CI-003`                      |
| `PKG-RBK-007` | distinguir abortar, revertir y rollback                                        | `DECIDIDO`             | automatización y expediente         |
| `PKG-RBK-008` | exigir historia auditable del consumidor                                       | `DECIDIDO`             | `SHELL-PKG-007`; `SHELL-CI-006`     |
| `PKG-RBK-009` | separar dependencia, código, lockfile, configuración, caché, contratos y datos | `DECIDIDO`             | paquetes E5 y CI                    |
| `PKG-RBK-010` | no inferir rollback de datos desde rollback npm                                | `DECIDIDO`             | tareas `SHELL-DB-*` y Supabase      |
| `PKG-RBK-011` | gobernar las cuatro familias aprobadas                                         | `DECIDIDO`             | packages propietarios               |
| `PKG-RBK-012` | gobernar los siete consumidores web aprobados                                  | `DECIDIDO`             | matriz de consumidores              |
| `PKG-RBK-013` | materializar 28 relaciones explícitas                                          | `DECIDIDO`             | `SHELL-CI-005`; `SHELL-CI-014`      |
| `PKG-RBK-014` | iniciar todas las relaciones sin adopción como no aplicables                   | `DECIDIDO`             | línea base actual                   |
| `PKG-RBK-015` | definir ocho estados operativos                                                | `DECIDIDO`             | expediente `RBK-*`                  |
| `PKG-RBK-016` | prohibir cierre sin validación posterior                                       | `DECIDIDO`             | pipeline y evidencia                |
| `PKG-RBK-017` | exigir ensayo antes de release o cutover                                       | `DECIDIDO`             | `SHELL-CI-014`; paquetes E5         |
| `PKG-RBK-018` | calcular conjunto cerrado de dependencias internas                             | `DECIDIDO`             | matriz y grafo de packages          |
| `PKG-RBK-019` | no usar versionado lockstep artificial                                         | `DECIDIDO`             | releases independientes             |
| `PKG-RBK-020` | bloquear snapshot incompatible con contratos vigentes                          | `DECIDIDO`             | matriz contractual                  |
| `PKG-RBK-021` | bloquear snapshot incompatible con esquema o datos                             | `DECIDIDO`             | arquitectura Supabase               |
| `PKG-RBK-022` | prohibir restaurar vulnerabilidades o bypasses                                 | `DECIDIDO`             | evaluación de seguridad             |
| `PKG-RBK-023` | exigir denegación cerrada en os-context                                        | `DECIDIDO`             | pruebas de autorización             |
| `PKG-RBK-024` | exigir compatibilidad histórica en contracts                                   | `DECIDIDO`             | pruebas de contratos y eventos      |
| `PKG-RBK-025` | separar rollback del SDK Supabase y rollback de base de datos                  | `DECIDIDO`             | `vento-shell` y tareas propietarias |
| `PKG-RBK-026` | validar render, hidratación, navegación y accesibilidad en ui-web              | `DECIDIDO`             | pruebas de consumidores             |
| `PKG-RBK-027` | detener expansión al detectar un incidente                                     | `DECIDIDO`             | pipeline de despliegue              |
| `PKG-RBK-028` | conservar expediente inmutable `RBK-*`                                         | `DECIDIDO`             | `SHELL-CI-014`; evidencia           |
| `PKG-RBK-029` | exigir identidad de ambiente y artefacto                                       | `DECIDIDO`             | trazabilidad de despliegue          |
| `PKG-RBK-030` | asignar autoridad al consumidor y conformidad al package                       | `DECIDIDO`             | gobierno de release                 |
| `PKG-RBK-031` | reservar toda acción Supabase a `vento-shell`                                  | `RESTRICCION_CANONICA` | tareas Supabase propietarias        |
| `PKG-RBK-032` | permitir corrección hacia adelante solo con bloqueo explícito                  | `DECIDIDO`             | expediente y paquete E5             |
| `PKG-RBK-033` | vincular causa a pruebas y gates preventivos                                   | `DECIDIDO`             | `SHELL-PKG-008`; `SHELL-CI-*`       |
| `PKG-RBK-034` | excluir móviles sin contrato propietario                                       | `DECIDIDO`             | tareas futuras aplicables           |
| `PKG-RBK-035` | no implementar ni ejecutar rollback en esta fase                               | `RESTRICCION_CANONICA` | fase documental                     |
| `PKG-RBK-036` | no modificar código, packages, consumidores, CI, datos o Supabase              | `RESTRICCION_CANONICA` | implementación posterior autorizada |

**Conciliación:** 36 decisiones, 36 identificadores únicos, cero faltantes y cero duplicados.

---

#### 19. Hallazgos y destinos exactos

| ID                    | Hallazgo                                                                               | Estado                         | Destino o condición de salida                                             |
| --------------------- | -------------------------------------------------------------------------------------- | ------------------------------ | ------------------------------------------------------------------------- |
| `H-SHELL-PKG-006-001` | no existe una release estable compartida adoptada que permita ejecutar rollback real   | `NO_APLICA_SIN_ADOPCION`       | publicación y adopción controladas en tareas `SHELL-CI-*` y `SHELL-MIG-*` |
| `H-SHELL-PKG-006-002` | el package local `@vento/os-context@0.1.0` no es una release estable restituible       | `BLOQUEO_DE_EJECUCION`         | build, publicación y procedencia canónica antes de adopción               |
| `H-SHELL-PKG-006-003` | las 28 relaciones carecen todavía de snapshot previo certificado                       | `PENDIENTE_DE_IMPLEMENTACION`  | `SHELL-CI-005`; `SHELL-CI-014`                                            |
| `H-SHELL-PKG-006-004` | el rollback independiente ya está exigido por `TREQ-SHELL-007`                         | `COBERTURA_CANONICA_EXISTENTE` | materializar evidencia en implementación                                  |
| `H-SHELL-PKG-006-005` | la compatibilidad por consumidor está protegida por `TREQ-SHELL-006`                   | `COBERTURA_CANONICA_EXISTENTE` | matriz ejecutable `SHELL-CI-005`                                          |
| `H-SHELL-PKG-006-006` | la identidad inmutable del release está protegida por `TREQ-SHELL-036`                 | `COBERTURA_CANONICA_EXISTENTE` | pipeline `SHELL-CI-003`                                                   |
| `H-SHELL-PKG-006-007` | los cortes coordinados están protegidos por `TREQ-SHELL-037`                           | `COBERTURA_CANONICA_EXISTENTE` | grafo y matriz en CI                                                      |
| `H-SHELL-PKG-006-008` | el retiro exige rollback soportado por `TREQ-SHELL-039`                                | `COBERTURA_CANONICA_EXISTENTE` | gate de retiro `SHELL-PKG-008`                                            |
| `H-SHELL-PKG-006-009` | retroceder `@vento/supabase` no equivale a revertir base de datos                      | `DECISION_CRITICA`             | planes propietarios `SHELL-DB-*`, Supabase y paquetes E5                  |
| `H-SHELL-PKG-006-010` | no existe todavía automatización de rollback por repositorio                           | `PENDIENTE_DE_IMPLEMENTACION`  | `SHELL-CI-014`                                                            |
| `H-SHELL-PKG-006-011` | no existe todavía evidencia de despliegues independientes obligatoriamente preservados | `PENDIENTE_DE_IMPLEMENTACION`  | `SHELL-CI-015`                                                            |
| `H-SHELL-PKG-006-012` | las actualizaciones por PR y sus gates aún no están materializadas                     | `PENDIENTE_DE_IMPLEMENTACION`  | `SHELL-PKG-007..008`; `SHELL-CI-006`                                      |

**Conciliación:** doce hallazgos, doce destinos o condiciones de salida y cero pendientes narrativos sin propietario.

---

#### 20. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** `TREQ-SHELL-007` ya exige que cada aplicación y package demuestre rollback independiente de código, contrato, caché, migración y configuración sin restaurar bypasses ni perder datos o auditoría, con prueba previa al release y compatibilidad entre versiones distintas. `TREQ-SHELL-006` cubre las pruebas propias y la matriz contra cada consumidor; `TREQ-SHELL-008` exige declaración y resultados reproducibles por package y PR; `TREQ-SHELL-009` exige identidad verificable de ambiente, repositorio y commit; `TREQ-SHELL-036` protege la inmutabilidad del release; `TREQ-SHELL-037` protege cortes coordinados; y `TREQ-SHELL-039` bloquea el retiro sin rollback hacia una combinación soportada. Esta tarea materializa el procedimiento y las 28 decisiones bajo esas obligaciones sin crear una segunda exigencia duplicada.

| Operación sobre `TREQ-*` | Cantidad |
| ------------------------ | -------: |
| creados                  |    **0** |
| modificados              |    **0** |
| diferidos                |    **0** |
| descartados              |    **0** |
| obsoletos                |    **0** |

No corresponde producir una nueva copia del registro `04A`.

---

#### 21. Entregables

1. Unidad canónica de rollback por aplicación.
2. Definición de snapshot conocido y certificado.
3. Siete capas de recuperación separadas.
4. Ocho estados con transiciones permitidas.
5. Dieciséis precondiciones de readiness.
6. Diez disparadores con respuesta inicial.
7. Procedimiento operativo de dieciséis pasos.
8. Cuatro perfiles de riesgo y validación por familia.
9. Reglas para Supabase, datos y migraciones.
10. Regla de conjunto cerrado para cortes coordinados.
11. Matriz completa de 28 relaciones package–aplicación.
12. Contrato del expediente `RBK-*`.
13. Matriz de doce bloqueos y corrección hacia adelante.
14. Treinta y seis decisiones vinculantes.
15. Doce hallazgos con destino exacto.
16. Declaración de cero cambios `TREQ-*` con cobertura explícita.

---

#### 22. Criterios de aceptación

`SHELL-PKG-006` queda materialmente completa cuando:

- aparecen exactamente las cuatro familias aprobadas;
- aparecen exactamente los siete consumidores web aprobados;
- existen 28 relaciones package–aplicación sin faltantes ni duplicados;
- cada relación tiene unidad, validación específica y estado inicial;
- el rollback se define por snapshot del consumidor y no por mutación del package;
- manifest y lockfile se restauran como unidad coherente;
- se distingue entre abortar, revertir, rollback y corrección hacia adelante;
- existen estados y transiciones que impiden cerrar sin validación posterior;
- se definen precondiciones verificables para `ROLLBACK_READY`;
- se separan package, código, configuración, caché, contratos y datos;
- `@vento/supabase` no autoriza migraciones o restauraciones implícitas;
- se prohíbe restaurar vulnerabilidades, bypasses o autorización insegura;
- los cortes coordinados usan un conjunto mínimo cerrado y versiones independientes;
- cada aplicación puede retroceder sin obligar a las demás, salvo bloqueo contractual demostrado;
- se define un expediente `RBK-*` con identidad, autoridad, evidencia y resultado;
- cada bloqueo conserva propietario y condición de salida;
- la relación con deprecación y retiro queda explícita;
- se declaran cero cambios `TREQ-*` por cobertura directa de requisitos vigentes;
- no se publican packages ni se modifican código, CI, consumidores, datos o Supabase.

---

#### 23. Continuidad canónica del bloque

- **ÚLTIMA TAREA APROBADA:** SHELL-PKG-005 — Definir política de deprecación
- **TAREA ACTUAL APROBADA:** SHELL-PKG-006 — Definir rollback por aplicación
- **SIGUIENTE TAREA RESERVADA:** SHELL-PKG-007 — Definir actualizaciones mediante PR


### ✅ SHELL-PKG-007 — Definir actualizaciones mediante PR

**Estado:** APROBADA
**Tarea anterior:** SHELL-PKG-006 — Definir rollback por aplicación
**Tarea siguiente:** SHELL-PKG-008 — Evitar actualizaciones automáticas sin pruebas
**Tipo de tarea:** Documental
**Fase:** Definición documental vinculante; implementación física no autorizada
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Fecha de corte:** 2026-08-01
**Corte remoto de referencia:** `50b65efaba52344da3564f00fb0249dd16bdd259`
**Cambios en código, paquetes, consumidores, workflows, ramas protegidas, despliegues, datos o Supabase:** no autorizados ni realizados

---

#### 1. Resultado material

Se establece el contrato canónico para proponer, revisar, aprobar, fusionar y adoptar actualizaciones de paquetes compartidos de Vento OS mediante pull requests en cada repositorio consumidor.

La regla vinculante es:

```text
release inmutable de un package compartido
→ propuesta explícita en el repositorio consumidor
→ cambio conjunto de manifest y lockfile
→ evidencia atribuible al commit del consumidor
→ revisión humana y técnica independiente
→ decisión de merge propia del consumidor
→ despliegue independiente y trazable
```

Ninguna publicación de package modificará directamente un consumidor. Un servicio automatizado podrá preparar una rama, actualizar los archivos autorizados, ejecutar comprobaciones y abrir o mantener un pull request; no podrá fusionarlo, desplegarlo, alterar controles de protección ni convertir una versión nueva en efectiva sin la decisión explícita del repositorio consumidor.

| Métrica                                                        | Resultado |
| -------------------------------------------------------------- | --------: |
| Familias de packages gobernadas                                |     **4** |
| Repositorios web consumidores gobernados                       |     **7** |
| Relaciones package–consumidor materializadas                   |    **28** |
| Clases de actualización definidas                              |     **7** |
| Estados del ciclo de propuesta                                 |    **14** |
| Operaciones automáticas directas sobre ramas principales       |     **0** |
| Fusiones automáticas autorizadas                               |     **0** |
| Despliegues automáticos autorizados por el actualizador        |     **0** |
| Decisiones vinculantes                                         |    **36** |
| Hallazgos con destino o condición de salida                    |    **12** |
| Requisitos `TREQ-*` creados o modificados                      |     **0** |
| Implementaciones de actualización ejecutadas en esta tarea     |     **0** |

---

#### 2. Fuentes y línea base verificable

##### 2.1. Fuentes vinculantes

| Fuente                                                            | Uso                                                                                                  |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- |
| `01_PROTOCOLO.md`                                                 | continuidad, alcance, trazabilidad, evidencia, fases y tratamiento de requisitos                     |
| `delivery-contract.json`                                         | estructura física del artefacto documental                                                           |
| `active-sequence.json`                                           | confirmación de `SHELL-PKG-007` como tarea actual                                                     |
| `continuity-route.json`                                          | ruta normal del BLOQUE H                                                                              |
| `00_CABECERA_Y_ESTADO.md`                                        | última tarea aprobada, tarea actual y siguiente reservada                                             |
| `02_DISTRIBUCION_Y_PAQUETES_COMPARTIDOS.md`                      | decisiones aprobadas `SHELL-PKG-001` a `SHELL-PKG-006`                                               |
| `SHELL-PKG-001 — Elegir mecanismo de distribución`               | registry privado, versiones exactas, lockfile y actualizaciones revisables                           |
| `SHELL-PKG-002 — Definir versionado semántico`                   | clasificación de cambios y versiones independientes                                                  |
| `SHELL-PKG-003 — Definir tags y releases`                        | identidad inmutable entre package, versión, tag, release, commit y artefacto                          |
| `SHELL-PKG-004 — Definir política de compatibilidad`             | cuatro packages, siete consumidores, 28 relaciones y adopción independiente                           |
| `SHELL-PKG-005 — Definir política de deprecación`                | ventanas, migraciones, retiros y consumidores requeridos                                             |
| `SHELL-PKG-006 — Definir rollback por aplicación`                | snapshot certificado, manifest y lockfile, rollback independiente y evidencia                         |
| `01_PAQUETES_RELEASES_Y_COMPATIBILIDAD.md`                        | implementación posterior de actualización de consumidores mediante `SHELL-CI-006`                    |
| `package.json` de `vento-shell`                                  | workspace actual y scripts documentales disponibles                                                  |
| Registro Canónico de Requisitos de Prueba vigente                | cobertura de compatibilidad, rollback, merge, evidencia por PR, identidad y deprecación              |

##### 2.2. Estado técnico actual

La línea base remota permite afirmar:

1. `vento-shell` conserva el workspace de autoría de packages compartidos;
2. no existe una adopción publicada y certificada de las cuatro familias en los siete consumidores;
3. las 28 relaciones permanecen sin evidencia de adopción efectiva;
4. no se confirmó una configuración dedicada de Dependabot o Renovate en `vento-shell`;
5. no se confirmó un actualizador ejecutable que abra pull requests en los siete consumidores;
6. `SHELL-CI-006` existe como tarea de implementación futura y no como capacidad materializada;
7. la tarea actual es documental y no autoriza configurar bots, tokens, aplicaciones GitHub, workflows o reglas de rama;
8. el registro vigente contiene 6.326 requisitos, 39 del dominio `SHELL`, sin duplicados ni relaciones no resolubles.

La ausencia de automatización materializada no reduce el resultado de esta tarea: el contrato de actualización queda definido y la implementación se mantiene en su tarea propietaria.

---

#### 3. Alcance exacto

##### 3.1. Incluido

Esta tarea define:

1. la unidad canónica de actualización;
2. el repositorio y rama destino de cada propuesta;
3. las clases de actualización admitidas;
4. el ciclo de vida del pull request;
5. el contenido mínimo del cambio;
6. la metadata y evidencia obligatorias;
7. las facultades y prohibiciones del automatizador;
8. las responsabilidades de revisión y aprobación;
9. la regla para cambios multi-package;
10. el tratamiento de seguridad, deprecación, cambios `MAJOR` y rollback;
11. la invalidación de aprobaciones y evidencia cuando cambian las entradas;
12. la conciliación de las 28 relaciones package–consumidor;
13. los bloqueos que impiden declarar una propuesta lista;
14. la asignación de implementación a `SHELL-CI-006` y de gates a `SHELL-PKG-008`.

##### 3.2. Excluido

Esta tarea no:

- publica packages, tags o releases;
- crea ni configura un actualizador;
- crea ramas o pull requests reales;
- modifica manifests o lockfiles de consumidores;
- define nombres concretos de checks o reglas de protección;
- fusiona cambios ni autoriza despliegues;
- migra consumidores;
- ejecuta pruebas de compatibilidad;
- implementa los gates contra actualización sin pruebas;
- incorpora PASS, ANIMA, TALENTO o superficies móviles por inferencia;
- ejecuta migraciones, configuración o modificaciones de Supabase;
- cambia la continuidad canónica.

La implementación del actualizador corresponde a `SHELL-CI-006`. Los controles ejecutables que bloquean la actualización sin pruebas corresponden a `SHELL-PKG-008` y a las tareas `SHELL-CI-*` aplicables.

---

#### 4. Principios vinculantes

| ID               | Principio                     | Obligación                                                                                                  |
| ---------------- | ----------------------------- | ------------------------------------------------------------------------------------------------------------ |
| `PR-PRINC-001`   | propuesta, no aplicación      | una versión nueva se propone al consumidor; no se vuelve efectiva por publicación                           |
| `PR-PRINC-002`   | autonomía del consumidor      | cada repositorio decide, valida, fusiona y despliega su actualización                                        |
| `PR-PRINC-003`   | cambio revisable              | toda adopción o retroceso queda representado por un pull request atribuible                                  |
| `PR-PRINC-004`   | manifest y lockfile unidos    | ambos archivos cambian como una sola unidad de versión resuelta                                              |
| `PR-PRINC-005`   | versiones exactas             | no se introducen tags flotantes, rangos abiertos, URLs Git ni resolución implícita                           |
| `PR-PRINC-006`   | identidad inmutable           | la propuesta referencia una release, commit, tarball e integridad verificables                               |
| `PR-PRINC-007`   | evidencia por consumidor      | el resultado de otro repositorio no certifica al consumidor actual                                           |
| `PR-PRINC-008`   | revisión independiente        | el automatizador y el autor del cambio no constituyen por sí solos aprobación suficiente                     |
| `PR-PRINC-009`   | cero auto-merge               | ningún actualizador fusiona la propuesta                                                                     |
| `PR-PRINC-010`   | cero auto-deploy              | ningún actualizador despliega la aplicación                                                                  |
| `PR-PRINC-011`   | rollback preparado            | toda propuesta conserva el snapshot anterior y una ruta restituible                                          |
| `PR-PRINC-012`   | historial preservado          | cierres, reemplazos, rebases, invalidaciones y supersesiones conservan trazabilidad                           |
| `PR-PRINC-013`   | privilegio mínimo             | credenciales del actualizador solo alcanzan repositorios y operaciones necesarias                            |
| `PR-PRINC-014`   | separación de Supabase        | actualizar `@vento/supabase` no autoriza cambios de esquema, datos, funciones, políticas o configuración     |
| `PR-PRINC-015`   | fail closed                   | evidencia ausente, inconsistente o invalidada impide declarar la propuesta lista                             |
| `PR-PRINC-016`   | implementación posterior      | esta definición no demuestra que el flujo esté configurado, protegido o operativo                           |

---

#### 5. Unidad canónica de actualización

La unidad ordinaria es:

```text
un repositorio consumidor
+ una rama base exacta
+ un conjunto cerrado de versiones objetivo
+ un manifest
+ un lockfile
+ un commit de propuesta
+ una ejecución de evidencia
+ un pull request
```

Reglas:

1. cada pull request afecta exactamente un repositorio consumidor;
2. el mismo release puede originar hasta siete propuestas independientes;
3. una propuesta puede actualizar un solo package o el conjunto mínimo cerrado de packages internos requerido por dependencias exactas;
4. una propuesta no obliga a abrir, fusionar o desplegar simultáneamente las de otros consumidores;
5. una propuesta no se considera adoptada al ser abierta, aprobada o fusionada; la adopción exige despliegue identificado y validación aplicable;
6. un pull request general de funcionalidades no absorberá silenciosamente una actualización de package; cualquier combinación deberá declarar el alcance y conservar la misma evidencia;
7. el repositorio productor no modifica el árbol de trabajo del consumidor fuera del pull request;
8. la rama base, el commit de base y el conjunto objetivo forman parte de la identidad de la propuesta.

##### 5.1. Identificador de expediente

Cada propuesta utilizará un identificador estable:

```text
PKG-PR-<CONSUMIDOR>-<SECUENCIA>
```

Códigos permitidos en este alcance:

```text
SHELL
VISO
NEXO
FOGO
ORIGO
PULSO
NUMERA
```

La secuencia no se reutiliza después de cierre, supersesión, reversión o cancelación. El identificador gobierna el expediente de actualización, no sustituye el número remoto del pull request.

---

#### 6. Clases de actualización

| Clase                     | Definición                                                                                 | Exigencia adicional principal                                             |
| ------------------------- | ------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------- |
| `INITIAL_ADOPTION`        | primera incorporación certificada de un package al consumidor                              | paridad contra la implementación anterior y plan de retiro                |
| `PATCH_UPDATE`            | corrección compatible conforme a SemVer                                                    | regresión focal y verificación del defecto corregido                       |
| `MINOR_UPDATE`            | capacidad pública nueva compatible                                                         | escenarios nuevos y ausencia de cambio incompatible                       |
| `MAJOR_UPDATE`            | cambio incompatible o reducción de soporte                                                 | guía de migración, impacto completo y aprobación reforzada                |
| `SECURITY_UPDATE`         | actualización motivada por vulnerabilidad o bypass                                         | evaluación de exposición, prioridad, mitigación y no regresión            |
| `DEPRECATION_MIGRATION`   | migración requerida por superficie o línea de soporte deprecada                            | expediente `DEP-*`, inventario de uso residual y puerta de retiro         |
| `ROLLBACK_UPDATE`         | restauración del snapshot certificado anterior                                             | expediente `RBK-*`, causa, objetivo restituible y validación posterior     |

Una misma propuesta puede tener una clase primaria y calificadores secundarios. La clasificación más exigente gobierna aprobaciones, evidencia y bloqueo.

---

#### 7. Ciclo de vida de la propuesta

##### 7.1. Estados permitidos

| Estado                  | Significado                                                                                                      |
| ----------------------- | ---------------------------------------------------------------------------------------------------------------- |
| `NOT_REQUESTED`         | no existe propuesta para la relación y versión objetivo                                                          |
| `ELIGIBLE`              | release y relación reúnen insumos mínimos para generar una propuesta                                             |
| `PR_OPEN`               | pull request creado con identidad, manifest y lockfile                                                           |
| `VALIDATING`            | comprobaciones y evidencia en ejecución                                                                          |
| `CHANGES_REQUESTED`     | revisión solicita correcciones o aclaraciones                                                                    |
| `BLOCKED`               | existe una condición que impide continuar                                                                        |
| `READY_FOR_REVIEW`      | contenido y evidencia completos para revisión humana                                                             |
| `APPROVED_FOR_MERGE`    | aprobaciones requeridas vigentes y checks obligatorios correctos                                                 |
| `MERGED`                | cambio incorporado a la rama destino del consumidor                                                              |
| `ADOPTION_PENDING`      | merge realizado, despliegue o verificación del ambiente todavía pendiente                                       |
| `ADOPTED`               | versión desplegada y validada en el ambiente autorizado                                                          |
| `CLOSED_NO_CHANGE`      | propuesta cerrada sin modificar la rama destino                                                                  |
| `SUPERSEDED`            | otra propuesta identificada sustituye el objetivo y conserva la relación histórica                               |
| `REVERTED`              | la rama destino volvió mediante historia auditable a un snapshot soportado                                       |

##### 7.2. Transiciones ordinarias

```text
NOT_REQUESTED → ELIGIBLE
ELIGIBLE → PR_OPEN
PR_OPEN → VALIDATING
VALIDATING → READY_FOR_REVIEW
VALIDATING → BLOCKED
READY_FOR_REVIEW → CHANGES_REQUESTED
CHANGES_REQUESTED → VALIDATING
READY_FOR_REVIEW → APPROVED_FOR_MERGE
APPROVED_FOR_MERGE → VALIDATING
APPROVED_FOR_MERGE → MERGED
MERGED → ADOPTION_PENDING
ADOPTION_PENDING → ADOPTED
PR_OPEN → CLOSED_NO_CHANGE
VALIDATING → CLOSED_NO_CHANGE
BLOCKED → VALIDATING
PR_OPEN → SUPERSEDED
VALIDATING → SUPERSEDED
READY_FOR_REVIEW → SUPERSEDED
MERGED → REVERTED
ADOPTION_PENDING → REVERTED
ADOPTED → REVERTED
```

##### 7.3. Invalidación obligatoria

Una propuesta vuelve a `VALIDATING` y pierde aprobaciones técnicas previas cuando cambia cualquiera de estos elementos:

- versión objetivo de un package;
- conjunto cerrado de packages;
- commit de base;
- manifest;
- lockfile;
- integridad del artefacto;
- commit de la propuesta;
- código de compatibilidad agregado al consumidor;
- versiones resueltas de runtime, framework o peers relevantes;
- configuración de build o tipos;
- migración, schema, contrato, catálogo o API consumida;
- escenario, fixture o prueba que define el resultado esperado;
- expediente de deprecación, seguridad o rollback;
- alcance o severidad del cambio.

La aprobación humana de contenido podrá conservarse únicamente cuando la política implementada demuestre que el cambio no afecta lo revisado. Nunca se conservarán silenciosamente checks o evidencia ligados a otro commit.

---

#### 8. Contenido mínimo del cambio

Cada propuesta deberá contener, cuando aplique:

1. versión exacta anterior y objetivo por package;
2. modificación coherente del manifest del consumidor;
3. modificación coherente del lockfile del consumidor;
4. integridad resuelta del artefacto objetivo;
5. ajustes mínimos de compatibilidad estrictamente necesarios;
6. pruebas o fixtures nuevos cuando el comportamiento cambie;
7. retiro de adaptadores temporales solo cuando su puerta propietaria esté satisfecha;
8. documentación del consumidor cuando cambien operación, configuración o soporte;
9. referencias a changelog, release, compatibilidad, deprecación y rollback;
10. declaración de impacto sobre requisitos `TREQ-*`;
11. declaración de impacto sobre datos, Supabase, configuración, caché y despliegue;
12. plan de verificación posterior cuando la adopción no termine en el merge.

Queda prohibido dentro de una propuesta de actualización:

- introducir rangos flotantes para packages VENTO;
- sustituir el registry por URL Git, archivo local o código copiado;
- editar artefactos instalados;
- regenerar el lockfile con cambios no explicados;
- mezclar refactors o funcionalidades ajenas que impidan atribuir el resultado;
- usar aliases, overrides permanentes o casts globales para ocultar incompatibilidades;
- desactivar lint, tipos, pruebas, seguridad o validaciones contractuales para obtener un resultado correcto aparente;
- modificar secretos, datos productivos o configuración remota;
- incluir una migración Supabase fuera de `vento-shell`;
- convertir una prerelease en dependencia productiva estable sin autorización explícita.

---

#### 9. Contrato del expediente de actualización

Cada expediente `PKG-PR-*` conservará como mínimo:

| Campo                       | Obligación                                                                                   |
| --------------------------- | -------------------------------------------------------------------------------------------- |
| `update_id`                 | identificador estable del expediente                                                         |
| `consumer_repository`       | repositorio consumidor exacto                                                                |
| `consumer_owner`            | responsable técnico del consumidor                                                           |
| `target_branch`             | rama destino autorizada                                                                      |
| `base_commit`               | commit exacto usado como base                                                                |
| `proposal_commit`           | commit exacto evaluado                                                                       |
| `remote_pr_ref`             | número o referencia remota del pull request                                                  |
| `update_class`              | clase primaria y calificadores                                                               |
| `trigger`                   | release, seguridad, deprecación, incompatibilidad, rollback u otro disparador aprobado      |
| `package_set_from`          | conjunto exacto instalado antes del cambio                                                   |
| `package_set_to`            | conjunto exacto objetivo                                                                     |
| `release_refs`              | tags, releases, commits e integridad de packages                                              |
| `manifest_before_hash`      | identidad del manifest anterior                                                              |
| `manifest_after_hash`       | identidad del manifest propuesto                                                             |
| `lockfile_before_hash`      | identidad del lockfile anterior                                                              |
| `lockfile_after_hash`       | identidad del lockfile propuesto                                                             |
| `compatibility_ref`         | manifest y resultados de compatibilidad aplicables                                           |
| `changelog_ref`             | cambios relevantes por package                                                               |
| `deprecation_refs`          | expedientes `DEP-*` aplicables o `NONE`                                                       |
| `security_ref`              | advisory, evaluación o `NONE`                                                                 |
| `rollback_ref`              | snapshot certificado y expediente aplicable                                                  |
| `treq_impact`               | requisitos creados, modificados, satisfechos, invalidados o cero cambios                     |
| `supabase_impact`           | `NO_APLICA` con justificación o tarea propietaria desde `vento-shell`                         |
| `data_impact`               | evaluación de datos, compatibilidad y migración                                               |
| `configuration_impact`      | variables, secretos, flags o configuración afectados                                          |
| `cache_impact`              | invalidación, reconstrucción o no aplicabilidad                                               |
| `validation_results`        | resultados por package y consumidor ligados al commit                                        |
| `evidence_refs`             | ejecuciones y artefactos reproducibles                                                        |
| `required_reviewers`        | propietarios y revisores obligatorios                                                         |
| `approvals`                 | aprobaciones vigentes ligadas al commit                                                       |
| `bot_identity`              | identidad automatizada o `MANUAL`                                                             |
| `opened_at`                 | apertura atribuible                                                                          |
| `updated_at`                | última modificación atribuible                                                               |
| `merged_at`                 | momento de merge o `NONE`                                                                     |
| `deployment_ref`            | despliegue de adopción o `PENDING`                                                            |
| `outcome`                   | estado final, impacto residual y seguimiento                                                  |
| `supersedes`                | expediente anterior sustituido o `NONE`                                                       |
| `superseded_by`             | expediente posterior o `NONE`                                                                 |

Una actualización no se considera trazable si manifest, lockfile, commit, evidencia y versión objetivo no corresponden entre sí.

---

#### 10. Facultades del automatizador

##### 10.1. Acciones permitidas

Una identidad automatizada podrá, con alcance mínimo:

1. consultar releases y metadata de packages autorizados;
2. comparar la versión instalada con versiones elegibles;
3. evaluar reglas de canal, SemVer, deprecación y compatibilidad;
4. crear una rama de propuesta desde la base autorizada;
5. actualizar exclusivamente el manifest, lockfile y ajustes permitidos;
6. ejecutar comprobaciones en un ambiente controlado;
7. abrir un pull request con el expediente completo;
8. actualizar la rama cuando cambie la base, invalidando evidencia correspondiente;
9. publicar resultados, bloqueos y referencias de evidencia;
10. cerrar una propuesta obsoleta conservando la causa;
11. abrir una propuesta sucesora con vínculo explícito;
12. etiquetar la clase y prioridad sin conferir aprobación.

##### 10.2. Acciones prohibidas

Una identidad automatizada no podrá:

- fusionar el pull request;
- aprobar su propia propuesta;
- desplegar la aplicación;
- escribir directamente en la rama principal o protegida;
- modificar reglas de protección, revisores requeridos o checks obligatorios;
- publicar packages desde credenciales de lectura del consumidor;
- ampliar el alcance de repositorios o packages sin decisión canónica;
- cambiar el conjunto objetivo después de aprobación sin invalidarla;
- suprimir, reintentar indefinidamente u ocultar un resultado fallido;
- editar archivos ajenos al alcance sin declararlos;
- introducir credenciales en código, manifest, lockfile o comentarios;
- ejecutar cambios de Supabase, datos o ambientes remotos;
- crear datos operativos para pruebas;
- convertir un advisory en autorización para omitir compatibilidad o rollback;
- cerrar una propuesta como adoptada sin evidencia del consumidor.

##### 10.3. Privilegios separados

Las identidades de publicación, lectura de registry, actualización de consumidores, revisión y despliegue serán distintas o demostrarán separación efectiva de permisos. La capacidad de abrir una propuesta no concede capacidad para publicar, aprobar, fusionar o desplegar.

---

#### 11. Autoridad y revisión

| Actor                                      | Responsabilidad                                                                                                  |
| ------------------------------------------ | ---------------------------------------------------------------------------------------------------------------- |
| propietario técnico del package            | confirmar identidad, clasificación, changelog, soporte, riesgos y compatibilidad prometida                      |
| responsable técnico del consumidor         | evaluar integración, ajustes locales, impacto operativo, rollback y adopción                                    |
| responsable de compatibilidad               | confirmar que la combinación pertenece a la matriz evaluada                                                     |
| responsable de release                      | preservar procedencia e integridad del artefacto                                                                |
| responsable de seguridad                    | revisar actualizaciones de seguridad, exposición y mitigaciones cuando aplique                                  |
| propietario de datos o Supabase             | decidir cualquier cambio de schema, datos, funciones, políticas o configuración exclusivamente desde shell     |
| revisor independiente                       | verificar que autor, bot y propietario directo no constituyen la única aprobación                               |
| responsable de despliegue del consumidor    | decidir y ejecutar la adopción en su ambiente bajo el paquete correspondiente                                   |
| automatizador                               | preparar y mantener la propuesta sin aprobarla, fusionarla ni desplegarla                                       |

Reglas:

1. el bot no cuenta como revisor humano;
2. el propietario del package no sustituye al responsable del consumidor;
3. una actualización `MAJOR`, de seguridad, deprecación o con impacto sobre datos exige revisores adicionales aplicables;
4. quien implementa no será el único aprobador de la conformidad;
5. las aprobaciones se ligan al commit evaluado;
6. una excepción no elimina la necesidad de registrar autoridad, riesgo, vencimiento y condición de salida.

---

#### 12. Evidencia y comprobaciones obligatorias

Toda propuesta deberá demostrar, según aplicabilidad:

| Familia de comprobación         | Resultado requerido                                                                                         |
| ------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| identidad                       | package, versión, tag, release, commit e integridad coincidentes                                            |
| instalación                     | manifest y lockfile coherentes e instalación bloqueada reproducible                                         |
| package                         | pruebas, tipos, build y contratos propios del package                                                       |
| consumidor                      | lint, tipos, build, pruebas e integración aplicables                                                        |
| compatibilidad                  | combinación exacta evaluada contra la matriz vigente                                                        |
| autorización y contexto         | denegación cerrada, scopes, razones, sesión, dispositivo y auditoría cuando aplique                         |
| acceso a datos                  | clientes, RPC, RLS, tipos, errores y compatibilidad con schema cuando aplique                               |
| interfaz                        | render, hidratación, navegación, accesibilidad, CSS y comportamiento cuando aplique                        |
| deprecación                     | expediente, guía, uso residual y estado de cada consumidor cuando aplique                                  |
| seguridad                       | exposición, corrección, regresión, bypasses y compatibilidad del fix cuando aplique                         |
| rollback                        | snapshot anterior certificado y procedimiento restituible                                                   |
| requisitos                      | declaración de `TREQ-*` afectados y evidencia correspondiente                                              |
| datos y Supabase                | no aplicabilidad demostrada o tarea propietaria, migración, backup y rollback autorizados                  |
| despliegue                      | identidad del artefacto, ambiente y verificación posterior cuando se materialice la adopción               |

`SHELL-PKG-008` definirá los gates que convierten estas obligaciones en bloqueos ejecutables. `SHELL-CI-006` implementará la creación y mantenimiento de las propuestas.

---

#### 13. Cambios multi-package y orden de actualización

Una propuesta podrá contener varios packages VENTO únicamente cuando formen un conjunto mínimo cerrado por dependencias exactas o por una migración indivisible del consumidor.

Procedimiento vinculante:

```text
identificar package disparador
→ resolver dependencias internas exactas
→ calcular conjunto mínimo cerrado
→ verificar orden de publicación
→ fijar versiones objetivo
→ actualizar manifest y lockfile
→ ejecutar evidencia del conjunto completo
→ revisar como una sola propuesta del consumidor
```

Reglas:

1. no se incrementa un package sin cambio distribuible para crear lockstep artificial;
2. no se incluyen packages no requeridos por comodidad;
3. una release estable no dependerá de una prerelease interna;
4. el conjunto objetivo queda fijo al solicitar revisión;
5. una versión nueva publicada durante la revisión no sustituye silenciosamente el objetivo;
6. una propuesta posterior puede superseder la anterior con un expediente distinto;
7. la compatibilidad se evalúa sobre el conjunto realmente resuelto por el lockfile;
8. el merge de un consumidor no obliga al merge de otro;
9. un fallo en una relación no invalida automáticamente las demás, pero puede bloquear el package cuando la política de compatibilidad lo exija;
10. la adopción escalonada conserva compatibilidad entre consumidores en versiones distintas.

---

#### 14. Casos especiales

##### 14.1. Actualización de seguridad

Una actualización de seguridad:

- no autoriza auto-merge;
- podrá recibir prioridad y ventana abreviada;
- deberá identificar exposición, versiones afectadas, mitigación y riesgo residual;
- deberá conservar compatibilidad o registrar el cambio incompatible;
- no restaurará bypasses ni reducirá controles para acelerar el resultado;
- deberá contar con rollback seguro o una decisión explícita de corrección hacia adelante;
- invalidará evidencia previa cuando cambie el artefacto o el consumidor.

##### 14.2. Cambio `MAJOR`

Un cambio `MAJOR` exige:

- guía de migración;
- inventario de APIs, contratos y comportamientos afectados;
- matriz de compatibilidad objetivo;
- evaluación de datos, eventos, caché, configuración y soporte;
- retiro o coexistencia de adaptadores bajo una tarea propietaria;
- validación de rollback hacia una combinación soportada;
- aprobación reforzada del package y consumidor.

##### 14.3. Deprecación

Una migración por deprecación deberá vincular el expediente `DEP-*`, demostrar uso residual, preservar la ventana y no cerrar la deprecación solo porque el pull request fue abierto o fusionado.

##### 14.4. Rollback

Un rollback se materializa también mediante historia revisable del consumidor, restaurando manifest y lockfile del snapshot certificado. Una respuesta de incidente podrá usar un procedimiento preautorizado, pero conservará expediente, autoridad, evidencia, causa y revisión posterior. Nunca mutará una versión publicada ni editará artefactos instalados.

##### 14.5. `@vento/supabase`

Actualizar el SDK compartido no equivale a aplicar una migración. Toda modificación de schema, datos, funciones, triggers, RLS, Realtime, Storage, Edge Functions, secretos o configuración seguirá su tarea propietaria y se realizará desde `vento-shell`. La propuesta quedará bloqueada cuando no exista compatibilidad demostrada entre package, tipos generados, schema y ambiente objetivo.

---

#### 15. Matriz completa de relaciones package–consumidor

Estado inicial común:

```text
NO_APLICA_SIN_RELEASE_ESTABLE
```

Este estado significa que la relación pertenece al contrato, pero todavía no existe una versión estable publicada y adoptada que permita abrir una actualización ordinaria certificable.

| ID                 | Package             | Consumidor     | Aplicabilidad | Estado inicial                    | Implementación propietaria |
| ------------------ | ------------------- | -------------- | ------------ | --------------------------------- | -------------------------- |
| `PKG-PR-REL-001`   | `@vento/contracts`  | `vento-shell`  | `APLICA`     | `NO_APLICA_SIN_RELEASE_ESTABLE`   | `SHELL-CI-006`             |
| `PKG-PR-REL-002`   | `@vento/contracts`  | `vento-viso`   | `APLICA`     | `NO_APLICA_SIN_RELEASE_ESTABLE`   | `SHELL-CI-006`             |
| `PKG-PR-REL-003`   | `@vento/contracts`  | `vento-nexo`   | `APLICA`     | `NO_APLICA_SIN_RELEASE_ESTABLE`   | `SHELL-CI-006`             |
| `PKG-PR-REL-004`   | `@vento/contracts`  | `vento-fogo`   | `APLICA`     | `NO_APLICA_SIN_RELEASE_ESTABLE`   | `SHELL-CI-006`             |
| `PKG-PR-REL-005`   | `@vento/contracts`  | `vento-origo`  | `APLICA`     | `NO_APLICA_SIN_RELEASE_ESTABLE`   | `SHELL-CI-006`             |
| `PKG-PR-REL-006`   | `@vento/contracts`  | `vento-pulso`  | `APLICA`     | `NO_APLICA_SIN_RELEASE_ESTABLE`   | `SHELL-CI-006`             |
| `PKG-PR-REL-007`   | `@vento/contracts`  | `vento-numera` | `APLICA`     | `NO_APLICA_SIN_RELEASE_ESTABLE`   | `SHELL-CI-006`             |
| `PKG-PR-REL-008`   | `@vento/os-context` | `vento-shell`  | `APLICA`     | `NO_APLICA_SIN_RELEASE_ESTABLE`   | `SHELL-CI-006`             |
| `PKG-PR-REL-009`   | `@vento/os-context` | `vento-viso`   | `APLICA`     | `NO_APLICA_SIN_RELEASE_ESTABLE`   | `SHELL-CI-006`             |
| `PKG-PR-REL-010`   | `@vento/os-context` | `vento-nexo`   | `APLICA`     | `NO_APLICA_SIN_RELEASE_ESTABLE`   | `SHELL-CI-006`             |
| `PKG-PR-REL-011`   | `@vento/os-context` | `vento-fogo`   | `APLICA`     | `NO_APLICA_SIN_RELEASE_ESTABLE`   | `SHELL-CI-006`             |
| `PKG-PR-REL-012`   | `@vento/os-context` | `vento-origo`  | `APLICA`     | `NO_APLICA_SIN_RELEASE_ESTABLE`   | `SHELL-CI-006`             |
| `PKG-PR-REL-013`   | `@vento/os-context` | `vento-pulso`  | `APLICA`     | `NO_APLICA_SIN_RELEASE_ESTABLE`   | `SHELL-CI-006`             |
| `PKG-PR-REL-014`   | `@vento/os-context` | `vento-numera` | `APLICA`     | `NO_APLICA_SIN_RELEASE_ESTABLE`   | `SHELL-CI-006`             |
| `PKG-PR-REL-015`   | `@vento/supabase`   | `vento-shell`  | `APLICA`     | `NO_APLICA_SIN_RELEASE_ESTABLE`   | `SHELL-CI-006`             |
| `PKG-PR-REL-016`   | `@vento/supabase`   | `vento-viso`   | `APLICA`     | `NO_APLICA_SIN_RELEASE_ESTABLE`   | `SHELL-CI-006`             |
| `PKG-PR-REL-017`   | `@vento/supabase`   | `vento-nexo`   | `APLICA`     | `NO_APLICA_SIN_RELEASE_ESTABLE`   | `SHELL-CI-006`             |
| `PKG-PR-REL-018`   | `@vento/supabase`   | `vento-fogo`   | `APLICA`     | `NO_APLICA_SIN_RELEASE_ESTABLE`   | `SHELL-CI-006`             |
| `PKG-PR-REL-019`   | `@vento/supabase`   | `vento-origo`  | `APLICA`     | `NO_APLICA_SIN_RELEASE_ESTABLE`   | `SHELL-CI-006`             |
| `PKG-PR-REL-020`   | `@vento/supabase`   | `vento-pulso`  | `APLICA`     | `NO_APLICA_SIN_RELEASE_ESTABLE`   | `SHELL-CI-006`             |
| `PKG-PR-REL-021`   | `@vento/supabase`   | `vento-numera` | `APLICA`     | `NO_APLICA_SIN_RELEASE_ESTABLE`   | `SHELL-CI-006`             |
| `PKG-PR-REL-022`   | `@vento/ui-web`     | `vento-shell`  | `APLICA`     | `NO_APLICA_SIN_RELEASE_ESTABLE`   | `SHELL-CI-006`             |
| `PKG-PR-REL-023`   | `@vento/ui-web`     | `vento-viso`   | `APLICA`     | `NO_APLICA_SIN_RELEASE_ESTABLE`   | `SHELL-CI-006`             |
| `PKG-PR-REL-024`   | `@vento/ui-web`     | `vento-nexo`   | `APLICA`     | `NO_APLICA_SIN_RELEASE_ESTABLE`   | `SHELL-CI-006`             |
| `PKG-PR-REL-025`   | `@vento/ui-web`     | `vento-fogo`   | `APLICA`     | `NO_APLICA_SIN_RELEASE_ESTABLE`   | `SHELL-CI-006`             |
| `PKG-PR-REL-026`   | `@vento/ui-web`     | `vento-origo`  | `APLICA`     | `NO_APLICA_SIN_RELEASE_ESTABLE`   | `SHELL-CI-006`             |
| `PKG-PR-REL-027`   | `@vento/ui-web`     | `vento-pulso`  | `APLICA`     | `NO_APLICA_SIN_RELEASE_ESTABLE`   | `SHELL-CI-006`             |
| `PKG-PR-REL-028`   | `@vento/ui-web`     | `vento-numera` | `APLICA`     | `NO_APLICA_SIN_RELEASE_ESTABLE`   | `SHELL-CI-006`             |

**Conciliación:** 4 packages × 7 consumidores = 28 relaciones; 28 identificadores únicos; 28 aplicables; 28 sin release estable adoptada; 0 omitidas; 0 duplicadas.

PASS, ANIMA, TALENTO y clientes móviles permanecen fuera de esta matriz. Su incorporación exige una tarea propietaria y un contrato específico de distribución, compatibilidad, actualización y rollback.

---

#### 16. Bloqueos de una propuesta

| ID             | Bloqueo                                                                                   | Estado      | Propietario de resolución                                              |
| -------------- | ----------------------------------------------------------------------------------------- | ----------- | ---------------------------------------------------------------------- |
| `PR-BLK-001`   | package o versión objetivo no existe como release canónica                                | `BLOCKED`   | `SHELL-CI-003`; propietario del package                                |
| `PR-BLK-002`   | tag, release, commit, tarball o integridad no coinciden                                    | `BLOCKED`   | `SHELL-CI-003`; responsable de release                                 |
| `PR-BLK-003`   | manifest y lockfile no cambian como unidad coherente                                      | `BLOCKED`   | repositorio consumidor                                                 |
| `PR-BLK-004`   | la propuesta introduce rango flotante, tag, URL Git o fuente local                        | `BLOCKED`   | automatizador; responsable del consumidor                              |
| `PR-BLK-005`   | falta combinación de compatibilidad para el consumidor y conjunto objetivo               | `BLOCKED`   | `SHELL-CI-005`; responsables de compatibilidad                         |
| `PR-BLK-006`   | una comprobación obligatoria falla o carece de evidencia                                  | `BLOCKED`   | package, consumidor o tarea de prueba propietaria                      |
| `PR-BLK-007`   | commit de base, propuesta o lockfile cambió después de la evidencia                       | `BLOCKED`   | automatizador; nueva ejecución                                         |
| `PR-BLK-008`   | cambio `MAJOR` carece de guía, migración o aprobación reforzada                           | `BLOCKED`   | propietario del package y consumidor                                   |
| `PR-BLK-009`   | deprecación carece de expediente, inventario o uso residual resuelto                      | `BLOCKED`   | `SHELL-PKG-005`; `SHELL-CI-004..006`                                   |
| `PR-BLK-010`   | actualización de seguridad restaura un bypass o deja exposición sin tratamiento           | `BLOCKED`   | seguridad y propietario del package                                    |
| `PR-BLK-011`   | impacto de datos o Supabase carece de tarea y rollback propietarios                       | `BLOCKED`   | tareas de arquitectura y transición desde `vento-shell`                |
| `PR-BLK-012`   | no existe snapshot anterior certificado                                                   | `BLOCKED`   | `SHELL-PKG-006`; `SHELL-CI-014`                                        |
| `PR-BLK-013`   | faltan revisores o aprobaciones aplicables                                                 | `BLOCKED`   | responsables del package y consumidor                                  |
| `PR-BLK-014`   | la identidad automatizada excede permisos o intenta fusionar, desplegar o alterar gates    | `BLOCKED`   | gobierno de CI y seguridad                                              |
| `PR-BLK-015`   | la propuesta contiene cambios ajenos que impiden atribuir compatibilidad y riesgo          | `BLOCKED`   | responsable del consumidor                                             |
| `PR-BLK-016`   | el conjunto multi-package no es mínimo, cerrado o resoluble                               | `BLOCKED`   | propietario de releases y compatibilidad                               |
| `PR-BLK-017`   | la versión objetivo fue sustituida silenciosamente después de revisión                    | `BLOCKED`   | cerrar o superseder con expediente nuevo                               |
| `PR-BLK-018`   | la adopción requeriría despliegue simultáneo no probado de varios consumidores             | `BLOCKED`   | `SHELL-CI-015`; paquetes E5 afectados                                  |

Un bloqueo conservará causa, evidencia, propietario, tarea responsable y condición de salida. No se convertirá en éxito por reintento, comentario, etiqueta o aprobación manual sin resolver la condición material.

---

#### 17. Registro de decisiones vinculantes

| ID             | Decisión                                                                                     | Estado                 | Materialización posterior                         |
| -------------- | -------------------------------------------------------------------------------------------- | ---------------------- | ------------------------------------------------- |
| `PKG-PR-001`   | usar pull request como vehículo canónico de actualización                                    | `DECIDIDO`             | `SHELL-CI-006`                                    |
| `PKG-PR-002`   | crear la propuesta en el repositorio consumidor                                              | `DECIDIDO`             | actualizador de consumidores                      |
| `PKG-PR-003`   | limitar cada propuesta a un consumidor                                                       | `DECIDIDO`             | ramas y expedientes por repositorio               |
| `PKG-PR-004`   | permitir adopción independiente por consumidor                                               | `DECIDIDO`             | pipeline y despliegue consumidor                  |
| `PKG-PR-005`   | conservar cuatro familias de packages                                                       | `DECIDIDO`             | matriz y actualizador                             |
| `PKG-PR-006`   | conservar siete consumidores web                                                            | `DECIDIDO`             | matriz y actualizador                             |
| `PKG-PR-007`   | materializar 28 relaciones                                                                  | `DECIDIDO`             | `SHELL-CI-006`                                    |
| `PKG-PR-008`   | usar versión exacta en cada propuesta                                                       | `DECIDIDO`             | manifest consumidor                              |
| `PKG-PR-009`   | cambiar manifest y lockfile como unidad                                                     | `DECIDIDO`             | rama de propuesta                                |
| `PKG-PR-010`   | prohibir actualización directa desde publicación                                           | `DECIDIDO`             | permisos y workflows                             |
| `PKG-PR-011`   | permitir al bot abrir y mantener propuestas                                                | `DECIDIDO`             | identidad de actualización                       |
| `PKG-PR-012`   | prohibir auto-merge                                                                        | `DECIDIDO`             | `SHELL-PKG-008`; reglas de rama                  |
| `PKG-PR-013`   | prohibir auto-deploy                                                                       | `DECIDIDO`             | pipelines consumidores                           |
| `PKG-PR-014`   | prohibir push directo a ramas protegidas                                                   | `DECIDIDO`             | `SHELL-PKG-008`; reglas de rama                  |
| `PKG-PR-015`   | separar identidad de actualización, aprobación y despliegue                                | `DECIDIDO`             | secretos y permisos de CI                         |
| `PKG-PR-016`   | ligar evidencia al commit de propuesta                                                     | `DECIDIDO`             | checks y artefactos                               |
| `PKG-PR-017`   | invalidar evidencia cuando cambian entradas                                                | `DECIDIDO`             | gates de actualización                            |
| `PKG-PR-018`   | invalidar aprobación técnica cuando cambia el commit                                       | `DECIDIDO`             | protección de rama                               |
| `PKG-PR-019`   | preservar historial de cierres y supersesiones                                             | `DECIDIDO`             | expediente `PKG-PR-*`                            |
| `PKG-PR-020`   | no sustituir silenciosamente una versión objetivo                                          | `DECIDIDO`             | expediente y nueva propuesta                      |
| `PKG-PR-021`   | permitir conjunto mínimo cerrado multi-package                                             | `DECIDIDO`             | resolución del grafo                              |
| `PKG-PR-022`   | prohibir lockstep artificial                                                               | `DECIDIDO`             | releases independientes                           |
| `PKG-PR-023`   | clasificar siete tipos de actualización                                                    | `DECIDIDO`             | metadata y aprobaciones                           |
| `PKG-PR-024`   | exigir revisión reforzada para `MAJOR`                                                     | `DECIDIDO`             | responsables aplicables                           |
| `PKG-PR-025`   | exigir evaluación específica de seguridad                                                 | `DECIDIDO`             | seguridad y CI                                    |
| `PKG-PR-026`   | vincular migraciones de deprecación con `DEP-*`                                            | `DECIDIDO`             | `SHELL-PKG-005`; `SHELL-CI-006`                   |
| `PKG-PR-027`   | materializar rollback mediante historia revisable                                         | `DECIDIDO`             | `SHELL-PKG-006`; `SHELL-CI-014`                   |
| `PKG-PR-028`   | separar actualización de `@vento/supabase` y migración de base de datos                    | `DECIDIDO`             | tareas Supabase desde `vento-shell`                |
| `PKG-PR-029`   | exigir declaración de impacto `TREQ-*`                                                    | `DECIDIDO`             | expediente y CI                                   |
| `PKG-PR-030`   | exigir declaración de datos, configuración y caché                                        | `DECIDIDO`             | expediente y paquetes E5                          |
| `PKG-PR-031`   | bloquear propuestas con cambios no atribuibles                                            | `DECIDIDO`             | revisión del consumidor                           |
| `PKG-PR-032`   | excluir móviles hasta contrato propietario                                                 | `DECIDIDO`             | tareas futuras aplicables                         |
| `PKG-PR-033`   | asignar implementación del actualizador a `SHELL-CI-006`                                   | `DECIDIDO`             | BLOQUE T                                          |
| `PKG-PR-034`   | asignar gates contra actualización sin pruebas a `SHELL-PKG-008`                           | `DECIDIDO`             | tarea siguiente reservada                         |
| `PKG-PR-035`   | no implementar ni operar actualizaciones en esta fase                                      | `RESTRICCION_CANONICA` | fase documental                                   |
| `PKG-PR-036`   | no modificar código, packages, consumidores, CI, datos, Supabase ni continuidad            | `RESTRICCION_CANONICA` | implementación posterior autorizada               |

**Conciliación:** 36 decisiones, 36 identificadores únicos, 0 faltantes y 0 duplicados.

---

#### 18. Hallazgos y destinos exactos

| ID                    | Hallazgo                                                                                     | Estado                         | Destino o condición de salida                                           |
| --------------------- | -------------------------------------------------------------------------------------------- | ------------------------------ | ----------------------------------------------------------------------- |
| `H-SHELL-PKG-007-001` | no existe una release estable compartida adoptada que origine una actualización ordinaria    | `NO_APLICA_SIN_ADOPCION`       | publicación y adopción controladas en `SHELL-CI-*` y `SHELL-MIG-*`      |
| `H-SHELL-PKG-007-002` | las 28 relaciones siguen sin evidencia de versión instalada                                  | `PENDIENTE_DE_IMPLEMENTACION`  | `SHELL-CI-005`; `SHELL-CI-006`                                         |
| `H-SHELL-PKG-007-003` | no se confirmó configuración dedicada de Dependabot en `vento-shell`                         | `NO_IMPLEMENTADO_CONFIRMADO`   | `SHELL-CI-006`                                                          |
| `H-SHELL-PKG-007-004` | no se confirmó configuración dedicada de Renovate en `vento-shell`                           | `NO_IMPLEMENTADO_CONFIRMADO`   | `SHELL-CI-006`                                                          |
| `H-SHELL-PKG-007-005` | no se confirmó un actualizador ejecutable para los siete consumidores                        | `PENDIENTE_DE_IMPLEMENTACION`  | `SHELL-CI-006`                                                          |
| `H-SHELL-PKG-007-006` | la publicación directa sobre consumidores ya está prohibida por decisiones anteriores        | `COBERTURA_CANONICA_EXISTENTE` | conservar en permisos, workflow y gates                                |
| `H-SHELL-PKG-007-007` | manifest y lockfile unidos ya son invariantes de compatibilidad y rollback                    | `COBERTURA_CANONICA_EXISTENTE` | materializar en cada propuesta                                          |
| `H-SHELL-PKG-007-008` | la evidencia por package y PR ya está exigida por el registro de pruebas                     | `COBERTURA_CANONICA_EXISTENTE` | materializar en CI                                                      |
| `H-SHELL-PKG-007-009` | no existe evidencia de auto-merge o auto-deploy autorizado                                   | `PROHIBIDO_POR_CONTRATO`       | `SHELL-PKG-008`; gobierno de CI                                         |
| `H-SHELL-PKG-007-010` | `@vento/supabase` requiere separación explícita entre SDK y base de datos                     | `DECISION_CRITICA`             | tareas `SHELL-DB-*`, Supabase y paquetes E5                             |
| `H-SHELL-PKG-007-011` | los nombres y mecanismos concretos de checks pertenecen a implementación                     | `RESERVADO`                    | `SHELL-PKG-008`; `SHELL-CI-001`; `SHELL-CI-005`; `SHELL-CI-006`        |
| `H-SHELL-PKG-007-012` | la tarea actual no autoriza escritura remota ni avance de continuidad                         | `RESTRICCION_CANONICA`         | conservar hasta aprobación e incorporación canónica                    |

**Conciliación:** 12 hallazgos, 12 destinos o condiciones de salida y 0 pendientes narrativos sin propietario.

---

#### 19. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la obligación material ya está protegida por requisitos vigentes. `TREQ-SHELL-005` exige comandos reproducibles y bloqueos de merge o despliegue según criticidad; `TREQ-SHELL-006` exige pruebas propias y matriz de compatibilidad antes de publicar o adoptar, con adopción independiente por repositorio; `TREQ-SHELL-007` exige rollback independiente y probado; `TREQ-SHELL-008` exige que cada package y pull request declare los `TREQ-*` afectados y publique resultados reproducibles; `TREQ-SHELL-009` exige identidad verificable de repositorio, commit y ambiente; `TREQ-SHELL-036` y `TREQ-SHELL-037` protegen identidad de release y cortes coordinados; `TREQ-SHELL-038` y `TREQ-SHELL-039` protegen migración, retiro y rollback de consumidores. Esta tarea especializa el vehículo documental y la autoridad del actualizador sin introducir una obligación de prueba independiente. La implementación ejecutable queda en `SHELL-CI-006` y los gates anti-bypass en `SHELL-PKG-008`.

| Operación sobre `TREQ-*` | Cantidad |
| ------------------------ | -------: |
| creados                  |    **0** |
| modificados              |    **0** |
| diferidos                |    **0** |
| descartados              |    **0** |
| obsoletos                |    **0** |

No corresponde producir una nueva copia del registro canónico de requisitos de prueba.

---

#### 20. Entregables

1. Regla canónica de actualización mediante pull request.
2. Unidad de actualización por consumidor, commit, manifest, lockfile y conjunto objetivo.
3. Formato estable de expediente `PKG-PR-*`.
4. Siete clases de actualización.
5. Ciclo de vida de catorce estados y transiciones permitidas.
6. Reglas de invalidación de evidencia y aprobaciones.
7. Contenido mínimo y prohibiciones de cada propuesta.
8. Contrato de 38 campos para el expediente de actualización.
9. Facultades y prohibiciones del automatizador.
10. Separación de identidades de publicación, actualización, aprobación y despliegue.
11. Responsabilidades de package, consumidor, compatibilidad, seguridad, datos y release.
12. Matriz de evidencia y comprobaciones aplicables.
13. Política para conjuntos multi-package.
14. Tratamiento de seguridad, cambios `MAJOR`, deprecación, rollback y `@vento/supabase`.
15. Matriz completa de 28 relaciones package–consumidor.
16. Dieciocho bloqueos con propietario.
17. Treinta y seis decisiones vinculantes.
18. Doce hallazgos con destino exacto.
19. Declaración de cero cambios `TREQ-*` con cobertura vigente explícita.

---

#### 21. Criterios de aceptación

`SHELL-PKG-007` queda materialmente completa porque:

- define el pull request como vehículo obligatorio de toda adopción o rollback de package;
- mantiene la publicación separada de la actualización del consumidor;
- conserva exactamente cuatro packages y siete consumidores;
- materializa exactamente 28 relaciones sin faltantes ni duplicados;
- define un repositorio consumidor por propuesta;
- permite conjuntos multi-package únicamente cuando forman un cierre mínimo de dependencias;
- exige versiones exactas, manifest, lockfile, commit e integridad coherentes;
- define siete clases de actualización;
- define catorce estados y transiciones explícitas;
- impide declarar adopción por apertura, aprobación o merge únicamente;
- invalida evidencia cuando cambian las entradas;
- define el expediente completo de actualización;
- limita al automatizador a preparar y mantener propuestas;
- prohíbe auto-merge, auto-deploy y push directo a ramas protegidas;
- separa publicación, actualización, revisión y despliegue;
- exige revisión reforzada para seguridad, cambios `MAJOR`, deprecación y datos;
- conserva rollback por historia auditable del consumidor;
- separa `@vento/supabase` de cualquier cambio de base de datos;
- asigna implementación a `SHELL-CI-006` y gates a `SHELL-PKG-008`;
- mantiene PASS, ANIMA, TALENTO y móviles fuera de alcance;
- declara cero cambios `TREQ-*` por cobertura vigente suficiente;
- no modifica código, packages, consumidores, CI, datos, Supabase o continuidad.

---

#### 22. Continuidad canónica del bloque

- **ÚLTIMA TAREA APROBADA:** SHELL-PKG-006 — Definir rollback por aplicación
- **TAREA ACTUAL APROBADA:** SHELL-PKG-007 — Definir actualizaciones mediante PR
- **SIGUIENTE TAREA RESERVADA:** SHELL-PKG-008 — Evitar actualizaciones automáticas sin pruebas


### [ ] SHELL-PKG-008 — Evitar actualizaciones automáticas sin pruebas
Paquetes candidatos
