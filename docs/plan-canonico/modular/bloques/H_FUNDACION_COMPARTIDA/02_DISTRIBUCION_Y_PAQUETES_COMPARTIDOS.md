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

- **Estado:** APROBADA
- **Fecha:** 2026-08-01
- **Tarea anterior:** SHELL-PKG-002 — Definir versionado de paquetes compartidos
- **Tarea siguiente:** SHELL-PKG-004 — Definir política de compatibilidad
- **Tipo de tarea:** Documental
- **Objetivo:** Establecer la identidad inmutable, la nomenclatura, el ciclo de vida y el contenido mínimo de los tags Git y de los releases asociados a las cuatro familias de paquetes compartidos, heredando sin alterar el versionado SemVer independiente ya aprobado.

#### Decisiones o definiciones

1. **Relación canónica entre paquete, versión, tag y release**
   - Cada versión publicada de una familia de paquete tendrá exactamente un tag Git canónico y exactamente un release asociado.
   - La relación será `una familia + una versión = un tag = un release`.
   - No existirá un tag global que represente simultáneamente la versión de todas las familias.
   - Un corte coordinado podrá publicar varias familias desde el mismo commit de origen, pero cada familia conservará su versión, tag y release independientes.
   - Una familia sin cambios en un corte coordinado conservará su versión vigente y no recibirá un tag ni un release nuevos.

2. **Naturaleza de los artefactos**
   - Un **tag** será una referencia Git anotada, única e inmutable que identifica la versión exacta de una sola familia de paquete.
   - Un **release** será el registro publicable asociado de manera unívoca al tag canónico y contendrá la evidencia y las notas de esa versión.
   - Un borrador de release no constituirá una publicación ni otorgará identidad canónica a una versión.
   - Los alias mutables de distribución de registros de paquetes, incluidos `latest`, `next` o equivalentes, no serán tags Git y quedan fuera del alcance de esta tarea.

3. **Patrones canónicos de tags y títulos de release**

| Familia de paquete    | Patrón de tag estable    | Ejemplo de tag prerelease    | Patrón de título de release    |
| --------------------- | ------------------------ | ---------------------------- | ------------------------------ |
| `@vento/os-context`   | `os-context-v{SEMVER}`   | `os-context-v0.2.0-rc.1`     | `@vento/os-context {SEMVER}`   |
| `@vento/os-telemetry` | `os-telemetry-v{SEMVER}` | `os-telemetry-v0.2.0-beta.1` | `@vento/os-telemetry {SEMVER}` |
| `@vento/os-flags`     | `os-flags-v{SEMVER}`     | `os-flags-v0.2.0-alpha.1`    | `@vento/os-flags {SEMVER}`     |
| `@vento/os-errors`    | `os-errors-v{SEMVER}`    | `os-errors-v0.2.0-rc.1`      | `@vento/os-errors {SEMVER}`    |

   - `{SEMVER}` será la versión exacta aprobada para la familia, sin prefijos adicionales dentro del número de versión.
   - Un ejemplo estable válido será `os-context-v0.1.0`, con título `@vento/os-context 0.1.0`.
   - Los sufijos `alpha.N`, `beta.N` y `rc.N` conservarán íntegramente la semántica, la secuencia y las restricciones aprobadas por el versionado de paquetes compartidos.
   - Mayúsculas, espacios, barras, nombres abreviados alternativos y omisión del prefijo `v` no serán variantes válidas del tag canónico.

4. **Identidad e inmutabilidad del tag**
   - El tag deberá apuntar al commit de origen cuyo manifiesto de paquete declare la misma familia, la misma versión y las dependencias internas exactas documentadas para el corte.
   - Un nombre de tag no podrá reutilizarse para otro commit, otra familia ni otro contenido.
   - Un tag publicado no podrá moverse, recrearse ni corregirse sobre la misma versión.
   - Toda corrección posterior exigirá una nueva versión SemVer, un nuevo tag y un nuevo release.
   - La eliminación de un tag o release publicado no será un mecanismo ordinario de corrección.

5. **Cortes coordinados de varias familias**
   - Varias familias modificadas podrán compartir el mismo commit de origen y la misma fecha de publicación.
   - Cada release del corte deberá declarar los tags compañeros publicados desde ese mismo commit.
   - Las dependencias entre familias publicadas en el mismo corte deberán registrar las versiones finales exactas que fueron materializadas.
   - La ausencia de cambios en una familia impedirá crear una versión artificial solo para igualar números con otras familias.
   - El orden de publicación deberá respetar el grafo de dependencias internas y no permitirá que un release estable dependa de una prerelease.

6. **Canales y estado del release**
   - Un tag con sufijo `-alpha.N`, `-beta.N` o `-rc.N` tendrá un release marcado como prerelease.
   - Un tag sin sufijo de prerelease tendrá un release estable y no podrá marcarse como prerelease.
   - El ciclo documental del release será:
     - `BORRADOR`: preparación no publicada; no constituye evidencia de liberación.
     - `PRERELEASE_PUBLICADA`: tag inmutable y release público con sufijo y marca de prerelease coherentes.
     - `ESTABLE_PUBLICADA`: tag inmutable y release público sin sufijo, autorizado por evidencia completa.
     - `SUPERADA`: existe una versión posterior; el tag y el release anteriores permanecen inmutables y consultables, sin implicar por sí mismo una decisión de compatibilidad.
   - Ningún estado posterior podrá degradar una versión estable publicada a prerelease ni alterar su identidad.

7. **Contenido mínimo obligatorio del release**
   - Familia de paquete.
   - Versión SemVer exacta.
   - Tag canónico exacto.
   - Commit de origen.
   - Canal y estado del release.
   - Resumen del propósito del cambio.
   - Cambios clasificados, cuando apliquen, en `Added`, `Changed`, `Deprecated`, `Removed`, `Fixed` y `Security`.
   - Impacto sobre contratos públicos y tipos exportados.
   - Dependencias internas con sus versiones finales y rangos declarados.
   - Tags compañeros del mismo corte coordinado o `NO_APLICA`.
   - Impacto y acciones requeridas para consumidores o `NO_APLICA`.
   - Matriz de evidencia obligatoria con resultado y referencia verificable.
   - Riesgos y limitaciones conocidos o `NO_APLICA`.
   - Estrategia de recuperación basada en volver a una versión compatible anterior o publicar una versión correctiva, sin mutar el tag.
   - Conformidad del responsable del release y del responsable de cada repositorio consumidor afectado.

