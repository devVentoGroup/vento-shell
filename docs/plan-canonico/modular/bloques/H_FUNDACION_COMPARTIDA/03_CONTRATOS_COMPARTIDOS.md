### MINI-BLOQUE — CONTRATOS COMPARTIDOS

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **contratos compartidos** dentro de **H FUNDACION COMPARTIDA**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `SHELL-CON-001` a `SHELL-CON-016` — 16 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Límites funcionales:** comienza con “Crear @vento/contracts” y concluye con “Crear contrato de propiedad funcional”.
<!-- PLAN-SECTION-META:END -->

### ✅ SHELL-CON-001 — Crear @vento/contracts

**Estado:** APROBADA
**Tarea anterior:** SHELL-PKG-008 — Evitar actualizaciones automáticas sin pruebas
**Tarea siguiente:** SHELL-CON-002 — Centralizar códigos de aplicaciones
**Tipo de tarea:** Documental
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Estado físico resultante:** `DEFINIDO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`SHELL-CON-001` define la raíz contractual única `@vento/contracts` dentro de la fundación compartida de Vento OS y fija su identidad, propiedad, fronteras, responsabilidades, modelo de publicación y relación con los contratos especializados que se desarrollarán en `SHELL-CON-002` a `SHELL-CON-016`.

La tarea resuelve la ausencia física detectada por `SHELL-AUD-009` sin confundir definición contractual con implementación física. En el estado actual, `@vento/contracts` todavía no existe como package materializado ni como release canónica publicada. Esta tarea deja cerrado qué deberá ser y qué no deberá ser cuando su implementación física quede habilitada por la instancia de paquete correspondiente.

La regla central es:

```text
VENTO-SHELL
→ fuente técnica propietaria de contratos compartidos

@vento/contracts
→ autoridad estática, versionada y consumible

