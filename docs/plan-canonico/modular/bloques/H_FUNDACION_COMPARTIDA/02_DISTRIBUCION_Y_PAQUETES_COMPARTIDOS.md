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

### [ ] SHELL-PKG-004 — Definir política de compatibilidad
### [ ] SHELL-PKG-005 — Definir política de deprecación
### [ ] SHELL-PKG-006 — Definir rollback por aplicación
### [ ] SHELL-PKG-007 — Definir actualizaciones mediante PR
### [ ] SHELL-PKG-008 — Evitar actualizaciones automáticas sin pruebas
Paquetes candidatos