8. **Condiciones previas a la publicación**
   - La versión del manifiesto, el nombre de la familia, el tag previsto y el título del release deberán ser coherentes entre sí.
   - Las dependencias internas deberán resolver a versiones existentes o a versiones del mismo corte coordinado.
   - La evidencia exigida para contratos, compilación, tipos, pruebas, integración y artefactos deberá estar completa y trazable según el canal.
   - Un release estable permanecerá bloqueado mientras falte evidencia obligatoria o conformidad de un consumidor afectado.
   - La publicación de un tag será el punto de no retorno para su identidad; cualquier defecto detectado después se resolverá mediante una nueva versión.

9. **Reglas de consistencia y unicidad**
   - Las cuatro familias tendrán exactamente un patrón de tag estable y un patrón de título de release.
   - Un tag identificará una sola familia y una sola versión.
   - Un release identificará un solo tag.
   - El tag, el título y el manifiesto deberán expresar la misma versión, incluida la cadena completa de prerelease cuando exista.
   - Los tags compañeros de un corte coordinado podrán compartir commit, pero no nombre ni identidad de paquete.

10. **Requisitos de prueba**
    - **Requisitos de prueba:** cero cambios TREQ.
    - Esta tarea especializa la identidad y la evidencia de publicación ya gobernadas por `TREQ-SHELL-006`, `TREQ-SHELL-007`, `TREQ-SHELL-008` y `TREQ-SHELL-009`, sin crear un comportamiento verificable nuevo, modificar sus criterios ni retirar requisitos existentes.

#### Alcance

**Incluye:**
- nomenclatura exacta de tags para las cuatro familias canónicas;
- correspondencia unívoca entre versión, tag y release;
- tratamiento de prereleases y releases estables;
- reglas de inmutabilidad, unicidad y corrección;
- coordinación de releases de varias familias desde un mismo commit;
- ciclo documental del release;
- contenido mínimo y evidencia requerida en las notas de release.

**No incluye:**
- creación física de tags o releases;
- automatización de publicación;
- workflows de integración o despliegue;
- publicación en registros de paquetes;
- definición de alias mutables de distribución;
- separación física de los paquetes aún transitorios;
- definición de compatibilidad entre versiones y consumidores.

#### Dependencias o entradas

- Versionado SemVer independiente aprobado para las cuatro familias de paquetes compartidos.
- Inventario canónico de `@vento/os-context`, `@vento/os-telemetry`, `@vento/os-flags` y `@vento/os-errors`.
- Reglas aprobadas para prereleases, rangos internos, cortes coordinados y evidencia previa a una versión estable.
- Estado técnico actual, en el que la convención se define documentalmente sin materializar publicaciones.

#### Entregables

- Convención canónica de nombres de tags por familia.
- Convención canónica de títulos de release.
- Matriz completa de cuatro familias, sin faltantes ni duplicados.
- Reglas de inmutabilidad, unicidad y correspondencia con el commit de origen.
- Ciclo documental de releases estables y prereleases.
- Contenido mínimo obligatorio de notas, evidencia y conformidades.
- Reglas para cortes coordinados sin forzar versiones globales.

#### Criterios de aceptación

- Las cuatro familias canónicas están materializadas en la matriz y cada una tiene un único patrón de tag y de título.
- Los patrones preservan el versionado SemVer independiente y admiten `alpha`, `beta` y `rc` sin reinterpretarlos.
- No se introduce una versión global del repositorio para sustituir las versiones por familia.
- La relación entre familia, versión, tag, release y commit de origen es explícita y no ambigua.
- Los releases coordinados permiten compartir commit sin asignar versiones artificiales a familias sin cambios.
- Los tags publicados son inmutables y las correcciones exigen una nueva versión.
- El contenido mínimo del release permite reconstruir cambios, dependencias, evidencia, riesgos y conformidades.
- El alcance permanece documental y no crea artefactos físicos de publicación.
- Se declaran cero cambios TREQ con justificación explícita.

#### Consecuencias

- Cada familia podrá evolucionar y publicarse con trazabilidad propia.
- Un mismo corte coordinado podrá reconstruirse mediante sus tags compañeros y el commit compartido.
- Las notas de release funcionarán como evidencia de la versión publicada, no como sustituto de las pruebas ni de sus resultados verificables.
- Los consumidores podrán identificar de forma inequívoca la familia y la versión asociadas a cada release.

#### Riesgos y controles

- **Riesgo:** crear tags globales o ambiguos. **Control:** prefijo obligatorio por familia y relación unívoca con la versión.
- **Riesgo:** mover un tag para ocultar una corrección. **Control:** inmutabilidad y nueva versión obligatoria.
- **Riesgo:** desalinear manifiesto, tag y release. **Control:** comprobación de identidad exacta antes de publicar.
- **Riesgo:** omitir familias en un corte coordinado o versionar familias sin cambios. **Control:** declaración de tags compañeros y publicación exclusiva de familias modificadas.
- **Riesgo:** publicar una versión estable sin evidencia completa. **Control:** bloqueo documental hasta completar evidencia y conformidades.

#### Validación normativa

- Recuento esperado de familias: `4`.
- Recuento materializado de familias: `4`.
- Faltantes: `0`.
- Duplicados de identidad: `0`.
- Cada patrón de tag incluye la identidad de la familia, el prefijo `v` y la versión SemVer completa.
- Cada ejemplo de prerelease conserva uno de los canales aprobados y su ordinal.
- Ninguna regla autoriza a modificar un tag publicado ni a crear versiones globales artificiales.
- Ninguna decisión materializa tags, releases, workflows o publicaciones durante la fase documental.

#### Continuidad canónica del bloque

- **ÚLTIMA TAREA APROBADA:** SHELL-PKG-002 — Definir versionado de paquetes compartidos
- **TAREA ACTUAL APROBADA:** SHELL-PKG-003 — Definir tags y releases
- **SIGUIENTE TAREA RESERVADA:** SHELL-PKG-004 — Definir política de compatibilidad


### ✅ SHELL-PKG-004 — Definir política de compatibilidad