aplicaciones consumidoras
→ importan contratos; no los redefinen
```

---

#### 2. Resultado canónico

Se establece `@vento/contracts` como el único package compartido de Vento OS destinado a contener contratos estáticos y artefactos derivados que deban ser idénticos entre repositorios.

Su responsabilidad canónica comprende:

1. catálogos contractuales versionados;
2. schemas declarativos;
3. códigos e identificadores canónicos;
4. tipos derivados de fuentes versionadas;
5. valores generados desde catálogos aprobados;
6. manifiestos y metadata contractual;
7. hashes e identidad de versiones;
8. diagnósticos contractuales estructurados;
9. contratos de interoperabilidad estáticos que no ejecuten lógica operacional ni efectos remotos.

La responsabilidad no comprende:

- evaluación runtime de autorización;
- resolución autoritativa de contexto;
- llamadas a Supabase;
- factories o clientes de datos;
- manejo de cookies o sesiones;
- redirecciones, SSO o guards;
- componentes visuales;
- lógica empresarial de una aplicación;
- secretos o credenciales;
- migraciones, RLS, RPC o persistencia.

Estas fronteras impiden convertir `@vento/contracts` en un package monolítico de runtime.

---

#### 3. Fuentes y precedencia

Esta tarea conserva las decisiones ya aprobadas en las siguientes fuentes:

| Fuente                                              | Uso vinculante                                                               |
| --------------------------------------------------- | ---------------------------------------------------------------------------- |
| `docs/plan-canonico/modular/01_PROTOCOLO.md`        | continuidad, límites de fase, requisitos de prueba y trazabilidad            |
| `docs/plan-canonico/modular/delivery-contract.json` | contrato físico del artefacto documental                                     |
| `docs/plan-canonico/modular/active-sequence.json`   | confirmación de BLOQUE H y continuidad desde `SHELL-PKG-008`                 |
| `01_AUDITORIA_DE_COMPONENTES_COMPARTIDOS.md`        | estado físico, identidades contractuales y disposición aprobada              |
| `02_DISTRIBUCION_Y_PAQUETES_COMPARTIDOS.md`         | distribución, SemVer, releases, compatibilidad, rollback y gates             |
| `03_CONTRATOS_COMPARTIDOS.md`                       | identidad y secuencia `SHELL-CON-001..016`                                   |
| `03_AUTORIZACION_Y_CONTEXTO_COMPARTIDOS.md`         | frontera entre `@vento/contracts`, `@vento/os-context` y Supabase            |
| `AUTH-CAT-017`                                      | identidad `@vento/contracts`, workspace objetivo y subpath `authorization`   |
| `AUTH-CAT-018`                                      | tipos derivados, subpaths versionados y regla fuente → generación            |
| `SHELL-AUD-009`                                     | 37 identidades contractuales y ausencia física de `@vento/contracts`         |
| `SHELL-AUD-010`                                     | disposición `COMPARTIR`, `GENERAR` o `MANTENER_LOCAL` y frontera de packages |
| `SHELL-AUD-011`                                     | conservación y retiro seguro de artefactos legacy                            |
| `package.json` de `vento-shell`                     | workspace npm `packages/*`                                                   |
| Registro Canónico de Requisitos de Prueba           | cobertura de implementación, compatibilidad, releases y evidencia            |

Precedencia aplicable:

```text
contrato normativo aprobado
→ disposición de auditoría
→ contrato de package compartido
→ contratos especializados SHELL-CON-002..016
→ infraestructura de CI y release
→ habilitación física por package_id
→ implementación y adopción
```

Una copia local, un tipo existente en un consumidor o un package transitorio no sustituye una fuente contractual aprobada.

---

#### 4. Línea base verificable

El estado previo a esta tarea es:

| Elemento                                             | Estado                                                   |
| ---------------------------------------------------- | -------------------------------------------------------- |
| workspace raíz `packages/*` en `vento-shell`         | existente                                                |
| `packages/os-context`                                | existente como package privado parcial y transitorio     |
| `packages/contracts`                                 | no materializado                                         |
| package lógico `@vento/contracts`                    | aprobado documentalmente, no publicado                   |
| subpath `@vento/contracts/authorization`             | reservado y definido por `AUTH-CAT-017` / `AUTH-CAT-018` |
| release estable de `@vento/contracts`                | no confirmada                                            |
| tag canónico de `@vento/contracts`                   | no confirmado                                            |
| consumidor runtime certificado de `@vento/contracts` | no existe mientras el package no esté materializado      |
| autorización física de los expedientes E5            | 0 de 207 en el cierre global de `E5-GATE-008`            |

La ausencia física de `packages/contracts` es coherente con el estado documental vigente y no autoriza a crear una implementación parcial fuera del ciclo de paquete.

---

#### 5. Identidad y propiedad del package

La identidad canónica queda fijada así:

| Propiedad                       | Decisión                                                            |
| ------------------------------- | ------------------------------------------------------------------- |
| nombre lógico                   | `@vento/contracts`                                                  |
| repositorio propietario         | `devVentoGroup/vento-shell`                                         |
| workspace propietario           | `packages/*`                                                        |
| directorio objetivo ya aprobado | `packages/contracts`                                                |
| naturaleza                      | package npm privado de contratos compartidos                        |
| mecanismo de distribución       | registry privado compatible con npm                                 |
| versión                         | SemVer independiente de los demás packages                          |
| primera versión estable         | `1.0.0`, únicamente después de validación y publicación autorizadas |
| consumo entre packages VENTO    | versiones exactas                                                   |
| procedencia                     | package, versión, commit y artefacto verificables                   |
| inmutabilidad                   | una versión publicada no se modifica en sitio                       |

La versión raíz `0.1.0` de `vento-shell` no constituye ni condiciona la versión de `@vento/contracts`.

La existencia de un workspace local tampoco constituye una publicación ni una adopción por consumidores externos.

---

#### 6. Fronteras con los demás packages compartidos

La separación aprobada es obligatoria:

| Package o plataforma | Responsabilidad                                                                                     |
| -------------------- | --------------------------------------------------------------------------------------------------- |
| `@vento/contracts`   | catálogos, schemas, códigos, tipos derivados, manifiestos, hashes y diagnósticos estáticos          |
| `@vento/os-context`  | guards, adapters, contexto, autorización, SSO, firma, scopes por solicitud y compatibilidad runtime |
| `@vento/supabase`    | factories, tipos de datos generados, wrappers RPC y errores de acceso a datos                       |
| `@vento/ui-web`      | componentes, AppShell, navegación, marca, accesibilidad y contrato CSS compartidos                  |
| Supabase             | resolución autoritativa, datos operativos, funciones, políticas y persistencia                      |
| aplicaciones         | composición de procesos y lógica empresarial propia usando contratos importados                     |

Reglas:

1. `@vento/contracts` no evalúa permisos ni determina por sí mismo si una operación está autorizada.
2. `@vento/contracts` no consulta Supabase ni otra red.
3. `@vento/contracts` no administra estado de sesión, cookies o cache de contexto.
4. `@vento/contracts` no expone secretos, credenciales ni configuración sensible.
5. `@vento/os-context` no se convierte en fuente paralela de catálogos, códigos o schemas ya gobernados por `@vento/contracts`.
6. `@vento/supabase` no redefine identidades contractuales estáticas.
7. `@vento/ui-web` consume identidades y contratos; no los convierte en una fuente alternativa.
8. ningún repositorio consumidor mantiene una copia modificada de una fuente ya publicada por `@vento/contracts`.

No se crea un package paralelo `@vento/auth` ni `@vento/operational-context` para absorber responsabilidades ya asignadas.

---

#### 7. Modelo interno de autoridad

`@vento/contracts` deberá distinguir tres capas conceptuales:

##### 7.1. Fuentes contractuales

Artefactos declarativos aprobados que representan identidad y reglas estáticas. Son la base de la generación y validación.

##### 7.2. Artefactos derivados

Tipos, valores, índices o metadata generados determinísticamente desde las fuentes contractuales. No constituyen una segunda fuente de verdad y no se editan manualmente para cambiar significado.

##### 7.3. Metadatos de publicación

Manifiestos, versión, hashes, compatibilidad y diagnósticos necesarios para demostrar qué contrato fue publicado y consumido.

La relación es:

```text
FUENTE CONTRACTUAL VERSIONADA
+
SCHEMA VERSIONADO
→ VALIDACIÓN
→ ARTEFACTOS DERIVADOS
→ MANIFIESTO E INTEGRIDAD
→ PUBLICACIÓN INMUTABLE
```

Una salida generada que contradiga su fuente invalida el artefacto y no puede corregirse manualmente como mecanismo ordinario.

---

#### 8. Estructura física objetivo ya autorizada documentalmente

La raíz física objetivo aprobada previamente es:

```text
packages/contracts/
├── package.json
├── README.md
└── authorization/
```

El módulo `authorization` podrá contener la estructura versionada definida por `AUTH-CAT-017` y `AUTH-CAT-018`, incluyendo catálogo, schemas, changelog, salidas generadas y scripts de validación.

Esta tarea no inventa directorios para los contratos restantes. Los módulos o subpaths adicionales se materializarán únicamente cuando su tarea propietaria `SHELL-CON-002` a `SHELL-CON-016` cierre identidad, contenido y frontera pública.

La estructura final deberá permitir que cada contrato especializado evolucione sin convertir rutas internas no aprobadas en API pública accidental.

---

#### 9. Superficie pública

El único subpath público cuyo nombre ya está fijado antes de esta tarea es:

```text
@vento/contracts/authorization
```

También permanecen aprobadas las variantes versionadas de autorización definidas por `AUTH-CAT-018` para consumo de versión actual, versión contractual fijada y schema fijado.

Reglas para la superficie pública:

1. un módulo no se considera público por existir físicamente;
2. un consumidor no podrá depender de archivos internos sin contrato público aprobado;
3. cada subpath público deberá tener propietario documental;
4. un cambio incompatible de una superficie pública deberá seguir la política SemVer aprobada;
5. retirar una superficie pública deberá cumplir deprecación, inventario de consumidores, compatibilidad y rollback;
6. no se declaran en esta tarea nombres de subpaths correspondientes a `SHELL-CON-002..016` que todavía no hayan sido aprobados por su tarea propietaria.

La API raíz de `@vento/contracts` no se utiliza para anticipar o fusionar contratos todavía no definidos.

---

#### 10. Contrato específico de autorización heredado

`AUTH-CAT-017` y `AUTH-CAT-018` ya reservan dentro de `@vento/contracts/authorization`:

- catálogo versionado;
- JSON Schema versionado;
- manifiestos;
- aplicaciones;
- permisos;
- aliases;
- permisos legacy;
- permisos retirados;
- contratos de recurso;
- checksums;
- changelog;
- tipos TypeScript derivados;
- valores derivados;
- metadata de versión y hash;
- diagnósticos contractuales.

Invariantes heredados:

1. el catálogo es la fuente y los tipos son derivados;
2. una versión publicada es inmutable;
3. `schema_version` y `catalog_version` son conceptos separados;
4. `PermissionKey` representa únicamente claves activas publicadas;
5. aliases, legacy y retirados permanecen separados;
6. los contratos de recurso son declarativos y no contienen SQL o JavaScript arbitrario;
7. las aplicaciones consumidoras no copian ni redefinen el catálogo;
8. Supabase puede conservar una proyección, pero no redefinir el significado contractual.

`SHELL-CON-001` adopta estas decisiones como primer módulo confirmado del package y no las reabre.

---

#### 11. Reglas de pureza y seguridad contractual

El package deberá permanecer apto para consumo compartido sin adquirir autoridad operacional propia.

Por tanto:

- no contendrá secretos;
- no contendrá credenciales de registry, Supabase ni integraciones;
- no dependerá de variables de entorno para determinar el significado de un contrato;
- no realizará llamadas de red para obtener la definición contractual vigente durante runtime ordinario;
- no ejecutará SQL, RPC, mutaciones ni efectos de infraestructura;
- no incorporará datos personales u operativos como parte de sus catálogos estáticos;
- no utilizará `eval` ni serializará código ejecutable dentro de contratos declarativos;
- no convertirá labels, rutas, roles o estados visuales en autoridad de seguridad;
- no aceptará que una copia local modificada prevalezca sobre una versión publicada.

Los validadores y generadores podrán ejecutar lógica de build o CI, pero su resultado deberá ser determinista respecto de las fuentes versionadas y no introducir significado por heurística.

---

#### 12. Versionado, publicación y distribución

`@vento/contracts` hereda íntegramente las decisiones de `SHELL-PKG-001..008`:

1. distribución ordinaria mediante registry privado compatible con npm;
2. autoría e integración local mediante npm workspaces en `vento-shell`;
3. versión SemVer propia, independiente de `@vento/os-context`, `@vento/supabase` y `@vento/ui-web`;
4. primera release estable `1.0.0` cuando el package sea publicable;
5. prereleases permitidas antes de una estable según la política aprobada;
6. versiones publicadas inmutables;
7. dependencias internas VENTO fijadas a versiones exactas;
8. cambio de tipos o outputs generados clasificado por impacto contractual;
9. tag, release, commit, tarball e integridad correlacionados;
10. actualizaciones de consumidores mediante pull request;
11. ausencia de auto-merge y auto-deploy;
12. pruebas propias y matriz de compatibilidad antes de publicación o adopción.

Una aprobación documental de `SHELL-CON-001` no equivale a publicar `1.0.0`, crear un tag, configurar el registry ni instalar el package en consumidores.

---

#### 13. Distribución de responsabilidades en SHELL-CON-002..016

`SHELL-CON-001` crea la raíz contractual; las identidades y contenidos especializados permanecen en sus tareas propietarias:

| Tarea           | Responsabilidad reservada                      |
| --------------- | ---------------------------------------------- |
| `SHELL-CON-002` | centralizar códigos de aplicaciones            |
| `SHELL-CON-003` | centralizar códigos de permisos                |
| `SHELL-CON-004` | centralizar roles base                         |
| `SHELL-CON-005` | centralizar roles operativos                   |
| `SHELL-CON-006` | centralizar scopes                             |
| `SHELL-CON-007` | centralizar tipos de contexto                  |
| `SHELL-CON-008` | centralizar códigos de error                   |
| `SHELL-CON-009` | centralizar identificadores de procesos        |
| `SHELL-CON-010` | centralizar estados de procesos                |
| `SHELL-CON-011` | centralizar identificadores de pantallas       |
| `SHELL-CON-012` | crear contrato de acciones funcionales         |
| `SHELL-CON-013` | crear contrato de eventos empresariales        |
| `SHELL-CON-014` | crear contrato de traspasos entre aplicaciones |
| `SHELL-CON-015` | crear contrato de tareas pendientes            |
| `SHELL-CON-016` | crear contrato de propiedad funcional          |

Esta tarea no adelanta listas, enums, archivos, schemas ni subpaths concretos reservados a esas tareas.

---

#### 14. Relación con generación y acceso a datos

La auditoría aprobó que determinados contratos se generen desde fuentes versionadas en lugar de escribirse manualmente. `SHELL-CON-001` establece la raíz de consumo estático, pero no absorbe los generadores propietarios de datos.

Reglas:

1. tipos derivados de catálogos contractuales pertenecen a la superficie contractual correspondiente;
2. tipos `Database` y contratos directamente derivados del esquema Supabase se coordinan con `SHELL-DB-002` y el package `@vento/supabase`;
3. inputs y outputs RPC se coordinan con `SHELL-DB-003` y adapters runtime;
4. `@vento/contracts` puede transportar identidades o schemas estáticos necesarios para validar interoperabilidad, pero no sustituye el package de acceso a datos;
5. ningún cast manual en un consumidor se convierte en contrato canónico por existir previamente.

---

#### 15. Estado de materialización física

El cierre global de `E5-GATE-008` mantiene los 207 expedientes sin autorización para implementación física. En consecuencia:

```text
SHELL-CON-001
→ definición contractual completa
→ sin creación física del package
→ sin publicación
→ sin adopción
```

La materialización física de `packages/contracts`, la configuración de publicación y la adopción por consumidores solo podrán ocurrir dentro del ciclo de implementación que haya superado la instancia aplicable `E5-GATE-008::<package_id>` y las puertas de CI correspondientes.

Esta tarea no cambia el estado de ningún `package_id`, no convierte un expediente bloqueado en autorizado y no ejecuta `SHELL-CI-020`.

---

#### 16. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea fija identidad, propiedad y fronteras documentales del package pero no introduce comportamiento ejecutable ni materializa el package. La futura implementación ya está cubierta por requisitos vigentes del dominio SHELL para clasificación de responsabilidades compartidas, pruebas propias, compatibilidad entre consumidores, trazabilidad de requisitos por package y PR, identidad inmutable de releases y coherencia de cortes coordinados. No se identifica una regla ejecutable independiente que requiera un nuevo requisito de prueba en esta tarea documental.

| Operación sobre `TREQ-*` | Cantidad |
| ------------------------ | -------: |
| creados                  |    **0** |
| modificados              |    **0** |
| diferidos                |    **0** |
| descartados              |    **0** |
| obsoletos                |    **0** |

---

#### 17. Decisiones vinculantes

1. existe una única raíz contractual compartida denominada `@vento/contracts`;
2. su repositorio propietario es `devVentoGroup/vento-shell`;
3. su directorio objetivo ya aprobado es `packages/contracts` dentro del workspace `packages/*`;
4. `@vento/contracts` contiene autoridad estática y no autoridad operacional;
5. `@vento/contracts/authorization` es el primer subpath público ya aprobado;
6. no se inventan subpaths para `SHELL-CON-002..016` antes de sus tareas propietarias;
7. los tipos derivados no son una segunda fuente de verdad;
8. catálogos, schemas, valores generados, manifiestos, hashes y diagnósticos deberán ser reproducibles y versionados;
9. `@vento/os-context` conserva ejecución de contexto y autorización;
10. `@vento/supabase` conserva acceso compartido a datos y contratos derivados del esquema;
11. `@vento/ui-web` conserva componentes y contratos visuales;
12. Supabase conserva resolución y persistencia autoritativas;
13. no se crean packages paralelos para duplicar responsabilidades;
14. el package se versiona de manera independiente;
15. una versión publicada es inmutable;
16. consumidores utilizan versiones exactas y no copias locales modificadas;
17. publicación y adopción deberán superar pruebas y compatibilidad;
18. esta tarea no crea físicamente `packages/contracts` ni publica `@vento/contracts`;
19. esta tarea no altera ningún expediente E5 ni habilitación física;
20. la siguiente responsabilidad documental permanece en `SHELL-CON-002`.

---

#### 18. Hallazgos y destinos exactos

| Hallazgo                                                                                                                 | Estado                            | Destino                                                                                                        |
| ------------------------------------------------------------------------------------------------------------------------ | --------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `@vento/contracts` no existe físicamente                                                                                 | esperado en el estado actual      | materialización únicamente dentro del ciclo físico autorizado por `E5-GATE-008::<package_id>` y `SHELL-CI-020` |
| `@vento/contracts/authorization` ya posee contrato normativo                                                             | aprobado                          | conservar en `AUTH-CAT-017`, `AUTH-CAT-018` y su implementación posterior                                      |
| códigos de aplicaciones todavía divergen entre consumidores                                                              | pendiente de la secuencia vigente | `SHELL-CON-002`                                                                                                |
| códigos de permisos requieren fuente única y tipos derivados                                                             | pendiente de la secuencia vigente | `SHELL-CON-003`; `AUTH-CAT-018`; `AUTH-CAT-019`                                                                |
| roles y scopes permanecen separados por responsabilidad                                                                  | pendiente de la secuencia vigente | `SHELL-CON-004` a `SHELL-CON-006`                                                                              |
| contexto, errores, procesos, pantallas, acciones, eventos, traspasos, pendientes y ownership requieren contratos propios | pendiente de la secuencia vigente | `SHELL-CON-007` a `SHELL-CON-016`                                                                              |
| `@vento/os-context` existe como implementación parcial transitoria                                                       | conservado, no sustituto          | `SHELL-AUTH-001`; `SHELL-CTX-001`                                                                              |
| outputs derivados de Supabase requieren generación propietaria                                                           | pendiente de implementación       | `SHELL-DB-002`; `SHELL-DB-003`                                                                                 |

Todos los elementos tienen propietario documental identificado y ninguno exige crear un identificador de tarea nuevo.

---

#### 19. Criterios de aceptación

`SHELL-CON-001` queda materialmente completa porque:

- fija una única identidad `@vento/contracts`;
- fija `vento-shell` como repositorio propietario;
- conserva `packages/contracts` como directorio objetivo ya aprobado;
- define la responsabilidad de autoridad estática compartida;
- separa contratos de ejecución, acceso a datos y UI;
- adopta `@vento/contracts/authorization` sin reabrir `AUTH-CAT-017` ni `AUTH-CAT-018`;
- evita anticipar subpaths o contenido de `SHELL-CON-002..016`;
- conserva la derivación determinista de tipos y valores desde fuentes versionadas;
- conserva SemVer independiente, inmutabilidad, integridad y procedencia;
- conserva registry privado, versiones exactas, PRs y gates de pruebas aprobados por `SHELL-PKG-001..008`;
- impide convertir copias locales o packages transitorios en fuentes canónicas paralelas;
- mantiene `@vento/os-context`, `@vento/supabase` y `@vento/ui-web` con responsabilidades independientes;
- no crea código, package, tag, release, registry, secreto, consumidor, migración ni cambio Supabase;
- no modifica el estado físico de los 207 expedientes E5;
- reutiliza requisitos de prueba vigentes sin crear ni modificar `TREQ-*`;
- deja `SHELL-CON-002` como única continuidad reservada.

---

#### 20. Continuidad

- **ÚLTIMA TAREA APROBADA:** SHELL-PKG-008 — Evitar actualizaciones automáticas sin pruebas
- **TAREA ACTUAL APROBADA:** SHELL-CON-001 — Crear @vento/contracts
- **SIGUIENTE TAREA RESERVADA:** SHELL-CON-002 — Centralizar códigos de aplicaciones


### [ ] SHELL-CON-002 — Centralizar códigos de aplicaciones
### [ ] SHELL-CON-003 — Centralizar códigos de permisos
### [ ] SHELL-CON-004 — Centralizar roles base
### [ ] SHELL-CON-005 — Centralizar roles operativos
### [ ] SHELL-CON-006 — Centralizar scopes
### [ ] SHELL-CON-007 — Centralizar tipos de contexto
### [ ] SHELL-CON-008 — Centralizar códigos de error

### [ ] SHELL-CON-009 — Centralizar identificadores de procesos
### [ ] SHELL-CON-010 — Centralizar estados de procesos
### [ ] SHELL-CON-011 — Centralizar identificadores de pantallas
### [ ] SHELL-CON-012 — Crear contrato de acciones funcionales
### [ ] SHELL-CON-013 — Crear contrato de eventos empresariales
### [ ] SHELL-CON-014 — Crear contrato de traspasos entre aplicaciones
### [ ] SHELL-CON-015 — Crear contrato de tareas pendientes
### [ ] SHELL-CON-016 — Crear contrato de propiedad funcional