- **Estado:** APROBADA
- **Fecha:** 2026-08-01
- **Tarea anterior:** SHELL-PKG-003 — Definir tags y releases
- **Tarea siguiente:** SHELL-PKG-005 — Definir política de deprecación
- **Tipo de tarea:** Documental
- **Fase:** Definición documental vinculante; implementación física no autorizada
- **Ubicación canónica:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/02_DISTRIBUCION_Y_PAQUETES_COMPARTIDOS.md`
- **Rama prevista:** `main`

---

#### 1. Objetivo

Establecer la política canónica que determina cuándo una versión exacta de un paquete compartido VENTO puede declararse compatible con un repositorio consumidor, un lockfile, una versión efectiva de Next.js, React, React DOM, Supabase SSR y Supabase JavaScript, sin confundir una declaración de dependencias, un build aislado o una coincidencia de versiones con compatibilidad certificada.

La política materializa:

1. las dimensiones obligatorias de compatibilidad;
2. las bandas documentales elegibles del corte actual;
3. la matriz completa de cuatro familias de paquetes por siete repositorios cubiertos;
4. los estados permitidos de cada combinación;
5. la evidencia mínima para certificar una combinación;
6. las condiciones que invalidan o exigen recertificar una compatibilidad;
7. los límites entre esta tarea y deprecación, rollback, actualización mediante PR y gates automáticos.

#### 2. Alcance

##### 2.1. Incluido

Esta tarea gobierna las cuatro familias iniciales aprobadas:

1. `@vento/contracts`;
2. `@vento/os-context`;
3. `@vento/supabase`;
4. `@vento/ui-web`.

La cobertura de consumidores comprende siete repositorios:

1. `devVentoGroup/vento-shell`, como productor y consumidor de integración;
2. `devVentoGroup/vento-viso`;
3. `devVentoGroup/vento-nexo`;
4. `devVentoGroup/vento-fogo`;
5. `devVentoGroup/vento-origo`;
6. `devVentoGroup/vento-pulso`;
7. `devVentoGroup/vento-numera`.

La política cubre:

- versión exacta del paquete compartido;
- identidad del tag y release asociados;
- versión efectiva resuelta por `package-lock.json`;
- Next.js;
- React y React DOM;
- `@supabase/ssr`;
- `@supabase/supabase-js`;
- dependencias exactas entre paquetes VENTO;
- repositorio y commit consumidor;
- build, typecheck, lint y pruebas aplicables;
- pruebas contractuales, integración y comportamiento del consumidor;
- evidencia atribuible a una combinación concreta.

##### 2.2. Excluido

Esta tarea no:

- publica paquetes, tags o releases;
- modifica `package.json` o `package-lock.json` de ningún repositorio;
- crea workflows, secrets, registries, ramas o pull requests;
- define plazos de deprecación, materia reservada a `SHELL-PKG-005`;
- define ni ejecuta rollback por aplicación, materia reservada a `SHELL-PKG-006`;
- automatiza actualizaciones mediante PR, materia reservada a `SHELL-PKG-007`;
- crea gates que impidan actualizaciones sin pruebas, materia reservada a `SHELL-PKG-008`;
- implementa la matriz ejecutable de CI, materia reservada a `SHELL-CI-005`;
- migra consumidores, materia reservada a `SHELL-MIG-001..008`;
- modifica código, datos, migraciones, configuración o recursos de Supabase.

#### 3. Dependencias y entradas

| Entrada                                                           | Uso vinculante                                                                                                   |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| `SHELL-PKG-001 — Elegir mecanismo de distribución`                | paquetes npm privados, versiones exactas, lockfile, `npm ci`, adopción gradual y pruebas del consumidor          |
| `SHELL-PKG-002 — Definir versionado de paquetes compartidos`      | SemVer independiente, primera versión estable `1.0.0`, dependencias internas exactas y clasificación de rupturas |
| `SHELL-PKG-003 — Definir tags y releases`                         | relación unívoca entre familia, versión, tag, release, commit y evidencia                                        |
| inventario `SHELL-AUD-001..011`                                   | familias, consumidores, fronteras y ausencia de adopción remota confirmada                                       |
| `package.json` de los siete repositorios cubiertos                | declaraciones actuales de Next, React y Supabase                                                                 |
| `package-lock.json` de cada repositorio                           | versión efectiva que deberá usarse como verdad de resolución al certificar                                       |
| `packages/os-context/package.json`                                | estado transitorio `@vento/os-context@0.1.0`, `private: true` y peer actual de Supabase                          |
| `packages/os-context/README.md`                                   | responsabilidad del paquete y exclusión explícita de PASS                                                        |
| `T_CALIDAD_Y_DESPLIEGUE/01_PAQUETES_RELEASES_Y_COMPATIBILIDAD.md` | destino de la matriz ejecutable, pruebas, builds, releases y PR de consumidores                                  |
| `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`                | cobertura vigente de compatibilidad, rollback, evidencia y procedencia                                           |

#### 4. Inventario materializado

##### 4.1. Línea base verificable de repositorios

Las versiones siguientes son declaraciones de manifiesto. No equivalen por sí solas a la versión efectiva del lockfile ni a una certificación de compatibilidad.

| ID             | Repositorio                  | Rol                                   | Next.js declarado | React    | React DOM | `@supabase/ssr` | `@supabase/supabase-js` | Estado de paquetes VENTO compartidos                                                     |
| -------------- | ---------------------------- | ------------------------------------- | ----------------- | -------- | --------- | --------------- | ----------------------- | ---------------------------------------------------------------------------------------- |
| `COMP-REP-001` | `devVentoGroup/vento-shell`  | productor y consumidor de integración | `16.1.1`          | `19.2.3` | `19.2.3`  | `^0.8.0`        | `^2.90.1`               | existe workspace transitorio `@vento/os-context@0.1.0`; no hay release estable publicada |
| `COMP-REP-002` | `devVentoGroup/vento-viso`   | consumidor runtime                    | `^16.1.6`         | `19.2.3` | `19.2.3`  | `^0.8.0`        | `^2.90.1`               | adopción de paquetes publicados no confirmada                                            |
| `COMP-REP-003` | `devVentoGroup/vento-nexo`   | consumidor runtime                    | `^16.2.3`         | `19.2.3` | `19.2.3`  | `^0.8.0`        | `^2.90.1`               | adopción de paquetes publicados no confirmada                                            |
| `COMP-REP-004` | `devVentoGroup/vento-fogo`   | consumidor runtime                    | `^16.2.4`         | `19.2.3` | `19.2.3`  | `^0.8.0`        | `^2.90.1`               | adopción de paquetes publicados no confirmada                                            |
| `COMP-REP-005` | `devVentoGroup/vento-origo`  | consumidor runtime                    | `^16.2.1`         | `19.2.3` | `19.2.3`  | `^0.8.0`        | `^2.90.1`               | adopción de paquetes publicados no confirmada                                            |
| `COMP-REP-006` | `devVentoGroup/vento-pulso`  | consumidor runtime                    | `16.1.1`          | `19.2.3` | `19.2.3`  | `^0.8.0`        | `^2.90.1`               | adopción de paquetes publicados no confirmada                                            |
| `COMP-REP-007` | `devVentoGroup/vento-numera` | consumidor runtime                    | `^16.2.1`         | `19.2.3` | `19.2.3`  | `^0.8.0`        | `^2.90.1`               | adopción de paquetes publicados no confirmada                                            |

**Conciliación del inventario:** siete repositorios esperados, siete materializados, seis consumidores runtime separados, un productor y consumidor de integración, cero faltantes y cero duplicados.

##### 4.2. Bandas documentales elegibles del corte actual

Una banda elegible limita las combinaciones que pueden someterse a certificación. No declara compatibles automáticamente todas sus versiones.

| ID              | Dimensión           | Banda elegible inicial          | Semilla verificable actual                                      | Regla                                                                    |
| --------------- | ------------------- | ------------------------------- | --------------------------------------------------------------- | ------------------------------------------------------------------------ |
| `COMP-BAND-001` | Next.js, línea 16.1 | `>=16.1.1 <16.2.0`              | `16.1.1`; declaración `^16.1.6`                                 | cada versión efectiva debe quedar identificada desde lockfile y probarse |
| `COMP-BAND-002` | Next.js, línea 16.2 | `>=16.2.1 <16.3.0`              | declaraciones desde `^16.2.1` hasta `^16.2.4`                   | una línea posterior no hereda soporte automáticamente                    |
| `COMP-BAND-003` | React               | `>=19.2.3 <19.3.0`              | `19.2.3` en siete de siete repositorios                         | React y React DOM deben permanecer alineados                             |
| `COMP-BAND-004` | React DOM           | `>=19.2.3 <19.3.0`              | `19.2.3` en siete de siete repositorios                         | no se certifican versiones cruzadas de React y React DOM                 |
| `COMP-BAND-005` | Supabase SSR        | `>=0.8.0 <0.9.0`                | `^0.8.0` en siete de siete repositorios                         | solo aplica a exports o integraciones SSR                                |
| `COMP-BAND-006` | Supabase JavaScript | `>=2.90.0 <2.91.0`              | consumidores desde `^2.90.1`; peer transitorio desde `>=2.90.0` | el peer publicable no podrá exceder la banda realmente probada           |
| `COMP-BAND-007` | TypeScript          | serie `5.x`                     | `^5` en siete de siete repositorios                             | dimensión de compilación y tipos, no sustituto de pruebas runtime        |
| `COMP-BAND-008` | Tailwind CSS        | serie `4.x`                     | `^4` en siete de siete repositorios                             | aplica a `@vento/ui-web` y a su contrato CSS                             |
| `COMP-BAND-009` | Supabase CLI        | serie `2.109.x` en el productor | `^2.109.0` en `vento-shell`                                     | herramienta de generación y operación; no es peer runtime del consumidor |

##### 4.3. Contrato de compatibilidad por familia

| ID             | Familia             | Next.js                                                                     | React / React DOM                    | Supabase                                                                                  | Compatibilidad interna                    | Regla de certificación                                                                                                                              |
| -------------- | ------------------- | --------------------------------------------------------------------------- | ------------------------------------ | ----------------------------------------------------------------------------------------- | ----------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| `COMP-FAM-001` | `@vento/contracts`  | `NO_APLICA` como peer                                                       | `NO_APLICA` como peer                | `NO_APLICA` como peer, salvo tipos externos explícitos                                    | dependencias VENTO exactas cuando existan | debe compilar y conservar API, schemas, catálogos, diagnósticos y tipos en cada consumidor objetivo                                                 |
| `COMP-FAM-002` | `@vento/os-context` | no será peer del núcleo                                                     | no será peer del núcleo              | `@supabase/supabase-js >=2.90.0 <2.91.0` para la primera banda certificable               | dependencias VENTO exactas                | debe probar decisiones, razones, permisos, contexto efectivo y errores en cada consumidor; cualquier adapter de framework tendrá evidencia separada |
| `COMP-FAM-003` | `@vento/supabase`   | solo aplica a adapters SSR explícitos dentro de las bandas Next 16.1 y 16.2 | `NO_APLICA` al núcleo                | `@supabase/supabase-js >=2.90.0 <2.91.0`; `@supabase/ssr >=0.8.0 <0.9.0` para exports SSR | dependencias VENTO exactas                | debe probar factories, tipos generados, wrappers RPC, errores, SSR y compatibilidad con contratos de base de datos                                  |
| `COMP-FAM-004` | `@vento/ui-web`     | `>=16.1.1 <16.3.0` mientras existan pruebas separadas para 16.1 y 16.2      | React y React DOM `>=19.2.3 <19.3.0` | no será dependencia directa salvo contrato aprobado por una tarea propietaria             | dependencias VENTO exactas                | debe probar render, hidratación, navegación, estilos, tokens, accesibilidad, responsive y comportamiento en cada línea Next soportada               |

El peer actual `@supabase/supabase-js >=2.90.0` de `@vento/os-context@0.1.0` es metadata de un workspace transitorio. Antes de una primera release estable deberá limitarse a una banda respaldada por evidencia o ampliarse únicamente después de probar la banda adicional.

##### 4.4. Matriz materializada de combinaciones paquete–repositorio

| ID            | Paquete             | Repositorio    | Estado actual                                    | Condición de salida                                                             |
| ------------- | ------------------- | -------------- | ------------------------------------------------ | ------------------------------------------------------------------------------- |
| `COMP-MX-001` | `@vento/contracts`  | `vento-shell`  | `PENDIENTE_DE_EVIDENCIA`                         | package estable, lockfile, API snapshot, typecheck, build y pruebas atribuibles |
| `COMP-MX-002` | `@vento/contracts`  | `vento-viso`   | `PENDIENTE_DE_EVIDENCIA`                         | adopción exacta mediante cambio revisado y pruebas del consumidor               |
| `COMP-MX-003` | `@vento/contracts`  | `vento-nexo`   | `PENDIENTE_DE_EVIDENCIA`                         | adopción exacta mediante cambio revisado y pruebas del consumidor               |
| `COMP-MX-004` | `@vento/contracts`  | `vento-fogo`   | `PENDIENTE_DE_EVIDENCIA`                         | adopción exacta mediante cambio revisado y pruebas del consumidor               |
| `COMP-MX-005` | `@vento/contracts`  | `vento-origo`  | `PENDIENTE_DE_EVIDENCIA`                         | adopción exacta mediante cambio revisado y pruebas del consumidor               |
| `COMP-MX-006` | `@vento/contracts`  | `vento-pulso`  | `PENDIENTE_DE_EVIDENCIA`                         | adopción exacta mediante cambio revisado y pruebas del consumidor               |
| `COMP-MX-007` | `@vento/contracts`  | `vento-numera` | `PENDIENTE_DE_EVIDENCIA`                         | adopción exacta mediante cambio revisado y pruebas del consumidor               |
| `COMP-MX-008` | `@vento/os-context` | `vento-shell`  | `PENDIENTE_DE_EVIDENCIA — WORKSPACE_TRANSITORIO` | release estable, output construido, peer acotado y pruebas integrales           |
| `COMP-MX-009` | `@vento/os-context` | `vento-viso`   | `PENDIENTE_DE_EVIDENCIA — NO_ADOPTADO`           | versión exacta, lockfile y pruebas de contexto y autorización                   |
| `COMP-MX-010` | `@vento/os-context` | `vento-nexo`   | `PENDIENTE_DE_EVIDENCIA — NO_ADOPTADO`           | versión exacta, lockfile y pruebas de contexto y autorización                   |
| `COMP-MX-011` | `@vento/os-context` | `vento-fogo`   | `PENDIENTE_DE_EVIDENCIA — NO_ADOPTADO`           | versión exacta, lockfile y pruebas de contexto y autorización                   |
| `COMP-MX-012` | `@vento/os-context` | `vento-origo`  | `PENDIENTE_DE_EVIDENCIA — NO_ADOPTADO`           | versión exacta, lockfile y pruebas de contexto y autorización                   |
| `COMP-MX-013` | `@vento/os-context` | `vento-pulso`  | `PENDIENTE_DE_EVIDENCIA — NO_ADOPTADO`           | versión exacta, lockfile y pruebas de contexto y autorización                   |
| `COMP-MX-014` | `@vento/os-context` | `vento-numera` | `PENDIENTE_DE_EVIDENCIA — NO_ADOPTADO`           | versión exacta, lockfile y pruebas de contexto y autorización                   |
| `COMP-MX-015` | `@vento/supabase`   | `vento-shell`  | `PENDIENTE_DE_EVIDENCIA — NO_IMPLEMENTADO`       | package estable, tipos, factories, SSR y pruebas de integración                 |
| `COMP-MX-016` | `@vento/supabase`   | `vento-viso`   | `PENDIENTE_DE_EVIDENCIA — NO_ADOPTADO`           | versión exacta, lockfile, build y pruebas Supabase del consumidor               |
| `COMP-MX-017` | `@vento/supabase`   | `vento-nexo`   | `PENDIENTE_DE_EVIDENCIA — NO_ADOPTADO`           | versión exacta, lockfile, build y pruebas Supabase del consumidor               |
| `COMP-MX-018` | `@vento/supabase`   | `vento-fogo`   | `PENDIENTE_DE_EVIDENCIA — NO_ADOPTADO`           | versión exacta, lockfile, build y pruebas Supabase del consumidor               |
| `COMP-MX-019` | `@vento/supabase`   | `vento-origo`  | `PENDIENTE_DE_EVIDENCIA — NO_ADOPTADO`           | versión exacta, lockfile, build y pruebas Supabase del consumidor               |
| `COMP-MX-020` | `@vento/supabase`   | `vento-pulso`  | `PENDIENTE_DE_EVIDENCIA — NO_ADOPTADO`           | versión exacta, lockfile, build y pruebas Supabase del consumidor               |
| `COMP-MX-021` | `@vento/supabase`   | `vento-numera` | `PENDIENTE_DE_EVIDENCIA — NO_ADOPTADO`           | versión exacta, lockfile, build y pruebas Supabase del consumidor               |
| `COMP-MX-022` | `@vento/ui-web`     | `vento-shell`  | `PENDIENTE_DE_EVIDENCIA — NO_IMPLEMENTADO`       | package estable y pruebas Next 16.1, React, CSS y accesibilidad                 |
| `COMP-MX-023` | `@vento/ui-web`     | `vento-viso`   | `PENDIENTE_DE_EVIDENCIA — NO_ADOPTADO`           | versión exacta, lockfile y pruebas UI del consumidor                            |
| `COMP-MX-024` | `@vento/ui-web`     | `vento-nexo`   | `PENDIENTE_DE_EVIDENCIA — NO_ADOPTADO`           | versión exacta, lockfile y pruebas UI del consumidor                            |
| `COMP-MX-025` | `@vento/ui-web`     | `vento-fogo`   | `PENDIENTE_DE_EVIDENCIA — NO_ADOPTADO`           | versión exacta, lockfile y pruebas UI del consumidor                            |
| `COMP-MX-026` | `@vento/ui-web`     | `vento-origo`  | `PENDIENTE_DE_EVIDENCIA — NO_ADOPTADO`           | versión exacta, lockfile y pruebas UI del consumidor                            |
| `COMP-MX-027` | `@vento/ui-web`     | `vento-pulso`  | `PENDIENTE_DE_EVIDENCIA — NO_ADOPTADO`           | versión exacta, lockfile y pruebas UI del consumidor                            |
| `COMP-MX-028` | `@vento/ui-web`     | `vento-numera` | `PENDIENTE_DE_EVIDENCIA — NO_ADOPTADO`           | versión exacta, lockfile y pruebas UI del consumidor                            |

**Conciliación de matriz:** cuatro familias por siete repositorios producen veintiocho combinaciones; veintiocho están materializadas, veintiocho carecen todavía de certificación operativa, una posee workspace transitorio, veintisiete no poseen adopción física confirmada, cero faltantes y cero duplicados.

##### 4.5. Exclusiones explícitas del corte

| Identidad                                                     | Decisión                  | Motivo                                                                   | Destino si cambia                                                                    |
| ------------------------------------------------------------- | ------------------------- | ------------------------------------------------------------------------ | ------------------------------------------------------------------------------------ |
| `vento-pass` respecto de `@vento/os-context`                  | `NO_APLICA`               | el contrato vigente del paquete declara que PASS no lo consume           | una tarea propietaria deberá cambiar expresamente esa frontera antes de incorporarlo |
| `vento-anima`, `vento-vital`, `vento-talento` y `Vento-Group` | fuera de la matriz actual | no pertenecen al conjunto de siete repositorios aprobado para esta tarea | `SHELL-MIG-001` deberá incorporarlos solo si el inventario canónico confirma consumo |
| versiones Next posteriores a `16.2.x`                         | `NO_CERTIFICADAS`         | no existe evidencia del corte actual                                     | `SHELL-CI-005` deberá añadir una línea y evidencia antes de declararlas compatibles  |
| React o React DOM distintos de `19.2.x`                       | `NO_CERTIFICADOS`         | no existe evidencia del corte actual                                     | nueva matriz y pruebas de package y consumidores                                     |
| Supabase SSR fuera de `0.8.x`                                 | `NO_CERTIFICADO`          | no existe evidencia del corte actual                                     | nueva matriz y pruebas SSR                                                           |
| Supabase JavaScript fuera de `2.90.x`                         | `NO_CERTIFICADO`          | no existe evidencia del corte actual                                     | nueva matriz y pruebas de contratos, runtime y consumidores                          |

#### 5. Decisiones

##### 5.1. Unidad canónica de compatibilidad

La unidad mínima certificable será:

```text
package_name + package_version exacta
+ tag y release inmutables
+ consumer_repository + consumer_commit
+ package-lock.json exacto
+ versiones efectivas de framework y peers
+ evidencia de pruebas atribuible
```

No será válida una declaración genérica como “compatible con Next 16”, “compatible con React 19” o “compatible con Supabase 2”.

##### 5.2. Estados permitidos

| Estado                         | Significado                                                                                                  |
| ------------------------------ | ------------------------------------------------------------------------------------------------------------ |
| `PENDIENTE_DE_EVIDENCIA`       | la combinación está inventariada, pero no existe evidencia suficiente para certificarla                      |
| `ELEGIBLE_PARA_CERTIFICACION`  | versiones efectivas dentro de bandas documentales y precondiciones completas; pruebas aún no concluidas      |
| `COMPATIBLE_CERTIFICADO`       | todas las pruebas obligatorias de package y consumidor pasaron para la combinación exacta                    |
| `COMPATIBLE_CON_RESTRICCIONES` | evidencia aprobada con limitaciones explícitas de export, adapter, feature o entorno; no puede generalizarse |
| `INCOMPATIBLE_CONFIRMADO`      | una prueba verificable demuestra ruptura o comportamiento no soportado                                       |
| `FUERA_DE_BANDA`               | una versión efectiva está por fuera de las bandas aprobadas y no puede presentarse como soportada            |
| `NO_APLICA`                    | la dimensión o el consumidor no pertenece al contrato de esa familia                                         |

Un estado solo podrá cambiar cuando exista evidencia atribuible. La ausencia de fallos reportados no constituye evidencia de compatibilidad.

##### 5.3. Reglas vinculantes

| ID             | Decisión                                                                                                                                      |
| -------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| `PKG-COMP-001` | la compatibilidad se certifica por versión exacta de package y por repositorio consumidor, no por nombre de familia solamente                 |
| `PKG-COMP-002` | `peerDependencies` expresa elegibilidad de instalación, pero no prueba compatibilidad                                                         |
| `PKG-COMP-003` | la versión efectiva del lockfile prevalece sobre el rango textual del manifiesto al construir la evidencia                                    |
| `PKG-COMP-004` | una versión exacta del package será la única admitida en consumidores productivos                                                             |
| `PKG-COMP-005` | una nueva versión de Next, React, React DOM, Supabase SSR o Supabase JavaScript no hereda soporte automáticamente                             |
| `PKG-COMP-006` | una ampliación o reducción de peer range requiere clasificación SemVer y recertificación de las combinaciones afectadas                       |
| `PKG-COMP-007` | un `PATCH` del package exige regresión de package y consumidores afectados; no queda exento por ser compatible en SemVer                      |
| `PKG-COMP-008` | un `MINOR` exige regresión y pruebas de capacidades añadidas en cada consumidor que las adopte                                                |
| `PKG-COMP-009` | un `MAJOR` crea una línea de compatibilidad distinta y no invalida ni reescribe la evidencia histórica de la línea anterior                   |
| `PKG-COMP-010` | un prerelease solo podrá certificarse como prerelease y no reemplazará la banda estable de producción                                         |
| `PKG-COMP-011` | los paquetes VENTO dependerán entre sí mediante versiones exactas y deberán certificar el grafo resuelto completo                             |
| `PKG-COMP-012` | `@vento/contracts` permanecerá independiente de frameworks salvo que una API propietaria introduzca un peer explícito                         |
| `PKG-COMP-013` | el núcleo de `@vento/os-context` no dependerá de Next ni React; cualquier adapter tendrá export y evidencia separados                         |
| `PKG-COMP-014` | `@vento/supabase` separará compatibilidad del núcleo JavaScript y de sus exports SSR                                                          |
| `PKG-COMP-015` | `@vento/ui-web` deberá certificar por separado las líneas Next 16.1 y 16.2 dentro de la banda inicial                                         |
| `PKG-COMP-016` | React y React DOM deberán probarse como par alineado; una combinación cruzada será `FUERA_DE_BANDA`                                           |
| `PKG-COMP-017` | una prueba de package aislada no sustituye build, typecheck, lint y pruebas del consumidor                                                    |
| `PKG-COMP-018` | una prueba de un consumidor no autoriza a marcar compatibles los otros seis                                                                   |
| `PKG-COMP-019` | un build exitoso sin verificar comportamiento contractual, SSR, hidratación, autorización, datos o UI aplicables no completa la certificación |
| `PKG-COMP-020` | toda certificación conservará package, versión, consumer, commit, lockfile, entorno y evidencia como una sola unidad auditable                |
| `PKG-COMP-021` | una regresión confirmada cambia únicamente las combinaciones afectadas y no permite editar evidencia histórica                                |
| `PKG-COMP-022` | la política de deprecación no se infiere desde esta matriz y será definida exclusivamente por `SHELL-PKG-005`                                 |
| `PKG-COMP-023` | el rollback por aplicación no se ejecuta ni se define en esta tarea y permanece reservado a `SHELL-PKG-006`                                   |
| `PKG-COMP-024` | ninguna compatibilidad autorizada modifica consumidores sin un cambio revisable y pruebas previas                                             |

**Conciliación de decisiones:** veinticuatro decisiones esperadas, veinticuatro materializadas, veinticuatro identificadores únicos, cero faltantes y cero duplicados.

##### 5.4. Evidencia mínima por certificación

Cada instancia futura deberá contener:

| Campo                           | Obligación                                                     |
| ------------------------------- | -------------------------------------------------------------- |
| `package_name`                  | nombre exacto `@vento/*`                                       |
| `package_version`               | versión exacta e inmutable                                     |
| `package_tag`                   | tag canónico asociado                                          |
| `package_release`               | release canónico asociado                                      |
| `package_source_commit`         | commit productor                                               |
| `package_artifact_integrity`    | integridad del artefacto publicado                             |
| `consumer_repository`           | repositorio exacto                                             |
| `consumer_commit`               | commit que contiene la adopción                                |
| `consumer_lockfile_integrity`   | identidad íntegra del lockfile probado                         |
| `resolved_package_version`      | versión resuelta, igual a la solicitada                        |
| `resolved_next_version`         | versión efectiva o `NO_APLICA`                                 |
| `resolved_react_version`        | versión efectiva o `NO_APLICA`                                 |
| `resolved_react_dom_version`    | versión efectiva o `NO_APLICA`                                 |
| `resolved_supabase_ssr_version` | versión efectiva o `NO_APLICA`                                 |
| `resolved_supabase_js_version`  | versión efectiva o `NO_APLICA`                                 |
| `resolved_internal_vento_graph` | versiones exactas de dependencias VENTO                        |
| `build_result`                  | resultado atribuible al commit consumidor                      |
| `typecheck_result`              | resultado atribuible al commit consumidor                      |
| `lint_result`                   | resultado atribuible al commit consumidor                      |
| `package_test_result`           | pruebas propias de la familia                                  |
| `consumer_test_result`          | pruebas contractuales, integración y comportamiento aplicables |
| `compatibility_status`          | uno de los estados permitidos                                  |
| `restrictions`                  | limitaciones explícitas o `NONE`                               |
| `evidence_owner`                | tarea o workflow responsable                                   |

#### 6. Evidencia y cobertura

##### 6.1. Cobertura cuantitativa

| Métrica                                          |  Resultado |
| ------------------------------------------------ | ---------: |
| Familias de paquetes                             |      **4** |
| Repositorios cubiertos                           |      **7** |
| Consumidores runtime separados                   |      **6** |
| Productor y consumidor de integración            |      **1** |
| Combinaciones paquete–repositorio                |     **28** |
| Combinaciones materializadas                     |     **28** |
| Combinaciones certificadas actualmente           |      **0** |
| Workspaces transitorios identificados            |      **1** |
| Combinaciones sin adopción física confirmada     |     **27** |
| Líneas Next elegibles                            |      **2** |
| Repositorios con React `19.2.3`                  | **7 de 7** |
| Repositorios con React DOM `19.2.3`              | **7 de 7** |
| Repositorios con `@supabase/ssr ^0.8.0`          | **7 de 7** |
| Repositorios con `@supabase/supabase-js ^2.90.1` | **7 de 7** |
| Declaraciones Next en línea 16.1                 | **3 de 7** |
| Declaraciones Next en línea 16.2                 | **4 de 7** |
| Cambios físicos realizados                       |      **0** |
| Cambios `TREQ-*`                                 |      **0** |

##### 6.2. Pruebas exigibles por familia

| Familia             | Pruebas mínimas de package                                                   | Pruebas mínimas por consumidor                                                                                 |
| ------------------- | ---------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `@vento/contracts`  | API snapshot, schemas, catálogos, serialización, diagnósticos y tipos        | typecheck, build, compatibilidad de imports y contratos consumidos                                             |
| `@vento/os-context` | decisiones, precedencia, permisos, razones, errores y tipos                  | sesión, contexto efectivo, autorización, SSR aplicable y comportamiento operativo                              |
| `@vento/supabase`   | factories, tipos, RPC, errores, SSR y contratos de datos                     | build, autenticación, lectura, escritura autorizada, SSR y errores esperados sin alterar datos productivos     |
| `@vento/ui-web`     | render, hidratación, navegación, estilos, tokens, accesibilidad y responsive | build por línea Next, interacción, foco, teclado, contraste, motion-reduction y extensiones locales declaradas |

##### 6.3. Hallazgos y destinos exactos

| ID                    | Hallazgo                                                                                           | Estado                                            | Destino                                                                                                |
| --------------------- | -------------------------------------------------------------------------------------------------- | ------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `H-SHELL-PKG-004-001` | los siete repositorios comparten React y React DOM `19.2.3`                                        | `ALINEACION_DE_MANIFIESTO`                        | semilla de la matriz, no certificación automática                                                      |
| `H-SHELL-PKG-004-002` | los siete repositorios declaran las mismas líneas de Supabase SSR y JavaScript                     | `ALINEACION_DE_MANIFIESTO`                        | certificar versiones efectivas desde lockfiles en `SHELL-CI-005`                                       |
| `H-SHELL-PKG-004-003` | Next se divide entre líneas declaradas 16.1 y 16.2                                                 | `MATRIZ_MULTILINEA_OBLIGATORIA`                   | pruebas separadas de `@vento/ui-web` y adapters SSR                                                    |
| `H-SHELL-PKG-004-004` | cinco repositorios usan rangos Next con caret y dos usan versión exacta                            | `RESOLUCION_EFECTIVA_NO_DEDUCIBLE_DEL_MANIFIESTO` | lockfile obligatorio en cada evidencia                                                                 |
| `H-SHELL-PKG-004-005` | `eslint-config-next` permanece declarado en `16.1.1` aunque cuatro repositorios declaran Next 16.2 | `PENDIENTE_DE_EVIDENCIA`                          | comprobar lint y compatibilidad del toolchain en `SHELL-CI-005` antes de certificar esas combinaciones |
| `H-SHELL-PKG-004-006` | `@vento/os-context@0.1.0` es privado y exporta fuente TypeScript                                   | `NO_PUBLICABLE_COMO_ESTABLE`                      | build y contrato final en tareas propietarias y `SHELL-CI-002`                                         |
| `H-SHELL-PKG-004-007` | el peer actual `@supabase/supabase-js >=2.90.0` no tiene límite superior                           | `BANDA_NO_ACOTADA`                                | acotar antes de `1.0.0` o demostrar con matriz toda ampliación                                         |
| `H-SHELL-PKG-004-008` | no existen releases estables publicadas de las cuatro familias                                     | `PENDIENTE_DE_IMPLEMENTACION`                     | `SHELL-CI-003` después de gates aplicables                                                             |
| `H-SHELL-PKG-004-009` | no existe adopción publicada confirmada en los seis consumidores runtime                           | `PENDIENTE_DE_IMPLEMENTACION`                     | `SHELL-PKG-007`; `SHELL-MIG-001..008`                                                                  |
| `H-SHELL-PKG-004-010` | PASS está excluido expresamente de `@vento/os-context`                                             | `FRONTERA_CONFIRMADA`                             | conservar mientras una tarea propietaria no la modifique                                               |
| `H-SHELL-PKG-004-011` | no se declara una versión `engines.node` uniforme en los manifiestos inspeccionados                | `PENDIENTE_DE_EVIDENCIA`                          | capturar y certificar entorno de ejecución en `SHELL-CI-005`                                           |
| `H-SHELL-PKG-004-012` | la coincidencia de manifiestos no demuestra paridad funcional                                      | `RIESGO_CONTRACTUAL`                              | pruebas por package y consumidor en `SHELL-CI-001` y `SHELL-CI-005`                                    |

**Conciliación de hallazgos:** doce hallazgos, doce estados, doce destinos concretos y cero pendientes narrativos sin propietario.

#### 7. Requisitos de prueba

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

**Justificación:** la tarea materializa la política y la matriz documental que especializan obligaciones ya existentes de prueba, compatibilidad, rollback, evidencia por consumidor y procedencia. No introduce una nueva superficie runtime, un nuevo contrato ejecutable ni una operación física. La futura implementación deberá consumir los requisitos vigentes asociados a `TREQ-SHELL-006`, `TREQ-SHELL-007`, `TREQ-SHELL-008` y `TREQ-SHELL-009`, sin duplicarlos.

| Operación sobre `TREQ-*` | Cantidad |
| ------------------------ | -------: |
| creados                  |    **0** |
| modificados              |    **0** |
| diferidos                |    **0** |
| descartados              |    **0** |
| obsoletos                |    **0** |

No corresponde generar una copia de `04A`.

#### 8. Entregables

1. Política de compatibilidad por combinación exacta de package y consumidor.
2. Inventario de siete repositorios con Next, React, React DOM y Supabase declarados.
3. Bandas documentales elegibles para Next 16.1, Next 16.2, React 19.2, Supabase SSR 0.8 y Supabase JavaScript 2.90.
4. Contrato de compatibilidad para las cuatro familias de paquetes.
5. Matriz completa de veintiocho combinaciones paquete–repositorio.
6. Estados canónicos y transición basada en evidencia.
7. Registro mínimo exigible para cada certificación futura.
8. Reglas de recertificación ante cambios de package, framework, peer, lockfile o consumidor.
9. Hallazgos actuales con destino documental concreto.
10. Declaración de cero cambios `TREQ-*`.

#### 9. Criterios de aceptación

`SHELL-PKG-004` queda materialmente completa cuando:

- las cuatro familias canónicas aparecen una sola vez en el contrato de familia;
- los siete repositorios aparecen una sola vez en la línea base;
- las veintiocho combinaciones paquete–repositorio están materializadas;
- no existen combinaciones faltantes ni duplicadas;
- las bandas Next 16.1 y 16.2 están separadas;
- React y React DOM se tratan como par alineado;
- Supabase SSR y Supabase JavaScript se tratan como dimensiones distintas;
- el lockfile se define como fuente de la versión efectiva;
- `peerDependencies` no se presenta como prueba suficiente;
- cada certificación exige evidencia de package y consumidor;
- la matriz actual declara cero combinaciones certificadas sin inventar resultados;
- el workspace `@vento/os-context@0.1.0` se conserva como transitorio y no como release estable;
- PASS permanece fuera del contrato de `@vento/os-context`;
- deprecación, rollback, actualización mediante PR y gates automáticos permanecen en sus tareas propietarias;
- no se modifican paquetes, consumidores, CI, datos ni Supabase;
- se declaran cero cambios `TREQ-*` con justificación explícita.

#### 10. Riesgos y bloqueos

| Riesgo o bloqueo                                                            | Estado                                   | Control o condición de salida                        |
| --------------------------------------------------------------------------- | ---------------------------------------- | ---------------------------------------------------- |
| tratar un rango del manifiesto como versión efectiva                        | `BLOQUEADO_POR_POLITICA`                 | usar la resolución exacta del lockfile               |
| declarar compatible una familia por un solo consumidor                      | `BLOQUEADO_POR_POLITICA`                 | certificar cada combinación por separado             |
| ampliar automáticamente soporte a nuevos minors o majors                    | `BLOQUEADO_POR_POLITICA`                 | crear nueva línea y evidencia en la matriz           |
| publicar `@vento/os-context` con peer sin límite superior                   | `PENDIENTE_DE_CORRECCION_PREVIA_A_1.0.0` | acotar el peer o demostrar la banda completa         |
| certificar Next 16.2 sin comprobar el toolchain `eslint-config-next` actual | `PENDIENTE_DE_EVIDENCIA`                 | lint y build atribuibles por repositorio             |
| certificar paquetes que todavía no existen o no están publicados            | `PENDIENTE_DE_IMPLEMENTACION`            | build independiente y release estable aprobada       |
| certificar consumidores que aún no adoptaron la versión                     | `PENDIENTE_DE_IMPLEMENTACION`            | cambio revisado, lockfile y pruebas del consumidor   |
| asumir entorno Node uniforme sin `engines` verificable                      | `PENDIENTE_DE_EVIDENCIA`                 | declarar y probar el entorno en la matriz ejecutable |
| confundir compatibilidad con política de deprecación                        | `FUERA_DE_ALCANCE`                       | resolver exclusivamente en `SHELL-PKG-005`           |
| ejecutar rollback desde esta tarea                                          | `FUERA_DE_ALCANCE`                       | resolver exclusivamente en `SHELL-PKG-006`           |

#### 11. Continuidad

- **ÚLTIMA TAREA APROBADA:** SHELL-PKG-003 — Definir tags y releases
- **TAREA ACTUAL APROBADA:** SHELL-PKG-004 — Definir política de compatibilidad
- **SIGUIENTE TAREA RESERVADA:** SHELL-PKG-005 — Definir política de deprecación


### [ ] SHELL-PKG-005 — Definir política de deprecación
### [ ] SHELL-PKG-006 — Definir rollback por aplicación
### [ ] SHELL-PKG-007 — Definir actualizaciones mediante PR
### [ ] SHELL-PKG-008 — Evitar actualizaciones automáticas sin pruebas
Paquetes candidatos
